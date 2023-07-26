Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB1EC001DC
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBA2440BCC;
	Wed, 26 Jul 2023 21:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBA2440BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mZmtxtqxJkLC; Wed, 26 Jul 2023 21:08:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 446CA40A59;
	Wed, 26 Jul 2023 21:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 446CA40A59
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2726A1BF423
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9E5A6120B
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9E5A6120B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ltYMXkltTkvm for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:08:30 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9F35606CB
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9F35606CB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B61B1C0002;
 Wed, 26 Jul 2023 21:08:21 +0000 (UTC)
Date: Wed, 26 Jul 2023 23:08:20 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230726230820.13458804@windsurf>
In-Reply-To: <20230703160149.2302949-1-dario.binacchi@amarulasolutions.com>
References: <20230703160149.2302949-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690405707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fV8WlDDe1MrAVCFhRxraWG8YVWG2TaQrsXEzgMjro6g=;
 b=m3RSHNipUacWyVKIGfBlyUuD677f3ItyFa+pHQgwg6UxAw8SpMqK/slXlr1L/PJfjALIJp
 pHkSBDSo8TF5Cm8NamDNanu58dj+n+z14iC1KJpzSodWvliRSRrPjtzED6kKf+U6T5x/a6
 KFGbKwHsEGAVAir5y8PowmK999zJ6bUdofZzN2COnsDaR5UXm1Y/6Yu9o+Hbn0EcPUDE9n
 2SNzOyJCmoaC7I03SwFfHp7NSZTQlgkfd+WyjeLhqFqic35+DeV7r/QvYdzxOrdcqSCYqq
 Hj1GcLSdHwy9V86kHzzDIc4GqL2a4H1hY3wlyJL3V1czO8efHlDEYFDUn0n3tg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m3RSHNip
Subject: Re: [Buildroot] [PATCH 1/2] boot/u-boot: fix u-boot.stm32 creation
 on newer version
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, Simon Doppler <dopsi@dopsi.ch>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  3 Jul 2023 18:01:48 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> As reported in commit [1] of the U-Boot project, the config.mk file has
> been suppressed in order to use binman to manage FIT generation.
> 
> The added configuration option allows the creation of the u-boot.stm32
> image for both recent versions of U-Boot, which use binman, and older
> versions.
> 
> [1] 5564b4cd4d5c69 ("stm32mp: add binman support for STM32MP15x")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  boot/uboot/Config.in                            | 10 ++++++++++
>  boot/uboot/uboot.mk                             |  2 ++
>  configs/avenger96_defconfig                     |  1 +
>  configs/olimex_stmp157_olinuxino_lime_defconfig |  1 +
>  configs/stm32mp157a_dk1_defconfig               |  1 +
>  configs/stm32mp157c_dk2_defconfig               |  1 +
>  configs/stm32mp157c_odyssey_defconfig           |  1 +
>  7 files changed, 17 insertions(+)

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
