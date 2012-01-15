From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Jan 2012 20:48:04 +0100
Subject: [Buildroot] [git commit] kconfig: sync with linux-3.0
Message-ID: <20120116093410.6B43D90356@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21f540be4e247b4468d0e8adbf9e3a7575f8a085
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And drop unused make-write-deps patch.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/kconfig/Makefile                           |   68 ++++------
 support/kconfig/conf.c                             |    2 +-
 support/kconfig/confdata.c                         |   20 +---
 support/kconfig/expr.h                             |    4 -
 support/kconfig/gconf.c                            |   12 +-
 support/kconfig/lex.zconf.c_shipped                |   33 +++--
 support/kconfig/nconf.c                            |   14 +-
 .../patches/03-change-config-option-prefix.patch   |   22 ++--
 .../patches/05-really-clean-everything.patch       |   29 ----
 .../patches/06-br-build-system-integration.patch   |   47 +++----
 support/kconfig/patches/08-make-write-deps.patch   |  139 --------------------
 .../patches/09-implement-kconfig-probability.patch |   10 +-
 .../kconfig/patches/12-fix-glade-file-path.patch   |    2 +-
 .../patches/14-support-out-of-tree-config.patch    |   42 +++---
 support/kconfig/patches/series                     |    2 -
 support/kconfig/qconf.cc                           |    5 +-
 support/kconfig/streamline_config.pl               |    2 +-
 support/kconfig/util.c                             |  117 +----------------
 support/kconfig/zconf.l                            |   33 +++--
 19 files changed, 149 insertions(+), 454 deletions(-)

diff --git a/support/kconfig/Makefile b/support/kconfig/Makefile
index ece2a82..f2def76 100644
--- a/support/kconfig/Makefile
+++ b/support/kconfig/Makefile
@@ -77,14 +77,15 @@ localyesconfig: $(obj)/streamline_config.pl $(obj)/conf
 # The symlink is used to repair a deficiency in arch/um
 update-po-config: $(obj)/kxgettext $(obj)/gconf.glade.h
 	$(Q)echo "  GEN config"
-	$(Q)xgettext --default-domain=linux              \
-	    --add-comments --keyword=_ --keyword=N_      \
-	    --from-code=UTF-8                            \
-	    --files-from=scripts/kconfig/POTFILES.in     \
+	$(Q)xgettext --default-domain=linux                         \
+	    --add-comments --keyword=_ --keyword=N_                 \
+	    --from-code=UTF-8                                       \
+	    --files-from=$(srctree)/scripts/kconfig/POTFILES.in     \
+	    --directory=$(srctree) --directory=$(objtree)           \
 	    --output $(obj)/config.pot
 	$(Q)sed -i s/CHARSET/UTF-8/ $(obj)/config.pot
-	$(Q)ln -fs Kconfig.i386 arch/um/Kconfig.arch
-	$(Q)(for i in `ls arch/*/Kconfig`;               \
+	$(Q)ln -fs Kconfig.x86 arch/um/Kconfig
+	$(Q)(for i in `ls $(srctree)/arch/*/Kconfig`;    \
 	    do                                           \
 		echo "  GEN $$i";                        \
 		$(obj)/kxgettext $$i                     \
@@ -92,7 +93,7 @@ update-po-config: $(obj)/kxgettext $(obj)/gconf.glade.h
 	    done )
 	$(Q)msguniq --sort-by-file --to-code=UTF-8 $(obj)/config.pot \
 	    --output $(obj)/linux.pot
-	$(Q)rm -f arch/um/Kconfig.arch
+	$(Q)rm -f $(srctree)/arch/um/Kconfig
 	$(Q)rm -f $(obj)/config.pot
 
 PHONY += allnoconfig allyesconfig allmodconfig alldefconfig randconfig
@@ -168,56 +169,44 @@ conf-objs	:= conf.o  zconf.tab.o
 mconf-objs     := mconf.o zconf.tab.o $(lxdialog)
 nconf-objs     := nconf.o zconf.tab.o nconf.gui.o
 kxgettext-objs	:= kxgettext.o zconf.tab.o
+qconf-cxxobjs	:= qconf.o
+qconf-objs	:= kconfig_load.o zconf.tab.o
+gconf-objs	:= gconf.o kconfig_load.o zconf.tab.o
 
-hostprogs-y := conf qconf gconf kxgettext
+hostprogs-y := conf
 
-ifeq ($(MAKECMDGOALS),nconfig)
+ifeq ($(MAKECMDGOALS),nconf)
 	hostprogs-y += nconf
 endif
-ifeq ($(findstring nconf,$(MAKECMDGOALS)),nconf)
-       hostprogs-y += nconf
-endif
 
-ifeq ($(MAKECMDGOALS),menuconfig)
+ifeq ($(MAKECMDGOALS),mconf)
 	hostprogs-y += mconf
 endif
-ifeq ($(findstring mconf,$(MAKECMDGOALS)),mconf)
-       hostprogs-y += mconf
-endif
 
-ifeq ($(MAKECMDGOALS),xconfig)
-	qconf-target := 1
-endif
-ifeq ($(findstring qconf,$(MAKECMDGOALS)),qconf)
-	qconf-target := 1
+ifeq ($(MAKECMDGOALS),update-po-config)
+	hostprogs-y += kxgettext
 endif
 
-ifeq ($(MAKECMDGOALS),gconfig)
-	gconf-target := 1
+ifeq ($(MAKECMDGOALS),qconf)
+	qconf-target := 1
 endif
-ifeq ($(findstring gconf,$(MAKECMDGOALS)),gconf)
+ifeq ($(MAKECMDGOALS),gconf)
 	gconf-target := 1
 endif
 
+
 ifeq ($(qconf-target),1)
-qconf-cxxobjs	:= qconf.o
-qconf-objs	:= kconfig_load.o zconf.tab.o
+	hostprogs-y += qconf
 endif
 
 ifeq ($(gconf-target),1)
-gconf-objs	:= gconf.o kconfig_load.o zconf.tab.o
+	hostprogs-y += gconf
 endif
 
-clean-files := lkc_defs.h qconf.moc .tmp_qtcheck \
-               .tmp_gtkcheck zconf.tab.c lex.zconf.c zconf.hash.c gconf.glade.h
-clean-files += config.pot linux.pot
-clean-files += conf $(conf-objs)
-clean-files += mconf $(mconf-objs)
-clean-files += nconf $(nconf-objs)
-clean-files += qconf qconf.o
-clean-files += gconf gconf.o
-clean-files += kconfig_load.o zconf.tab.o
-clean-files += $(kxgettext-objs)
+clean-files	:= lkc_defs.h qconf.moc .tmp_qtcheck .tmp_gtkcheck
+clean-files	+= zconf.tab.c lex.zconf.c zconf.hash.c gconf.glade.h
+clean-files     += mconf qconf gconf nconf
+clean-files     += config.pot linux.pot
 
 # Check that we have the required ncurses stuff installed for lxdialog (menuconfig)
 PHONY += $(obj)/dochecklxdialog
@@ -339,11 +328,12 @@ $(obj)/%.moc: $(src)/%.h
 	$(KC_QT_MOC) -i $< -o $@
 
 $(obj)/lkc_defs.h: $(src)/lkc_proto.h
-	sed < $< > $@ 's/P(\([^,]*\),.*/#define \1 (\*\1_p)/'
+	$(Q)sed < $< > $@ 's/P(\([^,]*\),.*/#define \1 (\*\1_p)/'
 
 # Extract gconf menu items for I18N support
 $(obj)/gconf.glade.h: $(obj)/gconf.glade
-	intltool-extract --type=gettext/glade $(obj)/gconf.glade
+	$(Q)intltool-extract --type=gettext/glade --srcdir=$(srctree) \
+	$(obj)/gconf.glade
 
 ###
 # The following requires flex/bison/gperf
diff --git a/support/kconfig/conf.c b/support/kconfig/conf.c
index 652e079..ed9402a 100644
--- a/support/kconfig/conf.c
+++ b/support/kconfig/conf.c
@@ -332,7 +332,7 @@ static int conf_choice(struct menu *menu)
 		}
 		if (!child)
 			continue;
-		if (line[strlen(line) - 1] == '?') {
+		if (line[0] && line[strlen(line) - 1] == '?') {
 			print_help(child);
 			continue;
 		}
diff --git a/support/kconfig/confdata.c b/support/kconfig/confdata.c
index c9f13ee..54f20ca 100644
--- a/support/kconfig/confdata.c
+++ b/support/kconfig/confdata.c
@@ -559,8 +559,6 @@ int conf_write(const char *name)
 	const char *basename;
 	const char *str;
 	char dirname[PATH_MAX+1], tmpname[PATH_MAX+1], newname[PATH_MAX+1];
-	time_t now;
-	int use_timestamp = 1;
 	char *env;
 
 	if (!name)
@@ -600,19 +598,11 @@ int conf_write(const char *name)
 	if (!out)
 		return 1;
 
-	time(&now);
-	env = getenv("KCONFIG_NOTIMESTAMP");
-	if (env && *env)
-		use_timestamp = 0;
-
 	fprintf(out, _("#\n"
 		       "# Automatically generated make config: don't edit\n"
 		       "# %s\n"
-		       "%s%s"
 		       "#\n"),
-		     rootmenu.prompt->text,
-		     use_timestamp ? "# " : "",
-		     use_timestamp ? ctime(&now) : "");
+		     rootmenu.prompt->text);
 
 	if (!conf_get_changed())
 		sym_clear_all_valid();
@@ -801,7 +791,6 @@ int conf_write_autoconf(void)
 	const char *str;
 	const char *name;
 	FILE *out, *tristate, *out_h;
-	time_t now;
 	int i;
 	char dir[PATH_MAX+1], buf[PATH_MAX+1];
 	char *s;
@@ -841,22 +830,19 @@ int conf_write_autoconf(void)
 		return 1;
 	}
 
-	time(&now);
 	fprintf(out, "#\n"
 		     "# Automatically generated make config: don't edit\n"
 		     "# %s\n"
-		     "# %s"
 		     "#\n",
-		     rootmenu.prompt->text, ctime(&now));
+		     rootmenu.prompt->text);
 	fprintf(tristate, "#\n"
 			  "# Automatically generated - do not edit\n"
 			  "\n");
 	fprintf(out_h, "/*\n"
 		       " * Automatically generated C config: don't edit\n"
 		       " * %s\n"
-		       " * %s"
 		       " */\n",
-		       rootmenu.prompt->text, ctime(&now));
+		       rootmenu.prompt->text);
 
 	for_all_symbols(i, sym) {
 		sym_calc_value(sym);
diff --git a/support/kconfig/expr.h b/support/kconfig/expr.h
index 3d238db..16bfae2 100644
--- a/support/kconfig/expr.h
+++ b/support/kconfig/expr.h
@@ -20,12 +20,8 @@ struct file {
 	struct file *parent;
 	const char *name;
 	int lineno;
-	int flags;
 };
 
-#define FILE_BUSY		0x0001
-#define FILE_SCANNED		0x0002
-
 typedef enum tristate {
 	no, mod, yes
 } tristate;
diff --git a/support/kconfig/gconf.c b/support/kconfig/gconf.c
index f9daf98..79479c3 100644
--- a/support/kconfig/gconf.c
+++ b/support/kconfig/gconf.c
@@ -253,7 +253,7 @@ void init_left_tree(void)
 
 	gtk_tree_view_set_model(view, model1);
 	gtk_tree_view_set_headers_visible(view, TRUE);
-	gtk_tree_view_set_rules_hint(view, FALSE);
+	gtk_tree_view_set_rules_hint(view, TRUE);
 
 	column = gtk_tree_view_column_new();
 	gtk_tree_view_append_column(view, column);
@@ -298,7 +298,7 @@ void init_right_tree(void)
 
 	gtk_tree_view_set_model(view, model2);
 	gtk_tree_view_set_headers_visible(view, TRUE);
-	gtk_tree_view_set_rules_hint(view, FALSE);
+	gtk_tree_view_set_rules_hint(view, TRUE);
 
 	column = gtk_tree_view_column_new();
 	gtk_tree_view_append_column(view, column);
@@ -756,7 +756,6 @@ void on_load_clicked(GtkButton * button, gpointer user_data)
 void on_single_clicked(GtkButton * button, gpointer user_data)
 {
 	view_mode = SINGLE_VIEW;
-	gtk_paned_set_position(GTK_PANED(hpaned), 0);
 	gtk_widget_hide(tree1_w);
 	current = &rootmenu;
 	display_tree_part();
@@ -782,7 +781,6 @@ void on_split_clicked(GtkButton * button, gpointer user_data)
 void on_full_clicked(GtkButton * button, gpointer user_data)
 {
 	view_mode = FULL_VIEW;
-	gtk_paned_set_position(GTK_PANED(hpaned), 0);
 	gtk_widget_hide(tree1_w);
 	if (tree2)
 		gtk_tree_store_clear(tree2);
@@ -1444,6 +1442,12 @@ static void display_tree(struct menu *menu)
                 if (((menu != &rootmenu) && !(menu->flags & MENU_ROOT))
 		    || (view_mode == FULL_VIEW)
 		    || (view_mode == SPLIT_VIEW))*/
+
+		/* Change paned position if the view is not in 'split mode' */
+		if (view_mode == SINGLE_VIEW || view_mode == FULL_VIEW) {
+			gtk_paned_set_position(GTK_PANED(hpaned), 0);
+		}
+
 		if (((view_mode == SINGLE_VIEW) && (menu->flags & MENU_ROOT))
 		    || (view_mode == FULL_VIEW)
 		    || (view_mode == SPLIT_VIEW)) {
diff --git a/support/kconfig/lex.zconf.c_shipped b/support/kconfig/lex.zconf.c_shipped
index 6eb0397..d918291 100644
--- a/support/kconfig/lex.zconf.c_shipped
+++ b/support/kconfig/lex.zconf.c_shipped
@@ -2363,11 +2363,11 @@ void zconf_initscan(const char *name)
 
 	current_file = file_lookup(name);
 	current_file->lineno = 1;
-	current_file->flags = FILE_BUSY;
 }
 
 void zconf_nextfile(const char *name)
 {
+	struct file *iter;
 	struct file *file = file_lookup(name);
 	struct buffer *buf = malloc(sizeof(*buf));
 	memset(buf, 0, sizeof(*buf));
@@ -2383,18 +2383,25 @@ void zconf_nextfile(const char *name)
 	buf->parent = current_buf;
 	current_buf = buf;
 
-	if (file->flags & FILE_BUSY) {
-		printf("%s:%d: do not source '%s' from itself\n",
-		       zconf_curname(), zconf_lineno(), name);
-		exit(1);
-	}
-	if (file->flags & FILE_SCANNED) {
-		printf("%s:%d: file '%s' is already sourced from '%s'\n",
-		       zconf_curname(), zconf_lineno(), name,
-		       file->parent->name);
-		exit(1);
+	for (iter = current_file->parent; iter; iter = iter->parent ) {
+		if (!strcmp(current_file->name,iter->name) ) {
+			printf("%s:%d: recursive inclusion detected. "
+			       "Inclusion path:\n  current file : '%s'\n",
+			       zconf_curname(), zconf_lineno(),
+			       zconf_curname());
+			iter = current_file->parent;
+			while (iter && \
+			       strcmp(iter->name,current_file->name)) {
+				printf("  included from: '%s:%d'\n",
+				       iter->name, iter->lineno-1);
+				iter = iter->parent;
+			}
+			if (iter)
+				printf("  included from: '%s:%d'\n",
+				       iter->name, iter->lineno+1);
+			exit(1);
+		}
 	}
-	file->flags |= FILE_BUSY;
 	file->lineno = 1;
 	file->parent = current_file;
 	current_file = file;
@@ -2404,8 +2411,6 @@ static void zconf_endfile(void)
 {
 	struct buffer *parent;
 
-	current_file->flags |= FILE_SCANNED;
-	current_file->flags &= ~FILE_BUSY;
 	current_file = current_file->parent;
 
 	parent = current_buf->parent;
diff --git a/support/kconfig/nconf.c b/support/kconfig/nconf.c
index db56377..488dd74 100644
--- a/support/kconfig/nconf.c
+++ b/support/kconfig/nconf.c
@@ -373,18 +373,18 @@ static void print_function_line(void)
 	const int skip = 1;
 
 	for (i = 0; i < function_keys_num; i++) {
-		wattrset(main_window, attributes[FUNCTION_HIGHLIGHT]);
+		(void) wattrset(main_window, attributes[FUNCTION_HIGHLIGHT]);
 		mvwprintw(main_window, LINES-3, offset,
 				"%s",
 				function_keys[i].key_str);
-		wattrset(main_window, attributes[FUNCTION_TEXT]);
+		(void) wattrset(main_window, attributes[FUNCTION_TEXT]);
 		offset += strlen(function_keys[i].key_str);
 		mvwprintw(main_window, LINES-3,
 				offset, "%s",
 				function_keys[i].func);
 		offset += strlen(function_keys[i].func) + skip;
 	}
-	wattrset(main_window, attributes[NORMAL]);
+	(void) wattrset(main_window, attributes[NORMAL]);
 }
 
 /* help */
@@ -953,16 +953,16 @@ static void show_menu(const char *prompt, const char *instructions,
 	current_instructions = instructions;
 
 	clear();
-	wattrset(main_window, attributes[NORMAL]);
+	(void) wattrset(main_window, attributes[NORMAL]);
 	print_in_middle(stdscr, 1, 0, COLS,
 			menu_backtitle,
 			attributes[MAIN_HEADING]);
 
-	wattrset(main_window, attributes[MAIN_MENU_BOX]);
+	(void) wattrset(main_window, attributes[MAIN_MENU_BOX]);
 	box(main_window, 0, 0);
-	wattrset(main_window, attributes[MAIN_MENU_HEADING]);
+	(void) wattrset(main_window, attributes[MAIN_MENU_HEADING]);
 	mvwprintw(main_window, 0, 3, " %s ", prompt);
-	wattrset(main_window, attributes[NORMAL]);
+	(void) wattrset(main_window, attributes[NORMAL]);
 
 	set_menu_items(curses_menu, curses_menu_items);
 
diff --git a/support/kconfig/patches/03-change-config-option-prefix.patch b/support/kconfig/patches/03-change-config-option-prefix.patch
index d387236..4c51eaa 100644
--- a/support/kconfig/patches/03-change-config-option-prefix.patch
+++ b/support/kconfig/patches/03-change-config-option-prefix.patch
@@ -4,10 +4,10 @@
  menu.c     |    2 +-
  3 files changed, 31 insertions(+), 30 deletions(-)
 
-Index: config/confdata.c
+Index: kconfig/confdata.c
 ===================================================================
---- config.orig/confdata.c
-+++ config/confdata.c
+--- kconfig.orig/confdata.c
++++ kconfig/confdata.c
 @@ -12,6 +12,7 @@
  #include <string.h>
  #include <time.h>
@@ -125,7 +125,7 @@ Index: config/confdata.c
  		break;
  	case S_OTHER:
  	case S_UNKNOWN:
-@@ -844,17 +845,17 @@
+@@ -830,17 +831,17 @@
  			case no:
  				break;
  			case mod:
@@ -151,7 +151,7 @@ Index: config/confdata.c
  				break;
  			}
  			break;
-@@ -864,14 +865,14 @@
+@@ -850,14 +851,14 @@
  		case S_HEX:
  			str = sym_get_string_value(sym);
  			if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
@@ -170,10 +170,10 @@ Index: config/confdata.c
  			break;
  		default:
  			break;
-Index: config/lkc.h
+Index: kconfig/lkc.h
 ===================================================================
---- config.orig/lkc.h
-+++ config/lkc.h
+--- kconfig.orig/lkc.h
++++ kconfig/lkc.h
 @@ -42,7 +42,7 @@
  #define N_(text) (text)
  
@@ -183,10 +183,10 @@ Index: config/lkc.h
  #endif
  
  #define TF_COMMAND	0x0001
-Index: config/menu.c
+Index: kconfig/menu.c
 ===================================================================
---- config.orig/menu.c
-+++ config/menu.c
+--- kconfig.orig/menu.c
++++ kconfig/menu.c
 @@ -597,7 +597,7 @@
  
  	if (menu_has_help(menu)) {
diff --git a/support/kconfig/patches/05-really-clean-everything.patch b/support/kconfig/patches/05-really-clean-everything.patch
deleted file mode 100644
index a151754..0000000
--- a/support/kconfig/patches/05-really-clean-everything.patch
+++ /dev/null
@@ -1,29 +0,0 @@
----
- Makefile |   14 ++++++++++----
- 1 file changed, 10 insertions(+), 4 deletions(-)
-
-Index: config/Makefile
-===================================================================
---- config.orig/Makefile
-+++ config/Makefile
-@@ -196,10 +196,16 @@
- gconf-objs	:= gconf.o kconfig_load.o zconf.tab.o
- endif
- 
--clean-files	:= lkc_defs.h qconf.moc .tmp_qtcheck \
--		   .tmp_gtkcheck zconf.tab.c lex.zconf.c zconf.hash.c gconf.glade.h
--clean-files     += mconf qconf gconf nconf
--clean-files     += config.pot linux.pot
-+clean-files := lkc_defs.h qconf.moc .tmp_qtcheck \
-+               .tmp_gtkcheck zconf.tab.c lex.zconf.c zconf.hash.c gconf.glade.h
-+clean-files += config.pot linux.pot
-+clean-files += conf $(conf-objs)
-+clean-files += mconf $(mconf-objs)
-+clean-files += nconf $(nconf-objs)
-+clean-files += qconf qconf.o
-+clean-files += gconf gconf.o
-+clean-files += kconfig_load.o zconf.tab.o
-+clean-files += $(kxgettext-objs)
- 
- # Check that we have the required ncurses stuff installed for lxdialog (menuconfig)
- PHONY += $(obj)/dochecklxdialog
diff --git a/support/kconfig/patches/06-br-build-system-integration.patch b/support/kconfig/patches/06-br-build-system-integration.patch
index 8a27e25..feb166d 100644
--- a/support/kconfig/patches/06-br-build-system-integration.patch
+++ b/support/kconfig/patches/06-br-build-system-integration.patch
@@ -1,40 +1,35 @@
 ---
- Makefile |   14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
+ Makefile |    8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
-Index: config/Makefile
+Index: kconfig/Makefile
 ===================================================================
---- config.orig/Makefile
-+++ config/Makefile
-@@ -174,18 +174,30 @@
- ifeq ($(MAKECMDGOALS),nconfig)
+--- kconfig.orig/Makefile
++++ kconfig/Makefile
+@@ -175,11 +175,11 @@
+ 
+ hostprogs-y := conf
+ 
+-ifeq ($(MAKECMDGOALS),nconfig)
++ifeq ($(MAKECMDGOALS),nconf)
  	hostprogs-y += nconf
  endif
-+ifeq ($(findstring nconf,$(MAKECMDGOALS)),nconf)
-+       hostprogs-y += nconf
-+endif
  
- ifeq ($(MAKECMDGOALS),menuconfig)
+-ifeq ($(MAKECMDGOALS),menuconfig)
++ifeq ($(MAKECMDGOALS),mconf)
  	hostprogs-y += mconf
  endif
-+ifeq ($(findstring mconf,$(MAKECMDGOALS)),mconf)
-+       hostprogs-y += mconf
-+endif
  
- ifeq ($(MAKECMDGOALS),xconfig)
+@@ -187,10 +187,10 @@
+ 	hostprogs-y += kxgettext
+ endif
+ 
+-ifeq ($(MAKECMDGOALS),xconfig)
++ifeq ($(MAKECMDGOALS),qconf)
  	qconf-target := 1
  endif
-+ifeq ($(findstring qconf,$(MAKECMDGOALS)),qconf)
-+	qconf-target := 1
-+endif
-+
- ifeq ($(MAKECMDGOALS),gconfig)
+-ifeq ($(MAKECMDGOALS),gconfig)
++ifeq ($(MAKECMDGOALS),gconf)
  	gconf-target := 1
  endif
--
-+ifeq ($(findstring gconf,$(MAKECMDGOALS)),gconf)
-+	gconf-target := 1
-+endif
  
- ifeq ($(qconf-target),1)
- qconf-cxxobjs	:= qconf.o
diff --git a/support/kconfig/patches/08-make-write-deps.patch b/support/kconfig/patches/08-make-write-deps.patch
deleted file mode 100644
index e5a21c3..0000000
--- a/support/kconfig/patches/08-make-write-deps.patch
+++ /dev/null
@@ -1,139 +0,0 @@
----
- util.c |  117 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
- 1 file changed, 116 insertions(+), 1 deletion(-)
-
-Index: kconfig/util.c
-===================================================================
---- kconfig.orig/util.c
-+++ kconfig/util.c
-@@ -29,6 +29,121 @@
- 	return file;
- }
- 
-+static char* br2_symbol_printer(const char * const in)
-+{
-+	ssize_t i, j, len = strlen(in);
-+	char *ret;
-+	if (len < 1)
-+		return NULL;
-+	ret = malloc(len+1);
-+	if (!ret) {
-+		printf("Out of memory!");
-+		exit(1);
-+	}
-+	memset(ret, 0, len+1);
-+	i = j = 0;
-+	if (strncmp("BR2_", in, 4) == 0)
-+		i += 4;
-+	if (strncmp("PACKAGE_", in + i, 8) == 0)
-+		i += 8;
-+	else if (strncmp("TARGET_", in + i, 7) == 0)
-+		i += 7;
-+	while (i <= len)
-+		ret[j++] = tolower(in[i++]);
-+	return ret;
-+}
-+
-+/* write dependencies of the individual config-symbols */
-+static int write_make_deps(const char *name)
-+{
-+	char *str;
-+	char dir[PATH_MAX+1], buf[PATH_MAX+1], buf2[PATH_MAX+1];
-+	struct menu *menu;
-+	struct symbol *sym;
-+	struct property *prop, *p;
-+	unsigned done;
-+	const char * const name_tmp = "..make.deps.tmp";
-+	FILE *out;
-+	if (!name)
-+		name = ".auto.deps";
-+
-+	strcpy(dir, conf_get_configname());
-+	str = strrchr(dir, '/');
-+	if (str)
-+		str[1] = 0;
-+	else
-+		dir[0] = 0;
-+
-+	sprintf(buf, "%s%s", dir, name_tmp);
-+	out = fopen(buf, "w");
-+	if (!out)
-+		return 1;
-+	fprintf(out, "# ATTENTION! This does not handle 'depends', just 'select'! \n"
-+		"# See support/kconfig/util.c write_make_deps()\n#\n");
-+	menu = &rootmenu;//rootmenu.list;
-+	while (menu) {
-+		sym = menu->sym;
-+		if (!sym) {
-+			if (!menu_is_visible(menu))
-+				goto next;
-+		} else if (!(sym->flags & SYMBOL_CHOICE)) {
-+			sym_calc_value(sym);
-+			if (sym->type == S_BOOLEAN
-+			    && sym_get_tristate_value(sym) != no) {
-+			    done = 0;
-+			    for_all_prompts(sym, prop) {
-+			        struct expr *e;
-+//printf("\nname=%s\n", sym->name);
-+			        for_all_properties(sym, p, P_SELECT) {
-+				    e = p->expr;
-+				    if (e && e->left.sym->name) {
-+				        if (!done) {
-+					    fprintf(out, "%s: $(BASE_TARGETS)", br2_symbol_printer(sym->name));
-+					    done = 1;
-+					}
-+//printf("SELECTS %s\n",e->left.sym->name);
-+					fprintf(out, " %s",br2_symbol_printer(e->left.sym->name));
-+				    }
-+				}
-+				if (done)
-+				    fprintf(out, "\n");
-+#if 0
-+				e = sym->rev_dep.expr;
-+				if (e && e->type == E_SYMBOL
-+					&& e->left.sym->name) {
-+				    fprintf(out, "%s: %s", br2_symbol_printer(e->left.sym->name),
-+						br2_symbol_printer(sym->name));
-+printf("%s is Selected BY: %s", sym->name, e->left.sym->name);
-+				}
-+#endif
-+			    }
-+			}
-+		}
-+next:
-+		if (menu->list) {
-+			menu = menu->list;
-+			continue;
-+		}
-+		if (menu->next)
-+			menu = menu->next;
-+		else while ((menu = menu->parent)) {
-+			if (menu->next) {
-+				menu = menu->next;
-+				break;
-+			}
-+		}
-+	}
-+	fclose(out);
-+	sprintf(buf2, "%s%s", dir, name);
-+	rename(buf, buf2);
-+	printf(_("#\n"
-+		 "# make dependencies written to %s\n"
-+		 "# ATTENTION buildroot devels!\n"
-+		 "# See top of this file before playing with this auto-preprequisites!\n"
-+		 "#\n"), name);
-+	return 0;
-+}
-+
- /* write a dependency file as used by kbuild to track dependencies */
- int file_write_dep(const char *name)
- {
-@@ -71,7 +186,7 @@
- 	fprintf(out, "\n$(deps_config): ;\n");
- 	fclose(out);
- 	rename("..config.tmp", name);
--	return 0;
-+	return write_make_deps(NULL);
- }
- 
- 
diff --git a/support/kconfig/patches/09-implement-kconfig-probability.patch b/support/kconfig/patches/09-implement-kconfig-probability.patch
index 3f09673..3b6eb89 100644
--- a/support/kconfig/patches/09-implement-kconfig-probability.patch
+++ b/support/kconfig/patches/09-implement-kconfig-probability.patch
@@ -2,11 +2,11 @@
  confdata.c |   22 +++++++++++++++++++---
  1 file changed, 19 insertions(+), 3 deletions(-)
 
-Index: config/confdata.c
+Index: kconfig/confdata.c
 ===================================================================
---- config.orig/confdata.c
-+++ config/confdata.c
-@@ -996,7 +996,16 @@
+--- kconfig.orig/confdata.c
++++ kconfig/confdata.c
+@@ -982,7 +982,16 @@
  void conf_set_all_new_symbols(enum conf_def_mode mode)
  {
  	struct symbol *sym, *csym;
@@ -24,7 +24,7 @@ Index: config/confdata.c
  
  	for_all_symbols(i, sym) {
  		if (sym_has_value(sym))
-@@ -1015,8 +1024,15 @@
+@@ -1001,8 +1010,15 @@
  				sym->def[S_DEF_USER].tri = no;
  				break;
  			case def_random:
diff --git a/support/kconfig/patches/12-fix-glade-file-path.patch b/support/kconfig/patches/12-fix-glade-file-path.patch
index 681dce1..badfc91 100644
--- a/support/kconfig/patches/12-fix-glade-file-path.patch
+++ b/support/kconfig/patches/12-fix-glade-file-path.patch
@@ -6,7 +6,7 @@ Index: kconfig/gconf.c
 ===================================================================
 --- kconfig.orig/gconf.c
 +++ kconfig/gconf.c
-@@ -1521,7 +1521,7 @@
+@@ -1525,7 +1525,7 @@
  	/* Determine GUI path */
  	env = getenv(SRCTREE);
  	if (env)
diff --git a/support/kconfig/patches/14-support-out-of-tree-config.patch b/support/kconfig/patches/14-support-out-of-tree-config.patch
index 9fa6384..8d76df2 100644
--- a/support/kconfig/patches/14-support-out-of-tree-config.patch
+++ b/support/kconfig/patches/14-support-out-of-tree-config.patch
@@ -4,10 +4,10 @@
  util.c     |   16 +++++++++++++--
  3 files changed, 61 insertions(+), 18 deletions(-)
 
-Index: config/conf.c
+Index: kconfig/conf.c
 ===================================================================
---- config.orig/conf.c
-+++ config/conf.c
+--- kconfig.orig/conf.c
++++ kconfig/conf.c
 @@ -503,7 +503,6 @@
  	}
  	name = av[optind];
@@ -16,10 +16,10 @@ Index: config/conf.c
  	if (sync_kconfig) {
  		name = conf_get_configname();
  		if (stat(name, &tmpstat)) {
-Index: config/confdata.c
+Index: kconfig/confdata.c
 ===================================================================
---- config.orig/confdata.c
-+++ config/confdata.c
+--- kconfig.orig/confdata.c
++++ kconfig/confdata.c
 @@ -71,9 +71,7 @@
  
  const char *conf_get_autoconfig_name(void)
@@ -31,8 +31,8 @@ Index: config/confdata.c
  }
  
  static char *conf_expand_value(const char *in)
-@@ -565,6 +563,9 @@
- 	int use_timestamp = 1;
+@@ -563,6 +561,9 @@
+ 	char dirname[PATH_MAX+1], tmpname[PATH_MAX+1], newname[PATH_MAX+1];
  	char *env;
  
 +	if (!name)
@@ -41,7 +41,7 @@ Index: config/confdata.c
  	dirname[0] = 0;
  	if (name && name[0]) {
  		struct stat st;
-@@ -671,6 +672,7 @@
+@@ -661,6 +662,7 @@
  {
  	const char *name;
  	char path[PATH_MAX+1];
@@ -49,7 +49,7 @@ Index: config/confdata.c
  	char *s, *d, c;
  	struct symbol *sym;
  	struct stat sb;
-@@ -679,8 +681,20 @@
+@@ -669,8 +671,20 @@
  	name = conf_get_autoconfig_name();
  	conf_read_simple(name, S_DEF_AUTO);
  
@@ -72,7 +72,7 @@ Index: config/confdata.c
  
  	res = 0;
  	for_all_symbols(i, sym) {
-@@ -773,9 +787,11 @@
+@@ -763,9 +777,11 @@
  		close(fd);
  	}
  out:
@@ -87,9 +87,9 @@ Index: config/confdata.c
  	return res;
  }
  
-@@ -787,25 +803,38 @@
+@@ -776,25 +792,38 @@
+ 	const char *name;
  	FILE *out, *tristate, *out_h;
- 	time_t now;
  	int i;
 +	char dir[PATH_MAX+1], buf[PATH_MAX+1];
 +	char *s;
@@ -130,7 +130,7 @@ Index: config/confdata.c
  	if (!out_h) {
  		fclose(out);
  		fclose(tristate);
-@@ -885,19 +914,22 @@
+@@ -871,19 +900,22 @@
  	name = getenv("KCONFIG_AUTOHEADER");
  	if (!name)
  		name = "include/generated/autoconf.h";
@@ -156,11 +156,11 @@ Index: config/confdata.c
  		return 1;
  
  	return 0;
-Index: config/util.c
+Index: kconfig/util.c
 ===================================================================
---- config.orig/util.c
-+++ config/util.c
-@@ -147,6 +147,8 @@
+--- kconfig.orig/util.c
++++ kconfig/util.c
+@@ -32,6 +32,8 @@
  /* write a dependency file as used by kbuild to track dependencies */
  int file_write_dep(const char *name)
  {
@@ -169,7 +169,7 @@ Index: config/util.c
  	struct symbol *sym, *env_sym;
  	struct expr *e;
  	struct file *file;
-@@ -154,7 +156,16 @@
+@@ -39,7 +41,16 @@
  
  	if (!name)
  		name = ".kconfig.d";
@@ -187,13 +187,13 @@ Index: config/util.c
  	if (!out)
  		return 1;
  	fprintf(out, "deps_config := \\\n");
-@@ -185,7 +196,8 @@
+@@ -70,7 +81,8 @@
  
  	fprintf(out, "\n$(deps_config): ;\n");
  	fclose(out);
 -	rename("..config.tmp", name);
 +	sprintf(buf2, "%s%s", dir, name);
 +	rename(buf, buf2);
- 	return write_make_deps(NULL);
+ 	return 0;
  }
  
diff --git a/support/kconfig/patches/series b/support/kconfig/patches/series
index defdf58..573911b 100644
--- a/support/kconfig/patches/series
+++ b/support/kconfig/patches/series
@@ -1,9 +1,7 @@
 01-kconfig-kernel-to-buildroot.patch
 02-cpp-comments-to-c-comments.patch
 03-change-config-option-prefix.patch
-05-really-clean-everything.patch
 06-br-build-system-integration.patch
-08-make-write-deps.patch
 09-implement-kconfig-probability.patch
 10-br-build-system.patch
 11-use-mktemp-for-lxdialog.patch
diff --git a/support/kconfig/qconf.cc b/support/kconfig/qconf.cc
index 06dd2e3..c2796b8 100644
--- a/support/kconfig/qconf.cc
+++ b/support/kconfig/qconf.cc
@@ -1489,8 +1489,7 @@ void ConfigMainWindow::saveConfigAs(void)
 	QString s = Q3FileDialog::getSaveFileName(conf_get_configname(), NULL, this);
 	if (s.isNull())
 		return;
-	if (conf_write(QFile::encodeName(s)))
-		QMessageBox::information(this, "qconf", _("Unable to save configuration!"));
+	saveConfig();
 }
 
 void ConfigMainWindow::searchConfig(void)
@@ -1643,7 +1642,7 @@ void ConfigMainWindow::closeEvent(QCloseEvent* e)
 	mb.setButtonText(QMessageBox::Cancel, _("Cancel Exit"));
 	switch (mb.exec()) {
 	case QMessageBox::Yes:
-		conf_write(NULL);
+		saveConfig();
 	case QMessageBox::No:
 		e->accept();
 		break;
diff --git a/support/kconfig/streamline_config.pl b/support/kconfig/streamline_config.pl
index fd81fc3..a4fe923 100644
--- a/support/kconfig/streamline_config.pl
+++ b/support/kconfig/streamline_config.pl
@@ -1,6 +1,6 @@
 #!/usr/bin/perl -w
 #
-# Copywrite 2005-2009 - Steven Rostedt
+# Copyright 2005-2009 - Steven Rostedt
 # Licensed under the terms of the GNU GPL License version 2
 #
 #  It's simple enough to figure out how this works.
diff --git a/support/kconfig/util.c b/support/kconfig/util.c
index 8a5efaa..6edd8a3 100644
--- a/support/kconfig/util.c
+++ b/support/kconfig/util.c
@@ -29,121 +29,6 @@ struct file *file_lookup(const char *name)
 	return file;
 }
 
-static char* br2_symbol_printer(const char * const in)
-{
-	ssize_t i, j, len = strlen(in);
-	char *ret;
-	if (len < 1)
-		return NULL;
-	ret = malloc(len+1);
-	if (!ret) {
-		printf("Out of memory!");
-		exit(1);
-	}
-	memset(ret, 0, len+1);
-	i = j = 0;
-	if (strncmp("BR2_", in, 4) == 0)
-		i += 4;
-	if (strncmp("PACKAGE_", in + i, 8) == 0)
-		i += 8;
-	else if (strncmp("TARGET_", in + i, 7) == 0)
-		i += 7;
-	while (i <= len)
-		ret[j++] = tolower(in[i++]);
-	return ret;
-}
-
-/* write dependencies of the individual config-symbols */
-static int write_make_deps(const char *name)
-{
-	char *str;
-	char dir[PATH_MAX+1], buf[PATH_MAX+1], buf2[PATH_MAX+1];
-	struct menu *menu;
-	struct symbol *sym;
-	struct property *prop, *p;
-	unsigned done;
-	const char * const name_tmp = "..make.deps.tmp";
-	FILE *out;
-	if (!name)
-		name = ".auto.deps";
-
-	strcpy(dir, conf_get_configname());
-	str = strrchr(dir, '/');
-	if (str)
-		str[1] = 0;
-	else
-		dir[0] = 0;
-
-	sprintf(buf, "%s%s", dir, name_tmp);
-	out = fopen(buf, "w");
-	if (!out)
-		return 1;
-	fprintf(out, "# ATTENTION! This does not handle 'depends', just 'select'! \n"
-		"# See support/kconfig/util.c write_make_deps()\n#\n");
-	menu = &rootmenu;//rootmenu.list;
-	while (menu) {
-		sym = menu->sym;
-		if (!sym) {
-			if (!menu_is_visible(menu))
-				goto next;
-		} else if (!(sym->flags & SYMBOL_CHOICE)) {
-			sym_calc_value(sym);
-			if (sym->type == S_BOOLEAN
-			    && sym_get_tristate_value(sym) != no) {
-			    done = 0;
-			    for_all_prompts(sym, prop) {
-			        struct expr *e;
-//printf("\nname=%s\n", sym->name);
-			        for_all_properties(sym, p, P_SELECT) {
-				    e = p->expr;
-				    if (e && e->left.sym->name) {
-				        if (!done) {
-					    fprintf(out, "%s: $(BASE_TARGETS)", br2_symbol_printer(sym->name));
-					    done = 1;
-					}
-//printf("SELECTS %s\n",e->left.sym->name);
-					fprintf(out, " %s",br2_symbol_printer(e->left.sym->name));
-				    }
-				}
-				if (done)
-				    fprintf(out, "\n");
-#if 0
-				e = sym->rev_dep.expr;
-				if (e && e->type == E_SYMBOL
-					&& e->left.sym->name) {
-				    fprintf(out, "%s: %s", br2_symbol_printer(e->left.sym->name),
-						br2_symbol_printer(sym->name));
-printf("%s is Selected BY: %s", sym->name, e->left.sym->name);
-				}
-#endif
-			    }
-			}
-		}
-next:
-		if (menu->list) {
-			menu = menu->list;
-			continue;
-		}
-		if (menu->next)
-			menu = menu->next;
-		else while ((menu = menu->parent)) {
-			if (menu->next) {
-				menu = menu->next;
-				break;
-			}
-		}
-	}
-	fclose(out);
-	sprintf(buf2, "%s%s", dir, name);
-	rename(buf, buf2);
-	printf(_("#\n"
-		 "# make dependencies written to %s\n"
-		 "# ATTENTION buildroot devels!\n"
-		 "# See top of this file before playing with this auto-preprequisites!\n"
-		 "#\n"), name);
-	return 0;
-}
-
 /* write a dependency file as used by kbuild to track dependencies */
 int file_write_dep(const char *name)
 {
@@ -198,7 +83,7 @@ int file_write_dep(const char *name)
 	fclose(out);
 	sprintf(buf2, "%s%s", dir, name);
 	rename(buf, buf2);
-	return write_make_deps(NULL);
+	return 0;
 }
 
 
diff --git a/support/kconfig/zconf.l b/support/kconfig/zconf.l
index 3dbaec1..b22f884 100644
--- a/support/kconfig/zconf.l
+++ b/support/kconfig/zconf.l
@@ -294,11 +294,11 @@ void zconf_initscan(const char *name)
 
 	current_file = file_lookup(name);
 	current_file->lineno = 1;
-	current_file->flags = FILE_BUSY;
 }
 
 void zconf_nextfile(const char *name)
 {
+	struct file *iter;
 	struct file *file = file_lookup(name);
 	struct buffer *buf = malloc(sizeof(*buf));
 	memset(buf, 0, sizeof(*buf));
@@ -314,18 +314,25 @@ void zconf_nextfile(const char *name)
 	buf->parent = current_buf;
 	current_buf = buf;
 
-	if (file->flags & FILE_BUSY) {
-		printf("%s:%d: do not source '%s' from itself\n",
-		       zconf_curname(), zconf_lineno(), name);
-		exit(1);
-	}
-	if (file->flags & FILE_SCANNED) {
-		printf("%s:%d: file '%s' is already sourced from '%s'\n",
-		       zconf_curname(), zconf_lineno(), name,
-		       file->parent->name);
-		exit(1);
+	for (iter = current_file->parent; iter; iter = iter->parent ) {
+		if (!strcmp(current_file->name,iter->name) ) {
+			printf("%s:%d: recursive inclusion detected. "
+			       "Inclusion path:\n  current file : '%s'\n",
+			       zconf_curname(), zconf_lineno(),
+			       zconf_curname());
+			iter = current_file->parent;
+			while (iter && \
+			       strcmp(iter->name,current_file->name)) {
+				printf("  included from: '%s:%d'\n",
+				       iter->name, iter->lineno-1);
+				iter = iter->parent;
+			}
+			if (iter)
+				printf("  included from: '%s:%d'\n",
+				       iter->name, iter->lineno+1);
+			exit(1);
+		}
 	}
-	file->flags |= FILE_BUSY;
 	file->lineno = 1;
 	file->parent = current_file;
 	current_file = file;
@@ -335,8 +342,6 @@ static void zconf_endfile(void)
 {
 	struct buffer *parent;
 
-	current_file->flags |= FILE_SCANNED;
-	current_file->flags &= ~FILE_BUSY;
 	current_file = current_file->parent;
 
 	parent = current_buf->parent;
