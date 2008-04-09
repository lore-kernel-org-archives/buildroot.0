From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Wed,  9 Apr 2008 04:38:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
Message-ID: <20080409113849.004993C4BA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-09 04:38:48 -0700 (Wed, 09 Apr 2008)
New Revision: 21682

Log:
Some package use ncurses libpanel/libform/libmenu, this config allows to selectively
copy them to the target filesystem at the same time at the main library is installed.
-Patch by Michel (BusError)


Modified:
   trunk/buildroot/package/ncurses/Config.in
   trunk/buildroot/package/ncurses/ncurses.mk


Changeset:
Modified: trunk/buildroot/package/ncurses/Config.in
===================================================================
--- trunk/buildroot/package/ncurses/Config.in	2008-04-09 10:22:22 UTC (rev 21681)
+++ trunk/buildroot/package/ncurses/Config.in	2008-04-09 11:38:48 UTC (rev 21682)
@@ -7,6 +7,28 @@
 
 	  http://www.gnu.org/software/ncurses/
 
+config BR2_PACKAGE_NCURSES_TARGET_PANEL
+	bool "ncurses libpanel in target"
+	default n
+	depends on BR2_PACKAGE_NCURSES
+	help
+	  Ncurses headers in target
+	  Includes ncurses dynamic libpanel in target
+ 
+config BR2_PACKAGE_NCURSES_TARGET_FORM
+	bool "ncurses libform in target"
+	default n
+	depends on BR2_PACKAGE_NCURSES
+	help
+	  Includes ncurses dynamic libform in target
+ 
+config BR2_PACKAGE_NCURSES_TARGET_MENU
+        bool "ncurses libmenu in target"
+        default n
+        depends on BR2_PACKAGE_NCURSES
+        help
+ 	  Includes ncurses dynamic libmenu in target
+
 config BR2_PACKAGE_NCURSES_TARGET_HEADERS
 	bool "ncurses headers in target"
 	default n

Modified: trunk/buildroot/package/ncurses/ncurses.mk
===================================================================
--- trunk/buildroot/package/ncurses/ncurses.mk	2008-04-09 10:22:22 UTC (rev 21681)
+++ trunk/buildroot/package/ncurses/ncurses.mk	2008-04-09 11:38:48 UTC (rev 21682)
@@ -104,6 +104,15 @@
 
 $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VERSION): $(STAGING_DIR)/lib/libncurses.so.$(NCURSES_VERSION)
 	cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/lib/
+ifeq ($(strip $(BR2_PACKAGE_NCURSES_TARGET_PANEL)),y)
+	cp -dpf $(NCURSES_DIR)/lib/libpanel.so* $(TARGET_DIR)/lib/
+endif
+ifeq ($(strip $(BR2_PACKAGE_NCURSES_TARGET_FORM)),y)
+	cp -dpf $(NCURSES_DIR)/lib/libform.so* $(TARGET_DIR)/lib/
+endif
+ifeq ($(strip $(BR2_PACKAGE_NCURSES_TARGET_MENU)),y)
+	cp -dpf $(NCURSES_DIR)/lib/libmenu.so* $(TARGET_DIR)/lib/
+endif
 	ln -sf /usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/x
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm $(TARGET_DIR)/usr/share/terminfo/x
