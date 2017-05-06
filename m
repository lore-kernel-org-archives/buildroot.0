From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  6 May 2017 15:54:20 +0200
Subject: [Buildroot] [PATCH] Revert "toolchain-external: CodeSourcery NiosII
	2015.11 affected by PR19405"
Message-ID: <20170506135420.12274-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An autobuilder exception has been added to avoid testing qt gui module
with the CodeSourcery NiosII toolchain. This allow to remove the
BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 symbol.

This reverts commit 5dce3c05b5ea38539f6ee6efc24c13db936260dc.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/opencv/Config.in                                           | 7 -------
 package/opencv3/Config.in                                          | 5 ++---
 package/pinentry/Config.in                                         | 4 ----
 package/poppler/Config.in                                          | 4 ----
 package/qt/Config.in                                               | 7 -------
 package/qwt/Config.in                                              | 6 +-----
 toolchain/toolchain-common.in                                      | 4 ----
 .../toolchain-external-codesourcery-niosII/Config.in               | 1 -
 8 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 0260851..742ae3e 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -51,7 +51,6 @@ config BR2_PACKAGE_OPENCV_LIB_FLANN
 
 config BR2_PACKAGE_OPENCV_LIB_GPU
 	bool "gpu"
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # opencv libphoto
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
@@ -114,7 +113,6 @@ config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
 config BR2_PACKAGE_OPENCV_LIB_PHOTO
 	bool "photo"
 	default y
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # Binutils 2.25 nios2 issue
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_photo module into the OpenCV build.
@@ -162,7 +160,6 @@ config BR2_PACKAGE_OPENCV_LIB_VIDEO
 config BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB
 	bool "videostab"
 	default y
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # opencv libphoto
 	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
@@ -272,7 +269,6 @@ config BR2_PACKAGE_OPENCV_WITH_QT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # qt
 	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_STL
 	select BR2_PACKAGE_QT_GUI_MODULE
@@ -280,9 +276,6 @@ config BR2_PACKAGE_OPENCV_WITH_QT
 	help
 	  Use Qt with QtTest module and STL support
 
-comment "qt backend support needs a toolchain not affected by Binutils bug 19405"
-	depends on BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
-
 config BR2_PACKAGE_OPENCV_WITH_TIFF
 	bool "tiff support"
 	select BR2_PACKAGE_TIFF
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 3b0a9d6..2214ee8 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -85,16 +85,15 @@ comment "gtk3 support needs libgtk3"
 config BR2_PACKAGE_OPENCV3_WITH_QT
 	bool "qt4"
 	depends on BR2_PACKAGE_QT
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_QT_STL
 	select BR2_PACKAGE_QT_GUI_MODULE
 	select BR2_PACKAGE_QT_TEST
 	help
 	  Use Qt4 with QtTest and QtGui modules and STL support, as GUI toolkit.
 
-comment "qt4 support needs qt and a toolchain not affected by Binutils bug 19405"
+comment "qt4 support needs qt"
 	depends on BR2_USE_MMU # qt
-	depends on (!BR2_PACKAGE_QT && !BR2_PACKAGE_QT5) || BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
+	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
 
 config BR2_PACKAGE_OPENCV3_WITH_QT5
 	bool "qt5"
diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index 682af9f..f5a8159 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -40,15 +40,11 @@ config BR2_PACKAGE_PINENTRY_QT4
 	depends on BR2_USE_MMU # fork
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  The pinentry-qt4 tool
 
-comment "pinentry-qt4 support needs a toolchain not affected by Binutils bug 19405"
-	depends on BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
-
 comment "pinentry-qt4 needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/poppler/Config.in b/package/poppler/Config.in
index d741f65..79078a8 100644
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -15,15 +15,11 @@ if BR2_PACKAGE_POPPLER
 config BR2_PACKAGE_POPPLER_QT
 	bool "Qt support"
 	depends on BR2_PACKAGE_QT
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_QT_GUI_MODULE
 	select BR2_PACKAGE_QT_XML
 	help
 	  Build Qt support into the Poppler library
 
-comment "poppler Qt support needs a toolchain not affected by Binutils bug 19405"
-	depends on BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
-
 config BR2_PACKAGE_POPPLER_QT5
 	bool "Qt5 support"
 	depends on BR2_PACKAGE_QT5
diff --git a/package/qt/Config.in b/package/qt/Config.in
index 5e9f898..fe0b0e9 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -33,7 +33,6 @@ comment "Qt standard (X11) not available (need X.org)"
 config BR2_PACKAGE_QT_X11
 	bool "Qt standard (X11)"
 	depends on BR2_PACKAGE_XORG7
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -57,7 +56,6 @@ config BR2_PACKAGE_QT_DEBUG
 
 config BR2_PACKAGE_QT_DEMOS
 	bool "Compile and install Qt demos (with code)"
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  If unsure, say N.
@@ -71,7 +69,6 @@ config BR2_PACKAGE_QT_TRANSLATION_FILES
 
 config BR2_PACKAGE_QT_EXAMPLES
 	bool "Compile and install Qt examples (with code)"
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  If unsure, say N.
@@ -124,15 +121,11 @@ config BR2_PACKAGE_QT_QT3SUPPORT
 config BR2_PACKAGE_QT_GUI_MODULE
 	bool "Gui Module"
 	default y
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # nios2 Binutils 2.25.1 bug
 	select BR2_PACKAGE_QT_NETWORK
 	help
 	  Turns on support for Gui applications. If your board doesn't have
 	  video output, or you don't require Qt GUI, say n.
 
-comment "Qt Gui Module needs a toolchain not affected by Binutils bug 19405"
-	depends on BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
-
 if BR2_PACKAGE_QT_GUI_MODULE
 
 if BR2_PACKAGE_QT_EMBEDDED
diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index a678637..041c2d1 100644
--- a/package/qwt/Config.in
+++ b/package/qwt/Config.in
@@ -1,10 +1,6 @@
-comment "qwt needs a toolchain not affected by Binutils bug 19405"
-	depends on BR2_PACKAGE_QT && BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
-
 config BR2_PACKAGE_QWT
 	bool "qwt"
-	depends on (BR2_PACKAGE_QT && !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405) || \
-		BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5 # printsupport
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 37079fa..76c0e7c 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -18,10 +18,6 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	default y if BR2_ARM_CPU_ARMV5
 	default y if BR2_sparc_v8
 
-# https://sourceware.org/bugzilla/show_bug.cgi?id=19405
-config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
-	bool
-
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
index 6bb376b..341bc2a 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
@@ -10,7 +10,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
-	select BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # based-on binutils-2.26
 	help
 	  Sourcery CodeBench toolchain for the Nios-II architecture,
 	  from Mentor Graphics. It uses gcc 6.3, binutils 2.26,
-- 
2.9.3
