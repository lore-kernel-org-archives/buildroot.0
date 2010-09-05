From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 5 Sep 2010 22:52:22 +0200
Subject: [Buildroot] [git commit master 1/1] kconfig: remove CONFIG_
	references in search/help
Message-ID: <20100905213835.26B698A4A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bfa9e9e2bd8b4d3f0dcc29c461ba5b061bc5d738
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We use BR2_*, not CONFIG_* - So remove references to CONFIG_ in search/help
windows.

Long term we should probably consider doing s/^BR2_/CONFIG_/ to get rid
of all this though.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    5 ++
 package/config/mconf.c                             |    3 +-
 package/config/menu.c                              |    2 +-
 .../patches/01-kconfig-kernel-to-buildroot.patch   |   66 +++++++++++--------
 4 files changed, 45 insertions(+), 31 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3501504..76eb105 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,5 +1,10 @@
 2010.11, Not yet released:
 
+	Fixes all over the tree.
+
+	Kconfig infrastructure rebased against 2.6.36-rc1, bringing
+	misc fixes + nconfig and savedefconfig targets.
+
 2010.08: Released August 31th, 2010:
 
 	Fixes all over the tree.
diff --git a/package/config/mconf.c b/package/config/mconf.c
index 3d1ed3a..c0903dd 100644
--- a/package/config/mconf.c
+++ b/package/config/mconf.c
@@ -315,8 +315,7 @@ static void search_conf(void)
 again:
 	dialog_clear();
 	dres = dialog_inputbox(_("Search Configuration Parameter"),
-			      _("Enter CONFIG_ (sub)string to search for "
-				"(with or without \"CONFIG\")"),
+			      _("Enter (sub)string to search for"),
 			      10, 75, "");
 	switch (dres) {
 	case 0:
diff --git a/package/config/menu.c b/package/config/menu.c
index 4fb5902..7f3b797 100644
--- a/package/config/menu.c
+++ b/package/config/menu.c
@@ -566,7 +566,7 @@ void menu_get_ext_help(struct menu *menu, struct gstr *help)
 
 	if (menu_has_help(menu)) {
 		if (sym->name) {
-			str_printf(help, "CONFIG_%s:\n\n", sym->name);
+			str_printf(help, "%s:\n\n", sym->name);
 			str_append(help, _(menu_get_help(menu)));
 			str_append(help, "\n");
 		}
diff --git a/package/config/patches/01-kconfig-kernel-to-buildroot.patch b/package/config/patches/01-kconfig-kernel-to-buildroot.patch
index 4e4354a..f77a54c 100644
--- a/package/config/patches/01-kconfig-kernel-to-buildroot.patch
+++ b/package/config/patches/01-kconfig-kernel-to-buildroot.patch
@@ -3,16 +3,16 @@
  confdata.c          |   12 ++++--------
  gconf.c             |    4 ++--
  gconf.glade         |    2 +-
- mconf.c             |   35 +++++++++++++++++------------------
+ mconf.c             |   38 ++++++++++++++++++--------------------
  qconf.cc            |    4 ++--
  zconf.tab.c_shipped |    2 +-
  zconf.y             |    2 +-
- 8 files changed, 34 insertions(+), 39 deletions(-)
+ 8 files changed, 35 insertions(+), 41 deletions(-)
 
-Index: config.new/conf.c
+Index: config/conf.c
 ===================================================================
---- config.new.orig/conf.c
-+++ config.new/conf.c
+--- config.orig/conf.c
++++ config/conf.c
 @@ -508,8 +508,8 @@
  		name = conf_get_configname();
  		if (stat(name, &tmpstat)) {
@@ -56,10 +56,10 @@ Index: config.new/conf.c
  			exit(1);
  		}
  	}
-Index: config.new/confdata.c
+Index: config/confdata.c
 ===================================================================
---- config.new.orig/confdata.c
-+++ config.new/confdata.c
+--- config.orig/confdata.c
++++ config/confdata.c
 @@ -579,7 +579,7 @@
  	if (!out)
  		return 1;
@@ -109,10 +109,10 @@ Index: config.new/confdata.c
  
  	for_all_symbols(i, sym) {
  		sym_calc_value(sym);
-Index: config.new/gconf.c
+Index: config/gconf.c
 ===================================================================
---- config.new.orig/gconf.c
-+++ config.new/gconf.c
+--- config.orig/gconf.c
++++ config/gconf.c
 @@ -210,8 +210,8 @@
  					  /*"style", PANGO_STYLE_OBLIQUE, */
  					  NULL);
@@ -124,10 +124,10 @@ Index: config.new/gconf.c
  	gtk_window_set_title(GTK_WINDOW(main_wnd), title);
  
  	gtk_widget_show(main_wnd);
-Index: config.new/gconf.glade
+Index: config/gconf.glade
 ===================================================================
---- config.new.orig/gconf.glade
-+++ config.new/gconf.glade
+--- config.orig/gconf.glade
++++ config/gconf.glade
 @@ -5,7 +5,7 @@
  
  <widget class="GtkWindow" id="window1">
@@ -137,10 +137,10 @@ Index: config.new/gconf.glade
    <property name="type">GTK_WINDOW_TOPLEVEL</property>
    <property name="window_position">GTK_WIN_POS_NONE</property>
    <property name="modal">False</property>
-Index: config.new/mconf.c
+Index: config/mconf.c
 ===================================================================
---- config.new.orig/mconf.c
-+++ config.new/mconf.c
+--- config.orig/mconf.c
++++ config/mconf.c
 @@ -25,10 +25,9 @@
  static const char mconf_readme[] = N_(
  "Overview\n"
@@ -220,7 +220,17 @@ Index: config.new/mconf.c
  		        config_filename, sym_get_string_value(sym));
  	if (size >= sizeof(menu_backtitle))
  		menu_backtitle[sizeof(menu_backtitle)-1] = '\0';
-@@ -834,7 +833,7 @@
+@@ -316,8 +315,7 @@
+ again:
+ 	dialog_clear();
+ 	dres = dialog_inputbox(_("Search Configuration Parameter"),
+-			      _("Enter CONFIG_ (sub)string to search for "
+-				"(with or without \"CONFIG\")"),
++			      _("Enter (sub)string to search for"),
+ 			      10, 75, "");
+ 	switch (dres) {
+ 	case 0:
+@@ -834,7 +832,7 @@
  		if (conf_get_changed())
  			res = dialog_yesno(NULL,
  					   _("Do you wish to save your "
@@ -229,7 +239,7 @@ Index: config.new/mconf.c
  					     "<ESC><ESC> to continue."),
  					   6, 60);
  		else
-@@ -846,20 +845,20 @@
+@@ -846,20 +844,20 @@
  	case 0:
  		if (conf_write(filename)) {
  			fprintf(stderr, _("\n\n"
@@ -255,10 +265,10 @@ Index: config.new/mconf.c
  			"\n\n"));
  	}
  
-Index: config.new/qconf.cc
+Index: config/qconf.cc
 ===================================================================
---- config.new.orig/qconf.cc
-+++ config.new/qconf.cc
+--- config.orig/qconf.cc
++++ config/qconf.cc
 @@ -1263,8 +1263,8 @@
  	char title[256];
  
@@ -270,10 +280,10 @@ Index: config.new/qconf.cc
  	setCaption(title);
  
  	width = configSettings->readNumEntry("/window width", d->width() - 64);
-Index: config.new/zconf.tab.c_shipped
+Index: config/zconf.tab.c_shipped
 ===================================================================
---- config.new.orig/zconf.tab.c_shipped
-+++ config.new/zconf.tab.c_shipped
+--- config.orig/zconf.tab.c_shipped
++++ config/zconf.tab.c_shipped
 @@ -2224,7 +2224,7 @@
  	modules_sym = sym_lookup(NULL, 0);
  	modules_sym->type = S_BOOLEAN;
@@ -283,10 +293,10 @@ Index: config.new/zconf.tab.c_shipped
  
  #if YYDEBUG
  	if (getenv("ZCONF_DEBUG"))
-Index: config.new/zconf.y
+Index: config/zconf.y
 ===================================================================
---- config.new.orig/zconf.y
-+++ config.new/zconf.y
+--- config.orig/zconf.y
++++ config/zconf.y
 @@ -479,7 +479,7 @@
  	modules_sym = sym_lookup(NULL, 0);
  	modules_sym->type = S_BOOLEAN;
-- 
1.7.1
