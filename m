Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7C3CAC598
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 22:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21F1D610DA;
	Tue, 16 Sep 2025 22:46:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N9UtgMH-Yd-y; Tue, 16 Sep 2025 22:46:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4102C610DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4102C610DB;
	Tue, 16 Sep 2025 22:46:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 496F5279
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 22:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F076610D2
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 22:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIVEtUMZEWRJ for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 22:46:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 319F4610DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 319F4610DA
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 319F4610DA
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 22:46:10 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-887745ee814so198856139f.3
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 15:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758062769; x=1758667569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KDwA8BO11cjxlas9+6cSAu2DcpFFftIEPnMGGdJkunU=;
 b=ZD0gNW4P8CxvazaTPBI4ZeY8UPhAlVxmMBUvakT+9nuXv+aZS+DVdAlTjkm5tg39Wz
 /HfmpVjjRGgqkqZbFCJLr9vlh9PKyRUBoiUjVeBp5hEyfD63Bwgjqm/hFOLzEIQGzUo4
 sAzRewEBX+FtQAXMcjZHcct47xfK0wqvazekysmrDplO1RrgadIZYSnDREnfPlFe9miH
 AhRHZfDVAOmUjqtTFCM9DjENpw8V6UdVH395rRsF2nOZNaAAQrNtjx/pYvHyCRlt1hP1
 AiYnTw9Ry6SMqDuTwlvh6DM9M9Eb4QaWe+ccGB9azoGQjakQnoFL/ktXccs7hL8DEcII
 Bcag==
X-Gm-Message-State: AOJu0Yw/1K2IdRqLqtWUWQQDmDqephsnQO6JDJjFhPWBBg3FAgNMmQTn
 NyiK5vavlurpotMULUDnxAUxQA4F6MY2zmg+f5qTUslAtzmNvzhOYH8fUviNVQ==
X-Gm-Gg: ASbGnctXhiGkycuFX9/2hHufdkQLeEcmiVVvGaEjo6G4vMA3JG8gygWuynpBjMyzP4q
 xwjDlV1P+xFTp9pNbDIEjsnD6b/nq3E7fP4MPPuXxy5mvWGPF3V7bYnMaS3mFh8+BROHdmUrFQP
 /n2rX2sssgDNKLe9P/sahiaMbPWqByAJCMo75DF3AVdDjfgbQqJeftC5Z4nF+ik55/addFLQK1T
 RCxGs04NJhLdrCmw4Bv5Q+QKobsqaMvsXXavS7bksk3fhzmDxxGIAybYJwla8bLrS2c4pd+Qe/z
 bzGptok280MXGXfBJ+0KWz5ESze8mER1j3BhCqS1uH9lWWrd6IXjCr0W5WxxmVAmMmXTz0HOkbH
 5QneYh0hO3zWUulUIohCuSI9SRDwHM0aZjnwk84XJ+7yE+emRpp5q+SKaqi6evPkYZNmx984aoh
 Lc
X-Google-Smtp-Source: AGHT+IFX5KvhjQ1yZoTvMG8Ik4UMljoMvQXO/N9IJ0+sWBra3mMkhxpCChDMf+5QajmiztT5v3SlKg==
X-Received: by 2002:a05:6e02:1a07:b0:419:671:25b7 with SMTP id
 e9e14a558f8ab-4241a55bcc1mr179925ab.24.1758062768648; 
 Tue, 16 Sep 2025 15:46:08 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-511f30cdf0csm6270031173.84.2025.09.16.15.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 15:46:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Sep 2025 16:46:02 -0600
Message-ID: <20250916224602.2935203-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916224602.2935203-1-james.hilliard1@gmail.com>
References: <20250916224602.2935203-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758062769; x=1758667569; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KDwA8BO11cjxlas9+6cSAu2DcpFFftIEPnMGGdJkunU=;
 b=dE2qgtuh6XYVj4z7POl6Nib+xooHbPtv5PMDgXbSaC5s4dxOAbNozzAW0+qUNhCfZJ
 sMcITNZ5cEcfR75/KNNfdPWiUhLxDq2Lgao8Yn5rVQRIOnjcH/ZYX2HaCw/SR/sFlFrd
 QbY6j4pkhrm+RXY+jA+T7ik/prYBf+jaQwzcBjyvGPgn8nYzSKMVS/7ereFB1b6hPXOD
 RpW/CXgHE1puu0MsTw91X7SMDzcaq5IMxCf/cLX+zUhQBwvPBJ1RYXZp3cJB2fbOx4fl
 U1USTB6NoFs8rernIu4eOvdkhPKcm/NN/IEllLxdTJcgOyzoSUPaI0KaWUmSH3KVCEwH
 64hQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dE2qgtuh
Subject: [Buildroot] [PATCH v2 2/2] package/cloudflared: bump to version
 2025.8.1
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

Also set BuiltForPackageManager=buildroot so that cloudflared's update
command informs the user to update cloudflared via buildroot.

Without BuiltForPackageManager set:
cloudflared update
INF cloudflared is up to date version=

With BuiltForPackageManager set:
cloudflared update
ERR cloudflared was installed by buildroot. Please update using the same method.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/cloudflared/cloudflared.hash | 2 +-
 package/cloudflared/cloudflared.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/cloudflared/cloudflared.hash b/package/cloudflared/cloudflared.hash
index f199160a94..407d24ccdb 100644
--- a/package/cloudflared/cloudflared.hash
+++ b/package/cloudflared/cloudflared.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f9223cdefaa4b75aa1c49638936af9d5007b6c7bd943ab70203bb75bf32467da  cloudflared-2025.1.0-go2.tar.gz
+sha256  803d3e162dc91da6b3b4f7961f57c113fa818d45517758511f72d254d68a46ba  cloudflared-2025.8.1-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/cloudflared/cloudflared.mk b/package/cloudflared/cloudflared.mk
index bf341b6b62..03b6a8fae6 100644
--- a/package/cloudflared/cloudflared.mk
+++ b/package/cloudflared/cloudflared.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-CLOUDFLARED_VERSION = 2025.1.0
+CLOUDFLARED_VERSION = 2025.8.1
 CLOUDFLARED_SITE = $(call github,cloudflare,cloudflared,$(CLOUDFLARED_VERSION))
 CLOUDFLARED_LICENSE = Apache-2.0
 CLOUDFLARED_LICENSE_FILES = LICENSE
 CLOUDFLARED_CPE_ID_VENDOR = cloudflare
 CLOUDFLARED_BUILD_TARGETS = cmd/cloudflared
-CLOUDFLARED_LDFLAGS = -X main.Version=$(CLOUDFLARED_VERSION)
+CLOUDFLARED_LDFLAGS = \
+	-X main.Version=$(CLOUDFLARED_VERSION) \
+	-X github.com/cloudflare/cloudflared/cmd/cloudflared/updater.BuiltForPackageManager=buildroot
 
 $(eval $(golang-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
