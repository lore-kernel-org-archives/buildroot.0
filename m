From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 24 Dec 2015 00:03:37 +0100
Subject: [Buildroot] [PATCH] package/qt: disable Qt GUI module for CS NiosII
	toolchain
Message-ID: <1450911817-12589-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libQtGui.so build triggers an ld error with Binutils 2.25.1

Avoid (GCC 5.2 and Binutils 2.25.51):
http://autobuild.buildroot.net/results/c94/c945bce96966e5e39d093c4265058a66f749eea6

Similar (GCC 4.9.3 and Binutils 2.25.1):
http://autobuild.buildroot.net/results/ca9/ca981c419bfedb38c591f6e75151a943bc9535ef

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/grantlee/Config.in | 1 +
 package/opencv/Config.in   | 1 +
 package/opencv3/Config.in  | 1 +
 package/pinentry/Config.in | 1 +
 package/poppler/Config.in  | 1 +
 package/qt/Config.in       | 4 ++++
 6 files changed, 9 insertions(+)

diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
index 01ddacd..2b27ead 100644
--- a/package/grantlee/Config.in
+++ b/package/grantlee/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GRANTLEE
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # Qt Script
 	depends on (BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT && BR2_PACKAGE_QT) || \
 		(BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5)
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII if BR2_PACKAGE_QT # Qt GUI module
 	select BR2_PACKAGE_QT_STL if BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_SCRIPT if BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 679ce6f..8c42dd8 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -210,6 +210,7 @@ config BR2_PACKAGE_OPENCV_WITH_QT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # qt
 	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # Qt GUI module
 	select BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_STL
 	select BR2_PACKAGE_QT_GUI_MODULE
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 8736805..33e8c8b 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -84,6 +84,7 @@ comment "gtk3 support needs libgtk3"
 config BR2_PACKAGE_OPENCV3_WITH_QT
 	bool "qt4"
 	depends on BR2_PACKAGE_QT
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # Qt GUI module
 	select BR2_PACKAGE_QT_STL
 	select BR2_PACKAGE_QT_GUI_MODULE
 	select BR2_PACKAGE_QT_TEST
diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index edf3316..4d7bdea 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -40,6 +40,7 @@ config BR2_PACKAGE_PINENTRY_QT4
 	depends on BR2_USE_MMU # fork
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # Qt GUI module
 	select BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_GUI_MODULE
 	help
diff --git a/package/poppler/Config.in b/package/poppler/Config.in
index fa4ce22..c749790 100644
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -15,6 +15,7 @@ if BR2_PACKAGE_POPPLER
 config BR2_PACKAGE_POPPLER_QT
 	bool "Qt support"
 	depends on BR2_PACKAGE_QT
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # Qt GUI module
 	select BR2_PACKAGE_QT_GUI_MODULE
 	select BR2_PACKAGE_QT_XML
 	help
diff --git a/package/qt/Config.in b/package/qt/Config.in
index bf14724..fda3826 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -33,6 +33,7 @@ comment "Qt standard (X11) not available (need X.org)"
 config BR2_PACKAGE_QT_X11
 	bool "Qt standard (X11)"
 	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # Qt GUI module
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -56,6 +57,7 @@ config BR2_PACKAGE_QT_DEBUG
 
 config BR2_PACKAGE_QT_DEMOS
 	bool "Compile and install Qt demos (with code)"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # Qt GUI module
 	select BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  If unsure, say N.
@@ -69,6 +71,7 @@ config BR2_PACKAGE_QT_TRANSLATION_FILES
 
 config BR2_PACKAGE_QT_EXAMPLES
 	bool "Compile and install Qt examples (with code)"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # Qt GUI module
 	select BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  If unsure, say N.
@@ -130,6 +133,7 @@ config BR2_PACKAGE_QT_QT3SUPPORT
 
 config BR2_PACKAGE_QT_GUI_MODULE
 	bool "Gui Module"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # triggers compiler bug with binutils 2.25
 	select BR2_PACKAGE_QT_NETWORK
 	default y
 	help
-- 
2.4.3
