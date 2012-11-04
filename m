From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Nov 2012 10:28:13 +0100
Subject: [Buildroot] [git commit] opus-tools: fix build on i386
Message-ID: <20121104093832.9A53B99B3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9de85f7d8c82316669350a50a0e024cc9ada518d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream patch.  Fixes e.g.
http://autobuild.buildroot.net/results/03cf0ee3c092960c37a6a78f2531b047a317d516/

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../opus-tools-fix-compilation-on-non-win.patch    |   53 ++++++++++++++++++++
 1 files changed, 53 insertions(+), 0 deletions(-)

diff --git a/package/opus-tools/opus-tools-fix-compilation-on-non-win.patch b/package/opus-tools/opus-tools-fix-compilation-on-non-win.patch
new file mode 100644
index 0000000..c8cb6a2
--- /dev/null
+++ b/package/opus-tools/opus-tools-fix-compilation-on-non-win.patch
@@ -0,0 +1,53 @@
+From 7734f55bc535c6d3d0fbb27c55e38f52ba6b7764 Mon Sep 17 00:00:00 2001
+From: Andreas Schlick <schlick@lavabit.com>
+Date: Thu, 13 Sep 2012 19:44:50 +0200
+Subject: [PATCH] Fix compilation on non-Windows x86-32 w/ -msse.
+
+cpusupport.h used __cpuid() from the Windows specific header file intrin.h
+which is not available under gcc. But we can use __get_cpuid() from cpuid.h
+instead.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+
+---
+ src/cpusupport.h |   18 +++++++++++++++++-
+ 1 files changed, 17 insertions(+), 1 deletions(-)
+
+diff --git a/src/cpusupport.h b/src/cpusupport.h
+index 1986d31..5e42337 100644
+--- a/src/cpusupport.h
++++ b/src/cpusupport.h
+@@ -32,7 +32,9 @@
+ # if !defined(__SSE__) || defined(_M_X64) || defined(__amd64__)
+ #  define query_cpu_support() 0
+ #else
+-# include <intrin.h>
++
++#if defined WIN32 || defined _WIN32
++#include <intrin.h>
+ static inline int query_cpu_support(void)
+ {
+    int buffer[4];
+@@ -43,5 +45,19 @@ static inline int query_cpu_support(void)
+ #  endif
+        ;
+ }
++#else
++#include <cpuid.h>
++static inline int query_cpu_support(void)
++{
++   unsigned int eax, ebx, ecx, edx=0;
++   __get_cpuid(1, &eax, &ebx, &ecx, &edx);
++   return ((edx & 1<<25) == 0) /*SSE*/
++#ifdef __SSE2__
++        + ((edx & 1<<26) == 0) /*SSE2*/
++#endif
++       ;
++}
++#endif
++
+ # endif
+ #endif
+-- 
+1.7.2.5
+
