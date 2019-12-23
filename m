From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 21:12:08 +0100
Subject: [Buildroot] [git commit] package/libffi: fix build failure with
 powerpc7
Message-ID: <20191223201225.232D58E073@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78926f610b1411b03464152472fd430012deb9ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/5c9dd8fb3b6a128882b6250f197c80232d8a3b53

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...powerpc.h-fix-build-failure-with-powerpc7.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/libffi/0004-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch b/package/libffi/0004-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch
new file mode 100644
index 0000000000..7ee1f1029e
--- /dev/null
+++ b/package/libffi/0004-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch
@@ -0,0 +1,51 @@
+From f9d8f11d60cdc656a801e0d8116101beb22e117b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 24 Nov 2019 09:52:01 +0100
+Subject: [PATCH] ffi_powerpc.h: fix build failure with powerpc7
+
+Sicne commit 73dd43afc8a447ba98ea02e9aad4c6898dc77fb0, build on powerpc7
+fails on:
+
+In file included from ../src/powerpc/ffi.c:33:0:
+../src/powerpc/ffi_powerpc.h:61:9: error: '_Float128' is not supported on this target
+ typedef _Float128 float128;
+         ^~~~~~~~~
+
+Fix this build failure by checking for __HAVE_FLOAT128 before using
+_Float128, as _Float128 is enabled only on specific conditions, see
+output/host/powerpc64-buildroot-linux-gnu/sysroot/usr/include/bits/floatn.h:
+
+ /* Defined to 1 if the current compiler invocation provides a
+    floating-point type with the IEEE 754 binary128 format, and this glibc
+    includes corresponding *f128 interfaces for it.  */
+ #if defined _ARCH_PWR8 && defined __LITTLE_ENDIAN__ && (_CALL_ELF == 2) \
+     && defined __FLOAT128__ && !defined __NO_LONG_DOUBLE_MATH
+ # define __HAVE_FLOAT128 1
+ #else
+ # define __HAVE_FLOAT128 0
+ #endif
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5c9dd8fb3b6a128882b6250f197c80232d8a3b53
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/powerpc/ffi_powerpc.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/powerpc/ffi_powerpc.h b/src/powerpc/ffi_powerpc.h
+index 5ee2a70..a5a786b 100644
+--- a/src/powerpc/ffi_powerpc.h
++++ b/src/powerpc/ffi_powerpc.h
+@@ -57,7 +57,7 @@ typedef union
+   double d;
+ } ffi_dblfl;
+ 
+-#if defined(__FLOAT128_TYPE__)
++#if defined(__FLOAT128_TYPE__) && defined(__HAVE_FLOAT128)
+ typedef _Float128 float128;
+ #elif defined(__FLOAT128__)
+ typedef __float128 float128;
+-- 
+2.24.0
+
