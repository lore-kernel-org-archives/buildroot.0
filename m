Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B67C2A099
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 10:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40E34807A4;
	Mon,  5 Jan 2026 10:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYAoCHENLGGG; Mon,  5 Jan 2026 10:56:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C411380760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767610573;
	bh=BbU7r/SNthjHpP4QP2t9XcM9VUYfmJKx4meZDtnonTw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=cMiZCHBDgIySZzptcApbFWcncXFe62fR5ZJByllQWo0z8bSpCy5FUZE6S+CLPBlW8
	 274Uxvx7V0nI1Qmkjd1VGDkFzzCYWzgFrpbo/McsD5MoMJw921af747jn3RIyHY9R4
	 Oi/XKXikjuuMStdhC25tI6zNXDeDgkO4qs02tgpTjOmBSDq5v0aD41uHoJn6ef/Csy
	 s4zlqWT6X3IFo5jXd7aQVCWbe8NkIkai4m4T9zAg1SaSbnXx819kMEztPoZgTXPdY3
	 E7f3ouEFVAJSOGL8v3ATtNKInovbaJV6+eVyte4iuSLdJ4Qy08gYyLDJHxxjTo8ltv
	 7sgCuQnv44L+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C411380760;
	Mon,  5 Jan 2026 10:56:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C03912DF
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 10:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A60016062E
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 10:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zs7cjNg-FKp4 for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 10:56:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C815A60625
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C815A60625
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C815A60625
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 10:56:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 61B58C1E482;
 Mon,  5 Jan 2026 10:55:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 51BC260726;
 Mon,  5 Jan 2026 10:56:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8BAE1103C84E6; Mon,  5 Jan 2026 11:56:02 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon,  5 Jan 2026 10:55:50 +0000
Message-ID: <20260105105558.1991-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767610566; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=fKwYEtP/bQR2ShPnAX1i2cSWa4qoRqP+5yelrZL1wNE=;
 b=r4yX0CdsTU0ASTrYcMMsuyFYdFBQ6jEP2iYtLfyn/t3/bAxpZ+Vsey+G9ufvhisVOjh77a
 xg/i3VMJUjxqH6qHEXoLeBuIfePKDc2AEWplpjAe+pLnt8eLjKYOKumF0rxQOXWvz37L5L
 wJhvmpCyHm+sYe7SKxLB0qFAAhXFQZ1Fm+AJ3jYsoU9uzSh+cEVmHwfZPkOEOemR3pe0mj
 Ewx+2X3EFbyJ8xT+ylRQwdWwxjyZCu7x5RXcPTmt3OMhpWoVf+OVwtmK/oKfqL9/wawBFA
 ZVwvy3nWXMUytP+Jr/hRMXh9m/pUfPgA56j+gGs5NCdPNnFryCH/ia9GJaKQUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=r4yX0Cds
Subject: [Buildroot] [PATCH v4 0/4] Add support for BeagleBone Green Eco
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
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Lothar Felten <lothar.felten@gmail.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Julien Olivain <ju.o@free.fr>, thomas.petazzoni@bootlin.com,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumps the Linux kernel to the latest mainline version.
Add the am335x-bonegreen-eco device tree to enable support for the
BeagleBone Green Eco variant.
Bump the am33x-cm3 package to latest version.

Changes in v4:
- Use omap2plus Linux defconfig instead of a custom one.
- Remove the switch to Bootlin glibc stable toolchain patch because it
  has been merged.

Changes in v3:
- Add new patch to switch beagleblone config to Bootlin glibc stable
  toolchain.
- Add new patch to bump am33x-cm3 version.
- Add new patch to enable AM33X_CM3 to the beaglebone defconfig.
- Update the tarball hash in the bump of Linux version.

Changes in v2:
- Use a specific Linux version.
- Remove 2nd patch.

Kory Maincent (TI.com) (4):
  configs/beaglebone: Bump to Linux mainline 6.18.1
  board/beaglebone: Add BeagleBone Green Eco support
  package/am33x-cm3: Switch to TI repo and bump to v0x192
  configs/beaglebone: Enable AM33X_CM3 config

 board/beagleboard/beaglebone/genimage.cfg     |  1 +
 .../beaglebone/patches/linux/linux.hash       |  4 +-
 board/beagleboard/beaglebone/readme.txt       |  1 +
 configs/beaglebone_defconfig                  |  9 +++--
 .../0001-Enforce-correct-march-option.patch   | 38 +++++++++++++++++++
 package/am33x-cm3/0001-fix-makefile.patch     | 30 ---------------
 ...Makefile-unconditionally-disable-SSP.patch | 17 +++++----
 ...Makefile-unconditionally-disable-PIE.patch | 17 +++++----
 .../0004-Makefile-add-fno-builtin.patch       | 17 +++++----
 package/am33x-cm3/S93-am335x-pm-firmware-load |  6 ---
 package/am33x-cm3/am33x-cm3.hash              |  2 +-
 package/am33x-cm3/am33x-cm3.mk                | 18 ++++-----
 12 files changed, 85 insertions(+), 75 deletions(-)
 create mode 100644 package/am33x-cm3/0001-Enforce-correct-march-option.patch
 delete mode 100644 package/am33x-cm3/0001-fix-makefile.patch
 delete mode 100644 package/am33x-cm3/S93-am335x-pm-firmware-load

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
