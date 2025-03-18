Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758FDC282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 16:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E309411E2;
	Tue, 18 Mar 2025 16:32:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id POu8FC51F9Ds; Tue, 18 Mar 2025 16:32:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5152411E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5152411E4;
	Tue, 18 Mar 2025 16:32:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2ADBD5
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 16:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2D1182071
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 16:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id US68DltBuL9v for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 16:32:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1479A82013
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1479A82013
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1479A82013
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 16:32:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.9.119])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D292FB00573;
 Tue, 18 Mar 2025 17:32:30 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Vladimir Oltean <olteanv@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Julien Olivain <ju.o@free.fr>, Vincent Jardin <vjardin@free.fr>
Date: Tue, 18 Mar 2025 17:32:28 +0100
Message-ID: <20250318163228.9989-1-vjardin@free.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742315555;
 bh=uQVlkgxMx5wBZVofNWvN++vLZHetfCSOPvD4iLhAG5U=;
 h=From:To:Cc:Subject:Date:From;
 b=W8vot7UehwatqPxyVuDfIaEkz0+RvLb4Xze4KOdTZleked1t7Yqse41B8KKmAetCr
 /1EZg8vTtR2blthWjNXlyYawZbEWSECczxTKXWrE9moyoy41mg0i5A5cKRChqUEFjD
 QN2oQ5zVkM2pnZnCOXvjRlxbUzUPVouGvNCq5dRwM2t13vQGiGlypnD5v2stzp0cVw
 LhXmoXzhFGw9M7QDJQcBiONdmnCxdwty6Z4G147CP9O6puqgmlWfchqzfw/w1w9XYM
 VWHDF73gPlMqRMRa59uMBGdsrQl/3yKxCXjCi2A7vOOTlwQzNRmFnVMKrl2RzzVvUk
 Il++hT3H8Ft/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=W8vot7Ue
Subject: [Buildroot] [PATCH] boot/qoriq-ddr-phy-binary: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The DDR PHY on the NXP LX2160A SoC needs firmware. This is distributed
as prebuilt binaries by NXP through GitHub.
This firmware is linked and used by the ATF.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS                                    |  3 +++
 boot/Config.in                                |  1 +
 .../arm-trusted-firmware.mk                   |  8 +++++++
 boot/qoriq-ddr-phy-binary/Config.in           |  9 ++++++++
 .../qoriq-ddr-phy-binary.hash                 |  3 +++
 .../qoriq-ddr-phy-binary.mk                   | 21 +++++++++++++++++++
 6 files changed, 45 insertions(+)
 create mode 100644 boot/qoriq-ddr-phy-binary/Config.in
 create mode 100644 boot/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
 create mode 100644 boot/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0c6d7532f8..5c6106c481 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3362,6 +3362,9 @@ N:	Vivien Didelot <vivien.didelot@gmail.com>
 F:	board/technologic/ts5500/
 F:	configs/ts5500_defconfig
 
+N:	Vladimir Oltean <olteanv@gmail.com>
+F:	boot/qoriq-ddr-phy-binary/
+
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
 F:	package/zbar/
diff --git a/boot/Config.in b/boot/Config.in
index f167346cdf..873dc8b977 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -12,6 +12,7 @@ source "boot/mv-ddr-marvell/Config.in"
 source "boot/mxs-bootlets/Config.in"
 source "boot/optee-os/Config.in"
 source "boot/opensbi/Config.in"
+source "boot/qoriq-ddr-phy-binary/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
 source "boot/syslinux/Config.in"
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index dca16d3960..ad9ffbfe6c 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -160,6 +160,14 @@ ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += pbl
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += RCW=$(BINARIES_DIR)/PBL.bin
 endif
 
+# Specific for lx2160a
+# same name than https://github.com/nxp-qoriq/ddr-phy-binary/blob/master/lx2160a/fip_ddr.bin
+ifeq ($(BR2_TARGET_QORIQ_DDR_PHY_BINARY),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += DDR_FIP_NAME=fip_ddr.bin
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += qoriq-ddr-phy-binary
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += DDR_PHY_BIN_PATH=$(QORIQ_DDR_PHY_BINARY_DIR)/lx2160a
+endif
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31),y)
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += bl31
 endif
diff --git a/boot/qoriq-ddr-phy-binary/Config.in b/boot/qoriq-ddr-phy-binary/Config.in
new file mode 100644
index 0000000000..8b8c18186f
--- /dev/null
+++ b/boot/qoriq-ddr-phy-binary/Config.in
@@ -0,0 +1,9 @@
+config BR2_TARGET_QORIQ_DDR_PHY_BINARY
+	bool "qoriq-ddr-phy-binary"
+	depends on BR2_aarch64
+	help
+	  Firmware binary for DDR PHY of NXP LX2160A family of SoCs.
+	  This package downloads and installs such firmware, which
+	  is needed to build the ATF.
+
+	  https://github.com/nxp-qoriq/ddr-phy-binary
diff --git a/boot/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash b/boot/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
new file mode 100644
index 0000000000..adc173221e
--- /dev/null
+++ b/boot/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  b49cb34f941f7e534ec31d3d14d18d4e565e4875b690ecb0d7e2992b72c64dc7  qoriq-ddr-phy-binary-lf-6.6.36-2.1.0.tar.gz
+sha256  e7e5f4949f7ac9f9a5d4d68b8f835f3ddc93ad47b594a11de699d90b9175413f  NXP-Binary-EULA.txt
diff --git a/boot/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk b/boot/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
new file mode 100644
index 0000000000..fefc71e646
--- /dev/null
+++ b/boot/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# qoriq-ddr-phy-binary
+#
+################################################################################
+
+QORIQ_DDR_PHY_BINARY_VERSION = lf-6.6.36-2.1.0
+QORIQ_DDR_PHY_BINARY_SITE = $(call github,nxp-qoriq,ddr-phy-binary,$(QORIQ_DDR_PHY_BINARY_VERSION))
+
+QORIQ_DDR_PHY_BINARY_LICENSE = NXP Binary EULA
+QORIQ_DDR_PHY_BINARY_LICENSE_FILES = NXP-Binary-EULA.txt
+
+QORIQ_DDR_PHY_BINARY_INSTALL_IMAGES = YES
+
+# same name than arm-trusted-firmware
+#   DDR_FIP_NAME=fip_ddr.bin
+define QORIQ_DDR_PHY_BINARY_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D $(@D)/lx2160a/fip_ddr.bin $(BINARIES_DIR)/fip_ddr.bin
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
