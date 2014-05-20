From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 20 May 2014 22:41:02 +0200
Subject: [Buildroot] [PATCH v9 03/29] mesa3d: Depend on xorg meta package
	instead of xserver_xorg-server
In-Reply-To: <1400618488-6995-1-git-send-email-bernd.kuhls@t-online.de>
References: <1400618488-6995-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1400618488-6995-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mesa3d does not depend on the xorg server as such, only on X libraries.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in |   22 +++++++++++-----------
 package/mesa3d/mesa3d.mk |    4 ++--
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 06f2bc3..b645712 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -3,13 +3,13 @@ menuconfig BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_HOST_LIBXML2_PYTHON
-	select BR2_PACKAGE_XPROTO_DRI2PROTO if BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO if BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_DRI2PROTO if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XPROTO_XF86DRIPROTO if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -61,10 +61,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
 	  This is a software opengl implementation using the Gallium3D
 	  infrastructure.
 
-comment "DRI drivers needs an X.Org server and a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB || !BR2_PACKAGE_XSERVER_XORG_SERVER
+comment "DRI drivers needs X.Org and a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB || !BR2_PACKAGE_XORG7
 
-if !BR2_PREFER_STATIC_LIB && BR2_PACKAGE_XSERVER_XORG_SERVER
+if !BR2_PREFER_STATIC_LIB && BR2_PACKAGE_XORG7
 
 comment "DRI drivers"
 
@@ -91,7 +91,7 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	help
 	  Legacy Radeon driver for R100 series GPUs.
 
-endif # !BR2_PREFER_STATIC_LIB && BR2_PACKAGE_XSERVER_XORG_SERVER
+endif # !BR2_PREFER_STATIC_LIB && BR2_PACKAGE_XORG7
 
 if BR2_PACKAGE_MESA3D_DRIVER
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 8caa5c6..6d396b8 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -23,7 +23,7 @@ MESA3D_DEPENDENCIES = \
 	host-xutil_makedepend \
 	libdrm
 
-ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
+ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_DEPENDENCIES += \
 	xproto_xf86driproto \
 	xproto_dri2proto \
@@ -96,7 +96,7 @@ ifeq ($(BR2_PACKAGE_WAYLAND),y)
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
