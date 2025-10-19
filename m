Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16531CCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 15:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8FF84121B;
	Sun, 19 Oct 2025 15:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmtCUBvudP0b; Sun, 19 Oct 2025 15:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B92B441283
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B92B441283;
	Sun, 19 Oct 2025 15:21:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FBC81CD
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 15:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 278AF40A48
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 15:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UhxCPo13NBVs for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 15:21:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 57FC04005A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57FC04005A
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57FC04005A
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 15:21:18 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b3ee18913c0so659349866b.3
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 08:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760887276; x=1761492076;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pgGh4ghZj0q2FtRMQrnMLH1o4Lgo13Vd2XMC8UY9+94=;
 b=hV7jCqFJwCjC5KI2SnRAHbAThwIGwCDo0uUXb9PWlQq5n25q0kpL8D/tHlz+e3J/xE
 /9v+Us+Z4ZNz0U54WnS1AercDqDOcdWOUauOK7ku64QqJjOpMjM68NpAozMcdsuH4Tw1
 oD2K9QkLDlG5PAcOCHgwy08CApfGBPmvL6U8Nr7AMiVrFlXgr6zoJ1Jdfn8W2cZArbOk
 Poj6hV3YctUod8OLu9ZxHZyRs8stSUdyqS1X5EhctS/g7wJDxB2Rk+Q2k3Hl995zpr06
 VJPCUjSDLq/r4R0SBgrBG8AcUjIr2KKvby8DTdFXyJs5wRcT8SYuRlb2BGj69bAcb08b
 ja0A==
X-Gm-Message-State: AOJu0Yx88LkeOPrGFpcpBMHVZPIR6/xLy0RHZkvPOeNiQUqHzHfm/Ak1
 UXSsbL5Q0ZE+YQVwGluKBHk3qovZTEkPKFXYPIvH/RD50uUB0FGUxFldLHTBcwbF/Uhi6/Pwuvi
 HliZNAv0=
X-Gm-Gg: ASbGncs9rcqE32DNUYLhGPYzzbJfvpKZuNlI/c3YYu8oKa0wvPCofZVi/xtg72kbW6q
 iwUVY7y7YEaoADvNeVsRDnjcdDf/uufr0/yxfBlYxVuoDQzbaro9XYCraUiHjKnpynZqXp5y+il
 LBQ3Tg4feXFTU4CsDVQOvbhMVwJLPqXO03GcF07/1BBuicJCWN7My8QaayEiKtT0er7i1KeQp+4
 /Tq+VkbXVRP85YlNpXVFXj6JqnPGGUF06q99JI9f9Z7PCrgY+FZTZk66eisGfmoK093WE4QuIbz
 J+BzpxMM6f4edm6NLDrKxCiYd3YMaiQOvYF/Ck0VbakShwiG4t9yyzq+Ea7GdrOwnffrcbCzZCt
 HxLcd4FLnS4ujSpVS7D5cwMWrTR914tETkbpldxXi7vTNLWHjcbrgi4GrAcKMJk1nLjrt5sm/kR
 rFGeCQ8vuP9kICkstwOWVzHq05uftKze16tGuW8Dlt9wP407UfThD7syLyY3m/lVQOCQIFYFJel
 oF5/o5AFfx0ceENp8PuWQ/LtKfE+LCfjpguiwGgLKG07mpqxY5VJLI=
X-Google-Smtp-Source: AGHT+IGEXjh5Aocr99sK6MQ1+ynGuNYcrMo/0SW1Z59NJ2UwuW/vH0K+tQrW3KGDR7SfnKIPJ/ijug==
X-Received: by 2002:a17:906:7314:b0:b29:e717:f0b0 with SMTP id
 a640c23a62f3a-b647500ec0emr1027055066b.59.1760887275858; 
 Sun, 19 Oct 2025 08:21:15 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65eb0365e1sm530374366b.48.2025.10.19.08.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Oct 2025 08:21:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 19 Oct 2025 17:21:12 +0200
Message-ID: <20251019152112.1337555-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760887276; x=1761492076;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pgGh4ghZj0q2FtRMQrnMLH1o4Lgo13Vd2XMC8UY9+94=;
 b=d2qV/DUKf5dcx/sOmidhBvefFeGE1zj+62ls3w/Azt9caAXx97JwpQyoAX+E2HU4dm
 mwRUBNBv8Wwd3i16ezSvSjA9kfo0CRC/OL9LCp3xfVadeAuIgSAStu6TAh1kq6azK4he
 Qht05WAf6nVDpjPGyUTerg5m2SLwjzvUrad/Q=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=d2qV/DUK
Subject: [Buildroot] [PATCH 1/1] package/libarchive: security bump to
 version 3.8.2
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

This bump includes the security fix for CVE-2025-25724.

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-25724.

Release notes:
https://github.com/libarchive/libarchive/releases/tag/v3.8.2

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libarchive/libarchive.hash | 4 ++--
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index b8738e4a9930..f31b693c6702 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,5 +1,5 @@
 # Locally computed after verifying the signature from
-# https://www.libarchive.de/downloads/libarchive-3.8.1.tar.xz.asc
-sha256  19f917d42d530f98815ac824d90c7eaf648e9d9a50e4f309c812457ffa5496b5  libarchive-3.8.1.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.2.tar.xz.asc
+sha256  db0dee91561cbd957689036a3a71281efefd131d35d1d98ebbc32720e4da58e2  libarchive-3.8.2.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 1dafec726bc8..8568847493f9 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.1
+LIBARCHIVE_VERSION = 3.8.2
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
