Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D18C0218F
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 08:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AA19412C4;
	Tue,  4 Feb 2025 08:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfOQNUrTJuFF; Tue,  4 Feb 2025 08:59:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9F4E412D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9F4E412D1;
	Tue,  4 Feb 2025 08:59:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C789185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19A95412C1
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nKuLReypeLNg for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 08:59:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2405::600;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B7ADB412B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7ADB412B3
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::600])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7ADB412B3
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:59:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCzY09OnyxwuUnt2AmKFHuT+FUMbKNpgP3KHDB8XN7ouPicdFy58h8PEwfGRnqd/HNSkQwgzlijAreTmCxD7EJeHxwj5POj6HvnuaA7Z24xP1/R58bZvbdRzs5RpaOG/jKBiCK6h+nFDOk1tjdqUHxw79TZanvXt2k++X/wAMpRG522vqnzOmH4fQj+rPXiVj5MSrj5P0byQASwG5OAERLiuNmSeQt6UwFLDjZxJ+y6094sDE94Zs3hHkLVOeBqYABT507us58Aoj0fnj9OUcagW9gkxJAFoFI/4uLE4WdW7MLSA8QQSByTKAt7avVGL4JdPEc/JpZgzLViAvsVqsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4Xs6wDhif+DnP/QM3WyaSFhAPeaayoyzR6qQtBWpMY=;
 b=pKnh9mQYMBMWHQDLYhw7hD0Fl28RVYfltfxNt4MxZ76/Wr9WsSefDHx+c3EJnPo5vVOLgJnGBH5kRHXqkd/Wggeo4lv7hlVaXgnawUWG8cDz37DVKcx/oef4AlGxVT7g6LbQVSM7/iYzb5Gy8yUgMm9JPSnr0D3/048unls6kVIf2AK4MqP5ptk3HafwvjQyFv8G5H5qeiZiuoGpEwtP4WPthQsb4XhDbSO9KEhGhIdiWuEiT/I5Hml3Fz3MS2yAPKl760lh2tBDNE+vgtV6kxdEk4C5wgF1RHbvzntfPbpS4vwW6cW7OYNoC18LuxYQXwthMORniSfOg+acTDsETw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR04CA0070.namprd04.prod.outlook.com (2603:10b6:610:74::15)
 by SA1PR12MB7125.namprd12.prod.outlook.com (2603:10b6:806:29f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 08:59:14 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::43) by CH0PR04CA0070.outlook.office365.com
 (2603:10b6:610:74::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.26 via Frontend Transport; Tue,
 4 Feb 2025 08:59:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 4 Feb 2025 08:59:13 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 02:59:13 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 02:59:12 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 4 Feb 2025 02:59:11 -0600
To: <buildroot@buildroot.org>
Date: Tue, 4 Feb 2025 08:59:01 +0000
Message-ID: <20250204085901.767542-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|SA1PR12MB7125:EE_
X-MS-Office365-Filtering-Correlation-Id: a085538a-346a-4240-e0de-08dd44fa3299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aS5rUnGKrk3eEF8yilD90sVWq2gjcdflIoCwrE4HT4H2GCbTHYnuzT9u77pj?=
 =?us-ascii?Q?z6PDTJmdtTywPc94lUIu+oCfUzPnU61D3QrzZ6VTFE8THAZ3mFlPmPrjxFGC?=
 =?us-ascii?Q?RQMCnLLXix0Zr8jhRmK06Lq1W35+AIw8ZbSLYdxWOjIjAdainVTUV3MwmPt5?=
 =?us-ascii?Q?0OkOt5K6n0Zo+Ptgsjr1/zkoS5yXB1BjRYGCixjnQWUNYFdrKzoQQCEmhBQA?=
 =?us-ascii?Q?TDr28ydL3anrvs3+eskhhnZMu1w+qK2XvhzqSNBFFRqY7wsSfZuHmLvyWiR0?=
 =?us-ascii?Q?HgLV18xKBQKX0gPHLIteIPWbO1Ua3Y+/cZGSmDVZZo4kMGub9Esa2UJOwTUM?=
 =?us-ascii?Q?WNWIPoI4hbRhzEEyGCk9jThtdBP83PvcOxVrON6sPG2CbAtGX+ReyCW6UYPI?=
 =?us-ascii?Q?7dAOLbYo0JA9AB692kVQzkbXTo+mdmYgZLWlNQ3+PqvHhejoijwAi0FdGmMf?=
 =?us-ascii?Q?ef3DdzP/hptLtt5HIeQMdaR5CmengTXGbNkzbKx7lMtTUmh1JrhqKS7E5Uz/?=
 =?us-ascii?Q?3ebOh+wwwhZjKmajITFsSiEyzcWhwRCOJzdi77XOoGTBRwKHau4kGw8gTTe9?=
 =?us-ascii?Q?Q0xLZYGK6Ni0B6l+9M3McHHiD1xaniTu9+6nUW6jxavgKFp1/TZM802fXkFT?=
 =?us-ascii?Q?PCMYOwRq2Tql0dQi0AGdt033DOqs+fwaaYBhEqKCIE5XqI1833wHHbZdyCd3?=
 =?us-ascii?Q?ib0zlUk9PZslTy6ZEr0g0WyuLrnJjr+0xxyNzuAt4oB3FW589ww6vAOXhNGi?=
 =?us-ascii?Q?h+HhsxehusbKjoE3xfdJha9BEUNHYcku+0Ir9t9yhJLve2dWV6PWhBJ+KGWq?=
 =?us-ascii?Q?Ow9nWexbcaIbbX7+PKyc4lSl0+3uHES79y5LxRjTsR4Cq45Eesq5189Tu3Zd?=
 =?us-ascii?Q?U6O1oxchjaSXlu2vZZr4ISjeDRhSdsED3V4OQOC53z6ZFoKXWGdBsII0Vpzi?=
 =?us-ascii?Q?g86D1LkR9b7aQK8127hcMTQ/HEe7I6fN7E65g9vjSotgv4sPtQEi6yJWKiq9?=
 =?us-ascii?Q?fmEwyVYGY5VITL6Gj403AxxZe/WEGPRfz+eBuU9QepEiy66sj2Qwoah8SExh?=
 =?us-ascii?Q?4IJz9kwNd+YUioDlzaULmRNEmahuyX2RIl8V+a4u1UipjeA8QlUOqKulq5BY?=
 =?us-ascii?Q?8I13QawQq5Umn0ERPWlCbsy4AGfez22+PQo2sO0QPqe+rPs1pn+Di8M+v8q+?=
 =?us-ascii?Q?iMxxYWfQ+PT/leMNEI4fqYqFMnQyRZ3Lys7RjeMPd7LX3rrJd0ewUu4LL7dP?=
 =?us-ascii?Q?syCZwZ7FgpTJnBvmBFu99rhMcQlP97F2EDtM6cEyKZWInFgLWn4/ZjLC8ADh?=
 =?us-ascii?Q?cv3yaGJYy/Jwi/huCwXYa2H0hjuFo+tbcpFzlyKfc/e+/+QNudvMINxHHaqZ?=
 =?us-ascii?Q?3w7AqitvVSM/j/yVv8V83BuGkRQ0kF7Ga8wIOVkPtzrpSGYhWS59STLej5HT?=
 =?us-ascii?Q?IOMMhsFXHA8x2lm4kIj3oCZU14/Bkwa0HetfFcq0l2XjWen3nQYWxg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 08:59:13.7155 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a085538a-346a-4240-e0de-08dd44fa3299
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7125
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4Xs6wDhif+DnP/QM3WyaSFhAPeaayoyzR6qQtBWpMY=;
 b=xxi/pZUki837Um3Z8OP47ARbteJPQHvuaNa0y9TstbZsg2L2X71xklmHMytG3yq4Z2bPknfSIBBx+g0bX5iDSnQ+tIgotsJize4SOTPDXQMw5Wy/RtlbTK/Tju9v2YcB1MfkrP3IMinfyVyO1LwNckSm6xE3yFgeX8RL5qOUzh4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=xxi/pZUk
Subject: [Buildroot] [PATCH v1 1/1] package/binutils-bare-metal: bump to
 version 2.44
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

Bump binutils-bare-metal to version 2.44.

Release notes:
https://sourceware.org/pipermail/binutils/2025-February/139195.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
This patch is dependent on this one being applied first:
https://patchwork.ozlabs.org/project/buildroot/patch/20250203215659.1178318-2-thomas.petazzoni@bootlin.com/
---
 package/binutils-bare-metal/2.43.1                 | 1 -
 package/binutils-bare-metal/2.44                   | 1 +
 package/binutils-bare-metal/binutils-bare-metal.mk | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 delete mode 120000 package/binutils-bare-metal/2.43.1
 create mode 120000 package/binutils-bare-metal/2.44

diff --git a/package/binutils-bare-metal/2.43.1 b/package/binutils-bare-metal/2.43.1
deleted file mode 120000
index f605915e35..0000000000
--- a/package/binutils-bare-metal/2.43.1
+++ /dev/null
@@ -1 +0,0 @@
-../binutils/2.43.1/
\ No newline at end of file
diff --git a/package/binutils-bare-metal/2.44 b/package/binutils-bare-metal/2.44
new file mode 120000
index 0000000000..b8164295cf
--- /dev/null
+++ b/package/binutils-bare-metal/2.44
@@ -0,0 +1 @@
+../binutils/2.44
\ No newline at end of file
diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index 97a242a6f2..3525e9fdf2 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BINUTILS_BARE_METAL_VERSION = 2.43.1
+BINUTILS_BARE_METAL_VERSION = 2.44
 BINUTILS_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/binutils
 BINUTILS_BARE_METAL_SOURCE = binutils-$(BINUTILS_BARE_METAL_VERSION).tar.xz
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
