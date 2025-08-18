Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FDFCA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 14:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75AD9848C6;
	Mon, 18 Aug 2025 14:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iY_4LBd-xx8u; Mon, 18 Aug 2025 14:56:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44BEF848D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44BEF848D5;
	Mon, 18 Aug 2025 14:56:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BC36196
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 14:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D4D341763
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 14:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T3d2R0pRB3WF for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 14:56:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 312B440332
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 312B440332
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 312B440332
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 14:56:02 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45a1b065d58so31600705e9.1
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 07:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755528960; x=1756133760;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nfbvIjGYtqOqEIztnJZxBaXyab0PpBg6fQ9zRHmWWio=;
 b=aT0e4GAN0hyPR21Kax83cJPjV5fXCkwjmIJkWrcI340XGh91RjYwbt65N9db2iq8qD
 S3hUy16lCOd8t4CXT8pCXRPb8Isst1/z+GJ7Ht3c+yYjrNRKcpBwOqcbGgesaUCslp5P
 um0nD0KvrGFUb1B6nmqqT7lGVW+VkyU85qUXrg75gq2o20DmIF59wS8jsdpAoaAvcVUU
 FPZkPaTJ5xKIJpysBvhQV3QCrLYeYqDRxzk+E/SZUwAOSO/hxiOvPGxeKGgVV/FXEzm2
 ZoiLS9yEcv0s0Tq858VMAEmt4E/7w3+y2ZucRypahxAHDoqpaCp7VmnjB5nu+xKBJPA+
 kNDw==
X-Gm-Message-State: AOJu0YzZeDPccX0XjmKKWz7hqYsMdW0RuR4h/UywUQZ8fcxTN5nWBTW6
 J+YRNqqdQdkyPV6C60uu0I6zGXLo17D3UaTsuprfHYuWhAov5ye0oke0zREG8v11
X-Gm-Gg: ASbGncuO0xkH9J5zQmW+rLATtvXP0L6ZhyjFvDE11al04Tgf+RovnWiuC2Akxf4CGdU
 MGUW1BSaQvDCyT5CRIUA/I2KIfhU/U5IjJC4PVvY51VyJ/FBWjNi3b58bdhccQddOvsCxiiI4Cz
 wBebAsHPyRKeqqN8lP2JrPgYNbz+XmvvWFH1kJggQ6XyfcFsRfTd8Dajh2kkTeJVfZi3s/qYYoU
 MQcnvGC59/W5FOUOHU387USQwFwQb8O2yxfurt38/eiaOVRRQF9D3x9Xqfy02wfNDE0fntBw/RO
 eE8qHwlXVFm6xVS8jElhYVvjD3Yo0GWI7mkGDCVZtYBBakiit2rYH3SZcwihYVv5EChTEDqPZBq
 UQKa4meupGEMCacthiq9GCwP3nl0hDCcdAC8w1KdOVwyV/A==
X-Google-Smtp-Source: AGHT+IGlfJUfUdp6ADPiG9XZUhRAxkbcMZY9XVXspD38yA4vqpVfUmndT6zw9HgyoxjNjGOlyDzYrw==
X-Received: by 2002:a05:6000:1446:b0:3b7:9929:871c with SMTP id
 ffacd0b85a97d-3bb68c0472emr9851600f8f.37.1755528959685; 
 Mon, 18 Aug 2025 07:55:59 -0700 (PDT)
Received: from localhost.localdomain ([212.22.141.99])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb64758690sm13255840f8f.6.2025.08.18.07.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 07:55:59 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 18 Aug 2025 16:55:55 +0200
Message-Id: <20250818145555.1039619-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755528960; x=1756133760; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nfbvIjGYtqOqEIztnJZxBaXyab0PpBg6fQ9zRHmWWio=;
 b=PfMwXlNFXy4gCOy8CM8LVKnQ3h6xtOt+OPUcAEDeSrO2UuKTGoq6e5nLwaMrc3DBXD
 UzeUbVDywE4JFWALQZDiJ14yZMlTvczfbnbLmRf5PmWD2EKQhe6u+JWLxLUELyO3Qto6
 8Migxmq8+VjzAlXuQoZiRKewPoa+drQA3xDCvrbYE45w6Hsd7a9vntlJ6yD9OicEA6+K
 9dlYBY4bN1hvfV/kOiPpwjltktu0LEuvoWPy6jU+vi3PK6iPYbkSd3kLtk1NQEfOV8sN
 nRvbi1Y+0YzbjxT6O2RvemuxyCjtwd+p/5qDZSodAFe6X00ncPBM8z0xpk3VGSo2m94R
 7sdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PfMwXlNF
Subject: [Buildroot] [PATCH] package/cups: bump to version 2.4.12
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

Changelog:
https://github.com/OpenPrinting/cups/releases/tag/v2.4.12

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/cups/cups.hash | 4 ++--
 package/cups/cups.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index f826f96fe7..e363a761eb 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  9a88fe1da3a29a917c3fc67ce6eb3178399d68e1a548c6d86c70d9b13651fd71  cups-2.4.11-source.tar.gz
+sha256  b1dde191a4ae2760c47220c82ca6155a28c382701e6c1a0159d1054990231d59  cups-2.4.12-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
-sha256  5320b6e3c252423e4153eb2dd63e57e3b630afb21139f44e43b02d85fe33e279  NOTICE
+sha256  977206f041b9a6f47ac00531e1242c0fab7063da71178f8d868b167b70866b6d  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 31899114ef..21fe6a7c5e 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.11
+CUPS_VERSION = 2.4.12
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
