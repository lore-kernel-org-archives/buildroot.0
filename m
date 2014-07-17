From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 17 Jul 2014 07:42:54 +0200
Subject: [Buildroot] [PATCH 2/8] package/mesa3d: Fix optional DRI3 support
In-Reply-To: <1405575780-26496-1-git-send-email-bernd.kuhls@t-online.de>
References: <1405575780-26496-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1405575780-26496-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DRI3 support is optional in mesa3d, but mesa3d expects it by default,
so add configure options to disable it when necessary and add the
needed dependencies for DRI3 support. Fixes:

===============================
checking for DRI3PROTO... no
configure: error: Package requirements (dri3proto >= 1.0) were not met:

checking for PRESENTPROTO... no
configure: error: Package requirements (presentproto >= 1.0) were not met:

configure: error: Package requirements (x11 xext xdamage xfixes x11-xcb xcb-glx >= 1.8.1
 xcb-dri2 >= 1.8 xcb-dri3 xcb-present xcb-sync xshmfence >= 1.1) were not met:

Package xshmfence was not found in the pkg-config search path.
===============================

This defconfig was broken and fixed by this patch:

BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
BR2_PACKAGE_XPROTO_DRI3PROTO=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1a61af8..667e744 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -77,6 +77,12 @@ ifeq ($(MESA3D_DRI_DRIVERS-y),)
 MESA3D_CONF_OPT += \
 	--without-dri-drivers
 else
+ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
+MESA3D_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto xproto_presentproto
+MESA3D_CONF_OPT += --enable-dri3
+else
+MESA3D_CONF_OPT += --disable-dri3
+endif
 MESA3D_PROVIDES += libgl
 MESA3D_CONF_OPT += \
 	--enable-dri \
-- 
1.7.10.4
