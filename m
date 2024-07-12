Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34F5C3DA4B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 13:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71EAB413E3;
	Fri, 12 Jul 2024 13:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sn6awfTU4BcC; Fri, 12 Jul 2024 13:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 369AE41486
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 369AE41486;
	Fri, 12 Jul 2024 13:55:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 254CE1BF59E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EFD8401C7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RziBW3ebjLVD for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 13:55:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A9F5040185
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9F5040185
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9F5040185
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:55:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69B70240005;
 Fri, 12 Jul 2024 13:55:49 +0000 (UTC)
Date: Fri, 12 Jul 2024 15:55:48 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240712155548.2482c429@windsurf>
In-Reply-To: <20240622180432.4094568-1-dario.binacchi@amarulasolutions.com>
References: <20240622180432.4094568-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720792549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mnt+i26SeBXotrh4VMjJ+JSol5iEWTdORU+uGP2K52Y=;
 b=NjEN7LaCXVfxs8TEHcZnyVYsOXeR449SbpwuQHXzQXm2p9VmmqB1ODh32jjgAxJipofZSI
 zeKFYecX3iICHnON0n91e617uRucxLi/xlU2Q9GF93i6+R8kkUhXWbFboZzmf2P/wRsize
 h7S7SByB0DW6+Y/r9N2obr+QbkN//Unhf2T60bmVFHT8MrZHipmGT3a6bPji/HYoi0JDCX
 PR6oAhKqWXiSHcnbMofX7+iG9fgwNneX/u8hMM0QBk3GGFLK45ycl2iW0U747tbiOb3dSJ
 zyo5xEkJb4hH9ThmA3OPn/lpDdREwsCwUrNkRd8dOWsb5/A/r9inn3iAZj/DgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NjEN7LaC
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32mp157a_dk1: add hashes
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
Cc: Marleen Vos <marleen.vos@mind.be>, Bartosz Bilas <b.bilas@grinn-global.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 22 Jun 2024 20:04:32 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch adds .hash files for Arm trusted firmware, Linux, Linux headers
> and U-Boot and then enables BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we
> can now drop the defconfig from .checkpackageignore.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .checkpackageignore                                             | 1 -
>  .../patches/arm-trusted-firmware/arm-trusted-firmware.hash      | 2 ++
>  .../stm32mp157a-dk1/patches/linux-headers/linux-headers.hash    | 1 +
>  .../stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash | 2 ++
>  .../stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash | 2 ++
>  configs/stm32mp157a_dk1_defconfig                               | 2 ++
>  6 files changed, 9 insertions(+), 1 deletion(-)
>  create mode 100644 board/stmicroelectronics/stm32mp157a-dk1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
>  create mode 120000 board/stmicroelectronics/stm32mp157a-dk1/patches/linux-headers/linux-headers.hash
>  create mode 100644 board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash
>  create mode 100644 board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
