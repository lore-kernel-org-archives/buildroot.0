Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9A2C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 22:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DA8D608DB;
	Mon, 25 Mar 2024 22:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7DYvXMX5hb8; Mon, 25 Mar 2024 22:35:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3028A608FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3028A608FE;
	Mon, 25 Mar 2024 22:35:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4695A1BF2A9
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 340BC81371
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bmrel5OYBCEp for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 22:34:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 58C1981362
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58C1981362
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58C1981362
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 22:34:45 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1de0f92e649so34132125ad.0
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 15:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711406084; x=1712010884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w/hB7NgIVgmLI8Q3z9jPi2nGVG1jo5WSvup72AaMATg=;
 b=nrX9G3NoZcfi1VzaFpHyuT+5Ze7bNMtd4TNjlK+QbqCibHNC+QgcZy6x3z9MS5mLhj
 IOAvd5KLBoGEocPYOekFIw+2Y96GV4MoI9RV13Mue1b+7w6zjHjv1vNKORZQ6ezGrILK
 An9v7SJYm9MaV8LaMxGUtAGiQZfkDSetcy7nqED0OYDmfP3ve77iqyEj4l4ZpV5Tm43A
 QRFfbXhs7nLLKVPvfw//z8pqwof1gLiEOKcQXW/g0Yr5zr/OSDpdrx8HqqctklzOqOQw
 9JqUtmHG+h0fhMKJ6wxkMBSQ0zjdYgRtvkfo9qlwk4Kk3sdPiMXuXIxwYOz8ZrN6o7wb
 Pdsg==
X-Gm-Message-State: AOJu0Yy4B34HRYWgTE5gcmWCJt76ONaq/XdqP5QJCmvAcY9Ca5arJq7i
 nVgc927uOeON19owIEFJv4sYWSXyc6AqWmuVIutcyfVBk6DCTJmJvFBcJDbI6yMfxKAzzx72rxc
 +
X-Google-Smtp-Source: AGHT+IF5jKS6RvfSGCMVmImHADRwvpkFRhNpIvPK0dJTMtZbcFKJGZoy3gErgf15debYCBF7Qhmc/Q==
X-Received: by 2002:a17:903:24c:b0:1e0:bc5e:5ee1 with SMTP id
 j12-20020a170903024c00b001e0bc5e5ee1mr1617289plh.47.1711406084450; 
 Mon, 25 Mar 2024 15:34:44 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a170902f54a00b001dd7a97a266sm5245323plf.282.2024.03.25.15.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 15:34:44 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 16:34:21 -0600
Message-ID: <20240325223424.108702-10-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
References: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711406084; x=1712010884;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/hB7NgIVgmLI8Q3z9jPi2nGVG1jo5WSvup72AaMATg=;
 b=UQiYFWg/s0R/GGLXWAf0D6jPb5iLwE6H1tbIMHTTnnPAP5Nsinnw9zvxmC4+CRmcR9
 P7LxwfPy6LpRY4yrJbne+LDtiqUB/Q6Vxwm6ClWR875BrOP7StdFLMCd3uqoR7jorChf
 qG2P/XLdeB5SYxqBqBkeqLJ5nWqaOsokwGIIY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=UQiYFWg/
Subject: [Buildroot] [PATCH v2 10/13] package/flutter-pi: bump version to
 783db32ec6441b878783bfa241777d3bfe6b35e2
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-pi/flutter-pi.hash | 2 +-
 package/flutter-pi/flutter-pi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-pi/flutter-pi.hash b/package/flutter-pi/flutter-pi.hash
index df47d666bd..956827a5b3 100644
--- a/package/flutter-pi/flutter-pi.hash
+++ b/package/flutter-pi/flutter-pi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6b11f260567a4589915cf29ce2ffa62b6f80414242a65c616f01983ae3a177b7  flutter-pi-75e72fef8e8ce65ec72a002c00d9c6db4d1479d3-br1.tar.gz
+sha256  4ab2ae849d46261fe22ed94eae5726841d34119a5656e85b26c7c8802050d14c  flutter-pi-783db32ec6441b878783bfa241777d3bfe6b35e2-br1.tar.gz
 sha256  b34df9d3e1b4e5d1ba70b1740ec74b69f1189b44efd0c96b898b074ef8db1c70  LICENSE
diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
index 9edc62e7ac..ee54a2bf4e 100644
--- a/package/flutter-pi/flutter-pi.mk
+++ b/package/flutter-pi/flutter-pi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PI_VERSION = 75e72fef8e8ce65ec72a002c00d9c6db4d1479d3
+FLUTTER_PI_VERSION = 783db32ec6441b878783bfa241777d3bfe6b35e2
 FLUTTER_PI_SITE = https://github.com/ardera/flutter-pi.git
 FLUTTER_PI_SITE_METHOD = git
 FLUTTER_PI_LICENSE = MIT
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
