From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  9 Aug 2015 22:09:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: needs dynamic library
Message-ID: <1439150940-5033-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also propagate to reverse dependencies, to keep bisectability do this in
one commit.

Fixes
http://autobuild.buildroot.net/results/5ee/5eef099e82e7a65d9b459d88fcb82b468ccf8fed/
http://autobuild.buildroot.net/results/e5c/e5c0e693505798ec366328ed87de3460cd07894d/
http://autobuild.buildroot.net/results/c6b/c6b6a21f73fc84f4784dd00de504ef0eea3bdaf1/
http://autobuild.buildroot.net/results/abd/abd3e2850ee457fc456de3f1641b92405d995e16/
http://autobuild.buildroot.net/results/2c4/2c40fe209e6006fdf148e547b1fafe9180afc85d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/glmark2/Config.in      |  4 ++--
 package/mesa3d-demos/Config.in |  4 ++++
 package/mesa3d/Config.in       | 14 ++++++++------
 package/mesa3d/mesa3d.mk       |  5 -----
 4 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
index 052e820..14bf5cc 100644
--- a/package/glmark2/Config.in
+++ b/package/glmark2/Config.in
@@ -22,6 +22,6 @@ config BR2_PACKAGE_GLMARK2
 
 	  https://github.com/glmark2/glmark2
 
-comment "glmark2 needs udev /dev management and a toolchain w/ C++, NPTL"
-	depends on !BR2_INSTALL_LIBSTDCPP || \
+comment "glmark2 needs udev /dev management and a toolchain w/ C++, NPTL, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_HAS_UDEV
diff --git a/package/mesa3d-demos/Config.in b/package/mesa3d-demos/Config.in
index d63c47b..db1a01a 100644
--- a/package/mesa3d-demos/Config.in
+++ b/package/mesa3d-demos/Config.in
@@ -4,7 +4,11 @@ config BR2_PACKAGE_MESA3D_DEMOS
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES \
 		|| BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBOPENVG
+	depends on !BR2_STATIC_LIBS # mesa3d
 	help
 	  OpenGL demos from the Mesa 3D project.
 
 	  http://mesa3d.org
+
+comment "mesa3d-demos needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 93ae02a..a658986 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -10,6 +10,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	# Triggers the _gp link issue in nios2
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
@@ -76,10 +77,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
 	  This is a software opengl implementation using the Gallium3D
 	  infrastructure.
 
-comment "DRI drivers needs X.Org and a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS || !BR2_PACKAGE_XORG7
+comment "DRI drivers need X.Org"
+	depends on !BR2_PACKAGE_XORG7
 
-if !BR2_STATIC_LIBS && BR2_PACKAGE_XORG7
+if BR2_PACKAGE_XORG7
 
 comment "DRI drivers"
 
@@ -114,7 +115,7 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	help
 	  Legacy Radeon driver for R100 series GPUs.
 
-endif # !BR2_STATIC_LIBS && BR2_PACKAGE_XORG7
+endif # BR2_PACKAGE_XORG7
 
 if BR2_PACKAGE_MESA3D_DRIVER
 
@@ -144,7 +145,8 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 
 endif # BR2_PACKAGE_MESA3D
 
-comment "mesa3d needs a toolchain w/ C++, NPTL"
+comment "mesa3d needs a toolchain w/ C++, NPTL, dynamic library"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		BR2_STATIC_LIBS
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e2deb08..b342fdf 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -58,11 +58,6 @@ MESA3D_CONF_OPTS += \
 	--disable-xa
 endif
 
-ifeq ($(BR2_STATIC_LIBS),)
-# fix for "configure: error: Cannot use static libraries for DRI drivers"
-MESA3D_CONF_OPTS += --disable-static
-endif
-
 # Drivers
 
 #Gallium Drivers
-- 
2.1.4
