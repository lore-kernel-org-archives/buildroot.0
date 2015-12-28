From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 28 Dec 2015 22:23:32 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/qt: disable Qt GUI module for
	NiosII
Message-ID: <1451337814-16379-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libQtGui.so build triggers an ld error with Binutils 2.25.1 which should
be fixed with the upcoming Binutils 2.26 release. In the same time, the issue
has been reported [1].

Although the Binutils issue is not fixed yet, disable Qt GUI module on nios2
since it's unlikely used on this plateform [2].

Avoid (GCC 5.2 and Binutils 2.25.51):
http://autobuild.buildroot.net/results/c94/c945bce96966e5e39d093c4265058a66f749eea6

Avoid (GCC 4.9.3 and Binutils 2.25.1):
http://autobuild.buildroot.net/results/ca9/ca981c419bfedb38c591f6e75151a943bc9535ef

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=19405
[2] http://lists.busybox.net/pipermail/buildroot/2015-December/148136.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
v2: disable Qt GUI module for NiosII CPU, not only for the CS toolchain.
    (ThomasP)
---
 package/grantlee/Config.in | 1 +
 package/opencv/Config.in   | 1 +
 package/opencv3/Config.in  | 1 +
 package/pinentry/Config.in | 1 +
 package/poppler/Config.in  | 1 +
 package/qt/Config.in       | 8 ++++++++
 6 files changed, 13 insertions(+)

diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
index 01ddacd..8284fd4 100644
--- a/package/grantlee/Config.in
+++ b/package/grantlee/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GRANTLEE
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # Qt Script
 	depends on (BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT && BR2_PACKAGE_QT) || \
 		(BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5)
+	depends on !BR2_nios2 # Qt GUI module
 	select BR2_PACKAGE_QT_STL if BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_SCRIPT if BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 679ce6f..707fd4e 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -210,6 +210,7 @@ config BR2_PACKAGE_OPENCV_WITH_QT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # qt
 	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+	depends on !BR2_nios2 # Qt GUI module
 	select BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_STL
 	select BR2_PACKAGE_QT_GUI_MODULE
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 8736805..d22fd32 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -84,6 +84,7 @@ comment "gtk3 support needs libgtk3"
 config BR2_PACKAGE_OPENCV3_WITH_QT
 	bool "qt4"
 	depends on BR2_PACKAGE_QT
+	depends on !BR2_nios2 # Qt GUI module
 	select BR2_PACKAGE_QT_STL
 	select BR2_PACKAGE_QT_GUI_MODULE
 	select BR2_PACKAGE_QT_TEST
diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index edf3316..650caa0 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -40,6 +40,7 @@ config BR2_PACKAGE_PINENTRY_QT4
 	depends on BR2_USE_MMU # fork
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_nios2 # Qt GUI module
 	select BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_GUI_MODULE
 	help
diff --git a/package/poppler/Config.in b/package/poppler/Config.in
index fa4ce22..1d48293 100644
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -15,6 +15,7 @@ if BR2_PACKAGE_POPPLER
 config BR2_PACKAGE_POPPLER_QT
 	bool "Qt support"
 	depends on BR2_PACKAGE_QT
+	depends on !BR2_nios2 # Qt GUI module
 	select BR2_PACKAGE_QT_GUI_MODULE
 	select BR2_PACKAGE_QT_XML
 	help
diff --git a/package/qt/Config.in b/package/qt/Config.in
index bf14724..4baeec0 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -33,6 +33,7 @@ comment "Qt standard (X11) not available (need X.org)"
 config BR2_PACKAGE_QT_X11
 	bool "Qt standard (X11)"
 	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_nios2 # Qt GUI module
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -56,6 +57,7 @@ config BR2_PACKAGE_QT_DEBUG
 
 config BR2_PACKAGE_QT_DEMOS
 	bool "Compile and install Qt demos (with code)"
+	depends on !BR2_nios2 # Qt GUI module
 	select BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  If unsure, say N.
@@ -69,6 +71,7 @@ config BR2_PACKAGE_QT_TRANSLATION_FILES
 
 config BR2_PACKAGE_QT_EXAMPLES
 	bool "Compile and install Qt examples (with code)"
+	depends on !BR2_nios2 # Qt GUI module
 	select BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  If unsure, say N.
@@ -130,6 +133,11 @@ config BR2_PACKAGE_QT_QT3SUPPORT
 
 config BR2_PACKAGE_QT_GUI_MODULE
 	bool "Gui Module"
+	# Broken on existing external/internal nios2 toolchains,
+	# revisit when they are upgraded with at least Binutils >= 2.26
+	# and GCC >= 5.3.
+	# https://sourceware.org/bugzilla/show_bug.cgi?id=19405
+	depends on !BR2_nios2
 	select BR2_PACKAGE_QT_NETWORK
 	default y
 	help
-- 
2.4.3
