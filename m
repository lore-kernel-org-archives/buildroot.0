Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A29CD8C8E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 07:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E1F460774;
	Mon,  8 Jun 2026 07:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3NG77sRq5UmE; Mon,  8 Jun 2026 07:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DF816089A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780905558;
	bh=gHYeirk/hBu91Gp0rD1iyPiK+jJTFGUQQ7mx5VlYvvk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tHnmU658vxhzZ4sHJqyF/OCFd4dZ1g4/zOgMwRXwatjySJ7g8DjuTnw/Yl+TCz6Hg
	 wl63odKNR9fBl1Wfhdetu3ZqplcXYo0uM9fh106zwiEKftSARy3F5eXMnmIBo5Jhx8
	 B7OOH/uiyAJyb1SqFT7kv3ebqPQOCKGv3iuQTNsCkQ2eW2Li/f5wdRPCzw0cNOjicz
	 ha9DIYjlRbrpcBqOQ+2uXaT5eBYxu/w8R7jLh58miOWoeRs4BA4kY4Za36+pRDzDrA
	 RHRGaoizYUa21ccxtXFokCyI4Qy3QCvVoJjH5lCV+TMiCWrQ1k/PMHmwFBtn3MzUQL
	 swuECq0hLsqCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DF816089A;
	Mon,  8 Jun 2026 07:59:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F1DFC2C1
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 07:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E439A407BF
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 07:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AipqhCbRouGo for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 07:59:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 97ACF407B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97ACF407B6
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97ACF407B6
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 07:59:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CFEB61814BE; Mon,  8 Jun 2026 09:59:12 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon,  8 Jun 2026 09:54:17 +0200
Message-ID: <20260608075419.281597-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1780905552; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=UBFQKpjBpg3ujl12EqDqCmG+vDoEs/OIRxN/1WRg2ww=;
 b=n/Hhc3hXsfghvb6U8c92FrTcwZulfBMhw18Ld4vBTzF16WK9CHKhcdeleA5SXceP1O7QAg
 PoSsOQFvlqjwcyjDxiZjvyOgtBqegpNVmPFTTh4QpmhHXArFrOHF42cHelRbx00JGRHU8K
 i2byI9mYU54Rk2qm5665jYKAwVtMSAg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=n/Hhc3hX
Subject: [Buildroot] [PATCH] package/catch2: bump to version 3.15.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

changelog:
https://github.com/catchorg/Catch2/releases/tag/v3.15.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/catch2/catch2.hash | 2 +-
 package/catch2/catch2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
index b8fc434ffa..31f83a140e 100644
--- a/package/catch2/catch2.hash
+++ b/package/catch2/catch2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ba2a939efead3c833c499cf487e185762f419a71d30158cd1b43c6079c586490  catch2-3.14.0.tar.gz
+sha256  9650c55e497759cc39b977e45524bc8acb15256061c112080916ab6cb0b1ea66  catch2-3.15.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
index 58c64af55e..4c08cb4192 100644
--- a/package/catch2/catch2.mk
+++ b/package/catch2/catch2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CATCH2_VERSION = 3.14.0
+CATCH2_VERSION = 3.15.0
 CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
 CATCH2_INSTALL_STAGING = YES
 CATCH2_INSTALL_TARGET = NO
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
