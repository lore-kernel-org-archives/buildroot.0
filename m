Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56DBC36014
	for <buildroot@archiver.kernel.org>; Tue,  1 Apr 2025 09:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1717C84B20;
	Tue,  1 Apr 2025 09:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id exy4aOEsjT10; Tue,  1 Apr 2025 09:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E67C484B3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E67C484B3E;
	Tue,  1 Apr 2025 09:54:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 62F5417F
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 09:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F24C4199A
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 09:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbER6SbVJYn9 for <buildroot@buildroot.org>;
 Tue,  1 Apr 2025 09:54:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=meena.murthy@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4E7FA4199C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E7FA4199C
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E7FA4199C
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 09:54:41 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-227cf12df27so75386345ad.0
 for <buildroot@buildroot.org>; Tue, 01 Apr 2025 02:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743501280; x=1744106080;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OprsWPvo45BkH1Xk6WwOrdtZIZtl7psNTkIULu4hk5I=;
 b=cBj6YpZOVZm6Jg3qk7WlO933xjekry4r2V8asFuUIMQwtByDpOHWS4wT8N3WD9iUXo
 26QF8jPFnSpC0mSrM3xBpCRUYZWc9SVe2Xzqpnu3sEDYfbWD7I59VekDP56YR3JFvNTf
 xyPbRMGxQVWqG2/Jk8r9l1dqabdYfvpdZMA5PsjNPAiK5dN2RwVn4gW/Tnnwnp+nit0o
 OL9I/FK4ujSN+T/8m72wed6uTQd910uOUUg1alGQ+Yt4mbl+QzWKNP5YdDp22IpOYz73
 AnrZ9EVwUBIArW1AMu4aiLAVfP2t+JJy3dJ/zr/x7CY60+A2X3Tm3UkoMjXGmsVe/Ymz
 vkkw==
X-Gm-Message-State: AOJu0YwBd+LUjRfCOrNYou2EsnnAc13N56tiKP/eyrbV2Y3tk9w1wCHC
 lnTBV6ZWSbIHe0mxQYdqR3lMl7OG/i1u2mu/X5dhL3A3pnhhRBrVA1IuhfyNZuWQo54Swy9Turo
 =
X-Gm-Gg: ASbGncvD0w19c1wKHx+9aolDeSlIfTWLuGetHQiLs2lQZE1XSlOXuKyDxNy9ryEq+jH
 +aX+9EWprWv0CO+CWc62oTspOydQtJRMABg8JkHlowxO5nFuIoyFYHO5GW1he9cokHdxG3DhwFD
 nSujPVOOnu4zPPalBu0MgFyNritcrPfuv36BETAwHlLTMQyruptIX4V9Ikvv0UtlNN019i/EYqF
 QhkLqioq8qxCTtiivfC2hBXdPW1P0g4BrgZ2zEaX8tQe0U0ex8mnZAuDBXZq5sKITLz8nWc+hNc
 rI2DxzFJZKUyrCWQ/80ZeFYVvVWib1bfb5OFHjyfx28gEeW9pIEVUUZFNhb9OTclWomA3esdk/u
 23FIk
X-Google-Smtp-Source: AGHT+IHLQliaX0+1hAws0JQ+rknBUYJkLKpsmQyCUr+EjeLP2pyfWYbHoUMNUAVqQZKhzWJvWOdqkQ==
X-Received: by 2002:a17:902:e947:b0:223:5187:a886 with SMTP id
 d9443c01a7336-2292ef324cfmr214681675ad.22.1743501280634; 
 Tue, 01 Apr 2025 02:54:40 -0700 (PDT)
Received: from meena-ThinkPad-E14-Gen-3.. ([49.207.50.235])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291f1ce1b4sm84302915ad.150.2025.04.01.02.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 02:54:40 -0700 (PDT)
From: Meena Murthy <meena.murthy@amarulasolutions.com>
To: Meena Murthy <meena.murthy@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com,
 Michael Trimarchi <michael@amarulasolutions.com>
Date: Tue,  1 Apr 2025 15:24:04 +0530
Message-ID: <20250401095407.488618-2-meena.murthy@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1743501280; x=1744106080;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OprsWPvo45BkH1Xk6WwOrdtZIZtl7psNTkIULu4hk5I=;
 b=JbixqWVO7Cg7XJWigqaGIpL4fdtV7MuQ23bGcu2FgPEPcGqqFmBYlM9TnWWeJVIuMP
 4Q6NOW8xQQq1jtOA378KcmLIZ7OkxfOPPfx3eWy72aHxkMaVp+FJPNO/NJbx9HREoz1j
 Fq8+ekAHiswGTx2ErH5345BBkSGI9qJzqjAs8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=JbixqWVO
Subject: [Buildroot] [PATCH v4] configs/engicam_px30_core_defconfig: new
 defconfig
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
Content-Type: multipart/mixed; boundary="===============8280000363252956491=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8280000363252956491==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Add initial support for Engicam PX30 SOM board
with below features:
- U-Boot 2024.01
- Linux 6.4.16
- Default packages from buildroot

px30 ctouch2 with 10 inches display

https://www.engicam.com/vis-prod/C-Touch-2-0-Carrier-Board/ \
	General-purpose-carrier-board-with-capacitive-touch-interface-EDIMM-20-compliant

Signed-off-by: Meena Murthy <meena.murthy@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>

---

Changes v3 -> v4:
Based on code review comments:
changed the commit title to align with the convention
linux.hash:
    updated the upstream kernel link containing the linux hash
defconfig:
    correct CPU architecture a35 updated
    removed config options that were blank
    updated latest or long term versions wherever applicable

Changes v2 -> v3:
Used BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS so tht arguments are passed only to BR2_ROOTFS_POST_IMAGE_SCRIPT

Changes v1 -> v2:
Based on code review comments
- Added more details in readme.txt for Engicam board
- Corrected board name
- Removed android-sparse image from genimage.cfg
- Changes to configuration file

Signed-off-by: Meena Murthy <meena.murthy@amarulasolutions.com>
---
 DEVELOPERS                                    |  4 ++
 board/engicam/px30core/extlinux.conf          |  4 ++
 board/engicam/px30core/genimage.cfg           | 22 +++++++
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../engicam/px30core/patches/linux/linux.hash |  2 +
 .../engicam/px30core/patches/uboot/uboot.hash |  2 +
 board/engicam/px30core/post-build.sh          |  5 ++
 board/engicam/px30core/readme.txt             | 60 +++++++++++++++++++
 configs/engicam_px30_core_defconfig           | 44 ++++++++++++++
 9 files changed, 144 insertions(+)
 create mode 100644 board/engicam/px30core/extlinux.conf
 create mode 100644 board/engicam/px30core/genimage.cfg
 create mode 120000 board/engicam/px30core/patches/linux-headers/linux-headers.hash
 create mode 100644 board/engicam/px30core/patches/linux/linux.hash
 create mode 100644 board/engicam/px30core/patches/uboot/uboot.hash
 create mode 100755 board/engicam/px30core/post-build.sh
 create mode 100644 board/engicam/px30core/readme.txt
 create mode 100644 configs/engicam_px30_core_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 44f7684c97..e12d1b0f4d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2383,6 +2383,10 @@ F:	package/libtraceevent/
 F:	package/libtracefs
 F:	package/linux-tools/linux-tool-rtla.mk.in
 
+N:	Meena Murthy <meena.murthy@amarulasolutions.com>
+F:	board/engicam/px30core/
+F:	configs/engicam_px30_core_defconfig
+
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
 F:	configs/arcturus_ucp1020_defconfig
diff --git a/board/engicam/px30core/extlinux.conf b/board/engicam/px30core/extlinux.conf
new file mode 100644
index 0000000000..6d5a845cb0
--- /dev/null
+++ b/board/engicam/px30core/extlinux.conf
@@ -0,0 +1,4 @@
+label Engicam-EDIMM linux
+  kernel /boot/Image
+  devicetree /boot/px30-engicam-px30-core-ctouch2-of10.dtb
+  append earlycon=uart8250,mmio32,0xff160000 root=/dev/mmcblk1p1 rootwait
diff --git a/board/engicam/px30core/genimage.cfg b/board/engicam/px30core/genimage.cfg
new file mode 100644
index 0000000000..966c869273
--- /dev/null
+++ b/board/engicam/px30core/genimage.cfg
@@ -0,0 +1,22 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot-tpl-spl-dtb {
+		in-partition-table = "no"
+		image = "idbloader.img"
+		offset = 32K
+	}
+
+	partition u-boot-dtb {
+		in-partition-table = "no"
+		image = "u-boot.itb"
+		offset = 8M
+		size = 30M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/engicam/px30core/patches/linux-headers/linux-headers.hash b/board/engicam/px30core/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/engicam/px30core/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/engicam/px30core/patches/linux/linux.hash b/board/engicam/px30core/patches/linux/linux.hash
new file mode 100644
index 0000000000..b0fc6ffdd5
--- /dev/null
+++ b/board/engicam/px30core/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  9626ec84a39ecb009bf11a271dd520941159c165d4e62f82e3a77b79d20ff27d  linux-6.4.16.tar.xz
diff --git a/board/engicam/px30core/patches/uboot/uboot.hash b/board/engicam/px30core/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..bc999536af
--- /dev/null
+++ b/board/engicam/px30core/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
diff --git a/board/engicam/px30core/post-build.sh b/board/engicam/px30core/post-build.sh
new file mode 100755
index 0000000000..d84a5da0b0
--- /dev/null
+++ b/board/engicam/px30core/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$TARGET_DIR"/boot/extlinux/extlinux.conf
diff --git a/board/engicam/px30core/readme.txt b/board/engicam/px30core/readme.txt
new file mode 100644
index 0000000000..0693792d56
--- /dev/null
+++ b/board/engicam/px30core/readme.txt
@@ -0,0 +1,60 @@
+ENGICAM PX30-EDIMM2.2 carrier board
+===================================
+
+Build:
+
+  $ make engicam_px30_core_defconfig
+  $ make
+
+Files created in output directory
+---------------------------------
+
+output/images
+
+├── bl31.elf
+├── idbloader.img
+├── Image
+├── px30-engicam-px30-core-ctouch2-of10.dtb
+├── rootfs.ext2
+├── rootfs.ext4 -> rootfs.ext2
+├── rootfs.tar
+├── sdcard.img
+├── u-boot.bin
+└── u-boot.itb
+
+How to connect the board and get started:
+-----------------------------------------
+Ensure that the power supply is stable and provides enough current to handle
+the board's needs, especially when peripherals are connected.
+
+Insert micro SD card on the board micro SD slot J17
+
+Creating bootable SD card:
+--------------------------
+sudo dd if=output/images/sdcard.img of=/dev/sdX && sync
+
+/dev/sdX is the path in host via which SD card is detected
+Where X is your SD card device
+
+Connect UART port on the board J26
+
+Serial console
+--------------
+Launch minicom at host with 1152008N1
+
+Power on the kit using J4
+
+Refer link on checking board booting
+
+Program eMMC
+------------
+Connect USB otg cable A-type to host pc, Micro USB end to board.
+
+Close Jumper JM5.
+
+Boot the Kit with SD boot.
+
+Program eMMC in U-Boot. (Refer link for the steps)
+
+Wiki link:
+https://wiki.amarulasolutions.com/bsp/rockchip/px30/engicam-px30-edimm2.2.html
diff --git a/configs/engicam_px30_core_defconfig b/configs/engicam_px30_core_defconfig
new file mode 100644
index 0000000000..1f820fc44b
--- /dev/null
+++ b/configs/engicam_px30_core_defconfig
@@ -0,0 +1,44 @@
+BR2_aarch64=y
+BR2_cortex_a35=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_GLOBAL_PATCH_DIR="board/engicam/px30core/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/engicam/px30core/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/engicam/px30core/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.19"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/px30-engicam-px30-core-ctouch2-of10"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="150M"
+BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O 64bit"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="lts-v2.12.1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="px30"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="px30-core-ctouch2-of10-px30"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="idbloader.img"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.43.0


--===============8280000363252956491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8280000363252956491==--
