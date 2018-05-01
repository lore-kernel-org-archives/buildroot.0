From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 21:45:13 +0200
Subject: [Buildroot] [git commit] libidn: bump to version 1.34
Message-ID: <20180501194521.8B9298AC85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5097bc00e340c83ef5124c06a8c6599d1876c27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove both patches (already in version)
- Remove AUTORECONF = YES (patch removed)
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ycode.c-decode_digit-Fix-integer-overflow.patch |  36 ---
 ...Update-intprops.h-for-gcc-7-compatibility.patch | 333 ---------------------
 package/libidn/libidn.hash                         |  11 +-
 package/libidn/libidn.mk                           |   4 +-
 4 files changed, 9 insertions(+), 375 deletions(-)

diff --git a/package/libidn/0001-lib-punycode.c-decode_digit-Fix-integer-overflow.patch b/package/libidn/0001-lib-punycode.c-decode_digit-Fix-integer-overflow.patch
deleted file mode 100644
index 8a8ca47a66..0000000000
--- a/package/libidn/0001-lib-punycode.c-decode_digit-Fix-integer-overflow.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From e9e81b8063b095b02cf104bb992fa9bf9515b9d8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
-Date: Fri, 1 Sep 2017 10:04:48 +0200
-Subject: [PATCH] lib/punycode.c (decode_digit): Fix integer overflow
-
-This fix is a backport from libidn2 and addresses
-CVE-2017-14062.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit e9e81b8063b095
-
- lib/punycode.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/lib/punycode.c b/lib/punycode.c
-index 86819a7deb85..49250a13e2cc 100644
---- a/lib/punycode.c
-+++ b/lib/punycode.c
-@@ -88,10 +88,10 @@ enum
- /* point (for use in representing integers) in the range 0 to */
- /* base-1, or base if cp does not represent a value.          */
- 
--static punycode_uint
--decode_digit (punycode_uint cp)
-+static unsigned
-+decode_digit (int cp)
- {
--  return cp - 48 < 10 ? cp - 22 : cp - 65 < 26 ? cp - 65 :
-+  return (unsigned) cp - 48 < 10 ? cp - 22 : cp - 65 < 26 ? cp - 65 :
-     cp - 97 < 26 ? cp - 97 : base;
- }
- 
--- 
-2.14.1
-
diff --git a/package/libidn/0002-Update-intprops.h-for-gcc-7-compatibility.patch b/package/libidn/0002-Update-intprops.h-for-gcc-7-compatibility.patch
deleted file mode 100644
index 89720442e5..0000000000
--- a/package/libidn/0002-Update-intprops.h-for-gcc-7-compatibility.patch
+++ /dev/null
@@ -1,333 +0,0 @@
-From bd705da12e244dda18474a54a2942591e5ef5148 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
-Date: Wed, 1 Feb 2017 10:44:36 +0100
-Subject: [PATCH] Update intprops.h for gcc-7 compatibility
-
-[Backport from upstream commit 230930b3bc3e431b819eb45420cb42475d83ca93.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- gl/intprops.h          | 65 ++++++++++++++++++++++++++++++--------------------
- lib/gltests/intprops.h | 65 ++++++++++++++++++++++++++++++--------------------
- 2 files changed, 78 insertions(+), 52 deletions(-)
-
-diff --git a/gl/intprops.h b/gl/intprops.h
-index e1fce5c9..eb06b691 100644
---- a/gl/intprops.h
-+++ b/gl/intprops.h
-@@ -1,18 +1,18 @@
- /* intprops.h -- properties of integer types
- 
--   Copyright (C) 2001-2016 Free Software Foundation, Inc.
-+   Copyright (C) 2001-2017 Free Software Foundation, Inc.
- 
-    This program is free software: you can redistribute it and/or modify it
--   under the terms of the GNU General Public License as published
--   by the Free Software Foundation; either version 3 of the License, or
-+   under the terms of the GNU Lesser General Public License as published
-+   by the Free Software Foundation; either version 2.1 of the License, or
-    (at your option) any later version.
- 
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--   GNU General Public License for more details.
-+   GNU Lesser General Public License for more details.
- 
--   You should have received a copy of the GNU General Public License
-+   You should have received a copy of the GNU Lesser General Public License
-    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
- 
- /* Written by Paul Eggert.  */
-@@ -47,12 +47,16 @@
- 
- /* Minimum and maximum values for integer types and expressions.  */
- 
-+/* The width in bits of the integer type or expression T.
-+   Padding bits are not supported; this is checked at compile-time below.  */
-+#define TYPE_WIDTH(t) (sizeof (t) * CHAR_BIT)
-+
- /* The maximum and minimum values for the integer type T.  */
- #define TYPE_MINIMUM(t) ((t) ~ TYPE_MAXIMUM (t))
- #define TYPE_MAXIMUM(t)                                                 \
-   ((t) (! TYPE_SIGNED (t)                                               \
-         ? (t) -1                                                        \
--        : ((((t) 1 << (sizeof (t) * CHAR_BIT - 2)) - 1) * 2 + 1)))
-+        : ((((t) 1 << (TYPE_WIDTH (t) - 2)) - 1) * 2 + 1)))
- 
- /* The maximum and minimum values for the type of the expression E,
-    after integer promotion.  E should not have side effects.  */
-@@ -65,7 +69,13 @@
-    ? _GL_SIGNED_INT_MAXIMUM (e)                                         \
-    : _GL_INT_NEGATE_CONVERT (e, 1))
- #define _GL_SIGNED_INT_MAXIMUM(e)                                       \
--  (((_GL_INT_CONVERT (e, 1) << (sizeof ((e) + 0) * CHAR_BIT - 2)) - 1) * 2 + 1)
-+  (((_GL_INT_CONVERT (e, 1) << (TYPE_WIDTH ((e) + 0) - 2)) - 1) * 2 + 1)
-+
-+/* Work around OpenVMS incompatibility with C99.  */
-+#if !defined LLONG_MAX && defined __INT64_MAX
-+# define LLONG_MAX __INT64_MAX
-+# define LLONG_MIN __INT64_MIN
-+#endif
- 
- /* This include file assumes that signed types are two's complement without
-    padding bits; the above macros have undefined behavior otherwise.
-@@ -84,10 +94,15 @@ verify (TYPE_MAXIMUM (long int) == LONG_MAX);
- verify (TYPE_MINIMUM (long long int) == LLONG_MIN);
- verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
- #endif
-+/* Similarly, sanity-check one ISO/IEC TS 18661-1:2014 macro if defined.  */
-+#ifdef UINT_WIDTH
-+verify (TYPE_WIDTH (unsigned int) == UINT_WIDTH);
-+#endif
- 
- /* Does the __typeof__ keyword work?  This could be done by
-    'configure', but for now it's easier to do it by hand.  */
--#if (2 <= __GNUC__ || defined __IBM__TYPEOF__ \
-+#if (2 <= __GNUC__ \
-+     || (1210 <= __IBMC__ && defined __IBM__TYPEOF__) \
-      || (0x5110 <= __SUNPRO_C && !__STDC__))
- # define _GL_HAVE___TYPEOF__ 1
- #else
-@@ -116,8 +131,7 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
-    signed, this macro may overestimate the true bound by one byte when
-    applied to unsigned types of size 2, 4, 16, ... bytes.  */
- #define INT_STRLEN_BOUND(t)                                     \
--  (INT_BITS_STRLEN_BOUND (sizeof (t) * CHAR_BIT                 \
--                          - _GL_SIGNED_TYPE_OR_EXPR (t))        \
-+  (INT_BITS_STRLEN_BOUND (TYPE_WIDTH (t) - _GL_SIGNED_TYPE_OR_EXPR (t)) \
-    + _GL_SIGNED_TYPE_OR_EXPR (t))
- 
- /* Bound on buffer size needed to represent an integer type or expression T,
-@@ -222,20 +236,23 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
-    ? (a) < (min) >> (b)                                 \
-    : (max) >> (b) < (a))
- 
--/* True if __builtin_add_overflow (A, B, P) works when P is null.  */
--#define _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL (7 <= __GNUC__)
-+/* True if __builtin_add_overflow (A, B, P) works when P is non-null.  */
-+#define _GL_HAS_BUILTIN_OVERFLOW (5 <= __GNUC__)
-+
-+/* True if __builtin_add_overflow_p (A, B, C) works.  */
-+#define _GL_HAS_BUILTIN_OVERFLOW_P (7 <= __GNUC__)
- 
- /* The _GL*_OVERFLOW macros have the same restrictions as the
-    *_RANGE_OVERFLOW macros, except that they do not assume that operands
-    (e.g., A and B) have the same type as MIN and MAX.  Instead, they assume
-    that the result (e.g., A + B) has that type.  */
--#if _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL
--# define _GL_ADD_OVERFLOW(a, b, min, max)
--   __builtin_add_overflow (a, b, (__typeof__ ((a) + (b)) *) 0)
--# define _GL_SUBTRACT_OVERFLOW(a, b, min, max)
--   __builtin_sub_overflow (a, b, (__typeof__ ((a) - (b)) *) 0)
--# define _GL_MULTIPLY_OVERFLOW(a, b, min, max)
--   __builtin_mul_overflow (a, b, (__typeof__ ((a) * (b)) *) 0)
-+#if _GL_HAS_BUILTIN_OVERFLOW_P
-+# define _GL_ADD_OVERFLOW(a, b, min, max)                               \
-+   __builtin_add_overflow_p (a, b, (__typeof__ ((a) + (b))) 0)
-+# define _GL_SUBTRACT_OVERFLOW(a, b, min, max)                          \
-+   __builtin_sub_overflow_p (a, b, (__typeof__ ((a) - (b))) 0)
-+# define _GL_MULTIPLY_OVERFLOW(a, b, min, max)                          \
-+   __builtin_mul_overflow_p (a, b, (__typeof__ ((a) * (b))) 0)
- #else
- # define _GL_ADD_OVERFLOW(a, b, min, max)                                \
-    ((min) < 0 ? INT_ADD_RANGE_OVERFLOW (a, b, min, max)                  \
-@@ -315,7 +332,7 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
-   _GL_BINARY_OP_OVERFLOW (a, b, _GL_ADD_OVERFLOW)
- #define INT_SUBTRACT_OVERFLOW(a, b) \
-   _GL_BINARY_OP_OVERFLOW (a, b, _GL_SUBTRACT_OVERFLOW)
--#if _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL
-+#if _GL_HAS_BUILTIN_OVERFLOW_P
- # define INT_NEGATE_OVERFLOW(a) INT_SUBTRACT_OVERFLOW (0, a)
- #else
- # define INT_NEGATE_OVERFLOW(a) \
-@@ -349,10 +366,6 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
- #define INT_MULTIPLY_WRAPV(a, b, r) \
-   _GL_INT_OP_WRAPV (a, b, r, *, __builtin_mul_overflow, INT_MULTIPLY_OVERFLOW)
- 
--#ifndef __has_builtin
--# define __has_builtin(x) 0
--#endif
--
- /* Nonzero if this compiler has GCC bug 68193 or Clang bug 25390.  See:
-    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68193
-    https://llvm.org/bugs/show_bug.cgi?id=25390
-@@ -369,7 +382,7 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
-    the operation.  BUILTIN is the builtin operation, and OVERFLOW the
-    overflow predicate.  Return 1 if the result overflows.  See above
-    for restrictions.  */
--#if 5 <= __GNUC__ || __has_builtin (__builtin_add_overflow)
-+#if _GL_HAS_BUILTIN_OVERFLOW
- # define _GL_INT_OP_WRAPV(a, b, r, op, builtin, overflow) builtin (a, b, r)
- #elif 201112 <= __STDC_VERSION__ && !_GL__GENERIC_BOGUS
- # define _GL_INT_OP_WRAPV(a, b, r, op, builtin, overflow) \
-@@ -412,7 +425,7 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
- # else
- #  define _GL_INT_OP_WRAPV_LONGISH(a, b, r, op, overflow) \
-     _GL_INT_OP_CALC (a, b, r, op, overflow, unsigned long int, \
--                     long int, LONG_MIN, LONG_MAX))
-+                     long int, LONG_MIN, LONG_MAX)
- # endif
- #endif
- 
-diff --git a/lib/gltests/intprops.h b/lib/gltests/intprops.h
-index e1fce5c9..eb06b691 100644
---- a/lib/gltests/intprops.h
-+++ b/lib/gltests/intprops.h
-@@ -1,18 +1,18 @@
- /* intprops.h -- properties of integer types
- 
--   Copyright (C) 2001-2016 Free Software Foundation, Inc.
-+   Copyright (C) 2001-2017 Free Software Foundation, Inc.
- 
-    This program is free software: you can redistribute it and/or modify it
--   under the terms of the GNU General Public License as published
--   by the Free Software Foundation; either version 3 of the License, or
-+   under the terms of the GNU Lesser General Public License as published
-+   by the Free Software Foundation; either version 2.1 of the License, or
-    (at your option) any later version.
- 
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--   GNU General Public License for more details.
-+   GNU Lesser General Public License for more details.
- 
--   You should have received a copy of the GNU General Public License
-+   You should have received a copy of the GNU Lesser General Public License
-    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
- 
- /* Written by Paul Eggert.  */
-@@ -47,12 +47,16 @@
- 
- /* Minimum and maximum values for integer types and expressions.  */
- 
-+/* The width in bits of the integer type or expression T.
-+   Padding bits are not supported; this is checked at compile-time below.  */
-+#define TYPE_WIDTH(t) (sizeof (t) * CHAR_BIT)
-+
- /* The maximum and minimum values for the integer type T.  */
- #define TYPE_MINIMUM(t) ((t) ~ TYPE_MAXIMUM (t))
- #define TYPE_MAXIMUM(t)                                                 \
-   ((t) (! TYPE_SIGNED (t)                                               \
-         ? (t) -1                                                        \
--        : ((((t) 1 << (sizeof (t) * CHAR_BIT - 2)) - 1) * 2 + 1)))
-+        : ((((t) 1 << (TYPE_WIDTH (t) - 2)) - 1) * 2 + 1)))
- 
- /* The maximum and minimum values for the type of the expression E,
-    after integer promotion.  E should not have side effects.  */
-@@ -65,7 +69,13 @@
-    ? _GL_SIGNED_INT_MAXIMUM (e)                                         \
-    : _GL_INT_NEGATE_CONVERT (e, 1))
- #define _GL_SIGNED_INT_MAXIMUM(e)                                       \
--  (((_GL_INT_CONVERT (e, 1) << (sizeof ((e) + 0) * CHAR_BIT - 2)) - 1) * 2 + 1)
-+  (((_GL_INT_CONVERT (e, 1) << (TYPE_WIDTH ((e) + 0) - 2)) - 1) * 2 + 1)
-+
-+/* Work around OpenVMS incompatibility with C99.  */
-+#if !defined LLONG_MAX && defined __INT64_MAX
-+# define LLONG_MAX __INT64_MAX
-+# define LLONG_MIN __INT64_MIN
-+#endif
- 
- /* This include file assumes that signed types are two's complement without
-    padding bits; the above macros have undefined behavior otherwise.
-@@ -84,10 +94,15 @@ verify (TYPE_MAXIMUM (long int) == LONG_MAX);
- verify (TYPE_MINIMUM (long long int) == LLONG_MIN);
- verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
- #endif
-+/* Similarly, sanity-check one ISO/IEC TS 18661-1:2014 macro if defined.  */
-+#ifdef UINT_WIDTH
-+verify (TYPE_WIDTH (unsigned int) == UINT_WIDTH);
-+#endif
- 
- /* Does the __typeof__ keyword work?  This could be done by
-    'configure', but for now it's easier to do it by hand.  */
--#if (2 <= __GNUC__ || defined __IBM__TYPEOF__ \
-+#if (2 <= __GNUC__ \
-+     || (1210 <= __IBMC__ && defined __IBM__TYPEOF__) \
-      || (0x5110 <= __SUNPRO_C && !__STDC__))
- # define _GL_HAVE___TYPEOF__ 1
- #else
-@@ -116,8 +131,7 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
-    signed, this macro may overestimate the true bound by one byte when
-    applied to unsigned types of size 2, 4, 16, ... bytes.  */
- #define INT_STRLEN_BOUND(t)                                     \
--  (INT_BITS_STRLEN_BOUND (sizeof (t) * CHAR_BIT                 \
--                          - _GL_SIGNED_TYPE_OR_EXPR (t))        \
-+  (INT_BITS_STRLEN_BOUND (TYPE_WIDTH (t) - _GL_SIGNED_TYPE_OR_EXPR (t)) \
-    + _GL_SIGNED_TYPE_OR_EXPR (t))
- 
- /* Bound on buffer size needed to represent an integer type or expression T,
-@@ -222,20 +236,23 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
-    ? (a) < (min) >> (b)                                 \
-    : (max) >> (b) < (a))
- 
--/* True if __builtin_add_overflow (A, B, P) works when P is null.  */
--#define _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL (7 <= __GNUC__)
-+/* True if __builtin_add_overflow (A, B, P) works when P is non-null.  */
-+#define _GL_HAS_BUILTIN_OVERFLOW (5 <= __GNUC__)
-+
-+/* True if __builtin_add_overflow_p (A, B, C) works.  */
-+#define _GL_HAS_BUILTIN_OVERFLOW_P (7 <= __GNUC__)
- 
- /* The _GL*_OVERFLOW macros have the same restrictions as the
-    *_RANGE_OVERFLOW macros, except that they do not assume that operands
-    (e.g., A and B) have the same type as MIN and MAX.  Instead, they assume
-    that the result (e.g., A + B) has that type.  */
--#if _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL
--# define _GL_ADD_OVERFLOW(a, b, min, max)
--   __builtin_add_overflow (a, b, (__typeof__ ((a) + (b)) *) 0)
--# define _GL_SUBTRACT_OVERFLOW(a, b, min, max)
--   __builtin_sub_overflow (a, b, (__typeof__ ((a) - (b)) *) 0)
--# define _GL_MULTIPLY_OVERFLOW(a, b, min, max)
--   __builtin_mul_overflow (a, b, (__typeof__ ((a) * (b)) *) 0)
-+#if _GL_HAS_BUILTIN_OVERFLOW_P
-+# define _GL_ADD_OVERFLOW(a, b, min, max)                               \
-+   __builtin_add_overflow_p (a, b, (__typeof__ ((a) + (b))) 0)
-+# define _GL_SUBTRACT_OVERFLOW(a, b, min, max)                          \
-+   __builtin_sub_overflow_p (a, b, (__typeof__ ((a) - (b))) 0)
-+# define _GL_MULTIPLY_OVERFLOW(a, b, min, max)                          \
-+   __builtin_mul_overflow_p (a, b, (__typeof__ ((a) * (b))) 0)
- #else
- # define _GL_ADD_OVERFLOW(a, b, min, max)                                \
-    ((min) < 0 ? INT_ADD_RANGE_OVERFLOW (a, b, min, max)                  \
-@@ -315,7 +332,7 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
-   _GL_BINARY_OP_OVERFLOW (a, b, _GL_ADD_OVERFLOW)
- #define INT_SUBTRACT_OVERFLOW(a, b) \
-   _GL_BINARY_OP_OVERFLOW (a, b, _GL_SUBTRACT_OVERFLOW)
--#if _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL
-+#if _GL_HAS_BUILTIN_OVERFLOW_P
- # define INT_NEGATE_OVERFLOW(a) INT_SUBTRACT_OVERFLOW (0, a)
- #else
- # define INT_NEGATE_OVERFLOW(a) \
-@@ -349,10 +366,6 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
- #define INT_MULTIPLY_WRAPV(a, b, r) \
-   _GL_INT_OP_WRAPV (a, b, r, *, __builtin_mul_overflow, INT_MULTIPLY_OVERFLOW)
- 
--#ifndef __has_builtin
--# define __has_builtin(x) 0
--#endif
--
- /* Nonzero if this compiler has GCC bug 68193 or Clang bug 25390.  See:
-    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68193
-    https://llvm.org/bugs/show_bug.cgi?id=25390
-@@ -369,7 +382,7 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
-    the operation.  BUILTIN is the builtin operation, and OVERFLOW the
-    overflow predicate.  Return 1 if the result overflows.  See above
-    for restrictions.  */
--#if 5 <= __GNUC__ || __has_builtin (__builtin_add_overflow)
-+#if _GL_HAS_BUILTIN_OVERFLOW
- # define _GL_INT_OP_WRAPV(a, b, r, op, builtin, overflow) builtin (a, b, r)
- #elif 201112 <= __STDC_VERSION__ && !_GL__GENERIC_BOGUS
- # define _GL_INT_OP_WRAPV(a, b, r, op, builtin, overflow) \
-@@ -412,7 +425,7 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
- # else
- #  define _GL_INT_OP_WRAPV_LONGISH(a, b, r, op, overflow) \
-     _GL_INT_OP_CALC (a, b, r, op, overflow, unsigned long int, \
--                     long int, LONG_MIN, LONG_MAX))
-+                     long int, LONG_MIN, LONG_MAX)
- # endif
- #endif
- 
--- 
-2.13.6
-
diff --git a/package/libidn/libidn.hash b/package/libidn/libidn.hash
index 4658a3e857..0d03342447 100644
--- a/package/libidn/libidn.hash
+++ b/package/libidn/libidn.hash
@@ -1,4 +1,9 @@
-# From http://lists.nongnu.org/archive/html/help-libidn/2016-07/msg00009.html
-sha1	57872fdc665dcc585e16f4ac0bb35374b1103f7e	libidn-1.33.tar.gz
+# From http://lists.nongnu.org/archive/html/help-libidn/2018-03/msg00006.html
+sha1	8701e3d01df25431802ce483756ecad698156835	libidn-1.34.tar.gz
 # Calculated based on the hash above
-sha256	44a7aab635bb721ceef6beecc4d49dfd19478325e1b47f3196f7d2acc4930e19	libidn-1.33.tar.gz
+sha256	3719e2975f2fb28605df3479c380af2cf4ab4e919e1506527e4c7670afff6e3c	libidn-1.34.tar.gz
+
+# Hash for license files:
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYINGv2
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYINGv3
+sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768	COPYING.LESSERv3
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index b50a8b622f..77733edaa9 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN_VERSION = 1.33
+LIBIDN_VERSION = 1.34
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no" MAKEINFO=true
@@ -12,8 +12,6 @@ LIBIDN_CONF_OPTS = --disable-java --enable-csharp=no
 LIBIDN_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LIBIDN_LICENSE = GPL-2.0+, GPL-3.0+, LGPL-3.0+
 LIBIDN_LICENSE_FILES = COPYINGv2 COPYINGv3 COPYING.LESSERv3
-# lib/punycode.c patch triggers reconf in doc/
-LIBIDN_AUTORECONF = YES
 
 define LIBIDN_REMOVE_BINARY
 	rm -f $(TARGET_DIR)/usr/bin/idn
