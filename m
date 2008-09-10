From: Michel Wilson <michel@crondor.net>
Date: Wed, 10 Sep 2008 10:12:59 +0200
Subject: [Buildroot] [PATCH] Option to disable cursor in X; retry
Message-ID: <20080910081259.GB24785@aeon.hgd.crondor.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Adds an option to disable the root cursor in X. Ideal for display-only
systems where a cursor only gets in the way. This is the
non-line-wrapped version of the patch ;)

Regards,

Michel Wilson.
---
Index: package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
===================================================================
--- package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	(revision 23359)
+++ package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	(working copy)
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
Index: package/x11r7/xserver_xorg-server/Config.in
===================================================================
--- package/x11r7/xserver_xorg-server/Config.in	(revision 23359)
+++ package/x11r7/xserver_xorg-server/Config.in	(working copy)
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
-- 
Michel Wilson     michel at crondor.net
PGP key ID        0xD2CB4B7E
