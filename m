From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Mar 2009 15:47:44 +0000 (UTC)
Subject: [Buildroot] svn commit: [25676]
	trunk/buildroot/package/x11r7/xserver_xorg-server
Message-ID: <20090316154744.E54A97643C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-16 15:47:44 +0000 (Mon, 16 Mar 2009)
New Revision: 25676

Log:
xorg_server: cleanup .mk

Rearrange lines and get rid of unneeded variables. Should have no functional
change.

Modified:
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2009-03-16 14:53:54 UTC (rev 25675)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2009-03-16 15:47:44 UTC (rev 25676)
@@ -10,64 +10,57 @@
 XSERVER_XORG_SERVER_AUTORECONF = NO
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 XSERVER_XORG_SERVER_USE_CONFIG_CACHE = NO # overrides CFLAGS
+XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
 
+XSERVER_XORG_SERVER_DEPENDENCIES =  freetype xutil_util-macros xlib_libXfont libdrm xlib_libxkbui openssl \
+									xproto_compositeproto xproto_damageproto xproto_fixesproto \
+									xproto_glproto xproto_kbproto xproto_randrproto \
+									xlib_libX11 xlib_libXau xlib_libXaw xlib_libXdmcp xlib_libXScrnSaver \
+									xlib_libXext xlib_libXfixes xlib_libXi xlib_libXmu xlib_libXpm \
+									xlib_libXrender xlib_libXres xlib_libXtst xlib_libXft xlib_libXcursor \
+									xlib_libXinerama xlib_libXrandr xlib_libXdamage xlib_libXxf86misc xlib_libXxf86vm \
+									xlib_liblbxutil xlib_libxkbfile xlib_xtrans xdata_xbitmaps xproto_bigreqsproto \
+									xproto_evieext xproto_fontsproto xproto_inputproto xproto_recordproto xproto_renderproto \
+									xproto_resourceproto xproto_trapproto xproto_videoproto xproto_xcmiscproto \
+									xproto_xextproto xproto_xf86bigfontproto xproto_xf86dgaproto xproto_xf86driproto \
+									xproto_xf86miscproto xproto_xf86rushproto xproto_xf86vidmodeproto xproto_xproto \
+									pixman dbus mcookie
+
+XSERVER_XORG_SERVER_CONF_OPT = --enable-freetype --disable-config-hal \
+		--disable-xnest --disable-xephyr --disable-xvfb \
+		CFLAGS="-I$(STAGING_DIR)/usr/include/pixman-1"
+
 ifeq ($(BR2_PACKAGE_XSERVER_xorg),y)
-XSERVER_XORG_MESA_DEPS:=mesa3d
-XSERVER_XORG_MESA_DIR:=--with-mesa-source="$(BUILD_DIR)/Mesa-$(MESA3D_VERSION)"
-XSERVER_XORG_ENABLE_MODULAR:=--enable-xorg
+XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d
+XSERVER_XORG_SERVER_CONF_OPT += --with-mesa-source="$(BUILD_DIR)/Mesa-$(MESA3D_VERSION)" --enable-xorg
 else
-XSERVER_XORG_ENABLE_MODULAR:=--disable-xorg
+XSERVER_XORG_SERVER_CONF_OPT += --disable-xorg
 endif
 
 ifeq ($(BR2_PACKAGE_XSERVER_tinyx),y)
-XSERVER_XORG_ENABLE_KDRIVE:=--enable-kdrive --enable-xfbdev --disable-glx --disable-dri
+XSERVER_XORG_SERVER_CONF_OPT += --enable-kdrive --enable-xfbdev --disable-glx --disable-dri
 else
-XSERVER_XORG_ENABLE_KDRIVE:=--disable-kdrive --disable-xfbdev
+XSERVER_XORG_SERVER_CONF_OPT += --disable-kdrive --disable-xfbdev
 endif
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_NULL_CURSOR),y)
-XSERVER_XORG_NULL_CURSOR:=--enable-null-root-cursor
+XSERVER_XORG_SERVER_CONF_OPT += --enable-null-root-cursor
 else
-XSERVER_XORG_NULL_CURSOR:=--disable-null-root-cursor
+XSERVER_XORG_SERVER_CONF_OPT += --disable-null-root-cursor
 endif
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS),y)
-XSERVER_XORG_BUILTIN_FONTS:=--enable-builtin-fonts
+XSERVER_XORG_SERVER_CONF_OPT += --enable-builtin-fonts
 else
-XSERVER_XORG_BUILTIN_FONTS:=--disable-builtin-fonts
+XSERVER_XORG_SERVER_CONF_OPT += --disable-builtin-fonts
 endif
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX),y)
-XSERVER_XORG_AIGLX:=--enable-aiglx
+XSERVER_XORG_SERVER_CONF_OPT += --enable-aiglx
 else
-XSERVER_XORG_AIGLX:=--disable-aiglx
+XSERVER_XORG_SERVER_CONF_OPT += --disable-aiglx
 endif
 
-XSERVER_XORG_SERVER_DEPENDENCIES =  freetype xutil_util-macros xlib_libXfont libdrm xlib_libxkbui openssl \
-									xproto_compositeproto xproto_damageproto xproto_fixesproto \
-									xproto_glproto xproto_kbproto xproto_randrproto \
-									xlib_libX11 xlib_libXau xlib_libXaw xlib_libXdmcp xlib_libXScrnSaver \
-									xlib_libXext xlib_libXfixes xlib_libXi xlib_libXmu xlib_libXpm \
-									xlib_libXrender xlib_libXres xlib_libXtst xlib_libXft xlib_libXcursor \
-									xlib_libXinerama xlib_libXrandr xlib_libXdamage xlib_libXxf86misc xlib_libXxf86vm \
-									xlib_liblbxutil xlib_libxkbfile xlib_xtrans xdata_xbitmaps xproto_bigreqsproto \
-									xproto_evieext xproto_fontsproto xproto_inputproto xproto_recordproto xproto_renderproto \
-									xproto_resourceproto xproto_trapproto xproto_videoproto xproto_xcmiscproto \
-									xproto_xextproto xproto_xf86bigfontproto xproto_xf86dgaproto xproto_xf86driproto \
-									xproto_xf86miscproto xproto_xf86rushproto xproto_xf86vidmodeproto xproto_xproto \
-									pixman dbus $(XSERVER_XORG_MESA_DEPS) mcookie
-
-XSERVER_XORG_SERVER_CONF_OPT = $(XSERVER_XORG_ENABLE_KDRIVE) \
-		--enable-freetype $(XSERVER_XORG_ENABLE_MODULAR) \
-		--disable-config-hal $(XSERVER_XORG_MESA_DIR) \
-		--disable-xnest --disable-xephyr --disable-xvfb \
-		$(XSERVER_XORG_NULL_CURSOR) \
-		$(XSERVER_XORG_BUILTIN_FONTS) \
-		$(XSERVER_XORG_AIGLX) \
-		CFLAGS="-I$(STAGING_DIR)/usr/include/pixman-1"
-
-XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
-
 # Optional packages
 ifeq ($(BR2_PACKAGE_TSLIB),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += tslib
