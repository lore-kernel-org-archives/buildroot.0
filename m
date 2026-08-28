Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BDFC61DBD
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41DB380F5C;
	Fri, 28 Aug 2026 19:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0bhIevApdAi2; Fri, 28 Aug 2026 19:38:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787945896;
	bh=xKtiffW/FimWFcNrqoFhhoysYJX6qBOl15UqstDvBX8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=qVs/OvUGTvTaZ5UEOiaYVZhrvh6Zol3xLP2CyG+TDdZlEYLNTcJoAsHyDY5QeqEIq
	 94R34rVLSafhPtUVWm0UA+xrkWY9/99kjmvqh993t7zugSfKk0UpvO795L0oPwK939
	 J4EvUvouCiT3ppNDGwxj97rFUmY1pRIvmOc4zZx6dn9o2/ZkElBWUS5PbEqvODyryV
	 +xYuobddqIa3ox4I/dQTdpXO7QSVqvZBMUlTo/bl262KHuteZHN0VM4hsMNR6c4UAM
	 Ggjb9navsE6MwwPHL+N6rf0vw3LwaRfXBIuzjUPqK6CWABWPNGxp87YocHuvp8eC06
	 kVGnZ5MUYgeYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 581DB80EE6;
	Fri, 28 Aug 2026 19:38:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0717B23E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 19:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECF15606B6
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 19:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cemOb6T77xU for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 19:38:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C2E960679
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 19:38:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 65F404E41407
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 19:38:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 349B060537;
 Fri, 28 Aug 2026 19:38:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0C21811C78028; 
 Fri, 28 Aug 2026 21:38:04 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Cc: Andreas Ziegler <br025@umbiko.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2026 21:37:59 +0200
Message-ID: <20260828193802.2404390-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v2 0/2] libnfs fix and bump
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This is a small v2 that builds on top of what Andreas Ziegler
proposed. Compared to v1, we:

1. split the fix into a separate commit that can be backported to
   2026.05.x

2. bump to 7.0.1 instead of 7.0.0

Best regards,

Thomas Petazzoni

Andreas Ziegler (1):
  package/libnfs: bump version to 7.0.1

Thomas Petazzoni (1):
  package/libnfs: fix gnutls support

 ...t-and-use-const-qualifier-from-point.patch |  37 ------
 ...t-qualifier-from-pointer-target-type.patch | 117 ------------------
 ...void-cast-to-allow-compile-for-arm32.patch |  68 ----------
 ...t-gnutls-into-main-library-as-it-is-.patch |  26 ++++
 ...t-gnutls-into-main-library-as-it-is-.patch |  29 +++++
 ...defined-reference-if-libnfs-was-buil.patch |  41 ++++++
 package/libnfs/libnfs.hash                    |   2 +-
 package/libnfs/libnfs.mk                      |   2 +-
 8 files changed, 98 insertions(+), 224 deletions(-)
 delete mode 100644 package/libnfs/0001-Do-not-edit-const-and-use-const-qualifier-from-point.patch
 delete mode 100644 package/libnfs/0002-use-const-qualifier-from-pointer-target-type.patch
 delete mode 100644 package/libnfs/0003-socket-use-void-cast-to-allow-compile-for-arm32.patch
 create mode 100644 package/libnfs/0004-move-link-against-gnutls-into-main-library-as-it-is-.patch
 create mode 100644 package/libnfs/0005-move-link-against-gnutls-into-main-library-as-it-is-.patch
 create mode 100644 package/libnfs/0006-autotools-fix-undefined-reference-if-libnfs-was-buil.patch

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
