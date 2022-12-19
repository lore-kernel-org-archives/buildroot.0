Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84388C4332F
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 08:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEEC9408FA;
	Mon, 19 Dec 2022 08:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEEC9408FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3psNWoKtx2QU; Mon, 19 Dec 2022 08:57:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1D80408F7;
	Mon, 19 Dec 2022 08:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1D80408F7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A95D1BF31B
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 08:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54588408F7
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 08:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54588408F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AnxXOtbIPAUu for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 08:57:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C8D240327
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C8D240327
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 08:57:13 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so8283045wma.1
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 00:57:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kEUT7qntDDF60oyHaenCtda6NasjYZif6XoiUheeawY=;
 b=WHqhE7fWAeH0NbLac89+jn3Jb8iTkCLlzOZTKcfrc71hkyzW+uH99Qb/XTqoaEiaaA
 1NcUe81yYu2Z9p7qGkGF1peP7Z2825des1Eny2aVznjkV/7lOAc+BVMMT1TxcqX+MWt7
 Ug8Pl90LD0JD+w69TmGt6RJlT8t4CtjnZ9DWzKyrl46I+XGRSROMCA/CzYTEnQ5KwH6h
 iTgTaNRHkl9hpD83bvc3/4wsC5D/arQKShL1zY+XR1C5cP2egDQukkGy0a1z6fU473UL
 y89YPyVNh7rOQjNoBg1EM06xTzTTZO4h+IN2Ix70tYe0aL1GytbvqVzbJyJzr4i4ycGT
 6brQ==
X-Gm-Message-State: ANoB5pkWArLQJuOzZmxlahLF2lRvgXSbsM6EAAZPHCt3U5DV8zxl9OlE
 pRvzweO37RlmMwKxpjaSyAjBnLjH5V7hDg==
X-Google-Smtp-Source: AA0mqf4kLnZKkKzTli5lx8IeoC/Pu0IfCnuPm5xRkk0Tf32dIRH3iEiJnvFURhM0gawodTzSpw1viQ==
X-Received: by 2002:a05:600c:6549:b0:3cf:497c:c59e with SMTP id
 dn9-20020a05600c654900b003cf497cc59emr31509590wmb.6.1671440232271; 
 Mon, 19 Dec 2022 00:57:12 -0800 (PST)
Received: from comet.lan (lfbn-ren-1-1845-6.w83-199.abo.wanadoo.fr.
 [83.199.30.6]) by smtp.gmail.com with ESMTPSA id
 t7-20020a05600c198700b003c6f1732f65sm21022086wmq.38.2022.12.19.00.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 00:57:11 -0800 (PST)
From: Francois Dugast <francois.dugast.foss@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Dec 2022 09:57:10 +0100
Message-Id: <20221219085710.1163707-1-francois.dugast.foss@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kEUT7qntDDF60oyHaenCtda6NasjYZif6XoiUheeawY=;
 b=WTp+AjUeE40WnS/j+blPJAZPdZKnt6pjgkpCvz0a/eQ1SBhJBaXSiZsI9Yc4ZtPlHl
 RfhjnMYVXBrIHmzpGZvJfSbNI86PxjnII/+UQqsnDflPG7qyOUx95+mALHiZ1W4wG5O7
 sAWYVazprd577Wny4zJJLVhP2QykQXsLh9rBOIxcMGYEnhb9/pgJ1Yg62AOAjUrzeHMU
 ML2cALOItkG+i5vvxMgrkwreSmIrkrBhLlTXx1MuFLIfTBq79efTyvr4wxMgmbqPz8KP
 S18tscBV4pHguCDe3+bh8bGEPoB1fl2b7wr61NqHBNO0Wx+GxpdtYEoTqri0z18syRh9
 /VPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WTp+AjUe
Subject: [Buildroot] [PATCH 1/1] configs/visionfive2_defconfig: new defconfig
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
Cc: Francois Dugast <francois.dugast.foss@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a defconfig for the Starfive VisionFive2 board, a board built around the
Starfive JH7110 RISC-V 64bit SoC.

This board comes with functional lowlevel and U-Boot bootloaders in SPI
flash. The defconfig reuses these and only builds a (5.15 based) kernel and
rootfs.

The factory shipped U-Boot is hard coded to look at MMC partition 3.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
---
 board/visionfive2/genimage.cfg                | 21 +++++++++++++
 .../overlay/boot/extlinux/extlinux.conf       |  4 +++
 board/visionfive2/readme.txt                  | 30 +++++++++++++++++++
 configs/visionfive2_defconfig                 | 18 +++++++++++
 4 files changed, 73 insertions(+)
 create mode 100644 board/visionfive2/genimage.cfg
 create mode 100644 board/visionfive2/overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/visionfive2/readme.txt
 create mode 100644 configs/visionfive2_defconfig

diff --git a/board/visionfive2/genimage.cfg b/board/visionfive2/genimage.cfg
new file mode 100644
index 0000000000..c221b49c7b
--- /dev/null
+++ b/board/visionfive2/genimage.cfg
@@ -0,0 +1,21 @@
+# Minimal SD card image for the Starfive VisionFive2 board
+
+image sdcard.img {
+	hdimage {
+	}
+
+	# u-boot is hard coded to look at 3rd partition
+	partition dummy1 {
+		size = 512
+	}
+
+	partition dummy2 {
+		size = 512
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		bootable = "true"
+	}
+}
diff --git a/board/visionfive2/overlay/boot/extlinux/extlinux.conf b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..6e2c5660d6
--- /dev/null
+++ b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label linux
+  kernel /boot/Image
+  devicetree /boot/jh7110-visionfive-v2.dtb
+  append console=ttyS0,115200 root=/dev/mmcblk1p3
diff --git a/board/visionfive2/readme.txt b/board/visionfive2/readme.txt
new file mode 100644
index 0000000000..2da98f3847
--- /dev/null
+++ b/board/visionfive2/readme.txt
@@ -0,0 +1,30 @@
+Starfive VisionFive2
+====================
+
+The VisionFive2 is a low-cost RISC-V 64-bit based platform, powered by a
+Starfive JH7110 processor.
+
+How to build
+============
+
+$ make visionfive2_defconfig
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
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Preparing the board
+===================
+
+Connect a TTL UART cable to pin 6 (GND), 8 (TX) and 10 (RX).
+
+Insert your SD card.
+
+Power-up the board using an USB-C cable.
diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
new file mode 100644
index 0000000000..5b07a8efbc
--- /dev/null
+++ b/configs/visionfive2_defconfig
@@ -0,0 +1,18 @@
+BR2_riscv=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_OVERLAY="board/visionfive2/overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/visionfive/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,linux,7b7b4eddd8d5ae55f6e0ee09b93e16e23ab4f97b)/linux-7b7b4eddd8d5ae55f6e0ee09b93e16e23ab4f97b.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="starfive_visionfive2"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7110-visionfive-v2"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
