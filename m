Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020DAE77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 06:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2D0D8137C;
	Tue,  7 Jan 2025 06:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dd29paORTrvX; Tue,  7 Jan 2025 06:32:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B97681304
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B97681304;
	Tue,  7 Jan 2025 06:32:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E5D67AA
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB1D4404C7
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZi_VuQAvYkJ for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 06:32:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2408::607;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ACD36404B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACD36404B0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::607])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACD36404B0
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:32:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOxhadtUTL38Wn1ksQfeOtL/x1eyKPjuPKv8i23RijJH8aniVFdhiX0fgwGXO7MR/cKQNHniWr/U1vqPNVLFEtBOYHp1erHSCDnYxy1rm+L/X4M2r+AqawhwRlbc7d310uks2tiu0rG/XybNEhnLRMwFHgWIPIVTtBW41B/ZNGzZGts8Ln+Bm8kHWRPwApbWmj30CL5frb8TKrv+CSX6Bv0d9hYdv4m+mmwS2MLxBnghUQ3GhxCpEylMydvINmgIS+QNgqQB87/NnadWniOSnLXcOiRkYnE4DHpyZShGIu2DlGeaCas2DFNeWkmF4EgZ7sXcNwSe/rKss7Do42yZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VhFu9rSLdJac9bQoHeEPx01R7DI2vfdH+jSonecvwI=;
 b=C+gJv1rGcicfdRZvFMDuf8zxtc1Ls+rGkPRUfjykUWCcKc2CxSfb0OrwKs2xMLZVojYNocMc3YvuFjJuyrvIaTSZSA0Tp0wt1V+yDnv5zVuLuOd59eJm8CFTpLbMLv5tJ2rqFr1vYq150avL5BiRNj3rLczEHd4DdqEk2ayEUeKbu3PlG9bKAdMJz+qN4+9YM+0NCETIRtbrpwj13/mkzJ/pO2brddijAbVyQ/qjrgoJiYzOY/uAQun7hI1/X67ACGd1zIY9s75lobAHFXBaxLJT4D0Ym9gILqQWaoMaIRQo3EZuRICpWRyIdF5DjS4BJzD85MebNEh9NeQjg6xc5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0184.namprd03.prod.outlook.com (2603:10b6:a03:2ef::9)
 by CYYPR12MB8702.namprd12.prod.outlook.com (2603:10b6:930:c8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 06:31:52 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::2a) by SJ0PR03CA0184.outlook.office365.com
 (2603:10b6:a03:2ef::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.13 via Frontend Transport; Tue,
 7 Jan 2025 06:31:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 06:31:50 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 00:31:49 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 00:31:49 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 7 Jan 2025 00:31:48 -0600
To: <buildroot@buildroot.org>
Date: Tue, 7 Jan 2025 06:31:35 +0000
Message-ID: <20250107063136.787314-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107063136.787314-1-neal.frager@amd.com>
References: <20250107063136.787314-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|CYYPR12MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: e53fb018-ecfa-4237-538d-08dd2ee4f80c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N++D1s3UXAn3SWElu2PKRm3qBuO7COm+tyN7Dxm5SFmvR8ejD5bwizlOfxPS?=
 =?us-ascii?Q?j9NVusgfg0hSeAiGrdLsdgds2MviRZbWFOu7sss3P9KgLMEx6Pavji1UhLMx?=
 =?us-ascii?Q?Z7VVase+y8UvFLSH5oz9SOkw5LbpzR+bXmHON829qFxn/qx1e9awmke94ceh?=
 =?us-ascii?Q?xSbJDehL5oyakSlAsWhnE2d5oyr/yzWVRDOrgXbI9VfRLDlqsEswPALe+CF2?=
 =?us-ascii?Q?cKkSePPRJPaZsEw6yIkON2RdIYKgJVZkwXB/zdNEZvYmGKxPycBBVUG4IJ3S?=
 =?us-ascii?Q?9CpRYNrecIe1UShM0RMsomgP6o32O0hsKoR0AYQS41nU0RyHb9zYuydmhF+y?=
 =?us-ascii?Q?R9sZhOIkCAsoZBjdCBABM/kY8CBi9vhZJd44z8LXw2CEWKq2ksF5+5y4Jp8z?=
 =?us-ascii?Q?XYYoD6UH0qcZgl36g1YwCy1qynOvnZTZgoZveSFMiEWdtaWzxNepN6Apdk6U?=
 =?us-ascii?Q?SB+jbIQLlBjQOvN1Mt2oIIGuxGMcYldjpEGJMcdz8wl2U0DKPAFQJlqfyvWG?=
 =?us-ascii?Q?G+pmq/pnJu6MXEQFtTeDmwBXA8gVpjR3SOcHWJ+2tGq0q7kZaKhLK4WscvMW?=
 =?us-ascii?Q?21LiU7Xga955gY5fNXc/p6X53gK12zeR3z7tPHfHm2VHWVAOyE5A6gnGEmw7?=
 =?us-ascii?Q?yHdX91ceZj7wfgkoQFwtlqcil38rJCc+9/m3JOjpAJg0pJsIZGWKlpIkUU9L?=
 =?us-ascii?Q?DRe3uvUYZyAyUVYhG1tdoSOKC1MdyFNkXf/ZGdzMZkd6fbiR2CIrzINX6Wv1?=
 =?us-ascii?Q?y9e9qE34pYk97OeDsBA9P56HKgJc9VgIewVb1vg1TgRV4HDMKiWakiVGZBh2?=
 =?us-ascii?Q?lkSM2kLl71DNpvPszAgQIY/pwt/ktcy2DAhhZPRQmx6JMvpjsV3eeZtso01Z?=
 =?us-ascii?Q?kUU6rOyV5Khx2kaf+j9AY9Bdd7VUHOwjOsKo9j1W/TZZicYWjmH65G4173Pe?=
 =?us-ascii?Q?/2NL/JloAR/rbQ7S54FXEM8DTXnjs/WePvvptxvD7+H8+eQbEo3TVn6jHweI?=
 =?us-ascii?Q?yUChGCxxweq3/BeA+ZHQrXrqRPwas5s1bRP7IKZImGc+pDoeHfunQtkyMWtJ?=
 =?us-ascii?Q?sTLRhVGckgM501vjsopH2urTvf1jGV0KxCzR6Hw3UdMIZPKx33rvZdepjWrA?=
 =?us-ascii?Q?wAnLrQbDegn413mlc4SftC9tRTyzjuzZOjTjH34wJy2Ian7bSlJr77ghfQfN?=
 =?us-ascii?Q?GSJU6HidauqzO4B6TdAdZaK+XD1oOOhYiAh0cKsE04g6nzE34lpw82yLWhxC?=
 =?us-ascii?Q?7j7ZMp0Wgsv90p8wGSet2whrKe9PEYtzYewQEsM3YKVrmlxnlBaNO2yzkEKI?=
 =?us-ascii?Q?Lg9Pr4LLAIQyEvHrryy3PiPCVQXGjL5sjZPdKuCaezIyB5FHlQ79Th9HEYoW?=
 =?us-ascii?Q?oy6ty4hKrA/jVzKbeOLY1Kr5hUeXvpY2c+JNvL0PmjgLG5BEZqcl1kbZbOzi?=
 =?us-ascii?Q?ci2Zt/EbEl9f6xmShGA/OVceASgtsXGduvb3SmqjbRqCIXFXYLIhVQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 06:31:50.3894 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e53fb018-ecfa-4237-538d-08dd2ee4f80c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8702
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VhFu9rSLdJac9bQoHeEPx01R7DI2vfdH+jSonecvwI=;
 b=hvEdi2vFxHUniakv3nfQqCDhSUIdvqiBceAfV17WTFq8Ya2xoU1/G1J/QGMj7DSu3CQhT9Jt58yAkXiq5hqZt3Bo3TQ2Bvx7q+ArveMDCJPQ9AmPU671A7gWa/2JJj1MUdTndB0HRX9hNwazZ/E66QUlxDmV3qg2ymBoPNqLLfM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=hvEdi2vF
Subject: [Buildroot] [PATCH v4 5/6] board/zynqmp: add new qspi.bin binary to
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com
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
index 789bf21964..df8d956679 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -33,6 +33,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 577f4afb1d..45ef8c1e3d 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -33,6 +33,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 34e536750c..8256947fd6 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -33,6 +33,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index fb553c1b02..ec0243e957 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -32,6 +32,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 42b585b5a7..5066e1bfcb 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -32,6 +32,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 271c54a0ba..626dc7836c 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -32,6 +32,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
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
