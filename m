Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5599C5B552
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 15:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 658E961025;
	Tue, 10 Jun 2025 15:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MeVN6iFL1_aX; Tue, 10 Jun 2025 15:10:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B29060F97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B29060F97;
	Tue, 10 Jun 2025 15:10:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB2F71F2
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 15:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2C8B60FCA
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 15:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8RCET0egMbDV for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 15:10:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::62e;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC1B46074D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC1B46074D
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC1B46074D
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 15:10:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMvpz85vUzuNANrKT/UOv3eRfey3fyr8cBAbkbjpeJKuGF7QQv1Afx6Bp70dN+mnIcwuNRIDLq/qmnWdV2jWRaziNfU0aFm/ocd0zN+3Tnhm4t/7STLhWGhJgEfapVnl7WLxFfiaFlP2sCdPb+fp0NY3CzyPT9Xj0aQ4E2K9/Zc5b/D4+qd9oFTGCjtAeYuniUvX3dLdu2VMb+f69ssFPeZLHHjSxAcoQZpOA7Qm9ppr3rSsqK70XnDD/YDCx8cOaYX8AHDdgf3KFi8ClrjufAgb5PvVYzL5iJcOAzQUbEs353wj4xp7OGd/iXzOUFMBspUTMXnuRiOQmGUmVAg5yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PXoVOskqykq6kUqqh5rTu09k3zCSZJ8ltGb/rHPJFU=;
 b=bhD8R5gfn/Vq9ic9CqP+W48cMilk1Sjl4OGvXe4axknGCFT1hgy7wUpIl93ziCDH/KZVgOaM+2NT1oCCu4BEwra32PQ1O9kHsSJpEbN5IiurlogH4vrHGGWKaZBGrlSjhUBOQcqijebY6DgDeCo/ErwycOPAWb22Zrvq3y+pPWtOjdPlgczODSXVfHEgWVu9eEcthg5TOIIW7FwFmEkRWKJnf7VS8c8FsRei1WKC9ar+8f8sIgTYL3Hi4ohBgoyUAQZpjRS8/yPTKxh1VKSBf/SIBiyz1hxcrMmVN5fGnR2zn/Qqfd4wa81tth3wollHqW1sOsFpp8tV6O+znmddeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY5PR17CA0005.namprd17.prod.outlook.com (2603:10b6:a03:1b8::18)
 by CH1PR12MB9574.namprd12.prod.outlook.com (2603:10b6:610:2ae::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.41; Tue, 10 Jun
 2025 15:10:03 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::53) by BY5PR17CA0005.outlook.office365.com
 (2603:10b6:a03:1b8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Tue,
 10 Jun 2025 15:10:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 15:10:02 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 10:10:01 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Jun 2025 10:09:59 -0500
To: <buildroot@buildroot.org>
Date: Tue, 10 Jun 2025 16:09:57 +0100
Message-ID: <20250610150957.39838-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|CH1PR12MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef1388a-05be-4640-b8a1-08dda830e003
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dmO1XlRgNMhY40wDpMWVoGDzwVQ4ZTsj4+JDkMBNJGi5+OMLsjaVY3gP984j?=
 =?us-ascii?Q?BEXeSnqpWt1pXHAVJVITKbuSmGN7OB5kwcjotTuGmtnmvv7EVFlUY4k40eWb?=
 =?us-ascii?Q?AGjUq0pEk4pW2a83NtM1ZchDOxxUTImMTXyrnckU1/sC8pqxwp3xdAifjQNz?=
 =?us-ascii?Q?cIMJnbkzeNRXMXpLwQoDq6t+GTX7qjWRhCFuEn54M+1bl9SH0vCe9Qs6/5hp?=
 =?us-ascii?Q?olr2rNKjwR3fv8EHBo+DnKg6vO+G8p0ag3ig2DqVpRg18rZvwnzCNJvEt4dG?=
 =?us-ascii?Q?8LRIRsh6vzJcba51NAISWZYtw3wA7MKa/Y8E+NdAexlcO+Jb98jpyDb+4Ddf?=
 =?us-ascii?Q?onU3Par++Qi2YA3nxfG6R7I3uyfzuvXq5ooRBXr6CgiGFybR8AB2hzU/hKRs?=
 =?us-ascii?Q?Vvm6AO2oxAJZrnli0BBxAI21gajO2go1ZgytdWLEc8CmKAoas6T92ors4/Py?=
 =?us-ascii?Q?X/t7f3xNbnzkC7/M31lB59YZPmthCu/8uA+A+QCLWFwvF+h8jHl5WTyLkGaG?=
 =?us-ascii?Q?QmwQdDQ0ITKNYEpSMepI5ZBImHkzSEIp20hfy10UrWCQ6zoKsfE/jTqvMyTZ?=
 =?us-ascii?Q?zvUSecXY/1jyIdjEwtlenbqIRrDVbcFuV7541jZZ1MzUXTBqIelpIYq/VDlM?=
 =?us-ascii?Q?1SHkTsdlsIFWSneLUh9apeVUSbEEXFC5x7iOR1pGzLTu9NHPEj3vukuGWkSR?=
 =?us-ascii?Q?HawOEkQ4AjjduQe5KCF+WvBw3sKa9VWLIy+8fNtZGnWeBthyUD56qL/syy3g?=
 =?us-ascii?Q?7G5NDPIjYx8T6EBjy6GSPZEVzHLpN2fxusatSAY3pFOgikVdGUup1THmAjJ3?=
 =?us-ascii?Q?7ty7e150Ofjk0qiV9P9HG/+e9TAB44FvCdTeECxc5o5G8FRRbkH8WDkkZ3Db?=
 =?us-ascii?Q?LlU/DHtgCQOEk+pVmyDCZtJwvf62w+VHe2mjED26+7zP8hzkxoXsl8MbjobR?=
 =?us-ascii?Q?/DuYRTXyRcsQCrVpZyaNI+pm0xY5en0VTulJZeYrqLvQWV56DdgjW6KGHFX8?=
 =?us-ascii?Q?iNN0brLaSDssCOAZEPA9qa2MiiyNIkI9darZJDgzRsTdWRlnvs0JEEzrpdHu?=
 =?us-ascii?Q?wbwc55b4jAy4W31DU6TYptPYnkKT26Jlhg1lm5BbSiRuCe5tnKNde5UtsjHW?=
 =?us-ascii?Q?F3PBrHLZRItDraqPVjM88EXuPichDQncYRurqq+tcBmt78p6y+7ptHNd5R3j?=
 =?us-ascii?Q?e5OrpLfPk2k+vAICFtIusR65DX5BVcnKbWXKWqVfItDPWg2lx1XXMXvpFbC9?=
 =?us-ascii?Q?HIJSQI6ZcIZ1v0LKWVIYQux8GiY9knNuWxM24aR/RW0YfPiHXt/s1yTOB7CT?=
 =?us-ascii?Q?kbStX1FQTzWXtcK3ADvp2WJ3pTJi0lpn3KvGqPC+xZe3++oUgxCsYNscQXBb?=
 =?us-ascii?Q?X7csLNuVFiovftsneg0FRvyqpEDM+bkHTDHbbewsfRnGtbW3hKvwaNQLj1mD?=
 =?us-ascii?Q?tOWuQo6XbfsIklkvhfssQAR9urzTCg6eNU+lXDMQtg0W8vktmSZhtnr5f83u?=
 =?us-ascii?Q?u+07uOiEkm7h6wQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 15:10:02.5719 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef1388a-05be-4640-b8a1-08dda830e003
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9574
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PXoVOskqykq6kUqqh5rTu09k3zCSZJ8ltGb/rHPJFU=;
 b=1bCSKT1KwEko3A0jumQAeT609oUMZOzPi7UsRrINsVkJ47oPn8twhRzRjy9KIIAyab8RKvcue+YkG7asIb8bzZ9cNo6OPELypBuB/r2Cns3uKImYLs7XRuItXNMhTrilz7SPGP35qO0y9i5xBKQXj1GLP+IUJh7W+OTee62jyGA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=1bCSKT1K
Subject: [Buildroot] [PATCH v2 1/1] configs/zynq_*: move to external Bootlin
 stable toolchain
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

This moves the zynq defconfigs to the Bootlin glibc stable external toolchain
as per[1].

[1]: https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

This patch has been run-tested on the zc702 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- fixed 'toolchain' typo in commit message
---
This patch is to be applied to the next branch.
---
 configs/zynq_microzed_defconfig | 4 +++-
 configs/zynq_zc702_defconfig    | 4 +++-
 configs/zynq_zc706_defconfig    | 4 +++-
 configs/zynq_zed_defconfig      | 4 +++-
 4 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 404e09b7be..fb324b5a3c 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -2,7 +2,9 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index ac3304f293..f908a39a7f 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -2,7 +2,9 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 600b521fac..7d7f468805 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -2,7 +2,9 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index ea15865535..1a5d48e424 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -2,7 +2,9 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
