Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDA7C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 15:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AC93842F5;
	Fri,  9 Aug 2024 15:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UAM5cg1uqiB0; Fri,  9 Aug 2024 15:55:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71A70841C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71A70841C7;
	Fri,  9 Aug 2024 15:55:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 314CD1BF5DF
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 15:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1ED3F61318
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 15:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3ah5vcGbjF3 for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 15:55:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2408::616;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B457F606FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B457F606FA
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::616])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B457F606FA
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 15:55:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=juBpVINMp5WY46XNtfMY+aK0qsbExqchxxOvbWE1oKlgZDZwNr5UAcT9kHLNjN7Qe2jwUvEZM+TvFUucZioYDT5unqQkGG/tcjIknP8ue6JBidAQE7wCjJLTUZbDak2AWVWBhNEnLzNR/VQMGEgjFVpZJtrnUj2HQK9lIyPtd5ZygvsKQijjrCtdjUq4Z7tByI+RUEHxHbmo+klS39dGqBLrc7aU5SI7vQPRrMIClLDeWLyQmlEyZ0AENkvnogm9rhkVNIG2HtPJF2nXegq1aVnoEwdpGzrrFBDlfrHlaWXqAJxeRoS0jSNq5SXkGYz+7fL4keBPD5DeKa11E6BgBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jf72Tv9eMrE0kJiiIehVPwLFxWiBnLR4GDR6zwgljUY=;
 b=Ywz6sisD4ICjCNUIROa5qBk4EyHX9lJ6qV+w2FUN90RTcufqU4QAF5rqXcLMvWivJN+RvJryFU1UZzPHYR2xeXjLNXFeCupQLbGjqLVF8lQdgolH+IAgO/oKvvayGU+8ip7IWAlXLP4GYCKVrnQeA+jlvhTOEFFFkbQkend1iQ3EclS651a3PpJ9DW4Xrz449uXsJDCTACkQKzc/QYr3ev0YxPUjZ7EtzvgHhY8jLndDuW22LOD80rsEYqRXNeNDHOlY90DHoww7VjfzmrU8+3lrfxAOWYKcfxWCEjcQxUQn4OIZNi/hhOyVjJKx5Q7HOXpJo00dsqwprLjVbjAWvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR13CA0004.namprd13.prod.outlook.com (2603:10b6:610:b1::9)
 by SJ2PR12MB9211.namprd12.prod.outlook.com (2603:10b6:a03:55e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 15:55:35 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::2e) by CH0PR13CA0004.outlook.office365.com
 (2603:10b6:610:b1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.17 via Frontend
 Transport; Fri, 9 Aug 2024 15:55:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Fri, 9 Aug 2024 15:55:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 Aug
 2024 10:55:33 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 9 Aug 2024 10:55:32 -0500
To: <buildroot@buildroot.org>
Date: Fri, 9 Aug 2024 16:55:27 +0100
Message-ID: <20240809155527.3821320-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|SJ2PR12MB9211:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ddcd76f-0c51-447b-b23a-08dcb88bb408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SBshJx/Ivn9FVE2ZI0GGWJQq95pC3Et5oU5iMT7mYUSbhg6VOA7CfLl6sEA/?=
 =?us-ascii?Q?OAA9qHZc/RsSXTq3FYD4WKDzEwChWomIKpRoPum2ip6+69IfMkXQLI3g1u4H?=
 =?us-ascii?Q?aBhEn6hRltU7IsuzTyD9hhwVmDzQdc8TQ9b03LBVjRxDvjbgEbxRGzfXRXlU?=
 =?us-ascii?Q?W+sUGUr9XeyI5Dkhi2VfEbxUz8sY8KZowKPD/8btv9GXDIPBw0tSuQuKzzZz?=
 =?us-ascii?Q?NceidJL0pv1HMNulz4jC2YAQVoxpiQVC+rY7N3oP5dZQYqEI2GLUIZGM8Krr?=
 =?us-ascii?Q?k7fYuRjIzImyGdHPqz9id0Iq2kSJQtwaYmQ8H2Fzd++nElYw3k6puenhVvCQ?=
 =?us-ascii?Q?or1TEruXzg3FpWPJUrqmWhj1QsmoAmAPdYai/4hAjIeaMyyd/M7yZXAEt3T7?=
 =?us-ascii?Q?yLRPt+Ab4y5Pg30T41+VwEewVeGKSCLkI9R9+lsuOUP5b6MLjpl+SyvO0laL?=
 =?us-ascii?Q?WGLUH5ftEXR1SZ8ngiIAvmg40YEhb9S5/gzgSWGz41meApkXuV8fEYrcfRJE?=
 =?us-ascii?Q?P0KkFcuDUl66+ZpdsjqDoNriWmNuG6hYDbPNxHJDbjKUzP1IIoKkWY8zhiLg?=
 =?us-ascii?Q?B9hK5fFoD3yjFys94+1xFICLR+r54N74l/5nSpnZu4frmFAab6WphrXAW7k4?=
 =?us-ascii?Q?diNya/FcbAsRqROgkZwephh6uQBakqZ1PtfMSnK4Y+aIkeREft6lffqBVh+C?=
 =?us-ascii?Q?JWstpdklwz+VLEWEJti1yEtlbuPCT9073171ZN9qpN+epnE3adfFl4jsVhhB?=
 =?us-ascii?Q?KkSvHwMm+sklNsZtJKyWOl4JI1ByTldPexw1vA+Q9/w24tUM2npopSyRGAym?=
 =?us-ascii?Q?FJy1xRma0SRUR77e/Q4kPfx0txrDB4Mo9eVZIS3Ylk2i5rcXVEUXEst3kXw5?=
 =?us-ascii?Q?L1LcBW5BgEMTvpT0sIVaHGvAqjbyqMLkdKgdz+CNohcuejjHSgtqmwNokk0f?=
 =?us-ascii?Q?3W2/auJB95dKyA+dcv/GyaOOvWf26aCS0THeG61nM18IFrUdhBjXsI3Jo5da?=
 =?us-ascii?Q?/poDtxf/TK0vo5miRq6kZ82oG4n5zzClibUq+oer1Wa6+oOpp9LH5u0QR+RL?=
 =?us-ascii?Q?QIt7Wcp9oLRD4Zlr/h01uKrwRl7Esa/4QEKHEQAjxg9VyWjVvg052TUkB+WK?=
 =?us-ascii?Q?nXC5huiQ9eT9sV5sSpJMwmNzaOEW8yaOnV6tblzTvfc7sP+FjizM2604YpUl?=
 =?us-ascii?Q?XBYSv5jHJByFRU34xWuN+r/AAOjc+4iGweVCkT1sW7Ps1dCe5bpIB/MByDDc?=
 =?us-ascii?Q?SfxZ8004Pqic5GjiDNBT95Iq3qZau8oiypWDDZbyh5jU3wfx6NkpxRO444wp?=
 =?us-ascii?Q?8P0n6Hk954y/aU+7AZltQprDJTN+Emo/hlvJxIp7JYnURtY4U74C9+IOFLO5?=
 =?us-ascii?Q?fiZPbgANsOk3Jn2MDCSnyDbMAhpgoe67jNzRfi5SKV94BLc0b4e1pL8Eem7H?=
 =?us-ascii?Q?TWAlVUg+SStJKTDvKvoOSrK1Litr/egxDPK4dqSInB3PurVNoosfURAvHm3I?=
 =?us-ascii?Q?K9x3ZPb0WRk51tc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 15:55:33.9264 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ddcd76f-0c51-447b-b23a-08dcb88bb408
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9211
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jf72Tv9eMrE0kJiiIehVPwLFxWiBnLR4GDR6zwgljUY=;
 b=Jt/gJsxgrjank3URWFYOAGK5yeWqIN0Qw6ZjLrLcyIIgMzu0ux9k6uHH5W2ag3lX40IY4FKW3d/dk7FWum/gnCwDQU56o6Q9Db0MjTkub4OoTwlL2elrSVpH5V8PVQ18l0fnhzmESlIeookVr/YQs8zAKyKehogDO24xrKZ+te4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Jt/gJsxg
Subject: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu106_defconfig: move to
 board rev1.0
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate the zynqmp_zcu106_defconfig to rev1.0 ddr memory, since all new boards
will be using the rev1.0 ddr memory.

This patch also adds documentation in the board/zynqmp/readme.txt explaining
the issue related to the change in ddr memory.  Should users not see anything
printing from the board during boot, the most likely issue is that the board
has the original ddr memory and the u-boot device tree needs to be configured
accordingly to revA.

Original DDR Memory:
BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA"

More information regarding this issue can be found here:
https://support.xilinx.com/s/article/71961?language=en_US

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/readme.txt         | 26 ++++++++++++++++++++++++++
 configs/zynqmp_zcu106_defconfig |  2 +-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/board/zynqmp/readme.txt b/board/zynqmp/readme.txt
index 3a8a9b03ac..3f1b3a80c2 100644
--- a/board/zynqmp/readme.txt
+++ b/board/zynqmp/readme.txt
@@ -64,3 +64,29 @@ card:
 Where 'sdX' is the device node of the SD.
 
 Eject the SD card, insert it in the board, and power it up.
+
+==============
+Important Note
+==============
+
+The DDR memory on the original ZCU102 and ZCU106 boards is EOL.
+The Buildroot defconfigs for these boards use the new DDR memory
+which is configured by the u-boot spl initialization with the
+Buildroot config options below.
+
+New DDR Memories:
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
+
+If nothing is printing upon boot, most likely it is because the
+board has the original DDR memories.  To fix the problem, modify
+the Buildroot defconfig file to use the u-boot spl initialization
+for the original DDR memory using the config below for the target
+board.
+
+Original DDR Memories:
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-revA"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA"
+
+For more information on this issue:
+https://support.xilinx.com/s/article/71961?language=en_US
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index c10ec70ed8..970ed40d2c 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -23,7 +23,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
