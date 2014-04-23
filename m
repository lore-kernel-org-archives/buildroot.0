From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 23 Apr 2014 15:00:03 +0300
Subject: [Buildroot] [PATCH] libgc: fix build under uClibc
Message-ID: <0f149850960676b78e6e35678ab580c1e1aba73c.1398254403.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fenv.h is used in a workaround for a glibc specific bug. However, uClibc lies
by defining __GLIBC__, but does not provide fenv.h in our default uClibc
configurations.

Fixes:
http://autobuild.buildroot.net/results/b2a/b2a1b1e374764855e701ea62fe9f1385ba77ac0d/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...01-Fix-build-on-Linux-x86_64-under-uClibc.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/libgc/libgc-01-Fix-build-on-Linux-x86_64-under-uClibc.patch

diff --git a/package/libgc/libgc-01-Fix-build-on-Linux-x86_64-under-uClibc.patch b/package/libgc/libgc-01-Fix-build-on-Linux-x86_64-under-uClibc.patch
new file mode 100644
index 000000000000..9190a0165031
--- /dev/null
+++ b/package/libgc/libgc-01-Fix-build-on-Linux-x86_64-under-uClibc.patch
@@ -0,0 +1,32 @@
+From 9cbd876ebc6ef8cbe647d4a914d03f527f822424 Mon Sep 17 00:00:00 2001
+Message-Id: <9cbd876ebc6ef8cbe647d4a914d03f527f822424.1398253762.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Wed, 23 Apr 2014 14:42:21 +0300
+Subject: [PATCH] Fix build on Linux/x86_64 under uClibc
+
+* include/private/gcconfig.h (GETCONTEXT_FPU_EXCMASK_BUG): don't define for
+uClibc, as it may not have fenv.h
+
+Patch status: sent upstream
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ include/private/gcconfig.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/private/gcconfig.h b/include/private/gcconfig.h
+index de7998be0f54..f866cc4ed8cc 100644
+--- a/include/private/gcconfig.h
++++ b/include/private/gcconfig.h
+@@ -2235,7 +2235,7 @@
+              extern int etext[];
+ #            define DATASTART ((ptr_t)((((word) (etext)) + 0xfff) & ~0xfff))
+ #       endif
+-#       if defined(__GLIBC__)
++#       if defined(__GLIBC__) && !defined(__UCLIBC__)
+           /* At present, there's a bug in GLibc getcontext() on         */
+           /* Linux/x64 (it clears FPU exception mask).  We define this  */
+           /* macro to workaround it.                                    */
+-- 
+1.9.2
+
-- 
1.9.2
