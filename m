Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19B8C47DB3
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 11:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8694761518;
	Wed, 31 Jan 2024 11:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8694761518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lsFrYbm-IkfS; Wed, 31 Jan 2024 11:24:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A20961539;
	Wed, 31 Jan 2024 11:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A20961539
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E8281BF5E6
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2051461518
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2051461518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zmusj-ZbgG7d for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 11:24:05 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 539A66155A
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 11:24:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 539A66155A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gp9Ap8mzkNrZKfAXQlJCtSOaOvdSysP+CSsbws3KvPqkqvwUn53hkePHG88v3xdk4pAPGU0UTnjwEbbCCyd5/rgUFTPGeB3KDnMbgS4+qgibxEXyiWtdHwfdbUEzQf/Pbpi+PpIQBa3oLlcmMr16A4wTU4j5p0TjojE7InjYItgOo0q0FxN45jwqbSpcnQamjD3jfD7a30/sxpMo57kjpXXPHfb61ysE712LY9Hi085RCPbkovX+k3IYJYgDYf9u3XNV/g7Bv5LYPrB/kFQ5gchjgZly0L7KtC6hgz3J9i3/Nx8D/GugIVKE35u8o7yrkFu+1XZuuZ0DGGb7aE2vxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLTxgW8Bb6EuYOckFoig5tX7qqiDF/Ae4/5NHLnKAQE=;
 b=BzbrCrkOnqBLeRvN80XUGMJEJ8tXZ5bbgAFrsncvgNTmTRoJPtYJmGCwfLPhxxKk9ei1QdTWWF85Ojlboq8aiMWUBELj4aYwXtwEjt2v48MR/qHlqCTUELys3erfGQP3HS/hgsFUxf9GRiSFKHwBNNjugfp2VMpZs0KR9C+/saXa3uetxGADtdQ/Tch3LmWgpH4+u37wT34CMjl5yw917hk8kGkFTelLzQH4ywrvPV0zuZxdiv/E83zSeyOhi6LHAr6v3iQ8CV8NXm2haJRa4piTf9CRSwWZER/X4z9IpZ3sOBjKK0ZYeul1JabuZwR7v+rXKGrZ3blPSkqr2D7oTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR03CA0156.namprd03.prod.outlook.com (2603:10b6:303:8d::11)
 by MW3PR12MB4570.namprd12.prod.outlook.com (2603:10b6:303:5f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 11:24:03 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:303:8d:cafe::8c) by MW4PR03CA0156.outlook.office365.com
 (2603:10b6:303:8d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Wed, 31 Jan 2024 11:24:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7270.0 via Frontend Transport; Wed, 31 Jan 2024 11:24:02 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 05:24:02 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 05:24:01 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 31 Jan 2024 05:24:00 -0600
To: <buildroot@buildroot.org>
Date: Wed, 31 Jan 2024 11:22:21 +0000
Message-ID: <20240131112223.2175855-9-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131112223.2175855-1-neal.frager@amd.com>
References: <20240131112223.2175855-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|MW3PR12MB4570:EE_
X-MS-Office365-Filtering-Correlation-Id: b1e19483-d349-43e1-1a44-08dc224f20ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bc6zhh4Bt6PjQTcEimLr61FnxF4CQ6kbj4AkpVAofZ9IlCpAPRnj7QZuJmHFlLMnOU8feoBoUD/ZxFc+Rn2zHrXCqumisF+oT8gba+SvHlOveJDVQ0xqPMEZrmR7Arg2Dm3l+lcVQw+oBj4E9/hlvhVJlPDqW2ok5xQO2T4cLsTxMQDeVU3nFJCfYXu3FIFw4NsVb0DG9XyJ+2SX1AdmLOyl2OJ5NkoaB3D3zKgQAoaqQT7QrLHNSNVTpmHBNODlj9PNLHiyHUNC0sMS8xSFgnAVnx9DkKj7SHTxKQNWCUzvwlDUdXOVhtW9UIMSTaZNBd3J7hsyNxr/CLX8gAag80NLA/PHjI161yPWyh3lOd2TINq9zT+jm/TWiyeQjtYp7EASz5QYpUe0Hc1NEdDuSFRalE4kE2dAkoENGy1B3HtRy0SexgwZnqH3ZhDcltGazPZs2ygpAMojL71d3ySqqrC2fLYdc5D1kUtEYttN0e4WJDoNMiA2vOXCEsFGg/n30tBfcEyalT93IotTrYjIeCz17YOelcZW6PnwDNST6cdQ/TnGxmUnBEBV5hJ6R3l5nnnZmiI/iv9jILIdpvPr3iAIfMBVpurlJc4+WbRKmuhIBKyKbrx0IRCF13VF1kyOLKz42Dx26PNqGxkS4OUqrx65hRPN+5c2QzPkOJI1RrNz4iCNLWf3cqw6YA+qm3g2zPm9xLCncaMwhZdUK1ujkqMtaPK/2T0EqNF8eynKcnA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(1800799012)(186009)(82310400011)(451199024)(64100799003)(40470700004)(46966006)(36840700001)(41300700001)(1076003)(336012)(426003)(26005)(2616005)(40480700001)(40460700003)(47076005)(36756003)(356005)(6666004)(478600001)(83380400001)(36860700001)(81166007)(82740400003)(316002)(86362001)(30864003)(5660300002)(2906002)(70206006)(6916009)(54906003)(70586007)(8936002)(4326008)(8676002)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 11:24:02.8441 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e19483-d349-43e1-1a44-08dc224f20ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4570
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLTxgW8Bb6EuYOckFoig5tX7qqiDF/Ae4/5NHLnKAQE=;
 b=mWCnn7LqDXpHhbo0t1nLUl9mzW6dC/MGv3Ke88ivg9px1almCnaFL23HazVeaZoh0x5fLimhaj78WEff6awXb0VrIj50YWj/ohOOKDNQPBiDuYYOses8ojMkX0XVa5ci2EjwK8pfRAeWZ+/BAgvobpifpCFH9J540pFJPfk13AY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=mWCnn7Lq
Subject: [Buildroot] [PATCH v9 09/11] boot/versal-firmware: new boot firmware
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a new boot firmware to buildroot for building the versal plm
and psmfw.  It requires the toolchain-bare-metal package that includes a
bare-metal binutils, gcc and newlib which can be built for the microblaze
architecture.

Patches are required to enable parallel building of the versal plm and psmfw
applications.  These two patches have been submitted upstream internally at
AMD / Xilinx and will be included with the 2023.2 release of the embeddedsw
repository.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V4->V5:
 - automatically select bootgen as a needed tool
 - reduce all lines to <80 chars
 - add help for PDI file location which could be URL or local
V5->V6:
 - migrated to toolchain-bare-metal-buildroot
V6->V7:
 - removed patch numbers
 - changed dependency to toolchain-bare-metal-buildroot
 - removed hash since version is configurable
V7->V9:
 - no changes
---
 DEVELOPERS                                    |   1 +
 boot/Config.in                                |   1 +
 boot/versal-firmware/Config.in                |  38 +++++
 boot/versal-firmware/versal-firmware.mk       |  52 ++++++
 ...al_plm-add-support-of-parallel-build.patch | 157 ++++++++++++++++++
 ..._psmfw-add-support-of-parallel-build.patch |  48 ++++++
 6 files changed, 297 insertions(+)
 create mode 100644 boot/versal-firmware/Config.in
 create mode 100644 boot/versal-firmware/versal-firmware.mk
 create mode 100644 boot/versal-firmware/xilinx_v2023.1/0001-sw_apps-versal_plm-add-support-of-parallel-build.patch
 create mode 100644 boot/versal-firmware/xilinx_v2023.1/0002-sw_apps-versal_psmfw-add-support-of-parallel-build.patch

diff --git a/DEVELOPERS b/DEVELOPERS
index fcb3734229..e2c8fb6198 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2234,6 +2234,7 @@ N:	Neal Frager <neal.frager@amd.com>
 F:	board/versal/
 F:	board/zynq/
 F:	board/zynqmp/
+F:	boot/versal-firmware/
 F:	boot/zynqmp-firmware/
 F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc702_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index c7478fef2e..da5ccb6b9c 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -23,6 +23,7 @@ source "boot/ti-k3-boot-firmware/Config.in"
 source "boot/ti-k3-image-gen/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
+source "boot/versal-firmware/Config.in"
 source "boot/vexpress-firmware/Config.in"
 source "boot/zynqmp-firmware/Config.in"
 
diff --git a/boot/versal-firmware/Config.in b/boot/versal-firmware/Config.in
new file mode 100644
index 0000000000..b931461a4a
--- /dev/null
+++ b/boot/versal-firmware/Config.in
@@ -0,0 +1,38 @@
+config BR2_TARGET_VERSAL_FIRMWARE
+	bool "versal-firmware"
+	select BR2_PACKAGE_HOST_BOOTGEN
+	select BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
+	help
+	  This package builds the boot firmware apps for Xilinx versal
+	  boards, so that they can boot u-boot and Linux.
+
+if BR2_TARGET_VERSAL_FIRMWARE
+
+config BR2_TARGET_VERSAL_FIRMWARE_VERSION
+	string "firmware version"
+	default "xilinx_v2023.2"
+	help
+	  Release version of versal firmware.
+	  Only versions xilinx_v2023.1 and newer are supported.
+	  
+config BR2_TARGET_VERSAL_FIRMWARE_CUSTOM_CFLAGS
+	string "custom cflags"
+	help
+	  Adds additional CFLAGS for building versal firmware.
+
+config BR2_TARGET_VERSAL_FIRMWARE_PDI
+	string "pdi file location"
+	default "https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/vck190-versal/vpl_gen_fixed.pdi"
+	help
+	  The PDI file defines everything which is board specific for versal.
+	  It gets parsed by the plm.elf during boot.  To boot a custom target
+	  based on versal, this should be configured to point to your Vivado
+	  generated PDI file.
+	  
+	  The location of the PDI can be either a URL for download or a file
+	  in the local repository.
+	  
+	  This config should never be undefined, so default configuration is
+	  for the vck190 evaluation board.
+
+endif # BR2_TARGET_VERSAL_FIRMWARE
diff --git a/boot/versal-firmware/versal-firmware.mk b/boot/versal-firmware/versal-firmware.mk
new file mode 100644
index 0000000000..fa932510a1
--- /dev/null
+++ b/boot/versal-firmware/versal-firmware.mk
@@ -0,0 +1,52 @@
+################################################################################
+#
+# versal-firmware
+#
+################################################################################
+
+VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_SITE = \
+	$(call github,Xilinx,embeddedsw,$(VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_LICENSE = MIT
+VERSAL_FIRMWARE_LICENSE_FILES = license.txt
+VERSAL_FIRMWARE_INSTALL_IMAGES = YES
+VERSAL_FIRMWARE_INSTALL_TARGET = NO
+VERSAL_FIRMWARE_DEPENDENCIES = toolchain-bare-metal-buildroot
+
+CUSTOM_CFLAGS = $(call qstrip,$(BR2_TARGET_VERSAL_FIRMWARE_CUSTOM_CFLAGS))
+VERSAL_FIRMWARE_CFLAGS = "-Os -flto -ffat-lto-objects $(CUSTOM_CFLAGS)"
+
+VERSAL_FIRMWARE_PDI = $(call qstrip,$(BR2_TARGET_VERSAL_FIRMWARE_PDI))
+
+ifneq ($(findstring ://,$(VERSAL_FIRMWARE_PDI)),)
+VERSAL_FIRMWARE_EXTRA_DOWNLOADS = $(VERSAL_FIRMWARE_PDI)
+BR_NO_CHECK_HASH_FOR += $(notdir $(VERSAL_FIRMWARE_PDI))
+VERSAL_PDI = $(VERSAL_FIRMWARE_DL_DIR)/$(notdir $(VERSAL_FIRMWARE_PDI))
+else ifneq ($(VERSAL_FIRMWARE_PDI),)
+VERSAL_PDI = $(shell readlink -f $(VERSAL_FIRMWARE_PDI))
+endif #VERSAL_FIRMWARE_PDI
+
+define VERSAL_FIRMWARE_BUILD_CMDS
+	$(MAKE) -C $(@D)/lib/sw_apps/versal_plm/src/versal \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(VERSAL_FIRMWARE_CFLAGS)
+		
+	$(MAKE) -C $(@D)/lib/sw_apps/versal_psmfw/src/versal \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(VERSAL_FIRMWARE_CFLAGS)
+endef
+
+VERSAL_PLM = $(@D)/lib/sw_apps/versal_plm/src/versal/plm.elf
+VERSAL_PSMFW = $(@D)/lib/sw_apps/versal_psmfw/src/versal/psmfw.elf
+
+define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0755 $(VERSAL_PLM) $(BINARIES_DIR)/plm.elf
+	$(INSTALL) -D -m 0755 $(VERSAL_PSMFW) $(BINARIES_DIR)/psmfw.elf
+	$(INSTALL) -D -m 0755 $(VERSAL_PDI) $(BINARIES_DIR)/vpl_gen_fixed.pdi
+endef
+
+$(eval $(generic-package))
diff --git a/boot/versal-firmware/xilinx_v2023.1/0001-sw_apps-versal_plm-add-support-of-parallel-build.patch b/boot/versal-firmware/xilinx_v2023.1/0001-sw_apps-versal_plm-add-support-of-parallel-build.patch
new file mode 100644
index 0000000000..d4e08f435c
--- /dev/null
+++ b/boot/versal-firmware/xilinx_v2023.1/0001-sw_apps-versal_plm-add-support-of-parallel-build.patch
@@ -0,0 +1,157 @@
+From 245509f87776c7727973480f08ead6f293a2f3b2 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Mon, 4 Sep 2023 07:08:02 +0100
+Subject: [PATCH] sw_apps:versal_plm: add support of parallel build
+
+The build fails when make command is invoked with -j option.
+The root cause is, BSP_SEQUENTIAL_MAKEFILES variable is not assigned
+and exported properly in copy_bsp.sh file. Also, the 'all' target in
+src/Makefile tries to compile the source code before bsp copy was
+finished when -j option is enabled during build.
+
+Added BSP_SEQUENTIAL_MAKEFILES in the misc/Makefile to resolve the
+export issue and corrected dependency in the src/Makefile to let the bsp
+copy finished before compiling the source.
+
+Signed-off-by: Duvvi Divya <Duvvi.Divya@xilinx.com>
+Acked-by: Sreedhar Kundella <sreedhar.k@xilinx.com>
+---
+ lib/sw_apps/versal_plm/misc/versal/Makefile    | 12 +++++++++++-
+ lib/sw_apps/versal_plm/misc/versal/copy_bsp.sh | 11 -----------
+ lib/sw_apps/versal_plm/src/versal/Makefile     |  2 ++
+ 3 files changed, 13 insertions(+), 12 deletions(-)
+
+diff --git a/lib/sw_apps/versal_plm/misc/versal/Makefile b/lib/sw_apps/versal_plm/misc/versal/Makefile
+index 5c8e719e9c..d735f64530 100644
+--- a/lib/sw_apps/versal_plm/misc/versal/Makefile
++++ b/lib/sw_apps/versal_plm/misc/versal/Makefile
+@@ -7,6 +7,16 @@ PROCESSOR = psv_pmc_0
+ LIBRARIES = ${PROCESSOR}/lib/libxil.a
+ BSP_MAKEFILES := $(wildcard $(PROCESSOR)/libsrc/*/src/Makefile)
+ SUBDIRS := $(patsubst %/Makefile, %, $(BSP_MAKEFILES))
++DRIVERS_LIST=../drivers.txt
++SEQUENTIAL_MAKEFILES := $(shell cat ${DRIVERS_LIST})
++BSP_SEQUENTIAL_MAKEFILES = $(patsubst %, ${PROCESSOR}/libsrc/%/src/Makefile, $(SEQUENTIAL_MAKEFILES))
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilffs/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilpdi/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilplmi/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilpuf/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilloader/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilnvm/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilsecure/src/Makefile
+ BSP_PARALLEL_MAKEFILES := $(filter-out $(BSP_SEQUENTIAL_MAKEFILES),$(BSP_MAKEFILES))
+ SEQ_SUBDIRS := $(patsubst %/Makefile, %, $(BSP_SEQUENTIAL_MAKEFILES))
+ PAR_SUBDIRS := $(patsubst %/Makefile, %, $(BSP_PARALLEL_MAKEFILES))
+@@ -16,7 +26,7 @@ ifneq (,$(findstring win,$(RDI_PLATFORM)))
+ endif
+ 
+ all:
+-	$(MAKE) --no-print-directory seq_libs
++	$(MAKE) -j1 --no-print-directory seq_libs
+ 	$(MAKE) -j --no-print-directory par_libs
+ 	$(MAKE) --no-print-directory archive
+ 	@echo 'Finished building libraries'
+diff --git a/lib/sw_apps/versal_plm/misc/versal/copy_bsp.sh b/lib/sw_apps/versal_plm/misc/versal/copy_bsp.sh
+index 404e588ae2..244d36e2ee 100755
+--- a/lib/sw_apps/versal_plm/misc/versal/copy_bsp.sh
++++ b/lib/sw_apps/versal_plm/misc/versal/copy_bsp.sh
+@@ -29,7 +29,6 @@ STANDALONE_DIR=$EMBEDDED_SW_DIR/lib/bsp/standalone/src
+ 
+ # libraries dir
+ SERVICES_DIR=$EMBEDDED_SW_DIR/lib/sw_services
+-BSP_SEQUENTIAL_MAKEFILES=
+ 
+ # creation of BSP folders required
+ if [ -d $BSP_DIR ]; then
+@@ -52,7 +51,6 @@ fi
+ mkdir -p $BSP_DIR/libsrc/xilffs
+ cp -r $SERVICES_DIR/xilffs/src $BSP_DIR/libsrc/xilffs/
+ cp -r $SERVICES_DIR/xilffs/src/include/* $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilffs/src/Makefile"
+ 
+ mkdir -p $BSP_DIR/libsrc/xilpdi/src
+ cp -r $SERVICES_DIR/xilpdi/src/Makefile $BSP_DIR/libsrc/xilpdi/src
+@@ -60,7 +58,6 @@ cp -r $SERVICES_DIR/xilpdi/src/versal/* $BSP_DIR/libsrc/xilpdi/src/
+ cp -r $SERVICES_DIR/xilpdi/src/versal/*.h $BSP_DIR/include/
+ cp -r $SERVICES_DIR/xilpdi/src/common/* $BSP_DIR/libsrc/xilpdi/src/
+ cp -r $SERVICES_DIR/xilpdi/src/common/*.h $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilpdi/src/Makefile"
+ 
+ mkdir -p $BSP_DIR/libsrc/xilplmi/src
+ cp -r $SERVICES_DIR/xilplmi/src/Makefile $BSP_DIR/libsrc/xilplmi/src
+@@ -68,14 +65,12 @@ cp -r $SERVICES_DIR/xilplmi/src/versal/* $BSP_DIR/libsrc/xilplmi/src/
+ cp -r $SERVICES_DIR/xilplmi/src/versal/*.h $BSP_DIR/include/
+ cp -r $SERVICES_DIR/xilplmi/src/common/* $BSP_DIR/libsrc/xilplmi/src/
+ cp -r $SERVICES_DIR/xilplmi/src/common/*.h $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilplmi/src/Makefile"
+ 
+ mkdir -p $BSP_DIR/libsrc/xilpuf/src
+ cp -r $SERVICES_DIR/xilpuf/src/Makefile $BSP_DIR/libsrc/xilpuf/src
+ cp -r $SERVICES_DIR/xilpuf/src/common/* $BSP_DIR/libsrc/xilpuf/src
+ cp -r $SERVICES_DIR/xilpuf/src/server/* $BSP_DIR/libsrc/xilpuf/src
+ cp -r $BSP_DIR/libsrc/xilpuf/src/*.h $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilpuf/src/Makefile"
+ 
+ mkdir -p $BSP_DIR/libsrc/xilloader/src
+ cp -r $SERVICES_DIR/xilloader/src/Makefile $BSP_DIR/libsrc/xilloader/src
+@@ -83,7 +78,6 @@ cp -r $SERVICES_DIR/xilloader/src/versal/* $BSP_DIR/libsrc/xilloader/src/
+ cp -r $SERVICES_DIR/xilloader/src/versal/*.h $BSP_DIR/include/
+ cp -r $SERVICES_DIR/xilloader/src/common/* $BSP_DIR/libsrc/xilloader/src/
+ cp -r $SERVICES_DIR/xilloader/src/common/*.h $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilloader/src/Makefile"
+ 
+ mkdir -p $BSP_DIR/libsrc/xilpm/src/
+ cp -r $SERVICES_DIR/xilpm/src/versal/common/* $BSP_DIR/libsrc/xilpm/src/
+@@ -94,7 +88,6 @@ cp -r $SERVICES_DIR/xilpm/src/versal_common/server/* $BSP_DIR/libsrc/xilpm/src/
+ cp -r $SERVICES_DIR/xilpm/src/versal_common/server/*.h $BSP_DIR/include/
+ cp -r $SERVICES_DIR/xilpm/src/versal_common/common/*.h $BSP_DIR/include/
+ cp -r $SERVICES_DIR/xilpm/src/versal_common/common/* $BSP_DIR/libsrc/xilpm/src/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilpm/src/versal/common/Makefile"
+ 
+ mkdir -p $BSP_DIR/libsrc/xilnvm/src
+ cp -r $SERVICES_DIR/xilnvm/src/Makefile $BSP_DIR/libsrc/xilnvm/src
+@@ -103,7 +96,6 @@ cp -r $SERVICES_DIR/xilnvm/src/versal/server/* $BSP_DIR/libsrc/xilnvm/src/
+ cp -r $SERVICES_DIR/xilnvm/src/common/server/* $BSP_DIR/libsrc/xilnvm/src/
+ cp -r $SERVICES_DIR/xilnvm/src/common/* $BSP_DIR/libsrc/xilnvm/src/
+ cp $BSP_DIR/libsrc/xilnvm/src/*.h $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilnvm/src/Makefile"
+ 
+ mkdir -p $BSP_DIR/libsrc/xilsecure/src
+ cp -r $SERVICES_DIR/xilsecure/src/Makefile $BSP_DIR/libsrc/xilsecure/src
+@@ -115,7 +107,6 @@ cp -r $SERVICES_DIR/xilsecure/src/versal/common/* $BSP_DIR/libsrc/xilsecure/src/
+ cp $BSP_DIR/libsrc/xilsecure/src/*.h $BSP_DIR/include/
+ mv $BSP_DIR/libsrc/xilsecure/src/libxilsecure_pmc.a $BSP_DIR/libsrc/xilsecure/src/libxilsecure.a
+ rm -f $BSP_DIR/libsrc/xilsecure/src/libxilsecure_*.a
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilsecure/src/Makefile"
+ 
+ # copy bsp standalone code
+ cp -r $STANDALONE_DIR/common/*  $BSP_DIR/libsrc/standalone/src/
+@@ -144,7 +135,6 @@ do
+     cp -r $DRIVERS_DIR/$line/src/*.h $BSP_DIR/include/
+ # copy all the HSM generated driver files DRIVER_g.c
+ 	cp $WORKING_DIR/x"$line"_g.c $BSP_DIR/libsrc/$line/src/
+-	BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/$line/src/Makefile"
+ done < $DRIVERS_LIST
+ 
+ #copy the processor code.
+@@ -176,4 +166,3 @@ cp $STANDALONE_DIR/microblaze/*.h  $BSP_DIR/include/
+ 
+ # no inbyte and outbyte present in standalone
+ cp $WORKING_DIR/inbyte.c $WORKING_DIR/outbyte.c  $BSP_DIR/libsrc/standalone/src/
+-export BSP_SEQUENTIAL_MAKEFILES
+diff --git a/lib/sw_apps/versal_plm/src/versal/Makefile b/lib/sw_apps/versal_plm/src/versal/Makefile
+index 15956c8a14..a944225845 100644
+--- a/lib/sw_apps/versal_plm/src/versal/Makefile
++++ b/lib/sw_apps/versal_plm/src/versal/Makefile
+@@ -32,6 +32,8 @@ all: $(EXEC)
+ $(EXEC): $(LIBS) $(OBJS) $(INCLUDES)
+ 	$(CC) -o $@ $(OBJS) $(CC_FLAGS) $(CFLAGS) $(LN_FLAGS) $(LIBPATH) $(LSCRIPT)
+ 
++$(OBJS): $(LIBS)
++
+ $(LIBS):
+ 	echo "Copying BSP files"
+ 	../../misc/versal/copy_bsp.sh
+-- 
+2.25.1
+
diff --git a/boot/versal-firmware/xilinx_v2023.1/0002-sw_apps-versal_psmfw-add-support-of-parallel-build.patch b/boot/versal-firmware/xilinx_v2023.1/0002-sw_apps-versal_psmfw-add-support-of-parallel-build.patch
new file mode 100644
index 0000000000..68866223ad
--- /dev/null
+++ b/boot/versal-firmware/xilinx_v2023.1/0002-sw_apps-versal_psmfw-add-support-of-parallel-build.patch
@@ -0,0 +1,48 @@
+From 2ed864ef5965b7466fb145f479ce0747123f2ce0 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Mon, 4 Sep 2023 07:14:38 +0100
+Subject: [PATCH] sw_apps:versal_psmfw: add support of parallel build
+
+The PSMFW build fails when make command is invoked with -j option.
+The root cause is, the 'all' target in src/Makefile tries to compile
+the source code before bsp copy was finished when -j option is
+enabled during build.
+
+Corrected dependency in the src/Makefile to let the bsp copy
+finished before compiling the source.
+
+Signed-off-by: Naman Trivedi Manojbhai <naman.trivedimanojbhai@amd.com>
+---
+ lib/sw_apps/versal_psmfw/misc/Makefile       | 2 +-
+ lib/sw_apps/versal_psmfw/src/versal/Makefile | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/sw_apps/versal_psmfw/misc/Makefile b/lib/sw_apps/versal_psmfw/misc/Makefile
+index 02d85e492e..92d95d0896 100644
+--- a/lib/sw_apps/versal_psmfw/misc/Makefile
++++ b/lib/sw_apps/versal_psmfw/misc/Makefile
+@@ -17,7 +17,7 @@ ifneq (,$(findstring win,$(RDI_PLATFORM)))
+ endif
+ 
+ all:
+-	$(MAKE) --no-print-directory seq_libs
++	$(MAKE) -j1 --no-print-directory seq_libs
+ 	$(MAKE) -j --no-print-directory par_libs
+ 	$(MAKE) --no-print-directory archive
+ 	@echo 'Finished building libraries'
+diff --git a/lib/sw_apps/versal_psmfw/src/versal/Makefile b/lib/sw_apps/versal_psmfw/src/versal/Makefile
+index 1572bbbca9..3f1589283b 100644
+--- a/lib/sw_apps/versal_psmfw/src/versal/Makefile
++++ b/lib/sw_apps/versal_psmfw/src/versal/Makefile
+@@ -33,6 +33,8 @@ all: $(EXEC)
+ $(EXEC): $(LIBS) $(OBJS) $(INCLUDES)
+ 	$(CC) -o $@ $(OBJS) $(CC_FLAGS) $(CFLAGS) $(LN_FLAGS) $(LIBPATH) $(LSCRIPT)
+ 
++$(OBJS): $(LIBS)
++
+ $(LIBS):
+ 	echo "Copying BSP files"
+ 	../../misc/copy_bsp.sh
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
