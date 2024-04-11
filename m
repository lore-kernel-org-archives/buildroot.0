Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF37CD1292
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 04:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32CA34097A;
	Thu, 11 Apr 2024 04:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3gFb5Mr0jF51; Thu, 11 Apr 2024 04:36:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF91D410AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF91D410AE;
	Thu, 11 Apr 2024 04:36:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E669C1BF396
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 04:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3B3140278
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 04:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LU5zfnm3vMxx for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 04:36:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B54DE40253
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B54DE40253
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B54DE40253
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 04:36:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E708B13F880;
 Thu, 11 Apr 2024 06:36:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Apr 2024 06:36:03 +0200
Date: Thu, 11 Apr 2024 06:36:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <Zhdos3DsdwoSHqtR@landeda>
References: <20240410221806.89203-1-romain.naour@smile.fr>
 <20240410221806.89203-2-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240410221806.89203-2-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712810166;
 bh=jz82lsYd/TKR7Y7fRx4Vr/wkI7LrcItGiKWqqPFwFf0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u8Ucyxwm8cceD3PMiLgi+1zARDe36L100P8HgBmIc1wqpkOW/KJ4IWJoQfo58KSGd
 pZZ9pE2+GZam21598lN9QvdemFChscSf6+KqXl0qlG6tOj75eBTu1KxFAWVsyqGR64
 HW4x2fw/l9BZFrO26wamHqGcSLrTO+3hG2VAz5cQRXOPU6UFM5rLqwcwmTnicewNnJ
 CiNkcp0FDDvZdQt3vsKvph4LvGd1Nsm+MwYJXnyBXdegjotiu3FpxObeq36iDAb5MY
 npLHXT0L2XaVOgNGC48EUhYFZzD3w30kqrDW6ys6R9wFoqC8Vvc8W5fgmVMPrWY3OT
 vD+bi2bFSYrfA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=u8Ucyxwm
Subject: Re: [Buildroot] [PATCH] support/testing: sync TestATFAllwinner with
 orangepi_zero_plus2_defconfig
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2024-04-11 00:18 +0200, Romain Naour spake thusly:
> u-boot-2021.04 seems to be broken when pylibfdt support is enabled
> and the latest python3/setuptools are used.
> 
> Since the TestATFAllwinner is using bananapi_m64 as u-boot defconfig
> but the Buildroot defconfig of this board was removed in 2022.11 [1]
> update TestATFAllwinner to use a newer BSP. Use the one provided
> by orangepi_zero_plus2_defconfig.
> 
> [1] daf3c6661f823e566b6310042884c36c1d73f1de
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6477656317 (TestATFAllwinner)
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/boot/test_atf.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
> index 4fcb9b241c..1995f83a54 100644
> --- a/support/testing/tests/boot/test_atf.py
> +++ b/support/testing/tests/boot/test_atf.py
> @@ -34,15 +34,15 @@ class TestATFAllwinner(infra.basetest.BRTest):
>          BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
>          BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>          BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> -        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
> +        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
>          BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
>          # BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP is not set
>          BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
>          BR2_TARGET_UBOOT=y
>          BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>          BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
> -        BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m64"
> +        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
> +        BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus2"
>          BR2_TARGET_UBOOT_NEEDS_DTC=y
>          BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>          BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> -- 
> 2.44.0
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
