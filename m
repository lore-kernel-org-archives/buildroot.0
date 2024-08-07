Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA974C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 22:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3487406AA;
	Wed,  7 Aug 2024 22:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTC6MltL4f54; Wed,  7 Aug 2024 22:15:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60E3D40711
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60E3D40711;
	Wed,  7 Aug 2024 22:15:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E43881BF321
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 22:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D21A4608CB
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 22:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmrbfPUQ2bsi for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 22:15:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C167D608BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C167D608BF
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C167D608BF
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 22:15:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40C92C0003;
 Wed,  7 Aug 2024 22:15:41 +0000 (UTC)
Date: Thu, 8 Aug 2024 00:15:40 +0200
To: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Message-ID: <20240808001540.4c9db52b@windsurf>
In-Reply-To: <20240807-tfa-src-update-v2-4-f2cd6166db5f@ti.com>
References: <20240807-tfa-src-update-v2-0-f2cd6166db5f@ti.com>
 <20240807-tfa-src-update-v2-4-f2cd6166db5f@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723068942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h+UVUx3fQpICcQneleRZTeLTI1EXsAjcBSf/kAPL+fM=;
 b=kHYl0VL3zkIBPCTUoIW4rRK96vYRioXHrGWTXzgxx3Twena8k+V1p/8Ng+uZkFBZtdHFd4
 MdeiPMnFBOOmYWaJUFyd8yLgrYXMpKu0fdl7UsFKBrr1C1uGx4rKL2s0VKxXXnvirixhJT
 6Xzt/xzFYviUqqXkO/5U1hfIsG8loshIVs4t7SFfbepXjEshdiDLOcTdoApjXZ6ycMBL84
 UAoAwDIU/UZ63k9sjvJBP5ymyzPaOJHNN/WO7luNK0p72HTuHiziZ/29kG88A7VIoeosye
 1wuNrb8o4uCuLS+RsgjSybNfiI5jN0k4Jv0QjZdAkG1153cBHsmi4NjWIAPRmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kHYl0VL3
Subject: Re: [Buildroot] [PATCH v2 4/4] boot/arm-trusted-firmware: add
 lts-v2.10.x selection
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
Cc: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>,
 Marleen Vos <marleen.vos@mind.be>, Bryan Brattlof <bb@ti.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 Romain Naour <romain.naour@gmail.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bryan,

On Wed, 7 Aug 2024 12:48:22 -0500
Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:

> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION
> +	bool "latest lts-v2.10.x"
> +	help
> +	  Select the latest LTS v2.10.x version available
> +

One critical part of Config.in was missing:

+       default "lts-v2.10.5"   if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION

without this, no version is defined when selecting the 2.10 LTS.

I fixed that up when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
