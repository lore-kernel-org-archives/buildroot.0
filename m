Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14935CFB42B
	for <buildroot@archiver.kernel.org>; Sat,  5 Oct 2024 19:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1560400F9;
	Sat,  5 Oct 2024 19:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1EgKC-F69GFO; Sat,  5 Oct 2024 19:10:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 570AC4026A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 570AC4026A;
	Sat,  5 Oct 2024 19:10:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 986E51BF2CB
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 19:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88C21810ED
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 19:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJaHo43-WaSx for <buildroot@lists.busybox.net>;
 Sat,  5 Oct 2024 19:10:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4C08F810DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C08F810DB
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C08F810DB
 for <buildroot@buildroot.org>; Sat,  5 Oct 2024 19:10:52 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42cb1758e41so24076155e9.1
 for <buildroot@buildroot.org>; Sat, 05 Oct 2024 12:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728155450; x=1728760250;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B/71KmLBArBx7yyD33Zk3Zo/kTvk8Y3ZvXN6sBNALSM=;
 b=a8HrVcjuY12KSjSf+SG1YduagRieTv1Kg38HRwJ1hiM3JypI2ksfinQbWISPtmV90t
 jZeavfccnDXMFT6OilMz5JVze9gkYA9BIOD/Ud0RKrWHjJOH0/8T/YpdmS5et7dI9y1d
 2+cIfb0eRwKeigdGJcylKeWD7Yy3xlE6YDnU62vDrwtEDQ25BtkXehUMS+h/HBFcFe4e
 ChCVgoMbB45zAWtAscAMh3/I+UeloF2k2z+g6FRmnC58JfjVeolwRXaqFbNsNAvjAP3T
 cQLUAi4+xT/PD2IZ8wi2HHMcJUb0oRxRr85CdI9q9aN6xidD9ntnapKVO8RgC7On9rJB
 dstQ==
X-Gm-Message-State: AOJu0YxmH+65m9N4EJzzkx/NppCp1YimLKRXLK3oVi9IzDLnFolN+Ogs
 9VbhZaQQ77qe8HJJOSCevEpz2SNxAeqFMYCAHnxNv8dEq1nqjSGbLxFWtyD6OPoWd2WIlG9GMP/
 17xA=
X-Google-Smtp-Source: AGHT+IH66F8eNlSaj+vgqQlkv3rXnybL62vgR0d2L8SOm+vKUj0c38qyCfRqEWuV7iO7dXNkPV1Vsw==
X-Received: by 2002:a05:600c:45c6:b0:426:51dc:f6cd with SMTP id
 5b1f17b1804b1-42f85abebdcmr43204185e9.18.1728155449778; 
 Sat, 05 Oct 2024 12:10:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.248])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f89ed957asm28805865e9.44.2024.10.05.12.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2024 12:10:48 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  5 Oct 2024 21:10:43 +0200
Message-ID: <20241005191043.2141597-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728155450; x=1728760250;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B/71KmLBArBx7yyD33Zk3Zo/kTvk8Y3ZvXN6sBNALSM=;
 b=B5F99wSCu5LkldPcT+re8NaPPQOw1oPriQPqOPkXK3naHM+OPLUbELGITB6nKG36r9
 8/BQX/ZPq2jZzTGrCkiLLf8xj0bpq3diaEu4zW0Fo451J67DA9GxNeMbdsjGSJcH7OXr
 WBjnJ+2ucoWMA6Mkp4Z/fkMFsojgVq29JAUeg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=B5F99wSC
Subject: [Buildroot] [PATCH 1/1] board/stm32f469-disco: move kernel and DTB
 to rootfs partition
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch, following the suggestion expressed in the review [1] for the
stm32f746-disco board support, moves the Linux kernel and the related
device tree to the ext4 rootfs partition. By doing so, the vfat partition,
improperly called u-boot, no longer makes sense and can therefore be
removed. From now on, U-Boot will load the kernel and the device tree
from the ext4 rootfs partition.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20240822183742.3550055-3-dario.binacchi@amarulasolutions.com/
Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f469-disco/extlinux.conf               |  6 +++---
 .../stm32f469-disco/genimage.cfg                | 17 -----------------
 .../stm32f469-disco/post-build.sh               |  2 +-
 configs/stm32f469_disco_sd_defconfig            |  3 +--
 4 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/extlinux.conf b/board/stmicroelectronics/stm32f469-disco/extlinux.conf
index 1c2db4383ba5..65aa286a7a9d 100644
--- a/board/stmicroelectronics/stm32f469-disco/extlinux.conf
+++ b/board/stmicroelectronics/stm32f469-disco/extlinux.conf
@@ -1,4 +1,4 @@
 label stm32f469-disco-buildroot
-  kernel /zImage
-  devicetree /stm32f469-disco.dtb
-  append console=ttySTM0,115200 root=/dev/mmcblk0p2 rw rootfstype=ext2 rootwait earlyprintk consoleblank=0 ignore_loglevel
+  kernel /boot/zImage
+  devicetree /boot/stm32f469-disco.dtb
+  append console=ttySTM0,115200 root=/dev/mmcblk0p1 rw rootfstype=ext2 rootwait earlyprintk consoleblank=0 ignore_loglevel
diff --git a/board/stmicroelectronics/stm32f469-disco/genimage.cfg b/board/stmicroelectronics/stm32f469-disco/genimage.cfg
index 517ead7751e6..e911a94e46b5 100644
--- a/board/stmicroelectronics/stm32f469-disco/genimage.cfg
+++ b/board/stmicroelectronics/stm32f469-disco/genimage.cfg
@@ -1,24 +1,7 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"stm32f469-disco.dtb",
-			"extlinux"
-		}
-	}
-
-	size = 16M
-}
-
 image sdcard.img {
 	hdimage {
 	}
 
-	partition u-boot {
-		partition-type = 0xC
-		image = "boot.vfat"
-	}
-
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext2"
diff --git a/board/stmicroelectronics/stm32f469-disco/post-build.sh b/board/stmicroelectronics/stm32f469-disco/post-build.sh
index ec20fca7d964..c4d155f350d7 100755
--- a/board/stmicroelectronics/stm32f469-disco/post-build.sh
+++ b/board/stmicroelectronics/stm32f469-disco/post-build.sh
@@ -1,4 +1,4 @@
 #!/bin/sh
 BOARD_DIR="$(dirname $0)"
 
-install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
+install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${TARGET_DIR}"/boot/extlinux/extlinux.conf
diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index c00c043896a3..97dbce5d46c1 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/busybox.fragment"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_EXT2=y
@@ -26,7 +27,5 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_OPENOCD=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
