Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FCCC27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 05:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85B7F61219;
	Tue, 18 Jun 2024 05:58:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mbqZj1mwmioL; Tue, 18 Jun 2024 05:58:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51B4F61099
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51B4F61099;
	Tue, 18 Jun 2024 05:58:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA3F71BF285
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 05:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B37C940950
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 05:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YakDz7kDcmiQ for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 05:57:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f400:7e88::614;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 936654097F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 936654097F
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::614])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 936654097F
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 05:57:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kz1nygPOCxrsEAAUks7MjoinJIseJi4HE4LHzosA0fV1H7Tpz3jPZwdjGCgVhdWNeHw7vZvJb4ThPzIx9W7O4WVdd3C+rgseEoUMW9gFIZNmdh1y6T6MinSnqvbNzk32sHCRVyvPKcevzkY0aZClNrXZbXwi38zqx+I+EiMITCJojX5DUcgzaQo0kFETKSRx9PPB51Q86BcCpO7sSR+mHDVSYJmdGhuduJKNTqkN5kSAx8XhhKltTpfvV+FgarlY2se199j2ai8VcXSVcQEIDr7dDfVngv4mV2cIVOjXW7heEiTJjp12Kg4qbUd+6Mh4owlR8Ti8tLYjtSe3/sPQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nObobgDxxVHGWDxekjL7WLF57ecNmtdfuUkdrWsaJdA=;
 b=hapsC78TA38jWaNFHROlGYD8GCdNSKWarqowD+oqj1qM7t/HD9DJUv+UGp4FuNDcz/y6jdV6ePOeLhpZk0ulrZ4RHs/uVwD9DwQ1zEc9+Vze5d7iv03QPYFjvkHS8XvzS6QC+BAi3XERxrc3eJfb1RQDZwpHn872rbQVa7sdyssyg/u371z3pqOx1IWypbRN8aThs1hwTU2+kwApzKx7vCp7W9HUSOFiTWH4XwVvKw9e1LtcvbXB7KjdYOF6QMTmqDqj0jJ56EDfoj79g248/jaaG1j+dobAq3gfPW43UNmTypwz7L5n4AtVEOOzAkS17aR5ysK4llWDwL6UQpvOTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SA9PR10CA0024.namprd10.prod.outlook.com (2603:10b6:806:a7::29)
 by SJ0PR12MB5611.namprd12.prod.outlook.com (2603:10b6:a03:426::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.32; Tue, 18 Jun
 2024 05:57:52 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:a7:cafe::5) by SA9PR10CA0024.outlook.office365.com
 (2603:10b6:806:a7::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30 via Frontend
 Transport; Tue, 18 Jun 2024 05:57:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Tue, 18 Jun 2024 05:57:50 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Jun
 2024 00:57:50 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Jun
 2024 00:57:49 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 18 Jun 2024 00:57:48 -0500
To: <buildroot@buildroot.org>
Date: Tue, 18 Jun 2024 06:57:39 +0100
Message-ID: <20240618055739.2777769-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618055739.2777769-1-neal.frager@amd.com>
References: <20240618055739.2777769-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|SJ0PR12MB5611:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fe545fa-ded8-4ab9-8c27-08dc8f5b969c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|376011|1800799021|82310400023|36860700010|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XsqK4vymzdAqw4TB+AzaHlO/K5vRVeHIK5GlH6fDXjMyScy4gdaL0PDTKhOC?=
 =?us-ascii?Q?uLy4zQ65jaRqmZ7W7gTi6RavPydl9bPUt0h3pQQFF9RLd95kTtQs9LEK81fM?=
 =?us-ascii?Q?FiDO7xfNGkRGrvbcIJ+wmo3F5lqMk8Cxth+WjUNwMTkhLA32io9JWHMWD6gs?=
 =?us-ascii?Q?0HpVlX5U7aC9KV1FcmiDWpKKkSY1z8mWVND5DP9/ZK0DqOTF9OZcNfOPJWq9?=
 =?us-ascii?Q?Xw0OcAUtZDPeWnEAfhCNOo/+VegrugoOeGj/jiF5prD5rsO2HETVFpykNLvo?=
 =?us-ascii?Q?SnlKLRbs+xauBcnFJsB+VnYNzUyBwssLdGIc9NpixTxKuEAe96ufxJ0GWgiR?=
 =?us-ascii?Q?Nz4AOYxs3mZbsAM2AgJa1QFk/hnjbXBE0k4Eu8bqN6eeuJcBD5XTdj7Aneb5?=
 =?us-ascii?Q?aJMHRuqvdcl5KP8GXORnUCqxuGKG7jLnTx9gMVWxuIDTi5wA3vE/MJs8zhKV?=
 =?us-ascii?Q?UYb8zUiZ/3CbAq+KtS8yF0K2jgB79iymYozgW8Ia/Nr3QOv1kb4SomODTuqR?=
 =?us-ascii?Q?Y+tgmatKcr6OTjqnMXyNNxaUp2UOpDZ2WxRDTzhjAgDcyrb/9OwYCIOob7fV?=
 =?us-ascii?Q?ZqPp8gXip4dAgFC1aAlHM3Ne1mRXWv+LkJZzdM2Z73IGiE0xJb8pBQBDPstj?=
 =?us-ascii?Q?uGRSeoJhzCKJ+K+Hfvk21mSPtTdnCI2/XQbjShrCFx6Qfzx+ZlmSuTegr8ea?=
 =?us-ascii?Q?3p5Pj8YjbdbrOmje6+2fHJtcXR/FWabFloQH5V8RE6Ddh43GVgQAmCKYv+ao?=
 =?us-ascii?Q?5UnC8kEPxNsJdt+SYcHJaZDXSymCwegtf4wocUPwS/WGTFdgVNmFa0B+rxk1?=
 =?us-ascii?Q?wnKYyAHPGwIS5Ev6F7IQWUo3be63VlXEas8DPbRHr7TefUOECgDNabFIbMYW?=
 =?us-ascii?Q?rq+QdHvUDrsm8KLULXitB6QKExac8g/wc+2D6DoCFQVsa7NIykU8DoxlHrK3?=
 =?us-ascii?Q?gStCBf83F3N2Tss+rG7VrNulbs/iQM+XjUPFlG/6qfrJVoEY6tqEh0i2R0zI?=
 =?us-ascii?Q?I5SkBf0Ei1nctYrYznqzALGMU9onFUVjPWkGhh70LvFY+eovPLkaausqMny3?=
 =?us-ascii?Q?5EtxkC1vM42+TO1maW2ixCW5yF+m3gyUlBIO5KHpjwvXrd9fXt5Gk58fljty?=
 =?us-ascii?Q?9G4xbKISpEbQY2w7OJFO4nWhrEIBqelkIoRN88t28qr5mke6oRASaGM5j/1F?=
 =?us-ascii?Q?tI341cNLboDiKroG2KRl5snwOJo9j0DMMzn4myukhBhOg5aLedZfgwWnUk/R?=
 =?us-ascii?Q?Sq2ofrL38Ddj1JdDzimPbR1d4PHEc0P0WQIldXMsO+IgM0kTWgZo5Zpi/NFB?=
 =?us-ascii?Q?mtIyV5X7vBzbjBmoxNk+HVYWDK8lhwwgiAMZLYWb6lTP3yW3yWLFdiOGAOTV?=
 =?us-ascii?Q?C0c767mx+vC/8kT0vtC1UWc/TwkpakJHm2MUlJ5evqjqK52PhLAwXTIgXibh?=
 =?us-ascii?Q?vaEKMj2rxb8UfMr3PJin30FLYFMinWn1?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(82310400023)(36860700010)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 05:57:50.9686 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe545fa-ded8-4ab9-8c27-08dc8f5b969c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5611
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nObobgDxxVHGWDxekjL7WLF57ecNmtdfuUkdrWsaJdA=;
 b=fsVxZuY16WfQi25529eW5hQDwPUuqBNO7r8vQJ1rXh1AvnDfEM6n8Gh94jwPZC5Gg3tbjlaIniyK37DrHO7b526OpiPTE6SmPoFFDUNpceK8QgyqXFjDO92nDELo/zExt0KlBG1HRr1FMGxn4IszdrTDrne8FVH+hh+O1oS5FSo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=fsVxZuY1
Subject: [Buildroot] [PATCH v1 4/4] configs/zynqmp|versal: migrate to
 xilinx-source
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate one defconfig from kria, zynqmp and versal to xilinx-source.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
Comment: This can be used just for testing the xilinx-source patch set or we
can commit this patch.  My preference would be to move all zynqmp, kria and
versal defconfigs to xilinx-source, but I know this comes at a significant
build time penalty, so I am ok with leaving the example defconfigs on
xilinx-prebuilt.  Up to the buildroot maintainers to decide.
---
 configs/versal_vck190_defconfig     |  5 +++++
 configs/zynqmp_kria_kv260_defconfig | 11 ++++++-----
 configs/zynqmp_zcu106_defconfig     | 10 ++++++----
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 21dfe2577a..3a1a8be688 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -35,9 +35,14 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_XILINX_PREBUILT=y
 BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
+BR2_TARGET_XILINX_SOURCE=y
+BR2_TARGET_XILINX_SOURCE_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_SOURCE_VERSAL=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_BOOTGEN=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index a16da66e38..82ebf2e247 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -31,16 +31,17 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
-BR2_TARGET_XILINX_PREBUILT_BOARD="kv260"
-BR2_TARGET_XILINX_PREBUILT_KRIA=y
+BR2_TARGET_XILINX_SOURCE=y
+BR2_TARGET_XILINX_SOURCE_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_SOURCE_KRIA=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index c10ec70ed8..89269dfb5b 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -30,15 +30,17 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
-BR2_TARGET_XILINX_PREBUILT_BOARD="zcu106"
+BR2_TARGET_XILINX_SOURCE=y
+BR2_TARGET_XILINX_SOURCE_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_SOURCE_ZYNQMP=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
