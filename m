Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F568C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCD5A409B4;
	Wed, 27 Jul 2022 07:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCD5A409B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d0U9_RdU07GD; Wed, 27 Jul 2022 07:57:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6917A409A7;
	Wed, 27 Jul 2022 07:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6917A409A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C77BD1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1106409A7
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1106409A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJWRDxd-tnKn for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:57:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 605B74099D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 605B74099D
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:57:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9946:e64:fb26:3d99])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2B18178050B;
 Wed, 27 Jul 2022 09:57:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Jul 2022 09:57:17 +0200
Date: Wed, 27 Jul 2022 09:57:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220727075717.GA1085273@scaer>
References: <20220726163951.2111731-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220726163951.2111731-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658908641;
 bh=BY3v7gyU2tcuQS2lobN4DpCyJsGlntCHv05fDRen1Dw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iqyp2xiB3plIrkT+LgF4MReopLegZiWvvhUSL8Eemt5eD+fTSDI9ZW63CPdEw8Gwq
 aF6Q11fmp2Ohzy0oZZoBtmEek5IOVjUoLIqygebLpw0WlNys/+C2gv+ZxEqIT9J3hG
 sytMGTHNn0GOOfZQMwuRjnWRAl9yV/z+kbxOhadXWyZ7JRUImkwoApggbDsBgsarqa
 e2VA/el4yf4h/h2qFStyF4lxwIVeUAMy+JVJwlnxNlViMzJPaEvyHjFrEZBEBxsP9z
 AdMUnu12PYQDj/Rcr5IHUIjpVWINEyFih/LG/SXqb5o5B5BnfoXH9AyOxjubKlNhz6
 yXwQHwHAiL0cg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iqyp2xiB
Subject: Re: [Buildroot] [PATCH v2 1/4] arch/Config.in.riscv: lp64f ABI is
 only supported if MMU is enabled
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
Cc: Mark Corbin <mark@dibsco.co.uk>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-07-26 18:39 +0200, Thomas Petazzoni via buildroot spake thusly:
> Even though that seems weird, the LP64F ABI is only supported when MMU
> support is enabled. Indeed, as per commit
> 9a51381cedc16e6d70cb85e1144f6e0fa89af69a ("package/uclibc: prevent
> config with unsupported RISC-V float ABI"), uClibc does not support
> LP64F. But uClibc is the only C library that support RISC-V 64-bit
> noMMU.
> 
> So the selection of LP64F and !MMU is impossible. Right now this
> selection causes a build failure as no C library is enabled.
> 
> This commit fixes this by ensuring we cannot use LP64F when MMU
> support is not available.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/6320dcc655f1871eb8bf6a9689bddde7447385f5/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  arch/Config.in.riscv | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
> index 288ed833eb..30bdcaa80b 100644
> --- a/arch/Config.in.riscv
> +++ b/arch/Config.in.riscv
> @@ -108,6 +108,7 @@ config BR2_RISCV_ABI_LP64
>  config BR2_RISCV_ABI_LP64F
>  	bool "lp64f"
>  	depends on BR2_ARCH_IS_64 && BR2_RISCV_ISA_RVF
> +	depends on BR2_USE_MMU
>  
>  config BR2_RISCV_ABI_LP64D
>  	bool "lp64d"
> -- 
> 2.37.1
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
