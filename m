Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6E7D4415F
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 10:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7177C40582;
	Fri, 12 Dec 2025 10:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KAznkSygfxpk; Fri, 12 Dec 2025 10:16:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07ACE402D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765534564;
	bh=k2dRisMeGZBTGOoYWW4n6jm1grw60L9sNTr9vjZxtRg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=baAECkXFP+C53owEjQ0KF3JGKd05Ggn51U8ArUA6FzwNxbbnXgD7VvUrGqXBZVyyW
	 ejmGo28Ika1SHtKCZZjq/WxlmB0z/U7VhELpU7juvX+6KAqU2PK4xK6kxEM0Os1IEu
	 J5Hmfg/nr/VsDxAsFSak1ZLjS4OLjRyD1Yd0tiERWSfTiiKbbxgYNh90TeTGQEopkI
	 0ojil5r/lVoKL8Y/+5pWEr3lJ10dKRwZ/D/VcHyECN6S3IFm124pyxxhU6QFjk5BLu
	 +JuSiCsWmmK24tzR0OwAfWB6BwAmW8cIUEBhN7QyP9jee4zjyRoH+c8JNZTcYgUwkx
	 N7N57WYsqGArQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07ACE402D6;
	Fri, 12 Dec 2025 10:16:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E489E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 409C94022D
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QhqHV6M1hsaL for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 10:16:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3BBF640160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BBF640160
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BBF640160
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:16:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2E572C1935D;
 Fri, 12 Dec 2025 10:15:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 44DA2606DF;
 Fri, 12 Dec 2025 10:16:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AC1CE103C8DFF; Fri, 12 Dec 2025 11:15:57 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri, 12 Dec 2025 10:15:27 +0000
Message-ID: <20251212101533.820554-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765534559; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=sZAl8TEYnZdsyTx9pnf2A+A+jdbk8JcZQJrprMJSOTE=;
 b=JuY5RW+G93UyId8fvhrybpTtYP5IMhvkitisJ3rgMBraxASd/l3TjtvcigbtRNg2p77rKy
 iclcc103RxsfmQCvYnFs+ePvWNt6Gcxq9A527Vw6LWKVnTt3lM4+rbxV7RiCBRU9qFDoMU
 78T8I5/BRDyCHCK0f19MpE3hAqkTnpwIXO41aohDFD2oDd4W/b00GmmiUHgsFn8oYi7Yk0
 K+JzuGcmNdsW2AMFTaLtY7s415JJMUo46lbIxaeoXqPByhhC7Sky3c4+MO2spnPs2poivx
 yVkppXFqtC+uoCGdiWSJlVduNdV+iHv8h/2oVcbeRmA7MpmfbfeNnYx1/8cB1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=JuY5RW+G
Subject: [Buildroot] [PATCH 0/3] Add support for BeagleBone Green Eco board
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

Kory Maincent (TI.com) (3):
  configs/beaglebone: Bump to Linux mainline
  configs/beaglebone: Use Buildroot's default U-Boot version
  board/beaglebone: Add BeagleBone Green Eco support

 board/beagleboard/beaglebone/genimage.cfg |   1 +
 board/beagleboard/beaglebone/readme.txt   |   1 +
 board/ti/common/am335x/linux.config       | 682 ++++++++++++++++++++++
 configs/beaglebone_defconfig              |  11 +-
 4 files changed, 687 insertions(+), 8 deletions(-)
 create mode 100644 board/ti/common/am335x/linux.config

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
