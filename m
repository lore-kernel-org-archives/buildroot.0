Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BA4F531C3
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 19:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2EE340F00;
	Mon, 13 Apr 2026 19:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hqsid9OxKRtw; Mon, 13 Apr 2026 19:27:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0B8E40F03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776108453;
	bh=PsJ/I8U6+ZnY7d7yKigX/TB91WeieMi5Wh9bgXAOhqM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rzSaIMA8NwkKjZb+rv1NOuyDjxQ0PMJn5CZwZ52PDhZdAfvTtn/PXfoP4QxvXI//x
	 kLTfa1zLsMjt7xIiLHjaBBLPwr6N66WuEMeLsXbx+V60lkdPx2A8nmABfWU1/w6WHM
	 NUjeJQkRPkV9HSbtmXQ6k75epWvS4rrIWxqsU/EktmM8ft+KDedDW2eN4Z85JIHjTl
	 lJHlIgy3xesQwUAJxssjwY3C5+ZeYQzafEbJkcp/x5LgnBUp8XZS+WJRJkIJMr7aF/
	 xZb2NdTmrs6+4TL9a315yzi8GxGz1M4Go3OVt5G8Qy+4Rup6w4/IHm+t1NXYf4+mJC
	 FuYY6B8SQ1jJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0B8E40F03;
	Mon, 13 Apr 2026 19:27:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F2381283
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF8B6608A4
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rNiA4QTFbnGv for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 19:27:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 98CAC607CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98CAC607CB
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98CAC607CB
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:27:30 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so32246845e9.2
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 12:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776108448; x=1776713248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+uWEBfPOuKfKQigl6C1mfYsWD6NGoGcEJC2Qd/nJshA=;
 b=UBZ0y8OZy5JknwbMxbUsLmtIsn8rU1y/em0HvvmoBooCNu6yo4GiWcyKWL/3vAXssF
 SEEGUpIeC3V+GXjFH6NfaGGHEvDeb98Or75hJ9NyELUNNKL8yS/dq5gIPNl//6vuim0O
 Yp9irh62SILbefUDj3jbFVPOmeugfkKI9s2H9SRYKUvOGG9KTfEyr155Sd1wXsFDZsbK
 HhY+BSHTlcY3beYFulNKoDaoZGnCKZfdTd1coy4RzujSm0dhRekuxsrfA54OfG+p0L7G
 saTMPkXZ77xnQE7gIcRvBfDbyzx7DxThmfZ+Gifc0rIOuivq9gNjngHpD7wFQi/Ut813
 exzQ==
X-Gm-Message-State: AOJu0YzTyP/ma3bBE3GSo0gCg9y33Q/F1K+kP5U+4ztf1C4e60XcTMDD
 e4+EICpN+A8DPaHWybCb5A3+tCFE1XAXs8FssKLP/ZU4yDVObLNfoE3U/HLWjurqFMrh+dvmBR3
 xpHUc
X-Gm-Gg: AeBDiesYxHLKfYAlmrp0EyxXlKQ1pjFHDLKzPwSNhrX7epdz1UQYS33jlGFKTC84aE0
 jWxzSUR1Ux+K9jkPAgRF0O4weYWME3K1792FYFRsYZTqYwLFREVC1HHikro3s1SWUdaFBWJ3T2b
 pGTk3sB/ew3WN8g93TEQ7TMn+wAYqGuOffB+rQnJA+UDAZOIZC7/xOJzktDWcxr6T8AiHzSj0/9
 Tz86wjOYkeu8w0j327aFpMcNZn8vi/zj/lYvHcoZh0SpeWZztJ+TxOEJCy6+ntok2lAO2cXPRkI
 EIC92K1QZSEm9gCC6KPTydwob8SmT1mjf8JgrU4EUVCns0HK54+xywDWa0dTfS7iFFUcpv8RuFU
 yIBj2OOrf20QRjEEEZ0xNqog8qbZIRTpRkzAinV0lvSv/lKBMdxngAjEbNtgrN4KFrtZVLQD130
 EjcE1KqZ08h4Lvg9tiuqvpc5zbZXg/HOO4dVfdXe5zxge2yRWQU4KQDAN1CimrzjyrXBsVcTQV5
 W+XPoEgiuIKKsIu9oHIiNMzAmI/KJuFKH36nRqsJZTxpxJ2
X-Received: by 2002:a05:600d:8449:b0:486:fdba:f5db with SMTP id
 5b1f17b1804b1-488d664f29emr164414065e9.0.1776108447925; 
 Mon, 13 Apr 2026 12:27:27 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.131])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d6864121sm102351095e9.28.2026.04.13.12.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2026 12:27:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <brandon.maier@collins.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 13 Apr 2026 21:27:21 +0200
Message-ID: <20260413192721.1908696-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1776108448; x=1776713248;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+uWEBfPOuKfKQigl6C1mfYsWD6NGoGcEJC2Qd/nJshA=;
 b=n8s6vHhuYkLqdy75iuReF84oSWmHIa/HXkbhDUTueLp1vrXBvioByZSQF+pRTIWILT
 Z0+gjNX5I43JTjXcZQNub2xGyCiqyIZimWBgcbM7A/NIIjIQUlkA0LydcESj9pPex3rt
 wpq0NVmUougrR/g453L/yeBlEAo1njyiQklu8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=n8s6vHhu
Subject: [Buildroot] [PATCH 1/1] package/mtd: bump to version to 2.3.1
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

Version 2.3.0 added the fsck.ubifs utility, so support it with
the new Kconfig option BR2_PACKAGE_MTD_FSCKUBIFS.

Changelog: https://git.infradead.org/?p=mtd-utils.git;a=blob;f=CHANGELOG.md

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/mtd/Config.in | 4 ++++
 package/mtd/mtd.hash  | 4 ++--
 package/mtd/mtd.mk    | 3 ++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 0c95e3cc54ae..1054106f81e5 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -58,6 +58,10 @@ config BR2_PACKAGE_MTD_FLASH_UNLOCK
 	bool "flash_unlock"
 	default y
 
+config BR2_PACKAGE_MTD_FSCKUBIFS
+	bool "fsck.ubifs"
+	select BR2_PACKAGE_MTD_UBIFS_UTILS
+
 config BR2_PACKAGE_MTD_FTL_CHECK
 	bool "ftl_check"
 
diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index 0eb90a5118be..5f02e698d1b9 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://infraroot.at/pub/mtd/mtd-utils-2.2.1.tar.bz2.asc
-sha256  f7ae20b2eb79ee83441468f0b99d897024cd96ff853eea59106fb1952065c803  mtd-utils-2.2.1.tar.bz2
+# https://infraroot.at/pub/mtd/mtd-utils-2.3.1.tar.bz2.asc
+sha256  03d9dc58ad10ea3549d9528f6b17a44d8944e18e96c0f31474f9f977078b83dc  mtd-utils-2.3.1.tar.bz2
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 77050e7e40b6..6ffa3fd626f8 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 2.2.1
+MTD_VERSION = 2.3.1
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = https://infraroot.at/pub/mtd
 MTD_LICENSE = GPL-2.0
@@ -145,6 +145,7 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDBITERRS)	+= nandbiterrs
 MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDPAGETEST)	+= nandpagetest
 MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDSUBPAGETEST)	+= nandsubpagetest
 MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDFLIPBITS)	+= nandflipbits
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FSCKUBIFS)	+= fsck.ubifs
 
 define MTD_INSTALL_TARGET_CMDS
 	$(foreach f,$(MTD_TARGETS_y), \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
