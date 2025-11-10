Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FF5CCF9E3
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 18:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11BBE404C8;
	Mon, 10 Nov 2025 18:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92KcXXj0B5aI; Mon, 10 Nov 2025 18:39:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6628240198
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6628240198;
	Mon, 10 Nov 2025 18:39:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77F871CC
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 18:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56AE3605BE
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 18:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U2YUl1qT8Q2v for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 18:38:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 40A6160A68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40A6160A68
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40A6160A68
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 18:38:59 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-64198771a9bso2273470a12.2
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 10:38:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762799937; x=1763404737;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mNGiNtFByYKA/U6Kwerz+W+22zcMf+WyvlyhfWDORkY=;
 b=cgWyrIEO31/zUCXJ5Dg9IxxOg5RrVlczQI8rf8j4p9DT/mbXJX0fMQo/RC0Kp/4RGG
 kgZ/WmKlCljwvowdD0kD0rUjuMqQ4q61iyvOQE1+R2CceX2Er2MWDqT3vVC6xflHCTOn
 lNg8huRz9LkAtj/BDZnAo3c/6bKlKiLUCGheGf0KQMmqHiI1vqCFQc9Csx5K3eNj+GtY
 Qgmq9eliNmCZYM6jGFM5sOgPtEPICMcMbsmhUdWjckEtaQtp2lcYbDk1zEbbGFQ1gWnL
 C3WORPm5EwvJsoIPiLxk3kzO7iBc5PIMMxHZfTpSKWt2wb8ol7n+6oLuuy52rEAfpbGl
 b79Q==
X-Gm-Message-State: AOJu0YxrG003e0adiQijH7LLFm2mTlkym9E6scpkfYPV6fiQ2h2i5qmS
 vj+20YYxu0N7NmK7SgL2IU3SoMAkyi8bt0jsu8fgoxdwood+VL6DJqSXEq30tmBzyWqZDIx7CSC
 gjzPV
X-Gm-Gg: ASbGnctpzlYeuZnEkzqTo6x9j2S3u8V3d9cUIxNE3z0byJQx9G9YvnKG0JhFDeaUtp/
 g9UQ1mncunld+cpPwALke34RxnfysDSBNz6v+3QEpw6B124vYLrNnYR7pjC78D8qjsDyG9dAi8k
 0uc57GyDtyB1TQzasfleeewLpm6eFUuG7C50lSlNrwVMRLBfdfRO2WfptPUVwaS/hcnTbvPRAoZ
 2qIsxuyoGpWO1GPL8lo+/dDuX0VsMRm+XP7Nyf5Sh4xZkHjqKLzN9tdAGNPaNzAnWRyKAzmqZWz
 Bb7LXf3mRJf0G50zK5mWu1wNDcXISQrBlxZ9KNSmb3WWwZcNGnRiMIwKrQ70IZqgG26lUkDlVIG
 9KKE4aVJXTXPAfuTHFw6QRyqR54t6akG292/YkPH2rhi1ZSU4q9FZNCmbflK8CQYIzlKcd2ymT7
 GLFOXF0FxT/sgkoZba0ZpNr7ohfxpIFf7XnDL0p7qumaYhdVYuTo6x0u64X+ZvWOY=
X-Google-Smtp-Source: AGHT+IENTGVMsVVB3wLyziYp+GT+9wtBgWXz/AMqLZHZgW0JQWRqII2Hfx4J1NBaW0FP52WE9B4Vvw==
X-Received: by 2002:a05:6402:3589:b0:640:b808:75f8 with SMTP id
 4fb4d7f45d1cf-6415dbf4b4bmr7263402a12.7.1762799936958; 
 Mon, 10 Nov 2025 10:38:56 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f71393fsm12088078a12.3.2025.11.10.10.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 10:38:56 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dariobin@libero.it>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 10 Nov 2025 19:38:52 +0100
Message-ID: <20251110183852.1563988-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1762799937; x=1763404737;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mNGiNtFByYKA/U6Kwerz+W+22zcMf+WyvlyhfWDORkY=;
 b=hgkmG0G7diRfXEy+UJNRqGF9/mK2s3hKR3WDmtJowG/i/y2s0dDgqsZCEOhV1GbVf0
 Xe2g7zu1TXuV67eXFxaAKOOyKa2T/aYdjF0J2ixCwzwG0xXi1ZQHCHZSEvDJS2J/+MZW
 P9ZmJsHkflGK4a3nxR7MI1A1cg4VgqnDGxwfI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=hgkmG0G7
Subject: [Buildroot] [PATCH 1/1] package/uboot-bootcount: bump to version
 3.2.0
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

Release notes:
https://github.com/VoltServer/uboot-bootcount/releases/tag/v3.2.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uboot-bootcount/uboot-bootcount.hash | 2 +-
 package/uboot-bootcount/uboot-bootcount.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uboot-bootcount/uboot-bootcount.hash b/package/uboot-bootcount/uboot-bootcount.hash
index aaf702c789aa..da77d614a9ab 100644
--- a/package/uboot-bootcount/uboot-bootcount.hash
+++ b/package/uboot-bootcount/uboot-bootcount.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dd74a806c779c3180250ca2fce68ce9dc59f9d5fa1cbd170212cf7878c56d348  uboot-bootcount-3.1.0.tar.gz
+sha256  cd3345ac6ff1f44588ae39a8da4bc9c7993f98ece556f374f2f7af6715a9cfa7  uboot-bootcount-3.2.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uboot-bootcount/uboot-bootcount.mk b/package/uboot-bootcount/uboot-bootcount.mk
index 2c75f8f5642f..26d2b95bacc6 100644
--- a/package/uboot-bootcount/uboot-bootcount.mk
+++ b/package/uboot-bootcount/uboot-bootcount.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_BOOTCOUNT_VERSION = 3.1.0
+UBOOT_BOOTCOUNT_VERSION = 3.2.0
 UBOOT_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-bootcount,v$(UBOOT_BOOTCOUNT_VERSION))
 UBOOT_BOOTCOUNT_LICENSE = GPL-3.0
 UBOOT_BOOTCOUNT_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
