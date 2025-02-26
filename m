Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74106C19776
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 07:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3403840C85;
	Wed, 26 Feb 2025 07:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6qH_LgoiOgJ; Wed, 26 Feb 2025 07:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA7F440C8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA7F440C8C;
	Wed, 26 Feb 2025 07:07:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B14C2DE0
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 07:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C43040A98
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 07:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJac7ETJeBlE for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 07:07:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::622;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F8724040A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F8724040A
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::622])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F8724040A
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 07:07:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vb8Ldm/4V7ppGE8O3jUdwP/pVOIzL/TYGQ0xIWRMq7zwFcIr/lrheI1AL2LQKoIYnSwJjjt8spXHVSuSfaTdK36a9EWcaK0hiXP7UtgdNi7hfTdJ3qS+UiCayUYEeBH7jGtz4NgezyLylYpLHLC2nqrs2Gr5ttIT4osjD9lIYN8WqHHs1Tw1H3gXVCw1rQgaGHW5+2Gc2RSYnO7QVfDjWmMRB73jMnkiruZ+e/06PEJNUWI7+lLxKH8/pQsXLLVpx4PGwiF877jiXga2+jMrR1THuyUVFf5FWJv23hZGE+C3o/lybYLMAxWV5TfaeL0lwrQo3M2WNQyolEUfUJMZ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wH0RbATlG9NW6MOMCossWN9pc7/wBlBXiRe8+RV4SAU=;
 b=a5c63HpF0Tbgkhsy+c7OGalTmRZwM453ZZEBsEUhrr+Xgt/7+DjE2XynhBMh/h+0KIQ9ukAYZzNXWqjSSc/KEWOsHLC2FyqrurjVSSQttjTFq9OJ6HbfgQ98Nn+r7yVht834nOmtoLC+T/06lkhDxXqG3z1LjmskFdhaN6EQNe6srWBC1GCzBemk5I+sBy8V5NwX2Dq73xOfsxTknwwyxzCTzBtdMoybgo63SxNRQBTsO+pIKuGtkBpyhzmONXskBxYo31AF0Ij6ANsCs4OsYqjl6hWdA68pb2dw+5URoVD3gWl+A9ZAQcbrLFhN+4She0lHV9S8d+eiTn70oCrc4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR04CA0295.namprd04.prod.outlook.com (2603:10b6:303:89::30)
 by PH7PR12MB6657.namprd12.prod.outlook.com (2603:10b6:510:1fe::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 07:07:00 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:303:89:cafe::ec) by MW4PR04CA0295.outlook.office365.com
 (2603:10b6:303:89::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.20 via Frontend Transport; Wed,
 26 Feb 2025 07:07:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 07:06:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 01:06:54 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 01:06:54 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Feb 2025 01:06:52 -0600
To: <buildroot@buildroot.org>
Date: Wed, 26 Feb 2025 07:06:35 +0000
Message-ID: <20250226070637.3866930-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226070637.3866930-1-neal.frager@amd.com>
References: <20250226070637.3866930-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|PH7PR12MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd13a89-33f0-4a4b-75ce-08dd563429f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NK9zO9AknI37R0vGVMvfvlXqlmBWCD/HicydAE37fX2A9X6dDwV0HAvgZS0M?=
 =?us-ascii?Q?iGki4UkUmw/Yk7xba0ogwgKscaHqxPE2K9kJXVNasAtR813NyrEu5EI3XsPx?=
 =?us-ascii?Q?XNq8znI7k/cSM3kJhpOkH6KJewDOKvhk2x6w9fFvQNkqBdgT4DuSghhx8tC0?=
 =?us-ascii?Q?+sSNhW5O/kL4chykvYGf1T65fjB7WEQIZG7ULZdA/kuKGlPjsnK39Lb/Ml7x?=
 =?us-ascii?Q?tiyL1VdHBwjZzdKVxJUVTruRyiiycRWwoDZ//+MbnR0e1SlZmStrPiSYhDm7?=
 =?us-ascii?Q?JislNnRwhERXa+JYe1H8/5WYJpxcgvxZUUBm9XZFBsbt52uNyGdY+ie/whGa?=
 =?us-ascii?Q?NEoQLULZHjO0dgNvdZkXDJMEk1ugrLWn1Jm0U7HrN811EMOGywfdL3suep0K?=
 =?us-ascii?Q?uLxTiWkFsJ4B1zALpNkG4aDIGKhDPkaKNn2PN4sCSzxCyU4hEpVDAC2NByZr?=
 =?us-ascii?Q?PjGbAfoPHbPv8BkVcJlL4AU9nB+BGOc63My1yI+lQoxXnqXMqS1zGOgfY+F0?=
 =?us-ascii?Q?t0RL+pmuk5wcLVIVxhaNFNQCxUffavy7/4UKmTjBSvbqyhLyNUutNFoIZlP2?=
 =?us-ascii?Q?HMhQCDCqWDIwv7SnFDoUdM7cf5rrzsA4OwZlnKLoSHpoWRvfLWybgAV/Yfb5?=
 =?us-ascii?Q?il1Fnfl0/zXVNL1lgC9nlHqV11K/WxG6svX0p61s3MNN3PLzlOwZ6QdqubrY?=
 =?us-ascii?Q?uh3HQaVIgsqlyISfPLn43VoEOfxuyRivzGt+HJEXxYMj11p16fOHVJTyltmk?=
 =?us-ascii?Q?g7to6lDvTHS7Ax/IC5bNo66THhFjalQNPQ6OlZBNYiiLgnysFvpODGCulDLl?=
 =?us-ascii?Q?/lvCH77EN5t7FdwWJae7p+g4aGV7lFZ26/UdtjYY6rpSkO3stGOjfLubIyo8?=
 =?us-ascii?Q?pti65sKDU7K3Mxh/6Qak30rbtTssfJDsYa7yQiyGdMYI2saHg+tou1UtkCjd?=
 =?us-ascii?Q?RVBbOzFHBXnDg6TiekDMcW1NR2rx/OuISwPLLRC99HryjDjuWzs0uHG2nRZm?=
 =?us-ascii?Q?Pr+SIXR5FJPuT6bL5AqtdBzjlypVCvdpq9q/Y4sN4Z7VVEwkyAz/0do7bYB6?=
 =?us-ascii?Q?l7wC1OEcbt3vHKEvhmBXPESBN1KrPGCH9sDPo/HfVVfuYu/+wcrDHFhsIzpb?=
 =?us-ascii?Q?jN9XlLXknVUr2xBicHVHvEebkHoeij6FSSdXD5275fAo4oRxUDuvabWahvja?=
 =?us-ascii?Q?vDRl/1FsM8Odp7kdy0sF8RBrLMtFCR+SqPdwt50YMb/ZXkRA0U64nl8edcw9?=
 =?us-ascii?Q?0xhnCFOzb9QUC42I+x2gn4PgI/vr1MziBC+DBHnYRXhkCBib4E8GwWe3h7QN?=
 =?us-ascii?Q?8GqKcQ4FrBZMT2LhGYGc1QG8vJ9L3K/XjBaW5tnb966Ur9rJ23UO6RF4U9ko?=
 =?us-ascii?Q?1OTMtsQe+H/INnBMM9A5DtRCqiKeHvtYhh8eqES8+O7DSN09joXHcTbzew3z?=
 =?us-ascii?Q?J2IUYhsVRUv8ulYxXBNnqkuCKvjZ6jeLNhhpxgLfO/+CMHBlf9ZtEPN7ZaBK?=
 =?us-ascii?Q?HFHiT+25F47L5X1YbJI7LR6/SNjObiU8xrwA?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 07:06:59.6894 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd13a89-33f0-4a4b-75ce-08dd563429f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6657
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wH0RbATlG9NW6MOMCossWN9pc7/wBlBXiRe8+RV4SAU=;
 b=yOPJO/b9ZD+7l9/cO1JoMMQpsRv7gpNXhyZRFfOUTl3Ej09yJXUntmLvJFC2eYyh7XbGqDAnC0ZahiBlxJPRbSfzYYVjMIz9ZMbdpCkjhIC+Su6mehGql9gZiyc72ZVYjW/yMzntv9t0OuFRpfpZ+yIBnpSGq+a5ZljQlp4+ia0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=yOPJO/b9
Subject: [Buildroot] [PATCH v1 3/5] configs/zynq_zc706_defconfig: bump to
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

This patch bumps the zynq_zc706_defconfig to Linux kernel 6.6.70.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zc706_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index d39cf36aab..d7ce9cf11a 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
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
