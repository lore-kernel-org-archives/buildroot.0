Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9409CCD1288
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 16:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47E8A82287;
	Sat, 30 Mar 2024 16:03:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZuxDwZLUeBn; Sat, 30 Mar 2024 16:03:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9894F8226D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9894F8226D;
	Sat, 30 Mar 2024 16:03:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 08F6B1BF3DF
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 16:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9B99606E9
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 16:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RviJQF-gmJ6B for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 16:02:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F25B1606CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F25B1606CE
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F25B1606CE
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 16:02:56 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5157af37806so3184411e87.0
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 09:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711814574; x=1712419374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6b2mFktqgsDVahTG36yqwYydAMnP8vuHi9nnxDrUDqw=;
 b=WQKdmwEutfybQLi+YU0D+/JIaXkwuRR0tmWf9FNDHeabVpL9coyX/y1uDo/1WVhZKd
 Kav4UDNpolmeydaTEMOKgsBwfz65RfP34Z3espLUbXMp6tZ0fuw3itHpcecEvOqewSpu
 GamMVjAHO1uxNRYDOj4pZkYEmJFjgJYJwhxo1RMhdsoOYa4nSsW/r4Hlk01TFeWnfVfK
 +0DQ2zEjroPF7TfWE3lcUeZTOXKp8RkaMIsDnDcKWknv1CMM1bezy1Ip6uUzOLjuMRoP
 txl3o1t0duqem9cCxi7g3Uc3UziEGDmPCl5fZvksoLSAz6U6qFS3RiwZT3qZHWMHjybe
 pK2Q==
X-Gm-Message-State: AOJu0YzORzeuZ4IiM+qJbVCGQfJeePZqETRJyOiHlO2WQFsMnY3FTMPq
 NR9Dw6IAmRdy/Q5/maOfqg4qGWttSwYP9Ntd0hTTOViHNM6jflOwMBp125YQEv7b+BrQPJyJNC6
 RQME=
X-Google-Smtp-Source: AGHT+IEyTMgJ8YdCIfzgWxiBBP5QzlFTh3VfiQZKkly6RDAmHxdioMR5Uo6Cyu9hivVLTLRQgTDMEg==
X-Received: by 2002:ac2:4a71:0:b0:516:9f28:f3d6 with SMTP id
 q17-20020ac24a71000000b005169f28f3d6mr913534lfp.1.1711814574081; 
 Sat, 30 Mar 2024 09:02:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a056402004d00b0056c633354c6sm2127107edu.45.2024.03.30.09.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 09:02:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 17:02:36 +0100
Message-ID: <20240330160244.3214733-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
References: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711814574; x=1712419374;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6b2mFktqgsDVahTG36yqwYydAMnP8vuHi9nnxDrUDqw=;
 b=H9jWP9ltF3zLAz4FvZu70B7zmOF8E/PwxEKqYLdJPxcgx8p34vFIuJFvCabJQr6T7Y
 jLM9XZ282xFMTcg4FsUkgjTAE4ffg92xegCuH+qMgeuyfJfY30VXV/CktV4bj2MtJXDF
 8fTJL02myyAs4DB5xe4CyzaFVGYOKPynf1LUQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=H9jWP9lt
Subject: [Buildroot] [PATCH v10 04/12] package/ti-k3: move TI_K3_{SECTYPE,
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
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "Yann E . Morin" <yann.morin.1998@free.fr>, bryce@redpinelabs.com,
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
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
index 37df7a93f77a..19f7a7bd771a 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -12,6 +12,8 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
+BR2_PACKAGE_TI_K3=y
+BR2_PACKAGE_TI_K3_SOC_AM62X=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
@@ -24,7 +26,6 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
-BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2022.10"
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 1ebdec68ac01..a19cf6f85572 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -12,6 +12,8 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am642-sk"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
+BR2_PACKAGE_TI_K3=y
+BR2_PACKAGE_TI_K3_SOC_AM64X=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
@@ -24,7 +26,6 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am64x"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
-BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2022.10"
diff --git a/package/Config.in b/package/Config.in
index 410fe0f4935a..15ee978b6aba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -630,6 +630,7 @@ endmenu
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
