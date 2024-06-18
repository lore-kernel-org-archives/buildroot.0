Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857EBC27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 07:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 577A1605EB;
	Tue, 18 Jun 2024 07:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gv4GonxCGMng; Tue, 18 Jun 2024 07:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E0B66122A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E0B66122A;
	Tue, 18 Jun 2024 07:49:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E04E1BF283
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 07:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7747C60B5B
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 07:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a4q5wBhVWxga for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 07:49:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f400:7e88::625;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 486B960B72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 486B960B72
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::625])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 486B960B72
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 07:49:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFAvtroZ4Yb+3Qei5HpVAYRbsYgJG6pIeRJvXUNyldE45wBQd+LIIoid03RmrdppghROAOFX1yvH51quRgADpz7/AfqWkZ4/cvayUCa+mRAsVpKT84SuiLyCQAO66NGoi6XWOu1sFTxQSfNsn0G49JO4vfISN7UN150dr083yGLOBh8yYMgaXCWERy9i99Hq+sEenGLw2NzIh6FbQS/VKAhCPUkeES4dwZ5Oe9lu3mRCNjnKG32R29xh9hQLcvL2e7Z4x9LRp6UVgLVqTD59IISz3DXmSwDyllQoFGqZW7jqWSjI5zwhOo+5Uc11CL7qTDLHIYjUbHFH+twM95ATXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nObobgDxxVHGWDxekjL7WLF57ecNmtdfuUkdrWsaJdA=;
 b=dsoK0KudNTgJC9MFv5vbOSMAEqjX6J2PUt0vS8Ta0fO8G4Qotcu/75LomjcRZuIrltHIHcF0QPIYREopCzv95k1qqCZvWOvLQIiUlOdWQdHYJdZi3fK1JcVD/eLMgqOBC2iVHLWfY58S5zRP96gY2PPJJSloAlHZLO3rDjtiKl1mEOnkVGzXj1mPJJYOtiaXRtl57PGcpzEXY1q7/VtFYqH3HoDeWHBMEontSCX3Ucd0YmueW5pq9lTy7lil7zHjj6YWFOuFGWT9kNMF/GImICQNY5LwfvjGu6lAdFxig2lRywkZms37aDTB7VkQZjL1CLelH7wWpuPO7A/kfVRQQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR04CA0366.namprd04.prod.outlook.com (2603:10b6:303:81::11)
 by SA1PR12MB8744.namprd12.prod.outlook.com (2603:10b6:806:38c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 07:49:35 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:303:81:cafe::f5) by MW4PR04CA0366.outlook.office365.com
 (2603:10b6:303:81::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31 via Frontend
 Transport; Tue, 18 Jun 2024 07:49:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Tue, 18 Jun 2024 07:49:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Jun
 2024 02:49:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Jun
 2024 02:49:32 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 18 Jun 2024 02:49:31 -0500
To: <buildroot@buildroot.org>
Date: Tue, 18 Jun 2024 08:49:22 +0100
Message-ID: <20240618074922.3555070-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618074922.3555070-1-neal.frager@amd.com>
References: <20240618074922.3555070-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|SA1PR12MB8744:EE_
X-MS-Office365-Filtering-Correlation-Id: 832e6760-9bd6-4d0a-ef84-08dc8f6b320c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|36860700010|376011|82310400023|1800799021|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JQI0HHrGN/lYP4IbGKNAtdBi9PL7Jijk39racc9hw5Xqb9GLeoT+ZbzEAOd4?=
 =?us-ascii?Q?Zvu/IlkKKvyIoNOT/ByTVdYT2oisahECvGIWlEtRNBcpHeeHeRXaofPcBoyM?=
 =?us-ascii?Q?5kDVdjGh+n5G03vzduSV1shvSyBSEk3KO2yqzOwp/o0Pa6X4HrGI6bmZngRN?=
 =?us-ascii?Q?NU3qQZ6Ms0ruEPf9edTqo1dNR/b668ILah3I2iJhUGTx7W4v7p4jl2K8hhx1?=
 =?us-ascii?Q?nNMsoNw+3UluX8DuOJe/3DslgQUTTqU2vfuKNIIYfG4k2i4g1IaxkmjmZkR+?=
 =?us-ascii?Q?Jjz3wRuJXJNZPkgb9wkczM9gsVxynpeUw8ieJp4SpML6y9GyzeglCYW+uCR0?=
 =?us-ascii?Q?YZyygfEyJ+AwRjh5MeMWvCP2q3zkHMFSminM7I/SrehaJtm67IsiwmfxbfmU?=
 =?us-ascii?Q?h/6QR0xtFQi8HluYKQBzuGH4AMUOBMeiWD5qf4dXcACkfW0YQXaffTReRhHA?=
 =?us-ascii?Q?Y1vwp/PrnjjAjAAXoA4QLEKuf8keMfBMMfj790i5Wp0qdbVZtCI7bLqrH7ko?=
 =?us-ascii?Q?rKFf3DD2rzMiTn2739i75vFtYT2geB+hQmmmD1su++NVc4qJcIVomX+qy3db?=
 =?us-ascii?Q?2beuQdBAV2njK7lF9S8GIG0VX27JZMntDvNLGcZFohZqtAfhZsX4xk5PygjX?=
 =?us-ascii?Q?86VoNWzfgzL0kkFRMqTRvemMIWiHBamX4Ln0ndRV85EMpQWi4s5rDIYHPMWD?=
 =?us-ascii?Q?EamjzfChGZ6rHJrkXNJofhhqJDC/0smBHEEz17v24HAsAkqo9PitOB/y/x+r?=
 =?us-ascii?Q?TycvjTcGSBUimDVioAaeskFRgdNWc00j/5U0UT5mOWKmwMit+VRbw0B3Dykx?=
 =?us-ascii?Q?kGe12fgfQGEMD4yp8W0SRIG/IQy9/QjVJXwcWjbOvjM9phRBcJUJZNgqvdFr?=
 =?us-ascii?Q?mOghhC5lLguFdyozIvgyg65jFq9tPNtq840QCZm2VpwrNBtAC03uDs9bjUVi?=
 =?us-ascii?Q?GPGuM6k1j9RhhTff0ToGBjEpH3qwkakJFhHCQJTIKOvJeM5CLIE8elE+Oxeu?=
 =?us-ascii?Q?57EovvkyimvVhsEY/sQKgO/dDn7bSUa3vJ0x3CzK7uD0ZUcaOOQstQapYWfD?=
 =?us-ascii?Q?Dsh4t3bbog6yKHkOSc83HQoDSpuQgExPqGLNZh97Vlk2lCpnXSnCsrnIVaSi?=
 =?us-ascii?Q?khWnkZPnA+DxS9eLJyMt2hEv8jBN81sYuifyU376EtMbYJzg3mQsjQEAg9Mr?=
 =?us-ascii?Q?pesJx377Rw021UGwx/Nk/gykoz7VcEaZxAZdDXJu2lBtJx9RpFijD//zuD7h?=
 =?us-ascii?Q?jJaRSxD+MEW+fPEjT7LcOa3O80vD348nG4GEV3WjAv+vjyVeQuWIjHIySA9v?=
 =?us-ascii?Q?oZxoj0UdnpvfQUWTm6yjdIzAlfA/4wB6HcIF8Xg+5x6IWjWSdX6s7yAoNvCQ?=
 =?us-ascii?Q?u2WLEGd2XGKGbo+wIIHKGtvcPnbF6nxBswhFF9WACie10XM9zQCrirvSB45A?=
 =?us-ascii?Q?81i7uaOgMkZxcGDpumJqfz0evgekO+9+?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(36860700010)(376011)(82310400023)(1800799021)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 07:49:34.2030 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 832e6760-9bd6-4d0a-ef84-08dc8f6b320c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8744
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nObobgDxxVHGWDxekjL7WLF57ecNmtdfuUkdrWsaJdA=;
 b=ulOCKxxR5YAD9lryS3u2LHmoKoSpmQVQ64KiGd/72aweksrTKD7O8NCJWagNBQGc717cPf2E7/Errru8cQ+GV1+DETcJKcU87Zv39eJd3uXpuYRCtRm7Kr+Z6Uac+GdR7Gsz5iDBDhcJ59m2NhnKQr1dH2FE9UbG5gJxyddsxHI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ulOCKxxR
Subject: [Buildroot] [PATCH v3 4/4] configs/zynqmp|versal: migrate to
 xilinx-source
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
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate one defconfig from kria, zynqmp and versal to xilinx-source.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
Comment: This can be used just for testing the xilinx-source patch set or we
can commit this patch.  My preference would be to move all zynqmp, kria and
versal defconfigs to xilinx-source, but I know this comes at a significant
build time penalty, so I am ok with leaving the example defconfigs on
xilinx-prebuilt.  Up to the buildroot maintainers to decide.
---
 configs/versal_vck190_defconfig     |  5 +++++
 configs/zynqmp_kria_kv260_defconfig | 11 ++++++-----
 configs/zynqmp_zcu106_defconfig     | 10 ++++++----
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 21dfe2577a..3a1a8be688 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -35,9 +35,14 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_XILINX_PREBUILT=y
 BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
+BR2_TARGET_XILINX_SOURCE=y
+BR2_TARGET_XILINX_SOURCE_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_SOURCE_VERSAL=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_BOOTGEN=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index a16da66e38..82ebf2e247 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -31,16 +31,17 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
-BR2_TARGET_XILINX_PREBUILT_BOARD="kv260"
-BR2_TARGET_XILINX_PREBUILT_KRIA=y
+BR2_TARGET_XILINX_SOURCE=y
+BR2_TARGET_XILINX_SOURCE_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_SOURCE_KRIA=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index c10ec70ed8..89269dfb5b 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -30,15 +30,17 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
-BR2_TARGET_XILINX_PREBUILT_BOARD="zcu106"
+BR2_TARGET_XILINX_SOURCE=y
+BR2_TARGET_XILINX_SOURCE_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_SOURCE_ZYNQMP=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
