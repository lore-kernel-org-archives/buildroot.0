Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC2CE77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 06:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A613803C8;
	Tue,  7 Jan 2025 06:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L1t5RtquNq2M; Tue,  7 Jan 2025 06:32:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E0BB80D18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E0BB80D18;
	Tue,  7 Jan 2025 06:32:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1754F7AA
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C24D40295
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwxiYXPn0Shi for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 06:32:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::617;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3AE40404AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AE40404AC
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::617])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AE40404AC
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:31:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0WGADTRaYzCoFMWWG39PsfnlZZre2Iy9+ozJC3d2vX25OXvV3q8go8i/2da2q9n8hD5kN1nApxWGnYp5PNz33e2qpKQB9JXRY27VJvaXyPoJ9xEAcfSSEyQdGuPEOegyfzWLNFEupJXn4vgWBHcj9/6ctgfLNqw8uyBmIfh1XPeXuBnMH8GzcOMp6ckjhuqb3O8t1cXrAhAN0uv2Dw8t2bgQHuU+p/Pqv18plNUOBlIo5SnoCMsi8o3rjk6V0IrjlAwESIn2k5AU+fYnh5dzUHhn6tWxld9mzXvXc3z2Pxyg8vBNqBJ3s5OS8x2C+hV715avd6FCNH+0zKMwZ7ZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9k9tQYR9i4AFS1mRS5uytbSS3GmginlPKbZoLfx2VM=;
 b=qYYtbw5ySmGHDa4HBMrr2bZWVrHYqpzxdyoyOYm+rIbDwinR+W8TRP/t/abZt80j0a0vLrC7CQ5tLsY3jJFZLhrhsNQdGnsWwRd0ZWlG02y02F98kJh0/UlEgDR3aEK2MGQHqSM491ZE226++11ZnwtGvdy8IJY0ZrTUP/aqBr9EjUgcoueMKwAqy3F/g78BKmbrAyc9PH/LD/7oun9CVrBnesFifW4tHBkJlnc/Cr0AVsYkQyGo0KJVcLViCku/hDbjxXF9leLLVoNRRj6VtBzCqnSDC1SXikccqUfxb6wbCESVRJeUTnU5PdCl2CBPByi1wCBpnJtOIY4qq3/YlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW3PR05CA0024.namprd05.prod.outlook.com (2603:10b6:303:2b::29)
 by DS0PR12MB8344.namprd12.prod.outlook.com (2603:10b6:8:fe::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.17; Tue, 7 Jan 2025 06:31:50 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::8a) by MW3PR05CA0024.outlook.office365.com
 (2603:10b6:303:2b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.10 via Frontend Transport; Tue,
 7 Jan 2025 06:31:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 06:31:48 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 00:31:47 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 00:31:46 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 7 Jan 2025 00:31:45 -0600
To: <buildroot@buildroot.org>
Date: Tue, 7 Jan 2025 06:31:34 +0000
Message-ID: <20250107063136.787314-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107063136.787314-1-neal.frager@amd.com>
References: <20250107063136.787314-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|DS0PR12MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: 55d767f0-0c4d-486a-19f1-08dd2ee4f6a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9qCUBj+d1e5sJd/JQjKSCywFvAaES00+Zj+TqdFPS/9iSWY5dvqRjbU/SfDw?=
 =?us-ascii?Q?gHbQVmJ1tFaBB7EtV53In56nT+4OZJq2BSlMzhg8FqjJmO6L3Gb3E72eS/Vc?=
 =?us-ascii?Q?9L9B32QVt8Pbm+WbtWbJMBmv/rGV7TsNUqGi0aDjDtCNl+t0rode/2lCTqfS?=
 =?us-ascii?Q?w9YTmQHNtOEqtLnNcD2YgwiWseeuozYOgmh8DCd+vn3sPvGniBb9k1u+a2J8?=
 =?us-ascii?Q?1CoNzJx3AlA1lDl+o38SJIkvRtTKiJWI0B4fFpBTDWDM6Z6aUsEYmT1+bPTZ?=
 =?us-ascii?Q?z3eSAjAs/oP1PecUKe3od1uXhDGGx0/s5ElgrTMDE/tVbhAnW1OFT4Cr21Uy?=
 =?us-ascii?Q?D7BbO19jUhD//QmoT0xjTH7nxUtbzOUe/aPoYyySp0Jzgf6DkyDHKN+KHzn1?=
 =?us-ascii?Q?x48TssQjZUQmhikSfA5iMGCDqAvZLQBNNUTZGHq/WZ/IdEdZo63yLbT/nhC3?=
 =?us-ascii?Q?UwgT4D76NSKD3on3fqYaR8J/LXxZaZHD/Aa6rFOddQ+qRMAq4oFxRVcIueeO?=
 =?us-ascii?Q?c2qiAiaDEX3Y2GF7m4WElGZdN3VGD2vxm+XYNLHTjJfSeFL14yB9O0k6pHOZ?=
 =?us-ascii?Q?5cgu/XRWuSQH2zbnBpnwomy/GSWIuMqmG9Zv4aGI+nDG6nAWP+1IH5joXHWC?=
 =?us-ascii?Q?rd1kpV5srIWWkV0fTomJaXkeyO+mpuMcJX5cd+mfdpoON8DjldKkKZRGqP0M?=
 =?us-ascii?Q?LQc4uwOCgzA2DJvsmyhTvL6F2pwfBQCWs1K89qN7Wh82otZkP6/eVdrcINha?=
 =?us-ascii?Q?rKMbOXvQFKQa4vL0cqc/W0hjF76+pGOaGqaSqfh6UyTpsmlxEok6skb4XbM4?=
 =?us-ascii?Q?fyvulJwUHYARrn0og1S4IhsonfQacypHz/Cg2GIaX6/xBe0Ch1FshK8fYWhZ?=
 =?us-ascii?Q?q+RoTgmIQLUMwx311TR24y8w1rTsWxbne2K7onZaTFK9ifEjoifZVQUJHZI1?=
 =?us-ascii?Q?DQdorkQKzqeQ4v14Wizk6qrGAJrr3Jj8LZlyQxDfn2qGiHSPrZIQEi7OiZeq?=
 =?us-ascii?Q?0g2sTQCV8MRH4vfve7oahREVEdIEFDW+4XtGA+oCkwdssePDQVo35jpkeBxS?=
 =?us-ascii?Q?qTXP4W1G3+ki6uF2X7Jl4Ncob1tJOBTCAb4m/Dx2gDfXCiclI7mQ3zkl24QD?=
 =?us-ascii?Q?82ULrm5m1l4N/6tTsGoTg53zlx187uz9xCDL9OpDiCvWkFIgp1GIH8jvCoNg?=
 =?us-ascii?Q?rSTjnJWaJnRGppjBo5WDlejPm9YLErT7cSelo8d7bOYnac4FDi+ftdV6riij?=
 =?us-ascii?Q?UeRcR2YGaROo5bS8YTOgviFhzB1bUTqM9G1xa/cCKUwodgvv7JFY9rA70WqC?=
 =?us-ascii?Q?k5lBMeqyzN7/tZv2l2oH/dxcvqorxtv6DJqD3ekIDbxFAyVVVXE+1wuHmy40?=
 =?us-ascii?Q?iFLatXLBGvwqQpkymorpThWFqRxBX+cdZJRQJ4UQP5sLwWNMunrWmjVR4Qgm?=
 =?us-ascii?Q?1u5Ybh5Qe5cJWwtyn8UFFzOTPLron3DhoMbHYMgJh9dCsq/uCaily3f5fR0F?=
 =?us-ascii?Q?vNfefyvrDsBWIcjvUOL1TBM7ispITXTH8Pcp?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 06:31:48.0155 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d767f0-0c4d-486a-19f1-08dd2ee4f6a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8344
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9k9tQYR9i4AFS1mRS5uytbSS3GmginlPKbZoLfx2VM=;
 b=OJbA8OGRTYL6fCajLQii9ZCCt9AQ/8YZKgJYAmmXJyvpJCbijkzpuS7SF6nnZRPYUhOTAja6ASemVG4JBX8WdiYppy+2xNt4iXRERodBfnvfNPO3ijqvJBRWpW/R1Uskpj4hQh7ZMos8E4mK3WtBwCz9QkLOxCfJnUAtrNExP9s=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=OJbA8OGR
Subject: [Buildroot] [PATCH v4 4/6] configs/zynqmp_*: migrate to binman
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

This patch migrates the zynqmp defconfigs to binman applying the necessary
upstream uboot patches.

With binman, u-boot can now build the correct u-boot.itb files for kria
natively.  So the post-build fixup scripts are no longer needed and can
be removed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - new to patch series
V2->V3:
 - squashed patch that removes the kria post-build fixup scripts
V3->V4:
 - no changes
---
 board/zynqmp/kria/kd240/kd240.sh    | 16 ----------------
 board/zynqmp/kria/kr260/kr260.sh    | 16 ----------------
 board/zynqmp/kria/kv260/kv260.sh    | 16 ----------------
 configs/zynqmp_kria_kd240_defconfig |  7 ++++---
 configs/zynqmp_kria_kr260_defconfig |  7 ++++---
 configs/zynqmp_kria_kv260_defconfig |  7 ++++---
 configs/zynqmp_zcu102_defconfig     |  3 ++-
 configs/zynqmp_zcu104_defconfig     |  3 ++-
 configs/zynqmp_zcu106_defconfig     |  3 ++-
 9 files changed, 18 insertions(+), 60 deletions(-)
 delete mode 100755 board/zynqmp/kria/kd240/kd240.sh
 delete mode 100755 board/zynqmp/kria/kr260/kr260.sh
 delete mode 100755 board/zynqmp/kria/kv260/kv260.sh

diff --git a/board/zynqmp/kria/kd240/kd240.sh b/board/zynqmp/kria/kd240/kd240.sh
deleted file mode 100755
index 2203536a52..0000000000
--- a/board/zynqmp/kria/kd240/kd240.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-# This is a temporary work around for generating kd240 u-boot.itb.
-# The problem is there is no way to currently configure u-boot to apply
-# the carrier board dtb overlay during build, so all kd240 carrier board
-# drivers are missing.
-# This will be removed when u-boot can build the kd240 u-boot.itb natively.
-
-UBOOT_DIR="$4"
-
-fdtoverlay -o "${UBOOT_DIR}/fit-dtb.blob" \
-	   -i "${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k24-revA.dtb" \
-	   "${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kd-g-revA.dtbo"
-
-"${UBOOT_DIR}/tools/mkimage" -E -f "${UBOOT_DIR}/u-boot.its" \
-			     -B 0x8 "${BINARIES_DIR}/u-boot.itb"
diff --git a/board/zynqmp/kria/kr260/kr260.sh b/board/zynqmp/kria/kr260/kr260.sh
deleted file mode 100755
index ac49fa5ee4..0000000000
--- a/board/zynqmp/kria/kr260/kr260.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-# This is a temporary work around for generating kr260 u-boot.itb.
-# The problem is there is no way to currently configure u-boot to apply
-# the carrier board dtb overlay during build, so all kr260 carrier board
-# drivers are missing.
-# This will be removed when u-boot can build the kr260 u-boot.itb natively.
-
-UBOOT_DIR="$4"
-
-fdtoverlay -o "${UBOOT_DIR}/fit-dtb.blob" \
-	   -i "${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb" \
-	   "${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kr-g-revB.dtbo"
-
-"${UBOOT_DIR}/tools/mkimage" -E -f "${UBOOT_DIR}/u-boot.its" \
-			     -B 0x8 "${BINARIES_DIR}/u-boot.itb"
diff --git a/board/zynqmp/kria/kv260/kv260.sh b/board/zynqmp/kria/kv260/kv260.sh
deleted file mode 100755
index dc92c51d43..0000000000
--- a/board/zynqmp/kria/kv260/kv260.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-# This is a temporary work around for generating kv260 u-boot.itb.
-# The problem is there is no way to currently configure u-boot to apply
-# the carrier board dtb overlay during build, so all kv260 carrier board
-# drivers are missing.
-# This will be removed when u-boot can build the kv260 u-boot.itb natively.
-
-UBOOT_DIR="$4"
-
-fdtoverlay -o "${UBOOT_DIR}/fit-dtb.blob" \
-	   -i "${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb" \
-	   "${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo"
-
-"${UBOOT_DIR}/tools/mkimage" -E -f "${UBOOT_DIR}/u-boot.its" \
-			     -B 0x8 "${BINARIES_DIR}/u-boot.itb"
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 8e841df2e8..789bf21964 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -1,10 +1,10 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kd240/kd240.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
@@ -31,6 +31,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 809cdd0dde..577f4afb1d 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -1,10 +1,10 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kr260/kr260.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
@@ -31,6 +31,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 92d44c2b64..34e536750c 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -1,10 +1,10 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kv260/kv260.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2 ${UBOOT_DIR}"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
@@ -31,6 +31,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 1ad2a064fc..fb553c1b02 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
@@ -30,6 +30,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 4856c9b958..42b585b5a7 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
@@ -30,6 +30,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 4c5ac16f0c..271c54a0ba 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
@@ -30,6 +30,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
