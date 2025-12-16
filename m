Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2EDD609A7
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 15:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63391811B6;
	Tue, 16 Dec 2025 15:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbVkRr6iKym5; Tue, 16 Dec 2025 15:15:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83306811D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765898101;
	bh=1ISIfu2dUJBxFDooqdrfF9HY0Iyi4mBKQQAWA3LuF1Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=A0W4Jv5rp9uS3XS+YtI+XGy1rg4HjpfO6nIlIF7zXngRYmiY4lzmsFsrpxRKB+Qcm
	 ID2y64uCbOdGwezPtU5NrMePFmquhjxNstq7R+vVamv3Y4iJ/WjTcpjsWxq1FGFGOA
	 l/T8Ta7ThY3QU0fjEAihM9Rgs5pqr+zaHbytJ6izSevt6vnfXzHJdj/lWJ+H2txXHe
	 BiKb6rO5taWBUm95p1OVLdgv7EcrPLJPtuS2bX+E9B0z/Ermm8smLcOQ6OsKjdZgxX
	 6RwVopT2GTaIoiEhYalREglav4eBexSZqOtliyqACYK8XTdxS0S0Mbpwh+kpl28eIH
	 zXkPOKzL9PEtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83306811D7;
	Tue, 16 Dec 2025 15:15:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CAA3372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62B8A811B6
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emBPoBEwRO7P for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 15:14:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A941811B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A941811B3
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A941811B3
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:14:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id CC21EC19D35;
 Tue, 16 Dec 2025 15:14:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 49BC56071C;
 Tue, 16 Dec 2025 15:14:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8A245119A8E0B; Tue, 16 Dec 2025 16:14:53 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 15:14:40 +0000
Message-ID: <20251216151449.395253-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765898095; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=1K9+sWFJOIFfacTnuhvfabDgroXzPLzfZ+KqUjKmLKI=;
 b=NX9BR1ufB5jRpALf6BSoOdaV/L5MwvPNrHa9M2h3BqfJZZntseXEzRdSPhZzAJI0mWPrxC
 7SwVLqFnrBSKikn8uhP1u9Z4zq157wKFNX2d8Or3iILg620sK+ND9GNbDEoMCOhSLC5ptS
 +Mt77lYe0K0tAchQ6z4K1+3FFTROcioHDiHIpPHtT3TKM241bABli8HJq8zCM4W+5EDTty
 25qLKDnrc7iRaBKM6XnMhJymAPc8UjpiShhuQjPewZugJnnqfVVlSE4HmcaukMQNXPof3u
 zsBnA2lEJEjib1Acc/lFpATxZqoCck3GXTPwP5MuCgdvhZE2lVKNOYh+tadWAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NX9BR1uf
Subject: [Buildroot] [PATCH 0/5] Add support for BeagleBone Green Eco board
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

Changes in v3:
- Add new patch to switch beagleblone config to Bootlin glibc stable
  toolchain.
- Add new patch to bump am33x-cm3 version.
- Add new patch to enable AM33X_CM3 to the beaglebone defconfig.
- Update the tarball hash in the bump of Linux version.

Changes in v2:
- Use a specific Linux version.
- Remove 2nd patch.

Kory Maincent (TI.com) (5):
  configs/beaglebone: Switch to Bootlin glibc stable toolchain
  configs/beaglebone: Bump to Linux mainline 6.18.1
  board/beaglebone: Add BeagleBone Green Eco support
  package/am33x-cm3: Switch to TI repo and bump to v0x192
  configs/beaglebone: Enable AM33X_CM3 config

 board/beagleboard/beaglebone/genimage.cfg     |   1 +
 board/beagleboard/beaglebone/linux.config     | 682 ++++++++++++++++++
 .../beaglebone/patches/linux/linux.hash       |   4 +-
 board/beagleboard/beaglebone/readme.txt       |   1 +
 configs/beaglebone_defconfig                  |  14 +-
 .../0001-Enforce-correct-march-option.patch   |  38 +
 package/am33x-cm3/0001-fix-makefile.patch     |  30 -
 ...Makefile-unconditionally-disable-SSP.patch |  17 +-
 ...Makefile-unconditionally-disable-PIE.patch |  17 +-
 .../0004-Makefile-add-fno-builtin.patch       |  17 +-
 package/am33x-cm3/S93-am335x-pm-firmware-load |   6 -
 package/am33x-cm3/am33x-cm3.hash              |   2 +-
 package/am33x-cm3/am33x-cm3.mk                |  18 +-
 13 files changed, 771 insertions(+), 76 deletions(-)
 create mode 100644 board/beagleboard/beaglebone/linux.config
 create mode 100644 package/am33x-cm3/0001-Enforce-correct-march-option.patch
 delete mode 100644 package/am33x-cm3/0001-fix-makefile.patch
 delete mode 100644 package/am33x-cm3/S93-am335x-pm-firmware-load

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
