Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F740C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 10:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCA2060B1A;
	Sun, 25 Sep 2022 10:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCA2060B1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0VwlnfuqM9zx; Sun, 25 Sep 2022 10:04:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D202360AEB;
	Sun, 25 Sep 2022 10:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D202360AEB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE9731BF5A9
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 10:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C831E41603
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 10:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C831E41603
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pp3GbtoflcTB for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 10:04:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45E4D415AE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45E4D415AE
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 10:04:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:139f:51c2:7bd0:4f35])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DF77C13F854;
 Sun, 25 Sep 2022 12:03:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Sep 2022 12:03:55 +0200
Date: Sun, 25 Sep 2022 12:03:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220925100355.GG1127102@scaer>
References: <20220925090920.1585682-1-thomas.petazzoni@bootlin.com>
 <20220925090920.1585682-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220925090920.1585682-3-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664100239;
 bh=RjYAQyeGlhsHTJnXF+Sk9rTy6wqHHwjNLGD/ThmguCk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hctkxASQ9fB0DDVkasrhyQoc4mk6uQGodr3Ay11f6GvRzPfQz+L3lQziB3VfhIhFE
 OFYB0yJfZn6JHoIAF7R+0Qo7zguTzs+7TYM3ehOhkS3iyNXHphL08RXwUjb4bLJXym
 Urld/1y9x1s02T8c819vqwKmhW1OeAuJ8ddH4hhRTWIMEi3P3y44pdcaSTRJhl0zdt
 fWanm+C8RkEEbGwVmzsdi8TPyTTErV201WGfGMOHWydo2JtSdJVVTMGUV6waoWo7Au
 rCjqf3Yw6CV1VVpGkX6GgOysrBnjBtMwaAIvQ9EY7VdIXV4ilIQu+hBXrRGpx/moPY
 ncsbnD0XFD3Kw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hctkxASQ
Subject: Re: [Buildroot] [PATCH v2 2/5] Revert "arch/xtensa: custom
 configuration requires an overlay"
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

On 2022-09-25 11:09 +0200, Thomas Petazzoni spake thusly:
> This reverts commit 4cbf7336914f25478aea943456ba7dc3c892c21a.
> 
> This commit breaks the build of BR2_XTENSA_CUSTOM=y configurations
> that use an external toolchain. In such configurations, having an
> empty overlay is perfectly fine.

As 4cbf7336914f explained, an empty overlay is equivalent to using the
fsf variant, so in that case, there would be no point in asking for a
custom core to begin with, and Max Filipov seemed to agree:
    https://lore.kernel.org/buildroot/CAMo8BfKHKuVC86uOwP0z8CzE425q7u0B_q6jdeU0Rw9upaiY=Q@mail.gmail.com/

So, I think we are maybe taking the issue from the wrong side here. We
should forbid an empty overlay only when using our internal toolchain
for a custom xtensa core. I.e.:

    diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
    index 7b6c59cecd..1799528a93 100644
    --- a/arch/arch.mk.xtensa
    +++ b/arch/arch.mk.xtensa
    @@ -1,8 +1,10 @@
     BR_ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
     
    -ifeq ($(BR_BUILDING)$(BR2_XTENSA_CUSTOM):$(BR_ARCH_XTENSA_OVERLAY_FILE),yy:)
    +ifeq ($(BR_BUILDING)$(BR2_TOOLCHAIN_BUILDROOT),yy)
    +ifeq ($(BR_ARCH_XTENSA_OVERLAY_FILE),)
     $(error No xtensa overlay file provided. Check your BR2_XTENSA_OVERLAY_FILE setting)
     endif
    +endif
     
     ################################################################################
     # This variable can be used by packages that need to extract the
     # overlay.

Regards,
Yann E. MORIN.

> For example, this commit broke the
> following two runtime tests:
> 
>   tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinXtensalx60UclibcBleedingEdge
>   tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinXtensalx60UclibcStable
> 
> And in fact, having an empty overlay is even correct when building an
> internal toolchain. The endianness issue that
> 4cbf7336914f25478aea943456ba7dc3c892c21a was attempting to fix has
> been fixed in a better way by the previous commit.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  arch/arch.mk.xtensa | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
> index 7b6c59cecd..fd410f6bfa 100644
> --- a/arch/arch.mk.xtensa
> +++ b/arch/arch.mk.xtensa
> @@ -1,9 +1,3 @@
> -BR_ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
> -
> -ifeq ($(BR_BUILDING)$(BR2_XTENSA_CUSTOM):$(BR_ARCH_XTENSA_OVERLAY_FILE),yy:)
> -$(error No xtensa overlay file provided. Check your BR2_XTENSA_OVERLAY_FILE setting)
> -endif
> -
>  ################################################################################
>  # This variable can be used by packages that need to extract the overlay.
>  #
> @@ -15,6 +9,7 @@ endif
>  #       tar xf $(ARCH_XTENSA_OVERLAY_FILE) -C $(@D) --strip-components=1 gcc
>  #   endif
>  ################################################################################
> +BR_ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
>  ifneq ($(filter http://% https://% ftp://% scp://%,$(BR_ARCH_XTENSA_OVERLAY_FILE)),)
>  ARCH_XTENSA_OVERLAY_URL = $(BR_ARCH_XTENSA_OVERLAY_FILE)
>  ARCH_XTENSA_OVERLAY_FILE = $($(PKG)_DL_DIR)/$(notdir $(BR_ARCH_XTENSA_OVERLAY_FILE))
> -- 
> 2.37.3
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
