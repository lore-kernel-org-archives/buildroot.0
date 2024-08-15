Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA856C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 08:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 662EC60A67;
	Thu, 15 Aug 2024 08:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uaQl5tocR6kL; Thu, 15 Aug 2024 08:13:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 821C260A68
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 821C260A68;
	Thu, 15 Aug 2024 08:13:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 121A61BF2B6
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 08:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F351E40E14
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 08:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J85gbx-T1-DZ for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 08:13:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE70A4026E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE70A4026E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE70A4026E
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 08:13:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D4391C0005;
 Thu, 15 Aug 2024 08:13:46 +0000 (UTC)
Date: Thu, 15 Aug 2024 10:13:45 +0200
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Message-ID: <20240815101345.50a80fa0@windsurf>
In-Reply-To: <20240814-master-v1-1-7834f3deddcb@gmail.com>
References: <20240814-master-v1-0-7834f3deddcb@gmail.com>
 <20240814-master-v1-1-7834f3deddcb@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723709627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2mYa+6AxxnCp+WRudTyrQfbbQZirrKyMS5xTYqnz2eQ=;
 b=IZghPBV4UbUM4XUyQ/qc2W/va9z7moFPb1Snw7ecIS/UVP+sFlUIAJEz3aqpPiLSmwM7rJ
 XUniUf3q6s9X+Hjn97GQQzv6CDIQOFG8RvUsV9NwhCla/iSfF5xUFZ8kSjRX6lzMDkxijj
 zyl4yzuIwyWOI8eh57fiVNQhBrBKnFlAy/RBlfSrCskNzg6uI6f0dN5WRO6p1DWIXvZ4Go
 0xznAY+Z+Abd8Si6h5gghI94N6WS/W3oB6j0EG6L1tejtzaHuIf4IAMfFAaJYkC3+ijOuf
 xp1p2L2Ze6/da+/Xdo6fp18Hajv5Dpuq3SgYwW5zzvM4FasUSjFteqtmscgglQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IZghPBV4
Subject: Re: [Buildroot] [PATCH RESEND 1/2]
 board/stmicroelectronics/common/stm32mp157: rename folder
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marleen Vos <marleen.vos@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 14 Aug 2024 20:37:02 +0200
Raphael Gallais-Pou <rgallaispou@gmail.com> wrote:

> STM32MP15x and STM32MP13 can use almost of the same configuration
> regarding bootloaders and the Linux kernel. To make profit of the
> commont folder, rename it to 'stm32mp1xx' and change dependencies
> accordingly.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  .checkpackageignore                                                   | 2 +-
>  DEVELOPERS                                                            | 2 +-
>  .../common/{stm32mp157 => stm32mp1xx}/genimage.cfg.template           | 0
>  .../patches/arm-trusted-firmware/arm-trusted-firmware.hash            | 0
>  .../patches/linux-headers/linux-headers.hash                          | 0
>  .../common/{stm32mp157 => stm32mp1xx}/patches/linux/linux.hash        | 0
>  .../common/{stm32mp157 => stm32mp1xx}/patches/uboot/uboot.hash        | 0
>  .../common/{stm32mp157 => stm32mp1xx}/post-image.sh                   | 2 +-
>  configs/avenger96_defconfig                                           | 2 +-
>  configs/stm32mp157a_dk1_defconfig                                     | 4 ++--
>  configs/stm32mp157c_dk2_defconfig                                     | 4 ++--
>  11 files changed, 8 insertions(+), 8 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
