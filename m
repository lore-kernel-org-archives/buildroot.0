Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC5BC021AA
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 12:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7057D408EB;
	Mon, 17 Feb 2025 12:49:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rk-5a_6vbgHU; Mon, 17 Feb 2025 12:49:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3818F408EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3818F408EC;
	Mon, 17 Feb 2025 12:49:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37A1672
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96C46408F2
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPoEjWHZttvt for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 12:49:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::622;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8AF974063A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AF974063A
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::622])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AF974063A
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:49:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iw3sSLG9meeFjMSxoc6NgoDrFOo/A3vWibiLDBCYjXs3m8KxRCG9/eed4zI4RU+WddlAi1i+vnhk88b5J/AwNrL2pd1gqqxN/t60IOz5l37zTjGZQkcAcT7RYF+ixh5ID8W/Ler66vBAvj+HbP9KOyAmZ6fSWmk6MaysCOq+1n8j1eqOvj4RLTW55CmtJiTWykI0j4RLqG+ectIgcR6aF6qxm6+VBKi/rTnfmxShw3utFmM1x+PJc7fNzXsQ791092JMHLc4yFl3SWCQ7tpfWaed6t2/VCg6dXo1FMEgcToAtFC9yDF2hjIfRi0DNME9l/3kNGr3xwh++xoZvs7KDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdCcmOu6Ls82LbGmp9DEQn3+H/8+H11T4539afadgek=;
 b=JcFuYG+8nOx+BQcCyc9EojaxTQOMYM+vdP6nBSfDRbMC6yMFNLpBlaP78+8zuysPDK2cJQkgzv9H6RAdqAaQmbQ3u9xhtu/RNsKt/1/GSabJguJ2ZfpC2UMvueFSg1ykv4yb9gSyygJsm+vz5wnfxd1GDrCke++GDq2vM7DLH/U/NrGJNM+9T8k+4WbZ/ZiFwWODn/WMt0D7FaWNtYouJ3agKJokB4TMCPj25S/wwOisaKOjV4zgE1f+3qWsfKGvSnDZCxyfKm4lePfmdtzTKNei48cIyrOVIiy9NLCzo+n+NU3w6WJbnqpxlORQOWYLfzNMOsjoYlCdYWjYjYqSHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DS7PR06CA0047.namprd06.prod.outlook.com (2603:10b6:8:54::27) by
 LV2PR12MB5725.namprd12.prod.outlook.com (2603:10b6:408:14c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Mon, 17 Feb
 2025 12:49:46 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:8:54:cafe::11) by DS7PR06CA0047.outlook.office365.com
 (2603:10b6:8:54::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.16 via Frontend Transport; Mon,
 17 Feb 2025 12:49:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.2 via Frontend Transport; Mon, 17 Feb 2025 12:49:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 06:49:44 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 17 Feb 2025 06:49:43 -0600
From: Neal Frager <neal.frager@amd.com>
To: <buildroot@buildroot.org>
Date: Mon, 17 Feb 2025 12:49:32 +0000
Message-ID: <20250217124932.2653445-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217124932.2653445-1-neal.frager@amd.com>
References: <20250217124932.2653445-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|LV2PR12MB5725:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b6ce89-987a-4fce-3389-08dd4f518e47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?myROwTdAds66ku5xVNZhZQehbDHtFQxujbejuy9C1ws47plg5nLsxVmmEMaW?=
 =?us-ascii?Q?1xaLDdgGth3bwk3c/JMKYNhOliHWOxg4iJHPeeOt0BY9UnYNIMCbPkltDdWA?=
 =?us-ascii?Q?O5JZPlKdYIWew82BQYFo+f+ZxMsZBAelKypUONFGJ0W6IyfdT2FlYua7Rrso?=
 =?us-ascii?Q?Eco0jK3ns8hMzYPYAzyIfED18d/BSDfVHsJVOkKtxRNOZPSp+sb8JMnJnr6K?=
 =?us-ascii?Q?GjusJm1rYCursChtWDSpvgmNItpz/houY+kpv/9Xv3+9GikAZhpMNjkRWTmw?=
 =?us-ascii?Q?wtwMdIhQcpsNk37oI4N24YPTesquBYc22kr72Bi9Aou2cKBwalyhkHY1rYLO?=
 =?us-ascii?Q?WuQXYA81mYw1WZ9tUA5aHRBqlfyBy5cVoqj1BWQHAvAaBcvs5WR7XH2R5icr?=
 =?us-ascii?Q?fSdgEfOBMZa4geHPzNyOue15hPSdIbmRGlSXgTp69Dw6zARXoqeQFfdvh/v4?=
 =?us-ascii?Q?zhh1cpisb/H4evH+a1137YyoQhZaaZozD17VUzC8hEdOktcw1GWJoQQ5vxYv?=
 =?us-ascii?Q?+saydCPHUacwrrbcAvzM8fZ9RLMbZBUITOgkidkQxwkwqjkAdUB2Kcatdx7j?=
 =?us-ascii?Q?EuQbALoyROjqPkMdOMlNcbDNimvgwWSn8xnv2gK1zP0nru2P5XXolhIHrb3V?=
 =?us-ascii?Q?yri9wNxCd6ZXlf4sZdgdMRLTrjNtmpNJEJG9j0euy+A2265rPO3N+Hj7LgZR?=
 =?us-ascii?Q?O959K9jppmVqOxMlpa6tCoQ+GAlXuVwMV6oGNPvsTgkchuxWI6xc57UhVIZh?=
 =?us-ascii?Q?hRIDOzvXBRjkbmRcdnRsa+XwKyMNQokHYWmNCLhALJ9vAHJ0BThHeijEhFJB?=
 =?us-ascii?Q?RpFKEcklcfbFO6B+bT9vfpaVlDjsq1xHS/6qFEIpQm78DVfyuSETND94Y0Ec?=
 =?us-ascii?Q?TAx26HECvh0teQvSsdCZfUeql2HAE0CQmqcjwZrq0ve8T/25udTl47YTlw/l?=
 =?us-ascii?Q?jUUq6uLxCF2/PGhjVCujzKnHDERfhvwQYM+DiL1Fj93Ocn8NdzIrpCqp4GnD?=
 =?us-ascii?Q?hv2q+q77RQ6LCWcOSAcmsdZ2WN2U8cz/GUEcInR2UW24NJwbbTSBWwiOCWpe?=
 =?us-ascii?Q?loM4XRH6tHmkC7yM+Nxo4ofreFpGDAz5UoDW+YBCiT4BkO6xGdohe+bDjDI4?=
 =?us-ascii?Q?/4hsaRLx7BmbFz51q/2gIpQ5j3Sf8hOZ4LcnK3nnmBuGgWNNGBfCTS+fiq6T?=
 =?us-ascii?Q?iIKHA4GWvOWlBIkML7QS45LOIwkkSW78272A+UJKyqmlOnD5WBytVP5rQRSR?=
 =?us-ascii?Q?ga1aj/8s8y1n1PEF9crk5ic5NvRR14Kb9WIiR30UIpGVSyGjg83bXXRj3JB3?=
 =?us-ascii?Q?0ngq+KYdjl5fQzu4vJL0ZyAWHAsXYEEEPgd60767+2DPmzsSrGzhj/U7HEZT?=
 =?us-ascii?Q?x8t0nwspFzF6Z7y2Em/sv6lQD7IuiQJuWkNNeFCjz4MfJqzITLgNVLITxgfq?=
 =?us-ascii?Q?VjM4I6mMOpPLF1UzvNF1MvtUsHMiBQo9fyFYa1yXFwkgn+fbVfZmcnY2c4bn?=
 =?us-ascii?Q?wGYTwHIfIa7LmBKYj15QYYN/D/oaQn+YTSeB?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 12:49:45.3517 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b6ce89-987a-4fce-3389-08dd4f518e47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5725
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdCcmOu6Ls82LbGmp9DEQn3+H/8+H11T4539afadgek=;
 b=At0lMUE/jUu0yRpRtlW5sVEfD7L017GwkpwKKfmZEbXCba5OmM4KNvbAaPBzpFkQE1/888XvRZOprNT4YK2RLHPSL+0yMofzDZAGM90+tYZNE5bwWGaOfXryX8+cja1xF6cQHwhAKCdiFRrFEFO5IU6ETHTaj1CMDNDpvleHugQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=At0lMUE/
Subject: [Buildroot] [PATCH v5 5/5] boot/xilinx-embeddedsw: change dependency
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH can contain multiple tuples,
BR2_TARGET_XILINX_EMBEDDEDSW can no longer be dependent on:

depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH = "microblazeel-xilinx-elf"

A valid definition could have "microblazeel-xilinx-elf" as just one of many
tuples in the list.

For this reason, this patch changes the dependency to:

depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT

One side effect of this is that the user comment will be displayed now when
using multiple tuples, even if one of them is the required tuple.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V3:
- new patch with V3 of series
V3->V5:
- no changes
---
 boot/xilinx-embeddedsw/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 757ff59e35..b0691d7e7b 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -1,7 +1,7 @@
 config BR2_TARGET_XILINX_EMBEDDEDSW
 	bool "xilinx-embeddedsw"
 	depends on BR2_aarch64
-	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH = "microblazeel-xilinx-elf"
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
 	help
 	  Build boot firmware applications from source for Xilinx
 	  boards. Users can mix and match applications to be built
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
