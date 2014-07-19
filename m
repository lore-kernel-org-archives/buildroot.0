From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Jul 2014 20:35:42 +0200
Subject: [Buildroot] [PATCH] package/opencv: fix dependencies for the Qt and
	GTK backends
Message-ID: <1405794942-32087-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Only the highgui module can use Qt or GTK (as noticed by Thomas.)

However, it is currently possible to select the Qt or the GTK backends
support independently of highgui, thus breaking the configuration step
of opencv.

Just hide the Qt and GTK backends when highgui is not selected.

Fixes:
    http://autobuild.buildroot.org/results/efc/efc9590a193235701fee535f4a1da7b39c426665/
    http://autobuild.buildroot.org/results/b6a/b6acd983b8c78005feef6864af469bd348ab742a/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Samuel Martin <s.martin49@gmail.com>

---
Note: tested with the config from efc9590, except an external toolchain
was used: BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311=y

Tested without highgui, then with highgui but no backend, then with
highgui and the Qt backend. The GTK backend was not tested.
---
 package/opencv/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 6e938d2..1a026a9 100644
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
 	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	select BR2_PACKAGE_QT_TEST       if BR2_PACKAGE_OPENCV_LIB_HIGHGUI
-	default y
 	help
 	  Use Qt with QtTest module and STL support
 
-- 
1.9.1
