Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232CFC54756
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 19:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAE3D60EF1;
	Mon, 19 May 2025 19:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WjY_lC84iqJ; Mon, 19 May 2025 19:38:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA3BE60EF3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA3BE60EF3;
	Mon, 19 May 2025 19:38:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BFFA3E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 19:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5A7F40FA4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 19:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AEp_MZ_p-jAF for <buildroot@buildroot.org>;
 Mon, 19 May 2025 19:38:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::615;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC8E04111A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC8E04111A
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::615])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC8E04111A
 for <buildroot@buildroot.org>; Mon, 19 May 2025 19:38:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjk6MKn+yNwqP6tP06lZpFRvgP9KG2xUqQHQARcKxs7m3Q3k6y5I5erUB3Wp5cvHR3LgSHbCYxOzHTPdeNijbFN47WbajSUl0gx9beyMK0KtMe6JtRGn77eFj5yOmV5xLUouWKF//w2KbLWocN2vF5QaYhKm3MTZ25G8NSHymfnU5G+pqUzkUpvAUNCiPQcoTdvDFkJBkKSPhtBeLdJFQYRZTwWtLVbrK+fkBT6OBJEgdZ5hJ+IqkQolcitO9KMg1E9M9XrBvOpGeSW+pks2liFi1Cb3+k3QaP5ETBNbHImVkgAeBFVdScsC6rbEIQu618FZ7Jb2IO8w627OFFdNYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=es7vMvyiVJA/gVfGs4k7vfgeSi+26zwyPxkeqXDQYlw=;
 b=tTJ3S+TD/RYVSx9gJIgQQMW7MrK7j9w4I1/inGxVb+5gibJhXRZE+mGeDihl5vghlbKxpEjGQqpzjfesmtUkN/rn9iglOdr9CFmQn0Kf/wHITZdJe3/2B5pWUQAq+pw/9HVD1K/EjpGJn0XBNGS3xtTwyC77PY3X7Gp/ZCkQ8ixWIlUoy6scGiX2OcHujD9jQkN0KYBJtIquIZSB0XUSAYkey37CLPJTXyRkD1akWaU5vnl4r1xPPAi7CobZHkA5nB8o6FaRW7/t6uMfHRJw2Aj4drkVYaPPz3Y7L3EwJTUSuxi0+E/ZNvRsRIURyJ4Y6K0cZTb5jJ9AGVhLh4adLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0563.namprd03.prod.outlook.com (2603:10b6:408:138::28)
 by CH1PR12MB9669.namprd12.prod.outlook.com (2603:10b6:610:2af::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 19:38:38 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2603:10b6:408:138:cafe::7f) by BN9PR03CA0563.outlook.office365.com
 (2603:10b6:408:138::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27 via Frontend Transport; Mon,
 19 May 2025 19:38:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.4 via Frontend Transport; Mon, 19 May 2025 19:38:36 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 14:38:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 14:38:35 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 May 2025 14:38:34 -0500
To: <buildroot@buildroot.org>
Date: Mon, 19 May 2025 20:38:17 +0100
Message-ID: <20250519193818.3192717-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250519193818.3192717-1-neal.frager@amd.com>
References: <20250519193818.3192717-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B070:EE_|CH1PR12MB9669:EE_
X-MS-Office365-Filtering-Correlation-Id: 639c816a-cc95-40d8-e4c9-08dd970cbf99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e2nheo2sJ/3cK/pShuZi3SovgSuYUie02BEFq/usc9ElTGdldf9fyC5ncUXY?=
 =?us-ascii?Q?uD49+6iXUvHxOaESFcB4lS0pLceVgjFQzxU5u6HwTM8VhHMdDpUP3WfQR5GX?=
 =?us-ascii?Q?yiIuqVpgULHqvtEwYvKf7abilItcNPSkJYsCjlGNiLVXS1dv6G3jiQXh0glL?=
 =?us-ascii?Q?mgH0QD+vyc9AwtYgbrE0maAn8iXSll5R4/qRmwqQvDQXCzDeZdR5x+Gd66O4?=
 =?us-ascii?Q?ZThlCKfmUxg3i+pcm1kfcrTLHnuSELyEwQ2bDS/8Xl1mPYi+IVj/G0LyNq2j?=
 =?us-ascii?Q?usftF4PS5x8J1DpmpVmmgYr9izv5sHHxMv48BXKxwsuk81Am3ehxHcLw7XVz?=
 =?us-ascii?Q?WId4CKikPFohTDZAuCw1nzyLwrIXV0HXH+xBrchGEAtQkE+6PbL6aLhvQkWy?=
 =?us-ascii?Q?akcrJJVVLyVEPTabvqS8Zcb+ML8xyZs5IEKmroT+ql4Gt/d7uau/xAv19Wdd?=
 =?us-ascii?Q?wa2XD5r7hfhXcQtwqkNaKQlekIMY5HXn8pvGEkHSmOsUsqI/f5aFgzK5twS0?=
 =?us-ascii?Q?n/54umE7KstDACaXTlr8AB/cSj4CJUvAPT8BEpVJ4+Jg9il6eQhGfvb9VXE0?=
 =?us-ascii?Q?MDx+OD0h3rEHQ9GY2hiT4O1k9RkGd9bnQPw7ZWFBWNiNIfT/4VZcB6e24M7J?=
 =?us-ascii?Q?Id4gsE0Rg3H9+WNBQG/o9Lw9C54fIV6gCs1vtCnQPJENXekXPCXdn87Chnjk?=
 =?us-ascii?Q?gF07GxtmFeZOYnh6/hR8N0uvQ+gEazIsEcUP5bwHSsneIf/o/YwkOFn+TNO8?=
 =?us-ascii?Q?HE8fPmL18i8jJ013RQfkNOPuemBNXAgTA6BaYnb7W8fXtG0wBATkWPenceF2?=
 =?us-ascii?Q?w4IAvLMDFa6HpDfopLgDuqt6VB4D/9YvvmcfT3o9APmlgvBlkPpqWC2Brp+w?=
 =?us-ascii?Q?Cej1F3V6uWOriy8WI9+Imjjqn/J0gannDxmudgAz974/4rvranv4VAEsUKM4?=
 =?us-ascii?Q?gtfgz8pWpjcm8KQyE0ZtQiNKgQ6bhSZ5S7OjljpoKpzhNP/AE1hMWzYTJhUc?=
 =?us-ascii?Q?ShLOTNNFFHzNb4kP/vqAX5tJUHKPycqbGHpcn0Q/spwauP3YbAg4nexDuu3b?=
 =?us-ascii?Q?1tCFgzKyENA8+y+iZTOuiTBLJVJR9E9vFAU6PbuHExVgDiWGz8mz5avjyyLl?=
 =?us-ascii?Q?ANqFTo4+ypklDrbHJErdBlV6f4w9bMW9dbG/Vzt4uFhOwNU7cdoplmavikHR?=
 =?us-ascii?Q?dhrS/0u4HtyWqSxy8nz23T85NHWxEnb4YqdGQUg5CkyKUoUDornXXOgM5Xpp?=
 =?us-ascii?Q?vbHAfZCOKRfbb/m3kh6M0zVvOg308XGszSLCYrmpD+RPwBlhUrQGX3WQTc4K?=
 =?us-ascii?Q?9VEdMTdhhhPDsEfPEXSN9stOUT8T1UWKUDW/nYsyRRZ84mGmKQPD/2K5g8fF?=
 =?us-ascii?Q?1wn1feRN61zOCjAqbjGRtsV5WRF4kG6FosXUX3CSk67M3VsOxLV0NvtMwIsc?=
 =?us-ascii?Q?FL0C21JBFkSgH+DmZkc6azuxWEMmKzIbdOnpE/plP3O+N+NUbpLPdumlzodt?=
 =?us-ascii?Q?F2rSUgxMzTlRnfepSmQT6LGACO12AHz/kYAEJj2yMrwazIPRE3A4hDLYWEab?=
 =?us-ascii?Q?26ks+9NWDhaBNh0JSNU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 19:38:36.5990 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 639c816a-cc95-40d8-e4c9-08dd970cbf99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9669
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=es7vMvyiVJA/gVfGs4k7vfgeSi+26zwyPxkeqXDQYlw=;
 b=RD5JmJaMreJMlr6gmRRa9Amq7oyaTZC44Va4hYcmVDKXg5Gdzn7zYeLPtL5JfxWVkt89gZGDpOkLnEHHIEtKyd/hzXvaDgIX59nqbFNJ5h7FIpH5ebPBkxFa1QGLzatSUTBdXgKmhsUi9l6j/aHY6s9OrC9BeQNMUW3JwIRPX60=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=RD5JmJaM
Subject: [Buildroot] [PATCH v6 3/4] configs/versal|zynqmp: migrate to
 microblazeel-buildroot-elf tuple
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
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch migrates all the versal and zynqmp defconfigs to use the
microblazeel-buildroot-elf arch tuple for the toolchain-bare-metal-buildroot
toolchain.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V3:
- new to series with V3
V3->V6:
- no changes
---
 configs/versal_vck190_defconfig     | 2 +-
 configs/versal_vek280_defconfig     | 2 +-
 configs/versal_vpk180_defconfig     | 2 +-
 configs/zynqmp_kria_kd240_defconfig | 2 +-
 configs/zynqmp_kria_kr260_defconfig | 2 +-
 configs/zynqmp_kria_kv260_defconfig | 2 +-
 configs/zynqmp_zcu102_defconfig     | 2 +-
 configs/zynqmp_zcu104_defconfig     | 2 +-
 configs/zynqmp_zcu106_defconfig     | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 368133e916..5cdfcb4b96 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 1d83e55499..ae33dbeb75 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 7729c655c3..f6f977ec88 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 4ba4be861f..46473d654b 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index fdd868bbb5..b18b96ba9d 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index ff03f87b54..27c782dca7 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 856c1d896d..cbb30fe9ae 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index c21058be74..608ba15b6f 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 5e13c39a1a..c659bd086a 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
