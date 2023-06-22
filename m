Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D780EB64D8
	for <buildroot@archiver.kernel.org>; Thu, 22 Jun 2023 16:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BF2842434;
	Thu, 22 Jun 2023 16:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BF2842434
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XAGeu_kVr9Ct; Thu, 22 Jun 2023 16:04:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0589742438;
	Thu, 22 Jun 2023 16:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0589742438
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9ABD41BF3D1
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 16:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40CB183C9A
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 16:02:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40CB183C9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VjvD7AMZdf-h for <buildroot@lists.busybox.net>;
 Thu, 22 Jun 2023 16:02:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 037B383CBD
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 037B383CBD
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 16:02:18 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35MG2Iqv063931
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 11:02:18 -0500
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35MG2Ifd022562
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 11:02:18 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 11:02:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 11:02:17 -0500
Received: from dasso.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35MG2Gj2107613;
 Thu, 22 Jun 2023 11:02:17 -0500
To: <buildroot@buildroot.org>
Date: Thu, 22 Jun 2023 11:02:08 -0500
Message-ID: <20230622160212.2063472-8-dannenberg@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622160212.2063472-1-dannenberg@ti.com>
References: <20230622160212.2063472-1-dannenberg@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1687449738;
 bh=Da5IEI8y4/qIgndCy5SAQgoH8046c4BtPK9MEaEH2lU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Ad8/NvXfjxBR88AWCr/yHw4CqIzzUXdpiuNAqjJlijOygKHFHXCasIsUiorl4TDwT
 61IqBXbmck54Ebm3NHu6njvoqEWy8BkQT30D/+sxeBEG07YnMwN90EIdq2+bIHgmi1
 aPx/q6+3EOHTBjgo7e7YtQC8tYzlRKVj2SedY9dI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Ad8/NvXf
Subject: [Buildroot] [PATCH v9 07/11] package/ti-core-secdev-k3: new package
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The ti-core-secdev-k3 package is used to provide binary image signing
tools and keys to the build process needed to build boot artifacts for
the secure boot flow on TI K3 platform "High Security" SoCs (device
variants "HS-FS" and "HS-SE"). This package is not needed building for
"General Purpose" ("GP") SoC variants.

This commit also updates the ti-k3-image-gen, ti-k3-r5-loader, and uboot
packages which are all used as part of the boot flow of TI K3 platform
devices to make use of the ti-core-secdev-k3 package if enabled.

Note that although the use of the underlying 'core-secdev-k3' tool
provided by TI is required to generate bootable images for HS-FS and
HS-SE device variants, the use of this Buildroot package itself should
remain optional, hence no hard dependencies are being established. The
reason is that a user often wants to provide their own signing tool
through the use of the TI_SECURE_DEV_PKG environmental variable set
outside Buildroot on their specific build machine, especially for HS-SE
device variants where the signing tool would contain the user's private
keys.

https://git.ti.com/cgit/security-development-tools/core-secdev-k3

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
---
 boot/ti-k3-image-gen/ti-k3-image-gen.mk       | 10 ++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk       | 10 ++++++
 boot/uboot/uboot.mk                           | 10 ++++++
 package/Config.in.host                        |  1 +
 package/ti-core-secdev-k3/Config.in.host      | 11 +++++++
 .../ti-core-secdev-k3/ti-core-secdev-k3.hash  |  3 ++
 .../ti-core-secdev-k3/ti-core-secdev-k3.mk    | 31 +++++++++++++++++++
 7 files changed, 76 insertions(+)
 create mode 100644 package/ti-core-secdev-k3/Config.in.host
 create mode 100644 package/ti-core-secdev-k3/ti-core-secdev-k3.hash
 create mode 100644 package/ti-core-secdev-k3/ti-core-secdev-k3.mk

diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.mk b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
index b624f93771..57202d6918 100644
--- a/boot/ti-k3-image-gen/ti-k3-image-gen.mk
+++ b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
@@ -70,6 +70,16 @@ TI_K3_IMAGE_GEN_MAKE_OPTS = \
 	O=$(@D)/tmp \
 	BIN_DIR=$(@D)
 
+ifneq ($(TI_CORE_SECDEV_K3_INSTALL_DIR),)
+# Only set TI_SECURE_DEV_PKG make option if not already defined in the
+# environment, thus allowing the user to unconditionally override this
+# setting with a custom location on their build machine containing their
+# private keys, etc.
+ifeq ($(TI_SECURE_DEV_PKG),)
+TI_K3_IMAGE_GEN_MAKE_OPTS += TI_SECURE_DEV_PKG=$(TI_CORE_SECDEV_K3_INSTALL_DIR)
+endif
+endif
+
 define TI_K3_IMAGE_GEN_BUILD_CMDS
 	$(TI_K3_IMAGE_GEN_MAKE) -C $(@D) $(TI_K3_IMAGE_GEN_MAKE_OPTS)
 endef
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 341888623e..8311e1b401 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -67,6 +67,16 @@ TI_K3_R5_LOADER_MAKE_OPTS = \
 	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
+ifneq ($(TI_CORE_SECDEV_K3_INSTALL_DIR),)
+# Only set TI_SECURE_DEV_PKG make option if not already defined in the
+# environment, thus allowing the user to unconditionally override this
+# setting with a custom location on their build machine containing their
+# private keys, etc.
+ifeq ($(TI_SECURE_DEV_PKG),)
+TI_K3_R5_LOADER_MAKE_OPTS += TI_SECURE_DEV_PKG=$(TI_CORE_SECDEV_K3_INSTALL_DIR)
+endif
+endif
+
 define TI_K3_R5_LOADER_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
 endef
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 48af69bd26..472fec8619 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -184,6 +184,16 @@ UBOOT_DEPENDENCIES += optee-os
 UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
 endif
 
+ifneq ($(TI_CORE_SECDEV_K3_INSTALL_DIR),)
+# Only set TI_SECURE_DEV_PKG make option if not already defined in the
+# environment, thus allowing the user to unconditionally override this
+# setting with a custom location on their build machine containing their
+# private keys, etc.
+ifeq ($(TI_SECURE_DEV_PKG),)
+UBOOT_MAKE_OPTS += TI_SECURE_DEV_PKG=$(TI_CORE_SECDEV_K3_INSTALL_DIR)
+endif
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_DM),y)
 # Currently supports the FW from Git tag 08.06.00.006 by default
 TI_K3_DM_VERSION = 340194800a581baf976360386dfc7b5acab8d948
diff --git a/package/Config.in.host b/package/Config.in.host
index dcadbfdfc1..eed39a4102 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -103,6 +103,7 @@ menu "Host utilities"
 	source "package/systemd/Config.in.host"
 	source "package/tegrarcm/Config.in.host"
 	source "package/ti-cgt-pru/Config.in.host"
+	source "package/ti-core-secdev-k3/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
 	source "package/util-linux/Config.in.host"
 	source "package/utp_com/Config.in.host"
diff --git a/package/ti-core-secdev-k3/Config.in.host b/package/ti-core-secdev-k3/Config.in.host
new file mode 100644
index 0000000000..364619d824
--- /dev/null
+++ b/package/ti-core-secdev-k3/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_TI_CORE_SECDEV_K3
+	bool "host ti-core-secdev-k3"
+	help
+	  ti-core-secdev-k3 is used to provide binary image signing
+	  tools and keys to the build process needed to build boot
+	  artifacts for the secure boot flow on TI K3 platform
+	  "High Security" SoCs (device variants "HS-FS" and "HS-SE").
+	  This package is not needed building for "General Purpose"
+	  ("GP") SoC variants.
+
+	  https://git.ti.com/cgit/security-development-tools/core-secdev-k3
diff --git a/package/ti-core-secdev-k3/ti-core-secdev-k3.hash b/package/ti-core-secdev-k3/ti-core-secdev-k3.hash
new file mode 100644
index 0000000000..526ed29514
--- /dev/null
+++ b/package/ti-core-secdev-k3/ti-core-secdev-k3.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  eb637ed54204b64e98ae07070e0f2ebd36eed228ecc108dae0e7be6e38edde74  core-secdev-k3-08.06.00.007.tar.gz
+sha256  3e5cf4f5ab9f0333f46cd68fabede3f21e55de1a9e3c6ad673f241f4514d8369  manifest/k3-secdev-0.2-manifest.html
diff --git a/package/ti-core-secdev-k3/ti-core-secdev-k3.mk b/package/ti-core-secdev-k3/ti-core-secdev-k3.mk
new file mode 100644
index 0000000000..c388af2865
--- /dev/null
+++ b/package/ti-core-secdev-k3/ti-core-secdev-k3.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# ti-core-secdev-k3
+#
+################################################################################
+
+TI_CORE_SECDEV_K3_VERSION = 08.06.00.007
+TI_CORE_SECDEV_K3_SITE = https://git.ti.com/cgit/security-development-tools/core-secdev-k3/snapshot
+TI_CORE_SECDEV_K3_LICENSE = TI TSPA License
+TI_CORE_SECDEV_K3_LICENSE_FILES = manifest/k3-secdev-0.2-manifest.html
+TI_CORE_SECDEV_K3_SOURCE = core-secdev-k3-$(TI_CORE_SECDEV_K3_VERSION).tar.gz
+
+# To allow the image signing process for various firmware artifacts to work the
+# build process for TI K3 platform HS-FS and HS-SE device variants is using the
+# 'core-secdev-k3' tool provided by TI. Its location must be made available to
+# the build process of dependent packages by exporting it through the use of an
+# environmental variable. In order to not pollute the global Buildroot
+# environment let's record the package's location and then define the actual
+# environmental variable needed for the build only in the packages that need it.
+TI_CORE_SECDEV_K3_INSTALL_DIR = $(HOST_DIR)/opt/ti-core-secdev-k3
+
+define HOST_TI_CORE_SECDEV_K3_INSTALL_CMDS
+	mkdir -p $(TI_CORE_SECDEV_K3_INSTALL_DIR)/keys
+	cp -dpfr $(@D)/keys/* $(TI_CORE_SECDEV_K3_INSTALL_DIR)/keys
+	mkdir -p $(TI_CORE_SECDEV_K3_INSTALL_DIR)/scripts
+	cp -dpfr $(@D)/scripts/* $(TI_CORE_SECDEV_K3_INSTALL_DIR)/scripts
+	mkdir -p $(TI_CORE_SECDEV_K3_INSTALL_DIR)/templates
+	cp -dpfr $(@D)/scripts/* $(TI_CORE_SECDEV_K3_INSTALL_DIR)/templates
+endef
+
+$(eval $(host-generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
