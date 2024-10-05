Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB49CFB42B
	for <buildroot@archiver.kernel.org>; Sat,  5 Oct 2024 19:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC3224037C;
	Sat,  5 Oct 2024 19:15:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WwWBBxGZZNVK; Sat,  5 Oct 2024 19:15:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C6FB40497
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C6FB40497;
	Sat,  5 Oct 2024 19:15:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD8761BF2CB
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 19:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BED1C81155
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 19:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 62uzjZD5ITmG for <buildroot@lists.busybox.net>;
 Sat,  5 Oct 2024 19:15:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 969858113E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 969858113E
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 969858113E
 for <buildroot@buildroot.org>; Sat,  5 Oct 2024 19:15:36 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-37cd0b5515fso1887743f8f.2
 for <buildroot@buildroot.org>; Sat, 05 Oct 2024 12:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728155734; x=1728760534;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OMzjLe3QIioxL0y52eyK3WmPUMbZkYhmv4aCMJXdRck=;
 b=ADPdPwdUNuiDXgfzXS1qiTfUYz3KGuMUTCFtd98qF1e7CKOnWOn0OtAiTab2UhL6FD
 tVuzgOm+HdOj8kAwWJFoJc0+UIm+KesLaDJXBIn1o4p+rK9lwT1g8DYIZXki9XZfcqOs
 u0Iou3fQEWrA9LMyrNNERRqhqL9WzDD/njXB6tJre0uu2TJTZYObOA9cjUzhTeM/JmEd
 j40DGeEFMBPSZCrzddD4ZfM3dDSaTG/7VNc+ALGEEZFrVuWRA01LtQfcD1IyqGfXhoVy
 9AGPQL9+tSWwAwhPr7j2J1YBnZ0hMqzqJ37OtZx8ui/VyOjrL/bwpJyko6stCNTCiWdJ
 O4vg==
X-Gm-Message-State: AOJu0Yw1vmOON4Yv2qfCd5tBOw195At6ETz4r5WlDfrCRJR5POdNH1JL
 EflhvYVPVRX8mRTyKPrn3Zr/5z2jWwjb2dSz3iV28EnRwoJ4nn4rOqXLyXl1sOYET31lofw+0Bh
 Wdv4=
X-Google-Smtp-Source: AGHT+IGuiKV4ngcBPbcrTGDHe10Ky57I9ICJI3Vm9VUm23xXXFI2dMPTGoJUlfpzGJZzJfK62oYwwQ==
X-Received: by 2002:a5d:5306:0:b0:37c:c842:a16e with SMTP id
 ffacd0b85a97d-37d0e6f28a5mr4083870f8f.5.1728155734009; 
 Sat, 05 Oct 2024 12:15:34 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.248])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d16920be2sm2264398f8f.60.2024.10.05.12.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2024 12:15:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  5 Oct 2024 21:15:28 +0200
Message-ID: <20241005191528.2142818-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728155734; x=1728760534;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OMzjLe3QIioxL0y52eyK3WmPUMbZkYhmv4aCMJXdRck=;
 b=nFERJwyQAQYTw0Ks40fPbQ7EXQQ3yS9yL1Tur7uTVdwsFGBZLWWzh+43wRFyV39GDO
 MqjpXA5DSUM9Hq50dfyZnLWbKJAaOE06outJ7S+LNM0x901KMAykgLS35Nx83qvvKA6H
 7LNZ2unANE0USZ6OPBoLg4TOMN0+2i+B07CPw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=nFERJwyQ
Subject: [Buildroot] [PATCH 1/1] board/stm32f769-disco: move kernel and DTB
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
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
 .../stm32f769-disco/extlinux.conf               |  6 +++---
 .../stm32f769-disco/genimage.cfg                | 17 -----------------
 .../stm32f769-disco/post-build.sh               |  2 +-
 configs/stm32f769_disco_sd_defconfig            |  3 +--
 4 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/board/stmicroelectronics/stm32f769-disco/extlinux.conf b/board/stmicroelectronics/stm32f769-disco/extlinux.conf
index 48483a01fc4e..edc1582615da 100644
--- a/board/stmicroelectronics/stm32f769-disco/extlinux.conf
+++ b/board/stmicroelectronics/stm32f769-disco/extlinux.conf
@@ -1,4 +1,4 @@
 label stm32f769-disco-buildroot
-  kernel /zImage
-  devicetree /stm32f769-disco.dtb
-  append console=ttySTM0,115200 root=/dev/mmcblk0p2 rw rootfstype=ext2 rootwait earlyprintk consoleblank=0 ignore_loglevel
+  kernel /boot/zImage
+  devicetree /boot/stm32f769-disco.dtb
+  append console=ttySTM0,115200 root=/dev/mmcblk0p1 rw rootfstype=ext2 rootwait earlyprintk consoleblank=0 ignore_loglevel
diff --git a/board/stmicroelectronics/stm32f769-disco/genimage.cfg b/board/stmicroelectronics/stm32f769-disco/genimage.cfg
index 41f9da512489..e911a94e46b5 100644
--- a/board/stmicroelectronics/stm32f769-disco/genimage.cfg
+++ b/board/stmicroelectronics/stm32f769-disco/genimage.cfg
@@ -1,24 +1,7 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"stm32f769-disco.dtb",
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
diff --git a/board/stmicroelectronics/stm32f769-disco/post-build.sh b/board/stmicroelectronics/stm32f769-disco/post-build.sh
index c8cca3de8c9b..45100509411b 100755
--- a/board/stmicroelectronics/stm32f769-disco/post-build.sh
+++ b/board/stmicroelectronics/stm32f769-disco/post-build.sh
@@ -4,4 +4,4 @@ BOARD_DIR="$(dirname "$0")"
 # Kernel is built without devpts support
 sed -i '/^devpts/d' "${TARGET_DIR}"/etc/fstab
 
-install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${BINARIES_DIR}"/extlinux/extlinux.conf
+install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${TARGET_DIR}"/boot/extlinux/extlinux.conf
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index 2ec2687334c1..386a5d68e82a 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f769-disco"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
@@ -25,7 +26,5 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f769-disco"
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
