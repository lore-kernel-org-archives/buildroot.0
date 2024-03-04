Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E52C54E49
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 07:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A5F140687;
	Mon,  4 Mar 2024 07:42:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V5Dc6gwitWiZ; Mon,  4 Mar 2024 07:42:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30FBA407EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30FBA407EF;
	Mon,  4 Mar 2024 07:42:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5FBA1BF280
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 07:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E091681EE5
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 07:42:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rh8KxKwcW58W for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 07:42:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::600;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9EB6B81EE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EB6B81EE0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::600])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EB6B81EE0
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 07:42:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gk+acAzzaISV11XZ1nWcjA93YUPUe/goLJnygvRqIyGL4q2d4qXK69knujcp6NoD2XJXGzqolX2bdbqMBlc4GrYr5r//4JdBOxSBejZKc6vAolpgOGiVLqNgwE/LPmc8iKmqghxLPZ2gYpugDh5W8kY7iYGlun1jarGdrojC7He3/BoEYsS2DszxI6bvHmpTvdpDpj2zGTPEdWQt3k/zV4dMHHDq2H8+X1wr0Clk4YtKAvVOSBAl/9OJa0N5AQ3QOfCZUiS7gLJJwoqx74IFck1VOJj7WxyVVur4PTKfRtiauUW+fH7Dk93/IZmlwqOorkQqhSX1MIm45PvKgqLY/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNnnPg701TdBve4UJeTbJsHoD2AFDUrJbPGcsjzTBJ0=;
 b=Cz7L0vniYWcNrhefb4cQVr2geUHCyQPdThru5OHHenBpwbesCoobSueSf009v/o64qde0t1BidKZIAxcRcMZbV7rdLGDWWBdESQkWlQlOeeWfAbrimuM9lfG3Sy3+S440ESygdvrNpDd7n02kXDsGii7A7l9ttG9TfCgBxbE85rsAUPLWr0ZIxB15TNadrPOjTXaalQokBvTkGGvGvIRolp9fc/oQBkcD9MEZQDX9Sm+A+LQg0Gum1lwvHsWUcIKlKMGxPZ39R1ucXlquql8jeWD+sjAUtm5p/ES8Fc3T6obP3BTasmunhpuiZbmY3/XaM3qOrDDc1PHqcx2G6cJaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR07CA0075.namprd07.prod.outlook.com (2603:10b6:5:337::8) by
 DM4PR12MB7550.namprd12.prod.outlook.com (2603:10b6:8:10e::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7339.38; Mon, 4 Mar 2024 07:42:10 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:5:337:cafe::29) by DM6PR07CA0075.outlook.office365.com
 (2603:10b6:5:337::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Mon, 4 Mar 2024 07:42:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Mon, 4 Mar 2024 07:42:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 4 Mar
 2024 01:42:05 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 4 Mar 2024 01:42:04 -0600
To: <buildroot@buildroot.org>
Date: Mon, 4 Mar 2024 07:41:38 +0000
Message-ID: <20240304074140.1537910-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304074140.1537910-1-neal.frager@amd.com>
References: <20240304074140.1537910-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|DM4PR12MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ea94dc6-d08a-4e98-645e-08dc3c1e990a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oCVtHiGeh4gDyI0FyFR6O7AE7mfzVMo7GQDRDgyOVkxngpaq9Cr4tC6c5hK7k2Gjdhty/iea6zYCRvhJC6nhggLvkEztGWGnX4cu9d2VBSpBwzm/42gG7rWLag8M4xaGdSxvmutn03TucNKIJWuU4ep7tW7/lf43drr8cKs+og5uDNtC1xsC+ldW34XbdIHDFpbFpa23+p6C0FBGfSHaHAKD/1LEx+lrmRwFikSEfnAAQSIVyhD2qlsSgV/ckoFg9RqX+C9AizuQ4DHTXd8QohqewNipAjXx7VmXqhLIU5It/mgo4S3EPXZgs9LNQjA74+XVfs/rHB/ioaWzjcRwTw30Rja2ievdablRgPU78rsJsQtl5w+f+mfaUq4nnyryvNurtKACeObtEQPllD8ajgHDLzgnGEX4Xdc/OP9EdySjFt8mH+AEVpnWza7T4sNhCJRTJmFuNTb4VLSTn7DjlpvWuV18MKbZLsgKJCSlHc7mRPdxeKuHCOr4R027OcprI+tVOGixZpi2Ia8VljnJjftMjUNQiuW4QC4aLyWvMumA0rYuqiwOVdFus41VjW1Fqz/P5A2PTbf7FwVwxwGeVhT9Mg8GwdjHnPl7ptKBzXae3pHgsrnma7HOqqLNfOyo33igpl33BRHyq413lzTmlZHJHMRF5YHS1S2xT/Q0EgesCQN2jEmVdtRDiNzIsxhcnCW5GXD26f2gE3q6Vg8/xA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400014); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 07:42:09.3110 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea94dc6-d08a-4e98-645e-08dc3c1e990a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7550
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNnnPg701TdBve4UJeTbJsHoD2AFDUrJbPGcsjzTBJ0=;
 b=BMkd35CKpcLDW43mKve6bF/4GFIvRzHDsaefZaWGmSwS4yF3nXJnQDmr3edemDJHavw4fUM17/aGhyc84WZAxLCyC9+oqeDlzJ7F+r+S02G/G6obo8KT4939EZb/+GPd++Y6CVzn+Sux9LchqSFFzOyPlIaCNHOLbslh5v4Y7Gw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=BMkd35CK
Subject: [Buildroot] [PATCH v11 4/6] boot/versal-firmware: new boot firmware
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
V9->V10:
 - removed patches for supporting versions older than xilinx_v2023.2
V10-V11:
 - set default BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH to
   "microblazeel-xilinx-elf" to avoid stand-alone build failure
---
 DEVELOPERS                                    |  1 +
 boot/Config.in                                |  1 +
 boot/versal-firmware/Config.in                | 38 ++++++++++++++
 boot/versal-firmware/versal-firmware.mk       | 52 +++++++++++++++++++
 .../toolchain-bare-metal-buildroot/Config.in  |  1 +
 5 files changed, 93 insertions(+)
 create mode 100644 boot/versal-firmware/Config.in
 create mode 100644 boot/versal-firmware/versal-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b677d9cd5b..fa3424074e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2283,6 +2283,7 @@ N:	Neal Frager <neal.frager@amd.com>
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
index 0000000000..cda72c7704
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
+	  Only versions xilinx_v2023.2 and newer are supported.
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
diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
index 7d33a68c5c..1a15558371 100644
--- a/toolchain/toolchain-bare-metal-buildroot/Config.in
+++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
@@ -2,6 +2,7 @@ if BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
 
 config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
 	string "architecture tuple"
+	default "microblazeel-xilinx-elf" if BR2_TARGET_VERSAL_FIRMWARE
 	default "microblazeel-xilinx-elf" if BR2_TARGET_ZYNQMP_FIRMWARE
 	help
 	  This option allows to define the architecture tuple for the
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
