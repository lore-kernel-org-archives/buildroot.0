Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FF4C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC52E606A2;
	Wed,  7 Aug 2024 14:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qsd8fyImUS6a; Wed,  7 Aug 2024 14:28:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0425606F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0425606F7;
	Wed,  7 Aug 2024 14:28:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB5681BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7CC980B6B
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:28:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TeUoFWBaLnY3 for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:28:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 691A980AEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 691A980AEE
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 691A980AEE
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:28:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5746CE0002;
 Wed,  7 Aug 2024 14:28:42 +0000 (UTC)
Date: Wed, 7 Aug 2024 16:28:41 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20240807162841.52d0481d@windsurf>
In-Reply-To: <CH2PR12MB5004D0D6722981F95A9C6D17F0B82@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240807105813.3844985-1-neal.frager@amd.com>
 <20240807142506.45de55d8@windsurf>
 <CH2PR12MB5004D0D6722981F95A9C6D17F0B82@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723040923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JU2GOUOEzXuwsZzCCH1SsyfaiBmQtdYf2zI2rNv/DO8=;
 b=f7S6drAotoxBMsdW5risj1NlkBSy+JN1veeNzY6ygZjQuYSukBFPoMdLUqMghdSBi66Myr
 JezLVl4MSQpLKPRlQFV776kLcI8RcTln3m6F+RtyQmG0tyRhLerqy3UvW0bXx4TsGAsVbC
 b2/4r60AH8oWMfeagCpn7yrA8R8+xcyuX8FGhXAlvXWEBykVa1/WyKZWpLBOqYaSGbocb7
 kv3qMmFw9xyg5MFeoi32AFwo+koXDIF5z1vlazesyd8PxxKOEJnFOW94yVCDa6F9Nd67lg
 szoaYbha+FxG7GalfF9ZuS7DDKhZizDgk4Jy1kHCa7gQW8zwTBgXodrY8rvNlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f7S6drAo
Subject: Re: [Buildroot] [PATCH v1 1/5] board/xilinx/patches/linux: add
 linux 6.6.40 hash
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 7 Aug 2024 14:26:24 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> From my view, it is best to keep the shared hash files since there are now 12
> xilinx defconfigs using this and soon to be 13.
> 
> Since it only requires a single line change in the defconfig files, I will
> squash this into a single patch that updates all 12 defconfigs to Linux 6.6.40.

But are you able to test that those 12 (soon 13) defconfigs all build
and boot fine when doing such updates to all defconfigs at the same time?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
