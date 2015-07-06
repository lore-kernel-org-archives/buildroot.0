From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 11:50:00 +0200
Subject: [Buildroot] [git commit] package/opencv: add opengl support
Message-ID: <20150706095005.CCBF67FC2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5cbe66571e020489b1156198fdbefd202aef130
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In OpenCV, OpenGL is only used by highgui module.

OpenGL support is done using extensions from 3rd party framework: either
Qt5OpenGL with Qt5 (with GL support only, not GLES); or gtkglext (which
is not available in Buildroot) with gtk2

So, make OpenGL knob a sub-option of the Qt5 support option.

Note: we enclose both the GUI toolkit choice and the GL option in an
if-block, so that the GL option gets properly indented; having it
depend on WITH_QT5 is not enough, because it does not directly follow
it, so kconfig would not consider it for indenting.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[yann.morin.1998 at free.fr: tweak commit log about the if-block]
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/Config.in |   22 +++++++++++++++++++++-
 package/opencv/opencv.mk |    7 +++++++
 2 files changed, 28 insertions(+), 1 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 6ae74b4..0b5d1ac 100644
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
 	  GUI toolkit to be used by the opencv_highgui module.
 
@@ -108,6 +109,25 @@ comment "qt5 support needs qt5"
 
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
index c788aeb..bb1bcd8 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -264,6 +264,13 @@ else
 OPENCV_CONF_OPTS += -DWITH_JPEG=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_OPENGL),y)
+OPENCV_CONF_OPTS += -DWITH_OPENGL=ON
+OPENCV_DEPENDENCIES += libgl
+else
+OPENCV_CONF_OPTS += -DWITH_OPENGL=OFF
+endif
+
 OPENCV_CONF_OPTS += -DWITH_OPENMP=$(if $(BR2_GCC_ENABLE_OPENMP),ON,OFF)
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_PNG),y)
