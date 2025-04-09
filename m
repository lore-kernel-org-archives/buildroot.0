Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50320C369A2
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 06:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3C2A611C0;
	Wed,  9 Apr 2025 06:47:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M97Ol2U7Vunj; Wed,  9 Apr 2025 06:47:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0823861062
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0823861062;
	Wed,  9 Apr 2025 06:47:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 82CC2108
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 06:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 742E6830FB
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 06:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OL9ZoqXZcqWz for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 06:47:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::607;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BEAD580DEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEAD580DEB
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::607])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEAD580DEB
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 06:47:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqoJ3Z5sEIhaqvGQ+Kq4wpkbjl7EvSjz9ALpNbZgrC+XfQXsFsDmkprbm0PeIconmcYXF5HsCeCJt/kv3R//8O3RzME2PrjpEqzhNzrljVBJujm/Xkz5R5z+y0HGIGB3QI8Uvf55BBnxHTCrLclOqDSxu9ZZb70nVBFteTB4O+ATEItgDVVKL1cx56WLaQtu4xbtiuVAAYLMiQ1pujv54DqmswFwI7HRXoZpzcKcAKbgo5yKY9/Op/R6/Ozpc1XNZGYLZDjBvlDL+cJ8arkSX3ojGHrSpsr1ItqKdPjQTja5mV+GSkfJE5VUKGtf7hg7nNWpbUm8pJiBn0GPjBMkpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmSEL3ppqBu1imHq6LBZg7bCntXZlDHDkdpcspm0eJE=;
 b=bKrHvxtBu5Trm8fBI6napYDrXfyj2szNpq63lF4vOzDy+MqmciULYfe/30bVbJBx+MMY2FTIIUP85DkqiizpE/BjzLUuCVPgVXra5HsbHBg1PhnIoiW+ok8GP1rMQ3+o3kerme0glMhuPDcS8/WX1Ow03Cjcda7TZgcXLKKrfp7wkD8jkCa7q8NIzDN040ssnsESxYfJywORRJS85uiuBm/lcWLZ0nFdJLxImAy2lQ/QC1/tGboRFEfEvVm5kMpYN5ZTom10VrXmuWPKA2VZUbNnbiLuFt/DfKXjx4j7IyHyz5qPRYjACVbfChYsgBX91nNWuo8+GsH080KdD3TMwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY3PR04CA0023.namprd04.prod.outlook.com (2603:10b6:a03:217::28)
 by MW6PR12MB8706.namprd12.prod.outlook.com (2603:10b6:303:249::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Wed, 9 Apr
 2025 06:47:25 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::f7) by BY3PR04CA0023.outlook.office365.com
 (2603:10b6:a03:217::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Wed,
 9 Apr 2025 06:47:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Wed, 9 Apr 2025 06:47:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 01:47:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 01:47:24 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Apr 2025 01:47:22 -0500
To: <buildroot@buildroot.org>
Date: Wed, 9 Apr 2025 07:47:10 +0100
Message-ID: <20250409064711.3024937-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250409064711.3024937-1-neal.frager@amd.com>
References: <20250409064711.3024937-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|MW6PR12MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e85e74-4ddc-4c0e-607d-08dd77326302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4/My2F0bLPLyp2bdaLjs2Von0i+3T0xLfhuxvAYwIsuXXbDu4pueVXBORmpS?=
 =?us-ascii?Q?yGJgGMV+z1SVvN3FKF78hfKSrqyPJjzoua+wAFBmOY9X6AZISiNHJpZAoxgg?=
 =?us-ascii?Q?j/P6Qm/VggvYzkEZmZYS/MdNSS71TOOKjEs8s44xYb3av6vMI18l8FrOe8NW?=
 =?us-ascii?Q?jRpE5ItAqxoL9l+2WyEFmvcf2oic4P1sywxFJcwdu9VSJevL/+12uznEzRWz?=
 =?us-ascii?Q?JfsA6skgjnJnA05LpYZ55Fnlf9qR59+teP4xuQpC/+1l2gnVS18UYZUjL8FT?=
 =?us-ascii?Q?2J9GQeCJ8ZgQn8DXuQJjnFy7MF0KEmpGgR5s/0YQWfqNliUF5VU1kiieNjHF?=
 =?us-ascii?Q?tUv529sO3pf69kBT7Tu6AMKDP/412r9OlfGRd8Tfxkj9u6dDrAteqhSeYtBe?=
 =?us-ascii?Q?QzLcBp4ObUh9+I0fgo8sWuDurv0cTcPeYhSQ+MksGEvtMpaH87Ci7D/gToGs?=
 =?us-ascii?Q?MJ0tJ6gjXfcIOAPl9q47ZzOrm6dnK5CyFmNv5zK6u6sab+34Y9YP4lvTsywb?=
 =?us-ascii?Q?V8fj0qOyMEvKQmUAPL1KhF384vtLn0K+gVdQ1OQBPrY3pJiBeUjXeaAOPjNz?=
 =?us-ascii?Q?NmJnQhEHcpf9gfQyUiWE6nzSTv9MbgPJCs8hh5rBo1dIe1tEFp2aExhQY2q8?=
 =?us-ascii?Q?WYGnWpTMwCZmpezsq02QzT6KHqf/mG1aR/4l7ZTOVE/tR6UWwO9cei2JhlcH?=
 =?us-ascii?Q?7Q0gYgIf0uBsY277UQNdLRR4/a5KfO65UayjYLrKoQUv2jp+hmI7ychhrTAu?=
 =?us-ascii?Q?/GbYTiTJBYHMhIBVwNRfgpA8TLe1bMGjDs7LL7ykZyosZNOFOJiZ9nwCCsb6?=
 =?us-ascii?Q?sk8rVDcLLYG6lD/vzVrD3zIUpGmqKMQQX3qilqvgIAVS7l3bUI2E0+j9AZun?=
 =?us-ascii?Q?WY2uVogZ2Q5DVTZnt5UpfSnRyv8zSGIkD920NvTMyvsAumIgLBolMMrw3lUb?=
 =?us-ascii?Q?kJrg8a38vV2KALh3QgaRYxZ8/VBR00lN6KcMzOszZuAPqLv7F94sqcxqGP1p?=
 =?us-ascii?Q?FIcag0u05czhTnnvkEf4PA+IosMkKhxlUBH6B21Zv+ZPC47HYQAl1WH6nX7q?=
 =?us-ascii?Q?DBp8snb0tc9edN4uTBjQsp6bd8MvqKYprr+/zRfY0IHH14TL2zddw8PZ8l27?=
 =?us-ascii?Q?4w1EZ2Z2eUAPZHgxmgimtyL3gEiF93hJzuyKBBJdRDWWZMFBDF8xgKXRu0Si?=
 =?us-ascii?Q?DQCK5aYqtZgI3TVvBwJtoYldMePelxciTn3u+qW8n9DUU665m3f/N/3X/0/2?=
 =?us-ascii?Q?NtpVDjdT3BQwn1AgvZCEgXqbt9zadkbSSTTwbUIzgYLzGgm7rk5+5cIvlGAV?=
 =?us-ascii?Q?zOXLucH0rTcXAER0lW6Nx2598IJLyzfGXKWvyLfAbEIQ3B2uIbylQ1XPztsj?=
 =?us-ascii?Q?5yRsOetnOZUWUGoT78oizIUlGeRvyh+QOsFlhASm2YPQxzi+TcWS+M5s1IHP?=
 =?us-ascii?Q?Z5dWBSfVuGPDOhDXVSDAVr4jGQfWTsO5vIaARMiEORp39xv1obEAg2ZKLlcw?=
 =?us-ascii?Q?D3Bb2ZVRsFwe6cPp56eeHM0SFWiK4UVJFLqVt5OFuL+tDd+on7QZ2OrhgNan?=
 =?us-ascii?Q?Xq2lGO69YyasHqO7uEQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 06:47:24.8086 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e85e74-4ddc-4c0e-607d-08dd77326302
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8706
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmSEL3ppqBu1imHq6LBZg7bCntXZlDHDkdpcspm0eJE=;
 b=A44X+Rr/mSI48BLCbW2pz7r9FAmj4aP7w/ebcyNfksS534Ov6j8+hvjMwknTnRUL18xqQhQ7Dck7fG1kGzDMfmi90DfdE3bb8ACxAOCrapNUUAUY1z8eGrlvr4HN0ehs5sHZn+y5pzp+DB92xUVX3btb1zKYgs/fVkLvhUK06Ss=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=A44X+Rr/
Subject: [Buildroot] [PATCH v5 2/3]
 toolchain/toolchain-bare-metal-buildroot: rename example vendor to
 buildroot
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
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com,
 arnout@mind.be
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that xilinx-embeddedsw is compatible with the toolchain vendor buildroot,
this patch modifies the toolchain-bare-metal-buildroot help example to use
the microblazeel-buildroot-elf tuple.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V3:
- new to series with V3
V3->V5:
- no changes
---
 toolchain/toolchain-bare-metal-buildroot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
index c86c5d725c..19c97410c6 100644
--- a/toolchain/toolchain-bare-metal-buildroot/Config.in
+++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
@@ -10,7 +10,7 @@ config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
 
 	  For example, to build both a Microblaze and a RISC-V bare
 	  metal toolchain, use the following definition:
-	  "microblazeel-xilinx-elf riscv32-buldroot-elf"
+	  "microblazeel-buildroot-elf riscv32-buildroot-elf"
 
 source "package/newlib-bare-metal/Config.in"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
