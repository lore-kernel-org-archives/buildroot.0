From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon,  3 Sep 2018 20:45:09 +0200
Subject: [Buildroot] [PATCH] mediastreamer: fix avcodec functions conflict
Message-ID: <20180903184509.40269-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Autotools miss avcodec function check leading to conflicts between local
functions and avcodec functions.

Add patch to append -ldrm to m4 AC_CHECK_LIB for avcodec_* functions.

Fixes:
http://autobuild.buildroot.net/results/394/3945e06ea0dd1e16013184fbab5b67b3561c87ce/
http://autobuild.buildroot.net/results/576/576c7d71313c45753848462717200b2b8ff5bb0e/
http://autobuild.buildroot.net/results/f33/f339ac6ea30815eeb8ecb144c971f56c06a9f995

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 ...-when-checking-for-avcodec-functions.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/mediastreamer/0002-m4-add-ldrm-when-checking-for-avcodec-functions.patch

diff --git a/package/mediastreamer/0002-m4-add-ldrm-when-checking-for-avcodec-functions.patch b/package/mediastreamer/0002-m4-add-ldrm-when-checking-for-avcodec-functions.patch
new file mode 100644
index 0000000000..2c7f93712f
--- /dev/null
+++ b/package/mediastreamer/0002-m4-add-ldrm-when-checking-for-avcodec-functions.patch
@@ -0,0 +1,46 @@
+From 87969bbb484e7a5afea67a7e6afb706e36953709 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Mon, 3 Sep 2018 20:27:00 +0200
+Subject: [PATCH] m4: add -ldrm when checking for avcodec functions
+
+Autotools miss avcodec function check.
+This is due to linker library list order, -ldrm is appended too early
+respect to -lavcodec. This results in missing drm library functions for
+avcodec functions:
+- drmGetVersion()
+- drmFreeVersion()
+So these functions:
+- avcodec_get_context_defaults3
+- avcodec_open2
+- avcodec_encode_video2
+can't link correctly during check and they seem not to be present.
+Then macros HAVE_FUN_avcodec_* are not defined in mediastreamer-config.h
+So local avcodec functions conflict with real avcodec library functions.
+
+Append -ldrm to m4 AC_CHECK_LIB for avcodec_* functions.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ acinclude.m4 | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 431ad441..e23aa42e 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -166,9 +166,9 @@ AC_DEFUN([MS_CHECK_VIDEO],[
+ 
+ 			LIBS_save=$LIBS
+ 			dnl check if we need to emulate newer functions	
+-			AC_CHECK_LIB(avcodec,avcodec_get_context_defaults3,  [AC_DEFINE([HAVE_FUN_avcodec_get_context_defaults3], [], [Have ffmpeg function])] ,	 , $FFMPEG_LIBS )
+-			AC_CHECK_LIB(avcodec,avcodec_open2, [AC_DEFINE([HAVE_FUN_avcodec_open2], [], [Have ffmpeg function])] , , $FFMPEG_LIBS )
+-			AC_CHECK_LIB(avcodec,avcodec_encode_video2, [AC_DEFINE([HAVE_FUN_avcodec_encode_video2], [], [Have ffmpeg function])] , , $FFMPEG_LIBS )
++			AC_CHECK_LIB(avcodec,avcodec_get_context_defaults3,  [AC_DEFINE([HAVE_FUN_avcodec_get_context_defaults3], [], [Have ffmpeg function])] ,	 , $FFMPEG_LIBS -ldrm)
++			AC_CHECK_LIB(avcodec,avcodec_open2, [AC_DEFINE([HAVE_FUN_avcodec_open2], [], [Have ffmpeg function])] , , $FFMPEG_LIBS -ldrm)
++			AC_CHECK_LIB(avcodec,avcodec_encode_video2, [AC_DEFINE([HAVE_FUN_avcodec_encode_video2], [], [Have ffmpeg function])] , , $FFMPEG_LIBS -ldrm)
+ 			AC_CHECK_LIB(avutil,av_frame_alloc, [AC_DEFINE([HAVE_FUN_av_frame_alloc], [], [Have ffmpeg function])] , , $FFMPEG_LIBS )
+ 			AC_CHECK_LIB(avutil,av_frame_free, [AC_DEFINE([HAVE_FUN_av_frame_free], [], [Have ffmpeg function])] , , $FFMPEG_LIBS )
+ 			AC_CHECK_LIB(avutil,av_frame_unref, [AC_DEFINE([HAVE_FUN_av_frame_unref], [], [Have ffmpeg function])] , , $FFMPEG_LIBS )
+-- 
+2.17.1
+
-- 
2.17.1
