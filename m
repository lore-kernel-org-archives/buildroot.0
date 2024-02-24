Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFA6C48BF6
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 20:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BC57408E8;
	Sat, 24 Feb 2024 20:58:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R_AKKC-F25eJ; Sat, 24 Feb 2024 20:58:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34DC040993
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34DC040993;
	Sat, 24 Feb 2024 20:58:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3ABB81BF852
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25EB140609
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2r4pYKmqSY1b for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 20:57:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4416A405EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4416A405EB
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4416A405EB
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 20:57:47 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-55a035669d5so3179364a12.2
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 12:57:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708808265; x=1709413065;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D7NPF6iJ7GaUF/FsmELHStpeZfopwCtBOZA2AGHbXko=;
 b=aMtw0QFcB7FtanBH4G3hsROoPgvYy4IQTNZPMVYsOYS1wgwKnjvwIGZ0+9iPcpE3qZ
 JAye7JXBj13wbQqocBH77YOBRvWdc7iGMDE3R/mcBn27g/ziVl0AIL+mEovdqj6iWZ/k
 yxi/8Wr6h3aG2oc1W3PNyCS0dTem/DJNBbWRskk6u48ri68Ldp1VPk1OZGIMQXy2/EQB
 o43rJfnNo38ET5rbeMh7UtxEl+17T/7hQ6yTQNFhe8eXYQnVPyfEFX3MKBMkwloezBYc
 KSizfLf7+RaKWMQezC/Ntdg8bTP2E/1+ZUscZRA4OQtqD6WiRWSHwhOBaEwYPufzLxs6
 QYiQ==
X-Gm-Message-State: AOJu0YyWChRMe1ZL9yU7AOvNMeOYk2Mv+W8TMyFnWv2ZinYweHA4/Yzs
 scUcO+K507EKCuUutjCc6H1fh4C5O6qgbxigQ90rrteip1T2GOBlXNn8SynJnSlksVJfxYprqXK
 k2oI=
X-Google-Smtp-Source: AGHT+IG+AsjZV9Nt+sw3AWSKV7CNHUwwGvgJjh0857CGtSVGaJHM+G+2oPWtupL0zI6EZRxNHxdlJw==
X-Received: by 2002:a17:906:e29a:b0:a42:f222:c832 with SMTP id
 gg26-20020a170906e29a00b00a42f222c832mr1226202ejb.1.1708808264971; 
 Sat, 24 Feb 2024 12:57:44 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 tk6-20020a170907c28600b00a4306ac4c77sm425506ejc.197.2024.02.24.12.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Feb 2024 12:57:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 21:56:50 +0100
Message-ID: <20240224205654.1546744-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
References: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708808265; x=1709413065;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D7NPF6iJ7GaUF/FsmELHStpeZfopwCtBOZA2AGHbXko=;
 b=Wz41qqgpeBuat70i1FeriOK0v1L+liBhVY1Z0AD8XVbvGEjg/8BgPlZ51ecHx/q2CR
 8jHzI3an31ZubAvTHJX9M8yydeUtMSqia7CZXFsNLCrO8jxX9fm6REJ+vEiDVONSkd3F
 PJuIFOfE4SIjTQcoqW7YYXnSnUVz9iL4Je5CE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Wz41qqgp
Subject: [Buildroot] [PATCH v6 13/16] package/ti-k3: move TI_K3_{SECTYPE,
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
 package/ti-k3/Config.in                 | 60 ++++++++++++++++++++++++
 package/ti-k3/ti-k3.mk                  |  7 +++
 9 files changed, 80 insertions(+), 73 deletions(-)
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
index 9157a4b738c3..c21fe7c99fc1 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -189,7 +189,7 @@ endif
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_DM),y)
 UBOOT_DEPENDENCIES += ti-k3-boot-firmware
 ifneq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
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
index 000000000000..b8545b7bca62
--- /dev/null
+++ b/package/ti-k3/Config.in
@@ -0,0 +1,60 @@
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
+	depends on !BR2_PACKAGE_TI_K3_SOC_AM65X
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
