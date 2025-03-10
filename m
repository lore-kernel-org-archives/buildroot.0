Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C78C2BA1B
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 05:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 524FE40B7D;
	Mon, 10 Mar 2025 05:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wM-N3YuWqrSU; Mon, 10 Mar 2025 05:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 543AB409D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 543AB409D0;
	Mon, 10 Mar 2025 05:55:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8AE5DC
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 05:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9E2E40128
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 05:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X87iqDkl6ABC for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 05:55:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=meena.murthy@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 171F940277
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 171F940277
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 171F940277
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 05:55:43 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-219f8263ae0so69013185ad.0
 for <buildroot@buildroot.org>; Sun, 09 Mar 2025 22:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741586143; x=1742190943;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=74UPpcdrpJbZaf/EzvyQgWN6Mij09YkHCYBcDllpgfg=;
 b=HkNir9jTtLpmXBM/Am5TTDjmb+6iyhMRJ79Fm6ts8pozpHtUgXwofBYnIsKDIdZW+d
 Qk1HmGzFjSykhUhilo+8I5xXEKvwdvEi3phjmd2FM5n01rNbzsHFFRMDkGX4dVPrvmrH
 GG2AmGgk/3k7puppeTRnAQ8jW2EhX2OnDFyUW0Kn5+K1asZk7Kdba3YaCUmJPFHgPiGm
 2lRLDW9O5l/qZWx9YSxf1wH0OhEVXTBH0SpPGJu+GmI8l4GBf6lTIJvHtq+TgwanihTr
 C4z1uFVS9dca6ocYf5DibDu0pK6XqwWLynJilaHJq4edGI3SO3l5GZRyizeme/mYfu0e
 opzg==
X-Gm-Message-State: AOJu0Yw2IUB9CmOG1pYLUHs4SYT+bCq9jerZs03zvizylqCYjX5Mnuls
 gzgQICdPywNXUnp8C7Fv5VnC8fjHbsGA/8xeUobJ+TMDQ76wojwXhc8QCipODEr/lzZsfq4bOus
 =
X-Gm-Gg: ASbGnctS1zmJv4ZF1ZaVLbQRTBA+r+8RjQ0TGflQ+loAFxTLdbufzxTqQnJ6r7ILQLu
 7BTtQrnK4bUbV2hRXUCTppuaayjQSEdjCoQCbxNcIRDKSVWs81kJLY9YBV6oUc17F7B1t4O40bV
 QlHHPhqpBGg8tF8kzyGzSJB3MldMTs1M+U26ju1ZqAPJoDuOIFy60NL483opun+Jbt0v/kins5v
 60iABtzP88MbUbsxso6DGvZYi8iXuwJOdcgB6Cy0efIkylSlscmdgQm32i3T+4YLFLFHPAKqB8B
 926cpyX0Cb25BBw2CDwRPS/WlYFNSsdm0FBE2bjd8pz7PzJ6UmQ7rx8tWkKL98kvtmNVE0H4CMO
 hRwYGrrurkIrU7AYi6Z5dKMWIfqJfJw==
X-Google-Smtp-Source: AGHT+IHFidftqu/8ErQExjjcQp8C/27tCNcb3AjIusgYkWiitpIj+91wp5Jdns6KLj4cDW6mcO24eQ==
X-Received: by 2002:a05:6a00:23d5:b0:736:a540:c9ad with SMTP id
 d2e1a72fcca58-736aaaefe79mr20911875b3a.20.1741586142704; 
 Sun, 09 Mar 2025 22:55:42 -0700 (PDT)
Received: from meena-ThinkPad-E14-Gen-3.amarulasolutions.com ([49.207.50.235])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7369cb72f2bsm7072788b3a.112.2025.03.09.22.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 22:55:42 -0700 (PDT)
From: Meena Murthy <meena.murthy@amarulasolutions.com>
To: Meena Murthy <meena.murthy@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com,
 Michael Trimarchi <michael@amarulasolutions.com>
Date: Mon, 10 Mar 2025 11:23:53 +0530
Message-ID: <20250310055356.273718-2-meena.murthy@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1741586143; x=1742190943;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=74UPpcdrpJbZaf/EzvyQgWN6Mij09YkHCYBcDllpgfg=;
 b=qnb0vEDVG8a/VDzm89uUaT9dOhn/1h04Y5T9VZ9hY7hSYqns+MVhKC+fuHfE6sTGd/
 YdxqmRxJhExrR95oiIdMlENPytJNNzwTMksv3mIQs3WmfqKrFen2jvXRy0oj/IdNh9ou
 kHdDnOiF2GXitGrGhXD9aDUqkAD7cWV7yXChk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=qnb0vEDV
Subject: [Buildroot] [PATCH v3] board: Add support for Engicam PX30 SOM board
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
Content-Type: multipart/mixed; boundary="===============8680242121629185563=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8680242121629185563==
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

---

Changes v2 -> v3:
Used BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS so tht arguments are passed only to BR2_ROOTFS_POST_IMAGE_SCRIPT

Changes v1 -> v2:
Based on code review comments
- Added more details in readme.txt for Engicam board
- Corrected board name
- Removed android-sparse image from genimage.cfg
- Changes to configuration file

Signed-off-by: Meena Murthy <meena.murthy@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 DEVELOPERS                                    |  4 ++
 board/engicam/px30core/extlinux.conf          |  4 ++
 board/engicam/px30core/genimage.cfg           | 22 +++++++
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../engicam/px30core/patches/linux/linux.hash |  2 +
 .../engicam/px30core/patches/uboot/uboot.hash |  2 +
 board/engicam/px30core/post-build.sh          |  5 ++
 board/engicam/px30core/readme.txt             | 60 +++++++++++++++++++
 configs/engicam_px30_core_defconfig           | 55 +++++++++++++++++
 9 files changed, 155 insertions(+)
 create mode 100644 board/engicam/px30core/extlinux.conf
 create mode 100644 board/engicam/px30core/genimage.cfg
 create mode 120000 board/engicam/px30core/patches/linux-headers/linux-headers.hash
 create mode 100644 board/engicam/px30core/patches/linux/linux.hash
 create mode 100644 board/engicam/px30core/patches/uboot/uboot.hash
 create mode 100755 board/engicam/px30core/post-build.sh
 create mode 100644 board/engicam/px30core/readme.txt
 create mode 100644 configs/engicam_px30_core_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f04dd2a1e..a3c6ff87a0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2372,6 +2372,10 @@ F:	package/libtraceevent/
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
index 0000000000..db84a5e56b
--- /dev/null
+++ b/board/engicam/px30core/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
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
index 0000000000..d92dba69ed
--- /dev/null
+++ b/configs/engicam_px30_core_defconfig
@@ -0,0 +1,55 @@
+BR2_aarch64=y
+BR2_cortex_a72_a53=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
+BR2_BINUTILS_VERSION_2_42_X=y
+BR2_CURL="curl -q --ftp-pasv --retry 3"
+BR2_WGET="wget -nd -t 3"
+BR2_SVN="svn --non-interactive"
+BR2_SCP="scp"
+BR2_SFTP="sftp"
+BR2_GNU_MIRROR="http://ftpmirror.gnu.org"
+BR2_GLOBAL_PATCH_DIR="board/engicam/px30core/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME=""
+BR2_TARGET_GENERIC_ISSUE=""
+BR2_ROOTFS_MERGED_USR=y
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/engicam/px30core/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/engicam/px30core/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"
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
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.9"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="px30"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
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


--===============8680242121629185563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8680242121629185563==--
