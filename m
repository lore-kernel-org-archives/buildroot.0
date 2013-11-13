From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Nov 2013 00:53:34 +0100
Subject: [Buildroot] [PATCH 3/4] support/kconfig: remove useless patch
In-Reply-To: <cover.1384386575.git.yann.morin.1998@free.fr>
References: <cover.1384386575.git.yann.morin.1998@free.fr>
Message-ID: <859df3c46b906bff02c1b813dfa82d805ab92784.1384386575.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Patches 02-cpp-comments-to-c-comments.patch changes C++-style comments
into C-style comments.

This is unneeded, since gcc accepts C++-style comments in C code anyway.

Ditch that patch, that's one less we have to handle when updating from
upstream.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/kconfig/expr.c                             |  42 ++---
 .../patches/02-cpp-comments-to-c-comments.patch    | 178 ---------------------
 support/kconfig/patches/series                     |   1 -
 3 files changed, 21 insertions(+), 200 deletions(-)
 delete mode 100644 support/kconfig/patches/02-cpp-comments-to-c-comments.patch

diff --git a/support/kconfig/expr.c b/support/kconfig/expr.c
index bf776b6..d662652 100644
--- a/support/kconfig/expr.c
+++ b/support/kconfig/expr.c
@@ -326,7 +326,7 @@ struct expr *expr_trans_bool(struct expr *e)
 		e->right.expr = expr_trans_bool(e->right.expr);
 		break;
 	case E_UNEQUAL:
-		/* FOO!=n -> FOO */
+		// FOO!=n -> FOO
 		if (e->left.sym->type == S_TRISTATE) {
 			if (e->right.sym == &symbol_no) {
 				e->type = E_SYMBOL;
@@ -375,19 +375,19 @@ static struct expr *expr_join_or(struct expr *e1, struct expr *e2)
 		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
 		    ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_mod) ||
 		     (e1->right.sym == &symbol_mod && e2->right.sym == &symbol_yes))) {
-			/* (a='y') || (a='m') -> (a!='n') */
+			// (a='y') || (a='m') -> (a!='n')
 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_no);
 		}
 		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
 		    ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_no) ||
 		     (e1->right.sym == &symbol_no && e2->right.sym == &symbol_yes))) {
-			/* (a='y') || (a='n') -> (a!='m') */
+			// (a='y') || (a='n') -> (a!='m')
 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_mod);
 		}
 		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
 		    ((e1->right.sym == &symbol_mod && e2->right.sym == &symbol_no) ||
 		     (e1->right.sym == &symbol_no && e2->right.sym == &symbol_mod))) {
-			/* (a='m') || (a='n') -> (a!='y') */
+			// (a='m') || (a='n') -> (a!='y')
 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_yes);
 		}
 	}
@@ -438,29 +438,29 @@ static struct expr *expr_join_and(struct expr *e1, struct expr *e2)
 
 	if ((e1->type == E_SYMBOL && e2->type == E_EQUAL && e2->right.sym == &symbol_yes) ||
 	    (e2->type == E_SYMBOL && e1->type == E_EQUAL && e1->right.sym == &symbol_yes))
-		/* (a) && (a='y') -> (a='y') */
+		// (a) && (a='y') -> (a='y')
 		return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
 
 	if ((e1->type == E_SYMBOL && e2->type == E_UNEQUAL && e2->right.sym == &symbol_no) ||
 	    (e2->type == E_SYMBOL && e1->type == E_UNEQUAL && e1->right.sym == &symbol_no))
-		/* (a) && (a!='n') -> (a) */
+		// (a) && (a!='n') -> (a)
 		return expr_alloc_symbol(sym1);
 
 	if ((e1->type == E_SYMBOL && e2->type == E_UNEQUAL && e2->right.sym == &symbol_mod) ||
 	    (e2->type == E_SYMBOL && e1->type == E_UNEQUAL && e1->right.sym == &symbol_mod))
-		/* (a) && (a!='m') -> (a='y') */
+		// (a) && (a!='m') -> (a='y')
 		return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
 
 	if (sym1->type == S_TRISTATE) {
 		if (e1->type == E_EQUAL && e2->type == E_UNEQUAL) {
-			/* (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b' */
+			// (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b'
 			sym2 = e1->right.sym;
 			if ((e2->right.sym->flags & SYMBOL_CONST) && (sym2->flags & SYMBOL_CONST))
 				return sym2 != e2->right.sym ? expr_alloc_comp(E_EQUAL, sym1, sym2)
 							     : expr_alloc_symbol(&symbol_no);
 		}
 		if (e1->type == E_UNEQUAL && e2->type == E_EQUAL) {
-			/* (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b' */
+			// (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b'
 			sym2 = e2->right.sym;
 			if ((e1->right.sym->flags & SYMBOL_CONST) && (sym2->flags & SYMBOL_CONST))
 				return sym2 != e1->right.sym ? expr_alloc_comp(E_EQUAL, sym1, sym2)
@@ -469,19 +469,19 @@ static struct expr *expr_join_and(struct expr *e1, struct expr *e2)
 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
 			   ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_no) ||
 			    (e1->right.sym == &symbol_no && e2->right.sym == &symbol_yes)))
-			/* (a!='y') && (a!='n') -> (a='m') */
+			// (a!='y') && (a!='n') -> (a='m')
 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_mod);
 
 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
 			   ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_mod) ||
 			    (e1->right.sym == &symbol_mod && e2->right.sym == &symbol_yes)))
-			/* (a!='y') && (a!='m') -> (a='n') */
+			// (a!='y') && (a!='m') -> (a='n')
 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_no);
 
 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
 			   ((e1->right.sym == &symbol_mod && e2->right.sym == &symbol_no) ||
 			    (e1->right.sym == &symbol_no && e2->right.sym == &symbol_mod)))
-			/* (a!='m') && (a!='n') -> (a='m') */
+			// (a!='m') && (a!='n') -> (a='m')
 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
 
 		if ((e1->type == E_SYMBOL && e2->type == E_EQUAL && e2->right.sym == &symbol_mod) ||
@@ -574,7 +574,7 @@ static void expr_eliminate_dups2(enum expr_type type, struct expr **ep1, struct
 	switch (e1->type) {
 	case E_OR:
 		expr_eliminate_dups2(e1->type, &e1, &e1);
-		/* (FOO || BAR) && (!FOO && !BAR) -> n */
+		// (FOO || BAR) && (!FOO && !BAR) -> n
 		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
 		tmp2 = expr_copy(e2);
 		tmp = expr_extract_eq_and(&tmp1, &tmp2);
@@ -589,7 +589,7 @@ static void expr_eliminate_dups2(enum expr_type type, struct expr **ep1, struct
 		break;
 	case E_AND:
 		expr_eliminate_dups2(e1->type, &e1, &e1);
-		/* (FOO && BAR) || (!FOO || !BAR) -> y */
+		// (FOO && BAR) || (!FOO || !BAR) -> y
 		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
 		tmp2 = expr_copy(e2);
 		tmp = expr_extract_eq_or(&tmp1, &tmp2);
@@ -698,7 +698,7 @@ struct expr *expr_transform(struct expr *e)
 	case E_NOT:
 		switch (e->left.expr->type) {
 		case E_NOT:
-			/* !!a -> a */
+			// !!a -> a
 			tmp = e->left.expr->left.expr;
 			free(e->left.expr);
 			free(e);
@@ -707,14 +707,14 @@ struct expr *expr_transform(struct expr *e)
 			break;
 		case E_EQUAL:
 		case E_UNEQUAL:
-			/* !a='x' -> a!='x' */
+			// !a='x' -> a!='x'
 			tmp = e->left.expr;
 			free(e);
 			e = tmp;
 			e->type = e->type == E_EQUAL ? E_UNEQUAL : E_EQUAL;
 			break;
 		case E_OR:
-			/* !(a || b) -> !a && !b */
+			// !(a || b) -> !a && !b
 			tmp = e->left.expr;
 			e->type = E_AND;
 			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
@@ -723,7 +723,7 @@ struct expr *expr_transform(struct expr *e)
 			e = expr_transform(e);
 			break;
 		case E_AND:
-			/* !(a && b) -> !a || !b */
+			// !(a && b) -> !a || !b
 			tmp = e->left.expr;
 			e->type = E_OR;
 			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
@@ -733,7 +733,7 @@ struct expr *expr_transform(struct expr *e)
 			break;
 		case E_SYMBOL:
 			if (e->left.expr->left.sym == &symbol_yes) {
-				/* !'y' -> 'n' */
+				// !'y' -> 'n'
 				tmp = e->left.expr;
 				free(e);
 				e = tmp;
@@ -742,7 +742,7 @@ struct expr *expr_transform(struct expr *e)
 				break;
 			}
 			if (e->left.expr->left.sym == &symbol_mod) {
-				/* !'m' -> 'm' */
+				// !'m' -> 'm'
 				tmp = e->left.expr;
 				free(e);
 				e = tmp;
@@ -751,7 +751,7 @@ struct expr *expr_transform(struct expr *e)
 				break;
 			}
 			if (e->left.expr->left.sym == &symbol_no) {
-				/* !'n' -> 'y' */
+				// !'n' -> 'y'
 				tmp = e->left.expr;
 				free(e);
 				e = tmp;
diff --git a/support/kconfig/patches/02-cpp-comments-to-c-comments.patch b/support/kconfig/patches/02-cpp-comments-to-c-comments.patch
deleted file mode 100644
index 72afa84..0000000
--- a/support/kconfig/patches/02-cpp-comments-to-c-comments.patch
+++ /dev/null
@@ -1,178 +0,0 @@
----
- expr.c |   42 +++++++++++++++++++++---------------------
- 1 file changed, 21 insertions(+), 21 deletions(-)
-
-Index: b/expr.c
-===================================================================
---- a/expr.c
-+++ b/expr.c
-@@ -326,7 +326,7 @@
- 		e->right.expr = expr_trans_bool(e->right.expr);
- 		break;
- 	case E_UNEQUAL:
--		// FOO!=n -> FOO
-+		/* FOO!=n -> FOO */
- 		if (e->left.sym->type == S_TRISTATE) {
- 			if (e->right.sym == &symbol_no) {
- 				e->type = E_SYMBOL;
-@@ -375,19 +375,19 @@
- 		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
- 		    ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_mod) ||
- 		     (e1->right.sym == &symbol_mod && e2->right.sym == &symbol_yes))) {
--			// (a='y') || (a='m') -> (a!='n')
-+			/* (a='y') || (a='m') -> (a!='n') */
- 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_no);
- 		}
- 		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
- 		    ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_no) ||
- 		     (e1->right.sym == &symbol_no && e2->right.sym == &symbol_yes))) {
--			// (a='y') || (a='n') -> (a!='m')
-+			/* (a='y') || (a='n') -> (a!='m') */
- 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_mod);
- 		}
- 		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
- 		    ((e1->right.sym == &symbol_mod && e2->right.sym == &symbol_no) ||
- 		     (e1->right.sym == &symbol_no && e2->right.sym == &symbol_mod))) {
--			// (a='m') || (a='n') -> (a!='y')
-+			/* (a='m') || (a='n') -> (a!='y') */
- 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_yes);
- 		}
- 	}
-@@ -438,29 +438,29 @@
- 
- 	if ((e1->type == E_SYMBOL && e2->type == E_EQUAL && e2->right.sym == &symbol_yes) ||
- 	    (e2->type == E_SYMBOL && e1->type == E_EQUAL && e1->right.sym == &symbol_yes))
--		// (a) && (a='y') -> (a='y')
-+		/* (a) && (a='y') -> (a='y') */
- 		return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
- 
- 	if ((e1->type == E_SYMBOL && e2->type == E_UNEQUAL && e2->right.sym == &symbol_no) ||
- 	    (e2->type == E_SYMBOL && e1->type == E_UNEQUAL && e1->right.sym == &symbol_no))
--		// (a) && (a!='n') -> (a)
-+		/* (a) && (a!='n') -> (a) */
- 		return expr_alloc_symbol(sym1);
- 
- 	if ((e1->type == E_SYMBOL && e2->type == E_UNEQUAL && e2->right.sym == &symbol_mod) ||
- 	    (e2->type == E_SYMBOL && e1->type == E_UNEQUAL && e1->right.sym == &symbol_mod))
--		// (a) && (a!='m') -> (a='y')
-+		/* (a) && (a!='m') -> (a='y') */
- 		return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
- 
- 	if (sym1->type == S_TRISTATE) {
- 		if (e1->type == E_EQUAL && e2->type == E_UNEQUAL) {
--			// (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b'
-+			/* (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b' */
- 			sym2 = e1->right.sym;
- 			if ((e2->right.sym->flags & SYMBOL_CONST) && (sym2->flags & SYMBOL_CONST))
- 				return sym2 != e2->right.sym ? expr_alloc_comp(E_EQUAL, sym1, sym2)
- 							     : expr_alloc_symbol(&symbol_no);
- 		}
- 		if (e1->type == E_UNEQUAL && e2->type == E_EQUAL) {
--			// (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b'
-+			/* (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b' */
- 			sym2 = e2->right.sym;
- 			if ((e1->right.sym->flags & SYMBOL_CONST) && (sym2->flags & SYMBOL_CONST))
- 				return sym2 != e1->right.sym ? expr_alloc_comp(E_EQUAL, sym1, sym2)
-@@ -469,19 +469,19 @@
- 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
- 			   ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_no) ||
- 			    (e1->right.sym == &symbol_no && e2->right.sym == &symbol_yes)))
--			// (a!='y') && (a!='n') -> (a='m')
-+			/* (a!='y') && (a!='n') -> (a='m') */
- 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_mod);
- 
- 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
- 			   ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_mod) ||
- 			    (e1->right.sym == &symbol_mod && e2->right.sym == &symbol_yes)))
--			// (a!='y') && (a!='m') -> (a='n')
-+			/* (a!='y') && (a!='m') -> (a='n') */
- 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_no);
- 
- 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
- 			   ((e1->right.sym == &symbol_mod && e2->right.sym == &symbol_no) ||
- 			    (e1->right.sym == &symbol_no && e2->right.sym == &symbol_mod)))
--			// (a!='m') && (a!='n') -> (a='m')
-+			/* (a!='m') && (a!='n') -> (a='m') */
- 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
- 
- 		if ((e1->type == E_SYMBOL && e2->type == E_EQUAL && e2->right.sym == &symbol_mod) ||
-@@ -574,7 +574,7 @@
- 	switch (e1->type) {
- 	case E_OR:
- 		expr_eliminate_dups2(e1->type, &e1, &e1);
--		// (FOO || BAR) && (!FOO && !BAR) -> n
-+		/* (FOO || BAR) && (!FOO && !BAR) -> n */
- 		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
- 		tmp2 = expr_copy(e2);
- 		tmp = expr_extract_eq_and(&tmp1, &tmp2);
-@@ -589,7 +589,7 @@
- 		break;
- 	case E_AND:
- 		expr_eliminate_dups2(e1->type, &e1, &e1);
--		// (FOO && BAR) || (!FOO || !BAR) -> y
-+		/* (FOO && BAR) || (!FOO || !BAR) -> y */
- 		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
- 		tmp2 = expr_copy(e2);
- 		tmp = expr_extract_eq_or(&tmp1, &tmp2);
-@@ -698,7 +698,7 @@
- 	case E_NOT:
- 		switch (e->left.expr->type) {
- 		case E_NOT:
--			// !!a -> a
-+			/* !!a -> a */
- 			tmp = e->left.expr->left.expr;
- 			free(e->left.expr);
- 			free(e);
-@@ -707,14 +707,14 @@
- 			break;
- 		case E_EQUAL:
- 		case E_UNEQUAL:
--			// !a='x' -> a!='x'
-+			/* !a='x' -> a!='x' */
- 			tmp = e->left.expr;
- 			free(e);
- 			e = tmp;
- 			e->type = e->type == E_EQUAL ? E_UNEQUAL : E_EQUAL;
- 			break;
- 		case E_OR:
--			// !(a || b) -> !a && !b
-+			/* !(a || b) -> !a && !b */
- 			tmp = e->left.expr;
- 			e->type = E_AND;
- 			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
-@@ -723,7 +723,7 @@
- 			e = expr_transform(e);
- 			break;
- 		case E_AND:
--			// !(a && b) -> !a || !b
-+			/* !(a && b) -> !a || !b */
- 			tmp = e->left.expr;
- 			e->type = E_OR;
- 			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
-@@ -733,7 +733,7 @@
- 			break;
- 		case E_SYMBOL:
- 			if (e->left.expr->left.sym == &symbol_yes) {
--				// !'y' -> 'n'
-+				/* !'y' -> 'n' */
- 				tmp = e->left.expr;
- 				free(e);
- 				e = tmp;
-@@ -742,7 +742,7 @@
- 				break;
- 			}
- 			if (e->left.expr->left.sym == &symbol_mod) {
--				// !'m' -> 'm'
-+				/* !'m' -> 'm' */
- 				tmp = e->left.expr;
- 				free(e);
- 				e = tmp;
-@@ -751,7 +751,7 @@
- 				break;
- 			}
- 			if (e->left.expr->left.sym == &symbol_no) {
--				// !'n' -> 'y'
-+				/* !'n' -> 'y' */
- 				tmp = e->left.expr;
- 				free(e);
- 				e = tmp;
diff --git a/support/kconfig/patches/series b/support/kconfig/patches/series
index 6e3319e..a3e9843 100644
--- a/support/kconfig/patches/series
+++ b/support/kconfig/patches/series
@@ -1,5 +1,4 @@
 01-kconfig-kernel-to-buildroot.patch
-02-cpp-comments-to-c-comments.patch
 06-br-build-system-integration.patch
 09-implement-kconfig-probability.patch
 10-br-build-system.patch
-- 
1.8.1.2
