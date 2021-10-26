Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05109C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:38:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C57F760F9D
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C57F760F9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 954694053F;
	Tue, 26 Oct 2021 19:38:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9IzukLoQLk_N; Tue, 26 Oct 2021 19:38:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01F154055D;
	Tue, 26 Oct 2021 19:38:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 874071BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8102060AC0
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NKTlXiWonnrC for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:38:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C60256067F
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:38:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D50D488F04; Tue, 26 Oct 2021 19:34:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 21:34:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: afdd74d2fbb0461b7b8cba9ea9a0268eae1662aa
X-Git-Newrev: 830e5227d4ba0f565a3a9e55a0409854918a0d4a
X-Patchwork-Hint: ignore
Message-Id: <20211026193444.D50D488F04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32f469_disco: enable Linux DRM
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=830e5227d4ba0f565a3a9e55a0409854918a0d4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch [1], which is required for DRM to work properly, has been
merged into Linux version 5.14-rc3. There's a 5.14.12 now in stable, so
I took that one.

After Linux boots, /dev/fb0 will be accessible. You can control the
brightness of the display after enabling the framebuffer by running the
following commands:

~ # echo 0 0 > /sys/class/graphics/fb0/pan
~ # echo 255 >/sys/class/backlight/40016c00.dsi.0/brightness

The brightness ranges from 0 to 255, as you can see running the
command:

~ # cat /sys/class/backlight/40016c00.dsi.0/max_brightness

[1] 24b5b1978cd5 ("clk: stm32f4: fix post divisor setup for I2S/SAI PLLs")

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Acked-by: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
[Arnout: add explanation to readme.txt]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/stmicroelectronics/stm32f469-disco/linux.fragment |  8 +++++++-
 board/stmicroelectronics/stm32f469-disco/readme.txt     | 14 ++++++++++++++
 configs/stm32f469_disco_defconfig                       |  4 ++--
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/linux.fragment b/board/stmicroelectronics/stm32f469-disco/linux.fragment
index 90f5e8a8ff..e5d39bf04a 100644
--- a/board/stmicroelectronics/stm32f469-disco/linux.fragment
+++ b/board/stmicroelectronics/stm32f469-disco/linux.fragment
@@ -1 +1,7 @@
-# CONFIG_XIP_KERNEL is not set
\ No newline at end of file
+# CONFIG_XIP_KERNEL is not set
+CONFIG_DRM=y
+CONFIG_DRM_STM=y
+CONFIG_DRM_STM_DSI=y
+CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
+CONFIG_FB=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
diff --git a/board/stmicroelectronics/stm32f469-disco/readme.txt b/board/stmicroelectronics/stm32f469-disco/readme.txt
index c1e1d30e69..4d178b40d6 100644
--- a/board/stmicroelectronics/stm32f469-disco/readme.txt
+++ b/board/stmicroelectronics/stm32f469-disco/readme.txt
@@ -29,3 +29,17 @@ ready to be dumped on a SD card. Launch the following command as root:
 
 For details about the medium image layout and its content, see the
 definition in board/stmicroelectronics/stm32f469-disco/genimage.cfg.
+
+Framebuffer
+-----------
+After Linux boots, /dev/fb0 will be accessible. You can control the
+brightness of the display after enabling the framebuffer by running the
+following commands:
+
+   # echo 0 0 > /sys/class/graphics/fb0/pan
+   # echo 255 >/sys/class/backlight/40016c00.dsi.0/brightness
+
+The brightness ranges from 0 to 255, as you can see running the
+command:
+
+   # cat /sys/class/backlight/40016c00.dsi.0/max_brightness
diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_defconfig
index e538a664e2..438d32150c 100644
--- a/configs/stm32f469_disco_defconfig
+++ b/configs/stm32f469_disco_defconfig
@@ -1,12 +1,12 @@
 BR2_arm=y
 BR2_cortex_m4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh board/stmicroelectronics/stm32f469-disco/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f469-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.12"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
