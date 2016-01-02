From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat,  2 Jan 2016 12:11:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/boost: add patch to fix libquadmath
	issue
Message-ID: <1451733095-26811-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport patch from upstream [1] to fix build issues with toolchains not
providing libquadmath, but still supporting __float128.

Fixes:
http://autobuild.buildroot.net/results/fcc/fccb40e7b05b84275cfe36a890cedbbaaaa4f953/
http://autobuild.buildroot.net/results/cfc/cfcc6c44d2225b9baf0fd92d3cfba4922bfb248b/
http://autobuild.buildroot.net/results/ab1/ab1a5aceedb7f9edcd5536b601f1ffb66c5fe1e8/
http://autobuild.buildroot.net/results/1ed/1ed3c1ae1e31325b49dd05c1f616637bb5e6382d/
http://autobuild.buildroot.net/results/9e5/9e53a5aff9966c6f26e705c91d13692107452feb/
and many more.

Backported from: 74ff2db959c5fa75bec770c41ed2951a740fe936

[1]
https://github.com/boostorg/math/commit/74ff2db959c5fa75bec770c41ed2951a740fe936

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/boost/0003-fix-libquadmath-issue.patch | 91 ++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 package/boost/0003-fix-libquadmath-issue.patch

diff --git a/package/boost/0003-fix-libquadmath-issue.patch b/package/boost/0003-fix-libquadmath-issue.patch
new file mode 100644
index 0000000..33959ce
--- /dev/null
+++ b/package/boost/0003-fix-libquadmath-issue.patch
@@ -0,0 +1,91 @@
+From 74ff2db959c5fa75bec770c41ed2951a740fe936 Mon Sep 17 00:00:00 2001
+From: jzmaddock <jz.maddock@gmail.com>
+Date: Fri, 1 Jan 2016 16:49:48 +0000
+Subject: [PATCH] Change <quadmath.h> config to not use it at all if we don't
+ have __has_include as GCC may be configured with --disable-libquadmath but
+ still signal that it supports __float128
+
+Backported from: 74ff2db959c5fa75bec770c41ed2951a740fe936
+
+[J?rg Krause: adjust pathes to match sourceforge release tarball]
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+
+---
+ boost/math/special_functions/fpclassify.hpp | 16 +++++++++++++---
+ boost/math/tools/config.hpp                 | 12 ------------
+ 2 files changed, 13 insertions(+), 15 deletions(-)
+
+diff --git a/boost/math/special_functions/fpclassify.hpp b/boost/math/special_functions/fpclassify.hpp
+index 0a4e1ac..58fad13 100644
+--- a/boost/math/special_functions/fpclassify.hpp
++++ b/boost/math/special_functions/fpclassify.hpp
+@@ -81,7 +81,12 @@ is used.
+ #include <float.h>
+ #endif
+ #ifdef BOOST_MATH_USE_FLOAT128
++#ifdef __has_include
++#if  __has_include("quadmath.h")
+ #include "quadmath.h"
++#define BOOST_MATH_HAS_QUADMATH_H
++#endif
++#endif
+ #endif
+ 
+ #ifdef BOOST_NO_STDC_NAMESPACE
+@@ -124,9 +129,14 @@ inline bool is_nan_helper(T, const boost::false_type&)
+ {
+    return false;
+ }
+-#ifdef BOOST_MATH_USE_FLOAT128
++#if defined(BOOST_MATH_USE_FLOAT128) 
++#if defined(BOOST_MATH_HAS_QUADMATH_H)
+ inline bool is_nan_helper(__float128 f, const boost::true_type&) { return ::isnanq(f); }
+ inline bool is_nan_helper(__float128 f, const boost::false_type&) { return ::isnanq(f); }
++#else
++inline bool is_nan_helper(__float128 f, const boost::true_type&) { return ::isnan(static_cast<double>(f)); }
++inline bool is_nan_helper(__float128 f, const boost::false_type&) { return ::isnan(static_cast<double>(f)); }
++#endif
+ #endif
+ }
+ 
+@@ -519,7 +529,7 @@ inline bool (isinf)(long double x)
+    return detail::isinf_impl(static_cast<value_type>(x), method());
+ }
+ #endif
+-#ifdef BOOST_MATH_USE_FLOAT128
++#if defined(BOOST_MATH_USE_FLOAT128) && defined(BOOST_MATH_HAS_QUADMATH_H)
+ template<>
+ inline bool (isinf)(__float128 x)
+ {
+@@ -611,7 +621,7 @@ inline bool (isnan)(long double x)
+    return detail::isnan_impl(x, method());
+ }
+ #endif
+-#ifdef BOOST_MATH_USE_FLOAT128
++#if defined(BOOST_MATH_USE_FLOAT128) && defined(BOOST_MATH_HAS_QUADMATH_H)
+ template<>
+ inline bool (isnan)(__float128 x)
+ {
+diff --git a/boost/math/tools/config.hpp b/boost/math/tools/config.hpp
+index ffd0ab4..75d29b6 100644
+--- a/boost/math/tools/config.hpp
++++ b/boost/math/tools/config.hpp
+@@ -265,18 +265,6 @@
+ #  define BOOST_MATH_INT_VALUE_SUFFIX(RV, SUF) RV##SUF
+ #endif
+ //
+-// Test whether to support __float128, if we don't have quadmath.h then this can't currently work:
+-//
+-#ifndef BOOST_MATH_USE_FLOAT128
+-#ifdef __has_include
+-#if ! __has_include("quadmath.h")
+-#define BOOST_MATH_DISABLE_FLOAT128
+-#endif
+-#elif !defined(BOOST_ARCH_X86)
+-#define BOOST_MATH_DISABLE_FLOAT128
+-#endif
+-#endif
+-//
+ // And then the actual configuration:
+ //
+ #if defined(_GLIBCXX_USE_FLOAT128) && defined(BOOST_GCC) && !defined(__STRICT_ANSI__) \
-- 
2.6.4
