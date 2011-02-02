From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Feb 2011 12:07:45 +0100
Subject: [Buildroot] [git commit master 1/1] package/config: rebase against
	652cf9821d2a
Message-ID: <20110202144319.38B2D8F33A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a9c5296f4c5138ff02cb7f9912df3a117352398c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/config/conf.c                              |   11 +-
 package/config/gconf.c                             |    3 +-
 package/config/mconf.c                             |   35 +++---
 package/config/menu.c                              |    2 +-
 package/config/nconf.c                             |   43 +++----
 .../patches/01-kconfig-kernel-to-buildroot.patch   |  145 +-------------------
 .../config/patches/12-fix-glade-file-path.patch    |    2 +-
 package/config/qconf.cc                            |    2 +-
 8 files changed, 49 insertions(+), 194 deletions(-)

diff --git a/package/config/conf.c b/package/config/conf.c
index bd5dcb0..2192aeb 100644
--- a/package/config/conf.c
+++ b/package/config/conf.c
@@ -507,8 +507,7 @@ int main(int ac, char **av)
 		name = conf_get_configname();
 		if (stat(name, &tmpstat)) {
 			fprintf(stderr, _("***\n"
-				"*** You have not yet configured your Buildroot!\n"
-				"*** (missing .config file \"%s\")\n"
+				"*** Configuration file \"%s\" not found!\n"
 				"***\n"
 				"*** Please run some configurator (e.g. \"make oldconfig\" or\n"
 				"*** \"make menuconfig\" or \"make xconfig\").\n"
@@ -570,7 +569,7 @@ int main(int ac, char **av)
 			name = getenv("KCONFIG_NOSILENTUPDATE");
 			if (name && *name) {
 				fprintf(stderr,
-					_("\n*** Buildroot configuration requires explicit update.\n\n"));
+					_("\n*** The configuration requires explicit update.\n\n"));
 				return 1;
 			}
 		}
@@ -622,11 +621,11 @@ int main(int ac, char **av)
 		 * All other commands are only used to generate a config.
 		 */
 		if (conf_get_changed() && conf_write(NULL)) {
-			fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
+			fprintf(stderr, _("\n*** Error during writing of the configuration.\n\n"));
 			exit(1);
 		}
 		if (conf_write_autoconf()) {
-			fprintf(stderr, _("\n*** Error during update of the Buildroot configuration.\n\n"));
+			fprintf(stderr, _("\n*** Error during update of the configuration.\n\n"));
 			return 1;
 		}
 	} else if (input_mode == savedefconfig) {
@@ -637,7 +636,7 @@ int main(int ac, char **av)
 		}
 	} else if (input_mode != listnewconfig) {
 		if (conf_write(NULL)) {
-			fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
+			fprintf(stderr, _("\n*** Error during writing of the configuration.\n\n"));
 			exit(1);
 		}
 	}
diff --git a/package/config/gconf.c b/package/config/gconf.c
index f626061..d5f3ec7 100644
--- a/package/config/gconf.c
+++ b/package/config/gconf.c
@@ -671,8 +671,7 @@ void on_introduction1_activate(GtkMenuItem * menuitem, gpointer user_data)
 {
 	GtkWidget *dialog;
 	const gchar *intro_text = _(
-	    "Welcome to gkc, the GTK+ graphical kernel configuration tool\n"
-	    "for Linux.\n"
+	    "Welcome to gkc, the GTK+ graphical configuration tool\n"
 	    "For each option, a blank box indicates the feature is disabled, a\n"
 	    "check indicates it is enabled, and a dot indicates that it is to\n"
 	    "be compiled as a module.  Clicking on the box will cycle through the three states.\n"
diff --git a/package/config/mconf.c b/package/config/mconf.c
index dfc0acb..cb5e3cd 100644
--- a/package/config/mconf.c
+++ b/package/config/mconf.c
@@ -25,10 +25,9 @@
 static const char mconf_readme[] = N_(
 "Overview\n"
 "--------\n"
-"Some features may be built directly into Buildroot. Some features\n"
-"may be completely removed altogether.  There are also certain\n"
-"parameters which are not really features, but must be\n"
-"entered in as decimal or hexadecimal numbers or possibly text.\n"
+"This interface let you select features and parameters for the build.\n"
+"Features can either be built-in, modularized, or ignored. Parameters\n"
+"must be entered in as decimal or hexadecimal numbers or text.\n"
 "\n"
 "Menu items beginning with following braces represent features that\n"
 "  [ ] can be built in or removed\n"
@@ -149,9 +148,9 @@ static const char mconf_readme[] = N_(
 "\n"
 "Optional personality available\n"
 "------------------------------\n"
-"If you prefer to have all of the options listed in a single\n"
-"menu, rather than the default multimenu hierarchy, run the menuconfig\n"
-"with MENUCONFIG_MODE environment variable set to single_menu. Example:\n"
+"If you prefer to have all of the options listed in a single menu, rather\n"
+"than the default multimenu hierarchy, run the menuconfig with\n"
+"MENUCONFIG_MODE environment variable set to single_menu. Example:\n"
 "\n"
 "make MENUCONFIG_MODE=single_menu menuconfig\n"
 "\n"
@@ -206,12 +205,12 @@ load_config_text[] = N_(
 	"last retrieved.  Leave blank to abort."),
 load_config_help[] = N_(
 	"\n"
-	"For various reasons, one may wish to keep several different Buildroot\n"
+	"For various reasons, one may wish to keep several different\n"
 	"configurations available on a single machine.\n"
 	"\n"
 	"If you have saved a previous configuration in a file other than the\n"
-	"Buildroot's default, entering the name of the file here will allow you\n"
-	"to modify that configuration.\n"
+	"default one, entering its name here will allow you to modify that\n"
+	"configuration.\n"
 	"\n"
 	"If you are uncertain, then you have probably never used alternate\n"
 	"configuration files. You should therefore leave this blank to abort.\n"),
@@ -220,8 +219,8 @@ save_config_text[] = N_(
 	"as an alternate.  Leave blank to abort."),
 save_config_help[] = N_(
 	"\n"
-	"For various reasons, one may wish to keep different Buildroot\n"
-	"configurations available on a single machine.\n"
+	"For various reasons, one may wish to keep different configurations\n"
+	"available on a single machine.\n"
 	"\n"
 	"Entering a file name here will allow you to later retrieve, modify\n"
 	"and use the current configuration as an alternate to whatever\n"
@@ -833,7 +832,7 @@ int main(int ac, char **av)
 		if (conf_get_changed())
 			res = dialog_yesno(NULL,
 					   _("Do you wish to save your "
-					     "new Buildroot configuration?\n"
+					     "new configuration?\n"
 					     "<ESC><ESC> to continue."),
 					   6, 60);
 		else
@@ -845,20 +844,20 @@ int main(int ac, char **av)
 	case 0:
 		if (conf_write(filename)) {
 			fprintf(stderr, _("\n\n"
-				"Error during writing of the Buildroot configuration.\n"
-				"Your Buildroot configuration changes were NOT saved."
+				"Error while writing of the configuration.\n"
+				"Your configuration changes were NOT saved."
 				"\n\n"));
 			return 1;
 		}
 	case -1:
 		printf(_("\n\n"
-			"*** End of Buildroot configuration.\n"
-			"*** Execute 'make' to build Buildroot or try 'make help'."
+			"*** End of the configuration.\n"
+			"*** Execute 'make' to start the build or try 'make help'."
 			"\n\n"));
 		break;
 	default:
 		fprintf(stderr, _("\n\n"
-			"Your Buildroot configuration changes were NOT saved."
+			"Your configuration changes were NOT saved."
 			"\n\n"));
 	}
 
diff --git a/package/config/menu.c b/package/config/menu.c
index 64da30c..682045a 100644
--- a/package/config/menu.c
+++ b/package/config/menu.c
@@ -10,7 +10,7 @@
 #include "lkc.h"
 
 static const char nohelp_text[] = N_(
-	"There is no help available for this kernel option.\n");
+	"There is no help available for this option.\n");
 
 struct menu rootmenu;
 static struct menu **last_entry_ptr;
diff --git a/package/config/nconf.c b/package/config/nconf.c
index da5e45d..801cc04 100644
--- a/package/config/nconf.c
+++ b/package/config/nconf.c
@@ -15,11 +15,9 @@
 static const char nconf_readme[] = N_(
 "Overview\n"
 "--------\n"
-"Some kernel features may be built directly into the kernel.\n"
-"Some may be made into loadable runtime modules.  Some features\n"
-"may be completely removed altogether.  There are also certain\n"
-"kernel parameters which are not really features, but must be\n"
-"entered in as decimal or hexadecimal numbers or possibly text.\n"
+"This interface let you select features and parameters for the build.\n"
+"Features can either be built-in, modularized, or ignored. Parameters\n"
+"must be entered in as decimal or hexadecimal numbers or text.\n"
 "\n"
 "Menu items beginning with following braces represent features that\n"
 "  [ ] can be built in or removed\n"
@@ -95,7 +93,7 @@ static const char nconf_readme[] = N_(
 "-----------------------------\n"
 "nconfig supports the use of alternate configuration files for\n"
 "those who, for various reasons, find it necessary to switch\n"
-"between different kernel configurations.\n"
+"between different configurations.\n"
 "\n"
 "At the end of the main menu you will find two options.  One is\n"
 "for saving the current configuration to a file of your choosing.\n"
@@ -128,9 +126,9 @@ static const char nconf_readme[] = N_(
 "\n"
 "Optional personality available\n"
 "------------------------------\n"
-"If you prefer to have all of the kernel options listed in a single\n"
-"menu, rather than the default multimenu hierarchy, run the nconfig\n"
-"with NCONFIG_MODE environment variable set to single_menu. Example:\n"
+"If you prefer to have all of the options listed in a single menu, rather\n"
+"than the default multimenu hierarchy, run the nconfig with NCONFIG_MODE\n"
+"environment variable set to single_menu. Example:\n"
 "\n"
 "make NCONFIG_MODE=single_menu nconfig\n"
 "\n"
@@ -185,19 +183,19 @@ setmod_text[] = N_(
 "has been configured as a module.\n"
 "As a result, this feature will be built as a module."),
 nohelp_text[] = N_(
-"There is no help available for this kernel option.\n"),
+"There is no help available for this option.\n"),
 load_config_text[] = N_(
 "Enter the name of the configuration file you wish to load.\n"
 "Accept the name shown to restore the configuration you\n"
 "last retrieved.  Leave blank to abort."),
 load_config_help[] = N_(
 "\n"
-"For various reasons, one may wish to keep several different kernel\n"
+"For various reasons, one may wish to keep several different\n"
 "configurations available on a single machine.\n"
 "\n"
 "If you have saved a previous configuration in a file other than the\n"
-"kernel's default, entering the name of the file here will allow you\n"
-"to modify that configuration.\n"
+"default one, entering its name here will allow you to modify that\n"
+"configuration.\n"
 "\n"
 "If you are uncertain, then you have probably never used alternate\n"
 "configuration files.  You should therefor leave this blank to abort.\n"),
@@ -206,8 +204,8 @@ save_config_text[] = N_(
 "as an alternate.  Leave blank to abort."),
 save_config_help[] = N_(
 "\n"
-"For various reasons, one may wish to keep different kernel\n"
-"configurations available on a single machine.\n"
+"For various reasons, one may wish to keep different configurations\n"
+"available on a single machine.\n"
 "\n"
 "Entering a file name here will allow you to later retrieve, modify\n"
 "and use the current configuration as an alternate to whatever\n"
@@ -681,8 +679,7 @@ static int do_exit(void)
 		return 0;
 	}
 	res = btn_dialog(main_window,
-			_("Do you wish to save your "
-				"new kernel configuration?\n"
+			_("Do you wish to save your new configuration?\n"
 				"<ESC> to cancel and resume nconfig."),
 			2,
 			"   <save>   ",
@@ -701,18 +698,16 @@ static int do_exit(void)
 		if (res)
 			btn_dialog(
 				main_window,
-				_("Error during writing of the kernel "
-				  "configuration.\n"
-				  "Your kernel configuration "
-				  "changes were NOT saved."),
+				_("Error during writing of configuration.\n"
+				  "Your configuration changes were NOT saved."),
 				  1,
 				  "<OK>");
 		else {
 			char buf[1024];
 			snprintf(buf, 1024,
 				_("Configuration written to %s\n"
-				  "End of Linux kernel configuration.\n"
-				  "Execute 'make' to build the kernel or try"
+				  "End of the configuration.\n"
+				  "Execute 'make' to start the build or try"
 				  " 'make help'."), filename);
 			btn_dialog(
 				main_window,
@@ -724,7 +719,7 @@ static int do_exit(void)
 	default:
 		btn_dialog(
 			main_window,
-			_("Your kernel configuration changes were NOT saved."),
+			_("Your configuration changes were NOT saved."),
 			1,
 			"<OK>");
 		break;
diff --git a/package/config/patches/01-kconfig-kernel-to-buildroot.patch b/package/config/patches/01-kconfig-kernel-to-buildroot.patch
index 0ef8ed6..c511459 100644
--- a/package/config/patches/01-kconfig-kernel-to-buildroot.patch
+++ b/package/config/patches/01-kconfig-kernel-to-buildroot.patch
@@ -1,61 +1,13 @@
 ---
- conf.c              |   12 ++++++------
  confdata.c          |   14 +++++++-------
  gconf.c             |    4 ++--
  gconf.glade         |    2 +-
- mconf.c             |   35 +++++++++++++++++------------------
+ mconf.c             |    8 ++++----
  qconf.cc            |    4 ++--
  zconf.tab.c_shipped |    2 +-
  zconf.y             |    2 +-
- 8 files changed, 37 insertions(+), 38 deletions(-)
+ 7 files changed, 18 insertions(+), 18 deletions(-)
 
-Index: config/conf.c
-===================================================================
---- config.orig/conf.c
-+++ config/conf.c
-@@ -508,8 +508,8 @@
- 		name = conf_get_configname();
- 		if (stat(name, &tmpstat)) {
- 			fprintf(stderr, _("***\n"
--				"*** You have not yet configured your kernel!\n"
--				"*** (missing kernel config file \"%s\")\n"
-+				"*** You have not yet configured your Buildroot!\n"
-+				"*** (missing .config file \"%s\")\n"
- 				"***\n"
- 				"*** Please run some configurator (e.g. \"make oldconfig\" or\n"
- 				"*** \"make menuconfig\" or \"make xconfig\").\n"
-@@ -571,7 +571,7 @@
- 			name = getenv("KCONFIG_NOSILENTUPDATE");
- 			if (name && *name) {
- 				fprintf(stderr,
--					_("\n*** Kernel configuration requires explicit update.\n\n"));
-+					_("\n*** Buildroot configuration requires explicit update.\n\n"));
- 				return 1;
- 			}
- 		}
-@@ -623,11 +623,11 @@
- 		 * All other commands are only used to generate a config.
- 		 */
- 		if (conf_get_changed() && conf_write(NULL)) {
--			fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
-+			fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
- 			exit(1);
- 		}
- 		if (conf_write_autoconf()) {
--			fprintf(stderr, _("\n*** Error during update of the kernel configuration.\n\n"));
-+			fprintf(stderr, _("\n*** Error during update of the Buildroot configuration.\n\n"));
- 			return 1;
- 		}
- 	} else if (input_mode == savedefconfig) {
-@@ -638,7 +638,7 @@
- 		}
- 	} else if (input_mode != listnewconfig) {
- 		if (conf_write(NULL)) {
--			fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
-+			fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
- 			exit(1);
- 		}
- 	}
 Index: config/confdata.c
 ===================================================================
 --- config.orig/confdata.c
@@ -141,38 +93,7 @@ Index: config/mconf.c
 ===================================================================
 --- config.orig/mconf.c
 +++ config/mconf.c
-@@ -25,10 +25,9 @@
- static const char mconf_readme[] = N_(
- "Overview\n"
- "--------\n"
--"Some kernel features may be built directly into the kernel.\n"
--"Some may be made into loadable runtime modules.  Some features\n"
-+"Some features may be built directly into Buildroot. Some features\n"
- "may be completely removed altogether.  There are also certain\n"
--"kernel parameters which are not really features, but must be\n"
-+"parameters which are not really features, but must be\n"
- "entered in as decimal or hexadecimal numbers or possibly text.\n"
- "\n"
- "Menu items beginning with following braces represent features that\n"
-@@ -117,7 +116,7 @@
- "-----------------------------\n"
- "Menuconfig supports the use of alternate configuration files for\n"
- "those who, for various reasons, find it necessary to switch\n"
--"between different kernel configurations.\n"
-+"between different configurations.\n"
- "\n"
- "At the end of the main menu you will find two options.  One is\n"
- "for saving the current configuration to a file of your choosing.\n"
-@@ -150,7 +149,7 @@
- "\n"
- "Optional personality available\n"
- "------------------------------\n"
--"If you prefer to have all of the kernel options listed in a single\n"
-+"If you prefer to have all of the options listed in a single\n"
- "menu, rather than the default multimenu hierarchy, run the menuconfig\n"
- "with MENUCONFIG_MODE environment variable set to single_menu. Example:\n"
- "\n"
-@@ -180,9 +179,9 @@
+@@ -178,9 +178,9 @@
  	"Arrow keys navigate the menu.  "
  	"<Enter> selects submenus --->.  "
  	"Highlighted letters are hotkeys.  "
@@ -184,30 +105,7 @@ Index: config/mconf.c
  radiolist_instructions[] = N_(
  	"Use the arrow keys to navigate this window or "
  	"press the hotkey of the item you wish to select "
-@@ -207,11 +206,11 @@
- 	"last retrieved.  Leave blank to abort."),
- load_config_help[] = N_(
- 	"\n"
--	"For various reasons, one may wish to keep several different kernel\n"
-+	"For various reasons, one may wish to keep several different Buildroot\n"
- 	"configurations available on a single machine.\n"
- 	"\n"
- 	"If you have saved a previous configuration in a file other than the\n"
--	"kernel's default, entering the name of the file here will allow you\n"
-+	"Buildroot's default, entering the name of the file here will allow you\n"
- 	"to modify that configuration.\n"
- 	"\n"
- 	"If you are uncertain, then you have probably never used alternate\n"
-@@ -221,7 +220,7 @@
- 	"as an alternate.  Leave blank to abort."),
- save_config_help[] = N_(
- 	"\n"
--	"For various reasons, one may wish to keep different kernel\n"
-+	"For various reasons, one may wish to keep different Buildroot\n"
- 	"configurations available on a single machine.\n"
- 	"\n"
- 	"Entering a file name here will allow you to later retrieve, modify\n"
-@@ -292,10 +291,10 @@
+@@ -290,10 +290,10 @@
  	int size;
  	struct symbol *sym;
  
@@ -220,41 +118,6 @@ Index: config/mconf.c
  		        config_filename, sym_get_string_value(sym));
  	if (size >= sizeof(menu_backtitle))
  		menu_backtitle[sizeof(menu_backtitle)-1] = '\0';
-@@ -834,7 +833,7 @@
- 		if (conf_get_changed())
- 			res = dialog_yesno(NULL,
- 					   _("Do you wish to save your "
--					     "new kernel configuration?\n"
-+					     "new Buildroot configuration?\n"
- 					     "<ESC><ESC> to continue."),
- 					   6, 60);
- 		else
-@@ -846,20 +845,20 @@
- 	case 0:
- 		if (conf_write(filename)) {
- 			fprintf(stderr, _("\n\n"
--				"Error during writing of the kernel configuration.\n"
--				"Your kernel configuration changes were NOT saved."
-+				"Error during writing of the Buildroot configuration.\n"
-+				"Your Buildroot configuration changes were NOT saved."
- 				"\n\n"));
- 			return 1;
- 		}
- 	case -1:
- 		printf(_("\n\n"
--			"*** End of Linux kernel configuration.\n"
--			"*** Execute 'make' to build the kernel or try 'make help'."
-+			"*** End of Buildroot configuration.\n"
-+			"*** Execute 'make' to build Buildroot or try 'make help'."
- 			"\n\n"));
- 		break;
- 	default:
- 		fprintf(stderr, _("\n\n"
--			"Your kernel configuration changes were NOT saved."
-+			"Your Buildroot configuration changes were NOT saved."
- 			"\n\n"));
- 	}
- 
 Index: config/qconf.cc
 ===================================================================
 --- config.orig/qconf.cc
diff --git a/package/config/patches/12-fix-glade-file-path.patch b/package/config/patches/12-fix-glade-file-path.patch
index 140201c..0824c32 100644
--- a/package/config/patches/12-fix-glade-file-path.patch
+++ b/package/config/patches/12-fix-glade-file-path.patch
@@ -6,7 +6,7 @@ Index: config/gconf.c
 ===================================================================
 --- config.orig/gconf.c
 +++ config/gconf.c
-@@ -1525,7 +1525,7 @@
+@@ -1524,7 +1524,7 @@
  	/* Determine GUI path */
  	env = getenv(SRCTREE);
  	if (env)
diff --git a/package/config/qconf.cc b/package/config/qconf.cc
index 5d65647..77a298c 100644
--- a/package/config/qconf.cc
+++ b/package/config/qconf.cc
@@ -1655,7 +1655,7 @@ void ConfigMainWindow::closeEvent(QCloseEvent* e)
 
 void ConfigMainWindow::showIntro(void)
 {
-	static const QString str = _("Welcome to the qconf graphical kernel configuration tool for Linux.\n\n"
+	static const QString str = _("Welcome to the qconf graphical configuration tool.\n\n"
 		"For each option, a blank box indicates the feature is disabled, a check\n"
 		"indicates it is enabled, and a dot indicates that it is to be compiled\n"
 		"as a module.  Clicking on the box will cycle through the three states.\n\n"
-- 
1.7.3.4
