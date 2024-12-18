Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6889CE77187
	for <buildroot@archiver.kernel.org>; Wed, 18 Dec 2024 13:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F356B4250F;
	Wed, 18 Dec 2024 13:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AO_lyTTu7Bz3; Wed, 18 Dec 2024 13:18:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73E2642511
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73E2642511;
	Wed, 18 Dec 2024 13:18:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA644CE
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 13:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB173616F1
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 13:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_z6KOvdOD4G for <buildroot@buildroot.org>;
 Wed, 18 Dec 2024 13:18:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::60b;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 50E1F616EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50E1F616EF
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::60b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50E1F616EF
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 13:18:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwSvFsfRRgfNvySeXYyzAH3uiyJAJA7JM50J4ZdlibzL6b++fU8cEmXE0O9ML74Abf8bAYuV0eu0rB66CSfZBNS0W4KJCrx2KboS9FFqJsvIYHJgSBHYwNremjL4EE1dv1Hmz03Chf7MrCsfzZ75kQYSx0glX1bGtdD0BfvZCma3rKJV571lujC8k0fbcLmJpBJQw73MCdMQC/2QFGs+63cwkIlKkPEVrusxQNOf4gYXTCnMAR7WCm5J3Yk9OW74qx7gX1SIzAzkb6+N/t5na+TM+mdl6dj80aHCRFM8pI+6E6LQeYyBJ/CAnwXiUkzubcH3/nTXHYQsrSGiuEMCMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PpjcWiNVtSESdxWvQk7nG0EBSgLvf07vlyPs7x+z0AA=;
 b=bFVgRtsuIzYj37+KPKk3/79QXuVgzl7YhcBVSaq/sLNzYd/voe+bxeHy9QE255QxdSkaaSeOFDVUd/cSn/VHBuomHWhWLxM8E7ss8Wbv7CfjZrQkRbIIsZv2LC9gYkqkzVjydTqyyGsaS8B1XwQtPl1nAwkLicBn9eufN9gw3n034KZmF4f63eNTFU9lp+1aPlqrQ/9ijr0o+Ll3Uh+3lfFz5N1xykSgY69FxhuZVc64iGlyLsW/Vf18Pq0uFeUdifRpwbfEd5is+xyFLMKBl5JStbFk7hQvqGidXZUyUzX0k9+foZ1+oXjZ+iouZFQZ3nRrB+iQSq9YYDgZPXO2+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0134.namprd03.prod.outlook.com (2603:10b6:408:fe::19)
 by LV8PR12MB9449.namprd12.prod.outlook.com (2603:10b6:408:204::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Wed, 18 Dec
 2024 13:18:38 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::22) by BN9PR03CA0134.outlook.office365.com
 (2603:10b6:408:fe::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12 via Frontend Transport; Wed,
 18 Dec 2024 13:18:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.6 via Frontend Transport; Wed, 18 Dec 2024 13:18:36 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 07:18:35 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 07:18:35 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 18 Dec 2024 07:18:34 -0600
To: <buildroot@buildroot.org>
Date: Wed, 18 Dec 2024 13:18:32 +0000
Message-ID: <20241218131832.693150-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|LV8PR12MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: e4b093ca-9d64-4717-d50a-08dd1f667ad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UZtjJrIjc4S4BiZgU5NBab39wBL3x+7+3JcHDu1pY1kKZzwTI7BIFhbqm6lc?=
 =?us-ascii?Q?IwbBU8qHWUtwfPxRZI54y6kZWmFXLExswGx9jAEqNdkt0eJZQa5MqgkrqFgX?=
 =?us-ascii?Q?H5mpUqtaSlu/CDn91q/oRwTRmVRq4xImdLrJrW4+TMxUJJrKtoVdclOgnkIt?=
 =?us-ascii?Q?UjXh6x+/MSxNBY2C57QnSe4jW8/+hVix5VxGiKU1unFbwbO/fHJu7iYF2c7W?=
 =?us-ascii?Q?VN22MT0eLPT7TjH1pLDw5wr9Fhzl9KuPspXQxdnEi2sgCu203g9AkgYaa8YT?=
 =?us-ascii?Q?zh/FDqKQWQ14IoW2q0OsWfwiK7db1J9ehvXeKTemslSDo4xppTpbfV+qJaCp?=
 =?us-ascii?Q?DsAd+boA3DVfTMAxuDEcDNyUCX2cwZb3OMrA1oGuOb6xlrxCpb3vVYliyvGr?=
 =?us-ascii?Q?vUbfQMuuBfBsD3Vc4QgKqz9HzbldfsKZFzFZUb1Mhq6y4Oy13H0fPkj+WmFx?=
 =?us-ascii?Q?wtg8MB3ubrB5wdCvb61rHI0giC3tNEVgRvoyPb8KGB2kBK6PTBPusulyCD0B?=
 =?us-ascii?Q?Er1ZX4BTUuEemi3C54yLUa4u9RCGakNtqCt6EV49kDJpC2lUE6yIHcBd/PoD?=
 =?us-ascii?Q?E2wUNlp9LYUDmHqj49CfWgKLgLoLkpCvE3xNvuE6xi+Z/ypM2NW2aafP5wek?=
 =?us-ascii?Q?LnM5uLxdp6tsVYq3wla08Lw2vRcmBdD+d7Eh4J55dm0QpQOAsV5rEoChZh2j?=
 =?us-ascii?Q?5FEKpXSfJY3wa6QV0Jd/vbM84kSiBIDV7baCJAxilfhfRz5LzebM6RDIvjkd?=
 =?us-ascii?Q?3CE2R5BkKK1RuJm+FJROkDzTYJKEKqdG+dJvPWrh6jqTSyj5AnMl773zzWFD?=
 =?us-ascii?Q?Us33Ff3gcXLVfv6xiLPn8IHzh7yEz3SFvL0gIp5fYcwsWqmpyuC96rfZS1Er?=
 =?us-ascii?Q?MfyAZIRNyGZRLzcEqJ9j1OLzB6xJixdeC+IhOWVav8ZD+BdX06GlXIfPX8DK?=
 =?us-ascii?Q?Pbjt+Ru5qR6vis6EZUvkMLA6f6sWmpe18iG1HaqsUkly9QXkQXtLh+ydQMXD?=
 =?us-ascii?Q?bmRYBQ2dJX/POrM/9eQhUr/C6nHAo89nttJ73dDLkFo4pnHt3/Km/W0DAQrC?=
 =?us-ascii?Q?DL94oyVLMLcdffWKdgNPXl74+Z561reCx98nOW5R+FIg6AVBh6t3k/MockW8?=
 =?us-ascii?Q?32tpyPqTiaEGcr13Pmf383d4Pu+DFKcy6rSjF+CYfCqSu+H0ST1rT9vEeudG?=
 =?us-ascii?Q?MaMrmd3rKDviovGUcj8Su8aG4xRWTBAaqcexflJbhBHiQaI0uxQy9talOqjH?=
 =?us-ascii?Q?nj+Ij/56DBjFclwoLqOLH1+c3uDTLDoZr6n2YlCT/u7ty7GeEnDOpUUcu++v?=
 =?us-ascii?Q?kGGCpiTPD8niJi9zakB4M9MUFLQGt/Wu+k3D8rpyIPVqpDP7bYo/KJtoAPQN?=
 =?us-ascii?Q?DHOCv/ByoZm9qqDTIkxoW80UjMlXlQvSArC96KUutGkQQOgyw8/lfr7J2uhk?=
 =?us-ascii?Q?uay9uscQegRPOOI3qziyk3oGR7yyERnN9wvAs4U8XBLlVsrHw+LCxA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 13:18:36.4074 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b093ca-9d64-4717-d50a-08dd1f667ad9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9449
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpjcWiNVtSESdxWvQk7nG0EBSgLvf07vlyPs7x+z0AA=;
 b=T2kXi3KVh9/obk5zIL/MeeLrdi9p7dFf9wk35F9x/5tlYlSre6JSJPt75ul3RTc3Unr+JCLDya5exKmzTyL97BVhPu/L/zdghsIlKZI7bh8ALpeppG9nD4D5v9r2bNoeisUGhPMZitG3rW8uFFuZVcagSfnF0oz5iuUINKI2MXM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=T2kXi3KV
Subject: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria*: fix u-boot boot
 hang
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If the u-boot DP driver attempts to configure the Kria SOM DP before it is
released from reset, it will cause a boot hang.  Since the KV260 uses the DP
by default, this patch needs to be included with buildroot until it is part
of a u-boot-xlnx release tag.

While only the KV260 is directly affected, there is no issue with applying
this patch to all 3 zynqmp_kria defconfigs.

This patch has also been committed to u-boot upstream.

Upstream: https://github.com/u-boot/u-boot/commit/8b81010a2fe385524b58bea9116f1b6954c3d2bd

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...1-video-zynqmp-add-support-for-reset.patch | 41 +++++++++++++++++++
 configs/zynqmp_kria_kd240_defconfig           |  2 +-
 configs/zynqmp_kria_kr260_defconfig           |  2 +-
 configs/zynqmp_kria_kv260_defconfig           |  2 +-
 4 files changed, 44 insertions(+), 3 deletions(-)
 create mode 100644 board/zynqmp/kria/patches/uboot/0001-video-zynqmp-add-support-for-reset.patch

diff --git a/board/zynqmp/kria/patches/uboot/0001-video-zynqmp-add-support-for-reset.patch b/board/zynqmp/kria/patches/uboot/0001-video-zynqmp-add-support-for-reset.patch
new file mode 100644
index 0000000000..c6733e05a0
--- /dev/null
+++ b/board/zynqmp/kria/patches/uboot/0001-video-zynqmp-add-support-for-reset.patch
@@ -0,0 +1,41 @@
+From: Michal Simek <michal.simek@amd.com>
+Date: Mon, 9 Dec 2024 12:11:50 +0100
+Subject: [PATCH] video: zynqmp: Add support for reset
+
+In Kria SOM configuration DP is under reset and access to DP is causing
+hang that's why call reset at probe to avoid this situation.
+
+Signed-off-by: Michal Simek <michal.simek@amd.com>
+Link: https://lore.kernel.org/r/0504474a91a9839828aecd37f8855fd154cdf2e1.1733742708.git.michal.simek@amd.com
+---
+ drivers/video/zynqmp/zynqmp_dpsub.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/drivers/video/zynqmp/zynqmp_dpsub.c b/drivers/video/zynqmp/zynqmp_dpsub.c
+index 76abfeac4433..52af23c3c835 100644
+--- a/drivers/video/zynqmp/zynqmp_dpsub.c
++++ b/drivers/video/zynqmp/zynqmp_dpsub.c
+@@ -11,6 +11,7 @@
+ #include <dm.h>
+ #include <errno.h>
+ #include <generic-phy.h>
++#include <reset.h>
+ #include <stdlib.h>
+ #include <video.h>
+ #include <wait_bit.h>
+@@ -2093,10 +2094,15 @@ static int zynqmp_dpsub_probe(struct udevice *dev)
+ {
+ 	struct video_priv *uc_priv = dev_get_uclass_priv(dev);
+ 	struct zynqmp_dpsub_priv *priv = dev_get_priv(dev);
++	struct reset_ctl_bulk resets;
+ 	struct clk clk;
+ 	int ret;
+ 	int mode = RGBA8888;
+ 
++	ret = reset_get_bulk(dev, &resets);
++	if (!ret)
++		reset_deassert_bulk(&resets);
++
+ 	ret = clk_get_by_name(dev, "dp_apb_clk", &clk);
+ 	if (ret < 0) {
+ 		dev_err(dev, "failed to get clock\n");
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index d47c3e27e5..8e841df2e8 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kd240/kd240.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 6f2e88b47e..809cdd0dde 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kr260/kr260.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 9aed096e5d..92d44c2b64 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kv260/kv260.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
