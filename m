Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6CDD59D71
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 16:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BC7283638;
	Fri, 12 Dec 2025 16:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6yOVFvNqbnO6; Fri, 12 Dec 2025 16:21:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD443832DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765556478;
	bh=o7Jaa414zynB4HE0YC+h2hdeIqzSHvzp2FVvLrzqsJI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=ZEUy5+8jVBxOxYNdoAol1YbAbyccYufn1IchbvWy6mQz9J/7Uoh+5TVfTMPre2Aql
	 dvSD7oNThrjy9eNzOZNCX/D08RG6r3E6KHHTvuGMOh8zzvy+qp3LaT1FxCxaBipj9M
	 NE42YESxeea8YeZKhE2s4/XY31XLMp7QlF4CDz6Jb8EZW1216K6QVhevnoKsJAkkXD
	 9n7LSfHsN1fcuF2mq+YuvEu+i29Jvk+Ypc5PuGvenczTF7VJv3uZ54NeHZAQZqyV6i
	 IGVyRup/0EiE5Rym49xhHtfj8DbSYfsolX3yXb8Lbj3A68eI4AeJ20vBSCkrO/lNNl
	 hMRn3BhOn04sA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD443832DC;
	Fri, 12 Dec 2025 16:21:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B40AA2C6
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 16:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A16B60B11
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 16:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wE4b5I6f66_F for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 16:21:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 94D4060AFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94D4060AFB
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94D4060AFB
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 16:21:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 6BEEDC19356;
 Fri, 12 Dec 2025 16:20:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 835FF606DF;
 Fri, 12 Dec 2025 16:21:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EA30F103C8D8E; Fri, 12 Dec 2025 17:21:09 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri, 12 Dec 2025 16:20:49 +0000
Message-ID: <20251212162053.883682-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765556472; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=rm3UBkxjm74S3CgCr7hF74S5MGK41j344TougO03Pi4=;
 b=itax2eAsM2Q6Q2UDc6fRoTAAyJp6KeKRGgGUmBsw6t93IobP+Ap/x4mcEtwqQaxuAYoTHP
 gzIYJbEl8ynvqqWIK34KeTNSrZqpUDL+Mam6VQ51p0Xi3nOedm+1YmwF8TVG3lppV/q4wd
 0oySDb4ndk6tGT+42T4y/4dQvY19/SYqlr29vIVXWaSaqDKLrEvnejsoDWP7AFFak2cFb3
 MHbO5PEJHHwjV06Wbj2W1uskcKmF4c4vUxkx5JASTW9eIqYYw91RTUVCMfxvtriXLnxnpF
 twFXRucBjPmB7AsJ4tDI8c/KfY7slB58/7frtN87Fd2hiE7+UEXnE4h1BLpiWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=itax2eAs
Subject: [Buildroot] [PATCH v2 0/2] Add support for BeagleBone Green Eco
 board
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Bryan Brattlof <bb@ti.com>,
 Bajjuri Praneeth <praneeth@ti.com>, Lothar Felten <lothar.felten@gmail.com>,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Bumps the Linux kernel to the latest mainline version.
Add the am335x-bonegreen-eco device tree to enable support for the
BeagleBone Green Eco variant.

Changes in v2:
- Use a specific Linux version.
- Remove 2nd patch.

Kory Maincent (TI.com) (2):
  configs/beaglebone: Bump to Linux mainline
  board/beaglebone: Add BeagleBone Green Eco support

 board/beagleboard/beaglebone/genimage.cfg |   1 +
 board/beagleboard/beaglebone/readme.txt   |   1 +
 board/ti/common/am335x/linux.config       | 682 ++++++++++++++++++++++
 configs/beaglebone_defconfig              |  11 +-
 4 files changed, 690 insertions(+), 5 deletions(-)
 create mode 100644 board/ti/common/am335x/linux.config

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
