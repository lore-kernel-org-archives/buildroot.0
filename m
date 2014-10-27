From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Oct 2014 13:46:15 -0700
Subject: [Buildroot] [PATCH 07/15 v6] package/mesa3d: depends on libudev,
	not udev
In-Reply-To: <cover.1414442699.git.yann.morin.1998@free.fr>
References: <cover.1414442699.git.yann.morin.1998@free.fr>
Message-ID: <337a1970f6cec5755ed0b7ed73f3e6b31b84c2ca.1414442699.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>

---
Changes v5 -> v6:
  - tweak comment for when mesa3d is not available (with help from Bernd)
---
 package/mesa3d/Config.in | 11 ++++-------
 package/mesa3d/mesa3d.mk |  4 ++--
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 74ebbed..b55173d 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -9,7 +9,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
-	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_HAS_LIBUDEV
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -105,12 +105,8 @@ if BR2_PACKAGE_MESA3D_DRIVER
 
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
@@ -133,6 +129,7 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 
 endif # BR2_PACKAGE_MESA3D
 
-comment "mesa3d needs udev /dev management and a toolchain w/ C++, largefile, NPTL"
+comment "mesa3d needs a libudev provider and a toolchain w/ C++, largefile, NPTL"
 	depends on !BR2_LARGEFILE || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_HAS_UDEV
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_PACKAGE_HAS_LIBUDEV
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 6f1f414..8b35c45 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -102,8 +102,8 @@ MESA3D_CONF_OPTS += --enable-opengl
 
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 MESA3D_PROVIDES += libegl
-# egl depends on gbm, gbm depends on udev
-MESA3D_DEPENDENCIES += udev
+# egl depends on gbm, gbm depends on libudev
+MESA3D_DEPENDENCIES += libudev
 MESA3D_EGL_PLATFORMS = drm
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 MESA3D_DEPENDENCIES += wayland
-- 
1.9.1
