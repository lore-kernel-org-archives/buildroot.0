Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19865C433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 07:40:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4AE5611C3
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 07:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4AE5611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B806606A7;
	Sat, 16 Oct 2021 07:40:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OUb8jPXGBlUC; Sat, 16 Oct 2021 07:40:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFAB66067F;
	Sat, 16 Oct 2021 07:40:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1AAB1BF369
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 07:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF70B40260
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 07:40:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-v3-aa55Nly for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 07:40:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44BDA401D1
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 07:40:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ae:6c95:da51:607e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A753878037F;
 Sat, 16 Oct 2021 09:39:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634370006;
 bh=RuirAsZjDwAE3qbim9kskO2xNESN0SQ05NFz6KMbDeY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C2fkYqJndP02O+/EK3ge+ouJf/+w3uqHQJwsfhl0XaWVuY943Z02qw8nwrgPMWE7+
 mCDqfLAmokmvAGArSEan0sLDNBsUmvy+Cn1QzSqELU3d6IKHE8NJiehCqFY2FIJcFH
 O1wnntzEv1OZqR5KlpP7HpoEcZui3HcHn54tAvrmJxNbMOxUUW65lCDhIMMRRDEXL9
 wph+127hcQktlrmnB5sIwskO/KR35SB1pllWcCLgLY5yyQmeGceey1cUeENiT5yQ1G
 VbX5B4kFeT2r1DM04BrCApm/9RtdX3ts6cBjmhilaWAxgf/zEpY9ReKs023gHWNzLk
 ySkFKSoWO8Kiw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Oct 2021 09:39:55 +0200
Date: Sat, 16 Oct 2021 09:39:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211016073955.GC4165837@scaer>
References: <20211015193901.1543587-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015193901.1543587-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/4] package/python-ujson: fix or1k build
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-10-15 21:38 +0200, Fabrice Fontaine spake thusly:
> Fix the follownig build failure on or1k since bump to version 4.1.0 in
> commit a47f332a20bf3f79ef4903c8ddd2b7917217e354 and
> https://github.com/ultrajson/ultrajson/commit/eb7d894f225bb89d269188ba6ec559b914a71b8a:
> 
> In file included from ./deps/double-conversion/double-conversion/bignum-dtoa.h:31,
>                  from ./deps/double-conversion/double-conversion/bignum-dtoa.cc:30:
> ./deps/double-conversion/double-conversion/utils.h:92:2: error: #error Target architecture was not detected as supported by Double-Conversion.
>    92 | #error Target architecture was not detected as supported by Double-Conversion.
>       |  ^~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a82f794f130b0c8d5d626c507bae2e22d15f801b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series of 4 patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...for-aarch64_be-or1k-and-microblazebe.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/python-ujson/0001-Add-support-for-aarch64_be-or1k-and-microblazebe.patch
> 
> diff --git a/package/python-ujson/0001-Add-support-for-aarch64_be-or1k-and-microblazebe.patch b/package/python-ujson/0001-Add-support-for-aarch64_be-or1k-and-microblazebe.patch
> new file mode 100644
> index 0000000000..b43eb54dcd
> --- /dev/null
> +++ b/package/python-ujson/0001-Add-support-for-aarch64_be-or1k-and-microblazebe.patch
> @@ -0,0 +1,30 @@
> +From 768a445f0c28311bf88685bf0bb990505c12fd4c Mon Sep 17 00:00:00 2001
> +From: Florian Loitsch <florian@loitsch.com>
> +Date: Sat, 8 Sep 2018 18:18:15 +0200
> +Subject: [PATCH] Add support for aarch64_be, or1k and microblazebe.
> +
> +Fixes #73.
> +
> +[Retrieved from:
> +https://github.com/google/double-conversion/commit/768a445f0c28311bf88685bf0bb990505c12fd4c]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + double-conversion/utils.h | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/deps/double-conversion/ouble-conversion/utils.h b/deps/double-conversion/double-conversion/utils.h
> +index 98a2a11..492bc97 100644
> +--- a/deps/double-conversion/double-conversion/utils.h
> ++++ b/deps/double-conversion/double-conversion/utils.h
> +@@ -76,8 +76,9 @@ inline void abort_noreturn() { abort(); }
> +     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
> +     defined(__SH4__) || defined(__alpha__) || \
> +     defined(_MIPS_ARCH_MIPS32R2) || \
> +-    defined(__AARCH64EL__) || defined(__aarch64__) || \
> +-    defined(__riscv)
> ++    defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
> ++    defined(__riscv) || \
> ++    defined(__or1k__)
> + #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
> + #elif defined(__mc68000__) || \
> +     defined(__pnacl__) || defined(__native_client__)
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
