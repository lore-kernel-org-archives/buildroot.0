Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30839C02185
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 10:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC3866179A;
	Tue, 21 Jan 2025 10:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJ5Yn0_3-n92; Tue, 21 Jan 2025 10:22:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 356B1612CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 356B1612CB;
	Tue, 21 Jan 2025 10:22:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A9EB4959
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 10:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97BE0416DF
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 10:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GmYY01-4tTSh for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 10:22:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::625;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 11CA94171F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11CA94171F
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::625])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11CA94171F
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 10:22:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVoxnYr0lvUC4KS5tKb2gLSUPEf2vTaVtgqfFUyOU3/TnXSmNWiUyhOQqitDN4KUePXIPAo1hwPZ2HEK1FmR3vb+PO5khtxP4vyyH1Wvn4AUDoCM9yN+AIEsro5eqoERAPwtyjciLzWIaEIdZm8Rh3a927g8Si2fb/LcWdOKiqc8fAQLY1PEpK17TR0tB3wdRwYZYyEDEyQa42TLpo1WxQrIoQ9YaTS7fpZq0d7FfsmxLqRcmjiEBQ1GzIKYrg1JbG063gj6QHfXRujZ6wSPNkiWH+qSX58R+lI1CH+6/c8JbLcEntfr6tmMMxKaUVQfVFwgJ7QeLRm61SCOOd+pGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68gaGoEA9yjJQU7UG762b8j/NsW+GugqN5OzE+g+vso=;
 b=sy+bIPuouhhmGEjTK3fqWP4g7Rbn0uDmWZNVrz39JP7ozCuxuqQ5KOE5wmPdqAq/eh+AIToKPyz0DnWrmRVWQc4QlOVfLlb091EqJmQuRS86IuBx1Fg3BeTYfuB3Xrl2Xq83GPZh/zKYVuxzq0zb5SaItdvJQCnPsGFIgywnsYv066XbziG+wIMlsWj7Ggv4oCGhx4z90ex42mhH6bCqJThDhe/lgsJPq3XfGJkIXL8GrnbUkfgTKyeK1MKkRkhjyLU+iPb64C8W10Z7tC7TTvXcWmxoKF6cXYLO0MLjNvRmlZOtK1SlDNUmN5aAKSKoxLjERPDS1wjAHlIanvOviw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SN7PR04CA0070.namprd04.prod.outlook.com (2603:10b6:806:121::15)
 by SJ1PR12MB6196.namprd12.prod.outlook.com (2603:10b6:a03:456::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Tue, 21 Jan
 2025 10:22:30 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:121:cafe::e) by SN7PR04CA0070.outlook.office365.com
 (2603:10b6:806:121::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Tue,
 21 Jan 2025 10:22:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Tue, 21 Jan 2025 10:22:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 Jan
 2025 04:22:28 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 21 Jan 2025 04:22:27 -0600
To: <buildroot@buildroot.org>
Date: Tue, 21 Jan 2025 10:22:20 +0000
Message-ID: <20250121102222.1335874-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250121102222.1335874-1-neal.frager@amd.com>
References: <20250121102222.1335874-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|SJ1PR12MB6196:EE_
X-MS-Office365-Filtering-Correlation-Id: 088eb6cf-7f24-4f25-5040-08dd3a058251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jW4to1iM1hCINoQfqJQ4DzP+v6SzOT5lMe3Go9vEKvOxGv8O/CL5RKpsHCmA?=
 =?us-ascii?Q?SwwZwoHNqYCVAdXN+cY+xTsV1SwYXXj9rgueZ9FjZtYyXkVgErGWMsABrea3?=
 =?us-ascii?Q?jyUrRn6TIb6wfe+q0BRMLtDRXfKKtAoQslJX/pIKY8RnElHjRdKp1xtF0p47?=
 =?us-ascii?Q?4PhAQua+5kEfSY6AraD4aCWIohoT+JeoO82hIpm+DsZckHzzh2oz7vdHGwOX?=
 =?us-ascii?Q?xxa+FJaxg9AgPm+MNpeSu9NHyC2XRvV6hon+sAjoIYAYLSvXHFuhoEIpm+he?=
 =?us-ascii?Q?jmWtOW46ztEx9rtU/5b4EkRSZHZBzkTWGBlQ3XuDGXfjibVCh28xLUCj5aG/?=
 =?us-ascii?Q?7VxUxNyxB61Piyc2TVTwTErJvUvqfmVQXELITrPmiJsaR1TVWjg5J+QHXYcr?=
 =?us-ascii?Q?lfO/aolhktEBFhOLfc6tKMDk2ijq3To1jvSKWxmqO3gfzS+eK+N0+dsKXUx8?=
 =?us-ascii?Q?UthClA5vvFkydo6q+zHGexB6J0/TBt9tXWo+N+ELotxdL1PgGtkPae64EX0I?=
 =?us-ascii?Q?CStzmwsbY2HV979rUpgBGp80RklgiuJkMvFcq9lvj9n8jLwGwwzLM7l9wKUB?=
 =?us-ascii?Q?ONja+RWwFiJNH9Bl2grBQxOYOniJC/hnOd6F68jhil+zTcpx5pGUAoNK2ctE?=
 =?us-ascii?Q?6LhsGucaZDNmaeJL5TopF806Nnc+EiF+KrCBMNkviB9JEVUdutUAuciiQvxI?=
 =?us-ascii?Q?DFPj7fQfwJUkFzAiusHgcVATY4PZVqSeMZhhfifBK8UyX55r07yrZNLLTPB9?=
 =?us-ascii?Q?ZcyAKN98Agy0+MTwlSLdt7i4XqoTeDny8kAobKuMYTCPuostf8xBKU8WVTkU?=
 =?us-ascii?Q?Q6i5KykgPgAIbzW8FpJqIt/cMSrtI0cnaPKrBn9bBKTXg0ShQh8FJW8YokSV?=
 =?us-ascii?Q?uSuH44aILR5EMxrMYdVOCemHuYEDTyhYzpX84w7eNFitcVqeWKJHsf/HvCCd?=
 =?us-ascii?Q?4HQIgfVPjS6L1Xkf4AHAjyqinkV9RpPMKXcdpUXbOA0GKh/Het9ltLAxbzdY?=
 =?us-ascii?Q?v//CAOxDOcvhIu3M3W5i34SzTB7+3kz7EcxJx3mHfCGA/am/nbi8N8WufaO2?=
 =?us-ascii?Q?Q6K7Wq/o7ETlxvydZsF3tWrHGJUoKFeuKPrTaUQ7PnqV4lubahcYfea+1Adh?=
 =?us-ascii?Q?Bdy9nDxm3NGjhviQ5FwYsVlhy21M3kE9Hl9rivAMdQy1386lLaUAOfmAE/Vl?=
 =?us-ascii?Q?RfMqhEru2riKODbXX3gIHgsTgaN+5BwjHwTTvLgkIEyMvXJXli4Pi+dGqffD?=
 =?us-ascii?Q?7NGWNa1rcHf6UrtuolzyIu2UIyQj9k/6epJDgUflKg5SKVY1i4dKxYKoeqOh?=
 =?us-ascii?Q?4uLvFuDNFMv2Yvc9Q9RwljhX3hBY/aKExScEQScjuQFs0sSyRf0wK47uHwHZ?=
 =?us-ascii?Q?/4WIa8kK0F4Du6mO3VtUjB8CXNm0uQ1K6TxdzaKxPwojAsVnHek0SPN8fEl7?=
 =?us-ascii?Q?O+MfZAm3v+YtwO7C20M2uQdexmauO3CUvWd5RMellhjLvfPxQLbxTA5KSs5H?=
 =?us-ascii?Q?g9ks1C+nQgPcw8ciPr088d2uDywrXflgCmrIKplypREAd2/7E/5G6YYYWA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 10:22:29.1311 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 088eb6cf-7f24-4f25-5040-08dd3a058251
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6196
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68gaGoEA9yjJQU7UG762b8j/NsW+GugqN5OzE+g+vso=;
 b=XXPZlqSM80DXL8oFJiPJClcx+yksRuGngww80355k+Tnrsg4/DIBa9nTxCzoY0Pi+dlmZSv8Bqxh+16UCuBxJiZCJxkfYDSbcAG+1/VQs4zaM/SMfj6110XZmF0KF2OukN0mRD+rsp82wbvpe5nEl3rJQdlgR/OhmqkTQ8b8+ac=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=XXPZlqSM
Subject: [Buildroot] [PATCH v3 2/4] boot/uboot.mk: new zynqmp pmufw
 embeddedsw option
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

The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW option will enable u-boot to
use the xilinx-embeddedsw package for building a pmufw.elf that gets included
in the generated boot.bin.

If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW option is enabled, then the
BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw from a
custom location will be ignored.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- edited Config.in help text to fit within 70 characters
V2->V3:
- added BR2_TARGET_UBOOT_ZYNQMP_PMUFW_CUSTOM as a choice option
- improved menuconfig help text for the varous pmufw options
---
 boot/uboot/Config.in | 44 ++++++++++++++++++++++++++++++++++++++------
 boot/uboot/uboot.mk  |  5 ++++-
 2 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index b6ac2f9380..13d45140eb 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -572,23 +572,55 @@ config BR2_TARGET_UBOOT_ZYNQMP
 
 if BR2_TARGET_UBOOT_ZYNQMP
 
-config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
-	bool "xilinx-prebuilt pmufw.elf"
+choice
+	prompt "PMUFW origin"
+	default BR2_TARGET_UBOOT_ZYNQMP_PMUFW_CUSTOM
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	help
+	  Choose between the following options:
+	  1) Build from source via xilinx-embeddedsw
+	  2) Official prebuilt via xilinx-prebuilt
+	  3) Prebuilt from custom location
+
+	  U-Boot build process will generate a boot.bin (to be loaded
+	  by the ZynqMP boot ROM) containing both the U-Boot SPL and
+	  the PMU firmware in the Xilinx-specific boot format.
+
+config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW
+	bool "Build from source via xilinx-embeddedsw"
+	depends on BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
+	help
+	  Use xilinx-embeddedsw boot package for building
+	  zynqmp pmufw.elf from
+	    https://github.com/Xilinx/embeddedsw repo.
+
+comment "To build from source, xilinx-embeddedsw needs to be enabled with zynqmp_pmufw option."
+	depends on !BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
+
+config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
+	bool "Prebuilt via xilinx-prebuilt"
 	depends on BR2_TARGET_XILINX_PREBUILT_ZYNQMP || BR2_TARGET_XILINX_PREBUILT_KRIA
 	help
 	  Use xilinx-prebuilt boot package for downloading prebuilt
 	  zynqmp pmufw.elf from
 	    https://github.com/Xilinx/soc-prebuilt-firmware repo.
 
-	  U-Boot build process will generate a boot.bin (to be loaded by
-	  by the ZynqMP boot ROM) containing both the U-Boot SPL and the
-	  PMU firmware in the Xilinx-specific boot format.
+comment "To use official prebuilt, xilinx-prebuilt needs to be enabled with zynqmp or kria option."
+	depends on !BR2_TARGET_XILINX_PREBUILT_KRIA
+	depends on !BR2_TARGET_XILINX_PREBUILT_ZYNQMP
+
+config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_CUSTOM
+	bool "Prebuilt from custom location"
+	help
+	  Location of a PMU firmware binary defined by:
+	  BR2_TARGET_UBOOT_ZYNQMP_PMUFW
+
+endchoice # PMUFW origin
 
 config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
 	string "Custom PMU firmware location"
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
-	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
+	depends on BR2_TARGET_UBOOT_ZYNQMP_PMUFW_CUSTOM
 	help
 	  Location of a PMU firmware binary.
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index b3094029e7..cb745413e4 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -453,7 +453,10 @@ endef
 
 ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
 
-ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT),y)
+ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW),y)
+UBOOT_DEPENDENCIES += xilinx-embeddedsw
+UBOOT_ZYNQMP_PMUFW_PATH = $(BINARIES_DIR)/pmufw.elf
+else ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT),y)
 UBOOT_DEPENDENCIES += xilinx-prebuilt
 UBOOT_ZYNQMP_PMUFW_PATH = $(BINARIES_DIR)/pmufw.elf
 else
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
