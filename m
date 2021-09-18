Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC49CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 17:45:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E99D610E9
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 17:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E99D610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5625640018;
	Sat, 18 Sep 2021 17:45:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fH4Rn9I887bU; Sat, 18 Sep 2021 17:45:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E90540188;
	Sat, 18 Sep 2021 17:45:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2944E1BF2F8
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 17:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18C84414C9
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 17:45:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HQCxkyxfOI0q for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 17:45:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0219140825
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 17:45:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4971EB00568;
 Sat, 18 Sep 2021 19:45:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631987153;
 bh=pSfG1R7VKIGwcrxlvMBMNfdxMVcATvFXCmly9b7TUtI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GqX25AL0tYzwUJFNhkRFSg3MRbh+rV4bmZZWOsFMThujD+UGtDvyUQoaEhWyFZOW6
 tY8qNADvYWVnZGlGAOGO/Bxve7fR02THZcrxbiMHq3TTbkxVUc9nrTdyOP5SLb7CHp
 j4lB6hipcgI1BXagUrBBfWKuChYzWnWFEJgbYz6pSIkWI8lNEEjg8LRoE+s5Ibg3qQ
 LlU/hH2z0dp9+dvq2+k1vI5FGu+i07QPTx3Xv5CIFVH7/JEEk3UVWhdpoI5/KWB5uT
 /EQeMGb1mW8p9jJl5hURHGRpkuYX2cC2Ii9qR7K9gbTFxpRvjIkZ3oOA/pqT2mXlMG
 AhfRu53/TddUA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 19:45:48 +0200
Date: Sat, 18 Sep 2021 19:45:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20210918174548.GG1053080@scaer>
References: <20210918164248.20023-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210918164248.20023-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/botan: add upstream security fix
 for CVE-2021-40529
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

Peter, All,

On 2021-09-18 18:42 +0200, Peter Korsgaard spake thusly:
> Fixes the following security issue:
> 
> - CVE-2021-40529: The ElGamal implementation in Botan through 2.18.1, as
>   used in Thunderbird and other products, allows plaintext recovery because,
>   during interaction between two cryptographic libraries, a certain
>   dangerous combination of the prime defined by the receiver's public key,
>   the generator defined by the receiver's public key, and the sender's
>   ephemeral exponents can lead to a cross-configuration attack against
>   OpenPGP
> 
> For more details, see the upstream bug and issue writeup:
> - https://github.com/randombit/botan/pull/2790
> - https://ibm.github.io/system-security-research-updates/2021/07/20/insecurity-elgamal-pt1
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Note: I haven't received the mail for the erlang patch yet, so I can't
reply to it; consider it applied to master anyway, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...d-using-short-exponents-with-ElGamal.patch | 38 +++++++++++++++++++
>  package/botan/botan.mk                        |  3 ++
>  2 files changed, 41 insertions(+)
>  create mode 100644 package/botan/0001-Avoid-using-short-exponents-with-ElGamal.patch
> 
> diff --git a/package/botan/0001-Avoid-using-short-exponents-with-ElGamal.patch b/package/botan/0001-Avoid-using-short-exponents-with-ElGamal.patch
> new file mode 100644
> index 0000000000..e2570cd5ff
> --- /dev/null
> +++ b/package/botan/0001-Avoid-using-short-exponents-with-ElGamal.patch
> @@ -0,0 +1,38 @@
> +From 9a23e4e3bc3966340531f2ff608fa9d33b5185a2 Mon Sep 17 00:00:00 2001
> +From: Jack Lloyd <jack@randombit.net>
> +Date: Tue, 3 Aug 2021 18:20:29 -0400
> +Subject: [PATCH] Avoid using short exponents with ElGamal
> +
> +Some off-brand PGP implementation generates keys where p - 1 is
> +smooth, as a result short exponents can leak enough information about
> +k to allow decryption.
> +
> +Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> +[Peter: Drop tests, CVE-2021-40529]
> +---
> + src/lib/pubkey/elgamal/elgamal.cpp        |  8 +++-
> + 1 file changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/src/lib/pubkey/elgamal/elgamal.cpp b/src/lib/pubkey/elgamal/elgamal.cpp
> +index b3ec6df2c..0e33c2ca5 100644
> +--- a/src/lib/pubkey/elgamal/elgamal.cpp
> ++++ b/src/lib/pubkey/elgamal/elgamal.cpp
> +@@ -113,8 +113,12 @@ ElGamal_Encryption_Operation::raw_encrypt(const uint8_t msg[], size_t msg_len,
> +    if(m >= m_group.get_p())
> +       throw Invalid_Argument("ElGamal encryption: Input is too large");
> + 
> +-   const size_t k_bits = m_group.exponent_bits();
> +-   const BigInt k(rng, k_bits);
> ++   /*
> ++   Some ElGamal implementations foolishly use prime fields where p - 1 is
> ++   smooth, as a result it is unsafe to use short exponents.
> ++   */
> ++   const size_t k_bits = m_group.p_bits() - 1;
> ++   const BigInt k(rng, k_bits, false);
> + 
> +    const BigInt a = m_group.power_g_p(k, k_bits);
> +    const BigInt b = m_group.multiply_mod_p(m, monty_execute(*m_monty_y_p, k, k_bits));
> +-
> +-- 
> +2.20.1
> +
> diff --git a/package/botan/botan.mk b/package/botan/botan.mk
> index c23aba99dd..0ac528c990 100644
> --- a/package/botan/botan.mk
> +++ b/package/botan/botan.mk
> @@ -11,6 +11,9 @@ BOTAN_LICENSE = BSD-2-Clause
>  BOTAN_LICENSE_FILES = license.txt
>  BOTAN_CPE_ID_VENDOR = botan_project
>  
> +# 0001-Avoid-using-short-exponents-with-ElGamal.patch
> +BOTAN_IGNORE_CVES += CVE-2021-40529
> +
>  BOTAN_INSTALL_STAGING = YES
>  
>  BOTAN_CONF_OPTS = \
> -- 
> 2.20.1
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
