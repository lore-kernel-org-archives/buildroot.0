From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 28 Jun 2007 04:54:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/config
Message-ID: <20070628115400.19647A4596@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-28 04:53:59 -0700 (Thu, 28 Jun 2007)
New Revision: 18958

Log:
- make it compile with a C89 compiler


Added:
   trunk/buildroot/package/config/foo.h

Modified:
   trunk/buildroot/package/config/Makefile
   trunk/buildroot/package/config/README.buildroot2
   trunk/buildroot/package/config/conf.c
   trunk/buildroot/package/config/confdata.c
   trunk/buildroot/package/config/expr.c
   trunk/buildroot/package/config/expr.h
   trunk/buildroot/package/config/kconfig-to-buildroot2.patch


Changeset:
Modified: trunk/buildroot/package/config/Makefile
===================================================================
--- trunk/buildroot/package/config/Makefile	2007-06-28 10:47:05 UTC (rev 18957)
+++ trunk/buildroot/package/config/Makefile	2007-06-28 11:53:59 UTC (rev 18958)
@@ -5,7 +5,7 @@
 srctree := .
 
 include Makefile.kconfig
-
+HOSTCFLAGS+=-Dinline="" -include foo.h
 -include .depend
 .depend: $(wildcard *.h *.c)
 	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) -MM *.c > .depend 2>/dev/null || :

Modified: trunk/buildroot/package/config/README.buildroot2
===================================================================
--- trunk/buildroot/package/config/README.buildroot2	2007-06-28 10:47:05 UTC (rev 18957)
+++ trunk/buildroot/package/config/README.buildroot2	2007-06-28 11:53:59 UTC (rev 18958)
@@ -7,6 +7,8 @@
 	mv Makefile Makefile.kconfig
 	patch -p1 < ../config/kconfig-to-buildroot.patch
 	cp ../config/README.buildroot2 .
+	cp ../config/foo.h .
+	cp ../config/Makefile .
 	cd ..
 	rm -rf config
 	mv config.new config

Modified: trunk/buildroot/package/config/conf.c
===================================================================
--- trunk/buildroot/package/config/conf.c	2007-06-28 10:47:05 UTC (rev 18957)
+++ trunk/buildroot/package/config/conf.c	2007-06-28 11:53:59 UTC (rev 18958)
@@ -542,7 +542,7 @@
 		exit(1);
 	}
 	conf_parse(name);
-	//zconfdump(stdout);
+	/*zconfdump(stdout);*/
 	switch (input_mode) {
 	case set_default:
 		if (!defconfig_file)

Modified: trunk/buildroot/package/config/confdata.c
===================================================================
--- trunk/buildroot/package/config/confdata.c	2007-06-28 10:47:05 UTC (rev 18957)
+++ trunk/buildroot/package/config/confdata.c	2007-06-28 11:53:59 UTC (rev 18958)
@@ -183,7 +183,7 @@
 				;
 			}
 			break;
-		case 'A' ... 'Z':
+		case 'A': case 'B': case 'C': case 'D': case 'E': case 'F': case 'G': case 'H': case 'I': case 'J': case 'K': case 'L': case 'M': case 'N': case 'O': case 'P': case 'Q': case 'R': case 'S': case 'T': case 'U': case 'V': case 'W': case 'X': case 'Y': case 'Z':
 			p = strchr(line, '=');
 			if (!p)
 				continue;

Modified: trunk/buildroot/package/config/expr.c
===================================================================
--- trunk/buildroot/package/config/expr.c	2007-06-28 10:47:05 UTC (rev 18957)
+++ trunk/buildroot/package/config/expr.c	2007-06-28 11:53:59 UTC (rev 18958)
@@ -331,7 +331,7 @@
 		e->right.expr = expr_trans_bool(e->right.expr);
 		break;
 	case E_UNEQUAL:
-		// FOO!=n -> FOO
+		/* FOO!=n -> FOO */
 		if (e->left.sym->type == S_TRISTATE) {
 			if (e->right.sym == &symbol_no) {
 				e->type = E_SYMBOL;
@@ -380,19 +380,19 @@
 		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
 		    ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_mod) ||
 		     (e1->right.sym == &symbol_mod && e2->right.sym == &symbol_yes))) {
-			// (a='y') || (a='m') -> (a!='n')
+			/* (a='y') || (a='m') -> (a!='n') */
 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_no);
 		}
 		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
 		    ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_no) ||
 		     (e1->right.sym == &symbol_no && e2->right.sym == &symbol_yes))) {
-			// (a='y') || (a='n') -> (a!='m')
+			/* (a='y') || (a='n') -> (a!='m') */
 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_mod);
 		}
 		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
 		    ((e1->right.sym == &symbol_mod && e2->right.sym == &symbol_no) ||
 		     (e1->right.sym == &symbol_no && e2->right.sym == &symbol_mod))) {
-			// (a='m') || (a='n') -> (a!='y')
+			/* (a='m') || (a='n') -> (a!='y') */
 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_yes);
 		}
 	}
@@ -443,29 +443,29 @@
 
 	if ((e1->type == E_SYMBOL && e2->type == E_EQUAL && e2->right.sym == &symbol_yes) ||
 	    (e2->type == E_SYMBOL && e1->type == E_EQUAL && e1->right.sym == &symbol_yes))
-		// (a) && (a='y') -> (a='y')
+		/* (a) && (a='y') -> (a='y') */
 		return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
 
 	if ((e1->type == E_SYMBOL && e2->type == E_UNEQUAL && e2->right.sym == &symbol_no) ||
 	    (e2->type == E_SYMBOL && e1->type == E_UNEQUAL && e1->right.sym == &symbol_no))
-		// (a) && (a!='n') -> (a)
+		/* (a) && (a!='n') -> (a) */
 		return expr_alloc_symbol(sym1);
 
 	if ((e1->type == E_SYMBOL && e2->type == E_UNEQUAL && e2->right.sym == &symbol_mod) ||
 	    (e2->type == E_SYMBOL && e1->type == E_UNEQUAL && e1->right.sym == &symbol_mod))
-		// (a) && (a!='m') -> (a='y')
+		/* (a) && (a!='m') -> (a='y') */
 		return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
 
 	if (sym1->type == S_TRISTATE) {
 		if (e1->type == E_EQUAL && e2->type == E_UNEQUAL) {
-			// (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b'
+			/* (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b' */
 			sym2 = e1->right.sym;
 			if ((e2->right.sym->flags & SYMBOL_CONST) && (sym2->flags & SYMBOL_CONST))
 				return sym2 != e2->right.sym ? expr_alloc_comp(E_EQUAL, sym1, sym2)
 							     : expr_alloc_symbol(&symbol_no);
 		}
 		if (e1->type == E_UNEQUAL && e2->type == E_EQUAL) {
-			// (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b'
+			/* (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b' */
 			sym2 = e2->right.sym;
 			if ((e1->right.sym->flags & SYMBOL_CONST) && (sym2->flags & SYMBOL_CONST))
 				return sym2 != e1->right.sym ? expr_alloc_comp(E_EQUAL, sym1, sym2)
@@ -474,19 +474,19 @@
 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
 			   ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_no) ||
 			    (e1->right.sym == &symbol_no && e2->right.sym == &symbol_yes)))
-			// (a!='y') && (a!='n') -> (a='m')
+			/* (a!='y') && (a!='n') -> (a='m') */
 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_mod);
 
 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
 			   ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_mod) ||
 			    (e1->right.sym == &symbol_mod && e2->right.sym == &symbol_yes)))
-			// (a!='y') && (a!='m') -> (a='n')
+			/* (a!='y') && (a!='m') -> (a='n') */
 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_no);
 
 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
 			   ((e1->right.sym == &symbol_mod && e2->right.sym == &symbol_no) ||
 			    (e1->right.sym == &symbol_no && e2->right.sym == &symbol_mod)))
-			// (a!='m') && (a!='n') -> (a='m')
+			/* (a!='m') && (a!='n') -> (a='m') */
 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
 
 		if ((e1->type == E_SYMBOL && e2->type == E_EQUAL && e2->right.sym == &symbol_mod) ||
@@ -579,7 +579,7 @@
 	switch (e1->type) {
 	case E_OR:
 		expr_eliminate_dups2(e1->type, &e1, &e1);
-		// (FOO || BAR) && (!FOO && !BAR) -> n
+		/* (FOO || BAR) && (!FOO && !BAR) -> n */
 		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
 		tmp2 = expr_copy(e2);
 		tmp = expr_extract_eq_and(&tmp1, &tmp2);
@@ -594,7 +594,7 @@
 		break;
 	case E_AND:
 		expr_eliminate_dups2(e1->type, &e1, &e1);
-		// (FOO && BAR) || (!FOO || !BAR) -> y
+		/* (FOO && BAR) || (!FOO || !BAR) -> y */
 		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
 		tmp2 = expr_copy(e2);
 		tmp = expr_extract_eq_or(&tmp1, &tmp2);
@@ -703,7 +703,7 @@
 	case E_NOT:
 		switch (e->left.expr->type) {
 		case E_NOT:
-			// !!a -> a
+			/* !!a -> a */
 			tmp = e->left.expr->left.expr;
 			free(e->left.expr);
 			free(e);
@@ -712,14 +712,14 @@
 			break;
 		case E_EQUAL:
 		case E_UNEQUAL:
-			// !a='x' -> a!='x'
+			/* !a='x' -> a!='x' */
 			tmp = e->left.expr;
 			free(e);
 			e = tmp;
 			e->type = e->type == E_EQUAL ? E_UNEQUAL : E_EQUAL;
 			break;
 		case E_OR:
-			// !(a || b) -> !a && !b
+			/* !(a || b) -> !a && !b */
 			tmp = e->left.expr;
 			e->type = E_AND;
 			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
@@ -728,7 +728,7 @@
 			e = expr_transform(e);
 			break;
 		case E_AND:
-			// !(a && b) -> !a || !b
+			/* !(a && b) -> !a || !b */
 			tmp = e->left.expr;
 			e->type = E_OR;
 			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
@@ -738,7 +738,7 @@
 			break;
 		case E_SYMBOL:
 			if (e->left.expr->left.sym == &symbol_yes) {
-				// !'y' -> 'n'
+				/* !'y' -> 'n' */
 				tmp = e->left.expr;
 				free(e);
 				e = tmp;
@@ -747,7 +747,7 @@
 				break;
 			}
 			if (e->left.expr->left.sym == &symbol_mod) {
-				// !'m' -> 'm'
+				/* !'m' -> 'm' */
 				tmp = e->left.expr;
 				free(e);
 				e = tmp;
@@ -756,7 +756,7 @@
 				break;
 			}
 			if (e->left.expr->left.sym == &symbol_no) {
-				// !'n' -> 'y'
+				/* !'n' -> 'y' */
 				tmp = e->left.expr;
 				free(e);
 				e = tmp;

Modified: trunk/buildroot/package/config/expr.h
===================================================================
--- trunk/buildroot/package/config/expr.h	2007-06-28 10:47:05 UTC (rev 18957)
+++ trunk/buildroot/package/config/expr.h	2007-06-28 11:53:59 UTC (rev 18958)
@@ -65,7 +65,7 @@
 
 enum {
 	S_DEF_USER,		/* main user value */
-	S_DEF_AUTO,
+	S_DEF_AUTO
 };
 
 struct symbol {
@@ -139,7 +139,7 @@
 	struct property *prompt;
 	struct expr *dep;
 	unsigned int flags;
-	//char *help;
+	/*char *help; */
 	struct file *file;
 	int lineno;
 	void *data;

Added: trunk/buildroot/package/config/foo.h
===================================================================
--- trunk/buildroot/package/config/foo.h	                        (rev 0)
+++ trunk/buildroot/package/config/foo.h	2007-06-28 11:53:59 UTC (rev 18958)
@@ -0,0 +1,9 @@
+#ifndef __KCONFIG_FOO_H
+#define __KCONFIG_FOO_H
+#include <features.h>
+#include <limits.h>
+
+#ifndef PATH_MAX
+#define PATH_MAX 1024
+#endif
+#endif /* __KCONFIG_FOO_H */

Modified: trunk/buildroot/package/config/kconfig-to-buildroot2.patch
===================================================================
--- trunk/buildroot/package/config/kconfig-to-buildroot2.patch	2007-06-28 10:47:05 UTC (rev 18957)
+++ trunk/buildroot/package/config/kconfig-to-buildroot2.patch	2007-06-28 11:53:59 UTC (rev 18958)
@@ -87,7 +87,7 @@
 -				continue;
 -			}
 -			p = strchr(line + 7, '=');
-+		case 'A' ... 'Z':
++		case 'A': case 'B': case 'C': case 'D': case 'E': case 'F': case 'G': case 'H': case 'I': case 'J': case 'K': case 'L': case 'M': case 'N': case 'O': case 'P': case 'Q': case 'R': case 'S': case 'T': case 'U': case 'V': case 'W': case 'X': case 'Y': case 'Z':
 +			p = strchr(line, '=');
  			if (!p)
  				continue;
@@ -451,3 +451,208 @@
    <property name="type">GTK_WINDOW_TOPLEVEL</property>
    <property name="window_position">GTK_WIN_POS_NONE</property>
    <property name="modal">False</property>
+--- kconfig/conf.c	(revision 18956)
++++ Buildroot/conf.c	(working copy)
+@@ -542,7 +542,7 @@
+ 		exit(1);
+ 	}
+ 	conf_parse(name);
+-	//zconfdump(stdout);
++	/*zconfdump(stdout);*/
+ 	switch (input_mode) {
+ 	case set_default:
+ 		if (!defconfig_file)
+--- kconfig/expr.h	(revision 18956)
++++ Buildroot/expr.h	(working copy)
+@@ -65,7 +65,7 @@
+ 
+ enum {
+ 	S_DEF_USER,		/* main user value */
+-	S_DEF_AUTO,
++	S_DEF_AUTO
+ };
+ 
+ struct symbol {
+@@ -139,7 +139,7 @@
+ 	struct property *prompt;
+ 	struct expr *dep;
+ 	unsigned int flags;
+-	//char *help;
++	/*char *help; */
+ 	struct file *file;
+ 	int lineno;
+ 	void *data;
+Index: expr.c
+===================================================================
+--- kconfig/expr.c	(revision 18956)
++++ Buildroot/expr.c	(working copy)
+@@ -331,7 +331,7 @@
+ 		e->right.expr = expr_trans_bool(e->right.expr);
+ 		break;
+ 	case E_UNEQUAL:
+-		// FOO!=n -> FOO
++		/* FOO!=n -> FOO */
+ 		if (e->left.sym->type == S_TRISTATE) {
+ 			if (e->right.sym == &symbol_no) {
+ 				e->type = E_SYMBOL;
+@@ -380,19 +380,19 @@
+ 		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
+ 		    ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_mod) ||
+ 		     (e1->right.sym == &symbol_mod && e2->right.sym == &symbol_yes))) {
+-			// (a='y') || (a='m') -> (a!='n')
++			/* (a='y') || (a='m') -> (a!='n') */
+ 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_no);
+ 		}
+ 		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
+ 		    ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_no) ||
+ 		     (e1->right.sym == &symbol_no && e2->right.sym == &symbol_yes))) {
+-			// (a='y') || (a='n') -> (a!='m')
++			/* (a='y') || (a='n') -> (a!='m') */
+ 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_mod);
+ 		}
+ 		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
+ 		    ((e1->right.sym == &symbol_mod && e2->right.sym == &symbol_no) ||
+ 		     (e1->right.sym == &symbol_no && e2->right.sym == &symbol_mod))) {
+-			// (a='m') || (a='n') -> (a!='y')
++			/* (a='m') || (a='n') -> (a!='y') */
+ 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_yes);
+ 		}
+ 	}
+@@ -443,29 +443,29 @@
+ 
+ 	if ((e1->type == E_SYMBOL && e2->type == E_EQUAL && e2->right.sym == &symbol_yes) ||
+ 	    (e2->type == E_SYMBOL && e1->type == E_EQUAL && e1->right.sym == &symbol_yes))
+-		// (a) && (a='y') -> (a='y')
++		/* (a) && (a='y') -> (a='y') */
+ 		return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
+ 
+ 	if ((e1->type == E_SYMBOL && e2->type == E_UNEQUAL && e2->right.sym == &symbol_no) ||
+ 	    (e2->type == E_SYMBOL && e1->type == E_UNEQUAL && e1->right.sym == &symbol_no))
+-		// (a) && (a!='n') -> (a)
++		/* (a) && (a!='n') -> (a) */
+ 		return expr_alloc_symbol(sym1);
+ 
+ 	if ((e1->type == E_SYMBOL && e2->type == E_UNEQUAL && e2->right.sym == &symbol_mod) ||
+ 	    (e2->type == E_SYMBOL && e1->type == E_UNEQUAL && e1->right.sym == &symbol_mod))
+-		// (a) && (a!='m') -> (a='y')
++		/* (a) && (a!='m') -> (a='y') */
+ 		return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
+ 
+ 	if (sym1->type == S_TRISTATE) {
+ 		if (e1->type == E_EQUAL && e2->type == E_UNEQUAL) {
+-			// (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b'
++			/* (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b' */
+ 			sym2 = e1->right.sym;
+ 			if ((e2->right.sym->flags & SYMBOL_CONST) && (sym2->flags & SYMBOL_CONST))
+ 				return sym2 != e2->right.sym ? expr_alloc_comp(E_EQUAL, sym1, sym2)
+ 							     : expr_alloc_symbol(&symbol_no);
+ 		}
+ 		if (e1->type == E_UNEQUAL && e2->type == E_EQUAL) {
+-			// (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b'
++			/* (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b' */
+ 			sym2 = e2->right.sym;
+ 			if ((e1->right.sym->flags & SYMBOL_CONST) && (sym2->flags & SYMBOL_CONST))
+ 				return sym2 != e1->right.sym ? expr_alloc_comp(E_EQUAL, sym1, sym2)
+@@ -474,19 +474,19 @@
+ 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
+ 			   ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_no) ||
+ 			    (e1->right.sym == &symbol_no && e2->right.sym == &symbol_yes)))
+-			// (a!='y') && (a!='n') -> (a='m')
++			/* (a!='y') && (a!='n') -> (a='m') */
+ 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_mod);
+ 
+ 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
+ 			   ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_mod) ||
+ 			    (e1->right.sym == &symbol_mod && e2->right.sym == &symbol_yes)))
+-			// (a!='y') && (a!='m') -> (a='n')
++			/* (a!='y') && (a!='m') -> (a='n') */
+ 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_no);
+ 
+ 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
+ 			   ((e1->right.sym == &symbol_mod && e2->right.sym == &symbol_no) ||
+ 			    (e1->right.sym == &symbol_no && e2->right.sym == &symbol_mod)))
+-			// (a!='m') && (a!='n') -> (a='m')
++			/* (a!='m') && (a!='n') -> (a='m') */
+ 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
+ 
+ 		if ((e1->type == E_SYMBOL && e2->type == E_EQUAL && e2->right.sym == &symbol_mod) ||
+@@ -579,7 +579,7 @@
+ 	switch (e1->type) {
+ 	case E_OR:
+ 		expr_eliminate_dups2(e1->type, &e1, &e1);
+-		// (FOO || BAR) && (!FOO && !BAR) -> n
++		/* (FOO || BAR) && (!FOO && !BAR) -> n */
+ 		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
+ 		tmp2 = expr_copy(e2);
+ 		tmp = expr_extract_eq_and(&tmp1, &tmp2);
+@@ -594,7 +594,7 @@
+ 		break;
+ 	case E_AND:
+ 		expr_eliminate_dups2(e1->type, &e1, &e1);
+-		// (FOO && BAR) || (!FOO || !BAR) -> y
++		/* (FOO && BAR) || (!FOO || !BAR) -> y */
+ 		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
+ 		tmp2 = expr_copy(e2);
+ 		tmp = expr_extract_eq_or(&tmp1, &tmp2);
+@@ -703,7 +703,7 @@
+ 	case E_NOT:
+ 		switch (e->left.expr->type) {
+ 		case E_NOT:
+-			// !!a -> a
++			/* !!a -> a */
+ 			tmp = e->left.expr->left.expr;
+ 			free(e->left.expr);
+ 			free(e);
+@@ -712,14 +712,14 @@
+ 			break;
+ 		case E_EQUAL:
+ 		case E_UNEQUAL:
+-			// !a='x' -> a!='x'
++			/* !a='x' -> a!='x' */
+ 			tmp = e->left.expr;
+ 			free(e);
+ 			e = tmp;
+ 			e->type = e->type == E_EQUAL ? E_UNEQUAL : E_EQUAL;
+ 			break;
+ 		case E_OR:
+-			// !(a || b) -> !a && !b
++			/* !(a || b) -> !a && !b */
+ 			tmp = e->left.expr;
+ 			e->type = E_AND;
+ 			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
+@@ -728,7 +728,7 @@
+ 			e = expr_transform(e);
+ 			break;
+ 		case E_AND:
+-			// !(a && b) -> !a || !b
++			/* !(a && b) -> !a || !b */
+ 			tmp = e->left.expr;
+ 			e->type = E_OR;
+ 			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
+@@ -738,7 +738,7 @@
+ 			break;
+ 		case E_SYMBOL:
+ 			if (e->left.expr->left.sym == &symbol_yes) {
+-				// !'y' -> 'n'
++				/* !'y' -> 'n' */
+ 				tmp = e->left.expr;
+ 				free(e);
+ 				e = tmp;
+@@ -747,7 +747,7 @@
+ 				break;
+ 			}
+ 			if (e->left.expr->left.sym == &symbol_mod) {
+-				// !'m' -> 'm'
++				/* !'m' -> 'm' */
+ 				tmp = e->left.expr;
+ 				free(e);
+ 				e = tmp;
+@@ -756,7 +756,7 @@
+ 				break;
+ 			}
+ 			if (e->left.expr->left.sym == &symbol_no) {
+-				// !'n' -> 'y'
++				/* !'n' -> 'y' */
+ 				tmp = e->left.expr;
+ 				free(e);
+ 				e = tmp;
