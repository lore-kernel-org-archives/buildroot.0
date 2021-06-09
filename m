From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  9 Jun 2021 21:01:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Fix build for mips,
 2nd attempt
Message-ID: <20210609190141.996573-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/da0/da03909291e97c525eb1f53dfc743a1897f59d6e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/0003-libavutil-Fix-mips-build.patch | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
index 7af01463e8..8b81e66981 100644
--- a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
+++ b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
@@ -8,7 +8,7 @@ Check for sys/auxv.h because not all toolchains contain this header.
 Fixes https://trac.ffmpeg.org/ticket/9138
 
 Patch sent upstream:
-http://ffmpeg.org/pipermail/ffmpeg-devel/2021-June/281037.html
+http://ffmpeg.org/pipermail/ffmpeg-devel/2021-June/281272.html
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
@@ -17,7 +17,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  2 files changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/configure b/configure
-index 82367fd30d..b0154cb8b2 100755
+index 6bfd98b384..773a7d516c 100755
 --- a/configure
 +++ b/configure
 @@ -2161,6 +2161,7 @@ HEADERS_LIST="
@@ -28,7 +28,7 @@ index 82367fd30d..b0154cb8b2 100755
      sys_param_h
      sys_resource_h
      sys_select_h
-@@ -6210,6 +6211,7 @@ check_func_headers VideoToolbox/VTCompressionSession.h VTCompressionSessionPrepa
+@@ -6218,6 +6219,7 @@ check_func_headers VideoToolbox/VTCompressionSession.h VTCompressionSessionPrepa
  check_headers windows.h
  check_headers X11/extensions/XvMClib.h
  check_headers asm/types.h
@@ -37,7 +37,7 @@ index 82367fd30d..b0154cb8b2 100755
  # it seems there are versions of clang in some distros that try to use the
  # gcc headers, which explodes for stdatomic
 diff --git a/libavutil/mips/cpu.c b/libavutil/mips/cpu.c
-index 59619d54de..4738104cdd 100644
+index 59619d54de..19196de50b 100644
 --- a/libavutil/mips/cpu.c
 +++ b/libavutil/mips/cpu.c
 @@ -19,7 +19,7 @@
@@ -45,7 +45,7 @@ index 59619d54de..4738104cdd 100644
  #include "libavutil/cpu_internal.h"
  #include "config.h"
 -#if defined __linux__ || defined __ANDROID__
-+#if (defined __linux__ || defined __ANDROID__) && defined(HAVE_SYS_AUXV_H)
++#if (defined __linux__ || defined __ANDROID__) && HAVE_SYS_AUXV_H
  #include <stdint.h>
  #include <stdio.h>
  #include <string.h>
@@ -54,7 +54,7 @@ index 59619d54de..4738104cdd 100644
  #endif
  
 -#if defined __linux__ || defined __ANDROID__
-+#if (defined __linux__ || defined __ANDROID__) && defined(HAVE_SYS_AUXV_H)
++#if (defined __linux__ || defined __ANDROID__) && HAVE_SYS_AUXV_H
  
  #define HWCAP_LOONGSON_CPUCFG (1 << 14)
  
@@ -63,7 +63,7 @@ index 59619d54de..4738104cdd 100644
  int ff_get_cpu_flags_mips(void)
  {
 -#if defined __linux__ || defined __ANDROID__
-+#if (defined __linux__ || defined __ANDROID__) && defined(HAVE_SYS_AUXV_H)
++#if (defined __linux__ || defined __ANDROID__) && HAVE_SYS_AUXV_H
      if (cpucfg_available())
          return cpu_flags_cpucfg();
      else
-- 
2.29.2
