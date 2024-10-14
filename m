Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0572D16268
	for <buildroot@archiver.kernel.org>; Mon, 14 Oct 2024 14:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62C9081180;
	Mon, 14 Oct 2024 14:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8JCU6Q4f97N0; Mon, 14 Oct 2024 14:31:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B1B18116D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B1B18116D;
	Mon, 14 Oct 2024 14:31:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8766B1BF2BA
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 14:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A66D2810A4
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 14:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BeVuaslwVk9H for <buildroot@lists.busybox.net>;
 Mon, 14 Oct 2024 14:31:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7425810B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7425810B6
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7425810B6
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 14:31:12 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 64484C312A
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 14:29:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B62BA240009;
 Mon, 14 Oct 2024 14:29:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Oct 2024 14:29:22 +0000
Message-Id: <20241014142923.246809-4-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241014142923.246809-1-kory.maincent@bootlin.com>
References: <20241014142923.246809-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728916174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ivNWB1fAY8oG1oU55kfMGDrjUrozkLt/T6lJPNMrlVg=;
 b=KYH8HH7kct+3r+4CVqMXz+qaNXKK5pwiLbenfkfH9LaWfxzrIbJcC/7ffp5NXb92u18TKX
 SYQkuJB8GIkBA1P2XFlARgpoR4XtIGMrbw6GrkwTt4SSB5neCaUd4yxbnzaE8o7jNaun76
 NV2BtW+Ho3TrBhRPRvYFj6WJDUh4nTWsp9F2T/NH6rv2WXGC2qfY3kztE7bxEWoHZwUrhp
 3iBtwPBk5M5pB1xBwdvKSLZvrjdWH5rFemw/+PWt90+kSLSctvJkmTMJUAq/798o7l8C8z
 gbYHa373dSdhwzNgRc0YVI4uPOuK0O2fpuXpUTlG/sgIffHAhD3H6o/CvCWJDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KYH8HH7k
Subject: [Buildroot] [PATCH v6 3/3] boot: Add support for TrustedFirmware-M
 package
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

Changes in v5:
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
 DEVELOPERS          |   1 +
 boot/Config.in      |   1 +
 boot/tf-m/Config.in |  95 +++++++++++++++++++++++++++++++++
 boot/tf-m/tf-m.hash |  11 ++++
 boot/tf-m/tf-m.mk   | 126 ++++++++++++++++++++++++++++++++++++++++++++
 utils/genrandconfig |   3 ++
 6 files changed, 237 insertions(+)
 create mode 100644 boot/tf-m/Config.in
 create mode 100644 boot/tf-m/tf-m.hash
 create mode 100644 boot/tf-m/tf-m.mk

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
index 0000000000..878b7719a4
--- /dev/null
+++ b/boot/tf-m/Config.in
@@ -0,0 +1,95 @@
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
+config BR2_TARGET_TF_M_MBEDTLS_TARBALL_LOCATION
+	string "URL of custom mbedtls tarball" \
+		if !BR2_TARGET_TF_M_LATEST_VERSION
+	default "https://github.com/Mbed-TLS/mbedtls/releases/download/v3.6.0/mbedtls-3.6.0.tar.bz2"
+
+config BR2_TARGET_TF_M_MCUBOOT_TARBALL_LOCATION
+	string "URL of mcuboot tarball" \
+		if !BR2_TARGET_TF_M_LATEST_VERSION
+	default "$(call github,mcu-tools,mcuboot,v2.1.0)/mcuboot-v2.1.0.tar.gz"
+
+config BR2_TARGET_TF_M_CMSIS_TARBALL_LOCATION
+	string "URL of cmsis tarball" \
+		if !BR2_TARGET_TF_M_LATEST_VERSION
+	default "$(call github,arm-software,cmsis_6,d0c460c169)/cmsis-d0c460c169.tar.gz"
+
+config BR2_TARGET_TF_M_QCBOR_TARBALL_LOCATION
+	string "URL of qcbor tarball" \
+		if !BR2_TARGET_TF_M_LATEST_VERSION
+	default "$(call github,laurencelundblade,qcbor,v1.2)/qcbor-v1.2.tar.gz"
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
index 0000000000..fe792f6746
--- /dev/null
+++ b/boot/tf-m/tf-m.hash
@@ -0,0 +1,11 @@
+# Locally calculated
+sha256  0b8df41136d4c381787e4149f3a0c002b39a168db7995eef15ebe4f27fa16098  tf-m-0c4c99ba33b3e66deea070e149279278dc7647f4-git4.tar.gz
+sha256  c16df600171bfdae60d22a01f046d742f89ba1046e2e5ed135bbf091b21be34f  license.rst
+sha256  3ecf94fcfdaacafb757786a01b7538a61750ebd85c4b024f56ff8ba1490fcd38  mbedtls-3.6.0.tar.bz2
+sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  3rd_parties/mbedcrypto/LICENSE
+sha256  bcee8c4b5a51477b27c6c587d11f46388823626aba7bd5082c77864a89dcf1b7  mcuboot-v2.1.0.tar.gz
+sha256  86438164119907debf649e2f9f18a43ad506d75421c9d9675700066b0456205d  3rd_parties/mcuboot/LICENSE
+sha256  0f706ad90ada600bd1ddbdf8dc6f2f5910e11de355bb4454b9b4123f0e4ff525  qcbor-v1.2.tar.gz
+sha256  fc6db297a2751188d9c2ece6ee468a295f285b9a24f96eab954a1a823c71be3b  3rd_parties/qcbor/README.md
+sha256  d846342840831f9124157b69b8edcdfcacc5427691f5b3341f714f0235c3cc49  cmsis-d0c460c169.tar.gz
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  3rd_parties/cmsis/LICENSE
diff --git a/boot/tf-m/tf-m.mk b/boot/tf-m/tf-m.mk
new file mode 100644
index 0000000000..086d6c53be
--- /dev/null
+++ b/boot/tf-m/tf-m.mk
@@ -0,0 +1,126 @@
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
+TF_M_LICENSE_FILES = \
+	license.rst \
+	3rd_parties/cmsis/LICENSE \
+	3rd_parties/mbedcrypto/LICENSE \
+	3rd_parties/mcuboot/LICENSE \
+	3rd_parties/qcbor/README.md
+endif
+endif
+
+ifeq ($(BR3_TARGET_TF_M):$(BR2_TARGET_TF_M_LATEST_VERSION),y:)
+BR_NO_CHECK_HASH_FOR += $(TF_M_SOURCE)
+endif
+
+# Use mbedcrypto naming from TF-M instead of mbedtl for easier 3rd
+# parties management
+TF_M_MBEDCRYPTO_TARBALL = $(call qstrip,$(BR2_TARGET_TF_M_MBEDTLS_TARBALL_LOCATION))
+TF_M_MCUBOOT_TARBALL = $(call qstrip,$(BR2_TARGET_TF_M_MCUBOOT_TARBALL_LOCATION))
+TF_M_CMSIS_TARBALL = $(call qstrip,$(BR2_TARGET_TF_M_CMSIS_TARBALL_LOCATION))
+TF_M_QCBOR_TARBALL = $(call qstrip,$(BR2_TARGET_TF_M_QCBOR_TARBALL_LOCATION))
+TF_M_EXTRA_DOWNLOADS += \
+	$(TF_M_MBEDCRYPTO_TARBALL) \
+	$(TF_M_MCUBOOT_TARBALL) \
+	$(TF_M_CMSIS_TARBALL) \
+	$(TF_M_QCBOR_TARBALL)
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
+TF_M_3RD_PARTIES = mbedcrypto mcuboot cmsis qcbor
+
+define TF_M_EXTRACT_3RD_PARTIES
+	$(foreach f, $(TF_M_3RD_PARTIES), \
+		mkdir -p $(@D)/3rd_parties/$(f) ; \
+		$(call suitable-extractor,$(notdir $(TF_M_$(call UPPERCASE,$(f))_TARBALL))) \
+		$(TF_M_DL_DIR)/$(notdir $(TF_M_$(call UPPERCASE,$(f))_TARBALL)) | \
+		$(TAR) --strip-components=1 -C $(@D)/3rd_parties/$(f) $(TAR_OPTIONS) -
+	)
+endef
+TF_M_POST_EXTRACT_HOOKS += TF_M_EXTRACT_3RD_PARTIES
+
+define TF_M_PATCH_3RD_PARTIES
+	$(foreach f, $(TF_M_3RD_PARTIES), \
+		if [ -d $(@D)/lib/ext/$(f) ]; then \
+			$(APPLY_PATCHES) $(@D)/3rd_parties/$(f) $(@D)/lib/ext/$(f) \*.patch; \
+		fi;
+	)
+endef
+TF_M_POST_PATCH_HOOKS += TF_M_PATCH_3RD_PARTIES
+
+TF_M_CONF_OPTS += \
+	-DFETCHCONTENT_FULLY_DISCONNECTED=ON \
+	-DCROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi \
+	-DMBEDCRYPTO_PATH=$(@D)/3rd_parties/mbedcrypto \
+	-DMCUBOOT_PATH=$(@D)/3rd_parties/mcuboot \
+	-DQCBOR_PATH=$(@D)/3rd_parties/qcbor \
+	-DCMSIS_PATH=$(@D)/3rd_parties/cmsis \
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
