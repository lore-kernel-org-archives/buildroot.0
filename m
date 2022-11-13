Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39FAC4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5950F4050F;
	Sun, 13 Nov 2022 21:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5950F4050F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ZggYmHbZ1IZ; Sun, 13 Nov 2022 21:39:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FDCF40267;
	Sun, 13 Nov 2022 21:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FDCF40267
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D73541BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2B87405A2
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2B87405A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OP33No50TQDG for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:39:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 681454058B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 681454058B
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:39:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a384:6f9d:ef21:3500])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2DE3019F57C;
 Sun, 13 Nov 2022 22:39:34 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Nov 2022 22:39:33 +0100
Date: Sun, 13 Nov 2022 22:39:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221113213933.GA1722608@scaer>
References: <20221111215759.358116-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221111215759.358116-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668375577;
 bh=7xsAA1KxpTqgOs0aSlk9B0x1uuOi5H8IGopYSw3GF/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=soFtlLM1uhi7sgl99BcYMy+i2DxH+Nh1mHMyPFI77u9oyafczW671DiSsVLV/tfQk
 dwgsxhOUcneWgFHvHCllneOI6wcgogJ6oxNszO5W2BtQz1JFHJYUw1ivHOG+EEvSUh
 EvGkfY0dGuY8UbWlH/AT1uVgY58wmFnbwvICSAhroS0t+mf24EKEtkn7/Ml5AWU3M7
 CNOp1uDigN/MtWd7kboJd1wYWMCAZL6bENwGfbfyaWzGDW4tQwXRiicf4tfJzn4gJL
 taB+Tk2UTgOSj1fYG/YF9RyA1pWZ8+EdndbYt+yx6y+zB00D8GfXKv58lNX0LpM/wC
 oiK+rorgJOuVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=soFtlLM1
Subject: Re: [Buildroot] [PATCH 1/2] arch/arch.mk.xtensa: relax check on
 overlay file to apply only to internal toolchains
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-11-11 22:57 +0100, Thomas Petazzoni spake thusly:
> Commit 4cbf7336914f25478aea943456ba7dc3c892c21a ("arch/xtensa: custom
> configuration requires an overlay") added a check in
> arch/arch.mk.xtensa to bail out if a custom Xtensa core is selected
> but not overlay file is provided. While this is indeed a perfectly
> valid check to make when building an internal toolchain, with an
> external toolchain it's entirely possible to build with no overlay
> file: the toolchain already exists, and there's no overlay to be
> applied in the context of the Buildroot build.
> 
> And indeed commit 4cbf7336914f25478aea943456ba7dc3c892c21a broke some
> of the runtime test cases that use a custom Xtensa core configuration,
> with no overlay, to test the toolchains.bootlin.com Xtensa external
> toolchain. By relaxing the check to only apply to internal toolchain
> configurations, we fix those test cases.

I've added a blurb explaining that we can still build gdb with no
overlay in that case, which amounts to building for the fsf variant,
which may cause failures like what 4cbf7336914f was supposed to fix to
begin with. Ditto, I added blurb about building the kernel wihtout an
overlay, but that is less problematic in fact.

> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261966
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261963
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  arch/arch.mk.xtensa | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
> index 7b6c59cecd..75145e725f 100644
> --- a/arch/arch.mk.xtensa
> +++ b/arch/arch.mk.xtensa
> @@ -1,6 +1,6 @@
>  BR_ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
>  
> -ifeq ($(BR_BUILDING)$(BR2_XTENSA_CUSTOM):$(BR_ARCH_XTENSA_OVERLAY_FILE),yy:)
> +ifeq ($(BR_BUILDING)$(BR2_XTENSA_CUSTOM)$(BR2_TOOLCHAIN_BUILDROOT):$(BR_ARCH_XTENSA_OVERLAY_FILE),yyy:)
>  $(error No xtensa overlay file provided. Check your BR2_XTENSA_OVERLAY_FILE setting)
>  endif
>  
> -- 
> 2.38.1
> 

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
