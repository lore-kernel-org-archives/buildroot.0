From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Mar 2009 15:48:15 +0000 (UTC)
Subject: [Buildroot] svn commit: [25679]
	trunk/buildroot/package/x11r7/xserver_xorg-server
Message-ID: <20090316154815.379D77643C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-16 15:48:14 +0000 (Mon, 16 Mar 2009)
New Revision: 25679

Log:
xserver-xorg: more optional dependencies

Modified:
   trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in	2009-03-16 15:48:07 UTC (rev 25678)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in	2009-03-16 15:48:14 UTC (rev 25679)
@@ -10,7 +10,6 @@
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_XPROTO_KBPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_XFONT_FONT_ALIAS if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
 	select BR2_PACKAGE_XFONT_FONT_MISC_MISC if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
 	select BR2_PACKAGE_XFONT_FONT_CURSOR_MISC if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
@@ -36,10 +35,8 @@
 	select BR2_PACKAGE_XPROTO_EVIEEXT
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_RECORDPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_RESOURCEPROTO
-	select BR2_PACKAGE_XPROTO_TRAPPROTO
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XCMISCPROTO
 	select BR2_PACKAGE_XPROTO_XEXTPROTO

Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2009-03-16 15:48:07 UTC (rev 25678)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2009-03-16 15:48:14 UTC (rev 25679)
@@ -12,7 +12,7 @@
 XSERVER_XORG_SERVER_USE_CONFIG_CACHE = NO # overrides CFLAGS
 XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
 
-XSERVER_XORG_SERVER_DEPENDENCIES =  freetype xutil_util-macros xlib_libXfont libdrm xlib_libxkbui openssl \
+XSERVER_XORG_SERVER_DEPENDENCIES =  xutil_util-macros xlib_libXfont libdrm xlib_libxkbui openssl \
 									xproto_compositeproto xproto_damageproto xproto_fixesproto \
 									xproto_glproto xproto_kbproto xproto_randrproto \
 									xlib_libX11 xlib_libXau xlib_libXaw xlib_libXdmcp xlib_libXScrnSaver \
@@ -20,13 +20,13 @@
 									xlib_libXrender xlib_libXres xlib_libXtst xlib_libXft xlib_libXcursor \
 									xlib_libXinerama xlib_libXrandr xlib_libXdamage xlib_libXxf86misc xlib_libXxf86vm \
 									xlib_liblbxutil xlib_libxkbfile xlib_xtrans xdata_xbitmaps xproto_bigreqsproto \
-									xproto_evieext xproto_fontsproto xproto_inputproto xproto_recordproto xproto_renderproto \
-									xproto_resourceproto xproto_trapproto xproto_videoproto xproto_xcmiscproto \
+									xproto_evieext xproto_fontsproto xproto_inputproto xproto_renderproto \
+									xproto_resourceproto xproto_videoproto xproto_xcmiscproto \
 									xproto_xextproto xproto_xf86bigfontproto xproto_xf86dgaproto xproto_xf86driproto \
 									xproto_xf86miscproto xproto_xf86rushproto xproto_xf86vidmodeproto xproto_xproto \
 									pixman mcookie
 
-XSERVER_XORG_SERVER_CONF_OPT = --enable-freetype --disable-config-hal \
+XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
 		--disable-xnest --disable-xephyr --disable-xvfb \
 		CFLAGS="-I$(STAGING_DIR)/usr/include/pixman-1"
 
@@ -72,4 +72,20 @@
 XSERVER_XORG_SERVER_CONF_OPT += --enable-config-dbus
 endif
 
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += freetype
+XSERVER_XORG_SERVER_CONF_OPT += --enable-freetype
+endif
+
+ifeq ($(BR2_PACKAGE_XPROTO_TRAPPROTO),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += xproto_trapproto
+XSERVER_XORG_SERVER_CONF_OPT += --enable-xtrap
+endif
+
+ifeq ($(BR2_PACKAGE_XPROTO_RECORDPROTO),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += xproto_recordproto
+XSERVER_XORG_SERVER_CONF_OPT += --enable-record
+endif
+
+
 $(eval $(call AUTOTARGETS,package/x11r7,xserver_xorg-server))
