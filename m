From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 23:49:19 +0100
Subject: [Buildroot] [git commit] pixman: add patch to fix build issue with
	musl
Message-ID: <20160201224708.704107F892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=802123c6248a7a4712b564897cfc5eb94173e7c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pixman fails to build with musl because <float.h> is included in
assembler files, which doesn't work with the <float.h> provided by
musl. This commit fixes that by patching pixman (patch submitted
upstream).

Reported-by: Eial Czerwacki <eial@scalemp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...an-private-include-float.h-only-in-C-code.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/pixman/0002-pixman-private-include-float.h-only-in-C-code.patch b/package/pixman/0002-pixman-private-include-float.h-only-in-C-code.patch
new file mode 100644
index 0000000..455cebb
--- /dev/null
+++ b/package/pixman/0002-pixman-private-include-float.h-only-in-C-code.patch
@@ -0,0 +1,46 @@
+From 2a5b33fe5cb921993573392afac19185e224b49a Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 17 Jan 2016 14:14:28 +0100
+Subject: [PATCH] pixman-private: include <float.h> only in C code
+
+<float.h> is included unconditionally by pixman-private.h, which in
+turn gets included by assembler files. Unfortunately, with certain C
+libraries (like the musl C library), <float.h> cannot be included in
+assembler files:
+
+  CCLD     libpixman-arm-simd.la
+/home/test/buildroot/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/float.h: Assembler messages:
+/home/test/buildroot/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/float.h:8: Error: bad instruction `int __flt_rounds(void)'
+/home/test/buildroot/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/float.h: Assembler messages:
+/home/test/buildroot/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/float.h:8: Error: bad instruction `int __flt_rounds(void)'
+
+It turns out however that <float.h> is not needed by assembly files,
+so we move its inclusion within the #ifndef __ASSEMBLER__ condition,
+which solves the problem.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ pixman/pixman-private.h | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
+index 73108a0..73a5414 100644
+--- a/pixman/pixman-private.h
++++ b/pixman/pixman-private.h
+@@ -1,5 +1,3 @@
+-#include <float.h>
+-
+ #ifndef PIXMAN_PRIVATE_H
+ #define PIXMAN_PRIVATE_H
+ 
+@@ -30,6 +28,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <stddef.h>
++#include <float.h>
+ 
+ #include "pixman-compiler.h"
+ 
+-- 
+2.6.4
+
