Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8D3C021AA
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 12:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01086606B1;
	Mon, 17 Feb 2025 12:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yN5Qb9Y9ssr0; Mon, 17 Feb 2025 12:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8ADA60733
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8ADA60733;
	Mon, 17 Feb 2025 12:49:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2D1572
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EB9481495
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFI45mYKmXaM for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 12:49:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::620;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BACB4811CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BACB4811CF
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::620])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BACB4811CF
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:49:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqeIzdN8Mb2iwKYycea5D8rGcj+xt1KbO7tq0Wb10H5SAmMF9Qmw0R5QFNtBwkvkK2DfvnunTEORZZdbjACIXWBStJ1Gc42CZSuEKURTQiO6xWOQiMe2ebA1KxOUZ64HFoHKCzOzYK0y1A1i1X1zSUpIN2x6G73Pk7nmuMGR9BWd2EuNX0V7uVeMiMw3odJZck1/wyjpA3rrKA40oQj4XUvFCOXBYxpzdRbfSxgQLs76svjaTbQNYYG/5N0/TBS2FAtRxpqHpv7ZmCnxpDT3R+ZX2gHrDab7IMuVsZ66iEUvAjlbJGU9Un7NVnfgBODZ4vyTBQo1V7j9d+ItMuoSSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mC9hA6H69HAlodZQhl+ueSD+VzJ6uz9oUoGICsAGr0w=;
 b=LM1gGYmlDIeBSPQMQDoSWF8syev2uSb2lwtlDk8shtythcd6gaG0jkHCxvLZv5rEY25Ne/qDYgaIKwmiFlH3iy95j4VwvHt8EZ5Vfxn/R6JeZ5u9efHvsfB1M7cviIkj2pwTtw6M2MMWJqqfckFhZjv/wanoCPH86Zp+eq5s/Q5LeULKDaCI64/VB2nGvbyMlJHcaHXAn4uoPYTNkxI9up4K+cY5auoCi6Elm5sTzz6EsoGXcJt6NVk1Ym21Ojo5cf4oauZs5xjYZJBdyZfKeQysrSYZo5OLPn8Q305OikDUsGnGWHnp4dKVz4ljj8Ww2u7VtLTLDLOyOxjp8Y9D4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR01CA0029.prod.exchangelabs.com (2603:10b6:5:296::34) by
 CH1PPF84B7B0C96.namprd12.prod.outlook.com (2603:10b6:61f:fc00::618) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 12:49:43 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:5:296:cafe::a3) by DM6PR01CA0029.outlook.office365.com
 (2603:10b6:5:296::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.17 via Frontend Transport; Mon,
 17 Feb 2025 12:49:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.2 via Frontend Transport; Mon, 17 Feb 2025 12:49:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 06:49:42 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 17 Feb 2025 06:49:41 -0600
To: <buildroot@buildroot.org>
Date: Mon, 17 Feb 2025 12:49:31 +0000
Message-ID: <20250217124932.2653445-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217124932.2653445-1-neal.frager@amd.com>
References: <20250217124932.2653445-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|CH1PPF84B7B0C96:EE_
X-MS-Office365-Filtering-Correlation-Id: bca0bdc6-11a2-4bb3-25bd-08dd4f518d1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FxBVECBZtbWTlhykjID/l3w1qpBoueBMMOlzyJ3upu8yUIWdZHHZsA0s7eHO?=
 =?us-ascii?Q?L79TMoFG7P1zn43YHn6Hx0mWCyOhLziqyWmTI0WA/M1sr9XScXGoxHZ7euVY?=
 =?us-ascii?Q?H5elgEa8s7Cefi+3ACtJKgkEG0q/1RQFASoAeJkL/B/GrBw8NnRZCoVHhE8h?=
 =?us-ascii?Q?6pANmg7V9YEYwcBVkV76n+wy+u+9vg7wgYhYVjyrUsDeOCVjkoSsmZP7Yl3P?=
 =?us-ascii?Q?UWhFNoTO5PSIeBQZZQdQ8wwjSAsw3WfChZnzOr46KsRhu6DccZgrar9uzAVi?=
 =?us-ascii?Q?IiIyOcpZmoM8jAF0/ENmlU//uNC6Hkh5HVVJfDHfT9GVo2bIy6KXhkr/mV7k?=
 =?us-ascii?Q?K3+Ed6THPh+AYa38/4tbmI9TVgFzvl9Y5P2dwlvDAvDi+fYIBTwx41bCCMik?=
 =?us-ascii?Q?spcmX/cseNGEcWecg3xAaGn+TPN85xxrrNqwWpAVvhbn+kv35kC65f66Tq2O?=
 =?us-ascii?Q?Ntz9sIi9YPSbZ/NTryE/9Ku8absrp1ehwLV6ghWvSH8WuGPCHGmhweaQmNFR?=
 =?us-ascii?Q?3b/Ni2Ud3epfMK0suuVKJa9Y6jinHlptDnK56B17deiX0WZ3Px2qVlm65w7w?=
 =?us-ascii?Q?cOCCUKk0sTGcn7kMnHIeHA2vS1nnNRNtsnHzpg2kJlr5Jt69FJ/AYkSbwo6d?=
 =?us-ascii?Q?yJ0vSQfmVIdSgadHf2u2i6yJTKyN/Q2N9XEtUQQRfHjmbRznh1JcsBSKJX2p?=
 =?us-ascii?Q?+NBDnkDnay+8UG6AapVvp8IykSyuhnCHLppP77QAQtwLIUGBTbUeVXClYRAR?=
 =?us-ascii?Q?rSmKOrdU9A3a7RBOMk/9PzSoixn0TZTTt8tFyP1tYvsV89Ro1zhE4iqkLo9L?=
 =?us-ascii?Q?mtwlOcG2rCmUrXs1ADZxJAp+guXCVgnjCDIrZMBJQ9P06i/VAwoeWg82Tzkv?=
 =?us-ascii?Q?z8j/En67o0qXyMx89uDqN1VL9q4z/ZKjdj8Te1Na3LLI1lw0h5QL/NimJmL0?=
 =?us-ascii?Q?fWoK4OSkyos2glmqNubjUY3quovjJNG5O/86UFIv8CsOas3Xh8FN3BgryTaX?=
 =?us-ascii?Q?NPAt2ZN672jdPXYFjuvl+v1xfcTMbfBvalFQWkytdW8PDzvtYzHJOWGOyu0v?=
 =?us-ascii?Q?GUw7v42Z7M0hNyK6tgsUQm534HzN5Qz7lbEfOFVDXq9Z0eLujKwqNcZQxKoE?=
 =?us-ascii?Q?rggMeIuHlTyB7tbQm5Vs81CHy0275DmRKE/u2iYM6nHqZ8WrAUE8pBqBpgCx?=
 =?us-ascii?Q?kX7t3DDkCYLCl+k/7byEF4nVJd7EKmsUPz73vT4b/fyOGXJ7x6CKsgi90+Y5?=
 =?us-ascii?Q?UVtxG6/VyIZ0tIERwrSNQZ76koJmBOO6tc3JQf97Nx1YNN983xbSZ2D5jBfU?=
 =?us-ascii?Q?p5doWeHdWgqj9zVJxCxb+kdtSi/3yRnsftnNZpoItvwvLElWyLLQ3QwdtQj3?=
 =?us-ascii?Q?p/6jAaHjjuXcEAzXKJBwRI55n57kSBwUO2t05sslACZimXVGe0XA6gzbiraT?=
 =?us-ascii?Q?WJB25io9I3IQRhx3XRBKEhfbJGA7SmEFRKqF4e0MRkOqq5kpZjEZLD/ROFtG?=
 =?us-ascii?Q?nGpWHLI3IHpoQ6m12UcyF+7jcHRIScM2FFmi?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 12:49:43.3787 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bca0bdc6-11a2-4bb3-25bd-08dd4f518d1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF84B7B0C96
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mC9hA6H69HAlodZQhl+ueSD+VzJ6uz9oUoGICsAGr0w=;
 b=orTwbq/o1lWasaSPKz2zbbAs4A4G4vwbR5daKuR/Kklbi/dKEE5LgYHKPaF5zMQNer8TpBBYzBmA33xU5GPSMRJ/acxiPbtqki8DonsyNwZz81k6LxMJRG6OFOCZOMzGDzOjBIyLPWKYo3GbhiDb2TrJiwwZFNMdKjMWig7lcZ0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=orTwbq/o
Subject: [Buildroot] [PATCH v5 4/5]
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
V3->V5:
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
