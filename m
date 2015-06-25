From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 25 Jun 2015 21:59:53 +0200
Subject: [Buildroot] [PATCH v6 12/16] package/opencv: add a choice for
	selecting the gui toolkit
In-Reply-To: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1435262397-888-13-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch moves the existing Qt4 and gtk2 options in that choice
because, in OpenCV, only one toolkik will be actually used at the time,
given priority to Qt4.

Suggested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v5->v6:
- new patch
---
 package/opencv/Config.in | 53 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 14 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index f89e62d..040ee55 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -206,17 +206,54 @@ config BR2_PACKAGE_OPENCV_WITH_GSTREAMER1
 
 endchoice
 
+choice
+	prompt "gui toolkit"
+	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+	help
+	  GUI toolkit for opencv_highgui module.
+
+	  OpenCV GUI toolkit preference (from the most to the least):
+	  - Qt4
+	  - gtk-2
+
+config BR2_PACKAGE_OPENCV_GUI_NONE
+	bool "none"
+
 config BR2_PACKAGE_OPENCV_WITH_GTK
-	bool "gtk support"
+	bool "gtk2"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # libgtk2 -> glib2
 	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
-	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	select BR2_PACKAGE_LIBGTK2
 
+comment "gtk2 depends on X.org and needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_USE_MMU # libgtk2 -> glib2
+	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
+	depends on !BR2_PACKAGE_XORG7 || \
+		!BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_OPENCV_WITH_QT
+	bool "qt4"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # qt
+	select BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT_STL
+	select BR2_PACKAGE_QT_GUI_MODULE
+	select BR2_PACKAGE_QT_TEST
+	help
+	  Use Qt with QtTest module and STL support
+
+comment "qt4 needs a toolchain w/ C++"
+	depends on BR2_USE_MMU # qt
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+endchoice
+
 config BR2_PACKAGE_OPENCV_WITH_JASPER
 	bool "jpeg2000 support"
 	select BR2_PACKAGE_JASPER
@@ -239,18 +276,6 @@ config BR2_PACKAGE_OPENCV_WITH_PNG
 	help
 	  Use shared libpng from the target system.
 
-config BR2_PACKAGE_OPENCV_WITH_QT
-	bool "qt backend support"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_MMU # qt
-	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
-	select BR2_PACKAGE_QT
-	select BR2_PACKAGE_QT_STL
-	select BR2_PACKAGE_QT_GUI_MODULE
-	select BR2_PACKAGE_QT_TEST
-	help
-	  Use Qt with QtTest module and STL support
-
 config BR2_PACKAGE_OPENCV_WITH_TIFF
 	bool "tiff support"
 	select BR2_PACKAGE_TIFF
-- 
2.4.4
