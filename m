From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Aug 2015 15:22:32 +0200
Subject: [Buildroot] [git commit] package/mesa3d: needs dynamic library
Message-ID: <20150810132542.9A13F81991@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c635f86d84bfc915a6dd8928f15082f302a9986
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/5ee/5eef099e82e7a65d9b459d88fcb82b468ccf8fed/
http://autobuild.buildroot.net/results/e5c/e5c0e693505798ec366328ed87de3460cd07894d/
http://autobuild.buildroot.net/results/c6b/c6b6a21f73fc84f4784dd00de504ef0eea3bdaf1/
http://autobuild.buildroot.net/results/abd/abd3e2850ee457fc456de3f1641b92405d995e16/
http://autobuild.buildroot.net/results/2c4/2c40fe209e6006fdf148e547b1fafe9180afc85d/

[Thomas: remove propagation of the dynamic library dependency to
glmark2 and mesa3d-demos, since none of them select mesa3d.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in |   14 ++++++++------
 package/mesa3d/mesa3d.mk |    5 -----
 2 files changed, 8 insertions(+), 11 deletions(-)

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
index 67408a3..733c32e 100644
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
