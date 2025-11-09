Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06B9CCFA1E
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 10:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D339F81358;
	Sun,  9 Nov 2025 10:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kx2ZQI0NelJu; Sun,  9 Nov 2025 10:37:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E093281353
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E093281353;
	Sun,  9 Nov 2025 10:37:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6F5C25D
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 10:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8ADB40394
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 10:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5NOiXNUnnsMt for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 10:37:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BA9B44024E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA9B44024E
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA9B44024E
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 10:37:15 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-64165cd689eso1212104a12.0
 for <buildroot@buildroot.org>; Sun, 09 Nov 2025 02:37:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762684633; x=1763289433;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmMIb7PE/zjS5PykqNVmnODKjhi4ewoI1tFBlwB93eA=;
 b=cF2qJMytGHbqeqHdbzIHFsXaGR8gOysdPykxbhVjmAc1hIS9DHV4ZAQqVQuD8Kzdrm
 lL83Djw0m/g42vqJnusKTfmV/H8Aqh2+BSIBYdKOmlsK0LhqOnGeNNJ9MzYEOoETjZsZ
 2m4gg0ka7B8J2wiUy0RcjGOC63YixRwQdmzupUAp9iKSZwjVSvdY7nbieQusfblza33m
 m8wCIJUvqUZ54JYJhW0kD4rt1vTjAuDA7yJ8v2FxKXiUQdWdBrathIva7u+vZfVGi9l0
 gBhiB8dOto5H1jitxxL/l55KK1Ma8OyrXAeO6+5iGPrIF8S5wfXrINJWiomvMGuulvZJ
 fLmg==
X-Gm-Message-State: AOJu0Yxfw5o47EcFv4pcDsKXYSLqW9OnkywLi5Ob9gWJnKty2PFdUo5y
 erGY0qtGfSkZ5ZD8UyaU3ckl9sPmBuylSA2yZdWDo0BfvRJsbgb4Pk+wMX9gwAamVi3q9joIuX7
 ahcyj
X-Gm-Gg: ASbGncu62hVGWjorcwCcGbOvYyysrLKY67sOqqUHhIDQ8ssxaL+9ny/rvhIpM4hjp01
 tEcPJtgQi4azy4r8dcYSf753gPobhwJFu5Rkq7vbDxoSBEzzRuVnleUIOiGPObnNmjum2EieMFc
 K3R7dmBG+y1rwSD/xiRyHqXNfo4qzald706PsbNKRUIDr0uMfJ79pNQbCMy7XQ1vknK1SXxEJ4f
 S3YvgpkVL14erJl00GbMdzPFMPKO2kVOvifLX9xLoZqmYffLCOaP6tPMcp2Z5/zIQMx0Q7I4YAd
 iwHZx50Qu8PMEOl7ZfaMQRIPwxcUxO8aCd30M5D5fuPnDJ8gYSj4ViFl5F3o3HCq48W1gD9mmi/
 6cHAbLdqiC0vVapy06Xu4GKN7Rr2cVRkwSN4SoQmXvCvFgWqKs7YIjQF/2f2j6IF14Bf/PKYII9
 ZG2i6CxcMG8eIv60ctK+dYJt/nLaavj66lucyildKCE5pe7FPL80qjly+k25AjeTs/ykm1mleUe
 wGTG3YbaD7xqn0X/q1BLE8OwOf6MFJV8YazQU8TJA==
X-Google-Smtp-Source: AGHT+IGjrSWI9zCR3AUTiztGiWnCsFlPHc8j4eRu0xg6/pH9ZM0JWKTjU5mjnvVN7PYUdpQxjPpIDQ==
X-Received: by 2002:a05:6402:3588:b0:640:cf02:79e7 with SMTP id
 4fb4d7f45d1cf-6415a077dafmr3951005a12.12.1762684633549; 
 Sun, 09 Nov 2025 02:37:13 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-0-92-181.retail.telecomitalia.it. [87.0.92.181])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64169852018sm2714655a12.16.2025.11.09.02.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Nov 2025 02:37:13 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun,  9 Nov 2025 11:37:10 +0100
Message-ID: <20251109103710.564041-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1762684633; x=1763289433;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wmMIb7PE/zjS5PykqNVmnODKjhi4ewoI1tFBlwB93eA=;
 b=iLshdhoXbvMM6/U2jlHbxaPyxd1XSBSGpmvImagY3x2a969CfZdQjuG1SHjklKNb86
 tb1LDJYN4+Fbkqr99gJt+pzJlAPzmVXbzVLIoLLbMXyUcK0b9/CDluOEBiLkRO0fxEHM
 DvcPCzKbEEkHYA2tjV9nfYTJy6sMZIRKAWObE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=iLshdhoX
Subject: [Buildroot] [PATCH 1/1] package/cppzmq: bump to version 4.11.0
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

https://github.com/zeromq/cppzmq/releases/tag/v4.11.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/cppzmq/cppzmq.hash | 2 +-
 package/cppzmq/cppzmq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cppzmq/cppzmq.hash b/package/cppzmq/cppzmq.hash
index dd6e06494a3d..a2410daa730e 100644
--- a/package/cppzmq/cppzmq.hash
+++ b/package/cppzmq/cppzmq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c81c81bba8a7644c84932225f018b5088743a22999c6d82a2b5f5cd1e6942b74  cppzmq-4.10.0.tar.gz
+sha256  0fff4ff311a7c88fdb76fceefba0e180232d56984f577db371d505e4d4c91afd  cppzmq-4.11.0.tar.gz
 sha256  7e6db90e2e805c72b3daa77849d1cb5f1f92da0e69750c8a4aa1d86d70704748  LICENSE
diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
index 90213ec0f60a..0f52296dbd89 100644
--- a/package/cppzmq/cppzmq.mk
+++ b/package/cppzmq/cppzmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPPZMQ_VERSION = 4.10.0
+CPPZMQ_VERSION = 4.11.0
 CPPZMQ_SITE = $(call github,zeromq,cppzmq,v$(CPPZMQ_VERSION))
 CPPZMQ_INSTALL_STAGING = YES
 CPPZMQ_DEPENDENCIES = host-pkgconf zeromq
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
