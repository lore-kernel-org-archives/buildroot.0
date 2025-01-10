Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A99FE7719C
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 08:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16A874084F;
	Fri, 10 Jan 2025 08:12:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPWo5GZFNvLd; Fri, 10 Jan 2025 08:12:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 162CF40822
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 162CF40822;
	Fri, 10 Jan 2025 08:12:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ED9C476C
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 08:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9F0D4024C
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 08:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XDH8SiVInNSY for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 08:12:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::628;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D615C400FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D615C400FF
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::628])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D615C400FF
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 08:12:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jv8NIqO1LPax/41G93ywCzKVhBEP14SftWAT5z13vxtuLSQWwW7XjYD+RSn7tnFX6kzABD6nYSHa1O3YuU5uPIf1o9b2IGqIqEi+eYmBKEp5YbHH5uN1mVf8nszVkekPwn4bC/atFECCqEK7woF0dhlJ6Woz2dZeweZstJ0BhpQiqC9gHa+eNtgBaAsRaTC92+m9sgd/oZKJiTOCoPDPm8x8mlLZfJYs1aKbbWjTzbnC2cqVv5eGn3ZSQIpxsaLzkaX+IndFQBQ7GBpCxuUd+HAN/h7kEq4Kl5FDN6nYyME5/zF6bY798ZbGjAXEjXIQlLWNftXFN1EJpMBiXPYC8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYMzrDy0kXPQ9kifvtUWP+FGEg/nDf5mcChbt7EnlZo=;
 b=TA1+7tBt5bjD838MGEEWred/SkFrYmtOnbj0NOXqolT5W68PPz6rIli18TmJgZxGcnNc43WMBOCWroY2RrV/ohIEkd0U48qTkb9v/tJjny4pJdqFeqRvkKtacLWkYffrnpBC/NX0GBlWj1O3SD3U5MzP0dXgxuknhzGK+dV5jNsfWqRTMvtjiPukPFunRQ+31QYG2QXMukRzacz17jkpZIiBH1ybGfRKiOskeJj06tpkfgAegVD/38VFrQC40zx/dqnGXZtzj40jZ70XN+yQZ72C5YGn8xaIC+dk2XY2ZeQmQ8Siwj6Gb/gjEl8FWhxR4d5dmfeJ1YVoNZ7fTn51aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN8PR07CA0033.namprd07.prod.outlook.com (2603:10b6:408:ac::46)
 by MN2PR12MB4207.namprd12.prod.outlook.com (2603:10b6:208:1d9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 08:12:07 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:ac:cafe::79) by BN8PR07CA0033.outlook.office365.com
 (2603:10b6:408:ac::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Fri,
 10 Jan 2025 08:12:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 08:12:06 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Jan
 2025 02:12:03 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Jan
 2025 02:12:02 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 10 Jan 2025 02:12:01 -0600
To: <buildroot@buildroot.org>
Date: Fri, 10 Jan 2025 08:11:52 +0000
Message-ID: <20250110081154.2481-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250110081154.2481-1-neal.frager@amd.com>
References: <20250110081154.2481-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|MN2PR12MB4207:EE_
X-MS-Office365-Filtering-Correlation-Id: 575145cd-424f-4a73-e829-08dd314e78e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6Zrq6hqR8qw7pcuGjBgqBsKjvuGwq9pdGF0i/4vtxQOnzGjNJtdlYUfVR0Ty?=
 =?us-ascii?Q?axaSS2Mg3NcQHpBmJ+bb/rgllZLUehSVfRj2niSlFEPxYOcp8c74OdHe1y7e?=
 =?us-ascii?Q?9/9cMit2vsnM14wxLWPyZflOmGTE1G4t2AdAq33irj8AFiL07hdaLBnE1NyO?=
 =?us-ascii?Q?rwxFKN8wbu5B+3Hmw6LMsSLzlhUNnHFGf+hLs49Mw6gg9lANfq6ndGhMPP2y?=
 =?us-ascii?Q?53C+GbtJEGZhH0IYETVwndcwOMew350Mi3D6MJUKYMZgjNfLbK/2P2OzgCyn?=
 =?us-ascii?Q?4Zc1WoJ3aqwKjcLIJgMcnTFu8i/Qq1KdBsCrWKJisZhWwZgKnvwyK/Wk0S+m?=
 =?us-ascii?Q?hm8vh/0NsAeRFke++QTcvUzrtVk3YVGlKKwuUWI7iCKWEslg2Z0zyuJhb8X8?=
 =?us-ascii?Q?NON1D4qy8uGxpZp3XdOuB/lOWt2dEg140jqizAXkZtkMu3M37UOT5esYZfae?=
 =?us-ascii?Q?Or4oWpyLKu6lm56w3UIV5wYV9ZcMgyMhr1thmUf3ma4WoBooQlcAtc0jooHV?=
 =?us-ascii?Q?SNeDKMKwb4JLQ1sUuwPm9N1Lfl40j1GzprzhpmAZqTQ02mUYRpdVXz7c2Vfa?=
 =?us-ascii?Q?tSV90w7fLjp2H6Wxmj7zAqRS3Cuwxf4gcXt+WByAYQQeuKPt2apf2Vt9a0YV?=
 =?us-ascii?Q?j6jE9VnxA1JQaQjfAGL/PTx0CNGqo46JEPOZVKoa0OFy6WZ8v59Ugbk9YUEb?=
 =?us-ascii?Q?qNRm56S/yFdc+nGVFwi9eqROpxzD52YbaWEuxbcsSe8EmXC+D4AKAms4ijHm?=
 =?us-ascii?Q?vpjdvlNGp8S2Dk269o6knThWouhDCaVPaOXs+/M0ay3AnPDh/KmTJJKcHI3C?=
 =?us-ascii?Q?EyfKrxpRhBfmt100Tzb/gZwPFxnX6ab461lAwuJjr108WF51wXG1H3HurL9g?=
 =?us-ascii?Q?o3pfNPv0xV04M7Hv1gHAMhq8GF7s5oxuw+epwE158Q2WxLfEUYllzoZ92+cB?=
 =?us-ascii?Q?r4einCbKPj+KJ7tTgWxB/X8O0gZ1zmBXXbPlLonYzYtBphoJamLrZl/lnK9Q?=
 =?us-ascii?Q?FaSuDZOu/U6it7bJWscrTMTkFfPwtMNQk/nA3vL7abg77XSTNKF5ueIpw7iX?=
 =?us-ascii?Q?rfmBELsYB+zf665Ws2Mv8B2ddqd5jDRrJCoyvYzKg/+9bESh1TYGJ/0mKAC7?=
 =?us-ascii?Q?+MctuERNLLnN9y1IHM402lfiJB4Kvc/fxXOtIeaiABwEebX7dIDBTY86WAjT?=
 =?us-ascii?Q?TYRTAMB4P5rbUeFewLIgmwUHGAhRfC/c8dUgBd+Q36qy7ZWL1/FFlvbIT1Lu?=
 =?us-ascii?Q?TlWZIeAQeHFUk+aWhJMZkSt9ICRZNZSIM1Kf1eckkWMQbUM2X8sr7ssJ4VYz?=
 =?us-ascii?Q?fq/Ic1z8YQTyFwX2FC14ic2phtOBH47C2kH5/zHY0FRt8RD/8xAGdc/7JF69?=
 =?us-ascii?Q?J+500Nj/uZnLg9OaIu8OziIT64hTvj7QOv2u4x0hSTeTMd5ZyCpHvr62yJ2w?=
 =?us-ascii?Q?hKNCpspgqS0jkX+laraClAg08mmdU0mHj+AaNDohpDHAktRsBMRrA5MhVOTD?=
 =?us-ascii?Q?WWe8AUq7eySJ5iknJQFbDuBYq2S7rAhbrHv0?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 08:12:06.1200 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 575145cd-424f-4a73-e829-08dd314e78e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4207
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYMzrDy0kXPQ9kifvtUWP+FGEg/nDf5mcChbt7EnlZo=;
 b=ADsNvwewq/w2sJO+o/QWGeg4BNu4m0yFuGkqZ4Ph2/BoRLC8zlgjIVnHJGoMz4wdtHVeXzryjjylTm9EZgXbS07DnTsAbYgMXmOQrePfSvcwPNq8ojxkeu82GtK5+VgfEl4Q/wJb3nV389Vc3GVBzS+WiF0pQXpV1/lqVcl/pLo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ADsNvwew
Subject: [Buildroot] [PATCH v1 3/5] configs/zynq_zc706_defconfig: bump to
 6.6.60
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

This patch bumps the zynq_zc706_defconfig to Linux kernel 6.6.60.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zc706_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index f50511b822..d39cf36aab 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
