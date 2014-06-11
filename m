From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 11 Jun 2014 23:08:34 +0200
Subject: [Buildroot] [PATCH v13 01/19] mesa3d: Depend on xorg meta package
	instead of xserver_xorg-server
In-Reply-To: <1402520932-26672-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402520932-26672-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1402520932-26672-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mesa3d does not depend on the xorg server as such, only on X libraries.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in |    8 ++++----
 package/mesa3d/mesa3d.mk |    4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e698b3e..2e761a4 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -62,10 +62,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
 	  This is a software opengl implementation using the Gallium3D
 	  infrastructure.
 
-comment "DRI drivers needs an X.Org server and a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB || !BR2_PACKAGE_XSERVER_XORG_SERVER
+comment "DRI drivers need X.Org and a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB || !BR2_PACKAGE_XORG7
 
-if !BR2_PREFER_STATIC_LIB && BR2_PACKAGE_XSERVER_XORG_SERVER
+if !BR2_PREFER_STATIC_LIB && BR2_PACKAGE_XORG7
 
 comment "DRI drivers"
 
@@ -92,7 +92,7 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	help
 	  Legacy Radeon driver for R100 series GPUs.
 
-endif # !BR2_PREFER_STATIC_LIB && BR2_PACKAGE_XSERVER_XORG_SERVER
+endif # !BR2_PREFER_STATIC_LIB && BR2_PACKAGE_XORG7
 
 if BR2_PACKAGE_MESA3D_DRIVER
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1a61af8..8685cb8 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -25,7 +25,7 @@ MESA3D_DEPENDENCIES = \
 	host-xutil_makedepend \
 	libdrm
 
-ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
+ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_DEPENDENCIES += \
 	xproto_xf86driproto \
 	xproto_dri2proto \
@@ -100,7 +100,7 @@ ifeq ($(BR2_PACKAGE_WAYLAND),y)
 MESA3D_DEPENDENCIES += wayland
 MESA3D_EGL_PLATFORMS += wayland
 endif
-ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
+ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_EGL_PLATFORMS += x11
 endif
 MESA3D_CONF_OPT += \
-- 
1.7.10.4
