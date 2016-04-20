From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2016 23:20:58 +0200
Subject: [Buildroot] [git commit] toolchain-external: CodeSourcery NiosII
	2015.11 affected by PR19405
Message-ID: <20160420212139.43B0E81DF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5dce3c05b5ea38539f6ee6efc24c13db936260dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See bug report https://sourceware.org/bugzilla/show_bug.cgi?id=19405

Fixes:
http://autobuild.buildroot.net/results/ee562524c5b12191e584ceae89006c5a5103e700

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[Thomas:
 - rename BR2_TOOLCHAIN_BINUTILS_HAS_BUG_19405 to
   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
 - propagate to the qwt package, which is now selecting
   BR2_PACKAGE_QT_GUI_MODULE.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/grantlee/Config.in             | 6 ++++--
 package/opencv/Config.in               | 4 ++++
 package/opencv3/Config.in              | 5 +++--
 package/pinentry/Config.in             | 4 ++++
 package/poppler/Config.in              | 4 ++++
 package/qt/Config.in                   | 7 +++++++
 package/qwt/Config.in                  | 6 +++++-
 toolchain/toolchain-common.in          | 4 ++++
 toolchain/toolchain-external/Config.in | 1 +
 9 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
index 01ddacd..97be721 100644
--- a/package/grantlee/Config.in
+++ b/package/grantlee/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GRANTLEE
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # Qt Script
 	depends on (BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT && BR2_PACKAGE_QT) || \
 		(BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5)
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # Qt GUI module
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
+		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index b563312..83a26a6 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -225,6 +225,7 @@ config BR2_PACKAGE_OPENCV_WITH_QT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # qt
 	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_STL
 	select BR2_PACKAGE_QT_GUI_MODULE
@@ -232,6 +233,9 @@ config BR2_PACKAGE_OPENCV_WITH_QT
 	help
 	  Use Qt with QtTest module and STL support
 
+comment "qt backend support needs a toolchain not affected by Binutils bug 19405"
+	depends on BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
+
 config BR2_PACKAGE_OPENCV_WITH_TIFF
 	bool "tiff support"
 	select BR2_PACKAGE_TIFF
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 31fd98a..9629a64 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -84,15 +84,16 @@ comment "gtk3 support needs libgtk3"
 config BR2_PACKAGE_OPENCV3_WITH_QT
 	bool "qt4"
 	depends on BR2_PACKAGE_QT
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_QT_STL
 	select BR2_PACKAGE_QT_GUI_MODULE
 	select BR2_PACKAGE_QT_TEST
 	help
 	  Use Qt4 with QtTest and QtGui modules and STL support, as GUI toolkit.
 
-comment "qt4 support needs qt"
+comment "qt4 support needs qt and a toolchain not affected by Binutils bug 19405"
 	depends on BR2_USE_MMU # qt
-	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
+	depends on (!BR2_PACKAGE_QT && !BR2_PACKAGE_QT5) || BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
 
 config BR2_PACKAGE_OPENCV3_WITH_QT5
 	bool "qt5"
diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index f5a8159..682af9f 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -40,11 +40,15 @@ config BR2_PACKAGE_PINENTRY_QT4
 	depends on BR2_USE_MMU # fork
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  The pinentry-qt4 tool
 
+comment "pinentry-qt4 support needs a toolchain not affected by Binutils bug 19405"
+	depends on BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
+
 comment "pinentry-qt4 needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/poppler/Config.in b/package/poppler/Config.in
index fa4ce22..2ca3ff6 100644
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -15,11 +15,15 @@ if BR2_PACKAGE_POPPLER
 config BR2_PACKAGE_POPPLER_QT
 	bool "Qt support"
 	depends on BR2_PACKAGE_QT
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_QT_GUI_MODULE
 	select BR2_PACKAGE_QT_XML
 	help
 	  Build Qt support into the Poppler library
 
+comment "poppler Qt support needs a toolchain not affected by Binutils bug 19405"
+	depends on BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
+
 endif
 
 comment "poppler needs a toolchain w/ C++, threads"
diff --git a/package/qt/Config.in b/package/qt/Config.in
index 248af00..0ab8417 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -33,6 +33,7 @@ comment "Qt standard (X11) not available (need X.org)"
 config BR2_PACKAGE_QT_X11
 	bool "Qt standard (X11)"
 	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -56,6 +57,7 @@ config BR2_PACKAGE_QT_DEBUG
 
 config BR2_PACKAGE_QT_DEMOS
 	bool "Compile and install Qt demos (with code)"
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  If unsure, say N.
@@ -69,6 +71,7 @@ config BR2_PACKAGE_QT_TRANSLATION_FILES
 
 config BR2_PACKAGE_QT_EXAMPLES
 	bool "Compile and install Qt examples (with code)"
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # Qt GUI module
 	select BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  If unsure, say N.
@@ -130,12 +133,16 @@ config BR2_PACKAGE_QT_QT3SUPPORT
 
 config BR2_PACKAGE_QT_GUI_MODULE
 	bool "Gui Module"
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # nios2 Binutils 2.25.1 bug
 	select BR2_PACKAGE_QT_NETWORK
 	default y
 	help
 	  Turns on support for Gui applications. If your board doesn't have
 	  video output, or you don't require Qt GUI, say n.
 
+comment "Qt Gui Module needs a toolchain not affected by Binutils bug 19405"
+	depends on BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
+
 if BR2_PACKAGE_QT_GUI_MODULE
 
 if BR2_PACKAGE_QT_EMBEDDED
diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index 3f54509..810bd75 100644
--- a/package/qwt/Config.in
+++ b/package/qwt/Config.in
@@ -1,6 +1,10 @@
+comment "qwt needs a toolchain not affected by Binutils bug 19405"
+	depends on BR2_PACKAGE_QT && BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
+
 config BR2_PACKAGE_QWT
 	bool "qwt"
-	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
+	depends on (BR2_PACKAGE_QT && !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405) || \
+		BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5 # printsupport
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 7ad1c05..00d73b6 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -5,6 +5,10 @@
 # so put it here instead
 source "package/gdb/Config.in.host"
 
+# https://sourceware.org/bugzilla/show_bug.cgi?id=19405
+config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
+	bool
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index d6f57a1..f497694 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -413,6 +413,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	select BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # based-on binutils-2.25.1
 	help
 	  Sourcery CodeBench toolchain for the Nios-II architecture,
 	  from Mentor Graphics. It uses gcc 5.2, binutils 2.25.51,
