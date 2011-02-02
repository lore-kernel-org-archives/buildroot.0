From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Feb 2011 15:54:50 +0100
Subject: [Buildroot] [git commit master 1/1] package/config: Rebase against
	Linux 2.6.36
Message-ID: <20110202145518.0B8588F2F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=359a922659c6b33c44ab7c4f94de7d801a8bea63
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No significant changes, but makes it easier to rebase against newer
versions.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/config/conf.c                              |    2 +-
 package/config/confdata.c                          |    6 ++++--
 package/config/expr.h                              |    1 -
 package/config/menu.c                              |    9 +++------
 .../patches/01-kconfig-kernel-to-buildroot.patch   |   10 +++++-----
 .../patches/02-cpp-comments-to-c-comments.patch    |    6 +++---
 .../patches/03-change-config-option-prefix.patch   |    4 ++--
 .../patches/05-really-clean-everything.patch       |    6 +++---
 package/config/patches/08-make-write-deps.patch    |    6 +++---
 .../patches/09-implement-kconfig-probability.patch |    4 ++--
 .../patches/11-use-mktemp-for-lxdialog.patch       |    6 +++---
 .../config/patches/12-fix-glade-file-path.patch    |    6 +++---
 .../patches/14-support-out-of-tree-config.patch    |   14 +++++++-------
 .../patches/15-use-PATH_MAX-for-path-buffer.patch  |   19 ++++++++-----------
 package/config/symbol.c                            |    4 ++++
 15 files changed, 51 insertions(+), 52 deletions(-)

diff --git a/package/config/conf.c b/package/config/conf.c
index 2062b57..33857ce 100644
--- a/package/config/conf.c
+++ b/package/config/conf.c
@@ -427,7 +427,7 @@ static void check_conf(struct menu *menu)
 				if (sym->name && !sym_is_choice_value(sym)) {
 					printf("CONFIG_%s\n", sym->name);
 				}
-			} else {
+			} else if (input_mode != oldnoconfig) {
 				if (!conf_cnt++)
 					printf(_("*\n* Restart config...\n*\n"));
 				rootEntry = menu_get_parent_menu(menu);
diff --git a/package/config/confdata.c b/package/config/confdata.c
index 1b1fdb7..6455dc2 100644
--- a/package/config/confdata.c
+++ b/package/config/confdata.c
@@ -492,7 +492,9 @@ int conf_write_defconfig(const char *filename)
 			/*
 			 * If symbol is a choice value and equals to the
 			 * default for a choice - skip.
-			 * But only if value is bool and equal to "y" .
+			 * But only if value is bool and equal to "y" and
+			 * choice is not "optional".
+			 * (If choice is "optional" then all values can be "n")
 			 */
 			if (sym_is_choice_value(sym)) {
 				struct symbol *cs;
@@ -500,7 +502,7 @@ int conf_write_defconfig(const char *filename)
 
 				cs = prop_get_symbol(sym_get_choice_prop(sym));
 				ds = sym_choice_default(cs);
-				if (sym == ds) {
+				if (!sym_is_optional(cs) && sym == ds) {
 					if ((sym->type == S_BOOLEAN) &&
 					    sym_get_tristate_value(sym) == yes)
 						goto next_menu;
diff --git a/package/config/expr.h b/package/config/expr.h
index 6ee2e4f..170459c 100644
--- a/package/config/expr.h
+++ b/package/config/expr.h
@@ -165,7 +165,6 @@ struct menu {
 	struct symbol *sym;
 	struct property *prompt;
 	struct expr *dep;
-	struct expr *dir_dep;
 	unsigned int flags;
 	char *help;
 	struct file *file;
diff --git a/package/config/menu.c b/package/config/menu.c
index 7f3b797..edda8b4 100644
--- a/package/config/menu.c
+++ b/package/config/menu.c
@@ -107,7 +107,6 @@ static struct expr *menu_check_dep(struct expr *e)
 void menu_add_dep(struct expr *dep)
 {
 	current_entry->dep = expr_alloc_and(current_entry->dep, menu_check_dep(dep));
-	current_entry->dir_dep = current_entry->dep;
 }
 
 void menu_set_type(int type)
@@ -291,10 +290,6 @@ void menu_finalize(struct menu *parent)
 		for (menu = parent->list; menu; menu = menu->next)
 			menu_finalize(menu);
 	} else if (sym) {
-		/* ignore inherited dependencies for dir_dep */
-		sym->dir_dep.expr = expr_transform(expr_copy(parent->dir_dep));
-		sym->dir_dep.expr = expr_eliminate_dups(sym->dir_dep.expr);
-
 		basedep = parent->prompt ? parent->prompt->visible.expr : NULL;
 		basedep = expr_trans_compare(basedep, E_UNEQUAL, &symbol_no);
 		basedep = expr_eliminate_dups(expr_transform(basedep));
@@ -325,6 +320,8 @@ void menu_finalize(struct menu *parent)
 			parent->next = last_menu->next;
 			last_menu->next = NULL;
 		}
+
+		sym->dir_dep.expr = parent->dep;
 	}
 	for (menu = parent->list; menu; menu = menu->next) {
 		if (sym && sym_is_choice(sym) &&
@@ -566,7 +563,7 @@ void menu_get_ext_help(struct menu *menu, struct gstr *help)
 
 	if (menu_has_help(menu)) {
 		if (sym->name) {
-			str_printf(help, "%s:\n\n", sym->name);
+			str_printf(help, "CONFIG_%s:\n\n", sym->name);
 			str_append(help, _(menu_get_help(menu)));
 			str_append(help, "\n");
 		}
diff --git a/package/config/patches/01-kconfig-kernel-to-buildroot.patch b/package/config/patches/01-kconfig-kernel-to-buildroot.patch
index 9df22d4..08fabc1 100644
--- a/package/config/patches/01-kconfig-kernel-to-buildroot.patch
+++ b/package/config/patches/01-kconfig-kernel-to-buildroot.patch
@@ -1,13 +1,13 @@
 ---
  conf.c              |   12 ++++++------
- confdata.c          |   12 ++++--------
+ confdata.c          |   14 +++++++-------
  gconf.c             |    4 ++--
  gconf.glade         |    2 +-
  mconf.c             |   38 ++++++++++++++++++--------------------
  qconf.cc            |    4 ++--
  zconf.tab.c_shipped |    2 +-
  zconf.y             |    2 +-
- 8 files changed, 35 insertions(+), 41 deletions(-)
+ 8 files changed, 38 insertions(+), 40 deletions(-)
 
 Index: config/conf.c
 ===================================================================
@@ -60,7 +60,7 @@ Index: config/confdata.c
 ===================================================================
 --- config.orig/confdata.c
 +++ config/confdata.c
-@@ -579,7 +579,7 @@
+@@ -581,7 +581,7 @@
  	if (!out)
  		return 1;
  
@@ -69,7 +69,7 @@ Index: config/confdata.c
  	sym_calc_value(sym);
  	time(&now);
  	env = getenv("KCONFIG_NOTIMESTAMP");
-@@ -588,7 +588,7 @@
+@@ -590,7 +590,7 @@
  
  	fprintf(out, _("#\n"
  		       "# Automatically generated make config: don't edit\n"
@@ -78,7 +78,7 @@ Index: config/confdata.c
  		       "%s%s"
  		       "#\n"),
  		     sym_get_string_value(sym),
-@@ -802,25 +802,25 @@
+@@ -804,25 +804,25 @@
  		return 1;
  	}
  
diff --git a/package/config/patches/02-cpp-comments-to-c-comments.patch b/package/config/patches/02-cpp-comments-to-c-comments.patch
index a801319..cb27056 100644
--- a/package/config/patches/02-cpp-comments-to-c-comments.patch
+++ b/package/config/patches/02-cpp-comments-to-c-comments.patch
@@ -2,10 +2,10 @@
  expr.c |   42 +++++++++++++++++++++---------------------
  1 file changed, 21 insertions(+), 21 deletions(-)
 
-Index: config.clean/expr.c
+Index: config/expr.c
 ===================================================================
---- config.clean.orig/expr.c
-+++ config.clean/expr.c
+--- config.orig/expr.c
++++ config/expr.c
 @@ -331,7 +331,7 @@
  		e->right.expr = expr_trans_bool(e->right.expr);
  		break;
diff --git a/package/config/patches/03-change-config-option-prefix.patch b/package/config/patches/03-change-config-option-prefix.patch
index dd645b1..9e93f68 100644
--- a/package/config/patches/03-change-config-option-prefix.patch
+++ b/package/config/patches/03-change-config-option-prefix.patch
@@ -128,7 +128,7 @@ Index: config/confdata.c
  		break;
  	case S_OTHER:
  	case S_UNKNOWN:
-@@ -838,14 +835,14 @@
+@@ -840,14 +837,14 @@
  			case no:
  				break;
  			case mod:
@@ -147,7 +147,7 @@ Index: config/confdata.c
  				break;
  			}
  			break;
-@@ -855,12 +852,12 @@
+@@ -857,12 +854,12 @@
  		case S_HEX:
  			str = sym_get_string_value(sym);
  			if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
diff --git a/package/config/patches/05-really-clean-everything.patch b/package/config/patches/05-really-clean-everything.patch
index f8d8a39..50575e4 100644
--- a/package/config/patches/05-really-clean-everything.patch
+++ b/package/config/patches/05-really-clean-everything.patch
@@ -2,10 +2,10 @@
  Makefile |   14 ++++++++++----
  1 file changed, 10 insertions(+), 4 deletions(-)
 
-Index: config.new/Makefile
+Index: config/Makefile
 ===================================================================
---- config.new.orig/Makefile
-+++ config.new/Makefile
+--- config.orig/Makefile
++++ config/Makefile
 @@ -199,10 +199,16 @@
  gconf-objs	:= gconf.o kconfig_load.o zconf.tab.o
  endif
diff --git a/package/config/patches/08-make-write-deps.patch b/package/config/patches/08-make-write-deps.patch
index b104134..686038a 100644
--- a/package/config/patches/08-make-write-deps.patch
+++ b/package/config/patches/08-make-write-deps.patch
@@ -2,10 +2,10 @@
  util.c |  117 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
  1 file changed, 116 insertions(+), 1 deletion(-)
 
-Index: config.clean/util.c
+Index: config/util.c
 ===================================================================
---- config.clean.orig/util.c
-+++ config.clean/util.c
+--- config.orig/util.c
++++ config/util.c
 @@ -26,6 +26,121 @@
  	return file;
  }
diff --git a/package/config/patches/09-implement-kconfig-probability.patch b/package/config/patches/09-implement-kconfig-probability.patch
index 5983779..6220931 100644
--- a/package/config/patches/09-implement-kconfig-probability.patch
+++ b/package/config/patches/09-implement-kconfig-probability.patch
@@ -6,7 +6,7 @@ Index: config/confdata.c
 ===================================================================
 --- config.orig/confdata.c
 +++ config/confdata.c
-@@ -981,7 +981,16 @@
+@@ -983,7 +983,16 @@
  void conf_set_all_new_symbols(enum conf_def_mode mode)
  {
  	struct symbol *sym, *csym;
@@ -24,7 +24,7 @@ Index: config/confdata.c
  
  	for_all_symbols(i, sym) {
  		if (sym_has_value(sym))
-@@ -1000,8 +1009,15 @@
+@@ -1002,8 +1011,15 @@
  				sym->def[S_DEF_USER].tri = no;
  				break;
  			case def_random:
diff --git a/package/config/patches/11-use-mktemp-for-lxdialog.patch b/package/config/patches/11-use-mktemp-for-lxdialog.patch
index 16fd8bf..60190b8 100644
--- a/package/config/patches/11-use-mktemp-for-lxdialog.patch
+++ b/package/config/patches/11-use-mktemp-for-lxdialog.patch
@@ -2,10 +2,10 @@
  lxdialog/check-lxdialog.sh |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: config.clean/lxdialog/check-lxdialog.sh
+Index: config/lxdialog/check-lxdialog.sh
 ===================================================================
---- config.clean.orig/lxdialog/check-lxdialog.sh
-+++ config.clean/lxdialog/check-lxdialog.sh
+--- config.orig/lxdialog/check-lxdialog.sh
++++ config/lxdialog/check-lxdialog.sh
 @@ -31,7 +31,7 @@
  }
  
diff --git a/package/config/patches/12-fix-glade-file-path.patch b/package/config/patches/12-fix-glade-file-path.patch
index 10c7e91..140201c 100644
--- a/package/config/patches/12-fix-glade-file-path.patch
+++ b/package/config/patches/12-fix-glade-file-path.patch
@@ -2,10 +2,10 @@
  gconf.c |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: config.new/gconf.c
+Index: config/gconf.c
 ===================================================================
---- config.new.orig/gconf.c
-+++ config.new/gconf.c
+--- config.orig/gconf.c
++++ config/gconf.c
 @@ -1525,7 +1525,7 @@
  	/* Determine GUI path */
  	env = getenv(SRCTREE);
diff --git a/package/config/patches/14-support-out-of-tree-config.patch b/package/config/patches/14-support-out-of-tree-config.patch
index 3c2a523..763e063 100644
--- a/package/config/patches/14-support-out-of-tree-config.patch
+++ b/package/config/patches/14-support-out-of-tree-config.patch
@@ -31,7 +31,7 @@ Index: config/confdata.c
  }
  
  static char *conf_expand_value(const char *in)
-@@ -542,6 +540,9 @@
+@@ -544,6 +542,9 @@
  	int use_timestamp = 1;
  	char *env;
  
@@ -41,7 +41,7 @@ Index: config/confdata.c
  	dirname[0] = 0;
  	if (name && name[0]) {
  		struct stat st;
-@@ -658,6 +659,7 @@
+@@ -660,6 +661,7 @@
  {
  	const char *name;
  	char path[128];
@@ -49,7 +49,7 @@ Index: config/confdata.c
  	char *s, *d, c;
  	struct symbol *sym;
  	struct stat sb;
-@@ -666,8 +668,20 @@
+@@ -668,8 +670,20 @@
  	name = conf_get_autoconfig_name();
  	conf_read_simple(name, S_DEF_AUTO);
  
@@ -72,7 +72,7 @@ Index: config/confdata.c
  
  	res = 0;
  	for_all_symbols(i, sym) {
-@@ -760,9 +774,11 @@
+@@ -762,9 +776,11 @@
  		close(fd);
  	}
  out:
@@ -87,7 +87,7 @@ Index: config/confdata.c
  	return res;
  }
  
-@@ -774,25 +790,38 @@
+@@ -776,25 +792,38 @@
  	FILE *out, *tristate, *out_h;
  	time_t now;
  	int i;
@@ -130,7 +130,7 @@ Index: config/confdata.c
  	if (!out_h) {
  		fclose(out);
  		fclose(tristate);
-@@ -815,8 +844,7 @@
+@@ -817,8 +846,7 @@
  	fprintf(out_h, "/*\n"
  		       " * Automatically generated C config: don't edit\n"
  		       " * %s"
@@ -140,7 +140,7 @@ Index: config/confdata.c
  		       ctime(&now));
  
  	for_all_symbols(i, sym) {
-@@ -870,19 +898,22 @@
+@@ -872,19 +900,22 @@
  	name = getenv("KCONFIG_AUTOHEADER");
  	if (!name)
  		name = "include/generated/autoconf.h";
diff --git a/package/config/patches/15-use-PATH_MAX-for-path-buffer.patch b/package/config/patches/15-use-PATH_MAX-for-path-buffer.patch
index 4be6cb6..816aa44 100644
--- a/package/config/patches/15-use-PATH_MAX-for-path-buffer.patch
+++ b/package/config/patches/15-use-PATH_MAX-for-path-buffer.patch
@@ -11,14 +11,14 @@ Signed-off-by: Will Newton <will.newton@imgtec.com>
 Acked-by: WANG Cong <xiyou.wangcong@gmail.com>
 Signed-off-by: Michal Marek <mmarek@suse.cz>
 ---
- scripts/kconfig/confdata.c |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
+ confdata.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/confdata.c b/confdata.c
-index 35c08ec..96110ea 100644
---- a/confdata.c
-+++ b/confdata.c
-@@ -534,7 +534,7 @@ int conf_write(const char *name)
+Index: config/confdata.c
+===================================================================
+--- config.orig/confdata.c
++++ config/confdata.c
+@@ -536,7 +536,7 @@
  	struct menu *menu;
  	const char *basename;
  	const char *str;
@@ -27,7 +27,7 @@ index 35c08ec..96110ea 100644
  	enum symbol_type type;
  	time_t now;
  	int use_timestamp = 1;
-@@ -658,7 +658,7 @@ next:
+@@ -660,7 +660,7 @@
  static int conf_split_config(void)
  {
  	const char *name;
@@ -36,6 +36,3 @@ index 35c08ec..96110ea 100644
  	char *opwd, *dir, *_name;
  	char *s, *d, c;
  	struct symbol *sym;
--- 
-1.7.1
-
diff --git a/package/config/symbol.c b/package/config/symbol.c
index e95718f..1f8b305 100644
--- a/package/config/symbol.c
+++ b/package/config/symbol.c
@@ -350,6 +350,7 @@ void sym_calc_value(struct symbol *sym)
 				}
 			}
 		calc_newval:
+#if 0
 			if (sym->dir_dep.tri == no && sym->rev_dep.tri != no) {
 				fprintf(stderr, "warning: (");
 				expr_fprint(sym->rev_dep.expr, stderr);
@@ -358,6 +359,7 @@ void sym_calc_value(struct symbol *sym)
 				expr_fprint(sym->dir_dep.expr, stderr);
 				fprintf(stderr, ")\n");
 			}
+#endif
 			newval.tri = EXPR_OR(newval.tri, sym->rev_dep.tri);
 		}
 		if (newval.tri == mod && sym_get_type(sym) == S_BOOLEAN)
@@ -937,6 +939,8 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 		sym = stack->sym;
 		next_sym = stack->next ? stack->next->sym : last_sym;
 		prop = stack->prop;
+		if (prop == NULL)
+			prop = stack->sym->prop;
 
 		/* for choice values find the menu entry (used below) */
 		if (sym_is_choice(sym) || sym_is_choice_value(sym)) {
-- 
1.7.3.4
