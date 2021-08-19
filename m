Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7026C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:02:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 637DC610CF
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 637DC610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2047B81973;
	Thu, 19 Aug 2021 20:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UOom8HAVBvfp; Thu, 19 Aug 2021 20:02:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A77581980;
	Thu, 19 Aug 2021 20:02:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 209A91BF59F
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CC7640001
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:02:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e0nxthn7Etay for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:02:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 524DF4011B
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 20:02:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9904:2733:9b91:ffcc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 39B322003AE;
 Thu, 19 Aug 2021 22:02:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629403330;
 bh=A7MJ+kYkC1rbemUd0z+jUb2eqYEqMN3gZJ3f5f06y9g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nwQDUVfErsFQCtZPBCEduqvweSxK50pJUgJy9jp5sFQKmr87Uxzmj6su+wwKz0MaC
 nYDRF7c6rU84Bd4JKKliAYnwRGG6Nse04cW1CKOAczYtpav7jHmy0HTGnYGlofQqyA
 HJ7KkRZepGknI5ISCiORUpEs2G3xc7eATZbZMruJ5A4FP8QhWGJPt4pCSSnocx2eM4
 vk2R9sL+XeRGoidI5gQ5QqFEK+ZiDroQyb+PlF7/r+VHmUrz9z2ZgggrTJxu3lVX7h
 Q+EOUMceRnsV9cA0Pmg6rAskUmD8a0u7655Koa+Bu4qJMRk/tVxtn7AT8WcbYRTiGl
 ioP4FNw7Id4lg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 19 Aug 2021 22:02:03 +0200
Date: Thu, 19 Aug 2021 22:02:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210819200203.GB27036@scaer>
References: <20210819162821.803728-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210819162821.803728-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/rustc: fix conditions related to
 MIPS support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Thomas, All,

On 2021-08-19 18:28 +0200, Thomas Petazzoni spake thusly:
> For MIPS64 architecture variants supported by Rust, we need to exclude
> MIPS64R6, but due to a copy/paste mistake in commit
> d69d40c029dc7d8199b745eaee759d92b66c5d17 ("package/rustc: add support
> for Tier 1 and Tier 2 platform"), we used BR2_MIPS_CPU_MIPS32R6 for
> both MIPS 32-bit and MIPS 64-bit configurations, while
> BR2_MIPS_CPU_MIPS64R6 should be used on MIPS 64-bit.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/8bab232eb98b164df300581ae019254bde7c8ca3/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rustc/Config.in.host | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> index c5f64fd3c6..90ea56f626 100644
> --- a/package/rustc/Config.in.host
> +++ b/package/rustc/Config.in.host
> @@ -36,11 +36,11 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
>  	# mips-unknown-linux-gnu
>  	default y if BR2_mips && BR2_TOOLCHAIN_USES_GLIBC && !BR2_MIPS_CPU_MIPS32R6
>  	# mips64-unknown-linux-gnuabi64
> -	default y if BR2_mips64 && BR2_TOOLCHAIN_USES_GLIBC && BR2_MIPS_NABI64 && !BR2_MIPS_CPU_MIPS32R6
> +	default y if BR2_mips64 && BR2_TOOLCHAIN_USES_GLIBC && BR2_MIPS_NABI64 && !BR2_MIPS_CPU_MIPS64R6
>  	# mipsel-unknown-linux-gnu
>  	default y if BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC && !BR2_MIPS_CPU_MIPS32R6
>  	# mips64el-unknown-linux-gnuabi64
> -	default y if BR2_mips64el && BR2_TOOLCHAIN_USES_GLIBC && BR2_MIPS_NABI64 && !BR2_MIPS_CPU_MIPS32R6
> +	default y if BR2_mips64el && BR2_TOOLCHAIN_USES_GLIBC && BR2_MIPS_NABI64 && !BR2_MIPS_CPU_MIPS64R6
>  	# powerpc-unknown-linux-gnu
>  	default y if BR2_powerpc && BR2_TOOLCHAIN_USES_GLIBC
>  	# powerpc64-unknown-linux-gnu
> @@ -84,9 +84,9 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
>  	# mips-unknown-linux-musl
>  	default y if BR2_mips && BR2_TOOLCHAIN_USES_MUSL && !BR2_MIPS_CPU_MIPS32R6
>  	# mips64-unknown-linux-muslabi64
> -	default y if BR2_mips64 && BR2_TOOLCHAIN_USES_MUSL && BR2_MIPS_NABI64 && !BR2_MIPS_CPU_MIPS32R6
> +	default y if BR2_mips64 && BR2_TOOLCHAIN_USES_MUSL && BR2_MIPS_NABI64 && !BR2_MIPS_CPU_MIPS64R6
>  	# mips64el-unknown-linux-muslabi64
> -	default y if BR2_mips64el && BR2_TOOLCHAIN_USES_MUSL && BR2_MIPS_NABI64 && !BR2_MIPS_CPU_MIPS32R6
> +	default y if BR2_mips64el && BR2_TOOLCHAIN_USES_MUSL && BR2_MIPS_NABI64 && !BR2_MIPS_CPU_MIPS64R6
>  	# mipsel-unknown-linux-musl
>  	default y if BR2_mipsel && BR2_TOOLCHAIN_USES_MUSL && !BR2_MIPS_CPU_MIPS32R6
>  	# sparc64-unknown-linux-gnu
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
