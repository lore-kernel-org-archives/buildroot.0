Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8314C5B543
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 05:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5437B6070C;
	Tue, 10 Jun 2025 05:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CDqzIYakFAse; Tue, 10 Jun 2025 05:29:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4568E60783
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4568E60783;
	Tue, 10 Jun 2025 05:29:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FEDDCD
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 05:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 120B960783
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 05:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_FCFigLy4MB for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 05:29:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::613;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA40B6070C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA40B6070C
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::613])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA40B6070C
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 05:29:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pY3ofG+wDNqGw63u1h7lbjviSAB9u+GdVk+yzT+PkH2SEKnCGJ7syw5hVSCjUkodmxhd7og2zitWeL9mgbi72BXnF6+FaGFxi5kzsKOWTJkSP+oclUeBPpFmOeJiv4WAS7xheMl9H2FiypCaHfaOMHHAGeLFUvU34f2QB/cob45Syj6Iqyq5vrqbXSTBRY9aKRIxS4HiTCcjDLKg+S3WZ4nM+lNGaynOofdLMTRA+UyQYqOc6E+qcr4k4rZacEINmUEkDPcYxEEMpoEVDUXBAUZ4aTL3Zxt4hNEUVJwV1vd9KVEUBZb9HBk0ksUieGOfAnccct065hXxHLEmeS3Jiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQ1eefrttUEYx3M26u9IuqpBKiYIQw5HOYFJxZH34zY=;
 b=KrhXEJWgkHgyagykuIkZqkRoNW/0h0i/SqNKj2UbFwXcNKHACWPRjGWiBQUwzaU/zeNRhPoIU+MM6AgxIYO6/WUotOaRvYRrzUJYlwWvNyE56vfBs7W0YeUp0QRod4sOlvfFhrlWTMYXBtbviWHPAen8B1NSzdpaOk6l/CkGeJAaniTTtFS69eK7vLJPjqYvRhrJxORl590jJBOAqFwJoOfQGyNYBh5DPNMTRP1kpZ020NNvJMML8FEQegEmFvCa7KwAZsafPxWYW7rYmjR2nH8d63Q9Ynth7seUD4k0ntDD94Gdk82TeNThKj2vS1z5MxtmvTkgFUDwBvqI3UlajQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BL1PR13CA0021.namprd13.prod.outlook.com (2603:10b6:208:256::26)
 by PH7PR12MB7889.namprd12.prod.outlook.com (2603:10b6:510:27f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.36; Tue, 10 Jun
 2025 05:29:10 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:208:256:cafe::1a) by BL1PR13CA0021.outlook.office365.com
 (2603:10b6:208:256::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Tue,
 10 Jun 2025 05:29:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 05:29:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 00:29:07 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Jun 2025 00:29:06 -0500
To: <buildroot@buildroot.org>
Date: Tue, 10 Jun 2025 06:29:04 +0100
Message-ID: <20250610052904.2449000-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|PH7PR12MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b41c27-58e7-4783-815c-08dda7dfb956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?luZflnUja9SzjXQN1uFAtAljQtxcPUembj8Th2vO3DMitlEzsJm+6ahsVGM2?=
 =?us-ascii?Q?XZWH0/pohsLSy+SJ1TJqn8zgxW1JhdvkL7fiJTGmCxZKeVHxNxV4E/+VwV7D?=
 =?us-ascii?Q?4tMQ6ed+qgjNRLC+EqyE/W1Ms8hr6d+Wgbarogny0tIOZB6WgmrmxCctruVi?=
 =?us-ascii?Q?2762UAKWe6TeN/tP0VmBkHUBxrEYBmu5qLopa9V4r26JDZge43GXuYRJYtUP?=
 =?us-ascii?Q?YBbGYNdr1S8wyx3zWsGqbs2cSFZjInLcT/Hb1SyVoe9jIrAfH+CDQv/uMCdr?=
 =?us-ascii?Q?lnjrd+BLBjXiEcXw53rAMqNnqDppeUHIW3MO+HJrom3THk/k0vfldlJzZbyo?=
 =?us-ascii?Q?hHoTYSqcE5Rc7tEeUQmLjD9V7+iGOBIgCkXZVmmEV7U6loJVrY53eA5wTYqJ?=
 =?us-ascii?Q?zy2OkwcqYcnxMFrmwouHh0XvG7u+tiPYYfWSkXqHIjVE71En+GY32bM95wVd?=
 =?us-ascii?Q?N71KX4cNAPqZCPm5OHQsk1PB+Tz035eQP1PnBmwesze0UTtCSkf2g5eIFv6m?=
 =?us-ascii?Q?zTOw7UDz6ywo3sXxYtHG5DyMQLjqb6hr+jofATdj9omF9XcJDTOMCzIZZojn?=
 =?us-ascii?Q?gVBAQFNGuakHnzo6sXnHKsrd+JzYw9Wy9NqA8yJW6SucYxSfF+GF4wS3uQh8?=
 =?us-ascii?Q?aW6dncyoawXooTJlFJ/pjcTOslJq2ATdZXazVz/Z43PG+luQ3GKljbi4gC+i?=
 =?us-ascii?Q?7zd208bm7Gfd0SP3VZ7Lm2D0+vN7ZWtugmE+kN1RMCxYa8toCwjEev36RkKd?=
 =?us-ascii?Q?uQB2d2nHGBx4GqYlAR2UwfYJ45bN/NJsPRJeW1dU5A1R67KSCoPihq8FGqEY?=
 =?us-ascii?Q?I5GHR+hO1bG4NF5w5UtQNeYox+j+y2evHiZKZDu1Y34IgZ5VpcGkweAatlMC?=
 =?us-ascii?Q?996CBT2voL3ExVJgEeEJ1Sp8LD3hc+O+Rv6ciO6Of33JPrs2GU7zijdcRa2W?=
 =?us-ascii?Q?Vb0QxlQbA96vdhUV9zDKllth52kTs7dDdXSLe9ixHKdQDzUpX25xY8vhq79l?=
 =?us-ascii?Q?zpmDSS2ei1XJug9truQYPLyp+3qjGGjMWK9mmQZUk1yoE7LCFqDc/2tWI0X+?=
 =?us-ascii?Q?wtfSWm2chqVLzKlBXbOQ4hhsObbbiy7rTgv2apWdyXV7SsUbMMw3IxBXraYw?=
 =?us-ascii?Q?ZhRKigp1qdxBxq3PZzkA0q8NLRrD5e9s4p6Zf2wtVWC4sZ3MrlXFS1Ia3irG?=
 =?us-ascii?Q?FsUS/AHUw7EPLHUBkJKsFnmWcPZ0HgQXSV3AQy0617EVDEQ/HHBo53bEmBre?=
 =?us-ascii?Q?Bei3tqMsjnG6doQNJ1mEqqlZlSbdG3/jlgrQUoCnJHICC1MIBxUDJvkvg2d1?=
 =?us-ascii?Q?S2wllngEhTfEtbznOlypEmVKVfQbl5PVU9WZEbKLKH2CVGpp9T+Vj7bwIGRd?=
 =?us-ascii?Q?iQnUgLGYyCy1tRofsuJ6dLX825348+/VnnFN15IDIt6LYjHJVmmz04+bQRcx?=
 =?us-ascii?Q?G2JPJ0QGFXSqcDTWYDPN+0Q0wIGlhnu266/jLgVxlxCbBe0u7n57SbT2Ki82?=
 =?us-ascii?Q?xDwl0m6aqyKUQKVECKSaoAfenRYmKfW5sBpO8yL1S22k7EQD5m2gSrDtpDwi?=
 =?us-ascii?Q?2tXL6bRSqfofYwiibX0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 05:29:08.5054 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b41c27-58e7-4783-815c-08dda7dfb956
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7889
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQ1eefrttUEYx3M26u9IuqpBKiYIQw5HOYFJxZH34zY=;
 b=gCh0QwIdl7TnRAqrF8bNNNJ5P/N5AqlPdXdKDTmNwjfk6fZXH/FrnVTK8LLFJIbN9pABjMbX+38oKUG66BtyLpMbGr1w1NtjjGpJPrJzeIdrWSGtDx0Rke6N4B5MOB5qMjqi9fQKCrXjw5XbBE9HlC/oLDNxaK+jgAYGiAjuZ60=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=gCh0QwId
Subject: [Buildroot] [PATCH v1 1/1] boot/xilinx-embeddedsw: bump default to
 xilinx_v2025.1
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

Now that all zynqmp and versal defconfigs have bumped to version
xilinx_v2025.1, the xilinx-embeddedsw default version can also be bumped
to xilinx_v2025.1.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
This patch is to be applied to the next branch.
---
 boot/xilinx-embeddedsw/Config.in                             | 2 +-
 boot/xilinx-embeddedsw/xilinx-embeddedsw.hash                | 4 ++--
 boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash | 5 -----
 configs/versal_vck190_defconfig                              | 1 -
 configs/versal_vek280_defconfig                              | 1 -
 configs/versal_vpk180_defconfig                              | 1 -
 configs/zynqmp_kria_kd240_defconfig                          | 1 -
 configs/zynqmp_kria_kr260_defconfig                          | 1 -
 configs/zynqmp_kria_kv260_defconfig                          | 1 -
 configs/zynqmp_zcu102_defconfig                              | 1 -
 configs/zynqmp_zcu104_defconfig                              | 1 -
 configs/zynqmp_zcu106_defconfig                              | 1 -
 12 files changed, 3 insertions(+), 17 deletions(-)
 delete mode 100644 boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 98d39331fe..12924edf44 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -21,7 +21,7 @@ if BR2_TARGET_XILINX_EMBEDDEDSW
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
 	string "xilinx-embeddedsw version"
-	default "xilinx_v2024.2"
+	default "xilinx_v2025.1"
 	help
 	  Release version of Xilinx/embeddedsw.
 	  Must be xilinx_v2023.1 or newer.
diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash b/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash
index f9eb6f7984..0a42bab314 100644
--- a/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash
+++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  550ba0b206848adb0085bc1ca5a6b6731681335c92912afb4a6a8dbb4c489a0c  xilinx-embeddedsw-xilinx_v2024.2.tar.gz
+sha256  867b7c7652f754d1a3d6edfe76e53223670e2b4c7e4144d4db1604403d68f616  xilinx-embeddedsw-xilinx_v2025.1.tar.gz
 
 # Locally calculated
-sha256  12bf8dad928a59644758825758b0c9d42d54478f5b04c8beb714d6f792450849  license.txt
+sha256  fbee87edd32cf203fdd7925f0bab15c98e2dc1e0d61e70867f1190dc4a605b12  license.txt
diff --git a/boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash b/boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash
deleted file mode 100644
index 0a42bab314..0000000000
--- a/boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Locally calculated
-sha256  867b7c7652f754d1a3d6edfe76e53223670e2b4c7e4144d4db1604403d68f616  xilinx-embeddedsw-xilinx_v2025.1.tar.gz
-
-# Locally calculated
-sha256  fbee87edd32cf203fdd7925f0bab15c98e2dc1e0d61e70867f1190dc4a605b12  license.txt
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 623646610f..8ccd63c1cc 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -38,7 +38,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 0c65ef36fa..3b600d5a10 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -38,7 +38,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vek280-revB"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index e938aadeaf..882a0f5937 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -38,7 +38,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk180-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 8e7034105f..363a3d7f4b 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -44,7 +44,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kd240/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k24-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS="-DK24_SOM"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 41661a69de..7b56018dd1 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -44,7 +44,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kr260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS="-DK26_SOM"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 0275edf30e..e9564e57e9 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -44,7 +44,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS="-DK26_SOM"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 1d4debc8e4..f316d54e3f 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -43,7 +43,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 2eabe2e959..174567125f 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -43,7 +43,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu104/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu104-revC"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index a62c7975bd..aa0b49d0f5 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -43,7 +43,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
