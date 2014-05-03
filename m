From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 May 2014 23:06:42 +0200
Subject: [Buildroot] [git commit] opencv: fix qt selection when highgui is
	enable
Message-ID: <20140503211218.AE3159C951@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b41d31c344943428c3ce29c3cbfc5dd41052813
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The OpenCV highgui module links against QtGui and QtTest.
The latter is built by default but was never installed.
Thanks to the previous patch on Qt, this can be rectified.

So, update the OpenCV Config.in with the missing Qt module selection.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index b40e141..49ada5d 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -173,9 +173,11 @@ config BR2_PACKAGE_OPENCV_WITH_QT
 	depends on BR2_USE_MMU # qt
 	select BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_STL
+	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+	select BR2_PACKAGE_QT_TEST       if BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	default y
 	help
-	  Use Qt with STL support
+	  Use Qt with QtTest module and STL support
 
 config BR2_PACKAGE_OPENCV_WITH_TIFF
 	bool "tiff support"
