Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E28CC47077
	for <buildroot@archiver.kernel.org>; Tue, 16 Jan 2024 04:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A135C803C0;
	Tue, 16 Jan 2024 04:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A135C803C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9fatkvlnHCKP; Tue, 16 Jan 2024 04:33:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF1A380B2A;
	Tue, 16 Jan 2024 04:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF1A380B2A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB16E1BF330
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 04:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F70D60758
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 04:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F70D60758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6hMotiWsMSIz for <buildroot@lists.busybox.net>;
 Tue, 16 Jan 2024 04:33:23 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3E71605C9
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 04:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3E71605C9
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d3e8a51e6bso75235035ad.3
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 20:33:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705379602; x=1705984402;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TsNVL9Rdgi9cPY32W/2Xw6VOYznUS6muCY1+ZX1K0oY=;
 b=T573spHeAtLBt/I4NhSI0GQLSE6kN7P2bmv4hzvSt/uWKZvX57gdrP9de4NAGN/Xly
 7RwmLx7wjEZGvicDUX2Z1uDIMG83GrmCpxWBa2vEZaL6S9IaLUIWBuBRWP65+5LLOpVa
 ujW70SjLjo7h35AFyksIFLtfOiFGO4YJtBgVDOxqtXg6Phq+CbbXTd6kJQPu9pNSQ8yn
 9NRyUS8VgfndccG1GdqB25In5vo9LeEKUTjCkK+//tKgnprJwRNlKWGCnmB+w7QWUpId
 eDHslcCvD3YLJC49OwptJXl04pzDO+qxOZTEyCSqNGzmx8S+CK4ZnbSqz4GcVpzwbBUt
 4/Og==
X-Gm-Message-State: AOJu0YzfBWPVfzKcLN+9Ug/aueCImalbLuZYQqiZlRYtA/xmO35SROEj
 tJZL3ALpTk0el2Ay5Fhi9CHB+/Bya6M=
X-Google-Smtp-Source: AGHT+IEcoqvtY8dSeDbRIRTNwepz/umHS2bsAlnN5RLEX4vnm4KwUc8rw3wrrvAW5ix0/Z5YPU0Q9A==
X-Received: by 2002:a17:902:6e01:b0:1d4:b4a9:5b58 with SMTP id
 u1-20020a1709026e0100b001d4b4a95b58mr6582017plk.100.1705379602147; 
 Mon, 15 Jan 2024 20:33:22 -0800 (PST)
Received: from blastoff3.cg.shawcable.net
 ([2604:3d09:c74:2000:650f:ff39:ace5:9af2])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a1709026b0700b001d5383ae01csm8284616plk.121.2024.01.15.20.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 20:33:21 -0800 (PST)
From: Peter Thompson <peter.macleod.thompson@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 21:33:11 -0700
Message-Id: <20240116043311.18450-1-peter.macleod.thompson@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705379602; x=1705984402; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TsNVL9Rdgi9cPY32W/2Xw6VOYznUS6muCY1+ZX1K0oY=;
 b=HVsfEQB1pDSfSIhrxFKHpVoxk1cbJJO8NZ+bTfG6GF1Jn9D5blcuFPlBLJhXJfq/Hn
 JvqpNisFdKtbO3GmcbNpZVSo4jt2gBKgZn47g1rXP5vya+XRsu5l0eF6W3OlbViC8RhZ
 d9P8XWpKizVrwASvWXLxsci8v+Vl83jogjiQYxHms5G9F+H8oUwsB4Q8KGucZ22KaC+J
 gJd6+Bs/WMSQqtXaUtcGoiK3lnOXfFNq53SH6qFJVvmV5KiiBDmiPFtkDVhQT0B+R1Tr
 NTGynng2sgs+CdizCmVnuZ+62sdbJZnS0zBjgb3vpsECUnwbuo+MnJLr/jap4PfBSkos
 66WQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HVsfEQB1
Subject: [Buildroot] [PATCH 1/1] package/sdl2_image: bump version to 2.8.2
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
Cc: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>

Signed-off-by: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
---
 package/sdl2_image/sdl2_image.hash | 4 ++--
 package/sdl2_image/sdl2_image.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_image/sdl2_image.hash b/package/sdl2_image/sdl2_image.hash
index 0c4f11bc82..53a887c6f9 100644
--- a/package/sdl2_image/sdl2_image.hash
+++ b/package/sdl2_image/sdl2_image.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e4cab9a58c347a490c46723c17553b4e12233cd821d3b993a8475a50497f5a3e  SDL2_image-2.8.1.tar.gz
-sha256  1852c8549e3d154687197d46abababd3e8faae035f19991b2ca850fa3a43ad57  LICENSE.txt
+sha256  8f486bbfbcf8464dd58c9e5d93394ab0255ce68b51c5a966a918244820a76ddc  SDL2_image-2.8.2.tar.gz
+sha256  a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139  LICENSE.txt
diff --git a/package/sdl2_image/sdl2_image.mk b/package/sdl2_image/sdl2_image.mk
index ca9d983892..40b9e3c915 100644
--- a/package/sdl2_image/sdl2_image.mk
+++ b/package/sdl2_image/sdl2_image.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_IMAGE_VERSION = 2.8.1
+SDL2_IMAGE_VERSION = 2.8.2
 SDL2_IMAGE_SOURCE = SDL2_image-$(SDL2_IMAGE_VERSION).tar.gz
 SDL2_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
 SDL2_IMAGE_INSTALL_STAGING = YES
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
