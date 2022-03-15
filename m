Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D941C433FE
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 20:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACB51415A8;
	Tue, 15 Mar 2022 20:16:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qDYTGhqA6EvT; Tue, 15 Mar 2022 20:16:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7782241592;
	Tue, 15 Mar 2022 20:16:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D8EC61BF31E
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE2E54045C
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:16:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mUsOFw33JhE5 for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 20:16:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1AF6408BA
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 20:16:10 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id t1so280793edc.3
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 13:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=inzDXfa6JhqjRVf1svp0DInQX61Q2ORcHAP8GSX5vk4=;
 b=aEDM7WUXV6z1DwgetfOPPPjh6sU7/iTYCrg9wmS6iQZ3SW0/DU5kX1ODCnUq9E5KlK
 /GUwvCbopYyfcIu+sXfnKE2RpZJtUD4p8yMiCABMMtWb5GZUP4kGweTt84yqlP5PUrYt
 Er6zgl9HwuR0fy2MDFHJsmZKvRQiEbW0cHfeJRbokgOi0z8PAHxCygrAr2p4pYCRzKyj
 hvEVnkyA2dOAtLVREQJZO/XiexiwfnxIfmqp81O2Ske7dIoy4/aSQC8Z8dnshhOm3q97
 RTnAvJiiX6OKnTsK8nxX1iv+WDvzTcGqQim4Q6nD/Ur/4iJxN4MNe6PykIAERDRPsGuu
 ap9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=inzDXfa6JhqjRVf1svp0DInQX61Q2ORcHAP8GSX5vk4=;
 b=og9SwUJOZjTObQJ7nfO110WKMh0vF7nHktCYNc7GrpA508byr7mFUlca8JLXskGOT/
 +UH9lDC9W0Lf5C+U2R+JncWEL6BKp0SnYmb/bH7d/3QmjqAAAK+reFYQNg1u0e72Ojc8
 ZaDrik7mx3PRnQi/7V8xp8RWdRpuABedxg0IsOMW8m3JcQoe2TbPOQ0SVzOpInSL19H5
 iLxqymNhK/xnTq6ImQe9OnbBPl6E7QmZ0J6Jebh22KVvtV1A4DbdTI/X+hyJneeGn2ls
 MAzcSATG1FN8wy3jPE9oRIto5SGRX/WM9lWZ04agpbjpA4lxVZLqp1Sq82c7zG4R3MCo
 J5zQ==
X-Gm-Message-State: AOAM532k6XXljwHFwUxHb5OV/gD+IHfxgzeIvNEcF7iROrnyZB0WqBie
 KRjZco2HiI/2yjDXD+VH0Bg9aw==
X-Google-Smtp-Source: ABdhPJxtBG4lxVyQIluzKNOX1+e81WMsYHjUbR1L/It8YIQcvPdH7+xjmrSTlr3944VB7TG45mWALA==
X-Received: by 2002:a05:6402:35c7:b0:418:600e:516c with SMTP id
 z7-20020a05640235c700b00418600e516cmr16792249edc.28.1647375368604; 
 Tue, 15 Mar 2022 13:16:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 k20-20020a170906681400b006da86bef01fsm22738ejr.79.2022.03.15.13.16.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 13:16:08 -0700 (PDT)
Message-ID: <c5e113ab-c880-8337-824e-a11cca699f20@mind.be>
Date: Tue, 15 Mar 2022 21:16:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220227091533.3645027-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220227091533.3645027-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/botan: bump to version
 2.19.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/02/2022 10:15, Fabrice Fontaine wrote:
> - Drop patch (not needed since
>    https://github.com/randombit/botan/commit/97483f93bdcfcb2cc86bcb103802be55c24ad633)
> - Update hash of license file (update in year:
>    https://github.com/randombit/botan/commit/ff62a51ac2ed2e265edaf51b532d32eed5864d4b)
> 
> https://github.com/randombit/botan/blob/2.19.1/news.rst
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...d-a-miscompilation-issue-in-clang-12.patch | 144 ------------------
>   package/botan/botan.hash                      |   4 +-
>   package/botan/botan.mk                        |   2 +-
>   3 files changed, 3 insertions(+), 147 deletions(-)
>   delete mode 100644 package/botan/0001-Revert-workaround-a-miscompilation-issue-in-clang-12.patch
> 
> diff --git a/package/botan/0001-Revert-workaround-a-miscompilation-issue-in-clang-12.patch b/package/botan/0001-Revert-workaround-a-miscompilation-issue-in-clang-12.patch
> deleted file mode 100644
> index b43aeafe13..0000000000
> --- a/package/botan/0001-Revert-workaround-a-miscompilation-issue-in-clang-12.patch
> +++ /dev/null
> @@ -1,144 +0,0 @@
> -From 372bdf0348fb86d671e73baab19daa34bd0cf73d Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Tue, 9 Nov 2021 19:01:20 +0100
> -Subject: [PATCH] Revert "workaround a miscompilation issue in clang 12
> - (XCode 13)"
> -
> -This reverts commit 219329f8e777af54d785ae7259f8be32a714b751.
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/randombit/botan/issues/2845]
> ----
> - src/lib/hash/sha3/sha3.cpp                | 46 ++++++-----------------
> - src/lib/hash/sha3/sha3_bmi2/sha3_bmi2.cpp | 46 ++++++-----------------
> - 2 files changed, 22 insertions(+), 70 deletions(-)
> -
> -diff --git a/src/lib/hash/sha3/sha3.cpp b/src/lib/hash/sha3/sha3.cpp
> -index 289e451ff..690c2b264 100644
> ---- a/src/lib/hash/sha3/sha3.cpp
> -+++ b/src/lib/hash/sha3/sha3.cpp
> -@@ -11,47 +11,23 @@
> - #include <botan/exceptn.h>
> - #include <botan/cpuid.h>
> -
> --#include <tuple>
> --
> - namespace Botan {
> -
> - namespace {
> -
> --// This is a workaround for a suspected bug in clang 12 (and XCode 13)
> --// that caused a miscompile of the SHA3 implementation for optimization
> --// level -O2 and higher.
> --//
> --// For details, see: https://github.com/randombit/botan/issues/2802
> --#if    defined(__clang__) && \
> --    (( defined(__apple_build_version__) && __clang_major__ == 13) || \
> --     (!defined(__apple_build_version__) && __clang_major__ == 12))
> --#define BOTAN_WORKAROUND_MAYBE_INLINE __attribute__((noinline))
> --#else
> --#define BOTAN_WORKAROUND_MAYBE_INLINE inline
> --#endif
> --
> --BOTAN_WORKAROUND_MAYBE_INLINE std::tuple<uint64_t, uint64_t, uint64_t, uint64_t, uint64_t>
> --   xor_CNs(const uint64_t A[25])
> --   {
> --   return {
> --      A[0] ^ A[5] ^ A[10] ^ A[15] ^ A[20],
> --      A[1] ^ A[6] ^ A[11] ^ A[16] ^ A[21],
> --      A[2] ^ A[7] ^ A[12] ^ A[17] ^ A[22],
> --      A[3] ^ A[8] ^ A[13] ^ A[18] ^ A[23],
> --      A[4] ^ A[9] ^ A[14] ^ A[19] ^ A[24]};
> --   }
> --
> --#undef BOTAN_WORKAROUND_MAYBE_INLINE
> --
> - inline void SHA3_round(uint64_t T[25], const uint64_t A[25], uint64_t RC)
> -    {
> --   const auto Cs = xor_CNs(A);
> --
> --   const uint64_t D0 = rotl<1>(std::get<0>(Cs)) ^ std::get<3>(Cs);
> --   const uint64_t D1 = rotl<1>(std::get<1>(Cs)) ^ std::get<4>(Cs);
> --   const uint64_t D2 = rotl<1>(std::get<2>(Cs)) ^ std::get<0>(Cs);
> --   const uint64_t D3 = rotl<1>(std::get<3>(Cs)) ^ std::get<1>(Cs);
> --   const uint64_t D4 = rotl<1>(std::get<4>(Cs)) ^ std::get<2>(Cs);
> -+   const uint64_t C0 = A[0] ^ A[5] ^ A[10] ^ A[15] ^ A[20];
> -+   const uint64_t C1 = A[1] ^ A[6] ^ A[11] ^ A[16] ^ A[21];
> -+   const uint64_t C2 = A[2] ^ A[7] ^ A[12] ^ A[17] ^ A[22];
> -+   const uint64_t C3 = A[3] ^ A[8] ^ A[13] ^ A[18] ^ A[23];
> -+   const uint64_t C4 = A[4] ^ A[9] ^ A[14] ^ A[19] ^ A[24];
> -+
> -+   const uint64_t D0 = rotl<1>(C0) ^ C3;
> -+   const uint64_t D1 = rotl<1>(C1) ^ C4;
> -+   const uint64_t D2 = rotl<1>(C2) ^ C0;
> -+   const uint64_t D3 = rotl<1>(C3) ^ C1;
> -+   const uint64_t D4 = rotl<1>(C4) ^ C2;
> -
> -    const uint64_t B00 =          A[ 0] ^ D1;
> -    const uint64_t B01 = rotl<44>(A[ 6] ^ D2);
> -diff --git a/src/lib/hash/sha3/sha3_bmi2/sha3_bmi2.cpp b/src/lib/hash/sha3/sha3_bmi2/sha3_bmi2.cpp
> -index c7f1914a3..a9650ad9d 100644
> ---- a/src/lib/hash/sha3/sha3_bmi2/sha3_bmi2.cpp
> -+++ b/src/lib/hash/sha3/sha3_bmi2/sha3_bmi2.cpp
> -@@ -8,47 +8,23 @@
> - #include <botan/sha3.h>
> - #include <botan/rotate.h>
> -
> --#include <tuple>
> --
> - namespace Botan {
> -
> - namespace {
> -
> --// This is a workaround for a suspected bug in clang 12 (and XCode 13)
> --// that caused a miscompile of the SHA3 implementation for optimization
> --// level -O2 and higher.
> --//
> --// For details, see: https://github.com/randombit/botan/issues/2802
> --#if    defined(__clang__) && \
> --    (( defined(__apple_build_version__) && __clang_major__ == 13) || \
> --     (!defined(__apple_build_version__) && __clang_major__ == 12))
> --#define BOTAN_WORKAROUND_MAYBE_INLINE __attribute__((noinline))
> --#else
> --#define BOTAN_WORKAROUND_MAYBE_INLINE inline
> --#endif
> --
> --BOTAN_WORKAROUND_MAYBE_INLINE std::tuple<uint64_t, uint64_t, uint64_t, uint64_t, uint64_t>
> --   xor_CNs(const uint64_t A[25])
> --   {
> --   return {
> --      A[0] ^ A[5] ^ A[10] ^ A[15] ^ A[20],
> --      A[1] ^ A[6] ^ A[11] ^ A[16] ^ A[21],
> --      A[2] ^ A[7] ^ A[12] ^ A[17] ^ A[22],
> --      A[3] ^ A[8] ^ A[13] ^ A[18] ^ A[23],
> --      A[4] ^ A[9] ^ A[14] ^ A[19] ^ A[24]};
> --   }
> --
> --#undef BOTAN_WORKAROUND_MAYBE_INLINE
> --
> - inline void SHA3_BMI2_round(uint64_t T[25], const uint64_t A[25], uint64_t RC)
> -    {
> --   const auto Cs = xor_CNs(A);
> --
> --   const uint64_t D0 = rotl<1>(std::get<0>(Cs)) ^ std::get<3>(Cs);
> --   const uint64_t D1 = rotl<1>(std::get<1>(Cs)) ^ std::get<4>(Cs);
> --   const uint64_t D2 = rotl<1>(std::get<2>(Cs)) ^ std::get<0>(Cs);
> --   const uint64_t D3 = rotl<1>(std::get<3>(Cs)) ^ std::get<1>(Cs);
> --   const uint64_t D4 = rotl<1>(std::get<4>(Cs)) ^ std::get<2>(Cs);
> -+   const uint64_t C0 = A[0] ^ A[5] ^ A[10] ^ A[15] ^ A[20];
> -+   const uint64_t C1 = A[1] ^ A[6] ^ A[11] ^ A[16] ^ A[21];
> -+   const uint64_t C2 = A[2] ^ A[7] ^ A[12] ^ A[17] ^ A[22];
> -+   const uint64_t C3 = A[3] ^ A[8] ^ A[13] ^ A[18] ^ A[23];
> -+   const uint64_t C4 = A[4] ^ A[9] ^ A[14] ^ A[19] ^ A[24];
> -+
> -+   const uint64_t D0 = rotl<1>(C0) ^ C3;
> -+   const uint64_t D1 = rotl<1>(C1) ^ C4;
> -+   const uint64_t D2 = rotl<1>(C2) ^ C0;
> -+   const uint64_t D3 = rotl<1>(C3) ^ C1;
> -+   const uint64_t D4 = rotl<1>(C4) ^ C2;
> -
> -    const uint64_t B00 =          A[ 0] ^ D1;
> -    const uint64_t B01 = rotl<44>(A[ 6] ^ D2);
> ---
> -2.33.0
> -
> diff --git a/package/botan/botan.hash b/package/botan/botan.hash
> index 91e1bf741a..2729cb493f 100644
> --- a/package/botan/botan.hash
> +++ b/package/botan/botan.hash
> @@ -1,4 +1,4 @@
>   # From https://botan.randombit.net/releases/sha256sums.txt
> -sha256  541a3b13f1b9d30f977c6c1ae4c7bfdfda763cda6e44de807369dce79f42307e  Botan-2.18.2.tar.xz
> +sha256  e26e00cfefda64082afdd540d3c537924f645d6a674afed2cd171005deff5560  Botan-2.19.1.tar.xz
>   # Locally computed
> -sha256  fb7f0322d36fba55ca17d77bc203a9f09a40daa8a249b75cf8887aba36cec9d0  license.txt
> +sha256  472faf6d2231130382779f96de506be19296473750356449fc426ddc9cb03b50  license.txt
> diff --git a/package/botan/botan.mk b/package/botan/botan.mk
> index ebff1343b1..f9ebcf8d0a 100644
> --- a/package/botan/botan.mk
> +++ b/package/botan/botan.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -BOTAN_VERSION = 2.18.2
> +BOTAN_VERSION = 2.19.1
>   BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
>   BOTAN_SITE = http://botan.randombit.net/releases
>   BOTAN_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
