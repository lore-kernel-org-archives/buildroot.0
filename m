From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Dec 2012 00:07:56 +0100
Subject: [Buildroot] [git commit] opus-tools: bump version
Message-ID: <20121214230749.760B99A1FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee094dd16f78e27d1c53094b3267fd0d3e6d54d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../opus-tools-fix-compilation-on-non-win.patch    |   53 --------------------
 package/opus-tools/opus-tools-largefile.patch      |   37 ++++++++++++++
 package/opus-tools/opus-tools.mk                   |    2 +-
 3 files changed, 38 insertions(+), 54 deletions(-)

diff --git a/package/opus-tools/opus-tools-fix-compilation-on-non-win.patch b/package/opus-tools/opus-tools-fix-compilation-on-non-win.patch
deleted file mode 100644
index c8cb6a2..0000000
--- a/package/opus-tools/opus-tools-fix-compilation-on-non-win.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 7734f55bc535c6d3d0fbb27c55e38f52ba6b7764 Mon Sep 17 00:00:00 2001
-From: Andreas Schlick <schlick@lavabit.com>
-Date: Thu, 13 Sep 2012 19:44:50 +0200
-Subject: [PATCH] Fix compilation on non-Windows x86-32 w/ -msse.
-
-cpusupport.h used __cpuid() from the Windows specific header file intrin.h
-which is not available under gcc. But we can use __get_cpuid() from cpuid.h
-instead.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
-
----
- src/cpusupport.h |   18 +++++++++++++++++-
- 1 files changed, 17 insertions(+), 1 deletions(-)
-
-diff --git a/src/cpusupport.h b/src/cpusupport.h
-index 1986d31..5e42337 100644
---- a/src/cpusupport.h
-+++ b/src/cpusupport.h
-@@ -32,7 +32,9 @@
- # if !defined(__SSE__) || defined(_M_X64) || defined(__amd64__)
- #  define query_cpu_support() 0
- #else
--# include <intrin.h>
-+
-+#if defined WIN32 || defined _WIN32
-+#include <intrin.h>
- static inline int query_cpu_support(void)
- {
-    int buffer[4];
-@@ -43,5 +45,19 @@ static inline int query_cpu_support(void)
- #  endif
-        ;
- }
-+#else
-+#include <cpuid.h>
-+static inline int query_cpu_support(void)
-+{
-+   unsigned int eax, ebx, ecx, edx=0;
-+   __get_cpuid(1, &eax, &ebx, &ecx, &edx);
-+   return ((edx & 1<<25) == 0) /*SSE*/
-+#ifdef __SSE2__
-+        + ((edx & 1<<26) == 0) /*SSE2*/
-+#endif
-+       ;
-+}
-+#endif
-+
- # endif
- #endif
--- 
-1.7.2.5
-
diff --git a/package/opus-tools/opus-tools-largefile.patch b/package/opus-tools/opus-tools-largefile.patch
new file mode 100644
index 0000000..a10fcbc
--- /dev/null
+++ b/package/opus-tools/opus-tools-largefile.patch
@@ -0,0 +1,37 @@
+From f1d9376b383f4ee7ec2d7c5a1728d38cdb692df6 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Sat, 15 Dec 2012 00:05:41 +0100
+Subject: [PATCH] audio-in.c: Don't force largefile support
+
+Buildroot ensures the correct defines are enabled depending on toolchain
+configuration, so don't hard code largefile support here.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/audio-in.c |   10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/src/audio-in.c b/src/audio-in.c
+index 9bf4f6f..e404629 100644
+--- a/src/audio-in.c
++++ b/src/audio-in.c
+@@ -32,16 +32,6 @@
+ # include <config.h>
+ #endif
+ 
+-#if !defined(_LARGEFILE_SOURCE)
+-# define _LARGEFILE_SOURCE
+-#endif
+-#if !defined(_LARGEFILE64_SOURCE)
+-# define _LARGEFILE64_SOURCE
+-#endif
+-#if !defined(_FILE_OFFSET_BITS)
+-# define _FILE_OFFSET_BITS 64
+-#endif
+-
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <string.h>
+-- 
+1.7.10.4
+
diff --git a/package/opus-tools/opus-tools.mk b/package/opus-tools/opus-tools.mk
index 2b649dc..7ee708f 100644
--- a/package/opus-tools/opus-tools.mk
+++ b/package/opus-tools/opus-tools.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPUS_TOOLS_VERSION = 0.1.5
+OPUS_TOOLS_VERSION = 0.1.6
 OPUS_TOOLS_SITE = http://downloads.xiph.org/releases/opus
 OPUS_TOOLS_CONF_OPT = --disable-oggtest --disable-opustest
 OPUS_TOOLS_DEPENDENCIES = opus libogg host-pkgconf
