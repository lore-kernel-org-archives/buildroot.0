Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6220C3DA6D
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 08:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F72B40D26;
	Mon, 19 May 2025 08:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ez7sTPoZ-lAv; Mon, 19 May 2025 08:36:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2383840D2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2383840D2E;
	Mon, 19 May 2025 08:36:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F201D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 08:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E98D280E3D
 for <buildroot@buildroot.org>; Mon, 19 May 2025 08:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5bFWHRywg8p for <buildroot@buildroot.org>;
 Mon, 19 May 2025 08:36:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::60b;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B6F380E0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B6F380E0E
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::60b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B6F380E0E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 08:36:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rx0XJlBPvglimx0sXn5pTX0+NZy3vQwvwVNDfQoovJE+w5i0egTlyNj5eXXmhWrNdAWMDYg52qmaI+gSlIWUPWleYz1Gz6HG/Xpq5bG/dEtfKKZ3KxNQEvdp5kUMPZy20q42SA1qAjtmF+sJ5kD9q3/leMiynDMilB0e2U47aW6wqmDEXfY8d3bLVRt83c8V1vO19AcHsMWXacqBartsnm2tUYo0IKQi1Rx/pfckavlpjEgQ6O8a94QrKNstBBs06Rz2AtZ59TfhKeYMbP296EECcdxNiL/1JwRoyshezSyu1gzRxclIi+9xPwYpdNTHPNCvKQLqG0v1KWIIyMEr/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phZYCPr6MpUGM7dC8XUtPoDNbrctN1SPCi+vzEJANvY=;
 b=K4Zli4WIkQ5uPR7NzePO9oeID+dw5X6p2zfaUbtOYzhvesie4UsLEy2301CPp3g+Qw5j/1unnOlgqSjJp0Svi65ZPtd72HPsjSwhIjWop6sqafPyju5y4ak9g+6nbw9XcpJbMXS7KqykgjYkZj/sIfaR7UNp4RKatmIEJgVwRzuBn1NF4B9Vpy659jDk7HiXR2IequGAXZFZejLoF12jyTE2SNh6L8eST/pdysECbSk1Z6/Zxq+2M+NVG9HV2gvJ36MhVcCED8ki3tgwHqphgdOQoK+SQHy8ku8bIhcJ5u0aFCkrj7j68xVTBEgi2GnwSVOn06kjIg0uTFoOY/Wt+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR16CA0028.namprd16.prod.outlook.com (2603:10b6:610:50::38)
 by CY5PR12MB6383.namprd12.prod.outlook.com (2603:10b6:930:3d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 08:36:43 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::ab) by CH2PR16CA0028.outlook.office365.com
 (2603:10b6:610:50::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Mon,
 19 May 2025 08:36:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 19 May 2025 08:36:42 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 03:36:42 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 03:36:42 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 May 2025 03:36:40 -0500
To: <buildroot@buildroot.org>
Date: Mon, 19 May 2025 09:36:31 +0100
Message-ID: <20250519083632.1930804-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250519083632.1930804-1-neal.frager@amd.com>
References: <20250519083632.1930804-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|CY5PR12MB6383:EE_
X-MS-Office365-Filtering-Correlation-Id: cc243d96-8c2c-4cc1-23ac-08dd96b0486e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SCU2RT9eCOtvavJCSpHreUGLAYQ5rFQtJmeNAy6LzF2JUpLfGbBhliv0SsLJ?=
 =?us-ascii?Q?LodELtvdQXu1Fht4rJMH5oenEszI+8uOaH7ltvpciARcthMg2VDg5gbo6uXn?=
 =?us-ascii?Q?U5Gqj06icgJFfk948LN/geb/VkgFZTa59PwO6nUJiz8Ahk1qTZSWppWuNIjn?=
 =?us-ascii?Q?CS/eBm5l/X5eK6Vp86v1tqjrJR9L2qfJUj5l3RbzwC/0ggZR1qMN5ioXZ5FA?=
 =?us-ascii?Q?cW2s1SAXEY3sknWPQKbhWknticPn3aBcZW6zXC3GiLh7pNO35TvjQvRV5wg/?=
 =?us-ascii?Q?KQhsRZQzdysX1sXo+12fdmElBUDkGMf9lg8Kjf3j01bRPVcaXA24lDHE2LoP?=
 =?us-ascii?Q?2MYCMwnPkwnrbhsuvrPzTEjqX3xs5dUDEvpV78dOvc0IIroMaR6YEEbiP0n/?=
 =?us-ascii?Q?GQNeM7kZy6FlmTI9qfLVO/p69dSrg5sETupBHqhkBEzUk2W7+nAtm0pi7IFi?=
 =?us-ascii?Q?WP65SZd9dnQz7NMreXrNIPjM5b7RsczlZc/9TrrUIsBjvhVpmgWCytEbvf06?=
 =?us-ascii?Q?BlsXEL4sqmz0eyWUkMHA3q/StUf0J3mFywBGTAxxottALw3ZS52CMUoLsUlY?=
 =?us-ascii?Q?bHinyorq6aycz0CFA0D+bUzeyiGyliMIXs0d1UYxpDQU1huHkHD2RaqdOTYU?=
 =?us-ascii?Q?bYAKXUHFuTd9H47FS053U1UchcvGKaPXEYx1MfCUVYrbBvYRzsE7gHMzJMYs?=
 =?us-ascii?Q?a90zqmXW4dl3v8a+V/rTPvwjLAMhYXR+96wkp8Mxhpmud/n8WVfsiW+SQjKW?=
 =?us-ascii?Q?i4YqAO17yEwvdtaZTLt0XHaDGqcFY1Ht4FC7Pnvw5xyUBHB0hEypYHKC5VCp?=
 =?us-ascii?Q?aYH0qbelNY4G7w90FspjZV4ZodCBgXFPtaoVPTy8YRq87EmZtcFr8iEekDML?=
 =?us-ascii?Q?eU8id47rMJdrXQafLIalr0jMWRz5wiqW+OYgvdsj6H12xJam9ZXGRWSm5B9x?=
 =?us-ascii?Q?w0ZBd0lK6xU0SqG+8x8lT6KEOyjGo/kTatMz1U2wazcF1qPdgeWn4lusnwpr?=
 =?us-ascii?Q?bERPRmykJFHKxZlnzxJyvlRVI3CxjwCHEm/1w0Wdx2YfEoIw+JcaQdNjGxGZ?=
 =?us-ascii?Q?yRwCaF4yIq86w3U1fayS6i20QnNCnYLf3Ge0mo5z/9BdKpSHWrnqm9iNPe2h?=
 =?us-ascii?Q?NvA0RFASMBYp+cOjgAoNSqly6+HzC6qhrvYLEKyCg81VSWJsvNVZZIXSK4JN?=
 =?us-ascii?Q?HbasDhGMFmqCyJBuP9gV1FFOzpXHfGx3FkPp2NYGK7VCc6fjioMPmrXHuXlT?=
 =?us-ascii?Q?HAe8vfFUMXR9r+miI1rE7G428ZoCUd84LAkqRWyRKtFHJPIvqWIT3VJBN/Ej?=
 =?us-ascii?Q?bIpWX/HKJ7YMMkGkjZC9xOnARLOXcRRAyIr2gGPAu3nAOWF87qRLF6Mwc8Lj?=
 =?us-ascii?Q?+8giGkad+o82lFdf48O74DD8Ota72H8WiNJhDpzAk1I2MtANcUQHWFq/7LVx?=
 =?us-ascii?Q?QcuMzlwXOgcW4001nC0PIZEnJABzc1GN8ZbKcoDHFyL3rrZVOaqM4qC01ZTB?=
 =?us-ascii?Q?5/n1ZK0jYY+Od2FkJBhxA/UkUBf/ZWp3buft?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 08:36:42.9511 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc243d96-8c2c-4cc1-23ac-08dd96b0486e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6383
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phZYCPr6MpUGM7dC8XUtPoDNbrctN1SPCi+vzEJANvY=;
 b=4eybWY1eFzJn1n+HYsgW/BX2WwNDfW8LoEkYMCBSysOAgbRV4dfFqcIVpoJE01lfFpDA1KCWtkhbz/UNOZhxRTuD+TmgEaQnsACjrXCS1DW+pql4Sqh86kQVw2hRaD3svx4CjLK0/qb75bHHr5UzFDd8Qo7Lk8QzmLofWCJno2w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=4eybWY1e
Subject: [Buildroot] [PATCH v4 4/4] boot/xilinx-prebuilt: install pld.pdi to
 target
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, fabio.caccamo@amd.com,
 romain.naour@smile.fr, michal.simek@amd.com, arnout@mind.be
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With the Versal Segmented Configuration, it is possible to load a PL bitstream
at run-time using the Linux fpgautil application.  Whenever Segmented
Configuration is used, both the boot.pdi and pld.pdi files will be available
to Buildroot.  For this reason, this patch improves the user experience by
installing the pld.pdi file to the target file system for run-time loading
whenever Versal Segemented Configuration is used.

If the fpgautil application is available in the target file system, it can
be used for loading the pld.pdi using the target command below.

fpgautil -b /lib/firmware/xilinx/*_pld.pdi

The source code for the fpgautil application can be found here:
https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c

Along with usage details:
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1188397412/Solution+Versal+PL+Programming

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- New to patch series
V2->V3:
- Changed wildcards to more specific name "*_pld.pdi".
- Changed install directory for _pld.pdi to $(TARGET_DIR)/lib/firmware/xilinx
  to match Yocto default location.
- Changed pdi file permissions to 0644.
V3->V4:
- added Kconfig option to enable this feature
---
 boot/xilinx-prebuilt/Config.in          |  9 ++++++++
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 30 ++++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index b95df5cbf4..b127097c7e 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -63,6 +63,15 @@ config BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION
 
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
+config BR2_TARGET_XILINX_PREBUILT_VERSAL_PLD_PDI
+	bool "install versal pld.pdi"
+	depends on BR2_TARGET_XILINX_PREBUILT_VERSAL
+	help
+	  When using the Versal Segmented Configuration, there is a
+	  pld.pdi file containing the FPGA bitstream which can be
+	  loaded at run-time.  By enabling this option, the pld.pdi
+	  will be installed to the target /lib/firmware/xilinx dir.
+
 config BR2_TARGET_XILINX_PREBUILT_FAMILY
 	string
 	default "zynqmp" if BR2_TARGET_XILINX_PREBUILT_ZYNQMP
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 05dc9aebe8..62b60b88fa 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -19,7 +19,6 @@ XILINX_PREBUILT_LICENSE = MIT
 XILINX_PREBUILT_LICENSE_FILES = LICENSE
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
-XILINX_PREBUILT_INSTALL_TARGET = NO
 XILINX_PREBUILT_INSTALL_IMAGES = YES
 
 XILINX_PREBUILT_FAMILY = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_FAMILY))
@@ -48,6 +47,18 @@ define XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI
 		) \
 		$(BINARIES_DIR)/boot.pdi
 endef
+
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_PLD_PDI),y)
+# Install pld.pdi in target file system for run-time loading when using
+# Versal Segmented Configuration.
+define XILINX_PREBUILT_INSTALL_VERSAL_XSA_PLD_PDI
+	$(if $(wildcard $(@D)/*_pld.pdi),
+		mkdir -p $(TARGET_DIR)/lib/firmware/xilinx && \
+		$(INSTALL) -D -m 0644 $(@D)/*_pld.pdi \
+			$(TARGET_DIR)/lib/firmware/xilinx
+	)
+endef
+endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_PLD_PDI
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
 XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
@@ -63,6 +74,18 @@ define XILINX_PREBUILT_INSTALL_VERSAL_BOOT_PDI
 		) \
 		$(BINARIES_DIR)/boot.pdi
 endef
+
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_PLD_PDI),y)
+# Install pld.pdi in target file system for run-time loading when using
+# Versal Segmented Configuration.
+define XILINX_PREBUILT_INSTALL_VERSAL_PLD_PDI
+	$(if $(wildcard $(XILINX_PREBUILT_BOARD_DIR)/*_pld.pdi),
+		mkdir -p $(TARGET_DIR)/lib/firmware/xilinx && \
+		$(INSTALL) -D -m 0644 $(XILINX_PREBUILT_BOARD_DIR)/*_pld.pdi \
+			$(TARGET_DIR)/lib/firmware/xilinx
+	)
+endef
+endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_PLD_PDI
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
 ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)
@@ -96,4 +119,9 @@ define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
 	$(XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW)
 endef
 
+define XILINX_PREBUILT_INSTALL_TARGET_CMDS
+	$(XILINX_PREBUILT_INSTALL_VERSAL_PLD_PDI)
+	$(XILINX_PREBUILT_INSTALL_VERSAL_XSA_PLD_PDI)
+endef
+
 $(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
