From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Dec 2011 21:56:52 +0100
Subject: [Buildroot] [git commit] opencv: bump version to fix ffmpeg support
	build
Message-ID: <20111211205719.4763C8F8FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=848fa1d24369a7e3cdd25b10a0d31ed1de501d01
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A newer version of opencv is needed after the ffmpeg version bump. This
version does need a minor patch for fabsl on uClibc though.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...pencv-uclibc-optional-long-double-support.patch |   40 ++++++++++++++++++++
 package/opencv/opencv.mk                           |    5 +-
 2 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/package/opencv/opencv-uclibc-optional-long-double-support.patch b/package/opencv/opencv-uclibc-optional-long-double-support.patch
new file mode 100644
index 0000000..b319849
--- /dev/null
+++ b/package/opencv/opencv-uclibc-optional-long-double-support.patch
@@ -0,0 +1,40 @@
+Upstream: https://code.ros.org/trac/opencv/ticket/1515
+
+[PATCH] Fix compile issue in flann module on uClibc without long double support
+
+uClibc configured without UCLIBC_HAS_LONG_DOUBLE_MATH (because of user
+choice or simply that the arch doesn't provide long doubles) doesn't
+provide fabsl(), breaking the build in the flann module.
+
+Work around it by not providing the long double template specialization.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ modules/flann/include/opencv2/flann/dist.h |    5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+Index: opencv-2.3.1a/modules/flann/include/opencv2/flann/dist.h
+===================================================================
+--- opencv-2.3.1a.orig/modules/flann/include/opencv2/flann/dist.h
++++ opencv-2.3.1a/modules/flann/include/opencv2/flann/dist.h
+@@ -40,6 +40,7 @@
+ #else
+ #include <stdint.h>
+ #endif
++#include <features.h>
+ 
+ #include "defines.h"
+ 
+@@ -59,9 +60,11 @@
+ template<>
+ inline double abs<double>(double x) { return fabs(x); }
+ 
++/* uClibc configured without long double math doesn't provide fabsl */
++#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_LONG_DOUBLE_MATH__))
+ template<>
+ inline long double abs<long double>(long double x) { return fabsl(x); }
+-
++#endif
+ 
+ template<typename T>
+ struct Accumulator { typedef T Type; };
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 202e059..d415e51 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -3,9 +3,8 @@
 # OpenCV (Open Source Computer Vision)
 #
 #############################################################
-OPENCV_SERIES  = 2.3
-OPENCV_VERSION = $(OPENCV_SERIES).0
-OPENCV_SITE    = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/opencvlibrary/opencv-unix/$(OPENCV_SERIES)
+OPENCV_VERSION = 2.3.1a
+OPENCV_SITE    = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/opencvlibrary/opencv-unix/2.3.1
 OPENCV_SOURCE  = OpenCV-$(OPENCV_VERSION).tar.bz2
 OPENCV_INSTALL_STAGING = YES
 
