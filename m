From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  7 Jun 2015 12:26:35 +0200
Subject: [Buildroot] [PATCH v5 09/13] package/opencv: add opengl support
In-Reply-To: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
References: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1433672799-21387-10-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In OpenCV, OpenGL support is done using extensions from 3rd party
framework: either Qt5OpenGL with Qt5 (with GL support only, not GLES);
or gtkglext (which is not available in Buildroot) with gtk2

So, make OpenGL knob visible when Qt5 support is selected.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v4->v5:
- new patch
---
 package/opencv/Config.in | 11 +++++++++++
 package/opencv/opencv.mk |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 55e7580..f4072ef 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -227,6 +227,17 @@ config BR2_PACKAGE_OPENCV_WITH_JPEG
 	help
 	  Use shared libjpeg from the target system.
 
+config BR2_PACKAGE_OPENCV_WITH_OPENGL
+	bool "opengl support"
+	# OpenGL support done using Qt5OpenGL, so depends on QT5_BACKEND
+	depends on BR2_PACKAGE_OPENCV_QT5_BACKEND
+	# OpenGL support requires Qt5OpenGL with GL support
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_QT5BASE_OPENGL
+	help
+	  Enable OpenGL for UI.
+
 config BR2_PACKAGE_OPENCV_WITH_PNG
 	bool "png support"
 	select BR2_PACKAGE_LIBPNG
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 6162d1e..2902a20 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -243,6 +243,13 @@ else
 OPENCV_CONF_OPTS += -DWITH_JPEG=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_OPENGL),y)
+OPENCV_CONF_OPTS += -DWITH_OPENGL=ON
+OPENCV_DEPENDENCIES += libgl qt5base
+else
+OPENCV_CONF_OPTS += -DWITH_OPENGL=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_PNG),y)
 OPENCV_CONF_OPTS += -DWITH_PNG=ON
 OPENCV_DEPENDENCIES += libpng
-- 
2.4.2
