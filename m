Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D97C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:48:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB58660F26
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB58660F26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B15A283410;
	Sun, 25 Jul 2021 07:47:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B0dD4DGqqdPg; Sun, 25 Jul 2021 07:47:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E573E833FB;
	Sun, 25 Jul 2021 07:47:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 936791BF48C
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 822D0403B2
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5W7WJ_S08fmE for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 07:47:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73FF8403B1
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 07:47:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4802:7ee4:40b0:1519])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id DAD1A780333;
 Sun, 25 Jul 2021 09:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627199274;
 bh=8GvKHpDr3tXecRZ5FLnQLYUaDTchubA+E507isHjBAg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aLi+bSq0UoXd5zslTMerFNu202eFKvPVslmyVAJRWtcpDzMUxdXcm0j/S82l9/W0F
 iibM69kPSQG+movpVFya1Yh8dOEuqqide6d0sFrENaeb7eI1/kUGAXDZMM2J/lTINH
 9KucKyEVAHpX70cmYymETZznrnRxeMzTjNYK/fGSMUPo5fqbuD8/2Lo4EjtB4ar2FO
 Bb3poabBHUVmYA1Z1CjMM5YcD+DqH/M7OwszLvM/Oo5I4+pap5N/h16RPsZYLFKY+A
 9RQ6Pdj9Nmno+htzoa1fmR1v+QtCfxXIYsgZK+i1tSQ111I8JcgvGZYVnlXAJoerlu
 49ugqC7vs++Og==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Jul 2021 09:47:49 +0200
Date: Sun, 25 Jul 2021 09:47:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20210725074749.GO2382418@scaer>
References: <20210724214526.47637-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210724214526.47637-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v4 1/3] package/clapack: introduce
 BR2_PACKAGE_CLAPACK_ARCH_SUPPORTS
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Arnout, All,

On 2021-07-24 23:45 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> This makes it easier for packages that depend on clapack to get
> their dependencies correct.
> 
> Since the glibc dependency only exists for PowerPC, treat it as
> an architecture dependency.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/clapack/Config.in | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/package/clapack/Config.in b/package/clapack/Config.in
> index a912eb6c91..98f94b0e60 100644
> --- a/package/clapack/Config.in
> +++ b/package/clapack/Config.in
> @@ -1,14 +1,19 @@
> +config BR2_PACKAGE_CLAPACK_ARCH_SUPPORTS
> +	bool
> +	default y
> +	# assembler: Error: value out of range
> +	depends on !BR2_m68k_cf
> +	# _fpu_control is used on PowerPC, but not available with
> +	# uClibc or musl
> +	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC
> +
>  comment "clapack needs a glibc toolchain"
>  	depends on BR2_powerpc
>  	depends on !BR2_TOOLCHAIN_USES_GLIBC
>  
>  config BR2_PACKAGE_CLAPACK
>  	bool "cblas/clapack"
> -	# _fpu_control is used on PowerPC, but not available with
> -	# uClibc or musl
> -	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC
> -	# assembler: Error: value out of range
> -	depends on !BR2_m68k_cf
> +	depends on BR2_PACKAGE_CLAPACK_ARCH_SUPPORTS
>  	help
>  	  BLAS and LAPACK C implementation (f2c'ed version of).
>  
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
