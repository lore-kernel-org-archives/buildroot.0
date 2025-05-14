Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5D1C3ABD9
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 13:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7232610DA;
	Wed, 14 May 2025 13:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2YQYFj6A0pbS; Wed, 14 May 2025 13:43:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC3D9610CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC3D9610CC;
	Wed, 14 May 2025 13:43:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22EE0150
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F0E540B49
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ViOKoskhrPer for <buildroot@buildroot.org>;
 Wed, 14 May 2025 13:43:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4963F4062E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4963F4062E
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4963F4062E
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:43:23 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5f6f86580ecso1038229a12.1
 for <buildroot@buildroot.org>; Wed, 14 May 2025 06:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747230200; x=1747835000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lyYzx6gwXtzu/SMMBtUB9M4U4gC/p7g56Mt45cTqPOI=;
 b=rrPTS+3WR748V/+9vOJtFHkFqb3bneORCIKK3Hc4gVCVW/1jB5HvjslTfXFNTQxuAq
 OC4zAmmJIOVe91FMui3InkBr9YTDKnctUFnoXLptD66MX1ypxI054U/ppN4qWbd9qQbA
 qm6scsMdYkpecIl8C9cQ2NwvNZ5A3MbG0B+xJoo3AVUyLHapWYVknPbE727qhFntwljt
 tyQHQwQ5XuufqDW/u2gkNUOM61VwYPw1ChkFLLwSXRR6GXj1ni1fnONLzkKzy6+RjxGC
 b3TtcXn035VtASHbwtGW/91Uz3CzAHp3LInlfS14q+ReWkV60IZf6wloa5xgPNgDY78S
 1d4g==
X-Gm-Message-State: AOJu0YzetmY0LZNYWbbM9GriAEO6Rsit/l1PX6mvuhBm6tuGzcvXTcM7
 9cum0KdBa6x2iiD1nqs1S/6L891Nwp5CQrOyWfOU9uUX1jRZRqjAW5qNnQZNOwS4nTcZ6wvCJwd
 5
X-Gm-Gg: ASbGncu5lx0wiMuK+OqFHPNWeTopcSFuw/Jpjc1rvdwwf93CeUHkqedW88hj0j85NhS
 1BUwYM4XqpGX4E8uqui7HmozQ5UZ3J/Pv986IzJMq2mSVVPs/lS1hkUnvQsO1ivuTG3Z64rHazR
 hSCEnielbbu06gYe5ix6YwNdwd8cTFwq5XmBjdMXxoeXua0ZsGLNEAfyx2Rid4aPizmQjiQZHRv
 shYmJ02antEKEqAJOxv/Sl9xDuBMUGPLkxssGWCTUyR+MJRT0A0URvdE5NNpAEZIpnHHBWOOc8S
 SgRBfR4dwNluMeNet/+OLLxaVvU9mbENozCP0l3ytrKTrR3mL2ABdPXGTWOqiT7DSStmtFqfMoV
 QRF9Det1IpyNOkmNjJqKHMsfVd5v3DmEKKKCf05R6XWE+C4Pexqo/Xm8GdxSamlgelMUjTqbTcz
 20LHxvR55TY8la2EMpKGQN
X-Google-Smtp-Source: AGHT+IEEusfrH6hjH83ek4KGOzllqrXSpe3xXsK4PpqjKff7ad/V4hqCxBppjAwjM9tZPkLZwFpwew==
X-Received: by 2002:a05:6402:234d:b0:5fe:7b09:9e16 with SMTP id
 4fb4d7f45d1cf-5ff988b9ee0mr1074354a12.5.1747230200298; 
 Wed, 14 May 2025 06:43:20 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd3a6sm934783866b.131.2025.05.14.06.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 06:43:19 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 May 2025 15:43:11 +0200
Message-ID: <20250514134314.2405052-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514134314.2405052-1-adam.duskett@amarulasolutions.com>
References: <20250514134314.2405052-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747230200; x=1747835000;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lyYzx6gwXtzu/SMMBtUB9M4U4gC/p7g56Mt45cTqPOI=;
 b=KeyODa8P59HMbl+5yo+O9tB/7vAVOSJDrpfK6pwQ42BYbGiHNiG6Zm74PTC+XZSa0w
 n3bpbP6M7fB2gxSaA5XWISusHCJE12W5q6lGoutnxfsHRKUrqVAy/hlbfGtngRt/mQsV
 nekh9BEP+K5p4/+kbtrU0Dg2dvkcwCYTlwom8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=KeyODa8P
Subject: [Buildroot] [PATCH 3/6] package/utf8proc: bump version to 2.10.0
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

Adds unicode 16 support

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/utf8proc/utf8proc.hash | 2 +-
 package/utf8proc/utf8proc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/utf8proc/utf8proc.hash b/package/utf8proc/utf8proc.hash
index 7fee89968d..560c6b2ccf 100644
--- a/package/utf8proc/utf8proc.hash
+++ b/package/utf8proc/utf8proc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bd215d04313b5bc42c1abedbcb0a6574667e31acee1085543a232204e36384c4  utf8proc-2.9.0.tar.gz
+sha256  276a37dc4d1dd24d7896826a579f4439d1e5fe33603add786bb083cab802e23e  utf8proc-2.10.0.tar.gz
 sha256  3b510150d34f248a221bb88e1d811238d6c6c18b51231822c42974c39bb07256  LICENSE.md
diff --git a/package/utf8proc/utf8proc.mk b/package/utf8proc/utf8proc.mk
index 42ec48e0a8..79909ec106 100644
--- a/package/utf8proc/utf8proc.mk
+++ b/package/utf8proc/utf8proc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTF8PROC_VERSION = 2.9.0
+UTF8PROC_VERSION = 2.10.0
 UTF8PROC_SITE = https://github.com/JuliaStrings/utf8proc/releases/download/v$(UTF8PROC_VERSION)
 UTF8PROC_LICENSE = MIT
 UTF8PROC_LICENSE_FILES = LICENSE.md
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
