From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 Mar 2012 18:48:04 -0300
Subject: [Buildroot] [PATCH 15/20] mpfr: bump to version 3.1.0-p6
In-Reply-To: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
References: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1331502489-5036-15-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpfr/mpfr-3.0.1_p4.patch |  367 ---------------------
 package/mpfr/mpfr-3.1.0-p6.patch |  673 ++++++++++++++++++++++++++++++++++++++
 package/mpfr/mpfr.mk             |    2 +-
 3 files changed, 674 insertions(+), 368 deletions(-)
 delete mode 100644 package/mpfr/mpfr-3.0.1_p4.patch
 create mode 100644 package/mpfr/mpfr-3.1.0-p6.patch

diff --git a/package/mpfr/mpfr-3.0.1_p4.patch b/package/mpfr/mpfr-3.0.1_p4.patch
deleted file mode 100644
index 9604635..0000000
--- a/package/mpfr/mpfr-3.0.1_p4.patch
+++ /dev/null
@@ -1,367 +0,0 @@
-diff -Naurd mpfr-3.0.1-a/PATCHES mpfr-3.0.1-b/PATCHES
---- mpfr-3.0.1-a/PATCHES	2011-04-12 10:50:02.000000000 +0000
-+++ mpfr-3.0.1-b/PATCHES	2011-04-12 10:50:02.000000000 +0000
-@@ -0,0 +1 @@
-+asin_exprange
-diff -Naurd mpfr-3.0.1-a/VERSION mpfr-3.0.1-b/VERSION
---- mpfr-3.0.1-a/VERSION	2011-04-04 10:19:18.000000000 +0000
-+++ mpfr-3.0.1-b/VERSION	2011-04-12 10:50:02.000000000 +0000
-@@ -1 +1 @@
--3.0.1
-+3.0.1-p1
-diff -Naurd mpfr-3.0.1-a/asin.c mpfr-3.0.1-b/asin.c
---- mpfr-3.0.1-a/asin.c	2011-04-04 10:19:18.000000000 +0000
-+++ mpfr-3.0.1-b/asin.c	2011-04-12 10:50:02.000000000 +0000
-@@ -63,11 +63,14 @@
- 
-   compared = mpfr_cmp_ui (xp, 1);
- 
-+  MPFR_SAVE_EXPO_MARK (expo);
-+
-   if (MPFR_UNLIKELY (compared >= 0))
-     {
-       mpfr_clear (xp);
-       if (compared > 0)                  /* asin(x) = NaN for |x| > 1 */
-         {
-+          MPFR_SAVE_EXPO_FREE (expo);
-           MPFR_SET_NAN (asin);
-           MPFR_RET_NAN;
-         }
-@@ -80,13 +83,11 @@
-               inexact = -mpfr_const_pi (asin, MPFR_INVERT_RND(rnd_mode));
-               MPFR_CHANGE_SIGN (asin);
-             }
--          mpfr_div_2ui (asin, asin, 1, rnd_mode); /* May underflow */
--          return inexact;
-+          mpfr_div_2ui (asin, asin, 1, rnd_mode);
-         }
-     }
--
--  MPFR_SAVE_EXPO_MARK (expo);
--
-+  else
-+    {
-   /* Compute exponent of 1 - ABS(x) */
-   mpfr_ui_sub (xp, 1, xp, MPFR_RNDD);
-   MPFR_ASSERTD (MPFR_GET_EXP (xp) <= 0);
-@@ -115,6 +116,7 @@
-   inexact = mpfr_set (asin, xp, rnd_mode);
- 
-   mpfr_clear (xp);
-+    }
- 
-   MPFR_SAVE_EXPO_FREE (expo);
-   return mpfr_check_range (asin, inexact, rnd_mode);
-diff -Naurd mpfr-3.0.1-a/mpfr.h mpfr-3.0.1-b/mpfr.h
---- mpfr-3.0.1-a/mpfr.h	2011-04-04 10:19:18.000000000 +0000
-+++ mpfr-3.0.1-b/mpfr.h	2011-04-12 10:50:02.000000000 +0000
-@@ -27,7 +27,7 @@
- #define MPFR_VERSION_MAJOR 3
- #define MPFR_VERSION_MINOR 0
- #define MPFR_VERSION_PATCHLEVEL 1
--#define MPFR_VERSION_STRING "3.0.1"
-+#define MPFR_VERSION_STRING "3.0.1-p1"
- 
- /* Macros dealing with MPFR VERSION */
- #define MPFR_VERSION_NUM(a,b,c) (((a) << 16L) | ((b) << 8) | (c))
-diff -Naurd mpfr-3.0.1-a/tests/tasin.c mpfr-3.0.1-b/tests/tasin.c
---- mpfr-3.0.1-a/tests/tasin.c	2011-04-04 10:19:17.000000000 +0000
-+++ mpfr-3.0.1-b/tests/tasin.c	2011-04-12 10:50:02.000000000 +0000
-@@ -219,6 +219,49 @@
-   mpfr_clear (y);
- }
- 
-+static void
-+reduced_expo_range (void)
-+{
-+  mpfr_exp_t emin, emax;
-+  mpfr_t x, y, ex_y;
-+  int inex, ex_inex;
-+  unsigned int flags, ex_flags;
-+
-+  emin = mpfr_get_emin ();
-+  emax = mpfr_get_emax ();
-+
-+  mpfr_inits2 (4, x, y, ex_y, (mpfr_ptr) 0);
-+  mpfr_set_str (x, "-0.1e1", 2, MPFR_RNDN);
-+
-+  mpfr_set_emin (1);
-+  mpfr_set_emax (1);
-+  mpfr_clear_flags ();
-+  inex = mpfr_asin (y, x, MPFR_RNDA);
-+  flags = __gmpfr_flags;
-+  mpfr_set_emin (emin);
-+  mpfr_set_emax (emax);
-+
-+  mpfr_set_str (ex_y, "-0.1101e1", 2, MPFR_RNDN);
-+  ex_inex = -1;
-+  ex_flags = MPFR_FLAGS_INEXACT;
-+
-+  if (SIGN (inex) != ex_inex || flags != ex_flags ||
-+      ! mpfr_equal_p (y, ex_y))
-+    {
-+      printf ("Error in reduced_expo_range\non x = ");
-+      mpfr_dump (x);
-+      printf ("Expected y = ");
-+      mpfr_out_str (stdout, 2, 0, ex_y, MPFR_RNDN);
-+      printf ("\n         inex = %d, flags = %u\n", ex_inex, ex_flags);
-+      printf ("Got      y = ");
-+      mpfr_out_str (stdout, 2, 0, y, MPFR_RNDN);
-+      printf ("\n         inex = %d, flags = %u\n", SIGN (inex), flags);
-+      exit (1);
-+    }
-+
-+  mpfr_clears (x, y, ex_y, (mpfr_ptr) 0);
-+}
-+
- int
- main (void)
- {
-@@ -226,6 +269,7 @@
- 
-   special ();
-   special_overflow ();
-+  reduced_expo_range ();
- 
-   test_generic (2, 100, 15);
- 
-diff -Naurd mpfr-3.0.1-a/version.c mpfr-3.0.1-b/version.c
---- mpfr-3.0.1-a/version.c	2011-04-04 10:19:18.000000000 +0000
-+++ mpfr-3.0.1-b/version.c	2011-04-12 10:50:02.000000000 +0000
-@@ -25,5 +25,5 @@
- const char *
- mpfr_get_version (void)
- {
--  return "3.0.1";
-+  return "3.0.1-p1";
- }
-diff -Naurd mpfr-3.0.1-a/PATCHES mpfr-3.0.1-b/PATCHES
---- mpfr-3.0.1-a/PATCHES	2011-05-04 11:18:33.000000000 +0000
-+++ mpfr-3.0.1-b/PATCHES	2011-05-04 11:18:33.000000000 +0000
-@@ -0,0 +1 @@
-+rec_sqrt-carry
-diff -Naurd mpfr-3.0.1-a/VERSION mpfr-3.0.1-b/VERSION
---- mpfr-3.0.1-a/VERSION	2011-04-12 10:50:02.000000000 +0000
-+++ mpfr-3.0.1-b/VERSION	2011-05-04 11:18:33.000000000 +0000
-@@ -1 +1 @@
--3.0.1-p1
-+3.0.1-p2
-diff -Naurd mpfr-3.0.1-a/mpfr.h mpfr-3.0.1-b/mpfr.h
---- mpfr-3.0.1-a/mpfr.h	2011-04-12 10:50:02.000000000 +0000
-+++ mpfr-3.0.1-b/mpfr.h	2011-05-04 11:18:33.000000000 +0000
-@@ -27,7 +27,7 @@
- #define MPFR_VERSION_MAJOR 3
- #define MPFR_VERSION_MINOR 0
- #define MPFR_VERSION_PATCHLEVEL 1
--#define MPFR_VERSION_STRING "3.0.1-p1"
-+#define MPFR_VERSION_STRING "3.0.1-p2"
- 
- /* Macros dealing with MPFR VERSION */
- #define MPFR_VERSION_NUM(a,b,c) (((a) << 16L) | ((b) << 8) | (c))
-diff -Naurd mpfr-3.0.1-a/rec_sqrt.c mpfr-3.0.1-b/rec_sqrt.c
---- mpfr-3.0.1-a/rec_sqrt.c	2011-04-04 10:19:18.000000000 +0000
-+++ mpfr-3.0.1-b/rec_sqrt.c	2011-05-04 11:18:33.000000000 +0000
-@@ -375,20 +375,37 @@
-       MPFR_ASSERTD(un == ln + 1 || un == ln + 2);
-       /* the high un-ln limbs of u will overlap the low part of {x+ln,xn},
-          we need to add or subtract the overlapping part {u + ln, un - ln} */
-+      /* Warning! th may be 0, in which case the mpn_add_1 and mpn_sub_1
-+         below (with size = th) mustn't be used. In such a case, the limb
-+         (carry) will be 0, so that this is semantically a no-op, but if
-+         mpn_add_1 and mpn_sub_1 are used, GMP (currently) still does a
-+         non-atomic read/write in a place that is not always allocated,
-+         with the possible consequences: a crash if the corresponding
-+         address is not mapped, or (rather unlikely) memory corruption
-+         if another process/thread writes@the same place; things may
-+         be worse with future GMP versions. Hence the tests carry != 0. */
-       if (neg == 0)
-         {
-           if (ln > 0)
-             MPN_COPY (x, u, ln);
-           cy = mpn_add (x + ln, x + ln, xn, u + ln, un - ln);
-           /* add cu at x+un */
--          cy += mpn_add_1 (x + un, x + un, th, cu);
-+          if (cu != 0)
-+            {
-+              MPFR_ASSERTD (th != 0);
-+              cy += mpn_add_1 (x + un, x + un, th, cu);
-+            }
-         }
-       else /* negative case */
-         {
-           /* subtract {u+ln, un-ln} from {x+ln,un} */
-           cy = mpn_sub (x + ln, x + ln, xn, u + ln, un - ln);
-           /* carry cy is at x+un, like cu */
--          cy = mpn_sub_1 (x + un, x + un, th, cy + cu); /* n - un = th */
-+          if (cy + cu != 0)
-+            {
-+              MPFR_ASSERTD (th != 0);
-+              cy = mpn_sub_1 (x + un, x + un, th, cy + cu); /* n - un = th */
-+            }
-           /* cy cannot be zero, since the most significant bit of Xh is 1,
-              and the correction is bounded by 2^{-h+3} */
-           MPFR_ASSERTD(cy == 0);
-diff -Naurd mpfr-3.0.1-a/version.c mpfr-3.0.1-b/version.c
---- mpfr-3.0.1-a/version.c	2011-04-12 10:50:02.000000000 +0000
-+++ mpfr-3.0.1-b/version.c	2011-05-04 11:18:33.000000000 +0000
-@@ -25,5 +25,5 @@
- const char *
- mpfr_get_version (void)
- {
--  return "3.0.1-p1";
-+  return "3.0.1-p2";
- }
-diff -Naurd mpfr-3.0.1-a/PATCHES mpfr-3.0.1-b/PATCHES
---- mpfr-3.0.1-a/PATCHES	2011-05-05 00:00:35.000000000 +0000
-+++ mpfr-3.0.1-b/PATCHES	2011-05-05 00:00:35.000000000 +0000
-@@ -0,0 +1 @@
-+atan-expo-range
-diff -Naurd mpfr-3.0.1-a/VERSION mpfr-3.0.1-b/VERSION
---- mpfr-3.0.1-a/VERSION	2011-05-04 11:18:33.000000000 +0000
-+++ mpfr-3.0.1-b/VERSION	2011-05-05 00:00:35.000000000 +0000
-@@ -1 +1 @@
--3.0.1-p2
-+3.0.1-p3
-diff -Naurd mpfr-3.0.1-a/atan.c mpfr-3.0.1-b/atan.c
---- mpfr-3.0.1-a/atan.c	2011-04-04 10:19:18.000000000 +0000
-+++ mpfr-3.0.1-b/atan.c	2011-05-05 00:00:35.000000000 +0000
-@@ -431,5 +431,5 @@
-   MPFR_GROUP_CLEAR (group);
- 
-   MPFR_SAVE_EXPO_FREE (expo);
--  return mpfr_check_range (arctgt, inexact, rnd_mode);
-+  return mpfr_check_range (atan, inexact, rnd_mode);
- }
-diff -Naurd mpfr-3.0.1-a/mpfr.h mpfr-3.0.1-b/mpfr.h
---- mpfr-3.0.1-a/mpfr.h	2011-05-04 11:18:33.000000000 +0000
-+++ mpfr-3.0.1-b/mpfr.h	2011-05-05 00:00:35.000000000 +0000
-@@ -27,7 +27,7 @@
- #define MPFR_VERSION_MAJOR 3
- #define MPFR_VERSION_MINOR 0
- #define MPFR_VERSION_PATCHLEVEL 1
--#define MPFR_VERSION_STRING "3.0.1-p2"
-+#define MPFR_VERSION_STRING "3.0.1-p3"
- 
- /* Macros dealing with MPFR VERSION */
- #define MPFR_VERSION_NUM(a,b,c) (((a) << 16L) | ((b) << 8) | (c))
-diff -Naurd mpfr-3.0.1-a/tests/tatan.c mpfr-3.0.1-b/tests/tatan.c
---- mpfr-3.0.1-a/tests/tatan.c	2011-04-04 10:19:17.000000000 +0000
-+++ mpfr-3.0.1-b/tests/tatan.c	2011-05-05 00:00:35.000000000 +0000
-@@ -535,6 +535,52 @@
-   mpfr_clears (a, x, y, (mpfr_ptr) 0);
- }
- 
-+/* http://websympa.loria.fr/wwsympa/arc/mpfr/2011-05/msg00008.html
-+ * Incorrect flags (in debug mode on a 32-bit machine, assertion failure).
-+ */
-+static void
-+reduced_expo_range (void)
-+{
-+  mpfr_exp_t emin, emax;
-+  mpfr_t x, y, ex_y;
-+  int inex, ex_inex;
-+  unsigned int flags, ex_flags;
-+
-+  emin = mpfr_get_emin ();
-+  emax = mpfr_get_emax ();
-+
-+  mpfr_inits2 (12, x, y, ex_y, (mpfr_ptr) 0);
-+  mpfr_set_str (x, "0.1e-5", 2, MPFR_RNDN);
-+
-+  mpfr_set_emin (-5);
-+  mpfr_set_emax (-5);
-+  mpfr_clear_flags ();
-+  inex = mpfr_atan (y, x, MPFR_RNDN);
-+  flags = __gmpfr_flags;
-+  mpfr_set_emin (emin);
-+  mpfr_set_emax (emax);
-+
-+  mpfr_set_str (ex_y, "0.1e-5", 2, MPFR_RNDN);
-+  ex_inex = 1;
-+  ex_flags = MPFR_FLAGS_INEXACT;
-+
-+  if (SIGN (inex) != ex_inex || flags != ex_flags ||
-+      ! mpfr_equal_p (y, ex_y))
-+    {
-+      printf ("Error in reduced_expo_range\non x = ");
-+      mpfr_dump (x);
-+      printf ("Expected y = ");
-+      mpfr_out_str (stdout, 2, 0, ex_y, MPFR_RNDN);
-+      printf ("\n         inex = %d, flags = %u\n", ex_inex, ex_flags);
-+      printf ("Got      y = ");
-+      mpfr_out_str (stdout, 2, 0, y, MPFR_RNDN);
-+      printf ("\n         inex = %d, flags = %u\n", SIGN (inex), flags);
-+      exit (1);
-+    }
-+
-+  mpfr_clears (x, y, ex_y, (mpfr_ptr) 0);
-+}
-+
- int
- main (int argc, char *argv[])
- {
-@@ -546,6 +592,7 @@
-   smallvals_atan2 ();
-   atan2_bug_20071003 ();
-   atan2_different_prec ();
-+  reduced_expo_range ();
- 
-   test_generic_atan  (2, 200, 17);
-   test_generic_atan2 (2, 200, 17);
-diff -Naurd mpfr-3.0.1-a/version.c mpfr-3.0.1-b/version.c
---- mpfr-3.0.1-a/version.c	2011-05-04 11:18:33.000000000 +0000
-+++ mpfr-3.0.1-b/version.c	2011-05-05 00:00:35.000000000 +0000
-@@ -25,5 +25,5 @@
- const char *
- mpfr_get_version (void)
- {
--  return "3.0.1-p2";
-+  return "3.0.1-p3";
- }
-diff -Naurd mpfr-3.0.1-a/PATCHES mpfr-3.0.1-b/PATCHES
---- mpfr-3.0.1-a/PATCHES	2011-05-09 14:48:24.000000000 +0000
-+++ mpfr-3.0.1-b/PATCHES	2011-05-09 14:48:24.000000000 +0000
-@@ -0,0 +1 @@
-+texp-zero
-diff -Naurd mpfr-3.0.1-a/VERSION mpfr-3.0.1-b/VERSION
---- mpfr-3.0.1-a/VERSION	2011-05-05 00:00:35.000000000 +0000
-+++ mpfr-3.0.1-b/VERSION	2011-05-09 14:48:24.000000000 +0000
-@@ -1 +1 @@
--3.0.1-p3
-+3.0.1-p4
-diff -Naurd mpfr-3.0.1-a/mpfr.h mpfr-3.0.1-b/mpfr.h
---- mpfr-3.0.1-a/mpfr.h	2011-05-05 00:00:35.000000000 +0000
-+++ mpfr-3.0.1-b/mpfr.h	2011-05-09 14:48:24.000000000 +0000
-@@ -27,7 +27,7 @@
- #define MPFR_VERSION_MAJOR 3
- #define MPFR_VERSION_MINOR 0
- #define MPFR_VERSION_PATCHLEVEL 1
--#define MPFR_VERSION_STRING "3.0.1-p3"
-+#define MPFR_VERSION_STRING "3.0.1-p4"
- 
- /* Macros dealing with MPFR VERSION */
- #define MPFR_VERSION_NUM(a,b,c) (((a) << 16L) | ((b) << 8) | (c))
-diff -Naurd mpfr-3.0.1-a/tests/texp.c mpfr-3.0.1-b/tests/texp.c
---- mpfr-3.0.1-a/tests/texp.c	2011-04-04 10:19:17.000000000 +0000
-+++ mpfr-3.0.1-b/tests/texp.c	2011-05-09 14:48:24.000000000 +0000
-@@ -170,7 +170,9 @@
-       mpfr_set_prec (x, prec);
-       mpfr_set_prec (y, prec);
-       mpfr_set_prec (z, prec);
--      mpfr_urandomb (x, RANDS);
-+      do
-+        mpfr_urandomb (x, RANDS);
-+      while (MPFR_IS_ZERO (x));  /* 0 is handled by mpfr_exp only */
-       rnd = RND_RAND ();
-       mpfr_exp_2 (y, x, rnd);
-       mpfr_exp_3 (z, x, rnd);
-diff -Naurd mpfr-3.0.1-a/version.c mpfr-3.0.1-b/version.c
---- mpfr-3.0.1-a/version.c	2011-05-05 00:00:35.000000000 +0000
-+++ mpfr-3.0.1-b/version.c	2011-05-09 14:48:24.000000000 +0000
-@@ -25,5 +25,5 @@
- const char *
- mpfr_get_version (void)
- {
--  return "3.0.1-p3";
-+  return "3.0.1-p4";
- }
diff --git a/package/mpfr/mpfr-3.1.0-p6.patch b/package/mpfr/mpfr-3.1.0-p6.patch
new file mode 100644
index 0000000..edb852f
--- /dev/null
+++ b/package/mpfr/mpfr-3.1.0-p6.patch
@@ -0,0 +1,673 @@
+diff -Naurd mpfr-3.1.0-a/PATCHES mpfr-3.1.0-b/PATCHES
+--- mpfr-3.1.0-a/PATCHES	2011-10-05 21:39:57.000000000 +0000
++++ mpfr-3.1.0-b/PATCHES	2011-10-05 21:39:57.000000000 +0000
+@@ -0,0 +1 @@
++mpfr_unlikely
+diff -Naurd mpfr-3.1.0-a/VERSION mpfr-3.1.0-b/VERSION
+--- mpfr-3.1.0-a/VERSION	2011-10-03 08:17:15.000000000 +0000
++++ mpfr-3.1.0-b/VERSION	2011-10-05 21:39:57.000000000 +0000
+@@ -1 +1 @@
+-3.1.0
++3.1.0-p1
+diff -Naurd mpfr-3.1.0-a/src/mpfr-impl.h mpfr-3.1.0-b/src/mpfr-impl.h
+--- mpfr-3.1.0-a/src/mpfr-impl.h	2011-10-03 08:17:09.000000000 +0000
++++ mpfr-3.1.0-b/src/mpfr-impl.h	2011-10-05 21:39:57.000000000 +0000
+@@ -988,10 +988,11 @@
+  ******************************************************/
+ 
+ /* Theses macros help the compiler to determine if a test is
+- * likely or unlikely. */
++   likely or unlikely. The !! is necessary in case x is larger
++   than a long. */
+ #if __MPFR_GNUC(3,0) || __MPFR_ICC(8,1,0)
+ # define MPFR_LIKELY(x) (__builtin_expect(!!(x),1))
+-# define MPFR_UNLIKELY(x) (__builtin_expect((x),0))
++# define MPFR_UNLIKELY(x) (__builtin_expect(!!(x),0))
+ #else
+ # define MPFR_LIKELY(x) (x)
+ # define MPFR_UNLIKELY(x) (x)
+diff -Naurd mpfr-3.1.0-a/src/mpfr.h mpfr-3.1.0-b/src/mpfr.h
+--- mpfr-3.1.0-a/src/mpfr.h	2011-10-03 08:17:09.000000000 +0000
++++ mpfr-3.1.0-b/src/mpfr.h	2011-10-05 21:39:57.000000000 +0000
+@@ -27,7 +27,7 @@
+ #define MPFR_VERSION_MAJOR 3
+ #define MPFR_VERSION_MINOR 1
+ #define MPFR_VERSION_PATCHLEVEL 0
+-#define MPFR_VERSION_STRING "3.1.0"
++#define MPFR_VERSION_STRING "3.1.0-p1"
+ 
+ /* Macros dealing with MPFR VERSION */
+ #define MPFR_VERSION_NUM(a,b,c) (((a) << 16L) | ((b) << 8) | (c))
+diff -Naurd mpfr-3.1.0-a/src/version.c mpfr-3.1.0-b/src/version.c
+--- mpfr-3.1.0-a/src/version.c	2011-10-03 08:17:09.000000000 +0000
++++ mpfr-3.1.0-b/src/version.c	2011-10-05 21:39:57.000000000 +0000
+@@ -25,5 +25,5 @@
+ const char *
+ mpfr_get_version (void)
+ {
+-  return "3.1.0";
++  return "3.1.0-p1";
+ }
+diff -Naurd mpfr-3.1.0-a/PATCHES mpfr-3.1.0-b/PATCHES
+--- mpfr-3.1.0-a/PATCHES	2011-10-14 10:43:32.000000000 +0000
++++ mpfr-3.1.0-b/PATCHES	2011-10-14 10:43:32.000000000 +0000
+@@ -0,0 +1 @@
++lib-search-path
+diff -Naurd mpfr-3.1.0-a/VERSION mpfr-3.1.0-b/VERSION
+--- mpfr-3.1.0-a/VERSION	2011-10-05 21:39:57.000000000 +0000
++++ mpfr-3.1.0-b/VERSION	2011-10-14 10:43:32.000000000 +0000
+@@ -1 +1 @@
+-3.1.0-p1
++3.1.0-p2
+diff -Naurd mpfr-3.1.0-a/src/mpfr.h mpfr-3.1.0-b/src/mpfr.h
+--- mpfr-3.1.0-a/src/mpfr.h	2011-10-05 21:39:57.000000000 +0000
++++ mpfr-3.1.0-b/src/mpfr.h	2011-10-14 10:43:32.000000000 +0000
+@@ -27,7 +27,7 @@
+ #define MPFR_VERSION_MAJOR 3
+ #define MPFR_VERSION_MINOR 1
+ #define MPFR_VERSION_PATCHLEVEL 0
+-#define MPFR_VERSION_STRING "3.1.0-p1"
++#define MPFR_VERSION_STRING "3.1.0-p2"
+ 
+ /* Macros dealing with MPFR VERSION */
+ #define MPFR_VERSION_NUM(a,b,c) (((a) << 16L) | ((b) << 8) | (c))
+diff -Naurd mpfr-3.1.0-a/src/version.c mpfr-3.1.0-b/src/version.c
+--- mpfr-3.1.0-a/src/version.c	2011-10-05 21:39:57.000000000 +0000
++++ mpfr-3.1.0-b/src/version.c	2011-10-14 10:43:32.000000000 +0000
+@@ -25,5 +25,5 @@
+ const char *
+ mpfr_get_version (void)
+ {
+-  return "3.1.0-p1";
++  return "3.1.0-p2";
+ }
+diff -Naurd mpfr-3.1.0-a/tests/Makefile.am mpfr-3.1.0-b/tests/Makefile.am
+--- mpfr-3.1.0-a/tests/Makefile.am	2011-10-03 08:17:14.000000000 +0000
++++ mpfr-3.1.0-b/tests/Makefile.am	2011-10-03 08:17:14.000000000 +0000
+@@ -65,8 +65,24 @@
+ TESTS = $(check_PROGRAMS)
+ TESTS_ENVIRONMENT = MPFR_QUIET=1 $(VALGRIND)
+ 
+-# Option to prevent libtool from generating wrapper scripts for the tests.
++# The -no-install option prevents libtool from generating wrapper scripts
++# for the tests.
+ # This is useful to easily run the test scripts under valgrind or gdb.
+ # See discussion http://thread.gmane.org/gmane.comp.lib.gnulib.bugs/28033
+ # http://article.gmane.org/gmane.comp.lib.gnulib.bugs/28140 in particular.
+-AM_LDFLAGS = -no-install
++#
++# The -L$(top_builddir)/src/.libs option is necessary for some platforms,
++# such as HP-UX, when --with-gmp or --with-gmp-lib is used and an old MPFR
++# library is already installed in the corresponding lib directory: its
++# purpose is to make sure that the local .libs comes first in the library
++# search path (otherwise the tests are linked against the old MPFR library
++# by the LINK command -- see the generated Makefile). See:
++#   http://websympa.loria.fr/wwsympa/arc/mpfr/2011-10/msg00042.html
++#   http://websympa.loria.fr/wwsympa/arc/mpfr/2011-10/msg00043.html
++#   http://websympa.loria.fr/wwsympa/arc/mpfr/2011-10/msg00044.html
++#   http://websympa.loria.fr/wwsympa/arc/mpfr/2011-10/msg00066.html
++#   http://websympa.loria.fr/wwsympa/arc/mpfr/2011-10/msg00065.html
++# and
++#   http://debbugs.gnu.org/cgi/bugreport.cgi?bug=9728
++#
++AM_LDFLAGS = -no-install -L$(top_builddir)/src/.libs
+diff -Naurd mpfr-3.1.0-a/tests/Makefile.in mpfr-3.1.0-b/tests/Makefile.in
+--- mpfr-3.1.0-a/tests/Makefile.in	2011-10-03 08:17:35.000000000 +0000
++++ mpfr-3.1.0-b/tests/Makefile.in	2011-10-03 08:17:35.000000000 +0000
+@@ -1124,11 +1124,27 @@
+ TESTS = $(check_PROGRAMS)
+ TESTS_ENVIRONMENT = MPFR_QUIET=1 $(VALGRIND)
+ 
+-# Option to prevent libtool from generating wrapper scripts for the tests.
++# The -no-install option prevents libtool from generating wrapper scripts
++# for the tests.
+ # This is useful to easily run the test scripts under valgrind or gdb.
+ # See discussion http://thread.gmane.org/gmane.comp.lib.gnulib.bugs/28033
+ # http://article.gmane.org/gmane.comp.lib.gnulib.bugs/28140 in particular.
+-AM_LDFLAGS = -no-install
++#
++# The -L$(top_builddir)/src/.libs option is necessary for some platforms,
++# such as HP-UX, when --with-gmp or --with-gmp-lib is used and an old MPFR
++# library is already installed in the corresponding lib directory: its
++# purpose is to make sure that the local .libs comes first in the library
++# search path (otherwise the tests are linked against the old MPFR library
++# by the LINK command -- see the generated Makefile). See:
++#   http://websympa.loria.fr/wwsympa/arc/mpfr/2011-10/msg00042.html
++#   http://websympa.loria.fr/wwsympa/arc/mpfr/2011-10/msg00043.html
++#   http://websympa.loria.fr/wwsympa/arc/mpfr/2011-10/msg00044.html
++#   http://websympa.loria.fr/wwsympa/arc/mpfr/2011-10/msg00066.html
++#   http://websympa.loria.fr/wwsympa/arc/mpfr/2011-10/msg00065.html
++# and
++#   http://debbugs.gnu.org/cgi/bugreport.cgi?bug=9728
++#
++AM_LDFLAGS = -no-install -L$(top_builddir)/src/.libs
+ all: all-am
+ 
+ .SUFFIXES:
+diff -Naurd mpfr-3.1.0-a/PATCHES mpfr-3.1.0-b/PATCHES
+--- mpfr-3.1.0-a/PATCHES	2011-11-03 15:15:11.000000000 +0000
++++ mpfr-3.1.0-b/PATCHES	2011-11-03 15:15:11.000000000 +0000
+@@ -0,0 +1 @@
++vasprintf
+diff -Naurd mpfr-3.1.0-a/VERSION mpfr-3.1.0-b/VERSION
+--- mpfr-3.1.0-a/VERSION	2011-10-14 10:43:32.000000000 +0000
++++ mpfr-3.1.0-b/VERSION	2011-11-03 15:15:11.000000000 +0000
+@@ -1 +1 @@
+-3.1.0-p2
++3.1.0-p3
+diff -Naurd mpfr-3.1.0-a/src/mpfr.h mpfr-3.1.0-b/src/mpfr.h
+--- mpfr-3.1.0-a/src/mpfr.h	2011-10-14 10:43:32.000000000 +0000
++++ mpfr-3.1.0-b/src/mpfr.h	2011-11-03 15:15:11.000000000 +0000
+@@ -27,7 +27,7 @@
+ #define MPFR_VERSION_MAJOR 3
+ #define MPFR_VERSION_MINOR 1
+ #define MPFR_VERSION_PATCHLEVEL 0
+-#define MPFR_VERSION_STRING "3.1.0-p2"
++#define MPFR_VERSION_STRING "3.1.0-p3"
+ 
+ /* Macros dealing with MPFR VERSION */
+ #define MPFR_VERSION_NUM(a,b,c) (((a) << 16L) | ((b) << 8) | (c))
+diff -Naurd mpfr-3.1.0-a/src/vasprintf.c mpfr-3.1.0-b/src/vasprintf.c
+--- mpfr-3.1.0-a/src/vasprintf.c	2011-10-03 08:17:09.000000000 +0000
++++ mpfr-3.1.0-b/src/vasprintf.c	2011-11-03 15:15:11.000000000 +0000
+@@ -1178,7 +1178,7 @@
+   mpfr_exp_t exp;
+   char * str;
+   const int spec_g = (spec.spec == 'g' || spec.spec == 'G');
+-  const int keep_trailing_zeros = spec_g && spec.alt;
++  const int keep_trailing_zeros = !spec_g || spec.alt;
+ 
+   /* WARNING: an empty precision field is forbidden (it means precision = 6
+      and it should have been changed to 6 before the function call) */
+@@ -1356,7 +1356,7 @@
+   else
+     /* 1 <= |p| */
+     {
+-      size_t nsd;  /* Number of significant digits */
++      size_t str_len;
+ 
+       /* Determine the position of the most significant decimal digit. */
+       exp = floor_log10 (p);
+@@ -1365,12 +1365,10 @@
+         /* P is too large to print all its integral part digits */
+         return -1;
+ 
+-      np->ip_size = exp + 1;
+-
+-      nsd = spec.prec + np->ip_size;
+       if (dec_info == NULL)
+-        {
+-          str = mpfr_get_str (NULL, &exp, 10, nsd, p, spec.rnd_mode);
++        { /* this case occurs with mpfr_printf ("%.0RUf", x) with x=9.5 */
++          str =
++            mpfr_get_str (NULL, &exp, 10, spec.prec+exp+1, p, spec.rnd_mode);
+           register_string (np->sl, str);
+         }
+       else
+@@ -1379,81 +1377,60 @@
+           str = dec_info->str;
+         }
+       np->ip_ptr = MPFR_IS_NEG (p) ? ++str : str; /* skip sign */
++      str_len = strlen (str);
++
++      /* integral part */
++      if (exp > str_len)
++        /* mpfr_get_str gives no trailing zero when p is rounded up to the next
++           power of 10 (p integer, so no fractional part) */
++        {
++          np->ip_trailing_zeros = exp - str_len;
++          np->ip_size = str_len;
++        }
++      else
++        np->ip_size = exp;
+ 
+       if (spec.group)
+         /* thousands separator in integral part */
+         np->thousands_sep = MPFR_THOUSANDS_SEPARATOR;
+ 
+-      if (nsd == 0 || (spec_g && !spec.alt))
+-        /* compute how much non-zero digits in integral and fractional
+-           parts */
++      /* fractional part */
++      str += np->ip_size;
++      str_len -= np->ip_size;
++      if (!keep_trailing_zeros)
++        /* remove trailing zeros, if any */
+         {
+-          size_t str_len;
+-          str_len = strlen (str); /* note: the sign has been skipped */
+-
+-          if (exp > str_len)
+-            /* mpfr_get_str doesn't give the trailing zeros when p is a
+-               multiple of 10 (p integer, so no fractional part) */
+-            {
+-              np->ip_trailing_zeros = exp - str_len;
+-              np->ip_size = str_len;
+-              if (spec.alt)
+-                np->point = MPFR_DECIMAL_POINT;
+-            }
+-          else
+-            /* str may contain some digits which are in fractional part */
++          char *ptr = str + str_len - 1; /* pointer to the last digit of
++                                            str */
++          while ((*ptr == '0') && (str_len != 0))
+             {
+-              char *ptr;
+-
+-              ptr = str + str_len - 1; /* points to the end of str */
+-              str_len -= np->ip_size;  /* number of digits in fractional
+-                                          part */
+-
+-              if (!keep_trailing_zeros)
+-                /* remove trailing zeros, if any */
+-                {
+-                  while ((*ptr == '0') && (str_len != 0))
+-                    {
+-                      --ptr;
+-                      --str_len;
+-                    }
+-                }
+-
+-              if (str_len > INT_MAX)
+-                /* too many digits in fractional part */
+-                return -1;
+-
+-              if (str_len != 0)
+-                /* some digits in fractional part */
+-                {
+-                  np->point = MPFR_DECIMAL_POINT;
+-                  np->fp_ptr = str + np->ip_size;
+-                  np->fp_size = str_len;
+-                }
++              --ptr;
++              --str_len;
+             }
+         }
+-      else
+-        /* spec.prec digits in fractional part */
++
++      if (str_len > 0)
++        /* some nonzero digits in fractional part */
+         {
+-          if (np->ip_size == exp - 1)
+-            /* the absolute value of the number has been rounded up to a power
+-               of ten.
+-               Insert an additional zero in integral part and put the rest of
+-               them in fractional part. */
+-            np->ip_trailing_zeros = 1;
++          if (str_len > INT_MAX)
++            /* too many digits in fractional part */
++            return -1;
+ 
+-          if (spec.prec != 0)
+-            {
+-              MPFR_ASSERTD (np->ip_size + np->ip_trailing_zeros == exp);
+-              MPFR_ASSERTD (np->ip_size + spec.prec == nsd);
++          np->point = MPFR_DECIMAL_POINT;
++          np->fp_ptr = str;
++          np->fp_size = str_len;
++        }
+ 
+-              np->point = MPFR_DECIMAL_POINT;
+-              np->fp_ptr = str + np->ip_size;
+-              np->fp_size = spec.prec;
+-            }
+-          else if (spec.alt)
+-            np->point = MPFR_DECIMAL_POINT;
++      if (keep_trailing_zeros && str_len < spec.prec)
++        /* add missing trailing zeros */
++        {
++          np->point = MPFR_DECIMAL_POINT;
++          np->fp_trailing_zeros = spec.prec - np->fp_size;
+         }
++
++      if (spec.alt)
++        /* add decimal point even if no digits follow it */
++        np->point = MPFR_DECIMAL_POINT;
+     }
+ 
+   return 0;
+diff -Naurd mpfr-3.1.0-a/src/version.c mpfr-3.1.0-b/src/version.c
+--- mpfr-3.1.0-a/src/version.c	2011-10-14 10:43:32.000000000 +0000
++++ mpfr-3.1.0-b/src/version.c	2011-11-03 15:15:11.000000000 +0000
+@@ -25,5 +25,5 @@
+ const char *
+ mpfr_get_version (void)
+ {
+-  return "3.1.0-p2";
++  return "3.1.0-p3";
+ }
+diff -Naurd mpfr-3.1.0-a/tests/tsprintf.c mpfr-3.1.0-b/tests/tsprintf.c
+--- mpfr-3.1.0-a/tests/tsprintf.c	2011-10-03 08:17:14.000000000 +0000
++++ mpfr-3.1.0-b/tests/tsprintf.c	2011-11-03 15:15:11.000000000 +0000
+@@ -475,6 +475,18 @@
+   check_sprintf ("-1.", "%- #0.1RG", x);
+ 
+   /* precision zero */
++  mpfr_set_d (x, 9.5, MPFR_RNDN);
++  check_sprintf ("9",    "%.0RDf", x);
++  check_sprintf ("10",    "%.0RUf", x);
++
++  mpfr_set_d (x, 19.5, MPFR_RNDN);
++  check_sprintf ("19",    "%.0RDf", x);
++  check_sprintf ("20",    "%.0RUf", x);
++
++  mpfr_set_d (x, 99.5, MPFR_RNDN);
++  check_sprintf ("99",    "%.0RDf", x);
++  check_sprintf ("100",   "%.0RUf", x);
++
+   mpfr_set_d (x, -9.5, MPFR_RNDN);
+   check_sprintf ("-10",    "%.0RDf", x);
+   check_sprintf ("-10",    "%.0RYf", x);
+@@ -1078,6 +1090,23 @@
+   mpfr_clear (x);
+ }
+ 
++static void
++bug20111102 (void)
++{
++  mpfr_t t;
++  char s[100];
++
++  mpfr_init2 (t, 84);
++  mpfr_set_str (t, "999.99999999999999999999", 10, MPFR_RNDN);
++  mpfr_sprintf (s, "%.20RNg", t);
++  if (strcmp (s, "1000") != 0)
++    {
++      printf ("Error in bug20111102, expected 1000, got %s\n", s);
++      exit (1);
++    }
++  mpfr_clear (t);
++}
++
+ /* In particular, the following test makes sure that the rounding
+  * for %Ra and %Rb is not done on the MPFR number itself (as it
+  * would overflow). Note: it has been reported on comp.std.c that
+@@ -1161,6 +1190,7 @@
+   locale = setlocale (LC_ALL, "C");
+ #endif
+ 
++  bug20111102 ();
+   native_types ();
+   hexadecimal ();
+   binary ();
+diff -Naurd mpfr-3.1.0-a/PATCHES mpfr-3.1.0-b/PATCHES
+--- mpfr-3.1.0-a/PATCHES	2011-11-28 12:22:52.000000000 +0000
++++ mpfr-3.1.0-b/PATCHES	2011-11-28 12:22:52.000000000 +0000
+@@ -0,0 +1 @@
++gmp41compat
+diff -Naurd mpfr-3.1.0-a/VERSION mpfr-3.1.0-b/VERSION
+--- mpfr-3.1.0-a/VERSION	2011-11-03 15:15:11.000000000 +0000
++++ mpfr-3.1.0-b/VERSION	2011-11-28 12:22:52.000000000 +0000
+@@ -1 +1 @@
+-3.1.0-p3
++3.1.0-p4
+diff -Naurd mpfr-3.1.0-a/doc/mpfr.info mpfr-3.1.0-b/doc/mpfr.info
+--- mpfr-3.1.0-a/doc/mpfr.info	2011-10-03 09:43:04.000000000 +0000
++++ mpfr-3.1.0-b/doc/mpfr.info	2011-11-28 12:22:52.000000000 +0000
+@@ -2994,11 +2994,12 @@
+ 
+    * `mpfr_urandom' and `mpfr_urandomb' changed in MPFR 3.1.  Their
+      behavior no longer depends on the platform (assuming this is also
+-     true for GMP's random generator).  As a consequence, the returned
+-     values can be different between MPFR 3.1 and previous MPFR
+-     versions.  Note: as the reproducibility of these functions was not
+-     specified before MPFR 3.1, the MPFR 3.1 behavior is _not_ regarded
+-     as backward incompatible with previous versions.
++     true for GMP's random generator, which is not the case between GMP
++     4.1 and 4.2 if `gmp_randinit_default' is used).  As a consequence,
++     the returned values can be different between MPFR 3.1 and previous
++     MPFR versions.  Note: as the reproducibility of these functions
++     was not specified before MPFR 3.1, the MPFR 3.1 behavior is _not_
++     regarded as backward incompatible with previous versions.
+ 
+ 
+ 
+@@ -4239,13 +4240,13 @@
+ Node: Type and Macro Changes129308
+ Node: Added Functions132029
+ Node: Changed Functions134972
+-Node: Removed Functions139167
+-Node: Other Changes139579
+-Node: Contributors141108
+-Node: References143574
+-Node: GNU Free Documentation License145315
+-Node: Concept Index167758
+-Node: Function and Type Index173677
++Node: Removed Functions139253
++Node: Other Changes139665
++Node: Contributors141194
++Node: References143660
++Node: GNU Free Documentation License145401
++Node: Concept Index167844
++Node: Function and Type Index173763
+ 
+ End Tag Table
+ 
+diff -Naurd mpfr-3.1.0-a/doc/mpfr.texi mpfr-3.1.0-b/doc/mpfr.texi
+--- mpfr-3.1.0-a/doc/mpfr.texi	2011-10-03 08:17:14.000000000 +0000
++++ mpfr-3.1.0-b/doc/mpfr.texi	2011-11-28 12:22:52.000000000 +0000
+@@ -3466,8 +3466,9 @@
+ a lack of specification.
+ 
+ @item @code{mpfr_urandom} and @code{mpfr_urandomb} changed in MPFR 3.1.
+-Their behavior no longer depends on the platform (assuming this is also
+-true for GMP's random generator).  As a consequence, the returned values
++Their behavior no longer depends on the platform (assuming this is also true
++for GMP's random generator, which is not the case between GMP 4.1 and 4.2 if
++ at code{gmp_randinit_default} is used).  As a consequence, the returned values
+ can be different between MPFR 3.1 and previous MPFR versions.
+ Note: as the reproducibility of these functions was not specified
+ before MPFR 3.1, the MPFR 3.1 behavior is @emph{not} regarded as
+diff -Naurd mpfr-3.1.0-a/src/mpfr.h mpfr-3.1.0-b/src/mpfr.h
+--- mpfr-3.1.0-a/src/mpfr.h	2011-11-03 15:15:11.000000000 +0000
++++ mpfr-3.1.0-b/src/mpfr.h	2011-11-28 12:22:52.000000000 +0000
+@@ -27,7 +27,7 @@
+ #define MPFR_VERSION_MAJOR 3
+ #define MPFR_VERSION_MINOR 1
+ #define MPFR_VERSION_PATCHLEVEL 0
+-#define MPFR_VERSION_STRING "3.1.0-p3"
++#define MPFR_VERSION_STRING "3.1.0-p4"
+ 
+ /* Macros dealing with MPFR VERSION */
+ #define MPFR_VERSION_NUM(a,b,c) (((a) << 16L) | ((b) << 8) | (c))
+diff -Naurd mpfr-3.1.0-a/src/version.c mpfr-3.1.0-b/src/version.c
+--- mpfr-3.1.0-a/src/version.c	2011-11-03 15:15:11.000000000 +0000
++++ mpfr-3.1.0-b/src/version.c	2011-11-28 12:22:52.000000000 +0000
+@@ -25,5 +25,5 @@
+ const char *
+ mpfr_get_version (void)
+ {
+-  return "3.1.0-p3";
++  return "3.1.0-p4";
+ }
+diff -Naurd mpfr-3.1.0-a/tests/trandom.c mpfr-3.1.0-b/tests/trandom.c
+--- mpfr-3.1.0-a/tests/trandom.c	2011-10-03 08:17:14.000000000 +0000
++++ mpfr-3.1.0-b/tests/trandom.c	2011-11-28 12:22:52.000000000 +0000
+@@ -114,21 +114,29 @@
+   mpfr_t x;
+   gmp_randstate_t s;
+ 
++#if __MPFR_GMP(4,2,0)
++# define C1 "0.895943"
++# define C2 "0.848824"
++#else
++# define C1 "0.479652"
++# define C2 "0.648529"
++#endif
++
+   gmp_randinit_default (s);
+   gmp_randseed_ui (s, 42);
+   mpfr_init2 (x, 17);
+   mpfr_urandomb (x, s);
+-  if (mpfr_cmp_str1 (x, "0.895943") != 0)
++  if (mpfr_cmp_str1 (x, C1) != 0)
+     {
+-      printf ("Error in bug20100914, expected 0.895943, got ");
++      printf ("Error in bug20100914, expected " C1 ", got ");
+       mpfr_out_str (stdout, 10, 0, x, MPFR_RNDN);
+       printf ("\n");
+       exit (1);
+     }
+   mpfr_urandomb (x, s);
+-  if (mpfr_cmp_str1 (x, "0.848824") != 0)
++  if (mpfr_cmp_str1 (x, C2) != 0)
+     {
+-      printf ("Error in bug20100914, expected 0.848824, got ");
++      printf ("Error in bug20100914, expected " C2 ", got ");
+       mpfr_out_str (stdout, 10, 0, x, MPFR_RNDN);
+       printf ("\n");
+       exit (1);
+diff -Naurd mpfr-3.1.0-a/tests/turandom.c mpfr-3.1.0-b/tests/turandom.c
+--- mpfr-3.1.0-a/tests/turandom.c	2011-10-03 08:17:14.000000000 +0000
++++ mpfr-3.1.0-b/tests/turandom.c	2011-11-28 12:22:52.000000000 +0000
+@@ -160,23 +160,29 @@
+   mpfr_t x;
+   gmp_randstate_t s;
+ 
++#if __MPFR_GMP(4,2,0)
++# define C1 "0.8488312"
++# define C2 "0.8156509"
++#else
++# define C1 "0.6485367"
++# define C2 "0.9362717"
++#endif
++
+   gmp_randinit_default (s);
+   gmp_randseed_ui (s, 42);
+   mpfr_init2 (x, 17);
+   mpfr_urandom (x, s, MPFR_RNDN);
+-  /* the following values are obtained on a 32-bit computer, we should get
+-     the same values on a 64-bit computer */
+-  if (mpfr_cmp_str1 (x, "0.8488312") != 0)
++  if (mpfr_cmp_str1 (x, C1) != 0)
+     {
+-      printf ("Error in bug20100914, expected 0.8488312, got ");
++      printf ("Error in bug20100914, expected " C1 ", got ");
+       mpfr_out_str (stdout, 10, 0, x, MPFR_RNDN);
+       printf ("\n");
+       exit (1);
+     }
+   mpfr_urandom (x, s, MPFR_RNDN);
+-  if (mpfr_cmp_str1 (x, "0.8156509") != 0)
++  if (mpfr_cmp_str1 (x, C2) != 0)
+     {
+-      printf ("Error in bug20100914, expected 0.8156509, got ");
++      printf ("Error in bug20100914, expected " C2 ", got ");
+       mpfr_out_str (stdout, 10, 0, x, MPFR_RNDN);
+       printf ("\n");
+       exit (1);
+diff -Naurd mpfr-3.1.0-a/PATCHES mpfr-3.1.0-b/PATCHES
+--- mpfr-3.1.0-a/PATCHES	2012-02-24 12:44:49.000000000 +0000
++++ mpfr-3.1.0-b/PATCHES	2012-02-24 12:44:49.000000000 +0000
+@@ -0,0 +1 @@
++logging-freeze
+diff -Naurd mpfr-3.1.0-a/VERSION mpfr-3.1.0-b/VERSION
+--- mpfr-3.1.0-a/VERSION	2011-11-28 12:22:52.000000000 +0000
++++ mpfr-3.1.0-b/VERSION	2012-02-24 12:44:49.000000000 +0000
+@@ -1 +1 @@
+-3.1.0-p4
++3.1.0-p5
+diff -Naurd mpfr-3.1.0-a/src/add_d.c mpfr-3.1.0-b/src/add_d.c
+--- mpfr-3.1.0-a/src/add_d.c	2011-10-03 08:17:09.000000000 +0000
++++ mpfr-3.1.0-b/src/add_d.c	2012-02-24 12:44:49.000000000 +0000
+@@ -34,7 +34,7 @@
+     (("b[%Pu]=%.*Rg c=%.20g rnd=%d",
+       mpfr_get_prec(b), mpfr_log_prec, b, c, rnd_mode),
+      ("a[%Pu]=%.*Rg inexact=%d",
+-      mpfr_get_prec (a), mpfr_get_prec, a, inexact));
++      mpfr_get_prec (a), mpfr_log_prec, a, inexact));
+ 
+   MPFR_SAVE_EXPO_MARK (expo);
+ 
+diff -Naurd mpfr-3.1.0-a/src/add_ui.c mpfr-3.1.0-b/src/add_ui.c
+--- mpfr-3.1.0-a/src/add_ui.c	2011-10-03 08:17:09.000000000 +0000
++++ mpfr-3.1.0-b/src/add_ui.c	2012-02-24 12:44:49.000000000 +0000
+@@ -29,7 +29,7 @@
+   MPFR_LOG_FUNC
+     (("x[%Pu]=%.*Rg u=%d rnd=%d",
+       mpfr_get_prec(x), mpfr_log_prec, x, u, rnd_mode),
+-     ("y[%Pu]=%.*Rg", mpfr_get_prec (y), mpfr_get_prec, y));
++     ("y[%Pu]=%.*Rg", mpfr_get_prec (y), mpfr_log_prec, y));
+ 
+   if (MPFR_LIKELY(u != 0) )  /* if u=0, do nothing */
+     {
+diff -Naurd mpfr-3.1.0-a/src/mpfr.h mpfr-3.1.0-b/src/mpfr.h
+--- mpfr-3.1.0-a/src/mpfr.h	2011-11-28 12:22:52.000000000 +0000
++++ mpfr-3.1.0-b/src/mpfr.h	2012-02-24 12:44:49.000000000 +0000
+@@ -27,7 +27,7 @@
+ #define MPFR_VERSION_MAJOR 3
+ #define MPFR_VERSION_MINOR 1
+ #define MPFR_VERSION_PATCHLEVEL 0
+-#define MPFR_VERSION_STRING "3.1.0-p4"
++#define MPFR_VERSION_STRING "3.1.0-p5"
+ 
+ /* Macros dealing with MPFR VERSION */
+ #define MPFR_VERSION_NUM(a,b,c) (((a) << 16L) | ((b) << 8) | (c))
+diff -Naurd mpfr-3.1.0-a/src/mul_d.c mpfr-3.1.0-b/src/mul_d.c
+--- mpfr-3.1.0-a/src/mul_d.c	2011-10-03 08:17:09.000000000 +0000
++++ mpfr-3.1.0-b/src/mul_d.c	2012-02-24 12:44:49.000000000 +0000
+@@ -34,7 +34,7 @@
+     (("b[%Pu]=%.*Rg c=%.20g rnd=%d",
+       mpfr_get_prec(b), mpfr_log_prec, b, c, rnd_mode),
+      ("a[%Pu]=%.*Rg inexact=%d",
+-      mpfr_get_prec (a), mpfr_get_prec, a, inexact));
++      mpfr_get_prec (a), mpfr_log_prec, a, inexact));
+ 
+   MPFR_SAVE_EXPO_MARK (expo);
+ 
+diff -Naurd mpfr-3.1.0-a/src/version.c mpfr-3.1.0-b/src/version.c
+--- mpfr-3.1.0-a/src/version.c	2011-11-28 12:22:52.000000000 +0000
++++ mpfr-3.1.0-b/src/version.c	2012-02-24 12:44:49.000000000 +0000
+@@ -25,5 +25,5 @@
+ const char *
+ mpfr_get_version (void)
+ {
+-  return "3.1.0-p4";
++  return "3.1.0-p5";
+ }
+diff -Naurd mpfr-3.1.0-a/PATCHES mpfr-3.1.0-b/PATCHES
+--- mpfr-3.1.0-a/PATCHES	2012-02-24 13:50:05.000000000 +0000
++++ mpfr-3.1.0-b/PATCHES	2012-02-24 13:50:05.000000000 +0000
+@@ -0,0 +1 @@
++logging-varfmt
+diff -Naurd mpfr-3.1.0-a/VERSION mpfr-3.1.0-b/VERSION
+--- mpfr-3.1.0-a/VERSION	2012-02-24 12:44:49.000000000 +0000
++++ mpfr-3.1.0-b/VERSION	2012-02-24 13:50:05.000000000 +0000
+@@ -1 +1 @@
+-3.1.0-p5
++3.1.0-p6
+diff -Naurd mpfr-3.1.0-a/src/mpfr-impl.h mpfr-3.1.0-b/src/mpfr-impl.h
+--- mpfr-3.1.0-a/src/mpfr-impl.h	2011-10-05 21:39:57.000000000 +0000
++++ mpfr-3.1.0-b/src/mpfr-impl.h	2012-02-24 13:50:05.000000000 +0000
+@@ -1592,7 +1592,7 @@
+   do                                                                    \
+     if ((MPFR_LOG_INTERNAL_F & mpfr_log_type) &&                        \
+         (mpfr_log_current <= mpfr_log_level))                           \
+-      LOG_PRINT ("%s.%d:%s[%#Pu]=%.*Rf\n", __func__, __LINE__,          \
++      LOG_PRINT ("%s.%d:%s[%#Pu]=%.*Rg\n", __func__, __LINE__,          \
+                  #x, mpfr_get_prec (x), mpfr_log_prec, x);              \
+   while (0)
+ 
+diff -Naurd mpfr-3.1.0-a/src/mpfr.h mpfr-3.1.0-b/src/mpfr.h
+--- mpfr-3.1.0-a/src/mpfr.h	2012-02-24 12:44:49.000000000 +0000
++++ mpfr-3.1.0-b/src/mpfr.h	2012-02-24 13:50:05.000000000 +0000
+@@ -27,7 +27,7 @@
+ #define MPFR_VERSION_MAJOR 3
+ #define MPFR_VERSION_MINOR 1
+ #define MPFR_VERSION_PATCHLEVEL 0
+-#define MPFR_VERSION_STRING "3.1.0-p5"
++#define MPFR_VERSION_STRING "3.1.0-p6"
+ 
+ /* Macros dealing with MPFR VERSION */
+ #define MPFR_VERSION_NUM(a,b,c) (((a) << 16L) | ((b) << 8) | (c))
+diff -Naurd mpfr-3.1.0-a/src/version.c mpfr-3.1.0-b/src/version.c
+--- mpfr-3.1.0-a/src/version.c	2012-02-24 12:44:49.000000000 +0000
++++ mpfr-3.1.0-b/src/version.c	2012-02-24 13:50:05.000000000 +0000
+@@ -25,5 +25,5 @@
+ const char *
+ mpfr_get_version (void)
+ {
+-  return "3.1.0-p5";
++  return "3.1.0-p6";
+ }
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 6876d6f..c3df710 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MPFR_VERSION = 3.0.1
+MPFR_VERSION = 3.1.0
 MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
 MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.bz2
 MPFR_INSTALL_STAGING = YES
-- 
1.7.3.4
