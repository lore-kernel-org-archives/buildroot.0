Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073E5CCA470
	for <buildroot@archiver.kernel.org>; Mon,  6 Oct 2025 16:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A19C084114;
	Mon,  6 Oct 2025 16:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0BV_nqRvgdpd; Mon,  6 Oct 2025 16:49:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53BDF84112
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53BDF84112;
	Mon,  6 Oct 2025 16:49:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A0DF272
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 16:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FE77613DD
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 16:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wct3qtmfRDed for <buildroot@buildroot.org>;
 Mon,  6 Oct 2025 16:49:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 325C7613A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 325C7613A1
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 325C7613A1
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 16:49:01 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b4c89df6145so328841766b.3
 for <buildroot@buildroot.org>; Mon, 06 Oct 2025 09:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759769339; x=1760374139;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PL6ATJys/MN5mLSJ7yb6Mq366/x5siF2FeDEhvBLcf4=;
 b=q3aZ+s4j/fyCUwP7YEBjuYy2PF8ucyh/1S5PiKVp9VcENPtCGogZJup8h8CJWzDGQn
 43TnkNjPmtgv+bx/U1udBlGr2jiU8Bai1nxkChJVnefi5YTCjDPgL4KidcNYJru8JE+z
 0SfvrJx9aqYD/V8Zr10pMZpUWkrBSW6/H3WQx1IpOrLY2txD1ADr9dUb3IxvtO+mkS4B
 /S5kFz8R3IZl/YoV3wksd9IKxJlIfQGhe7WNvt+7IzgklqDyIZ6CBV0PBIVRACQeanRS
 W/bu+G47IdnqREFkvqLVbqdWOn9nTHBthX66bLCG4Phh1C6ma4U6++66CSz/HC3SqwIM
 iBSw==
X-Gm-Message-State: AOJu0YwjRAC9r8/y+C2o4XXMme3nvMSo8Jp4Kc5t29qVwgWmaQj45Dg3
 mmTntHJHr4w6hkLbDzeuKqxVKUHJ8vcan4esGp2jrCsbN02HKPti2/c18O9KLq5BxCSg2+Vfhzw
 aA1Epjn4=
X-Gm-Gg: ASbGncscBKS2MYAWXmmvvJu1fKQtOVNnkJZYLepLMlKdyugcGWwMYWG+9agQNLI4fGH
 gZVCEFicB7/5clJf+6lVIRdIajzE6BGxn6LY6JDruMSNmQLiIA1vaPkiC2KQ57UaOQKYgHXgE/M
 Aax3xQ9d2Uk8iPVvjaMhL+WQ9on8lOC2nmqnBiIRiIlIsPhXJ45HElVQMrYgN8yXnPJ1uMWAESz
 Ec0ZvJsCG4ZlGZ9nkqfxrRd8svrYhEodKLNTxAcStTrYhkHQgchaHDsUv/KlEXopgvhHjONNtZ0
 /Yc793vErzM/SM5pZ1o8gl5tN9XFW1Ym4cTsD2idwH4yx4+P1OMazhUwhFTSW20v0UroB4+Yr2W
 geKveq0qJ4cuhzrUWJRSQxDROv2kQM7/v3j7LudgfyOV7ZtHbNntQQSUtsZLYL4I7X6Nx5JcU40
 xLC9oFiatrqIfVjsN6xa3MJkFR983bb7lBu7pKFco7/oq50tiqI0aYsGAadbEx/2j0KubHpBfBW
 tJmq0DcGIt1OzI=
X-Google-Smtp-Source: AGHT+IHyOzn9FuhO1XWJrBM76kvPC/FgAzhBC4PI8YD3Ce99kmwn3SuLVebFvCmxbYJoFCIqK3BNyw==
X-Received: by 2002:a17:907:da6:b0:b3e:d492:d7b8 with SMTP id
 a640c23a62f3a-b49c45addbfmr1673767266b.64.1759769338956; 
 Mon, 06 Oct 2025 09:48:58 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b48652a9ea1sm1175011266b.16.2025.10.06.09.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 09:48:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon,  6 Oct 2025 18:48:55 +0200
Message-ID: <20251006164855.1886703-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759769339; x=1760374139;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PL6ATJys/MN5mLSJ7yb6Mq366/x5siF2FeDEhvBLcf4=;
 b=FAnJhnOJ/qDfG5SVcMxUL8IZHvtn5g1iQ7sytdG2CttKHG63VDwpjbn+xIOgKfRc61
 vxToLuQZo1x8DGYHM7mFwWxkrYQxXz1GppnVQ9EzusvminTdxxBz/yVeo6r4P62iyq2S
 5248VxQnluJvyXlI7Lb5Mrp5qD/ClLL8WBbOs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FAnJhnOJ
Subject: [Buildroot] [PATCH 1/1] package/fping: bump to version 5.4
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
https://github.com/schweikert/fping/releases/tag/v5.3
https://github.com/schweikert/fping/releases/tag/v5.4

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/fping/fping.hash | 2 +-
 package/fping/fping.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fping/fping.hash b/package/fping/fping.hash
index 8b68798409f5..a1ef393517e3 100644
--- a/package/fping/fping.hash
+++ b/package/fping/fping.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a7692d10d73fb0bb76e1f7459aa7f19bbcdbfc5adbedef02f468974b18b0e42f  fping-5.2.tar.gz
+sha256  be320771f075e47dd7e5704b485e9bdc7dd11107884345c0f7c18749357f668d  fping-5.4.tar.gz
 
 # Hash for license file
 sha256  6051b27e4b4a648f7bc8b329024da53a6e95ce88fcf0ccc259c371a74b741757  COPYING
diff --git a/package/fping/fping.mk b/package/fping/fping.mk
index dc43261be860..e4b7b8f2c65f 100644
--- a/package/fping/fping.mk
+++ b/package/fping/fping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FPING_VERSION = 5.2
+FPING_VERSION = 5.4
 FPING_SITE = http://fping.org/dist
 FPING_LICENSE = BSD-like
 FPING_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
