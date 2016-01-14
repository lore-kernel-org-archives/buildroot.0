From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 14 Jan 2016 22:17:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/boost: add patch to fix undeclared
	isnan issue
Message-ID: <1452806240-4196-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch from upstream [1] to fix build error:
  ./boost/math/special_functions/fpclassify.hpp:137:75: error: '::isnan' has not been declared

Fixes:
http://autobuild.buildroot.net/results/6c7/6c72c189cd029fb6c81798f5443fab331358bb90/
http://autobuild.buildroot.net/results/b70/b709fc201c9df8f76163e2a620da32362abe5288/
http://autobuild.buildroot.net/results/99b/99bdbc5622dfd0ac369611ec07dd2a8a8fe41ce8/
http://autobuild.buildroot.net/results/d2b/d2b270787fc20e45c839d5670af55e47723aef2a/
and many more.

Backported from: fbd1393858719c7bda7d251f742950c1bc691ea8

[1] https://github.com/boostorg/math/commit/fbd1393858719c7bda7d251f742950c1bc691ea8

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/boost/0005-fix-undeclared-isnan.patch | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/boost/0005-fix-undeclared-isnan.patch

diff --git a/package/boost/0005-fix-undeclared-isnan.patch b/package/boost/0005-fix-undeclared-isnan.patch
new file mode 100644
index 0000000..95d8fed
--- /dev/null
+++ b/package/boost/0005-fix-undeclared-isnan.patch
@@ -0,0 +1,32 @@
+From fbd1393858719c7bda7d251f742950c1bc691ea8 Mon Sep 17 00:00:00 2001
+From: Kohei Takahashi <flast@flast.jp>
+Date: Wed, 6 Jan 2016 19:39:55 +0900
+Subject: [PATCH] Qualify std:: for isnan in some situation.
+
+Because isnan is implemented as a macro and libstdc++ undef it within
+<cmath> (at least FreeBSD 10).
+
+Backported from fbd1393858719c7bda7d251f742950c1bc691ea8
+
+[J?rg Krause: adjust pathes to match sourceforge release tarball]
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+
+---
+ boost/math/special_functions/fpclassify.hpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/boost/math/special_functions/fpclassify.hpp b/boost/math/special_functions/fpclassify.hpp
+index 58fad13..d83e111 100644
+--- a/boost/math/special_functions/fpclassify.hpp
++++ b/boost/math/special_functions/fpclassify.hpp
+@@ -133,6 +133,10 @@ inline bool is_nan_helper(T, const boost::false_type&)
+ #if defined(BOOST_MATH_HAS_QUADMATH_H)
+ inline bool is_nan_helper(__float128 f, const boost::true_type&) { return ::isnanq(f); }
+ inline bool is_nan_helper(__float128 f, const boost::false_type&) { return ::isnanq(f); }
++#elif defined(BOOST_GNU_STDLIB) && BOOST_GNU_STDLIB && \
++      _GLIBCXX_USE_C99_MATH && !_GLIBCXX_USE_C99_FP_MACROS_DYNAMIC
++inline bool is_nan_helper(__float128 f, const boost::true_type&) { return std::isnan(static_cast<double>(f)); }
++inline bool is_nan_helper(__float128 f, const boost::false_type&) { return std::isnan(static_cast<double>(f)); }
+ #else
+ inline bool is_nan_helper(__float128 f, const boost::true_type&) { return ::isnan(static_cast<double>(f)); }
+ inline bool is_nan_helper(__float128 f, const boost::false_type&) { return ::isnan(static_cast<double>(f)); }
-- 
2.7.0
