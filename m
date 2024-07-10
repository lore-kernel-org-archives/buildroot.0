Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8231C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 12:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 874E360FFC;
	Wed, 10 Jul 2024 12:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vnj2Gb9LWj2q; Wed, 10 Jul 2024 12:50:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EA2260FDB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EA2260FDB;
	Wed, 10 Jul 2024 12:50:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0768E1BF310
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 12:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E94B160FD3
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 12:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DQQu59TFq3L for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 12:50:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B719860FC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B719860FC2
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B719860FC2
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 12:50:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 793DD1C0005;
 Wed, 10 Jul 2024 12:49:57 +0000 (UTC)
Date: Wed, 10 Jul 2024 14:49:56 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240710144956.1c3ef45e@windsurf>
In-Reply-To: <20240620183304.1835189-1-dario.binacchi@amarulasolutions.com>
References: <20240620183304.1835189-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720615797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8lIZc6x5Akbt4SPOZABISebY3Y+PG8qijxCQCRRXF7M=;
 b=TupVFnglY9cPAyZe5CDBnWcBW9+pWgu9c2ygT5YB9FedwMQ8GeM8xpjqZmbVtQK9k1lnoY
 EneE7MF7Mi5fM8dGT3ILil79hwYvtp2ps5ERHSEcnxoGLiL/B7j2uOIpD/fOck36h+hzde
 X8E+NoLtSTbQ5RRezr4Efuy7GR7Toq7lrCb1rjMaN7zjjqeE97nqdMs7XX0ZRBvDgHQnfw
 d1qtlLW93opdKNgHacOWLPvLy9OOj9TRLG4ehe7Y0Uzaw7h0G0JiLaKeMd5VBuB6thNX/R
 V74JX+bsh3rZQaW2y3yLgW6gJUa8zd+Upq1LwrGhnwz4KPPfLwktC5qQLDM95g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TupVFngl
Subject: Re: [Buildroot] [PATCH 1/2] configs/stm32f469_disco_{sd,
 xip}: bump Linux to 5.15.161
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
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 20 Jun 2024 20:33:03 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch bumps the Linux kernel to version 5.15.161 for both
> configurations and U-Boot to version 2024.04 for the SD one. Using the
> same kernel will subsequently allow adding the hash files in a single
> location. The use of version 5.15 revealed a regression in the management
> of the serial UART, which required the application of a correction patch.
> This patch has been submitted to the stable tree.
> 
> Furthermore, now even the xip configuration uses the same headers as
> the used Linux kernel.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  ...0001-serial-stm32-rework-RX-over-DMA.patch | 407 ++++++++++++++++++
>  configs/stm32f469_disco_sd_defconfig          |   7 +-
>  configs/stm32f469_disco_xip_defconfig         |   5 +-
>  3 files changed, 414 insertions(+), 5 deletions(-)
>  create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/0001-serial-stm32-rework-RX-over-DMA.patch

Thanks for the patch! Could you send an update to 5.15.162, which now
includes the patch fixing the UART issue? This request is also valid
for your patch on the stm32f769 platform.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
