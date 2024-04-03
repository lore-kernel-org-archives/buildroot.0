Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E4CCD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C64FE418B6;
	Wed,  3 Apr 2024 19:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0Z9uZn4CHyF; Wed,  3 Apr 2024 19:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33161418C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33161418C7;
	Wed,  3 Apr 2024 19:54:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B62A61BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0E1D81FF5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5pXv-CpV63P for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:54:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A214E817B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A214E817B5
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A214E817B5
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:54:15 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41551500a7eso1475975e9.2
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 12:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712174053; x=1712778853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lw+M+Y2iD2pJvtnZmAuYKmDd5W1EcnSVH3iZ+u6IU4w=;
 b=owueVaKXngbRedvvCtr8A4C9/K14mTgZfq6ANpLiuZN+0Eom1oNUf5cdkrYQtygpu7
 69hqufhguBfsuAzb3qVrM/RFXrMPD4kyF8hu1wMlt1B6tmvYawOz2LjrBROdOhZp7z/i
 fDnr+DM5XQBT6VS8p+qlV2RpMB1nE6gWhqa+Iqgvo9CTnWoKNQcpBAx9kFWXFESOZMiu
 nWAQAl3tNIgmAXWU8jeaZ4M6Sh+t/Gh7q6rjWwJYQrPGbMtC2sKPyCFp0q5Yu3boqTrW
 Thj6ZS4PyObZMqkXDLYo1xnyg4yKfLToOfjRNWK4yIPeI5jbim2Ujr3jCnicNdM0o+O/
 3vug==
X-Gm-Message-State: AOJu0YwrKiXB4xyAVBsFmXcMGuI8RGgBkwtcOFbki2KHXJ76XzvaC1p4
 h2qMExo4APTNCG8muKVlUE2Ec4AczAqIK9w1yqCNRBSsjM+dSBui9x3Z5IPK5vW5s/1XQaFIT29
 k
X-Google-Smtp-Source: AGHT+IGbvwEOOPxKhUudHPlvnp4fks1d+Mp0J3falBM+EFpJvnyHHxRtyeck282nLJoP8GBzuL0yow==
X-Received: by 2002:a05:600c:5686:b0:412:d2dd:4bdd with SMTP id
 jt6-20020a05600c568600b00412d2dd4bddmr329187wmb.26.1712174053558; 
 Wed, 03 Apr 2024 12:54:13 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm15595571wrb.87.2024.04.03.12.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 12:54:13 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 21:53:46 +0200
Message-ID: <20240403195403.1359007-13-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403195403.1359007-1-romain.naour@smile.fr>
References: <20240403195403.1359007-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712174053; x=1712778853;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lw+M+Y2iD2pJvtnZmAuYKmDd5W1EcnSVH3iZ+u6IU4w=;
 b=qqwzUeKKEqPGlwEZkoNsTv38b3pjWES+LbFUEZN8bXfUJKmJIA4AJtH9uGg8YccCtO
 3wn0RLTPpbq/dT9OZ2UuCuzXKQvB9QHGvDiprBCJ8FbPW4OcZ5mieVNQkbXPbdTNC7oO
 UWJf1+KjNK+rXQgawSn6qnlBI/+ml83Yz3lkY6WXnTe2FzupbksZ8wvj5O9BaRK7lWoN
 FaEqWq46to7KO9O6OxPtMEqo8CbwlUX11IZBD4ZxaDUqjunYpqMG8N/6WDlF9r+q2SZ1
 /VYIN6ZEffWb2J47ByrsNE1ro1hybPBEJ0fX7idtfSpBnez3DzFVVpxOkUCJJIWLKQ5c
 NVdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=qqwzUeKK
Subject: [Buildroot] [PATCH v11 12/17] configs/ti_am64x_sk_defconfig: bump
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Changes in v11:
- add BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option
- Use new BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS and
  BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS options to ease
  post build/image script.

Changes in v9:
- squashed with patch [v8,20/23] "package/ti-k3: fix BR2_PACKAGE_TI_K3_SOC
  setting for am64x SOC"
- Update the commit message

Added in v8
---
 board/ti/am64x-sk/genimage.cfg                      |  7 ++++++-
 .../patches/ti-k3-r5-loader/ti-k3-r5-loader.hash    |  3 +--
 configs/ti_am64x_sk_defconfig                       | 13 ++++++++-----
 3 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/board/ti/am64x-sk/genimage.cfg b/board/ti/am64x-sk/genimage.cfg
index 26304fe98f..88dff8fe23 100644
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
index 2a5c99c459..dbb4428738 100644
--- a/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ b/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -1,2 +1 @@
-# Locally computed:
-sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
+sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index a19cf6f855..9a2faa5c6d 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -1,15 +1,16 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am64x-sk/patches"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am642-sk.dtb -l am64x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am64x-sk/genimage.cfg"
+BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am64x-sk/genimage.cfg"
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
@@ -25,19 +26,21 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
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
+BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN=y
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
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
