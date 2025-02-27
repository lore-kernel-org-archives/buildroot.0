Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD11EC021BE
	for <buildroot@archiver.kernel.org>; Thu, 27 Feb 2025 05:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6632F80E39;
	Thu, 27 Feb 2025 05:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ye7hyMcqRyfR; Thu, 27 Feb 2025 05:17:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A13480E5D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A13480E5D;
	Thu, 27 Feb 2025 05:17:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 81D1E68
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 05:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 706A9406B9
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 05:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zsREynbOTKB for <buildroot@buildroot.org>;
 Thu, 27 Feb 2025 05:17:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2405::614;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B32D40662
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B32D40662
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::614])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B32D40662
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 05:17:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZqbdrsJS6tYO5Q9vU4PoSUtIZJJyvWjCHszEAzOj5fR8wA9I0RTFoUFFi1sntBoXJNvc6J2eunuHDYhqc7aMna7LqgELWTLogwwuzkfbk+1KUdfrYNgcLns+9OFNxVg+eHX/fWGmBVk1dcJvPd3noI1UsyVBi1qaoGDA/mVD1iQCVSm8dXJR3AXVJi04zzpUlPGtPQMQ3LQMsdKRdUggSQhRz1soeKsp0syalIaFuNYFNS6gJ9NS2z/emjndVj59ARJ4X+d3Bl1u4R046eZ5Z01K1bld5Yj/zknnHv2ttwyjYAuuIo/QIU+DCtte9awKIWptodlQX0mV1dPNypb6Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHUwzZFfFtQTQrhYnrN8KZf8Y0U46poYr7vAqQrtgdU=;
 b=VAl1JdLj3pQstfF2xNbQJ53NE+MzzPoUV5cULIAloO8kJ7lDmNZuGzKsrckYoLka0qrdOMGSNmYbJQCwtjtjuTAPx9m1cTdPwSZ5j+qD77MlvoKHRgdyCAoHCV4pfgsM+/258yVOdlCQ5Q3U1rZW7M4mxsQJIZnSTH5Fxo0DL4EKNHuOQKbxekqdyKtYjXfgDQ2F0YYa5xJ06kb1G40HCeDYgQ3Zo3WvCqyALSv9g4/m5OIgOQc8ABNmhqbUku7qjkvXkEZbLldCsEF6NI549QHqs0oWPKK5Hthx+NRb/3CljCXCu1h1XIvdpVj0AWOpjTW1wR6S0CeewlXokHg/6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN2PR20CA0023.namprd20.prod.outlook.com (2603:10b6:208:e8::36)
 by IA0PR12MB8301.namprd12.prod.outlook.com (2603:10b6:208:40b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.20; Thu, 27 Feb
 2025 05:17:07 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:e8:cafe::9e) by MN2PR20CA0023.outlook.office365.com
 (2603:10b6:208:e8::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.19 via Frontend Transport; Thu,
 27 Feb 2025 05:17:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 05:17:06 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 23:17:04 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 23:17:04 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Feb 2025 23:17:03 -0600
To: <buildroot@buildroot.org>
Date: Thu, 27 Feb 2025 05:16:53 +0000
Message-ID: <20250227051653.3378171-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|IA0PR12MB8301:EE_
X-MS-Office365-Filtering-Correlation-Id: e52b079e-4f8a-4b9c-17c7-08dd56edfa78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fvXtk9SjdUtjsJzUYLrAk/ffuGa65ARBwgbms7h7i6/9Yregit2lnpN1PWiE?=
 =?us-ascii?Q?4BPb0NNwpewwJcUEfcip+fG2jTBpSnYpkN/pxHc+pYRaGagSZcD+J6lJoq7a?=
 =?us-ascii?Q?DBIt9j7qZAMCq3QwvuB6rFF/bbW4gKGEsk5PzStOdumJrN5i2P/hmtILRiJL?=
 =?us-ascii?Q?FK46cn5Ijj9TWbYbdXhXiuNogHVI2BztOG46FuRbPq/V/mKBLGTHnt9YCnk5?=
 =?us-ascii?Q?uMLRcBzj5qui0mFw9wMS45hfdOuUqUGYVvFqYigWa+DUBJzr4c5an/4nprqO?=
 =?us-ascii?Q?jfH9RD6tfh91I0CRTOsOSzbwhI5SbfzTXozy6835DyFs7D7hzGVl4G12D+fl?=
 =?us-ascii?Q?beXu9hsEM/Q2r29uxY7SHQbkb1oiyxvz6/xv/07zHr6JwIZ0zXvp9uuNvFsI?=
 =?us-ascii?Q?Wnj1Xw7015CxXNDQlXtB6vw/onOuVZrB9yKfELCHe+cDT2o0yI+lux/tc327?=
 =?us-ascii?Q?jxwUgkVkpJhnQjxFgvZkcG+tYFgfDpzJfFtP5zoS+INzAPdDMJF93htV3ecp?=
 =?us-ascii?Q?ospiKDrISARlVEkYxrNkCZ3gWn6qUFNSlag4eQNiNN//db2SKIEko5p5kSH+?=
 =?us-ascii?Q?dD0dIBA6jd4KplPgT2yU3tjZCOxUHtHfRvJbKZK3BtZ/M1fx/Ne64ATN0dPi?=
 =?us-ascii?Q?LznWSqP1Rc9l79/TtYsqKdhF1smyqu47Xwr0RLMeGjU+ITMCvt3cDdHXUSKI?=
 =?us-ascii?Q?MAx8yM/oTr1Yy5qlC6oShiA3oKz/TRekYzO/m06z9hhOJlxPJgXFE1qcRuJM?=
 =?us-ascii?Q?yBf82i1EwlceJSNSn2l3AVLD7IxgqPRSrBRa0gyuIrCDWLsPMZtxxViboxRO?=
 =?us-ascii?Q?I75FOINkaJVUlGOFzst2mzaOmW0SV0WZ9OTi9DzJVvTqvtKsCPW52jr9hJrI?=
 =?us-ascii?Q?YNCKwFAuPQVLO1lFBm00LrqJvWO4mMx2gJIWFSc47a2KJ4CVCKUyQ4himjly?=
 =?us-ascii?Q?Q2gIW/4bLssmgej8SgX+PU01fiboxNZkm1plR7asKFOB5qIDS7SzIt9oN1Jt?=
 =?us-ascii?Q?jFMhKZE/nk9vJ0ugrs6feKURWr+2onNwd/AW6YVU5fM9KjXrpkuUPBy2Elr4?=
 =?us-ascii?Q?ZgPQoQIYr6gDfEkg/rSiw3HoteoEHI6Cg/QUOfJM252xz2EkOZiAs8gRkPCt?=
 =?us-ascii?Q?W62fMASz+8tQGK+fKOOK8SwNPs5orOoz+KBzI7qkVTyu3Al4RLjDz4BnYSAL?=
 =?us-ascii?Q?uf7Su6QNC61Pts6onp5vMqoWYB1k8TjJJMCYgsKSsjf/D3JQQBCz8RMkWumJ?=
 =?us-ascii?Q?HjaMFJPvkRomvPXFytg7V8/AC+Oz+my+fM37zyULndG3EJYjt4/0yTDgbstN?=
 =?us-ascii?Q?01ks3xdWR25UC1Phjmo/wML8oMuJUUXt8PgiF5Kk/pkP3Km3aJJPmfjqJ2Xm?=
 =?us-ascii?Q?EXgYdrOuBQpTHk0oM9ZXl/IyD6uxKBq2pcb5jhZpBidlnxAiKq6unxFyooP8?=
 =?us-ascii?Q?OC1fugkjW5XtURIlm8ZIlafXH47N6/2CjYePMS1icz3YqkhMTg85czseiFu+?=
 =?us-ascii?Q?x4CqpTzUX3amd9RihKV3K2uMtpumpnNlel1E?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 05:17:06.5422 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e52b079e-4f8a-4b9c-17c7-08dd56edfa78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8301
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHUwzZFfFtQTQrhYnrN8KZf8Y0U46poYr7vAqQrtgdU=;
 b=R7u2l4PCiGdOy0Kwmj6tlUC09Hgk2aRzoN8DmsYewpycAzg1OkoAZ0QZcNOwfTxELfMkpqhh0Qrsqnqw/xOOIiX+ouUdXNUZH7Dyl1tG1CCPBSe9go9xlFL9eqSSOvTk/6NlbFExpb13ZmunnakIGMb09YE1yKrC0adan5NrX1I=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=R7u2l4PC
Subject: [Buildroot] [PATCH v1 1/1] board/xilinx: remove hash for Linux
 6.6.60
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

Now that all Xilinx boards have been bumped to Linux 6.6.70, the Linux 6.6.60
hash can be removed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/xilinx/patches/linux/linux.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index c759cf0d88..a970a878c2 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  f59c7d260794d73ee519ba2579ef41aa8ac4985ac5af9461f94fa314969acd2e  xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz
 sha256  b726226e8784d92049190f19768d393eccf3ad111c7a2e685bb29cfa1bdf1f70  xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
