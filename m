Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7DCC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 08:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A2CE607BC;
	Mon, 19 Aug 2024 08:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GAP0Vsu5taSX; Mon, 19 Aug 2024 08:32:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44432607C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44432607C9;
	Mon, 19 Aug 2024 08:32:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC6C41BF3EF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 08:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB0B1401D1
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 08:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YlesIZAVKE8Q for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 08:32:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7C51E40469
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C51E40469
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C51E40469
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 08:32:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CD1960008;
 Mon, 19 Aug 2024 08:32:27 +0000 (UTC)
Date: Mon, 19 Aug 2024 10:32:26 +0200
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <20240819103226.4895c5e3@booty>
In-Reply-To: <20240815-boot-uboot-clean-for-pmufw-v1-1-3f0d9909c0b4@collins.com>
References: <20240815-boot-uboot-clean-for-pmufw-v1-0-3f0d9909c0b4@collins.com>
 <20240815-boot-uboot-clean-for-pmufw-v1-1-3f0d9909c0b4@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724056347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SL1k0F3OOkaNjVNkT1BBpQ7YYk3wJtEjsOh4HdLjkoA=;
 b=Q56w75PEizusPA7uYAF1s77RHM5el8Ta6loGUtYfY5Uvy4/T+rTssWGcXqhXRftB9THszT
 PWiq0OMu4cCBSjb+bsaJRgCmJe0G5zasXR+Le3Fdw5+HZJuNzjBtdDc+JxKSf+iV7qXB/S
 4e0VvOpzDNIeGd1WyfuOKwhWahd9edkjL7U71RFk/hTnsb1YHTXp7w+t2n9U5PjudBDzEF
 i2RJvSqdlv3UwzvdtNrASgBIdNh9sGhFieWthIbVTMB6xJnTjmyvIJW91qhDJmvN8auqLm
 4UY/PVxQO/D11zyHIHcPUiYna/Cl/OSAMTnxdemOy4AcIJIEoYHDakUFekb/cQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q56w75PE
Subject: Re: [Buildroot] [PATCH 1/2] boot/uboot: avoid setting
 PMUFW_INIT_FILE when not used
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neal Frager <neal.frager@amd.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Brandon,

On Thu, 15 Aug 2024 14:22:30 +0000
Brandon Maier <brandon.maier@collins.com> wrote:

> The CONFIG_PMUFW_INIT_FILE is always set, even when
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW is an empty string, which prevents a user
> from setting this directly in their U-Boot defconfig or frag.

I think there are two potential reasons for applying this patch:

 1. setting an empty string lets the build finish apparently
    successfully, but the output binaries are not working

 2. allowing users to set CONFIG_PMUFW_INIT_FILE in their U-Boot config
    and have Buildroot let it pass through

For point 1, as I wrote earlier today I think this won't happen, based
on the U-Boot code.

For point 2, which is the motivation you present in this patch, I don't
see a valid use case. Without a use case, I'd rather not add code to
uboot.mk, no matter if it is only a few lines. With a use case, I'd be
totally OK.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
