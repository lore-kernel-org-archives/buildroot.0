Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4098EC0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 22:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F38CB60B43;
	Sat, 25 Jan 2025 22:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZwnBOhM-Jot9; Sat, 25 Jan 2025 22:16:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F37B60B65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F37B60B65;
	Sat, 25 Jan 2025 22:16:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1731CA6A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01D0040EDC
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LBA1mZJqWiLB for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 22:16:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::602;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B969840EAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B969840EAE
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::602])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B969840EAE
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:16:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XL7sEjxaJpue7sqbC4gC08W3+bcdSVOtRytUTll7FgGhnQBv8sZ/aIKLGtqFLCt1GuxjzDuS2FCim+mRz+MtsrRnrBN8yZYyEOFS5dUdZI0BSnoE71A0GZH9lUif/9Q65QplwkfRMLWF+ub5prsNtzPbyIdyT430ItLLHTPeDcj5N5dwXv47ClqQiFvVAAE9mDC2/DUI+nkIOISgzbvSyWW6Q16lBOovgGPLHZ3l4iPp7avvnJ9q0GtLZOKdgWLuIRCJp9Yq4YnOPYyYaXh1IxhZSAH90MjDG23hk8ic79Gkxq6u3zAkuPvRQ5pKkMnh6ntSQpyQNvK0gi1foGQqcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThgtB/PeRBW9yOZPzJAvYca4eUezO5w0sz44vpIvQxk=;
 b=WNsax09DUQkP30AJi4NuzqAAgaPTROFtITY60kn0ipU6MvrhWlhiFACzwizk9OMyO+Lz+RmxovklYh9iyQoFaC++qegwZ6NKqVvAG6D0TYJE4O9IX6RhCDLlbxuG7CjdQykL/g8AwI5Rtljhib4AjZOOsTo8sYq3S6XoN8YJNI2jehOPkxZ5ZVOvEYS+j86T8tZDDn45bREUzooTTwKfV/xYdWfDKfQlBofUj58ECgqHB2yDQV/CcAqgc1kM2bRyc6ZphDmOAV7NdfZu4099DzobVL9g+1WlJrWb+w8Dto9oXYuG9rWj+9AdhOeu+FmgqdGHRqCR+IaoDIEscmkJ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY5PR13CA0030.namprd13.prod.outlook.com (2603:10b6:a03:180::43)
 by SA3PR12MB7975.namprd12.prod.outlook.com (2603:10b6:806:320::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Sat, 25 Jan
 2025 22:16:33 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::e3) by BY5PR13CA0030.outlook.office365.com
 (2603:10b6:a03:180::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.13 via Frontend Transport; Sat,
 25 Jan 2025 22:16:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Sat, 25 Jan 2025 22:16:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 25 Jan
 2025 16:16:31 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 25 Jan 2025 16:16:30 -0600
To: <buildroot@buildroot.org>
Date: Sat, 25 Jan 2025 22:16:24 +0000
Message-ID: <20250125221627.3315039-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|SA3PR12MB7975:EE_
X-MS-Office365-Filtering-Correlation-Id: fbadddaf-0ba2-404d-7f1b-08dd3d8dec8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SkFKtukvh2TyNFSIucE2oV9AeKYA/sx8+S77BbXod6vs3ft3pzNFbFJhUd4R?=
 =?us-ascii?Q?A7L+ldNcXRlpIvTX9w+UvBCIHYeqo2AWJbBZY5X2LzfDg3i0lLDruLI/9ThE?=
 =?us-ascii?Q?N/WBrvIfYZZGMnViBQVnPThmv4akpyEUncuItFKmoQ1hDMDskQ2Ckr7h/LIr?=
 =?us-ascii?Q?jfXCk/MgLlhAHCDyo3JiAp0YceTzMLIgK3CG1Z+NqIMLQ4U79+9oz3G7oKMX?=
 =?us-ascii?Q?U6iby9ZpEkuH/MT+AbgqXlyEF628Dxiu15s51mmQaIFNpjuSAE5Itgv3Vmev?=
 =?us-ascii?Q?QN2ET90ZnvA29nq29hflchRKkwhBcbYga9YPYsvovtjMh59w+e2uuFnQxR1U?=
 =?us-ascii?Q?ubzess7ovDaEwE2rbEahsfYLwraPYhqIsgyZjH5LjVTpLx60QztmITDqotia?=
 =?us-ascii?Q?fEQVrnE7dfY4kkm6VW3FmniyK5CIEE24Ps70aBFX0frxBXAl0jwF/k1+fVht?=
 =?us-ascii?Q?ZbykEyMMR0kyyILLzxN8lIWf5cfe8/At2Z0x5RhdJy9VU8GIf/y/Onf4k55Y?=
 =?us-ascii?Q?vOIgTArbDVIyrl6lp7utnv0Nf3BBaIv9j1bMW0jhpoNngrCVF7bT8DhocX07?=
 =?us-ascii?Q?E+rl9Hd2hhs8TCnT/ITOkioc2KooxPIgvBK4xcDTJmhbAdhh85q5Nc14+aYY?=
 =?us-ascii?Q?3UxE0dmcuBYavS9k5zG0rbW5Aot48uRGxQhFIyc3Yt50hriR4tmEEz0MpnFz?=
 =?us-ascii?Q?+RJocfGel2wtC4CQxjsSmCx8e3IhC6lQchjG+3Lh7V5GLSvritpZYh6LQHTH?=
 =?us-ascii?Q?snJMbFYLEAtN/1+36ooeQHPRB+/ZU++82nJb2+Kwcs/Fuegn7tIe4TeRcN/J?=
 =?us-ascii?Q?iIiAwEb9TMyTp7QNcLrY6mMOo/gvWxMDR8WxITR2yZumls2KF5hxhBfHZpmJ?=
 =?us-ascii?Q?M48OlCx/bAFR3nAmPhOJ6V+pjdMBMywegL8TzV6rCSXloAp3RDQpXayVusQx?=
 =?us-ascii?Q?o88E5S/goGUJKHeilosScqt+7nF2Hn1hYncH2AzR99PgWWHguJzBUF4B5P3i?=
 =?us-ascii?Q?qdWOKQi7aY9074oeShpQdIXSnBoyZBgOz1pZwfbBCmT5a9YpPS6lREKeCva+?=
 =?us-ascii?Q?KwYdsQKWWwY4R3071AnX0VCx/HCheKKPq2ixE/5tRXyIZdlcumj2HWPRsaN7?=
 =?us-ascii?Q?ezGBKzoZ7OGzY0/yCTcBXXY2AQOJsXB+28uo9va1hHA20KY1bPx7XVmhs+4X?=
 =?us-ascii?Q?rQmxV3rwDRDUww5JjPp5t7v6YbtkTT821F5CocZxjY68Ipst5Eh1uR0SneIf?=
 =?us-ascii?Q?YfsqSRg1ULu5z1Unju26nvnGAxWJadCdhN6VdIYj+Z5xaynfsQpRXmTqtP7X?=
 =?us-ascii?Q?qD+2qIcP62520hdwa9VIw9Ibc3FrKwPeIDZXgr92YOjjrdmd7oW3MFFmLI8/?=
 =?us-ascii?Q?04nG7wzwh46wsZs/lWzcM41vHiL8lUPFUoZROr96R4EC+Pt0WLnE1Z+lQEwA?=
 =?us-ascii?Q?0j6cB782/Fa7evmPZA0aGu6p9YmtSQzmeFkx/FQHECZont4oMFlosKMiKoJN?=
 =?us-ascii?Q?XMam379PMQlp8VaBz+yHCcP2fme6MnFryxhL?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2025 22:16:32.3295 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbadddaf-0ba2-404d-7f1b-08dd3d8dec8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7975
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThgtB/PeRBW9yOZPzJAvYca4eUezO5w0sz44vpIvQxk=;
 b=2zoTweEEvLS17VuVxZClVc4jx87xh+OFmXTaulDjchXz9NGpMUZ3Y8UI95cEkn/dPt4kH1+abL3gSX3qKOaKhIt08C95zNuVL6dYJB1uufCzANaYvvUy7nSSrjKTNOg8W97vMF7r3WbxvEhX/AmD2mG2yW3KB7bH0vKZKY4kFns=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2zoTweEE
Subject: [Buildroot] [PATCH v2 1/4] boot/xilinx-prebuilt: merge hash files
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

There is actually no need to have two hash files for the xilinx-prebuilt
package.  As long as the boot/xilinx-prebuilt/xilinx-prebuilt.hash contains
the hash value for the default version as well as any version used by a
xilinx board defconfig, a single hash file is all that is needed.

In the future, when bumping the defconfig files independently of the
xilinx-prebuilt default version, all that has to be done is the following
process.

Patch Series:
1. Add new version hash to boot/xilinx-prebuilt/xilinx-prebuilt.hash.
2. Bump board defconfigs to new version.
3. Bump xilinx-prebuilt default version.

For this reason, this patch merges the two xilinx-prebuilt.hash files and
removes the board/xilinx xilinx-prebuilt.hash file.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- New to patch series
---
 board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash | 2 --
 boot/xilinx-prebuilt/xilinx-prebuilt.hash                 | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)
 delete mode 100644 board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash

diff --git a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
deleted file mode 100644
index fe6963872c..0000000000
--- a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  ef61a4b249ecbf632a25cc34c3b03b8290be44397ff739467ac92ec1701e23bf  xilinx-prebuilt-xilinx_v2024.2.tar.gz
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
index 048b93dcf4..ddb2cf8bd1 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.hash
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -1,5 +1,6 @@
 # Locally calculated
 sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  xilinx-prebuilt-xilinx_v2024.1.tar.gz
+sha256  ef61a4b249ecbf632a25cc34c3b03b8290be44397ff739467ac92ec1701e23bf  xilinx-prebuilt-xilinx_v2024.2.tar.gz
 
 # Locally calculated
 sha256  7b2074b607264a07347e1a7ef0323229585942793469f34b2cf9628f7623e05f  LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
