Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B81CEFC56
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 20:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F4130605AA;
	Tue,  8 Oct 2024 20:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ERx79Q9om9I2; Tue,  8 Oct 2024 20:35:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E988D605D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E988D605D5;
	Tue,  8 Oct 2024 20:35:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C07031BF31C
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AED4D40065
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a6feXfPazukD for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 20:35:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8B8C14034B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B8C14034B
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B8C14034B
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 20:35:18 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42ca6ba750eso1197315e9.0
 for <buildroot@buildroot.org>; Tue, 08 Oct 2024 13:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728419716; x=1729024516;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ovwuhyg20LIdi4iwiEIu5CwobLQt5y9gJUGjhaEMgZ0=;
 b=O9kXPtGTVQHWOxDz7JpG6gXVx15X4UIz/zjdZ3jMAUC5la7XpHIxNCZkfKT4ox9i8k
 KC4BFlCWwqFi9VzuLU2TNSnd2x9Lh9ngWeCUCsFYhGmGm8f3Kw1wNpIdvFp6gtc5LFa/
 E38cjd/D7d/SHYUtOV8oIcOqQuW4NpOWowLXN9JhLu7GatUI5WBr0XMM7ey3HIjn6NB1
 rYnOTF93jmH7wtlWuZCMrOApWanuWjSbPcCzDwpfbqJhk42T+HZ2BpQPDloojvcKyoTd
 7qCVlFksU7I3makKYXkKoOCdM/Kqa9D8w1P+QAje06aPuEwq/eLEnMjpeO0Fow+YiVMQ
 gSpQ==
X-Gm-Message-State: AOJu0YyX7vQKCVG0PC051rj3v9C4EgwdwvVJNax1ua93aOa746cmni6n
 d/yq/sOrujAqUFUHZfQ9J0xrJQB9FcUN4xJBGrFBMxsY22uvW+0d18fn9btA9YKkeZvWKptvFO5
 IWcc=
X-Google-Smtp-Source: AGHT+IFP2/8A35S+Wm1l9ur0dpRdCX2/Ri/fwkhMoeMRAzH+wOaVzG9SXMLWrniF42cxK4Ceg1awXg==
X-Received: by 2002:a05:600c:3b1f:b0:42c:ae1d:ea4b with SMTP id
 5b1f17b1804b1-42f94c0c920mr28654535e9.13.1728419716029; 
 Tue, 08 Oct 2024 13:35:16 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.41.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-430ccf1f78csm5715e9.6.2024.10.08.13.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 13:35:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  8 Oct 2024 22:35:12 +0200
Message-ID: <20241008203512.3835694-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728419716; x=1729024516;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ovwuhyg20LIdi4iwiEIu5CwobLQt5y9gJUGjhaEMgZ0=;
 b=myZkNMAybS0rhrUwpYBvn1EydvTrA42EbDyitWcrC6+l3i5VE3dh2NnolKx9reoZd2
 VKTjuHzfpx3tqDQEuDDaDsVH9sIKshOTy3sF+EDAf1b47cRHLE719PevcHlRFzAZ5Ur2
 HOktAk4waSjJlypJXx9f5slWpYbxvkuGwaAq8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=myZkNMAy
Subject: [Buildroot] [PATCH 1/1] configs/stm32f769_disco_sd: bump Linux to
 5.15.167 and U-Boot to 2024.10
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 5.15.167 and U-Boot to
version 2024.10.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f769-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f769-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f769_disco_sd_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
index d8e8263e9eff..b241c795baac 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  91bfc0ea152ce7b102a0b79d35a7c92843874ebf085c99d2ba8b4d85e62b1a7c  linux-5.15.162.tar.xz
+sha256  b1751f18ece3df08d502dd87a9ab1a317dc0f9486355bf8ee62ba6af0b35da30  linux-5.15.167.tar.xz
diff --git a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
index fe9b4f53dc63..904fa56c02a3 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index 386a5d68e82a..ef97714e4d8b 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f769-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.162"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.167"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xc0000000.config board/stmicroelectronics/stm32f769-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -23,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f769-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
