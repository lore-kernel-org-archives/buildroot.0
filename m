Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AD6C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 22:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C33681BCB;
	Sat, 25 Jan 2025 22:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLzlYVeoxMF7; Sat, 25 Jan 2025 22:50:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59E0A81E56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59E0A81E56;
	Sat, 25 Jan 2025 22:50:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8347694A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C17C4003A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytslxHfhhSRt for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 22:49:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::611;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BC446409A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC446409A7
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::611])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC446409A7
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:49:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eAUoBdjta9J6Xu9IhTqPuMj+UegcQFrlyxifaNgh0LUFs3sfI66HXIxWJWk76zITA8jvP+IPntZL9P/By5LGtRlT6y+oSbN5ZsUb4VDPOgh5uDfgoxLE3UHbIcHIupXkq0KtKoAvDySHoqE1gptLoSaTyLhMLA8z7i5W1R699CaYo/a47sLcfenQcTISw51MXCovBdmR03vK/QuHOe4vBaw9kd5Yvoc6tBROuTAake0mvKoGSADp/ACiGGCCTa32kZfX6DbkVU9vzik7BD7uvVSqI6OkloEKzNcMWIKzpaCYPYbOrGyATOMlghh0mLXIVMU5mdkExltbbXoobsHjbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kch6ga633mapueMlY0YTha/zWIkV3gliv7krsxl5wSw=;
 b=hgbUmjm74GvqsA+JE8QPVOqR8XBhGgrP5jiiAol/uuuHfaN9H+Mu0IAtupLfVnbmNKjzd8Wb71G+uK2YUoOFrO5nzVto6xBhPBWNEAE8QtOeVQKgWyXiuHW2AK0uFkrgalA0t0HiBOMJYUbIQ0sR5UojGBduNoX+FqArnaTtoQfx1whwmCs4XHGnHlxTXZuzAQMpn0uNGlT+Og9Q8p50UoomcFHmAR6gyYbFw3tQTOQN+7max2IlBU8Li35iNYDO51kBdO44cNxbKTnz8DXgLb+6zDHHlOn+0VP8lLOU0Rwfc5bmViKxBOp8M1GUSUNEgM2nlXs6DcTn82Ujh9x5mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0119.namprd03.prod.outlook.com (2603:10b6:408:fd::34)
 by MW4PR12MB7191.namprd12.prod.outlook.com (2603:10b6:303:22d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Sat, 25 Jan
 2025 22:49:47 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::93) by BN9PR03CA0119.outlook.office365.com
 (2603:10b6:408:fd::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Sat,
 25 Jan 2025 22:49:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Sat, 25 Jan 2025 22:49:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 25 Jan
 2025 16:49:45 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 25 Jan 2025 16:49:44 -0600
From: Neal Frager <neal.frager@amd.com>
To: <buildroot@buildroot.org>
Date: Sat, 25 Jan 2025 22:49:29 +0000
Message-ID: <20250125224930.3639111-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250125224930.3639111-1-neal.frager@amd.com>
References: <20250125224930.3639111-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|MW4PR12MB7191:EE_
X-MS-Office365-Filtering-Correlation-Id: d6fcc75e-4326-45ad-fc44-08dd3d929105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hJXjxpAhtzRZm3kMTKGgXvSjtoDUKq2RQl3f+QmRzdEaSiCwlOFMsQrx30/n?=
 =?us-ascii?Q?FSHIYBmkbYQUNYpJKuoaAu1+8+wC/6RxG5vaY5wQfG4v5aGO8NVBqleO1DtZ?=
 =?us-ascii?Q?PAX9foO3+p2sSZyLDuyirC1yYy6yZgFmqOLi69VoQGFvDR5mpFPW0iCcGX+p?=
 =?us-ascii?Q?hoBJTJcXWM0EBqcxLQbZg7sMkxrEBfoN3crVSHr8js4nUFIZCe48ChQmA7ku?=
 =?us-ascii?Q?xWDKmDCQtbTma699veE+3VBjnvjD4QinzbND8K1caHwODx625wOoZbye/BFG?=
 =?us-ascii?Q?3GYwxdQag0c8MP1qh4R3W1zByxNDIqm2mhB7yCFKWq9OZ8jGtdlrukeVN1aM?=
 =?us-ascii?Q?2bN+b+8vtf7vln3H40opDUdX8mPx/Add82eXeykDhTSp1CxvBe90GvytJuP2?=
 =?us-ascii?Q?bTZWVv3vo1YZPVjUT3n6JLIxnRIDLrg5GdQ7wuTBW/qW+cCHvIArojCpw9sN?=
 =?us-ascii?Q?W32Ugc8/ddGqeiELY81dYaYr5sPjhRj+C2Gd07iCy95dQQLiUV1lr6e49O7T?=
 =?us-ascii?Q?MZUENna2+KTGCZSC0FO6LRdl4BZnFvUYA94ZtHRy6KNsLg6qhH+EdhjGBwHi?=
 =?us-ascii?Q?bFpO3c3I5TLFLFIKJeTO+PsPoyPYA7k6Tumg9BR9Dt6wcbSco/1CbVJuFjJb?=
 =?us-ascii?Q?kf9cmgFzGLua8I5VV9nzAYlyuqSD0eVjXL+GkqQ8s7Gtb7gQm6UVlNozm3Ka?=
 =?us-ascii?Q?lfqVSOJ3Urh+5iMC1cIKTQvr/hI+QYsHEphHqTGx7Iez+INiJLWprjwNMpYq?=
 =?us-ascii?Q?9RiDU5P24BkTcWC0SJjdYtSFJLIdQSxwi+2rPiLLGSMiLpp4Ey2Qe2/iebRP?=
 =?us-ascii?Q?XsonhWSOcT3zHJDK6jGeQ6NTLUtjCbFWboBV7wZPcVnvoVBwB+j8v5FABbYw?=
 =?us-ascii?Q?SbwUzyrbvci1Haa4kKivh3cE95/FmbpYBatG62JoUjg/ywmsrbUYU2mxrQ3R?=
 =?us-ascii?Q?cfnqjiUxpGfY8FUyBvl4nkuqmlMTR0tYLx+BAt83GBC/noQ3J+ReV4xgZsy3?=
 =?us-ascii?Q?hfLQHjRufyeCuMxV8/fmUN/Ymd5jFKW4RyYG37qRH1aG7nHeKHUrZwIawHKb?=
 =?us-ascii?Q?8d2JNIRZTXgPEE9G7RhSrZivhjF5u2323OkAj+74FOIjfhIwqzmADnpUtz8W?=
 =?us-ascii?Q?+T00DMnBXKbQcN7qRrkaV9TY4ob6jJcpoJvs4l0aC2/VPaJN5ih234VY9Owi?=
 =?us-ascii?Q?h9HB3f/jOwUbjY0Opez+cfPTPeTC845wcoPZqywJalk4PA/soeNU4cmFXH3M?=
 =?us-ascii?Q?/KY6PuiArR1XvDGzyWVLsVG2cAbrTKIN9AKuIk5loYlLP2ZsLE/a5EQ1FTD0?=
 =?us-ascii?Q?ayHwUrPdIs4ysSKxAG1tClEnWqIk0UfTpvwNh38QdJEYPFPLZtMU3R863Kx7?=
 =?us-ascii?Q?Z7LW2fm8m6g6vtfUMV0fM8UCWVyOoLnHoyFbepOLJOHuAHVGvgBHchpV2J2c?=
 =?us-ascii?Q?fhpsMUPQMDP0YFdWVZmEnt7lVUYWEB08uHw2KstIrVCiSwEmbFSQeQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2025 22:49:46.3461 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fcc75e-4326-45ad-fc44-08dd3d929105
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7191
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kch6ga633mapueMlY0YTha/zWIkV3gliv7krsxl5wSw=;
 b=C6yjFxYxIF5bztG2eOEW2WORlJbT2bNBacqh96nLXth1h9DnXOwiOBMX47xv2hp/Ivn+bHVhDDSa1vCHj0LfUPbk8LjbWeKYxueR0w5sjsg3Vwvf4Nb40R5o+lx/o9zKVeKew3COstvE0VvhZ5mrVzgqfBjx0kifci8Gxm/YFJE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=C6yjFxYx
Subject: [Buildroot] [PATCH v6 5/6] board/zynqmp: add new qspi.bin binary to
 images
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds the new qspi.bin file to the zynqmp sdcard.img.

For SD card booting, the qspi.bin file is unnecessary and can just be ignored.
For QSPI booting, only the qspi.bin file needs to be written to the flash.

This patch enables the Kria BIRT tool for Kria SOM reflashing using qspi.bin
as either "ImageA" or "ImageB".

Kria BIRT (Boot Image Recovery Tool):
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+SOMs+Starter+Kits#Boot-FW-Update-Process

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - new to patch series
V2->V3:
 - corrected commit message to use BIRT instead of SBIRT
V3->V4:
 - changed config to BR2_TARGET_UBOOT_FORMAT_QSPI_BIN
V4->V6:
 - no changes
---
 board/zynqmp/genimage.cfg           | 1 +
 configs/zynqmp_kria_kd240_defconfig | 1 +
 configs/zynqmp_kria_kr260_defconfig | 1 +
 configs/zynqmp_kria_kv260_defconfig | 1 +
 configs/zynqmp_zcu102_defconfig     | 1 +
 configs/zynqmp_zcu104_defconfig     | 1 +
 configs/zynqmp_zcu106_defconfig     | 1 +
 7 files changed, 7 insertions(+)

diff --git a/board/zynqmp/genimage.cfg b/board/zynqmp/genimage.cfg
index 20d8352c08..0a6aea7a29 100644
--- a/board/zynqmp/genimage.cfg
+++ b/board/zynqmp/genimage.cfg
@@ -3,6 +3,7 @@ image boot.vfat {
 		files = {
 			"boot.bin",
 			"u-boot.itb",
+			"qspi.bin",
 			"system.dtb",
 			"Image"
 		}
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 139ad7157e..85ef7d5aa2 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -35,6 +35,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 700b378bd2..c5cfe2fe86 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -35,6 +35,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 4dd0226c33..288606fc02 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -35,6 +35,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 2a316958f2..1e453adeb0 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -34,6 +34,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 4574898d72..13ee5ff5dc 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -34,6 +34,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index d6e2617552..2669afe1f6 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -34,6 +34,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
