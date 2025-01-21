Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625CBC02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 10:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30329606E7;
	Tue, 21 Jan 2025 10:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pbUSagwiINC1; Tue, 21 Jan 2025 10:22:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BC4B612CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BC4B612CB;
	Tue, 21 Jan 2025 10:22:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25637959
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 10:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05F0842657
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 10:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqy7VYhMBTx2 for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 10:22:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::628;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F90E42655
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F90E42655
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::628])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F90E42655
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 10:22:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/1EFiht5S89MK5HNKAscwD4FrFgCvA679pMATCJ/8PK457y5nPYWhBlefnh2u17ZSEMEg2CXOPS+DawVVp+nQRQ5Ebc/X/s4h4MzRCc0yYjFAbS5fVxIzcketSscLtgBMktppgfL1noJGUMZIIXeL2ySfaOhJybHGnq4G6PhpMrMcNQeoueiXkuI5dHWywiUwyqRi6ft0wj7btN/cZv5zJrTqxZHMWvCJAVE+hI0FZHFVAZE5XvY5x0ZT50U92RXk+ZWYwqW+4cIFPVXogflBChKfa6LqW1DgcufhpCsxaFrKNlw4MopspjiLkqOaPASAf2fxf0IzQ5MPoQ5XNgXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVyvj6RN9zLeOrPsm9fV8iCm9Gxq08uqXZpBzzwPGXY=;
 b=pwpLj/iQJwaWV8MoVHLIUJ1mJkrEdAjKgPmQAe2b6og53TLmie9uDDCbf4p5ytcWITtDGlLbbJ199ijcXvoXyqiji71ymXgK+JpAZTK7sbgvJw0CqH7miFyEkqjzeCVugtIj7ua/egiG/vW90wqE2FEhgdsCMCmhwYn3rb3yOU7xRfM+1Je7crD7X/Ft/pG9hnBbsgBY9YlolKcNqGO4A8XaRJ7MOMBeNSaw/WNFIRwmrGShgYaYCxw7+MRsCtnqOovsiLBF+9p0eJY0AaIpHGbmAZmgOjJi5Sfbzmmt2Hmxv+e1qPnd00DFpjldetfqfTe0S6DKxpK4of801Qgohw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR08CA0028.namprd08.prod.outlook.com (2603:10b6:a03:100::41)
 by SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 10:22:32 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:100:cafe::3d) by BYAPR08CA0028.outlook.office365.com
 (2603:10b6:a03:100::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.20 via Frontend Transport; Tue,
 21 Jan 2025 10:22:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Tue, 21 Jan 2025 10:22:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 Jan
 2025 04:22:31 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 Jan
 2025 04:22:30 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 21 Jan 2025 04:22:29 -0600
To: <buildroot@buildroot.org>
Date: Tue, 21 Jan 2025 10:22:21 +0000
Message-ID: <20250121102222.1335874-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250121102222.1335874-1-neal.frager@amd.com>
References: <20250121102222.1335874-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|SJ1PR12MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: 88821990-a81f-4315-b607-08dd3a0583f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XwOVGYnAR+qZhIQXrL8MXJ78KeiM7UPpa3JwSKxHgaEbRTb457LJfv76QqdB?=
 =?us-ascii?Q?4u+YmCO2MF5UkEPKbEKZWSLiQnBs7ZN4Au3A3BpqWI3hYFFsRv/giUB3r3l+?=
 =?us-ascii?Q?upb6cyLzdygz3y5msD8hMkMI1HKvKxyhFx8TYcro7tgw9udSqzoK8dx/Je+q?=
 =?us-ascii?Q?y7roJlrf+1feR+4/E+6hxIVwO4b0SlCqMImTR/ulqFkGiiDTYBXo7ACJsEY0?=
 =?us-ascii?Q?KFmnQhLdasGY1iBjPRatCGLoukd2erlYWV+++7GqY4KEgG+UGx62vGeRnSuE?=
 =?us-ascii?Q?tjQVfFwLECLT0tdRF+1pnQKO4H7F2OQfBr10292ziQSZVsfFGMhwb/CRgqPf?=
 =?us-ascii?Q?t3zUIq3xetdi9jPX5gwAZ7uFgXT7FNwf6bS992I+i9Gwsr460jcdMXk0QttD?=
 =?us-ascii?Q?Lm8SuZ7LAQT/k3KD0JXkPCH7jFz1j9CpsYdlkSkYExvOYmbF66Z6ekuEHBcn?=
 =?us-ascii?Q?5FHm0acTd57IcXPRFhYNf/1le10Q7Wp/qxyFSQFRcW1QgSrcjlJaAl2ujUaT?=
 =?us-ascii?Q?7KUfOlk7AuwRDlsx3OKIdWzvpirWPJbt+IAIV1YV9AzPPZd5vuwqzVUukmRa?=
 =?us-ascii?Q?riY6XfIFi2F3F4VXWyuG/NNGQFq0kAzCreQHDl/sqIjcLuago3WDKm1bnfB+?=
 =?us-ascii?Q?YTIZ/Cu7z7Y2ezmGuBY6FgzSfr6stAfv9HBDschre/T4WAhgh+td2k5Z7byB?=
 =?us-ascii?Q?cthcNAz6HSq9K4PMvQNmcziTLv+UFYVk3g1ZAnXAtH21iBrHrpDeyNWm52e0?=
 =?us-ascii?Q?HEykFXO6w2hRdx2/cjPe4LucVJ3KYCPqpXuohajotE+CliK63CRrk/fGRR+G?=
 =?us-ascii?Q?H9qLR0U5ljxOHYO5HZmejduT6DyMVsGoCj8ef1DDViFU2J5SLOntil7PbWZl?=
 =?us-ascii?Q?VuYspLptcewj5Jq91PZBCaeTAFwYRIqIFla7PS5fcmFKxDxYyDBRa+EWVYoj?=
 =?us-ascii?Q?ZCN09tRdfcnMCeHyyoew4gwXmxD4oCW8BE/bP+Jyl+cL3IqBW/7hvrrdSypw?=
 =?us-ascii?Q?JrfxuCcwYKDcXLIXdBVydAmi+HG1wjTcMtHu4tbIX/tyujiZGib1BFGvXEuA?=
 =?us-ascii?Q?FwFkGzb1B+OD6cfwAAWrG5g631yf6+8ONsVnHY4j5zvSeW/nw3castNXie4B?=
 =?us-ascii?Q?7rFPUYbMEEV+GEDOzLCWaUxwL8cDRgLlXL5Se1Fft8ebjMUTjBTB1O99W/+q?=
 =?us-ascii?Q?twpXhmpi7acnS2+nyeFQR+rKdRH45gdQ+YlZLo0VqNroRFJHOgkgOXZOu7Dy?=
 =?us-ascii?Q?FfegQjdismt8Mjh7hbmCO3lVrRhe52AsEGqSK2cC3O/wlkwxIu/efpDMA7wm?=
 =?us-ascii?Q?wE/WTuiaOEVLRf5ofjR0IZZXIP/YuOco/uPOvcMgDf+5U2vg6Gd81TS7kz/z?=
 =?us-ascii?Q?98jiYD2rGfgVXFHs+WeUcUp6BZy85IOsuNVasC7a8gavQOu0qyfl0T+bZ8rg?=
 =?us-ascii?Q?TlUhyMMzkQv0gYmm/O8h1WaZj47KYeMH8Two+/a6SvClPonYX+1Dr0MV9Mqs?=
 =?us-ascii?Q?vPe7KA6SGg+l48gb/d6aEhHiOioeHs0+OwND?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 10:22:31.8016 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88821990-a81f-4315-b607-08dd3a0583f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6339
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVyvj6RN9zLeOrPsm9fV8iCm9Gxq08uqXZpBzzwPGXY=;
 b=lDuWEmRQzx/vKpGI67Irwbs13LbNdj26gzOPkHOg+7Ll5Anxdw8fxWUGQFph2l8WJvIOcjI+4XG3cTKcfcZ/v/hFvoJNaaXxSbiXVvUoCsMdDMaisDW5xYqi4UsF6oYwbp75ltxF9fw3cgwWihMT24wS0RQ67rc2Y31m1DceHXc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=lDuWEmRQ
Subject: [Buildroot] [PATCH v3 3/4] configs/zynqmp_*: migrate to
 xilinx-embeddedsw
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

Migrate zynqmp defconfigs to xilinx-embeddedsw package for building
zynqmp pmufw.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- use new BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS
  config for zynqmp_kria defconfigs
V2->V3:
- add BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW config since it is no longer
  the default
---
 configs/zynqmp_kria_kd240_defconfig | 10 ++++++----
 configs/zynqmp_kria_kr260_defconfig |  9 ++++++---
 configs/zynqmp_kria_kv260_defconfig | 10 ++++++----
 configs/zynqmp_zcu102_defconfig     |  8 +++++---
 configs/zynqmp_zcu104_defconfig     |  9 +++++----
 configs/zynqmp_zcu106_defconfig     |  9 +++++----
 6 files changed, 33 insertions(+), 22 deletions(-)

diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 38a5aa378a..6a6ed87dff 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kd240/kd240.sh"
@@ -35,12 +37,12 @@ BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kd240/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k24-revA"
-BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_KRIA=y
-BR2_TARGET_XILINX_PREBUILT_BOARD="kd240"
+BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS="-DK24_SOM"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index a5d308a4d5..e679010d8a 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kr260/kr260.sh"
@@ -35,11 +37,12 @@ BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kr260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
-BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_KRIA=y
+BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS="-DK26_SOM"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 711f43c3a6..353ec165d3 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kv260/kv260.sh"
@@ -35,12 +37,12 @@ BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
-BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_KRIA=y
-BR2_TARGET_XILINX_PREBUILT_BOARD="kv260"
+BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS="-DK26_SOM"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 849f5bd811..5be8947ba3 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
@@ -34,11 +36,11 @@ BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
-BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
+BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index c52bac1462..64d177b8d1 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
@@ -34,12 +36,11 @@ BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu104/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu104-revC"
-BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
-BR2_TARGET_XILINX_PREBUILT_BOARD="zcu104"
+BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 2f3edf7972..6fa078a84f 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
@@ -34,12 +36,11 @@ BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
-BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
-BR2_TARGET_XILINX_PREBUILT_BOARD="zcu106"
+BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
