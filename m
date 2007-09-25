From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 25 Sep 2007 04:37:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  package/config
Message-ID: <20070925113732.83BDD300DA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-25 04:37:31 -0700 (Tue, 25 Sep 2007)
New Revision: 20006

Log:
- add a version and display it in the configuration


Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/TODO
   trunk/buildroot/package/config/confdata.c
   trunk/buildroot/package/config/gconf.c
   trunk/buildroot/package/config/kconfig-to-buildroot2.patch
   trunk/buildroot/package/config/mconf.c
   trunk/buildroot/package/config/symbol.c


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-09-25 08:28:09 UTC (rev 20005)
+++ trunk/buildroot/Config.in	2007-09-25 11:37:31 UTC (rev 20006)
@@ -6,6 +6,10 @@
 	bool
 	default y
 
+config BR2_VERSION
+	string
+	default "0.10.0-svn"
+
 source "target/arch.in"
 
 menu "Build options"

Modified: trunk/buildroot/TODO
===================================================================
--- trunk/buildroot/TODO	2007-09-25 08:28:09 UTC (rev 20005)
+++ trunk/buildroot/TODO	2007-09-25 11:37:31 UTC (rev 20006)
@@ -1,5 +1,7 @@
 Buildroot3 TODOs
 
+- stabilize for a 0.10.0 release
+
 - fix packages/Makefile.autotools.in to use a package-imposed patchdir
 - convert all packages that use autoconf to use the infrastructure of
   packages/Makefile.autotools.in

Modified: trunk/buildroot/package/config/confdata.c
===================================================================
--- trunk/buildroot/package/config/confdata.c	2007-09-25 08:28:09 UTC (rev 20005)
+++ trunk/buildroot/package/config/confdata.c	2007-09-25 11:37:31 UTC (rev 20006)
@@ -413,7 +413,7 @@
 	if (!out)
 		return 1;
 
-	sym = sym_lookup("VERSION", 0);
+	sym = sym_lookup("BR2_VERSION", 0);
 	sym_calc_value(sym);
 	time(&now);
 	env = getenv("KCONFIG_NOTIMESTAMP");
@@ -681,7 +681,7 @@
 		return 1;
 	}
 
-	sym = sym_lookup("VERSION", 0);
+	sym = sym_lookup("BR2_VERSION", 0);
 	sym_calc_value(sym);
 	time(&now);
 	fprintf(out, "#\n"

Modified: trunk/buildroot/package/config/gconf.c
===================================================================
--- trunk/buildroot/package/config/gconf.c	2007-09-25 08:28:09 UTC (rev 20005)
+++ trunk/buildroot/package/config/gconf.c	2007-09-25 11:37:31 UTC (rev 20006)
@@ -272,7 +272,7 @@
 					  NULL);
 
 	sprintf(title, _("Buildroot v%s Configuration"),
-		getenv("VERSION"));
+		getenv("BR2_VERSION"));
 	gtk_window_set_title(GTK_WINDOW(main_wnd), title);
 
 	gtk_widget_show(main_wnd);

Modified: trunk/buildroot/package/config/kconfig-to-buildroot2.patch
===================================================================
--- trunk/buildroot/package/config/kconfig-to-buildroot2.patch	2007-09-25 08:28:09 UTC (rev 20005)
+++ trunk/buildroot/package/config/kconfig-to-buildroot2.patch	2007-09-25 11:37:31 UTC (rev 20006)
@@ -135,7 +135,7 @@
  		return 1;
  
 -	sym = sym_lookup("KERNELVERSION", 0);
-+	sym = sym_lookup("VERSION", 0);
++	sym = sym_lookup("BR2_VERSION", 0);
  	sym_calc_value(sym);
  	time(&now);
  	env = getenv("KCONFIG_NOTIMESTAMP");
@@ -249,7 +249,7 @@
  	}
  
 -	sym = sym_lookup("KERNELVERSION", 0);
-+	sym = sym_lookup("VERSION", 0);
++	sym = sym_lookup("BR2_VERSION", 0);
  	sym_calc_value(sym);
  	time(&now);
  	fprintf(out, "#\n"
@@ -520,7 +520,7 @@
 -	sprintf(title, _("Linux Kernel v%s Configuration"),
 -		getenv("KERNELVERSION"));
 +	sprintf(title, _("Buildroot v%s Configuration"),
-+		getenv("VERSION"));
++		getenv("BR2_VERSION"));
  	gtk_window_set_title(GTK_WINDOW(main_wnd), title);
  
  	gtk_widget_show(main_wnd);
@@ -536,545 +536,6 @@
    <property name="type">GTK_WINDOW_TOPLEVEL</property>
    <property name="window_position">GTK_WIN_POS_NONE</property>
    <property name="modal">False</property>
-diff -rdup kernel-config/kconfig-to-buildroot2.patch config/kconfig-to-buildroot2.patch
---- kernel-config/kconfig-to-buildroot2.patch	2007-09-23 15:33:01.000000000 +0200
-+++ config/kconfig-to-buildroot2.patch	2007-09-23 15:39:23.000000000 +0200
-@@ -1,5 +1,6 @@
----- kconfig/conf.c	2007-06-11 20:37:06.000000000 +0200
--+++ Buildroot/conf.c	2007-06-28 13:10:46.000000000 +0200
-+diff -rdup kernel-config/conf.c config/conf.c
-+--- kernel-config/conf.c	2007-09-22 00:38:23.000000000 +0200
-++++ config/conf.c	2007-09-23 15:35:12.000000000 +0200
- @@ -542,7 +542,7 @@ int main(int ac, char **av)
-  		exit(1);
-  	}
-@@ -9,12 +10,14 @@
-  	switch (input_mode) {
-  	case set_default:
-  		if (!defconfig_file)
--@@ -557,10 +557,10 @@ int main(int ac, char **av)
-+@@ -557,11 +557,11 @@ int main(int ac, char **av)
-  	case ask_silent:
-  		if (stat(".config", &tmpstat)) {
-  			printf(_("***\n"
- -				"*** You have not yet configured your kernel!\n"
--+				"*** You have not yet configured Buildroot!\n"
-+-				"*** (missing kernel .config file)\n"
-++				"*** You have not yet configured buildroot!\n"
-++				"*** (missing .config file)\n"
-  				"***\n"
-  				"*** Please run some configurator (e.g. \"make oldconfig\" or\n"
- -				"*** \"make menuconfig\" or \"make xconfig\").\n"
-@@ -22,7 +25,7 @@
-  				"***\n"));
-  			exit(1);
-  		}
--@@ -603,7 +603,7 @@ int main(int ac, char **av)
-+@@ -604,7 +604,7 @@ int main(int ac, char **av)
-  	} else if (conf_get_changed()) {
-  		name = getenv("KCONFIG_NOSILENTUPDATE");
-  		if (name && *name) {
-@@ -31,7 +34,7 @@
-  			return 1;
-  		}
-  	} else
--@@ -614,12 +614,12 @@ int main(int ac, char **av)
-+@@ -615,12 +615,12 @@ int main(int ac, char **av)
-  		check_conf(&rootmenu);
-  	} while (conf_cnt);
-  	if (conf_write(NULL)) {
-@@ -47,18 +50,27 @@
-  		return 1;
-  	}
-  
----- kconfig/confdata.c	2007-06-11 20:37:06.000000000 +0200
--+++ Buildroot/confdata.c	2007-06-28 13:06:23.000000000 +0200
--@@ -21,7 +21,7 @@ static void conf_warning(const char *fmt
-+diff -rdup kernel-config/confdata.c config/confdata.c
-+--- kernel-config/confdata.c	2007-09-22 00:38:23.000000000 +0200
-++++ config/confdata.c	2007-09-23 15:33:26.000000000 +0200
-+@@ -11,6 +11,7 @@
-+ #include <string.h>
-+ #include <time.h>
-+ #include <unistd.h>
-++#include <libgen.h>
-+ 
-+ #define LKC_DIRECT_LINK
-+ #include "lkc.h"
-+@@ -21,7 +22,7 @@ static void conf_warning(const char *fmt
-  static const char *conf_filename;
-  static int conf_lineno, conf_warnings, conf_unsaved;
-  
- -const char conf_defname[] = "arch/$ARCH/defconfig";
--+const char conf_defname[] = "extra/Configs/defconfigs/$ARCH";
-++const char conf_defname[] = ".defconfig";
-  
-  static void conf_warning(const char *fmt, ...)
-  {
--@@ -150,22 +150,22 @@ load:
-+@@ -150,22 +151,22 @@ load:
-  		sym = NULL;
-  		switch (line[0]) {
-  		case '#':
-@@ -86,7 +98,7 @@
-  				if (sym->type == S_UNKNOWN)
-  					sym->type = S_BOOLEAN;
-  			}
--@@ -183,12 +183,8 @@ load:
-+@@ -183,12 +184,8 @@ load:
-  				;
-  			}
-  			break;
-@@ -101,7 +113,7 @@
-  			if (!p)
-  				continue;
-  			*p++ = 0;
--@@ -199,13 +195,13 @@ load:
-+@@ -199,13 +196,13 @@ load:
-  					*p2 = 0;
-  			}
-  			if (def == S_DEF_USER) {
-@@ -118,7 +130,7 @@
-  				if (sym->type == S_UNKNOWN)
-  					sym->type = S_OTHER;
-  			}
--@@ -416,7 +412,7 @@ int conf_write(const char *name)
-+@@ -416,7 +413,7 @@ int conf_write(const char *name)
-  	if (!out)
-  		return 1;
-  
-@@ -127,7 +139,7 @@
-  	sym_calc_value(sym);
-  	time(&now);
-  	env = getenv("KCONFIG_NOTIMESTAMP");
--@@ -425,10 +421,8 @@ int conf_write(const char *name)
-+@@ -425,10 +422,8 @@ int conf_write(const char *name)
-  
-  	fprintf(out, _("#\n"
-  		       "# Automatically generated make config: don't edit\n"
-@@ -138,7 +150,7 @@
-  		     use_timestamp ? "# " : "",
-  		     use_timestamp ? ctime(&now) : "");
-  
--@@ -462,19 +456,19 @@ int conf_write(const char *name)
-+@@ -462,19 +457,19 @@ int conf_write(const char *name)
-  			case S_TRISTATE:
-  				switch (sym_get_tristate_value(sym)) {
-  				case no:
-@@ -162,7 +174,7 @@
-  				while (1) {
-  					l = strcspn(str, "\"\\");
-  					if (l) {
--@@ -490,12 +484,12 @@ int conf_write(const char *name)
-+@@ -490,12 +485,12 @@ int conf_write(const char *name)
-  			case S_HEX:
-  				str = sym_get_string_value(sym);
-  				if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
-@@ -177,7 +189,62 @@
-  				break;
-  			}
-  		}
--@@ -672,22 +668,19 @@ int conf_write_autoconf(void)
-+@@ -535,7 +530,7 @@ int conf_write(const char *name)
-+ 
-+ int conf_split_config(void)
-+ {
-+-	char *name, path[128];
-++	char *name, path[128], *opwd, *dir, *_name;
-+ 	char *s, *d, c;
-+ 	struct symbol *sym;
-+ 	struct stat sb;
-+@@ -546,8 +541,20 @@ int conf_split_config(void)
-+ 		name = "include/config/auto.conf";
-+ 	conf_read_simple(name, S_DEF_AUTO);
-+ 
-+-	if (chdir("include/config"))
-++	opwd = malloc(256);
-++	_name = strdup(name);
-++	if (opwd == NULL || _name == NULL)
-+ 		return 1;
-++	opwd = getcwd(opwd, 256);
-++	dir = dirname(_name);
-++	if (dir == NULL) {
-++		res = 1;
-++		goto err;
-++	}
-++	if (chdir(dir)) {
-++		res = 1;
-++		goto err;
-++	}
-+ 
-+ 	res = 0;
-+ 	for_all_symbols(i, sym) {
-+@@ -640,9 +647,11 @@ int conf_split_config(void)
-+ 		close(fd);
-+ 	}
-+ out:
-+-	if (chdir("../.."))
-+-		return 1;
-+-
-++	if (chdir(opwd))
-++		res = 1;
-++err:
-++	free(opwd);
-++	free(_name);
-+ 	return res;
-+ }
-+ 
-+@@ -657,7 +666,7 @@ int conf_write_autoconf(void)
-+ 
-+ 	sym_clear_all_valid();
-+ 
-+-	file_write_dep("include/config/auto.conf.cmd");
-++	file_write_dep(".config.cmd");
-+ 
-+ 	if (conf_split_config())
-+ 		return 1;
-+@@ -672,22 +681,19 @@ int conf_write_autoconf(void)
-  		return 1;
-  	}
-  
-@@ -204,7 +271,7 @@
-  
-  	for_all_symbols(i, sym) {
-  		sym_calc_value(sym);
--@@ -700,19 +693,19 @@ int conf_write_autoconf(void)
-+@@ -700,19 +706,19 @@ int conf_write_autoconf(void)
-  			case no:
-  				break;
-  			case mod:
-@@ -230,7 +297,7 @@
-  			while (1) {
-  				l = strcspn(str, "\"\\");
-  				if (l) {
--@@ -732,14 +725,14 @@ int conf_write_autoconf(void)
-+@@ -732,14 +738,14 @@ int conf_write_autoconf(void)
-  		case S_HEX:
-  			str = sym_get_string_value(sym);
-  			if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
-@@ -249,8 +316,9 @@
-  			break;
-  		default:
-  			break;
----- kconfig/expr.c	2007-06-11 20:37:06.000000000 +0200
--+++ Buildroot/expr.c	2007-06-28 13:24:38.000000000 +0200
-+diff -rdup kernel-config/expr.c config/expr.c
-+--- kernel-config/expr.c	2007-09-22 00:38:23.000000000 +0200
-++++ config/expr.c	2007-09-23 15:33:26.000000000 +0200
- @@ -331,7 +331,7 @@ struct expr *expr_trans_bool(struct expr
-  		e->right.expr = expr_trans_bool(e->right.expr);
-  		break;
-@@ -421,305 +489,11 @@
-  				tmp = e->left.expr;
-  				free(e);
-  				e = tmp;
----- kconfig/expr.h	2007-06-11 20:37:06.000000000 +0200
--+++ Buildroot/expr.h	2007-06-28 13:08:57.000000000 +0200
-+diff -rdup kernel-config/expr.h config/expr.h
-+--- kernel-config/expr.h	2007-09-22 00:38:23.000000000 +0200
-++++ config/expr.h	2007-09-23 15:33:26.000000000 +0200
- @@ -65,7 +65,7 @@ enum symbol_type {
-  
-  enum {
-  	S_DEF_USER,		/* main user value */
---	S_DEF_AUTO,
--+	S_DEF_AUTO
-- };
-- 
-- struct symbol {
--@@ -139,7 +139,7 @@ struct menu {
-- 	struct property *prompt;
-- 	struct expr *dep;
-- 	unsigned int flags;
---	//char *help;
--+	/*char *help; */
-- 	struct file *file;
-- 	int lineno;
-- 	void *data;
----- kconfig/gconf.c	2007-06-11 20:37:06.000000000 +0200
--+++ Buildroot/gconf.c	2007-06-28 12:15:29.000000000 +0200
--@@ -271,8 +271,8 @@ void init_main_window(const gchar * glad
-- 					  /*"style", PANGO_STYLE_OBLIQUE, */
-- 					  NULL);
-- 
---	sprintf(title, _("Linux Kernel v%s Configuration"),
---		getenv("KERNELVERSION"));
--+	sprintf(title, _("Buildroot v%s Configuration"),
--+		getenv("VERSION"));
-- 	gtk_window_set_title(GTK_WINDOW(main_wnd), title);
-- 
-- 	gtk_widget_show(main_wnd);
----- kconfig/gconf.glade	2007-06-11 20:37:06.000000000 +0200
--+++ Buildroot/gconf.glade	2007-06-28 12:17:40.000000000 +0200
--@@ -5,7 +5,7 @@
-- 
-- <widget class="GtkWindow" id="window1">
--   <property name="visible">True</property>
---  <property name="title" translatable="yes">Gtk Kernel Configurator</property>
--+  <property name="title" translatable="yes">Gtk Buildroot Configurator</property>
--   <property name="type">GTK_WINDOW_TOPLEVEL</property>
--   <property name="window_position">GTK_WIN_POS_NONE</property>
--   <property name="modal">False</property>
----- kconfig/mconf.c	2007-06-11 20:37:06.000000000 +0200
--+++ Buildroot/mconf.c	2007-06-28 12:15:29.000000000 +0200
--@@ -30,20 +30,18 @@ static char menu_backtitle[128];
-- static const char mconf_readme[] = N_(
-- "Overview\n"
-- "--------\n"
---"Some kernel features may be built directly into the kernel.\n"
---"Some may be made into loadable runtime modules.  Some features\n"
--+"Some features may be built directly into Buildroot.  Some features\n"
-- "may be completely removed altogether.  There are also certain\n"
---"kernel parameters which are not really features, but must be\n"
--+"parameters which are not really features, but must be\n"
-- "entered in as decimal or hexadecimal numbers or possibly text.\n"
-- "\n"
---"Menu items beginning with [*], <M> or [ ] represent features\n"
---"configured to be built in, modularized or removed respectively.\n"
---"Pointed brackets <> represent module capable features.\n"
--+"Menu items beginning with [*] or [ ] represent features\n"
--+"configured to be built in or removed respectively.\n"
-- "\n"
-- "To change any of these features, highlight it with the cursor\n"
---"keys and press <Y> to build it in, <M> to make it a module or\n"
---"<N> to removed it.  You may also press the <Space Bar> to cycle\n"
---"through the available options (ie. Y->N->M->Y).\n"
--+"keys and press <Y> to build it in or <N> to removed it.\n"
--+"You may also press the <Space Bar> to cycle\n"
--+"through the available options (ie. Y->N->Y).\n"
-- "\n"
-- "Some additional keyboard hints:\n"
-- "\n"
--@@ -116,7 +114,7 @@ static const char mconf_readme[] = N_(
-- "-----------------------------\n"
-- "Menuconfig supports the use of alternate configuration files for\n"
-- "those who, for various reasons, find it necessary to switch\n"
---"between different kernel configurations.\n"
--+"between different configurations.\n"
-- "\n"
-- "At the end of the main menu you will find two options.  One is\n"
-- "for saving the current configuration to a file of your choosing.\n"
--@@ -149,7 +147,7 @@ static const char mconf_readme[] = N_(
-- "\n"
-- "Optional personality available\n"
-- "------------------------------\n"
---"If you prefer to have all of the kernel options listed in a single\n"
--+"If you prefer to have all of the options listed in a single\n"
-- "menu, rather than the default multimenu hierarchy, run the menuconfig\n"
-- "with MENUCONFIG_MODE environment variable set to single_menu. Example:\n"
-- "\n"
--@@ -179,9 +177,9 @@ menu_instructions[] = N_(
-- 	"Arrow keys navigate the menu.  "
-- 	"<Enter> selects submenus --->.  "
-- 	"Highlighted letters are hotkeys.  "
---	"Pressing <Y> includes, <N> excludes, <M> modularizes features.  "
--+	"Pressing <Y> selectes a feature, while <N> will exclude a feature.  "
-- 	"Press <Esc><Esc> to exit, <?> for Help, </> for Search.  "
---	"Legend: [*] built-in  [ ] excluded  <M> module  < > module capable"),
--+	"Legend: [*] feature is selected  [ ] feature is excluded"),
-- radiolist_instructions[] = N_(
-- 	"Use the arrow keys to navigate this window or "
-- 	"press the hotkey of the item you wish to select "
--@@ -201,18 +199,18 @@ setmod_text[] = N_(
-- 	"This feature depends on another which has been configured as a module.\n"
-- 	"As a result, this feature will be built as a module."),
-- nohelp_text[] = N_(
---	"There is no help available for this kernel option.\n"),
--+	"There is no help available for this option.\n"),
-- load_config_text[] = N_(
-- 	"Enter the name of the configuration file you wish to load.  "
-- 	"Accept the name shown to restore the configuration you "
-- 	"last retrieved.  Leave blank to abort."),
-- load_config_help[] = N_(
-- 	"\n"
---	"For various reasons, one may wish to keep several different kernel\n"
--+	"For various reasons, one may wish to keep several different Buildroot\n"
-- 	"configurations available on a single machine.\n"
-- 	"\n"
-- 	"If you have saved a previous configuration in a file other than the\n"
---	"kernel's default, entering the name of the file here will allow you\n"
--+	"Buildroot's default, entering the name of the file here will allow you\n"
-- 	"to modify that configuration.\n"
-- 	"\n"
-- 	"If you are uncertain, then you have probably never used alternate\n"
--@@ -222,7 +220,7 @@ save_config_text[] = N_(
-- 	"as an alternate.  Leave blank to abort."),
-- save_config_help[] = N_(
-- 	"\n"
---	"For various reasons, one may wish to keep different kernel\n"
--+	"For various reasons, one may wish to keep different Buildroot\n"
-- 	"configurations available on a single machine.\n"
-- 	"\n"
-- 	"Entering a file name here will allow you to later retrieve, modify\n"
--@@ -871,9 +869,9 @@ int main(int ac, char **av)
-- 	conf_parse(av[1]);
-- 	conf_read(NULL);
-- 
---	sym = sym_lookup("KERNELVERSION", 0);
--+	sym = sym_lookup("VERSION", 0);
-- 	sym_calc_value(sym);
---	sprintf(menu_backtitle, _("Linux Kernel v%s Configuration"),
--+	sprintf(menu_backtitle, _("Buildroot v%s Configuration"),
-- 		sym_get_string_value(sym));
-- 
-- 	mode = getenv("MENUCONFIG_MODE");
--@@ -893,7 +891,7 @@ int main(int ac, char **av)
-- 		if (conf_get_changed())
-- 			res = dialog_yesno(NULL,
-- 					   _("Do you wish to save your "
---					     "new kernel configuration?\n"
--+					     "new Buildroot configuration?\n"
-- 					     "<ESC><ESC> to continue."),
-- 					   6, 60);
-- 		else
--@@ -905,22 +903,22 @@ int main(int ac, char **av)
-- 	case 0:
-- 		if (conf_write(NULL)) {
-- 			fprintf(stderr, _("\n\n"
---				"Error during writing of the kernel configuration.\n"
---				"Your kernel configuration changes were NOT saved."
--+				"Error during writing of the Buildroot configuration.\n"
--+				"Your Buildroot configuration changes were NOT saved."
-- 				"\n\n"));
-- 			return 1;
-- 		}
-- 	case -1:
-- 		printf(_("\n\n"
---			"*** End of Linux kernel configuration.\n"
---			"*** Execute 'make' to build the kernel or try 'make help'."
--+			"*** End of Buildroot configuration.\n"
--+			"*** Execute 'make' to build Buildroot or try 'make help'."
-- 			"\n\n"));
-- 		break;
-- 	default:
-- 		fprintf(stderr, _("\n\n"
---			"Your kernel configuration changes were NOT saved."
--+			"Your Buildroot configuration changes were NOT saved."
-- 			"\n\n"));
-- 	}
-- 
---	return 0;
--+	return conf_write_autoconf();
-- }
----- kconfig/symbol.c	2007-06-11 20:37:06.000000000 +0200
--+++ Buildroot/symbol.c	2007-06-28 12:15:29.000000000 +0200
--@@ -61,10 +61,10 @@ void sym_init(void)
-- 	if (p)
-- 		sym_add_default(sym, p);
-- 
---	sym = sym_lookup("KERNELVERSION", 0);
--+	sym = sym_lookup("VERSION", 0);
-- 	sym->type = S_STRING;
-- 	sym->flags |= SYMBOL_AUTO;
---	p = getenv("KERNELVERSION");
--+	p = getenv("VERSION");
-- 	if (p)
-- 		sym_add_default(sym, p);
-- 
----- kconfig/zconf.tab.c_shipped	2007-06-11 20:37:06.000000000 +0200
--+++ Buildroot/zconf.tab.c_shipped	2007-06-28 12:15:29.000000000 +0200
--@@ -2115,7 +2115,7 @@ void conf_parse(const char *name)
-- 	modules_sym = sym_lookup(NULL, 0);
-- 	modules_sym->type = S_BOOLEAN;
-- 	modules_sym->flags |= SYMBOL_AUTO;
---	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
--+	rootmenu.prompt = menu_add_prompt(P_MENU, "Buildroot Configuration", NULL);
-- 
-- #if YYDEBUG
-- 	if (getenv("ZCONF_DEBUG"))
----- kconfig/zconf.y	2007-06-11 20:37:06.000000000 +0200
--+++ Buildroot/zconf.y	2007-06-28 12:15:29.000000000 +0200
--@@ -484,7 +484,7 @@ void conf_parse(const char *name)
-- 	modules_sym = sym_lookup(NULL, 0);
-- 	modules_sym->type = S_BOOLEAN;
-- 	modules_sym->flags |= SYMBOL_AUTO;
---	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
--+	rootmenu.prompt = menu_add_prompt(P_MENU, "Buildroot Configuration", NULL);
-- 
-- #if YYDEBUG
-- 	if (getenv("ZCONF_DEBUG"))
--Index: confdata.c
--===================================================================
----- kconfig/confdata.c	(revision 18967)
--+++ Buildroot/confdata.c	(working copy)
--@@ -21,7 +21,7 @@ static void conf_warning(const char *fmt
-- static const char *conf_filename;
-- static int conf_lineno, conf_warnings, conf_unsaved;
-- 
---const char conf_defname[] = "extra/Configs/defconfigs/$ARCH";
--+const char conf_defname[] = ".defconfig";
-- 
-- static void conf_warning(const char *fmt, ...)
-- {
----- kconfig/confdata.c	2007-07-02 16:07:19.000000000 +0200
--+++ Buildroot/confdata.c	2007-07-02 16:05:21.000000000 +0200
--@@ -651,7 +651,7 @@ int conf_write_autoconf(void)
-- 
-- 	sym_clear_all_valid();
-- 
---	file_write_dep("include/config/auto.conf.cmd");
--+	file_write_dep(".config.cmd");
-- 
-- 	if (conf_split_config())
-- 		return 1;
----- kconfig/confdata.c	2007-07-07 11:13:12.000000000 +0200
--+++ Buildroot/confdata.c	2007-07-08 01:30:44.000000000 +0200
--@@ -11,6 +11,7 @@
-- #include <string.h>
-- #include <time.h>
-- #include <unistd.h>
--+#include <libgen.h>
-- 
-- #define LKC_DIRECT_LINK
-- #include "lkc.h"
--@@ -529,7 +530,7 @@ int conf_write(const char *name)
-- 
-- int conf_split_config(void)
-- {
---	char *name, path[128];
--+	char *name, path[128], *opwd, *dir, *_name;
-- 	char *s, *d, c;
-- 	struct symbol *sym;
-- 	struct stat sb;
--@@ -540,8 +541,20 @@ int conf_split_config(void)
-- 		name = "include/config/auto.conf";
-- 	conf_read_simple(name, S_DEF_AUTO);
-- 
---	if (chdir("include/config"))
--+	opwd = malloc(256);
--+	_name = strdup(name);
--+	if (opwd == NULL || _name == NULL)
-- 		return 1;
--+	opwd = getcwd(opwd, 256);
--+	dir = dirname(_name);
--+	if (dir == NULL) {
--+		res = 1;
--+		goto err;
--+	}
--+	if (chdir(dir)) {
--+		res = 1;
--+		goto err;
--+	}
-- 
-- 	res = 0;
-- 	for_all_symbols(i, sym) {
--@@ -634,9 +647,11 @@ int conf_split_config(void)
-- 		close(fd);
-- 	}
-- out:
---	if (chdir("../.."))
---		return 1;
---
--+	if (chdir(opwd))
--+		res = 1;
--+err:
--+	free(opwd);
--+	free(_name);
-- 	return res;
-- }
-- 
-+-	S_DE
-\ No newline at end of file
 diff -rdup kernel-config/mconf.c config/mconf.c
 --- kernel-config/mconf.c	2007-09-22 00:38:23.000000000 +0200
 +++ config/mconf.c	2007-09-23 15:36:33.000000000 +0200
@@ -1172,7 +633,7 @@
  	struct symbol *sym;
  
 -	sym = sym_lookup("KERNELVERSION", 0);
-+	sym = sym_lookup("VERSION", 0);
++	sym = sym_lookup("BR2_VERSION", 0);
  	sym_calc_value(sym);
  	size = snprintf(menu_backtitle, sizeof(menu_backtitle),
 -	                _("%s - Linux Kernel v%s Configuration"),
@@ -1226,11 +687,11 @@
  		sym_add_default(sym, p);
  
 -	sym = sym_lookup("KERNELVERSION", 0);
-+	sym = sym_lookup("VERSION", 0);
++	sym = sym_lookup("BR2_VERSION", 0);
  	sym->type = S_STRING;
  	sym->flags |= SYMBOL_AUTO;
 -	p = getenv("KERNELVERSION");
-+	p = getenv("VERSION");
++	p = getenv("BR2_VERSION");
  	if (p)
  		sym_add_default(sym, p);
  

Modified: trunk/buildroot/package/config/mconf.c
===================================================================
--- trunk/buildroot/package/config/mconf.c	2007-09-25 08:28:09 UTC (rev 20005)
+++ trunk/buildroot/package/config/mconf.c	2007-09-25 11:37:31 UTC (rev 20006)
@@ -398,7 +398,7 @@
 	int size;
 	struct symbol *sym;
 
-	sym = sym_lookup("VERSION", 0);
+	sym = sym_lookup("BR2_VERSION", 0);
 	sym_calc_value(sym);
 	size = snprintf(menu_backtitle, sizeof(menu_backtitle),
 	                _("%s - buildroot v%s Configuration"),

Modified: trunk/buildroot/package/config/symbol.c
===================================================================
--- trunk/buildroot/package/config/symbol.c	2007-09-25 08:28:09 UTC (rev 20005)
+++ trunk/buildroot/package/config/symbol.c	2007-09-25 11:37:31 UTC (rev 20006)
@@ -61,10 +61,10 @@
 	if (p)
 		sym_add_default(sym, p);
 
-	sym = sym_lookup("VERSION", 0);
+	sym = sym_lookup("BR2_VERSION", 0);
 	sym->type = S_STRING;
 	sym->flags |= SYMBOL_AUTO;
-	p = getenv("VERSION");
+	p = getenv("BR2_VERSION");
 	if (p)
 		sym_add_default(sym, p);
 
