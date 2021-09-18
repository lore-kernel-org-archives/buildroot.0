Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D080CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 12:47:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F15061351
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 12:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F15061351
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26DD4425F2;
	Sat, 18 Sep 2021 12:47:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E66gVGJVyowK; Sat, 18 Sep 2021 12:47:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63877425E6;
	Sat, 18 Sep 2021 12:47:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2EB9C1BF364
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 12:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 181048438B
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 12:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9BRkCx9pUoTH for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 12:47:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D53C84389
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 12:47:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EFE14B0053B;
 Sat, 18 Sep 2021 14:47:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631969268;
 bh=6izlorG21y92c+/VOxZyWd6ortSB1kJ0a2qMxsLQhNc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JJDr1bWg6DvFrrC71KVBuoer5KxXnuIf+ek4zjLj4plcnPZsMQOnw2Ds6i5FRwZ+R
 NlJOLIQpTRzQPAORxIZm/9zGJjKRbQoCoNIhL1Ker0D3gIo5C8YSD+hZpudrj/reXb
 SpFVZELBU09TY66eSIhqXQl8bNIR/M1qN6tQJOGFKwIyA54y0jxtpPIkS6ihdKOlst
 JXAuaVjuFXL3czJexOZBGEEiv0uUwFQ34r1AgnmICwok2F9b91q32WeRK+z4OmWTvh
 wIDeUhVlkh9M9G/4WDACKtyQ1mGOO6xrYLt+YbnTOM4lvohN31eBGU5BiDEInDrX7Z
 t/1GxB1Apjzfw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 14:47:39 +0200
Date: Sat, 18 Sep 2021 14:47:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20210918124739.GN1053080@scaer>
References: <20210914221053.265590-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914221053.265590-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/mesa3d: fix build on m68k
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Giulio, All,

On 2021-09-15 00:10 +0200, Giulio Benetti spake thusly:
> To build mesa3d for m68k we need to pass -mlong-jump-table-offsets CFLAG
> since 'switch' blocks are pretty wide and lead to build failure. This way
> 'switch' blocks will have a 32-bit addressing by default instead of the
> standard 16-bit.
> 
> Fixes:
> http://autobuild.buildroot.net/results/60c4653c2a93125edbdd0beb43cd47301643464a/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/mesa3d/mesa3d.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 54b50f684f..809a7d8e88 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -259,4 +259,13 @@ else
>  MESA3D_CONF_OPTS += -Dzstd=disabled
>  endif
>  
> +MESA3D_CFLAGS = $(TARGET_CFLAGS)
> +
> +# m68k needs 32-bit offsets in switch tables to build
> +ifeq ($(BR2_m68k),y)
> +MESA3D_CFLAGS += -mlong-jump-table-offsets

That option has only been added to gcc-7 [0] [1], which makes gcc >= 7 a
pre-requisite for m68k, while mesa3d currently has no such requirement.
Maybe add something like:

    depends on !BR2_m68k || BR2_TOOLCHAIN_GCC_AT_LEAST_7

Then it should be propagated to the few packages that select mesa3d;

    package/intel-mediadriver/
        -> not needed, already depends on x86_64, so implies !m68k

    package/x11r7/xdriver_xf86-video-imx-viv/
        -> this should not be needed either, because imx is an ARM, but
           xdriver_xf86-video-imx-viv is missing a depends on BR2_arm
           (although the comments do have that dependency). However, it
           depends on other imx related packages, and they depend on
           either arm or aarch64, so that implies !m68k.

So, no need to propagate the new dependency.

[0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57583#c15
[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57583#c16

Regards,
Yann E. MORIN.

> +endif
> +
> +MESA3D_CONF_OPTS += -DCMAKE_C_FLAGS="$(MESA3D_CFLAGS)"
> +
>  $(eval $(meson-package))
> -- 
> 2.25.1
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
