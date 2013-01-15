From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jan 2013 11:45:28 +0100
Subject: [Buildroot] [PATCH 3/3] gmp: fix build on AArch64
In-Reply-To: <1358246728-5141-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358246728-5141-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358246728-5141-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Include an upstream patch to fix the build problem on AArch64.

Fixes:

 http://autobuild.buildroot.org/results/1fb1b3678277e6b0cef220405c54ffb8299c9da1/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...e-add_ssaaaa-and-sub_ddmmss-actually-work.patch |   46 ++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/gmp/gmp-aarch64-make-add_ssaaaa-and-sub_ddmmss-actually-work.patch

diff --git a/package/gmp/gmp-aarch64-make-add_ssaaaa-and-sub_ddmmss-actually-work.patch b/package/gmp/gmp-aarch64-make-add_ssaaaa-and-sub_ddmmss-actually-work.patch
new file mode 100644
index 0000000..1b835a5
--- /dev/null
+++ b/package/gmp/gmp-aarch64-make-add_ssaaaa-and-sub_ddmmss-actually-work.patch
@@ -0,0 +1,46 @@
+# HG changeset patch
+# User Torbjorn Granlund <tege@gmplib.org>
+# Date 1357413121 -3600
+# Node ID 187b7b1646ee0ace782768bb36117b62c8408bb6
+# Parent  87a24013e9ee2cabf74e32282c18584a2c669009
+(aarch64): Make add_ssaaaa and sub_ddmmss actually work.
+
+Taken upstream from http://gmplib.org:8000/gmp/rev/187b7b1646ee.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+diff -r 87a24013e9ee -r 187b7b1646ee longlong.h
+--- a/longlong.h	Fri Jan 04 16:32:01 2013 +0100
++++ b/longlong.h	Sat Jan 05 20:12:01 2013 +0100
+@@ -530,23 +530,16 @@
+ #endif /* __arm__ */
+ 
+ #if defined (__aarch64__) && W_TYPE_SIZE == 64
++/* FIXME: Extend the immediate range for the low word by using both
++   ADDS and SUBS, since they set carry in the same way.  */
+ #define add_ssaaaa(sh, sl, ah, al, bh, bl) \
+-  __asm__ ("adds\t%1, %4, %5\n\tadc\t%0, %2, %3"			\
++  __asm__ ("adds\t%1, %x4, %5\n\tadc\t%0, %x2, %x3"			\
+ 	   : "=r" (sh), "=&r" (sl)					\
+-	   : "r" (ah), "rZ" (bh), "%r" (al), "rI" (bl) __CLOBBER_CC)
++	   : "rZ" (ah), "rZ" (bh), "%r" (al), "rI" (bl) __CLOBBER_CC)
+ #define sub_ddmmss(sh, sl, ah, al, bh, bl) \
+-  do {									\
+-    if (__builtin_constant_p (bl))					\
+-      {									\
+-	__asm__ ("subs\t%1, %4, %5\n\tsbc\t%0, %2, %3"			\
+-		 : "=r" (sh), "=&r" (sl)				\
+-		 : "r" (ah), "r" (bh), "r" (al), "rI" (bl) __CLOBBER_CC); \
+-      }									\
+-    else /* only bh might be a constant */				\
+-      __asm__ ("subs\t%1, %4, %5\n\tsbc\t%0, %2, %3"			\
+-	       : "=r" (sh), "=&r" (sl)					\
+-	       : "r" (ah), "rZ" (bh), "r" (al), "rI" (bl) __CLOBBER_CC);\
+-    } while (0)
++  __asm__ ("subs\t%1, %x4, %5\n\tsbc\t%0, %x2, %x3"			\
++	   : "=r,r" (sh), "=&r,&r" (sl)					\
++	   : "rZ,rZ" (ah), "rZ,rZ" (bh), "r,Z" (al), "rI,r" (bl) __CLOBBER_CC)
+ #define umul_ppmm(ph, pl, m0, m1) \
+   do {									\
+     UDItype __m0 = (m0), __m1 = (m1);					\
+
-- 
1.7.9.5
