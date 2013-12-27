From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 27 Dec 2013 22:18:27 +0100
Subject: [Buildroot] [PATCH] support/kconfig: fix reference to kernel
Message-ID: <1388179109-23491-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There was some references to the kernel missed by
01-kconfig-kernel-to-buildroot.patch

This patch also update kconfig to the one used in 3.13-rc5.
The changes are really minor.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 support/kconfig/README.buildroot                   |  2 +-
 support/kconfig/expr.h                             |  2 +-
 support/kconfig/mconf.c                            | 62 +++++++++++-----------
 support/kconfig/menu.c                             | 11 ++--
 .../patches/01-kconfig-kernel-to-buildroot.patch   | 54 +++++++++++++------
 support/kconfig/qconf.cc                           |  5 ++
 support/kconfig/qconf.h                            |  1 +
 support/kconfig/symbol.c                           |  2 +-
 support/kconfig/zconf.l                            |  1 -
 9 files changed, 83 insertions(+), 57 deletions(-)

diff --git a/support/kconfig/README.buildroot b/support/kconfig/README.buildroot
index 6f65715..62e3a11 100644
--- a/support/kconfig/README.buildroot
+++ b/support/kconfig/README.buildroot
@@ -1,4 +1,4 @@
-This is a copy of the kconfig code in the kernel (currently 3.9-rc2) tweaked
+This is a copy of the kconfig code in the kernel (currently 3.13-rc5) tweaked
 to suit Buildroot.
 
 To update:
diff --git a/support/kconfig/expr.h b/support/kconfig/expr.h
index df198a5..ba663e1 100644
--- a/support/kconfig/expr.h
+++ b/support/kconfig/expr.h
@@ -93,7 +93,7 @@ struct symbol {
 #define SYMBOL_CHOICEVAL  0x0020  /* used as a value in a choice block */
 #define SYMBOL_VALID      0x0080  /* set when symbol.curr is calculated */
 #define SYMBOL_OPTIONAL   0x0100  /* choice is optional - values can be 'n' */
-#define SYMBOL_WRITE      0x0200  /* ? */
+#define SYMBOL_WRITE      0x0200  /* write symbol to file (KCONFIG_CONFIG) */
 #define SYMBOL_CHANGED    0x0400  /* ? */
 #define SYMBOL_AUTO       0x1000  /* value from environment variable */
 #define SYMBOL_CHECKED    0x2000  /* used during dependency checking */
diff --git a/support/kconfig/mconf.c b/support/kconfig/mconf.c
index 35e07e0..7d6cf80 100644
--- a/support/kconfig/mconf.c
+++ b/support/kconfig/mconf.c
@@ -25,7 +25,7 @@
 static const char mconf_readme[] = N_(
 "Overview\n"
 "--------\n"
-"This interface let you select features and parameters for the build.\n"
+"This interface lets you select features and parameters for the build.\n"
 "Features can either be built-in, modularized, or ignored. Parameters\n"
 "must be entered in as decimal or hexadecimal numbers or text.\n"
 "\n"
@@ -39,15 +39,15 @@ static const char mconf_readme[] = N_(
 "\n"
 "To change any of these features, highlight it with the cursor\n"
 "keys and press <Y> to build it in, <M> to make it a module or\n"
-"<N> to removed it.  You may also press the <Space Bar> to cycle\n"
-"through the available options (ie. Y->N->M->Y).\n"
+"<N> to remove it.  You may also press the <Space Bar> to cycle\n"
+"through the available options (i.e. Y->N->M->Y).\n"
 "\n"
 "Some additional keyboard hints:\n"
 "\n"
 "Menus\n"
 "----------\n"
-"o  Use the Up/Down arrow keys (cursor keys) to highlight the item\n"
-"   you wish to change or submenu wish to select and press <Enter>.\n"
+"o  Use the Up/Down arrow keys (cursor keys) to highlight the item you\n"
+"   wish to change or the submenu you wish to select and press <Enter>.\n"
 "   Submenus are designated by \"--->\", empty ones by \"----\".\n"
 "\n"
 "   Shortcut: Press the option's highlighted letter (hotkey).\n"
@@ -65,7 +65,7 @@ static const char mconf_readme[] = N_(
 "             there is a delayed response which you may find annoying.\n"
 "\n"
 "   Also, the <TAB> and cursor keys will cycle between <Select>,\n"
-"   <Exit> and <Help>.\n"
+"   <Exit>, <Help>, <Save>, and <Load>.\n"
 "\n"
 "o  To get help with an item, use the cursor keys to highlight <Help>\n"
 "   and press <ENTER>.\n"
@@ -105,7 +105,7 @@ static const char mconf_readme[] = N_(
 "Text Box    (Help Window)\n"
 "--------\n"
 "o  Use the cursor keys to scroll up/down/left/right.  The VI editor\n"
-"   keys h,j,k,l function here as do <u>, <d>, <SPACE BAR> and <B> for \n"
+"   keys h,j,k,l function here as do <u>, <d>, <SPACE BAR> and <B> for\n"
 "   those who are familiar with less and lynx.\n"
 "\n"
 "o  Press <E>, <X>, <q>, <Enter> or <Esc><Esc> to exit.\n"
@@ -117,23 +117,21 @@ static const char mconf_readme[] = N_(
 "those who, for various reasons, find it necessary to switch\n"
 "between different configurations.\n"
 "\n"
-"At the end of the main menu you will find two options.  One is\n"
-"for saving the current configuration to a file of your choosing.\n"
-"The other option is for loading a previously saved alternate\n"
-"configuration.\n"
+"The <Save> button will let you save the current configuration to\n"
+"a file of your choosing.  Use the <Load> button to load a previously\n"
+"saved alternate configuration.\n"
 "\n"
-"Even if you don't use alternate configuration files, but you\n"
-"find during a Menuconfig session that you have completely messed\n"
-"up your settings, you may use the \"Load Alternate...\" option to\n"
-"restore your previously saved settings from \".config\" without\n"
-"restarting Menuconfig.\n"
+"Even if you don't use alternate configuration files, but you find\n"
+"during a Menuconfig session that you have completely messed up your\n"
+"settings, you may use the <Load> button to restore your previously\n"
+"saved settings from \".config\" without restarting Menuconfig.\n"
 "\n"
 "Other information\n"
 "-----------------\n"
-"If you use Menuconfig in an XTERM window make sure you have your\n"
-"$TERM variable set to point to a xterm definition which supports color.\n"
-"Otherwise, Menuconfig will look rather bad.  Menuconfig will not\n"
-"display correctly in a RXVT window because rxvt displays only one\n"
+"If you use Menuconfig in an XTERM window, make sure you have your\n"
+"$TERM variable set to point to an xterm definition which supports\n"
+"color.  Otherwise, Menuconfig will look rather bad.  Menuconfig will\n"
+"not display correctly in an RXVT window because rxvt displays only one\n"
 "intensity of color, bright.\n"
 "\n"
 "Menuconfig will display larger menus on screens or xterms which are\n"
@@ -148,8 +146,8 @@ static const char mconf_readme[] = N_(
 "\n"
 "Optional personality available\n"
 "------------------------------\n"
-"If you prefer to have all of the options listed in a single menu, rather\n"
-"than the default multimenu hierarchy, run the menuconfig with\n"
+"If you prefer to have all of the options listed in a single menu,\n"
+"rather than the default multimenu hierarchy, run the menuconfig with\n"
 "MENUCONFIG_MODE environment variable set to single_menu. Example:\n"
 "\n"
 "make MENUCONFIG_MODE=single_menu menuconfig\n"
@@ -172,7 +170,7 @@ static const char mconf_readme[] = N_(
 " mono       => selects colors suitable for monochrome displays\n"
 " blackbg    => selects a color scheme with black background\n"
 " classic    => theme with blue background. The classic look\n"
-" bluetitle  => a LCD friendly version of classic. (default)\n"
+" bluetitle  => an LCD friendly version of classic. (default)\n"
 "\n"),
 menu_instructions[] = N_(
 	"Arrow keys navigate the menu.  "
@@ -238,24 +236,24 @@ search_help[] = N_(
 	"Symbol: FOO [=m]\n"
 	"Type  : tristate\n"
 	"Prompt: Foo bus is used to drive the bar HW\n"
-	"  Defined at drivers/pci/Kconfig:47\n"
-	"  Depends on: X86_LOCAL_APIC && X86_IO_APIC || IA64\n"
 	"  Location:\n"
 	"    -> Bus options (PCI, PCMCIA, EISA, ISA)\n"
 	"      -> PCI support (PCI [=y])\n"
 	"(1)     -> PCI access mode (<choice> [=y])\n"
+	"  Defined at drivers/pci/Kconfig:47\n"
+	"  Depends on: X86_LOCAL_APIC && X86_IO_APIC || IA64\n"
 	"  Selects: LIBCRC32\n"
-	"  Selected by: BAR\n"
+	"  Selected by: BAR [=n]\n"
 	"-----------------------------------------------------------------\n"
 	"o The line 'Type:' shows the type of the configuration option for\n"
 	"  this symbol (boolean, tristate, string, ...)\n"
 	"o The line 'Prompt:' shows the text used in the menu structure for\n"
 	"  this symbol\n"
-	"o The 'Defined at' line tell at what file / line number the symbol\n"
+	"o The 'Defined at' line tells at what file / line number the symbol\n"
 	"  is defined\n"
-	"o The 'Depends on:' line tell what symbols needs to be defined for\n"
+	"o The 'Depends on:' line tells what symbols need to be defined for\n"
 	"  this symbol to be visible in the menu (selectable)\n"
-	"o The 'Location:' lines tell where in the menu structure this symbol\n"
+	"o The 'Location:' lines tells where in the menu structure this symbol\n"
 	"  is located\n"
 	"    A location followed by a [=y] indicates that this is a\n"
 	"    selectable menu item - and the current value is displayed inside\n"
@@ -263,9 +261,9 @@ search_help[] = N_(
 	"    Press the key in the (#) prefix to jump directly to that\n"
 	"    location. You will be returned to the current search results\n"
 	"    after exiting this new menu.\n"
-	"o The 'Selects:' line tell what symbol will be automatically\n"
+	"o The 'Selects:' line tells what symbols will be automatically\n"
 	"  selected if this symbol is selected (y or m)\n"
-	"o The 'Selected by' line tell what symbol has selected this symbol\n"
+	"o The 'Selected by' line tells what symbol has selected this symbol\n"
 	"\n"
 	"Only relevant lines are shown.\n"
 	"\n\n"
@@ -961,7 +959,7 @@ static int handle_exit(void)
 	if (conf_get_changed())
 		res = dialog_yesno(NULL,
 				   _("Do you wish to save your new configuration?\n"
-				     "(Press <ESC><ESC> to continue kernel configuration.)"),
+				     "(Press <ESC><ESC> to continue Buildroot configuration.)"),
 				   6, 60);
 	else
 		res = -1;
diff --git a/support/kconfig/menu.c b/support/kconfig/menu.c
index c1d5320..db1512a 100644
--- a/support/kconfig/menu.c
+++ b/support/kconfig/menu.c
@@ -119,9 +119,10 @@ void menu_set_type(int type)
 		sym->type = type;
 		return;
 	}
-	menu_warn(current_entry, "type of '%s' redefined from '%s' to '%s'",
-	    sym->name ? sym->name : "<choice>",
-	    sym_type_name(sym->type), sym_type_name(type));
+	menu_warn(current_entry,
+		"ignoring type redefinition of '%s' from '%s' to '%s'",
+		sym->name ? sym->name : "<choice>",
+		sym_type_name(sym->type), sym_type_name(type));
 }
 
 struct property *menu_add_prop(enum prop_type type, char *prompt, struct expr *expr, struct expr *dep)
@@ -583,7 +584,7 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 		for (j = 4; --i >= 0; j += 2) {
 			menu = submenu[i];
 			if (head && location && menu == location)
-				jump->offset = r->len - 1;
+				jump->offset = strlen(r->s);
 			str_printf(r, "%*c-> %s", j, ' ',
 				   _(menu_get_prompt(menu)));
 			if (menu->sym) {
@@ -597,7 +598,7 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 }
 
 /*
- * get peoperty of type P_SYMBOL
+ * get property of type P_SYMBOL
  */
 static struct property *get_symbol_prop(struct symbol *sym)
 {
diff --git a/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch b/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
index 25b436b..d7568c0 100644
--- a/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
+++ b/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
@@ -6,10 +6,10 @@
  zconf.y             |    2 +-
  5 files changed, 7 insertions(+), 7 deletions(-)
 
-Index: b/gconf.glade
+Index: kconfig.new/gconf.glade
 ===================================================================
---- a/gconf.glade
-+++ b/gconf.glade
+--- kconfig.new.orig/gconf.glade	2013-12-27 21:47:12.884275756 +0100
++++ kconfig.new/gconf.glade	2013-12-27 21:47:12.876276072 +0100
 @@ -4,7 +4,7 @@
  
  <widget class="GtkWindow" id="window1">
@@ -19,11 +19,11 @@ Index: b/gconf.glade
    <property name="type">GTK_WINDOW_TOPLEVEL</property>
    <property name="window_position">GTK_WIN_POS_NONE</property>
    <property name="modal">False</property>
-Index: b/mconf.c
+Index: kconfig.new/mconf.c
 ===================================================================
---- a/mconf.c
-+++ b/mconf.c
-@@ -178,9 +178,9 @@
+--- kconfig.new.orig/mconf.c	2013-12-27 21:47:12.884275756 +0100
++++ kconfig.new/mconf.c	2013-12-27 21:47:12.876276072 +0100
+@@ -176,9 +176,9 @@
  	"Arrow keys navigate the menu.  "
  	"<Enter> selects submenus ---> (or empty submenus ----).  "
  	"Highlighted letters are hotkeys.  "
@@ -35,10 +35,19 @@ Index: b/mconf.c
  radiolist_instructions[] = N_(
  	"Use the arrow keys to navigate this window or "
  	"press the hotkey of the item you wish to select "
-Index: b/zconf.tab.c_shipped
+@@ -959,7 +959,7 @@
+ 	if (conf_get_changed())
+ 		res = dialog_yesno(NULL,
+ 				   _("Do you wish to save your new configuration?\n"
+-				     "(Press <ESC><ESC> to continue kernel configuration.)"),
++				     "(Press <ESC><ESC> to continue Buildroot configuration.)"),
+ 				   6, 60);
+ 	else
+ 		res = -1;
+Index: kconfig.new/zconf.tab.c_shipped
 ===================================================================
---- a/zconf.tab.c_shipped
-+++ b/zconf.tab.c_shipped
+--- kconfig.new.orig/zconf.tab.c_shipped	2013-12-27 21:47:12.884275756 +0100
++++ kconfig.new/zconf.tab.c_shipped	2013-12-27 21:47:12.880275914 +0100
 @@ -2297,7 +2297,7 @@
  
  	sym_init();
@@ -48,10 +57,10 @@ Index: b/zconf.tab.c_shipped
  
  	if (getenv("ZCONF_DEBUG"))
  		zconfdebug = 1;
-Index: b/zconf.y
+Index: kconfig.new/zconf.y
 ===================================================================
---- a/zconf.y
-+++ b/zconf.y
+--- kconfig.new.orig/zconf.y	2013-12-27 21:47:12.884275756 +0100
++++ kconfig.new/zconf.y	2013-12-27 21:47:12.880275914 +0100
 @@ -493,7 +493,7 @@
  
  	sym_init();
@@ -61,10 +70,10 @@ Index: b/zconf.y
  
  	if (getenv("ZCONF_DEBUG"))
  		zconfdebug = 1;
-Index: b/confdata.c
+Index: kconfig.new/confdata.c
 ===================================================================
---- a/confdata.c
-+++ b/confdata.c
+--- kconfig.new.orig/confdata.c	2013-12-27 21:47:12.884275756 +0100
++++ kconfig.new/confdata.c	2013-12-27 21:47:12.880275914 +0100
 @@ -25,7 +25,7 @@
  static const char *conf_filename;
  static int conf_lineno, conf_warnings, conf_unsaved;
@@ -83,3 +92,16 @@ Index: b/confdata.c
  
  	return name ? name : ".config";
  }
+Index: kconfig.new/qconf.cc
+===================================================================
+--- kconfig.new.orig/qconf.cc	2013-12-27 21:47:09.004428182 +0100
++++ kconfig.new/qconf.cc	2013-12-27 21:47:31.199553481 +0100
+@@ -70,7 +70,7 @@
+ }
+ 
+ ConfigSettings::ConfigSettings()
+-	: QSettings("kernel.org", "qconf")
++	: QSettings("buildroot.org", "qconf")
+ {
+ }
+ 
diff --git a/support/kconfig/qconf.cc b/support/kconfig/qconf.cc
index 1500c38..f630567 100644
--- a/support/kconfig/qconf.cc
+++ b/support/kconfig/qconf.cc
@@ -69,6 +69,11 @@ static inline QString qgettext(const QString& str)
 	return QString::fromLocal8Bit(gettext(str.latin1()));
 }
 
+ConfigSettings::ConfigSettings()
+	: QSettings("buildroot.org", "qconf")
+{
+}
+
 /**
  * Reads a list of integer values from the application settings.
  */
diff --git a/support/kconfig/qconf.h b/support/kconfig/qconf.h
index 3715b3e..bde0c6b 100644
--- a/support/kconfig/qconf.h
+++ b/support/kconfig/qconf.h
@@ -32,6 +32,7 @@ class ConfigMainWindow;
 
 class ConfigSettings : public QSettings {
 public:
+	ConfigSettings();
 	Q3ValueList<int> readSizes(const QString& key, bool *ok);
 	bool writeSizes(const QString& key, const Q3ValueList<int>& value);
 };
diff --git a/support/kconfig/symbol.c b/support/kconfig/symbol.c
index c9a6775..7caabdb 100644
--- a/support/kconfig/symbol.c
+++ b/support/kconfig/symbol.c
@@ -1047,7 +1047,7 @@ sym_re_search_free:
  * When we check for recursive dependencies we use a stack to save
  * current state so we can print out relevant info to user.
  * The entries are located on the call stack so no need to free memory.
- * Note inser() remove() must always match to properly clear the stack.
+ * Note insert() remove() must always match to properly clear the stack.
  */
 static struct dep_stack {
 	struct dep_stack *prev, *next;
diff --git a/support/kconfig/zconf.l b/support/kconfig/zconf.l
index 6555a47..1a9f53e 100644
--- a/support/kconfig/zconf.l
+++ b/support/kconfig/zconf.l
@@ -68,7 +68,6 @@ static void alloc_string(const char *str, int size)
 }
 %}
 
-ws	[ \n\t]
 n	[A-Za-z0-9_]
 
 %%
-- 
1.8.5.1
