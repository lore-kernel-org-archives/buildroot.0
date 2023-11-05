Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D330C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 18:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2812381F3F;
	Sun,  5 Nov 2023 18:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2812381F3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6sxK9dF1blNN; Sun,  5 Nov 2023 18:37:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35E4481F3D;
	Sun,  5 Nov 2023 18:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35E4481F3D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 05BC51BF4D6
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D30B781F1F
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D30B781F1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BEYrin9C3kr3 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 18:37:26 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E8B981F2E
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 18:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E8B981F2E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 627991BF206;
 Sun,  5 Nov 2023 18:37:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1qzhzu-00FzQd-15;
 Sun, 05 Nov 2023 19:37:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 19:37:19 +0100
Message-Id: <20231105183719.3811015-4-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231105183719.3811015-1-peter@korsgaard.com>
References: <20231105183719.3811015-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH 4/4] configs/avenger96_defconfig: downgrade to
 TF-A v2.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 27bf08e4addb78 (configs/avenger96_defconfig: bump ATF version to 2.9
for binutils 2.39+ support) bumped TF-A, but it unfortunately does not boot
and instead dies with a panic:

NOTICE:  CPU: STM32MP157AAC Rev.B
NOTICE:  Model: Arrow Electronics STM32MP157A Avenger96 board
ERROR:   nvmem node board_id not found
INFO:    PMIC version = 0x10
ERROR:   Product_below_2v5=1:
ERROR:          HSLVEN update is destructive,
ERROR:          no update as VDD > 2.7V
PANIC at PC : 0x2fff086f

Exception mode=0x00000016 at: 0x2fff086f

Instead use v2.5 to match the other stm32mp1 boards and use the same E=0
-Werror workaround.  The avenger95 support is unfortunately broken since
v2.3 with the introduction of authentication support, so add a patch to the
DTS to fix that.

Notice that the authentication support was reworked in v2.7 so it is skipped
for the mp157a variant used on the avenger96, so the patch is not upstreamable.

While we're at it, also drop the debug option for consistency with the other
boards.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ger96.dts-enable-hash-device-to-unbr.patch | 51 +++++++++++++++++++
 configs/avenger96_defconfig                   |  6 +--
 2 files changed, 54 insertions(+), 3 deletions(-)
 create mode 100644 board/arrow/avenger96/patches/arm-trusted-firmware/0001-stm32mp157a-avenger96.dts-enable-hash-device-to-unbr.patch

diff --git a/board/arrow/avenger96/patches/arm-trusted-firmware/0001-stm32mp157a-avenger96.dts-enable-hash-device-to-unbr.patch b/board/arrow/avenger96/patches/arm-trusted-firmware/0001-stm32mp157a-avenger96.dts-enable-hash-device-to-unbr.patch
new file mode 100644
index 0000000000..8cec0af3b1
--- /dev/null
+++ b/board/arrow/avenger96/patches/arm-trusted-firmware/0001-stm32mp157a-avenger96.dts-enable-hash-device-to-unbr.patch
@@ -0,0 +1,51 @@
+From 336dc301e02d64507447f82020ce7a349797bef3 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Sun, 5 Nov 2023 14:59:16 +0100
+Subject: [PATCH] stm32mp157a-avenger96.dts: enable hash device to unbreak boot
+ issue
+
+The avenger96 board was forgotten when authentication support was added with
+commit 4bdb1a7a6a1325343 (stm32mp1: add authentication support for
+stm32image), causing a panic when stm32mp_init_auth() is called, so fix it
+similar to how it was done for the STM32MP157C-ED1 board with:
+
+commit b37b52ef8bc05bfd8dcca992d4ba84cd7c5d23bb
+Author: Yann Gautier <yann.gautier@st.com>
+Date:   Tue Oct 13 18:05:06 2020 +0200
+
+    fdts: add missing hash node in STM32MP157C-ED1 board DT
+
+    Without this node, the board fails to boot and panics in the function
+    stm32mp_init_auth().
+
+    Change-Id: Ia54924410dac2a8c94dd6e45d7e93977fe7d87e2
+    Signed-off-by: Yann Gautier <yann.gautier@st.com>
+
+Upstream: N/A - Upstream reworked authentication to skip it for MP157A
+ variant since v2.7, see "feat(st): disable authentication based on
+ part_number"
+ (https://github.com/ARM-software/arm-trusted-firmware/commit/49abdfd8cececb91a4bc7e7b29a30c09dce461c7)
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ fdts/stm32mp157a-avenger96.dts | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/fdts/stm32mp157a-avenger96.dts b/fdts/stm32mp157a-avenger96.dts
+index b967736e4..76edecb83 100644
+--- a/fdts/stm32mp157a-avenger96.dts
++++ b/fdts/stm32mp157a-avenger96.dts
+@@ -271,6 +271,10 @@
+ 	};
+ };
+ 
++&hash1 {
++	status = "okay";
++};
++
+ &rng1 {
+ 	status = "okay";
+ };
+-- 
+2.39.2
+
diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index adfd7585c4..142f6dd8c9 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
+BR2_GLOBAL_PATCH_DIR="board/arrow/avenger96/patches"
 BR2_ROOTFS_OVERLAY="board/arrow/avenger96/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
 BR2_LINUX_KERNEL=y
@@ -17,10 +18,9 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-avenger96.dtb"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-avenger96.dtb E=0"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
