Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7F6C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25E6A822CE;
	Mon,  6 May 2024 20:10:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2UGc9qgGhmy; Mon,  6 May 2024 20:10:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31B598234D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31B598234D;
	Mon,  6 May 2024 20:10:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C93F1BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4868E822CE
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id inUP0jWNsy5X for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:10:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 88CB78234D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88CB78234D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88CB78234D
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:10:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A88F5C0002;
 Mon,  6 May 2024 20:10:41 +0000 (UTC)
Date: Mon, 6 May 2024 22:10:40 +0200
To: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Message-ID: <20240506221040.7d93b31e@windsurf>
In-Reply-To: <20240430-optee-update-v2-5-5bdc2f940db1@ti.com>
References: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
 <20240430-optee-update-v2-5-5bdc2f940db1@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715026242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cAFMGQloYOf/rs6BmgAw8YPk/On3D8EmMEEuDE+UGOI=;
 b=oJr1r8DuupYnar6Mrt1bbPZ8+Xrl3aeU2YPxY17IcV/I85OsTXlYaYoq6w6+1MDTzd8Mtp
 dFWINjBzA/9y6KCdUxAfiisi6HrtF+l1ZR5MN4+iXKrC5FwQcT6NokwAx6DigSaST+76sK
 +JKnCxbHffP3uoSYqqBr8vFf2UB/L1a1I2rngNbcR1dxsNCjjK1T0IbWnIUIRV8tetZCAk
 7u1sRumSqN+DN4aHsY66xPf8qm+9MMyEAdoVUC2y5j5kq0uKVwBUBwctbiecxtApSXNOb2
 szOBd0nOgrLc0/W3sWAAD0pSEZsSPsz3wzgsiUF7jqBTIxXTotJ6CWKiU4xPOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oJr1r8Du
Subject: Re: [Buildroot] [PATCH RESEND v2 05/11]
 configs/ti_am62x_sk_defconfig: update TFA to v2.10
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Bryan Brattlof <bb@ti.com>, Etienne Carriere <etienne.carriere@foss.st.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 2 May 2024 11:26:55 -0500
Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:

> Update the TFA firmware to the latest LTS tag for v2.10 release of
> arm-trusted-firmware
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
>  .../ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
>  configs/ti_am62x_sk_defconfig                                           | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

The update of TF-A/U-Boot/Linux in one defconfig could be done in one
single commit, so you could have done:

  configs/ti_am62x_sk: update Linux, U-Boot, TF-A
  configs/ti_am64x_sk: update Linux, U-Boot, TF-A

This is generally considered a good enough split.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
