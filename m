Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801FBD767E9
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 17:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E925E408A6;
	Thu, 31 Oct 2024 17:15:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GHxnxnySuKdJ; Thu, 31 Oct 2024 17:15:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE05A408AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE05A408AA;
	Thu, 31 Oct 2024 17:15:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB50A5E4F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 17:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9F55817BD
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 17:15:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 34l8U84DEwXU for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 17:15:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AFF6980DBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFF6980DBE
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFF6980DBE
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 17:15:43 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c9150f9ed4so1621189a12.0
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 10:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730394941; x=1730999741;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jjKMh/jkLe6N1c/vF5Xk5b0/c08f0zK+0K9U4Zr8LI8=;
 b=DEQGcq2xOUR8nB0GCiBB/7UEj0pLHyjwHUhjmQGIOv9ryGlMnvCn5FmWHmfhmOF5I2
 xG9GmAuDR4LFlV/BMhkNbTvjZNMZbBxqqVUo75LZp44kSnZRQm0S02cORQ7AliCq0oI3
 cFlNPoLjRSF6U4vBgCrc8VK4H/FBmFNrhLHmQN4LCUOmrnvDurMOVBBRYmKdHwv98tT5
 l8Rid/7wmEdGtFVUa7n8H2ox9B1jJ/e21pnrdoRllMzILmN4jB+FYSyC7YH3QJfJggCS
 ccET1IY3Bc3ENDq2MlFoE55qP9Cgl1CVfnbiNfhKkwJIq/tlcYvi1kuP8qlnTtjp+aFr
 tKTw==
X-Gm-Message-State: AOJu0Yyinatb7KWcsjeWtjPRiu9x+wf16vjFJluUYDKej+kU8W3A9FwI
 +5PKb1xomc21pfnUNyduzHUXFB22Z/wHJI5kqnLleXjHQTHxSHT8RLm3wiZgsBOUOgify7+MySE
 O
X-Google-Smtp-Source: AGHT+IEXF4pvRA9j2nWjpOwcQXo2b10hNA71GoFX/e8L4rrF8X6Hwzm0ZB80uqVGW8RVyOOUkZVBKw==
X-Received: by 2002:a05:6402:270b:b0:5c9:5dff:c059 with SMTP id
 4fb4d7f45d1cf-5cbbfa7ebb8mr15911600a12.33.1730394941444; 
 Thu, 31 Oct 2024 10:15:41 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.36])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ceac7c8d35sm748882a12.66.2024.10.31.10.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 10:15:40 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 18:15:36 +0100
Message-ID: <20241031171536.575419-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1730394941; x=1730999741;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jjKMh/jkLe6N1c/vF5Xk5b0/c08f0zK+0K9U4Zr8LI8=;
 b=biMTiBNHqCwqkgLe90vxrf3NwuxeAoCdMGiM0ihTuNHS53dT9Pb0V0PUrUkwe1W5HE
 cJUxrNznYZl0DqVcuKuJCSOm1rTHnzFka65pGNKNVI4Vs/wVJ7fQDARXUyERwFc/BqV/
 47ylMxVqmyPQKOWB/Y7LEm5M86aww+v/TgALk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=biMTiBNH
Subject: [Buildroot] [PATCH 1/1] configs/beaglebone: bump U-Boot to 2024.10
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps U-Boot to version 2024.10. The new version has added EFI
Capsule support, which depends on GnuTLS, thus requiring the activation of
BR2_TARGET_UBOOT_NEEDS_GNUTLS.

Tested on beaglebone black.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/beagleboard/beaglebone/patches/uboot/uboot.hash | 2 +-
 configs/beaglebone_defconfig                          | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/beagleboard/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
index fe9b4f53dc63..904fa56c02a3 100644
--- a/board/beagleboard/beaglebone/patches/uboot/uboot.hash
+++ b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 8253a8513ee3..cad32e90b1ac 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -24,10 +24,11 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
