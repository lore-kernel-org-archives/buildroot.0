Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E8DCCD184
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 03:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E724A8224B;
	Mon, 13 Oct 2025 03:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CyYTuQo5FnQI; Mon, 13 Oct 2025 03:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C81AB82242
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C81AB82242;
	Mon, 13 Oct 2025 03:17:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E6D3E2A8
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8C8582241
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FcaDmh2uA63m for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 03:17:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 32CA28223C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32CA28223C
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32CA28223C
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:07 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-33292adb180so3727984a91.3
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760325426; x=1760930226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1LiKpNUuVfPM8vAGu91ClWKPdpYk+3uPFSX0YXHCjew=;
 b=D8XreTRL/9lOTB3aJDuPGWXpf+R/27S7pMQiI0fghlidljL5h2ouELBqq0G7+2PQ5U
 QcE/NZKWW2wn5JTS1GFCsOqAeaZBnBed8d/QFuVWVSsdhqufOf8M3PcUKF6js3A/5t85
 PZIBwYjuiR0SVgMHNajhFeS2SQu2DFC2immP5VERHUAvzIxEhFsUKvvRorPwNBuJqKuo
 bfzseRIS8INA/bUXKLchH3bUgQZegNzdl+0vdVKcGpdDK+Jgysl5V461vXWf8IxqEypl
 BMhC6m0fv8IH8wALWAyaNl6oRAmAh+j+Iq+jckSQolbzVg6wc8WlMtkqnH3aGUbSO53L
 wk1Q==
X-Gm-Message-State: AOJu0YxGdg5oGpKSeLLsJnLxaT5HMO6mWNpYUjuG0XO6T3qOF6hvLIAG
 HW9tAzryyb32S42lvNsbC5XND2/vuwxk5E+mSm9D19x6LsQc10pcO+cYIL4Nlnce
X-Gm-Gg: ASbGncveBVM897I8qLL5AWQD1gyc0FtJ2D/hxMj3uydiSEr+diHcR/4S9V0eB6B9ar6
 FcmzpjnH3yQHsxhUx0wxzv/wsADfmcv5tenEqmxPV3iE4eeI+uQNq6LATG3FAn1Vol50/UADrQE
 hcZTcqmChk9W2BTH6DbKgByA7Bl2OroxBuoIKGVs7IGfUEZFHvZ17G/abMmj0fYWS88LVtpYR9q
 Dhr/rU+V5gdyJ1KHuXZm2sdOcCe8oiNZEAbBJHJf7MMKahocPLb7gy+W5055EWGJNK3+JViDR4e
 27747bHiqAKncrVBtmrO1f2hYHoRMZ9cUWB/DcI2mJ2P1YUNqeiQ5BFZoK6EpcS1Wp2olRWCJRo
 6GZpssWt6uL8Ymz9d5HA21KutMKi9IBVLNt7gF4IjiAkBlIlFbADlCKmGwWSfJTOPY8hdoqLyVy
 D7KrGEzqNX3ohwIluey74o3h4/g6WfpwiSwtc+1uu0v9PyQkMXvRAjRINGqCze2TEzwYttJlzXk
 jyJnQ==
X-Google-Smtp-Source: AGHT+IGKSWJtJZDV1hssiuZj8A+q1a9EHGmyhE7UJ2WMYEMRfkcjuwUo20+4QF/1k2bXG4q1jZ/2kw==
X-Received: by 2002:a17:90b:4b8c:b0:338:3dca:e0a3 with SMTP id
 98e67ed59e1d1-33b51118f99mr30097865a91.16.1760325426158; 
 Sun, 12 Oct 2025 20:17:06 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61ac8d7fsm10195647a91.21.2025.10.12.20.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 20:17:05 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:14:48 -0700
Message-Id: <20251013031453.566526-4-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251013031453.566526-1-nemaakhilesh@gmail.com>
References: <20251013031453.566526-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760325426; x=1760930226; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1LiKpNUuVfPM8vAGu91ClWKPdpYk+3uPFSX0YXHCjew=;
 b=HvYqjkUWr/9whk8lPJ16oH5i/X+syPVwcghfjBRpjlXGyfuIsa6GRcWTfT7z7TUIqW
 /gd1fc7jGVpzxfYhcJ+6EEvLJ75t+9FS5TelyN8h+xSCxL54U3G8yqzf36Svp02i90U1
 rUQTBshliXkwCnlxduUNlhBD1rnffeur2zYn7yPiO/WBi1JMqbHFrtv3ZUeAHMaqjSp7
 NTdjSG8QIxQEskfqk+o/J36S/5PKIDchr1J3QRNGXU5Zo1bfKvLDZBBptsiK/mGBckfL
 S/INPAX6i4aSuRzfcZomrGcR1Wl9559Eezt0hJExWr1grQEy3EocJHzwDhTpN7K4iGeU
 L0EA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HvYqjkUW
Subject: [Buildroot] [PATCH 4/9] configs/ls1028a-rdb: bump BSP tag to
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

- Update the kernel, U-Boot, ATF tags and readme.txt.
- Increase the rootfs size to 200M.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 .../arm-trusted-firmware/arm-trusted-firmware.hash     |  2 +-
 board/freescale/ls1028ardb/patches/linux/linux.hash    |  2 +-
 board/freescale/ls1028ardb/patches/uboot/uboot.hash    |  2 +-
 board/freescale/ls1028ardb/readme.txt                  | 10 +++++-----
 configs/ls1028ardb_defconfig                           |  8 ++++----
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index c05084df76..7981c74137 100644
--- a/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  738f029c6bfcdac5649e2c252970b1f44c1ce7fee9fe4657a25edc666375ffa8  atf-lf-6.12.20-2.0.0.tar.gz
+sha256  2d3f9c52e16766c290bdc0bc130d634e4c326a5b236dfb2f2ca3f0fa457e82d4  atf-lf-6.12.34-2.1.0.tar.gz
diff --git a/board/freescale/ls1028ardb/patches/linux/linux.hash b/board/freescale/ls1028ardb/patches/linux/linux.hash
index 3aea05469c..f30030c86a 100644
--- a/board/freescale/ls1028ardb/patches/linux/linux.hash
+++ b/board/freescale/ls1028ardb/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  c98177e85ace6400b06301101af3065e90463920c3e166da4ed22deffe960fb8  linux-lf-6.12.20-2.0.0.tar.gz
+sha256  27a1987ca0a5802d3ebb296b8134ec66d813ad86cf2a60779b45092735bbb23b  linux-lf-6.12.34-2.1.0.tar.gz
diff --git a/board/freescale/ls1028ardb/patches/uboot/uboot.hash b/board/freescale/ls1028ardb/patches/uboot/uboot.hash
index 1072686160..38d54d9922 100644
--- a/board/freescale/ls1028ardb/patches/uboot/uboot.hash
+++ b/board/freescale/ls1028ardb/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  a39f7db3ffd2b7263ea5d02b0631decac1c89f7c1b96b77ba8e302f3641a3eb3  u-boot-lf-6.12.20-2.0.0.tar.gz
+sha256  2f25cde388b2f83ff7a8e3afe25aafb1db48dafb0fa3bf1e4f9fef603f3b4785  u-boot-lf-6.12.34-2.1.0.tar.gz
diff --git a/board/freescale/ls1028ardb/readme.txt b/board/freescale/ls1028ardb/readme.txt
index 28b8fdff3a..6411baf6ec 100644
--- a/board/freescale/ls1028ardb/readme.txt
+++ b/board/freescale/ls1028ardb/readme.txt
@@ -11,7 +11,7 @@ For more details about the board and the QorIQ Layerscape SoC, see the following
 Layerscape platforms are officially supported by NXP under the Layerscape
 Debian Linux SDK (LDLSDK). This uses components from Linux Factory (project
 common with i.MX), but has a slower release cadence than LF. The currently used
-tag is lf-6.12.20-2.0.0, which is in line with the latest LF tag. Generally, in
+tag is lf-6.12.34-2.1.0, which is in line with the latest LF tag. Generally, in
 Buildroot, the latest Linux Factory release tag is always used, which may be
 considered pre-release software, as it may contain features which are not yet
 documented, and it generally undergoes less testing.
@@ -21,11 +21,11 @@ For the software Layerscape Debian Linux SDK User Guide, see:
   - https://www.nxp.com/docs/en/user-guide/UG10143.pdf
 
 The components from NXP are:
-  - rcw, lf-6.12.20-2.0.0
-  - atf (fork), lf-6.12.20-2.0.0
-  - uboot (fork), lf-6.12.20-2.0.0
+  - rcw, lf-6.12.34-2.1.0
+  - atf (fork), lf-6.12.34-2.1.0
+  - uboot (fork), lf-6.12.34-2.1.0
   - cadence-dp-firmware (blob), 8.16
-  - linux (fork), lf-6.12.20-2.0.0
+  - linux (fork), lf-6.12.34-2.1.0
 
 Build
 =====
diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
index ccb886dbe9..d39c452963 100644
--- a/configs/ls1028ardb_defconfig
+++ b/configs/ls1028ardb_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1028ardb/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.20-2.0.0)/linux-lf-6.12.20-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.34-2.1.0)/linux-lf-6.12.34-2.1.0.tar.gz"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -22,11 +22,11 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_QORIQ_CADENCE_DP_FIRMWARE=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.20-2.0.0)/atf-lf-6.12.20-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.34-2.1.0)/atf-lf-6.12.34-2.1.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1028ardb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -36,7 +36,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.20-2.0.0)/u-boot-lf-6.12.20-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.34-2.1.0)/u-boot-lf-6.12.34-2.1.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1028ardb_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
