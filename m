Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D540D609C2
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 17:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6525040C8C;
	Tue, 16 Dec 2025 17:44:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zS-9BFGu0rwM; Tue, 16 Dec 2025 17:44:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C2E54074B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765907042;
	bh=DJpFDJ0ZLpFvEJdfY28TVJQGi8lO0yeIVzP1H495LL0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=L6L8xu7pPWfHwEScYpM6pmfqJwdIXs549lkRIv+oj/ePtaz1hAmAyuXfbZMZd5sik
	 s29xnuUZ4RerwTFhXRkDGQNSN/aLRR2cD44+AIoQVOYDhSNBKyV2XQ5RUgmevYQua6
	 RihVaF2nV51VDyCdP/VvJ2lNDh1NHgnr6RW4ioCTqvnciyTLLQalkIrJpIS941XFvu
	 JtDmKEEHqEpLnd8kKDjySoIEskJH+2p9E2YBFBQleLVYL5bhLx00eyS1P5MfL+hTUW
	 Jx/v2s0er4jxNpNpHLd39hvqXNw3n9oj81GWq87a+lh9P4BltiMbfkKoqw8sB8KxY8
	 tw397CfwPJynA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C2E54074B;
	Tue, 16 Dec 2025 17:44:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F76D364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 17:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70E776101F
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 17:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5IedGWL8S0t for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 17:43:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 65F4B60A89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65F4B60A89
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65F4B60A89
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 17:43:58 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.7.12])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A794060129;
 Tue, 16 Dec 2025 18:43:54 +0100 (CET)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Tue, 16 Dec 2025 18:43:50 +0100
Message-ID: <20251216174352.11588-1-vjardin@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765907035;
 bh=IGmKsdVSdYyG3F7Y5d8qlV8OrzzUBn1Rg1Ze/GmiMbw=;
 h=From:To:Cc:Subject:Date:From;
 b=uXyFCZ9WZYtfqhcZ3KRviTnkPy+wukUsXuOpTp3DTMWVGN9cKqYCk+1pXAiiRmzRe
 0GUww5BXFD+oJNmSTLmGNwzDmFQ154iKBNcMvIjUdB9Zjk1XVlJCOnfXrUsPpRii8/
 Pu+rXB/INOTKi5aS5h9WijtK9MpA9M3ZWGx/YQ+67NYbpbJY97qHLQd5X0xB5mYbPw
 tCVRKW+mzbyKlXKUtRi6dcnzl0cDmz3RTwsrEvwKJeVG48hfKTqOV6M9K6TgvDjfgs
 7B/Nxyy7fp/f6MZPlKnZJVWkpAZXiFq1bXI4TaRRfYmUMy7OLGJPEzLGtCpghdkkHO
 WCWsRomZy0BxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=uXyFCZ9W
Subject: [Buildroot] [PATCH v1 0/2] Add support for Marvell Armada 8040 DB
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series adds support for the Marvell Armada 8040 Development Board
(DB-88F8040).

The Armada 8040 SoC features a quad-core ARM Cortex-A72 running at
2.0 GHz. This is Marvell's reference design board for the SoC.

The board boots from SPI NOR flash using ARM Trusted Firmware (TF-A)
and U-Boot. The kernel with embedded initramfs can be loaded via TFTP
or from the eMMC.

It was checked at:
  https://gitlab.com/vjardin/buildroot/-/pipelines/2218390595

Vincent Jardin (3):
  board/marvell: add Armada 8040 DB board files
  configs: add marvell_armada8040_db_defconfig

 .../armada-8040-db/linux-extras.config        |   2 +
 board/marvell/armada-8040-db/readme.txt       | 110 ++++++++++++++++++
 configs/marvell_armada8040_db_defconfig       |  33 ++++++
 3 files changed, 145 insertions(+)
 create mode 100644 board/marvell/armada-8040-db/linux-extras.config
 create mode 100644 board/marvell/armada-8040-db/readme.txt
 create mode 100644 configs/marvell_armada8040_db_defconfig

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
