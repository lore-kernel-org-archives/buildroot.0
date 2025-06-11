Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A272C677C4
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 07:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE1134221D;
	Wed, 11 Jun 2025 07:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYIB-mlygjRM; Wed, 11 Jun 2025 07:52:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CC0842324
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CC0842324;
	Wed, 11 Jun 2025 07:52:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 43DC4237
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 07:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2227D403AD
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 07:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYXnh8lxjq7N for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 07:52:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2406::602;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3734B403A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3734B403A9
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2406::602])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3734B403A9
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 07:52:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unU/iNEik8NOwbzx9ced9Rtn6pM5mD7jbsFNYAW66s0Am8EORipks0DuxwVhnxVcE0Br/iS66KtmplPmkUNXvSzR3Zsl+IqBaJuqW9YUuYMXqb+HXt+qunx6gniNuA6BIPmiiihZRklCvUFrWdMCiYftcPI2B7vvXyIRs/5FqQ6VhSagoJcL1NPiWW0Ub9QaQV0G11xOsnL/kbCfMDsJLSCMVxzkyGDYBsfqEl9/Io32rTBLZodfGmTmLhhNvrctWZeSXHsGP0mU4JPLPatm9flZ99AjfblQgJdjpQB3E9CBDxJaaS6yrfK3D1Vir2k3VCP0Mdpmy/9MmysqiF7zQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kl0sIxLfIHyJsv1+gnp/aKljJkSdD8uMOZB1rg00sA=;
 b=B56swFSWdbAj4w0h9cHtNtYRYKEi8q/BwPISp31C2qbGoTi7lLGtQf7bKJdQJOg4fW6JrfQOseAn7no9iw6iXuiQijAdXO7hH7MGteLGbE/WwaB+HWAZ6K6GXVOWgaZEJttowKExvz4jLguya0akk0SgZg2BEK3WIgh0JGqBEUhVJX9IHvHwEm6LikBycLZs6nDb4Tf95Kzyst8E30xpNs+ye+adkKMAU+OHf72KdSyXtrMlIj0flC3VOGHBeDRUZnqb8Qrg05NGXH4xScXU+9V6I8PBD0V52NzfHJ6B9Kw+eETYgYlPIGqhKOPJLC9ctL5YYuMeO8s+FduPhJp2xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR17CA0010.namprd17.prod.outlook.com (2603:10b6:5:1b3::23)
 by DM4PR12MB6469.namprd12.prod.outlook.com (2603:10b6:8:b6::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.18; Wed, 11 Jun 2025 07:52:39 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:1b3:cafe::92) by DM6PR17CA0010.outlook.office365.com
 (2603:10b6:5:1b3::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Wed,
 11 Jun 2025 07:52:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 07:52:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 02:52:38 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Jun 2025 02:52:36 -0500
To: <buildroot@buildroot.org>
Date: Wed, 11 Jun 2025 08:52:35 +0100
Message-ID: <20250611075235.1039898-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|DM4PR12MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f3db18e-00f1-43fe-0a34-08dda8bceff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9khixs64M7wSYX/4XcgukdLGe4jgoNlSfdLR/cYFGG1+xobbpeOyzZNuag9d?=
 =?us-ascii?Q?SOzmXiVneAip61in/GSPxBbHkAl1QeYXIvGeqnPqUQIrvlfSa0QUgBIFN9yf?=
 =?us-ascii?Q?Udm9TFn6OlO2PQyNG2pQLay6mGbi0pZ5R6ud2ps/VSuIFMgHie3tsWl1WRuR?=
 =?us-ascii?Q?zLyYwcdgeTefeQ5tPJqt0cyw0LlssSDlZTvagwuSHMMkMoUcpu7QCriLF6l4?=
 =?us-ascii?Q?9pWYTYtYwiodDCUqvGG9V0eZtt26Pvo0TRoju3aNAFCyn7KeC+7g9u+WF4SI?=
 =?us-ascii?Q?xUTllgBL+JPWdXPSTNGkB4XcpGq1A+NXnX37F1NlzIx3HLU+ZwCxkbAs0tUL?=
 =?us-ascii?Q?O3JW9WaoeZ7LmszlmvzCtS5jndO7dyzcoSkcFiGENhHGr52YnT0GPkvTlZaf?=
 =?us-ascii?Q?M2kc/Cir8q7lzIC8y3EvfBHv6qunZvhn9NWIAxxC0vRcmkjxHJgOZC9PdB6g?=
 =?us-ascii?Q?YuxVQNxTZOtbbRNKEtVzLR6ToioMpK0F/DwTHNJqmK8bRWvSDuq/mZPzYTdZ?=
 =?us-ascii?Q?VXgnXmIsCiavJZ2a5uotz/O2neBptAk4DD2ulsmRjahVT9maVTf8y9hfc8Zh?=
 =?us-ascii?Q?f+SJ/lt6pSF9s01bK3HtuhC721GxGOnmzPqzerTlguKQ3Hxaf9YcMqhE5eHh?=
 =?us-ascii?Q?D4UiSi0BhxzcPtkqcasuu0quXT1LiePTJzn01bPFlbUcOUbE+H0+uZNuw25r?=
 =?us-ascii?Q?bKQdXxiSKGYR3/5FWzwbfnvEeJaXTJk4paX1i+NOSizACL5WYz9+G4Nal2tE?=
 =?us-ascii?Q?mOK/tYQwypCwlBoSAhwsiBZ8XwQq4g18T9P65g2oUWQchTI/5atC6hAkfVAR?=
 =?us-ascii?Q?5rdVxS3D3daF0seczz1nm/WkYxkXXr1zqyJVYoVt7S1jvcqs2QIYeXKxouDY?=
 =?us-ascii?Q?+cpfedg+Z28H6dN2DrfEQF1F4Hz7u3Ht/c8T9JayvPkeuBEIWJ6cWeH5BgOk?=
 =?us-ascii?Q?OLJOHGbevRa/tAN5d9agC2f+3Sw/I7N0Q+OsxUuX17iyGjZk0ea9Ji3NOO3p?=
 =?us-ascii?Q?UHaCsQ1Q7RKGBCFfXbbDt6jQTqr2D7zn/nCYgFfN/eYUDOUq7HjwVH1EuKFr?=
 =?us-ascii?Q?Y6w8qvkTlf1J92/BBMdttwrdPSvvXUzgM7w9ZDXancvAUbThVnf/zFQzYg2Q?=
 =?us-ascii?Q?UnkPKktLMJ60NsTxBq8Upe9BqslkGC+xeuyaRdfYDjQ8e6Iz95tAKaXFq70q?=
 =?us-ascii?Q?pi6doiAiOoQm9togwCC2EOjC6PKVM+UJOoC1IBL+a8crlDPfGe4W+zCcY81g?=
 =?us-ascii?Q?paqzXzsUqdbC6xWVyVHKBqm4YBGE5TFrEcQd6DphJDVIx0SHYzdpMhVyhxid?=
 =?us-ascii?Q?Y0TcBRs4UDsegcdUC0fHwpWvqOwAoigeys+seWj+2XIEBRWEI7kFECBXyGrh?=
 =?us-ascii?Q?BB44hKRbEBDH2r2QqbFuY7b/HFsdG7Or3Fut7QC2DrDOQzHH4+Snq5Ufw7dh?=
 =?us-ascii?Q?RwJYqQANLPijbPVnjkiyhIP/nSqFWvpVAcdYpIqp/jXYFBmRNwJPpVLDlizD?=
 =?us-ascii?Q?9yLjjZ/sjgKzBSs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 07:52:38.8669 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3db18e-00f1-43fe-0a34-08dda8bceff3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6469
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kl0sIxLfIHyJsv1+gnp/aKljJkSdD8uMOZB1rg00sA=;
 b=JWWZzvb8sL5vTfLO+86mLT8Ra07OsGsX1XmXe9fmhBktND3LM2GYYETM8E9U55kCKvxPiMfSOMxOMoxV3ruGYOkngnXrke/suTSwrfUx1WswSszZc00gCCDmmFrrvD9o7dCFflfSeLxvIZOcxVTUVir8Lzsxr/PS3cK5r8Ylwsg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=JWWZzvb8
Subject: [Buildroot] [PATCH v1 1/1] configs/qemu_microblaze*: move to
 external Bootlin stable toolchain
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

This moves the qemu_microblaze defconfigs to the Bootlin glibc stable external
toolchain as per[1].

[1]: https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/qemu_microblazebe_mmu_defconfig | 2 +-
 configs/qemu_microblazeel_mmu_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 9d67d71920..8ad377979d 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -1,5 +1,5 @@
 BR2_microblazebe=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 46befedd57..c2bf2201f5 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -1,5 +1,5 @@
 BR2_microblazeel=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
