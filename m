Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B83CFD316
	for <buildroot@archiver.kernel.org>; Sun, 23 Nov 2025 17:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E93F60E15;
	Sun, 23 Nov 2025 17:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n81Q_ccburbV; Sun, 23 Nov 2025 17:25:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42CF460711
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42CF460711;
	Sun, 23 Nov 2025 17:25:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 278CCE4
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6790682E19
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:25:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jzeNjK-NZYQ for <buildroot@buildroot.org>;
 Sun, 23 Nov 2025 17:25:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10c::1;
 helo=sa9pr02cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 650E882F11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 650E882F11
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10c::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 650E882F11
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:25:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v50Wp3wSfXOY71bz1o8nIvgQ7WHIp7lUmTJIDN+OVswBmWpchl4lYZBr++Rb3omiUq7Rk07wkP1YRMghuFK8yyUaqOuT/8IEXA0TwE+2oQwEcQz6VCUQsE5m18X2jOuN8dSO2Z5PBtZ0jAR3uAE3IkjqNgStVqrzjkuxsOlczMb2LEcHkZNhnJA+Qgz8v6/3vGi8icP57EZ/ufFw35hJ64iIJx2EAB+kszHPROsBfsRgseAwLAbrY8xPj//11xMLXLhBY9RaQxhJ/FwErx6FbzLBp+byW9tFaNTFHlgr2FiSeqbn5/IgBSmStwT8kM8io0bo7PLbrEIYq4MrqkPh7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igHNx79HAcOVWNxulK1H9ei99l7jXsyCCexzqqHuo5M=;
 b=uzBFldr70mXN5Qf4HH5zf4lGimYs9YMp2ubN6qkUcBoXFrjWMUTzBG4Kr57HKB/dQvDrzE8qRJnFA304X+2niKV9qInkvbOEwfAct+qUUFCuHC0z1kbJ9X81jEfNVnKCggeyd9HIzBCAEl51dM1h0AUSdIY2cbNvCsq0YBLrs9cbojgZNhcP1oTZdZq6SYOt62BILLuFTSXhsSk4os7Cun8gFN8MsyiXjbWr2hYFExIQPNS30LY16mqvVr3lh8BDmZXNpyG783Oy71D12FCnRml80afgoRjnZKKfUkI2R0wQSF8LEuHoB+82pynlIVXPy9TCwaJVwskxbBeFxjW3wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN2PR01CA0027.prod.exchangelabs.com (2603:10b6:208:10c::40) by
 CH1PPF931B95D07.namprd12.prod.outlook.com (2603:10b6:61f:fc00::619)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sun, 23 Nov
 2025 17:25:46 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:10c:cafe::f5) by MN2PR01CA0027.outlook.office365.com
 (2603:10b6:208:10c::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.16 via Frontend Transport; Sun,
 23 Nov 2025 17:24:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Sun, 23 Nov 2025 17:25:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Sun, 23 Nov
 2025 11:25:44 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 23 Nov
 2025 11:25:44 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sun, 23 Nov 2025 09:25:43 -0800
To: <buildroot@buildroot.org>
Date: Sun, 23 Nov 2025 17:25:29 +0000
Message-ID: <20251123172531.527134-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251123172531.527134-1-neal.frager@amd.com>
References: <20251123172531.527134-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|CH1PPF931B95D07:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b827290-14b5-4f07-5cc9-08de2ab555f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|376014|36860700013|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k8DZxuR8aWzkBCsRPdwM+zUIcpNIfyFQnSgN1/je0wBayklk5ev0XfB8Qm2j?=
 =?us-ascii?Q?ZIT3hNhxXMsrvdfiZFcNTlhc7vDtRkEfA+JI0OLvpUpN0KKXssV9VHsfxEui?=
 =?us-ascii?Q?VpJKKl2nVVNLMZzWY3dsJSmG4eqNZ9hZo7Kj3dN+CV7MM+kHjwESgrFNF406?=
 =?us-ascii?Q?TDBYH5Txnp5NuRIZ9gPPf5y7+ke5JWygt/HeFlCxsvex47kKhGvKmFKeF9Bd?=
 =?us-ascii?Q?9pU0es288EVuBOrQKWhJTelcI4mAWb2zw5cDRzRTzYTn0yZaR3ErqwitZ35j?=
 =?us-ascii?Q?KRXIhMksChSr0JbZJwLlraLa7gTXxmlctHs/+6VxpH7MzZt5aa++RWF1haKo?=
 =?us-ascii?Q?SYCv93oKjg76KWW6ISHKfjfcatXS9/gxsNdeI/UkDojP+wl7/emL6lWob6Pr?=
 =?us-ascii?Q?aPQ2450Dk9CTB1uZhByLWkcsTtYOj8ligZ2C2gOaGulCEtGsy1ZUcgWhegg6?=
 =?us-ascii?Q?UK9p504U9+dvznneWdQfO6oRmIqHDwZBkGk+u9rG7XKNy5l0pqRkxtg4GLg/?=
 =?us-ascii?Q?WGf7ANq3OChLEzzHOzOpzEoMnV+tSJ1UpHPtC1AlyP8znL3vvBWqdjwKueIz?=
 =?us-ascii?Q?PQNtqq+8JbkLnWoUMFb761+QzozH5mA8LZCiAfs6Co2l6uobYVtk0x+0MQjy?=
 =?us-ascii?Q?oTqaEHPaGRi/qbFJ7gXEtFRvdZjrpnvhSAdaPFKc24y6eqIHwyqfYCvCwCoP?=
 =?us-ascii?Q?uaYvsRcXD1UYSiMjcBfxaK1X7EwBKcPibKPJ/LdabSGRMko6w6VLwOt2jtij?=
 =?us-ascii?Q?UkDRd+F3FOWCdtH9SXlXug48SUJeQKstfTBMxXCMb8/zTo95y3WIJ2Apw9UR?=
 =?us-ascii?Q?4W+IFUa1gWo70RJNfT1F8rcBeQdNV6fvQ9ky0A8Toa/Gd0LEP86oApPF7epz?=
 =?us-ascii?Q?aZnVS/trHkOsxv0e0/U2T6b9OGL/g8e0076wyL/vjEtz4qzPR9qWRJxUTy40?=
 =?us-ascii?Q?T976uEDH+VTKrX04qSgPTYLep6A2fDNIEsNXc1aDn5MjZiZvrbDB0rChUkKO?=
 =?us-ascii?Q?m53xhMK3aaWP94wy/7na/BFB2OfcPPB8RdGgjR1luVhYrPZAPltpB+eV32Ln?=
 =?us-ascii?Q?OsmOM/dG+/+PB7XXtdiEn/1igGDcm8dPxQRydItiFSX/oYwOdAbfj4O9CrtW?=
 =?us-ascii?Q?D+ZIID1OsL51987W/L6fzfm3quw0hIPIBpFxwx971JxfWInDvDpL+onPke5m?=
 =?us-ascii?Q?zc6XqdhqBdtgADswCgJm0FCP5vvLL3ru3+UHyZEhn2q2J3RPSCDMSBZjjWVZ?=
 =?us-ascii?Q?E+2OjG4bPH1t6APt2FIyygzcyNivnyJ9s1oe68GuSOUQjV48rdYtPKpTYdYD?=
 =?us-ascii?Q?PwuX4qP0ykNvo1XaqGEfCLlNcoV7u8kDgv/sDua2MYOk/qdO1t9Q8kwW4vOU?=
 =?us-ascii?Q?oGqVQouWSWzRd1UXTqQzm2dAr4lUxmodW+JIFKd9Fk+uE8Ac9jVkcxpGbmGz?=
 =?us-ascii?Q?M6HmvZT2EKGJNJ03EowcloKXstsC4y5MUO6EG8dAOVk77HDJiSHVV3X57pBB?=
 =?us-ascii?Q?vgnhiFQ2/PfclDokcxuiVfvlpwrD/D7oAuQqDxrWxI6/3fCRc3iYfK8m09k+?=
 =?us-ascii?Q?9yElCUiZrc436ydddqMM/cQkUX9xYMYCXoHBcWpC?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2025 17:25:45.2214 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b827290-14b5-4f07-5cc9-08de2ab555f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF931B95D07
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igHNx79HAcOVWNxulK1H9ei99l7jXsyCCexzqqHuo5M=;
 b=yQk4itTZZl+9llIHoL12ekDYR3gIrZGbz3412sccSrlCZTwFPLeAuzob53sY4MxLuyJGmpoF0SNA7EDhYHywrnT1z8K9aCxgQ/4Q7ILClpq4LkE/JC8eTMOfidSRKuMTynJHeYcAimswP4ltRl/3JSW7TIBFHSw7RgtS4c7HrrY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=yQk4itTZ
Subject: [Buildroot] [PATCH v1 3/5] configs/zynq_*: bump to xilinx_v2025.2
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
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump zynq defconfigs to xilinx_v2025.2.

xilinx_v2025.2 includes the following software versions:
linux v6.12.40
uboot v2025.01
with all Xilinx downstream commits included with xilinx_v2025.2.

xilinx_v2025.2 was run tested on a zc702 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_microzed_defconfig | 4 ++--
 configs/zynq_zc702_defconfig    | 4 ++--
 configs/zynq_zc706_defconfig    | 4 ++--
 configs/zynq_zed_defconfig      | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index b7bf70efcd..d50e1ab818 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.40)/xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.1)/xlnx_rebase_v2025.01_2025.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.2)/xlnx_rebase_v2025.01_2025.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index f968ae1a08..a4afb61faa 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.40)/xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.1)/xlnx_rebase_v2025.01_2025.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.2)/xlnx_rebase_v2025.01_2025.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index fe40dc99aa..4f15fef813 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.40)/xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.1)/xlnx_rebase_v2025.01_2025.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.2)/xlnx_rebase_v2025.01_2025.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index 53653036ba..c08dabadd4 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.40)/xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.1)/xlnx_rebase_v2025.01_2025.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.2)/xlnx_rebase_v2025.01_2025.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
