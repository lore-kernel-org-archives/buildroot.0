Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CB6C83F1B
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 13:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94D4060D50;
	Wed, 16 Jul 2025 13:00:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pUbxfO95Dtbs; Wed, 16 Jul 2025 13:00:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABBFC60E52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABBFC60E52;
	Wed, 16 Jul 2025 13:00:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 701EE11AA
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 13:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5658083D85
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 13:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EAmp3O4IdHQg for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 13:00:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F01A183D71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F01A183D71
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F01A183D71
 for <buildroot@busybox.net>; Wed, 16 Jul 2025 13:00:48 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45619d70c72so7951425e9.0
 for <buildroot@busybox.net>; Wed, 16 Jul 2025 06:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752670847; x=1753275647;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bPbHumbci5z1Nj6zbXC569jcmjMKhnABbrDpvFX0g0w=;
 b=HkHFtA1CnB87by8RkdtHWeqpED3yiGEjXurtbpIQo+XOkZ/6GSw9Mf0sB0XYuJQO0D
 ErS6gNltDiRDTzuF4IeYdhw5E5fmZT1xSfQRgjGvWDV+m56W/Nq69mdpBM73l1e0Kvj2
 1C0aTRJjz7nCO4r0C++UBfxsSTWmXFTwmIX10a9d+pwj7+isUOAPr14Qp9mxh9gKjuCp
 Dw3g79Sd2PZPiPn3kxNRSf0R894X/QbVBJ+7Y4GZ4191MOL16ID1PnvudlAm0RyoNbeC
 1RadDL0vxyMz7l0/Vd4DkKFd3EU2lEIWavw5Pz765qm9mwPYKlWsSrYNxJe1gNhqAaGf
 Tqjg==
X-Gm-Message-State: AOJu0YzDz4+xfM8xXDrUNjhnWN2WlsOehMCSv7xyVKBQlJCpPLa369FH
 bL9g0HQYpqNdVLuXFKfcIXE+yF1k+0KcK3R6ANEP6I/3DdGd7HodPo4v7bjkWi4FKSDU6TNW7lg
 6pXbpyg==
X-Gm-Gg: ASbGncs8omD9JQHMJCDHsQMJCUX2NB9WiMZHh2NwD8ZELK2/OStdDx2ayVCMWhUzCrx
 wVNrWJRPGFfLpgAGgGI2Q/NiYRUIBHzmkm6aE44DbyXueJ+qOUgRUqJsdzmsl2XCPpENaSMJE2L
 eSjRqwzvpNcEqMuM2DFP6S6UDpL3zTIutUzK8NiTzqLqSiI2FFwwK1jyUNvrMzGmTh1v9tunOzR
 gjNeq/f9w/Dye0QiVdCudskbiOd6dzyRmwSthl4vFf+5KpsIkr7aLDPe5760eUuRONv1fl4C6+b
 lKGBSW9sNgjwVj+ziWlbcF4/o2qqe3jHD+KE8sUJ7nn/6Z3b5GWd016tcZs8InJO5rdXEA1NhVV
 B6RSMrWrug52HomDeQMfdfQN6tu5POvzaBV3iqnRV8qSDTo2LKKYQ86pN
X-Google-Smtp-Source: AGHT+IFPWGU9fEEvobBhacAREdnPQBhQIsdmIiflwH9k/6xA6j1H2HDl+6IVr/mF+N0Hs6uKhIOrTg==
X-Received: by 2002:a05:600c:1e1e:b0:456:1d06:f37d with SMTP id
 5b1f17b1804b1-45625e8a778mr66721415e9.16.1752670846176; 
 Wed, 16 Jul 2025 06:00:46 -0700 (PDT)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc2147sm17931699f8f.32.2025.07.16.06.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 06:00:45 -0700 (PDT)
To: buildroot@busybox.net
Date: Wed, 16 Jul 2025 14:30:28 +0200
Message-ID: <20250716123029.1782874-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1752670847; x=1753275647; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bPbHumbci5z1Nj6zbXC569jcmjMKhnABbrDpvFX0g0w=;
 b=pbRyxyMEKZdWg8IAfz3sTpa6wBu6gvTIQtRd2cY7g9lCxCgLH3lQkeKmfji6oGOs/H
 u/tqwd4FE5goYk96OOly1+wjte7vrdoZnB8Jz+03fbeQPXnKDCJcmyO7w4wbn0dYGboa
 tg6hlsAzqdlZOkKz/hRoLmQMm7YQ0qIOACGYyrtGX53U4Upumsu5bFI+3zB4glMhBn5t
 +v8dKtbg5RfCzKanp64zgsivIHPxTIjlXHUnoyRtmVwoTHaZ44Kmx8QrGjhYu/oYYJdG
 zcc2q+UGqp4k+eAQ+ZIWtjCmwACRlRHDhFVF0k8SHyriFaDViEXR3+wyYnJ+e3bcAXx7
 gpnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=pbRyxyME
Subject: [Buildroot] [PATCH] configs/olimex_a20_olinuxino_lime*: bump Linux
 and U-Boot
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 board/olimex/a20_olinuxino/patches/linux/linux.hash | 2 +-
 board/olimex/a20_olinuxino/patches/uboot/uboot.hash | 2 +-
 configs/olimex_a20_olinuxino_lime2_defconfig        | 4 ++--
 configs/olimex_a20_olinuxino_lime_defconfig         | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/olimex/a20_olinuxino/patches/linux/linux.hash b/board/olimex/a20_olinuxino/patches/linux/linux.hash
index 023d24499..f8829b0ff 100644
--- a/board/olimex/a20_olinuxino/patches/linux/linux.hash
+++ b/board/olimex/a20_olinuxino/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  49e3ad7423e40735faada0cd39665c071d47efd84ec3548acf119c9704f13e68  linux-6.6.86.tar.xz
+sha256  9ee45843d43adb2e2ac5f6a8cb10a334e39e3e3384af8a0ce383a37f78221bdd  linux-6.6.96.tar.xz
diff --git a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
index ef267a2cb..30246a7cd 100644
--- a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
+++ b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 9d22683ab..161b03000 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.86"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.96"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index b3a5fdf4e..066224742 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.86"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.96"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
