Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBDAC02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 10:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8714841308;
	Tue, 21 Jan 2025 10:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejEeYfW2OhXi; Tue, 21 Jan 2025 10:22:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A608400DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A608400DC;
	Tue, 21 Jan 2025 10:22:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9811ED7
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 10:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 855D0612BF
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 10:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2WA1VzEvR68 for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 10:22:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::62d;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ABF9B611E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABF9B611E0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABF9B611E0
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 10:22:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJOQx4zp61S/svXBpxmhrNXsryyRe2KGklMSAQPoriceaxd1jLtf9JMlW7pHB3EjIwwpR25sOY0LLBBIzbusq0hybtkMbNCAaWHaLNYmzXoHsOHicv9Gz7W+ovbMPOj7/Nt6U1VUB53kaBUkuPIJFhKnE3HyCQYVWubNbmcNnueVMCqj6NRzn8S8LmQxduXTh5Q+RZe0Ph7rCgzVoDUKq/XYBgXRGWuw8W0i64CbbArV4uHXThc89skToIh1ikEATfJqR4O+WM7p+/hmfxKZeihZSluKqs9s9jmocC2ptarNRUfWa1vRy5T1bD6WEsRv0q9jf2sNX0W8bt5bLMh/kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pp27pQzOcfzsjah9R+POdvbiHOnrOq5GY7WY9ooGXvU=;
 b=Jhq5PUGB6YgUtw0LrImR0lOzjcZ3k8tfqgeXc7MbQMTAxuVtL3C5zWKlQVMsrsrf0HaK4dFLXltNUkmbrXy5+cIOcMl0kmsLgnaPreAIeGghwQFyFglnPrVB6Ow1zDvmMLePSHQTgLBasOr91TWdPYpM6f+jUIaECswdSQqB8ay6QSiUNCinzZJ97Hyda1VbWFZ6We6RFuSDqWPemrmxWFwWwf5Wyki3RoWLVCDey07nUmp7Z2afEL+lDkjOa0gsbYWdh67b/K0ueIwSvIpJsk0ZIY0hcIxm24IDEB2R7/V0OKELefXvjzes/PcLLlkAfB3H/9loPvi4JE1CrCjVKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SA0PR12CA0028.namprd12.prod.outlook.com (2603:10b6:806:6f::33)
 by CH2PR12MB4167.namprd12.prod.outlook.com (2603:10b6:610:7a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Tue, 21 Jan
 2025 10:22:33 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:6f:cafe::81) by SA0PR12CA0028.outlook.office365.com
 (2603:10b6:806:6f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Tue,
 21 Jan 2025 10:22:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Tue, 21 Jan 2025 10:22:33 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 Jan
 2025 04:22:33 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 Jan
 2025 04:22:32 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 21 Jan 2025 04:22:31 -0600
From: Neal Frager <neal.frager@amd.com>
To: <buildroot@buildroot.org>
Date: Tue, 21 Jan 2025 10:22:22 +0000
Message-ID: <20250121102222.1335874-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250121102222.1335874-1-neal.frager@amd.com>
References: <20250121102222.1335874-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|CH2PR12MB4167:EE_
X-MS-Office365-Filtering-Correlation-Id: d2d3cdea-3944-499f-6e69-08dd3a0584f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rfdhYl6CarC6Ci79Ac62CbVp7SSlLPooi0PRg8Y/k2VTdHoWvJTniL9DSoZR?=
 =?us-ascii?Q?MPdMJuRJ0ko+yHIbeNWTc9pBG2Cpir3jHN3ZsSBqrP9qXHCvUeC2FR6cRje/?=
 =?us-ascii?Q?v5GbQ/UooXYuiYFL7J65Ckd3HG8cWX4HcNJfDxlIBFLgNhc8X28f2vCbuvr8?=
 =?us-ascii?Q?3T/PP9c2+yKznSofPzJA8W3N16I+yG5bmHtW3cxhLyzLAtF5GHnDK7rOXceq?=
 =?us-ascii?Q?wnadlcQuA/fUufqwnQNV7XTFIk62GYq0GwnURGBooSDs46eAsvl38u1Lc6Zy?=
 =?us-ascii?Q?VKPjyVo9MUALH2TxGREFD1Day5aKUqym/d6UTuHjX/BU2dTSCcqA4atqxDz/?=
 =?us-ascii?Q?Y9Xdc+ljmBQ2vIwtnlJB35Qigk0N6Rcn0RmihBQBV0TVD7y9RVbcTW+/j338?=
 =?us-ascii?Q?7e9WP6BW8Yp0URfWjk0rb7TjrXFJJ8eGU6iMoU2PdyPSckn5z6lbLJ/bLR+T?=
 =?us-ascii?Q?VH/yNwXKoIkbUzxGk/XqrpbdZ0j46/syb1qHfrzeFI4zIKslAHxXLF8FBD1m?=
 =?us-ascii?Q?0Ovb0HKn5u+1qLbaWRwsL2tlzm3ThDq3/w5s5N4fumgikHk+jFq7vxvaE7O/?=
 =?us-ascii?Q?eMk+5X89ruZdj9mo6V965Hq3zczpNy5Gdk2p377d+zwBIFLxuYWNjNGf7TZu?=
 =?us-ascii?Q?KWqC7ZDzMj0kmYf9ECc66YZ9hIY45aRiSwXz96XFLdtZRVhpYFHxjgyJnp+u?=
 =?us-ascii?Q?+pjg6ruPOjV4jIAUtM+8uWwfKWkaL9TOq/T8QPEj7R55b+ML4FL6lDtjNEj2?=
 =?us-ascii?Q?BOoBQNeebsmsBsNy9SreY+V3x6eSJ3z+fvZz5GyYzNC38fkQVka9zeibLNDt?=
 =?us-ascii?Q?iav2FmD+svEDs5nCgwg95/Od+wekpsDm6C24i9zgwawGz9JeeL6UYLjRYgJR?=
 =?us-ascii?Q?ZKdg1LxtdunFSGfY/NajkDWRSzPyEBKGiB7Aq8axP9F4fFUZaQj6vIfxK+lx?=
 =?us-ascii?Q?RUH1NMSjFMCjNyiF7xQ5S+lHbgfFSMRECJmoPD7Kg2B+QwWsFdBJut2dlFj3?=
 =?us-ascii?Q?GRa9/k2e8zXPdXdfB9eucYa3+2k4SWgqfkymzzJK0g4q+/5P/5MCSPAI79O8?=
 =?us-ascii?Q?l2/qWcdOofB+46ErzwXiJPq0zm5rGxLRLnbLOA2wJmA/61En58SjBIGha98U?=
 =?us-ascii?Q?C9qggwYUNxpat5BKJBqI1r/N3NWKU2tInJK9+J75jmX8S+6McKYjS/RRh9s4?=
 =?us-ascii?Q?T/+mQlMewBWABR7U707oz0HSkuWql99JTfK0EplD2el0kO0Wan2wP+Y5wzkK?=
 =?us-ascii?Q?bULBQZwfKaT870aQyhs5zDeonGNrf4GDVklPr+TVO/JMfVMoDdcRImsWGlH6?=
 =?us-ascii?Q?hExgWJHhE9h2rKg6lPdaSAWT35cFejmDdC3Cp5/BBp8WjG4whhJ4/b3848YW?=
 =?us-ascii?Q?rSOZXHOBGDuxeGZfuJlNzlKdYSkgc10u7SHwozRYQhRIbQnDErbKaHtMub72?=
 =?us-ascii?Q?MS6UXwm7O7KFHKuHz1r05F7HUIdvo0VoL0BiIbQceosZnx3SccnpGBgomtKx?=
 =?us-ascii?Q?KRtt7J9VPicLhlPS/5+8feuFmZD/W/1C1fv9?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 10:22:33.5137 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d3cdea-3944-499f-6e69-08dd3a0584f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4167
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pp27pQzOcfzsjah9R+POdvbiHOnrOq5GY7WY9ooGXvU=;
 b=wgkAHnFNxzdQCK1PAdj4+rOtg4OEOiPFGsj+KFM5IPbhEUPv4Z+kl5MHEgqeUjZXhMrXSfC2AHRO/y+QHDEd2M/85rlerY1jXp7Ee1Dq58wx0S9UwJ1dLK4HcA2gfa0avOqoPL0LccazwotytvpAwaaBgweB+5y17SgZz7ZrfAo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wgkAHnFN
Subject: [Buildroot] [PATCH v3 4/4] configs/versal_*: migrate to
 xilinx-embeddedsw
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

Migrate versal defconfigs to xilinx-embeddedsw package for building
versal plm and versal psmfw applications.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V3:
- no changes
---
 configs/versal_vck190_defconfig | 5 +++++
 configs/versal_vek280_defconfig | 5 +++++
 configs/versal_vpk180_defconfig | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index c046d53010..100fa1fa35 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
@@ -34,6 +36,9 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
+BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
 BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 0ca9d30b2d..38bb7c0e75 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
@@ -34,6 +36,9 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vek280-revB"
+BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
 BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 1367760325..e70b3aa0f8 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
@@ -34,6 +36,9 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk180-revA"
+BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
 BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
