Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0B7CEF17E
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 20:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B1306063A;
	Tue,  8 Oct 2024 20:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9KvcaqqQ4pV; Tue,  8 Oct 2024 20:41:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4157360658
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4157360658;
	Tue,  8 Oct 2024 20:41:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A29E1BF31C
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0744D405CC
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I78IWkGB8SAe for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 20:41:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E601A405BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E601A405BF
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E601A405BF
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 20:41:53 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-37d325beee2so530890f8f.2
 for <buildroot@buildroot.org>; Tue, 08 Oct 2024 13:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728420111; x=1729024911;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VJYKP6/w9NpR181i338BJhpeIsGKORvBU1jF3BlpVYs=;
 b=u9JJhAARBGfYjFyEFDdYjbmXyqkT1Vgd8XQtZjwzfdAeNLybGB0znlEwFNycfoyvsN
 kiDy73SmIrxGERTr/lHFCPBjTDUWE2KqgGhvazirS+PUPICmU/Sw+kBbIcDxiR081ZNn
 C6JMnPCIjqwAwfSQ8RH9ExIh8s9T+S8Ep6dMWfug8mNp/b+sBrl8yVjHY60bm0U46HCh
 1T/yxfuhPlZw50yELNnu4LPOJmn1YtM28TDmizI8Mdd19RDkVGj9+k528rG//ViQAWwE
 MofLmg8+DEZCgfOQdylO0sx4HXs7ojPvgiFPBqALLfpZZzS/I2YB1xx3TcUfLd67UM0w
 d3zg==
X-Gm-Message-State: AOJu0Ywar4p+smSAwbhNI0CzJoMI0et3m/cyNlZmeQm2jEKsCaaItA/n
 q5k+Zj0P6sVavSGtkuiL5wmqNhf7rhECwWcYawMjY5hqW+QguQie8cz75a19Lib6lfFLkkkkTIm
 E1g0=
X-Google-Smtp-Source: AGHT+IF5xI1xGChwMYmhnJL/ov/CFKJDL6K61zichK7x8lIG3JHBgr+PXL1RjTlBXhysIgTJ0Y4S2A==
X-Received: by 2002:adf:f3c7:0:b0:37c:d299:b5f0 with SMTP id
 ffacd0b85a97d-37d3ab44f04mr49647f8f.59.1728420111363; 
 Tue, 08 Oct 2024 13:41:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.41.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d31165724sm2015570f8f.63.2024.10.08.13.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 13:41:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  8 Oct 2024 22:41:44 +0200
Message-ID: <20241008204145.3837269-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728420111; x=1729024911;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VJYKP6/w9NpR181i338BJhpeIsGKORvBU1jF3BlpVYs=;
 b=is8CftUWwP4W7XhKbHrzb/QRI2LJ0bvENQLyqr0h452MaqTRMT5CHyyKDj8er3pTaX
 qi9W7ZEh3CZTOhkUrJhdUkfo2SY+BKNY3UhObHtQw3/mRmkyMp3F6Q7VMwX0RbVU6C5R
 6x1eEqOct5vyc8PvstZY5rBg6oH4+Ps5AuWvc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=is8CftUW
Subject: [Buildroot] [PATCH 1/2] configs/stm32f469_disco_{sd,
 xip}: bump Linux to 5.15.167
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 5.15.167.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stmicroelectronics/stm32f469-disco/patches/linux/linux.hash | 2 +-
 configs/stm32f469_disco_sd_defconfig                            | 2 +-
 configs/stm32f469_disco_xip_defconfig                           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
index d8e8263e9eff..b241c795baac 100644
--- a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  91bfc0ea152ce7b102a0b79d35a7c92843874ebf085c99d2ba8b4d85e62b1a7c  linux-5.15.162.tar.xz
+sha256  b1751f18ece3df08d502dd87a9ab1a317dc0f9486355bf8ee62ba6af0b35da30  linux-5.15.167.tar.xz
diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index 97dbce5d46c1..7b853ac143a1 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f469-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.162"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.167"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index 5a9d3e8afc77..7c79b10e1fee 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -8,7 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.162"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.167"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux-xip.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
