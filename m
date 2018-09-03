From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon,  3 Sep 2018 21:14:42 +0200
Subject: [Buildroot] [PATCH v2] mediastreamer: fix avcodec functions conflict
Message-ID: <20180903191442.57819-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Autotools miss avcodec function check leading to conflicts between local
functions and avcodec functions.

Add patch to append -ldrm to FFMPEG_LIBS which are checked when
AC_CHECK_LIB on avcodec_* functions.

Fixes:
http://autobuild.buildroot.net/results/394/3945e06ea0dd1e16013184fbab5b67b3561c87ce/
http://autobuild.buildroot.net/results/576/576c7d71313c45753848462717200b2b8ff5bb0e/
http://autobuild.buildroot.net/results/f33/f339ac6ea30815eeb8ecb144c971f56c06a9f995

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
Changes V1->V2:
* merge -ldrm into FFMPEG_LIBS instead of repeating it thrice.

 ...-when-checking-for-avcodec-functions.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/mediastreamer/0002-m4-add-ldrm-when-checking-for-avcodec-functions.patch

diff --git a/package/mediastreamer/0002-m4-add-ldrm-when-checking-for-avcodec-functions.patch b/package/mediastreamer/0002-m4-add-ldrm-when-checking-for-avcodec-functions.patch
new file mode 100644
index 0000000000..76ea174720
--- /dev/null
+++ b/package/mediastreamer/0002-m4-add-ldrm-when-checking-for-avcodec-functions.patch
@@ -0,0 +1,42 @@
+From 40d42099f3156a60ba8108c9c8ad1c849daf9ab6 Mon Sep 17 00:00:00 2001
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
+In acinclude.m4 file, append -ldrm to FFMPEG_LIBS if avcodec is found.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ acinclude.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 431ad441..49ec0a98 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -110,7 +110,7 @@ AC_DEFUN([MS_CHECK_VIDEO],[
+ 			if test x$avcodec_found = xno ; then
+ 			   AC_MSG_WARN([Could not find libavcodec (from ffmpeg) headers and library.])
+ 			else
+-			   FFMPEG_LIBS="$FFMPEG_LIBS -lavutil"
++			   FFMPEG_LIBS="$FFMPEG_LIBS -lavutil -ldrm"
+ 			fi
+ 			
+ 			
+-- 
+2.17.1
+
-- 
2.17.1
