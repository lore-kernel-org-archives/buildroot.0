Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E438ACCD190
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 768FF41037;
	Tue, 14 Oct 2025 18:39:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pt7yTuuZDTji; Tue, 14 Oct 2025 18:39:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BA5541544
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BA5541544;
	Tue, 14 Oct 2025 18:39:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0A24BC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E226340C50
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0S-k9fzLdse for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:39:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E7E89405AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7E89405AE
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7E89405AE
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:39:23 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46b303f755aso49820825e9.1
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 11:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760467162; x=1761071962;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6mIw0A71XamCmfib9hqt2gclJCIiA2QFdRckrJYfuUY=;
 b=aHIvPgCBk7d4xI34oT2yheHdPmN7pjfCh2qlhvpPivvAmP/ouQRWCBe1QoV9I8ieeF
 Iz9mPJn9k7XEVQIpbZe5iCd/XAloHa9dJ+2y/AMxOz1mMn2sgvQ8OQ0w9zadvASOf52T
 o3V6i52567UUahkZvcr+azRiqjP6XwDoeb4ys447MeVS98Xl7csdMG4BFekRcf5tlMyH
 zFiUaTA5zZlsxILBwaL7wPyOCQF2anywu1IfC7B7wpmVxW8ESLPUcfjF0srYa6wBQbwm
 a/EDUcIfG80NKWKD9XER31gFTxuxjPFnMqePBd50sEVizIgfHR9IXbvjxyMbeG8a07RA
 HXNQ==
X-Gm-Message-State: AOJu0Yy62uedE6dWWyKLtd+SUTdgqoDo7sd4H2tP0vkibx7EbhcuktoP
 VpenJJr4zGUfrypLFYK2q+lbxMFjy3cJ3AniRclo0rRTlUskGEJwq5neMtjrYNzW0mpOZvBa/sv
 yvNZVu0U=
X-Gm-Gg: ASbGncuSCAP9Cd+y67vID6j1Ae65FgGXtjew7hhvwV0RYfOSh3PAy8wiBbyOzrOtAnI
 sIozlS+UI3cV9ikjTbz92C4bjfC+qmu8SLpCsxn+oW7TKRwRCn0X9HwBIdOZ2grxhsM/j1mD5cn
 sTj2Z6yeCz9sUEhITPWy4L1g/QFjbm28RuMusjGEw2w2ejMYt/x0JpogINQ7oVHrBbO2I7ABshe
 PWCWNQFcs6HtfmnrTO73O9lpGYuHAJbJ/JuVNbpz5R5COaUCRCajcpcU1/1mxPYXZBVidXQzj1/
 ATJkCA6T34dPX3x4MZNZXqfDWMXQG+HR6Eb4vjC4uK8mnVMIf79wz5jTQxZLT5Y0QbZDlTKthDv
 PU1ZMDWmNTP2u0ZzFWExy5FNGp4VdsHq4siexpCXemzG1aTdOpsGLNsFuoS5zvmfkuJGy011ziT
 rAzuzED3GtvSsSkGxwDp3Og1vt
X-Google-Smtp-Source: AGHT+IFutBtjRgVGh4vTx8gQLgU4/BnefP2zqEsXHEeVuEuvD5QYYOvadKVibCq/DuIUea+tax1xuw==
X-Received: by 2002:a05:600c:8206:b0:46c:d476:52f3 with SMTP id
 5b1f17b1804b1-46fa9b021abmr162439465e9.26.1760467161727; 
 Tue, 14 Oct 2025 11:39:21 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.97])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cf71dsm24057639f8f.29.2025.10.14.11.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 11:39:21 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 14 Oct 2025 20:39:18 +0200
Message-ID: <20251014183918.647473-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760467162; x=1761071962;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6mIw0A71XamCmfib9hqt2gclJCIiA2QFdRckrJYfuUY=;
 b=bW8zddPEvXJPK99ZdAOUB7Lmy6JUfegMksMW/UsbQPsf9xtc7OV8bOWa02WrJ9nF2y
 K+Y513hetejPmN8aAwWlFSBTxhRR2bCC0WVHvWucVBPbF+i9pdYMZiYRnBzZ66P21bH/
 NJYumpnKnBp+V1oVFJzuFI4hB+4YNb1t+c2wo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=bW8zddPE
Subject: [Buildroot] [PATCH 1/1] package/iptraf-ng: security bump to version
 1.2.2
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

This bump includes the security fix for CVE-2024-52949.

Fixes:
https://www.cve.org/CVERecord?id=CVE-2024-52949.

Release notes:
https://github.com/iptraf-ng/iptraf-ng/releases/tag/v1.2.2

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/iptraf-ng/iptraf-ng.hash | 2 +-
 package/iptraf-ng/iptraf-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iptraf-ng/iptraf-ng.hash b/package/iptraf-ng/iptraf-ng.hash
index 314d5cee29b7..cadb436de181 100644
--- a/package/iptraf-ng/iptraf-ng.hash
+++ b/package/iptraf-ng/iptraf-ng.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9f5cef584065420dea1ba32c86126aede1fa9bd25b0f8362b0f9fd9754f00870  iptraf-ng-1.2.1.tar.gz
+sha256  75fd653745ea0705995c25e6c07b34252ecc2563c6a91b007a3a8c26f29cc252  iptraf-ng-1.2.2.tar.gz
 sha256  4e49bef38f621aac4a870da4b30011c7b7abc7256b218daec1c425b08448ae1e  LICENSE
diff --git a/package/iptraf-ng/iptraf-ng.mk b/package/iptraf-ng/iptraf-ng.mk
index 044630be414f..1558bd1cd67e 100644
--- a/package/iptraf-ng/iptraf-ng.mk
+++ b/package/iptraf-ng/iptraf-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPTRAF_NG_VERSION = 1.2.1
+IPTRAF_NG_VERSION = 1.2.2
 IPTRAF_NG_SITE = $(call github,iptraf-ng,iptraf-ng,v$(IPTRAF_NG_VERSION))
 IPTRAF_NG_LICENSE = GPL-2.0+
 IPTRAF_NG_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
