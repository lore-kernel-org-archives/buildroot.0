From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 15:00:58 +0200
Subject: [Buildroot] [git commit] package/vlc: add opencv support
Message-ID: <20150705130104.7BB228179A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dbe9c5e2049bb25fa20d0daf6b8f6fb71f57b1bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change adds 2 patches (backported from upstream) to vlc fixing the
build against opencv2 APIs.
This allows to select the minimal set of opencv modules when opencv
support is enabled.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...opencv_wrapper-use-opencv2-style-includes.patch |   36 ++++++++++++++++++++
 ...cv_example-add-missing-include-statements.patch |   29 ++++++++++++++++
 package/vlc/Config.in                              |    2 +
 package/vlc/vlc.mk                                 |    8 ++++-
 4 files changed, 74 insertions(+), 1 deletions(-)

diff --git a/package/vlc/0008-opencv_wrapper-use-opencv2-style-includes.patch b/package/vlc/0008-opencv_wrapper-use-opencv2-style-includes.patch
new file mode 100644
index 0000000..0ce0206
--- /dev/null
+++ b/package/vlc/0008-opencv_wrapper-use-opencv2-style-includes.patch
@@ -0,0 +1,36 @@
+Backport from: https://git.videolan.org/?p=vlc.git;a=commit;h=cc236e4652255902f2c2cee3b18f83367f35a8c7
+
+From cc236e4652255902f2c2cee3b18f83367f35a8c7 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 24 May 2015 14:30:09 +0200
+Subject: [PATCH 8/9] opencv_wrapper: use opencv2-style includes
+
+If old opencv1-style legacy include directory is available, this change
+becomes purely cosmetic (maybe will compile a bit faster).
+It becomes an FTBFS fix when opencv1-style include directory is missing
+(i.e. from opencv-3.0).
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+Signed-off-by: Jean-Baptiste Kempf <jb@videolan.org>
+---
+ modules/video_filter/opencv_wrapper.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/modules/video_filter/opencv_wrapper.c b/modules/video_filter/opencv_wrapper.c
+index e36e1a5..5d74241 100644
+--- a/modules/video_filter/opencv_wrapper.c
++++ b/modules/video_filter/opencv_wrapper.c
+@@ -39,8 +39,8 @@
+ #include <vlc_image.h>
+ #include "filter_picture.h"
+ 
+-#include <cxcore.h>
+-#include <cv.h>
++#include <opencv2/core/core_c.h>
++#include <opencv2/core/types_c.h>
+ 
+ /*****************************************************************************
+  * Local prototypes
+-- 
+2.4.2
+
diff --git a/package/vlc/0009-opencv_example-add-missing-include-statements.patch b/package/vlc/0009-opencv_example-add-missing-include-statements.patch
new file mode 100644
index 0000000..7b7f727
--- /dev/null
+++ b/package/vlc/0009-opencv_example-add-missing-include-statements.patch
@@ -0,0 +1,29 @@
+Backport from: https://git.videolan.org/?p=vlc.git;a=commit;h=b82416d7000a993b33e903095a590fe32212a85e
+
+From b82416d7000a993b33e903095a590fe32212a85e Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 24 May 2015 14:30:10 +0200
+Subject: [PATCH 9/9] opencv_example: add missing #include statements
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+Signed-off-by: Jean-Baptiste Kempf <jb@videolan.org>
+---
+ modules/video_filter/opencv_example.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/modules/video_filter/opencv_example.cpp b/modules/video_filter/opencv_example.cpp
+index ae3af05..998f286 100644
+--- a/modules/video_filter/opencv_example.cpp
++++ b/modules/video_filter/opencv_example.cpp
+@@ -41,6 +41,8 @@
+ 
+ #include <opencv2/core/core_c.h>
+ #include <opencv2/core/core.hpp>
++#include <opencv2/imgproc/imgproc_c.h>
++#include <opencv2/imgproc/imgproc.hpp>
+ #include <opencv2/objdetect/objdetect.hpp>
+ 
+ /*****************************************************************************
+-- 
+2.4.2
+
diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index b030a56..471f4a7 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -11,6 +11,8 @@ config BR2_PACKAGE_VLC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC if BR2_PACKAGE_OPENCV
+	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT if BR2_PACKAGE_OPENCV
 	help
 	  VLC is a free and open source cross-platform multimedia player
 	  and framework that plays most multimedia files as well as DVD,
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 4ef69aa..a553648 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -44,7 +44,6 @@ VLC_CONF_OPTS += \
 	--disable-projectm \
 	--disable-vsxu \
 	--disable-mtp \
-	--disable-opencv \
 	--disable-mmal-codec \
 	--disable-mmal-vout \
 	--disable-dvdnav \
@@ -148,6 +147,13 @@ else
 VLC_CONF_OPTS += --disable-gles2
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV),y)
+VLC_CONF_OPTS += --enable-opencv
+VLC_DEPENDENCIES += opencv
+else
+VLC_CONF_OPTS += --disable-opencv
+endif
+
 ifeq ($(BR2_PACKAGE_OPUS),y)
 VLC_CONF_OPTS += --enable-opus
 VLC_DEPENDENCIES += libvorbis opus
