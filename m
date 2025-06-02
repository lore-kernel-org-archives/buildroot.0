Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52F6C54FB3
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 13:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7153340799;
	Mon,  2 Jun 2025 13:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XsdhCWvIb5hN; Mon,  2 Jun 2025 13:51:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B1DA407A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B1DA407A1;
	Mon,  2 Jun 2025 13:51:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9352222
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 13:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B67744065C
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 13:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0JwcRQo02e8 for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 13:51:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::631;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD50D40643
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD50D40643
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD50D40643
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 13:51:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQDtOWoW7lClatiydm9WYAvVpd1JVtDny0A3OLRHANRXv7HoDpLlm9X1JkWX+X4ZtQarsb7kxq41vSPzEhzDYPnA2WPXxzBnmJRFPxizLig+DWScixgjlIxQ3AP5qAB7COaB6IcQf0sUVPkLOK8LMt2WXIYYtLP2eb1a877H6bkP6lvFBU0E14w8FzRZs6uNilTRnSAziQa1L2XWQtPWA0Dgozxno7UaEQZadie0TqYsmcrdxve0SpR3lOXQfcwiM40KJTLIFoV6LFRehw92Nv2FoxQv3dlTV7hHFomTrZAkvBpollCi1STx3Tr3+iOUJsb+SRQwohsWZAizmuTynw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=md15fenakph8nEErB8nGDdL9JvlttK397MolaIntp+g=;
 b=Ys3+lapeFze3HLI4LEA4a51jAJNLtZ1/tlZ4ii1ZZe4lxBhm9ASmeSoKmN7PzDH8fpjfqubWNLYovGgfJ5/jSjziD2A85LiZ/pFSvSuwn5AqXdAA53QZyhcvRkMHIYF9wexYRbUnHY2DnUH4tBYImf8RGSVwqNybiJXBtvsYCd9B3bMEgXxDNmD2cT7a0V3YTX8iewqYxOWfHjD+oCpWBMflX2jXzvA0Fo3/W+nAsHU7SNdqEYmMZP39ZTGSUfQGc9ceL6rdm5btAVS3MukNZUa/5vzBXYB5l4WyaBa13QkaHW0GKbJ3lQ1NRFTcHZcMKmRnIzdyu81cowAzx12kXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR16CA0018.namprd16.prod.outlook.com (2603:10b6:610:50::28)
 by CH3PR12MB7571.namprd12.prod.outlook.com (2603:10b6:610:147::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Mon, 2 Jun
 2025 13:51:06 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::99) by CH2PR16CA0018.outlook.office365.com
 (2603:10b6:610:50::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.28 via Frontend Transport; Mon,
 2 Jun 2025 13:51:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Mon, 2 Jun 2025 13:51:05 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 08:51:04 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 08:51:04 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 2 Jun 2025 08:51:02 -0500
To: <buildroot@buildroot.org>
Date: Mon, 2 Jun 2025 14:50:54 +0100
Message-ID: <20250602135056.404165-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250602135056.404165-1-neal.frager@amd.com>
References: <20250602135056.404165-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|CH3PR12MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: a8dde7fd-f16a-4129-2c8b-08dda1dc8554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x+nOJqggR9G83qZszereblbaeuCzZ6dM4x20QE8/ctrUNGerd4hEX64GNUoD?=
 =?us-ascii?Q?yjhcR9WwHSMQz3Jh0Fwy4Lk/Wsr6tWJ6smpmyybd0DZczSkh5SwIT3mHsQ4S?=
 =?us-ascii?Q?XE2R0/K673erhGYvIYE6Aej1/lOumF5ceETnUxpqDu7vieBYA85TzDWKwGwj?=
 =?us-ascii?Q?KzCueJ6qh42ombdzFDxOBrBqTOQjuwRDnoL9ly/eCmHiDUapgULMHmC89NFP?=
 =?us-ascii?Q?TwHAv7qtivePVRgW1UqTknPbItHnozw9d3COHBd4yf4e44RTiNy9dUJfrpZt?=
 =?us-ascii?Q?2C7oK73tpgDW7sB16cyndiFw/JE9A9IcVZ8C5AhNVvRQS/tn/qcU52pWlryo?=
 =?us-ascii?Q?YSBwwM7XnqMs054LwQQbjTPIAOcno41xIu1se6Qsgs+1d4wwYNJtRIaqn5ss?=
 =?us-ascii?Q?uvwixfRsJkHWG+apL/JCShhYsZNlbbxd78wHJlXSOEf+NTjv4FyYEcEjty8e?=
 =?us-ascii?Q?20TYn9bfn6FTrycRFEQl8s6gixDdwvsg8GKORp+iPfKcfmqRtJjsV+lUHDdT?=
 =?us-ascii?Q?ylu865hqWsy7nvZQnyb60QpDEcPnuLB4jz2MK/UJTxreLpwQiguUlyu2jV3L?=
 =?us-ascii?Q?pPxzt2fqOOxl/J8Vh5UP5sl6pbgNUP61bfD1wVH57QENC5DuKFfHmKY4NhX1?=
 =?us-ascii?Q?KUiLbaS+mvUDyoZKTJcyquS6CtRp8PqlIvQgTMgWG/k0x4fZvNLKDae8DJwt?=
 =?us-ascii?Q?FpwADwqtqoXXLrFlCN2VShQ42SuLoEz+fXhn2Im9h8otHp7+1U999gChBq2K?=
 =?us-ascii?Q?9q9d/Xd/yJDhV7aHpVK63XIP78RJp0WL3oLmZrnw7odQsf3/kWLLQQUm5Wf4?=
 =?us-ascii?Q?7CXpOch45/6c0tzDWg6pD4EnxKbX6sNDw+fpNuhsHHaZ3VZqAI6rv6mguL/C?=
 =?us-ascii?Q?4b93DB7IkW0lZFrxxj68V79En40UXQ1GqmaRdK5NnodwpT10fNBUo2alQCbd?=
 =?us-ascii?Q?J+lzvSLYOFUtscvyYo8EQzTYfYGY0YwYZVVDGmt3bROT2wLWIridD4yq16Am?=
 =?us-ascii?Q?/9G9g1nvUjqruBKKUwHsA5GyXT0W3B7YP4I0wTIDhdhBzEvqHaPs0AIfOyWz?=
 =?us-ascii?Q?5sAV7/4ljxd7v3HiwEaA8ylLaqW6icXRettAZYYPIB7yS8TPb0WXdEFL2QBE?=
 =?us-ascii?Q?VlDyWDWTfAYWbLvBP/KBTISBxeQ5h72zU01W3qtoXpwlPOIItaawU/mFZxSL?=
 =?us-ascii?Q?8RDTC9Chep0pPRvGFRkoxUZLR+PPvTS6FLvW2omVhR8oaa95a+kLM58mx8Bu?=
 =?us-ascii?Q?3t9r3AYA+zIUBdpPuoD70GYIJtE+/Mx8SjOo0fannwg16ZgaPnMBJOmITwye?=
 =?us-ascii?Q?+95tPnieDB7qK/awiqZ2vY8xNqtHj9Yiq9+iOj/f7epaa6L+wQF2DFvfgBv9?=
 =?us-ascii?Q?qk6/Cyv2igYARH7oXAtBzWazVMXlN+3pNpPpk48b+Da6t3ab2MWhjnULh29B?=
 =?us-ascii?Q?8L9l9kRUiJTBjVO/q4WFP3NC77TLmwDrA+85jj4cQWPIbkzgrC96osyNWLw6?=
 =?us-ascii?Q?E50sE3vXRhahCgUxHy6AG2hdWiuyL7oDTSedOrv4V4xV4GPWJC2B9QjJab0K?=
 =?us-ascii?Q?qARImd+H0cYcgAOag60=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 13:51:05.7445 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8dde7fd-f16a-4129-2c8b-08dda1dc8554
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7571
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=md15fenakph8nEErB8nGDdL9JvlttK397MolaIntp+g=;
 b=nSFJwoXdBMzh/Ek9jbFSHMejL1jksJXpSMN91qPpxBSZ79q6r1KZ+QPQ888jcajIQLAOT0AE1AoLVjSldGaySbTwQ6tT/4I5AXhiQuOptW3RcQLem08CeKA7NxAq5y9XC2ur6L62ISAxWJR5i/j3zOGH1tOJjvayKHtpEHblYS4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=nSFJwoXd
Subject: [Buildroot] [PATCH v1 3/5] configs/zynq_zc706_defconfig: bump to
 xilinx-v2025.1
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

This patch bumps the zynq_zc706_defconfig to xilinx-v2025.1 which includes
the following updates:

- Linux v6.12.10
- U-Boot v2025.01

The xilinx-v2025.1 Linux 6.12.10 release tag requires a patch to fix a
leak of the Kconfig CONFIG_XILINX_AIE, so this patch is now included.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zc706_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index bc853f522d..600b521fac 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -2,14 +2,14 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.1)/xlnx_rebase_v6.12_LTS_2025.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -22,7 +22,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.1)/xlnx_rebase_v2025.01_2025.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
