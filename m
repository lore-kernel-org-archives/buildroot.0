Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0DCD4415E
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 13:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD57C85660;
	Tue, 19 Nov 2024 13:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qiWneYW3cKOh; Tue, 19 Nov 2024 13:46:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFEB285684
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFEB285684;
	Tue, 19 Nov 2024 13:46:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FF8627EB
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 13:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F9F68568E
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 13:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S79ccWQ_HgVt for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 13:46:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::61e;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7B93E85685
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B93E85685
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::61e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B93E85685
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 13:46:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fX9PZ1NBz0NTDnbgwIafoypgKbuyteH0CzmwC9n7sC4j8caNVwVhWTcWj94HO0nDS1J6FEijh2Jh5CcoCyJpV6QKNv37s0asvbDVOQrdJJeeEWiF1M7XiAv7FPc4qivJs0fSd/4dRB9pMnhnXBjHvmaYxmqCSE4+Uidt1g5+9/0WgQKBbjFFiEY6DvulBWBBOUEwdB47lyLZJYPZ6KDAX3+IwrGp7la2eD0djCswBcxHUBc/ZeSaNL2j2edQZQGBiazScMdUjL4Io4M12JKPx7CmcW2JYUppeE8f6yIlVxzevNbUMLlIRZ2lG2pWSrQx87Tz0p1fU+X6EuE4K5bQkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IR7TT2xYwlRXadBugNoM8+iKc8YjX51ofrUWlSxo5MA=;
 b=DEpRpc+dFTq6MR057m7P9tj1eWhamNLfZrz23bgHNcsYAWdGiFFBdc+fYH2LCAHLN8YXYO55glb/eSAFKhcC/wdO2wezWAnbndCjpy3nto7IrHFsEVSBxqgdZXOnzrIEvUp5f64geuo8Q/7irFsARn9Blo6c0zPZ/uJ8j13AGwjGw1oD5TwpTyi5+x1BxInhil/xSU0gYoFyD4o83md9bi2ForTkimmwVpCZ0sP6zv/H4Dujj17wCeNF/S9/BlDSELkgNdn3Iw2/5MiQXCQ4Gk0flBttbUObjJglmWT0hkaIap+KZVqzs/o8X39u+1PiXTJX/FiDSsmP+okwsqf1zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR03CA0287.namprd03.prod.outlook.com (2603:10b6:303:b5::22)
 by SA1PR12MB9471.namprd12.prod.outlook.com (2603:10b6:806:458::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 13:46:24 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:303:b5:cafe::49) by MW4PR03CA0287.outlook.office365.com
 (2603:10b6:303:b5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23 via Frontend
 Transport; Tue, 19 Nov 2024 13:46:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 13:46:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Nov
 2024 07:46:18 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Nov
 2024 07:46:17 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 19 Nov 2024 07:46:16 -0600
To: <buildroot@buildroot.org>
Date: Tue, 19 Nov 2024 13:45:59 +0000
Message-ID: <20241119134559.3891625-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241119134559.3891625-1-neal.frager@amd.com>
References: <20241119134559.3891625-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|SA1PR12MB9471:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c3ef79-b3cd-4117-16ad-08dd08a08e63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7KAjXtoNNmZ5W/I24dOgqe9r0NuM8QaeKwHLkwLgtfAkcCHymena6tncblob?=
 =?us-ascii?Q?IdLHu6WmzsmFDu2WZg0J3Gtn55F0FrGx+wpnuIMsgMsJxPySAKq4z4/t0NFS?=
 =?us-ascii?Q?cSMyMXR0lrgyYD/2RMP2EqGoGO+Af0ERBh7IftbXOOOLMF4LEtMqNKGB1Zmh?=
 =?us-ascii?Q?ax4lTBuj7GigcWoTQqBpCsRL980MnQnZI97vEmJYYT0SL1+62EnTpzn62SB/?=
 =?us-ascii?Q?8ysuos8k97lXi5xG8bnxl0EGW39Qn6XYcj+ZEgOrz5ntY8m/nPXQaPieR+aQ?=
 =?us-ascii?Q?VXLPD6UBEPYQ2nqIt0wfmpnkxE++2DKNWjrobyJ+6UFQ2RwdQmvesPrMo32/?=
 =?us-ascii?Q?N9Lx+IeAFPneT2dSb9aJLEEGjaEZ9asAnzfeuSVSfTFM2+vCuX2rMiq6LeOH?=
 =?us-ascii?Q?X4ltKLYkK7JOSzrb3zdZuI8piwmhIYljhiqc7LKNuvkZ2UlJezx0IXfO4Qff?=
 =?us-ascii?Q?yf/q20bl27BvutSLUa0HboZMyclPyX05w9vRqzp+q7HmgbYAwh6UDk1+rLAM?=
 =?us-ascii?Q?t3LugU8jC1STcUD2KEhTSinpDuZvr8XV4QsvDPkPwRaY8hkwOaRZ+O0huGVz?=
 =?us-ascii?Q?1R6mLslMsFPDGb30pDTxxDjif4+eGjI+J7ID+AXgnMxWKk2G2TyA4TFlEkcQ?=
 =?us-ascii?Q?kD7aHROMJgeREnbJpZ1Hx31Es/HcRfsrkAZThT8Ovj8QCfeqzusqMbAZMn2N?=
 =?us-ascii?Q?B2uyPpAZc+i+OgbGEcxCVBOKwGmTyY3yVVuLgOdDjATl11DMMRuY7I3nySPS?=
 =?us-ascii?Q?pUA9vRsPRVv7LIs1kha4HB6a/DR+JLBa3MezVHMtNUtIcyMa/7K7bvlQJ6mY?=
 =?us-ascii?Q?jmSJkDHUf9bm19ONhNPRaIw1iCnq2AO4jaWqVcWssUvsM+H4YfbJcsbKpbr+?=
 =?us-ascii?Q?otdltBOOnwOD46gdSqzZzyGhNh9fxkwGFSVZqGPxWNp3eBSNrfY1OopChTVT?=
 =?us-ascii?Q?bmBCkZrQV/9uYQBzRhoBZe2SHdeXQv2w1nnkA6wcRruXCkgISr0c4ne4Q4jx?=
 =?us-ascii?Q?uzY7ws8nkdpigGlALf7BbCvgT0/xB6vBw6Pj5OSCms5J6c2iP0bc9Br4cMYQ?=
 =?us-ascii?Q?51X+jyCLBw1f8ffSIJJF4fJjFHOiSBhLp6D9Q/LjhCO4ta/7tirXcLWw6iaJ?=
 =?us-ascii?Q?cc+XuqJV5Qfgxi4U/9VPRK0Q/uOCt5+flUseQm2H64x8QGdB1nOXAoqrzS6m?=
 =?us-ascii?Q?7zDKBrRFs4HkfMmrJMW0s4wS+5/DUKjWTecF24AXjnzPvWsKRhjHoUM5fjTG?=
 =?us-ascii?Q?hF1CYcQTxak+zkulHk8NsfBXyQ9vp4bFy2jnV4hXqAE2U5g61y3HriUVMouz?=
 =?us-ascii?Q?GmhpyGamJQVbK68QPXJFppelCthyqXLlhCH6J+xSyDllwy6HzDTnUaXNbEGo?=
 =?us-ascii?Q?cFAcQ5yOl+0PuW5jtTrVZ41JCPRGqKtd2zoJxfK2AHXi6cKxFn2erU2acvoN?=
 =?us-ascii?Q?WkWmmB8MitzlDdvpLqXm5EkqwoVNyj32?=
X-Forefront-Antispam-Report: CIP:165.204.84.12; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:atlvpn-bp.amd.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 13:46:23.1720 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c3ef79-b3cd-4117-16ad-08dd08a08e63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.12];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9471
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IR7TT2xYwlRXadBugNoM8+iKc8YjX51ofrUWlSxo5MA=;
 b=ANjDzCn1dXmF6l+00PbZhxTMyDrmrSH3FZQtUHd3t8PmD+1dbfoywv7QnZ8gR7u3wWBK40oKxVktjq9fIGwt2G5nmNrlt3BLNkrX65SDdC9vrYOQS6/ZFqPBpU/e1JvUR9bzi/AD5LeBvqgolZ4lh5FDos3TJhznaIGSCqgs5Fc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ANjDzCn1
Subject: [Buildroot] [PATCH v1 5/5] configs/zynq_zed_defconfig: bump to
 xilinx-v2024.2
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
Cc: martin.chabot@gmail.com, brandon.maier@collins.com, ju.o@free.fr,
 juju@cotds.org, michal.simek@amd.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynq_zed_defconfig to xilinx-v2024.2 which includes
the following updates:

- Linux v6.6.40
- U-Boot v2024.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zed_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index 392576a062..fb0f52a0cd 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -21,7 +21,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
