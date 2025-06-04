Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA65C5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B39940826;
	Wed,  4 Jun 2025 18:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NNJRtKhiTL1O; Wed,  4 Jun 2025 18:21:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91185407FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91185407FC;
	Wed,  4 Jun 2025 18:21:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EEA66DA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4BCE60E0B
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfToMcTOUQKx for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:21:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E02A760C06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E02A760C06
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E02A760C06
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:21:14 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2320d06b728so1673465ad.1
 for <buildroot@buildroot.org>; Wed, 04 Jun 2025 11:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749061274; x=1749666074;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l8X8LCQ4hmSa2oEb89Fsx046bWYxx/6FmqPRAAm9luI=;
 b=TrD8Jlg2gm0k/RUmJ0zmtMUv8jvJBIGJVeCaq2H2gEV0Heak+oAV8nlYcAWagdEdmh
 ekZq/8Iws2mSNhHoIe0zdtnzSUi9Q/MlSt//qXmZt3LpRl563P4jEL7JeiY9AuoiQE2O
 /16i4V5W7AkGPc1xz6QhNMQz/bp+QXQ2Hfhae+H4C1IYV7YYhgq5Tf6FzZ5HAQAH45PE
 IfQQOVMiOL3QJUkItWJ/OiXwy+/12GkDhxWscso2zIlOYI/vOzsoxrsBjiBQvPpNaYSi
 M5a+prUTlabQkUGC71NbMwYn8tD+ouEFfgSK6Ad6V1Wh+tsLZZDcyrwQe0xfasavDLj1
 lm8A==
X-Gm-Message-State: AOJu0YyWxbgVat2HM+XMGZGc/gF6CCBMNRY06htW3YvM3J9UcJLTCflH
 HWfOHX+RNj6N1vltV3azqFVqyIRIzDyjbKqlOja/mnueZHO7/Y20pZEtYMZ3g3VO
X-Gm-Gg: ASbGncu3sX39Ofw+cQcQUg4Io9KrUKAREiYGVObRVd9ewgbwjBY63RTuI5YaFxSotRO
 Hanv8se8GdeEUPhncYm+EESO8237f1ewle4+5YwGJTf7Ovd17hzb3mpqJJrPCt6DsVp8sh9UOfb
 a0ZY1OTGJAG9gbsiFFTF3AXzm3jIueRbmfCrpySaveFRMCbMol7enMba9EEMtRpkPTGolQTFBA6
 ogl24zm7yGgX+DrcEqu8Lv9ROph4WQ0xj4Eqpptf3ugGFkp3vMjY/C298c5WUD2y/INkf+Dlr2L
 rT9L9OKKFFBgC1Vb0lm5q8af9NNtuF0mr8KSyMo/jwA4ZrmKHwv2TFtEjkDKA9dHIUD87Zjqfz5
 Uvu4nOtHYbTWjtPFDis29yxLAFK3Mnhdoom31DQ==
X-Google-Smtp-Source: AGHT+IGxkdnt1hhQ0vJxMZWa+hfCPzSL/EI3YlzFTYzFtWXVKE/hTBqPTwaaQS3kC/xQ6KaNvFYUpQ==
X-Received: by 2002:a17:902:d48a:b0:234:9052:2be6 with SMTP id
 d9443c01a7336-235e1504e2dmr57567745ad.41.1749061273649; 
 Wed, 04 Jun 2025 11:21:13 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cf954esm107140945ad.210.2025.06.04.11.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 11:21:13 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kadambini Nema <kadambini.nema@gmail.com>
Date: Wed,  4 Jun 2025 11:20:01 -0700
Message-Id: <20250604182001.110162-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749061274; x=1749666074; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l8X8LCQ4hmSa2oEb89Fsx046bWYxx/6FmqPRAAm9luI=;
 b=TwmspP7AM1AGA+8ePGWdRkO5EV/VVEdg3l0ebfvbyWdAB+E3I7Q3+6GRx7KCi1FydA
 lWqxVabTQg3t6Few3+jmzdI3pVdUW/BabEyniNJP9sNVae5gczYx56CiyksThrV3pPFZ
 eby+1kcMEDdprhetXIFr60imaIUIlisi5C5/hkJjF89TWBE555uAF73R+UBEVQeLNzH3
 w1pt52a3rG54aGZbiTHLkatjGvCbJOBOf8Xc1XdVAxzI+avwI7uCEiy1QPD0qwoZBl3G
 c8OKeBXu0EJ6G1YAw8s1ybBudo56UhULhRiSHpLssJxBV928wM6v3ES4UWRh6tX+Bx9e
 tJmA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TwmspP7A
Subject: [Buildroot] [PATCH 1/1] package/msmtp: bump version to 1.8.30
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
https://marlam.de/msmtp/news/msmtp-1-8-30/

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/msmtp/msmtp.hash | 4 ++--
 package/msmtp/msmtp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index 2aadb92700..4ac80bb1b2 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
-# https://marlam.de/msmtp/releases/msmtp-1.8.29.tar.xz.sig
+# https://marlam.de/msmtp/releases/msmtp-1.8.30.tar.xz.sig
 # with key 2F61B4828BBA779AECB3F32703A2A4AB1E32FD34
-sha256  13a78f3c6034b33008a7f2474fdddd0deaf7db6da89d0791d3d75eae721220d7  msmtp-1.8.29.tar.xz
+sha256  f826a3c500c4dfeed814685097cead9b2b3dca5a2ec3897967cb9032570fa9ab  msmtp-1.8.30.tar.xz
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 9073fffe76..c391ce8204 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.8.29
+MSMTP_VERSION = 1.8.30
 MSMTP_SITE = https://marlam.de/msmtp/releases
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
