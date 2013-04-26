From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 26 Apr 2013 22:18:36 +0200
Subject: [Buildroot] [git commit] gmp: bump to version 5.1.1
Message-ID: <20130426201847.3AF939B86B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93581de0ec4cfc77ea6006b6283d034f82b45b93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...e-add_ssaaaa-and-sub_ddmmss-actually-work.patch |   46 --------------------
 package/gmp/gmp.mk                                 |    8 +---
 2 files changed, 1 insertions(+), 53 deletions(-)

diff --git a/package/gmp/gmp-aarch64-make-add_ssaaaa-and-sub_ddmmss-actually-work.patch b/package/gmp/gmp-aarch64-make-add_ssaaaa-and-sub_ddmmss-actually-work.patch
deleted file mode 100644
index 1b835a5..0000000
--- a/package/gmp/gmp-aarch64-make-add_ssaaaa-and-sub_ddmmss-actually-work.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-# HG changeset patch
-# User Torbjorn Granlund <tege@gmplib.org>
-# Date 1357413121 -3600
-# Node ID 187b7b1646ee0ace782768bb36117b62c8408bb6
-# Parent  87a24013e9ee2cabf74e32282c18584a2c669009
-(aarch64): Make add_ssaaaa and sub_ddmmss actually work.
-
-Taken upstream from http://gmplib.org:8000/gmp/rev/187b7b1646ee.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-diff -r 87a24013e9ee -r 187b7b1646ee longlong.h
---- a/longlong.h	Fri Jan 04 16:32:01 2013 +0100
-+++ b/longlong.h	Sat Jan 05 20:12:01 2013 +0100
-@@ -530,23 +530,16 @@
- #endif /* __arm__ */
- 
- #if defined (__aarch64__) && W_TYPE_SIZE == 64
-+/* FIXME: Extend the immediate range for the low word by using both
-+   ADDS and SUBS, since they set carry in the same way.  */
- #define add_ssaaaa(sh, sl, ah, al, bh, bl) \
--  __asm__ ("adds\t%1, %4, %5\n\tadc\t%0, %2, %3"			\
-+  __asm__ ("adds\t%1, %x4, %5\n\tadc\t%0, %x2, %x3"			\
- 	   : "=r" (sh), "=&r" (sl)					\
--	   : "r" (ah), "rZ" (bh), "%r" (al), "rI" (bl) __CLOBBER_CC)
-+	   : "rZ" (ah), "rZ" (bh), "%r" (al), "rI" (bl) __CLOBBER_CC)
- #define sub_ddmmss(sh, sl, ah, al, bh, bl) \
--  do {									\
--    if (__builtin_constant_p (bl))					\
--      {									\
--	__asm__ ("subs\t%1, %4, %5\n\tsbc\t%0, %2, %3"			\
--		 : "=r" (sh), "=&r" (sl)				\
--		 : "r" (ah), "r" (bh), "r" (al), "rI" (bl) __CLOBBER_CC); \
--      }									\
--    else /* only bh might be a constant */				\
--      __asm__ ("subs\t%1, %4, %5\n\tsbc\t%0, %2, %3"			\
--	       : "=r" (sh), "=&r" (sl)					\
--	       : "r" (ah), "rZ" (bh), "r" (al), "rI" (bl) __CLOBBER_CC);\
--    } while (0)
-+  __asm__ ("subs\t%1, %x4, %5\n\tsbc\t%0, %x2, %x3"			\
-+	   : "=r,r" (sh), "=&r,&r" (sl)					\
-+	   : "rZ,rZ" (ah), "rZ,rZ" (bh), "r,Z" (al), "rI,r" (bl) __CLOBBER_CC)
- #define umul_ppmm(ph, pl, m0, m1) \
-   do {									\
-     UDItype __m0 = (m0), __m1 = (m1);					\
-
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 24fbb3d..e895a48 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -4,19 +4,13 @@
 #
 #############################################################
 
-GMP_VERSION = 5.1.0
+GMP_VERSION = 5.1.1
 GMP_SITE = ftp://ftp.gmplib.org/pub/gmp-$(GMP_VERSION)
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.bz2
 GMP_INSTALL_STAGING = YES
 GMP_LICENSE = LGPLv3+
 GMP_LICENSE_FILES = COPYING.LIB
-
 GMP_DEPENDENCIES = host-m4
 
-# Bad ARM assembly breaks on pure thumb
-ifeq ($(ARCH),arm)
-GMP_MAKE_OPT += CFLAGS="$(TARGET_CFLAGS) -marm"
-endif
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
