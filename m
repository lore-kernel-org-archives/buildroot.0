Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AC4C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84533414CE;
	Fri, 12 Jul 2024 15:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L2bJ13E62By1; Fri, 12 Jul 2024 15:35:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5014D414EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5014D414EC;
	Fri, 12 Jul 2024 15:35:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 359701BF5D7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 304EF83EFF
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SwJeIDT7BE0C for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:35:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E91BB82033
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E91BB82033
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E91BB82033
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:35:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 860A5C0010;
 Fri, 12 Jul 2024 15:35:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 17:35:09 +0200
Message-Id: <20240712153509.2583089-5-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240712153509.2583089-1-kory.maincent@bootlin.com>
References: <20240712153509.2583089-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720798516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xYBQxhtaQ//TjbLz2xcQLqS2Q54ybP4H7q4ZYoj2wg0=;
 b=U1LubV26O2F6l0o9wQljbsmDtfcAxJIP0g5QHuY1Yn+qbgVrP3QLEwvxtqyPK05jBbDX6J
 7SlwyVxyd5aPXzWFh+2nQGaVWt40QjL7/WmqPysV27sKF+QeBVsqYN4Mh7lfb5BEZKPJsU
 dEroIyY9/ViIa/sNjTcVdBVrXb3mFvYwQX16cRUUdRhEzFiOfAU64Cu6fAZ0EaoVmHgjji
 XfsgiLM5I3ohEXIjEclv69KXUvtj9nLlsgXqeE21Z03wQaofx8aL/1R/NgQInbqwQhHgCg
 kcnzB4/vUpRVkYSEXcFZv3ud0Ld1BIHNMzxxKc3jWAwMf2nrncNAbltofgRa/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U1LubV26
Subject: [Buildroot] [PATCH v4 4/4] boot: Add support for TrustedFirmware-M
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

Use subpackages to download the third-party project sources to be able to
apply patches located in the TF-M sources. This approach is also necessary
because the tfm-tests git host produces non-reproducible tarballs.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
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
 DEVELOPERS                                    |   1 +
 boot/Config.in                                |   1 +
 boot/trusted-firmware-m/Config.in             | 102 +++++++++++++++
 boot/trusted-firmware-m/tfm-3rdparty.mk       |   7 +
 boot/trusted-firmware-m/tfm-cmsis/Config.in   |  10 ++
 .../tfm-cmsis/tfm-cmsis.hash                  |   3 +
 .../trusted-firmware-m/tfm-cmsis/tfm-cmsis.mk |  23 ++++
 boot/trusted-firmware-m/tfm-mbedtls/Config.in |  10 ++
 .../tfm-mbedtls/tfm-mbedtls.hash              |   3 +
 .../tfm-mbedtls/tfm-mbedtls.mk                |  24 ++++
 boot/trusted-firmware-m/tfm-mcuboot/Config.in |  10 ++
 .../tfm-mcuboot/tfm-mcuboot.hash              |   3 +
 .../tfm-mcuboot/tfm-mcuboot.mk                |  23 ++++
 boot/trusted-firmware-m/tfm-qcbor/Config.in   |  10 ++
 .../tfm-qcbor/tfm-qcbor.hash                  |   3 +
 .../trusted-firmware-m/tfm-qcbor/tfm-qcbor.mk |  23 ++++
 boot/trusted-firmware-m/tfm-tests/Config.in   |  10 ++
 .../tfm-tests/tfm-tests.hash                  |   3 +
 .../trusted-firmware-m/tfm-tests/tfm-tests.mk |  24 ++++
 .../trusted-firmware-m.hash                   |   3 +
 boot/trusted-firmware-m/trusted-firmware-m.mk | 120 ++++++++++++++++++
 support/testing/tests/boot/test_tfm.py        |  12 ++
 22 files changed, 428 insertions(+)
 create mode 100644 boot/trusted-firmware-m/Config.in
 create mode 100644 boot/trusted-firmware-m/tfm-3rdparty.mk
 create mode 100644 boot/trusted-firmware-m/tfm-cmsis/Config.in
 create mode 100644 boot/trusted-firmware-m/tfm-cmsis/tfm-cmsis.hash
 create mode 100644 boot/trusted-firmware-m/tfm-cmsis/tfm-cmsis.mk
 create mode 100644 boot/trusted-firmware-m/tfm-mbedtls/Config.in
 create mode 100644 boot/trusted-firmware-m/tfm-mbedtls/tfm-mbedtls.hash
 create mode 100644 boot/trusted-firmware-m/tfm-mbedtls/tfm-mbedtls.mk
 create mode 100644 boot/trusted-firmware-m/tfm-mcuboot/Config.in
 create mode 100644 boot/trusted-firmware-m/tfm-mcuboot/tfm-mcuboot.hash
 create mode 100644 boot/trusted-firmware-m/tfm-mcuboot/tfm-mcuboot.mk
 create mode 100644 boot/trusted-firmware-m/tfm-qcbor/Config.in
 create mode 100644 boot/trusted-firmware-m/tfm-qcbor/tfm-qcbor.hash
 create mode 100644 boot/trusted-firmware-m/tfm-qcbor/tfm-qcbor.mk
 create mode 100644 boot/trusted-firmware-m/tfm-tests/Config.in
 create mode 100644 boot/trusted-firmware-m/tfm-tests/tfm-tests.hash
 create mode 100644 boot/trusted-firmware-m/tfm-tests/tfm-tests.mk
 create mode 100644 boot/trusted-firmware-m/trusted-firmware-m.hash
 create mode 100644 boot/trusted-firmware-m/trusted-firmware-m.mk
 create mode 100644 support/testing/tests/boot/test_tfm.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 6f8c33fb5b..1e62fafb22 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1976,6 +1976,7 @@ F:	board/octavo/osd32mp1-brk/
 F:	board/octavo/osd32mp1-red/
 F:	configs/octavo_osd32mp1_brk_defconfig
 F:	configs/octavo_osd32mp1_red_defconfig
+F:	boot/trusted-firmware-m/
 
 N:	Kris Bahnsen <kris@embeddedTS.com>
 F:	package/wilc-firmware/
diff --git a/boot/Config.in b/boot/Config.in
index 25a50265d2..1042907574 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -19,6 +19,7 @@ source "boot/shim/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/ti-k3-boot-firmware/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
+source "boot/trusted-firmware-m/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
 source "boot/xilinx-prebuilt/Config.in"
diff --git a/boot/trusted-firmware-m/Config.in b/boot/trusted-firmware-m/Config.in
new file mode 100644
index 0000000000..1571d35360
--- /dev/null
+++ b/boot/trusted-firmware-m/Config.in
@@ -0,0 +1,102 @@
+config BR2_TARGET_TRUSTED_FIRMWARE_M
+	bool "TrustedFirmware-M (TF-M)"
+	select BR2_TARGET_TFM_TESTS
+	select BR2_TARGET_TFM_MBEDTLS
+	select BR2_TARGET_TFM_MCUBOOT
+	select BR2_TARGET_TFM_QCBOR
+	select BR2_TARGET_TFM_CMSIS
+	select BR2_HOST_CMAKE_AT_LEAST_3_21
+	help
+	  Enable this option if you want to build the TF-M for your
+	  ARMv8 microcontroller.
+
+	  https://git.trustedfirmware.org/TF-M/trusted-firmware-m.git
+
+if BR2_TARGET_TRUSTED_FIRMWARE_M
+choice
+	prompt "TF-M Version"
+	help
+	  Select the specific TF-M version you want to use
+
+config BR2_TARGET_TRUSTED_FIRMWARE_M_LATEST_VERSION
+	bool "TF-Mv2.1.0"
+
+config BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_VERSION
+	bool "Custom version"
+	select BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY
+	help
+	  This option allows to use a specific official versions
+
+config BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_TARBALL
+	bool "Custom tarball"
+	select BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY
+
+config BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_GIT
+	bool "Custom Git repository"
+	select BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY
+
+endchoice
+
+if BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_TARBALL
+
+config BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_TARBALL_LOCATION
+	string "URL of custom TF-M tarball"
+
+endif
+
+config BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_VERSION_VALUE
+	string "TF-M version"
+	depends on BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_VERSION
+
+config BR2_TARGET_TRUSTED_FIRMWARE_M_VERSION
+	string
+	default "0c4c99ba33b3e66deea070e149279278dc7647f4" \
+				if BR2_TARGET_TRUSTED_FIRMWARE_M_LATEST_VERSION
+	default "custom"	if BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_TARBALL
+	default BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_REPO_VERSION \
+				if BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_GIT
+	default BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_VERSION_VALUE \
+				if BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_VERSION
+
+if BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_GIT
+
+config BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_REPO_URL
+	string "URL of custom repository"
+
+config BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	help
+	  Revision to use in the typical format used by Git
+	  E.G. a sha id, a tag, ..
+
+endif
+
+menu "TF-M 3rd party projects"
+config BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY
+	bool "Use custom tarball for TF-M 3rd party projects"
+
+source "boot/trusted-firmware-m/tfm-mbedtls/Config.in"
+source "boot/trusted-firmware-m/tfm-mcuboot/Config.in"
+source "boot/trusted-firmware-m/tfm-qcbor/Config.in"
+source "boot/trusted-firmware-m/tfm-cmsis/Config.in"
+source "boot/trusted-firmware-m/tfm-tests/Config.in"
+
+endmenu
+
+config BR2_TARGET_TRUSTED_FIRMWARE_M_PLATFORM
+	string "TF-M platform path"
+	help
+	  Target plaform path to build for.
+
+config BR2_TARGET_TRUSTED_FIRMWARE_M_ADDITIONAL_VARIABLES
+	string "Additional TF-M build variables"
+	help
+	  Additional parameters for the TF-M build
+	  E.G. '-DTFM_ISOLATION_LEVEL=2 -DTFM_PROFILE=large'
+
+config BR2_TARGET_TRUSTED_FIRMWARE_M_DEBUG
+	bool "Build in debug mode"
+	help
+	  Enable this option to build TF-M with -DCMAKE_BUILD_TYPE=Debug.
+
+endif
diff --git a/boot/trusted-firmware-m/tfm-3rdparty.mk b/boot/trusted-firmware-m/tfm-3rdparty.mk
new file mode 100644
index 0000000000..1a7bab4011
--- /dev/null
+++ b/boot/trusted-firmware-m/tfm-3rdparty.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# TrustedFirmware-M 3rd parties
+#
+################################################################################
+
+include $(sort $(wildcard boot/trusted-firmware-m/*/*.mk))
diff --git a/boot/trusted-firmware-m/tfm-cmsis/Config.in b/boot/trusted-firmware-m/tfm-cmsis/Config.in
new file mode 100644
index 0000000000..3774b2d9bc
--- /dev/null
+++ b/boot/trusted-firmware-m/tfm-cmsis/Config.in
@@ -0,0 +1,10 @@
+config BR2_TARGET_TFM_CMSIS
+	bool
+
+if BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY
+
+config BR2_TARGET_TFM_CMSIS_CUSTOM_TARBALL_LOCATION
+	string "URL of custom cmcis tarball"
+	default "$(call github,arm-software,cmsis_6)/d0c460c169.tar.gz"
+
+endif
diff --git a/boot/trusted-firmware-m/tfm-cmsis/tfm-cmsis.hash b/boot/trusted-firmware-m/tfm-cmsis/tfm-cmsis.hash
new file mode 100644
index 0000000000..4811118a79
--- /dev/null
+++ b/boot/trusted-firmware-m/tfm-cmsis/tfm-cmsis.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  d846342840831f9124157b69b8edcdfcacc5427691f5b3341f714f0235c3cc49  tfm-cmsis-d0c460c1697d210b49a4b90998195831c0cd325c.tar.gz
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/boot/trusted-firmware-m/tfm-cmsis/tfm-cmsis.mk b/boot/trusted-firmware-m/tfm-cmsis/tfm-cmsis.mk
new file mode 100644
index 0000000000..eb106ce414
--- /dev/null
+++ b/boot/trusted-firmware-m/tfm-cmsis/tfm-cmsis.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# cmcis
+#
+################################################################################
+
+ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY),y)
+TFM_CMSIS_VERSION = custom
+TFM_CMSIS_TARBALL = $(call qstrip,$(BR2_TARGET_TFM_CMSIS_CUSTOM_TARBALL_LOCATION))
+TFM_CMSIS_SITE = $(patsubst %/,%,$(dir $(TFM_CMSIS_TARBALL)))
+TFM_CMSIS_SOURCE = $(notdir $(TFM_CMSIS_TARBALL))
+BR_NO_CHECK_HASH_FOR += $(TFM_CMSIS_SOURCE)
+else
+TFM_CMSIS_VERSION = d0c460c1697d210b49a4b90998195831c0cd325c
+TFM_CMSIS_SITE = $(call github,arm-software,cmsis_6,$(TFM_CMSIS_VERSION))
+TFM_CMSIS_LICENSE = Apache-2.0
+TFM_CMSIS_LICENSE_FILES = LICENSE
+endif
+
+# This components is not built and installed, because it is intended to
+# be included as source in TrustedFirmware-M build.
+
+$(eval $(generic-package))
diff --git a/boot/trusted-firmware-m/tfm-mbedtls/Config.in b/boot/trusted-firmware-m/tfm-mbedtls/Config.in
new file mode 100644
index 0000000000..91f18c9bc1
--- /dev/null
+++ b/boot/trusted-firmware-m/tfm-mbedtls/Config.in
@@ -0,0 +1,10 @@
+config BR2_TARGET_TFM_MBEDTLS
+	bool
+
+if BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY
+
+config BR2_TARGET_TFM_MBEDTLS_CUSTOM_TARBALL_LOCATION
+	string "URL of custom mbedtls tarball"
+	default "https://github.com/Mbed-TLS/mbedtls/releases/download/v3.6.0/mbedtls-3.6.0.tar.bz2"
+
+endif
diff --git a/boot/trusted-firmware-m/tfm-mbedtls/tfm-mbedtls.hash b/boot/trusted-firmware-m/tfm-mbedtls/tfm-mbedtls.hash
new file mode 100644
index 0000000000..e90b632187
--- /dev/null
+++ b/boot/trusted-firmware-m/tfm-mbedtls/tfm-mbedtls.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  3ecf94fcfdaacafb757786a01b7538a61750ebd85c4b024f56ff8ba1490fcd38  mbedtls-3.6.0.tar.bz2
+sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
diff --git a/boot/trusted-firmware-m/tfm-mbedtls/tfm-mbedtls.mk b/boot/trusted-firmware-m/tfm-mbedtls/tfm-mbedtls.mk
new file mode 100644
index 0000000000..d728a282df
--- /dev/null
+++ b/boot/trusted-firmware-m/tfm-mbedtls/tfm-mbedtls.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# mbedtls
+#
+################################################################################
+
+ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY),y)
+TFM_MBEDTLS_VERSION = custom
+TFM_MBEDTLS_TARBALL = $(call qstrip,$(BR2_TARGET_TFM_MBEDTLS_CUSTOM_TARBALL_LOCATION))
+TFM_MBEDTLS_SITE = $(patsubst %/,%,$(dir $(TFM_MBEDTLS_TARBALL)))
+TFM_MBEDTLS_SOURCE = $(notdir $(TFM_MBEDTLS_TARBALL))
+BR_NO_CHECK_HASH_FOR += $(TFM_MBEDTLS_SOURCE)
+else
+TFM_MBEDTLS_VERSION = 3.6.0
+TFM_MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/v$(TFM_MBEDTLS_VERSION)
+TFM_MBEDTLS_SOURCE = mbedtls-$(TFM_MBEDTLS_VERSION).tar.bz2
+TFM_MBEDTLS_LICENSE = Apache-2.0 or GPL-2.0-or-later
+TFM_MBEDTLS_LICENSE_FILES = LICENSE
+endif
+
+# This components is not built and installed, because it is intended to
+# be included as source in TrustedFirmware-M build.
+
+$(eval $(generic-package))
diff --git a/boot/trusted-firmware-m/tfm-mcuboot/Config.in b/boot/trusted-firmware-m/tfm-mcuboot/Config.in
new file mode 100644
index 0000000000..be1e83be35
--- /dev/null
+++ b/boot/trusted-firmware-m/tfm-mcuboot/Config.in
@@ -0,0 +1,10 @@
+config BR2_TARGET_TFM_MCUBOOT
+	bool
+
+if BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY
+
+config BR2_TARGET_TFM_MCUBOOT_CUSTOM_TARBALL_LOCATION
+	string "URL of custom mcuboot tarball"
+	default "$(call github,mcu-tools,mcuboot)/v2.1.0.tar.gz"
+
+endif
diff --git a/boot/trusted-firmware-m/tfm-mcuboot/tfm-mcuboot.hash b/boot/trusted-firmware-m/tfm-mcuboot/tfm-mcuboot.hash
new file mode 100644
index 0000000000..1fbd254b34
--- /dev/null
+++ b/boot/trusted-firmware-m/tfm-mcuboot/tfm-mcuboot.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  bcee8c4b5a51477b27c6c587d11f46388823626aba7bd5082c77864a89dcf1b7  tfm-mcuboot-v2.1.0.tar.gz
+sha256  86438164119907debf649e2f9f18a43ad506d75421c9d9675700066b0456205d  LICENSE
diff --git a/boot/trusted-firmware-m/tfm-mcuboot/tfm-mcuboot.mk b/boot/trusted-firmware-m/tfm-mcuboot/tfm-mcuboot.mk
new file mode 100644
index 0000000000..cc2599e55a
--- /dev/null
+++ b/boot/trusted-firmware-m/tfm-mcuboot/tfm-mcuboot.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# mcuboot
+#
+################################################################################
+
+ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY),y)
+TFM_MCUBOOT_VERSION = custom
+TFM_MCUBOOT_TARBALL = $(call qstrip,$(BR2_TARGET_TFM_MCUBOOT_CUSTOM_TARBALL_LOCATION))
+TFM_MCUBOOT_SITE = $(patsubst %/,%,$(dir $(TFM_MCUBOOT_TARBALL)))
+TFM_MCUBOOT_SOURCE = $(notdir $(TFM_MCUBOOT_TARBALL))
+BR_NO_CHECK_HASH_FOR += $(TFM_MCUBOOT_SOURCE)
+else
+TFM_MCUBOOT_VERSION = v2.1.0
+TFM_MCUBOOT_SITE = $(call github,mcu-tools,mcuboot,$(TFM_MCUBOOT_VERSION))
+TFM_MCUBOOT_LICENSE = Apache-2.0
+TFM_MCUBOOT_LICENSE_FILES = LICENSE
+endif
+
+# This components is not built and installed, because it is intended to
+# be included as source in TrustedFirmware-M build.
+
+$(eval $(generic-package))
diff --git a/boot/trusted-firmware-m/tfm-qcbor/Config.in b/boot/trusted-firmware-m/tfm-qcbor/Config.in
new file mode 100644
index 0000000000..1ec74ce558
--- /dev/null
+++ b/boot/trusted-firmware-m/tfm-qcbor/Config.in
@@ -0,0 +1,10 @@
+config BR2_TARGET_TFM_QCBOR
+	bool
+
+if BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY
+
+config BR2_TARGET_TFM_QCBOR_CUSTOM_TARBALL_LOCATION
+	string "URL of custom qcbor tarball"
+	default "$(call github,laurencelundblade,qcbor)/v1.2.tar.gz"
+
+endif
diff --git a/boot/trusted-firmware-m/tfm-qcbor/tfm-qcbor.hash b/boot/trusted-firmware-m/tfm-qcbor/tfm-qcbor.hash
new file mode 100644
index 0000000000..2c27cdeb84
--- /dev/null
+++ b/boot/trusted-firmware-m/tfm-qcbor/tfm-qcbor.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  0f706ad90ada600bd1ddbdf8dc6f2f5910e11de355bb4454b9b4123f0e4ff525  tfm-qcbor-v1.2.tar.gz
+sha256  fc6db297a2751188d9c2ece6ee468a295f285b9a24f96eab954a1a823c71be3b  README.md
diff --git a/boot/trusted-firmware-m/tfm-qcbor/tfm-qcbor.mk b/boot/trusted-firmware-m/tfm-qcbor/tfm-qcbor.mk
new file mode 100644
index 0000000000..b303b9f5a3
--- /dev/null
+++ b/boot/trusted-firmware-m/tfm-qcbor/tfm-qcbor.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# qcbor
+#
+################################################################################
+
+ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY),y)
+TFM_QCBOR_VERSION = custom
+TFM_QCBOR_TARBALL = $(call qstrip,$(BR2_TARGET_TFM_QCBOR_CUSTOM_TARBALL_LOCATION))
+TFM_QCBOR_SITE = $(patsubst %/,%,$(dir $(TFM_QCBOR_TARBALL)))
+TFM_QCBOR_SOURCE = $(notdir $(TFM_QCBOR_TARBALL))
+BR_NO_CHECK_HASH_FOR += $(TFM_QCBOR_SOURCE)
+else
+TFM_QCBOR_VERSION = v1.2
+TFM_QCBOR_SITE = $(call github,laurencelundblade,qcbor,$(TFM_QCBOR_VERSION))
+TFM_QCBOR_LICENSE = BSD-3-Clause
+TFM_QCBOR_LICENSE_FILES = README.md
+endif
+
+# This components is not built and installed, because it is intended to
+# be included as source in TrustedFirmware-M build.
+
+$(eval $(generic-package))
diff --git a/boot/trusted-firmware-m/tfm-tests/Config.in b/boot/trusted-firmware-m/tfm-tests/Config.in
new file mode 100644
index 0000000000..758e66b8c4
--- /dev/null
+++ b/boot/trusted-firmware-m/tfm-tests/Config.in
@@ -0,0 +1,10 @@
+config BR2_TARGET_TFM_TESTS
+	bool
+
+if BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY
+
+config BR2_TARGET_TFM_TESTS_CUSTOM_TARBALL_LOCATION
+	string "URL of custom TF-M-tests tarball"
+	default "https://git.trustedfirmware.org/TF-M/tf-m-tests.git/+archive/TF-Mv2.1.0.tar.gz"
+
+endif
diff --git a/boot/trusted-firmware-m/tfm-tests/tfm-tests.hash b/boot/trusted-firmware-m/tfm-tests/tfm-tests.hash
new file mode 100644
index 0000000000..d48f0cfdfc
--- /dev/null
+++ b/boot/trusted-firmware-m/tfm-tests/tfm-tests.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  409dee3cbbceb3f1ea2543cfc9e06a9de23706f5ae798b866d0f12b0c21a7bd5  tfm-tests-TF-Mv2.1.0-br1.tar.gz
+sha256  42195e7f4ae4655d000688af4d4b143048352461dff5849d24e5afe6d1d84808  license.rst
diff --git a/boot/trusted-firmware-m/tfm-tests/tfm-tests.mk b/boot/trusted-firmware-m/tfm-tests/tfm-tests.mk
new file mode 100644
index 0000000000..c11a58da32
--- /dev/null
+++ b/boot/trusted-firmware-m/tfm-tests/tfm-tests.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# TF-M tests
+#
+################################################################################
+
+ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_3RD_PARTY),y)
+TFM_TESTS_VERSION = custom
+TFM_TESTS_TARBALL = $(call qstrip,$(BR2_TARGET_TFM_TESTS_CUSTOM_TARBALL_LOCATION))
+TFM_TESTS_SITE = $(patsubst %/,%,$(dir $(TFM_TESTS_TARBALL)))
+TFM_TESTS_SOURCE = $(notdir $(TFM_TESTS_TARBALL))
+BR_NO_CHECK_HASH_FOR += $(TFM_TESTS_SOURCE)
+else
+TFM_TESTS_VERSION = TF-Mv2.1.0
+TFM_TESTS_SITE = https://git.trustedfirmware.org/TF-M/trusted-firmware-m.git
+TFM_TESTS_SITE_METHOD = git
+TFM_TESTS_LICENSE = BSD-3-Clause
+TFM_TESTS_LICENSE_FILES = license.rst
+endif
+
+# This components is not built and installed, because it is intended to
+# be included as source in TrustedFirmware-M build.
+
+$(eval $(generic-package))
diff --git a/boot/trusted-firmware-m/trusted-firmware-m.hash b/boot/trusted-firmware-m/trusted-firmware-m.hash
new file mode 100644
index 0000000000..571c2e7a25
--- /dev/null
+++ b/boot/trusted-firmware-m/trusted-firmware-m.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  5da6aee3e3dffbde61ee061fed8fc0b693ce934a8a707c91b19916e9b1ade638  trusted-firmware-m-0c4c99ba33b3e66deea070e149279278dc7647f4-br1.tar.gz
+sha256  c16df600171bfdae60d22a01f046d742f89ba1046e2e5ed135bbf091b21be34f  license.rst
diff --git a/boot/trusted-firmware-m/trusted-firmware-m.mk b/boot/trusted-firmware-m/trusted-firmware-m.mk
new file mode 100644
index 0000000000..0ad8b6afb5
--- /dev/null
+++ b/boot/trusted-firmware-m/trusted-firmware-m.mk
@@ -0,0 +1,120 @@
+################################################################################
+#
+# TrustedFirmware-M
+#
+################################################################################
+
+TRUSTED_FIRMWARE_M_VERSION = $(call qstrip,$(BR2_TARGET_TRUSTED_FIRMWARE_M_VERSION))
+
+ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_TARBALL),y)
+# Handle custom FT-M tarballs as specified by the configuration
+TRUSTED_FIRMWARE_M_TARBALL = $(call qstrip,$(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_TARBALL_LOCATION))
+TRUSTED_FIRMWARE_M_SITE = $(patsubst %/,%,$(dir $(TRUSTED_FIRMWARE_M_TARBALL)))
+TRUSTED_FIRMWARE_M_SOURCE = $(notdir $(TRUSTED_FIRMWARE_M_TARBALL))
+else ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_GIT),y)
+TRUSTED_FIRMWARE_M_SITE = $(call qstrip,$(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_REPO_URL))
+TRUSTED_FIRMWARE_M_SITE_METHOD = git
+else
+# Handle stable official TF-M versions
+TRUSTED_FIRMWARE_M_SITE = https://git.trustedfirmware.org/TF-M/trusted-firmware-m.git
+TRUSTED_FIRMWARE_M_SITE_METHOD = git
+# The licensing of custom or from-git versions is unknown.
+# This is valid only for the latest (i.e. known) version.
+ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M_LATEST_VERSION),y)
+TRUSTED_FIRMWARE_M_LICENSE = BSD-3-Clause
+TRUSTED_FIRMWARE_M_LICENSE_FILES = license.rst
+endif
+endif
+
+ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M):$(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_VERSION)$(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_TARBALL)$(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_GIT),y:y)
+BR_NO_CHECK_HASH_FOR += $(TRUSTED_FIRMWARE_M_SOURCE)
+endif
+
+TRUSTED_FIRMWARE_M_DEPENDENCIES += \
+	$(BR2_CMAKE_HOST_DEPENDENCY) \
+	host-arm-gnu-toolchain \
+	host-python-cbor2 \
+	host-python-click \
+	host-python-cryptography \
+	host-python-jinja2 \
+	host-python-intelhex \
+	host-python-pyyaml
+
+TRUSTED_FIRMWARE_M_PATCH_DEPENDENCIES += \
+	tfm-mbedtls \
+	tfm-mcuboot \
+	tfm-qcbor \
+	tfm-cmsis \
+	tfm-tests
+
+define TRUSTED_FIRMWARE_M_PATCH_3RD_PARTIES
+	if [ -d $(@D)/lib/ext/cmsis ]; then \
+		$(APPLY_PATCHES) $(TFM_CMSIS_SRCDIR) $(@D)/lib/ext/cmsis \*.patch; \
+	fi
+	$(APPLY_PATCHES) $(TFM_MBEDTLS_SRCDIR) $(@D)/lib/ext/mbedcrypto \*.patch; \
+	$(APPLY_PATCHES) $(TFM_MCUBOOT_SRCDIR) $(@D)/lib/ext/mcuboot \*.patch; \
+	$(APPLY_PATCHES) $(TFM_QCBOR_SRCDIR) $(@D)/lib/ext/qcbor \*.patch; \
+	$(APPLY_PATCHES) $(TFM_TESTS_SRCDIR) $(@D)/lib/ext/tf-m-tests \*.patch;
+endef
+TRUSTED_FIRMWARE_M_POST_PATCH_HOOKS += TRUSTED_FIRMWARE_M_PATCH_3RD_PARTIES
+
+TRUSTED_FIRMWARE_M_CONF_OPTS += \
+	-DCMAKE_TOOLCHAIN_FILE="$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
+	-DFETCHCONTENT_FULLY_DISCONNECTED=ON \
+	-DMBEDCRYPTO_PATH=$(TFM_MBEDTLS_SRCDIR) \
+	-DTFM_TEST_REPO_PATH=$(TFM_TESTS_SRCDIR) \
+	-DMCUBOOT_PATH=$(TFM_MCUBOOT_SRCDIR) \
+	-DQCBOR_PATH=$(TFM_QCBOR_SRCDIR) \
+	-DCMSIS_PATH=$(TFM_CMSIS_SRCDIR) \
+	-DTFM_PLATFORM=$(call qstrip,$(BR2_TARGET_TRUSTED_FIRMWARE_M_PLATFORM))
+
+ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M_DEBUG),y)
+TRUSTED_FIRMWARE_M_CONF_OPTS += -DCMAKE_BUILD_TYPE=Debug
+endif
+
+TRUSTED_FIRMWARE_M_CONF_ENV += \
+	CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi-
+
+define TRUSTED_FIRMWARE_M_CONFIGURE_CMDS
+	rm -f $(@D)/CMakeCache.txt
+	PATH=$(BR_PATH) \
+	$(TRUSTED_FIRMWARE_M_CONF_ENV) $(BR2_CMAKE) -S $(@D) -B $(@D) \
+		$(TRUSTED_FIRMWARE_M_CONF_OPTS) \
+		$(call qstrip,$(BR2_TARGET_TRUSTED_FIRMWARE_M_ADDITIONAL_VARIABLES))
+endef
+
+define TRUSTED_FIRMWARE_M_BUILD_CMDS
+	PATH=$(BR_PATH) \
+	$(TRUSTED_FIRMWARE_M_CONF_ENV) $(BR2_CMAKE) \
+		--build $(@D) -- install
+endef
+
+define TRUSTED_FIRMWARE_M_INSTALL_TARGET_CMDS
+	# Install path for old version of TF-M
+	if [ -d $(@D)/install/outputs ]; then \
+		$(INSTALL) -D -m 0755 $(@D)/install/outputs/*.bin $(BINARIES_DIR); \
+		$(INSTALL) -D -m 0755 $(@D)/install/outputs/*.elf $(BINARIES_DIR); \
+	else \
+		$(INSTALL) -D -m 0755 $(@D)/api_ns/bin/*.bin $(BINARIES_DIR); \
+		$(INSTALL) -D -m 0755 $(@D)/api_ns/bin/*.elf $(BINARIES_DIR); \
+	fi
+endef
+
+# Configuration check
+ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M)$(BR_BUILDING),yy)
+
+ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_TARBALL),y)
+ifeq ($(call qstrip,$(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_TARBALL_LOCATION)),)
+$(error No tarball location specified. Please check BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_TARBALL_LOCATION)
+endif
+endif
+
+ifeq ($(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_GIT),y)
+ifeq ($(call qstrip,$(BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_REPO_URL)),)
+$(error No repository specified. Please check BR2_TARGET_TRUSTED_FIRMWARE_M_CUSTOM_REPO_URL)
+endif
+endif
+
+endif
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/boot/test_tfm.py b/support/testing/tests/boot/test_tfm.py
new file mode 100644
index 0000000000..77650aaec1
--- /dev/null
+++ b/support/testing/tests/boot/test_tfm.py
@@ -0,0 +1,12 @@
+import infra.basetest
+
+
+class TestTFMBuild(infra.basetest.BRTest):
+    config = \
+        """
+	BR2_TARGET_TRUSTED_FIRMWARE_M=y
+	BR2_TARGET_TRUSTED_FIRMWARE_M_PLATFORM="arm/mps2/an521"
+        """
+
+    def test_run(self):
+        pass
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
