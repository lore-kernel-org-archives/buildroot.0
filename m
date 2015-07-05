From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  5 Jul 2015 16:28:57 +0200
Subject: [Buildroot] [PATCH v9 1/4] package/opencv: add a choice for
	selecting the gui toolkit
In-Reply-To: <1436106540-3466-1-git-send-email-s.martin49@gmail.com>
References: <1436106540-3466-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1436106540-3466-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch moves the existing Qt4 and gtk2 options in that choice right
after the highgui knob.
In OpenCV, only one GUI toolkik will be actually used at the time by the
highgui module, given priority to Qt4.

Suggested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
changes v8->v9:
- update help text (ThomasP)

changes v7->v8:
- update a/r/t tags

changes v6->v7:
- move choice right after highgui knob (Yann)
- reword help text and comment (Yann)

changes v5->v6:
- new patch
---
 package/opencv/Config.in | 67 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 23 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 079730e..c3542c4 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -52,6 +52,50 @@ config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	  Include opencv_highgui (high-level gui and media i/o) module into the
 	  OpenCV build.
 
+choice
+	prompt "gui toolkit"
+	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+	help
+	  GUI toolkit to be used by the opencv_highgui module.
+
+config BR2_PACKAGE_OPENCV_GUI_NONE
+	bool "none"
+
+config BR2_PACKAGE_OPENCV_WITH_GTK
+	bool "gtk2"
+	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
+	depends on BR2_USE_MMU # libgtk2 -> libglib2
+	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBGTK2
+
+comment "gtk2 needs X.org and a toolchain w/ wchar, threads, C++"
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
 config BR2_PACKAGE_OPENCV_LIB_IMGCODECS
 	bool "imgcodecs"
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
@@ -209,17 +253,6 @@ comment "gstreamer-1.x support needs a toolchain w/ wchar, threads"
 
 endchoice
 
-config BR2_PACKAGE_OPENCV_WITH_GTK
-	bool "gtk support"
-	depends on BR2_PACKAGE_XORG7
-	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_MMU # libgtk2 -> glib2
-	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
-	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
-	select BR2_PACKAGE_LIBGTK2
-
 config BR2_PACKAGE_OPENCV_WITH_JASPER
 	bool "jpeg2000 support"
 	select BR2_PACKAGE_JASPER
@@ -242,18 +275,6 @@ config BR2_PACKAGE_OPENCV_WITH_PNG
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
2.4.5
