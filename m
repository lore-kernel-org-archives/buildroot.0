Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3CDCD1294
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 09:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87A79820AD;
	Wed,  3 Apr 2024 09:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mK2sfVBIU8K; Wed,  3 Apr 2024 09:22:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFB3C820BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFB3C820BA;
	Wed,  3 Apr 2024 09:21:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D48921BF271
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 09:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C17CA41689
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 09:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3H0YR39UI0PD for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 09:21:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DC56D4040D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC56D4040D
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC56D4040D
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 09:21:53 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 8B5A3C3F1B
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 09:21:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1390BFF805;
 Wed,  3 Apr 2024 09:21:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 11:14:40 +0200
Message-ID: <20240403091952.653698-3-thomas.bonnefille@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403091952.653698-1-thomas.bonnefille@bootlin.com>
References: <20240403091952.653698-1-thomas.bonnefille@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712136107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t+1t08bZyK3dmM00Q10HOu+8yvDGhUuhHNJoFSCPEIE=;
 b=XIeX9PTHp1a+TiUfrVnCUSDzklwz4stJ7HXCc+RQ+RbLq5xWkfZkbzpJPjxtnoSWO9UPh0
 SbHx+g5LmlGAKS3AwaGt9X+xxKMHDqG27WfLufqU4bfEEBK6Nx56HvdgyIzAAgeH+PTzQS
 FsoWg44R+LzqNetGDQLS8mzNVf1HH5exc0AeTUbO6N7e6BiFoS253wq9DE/8ULt3ZjDAnN
 2Vp7WJ0vgwot7+LjEFI9orzabJV7vaGhfp+5fwPyrPy9eRMzEZ9UN7znSkVlumpYLg2wGV
 MtDf5mOcW0gCHCNmx+Sqa5/G+964NEGnU4/H/T0IcfXue0MEiQ+UbT2C4bOzLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XIeX9PTH
Subject: [Buildroot] [PATCH 2/2] configs/pine64-star64: new defconfig
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a new defconfig for the Star64 board made by Pine64. This
board is based on the Starfive JH7110 RISC-V 64 bits SoC.
https://wiki.pine64.org/wiki/STAR64
This patch uses a custom Kernel and U-Boot made for this board. The SPL
has to be signed with the Starfive SPL-Tool which is a software
provided by the vendor to get the necessary headers on the SPL.
The image configuration is based on the work done by Ivan Velickovic
<i.velickovic@unsw.edu.au>.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 DEVELOPERS                                    |  2 ++
 board/pine64/star64/genimage.cfg              | 24 +++++++++++++
 .../overlay/boot/extlinux/extlinux.conf       |  4 +++
 board/pine64/star64/post-build.sh             |  9 +++++
 board/pine64/star64/readme.txt                | 32 +++++++++++++++++
 .../pine64/star64/star64-uboot-fit-image.its  | 29 +++++++++++++++
 configs/pine64_star64_defconfig               | 36 +++++++++++++++++++
 7 files changed, 136 insertions(+)
 create mode 100644 board/pine64/star64/genimage.cfg
 create mode 100644 board/pine64/star64/overlay/boot/extlinux/extlinux.conf
 create mode 100755 board/pine64/star64/post-build.sh
 create mode 100644 board/pine64/star64/readme.txt
 create mode 100644 board/pine64/star64/star64-uboot-fit-image.its
 create mode 100644 configs/pine64_star64_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index b8ec27f623..947aa58566 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2954,6 +2954,8 @@ F:	package/ranger/
 F:	package/x265/
 
 N:	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+F:	board/pine64/star64
+F:	configs/pine64_star64_defconfig
 F:	package/starfive-spltool/
 
 N:	Thomas Claveirole <thomas.claveirole@green-communications.fr>
diff --git a/board/pine64/star64/genimage.cfg b/board/pine64/star64/genimage.cfg
new file mode 100644
index 0000000000..74940016f4
--- /dev/null
+++ b/board/pine64/star64/genimage.cfg
@@ -0,0 +1,24 @@
+# SD card image for the Pine64 Star64 board
+
+image sdcard.img {
+        hdimage {
+                partition-table-type = "gpt"
+        }
+
+        partition spl {
+                image = "u-boot-spl.bin.normal.out"
+                partition-type-uuid = 2E54B353-1271-4842-806F-E436D6AF6985
+                offset = 2M
+        }
+
+        partition uboot {
+                image = "opensbi_uboot_payload.img"
+                partition-type-uuid = 5B193300-FC78-40CD-8002-E86C45580B47
+                offset = 4M
+        }
+
+        partition rootfs {
+                image = "rootfs.ext4"
+                bootable = true
+        }
+}
diff --git a/board/pine64/star64/overlay/boot/extlinux/extlinux.conf b/board/pine64/star64/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..db7cfb7b8b
--- /dev/null
+++ b/board/pine64/star64/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label star64
+  kernel /boot/Image
+  devicetree /boot/jh7110-pine64-star64.dtb
+  append root=/dev/mmcblk1p3 earlycon=sbi
diff --git a/board/pine64/star64/post-build.sh b/board/pine64/star64/post-build.sh
new file mode 100755
index 0000000000..ed0a6ebd52
--- /dev/null
+++ b/board/pine64/star64/post-build.sh
@@ -0,0 +1,9 @@
+#!/bin/bash
+BOARD_DIR="$CONFIG_DIR"/board/pine64/star64
+
+# Add header to the SPL
+"$HOST_DIR"/bin/spl_tool -c -f "$BINARIES_DIR"/u-boot-spl.bin
+
+# Create the u-boot FIT image
+cp "$BOARD_DIR"/star64-uboot-fit-image.its "$BINARIES_DIR"
+mkimage -f "$BINARIES_DIR"/star64-uboot-fit-image.its -A riscv -O u-boot -T firmware "$BINARIES_DIR"/opensbi_uboot_payload.img
diff --git a/board/pine64/star64/readme.txt b/board/pine64/star64/readme.txt
new file mode 100644
index 0000000000..5e6ce25108
--- /dev/null
+++ b/board/pine64/star64/readme.txt
@@ -0,0 +1,32 @@
+Pine64 Star64
+=============
+
+The Star64 is a low-cost RISC-V 64-bit based platform, powered by a
+Starfive JH7110 processor.
+
+https://wiki.pine64.org/wiki/STAR64
+
+How to build
+============
+
+$ make pine64_star64_defconfig
+$ make
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX conv=fdatasync
+
+Preparing the board
+===================
+
+Connect a TTL UART cable to pin 6 (GND), 8 (TX) and 10 (RX).
+
+Insert your SD card.
+
+Power-up the board using a 12V power supply.
diff --git a/board/pine64/star64/star64-uboot-fit-image.its b/board/pine64/star64/star64-uboot-fit-image.its
new file mode 100644
index 0000000000..08f603163a
--- /dev/null
+++ b/board/pine64/star64/star64-uboot-fit-image.its
@@ -0,0 +1,29 @@
+/dts-v1/;
+
+/ {
+	description = "U-boot-spl FIT image for JH7110 Pine64 Star64";
+	#address-cells = <2>;
+
+	images {
+		firmware {
+			description = "u-boot";
+			data = /incbin/("fw_payload.bin");
+			type = "firmware";
+			arch = "riscv";
+			os = "u-boot";
+			load = <0x0 0x40000000>;
+			entry = <0x0 0x40000000>;
+			compression = "none";
+		};
+	};
+
+	configurations {
+		default = "config-1";
+
+		config-1 {
+			description = "U-boot-spl FIT config for JH7110 Pine64 Star64";
+			firmware = "firmware";
+		};
+	};
+};
+
diff --git a/configs/pine64_star64_defconfig b/configs/pine64_star64_defconfig
new file mode 100644
index 0000000000..5d5eec508c
--- /dev/null
+++ b/configs/pine64_star64_defconfig
@@ -0,0 +1,36 @@
+BR2_riscv=y
+
+# Kernel configuration
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Fishwaldo,Star64_linux,1456c984f15e21e28fb8a9ce96d0ca10e61a71c4)/linux-1456c984f15e21e28fb8a9ce96d0ca10e61a71c4.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="pine64_star64"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7110-pine64-star64"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# OpenSBI configuration
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_UBOOT_PAYLOAD=y
+BR2_TARGET_OPENSBI_PLAT="generic"
+
+# U-Boot configuration
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Fishwaldo,u-boot,172b47f62039605d6806fa96bd403c21cda28996)/u-boot-172b47f62039605d6806fa96bd403c21cda28996.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pine64_star64"
+BR2_TARGET_UBOOT_SPL=y
+
+# Misc
+BR2_ROOTFS_OVERLAY="board/pine64/star64/overlay/"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_STARFIVE_SPLTOOL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="100M"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/star64/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/pine64/star64/post-build.sh"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
