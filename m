Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5938CC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 18:49:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7123E610E8
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 18:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7123E610E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19D9680B2A;
	Tue,  7 Sep 2021 18:49:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dBht9JUP0v3H; Tue,  7 Sep 2021 18:49:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D146680B31;
	Tue,  7 Sep 2021 18:49:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 361E81BF35F
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 18:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C73480B31
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 18:49:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id glQAbJMKzCA5 for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 18:49:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0162480B2A
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 18:49:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8EBA31814C2; Tue,  7 Sep 2021 20:49:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1631040544; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=kJtSgIo59KV2vsUtmU5PlnGXjfI3NaCHfBVnkEtpLn0=;
 b=dYk5uz+RyIoAfV//Lr6LaO8CN0UWDHXwp/ODfGeyq1H1KfXn7C9bXi6NY1Pt9jbjwAMh2y
 Hgz35aGmjc6rt4CAl0PqGGRineOjWoscYS3x/kheenu49NHYUutdQzy/iK1h4w5W5BS00n
 QkcGjcBMqHIWsao/J2DOu67hOd4A0fw=
To: buildroot@buildroot.org
Date: Tue,  7 Sep 2021 20:48:13 +0200
Message-Id: <20210907184816.61816-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.2
Subject: [Buildroot] [PATCH] package/boost: fix math with no atomics
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@lists.buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Boost 1.77.0 broke the build of the math component on architectures
without lockfree atomics. This was reported in [0].

This patch adds the upstream patchset [1] which fixes the build and
removes the dependency on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS

[0] https://github.com/boostorg/math/issues/673
[1] https://github.com/boostorg/math/pull/684

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 ...aceful-fail-bernouli-with-no-atomics.patch | 419 ++++++++++++++++++
 package/boost/Config.in                       |   1 -
 2 files changed, 419 insertions(+), 1 deletion(-)
 create mode 100644 package/boost/0002-math-graceful-fail-bernouli-with-no-atomics.patch

diff --git a/package/boost/0002-math-graceful-fail-bernouli-with-no-atomics.patch b/package/boost/0002-math-graceful-fail-bernouli-with-no-atomics.patch
new file mode 100644
index 0000000000..1a0f5e35ad
--- /dev/null
+++ b/package/boost/0002-math-graceful-fail-bernouli-with-no-atomics.patch
@@ -0,0 +1,419 @@
+From 32bd6197353f6ea8e5bef01f09e25c944141acfc Mon Sep 17 00:00:00 2001
+From: jzmaddock <john@johnmaddock.co.uk>
+Date: Wed, 1 Sep 2021 18:54:54 +0100
+Subject: [PATCH 1/5] Allow definition of BOOST_MATH_NO_ATOMIC_INT on the
+ command line. Allows us to test/emulate platforms with no atomic integers.
+
+---
+ boost/math/tools/atomic.hpp | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/include/boost/math/tools/atomic.hpp b/include/boost/math/tools/atomic.hpp
+index cc76ed269f..e3cbf5db89 100644
+--- a/boost/math/tools/atomic.hpp
++++ b/boost/math/tools/atomic.hpp
+@@ -16,27 +16,27 @@
+ namespace boost {
+    namespace math {
+       namespace detail {
+-#if ATOMIC_INT_LOCK_FREE == 2
++#if (ATOMIC_INT_LOCK_FREE == 2) && !defined(BOOST_MATH_NO_ATOMIC_INT)
+          typedef std::atomic<int> atomic_counter_type;
+          typedef std::atomic<unsigned> atomic_unsigned_type;
+          typedef int atomic_integer_type;
+          typedef unsigned atomic_unsigned_integer_type;
+-#elif ATOMIC_SHORT_LOCK_FREE == 2
++#elif (ATOMIC_SHORT_LOCK_FREE == 2) && !defined(BOOST_MATH_NO_ATOMIC_INT)
+          typedef std::atomic<short> atomic_counter_type;
+          typedef std::atomic<unsigned short> atomic_unsigned_type;
+          typedef short atomic_integer_type;
+          typedef unsigned short atomic_unsigned_type;
+-#elif ATOMIC_LONG_LOCK_FREE == 2
++#elif (ATOMIC_LONG_LOCK_FREE == 2) && !defined(BOOST_MATH_NO_ATOMIC_INT)
+          typedef std::atomic<long> atomic_unsigned_integer_type;
+          typedef std::atomic<unsigned long> atomic_unsigned_type;
+          typedef unsigned long atomic_unsigned_type;
+          typedef long atomic_integer_type;
+-#elif ATOMIC_LLONG_LOCK_FREE == 2
++#elif (ATOMIC_LLONG_LOCK_FREE == 2) && !defined(BOOST_MATH_NO_ATOMIC_INT)
+          typedef std::atomic<long long> atomic_unsigned_integer_type;
+          typedef std::atomic<unsigned long long> atomic_unsigned_type;
+          typedef long long atomic_integer_type;
+          typedef unsigned long long atomic_unsigned_integer_type;
+-#else
++#elif !defined(BOOST_MATH_NO_ATOMIC_INT)
+ #  define BOOST_MATH_NO_ATOMIC_INT
+ #endif
+       } // Namespace detail
+
+From 7d482f6ebc356e6ec455ccb5f51a23971bf6ce5b Mon Sep 17 00:00:00 2001
+From: jzmaddock <john@johnmaddock.co.uk>
+Date: Wed, 1 Sep 2021 20:31:53 +0100
+Subject: [PATCH 2/5] Make no atomics a soft failure in bernoulli_details.hpp.
+ Include an "escape macro" so thread safety can be disabled if certain
+ bernoulli features are to be used in a no-atomics environment. Fixes
+ https://github.com/boostorg/math/issues/673.
+
+---
+ .../detail/bernoulli_details.hpp                 | 10 +++++++---
+ libs/math/test/Jamfile.v2                        |  3 +++
+ test/compile_test/bernoulli_no_atomic_d.cpp      | 14 ++++++++++++++
+ test/compile_test/bernoulli_no_atomic_fail.cpp   | 15 +++++++++++++++
+ test/compile_test/bernoulli_no_atomic_mp.cpp     | 16 ++++++++++++++++
+ 5 files changed, 55 insertions(+), 3 deletions(-)
+ create mode 100644 test/compile_test/bernoulli_no_atomic_d.cpp
+ create mode 100644 test/compile_test/bernoulli_no_atomic_fail.cpp
+ create mode 100644 test/compile_test/bernoulli_no_atomic_mp.cpp
+
+diff --git a/include/boost/math/special_functions/detail/bernoulli_details.hpp b/include/boost/math/special_functions/detail/bernoulli_details.hpp
+index cf35545264..8519b7c89c 100644
+--- a/boost/math/special_functions/detail/bernoulli_details.hpp
++++ b/boost/math/special_functions/detail/bernoulli_details.hpp
+@@ -360,7 +360,7 @@ class bernoulli_numbers_cache
+          return out;
+       }
+ 
+-      #ifndef BOOST_HAS_THREADS
++      #if !defined(BOOST_HAS_THREADS) || defined(BOOST_MATH_BERNOULLI_UNTHREADED)
+       //
+       // Single threaded code, very simple:
+       //
+@@ -382,6 +382,8 @@ class bernoulli_numbers_cache
+          *out = (i >= m_overflow_limit) ? policies::raise_overflow_error<T>("boost::math::bernoulli_b2n<%1%>(std::size_t)", 0, T(i), pol) : bn[i];
+          ++out;
+       }
++      #elif defined(BOOST_MATH_NO_ATOMIC_INT)
++      static_assert(sizeof(T) == 1, "Unsupported configuration: your platform appears to have no atomic integers.  If you are happy with thread-unsafe code, then you may define BOOST_MATH_BERNOULLI_UNTHREADED to suppress this error.");
+       #else
+       //
+       // Double-checked locking pattern, lets us access cached already cached values
+@@ -464,7 +466,7 @@ class bernoulli_numbers_cache
+          return out;
+       }
+ 
+-      #ifndef BOOST_HAS_THREADS
++      #if !defined(BOOST_HAS_THREADS) || defined(BOOST_MATH_BERNOULLI_UNTHREADED)
+       //
+       // Single threaded code, very simple:
+       //
+@@ -494,6 +496,8 @@ class bernoulli_numbers_cache
+          }
+          ++out;
+       }
++      #elif defined(BOOST_MATH_NO_ATOMIC_INT)
++      static_assert(sizeof(T) == 1, "Unsupported configuration: your platform appears to have no atomic integers.  If you are happy with thread-unsafe code, then you may define BOOST_MATH_BERNOULLI_UNTHREADED to suppress this error.");
+       #else
+       //
+       // Double-checked locking pattern, lets us access cached already cached values
+@@ -555,7 +559,7 @@ class bernoulli_numbers_cache
+    // The value at which we know overflow has already occurred for the Bn:
+    std::size_t m_overflow_limit;
+ 
+-   #ifdef BOOST_HAS_THREADS
++   #if defined(BOOST_HAS_THREADS) && !defined(BOOST_MATH_NO_ATOMIC_INT)
+    std::mutex m_mutex;
+    atomic_counter_type m_counter, m_current_precision;
+    #else
+diff --git a/libs/math/test/Jamfile.v2 b/test/Jamfile.v2
+index 52fb87f5e5..3ac63f9279 100644
+--- a/libs/math/test/Jamfile.v2
++++ b/libs/math/test/Jamfile.v2
+@@ -1137,6 +1137,9 @@ test-suite misc :
+ 
+ #   [ run __temporary_test.cpp test_instances//test_instances : : : <test-info>always_show_run_output <pch>off ]
+    [ compile test_no_long_double_policy.cpp ]
++   [ compile compile_test/bernoulli_no_atomic_d.cpp ]
++   [ compile compile_test/bernoulli_no_atomic_mp.cpp ]
++   [ compile-fail compile_test/bernoulli_no_atomic_fail.cpp ]
+ ;
+ 
+ test-suite interpolators :
+diff --git a/test/compile_test/bernoulli_no_atomic_d.cpp b/test/compile_test/bernoulli_no_atomic_d.cpp
+new file mode 100644
+index 0000000000..61926f7e1f
+--- /dev/null
++++ b/test/compile_test/bernoulli_no_atomic_d.cpp
+@@ -0,0 +1,14 @@
++//  (C) Copyright John Maddock 2021.
++//  Use, modification and distribution are subject to the
++//  Boost Software License, Version 1.0. (See accompanying file
++//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
++
++#define BOOST_MATH_NO_ATOMIC_INT
++
++#include <boost/math/special_functions/bernoulli.hpp>
++#include "test_compile_result.hpp"
++
++void compile_and_link_test()
++{
++   check_result<double>(boost::math::bernoulli_b2n<double>(4));
++}
+diff --git a/test/compile_test/bernoulli_no_atomic_fail.cpp b/test/compile_test/bernoulli_no_atomic_fail.cpp
+new file mode 100644
+index 0000000000..bbd7152412
+--- /dev/null
++++ b/test/compile_test/bernoulli_no_atomic_fail.cpp
+@@ -0,0 +1,15 @@
++//  (C) Copyright John Maddock 2021.
++//  Use, modification and distribution are subject to the
++//  Boost Software License, Version 1.0. (See accompanying file
++//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
++
++#define BOOST_MATH_NO_ATOMIC_INT
++
++#include <boost/math/special_functions/bernoulli.hpp>
++#include <boost/multiprecision/cpp_bin_float.hpp>
++#include "test_compile_result.hpp"
++
++void compile_and_link_test()
++{
++   check_result<boost::multiprecision::cpp_bin_float_50>(boost::math::bernoulli_b2n<boost::multiprecision::cpp_bin_float_50>(4));
++}
+diff --git a/test/compile_test/bernoulli_no_atomic_mp.cpp b/test/compile_test/bernoulli_no_atomic_mp.cpp
+new file mode 100644
+index 0000000000..8d5a6e78e6
+--- /dev/null
++++ b/test/compile_test/bernoulli_no_atomic_mp.cpp
+@@ -0,0 +1,16 @@
++//  (C) Copyright John Maddock 2021.
++//  Use, modification and distribution are subject to the
++//  Boost Software License, Version 1.0. (See accompanying file
++//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
++
++#define BOOST_MATH_NO_ATOMIC_INT
++#define BOOST_MATH_BERNOULLI_UNTHREADED
++
++#include <boost/math/special_functions/bernoulli.hpp>
++#include <boost/multiprecision/cpp_bin_float.hpp>
++#include "test_compile_result.hpp"
++
++void compile_and_link_test()
++{
++   check_result<boost::multiprecision::cpp_bin_float_50>(boost::math::bernoulli_b2n<boost::multiprecision::cpp_bin_float_50>(4));
++}
+
+From e7a66ca725582b92c66b0c5d745b28c45e0d9f2b Mon Sep 17 00:00:00 2001
+From: jzmaddock <john@johnmaddock.co.uk>
+Date: Thu, 2 Sep 2021 10:51:49 +0100
+Subject: [PATCH 3/5] Move tests around so as not to interfere with CMake
+ script.
+
+---
+ libs/math/test/Jamfile.v2                      |  6 +++---
+ test/compile_test/bernoulli_no_atomic_d.cpp    | 14 --------------
+ test/compile_test/bernoulli_no_atomic_fail.cpp | 15 ---------------
+ test/compile_test/bernoulli_no_atomic_mp.cpp   | 16 ----------------
+ 4 files changed, 3 insertions(+), 48 deletions(-)
+ delete mode 100644 test/compile_test/bernoulli_no_atomic_d.cpp
+ delete mode 100644 test/compile_test/bernoulli_no_atomic_fail.cpp
+ delete mode 100644 test/compile_test/bernoulli_no_atomic_mp.cpp
+
+diff --git a/libs/math/test/Jamfile.v2 b/libs/math/test/Jamfile.v2
+index 3ac63f9279..7386b4ff84 100644
+--- a/libs/math/test/Jamfile.v2
++++ b/libs/math/test/Jamfile.v2
+@@ -1137,9 +1137,9 @@ test-suite misc :
+ 
+ #   [ run __temporary_test.cpp test_instances//test_instances : : : <test-info>always_show_run_output <pch>off ]
+    [ compile test_no_long_double_policy.cpp ]
+-   [ compile compile_test/bernoulli_no_atomic_d.cpp ]
+-   [ compile compile_test/bernoulli_no_atomic_mp.cpp ]
+-   [ compile-fail compile_test/bernoulli_no_atomic_fail.cpp ]
++   [ compile bernoulli_no_atomic_d.cpp ]
++   [ compile bernoulli_no_atomic_mp.cpp ]
++   [ compile-fail bernoulli_no_atomic_fail.cpp ]
+ ;
+ 
+ test-suite interpolators :
+diff --git a/test/compile_test/bernoulli_no_atomic_d.cpp b/test/compile_test/bernoulli_no_atomic_d.cpp
+deleted file mode 100644
+index 61926f7e1f..0000000000
+--- a/test/compile_test/bernoulli_no_atomic_d.cpp
++++ /dev/null
+@@ -1,14 +0,0 @@
+-//  (C) Copyright John Maddock 2021.
+-//  Use, modification and distribution are subject to the
+-//  Boost Software License, Version 1.0. (See accompanying file
+-//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
+-
+-#define BOOST_MATH_NO_ATOMIC_INT
+-
+-#include <boost/math/special_functions/bernoulli.hpp>
+-#include "test_compile_result.hpp"
+-
+-void compile_and_link_test()
+-{
+-   check_result<double>(boost::math::bernoulli_b2n<double>(4));
+-}
+diff --git a/test/compile_test/bernoulli_no_atomic_fail.cpp b/test/compile_test/bernoulli_no_atomic_fail.cpp
+deleted file mode 100644
+index bbd7152412..0000000000
+--- a/test/compile_test/bernoulli_no_atomic_fail.cpp
++++ /dev/null
+@@ -1,15 +0,0 @@
+-//  (C) Copyright John Maddock 2021.
+-//  Use, modification and distribution are subject to the
+-//  Boost Software License, Version 1.0. (See accompanying file
+-//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
+-
+-#define BOOST_MATH_NO_ATOMIC_INT
+-
+-#include <boost/math/special_functions/bernoulli.hpp>
+-#include <boost/multiprecision/cpp_bin_float.hpp>
+-#include "test_compile_result.hpp"
+-
+-void compile_and_link_test()
+-{
+-   check_result<boost::multiprecision::cpp_bin_float_50>(boost::math::bernoulli_b2n<boost::multiprecision::cpp_bin_float_50>(4));
+-}
+diff --git a/test/compile_test/bernoulli_no_atomic_mp.cpp b/test/compile_test/bernoulli_no_atomic_mp.cpp
+deleted file mode 100644
+index 8d5a6e78e6..0000000000
+--- a/test/compile_test/bernoulli_no_atomic_mp.cpp
++++ /dev/null
+@@ -1,16 +0,0 @@
+-//  (C) Copyright John Maddock 2021.
+-//  Use, modification and distribution are subject to the
+-//  Boost Software License, Version 1.0. (See accompanying file
+-//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
+-
+-#define BOOST_MATH_NO_ATOMIC_INT
+-#define BOOST_MATH_BERNOULLI_UNTHREADED
+-
+-#include <boost/math/special_functions/bernoulli.hpp>
+-#include <boost/multiprecision/cpp_bin_float.hpp>
+-#include "test_compile_result.hpp"
+-
+-void compile_and_link_test()
+-{
+-   check_result<boost::multiprecision::cpp_bin_float_50>(boost::math::bernoulli_b2n<boost::multiprecision::cpp_bin_float_50>(4));
+-}
+
+From e7f4a4c03365c19b7ba9a189a86df2de5cce3585 Mon Sep 17 00:00:00 2001
+From: jzmaddock <john@johnmaddock.co.uk>
+Date: Thu, 2 Sep 2021 18:34:38 +0100
+Subject: [PATCH 4/5] Add missing files.
+
+---
+ test/bernoulli_no_atomic_d.cpp    | 14 ++++++++++++++
+ test/bernoulli_no_atomic_fail.cpp | 15 +++++++++++++++
+ test/bernoulli_no_atomic_mp.cpp   | 16 ++++++++++++++++
+ 3 files changed, 45 insertions(+)
+ create mode 100644 test/bernoulli_no_atomic_d.cpp
+ create mode 100644 test/bernoulli_no_atomic_fail.cpp
+ create mode 100644 test/bernoulli_no_atomic_mp.cpp
+
+diff --git a/test/bernoulli_no_atomic_d.cpp b/test/bernoulli_no_atomic_d.cpp
+new file mode 100644
+index 0000000000..61926f7e1f
+--- /dev/null
++++ b/test/bernoulli_no_atomic_d.cpp
+@@ -0,0 +1,14 @@
++//  (C) Copyright John Maddock 2021.
++//  Use, modification and distribution are subject to the
++//  Boost Software License, Version 1.0. (See accompanying file
++//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
++
++#define BOOST_MATH_NO_ATOMIC_INT
++
++#include <boost/math/special_functions/bernoulli.hpp>
++#include "test_compile_result.hpp"
++
++void compile_and_link_test()
++{
++   check_result<double>(boost::math::bernoulli_b2n<double>(4));
++}
+diff --git a/test/bernoulli_no_atomic_fail.cpp b/test/bernoulli_no_atomic_fail.cpp
+new file mode 100644
+index 0000000000..bbd7152412
+--- /dev/null
++++ b/test/bernoulli_no_atomic_fail.cpp
+@@ -0,0 +1,15 @@
++//  (C) Copyright John Maddock 2021.
++//  Use, modification and distribution are subject to the
++//  Boost Software License, Version 1.0. (See accompanying file
++//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
++
++#define BOOST_MATH_NO_ATOMIC_INT
++
++#include <boost/math/special_functions/bernoulli.hpp>
++#include <boost/multiprecision/cpp_bin_float.hpp>
++#include "test_compile_result.hpp"
++
++void compile_and_link_test()
++{
++   check_result<boost::multiprecision::cpp_bin_float_50>(boost::math::bernoulli_b2n<boost::multiprecision::cpp_bin_float_50>(4));
++}
+diff --git a/test/bernoulli_no_atomic_mp.cpp b/test/bernoulli_no_atomic_mp.cpp
+new file mode 100644
+index 0000000000..8d5a6e78e6
+--- /dev/null
++++ b/test/bernoulli_no_atomic_mp.cpp
+@@ -0,0 +1,16 @@
++//  (C) Copyright John Maddock 2021.
++//  Use, modification and distribution are subject to the
++//  Boost Software License, Version 1.0. (See accompanying file
++//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
++
++#define BOOST_MATH_NO_ATOMIC_INT
++#define BOOST_MATH_BERNOULLI_UNTHREADED
++
++#include <boost/math/special_functions/bernoulli.hpp>
++#include <boost/multiprecision/cpp_bin_float.hpp>
++#include "test_compile_result.hpp"
++
++void compile_and_link_test()
++{
++   check_result<boost::multiprecision::cpp_bin_float_50>(boost::math::bernoulli_b2n<boost::multiprecision::cpp_bin_float_50>(4));
++}
+
+From ed9a0bae1f4df09613ed55a30a8b3faa09997acf Mon Sep 17 00:00:00 2001
+From: jzmaddock <john@johnmaddock.co.uk>
+Date: Fri, 3 Sep 2021 10:56:44 +0100
+Subject: [PATCH 5/5] Fix include path in tests.
+
+---
+ test/bernoulli_no_atomic_d.cpp    | 2 +-
+ test/bernoulli_no_atomic_fail.cpp | 2 +-
+ test/bernoulli_no_atomic_mp.cpp   | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/test/bernoulli_no_atomic_d.cpp b/test/bernoulli_no_atomic_d.cpp
+index 61926f7e1f..a9c37d60cb 100644
+--- a/test/bernoulli_no_atomic_d.cpp
++++ b/test/bernoulli_no_atomic_d.cpp
+@@ -6,7 +6,7 @@
+ #define BOOST_MATH_NO_ATOMIC_INT
+ 
+ #include <boost/math/special_functions/bernoulli.hpp>
+-#include "test_compile_result.hpp"
++#include "compile_test/test_compile_result.hpp"
+ 
+ void compile_and_link_test()
+ {
+diff --git a/test/bernoulli_no_atomic_fail.cpp b/test/bernoulli_no_atomic_fail.cpp
+index bbd7152412..d1f4faa387 100644
+--- a/test/bernoulli_no_atomic_fail.cpp
++++ b/test/bernoulli_no_atomic_fail.cpp
+@@ -7,7 +7,7 @@
+ 
+ #include <boost/math/special_functions/bernoulli.hpp>
+ #include <boost/multiprecision/cpp_bin_float.hpp>
+-#include "test_compile_result.hpp"
++#include "compile_test/test_compile_result.hpp"
+ 
+ void compile_and_link_test()
+ {
+diff --git a/test/bernoulli_no_atomic_mp.cpp b/test/bernoulli_no_atomic_mp.cpp
+index 8d5a6e78e6..53cb5ffed0 100644
+--- a/test/bernoulli_no_atomic_mp.cpp
++++ b/test/bernoulli_no_atomic_mp.cpp
+@@ -8,7 +8,7 @@
+ 
+ #include <boost/math/special_functions/bernoulli.hpp>
+ #include <boost/multiprecision/cpp_bin_float.hpp>
+-#include "test_compile_result.hpp"
++#include "compile_test/test_compile_result.hpp"
+ 
+ void compile_and_link_test()
+ {
diff --git a/package/boost/Config.in b/package/boost/Config.in
index d9ce841a92..f6dea1eaf7 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -254,7 +254,6 @@ comment "boost-log needs a toolchain not affected by GCC bug 64735"
 
 config BR2_PACKAGE_BOOST_MATH
 	bool "boost-math"
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	help
 	  Boost.Math includes several contributions in the domain of
 	  mathematics:
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
