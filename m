Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF2AC5AE59
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 07:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99311615C7;
	Tue,  3 Jun 2025 07:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id inJUArCAUsiR; Tue,  3 Jun 2025 07:36:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B82D61524
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B82D61524;
	Tue,  3 Jun 2025 07:36:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 61A4B15F
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47E6E414BC
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3thQv6sgoVhl for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 07:36:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::62b;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A86A40981
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A86A40981
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A86A40981
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+lS5320kMhlYobsliQycUbF1tF6ksc+PIdfHKLxSW8G5yrQoJCZ8oG80XftjPA1+6NRy/4wlSG4lfn9lznNSuxZSB8ETqQE/AYBvKT1jul2PAqzKYjy00DCU4hvSYR3VZDqZCBGbbUf5A8ak95icEMzlFUFLkDMUNvakAPGGRR7y4pFiPM9hI7FqpfUoy3Pc39MHN/1cz2irV8SgZE7BEIOhLnJ/RkUPaqfyZk98FwZlsx2tfFDIBS36OyWseHJa5KxFwH9d8Nfq7guLcm/a9PJ30Zpo9bWY4nINGDBb5nDEbSBn2qHhtbbQQoZugqWmDLKreTNyIiWb16vC/sDlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5RQM+3SiVotckqHZQ4Z3BWkk+cxapN+B26I+HU//eo=;
 b=HfgydXp7wq2dKrB89CavjuvTPeKZeI7hdZ4Tab3Mq6zJe0z8bV+TPTk73Yj3QwYE65ae094ZGlbFLj1U0ULA/adCBugJC5CHYWz0aMTARjGHoldQibCFNCv6diSAHA/WKCZLh/9XNQ5bcBFnaBFdQa5n+2VYVbTXvzONR9Oi4fD8hdfyrpP/hgVMfpy1V2fDHOvOw7qZAbVaUhFWEjtiAE9Fi+LrTTwqQwaO35QD8QV/Na7avzHIjbetdzwod0imO+aRNPYkdFpXRcamJBc8tmwqCUNRiG1hUfvnILTMAbteI+Ji/3mHEva+H1P/XDNXuD1D/LoOdRxI03c+Vinr3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0228.namprd03.prod.outlook.com (2603:10b6:408:f8::23)
 by DM4PR12MB6184.namprd12.prod.outlook.com (2603:10b6:8:a6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.27; Tue, 3 Jun 2025 07:36:29 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:408:f8:cafe::91) by BN9PR03CA0228.outlook.office365.com
 (2603:10b6:408:f8::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.23 via Frontend Transport; Tue,
 3 Jun 2025 07:36:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 07:36:28 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 02:36:26 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 02:36:25 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Jun 2025 02:36:24 -0500
To: <buildroot@buildroot.org>
Date: Tue, 3 Jun 2025 08:36:02 +0100
Message-ID: <20250603073606.2679424-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250603073606.2679424-1-neal.frager@amd.com>
References: <20250603073606.2679424-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|DM4PR12MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: b41ef790-11fe-4bea-8f62-08dda2715a5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/UO1/kgdZoTMkiGu0VEVs2PPYhudGqJT4R78STSnoW6dqydI+0C3PAN9dmo3?=
 =?us-ascii?Q?Nx2qGsq/hUvAVtsPqrATLCx/qyQKuTh57doF/bKEr1VEgHDzKHR7mBc7lGtf?=
 =?us-ascii?Q?2TJEsvkJPIPqkStZHfVbMUh/PnnHRsegn1p59KUBGguxMHwOniFCdZ19Armk?=
 =?us-ascii?Q?mbA0zhwFtNkXUJ+YS6WcIS+BJPcgFf1zFXpOQBL3CVn9WRWdNkmQEiOumwYv?=
 =?us-ascii?Q?kxIc9CXX8mw01zFdpO4En81dqUrOuFvPt7W9TDZmIBq5LniySU/QZ63VcgVG?=
 =?us-ascii?Q?La7oumgn9Ab7YVXALGbIpvGFHIviARCgl1F0v++bPbpDVv3b2dkWGq7TmWXw?=
 =?us-ascii?Q?bjJOwAKZToyftG3gd+OxvyZTWzh4eNN7/7AazCkSVyMsFdjycaxsFDASvAY/?=
 =?us-ascii?Q?ZYnn6Q/Uo6k4qbJHakdlEgP6ibY529WuGvfipOTCe7Y+IQOSHpp9gsjq034o?=
 =?us-ascii?Q?ZRTi/OrL768d+eh2XXiPFYjcea7HrzsbzfmGWgWV0kcIsTupl7xHqOLMeD81?=
 =?us-ascii?Q?sqzRjgDyG6TdrV/LlU8I3PuQeVldZxW7r90mjH4GgpuGhdiABkyWEKoDoxOJ?=
 =?us-ascii?Q?IBTCVkZ1uEWco7PAoIa7HTai3BT9vUm0V4Mq1xTb1f/rbVq7ht/Vshj5OyCH?=
 =?us-ascii?Q?NCkTbiuxLDuc1EqeGW9q95lAFuYAfsEU6yQRbIyMKS5uicRzdEpDRzwV+xWZ?=
 =?us-ascii?Q?i3LNrsL2D+jJdZyDCakdeD+AjSRvLyIGbBqfv260c+nIjlhsc75wP8Splfy7?=
 =?us-ascii?Q?PuaOHVaMiRZD76MaY9s9QJGEVZnfkcwz/S2swbk3n5iaEnA14ucYggfEeWvJ?=
 =?us-ascii?Q?bcRwlNVrZHuccT3ZzWCRTTdPlQ3VZ+7HJJ5+7bzH12Yo6QCrL3dZEM+B2ShE?=
 =?us-ascii?Q?fqjL8SU1+1V8ciYkVrNyaekZ1auGokQsOyl7TzC8F7nkuZp5XqK+YZOb4UnR?=
 =?us-ascii?Q?aoHLDLC5qtS1kknoPyzsu7Q4Qo10UC9Jre5tDuodavfJ8/q71hfKmfxYXr+H?=
 =?us-ascii?Q?iMG5sUF6rn006r36M9pnwoed9rm/aCVfqNb9+oLiMRKDxpGenIHkZJ3xL2uN?=
 =?us-ascii?Q?5HeVKb1J5wWGyRAPaYvr0PFw8XyGHVBBV8KV6sEnjAJ8lCClBYLpp45+pH9N?=
 =?us-ascii?Q?XjwanrDjTFw00u6p9EvxeLO44e7cGkvZhZ7q5wjeUQQyoPrhvhQKDC1pc9gD?=
 =?us-ascii?Q?u5b81pG5+XBnashadbYf47BYaxqo6R5ZOxPLnIizR3FgsEazCl8p94uYj678?=
 =?us-ascii?Q?1aQ9g/izaKli7jI77CRgbTwsvF5yHtvcUK0asM56D1aCEPvraSU1PVfvjdTo?=
 =?us-ascii?Q?VdbYO2sLV/owe8RY+eIKcy49R6vEGywO4eUJxy35OFstZDVop48OMGlRcXIN?=
 =?us-ascii?Q?Bhk/zXkqfA8X+a2v/0ho9nXt5c6SbtBixoHW9hyrcPApugqxDY7ZVWJ14zAb?=
 =?us-ascii?Q?pzitRY4qFVWQfcEUHO9QUnJXmt8LmmrBUzz9EigOEJUWJxQefpIVmaMHt5r8?=
 =?us-ascii?Q?cX7jVqBCZJzgKs0x7GbQdzii2kPyYyK3ar1ksgHaf59Av+q8qTkC4gAVtFI3?=
 =?us-ascii?Q?ujT2xiRr6kfn06b3q1ETM37ks7lPXa8VR/8yuPmW?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 07:36:28.7068 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b41ef790-11fe-4bea-8f62-08dda2715a5c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6184
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5RQM+3SiVotckqHZQ4Z3BWkk+cxapN+B26I+HU//eo=;
 b=cpp4lgAKRtsLznz2yWAJhEo17eXSiv3YaTsXH8mq5Ra331X6TLGC9HnLj50svlxKgRtqh2EPWlRq8ccSPl1yNCbYu74x019KDSJ6LkkavWHT8hQtvgy2hmyLWWhINIUO47xvWW0e2ofvFOSKVWpu5HbZ1CDRtySZ3wMxkCKLwIQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=cpp4lgAK
Subject: [Buildroot] [PATCH v1 5/9] board/zynqmp/kria: remove kria specific
 u-boot patch
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
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that all 3 zynqmp_kria defconfigs have bumped to xilinx_v2025.1, the kria
specific u-boot patch can be removed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
Please only apply this series after the following series has been applied:
https://patchwork.ozlabs.org/project/buildroot/list/?series=459217
---
 ...1-video-zynqmp-add-support-for-reset.patch | 42 -------------------
 1 file changed, 42 deletions(-)
 delete mode 100644 board/zynqmp/kria/patches/uboot/0001-video-zynqmp-add-support-for-reset.patch

diff --git a/board/zynqmp/kria/patches/uboot/0001-video-zynqmp-add-support-for-reset.patch b/board/zynqmp/kria/patches/uboot/0001-video-zynqmp-add-support-for-reset.patch
deleted file mode 100644
index ded030b3b2..0000000000
--- a/board/zynqmp/kria/patches/uboot/0001-video-zynqmp-add-support-for-reset.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From: Michal Simek <michal.simek@amd.com>
-Date: Mon, 9 Dec 2024 12:11:50 +0100
-Subject: [PATCH] video: zynqmp: Add support for reset
-
-In Kria SOM configuration DP is under reset and access to DP is causing
-hang that's why call reset at probe to avoid this situation.
-
-Signed-off-by: Michal Simek <michal.simek@amd.com>
-Link: https://lore.kernel.org/r/0504474a91a9839828aecd37f8855fd154cdf2e1.1733742708.git.michal.simek@amd.com
-Upstream: https://github.com/u-boot/u-boot/commit/8b81010a2fe385524b58bea9116f1b6954c3d2bd
----
- drivers/video/zynqmp/zynqmp_dpsub.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/drivers/video/zynqmp/zynqmp_dpsub.c b/drivers/video/zynqmp/zynqmp_dpsub.c
-index 76abfeac4433..52af23c3c835 100644
---- a/drivers/video/zynqmp/zynqmp_dpsub.c
-+++ b/drivers/video/zynqmp/zynqmp_dpsub.c
-@@ -11,6 +11,7 @@
- #include <dm.h>
- #include <errno.h>
- #include <generic-phy.h>
-+#include <reset.h>
- #include <stdlib.h>
- #include <video.h>
- #include <wait_bit.h>
-@@ -2093,10 +2094,15 @@ static int zynqmp_dpsub_probe(struct udevice *dev)
- {
- 	struct video_priv *uc_priv = dev_get_uclass_priv(dev);
- 	struct zynqmp_dpsub_priv *priv = dev_get_priv(dev);
-+	struct reset_ctl_bulk resets;
- 	struct clk clk;
- 	int ret;
- 	int mode = RGBA8888;
- 
-+	ret = reset_get_bulk(dev, &resets);
-+	if (!ret)
-+		reset_deassert_bulk(&resets);
-+
- 	ret = clk_get_by_name(dev, "dp_apb_clk", &clk);
- 	if (ret < 0) {
- 		dev_err(dev, "failed to get clock\n");
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
