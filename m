Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38FEC369A2
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 06:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E65DE41222;
	Wed,  9 Apr 2025 06:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKJ9IC4n4PGA; Wed,  9 Apr 2025 06:47:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD62A40BAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD62A40BAD;
	Wed,  9 Apr 2025 06:47:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D6EF1F1
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 06:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3409D40496
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 06:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMDR2XYygID1 for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 06:47:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::61c;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6F1E841039
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F1E841039
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::61c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F1E841039
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 06:47:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbDk4QCQ9zrzELIDfFx9mn+pkp1V+IuMpcOKvfvph6ptIlm4qMuQzC9YlSl4ia7tR7pO78ugAD7pQtos3jaG3HYZpnUNLWLv3Cdfnje172npbA8XOff7zxZmyMTJzfRZcm34qVcPcw6rPuQOqekKYlstRL5XZIawUEWa0MbfBRhdJjQ3pvxQhIG+4aChUyUE6n1ndjNh4fYCtfDKcp0fss2LnwVSi4xWnI5bolMFFSbl/zpI/A5ukK+Cl08FrZhhEtQt2+DxGHc0hMsmex9EZ611XtKYurcFQ/paorV1th+4Ru7GjSfesCtoISk4QVpXTiLc81E5rgPjsoTbOxpmGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3AilZfBCgmLUwMRbPBF+L78WhGqtWeo378CZTA8hVI=;
 b=tgl5Y9docoMOA+NaiStpu4DjkQUpJ1I3H82hMaZSDhJmm8xpwuwl8UGbmEw191NO2fAqZMctCKCORC4x2Smly6arrezHedZmUzZgyh34FzWUNfngnQ4PoyRCH1OEjVp/M4LDCe3xI+etvfBOk5crVtl/QHneK6RHEsQyQskX5yxq8TmmgX+tlHctYmf4UwPqDAemQe8OOjtJiT2uFRS77F8tK1A+OgWA0g5rhemEBCKba+UzggoRbt84dCteqqQJTZ+5Oj54rj53sOFSziispBwCgJrYUANzRx0SIqMBiKcRP/jfwRZEf16N0EzjgX98/jkbHR1cQ1JL6AB8RzBJ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY3PR04CA0011.namprd04.prod.outlook.com (2603:10b6:a03:217::16)
 by PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Wed, 9 Apr
 2025 06:47:29 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::2a) by BY3PR04CA0011.outlook.office365.com
 (2603:10b6:a03:217::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Wed,
 9 Apr 2025 06:47:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Wed, 9 Apr 2025 06:47:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 01:47:26 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Apr 2025 01:47:24 -0500
To: <buildroot@buildroot.org>
Date: Wed, 9 Apr 2025 07:47:11 +0100
Message-ID: <20250409064711.3024937-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250409064711.3024937-1-neal.frager@amd.com>
References: <20250409064711.3024937-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|PH7PR12MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d3b40f2-d546-40e9-8f3a-08dd773265d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oZIMzrMPoNRStpVBf+jpBMAdndUYkO3iTbQDS51VK7lUvPbsukgaiu6W6f7P?=
 =?us-ascii?Q?dNASakgQ4IsU2+8dLv9DLEfTRHhXIpJKxy7q9iWPIvlem3FZiHAk4WOKEQof?=
 =?us-ascii?Q?2ouQr8iTCdFLWDBVoq3vP03W4OdKN36OIiZx7BIJZPqNXRbiY6NdZlbRSmu9?=
 =?us-ascii?Q?l1MEPnjQczt+gJgi04wVyCmeZecFmjnWZfaF7oC8z1qTdovDeExBMHv4dHOj?=
 =?us-ascii?Q?JfVoIh02LsN9CdK4dh6iQIS7RBA7C5xz1vWeHouRhPRmuXAAVGabc546I6wh?=
 =?us-ascii?Q?CtBwBgaFX7HEv1O2ERQwrY6VUx9piidskztsZDDmCKydl4Fm8qlPuHyZJkdG?=
 =?us-ascii?Q?Es0W58NH/0zUUaF/rgGmgpsosFu4oBbfd/JFbBfrJDkvyOrBbkj9c5+1zFvq?=
 =?us-ascii?Q?ykjEGeADrKFYFTZRJgJCtgIPwmoeSL/xobpqJySemG6XJkzSmtrcCMBciROU?=
 =?us-ascii?Q?CNAvC3OV4m9TT9bJ5AEKKUQnfY4fZqXYkjdRbhUaYIvsx7Xyy5it/QgQr4ER?=
 =?us-ascii?Q?DT1FgPjsi9K2xn+3OXZrEVV+mH5DrMNbFV7JXPbkMCeHPIbJ/rYKC8foZwhX?=
 =?us-ascii?Q?BKLOowywZGIfEoZwIaS1oeSyc0fuyamupOp3IL9sps3KkFkdQ7okIK5yTdw1?=
 =?us-ascii?Q?EFdIirKrytp3nsKF2GLZbFfwF0sKVLynkzdkiBemQETG213J/umC8PTiZelW?=
 =?us-ascii?Q?3VbjakuO6/xDAUsBt7mlGDevscxRGiQBq2rkTS5Jp5VE5xAsQY/Rb7M646VD?=
 =?us-ascii?Q?hl5+wXv8wufd6BoaWO27SYkEPFFiZwzK+nsyLI9QETRceRcINR8kQG1OISx3?=
 =?us-ascii?Q?aV3pXxE1W0t59aIbGtsOr0lWxKPznPumuzJmkDBdUo/xCLZd58EtZr6ihuc2?=
 =?us-ascii?Q?hlgucRuuaEssef+u8Qy6lumlcK1wyxysjxZT8zPKBJUTQNZ7Nib7FicIwM0U?=
 =?us-ascii?Q?AIppSW99aTuen/1D0LvcrxxlLhwf3JGXenuqjsPy/1RwOYDir2u65eqpVEnf?=
 =?us-ascii?Q?UTa6dIcmWnbGdgLcRky0EGk6ZNjdVTk0EJ0VTQ4znNcJxWEUReoyYBq5ltHk?=
 =?us-ascii?Q?uE6VQLFmwKFi2yC8gDjTy9OfyQSZ9a1QswBDxzryR3e/Lj8RDcsu8npkOcRj?=
 =?us-ascii?Q?08V6MUKf5W/qONJ+eMVrV6e7nAN58X89vt41WHvlxYgboulyxZNrDKGJzFxX?=
 =?us-ascii?Q?vnMZctu2WLz+XhuoYeI2B33EkB96QitgD4khDr5fMpUJWOWQ9LOG1SBSAjpl?=
 =?us-ascii?Q?6HIoSw21T44/4zxP/EDPZrLSBYGwpLGNZnTUa8TZT0cAmgGfQjNqZRl0QDSu?=
 =?us-ascii?Q?OcYps3579L1XBACMv5ENBM8kLAYCFx1uY3NblpssKQEful3tu9owO6FecYS0?=
 =?us-ascii?Q?Emo8R8ERWwd/V3L86TcAB5mPBDGYVxoJh98WBHhXNfNxwHC5tKRsCnCXUD00?=
 =?us-ascii?Q?zgeJePnw9KxYXsIowLFET4LOviN2GkWUyd0hC0DcC7+1gm8ZBIyMq2QT615u?=
 =?us-ascii?Q?SXfVLobfuQZqLi6CLBiyOooQN2W4G8r71zXUyIwZ5yTgpqKj1JQ1EQO7ZjF3?=
 =?us-ascii?Q?v0FrWtmxG1IlWINn81c=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 06:47:29.5742 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3b40f2-d546-40e9-8f3a-08dd773265d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8056
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3AilZfBCgmLUwMRbPBF+L78WhGqtWeo378CZTA8hVI=;
 b=5TwesgAzrRovY+5hBwkkjuHcPm2fz8L3D00U5IepdkfQdAwGMyg4A6BwnUq1vzR7moEMX8PMuepgnWtlqVVMvmuf/O0oxi0HVlAiMEhaM7drVLFjf5wGzQ4V47p+C3Z1aEF5tnYY0GKBoYWDk3saMLYZKvklGDJFQwIdrS+ENoE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=5TwesgAz
Subject: [Buildroot] [PATCH v5 3/3] configs/versal|zynqmp: migrate to
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
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com,
 arnout@mind.be
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
V3->V5:
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
index 2f40c210a8..f1b4e15bb5 100644
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
index af8bed884f..0b45bad945 100644
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
index afa606ec8c..acad9516ce 100644
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
index 261b73d6cf..69571a53bd 100644
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
index 2cf2b98aa5..b7b9691fc7 100644
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
index ef6a23f2a2..78d4a882c5 100644
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
index 762a54d968..5010aee2dc 100644
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
index 92e0d41736..7352148603 100644
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
index 51287fdffb..b8ec4c983e 100644
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
