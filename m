From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  8 Jun 2017 07:51:27 +0300
Subject: [Buildroot] [PATCH] gauche: fix build with uClibc
Message-ID: <d8e42091b4780d235d30a2cc4549278291300af3.1496897487.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As gauche bundles bdwgc, it hit the same uclibc build issue fixed in commit
9b04ae71c5e4c (package/bdwgc: fix uclibc build after bump to 7.6.0). Apply the
upstream bdwgc fix for that.

Fixes:
http://autobuild.buildroot.net/results/ebc/ebc70579a94d260fecf05fe4150eebcc59d3b5fb/
http://autobuild.buildroot.net/results/e1b/e1b2ad89787c345cf8817f6d8436ff52a151c5a6/
http://autobuild.buildroot.net/results/f39/f396b996a59db79f7a0926aec49c488c3a2797a0/

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...-libc-version.h-build-error-uClibc-x86-_6.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/gauche/0003-Fix-missing-libc-version.h-build-error-uClibc-x86-_6.patch

diff --git a/package/gauche/0003-Fix-missing-libc-version.h-build-error-uClibc-x86-_6.patch b/package/gauche/0003-Fix-missing-libc-version.h-build-error-uClibc-x86-_6.patch
new file mode 100644
index 000000000000..61a3f1aadbc6
--- /dev/null
+++ b/package/gauche/0003-Fix-missing-libc-version.h-build-error-uClibc-x86-_6.patch
@@ -0,0 +1,46 @@
+From 4b9692c93d658015087f19016b2bd0c9dfbccee6 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 28 May 2017 20:21:09 +0200
+Subject: [PATCH] Fix 'missing libc-version.h' build error (uClibc/x86[_64])
+ (fix commit 3d34255)
+
+uClibc defines __GLIBC__ but does not contain libc-version.h file.
+
+* include/private/gcconfig.h [(I386 || X86_64) && LINUX && __GLIBC__]
+(GLIBC_2_19_TSX_BUG): Do not define (and do not include
+gnu/libc-version.h) if __UCLIBC__.
+
+[baruch: cherry pick from upstream bdwgc commit 047230b71d42140]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: patch applied to bdwgc; will propagate to gauche on the next
+synch of its bundled bdwgc
+
+ gc/include/private/gcconfig.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gc/include/private/gcconfig.h b/gc/include/private/gcconfig.h
+index 80920e5af570..f063664c3f52 100644
+--- a/gc/include/private/gcconfig.h
++++ b/gc/include/private/gcconfig.h
+@@ -1420,7 +1420,7 @@
+ #         define GC_PREFETCH_FOR_WRITE(x) \
+             __asm__ __volatile__ ("prefetchw %0" : : "m"(*(char *)(x)))
+ #       endif
+-#       if defined(__GLIBC__)
++#       if defined(__GLIBC__) && !defined(__UCLIBC__)
+           /* Workaround lock elision implementation for some glibc.     */
+ #         define GLIBC_2_19_TSX_BUG
+ #         include <gnu/libc-version.h> /* for gnu_get_libc_version() */
+@@ -2431,7 +2431,7 @@
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
