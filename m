Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F71C61CE7
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 08:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A56F742289;
	Wed, 11 Jun 2025 08:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8MnmXUpe9Fm; Wed, 11 Jun 2025 08:31:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E132442263
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E132442263;
	Wed, 11 Jun 2025 08:31:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CCE911F2
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 08:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD88542263
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 08:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMFIfEJ5q5id for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 08:31:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::610;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18BB142257
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18BB142257
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::610])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18BB142257
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 08:31:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7LmouutG3TopO0VjpXx8KFGM0vL3aVNzwFDJxl2u5DZi+b7CktPyr3GwvTFyM2NmFs8Wekqm0K0HkHa7UQQ1kuJzEjaSw5S6CeQmhs0mos0tKxaHXPpAbaksqxHF3bE++K/7p97l7VnqOg9TSInZ6gKOz3JbeS93+pi7lwA3kctaRpyWC4Nsmj2o4gbvJ+gT7HOzOHoPhbsf6QzPygh9Zy6C5jOhkMRHxa2LaUcfKcIC5PMwVM6N02nG7IkCgQ9ZcDnpCRnPBFEsH78GjblpceNqRkv5NW/ZxQlJ2QO4aUordMPh9D2r3WG4unorx4Z24Ysu34CibZzH8iixVf/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXUW9ZWMV7kXPBQc6HYQnS2DbrCHPr/OQ/s9x1VuX4U=;
 b=MKLdNkLj1g45DgUA0/5AxJccYkYs6iYJEsFA1AaQiCLgjIg6IFvqrckvZbql7lcYxcIwYwYEsfqKa2N8SK2k6JjDvp0gtQ5MuNqmZ8HXg1pMNLywAM21mFf/Hj72RsePmg3UD/xrx9MX9VS6HLsDyzdB3+aogHlMxjVVIt+wQVy60TsgjwWETRhnRSC3MWsOXm++vlePvqXSsXTD4D5zKCxv2M4RZivn4tlKBuBtrhW2b2lOINjXBt1lAuYnBR/czsh+v4s04yBQblrTnEDrtykRkvxuq+NVqSlUpMcAT4Uge6aC7Kgh6bgewTWpSuMcRYRfl+bjfKjbnSV+k5QY0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY3PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:39a::31)
 by DM4PR12MB7549.namprd12.prod.outlook.com (2603:10b6:8:10f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Wed, 11 Jun
 2025 08:31:44 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:a03:39a:cafe::27) by BY3PR03CA0026.outlook.office365.com
 (2603:10b6:a03:39a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 11 Jun 2025 08:31:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 08:31:44 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 03:31:43 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 03:31:43 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Jun 2025 03:31:42 -0500
To: <buildroot@buildroot.org>
Date: Wed, 11 Jun 2025 09:31:31 +0100
Message-ID: <20250611083131.1055747-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|DM4PR12MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: a23b44bd-86db-4bd3-2d3a-08dda8c2660b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0Un7p5Bc9A8wcoOE7zVlbb8kO+yaXk0KE2TctZz+O9gLZpslIWynG8y/hm6A?=
 =?us-ascii?Q?iuvIb1VS3Nc1pW2ZOL7pxNLGt2Z60GMactUHL0YUKY2vnd/SX1SIx9AVckJ4?=
 =?us-ascii?Q?HqZrLWQSrEok7bJhycYMVqRvpV3OcZBnOldX0lbVhyTHMxAGQSOKxHsrRfy0?=
 =?us-ascii?Q?IdGQIa6EBQEqI4R3K88i1eUoXWYu5lZStyxe1MFmdyxWK7HTVSGpG7jMmMiZ?=
 =?us-ascii?Q?IlAu4n9wB7zp0a2fm09kSJ29zSgJnKpdtGf8GoQBQkXCNRFnYDJMo953Fshv?=
 =?us-ascii?Q?IM8i8dy6g/kkbb5tTyLF9WCQn8zpUBvu2fNGHE9AVFIy+fJdELEMKeES2ouL?=
 =?us-ascii?Q?p5sK/9lFGRBwAUj+FYT3Gr1Vpe57LJBmnlPT1g+0+Lc2oTb1uk19N1b2Zy6S?=
 =?us-ascii?Q?SjbjM8Uy0nw4YOxEIKCTtB0ibyJzVgX5ib4Td/UpCfPsiPDTOrpJ2xXhj9lb?=
 =?us-ascii?Q?HipZtSeexkBJiBzgQaVGVJan8T0uyOfX8heMzUYHqTvuGtd9PVKDGrtKZklo?=
 =?us-ascii?Q?4ssff3J1bc/iwAaUqoSQM0iNXsKrpeIKeiGGQn7N3AVVxFtwN0cL+cnft8c5?=
 =?us-ascii?Q?fgNmy+r1eMZVbl4cjxpu/mKIV/pUVQuNnAhfyJUwlLgLrj8REWGrdi5bCuXw?=
 =?us-ascii?Q?8R89nRYJKSkPpDXh/dj5dtXhAoKkXxLV075ev+Smi8ajUfnlAbsmckqZG6na?=
 =?us-ascii?Q?Yng4pH2ZIvsn52TuIWb/eoYckKzO3uRe9rIqLpT2XF8yHdnSdoQtAMzTWt3S?=
 =?us-ascii?Q?8yS6s3ly8plHB/gzFUob/seF18WucRRa/iz7/xmy+dpAuJ+HlNKsgNFsHTB4?=
 =?us-ascii?Q?uQqKOylz5sq4P/R+J2B4dpA0yJISoYVkkOAmgSiOeRsOImJJgG3bCgPfb0FR?=
 =?us-ascii?Q?UmOx2IUCDbGu7JMDfhEkFGyKGtAjGSE7nVpj8T3uQkHeEbwBpXg4UJA3Avf5?=
 =?us-ascii?Q?z89BRYQpbLPR8UFvTtediaK+9IFCyyHJCD03Czs/W3fs7UdAvBIDJFPlp1bh?=
 =?us-ascii?Q?DxStMOy4YHI6zcro7a1gkboyU/WAuHKfYDzibontf0onSyy/5n7sFDiovR4l?=
 =?us-ascii?Q?OgHg/LaB5k0lFavA/SeAnTeyFkKUHTfkGMxzi/XSapbSdZ5iXG9a7GBIZo5o?=
 =?us-ascii?Q?qZtT14S/C7xk5UNoN8NX8UuoG22/+t/gtzxTGWf7VRHctM0TpjzdtdyJiq2t?=
 =?us-ascii?Q?jWUZ553UwmWQfjewg4K6ucO9kapC9juQJDEAq+L5s/ayzLslGKfxkCi0QnYu?=
 =?us-ascii?Q?yhIfdRRnIo68Gd6+2N+po2DsDBe+WjCLgqjI374aAZNy4bYPk8kqIAWyRvZE?=
 =?us-ascii?Q?+zLW78tihdWArz61wDFVOE5dyRrbV9NjGVG0nUr6K5gqwuDP0W0MSCNMUIaN?=
 =?us-ascii?Q?x9rjwAmJ6y7WtRYXmUrFxG0En/Zn0AA+NAXkQ4/AAfr30GTac3knvs6Yu8/T?=
 =?us-ascii?Q?wS3bXmKZyi9yb3pq30Odt1n2MzwcLp6DoZerK5JkAbilr9l9/KTbgIxRUXEL?=
 =?us-ascii?Q?Ecosmb3fB8jt0bBeUZrai9NLt4GucknSJ6qAlCvTzdGnqsrU0uSUr5BDy8i7?=
 =?us-ascii?Q?tJpeEdY2A0k7ABDfzFY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 08:31:44.4347 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a23b44bd-86db-4bd3-2d3a-08dda8c2660b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7549
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXUW9ZWMV7kXPBQc6HYQnS2DbrCHPr/OQ/s9x1VuX4U=;
 b=1PvjGATHl0cjpURwQmN4GPICPC3i2JCZsWp1MMDLZxnidrSfqZ3EqbVeRzm6KvAQxfwdAJB3cfDbt77qypZVhHLG7RbSjN+85dsD4KB4rZFKY/80yuQgPE34W+kCW6sxJo4qwfAo/kzlfl0ofaBbpHnwdah+15XZuMaz84ysIDE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=1PvjGATH
Subject: [Buildroot] [PATCH v2 1/1] boot/xilinx-embeddedsw: add comment
 dependencies
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
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the comment about the xilinx-embeddedsw package needing a bare-metal
toolchain was moved to the start of the Config.in file, it is now printing
in make menuconfig for virtually all defconfigs.

By adding the same dependencies as the xilinx-embeddedsw package, the
comment will appear only when the xilinx-embeddedsw package is actually
selectable.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- added dependency on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
---
 boot/xilinx-embeddedsw/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 12924edf44..0dd6433608 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -1,5 +1,7 @@
 comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
+	depends on BR2_aarch64
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
 
 menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
 	bool "xilinx-embeddedsw"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
