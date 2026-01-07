Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5467D0D16C
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 19:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 400DE608AD;
	Wed,  7 Jan 2026 19:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6UUFynuPlNHI; Wed,  7 Jan 2026 19:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41B9B608C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767814881;
	bh=Xc1mdBNgN6KZvlsgSX3gc3JuEkqhB4ATHVlB2D+KuV8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g9adX1nCmnpnnH8OrWECItTQZt/3ha4mvco+LAo5Wbl4zebcQzxJDd2dV3d2Sv7UR
	 PCLHsJl/gvgnc5bfEt6xOInTK0IWLKUk/dgcbdCyPNNSIerpTYdtYietOmxxAMsf99
	 EEqAqejCRkuITB6ItQycS2trTe8VHzJ0KBsTvkF7Z8ERpavo4h0RKQAowJRcOxQ0EG
	 YhFOk6NbYeaCEAGvqmcec1WzcumxtAjARbfIKVn+1EHAV/HnCNfykCuZPb5/ioIves
	 v8GtJ3/xsQvmfbUHcnYvhEosXz2zen9GigFRIqq5G8JNtaA4j5K5tMEdGlmLaJE1mn
	 rrC83cjBETCYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41B9B608C8;
	Wed,  7 Jan 2026 19:41:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 131129ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 19:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED6B180CBC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 19:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 66cGAaY1y3Oq for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 19:41:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 23477809CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23477809CF
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23477809CF
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 19:41:16 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-64d1ef53cf3so3387203a12.0
 for <buildroot@buildroot.org>; Wed, 07 Jan 2026 11:41:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767814875; x=1768419675;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sAnZMMK0LNrdxvy5vOzyNl/k5HQ/yuX/zcs1lRam9aI=;
 b=Cn70zOwOs53TVnX4zojeAWAob4FQs4m8OisJa2lUNOOfCUcvdyWNvaUdoSyhwl+/H9
 a7jcxT6RVsykAwArlDvZZAplan1cLi2wFSbBxw7hyT/I0Sl/MCsUJB10l14JNNCezKJV
 msUu3Mjcw0gLNBxPycpsuut37WE5EO2Of6SX3IGmL1J2ruy0UnMMJduuqSU8ZZ3BpMSg
 ZvoW6XusC7oIjlfohU0J8s3u53Ofnv++RN6NSL9R5Vi+QW22k1udY92YeKVN1FVAh4SQ
 6CYNi4lG8ujew/SwOmpAkAslzKsmGV2MJgxeWizFHGPJu8eKTxmGL8L6MNyCWMn+GSqP
 Wybg==
X-Gm-Message-State: AOJu0Yzeb3REj2mDI5MufuEeiMGmG2Y9H1D5TGXKNbgWK02q/pMGxpXE
 CDQ+B/qHig+Rx7UCAmfQ3lmz3diUPtusQONnzZECWmM0ac2WeVbAK4bcdIW4tJbSJeLmNsOd4Rl
 EH1az
X-Gm-Gg: AY/fxX7qkmcCCvwazt71Wrz1HZ72JmaWVKWjt+rJOHGyWs494z4jjXU+59iBJj6K+vA
 ySl5viGuq6a/Gs2636BzLrpMosvYS453ptqt8qKmh7F8nFIjcyu8ZGasKPKRqBKNFTAhv2iRSfQ
 F3OGVurot/OZLYvJb1gKq1fnI/rrsvM9VwBSk4VyDgyeA5F2J/sBwj+QiKfbpm9zucu3fq5Jt/t
 LCyE3/kamp07kQTFeDQnzl5unTJnQ/bCkgu5WA4ZXce3gpQDNWMgXN0U5DKWGl3q3AuQiZDstjY
 zk8pgA5jhCR97Y7ZoDxF07qap8mZsufHHbe6JT4R0ym2ckkKp7CkE6bcBRSqSgOFFQlwsM3tFXI
 fD6Rrmhabxgv2OFyqGm4NbnHmb+ZsW5AEOGO3PLbVoUJzliP+LxKqhqrqUlzTl4EE/KAPCrHWGt
 6giVYfDfV8G1XQ632jRTQ9KgS0eH9rEqvTeY1a1AOLGt92+pOcr+8qyEJb/03M/oqiQKu9dn5T4
 2LAPLC/EAtCGx21mozJyq82BLRUGBXr2Fc=
X-Google-Smtp-Source: AGHT+IGAVQsCvBelXYmrtZmTfglcA1q1xSUmjSmBW0+F29IUdzSo39vk4GtSpzQPtZEILrR+RIWYmQ==
X-Received: by 2002:a17:907:7242:b0:b79:c233:c89d with SMTP id
 a640c23a62f3a-b84453adc4amr387422066b.57.1767814874883; 
 Wed, 07 Jan 2026 11:41:14 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.122])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a4d1c61sm586774466b.35.2026.01.07.11.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 11:41:14 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed,  7 Jan 2026 20:41:09 +0100
Message-ID: <20260107194109.1842074-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1767814875; x=1768419675;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sAnZMMK0LNrdxvy5vOzyNl/k5HQ/yuX/zcs1lRam9aI=;
 b=kwGaBkfLgV+8SCVPJ7AdlhjbqDUq7t+mkKh5vXdQvJy8OIWdd2NhEgIxp2vygU2oIZ
 vnfYV9T8du9hc1xAsPgejAygQUvrrcunEsoTCoGGMhj2lr6d4n3l3kZEKtUgfMLBV6xD
 YeuTQ0PbkRMWiSKadhReOdC8ad02MT1/NQPf0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=kwGaBkfL
Subject: [Buildroot] [PATCH 1/1] configs/stm32mp1*_dk*: bump Linux to
 6.12.63 and U-Boot to 2026.01
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

The patch bumps the Linux kernel to version 6.12.63 and U-Boot to
version 2026.01 for

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
index 4ac46f027b20..9339a304ab70 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  663507accae673afcf4e210b4ae8d4352e61d926202e5da3f04bf71ca1d2c0b5  linux-6.12.53.tar.xz
+sha256  9502c5ffe4b894383c97abfccf74430a84732f04ee476b9c0d87635b29df7db3  linux-6.12.63.tar.xz
diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
index 98a5c53aaf97..b6a925ea4e89 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/stm32mp135f_dk_defconfig b/configs/stm32mp135f_dk_defconfig
index 94c6dad1f041..b7a58ac0e5ee 100644
--- a/configs/stm32mp135f_dk_defconfig
+++ b/configs/stm32mp135f_dk_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp135f-dk/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.53"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.63"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp135f-dk/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -42,7 +42,7 @@ BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="135F_DK"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp13"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index 52338bba0bf1..e2139b167c64 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.53"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.63"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -32,7 +32,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 34fdec855872..77bb5c66f4fc 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.53"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.63"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -32,7 +32,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
