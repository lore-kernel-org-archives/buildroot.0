From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 15 May 2015 19:00:07 +0200
Subject: [Buildroot] [RFC] package/boost: fix powerpc uClibc build issue
Message-ID: <1431709207-25679-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With powerpc target and uClibc toolchain the spirit library doesn't
build properly due to an invalid field access.

The "bits" field is intended only for internal use in
include/boost/math/special_functions/sign.hpp not from
include/boost/spirit/home/support/detail/sign.hpp.

Simply call (boost::math::changesign)(x) from
include/boost/spirit/home/support/detail/sign.hpp to fixes this.

Fixes:
http://autobuild.buildroot.net/results/be1/be1069e8528d299f487f431f7e2d793413ccbab8/

And many more.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
It's not clear why this issue is only trigged by powerpc
with uClibc toolchain.
Also, it's a pity that the spirit library doesn't use directly
math library instead of using a wrapper.
---
 .../boost/0002-spirit-fix-changesign-wrapper.patch | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 package/boost/0002-spirit-fix-changesign-wrapper.patch

diff --git a/package/boost/0002-spirit-fix-changesign-wrapper.patch b/package/boost/0002-spirit-fix-changesign-wrapper.patch
new file mode 100644
index 0000000..f238549
--- /dev/null
+++ b/package/boost/0002-spirit-fix-changesign-wrapper.patch
@@ -0,0 +1,69 @@
+From 7d367aa89713995ccf5d8d3f03e27137bc254dc1 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Fri, 15 May 2015 18:46:04 +0200
+Subject: [PATCH] spirit: fix changesign wrapper
+
+With powerpc target and uClibc toolchain the spirit library doesn't
+build properly due to an invalid field access.
+
+The "bits" field is intended only for internal use in
+include/boost/math/special_functions/sign.hpp not from
+include/boost/spirit/home/support/detail/sign.hpp.
+
+This lead to the following build failure:
+
+In file included from ./boost/spirit/home/qi/numeric/detail/real_impl.hpp:22:0,
+                 from ./boost/spirit/home/qi/numeric/real.hpp:21,
+                 from ./boost/spirit/home/qi/numeric.hpp:17,
+                 from ./boost/spirit/include/qi_core.hpp:23,
+                 from libs/log/src/default_filter_factory.cpp:21:
+./boost/spirit/home/support/detail/sign.hpp: In instantiation of 'T boost::spirit::detail::changesign(T) [with T = long double]':
+./boost/spirit/home/qi/numeric/detail/real_impl.hpp:94:50:   required from here
+./boost/spirit/home/support/detail/sign.hpp:60:36: error:
+no type named 'bits' in 'traits_type {aka struct boost::math::detail::fp_traits_non_native<long double, boost::math::detail::extended_double_precision>}'
+         typename traits_type::bits a;
+
+Simply call (boost::math::changesign)(x) from include/boost/spirit/home/support/detail/sign.hpp
+to fixes this.
+
+Fixes:
+http://autobuild.buildroot.net/results/be1/be1069e8528d299f487f431f7e2d793413ccbab8/build-end.log
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ boost/spirit/home/support/detail/sign.hpp | 10 ++--------
+ 1 file changed, 2 insertions(+), 8 deletions(-)
+
+diff --git a/boost/spirit/home/support/detail/sign.hpp b/boost/spirit/home/support/detail/sign.hpp
+index 7c1bfb0..a5fc7e1 100644
+--- a/boost/spirit/home/support/detail/sign.hpp
++++ b/boost/spirit/home/support/detail/sign.hpp
+@@ -15,7 +15,7 @@
+ 
+ #include <boost/config/no_tr1/cmath.hpp>
+ #include <boost/version.hpp>
+-#if BOOST_VERSION < 104000 
++#if BOOST_VERSION < 104000
+ #include <boost/spirit/home/support/detail/math/fpclassify.hpp>
+ #include <boost/spirit/home/support/detail/math/signbit.hpp>
+ #else
+@@ -55,13 +55,7 @@ namespace boost { namespace spirit { namespace detail
+ #if defined(BOOST_MATH_USE_STD_FPCLASSIFY) && !defined(BOOST_MATH_DISABLE_STD_FPCLASSIFY)
+         return -x;
+ #else
+-        typedef typename math::detail::fp_traits<T>::type traits_type;
+-
+-        typename traits_type::bits a;
+-        traits_type::get_bits(x, a);
+-        a ^= traits_type::sign;
+-        traits_type::set_bits(x, a);
+-        return x;
++        return (boost::math::changesign)(x);
+ #endif
+     }
+ #endif
+-- 
+1.9.3
+
-- 
1.9.3
