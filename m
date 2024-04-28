Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56839C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 18:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2688C60666;
	Sun, 28 Apr 2024 18:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1MFj0Vh_ZJv9; Sun, 28 Apr 2024 18:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7F9960761
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7F9960761;
	Sun, 28 Apr 2024 18:28:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26A031BF5A8
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E063881F6E
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NraZ6GdMTw60 for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 18:27:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 010FF81FC4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 010FF81FC4
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 18:27:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC230861F5; Sun, 28 Apr 2024 18:27:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Apr 2024 20:19:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 917078b57af0bca879bfa34be0f86cd9a0629534
X-Git-Newrev: 517f032992158d8f3aaee7d68cb417adf3d8fac7
X-Patchwork-Hint: ignore
Message-Id: <20240428182741.EC230861F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/visionfive2: add spi-nor image
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=517f032992158d8f3aaee7d68cb417adf3d8fac7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Builds the spi-nor.img together with the sdcard.img.
Readme is extended with SPI NOR flash writing instructions
and recovery.

The spi-nor.img layout is based on the following document:

https://doc-en.rvspace.org/VisionFive2/Boot_UG/JH7110_SDK/boot_address_allocation.html

Signed-off-by: Lukasz Tekieli <tekieli.lukasz@gmail.com>
[Arnout: extend readme.txt with paragraph that either boot mode works.]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 board/visionfive2/genimage_spi-nor.cfg | 36 ++++++++++++++++++++++++++++++++++
 board/visionfive2/post-image.sh        |  4 ++++
 board/visionfive2/readme.txt           | 28 ++++++++++++++++++++++----
 configs/visionfive2_defconfig          |  3 +--
 4 files changed, 65 insertions(+), 6 deletions(-)

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
index 85be1d5dfc..cc4fece6e9 100644
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
@@ -27,7 +42,12 @@ Preparing the board
 
 Connect a TTL UART cable to pin 6 (GND), 8 (TX) and 10 (RX).
 
-Change the boot mode pins to SD card booting (RGPIO_0=1, GRPIO_1=0):
+Use the correct mode for booting:
+- SD card RGPIO_0=1, GRPIO_1=0
+- SPI NOR flash RGPIO_0=1, GRPIO_1=1
+
+Note that Buildroot puts the bootloader both in SPI NOR and on the SD card,
+so after flashing as instructed above, either boot mode should work.
 
 https://doc-en.rvspace.org/VisionFive2/Quick_Start_Guide/VisionFive2_SDK_QSG/boot_mode_settings.html
 
diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index ff738cc3a3..69c44dfbdd 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -1,8 +1,7 @@
 BR2_riscv=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/visionfive2/overlay"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/visionfive2/genimage.cfg"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/visionfive2/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.2"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
