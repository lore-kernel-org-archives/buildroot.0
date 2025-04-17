Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63934C369B2
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 06:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C66E60BD5;
	Thu, 17 Apr 2025 06:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6WEof_IUXxY; Thu, 17 Apr 2025 06:48:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B2A760B0C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B2A760B0C;
	Thu, 17 Apr 2025 06:48:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E73DC11F
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 06:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCCC74034A
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 06:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8abhud_rA3Ve for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 06:48:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BFA29412BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFA29412BD
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFA29412BD
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 06:48:23 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ac25d2b2354so61566066b.1
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 23:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744872501; x=1745477301;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dXFzCJx72QWXe658fM0gsiSVN8ra7HAB028EiighQXw=;
 b=t0wI0FIWhb7P4KKG0pKVehQKuZ8P1Gvysl3W2tQ3FuLHee1S2bIbDt09YzjHSBowQj
 EFZOWGtnsVbNOZWJvwb1wtX/ZHGmsbcaG2afjlKqdDpFOJGX8YzT3EwB/4Ukz/m6//md
 MsERdBiPJGzCg4RDsNc5oX17Y/zjt18ZXZilk/2LcIDVIfB5/yCLc8v4LcYzxmSdlho1
 AgRCYQC5Y54DgjS4ItYh+lkSwNJXZxFuZYHJciY5Z4nYsIQ6sUv5j8niX849lzOygcgL
 maLoZwiSn/QI1mU+PCujaw7hCewQ061dEdpG7A2S0h7qH2DAINPw+bvzTxovZdRQPWOi
 iBUA==
X-Gm-Message-State: AOJu0YzV3kQ5CjHTab94FOpfGBI+RlMZrzpwluwwQ8xAL8H/421EYypr
 QkbOnKsMj3UbsA77SoavnTryRuSgQg83noF4BQmdjR04Lc39qSXpq+lW0w==
X-Gm-Gg: ASbGncumFoTQJ5pQGDqu7YCiaBcqf4KkViGl5bmxHNnZGhU8o0Zf6+5OxmBnvuCD1/S
 eOJzwpt/xSz9vWURD1vVxcE0hd5G32fjCHzqy8ovJAZdEvjStv/wFoCWg1lM9vmrt+VYIXKRKzv
 xbds1m5aK1wEIByBM2KTuote3wpMZ++PCGRYMKiq30R6hU4TaoiRPwfS9VuMUC1v37yyTtqSH7s
 8a+EQ1boVgJDUMgHwS7ENR0QOCtFLjCQpr+H1+N3GnzDQXoOWAQJDGP4IZ3jB2vhkAy7Gz1d8NR
 kl2uF2PvRcUVsJlsyb6jM4X/W1WurkdnZIAFzQWz/K0x3erE9VbCGiv0OolHmTPLlp9R
X-Google-Smtp-Source: AGHT+IHTNuKACncbFDOelX495TRQeCgr2xVAPAy5qroSaXhpbjXJMvcmSlawZHQA+Aio79sgO4Dy3w==
X-Received: by 2002:a17:907:6e87:b0:acb:34b1:4442 with SMTP id
 a640c23a62f3a-acb42b8eb83mr432986066b.48.1744872500810; 
 Wed, 16 Apr 2025 23:48:20 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb3d1c8685sm245052866b.144.2025.04.16.23.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 23:48:19 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Andrey Yurovsky <yurovsky@gmail.com>, Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 17 Apr 2025 08:48:09 +0200
Message-Id: <20250417064808.1597218-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744872501; x=1745477301; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dXFzCJx72QWXe658fM0gsiSVN8ra7HAB028EiighQXw=;
 b=PrYI8F3EoBD9ltu2hGwjLsXYRkGXujMfkzc0ZTOc75Q/dUwg3SAeZSQG9PWMcK8qIR
 3SZsTZ7hsom+vxghwknTuT5M2qRWjWrEC/pKOKWjolB4u+a5tV+qjRpqmJ+MC5H5OsyF
 xSKD1MWB9UbXCZGrheEMF9i7Cqfuj91CUUJ76WW3KmmfnPeEMgpbWrpz8n4gEjLBtbKz
 HN28dKW7Abrp/Ga0a7lcpLXJC6FLP2LNizdnqqx+P63M3jJDbdY/9C8vlOJnyVx+TvXg
 dtfbvhGsaSBVRsDGhNt5psKePCLZJ2YKj7FFYszvSj1KaRpUN5yDOhVMcwakDRfVD/oC
 29eg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PrYI8F3E
Subject: [Buildroot] [PATCH] package/rauc: bump to 1.14
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

Changelog: https://github.com/rauc/rauc/releases/tag/v1.14

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/rauc/rauc.hash | 2 +-
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index ff3e0e72e4..6795bc9485 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  1ddb218a5d713c8dbd6e04d5501d96629f1c8e2521576fbd9e7751edb7da113e  rauc-1.13.tar.xz
+sha256  f48c85573d82bf9378e907f6eba0cbe4f2021839a1e9fe3f8431f61dd54ef42c  rauc-1.14.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 92f58c6139..6bed5ec129 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.13
+RAUC_VERSION = 1.14
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
