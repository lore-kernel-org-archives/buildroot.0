Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5BCC021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 12:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FB174264D;
	Sat, 15 Feb 2025 12:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id osUzaGk-hef2; Sat, 15 Feb 2025 12:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1ACE4295D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1ACE4295D;
	Sat, 15 Feb 2025 12:57:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D4B7372
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 12:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFAC440741
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 12:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Kuder0LUeN4 for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 12:57:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::608;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B0FEF42928
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0FEF42928
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::608])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0FEF42928
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 12:57:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tsoqHNy+Q2/Y1uVS2SGohkI/Uq+syiZR8v8h8BMwASHUMGiFjs6l9Bu2UvWzHncswclzP6Ubic+DHZAq96Gtc0SBePaXnE3UNhYbw0WAGYYKYnyHHCU8Yhk2VruCfCgoVUWkvUcRVgIsRWJr8SuGHfNsAkxDUFA/GOXqiu58xP8K86AmOzWhWfjmYXFW20fc/XVCvvUWcM4/rkO3FhDTMbWA3PpUCqJzhT9jWy4jZ2LMVDwiGoFB01tTi3aMd+w6uZuwuP1ips23f35H86P9D1lB/ptzyxQ/ABKet+TfVoagdhVGcbxBd/aksw6okvK+M7VT0tESajwcw0SF47qtvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9w36qM4BAW2wyJUolrlsdsm3FFFnq5SkJZ3Azjz45ic=;
 b=HuElh0q8I5MB+0c0OExjKS64sHrcJoSh8dvJXX3QFw7MV66o6CEgieZL0asOjO3uz8q1ymHwhb4IH3vL8VY7y7qQCEjgEPUbeJ/couPDkvVuIV9TaCYSyfNjEf5jz4/u12dkxfNuQPB/DfnE677kziyQvyRJ2LtqcrCdeoSJgpbRMJJbQZ8eQWbFGPBjNORJ3Kpo5gA8TW4G0MlWSM8mp19+iLBmAlbZQYI1EMTGyzqZZ3rZ4j2Eir8fQXZJG4hTJ2OBduVV6/t8PrXPXiwLZd14rgdohuphThqc+uVom7/fy5kGWh7t4iKE1O6S0uVDqaperBMiQhCXUMZSPVEgdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH5PR04CA0021.namprd04.prod.outlook.com (2603:10b6:610:1f4::14)
 by BN5PR12MB9461.namprd12.prod.outlook.com (2603:10b6:408:2a8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Sat, 15 Feb
 2025 12:57:43 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::6) by CH5PR04CA0021.outlook.office365.com
 (2603:10b6:610:1f4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.18 via Frontend Transport; Sat,
 15 Feb 2025 12:57:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Sat, 15 Feb 2025 12:57:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 15 Feb
 2025 06:57:42 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 15 Feb
 2025 06:57:41 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 15 Feb 2025 06:57:40 -0600
To: <buildroot@buildroot.org>
Date: Sat, 15 Feb 2025 12:57:31 +0000
Message-ID: <20250215125732.2965257-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250215125732.2965257-1-neal.frager@amd.com>
References: <20250215125732.2965257-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|BN5PR12MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ab2fb70-a24c-4ddd-3080-08dd4dc055d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?28nx3YDvEssI03jHgM3tWfKfFepJaakjZdYSM9q3r1OcHJWnvfl5wS07ODVr?=
 =?us-ascii?Q?/dcU3BOtu2UoppKMqyo3Rsu7LeIkE2NR8TpS3QZ5L3UkiatOKWLfRsiNnVRv?=
 =?us-ascii?Q?RAXpeA7bnFG5YHHgINXfC8NBmL27wT2NemcvCjOcMmaLE6P3oYcwf7O4Ur5d?=
 =?us-ascii?Q?IW7sKbKh9j8M+H8R0f2NY2UTQp59LTrOJ6me289c/O2VENl3A1Zlq9F+4GEy?=
 =?us-ascii?Q?GAx4xL1eQwBwo/v8kwZVP9itwta2V6V70RCsFIn04EcdI6Q0IyfJC0Dqj9Im?=
 =?us-ascii?Q?/H0+CXHKCXq6ofRmfBgkdjHdhSNDTd+c4X7XAMs+wwlAhIEKG1oNE4wnZnOh?=
 =?us-ascii?Q?6MdtpJnqLNc+HAmh6ly+8MSDER091gQrISsMF/Vu3BTSRcTdFr9tt3vXKnNN?=
 =?us-ascii?Q?aMBdFC/QKGAzO7bzyBnxsjWVWllHWwsHlio/WfpRVyebMxSPiM9e90WWXWQR?=
 =?us-ascii?Q?hPlbYIyibQ3Bexe5Xap6oeZqO2iQfuzjGd2yP2cPiCyaactRKGKFs3X9YT6a?=
 =?us-ascii?Q?ngFXfQLlHs1yR60RTT9vymoF+lJ/U8+0Kc3KzjUF/cwv5ZzzgYQ1QxKB5nbh?=
 =?us-ascii?Q?HzHl0PJU5vfIsQUms+eUaqc1E/ucxrNqphFxWjkF23lH3lCgxGRanGQPH8NU?=
 =?us-ascii?Q?enZW2uWZPEessSfQw7G0+hq9xKF7KB7rakCLu2a8qgyneC4u5qRPJoYPDKXL?=
 =?us-ascii?Q?Kjcl/x4phDM4TIF3EqdBTvxV878IjKmgfQ2puh7nSbDvpfLUfxg/YGIlbZQX?=
 =?us-ascii?Q?x2E6xFT/wJf4uHiAT4Aof4x3kAKP8mUJQDORU7s62nD9im7vCpXo5e/BKc/C?=
 =?us-ascii?Q?V1dq2lEA9okEi1ZKI70hvkomIWhRjy/Fo4+yeAyQIMlfLqoIkHIodwp0/mhi?=
 =?us-ascii?Q?na8CVBY0ZKaGxoRBp3iV8iZ1uLQWjEGGYFluhRhS+iCjjD6WFEOqobxrStF4?=
 =?us-ascii?Q?XZbTTeOTz9Z56FVdStjSuAtf/SyDS1ozmOHq1BxpSh8cvXC3wjLetgTzWiDo?=
 =?us-ascii?Q?sMg3PRc9kzGQYJpRCLlhamdFo1GQhKcyC9ST2noANclV/Mo8JvfBrZ5ce5DZ?=
 =?us-ascii?Q?46xySiPVVcXkHb+tuer3Pdy/kY1oVddv7EvlY2Xu26+D1u+ciCpv8274eMh2?=
 =?us-ascii?Q?nz1Ssa2G/l+P3XjZmByhlMuA90pGvHCWmOo2Km6U1lqZnclRtBvTNQvrnTgL?=
 =?us-ascii?Q?crcwVYrSiEQw2Ar9sZt9Gk5/X8A5ni9rUvL/rEZnY+lrE8qJt3krvy3GQElg?=
 =?us-ascii?Q?xI0Lxn70jmXhuPoxkPbsgqS48KbumqsVmZySByo1A6liM8I2UDnG4Ct0fdL3?=
 =?us-ascii?Q?h3DebUrJQJU+pjc9bl82m5reHW0aE6NRZOLFiNlPe+1yvo/7wWHxmBzyJlv3?=
 =?us-ascii?Q?PMfMPR2Jc7G6uhEpG6SM8TQh0JLWW+iCuQ5fJwvkuJiz2T/SQzk+fW+eFMPe?=
 =?us-ascii?Q?jO/Nedj7PUv1bkZb7wagVbjBfUfkmO1Q8qBVKaIH91B1dCHd+olhLceyIcJW?=
 =?us-ascii?Q?ImcgXIEbW+lNYCpFEvFf54BVR3OuiS1aUKf1?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2025 12:57:42.4922 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab2fb70-a24c-4ddd-3080-08dd4dc055d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9461
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9w36qM4BAW2wyJUolrlsdsm3FFFnq5SkJZ3Azjz45ic=;
 b=qeCPL/NQSBkAGFx2gAS3lJgELREDrhlTmk1nObQwVctya+rB1/9rQVhiau8tF+FIHWvyJsWx+oBVKwKEFQw584w4ad3pVAsgCPCykxyTpWx8NVwxvNrCoGG68xpAXFJt2IDh4gWA0YWtfPRIMhnTClm6PoFKSXFrRljf+FlR7dI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qeCPL/NQ
Subject: [Buildroot] [PATCH v3 4/5]
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
