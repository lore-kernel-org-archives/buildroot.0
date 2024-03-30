Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F6ACD1288
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 16:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26552822BC;
	Sat, 30 Mar 2024 16:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2DS8wsqFyGJ; Sat, 30 Mar 2024 16:03:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA8E382291
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA8E382291;
	Sat, 30 Mar 2024 16:03:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21E431BF3DF
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 16:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13402822DB
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 16:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gA3UCto98bM6 for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 16:03:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C80382281
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C80382281
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C80382281
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 16:03:05 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-515b3077d09so3087445e87.1
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 09:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711814583; x=1712419383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YxvvVcy6ShVKE63MsRrZeO1dFpKzH0nbG8hP8xbIMJU=;
 b=pqq8zIqHVBBO3dddjfNtRTDZRzJ3WlEcqX+R4xf/P85ay3NLPUPWNZeqtNgKorlplz
 Con1E1HsqdEP0tw1tjIGc7mr7TfMKwbF2zDn0gdRvrBUeAgOAYL0I9yTeeog57Oe0Gv2
 75QW1hWDTSr/pQOUe9LMo4BQIBUF1Sjuosq9pGzqV+tKxXgcnwbje5S5LcDUDdiH7ALR
 ye0LAUJAqqlGK1s2xT6SRfrYM1L51+AcutjbZ3oXu/G5rkC4mcmUFNM55KN/Sv51tBn2
 bBg4JaZU6WMKnYQQLcQsFtv3QpKB89KGbbNmr4RywBKUehT9LNzFZ4j5MhGcRneo8duu
 UR6g==
X-Gm-Message-State: AOJu0Yz+86B9cgDpKNU/1AhW3ss65JUNlI5bh3GtAAsOfk18YCFF+pP5
 4PbNrdUpNDm/15YHwbOCQJt5bKN3XnFfPCLLobnml1rahtlxlhh7tisPLi71EGJfcanDlqNyhZR
 +tas=
X-Google-Smtp-Source: AGHT+IH5zcVhAFUbBD+rQxEUQE3q0hoguDAac87DzYwfcPMMtozPUoduc71ZsDidIXm7BQdnzPEurg==
X-Received: by 2002:a05:6512:3d0a:b0:516:1a1e:164f with SMTP id
 d10-20020a0565123d0a00b005161a1e164fmr2383708lfv.41.1711814582767; 
 Sat, 30 Mar 2024 09:03:02 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a056402004d00b0056c633354c6sm2127107edu.45.2024.03.30.09.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 09:03:02 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 17:02:43 +0100
Message-ID: <20240330160244.3214733-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
References: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711814583; x=1712419383;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YxvvVcy6ShVKE63MsRrZeO1dFpKzH0nbG8hP8xbIMJU=;
 b=dWrAtArW03nfWu7O3oCJ1WTq24K7jeAfnkfMRwPTb19veod75mN8ByhpGb/C1PRICW
 i0sLPxEh+sBqb+FNpn/CV35T89gAnMkWtEzTxa9u2Bvdyx1+7x4TQ4Ce2zjqFS7W/t2L
 HDq6fCbmTjub63YfrUdwt6S9FFjTnepGBGfXA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=dWrAtArW
Subject: [Buildroot] [PATCH v10 11/12] configs/ti_am64x_sk_defconfig: bump
 U-Boot version to 2024.01
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
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "Yann E . Morin" <yann.morin.1998@free.fr>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 2024.01 version of U-Boot for the am64x-sk board has introduced two
major changes:
- The device tree k3-am642-sk.dtb is no longer searched in /boot, but in
  /boot/dtb/ti. Hence, the disabling of BR2_LINUX_KERNEL_INSTALL_TARGET
  and the use of extlinux.conf for the proper loading of the device tree.
  Furthermore, the parameter BR2_ROOTFS_POST_SCRIPT_ARGS was used to
  auto-generate the extlinux.conf file so that developers can change the
  kernel loading options by modifying the .config.
- U-Boot is capable of building tiboot3.bin using Binman. So it's no longer
  necessary to use custom tools like ti-k3-image-gen.

Furthermore, ti-k3-r5-loader creates the following tiboot3.bin files:
- GP    -> tiboot3_am64x-gp-evm.bin
- HS    -> tiboot3_am64x_sr2-hs-evm.bin
- HS_FS -> tiboot3_am64x_sr2-hs-fs-evm.bin

The patch also allows you to identify the correct file based on the
SEC_TYPE option.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v9:
- squashed with patch [v8,20/23] "package/ti-k3: fix BR2_PACKAGE_TI_K3_SOC
  setting for am64x SOC"
- Update the commit message

Added in v8

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/ti/am64x-sk/genimage.cfg                     |  7 ++++++-
 .../patches/ti-k3-r5-loader/ti-k3-r5-loader.hash   |  2 --
 configs/ti_am64x_sk_defconfig                      | 14 +++++++-------
 package/ti-k3/Config.in                            |  3 ++-
 4 files changed, 15 insertions(+), 11 deletions(-)
 delete mode 100644 board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash

diff --git a/board/ti/am64x-sk/genimage.cfg b/board/ti/am64x-sk/genimage.cfg
index 26304fe98f99..88dff8fe23dc 100644
--- a/board/ti/am64x-sk/genimage.cfg
+++ b/board/ti/am64x-sk/genimage.cfg
@@ -4,10 +4,15 @@ image boot.vfat {
 			"tiboot3.bin",
 			"tispl.bin",
 			"u-boot.img",
+			"k3-am642-sk.dtb",
+			"Image"
+		}
+		file extlinux/extlinux.conf {
+			image = extlinux.conf
 		}
 	}
 
-	size = 16M
+	size = 64M
 }
 
 image sdcard.img {
diff --git a/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
deleted file mode 100644
index 2a5c99c459f2..000000000000
--- a/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed:
-sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index a19cf6f85572..9b92b645dd21 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -1,15 +1,14 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
-BR2_GLOBAL_PATCH_DIR="board/ti/am64x-sk/patches"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am64x-sk/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ti/common/am6xx/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am642-sk.dtb -l am64x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am642-sk"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
 BR2_PACKAGE_TI_K3=y
@@ -25,19 +24,20 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am64x"
-BR2_TARGET_TI_K3_IMAGE_GEN=y
+BR2_TARGET_TI_K3_BOOT_FIRMWARE=y
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am64x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am64x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
diff --git a/package/ti-k3/Config.in b/package/ti-k3/Config.in
index b8545b7bca62..9c61f8880a15 100644
--- a/package/ti-k3/Config.in
+++ b/package/ti-k3/Config.in
@@ -43,7 +43,8 @@ config BR2_PACKAGE_TI_K3_SOC
 	string
 	default "am62ax" if BR2_PACKAGE_TI_K3_SOC_AM62AX
 	default "am62x"  if BR2_PACKAGE_TI_K3_SOC_AM62X
-	default "am64x"  if BR2_PACKAGE_TI_K3_SOC_AM64X
+	default "am64x"  if BR2_PACKAGE_TI_K3_SOC_AM64X && BR2_PACKAGE_TI_K3_SECTYPE_GP
+	default "am64x_sr2"  if BR2_PACKAGE_TI_K3_SOC_AM64X && !BR2_PACKAGE_TI_K3_SECTYPE_GP
 	default "am65x"  if BR2_PACKAGE_TI_K3_SOC_AM65X
 
 config BR2_PACKAGE_TI_K3_SECTYPE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
