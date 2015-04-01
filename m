From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 19:58:05 +0200
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: Glamor
	depends on dri3
Message-ID: <20150401175836.5DB7481914@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f9a016a93b2acac2db1a04869941c6c907901bb9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes

../../../glamor/glamor_egl.c:603:25: error: unknown type name 'RRProviderPtr'
                         RRProviderPtr provider,
                         ^
../../../glamor/glamor_egl.c:650:1: error: unknown type name 'dri3_screen_info_rec'
 static dri3_screen_info_rec glamor_dri3_info = {
 ^

using this defconfig

BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_NONE=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I915=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL=y

RRProviderPtr is defined in dri3/dri3.h, so make sure glamor is enabled only
if dri3 is enabled, too.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index d9f36fc..ae68906 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -173,17 +173,21 @@ ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
 ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += xproto_dri2proto
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri2
+else
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri2
 endif
 ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri3
-endif
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += libepoxy
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-glamor
 endif
 else
-XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri2 --disable-dri3
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri3 --disable-glamor
+endif
+else
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri2 --disable-dri3 --disable-glamor
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXSCRNSAVER),y)
