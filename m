Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89A6C5B543
	for <buildroot@archiver.kernel.org>; Fri, 30 May 2025 16:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38B048100B;
	Fri, 30 May 2025 16:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPG8WPP11dhe; Fri, 30 May 2025 16:40:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6303780ED0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6303780ED0;
	Fri, 30 May 2025 16:40:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C041A127
 for <buildroot@buildroot.org>; Fri, 30 May 2025 16:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD14B41B90
 for <buildroot@buildroot.org>; Fri, 30 May 2025 16:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nLlD2_ajmJWh for <buildroot@buildroot.org>;
 Fri, 30 May 2025 16:40:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::610;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 89F73409AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89F73409AB
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::610])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89F73409AB
 for <buildroot@buildroot.org>; Fri, 30 May 2025 16:40:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olBOB/yrcV/GZFhHnqogjTsGzD+8Z6nwpjUGeMi0ePGgzOpmuXVPPfeJ1CuLVBUo9xyLvcwo6NG+TvlAEZEuKQ8OpDqcbEx8ZPe4nOwkZjh5s5ECfYoFq0iVTxO1290LvTrJJxNcFXIxFcetiyHUSp4V+o0Yq5OccNjbUlqX0I1cOgdKz85fH7YRe0p+/yZvMPQUOKxcor4AyxgciWPGqg/3qIjw5pewfEaROEUUYxhLk0GLXVUaaGxMZCOT8bliqC6xDylJyCA2ATIjOon7vhmUXukJg6hQjg+vV2+YD/3kouHFDi1/ophbbRqXWm0rtOFKaE0D0rxzm4HVTvb0lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZWpEio9L1Yvl2CfpL8kq8xkr9jLhY/DC7Q7Lx40lDs=;
 b=L1bcjT+n1/59zZJkfXOYqkeVrlmKhgMou1HEOyNB/jTdmf4DzKJEqsvUIFue5xZTraMqXuAUEH/4zEjzct98MkHRl9hqMiye7yN5IapFkkMdPCLSH9wtReUdx/RF5LDYCjgRgGkrme/gxXUNHePzidSeR0WEonjbOvE80R1W+Ap7JJHDzulu6pXsrzReFJvn7RoE5WybzywILjsi0i1BuQlncBMH/6XVJak8pZUwt5yd50EjJtruPNS/9jb7IyMNDOW/MXGvpm5APEdV/wrMMkeyejx7UQNGgJSiO5j/BpNYu4Ufjg/tCVt8sIH3lwCpG1s26UyltndP5Bok3Sbb1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN0PR03CA0034.namprd03.prod.outlook.com (2603:10b6:408:e7::9)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Fri, 30 May
 2025 16:40:22 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:408:e7:cafe::eb) by BN0PR03CA0034.outlook.office365.com
 (2603:10b6:408:e7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Fri,
 30 May 2025 16:40:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 16:40:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 11:40:21 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 30 May 2025 11:40:20 -0500
To: <buildroot@buildroot.org>
Date: Fri, 30 May 2025 17:40:17 +0100
Message-ID: <20250530164017.473549-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|MN2PR12MB4357:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a892cf-fa7a-4f4e-906f-08dd9f98ab90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S34TJHhW7eZrvozzOz0JnMypDF4AFIV5oAje8gTYwSLMdQf6i3eKyE+KhR/c?=
 =?us-ascii?Q?XFW5Tz9jM6Ux99JEt1GZuHRBwna06I1J2mHECMElP0OFEsRJKA5eZZymC+cU?=
 =?us-ascii?Q?uezGGpWsd0fGlhuKpxozbuvHHrmr9R9BPHts27PB5YoSdsV8k2QLXvyV9RSv?=
 =?us-ascii?Q?ZAXjnAMn24510DxvJWbj6Qlyi6UH7v7iizVUgDs5iOluCx2ACaMAeeZZtuFt?=
 =?us-ascii?Q?UAWx4o2IOUsqg81izvjZ7Qz7Jgg5M8Z7XnS54LAglbOT2jcE7hzvfpb1B4zZ?=
 =?us-ascii?Q?kY/gwywBgevfMsCc5qWIsjFCvdh3t6O9vLWn22GrLIBGNOztc7Mgt38qR5ZI?=
 =?us-ascii?Q?G9/BdKhmML31ZwBOe/b1e1tAahfuzf/S7hkyCzNXK0phDt5Qkmw4bd6YXZ8S?=
 =?us-ascii?Q?4Yg9QcpnY70gF5BXmtgGpP982pvSz/TBJ0T/P5PUFxrk43XmF6KC6C4CzUKN?=
 =?us-ascii?Q?QVJhBXuA+vyOhUu2qUelNNQTMbZAD95nVltMCV/6/pG6s+wmbPMr/O/0fYS2?=
 =?us-ascii?Q?/JjnH5cBassloG8jcUIIm0rcqUSZIUboIAREuRPl3UXBSuBuMXLSB0mRVDKD?=
 =?us-ascii?Q?g/pqhrVE8RwF5NbJowdtiifx68xa9GCcC3sxFby1D2sJbWgrQWkRcCNpio9n?=
 =?us-ascii?Q?8+/+6u0IlyrBwXFEEactNkqjnRJ59aNdUBiLqNJHYQMIx8tu0BOvRb4JkEq+?=
 =?us-ascii?Q?t+fgslnqiwhMC1UeyZqAAyg6rMSbV6NRvPaF5eywqw7L2pLAMI/G/yc1CMYd?=
 =?us-ascii?Q?xk1uIGAKVyl4zWWaBJKoaCtu0ib2dMLH8Y8uXs3Nc4QYBWtI92xkUu1yt7xT?=
 =?us-ascii?Q?zHluFmBtmKAmuf6ulVd2p518ePGAt4+xEOwLr7FnsYDB61KI8UWXySlXyKhW?=
 =?us-ascii?Q?V1Z77K89tHxKc2E09SJ9+HI4lncFZ3WsnHXbDQj0zXGiky7ghIRd3Ks0ol4f?=
 =?us-ascii?Q?nk/Dyc8f52sYhFYe3ojQa7NxKSwwPn8qAolaIQLHKWZisQ/I4ADEZhZsYZAa?=
 =?us-ascii?Q?F3NhaJaJx19pMBEsyXDcJYqhZZj4lzjCSGnl/g0bgfxqr9E+j37DeaeKLBhb?=
 =?us-ascii?Q?bm6NEs54yvRkU8GpxbjsOy+NBR/LbX3oyNQ2st9lzqHZKCseM9L425idV2do?=
 =?us-ascii?Q?4HemzW5FBg9T4Hl7OBIlobrOv9uHF/t0KBaHOOfGYpTdTLMbUvstJ4ZimhZm?=
 =?us-ascii?Q?Q4Y6YxJrZZgUmGRXsYFGQ6wVgmBz9k27QShkZkBPCOdOhKYtSwHUBXZ7nzPh?=
 =?us-ascii?Q?kooXGWRPzi9YLrY+zkMwR8kkPjm/aaL+BXU0OUKN3AMwXa1y30rKD4vBobGo?=
 =?us-ascii?Q?c2dKGo3TVbDWT0ITqmSHZjmIyWUPXpt0RvfjmiJZpkftriC6P24p11LjHk/Z?=
 =?us-ascii?Q?sA70ICUalHB44KxabbxAJuS8gJGn9Da0w7wIohJQXdAMyi2++TBSsHzuCTCw?=
 =?us-ascii?Q?ZMsqXN9IWJVqPTz7PNAORgvDHSGDshbyMBuUCmL+SK9JTMIISCCnPX7xl/dK?=
 =?us-ascii?Q?ZrQCz3SMauKQxgpX0gFsyHfGogRlF4SEksypHRou1o6AO2EzsLT0NEYD8DGn?=
 =?us-ascii?Q?T/g/abejKkrnq/toXpk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 16:40:21.8271 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a892cf-fa7a-4f4e-906f-08dd9f98ab90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZWpEio9L1Yvl2CfpL8kq8xkr9jLhY/DC7Q7Lx40lDs=;
 b=b4Ai2X129EFIQ5ptVo5fQHAksyNz4r5al2Ky9UM33YR3jgKdPDx6LLQWgSZ72+niBJ3ir+o3y0NvH1GWTeXjpwO6id9/aiGhoDy/5pWTlq2NtM5j3HDYUEfwI2l3KIbg/thDglhHDBsB7oHXU8ewSKs1Xs76SX6jZEyfolTzOnw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=b4Ai2X12
Subject: [Buildroot] [PATCH v1 1/1] package/bootgen: bump to xilinx_v2025.1
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
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump bootgen to xilinx_v2025.1 release.

With version 2025.1, bootgen executable is now in the build/bin dir, so
the install step is changed accordingly.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/bootgen/bootgen.hash | 4 ++--
 package/bootgen/bootgen.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
index d040a2e280..7670a5d1ee 100644
--- a/package/bootgen/bootgen.hash
+++ b/package/bootgen/bootgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2c8345a3bea4fcec6ceb6c8f8e727a610aaca3ec71cdf7f892d7f89f88438650  bootgen-xilinx_v2024.2.tar.gz
-sha256  4da5f5eff0592e5d275f1871faf9e9a4fc0f6346027bfb777fa59d0aa6a59aa3  LICENSE
+sha256  3de43a331e10b2a8079d4681ad72cef4884bc3a09250d3d80811d677f3ffe560  bootgen-xilinx_v2025.1.tar.gz
+sha256  36e278ff2cc9ef95154a923bf4a9450414f358779045ae4f863c8d77fb18dbdb  LICENSE
diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
index 51eacde462..939872b29c 100644
--- a/package/bootgen/bootgen.mk
+++ b/package/bootgen/bootgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOTGEN_VERSION = xilinx_v2024.2
+BOOTGEN_VERSION = xilinx_v2025.1
 BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
 HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
 BOOTGEN_LICENSE = Apache-2.0
@@ -19,7 +19,7 @@ define HOST_BOOTGEN_BUILD_CMDS
 endef
 
 define HOST_BOOTGEN_INSTALL_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/bootgen $(HOST_DIR)/bin/bootgen
+	$(INSTALL) -m 0755 -D $(@D)/build/bin/bootgen $(HOST_DIR)/bin/bootgen
 endef
 
 $(eval $(host-generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
