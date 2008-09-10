From: hamish at uclibc.org <hamish@uclibc.org>
Date: Wed, 10 Sep 2008 06:16:24 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/x11r7/xserver_xorg-server
Message-ID: <20080910131624.948003C684@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-09-10 06:16:23 -0700 (Wed, 10 Sep 2008)
New Revision: 23371

Log:
Applied patch from Michel Wilson to allow the cursor in the X root window to
be disabled. Unfortunately this is a compile-time option.



Modified:
   trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in	2008-09-09 16:55:27 UTC (rev 23370)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in	2008-09-10 13:16:23 UTC (rev 23371)
@@ -52,3 +52,9 @@
 	help
 	  xorg-server 1.4
 	  No description available
+
+config BR2_PACKAGE_XSERVER_XORG_SERVER_NULL_CURSOR
+    bool "Null root cursor"
+    depends on BR2_PACKAGE_XSERVER_XORG_SERVER
+    help
+        Don't display root cursor.

Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2008-09-09 16:55:27 UTC (rev 23370)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2008-09-10 13:16:23 UTC (rev 23371)
@@ -24,6 +24,12 @@
 XSERVER_XORG_ENABLE_KDRIVE:=--disable-kdrive --disable-xfbdev
 endif
 
+ifeq ($(strip $(BR2_PACKAGE_XSERVER_XORG_SERVER_NULL_CURSOR)),y)
+XSERVER_XORG_NULL_CURSOR:=--enable-null-root-cursor
+else
+XSERVER_XORG_NULL_CURSOR:=--disable-null-root-cursor
+endif
+
 XSERVER_XORG_SERVER_DEPENDENCIES =  freetype xutil_util-macros xlib_libXfont libdrm xlib_libxkbui \
 									xproto_compositeproto xproto_damageproto xproto_fixesproto \
 									xproto_glproto xproto_kbproto xproto_randrproto freetype \
@@ -42,6 +48,7 @@
 		--enable-freetype $(XSERVER_XORG_ENABLE_MODULAR) \
 		--disable-config-hal $(XSERVER_XORG_MESA_DIR) \
 		--disable-xnest --disable-xephyr --disable-xvfb \
+		$(XSERVER_XORG_NULL_CURSOR)
 		CFLAGS="-I$(STAGING_DIR)/usr/include/pixman-1"
 
 XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
