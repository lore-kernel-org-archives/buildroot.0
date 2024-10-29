Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32ED0D5B17B
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 14:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9DC0406FB;
	Tue, 29 Oct 2024 14:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_cZDW1sqfSb; Tue, 29 Oct 2024 14:12:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B7D0406F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B7D0406F4;
	Tue, 29 Oct 2024 14:12:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C52B0112A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 14:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8E65403D7
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 14:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHC9RIbz6NV5 for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 14:12:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::61a;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7423F406F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7423F406F4
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::61a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7423F406F4
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 14:12:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpZfzXXYcoT51v0ltjeBYqqSBJQ0DCk843moXt9j2W/NlugmtAIe4XB7uO1Sbt+BQVXFoqWrFmM8BK/LjlocOWyLsnalolBpx4Qyg2zQyhI1YwKjkE6x85GyGOn/FkUvdLxPG0BR4GYTA8NQwQv5BbaXlvTtWIXaJbAnB5z45ihfIT5jmXo9InHPYu8WlcP7MQ5fkrYJUWGn6OCyFl0U7tV0ZX5Y+tkJrHeCSPzVMGAr+owqbyPPqSLPVNvU2BpjLqmyVn9Hy5/WTuB5vGevMg2z25vRh0qXejjwwbyt1+FpAUvUUtzrvAKAJuS6xoEoReYgExooZypWcnk+EJpwBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqPHqaiYJMseGBbo7d7O5LogDife37as/C8igd/lHfI=;
 b=s8OLbfyIdo5mdGR3xoLb/niQ1WrJdVE8RBGFKVEWvPlZLtZ4852yMDVPMNbe9F/UXr/LQEoODh4YUloaetldehNta50WIW+jmsPEM9sJ8QOLNy2Ub9W9giPy4zIXY667TionEH3WeAir2tMKzL4ZTMuTXdCT4cM76Fa71DSjdmPGhq5WyAYer9oEBSC+brCGPDLr4Jh60JpA8N+MQddFZast2kI0XzsLlgAxWGFY5uACPP2CnMqxX0nQwCsb1Jxy5Iza3xn8jVxGWpAqUzsFRkkUn1+p6ZXB6nnumoEFAvpqXQr+dKgcSPyHeJWeP6WZS5qGZV2/uCgCSqsAlZpe1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR03CA0119.namprd03.prod.outlook.com (2603:10b6:303:b7::34)
 by CY5PR12MB6432.namprd12.prod.outlook.com (2603:10b6:930:38::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Tue, 29 Oct
 2024 14:12:15 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:303:b7:cafe::2) by MW4PR03CA0119.outlook.office365.com
 (2603:10b6:303:b7::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25 via Frontend
 Transport; Tue, 29 Oct 2024 14:12:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 14:12:13 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 09:12:12 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 29 Oct 2024 09:12:11 -0500
To: <buildroot@buildroot.org>
Date: Tue, 29 Oct 2024 14:12:08 +0000
Message-ID: <20241029141209.3780984-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|CY5PR12MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: 748b833d-f8a0-480c-9ff6-08dcf823affb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W8RG8IpiaIOe5UJCFkqPwkarOHntsIgmEPKUHfmn8v2Tm8NGVi/RM57HodH7?=
 =?us-ascii?Q?nOtv5y7c5rubpNV4Z45My1/H3WmfAJvPUXyuZI6/cWRPDKqz9UrtLCt0H0sD?=
 =?us-ascii?Q?MtmSqSMUszqQqamRZyNePuZ5coDAiADiwXpyDChmUV2GYmJlLiLm6s/CNcPX?=
 =?us-ascii?Q?lv93hmmeOQKaR16M+5TTVatqdehjL88Osd5oOp9H49Ty5UY0UlvqEa+RPa2m?=
 =?us-ascii?Q?Pt2sbMO4r9UNdQQt6coPev6BEGBl/u1QBlmxWgHxYJtWZCn8TdzrIpKuIEUR?=
 =?us-ascii?Q?+A/fi6s32NHqZMFqhVIXmEh13SAEF0by0VGCBpk8KhxFOoTsA1OeNE9sYOzD?=
 =?us-ascii?Q?MLstPlugo6b+xWtxMpgTjA4SNSHtHdFwKipSnn3sPoz/2o1zRY9wFXIKqQE/?=
 =?us-ascii?Q?PzOpJITgbcoD6e4xTdI73HrFGOz4uvo0EYfUBqIPKYPTRbgwoi+vr4a7hx0k?=
 =?us-ascii?Q?k3+o8RANQNxip3za1Jj2yh6TFAz6NVh/yn6FAyfTyDbss3XrMpI4Ows0AhqF?=
 =?us-ascii?Q?t1fZ2qSmRglEJramBBNaYAVv7Pfusc5+rDqPkhrdGvN7ENzNTUAGEt8oZN0M?=
 =?us-ascii?Q?rZUVkyqzSHtbD/aNAkfMQA8cZmYPUSp1VcsskP2DL6KEJFCS5jIRUyDOVjDz?=
 =?us-ascii?Q?O//owEow+uhugqBnsjbUUp5MhZrI289SWp6gD8MNVxK8dtk7vfCnuSlY+ArY?=
 =?us-ascii?Q?tOV+7jFXP6DH7VL75zUE3XSK2BwEFUdlNIZgo/7qIX+0hD05ybMsE0dp1SJi?=
 =?us-ascii?Q?h8ZVAcdpNmc80x4WBEsbK//vPgw2SGsz9repwMYXnVrqwgn/vkQw+z4oeNx5?=
 =?us-ascii?Q?/hcBQW9RsMJFUr/vC5l4eUohjI8do31yobphi98+q/DV3OyizrSpYf9FCRKi?=
 =?us-ascii?Q?dMriCHLLJX1X+4nbgrvBaLKXp6+zkNKI0WreWqtJlYZ4OiyVg9smgLrE42bX?=
 =?us-ascii?Q?FNCfP0hLeoeTAkEbN0rGZAlLj1k6Ji5FQ6WuFkOcBT7/hi5hoCfXXMHar5Zq?=
 =?us-ascii?Q?yhzekz1P/jM8uXW5TKcNhBPK6Civnmu5n0ojE/g5UiOV0oXpRcOp9gImvhVy?=
 =?us-ascii?Q?3s17Y6ttoUJqotx5xv4QmnizQDgf9LK69VoueXOgzXiaDAq4yviqPQ0FoNO8?=
 =?us-ascii?Q?go8aRREpfoae0+a5HlzNTT7Hpkeuk04HEGdkQxPmaZmw4m7FDvD8+VG3pixT?=
 =?us-ascii?Q?JorvIy2t2M3f0avN7E4HApTiN5/yI8IDNl+bYzYPfenjjsfxAWr3SEE9An12?=
 =?us-ascii?Q?PTUmrXWPBRoNUZJLO6cOPa1jsi4bNwAYSQxmUv9JfNz7aVHPxjxVjr77D30U?=
 =?us-ascii?Q?6goCBwPmP6+LZe9bdaJGXErnU/UyaQ1+M1nOlzt1Vat3Zv/TIU03n4cNfYF1?=
 =?us-ascii?Q?qqF4ynalYlSiZH7zwwlr58SG58PyaCq9XVI/fQZtp0kKTTZoZQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 14:12:13.9033 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 748b833d-f8a0-480c-9ff6-08dcf823affb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6432
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqPHqaiYJMseGBbo7d7O5LogDife37as/C8igd/lHfI=;
 b=CTRhliHQzYU0B7VzhU3EABCSud1GEThZpgDJyssKAFwn5406IO+26H8yH76Vh2CVNDS/QwI1Nv8h+huhlL4Tn4axRARmBmWt5RbYu3rGWoBfKH1RefvAeiVOMUcAPzFpgHfB4rBVMkQ035sQyYgVyJ2ByE5lvw+70bZV6M30m1o=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=CTRhliHQ
Subject: [Buildroot] [PATCH v1 1/2] package/binutils-bare-metal: clean up
 variable names
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removing HOST_ prefix from variables to follow buildroot coding practices.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/binutils-bare-metal/binutils-bare-metal.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index f2f223387e..a2402888f1 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-HOST_BINUTILS_BARE_METAL_VERSION = 2.43.1
-HOST_BINUTILS_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/binutils
-HOST_BINUTILS_BARE_METAL_SOURCE = binutils-$(HOST_BINUTILS_BARE_METAL_VERSION).tar.xz
+BINUTILS_BARE_METAL_VERSION = 2.43.1
+BINUTILS_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/binutils
+BINUTILS_BARE_METAL_SOURCE = binutils-$(HOST_BINUTILS_BARE_METAL_VERSION).tar.xz
 
-HOST_BINUTILS_BARE_METAL_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
-HOST_BINUTILS_BARE_METAL_LICENSE_FILES = COPYING3 COPYING.LIB
-HOST_BINUTILS_BARE_METAL_CPE_ID_VENDOR = gnu
-HOST_BINUTILS_BARE_METAL_CPE_ID_PRODUCT = binutils
+BINUTILS_BARE_METAL_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
+BINUTILS_BARE_METAL_LICENSE_FILES = COPYING3 COPYING.LIB
+BINUTILS_BARE_METAL_CPE_ID_VENDOR = gnu
+BINUTILS_BARE_METAL_CPE_ID_PRODUCT = binutils
 
 HOST_BINUTILS_BARE_METAL_DEPENDENCIES = host-zlib
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
