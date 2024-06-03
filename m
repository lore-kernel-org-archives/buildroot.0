Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8248C25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 12:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81CCF82257;
	Mon,  3 Jun 2024 12:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQLwLekHz41T; Mon,  3 Jun 2024 12:47:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73F3A820E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73F3A820E6;
	Mon,  3 Jun 2024 12:47:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F18401BF3DD
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 12:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE931607DF
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 12:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XwiaWoUA2ssr for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 12:47:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::600;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0EB37607F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EB37607F5
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::600])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EB37607F5
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 12:47:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwUoLHxYD1RA/9iQ0oMe5vSwHD93KMlyJiLGdDCY6Lha2ifSLODtF/YkHdxjx86czubi7TNfJLdmWIwsbFLwi2UwFwgWX00wr1rR01DXnArAejVeAPWEtesMdS/v4KzjniPsKGevy6z8XFHXkKO8FasB9mviF4+kfKblvUT0sEOi+ZX0y5uWkm/Laq1iUYbpF4cQKTN8/dIJWtj9sl3wfPhwt2W+Kug0rpoZJcsNI4vs4JUDoIu2Nv2Htsg8RDwzF9HBivQGx2UFd7syUB/AoSfAeNDMdFKOUHAmEnxHcLKEB9t9sGZicTbzMqWYcDDT8PP/UNNEAcUVR9BCPPEIww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lW2OuAlZp3m/TUIUQJ2b17NYcvLLPnH9Pe+K7+nyWSQ=;
 b=nfYMpXtx8TpM6FZ/FbgEZDJ9vkI8xi1r+DjGCH0THnwEhmx5I06ekS/4EeqT73+XaGjXouhicAd5lf3+uEaImhJFmLTvHc9ev9gtPExQaZkA7A6rmvme7w5dixBvXcjHlqcHImlrVQyvPT7azY/X3X9hH5mTjRQoRmKHvXOPj2nZBPvR6mRsSrhdEYu/yY3gKmvGPijHKTSoV8j4aojkbUiDr5W5uoLlGZz3lJFv2m3Stxixs8Nht7A2ew3f15MOFsSaAiQe7p1U/APrDVPd+X0pJaEAVXuuCqPnefQmvjUBxrtc05njNVtjyX22Be0dbkAzcBsFo97cU3UQn+8jDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR03CA0347.namprd03.prod.outlook.com (2603:10b6:303:dc::22)
 by BL3PR12MB6378.namprd12.prod.outlook.com (2603:10b6:208:3b1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.36; Mon, 3 Jun
 2024 12:47:44 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:303:dc:cafe::6e) by MW4PR03CA0347.outlook.office365.com
 (2603:10b6:303:dc::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30 via Frontend
 Transport; Mon, 3 Jun 2024 12:47:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Mon, 3 Jun 2024 12:47:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 3 Jun
 2024 07:47:41 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 3 Jun 2024 07:47:40 -0500
To: <buildroot@buildroot.org>
Date: Mon, 3 Jun 2024 13:47:37 +0100
Message-ID: <20240603124737.222442-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|BL3PR12MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: ab506cd5-0ae3-44dd-9e05-08dc83cb5c31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|36860700004|1800799015|82310400017|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z6sl/7k7yVbODbM99AGUYLcADg0U/UlzseWjBesSJlV4xSW/TfRhiKKsTX8n?=
 =?us-ascii?Q?tIMxwHgDmznqmsEKfqkvXV97N4hMCz1GUh5aGYbf6HS+a9b0PhOlf3gl8/WP?=
 =?us-ascii?Q?a2Eqr5C3jtmATDdFprKvEflR45Sv8ssinJfO5rIJxuabKYcj7fXLpl0ad1FK?=
 =?us-ascii?Q?bkNrrry0E0abQhuZVtXN1Em5mASbwgi8L+mdJDxYLFgmyYERxYW/cJJGhjcO?=
 =?us-ascii?Q?r0DnCcczb3SycSN0iB+CKMsAUqXDw7/u3Z/6SMrKvW8/6MqSQGFnuMblMoX0?=
 =?us-ascii?Q?4nkXjxLsdELYz9ECXV9WlJVQubDrCSRgaP941FkQNsE73ardrsYfuxDnX1+d?=
 =?us-ascii?Q?HOooMWp8e8OcEDVoR1QP306QvVObmg4/1GPEtdn6wvX8CKprvfwKPIFaFQtw?=
 =?us-ascii?Q?L5RAS262/1ztHnuD/gcADnIPv9x0SuXpsbv0cy3zoGKrwdEnIeg3bzxWVuPx?=
 =?us-ascii?Q?NYVhfyNRl03BzkGpagAwqZyxv6g9TmTQGcatrPTw5YrI3Ew53JmAbjJc7Y1Q?=
 =?us-ascii?Q?pZgkMrMGzcN3hsPI7unb8yCYpOYC5riPAi1eSSugrQVnphdH9ry6aSW1lsHK?=
 =?us-ascii?Q?t1HBlmEJ9Uh1uJnHbVj9o/HgCxowR2NfnKDV6jO/DR5oTHrgXhMtWp4CmdEF?=
 =?us-ascii?Q?mCg+z5Lwsgbh9fgOl0Fcj/iNq8dHJohZQvfkVUuRaz93Ap7vV7nv8nLrIZ5c?=
 =?us-ascii?Q?4z1oh+2XVPeRr1TmhbMwmF9wDN8R1s8axCfTUlZMEyGgAvDO8l2GFBVb/kzq?=
 =?us-ascii?Q?5CByAeRoTZv34Kz+93PvxHdz96kZ3cgm0HaCiEPaGgWRyCo2MbbbUCIXc34Y?=
 =?us-ascii?Q?k7pzmcjupxVNaSpMHnyQ/L3Ou//W+zce48/nFXNsaNWr3uZmcDpwqAqot2cS?=
 =?us-ascii?Q?ORu4hcrqJYinqriBAWAaanAz2Ls8RJ03sobGQ34+i2JhwaMYzpwHf7I94mzm?=
 =?us-ascii?Q?6AWFIzWMMYE/qrF38vsUsfguj0t/288OVtmV4ifFjGuO0/y4+u4rozqGFpZI?=
 =?us-ascii?Q?/4MBF6E4OolZUPNUTzJJEiBFzsuBc2oJYBZ5aySxWuZCr9qN3lmDzoJ+o6LC?=
 =?us-ascii?Q?xjzObphTck/uGa2Ga0z148I0OI4u80BWP++4uKhKTbg8srrNHNLz8rC1zM/0?=
 =?us-ascii?Q?4UnjaXynPaiuVJXGPFvtSFJp3gEBBtNf3EeVGypKkOenPaOzcU3mgUw+x2Ru?=
 =?us-ascii?Q?6/l0eeE8fUl33yVy/XGkkjtWa/Jo6Bd3eg1W9O7GqsnrA43rrz4eaA57eSCq?=
 =?us-ascii?Q?q7AoHYYEW8aPRk8vPvSXYqO3O3KpYnKG/P+xv4V34/ANpG7cwOAsHLlTzbla?=
 =?us-ascii?Q?VIW9Wxb6gDTQgw5zAhb7mpk/hbOebKLG2zushKs3EJlUCGXaGKHsa5a2W5vr?=
 =?us-ascii?Q?mo3tvaI2zmwgsX7nQCjjot1E2Hej8cHh9gH5n3Wf9Onz3W1Gaw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 12:47:42.6560 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab506cd5-0ae3-44dd-9e05-08dc83cb5c31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6378
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lW2OuAlZp3m/TUIUQJ2b17NYcvLLPnH9Pe+K7+nyWSQ=;
 b=OGUQbG7ARn4rJ5nSJQz4vPgcf/ThVPH5LT6joWtpQRToJP1vs0BoJsIZ5Zbq+UQEYTYehvY38V13tNU5Ot6qnh6S64HXFlNJ8KVfKCG5sYXw4LYl3krbs3skpe91O9EdnXZyOteijZS+tIAM8fkhR+rakTLnhl99VxjMALPWywA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=OGUQbG7A
Subject: [Buildroot] [PATCH v1 1/1] configs/zynq_*: move hashes
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: martin.chabot@gmail.com, brandon.maier@collins.com, ju.o@free.fr,
 juju@cotds.org, michal.simek@amd.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch moves the linux and uboot hashes from 'board/zynq/patches' to
'board/xilinx/patches'.  The reason for this is that all of the Xilinx boards
including zynq, zynqmp and versal will be using the same linux and uboot repo.
By putting the hashes in 'board/xilinx/patches', the same hashes can be shared
amongst all of the Xilinx boards.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/{zynq => xilinx}/patches/linux-headers/linux-headers.hash | 0
 board/{zynq => xilinx}/patches/linux/linux.hash                 | 0
 board/{zynq => xilinx}/patches/uboot/uboot.hash                 | 0
 configs/zynq_microzed_defconfig                                 | 2 +-
 configs/zynq_zc702_defconfig                                    | 2 +-
 configs/zynq_zc706_defconfig                                    | 2 +-
 configs/zynq_zed_defconfig                                      | 2 +-
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename board/{zynq => xilinx}/patches/linux-headers/linux-headers.hash (100%)
 rename board/{zynq => xilinx}/patches/linux/linux.hash (100%)
 rename board/{zynq => xilinx}/patches/uboot/uboot.hash (100%)

diff --git a/board/zynq/patches/linux-headers/linux-headers.hash b/board/xilinx/patches/linux-headers/linux-headers.hash
similarity index 100%
rename from board/zynq/patches/linux-headers/linux-headers.hash
rename to board/xilinx/patches/linux-headers/linux-headers.hash
diff --git a/board/zynq/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
similarity index 100%
rename from board/zynq/patches/linux/linux.hash
rename to board/xilinx/patches/linux/linux.hash
diff --git a/board/zynq/patches/uboot/uboot.hash b/board/xilinx/patches/uboot/uboot.hash
similarity index 100%
rename from board/zynq/patches/uboot/uboot.hash
rename to board/xilinx/patches/uboot/uboot.hash
diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index c6ca5a6244..f955a0c4ad 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -3,7 +3,7 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index 9e37678d9b..75ebc2a3ba 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -3,7 +3,7 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 9ccf23f6e1..ce539eefaf 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -3,7 +3,7 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index 95606caf5c..925faeac8e 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -3,7 +3,7 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
