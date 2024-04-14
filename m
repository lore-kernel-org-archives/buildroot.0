Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D4FC4345F
	for <buildroot@archiver.kernel.org>; Sun, 14 Apr 2024 19:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 849E4606A0;
	Sun, 14 Apr 2024 19:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zX27KgILjXw; Sun, 14 Apr 2024 19:07:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 862A1606B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 862A1606B6;
	Sun, 14 Apr 2024 19:07:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 52E411BF3D1
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 19:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40013400E2
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 19:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z4xZ3GxHdZD7 for <buildroot@lists.busybox.net>;
 Sun, 14 Apr 2024 19:07:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=tekieli.lukasz@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D9670400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9670400B5
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9670400B5
 for <buildroot@buildroot.org>; Sun, 14 Apr 2024 19:06:59 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a52223e004dso271131966b.2
 for <buildroot@buildroot.org>; Sun, 14 Apr 2024 12:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713121617; x=1713726417;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eUxy0LLc+bxNuh6Ak0B0ucV/s3QVhiVE3CRHEqr1+/o=;
 b=MvSplsbUtb9d8olMAoNIdKOqXs6MntS8KlfSj7PuGA3oZVnPokAaAAw3cL30GWx7AD
 +uP1lkOR9MV3zRQpTgwW5hjiRUsFgDE7qKAtT85uj3+VDAVr2H8cEAxgZalmUbztskkz
 WTpJSle8i2JxPpRwMTsP/s/qMDTDlKIGZhfaW3KtlUlUPU8xTAMZmjx0K8cfIAOQmsrk
 lE5wcUKIP8++jPJG4qOynZDtSzTGhl/wNRc9yvMzRhbBrxtoounkXAe/d7/dqKC4fWkb
 6JRREWVihVsFvuWoPhlgx46yor2fnKcqlTKpxJgBzBk/701FeWpi9lsYDvFPYeYUsrMa
 R39Q==
X-Gm-Message-State: AOJu0YzUbe1GEWpDPYm9QnzeSgF+46giK3T5A30RATS2W2q/GSCNOrbd
 CdoTo6z9NCv62f3K7d00TbtnrLjY+pGuMDA/rS6YDV64gDWUfTPyVx0VBg==
X-Google-Smtp-Source: AGHT+IFN9djKbtdA0+cJLQTp2BlnvMaMCMUyOyFLbrGnVCbUInyiPrLnWcILu/oYT5HCK4l/apshMQ==
X-Received: by 2002:a17:906:46ca:b0:a52:b73:cc16 with SMTP id
 k10-20020a17090646ca00b00a520b73cc16mr5596530ejs.44.1713121617343; 
 Sun, 14 Apr 2024 12:06:57 -0700 (PDT)
Received: from yoga7.fritz.box (ip5f5bff47.dynamic.kabel-deutschland.de.
 [95.91.255.71]) by smtp.gmail.com with ESMTPSA id
 cx10-20020a170906c80a00b00a51b5282837sm4545776ejb.15.2024.04.14.12.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Apr 2024 12:06:56 -0700 (PDT)
From: Lukasz Tekieli <tekieli.lukasz@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Apr 2024 21:06:44 +0200
Message-Id: <20240414190644.1059171-1-tekieli.lukasz@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713121617; x=1713726417; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eUxy0LLc+bxNuh6Ak0B0ucV/s3QVhiVE3CRHEqr1+/o=;
 b=dLCZOSK8bnCrwoDSSO2YEAuChJZ44i0iisRyBs07wbyzAEQM2QTl/eNEPQy8SEIuFS
 NKssJ7nf3BS5EvZ0NnY/C8TyqZGrQlQbHvQtyIo60ziqLy9cLbfGq8kmz7cVQVIhZJRx
 7PQMglSb7SKczRqsB3993QpQz+TfgZkRmJ5Z+WpU9YAFUdk7qaYPL/GBZAbf/T71u39F
 f/x7gCUBIqS7N64k4UzUlbzQtTwaL0/qMp82Jzc1jzlb2wg7Q/e/EHAypDtozp/MehIS
 7DGkUnJoacSSmWK0FftP5igznMD2fWRv68CxAB1sJ66JiJDtUVmPbZ4nHmyBnThpA8aL
 mOAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dLCZOSK8
Subject: [Buildroot] [PATCH 1/1] board/visionfive2: add spi-nor image
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
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Lukasz Tekieli <tekieli.lukasz@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Builds the spi-nor.img together with the sdcard.img.
Readme is extended with SPI NOR flash writing instructions
and recovery.

The spi-nor.img layout is based on the following document:

https://doc-en.rvspace.org/VisionFive2/Boot_UG/JH7110_SDK/boot_address_allocation.html

Signed-off-by: Lukasz Tekieli <tekieli.lukasz@gmail.com>
---
 board/visionfive2/genimage_spi-nor.cfg | 36 ++++++++++++++++++++++++++
 board/visionfive2/post-image.sh        |  4 +++
 board/visionfive2/readme.txt           | 25 +++++++++++++++---
 configs/visionfive2_defconfig          |  3 +--
 4 files changed, 62 insertions(+), 6 deletions(-)
 create mode 100644 board/visionfive2/genimage_spi-nor.cfg
 create mode 100755 board/visionfive2/post-image.sh

diff --git a/board/visionfive2/genimage_spi-nor.cfg b/board/visionfive2/genimage_spi-nor.cfg
new file mode 100644
index 0000000000..8b1d13989a
--- /dev/null
+++ b/board/visionfive2/genimage_spi-nor.cfg
@@ -0,0 +1,36 @@
+flash nor-16M-256 {
+	pebsize = 4K
+	minimum-io-unit-size = 256
+	numpebs = 4096
+}
+
+image spi-nor.img {
+	size = 16M
+
+	flash {
+	}
+
+	flashtype = "nor-16M-256"
+
+	partition spl {
+		image = "u-boot-spl.bin.normal.out"
+		offset = 0K
+		size = 512K
+	}
+
+	partition uboot-env {
+		offset = 960K
+		size = 64K
+	}
+
+	partition uboot {
+		image = "u-boot.itb"
+		offset = 1M
+		size = 4M
+	}
+
+	partition reserved-data {
+		offset = 6M
+		size = 10M
+	}
+}
diff --git a/board/visionfive2/post-image.sh b/board/visionfive2/post-image.sh
new file mode 100755
index 0000000000..3da106dc26
--- /dev/null
+++ b/board/visionfive2/post-image.sh
@@ -0,0 +1,4 @@
+#!/bin/bash
+
+support/scripts/genimage.sh -c board/visionfive2/genimage.cfg
+support/scripts/genimage.sh -c board/visionfive2/genimage_spi-nor.cfg
diff --git a/board/visionfive2/readme.txt b/board/visionfive2/readme.txt
index 85be1d5dfc..31edef02e4 100644
--- a/board/visionfive2/readme.txt
+++ b/board/visionfive2/readme.txt
@@ -12,12 +12,27 @@ How to build
 $ make visionfive2_defconfig
 $ make
 
+Once the build process is finished you will have two images
+in the output/images/ directory:
+- sdcard.img
+- spi-nor.img
+
+How to write the SPI NOR flash
+=============================
+
+If you have a booting device use u-boot and tftp:
+
+  # tftpboot 0x82000000 spi-nor.img
+  # sf probe
+  # sf update 0x82000000 0x0 {filesize}
+
+Otherwise, follow the recovery instruction:
+
+https://doc-en.rvspace.org/VisionFive2/Quick_Start_Guide/VisionFive2_SDK_QSG/recovering_bootloader%20-%20vf2.html
+
 How to write the SD card
 ========================
 
-Once the build process is finished you will have an image called "sdcard.img"
-in the output/images/ directory.
-
 Copy the bootable "sdcard.img" onto an SD card with "dd":
 
   $ sudo dd if=output/images/sdcard.img of=/dev/sdX
@@ -27,7 +42,9 @@ Preparing the board
 
 Connect a TTL UART cable to pin 6 (GND), 8 (TX) and 10 (RX).
 
-Change the boot mode pins to SD card booting (RGPIO_0=1, GRPIO_1=0):
+Use the correct mode for booting:
+- SD card RGPIO_0=1, GRPIO_1=0
+- SPI NOR flash RGPIO_0=1, GRPIO_1=1
 
 https://doc-en.rvspace.org/VisionFive2/Quick_Start_Guide/VisionFive2_SDK_QSG/boot_mode_settings.html
 
diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index c8576a35a7..699ea8dd4b 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -2,8 +2,7 @@ BR2_riscv=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/visionfive2/overlay"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/visionfive2/genimage.cfg"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/visionfive2/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,linux,05533e9c31d6f0da20efc2d436a3b0f6d516ed4b)/linux-05533e9c31d6f0da20efc2d436a3b0f6d516ed4b.tar.gz"
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
