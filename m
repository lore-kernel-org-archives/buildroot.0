Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09F6D609B1
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 15:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6B6482548;
	Tue, 16 Dec 2025 15:40:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0puv2CltXQi; Tue, 16 Dec 2025 15:40:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD23082352
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765899658;
	bh=LJcI/PhH82Ja/AUX7zD1oRvNo4ge7g6/aEr5WQrG/yk=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=BXuvPrZPRXcpI4ACPuA2TUdZYwoyMs8WP6VRhuHr4VLmxPaoGz3a+S8n5Ovu3jfhs
	 CqTit/Nt17T033prfVWbYfOV96eulMHcoyX6VxqcVkH7aMMllWueqdyL8O8exfhSDa
	 P7GN30rt/dbzQQUD0IGtZ4PhU5IHsqRn+dGQjM5FkZck2C06kcRyWeupTIXDmmjfvP
	 7nAlnsOBPiCUzeyQvpWR99IcNcTntK82p1IPz0AeHQLXWQI5p+q9ljR6qNBdgavElm
	 4suTGN8H6gqG1lZtnmDa99jrYCvbFOunzgODgByCTaHF5VhsDTfckX6/fvAJwNmXww
	 wgTjy6W5wkGKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD23082352;
	Tue, 16 Dec 2025 15:40:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 678E3370
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E26F403A0
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r17dSLwNYIgS for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 15:40:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BD44F40071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD44F40071
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD44F40071
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:40:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 90FD74E41C3A;
 Tue, 16 Dec 2025 15:40:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 670936071C;
 Tue, 16 Dec 2025 15:40:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9BBE8119A8F00; Tue, 16 Dec 2025 16:40:44 +0100 (CET)
Date: Tue, 16 Dec 2025 16:40:43 +0100
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20251216164043.458d92bb@windsurf>
In-Reply-To: <20251216151449.395253-3-kory.maincent@bootlin.com>
References: <20251216151449.395253-1-kory.maincent@bootlin.com>
 <20251216151449.395253-3-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765899647; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=XBbZGgHgC2gfCLNn5wte7Nh9iUPgo8QBhVMfj+QqFhY=;
 b=PEemB2PO2ZdDnyMK//o/qD+Apva6SHoXztGSo/zVQPk6YuFCpH6TnXG7ZTePMVfPiLP60v
 EbtupWNghjCrDKa+OttmcOMYH+1zdo8JSEjbAbeU/DZsM6nlNUICGSzIS8VZ39FRuhx0Jz
 sGqhhQ//+htTROoFuv3l7FTrayh/qmIvvpQjkJYlsbJNBm+EVspk9QEHY0kqJlgEPPRi21
 jlKv2o8YCeJh5gCmFCzrym+QdRIGogVcg3WF1LpJmkinFtw/1CZlrBtrBjLo/tl8kkAYUZ
 V6BlhtPgLOe6KwDGeuHdE+qQcSzyzt4caoLgzsfHWUry5MbeSVqA2uUKY9/q3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=PEemB2PO
Subject: Re: [Buildroot] [PATCH v3 2/5] configs/beaglebone: Bump to Linux
 mainline 6.18.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Cc: Bajjuri Praneeth <praneeth@ti.com>, Julien Olivain <ju.o@free.fr>,
 Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Kory,

On Tue, 16 Dec 2025 15:14:42 +0000
Kory Maincent <kory.maincent@bootlin.com> wrote:

>  board/beagleboard/beaglebone/linux.config     | 682 ++++++++++++++++++

If you provide a custom defconfig, it really needs to be tailored to the platform.

> +CONFIG_ARCH_SUNPLUS=y

Why?

> +CONFIG_ARCH_KEYSTONE=y

Why?

> +CONFIG_ARCH_OMAP3=y
> +CONFIG_ARCH_OMAP4=y

Why?

> +CONFIG_SOC_OMAP5=y

Why?

> +CONFIG_SOC_AM33XX=y
> +CONFIG_SOC_AM43XX=y

Why?

> +CONFIG_SOC_DRA7XX=y

Why?



> +CONFIG_NET_DSA_TAG_RZN1_A5PSW=m

Useless.

> +CONFIG_HSR=m

Needed?

> +CONFIG_QRTR=m
> +CONFIG_QRTR_SMD=m

Same?

> +CONFIG_CAN=y
> +CONFIG_BT=m

Do we have BT?

> +CONFIG_BT_HCIUART=m
> +CONFIG_BT_HCIUART_BCM=y
> +CONFIG_BT_MRVL=m
> +CONFIG_BT_MRVL_SDIO=m
> +CONFIG_CFG80211=m
> +CONFIG_MAC80211=m

Do we have WiFi ?

> +CONFIG_RFKILL=y
> +CONFIG_RFKILL_INPUT=y
> +CONFIG_RFKILL_GPIO=y
> +CONFIG_NFC=m

Do we have NFC ?


> +CONFIG_VEXPRESS_CONFIG=y

Vexpress ?

> +CONFIG_ARM_SCMI_PROTOCOL=y

I don't think we're using SCMI.

> +CONFIG_IMX_SCMI_BBM_EXT=y

Not needed.

> +CONFIG_TI_SCI_PROTOCOL=y

Needed?

> +CONFIG_TRUSTED_FOUNDATIONS=y
> +CONFIG_EFI_CAPSULE_LOADER=m
> +CONFIG_MTD=y
> +CONFIG_MTD_TESTS=m
> +CONFIG_MTD_CMDLINE_PARTS=y
> +CONFIG_MTD_BLOCK=y
> +CONFIG_MTD_CFI=y
> +CONFIG_MTD_CFI_INTELEXT=y
> +CONFIG_MTD_PHYSMAP=y
> +CONFIG_MTD_PHYSMAP_OF=y
> +CONFIG_MTD_RAW_NAND=y
> +CONFIG_MTD_NAND_DENALI_DT=y
> +CONFIG_MTD_NAND_OMAP2=y
> +CONFIG_MTD_NAND_OMAP_BCH=y
> +CONFIG_MTD_NAND_BRCMNAND=y

Broadcom NAND driver ?

> +CONFIG_MTD_NAND_BRCMNAND_BCMBCA=y
> +CONFIG_MTD_NAND_BRCMNAND_BRCMSTB=y
> +CONFIG_MTD_NAND_BRCMNAND_IPROC=y
> +CONFIG_MTD_NAND_DAVINCI=y

Needed ?

> +CONFIG_MTD_SPI_NOR=y
> +CONFIG_MTD_UBI=y
> +CONFIG_BLK_DEV_LOOP=y
> +CONFIG_BLK_DEV_RAM=y
> +CONFIG_BLK_DEV_RAM_SIZE=65536
> +CONFIG_VIRTIO_BLK=y
> +CONFIG_AD525X_DPOT=y
> +CONFIG_AD525X_DPOT_I2C=y

Needed ?

> +CONFIG_ICS932S401=y

Needed ?

> +CONFIG_APDS9802ALS=y

etc. Please review the options :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
