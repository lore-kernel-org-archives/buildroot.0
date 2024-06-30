Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65A3C3064D
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 13:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F7594068A;
	Sun, 30 Jun 2024 13:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id juqef3_Pv8m5; Sun, 30 Jun 2024 13:45:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B00F54067C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B00F54067C;
	Sun, 30 Jun 2024 13:45:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ADB501BF3A1
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 13:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E40840606
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 13:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6wGQKBh6vqH7 for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 13:45:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::600;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 38BAD4060F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38BAD4060F
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::600])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38BAD4060F
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 13:45:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbuQSme/aYcS76qk8UMzIJMzoMSSD3h0oifbITb0Y75TuIpqkWt13wA74Zr/fAfKat7HKFGq9TcBpKE4vP1BlQfK9AsjMsrZidoO8gVjN6cG4agaX3wLLsudf1jhPBpsBafCARSwFR+YNrJMEenZAKff6RrSJMEG1MzP+AavoG3jfQpVppagR7ZkbgAFiLd/BON6CtboDewcXI8y0BXC6+T/G8XePpdxp5kNdDvPnGoXH3ydXa5nRt2+Ih2mpdXB9xW1h76KUYbLfwi0ZHsVbE5oaeV8l5tSaXjcZOHIUmdgY7xYAaYx2nkFJ5/gnfPSEhFeq/iLodh9lps76dyULQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFSA85sm36RLJ+WbLqF6sbB3mOyMElkr3phKCXdxZwA=;
 b=R7zVwIurPxSxlbEImFtoAOfN1SPmWSJuTniC1a+94QGr8UetTjcUP8tXY0BY+LFqKBKKY3ard1DcBQQnhnqldNR/6xRA9fzEOZUCRYhg320IwF5SgHPMgT0XL57Kqoc1gKgC+t40Qz2ElyA2bQ0C2colip+HFHjpcDGngctL+YvJ3v3jotwDM02UTitDZdV58tHE3D1ozjh1lqAslRV8RSu487jTgRelPqwLixadQPQOdGxdRFN3Fc4vYMx9Cevxfd+lrUkpW/m1xU1DFMkxPfUAVSkfu+cL6YFpC5vZSIvn7VglMWQx/BiRPhLx75XEbjNDdnTeKEQssxK3c8kz5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BLAPR03CA0162.namprd03.prod.outlook.com (2603:10b6:208:32f::22)
 by DM4PR12MB7695.namprd12.prod.outlook.com (2603:10b6:8:101::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Sun, 30 Jun
 2024 13:45:16 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:208:32f:cafe::ad) by BLAPR03CA0162.outlook.office365.com
 (2603:10b6:208:32f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29 via Frontend
 Transport; Sun, 30 Jun 2024 13:45:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Sun, 30 Jun 2024 13:45:15 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Jun
 2024 08:45:14 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Jun
 2024 08:45:14 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 30 Jun 2024 08:45:13 -0500
To: <buildroot@buildroot.org>
Date: Sun, 30 Jun 2024 14:45:03 +0100
Message-ID: <20240630134503.3658120-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240630134503.3658120-1-neal.frager@amd.com>
References: <20240630134503.3658120-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|DM4PR12MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd60d8f-ba3e-4e83-0e3a-08dc990adf33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YE4U6oOhx6B3s7305fGfR0W9cCrMjnTH92VmPFgJiOATGwxNugdbsxsuyeZ5?=
 =?us-ascii?Q?LaVPnQb/E5Ocmq7YcL6dMmGnTKPQmdjgCxoNLIPwrPqAmL9mceUCskbymPGT?=
 =?us-ascii?Q?X7THG1ias79Zv5hkBxsT9nwxyit9JulJDVJ3nN6otO1y6ODcU3tUnUoTQUpp?=
 =?us-ascii?Q?/tVZgv1mPvhhnX/41RSzR3OHH+ikqD7NjWrrNfxS2b03HTF7f3BQ01MgcpUs?=
 =?us-ascii?Q?XpGEZ100c3VTU2176lTRMkSsFMn0Jk2PByrE6XN8qGroQUJ8jS8ONBZhsmpq?=
 =?us-ascii?Q?WcaQFPJw5Rmu2gd6MyipIoAhBpcMzEbkr87Oge+hpSgGgbIuMJDREc/GP1x1?=
 =?us-ascii?Q?Rr86AtPlXfcofaSEKt7YwPk5khyRlaTituEGSwE+Tb+lp+E3mBkrjsd9IKLa?=
 =?us-ascii?Q?7iml4CoN2zNPRQkrvxfPZyPHsARD8RiYulxUhtG8y9ZuXLIIfSco8Ql+w62e?=
 =?us-ascii?Q?4qjyXVgvDF/nfx3HVNqRN7Z0l7/aHQfswWzliBgduPEltrKZh5ELbUW495vn?=
 =?us-ascii?Q?uycmrEQR7sPCy3s/Sx8epkpOqBgtRtSJktQ/1Ds1srVzGLd2OBLYhHhqw4Pm?=
 =?us-ascii?Q?8PYWvvt9l83avpVbXQzu0fXz5F8QAUgwsVieolKrfsljvwZqUnKhoBB4Hmb/?=
 =?us-ascii?Q?LDL7Vn9oDJqzrtsc7EMuSVVeXEW2klG/ETyjYkug875WKaDe1KD6s5YUNb+D?=
 =?us-ascii?Q?jAiC42u25LBvfWyjcHWKZGP4VSR4vU0cYkpipi5sg7QJPABiyy5hQHiCiAeF?=
 =?us-ascii?Q?/reyhB4SjJAUo9fD8gzdYvJZGrc5SRzq8XCsoPib5WwcP9g5P368kBTFFH3r?=
 =?us-ascii?Q?1P+RXiS9uJYvAxDJU62XOjwppMLwh7PkCi1hv03U/eCtz5pexy19BqIoVqEi?=
 =?us-ascii?Q?NLyTOw9M8pj2+Of2e8bhB8PUji91Bg8m9x05zJ4P0aUS6rKfuuHwsjaWQzBU?=
 =?us-ascii?Q?h2oSbSPRqrItNeb7t5ULUuAefFzeYilYK3BTGuyvT2VEnMb6uW/lTIHqKpmi?=
 =?us-ascii?Q?bhbwi//1r7KeRlpUyx9j7eBPcnW373/kpPEVJ6biMe64sSjodRqbO7oq8r8R?=
 =?us-ascii?Q?oJosT4YdB5gWTr6zMxB5VqdapGO3aN4ILXwt2vqY1bd2k524G9QDN7Qz9NXc?=
 =?us-ascii?Q?EliHWxU0N6hd3oBaQRcj8xSU7KdKFqYQoD415rFtyroKVoxTdZ7d2SqLKC+y?=
 =?us-ascii?Q?InL3th6v8JcYzLeoihm5USFeUFolP7p+0LSqb84/2AAgfS2tJ4uibdtQuCCt?=
 =?us-ascii?Q?NmObQejXyQT6QZ4pbJLg6FjIl4fx4dAAVtjQLaTt5s0yNTFiHOWc9qXhBUww?=
 =?us-ascii?Q?4/SqCyTgOGDoepbrr5JohRZkUTD9/hk1pC/4/Qc9BkEVS3NrXzF4oxWgzYzj?=
 =?us-ascii?Q?5+i/tW73ZmrMNiYCM4w4/PlKVR96yJLxxLY80GCWxZ7HKUfHhY1+1dRUbr4r?=
 =?us-ascii?Q?yxt12YU3kxUdQkqjkn7Uxbrg3oCeROQfsr5297XwT9x2bHJ4L8JFYQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2024 13:45:15.2530 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd60d8f-ba3e-4e83-0e3a-08dc990adf33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7695
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFSA85sm36RLJ+WbLqF6sbB3mOyMElkr3phKCXdxZwA=;
 b=tOt7C8ZchVAvPU6P9BAloX4Qx+9axl+Chtgafxzuugv7sq0Nd+cblQV2FMO5O1V03dC3196lnT0NV2tN6sOaxdBlh485jHoYPnoYxfhfOP/B/I6nqVFHGM4eEV7q416SXtdamEnUkEfiJ3Uwvr7glE4wmKLMOznBAFg+2IOHa0I=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=tOt7C8Zc
Subject: [Buildroot] [PATCH v4 4/4] configs/zynqmp|versal: migrate to
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
Cc: andy.a.kennedy@collins.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate one defconfig from kria, zynqmp and versal to xilinx-source.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V3:
- no changes
V3->V4:
- versal_vck190_defconfig uses versal-pdi package

Comment: This can be used just for testing the xilinx-source patch set or we
can commit this patch.  My preference would be to move all zynqmp, kria and
versal defconfigs to xilinx-source, but I know this comes at a significant
build time penalty, so I am ok with leaving the example defconfigs on
xilinx-prebuilt.  Up to the buildroot maintainers to decide.
---
 configs/versal_vck190_defconfig     |  9 ++++++---
 configs/zynqmp_kria_kv260_defconfig | 11 ++++++-----
 configs/zynqmp_zcu106_defconfig     | 10 ++++++----
 3 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 21dfe2577a..91a17eed0e 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -32,12 +32,15 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
-BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
-BR2_TARGET_XILINX_PREBUILT_VERSAL=y
+BR2_TARGET_XILINX_SOURCE=y
+BR2_TARGET_XILINX_SOURCE_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_SOURCE_VERSAL=y
+BR2_TARGET_VERSAL_PDI=y
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
