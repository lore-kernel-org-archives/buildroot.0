Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FA2C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 09:48:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4C93610CE
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 09:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4C93610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C24E40457;
	Sun, 12 Sep 2021 09:48:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7QwAw3I6hXAY; Sun, 12 Sep 2021 09:48:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB8FE40458;
	Sun, 12 Sep 2021 09:48:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FFF81BF47E
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 09:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F53840458
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 09:48:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GpBGzcuYnEXJ for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 09:48:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F2E340457
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 09:48:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bc3c:8ee4:eb9c:c13b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 997C920039C;
 Sun, 12 Sep 2021 11:47:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631440078;
 bh=mR30ZHGEbfyBiyzkmC/LLxHYGqUQwQ0qSVziXszq+jg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VkWKDyFxvRazho3Ps0QeC3J1W91pUGY3nedTiH/AM+QOScF7l/xCWkJbMxkXivXE6
 J6y85nyBdVM8gUr7XTZAZDruxInkAFVNjpqY1pulHFGCGMmuAKcD2XxbKl2Jbg1ZQI
 LD5cVmcLtkGzequcWVebvqqs5ZsayZ9QCPd2kMx3p9/VJJrd7RqBKdPzBFSTE6V4Ng
 afDDpIWn9D3vHlcWRuRspZkpFXNWKgGNtdAD6g55yPH5uRWA6AEPj3nC7vXa6wucVU
 OpFyXCyXj2SMTxbyK6gSYPOyilpYMe4PnCrJnwP0M08WRtthPZFDmUjDSKU0JNvugu
 eXX/AM8IotdSA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Sep 2021 11:47:54 +0200
Date: Sun, 12 Sep 2021 11:47:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Message-ID: <20210912094754.GE1053080@scaer>
References: <20210912091221.80127-1-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210912091221.80127-1-buildroot@heine.tech>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2] package/boost: fix math with no atomics
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Michael, All,

On 2021-09-12 11:12 +0200, Michael Nosthoff via buildroot spake thusly:
> Boost 1.77.0 broke the build of the math component on architectures
> without lockfree atomics. This was reported in [0].
> 
> This patch adds the relevant patches from the upstream patchset[1] which fix the build
> and removes the dependency on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> 
> [0] https://github.com/boostorg/math/issues/673
> [1] https://github.com/boostorg/math/pull/684
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> V2:
>  - split patchset into multiple patches
>  - drop patches that only fix tests
> ---
>  ...li-code-on-platforms-with-no-atomics.patch |  47 ++++++
>  ...oft-failure-in-bernoulli_details_hpp.patch | 145 ++++++++++++++++++
>  package/boost/Config.in                       |   1 -
>  3 files changed, 192 insertions(+), 1 deletion(-)
>  create mode 100644 package/boost/0002-math-provide-graceful-failure-for-bernoulli-code-on-platforms-with-no-atomics.patch
>  create mode 100644 package/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
> 
> diff --git a/package/boost/0002-math-provide-graceful-failure-for-bernoulli-code-on-platforms-with-no-atomics.patch b/package/boost/0002-math-provide-graceful-failure-for-bernoulli-code-on-platforms-with-no-atomics.patch
> new file mode 100644
> index 0000000000..121355d71e
> --- /dev/null
> +++ b/package/boost/0002-math-provide-graceful-failure-for-bernoulli-code-on-platforms-with-no-atomics.patch
> @@ -0,0 +1,47 @@
> +From 32bd6197353f6ea8e5bef01f09e25c944141acfc Mon Sep 17 00:00:00 2001
> +From: jzmaddock <john@johnmaddock.co.uk>
> +Date: Wed, 1 Sep 2021 18:54:54 +0100
> +Subject: [PATCH] Allow definition of BOOST_MATH_NO_ATOMIC_INT on the command
> + line. Allows us to test/emulate platforms with no atomic integers.
> +
> +---
> + boost/math/tools/atomic.hpp | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/boost/math/tools/atomic.hpp b/boost/math/tools/atomic.hpp
> +index cc76ed269f..e3cbf5db89 100644
> +--- a/boost/math/tools/atomic.hpp
> ++++ b/boost/math/tools/atomic.hpp
> +@@ -16,27 +16,27 @@
> + namespace boost {
> +    namespace math {
> +       namespace detail {
> +-#if ATOMIC_INT_LOCK_FREE == 2
> ++#if (ATOMIC_INT_LOCK_FREE == 2) && !defined(BOOST_MATH_NO_ATOMIC_INT)
> +          typedef std::atomic<int> atomic_counter_type;
> +          typedef std::atomic<unsigned> atomic_unsigned_type;
> +          typedef int atomic_integer_type;
> +          typedef unsigned atomic_unsigned_integer_type;
> +-#elif ATOMIC_SHORT_LOCK_FREE == 2
> ++#elif (ATOMIC_SHORT_LOCK_FREE == 2) && !defined(BOOST_MATH_NO_ATOMIC_INT)
> +          typedef std::atomic<short> atomic_counter_type;
> +          typedef std::atomic<unsigned short> atomic_unsigned_type;
> +          typedef short atomic_integer_type;
> +          typedef unsigned short atomic_unsigned_type;
> +-#elif ATOMIC_LONG_LOCK_FREE == 2
> ++#elif (ATOMIC_LONG_LOCK_FREE == 2) && !defined(BOOST_MATH_NO_ATOMIC_INT)
> +          typedef std::atomic<long> atomic_unsigned_integer_type;
> +          typedef std::atomic<unsigned long> atomic_unsigned_type;
> +          typedef unsigned long atomic_unsigned_type;
> +          typedef long atomic_integer_type;
> +-#elif ATOMIC_LLONG_LOCK_FREE == 2
> ++#elif (ATOMIC_LLONG_LOCK_FREE == 2) && !defined(BOOST_MATH_NO_ATOMIC_INT)
> +          typedef std::atomic<long long> atomic_unsigned_integer_type;
> +          typedef std::atomic<unsigned long long> atomic_unsigned_type;
> +          typedef long long atomic_integer_type;
> +          typedef unsigned long long atomic_unsigned_integer_type;
> +-#else
> ++#elif !defined(BOOST_MATH_NO_ATOMIC_INT)
> + #  define BOOST_MATH_NO_ATOMIC_INT
> + #endif
> +       } // Namespace detail
> diff --git a/package/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch b/package/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
> new file mode 100644
> index 0000000000..77f1217a3a
> --- /dev/null
> +++ b/package/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
> @@ -0,0 +1,145 @@
> +From 7d482f6ebc356e6ec455ccb5f51a23971bf6ce5b Mon Sep 17 00:00:00 2001
> +From: jzmaddock <john@johnmaddock.co.uk>
> +Date: Wed, 1 Sep 2021 20:31:53 +0100
> +Subject: [PATCH] Make no atomics a soft failure in bernoulli_details.hpp.
> + Include an "escape macro" so thread safety can be disabled if certain
> + bernoulli features are to be used in a no-atomics environment. Fixes
> + https://github.com/boostorg/math/issues/673.
> +
> +---
> + .../detail/bernoulli_details.hpp                 | 10 +++++++---
> + libs/math/test/Jamfile.v2                        |  3 +++
> + test/compile_test/bernoulli_no_atomic_d.cpp      | 14 ++++++++++++++
> + test/compile_test/bernoulli_no_atomic_fail.cpp   | 15 +++++++++++++++
> + test/compile_test/bernoulli_no_atomic_mp.cpp     | 16 ++++++++++++++++
> + 5 files changed, 55 insertions(+), 3 deletions(-)
> + create mode 100644 test/compile_test/bernoulli_no_atomic_d.cpp
> + create mode 100644 test/compile_test/bernoulli_no_atomic_fail.cpp
> + create mode 100644 test/compile_test/bernoulli_no_atomic_mp.cpp
> +
> +diff --git a/boost/math/special_functions/detail/bernoulli_details.hpp b/boost/math/special_functions/detail/bernoulli_details.hpp
> +index cf35545264..8519b7c89c 100644
> +--- a/boost/math/special_functions/detail/bernoulli_details.hpp
> ++++ b/boost/math/special_functions/detail/bernoulli_details.hpp
> +@@ -360,7 +360,7 @@ class bernoulli_numbers_cache
> +          return out;
> +       }
> + 
> +-      #ifndef BOOST_HAS_THREADS
> ++      #if !defined(BOOST_HAS_THREADS) || defined(BOOST_MATH_BERNOULLI_UNTHREADED)
> +       //
> +       // Single threaded code, very simple:
> +       //
> +@@ -382,6 +382,8 @@ class bernoulli_numbers_cache
> +          *out = (i >= m_overflow_limit) ? policies::raise_overflow_error<T>("boost::math::bernoulli_b2n<%1%>(std::size_t)", 0, T(i), pol) : bn[i];
> +          ++out;
> +       }
> ++      #elif defined(BOOST_MATH_NO_ATOMIC_INT)
> ++      static_assert(sizeof(T) == 1, "Unsupported configuration: your platform appears to have no atomic integers.  If you are happy with thread-unsafe code, then you may define BOOST_MATH_BERNOULLI_UNTHREADED to suppress this error.");
> +       #else
> +       //
> +       // Double-checked locking pattern, lets us access cached already cached values
> +@@ -464,7 +466,7 @@ class bernoulli_numbers_cache
> +          return out;
> +       }
> + 
> +-      #ifndef BOOST_HAS_THREADS
> ++      #if !defined(BOOST_HAS_THREADS) || defined(BOOST_MATH_BERNOULLI_UNTHREADED)
> +       //
> +       // Single threaded code, very simple:
> +       //
> +@@ -494,6 +496,8 @@ class bernoulli_numbers_cache
> +          }
> +          ++out;
> +       }
> ++      #elif defined(BOOST_MATH_NO_ATOMIC_INT)
> ++      static_assert(sizeof(T) == 1, "Unsupported configuration: your platform appears to have no atomic integers.  If you are happy with thread-unsafe code, then you may define BOOST_MATH_BERNOULLI_UNTHREADED to suppress this error.");
> +       #else
> +       //
> +       // Double-checked locking pattern, lets us access cached already cached values
> +@@ -555,7 +559,7 @@ class bernoulli_numbers_cache
> +    // The value at which we know overflow has already occurred for the Bn:
> +    std::size_t m_overflow_limit;
> + 
> +-   #ifdef BOOST_HAS_THREADS
> ++   #if defined(BOOST_HAS_THREADS) && !defined(BOOST_MATH_NO_ATOMIC_INT)
> +    std::mutex m_mutex;
> +    atomic_counter_type m_counter, m_current_precision;
> +    #else
> +diff --git a/libs/math/test/Jamfile.v2 b/libs/math/test/Jamfile.v2
> +index 52fb87f5e5..3ac63f9279 100644
> +--- a/libs/math/test/Jamfile.v2
> ++++ b/libs/math/test/Jamfile.v2
> +@@ -1137,6 +1137,9 @@ test-suite misc :
> + 
> + #   [ run __temporary_test.cpp test_instances//test_instances : : : <test-info>always_show_run_output <pch>off ]
> +    [ compile test_no_long_double_policy.cpp ]
> ++   [ compile compile_test/bernoulli_no_atomic_d.cpp ]
> ++   [ compile compile_test/bernoulli_no_atomic_mp.cpp ]
> ++   [ compile-fail compile_test/bernoulli_no_atomic_fail.cpp ]
> + ;
> + 
> + test-suite interpolators :
> +diff --git a/test/compile_test/bernoulli_no_atomic_d.cpp b/test/compile_test/bernoulli_no_atomic_d.cpp
> +new file mode 100644
> +index 0000000000..61926f7e1f
> +--- /dev/null
> ++++ b/test/compile_test/bernoulli_no_atomic_d.cpp
> +@@ -0,0 +1,14 @@
> ++//  (C) Copyright John Maddock 2021.
> ++//  Use, modification and distribution are subject to the
> ++//  Boost Software License, Version 1.0. (See accompanying file
> ++//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
> ++
> ++#define BOOST_MATH_NO_ATOMIC_INT
> ++
> ++#include <boost/math/special_functions/bernoulli.hpp>
> ++#include "test_compile_result.hpp"
> ++
> ++void compile_and_link_test()
> ++{
> ++   check_result<double>(boost::math::bernoulli_b2n<double>(4));
> ++}
> +diff --git a/test/compile_test/bernoulli_no_atomic_fail.cpp b/test/compile_test/bernoulli_no_atomic_fail.cpp
> +new file mode 100644
> +index 0000000000..bbd7152412
> +--- /dev/null
> ++++ b/test/compile_test/bernoulli_no_atomic_fail.cpp
> +@@ -0,0 +1,15 @@
> ++//  (C) Copyright John Maddock 2021.
> ++//  Use, modification and distribution are subject to the
> ++//  Boost Software License, Version 1.0. (See accompanying file
> ++//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
> ++
> ++#define BOOST_MATH_NO_ATOMIC_INT
> ++
> ++#include <boost/math/special_functions/bernoulli.hpp>
> ++#include <boost/multiprecision/cpp_bin_float.hpp>
> ++#include "test_compile_result.hpp"
> ++
> ++void compile_and_link_test()
> ++{
> ++   check_result<boost::multiprecision::cpp_bin_float_50>(boost::math::bernoulli_b2n<boost::multiprecision::cpp_bin_float_50>(4));
> ++}
> +diff --git a/test/compile_test/bernoulli_no_atomic_mp.cpp b/test/compile_test/bernoulli_no_atomic_mp.cpp
> +new file mode 100644
> +index 0000000000..8d5a6e78e6
> +--- /dev/null
> ++++ b/test/compile_test/bernoulli_no_atomic_mp.cpp
> +@@ -0,0 +1,16 @@
> ++//  (C) Copyright John Maddock 2021.
> ++//  Use, modification and distribution are subject to the
> ++//  Boost Software License, Version 1.0. (See accompanying file
> ++//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
> ++
> ++#define BOOST_MATH_NO_ATOMIC_INT
> ++#define BOOST_MATH_BERNOULLI_UNTHREADED
> ++
> ++#include <boost/math/special_functions/bernoulli.hpp>
> ++#include <boost/multiprecision/cpp_bin_float.hpp>
> ++#include "test_compile_result.hpp"
> ++
> ++void compile_and_link_test()
> ++{
> ++   check_result<boost::multiprecision::cpp_bin_float_50>(boost::math::bernoulli_b2n<boost::multiprecision::cpp_bin_float_50>(4));
> ++}
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index d9ce841a92..f6dea1eaf7 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -254,7 +254,6 @@ comment "boost-log needs a toolchain not affected by GCC bug 64735"
>  
>  config BR2_PACKAGE_BOOST_MATH
>  	bool "boost-math"
> -	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
>  	help
>  	  Boost.Math includes several contributions in the domain of
>  	  mathematics:
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
