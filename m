From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 23 Apr 2014 01:15:49 +0200
Subject: [Buildroot] [PATCH v2 17/24] opencv: rework V4L/libv4l support
In-Reply-To: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398208556-4195-18-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting with the 2.4.7 release, for V4L support, OpenCV does not
requires a libv4l dependency for its V4L support.

So, it now provides 2 distincts knobs for this: WITH_V4L and a new
one: WITH_LIBV4L.

This patch takes advantage of this new knob and libv4l support is
now automatically enabled if only the libv4l package is enabled.

In OpenCV, the logic behind this is:
- using libv4l if available,
- otherwise, use v4l2 or v4l API from the kernel if available.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- rebase
- extend commit message
---
 package/opencv/Config.in | 11 ++++++-----
 package/opencv/opencv.mk | 10 +++++++---
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 129e0aa..0db239e 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -194,14 +194,15 @@ config BR2_PACKAGE_OPENCV_WITH_TIFF
 
 config BR2_PACKAGE_OPENCV_WITH_V4L
 	bool "v4l support"
-	depends on BR2_LARGEFILE
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_LIBV4L
 	help
 	  Enable Video 4 Linux support.
 
-comment "v4l support needs a toolchain w/ largefile, threads"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	  If the package libv4l is enabled, its support is automatically enabled.
+
+if BR2_PACKAGE_OPENCV_WITH_V4L && !(BR2_LARGEFILE && BR2_TOOLCHAIN_HAS_THREADS)
+comment "libv4l support will be disabled."
+comment "libv4l support needs a toolchain w/ largefile, threads"
+endif
 
 comment "Install options"
 
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 14a095c..e6de252 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -214,10 +214,14 @@ OPENCV_CONF_OPT += -DWITH_TIFF=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_V4L),y)
-OPENCV_CONF_OPT += -DWITH_V4L=ON -DWITH_LIBV4L=ON
-OPENCV_DEPENDENCIES += libv4l
+OPENCV_CONF_OPT += \
+	-DWITH_V4L=ON \
+	-DWITH_LIBV4L=$(if $(BR2_PACKAGE_LIBV4L),ON,OFF)
+OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBV4L),libv4l)
 else
-OPENCV_CONF_OPT += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
+OPENCV_CONF_OPT += \
+	-DWITH_V4L=OFF \
+	-DWITH_LIBV4L=OFF
 endif
 
 # Installation hooks:
-- 
1.9.2
