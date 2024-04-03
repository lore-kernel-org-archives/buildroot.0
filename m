Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77653CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44822417ED;
	Wed,  3 Apr 2024 19:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZrqoxWZm6HK; Wed,  3 Apr 2024 19:54:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FC38418D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FC38418D3;
	Wed,  3 Apr 2024 19:54:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FAC11BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C84440568
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1HazltNTO3VY for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:54:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8DEC2402E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DEC2402E6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DEC2402E6
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:54:10 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3434c6e1941so105710f8f.0
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 12:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712174048; x=1712778848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WMODm7u2Yp++QmI1JL1QQdaE0q9Bka3HE1srQjiefyg=;
 b=EFh4513IC7hWs3jQc1lyOWNfn4faRzEWtoNVBjT/wgcMMo5DwyWRAdocX3NIgRyncl
 WpUXsSI+l733hfMb+j30cfDr0+s+9DLQOJzv0tx670HS/oxGKJd+nhk8RvTchBZtPDqL
 UuQzU4S61MOi5NuAT7fJKXsahzeXET4utFDBMsLmsdjL1YAtCr6SbsU6a0rS+1+v96Xk
 95NDFoHalkjpekaFDLD1FwRF5Kf98mP1VhIutN1RZE/ClzjxYjLL4NIhFh9mvmCi7ZDZ
 aijVRw3q+yIiO6b6XaRjQtf2ZvW4rk6LILT6gMPPQCYJ5D9WzYM1PErigL03NJsn92EY
 Km2g==
X-Gm-Message-State: AOJu0Yz/aB319juMGeAmnxS0VV7tE6egVaKAWD3j8w4hy8Pjwj3l+agc
 0m4Lle8rMB1O7UgrRg46jv5eJScC3WIClchwqLkbtOsmp8hMMH3cwb4V4GC+6PPfGOsMIsHnsZV
 z
X-Google-Smtp-Source: AGHT+IF3qo0RfF1nUmSYk9PJTFOzOyMHtztZjOAdu6H8tUHAenjdEW8+aX351hzk7cJQPN8mqF66nQ==
X-Received: by 2002:a05:6000:190:b0:33e:737f:9363 with SMTP id
 p16-20020a056000019000b0033e737f9363mr284946wrx.70.1712174048454; 
 Wed, 03 Apr 2024 12:54:08 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm15595571wrb.87.2024.04.03.12.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 12:54:08 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 21:53:38 +0200
Message-ID: <20240403195403.1359007-5-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403195403.1359007-1-romain.naour@smile.fr>
References: <20240403195403.1359007-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712174048; x=1712778848;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WMODm7u2Yp++QmI1JL1QQdaE0q9Bka3HE1srQjiefyg=;
 b=HkAvZbLyAfgAcCQAkCOlYyLxeWkx1yDK2C8WYJb+oL/zuJFuik2JenYVcPJ2Pr/+Sf
 z4ok5IzULxVbc6wesoCnpFloH8syW+e2a1w5QDyjALZQF5/3UA0rYzSDPA9gtKnP2eRQ
 7Cp8o1l0G3+nufJZ45FeUSicIgyg3CKMimNPPqanBlgpcTdu02TovHTR+FaN25ZMH9+b
 jCOtHMVntui+yL31+M9NVfJjNj+kBPlUAqAbCCxH9+l1cAKuWOb8aDVUJOpDFPsbHkUv
 wLLL2b274SB3yk6WevdTFoNac2GK1WfvDg4Dwa/LnOPyW0NEtF8zktLFwKdkohXzAOJl
 N9Yw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=HkAvZbLy
Subject: [Buildroot] [PATCH v11 04/17] package/ti-k3: move SoC familly and
 security type choices out of the image-gen scope
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

Recent versions of U-Boot can use Binman to compile and sign the
generated binaries, thus making the use of custom tools like
ti-k3-image-gen no longer necessary. In ti-k3-image-gen, options such
as SECTYPE and SOC were configured and used outside of it. This patch
allows setting such options even if the package is not enabled.

Move only the "SoC family" and "Security type" booleans to the new
ti-k3 package since it will no longer be necessary to define strings
variant currently used only by ti-k3-image-gen.

The BR2_TARGET_UBOOT_NEEDS_TI_K3_DM option is actually only needed
using ti-k3-image-gen and will be removed when all TI based defconfig
will be updated to use binman.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Changes in v11:
- Move only the "SoC family" and "Security type" booleans
- keep BR2_TARGET_UBOOT_NEEDS_TI_K3_DM depends on ti-k3-image-gen
- Update the patch title

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
---
 boot/ti-k3-image-gen/Config.in | 63 ++++++----------------------------
 boot/uboot/Config.in           | 10 +++---
 configs/ti_am62x_sk_defconfig  |  3 +-
 configs/ti_am64x_sk_defconfig  |  3 +-
 package/Config.in              |  1 +
 package/ti-k3/Config.in        | 43 +++++++++++++++++++++++
 package/ti-k3/ti-k3.mk         |  7 ++++
 7 files changed, 71 insertions(+), 59 deletions(-)
 create mode 100644 package/ti-k3/Config.in
 create mode 100644 package/ti-k3/ti-k3.mk

diff --git a/boot/ti-k3-image-gen/Config.in b/boot/ti-k3-image-gen/Config.in
index eb0f589fa7..5cdf52d452 100644
--- a/boot/ti-k3-image-gen/Config.in
+++ b/boot/ti-k3-image-gen/Config.in
@@ -13,66 +13,25 @@ config BR2_TARGET_TI_K3_IMAGE_GEN
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
-	depends on !BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
-	bool "hs"
-
-endchoice
 
 config BR2_TARGET_TI_K3_IMAGE_GEN_SOC
 	string
-	default "am62ax" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
-	default "am62x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
-	default "am64x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
-	default "am65x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
+	default "am62ax" if BR2_PACKAGE_TI_K3_SOC_AM62AX
+	default "am62x"  if BR2_PACKAGE_TI_K3_SOC_AM62X
+	default "am64x"  if BR2_PACKAGE_TI_K3_SOC_AM64X
+	default "am65x"  if BR2_PACKAGE_TI_K3_SOC_AM65X
 
 config BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE
 	string
-	default "ti-fs"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
-	default "ti-fs"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
-	default "ti-sci" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
-	default "ti-sci" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
+	default "ti-fs"  if BR2_PACKAGE_TI_K3_SOC_AM62AX
+	default "ti-fs"  if BR2_PACKAGE_TI_K3_SOC_AM62X
+	default "ti-sci" if BR2_PACKAGE_TI_K3_SOC_AM64X
+	default "ti-sci" if BR2_PACKAGE_TI_K3_SOC_AM65X
 
 config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE
 	string
-	default "gp"    if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP
-	default "hs-fs" if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS
-	default "hs"    if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
+	default "gp"    if BR2_PACKAGE_TI_K3_SECTYPE_GP
+	default "hs-fs" if BR2_PACKAGE_TI_K3_SECTYPE_HS_FS
+	default "hs"    if BR2_PACKAGE_TI_K3_SECTYPE_HS
 
 endif
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index beafb38930..31ecdeec12 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -242,10 +242,10 @@ config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
 
 config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
 	bool "U-Boot needs TI K3 Device Manager (DM)"
-	# We use the SoC selection defined for the ti-k3-image-gen
-	# package
 	depends on BR2_TARGET_TI_K3_IMAGE_GEN
-	depends on BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX || BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
+	# We use the SoC selection defined for the ti-k3 package
+	depends on BR2_PACKAGE_TI_K3
+	depends on BR2_PACKAGE_TI_K3_SOC_AM62AX || BR2_PACKAGE_TI_K3_SOC_AM62X
 	help
 	  Some TI K3 devices need the Device Manager (DM) firmware to
 	  be available for the U-Boot build.
@@ -254,8 +254,8 @@ if BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
 
 config BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME
 	string
-	default "am62axx" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
-	default "am62xx"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
+	default "am62axx" if BR2_PACKAGE_TI_K3_SOC_AM62AX
+	default "am62xx"  if BR2_PACKAGE_TI_K3_SOC_AM62X
 
 endif
 
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 37df7a93f7..19f7a7bd77 100644
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
index 1ebdec68ac..a19cf6f855 100644
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
index 410fe0f493..15ee978b6a 100644
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
index 0000000000..1c48f1cb55
--- /dev/null
+++ b/package/ti-k3/Config.in
@@ -0,0 +1,43 @@
+config BR2_PACKAGE_TI_K3
+	bool "TI K3"
+	depends on BR2_aarch64
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
+endif
diff --git a/package/ti-k3/ti-k3.mk b/package/ti-k3/ti-k3.mk
new file mode 100644
index 0000000000..a2da29f514
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
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
