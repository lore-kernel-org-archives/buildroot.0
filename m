Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C023CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5D1560645;
	Wed,  3 Apr 2024 19:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJzI8Rwm9ZJh; Wed,  3 Apr 2024 19:36:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB8A860677
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB8A860677;
	Wed,  3 Apr 2024 19:36:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED9D01BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA6E382269
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zEODLIcGno0J for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:36:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F22A78223C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F22A78223C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F22A78223C
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:36:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 762B140003;
 Wed,  3 Apr 2024 19:36:18 +0000 (UTC)
Date: Wed, 3 Apr 2024 21:36:17 +0200
To: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Message-ID: <20240403213617.4d006e69@windsurf>
In-Reply-To: <20240402153328.1859642-1-bb@ti.com>
References: <20240402153328.1859642-1-bb@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712172978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zWod3F7pVDWfzMNrv4ZQMN7LqSPHqQxMnho4vtLoVtM=;
 b=JXmsKrhMgU3cDqPgCZY9c4nfkyGdfYzvAmfG1jVwiQlphdbznl9Oag7H3l8nTsrXW9S2mN
 pBjuNbuSTD4l9IxnaVWBCPZB/32ku/76QjQdHb6Y/IG1PNPzksyg+N4yyIWBJfVa9lVwgJ
 /3Uge1jGhn8KPKEJwcbOa7i5+89CUTn4jGlLLv+9jdXL+BfdjV/6DsEpjNLllszIhvHarW
 l8coywqxNc4y3wE/O027/YE1rV9sUlzmUg1nK9okMjRoG+3jKe5XsoE/pPMOpllqBvbk4J
 OqkIOe50Q5xbUOnrmVhm9XZiDDXEx2ONEKYZ/9aCTUGukvkGNLtyzGKFX2qycQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JXmsKrhM
Subject: Re: [Buildroot] [PATCH] boot/ti-k3-boot-firmware: bump to latest
 version
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Bryan Brattlof <bb@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bryan,

On Tue, 2 Apr 2024 10:33:28 -0500
Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:

> The 09.02.00.009 release of ti-linux-firmware has the latest updates to
> TI's TIFS, DM and DMSC firmware needed for the K3 generation of
> processors. Update to pull in these latest updates.
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>

Thanks for this update! Maybe this question has been asked before, but
how much version dependency there is between these firmware files, and
the U-Boot/TF-A/Linux code? Do they need to be exactly in sync to work
altogether, or do newer firmware versions provide proper backward
compatibility and therefore continue to work even if the rest of the
software stack (U-Boot, TF-A, Linux) is older?

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
