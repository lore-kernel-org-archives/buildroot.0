Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B543C54FB3
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 13:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 135FE806F0;
	Mon,  2 Jun 2025 13:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GMpfZvHQ3nhc; Mon,  2 Jun 2025 13:51:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4400A806DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4400A806DE;
	Mon,  2 Jun 2025 13:51:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C44FD222
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 13:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA9E840AD7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 13:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jWUNRe_DMx9R for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 13:51:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::627;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB66B4044B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB66B4044B
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::627])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB66B4044B
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 13:51:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NoyzVfoDQQW7/mFpBoWkG+s+SOmW8XYjmHNTsQAwCmQHR35YkUPWjS2urIyzg8QsbtItHXAmyvcBR4h4c7XSM9o/z1UzxlEdxsqBe5ADqMln95Hyfp7jZn8CN9A6y6TCUHvpTVlan1kBXX/kXGTKcgMgFcmFCkB3ikU2XJxjLrLn4QrEGwFLn9pS0cIYQs+u8WtV/3VUdTx8BrT76JDKEBat47yW3ErbKJTjbEGv5bZW3E9RsLfgYVzIY0WcxblNmiIM+3votHmTFoyvUyhrh3x4IxvurBeLI1GRlMvOrqsWbMDLWmc1rik7EyMicP5aWbcYkhGIKdN49PyjAfAv5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVKlf/cVCtYKs1Nm2xTBit4ZSjjyQItnj8tvFSx6GSc=;
 b=Z1++p+q/GE7qLel8UFCRlynQ/YsSaLaAbsluuIz2fsfM1foTjYODWF23tfxHQb6/CfYB0aHljk9m3tFpqSaP4uj5b+IFZ3JoiGy7uw1GWGHXfjV4vxlZ+5eqZHhJmF7qeqCN7ERTp1TrXYO9vWhP8fhw6oHLVbfWhgNB6kjVwMoW+xYGzjpaF6ppf9kBy09eIAfcIHSlUgPkMm89ph6NtDRoQNTJs6GF8/ZrAziLZpUj6EZ+h3Mg0BYiDPeunHDx/l+GQp2Lk/IkZzefJqq7idcAX+AxYRxPz7IS6Afvod6Z1WIxQjSTS5CjS6FLWbMGAOPzOILD3JA2id9X9+iaXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR16CA0018.namprd16.prod.outlook.com (2603:10b6:610:50::28)
 by BY5PR12MB4147.namprd12.prod.outlook.com (2603:10b6:a03:205::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 13:51:09 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::d1) by CH2PR16CA0018.outlook.office365.com
 (2603:10b6:610:50::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.28 via Frontend Transport; Mon,
 2 Jun 2025 13:51:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Mon, 2 Jun 2025 13:51:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 08:51:06 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 2 Jun 2025 08:51:05 -0500
To: <buildroot@buildroot.org>
Date: Mon, 2 Jun 2025 14:50:55 +0100
Message-ID: <20250602135056.404165-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250602135056.404165-1-neal.frager@amd.com>
References: <20250602135056.404165-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|BY5PR12MB4147:EE_
X-MS-Office365-Filtering-Correlation-Id: a53d6203-bd90-4dda-1d70-08dda1dc8715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4pqvRH2chM/QLl4VWJYluzib0dJ+lHT0uFhixRmoDzKRVmTx34HWnorC0W59?=
 =?us-ascii?Q?vgMx/SBQJEuJCTpLWBMXm1wUpIVca6JOLWuXlfU83ZASmfsKjbr3m3V/fQC5?=
 =?us-ascii?Q?yyw8BzKWBgtH/SAbLuQsi67Bvc9Y//7PiTn+Q/ItpTQYEaBhFMom+GWJT0CE?=
 =?us-ascii?Q?QH9i+AQOt+A24z/T749Axyk3vMzx1dgMdkyVEhvueSfGo9Y9+UmbrjQ+6hJQ?=
 =?us-ascii?Q?ByazGBWOHhJ/jDlFtEPxMEj7lehdM7FE7y15k2bXb/cZnaknuHA0bAwKMjtF?=
 =?us-ascii?Q?2CmlfOHqfMlJdkuiUpASk6eQKt208pIzY894q1SlIa3qgUtTg6emeHb1f/Bn?=
 =?us-ascii?Q?yLcI6UCX1uD2nEnOgE/1kQwTv+c1dZZxIQR3QEK1u9MHsGrx2GnJQ1h+bTUW?=
 =?us-ascii?Q?7nw57xky1wwhzM6xWk5zE6Y9S2Z5+b3vRm2kleCZDznyAAn1LbpeTKTg5V6G?=
 =?us-ascii?Q?p6o8lGTn9CD2OpNDuCJ/BEuSBx24ZiC/BuAlcUIQ45pANIH+ouRB4vhYO+VA?=
 =?us-ascii?Q?DWIVHZC2CeVbdJXz0q2ZFz/ZPA8u/FMR6a3lcjvVn8BBw37v7c1LcLhPkxbk?=
 =?us-ascii?Q?NKXZmidww0qMafdIDiSrIFAY/0Iag1+hnxoiJaglO15v5s4u2C7ceRd9e2Zr?=
 =?us-ascii?Q?H6KG/diYYrkn1UH+ytxOvbXAOe4XeHjWXDCx10oH1MObtAeaxzHuoFSLdta9?=
 =?us-ascii?Q?61X/FYhItPUaHAI2dQ5o3hYyq7KfkT8LoYjZwBqKPwpQOtsfQLN7+Ev/VUAp?=
 =?us-ascii?Q?SbIypHHi+3syQV1dYSx/RqzcjZPoflnWL6pdFsHic6/fA+UAnTDpoKBh+RTw?=
 =?us-ascii?Q?YuaJ81akrgW+QtZuUYeSmjD88H3Vr4bhuzOpeAG8CA3SgBs8AzzshhqRYToN?=
 =?us-ascii?Q?PxVYxKULmNM8h1Gm8Q3nVEBXTY9EAlqWg2IztrKiSoAGqf5fsjvOJVnSJIMC?=
 =?us-ascii?Q?7jCB/D0r0WqoXx3jHU/H/HZ6Qva5eFVevRrVg73APzOsRFI/55ayWZZLQce5?=
 =?us-ascii?Q?ME44y1StUcThmXonLiez/3YZCDZJCRRN5izTUN3OAklDQIX659VgmbZ1hF7e?=
 =?us-ascii?Q?OMrmTqLlPoCy4enhQnRipSn6+CN/2MvatAiKNFPjjOwiEQO4Pl1cRbleoB3B?=
 =?us-ascii?Q?7Hi7S1r0wdOrT64uVlkUJM1xmQqKFd8P/MFNb+DzEXoBk/61wz8xB+lek/GX?=
 =?us-ascii?Q?iwJM87aHMu5SGxRN6ds0oq5ncRV5nQmOV/scitrLWJ/QoJD7JPPPSKrH4xii?=
 =?us-ascii?Q?pt97FvC5BvXmXa6xy/8JCnp82ZhzkAm7xh0lLw9tnpSwVaVgXFscB36BB5Dr?=
 =?us-ascii?Q?RshF0ku5I4a9qK5Y0EjXVyhuZuyO615yx5wOScQJ1EK9ui69Jvc0MaJTmC7n?=
 =?us-ascii?Q?r4/Iz5cdVU3AmmAOh4EJeO4bPHxoZXE0hWyEwE24j+l1TSQuq9foyj80ceUK?=
 =?us-ascii?Q?wWLqsNlXwL8Mmmstklf48lEuQxlIHQLF49GAT5cFJdAnFQ4aw7dFjnjXICLm?=
 =?us-ascii?Q?j3D1bIzpnFpXg70rjFGRSPvUg/RmigaZ6PUib+Tqz79hTksiQJLhWbTxiE4r?=
 =?us-ascii?Q?zAu/ssoqHFX+ejL29/0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 13:51:08.6863 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a53d6203-bd90-4dda-1d70-08dda1dc8715
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4147
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVKlf/cVCtYKs1Nm2xTBit4ZSjjyQItnj8tvFSx6GSc=;
 b=I/KZAGIooYy1eVOgJaHkCuozOG1xMeEZKg4q3PsY8R8KwElUSFVnGAZZaQkhsjstpC5X/1VavDJG1tdB01+U1nji/lFOxX+mvy8DKAQJG6CqPsa0YQErX5Sfz2IWPcQDnghlrU5XXUItbSyUxtC0R6Z04u9YPJGXR0GPwa7gIw0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=I/KZAGIo
Subject: [Buildroot] [PATCH v1 4/5] configs/zynq_microzed_defconfig: bump to
 xilinx-v2025.1
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

This patch bumps the zynq_microzed_defconfig to xilinx-v2025.1 which includes
the following updates:

- Linux v6.12.10
- U-Boot v2025.01

The xilinx-v2025.1 Linux 6.12.10 release tag requires a patch to fix a
leak of the Kconfig CONFIG_XILINX_AIE, so this patch is now included.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_microzed_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index f9be297b99..404e09b7be 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -2,14 +2,14 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.1)/xlnx_rebase_v6.12_LTS_2025.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -22,7 +22,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.1)/xlnx_rebase_v2025.01_2025.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
