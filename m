Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E44DC5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 13:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9219822E3;
	Fri,  1 Mar 2024 13:37:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7VCWRtjA5e8v; Fri,  1 Mar 2024 13:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E1DC83403
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E1DC83403;
	Fri,  1 Mar 2024 13:37:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46D111BF2C1
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 338664193C
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9h75z2QBZz7A for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 13:36:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 509C14016D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 509C14016D
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 509C14016D
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 13:36:42 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56694fdec74so2733069a12.1
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 05:36:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709300200; x=1709905000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w3KI7gDy3tCDmAy3KOOSTnsiV1/LGOV0AnlK1nRW7tw=;
 b=xHKioYO7FsqwjLc8rVCoQCAeRSrmornh7hk6ofIVy8k2IzI9UmVCm6cXCw7Y648+eQ
 qYaOlHH0rFUsp1huUppVDFFCWYvG+Ke0/HS+eWyxNiokLlwp/BPMR+UgqbzxjDYGyN//
 yy0/TMGb4verGfOYSrrQDMS/j0UAQsyyz+vQyqnzfnE3G5ADIasPzxCoVF2ghaC7Vdg8
 57alw/5byUeu8n1UAOhsZz+eL/czTYviVVnrZreGBcSKAd5RKjNonmueHoCaTsVijXw6
 2t5vAKkBwOGRHMkKCRLrRVM5rmUAqQKI+9Rk6jJi6aWlL6+p4mZv9QaZw6hOtqM7PucB
 vHTQ==
X-Gm-Message-State: AOJu0Yxd8MQ6DtE7xOY4BuGcD5rlt1nHkrdr91T+vNFaNsoX/w/OtnsQ
 0BFMN9BYS2sXTQ5PPxZk5PBXg6C2PkrGI2/QHvtUMEJRYUGEcLJPm5W48r8vCBdg7EHnZUA8FGT
 /v1U=
X-Google-Smtp-Source: AGHT+IEyDgw4260ytqQFIiEYUMiLmpOTkY/2VbeRsax273BDG6ynF8QxjBMScnPrALv3gPHboTb3ug==
X-Received: by 2002:a50:c943:0:b0:563:c54e:f1 with SMTP id
 p3-20020a50c943000000b00563c54e00f1mr1399970edh.2.1709300200166; 
 Fri, 01 Mar 2024 05:36:40 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5260:58bc:42cc:9d46])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a056402033c00b005659ea1caf0sm1566608edw.6.2024.03.01.05.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 05:36:39 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 14:36:10 +0100
Message-ID: <20240301133620.3547430-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709300200; x=1709905000;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w3KI7gDy3tCDmAy3KOOSTnsiV1/LGOV0AnlK1nRW7tw=;
 b=XntgD3YV8B3qT/SJ2LBBT15qvQ3UH9sEUdswxHT/z6WdJ+1h6MxyUtJsqy2p0a9FHj
 0jTuiHoBHNTZE4jdOzf4Tmsc+H2opdv9n9awaZBNbWGfLFQNyGdggh5Yt/x0/CazFzPf
 M5FeFUVvuqVKPU3lQnMYll2jejSGNsV0Smkp4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=XntgD3YV
Subject: [Buildroot] [PATCH v8 13/23] package/ti-k3: move TI_K3_{SECTYPE,
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
