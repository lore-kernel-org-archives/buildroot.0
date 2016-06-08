From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 07:55:54 +0200
Subject: [Buildroot] [git commit] package/boost: bump version to 1.61.0
Message-ID: <20160608055647.8F91A81F9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7bc7b5564db3f95fc9f2ac626941059660af9e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

removed patches applied upstream, renumbered remaining patches.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/{0006-fenv.patch => 0003-fenv.patch} |  0
 package/boost/0003-fix-libquadmath-issue.patch     | 91 ----------------------
 .../0004-fix-declaration-error-with-gcc-4-4.patch  | 50 ------------
 ...ix-getchar-with-uclibc-and-gcc-bug-58952.patch} |  0
 package/boost/0005-fix-undeclared-isnan.patch      | 32 --------
 package/boost/boost.hash                           |  6 +-
 package/boost/boost.mk                             |  2 +-
 7 files changed, 4 insertions(+), 177 deletions(-)

diff --git a/package/boost/0006-fenv.patch b/package/boost/0003-fenv.patch
similarity index 100%
rename from package/boost/0006-fenv.patch
rename to package/boost/0003-fenv.patch
diff --git a/package/boost/0003-fix-libquadmath-issue.patch b/package/boost/0003-fix-libquadmath-issue.patch
deleted file mode 100644
index 49772e8..0000000
--- a/package/boost/0003-fix-libquadmath-issue.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 74ff2db959c5fa75bec770c41ed2951a740fe936 Mon Sep 17 00:00:00 2001
-From: jzmaddock <jz.maddock@gmail.com>
-Date: Fri, 1 Jan 2016 16:49:48 +0000
-Subject: [PATCH] Change <quadmath.h> config to not use it at all if we don't
- have __has_include as GCC may be configured with --disable-libquadmath but
- still signal that it supports __float128
-
-Backported from: 74ff2db959c5fa75bec770c41ed2951a740fe936
-
-[J??rg Krause: adjust pathes to match sourceforge release tarball]
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
-
----
- boost/math/special_functions/fpclassify.hpp | 16 +++++++++++++---
- boost/math/tools/config.hpp                 | 12 ------------
- 2 files changed, 13 insertions(+), 15 deletions(-)
-
-diff --git a/boost/math/special_functions/fpclassify.hpp b/boost/math/special_functions/fpclassify.hpp
-index 0a4e1ac..58fad13 100644
---- a/boost/math/special_functions/fpclassify.hpp
-+++ b/boost/math/special_functions/fpclassify.hpp
-@@ -81,7 +81,12 @@ is used.
- #include <float.h>
- #endif
- #ifdef BOOST_MATH_USE_FLOAT128
-+#ifdef __has_include
-+#if  __has_include("quadmath.h")
- #include "quadmath.h"
-+#define BOOST_MATH_HAS_QUADMATH_H
-+#endif
-+#endif
- #endif
- 
- #ifdef BOOST_NO_STDC_NAMESPACE
-@@ -124,9 +129,14 @@ inline bool is_nan_helper(T, const boost::false_type&)
- {
-    return false;
- }
--#ifdef BOOST_MATH_USE_FLOAT128
-+#if defined(BOOST_MATH_USE_FLOAT128) 
-+#if defined(BOOST_MATH_HAS_QUADMATH_H)
- inline bool is_nan_helper(__float128 f, const boost::true_type&) { return ::isnanq(f); }
- inline bool is_nan_helper(__float128 f, const boost::false_type&) { return ::isnanq(f); }
-+#else
-+inline bool is_nan_helper(__float128 f, const boost::true_type&) { return ::isnan(static_cast<double>(f)); }
-+inline bool is_nan_helper(__float128 f, const boost::false_type&) { return ::isnan(static_cast<double>(f)); }
-+#endif
- #endif
- }
- 
-@@ -519,7 +529,7 @@ inline bool (isinf)(long double x)
-    return detail::isinf_impl(static_cast<value_type>(x), method());
- }
- #endif
--#ifdef BOOST_MATH_USE_FLOAT128
-+#if defined(BOOST_MATH_USE_FLOAT128) && defined(BOOST_MATH_HAS_QUADMATH_H)
- template<>
- inline bool (isinf)(__float128 x)
- {
-@@ -611,7 +621,7 @@ inline bool (isnan)(long double x)
-    return detail::isnan_impl(x, method());
- }
- #endif
--#ifdef BOOST_MATH_USE_FLOAT128
-+#if defined(BOOST_MATH_USE_FLOAT128) && defined(BOOST_MATH_HAS_QUADMATH_H)
- template<>
- inline bool (isnan)(__float128 x)
- {
-diff --git a/boost/math/tools/config.hpp b/boost/math/tools/config.hpp
-index ffd0ab4..75d29b6 100644
---- a/boost/math/tools/config.hpp
-+++ b/boost/math/tools/config.hpp
-@@ -265,18 +265,6 @@
- #  define BOOST_MATH_INT_VALUE_SUFFIX(RV, SUF) RV##SUF
- #endif
- //
--// Test whether to support __float128, if we don't have quadmath.h then this can't currently work:
--//
--#ifndef BOOST_MATH_USE_FLOAT128
--#ifdef __has_include
--#if ! __has_include("quadmath.h")
--#define BOOST_MATH_DISABLE_FLOAT128
--#endif
--#elif !defined(BOOST_ARCH_X86)
--#define BOOST_MATH_DISABLE_FLOAT128
--#endif
--#endif
--//
- // And then the actual configuration:
- //
- #if defined(_GLIBCXX_USE_FLOAT128) && defined(BOOST_GCC) && !defined(__STRICT_ANSI__) \
diff --git a/package/boost/0004-fix-declaration-error-with-gcc-4-4.patch b/package/boost/0004-fix-declaration-error-with-gcc-4-4.patch
deleted file mode 100644
index 073ec04..0000000
--- a/package/boost/0004-fix-declaration-error-with-gcc-4-4.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From a4e9686f8a0258bc30f9da2abab65673d6b9bd50 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jupp=20M=C3=BCller?= <jupp0r@gmail.com>
-Date: Wed, 23 Dec 2015 09:18:51 +0100
-Subject: [PATCH] Fix declaration changes meaning error with GCC 4.4.7 (#11856)
-
-Backported from a4e9686f8a0258bc30f9da2abab65673d6b9bd50
-
-[J??rg Krause: adjust pathes to match sourceforge release tarball]
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
-
----
- libs/container/src/pool_resource.cpp | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/libs/container/src/pool_resource.cpp b/libs/container/src/pool_resource.cpp
-index 4df7ee2..45f1564 100644
---- a/libs/container/src/pool_resource.cpp
-+++ b/libs/container/src/pool_resource.cpp
-@@ -32,11 +32,11 @@ namespace pmr {
- class pool_data_t
-    : public block_slist_base<>
- {
--   typedef block_slist_base<> block_slist_base;
-+   typedef block_slist_base<> block_slist_base_t;
- 
-    public:
-    explicit pool_data_t(std::size_t initial_blocks_per_chunk)
--      : block_slist_base(), next_blocks_per_chunk(initial_blocks_per_chunk)
-+      : block_slist_base_t(), next_blocks_per_chunk(initial_blocks_per_chunk)
-    {  slist_algo::init_header(&free_slist);  }
- 
-    void *allocate_block() BOOST_NOEXCEPT
-@@ -59,7 +59,7 @@ class pool_data_t
-    void release(memory_resource &upstream)
-    {
-       slist_algo::init_header(&free_slist);
--      this->block_slist_base::release(upstream);
-+      this->block_slist_base_t::release(upstream);
-       next_blocks_per_chunk = pool_options_minimum_max_blocks_per_chunk;
-    }
- 
-@@ -72,7 +72,7 @@ class pool_data_t
-       
-       //Minimum block size is at least max_align, so all pools allocate sizes that are multiple of max_align,
-       //meaning that all blocks are max_align-aligned.
--      char *p = static_cast<char *>(block_slist_base::allocate(blocks_per_chunk*pool_block, mr));
-+      char *p = static_cast<char *>(block_slist_base_t::allocate(blocks_per_chunk*pool_block, mr));
- 
-       //Create header types. This is no-throw
-       for(std::size_t i = 0, max = blocks_per_chunk; i != max; ++i){
diff --git a/package/boost/0007-fix-getchar-with-uclibc-and-gcc-bug-58952.patch b/package/boost/0004-fix-getchar-with-uclibc-and-gcc-bug-58952.patch
similarity index 100%
rename from package/boost/0007-fix-getchar-with-uclibc-and-gcc-bug-58952.patch
rename to package/boost/0004-fix-getchar-with-uclibc-and-gcc-bug-58952.patch
diff --git a/package/boost/0005-fix-undeclared-isnan.patch b/package/boost/0005-fix-undeclared-isnan.patch
deleted file mode 100644
index 95d8fed..0000000
--- a/package/boost/0005-fix-undeclared-isnan.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From fbd1393858719c7bda7d251f742950c1bc691ea8 Mon Sep 17 00:00:00 2001
-From: Kohei Takahashi <flast@flast.jp>
-Date: Wed, 6 Jan 2016 19:39:55 +0900
-Subject: [PATCH] Qualify std:: for isnan in some situation.
-
-Because isnan is implemented as a macro and libstdc++ undef it within
-<cmath> (at least FreeBSD 10).
-
-Backported from fbd1393858719c7bda7d251f742950c1bc691ea8
-
-[J??rg Krause: adjust pathes to match sourceforge release tarball]
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
-
----
- boost/math/special_functions/fpclassify.hpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/boost/math/special_functions/fpclassify.hpp b/boost/math/special_functions/fpclassify.hpp
-index 58fad13..d83e111 100644
---- a/boost/math/special_functions/fpclassify.hpp
-+++ b/boost/math/special_functions/fpclassify.hpp
-@@ -133,6 +133,10 @@ inline bool is_nan_helper(T, const boost::false_type&)
- #if defined(BOOST_MATH_HAS_QUADMATH_H)
- inline bool is_nan_helper(__float128 f, const boost::true_type&) { return ::isnanq(f); }
- inline bool is_nan_helper(__float128 f, const boost::false_type&) { return ::isnanq(f); }
-+#elif defined(BOOST_GNU_STDLIB) && BOOST_GNU_STDLIB && \
-+      _GLIBCXX_USE_C99_MATH && !_GLIBCXX_USE_C99_FP_MACROS_DYNAMIC
-+inline bool is_nan_helper(__float128 f, const boost::true_type&) { return std::isnan(static_cast<double>(f)); }
-+inline bool is_nan_helper(__float128 f, const boost::false_type&) { return std::isnan(static_cast<double>(f)); }
- #else
- inline bool is_nan_helper(__float128 f, const boost::true_type&) { return ::isnan(static_cast<double>(f)); }
- inline bool is_nan_helper(__float128 f, const boost::false_type&) { return ::isnan(static_cast<double>(f)); }
diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index 294282a..c4af22e 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/boost/files/boost/1.60.0/
-md5	65a840e1a0b13a558ff19eeb2c4f0cbe	boost_1_60_0.tar.bz2
-sha1	7f56ab507d3258610391b47fef6b11635861175a	boost_1_60_0.tar.bz2
+# From http://sourceforge.net/projects/boost/files/boost/1.61.0/
+md5	6095876341956f65f9d35939ccea1a9f	boost_1_61_0.tar.bz2
+sha1	f84b1a1ce764108ec3c2b7bd7704cf8dfd3c9d01	boost_1_61_0.tar.bz2
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 15f0b77..e6459b9 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.60.0
+BOOST_VERSION = 1.61.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
 BOOST_INSTALL_STAGING = YES
