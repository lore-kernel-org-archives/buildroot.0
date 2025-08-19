Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FC8CA0EE6
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 07:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C63A4088F;
	Tue, 19 Aug 2025 07:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FhbxT3dEwnKU; Tue, 19 Aug 2025 07:54:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C308740890
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C308740890;
	Tue, 19 Aug 2025 07:54:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 452A1E2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 07:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36F4E8099C
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 07:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id awDVX-1hqeJD for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 07:54:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E8D9C807A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8D9C807A7
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8D9C807A7
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 07:54:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C5608C6B390
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 07:54:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2D55D60697;
 Tue, 19 Aug 2025 07:54:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3C2821C22858A; 
 Tue, 19 Aug 2025 09:54:43 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Damien Le Moal <dlemoal@kernel.org>
Date: Tue, 19 Aug 2025 09:54:40 +0200
Message-ID: <20250819075441.3288414-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755590084; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Bt8z7l/mFudg8LjidVMEFQmdDbMpaIhmgs9h+nAnidA=;
 b=iWa49LzhbCSpsO409rUh0tJ5HbiBiyP8hTlTezO7V/srtu+BimIod7lziNhMWNrBUSV8yJ
 TIqlRuNxiuffIl4gG3z6EJAh27nFiXXlJu7JF/bSMaiU3eisJGkiBywQ3r+ogMrtqJ8kdw
 85/K/z/sVtwzNV/UyvUla4KMLRarZs3ZUqxtzD2TV9Kr0Q4UJ+zn3U3n0XCOdxHCZ90pir
 53n6boV9tG+xHHDQatItCaQyMWTq178bpTvifjH8qlzS1obS5p5Hwy7l5lk5vn65NSyvbT
 25AQ+nc22RWRMSGNNwhyLyqm7Dcyan8MtT6mFrHOmsn6WUvvTjHBp1+kVyQmIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=iWa49Lzh
Subject: [Buildroot] [PATCH] configs/{canaan_kd233,
 sipeed*}: use BR2_LINUX_KENREL_IMAGE_TARGET_NAME
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit cb4f11a6964902990ce774ff7144b24a1ffd635c ("linux: handle
empty BR2_LINUX_KERNEL_IMAGE_TARGET_NAME situation"), we error out if
BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y but
BR2_LINUX_KERNEL_IMAGE_TARGET_NAME is empty, which is exactly the case
of the RISC-V configurations being fixed by this commit.

They define the BR2_LINUX_KERNEL_IMAGE_NAME variable, but not
BR2_LINUX_KERNEL_IMAGE_TARGET_NAME, while BR2_LINUX_KERNEL_IMAGE_NAME
will automatically default to BR2_LINUX_KERNEL_IMAGE_TARGET_NAME if
BR2_LINUX_KERNEL_IMAGE_NAME is not provided.

It probably used to work because specifying an empty make target was
generating the right images, and they did have the name specified in
BR2_LINUX_KERNEL_IMAGE_TARGET_NAME. But with the additional check
added in cb4f11a6964902990ce774ff7144b24a1ffd635c this scenario is no
longer supported.

Fixes:

              canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273088
           sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771237
    sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771342
          sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771387
   sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771472
            sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771505
     sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771581
          sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771663
   sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771885

Cc: Damien Le Moal <dlemoal@kernel.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/canaan_kd233_defconfig            | 2 +-
 configs/sipeed_maix_bit_defconfig         | 2 +-
 configs/sipeed_maix_bit_sdcard_defconfig  | 2 +-
 configs/sipeed_maix_dock_defconfig        | 2 +-
 configs/sipeed_maix_dock_sdcard_defconfig | 2 +-
 configs/sipeed_maix_go_defconfig          | 2 +-
 configs/sipeed_maix_go_sdcard_defconfig   | 2 +-
 configs/sipeed_maixduino_defconfig        | 2 +-
 configs/sipeed_maixduino_sdcard_defconfig | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/configs/canaan_kd233_defconfig b/configs/canaan_kd233_defconfig
index 491a834477..47d0b55e90 100644
--- a/configs/canaan_kd233_defconfig
+++ b/configs/canaan_kd233_defconfig
@@ -15,7 +15,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
 BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/kd233/linux-cpio.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="loader.bin"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
index 00c6a993d8..c3fc9192c6 100644
--- a/configs/sipeed_maix_bit_defconfig
+++ b/configs/sipeed_maix_bit_defconfig
@@ -15,7 +15,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
 BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-bit/linux-cpio.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="loader.bin"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
index 5127bfeae6..4ae824a26b 100644
--- a/configs/sipeed_maix_bit_sdcard_defconfig
+++ b/configs/sipeed_maix_bit_sdcard_defconfig
@@ -19,7 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
 BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/linux-sdcard.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="loader.bin"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_bit"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
diff --git a/configs/sipeed_maix_dock_defconfig b/configs/sipeed_maix_dock_defconfig
index d97e185311..73372056a3 100644
--- a/configs/sipeed_maix_dock_defconfig
+++ b/configs/sipeed_maix_dock_defconfig
@@ -15,7 +15,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
 BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-dock/linux-cpio.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="loader.bin"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
index a755872cfd..66317d968c 100644
--- a/configs/sipeed_maix_dock_sdcard_defconfig
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -19,7 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
 BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/linux-sdcard.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="loader.bin"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_dock"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
diff --git a/configs/sipeed_maix_go_defconfig b/configs/sipeed_maix_go_defconfig
index a4d976353f..bb64dccdf4 100644
--- a/configs/sipeed_maix_go_defconfig
+++ b/configs/sipeed_maix_go_defconfig
@@ -15,7 +15,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
 BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-go/linux-cpio.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="loader.bin"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
index 6067fea785..a3076c3e12 100644
--- a/configs/sipeed_maix_go_sdcard_defconfig
+++ b/configs/sipeed_maix_go_sdcard_defconfig
@@ -19,7 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
 BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/linux-sdcard.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="loader.bin"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_go"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
diff --git a/configs/sipeed_maixduino_defconfig b/configs/sipeed_maixduino_defconfig
index 37c6eb4582..27bf958c76 100644
--- a/configs/sipeed_maixduino_defconfig
+++ b/configs/sipeed_maixduino_defconfig
@@ -15,7 +15,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
 BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maixduino/linux-cpio.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="loader.bin"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
index 0a460f15d3..1b6db4f8a4 100644
--- a/configs/sipeed_maixduino_sdcard_defconfig
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -19,7 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
 BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/linux-sdcard.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="loader.bin"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maixduino"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
