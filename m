Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC1CC52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 22:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46B82402B0;
	Wed,  7 Aug 2024 22:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQ81Q8_aeJtN; Wed,  7 Aug 2024 22:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02E0240394
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02E0240394;
	Wed,  7 Aug 2024 22:11:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C50A61BF321
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 22:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1712814A9
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 22:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7S4pFGa9ukYz for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 22:11:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A8D48148B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A8D48148B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A8D48148B
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 22:11:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FB5960002;
 Wed,  7 Aug 2024 22:11:49 +0000 (UTC)
Date: Thu, 8 Aug 2024 00:11:48 +0200
To: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Message-ID: <20240808001148.06b90125@windsurf>
In-Reply-To: <20240807143605.1440039-1-jamie.gibbons@microchip.com>
References: <20240807143605.1440039-1-jamie.gibbons@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723068709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2burLdwv8JzOdLsHrN6B9i8MYGcjoVbwiRNUCZ0YjTk=;
 b=h715PHb3ttsPtLRU0ub7/2NOs1XMljLnnx62mZiYU2clZ+KU9ZXpPjHVpxkXCK4XeTyNpF
 86U7UOMmoleVqc5YvHZqXnEnr33x4HWuVRvU5ZcUCKDeDdKUS2QWJagHNaTfglaglG2bZS
 sZ49EYT+eC1QOibetePftJ1nykmDrT+F1P9QlaP2SOdahOk2qVC9RZg88dy0NOG/ck99yq
 dFzSuXfSKGsSOX+mGwkYuHfp/5b8/F+bwnZViSlo3RqwZ69SfVOnPTOwjqmQTPSFbXm6eU
 Jq0AWGIzAZU+sw7QZNy5NWMl3C3unT+AqNLFszv3moiBWoMErxN/Dx4WS3oPPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h715PHb3
Subject: Re: [Buildroot] [PATCH 1/1] fix: board/beagleboard/beaglev_fire:
 update uboot hash
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
Cc: Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>,
 Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jamie,

On Wed, 7 Aug 2024 15:36:05 +0100
Jamie Gibbons via buildroot <buildroot@buildroot.org> wrote:

> The U-Boot hash is incorrect and breaks the BeagleV Fire build. Update
> the U-Boot hash.
> 
> Fixes:8ce97fd550d6("configs/beaglev_fire: bump Linux and U-Boot")
> 
> Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
> Tested-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>

Thanks, but there is something more wrong... which probably explains
the hash issue:

BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,u-boot-2023.07-mchp)/linux4microchip+fpga-2024.06.tar.gz"

So we are retrieving U-Boot 2023.07-mchp, and storing it into a tarball
called linux4microchip+fpga-2024.06.tar.gz, meh. Seems like I didn't
review carefully enough that version bump.

Could you check this, and send a patch that really bumps U-Boot (and
fixes the hash) ?

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
