Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B61C5DF94
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 07:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BE8B60614;
	Tue, 25 Aug 2026 07:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFjw9WofKC0N; Tue, 25 Aug 2026 07:44:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787643868;
	bh=NpXrHiT2oCUC7xIQ+7XJVV9MmI3NK9P8kMkrPsREyn8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Djw3cITzqyz6zufLjHkmqA9suBuUrDPbfbR7zNnhE7jfTm8SJHdAPyfeqTrcDqlUD
	 C8dBmBR/dPYvET3XGJQO90pNyEZp11PFk6aNG4SPL5NZDsOXzixr6zUYiT48RX7MbN
	 o/GRpyqH4wTmLnh+UyisMY/IRZruUa93YQ2rPlMoXbcmuKctQFFYnOxZDPXhSjrWn6
	 f5jUtciuGJIbkJyZdOh7TEiOiOdtGERjV5hOH5y1Hp8zsQUnmMczignG9fJRDR4PJ4
	 iv9Y8pwWA9/fqDApuJ06p9pF0oTzP9sTdwMjS3GNSg8mbGY5H0BjwpWaDdfkveGQmz
	 IpRNgFIovWJpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6422060619;
	Tue, 25 Aug 2026 07:44:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 57251279
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 07:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5489C405E7
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 07:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id orGFfDmDNMEo for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 07:44:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:67c:2050:102:465::106; helo=mout-b-106.mailbox.org;
 envelope-from=sebastian.michel@oss.othermo.de; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=hJI6ASfC
Received: from mout-b-106.mailbox.org (mout-b-106.mailbox.org
 [IPv6:2001:67c:2050:102:465::106])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42874405E6
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 07:44:25 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-106.mailbox.org (Postfix) with ESMTPS id 4hTftY2444zNlZX;
 Tue, 25 Aug 2026 09:44:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oss.othermo.de;
 s=MBO0001; t=1787643861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xpyvSnEO7nudl76Oy9KghiXF3lR//7Q09raYL4WxtvM=;
 b=hJI6ASfCzVYbo8v2pzv/69jGjtiWIPrdi+kZ1hVZZPuvxjJ5smyNcTKSOSEO0JeCiN4BtT
 jBEOYIX4RsaUHGkLLAHyKdiyVLM43APT9uSr05PaAD8bURKhmVdcJ3gw97zVk1lmXiEjGJ
 tIhRAGgrMQsJ69GCPStlwgqzqEzZjNK7h5nl7Dc+pGl4re6Kko/Q5Fi6lB4pncAlGkZG37
 NwnUsi3jKteN0adAP2MwWAZSNlmfE8DzsADKmmB50S4S+00uFxi3QaHVEpIlR2RoIVMbQx
 VGGnjFoHvS9dTkkukHl3LUjv9iUG+q39kHeBHkO0/eNje90ZVqzoAmuVjIqFgQ==
From: Sebastian Michel <sebastian.michel@oss.othermo.de>
To: buildroot@buildroot.org
Cc: Sebastian Michel <sebastian.michel@oss.othermo.de>,
 Simon Dawson <spdawson@gmail.com>
Date: Tue, 25 Aug 2026 09:43:44 +0200
Message-ID: <20260825074344.74193-1-sebastian.michel@oss.othermo.de>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/sound-theme-borealis: add missing
 license information
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Sebastian Michel <sebastian.michel@oss.othermo.de>
---
 package/sound-theme-borealis/sound-theme-borealis.hash | 1 +
 package/sound-theme-borealis/sound-theme-borealis.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/sound-theme-borealis/sound-theme-borealis.hash b/package/sound-theme-borealis/sound-theme-borealis.hash
index 575cf31c8c..336c039892 100644
--- a/package/sound-theme-borealis/sound-theme-borealis.hash
+++ b/package/sound-theme-borealis/sound-theme-borealis.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  dd80a9c6317de29d42786ba7d95b114b64d06ec6c0c17dd18df853a5c668e727  Borealis_sound_theme_ogg-0.9a.tar.bz2
+sha256  b21ac6d124efc0a25c1f9eae9cab321fc1a41979468eb9293c1a9218a5493e9f  README
diff --git a/package/sound-theme-borealis/sound-theme-borealis.mk b/package/sound-theme-borealis/sound-theme-borealis.mk
index 9242837bec..f37b54f5f8 100644
--- a/package/sound-theme-borealis/sound-theme-borealis.mk
+++ b/package/sound-theme-borealis/sound-theme-borealis.mk
@@ -8,6 +8,8 @@ SOUND_THEME_BOREALIS_VERSION = 0.9a
 SOUND_THEME_BOREALIS_SITE = http://ico.bukvic.net/Linux/Borealis_soundtheme
 SOUND_THEME_BOREALIS_SOURCE = \
 	Borealis_sound_theme_ogg-$(SOUND_THEME_BOREALIS_VERSION).tar.bz2
+SOUND_THEME_BOREALIS_LICENSE = Artistic License (non-GPL/LGPL commercial use prohibited)
+SOUND_THEME_BOREALIS_LICENSE_FILES = README
 
 define SOUND_THEME_BOREALIS_INSTALL_TARGET_CMDS
 	for f in $(@D)/*.ogg ; do \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
