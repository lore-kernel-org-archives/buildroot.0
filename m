From: Will Wagner <will_wagner@carallon.com>
Date: Thu,  1 Apr 2010 11:10:12 +0100
Subject: [Buildroot] [PATCH] matchbox: convert to autotools,
	fix build with start-notification, fix build with libxft
In-Reply-To: <20100325234920.5dae5e04@surf>
References: <20100325234920.5dae5e04@surf>
Message-ID: <1270116612-6658-1-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/matchbox/Config.in                         |   11 +-
 .../matchbox/libmatchbox-1.9-index-is-legacy.patch |   35 -
 .../matchbox/matchbox-common/matchbox-common.mk    |   14 +
 .../matchbox/matchbox-desktop/matchbox-desktop.mk  |   31 +
 .../matchbox/matchbox-desktop/mbdesktop_modules    |    9 +
 .../matchbox/matchbox-fakekey/matchbox-fakekey.mk  |   24 +
 .../matchbox-keyboard/matchbox-keyboard.mk         |   29 +
 .../matchbox-keyboard/mb-applet-kbd-wrapper.sh     |    8 +
 .../matchbox-lib-1.9-index-is-legacy.patch         |   35 +
 package/matchbox/matchbox-lib/matchbox-lib.mk      |   58 ++
 .../matchbox-panel-0.9.3-index-is-legacy.patch     |   20 -
 .../matchbox-panel-0.9.3-index-is-legacy.patch     |   20 +
 package/matchbox/matchbox-panel/matchbox-panel.mk  |   24 +
 .../matchbox-startup-monitor-0.1-true-false.patch  |   21 +
 .../matchbox-startup-monitor.mk                    |   16 +
 package/matchbox/matchbox-wm/matchbox-wm.mk        |   39 ++
 package/matchbox/matchbox.mk                       |  685 +-------------------
 package/matchbox/mb-applet-kbd-wrapper.sh          |    8 -
 .../mb-applet-startup-monitor-true-false.patch     |   21 -
 package/matchbox/mbdesktop_modules                 |    9 -
 target/device/Carallon/badger/crcgen               |  Bin 0 -> 10094 bytes
 21 files changed, 332 insertions(+), 785 deletions(-)
 delete mode 100644 package/matchbox/libmatchbox-1.9-index-is-legacy.patch
 create mode 100644 package/matchbox/matchbox-common/matchbox-common.mk
 create mode 100644 package/matchbox/matchbox-desktop/matchbox-desktop.mk
 create mode 100644 package/matchbox/matchbox-desktop/mbdesktop_modules
 create mode 100644 package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
 create mode 100644 package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
 create mode 100644 package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh
 create mode 100644 package/matchbox/matchbox-lib/matchbox-lib-1.9-index-is-legacy.patch
 create mode 100644 package/matchbox/matchbox-lib/matchbox-lib.mk
 delete mode 100644 package/matchbox/matchbox-panel-0.9.3-index-is-legacy.patch
 create mode 100644 package/matchbox/matchbox-panel/matchbox-panel-0.9.3-index-is-legacy.patch
 create mode 100644 package/matchbox/matchbox-panel/matchbox-panel.mk
 create mode 100644 package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor-0.1-true-false.patch
 create mode 100644 package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
 create mode 100644 package/matchbox/matchbox-wm/matchbox-wm.mk
 delete mode 100644 package/matchbox/mb-applet-kbd-wrapper.sh
 delete mode 100644 package/matchbox/mb-applet-startup-monitor-true-false.patch
 delete mode 100644 package/matchbox/mbdesktop_modules
 create mode 100755 target/device/Carallon/badger/crcgen

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index f573467..43189ca 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -2,20 +2,13 @@ config BR2_PACKAGE_MATCHBOX
 	bool "MatchBox Window Manager"
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	help
 	  http://projects.o-hand.com/matchbox
 
-config BR2_PACKAGE_MATCHBOX_SNOTIFY
-	bool "Enable Matchbox Startup Notification"
-	depends on BR2_PACKAGE_MATCHBOX
-	select BR2_PACKAGE_XAPP_XSM
-	help
-	  Compiles
-	  http://www.freedesktop.org/Software/startup-notification and
-	  its support in MatchBox.
-
 config BR2_PACKAGE_MATCHBOX_PANEL
 	bool "Matchbox Panel"
 	depends on BR2_PACKAGE_MATCHBOX
diff --git a/package/matchbox/libmatchbox-1.9-index-is-legacy.patch b/package/matchbox/libmatchbox-1.9-index-is-legacy.patch
deleted file mode 100644
index b486fb1..0000000
--- a/package/matchbox/libmatchbox-1.9-index-is-legacy.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-index() is a legacy function, not implemented in some uClibc
-configurations.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libmb/mbexp.c  |    2 +-
- libmb/mbmenu.c |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: libmatchbox-1.9/libmb/mbexp.c
-===================================================================
---- libmatchbox-1.9.orig/libmb/mbexp.c
-+++ libmatchbox-1.9/libmb/mbexp.c
-@@ -492,7 +492,7 @@
- 
-   /* get the family */
- 
--  if (index(spec, ',') != NULL || index(spec, '-') != NULL) 
-+  if (strchr(spec, ',') != NULL || strchr(spec, '-') != NULL) 
-     has_comma_delim = True;
- 
-   while (!got_family) {
-Index: libmatchbox-1.9/libmb/mbmenu.c
-===================================================================
---- libmatchbox-1.9.orig/libmb/mbmenu.c
-+++ libmatchbox-1.9/libmb/mbmenu.c
-@@ -433,7 +433,7 @@
-    {
-       s = p;
-       found   = NULL;
--      while(index("/\0", *p) == NULL) p++;
-+      while(strchr("/\0", *p) == NULL) p++;
-       if (*p != '\0') { *p = '\0'; p++; };
- 
-       item = current->items;
diff --git a/package/matchbox/matchbox-common/matchbox-common.mk b/package/matchbox/matchbox-common/matchbox-common.mk
new file mode 100644
index 0000000..81a1729
--- /dev/null
+++ b/package/matchbox/matchbox-common/matchbox-common.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# MatchBox Common
+#
+#############################################################
+
+MATCHBOX_COMMON_VERSION = 0.9.1
+MATCHBOX_COMMON_SOURCE = matchbox-common-$(MATCHBOX_COMMON_VERSION).tar.bz2
+MATCHBOX_COMMON_SITE = http://matchbox-project.org/sources/matchbox-common/$(MATCHBOX_COMMON_VERSION)
+MATCHBOX_COMMON_DEPENDENCIES = matchbox-lib
+
+#############################################################
+
+$(eval $(call AUTOTARGETS,package/matchbox,matchbox-common))
diff --git a/package/matchbox/matchbox-desktop/matchbox-desktop.mk b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
new file mode 100644
index 0000000..a3312af
--- /dev/null
+++ b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
@@ -0,0 +1,31 @@
+#############################################################
+#
+# MatchBox Desktop
+#
+#############################################################
+
+MATCHBOX_DESKTOP_VERSION = 0.9.1
+MATCHBOX_DESKTOP_SOURCE = matchbox-desktop-$(MATCHBOX_DESKTOP_VERSION).tar.bz2
+MATCHBOX_DESKTOP_SITE = http://matchbox-project.org/sources/matchbox-desktop/$(MATCHBOX_DESKTOP_VERSION)
+MATCHBOX_DESKTOP_LIBTOOL_PATCH = NO
+MATCHBOX_DESKTOP_DEPENDENCIES = matchbox-lib
+MATCHBOX_DESKTOP_CONF_OPT = --enable-expat
+
+define MATCHBOX_DESKTOP_POST_INSTALL_FIXES
+ cp -f ./package/matchbox/matchbox-desktop/mbdesktop_modules $(TARGET_DIR)/etc/matchbox/
+endef
+
+MATCHBOX_DESKTOP_POST_INSTALL_TARGET_HOOKS += MATCHBOX_DESKTOP_POST_INSTALL_FIXES
+
+#############################################################
+
+ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
+  MATCHBOX_DESKTOP_CONF_OPT+=--enable-startup-notification
+  MATCHBOX_DESKTOP_DEPENDENCIES+=startup-notification
+else
+  MATCHBOX_DESKTOP_CONF_OPT+=--disable-startup-notification
+endif
+
+#############################################################
+
+$(eval $(call AUTOTARGETS,package/matchbox,matchbox-desktop))
diff --git a/package/matchbox/matchbox-desktop/mbdesktop_modules b/package/matchbox/matchbox-desktop/mbdesktop_modules
new file mode 100644
index 0000000..8206dad
--- /dev/null
+++ b/package/matchbox/matchbox-desktop/mbdesktop_modules
@@ -0,0 +1,9 @@
+# This file lists the 'plug-ins' with any arguments to be loaded by
+# matchbox-desktop. 
+#
+# It can be overridden on a per-user basis by copying this file to ~/.matchbox/
+# and editing. 
+
+/usr/lib/tasks.so
+/usr/lib/dotdesktop.so
+# /usr/lib/simplefilebrowser.so /
diff --git a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
new file mode 100644
index 0000000..bcb6cc0
--- /dev/null
+++ b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
@@ -0,0 +1,24 @@
+#############################################################
+#
+# MatchBox Fakekey
+#
+#############################################################
+
+MATCHBOX_FAKEKEY_VERSION = 0.1
+MATCHBOX_FAKEKEY_SOURCE = libfakekey-$(MATCHBOX_FAKEKEY_VERSION).tar.bz2
+MATCHBOX_FAKEKEY_SITE = http://matchbox-project.org/sources/libfakekey/$(MATCHBOX_FAKEKEY_VERSION)
+MATCHBOX_FAKEKEY_LIBTOOL_PATCH = NO
+MATCHBOX_FAKEKEY_INSTALL_STAGING = YES
+MATCHBOX_FAKEKEY_DEPENDENCIES = matchbox-lib xlib_libXtst
+MATCHBOX_FAKEKEY_CONF_OPT = --enable-expat
+
+define MATCHBOX_FAKEKEY_POST_CONFIGURE_FIXES
+ $(SED) 's:-I[^$$].*/usr/include/freetype2:-I/usr/include/freetype2:' $(STAGING_DIR)/usr/lib/pkgconfig/libmb.pc
+ $(SED) 's:^SUBDIRS = fakekey src tests.*:SUBDIRS = fakekey src:g' $(MATCHBOX_FAKEKEY_DIR)/Makefile
+endef
+
+MATCHBOX_FAKEKEY_POST_CONFIGURE_HOOKS += MATCHBOX_FAKEKEY_POST_CONFIGURE_FIXES
+
+#############################################################
+
+$(eval $(call AUTOTARGETS,package/matchbox,matchbox-fakekey))
diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
new file mode 100644
index 0000000..7c6d455
--- /dev/null
+++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
@@ -0,0 +1,29 @@
+#############################################################
+#
+# MatchBox Keyboard
+#
+#############################################################
+
+MATCHBOX_KEYBOARD_VERSION = 0.1
+MATCHBOX_KEYBOARD_SOURCE = matchbox-keyboard-$(MATCHBOX_KEYBOARD_VERSION).tar.bz2
+MATCHBOX_KEYBOARD_SITE = http://matchbox-project.org/sources/matchbox-keyboard/$(MATCHBOX_KEYBOARD_VERSION)
+MATCHBOX_KEYBOARD_DEPENDENCIES = matchbox-lib matchbox-fakekey
+MATCHBOX_KEYBOARD_CONF_OPT = --enable-expat
+
+define MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
+ cp -dpf ./package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh $(TARGET_DIR)/usr/bin/
+endef
+
+MATCHBOX_KEYBOARD_POST_INSTALL_TARGET_HOOKS += MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
+
+#############################################################
+
+ifeq ($(BR2_PACKAGE_PANGO),y)
+  MATCHBOX_PKEYBOARD_CONF_OPT+=--enable-pango
+else
+  MATCHBOX_KEYBOARD_DEPENDENCIES+=xlib_libXft
+endif
+
+#############################################################
+
+$(eval $(call AUTOTARGETS,package/matchbox,matchbox-keyboard))
diff --git a/package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh b/package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh
new file mode 100644
index 0000000..be202b5
--- /dev/null
+++ b/package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+#
+
+killall matchbox-keyboard
+if [ ! $? -eq 0 ] 
+then
+    matchbox-keyboard &
+fi
diff --git a/package/matchbox/matchbox-lib/matchbox-lib-1.9-index-is-legacy.patch b/package/matchbox/matchbox-lib/matchbox-lib-1.9-index-is-legacy.patch
new file mode 100644
index 0000000..b486fb1
--- /dev/null
+++ b/package/matchbox/matchbox-lib/matchbox-lib-1.9-index-is-legacy.patch
@@ -0,0 +1,35 @@
+index() is a legacy function, not implemented in some uClibc
+configurations.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libmb/mbexp.c  |    2 +-
+ libmb/mbmenu.c |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: libmatchbox-1.9/libmb/mbexp.c
+===================================================================
+--- libmatchbox-1.9.orig/libmb/mbexp.c
++++ libmatchbox-1.9/libmb/mbexp.c
+@@ -492,7 +492,7 @@
+ 
+   /* get the family */
+ 
+-  if (index(spec, ',') != NULL || index(spec, '-') != NULL) 
++  if (strchr(spec, ',') != NULL || strchr(spec, '-') != NULL) 
+     has_comma_delim = True;
+ 
+   while (!got_family) {
+Index: libmatchbox-1.9/libmb/mbmenu.c
+===================================================================
+--- libmatchbox-1.9.orig/libmb/mbmenu.c
++++ libmatchbox-1.9/libmb/mbmenu.c
+@@ -433,7 +433,7 @@
+    {
+       s = p;
+       found   = NULL;
+-      while(index("/\0", *p) == NULL) p++;
++      while(strchr("/\0", *p) == NULL) p++;
+       if (*p != '\0') { *p = '\0'; p++; };
+ 
+       item = current->items;
diff --git a/package/matchbox/matchbox-lib/matchbox-lib.mk b/package/matchbox/matchbox-lib/matchbox-lib.mk
new file mode 100644
index 0000000..817a8da
--- /dev/null
+++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
@@ -0,0 +1,58 @@
+#############################################################
+#
+# MatchBox LIB
+#
+#############################################################
+
+MATCHBOX_LIB_VERSION = 1.9
+MATCHBOX_LIB_SOURCE = libmatchbox-$(MATCHBOX_LIB_VERSION).tar.bz2
+MATCHBOX_LIB_SITE = http://matchbox-project.org/sources/libmatchbox/$(MATCHBOX_LIB_VERSION)
+MATCHBOX_LIB_INSTALL_STAGING = YES
+MATCHBOX_LIB_DEPENDENCIES = host-pkg-config expat xlib_libXext
+MATCHBOX_LIB_CONF_OPT = --enable-expat --disable-doxygen-docs
+
+define MATCHBOX_LIB_POST_INSTALL_FIXES
+ $(SED) 's:-I[^$$].*/usr/include/freetype2:-I/usr/include/freetype2:' $(STAGING_DIR)/usr/lib/pkgconfig/libmb.pc
+endef
+
+MATCHBOX_LIB_POST_INSTALL_STAGING_HOOKS += MATCHBOX_LIB_POST_INSTALL_FIXES
+
+#############################################################
+
+ifeq ($(BR2_PACKAGE_X11R7_LIBXCOMPOSITE),y)
+ifeq ($(BR2_PACKAGE_X11R7_LIBXPM),y)
+  MATCHBOX_LIB_DEPENDENCIES+=xlib_libXpm
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+  MATCHBOX_LIB_CONF_OPT+=--enable-jpeg
+  MATCHBOX_LIB_DEPENDENCIES+=jpeg
+else
+  MATCHBOX_LIB_CONF_OPT+=--disable-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+  MATCHBOX_LIB_CONF_OPT+=--enable-png
+  MATCHBOX_LIB_DEPENDENCIES+=libpng
+else
+  MATCHBOX_LIB_CONF_OPT+=--disable-png
+endif
+
+ifeq ($(BR2_PACKAGE_PANGO),y)
+  MATCHBOX_LIB_CONF_OPT+=--enable-pango
+  MATCHBOX_LIB_DEPENDENCIES+=pango
+else
+  MATCHBOX_LIB_CONF_OPT+=--disable-pango
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
+  MATCHBOX_LIB_CONF_OPT+=--enable-xft
+  MATCHBOX_LIB_DEPENDENCIES+=xlib_libXft
+else
+  MATCHBOX_LIB_CONF_OPT+=--disable-xft
+endif
+
+#############################################################
+
+$(eval $(call AUTOTARGETS,package/matchbox,matchbox-lib))
diff --git a/package/matchbox/matchbox-panel-0.9.3-index-is-legacy.patch b/package/matchbox/matchbox-panel-0.9.3-index-is-legacy.patch
deleted file mode 100644
index 925c326..0000000
--- a/package/matchbox/matchbox-panel-0.9.3-index-is-legacy.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Replace the legacy index() with strchr()
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- applets/mb-applet-menu-launcher.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: matchbox-panel-0.9.3/applets/mb-applet-menu-launcher.c
-===================================================================
---- matchbox-panel-0.9.3.orig/applets/mb-applet-menu-launcher.c
-+++ matchbox-panel-0.9.3/applets/mb-applet-menu-launcher.c
-@@ -280,7 +280,7 @@
- 	 DBG("\tkey %s ", key);
-          if (*(++p) == '"') { p++; tc = sc; } /* skip "'s */
- 	 val = p;
--	 while(index(tc,*p) == NULL)
-+	 while(strchr(tc,*p) == NULL)
- 	 {
- 	    if (*p == '\\' && *(p+1) == '"') p++;  /* skip \" */
- 	    p++;
diff --git a/package/matchbox/matchbox-panel/matchbox-panel-0.9.3-index-is-legacy.patch b/package/matchbox/matchbox-panel/matchbox-panel-0.9.3-index-is-legacy.patch
new file mode 100644
index 0000000..925c326
--- /dev/null
+++ b/package/matchbox/matchbox-panel/matchbox-panel-0.9.3-index-is-legacy.patch
@@ -0,0 +1,20 @@
+Replace the legacy index() with strchr()
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ applets/mb-applet-menu-launcher.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: matchbox-panel-0.9.3/applets/mb-applet-menu-launcher.c
+===================================================================
+--- matchbox-panel-0.9.3.orig/applets/mb-applet-menu-launcher.c
++++ matchbox-panel-0.9.3/applets/mb-applet-menu-launcher.c
+@@ -280,7 +280,7 @@
+ 	 DBG("\tkey %s ", key);
+          if (*(++p) == '"') { p++; tc = sc; } /* skip "'s */
+ 	 val = p;
+-	 while(index(tc,*p) == NULL)
++	 while(strchr(tc,*p) == NULL)
+ 	 {
+ 	    if (*p == '\\' && *(p+1) == '"') p++;  /* skip \" */
+ 	    p++;
diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
new file mode 100644
index 0000000..573e323
--- /dev/null
+++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
@@ -0,0 +1,24 @@
+#############################################################
+#
+# MatchBox Panel
+#
+#############################################################
+
+MATCHBOX_PANEL_VERSION = 0.9.3
+MATCHBOX_PANEL_SOURCE = matchbox-panel-$(MATCHBOX_PANEL_VERSION).tar.bz2
+MATCHBOX_PANEL_SITE = http://matchbox-project.org/sources/matchbox-panel/$(MATCHBOX_PANEL_VERSION)
+MATCHBOX_PANEL_DEPENDENCIES = matchbox-lib
+MATCHBOX_PANEL_CONF_OPT = --enable-expat
+
+#############################################################
+
+ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
+  MATCHBOX_PANEL_CONF_OPT+=--enable-startup-notification
+  MATCHBOX_PANEL_DEPENDENCIES+=startup-notification matchbox-startup-monitor
+else
+  MATCHBOX_PANEL_CONF_OPT+=--disable-startup-notification
+endif
+
+#############################################################
+
+$(eval $(call AUTOTARGETS,package/matchbox,matchbox-panel))
diff --git a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor-0.1-true-false.patch b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor-0.1-true-false.patch
new file mode 100644
index 0000000..c92a077
--- /dev/null
+++ b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor-0.1-true-false.patch
@@ -0,0 +1,21 @@
+mbmonitor uses TRUE / FALSE without defining them
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ mbmonitor.c |    3 +++
+ 1 file changed, 3 insertions(+)
+
+Index: mb-applet-startup-monitor-0.1/mbmonitor.c
+===================================================================
+--- mb-applet-startup-monitor-0.1.orig/mbmonitor.c
++++ mb-applet-startup-monitor-0.1/mbmonitor.c
+@@ -43,6 +43,9 @@
+ #define POLLTIME	   10
+ #define HOURGLASS_N_FRAMES 8 
+ 
++#define FALSE		   0
++#define TRUE		   1
++
+ typedef struct LaunchList LaunchList;
+ 
+ struct LaunchList
diff --git a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
new file mode 100644
index 0000000..8f3d7ca
--- /dev/null
+++ b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# MatchBox Applet Startup monitor
+#
+#############################################################
+
+MATCHBOX_STARTUP_MONITOR_VERSION = 0.1
+MATCHBOX_STARTUP_MONITOR_SOURCE = mb-applet-startup-monitor-$(MATCHBOX_STARTUP_MONITOR_VERSION).tar.bz2
+MATCHBOX_STARTUP_MONITOR_SITE = http://matchbox-project.org/sources/mb-applet-startup-monitor/$(MATCHBOX_STARTUP_MONITOR_VERSION)
+MATCHBOX_STARTUP_MONITOR_LIBTOOL_PATCH = NO
+MATCHBOX_STARTUP_MONITOR_DEPENDENCIES = matchbox-lib startup-notification
+MATCHBOX_STARTUP_MONITOR_CONF_OPT =
+
+#############################################################
+
+$(eval $(call AUTOTARGETS,package/matchbox,matchbox-startup-monitor))
diff --git a/package/matchbox/matchbox-wm/matchbox-wm.mk b/package/matchbox/matchbox-wm/matchbox-wm.mk
new file mode 100644
index 0000000..fbf3456
--- /dev/null
+++ b/package/matchbox/matchbox-wm/matchbox-wm.mk
@@ -0,0 +1,39 @@
+#############################################################
+#
+# MatchBox WM
+#
+#############################################################
+
+MATCHBOX_WM_VERSION = 1.2
+MATCHBOX_WM_SOURCE = matchbox-window-manager-$(MATCHBOX_WM_VERSION).tar.bz2
+MATCHBOX_WM_SITE = http://matchbox-project.org/sources/matchbox-window-manager/$(MATCHBOX_WM_VERSION)
+MATCHBOX_WM_DEPENDENCIES = matchbox-lib
+MATCHBOX_WM_CONF_OPT = --enable-expat
+
+#############################################################
+
+ifeq ($(BR2_PACKAGE_X11R7_LIBXCOMPOSITE),y)
+ifeq ($(BR2_PACKAGE_X11R7_LIBXPM),y)
+  MATCHBOX_WM_CONF_OPT+=--enable-composite
+  MATCHBOX_WM_DEPENDENCIES+=xlib_libXcomposite
+  MATCHBOX_WM_DEPENDENCIES+=xlib_libXpm
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
+  #MATCHBOX_WM_OPTS+=--enable-standalone-xft
+  MATCHBOX_WM_DEPENDENCIES+=xlib_libXft
+else
+  #MATCHBOX_WM_OPTS+=--disable-standalone-xft
+endif
+
+ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
+  MATCHBOX_WM_CONF_OPT+=--enable-startup-notification
+  MATCHBOX_WM_DEPENDENCIES+=startup-notification
+else
+  MATCHBOX_WM_CONF_OPT+=--disable-startup-notification
+endif
+
+#############################################################
+
+$(eval $(call AUTOTARGETS,package/matchbox,matchbox-wm))
diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index 4abc9d6..abda915 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -1,685 +1,4 @@
-#############################################################
-#
-# MatchBox WM
-#
-#############################################################
-MATCHBOX_SITE:=http://matchbox-project.org/sources/
-MATCHBOX_CAT:=$(BZCAT)
-
-MATCHBOX_LIB_VERSION:=1.9
-MATCHBOX_LIB_SOURCE:=libmatchbox-$(MATCHBOX_LIB_VERSION).tar.bz2
-MATCHBOX_LIB_DIR:=$(BUILD_DIR)/libmatchbox-$(MATCHBOX_LIB_VERSION)
-
-MATCHBOX_SNOTIFY_VERSION:=0.9
-MATCHBOX_SNOTIFY_SOURCE:=startup-notification-$(MATCHBOX_SNOTIFY_VERSION).tar.bz2
-MATCHBOX_SNOTIFY_DIR:=$(BUILD_DIR)/startup-notification-$(MATCHBOX_SNOTIFY_VERSION)
-#MATCHBOX_SNOTIFY_SITE:=http://www.freedesktop.org/software/startup-notification/releases
-MATCHBOX_SNOTIFY_SITE:=http://ftp.gnome.org/pub/GNOME/sources/startup-notification/$(MATCHBOX_SNOTIFY_VERSION)
-MATCHBOX_SNOTIFY_CAT:=$(BZCAT)
-MATCHBOX_SNOTIFY_BIN:=libstartup-notification-1.so
-
-MATCHBOX_WM_MAJORVER:=1.2
-MATCHBOX_WM_MINORVER:=
-#MATCHBOX_WM_VERSION:=$(MATCHBOX_WM_MAJORVER).$(MATCHBOX_WM_MINORVER)
-MATCHBOX_WM_VERSION:=$(MATCHBOX_WM_MAJORVER)
-MATCHBOX_WM_BIN:=matchbox-window-manager
-MATCHBOX_WM_SOURCE:=$(MATCHBOX_WM_BIN)-$(MATCHBOX_WM_VERSION).tar.bz2
-MATCHBOX_WM_DIR:=$(BUILD_DIR)/$(MATCHBOX_WM_BIN)-$(MATCHBOX_WM_VERSION)
-
-MATCHBOX_CN_MAJORVER:=0.9
-MATCHBOX_CN_MINORVER:=1
-MATCHBOX_CN_VERSION:=$(MATCHBOX_CN_MAJORVER).$(MATCHBOX_CN_MINORVER)
-MATCHBOX_CN_BIN:=matchbox-common
-MATCHBOX_CN_SOURCE:=$(MATCHBOX_CN_BIN)-$(MATCHBOX_CN_VERSION).tar.bz2
-MATCHBOX_CN_DIR:=$(BUILD_DIR)/$(MATCHBOX_CN_BIN)-$(MATCHBOX_CN_VERSION)
-
-MATCHBOX_PL_MAJORVER:=0.9
-MATCHBOX_PL_MINORVER:=3
-MATCHBOX_PL_VERSION:=$(MATCHBOX_PL_MAJORVER).$(MATCHBOX_PL_MINORVER)
-MATCHBOX_PL_BIN:=matchbox-panel
-MATCHBOX_PL_SOURCE:=$(MATCHBOX_PL_BIN)-$(MATCHBOX_PL_VERSION).tar.bz2
-MATCHBOX_PL_DIR:=$(BUILD_DIR)/$(MATCHBOX_PL_BIN)-$(MATCHBOX_PL_VERSION)
-
-MATCHBOX_SM_MAJORVER:=0.1
-MATCHBOX_SM_MINORVER:=
-MATCHBOX_SM_VERSION:=$(MATCHBOX_SM_MAJORVER)$(MATCHBOX_SM_MINORVER)
-MATCHBOX_SM_BIN:=mb-applet-startup-monitor
-MATCHBOX_SM_SOURCE:=$(MATCHBOX_SM_BIN)-$(MATCHBOX_SM_VERSION).tar.bz2
-MATCHBOX_SM_DIR:=$(BUILD_DIR)/$(MATCHBOX_SM_BIN)-$(MATCHBOX_SM_VERSION)
-
-MATCHBOX_DP_MAJORVER:=0.9
-MATCHBOX_DP_MINORVER:=1
-MATCHBOX_DP_VERSION:=$(MATCHBOX_DP_MAJORVER).$(MATCHBOX_DP_MINORVER)
-MATCHBOX_DP_BIN:=matchbox-desktop
-MATCHBOX_DP_SOURCE:=$(MATCHBOX_DP_BIN)-$(MATCHBOX_DP_VERSION).tar.bz2
-MATCHBOX_DP_DIR:=$(BUILD_DIR)/$(MATCHBOX_DP_BIN)-$(MATCHBOX_DP_VERSION)
-
-MATCHBOX_FK_MAJORVER:=0.1
-MATCHBOX_FK_MINORVER:=
-#MATCHBOX_FK_VERSION:=$(MATCHBOX_FK_MAJORVER).$(MATCHBOX_FK_MINORVER)
-MATCHBOX_FK_VERSION:=$(MATCHBOX_FK_MAJORVER)
-MATCHBOX_FK_BIN:=libfakekey
-MATCHBOX_FK_SOURCE:=$(MATCHBOX_FK_BIN)-$(MATCHBOX_FK_VERSION).tar.bz2
-MATCHBOX_FK_DIR:=$(BUILD_DIR)/$(MATCHBOX_FK_BIN)-$(MATCHBOX_FK_VERSION)
-
-MATCHBOX_KB_MAJORVER:=0.1
-MATCHBOX_KB_MINORVER:=
-#MATCHBOX_KB_VERSION:=$(MATCHBOX_KB_MAJORVER).$(MATCHBOX_KB_MINORVER)
-MATCHBOX_KB_VERSION:=$(MATCHBOX_KB_MAJORVER)
-MATCHBOX_KB_BIN:=matchbox-keyboard
-MATCHBOX_KB_SOURCE:=$(MATCHBOX_KB_BIN)-$(MATCHBOX_KB_VERSION).tar.bz2
-MATCHBOX_KB_DIR:=$(BUILD_DIR)/$(MATCHBOX_KB_BIN)-$(MATCHBOX_KB_VERSION)
-
-#############################################################
-
-$(DL_DIR)/$(MATCHBOX_LIB_SOURCE):
-	$(call DOWNLOAD,$(MATCHBOX_SITE)/libmatchbox/$(MATCHBOX_LIB_VERSION),$(MATCHBOX_LIB_SOURCE))
-
-$(DL_DIR)/$(MATCHBOX_SNOTIFY_SOURCE):
-	$(call DOWNLOAD,$(MATCHBOX_SNOTIFY_SITE),$(MATCHBOX_SNOTIFY_SOURCE))
-
-$(DL_DIR)/$(MATCHBOX_WM_SOURCE):
-	$(call DOWNLOAD,$(MATCHBOX_SITE)/$(MATCHBOX_WM_BIN)/$(MATCHBOX_WM_MAJORVER),$(MATCHBOX_WM_SOURCE))
-
-$(DL_DIR)/$(MATCHBOX_SM_SOURCE):
-	$(call DOWNLOAD,$(MATCHBOX_SITE)/$(MATCHBOX_SM_BIN)/$(MATCHBOX_SM_MAJORVER),$(MATCHBOX_SM_SOURCE))
-
-#$(DL_DIR)/$(MATCHBOX_DM_SOURCE):
-#	$(call DOWNLOAD,$(MATCHBOX_SITE)/$(MATCHBOX_SM_BIN)/$(MATCHBOX_SM_MAJORVER),$(MATCHBOX_SM_SOURCE))
-
-$(DL_DIR)/$(MATCHBOX_CN_SOURCE):
-	$(call DOWNLOAD,$(MATCHBOX_SITE)/$(MATCHBOX_CN_BIN)/$(MATCHBOX_CN_MAJORVER),$(MATCHBOX_CN_SOURCE))
-
-$(DL_DIR)/$(MATCHBOX_PL_SOURCE):
-	$(call DOWNLOAD,$(MATCHBOX_SITE)/$(MATCHBOX_PL_BIN)/$(MATCHBOX_PL_MAJORVER),$(MATCHBOX_PL_SOURCE))
-
-$(DL_DIR)/$(MATCHBOX_DP_SOURCE):
-	$(call DOWNLOAD,$(MATCHBOX_SITE)/$(MATCHBOX_DP_BIN)/$(MATCHBOX_DP_MAJORVER),$(MATCHBOX_DP_SOURCE))
-
-$(DL_DIR)/$(MATCHBOX_FK_SOURCE):
-	$(call DOWNLOAD,$(MATCHBOX_SITE)/$(MATCHBOX_FK_BIN)/$(MATCHBOX_FK_MAJORVER),$(MATCHBOX_FK_SOURCE))
-
-$(DL_DIR)/$(MATCHBOX_KB_SOURCE):
-	$(call DOWNLOAD,$(MATCHBOX_SITE)/$(MATCHBOX_KB_BIN)/$(MATCHBOX_KB_MAJORVER),$(MATCHBOX_KB_SOURCE))
-
-
-matchbox-source: $(DL_DIR)/$(MATCHBOX_LIB_SOURCE) $(DL_DIR)/$(MATCHBOX_WM_SOURCE)
-
-matchbox-panel-source: $(DL_DIR)/$(MATCHBOX_CN_SOURCE) $(DL_DIR)/$(MATCHBOX_PL_SOURCE)
-
-matchbox-desktop-source: $(DL_DIR)/$(MATCHBOX_DP_SOURCE)
-
-matchbox-keyboard-source: $(DL_DIR)/$(MATCHBOX_FK_SOURCE) $(DL_DIR)/$(MATCHBOX_KB_SOURCE)
-
-$(MATCHBOX_LIB_DIR)/.unpacked: $(DL_DIR)/$(MATCHBOX_LIB_SOURCE)
-	$(MATCHBOX_CAT) $(DL_DIR)/$(MATCHBOX_LIB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MATCHBOX_LIB_DIR) package/matchbox/ libmatchbox\*.patch
-	touch $(MATCHBOX_LIB_DIR)/.unpacked
-
-$(MATCHBOX_SNOTIFY_DIR)/.unpacked: $(DL_DIR)/$(MATCHBOX_SNOTIFY_SOURCE)
-	$(MATCHBOX_SNOTIFY_CAT) $(DL_DIR)/$(MATCHBOX_SNOTIFY_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(MATCHBOX_SNOTIFY_DIR)/.unpacked
-
-$(MATCHBOX_WM_DIR)/.unpacked: $(DL_DIR)/$(MATCHBOX_WM_SOURCE)
-	$(MATCHBOX_CAT) $(DL_DIR)/$(MATCHBOX_WM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(MATCHBOX_WM_DIR)/.unpacked
-
-$(MATCHBOX_SM_DIR)/.unpacked: $(DL_DIR)/$(MATCHBOX_SM_SOURCE)
-	$(MATCHBOX_CAT) $(DL_DIR)/$(MATCHBOX_SM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MATCHBOX_SM_DIR) package/matchbox/ mb-applet-startup-monitor\*.patch
-	touch $(MATCHBOX_SM_DIR)/.unpacked
-
-$(MATCHBOX_CN_DIR)/.unpacked: $(DL_DIR)/$(MATCHBOX_CN_SOURCE)
-	$(MATCHBOX_CAT) $(DL_DIR)/$(MATCHBOX_CN_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(MATCHBOX_CN_DIR)/.unpacked
-
-$(MATCHBOX_PL_DIR)/.unpacked: $(DL_DIR)/$(MATCHBOX_PL_SOURCE)
-	$(MATCHBOX_CAT) $(DL_DIR)/$(MATCHBOX_PL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MATCHBOX_PL_DIR) package/matchbox/ matchbox-panel\*.patch
-	touch $(MATCHBOX_PL_DIR)/.unpacked
-
-$(MATCHBOX_DP_DIR)/.unpacked: $(DL_DIR)/$(MATCHBOX_DP_SOURCE)
-	$(MATCHBOX_CAT) $(DL_DIR)/$(MATCHBOX_DP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(SED) 's:mbfolder\.png:mbtasks\.png:g' $(MATCHBOX_DP_DIR)/modules/tasks.c
-	toolchain/patch-kernel.sh $(MATCHBOX_DP_DIR) package/ buildroot-libtool.patch
-	touch $(MATCHBOX_DP_DIR)/.unpacked
-
-$(MATCHBOX_FK_DIR)/.unpacked: $(DL_DIR)/$(MATCHBOX_FK_SOURCE)
-	$(MATCHBOX_CAT) $(DL_DIR)/$(MATCHBOX_FK_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(MATCHBOX_FK_DIR)/.unpacked
-
-$(MATCHBOX_KB_DIR)/.unpacked: $(DL_DIR)/$(MATCHBOX_KB_SOURCE)
-	$(MATCHBOX_CAT) $(DL_DIR)/$(MATCHBOX_KB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(MATCHBOX_KB_DIR)/.unpacked
-
-#############################################################
-
-MATCHBOX_LIB_OPTS:=
-MATCHBOX_LIB_DEPS:=
-
-MATCHBOX_WM_OPTS:=
-MATCHBOX_WM_DEPS:=xlib_libXdamage
-MATCHBOX_WM_DEPS+=xlib_libXcursor
-
-MATCHBOX_KB_DEPS:=
-
-ifeq ($(BR2_PACKAGE_X11R7_LIBXCOMPOSITE),y)
-ifeq ($(BR2_PACKAGE_X11R7_LIBXPM),y)
-  MATCHBOX_WM_OPTS+=--enable-composite
-  MATCHBOX_WM_DEPS+=xlib_libXcomposite
-  MATCHBOX_WM_DEPS+=xlib_libXpm
-  MATCHBOX_LIB_DEPS+=xlib_libXpm
-endif
-endif
-
-MATCHBOX_SNOTIFY_OPTS:=
-MATCHBOX_SNOTIFY_DEPS:=
-MATCHBOX_PANEL_DEPS:=
-
-ifeq ($(BR2_PACKAGE_MATCHBOX_SNOTIFY),y)
-  MATCHBOX_SNOTIFY_OPTS+=--enable-startup-notification
-  MATCHBOX_SNOTIFY_DEPS+=xlib_libSM
-  MATCHBOX_SNOTIFY_DEPS+=$(TARGET_DIR)/usr/lib/$(MATCHBOX_SNOTIFY_BIN)
-  MATCHBOX_PANEL_DEPS+=$(TARGET_DIR)/usr/bin/$(MATCHBOX_SM_BIN)
-else
-  MATCHBOX_SNOTIFY_OPTS+=--disable-startup-notification
-endif
-
-ifeq ($(BR2_PACKAGE_JPEG),y)
-  MATCHBOX_LIB_OPTS+=--enable-jpeg
-  MATCHBOX_LIB_DEPS+=jpeg
-else
-  MATCHBOX_LIB_OPTS+=--disable-jpeg
-endif
-
-ifeq ($(BR2_PACKAGE_LIBPNG),y)
-  MATCHBOX_LIB_OPTS+=--enable-png
-  MATCHBOX_LIB_DEPS+=libpng
-else
-  MATCHBOX_LIB_OPTS+=--disable-png
-endif
-
-ifeq ($(BR2_PACKAGE_PANGO),y)
-  MATCHBOX_LIB_OPTS+=--enable-pango
-  MATCHBOX_LIB_DEPS+=pango
-  MATCHBOX_KB_OPTS+=--enable-pango
-else
-  MATCHBOX_LIB_OPTS+=--disable-pango
-  MATCHBOX_KB_DEPS+=xlib_libXft
-endif
-
-ifeq ($(BR2_PACKAGE_X11R7_LIBXFT2),y)
-  MATCHBOX_LIB_OPTS+=--enable-xft
-  MATCHBOX_LIB_DEPS+=xlib_libXft2
-  #MATCHBOX_WM_OPTS+=--enable-standalone-xft
-  MATCHBOX_WM_DEPS+=xlib_libXft2
-else
-  MATCHBOX_LIB_OPTS+=--disable-xft
-  #MATCHBOX_WM_OPTS+=--disable-standalone-xft
-endif
-
-
-$(MATCHBOX_LIB_DIR)/.configured: $(MATCHBOX_LIB_DIR)/.unpacked
-	(cd $(MATCHBOX_LIB_DIR); rm -f config.cache; \
-	$(TARGET_CONFIGURE_OPTS) \
-	./configure $(QUIET) \
-	--target=$(GNU_TARGET_NAME) \
-	--host=$(GNU_TARGET_NAME) \
-	--build=$(GNU_HOST_NAME) \
-	--disable-static \
-	--prefix=/usr \
-	--sysconfdir=/etc \
-	--localstatedir=/var \
-	--datadir=/usr/share/matchbox \
-	--libdir=$(STAGING_DIR)/usr/lib \
-	--includedir=$(STAGING_DIR)/usr/include \
-	--enable-expat \
-	--disable-doxygen-docs \
-	--with-expat-includes=$(STAGING_DIR)/usr/include \
-	--with-expat-lib=$(STAGING_DIR)/usr/lib \
-	--with-x \
-	--x-includes=$(STAGING_DIR)/usr/include/X11 \
-	--x-libraries=$(STAGING_DIR)/usr/lib \
-	$(MATCHBOX_LIB_OPTS) \
-	)
-	touch $(MATCHBOX_LIB_DIR)/.configured
-
-$(MATCHBOX_SNOTIFY_DIR)/.configured: $(MATCHBOX_SNOTIFY_DIR)/.unpacked
-	(cd $(MATCHBOX_SNOTIFY_DIR); rm -f config.cache; \
-	$(TARGET_CONFIGURE_OPTS) \
-	lf_cv_sane_realloc=no \
-	./configure $(QUIET) \
-	--target=$(GNU_TARGET_NAME) \
-	--host=$(GNU_TARGET_NAME) \
-	--build=$(GNU_HOST_NAME) \
-	--disable-static \
-	--prefix=/usr \
-	--sysconfdir=/etc \
-	--localstatedir=/var \
-	--datadir=/usr/share \
-	--libdir=$(STAGING_DIR)/usr/lib \
-	--includedir=/usr/include \
-	--with-x \
-	--x-includes=$(STAGING_DIR)/usr/include/X11 \
-	--x-libraries=$(STAGING_DIR)/usr/lib \
-	)
-	touch $(MATCHBOX_SNOTIFY_DIR)/.configured
-
-$(MATCHBOX_WM_DIR)/.configured: $(MATCHBOX_WM_DIR)/.unpacked
-	(cd $(MATCHBOX_WM_DIR); rm -f config.cache; \
-	$(TARGET_CONFIGURE_OPTS) \
-	./configure $(QUIET) \
-	--target=$(GNU_TARGET_NAME) \
-	--host=$(GNU_TARGET_NAME) \
-	--build=$(GNU_HOST_NAME) \
-	--disable-static \
-	--prefix=/usr \
-	--sysconfdir=/etc \
-	--localstatedir=/var \
-	--datadir=/usr/share/matchbox \
-	--libdir=$(STAGING_DIR)/usr/lib \
-	--includedir=$(STAGING_DIR)/usr/include \
-	--enable-expat \
-	--with-expat-includes=$(STAGING_DIR)/usr/include \
-	--with-expat-lib=$(STAGING_DIR)/usr/lib \
-	--with-x \
-	--x-includes=$(STAGING_DIR)/usr/include/X11 \
-	--x-libraries=$(STAGING_DIR)/usr/lib \
-	$(MATCHBOX_WM_OPTS) \
-	$(MATCHBOX_SNOTIFY_OPTS) \
-	)
-	touch $(MATCHBOX_WM_DIR)/.configured
-
-$(MATCHBOX_SM_DIR)/.configured: $(MATCHBOX_SM_DIR)/.unpacked
-	(cd $(MATCHBOX_SM_DIR); rm -f config.cache; \
-	$(TARGET_CONFIGURE_OPTS) \
-	./configure $(QUIET) \
-	--target=$(GNU_TARGET_NAME) \
-	--host=$(GNU_TARGET_NAME) \
-	--build=$(GNU_HOST_NAME) \
-	--disable-static \
-	--prefix=/usr \
-	--sysconfdir=/etc \
-	--localstatedir=/var \
-	--datadir=/usr/share/matchbox \
-	--libdir=$(STAGING_DIR)/usr/lib \
-	--includedir=$(STAGING_DIR)/usr/include \
-	--enable-expat \
-	--with-expat-includes=$(STAGING_DIR)/usr/include \
-	--with-expat-lib=$(STAGING_DIR)/usr/lib \
-	--with-x \
-	--x-includes=$(STAGING_DIR)/usr/include/X11 \
-	--x-libraries=$(STAGING_DIR)/usr/lib \
-	$(MATCHBOX_SNOTIFY_OPTS) \
-	)
-	touch $(MATCHBOX_SM_DIR)/.configured
-
-$(MATCHBOX_CN_DIR)/.configured: $(MATCHBOX_CN_DIR)/.unpacked
-	(cd $(MATCHBOX_CN_DIR); rm -f config.cache; \
-	$(TARGET_CONFIGURE_OPTS) \
-	./configure $(QUIET) \
-	--target=$(GNU_TARGET_NAME) \
-	--host=$(GNU_TARGET_NAME) \
-	--build=$(GNU_HOST_NAME) \
-	--disable-static \
-	--prefix=/usr \
-	--sysconfdir=/etc \
-	--localstatedir=/var \
-	--datadir=/usr/share/matchbox \
-	--libdir=$(STAGING_DIR)/usr/lib \
-	--includedir=$(STAGING_DIR)/usr/include \
-	--enable-expat \
-	--with-expat-includes=$(STAGING_DIR)/usr/include \
-	--with-expat-lib=$(STAGING_DIR)/usr/lib \
-	--with-x \
-	--x-includes=$(STAGING_DIR)/usr/include/X11 \
-	--x-libraries=$(STAGING_DIR)/usr/lib \
-	)
-	touch $(MATCHBOX_CN_DIR)/.configured
-
-$(MATCHBOX_PL_DIR)/.configured: $(MATCHBOX_PL_DIR)/.unpacked
-	(cd $(MATCHBOX_PL_DIR); rm -f config.cache; \
-	$(TARGET_CONFIGURE_OPTS) \
-	./configure $(QUIET) \
-	--target=$(GNU_TARGET_NAME) \
-	--host=$(GNU_TARGET_NAME) \
-	--build=$(GNU_HOST_NAME) \
-	--disable-static \
-	--prefix=/usr \
-	--sysconfdir=/etc \
-	--localstatedir=/var \
-	--datadir=/usr/share/matchbox \
-	--libdir=/usr/lib \
-	--includedir=/usr/include \
-	--enable-expat \
-	--with-expat-includes=$(STAGING_DIR)/usr/include \
-	--with-expat-lib=$(STAGING_DIR)/usr/lib \
-	--with-x \
-	--x-includes=$(STAGING_DIR)/usr/include/X11 \
-	--x-libraries=$(STAGING_DIR)/usr/lib \
-	$(MATCHBOX_SNOTIFY_OPTS) \
-	)
-	touch $(MATCHBOX_PL_DIR)/.configured
-
-$(MATCHBOX_DP_DIR)/.configured: $(MATCHBOX_DP_DIR)/.unpacked
-	(cd $(MATCHBOX_DP_DIR); rm -f config.cache; \
-	$(TARGET_CONFIGURE_OPTS) \
-	./configure $(QUIET) \
-	--target=$(GNU_TARGET_NAME) \
-	--host=$(GNU_TARGET_NAME) \
-	--build=$(GNU_HOST_NAME) \
-	--disable-static \
-	--prefix=/usr \
-	--sysconfdir=/etc \
-	--localstatedir=/var \
-	--datadir=/usr/share/matchbox \
-	--libdir=$(STAGING_DIR)/usr/lib \
-	--includedir=$(STAGING_DIR)/usr/include \
-	--enable-expat \
-	--with-expat-includes=$(STAGING_DIR)/usr/include \
-	--with-expat-lib=$(STAGING_DIR)/usr/lib \
-	--with-x \
-	--x-includes=$(STAGING_DIR)/usr/include/X11 \
-	--x-libraries=$(STAGING_DIR)/usr/lib \
-	$(MATCHBOX_SNOTIFY_OPTS) \
-	)
-	touch $(MATCHBOX_DP_DIR)/.configured
-
-$(MATCHBOX_FK_DIR)/.configured: $(MATCHBOX_FK_DIR)/.unpacked
-	(cd $(MATCHBOX_FK_DIR); rm -f config.cache; \
-	$(TARGET_CONFIGURE_OPTS) \
-	./configure $(QUIET) \
-	--target=$(GNU_TARGET_NAME) \
-	--host=$(GNU_TARGET_NAME) \
-	--build=$(GNU_HOST_NAME) \
-	--disable-static \
-	--prefix=/usr \
-	--sysconfdir=/etc \
-	--localstatedir=/var \
-	--datadir=/usr/share/matchbox \
-	--libdir=$(STAGING_DIR)/usr/lib \
-	--includedir=$(STAGING_DIR)/usr/include \
-	--enable-expat \
-	--with-expat-includes=$(STAGING_DIR)/usr/include \
-	--with-expat-lib=$(STAGING_DIR)/usr/lib \
-	--with-x \
-	--x-includes=$(STAGING_DIR)/usr/include/X11 \
-	--x-libraries=$(STAGING_DIR)/usr/lib \
-	)
-	$(SED) 's:^SUBDIRS = fakekey src tests.*:SUBDIRS = fakekey src:g' $(MATCHBOX_FK_DIR)/Makefile
-	touch $(MATCHBOX_FK_DIR)/.configured
-
-$(MATCHBOX_KB_DIR)/.configured: $(MATCHBOX_KB_DIR)/.unpacked
-	(cd $(MATCHBOX_KB_DIR); rm -f config.cache; \
-	$(TARGET_CONFIGURE_OPTS) \
-	./configure $(QUIET) \
-	--target=$(GNU_TARGET_NAME) \
-	--host=$(GNU_TARGET_NAME) \
-	--build=$(GNU_HOST_NAME) \
-	--disable-static \
-	--prefix=/usr \
-	--sysconfdir=/etc \
-	--localstatedir=/var \
-	--datadir=/usr/share/matchbox \
-	--libdir=$(STAGING_DIR)/usr/lib \
-	--includedir=$(STAGING_DIR)/usr/include \
-	--enable-expat \
-	--with-expat-includes=$(STAGING_DIR)/usr/include \
-	--with-expat-lib=$(STAGING_DIR)/usr/lib \
-	--with-x \
-	--x-includes=$(STAGING_DIR)/usr/include/X11 \
-	--x-libraries=$(STAGING_DIR)/usr/lib \
-	$(MATCHBOX_KB_OPTS) \
-	)
-	touch $(MATCHBOX_KB_DIR)/.configured
-
-$(MATCHBOX_LIB_DIR)/.compiled: $(MATCHBOX_LIB_DIR)/.configured
-	$(MAKE) -C $(MATCHBOX_LIB_DIR)
-	touch $(MATCHBOX_LIB_DIR)/.compiled
-
-$(MATCHBOX_SNOTIFY_DIR)/.compiled: $(MATCHBOX_SNOTIFY_DIR)/.configured
-	$(MAKE) -C $(MATCHBOX_SNOTIFY_DIR)
-	touch $(MATCHBOX_SNOTIFY_DIR)/.compiled
-
-$(MATCHBOX_WM_DIR)/.compiled: $(MATCHBOX_WM_DIR)/.configured
-	$(MAKE) -C $(MATCHBOX_WM_DIR)
-	touch $(MATCHBOX_WM_DIR)/.compiled
-
-$(MATCHBOX_SM_DIR)/.compiled: $(MATCHBOX_SM_DIR)/.configured
-	$(MAKE) -C $(MATCHBOX_SM_DIR)
-	touch $(MATCHBOX_SM_DIR)/.compiled
-
-$(MATCHBOX_CN_DIR)/.compiled: $(MATCHBOX_CN_DIR)/.configured
-	$(MAKE) -C $(MATCHBOX_CN_DIR)
-	touch $(MATCHBOX_CN_DIR)/.compiled
-
-$(MATCHBOX_PL_DIR)/.compiled: $(MATCHBOX_PL_DIR)/.configured
-	$(MAKE) -C $(MATCHBOX_PL_DIR)
-	touch $(MATCHBOX_PL_DIR)/.compiled
-
-$(MATCHBOX_DP_DIR)/.compiled: $(MATCHBOX_DP_DIR)/.configured
-	$(MAKE) -C $(MATCHBOX_DP_DIR)
-	touch $(MATCHBOX_DP_DIR)/.compiled
-
-$(MATCHBOX_FK_DIR)/.compiled: $(MATCHBOX_FK_DIR)/.configured
-	$(MAKE) -C $(MATCHBOX_FK_DIR)
-	touch $(MATCHBOX_FK_DIR)/.compiled
-
-$(MATCHBOX_KB_DIR)/.compiled: $(MATCHBOX_KB_DIR)/.configured
-	$(MAKE) -C $(MATCHBOX_KB_DIR)
-	touch $(MATCHBOX_KB_DIR)/.compiled
-
-$(STAGING_DIR)/usr/lib/libmb.so: $(MATCHBOX_LIB_DIR)/.compiled
-	$(MAKE) -C $(MATCHBOX_LIB_DIR) DESTDIR=$(STAGING_DIR) \
-	prefix=/usr \
-	localstatedir=/var \
-	datadir=/usr/share/matchbox \
-	libdir=/usr/lib \
-	includedir=/usr/include \
-	install
-	$(SED) "s:\(['= ]\)/usr:\1$(STAGING_DIR)/usr:g" $(STAGING_DIR)/usr/lib/libmb.la
-
-$(STAGING_DIR)/usr/lib/$(MATCHBOX_SNOTIFY_BIN): $(MATCHBOX_SNOTIFY_DIR)/.compiled
-	$(MAKE) -C $(MATCHBOX_SNOTIFY_DIR) DESTDIR=$(STAGING_DIR) \
-	prefix=/usr \
-	localstatedir=/var \
-	datadir=/usr/share \
-	libdir=/usr/lib \
-	includedir=/usr/include \
-	install
-
-$(STAGING_DIR)/usr/bin/$(MATCHBOX_WM_BIN): $(MATCHBOX_WM_DIR)/.compiled
-	$(MAKE) -C $(MATCHBOX_WM_DIR) DESTDIR=$(STAGING_DIR) \
-	prefix=/usr \
-	localstatedir=/var \
-	datadir=/usr/share/matchbox \
-	libdir=/usr/lib \
-	includedir=/usr/include \
-	install
-
-$(STAGING_DIR)/usr/bin/$(MATCHBOX_SM_BIN): $(MATCHBOX_SM_DIR)/.compiled
-	$(MAKE) -C $(MATCHBOX_SM_DIR) DESTDIR=$(STAGING_DIR) \
-	prefix=/usr \
-	localstatedir=/var \
-	datadir=/usr/share/matchbox \
-	libdir=/usr/lib \
-	includedir=/usr/include \
-	install
-
-$(STAGING_DIR)/usr/bin/matchbox-session: $(MATCHBOX_CN_DIR)/.compiled
-	$(MAKE) -C $(MATCHBOX_CN_DIR) DESTDIR=$(STAGING_DIR) \
-	prefix=/usr \
-	localstatedir=/var \
-	datadir=/usr/share/matchbox \
-	libdir=/usr/lib \
-	includedir=/usr/include \
-	install
-
-$(STAGING_DIR)/usr/bin/$(MATCHBOX_PL_BIN): $(MATCHBOX_PL_DIR)/.compiled
-	$(MAKE) -C $(MATCHBOX_PL_DIR) DESTDIR=$(STAGING_DIR) \
-	prefix=/usr \
-	localstatedir=/var \
-	datadir=/usr/share/matchbox \
-	libdir=/usr/lib \
-	includedir=/usr/include \
-	install
-
-$(STAGING_DIR)/usr/bin/$(MATCHBOX_DP_BIN): $(MATCHBOX_DP_DIR)/.compiled
-	$(MAKE) -C $(MATCHBOX_DP_DIR) DESTDIR=$(STAGING_DIR) \
-	prefix=/usr \
-	localstatedir=/var \
-	datadir=/usr/share/matchbox \
-	libdir=/usr/lib \
-	includedir=/usr/include \
-	install
-
-$(STAGING_DIR)/usr/lib/$(MATCHBOX_FK_BIN).so: $(MATCHBOX_FK_DIR)/.compiled
-	$(MAKE) -C $(MATCHBOX_FK_DIR) DESTDIR=$(STAGING_DIR) \
-	prefix=/usr \
-	localstatedir=/var \
-	datadir=/usr/share/matchbox \
-	libdir=/usr/lib \
-	includedir=/usr/include \
-	install
-
-$(STAGING_DIR)/usr/bin/$(MATCHBOX_KB_BIN): $(MATCHBOX_KB_DIR)/.compiled
-	$(MAKE) -C $(MATCHBOX_KB_DIR) DESTDIR=$(STAGING_DIR) \
-	prefix=/usr \
-	localstatedir=/var \
-	datadir=/usr/share/matchbox \
-	libdir=/usr/lib \
-	includedir=/usr/include \
-	install
-
-$(TARGET_DIR)/usr/lib/libmb.so: $(STAGING_DIR)/usr/lib/libmb.so
-	cp -dpf $(STAGING_DIR)/usr/lib/libmb.so* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libmb.so
-
-$(TARGET_DIR)/usr/lib/$(MATCHBOX_SNOTIFY_BIN): $(STAGING_DIR)/usr/lib/$(MATCHBOX_SNOTIFY_BIN)
-	cp -dpf $(STAGING_DIR)/usr/lib/$(MATCHBOX_SNOTIFY_BIN)* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/$(MATCHBOX_SNOTIFY_BIN)
-
-$(TARGET_DIR)/usr/bin/$(MATCHBOX_WM_BIN): $(STAGING_DIR)/usr/bin/$(MATCHBOX_WM_BIN)
-	cp -dpf $(STAGING_DIR)/usr/bin/$(MATCHBOX_WM_BIN) $(TARGET_DIR)/usr/bin/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/$(MATCHBOX_WM_BIN)
-	cp -dpf $(STAGING_DIR)/usr/bin/matchbox-remote $(TARGET_DIR)/usr/bin/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/matchbox-remote
-	cp -af $(STAGING_DIR)/etc/matchbox/ $(TARGET_DIR)/etc/
-	cp -af $(STAGING_DIR)/usr/share/matchbox $(TARGET_DIR)/usr/share/
-
-$(TARGET_DIR)/usr/bin/$(MATCHBOX_SM_BIN): $(STAGING_DIR)/usr/bin/$(MATCHBOX_SM_BIN)
-	cp -dpf $(STAGING_DIR)/usr/bin/$(MATCHBOX_SM_BIN) $(TARGET_DIR)/usr/bin/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/$(MATCHBOX_SM_BIN)
-	mkdir -p $(TARGET_DIR)/usr/share/matchbox/pixmaps/
-	cp -af $(STAGING_DIR)/usr/share/matchbox/pixmaps/hourglass-*.png $(TARGET_DIR)/usr/share/matchbox/pixmaps/
-
-$(TARGET_DIR)/usr/bin/matchbox-session: $(STAGING_DIR)/usr/bin/matchbox-session
-	cp -dpf $(STAGING_DIR)/usr/bin/matchbox-session $(TARGET_DIR)/usr/bin/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/matchbox-session
-	cp -af $(STAGING_DIR)/etc/matchbox/ $(TARGET_DIR)/etc/
-	cp -af $(STAGING_DIR)/usr/share/matchbox $(TARGET_DIR)/usr/share/
-
-$(TARGET_DIR)/usr/bin/$(MATCHBOX_PL_BIN): $(STAGING_DIR)/usr/bin/$(MATCHBOX_PL_BIN)
-	cp -dpf $(STAGING_DIR)/usr/bin/$(MATCHBOX_PL_BIN) $(TARGET_DIR)/usr/bin/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/$(MATCHBOX_PL_BIN)
-	cp -dpf $(STAGING_DIR)/usr/bin/mb-applet-* $(TARGET_DIR)/usr/bin/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/mb-applet-*
-	cp -af $(STAGING_DIR)/usr/share/matchbox/* $(TARGET_DIR)/usr/share/matchbox/
-
-$(TARGET_DIR)/usr/bin/$(MATCHBOX_DP_BIN): $(STAGING_DIR)/usr/bin/$(MATCHBOX_DP_BIN)
-	cp -dpf $(STAGING_DIR)/usr/bin/$(MATCHBOX_DP_BIN) $(TARGET_DIR)/usr/bin/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/$(MATCHBOX_DP_BIN)
-	cp -dpf $(STAGING_DIR)/usr/lib/dotdesktop.so $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/dotdesktop.so
-	cp -dpf $(STAGING_DIR)/usr/lib/simplefilebrowser.so $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/simplefilebrowser.so
-	cp -dpf $(STAGING_DIR)/usr/lib/tasks.so $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/tasks.so
-	cp -af $(STAGING_DIR)/usr/share/matchbox/* $(TARGET_DIR)/usr/share/matchbox/
-	cp -f ./package/matchbox/mbdesktop_modules $(TARGET_DIR)/etc/matchbox/
-
-$(TARGET_DIR)/usr/lib/$(MATCHBOX_FK_BIN).so: $(STAGING_DIR)/usr/lib/$(MATCHBOX_FK_BIN).so
-	cp -dpf $(STAGING_DIR)/usr/lib/$(MATCHBOX_FK_BIN).so* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/$(MATCHBOX_FK_BIN).so
-
-$(TARGET_DIR)/usr/bin/$(MATCHBOX_KB_BIN): $(STAGING_DIR)/usr/bin/$(MATCHBOX_KB_BIN)
-	cp -dpf $(STAGING_DIR)/usr/bin/$(MATCHBOX_KB_BIN) $(TARGET_DIR)/usr/bin/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/$(MATCHBOX_KB_BIN)
-	mkdir -p $(TARGET_DIR)/usr/share/matchbox/pixmaps/
-	cp -dpf $(STAGING_DIR)/usr/share/matchbox/pixmaps/matchbox-keyboard.png $(TARGET_DIR)/usr/share/matchbox/pixmaps/
-	cp -af $(STAGING_DIR)/usr/share/matchbox/matchbox-keyboard $(TARGET_DIR)/usr/share/matchbox/
-	cp -dpf ./package/matchbox/mb-applet-kbd-wrapper.sh $(TARGET_DIR)/usr/bin/
-
-matchbox: host-pkg-config expat xlib_libXext $(MATCHBOX_WM_DEPS) $(MATCHBOX_SNOTIFY_DEPS) $(MATCHBOX_LIB_DEPS) $(TARGET_DIR)/usr/lib/libmb.so $(TARGET_DIR)/usr/bin/$(MATCHBOX_WM_BIN)
-
-matchbox-panel: matchbox $(TARGET_DIR)/usr/bin/$(MATCHBOX_PL_BIN) $(TARGET_DIR)/usr/bin/matchbox-session $(MATCHBOX_PANEL_DEPS)
-
-matchbox-desktop: matchbox $(TARGET_DIR)/usr/bin/$(MATCHBOX_DP_BIN)
-
-matchbox-keyboard: matchbox xlib_libXtst $(MATCHBOX_KB_DEPS) $(TARGET_DIR)/usr/lib/$(MATCHBOX_FK_BIN).so $(TARGET_DIR)/usr/bin/$(MATCHBOX_KB_BIN)
-
-matchbox-clean:
-	rm -f $(TARGET_DIR)/usr/lib/libmb.*
-	rm -f $(TARGET_DIR)/usr/bin/$(MATCHBOX_WM_BIN)
-	$(MAKE) DESTDIR=$(STAGING_DIR) CC=$(TARGET_CC) -C $(MATCHBOX_WM_DIR) uninstall
-	-$(MAKE) -C $(MATCHBOX_WM_DIR) clean
-	$(MAKE) DESTDIR=$(STAGING_DIR) CC=$(TARGET_CC) -C $(MATCHBOX_LIB_DIR) uninstall
-	-$(MAKE) -C $(MATCHBOX_LIB_DIR) clean
-
-matchbox-panel-clean:
-	rm -f $(TARGET_DIR)/usr/bin/$(MATCHBOX_PL_BIN)
-	rm -f $(TARGET_DIR)/usr/bin/matchbox-session
-	$(MAKE) DESTDIR=$(STAGING_DIR) CC=$(TARGET_CC) -C $(MATCHBOX_PL_DIR) uninstall
-	-$(MAKE) -C $(MATCHBOX_PL_DIR) clean
-	$(MAKE) DESTDIR=$(STAGING_DIR) CC=$(TARGET_CC) -C $(MATCHBOX_CN_DIR) uninstall
-	-$(MAKE) -C $(MATCHBOX_CN_DIR) clean
-
-matchbox-desktop-clean:
-	rm -f $(TARGET_DIR)/usr/bin/$(MATCHBOX_DP_BIN)
-	$(MAKE) DESTDIR=$(STAGING_DIR) CC=$(TARGET_CC) -C $(MATCHBOX_DP_DIR) uninstall
-	-$(MAKE) -C $(MATCHBOX_DP_DIR) clean
-
-matchbox-keyboard-clean:
-	rm -f $(TARGET_DIR)/usr/bin/$(MATCHBOX_KB_BIN)
-	rm -f $(TARGET_DIR)/usr/lib/$(MATCHBOX_FK_BIN).*
-	$(MAKE) DESTDIR=$(STAGING_DIR) CC=$(TARGET_CC) -C $(MATCHBOX_KB_DIR) uninstall
-	-$(MAKE) -C $(MATCHBOX_KB_DIR) clean
-	$(MAKE) DESTDIR=$(STAGING_DIR) CC=$(TARGET_CC) -C $(MATCHBOX_FK_DIR) uninstall
-	-$(MAKE) -C $(MATCHBOX_FK_DIR) clean
-
-matchbox-dirclean:
-	rm -rf $(MATCHBOX_WM_DIR)
-	rm -rf $(MATCHBOX_LIB_DIR)
-	rm -rf $(MATCHBOX_SNOTIFY_DIR)
-
-matchbox-panel-dirclean:
-	rm -rf $(MATCHBOX_PL_DIR)
-	rm -rf $(MATCHBOX_CN_DIR)
-
-matchbox-desktop-dirclean:
-	rm -rf $(MATCHBOX_DP_DIR)
-
-matchbox-keyboard-dirclean:
-	rm -rf $(MATCHBOX_KB_DIR)
-	rm -rf $(MATCHBOX_FK_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
 ifeq ($(BR2_PACKAGE_MATCHBOX),y)
-TARGETS+=matchbox
-endif
-
-ifeq ($(BR2_PACKAGE_MATCHBOX_PANEL),y)
-TARGETS+=matchbox-panel
-endif
-
-ifeq ($(BR2_PACKAGE_MATCHBOX_DESKTOP),y)
-TARGETS+=matchbox-desktop
-endif
-
-ifeq ($(BR2_PACKAGE_MATCHBOX_KEYBOARD),y)
-TARGETS+=matchbox-keyboard
+include package/matchbox/*/*.mk
+TARGETS+=matchbox-lib matchbox-wm
 endif
diff --git a/package/matchbox/mb-applet-kbd-wrapper.sh b/package/matchbox/mb-applet-kbd-wrapper.sh
deleted file mode 100644
index be202b5..0000000
--- a/package/matchbox/mb-applet-kbd-wrapper.sh
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-#
-
-killall matchbox-keyboard
-if [ ! $? -eq 0 ] 
-then
-    matchbox-keyboard &
-fi
diff --git a/package/matchbox/mb-applet-startup-monitor-true-false.patch b/package/matchbox/mb-applet-startup-monitor-true-false.patch
deleted file mode 100644
index c92a077..0000000
--- a/package/matchbox/mb-applet-startup-monitor-true-false.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-mbmonitor uses TRUE / FALSE without defining them
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- mbmonitor.c |    3 +++
- 1 file changed, 3 insertions(+)
-
-Index: mb-applet-startup-monitor-0.1/mbmonitor.c
-===================================================================
---- mb-applet-startup-monitor-0.1.orig/mbmonitor.c
-+++ mb-applet-startup-monitor-0.1/mbmonitor.c
-@@ -43,6 +43,9 @@
- #define POLLTIME	   10
- #define HOURGLASS_N_FRAMES 8 
- 
-+#define FALSE		   0
-+#define TRUE		   1
-+
- typedef struct LaunchList LaunchList;
- 
- struct LaunchList
diff --git a/package/matchbox/mbdesktop_modules b/package/matchbox/mbdesktop_modules
deleted file mode 100644
index 8206dad..0000000
--- a/package/matchbox/mbdesktop_modules
+++ /dev/null
@@ -1,9 +0,0 @@
-# This file lists the 'plug-ins' with any arguments to be loaded by
-# matchbox-desktop. 
-#
-# It can be overridden on a per-user basis by copying this file to ~/.matchbox/
-# and editing. 
-
-/usr/lib/tasks.so
-/usr/lib/dotdesktop.so
-# /usr/lib/simplefilebrowser.so /
diff --git a/target/device/Carallon/badger/crcgen b/target/device/Carallon/badger/crcgen
new file mode 100755
index 0000000000000000000000000000000000000000..e597b0aed702dce5d4a4d2fc81de18412c516770
GIT binary patch
literal 10094
zcmdT~eQX at X6`$Sp$Hh+Ub3PznZH{togM`mc2*!{G)^RRbCl`|D142u?KHsf<*Pid(
zyS>DrxHU5QI1ba33J9r{YJt?|4~kN$La0z;NJ|u<f~y8KrLAhEjpPuh41qMF1^2z#
zd3SqbTSTS&(RaFi^M3Q*yf+^^GdsKA3x+nUio%Fgb~{7qc%{xE=gL^iVlE1-jd_^P
z8rc_E6(E)H*Le<dCq;Zr6iwVC^fcfVm{tX#>P|xNm5#)SQ-sLTUx{>)ba=GJ5s5SA
z;{e)WtTB-vtLfr6 at iq~MLGcJX6w$6A><Yq;_$U?(M4ak}b;JKkQQk^b2MJ{znJB%)
zd0PO!^Sm9!^s#xUg<LP=el9Uaob0{=b{OZ?62;k^h<CTHYfeO)67ghqplP73wW)Po
zAd?EL<?(x=K&;}HJNNRUsXfRZ`w^Q4!>xut#RJJAp*`whzhR762H9gC{ULeP)Cigj
zUD{8IG?wLa;gm$ot^YDA0xgHX8yDTown+Gx(7#c_FM*8I4u5w!dxic at 623@`hub9l
zh|p)I+1r;&ni)HswoQ{k_e8KaT3Ju3-%7Intes)~>3GuaVQK3?JQ-y at kwhwEv7Q6z
zxD70Ag`-dk8j4c-!to^A66)O8VXh6V4crW_c^{~7E&UM1zEBwUIsTEd%j3|sD!a!K
zS<Cz`o}zvfFxx3`90ODp%-iR}aSRZ3xp4QGiMeq1ectcF-Q#?~g`;nxAs0?#4fBq=
zaB+)q6Jz*o&*ZC+oct<;Kluj4Y7GC{b8`CT<<&km-MA92^{aG9p&Ub-3lq~ojSEr6
zDqk4qat+GZ%NNGDtfGunzi^z(A69{kRlYFF<@Zp=s$M8?`7M;IP#)s)Ih3nW?gx3z
zJDs`TeZ$C|Glu^@wR2DBsj;0Nof)TI>f-FwkE(Pwc?1;SFBGs&M!vEW3NQ|h+3NH-
zuTsHHdyU-r-KaRUp#XX;yY0E5nl5JKmpp`KO#>*rbVV~p_DvhNzL{yPUo`}=Fk at t+
zV&p0<P?}!+8?KdKayOdX`eypvE0rCPRM6emPM_ at Q=?T=YdJxUnUSoJeeT5GS$ep*B
zKZg*;<~?x~9ChYSo^GH18 at BW5lZ67t2BCH324668+2f~zXHflAaGYD63Qh at r1^Mvc
z3+nf-IibURIobR1^z^CV)4Wr<;A-T9$Bp4JXbf;0oD!nf5w95e!7DFzqum`~2MQC$
z@Zbc?t}^o3D<>?-;9*WGu2O4wse at B5-iLP8j@?<XJIm@H{5^zoaasMd!Po1b9nS~P
zj8v$(;F)}Ie0WUB1;>s2_Or&w;OoD{_+G at z<mHdR@u9KotNFcW^4akdgGHwgV@`hi
z1Q?7v1~_yk&zImcF8DPL51yTT3=$Ww6^3q4PdkQk09k|~fZsx6oSi)26f-fIgakAs
zcw`rsLvu`>_(3tU_x at dM<b3dH>@TEC*xRoDHgXC7*--9&{}p4T>5}4Op^*)5Bg;ko
z6Cuc)4CQS9l##pF52N$#w$Ke9wdX$W%za?I^pVz?J2M#pH^!lN?3HW&gySNVI~U6R
zV^i**?bD0 at Y7C!Lj9V|J-!k&|`k{9des3rr^)C%U$`{Jp{?(!U{r(mhhHWA|KBoA1
zhZ`dXaTvo_rtM|V<2Imv)g~A!!xueppX4>n$i6E^uyZd>zK*frtblWzGm&r4W^7-k
z--^V04*L4TcFbp|eBZLtNh{%t_l0{ccA%SW4#yK#6mudlJKL78F;m0R-K-N8e3|%t
zfJ7lL0<6ZRjWa&i1%E5F^?v9EoJih>Fm&L at VAu@+e-3y7I1+8sl>2ruWx%Uw^Q%1t
z7-P7P!avRr&)}GAuk#*OI~L$XgCyIn5O#>8-D>b5mM&E1`;T?NeSqf>*!q3-a8*y8
zK3x5XHd67hd+x?;oXU_ejpRrr*+ENd2dzKzMTVzR=cxrkUJc_A3GW6ZUDe^r*asg^
zr;rb+I$TS8#e(L at RNqn6k!iiRm_xOKFBN==;KZ=~k=n#MLTxg}(Na5B3;9~XjS8Ko
z2yYQGtxe=_p3o;5nwQtdEA*k=xQtzhG$rKAqJ9qg*<We@D|>1c{j^!|y9DnMe81p_
z1%F)dp9n6O$F_8I+~!-o$?A at WlfHF<n*wW_)&$nv;3Q#R`hT14)HDQ4WqG(dBjL}Y
z9cbLpxTkR;k9)bjzRb&OgyG?ow?dRh_v0FI-;gZZU&rkc#h7rYnVmae9~q4&&1}Ys
zVh%e3e`nx(lv^OJJb@?>MNb?tRq<dks#@KFtfCqVRz1~+d0y4Gd0ypRz_f}=*w;c{
z<se8Eo@!O88h}(~7hIHOhwwU2YZEo7x*KHnIQ&(%4Xz&LO9%ip$5MS(b2yu}5;v`F
z?!}$3b8T81xTU!}8;7SIJ8gkVU$k`{JorF<B$I89r0sZM_tl&8l6je6jZa9v_T9d<
zfi-P`7N!h2k$oNF@hGprb?2vxEcw5SOleRW>lW2&bt~!`l!c173YyT*YHM!?2zo&z
zVf<7$N$7!fOsl)Cc71K<qC4iRFlSbMk##PD3MmcDTeY`J^Q`bRdKTfJnu%NwsLDQv
zdCI@)7QmICH^2~8SUefG0};q#?1%7I89rssQ2Q at Clrhnx;0m5lRT`CAjj}Dfp}A$7
z3Qs!<WYA5fEmgLul at 3NXn&wy33V<H?Y{J8C72(mXy1W<{-K<(Y#D%e5bwkV?njK=s
z%*0Y@+m}sd;=M`Oli&^KK$w#5^`cfJ7EZH7D%s2Rd7_wycBO8V*L7<1OJW|Prfv{2
zHS>+)uEw5nlUyD(l26!E6SdA^&jOi)eRjATxSe)*j8YJ}mF{POWXiSz?HfCr>~Jp&
z^d_@`SU3}7f#|^`7(3ifJ30HUbS9okmI)^0!CVtY1Ci=a*ermp!UDE60M{N6ATJdS
z+hG>4VrEY|+-I4wDA<z30ueiv&VWOQeKP`?P-eI<9s!3bC<ZP8Uba(CcLua0slGl7
zIw26Xy0g7zI2}&*T38Af`?K9pKuL}#ds37a?(R-o`$>WWAdAw_M3fZ8xjW at kq*s6~
zj(6HOF;xc%NC3FkbQ8ZfTmVic)$k|#m8uRBo~v=jd=4vKX at 5un9)937MfSR?gT!F}
z$Qi at +6N%PG+MiK5Yas73?77H(NYw$s{U&F{^Gey?$z^OkBx>PL_M at r}5 at VwR;Lo%m
z!<@|9iTu-k5Z6!*{$x-4+5&<=mcxoyx&3gZ#62Y0)4uVtu&3t$il6j|?*n_>lafsP
zQm<$rpYSZlFJRUS2~;I}+6T7?d#We-m+Oz)1-Cuzs|{g42Kh*6kIxRW{dWMvHo^Fi
zXg=}?hveVMb$n48`F{Aj?P(tJ343}DBO4J`@jUGT$)3*Hj|=+&(GO%#&p{*~k?d*y
zTrD<;uz;5l`6qA$5*R<VKkcU4gng0}1*i5S_%TSh?T?9hm(HvGq$s%T|0&6ST-c8b
z|Bp)cvj3k6duk?pa7UtZeYw44`(J=A#!vQma)mS?9t1zh{&~=K+aDG7M}@uYPnO5P
z9>*T}r{^eozc7l00~N=oBNoTcX^`Fi={&YYJSfZlNGAT8WKYkrZNeV!Z#R)0 at jpPO
z+katx7gsL``%h}WzkoKDMfD#Q_M=y6e-3O#6LG(EA^SfPAh at i15pWqp)gf`PP!M*+
z<obLF8ME1Y#f{fUhJwqwcyK6VsCu)oKOtpGBD-b|`}gY|hxn-FCfVLUhkZm;bem)#
ziL6D~x44}^`k4j?__2hOJ@NIzUQ%N_#mkdVYJYS?W5->_gs|@<M<P=adE3+6=eF<1
z=M$hI+*|<RJk|z(8uzp=%mZvT|5IY(`>s^D>>teMBn_ie^%?mZ%+|Eeac61}iLUBy
zh^IAJA%|3*r`;C~R>e_OcSAg_!E8hO2zRCiJ1yEDl;a*o>wY;tkI{Nwj at K|+r_1r$
z;`&>T&u6r*mg5VG at 1@J}I!5bYIbP3beJjVk#rLY^cmt#Ls2pDi>r0m#;%SX7f^}my
zd at -YS!EL0mCGZ}3HvMag at 72onuPvT4mg7qq&Aa9JGDh=hIgW2RXOhNnH$IcJ;x4v4
zPvZ~q<rqpD`}|Ch<E!SteRJT~&A{>gsbKFG&y7g|@5|Y6Jd{w`g5pUO>0dvGegJR<
z-rUOli_ZbdEd9Hc<1_mg52Mg8tI{D=qCQ9}tkf?wAKWkSV`BZIdFCO&v7COXoVnu1
zQzneRUm90WalC<b)##8a(a#~Nz-hlcK7R!``knIVC1ps>)z0{iYqs{E09;XLj@!$C
zGj$=0N^w?WgUo_22V7BS-Y?e!?qf5 at e*kdz`}Zf&AJ9gQFJSnV6p5ziT>_{5H_wF2
zJ%Ia2aB+OYI~#sK;BLP!gN*bD$7jw<k4pMAjyn6PgpY}GUIE^~O7mES(0>DP?=0<b
zPAcb;(7%l3s7u)sV!R2MY0w}I>LP|Oecj{*d?Abne65U><5y?{jtc=;@jC~=y>Oq(
z^UoauKQ8&*B$Y$oMeLJs`Ys|dNBJ49zkt8j!l?MWE#LzjpJja!M^(u1Oa=}gBjH5C
z_0a_$8fNS)yu*yZXA~WKcI+}koxAtIw-~0msZ841;mV4p%-%$*JDf22>5UoA4lp>G
z=}%a;6%Dkuw6-zKFyqkykZx&#4>j-rD4Ol-J4k+lcW&ZtHt%ZR9yCcpH<T`U;YUT>
zOW#1mgm;I%RuUuL656q`J!J0Kym at zUkGZFPV<?D`V}0RhC>=g%TJX(C8Nk0aVdkcL
z?rh)Q*}?E=$@y|bd}yNU?vF>rrzLRYZSq4cp(=g1Vs71U?y`F088~9=NQ5&PIDx`%
zSERCd3H-|zDMS8#ManLJCt;edn4Pa;Bz-fQNtv;5GMccc8>vb8hcZ|jY$E6L8QB<)
d*{GJ-c+Lkm<x0-iH|3aV@l!hf`HfThe*o+xnScNQ

literal 0
HcmV?d00001

-- 
1.7.0
