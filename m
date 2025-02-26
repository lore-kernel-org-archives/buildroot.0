Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521F3C021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 07:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABAD381F23;
	Wed, 26 Feb 2025 07:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEhLCGhKtOrM; Wed, 26 Feb 2025 07:07:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E566F81F49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E566F81F49;
	Wed, 26 Feb 2025 07:07:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C55381ED4
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 07:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B011F81E86
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 07:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9rcq7Mx7M59h for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 07:07:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::617;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D6C3881EE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6C3881EE1
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::617])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6C3881EE1
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 07:07:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OStFyIeOrh6Hl5Z1rdsGeTPunQqC2qmnxjdPKkuEUYvkJTcWhAv5A1HCml3NyowfqOSd+dk4p9oMk3TVQY3Kk4/IssHQIyFOujRExiPXR5NUKqvzZwnJ4doPc1IdnxMo89P0vW6JvTTCi6TKAPWdnZSi3gKMgI8qZRMQBGiL2aRvWK6OuMwvwhyLlJ01HIhX7q8mElk8jT/u5IhU//dDQjJt0flqBmvZ2xHoEAG/oFyqMxZ388BLitotPalJb9zeYqAPwiXrWyv9UDbZt2/9x1OVsfx0Vr+bt7Sxhj2Dp0RashvZ6qYjIwJbuS9GOzL0dkXzDEA2XI7oGdUqU4r7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rGwV4CS21vBs5F9mzabJwWmMtzWNqnfDCjVXaaonkc=;
 b=PNiD+d2RAh7hwlVnFir7vDTrI0XY+yqpAU9wB00mFU5PSF9rgfweJEmvBt0OOqpl9A7Nc+XH0+5S0RyzzfCXlUrCzM2o+tnZfT9fAvUnNqeL0I/HYfK7hdNpvnHPI7Qbks+wsNPo1aBs6dL1Tt6yO6YNYxPBTNJzSimFxNYoSmCIodFC6Pt8DwY6AvgHb7IdqUUNEqWqcrsZlnFzO+0BKF5OcjMRW+ogwWrTLFsKn5BwFzs+eskrBgZxlr9M1gSWd8ULWXivBlDbFe0OnoOWdevYjCU7NyAwwvUO/WDQKRc96IXGBj9GsbIjp02TvWNZ+tNdKS03Ebano9YMZj2sxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0366.namprd03.prod.outlook.com (2603:10b6:a03:3a1::11)
 by BL3PR12MB6595.namprd12.prod.outlook.com (2603:10b6:208:38e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Wed, 26 Feb
 2025 07:06:58 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::97) by SJ0PR03CA0366.outlook.office365.com
 (2603:10b6:a03:3a1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.18 via Frontend Transport; Wed,
 26 Feb 2025 07:06:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 07:06:57 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 01:06:57 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 01:06:56 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Feb 2025 01:06:55 -0600
To: <buildroot@buildroot.org>
Date: Wed, 26 Feb 2025 07:06:36 +0000
Message-ID: <20250226070637.3866930-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226070637.3866930-1-neal.frager@amd.com>
References: <20250226070637.3866930-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|BL3PR12MB6595:EE_
X-MS-Office365-Filtering-Correlation-Id: 01293d7d-b84a-4a23-1fa1-08dd563428d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7p6SYQn7c5we8lTHMZiifMRNNRO4nnYqTA6qT+YVkU9apoKNExPlHAipFhZ/?=
 =?us-ascii?Q?yTOCDvOBF7bMCWORtQSwuafnd3Y3vc/grC/kxnh6p2I6PCjdZpGSwI0wEWq4?=
 =?us-ascii?Q?+GCdpalv9WdNqjysLhyk44q6dcp3ZnZPY8PGtE6l6TAIo3TOFy4yV38bTSJU?=
 =?us-ascii?Q?UNIogsa6sT1p2SzfVBrNvfSngxEvtlSdxuiP4OdeguRity63mN4lkyL/2oGE?=
 =?us-ascii?Q?iL8vcBWSUlWgCAFQ/xEDP+2rmHldUrxNHdgFBTyNxeM/WTmDHeo0njg7/0gx?=
 =?us-ascii?Q?YelxNeak7eRZNzese00UdQ8W4ITJ+x6RBuBSvpPCP1VWiD7BEJhbnzev67lw?=
 =?us-ascii?Q?6dgva1NlFxIrAjUtVDe8BAZmoBKkZ4A+FaRkpViQwRo7IuMI0QqRjkHrdqT9?=
 =?us-ascii?Q?DW2eDLhsrZTwyq0QUyNcvBAJ1wyGQTciruGY8KhZs8CXc9M8y+j/VEpfM86s?=
 =?us-ascii?Q?kWmG02BAdZrjWMLpfG20A6kV3dBHPO9C0yB0RqW6jmR7PfGBJ3owG+LO5fRY?=
 =?us-ascii?Q?UA6VejRGkhsZq6YVvJGqDlq+IQsu+/BcrEwUiKzAYr1/eRm5P7K0sUSobR0Z?=
 =?us-ascii?Q?9kLRcU7KEOtSGDaT3YBtlswsR+h6mTuBmuCohIulamdvTM2GdFA8SYlS1HqG?=
 =?us-ascii?Q?YIWMEqygzTczo+3iKMnK7gyyGqYW5RDb9A0WRmn1ttwELz/rpFxdwEpFn3W5?=
 =?us-ascii?Q?r7lcgJnG+5MnAfGiacNBzllWWfsYgch5AVA4076dviJQNRBkSjezPZMNhHGn?=
 =?us-ascii?Q?hcYy0ZWQ25b5Njm0MnU8Gq9Kfbp7yqCKTxsBHdMj+XAoUyG9DQC4H+vGzYB0?=
 =?us-ascii?Q?VfvjUdahA1uHaAP+/soq542qQ7Z+IKYk22lKzdTS3gbSS8iFJ2CWyiOvmY8N?=
 =?us-ascii?Q?6b77cca9Ajql+srDY1G09RMpKy/RVcMhWP7L2TECZpu0S0M/7ycmNaHndt0r?=
 =?us-ascii?Q?hz+Eno5CHehlcytIRKVnxpUr6Ykrj7QwDOxgUUZkUHH7FVo00aSF9w0YDrUd?=
 =?us-ascii?Q?7BNyfmGjqSaPnaQxY861h34ZLLtohmq4eyopNNjcIkDlmHy+eEWIwPd1fPaw?=
 =?us-ascii?Q?kIOG6WFbruS5bire2ebWXaa7a+eqlwdj16NnBtZuvzAcUZHSCpagtse7+m0u?=
 =?us-ascii?Q?751Fbly3+FbnjOXimf1DdwCpdxX2HG9C4YZuiFk0oLiqcVWznoU/L+uGrIEW?=
 =?us-ascii?Q?8j+Aqc+Qby48Ir20Bpw4iLYQe1bOxO1vv2XgwhmACTsRopIJyA0PAlmWAI7d?=
 =?us-ascii?Q?PBKsQ/RrQZQZwrSGmJ6TaFEVnk7PCqlfIVGDKDJavRMo2oNjPDhAkL5VLNZm?=
 =?us-ascii?Q?n7ZB9a0PuZ9/NfGMBy+xRzgJkXgK+/22Jt/d+uelYWolfWoXJbNyXzVrTxhf?=
 =?us-ascii?Q?rLYNiK2AyaulE+3GzdclO99KN8paiNRewUeswfU3HrRtgWrlMzz/jI4MzWK4?=
 =?us-ascii?Q?pQ13eeyyJ1VBS8V45FxPobBlteQoOpdBKukoz0qxhZ4GCaTZfdNaUSshEE01?=
 =?us-ascii?Q?8jZ6wf4GqJmlIsmHNXQ33AOGSUvrmVy3Psgo?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 07:06:57.8169 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01293d7d-b84a-4a23-1fa1-08dd563428d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6595
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rGwV4CS21vBs5F9mzabJwWmMtzWNqnfDCjVXaaonkc=;
 b=r/bfwhCcRns3CWkZvf8F5kZdbrevX+CNW91jnv/jDJI48Wuid2+YLHqD9Idj5vtVMcLYuiCSbJDH/RzdwxP0kjo38wiPmpTscn8UqIuEDEKrr6wSoShoHVEuob7HGmU+b67hZEe8GZNsRelS6R+cmMphG+eYLpucQB6/uoKSW/Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=r/bfwhCc
Subject: [Buildroot] [PATCH v1 4/5] configs/zynq_microzed_defconfig: bump to
 6.6.70
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

This patch bumps the zynq_microzed_defconfig to Linux kernel 6.6.70.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_microzed_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 18148b5fbd..b9b2da3849 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
