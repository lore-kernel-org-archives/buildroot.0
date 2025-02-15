Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3299C021A6
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 12:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE31C60FC7;
	Sat, 15 Feb 2025 12:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5niFdaFVpZjO; Sat, 15 Feb 2025 12:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD1BA6F7D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD1BA6F7D7;
	Sat, 15 Feb 2025 12:57:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8778972
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 12:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6384842A09
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 12:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMbluh2jrOJk for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 12:57:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::60a;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3ABE042918
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ABE042918
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::60a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3ABE042918
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 12:57:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVDXeOGsdVTAxZ/XnUxIpbFmPwt652hjNWUMm8jynHKYZYEiSaciFvwEdhZyWNJNje0hErORmqsr2IYJL7va6Bzpkr38dgpLO5E+SFo88sNyohh+NyfubitjvzKhmO7N526LvXNl+9J6NKjfCy+KQ/1+hCxysPpCL3v6O4NcEKNi4iPzZRetYxWWq0mIHDES1nC0Dzx4TuHg+Sg3MYDMv5HAMYOtXG5o/3EXbZYdSSmNipJX0gvSSdbdyqqD6Xg4owF4UFNQMEGETk08mKrNHnkfsr/mox8hKjWi/Oca8Mz14yAA1EsbE9r5OFrUBaNYiSMBcWwYMJWrv1hk+ANuhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWn9QSsAT761k6gBmnvGsRi+0R9vUXQe8QfLw3EtnGI=;
 b=bGnHdvlzugl465WUUnhAsHK9lnvlTy9AzmSFfI2MBG5tdMBim5hrvvKllA7pnvgWxGCtSqZquzFLWFey9hsGx/ZH90Q+ihPPe0U5MmKXUfyGNDrOnpqbKpp5p5GlZJhvLVSjCY8srQxololAGCVjjQ2Jm1UVvBj9IZQc1PlqeJUUiLSUcTYFRJVRtOAfzARAYUv+hThpaS1PVMvcswBfem7WEp9x+R3/u6RM7m0++xjRJIOiwyRm/NuO/abkaXmOhIkl0uPIcIkZyuXplhh23Yo6gdFyw7KROkasunSRWUVazsMnhuTnYU0a9dPqi0nEsCFd4hGcosPHUJkL9qTHsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN2PR15CA0066.namprd15.prod.outlook.com (2603:10b6:208:237::35)
 by DS0PR12MB7680.namprd12.prod.outlook.com (2603:10b6:8:11c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Sat, 15 Feb
 2025 12:57:44 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:237:cafe::99) by MN2PR15CA0066.outlook.office365.com
 (2603:10b6:208:237::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.16 via Frontend Transport; Sat,
 15 Feb 2025 12:57:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Sat, 15 Feb 2025 12:57:44 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 15 Feb
 2025 06:57:44 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 15 Feb
 2025 06:57:43 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 15 Feb 2025 06:57:42 -0600
To: <buildroot@buildroot.org>
Date: Sat, 15 Feb 2025 12:57:32 +0000
Message-ID: <20250215125732.2965257-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250215125732.2965257-1-neal.frager@amd.com>
References: <20250215125732.2965257-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|DS0PR12MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 1498dd17-f58c-4c2e-43e1-08dd4dc05707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OSZN0BCVnxaPaUlV9p3dnBFFQqvC+xGD+J1nOINKhxboMWQq6RotuPbVbo7/?=
 =?us-ascii?Q?Ny3xS39Oj+6+tilbnOLKi091zlXOpJS3LFz0QdfSw/cBhMVs0ZGhGGYv5NNs?=
 =?us-ascii?Q?GJaMIJueMkoGzqnasZVuQwPiTMrFl66yrfkPcfnpAtSW40r7YDovuVSAAUfu?=
 =?us-ascii?Q?KdFPPdMDzF1us5HMRXWuLd9WHWXK9j3FqCU7WIIYLpRjShNT9nNX5uchRgkx?=
 =?us-ascii?Q?T8lSoiH1Ps0yAci88ESh+jdxviSrl7/Rv8MJrw/UcMvEWPqkt1xKz+sy+Lzl?=
 =?us-ascii?Q?s9A9vXz0Rl/mH3oymKRluLDUowuL4ig6fCxmfXZIUbdwVybaS8eoNV8qrf9k?=
 =?us-ascii?Q?MnXI4nAlPjKfNfSvIPteqdJk0a2j0uxUP04g41ss6KTQ6e6Yrgp4uzMzJ2ld?=
 =?us-ascii?Q?cJ7GBZgyYWzt5Thl9VsTHTPJt2cSGzdmZIleoPKy1sO+voM7dbryKGytGx3c?=
 =?us-ascii?Q?yMRxqUNySZauTsAJ8Uy2JhUW6dzE8AYFbXIQczb7O/yC52MeP5m36sI7ONdT?=
 =?us-ascii?Q?7r4YEZAC7F12L6y9XZvMCjOKZlfk9LN/R9ujH7QNvWviq0aRBmjbUzALPoaQ?=
 =?us-ascii?Q?KneFX5LtiIu2E3oq/GXp4/HOAZ4EtK70/k8ow0JzHECUKQ9ncx0yMB4YD7S3?=
 =?us-ascii?Q?JK7e8zIq5WheYcULPq0SL3e+LBzyvH8Et7T6gJD2irBJCgmk8i0Y3N05duyn?=
 =?us-ascii?Q?ocPE3KovUQNH1JdipcbmpnTIIImoIgcSCiJWN4vZ0xM8Uzv1jY3+852f5O7N?=
 =?us-ascii?Q?8/svkVJszkW7YlnnHmmO1LAwKEM8Y8k3Dn4UtqqoVfGMRMTJOXXiL0pfiCyy?=
 =?us-ascii?Q?VgbMMOFWCPcxxOJrfnySuH/z2moJF3PfmjU+2+ec1ZB993/YDQm/ATGAcPxO?=
 =?us-ascii?Q?EoyLrtqASSNGr6K5taSjfiDj+42LLtXP5Zqjb8yHIPev8MLUl0US/h2KaNzI?=
 =?us-ascii?Q?LyMgJDRq94qvmlPZOiU5qQo4AKBGYdvbWc+eg8UKG3921SyG2PL3h8bOh/Kv?=
 =?us-ascii?Q?iahKHcC0j+0s+1fdl23c1MRMJnGNOUp0JlBXOVDuv5d2mqCoADsK/FiW2XGz?=
 =?us-ascii?Q?MTo9BN3WwTn4YAj0ZYTbvp3HUBX8TYHZzuJcn9g7qaMpUCBCiiUVT3e8Wtek?=
 =?us-ascii?Q?/IxZRAG+uPA+T37aMdZHGy2js+UuDRUtycEmnJEAoPgwi4Qt9zxrcB3zaN8a?=
 =?us-ascii?Q?KgvafcCd64yv2MOcjWnKluEEyGc5BKTE8rMQ/vv9vwqWjBxba38e05NfECes?=
 =?us-ascii?Q?AQ8qrXs6kFS99my+yd4HBkPMeEX/4+FZKhaqRk9NfyqkJ1K0WnEDehNAsCEa?=
 =?us-ascii?Q?H5Evacw9Ut9uH6OnPlfgaxyTjZ5IiF6z1zzkORC+mKWtRCyWecwC/SWCVVSV?=
 =?us-ascii?Q?22fWcsdy+CN28MbpSUuIfkhBXn0Bqua/h2FQpbV9c3rBphkzfivUmAOlnyAZ?=
 =?us-ascii?Q?N91pCGAu0fBvPk5sMX2sLD1UHug7fCUIyUntOYTzzFV5D3DnA+780RbWh/QO?=
 =?us-ascii?Q?aOrE+7PKih9L+AB+vfgb2/wmUY9t/W2j8ZZs?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2025 12:57:44.5006 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1498dd17-f58c-4c2e-43e1-08dd4dc05707
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7680
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWn9QSsAT761k6gBmnvGsRi+0R9vUXQe8QfLw3EtnGI=;
 b=q/65GQqOxBHJv/iQIn3ehuTe72rsCoyILyW+S1kFOgyCAMEMis2o8BjBlM+L5erkRTI2h1KkMiJvljlJeSM6tHOrWQVUpxCtO8dnQ6ZPteOCwiOiA9Yat5lyxN/KUoP7IT4O+iGXCV22N0w9ftNcbEbqGTxRLuswAovai7atWh8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=q/65GQqO
Subject: [Buildroot] [PATCH v3 5/5] boot/xilinx-embeddedsw: change dependency
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
