Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A827AE9E311
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 14:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A6EE83503;
	Wed, 11 Feb 2026 14:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fk6gmfZEs9_6; Wed, 11 Feb 2026 14:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77206834BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770821874;
	bh=8oB8+nKI1h7IMzZSt1f6+5KEVyAp23DeQ5lI2H9z74g=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Uqo9geYjaQjhPHWA+0vQpIZ0n600X7c61WvSW4GLBR5dDGWYwG3W8tVVJubvNwXfh
	 rlmxeVcMcM4fL08gKzDb64CVX3avfDMYZPp5tUpZvLiyHqH2g3zIMIxK/TIGDeM1Vp
	 hFbWLo7fvbsyxWMu7o3C8tf4T5DWMhpbEJifTxHcgQ6HfCKIyryLcYzryCHGYB9n9Y
	 0dqlbdd5EHE3xHMYfL/RsJ1vO2krH6UK7/UWhnZXWTXSkHl12CU5LIWsJKiEste6fU
	 6xh9bCnlYaNk3xh4UrKaEHGv3Ky1nCnD78Anvoc+0jlp9sBQoiv89Yvh0SirTy88BP
	 AezQFcTahSgWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77206834BA;
	Wed, 11 Feb 2026 14:57:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DF4123D
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 14:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47A7940954
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 14:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FyfJrRERafIl for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 14:57:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4CE2940272
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CE2940272
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4CE2940272
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 14:57:52 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-483487335c2so27767115e9.2
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 06:57:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770821870; x=1771426670;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u7Tn3WdQpD9QCQ4E7i/c8AHGRS9I0zOEuIXN31UmQHk=;
 b=t4rdsZZLSM1nfWcoD9kfcv4mIVNjEKZUwOG94Fa08JVEFlI+cVJ2YqCFW4MEZqyXn9
 IMkedg2HQdSPojP9UbpPxRIu7bR1v691qB9JI9ed8XSihreNXq2GLo5bGrsSRnO+unC/
 l4nw5zAIinjmX8NmdaZZ0GYvSmopvAz88cB4aCoY77Zm89kZITXlL6GW/HKWLk7G1qaB
 IpLBTXQEJYZkxmX7ckEAHUT+I1PhWraTtsjiVCrchOb1VfFhMuXC6MBPnqz6nG9xnGSw
 RSbquoVU6RMng1DvMTjRRK5IHjy436HRez1v/VvFHfqMAsU69SQTLptGS5Nti1V0OhcI
 Nmpg==
X-Gm-Message-State: AOJu0YxKA7unAzFe/OcEDODMhr1WeR9L8+2VjzKfwIKR3G0+HheV6Fja
 ao8JnuNLYIN/tc2jMlID9cE6oVq8FRwRVcgBVlBdICK2sI4Z5RHP/LVdjGXHM2tL/WWSvxp5RWo
 VeXnL
X-Gm-Gg: AZuq6aLAOhomU+TdBBsuKjwGpeam3ESbPnalKDetb1WjbrcYKE2LPN85lkjrpFXcXJu
 fjpx6aMcFekwQw/Bhb3zmUs82qc6ljxBmUsrkKQ5RPLe3tS8BEKdLNej7hY2o8CLTk5hiMOvO3H
 anv7aTWdl09dzVfappJYPXrtLPPeSV3SgaUkA0mkJLW4YRcGQ/8SYSZeFYpNxhSRa11gCTQAI4N
 4HH78tVkTNN2QqcVqWbEg+b8Y0yuz/DbNcnuSc8JttHDi4vUUI00XyXgFX0fI3Kav9ApPXibwcu
 PhDK3bnknwi8kIZvtH+Jkxvgdakt7rAGVsxuVLp9mAqcoJE2Ival0eJ3xWefQa4bZ5lNIPzachI
 eCdSXcJjCnqd3chRjDhRI+yRBJ6OiPWMxLYvnRupQ/JDqa6/I25+e9o98ONJG2YKFrRUt8lmPex
 sDvqHe16nYVUVjeP/fsfw8qkbKzMczZiNBvJ5vm1kXgWAc1UjnmrNa5k2wXTUY3k6ePGHEXXKo4
 f4AFcG48GIL9w==
X-Received: by 2002:a05:600c:450f:b0:479:3a89:121d with SMTP id
 5b1f17b1804b1-4835d56aa5amr37715335e9.36.1770821870013; 
 Wed, 11 Feb 2026 06:57:50 -0800 (PST)
Received: from P-NTS-Evian
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4836131d484sm7794105e9.27.2026.02.11.06.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 06:57:49 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed, 11 Feb 2026 15:57:39 +0100
Message-ID: <20260211145739.2389857-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770821870; x=1771426670; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u7Tn3WdQpD9QCQ4E7i/c8AHGRS9I0zOEuIXN31UmQHk=;
 b=gl+BpMOm/gPnZHOiX3+RBylRXoZ0mjiCXCs08lo78pb9GCP9qpGfIEOgagneY3vV/i
 wRjpqwQ9nFJN1kuz13IFnHC5cSsdxuXEFKe/RsabGpk+qW6igPqoubjJE/+0X5XdalOM
 Eu6dl2h7CDAIpMPlgADDgiKfc7ecXBSgvMZo8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=gl+BpMOm
Subject: [Buildroot] [PATCH] configs/beagleboneai64_defconfig: bump Linux to
 6.12.70 and U-Boot to 2026.01
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit:
- updates the Kernel from LTS 6.6.30 to 6.12.70
- updates U-Boot from 2024.04 to 2026.01
- updates arm-trusted-firmware from v2.10 to v2.12 LTS
- switches to Bootlin external glibc stable toolchain

Note: Using the kernel 6.18.9, the SD card fail at boot:

  mmc1: SDHCI controller on 4fb0000.mmc [4fb0000.mmc] using ADMA 64-bit
  Waiting for root device /dev/mmcblk1p2...
  mmc1: error -110 whilst initialising SD card

So let's use stable kernel 6.12.y for the time being.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../beagleboneai64/patches/linux/linux.hash         |  2 +-
 .../patches/ti-k3-r5-loader/ti-k3-r5-loader.hash    |  2 +-
 .../beagleboneai64/patches/uboot/uboot.hash         |  2 +-
 configs/beagleboneai64_defconfig                    | 13 +++++++------
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/board/beagleboard/beagleboneai64/patches/linux/linux.hash b/board/beagleboard/beagleboneai64/patches/linux/linux.hash
index 4b20a009a7..0998778cff 100644
--- a/board/beagleboard/beagleboneai64/patches/linux/linux.hash
+++ b/board/beagleboard/beagleboneai64/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b66a5b863b0f8669448b74ca83bd641a856f164b29956e539bbcb5fdeeab9cc6  linux-6.6.30.tar.xz
+sha256  9b4ccec7d8ceff4824f149e476ec06e83c86546ae8af82582871647809a62ef0  linux-6.12.70.tar.xz
diff --git a/board/beagleboard/beagleboneai64/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/beagleboard/beagleboneai64/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
index 97a2b4eaf9..b6a925ea4e 100644
--- a/board/beagleboard/beagleboneai64/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ b/board/beagleboard/beagleboneai64/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/beagleboard/beagleboneai64/patches/uboot/uboot.hash b/board/beagleboard/beagleboneai64/patches/uboot/uboot.hash
index 97a2b4eaf9..b6a925ea4e 100644
--- a/board/beagleboard/beagleboneai64/patches/uboot/uboot.hash
+++ b/board/beagleboard/beagleboneai64/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/beagleboneai64_defconfig b/configs/beagleboneai64_defconfig
index 0429dd63e1..db5837fe36 100644
--- a/configs/beagleboneai64_defconfig
+++ b/configs/beagleboneai64_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/beagleboard/beagleboneai64/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -9,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beagleboneai64/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.70"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-j721e-beagleboneai64"
@@ -18,8 +20,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="generic"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
@@ -27,12 +28,12 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-j721e"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="j721e_beagleboneai64_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="j721e_beagleboneai64_a72"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
