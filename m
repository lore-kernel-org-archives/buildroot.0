Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0C5C87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 11:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC9F980FEF;
	Wed, 13 Aug 2025 11:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VaFCn6Qs6vT9; Wed, 13 Aug 2025 11:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7382F80F83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7382F80F83;
	Wed, 13 Aug 2025 11:39:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B0AD81C9
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 11:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96DD140225
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 11:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ggVQ1aM3ylUm for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 11:39:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::608;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B1F43400FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1F43400FF
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::608])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1F43400FF
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 11:39:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cu4RA/fsrsWEE0NbWo84YxsXGj3EBt+gzmKHlGtXM9MoI/l5FQhMff8cX7+pQqtq4Xv3rDreqZJsnxyvUzReH0r+OFBhtt0xLcWBLBK2wVlTMXurJr2gOMd1mLTExXSOJlODyRFkVqQun20KAZJjrh1pNRrW3HbIuEDXoefipuaQ4t5RMO7oodioK4LbAsJiLPPTnDnTtEd7LspFeR8x3XhuoDB+xO7gb6pQAZv2D05q3w4zAjGpLNsVwxzGRyaLxzWE7VasE0PZGyGL2Rk/034Erd5H4p63GIvFCvud7t7eqBQ+jNyAQGU5EMpvOE7bNp5A06QYlhb/3xL9gv2Vtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooLYiX47J+ix4abuwvNgjqyrsLH+43UFKz5XKongHCo=;
 b=E0+g4PTFHkuajGRidnCGBOVDhLKLUNQja/bKHktCVxwi87W7PckIWt5fTwpKPcb3nYC0HWkyIhZLmX+KHnwzKfL3widHFyo7R9k6BRZtEYqwXOC2aVFjdMIWQ3oe2n6uByMgkKzg5k51m64WXovNIKVIhRgQ/166Bhk9vmCcWoYxVIUky9ZkPXmrceAH9VcaY24HrKvSZKdNYazuuCzrHxkKrqX0M+vNbyGXeRdciHUx8LLi++sYgcPwJXxazBKeNy/uInKqoVhvvTXJnRtbhfF+62R5ciDIciitmaA6cLgeXZ2coO6RwO2teVvF6ThH6zp8k7hdwnXd7RVLoLj5RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BL1PR13CA0017.namprd13.prod.outlook.com (2603:10b6:208:256::22)
 by MW4PR12MB7465.namprd12.prod.outlook.com (2603:10b6:303:212::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Wed, 13 Aug
 2025 11:39:47 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::94) by BL1PR13CA0017.outlook.office365.com
 (2603:10b6:208:256::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.15 via Frontend Transport; Wed,
 13 Aug 2025 11:39:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Wed, 13 Aug 2025 11:39:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Aug
 2025 06:39:45 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Aug 2025 06:39:44 -0500
To: <buildroot@buildroot.org>
Date: Wed, 13 Aug 2025 12:39:37 +0100
Message-ID: <20250813113937.2835521-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|MW4PR12MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: ff6bc58e-17b7-408c-5980-08ddda5e1a6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mCVn+Xn8l98ofbuHnXXaMHxq6zM8WHO1u44QhCCTKZukyk1z2//GPssQWjCu?=
 =?us-ascii?Q?nNqm8L9YlStJBzl9JeQvbHMDJFyYBUOiG2MB/0vxl4OrbdE7Y22qxMr0gIPD?=
 =?us-ascii?Q?kdCierhFRKj47ZUfilzmrKkim7HXEf71ERI+Jxyn1BXiE55VimuzQE1MY1Rd?=
 =?us-ascii?Q?4nPVAgmWXea79Un4U7RfKZOXU1f81rIHeodFx+3z7mKES+a2cmpM6jnmhg4j?=
 =?us-ascii?Q?pXg9pOkHWO07XWX/wUu5plr4dQrXGSf5jPkqjGU7+oDm35N7Cnqmnd0kxLte?=
 =?us-ascii?Q?+NHVOCoVQatq0/yF1+WPL1G8aEQ4rchy5TC2IEP3CgN6fV3zCeoZUVEamllf?=
 =?us-ascii?Q?lHSugYEvrLhhIG6oNQ7ghh4taHbGZpuLZYfkGwOzRZC4oWHZdxmUgO8B+QU+?=
 =?us-ascii?Q?sVFHyCV1jnbRmCK6ZM8xaogTbXz4XIXrs8ecUydCpHXtvJqIeE8yL0r2Jojj?=
 =?us-ascii?Q?P70okyHPRvwu0Q8G7N9IzIKhEh7e4A3J5Z9zvQBNc7tcVkem6hJkB4f1v8a9?=
 =?us-ascii?Q?ZCTyTmFMMAfZHPZi2a06lAqujFR7kwZDVaD1iiPTazpfKHoS3OeakdiR1o6b?=
 =?us-ascii?Q?FUbi1L69mrpiAbh1Maxf4/GOcU2XUGASdTbdC3fvEE+uwBijr2sKzRbDmWNp?=
 =?us-ascii?Q?Vq8aWMu5CzmZF6EGtrjV2v0OlVpkNTEYYF482ns9Sbj1xnYA/Sc+hqykdwoD?=
 =?us-ascii?Q?J/2855bBXOyhqwB6BCs/uGz3+RZO32R5uYqW5y//ATTFCmTIt2ZpiRUbqPiP?=
 =?us-ascii?Q?562Kb/9sUvC0gUZGWAXPAXrlmCEGvv/hVGwKe57rt7OWmR74zTDhIkZVp4Zn?=
 =?us-ascii?Q?VUyZvYpTjDFMCdtDoY7XPRNBvIfldr+SYlpljvGo9ym6w7p/1Q5zeO76U/0+?=
 =?us-ascii?Q?qPVnhjzpTpXs+DtXa4tcgKSUcDflrrqVYLB2gKYYbv9IWhyg14j0H5EESjoR?=
 =?us-ascii?Q?ZlEZZu0nPduy/d+jPgFM+rpKb2CHJH5B5WvSG0bHXOGogi+43/StOa6M+O46?=
 =?us-ascii?Q?LJLtwkG55d0rVou2KDOprxm56P/5Gn2YoeOZmd0LnyziVC3oSV3s95o4F6hp?=
 =?us-ascii?Q?gFaQ5NnXVfVu4WzTidXZBd6PbdDU9oOyJl7vXu94CWfF/Gsx9dBi5eEnx5Ht?=
 =?us-ascii?Q?gAUrNwdiviZ8g+QvpkvTAqjDokhCuNlDZLdkc6TOilevOdSjbz8Qh61x5o2s?=
 =?us-ascii?Q?K4Jfn2knZt/GCvvI4BE9drY2SuvT2Aa8qsaDHCTShVPUlkqZ1nuZ/+jZcIkA?=
 =?us-ascii?Q?gLVKK/W06yCOnNeN8TwAyYstvhxp52PTci7QSci1nHjN1574MUJzlHW25wq5?=
 =?us-ascii?Q?XY4oV0bQiB42jt1mksaPonD3LXFv1bBGbwffYUS1oYyNEt7h1iE8Io8NmdZN?=
 =?us-ascii?Q?SVZDyGTv++RHP/+6OvPmZSh04I1SRsq01XgS9FJDim6eGavwcOkN36EYw/QC?=
 =?us-ascii?Q?cuMc90xPiAU2vjcMmPFbEMOnakNBq18BT/kvPH4g4wl0Bk7Na5xD0Pwwe/Nv?=
 =?us-ascii?Q?QBI5HKntDwk9sIQCZvUD/IVSSuTeFSoEfOYjV+q7AImNFIi7GrsmKjgHo+OA?=
 =?us-ascii?Q?Tzd/S5va8P6ZyscWnTE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 11:39:46.1069 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6bc58e-17b7-408c-5980-08ddda5e1a6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7465
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooLYiX47J+ix4abuwvNgjqyrsLH+43UFKz5XKongHCo=;
 b=a2x15qEfbmHW90qadORR+xUeXAGlpncF5L/s6ejyG3Sq/bIcvSBmtJIJGDOz2IUq64CHPtRT9bcvuqsC98kBkpYQjL/1fRYP1UKA3vM4djFM64Dssu267b4LPZoaaYcHZsAgWNmccMwPkPvHQYahZHKHwXD9QvHRzYUleC7pnOk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=a2x15qEf
Subject: [Buildroot] [PATCH v4 1/1] boot/xilinx-embeddedsw: only allow apps
 for device family
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

This patch adds an architecture cpu dependency to each application to make
sure that users can only build applications which are applicable to their
target device family.

The versal_plm and versal_psmfw applications are specific to versal devices
which are based on BR2_cortex_a72.

The zynqmp_pmufw application is specific to zynqmp devices which are based on
BR2_cortex_a53.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- Replaced new family variant config option with an architecture cpu
  dependency, so no new configs are needed.
- Updated patch title and commit message accordingly.
V2->V3:
- Changed package dependency to only appear if the cpu is BR2_cortex_a53
  or BR2_cortex_a72. This way, the xilinx-embeddedsw package will not
  appear with zero application options if another BR2_aarch64 cpu is
  selected.
V3->V4:
- Added BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS, so that all arch
  dependencies are in one place
---
 boot/xilinx-embeddedsw/Config.in | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 0dd6433608..fd2b0415c2 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -1,12 +1,20 @@
+config BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS
+	bool
+	default y
+        # All Xilinx SoCs using this package are aarch64 only
+        depends on BR2_aarch64
+        # only CPUs with corresponding firmwares:
+        depends on BR2_cortex_a53 || BR2_cortex_a72
+
 comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
-	depends on BR2_aarch64
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
+	depends on BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS
 
 menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
 	bool "xilinx-embeddedsw"
-	depends on BR2_aarch64
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
+	depends on BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS
 	help
 	  Build boot firmware applications from source for Xilinx
 	  boards. Users can mix and match applications to be built
@@ -30,6 +38,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 	bool "versal plm"
+	depends on BR2_cortex_a72
 	help
 	  Build versal plm application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
@@ -40,6 +49,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 	bool "versal psmfw"
+	depends on BR2_cortex_a72
 	help
 	  Build versal psmfw application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
@@ -50,6 +60,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
 	bool "zynqmp pmufw"
+	depends on BR2_cortex_a53
 	help
 	  Build zynqmp pmufw application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
