Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59EFC54798
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 16:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AB704157D;
	Tue, 27 Feb 2024 16:31:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Pq6h9kUsRtr; Tue, 27 Feb 2024 16:31:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FE0C410E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FE0C410E0;
	Tue, 27 Feb 2024 16:31:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5603D1BF30A
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43C6D81438
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9uzvT0ma8vlg for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 16:30:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C5C788145F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5C788145F
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5C788145F
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 16:30:45 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-563c403719cso5596527a12.2
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 08:30:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709051444; x=1709656244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=phS/tveBMz/1vWkwpDjP9AyJw8U+bdgQ1uKjUF/zMXE=;
 b=hjzCs5kEq31JjCooIKgWJLGrhd8Lnkq4HBiF3UyH2mlRkOGUUT8Cyxe6v5bm35j2Q8
 ioBRPdzTmzlyvOtKQ8pXboXp+6Z298fNq7JDozadIK2uXwpAMJjZ5i5oLgNBm68GKcSJ
 zqlKNbFFrDhCqLVy2N1nQRIXPT70uadx0XigddHRcfZQCmtWwi9nj3mcv219f5yK4U9/
 YeRRyjLRLFFl5d6tosanDN+NF9nyrrn8TNbe8pTFBg1om7PH2ctwcMWKTLl1FU6XmqwC
 Re76pvcelyXyhmqH05em5WuX7yNk24Hy3OsAR5ig3LywnGIhWShtXu1HSXc70339JgXX
 YcxQ==
X-Gm-Message-State: AOJu0YwREpAbzrmUKeLft2BJBlVa5si2C2iXSNzsn8TtpIe8AU4HpsXk
 J8IAu32puzkdxtmEe/CBh6w0raBoqMc2hn152DGa2l89uIe7qN8daLFd+tjHrKesKyfVmXykbw+
 /7fs=
X-Google-Smtp-Source: AGHT+IFZwGfrcen+l+fSyMb0OCjxK3hObWcCe+GW8i8KgT9wJXGlcpqddVJmrDOmRBsfF99nluuitg==
X-Received: by 2002:a05:6402:b33:b0:565:47d0:1ea with SMTP id
 bo19-20020a0564020b3300b0056547d001eamr8657360edb.12.1709051443724; 
 Tue, 27 Feb 2024 08:30:43 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i..
 ([2001:b07:6474:ebbf:e567:9129:29c8:388f])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a056402045000b0055edfb81384sm898404edw.60.2024.02.27.08.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 08:30:43 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Feb 2024 17:30:15 +0100
Message-ID: <20240227163019.2876942-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
References: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709051444; x=1709656244;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=phS/tveBMz/1vWkwpDjP9AyJw8U+bdgQ1uKjUF/zMXE=;
 b=NO8G3stUF+vGmNht7YPVvbVPsP6y6Fgx3av2qZFLR81MqguFcR6MLs9tnX8JN+Lz/0
 gm4Qa24RbbzeMG7us1mojnNYvGEIAblg7fF7rqAdy71R0hVmY+bHpC1r8RlWDyDx5PMy
 G4RCReCj7Ir2GIlAkGLYquaB0dvefT9mLx5rw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=NO8G3stU
Subject: [Buildroot] [PATCH v7 13/17] package/ti-k3: move TI_K3_{SECTYPE,
 SOC} out of the image-gen scope
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

Recent versions of U-Boot can use Binman to compile and sign the generated
binaries, thus making the use of custom tools like ti-k3-image-gen no
longer necessary. In ti-k3-image-gen, options such as SECTYPE and SOC were
configured and used outside of it. This patch allows setting such options
even if the package is not enabled.

The patch makes an exception to the Buildroot rule "no subdirectory in
package directory".

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v7:
- Revert change disabling BR2_PACKAGE_TI_K3_SECTYPE_HS_FS for
  BR2_PACKAGE_TI_K3_SOC_AM65X. The change is moved in a separate patch.

Changes in v6:
- Move BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME to ti-k3 (BR2_PACKAGE_TI_K3_DM).
- Disable BR2_PACKAGE_TI_K3_SECTYPE_HS_FS for BR2_PACKAGE_TI_K3_SOC_AM65X

Changes in v5:
- Add SOB tag
- Move the new ti-k3 from boot to package

Added in v4

 boot/ti-k3-image-gen/Config.in          | 61 ++-----------------------
 boot/ti-k3-image-gen/ti-k3-image-gen.mk |  4 +-
 boot/uboot/Config.in                    | 12 +----
 boot/uboot/uboot.mk                     |  2 +-
 configs/ti_am62x_sk_defconfig           |  3 +-
 configs/ti_am64x_sk_defconfig           |  3 +-
 package/Config.in                       |  1 +
 package/ti-k3/Config.in                 | 59 ++++++++++++++++++++++++
 package/ti-k3/ti-k3.mk                  |  7 +++
 9 files changed, 79 insertions(+), 73 deletions(-)
 create mode 100644 package/ti-k3/Config.in
 create mode 100644 package/ti-k3/ti-k3.mk

diff --git a/boot/ti-k3-image-gen/Config.in b/boot/ti-k3-image-gen/Config.in
index d76cef82e911..a57319f4be6d 100644
--- a/boot/ti-k3-image-gen/Config.in
+++ b/boot/ti-k3-image-gen/Config.in
@@ -13,65 +13,12 @@ config BR2_TARGET_TI_K3_IMAGE_GEN
 	  https://git.ti.com/cgit/k3-image-gen/k3-image-gen/
 
 if BR2_TARGET_TI_K3_IMAGE_GEN
-choice
-	prompt "SoC family"
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
-	bool "am62ax"
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
-	bool "am62x"
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
-	bool "am64x"
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
-	bool "am65x"
-
-endchoice
-
-choice
-	prompt "Security type"
-	help
-	  The target SoC security type option for image gen.  Valid
-	  options are "gp" for General Purpose devices, "hs-fs" for
-	  High Security - Field Securable devices, or "hs" for High
-	  Security - Security Enforcing devices.  Note for all High
-	  Security device variants the TI_SECURE_DEV_PKG environmental
-	  variable must be defined at build time pointing to a valid
-	  core-secdev-k3 folder location, otherwise the build will
-	  fail, see
-	  https://git.ti.com/cgit/security-development-tools/core-secdev-k3
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP
-	bool "gp"
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS
-	bool "hs-fs"
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
-	bool "hs"
-
-endchoice
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SOC
-	string
-	default "am62ax" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
-	default "am62x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
-	default "am64x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
-	default "am65x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
 
 config BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE
 	string
-	default "ti-fs"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
-	default "ti-fs"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
-	default "ti-sci" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
-	default "ti-sci" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE
-	string
-	default "gp"    if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP
-	default "hs-fs" if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS
-	default "hs"    if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
+	default "ti-fs"  if BR2_PACKAGE_TI_K3_SOC_AM62AX
+	default "ti-fs"  if BR2_PACKAGE_TI_K3_SOC_AM62X
+	default "ti-sci" if BR2_PACKAGE_TI_K3_SOC_AM64X
+	default "ti-sci" if BR2_PACKAGE_TI_K3_SOC_AM65X
 
 endif
diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.mk b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
index 64be9a18f2c4..aca29bcf1bd4 100644
--- a/boot/ti-k3-image-gen/ti-k3-image-gen.mk
+++ b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
@@ -26,8 +26,8 @@ TI_K3_IMAGE_GEN_DEPENDENCIES = \
 	$(BR2_MAKE_HOST_DEPENDENCY)
 
 TI_K3_IMAGE_GEN_FW_TYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE))
-TI_K3_IMAGE_GEN_SOC = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC))
-TI_K3_IMAGE_GEN_SECTYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE))
+TI_K3_IMAGE_GEN_SOC = $(call qstrip,$(BR2_PACKAGE_TI_K3_SOC))
+TI_K3_IMAGE_GEN_SECTYPE = $(call qstrip,$(BR2_PACKAGE_TI_K3_SECTYPE))
 
 TI_K3_IMAGE_GEN_SYSFW = $(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SECTYPE).bin
 
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index e6e7956adccb..821854d08acc 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -244,21 +244,11 @@ config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
 	bool "U-Boot needs TI K3 Device Manager (DM)"
 	# We use the SoC selection defined for the ti-k3-image-gen
 	# package
-	depends on BR2_TARGET_TI_K3_IMAGE_GEN
-	depends on BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX || BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
+	depends on BR2_PACKAGE_TI_K3_SOC_AM62AX || BR2_PACKAGE_TI_K3_SOC_AM62X
 	help
 	  Some TI K3 devices need the Device Manager (DM) firmware to
 	  be available for the U-Boot build.
 
-if BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
-
-config BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME
-	string
-	default "am62axx" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
-	default "am62xx"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
-
-endif
-
 config BR2_TARGET_UBOOT_NEEDS_OPENSBI
 	bool "U-Boot needs OpenSBI"
 	depends on BR2_TARGET_OPENSBI
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 35a41d96a12d..7cd4636aa292 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -189,7 +189,7 @@ endif
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_DM),y)
 UBOOT_DEPENDENCIES += ti-k3-boot-firmware
 ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),)
-UBOOT_TI_K3_DM_SOCNAME = $(call qstrip,$(BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME))
+UBOOT_TI_K3_DM_SOCNAME = $(call qstrip,$(BR2_PACKAGE_TI_K3_DM_SOCNAME))
 UBOOT_MAKE_OPTS += DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f
 endif
 endif
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index a129e216d25b..2835404a57df 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -11,6 +11,8 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
+BR2_PACKAGE_TI_K3=y
+BR2_PACKAGE_TI_K3_SOC_AM62X=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
@@ -23,7 +25,6 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
-BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2022.10"
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 26195194c7d6..566cbbe4824f 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -11,6 +11,8 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am642-sk"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
+BR2_PACKAGE_TI_K3=y
+BR2_PACKAGE_TI_K3_SOC_AM64X=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
@@ -23,7 +25,6 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am64x"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
-BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2022.10"
diff --git a/package/Config.in b/package/Config.in
index bf0fe078b955..6d3ed34e121b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -629,6 +629,7 @@ endmenu
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
+	source "package/ti-k3/Config.in"
 	source "package/ti-sgx-demos/Config.in"
 	source "package/ti-sgx-km/Config.in"
 	source "package/ti-sgx-um/Config.in"
diff --git a/package/ti-k3/Config.in b/package/ti-k3/Config.in
new file mode 100644
index 000000000000..2a51b1531487
--- /dev/null
+++ b/package/ti-k3/Config.in
@@ -0,0 +1,59 @@
+config BR2_PACKAGE_TI_K3
+	bool "TI K3"
+	help
+	  The TI K3 SOC specific selections.
+
+if BR2_PACKAGE_TI_K3
+
+choice
+	prompt "SoC family"
+
+config BR2_PACKAGE_TI_K3_SOC_AM62AX
+	bool "am62ax"
+
+config BR2_PACKAGE_TI_K3_SOC_AM62X
+	bool "am62x"
+
+config BR2_PACKAGE_TI_K3_SOC_AM64X
+	bool "am64x"
+
+config BR2_PACKAGE_TI_K3_SOC_AM65X
+	bool "am65x"
+
+endchoice
+
+choice
+	prompt "Security type"
+	help
+	  The target SoC security type option.
+
+config BR2_PACKAGE_TI_K3_SECTYPE_GP
+	bool "gp"
+
+config BR2_PACKAGE_TI_K3_SECTYPE_HS_FS
+	bool "hs-fs"
+
+config BR2_PACKAGE_TI_K3_SECTYPE_HS
+	bool "hs"
+
+endchoice
+
+config BR2_PACKAGE_TI_K3_SOC
+	string
+	default "am62ax" if BR2_PACKAGE_TI_K3_SOC_AM62AX
+	default "am62x"  if BR2_PACKAGE_TI_K3_SOC_AM62X
+	default "am64x"  if BR2_PACKAGE_TI_K3_SOC_AM64X
+	default "am65x"  if BR2_PACKAGE_TI_K3_SOC_AM65X
+
+config BR2_PACKAGE_TI_K3_SECTYPE
+	string
+	default "gp"    if BR2_PACKAGE_TI_K3_SECTYPE_GP
+	default "hs-fs" if BR2_PACKAGE_TI_K3_SECTYPE_HS_FS
+	default "hs"    if BR2_PACKAGE_TI_K3_SECTYPE_HS
+
+config BR2_PACKAGE_TI_K3_DM_SOCNAME
+	string
+	default "am62axx" if BR2_PACKAGE_TI_K3_SOC_AM62AX
+	default "am62xx"  if BR2_PACKAGE_TI_K3_SOC_AM62X
+
+endif
diff --git a/package/ti-k3/ti-k3.mk b/package/ti-k3/ti-k3.mk
new file mode 100644
index 000000000000..a2da29f5148c
--- /dev/null
+++ b/package/ti-k3/ti-k3.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# ti-k3
+#
+################################################################################
+
+include $(sort $(wildcard package/ti-k3/*/*.mk))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
