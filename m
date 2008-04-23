From: <bogus@does.not.exist.com>
Date: Wed, 23 Apr 2008 14:39:25 -0000
Subject: No subject
Message-ID: <mailman.9.1213863105.1342.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Modified:
   trunk/buildroot/package/config/Makefile.kconfig
   trunk/buildroot/package/config/README.buildroot2
   trunk/buildroot/package/config/conf.c
   trunk/buildroot/package/config/confdata.c
   trunk/buildroot/package/config/expr.h
   trunk/buildroot/package/config/gconf.c
   trunk/buildroot/package/config/kconfig-language.txt
   trunk/buildroot/package/config/kconfig-to-buildroot2.patch
   trunk/buildroot/package/config/kxgettext.c
   trunk/buildroot/package/config/lkc_proto.h
   trunk/buildroot/package/config/lxdialog/check-lxdialog.sh
   trunk/buildroot/package/config/mconf.c
   trunk/buildroot/package/config/menu.c
   trunk/buildroot/package/config/qconf.cc
   trunk/buildroot/package/config/zconf.tab.c_shipped
   trunk/buildroot/package/config/zconf.y


Changeset:
Modified: trunk/buildroot/package/config/Makefile.kconfig
===================================================================
--- trunk/buildroot/package/config/Makefile.kconfig	2008-06-19 08:11:35 UTC (rev 22449)
+++ trunk/buildroot/package/config/Makefile.kconfig	2008-06-19 08:11:43 UTC (rev 22450)
@@ -22,24 +22,25 @@
 silentoldconfig: $(obj)/conf
 	$< -s arch/$(ARCH)/Kconfig
 
+# Create new linux.po file
+# Adjust charset to UTF-8 in .po file to accept UTF-8 in Kconfig files
+# The symlink is used to repair a deficiency in arch/um
 update-po-config: $(obj)/kxgettext
-	xgettext --default-domain=linux \
-          --add-comments --keyword=_ --keyword=N_ \
-          --files-from=scripts/kconfig/POTFILES.in \
-          --output scripts/kconfig/config.pot
-	$(Q)ln -fs Kconfig_i386 arch/um/Kconfig_arch
-	$(Q)for i in `ls arch/`; \
-	do \
-	  scripts/kconfig/kxgettext arch/$$i/Kconfig \
-	    | msguniq -o scripts/kconfig/linux_$${i}.pot; \
-	done
-	$(Q)msgcat scripts/kconfig/config.pot \
-	  `find scripts/kconfig/ -type f -name linux_*.pot` \
-	  --output scripts/kconfig/linux_raw.pot
-	$(Q)msguniq --sort-by-file scripts/kconfig/linux_raw.pot \
-	    --output scripts/kconfig/linux.pot
-	$(Q)rm -f arch/um/Kconfig_arch
-	$(Q)rm -f scripts/kconfig/linux_*.pot scripts/kconfig/config.pot
+	xgettext --default-domain=linux                  \
+	    --add-comments --keyword=_ --keyword=N_      \
+	    --from-code=UTF-8                            \
+	    --files-from=scripts/kconfig/POTFILES.in     \
+	    --output $(obj)/config.pot
+	$(Q)sed -i s/CHARSET/UTF-8/ $(obj)/config.pot
+	$(Q)ln -fs Kconfig.i386 arch/um/Kconfig.arch
+	(for i in `ls arch/`;                            \
+	do                                               \
+	    $(obj)/kxgettext arch/$$i/Kconfig;           \
+	done ) >> $(obj)/config.pot
+	msguniq --sort-by-file --to-code=UTF-8 $(obj)/config.pot \
+	    --output $(obj)/linux.pot
+	$(Q)rm -f arch/um/Kconfig.arch
+	$(Q)rm -f $(obj)/config.pot
 
 PHONY += randconfig allyesconfig allnoconfig allmodconfig defconfig
 

Modified: trunk/buildroot/package/config/README.buildroot2
===================================================================
--- trunk/buildroot/package/config/README.buildroot2	2008-06-19 08:11:35 UTC (rev 22449)
+++ trunk/buildroot/package/config/README.buildroot2	2008-06-19 08:11:43 UTC (rev 22450)
@@ -1,15 +1,16 @@
-This is a copy of the kconfig code in the kernel (currently 2.6.22.7) tweaked to
-suit Buildroot.
+This is a copy of the kconfig code in the kernel (currently 2.6.23.14) tweaked
+to suit Buildroot.
 
 To update:
 	cp -r /usr/src/linux/scripts/kconfig package/config.new
 	cd package/config.new
 	cp /usr/src/linux/Documentation/kbuild/kconfig-language.txt .
+	patch -p1 < ../config/kconfig-to-buildroot2.patch
 	mv Makefile Makefile.kconfig
-	patch -p1 < ../config/kconfig-to-buildroot2.patch
 	cp ../config/README.buildroot2 .
 	cp ../config/foo.h .
 	cp ../config/Makefile .
+	cp ../config/kconfig-to-buildroot2.patch .
 	cd ..
 	rm -rf config
 	mv config.new config

Modified: trunk/buildroot/package/config/conf.c
===================================================================
--- trunk/buildroot/package/config/conf.c	2008-06-19 08:11:35 UTC (rev 22449)
+++ trunk/buildroot/package/config/conf.c	2008-06-19 08:11:43 UTC (rev 22450)
@@ -37,6 +37,14 @@
 
 static char nohelp_text[] = N_("Sorry, no help available for this option yet.\n");
 
+static const char *get_help(struct menu *menu)
+{
+	if (menu_has_help(menu))
+		return menu_get_help(menu);
+	else
+		return nohelp_text;
+}
+
 static void strip(char *str)
 {
 	char *p = str;
@@ -172,7 +180,7 @@
 int conf_string(struct menu *menu)
 {
 	struct symbol *sym = menu->sym;
-	const char *def, *help;
+	const char *def;
 
 	while (1) {
 		printf("%*s%s ", indent - 1, "", menu->prompt->text);
@@ -188,10 +196,7 @@
 		case '?':
 			/* print help */
 			if (line[1] == '\n') {
-				help = nohelp_text;
-				if (menu->sym->help)
-					help = menu->sym->help;
-				printf("\n%s\n", menu->sym->help);
+				printf("\n%s\n", get_help(menu));
 				def = NULL;
 				break;
 			}
@@ -209,7 +214,6 @@
 	struct symbol *sym = menu->sym;
 	int type;
 	tristate oldval, newval;
-	const char *help;
 
 	while (1) {
 		printf("%*s%s ", indent - 1, "", menu->prompt->text);
@@ -235,7 +239,7 @@
 			printf("/m");
 		if (oldval != yes && sym_tristate_within_range(sym, yes))
 			printf("/y");
-		if (sym->help)
+		if (menu_has_help(menu))
 			printf("/?");
 		printf("] ");
 		if (!conf_askvalue(sym, sym_get_string_value(sym)))
@@ -272,10 +276,7 @@
 		if (sym_set_tristate_value(sym, newval))
 			return 0;
 help:
-		help = nohelp_text;
-		if (sym->help)
-			help = sym->help;
-		printf("\n%s\n", help);
+		printf("\n%s\n", get_help(menu));
 	}
 }
 
@@ -345,7 +346,7 @@
 			goto conf_childs;
 		}
 		printf("[1-%d", cnt);
-		if (sym->help)
+		if (menu_has_help(menu))
 			printf("?");
 		printf("]: ");
 		switch (input_mode) {
@@ -362,8 +363,7 @@
 			fgets(line, 128, stdin);
 			strip(line);
 			if (line[0] == '?') {
-				printf("\n%s\n", menu->sym->help ?
-					menu->sym->help : nohelp_text);
+				printf("\n%s\n", get_help(menu));
 				continue;
 			}
 			if (!line[0])
@@ -394,8 +394,7 @@
 		if (!child)
 			continue;
 		if (line[strlen(line) - 1] == '?') {
-			printf("\n%s\n", child->sym->help ?
-				child->sym->help : nohelp_text);
+			printf("\n%s\n", get_help(child));
 			continue;
 		}
 		sym_set_choice_value(sym, child->sym);

Modified: trunk/buildroot/package/config/confdata.c
===================================================================
--- trunk/buildroot/package/config/confdata.c	2008-06-19 08:11:35 UTC (rev 22449)
+++ trunk/buildroot/package/config/confdata.c	2008-06-19 08:11:43 UTC (rev 22450)
@@ -338,27 +338,42 @@
 		conf_unsaved++;
 		/* maybe print value in verbose mode... */
 	sym_ok:
+		if (!sym_is_choice(sym))
+			continue;
+		/* The choice symbol only has a set value (and thus is not new)
+		 * if all its visible childs have values.
+		 */
+		prop = sym_get_choice_prop(sym);
+		flags = sym->flags;
+		for (e = prop->expr; e; e = e->left.expr)
+			if (e->right.sym->visible != no)
+				flags &= e->right.sym->flags;
+		sym->flags &= flags | ~SYMBOL_DEF_USER;
+	}
+
+	for_all_symbols(i, sym) {
 		if (sym_has_value(sym) && !sym_is_choice_value(sym)) {
-			if (sym->visible == no)
+			/* Reset values of generates values, so they'll appear
+			 * as new, if they should become visible, but that
+			 * doesn't quite work if the Kconfig and the saved
+			 * configuration disagree.
+			 */
+			if (sym->visible == no && !conf_unsaved)
 				sym->flags &= ~SYMBOL_DEF_USER;
 			switch (sym->type) {
 			case S_STRING:
 			case S_INT:
 			case S_HEX:
-				if (!sym_string_within_range(sym, sym->def[S_DEF_USER].val))
-					sym->flags &= ~(SYMBOL_VALID|SYMBOL_DEF_USER);
+				/* Reset a string value if it's out of range */
+				if (sym_string_within_range(sym, sym->def[S_DEF_USER].val))
+					break;
+				sym->flags &= ~(SYMBOL_VALID|SYMBOL_DEF_USER);
+				conf_unsaved++;
+				break;
 			default:
 				break;
 			}
 		}
-		if (!sym_is_choice(sym))
-			continue;
-		prop = sym_get_choice_prop(sym);
-		flags = sym->flags;
-		for (e = prop->expr; e; e = e->left.expr)
-			if (e->right.sym->visible != no)
-				flags &= e->right.sym->flags;
-		sym->flags &= flags | ~SYMBOL_DEF_USER;
 	}
 
 	sym_add_change_count(conf_warnings || conf_unsaved);

Modified: trunk/buildroot/package/config/expr.h
===================================================================
--- trunk/buildroot/package/config/expr.h	2008-06-19 08:11:35 UTC (rev 22449)
+++ trunk/buildroot/package/config/expr.h	2008-06-19 08:11:43 UTC (rev 22450)
@@ -71,14 +71,12 @@
 struct symbol {
 	struct symbol *next;
 	char *name;
-	char *help;
 	enum symbol_type type;
 	struct symbol_value curr;
 	struct symbol_value def[4];
 	tristate visible;
 	int flags;
 	struct property *prop;
-	struct expr *dep, *dep2;
 	struct expr_value rev_dep;
 };
 
@@ -139,7 +137,7 @@
 	struct property *prompt;
 	struct expr *dep;
 	unsigned int flags;
-	/*char *help; */
+	char *help;
 	struct file *file;
 	int lineno;
 	void *data;

Modified: trunk/buildroot/package/config/gconf.c
===================================================================
--- trunk/buildroot/package/config/gconf.c	2008-06-19 08:11:35 UTC (rev 22449)
+++ trunk/buildroot/package/config/gconf.c	2008-06-19 08:11:43 UTC (rev 22450)
@@ -38,9 +38,6 @@
 static gboolean show_debug = FALSE;
 static gboolean resizeable = FALSE;
 
-static char nohelp_text[] =
-    N_("Sorry, no help available for this option yet.\n");
-
 GtkWidget *main_wnd = NULL;
 GtkWidget *tree1_w = NULL;	// left  frame
 GtkWidget *tree2_w = NULL;	// right frame
@@ -462,12 +459,9 @@
 	GtkTextIter start, end;
 	const char *prompt = menu_get_prompt(menu);
 	gchar *name;
-	const char *help = _(nohelp_text);
+	const char *help;
 
-	if (!menu->sym)
-		help = "";
-	else if (menu->sym->help)
-		help = _(menu->sym->help);
+	help = _(menu_get_help(menu));
 
 	if (menu->sym && menu->sym->name)
 		name = g_strdup_printf(_(menu->sym->name));

Modified: trunk/buildroot/package/config/kconfig-language.txt
===================================================================
--- trunk/buildroot/package/config/kconfig-language.txt	2008-06-19 08:11:35 UTC (rev 22449)
+++ trunk/buildroot/package/config/kconfig-language.txt	2008-06-19 08:11:43 UTC (rev 22450)
@@ -98,6 +98,15 @@
   times, the limit is set to the largest selection.
   Reverse dependencies can only be used with boolean or tristate
   symbols.
+  Note:
+	select is evil.... select will by brute force set a symbol
+	equal to 'y' without visiting the dependencies. So abusing
+	select you are able to select a symbol FOO even if FOO depends
+	on BAR that is not set. In general use select only for
+	non-visible symbols (no promts anywhere) and for symbols with
+	no dependencies. That will limit the usefulness but on the
+	other hand avoid the illegal configurations all over. kconfig
+	should one day warn about such things.
 
 - numerical ranges: "range" <symbol> <symbol> ["if" <expr>]
   This allows to limit the range of possible input values for int

Modified: trunk/buildroot/package/config/kconfig-to-buildroot2.patch
===================================================================
--- trunk/buildroot/package/config/kconfig-to-buildroot2.patch	2008-06-19 08:11:35 UTC (rev 22449)
+++ trunk/buildroot/package/config/kconfig-to-buildroot2.patch	2008-06-19 08:11:43 UTC (rev 22450)
@@ -501,15 +501,6 @@
  };
  
  struct symbol {
-@@ -139,7 +139,7 @@ struct menu {
- 	struct property *prompt;
- 	struct expr *dep;
- 	unsigned int flags;
--	//char *help;
-+	/*char *help; */
- 	struct file *file;
- 	int lineno;
- 	void *data;
 diff -rdup kernel-config/gconf.c config/gconf.c
 --- kernel-config/gconf.c	2007-09-22 00:38:23.000000000 +0200
 +++ config/gconf.c	2007-09-23 15:33:26.000000000 +0200

Modified: trunk/buildroot/package/config/kxgettext.c
===================================================================
--- trunk/buildroot/package/config/kxgettext.c	2008-06-19 08:11:35 UTC (rev 22449)
+++ trunk/buildroot/package/config/kxgettext.c	2008-06-19 08:11:43 UTC (rev 22450)
@@ -170,8 +170,8 @@
 		     menu->file == NULL ? "Root Menu" : menu->file->name,
 		     menu->lineno);
 
-	if (menu->sym != NULL && menu->sym->help != NULL)
-		message__add(menu->sym->help, menu->sym->name,
+	if (menu->sym != NULL && menu_has_help(menu))
+		message__add(menu_get_help(menu), menu->sym->name,
 			     menu->file == NULL ? "Root Menu" : menu->file->name,
 			     menu->lineno);
 
@@ -212,7 +212,9 @@
 	struct message *m = message__list;
 
 	while (m != NULL) {
-		message__print_gettext_msgid_msgstr(m);
+		/* skip empty lines ("") */
+		if (strlen(m->msg) > sizeof("\"\""))
+			message__print_gettext_msgid_msgstr(m);
 		m = m->next;
 	}
 }

Modified: trunk/buildroot/package/config/lkc_proto.h
===================================================================
--- trunk/buildroot/package/config/lkc_proto.h	2008-06-19 08:11:35 UTC (rev 22449)
+++ trunk/buildroot/package/config/lkc_proto.h	2008-06-19 08:11:43 UTC (rev 22450)
@@ -15,6 +15,8 @@
 P(menu_get_prompt,const char *,(struct menu *menu));
 P(menu_get_root_menu,struct menu *,(struct menu *menu));
 P(menu_get_parent_menu,struct menu *,(struct menu *menu));
+P(menu_has_help,bool,(struct menu *menu));
+P(menu_get_help,const char *,(struct menu *menu));
 
 /* symbol.c */
 P(symbol_hash,struct symbol *,[SYMBOL_HASHSIZE]);

Modified: trunk/buildroot/package/config/lxdialog/check-lxdialog.sh
===================================================================
--- trunk/buildroot/package/config/lxdialog/check-lxdialog.sh	2008-06-19 08:11:35 UTC (rev 22449)
+++ trunk/buildroot/package/config/lxdialog/check-lxdialog.sh	2008-06-19 08:11:43 UTC (rev 22450)
@@ -51,7 +51,7 @@
 	printf "Usage: $0 [-check compiler options|-header|-library]\n"
 }
 
-if [ $# == 0 ]; then
+if [ $# -eq 0 ]; then
 	usage
 	exit 1
 fi

Modified: trunk/buildroot/package/config/mconf.c
===================================================================
--- trunk/buildroot/package/config/mconf.c	2008-06-19 08:11:35 UTC (rev 22449)
+++ trunk/buildroot/package/config/mconf.c	2008-06-19 08:11:43 UTC (rev 22450)
@@ -417,11 +417,13 @@
 {
 	struct symbol **sym_arr;
 	struct gstr res;
+	char *dialog_input;
 	int dres;
 again:
 	dialog_clear();
 	dres = dialog_inputbox(_("Search Configuration Parameter"),
-			      _("Enter CONFIG_ (sub)string to search for (omit CONFIG_)"),
+			      _("Enter CONFIG_ (sub)string to search for "
+				"(with or without \"CONFIG\")"),
 			      10, 75, "");
 	switch (dres) {
 	case 0:
@@ -433,7 +435,12 @@
 		return;
 	}
 
-	sym_arr = sym_re_search(dialog_input_result);
+	/* strip CONFIG_ if necessary */
+	dialog_input = dialog_input_result;
+	if (strncasecmp(dialog_input_result, "CONFIG_", 7) == 0)
+		dialog_input += 7;
+
+	sym_arr = sym_re_search(dialog_input);
 	res = get_relations_str(sym_arr);
 	free(sym_arr);
 	show_textbox(_("Search Results"), str_get(&res), 0, 0);
@@ -716,11 +723,11 @@
 	struct gstr help = str_new();
 	struct symbol *sym = menu->sym;
 
-	if (sym->help)
+	if (menu_has_help(menu))
 	{
 		if (sym->name) {
 			str_printf(&help, "CONFIG_%s:\n\n", sym->name);
-			str_append(&help, _(sym->help));
+			str_append(&help, _(menu_get_help(menu)));
 			str_append(&help, "\n");
 		}
 	} else {

Modified: trunk/buildroot/package/config/menu.c
===================================================================
--- trunk/buildroot/package/config/menu.c	2008-06-19 08:11:35 UTC (rev 22449)
+++ trunk/buildroot/package/config/menu.c	2008-06-19 08:11:43 UTC (rev 22450)
@@ -417,3 +417,15 @@
 	return menu;
 }
 
+bool menu_has_help(struct menu *menu)
+{
+	return menu->help != NULL;
+}
+
+const char *menu_get_help(struct menu *menu)
+{
+	if (menu->help)
+		return menu->help;
+	else
+		return "";
+}

Modified: trunk/buildroot/package/config/qconf.cc
===================================================================
--- trunk/buildroot/package/config/qconf.cc	2008-06-19 08:11:35 UTC (rev 22449)
+++ trunk/buildroot/package/config/qconf.cc	2008-06-19 08:11:43 UTC (rev 22450)
@@ -1041,7 +1041,7 @@
 		if (showDebug())
 			debug = debug_info(sym);
 
-		help = print_filter(_(sym->help));
+		help = print_filter(_(menu_get_help(menu)));
 	} else if (menu->prompt) {
 		head += "<big><b>";
 		head += print_filter(_(menu->prompt->text));

Modified: trunk/buildroot/package/config/zconf.tab.c_shipped
===================================================================
--- trunk/buildroot/package/config/zconf.tab.c_shipped	2008-06-19 08:11:35 UTC (rev 22449)
+++ trunk/buildroot/package/config/zconf.tab.c_shipped	2008-06-19 08:11:43 UTC (rev 22450)
@@ -1722,7 +1722,7 @@
   case 83:
 
     {
-	current_entry->sym->help = (yyvsp[0].string);
+	current_entry->help = (yyvsp[0].string);
 ;}
     break;
 
@@ -2280,11 +2280,11 @@
 			break;
 		}
 	}
-	if (sym->help) {
-		int len = strlen(sym->help);
-		while (sym->help[--len] == '\n')
-			sym->help[len] = 0;
-		fprintf(out, "  help\n%s\n", sym->help);
+	if (menu->help) {
+		int len = strlen(menu->help);
+		while (menu->help[--len] == '\n')
+			menu->help[len] = 0;
+		fprintf(out, "  help\n%s\n", menu->help);
 	}
 	fputc('\n', out);
 }

Modified: trunk/buildroot/package/config/zconf.y
===================================================================
--- trunk/buildroot/package/config/zconf.y	2008-06-19 08:11:35 UTC (rev 22449)
+++ trunk/buildroot/package/config/zconf.y	2008-06-19 08:11:43 UTC (rev 22450)
@@ -402,7 +402,7 @@
 
 help: help_start T_HELPTEXT
 {
-	current_entry->sym->help = $2;
+	current_entry->help = $2;
 };
 
 /* depends option */
@@ -649,11 +649,11 @@
 			break;
 		}
 	}
-	if (sym->help) {
-		int len = strlen(sym->help);
-		while (sym->help[--len] == '\n')
-			sym->help[len] = 0;
-		fprintf(out, "  help\n%s\n", sym->help);
+	if (menu->help) {
+		int len = strlen(menu->help);
+		while (menu->help[--len] == '\n')
+			menu->help[len] = 0;
+		fprintf(out, "  help\n%s\n", menu->help);
 	}
 	fputc('\n', out);
 }
