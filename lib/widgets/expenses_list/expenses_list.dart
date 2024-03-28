import 'package:flutter/material.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList ({
    super.key, 
    required this.expenses,
    required this.onRemoveExpense,
  });


  final void Function (Expense expense) onRemoveExpense;

  final List<Expense> expenses;
  // final void Function (Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length, 
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.5),
          margin: Theme.of(context).cardTheme.margin
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction){
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}