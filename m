Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E123C02182
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 11:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBB9260C2E;
	Mon, 20 Jan 2025 11:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EpQSJCL1S3fS; Mon, 20 Jan 2025 11:34:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6734160EB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6734160EB2;
	Mon, 20 Jan 2025 11:34:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A150959
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 11:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B3DF81EF6
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 11:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPeh4Ug7kwk1 for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 11:34:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::61e;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2894981E03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2894981E03
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::61e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2894981E03
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 11:34:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=trgMCQPqbhXPPt/gsKZ7AfoRRdZYeGjNPD1ChEORhCOphLZ2PI24ClIH437lumGb151cFQ9A5JwZK4H6sAg5RyMukw+rZzB+BbFo5btat8i09JKb41e21BCDYJJR4exLkeKQgTLwL3LTeHYwOy6rdZRmep2PcIrImvtC7cWVZNJEh3NTnfnx/VAhTQeIxtd6spTDgAFQ0do74nvvJM/SrS6i36/RpKQjeeLR8Z9nGowKU/Kmco6ikwiTjCtln7Gmoo+SYPcAFY7k4YljgY1Qwa5xaV4OrrSMb7kvMjjBAHKaoyvHGqTCqIFnCrr0o9iFwdUajwo2t1fNhrWYLrH/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3VB6MgcnvMo2Xzq7ZRWwagL6T5pQ+sjbdNeGD/aNa4=;
 b=sGfIL9DChYyxCoksumDym//8kWNedJwZZH8DCS83b4vzEob4PXs9DmpuiAlZyPLftB3Nvvg4Ay3bjaDs7Cme3sRmqDoTXp+u9LQZBE9L7H8r2wHOxmZtccwdsak5gQaabg8s8hVQD0K1uGY/9szRj+E3++gKBe6/sabX12jnkaLDuB1oVDwjDQCZPWJBMESa39wc25NWtrzLSQdKNXj9BPyEuQ0pL0V9KBkVh8eJgIJFHzJHgPJmPBBc9c6f5sFe4ggdfOFv52bLSAV3/p1hMjnhAJJVJAmoyh3PAxCB3htWQmNtlQOjRbfNa1wzQAPxn4RtV/fYth+5etBVvQuZ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH7PR17CA0022.namprd17.prod.outlook.com (2603:10b6:510:324::7)
 by CYYPR12MB8889.namprd12.prod.outlook.com (2603:10b6:930:cb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 11:34:15 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:324:cafe::8b) by PH7PR17CA0022.outlook.office365.com
 (2603:10b6:510:324::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Mon,
 20 Jan 2025 11:34:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 11:34:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Jan
 2025 05:34:13 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Jan
 2025 05:34:13 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 20 Jan 2025 05:34:12 -0600
To: <buildroot@buildroot.org>
Date: Mon, 20 Jan 2025 11:34:04 +0000
Message-ID: <20250120113405.3938838-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250120113405.3938838-1-neal.frager@amd.com>
References: <20250120113405.3938838-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|CYYPR12MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: b4cce53e-d18f-49e3-544f-08dd39465e53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fyigMLfTo4STlQXa1sMAZgnQ/gYDowecmlW42Vayji3QhvGZwSE27Qffr6Jd?=
 =?us-ascii?Q?k2IYeSXzVpJRzzucIZY8nhmioq1X7C3ygqDggLbMj4Ctwuo2D2IUyPWZ5ubF?=
 =?us-ascii?Q?SDAomH+CqLmyk6YGhj8p9vNX0TAxEV4Gzowz8vQ3fKT67LuOtizdF9mCgNKe?=
 =?us-ascii?Q?tHgerdIEjPPnnZG/+7jlMgKwl7mGKQ0UsFJPsOR+JqtjgwEtMlT9wZrJkHUx?=
 =?us-ascii?Q?pJxhPrHywQWJSoFjUqg2f7ulTpzq9Eg36e3WfwckPmB5GRT/r8V/N+ZSjcDl?=
 =?us-ascii?Q?ZMsobenvzewBe8PT9sBq+khnYq+gm5Q0RMWqYrkMchSHwyWCoHs9dCf6Bd9q?=
 =?us-ascii?Q?LNQb24lYGkMz/UxPj3Oq3E9cDVW/FzOzfJnhn0mTNpNh8lMWUM1lHo2VQriD?=
 =?us-ascii?Q?sD0+x4/aGR/AaG6a8k7ymFLld+Sr4jpB4T64bjrje+WkLSMmPVYqjg3GuTYn?=
 =?us-ascii?Q?Tp7Cr9KmzlkZ8KYwwk09P1vwN9nhADkxpvdeVex5oNZgAyylA4II5U+oA52q?=
 =?us-ascii?Q?qp2y6Ra2+D0bxNL3YnvEz9u2ZxdhGMHbEo4PHtZGwuDqCYXJqHLPvx1uLEPU?=
 =?us-ascii?Q?+1Plvn3BWioOZ6vTrf3aCt4er4OighNZUdFhG5H+91DOXczAHxeXgrramW6O?=
 =?us-ascii?Q?OEfz97uss8FTJHX0BQw2r8Sa4y3WRsdEnewjngbbbpxUu33BCCadEV+VEgNQ?=
 =?us-ascii?Q?wf9QNArRK0bJzO/P8JMvAvzlhlzNYKeZ+eVTjwNAxgW1+BEOtBoruy4W9xf0?=
 =?us-ascii?Q?qZx9t0QILv7jiTAOG20UPAsVyi0sugVzr9yD1XUcr0icMMZe/h5IE97Qk4c9?=
 =?us-ascii?Q?MhIdG6G4/idOuQJcNU+U0t9261rdNWuKwPdJHz44tVzen8T7Snlx5yyQfKiS?=
 =?us-ascii?Q?NqgVLg+deo0SPCwhqDUcuGiotkKkLQKG5omrLrrf0a204fgJqBcSWY25oTis?=
 =?us-ascii?Q?ZgSHYxS7Wc/D38OKBxo5CcnUExnvWLWv8iFLS6QIKssI+DFNE/vK4490gDHQ?=
 =?us-ascii?Q?YKzFRCWozz0L6yXltrlXhN2dfT+v4/dUuj9ySh2NoQ/omrGny19FAOuXsNuf?=
 =?us-ascii?Q?eS0S7rNCny8fxvs+KIy75p+S1QoJuubZT2Cn1qivWMcKwln5y24KY5FAOfeB?=
 =?us-ascii?Q?veNlvoYCSyV2om4RVPJld0SsjGIWzULIlFKybbdl576n5TOPPsoPkciT5Wnl?=
 =?us-ascii?Q?kHjOhW8bxGXBwPs6Mpxzo5KisxaGYtuapbQ3kRuwEoNuVmhOOuyWGcpdA3z+?=
 =?us-ascii?Q?CTZ8WzyqDX6gQ6wypPalpk/0PCLC7WslA2ZSOAgDYjRNCqM15DL+aJw/wM+h?=
 =?us-ascii?Q?gg8L9dTihGjjyb2Uf0ibv61R+FE+UtLsF4NS9wUx8E+pZqhjOa1QT1+myftR?=
 =?us-ascii?Q?N5zl1UOZzzqzpAGCh9eH2yd8VlHgHB3y0W54APuQM6NCTGiHzshREcC+BAi+?=
 =?us-ascii?Q?LssHzhQiIq4n3BVYdOOeDkEZKEEy9t1UyKxrlAa79ZEhV+/izlDWww7ZLf0C?=
 =?us-ascii?Q?LT1aWV/BtYm1OF83RBfqfhZldUP6apChWGTr?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 11:34:14.7929 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4cce53e-d18f-49e3-544f-08dd39465e53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8889
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3VB6MgcnvMo2Xzq7ZRWwagL6T5pQ+sjbdNeGD/aNa4=;
 b=4HiZewZWhmTMa6snU4E1W+XVwuVQzJldhrMzth3NAm+/Rntba2LCr2zzsKltSSyQ0N5WMZs/YB7b19OZiqZ6Cyti+o8Nytnm4KlChxu7J0CSgwxG8G4t+Gz7A6KYMTAFHBr2boOVULkuO4u88VeNk3/bk/WVAiI3QGmBKt0RMd0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=4HiZewZW
Subject: [Buildroot] [PATCH v2 3/4] configs/zynqmp_*: migrate to
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
---
 configs/zynqmp_kria_kd240_defconfig | 9 +++++----
 configs/zynqmp_kria_kr260_defconfig | 8 +++++---
 configs/zynqmp_kria_kv260_defconfig | 9 +++++----
 configs/zynqmp_zcu102_defconfig     | 7 ++++---
 configs/zynqmp_zcu104_defconfig     | 8 ++++----
 configs/zynqmp_zcu106_defconfig     | 8 ++++----
 6 files changed, 27 insertions(+), 22 deletions(-)

diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 38a5aa378a..645b3b23b0 100644
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
@@ -35,12 +37,11 @@ BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
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
index a5d308a4d5..36da3a146a 100644
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
@@ -35,11 +37,11 @@ BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
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
index 711f43c3a6..81875760d6 100644
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
@@ -35,12 +37,11 @@ BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
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
index 849f5bd811..3b1809fd6e 100644
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
@@ -34,11 +36,10 @@ BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
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
index c52bac1462..3022f4c1bb 100644
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
@@ -34,12 +36,10 @@ BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
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
index 2f3edf7972..38dc8c392a 100644
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
@@ -34,12 +36,10 @@ BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
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
