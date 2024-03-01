Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163D5C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 13:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7AA583438;
	Fri,  1 Mar 2024 13:37:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QmA2RvWYQ0rI; Fri,  1 Mar 2024 13:37:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F074838C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F074838C9;
	Fri,  1 Mar 2024 13:37:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 224211BF990
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CFDD608A7
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DGvSMIJNi2lu for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 13:36:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2EBC46088B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EBC46088B
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EBC46088B
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 13:36:51 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-563d56ee65cso3481524a12.2
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 05:36:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709300209; x=1709905009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gEE0XGHabXzaMn2xtNoxEcq2/77ioPiDg56IX6gjtRA=;
 b=enMOGkaXax1IZuEq569MaqWfTZXhMoB5aYXoNozjbKWCOOqbzqIdXiDdQU2NRh6BRu
 +cB/3vEn3aIYFDN/4ss82KX+Y//aKwnFR7ZAEGfJSNM7WmlNseCxNllzsVcX1pEhdBQ4
 F0oGU7kIgSy+DVIyikk5pQ8RgB9L/LSkh6sSFlX2SzlDVR9M7CuxU6p2F6vFuHwXfZip
 bobh/Vhdn0hSp8iGXqv7gn6pn4RNAkaKFMOk6hWkXqIiM8eJJX9MG3UlGxtjghV6ah42
 vUdO+fu/LpP6aSdSRitDPnbCjUfRZHtSGOoBWaiiPoDQx4E7wMP4bbL8asOwtVGH7Nkm
 z9Hw==
X-Gm-Message-State: AOJu0YxcE0Ssdl/RP288cDSJ7FRj2SRMGmFaV4E4a0HFMbN23JvCvIGo
 anIcRrbtusM9bub87POUGWpm7/eDGhZH8hg6rvKWtJBeHeFdhKkePKiIN05ja71mZ1JnyIc14/T
 dIZ4=
X-Google-Smtp-Source: AGHT+IHQx12AmY6EOP1P+RKPuSIxi0HZV15ma6hMFPsIuUNpzLsI3v/bZyiQdSRBNlShwvmhz/FqAw==
X-Received: by 2002:aa7:c508:0:b0:565:9fc8:8f35 with SMTP id
 o8-20020aa7c508000000b005659fc88f35mr1123511edq.42.1709300209171; 
 Fri, 01 Mar 2024 05:36:49 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5260:58bc:42cc:9d46])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a056402033c00b005659ea1caf0sm1566608edw.6.2024.03.01.05.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 05:36:48 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 14:36:18 +0100
Message-ID: <20240301133620.3547430-22-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709300209; x=1709905009;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gEE0XGHabXzaMn2xtNoxEcq2/77ioPiDg56IX6gjtRA=;
 b=a35qb4R/DqiAnzR7RjvtEWoJT/fliFuw5O+uKy3iWPAThJUnJWl+PTCUFJiCUIWyZ+
 aFRhrtkageWRbmT5n7GLYpNw80LZ6vJA5b/fP1c1njsxSO/zwmfaOdE6KEqLKDiW7Gd6
 b8PL2LL5F5p8/9WRxjpEXiPYahunB51GIwJM4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=a35qb4R/
Subject: [Buildroot] [PATCH v8 21/23] configs/ti_am64x_sk_defconfig: bump
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
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Added in v8

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/ti/am64x-sk/genimage.cfg |  7 ++++++-
 configs/ti_am64x_sk_defconfig  | 13 +++++++------
 2 files changed, 13 insertions(+), 7 deletions(-)

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
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 566cbbe4824f..9b92b645dd21 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -1,14 +1,14 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
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
@@ -24,19 +24,20 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
