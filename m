From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  4 Jul 2015 21:07:00 +0200
Subject: [Buildroot] [PATCH v7 6/7] package/opencv: add opengl support
In-Reply-To: <1436036821-10073-1-git-send-email-s.martin49@gmail.com>
References: <1436036821-10073-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1436036821-10073-7-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In OpenCV, OpenGL is only used by highgui module.

OpenGL support is done using extensions from 3rd party framework: either
Qt5OpenGL with Qt5 (with GL support only, not GLES); or gtkglext (which
is not available in Buildroot) with gtk2

So, make OpenGL knob a sub-option of the Qt5 support option.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v6->v7:
- rework comment as sugessted by Yann
- move opengl option close to the gui toolkit choice

changes v5->v6:
- update comments (Yann)

changes v4->v5:
- new patch
---
 package/opencv/Config.in | 22 +++++++++++++++++++++-
 package/opencv/opencv.mk |  7 +++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index e54d436..7912a1a 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -52,9 +52,10 @@ config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	  Include opencv_highgui (high-level gui and media i/o) module into the
 	  OpenCV build.
 
+if BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+
 choice
 	prompt "gui toolkit"
-	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	help
 	  GUI toolkit for opencv_highgui module.
 
@@ -140,6 +141,25 @@ comment "qt5 support needs qt5"
 
 endchoice
 
+config BR2_PACKAGE_OPENCV_WITH_OPENGL
+	bool "opengl support"
+	# OpenGL support done using Qt5OpenGL, so depends on WITH_QT5
+	depends on BR2_PACKAGE_OPENCV_WITH_QT5
+	# OpenGL support requires Qt5OpenGL with GL support, not GLES
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_QT5BASE_OPENGL
+	help
+	  Enable OpenGL for UI.
+
+comment "opengl support needs an OpenGL provider"
+	depends on BR2_PACKAGE_OPENCV_WITH_QT5
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE || \
+		!BR2_PACKAGE_HAS_LIBGL
+
+endif # BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+
+
 config BR2_PACKAGE_OPENCV_LIB_IMGCODECS
 	bool "imgcodecs"
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 986e7b4..61a3ccd 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -264,6 +264,13 @@ else
 OPENCV_CONF_OPTS += -DWITH_JPEG=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_OPENGL),y)
+OPENCV_CONF_OPTS += -DWITH_OPENGL=ON
+OPENCV_DEPENDENCIES += libgl qt5base
+else
+OPENCV_CONF_OPTS += -DWITH_OPENGL=OFF
+endif
+
 OPENCV_CONF_OPTS += -DWITH_OPENMP=$(if $(BR2_GCC_ENABLE_OPENMP),ON,OFF)
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_PNG),y)
-- 
2.4.5
