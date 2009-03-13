From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 13 Mar 2009 19:46:03 +0000 (UTC)
Subject: [Buildroot] svn commit: [25646]
	trunk/buildroot/package/x11r7/xserver_xorg-server
Message-ID: <20090313194603.CE1737645B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-13 19:46:03 +0000 (Fri, 13 Mar 2009)
New Revision: 25646

Log:
xserver_xorg: add options for builtin fonts and aiglx

Patch by Dan Lykowski <lykowdk@gmail.com>

Modified:
   trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in	2009-03-13 15:38:03 UTC (rev 25645)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in	2009-03-13 19:46:03 UTC (rev 25646)
@@ -11,9 +11,9 @@
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_FREETYPE
-	select BR2_PACKAGE_XFONT_FONT_ALIAS
-	select BR2_PACKAGE_XFONT_FONT_MISC_MISC
-	select BR2_PACKAGE_XFONT_FONT_CURSOR_MISC
+	select BR2_PACKAGE_XFONT_FONT_ALIAS if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
+	select BR2_PACKAGE_XFONT_FONT_MISC_MISC if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
+	select BR2_PACKAGE_XFONT_FONT_CURSOR_MISC if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAU
 	select BR2_PACKAGE_XLIB_LIBXAW
@@ -62,3 +62,15 @@
     depends on BR2_PACKAGE_XSERVER_XORG_SERVER
     help
         Don't display root cursor.
+
+config BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
+    bool "Use Builtin Fonts"
+    depends on BR2_PACKAGE_XSERVER_XORG_SERVER
+    help
+        Enable/Use Builtin fonts.
+
+config BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX
+    bool "Enable AIGLX Extension"
+    depends on BR2_PACKAGE_XSERVER_XORG_SERVER
+    help
+        Enable/Use AIGLX extension.

Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2009-03-13 15:38:03 UTC (rev 25645)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2009-03-13 19:46:03 UTC (rev 25646)
@@ -31,9 +31,21 @@
 XSERVER_XORG_NULL_CURSOR:=--disable-null-root-cursor
 endif
 
+ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS),y)
+XSERVER_XORG_BUILTIN_FONTS:=--enable-builtin-fonts
+else
+XSERVER_XORG_BUILTIN_FONTS:=--disable-builtin-fonts
+endif
+
+ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX),y)
+XSERVER_XORG_AIGLX:=--enable-aiglx
+else
+XSERVER_XORG_AIGLX:=--disable-aiglx
+endif
+
 XSERVER_XORG_SERVER_DEPENDENCIES =  freetype xutil_util-macros xlib_libXfont libdrm xlib_libxkbui \
 									xproto_compositeproto xproto_damageproto xproto_fixesproto \
-									xproto_glproto xproto_kbproto xproto_randrproto freetype \
+									xproto_glproto xproto_kbproto xproto_randrproto \
 									xlib_libX11 xlib_libXau xlib_libXaw xlib_libXdmcp xlib_libXScrnSaver \
 									xlib_libXext xlib_libXfixes xlib_libXi xlib_libXmu xlib_libXpm \
 									xlib_libXrender xlib_libXres xlib_libXtst xlib_libXft xlib_libXcursor \
@@ -50,6 +62,8 @@
 		--disable-config-hal $(XSERVER_XORG_MESA_DIR) \
 		--disable-xnest --disable-xephyr --disable-xvfb \
 		$(XSERVER_XORG_NULL_CURSOR) \
+		$(XSERVER_XORG_BUILTIN_FONTS) \
+		$(XSERVER_XORG_AIGLX) \
 		CFLAGS="-I$(STAGING_DIR)/usr/include/pixman-1"
 
 XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
