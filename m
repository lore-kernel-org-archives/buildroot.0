From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Feb 2014 22:59:56 +0100
Subject: [Buildroot] [PATCH 03/11] opencv: add jasper support
In-Reply-To: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
References: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1392588004-13317-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/opencv/Config.in | 6 ++++++
 package/opencv/opencv.mk | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 2acbe19..73f03e1 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -158,6 +158,12 @@ config BR2_PACKAGE_OPENCV_WITH_GTK
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBGTK2
 
+config BR2_PACKAGE_OPENCV_WITH_JASPER
+	bool "jasper (jpeg 2000) support"
+	select BR2_PACKAGE_JASPER
+	help
+	  Use shared libjasper from the target system.
+
 config BR2_PACKAGE_OPENCV_WITH_JPEG
 	bool "jpeg support"
 	select BR2_PACKAGE_JPEG
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index fb56769..ff11f1c 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -149,7 +149,6 @@ OPENCV_CONF_OPT += \
 	-DWITH_1394=OFF           \
 	-DWITH_EIGEN=OFF          \
 	-DWITH_IMAGEIO=OFF        \
-	-DWITH_JASPER=OFF         \
 	-DWITH_OPENCL=OFF         \
 	-DWITH_OPENEXR=OFF        \
 	-DWITH_OPENGL=OFF         \
@@ -181,6 +180,13 @@ else
 OPENCV_CONF_OPT += -DWITH_GTK=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_JASPER),y)
+OPENCV_CONF_OPT += -DWITH_JASPER=ON
+OPENCV_DEPENDENCIES += jasper
+else
+OPENCV_CONF_OPT += -DWITH_JASPER=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_JPEG),y)
 OPENCV_CONF_OPT += -DWITH_JPEG=ON
 OPENCV_DEPENDENCIES += jpeg
-- 
1.8.5.4
