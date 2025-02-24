Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C148C021B5
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 11:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F80B605DC;
	Mon, 24 Feb 2025 11:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JonskX8fm6-c; Mon, 24 Feb 2025 11:45:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E28260C08
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E28260C08;
	Mon, 24 Feb 2025 11:45:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 17200B88
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 11:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 047C540BA5
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 11:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nNMlDXf9aCuB for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 11:45:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::630;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 704C940BA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 704C940BA8
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 704C940BA8
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 11:45:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aowSlDbOzinkw0RlzSb7pQeM5rCY6HmoBMX905GrxFll0L5TcjPfwtgGMBd9NzRXqeME/w6Ye18sPUBfGwQ0tz2dWbQmcUqGrKyRnml252QK8cKkyDvuELyDefGM06MLczR5nIf3lzt0lQV9W2FVkA7Q4mwLxYEWwIKe5kA4dGpxpeNITL5DdliRO4H7efbnFfd5VHVbJ4ZdY/wRZ4/HISWpKqa8zavLfzizLHb/Gp35f2CdAXT1TOBu9wre+qrJJQNqdeggOmwe2xEXfPHBQohycXWyYYAqWvmWxtNvPU9w7yPMfWaxMwCcSpyDLqdQh/KegV3uUP+5DH7WjH2KGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiMphGr9JWpPDvwRCEvQw5mW+jXYwG9Jn40GaLAQ/cA=;
 b=NLyRcI+aaabgxSO0WVVhGFztkBUfiIkxAG4vO54HpFaKHlsu+jLbHoHDCMLTvCo71A4YFXtb4J1bw89MFGB8zx93GbiFZXdqvR46psEY1QSbHhUgQc5UqqmJpjomrBZ/Kinz0uELBTJ8QHHT24L5zzSolwYDLpJUjamda5LEVVeCE7+w2LLrIQUHLuUoEK/vM12oelo4op2YfTjzURwa0jYypXbketennGipds9ILbPmAgex1fE2xxwt/xc9pZjWRNtqoSI08mOLTViQ49Y31V/69+ek3aAXNmHBISLvsPoYgGX89HrAbgTYsxegEAR9O/UtjYtS/mXjO3hr22fo5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR03CA0094.namprd03.prod.outlook.com (2603:10b6:303:b7::9)
 by CY8PR12MB7123.namprd12.prod.outlook.com (2603:10b6:930:60::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 11:45:36 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:303:b7:cafe::4d) by MW4PR03CA0094.outlook.office365.com
 (2603:10b6:303:b7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.21 via Frontend Transport; Mon,
 24 Feb 2025 11:45:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Mon, 24 Feb 2025 11:45:35 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 05:45:32 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 05:45:13 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 24 Feb 2025 05:45:11 -0600
To: <buildroot@buildroot.org>
Date: Mon, 24 Feb 2025 11:45:07 +0000
Message-ID: <20250224114509.3416189-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|CY8PR12MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: 863b106c-ccbf-4995-0bda-08dd54c8c06e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MPpCu4LxPM+obNN1o8Hhc8uP0gjCbR7jGrj0JfwPnE6qRbnDdOBfxFGtnjqr?=
 =?us-ascii?Q?eQvfD9sBf5F3FmCFGeJ3b7S9Awt9fdfvuYwqsLgWGFBnV5M/BeHen9Okj7Kn?=
 =?us-ascii?Q?Ha1POSJHo/YxIb5wvw2lV+3nnDZDtDExh5yuHpXFo7kJrGIh7JX+XTouquBG?=
 =?us-ascii?Q?aAvVIrXmeYdh7tGZGAKg+A5/9JI/MReI5SFIh27DKvh+wUo6AxKmyAUowQk+?=
 =?us-ascii?Q?wYadGbscmzvoJoCsp3Fis94j/GShgU4dsU5NHE8pVtsT8ccE94GpeZymcS2R?=
 =?us-ascii?Q?GNCA1FYyHjXnxnQeKrtQjzOZJievmxDLWL16wqWQbYZasAccKrsFx7qEWdYv?=
 =?us-ascii?Q?sZiQbyvyKwV9Os6WQtpVsouNi8N/qD2dC5mDyztQcjg4fICX2r/3XqOSxOtC?=
 =?us-ascii?Q?Kwatc8ID6HSfcoef9Wpj4ZgxFM7XPywp3AXzB47k6zT0uaqUxHq1m0X8Z48m?=
 =?us-ascii?Q?LR7ro27h9jlm9PeRvVgga4iofdHv8q0FGqM1qzLvoh/rF9NjIDTJBcjVOV7j?=
 =?us-ascii?Q?VD+Sny6ySKpAopMpDP8GdEoaFDCempqgzxeO9L55HYp40a168Ccu47aU/hcJ?=
 =?us-ascii?Q?mEr35Gu588BSRuc9PMU+ioY8CDK9pL+VnfVJoAU9Zkug/NPYrKocwKg+GP40?=
 =?us-ascii?Q?8wti4YJ80pt+B7/r9M0Hd4SGdL9ZnyPL646xl124hI6ItJSTAeJLPibaMobn?=
 =?us-ascii?Q?a1venhAW+tjpoqM9yrYCGuV47OINYMLv03Wkja67GcYxJliMoIBz+LDeYo/K?=
 =?us-ascii?Q?EwiRGYzbSVGS5RrQHWb1eaE2VJsTOPBiTGn13Z7nxvfXzLCZW8VTp017X30Q?=
 =?us-ascii?Q?xvjORiPy5HNKR+2LBFYHlp58PFwWIAhbh1YPMCPxWBQrbGLtV/N9P2xRXCzR?=
 =?us-ascii?Q?lMKDgiq33yN07/Vx3PdBOQqZtiCQzFVEOLOLpGEVT5v2YMg4flQhh6QqMVhJ?=
 =?us-ascii?Q?bO15dAJLKPuZJTF0ADjXVzIw82StGB2FUzO7BexTSe93mIVA/2oxBqiU0Pcu?=
 =?us-ascii?Q?T0NGzQbzW5xRU1hxpbMmWCYxHRNUCYv/vNYANuZYB7y07e1IZ906cKwiL6r6?=
 =?us-ascii?Q?94tWUDcBPJHdvI8u1Qto62IWvGxtt0omALUlWWZc/zgq8aUt1zUkTdwuJ/cH?=
 =?us-ascii?Q?kRr3B0NDhUTkcuEuDsnXoUCA3Cqai09y6CqRhFnebmGEeVDzxJgZHCMwlRm0?=
 =?us-ascii?Q?2rqPsfEpAv52hA1elFwnSnsTdS0Xl8Q5o7JaGtrBwmocYAvoa05XaRAbfd8j?=
 =?us-ascii?Q?nV566QRUzkhIFEOdbosyFHkgaFhZ3bRUVeiyePOs5avap/l0fE8Iqv/3AL30?=
 =?us-ascii?Q?ckjci2b+a1g1/yYt4DAevi/Q6ZwOFZ5IiCKvxPnfX2xS/sYtofVmA3HfJRyN?=
 =?us-ascii?Q?1C1wzOfWemB14BMl/RLZF0O7oFSuSN3p7A3JeA7e50QFePcWWv4R8Vrgj4as?=
 =?us-ascii?Q?MhtBjGKg4jSXyUGGhypORfG1FimW7y9lcbBRyd2wki94pjzeyXOBfV8UXMeJ?=
 =?us-ascii?Q?rt18lFNCQnGnXJG5+EdLSMLAYFFbmX1iV9Zo?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 11:45:35.3702 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 863b106c-ccbf-4995-0bda-08dd54c8c06e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7123
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiMphGr9JWpPDvwRCEvQw5mW+jXYwG9Jn40GaLAQ/cA=;
 b=Tj1YhXTHNoNW3jzj25c+qozYKb+uwRXV1t4RdPmvX2eQUB5ii/69DgUtM7aGClocoNueO4shMUvuItaTK/lOi7F/yIF2iXxSKa5D9sgB0lOPg3rwFvhhq9AOH2Y28DVZ5BrT1u0ALZ/Kdnzn1w5gYK0TkjAvAb7oBm23Fbznoe8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Tj1YhXTH
Subject: [Buildroot] [PATCH v3 1/3] boot/xilinx-embeddedsw: rename toolchain
 vendor to buildroot
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
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch renames the bare-metal toolchain vendor used by the
xilinx-embeddedsw package from Xilinx to Buildroot to be consistent with all
other toolchains built by Buildroot.

To build the Microblaze applications available with the xilinx-embeddedsw
package, the following config is now needed:

BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"

This change keeps backwards compatibility for users already using the
following architecture tuple:

BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"

Either vendor name is now valid, but the documentation will describe using
the Buildroot vendor name.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- xilinx-embeddedsw is now backwards compatible with either vendor name
V2->V3:
- split patch into series
---
 boot/xilinx-embeddedsw/Config.in            |  3 ++-
 boot/xilinx-embeddedsw/xilinx-embeddedsw.mk | 26 ++++++++++++++-------
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index b0691d7e7b..9835f813d0 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -14,7 +14,8 @@ config BR2_TARGET_XILINX_EMBEDDEDSW
 	  Applications can be found on the Xilinx embeddedsw repo:
 	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps
 
-comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
+comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
 
 if BR2_TARGET_XILINX_EMBEDDEDSW
diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
index 7d4fcf8b8f..eff015bc35 100644
--- a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
+++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
@@ -12,6 +12,14 @@ XILINX_EMBEDDEDSW_INSTALL_TARGET = NO
 XILINX_EMBEDDEDSW_INSTALL_IMAGES = YES
 XILINX_EMBEDDEDSW_DEPENDENCIES = toolchain-bare-metal-buildroot
 
+ifneq ("$(wildcard $(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc)","")
+XILINX_EMBEDDEDSW_MICROBLAZE_CC = $(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc
+XILINX_EMBEDDEDSW_MICROBLAZE_AR = $(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar
+else
+XILINX_EMBEDDEDSW_MICROBLAZE_CC = $(HOST_DIR)/bin/microblazeel-buildroot-elf-gcc
+XILINX_EMBEDDEDSW_MICROBLAZE_AR = $(HOST_DIR)/bin/microblazeel-buildroot-elf-gcc-ar
+endif
+
 # ZYNQMP_PMUFW application allows users to add cflags
 XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS = \
 	$(call qstrip,$(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS))
@@ -23,9 +31,9 @@ XILINX_EMBEDDEDSW_CFLAGS = "-Os -flto -ffat-lto-objects"
 ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)
 define XILINX_EMBEDDEDSW_BUILD_VERSAL_PLM
 	$(MAKE) -C $(@D)/lib/sw_apps/versal_plm/src/versal \
-		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
-		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
-		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		COMPILER=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
+		ARCHIVER=$(XILINX_EMBEDDEDSW_MICROBLAZE_AR) \
+		CC=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
 		CFLAGS=$(XILINX_EMBEDDEDSW_CFLAGS)
 endef
 
@@ -38,9 +46,9 @@ endif # BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW),y)
 define XILINX_EMBEDDEDSW_BUILD_VERSAL_PSMFW
 	$(MAKE) -C $(@D)/lib/sw_apps/versal_psmfw/src/versal \
-		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
-		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
-		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		COMPILER=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
+		ARCHIVER=$(XILINX_EMBEDDEDSW_MICROBLAZE_AR) \
+		CC=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
 		CFLAGS=$(XILINX_EMBEDDEDSW_CFLAGS)
 endef
 
@@ -53,9 +61,9 @@ endif # BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
 define XILINX_EMBEDDEDSW_BUILD_ZYNQMP_PMUFW
 	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
-		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
-		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
-		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		COMPILER=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
+		ARCHIVER=$(XILINX_EMBEDDEDSW_MICROBLAZE_AR) \
+		CC=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
 		CFLAGS=$(XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_CFLAGS)
 endef
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
