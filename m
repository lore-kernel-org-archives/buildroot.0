Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69509C27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 06:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3692A61206;
	Tue, 18 Jun 2024 06:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KihM-bMDXJC; Tue, 18 Jun 2024 06:24:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9F6D61210
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9F6D61210;
	Tue, 18 Jun 2024 06:24:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 670811BF284
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 06:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 616C2408F3
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 06:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_2TE5JZiKcg for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 06:24:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::601;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6678F409DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6678F409DB
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::601])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6678F409DB
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 06:24:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APGfVDOWkA9qM/catHgF1mOYepoP112PGyJCr4PCuzLoFZGGEaKLzC7p30vM3778ozaBL+OlyT+u9WLYrKexOMvij/+xqFSs2Tn5GXc1qiVuVO5h0kxoU/egvYuiQ8U3XNtOSWs0nd7H01g2okOuLGizET/fqUMzM8+sDX93kL6GijL0ibmmd3AH67QefA9+Hxhz7/jppBizR68+4S4/SUmcdbx2UZDWH3Rff4cWLAOqJuCBMsymML15aB4L5mH3ZNEEiIfh9C/6hoekOk5KRUF6lWEvu0i/KhNgmrDKqfD9HRwgtXc5KoAt2SYDyn7fDzMctCz37yBCQEAC3hd5zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nObobgDxxVHGWDxekjL7WLF57ecNmtdfuUkdrWsaJdA=;
 b=VK2KwqKTqb0yomPO2OQXN46Xtv301MvcvpJ8QWc0ZLLndwsDAjo3g52Mk1p4c3PLmfkOzpZPSQE4xDMAxcUWrea/jLSyfvxjp5X+9bZo7pDBOSsPAEC9CuelfVClxiHbMZ1ez3XpEDrM/1g+C25jPa2FACtKR2uRBIwJkKcV5sevsXROcbHj1jx4WBOpXVY31e5hviDM82/0BSmQccCpN7+mzE3YbCTGozRO1VHRb3EGF4xqjDZphaFofost1v2XCpFLRib0q1Dee1ZH0PwS7+krd9BRBt/ntYsxhaHGYsoSDpO3uEyZUJBKWfDN1O7gnUwf6T5ouLGTbzdENj4r+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SN1PR12CA0082.namprd12.prod.outlook.com (2603:10b6:802:21::17)
 by PH8PR12MB6866.namprd12.prod.outlook.com (2603:10b6:510:1c9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 06:24:34 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:802:21:cafe::76) by SN1PR12CA0082.outlook.office365.com
 (2603:10b6:802:21::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31 via Frontend
 Transport; Tue, 18 Jun 2024 06:24:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Tue, 18 Jun 2024 06:24:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Jun
 2024 01:24:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Jun
 2024 01:24:32 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 18 Jun 2024 01:24:30 -0500
To: <buildroot@buildroot.org>
Date: Tue, 18 Jun 2024 07:24:22 +0100
Message-ID: <20240618062422.2916787-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618062422.2916787-1-neal.frager@amd.com>
References: <20240618062422.2916787-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|PH8PR12MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d474600-a920-4429-80bc-08dc8f5f515d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|376011|36860700010|82310400023|1800799021|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TAmhPn4ypnmq65elyT+Wnp8VtRoLuKnldtuBQzQ7Y2QgY8En9LSYuvLmPgKY?=
 =?us-ascii?Q?wOoOspwXm8txrPUHkxu4H0j9GJACbZ0685ezFYsJK99MAQpuHPqR6kAcTpx7?=
 =?us-ascii?Q?w41ZPt2JuxI2R+j/AnYf8C6HRRp/nekdZV8Ke12H5LQFafMZavceCNwBzSgz?=
 =?us-ascii?Q?dGoSnQU5lt/BPqJ2l+qQ0ceXYytXUfHWNoir/DbDEb6281165snlZyoUQ6jg?=
 =?us-ascii?Q?t7n+OVeqWcyLHzrtbDbABVj/jr/bVg1/xxDrhotGjRO2UbiHgnRlOsYwVjMZ?=
 =?us-ascii?Q?xsUbY94nHJJo9TAQaHdPKQNXP866t9rW99GoIzeElLIP0kx5ltTk1aODW1Lt?=
 =?us-ascii?Q?hkbCY4Dw6KSTAKSjbRgIu6sZDCmKOshognREBzzsReOzsh2hAQE3W3TjwaZb?=
 =?us-ascii?Q?9PA1pubmq8RJ9KwFazkTUGyN6bdJF0teArLwxNl+wE7j4BHTzAohDjtqilCI?=
 =?us-ascii?Q?JsTaSNxl6HaNq94age3OoveEHvbMk945U8WeYgX/Z9KqMRjUGIyfHhyA3WOD?=
 =?us-ascii?Q?919wjDTUQoSZku98Ce9nHQrQQmwp11XwLIyuNIo8bZTphsMdz/IlQi5Vox4N?=
 =?us-ascii?Q?F8pwM9fqrKKTDYR3+PU0JlS8iFLqxY+jhNzhdUhIKPYtRnMflDAubBYa/Y8R?=
 =?us-ascii?Q?Axu0uG7wePKm7HC53vT+lJds/Ru+dU4q6X6JezgbvEo/5pYuE9bjdmPDfBjA?=
 =?us-ascii?Q?/MHeQGrbg6tywYPeugZRCJiz9ZH8DXnBbukWHs0hGcGZPbBC77cGpP7ZfO3O?=
 =?us-ascii?Q?Efld+OtH4/Iu77QaWOlMpxi+DiSL9GiV7tut23m5bqdCuO6efy5MrKN/loNz?=
 =?us-ascii?Q?7gpEKiwRzECuCefOoLf7gT4np6BcsdFqh0IblndeRxrmd7sE8FVANyaw2Ovc?=
 =?us-ascii?Q?0DbUq4LOKBzCjlh1GQNh4AHVgJavH7JnCC/VfJnMLJrLX1Mbwhu7PN0HnMuC?=
 =?us-ascii?Q?yjxIAICuPG4LEFp0uZAczjgEzexkBthhWxudr7NuPSyEsTxIQbrFD+umLG2u?=
 =?us-ascii?Q?IW5WsxPitW7NdC3TZg3kidKqPsRRJOMMR2/5ccAckltfK4A2E2FhhnkbOb9z?=
 =?us-ascii?Q?YKwbnwKQK6Of/B9ybxpjUZ8EfnXDDVLOFT8Dfe4CrV3eO5fPehWZB9J1FJ5F?=
 =?us-ascii?Q?8dxTe69t87FKz1gLQUv0XGbHk+73TzEUIDs4aUxaWUHGvjSUD2vQbQUwhdqP?=
 =?us-ascii?Q?DVrX0WCD1kFmiPH5RXHYSO075F4u0sLiUCP5dnz887eUOY1BHr8vxYThwnv4?=
 =?us-ascii?Q?K79Ku0gnIyinYBsAxCNxFE5iK4HQXTptRge4cgfaOw4YYUdL81RuDHDN66Fc?=
 =?us-ascii?Q?9VQwzrcybnOIeCgv+U0REtcS8GaoaaDvQkK8lIKM4MNucNH6bzzNGoxbQi89?=
 =?us-ascii?Q?Q682guFX3ni228aSlkbyZSTEcQqdhAkoQKkXx6hrYhkKy5hjKPyu3KVkwaVf?=
 =?us-ascii?Q?hnLbUn8qnI2eYqXa2E76SvF7f2FIHu+1?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(376011)(36860700010)(82310400023)(1800799021)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 06:24:32.8577 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d474600-a920-4429-80bc-08dc8f5f515d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6866
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nObobgDxxVHGWDxekjL7WLF57ecNmtdfuUkdrWsaJdA=;
 b=veVdrp9UPcRAYpJK1uwA9b+WNZExSgnLCCXf+MYyU8F2gLNvuEMzXHNQuFy8CR7ww13WaP3aL3/qOG4+1DjUNoNwhRAABwwnelC0RowPPGCxaElFLtKEnPCjnwSySYR32Ih+vKsVa/nnoF1VWZHL0vKwV1PHYngJwxHofmAFLb4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=veVdrp9U
Subject: [Buildroot] [PATCH v2 4/4] configs/zynqmp|versal: migrate to
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
