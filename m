From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 22:55:29 +0200
Subject: [Buildroot] [git commit] opencv: sort and reorder SW support options
Message-ID: <20140716210452.8D04B9D25F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0af54614e4ce0092c8f5ef8b01bb4246b0c6c903
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sort SW features by category and disable them when not supported by
Buildroot.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/opencv.mk |   62 +++++++++++++++++++++++++++++----------------
 1 files changed, 40 insertions(+), 22 deletions(-)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 34a01c1..fa9b207 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -76,7 +76,6 @@ OPENCV_CONF_OPT += \
 	-DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF)   \
 	-DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
 
-# Software/3rd-party support options.
 # Cuda stuff
 OPENCV_CONF_OPT += \
 	-DWITH_CUBLAS=OFF \
@@ -106,34 +105,53 @@ OPENCV_CONF_OPT += -DWITH_PVAPI=OFF
 # Ximea stuff
 OPENCV_CONF_OPT += -DWITH_XIMEA=OFF
 
+# Non-Linux support (Android options) must remain OFF:
 OPENCV_CONF_OPT += \
-	-DBUILD_JASPER=OFF \
-	-DBUILD_JPEG=OFF   \
-	-DBUILD_PNG=OFF	   \
-	-DBUILD_TIFF=OFF   \
-	-DBUILD_ZLIB=OFF   \
+	-DWITH_ANDROID_CAMERA=OFF          \
 	-DBUILD_ANDROID_CAMERA_WRAPPER=OFF \
 	-DBUILD_ANDROID_EXAMPLES=OFF	   \
+	-DINSTALL_ANDROID_EXAMPLES=OFF     \
 	-DBUILD_FAT_JAVA_LIB=OFF           \
-	-DBUILD_JAVA_SUPPORT=OFF	   \
+	-DBUILD_JAVA_SUPPORT=OFF
+
+# Non-Linux support (Mac OSX options) must remain OFF:
+OPENCV_CONF_OPT += \
+	-DWITH_AVFOUNDATION=OFF	\
+	-DWITH_CARBON=OFF       \
+	-DWITH_QUICKTIME=OFF
+
+# Non-Linux support (Windows options) must remain OFF:
+OPENCV_CONF_OPT += \
+	-DWITH_VFW=OFF      \
+	-DWITH_WIN32UI=OFF  \
+	-DWITH_CSTRIPES=OFF \
+	-DWITH_DSHOW=OFF    \
+	-DWITH_MSMF=OFF     \
+	-DWITH_VIDEOINPUT=OFF
+
+# Software/3rd-party support options.
+OPENCV_CONF_OPT += \
+	-DBUILD_JASPER=OFF  \
+	-DBUILD_JPEG=OFF    \
+	-DBUILD_OPENEXR=OFF \
+	-DBUILD_PNG=OFF	    \
+	-DBUILD_TIFF=OFF    \
+	-DBUILD_ZLIB=OFF    \
 	-DBUILD_NEW_PYTHON_SUPPORT=OFF \
-	-DINSTALL_ANDROID_EXAMPLES=OFF \
 	-DINSTALL_C_EXAMPLES=OFF       \
 	-DINSTALL_PYTHON_EXAMPLES=OFF  \
-	-DINSTALL_TO_MANGLED_PATHS=OFF \
-	-DWITH_1394=OFF           \
-	-DWITH_ANDROID_CAMERA=OFF \
-	-DWITH_AVFOUNDATION=OFF	  \
-	-DWITH_CARBON=OFF         \
-	-DWITH_EIGEN=OFF          \
-	-DWITH_IMAGEIO=OFF        \
-	-DWITH_JASPER=OFF         \
-	-DWITH_OPENEXR=OFF        \
-	-DWITH_OPENGL=OFF         \
-	-DWITH_OPENNI=OFF         \
-	-DWITH_QUICKTIME=OFF      \
-	-DWITH_UNICAP=OFF         \
-	-DWITH_VIDEOINPUT=OFF     \
+	-DINSTALL_TO_MANGLED_PATHS=OFF
+
+# Disabled features (mostly because they are not available in Buildroot), but
+# - eigen: OpenCV does not use it, not take any benefit from it.
+OPENCV_CONF_OPT += \
+	-DWITH_1394=OFF    \
+	-DWITH_EIGEN=OFF   \
+	-DWITH_IMAGEIO=OFF \
+	-DWITH_OPENEXR=OFF \
+	-DWITH_OPENGL=OFF  \
+	-DWITH_OPENNI=OFF  \
+	-DWITH_UNICAP=OFF  \
 	-DWITH_XINE=OFF
 
 OPENCV_DEPENDENCIES += zlib
