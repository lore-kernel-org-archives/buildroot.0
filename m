Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B33D4415F
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 13:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C16F85675;
	Tue, 19 Nov 2024 13:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id urNN-XcSjf0K; Tue, 19 Nov 2024 13:46:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECBA48567B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECBA48567B;
	Tue, 19 Nov 2024 13:46:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C21027EB
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 13:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6920D43578
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 13:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X1nDNLc7uaHG for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 13:46:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::61f;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6656743573
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6656743573
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::61f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6656743573
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 13:46:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fwxC9rYEyYFk4/U5ePqogLhnN8mnY7H1CHPSvwlu+RW5mgrnYPIY4jPsD5l52/It91bx8O3uE1rnm7I7JOKtVguoGbzhDOcFOnG1amW+lFA36jYfEHWWi0zo3zQ8XQSCivkl6fgB3MJUA7h1wWRknUkrh0CN1UX7S/Bl9WqVJqwOIG9jzXGnk76OMoqcLfl75OPUzJvJfAqRiZtHRbE3Hk7kKgrKnel/zXEueFybcTTNJRgb0KcRykdfhS5UNiTOuvsYTHBcVbQ/+DeMixN+DE5O1/TLHWkVtaI28zjeLvLSuScQCb6/HutHN1upDY6Ab3zNKkO6/ELZoOuFkm1B3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/Brrl4ZELDVar5pghEiiM5F5wXrbzk9KzD5rMAVwVc=;
 b=wZMHMBJU3YYjPTtlxrQagx45jF5DkpxDw/TJ2bHwBL+wxB/nXT3ANvSl+lZcFTdTK4y9r8f/36stcAZdVDoMRztcOhS7KJTamFl6C7Zpzztj4N23ARcnSvRbfLLFmwMoBymzsWX2MBaAHBxwOXiGet1GJJvxUuJudIkAUUhihmTY3Xltt9PN1WCulhkUipNOvOzUtIXeyEw1FmZNyjsqotl2wqYaJsKzR+iQAl091lW6CAUCimAcxLY7F9MxQYZTdQfEG9o/++TvgeEG9jBSMDqYJRgGxUa990ffNXlS5jqh8AYm54d0i9ndqoXbfJIbx3gGSGWaD+IipC7hpxcFXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0361.namprd03.prod.outlook.com (2603:10b6:a03:3a1::6)
 by SA3PR12MB7878.namprd12.prod.outlook.com (2603:10b6:806:31e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 13:46:16 +0000
Received: from SJ1PEPF00002323.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::77) by SJ0PR03CA0361.outlook.office365.com
 (2603:10b6:a03:3a1::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23 via Frontend
 Transport; Tue, 19 Nov 2024 13:46:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 SJ1PEPF00002323.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 13:46:15 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Nov
 2024 07:46:09 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Nov
 2024 07:46:09 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 19 Nov 2024 07:46:08 -0600
To: <buildroot@buildroot.org>
Date: Tue, 19 Nov 2024 13:45:56 +0000
Message-ID: <20241119134559.3891625-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241119134559.3891625-1-neal.frager@amd.com>
References: <20241119134559.3891625-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002323:EE_|SA3PR12MB7878:EE_
X-MS-Office365-Filtering-Correlation-Id: bce35793-aea1-4fd5-9046-08dd08a089fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xn4tzKY+/Sbqo1QoouVOeClWUGW55ulBnudm6tf1tNf8ZnYpSqItXskqic54?=
 =?us-ascii?Q?vsrlIM3z/9fz2EvS7OlUHRQscPhHhmSUHKD523nJhZV9t2F3nJRiaFl95wd0?=
 =?us-ascii?Q?Jf3ukm9L8LjQkNnecozoQImqvxxwsQQmYWELmZlMGz+rvqWdwPg9rn8Z0Kal?=
 =?us-ascii?Q?gHKmruztejvRbsd7uR2cIib7J/H08h+jONWu3NJn3jHlIX1EZO0iO345v7Lp?=
 =?us-ascii?Q?Bq/sx5lqQwqwqFdgH7zSBl/+1H2mHkXd4vrVPhbTodDu2EpiRVN5gI8l3unR?=
 =?us-ascii?Q?K8XnYd45vF2Qywej+lXha45pyKdF8oUyxLPSzPZu23pQkNAKi3Yx9P6ESjUG?=
 =?us-ascii?Q?Cwnupt13ZqHAvkTCeJFJi0ZD0qkjdJ7JhpKlU6MY3AK72Q7bjkE9nb4eZnK6?=
 =?us-ascii?Q?92rg/3ded5/kMOT3OxFvJEdG+G8YadbphsME95tl8c3gtvHzMgTZ7cZMkWDD?=
 =?us-ascii?Q?N6EaiKXzP0CmBv3F5l7naOaBfzABLtr/U9BSaKu5P2MG6UJDoDE2bOlIlnm6?=
 =?us-ascii?Q?PGmNtTEJsER7n2GUBuq9QHTPCrtNETptHHx1PoTMFTZ8vpQva1urRSZFLND9?=
 =?us-ascii?Q?1EVVVLd3goF3jrIi37kAN6jjgunx+0kbwOVCCaUauZiX8+LCLwdoWx9GeFrs?=
 =?us-ascii?Q?v+ROzjxjQIMfdTLInFYnp3NxnTAdxWR2gCxoiFyY7QJHuzf1l7wI2cZDVkei?=
 =?us-ascii?Q?VJGcVoF188C4JtFKZr0nxLRRHbhzgz8qDF+E6tV/pPCV5wnbHcb1NeFrp/3t?=
 =?us-ascii?Q?ZiYHIUG9R/GhNcqm7EH9nFsoy77RCW7WNTQNMdg+fqDP9BQnxJaNnA8pU55M?=
 =?us-ascii?Q?Z2zhHeb5PlKSZO5rYSzf5tX1znmbdDSejR3kCHZ/sRlf8dFshlTB9tl8wUSY?=
 =?us-ascii?Q?bj8im37ImW3c537FJ+aa5TtLEidQw0zVCNdQOdDEWX4cCtzkV7xFTb9Y8Oih?=
 =?us-ascii?Q?DmrCu6V0I2ZDSKH4u1mX6dVyfHyDPDp2GVAU62asj/mikNdsjorUe04A4XyY?=
 =?us-ascii?Q?XWtp1uXQ6m2lj4ZmNdkAt/QwphrbT89buT8HUpR8neBzcfL8X/PqxSFf5nFk?=
 =?us-ascii?Q?7mxQ4Beul8BBxmovY6TWTQn8kHjxXtH4ut5Fm6h1PJupvlFBp3hrp0rsMswU?=
 =?us-ascii?Q?shR67cgGdO3C/GIezCVnmEc2ZVcIOlCyCI+zA8C4ddQIvgntwS8ZNeJdC6Q0?=
 =?us-ascii?Q?dD2ub5hw8zlncl9KtXdx+iEPV3CIJkV1usqYZuR8Jid1IiY7D7CSKnYHyyp4?=
 =?us-ascii?Q?hDubVaeWMtENoRhXRjr81gi0kVAS1TX3qdMGixgs9bmmF4xkAcaaI2BvLGn/?=
 =?us-ascii?Q?tw+Cd9jiC2SoQ7+lljy35ES1NrXzILHZLNmZTHjr3h5IQqb5lASG/AthC7cz?=
 =?us-ascii?Q?DslVhCoHCw8Vjf3QL4YcZ8UIVIsiogAcTklr7ydpqozV1BySNCCvyRsT45je?=
 =?us-ascii?Q?orHVy2qFQn2Bf/jvFY/J/M6rTlmaWTKu?=
X-Forefront-Antispam-Report: CIP:165.204.84.12; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:atlvpn-bp.amd.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 13:46:15.7892 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bce35793-aea1-4fd5-9046-08dd08a089fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.12];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002323.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7878
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/Brrl4ZELDVar5pghEiiM5F5wXrbzk9KzD5rMAVwVc=;
 b=bbK6Tdx+n4rytJpfdwiA8HnQbLvQjofVHG5szyDDawhzg/K2HHi/Du2A9e+9YY61ye8OIEOJ4r5mDX4ZzrkWf8QY9aK63OthpUl5ttHH3kUHjhSjbCKLV3k0aIg/HzL63JP+5/UREk8s/g6+bVYWu+dhYDu3+C6B+r6M2oIx5oY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=bbK6Tdx+
Subject: [Buildroot] [PATCH v1 2/5] configs/zynq_zc702_defconfig: bump to
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

This patch bumps the zynq_zc702_defconfig to xilinx-v2024.2 which includes
the following updates:

- Linux v6.6.40
- U-Boot v2024.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zc702_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index a90dfd6c26..86c0f3fd73 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
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
