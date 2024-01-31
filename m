Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046C0C47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 11:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A90C861553;
	Wed, 31 Jan 2024 11:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A90C861553
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ETRnu31XKBRb; Wed, 31 Jan 2024 11:23:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F00E761488;
	Wed, 31 Jan 2024 11:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F00E761488
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 312B11BF5E6
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07E3B4017B
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07E3B4017B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A7FqVNhSvTXt for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 11:23:26 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 712CA4012F
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 11:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 712CA4012F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ps56tN6H3+WmXckT6EO02dQw9RmoSEFj1eKR0nPXc1ekhWNkD2b3XF7o+e7ZJt+u69C7Xc6e887S7SdYgss4RZhxiJ9hB2SCgyxGjqxv3W3PTIVj0XP4n74WWNIfpiC5lpAdWcEVwkvunZaTpe2R8EzYuWGf1cNjfO5drdOp7kEHLJZC8S7SV1Ocm4KLlnJkEpVhmPU/76noajxmL+p+0IwPGip18q3vg3kazduEgssUkpDS9xDH98BCnuqpeImKKC9J/xAjD2MhzxW6FpgyUggnzq/f6rMIiPlgxaX1MUcnr462l9ynr4U7SmPdEUY9DrHADXl8+eLA519FR/LOQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yw2JXU8VIb+5YjsYhmotfRNkmr9qii4hTtPyM0EXdIs=;
 b=D6Ew38IoP3rqHnV2+6nLUx2mo24zEKNAI839Fzw3nMceAwPhazq1gKkadd7V8l/3PIBRLLjy12ina3joG9e33wgBKzf80EwSptBm+b2E/L2lnyU6EmwPSrd9rqR1c3MR/RgV6xuVy+p0PS9Bd4vyhF9SxAQCcoHGBkrl/qqdoRf5n8HwPhSpa84D50ZYwEorHYFtn7TNKH5JgWgOTNbDdbcWYH8CRDbNDbDKS2lNd7Gg2CHJfAPJltoGBCN6UqJf6gm/8lJzfLcwUDOrcfeBz9d7UBEPzIQEOHVlZa2oQ+3nErsZNSkxe2SWvrRfxAexMI+05MVN3l+LhKUMkBAyTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR03CA0164.namprd03.prod.outlook.com (2603:10b6:303:8d::19)
 by BL3PR12MB6476.namprd12.prod.outlook.com (2603:10b6:208:3bc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 11:23:23 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:303:8d:cafe::e7) by MW4PR03CA0164.outlook.office365.com
 (2603:10b6:303:8d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23 via Frontend
 Transport; Wed, 31 Jan 2024 11:23:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7270.0 via Frontend Transport; Wed, 31 Jan 2024 11:23:22 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 05:23:21 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 31 Jan
 2024 03:22:54 -0800
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 31 Jan 2024 05:22:53 -0600
To: <buildroot@buildroot.org>
Date: Wed, 31 Jan 2024 11:22:17 +0000
Message-ID: <20240131112223.2175855-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131112223.2175855-1-neal.frager@amd.com>
References: <20240131112223.2175855-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|BL3PR12MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: d2921e25-983b-4942-2c9c-08dc224f0933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NcV+7nbD4yZ9Leg6VyVHOR/z2Xh3O2ieoivFA75XjidNQd3iTXVxh/8zVuOYz5GIMmZAFhREuiJPEz5FotbNzTf5KOhM0zg0DPrzwz/vhim7zqU4y9BGBurPXyy6LZIjzSbS4dKxCUtPqS7LOnk0x4j5rATW3Z36NPMCad2saSnZY412di3Fu3RoHPu2X7/L8k8bhLKKEWwrFdKLlD3Q08qnioUvXtNgial/WjkCsLLub2u+IceZWGf4WBywLENfZa4G+91kS7dfWuXcyIt9r4L4ylMfFi6fJE+0aM5ALHBfb/yDOhTbASk7e71x/jdzEpQz3Oa6xF+VOS8sLKGm9KludNOLPyD2+D35bc1tZAAJfSfdxLDKuqmEj/fth6CKEj+AKjcGrfC/70n5AvxC4QTEA0/XZzD2eP7h58dhKZmRJFkMZhcaU458wQUE6QkT71iyuQL8R93YKl6R05GFiPJyu2wf8JfQ3Q6qG24w8+SC7tOXTn3PrRNwVVHDY0hj6ee/NAUNDqA8ErYFPPpFvj9TMCslJyNYAOfHsLp1O4r9RoRBPUOoWA9mcKkLaeAsx094FiCyNLSFTpt2zjInab2OI5fH5YWToWlSlcqZLnkc6b/kJ1e8fvaYGjHQLpoxYmyYbxR4mYzptIQ5vcx5oTJY9DbggiUZGxrJ3fKvmcIgpkaBj+C0txykHwzptApc80jnnDll1uWaCH9quw8pjdAYvd8WhqulizWWwH/VVpU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(186009)(82310400011)(451199024)(1800799012)(64100799003)(40470700004)(36840700001)(46966006)(83380400001)(426003)(2906002)(336012)(1076003)(2616005)(36860700001)(5660300002)(26005)(82740400003)(47076005)(70206006)(54906003)(70586007)(4326008)(8676002)(8936002)(6666004)(44832011)(316002)(6916009)(478600001)(86362001)(81166007)(356005)(40480700001)(40460700003)(36756003)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 11:23:22.9533 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2921e25-983b-4942-2c9c-08dc224f0933
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6476
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yw2JXU8VIb+5YjsYhmotfRNkmr9qii4hTtPyM0EXdIs=;
 b=naANRlJueyMCQH21XiplMFj+acdt/ldSvH1er/SW0AWH2Eeb5bvuxMrwdhSfI4YeQ06jMVd9oxVdZrbZl5PTuoZkFuueRNK4OgzJXUCYgdeJuEvTl6WDU8xwA0WvmaBlRDDvw8PTcrd1SziRtqkILtcHSL/ay2jfOyLVaWUUpxo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=naANRlJu
Subject: [Buildroot] [PATCH v9 05/11]
 toolchain/toolchain-bare-metal-buildroot: wire up newlib-bare-metal
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 toolchain/Config.in                                             | 1 +
 toolchain/toolchain-bare-metal-buildroot/Config.in              | 2 ++
 .../toolchain-bare-metal-buildroot.mk                           | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 64a07f91dc..407a03c42e 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -927,6 +927,7 @@ comment "Bare metal toolchain"
 
 config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
 	bool "Build a bare metal toolchain"
+	select BR2_PACKAGE_NEWLIB_BARE_METAL
 	help
 	  Select if you need a bare-metal toolchain for building
 	  platform specific firmware images.
diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
index 3c99c7e1b5..6fe969357f 100644
--- a/toolchain/toolchain-bare-metal-buildroot/Config.in
+++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
@@ -6,4 +6,6 @@ config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
 	  This option allows to define the architecture tuple for the
 	  bare-metal toolchain.
 
+source "package/newlib-bare-metal/Config.in"
+
 endif # BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
diff --git a/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk b/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
index 4dc36ef3f3..dbfe30a910 100644
--- a/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
+++ b/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_BARE_METAL_BUILDROOT_DEPENDENCIES =
+TOOLCHAIN_BARE_METAL_BUILDROOT_DEPENDENCIES = newlib-bare-metal
 TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE = $(call qstrip,$(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH))
 TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT = $(HOST_DIR)/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)/sysroot
 TOOLCHAIN_BARE_METAL_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
