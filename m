Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3541D15D8C
	for <buildroot@archiver.kernel.org>; Mon, 21 Oct 2024 13:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3702A80DE1;
	Mon, 21 Oct 2024 13:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_cNYQF28zL7; Mon, 21 Oct 2024 13:26:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 733AA80DA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 733AA80DA5;
	Mon, 21 Oct 2024 13:26:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 382CEAF2
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 13:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E2EC403B4
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 13:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pwhrt1oNRzMI for <buildroot@buildroot.org>;
 Mon, 21 Oct 2024 13:26:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F44340302
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F44340302
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F44340302
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 13:26:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91BE46000D;
 Mon, 21 Oct 2024 13:26:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Oct 2024 13:26:34 +0000
Message-Id: <20241021132634.2435063-4-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241021132634.2435063-1-kory.maincent@bootlin.com>
References: <20241021132634.2435063-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729517204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5XpLxRT5sh/SPzsk/ZNbUzvg6J7lb31rVxBjj+b077s=;
 b=WzerptCJu/Vyl/9XHVEKEx+fxmYbJjLjkQRCG+ENiiV3aWC9mmEcmoxypyXvYQp6mIeHDK
 3vT8yvLRsl3z2eBvdnDLJoKX9VWlLOdVVxSxuILY3WUyM/55wNyOPWzclo8iiIji/yWU6z
 45d010VCQLj45OpSb6hlSvMlA6u1NNsfl0bx99apcMiFRdCB/Ci2qWJDKg1LNTqJ1RmNla
 2Fr4VLZxSjjsypi9e6JH/zvH7NXobWEbEpfEsJXTyXTcL5IdfE8kcmIaZJO9BPkW2IsvL1
 nTvBFidxmN7nCFaTGfMOuQXtEXFXzAZXpbPLGpohxtTU5rl77mPAk1v2G56dvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WzerptCJ
Subject: [Buildroot] [PATCH v7 3/3] boot: Add support for TrustedFirmware-M
 package
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, thomas.petazzoni@bootlin.com,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for TrustedFirmware-M:
https://trustedfirmware-m.readthedocs.io
https://git.trustedfirmware.org/TF-M/trusted-firmware-m.git

Trusted Firmware-M (TF-M) implements the Secure Processing Environment
(SPE) for Armv8-M, Armv8.1-M architectures (e.g. the Cortex-M33,
Cortex-M23, Cortex-M55, Cortex-M85 processors) or dual-core platforms.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Changes in v7:
- Move back to 3rd parties managed by subpackages instead of EXTRA_DOWNLOAD
- Use git repo for 3rd parties instead of Github generated tarballs.

Changes in v6:
- Use EXTRA_DOWNLOAD instead of subpackages for 3rd parties.
- Remove TF-M tests 3rd parties.
- Remove 3rd parties submenu in Kconfig.
- Remove useless environment to have a cleaner cmake command.
- Replace the build test by a genrandconfig update.

Changes in v4:
- Fix a recursive dependency loop issue. TF-M was depend on 3rd parties
   which where was patch dependent on TF-M to have access to their patches.
   Instead patch the 3rd parties sources in the TF-M packages.

Changes in v3:
- Add select BR2_HOST_CMAKE_AT_LEAST_3_21 to avoid cmake configure error
   due to old cmake version.
- Fix a Kconfig check-package too long line warning.

Changes in v2:
- Add TF-M to DEVELOPERS file
- Fix few nit.
---
 DEVELOPERS                             |   1 +
 boot/Config.in                         |   1 +
 boot/tf-m/Config.in                    |  80 ++++++++++++++++++
 boot/tf-m/tf-m.hash                    |   3 +
 boot/tf-m/tf-m.mk                      | 111 +++++++++++++++++++++++++
 boot/tf-m/tfm-cmsis/Config.in          |  12 +++
 boot/tf-m/tfm-cmsis/tfm-cmsis.hash     |   3 +
 boot/tf-m/tfm-cmsis/tfm-cmsis.mk       |  20 +++++
 boot/tf-m/tfm-mbedtls/Config.in        |  12 +++
 boot/tf-m/tfm-mbedtls/tfm-mbedtls.hash |   3 +
 boot/tf-m/tfm-mbedtls/tfm-mbedtls.mk   |  21 +++++
 boot/tf-m/tfm-mcuboot/Config.in        |  12 +++
 boot/tf-m/tfm-mcuboot/tfm-mcuboot.hash |   3 +
 boot/tf-m/tfm-mcuboot/tfm-mcuboot.mk   |  20 +++++
 boot/tf-m/tfm-qcbor/Config.in          |  12 +++
 boot/tf-m/tfm-qcbor/tfm-qcbor.hash     |   3 +
 boot/tf-m/tfm-qcbor/tfm-qcbor.mk       |  20 +++++
 utils/genrandconfig                    |   3 +
 18 files changed, 340 insertions(+)
 create mode 100644 boot/tf-m/Config.in
 create mode 100644 boot/tf-m/tf-m.hash
 create mode 100644 boot/tf-m/tf-m.mk
 create mode 100644 boot/tf-m/tfm-cmsis/Config.in
 create mode 100644 boot/tf-m/tfm-cmsis/tfm-cmsis.hash
 create mode 100644 boot/tf-m/tfm-cmsis/tfm-cmsis.mk
 create mode 100644 boot/tf-m/tfm-mbedtls/Config.in
 create mode 100644 boot/tf-m/tfm-mbedtls/tfm-mbedtls.hash
 create mode 100644 boot/tf-m/tfm-mbedtls/tfm-mbedtls.mk
 create mode 100644 boot/tf-m/tfm-mcuboot/Config.in
 create mode 100644 boot/tf-m/tfm-mcuboot/tfm-mcuboot.hash
 create mode 100644 boot/tf-m/tfm-mcuboot/tfm-mcuboot.mk
 create mode 100644 boot/tf-m/tfm-qcbor/Config.in
 create mode 100644 boot/tf-m/tfm-qcbor/tfm-qcbor.hash
 create mode 100644 boot/tf-m/tfm-qcbor/tfm-qcbor.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 069965680b..8d462686ad 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2030,6 +2030,7 @@ F:	board/octavo/osd32mp1-brk/
 F:	board/octavo/osd32mp1-red/
 F:	configs/octavo_osd32mp1_brk_defconfig
 F:	configs/octavo_osd32mp1_red_defconfig
+F:	boot/tf-m/
 
 N:	Kris Bahnsen <kris@embeddedTS.com>
 F:	package/wilc-firmware/
diff --git a/boot/Config.in b/boot/Config.in
index 5c8d0e7ee5..d728a5c542 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -17,6 +17,7 @@ source "boot/shim/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/ti-k3-boot-firmware/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
+source "boot/tf-m/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
 source "boot/xilinx-prebuilt/Config.in"
diff --git a/boot/tf-m/Config.in b/boot/tf-m/Config.in
new file mode 100644
index 0000000000..1c82a2c840
--- /dev/null
+++ b/boot/tf-m/Config.in
@@ -0,0 +1,80 @@
+config BR2_TARGET_TF_M
+	bool "TrustedFirmware-M (TF-M)"
+	select BR2_HOST_CMAKE_AT_LEAST_3_21
+	help
+	  Enable this option if you want to build the TF-M for your
+	  ARMv8-M microcontroller.
+
+	  https://trustedfirmware-m.readthedocs.io
+
+if BR2_TARGET_TF_M
+choice
+	prompt "TF-M Version"
+	help
+	  Select the specific TF-M version you want to use
+
+config BR2_TARGET_TF_M_LATEST_VERSION
+	bool "v2.1.0"
+
+config BR2_TARGET_TF_M_CUSTOM_VERSION
+	bool "Custom version"
+	help
+	  This option allows to use a specific official version
+
+config BR2_TARGET_TF_M_CUSTOM_TARBALL
+	bool "Custom tarball"
+
+config BR2_TARGET_TF_M_CUSTOM_GIT
+	bool "Custom Git repository"
+
+endchoice
+
+config BR2_TARGET_TF_M_CUSTOM_TARBALL_LOCATION
+	string "URL of custom TF-M tarball"
+	depends on BR2_TARGET_TF_M_CUSTOM_TARBALL
+
+config BR2_TARGET_TF_M_CUSTOM_VERSION_VALUE
+	string "TF-M version"
+	depends on BR2_TARGET_TF_M_CUSTOM_VERSION
+
+if BR2_TARGET_TF_M_CUSTOM_GIT
+
+config BR2_TARGET_TF_M_CUSTOM_REPO_URL
+	string "URL of custom repository"
+
+config BR2_TARGET_TF_M_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	help
+	  Revision to use in the typical format used by Git
+	  E.G. a sha id, a tag, ..
+
+endif
+
+config BR2_TARGET_TF_M_VERSION
+	string
+	default "0c4c99ba33b3e66deea070e149279278dc7647f4" \
+				if BR2_TARGET_TF_M_LATEST_VERSION
+	default "custom"	if BR2_TARGET_TF_M_CUSTOM_TARBALL
+	default BR2_TARGET_TF_M_CUSTOM_REPO_VERSION \
+				if BR2_TARGET_TF_M_CUSTOM_GIT
+	default BR2_TARGET_TF_M_CUSTOM_VERSION_VALUE \
+				if BR2_TARGET_TF_M_CUSTOM_VERSION
+
+source "boot/tf-m/tfm-mbedtls/Config.in"
+source "boot/tf-m/tfm-mcuboot/Config.in"
+source "boot/tf-m/tfm-qcbor/Config.in"
+source "boot/tf-m/tfm-cmsis/Config.in"
+
+config BR2_TARGET_TF_M_PLATFORM
+	string "TF-M platform path"
+	help
+	  Target plaform path to build for.
+	  E.G. 'arm/mps2/an521'
+
+config BR2_TARGET_TF_M_ADDITIONAL_VARIABLES
+	string "Additional TF-M build variables"
+	help
+	  Additional parameters for the TF-M build
+	  E.G. '-DTFM_ISOLATION_LEVEL=2 -DCMAKE_BUILD_TYPE=Debug'
+
+endif
diff --git a/boot/tf-m/tf-m.hash b/boot/tf-m/tf-m.hash
new file mode 100644
index 0000000000..4f64e8ffec
--- /dev/null
+++ b/boot/tf-m/tf-m.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  0b8df41136d4c381787e4149f3a0c002b39a168db7995eef15ebe4f27fa16098  tf-m-0c4c99ba33b3e66deea070e149279278dc7647f4-git4.tar.gz
+sha256  c16df600171bfdae60d22a01f046d742f89ba1046e2e5ed135bbf091b21be34f  license.rst
diff --git a/boot/tf-m/tf-m.mk b/boot/tf-m/tf-m.mk
new file mode 100644
index 0000000000..fc3199e26c
--- /dev/null
+++ b/boot/tf-m/tf-m.mk
@@ -0,0 +1,111 @@
+################################################################################
+#
+# TrustedFirmware-M
+#
+################################################################################
+
+TF_M_VERSION = $(call qstrip,$(BR2_TARGET_TF_M_VERSION))
+
+ifeq ($(BR2_TARGET_TF_M_CUSTOM_TARBALL),y)
+# Handle custom FT-M tarballs as specified by the configuration
+TF_M_TARBALL = $(call qstrip,$(BR2_TARGET_TF_M_CUSTOM_TARBALL_LOCATION))
+TF_M_SITE = $(patsubst %/,%,$(dir $(TF_M_TARBALL)))
+TF_M_SOURCE = $(notdir $(TF_M_TARBALL))
+else ifeq ($(BR2_TARGET_TF_M_CUSTOM_GIT),y)
+TF_M_SITE = $(call qstrip,$(BR2_TARGET_TF_M_CUSTOM_REPO_URL))
+TF_M_SITE_METHOD = git
+else
+# Handle stable official TF-M versions
+TF_M_SITE = https://git.trustedfirmware.org/TF-M/trusted-firmware-m.git
+TF_M_SITE_METHOD = git
+# The licensing of custom or from-git versions is unknown
+# This is valid only for the latest (i.e. known) version
+ifeq ($(BR2_TARGET_TF_M_LATEST_VERSION),y)
+TF_M_LICENSE = BSD-3-Clause, Apache-2.0, GPL-2.0-or-later
+TF_M_LICENSE_FILES = license.rst
+endif
+endif
+
+ifeq ($(BR2_TARGET_TF_M):$(BR2_TARGET_TF_M_LATEST_VERSION),y:)
+BR_NO_CHECK_HASH_FOR += $(TF_M_SOURCE)
+endif
+
+TF_M_DEPENDENCIES += \
+	$(BR2_CMAKE_HOST_DEPENDENCY) \
+	host-arm-gnu-toolchain \
+	host-python-cbor2 \
+	host-python-click \
+	host-python-cryptography \
+	host-python-jinja2 \
+	host-python-intelhex \
+	host-python-pyyaml
+
+TF_M_PATCH_DEPENDENCIES += \
+	tfm-mbedtls \
+	tfm-mcuboot \
+	tfm-qcbor \
+	tfm-cmsis
+
+define TF_M_PATCH_3RD_PARTIES
+	if [ -d $(@D)/lib/ext/cmsis ] && [ ! -s $(TFM_CMSIS_SRCDIR).applied_patches_list ]; then \
+		$(APPLY_PATCHES) $(TFM_CMSIS_SRCDIR) $(@D)/lib/ext/cmsis \*.patch; \
+	fi
+	if [ -d $(@D)/lib/ext/mbedcrypto ] && [ ! -s $(TFM_MBEDTLS_SRCDIR).applied_patches_list ]; then \
+		$(APPLY_PATCHES) $(TFM_MBEDTLS_SRCDIR) $(@D)/lib/ext/mbedcrypto \*.patch; \
+	fi
+	if [ -d $(@D)/lib/ext/mcuboot ] && [ ! -s $(TFM_MCUBOOT_SRCDIR).applied_patches_list ]; then \
+		$(APPLY_PATCHES) $(TFM_MCUBOOT_SRCDIR) $(@D)/lib/ext/mcuboot \*.patch; \
+	fi
+	if [ -d $(@D)/lib/ext/qcbor ] && [ ! -s $(TFM_QCBOR_SRCDIR).applied_patches_list ]; then \
+		$(APPLY_PATCHES) $(TFM_QCBOR_SRCDIR) $(@D)/lib/ext/qcbor \*.patch; \
+	fi
+endef
+TF_M_POST_PATCH_HOOKS += TF_M_PATCH_3RD_PARTIES
+
+TF_M_CONF_OPTS += \
+	-DFETCHCONTENT_FULLY_DISCONNECTED=ON \
+	-DCROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi \
+	-DMBEDCRYPTO_PATH=$(TFM_MBEDTLS_SRCDIR) \
+	-DMCUBOOT_PATH=$(TFM_MCUBOOT_SRCDIR) \
+	-DQCBOR_PATH=$(TFM_QCBOR_SRCDIR) \
+	-DCMSIS_PATH=$(TFM_CMSIS_SRCDIR) \
+	-DTFM_PLATFORM=$(call qstrip,$(BR2_TARGET_TF_M_PLATFORM))
+
+define TF_M_CONFIGURE_CMDS
+	rm -f $(@D)/CMakeCache.txt
+	PATH=$(BR_PATH) \
+	$(BR2_CMAKE) -S $(@D) -B $(@D) \
+		$(TF_M_CONF_OPTS) \
+		$(call qstrip,$(BR2_TARGET_TF_M_ADDITIONAL_VARIABLES))
+endef
+
+define TF_M_BUILD_CMDS
+	PATH=$(BR_PATH) \
+	$(BR2_CMAKE) --build $(@D) -- install
+endef
+
+define TF_M_INSTALL_TARGET_CMDS
+	mkdir -p $(BINARIES_DIR)/tf-m
+	$(INSTALL) -D -m 0755 $(@D)/api_ns/bin/*.bin $(BINARIES_DIR)/tf-m
+	$(INSTALL) -D -m 0755 $(@D)/api_ns/bin/*.elf $(BINARIES_DIR)/tf-m
+endef
+
+# Configuration check
+ifeq ($(BR2_TARGET_TF_M)$(BR_BUILDING),yy)
+
+ifeq ($(BR2_TARGET_TF_M_CUSTOM_TARBALL),y)
+ifeq ($(call qstrip,$(BR2_TARGET_TF_M_CUSTOM_TARBALL_LOCATION)),)
+$(error No tarball location specified. Please check BR2_TARGET_TF_M_CUSTOM_TARBALL_LOCATION)
+endif
+endif
+
+ifeq ($(BR2_TARGET_TF_M_CUSTOM_GIT),y)
+ifeq ($(call qstrip,$(BR2_TARGET_TF_M_CUSTOM_REPO_URL)),)
+$(error No repository specified. Please check BR2_TARGET_TF_M_CUSTOM_REPO_URL)
+endif
+endif
+
+endif
+
+$(eval $(generic-package))
+include $(sort $(wildcard boot/tf-m/*/*.mk))
diff --git a/boot/tf-m/tfm-cmsis/Config.in b/boot/tf-m/tfm-cmsis/Config.in
new file mode 100644
index 0000000000..8d43e7cc37
--- /dev/null
+++ b/boot/tf-m/tfm-cmsis/Config.in
@@ -0,0 +1,12 @@
+config BR2_TARGET_TFM_CMSIS
+	bool
+
+config BR2_TARGET_TFM_CMSIS_GIT_REPO_URL
+	string "URL of cmsis git repository" \
+		if !BR2_TARGET_TF_M_LATEST_VERSION
+	default "https://github.com/ARM-software/CMSIS_6.git"
+
+config BR2_TARGET_TFM_CMSIS_GIT_REPO_VERSION
+	string "cmsis repository version" \
+		if !BR2_TARGET_TF_M_LATEST_VERSION
+	default "d0c460c1697d210b49a4b90998195831c0cd325c"
diff --git a/boot/tf-m/tfm-cmsis/tfm-cmsis.hash b/boot/tf-m/tfm-cmsis/tfm-cmsis.hash
new file mode 100644
index 0000000000..af99bac454
--- /dev/null
+++ b/boot/tf-m/tfm-cmsis/tfm-cmsis.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  3b91dcb9372e73e0c77bcc5a0a6267bd3ef9598a911b74e8c46de0f41bc2af71  tfm-cmsis-d0c460c1697d210b49a4b90998195831c0cd325c-git4.tar.gz
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/boot/tf-m/tfm-cmsis/tfm-cmsis.mk b/boot/tf-m/tfm-cmsis/tfm-cmsis.mk
new file mode 100644
index 0000000000..466d24091d
--- /dev/null
+++ b/boot/tf-m/tfm-cmsis/tfm-cmsis.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# cmcis
+#
+################################################################################
+
+TFM_CMSIS_SITE = $(call qstrip,$(BR2_TARGET_TFM_CMSIS_GIT_REPO_URL))
+TFM_CMSIS_VERSION = $(call qstrip,$(BR2_TARGET_TFM_CMSIS_GIT_REPO_VERSION))
+TFM_CMSIS_SITE_METHOD = git
+TFM_CMSIS_LICENSE = Apache-2.0
+TFM_CMSIS_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_TARGET_TF_M):$(BR2_TARGET_TF_M_LATEST_VERSION),y:)
+BR_NO_CHECK_HASH_FOR += $(TFM_CMSIS_SOURCE)
+endif
+
+# This components is not built and installed, because it is intended to
+# be included as source in TrustedFirmware-M build.
+
+$(eval $(generic-package))
diff --git a/boot/tf-m/tfm-mbedtls/Config.in b/boot/tf-m/tfm-mbedtls/Config.in
new file mode 100644
index 0000000000..7f1e7b3e8c
--- /dev/null
+++ b/boot/tf-m/tfm-mbedtls/Config.in
@@ -0,0 +1,12 @@
+config BR2_TARGET_TFM_MBEDTLS
+	bool
+
+config BR2_TARGET_TFM_MBEDTLS_GIT_REPO_URL
+	string "URL of mbedtls git repository" \
+		if !BR2_TARGET_TF_M_LATEST_VERSION
+	default "https://github.com/Mbed-TLS/mbedtls.git"
+
+config BR2_TARGET_TFM_MBEDTLS_GIT_REPO_VERSION
+	string "mbedtls repository version" \
+		if !BR2_TARGET_TF_M_LATEST_VERSION
+	default "2ca6c285a0dd3f33982dd57299012dacab1ff206"
diff --git a/boot/tf-m/tfm-mbedtls/tfm-mbedtls.hash b/boot/tf-m/tfm-mbedtls/tfm-mbedtls.hash
new file mode 100644
index 0000000000..d8f66c617c
--- /dev/null
+++ b/boot/tf-m/tfm-mbedtls/tfm-mbedtls.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  53030d7557882f0e8c0772bf50524afa359d5e465cf47245a8c1063187a58871  tfm-mbedtls-2ca6c285a0dd3f33982dd57299012dacab1ff206-git4.tar.gz
+sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
diff --git a/boot/tf-m/tfm-mbedtls/tfm-mbedtls.mk b/boot/tf-m/tfm-mbedtls/tfm-mbedtls.mk
new file mode 100644
index 0000000000..d319447e0f
--- /dev/null
+++ b/boot/tf-m/tfm-mbedtls/tfm-mbedtls.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# mbedtls
+#
+################################################################################
+
+TFM_MBEDTLS_SITE = $(call qstrip,$(BR2_TARGET_TFM_MBEDTLS_GIT_REPO_URL))
+TFM_MBEDTLS_VERSION = $(call qstrip,$(BR2_TARGET_TFM_MBEDTLS_GIT_REPO_VERSION))
+TFM_MBEDTLS_SITE_METHOD = git
+TFM_MBEDTLS_GIT_SUBMODULES = YES
+TFM_MBEDTLS_LICENSE = Apache-2.0 or GPL-2.0-or-later
+TFM_MBEDTLS_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_TARGET_TF_M):$(BR2_TARGET_TF_M_LATEST_VERSION),y:)
+BR_NO_CHECK_HASH_FOR += $(TFM_MBEDTLS_SOURCE)
+endif
+
+# This components is not built and installed, because it is intended to
+# be included as source in TrustedFirmware-M build.
+
+$(eval $(generic-package))
diff --git a/boot/tf-m/tfm-mcuboot/Config.in b/boot/tf-m/tfm-mcuboot/Config.in
new file mode 100644
index 0000000000..0b237ead97
--- /dev/null
+++ b/boot/tf-m/tfm-mcuboot/Config.in
@@ -0,0 +1,12 @@
+config BR2_TARGET_TFM_MCUBOOT
+	bool
+
+config BR2_TARGET_TFM_MCUBOOT_GIT_REPO_URL
+	string "URL of mcuboot git repository" \
+		if !BR2_TARGET_TF_M_LATEST_VERSION
+	default "https://github.com/mcu-tools/mcuboot.git"
+
+config BR2_TARGET_TFM_MCUBOOT_GIT_REPO_VERSION
+	string "mcuboot repository version" \
+		if !BR2_TARGET_TF_M_LATEST_VERSION
+	default "9c99326b9756dbcc35b524636d99ed5f3e6cb29b"
diff --git a/boot/tf-m/tfm-mcuboot/tfm-mcuboot.hash b/boot/tf-m/tfm-mcuboot/tfm-mcuboot.hash
new file mode 100644
index 0000000000..8989432a44
--- /dev/null
+++ b/boot/tf-m/tfm-mcuboot/tfm-mcuboot.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  3fde0c3c1d94b7bad34d1f33858f14c2598df877c5880aeac91851ab265db0a6  tfm-mcuboot-9c99326b9756dbcc35b524636d99ed5f3e6cb29b-git4.tar.gz
+sha256  86438164119907debf649e2f9f18a43ad506d75421c9d9675700066b0456205d  LICENSE
diff --git a/boot/tf-m/tfm-mcuboot/tfm-mcuboot.mk b/boot/tf-m/tfm-mcuboot/tfm-mcuboot.mk
new file mode 100644
index 0000000000..f782ff90ce
--- /dev/null
+++ b/boot/tf-m/tfm-mcuboot/tfm-mcuboot.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# mcuboot
+#
+################################################################################
+
+TFM_MCUBOOT_SITE = $(call qstrip,$(BR2_TARGET_TFM_MCUBOOT_GIT_REPO_URL))
+TFM_MCUBOOT_VERSION = $(call qstrip,$(BR2_TARGET_TFM_MCUBOOT_GIT_REPO_VERSION))
+TFM_MCUBOOT_SITE_METHOD = git
+TFM_MCUBOOT_LICENSE = Apache-2.0
+TFM_MCUBOOT_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_TARGET_TF_M):$(BR2_TARGET_TF_M_LATEST_VERSION),y:)
+BR_NO_CHECK_HASH_FOR += $(TFM_MCUBOOT_SOURCE)
+endif
+
+# This components is not built and installed, because it is intended to
+# be included as source in TrustedFirmware-M build.
+
+$(eval $(generic-package))
diff --git a/boot/tf-m/tfm-qcbor/Config.in b/boot/tf-m/tfm-qcbor/Config.in
new file mode 100644
index 0000000000..8e8a96918c
--- /dev/null
+++ b/boot/tf-m/tfm-qcbor/Config.in
@@ -0,0 +1,12 @@
+config BR2_TARGET_TFM_QCBOR
+	bool
+
+config BR2_TARGET_TFM_QCBOR_GIT_REPO_URL
+	string "URL of qcbor git repository" \
+		if !BR2_TARGET_TF_M_LATEST_VERSION
+	default "https://github.com/laurencelundblade/qcbor.git"
+
+config BR2_TARGET_TFM_QCBOR_GIT_REPO_VERSION
+	string "qcbor repository version" \
+		if !BR2_TARGET_TF_M_LATEST_VERSION
+	default "92d3f89030baff4af7be8396c563e6c8ef263622"
diff --git a/boot/tf-m/tfm-qcbor/tfm-qcbor.hash b/boot/tf-m/tfm-qcbor/tfm-qcbor.hash
new file mode 100644
index 0000000000..c69aee01af
--- /dev/null
+++ b/boot/tf-m/tfm-qcbor/tfm-qcbor.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  831d0d44a55ac997e1649844907bfe8949186000ee35b58eb3cdeac2ce41a95b  tfm-qcbor-92d3f89030baff4af7be8396c563e6c8ef263622-git4.tar.gz
+sha256  fc6db297a2751188d9c2ece6ee468a295f285b9a24f96eab954a1a823c71be3b  README.md
diff --git a/boot/tf-m/tfm-qcbor/tfm-qcbor.mk b/boot/tf-m/tfm-qcbor/tfm-qcbor.mk
new file mode 100644
index 0000000000..1917a44bff
--- /dev/null
+++ b/boot/tf-m/tfm-qcbor/tfm-qcbor.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# qcbor
+#
+################################################################################
+
+TFM_QCBOR_SITE = $(call qstrip,$(BR2_TARGET_TFM_QCBOR_GIT_REPO_URL))
+TFM_QCBOR_VERSION = $(call qstrip,$(BR2_TARGET_TFM_QCBOR_GIT_REPO_VERSION))
+TFM_QCBOR_SITE_METHOD = git
+TFM_QCBOR_LICENSE = BSD-3-Clause
+TFM_QCBOR_LICENSE_FILES = README.md
+
+ifeq ($(BR2_TARGET_TF_M):$(BR2_TARGET_TF_M_LATEST_VERSION),y:)
+BR_NO_CHECK_HASH_FOR += $(TFM_QCBOR_SOURCE)
+endif
+
+# This components is not built and installed, because it is intended to
+# be included as source in TrustedFirmware-M build.
+
+$(eval $(generic-package))
diff --git a/utils/genrandconfig b/utils/genrandconfig
index 282a9ebdea..b7e2e080eb 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -371,6 +371,9 @@ async def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_TARGET_S500_BOOTLOADER=y\n')
         configlines.remove('BR2_TARGET_S500_BOOTLOADER_BOARD=""\n')
 
+    if 'BR2_TARGET_TF_M=y\n' in configlines:
+        configlines.append('BR2_TARGET_TF_M_PLATFORM="arm/mps2/an521"\n')
+
     if 'BR2_TARGET_TI_K3_R5_LOADER=y\n' in configlines and \
        'BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG=y\n' in configlines and \
        'BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG=""\n' in configlines:
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
