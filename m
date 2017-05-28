From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 May 2017 20:27:04 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/bdwgc: fix uclibc build after
	bump to 7.6.0
Message-ID: <20170528182704.29837-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/bdwgc/0002-Fix-uClibc-build.patch | 42 +++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/bdwgc/0002-Fix-uClibc-build.patch

diff --git a/package/bdwgc/0002-Fix-uClibc-build.patch b/package/bdwgc/0002-Fix-uClibc-build.patch
new file mode 100644
index 000000000..55896eb19
--- /dev/null
+++ b/package/bdwgc/0002-Fix-uClibc-build.patch
@@ -0,0 +1,42 @@
+From 8d3caf00db5d71ec19f03fbf96cecf6f70b4e868 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 28 May 2017 20:21:09 +0200
+Subject: [PATCH] Fix uClibc build
+
+uClibc defines __GLIBC__ but does not contain libc-version.h leading to
+a build error:
+
+./include/private/gcconfig.h:1426:72: fatal error: gnu/libc-version.h: No such file or directory
+
+Patch sent upstream: https://github.com/ivmai/bdwgc/pull/164
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ include/private/gcconfig.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/private/gcconfig.h b/include/private/gcconfig.h
+index d7912e9e..bf17dd63 100644
+--- a/include/private/gcconfig.h
++++ b/include/private/gcconfig.h
+@@ -1442,7 +1442,7 @@
+ #         define GC_PREFETCH_FOR_WRITE(x) \
+             __asm__ __volatile__ ("prefetchw %0" : : "m"(*(char *)(x)))
+ #       endif
+-#       if defined(__GLIBC__)
++#       if defined(__GLIBC__) && !defined(__UCLIBC__)
+           /* Workaround lock elision implementation for some glibc.     */
+ #         define GLIBC_2_19_TSX_BUG
+ #         include <gnu/libc-version.h> /* for gnu_get_libc_version() */
+@@ -2455,7 +2455,7 @@
+           /* FIXME: This seems to be fixed in GLibc v2.14.              */
+ #         define GETCONTEXT_FPU_EXCMASK_BUG
+ #       endif
+-#       if defined(__GLIBC__)
++#       if defined(__GLIBC__) && !defined(__UCLIBC__)
+           /* Workaround lock elision implementation for some glibc.     */
+ #         define GLIBC_2_19_TSX_BUG
+ #         include <gnu/libc-version.h> /* for gnu_get_libc_version() */
+-- 
+2.11.0
+
-- 
2.11.0
