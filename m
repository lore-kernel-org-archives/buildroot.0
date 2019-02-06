From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  6 Feb 2019 15:10:48 +0100
Subject: [Buildroot] [PATCH 06/16] package/opencv: remove qt backend option
In-Reply-To: <20190206141058.24155-1-peter@korsgaard.com>
References: <20190206141058.24155-1-peter@korsgaard.com>
Message-ID: <20190206141058.24155-6-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The qt backend option uses the obsolete qt4 package, which we are about to
remove, so remove the qt backend option as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy         |  6 ++++++
 package/opencv/Config.in | 12 ------------
 package/opencv/opencv.mk |  8 +-------
 3 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index dbd7450741..cdf5f989b5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2019.02"
 
+config BR2_PACKAGE_OPENCV_WITH_QT
+	bool "opencv qt backend option removed"
+	select BR2_LEGACY
+	help
+	  The opencv qt backend option was removed.
+
 config BR2_PACKAGE_AMD_CATALYST_CCCLE
 	bool "catalyst control center option removed"
 	select BR2_LEGACY
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index b7c8c41682..54094b29ca 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -266,18 +266,6 @@ config BR2_PACKAGE_OPENCV_WITH_PNG
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
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index d9813a041d..ccc2d820da 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -160,6 +160,7 @@ OPENCV_CONF_OPTS += \
 	-DWITH_OPENGL=OFF \
 	-DWITH_OPENMP=OFF \
 	-DWITH_OPENNI=OFF \
+	-DWITH_QT=OFF \
 	-DWITH_UNICAP=OFF \
 	-DWITH_XINE=OFF
 
@@ -215,13 +216,6 @@ else
 OPENCV_CONF_OPTS += -DWITH_PNG=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
-OPENCV_CONF_OPTS += -DWITH_QT=4
-OPENCV_DEPENDENCIES += qt
-else
-OPENCV_CONF_OPTS += -DWITH_QT=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_TIFF),y)
 OPENCV_CONF_OPTS += -DWITH_TIFF=ON
 OPENCV_DEPENDENCIES += tiff
-- 
2.11.0
