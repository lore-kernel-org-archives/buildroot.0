Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11836C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 10:32:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94F8761163
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 10:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94F8761163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 566C940671;
	Wed,  6 Oct 2021 10:32:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4r0udwQYUXAq; Wed,  6 Oct 2021 10:32:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C6D340675;
	Wed,  6 Oct 2021 10:32:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B4D41BF38A
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 10:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE54680CC0
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 10:32:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gNOicHJI_fpj for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 10:32:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 915EC801E1
 for <buildroot@busybox.net>; Wed,  6 Oct 2021 10:32:18 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v17so7311839wrv.9
 for <buildroot@busybox.net>; Wed, 06 Oct 2021 03:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bcGvlBd8f+Ltj1Uj/V4/GokvVsnfIXDTNJgRdyPDZfE=;
 b=VPDtJFzPuSKUTHePMsocWjHuLqabsUB8yHU+J5f/Hre9VqUvTOJyWIBflxqfMlw+V8
 4bjSb4VArcdLrKDR+eyhc3Gdxw0lq9hEbX/TMx35k/Dbqzjd7KTVomdEShwlIp2M3aXy
 GoomMvvI7d3shwqgy3sDjL0AKrtS9b+jTJXKFLikh1923MDGWTXny0nlDLfDEqkf/Ewd
 +NDXDwhULo9Dyn9kt8tpV3yfewLJYQ8cyFGadTCR2Xy4wyekqLA7Ghl2X2ZuQvH2uIF9
 6BYVRyJtlx9H1gdameqpvJxIfN59I8+d2AM5V2/48udmz9M+NZZJx+L/QeQTJ9v4O1yN
 2fXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bcGvlBd8f+Ltj1Uj/V4/GokvVsnfIXDTNJgRdyPDZfE=;
 b=rAij7C9b28nG/bRqR1N7v/2At0xkcREFUcxp+cnj3QQY2sdNsuAWYqDcaKsxcF1idK
 qtbD0V4hOU/EnS7G048fxRmmrYHwGMFwS1O1unJttHvIsTSil9NCXJKY+XMFJ6LNqkIx
 lnrNKP9WZXD4sR7/jHVE945PaUFr14kP6wTA5sE8zC/32rhd82OMFRrQ/NxZJJG9WO5A
 2L4wdZB5BWym8/mcWehnWg9SeW7YmYX4ZuWphKno8PtRH2fVUIiLFJJjWRidOl3NYzVy
 gvwK0CyILY6QRodNoNGw/BSITmSIZfLfeeK+AIA6vF8O52BBw/kyHM1PKPkc66iHqGm+
 zH9w==
X-Gm-Message-State: AOAM531UI+rHgITSqNMRlWbQ9OlECv6sfUkAULQrf0lNRLy+g64+Wi0r
 2RZzjJ48EyoES30OeZwqe60Xxs2CU1w=
X-Google-Smtp-Source: ABdhPJyjSXCws7U/743vEZkl3dhn2IqLsxnfY58EWslHpPv683JGJ6uxizJDURsAlen0ceem0nfudg==
X-Received: by 2002:adf:d1c5:: with SMTP id b5mr1125953wrd.419.1633516336573; 
 Wed, 06 Oct 2021 03:32:16 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id o6sm565121wri.49.2021.10.06.03.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 03:32:16 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  6 Oct 2021 12:32:07 +0200
Message-Id: <20211006103207.1366438-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/mx6cubox: bump Linux and U-Boot versions
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

remove merged patches

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...xi-Fix-the-mmc-device-for-the-rootfs.patch | 29 --------------
 ...2-mx6cuboxi-Fix-the-console-variable.patch | 40 -------------------
 configs/mx6cubox_defconfig                    |  5 +--
 3 files changed, 2 insertions(+), 72 deletions(-)
 delete mode 100644 board/solidrun/mx6cubox/patches/uboot/0001-mx6cuboxi-Fix-the-mmc-device-for-the-rootfs.patch
 delete mode 100644 board/solidrun/mx6cubox/patches/uboot/0002-mx6cuboxi-Fix-the-console-variable.patch

diff --git a/board/solidrun/mx6cubox/patches/uboot/0001-mx6cuboxi-Fix-the-mmc-device-for-the-rootfs.patch b/board/solidrun/mx6cubox/patches/uboot/0001-mx6cuboxi-Fix-the-mmc-device-for-the-rootfs.patch
deleted file mode 100644
index b9755a042..000000000
--- a/board/solidrun/mx6cubox/patches/uboot/0001-mx6cuboxi-Fix-the-mmc-device-for-the-rootfs.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 96db7c072b96f9b7a1d9a986eff20353f7459004 Mon Sep 17 00:00:00 2001
-From: Fabio Estevam <festevam@gmail.com>
-Date: Sun, 18 Jul 2021 19:08:36 -0300
-Subject: [PATCH] mx6cuboxi: Fix the mmc device for the rootfs
-
-After the comversion to DM_MMC, the rootfs is mmc 1, so
-adjust it accordingly.
-
-Signed-off-by: Fabio Estevam <festevam@gmail.com>
----
- include/configs/mx6cuboxi.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/configs/mx6cuboxi.h b/include/configs/mx6cuboxi.h
-index 55717c77ab38..1a06f29b8c17 100644
---- a/include/configs/mx6cuboxi.h
-+++ b/include/configs/mx6cuboxi.h
-@@ -57,7 +57,7 @@
- 	"console=" CONSOLE_DEV ",115200\0" \
- 	"bootm_size=0x10000000\0" \
- 	"mmcdev=" __stringify(CONFIG_SYS_MMC_ENV_DEV) "\0" \
--	"finduuid=part uuid mmc 0:1 uuid\0" \
-+	"finduuid=part uuid mmc 1:1 uuid\0" \
- 	"update_sd_firmware=" \
- 		"if test ${ip_dyn} = yes; then " \
- 			"setenv get_cmd dhcp; " \
--- 
-2.25.1
-
diff --git a/board/solidrun/mx6cubox/patches/uboot/0002-mx6cuboxi-Fix-the-console-variable.patch b/board/solidrun/mx6cubox/patches/uboot/0002-mx6cuboxi-Fix-the-console-variable.patch
deleted file mode 100644
index c02134101..000000000
--- a/board/solidrun/mx6cubox/patches/uboot/0002-mx6cuboxi-Fix-the-console-variable.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From ab1dd9332c379164925aee755a013dbd8839501b Mon Sep 17 00:00:00 2001
-From: Fabio Estevam <festevam@gmail.com>
-Date: Mon, 19 Jul 2021 16:48:07 -0300
-Subject: [PATCH 2/2] mx6cuboxi: Fix the console variable
-
-Do not pass the console baudrate to the 'console' variable
-to avoid the baudrate being passed twice when using extlinux.conf:
-
-cat /proc/cmdline
-root=PARTUUID=00000000-01 rootwait rw console=ttymxc0,115200,115200
-
-Signed-off-by: Fabio Estevam <festevam@gmail.com>
----
- include/configs/mx6cuboxi.h | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/include/configs/mx6cuboxi.h b/include/configs/mx6cuboxi.h
-index 1a06f29b8c17..9e5083b0d876 100644
---- a/include/configs/mx6cuboxi.h
-+++ b/include/configs/mx6cuboxi.h
-@@ -38,7 +38,6 @@
- /* Command definition */
- 
- #define CONFIG_MXC_UART_BASE	UART1_BASE
--#define CONSOLE_DEV	"ttymxc0"
- 
- #ifndef CONFIG_SPL_BUILD
- #define CONFIG_EXTRA_ENV_SETTINGS \
-@@ -54,7 +53,7 @@
- 	"ramdiskaddr=0x13000000\0" \
- 	"initrd_high=0xffffffff\0" \
- 	"ip_dyn=yes\0" \
--	"console=" CONSOLE_DEV ",115200\0" \
-+	"console=ttymxc0\0" \
- 	"bootm_size=0x10000000\0" \
- 	"mmcdev=" __stringify(CONFIG_SYS_MMC_ENV_DEV) "\0" \
- 	"finduuid=part uuid mmc 1:1 uuid\0" \
--- 
-2.25.1
-
diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
index 60bfd1709..d0ce2f9a6 100644
--- a/configs/mx6cubox_defconfig
+++ b/configs/mx6cubox_defconfig
@@ -13,12 +13,11 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_OVERLAY="board/solidrun/mx6cubox/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
-BR2_GLOBAL_PATCH_DIR="board/solidrun/mx6cubox/patches"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.48"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.70"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-cubox-i imx6dl-cubox-i-emmc-som-v15 imx6dl-cubox-i-som-v15 imx6dl-hummingboard imx6dl-hummingboard-emmc-som-v15 imx6dl-hummingboard-som-v15 imx6q-cubox-i imx6q-cubox-i-emmc-som-v15 imx6q-cubox-i-som-v15 imx6q-hummingboard imx6q-hummingboard-emmc-som-v15 imx6q-hummingboard-som-v15"
@@ -33,7 +32,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx6cuboxi"
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
