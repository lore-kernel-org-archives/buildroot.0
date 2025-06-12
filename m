Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97076C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 11:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 375874080E;
	Thu, 12 Jun 2025 11:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mYC42h4ocKb4; Thu, 12 Jun 2025 11:34:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19A4040807
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19A4040807;
	Thu, 12 Jun 2025 11:34:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 55518183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 11:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AF6460D70
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 11:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EBvoJqrIUBRY for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 11:34:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::624;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A7BF660C07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7BF660C07
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::624])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7BF660C07
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 11:34:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3eMKdTlkDwbVWrN70Rfkmh4mERdipENSkn1fIItySxCl1WCHhp7QVQKEL/UmO3fz+XQcsyb4xbBVLtQDYmE4llsBZnV/jCF4ql5ezTMKXOCr87TQYXvnlEc3zYCXiJGNZOiDL4UymswGl/2MihuOO400T8Z/LFxg05r6uSp6J8EBhtsBBJLIyI0KLov4YtgeG6cymqATSqvobKPqF73sUauZTjaCEe9gbKa5XcQgM8XuTq/hQKG3QUie2IGPk2MU8UXFmCutbqZzGzh0P5Wu9e9XYW/GK7p95ICks0P4m+tMjmAsErIW7CLPXnnipe825WNCAw5F9Ueqoi6AocdMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tp9L64wnxEajQGospwGS3aZGp8gNp8mdpTHKgm6o6J0=;
 b=Qm710zBqBeOGUZDwKEegEnZPAj+1F6G1EzVbo7QWmGQ2c/3cOLI2+2DSpxmVYUr5l8Uv6z+CuDuxw6hVeglQiUof3wh3M/IUALpDwi0xJkt1ISYllfMh0nBuSMUF8PjQJKdkNXDD42MDhrWvQ+Wjbx5virab0ZNd0URQEDFiq22zPqF9XcxgfR8TsYHswClR2teAXGU0l86XxFhOglYQz8EM2n+QVzt7+pvmj3qeH3ThE7szh8xTEVzMXwJx0jq3mAZSFzgK1kKnYg+1Y/mC0Jx7DHbtDLTjrBI4pqrEmiH2QstZJwK3kzoXIzUUjmG7sbfOfiw5OTeZqZXKirSWLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BLAPR03CA0064.namprd03.prod.outlook.com (2603:10b6:208:329::9)
 by CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.36; Thu, 12 Jun
 2025 11:34:09 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:208:329:cafe::d3) by BLAPR03CA0064.outlook.office365.com
 (2603:10b6:208:329::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Thu,
 12 Jun 2025 11:34:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 11:34:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 06:34:07 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 12 Jun 2025 06:34:06 -0500
To: <buildroot@buildroot.org>
Date: Thu, 12 Jun 2025 12:34:04 +0100
Message-ID: <20250612113404.1565705-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|CY5PR12MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: 3450ff22-c4fb-4029-9325-08dda9a50b77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SGcqs0X9LfuqmMnH/t1fTzvWv7F5O68x+q2Iqf05pklcZDNlhMhHbXLwK7y2?=
 =?us-ascii?Q?+nywxgh8TE3bJKaWclR0Js0P+YWX0qCMAsoKwvQhI+dY6fZJgZQF6kx0f8/X?=
 =?us-ascii?Q?aVm5a5T8lNwyMitpWE9T7WpRVq0u1E5zj4I0N6X4nGyfGlIX9bcJTA5UBJPf?=
 =?us-ascii?Q?pgj53Bf3FCVhV29nUmuY5wvqDrIc9toOxuvPTD+mnIgIfqlCgQ4qietqQole?=
 =?us-ascii?Q?t+lkb1Q8pjTvJCqTqUOtxlGT1xAW5/7fsCbNO6QgkHH1nWV9c19PJ8AizVmX?=
 =?us-ascii?Q?38c/Gk+zUQ9zhwcOqcVrI4iR+w5hSNWPJRu+HGU6dpFhIBs0SChfk8aqJZQb?=
 =?us-ascii?Q?HALVKd+AzAzQEARo/8/1pB0jtwSM83XhETc3s6N6lfn8YcGX0FONnZ/Aj60G?=
 =?us-ascii?Q?usj9wsiqqPh+yKPg5Fjctu2Sd/XeMeiMwFD/Q1dlTeC//rK6Eg7RVms3CkRC?=
 =?us-ascii?Q?aa8AovKjkS5+zjc07J0xO4CVtflhVSTdP6mhVX9DFbuZJowdzkAZ0P8Xd5XE?=
 =?us-ascii?Q?nN7anLjUHIm4Lo28rFGpb3wWUodjt/+6cYJ9P6LQ/2mM7wbm5x33twEJGKk7?=
 =?us-ascii?Q?6Fz8zZKK0i3xDoJ/onmHbbOL2+d4cu/7hPxmRRvINKhazWCcb9zsQqF72Vdn?=
 =?us-ascii?Q?R2tHiKi8w8IOMlD5GKF/2BnJsJI0IKCDXABFuv7OBdd+oIvXmeE5mZn3ao2G?=
 =?us-ascii?Q?fw7QkWsgRbd51K4c8JU+ImOeLa9ocmHFO3w/pdtmBn4AjlpDkkhOijzfKwWo?=
 =?us-ascii?Q?jS4tj3cPTkfZ5lhotbrvHGoek6CkSmE6bzx8oLLby99Kfj7RcFuu8GHXnuNV?=
 =?us-ascii?Q?ZjLh26x3Adci1BFb3WSrFCn8g5IAVoUUNSiRH9BTAGmAEWEyBNfRfwuIPG/P?=
 =?us-ascii?Q?W5BT3QxtH/tsIfXdjOafIR6hh1rJ8KMJCUuoXmcVItLfvWv823ioX4L22ZJH?=
 =?us-ascii?Q?lwb2AysSqYQ7qX1mIZp4vtyeO3nedXQPCPtKSTtrWERHyiPQbHUVBRQasL6c?=
 =?us-ascii?Q?zTG1zsg3Z8Z0Dnm+GlEy+tHofDCX1nnb+OOn5xRdP8ypYt3840fD0qCWiVit?=
 =?us-ascii?Q?+qeN3lfTBc+iEPzYqP9s9wtR5CuHy5mewOYrcOoEdHD9ioXTV6q1DahOALke?=
 =?us-ascii?Q?SFWMhoGp53tXRXwD99C1JCqejBIoSaTYuRGs56zvXKHQazOTYOP0qFtajakS?=
 =?us-ascii?Q?mdmJJAjA2Hk02j/0fl6NQ8nu+NMvVAnLVm2zswb2ua+reqJf6VBqRlVZrLPC?=
 =?us-ascii?Q?txOJVeEdUA3oQ+tAlgfDBiKmYlUeLGx7EWoo+rDgK9Hqd6It2zcKkxiaiIdK?=
 =?us-ascii?Q?4qxATmDM+M+3qtubtnSG9XhD8MIQRKKqtluazXXfijjiJXNfXBRXijBWgidx?=
 =?us-ascii?Q?KHxpG3RbWZD+CHcn5fVrJxksKnrxVy2D6RdDuq1lASZcIMtSKZCShfS9OYXZ?=
 =?us-ascii?Q?QykCMSqArwMdmBjszfyUb4CjV7Asf87qSguZQyOTuw7/vppwDRH9dC7X41zl?=
 =?us-ascii?Q?ztw1+wyAycc440vtKyaRx/m484JWRgz2HtD/q/NXQ7MPZ7d/y10tVrNUQOHM?=
 =?us-ascii?Q?SAfa8FIXdQC6R59TJqs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 11:34:08.3122 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3450ff22-c4fb-4029-9325-08dda9a50b77
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6405
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tp9L64wnxEajQGospwGS3aZGp8gNp8mdpTHKgm6o6J0=;
 b=CEDiw12RUryB4zTJicynHJ0X7Y46FLL/iXlaFhblWYmmW+xfcls0Mlp8IJnogjri0bx59EZ08s/CxkpTB1Somr8BLzd8JgTlK2GpXkFYOOgJ006L2/vlRkb2THrw8WVyau7VHJPofIXgPGv18QvRKQgF7lP5MaF8FljaBdLXJ6w=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=CEDiw12R
Subject: [Buildroot] [PATCH v1 1/1] board/xilinx/linux_6.12: rename dir to
 linux_6.12.10
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
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following patch is specific to the Xilinx Linux 6.12.10 release, and will
not apply to all Linux 6.12 releases.  Starting with the next release based on
Linux 6.12.30, this patch will already be included.

For this reason, it is better to change the directory name to linux_6.12.10,
so that it is clear that it is only to be used with the Xilinx 2025.1 release
based on Linux 6.12.10 and not future Linux 6.12 releases.

So this patch moves:
board/xilinx/linux_6.12/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch
to:
board/xilinx/linux_6.12.10/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...1-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch | 0
 configs/versal_vck190_defconfig                                 | 2 +-
 configs/versal_vek280_defconfig                                 | 2 +-
 configs/versal_vpk180_defconfig                                 | 2 +-
 configs/zynq_microzed_defconfig                                 | 2 +-
 configs/zynq_zc702_defconfig                                    | 2 +-
 configs/zynq_zc706_defconfig                                    | 2 +-
 configs/zynq_zed_defconfig                                      | 2 +-
 configs/zynqmp_kria_kd240_defconfig                             | 2 +-
 configs/zynqmp_kria_kr260_defconfig                             | 2 +-
 configs/zynqmp_kria_kv260_defconfig                             | 2 +-
 configs/zynqmp_zcu102_defconfig                                 | 2 +-
 configs/zynqmp_zcu104_defconfig                                 | 2 +-
 configs/zynqmp_zcu106_defconfig                                 | 2 +-
 14 files changed, 13 insertions(+), 13 deletions(-)
 rename board/xilinx/{linux_6.12 => linux_6.12.10}/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch (100%)

diff --git a/board/xilinx/linux_6.12/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch b/board/xilinx/linux_6.12.10/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch
similarity index 100%
rename from board/xilinx/linux_6.12/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch
rename to board/xilinx/linux_6.12.10/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 9b5fbc254f..c9d99876d5 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -5,7 +5,7 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12.10/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index ffa0dd86e6..4aa25f8d67 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -5,7 +5,7 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches board/xilinx/linux_6.12/patches"
+BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches board/xilinx/linux_6.12.10/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index e0966cc986..500298c2f4 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -5,7 +5,7 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12.10/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index fb324b5a3c..87a06fa255 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -5,7 +5,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12.10/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index f908a39a7f..afc13db1d4 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -5,7 +5,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12.10/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 7d7f468805..e0ebedf0de 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -5,7 +5,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12.10/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index 1a5d48e424..a9fe0d352c 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -5,7 +5,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12.10/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 90ccfe9a79..2925e9324e 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -4,7 +4,7 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12.10/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index ae63bf487f..8858c7cb20 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -4,7 +4,7 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12.10/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 805c7f054e..c1d5fa186e 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -4,7 +4,7 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12.10/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 7d4187684f..84d6f353eb 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -4,7 +4,7 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12.10/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index ccadf6183b..182bd68589 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -4,7 +4,7 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12.10/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 8630a40510..ea1abd1e35 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -4,7 +4,7 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12.10/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
