From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  9 May 2021 15:34:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/putty: fix build on uclibc
Message-ID: <20210509133412.1116330-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build failure on uclibc raised since bump to version 0.75 in commit
d562009f7b9701cb20bc4b1d389d19f9a647cc3b

Fixes:
 - http://autobuild.buildroot.org/results/726f7c5ce13e78ed91e827b872e9d7ccfa13f298

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...1-unix-uxutils.h-fix-build-on-uclibc.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/putty/0001-unix-uxutils.h-fix-build-on-uclibc.patch

diff --git a/package/putty/0001-unix-uxutils.h-fix-build-on-uclibc.patch b/package/putty/0001-unix-uxutils.h-fix-build-on-uclibc.patch
new file mode 100644
index 0000000000..78cef8b908
--- /dev/null
+++ b/package/putty/0001-unix-uxutils.h-fix-build-on-uclibc.patch
@@ -0,0 +1,41 @@
+From 3f30f3a7e3f07f5ca3cef0f405b02e22a018c6e4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 9 May 2021 15:22:29 +0200
+Subject: [PATCH] unix/uxutils.h: fix build on uclibc
+
+Build on uclibc is broken since version 0.75 and commit
+65383082bf0c49cec63f4b36001a40bd9b13edf6 because AT_HWCAP2 is used
+even if <sys/auxv.h> is not available:
+
+unix/uxutils.c: In function 'platform_aes_hw_available':
+unix/uxutils.c:13:22: error: 'AT_HWCAP2' undeclared (first use in this function)
+   13 |     return getauxval(AT_HWCAP2) & HWCAP2_AES;
+      |                      ^~~~~~~~~
+
+To fix this build failure, include <elf.h>
+
+Fixes:
+ - http://autobuild.buildroot.org/results/726f7c5ce13e78ed91e827b872e9d7ccfa13f298
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to Simon Tatham <anakin@pobox.com>]
+---
+ unix/uxutils.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/unix/uxutils.h b/unix/uxutils.h
+index c9acff53..b80bf972 100644
+--- a/unix/uxutils.h
++++ b/unix/uxutils.h
+@@ -18,6 +18,8 @@
+ 
+ #if defined __arm__ || defined __aarch64__
+ 
++#include <elf.h>
++
+ #ifdef HAVE_SYS_TYPES_H
+ #include <sys/types.h>
+ #endif
+-- 
+2.30.2
+
-- 
2.30.2
