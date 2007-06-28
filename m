From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 28 Jun 2007 05:11:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/config
Message-ID: <20070628121114.848DCA45EA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-28 05:11:12 -0700 (Thu, 28 Jun 2007)
New Revision: 18959

Log:
- respin whole patch for the sake of simplicity


Modified:
   trunk/buildroot/package/config/kconfig-to-buildroot2.patch


Changeset:
Modified: trunk/buildroot/package/config/kconfig-to-buildroot2.patch
===================================================================
--- trunk/buildroot/package/config/kconfig-to-buildroot2.patch	2007-06-28 11:53:59 UTC (rev 18958)
+++ trunk/buildroot/package/config/kconfig-to-buildroot2.patch	2007-06-28 12:11:12 UTC (rev 18959)
@@ -1,6 +1,15 @@
---- kconfig/conf.c
-+++ Buildroot/conf.c
-@@ -557,10 +557,10 @@
+--- kconfig/conf.c	2007-06-11 20:37:06.000000000 +0200
++++ Buildroot/conf.c	2007-06-28 13:10:46.000000000 +0200
+@@ -542,7 +542,7 @@ int main(int ac, char **av)
+ 		exit(1);
+ 	}
+ 	conf_parse(name);
+-	//zconfdump(stdout);
++	/*zconfdump(stdout);*/
+ 	switch (input_mode) {
+ 	case set_default:
+ 		if (!defconfig_file)
+@@ -557,10 +557,10 @@ int main(int ac, char **av)
  	case ask_silent:
  		if (stat(".config", &tmpstat)) {
  			printf(_("***\n"
@@ -13,7 +22,7 @@
  				"***\n"));
  			exit(1);
  		}
-@@ -603,7 +603,7 @@
+@@ -603,7 +603,7 @@ int main(int ac, char **av)
  	} else if (conf_get_changed()) {
  		name = getenv("KCONFIG_NOSILENTUPDATE");
  		if (name && *name) {
@@ -22,7 +31,7 @@
  			return 1;
  		}
  	} else
-@@ -614,12 +614,12 @@
+@@ -614,12 +614,12 @@ int main(int ac, char **av)
  		check_conf(&rootmenu);
  	} while (conf_cnt);
  	if (conf_write(NULL)) {
@@ -38,9 +47,9 @@
  		return 1;
  	}
  
---- kconfig/confdata.c
-+++ Buildroot/confdata.c
-@@ -21,7 +21,7 @@
+--- kconfig/confdata.c	2007-06-11 20:37:06.000000000 +0200
++++ Buildroot/confdata.c	2007-06-28 13:06:23.000000000 +0200
+@@ -21,7 +21,7 @@ static void conf_warning(const char *fmt
  static const char *conf_filename;
  static int conf_lineno, conf_warnings, conf_unsaved;
  
@@ -49,7 +58,7 @@
  
  static void conf_warning(const char *fmt, ...)
  {
-@@ -150,22 +150,22 @@
+@@ -150,22 +150,22 @@ load:
  		sym = NULL;
  		switch (line[0]) {
  		case '#':
@@ -77,7 +86,7 @@
  				if (sym->type == S_UNKNOWN)
  					sym->type = S_BOOLEAN;
  			}
-@@ -183,12 +183,8 @@
+@@ -183,12 +183,8 @@ load:
  				;
  			}
  			break;
@@ -92,7 +101,7 @@
  			if (!p)
  				continue;
  			*p++ = 0;
-@@ -199,13 +195,13 @@
+@@ -199,13 +195,13 @@ load:
  					*p2 = 0;
  			}
  			if (def == S_DEF_USER) {
@@ -109,7 +118,7 @@
  				if (sym->type == S_UNKNOWN)
  					sym->type = S_OTHER;
  			}
-@@ -416,7 +412,7 @@
+@@ -416,7 +412,7 @@ int conf_write(const char *name)
  	if (!out)
  		return 1;
  
@@ -118,7 +127,7 @@
  	sym_calc_value(sym);
  	time(&now);
  	env = getenv("KCONFIG_NOTIMESTAMP");
-@@ -425,10 +421,8 @@
+@@ -425,10 +421,8 @@ int conf_write(const char *name)
  
  	fprintf(out, _("#\n"
  		       "# Automatically generated make config: don't edit\n"
@@ -129,7 +138,7 @@
  		     use_timestamp ? "# " : "",
  		     use_timestamp ? ctime(&now) : "");
  
-@@ -462,19 +456,19 @@
+@@ -462,19 +456,19 @@ int conf_write(const char *name)
  			case S_TRISTATE:
  				switch (sym_get_tristate_value(sym)) {
  				case no:
@@ -153,7 +162,7 @@
  				while (1) {
  					l = strcspn(str, "\"\\");
  					if (l) {
-@@ -490,12 +484,12 @@
+@@ -490,12 +484,12 @@ int conf_write(const char *name)
  			case S_HEX:
  				str = sym_get_string_value(sym);
  				if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
@@ -168,7 +177,7 @@
  				break;
  			}
  		}
-@@ -655,6 +649,8 @@
+@@ -655,6 +649,8 @@ int conf_write_autoconf(void)
  	time_t now;
  	int i, l;
  
@@ -177,7 +186,7 @@
  	sym_clear_all_valid();
  
  	file_write_dep("include/config/auto.conf.cmd");
-@@ -672,22 +668,19 @@
+@@ -672,22 +668,19 @@ int conf_write_autoconf(void)
  		return 1;
  	}
  
@@ -204,7 +213,7 @@
  
  	for_all_symbols(i, sym) {
  		sym_calc_value(sym);
-@@ -700,19 +693,19 @@
+@@ -700,19 +693,19 @@ int conf_write_autoconf(void)
  			case no:
  				break;
  			case mod:
@@ -230,7 +239,7 @@
  			while (1) {
  				l = strcspn(str, "\"\\");
  				if (l) {
-@@ -732,14 +725,14 @@
+@@ -732,14 +725,14 @@ int conf_write_autoconf(void)
  		case S_HEX:
  			str = sym_get_string_value(sym);
  			if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
@@ -249,9 +258,201 @@
  			break;
  		default:
  			break;
---- kconfig/gconf.c
-+++ Buildroot/gconf.c
-@@ -271,8 +271,8 @@
+--- kconfig/expr.c	2007-06-11 20:37:06.000000000 +0200
++++ Buildroot/expr.c	2007-06-28 13:24:38.000000000 +0200
+@@ -331,7 +331,7 @@ struct expr *expr_trans_bool(struct expr
+ 		e->right.expr = expr_trans_bool(e->right.expr);
+ 		break;
+ 	case E_UNEQUAL:
+-		// FOO!=n -> FOO
++		/* FOO!=n -> FOO */
+ 		if (e->left.sym->type == S_TRISTATE) {
+ 			if (e->right.sym == &symbol_no) {
+ 				e->type = E_SYMBOL;
+@@ -380,19 +380,19 @@ struct expr *expr_join_or(struct expr *e
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
+@@ -443,29 +443,29 @@ struct expr *expr_join_and(struct expr *
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
+@@ -474,19 +474,19 @@ struct expr *expr_join_and(struct expr *
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
+@@ -579,7 +579,7 @@ static void expr_eliminate_dups2(enum ex
+ 	switch (e1->type) {
+ 	case E_OR:
+ 		expr_eliminate_dups2(e1->type, &e1, &e1);
+-		// (FOO || BAR) && (!FOO && !BAR) -> n
++		/* (FOO || BAR) && (!FOO && !BAR) -> n */
+ 		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
+ 		tmp2 = expr_copy(e2);
+ 		tmp = expr_extract_eq_and(&tmp1, &tmp2);
+@@ -594,7 +594,7 @@ static void expr_eliminate_dups2(enum ex
+ 		break;
+ 	case E_AND:
+ 		expr_eliminate_dups2(e1->type, &e1, &e1);
+-		// (FOO && BAR) || (!FOO || !BAR) -> y
++		/* (FOO && BAR) || (!FOO || !BAR) -> y */
+ 		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
+ 		tmp2 = expr_copy(e2);
+ 		tmp = expr_extract_eq_or(&tmp1, &tmp2);
+@@ -703,7 +703,7 @@ struct expr *expr_transform(struct expr 
+ 	case E_NOT:
+ 		switch (e->left.expr->type) {
+ 		case E_NOT:
+-			// !!a -> a
++			/* !!a -> a */
+ 			tmp = e->left.expr->left.expr;
+ 			free(e->left.expr);
+ 			free(e);
+@@ -712,14 +712,14 @@ struct expr *expr_transform(struct expr 
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
+@@ -728,7 +728,7 @@ struct expr *expr_transform(struct expr 
+ 			e = expr_transform(e);
+ 			break;
+ 		case E_AND:
+-			// !(a && b) -> !a || !b
++			/* !(a && b) -> !a || !b */
+ 			tmp = e->left.expr;
+ 			e->type = E_OR;
+ 			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
+@@ -738,7 +738,7 @@ struct expr *expr_transform(struct expr 
+ 			break;
+ 		case E_SYMBOL:
+ 			if (e->left.expr->left.sym == &symbol_yes) {
+-				// !'y' -> 'n'
++				/* !'y' -> 'n' */
+ 				tmp = e->left.expr;
+ 				free(e);
+ 				e = tmp;
+@@ -747,7 +747,7 @@ struct expr *expr_transform(struct expr 
+ 				break;
+ 			}
+ 			if (e->left.expr->left.sym == &symbol_mod) {
+-				// !'m' -> 'm'
++				/* !'m' -> 'm' */
+ 				tmp = e->left.expr;
+ 				free(e);
+ 				e = tmp;
+@@ -756,7 +756,7 @@ struct expr *expr_transform(struct expr 
+ 				break;
+ 			}
+ 			if (e->left.expr->left.sym == &symbol_no) {
+-				// !'n' -> 'y'
++				/* !'n' -> 'y' */
+ 				tmp = e->left.expr;
+ 				free(e);
+ 				e = tmp;
+--- kconfig/expr.h	2007-06-11 20:37:06.000000000 +0200
++++ Buildroot/expr.h	2007-06-28 13:08:57.000000000 +0200
+@@ -65,7 +65,7 @@ enum symbol_type {
+ 
+ enum {
+ 	S_DEF_USER,		/* main user value */
+-	S_DEF_AUTO,
++	S_DEF_AUTO
+ };
+ 
+ struct symbol {
+@@ -139,7 +139,7 @@ struct menu {
+ 	struct property *prompt;
+ 	struct expr *dep;
+ 	unsigned int flags;
+-	//char *help;
++	/*char *help; */
+ 	struct file *file;
+ 	int lineno;
+ 	void *data;
+--- kconfig/gconf.c	2007-06-11 20:37:06.000000000 +0200
++++ Buildroot/gconf.c	2007-06-28 12:15:29.000000000 +0200
+@@ -271,8 +271,8 @@ void init_main_window(const gchar * glad
  					  /*"style", PANGO_STYLE_OBLIQUE, */
  					  NULL);
  
@@ -262,9 +463,20 @@
  	gtk_window_set_title(GTK_WINDOW(main_wnd), title);
  
  	gtk_widget_show(main_wnd);
---- kconfig/mconf.c
-+++ Buildroot/mconf.c
-@@ -30,20 +30,18 @@
+--- kconfig/gconf.glade	2007-06-11 20:37:06.000000000 +0200
++++ Buildroot/gconf.glade	2007-06-28 12:17:40.000000000 +0200
+@@ -5,7 +5,7 @@
+ 
+ <widget class="GtkWindow" id="window1">
+   <property name="visible">True</property>
+-  <property name="title" translatable="yes">Gtk Kernel Configurator</property>
++  <property name="title" translatable="yes">Gtk Buildroot Configurator</property>
+   <property name="type">GTK_WINDOW_TOPLEVEL</property>
+   <property name="window_position">GTK_WIN_POS_NONE</property>
+   <property name="modal">False</property>
+--- kconfig/mconf.c	2007-06-11 20:37:06.000000000 +0200
++++ Buildroot/mconf.c	2007-06-28 12:15:29.000000000 +0200
+@@ -30,20 +30,18 @@ static char menu_backtitle[128];
  static const char mconf_readme[] = N_(
  "Overview\n"
  "--------\n"
@@ -292,7 +504,7 @@
  "\n"
  "Some additional keyboard hints:\n"
  "\n"
-@@ -116,7 +114,7 @@
+@@ -116,7 +114,7 @@ static const char mconf_readme[] = N_(
  "-----------------------------\n"
  "Menuconfig supports the use of alternate configuration files for\n"
  "those who, for various reasons, find it necessary to switch\n"
@@ -301,7 +513,7 @@
  "\n"
  "At the end of the main menu you will find two options.  One is\n"
  "for saving the current configuration to a file of your choosing.\n"
-@@ -149,7 +147,7 @@
+@@ -149,7 +147,7 @@ static const char mconf_readme[] = N_(
  "\n"
  "Optional personality available\n"
  "------------------------------\n"
@@ -310,7 +522,7 @@
  "menu, rather than the default multimenu hierarchy, run the menuconfig\n"
  "with MENUCONFIG_MODE environment variable set to single_menu. Example:\n"
  "\n"
-@@ -179,9 +177,9 @@
+@@ -179,9 +177,9 @@ menu_instructions[] = N_(
  	"Arrow keys navigate the menu.  "
  	"<Enter> selects submenus --->.  "
  	"Highlighted letters are hotkeys.  "
@@ -322,7 +534,7 @@
  radiolist_instructions[] = N_(
  	"Use the arrow keys to navigate this window or "
  	"press the hotkey of the item you wish to select "
-@@ -201,18 +199,18 @@
+@@ -201,18 +199,18 @@ setmod_text[] = N_(
  	"This feature depends on another which has been configured as a module.\n"
  	"As a result, this feature will be built as a module."),
  nohelp_text[] = N_(
@@ -344,7 +556,7 @@
  	"to modify that configuration.\n"
  	"\n"
  	"If you are uncertain, then you have probably never used alternate\n"
-@@ -222,7 +220,7 @@
+@@ -222,7 +220,7 @@ save_config_text[] = N_(
  	"as an alternate.  Leave blank to abort."),
  save_config_help[] = N_(
  	"\n"
@@ -353,7 +565,7 @@
  	"configurations available on a single machine.\n"
  	"\n"
  	"Entering a file name here will allow you to later retrieve, modify\n"
-@@ -871,9 +869,9 @@
+@@ -871,9 +869,9 @@ int main(int ac, char **av)
  	conf_parse(av[1]);
  	conf_read(NULL);
  
@@ -365,7 +577,7 @@
  		sym_get_string_value(sym));
  
  	mode = getenv("MENUCONFIG_MODE");
-@@ -893,7 +891,7 @@
+@@ -893,7 +891,7 @@ int main(int ac, char **av)
  		if (conf_get_changed())
  			res = dialog_yesno(NULL,
  					   _("Do you wish to save your "
@@ -374,7 +586,7 @@
  					     "<ESC><ESC> to continue."),
  					   6, 60);
  		else
-@@ -905,22 +903,22 @@
+@@ -905,22 +903,22 @@ int main(int ac, char **av)
  	case 0:
  		if (conf_write(NULL)) {
  			fprintf(stderr, _("\n\n"
@@ -403,9 +615,9 @@
 -	return 0;
 +	return conf_write_autoconf();
  }
---- kconfig/symbol.c
-+++ Buildroot/symbol.c
-@@ -61,10 +61,10 @@
+--- kconfig/symbol.c	2007-06-11 20:37:06.000000000 +0200
++++ Buildroot/symbol.c	2007-06-28 12:15:29.000000000 +0200
+@@ -61,10 +61,10 @@ void sym_init(void)
  	if (p)
  		sym_add_default(sym, p);
  
@@ -418,9 +630,9 @@
  	if (p)
  		sym_add_default(sym, p);
  
---- kconfig/zconf.tab.c_shipped
-+++ Buildroot/zconf.tab.c_shipped
-@@ -2115,7 +2115,7 @@
+--- kconfig/zconf.tab.c_shipped	2007-06-11 20:37:06.000000000 +0200
++++ Buildroot/zconf.tab.c_shipped	2007-06-28 12:15:29.000000000 +0200
+@@ -2115,7 +2115,7 @@ void conf_parse(const char *name)
  	modules_sym = sym_lookup(NULL, 0);
  	modules_sym->type = S_BOOLEAN;
  	modules_sym->flags |= SYMBOL_AUTO;
@@ -429,9 +641,9 @@
  
  #if YYDEBUG
  	if (getenv("ZCONF_DEBUG"))
---- kconfig/zconf.y
-+++ Buildroot/zconf.y
-@@ -484,7 +484,7 @@
+--- kconfig/zconf.y	2007-06-11 20:37:06.000000000 +0200
++++ Buildroot/zconf.y	2007-06-28 12:15:29.000000000 +0200
+@@ -484,7 +484,7 @@ void conf_parse(const char *name)
  	modules_sym = sym_lookup(NULL, 0);
  	modules_sym->type = S_BOOLEAN;
  	modules_sym->flags |= SYMBOL_AUTO;
@@ -440,219 +652,3 @@
  
  #if YYDEBUG
  	if (getenv("ZCONF_DEBUG"))
---- kconfig/gconf.glade	2007-06-11 20:37:06.000000000 +0200
-+++ Buildroot/gconf.glade	2007-06-28 12:17:40.000000000 +0200
-@@ -5,7 +5,7 @@
- 
- <widget class="GtkWindow" id="window1">
-   <property name="visible">True</property>
--  <property name="title" translatable="yes">Gtk Kernel Configurator</property>
-+  <property name="title" translatable="yes">Gtk Buildroot Configurator</property>
-   <property name="type">GTK_WINDOW_TOPLEVEL</property>
-   <property name="window_position">GTK_WIN_POS_NONE</property>
-   <property name="modal">False</property>
---- kconfig/conf.c	(revision 18956)
-+++ Buildroot/conf.c	(working copy)
-@@ -542,7 +542,7 @@
- 		exit(1);
- 	}
- 	conf_parse(name);
--	//zconfdump(stdout);
-+	/*zconfdump(stdout);*/
- 	switch (input_mode) {
- 	case set_default:
- 		if (!defconfig_file)
---- kconfig/expr.h	(revision 18956)
-+++ Buildroot/expr.h	(working copy)
-@@ -65,7 +65,7 @@
- 
- enum {
- 	S_DEF_USER,		/* main user value */
--	S_DEF_AUTO,
-+	S_DEF_AUTO
- };
- 
- struct symbol {
-@@ -139,7 +139,7 @@
- 	struct property *prompt;
- 	struct expr *dep;
- 	unsigned int flags;
--	//char *help;
-+	/*char *help; */
- 	struct file *file;
- 	int lineno;
- 	void *data;
-Index: expr.c
-===================================================================
---- kconfig/expr.c	(revision 18956)
-+++ Buildroot/expr.c	(working copy)
-@@ -331,7 +331,7 @@
- 		e->right.expr = expr_trans_bool(e->right.expr);
- 		break;
- 	case E_UNEQUAL:
--		// FOO!=n -> FOO
-+		/* FOO!=n -> FOO */
- 		if (e->left.sym->type == S_TRISTATE) {
- 			if (e->right.sym == &symbol_no) {
- 				e->type = E_SYMBOL;
-@@ -380,19 +380,19 @@
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
-@@ -443,29 +443,29 @@
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
-@@ -474,19 +474,19 @@
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
-@@ -579,7 +579,7 @@
- 	switch (e1->type) {
- 	case E_OR:
- 		expr_eliminate_dups2(e1->type, &e1, &e1);
--		// (FOO || BAR) && (!FOO && !BAR) -> n
-+		/* (FOO || BAR) && (!FOO && !BAR) -> n */
- 		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
- 		tmp2 = expr_copy(e2);
- 		tmp = expr_extract_eq_and(&tmp1, &tmp2);
-@@ -594,7 +594,7 @@
- 		break;
- 	case E_AND:
- 		expr_eliminate_dups2(e1->type, &e1, &e1);
--		// (FOO && BAR) || (!FOO || !BAR) -> y
-+		/* (FOO && BAR) || (!FOO || !BAR) -> y */
- 		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
- 		tmp2 = expr_copy(e2);
- 		tmp = expr_extract_eq_or(&tmp1, &tmp2);
-@@ -703,7 +703,7 @@
- 	case E_NOT:
- 		switch (e->left.expr->type) {
- 		case E_NOT:
--			// !!a -> a
-+			/* !!a -> a */
- 			tmp = e->left.expr->left.expr;
- 			free(e->left.expr);
- 			free(e);
-@@ -712,14 +712,14 @@
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
-@@ -728,7 +728,7 @@
- 			e = expr_transform(e);
- 			break;
- 		case E_AND:
--			// !(a && b) -> !a || !b
-+			/* !(a && b) -> !a || !b */
- 			tmp = e->left.expr;
- 			e->type = E_OR;
- 			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
-@@ -738,7 +738,7 @@
- 			break;
- 		case E_SYMBOL:
- 			if (e->left.expr->left.sym == &symbol_yes) {
--				// !'y' -> 'n'
-+				/* !'y' -> 'n' */
- 				tmp = e->left.expr;
- 				free(e);
- 				e = tmp;
-@@ -747,7 +747,7 @@
- 				break;
- 			}
- 			if (e->left.expr->left.sym == &symbol_mod) {
--				// !'m' -> 'm'
-+				/* !'m' -> 'm' */
- 				tmp = e->left.expr;
- 				free(e);
- 				e = tmp;
-@@ -756,7 +756,7 @@
- 				break;
- 			}
- 			if (e->left.expr->left.sym == &symbol_no) {
--				// !'n' -> 'y'
-+				/* !'n' -> 'y' */
- 				tmp = e->left.expr;
- 				free(e);
- 				e = tmp;
