Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F00AC25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6E828237F;
	Mon,  6 May 2024 20:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oyrOKvhdIBAA; Mon,  6 May 2024 20:07:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 795328236C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 795328236C;
	Mon,  6 May 2024 20:07:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 388931BF33C
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1076F4069C
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXZ7B-W_URof for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:07:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE18D40674
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE18D40674
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE18D40674
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:07:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5C5540004;
 Mon,  6 May 2024 20:07:19 +0000 (UTC)
Date: Mon, 6 May 2024 22:07:18 +0200
To: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Message-ID: <20240506220718.3902a86a@windsurf>
In-Reply-To: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
References: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715026040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r6zHH5S0pY06Uv0Fxm9zIFXx+TenvlZ2ugbJMSfhl9Q=;
 b=g3dH8WQxP/1lDHHEWyAfzYDxGa9q6HeOj3DEMr5pI5DDsOa4UjgxOW8nsX9AUFR6uDvPyb
 DvgZgfV+bjbOWGNz3lwNXuE8iw1M7vORnMVAC+s3No5Cla0xsQs3A2xzBAto5+UjLTjAIE
 m4LaG4bU0WaMCLQLtHbZS3UQUVvz7WKmRxzX9TqoH209C+yIs91uhB1KNL4HjBTlndLm8L
 AuTkI4vAAsFFzjumOmpH9chk56cNfhVGUTeqvznRxcsRkMFe58cUeWc2FFV4Auyue/L6mW
 WRjiQ8RrdKy9l3q1GD1Q5DHzkop2hc4alvcRZxnMSgGIdPy7vcTanckganZnFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g3dH8WQx
Subject: Re: [Buildroot] [PATCH RESEND v2 00/11] update bsp binaries for TI
 SoCs
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
Cc: Bryan Brattlof <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bryan,

On Thu, 2 May 2024 11:26:50 -0500
Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:

> Bryan Brattlof (11):
>       boot/optee-os: bump to release v4.2.0
>       boot/uboot: bump to version v2024.04
>       boot/ti-k3-r5-loader: bump to version v2024.04
>       boot/ti-k3-boot-firmware: bump to version 09.02.00.009
>       configs/ti_am62x_sk_defconfig: update TFA to v2.10
>       configs/ti_am64x_sk_defconfig: update TFA to v2.10
>       configs/ti_am62x_sk_defconfig: update U-Boot to v2024.04
>       configs/ti_am64x_sk_defconfig: update U-Boot to v2024.04
>       configs/ti_am62x_sk_defconfig: bump kernel to v6.8.8
>       configs/ti_am64x_sk_defconfig: update kernel to v6.8.8
>       DEVELOPERS: add myself to TI's packages and reference boards

Thanks, entire series applied! I'll reply individually to a few of the
patches with a few remarks/comments (not much).

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
