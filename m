Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5110BCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 10:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17FC941561;
	Sun,  7 Apr 2024 10:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z97HV-Cyojyz; Sun,  7 Apr 2024 10:35:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F4EA4188E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F4EA4188E;
	Sun,  7 Apr 2024 10:35:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FB741BF575
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B713608E9
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fNBGDnlh3SKF for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 10:35:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D8CC608ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D8CC608ED
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D8CC608ED
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 10:35:19 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4163de295f9so3111505e9.2
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 03:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712486117; x=1713090917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NRdaR5n2Lz4Q1zUg+dzYDFTLZFwDakArgiUQpudUbQs=;
 b=EXZHPSErpaGNljYM0kZF+sXkisBFXCOjju0B/TalmnMNzASglnpAXVAFueZGrjjobN
 co9qssenw8pbn//o+VCQ3sNpZYvp/ruhszhnjEfRf3utBt8PTFQ1P+RPcU0THDwgeGrv
 +zQUB/Nsb9Njsn36x+HB6GmxD8j/vkY4WkiQ7BmQ0VYBq1BKvgaoLJP3gMy1c2BRkM7E
 u8f9T7GZ/VXHT7tguYF1Dmj3VcWgdOpkZAWDsRh8t5C/ycu9IyKR0/KbWp5c47gTpuEA
 hCUXmGIAEonJhXvd6qprC6jEk6oHAWAe50dqqLpa4Wnsux/eQKhL1R6DjQv82NSEgVK6
 L99A==
X-Gm-Message-State: AOJu0YwU3XESNWf9b6iYBG5qvrC1j6+ZZVNm7CcN5qsRjkYnIyxQyt22
 u9V/Mwcc/fulIN0QFieleO1/UMfv/WTjGK6/mL0P6L/W2IVqRoJEBl7AyyoxE1kx2lQds6uvTCd
 O
X-Google-Smtp-Source: AGHT+IE1FFH0i80vJvReiN2+pvllqoSb3TDvQBqiFqlrQA1YXVe7skcpmr+dZou4da18eACFd32O/A==
X-Received: by 2002:a05:600c:4fc2:b0:414:8e02:e432 with SMTP id
 o2-20020a05600c4fc200b004148e02e432mr5187069wmq.7.1712486117216; 
 Sun, 07 Apr 2024 03:35:17 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 je4-20020a05600c1f8400b004149536479esm9486542wmb.12.2024.04.07.03.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 03:35:17 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 12:34:56 +0200
Message-ID: <20240407103512.1112712-4-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240407103512.1112712-1-romain.naour@smile.fr>
References: <20240407103512.1112712-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712486117; x=1713090917;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRdaR5n2Lz4Q1zUg+dzYDFTLZFwDakArgiUQpudUbQs=;
 b=fEV9Tr8NmhoZ8oqgIE0XFJgezXi1rJOJF5RRoqAmg4IYgl2GY9l+F01J70+9gUsHjM
 IEyUaXRPpnF//ipeKfvkHo1CKulTuRnSxMThHms2ENpeiywaT0UaWExsMmEXPjxGPn8H
 L+0I+jSS/4e8CbFg9RFS8QRdIr8GeEnOSHJ87aNbcFiflKT9vHvc69yEk2kqDoFcmscc
 kS97uyPlj8UaCuyA6qQLCWSDyAbLWFwQ1oGrqNQIhn2NbDYHIkoSuwEEB0asZZct6uZj
 lX6AqSTrDwPfjoNhcSxwro1/yXSQyscK4IA8R30vFESMfZF5J0UjzqmXxRIlNRKCctlF
 WO+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=fEV9Tr8N
Subject: [Buildroot] [PATCH v12 03/16] boot/uboot: rename TI_K3_DM option to
 cover further TI K3 SoCs support
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_TARGET_UBOOT_NEEDS_TI_K3_DM option has been introduced initially to
support certain TI K3 devices such as AM62x and AM62Ax that require a
Device Manager (DM) firmware.

This option needs to be renamed to use a more generic name in order
to cover further TI K3 SoCs support along with the new u-boot binman
tool that will be added in followup patch. With binman enabled in
u-boot on TI K3 SoC, ti-k3-boot-firmware is needed at buildtime to
provide ti-sysfw (System Firmware) for all TI K3 SoC along with Device
Manager (DM) firmware for AM62x and AM62Ax devices.

With binman support enabled, we don't need to provide the path of the
Device Manager firmware anymore (see [2]).
We can remove DM="<DM firmware>.xer5f" from UBOOT_MAKE_OPTS.
It also means that we can also remove BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME
used to define DM path.

  DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f

For now, keep BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME and DM only when
ti-k3-image-gen is used. We need to update ti_am62x_sk_defconfig
to use binman before removing them along with ti-k3-image-gen.

[1] 52ce606c05ee3ac869f8087292bc3dbb0d25b79b
[2] https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/09_01_00_08/exports/docs/linux/Foundational_Components/U-Boot/UG-General-Info.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in.legacy              |  8 ++++++++
 boot/uboot/Config.in          | 23 ++++++++++++++---------
 boot/uboot/uboot.mk           |  4 +++-
 configs/ti_am62x_sk_defconfig |  2 +-
 4 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d00196e08b..4084ffa516 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2024.05"
 
+config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
+	bool "u-boot TI K3 DM option has been renamed."
+	select BR2_LEGACY
+	select BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE
+	help
+	  The TI K3 Device Manager is already included in
+	  ti-k3-boot-firmware.
+
 config BR2_PACKAGE_FLUTTER_GALLERY
 	bool "flutter-gallery removed"
 	select BR2_LEGACY
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 39b3f2c81b..e310c09217 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -240,18 +240,23 @@ config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
 	  U-Boot, and that the TEE variable pointing to OPTEE's
 	  tee.elf, is passed during the Buildroot build.
 
-config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
-	bool "U-Boot needs TI K3 Device Manager (DM)"
-	# We use the SoC selection defined for the ti-k3-image-gen
-	# package
-	depends on BR2_TARGET_TI_K3_IMAGE_GEN
-	depends on BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX || BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
+config BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE
+	bool "U-Boot needs ti-k3-boot-firmware"
+	depends on BR2_TARGET_TI_K3_BOOT_FIRMWARE
 	help
-	  Some TI K3 devices need the Device Manager (DM) firmware to
-	  be available for the U-Boot build.
+	  TI K3 devices needs at least ti-sysfw (System Firmware) when
+	  built with u-boot's binman tool.
 
-if BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
+	  Some TI K3 devices using a split firmware boot flow (AM62,
+	  j721e) also need the Device Manager (DM) firmware to be
+	  available for the U-Boot build.
 
+if BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE
+
+# TI_K3_DM_SOCNAME is only needed when ti-k3-image-gen is used for
+# TI K3 devices using the Device Manager (DM) firmware.
+# We use the SoC selection defined for the ti-k3-image-gen
+# package.
 config BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME
 	string
 	default "am62axx" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 491f654cec..47fb419e92 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -194,11 +194,13 @@ UBOOT_DEPENDENCIES += optee-os
 UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
 endif
 
-ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_DM),y)
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE),y)
 UBOOT_TI_K3_DM_SOCNAME = $(call qstrip,$(BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME))
 UBOOT_DEPENDENCIES += ti-k3-boot-firmware
+ifneq ($(UBOOT_TI_K3_DM_SOCNAME),)
 UBOOT_MAKE_OPTS += DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f
 endif
+endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
 UBOOT_DEPENDENCIES += opensbi
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 37df7a93f7..b2814526bb 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -37,7 +37,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_NEEDS_TI_K3_DM=y
+BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
