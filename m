Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2724AC5AD49
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 13:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C868806D3;
	Mon,  2 Jun 2025 13:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ihOF6I6kuisz; Mon,  2 Jun 2025 13:51:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68E49806B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68E49806B3;
	Mon,  2 Jun 2025 13:51:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D4AA7222
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 13:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C634A40573
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 13:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pGOMC51NASyu for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 13:51:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2409::601;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51CED40574
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51CED40574
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::601])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51CED40574
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 13:51:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/HMfQ0rjz9b7kn5w3W5jhkuEwMu2e6zd/FfmsTlIY7Mb9t1Z7Z1oBA+NQJAnXvASfReahTNmyzbnv2nqJGWKrqjpjZjw23/AS9ODicv3HeWOWPVMLipk51XnFqi6qhp1vdxG+GSRwdoAjt3L5UZEldaWk1QsrW9n5L5XBJmIV4Rk3DfmNZtsV7sFm9c9XwmGJh10JaZSr3mtulsZQgJkcOpITSl76qYs2KAfhWXRYoJoMsCB05HAGwbS+QsEJe/1qgXYrba9VlmSYkasBFi5oFjLNsYKnPASV/NWfoTzTAF/f2CpZ/bLthaLhKoEc9BFX3Z5qf3EU2sCSiVtcZFXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmKq2HD6vRRBbxX2eZjL+NVkStPtrbpt9cI4yUqJ3cM=;
 b=U35Hwp943yk9rZ235rkBgG4hxTPMK0IIWQ2I43qavdMohiyVYWl30rMRmyf8cAtRaSS3dbtFJJCeG/6KGJ0RlWArEjV6CraAK00dvMSv8FYMLeTj8yVsMc27M44Cw3vDZZySVnIjp+si72pBPDn3l7f/YZbrVCphz71WhoEXSQuauUc8awe0rCnhMHGEmQzjnRKKDnXoIiqfLnTmP0j5wD7DKpWhGpZ4W08TFKaD2QBpwrcUIT68jijP7wMyDrltBaIQztukc+6yQEoIXX16gUGiA49izkzCkNx6F1NIWSj97DmMBz9nHTBuTPSZymMBmuGBxAjUA54Hc8AK24V7lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:a03:33a::19)
 by BY5PR12MB4196.namprd12.prod.outlook.com (2603:10b6:a03:205::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 13:51:01 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::28) by SJ0PR03CA0014.outlook.office365.com
 (2603:10b6:a03:33a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Mon,
 2 Jun 2025 13:51:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Mon, 2 Jun 2025 13:51:00 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 08:51:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 08:50:59 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 2 Jun 2025 08:50:58 -0500
To: <buildroot@buildroot.org>
Date: Mon, 2 Jun 2025 14:50:52 +0100
Message-ID: <20250602135056.404165-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|BY5PR12MB4196:EE_
X-MS-Office365-Filtering-Correlation-Id: c5ee54f7-511e-47c0-63a5-08dda1dc8287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NH/GS8gRQei7MaE1z8XvtNnhiZs5C1zZyoICzB9/Hpyqep0Yo9D7cPW+9ABs?=
 =?us-ascii?Q?lnMZ/JTzOmy5Cw1xu0FuXO2LUj04O4F8HlCOYHj24eq/RCf9ehKHyOXnbsQd?=
 =?us-ascii?Q?6jjmK8DqESnq2nTJyZ3aP74sYb/Aq1SvuEqXpcKM8dBXrP/4dqHYeFzQXBrE?=
 =?us-ascii?Q?A9VntjiWVk8znRmXLxT0X4vP8Nf4Qm77EQfe8s4SkY0lTvZYS9L0JbdZs8Pg?=
 =?us-ascii?Q?kffOL/lLO6O8JfNClh31TWkmbwf8QRLGkzTSYum1wWRkFpySy0KBQ0Ek5B0F?=
 =?us-ascii?Q?XBrqiMcIhcFS/swSlcZX5TA8bZlrCgd+r5HsYdAZZN2YoJBGY6zMkZeu2haf?=
 =?us-ascii?Q?PVkthWRm6nPpb5wa2i0FYQgRgKufmx6uDSA0VbCchu4WHlnTL0/VonBtSsdj?=
 =?us-ascii?Q?3AoX1WIgMkfxSsw8uxJjZSpwtnHd3jyhM/yv7Kpd4NiC8z5sAPEOnsggWd5l?=
 =?us-ascii?Q?8W17QNITgx5J4WjsX9lvXF1ZOaR1rhdO//SqeIh2MyZAQGxKLWZA27GwVHVx?=
 =?us-ascii?Q?lsAUYpdy7+nX3UGC6uNx/r2FNeuHC+AVrQpbxSlxDt7ygF5iNqLqwL5MZxvw?=
 =?us-ascii?Q?Iv4uneT4jpGO3txkVO+IIU3cBkaMnswmFCLSc94caoZJ1/lAcd4NKbnsql7x?=
 =?us-ascii?Q?FWrRuM8CqYebWOLzdN34V5ojTeRXVp3SWrHtMibN5w+/Zl6uIu8aSXnK8Gou?=
 =?us-ascii?Q?9BuZAh8YC85ymW1xpVR2rF//qFZmkj0Af70WMY7fnY+xuc109KIiNO3QGfA/?=
 =?us-ascii?Q?VtnCV+Jr2VTaMuGGpmIQJbjvhxcM2N7OHSOnhtgRLVYY4YcaOyUkvJj405Qv?=
 =?us-ascii?Q?w3NtvrTGhRi3FPsv7+GhLrg4bzg0B8mbBV4bTiO9z4bzzna+HOVmxXG91+l/?=
 =?us-ascii?Q?Nczuh9o3ZBTmmAK7Rvrr8fUUIahcs6uwf6wF2KKRVDg48b6Mx/rf9imgU6+e?=
 =?us-ascii?Q?RcCwjCY3Iup43Ucgu6Dhu1ESVEcA8L+BqVotC83XHXryvHNcIsecIfVsPbWP?=
 =?us-ascii?Q?IzR6QWzK5mQpEArmCY816qUVT9nUNrsGIzJdDvD1Urwxk7nKJckmFqqWp5Zi?=
 =?us-ascii?Q?sSh9YwgQY7kDG9b1KbRz+OxFRHvHvGNMvy3tGjx0YAXD2ZTKvKsouGCjXaeg?=
 =?us-ascii?Q?v85cRTudtFrlzO4wSW/k8OILJ2kGE6vQILKHG+m2k9Pij+i+S0boUc0zkK6f?=
 =?us-ascii?Q?EnDd9MeriwcnpqtkdyMYTBJLVAFpVpuRnchn5oyMazxjvO/LfhjOwFeo0W9J?=
 =?us-ascii?Q?ZoRVfHM0eJB/A2fqL/r5F9ReV1wttxEe3MPtdkpBor89M38JJzDXbwz9Ff/S?=
 =?us-ascii?Q?fjZrZZBHFOy9jJQMWskxh2StU0QfYQ6SLcrAk6BEB2CQgQYvG92UHn3UQ7EM?=
 =?us-ascii?Q?iRDgNcT2JLuapXFV72qgObBE877kAESgYG3S8r9DQqXoPySIqi0TQjClNKsI?=
 =?us-ascii?Q?KDg5CvK3MRQohokhQG7b7h931eIMAeSGe8Nj8LpKWl4g33l0+ueHLqjtyK0o?=
 =?us-ascii?Q?tXSCe9YtT8RiqVtboY8gWh6CtAILoWXFK0/oSJw8+F9ScQuZV1XFGHWMhyAw?=
 =?us-ascii?Q?Mvkazh93BpAnBo+tN4Q=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 13:51:00.9796 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ee54f7-511e-47c0-63a5-08dda1dc8287
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4196
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmKq2HD6vRRBbxX2eZjL+NVkStPtrbpt9cI4yUqJ3cM=;
 b=IcmvPBlVo+xtDKzZ0fbP3Qda3mkEK3PbIOglHxABeN95xo4eTfQk8s+HU+9b8M78TcuxBi9dibqNKUMpEjghFNOudc011j3//R0nvEv0WZS6kHOv/+4Rjia7+CIIxu3CZMP+JxUW32pWdbYM4hEEiHno9I/bEn4wuvI84/TwkFM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=IcmvPBlV
Subject: [Buildroot] [PATCH v1 1/5] board/xilinx: add xilinx_v2025.1 support
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

Add hashes for xilinx_v2025.1 release.

xilinx_v2025.1 release includes:
 - atf 2.12
 - linux 6.12.10
 - uboot 2025.01

In addition, the xilinx_v2025.1 linux kernel release tag has a Kconfig leak
of the CONFIG_XILINX_AIE option.  This patch adds a patch that is specific to
the Xilinx Linux 6.12.10 release which fixes the problem by moving the changes
implemented by the CONFIG_XILINX_AIE option from the exposed uapi header file
to the Linux internal header file.

The patch has been added to the board/xilinx/linux_6.12/patches directory, so
that it will only be applied when a user specifies they wish to build the
xilinx_v2025.1 release or they use a defconfig that has migrated to this
release.

Since the header file that causes the issue is not yet mainline, this patch
has been "upstreamed" to the Xilinx linux-xlnx repo via the AMD internal jira
process.

Upstream: internal AMD jira process

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...ux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch | 126 ++++++++++++++++++
 .../arm-trusted-firmware.hash                 |   1 +
 board/xilinx/patches/linux/linux.hash         |   1 +
 board/xilinx/patches/uboot/uboot.hash         |   1 +
 4 files changed, 129 insertions(+)
 create mode 100644 board/xilinx/linux_6.12/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch

diff --git a/board/xilinx/linux_6.12/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch b/board/xilinx/linux_6.12/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch
new file mode 100644
index 0000000000..59974410bc
--- /dev/null
+++ b/board/xilinx/linux_6.12/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch
@@ -0,0 +1,126 @@
+From 333678d7b9edc29e8148411d48f70950b1b614c1 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Mon, 2 Jun 2025 11:07:03 +0100
+Subject: [PATCH 1/1] include/uapi/linux/xlnx-ai-engine.h: fix
+ CONFIG_XILINX_AIE leak
+
+Linux Kconfig options should not be exposed to user space.  This patch fixes
+a Linux kernel leak of the CONFIG_XILINX_AIE option by moving the changes
+implemented by the CONFIG_XILINX_AIE from the uapi header file to the local
+Linux kernel header file.
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ include/linux/xlnx-ai-engine.h      | 37 +++++++++++++++++++++++++
+ include/uapi/linux/xlnx-ai-engine.h | 42 -----------------------------
+ 2 files changed, 37 insertions(+), 42 deletions(-)
+
+diff --git a/include/linux/xlnx-ai-engine.h b/include/linux/xlnx-ai-engine.h
+index 44a1e40ef9b8..10905dc84ae9 100644
+--- a/include/linux/xlnx-ai-engine.h
++++ b/include/linux/xlnx-ai-engine.h
+@@ -171,6 +171,13 @@ static inline u32 aie_get_error_category(struct aie_error *err)
+ 	return err->category;
+ }
+ 
++int aie_partition_write_privileged_mem(struct device *dev, size_t offset, size_t len, void *data);
++int aie_partition_read_privileged_mem(struct device *dev, size_t offset, size_t len, void *data);
++bool aie_partition_check_noc_aximm(struct device *dev, struct aie_location *loc);
++int aie_partition_check_uc_aximm(struct device *dev, struct aie_location *loc);
++int aie_partition_uc_zeroize_mem(struct device *dev, struct aie_location *loc, u32 regval);
++int aie_load_cert(struct device *dev, unsigned char *elf_addr);
++
+ #else
+ static inline bool aie_partition_is_available(struct aie_partition_req *req)
+ {
+@@ -271,5 +278,35 @@ static inline int aie_part_rscmgr_set_static_range(struct device *dev,
+ 	return -EINVAL;
+ }
+ 
++int aie_partition_write_privileged_mem(struct device *dev, size_t offset, size_t len, void *data)
++{
++	return -EINVAL;
++}
++
++int aie_partition_read_privileged_mem(struct device *dev, size_t offset, size_t len, void *data)
++{
++	return -EINVAL;
++}
++
++bool aie_partition_check_noc_aximm(struct device *dev, struct aie_location *loc)
++{
++	return false;
++}
++
++int aie_partition_check_uc_aximm(struct device *dev, struct aie_location *loc)
++{
++	return 0;
++}
++
++int aie_partition_uc_zeroize_mem(struct device *dev, struct aie_location *loc, u32 regval)
++{
++	return -EINVAL;
++}
++
++int aie_load_cert(struct device *dev, unsigned char *elf_addr)
++{
++	return -EINVAL;
++}
++
+ #endif /* CONFIG_XILINX_AIE */
+ #endif
+diff --git a/include/uapi/linux/xlnx-ai-engine.h b/include/uapi/linux/xlnx-ai-engine.h
+index 424c5f4c4097..1680aed8ad85 100644
+--- a/include/uapi/linux/xlnx-ai-engine.h
++++ b/include/uapi/linux/xlnx-ai-engine.h
+@@ -781,47 +781,5 @@ struct aie_rsc_user_stat_array {
+  */
+ #define AIE_UPDATE_SHIMDMA_DMABUF_BD_ADDR_IOCTL	_IOW(AIE_IOCTL_BASE, 0x1e, \
+ 						struct aie_dmabuf_bd_args)
+-#if IS_ENABLED(CONFIG_XILINX_AIE)
+-
+-int aie_partition_write_privileged_mem(struct device *dev, size_t offset, size_t len, void *data);
+-int aie_partition_read_privileged_mem(struct device *dev, size_t offset, size_t len, void *data);
+-bool aie_partition_check_noc_aximm(struct device *dev, struct aie_location *loc);
+-int aie_partition_check_uc_aximm(struct device *dev, struct aie_location *loc);
+-int aie_partition_uc_zeroize_mem(struct device *dev, struct aie_location *loc, u32 regval);
+-int aie_load_cert(struct device *dev, unsigned char *elf_addr);
+-
+-#else /* IS_ENABLED(CONFIG_XILINX_AIE) */
+-
+-int aie_partition_write_privileged_mem(struct device *dev, size_t offset, size_t len, void *data)
+-{
+-	return -EINVAL;
+-}
+-
+-int aie_partition_read_privileged_mem(struct device *dev, size_t offset, size_t len, void *data)
+-{
+-	return -EINVAL;
+-}
+-
+-bool aie_partition_check_noc_aximm(struct device *dev, struct aie_location *loc)
+-{
+-	return false;
+-}
+-
+-int aie_partition_check_uc_aximm(struct device *dev, struct aie_location *loc)
+-{
+-	return 0;
+-}
+-
+-int aie_partition_uc_zeroize_mem(struct device *dev, struct aie_location *loc, u32 regval)
+-{
+-	return -EINVAL;
+-}
+-
+-int aie_load_cert(struct device *dev, unsigned char *elf_addr)
+-{
+-	return -EINVAL;
+-}
+-
+-#endif /* IS_ENABLED(CONFIG_XILINX_AIE) */
+ 
+ #endif
+-- 
+2.25.1
+
diff --git a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 15cceebb80..2ef3825bb9 100644
--- a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  a45390c9e1d584a389abd37ee49dce3f8d3b41718b1fd7c977608b5387a38955  xlnx_rebase_v2.10_2024.2.tar.gz
+sha256  4d16661f367adb8713113acb420a1ad5f611ce6a309e98005a8ea3273511f03d  xlnx_rebase_v2.12_2025.1.tar.gz
diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index a970a878c2..0022390aa6 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  b726226e8784d92049190f19768d393eccf3ad111c7a2e685bb29cfa1bdf1f70  xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz
+sha256  25795c354f30a3358506ab02deeac99e7f79850804c52d6c3d5539fd310f0491  xlnx_rebase_v6.12_LTS_2025.1.tar.gz
diff --git a/board/xilinx/patches/uboot/uboot.hash b/board/xilinx/patches/uboot/uboot.hash
index de0e6adad1..56ee166378 100644
--- a/board/xilinx/patches/uboot/uboot.hash
+++ b/board/xilinx/patches/uboot/uboot.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  f1a86ccdbe60bac89177a24bbfd56fc6e8e67823669f0997de563c3cc0ea4dd1  xlnx_rebase_v2024.01_2024.2.tar.gz
+sha256  b86d6f07d16a83ed0bdbd9b9439e099afc87ba7dfb77246e2472183848e2ea93  xlnx_rebase_v2025.01_2025.1.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
