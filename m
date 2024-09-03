Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C97CD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 028C640A22;
	Tue,  3 Sep 2024 19:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XshJv45gSVn3; Tue,  3 Sep 2024 19:26:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA3A640A1D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA3A640A1D;
	Tue,  3 Sep 2024 19:26:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D79CB1BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C21C9402FB
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTVLisnW0SSo for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:26:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5E44B402EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E44B402EE
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E44B402EE
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:26:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8275F1C0005;
 Tue,  3 Sep 2024 19:26:12 +0000 (UTC)
Date: Tue, 3 Sep 2024 21:26:11 +0200
To: Niklas Cassel via buildroot <buildroot@buildroot.org>
Message-ID: <20240903212611.613c6d42@windsurf>
In-Reply-To: <20240902104433.2561797-4-niklas.cassel@wdc.com>
References: <20240902104433.2561797-1-niklas.cassel@wdc.com>
 <20240902104433.2561797-4-niklas.cassel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725391572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wNL+Q88u0Ofj0U0q7OR/vS4Qa9RJEcNuZoWrl6Mb6xw=;
 b=jRT+tN/UtGM5qoU1G79zJzoLAVAIl/u8Hc+eAAXHa6/QnxA1S+MOVCFiLXp0ZFYcDJ37q+
 dgZTXxYQ6U89Viw7X30E8TDAt+F/WYHApNNkXjpoXFlKC3BOhm+Opc7HfD38NBhnKi9iHY
 0YI4cr5OUvlpfLB8jq31DfoLCbY4IJIU6H0S2ZHv0Am8lWQQuUekuS2XFJ+CnEVqUk7c1F
 B9qelksPlLwjzQOWpTOp6I/3lDy7HSapKh1op4foBNu8aOOSylv0/aIhmIfO0WZ+pSCjfH
 mSGv+t9p8BUuvFpGV60WNIs1/JGZavHsv+JYVB8lA/PuxoPYFUDjcQPhH1/4+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jRT+tN/U
Subject: Re: [Buildroot] [PATCH 3/5] configs/rock5b: enable eudev to enable
 automatic module loading
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>, Niklas Cassel <cassel@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  2 Sep 2024 12:44:31 +0200
Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:

> From: Niklas Cassel <cassel@kernel.org>
> 
> The arm64 defconfig enables both the R8169 Ethernet driver and the
> PHY_ROCKCHIP_NANENG_COMBO_PHY PHY driver as modules.
> 
> Enable udev so that these modules will get automatically loaded by udev
> after the rootfs is mounted from the SD card.
> 
> This way, we do not need to build these modules as built-in, and we also
> get the benefit that any device plugged in to the PCIe slot will get
> automatically loaded.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

I'm not sure what we want to do here, especially when this ends up
needing net.ifnames=0 that you add in PATCH 4/5.

We do have already a small number of defconfigs that enable eudev. So
far we only use net.ifnames=0 in 4 configurations.

Basically, I'm trying to make sure we remain consistent and have a
policy that applies to all defconfigs rather than ad-hoc solutions that
are different for each and every defconfig. That's why I'm a bit
reluctant with applying your patches as-is because they only solve the
specific case of this defconfig, in a specific way, without creating a
clear rule that all defconfigs meeting a specific situation should
follow.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
