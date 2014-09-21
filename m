From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 22:46:52 +0200
Subject: [Buildroot] [git commit] opencv: rework V4L/libv4l support
Message-ID: <20140921204714.5CCC39D739@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=547b3bb3371c3ea65d6e91126db5953032e92cbd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting with the 2.4.7 release, for V4L support, OpenCV does not
requires a libv4l dependency for its V4L support.

So, it now provides 2 distincts knobs for this: WITH_V4L and a new
one: WITH_LIBV4L.

This patch takes advantage of this new knob and libv4l support is
now automatically enabled only if the libv4l package is enabled.

In OpenCV, the logic behind this is:
- using libv4l if available,
- otherwise, use v4l2 or v4l API from the kernel if available.

[Thomas: remove gratuituous reformating, as suggested by Yann.]

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/Config.in |    8 +-------
 package/opencv/opencv.mk |    6 ++++--
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 3f5051e..24f540e 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -205,16 +205,10 @@ config BR2_PACKAGE_OPENCV_WITH_TIFF
 
 config BR2_PACKAGE_OPENCV_WITH_V4L
 	bool "v4l support"
-	depends on BR2_LARGEFILE
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU # libv4l fork
-	select BR2_PACKAGE_LIBV4L
 	help
 	  Enable Video 4 Linux support.
 
-comment "v4l support needs a toolchain w/ largefile, threads"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU
+	  If the package libv4l is enabled, its support is automatically enabled.
 
 comment "Install options"
 
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 1341d32..8c2de79 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -220,8 +220,10 @@ OPENCV_CONF_OPT += -DWITH_TIFF=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_V4L),y)
-OPENCV_CONF_OPT += -DWITH_V4L=ON -DWITH_LIBV4L=ON
-OPENCV_DEPENDENCIES += libv4l
+OPENCV_CONF_OPT += \
+	-DWITH_V4L=ON \
+	-DWITH_LIBV4L=$(if $(BR2_PACKAGE_LIBV4L),ON,OFF)
+OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBV4L),libv4l)
 else
 OPENCV_CONF_OPT += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
 endif
