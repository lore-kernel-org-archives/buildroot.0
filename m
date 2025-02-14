Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F366C021A4
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 16:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58CB2419D4;
	Fri, 14 Feb 2025 16:54:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hncL8B_Z8H2b; Fri, 14 Feb 2025 16:54:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 220F640864
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 220F640864;
	Fri, 14 Feb 2025 16:54:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15240C2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 16:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3A08419E7
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 16:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEdSO6r7X-Hx for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 16:54:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::630;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2AE17419E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AE17419E1
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2AE17419E1
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 16:54:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdDTtrA886nN/1Klg3dxuaVFILLJJ/B23uBm5Y4rq8lcgmTXOpKdirLukNe4LIYqqP11406dnBdSKIG0cWWBmoam6o1e/mFjrqnQUufjik6jnMKVnGNA3IuGYnTZUnTm1iFCUEFzql2l2xkHKbU0FE+4BxIqYLqqsl2J0+Jre+UFf1EpJsFBXVfREPGzEcLdlQaTBadgWHbG/X3B6RqEbDl2pI9KNu/r9TZ0bfUEZdMpixzX6qfTezcU25Zl3cvYLqi211ziIY29ZrgYbWzLm7iIGI3MkmeuhAbzkvfxRCTWkkR5YlGVUCqJmUdfCcpFrxig0mIwa6ocredINhfujQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4pviivg5RUBA2ytFBeDoZZcixHMeF8BaEDSsWKlzKA=;
 b=G60OQwomKdaEiiXcCM8Ln0HagbVxj4Lbv42S3+ChT2UdmEbM1WFQfpURRAwj6kXNiQ4wA5cZ8Fv+5CY60JXoA5cfqbpzm+CbHocpZqWesbObQbY4kjfvw1sZJzT1wTwiyBSwdnzXEd2ibK1BnYKLbK3nUrFtrcM7w1OzVBt1p6GYPk6NHCvTfVq/tzN9RD9Dy7ml/fZMdiZs3qroYQwYr1LGKsqOukuGP0U+jLAVCrmqmUtkXteKQOi9p6eZBRK4l/Q3fQYIjdOdTG3a1Poitb1zX6Y8uk+PquL+rpkfIJSGNViDRy95c+/mK/YeOP20eiqfl2LTC7PJImT8ytQtgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH7P221CA0043.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::31)
 by SN7PR12MB6713.namprd12.prod.outlook.com (2603:10b6:806:273::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Fri, 14 Feb
 2025 16:54:16 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:510:33c:cafe::87) by PH7P221CA0043.outlook.office365.com
 (2603:10b6:510:33c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.16 via Frontend Transport; Fri,
 14 Feb 2025 16:54:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.0 via Frontend Transport; Fri, 14 Feb 2025 16:54:15 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Feb
 2025 10:54:14 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Feb
 2025 10:54:14 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 14 Feb 2025 10:54:13 -0600
To: <buildroot@buildroot.org>
Date: Fri, 14 Feb 2025 16:54:02 +0000
Message-ID: <20250214165402.1128194-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250214165402.1128194-1-neal.frager@amd.com>
References: <20250214165402.1128194-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|SN7PR12MB6713:EE_
X-MS-Office365-Filtering-Correlation-Id: e2364a3b-75e2-4e27-6243-08dd4d183743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lMy6j5yd3K2W8gky1yzMbAuI3MOth34VJDevAxp2aX3aGhEZWSaJTKyjq3zD?=
 =?us-ascii?Q?9QS0BuI4Bptm+8HwtT2O7G0y4w9CR2BPAReBC1lzvPQtxNyTSkz4w4JC83MM?=
 =?us-ascii?Q?dVTNlDKVNPon96p0UXBCBkao4oKycDSU+TqzygwWYO6W8vI3tbTWJNWrnMxF?=
 =?us-ascii?Q?1qz5HpQK2TEtm0OvRdy6zIT1zCcIU89OJ/kNhFPD0hfPwZY2WFibyribzLZL?=
 =?us-ascii?Q?3clpDqjxoGKDbWmMOs5WnXOANPPWm8zjyx2cj7hNYd3EFlezvT5w0M68zC4z?=
 =?us-ascii?Q?thni672hq/SQcCpWeQKt1pvwa37+gsvw39KiuzMJrqjRpKFwyGmGK1NmXLWI?=
 =?us-ascii?Q?6ge7icLfWNYWPuXaowvRftExNNEPEFYWnl9VqLAlW3DC84nWgwD3gAspjKwg?=
 =?us-ascii?Q?o7PmRGm0FdSUelOdCysTuhw2az9RATviw7UfWye9bI4SeI/L98arE40oCRTZ?=
 =?us-ascii?Q?emcOUUQfuTH2kGkTt4Svsitz81DLjKZooR6QEPtzpyN6l1fAHz2+WmomMExm?=
 =?us-ascii?Q?MD3iCwFRky/tbakHUnpuoy+quxTwQkQeBJZoWJALftsS2GcaRPu5eYqx/7tb?=
 =?us-ascii?Q?sHmdtw2SdDuGY/dgsJCJZpNMVknXqll7XexXq8F8Z+bRWlEh5zlp6sVLfwpb?=
 =?us-ascii?Q?fsBqreLR4X16g0xLuwuWlbM/SVGns8OYrJHb33vm7PiTaPaxQyOC8WQB4aUI?=
 =?us-ascii?Q?BLvDf/Nubv+OoTpolM1a1GR5H5x6BJlIhZGTV/wUlJxXc0utzIlE6qDnKBgX?=
 =?us-ascii?Q?OxsgKJFmm/l9EZZkH5iqAy3WD0RAg6PuvxymC1bCVob5rIzBPstyNywkRcUO?=
 =?us-ascii?Q?CF6Z5U1tUvMSHSebtkhpddD0g2Daz0JRszdEzm4M4uEoRBQcxwDzr/Tsayz2?=
 =?us-ascii?Q?Bo/vjsVUI4z4sCZAx3w/2ivUySkbb2gcEVSuR9dkrKEa35ub3ReFLTtMLRlu?=
 =?us-ascii?Q?2yze4QJ8y1HE5tU4H9XWkec2U3I8cZXhSuTXRTTIaOUaS0frGSXW1mHVZ61W?=
 =?us-ascii?Q?3DGcN+STXgKB8dC8qqn5nwhpYLDj0QO4rm0Ju0YyZgIWWuaNQjXaJUVO1awu?=
 =?us-ascii?Q?bIY+ppZTDHJT/6s1JS8TfG2n2CZK5fp3XsVFbfAv4g9scmnqR7gGmy7TDRsc?=
 =?us-ascii?Q?MkYzxpXd2hcNGrPoueeAeBshlLgUld5v790F+x3R/o99bnGtXaB6PYxZ42t/?=
 =?us-ascii?Q?TIhg8tRLaI+ocyA9HRApvCNcq8pJees4wqdOwr05nqvJoLJhxVpex6iTbj6y?=
 =?us-ascii?Q?YxMutXjE9jUYf33TBuiPtxh3Wkw4fk4M60KNEQVNY1IL5l3A+O6C2DJsHoKU?=
 =?us-ascii?Q?H4QlIAtROZn9PKCJYorLSVJTAf+ojZgrbMmVzWkL5oSMHYwxIYv3JPQLyRJb?=
 =?us-ascii?Q?my8k8SjclVsPeCOj/3nutl0zyAJV6xM39Be6L61CAUisI5bTUIHadBxDc0Hc?=
 =?us-ascii?Q?sliLAFL92xmT2gJQO3AZFqOmjA2KUEE9Lng36ruIyJLB6v6JFL4i/oiDXwYF?=
 =?us-ascii?Q?PI7hFlAOGmh6C/HiQIuVY4c8v8fCAa6F3Mbf?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 16:54:15.6632 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2364a3b-75e2-4e27-6243-08dd4d183743
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6713
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4pviivg5RUBA2ytFBeDoZZcixHMeF8BaEDSsWKlzKA=;
 b=p1k9wlLXRH7S8ZDNLTuogBoZNvkRYBf1bwmHDYrBYwWI7cCjaTyc3pUuEzKbYS4L/+iIWJzq2YWpl5K2XQ1aC00wwFl7qgetqEnf6iS5Q+1uFEBljrnguGaywpBMC+BntM7ibBdvfusE0SQq338w4hb+SdYTYyZxx+ctxF2DGnA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=p1k9wlLX
Subject: [Buildroot] [PATCH v2 4/4]
 toolchain/toolchain-bare-metal-buildroot: update help text for multiple
 tuple support
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

Now that binutils-bare-metal, gcc-bare-metal and newlib-bare-metal packages
have been upgraded to support a list of architecture tuples, this patch
updates the toolchain-bare-metal-buildroot help text to describe the new
capability.

BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH is still backwards compatible with
its prior definition as defining a single tuple with this new definition
works exactly the same as before.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
no changes
---
 toolchain/Config.in                                   |  2 +-
 toolchain/toolchain-bare-metal-buildroot/Config.in    | 11 ++++++++---
 .../toolchain-bare-metal-buildroot.mk                 |  1 -
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index d6ed25ff96..94723da141 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -941,7 +941,7 @@ config BR2_TOOLCHAIN_HAS_LIBQUADMATH
 comment "Bare metal toolchain"
 
 config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
-	bool "Build a bare metal toolchain"
+	bool "Build bare metal toolchains"
 	select BR2_PACKAGE_NEWLIB_BARE_METAL
 	help
 	  Select if you need a bare-metal toolchain for building
diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
index 6fe969357f..ca3129444f 100644
--- a/toolchain/toolchain-bare-metal-buildroot/Config.in
+++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
@@ -1,10 +1,15 @@
 if BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
 
 config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
-	string "architecture tuple"
+	string "list of architecture tuples"
 	help
-	  This option allows to define the architecture tuple for the
-	  bare-metal toolchain.
+	  This option defines a list of architecture tuples for
+	  building bare metal toolchains.
+
+	  For example, to build both a microblaze and a riscv bare
+	  metal toolchain for Xilinx platforms, use the following
+	  definition:
+	  "microblazeel-xilinx-elf riscv32-xilinx-elf"
 
 source "package/newlib-bare-metal/Config.in"
 
diff --git a/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk b/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
index dbfe30a910..71063fcee4 100644
--- a/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
+++ b/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
@@ -6,7 +6,6 @@
 
 TOOLCHAIN_BARE_METAL_BUILDROOT_DEPENDENCIES = newlib-bare-metal
 TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE = $(call qstrip,$(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH))
-TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT = $(HOST_DIR)/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)/sysroot
 TOOLCHAIN_BARE_METAL_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 $(eval $(virtual-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
