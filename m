Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6113EE68964
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 09:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 215956081C;
	Thu, 31 Oct 2024 09:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swI8qX67cdKD; Thu, 31 Oct 2024 09:33:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1250C607DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1250C607DB;
	Thu, 31 Oct 2024 09:33:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EF275E4F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 09:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2EF840714
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 09:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQTrEKa6S5Ke for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 09:33:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 950324070A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 950324070A
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 950324070A
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 09:33:22 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso99249966b.1
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 02:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730367200; x=1730972000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jqW25wuxdbGPyKj6JkZxMY8M2h5zx6beJ7R0AEvrugE=;
 b=POCJYRcbB02njXY9TREJIagtY9sp7vKu0JsANtGn8fMgLRf9TJyh+HLyjZ82wQxI8q
 S23DygIixgt6RDnzgoSFiUxpJ5UsvggswV/23YBVk9zASlAyUOA1wbpiCtJlbZ3qfTib
 8FwZWAGG9LsWMDv8H2IYC2SfWMWX6321mg7RTU6lkfaD4nLWBaCn2co2yfSbJdnX7UD8
 jcQti4mTkzFu9ky3kbK93JoPAkqv9yuvSHBNsC+jz9PElXyXPfP+LzZnzckfBDOZ0v98
 Mc6LxIuHwJXJds8/0WtETecAwSY1uafZ9yNdDOuWZc3/d4lEYLszcTq4ws/FINNZhyb/
 bqQw==
X-Gm-Message-State: AOJu0YwDUW3QbDDq9K2Dy3I/G9FlBvSUfkp764Qz1fiKQGdqqcokFixN
 ZYEL73oH6CV+62ovC2DB5x/sCR0MmWpCgFVLPPVYvgUW5XjzY5aXlh+QpGAFf+ge/oPImYZpbnr
 S
X-Google-Smtp-Source: AGHT+IG6fL0mkeQKYZTMM7GFh5EolvamKKt+LE5OeU1BXsbpdZuRt3pZ9IEV6cq44dgqyT3EUtQAcg==
X-Received: by 2002:a17:906:fd42:b0:a9e:211f:7dc6 with SMTP id
 a640c23a62f3a-a9e211f7ebemr633136866b.8.1730367200246; 
 Thu, 31 Oct 2024 02:33:20 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.36])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e564c4e0asm45692466b.46.2024.10.31.02.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 02:33:19 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 10:33:11 +0100
Message-ID: <20241031093311.636608-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241031093311.636608-1-dario.binacchi@amarulasolutions.com>
References: <20241031093311.636608-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1730367200; x=1730972000;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jqW25wuxdbGPyKj6JkZxMY8M2h5zx6beJ7R0AEvrugE=;
 b=rRBXT41QyUA3voiweLdFvSIgDHGmJtQ5ORTBdKGy3R+JsTZMXGcrUOeB5eURFus+GH
 LTJmtuY/DKHRYFFkr2lyI7dqkjGrMvFCjVjg4/3e19KhLM+cvgiFCyX/o1hZkavG00EB
 HyWfSyncgnlpTz5+6ACf+7lZcEtlQZn/5jzs8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=rRBXT41Q
Subject: [Buildroot] [PATCH v4 2/2] configs/stm32mp157*_dk*: bump TF-A to
 2.11, Linux to 6.9.12 and U-Boot to 2024.10
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
Cc: Marleen Vos <marleen.vos@mind.be>, Sergey Matyukevich <geomatsi@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps Arm Trusted Firmware (TF-A) to version 2.11 the Linux
kernel to version 6.9.12 and U-Boot to version 2024.10.

Tested on STM32MP157C-DK2 Discovery Board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

No changes since v3

Changes v2 -> v3:
 - Update TF-A hash file.

Changes v1 -> v2:
 - Bump TF-A.
 
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
 .../common/stm32mp1xx/patches/linux/linux.hash             | 2 +-
 .../common/stm32mp1xx/patches/uboot/uboot.hash             | 2 +-
 configs/stm32mp157a_dk1_defconfig                          | 6 +++---
 configs/stm32mp157c_dk2_defconfig                          | 7 ++++---
 5 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 2bc5030cf2ff..8b77e1f1653a 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  72df0928138de111bf5e75fae47f88a4d1b4930ad52b7902e2b53e117be650c8  arm-trusted-firmware-v2.9-git4.tar.gz
+sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
index 95bd23c8d022..8cde9f620b0d 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f048267b7b88316c9ca708c68d15a9ae802dcfc943c3188c1273eb958c433281  linux-6.9.8.tar.xz
+sha256  5ae7cc4e0e2f6b9ba630f643985ba0522c7d5e5b9571ba478a3cb513edd4cf22  linux-6.9.12.tar.xz
diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
index fe9b4f53dc63..904fa56c02a3 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index c1ecbd22c198..1a851946b022 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.9.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.9.12"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
@@ -31,7 +31,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index c35d75853f06..89555244049f 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.9.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.9.12"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
@@ -31,10 +31,11 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
