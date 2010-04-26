From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Apr 2010 23:01:14 +0200
Subject: [Buildroot] [git commit master] cairo: get rid of old patches
Message-ID: <20100426210142.813FD202FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=28200ca3f233480de4179e58099ba5c9f335087c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Haven't been touches for more than 2 years, so lets get rid of them.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...autoconf-macro-AX_C_FLOAT_WORDS_BIGENDIAN.patch |  103 --------------------
 ..._double-to-use-the-magic-number-technique.patch |   79 ---------------
 2 files changed, 0 insertions(+), 182 deletions(-)
 delete mode 100644 package/cairo/old_patches/0001-Add-autoconf-macro-AX_C_FLOAT_WORDS_BIGENDIAN.patch
 delete mode 100644 package/cairo/old_patches/0002-Change-_cairo_fixed_from_double-to-use-the-magic-number-technique.patch

diff --git a/package/cairo/old_patches/0001-Add-autoconf-macro-AX_C_FLOAT_WORDS_BIGENDIAN.patch b/package/cairo/old_patches/0001-Add-autoconf-macro-AX_C_FLOAT_WORDS_BIGENDIAN.patch
deleted file mode 100644
index 90718d4..0000000
--- a/package/cairo/old_patches/0001-Add-autoconf-macro-AX_C_FLOAT_WORDS_BIGENDIAN.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From nobody Mon Sep 17 00:00:00 2001
-From: Dan Amelang <dan@amelang.net>
-Date: Sun Oct 29 21:30:08 2006 -0800
-Subject: [PATCH] Add autoconf macro AX_C_FLOAT_WORDS_BIGENDIAN
-
-The symbol that this macro defines (FLOAT_WORDS_BIGENDIAN) can be used
-to make double arithmetic tricks portable.
-
----
-
- acinclude.m4 |   65 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
- configure.in |    1 +
- 2 files changed, 66 insertions(+), 0 deletions(-)
-
-3231d91b59a6c2e1c40bbaa8b143694b6c693662
-diff --git a/acinclude.m4 b/acinclude.m4
-index af73800..a0eb13a 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -51,3 +51,68 @@ ifelse([$1],[],,
-   AM_CONDITIONAL(ENABLE_GTK_DOC, test x$enable_gtk_doc = xyes)
-   AM_CONDITIONAL(GTK_DOC_USE_LIBTOOL, test -n "$LIBTOOL")
- ])
-+
-+# AX_C_FLOAT_WORDS_BIGENDIAN ([ACTION-IF-TRUE], [ACTION-IF-FALSE],
-+#                             [ACTION-IF-UNKNOWN])
-+#
-+# Checks the ordering of words within a multi-word float. This check
-+# is necessary because on some systems (e.g. certain ARM systems), the
-+# float word ordering can be different from the byte ordering. In a
-+# multi-word float context, "big-endian" implies that the word containing
-+# the sign bit is found in the memory location with the lowest address.
-+# This implemenation was inspired by the AC_C_BIGENDIAN macro in autoconf.
-+# -------------------------------------------------------------------------
-+AC_DEFUN([AX_C_FLOAT_WORDS_BIGENDIAN],
-+  [AC_CACHE_CHECK(whether float word ordering is bigendian,
-+                  ax_cv_c_float_words_bigendian, [
-+
-+# The endianess is detected by first compiling C code that contains a special
-+# double float value, then grepping the resulting object file for certain
-+# strings of ascii values. The double is specially crafted to have a
-+# binary representation that corresponds with a simple string. In this
-+# implementation, the string "noonsees" was selected because the individual
-+# word values ("noon" and "sees") are palindromes, thus making this test
-+# byte-order agnostic. If grep finds the string "noonsees" in the object
-+# file, the target platform stores float words in big-endian order. If grep
-+# finds "seesnoon", float words are in little-endian order. If neither value
-+# is found, the user is instructed to specify the ordering.
-+
-+ax_cv_c_float_words_bigendian=unknown
-+AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
-+
-+double d = 90904234967036810337470478905505011476211692735615632014797120844053488865816695273723469097858056257517020191247487429516932130503560650002327564517570778480236724525140520121371739201496540132640109977779420565776568942592.0;
-+
-+]])], [
-+
-+if grep noonsees conftest.$ac_objext >/dev/null ; then
-+  ax_cv_c_float_words_bigendian=yes
-+fi
-+if grep seesnoon conftest.$ac_objext >/dev/null ; then
-+  if test "$ax_cv_c_float_words_bigendian" = unknown; then
-+    ax_cv_c_float_words_bigendian=no
-+  else
-+    ax_cv_c_float_words_bigendian=unknown
-+  fi
-+fi
-+
-+])])
-+
-+case $ax_cv_c_float_words_bigendian in
-+  yes)
-+    m4_default([$1],
-+      [AC_DEFINE([FLOAT_WORDS_BIGENDIAN], 1,
-+                 [Define to 1 if your system stores words within floats
-+                  with the most significant word first])]) ;;
-+  no)
-+    $2 ;;
-+  *)
-+    m4_default([$3],
-+      [AC_MSG_ERROR([
-+
-+Unknown float word ordering. You need to manually preset
-+ax_cv_c_float_words_bigendian=no (or yes) according to your system.
-+
-+    ])]) ;;
-+esac
-+
-+])# AX_C_FLOAT_WORDS_BIGENDIAN
-diff --git a/configure.in b/configure.in
-index 2d2bf9f..797c7ce 100644
---- a/configure.in
-+++ b/configure.in
-@@ -55,6 +55,7 @@ AC_PROG_CPP
- AC_PROG_LIBTOOL dnl required version (1.4) DON'T REMOVE!
- AC_STDC_HEADERS
- AC_C_BIGENDIAN
-+AX_C_FLOAT_WORDS_BIGENDIAN
- 
- dnl ===========================================================================
- dnl === Local macros
--- 
-1.2.6
-
diff --git a/package/cairo/old_patches/0002-Change-_cairo_fixed_from_double-to-use-the-magic-number-technique.patch b/package/cairo/old_patches/0002-Change-_cairo_fixed_from_double-to-use-the-magic-number-technique.patch
deleted file mode 100644
index 56d8b7e..0000000
--- a/package/cairo/old_patches/0002-Change-_cairo_fixed_from_double-to-use-the-magic-number-technique.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From nobody Mon Sep 17 00:00:00 2001
-From: Dan Amelang <dan@amelang.net>
-Date: Sun Oct 29 21:31:23 2006 -0800
-Subject: [PATCH] Change _cairo_fixed_from_double to use the "magic number" technique
-
-See long thread here:
-http://lists.freedesktop.org/archives/cairo/2006-October/008285.html 
-
----
-
- src/cairo-fixed.c |   48 +++++++++++++++++++++++++++++++++++++++++++++++-
- 1 files changed, 47 insertions(+), 1 deletions(-)
-
-d88acddcabe770e17664b34a2d5f74d3926e1642
-diff --git a/src/cairo-fixed.c b/src/cairo-fixed.c
-index 604c9e7..fe6c2dc 100644
---- a/src/cairo-fixed.c
-+++ b/src/cairo-fixed.c
-@@ -42,10 +42,56 @@ _cairo_fixed_from_int (int i)
-     return i << 16;
- }
- 
-+/* This is the "magic number" approach to converting a double into fixed
-+ * point as described here:
-+ *
-+ * http://www.stereopsis.com/sree/fpu2006.html (an overview)
-+ * http://www.d6.com/users/checker/pdfs/gdmfp.pdf (in detail)
-+ *
-+ * The basic idea is to add a large enough number to the double that the
-+ * literal floating point is moved up to the extent that it forces the
-+ * double's value to be shifted down to the bottom of the mantissa (to make
-+ * room for the large number being added in). Since the mantissa is, at a
-+ * given moment in time, a fixed point integer itself, one can convert a
-+ * float to various fixed point representations by moving around the point
-+ * of a floating point number through arithmetic operations. This behavior
-+ * is reliable on most modern platforms as it is mandated by the IEEE-754
-+ * standard for floating point arithmetic.
-+ *
-+ * For our purposes, a "magic number" must be carefully selected that is
-+ * both large enough to produce the desired point-shifting effect, and also
-+ * has no lower bits in its representation that would interfere with our
-+ * value@the bottom of the mantissa. The magic number is calculated as
-+ * follows:
-+ *
-+ *          (2 ^ (MANTISSA_SIZE - FRACTIONAL_SIZE)) * 1.5
-+ *
-+ * where in our case:
-+ *  - MANTISSA_SIZE for 64-bit doubles is 52
-+ *  - FRACTIONAL_SIZE for 16.16 fixed point is 16
-+ *
-+ * Although this approach provides a very large speedup of this function
-+ * on a wide-array of systems, it does come with two caveats:
-+ *
-+ * 1) It uses banker's rounding as opposed to arithmetic rounding.
-+ * 2) It doesn't function properly if the FPU is in single-precision
-+ *    mode.
-+ */
-+#define CAIRO_MAGIC_NUMBER_FIXED_16_16 (103079215104.0)
- cairo_fixed_t
- _cairo_fixed_from_double (double d)
- {
--    return (cairo_fixed_t) floor (d * 65536 + 0.5);
-+    union {
-+        double d;
-+        int32_t i[2];
-+    } u;
-+
-+    u.d = d + CAIRO_MAGIC_NUMBER_FIXED_16_16;
-+#ifdef FLOAT_WORDS_BIGENDIAN
-+    return u.i[1];
-+#else
-+    return u.i[0];
-+#endif
- }
- 
- cairo_fixed_t
--- 
-1.2.6
-
-- 
1.6.3.3
