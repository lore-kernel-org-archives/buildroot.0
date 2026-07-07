Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339F2C43458
	for <buildroot@archiver.kernel.org>; Tue,  7 Jul 2026 04:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9237406D5;
	Tue,  7 Jul 2026 04:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CX1E_RGLDlGy; Tue,  7 Jul 2026 04:09:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E72F4406FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783397344;
	bh=WFUK9ALkSD9+jku6gnqbLwonqtEPA2E3sCep7OLBl1M=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pFF2wYwjzaX5q4E+cjJfjAcoNCF+cCLtGq3kUgyIljJWI5DMTXoWaGQhcx3sBQ27g
	 0JTxdHkeYzhqUkjCnFb+fvSnn7hCUj1naVE7wv2IZAf4ST/rzCUnYQDQxyESpHSqiH
	 pfTGYd5UDaAAsWnWakkUpSjLNRFMq5hxo+8Vs+oi643iAPe4e7a1uSsRMxzh4MTsh4
	 aI+wYp0n4SUBP9H79CfB4rYCFijUeL6hAc6Axk6u/BRc6NwS7CujDwkf02GQnhjCur
	 JlPgjKuddgz2hWDXBFrau6cYdiL2Fm59o0nZIzbyUqg58zXK+9cM11EAyXfKq6NoMz
	 720pXy1/Uvrow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E72F4406FC;
	Tue,  7 Jul 2026 04:09:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 06358315
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E154940190
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z1ulL74J5EN6 for <buildroot@buildroot.org>;
 Tue,  7 Jul 2026 04:09:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F0C8E4018F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0C8E4018F
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0C8E4018F
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:09:01 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-c99eaa1f020so3826095a12.2
 for <buildroot@buildroot.org>; Mon, 06 Jul 2026 21:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783397341; x=1784002141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KU0qHMR77x6xRuemiXtNPhwQwRFAJ6ZE9TO9j+MbWKE=;
 b=ZlyLvN/h3aYw9hh95yaffYxwSiWfXNY8foBucTIHPyIkvRRLqkjj6clMqzdQVVRvD+
 qsglhp/TOXl9EtjK4tpuPuHsVhzgYch7ViCU/ljLKWtL/rM2uUfZVvF2Bubbz6RiHVIG
 3+6bFfokfF0z3TjanmPDB7g7GwXDHAxm2d2yYU7wbcX2shoU7ulxGvulOGcfGEpZy4II
 EDPsA7/TdM+1joHUBkdgaRzjvEwNpZ8ucSeKvZW5vsIgG5Q90tA/9zwfgeCugQhQ4Ew0
 RLBnpEDFN3VPpq6Cg9lrl00ztB+8/CsEaJduf040752vnSDlZa2QqR23q8LzOh3+v0cZ
 KdZQ==
X-Gm-Message-State: AOJu0YwJDEQuHKlHx1IkA711urOicPCsYrLHRx3D5y6TlW7NG6vRZXi+
 cStLy/0QTuV0IzuU1PyzKt1ChfR4Fo+SyI2aJW9l9BlYRd3/YP9QhT6V7bBj3D3A
X-Gm-Gg: AfdE7cnOuhl7978uCwZG5fapAq81sktGjbHSpgfcM5MnnDn0qMqOhisjFOW7X3S4UXp
 mI8mGVrbXIIKZ67jEkq3//Rpc78Z17Gnh9F0rnve9oeKGMVKp1VxcXNWznMopXzmVaz3IGa91qA
 m1S9+hZpeM68wn58hqoK0zuIrBO2jHHGyVRet642PlSCgZ4xguV1uPHJyGNV+GxHULy84lvR117
 MnU5LzCelyhHOWvYKoii1iFlpEIMeZgMgjNMNGB37UI8WtVg45aQdN1wP1v2k9eFDcNNKIcQ5sI
 65LVcFGvBzI7MRwFZm+FJ9MYf4twFCtLvTXgxmVVZ0hRJZTvx+fRVuYpbilXy2AcYxBfvddlC5N
 0JkvqzOFkT1W/TG6mMoN9mYJTFDockriBy/uc/r5gY3sEhQR2UAJIwnY+wJVd6yrAK1vjNVy/Wh
 kleBWf/Ts38L0OqRliUeRZw86NLOO53P7VRCfePrTpJHpxUjmoQZve35bG0VPYg+BXtQmSeEsFB
 Q==
X-Received: by 2002:a05:6a21:3212:b0:3bd:203b:b587 with SMTP id
 adf61e73a8af0-3c08ee79ed1mr4389146637.40.1783397341116; 
 Mon, 06 Jul 2026 21:09:01 -0700 (PDT)
Received: from kadvm.. (ip72-203-121-181.oc.oc.cox.net. [72.203.121.181])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-311747f598dsm3372636eec.6.2026.07.06.21.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 21:09:00 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Vladimir Oltean <olteanv@gmail.com>
Date: Mon,  6 Jul 2026 21:05:44 -0700
Message-Id: <20260707040544.108052-9-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707040544.108052-1-nemaakhilesh@gmail.com>
References: <20260707040544.108052-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783397341; x=1784002141; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KU0qHMR77x6xRuemiXtNPhwQwRFAJ6ZE9TO9j+MbWKE=;
 b=McsF5zUiLgz2RnGKoZyrM5jz8PFgurnRtJTbgiX8YBG6xnqe8JqwWfUoQMaTh0S766
 GyhX8qE4bajZ7gjI81x69sDxq2qCi/Q7LKhg0mDcRa1yEWOWdGKTYnV19nIppzqz/Sxv
 T2duGNQV7dk4PulsVyW+46IWtEVnyE59ybUJMywcsYTbObeIASpZiS+3tXfqNpb5BJtk
 i9hPad+p6yqLOugBSsya0MoKjY2jbbJ0ycBFxw2Ex8nTC5P+kS1BfXzUG/Z9iZuLHrz0
 hZe0qxXEt7feYDSInBspGPGXX5SYRYyGm4qdanVpDh4muPBI3HlzAqDk/mfKyHcwrMBp
 ROmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=McsF5zUi
Subject: [Buildroot] [PATCH 9/9] configs/ls1046a-rdb: bump BSP tag to
 lf-6.18.20-2.0.0
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

Update the kernel, U-Boot, ATF tags and readme.txt.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 .../arm-trusted-firmware.hash                    |  2 +-
 .../ls1046a-rdb/patches/linux/linux.hash         |  2 +-
 .../ls1046a-rdb/patches/uboot/uboot.hash         |  2 +-
 board/freescale/ls1046a-rdb/readme.txt           | 16 ++++++++--------
 configs/ls1046a-rdb_defconfig                    |  8 ++++----
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/board/freescale/ls1046a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1046a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 7981c74137..4a62068d29 100644
--- a/board/freescale/ls1046a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1046a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2d3f9c52e16766c290bdc0bc130d634e4c326a5b236dfb2f2ca3f0fa457e82d4  atf-lf-6.12.34-2.1.0.tar.gz
+sha256  658af40a90fd8e2460d364775a0c37e0507201e49de7f69c8a22d61e179f81e1  atf-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1046a-rdb/patches/linux/linux.hash b/board/freescale/ls1046a-rdb/patches/linux/linux.hash
index f30030c86a..85d5173aa7 100644
--- a/board/freescale/ls1046a-rdb/patches/linux/linux.hash
+++ b/board/freescale/ls1046a-rdb/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  27a1987ca0a5802d3ebb296b8134ec66d813ad86cf2a60779b45092735bbb23b  linux-lf-6.12.34-2.1.0.tar.gz
+sha256  206f997d41bb958099bf7a89a02a6889942b118984f81f9a45bec9907f60708f  linux-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1046a-rdb/patches/uboot/uboot.hash b/board/freescale/ls1046a-rdb/patches/uboot/uboot.hash
index 38d54d9922..80bbe7d219 100644
--- a/board/freescale/ls1046a-rdb/patches/uboot/uboot.hash
+++ b/board/freescale/ls1046a-rdb/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  2f25cde388b2f83ff7a8e3afe25aafb1db48dafb0fa3bf1e4f9fef603f3b4785  u-boot-lf-6.12.34-2.1.0.tar.gz
+sha256  04aed627132db7b656117c7a35fb29d314172319fa3a297ea6748eebac2b5ce3  u-boot-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1046a-rdb/readme.txt b/board/freescale/ls1046a-rdb/readme.txt
index e2f344dce9..a79bd886fa 100644
--- a/board/freescale/ls1046a-rdb/readme.txt
+++ b/board/freescale/ls1046a-rdb/readme.txt
@@ -11,7 +11,7 @@ for more details about the board and the QorIQ Layerscape SoC, see the following
 Layerscape platforms are officially supported by NXP under the Layerscape
 Debian Linux SDK (LDLSDK). This uses components from Linux Factory (project
 common with i.MX), but has a slower release cadence than LF. The currently used
-tag is lf-6.12.34-2.1.0, which is in line with the latest LF tag. Generally, in
+tag is lf-6.18.20-2.0.0, which is in line with the latest LF tag. Generally, in
 Buildroot, the latest Linux Factory release tag is always used, which may be
 considered pre-release software, as it may contain features which are not yet
 documented, and it generally undergoes less testing.
@@ -21,13 +21,13 @@ For the software Layerscape Debian Linux SDK User Guide, see:
   - https://www.nxp.com/docs/en/user-guide/UG10143.pdf
 
 The components from NXP are:
-  - rcw, lf-6.12.34-2.1.0
-  - atf (fork), lf-6.12.34-2.1.0
-  - uboot (fork), lf-6.12.34-2.1.0
-  - qoriq-fm-ucode (blob), lf-6.12.34-2.1.0
-  - linux (fork), lf-6.12.34-2.1.0
-  - fmlib, lf-6.12.34-2.1.0
-  - fmc, lf-6.12.34-2.1.0
+  - rcw, lf-6.18.20-2.0.0
+  - atf (fork), lf-6.18.20-2.0.0
+  - uboot (fork), lf-6.18.20-2.0.0
+  - qoriq-fm-ucode (blob), lf-6.18.20-2.0.0
+  - linux (fork), lf-6.18.20-2.0.0
+  - fmlib, lf-6.18.20-2.0.0
+  - fmc, lf-6.18.20-2.0.0
 
 Build
 =====
diff --git a/configs/ls1046a-rdb_defconfig b/configs/ls1046a-rdb_defconfig
index f9be2d42b2..b604f1f33a 100644
--- a/configs/ls1046a-rdb_defconfig
+++ b/configs/ls1046a-rdb_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/ls1046a-rdb/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
@@ -13,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1046a-rdb/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.34-2.1.0)/linux-lf-6.12.34-2.1.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.18.20-2.0.0)/linux-lf-6.18.20-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.34-2.1.0)/atf-lf-6.12.34-2.1.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.18.20-2.0.0)/atf-lf-6.18.20-2.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1046ardb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -38,7 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.34-2.1.0)/u-boot-lf-6.12.34-2.1.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.18.20-2.0.0)/u-boot-lf-6.18.20-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1046ardb_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
