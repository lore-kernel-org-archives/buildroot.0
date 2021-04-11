From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Apr 2021 19:55:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Fix uClibc build for mips
Message-ID: <20210411175508.1458401-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/079/079df777211933b92ac5a67fc175839c8188850f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...-libavutil-Fix-uClibc-build-for-mips.patch | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 package/ffmpeg/0003-libavutil-Fix-uClibc-build-for-mips.patch

diff --git a/package/ffmpeg/0003-libavutil-Fix-uClibc-build-for-mips.patch b/package/ffmpeg/0003-libavutil-Fix-uClibc-build-for-mips.patch
new file mode 100644
index 0000000000..36fa2b237a
--- /dev/null
+++ b/package/ffmpeg/0003-libavutil-Fix-uClibc-build-for-mips.patch
@@ -0,0 +1,64 @@
+From 0c052065df6c8be04a35d26566d2d927c680ec60 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 11 Apr 2021 19:43:35 +0200
+Subject: [PATCH] libavutil: Fix uClibc build for mips
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+uClibc does not provide sys/auxv.h:
+
+libavutil/mips/cpu.c:26:10: fatal error: sys/auxv.h: No such file or directory
+
+and not getauxval:
+
+libavutil/mips/cpu.c: In function ?cpucfg_available?:
+libavutil/mips/cpu.c:37:12: error: implicit declaration of function ?getauxval? [-Werror=implicit-function-declaration]
+     return getauxval(AT_HWCAP) & HWCAP_LOONGSON_CPUCFG;
+            ^~~~~~~~~
+libavutil/mips/cpu.c:37:22: error: ?AT_HWCAP? undeclared (first use in this function)
+     return getauxval(AT_HWCAP) & HWCAP_LOONGSON_CPUCFG;
+
+Patch sent upstream:
+http://ffmpeg.org/pipermail/ffmpeg-devel/2021-April/278968.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ libavutil/mips/cpu.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/libavutil/mips/cpu.c b/libavutil/mips/cpu.c
+index 59619d54de..c5da77b22b 100644
+--- a/libavutil/mips/cpu.c
++++ b/libavutil/mips/cpu.c
+@@ -19,7 +19,8 @@
+ #include "libavutil/cpu.h"
+ #include "libavutil/cpu_internal.h"
+ #include "config.h"
+-#if defined __linux__ || defined __ANDROID__
++#include <features.h>
++#if (defined __linux__ || defined __ANDROID__) && !defined(__UCLIBC__)
+ #include <stdint.h>
+ #include <stdio.h>
+ #include <string.h>
+@@ -28,7 +29,7 @@
+ #include "libavutil/avstring.h"
+ #endif
+ 
+-#if defined __linux__ || defined __ANDROID__
++#if (defined __linux__ || defined __ANDROID__) && !defined(__UCLIBC__)
+ 
+ #define HWCAP_LOONGSON_CPUCFG (1 << 14)
+ 
+@@ -105,7 +106,7 @@ static int cpu_flags_cpuinfo(void)
+ 
+ int ff_get_cpu_flags_mips(void)
+ {
+-#if defined __linux__ || defined __ANDROID__
++#if (defined __linux__ || defined __ANDROID__) && !defined(__UCLIBC__)
+     if (cpucfg_available())
+         return cpu_flags_cpucfg();
+     else
+-- 
+2.29.2
+
-- 
2.29.2
