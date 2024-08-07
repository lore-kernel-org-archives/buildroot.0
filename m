Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95FBC52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 10:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CE9480D86;
	Wed,  7 Aug 2024 10:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QimFWAET6hmB; Wed,  7 Aug 2024 10:58:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55AEF80E06
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55AEF80E06;
	Wed,  7 Aug 2024 10:58:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC9DD1BF97F
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5A2880E2A
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fCcz3DCGT_XO for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 10:58:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::617;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE14880DB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE14880DB8
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::617])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE14880DB8
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 10:58:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3SPRogix8IHOonFFPiRyv4KFF0rQia7MCcRJU0/couIANv4ImStwcbsq8LXTKW+ZVaM1gQCx2P0nTnnxrkqxUWXne+OkVhHjDcWR+l3PYcDtidpoK+m+Q2DpxiSEhvaam+FwKmewdDrXkit84f2tEJfuLcZQdtEwJuMxsGB+rOYiLYs4+gM/xhzeqbAKKEQpLAx1ET8zwYyyGc++rG6bkL/Zrs+R3qJkUkHSeHirU0kNEof9y14Xq0oh22Ovnmm5upVoFGmgs9FMaj0giP26233i9whH8dTULvYYjKgWrwQan6BUoYAIF7mWHM/mcwvtdf9j9yhA0jt+wSs+Tbi1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvvY16rIAyrLD199W00ctLq+fmWJNP+DFr+9caRxKVQ=;
 b=auZ4CxMO54vpPxA1EO5/962lrlvM+FdNvp0Xz8BUVWborki2rTqnH0vJHeH8u2oSvlEWNEmXdqI+x1PtT5UzdTnnqkpjbyXoNoeQTVCmLiLy3XZF1wp6KwGxQtIkcSrWUglbzoDxlE16hB2NCFrFeAQFkSXjmO1jk6Z3xJdJMFHjmjS8mvlMo0H8QATv6vzFBaTFGWaSgegXMWCiuWz76xxsw5Omn31IVdBB9w+6cKgxXaV6KXUXiLtR87aKvDO6p1jipI+VGz+SLg9ayWRUxeY+/b6IxXECXoaGoaz3XvDJDX5cdTC8kJBcpveR3UdDjOLP22PYGp3V8hUWrClUmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SA1P222CA0135.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::13)
 by SJ0PR12MB8139.namprd12.prod.outlook.com (2603:10b6:a03:4e8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 7 Aug
 2024 10:58:24 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:806:3c2:cafe::3b) by SA1P222CA0135.outlook.office365.com
 (2603:10b6:806:3c2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Wed, 7 Aug 2024 10:58:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Wed, 7 Aug 2024 10:58:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Aug
 2024 05:58:23 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 7 Aug 2024 05:58:22 -0500
To: <buildroot@buildroot.org>
Date: Wed, 7 Aug 2024 11:58:10 +0100
Message-ID: <20240807105813.3844985-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240807105813.3844985-1-neal.frager@amd.com>
References: <20240807105813.3844985-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|SJ0PR12MB8139:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d35ad0c-d4a1-44d0-d42d-08dcb6cfdbcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HXomcD8CmPMPJGH0TPUCnusrh4xIjqVa2z4YdVxSxOCZvv1zwmDc23UDq9nv?=
 =?us-ascii?Q?+fxr8h+piNKDYnDv4VoPb30SgA63SiCS3n9xmxgRm7j69iNj6TRfxi5Z7LVB?=
 =?us-ascii?Q?H/sBkkwVhOL53tyU8z8z3ejXG5Gkihoo11E600/Ic4cyU0wR/t/WwoJfu9HH?=
 =?us-ascii?Q?SM2MryfrOM6uFjrqAmFdImzOJ+0tPkJ5RAPWqgGfh1ALM1B8N/RmH0UjF+Up?=
 =?us-ascii?Q?qKAggRonNZUe4wHzEtm0Qg1PrNgAfSBx6VR4nN/ZaTrPjvYJLdYgQuJ0pgJW?=
 =?us-ascii?Q?eMlE1aefpixiBp7Difx4S8w0eu1fT94LO4vzMIYf2zv/auT9Hk+7MoiTb7NZ?=
 =?us-ascii?Q?xSVjA6ts98MjVjfXe+X4wFPH0jrFRIqGxbQesMlhnyz9XCKXiMefRZnNB4S/?=
 =?us-ascii?Q?U7rA2acBPZF0HIn0BgsBm0gCfaXlgzIvHPVVWRWWuvR9W/avayIqeHosK37r?=
 =?us-ascii?Q?aVU7EliVgt8BatUq2AE5UMESY3SpMcOxfUSRRcKqGKEQyH9ycgXKrebPvWW9?=
 =?us-ascii?Q?WZSzVhawcLUiqHLaxptJWdQkizKAZaAIdnyNIYfYf6XtWnp+GjmxUXNj1HnU?=
 =?us-ascii?Q?F3GwHE5/UwO3kloLvyu7KzA73ydB348q6NKAYI3IdZ8lbJvUEY4exlr9AnDt?=
 =?us-ascii?Q?vgnkBZDeOftWHD9/5nfKhyPY8wm7PbTp+VAKpRCSfaKtePLpxhD4JZ2/ySU7?=
 =?us-ascii?Q?7FJR+6SeL3iryhwO+/gE6LTfvM6YU5x0z9DMdrLHSLHrdeAxsKMWxpOWHZeR?=
 =?us-ascii?Q?pLlocau2XrPO7LnlnyvQypr9Pb0o2ttOUWQdXZCn6BkvKJBsOT5ErO2Gxk9U?=
 =?us-ascii?Q?rhZZNEZBafuGzLN8dvK/GnYVzDLG2GYrp+hVbsxK/mHdnog/iOlaGb/7f+42?=
 =?us-ascii?Q?vdf9lABRV9UpwSDd3F0vWP09tn17pey+sr9f5/QadyJQa2vN1W259LizKYfv?=
 =?us-ascii?Q?THt2gdT6XEEg9fWytaczGz3CUN/ZOGM67/DSUTEaZSmLoCOY8Vq3m43IiL1u?=
 =?us-ascii?Q?wL51nTzy98CLWpmnQwIynWCKdW3rgRlLA1nJxDezIu6mLVfq+e+DEJwX61UL?=
 =?us-ascii?Q?UsSJVfJxxCe03UbwlKuQrH+LsYIotgzuz0d3rR11cPqyxR6j8Y2s07ANkykE?=
 =?us-ascii?Q?okuPEcLvp+v5Z6btqKVUCnewRqSB7FJVjFvVqP80SgLESfpp1CiOzwNFT/GQ?=
 =?us-ascii?Q?DqWAxNYcCK2sQqd+xqqY+Do7Td5OVKIJuDBXBGfZKMzw/AO/G80CzC6klFDB?=
 =?us-ascii?Q?X/9OnjMaWuhI3NNt5FoVD+ThrjUtlmW3AwYw5rEZFAxsisp5rKDO86MWLOND?=
 =?us-ascii?Q?Ctv61dkDYR6MP5wQViSNibJggkvv9PjIgIe9OcvNPP9gpeAGAIZwcheC3esb?=
 =?us-ascii?Q?1Q9TXdWK2PpxupZFT70BXiEt7Mlk7cNGHMW0TyFYQZqHUpWJcdSGlHstDdbQ?=
 =?us-ascii?Q?xyUU0KwnwnGCQcV3h9xHKfbL/i2CpK4WKByGmlf+Dx/cVPRWC6mnwQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 10:58:24.1302 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d35ad0c-d4a1-44d0-d42d-08dcb6cfdbcf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8139
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvvY16rIAyrLD199W00ctLq+fmWJNP+DFr+9caRxKVQ=;
 b=wpcy3Oxcbzcc/OQI4FePRtZvFDzhVcp1ToryMxLG5nU2UsAHcBpypdaGB+nRYv0UFmoYFLaqFUic9MnEJMtcXydgIdpP3im32SRPZVE6uoE+hpLkneTS6zBaMzRm48KUVVwHC2k//9PnWAQpickwz2LAmAlF/TPMuFIiKe5puGE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wpcy3Oxc
Subject: [Buildroot] [PATCH v1 2/5] configs/zynq_zc702_defconfig: bump to
 6.6.40
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

This patch bumps the zynq_zc702_defconfig to Linux kernel 6.6.40.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zc702_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index 75ebc2a3ba..f3fc32145b 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
