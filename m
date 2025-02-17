Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AC3C021AB
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 12:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 149F581249;
	Mon, 17 Feb 2025 12:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yF6UL4_2ChSS; Mon, 17 Feb 2025 12:20:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0597781258
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0597781258;
	Mon, 17 Feb 2025 12:20:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CF1172
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 184E060ED7
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lhlrt1v9i4OP for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 12:20:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::621;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2125760ED1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2125760ED1
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::621])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2125760ED1
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:20:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+lg1TejEbzGAKdnxRUv8IzNKTNG2AspVEfFdSi27SeKWfkaGuf5WCIRph5aeSuc2UM7ZDEg5JQXA4s4QYQ/9tT5SqazCXhHQ+i3hm+faGiCgg/+h+zywxwUybr7APjFPjpR3HItkFuop+VWRTVeX8kqEvYHNV2MW2D938QxNB3fKcOZkzB8Us2r9dEe2eTtV/VgwH1PWdPqcJFxy22jQ8mJAGONA/ZFR+A14aox98XUS0QGJypEdIvWxQ89rdKnNnfPEcjXcNPM0Qbws5/HQ60DueIbBqMSb1mEIbaVlywEhRxim8y+s0T9KLXM2HeVn3juExx7bTmCYhPa2v0pqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8o/09N/bNkr9/23XajAJJXQy6btSTm1BJpvWs6Wf82Q=;
 b=E6GM6UAmiKzbmcVkC5xwE4X+2Ck2SBRcXeLf6MJIbkGG9+g2u+YW+9UAxXrkkhNPRt84DNFKBVL7sOsXJiZ0Tj0RYFBKULiopZEH6Y5v1AkwXSMkT6u7yflqD3FqkgbiJpQ3Hvfhh1xlhx2ZvovOgBCIO4zRI+QytuOzeKSF7z/KwqOpsiVJnaOPmeymZsoNbsJCeXAtIly6o4ZtAoYnhz/sh4+EbKUcCAGb3HvCugRyDUrl/+gaFzcU0pqgeZ2R+WNN15/Tz+yz1oKe6bpdpZQKWeL/Gwp9viCKExwwfvJMIUhRDfrlykz/oH1Tsgwf5uiRwHy399tqm2pGzP4Jnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SN7PR04CA0177.namprd04.prod.outlook.com (2603:10b6:806:125::32)
 by LV3PR12MB9410.namprd12.prod.outlook.com (2603:10b6:408:212::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 12:20:07 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:806:125:cafe::94) by SN7PR04CA0177.outlook.office365.com
 (2603:10b6:806:125::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.17 via Frontend Transport; Mon,
 17 Feb 2025 12:20:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Mon, 17 Feb 2025 12:20:05 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 06:20:05 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 06:20:05 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 17 Feb 2025 06:20:03 -0600
To: <buildroot@buildroot.org>
Date: Mon, 17 Feb 2025 12:19:48 +0000
Message-ID: <20250217121949.2614857-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217121949.2614857-1-neal.frager@amd.com>
References: <20250217121949.2614857-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|LV3PR12MB9410:EE_
X-MS-Office365-Filtering-Correlation-Id: 52029d2e-3010-46eb-90b9-08dd4f4d69af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ElSM4pBLmX9Fz8pLGrs4c0fz6PUXJym9Sjnfigo/9SFlx7cK5EuWBZYmunxL?=
 =?us-ascii?Q?GuVaeuVA8nbpP3NH5nS6cbYRvEFRSf2Z+1ctHaJND4OU/Ohoq21rAZYExDSh?=
 =?us-ascii?Q?I73wPQddUDooFZJHeRJhif1anvyJsuBDc33W2kAQ7RHD8Cmz3YXzEa9fwbe7?=
 =?us-ascii?Q?A1gSo/zHUR/X//iS2SuHtY48rBIZDEsaCWT6v8Yj89s7GSm4SV+cNeB3gW83?=
 =?us-ascii?Q?8dJ/T0eAv/tueB3D4pWjD4AmMaRfKfm0HBsDGJqSo0DN+qGJ1Ke7tv3sMaZ7?=
 =?us-ascii?Q?BNgqf+D+PYMBs1BFvi3aSSuq8zDd7NZvWT6310vSKIFR4ecRkLmlE/gab6SD?=
 =?us-ascii?Q?sWQcaiR0u5FPPIU45ZViObagb3ZjbJRmCXckV+uGin14RJgAY+ZmVuuTR1PO?=
 =?us-ascii?Q?LYa4GprDMrMH54SHx+X6pAC3+JjirSTA9GtyLPrAhx29A1bs2hpErOdmBxB8?=
 =?us-ascii?Q?USZP93hcahbZVHNZbHClgmbKZrEBvmZWCbrzidaSnpeJ4JdMs7a8rw3i4JQ/?=
 =?us-ascii?Q?D5fz4jrYs89b5Jp+AxbEdDu6mm9tLKYTEafbGgP6QnWMqF7NKzEHls/jiZFq?=
 =?us-ascii?Q?eN17aIMM+c0sPq5UyGAIDcVgKU9CU1Cobf4TNTsTr6g8Baa0i3Gz4wNdSI5r?=
 =?us-ascii?Q?Bi33cWGjqTwd9u2fvJnTa1XMtdYF8WObdnMzc/T3SV89JJubHBE7ASD7giTK?=
 =?us-ascii?Q?qcyRiNTgPKNP4GvG0FLbJCsl42lzUWXJJf3jKhzqYQGpCEV6c1RC43Y+YhkM?=
 =?us-ascii?Q?2S8oKGYS5pieJKkXcnPyKPujMihoQyY9ud4xMMqqLj+YnTFMr7nw7qjj1CZX?=
 =?us-ascii?Q?V0KPyWpqHPvVUILgT+1B0EY2EVhy3fi89aY/TwVPHek2sQkNdvWYPL9gijOJ?=
 =?us-ascii?Q?6b1pPDi4L9QKL0LNNXqIcRrKNEzDDIo//IYBLfSdU4epdlmFXeQmXj5tIJFo?=
 =?us-ascii?Q?EBuEDn9Vlcc/0NtLB5g23wpJajtpMtTwHY8dd539dhGHCiDSUq93AHoCelut?=
 =?us-ascii?Q?o9/r0EY1EUeWmjhdl5HeBmp1pUD55Kjoi8wS6g2+vIt+qVffdFHI1l/Py1V8?=
 =?us-ascii?Q?hkM+VrQ1xHTwTkQT6z780+HtY37tT+tv8uQL0MCftxOyKIiCYymg1Sknejkk?=
 =?us-ascii?Q?9NksltQML/RPUhyVsI7xOjv3b2UZI7QT9gXMOrArDPOTJC7dccg+qeN4t9u7?=
 =?us-ascii?Q?9CpzYP4tQFXLzomrNLkUR7h3bT8tox496QGZFJlp1F+DlGkOQnSd2dvOHc/B?=
 =?us-ascii?Q?jqj2GIxWE4Fc6bK6Cdr2drNShEdbk9PCAYsTL4YRu/0W30iYfujU6kUTRstE?=
 =?us-ascii?Q?Qgl6X4bvlQbjHWfuXoxmXC81FFUiVEhB848Nna9u2Rn23Ds/Zcv/AQ2eg7o+?=
 =?us-ascii?Q?auwgrrgfVOpCWfxccWutbXfI+7tKzVyu2lckH0RPgnOSpwUELs8Hg2kFNcHU?=
 =?us-ascii?Q?xuJmnBst1w38H77QmrdinGRECN86zD0jRAFdOMXQJmZ/XcERjTJHaeD3o/eb?=
 =?us-ascii?Q?dUqXA58R3e1vvpnQYTRNVZhVaKxG0svDyH9D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 12:20:05.9730 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52029d2e-3010-46eb-90b9-08dd4f4d69af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9410
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8o/09N/bNkr9/23XajAJJXQy6btSTm1BJpvWs6Wf82Q=;
 b=nIWhkEVCx8U8IuKnrZ7Igg1LoMrxBJkhimVWzxaq4bcqlv62Aqs+BibRnpx83Cww+iBfbn4CmsO+0Zl/e7zdNezGdXlu63ODbR+oioIbpxLBZq8caSFsJj0RCWwhnzaeMhTZmnvCqw8hYKlLgkjngozVakiZ0oa8vB1rKJr5DGQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=nIWhkEVC
Subject: [Buildroot] [PATCH v4 4/5]
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
- no changes
V2->V3:
- improved help text
V3->V4:
- no changes
---
 toolchain/Config.in                                  |  2 +-
 toolchain/toolchain-bare-metal-buildroot/Config.in   | 12 +++++++++---
 .../toolchain-bare-metal-buildroot.mk                |  1 -
 3 files changed, 10 insertions(+), 5 deletions(-)

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
index 6fe969357f..19c97410c6 100644
--- a/toolchain/toolchain-bare-metal-buildroot/Config.in
+++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
@@ -1,10 +1,16 @@
 if BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
 
 config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
-	string "architecture tuple"
+	string "list of architecture tuples"
 	help
-	  This option allows to define the architecture tuple for the
-	  bare-metal toolchain.
+	  This option allows to define the list of architecture
+	  tuples for which bare-metal toolchains will be created.
+	  One toolchain will be built for each of the architecture
+	  tuples specified in this option.
+
+	  For example, to build both a Microblaze and a RISC-V bare
+	  metal toolchain, use the following definition:
+	  "microblazeel-buildroot-elf riscv32-buildroot-elf"
 
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
