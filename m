Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310C0E77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 15:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C74A400B7;
	Tue,  7 Jan 2025 15:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hyJTzF7PTgtc; Tue,  7 Jan 2025 15:15:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E1B1402FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E1B1402FB;
	Tue,  7 Jan 2025 15:15:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA7166B
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 15:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B400D60742
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 15:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9P9hKVKLa2eH for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 15:15:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::613;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 32C3B60704
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32C3B60704
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::613])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32C3B60704
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 15:15:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wrr2u3JBkK0YrGBTE4kFEu7ToYoiNAAx+f/xH7qEusyPUvsYlqcAkqs2OhnGsr3jStHH4aqM0NXDTYLxFfJ+Z9jlmwh2r78OXtvGypJ6HDtpf0QlCu2wWHGUEcmBjpAi1SZWFQ+XM0CLIBEv0tTMWpuPsrBq9Dzv65fdo0p2pIPsbmuuGkyVkW/zKktycCsYYo0uJ5Qe+POYx50dJIuVlFVE2CyKz9uQm1B+8TzR1V7Ma7EHZV1gRJ1YeQLpOZkfHSBgf4MJaPb6WICtK5B7wV5ypNBjGlKqTmhW1AWeZN0xHZqTIKlrB8WuZ4JgM7S3WsCgTL8Qsy0b88iVPbMxVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcDhDB9uH6RdbWa/BVDAJfQW/j5u+chThE4i8U27j1U=;
 b=UyTLBL7UN64wxNwRWscgZJ8e+v0BaUrdRccf7/Uo2N4xfyvtHm7pXbhiWVeWtaLEIwQMvAtyjBfZgdoHKblRw9/Aa281TuR+vMBW+//sujmh/d7BPiccuCY+oMvAgL0+0jt/oMyKq7meuQczgEnyGd1awDpVkkaHDYd2QygKpdurj8iaRcynTmXdnDEqLEl+/atb1Z4CiaPkYcj02zmsUDo4DIHAIuRguXqxJ2r3JffjlO/P+LwLK3Sdi18y1TR4mF7CgA0cDZBLNqKIeMhTMW8FjtjI1abNxb0FumLt3KWmKqO8ikbMDk5EzItrleZ6BmclwsrSboXzYCwGw8ugeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY3PR03CA0028.namprd03.prod.outlook.com (2603:10b6:a03:39a::33)
 by PH7PR12MB5902.namprd12.prod.outlook.com (2603:10b6:510:1d6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 15:15:28 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::63) by BY3PR03CA0028.outlook.office365.com
 (2603:10b6:a03:39a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.18 via Frontend Transport; Tue,
 7 Jan 2025 15:15:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 15:15:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 09:15:25 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 7 Jan 2025 09:15:24 -0600
To: <buildroot@buildroot.org>
Date: Tue, 7 Jan 2025 15:15:20 +0000
Message-ID: <20250107151521.1655280-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|PH7PR12MB5902:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d1b4b87-8512-43ea-e622-08dd2f2e1d5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Hz3oKi8DaRmZWcLFLoHeIB+pu0QT+vdGjk89bvceSZ41gFuAlB8qNSLnynnF?=
 =?us-ascii?Q?xNVUuvAPPrPpSY6vCjYThOd3HPEO4s1sZdAyyoLtbFkuhf3nBjeSv7djgVgE?=
 =?us-ascii?Q?nLcWP+888LCV3NbThZm4EwBtdRreVzCbnKM+rFkcg14nGH03aFl6Vv9mhK4K?=
 =?us-ascii?Q?0t2Oi71nKi0MBi9QjBFPHpVFy1sn32yqRa5Kqk79BqgWtyPUQwcM0emuaXiM?=
 =?us-ascii?Q?2oEwJKbME+rOApP3b0Jve08uxxynDT0UFAPTCTjBWi+r61b259rLjl82uLZ6?=
 =?us-ascii?Q?cBryOJAbEiMg3/AV03PlgzGTTBC5tqcpBwKE+/9ZF/ybK8v3NznKUjxZsM7M?=
 =?us-ascii?Q?FI+lz8COPGt1uLNbCXUew0UMZ3DAHa03lB7Kk1a0awYEsBlhbMybLTeYTIoI?=
 =?us-ascii?Q?QDyqvkOuE3l0pPjo3ajFCk4Mpy62dv8Rm7fesPZhXJKF06YLzfkOc4LW2l+c?=
 =?us-ascii?Q?QUmkK3DyUPPXmmZINsEu4rXezZymNlYe29ty2ZC3tkZeO7Nq5lSRoxdXtJeT?=
 =?us-ascii?Q?jga1jb6tyqQ3JhPPGSZI6+LzUhTSBib9XJL8AcUTM2D852jtuzVqPvKk4W7X?=
 =?us-ascii?Q?JCXKlwh/ZJDke7BHqnAXOaBLunxgdsA1lGhKeWBOIa5yZfPEaBaVA2nCR6Bw?=
 =?us-ascii?Q?RuBbfNWtRvMWv2BG3P+WJ+liE2nOTHbUr8KAdOioaIM4krKlAeLVtUNAh/2x?=
 =?us-ascii?Q?1gYWjz5Ox1F5HwlK7JZAb1EVi6rIsvj/7jij9luWg8ywmKl1TzM54s+Df8Ar?=
 =?us-ascii?Q?L1AE6UUgzDU5A+IsYtcGjVP/S5dSlXE6x3SVeuTYHXUZi9VOjFr8ZuNluW7C?=
 =?us-ascii?Q?O0QBOjHf1nAsHX95PPvRbf2+L5iBEIWI7GQu1xbe9RtxlOMcrcAdXSfiICAr?=
 =?us-ascii?Q?rqqTb+zz055Fev3PeBqGw022bQoM/eDSilFY+FL9HX97JpvXRY7igiTu0ZtQ?=
 =?us-ascii?Q?QBjMiH987CUaha4GmwkdRMRitzp8VanzwtWhcf7zVctwgb9bkm8fHr4rj4Ky?=
 =?us-ascii?Q?rmrZ8X8LlLWRLg8pBJqT4k8EP0lHsc2LMdUyXFw4wgEbVbsGB2xzGZBRBFFC?=
 =?us-ascii?Q?yfyoW4O1IG/OQ2+UR/lAwpuupnrttPMftot+tu1DVrq3bOjxK826kYHgVuEt?=
 =?us-ascii?Q?948XXFxfQCKdh7P/vMDFcHcAyHDaHCJa+kAropUdlYnXm/O9frzb4aOVqKbB?=
 =?us-ascii?Q?AgWPpL7JZUVHNQbJi7lBrgo/vB58pyiqWZBVAE9cTNo4hJac3yKtN1ksmhFi?=
 =?us-ascii?Q?jy4L1x78kX1zfaDK9DepE3FDswIltyBO8F90Y3rLVRrLGeSQkRnbGHHh0lOr?=
 =?us-ascii?Q?LD3FyVJvsiEcgWnzo1sctvKYO3DaZg24Pj+o8axCg16+E/v4RD7T3RVg8gDA?=
 =?us-ascii?Q?ez8woN03UzK9eKLSk+v3ez6xtgNsA47lo9VBZGBRxukXEtkYhraweOcBsr7e?=
 =?us-ascii?Q?kG59wmgPS+XcwPfalWQbOosQfq4JCOQEXZIELd9BTCh0J6Rn6EvvaBI0FXor?=
 =?us-ascii?Q?c+QIQ9Si5vbWHallRv6PwFA5LBwvA0NAJ4Sy?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 15:15:26.2257 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1b4b87-8512-43ea-e622-08dd2f2e1d5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5902
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcDhDB9uH6RdbWa/BVDAJfQW/j5u+chThE4i8U27j1U=;
 b=X2Ce71bQgo9kMiolVprLlis9CiXPx6+YO5lVZ6xAqlGdovljAKmeN9IKWZU9hp1y7vjQf/m62HaMn8fWcN8o8w7B+IZTR0qEVp/AOZZIvn+BM0kg2Gb1Xjx7zFWL2rXHBDWvxC4tKrhdnxi+KMOkivkOMZNimTQx743uC4f7pOY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=X2Ce71bQ
Subject: [Buildroot] [PATCH v1 1/2] boot/xilinx-prebuilt: bump default to
 xilinx_v2024.2_update1
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

This patch bumps the default version of xilinx-prebuilt to
xilinx_v2024.2_update1.  For some reason, the original xilinx_v2024.2
release tag was missing the kria boards.  There is no difference between
the xilinx_v2024.2 and the xilinx_v2024.2_update1 release tags other than
the fact that the kria boards are included.

Now that the release tag includes all the boards, it is possible to bump
the default version from xilinx_v2024.1 to xilinx_v2024.2_update1.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/xilinx-prebuilt/Config.in            | 2 +-
 boot/xilinx-prebuilt/xilinx-prebuilt.hash | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index 94ef3dd111..8e5918ed4e 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -10,7 +10,7 @@ if BR2_TARGET_XILINX_PREBUILT
 
 config BR2_TARGET_XILINX_PREBUILT_VERSION
 	string "prebuilt version"
-	default "xilinx_v2024.1"
+	default "xilinx_v2024.2_update1"
 	help
 	  Release version of Xilinx firmware.
 	  Must be xilinx_v2023.1 or newer.
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
index c955cd79f5..ea072378a8 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.hash
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  xilinx-prebuilt-xilinx_v2024.1.tar.gz
+sha256  86ee9629366aa8c0d70b87202152a793804ed4090e3a6fdac4eaf855bcc4d458  xilinx-prebuilt-xilinx_v2024.2_update1.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
