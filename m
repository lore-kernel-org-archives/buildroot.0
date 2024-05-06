Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF44C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E05418227F;
	Mon,  6 May 2024 20:11:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDmVE9BL02ge; Mon,  6 May 2024 20:11:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CF058228E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CF058228E;
	Mon,  6 May 2024 20:11:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B715F1BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A21A08227F
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKjWjSUVvnGC for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:11:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82D708229D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82D708229D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82D708229D
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:11:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ADA6FE0002;
 Mon,  6 May 2024 20:11:06 +0000 (UTC)
Date: Mon, 6 May 2024 22:11:05 +0200
To: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Message-ID: <20240506221105.3a75f41c@windsurf>
In-Reply-To: <20240430-optee-update-v2-3-5bdc2f940db1@ti.com>
References: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
 <20240430-optee-update-v2-3-5bdc2f940db1@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715026267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lPZdgN9mK9yP0v6gtaHZrHoO7NJwEDYR6eyFyUHtuEM=;
 b=MmtICBvUuqWTvnaYZX5t/obSLM2+Hi1D77ouwvhI7TULq/sB9gVRs+2UM5Vl8vZaqi6Eua
 0x546o11SI1KFDebT3p0Xgyg6SOB/HAZVt9cSzp+z+pXQb0TGoOKG6hSYCxhj1vXTsJ5CK
 xivj2Jzwc3aMiUKqZ6Y54DJxS69Rq296w9KuQwsuClcX2hZN8lLlkPDTL0cJMvZV0T9QK1
 gYc40NPP6UcI7B7FmcjRmdFuSGdNyOQGtuVyah4WDCVEW9Vsh63loVd/VNSDDB+B8lGOEU
 puo6YcBV79669jKMfkRkwjQNGbQyEWDFPAxkagzOYNcNQYzWo8yfT4ZP0dQzlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MmtICBvU
Subject: Re: [Buildroot] [PATCH RESEND v2 03/11] boot/ti-k3-r5-loader: bump
 to version v2024.04
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

On Thu, 2 May 2024 11:26:53 -0500
Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:

>  TI_K3_R5_LOADER_VERSION = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_VERSION))
> +TI_K3_R5_LOADER_DL_DIR = $(UBOOT_DL_DIR)

This is an unrelated change, so I dropped it from the commit when
applying.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
