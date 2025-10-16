Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82726CCD183
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 17:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B27140510;
	Thu, 16 Oct 2025 17:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bsSXU4KA6v6v; Thu, 16 Oct 2025 17:35:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FE8D40511
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FE8D40511;
	Thu, 16 Oct 2025 17:35:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BE79968
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 17:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CB8440510
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 17:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8bYmOo6ijwe1 for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 17:35:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E90B840511
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E90B840511
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E90B840511
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 17:35:52 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e33b260b9so11711695e9.2
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 10:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760636150; x=1761240950;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9JDPCdEa0MPccS+kSwRg6zFCM/sgiyOEaiS6aUKafh0=;
 b=sD/rIJT5wS29yKUkr16LsqTQd491Gh/3BYmOXEvXLjTDqg3fR7+KhHvBqyO9VgMXWj
 augCVsVxhdKqSS+uwy+inFGcgNi0lXqMq8FrXkYmK97ZPNvJDn73PctxLqTM5GTMGm+D
 FEpJ46aRQ+jJ3VpgIvPoxifZeOXwuFEpcg4mou+r4ceF8HFvVZkfIb3mFtzTRn6G7OnL
 Ab/J41MzEq+NE6You19g9pyUrLMTZhmfKnphctwtseFimWXIaWT04Lfov7Y9EFwYKbnw
 ukPf17sbVtwZGOuXIHNMdb0F9qy0YoGDryfceyUB1OXV/DqcgMN3hkbp5ZopKCy1K2dM
 ukzg==
X-Gm-Message-State: AOJu0YymqwbdpdE6OZuk3OTGcyQUZSfHLaijz5EB5U6/4879JvNnJNwC
 0R2c1tPuXjK2iGwx1mgkPEF89D+vJOoh5JtTFIMJyVscTHIgiwjsthGFC2olZc6amPGnAMlt7pg
 rD71w3P8=
X-Gm-Gg: ASbGncs1sb9w72A58k0I8ILi+AAtZS+pCmJbgBi96LfCHzGQsYA9qhMe5aptSsVUt68
 A/fVaS8yslRB+Mzbg0u4y8dOC9UI3MhiWJ2a8T7ZB3qahcmlbs5LWqox9E7abnmTuOcT7Ef5Xwg
 MAmvzlBpRwhbBxxF5Nt2m0i8l/Ohtl3HCHEDiXgsxxhEinL6FR3oOpJ9qlOvCQ/VULoeAPjq0yu
 o1zvhuwfbaXROWCFT4gpbLXI/hqScebiEI5mcq7twJKWX5UbAmcuF4BKOSBdf3whi4rAvEyTeRX
 N52kCGG0rdDmuulZpNqQPIUMaQ7fNGUmoJmQDpo5c2niU4HQpAIBhnerABIdomT/JdkSDYEkV8Q
 4pJoAy1K2R0lZUQ04fumQLRdVZaFROnSn8yrJgHPTop1N0x0nNK59ykM4+kOn5CsRSofyyPRo+h
 LYW8/BniTPRvMnF6akODRomj2NiJIGWgIwGS8sPHHWMF/ydEshsw==
X-Google-Smtp-Source: AGHT+IH5ATvhhSIku8tbyRYRZF4soQOfgcB+tsouUqwiQFfclOeN+5Z28XAXByZ3lfQA09kYQbLD8w==
X-Received: by 2002:a05:600c:4fd4:b0:46e:37fe:f0e6 with SMTP id
 5b1f17b1804b1-4711791391emr6529335e9.30.1760636150387; 
 Thu, 16 Oct 2025 10:35:50 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.252])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710f29da7fsm24646575e9.9.2025.10.16.10.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 10:35:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 16 Oct 2025 19:35:46 +0200
Message-ID: <20251016173546.164111-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760636150; x=1761240950;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9JDPCdEa0MPccS+kSwRg6zFCM/sgiyOEaiS6aUKafh0=;
 b=LSCrJl1LenyrdcPnxtmgA5owi+/IbsEXxcZ8VVBzRIduVC76iuPMFWB87ZL0MjwbhW
 L2vX+CYBudZa2N5kBA6R8g28T5LdiVfsxqtYEttGJTO34kEEsPr8p9ycPJvxULjmno2j
 Ii/SrOIryKem3Qc5xt4tdLo0Qvzmln4a26nmY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=LSCrJl1L
Subject: [Buildroot] [PATCH 1/1] configs/stm32mp1*_dk*: bump Linux to
 6.12.53 and U-Boot to 2025.10
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

The patch bumps the Linux kernel to version 6.12.53 and U-Boot to
version 2025.10 for

- stm32mp135f_dk_defconfig
- stm32mp157a_dk1_defconfig
- stm32mp157c_dk2_defconfig

Tested on STM32MP157C-DK2 Discovery Board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../common/stm32mp1xx/patches/linux/linux.hash                | 2 +-
 .../common/stm32mp1xx/patches/uboot/uboot.hash                | 2 +-
 configs/stm32mp135f_dk_defconfig                              | 4 ++--
 configs/stm32mp157a_dk1_defconfig                             | 4 ++--
 configs/stm32mp157c_dk2_defconfig                             | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
index 6c7685ad4d07..4ac46f027b20 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e54f01ba8c  linux-6.12.36.tar.xz
+sha256  663507accae673afcf4e210b4ae8d4352e61d926202e5da3f04bf71ca1d2c0b5  linux-6.12.53.tar.xz
diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
index 440526977bd9..98a5c53aaf97 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
+sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
diff --git a/configs/stm32mp135f_dk_defconfig b/configs/stm32mp135f_dk_defconfig
index 53fa594a4735..94c6dad1f041 100644
--- a/configs/stm32mp135f_dk_defconfig
+++ b/configs/stm32mp135f_dk_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp135f-dk/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.53"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp135f-dk/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -42,7 +42,7 @@ BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="135F_DK"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp13"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index 50baadfdc90f..52338bba0bf1 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.53"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -32,7 +32,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 3b6625d48d28..34fdec855872 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.53"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -32,7 +32,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
