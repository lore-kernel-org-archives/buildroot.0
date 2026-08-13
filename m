Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E3EC5B572
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 17:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9814180F71;
	Thu, 13 Aug 2026 17:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 23PbfGq8AITz; Thu, 13 Aug 2026 17:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60E7F80FBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786641148;
	bh=LyiF8QugEt/LfE2DzAd5hwIJvVxcUYOygPSgSQy7A3k=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YwtIkmorN8ZkUyXzM6xlsLD/27CuNqrTvv67jWx/PpXG+TZLoP+y0933OHciSYjxo
	 lrFtqrHIneF4qxVwJBfwp27lZ5jAne5X8L32+XaEANG5ogXwI0qhljmOvdxIi+oaJ8
	 VF0wRAdlTUDw+n5A0IBphCF3f71bOZLnB1HbgoRGbjvk4vt96Yh2km+ii/LN1OdkD5
	 IuZSVs8EmV8MM0Bb68OqKYFMYzG4ncmsMwfS+Z4rsh96jBjRfjg0XG4qAdDqgAGrPR
	 c9RyKR4l+wSO411UTFuf44FuakodVbZ20c4cr8msoCF7fwYoLw5s7eaTQfmWMKW6sk
	 mmovICdHnMLkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60E7F80FBA;
	Thu, 13 Aug 2026 17:12:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BB17EC
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 17:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11A82607FF
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 17:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5PEVxM30JA0 for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 17:12:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=richard@vodden.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 49B49607F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49B49607F5
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49B49607F5
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 17:12:25 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-47f6609c657so28093f8f.2
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 10:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786641143; x=1787245943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QQQwZUp5s9W0nKLw8iQ0U1bgoWpV9FRcBeWGcDptOz4=;
 b=MruI1h5ZBEjNEF2uKJSawaOA+CjF4Oe2KX1rIZeRlBG5FhpetvN2KicM45Ba9V7ekX
 1/6mK705N+hnlM/k31YL1xAoeDir62PDWg3VsoLJlcs3pJ6bHo3M2BN3WDwc0VKeu6yK
 GCYmycM4aDL8a1Vugf1CGJ7bQLihlJqh2B6Avwh1TwCnaqG4xLcqKJaQV2bTYFj+hJ1x
 TPiRQLwRBLg6+g6w7xhDjOL71QUcLWcWldusuSG9XX9Yb3WSca1a0vYrpE4Ys6KmN8pR
 UhjJo/UMibvnpqbvsYhaCmFCGCOntcGQW+tTHAl2bvNiXnmbLwE+CO5GE0zpkdpmV812
 3K9g==
X-Gm-Message-State: AOJu0Yy+8rWhrOrtmumgYoV6yu2MobLna7DBbrQZc1OENASvgoRYgVi7
 JcgUd/OO3zowi+zlmhK08489QRrT44T3LtYPefCJlGEvUpdSOZ1lHyInhYc2xDy36V9CKhab8Xl
 tzRykCz/AQMQi
X-Gm-Gg: AR+sD10mEeHf1eUuNwgLhMxMEV0b3UhmWQc+ECgYR9thhOZxIK8lHvzYd/cV5hZdCO+
 90KxLIGg4Je1mqUkrbfCx95rsMiInwQgR+u2VniCOF42cVLXezNDbGiT+85GxEnhWFOl08ODtuN
 kGHyqlzJC3/o4lqV7ZqJmxRS9vGcfnJ+M5qpCbyubgXxCG2LzpXzDVrjkzGHNWK6BR/Ia4aMyBj
 H85fVRib6WqIa932tf7mzRg+Sgq6dc0GBzDKqJZR6rQNhnhojbL+BM+8GDWhfTBLfehmggVwCgB
 3fdW64CDpxDRjmalvD19LhpxUvbgZee7B1X58iiPNseHZ8hU6eNoKYeKLtkBnAQKtfKmY+fXJzf
 Dr/ozGO735+/PTy3BGMjeVx6dkHR61cQPjjPgHzxFWXXCjz0IGtggqfuaNom0Osd+ves1anFmYK
 JmEz25FxHumuHEI05rjbwPI6hYpHM6pgLNJ3TvYf00MbgdNdBXLtJZfQSRbC6AZRN3LSQ8wi1DD
 3+sg2tbkgz+n/EKBgjf6YZWyOvBPXpv
X-Received: by 2002:a05:6000:601:b0:47f:f31d:27a4 with SMTP id
 ffacd0b85a97d-48159fe7d23mr10934745f8f.13.1786641143272; 
 Thu, 13 Aug 2026 10:12:23 -0700 (PDT)
Received: from Hamilton.. ([2a0e:1d47:d002:5c00:f03a:f2f4:3357:904])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f21a31dsm832291f8f.9.2026.08.13.10.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2026 10:12:22 -0700 (PDT)
From: Richard Vodden <richard@vodden.com>
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 17:12:08 +0000
Message-ID: <20260813171215.3483906-2-richard@vodden.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813171215.3483906-1-richard@vodden.com>
References: <20260813171215.3483906-1-richard@vodden.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vodden.com; s=google; t=1786641143; x=1787245943; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QQQwZUp5s9W0nKLw8iQ0U1bgoWpV9FRcBeWGcDptOz4=;
 b=ABjSwDR0e0P5u1w/0c2Ysanu73JeDmSACbsr6Ws/GU85Cgrj62bTDeE/rk3wEcoIMA
 6l/xxfxY8YCOG4vq56lSetK2lDrxn5YZ+b+egucB2v7bBqiVPAH37LmRyH3a9JHOitc9
 MziXzrtYkEEo9vnRP5MGe3Gb2HfKHbRGMUlv8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=vodden.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vodden.com header.i=@vodden.com header.a=rsa-sha256
 header.s=google header.b=ABjSwDR0
Subject: [Buildroot] [PATCH 1/2] boot/opensbi: allow building against an
 external platform
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Leo Yu-Chi Liang <ycliang@andestech.com>,
 Alistair Francis <alistair@alistair23.me>, Mark Corbin <mark@dibsco.co.uk>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Kanak Shilledar <kanakshilledar@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Francois Dugast <francois.dugast.foss@gmail.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Richard Vodden <richard@vodden.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

OpenSBI can build a platform that lives outside its source tree by
setting PLATFORM_DIR. For a board whose platform is not upstream, that
is considerably simpler than patching a platform directory into the
OpenSBI source or maintaining a custom tarball.

Replace the BR2_TARGET_OPENSBI_PLAT string with a choice of reference
platform, external platform, or no platform, and pass either PLATFORM or
PLATFORM_DIR accordingly. When PLATFORM is unset OpenSBI derives it from
the basename of PLATFORM_DIR and builds into build/platform/$(PLATFORM),
so OPENSBI_PLAT is set to that basename in order for the install step to
find the firmware. A trailing slash on the directory is stripped, as
$(notdir) would otherwise yield an empty string.

The three conditionals that previously tested BR2_TARGET_OPENSBI_PLAT
against the empty string now test !BR2_TARGET_OPENSBI_PLAT_NONE. Leaving
them referring to the removed symbol would have silently disabled
BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG and INSTALL_DYNAMIC_IMG, producing
no firmware at all.

The in-tree defconfigs that set the old symbol are converted, and a
legacy entry carries an existing value over to the reference platform.

Signed-off-by: Richard Vodden <richard@vodden.com>
---
 Config.in.legacy                        | 18 ++++++++
 boot/opensbi/Config.in                  | 55 +++++++++++++++++++------
 boot/opensbi/opensbi.mk                 | 16 +++++--
 configs/andes_ae350_45_defconfig        |  3 +-
 configs/hifive_unleashed_defconfig      |  3 +-
 configs/hifive_unmatched_defconfig      |  3 +-
 configs/nezha_defconfig                 |  3 +-
 configs/pine64_star64_defconfig         |  3 +-
 configs/qemu_riscv32_virt_defconfig     |  3 +-
 configs/qemu_riscv64_virt_defconfig     |  3 +-
 configs/sipeed_lichee_rv_defconfig      |  3 +-
 configs/sipeed_lichee_rv_dock_defconfig |  3 +-
 configs/sipeed_licheepi_4a_defconfig    |  3 +-
 configs/spike_riscv32_defconfig         |  3 +-
 configs/spike_riscv64_defconfig         |  3 +-
 configs/visionfive2_defconfig           |  3 +-
 16 files changed, 100 insertions(+), 28 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e2f9d9131f..ac451ee37c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,24 @@ endif
 
 comment "Legacy options removed in 2026.08"
 
+config BR2_TARGET_OPENSBI_PLAT
+	string "OpenSBI platform has been replaced"
+	help
+	  The OpenSBI platform is now selected with the "OpenSBI
+	  platform type" choice, which additionally allows building
+	  against a platform directory kept outside the OpenSBI source
+	  tree.
+
+	  Select "Reference platform" to keep the previous behaviour;
+	  the platform name has been carried over automatically.
+
+config BR2_TARGET_OPENSBI_PLAT_WRAP
+	bool
+	default y if BR2_TARGET_OPENSBI_PLAT != ""
+	select BR2_LEGACY
+
+# Note: BR2_TARGET_OPENSBI_PLAT is still referenced from boot/opensbi/Config.in
+
 config BR2_PACKAGE_TS4900_FPGA
 	bool "ts4900-fpga removed"
 	select BR2_LEGACY
diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 6e26da6344..2f4713b147 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -72,25 +72,56 @@ config BR2_TARGET_OPENSBI_LICENSE_FILES
 	  A space-separated list of license files related to the OpenSBI
 	  package.
 
-config BR2_TARGET_OPENSBI_PLAT
-	string "OpenSBI Platform"
-	default ""
+choice
+	prompt "OpenSBI platform type"
+	default BR2_TARGET_OPENSBI_PLAT_REF if BR2_TARGET_OPENSBI_PLAT != "" # legacy
+	default BR2_TARGET_OPENSBI_PLAT_NONE
+	help
+	  Select whether to build against a reference platform shipped
+	  with OpenSBI, or a platform directory kept outside the OpenSBI
+	  source tree.
+
+	  With "No platform", only the platform independent static
+	  library libsbi.a is built. Otherwise the platform specific
+	  library libplatsbi.a and the firmware examples are built too.
+
+config BR2_TARGET_OPENSBI_PLAT_REF
+	bool "Reference platform"
+
+config BR2_TARGET_OPENSBI_PLAT_EXT
+	bool "External platform"
+
+config BR2_TARGET_OPENSBI_PLAT_NONE
+	bool "No platform"
+
+endchoice
+
+config BR2_TARGET_OPENSBI_PLAT_REF_NAME
+	string "OpenSBI reference platform"
+	default BR2_TARGET_OPENSBI_PLAT if BR2_TARGET_OPENSBI_PLAT != "" # legacy
+	depends on BR2_TARGET_OPENSBI_PLAT_REF
+	help
+	  Name of a platform shipped with OpenSBI, as found under its
+	  platform/ directory, e.g. "generic".
+
+config BR2_TARGET_OPENSBI_PLAT_EXT_DIR
+	string "OpenSBI external platform directory"
+	depends on BR2_TARGET_OPENSBI_PLAT_EXT
 	help
-	  Specifies the OpenSBI platform to build. If no platform is
-	  specified only the OpenSBI platform independent static
-	  library libsbi.a is built. If a platform is specified then
-	  the platform specific static library libplatsbi.a and firmware
-	  examples are built.
+	  Path to an out-of-tree platform directory, passed to
+	  OpenSBI as PLATFORM_DIR. OpenSBI derives the platform
+	  name from its basename, so a trailing slash is tolerated
+	  but redundant.
 
 config BR2_TARGET_OPENSBI_INSTALL_DYNAMIC_IMG
 	bool "Install fw_dynamic image"
-	default y if BR2_TARGET_OPENSBI_PLAT != ""
+	default y if !BR2_TARGET_OPENSBI_PLAT_NONE
 	help
 	  This installs the fw_dynamic image.
 
 config BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG
 	bool "Install fw_jump image"
-	default y if BR2_TARGET_OPENSBI_PLAT != ""
+	default y if !BR2_TARGET_OPENSBI_PLAT_NONE
 	help
 	  This installs the fw_jump image.
 
@@ -102,7 +133,7 @@ config BR2_TARGET_OPENSBI_INSTALL_PAYLOAD_IMG
 
 config BR2_TARGET_OPENSBI_LINUX_PAYLOAD
 	bool "Include Linux as OpenSBI Payload"
-	depends on BR2_TARGET_OPENSBI_PLAT != ""
+	depends on !BR2_TARGET_OPENSBI_PLAT_NONE
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_LINUX_KERNEL_IMAGE
 	select BR2_TARGET_OPENSBI_INSTALL_PAYLOAD_IMG
@@ -111,7 +142,7 @@ config BR2_TARGET_OPENSBI_LINUX_PAYLOAD
 
 config BR2_TARGET_OPENSBI_UBOOT_PAYLOAD
 	bool "Include U-Boot as OpenSBI Payload"
-	depends on BR2_TARGET_OPENSBI_PLAT != ""
+	depends on !BR2_TARGET_OPENSBI_PLAT_NONE
 	depends on BR2_TARGET_UBOOT
 	select BR2_TARGET_OPENSBI_INSTALL_PAYLOAD_IMG
 	help
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index f9f550176f..8ca8a29894 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -32,11 +32,21 @@ OPENSBI_MAKE_ENV = \
 	CROSS_COMPILE=$(TARGET_CROSS) \
 	$(call qstrip,$(BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES))
 
-OPENSBI_PLAT = $(call qstrip,$(BR2_TARGET_OPENSBI_PLAT))
-ifneq ($(OPENSBI_PLAT),)
+ifeq ($(BR2_TARGET_OPENSBI_PLAT_REF),y)
+OPENSBI_PLAT = $(call qstrip,$(BR2_TARGET_OPENSBI_PLAT_REF_NAME))
 OPENSBI_MAKE_ENV += PLATFORM=$(OPENSBI_PLAT)
 endif
 
+# OpenSBI derives PLATFORM from $(basename PLATFORM_DIR) when PLATFORM is unset,
+# and builds into build/platform/$(PLATFORM)/ -- so OPENSBI_PLAT must match that
+# for the install step below to find the firmware. patsubst strips any trailing
+# slash, which would otherwise make notdir return an empty string.
+ifeq ($(BR2_TARGET_OPENSBI_PLAT_EXT),y)
+OPENSBI_PLAT_EXT_DIR = $(patsubst %/,%,$(call qstrip,$(BR2_TARGET_OPENSBI_PLAT_EXT_DIR)))
+OPENSBI_PLAT = $(notdir $(OPENSBI_PLAT_EXT_DIR))
+OPENSBI_MAKE_ENV += PLATFORM_DIR=$(OPENSBI_PLAT_EXT_DIR)
+endif
+
 ifeq ($(BR2_TARGET_OPENSBI_LINUX_PAYLOAD),y)
 OPENSBI_DEPENDENCIES += linux
 OPENSBI_MAKE_ENV += FW_PAYLOAD_PATH="$(BINARIES_DIR)/Image"
@@ -69,7 +79,7 @@ OPENSBI_INSTALL_IMAGES = YES
 OPENSBI_FW_IMAGES += payload
 endif
 
-ifneq ($(OPENSBI_PLAT),)
+ifneq ($(BR2_TARGET_OPENSBI_PLAT_NONE),y)
 define OPENSBI_INSTALL_IMAGES_CMDS
 	$(foreach f,$(OPENSBI_FW_IMAGES),\
 		$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_$(f).bin \
diff --git a/configs/andes_ae350_45_defconfig b/configs/andes_ae350_45_defconfig
index 80b780b6e0..a70b228155 100644
--- a/configs/andes_ae350_45_defconfig
+++ b/configs/andes_ae350_45_defconfig
@@ -21,7 +21,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index e83af773f7..3771dd2ad0 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -27,7 +27,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
diff --git a/configs/hifive_unmatched_defconfig b/configs/hifive_unmatched_defconfig
index 0b63ce15ff..b4ac91c557 100644
--- a/configs/hifive_unmatched_defconfig
+++ b/configs/hifive_unmatched_defconfig
@@ -27,7 +27,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
diff --git a/configs/nezha_defconfig b/configs/nezha_defconfig
index c234b3e243..914b362e22 100644
--- a/configs/nezha_defconfig
+++ b/configs/nezha_defconfig
@@ -21,7 +21,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.4"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/pine64_star64_defconfig b/configs/pine64_star64_defconfig
index a0356447d5..88b20bfee3 100644
--- a/configs/pine64_star64_defconfig
+++ b/configs/pine64_star64_defconfig
@@ -17,7 +17,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="100M"
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index a57c94910c..714e5ec63a 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -14,6 +14,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 BR2_PACKAGE_HOST_QEMU=y
 BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 0d91971d1c..91b49068af 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -13,6 +13,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 BR2_PACKAGE_HOST_QEMU=y
 BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
diff --git a/configs/sipeed_lichee_rv_defconfig b/configs/sipeed_lichee_rv_defconfig
index 750d2d6e3b..eba7777bf5 100644
--- a/configs/sipeed_lichee_rv_defconfig
+++ b/configs/sipeed_lichee_rv_defconfig
@@ -16,7 +16,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/sipeed_lichee_rv_dock_defconfig b/configs/sipeed_lichee_rv_dock_defconfig
index 8c8dd2771b..56ef107086 100644
--- a/configs/sipeed_lichee_rv_dock_defconfig
+++ b/configs/sipeed_lichee_rv_dock_defconfig
@@ -24,7 +24,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/sipeed_licheepi_4a_defconfig b/configs/sipeed_licheepi_4a_defconfig
index c7867ed05d..e57536c7fe 100644
--- a/configs/sipeed_licheepi_4a_defconfig
+++ b/configs/sipeed_licheepi_4a_defconfig
@@ -30,7 +30,8 @@ BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_GIT=y
 BR2_TARGET_OPENSBI_CUSTOM_REPO_URL="https://github.com/revyos/thead-opensbi.git"
 BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION="61d7484c752a5e4c464d5dc18e21d9ac67fbbefa"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="light_lpi4a"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
diff --git a/configs/spike_riscv32_defconfig b/configs/spike_riscv32_defconfig
index a73f335f34..22a1d34446 100644
--- a/configs/spike_riscv32_defconfig
+++ b/configs/spike_riscv32_defconfig
@@ -12,6 +12,7 @@ BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 BR2_TARGET_OPENSBI_LINUX_PAYLOAD=y
 BR2_PACKAGE_HOST_RISCV_ISA_SIM=y
diff --git a/configs/spike_riscv64_defconfig b/configs/spike_riscv64_defconfig
index 7b698737e2..feedc9b2a8 100644
--- a/configs/spike_riscv64_defconfig
+++ b/configs/spike_riscv64_defconfig
@@ -11,6 +11,7 @@ BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 BR2_TARGET_OPENSBI_LINUX_PAYLOAD=y
 BR2_PACKAGE_HOST_RISCV_ISA_SIM=y
diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index 8223e6faa1..0cbe61c2b1 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -20,7 +20,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES="FW_TEXT_START=0x40000000 FW_OPTIONS=0"
 BR2_TARGET_UBOOT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
