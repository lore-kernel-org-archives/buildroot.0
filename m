From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jun 2018 16:42:58 +0200
Subject: [Buildroot] [PATCH 12/13] package/x11r7/xserver_xorg-server: switch
 to xorgproto
In-Reply-To: <20180617144259.3868-1-bernd.kuhls@t-online.de>
References: <20180617144259.3868-1-bernd.kuhls@t-online.de>
Message-ID: <20180617144259.3868-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new package xorgproto will combine and replace all current xproto_*
packages. For details read
https://lists.x.org/archives/xorg-announce/2018-February/002835.html

Removed special handling for various xproto packages because xorgproto
always installs all available protocols.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/Config.in   | 22 +--------
 .../xserver_xorg-server.mk                    | 48 +++----------------
 2 files changed, 7 insertions(+), 63 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 3107e2c1e5..94e26a3b8a 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -32,27 +32,9 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
 	select BR2_PACKAGE_XLIB_XTRANS
 	select BR2_PACKAGE_XDATA_XBITMAPS
-	select BR2_PACKAGE_XPROTO_BIGREQSPROTO
-	select BR2_PACKAGE_XPROTO_COMPOSITEPROTO
-	select BR2_PACKAGE_XPROTO_DAMAGEPROTO
-	select BR2_PACKAGE_XPROTO_FIXESPROTO
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_GLPROTO
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_KBPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_RESOURCEPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XCMISCPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
-	select BR2_PACKAGE_XPROTO_DRI2PROTO if BR2_PACKAGE_SYSTEMD
 	help
 	  X.Org X server
 
@@ -82,13 +64,11 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
 	bool "1.19.6"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_23
 	select BR2_PACKAGE_XLIB_LIBXFONT2
-	select BR2_PACKAGE_XPROTO_PRESENTPROTO
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	bool "1.17.4"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
 	select BR2_PACKAGE_XLIB_LIBXFONT
-	select BR2_PACKAGE_XPROTO_PRESENTPROTO
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 	bool "1.14.7"
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index d605a2c742..79cf94dfed 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -32,24 +32,7 @@ XSERVER_XORG_SERVER_DEPENDENCIES = \
 	xlib_libxkbfile \
 	xlib_xtrans \
 	xdata_xbitmaps \
-	xproto_bigreqsproto \
-	xproto_compositeproto \
-	xproto_damageproto \
-	xproto_fixesproto \
-	xproto_fontsproto \
-	xproto_glproto \
-	xproto_inputproto \
-	xproto_kbproto \
-	xproto_randrproto \
-	xproto_renderproto \
-	xproto_resourceproto \
-	xproto_videoproto \
-	xproto_xcmiscproto \
-	xproto_xextproto \
-	xproto_xf86bigfontproto \
-	xproto_xf86dgaproto \
-	xproto_xf86vidmodeproto \
-	xproto_xproto \
+	xorgproto \
 	xkeyboard-config \
 	pixman \
 	mcookie \
@@ -73,8 +56,7 @@ XSERVER_XORG_SERVER_CONF_OPTS += \
 	--with-systemd-daemon \
 	--enable-systemd-logind
 XSERVER_XORG_SERVER_DEPENDENCIES += \
-	systemd \
-	xproto_dri2proto
+	systemd
 else
 XSERVER_XORG_SERVER_CONF_OPTS += \
 	--without-systemd-daemon \
@@ -89,12 +71,6 @@ else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-xwayland
 endif
 
-# Present protocol only required for xserver 1.15+, but does not matter if
-# enabled for older versions as they don't use it (not even optionally).
-ifeq ($(BR2_PACKAGE_XPROTO_PRESENTPROTO),y)
-XSERVER_XORG_SERVER_DEPENDENCIES += xproto_presentproto
-endif
-
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-xorg
 XSERVER_XORG_SERVER_DEPENDENCIES += libpciaccess
@@ -144,7 +120,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
-XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d xproto_xf86driproto
+XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-glx
 endif
@@ -165,7 +141,7 @@ ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += udev
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev
 # udev kms support depends on libdrm and dri2
-ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_XPROTO_DRI2PROTO),yy)
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev-kms
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-config-udev-kms
@@ -188,13 +164,6 @@ else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-libunwind
 endif
 
-ifeq ($(BR2_PACKAGE_XPROTO_RECORDPROTO),y)
-XSERVER_XORG_SERVER_DEPENDENCIES += xproto_recordproto
-XSERVER_XORG_SERVER_CONF_OPTS += --enable-record
-else
-XSERVER_XORG_SERVER_CONF_OPTS += --disable-record
-endif
-
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFONT2),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libXfont2
 endif
@@ -214,14 +183,9 @@ XSERVER_XORG_SERVER_CONF_OPTS += --disable-composite
 endif
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
-ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
-XSERVER_XORG_SERVER_DEPENDENCIES += xproto_dri2proto
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri2
-else
-XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri2
-endif
-ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE)$(BR2_PACKAGE_XPROTO_DRI3PROTO),yy)
-XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto
+ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libxshmfence
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri3
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY),yyy)
 XSERVER_XORG_SERVER_DEPENDENCIES += libepoxy
-- 
2.17.1
