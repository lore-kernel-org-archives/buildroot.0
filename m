Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0611EC3ABA9
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 07:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFE6261049;
	Fri,  2 May 2025 07:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gNIsIuZ4IXCW; Fri,  2 May 2025 07:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9087461273
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9087461273;
	Fri,  2 May 2025 07:31:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F7DC1A4
 for <buildroot@buildroot.org>; Fri,  2 May 2025 07:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FD346114D
 for <buildroot@buildroot.org>; Fri,  2 May 2025 07:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3uysIlSPCqW for <buildroot@buildroot.org>;
 Fri,  2 May 2025 07:31:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::631;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8FF116079F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FF116079F
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FF116079F
 for <buildroot@buildroot.org>; Fri,  2 May 2025 07:31:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pirkc00d61Fo4lEYtG/dWPQgTKa0JgV8WNsdApxdNZQbf6qRIwQ6rdH0ZJ/GAzr90CjxolP6iqnf6BSnmukkUjqLLUz4SMqORikbMm+e4hFCgkWH5TL76gB635Rly78jRZs/gc0tZpMuUjBMBIxnaYs6E9VeTtYlAjxLl8MTXaPLC/yy4rtbQPiENGduBmrtLa3olFTaaK1GeUcQM+8BV7XykM/PSCR16a2ce23UimLq1CsHCXya2u3OMlIIuiUfFzkMUJ2a3Q+hBCJDcTcy6ZmP3Q+FPwqIMiWGGX3oESZTdCER8+x9byLNHzEhxZLfWH0G+d2JpIsQ4CgZ/TnmIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIxgumj70dXyMWPIwcnf5UAvtyurIY/Trk5eMFH9oEs=;
 b=vs3bvNWJ2VygTo8ZxxNMPHZWmfTKrIj10tVs7f0lNGxWNvmOc1yUPHZii2Nucsl6jrblZEWhdQ1u47r4B0LWiQSuwNEdJhvkC/3phfeav+HrUeNhNZ/zaV6JxCkKzOJZRrtyTjoSKEtf6TELydR12FyFd0iNOflfZvEzGX+Q2Eso23wvWJndrLSprVnabYtdKTYM2gFKsEBkyXDdV0quhSRyrerXGzevTB11LrW0SglnD9pp4iC+XNuGApG4Mu1zYmIM4w+ocVACpGSHq7m7oj/80QSV1Z7L/Jg6/j0uxh7nanNpTsQ8BqB5npQ8iqWCmGxOrEfOEvMXU+T1YbMTBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH8PR05CA0021.namprd05.prod.outlook.com (2603:10b6:510:2cc::9)
 by BL1PR12MB5924.namprd12.prod.outlook.com (2603:10b6:208:39b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Fri, 2 May
 2025 07:31:26 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::85) by PH8PR05CA0021.outlook.office365.com
 (2603:10b6:510:2cc::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.12 via Frontend Transport; Fri,
 2 May 2025 07:31:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 07:31:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 02:31:25 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 2 May 2025 02:31:23 -0500
To: <buildroot@buildroot.org>
Date: Fri, 2 May 2025 08:31:12 +0100
Message-ID: <20250502073112.376985-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250502073112.376985-1-neal.frager@amd.com>
References: <20250502073112.376985-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|BL1PR12MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: ae99c898-b681-420a-865f-08dd894b5903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ln3DDANWj17OrqcFv/26C+3h2pK3kIjIK1w9ypwVB11goyghPg3SrkGPy2UO?=
 =?us-ascii?Q?+RdNtYw4sV1VPSkIQJSXC9PYHCWrUZ1CkTw1czhyJsFIZ1hQRQtvNHV3Ccaj?=
 =?us-ascii?Q?BxZk7CM+WJ7KGG0sy0C6CY/eBCkngfBiOQy5gLzntn9iODH57z3+7p3qr2Y4?=
 =?us-ascii?Q?nsTj0VTHxkyqJnUq3a/xVeSlZvsIf33dL+d1KB23eyxDzRxBMO67WVJDJDbU?=
 =?us-ascii?Q?UARvWkVxFOF4Iwwz95Cljfj6mxm32soL/9AW3n4tLnEOEVSDx82iUljBhxwm?=
 =?us-ascii?Q?I98LCkeNikyXzh4+Wb+9XTw5OAicPJ5g/i1D+tRCpACoRWfbbJvRc9xt8caB?=
 =?us-ascii?Q?cfhf9fM7soSjFQPW4bkjh0dtqgKqDxcah+lna2XCP++8OKeXdxJ9ZklmvqBw?=
 =?us-ascii?Q?lRbr0jYlC90cLO/jMsWHI4NgMzpU29b71pcMcWPvx8W7csnHZRiYXMaCkCMH?=
 =?us-ascii?Q?DXw+hqJZXTSdvvaKyuO5p/T0LlUP7keJ0Xv7vnp924pHflipjGNJM/hDpFyv?=
 =?us-ascii?Q?j74OqtlcSuTQCU7RItSc5RDyIqgW1cF8i0bwQuKCuwVtXsEpiML+ZFnNUsZY?=
 =?us-ascii?Q?Df1wQz7ckeZkYRJdhcJ2FoL0dsQGirtZv5rWxMy00tYMd0IHeh4mQe+NSKCr?=
 =?us-ascii?Q?9zykpPYFhCroCunnfYADc77cODjpZ7KWevrYobWwSePnUelQ0i7HKCYYuyH7?=
 =?us-ascii?Q?drsLzBfwVzCyNOqdiNos4YscmWOEHPoHmc0U2JGQx7bfwLAQO0FtuNEnoEqN?=
 =?us-ascii?Q?inHhVpn7joSHklEWJYnjugJQiVaOfMSR2qe3gCkDJv4uNMBm6HQCS0alRrot?=
 =?us-ascii?Q?uNVe9xTR2ZYBetML4T8mheGduAZ87dNYuirCeYgrZgeF2Gkj9L5sIFFIkobf?=
 =?us-ascii?Q?NDjTBuwn1kjbIVjPSRY9/zl14glx8D6Ebqeg+H8WI2lyaa/vemwezvTZ0wEn?=
 =?us-ascii?Q?jg30gHuxO++dIby8X4KUJkIFh0U6TqTRZHGxcfXksZ9/vDCTR1cEbTYUBGAv?=
 =?us-ascii?Q?JZIh9MYz50DejfcNQQBPm1hbGV6aIH+2ETSaRgVXv4JfN6jnIZpTzn2mCNez?=
 =?us-ascii?Q?2fH2dwcU5g/CjsQg6KmKTc4C5yrrHChIGj2t782yhuxHJw8P8ki/S8GuEWkg?=
 =?us-ascii?Q?iwua+zQjamgNmox7J8GZYYaWBhCOuj36Md75NFUekqpyNwlOyxzUqVlK6eS5?=
 =?us-ascii?Q?Mv+lONTL3+zECpxSeBzC84s8hCsjNN3AdlswK97an/pxpuPakOW/UuFaG7Fv?=
 =?us-ascii?Q?KFOp8MJrByryakSjle+ipM/pTgn5HoBPKzIc9CQHbwvTuL4G3N+8iur+4KNY?=
 =?us-ascii?Q?io1FqOF0hGJLJdkuBtOQCA0JRntFg/E4yaeIz004MlLSUThfC3QFZZdCicIL?=
 =?us-ascii?Q?ar8yu3dSxdAsuXlOAA9bFtmS4ZArbS5lHeAA/mm5P1FMcri/ShH0sWMQcdj2?=
 =?us-ascii?Q?noB6dAFA83oOiUcAjyA1b/5pkgFFKdFzacgf0ygBiOZkcNNMeI/ppapgKi1S?=
 =?us-ascii?Q?NJF1BCw42qWcqbD74dcG/4q1IzsEt1CE8dCFc9D1fvumpxREie5UuMJCHpfX?=
 =?us-ascii?Q?keGPJgDep4SVXBqnOS4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 07:31:26.3873 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae99c898-b681-420a-865f-08dd894b5903
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5924
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIxgumj70dXyMWPIwcnf5UAvtyurIY/Trk5eMFH9oEs=;
 b=vicLNrTW6XuFmT2zVz6zwseR7R5bLdaOOmmaecaxAS0grZHmeeT7+GgO3/5mxjTxdpKRzkI5zBDzb7MQRgKMiKHW6gYqBMbm57Xi7fvYxhlKm7n5h7jWHay5nVxEWT3XWPwq2YCwnKF0Y018GKwWfTkCc5TE1l2DbUtsAHUI7BY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=vicLNrTW
Subject: [Buildroot] [PATCH v3 2/2] configs/xilinx: add xilinx-fpgautil to
 xilinx defconfigs
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

This adds the xilinx-fpgautil application to all Xilinx zynq, zynqmp and
versal defconfigs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
[build-tested only]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
V1->V2:
- use new xilinx-fpgautil package name
V2->V3:
- no changes
---
 configs/versal_vck190_defconfig     | 1 +
 configs/versal_vek280_defconfig     | 1 +
 configs/versal_vpk180_defconfig     | 1 +
 configs/zynq_microzed_defconfig     | 1 +
 configs/zynq_zc702_defconfig        | 1 +
 configs/zynq_zc706_defconfig        | 1 +
 configs/zynq_zed_defconfig          | 1 +
 configs/zynqmp_kria_kd240_defconfig | 1 +
 configs/zynqmp_kria_kr260_defconfig | 1 +
 configs/zynqmp_kria_kv260_defconfig | 1 +
 configs/zynqmp_zcu102_defconfig     | 1 +
 configs/zynqmp_zcu104_defconfig     | 1 +
 configs/zynqmp_zcu106_defconfig     | 1 +
 13 files changed, 13 insertions(+)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 2f40c210a8..368133e916 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index af8bed884f..1d83e55499 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index afa606ec8c..7729c655c3 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index b9b2da3849..f9be297b99 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynq-microzed"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index ab42abe655..4c6361a9b7 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynq-zc702"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index d7ce9cf11a..bc853f522d 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynq-zc706"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index c9e8e7ea2c..d0fbaf2ea5 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynq-zed"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 261b73d6cf..4ba4be861f 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 2cf2b98aa5..fdd868bbb5 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index ef6a23f2a2..ff03f87b54 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 762a54d968..856c1d896d 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 92e0d41736..c21058be74 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu104-revC"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 51287fdffb..5e13c39a1a 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
