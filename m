From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Feb 2011 15:54:50 +0100
Subject: [Buildroot] [git commit master 1/1] package/config: rebase against
	2.6.38-rc3
Message-ID: <20110202145518.C32778F2F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a72ab0542ff1dd8909ba5f1065627e41e3316b45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes nconfig crash on comments within choice groups.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/config/conf.c                              |    2 -
 package/config/confdata.c                          |   24 ++++-------
 package/config/expr.c                              |   44 +++++++++++++++++++-
 package/config/expr.h                              |    3 +-
 package/config/lkc.h                               |    7 ++-
 package/config/menu.c                              |   15 +++++-
 package/config/nconf.c                             |   10 +++-
 .../patches/03-change-config-option-prefix.patch   |   12 +++---
 .../patches/09-implement-kconfig-probability.patch |    4 +-
 .../patches/14-support-out-of-tree-config.patch    |   26 ++++--------
 package/config/symbol.c                            |    8 +++-
 11 files changed, 99 insertions(+), 56 deletions(-)

diff --git a/package/config/conf.c b/package/config/conf.c
index 93005bf..652e079 100644
--- a/package/config/conf.c
+++ b/package/config/conf.c
@@ -528,8 +528,6 @@ int main(int ac, char **av)
 		}
 		break;
 	case savedefconfig:
-		conf_read(NULL);
-		break;
 	case silentoldconfig:
 	case oldaskconfig:
 	case oldconfig:
diff --git a/package/config/confdata.c b/package/config/confdata.c
index 12d94dc..c9f13ee 100644
--- a/package/config/confdata.c
+++ b/package/config/confdata.c
@@ -439,12 +439,11 @@ static void conf_write_string(bool headerfile, const char *name,
 	fputs("\"\n", out);
 }
 
-static void conf_write_symbol(struct symbol *sym, enum symbol_type type,
-                              FILE *out, bool write_no)
+static void conf_write_symbol(struct symbol *sym, FILE *out, bool write_no)
 {
 	const char *str;
 
-	switch (type) {
+	switch (sym->type) {
 	case S_BOOLEAN:
 	case S_TRISTATE:
 		switch (sym_get_tristate_value(sym)) {
@@ -531,7 +530,7 @@ int conf_write_defconfig(const char *filename)
 						goto next_menu;
 				}
 			}
-			conf_write_symbol(sym, sym->type, out, true);
+			conf_write_symbol(sym, out, true);
 		}
 next_menu:
 		if (menu->list != NULL) {
@@ -560,7 +559,6 @@ int conf_write(const char *name)
 	const char *basename;
 	const char *str;
 	char dirname[PATH_MAX+1], tmpname[PATH_MAX+1], newname[PATH_MAX+1];
-	enum symbol_type type;
 	time_t now;
 	int use_timestamp = 1;
 	char *env;
@@ -635,14 +633,8 @@ int conf_write(const char *name)
 			if (!(sym->flags & SYMBOL_WRITE))
 				goto next;
 			sym->flags &= ~SYMBOL_WRITE;
-			type = sym->type;
-			if (type == S_TRISTATE) {
-				sym_calc_value(modules_sym);
-				if (modules_sym->curr.tri == no)
-					type = S_BOOLEAN;
-			}
 			/* Write config symbol to file */
-			conf_write_symbol(sym, type, out, true);
+			conf_write_symbol(sym, out, true);
 		}
 
 next:
@@ -872,7 +864,7 @@ int conf_write_autoconf(void)
 			continue;
 
 		/* write symbol to config file */
-		conf_write_symbol(sym, sym->type, out, false);
+		conf_write_symbol(sym, out, false);
 
 		/* update autoconf and tristate files */
 		switch (sym->type) {
@@ -978,7 +970,7 @@ static void randomize_choice_values(struct symbol *csym)
 	int cnt, def;
 
 	/*
-	 * If choice is mod then we may have more items slected
+	 * If choice is mod then we may have more items selected
 	 * and if no then no-one.
 	 * In both cases stop.
 	 */
@@ -1090,10 +1082,10 @@ void conf_set_all_new_symbols(enum conf_def_mode mode)
 
 	/*
 	 * We have different type of choice blocks.
-	 * If curr.tri equal to mod then we can select several
+	 * If curr.tri equals to mod then we can select several
 	 * choice symbols in one block.
 	 * In this case we do nothing.
-	 * If curr.tri equal yes then only one symbol can be
+	 * If curr.tri equals yes then only one symbol can be
 	 * selected in a choice block and we set it to yes,
 	 * and the rest to no.
 	 */
diff --git a/package/config/expr.c b/package/config/expr.c
index 88aace9..c5182f4 100644
--- a/package/config/expr.c
+++ b/package/config/expr.c
@@ -64,7 +64,7 @@ struct expr *expr_alloc_or(struct expr *e1, struct expr *e2)
 	return e2 ? expr_alloc_two(E_OR, e1, e2) : e1;
 }
 
-struct expr *expr_copy(struct expr *org)
+struct expr *expr_copy(const struct expr *org)
 {
 	struct expr *e;
 
@@ -1013,6 +1013,48 @@ int expr_compare_type(enum expr_type t1, enum expr_type t2)
 #endif
 }
 
+static inline struct expr *
+expr_get_leftmost_symbol(const struct expr *e)
+{
+
+	if (e == NULL)
+		return NULL;
+
+	while (e->type != E_SYMBOL)
+		e = e->left.expr;
+
+	return expr_copy(e);
+}
+
+/*
+ * Given expression `e1' and `e2', returns the leaf of the longest
+ * sub-expression of `e1' not containing 'e2.
+ */
+struct expr *expr_simplify_unmet_dep(struct expr *e1, struct expr *e2)
+{
+	struct expr *ret;
+
+	switch (e1->type) {
+	case E_OR:
+		return expr_alloc_and(
+		    expr_simplify_unmet_dep(e1->left.expr, e2),
+		    expr_simplify_unmet_dep(e1->right.expr, e2));
+	case E_AND: {
+		struct expr *e;
+		e = expr_alloc_and(expr_copy(e1), expr_copy(e2));
+		e = expr_eliminate_dups(e);
+		ret = (!expr_eq(e, e1)) ? e1 : NULL;
+		expr_free(e);
+		break;
+		}
+	default:
+		ret = e1;
+		break;
+	}
+
+	return expr_get_leftmost_symbol(ret);
+}
+
 void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken)
 {
 	if (!e) {
diff --git a/package/config/expr.h b/package/config/expr.h
index e57826c..3d238db 100644
--- a/package/config/expr.h
+++ b/package/config/expr.h
@@ -192,7 +192,7 @@ struct expr *expr_alloc_two(enum expr_type type, struct expr *e1, struct expr *e
 struct expr *expr_alloc_comp(enum expr_type type, struct symbol *s1, struct symbol *s2);
 struct expr *expr_alloc_and(struct expr *e1, struct expr *e2);
 struct expr *expr_alloc_or(struct expr *e1, struct expr *e2);
-struct expr *expr_copy(struct expr *org);
+struct expr *expr_copy(const struct expr *org);
 void expr_free(struct expr *e);
 int expr_eq(struct expr *e1, struct expr *e2);
 void expr_eliminate_eq(struct expr **ep1, struct expr **ep2);
@@ -207,6 +207,7 @@ struct expr *expr_extract_eq_and(struct expr **ep1, struct expr **ep2);
 struct expr *expr_extract_eq_or(struct expr **ep1, struct expr **ep2);
 void expr_extract_eq(enum expr_type type, struct expr **ep, struct expr **ep1, struct expr **ep2);
 struct expr *expr_trans_compare(struct expr *e, enum expr_type type, struct symbol *sym);
+struct expr *expr_simplify_unmet_dep(struct expr *e1, struct expr *e2);
 
 void expr_fprint(struct expr *e, FILE *out);
 struct gstr; /* forward */
diff --git a/package/config/lkc.h b/package/config/lkc.h
index 0128a96..e899066 100644
--- a/package/config/lkc.h
+++ b/package/config/lkc.h
@@ -14,6 +14,7 @@
 static inline const char *gettext(const char *txt) { return txt; }
 static inline void textdomain(const char *domainname) {}
 static inline void bindtextdomain(const char *name, const char *dir) {}
+static inline char *bind_textdomain_codeset(const char *dn, char *c) { return c; }
 #endif
 
 #ifdef __cplusplus
@@ -67,10 +68,12 @@ struct kconf_id {
 	enum symbol_type stype;
 };
 
+#ifdef YYDEBUG
+extern int zconfdebug;
+#endif
+
 int zconfparse(void);
 void zconfdump(FILE *out);
-
-extern int zconfdebug;
 void zconf_starthelp(void);
 FILE *zconf_fopen(const char *name);
 void zconf_initscan(const char *name);
diff --git a/package/config/menu.c b/package/config/menu.c
index 1deca3c..d49f8b8 100644
--- a/package/config/menu.c
+++ b/package/config/menu.c
@@ -203,7 +203,7 @@ void menu_add_option(int token, char *arg)
 	}
 }
 
-static int menu_range_valid_sym(struct symbol *sym, struct symbol *sym2)
+static int menu_validate_number(struct symbol *sym, struct symbol *sym2)
 {
 	return sym2->type == S_INT || sym2->type == S_HEX ||
 	       (sym2->type == S_UNKNOWN && sym_string_valid(sym, sym2->name));
@@ -221,6 +221,15 @@ static void sym_check_prop(struct symbol *sym)
 				prop_warn(prop,
 				    "default for config symbol '%s'"
 				    " must be a single symbol", sym->name);
+			if (prop->expr->type != E_SYMBOL)
+				break;
+			sym2 = prop_get_symbol(prop);
+			if (sym->type == S_HEX || sym->type == S_INT) {
+				if (!menu_validate_number(sym, sym2))
+					prop_warn(prop,
+					    "'%s': number is invalid",
+					    sym->name);
+			}
 			break;
 		case P_SELECT:
 			sym2 = prop_get_symbol(prop);
@@ -240,8 +249,8 @@ static void sym_check_prop(struct symbol *sym)
 			if (sym->type != S_INT && sym->type != S_HEX)
 				prop_warn(prop, "range is only allowed "
 				                "for int or hex symbols");
-			if (!menu_range_valid_sym(sym, prop->expr->left.sym) ||
-			    !menu_range_valid_sym(sym, prop->expr->right.sym))
+			if (!menu_validate_number(sym, prop->expr->left.sym) ||
+			    !menu_validate_number(sym, prop->expr->right.sym))
 				prop_warn(prop, "range is invalid");
 			break;
 		default:
diff --git a/package/config/nconf.c b/package/config/nconf.c
index 272a987..db56377 100644
--- a/package/config/nconf.c
+++ b/package/config/nconf.c
@@ -248,7 +248,7 @@ search_help[] = N_(
 "Only relevant lines are shown.\n"
 "\n\n"
 "Search examples:\n"
-"Examples: USB   = > find all symbols containing USB\n"
+"Examples: USB  => find all symbols containing USB\n"
 "          ^USB => find all symbols starting with USB\n"
 "          USB$ => find all symbols ending with USB\n"
 "\n");
@@ -1266,9 +1266,13 @@ static void conf_choice(struct menu *menu)
 			if (child->sym == sym_get_choice_value(menu->sym))
 				item_make(child, ':', "<X> %s",
 						_(menu_get_prompt(child)));
-			else
+			else if (child->sym)
 				item_make(child, ':', "    %s",
 						_(menu_get_prompt(child)));
+			else
+				item_make(child, ':', "*** %s ***",
+						_(menu_get_prompt(child)));
+
 			if (child->sym == active){
 				last_top_row = top_row(curses_menu);
 				selected_index = i;
@@ -1334,7 +1338,7 @@ static void conf_choice(struct menu *menu)
 			break;
 
 		child = item_data();
-		if (!child || !menu_is_visible(child))
+		if (!child || !menu_is_visible(child) || !child->sym)
 			continue;
 		switch (res) {
 		case ' ':
diff --git a/package/config/patches/03-change-config-option-prefix.patch b/package/config/patches/03-change-config-option-prefix.patch
index 8476ea4..d387236 100644
--- a/package/config/patches/03-change-config-option-prefix.patch
+++ b/package/config/patches/03-change-config-option-prefix.patch
@@ -97,7 +97,7 @@ Index: config/confdata.c
  
  	while (1) {
  		l = strcspn(str, "\"\\");
-@@ -451,14 +452,14 @@
+@@ -450,14 +451,14 @@
  		switch (sym_get_tristate_value(sym)) {
  		case no:
  			if (write_no)
@@ -116,7 +116,7 @@ Index: config/confdata.c
  			break;
  		}
  		break;
-@@ -468,7 +469,7 @@
+@@ -467,7 +468,7 @@
  	case S_HEX:
  	case S_INT:
  		str = sym_get_string_value(sym);
@@ -125,7 +125,7 @@ Index: config/confdata.c
  		break;
  	case S_OTHER:
  	case S_UNKNOWN:
-@@ -853,17 +854,17 @@
+@@ -844,17 +845,17 @@
  			case no:
  				break;
  			case mod:
@@ -151,7 +151,7 @@ Index: config/confdata.c
  				break;
  			}
  			break;
-@@ -873,14 +874,14 @@
+@@ -864,14 +865,14 @@
  		case S_HEX:
  			str = sym_get_string_value(sym);
  			if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
@@ -174,7 +174,7 @@ Index: config/lkc.h
 ===================================================================
 --- config.orig/lkc.h
 +++ config/lkc.h
-@@ -41,7 +41,7 @@
+@@ -42,7 +42,7 @@
  #define N_(text) (text)
  
  #ifndef CONFIG_
@@ -187,7 +187,7 @@ Index: config/menu.c
 ===================================================================
 --- config.orig/menu.c
 +++ config/menu.c
-@@ -588,7 +588,7 @@
+@@ -597,7 +597,7 @@
  
  	if (menu_has_help(menu)) {
  		if (sym->name) {
diff --git a/package/config/patches/09-implement-kconfig-probability.patch b/package/config/patches/09-implement-kconfig-probability.patch
index 8ee5ea3..3f09673 100644
--- a/package/config/patches/09-implement-kconfig-probability.patch
+++ b/package/config/patches/09-implement-kconfig-probability.patch
@@ -6,7 +6,7 @@ Index: config/confdata.c
 ===================================================================
 --- config.orig/confdata.c
 +++ config/confdata.c
-@@ -1005,7 +1005,16 @@
+@@ -996,7 +996,16 @@
  void conf_set_all_new_symbols(enum conf_def_mode mode)
  {
  	struct symbol *sym, *csym;
@@ -24,7 +24,7 @@ Index: config/confdata.c
  
  	for_all_symbols(i, sym) {
  		if (sym_has_value(sym))
-@@ -1024,8 +1033,15 @@
+@@ -1015,8 +1024,15 @@
  				sym->def[S_DEF_USER].tri = no;
  				break;
  			case def_random:
diff --git a/package/config/patches/14-support-out-of-tree-config.patch b/package/config/patches/14-support-out-of-tree-config.patch
index 54d0bd9..9fa6384 100644
--- a/package/config/patches/14-support-out-of-tree-config.patch
+++ b/package/config/patches/14-support-out-of-tree-config.patch
@@ -1,8 +1,8 @@
 ---
  conf.c     |    1 
- confdata.c |   65 +++++++++++++++++++++++++++++++++++++++++++++----------------
+ confdata.c |   62 ++++++++++++++++++++++++++++++++++++++++++++++---------------
  util.c     |   16 +++++++++++++--
- 3 files changed, 62 insertions(+), 20 deletions(-)
+ 3 files changed, 61 insertions(+), 18 deletions(-)
 
 Index: config/conf.c
 ===================================================================
@@ -31,7 +31,7 @@ Index: config/confdata.c
  }
  
  static char *conf_expand_value(const char *in)
-@@ -567,6 +565,9 @@
+@@ -565,6 +563,9 @@
  	int use_timestamp = 1;
  	char *env;
  
@@ -41,7 +41,7 @@ Index: config/confdata.c
  	dirname[0] = 0;
  	if (name && name[0]) {
  		struct stat st;
-@@ -679,6 +680,7 @@
+@@ -671,6 +672,7 @@
  {
  	const char *name;
  	char path[PATH_MAX+1];
@@ -49,7 +49,7 @@ Index: config/confdata.c
  	char *s, *d, c;
  	struct symbol *sym;
  	struct stat sb;
-@@ -687,8 +689,20 @@
+@@ -679,8 +681,20 @@
  	name = conf_get_autoconfig_name();
  	conf_read_simple(name, S_DEF_AUTO);
  
@@ -72,7 +72,7 @@ Index: config/confdata.c
  
  	res = 0;
  	for_all_symbols(i, sym) {
-@@ -781,9 +795,11 @@
+@@ -773,9 +787,11 @@
  		close(fd);
  	}
  out:
@@ -87,7 +87,7 @@ Index: config/confdata.c
  	return res;
  }
  
-@@ -795,25 +811,38 @@
+@@ -787,25 +803,38 @@
  	FILE *out, *tristate, *out_h;
  	time_t now;
  	int i;
@@ -130,17 +130,7 @@ Index: config/confdata.c
  	if (!out_h) {
  		fclose(out);
  		fclose(tristate);
-@@ -834,8 +863,7 @@
- 		       " * Automatically generated C config: don't edit\n"
- 		       " * %s\n"
- 		       " * %s"
--		       " */\n"
--		       "#define AUTOCONF_INCLUDED\n",
-+		       " */\n",
- 		       rootmenu.prompt->text, ctime(&now));
- 
- 	for_all_symbols(i, sym) {
-@@ -894,19 +922,22 @@
+@@ -885,19 +914,22 @@
  	name = getenv("KCONFIG_AUTOHEADER");
  	if (!name)
  		name = "include/generated/autoconf.h";
diff --git a/package/config/symbol.c b/package/config/symbol.c
index af6e9f3..a796c95 100644
--- a/package/config/symbol.c
+++ b/package/config/symbol.c
@@ -351,12 +351,16 @@ void sym_calc_value(struct symbol *sym)
 			}
 		calc_newval:
 			if (sym->dir_dep.tri == no && sym->rev_dep.tri != no) {
+				struct expr *e;
+				e = expr_simplify_unmet_dep(sym->rev_dep.expr,
+				    sym->dir_dep.expr);
 				fprintf(stderr, "warning: (");
-				expr_fprint(sym->rev_dep.expr, stderr);
+				expr_fprint(e, stderr);
 				fprintf(stderr, ") selects %s which has unmet direct dependencies (",
 					sym->name);
 				expr_fprint(sym->dir_dep.expr, stderr);
 				fprintf(stderr, ")\n");
+				expr_free(e);
 			}
 			newval.tri = EXPR_OR(newval.tri, sym->rev_dep.tri);
 		}
@@ -686,7 +690,7 @@ const char *sym_get_string_default(struct symbol *sym)
 		switch (sym->type) {
 		case S_BOOLEAN:
 		case S_TRISTATE:
-			/* The visibility imay limit the value from yes => mod */
+			/* The visibility may limit the value from yes => mod */
 			val = EXPR_AND(expr_calc_value(prop->expr), prop->visible.tri);
 			break;
 		default:
-- 
1.7.3.4
