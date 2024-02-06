Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D2FC48286
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 05:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFC9181DEC;
	Tue,  6 Feb 2024 05:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dSbXLJOukNAy; Tue,  6 Feb 2024 05:04:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD9A081DED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD9A081DED;
	Tue,  6 Feb 2024 05:04:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B8F81BF28E
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 05:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5167840C58
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 05:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5167840C58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id raYUwMDn0XQT for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 05:04:30 +0000 (UTC)
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB647400CE
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 05:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB647400CE
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-78407987510so218707085a.3
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 21:04:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707195868; x=1707800668;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2F22MWkVNlCTRzCs14fuNo6MlS+sab9SPnQqPMTGR34=;
 b=J+b/UtF0gzP+4AfQKBmeRfuUuYLAH1ZFxX5W/FY45fNgy3yhGCj+iSr4pXgGn+3dXB
 V+BeECRxbHlO2ONjvO/C8FSIi2xTfprLQnKjUha7UTXsxrc3ghr4xIEOmMUghysF32tM
 shZTcne9WihsJteZxsUpRjtpJICf8MMCSrkvSF+zthqzK3d9j5zRIOGaDPfKI50PjVBU
 peEtw6XNAx0/mIZo2XuI0xiSOc/OXa5z/7R/wEElxnnyhsKeBhXVkA8qeTEQRONzS4YL
 KjApeFO3o4mS8p1ZjAaopIS8s8rNnEoC630bPa7Hs2rkTwvpuQEqPf5uUk7WurWFgPZJ
 zyiQ==
X-Gm-Message-State: AOJu0YyrAiutxkjsT04g+0HEGooQ+bCqh4da3y+60bi1E8Y+U4vRln5W
 S7rZRrt5q6ggslWjbtkjl5wLZEV12zH2EMaaa0FKhbkdBe6lRq34acApZIAgw3gHOw==
X-Google-Smtp-Source: AGHT+IGfEmr/pMDX+lemEh8gjrDeIUzoTD9Fu30GMO66vZikoR8ZDdM9b0DPxyHHJBDyUsyBC7QFHg==
X-Received: by 2002:a05:620a:1a21:b0:785:8b74:f45 with SMTP id
 bk33-20020a05620a1a2100b007858b740f45mr1737426qkb.8.1707195868144; 
 Mon, 05 Feb 2024 21:04:28 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWzi4Yql44iQj3/023vAXPc3knbRMptPXsR2KELBFJe9zLk26Sl89/18tgRgVmUEbW3fFlw7yRdZewjpy8L3UJYDI2knc9MU+V6B2jd5ufQFb0yO2RDYBS3ltU7CzREQ7jpmlRhpcNm8UJzgMAz
Received: from localhost.localdomain (211-72-129-103.hinet-ip.hinet.net.
 [211.72.129.103]) by smtp.gmail.com with ESMTPSA id
 z4-20020ae9f444000000b007854696725fsm590762qkl.75.2024.02.05.21.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 21:04:27 -0800 (PST)
From: Nigel Wang <asd617140123@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 13:04:13 +0800
Message-Id: <20240206050413.38810-1-asd617140123@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707195868; x=1707800668; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2F22MWkVNlCTRzCs14fuNo6MlS+sab9SPnQqPMTGR34=;
 b=DbOB3q7pslZjGWekpR1g1gee76vhn1adOK2dxV74XTPUdF9MY0WvyitXIkePNebevp
 3z93A05caqGi8Dv7pNmgsITapz4fBvB4CmYPlvXCzMkmjRmQixOmbDBgekCzB3D6cjkY
 eMC9duvAadPbAll9rzgFVeCn1yHUHYG65cj8f4D+aMH7rxVOJ1xPETaEhGDuZQlxjcRR
 qJlZJ2jsapA/wf1ZuFtF1laYHBshF3nvtVHbbj0heyND+m4/nbhRtj97p+Wv4QL1XhPg
 mJeRVsen3yuZ+bv8cqqrhQq5qSu748uOgAL240P9e251HQWq8TqoK2rIG8NHCXMXRyxA
 HKPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DbOB3q7p
Subject: [Buildroot] [PATCH v2] board/cubietech/cubieboard4 : Add config
 file for cubieboard4.
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
Cc: thomas.petazzoni@free-electrons.com, nigel_wang <asd617140123@gmail.com>,
 giulio.benetti@benettiengineering.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: nigel_wang <asd617140123@gmail.com>

add Cubieboard4 board support.

- SOC: Allwinner A80.
- DRAM: 2GiB DDR3 @ 672MHZ.
- NAND: 8GBeMMC
- Power: DC 5V.
- Wifi: 80211 b/g/n. (module is AP6330)
Reference: https://hirokun.jp/AP6330.pdf
- Ethernet: RTL8211E

Reference:
https://linux-sunxi.org/Cubietech_Cubieboard4

Board support package includes the following components:
- mainline Linux Kernel 6.6.8
- mainline U-boot 2021.10.

Signed-off-by: Nigel Wang <asd617140123@gmail.com>

---
 DEVELOPERS                                |  4 +++
 board/cubietech/cubieboard4/extlinux.conf |  5 +++
 board/cubietech/cubieboard4/genimage.cfg  | 38 ++++++++++++++++++++++
 board/cubietech/cubieboard4/post-image.sh | 18 +++++++++++
 configs/cubieboard4_defconfig             | 39 +++++++++++++++++++++++
 5 files changed, 104 insertions(+)
 create mode 100644 board/cubietech/cubieboard4/extlinux.conf
 create mode 100644 board/cubietech/cubieboard4/genimage.cfg
 create mode 100755 board/cubietech/cubieboard4/post-image.sh
 create mode 100644 configs/cubieboard4_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index a03018ab2b..bffb8f2069 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3297,3 +3297,7 @@ F:	package/quazip/
 F:	package/shapelib/
 F:	package/simple-mail/
 F:	package/tinc/
+
+N:	Nigel Wang <asd617140123@gmail.com>
+F:	board/cubietech/cubieboard4/
+F:	configs/cubieboard4_defconfig
diff --git a/board/cubietech/cubieboard4/extlinux.conf b/board/cubietech/cubieboard4/extlinux.conf
new file mode 100644
index 0000000000..5084e2237b
--- /dev/null
+++ b/board/cubietech/cubieboard4/extlinux.conf
@@ -0,0 +1,5 @@
+label linux
+    kernel /boot/zImage
+    devicetree /sun9i-a80-cubieboard4.dtb
+    append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
diff --git a/board/cubietech/cubieboard4/genimage.cfg b/board/cubietech/cubieboard4/genimage.cfg
new file mode 100644
index 0000000000..f1dee13923
--- /dev/null
+++ b/board/cubietech/cubieboard4/genimage.cfg
@@ -0,0 +1,38 @@
+# Minimal SD card image for the Cubieboard2
+# Based in the Orange Pi genimage.cfg
+
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun9i-a80-cubieboard4.dtb",
+			"extlinux"
+		}
+	}
+
+	size = 8M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+		size = 1016K # 1MB - 8KB
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/cubietech/cubieboard4/post-image.sh b/board/cubietech/cubieboard4/post-image.sh
new file mode 100755
index 0000000000..e37b960a4d
--- /dev/null
+++ b/board/cubietech/cubieboard4/post-image.sh
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
+
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                           \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+exit $?
diff --git a/configs/cubieboard4_defconfig b/configs/cubieboard4_defconfig
new file mode 100644
index 0000000000..0592fe4a2d
--- /dev/null
+++ b/configs/cubieboard4_defconfig
@@ -0,0 +1,39 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a15_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="Cubieboard4"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard4!"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard4/post-image.sh"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.8"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun9i-a80-cubieboard4"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard4"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
--
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
