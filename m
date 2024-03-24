Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98294C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 17:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EEDB40469;
	Sun, 24 Mar 2024 17:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A62xYszfPuTO; Sun, 24 Mar 2024 17:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C08D240A78
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C08D240A78;
	Sun, 24 Mar 2024 17:11:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 035B21BF40A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E26E4606D4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NZwAX-0X-k3Y for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 17:11:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 099A2606EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 099A2606EA
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 17:11:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBE9A83C5E; Sun, 24 Mar 2024 17:11:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 17:18:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21629634adee2e0c5541ff1d74b8bd297676815f
X-Git-Newrev: b9b40901d1bd27aef9de13391956c959899581c6
X-Patchwork-Hint: ignore
Message-Id: <20240324171116.EBE9A83C5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/avenger96_defconfig: bump ATF
 version to v2.8 LTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9b40901d1bd27aef9de13391956c959899581c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch upgrades the ATF version to the v2.8 LTS version. Please note
that due to DTS changes from upstream commit
51e223058fe70b311542178f1865514745fa7874 ("feat(stm32mp15-fdts): add
Avenger96 board with STM32MP157A DHCOR SoM") The ATF additional build
variable is also modified to use the new DTS file. Note that the old DTS
file still exists, but no longer works.

Furthermore, the 'E=0' flag is removed from ATF additional build
variable. It was added by commit
deb8d71c9285eb60bc3d28e8abcf7208f78980a7 to avoid TFA build
failure because of '-Werror' flag. However, from version v2.6 or later,
it is not required anymore, the compiler warning was fixed.

The ATF patch
"board/arrow/avenger96/patches/arm-trusted-firmware/
0001-stm32mp157a-avenger96.dts-enable-hash-device-to-unbr.patch" also
has been removed. As it was not required due to using the new dhcore DTS
file for the ATF build.

Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
[Arnout: switch to
BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION instead of custom
lts-v2.8.16]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...-avenger96.dts-enable-hash-device-to-unbr.patch | 51 ----------------------
 configs/avenger96_defconfig                        |  5 +--
 2 files changed, 2 insertions(+), 54 deletions(-)

diff --git a/board/arrow/avenger96/patches/arm-trusted-firmware/0001-stm32mp157a-avenger96.dts-enable-hash-device-to-unbr.patch b/board/arrow/avenger96/patches/arm-trusted-firmware/0001-stm32mp157a-avenger96.dts-enable-hash-device-to-unbr.patch
deleted file mode 100644
index 8cec0af3b1..0000000000
--- a/board/arrow/avenger96/patches/arm-trusted-firmware/0001-stm32mp157a-avenger96.dts-enable-hash-device-to-unbr.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 336dc301e02d64507447f82020ce7a349797bef3 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Sun, 5 Nov 2023 14:59:16 +0100
-Subject: [PATCH] stm32mp157a-avenger96.dts: enable hash device to unbreak boot
- issue
-
-The avenger96 board was forgotten when authentication support was added with
-commit 4bdb1a7a6a1325343 (stm32mp1: add authentication support for
-stm32image), causing a panic when stm32mp_init_auth() is called, so fix it
-similar to how it was done for the STM32MP157C-ED1 board with:
-
-commit b37b52ef8bc05bfd8dcca992d4ba84cd7c5d23bb
-Author: Yann Gautier <yann.gautier@st.com>
-Date:   Tue Oct 13 18:05:06 2020 +0200
-
-    fdts: add missing hash node in STM32MP157C-ED1 board DT
-
-    Without this node, the board fails to boot and panics in the function
-    stm32mp_init_auth().
-
-    Change-Id: Ia54924410dac2a8c94dd6e45d7e93977fe7d87e2
-    Signed-off-by: Yann Gautier <yann.gautier@st.com>
-
-Upstream: N/A - Upstream reworked authentication to skip it for MP157A
- variant since v2.7, see "feat(st): disable authentication based on
- part_number"
- (https://github.com/ARM-software/arm-trusted-firmware/commit/49abdfd8cececb91a4bc7e7b29a30c09dce461c7)
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- fdts/stm32mp157a-avenger96.dts | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/fdts/stm32mp157a-avenger96.dts b/fdts/stm32mp157a-avenger96.dts
-index b967736e4..76edecb83 100644
---- a/fdts/stm32mp157a-avenger96.dts
-+++ b/fdts/stm32mp157a-avenger96.dts
-@@ -271,6 +271,10 @@
- 	};
- };
- 
-+&hash1 {
-+	status = "okay";
-+};
-+
- &rng1 {
- 	status = "okay";
- };
--- 
-2.39.2
-
diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index 218955fc02..f73b654dc8 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -6,7 +6,6 @@ BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System configuration
-BR2_GLOBAL_PATCH_DIR="board/arrow/avenger96/patches"
 BR2_ROOTFS_OVERLAY="board/arrow/avenger96/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
 
@@ -29,13 +28,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # Bootloaders
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="lts-v2.8.16"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-nodtb.bin"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-avenger96.dtb E=0 BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-dhcor-avenger96.dtb BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin *.stm32"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
