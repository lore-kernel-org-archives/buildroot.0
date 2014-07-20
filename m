From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jul 2014 11:53:40 +0200
Subject: [Buildroot] [git commit] package/opencv: fix dependencies for the
	Qt and GTK backends
Message-ID: <20140720095432.AD8649D1E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68e1083b9d5730801ff4c5b754370fc0c696f6fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only the highgui module can use Qt or GTK (as noticed by Thomas.)

However, it is currently possible to select the Qt or the GTK backends
support independently of highgui, thus breaking the configuration step
of opencv.

Just hide the Qt and GTK backends when highgui is not selected.

Fixes:
    http://autobuild.buildroot.org/results/efc/efc9590a193235701fee535f4a1da7b39c426665/
    http://autobuild.buildroot.org/results/b6a/b6acd983b8c78005feef6864af469bd348ab742a/

[Thomas: remove 'if BR2_PACKAGE_OPENCV_LIB_HIGHGUI' statements since
BR2_PACKAGE_OPENCV_WITH_QT now depends on
BR2_PACKAGE_OPENCV_LIB_HIGHGUI]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/Config.in |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 6e938d2..3f5051e 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -159,6 +159,7 @@ config BR2_PACKAGE_OPENCV_WITH_GTK
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # libgtk2 -> glib2
+	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	select BR2_PACKAGE_LIBGTK2
 
 config BR2_PACKAGE_OPENCV_WITH_JASPER
@@ -188,11 +189,11 @@ config BR2_PACKAGE_OPENCV_WITH_QT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_avr32 # qt
 	depends on BR2_USE_MMU # qt
+	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	select BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_STL
-	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_OPENCV_LIB_HIGHGUI
-	select BR2_PACKAGE_QT_TEST       if BR2_PACKAGE_OPENCV_LIB_HIGHGUI
-	default y
+	select BR2_PACKAGE_QT_GUI_MODULE
+	select BR2_PACKAGE_QT_TEST
 	help
 	  Use Qt with QtTest module and STL support
 
