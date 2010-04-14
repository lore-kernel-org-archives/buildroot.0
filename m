From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 14 Apr 2010 17:31:51 +0100
Subject: [Buildroot] [PATCH 1/7] xserver_xorg-server: bump version,
	improve option support
In-Reply-To: <1271262717-2253-1-git-send-email-will_wagner@carallon.com>
References: <1271262717-2253-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1271262717-2253-2-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Later version of xserver no longer need configure hack to say where
mesa3d is located.

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xserver_xorg-server/Config.in        |   35 +++++++++--------
 .../xserver_xorg-server/xserver_xorg-server.mk     |   41 +++++++++++---------
 2 files changed, 41 insertions(+), 35 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 86909d1..e850aba 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -1,23 +1,26 @@
 config BR2_PACKAGE_XSERVER_XORG_SERVER
 	bool "xorg-server"
-	select BR2_PACKAGE_XLIB_LIBXFONT
 	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_MCOOKIE
+	select BR2_PACKAGE_MESA3D if BR2_PACKAGE_XSERVER_xorg
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_XPROTO_COMPOSITEPROTO
-	select BR2_PACKAGE_XPROTO_DAMAGEPROTO
-	select BR2_PACKAGE_XPROTO_FIXESPROTO
-	select BR2_PACKAGE_XPROTO_GLPROTO
-	select BR2_PACKAGE_XPROTO_KBPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_XFONT_FONT_ALIAS if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
 	select BR2_PACKAGE_XFONT_FONT_MISC_MISC if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
 	select BR2_PACKAGE_XFONT_FONT_CURSOR_MISC if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
+	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAU
+	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXDMCP
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XLIB_LIBXFONT
+	select BR2_PACKAGE_XLIB_LIBXFT
 	select BR2_PACKAGE_XLIB_LIBXI
+	select BR2_PACKAGE_XLIB_LIBXINERAMA
+	select BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXRES
 	select BR2_PACKAGE_XLIB_LIBXXF86MISC
@@ -26,9 +29,15 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XLIB_XTRANS
 	select BR2_PACKAGE_XDATA_XBITMAPS
 	select BR2_PACKAGE_XPROTO_BIGREQSPROTO
+	select BR2_PACKAGE_XPROTO_COMPOSITEPROTO
+	select BR2_PACKAGE_XPROTO_DAMAGEPROTO
 	select BR2_PACKAGE_XPROTO_EVIEEXT
+	select BR2_PACKAGE_XPROTO_FIXESPROTO
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
+	select BR2_PACKAGE_XPROTO_KBPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_RESOURCEPROTO
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
@@ -41,12 +50,10 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_XF86RUSHPROTO
 	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
-	select BR2_PACKAGE_PIXMAN
-	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER
-	select BR2_PACKAGE_MESA3D if BR2_PACKAGE_XSERVER_xorg
+	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	depends on !BR2_avr32
 	help
-	  xorg-server 1.7.1
+	  xorg-server 1.7.5
 	  No description available
 
 comment "xorg-xserver is BROKEN on AVR32"
@@ -58,12 +65,6 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_NULL_CURSOR
     help
         Don't display root cursor.
 
-config BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
-    bool "Use Builtin Fonts"
-    depends on BR2_PACKAGE_XSERVER_XORG_SERVER
-    help
-        Enable/Use Builtin fonts.
-
 config BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX
     bool "Enable AIGLX Extension"
     depends on BR2_PACKAGE_XSERVER_XORG_SERVER
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 950c2ca..0dd6127 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.7.1
+XSERVER_XORG_SERVER_VERSION = 1.7.5
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_AUTORECONF = NO
@@ -15,11 +15,11 @@ XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install
 
 XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xutil_util-macros 		\
+	xlib_libpciaccess		\
 	xlib_libXfont 			\
 	xlib_libX11 			\
 	xlib_libXau 			\
 	xlib_libXdmcp 			\
-	xlib_libXScrnSaver 		\
 	xlib_libXext 			\
 	xlib_libXfixes 			\
 	xlib_libXi 			\
@@ -30,7 +30,6 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xlib_libXinerama 		\
 	xlib_libXrandr 			\
 	xlib_libXdamage 		\
-	xlib_libXxf86misc 		\
 	xlib_libXxf86vm 		\
 	xlib_libxkbfile 		\
 	xlib_xtrans 			\
@@ -38,7 +37,6 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xproto_bigreqsproto 		\
 	xproto_compositeproto 		\
 	xproto_damageproto 		\
-	xproto_evieext 			\
 	xproto_fixesproto 		\
 	xproto_fontsproto 		\
 	xproto_glproto 			\
@@ -53,7 +51,6 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xproto_xf86bigfontproto 	\
 	xproto_xf86dgaproto 		\
 	xproto_xf86driproto	 	\
-	xproto_xf86miscproto 		\
 	xproto_xf86rushproto 		\
 	xproto_xf86vidmodeproto 	\
 	xproto_xproto 			\
@@ -69,7 +66,7 @@ XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
 
 ifeq ($(BR2_PACKAGE_XSERVER_xorg),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d
-XSERVER_XORG_SERVER_CONF_OPT += --with-mesa-source="$(BUILD_DIR)/Mesa-$(MESA3D_VERSION)" --enable-xorg
+XSERVER_XORG_SERVER_CONF_OPT += --enable-xorg --disable-glx
 else
 XSERVER_XORG_SERVER_CONF_OPT += --disable-xorg
 endif
@@ -86,12 +83,6 @@ else
 XSERVER_XORG_SERVER_CONF_OPT += --disable-null-root-cursor
 endif
 
-ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS),y)
-XSERVER_XORG_SERVER_CONF_OPT += --enable-builtin-fonts
-else
-XSERVER_XORG_SERVER_CONF_OPT += --disable-builtin-fonts
-endif
-
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX),y)
 XSERVER_XORG_SERVER_CONF_OPT += --enable-aiglx
 else
@@ -111,12 +102,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += freetype
-XSERVER_XORG_SERVER_CONF_OPT += --enable-freetype
-endif
-
-ifeq ($(BR2_PACKAGE_XPROTO_TRAPPROTO),y)
-XSERVER_XORG_SERVER_DEPENDENCIES += xproto_trapproto
-XSERVER_XORG_SERVER_CONF_OPT += --enable-xtrap
 endif
 
 ifeq ($(BR2_PACKAGE_XPROTO_RECORDPROTO),y)
@@ -124,9 +109,29 @@ XSERVER_XORG_SERVER_DEPENDENCIES += xproto_recordproto
 XSERVER_XORG_SERVER_CONF_OPT += --enable-record
 endif
 
+ifneq ($(BR2_PACKAGE_XLIB_LIBXVMC),y)
+XSERVER_XORG_SERVER_CONF_OPT += --disable-xvmc
+endif
+
+ifneq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
+XSERVER_XORG_SERVER_CONF_OPT += --disable-composite
+endif
+
 ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += xproto_dri2proto
 XSERVER_XORG_SERVER_CONF_OPT += --enable-dri2
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXSCRNSAVER),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libXScrnSaver
+XSERVER_XORG_SERVER_CONF_OPT += --enable-screensaver
+else
+XSERVER_XORG_SERVER_CONF_OPT += --disable-screensaver
+endif
+
+ifneq ($(BR2_PACKAGE_XLIB_LIBDMX),y)
+XSERVER_XORG_SERVER_CONF_OPT += --disable-dmx
+endif
+
+
 $(eval $(call AUTOTARGETS,package/x11r7,xserver_xorg-server))
-- 
1.7.0
