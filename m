Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B4ECA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 11:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14C8C84640;
	Mon, 18 Aug 2025 11:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bq6IavlhYtgo; Mon, 18 Aug 2025 11:31:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E6818484D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E6818484D;
	Mon, 18 Aug 2025 11:31:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DF7F196
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 11:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8610416B7
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 11:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSMjvA8e8QAi for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 11:30:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::609;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB7C940078
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB7C940078
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::609])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB7C940078
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 11:30:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCa0buP+r8lD4ddHO0MxnrMETrO3eyTUWB5FQEL+lrwheEPt3C//FHeRB3OAg5zObk7GLq/TR5/sLfi+lxB1jIHQyKW6CfHFkRWT1VDaC08fjQaCHh498KWmcd+9z23ItrUifESLcbJ3OrY+eFN/o8Xrgi5EXcXuHakoxl66LcfFWiaxFEdl1LTF5i6TFGn5B6IWc5SWNSSvkS8s4MyR1IjYC6jGJP6DU7hTi5NKWw2kWP26QXdwIxyrwCNqTuKxXjgl2WRz86dfNY27wm8VcV0iZLuD2dEtt/uMFTMe66JJJYf/ZWDn/JyMMiMBl4CwRpHddUydPCgz1yd/NLKrCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sv4/q5K1nal4CESzrPlQFI6Qy3AOrB4N+qV7/bv6apc=;
 b=gnacgNtTACUJJURjL3UYCJn+PXmIldy/SzpkJx2+tAgsKjzNJyDPMIqSJ+yxcwB9R0qM+1I+YU/uk+xE3FpaCXaQZsHRECyvT4rpTxv1c4JWfLi5+XQf7bqB9sUZjgvG/fOYGaRKXpv3ca99cmjuPsBFlf14kMUkfox+LZ3S7rgdM7jOHfJkqivcVtjgijVuDsVhMmC7ZCa1FvYT80E8Rgsr+fraU4mgY35wF1dOEca4s2vGxhGT4x/LOH2DtFaT3zTc/+FX0P4BlwZ5vQwQsGG9V5+DEI8N1wZUPRzKSdjjQoFzR89m6vEBMo9fYFWLh2WgDsKzs+kCil0sZh3sng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0045.namprd03.prod.outlook.com (2603:10b6:a03:33e::20)
 by CH1PR12MB9669.namprd12.prod.outlook.com (2603:10b6:610:2af::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 11:30:51 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::f9) by SJ0PR03CA0045.outlook.office365.com
 (2603:10b6:a03:33e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.20 via Frontend Transport; Mon,
 18 Aug 2025 11:30:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Mon, 18 Aug 2025 11:30:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Aug
 2025 06:30:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Aug
 2025 06:30:48 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 18 Aug 2025 06:30:47 -0500
To: <buildroot@buildroot.org>
CC: <thomas.petazzoni@bootlin.com>, <ju.o@free.fr>, <romain.naour@smile.fr>,
 <romain.naour@gmail.com>, <ibai.erkiaga-elorza@amd.com>, Neal Frager
 <neal.frager@amd.com>
Date: Mon, 18 Aug 2025 12:30:38 +0100
Message-ID: <20250818113038.3885637-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|CH1PR12MB9669:EE_
X-MS-Office365-Filtering-Correlation-Id: 336c7afa-0cd8-4988-8963-08ddde4aaee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gkbGsW4fl6mlLldnrDNnde4Cto31qFjSZPay+e1RYPA6GVBblBWgaFGQZaGN?=
 =?us-ascii?Q?hlR4twqs8WQNbPeDQ2XlwASo/IU7l/760mOqGgQJl4NmMtC06s011kQ/+8yF?=
 =?us-ascii?Q?6B2DsHNw1eiUkm94ba30Ct7t1CwTaOxh3L2/maMo6ztOAfQ9TmeUU4RzM++S?=
 =?us-ascii?Q?U+DX6xeG91E9PtHYoOF5MHjRHvgBhcTlExZIxXzO6VU+nOAbLfG2ll3C8ZhH?=
 =?us-ascii?Q?BuN8JcoXLLEHJUTG+vRGF5jQt6OtdXZ2tOLhHSOUOHqtVA5aa3JBMA96swIe?=
 =?us-ascii?Q?c1+BDwMAH+OPTuj4kN1FHDCemz69YZodA6//Xo7GK3lHxXcTNBFiCYZRyR0W?=
 =?us-ascii?Q?yUrNdkV85lnw1ji+tS+XawtHl0UV5+3JoNfihdo8rGY69zNDP4Hm5rOMSibm?=
 =?us-ascii?Q?vCqTay+QfpkCwL6o2u44ajgamyWkZp3hlHs/1hmf3AGpedQkM2ykbDgobI4e?=
 =?us-ascii?Q?trBcj9JOao7hVATjhpnddq+Jo/32jvEmQIN/bLdY/JRUUvHIeLZ8nuaJVR5w?=
 =?us-ascii?Q?BEiIykDp3XQwfgreMNFAhf02zhEaVyQUiJHxBa+nlnhcyTJl69ae5YfvplxR?=
 =?us-ascii?Q?rE3EaJojSpTVo6O86eeXaBligRMoUuOsYs+nVQ46cVbG/QIWGOm/5htdU3bY?=
 =?us-ascii?Q?edsb4NvMMgiKQpxGQxSDFJCt2BdK19J+DdGTaxugo/aEMaslpA1fpnfSlsXK?=
 =?us-ascii?Q?6jL+VbxotUmDo/d/GWZPw2JWAJxDI866rk8gg2m5OPsZXxiC79BUmA9PaUTt?=
 =?us-ascii?Q?mbwE/uqUAjLSAZ0Sg+IrlgVsCixk4O074MXRSsi/Su2wAs0sQeVgcHe3qIZz?=
 =?us-ascii?Q?D/NegiAJUQceiFKiFEwxth2MIBPIDQcvVKaOfnkMkbWOxyS9ElO799vCo+tM?=
 =?us-ascii?Q?2smxEnBH4LkAWl704ogT+xO6dFa5pmJ07dFg+9UFOIO6XlMfw8uOo23rjf2p?=
 =?us-ascii?Q?CnBisY6leCsVlzQRtgjmcyJv5AzzNmQGBG8qfp9mErJvFL0wKlEGXHpnjuOr?=
 =?us-ascii?Q?o7FXvomcjc/e5/sRB6BySCwopf7hlOs3SXO6Kk7udUuqP3yOj1VLqKkGLuX0?=
 =?us-ascii?Q?0JvYI1mxiGmT/SPhGxGixAL2dlNHBhAMwIkn/zZDGV0lYh1m0i5nwY3wrTbv?=
 =?us-ascii?Q?NYrVGMH25M9Ryl0/u+lom0jI4tZ9sOWC8C+/l2a48+T++XcRthnYLvmHLwBt?=
 =?us-ascii?Q?VlQTw9DYjk4f4uERjmUSLjyjT7GM1oBO5OInnx3Bg7Jkio53TJu9IXg13jk9?=
 =?us-ascii?Q?QelaFombYNfWFIqp2QAuSb1UpJiBXhiE7p9yh3X08q/S/D9LqFKSq33drrY3?=
 =?us-ascii?Q?KD61UHDAbSudsG/MQuyd2A4HG6J9jbIxGQ5YB2GZrutmGr+hSa5EcUHOY52X?=
 =?us-ascii?Q?q9YiCSjFGz2yP9UH9aORM+6NbaP1fmD24yZBKrcRXJA2ORdL51YBtNDTrTxz?=
 =?us-ascii?Q?5GV3fXJdFH98ogbEq9r8ilqAPVzw2OE5DMeNZ4Jm/6dGQoWzReqdhlVUKb8x?=
 =?us-ascii?Q?lVdinvBR4yinpPk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 11:30:49.8229 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 336c7afa-0cd8-4988-8963-08ddde4aaee3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9669
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sv4/q5K1nal4CESzrPlQFI6Qy3AOrB4N+qV7/bv6apc=;
 b=kkiM1bN7TO66D2DrYY14fBZIHv2ftT+ST+Amuq3CimUH+Azitvw+rgREuEmAp/1Fn4uXIaGdXV75wVT8pJR2/WpgJvc1C8klRJ/GN6RApr0J8t7s1LZNxjhlfwMxzanqZMqkl8W5CnEA40P4xAGYhtD6gMY+oIwuOo4BHDzZUKs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=kkiM1bN7
Subject: [Buildroot] [PATCH v1 1/1] package/binutils-bare-metal: bump to
 binutils 2.45
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the binutils-bare-metal package to version 2.45. In the
process, it also decouples binutils-bare-metal from the binutils package
since the binutils package does not yet have support for version 2.45.

With the decoupling, the 3 downstream binutils 2.44 patches were evaluated.

Patches not needed for binutils-bare-metal:
0001-sh-conf.patch
0002-poison-system-directories.patch

Patches already included with binutils version 2.45:
0003-objdump-memleak.patch
https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=ba6ad3a18cb26b79e0e3b84c39f707535bbc344d

Since none of these patches need to be applied to binutils-bare-metal 2.45,
the link to the binutils patch directory is deleted.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/binutils-bare-metal/2.44                     | 1 -
 package/binutils-bare-metal/binutils-bare-metal.hash | 7 ++++++-
 package/binutils-bare-metal/binutils-bare-metal.mk   | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)
 delete mode 120000 package/binutils-bare-metal/2.44
 mode change 120000 => 100644 package/binutils-bare-metal/binutils-bare-metal.hash

diff --git a/package/binutils-bare-metal/2.44 b/package/binutils-bare-metal/2.44
deleted file mode 120000
index b8164295cf..0000000000
--- a/package/binutils-bare-metal/2.44
+++ /dev/null
@@ -1 +0,0 @@
-../binutils/2.44
\ No newline at end of file
diff --git a/package/binutils-bare-metal/binutils-bare-metal.hash b/package/binutils-bare-metal/binutils-bare-metal.hash
deleted file mode 120000
index e0655d3af3..0000000000
--- a/package/binutils-bare-metal/binutils-bare-metal.hash
+++ /dev/null
@@ -1 +0,0 @@
-../binutils/binutils.hash
\ No newline at end of file
diff --git a/package/binutils-bare-metal/binutils-bare-metal.hash b/package/binutils-bare-metal/binutils-bare-metal.hash
new file mode 100644
index 0000000000..7cf24141f7
--- /dev/null
+++ b/package/binutils-bare-metal/binutils-bare-metal.hash
@@ -0,0 +1,6 @@
+# From https://gcc.gnu.org/pub/binutils/releases/sha512.sum
+sha512  c7b10a7466d9fd398d7a0b3f2a43318432668d714f2ec70069a31bdc93c86d28e0fe83792195727167743707fbae45337c0873a0786416db53bbf22860c16ce7  binutils-2.45.tar.xz
+
+# locally computed
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
+sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index 709d072765..1ea1444727 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BINUTILS_BARE_METAL_VERSION = 2.44
+BINUTILS_BARE_METAL_VERSION = 2.45
 BINUTILS_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/binutils
 BINUTILS_BARE_METAL_SOURCE = binutils-$(BINUTILS_BARE_METAL_VERSION).tar.xz
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
