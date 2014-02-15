From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Feb 2014 23:13:23 +0100
Subject: [Buildroot] [PATCH 2/2] opencv: always enable opencv_core module
	when opencv is enabled
In-Reply-To: <1392502403-19701-1-git-send-email-s.martin49@gmail.com>
References: <1392502403-19701-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1392502403-19701-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It does not make much sense enabling opencv without its core module.

This configuration leads to build nothing (since all modules depend on
the core one), but install the configuration files (*.pc and *.cmake)
anyway.

This absurd situation may break the build-system of other packages
that would correctly find the *.pc (but does not check for the modules
they actually use), but would not build because of missing headers and
libraries.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/opencv/Config.in | 6 ------
 package/opencv/opencv.mk | 2 +-
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index ccde5cb..217243d 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -26,12 +26,6 @@ config BR2_PACKAGE_OPENCV_LIB_CONTRIB
 	help
 	  Include opencv_contrib module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_CORE
-	bool "core"
-	default y
-	help
-	  Include opencv_core module into the OpenCV build.
-
 config BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	bool "features2d"
 	default y
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 732bc0c..42f9b0a 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -34,7 +34,7 @@ OPENCV_CONF_OPT += \
 	-DBUILD_opencv_androidcamera=OFF                                        \
 	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_LIB_CALIB3D),ON,OFF)   \
 	-DBUILD_opencv_contrib=$(if $(BR2_PACKAGE_OPENCV_LIB_CONTRIB),ON,OFF)   \
-	-DBUILD_opencv_core=$(if $(BR2_PACKAGE_OPENCV_LIB_CORE),ON,OFF)         \
+	-DBUILD_opencv_core=ON                                                  \
 	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV_LIB_FEATURES2D),ON,OFF) \
 	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV_LIB_FLANN),ON,OFF)       \
 	-DBUILD_opencv_gpu=$(if $(BR2_PACKAGE_OPENCV_LIB_GPU),ON,OFF)           \
-- 
1.8.5.4
