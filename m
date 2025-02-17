Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CBAC021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 12:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B94460EF1;
	Mon, 17 Feb 2025 12:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QU95xZvXmfCF; Mon, 17 Feb 2025 12:20:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C43660EF9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C43660EF9;
	Mon, 17 Feb 2025 12:20:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B12C5DE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A77F841362
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vVAt8hDBgJQ for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 12:20:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::618;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A09D041365
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A09D041365
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::618])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A09D041365
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:20:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BF6encIZf4MWnymturf2AELRzxiBLH4lgSJFmM0lxC0Lwfc1WUCn7s/AxGYKxmysMpP9PvW68K7gLuqgqRnA7PCl/lQJv4JAMmD+ZCf4DJfRQgnuRUefMDmx1UmS2ekWSPPNNVkDPB0/YAh4eTFFuVPwP6xmfOmQp8y032Z+edu7zSoYZcVeeLAMs9LhvdfRqWTiBkcW3Odpi2SDWko5N22r6e4YBhiH4wx1Vyh9gUR1oPVHxCezmswS8GTKpAJijdx5Bji7420oud0XleYWepz5+S1BH66N9iuFdIGol4IrmampJaOzQlyNCZP864OrDKqcs75SJFAkX/Gnb93DqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3BVDdVrJzEszvoVRbquSmrq8Bf3GUmlDhWdZz+1IiuE=;
 b=ONgOURVrHs+urc66LuypanCp9KjL0vs01Sq7s3S/TmNhUTU5Z0R8L2aIwaKoADvHV9p38MGW9WyHl1Il0A5VXi5LPMrPuL2RtwQ3xLO90U2Yh+4HKTrfNlKU21gfAl91zPc7liPOkJwC1Bf/HZmc/1q+oFqMY7zkdhGC9bsur0X6uOZAKdX5ApJ26CjkGuuvjQZRwN1TgIQNk5P6SHQmeNH8Zjl9f0p/ANTf/EvTsFMwWD7GYIH0q2p2gj9Md3Wcji9G/Q5IPgYfHMwxe50hUv40kw+OJY/lbwfvQvFfg4wvfhpUAWeNEu7farDYuEy1Ox33fGlbhqlzGT7/13RG/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH5PR02CA0021.namprd02.prod.outlook.com (2603:10b6:610:1ed::26)
 by LV8PR12MB9406.namprd12.prod.outlook.com (2603:10b6:408:20b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Mon, 17 Feb
 2025 12:20:08 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::f3) by CH5PR02CA0021.outlook.office365.com
 (2603:10b6:610:1ed::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.17 via Frontend Transport; Mon,
 17 Feb 2025 12:20:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Mon, 17 Feb 2025 12:20:08 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 06:20:07 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 06:20:07 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 17 Feb 2025 06:20:06 -0600
To: <buildroot@buildroot.org>
Date: Mon, 17 Feb 2025 12:19:49 +0000
Message-ID: <20250217121949.2614857-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217121949.2614857-1-neal.frager@amd.com>
References: <20250217121949.2614857-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|LV8PR12MB9406:EE_
X-MS-Office365-Filtering-Correlation-Id: 690df840-aec9-4483-09a6-08dd4f4d6b02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CmGrH4397/7bY9BFoiDZeXRV9bE/BUegepFxz0s0RCr65iTvZ3uNTL5iTCqd?=
 =?us-ascii?Q?jYluM3mdeI3P0kqJWnifL5mNpdHp0lbjyBuF1MdLAIgVCfC0dK310FP7+aXJ?=
 =?us-ascii?Q?jStw6NyDvHyRUuFUpkX74yAFZDc+qVO7KV4mk8Yc5yg0l251IFOfQExqXu7y?=
 =?us-ascii?Q?4+fDCjtXbDCdJU+dVBas9VDul+MfeDtZachOEaMpI35GtQQPx2fzEUDsskyz?=
 =?us-ascii?Q?BpnSN5h6bFiI2KRaGlcdT1aYHu9rSbUrV1OhjxprsxsLuSGsxfa6xHVryEKd?=
 =?us-ascii?Q?PPtnzXql1SASyggz4US+2ipiUKQ/vVSvuKy8XqQxdCBJqj/uDFOtG931MaTf?=
 =?us-ascii?Q?VAL79rZVmHE2SY+Lz729hnnzAuwjB19bavNSPbIuXtARxCiqomLd9Jkbd9es?=
 =?us-ascii?Q?fSMB07DiTw9q3GdFDC7Tz/cB19/RDAo5zYqU8DMkXJ6KntdbNx6LUk7GRCo3?=
 =?us-ascii?Q?2UGqcDaFGZuF6GuJbeLOdFlLx5nXkqUK/AMw2lktHMx8rIGUbGKwdx2ePhSt?=
 =?us-ascii?Q?4lQbNlplNKBhLc9Xj/oNym40tn2kUMSFZOT6QY2OznBVhSuJdw1fn8ejTd/g?=
 =?us-ascii?Q?UwvANq/7/GGzbHfu8rWQpivPZbUORhQ6PA4OaWluVqiMHL7AKvznuqmiKw/3?=
 =?us-ascii?Q?x492jgJgCanaZhrbUE3diiO4qNigzUUj60aBMRJRcY45FVyMek3TPTrH/8GL?=
 =?us-ascii?Q?vlVmsIvPdT6QwSfkykTvOyKuJSfrxHLB9JveIbBoVrQY5rqDIaEuBIMaIAvK?=
 =?us-ascii?Q?60V6ql/7ewMhWnLqGJkHJnh3xER/SpxQPHt99Qpa8V5c/mqDlyY01n+uV9Yy?=
 =?us-ascii?Q?25N66725IfIYiKqmS/pPtxKP3/X6+JCdizCARGibfrvBQcst1xpN7LiZLB6B?=
 =?us-ascii?Q?Dp0ChG+ghgqclnfsuKprGY7yMaAwKgBjOuFa/rfXXpbUzmye4xAYlMsJdnxw?=
 =?us-ascii?Q?y7ytP8Newr9AllgOfW62qJ5JtbxNOuHSH4x/Mg7zDiuvU0fI/IqF9TyfjKyf?=
 =?us-ascii?Q?aP1aHfAy9Ve+dq7/lePnLwfKcyujj3xVkjbY3EGFE/M5HKd8SWhmwj6+zsP7?=
 =?us-ascii?Q?skxqtogHzD2J1ozwESMoxFn5zk9HKPJFs7DH1GiPb0tq7n91oBMgLIDwpVnM?=
 =?us-ascii?Q?Z2LQxpfRXxTbggvtxLZl/FwXrxqC+hN7Rvo2+WzugYBc+HiHMIHAgIBRmTfR?=
 =?us-ascii?Q?RIIWIoA/tZw+h9l0dVQa1+OrflKIJd/HksSOeboYaal0pN17Xp//GHzGMZcz?=
 =?us-ascii?Q?3Gb2du5LDVUq25ZBaXCwB/KEjwUrNq63LUTTZBctZWboqDjXthGKqHaomTO8?=
 =?us-ascii?Q?XcsdOZq7GqHu8oSnvMkaEZfq3a0AvP5Mvqzma6sJPlKNN82dTTgIamaAutmK?=
 =?us-ascii?Q?8tcHjPi3hHYKW7PSh/ZZjhJQJ4lh571VhM+gKToRAzrah8VaPAamY4o3Kdb8?=
 =?us-ascii?Q?KElDUv1T0VoW4GkIftQVAhfww2wqbgscN3zn0eHcjkCGx9zRcnTU2fUiqmvl?=
 =?us-ascii?Q?1P3gDk0fA+f55LmFXiQt5i0dZfVdMzfd1+F7?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 12:20:08.2068 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 690df840-aec9-4483-09a6-08dd4f4d6b02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9406
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3BVDdVrJzEszvoVRbquSmrq8Bf3GUmlDhWdZz+1IiuE=;
 b=Kldpv6vWeEWa5gyz/VTK9Fw3b7jd0O2650qSCSJUFpdDui/NIVemuVw7rd8khXUtBp/JybnH8KDCU9TG65lyk/Z2GXwj2nm4fyZqgKwZs3ioPkszWy1tPTK51H5qM3H/avhCmDZrOcTVKW6zE9cVg2uPHWOI3deyb9zM7XrzD+Y=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Kldpv6vW
Subject: [Buildroot] [PATCH v4 5/5] boot/xilinx-embeddedsw: change dependency
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
V3->V4:
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
