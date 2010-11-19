From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Nov 2010 10:31:21 +0100
Subject: [Buildroot] [git commit master 1/1] libmad: fix MIPS gcc 4.4+ "h"
	asm constraint removal
Message-ID: <20101119093155.E2B7B8D235@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3c13093de423f92c4c523a7a42df3d04612ff4b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    2 +-
 .../libmad-0.15.1b-mips-h-constraint-removal.patch |   72 ++++++++++++++++++++
 2 files changed, 73 insertions(+), 1 deletions(-)
 create mode 100644 package/multimedia/libmad/libmad-0.15.1b-mips-h-constraint-removal.patch

diff --git a/CHANGES b/CHANGES
index 2eb82ba..4c43636 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: bash, libglib2, midori,
+	Updated/fixed packages: bash, libglib2, libmad, midori,
 	module-init-tools, mtd-utils, openssh, qt, sqlite, webkit
 
 	Issues resolved (http://bugs.uclibc.org):
diff --git a/package/multimedia/libmad/libmad-0.15.1b-mips-h-constraint-removal.patch b/package/multimedia/libmad/libmad-0.15.1b-mips-h-constraint-removal.patch
new file mode 100644
index 0000000..0958587
--- /dev/null
+++ b/package/multimedia/libmad/libmad-0.15.1b-mips-h-constraint-removal.patch
@@ -0,0 +1,72 @@
+http://patchwork.openembedded.org/patch/921/
+
+diff -ur libmad-0.15.1b-orig/fixed.h libmad-0.15.1b/fixed.h
+--- libmad-0.15.1b-orig/fixed.h	2004-02-17 12:32:03.000000000 +1030
++++ libmad-0.15.1b/fixed.h	2009-08-05 10:46:30.000000000 +0930
+@@ -299,6 +299,23 @@
+ 
+ # elif defined(FPM_MIPS)
+ 
++/* Test for gcc >= maj.min, as per __GNUC_PREREQ in glibc */
++#if defined (__GNUC__) && defined (__GNUC_MINOR__)
++#define __GNUC_PREREQ(maj, min) \
++	((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))
++#else
++#define __GNUC_PREREQ(maj, min)  0
++#endif
++
++#if __GNUC_PREREQ(4,4)
++  typedef unsigned int u64_di_t __attribute__ ((mode (DI)));
++# define MAD_F_MLX(hi, lo, x, y) \
++   do { \
++      u64_di_t __ll = (u64_di_t) (x) * (y); \
++      hi = __ll >> 32; \
++      lo = __ll; \
++   } while (0) 
++#else
+ /*
+  * This MIPS version is fast and accurate; the disposition of the least
+  * significant bit depends on OPT_ACCURACY via mad_f_scale64().
+@@ -328,6 +345,7 @@
+ 	 : "%r" ((x) >> 12), "r" ((y) >> 16))
+ #  define MAD_F_MLZ(hi, lo)  ((mad_fixed_t) (lo))
+ # endif
++#endif /* __GNU_PREREQ(4,4) */
+ 
+ # if defined(OPT_SPEED)
+ #  define mad_f_scale64(hi, lo)  \
+diff -ur libmad-0.15.1b-orig/mad.h libmad-0.15.1b/mad.h
+--- libmad-0.15.1b-orig/mad.h	2004-02-17 13:25:44.000000000 +1030
++++ libmad-0.15.1b/mad.h	2009-08-05 10:42:40.000000000 +0930
+@@ -344,6 +344,23 @@
+ 
+ # elif defined(FPM_MIPS)
+ 
++/* Test for gcc >= maj.min, as per __GNUC_PREREQ in glibc */
++#if defined (__GNUC__) && defined (__GNUC_MINOR__)
++#define __GNUC_PREREQ(maj, min) \
++	((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))
++#else
++#define __GNUC_PREREQ(maj, min)  0
++#endif
++
++#if __GNUC_PREREQ(4,4)
++  typedef unsigned int u64_di_t __attribute__ ((mode (DI)));
++# define MAD_F_MLX(hi, lo, x, y) \
++   do { \
++      u64_di_t __ll = (u64_di_t) (x) * (y); \
++      hi = __ll >> 32; \
++      lo = __ll; \
++   } while (0) 
++#else
+ /*
+  * This MIPS version is fast and accurate; the disposition of the least
+  * significant bit depends on OPT_ACCURACY via mad_f_scale64().
+@@ -373,6 +390,7 @@
+ 	 : "%r" ((x) >> 12), "r" ((y) >> 16))
+ #  define MAD_F_MLZ(hi, lo)  ((mad_fixed_t) (lo))
+ # endif
++#endif /* __GNU_PREREQ(4,4) */
+ 
+ # if defined(OPT_SPEED)
+ #  define mad_f_scale64(hi, lo)  \
-- 
1.7.2.2
