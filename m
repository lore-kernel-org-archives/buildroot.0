Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EC3E7BDB0
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 12:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0866F81010;
	Mon, 16 Feb 2026 12:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eRaFY2Lh72Ma; Mon, 16 Feb 2026 12:54:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE58580EFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771246480;
	bh=XuHoTa8A/u4ayoUhubosnJkgSU507PY+nRAiiUpjghg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=saueanXHh3xo4VEc3PyGKdbxGu/eWuKQrbe0nSwHNWFAJmZg3B+VxHMQLvbwN8fOP
	 18CSf7ypWLxggg68bJ4QXIvZlqa24XZuy5BufbFTRuEGMIVJcz4Pcoc8ZthjCCUuvC
	 Jj8PHT+qWpmaVNdP4EuPaURDj6Gg3+GNvJ55xtE4sVlGqctgWNITAtex9+ln6X2+Uv
	 Hb//hwRN/Bu9v5f1Ex1zUaR+EMNF7mDlQZvWSnYAvlH1XyQptDEhUDI50bZ4jeZ5ZH
	 WP9/WdiIblyPOsPkw0m1pxVU02yUxNCQVF4vNXdMESLobEDdKDoXjOnMuTK3d7iex/
	 3n6c1hsJjAFIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE58580EFB;
	Mon, 16 Feb 2026 12:54:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 61BAB1EB
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 12:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42FCF40ACF
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 12:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXR3eKi4dxnQ for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 12:54:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c112::5;
 helo=cy7pr03cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E5DA040ACD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5DA040ACD
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5DA040ACD
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 12:54:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OS1jMPcmnVVUwrmOWmQW297+CWcQMQssOkGR8BjPzegHLxAmqznZGSqwNgxF/BjrqPc9FzRm4p2VxzSf39uVT1/721jTId9gVhHFcI30b2buC5ewlaSdNLHwW8Yggl1baxaCGOWOx/GOFHqueM2jy6fJyT8+ovqOVZ/zG13FlLGZ3hC+tYRDvVLvHUqi6tqSKhGgT5Ttfm9Lt1LpkYQ/3FA6Mbgz+JPwxTxwBvKMxYy6hVZz7XAkQUC07qixZV4OSVYZQgurLrIhuZbX15opHYN5SVUbtsfVKmFJE7Xmv0APU9y8dqitnCCbPU79hAICoJI84SZh7rUeSFUQXYExcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcV0Prz10XGm8nqRKqlPCvb85hqwaG5u+IBNkSX8dbA=;
 b=tPXd3LjINPVMHfNgh1c4dSCQ0NIh0Hna6e3urWmqTmPjV4yEZYlUK0Due5UxmEVEaqB9xy29MPcDbAy+Lf56jockK3X6V6VdfPjw2kfrxGZDG728l2lssGdJ8c1EtYmr38M7cqh7qL9Lb5Nlf4geeBsHajACM9wZ789t4FARWBBiIGCSbBH7EYie+Y0uoXNgr5Qcko0oSCJa+eZTpbG0vynbiYlDniwF0ndqBNxJWLc4ZJzW/DOWa9K/WkNiSKuW7P2qp8CFn9M2MLqh9SrlnKqOdu/HNx9Z7kW/caxvszuj7rXf89dYJCEKIvSTShIxN/94LAEmvtwO9Y6sF1RbwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH8P220CA0059.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:2d9::7)
 by BY5PR12MB4260.namprd12.prod.outlook.com (2603:10b6:a03:206::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Mon, 16 Feb
 2026 12:54:31 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:510:2d9:cafe::95) by PH8P220CA0059.outlook.office365.com
 (2603:10b6:510:2d9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Mon,
 16 Feb 2026 12:54:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 16 Feb 2026 12:54:30 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Feb
 2026 06:54:30 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Feb
 2026 04:54:30 -0800
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 16 Feb 2026 06:54:28 -0600
To: <buildroot@buildroot.org>
Date: Mon, 16 Feb 2026 12:54:27 +0000
Message-ID: <20260216125427.2476384-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|BY5PR12MB4260:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fbfab92-6481-4f76-236e-08de6d5a86cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|7416014|36860700013|7142099003|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hu56v0C92l7NuHocTPopg+MG1KlTNldN3HtUJyOZvSZOhKT7+qwT4CYdZmbT?=
 =?us-ascii?Q?IzDdXi96TCX6iS6YuXK/ZOfWYd+TtP+OPYIAF/IXb2TozFNfDX85HxgkEFRl?=
 =?us-ascii?Q?B2XyGKdwuOz9oIdgAyexzKyB4aIsC0oxtnMZOf6Ht48MqDy9Bf/bEuPzZMxK?=
 =?us-ascii?Q?h7e6KQxw8xAUZl8ern2t1wJAUSpS4rMTHEqpsXbgePLXOMyXAg9871yzi2Na?=
 =?us-ascii?Q?DXUO1g0VoYjbjUoPCprqeNPgE5XokdR6K2E4gtISAblpLRQVQyYNSOnp64RN?=
 =?us-ascii?Q?NpJpkT3CzrRiY5VXCYkoLrTD9FpXTcmBPWns6xlkPhmSkS2OJgyao6XibhSd?=
 =?us-ascii?Q?50JGE85DxRzO49C2wjY/21oFQeA/OFKK7aJt3KwdCzxqjjdmfXfCLvwWszN1?=
 =?us-ascii?Q?LjoIO3F6s5ZcczfM9r9Ooz+OcFSvqqEthhS2XqxoC4oLA6cR/zI4mocfk1Og?=
 =?us-ascii?Q?+D4NfCtdirxEolttua41aZ7bGAEd2hVzxFoLDgp0UvNWSkMTlwHHkIMm2hzf?=
 =?us-ascii?Q?wWrGuEJrFNReAHzvfD5JcMf7Yo56WWd+FlULvZ7KU3g6muonCiz8C0stJbOC?=
 =?us-ascii?Q?2rNHLVieZLscWwgFf9dYLPGtJSnMwjJHGcwL6/ud3nuDTdTo+MnnrsUMY7EO?=
 =?us-ascii?Q?bo7nmcycpkN4MN6JWow9LnRoS+hqPh5FfInlf43LkOOcglSaqFAkBUGIswHl?=
 =?us-ascii?Q?kiQhP2q8Vf1T3Qv2mwiIdj4gY8OXNC8rLaBnUcC5iumxD3xnhATeSg5ffiog?=
 =?us-ascii?Q?sN70hItTq6DYCJEdQCqBWttBxNexrAg18gCC38os49p9909yJBZ3TZ6XzcoJ?=
 =?us-ascii?Q?4IJECKktYMMNNwGBsPLU05AG9r+tW/MfL6t43pG3J4jWJYryEVQhMTiPSO0C?=
 =?us-ascii?Q?M5tVJb5OjHoMOeR3xp9jfidWKC3rIpQPGZNPheGbI2a8E8oSMNTBdJlJAgtV?=
 =?us-ascii?Q?Mzm1iSqIuRkxoq+ns5XU+C47UneRKjSK1eFO24+jSGzZuneulVqRlzU85k8v?=
 =?us-ascii?Q?cg0lyR3C+ph3mTixACHSMQExUBQeiOi4tkioz4HPNkzmcxO7XeZ7N+XLqRT4?=
 =?us-ascii?Q?23OA45hwLSzuDIE57xhJ7wfD9blD3U6D8G0VBkzdUHaXpFrgVZNed3svwWst?=
 =?us-ascii?Q?IYt8WEYMvip3gM8kxB4nvbyXUfEgJXc5KtSw9ULqhf4IDGpNjm1UK6ke6eJf?=
 =?us-ascii?Q?q3awAT4wrMmpOZlBWbaybd/ibyQZ1WSG4sLoEheeK3GfwjGcvaSVfyqwEkA7?=
 =?us-ascii?Q?jrgoP6XVJ3yTVupnl4sl+PUnFNmJ/8PfWQPVukV+G2xPYIOOLFA8YagpmS+u?=
 =?us-ascii?Q?bT2L3KI2R2h9FmL6KuR0A75aN4eFTB6ndlEAEWRI6nqaNftJnVe97VWcEhJ+?=
 =?us-ascii?Q?Sqg0saDy3URw7HKjr4IWnqc3g+6+ZnnJW0Qm5gk77tuy+TQMYCCogAc6Zk3o?=
 =?us-ascii?Q?CcZJoaFDCjXoph/8wmCP3fbyCYdgix48gglbcesX6iGs57iJmcwhbS7EpZiO?=
 =?us-ascii?Q?sd63JFyqREgHBP8+gvbXseNYT8Huur7o0g/bZ84bJZOtl/Sk2Tw9/FetGrLX?=
 =?us-ascii?Q?DIvOtF/hldQVmbwEwKkBVT4Kngm2UbZ8zQprt3m/paBpBBdoRnntwvUZXd9q?=
 =?us-ascii?Q?/jko7CLPlAKb0OA96MOE5GJkyM+1iJoAoZK43ja+xF2NH1/cd/nbJyoQzG5k?=
 =?us-ascii?Q?DFzdgOIf0xZ/t+ZqvsgzQuOBJ0dMSIZ9l0iiBPHnV5mU09/K?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013)(7142099003)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zgZkMwjYZa6O791ERP51ngmklQewShofKkZqgnQYxLe/pK9p4pie9R9dVoifD+fDcl/8urlqMWHkPCKWeT/tD40IUK4UjIpLbWByomWjzGeU1MpB2gHj4FhY/DN6KyzQIdQq/W1FptdqI1wUtuY5ARrDlBkG1E6KfMxewL4YOEdYPjBA4W9ExJ4BnYaBJSLMlRBEKQxHk9Ekp4AWTmq3Kfs9apCi7gOxZEdmduALuQ+/hfc2J8a31QhTXmVE/Gb/JtKGppFQxmMluNYnQ9Oww9NabzSVdDMPjO05Z922cHV/JE8FdWNGNz8zZVz9/+QlbFrzXKnbsusn0lS4PMrpBXlyEy3G0aUaC4t4mmjxJH0tiXJrDoZXRgUGzAvOOSjkp79lwrgwJwGZ0sAunLk9+C7gK0DAzIiiFj8tk6WHWN3bMM/RfjmWelysPvERddOb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 12:54:30.8264 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fbfab92-6481-4f76-236e-08de6d5a86cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4260
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcV0Prz10XGm8nqRKqlPCvb85hqwaG5u+IBNkSX8dbA=;
 b=UBegkQYFpvrQzCkuF8X5BX8GkxJI62ZcAJW3RYS8wsm0ozphhfGYp6A8/7bZYM8QlbN8Dsp3Gt8MlU6l17f35kMxwxN1SmEvsOe/koeA+UIKcsn2PJY5fTF01rMVwVHA4JCA8dKU50+WszqW9k6btdA3dhfbaNy2/YKsxlHVWXw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=UBegkQYF
Subject: [Buildroot] [PATCH v1 1/1] package/binutils-bare-metal: bump to
 binutils 2.46.0
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
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the binutils-bare-metal package to version 2.46.0.

Release notes can be found here:
https://sourceware.org/pipermail/binutils/2026-February/148149.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/binutils-bare-metal/binutils-bare-metal.hash | 2 +-
 package/binutils-bare-metal/binutils-bare-metal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils-bare-metal/binutils-bare-metal.hash b/package/binutils-bare-metal/binutils-bare-metal.hash
index 9fec966c72..99556d8b15 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.hash
+++ b/package/binutils-bare-metal/binutils-bare-metal.hash
@@ -1,5 +1,5 @@
 # From https://gcc.gnu.org/pub/binutils/releases/sha512.sum
-sha512  ea030419eba387579ab717be7e3223fc99e93b586860b06003c12489f93441640d4082736f76aa5e98233db4f46e232f536a45e471486de1f5b64e1b827c167e  binutils-2.45.1.tar.xz
+sha512  32f880bb4f69351f4ae54a5d00359625c6c49d8e76624fb5cffdf174c79c8d3212f66225b81c12933c6ed59604ab652560773dd92fab384b930c97a9d4e1fdf2  binutils-2.46.0.tar.xz
 
 # locally computed
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index 3d1b9db343..3239dfb18a 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BINUTILS_BARE_METAL_VERSION = 2.45.1
+BINUTILS_BARE_METAL_VERSION = 2.46.0
 BINUTILS_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/binutils
 BINUTILS_BARE_METAL_SOURCE = binutils-$(BINUTILS_BARE_METAL_VERSION).tar.xz
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
