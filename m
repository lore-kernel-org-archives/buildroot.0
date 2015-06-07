From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Jun 2015 13:41:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: If udev is not present,
	sysfs is used as a replacement
Message-ID: <1433677262-7640-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for sysfs as a replacement for udev was added 2014/05/30:
http://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?id=85b6f36ca5238dd3fec7c5fcacb8b7074ce53c8e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in |   10 ++--------
 package/mesa3d/mesa3d.mk |    9 +++++++--
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 2d19d69..c702d0d 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -9,7 +9,6 @@ menuconfig BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
-	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	help
@@ -118,12 +117,8 @@ if BR2_PACKAGE_MESA3D_DRIVER
 
 comment "Additional API Support"
 
-comment "OpenGL EGL needs udev /dev management"
-	depends on !BR2_PACKAGE_HAS_UDEV
-
 config BR2_PACKAGE_MESA3D_OPENGL_EGL
 	bool "OpenGL EGL"
-	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_HAS_LIBEGL
 	help
 	  Use the Khronos EGL APIs. EGL is a window manager for OpenGL applications
@@ -146,6 +141,5 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 
 endif # BR2_PACKAGE_MESA3D
 
-comment "mesa3d needs udev /dev management and a toolchain w/ C++, NPTL"
-	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_HAS_UDEV
+comment "mesa3d needs a toolchain w/ C++, NPTL"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f1c38bf..f1f2304 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -20,6 +20,13 @@ MESA3D_DEPENDENCIES = \
 	expat \
 	libdrm
 
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+MESA3D_DEPENDENCIES += udev
+MESA3D_CONF_OPTS += --disable-sysfs
+else
+MESA3D_CONF_OPTS += --enable-sysfs
+endif
+
 ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_DEPENDENCIES += \
 	xproto_xf86driproto \
@@ -100,8 +107,6 @@ MESA3D_CONF_OPTS += --enable-opengl
 
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 MESA3D_PROVIDES += libegl
-# egl depends on gbm, gbm depends on udev
-MESA3D_DEPENDENCIES += udev
 MESA3D_EGL_PLATFORMS = drm
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 MESA3D_DEPENDENCIES += wayland
-- 
1.7.10.4
