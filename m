From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Sep 2014 18:55:51 +0200
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg: Bump version to 2.4
Message-ID: <1411318552-26581-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 2.3 is unmaintained:
http://article.gmane.org/gmane.comp.video.ffmpeg.devel/183038

- removed ffmpeg-0002-bfin.patch, applied upstream
- added vlc-0004-libav.patch from upstream to fix VLC compilation

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg-0002-bfin.patch |   55 ---------------------------------
 package/ffmpeg/ffmpeg.mk              |    3 +-
 package/vlc/vlc-0004-libav.patch      |   22 +++++++++++++
 3 files changed, 23 insertions(+), 57 deletions(-)
 delete mode 100644 package/ffmpeg/ffmpeg-0002-bfin.patch
 create mode 100644 package/vlc/vlc-0004-libav.patch

diff --git a/package/ffmpeg/ffmpeg-0002-bfin.patch b/package/ffmpeg/ffmpeg-0002-bfin.patch
deleted file mode 100644
index c6c84f2..0000000
--- a/package/ffmpeg/ffmpeg-0002-bfin.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Fix compile error on bfin.
-
-After the removal of all Blackfin architecture optimizations in
-http://git.videolan.org/gitweb.cgi/ffmpeg.git/?a=commit;h=b55d3bbeed375f7b74442c4dd274d116a3e3d2e1
-some includes were left behind leading to a compilation error
-
-http://autobuild.buildroot.net/results/ae0/ae056f267e907091d09d2a1546d6f1ae02fa23b9/
-
-CC      libavformat/adtsenc.o
-In file included from ./libavcodec/get_bits.h:35,
-                 from ./libavcodec/ac3_parser.h:27,
-                 from libavformat/ac3dec.c:23:
-./libavcodec/mathops.h:43:29: error: bfin/mathops.h: No such file or directory
-
-Patch sent upstream:
-https://ffmpeg.org/pipermail/ffmpeg-devel/2014-August/160694.html
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr ffmpeg-2.3.1.org/libavcodec/mathops.h ffmpeg-2.3.1/libavcodec/mathops.h
---- ffmpeg-2.3.1.org/libavcodec/mathops.h	2014-07-31 03:18:40.000000000 +0200
-+++ ffmpeg-2.3.1/libavcodec/mathops.h	2014-08-04 20:49:00.340763801 +0200
-@@ -39,8 +39,6 @@
- #   include "arm/mathops.h"
- #elif ARCH_AVR32
- #   include "avr32/mathops.h"
--#elif ARCH_BFIN
--#   include "bfin/mathops.h"
- #elif ARCH_MIPS
- #   include "mips/mathops.h"
- #elif ARCH_PPC
-diff -uNr ffmpeg-2.3.1.org/libavutil/bswap.h ffmpeg-2.3.1/libavutil/bswap.h
---- ffmpeg-2.3.1.org/libavutil/bswap.h	2014-07-31 03:18:47.000000000 +0200
-+++ ffmpeg-2.3.1/libavutil/bswap.h	2014-08-04 20:48:56.028818009 +0200
-@@ -40,8 +40,6 @@
- #   include "arm/bswap.h"
- #elif ARCH_AVR32
- #   include "avr32/bswap.h"
--#elif ARCH_BFIN
--#   include "bfin/bswap.h"
- #elif ARCH_SH4
- #   include "sh4/bswap.h"
- #elif ARCH_X86
-diff -uNr ffmpeg-2.3.1.org/libavutil/timer.h ffmpeg-2.3.1/libavutil/timer.h
---- ffmpeg-2.3.1.org/libavutil/timer.h	2014-07-31 03:18:47.000000000 +0200
-+++ ffmpeg-2.3.1/libavutil/timer.h	2014-08-04 20:48:48.832908474 +0200
-@@ -40,8 +40,6 @@
- 
- #if   ARCH_ARM
- #   include "arm/timer.h"
--#elif ARCH_BFIN
--#   include "bfin/timer.h"
- #elif ARCH_PPC
- #   include "ppc/timer.h"
- #elif ARCH_X86
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 6771309..d6851e1 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.3.3
+FFMPEG_VERSION = 2.4
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
@@ -65,7 +65,6 @@ FFMPEG_CONF_OPT = \
 	--disable-libtheora \
 	--disable-libvo-aacenc \
 	--disable-libvo-amrwbenc \
-	--disable-sram \
 	--disable-symver \
 	--disable-doc
 
diff --git a/package/vlc/vlc-0004-libav.patch b/package/vlc/vlc-0004-libav.patch
new file mode 100644
index 0000000..c4842d7
--- /dev/null
+++ b/package/vlc/vlc-0004-libav.patch
@@ -0,0 +1,22 @@
+VLC works fine with ffmpeg 2.4, ported from upstream
+http://git.videolan.org/?p=vlc/vlc-2.2.git;a=blobdiff;f=configure.ac;h=21a9f89585297ebb98481a29719ef35a20f040db;hp=570da72136f4a5f8142fbab696ece53dd7f84b6a;hb=4ed2079b77b8aeb6d7885cc9828a90290018a7a4;hpb=18fbf7fd17a0f4e9cabcc2e34ac54b210ba08b27
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff --git a/configure.ac b/configure.ac
+index 570da72..21a9f89 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2285,9 +2285,9 @@ AC_ARG_ENABLE(avcodec,
+ [  --enable-avcodec        libavcodec codec (default enabled)])
+ AS_IF([test "${enable_avcodec}" != "no"], [
+   PKG_CHECK_MODULES(AVCODEC,[libavcodec >= 53.34.0 libavutil >= 51.22.0], [
+-    PKG_CHECK_EXISTS([libavcodec < 56],, [
+-      AC_MSG_ERROR([libavcodec versions 56 and later are not supported yet.])
+-    ])
++    dnl PKG_CHECK_EXISTS([libavcodec < 56],, [
++    dnl   AC_MSG_ERROR([libavcodec versions 56 and later are not supported yet.])
++    dnl ])
+     VLC_SAVE_FLAGS
+     CPPFLAGS="${CPPFLAGS} ${AVCODEC_CFLAGS}"
+     CFLAGS="${CFLAGS} ${AVCODEC_CFLAGS}"
-- 
1.7.10.4
