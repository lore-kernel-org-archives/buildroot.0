Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10A7CCD187
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 03:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FCD28223B;
	Mon, 13 Oct 2025 03:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SVujXIWOs6yA; Mon, 13 Oct 2025 03:17:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0E6782177
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0E6782177;
	Mon, 13 Oct 2025 03:17:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 832EB12B
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69E8380E8A
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xonBRRDg_rpE for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 03:17:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 38A3880EA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38A3880EA7
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38A3880EA7
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:03 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-339d53f4960so3869666a91.3
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760325422; x=1760930222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IYuU0JdJJzMcuY0s6UenhVudxE1yri1M/GBgZyrmpjU=;
 b=FXsvb0zvzq3gRlI8Nv6xMijLwz0/e0xhHAddrDLLqXE6iaQMZ+oerNG/6Cm30Bj3LX
 JfhsBhyZxyCWxt0kM+cXegCNzjiIKCDKNGDWbchzdsvBSgzPbickixADm4fFEXOiZyyE
 XiKrqvJXdFYOMmIc/2ckp9TjwFWdzo4PpVUy2Nw5VREpd2q8s5QeldHXgsNPqCS6NEIc
 9eOSOPEJfEyoxrrq+PMc+ZQ2WwpnRMxKV+xdeTl+iF852OnfmTBeE+6rlipH5l0gflfF
 2YCLIWpNuCEh//TF+VL0jyeUSQQew/Ky0czKBNzxNH7Bwvu5l5YSc6U1rg4bQlLI0DgT
 YjJw==
X-Gm-Message-State: AOJu0YzvLWNblVD1psKht4YDgEgxkhaZiQYmnq+PtWZH6ctqxBMyKYPS
 C5mZJbUty7otDjFe+/KAh4ioLrRRZGhXfDnz2I1fMHqB/6k3DnjlXV0rKzY7uBqW
X-Gm-Gg: ASbGncvjhmnN/jUOddqT49xCQ1cgf2zMg9LkTVaVsLLd4ga/Mg7/lbgBcjqgWVtDzDc
 P7NAJy2i3jgx2bDTsM6gwTfkCxL+xN8GnfYMCF8/S8hQWoajdjzgj6jZU33wm9Vu7pCOcZE7uUp
 bX1Z2ZxOrNCJnJ9FUteb4WIHyIKJ/f4bB7Bc6UPO+lv7GeENb+VV8LrtS+UIVF5bf5TbNpNYsLQ
 nlXGJtMTY9h2hp/m3L3Wiyz9saJ+dFENaIyWHlKreouwGHPw8PY6ZQDrI+NfYvACpdzxZXJ5z52
 qmH3LFFvecz/UzngW6lrw/uyff1EBtNCKde4pUdX37RcRwxG0KuS4yuwXQSf8K7veKTFB0UrTZb
 H0i2bJ18qcOsnXF3j3TqwFGQyP2xymyw1UAGcZ2BNDI/w1xixtPL2v6qBxykL0osafArGV5Vnv+
 BEtnlvIvXGYdnGuKF8AgEl74T/p/973PaS1ZkreINwEfK9cmmXXhUi5NfYzIfMED4R2Ks=
X-Google-Smtp-Source: AGHT+IETAhwG7n6CfA9lx2HMIiat1X3s4u7VPEMplS+2iGfmS9UL8fUoJhugQ2qSpNxATkWgX3fFTQ==
X-Received: by 2002:a17:90b:1641:b0:330:4a1d:223c with SMTP id
 98e67ed59e1d1-33b5116a6a6mr28900643a91.15.1760325422101; 
 Sun, 12 Oct 2025 20:17:02 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61ac8d7fsm10195647a91.21.2025.10.12.20.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 20:17:01 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:14:47 -0700
Message-Id: <20251013031453.566526-3-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251013031453.566526-1-nemaakhilesh@gmail.com>
References: <20251013031453.566526-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760325422; x=1760930222; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IYuU0JdJJzMcuY0s6UenhVudxE1yri1M/GBgZyrmpjU=;
 b=djXYgAXRMCwXVYQzGr8noA8FKWXyOpqov79F44j557DTdbC/3aANP5bE73TI0BDfEY
 YbyvF0IZ8bF66VseJpS+ydSMm9YiZMijquK0GhiBwx0O7+Cp8cTawBesJqhHQukqgCTw
 NtlfR57wexBtorMnkYxabIU2vE4fJFBupSpvcOBEMZvzodblyEkmq3KAf5wBACWpTWf5
 RFpZwqEuxtw/c/PYFZ2XsDSRdOPZL6p4hclyF8zF2qUhkve02U66IhDVjE1S6YsZCzHy
 0DqkR3g75dLdaUDlh7VE/+fNm2mhrl++S4GYhV6QFWYbbTQhKXbxxXQLVN5/A+yenwOb
 QgHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=djXYgAXR
Subject: [Buildroot] [PATCH 3/9] configs/ls1043a-rdb: bump BSP tag to
 lf-6.12.34-2.1.0
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
Cc: Vladimir Oltean <olteanv@gmail.com>, Akhilesh Nema <nemaakhilesh@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the kernel, U-Boot, ATF tags and readme.txt.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 .../arm-trusted-firmware.hash                    |  2 +-
 .../ls1043a-rdb/patches/linux/linux.hash         |  2 +-
 .../ls1043a-rdb/patches/uboot/uboot.hash         |  2 +-
 board/freescale/ls1043a-rdb/readme.txt           | 16 ++++++++--------
 configs/ls1043a-rdb_defconfig                    |  6 +++---
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/board/freescale/ls1043a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1043a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index c05084df76..7981c74137 100644
--- a/board/freescale/ls1043a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1043a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  738f029c6bfcdac5649e2c252970b1f44c1ce7fee9fe4657a25edc666375ffa8  atf-lf-6.12.20-2.0.0.tar.gz
+sha256  2d3f9c52e16766c290bdc0bc130d634e4c326a5b236dfb2f2ca3f0fa457e82d4  atf-lf-6.12.34-2.1.0.tar.gz
diff --git a/board/freescale/ls1043a-rdb/patches/linux/linux.hash b/board/freescale/ls1043a-rdb/patches/linux/linux.hash
index 3aea05469c..f30030c86a 100644
--- a/board/freescale/ls1043a-rdb/patches/linux/linux.hash
+++ b/board/freescale/ls1043a-rdb/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  c98177e85ace6400b06301101af3065e90463920c3e166da4ed22deffe960fb8  linux-lf-6.12.20-2.0.0.tar.gz
+sha256  27a1987ca0a5802d3ebb296b8134ec66d813ad86cf2a60779b45092735bbb23b  linux-lf-6.12.34-2.1.0.tar.gz
diff --git a/board/freescale/ls1043a-rdb/patches/uboot/uboot.hash b/board/freescale/ls1043a-rdb/patches/uboot/uboot.hash
index 1072686160..38d54d9922 100644
--- a/board/freescale/ls1043a-rdb/patches/uboot/uboot.hash
+++ b/board/freescale/ls1043a-rdb/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  a39f7db3ffd2b7263ea5d02b0631decac1c89f7c1b96b77ba8e302f3641a3eb3  u-boot-lf-6.12.20-2.0.0.tar.gz
+sha256  2f25cde388b2f83ff7a8e3afe25aafb1db48dafb0fa3bf1e4f9fef603f3b4785  u-boot-lf-6.12.34-2.1.0.tar.gz
diff --git a/board/freescale/ls1043a-rdb/readme.txt b/board/freescale/ls1043a-rdb/readme.txt
index b106c96471..4461b18e73 100644
--- a/board/freescale/ls1043a-rdb/readme.txt
+++ b/board/freescale/ls1043a-rdb/readme.txt
@@ -11,7 +11,7 @@ for more details about the board and the QorIQ Layerscape SoC, see the following
 Layerscape platforms are officially supported by NXP under the Layerscape
 Debian Linux SDK (LDLSDK). This uses components from Linux Factory (project
 common with i.MX), but has a slower release cadence than LF. The currently used
-tag is lf-6.12.20-2.0.0, which is in line with the latest LF tag. Generally, in
+tag is lf-6.12.34-2.1.0, which is in line with the latest LF tag. Generally, in
 Buildroot, the latest Linux Factory release tag is always used, which may be
 considered pre-release software, as it may contain features which are not yet
 documented, and it generally undergoes less testing.
@@ -21,13 +21,13 @@ For the software Layerscape Debian Linux SDK User Guide, see:
   - https://www.nxp.com/docs/en/user-guide/UG10143.pdf
 
 The components from NXP are:
-  - rcw, lf-6.12.20-2.0.0
-  - atf (fork), lf-6.12.20-2.0.0
-  - uboot (fork), lf-6.12.20-2.0.0
-  - qoriq-fm-ucode (blob), lf-6.12.20-2.0.0
-  - linux (fork), lf-6.12.20-2.0.0
-  - fmlib, lf-6.12.20-2.0.0
-  - fmc, lf-6.12.20-2.0.0
+  - rcw, lf-6.12.34-2.1.0
+  - atf (fork), lf-6.12.34-2.1.0
+  - uboot (fork), lf-6.12.34-2.1.0
+  - qoriq-fm-ucode (blob), lf-6.12.34-2.1.0
+  - linux (fork), lf-6.12.34-2.1.0
+  - fmlib, lf-6.12.34-2.1.0
+  - fmc, lf-6.12.34-2.1.0
 
 Build
 =====
diff --git a/configs/ls1043a-rdb_defconfig b/configs/ls1043a-rdb_defconfig
index 57c9dbf5b1..94b8a91416 100644
--- a/configs/ls1043a-rdb_defconfig
+++ b/configs/ls1043a-rdb_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1043a-rdb/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.20-2.0.0)/linux-lf-6.12.20-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.34-2.1.0)/linux-lf-6.12.34-2.1.0.tar.gz"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.20-2.0.0)/atf-lf-6.12.20-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.34-2.1.0)/atf-lf-6.12.34-2.1.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1043ardb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -38,7 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.20-2.0.0)/u-boot-lf-6.12.20-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.34-2.1.0)/u-boot-lf-6.12.34-2.1.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1043ardb_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
