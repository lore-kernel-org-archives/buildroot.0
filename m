Return-Path: <SRS0=6sxh=PL=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C7BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 07:12:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F16A60EBC
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 07:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F16A60EBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 997E1403FA;
	Sat, 23 Oct 2021 07:12:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_jG4JnvCqGZ; Sat, 23 Oct 2021 07:12:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 955CD403F7;
	Sat, 23 Oct 2021 07:12:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 013021BF349
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 07:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E33F181D16
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 07:12:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-RkCnHzlqx2 for <buildroot@lists.busybox.net>;
 Sat, 23 Oct 2021 07:12:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F4F481A29
 for <buildroot@busybox.net>; Sat, 23 Oct 2021 07:12:33 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u18so8431749wrg.5
 for <buildroot@busybox.net>; Sat, 23 Oct 2021 00:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tdnAdT8beA42EV2zhFvcOGyN/qsb4f/RHU5Y4F1aI3s=;
 b=omtJLHsW2uyOPG6CgvkC8KowHXCiNdedNqoqSEQIJw65LWGLzobts1JNE+d+JGwlPQ
 39Vklu3zovvk5hkAC0O9DBSre6GloSCE+v0uje0Gl03LDKOVAyos8oiR0tobWzUPuxcG
 kwbP7psk94PSw71XV+DBkue2OYuaYDiSxFs1PljfNqWgRNV6X15GTINAFrB6GfWris+o
 DiE98aNuujYDEigy6LK9IipG6FIiYS5PiQYsuMy1DTtpeJGg1ejrrk4cYaUTNboIa7Lr
 McgbbEfObCO3QriYzm9TpThndmnMnvB89wEcseCjSYnQHgEtjXprAVHqmFoX4Ui/Sa6W
 HgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tdnAdT8beA42EV2zhFvcOGyN/qsb4f/RHU5Y4F1aI3s=;
 b=g3tDVQGwJvdFCzvAZjz+xK4x4TjdM7uUupyx5M6Ctk5IcEks+u+JA4YQ+2mK2oThg9
 iI0B8iQuMcgDpwUZRUWV57awzJbXqOsKXZrPtA5cjDfDvVhAx2YGdQxz9RWMDdPisIGJ
 StW0142FXjSH0UcKacsKY48ntB76j10bAqjdjmb8R+/6TwsxQkBXzoGfyvBZn7F57MXH
 m1r+g70c245XCppMj6mexOs/hA+sT2z54e/ajX9IHVaTk1MDGjfxyKpXwMPLchm8bDig
 tBw6U7EFjAlWzwPAw5LKILeDBrPeC9Zj5tfbG+hwG1Bo0hNZd7kNfxCtQ8k+Xorj8i//
 8BaA==
X-Gm-Message-State: AOAM533ehf/knwIjEXdZ2FY8t0YcVo++xVv7xmrCNPUVMQv4d4f8Voe7
 6Dt9LXvUm1VfXg/VuspEvFMPrp31iJM=
X-Google-Smtp-Source: ABdhPJzMIJ98bC6gAiMJSAtshUQGiJtfMVfYn8YtvM1ACE6VwKoYHNgywHz4WG+RXzPY/RKxOHR0Fw==
X-Received: by 2002:adf:e292:: with SMTP id v18mr5529559wri.369.1634973151339; 
 Sat, 23 Oct 2021 00:12:31 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id o1sm1211223wru.91.2021.10.23.00.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 00:12:31 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 23 Oct 2021 09:11:58 +0200
Message-Id: <20211023071201.1016688-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] configs/stm32mp157*_dk*: use recommended
 layout
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/stm32mp157a_dk1_defconfig | 13 +++++++++++++
 configs/stm32mp157c_dk2_defconfig | 13 +++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index 86265d77f..0ecdf09c5 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -1,8 +1,15 @@
+# Architecture
 BR2_arm=y
 BR2_cortex_a7=y
+
+# Linux headers same as kernel, a 5.13 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
+
+# System configuration
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
+
+# Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
@@ -11,10 +18,14 @@ BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/li
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157a-dk1"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloaders
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
@@ -30,4 +41,6 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_STM32=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157a-dk1"
+
+# Additional tools
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 45205982d..a75c2329a 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -1,8 +1,15 @@
+# Architecture
 BR2_arm=y
 BR2_cortex_a7=y
+
+# Linux headers same as kernel, a 5.13 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
+
+# System configuration
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
+
+# Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
@@ -11,10 +18,14 @@ BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/li
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157c-dk2"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloaders
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
@@ -30,4 +41,6 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_STM32=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-dk2"
+
+# Additional tools
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
