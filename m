Return-Path: <SRS0=6sxh=PL=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6E1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 16:47:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E30EA60ED5
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 16:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E30EA60ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A16FD81AF5;
	Sat, 23 Oct 2021 16:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 66xgf2H0_2QV; Sat, 23 Oct 2021 16:47:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0951781AD7;
	Sat, 23 Oct 2021 16:47:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A4251BF2AA
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 16:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68C18400D5
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 16:47:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SeHiHfE1RPAW for <buildroot@lists.busybox.net>;
 Sat, 23 Oct 2021 16:47:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EEAC6400BF
 for <buildroot@buildroot.org>; Sat, 23 Oct 2021 16:47:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8cf8:eeb7:8c5b:1909])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 712FF780340;
 Sat, 23 Oct 2021 18:47:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1635007661;
 bh=8uwO+fmT2NfBfXm0pHfSNxRGOChwCfkvfdgbw0FmcI0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cxrvFY9jGurDk3MI+YwNmdXUQAqDjmrfT1QL1Ads9CW0lG6v612SCV5yiWhTf3Ufi
 pzSpM/vF6QC8bC3q2ED3QhJIz+0DlDcYYX/z+yMs62R0PvhHuEk3V+YYA1E/v29Mfa
 N2hrjRZEvYRu3lgsmiNUWPv+mppNiSf+rTu2G1YqWnOE5rT+TCj9Vy4/UimrvOQiWS
 MBhfRDAggl7ijGyreV9OhpFJFFSM3rKX8s5xNvdmQ6zDx9Hv8+lEiGFWdUTSORl6li
 4KU7lKIjdqdGE8wliKZM+QEsBO0PUr1KoD+j31X7pliLWlPbkCisv4FUM8O4G3S1oj
 QO6mjoQof/AaQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Oct 2021 18:47:32 +0200
Date: Sat, 23 Oct 2021 18:47:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211023164732.GI2400@scaer>
References: <20211021210823.148802-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021210823.148802-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-firmware: fix
 BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X
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
Cc: Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-10-21 23:08 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since the rework of boot/config
> file handling in commit 689b9ac439ab7b507c8982b6102bddf59d03efbf:
> 
> /usr/bin/install: cannot stat '/home/giuliobenetti/autobuild/run/instance-3/output-1/build/rpi-firmware-2ef3800b1b71c0e30c2a61ecad6e007ae96ea342/boot/startx.elf': No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/88b2137ea81c4944cbded11fa68adcbca02e83d0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rpi-firmware/rpi-firmware.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 8a6a435f63..c0beef7b42 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -13,7 +13,7 @@ RPI_FIRMWARE_INSTALL_IMAGES = YES
>  RPI_FIRMWARE_FILES = \
>  	$(if $(BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN), bootcode.bin) \
>  	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI), start.elf fixup.dat) \
> -	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X), startx.elf fixupx.dat) \
> +	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X), start_x.elf fixupx.dat) \
>  	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD), start_cd.elf fixup_cd.dat) \
>  	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_DB), start_db.elf fixup_db.dat) \
>  	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4), start4.elf fixup4.dat) \
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
