Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150E5CD1284
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 08:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEE766060B;
	Sun, 31 Mar 2024 08:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kO8tsEkxZd9Y; Sun, 31 Mar 2024 08:08:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAC9F605C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAC9F605C2;
	Sun, 31 Mar 2024 08:08:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 594421BF576
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 08:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CD39814C1
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 08:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alB6qvwj7cH1 for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 08:08:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 41EA28149D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41EA28149D
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41EA28149D
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 08:08:32 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1def89f0cfdso31335225ad.0
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 01:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711872512; x=1712477312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ozacL5NWgYGMTt8nDoP6nO0J1iP5maOjE1wWyrDHigA=;
 b=DWR8SfF+QKHxQkLgsa9ml/NnwCfPRun3dNyWxA5IH1vMSii4Heq1jbKzkk7Q3vCTIM
 ryiD6bCtFPCQ63sJQYsA8wHTFlc2dOPbM2VHuloBD6CBWBiSVm9vF2L9c7nHKnvFtcxF
 xbcops9I22bmfXJH4/MAGkAH9tmbbFDqHbOPamaTIq9r6n25FTmyn8VcCdriba+RGuMv
 5bkahEMQPsVB8JtyubY2iqZi84QsYb+TCo9AKtHMs8Jz3l4/0pPhZoFApBimQj9tPAM9
 F3XURfhO8UYk9HIgac5ZMmTh9D+WZLHohI6MuoMcIFcFfIAGHuZRZ2zGiUljfLKxCemd
 Fr9g==
X-Gm-Message-State: AOJu0Yy47PWvnU4BF/K+RwvanF/XM1PU84yHi/vcQ682+KD0xT4sgqk8
 Lgt6NP8apszx4czcw99z6IGYr+Fo8XrqnNYs6jfPe34ZVt5hhG+vF2J4gPyr6iON4cpIwMVLA8w
 yCJk=
X-Google-Smtp-Source: AGHT+IHJ4PqgfFrGn5tS9jzGhLCCgOcQogkWQQBNAYn+JmN61hBpGhWMe3a1FDWVNBcTdv3kGt6rVw==
X-Received: by 2002:a17:902:f684:b0:1e0:188c:ad4f with SMTP id
 l4-20020a170902f68400b001e0188cad4fmr11194297plg.26.1711872511986; 
 Sun, 31 Mar 2024 01:08:31 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 z4-20020a170903018400b001dc6f7e794dsm6423797plg.16.2024.03.31.01.08.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 31 Mar 2024 01:08:31 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 31 Mar 2024 01:08:29 -0700
Message-ID: <20240331080829.20331-1-christian@aperture.us>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1711872512; x=1712477312; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ozacL5NWgYGMTt8nDoP6nO0J1iP5maOjE1wWyrDHigA=;
 b=namop0OUyX3K0qSvVFoztLW3FnLV3dZ5V2eKJxSP43O941M9uUJ+Mb9qy0zdK4KHJ0
 OmkQg7wKQZfD3rN1yVtHAn5rkA+9S3Mtjctr09szG9sGOEgoNby8thu+4s2BmTQGnkNg
 uCaCVFbQpL4N1WxZJYRj3ZqcWU21p4tRopkZyxPzT4alXHK5nLVKWfQ4uOsvDvO1X6Vq
 QEmzqyt+1bZvmJb+uhvHFQEabKUzzNLQIwbcDaPOPrAi1Lu8EKAIhrjH9p1iaSmzHdVX
 HjJKLA4yyJKftoYGN38IicBFDUUpxMp9UaWkYVSZkRyRtSXdW0EEMdxCJQjPPIKCS52t
 CK4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=namop0OU
Subject: [Buildroot] [PATCH v1 1/1] package/fuse-overlayfs: bump version to
 v1.13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated hash for COPYING.

The license changed to GPL-2.0+ in v1.12

https://github.com/containers/fuse-overlayfs/releases/tag/v1.13

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/fuse-overlayfs/fuse-overlayfs.hash | 4 ++--
 package/fuse-overlayfs/fuse-overlayfs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fuse-overlayfs/fuse-overlayfs.hash b/package/fuse-overlayfs/fuse-overlayfs.hash
index b8df6c88a5..f1a326c82e 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.hash
+++ b/package/fuse-overlayfs/fuse-overlayfs.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  320a411425414679736dcb7f3b05146430ca4af20ded0096c69ac3c7540ebca2  fuse-overlayfs-1.11.tar.gz
+sha256  96d10344921d5796bcba7a38580ae14a53c4e60399bb90b238ac5a10b3bb65b2  fuse-overlayfs-1.13.tar.gz
 # Locally computed
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/fuse-overlayfs/fuse-overlayfs.mk b/package/fuse-overlayfs/fuse-overlayfs.mk
index 4db2ccd7d5..2aa208d554 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.mk
+++ b/package/fuse-overlayfs/fuse-overlayfs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FUSE_OVERLAYFS_VERSION = 1.11
+FUSE_OVERLAYFS_VERSION = 1.13
 FUSE_OVERLAYFS_SITE = $(call github,containers,fuse-overlayfs,v$(FUSE_OVERLAYFS_VERSION))
-FUSE_OVERLAYFS_LICENSE = GPL-3.0
+FUSE_OVERLAYFS_LICENSE = GPL-2.0+
 FUSE_OVERLAYFS_LICENSE_FILES = COPYING
 
 FUSE_OVERLAYFS_AUTORECONF = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
