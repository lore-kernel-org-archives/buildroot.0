Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60217C433F5
	for <buildroot@archiver.kernel.org>; Fri, 25 Feb 2022 07:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 069E86123D;
	Fri, 25 Feb 2022 07:26:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xUN7jOvSnWVp; Fri, 25 Feb 2022 07:26:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 108AD611F4;
	Fri, 25 Feb 2022 07:26:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D288A1BF354
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 07:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0ACE83ED4
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 07:26:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mXR7csQVk0O5 for <buildroot@lists.busybox.net>;
 Fri, 25 Feb 2022 07:26:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 635CE83ED2
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 07:26:27 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id 29so6182639ljv.10
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 23:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bXpXHt6tsfh1j/iJQvfmqIHnrkETGh8Sz5LQ0rmH7Hg=;
 b=fXAEeBZxnUjH/PnjhDeCzg4gYD0uRqNOWuzZdJNnJUHxFb/trBa5i6tJxR8TTa7vxD
 Q+A6zqBosylF2k5ioyxLafbu87pk8HYwJeF/hYSXA9PLeyg/AYQm+cqIHg8Dhxzu8EvF
 p/fCxHs4oq3ZH2XGD0qmg8RS290LVqlPzevpWamRyt7W4TxsYbvgi1rAF/omBW6141WE
 ZjJl5A471U5eNQ6Rw45Jp05STP+Jp9j762mISGg6zy876aDh+2UMGs1TEKe6IO3CIqmA
 5Rnl/vPdAR1t7fH97iYdeK2jenQuT1UkKygMce5rmDVer4PrA9b1Pat9zq1OV9cl/LHj
 38eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bXpXHt6tsfh1j/iJQvfmqIHnrkETGh8Sz5LQ0rmH7Hg=;
 b=CcD1XcZFe3FAAMANYVfRKjemUWjpwYenS87MTajneQWetJNnPnw0jHIiCLBOSQx3/N
 m3UoibAPT+Gs1EjCrBlSR8Kd4NsqwrN/QbSubh/uKvpIPTYd4FEBuCNVYWghHnwmBSE2
 p+Y4bADkJSQ5UstQX/dlW6MUSkt8e4XTEfp9Odun8QHZVtp608IUD1jva9r5SdKM/fAX
 faRUM2RWmaJqQRDyDG9TX5FSLgzY4igtg/WkHtrDxYE4ZP/+ZFJn0i9S9DR2NwTyzr9f
 cHxqx7kVboIAcfmNgsf4u1TX9AxwMbJmts9fTopqGBOiykL2Je1ruqO5vAx11c3edycx
 2pFQ==
X-Gm-Message-State: AOAM530YUjIGGFWGHQZDYrp6KYN+jsxBKHTAF+mKmv3mqB1WHRLaPHZz
 85vWcispqZ3wK3QAI2+0EZluZSBFIrw=
X-Google-Smtp-Source: ABdhPJwMsbeYoC078qohL5JCnkYfFPlZcvXO/gezvSTCFf8PdiJz2wIFWnFXNT6xWR9ACMsYEmv96g==
X-Received: by 2002:a2e:7c0f:0:b0:246:2940:84d5 with SMTP id
 x15-20020a2e7c0f000000b00246294084d5mr4475232ljc.72.1645773984915; 
 Thu, 24 Feb 2022 23:26:24 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 z25-20020a2eb539000000b00244db8751a7sm184592ljm.67.2022.02.24.23.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 23:26:24 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Feb 2022 10:26:17 +0300
Message-Id: <20220225072622.3584480-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225072622.3584480-1-geomatsi@gmail.com>
References: <20220225072622.3584480-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/6] board/orangepi/orangepi-zero-plus2:
 switch to extlinux
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to extlinux instead of U-Boot boot script. Drop custom boot
script and genimage config. Instead use common orangepi files from
board/orangepi/common. To help extlinux to find DTB without U-Boot
environment changes, do not strip arm64 board specific directory
from DTB name when installing it in /boot directory. For this
purpose use BR2_KERNEL_DTB_KEEP_DIRNAME config option. Finally,
tidy up configuration file adding section names.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 board/orangepi/orangepi-zero-plus2/boot.cmd   |  6 ---
 .../orangepi/orangepi-zero-plus2/genimage.cfg | 41 -------------------
 configs/orangepi_zero_plus2_defconfig         | 14 ++++---
 3 files changed, 8 insertions(+), 53 deletions(-)
 delete mode 100644 board/orangepi/orangepi-zero-plus2/boot.cmd
 delete mode 100644 board/orangepi/orangepi-zero-plus2/genimage.cfg

diff --git a/board/orangepi/orangepi-zero-plus2/boot.cmd b/board/orangepi/orangepi-zero-plus2/boot.cmd
deleted file mode 100644
index aa5162004b..0000000000
--- a/board/orangepi/orangepi-zero-plus2/boot.cmd
+++ /dev/null
@@ -1,6 +0,0 @@
-setenv bootargs console=ttyS0,115200 earlyprintk root=PARTLABEL=rootfs rootwait
-
-fatload mmc 0 $kernel_addr_r Image
-fatload mmc 0 $fdt_addr_r sun50i-h5-orangepi-zero-plus2.dtb
-
-booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-zero-plus2/genimage.cfg b/board/orangepi/orangepi-zero-plus2/genimage.cfg
deleted file mode 100644
index 5a7ee7707a..0000000000
--- a/board/orangepi/orangepi-zero-plus2/genimage.cfg
+++ /dev/null
@@ -1,41 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"Image",
-			"sun50i-h5-orangepi-zero-plus2.dtb",
-			"boot.scr"
-		}
-	}
-
-	size = 64M
-}
-
-image sdcard.img {
-	hdimage {
-		# for root=PARTLABEL support
-		partition-table-type = "gpt"
-		# default GPT location conflicts with bootloaders, move it after
-		gpt-location = 1M
-	}
-
-	partition spl {
-		in-partition-table = "no"
-		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8K
-		size = 1016K # 1MB - 8KB
-	}
-
-	partition boot {
-		partition-type-uuid = "F"
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	# 'rootfs' will be used as the partition label, used
-	# with root=PARTLABEL=rootfs kernel command line
-	partition rootfs {
-		partition-type-uuid = "L"
-		image = "rootfs.ext4"
-		size = 256M
-	}
-}
diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index 9d88b37ac9..ef171c3ad3 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -27,9 +27,6 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero-plus2/boot.cmd"
 
 # Kernel
 BR2_LINUX_KERNEL=y
@@ -40,6 +37,8 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-zero-plus2"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero-plus2/linux-extras.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
 
 # wireless firmware
 BR2_PACKAGE_LINUX_FIRMWARE=y
@@ -58,8 +57,11 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero Plus2"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
+
+# host tools
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
+
+# image scripts
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-zero-plus2/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
