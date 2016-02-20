From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 20 Feb 2016 13:42:46 +0100
Subject: [Buildroot] [PATCH] toolchain-external: CodeSourcery NiosII 2015.11
	affected by PR19405
Message-ID: <1455972166-12968-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See bug report https://sourceware.org/bugzilla/show_bug.cgi?id=19405

Fixes:
http://autobuild.buildroot.net/results/ee562524c5b12191e584ceae89006c5a5103e700

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: add a comment for each packages that selects Qt GUI (Peter)
    add the link to the bug tracker (Peter)
---
 package/grantlee/Config.in             | 6 ++++--
 package/opencv/Config.in               | 4 ++++
 package/opencv3/Config.in              | 5 +++--
 package/pinentry/Config.in             | 4 ++++
 package/poppler/Config.in              | 4 ++++
 package/qt/Config.in                   | 7 +++++++
 toolchain/toolchain-common.in          | 4 ++++
 toolchain/toolchain-external/Config.in | 1 +
 8 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
index 01ddacd..2db633b 100644
--- a/package/grantlee/Config.in
+++ b/package/grantlee/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GRANTLEE
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # Qt Script
 	depends on (BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT && BR2_PACKAGE_QT) || \
 		(BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5)
+	depends on !BR2_TOOLCHAIN_BINUTILS_HAS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_QT_STL if BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_SCRIPT if BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
@@ -13,7 +14,8 @@ config BR2_PACKAGE_GRANTLEE
 
 	  http://www.grantlee.org
 
-comment "grantlee needs a toolchain with NPTL"
+comment "grantlee needs a toolchain with NPTL not affected by Binutils bug 19405"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on (BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT && BR2_PACKAGE_QT) || \
-		(BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5)
+		(BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5) || \
+		BR2_TOOLCHAIN_BINUTILS_HAS_BUG_19405
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 8bc6c34..cb2ca91 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -210,6 +210,7 @@ config BR2_PACKAGE_OPENCV_WITH_QT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # qt
 	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+	depends on !BR2_TOOLCHAIN_BINUTILS_HAS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_STL
 	select BR2_PACKAGE_QT_GUI_MODULE
@@ -217,6 +218,9 @@ config BR2_PACKAGE_OPENCV_WITH_QT
 	help
 	  Use Qt with QtTest module and STL support
 
+comment "qt backend support needs a toolchain not affected by Binutils bug 19405"
+	depends on BR2_TOOLCHAIN_BINUTILS_HAS_BUG_19405
+
 config BR2_PACKAGE_OPENCV_WITH_TIFF
 	bool "tiff support"
 	select BR2_PACKAGE_TIFF
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 3a185d6..bf24964 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -84,15 +84,16 @@ comment "gtk3 support needs libgtk3"
 config BR2_PACKAGE_OPENCV3_WITH_QT
 	bool "qt4"
 	depends on BR2_PACKAGE_QT
+	depends on !BR2_TOOLCHAIN_BINUTILS_HAS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_QT_STL
 	select BR2_PACKAGE_QT_GUI_MODULE
 	select BR2_PACKAGE_QT_TEST
 	help
 	  Use Qt4 with QtTest and QtGui modules and STL support, as GUI toolkit.
 
-comment "qt4 support needs qt"
+comment "qt4 support needs qt and a toolchain not affected by Binutils bug 19405"
 	depends on BR2_USE_MMU # qt
-	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
+	depends on (!BR2_PACKAGE_QT && !BR2_PACKAGE_QT5) || BR2_TOOLCHAIN_BINUTILS_HAS_BUG_19405
 
 config BR2_PACKAGE_OPENCV3_WITH_QT5
 	bool "qt5"
diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index f5a8159..576dd6a 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -40,11 +40,15 @@ config BR2_PACKAGE_PINENTRY_QT4
 	depends on BR2_USE_MMU # fork
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_BINUTILS_HAS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  The pinentry-qt4 tool
 
+comment "pinentry-qt4 support needs a toolchain not affected by Binutils bug 19405"
+	depends on BR2_TOOLCHAIN_BINUTILS_HAS_BUG_19405
+
 comment "pinentry-qt4 needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/poppler/Config.in b/package/poppler/Config.in
index fa4ce22..dabeff7 100644
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -15,11 +15,15 @@ if BR2_PACKAGE_POPPLER
 config BR2_PACKAGE_POPPLER_QT
 	bool "Qt support"
 	depends on BR2_PACKAGE_QT
+	depends on !BR2_TOOLCHAIN_BINUTILS_HAS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_QT_GUI_MODULE
 	select BR2_PACKAGE_QT_XML
 	help
 	  Build Qt support into the Poppler library
 
+comment "poppler Qt support needs a toolchain not affected by Binutils bug 19405"
+	depends on BR2_TOOLCHAIN_BINUTILS_HAS_BUG_19405
+
 endif
 
 comment "poppler needs a toolchain w/ C++, threads"
diff --git a/package/qt/Config.in b/package/qt/Config.in
index bf14724..96e7647 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -33,6 +33,7 @@ comment "Qt standard (X11) not available (need X.org)"
 config BR2_PACKAGE_QT_X11
 	bool "Qt standard (X11)"
 	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_TOOLCHAIN_BINUTILS_HAS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -56,6 +57,7 @@ config BR2_PACKAGE_QT_DEBUG
 
 config BR2_PACKAGE_QT_DEMOS
 	bool "Compile and install Qt demos (with code)"
+	depends on !BR2_TOOLCHAIN_BINUTILS_HAS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  If unsure, say N.
@@ -69,6 +71,7 @@ config BR2_PACKAGE_QT_TRANSLATION_FILES
 
 config BR2_PACKAGE_QT_EXAMPLES
 	bool "Compile and install Qt examples (with code)"
+	depends on !BR2_TOOLCHAIN_BINUTILS_HAS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  If unsure, say N.
@@ -130,12 +133,16 @@ config BR2_PACKAGE_QT_QT3SUPPORT
 
 config BR2_PACKAGE_QT_GUI_MODULE
 	bool "Gui Module"
+	depends on !BR2_TOOLCHAIN_BINUTILS_HAS_BUG_19405 # nios2 Binutils 2.25.1 bug
 	select BR2_PACKAGE_QT_NETWORK
 	default y
 	help
 	  Turns on support for Gui applications. If your board doesn't have
 	  video output, or you don't require Qt GUI, say n.
 
+comment "Qt Gui Module needs a toolchain not affected by Binutils bug 19405"
+	depends on BR2_TOOLCHAIN_BINUTILS_HAS_BUG_19405
+
 if BR2_PACKAGE_QT_GUI_MODULE
 
 if BR2_PACKAGE_QT_EMBEDDED
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 1b7b416..5b3f72d 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -5,6 +5,10 @@
 # so put it here instead
 source "package/gdb/Config.in.host"
 
+# https://sourceware.org/bugzilla/show_bug.cgi?id=19405
+config BR2_TOOLCHAIN_BINUTILS_HAS_BUG_19405
+	bool
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 7ba3929..81e1313 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -374,6 +374,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	select BR2_TOOLCHAIN_BINUTILS_HAS_BUG_19405 # based-on binutils-2.25.1
 	help
 	  Sourcery CodeBench toolchain for the Nios-II architecture,
 	  from Mentor Graphics. It uses gcc 5.2, binutils 2.25.51,
-- 
2.5.0
