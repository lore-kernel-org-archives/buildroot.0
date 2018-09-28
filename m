From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Sep 2018 14:41:09 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] mediastreamer: fix
 avcodec functions conflict
Message-ID: <20180928124038.B85EA7F8D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c45e9c0b856e3fc1c4b82df673f4e8baf631ab1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Autotools miss avcodec function check when linking statically, leading to
conflicts between local functions and avcodec functions.

Add patch to swap $FFMPEG_LIBS and -lavutil which are checked when
AC_CHECK_LIB on avcodec_* functions. $FFMPEG_LIBS contain -ldrm that must
be listed after -lavutil.

Fixes:
http://autobuild.buildroot.net/results/394/3945e06ea0dd1e16013184fbab5b67b3561c87ce/
http://autobuild.buildroot.net/results/576/576c7d71313c45753848462717200b2b8ff5bb0e/
http://autobuild.buildroot.net/results/f33/f339ac6ea30815eeb8ecb144c971f56c06a9f995

[Peter: adjust commit message to clarify that this is for static linking]
Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit daf7dd87f4d93923df5e757fd43b3ad214a4a2ae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ocal-ffmpeg-and-avcodec-function-conflict.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/mediastreamer/0002-m4-fix-local-ffmpeg-and-avcodec-function-conflict.patch b/package/mediastreamer/0002-m4-fix-local-ffmpeg-and-avcodec-function-conflict.patch
new file mode 100644
index 0000000000..cdaa0fab24
--- /dev/null
+++ b/package/mediastreamer/0002-m4-fix-local-ffmpeg-and-avcodec-function-conflict.patch
@@ -0,0 +1,42 @@
+From d12e74a559602b3dff9a6bf38fcbb139535c9c9c Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Mon, 3 Sep 2018 20:27:00 +0200
+Subject: [PATCH] m4: fix local ffmpeg and avcodec function conflict
+
+Autotools miss avcodec function check.
+This is due to linker library list order, -ldrm is appended too early
+respect to -lavutil. This results in missing drm library functions for
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
+In acinclude.m4 file, swap $FFMPEG_LIBS and -lavutil if avcodec is found.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ acinclude.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 6c31ed82..89ff6643 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -110,7 +110,7 @@ AC_DEFUN([MS_CHECK_VIDEO],[
+ 			if test x$avcodec_found = xno ; then
+ 			   AC_MSG_WARN([Could not find libavcodec (from ffmpeg) headers and library.])
+ 			else
+-			   FFMPEG_LIBS="$FFMPEG_LIBS -lavutil"
++			   FFMPEG_LIBS="-lavutil $FFMPEG_LIBS"
+ 			fi
+ 			
+ 			
+-- 
+2.17.1
+
