Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4842C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 12:48:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC23A61026
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 12:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC23A61026
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FD2360726;
	Sat, 11 Sep 2021 12:48:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YFqIshkrCcep; Sat, 11 Sep 2021 12:48:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7116C60737;
	Sat, 11 Sep 2021 12:48:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD3931BF31A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 12:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA19060737
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 12:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 01m4f33mhQEz for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 12:48:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7796960726
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 12:48:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c4a:f4f1:e14a:6e93])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CCEEAB0053B;
 Sat, 11 Sep 2021 14:48:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631364503;
 bh=RaTplMs0Ud1Ah5O75OW/fGsuGixeSqEFU3F3ZWn7xhQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VtdxNFGYDPJyKGs/0e/2sn4PiRBrHvDA6GgKn++j+ULP5xvdLfYGLrZeBC0xcLyqR
 fU8B565pSnSQX6VXA7C1enX9xc3WP72Q5b9RqVs2odJlhrfa9b+HGr/O+WrW/P2MaV
 cq2o/BcUjqwaoTaG9oFz8MEvzyciS2x4HTi5rkaQ1d+hDT9cp3nKzndgAfRSRJ67T/
 rk6R5CNLMtMYRKC/qi0dWUyK76tjCLbMril39SnAhIMCr3ADEAA53goo2R3O0xn9KT
 QPbUKeOjnuYjly/uEwUWRApPvfyDS8ohpXq5u92glk4QNJycRfUfTNg90wrfL0OY3+
 BNx0CSRfCmVVw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Sep 2021 14:48:16 +0200
Date: Sat, 11 Sep 2021 14:48:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210911124816.GM1053080@scaer>
References: <20210910063742.97364-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210910063742.97364-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/gnuradio: fix build with boost
 1.77.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-10 08:37 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since commit
> d39d8f7cee9b4634e6f490020204f63fae419e8e:
> 
> In file included from /home/buildroot/autobuild/instance-3/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/math/common_factor.hpp:14,
>                  from /home/buildroot/autobuild/instance-3/output-1/build/gnuradio-3.8.2.0/gr-digital/lib/symbol_sync_cc_impl.cc:30:
> /home/buildroot/autobuild/instance-3/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/math/common_factor_ct.hpp:17:68: error: _Pragma takes a parenthesized string literal
>    17 | BOOST_MATH_HEADER_DEPRECATED("<boost/integer/common_factor_ct.hpp>");
>       |
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7b4/7b46f51588144bca1d323230c378ce7f6ee999a8/build-end.log
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ve-deprecated-math-common_factor.hpp.patch | 165 ++++++++++++++++++
>  1 file changed, 165 insertions(+)
>  create mode 100644 package/gnuradio/0005-boost-remove-deprecated-math-common_factor.hpp.patch
> 
> diff --git a/package/gnuradio/0005-boost-remove-deprecated-math-common_factor.hpp.patch b/package/gnuradio/0005-boost-remove-deprecated-math-common_factor.hpp.patch
> new file mode 100644
> index 0000000000..0c282b7322
> --- /dev/null
> +++ b/package/gnuradio/0005-boost-remove-deprecated-math-common_factor.hpp.patch
> @@ -0,0 +1,165 @@
> +From 2c767bb260a25b415e8c9c4b3ea37280b2127cec Mon Sep 17 00:00:00 2001
> +From: japm48 <japm48@users.noreply.github.com>
> +Date: Fri, 10 Apr 2020 23:35:30 +0200
> +Subject: [PATCH] boost: remove deprecated math/common_factor.hpp
> +
> +Remove deprecation warning and prefer using std::{lcm,gcd} to Boost.
> +Fixes #2712.
> +
> +[Retrieved from:
> +https://github.com/gnuradio/gnuradio/commit/2c767bb260a25b415e8c9c4b3ea37280b2127cec]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + .../include/gnuradio/CMakeLists.txt           |  1 +
> + .../include/gnuradio/integer_math.h           | 35 +++++++++++++++++++
> + gnuradio-runtime/lib/buffer.cc                | 19 ++--------
> + gr-digital/lib/symbol_sync_cc_impl.cc         |  4 +--
> + gr-digital/lib/symbol_sync_ff_impl.cc         |  4 +--
> + 5 files changed, 43 insertions(+), 20 deletions(-)
> + create mode 100644 gnuradio-runtime/include/gnuradio/integer_math.h
> +
> +diff --git a/gnuradio-runtime/include/gnuradio/CMakeLists.txt b/gnuradio-runtime/include/gnuradio/CMakeLists.txt
> +index 8d718e87b5b..056af5d6f48 100644
> +--- a/gnuradio-runtime/include/gnuradio/CMakeLists.txt
> ++++ b/gnuradio-runtime/include/gnuradio/CMakeLists.txt
> +@@ -31,6 +31,7 @@ install(FILES
> +   gr_complex.h
> +   hier_block2.h
> +   high_res_timer.h
> ++  integer_math.h
> +   io_signature.h
> +   logger.h
> +   math.h
> +diff --git a/gnuradio-runtime/include/gnuradio/integer_math.h b/gnuradio-runtime/include/gnuradio/integer_math.h
> +new file mode 100644
> +index 00000000000..15141049fa4
> +--- /dev/null
> ++++ b/gnuradio-runtime/include/gnuradio/integer_math.h
> +@@ -0,0 +1,35 @@
> ++/* -*- c++ -*- */
> ++/*
> ++ * Copyright 2020 Free Software Foundation, Inc.
> ++ *
> ++ * This file is part of GNU Radio
> ++ *
> ++ * SPDX-License-Identifier: GPL-3.0-or-later
> ++ *
> ++ */
> ++#ifndef INCLUDED_GR_INTEGER_MATH_H
> ++#define INCLUDED_GR_INTEGER_MATH_H
> ++
> ++#if (__cplusplus >= 201703L)
> ++
> ++// Prefer C++17 goodness.
> ++#include <numeric>
> ++#define GR_GCD std::gcd
> ++#define GR_LCM std::lcm
> ++
> ++#elif (BOOST_VERSION >= 105800)
> ++
> ++// Fallback: newer boost API (introduced in Boost 1.58.0).
> ++#include <boost/integer/common_factor_rt.hpp>
> ++#define GR_GCD boost::integer::gcd
> ++#define GR_LCM boost::integer::lcm
> ++
> ++#else
> ++
> ++// Last resort: old deprecated boost API.
> ++#include <boost/math/common_factor_rt.hpp>
> ++#define GR_GCD boost::math::gcd
> ++#define GR_LCM boost::math::lcm
> ++
> ++#endif /* __cplusplus >= 201703L */
> ++#endif /* INCLUDED_GR_INTEGER_MATH_H */
> +diff --git a/gnuradio-runtime/lib/buffer.cc b/gnuradio-runtime/lib/buffer.cc
> +index 720c72c4ee8..46d704542b1 100644
> +--- a/gnuradio-runtime/lib/buffer.cc
> ++++ b/gnuradio-runtime/lib/buffer.cc
> +@@ -13,22 +13,13 @@
> + #endif
> + #include "vmcircbuf.h"
> + #include <gnuradio/buffer.h>
> ++#include <gnuradio/integer_math.h>
> + #include <gnuradio/math.h>
> + #include <assert.h>
> + #include <algorithm>
> + #include <iostream>
> + #include <stdexcept>
> + 
> +-// the following header is deprecated as of Boost 1.66.0, and the
> +-// other API was introduced in Boost 1.58.0. Since we still support
> +-// Boost back to 1.54.0, use the older API if pre-1.5.80 and otherwise
> +-// use the newer API.
> +-#if (BOOST_VERSION < 105800)
> +-#include <boost/math/common_factor_rt.hpp>
> +-#else
> +-#include <boost/integer/common_factor_rt.hpp>
> +-#endif
> +-
> + namespace gr {
> + 
> + static long s_buffer_count = 0; // counts for debugging storage mgmt
> +@@ -68,13 +59,9 @@ static long s_buffer_reader_count = 0;
> +  *
> +  *     type_size * nitems == k * page_size
> +  */
> +-static long minimum_buffer_items(long type_size, long page_size)
> ++static inline long minimum_buffer_items(long type_size, long page_size)
> + {
> +-#if (BOOST_VERSION < 105800)
> +-    return page_size / boost::math::gcd(type_size, page_size);
> +-#else
> +-    return page_size / boost::integer::gcd(type_size, page_size);
> +-#endif
> ++    return page_size / GR_GCD(type_size, page_size);
> + }
> + 
> + 
> +diff --git a/gr-digital/lib/symbol_sync_cc_impl.cc b/gr-digital/lib/symbol_sync_cc_impl.cc
> +index 55f85e7c6a7..55f162dc727 100644
> +--- a/gr-digital/lib/symbol_sync_cc_impl.cc
> ++++ b/gr-digital/lib/symbol_sync_cc_impl.cc
> +@@ -13,9 +13,9 @@
> + #endif
> + 
> + #include "symbol_sync_cc_impl.h"
> ++#include <gnuradio/integer_math.h>
> + #include <gnuradio/io_signature.h>
> + #include <gnuradio/math.h>
> +-#include <boost/math/common_factor.hpp>
> + #include <stdexcept>
> + 
> + namespace gr {
> +@@ -95,7 +95,7 @@ symbol_sync_cc_impl::symbol_sync_cc_impl(enum ted_type detector_type,
> +         throw std::runtime_error("unable to create interpolating_resampler_ccf");
> + 
> +     // Block Internal Clocks
> +-    d_interps_per_symbol_n = boost::math::lcm(d_ted->inputs_per_symbol(), d_osps_n);
> ++    d_interps_per_symbol_n = GR_LCM(d_ted->inputs_per_symbol(), d_osps_n);
> +     d_interps_per_ted_input_n = d_interps_per_symbol_n / d_ted->inputs_per_symbol();
> +     d_interps_per_output_sample_n = d_interps_per_symbol_n / d_osps_n;
> + 
> +diff --git a/gr-digital/lib/symbol_sync_ff_impl.cc b/gr-digital/lib/symbol_sync_ff_impl.cc
> +index d0ec32ab192..1172c1b4f8a 100644
> +--- a/gr-digital/lib/symbol_sync_ff_impl.cc
> ++++ b/gr-digital/lib/symbol_sync_ff_impl.cc
> +@@ -13,9 +13,9 @@
> + #endif
> + 
> + #include "symbol_sync_ff_impl.h"
> ++#include <gnuradio/integer_math.h>
> + #include <gnuradio/io_signature.h>
> + #include <gnuradio/math.h>
> +-#include <boost/math/common_factor.hpp>
> + #include <stdexcept>
> + 
> + namespace gr {
> +@@ -97,7 +97,7 @@ symbol_sync_ff_impl::symbol_sync_ff_impl(enum ted_type detector_type,
> +         throw std::runtime_error("unable to create interpolating_resampler_fff");
> + 
> +     // Block Internal Clocks
> +-    d_interps_per_symbol_n = boost::math::lcm(d_ted->inputs_per_symbol(), d_osps_n);
> ++    d_interps_per_symbol_n = GR_LCM(d_ted->inputs_per_symbol(), d_osps_n);
> +     d_interps_per_ted_input_n = d_interps_per_symbol_n / d_ted->inputs_per_symbol();
> +     d_interps_per_output_sample_n = d_interps_per_symbol_n / d_osps_n;
> + 
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
