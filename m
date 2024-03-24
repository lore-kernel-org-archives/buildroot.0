Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14F5C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 07:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AE8D406BD;
	Sun, 24 Mar 2024 07:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FrPnQ7SLEI8S; Sun, 24 Mar 2024 07:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21B67406BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21B67406BF;
	Sun, 24 Mar 2024 07:59:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A7121BF3C1
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 07:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D1B6605C1
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 07:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNlNpYxDNc6U for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 07:58:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B30C60597
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B30C60597
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 07:58:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4023083A17; Sun, 24 Mar 2024 07:58:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 08:58:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d4874819948a654510bea71a7d5e3db7ff10bee
X-Git-Newrev: 6dfeb165ee9170920e9a0b1f021170a736ac4d73
X-Patchwork-Hint: ignore
Message-Id: <20240324075859.4023083A17@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/visionfive2: enable u-boot
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6dfeb165ee9170920e9a0b1f021170a736ac4d73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enables U-Boot and required OpenSBI builds for the VisionFive2. Changes
the sdcard.img to use GPT and adds the SPL and U-Boot to partitions
specified in U-Boot's documentation for the board:

https://docs.u-boot.org/en/v2024.01/board/starfive/visionfive2.html

U-Boot config uses BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME with value
"u-boot.itb". Using BR2_TARGET_UBOOT_FORMAT_ITB fails, because the
build does not support u-boot.itb make target.

Signed-off-by: Lukasz Tekieli <tekieli.lukasz@gmail.com>
[Peter: document boot mode setting, add U-Boot documentation link]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/visionfive2/genimage.cfg | 16 +++++++++-------
 board/visionfive2/readme.txt   |  4 ++++
 configs/visionfive2_defconfig  | 19 +++++++++++++++++++
 3 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/board/visionfive2/genimage.cfg b/board/visionfive2/genimage.cfg
index c221b49c7b..8133e740c0 100644
--- a/board/visionfive2/genimage.cfg
+++ b/board/visionfive2/genimage.cfg
@@ -2,20 +2,22 @@
 
 image sdcard.img {
 	hdimage {
+		partition-table-type = "gpt"
 	}
 
-	# u-boot is hard coded to look at 3rd partition
-	partition dummy1 {
-		size = 512
+	partition spl {
+		partition-type-uuid = 2E54B353-1271-4842-806F-E436D6AF6985
+		image = "u-boot-spl.bin.normal.out"
 	}
 
-	partition dummy2 {
-		size = 512
+	partition uboot {
+		partition-type-uuid = BC13C2FF-59E6-4262-A352-B275FD6F7172
+		image = "u-boot.itb"
 	}
 
 	partition rootfs {
-		partition-type = 0x83
+		partition-type-uuid = 0FC63DAF-8483-4772-8E79-3D69D8477DE4
+		bootable = true
 		image = "rootfs.ext4"
-		bootable = "true"
 	}
 }
diff --git a/board/visionfive2/readme.txt b/board/visionfive2/readme.txt
index 1924cbc12b..85be1d5dfc 100644
--- a/board/visionfive2/readme.txt
+++ b/board/visionfive2/readme.txt
@@ -27,6 +27,10 @@ Preparing the board
 
 Connect a TTL UART cable to pin 6 (GND), 8 (TX) and 10 (RX).
 
+Change the boot mode pins to SD card booting (RGPIO_0=1, GRPIO_1=0):
+
+https://doc-en.rvspace.org/VisionFive2/Quick_Start_Guide/VisionFive2_SDK_QSG/boot_mode_settings.html
+
 Insert your SD card.
 
 Power-up the board using an USB-C cable.
diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index 3a1a4f527c..c8576a35a7 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -15,4 +15,23 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.4"
+BR2_TARGET_OPENSBI_PLAT="generic"
+# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
+BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES="FW_TEXT_START=0x40000000 FW_OPTIONS=0"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="starfive_visionfive2"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin.normal.out"
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
