Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A4BC3DA7F
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 06:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B223D80E33;
	Sat, 10 Aug 2024 06:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j9QfYtdQoh1N; Sat, 10 Aug 2024 06:45:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A10ED80E4F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A10ED80E4F;
	Sat, 10 Aug 2024 06:45:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23E841BF860
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 06:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F31E60708
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 06:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_QLvM_7KRHW for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 06:45:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4BB4060707
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BB4060707
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BB4060707
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 06:45:02 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 63DA8353B5F6; Sat, 10 Aug 2024 08:45:00 +0200 (CEST)
Date: Sat, 10 Aug 2024 08:45:00 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrcMbDYOcKkKaazr@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723272300; bh=F1g/vdkYvstwBrh7cyghDwvbwacaEgrBO/5aFUj8SKY=;
 h=Date:From:To:Subject:From;
 b=g+bO/HWlU/vpulTc5nIuBemeVLxIv4pw7Xt2IKXDqcj/nMYBjETtRlyDhLEXPz1D7
 xExmJBcR2/aTh0ABoa2jvufJdSahMb6MSaP8DFFeikZu3PPUTOijxCePK6ePKydbs0
 VIv1iigTF5Q8msLzLcNsF4m2OUDblTz+gPasosIyxeJW9noTYB2Cytdlc1dfMPi8Ow
 d9M5C+OkXVl+tc7la9V9J+8X7JkaNnz66tUgA4tqt/aUVRbbkwnIXWkc+sgBYGPaHo
 /dmtd3T4B3DCha7ShompZQxdpqmWEYSJz6k1MuTIQeKd8kLgaPQ93x+4JpHkwkVzJs
 2j1Rov3BSPuRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=g+bO/HWl
Subject: [Buildroot] [PATCH] configs/solidrun_clearfog: update U-Boot and
 Linux
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

Tested on Solidrun Clearfog.

Signed-off-by: Wademar Brodkorb <wbx@openadk.org>
---
 board/solidrun/clearfog/genimage.cfg                   |  2 +-
 .../clearfog/patches/linux-headers/linux-headers.hash  |  2 ++
 board/solidrun/clearfog/patches/linux/linux.hash       |  2 ++
 board/solidrun/clearfog/patches/uboot/uboot.hash       |  2 ++
 configs/solidrun_clearfog_defconfig                    | 10 +++++++---
 5 files changed, 14 insertions(+), 4 deletions(-)
 create mode 100644 board/solidrun/clearfog/patches/linux-headers/linux-headers.hash
 create mode 100644 board/solidrun/clearfog/patches/linux/linux.hash
 create mode 100644 board/solidrun/clearfog/patches/uboot/uboot.hash

diff --git a/board/solidrun/clearfog/genimage.cfg b/board/solidrun/clearfog/genimage.cfg
index 8963619cc5..35aab62a8c 100644
--- a/board/solidrun/clearfog/genimage.cfg
+++ b/board/solidrun/clearfog/genimage.cfg
@@ -4,7 +4,7 @@ image sdcard.img {
 
 	partition u-boot {
 		in-partition-table = "no"
-		image = "u-boot-spl.kwb"
+		image = "u-boot-with-spl.kwb"
 		offset = 512
 	}
 
diff --git a/board/solidrun/clearfog/patches/linux-headers/linux-headers.hash b/board/solidrun/clearfog/patches/linux-headers/linux-headers.hash
new file mode 100644
index 0000000000..b8935a250a
--- /dev/null
+++ b/board/solidrun/clearfog/patches/linux-headers/linux-headers.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0ad83b1a1a780a1aad948d55aa55ee63c50c626f2d46910b9d2180028d100a5e  linux-6.6.43.tar.xz
diff --git a/board/solidrun/clearfog/patches/linux/linux.hash b/board/solidrun/clearfog/patches/linux/linux.hash
new file mode 100644
index 0000000000..b8935a250a
--- /dev/null
+++ b/board/solidrun/clearfog/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0ad83b1a1a780a1aad948d55aa55ee63c50c626f2d46910b9d2180028d100a5e  linux-6.6.43.tar.xz
diff --git a/board/solidrun/clearfog/patches/uboot/uboot.hash b/board/solidrun/clearfog/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..fe9b4f53dc
--- /dev/null
+++ b/board/solidrun/clearfog/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/solidrun_clearfog_defconfig b/configs/solidrun_clearfog_defconfig
index 7f633d30d5..56d5c1d354 100644
--- a/configs/solidrun_clearfog_defconfig
+++ b/configs/solidrun_clearfog_defconfig
@@ -5,6 +5,10 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_NEON=y
 
+# Hashes
+BR2_GLOBAL_PATCH_DIR="board/solidrun/clearfog/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # Linux headers same as kernel, a 6.6 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
@@ -16,7 +20,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/clearfog/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.28"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.43"
 BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/clearfog/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -33,10 +37,10 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="clearfog"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-spl.kwb"
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-with-spl.kwb"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
