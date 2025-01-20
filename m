Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5273C02182
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 11:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A457460802;
	Mon, 20 Jan 2025 11:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYu_ooOgD8Bu; Mon, 20 Jan 2025 11:34:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FD2B60848
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FD2B60848;
	Mon, 20 Jan 2025 11:34:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DE9669
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 11:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38CE260A71
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 11:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yN4bE6Pei8JK for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 11:34:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::61d;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D1C960802
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D1C960802
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::61d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D1C960802
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 11:34:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gf0pm+gAIXdgFp5UE8alVqtvWIzf+DMRPJ0sigII8s0KYAnUD0k2vfd0gS4+8xxUbaIHD9BeRZUhSmsywsg4+Njb5IUKanilUhAp7O5y0/yycVSu6N2fUHLWjtwa9fziX961n4sNVLIuKmIB5XFTrks8OsYVwcgPZzFlf8FkF/LMunCcySt+x44bmWEmkvX4Tgv0u7kguVEZEKbaa9U7FLTDOIMberhHjnyQJEHIb3ZlT1W1bO3VuFMAOp1Ts0v5o1AS7JBCqKRPvKHJegTu4jcQffHfhF6ji1YOyn2rtKQSJfCxJnKrHzy/2nU3aNH0vqS9Qjd+F+Y469t6mtz09g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEmLyOwWbPYfH72FiFSQwDUwKNKeAr7TGrix2HlqisM=;
 b=W13HsdB9qPWH8xAj7cN5zhvFAhJBxqff5BYmMJaVLxMkZiTqc2njzo+v44mITs5d07slOpMSnlaGvW6b8Lct+oz1x3v+Bywy6wFzDOPAvsP19LTmskEWMov2RXe4Wv8FE296GLsutNrlIfj1M86LF0W1wq9/Bopd8tuS+8UNNzFvC9H5dhHQFw8tME2XY34u8QFX4QcErfSER+Pr4RIP9Kcbv+G8SZ/9ichHf5KKYnkiGLS4WjWgZvb4zUc0+iaTGuFPg+ouaNqr1fgNhKs4MEUkpluYXHY7Z5F7AgV0VUedBrqpWgv+mMOlwq19QfvVF/Ujn6D1yYWbT4t7P3iKaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH7PR17CA0008.namprd17.prod.outlook.com (2603:10b6:510:324::8)
 by DS7PR12MB9476.namprd12.prod.outlook.com (2603:10b6:8:250::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 11:34:11 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:324:cafe::eb) by PH7PR17CA0008.outlook.office365.com
 (2603:10b6:510:324::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Mon,
 20 Jan 2025 11:34:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 11:34:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Jan
 2025 05:34:08 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 20 Jan 2025 05:34:07 -0600
To: <buildroot@buildroot.org>
Date: Mon, 20 Jan 2025 11:34:02 +0000
Message-ID: <20250120113405.3938838-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|DS7PR12MB9476:EE_
X-MS-Office365-Filtering-Correlation-Id: 3736356b-f864-420b-0279-08dd39465b56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m6rZauyQFAN73SBM9VnF1r2QOP1cEOP8e2kCBN+h/NBlXYcARuFmr+8NP59h?=
 =?us-ascii?Q?VfjYlbNZ0IRxlpLwMPZdbbNgHIV6pr5UfxmoG2lMRiqHtc2CrJ8ldgkn6mqf?=
 =?us-ascii?Q?Gsq0WxyF6RZeR9jvJjAGbJ9hekefrPjRSVYrOeSox4MMSknNCQDJuK51GP/O?=
 =?us-ascii?Q?xVJAYwQFUVdO070hJesaJhY+8Lv1Ax2sxsUVqYMDmvy8PTKSVbzKv+yFrsgX?=
 =?us-ascii?Q?N4MfvAjz7HOgI1V+kryUxBNEGgYG60f5TuLVpFn7nk6/qyFPXcLp2UeFjNtk?=
 =?us-ascii?Q?Y13WGUAcsF0dmJIA0IuiIz4ceqhpgaYZNcA/fhOnzSEVpSHvPaGk21g1xQiP?=
 =?us-ascii?Q?kR0IpODc//Xc1tt0vq8Ce9Izzasjoh6Nz5dL+LiYMRCk2m62pHflPE3f6iQv?=
 =?us-ascii?Q?Kluc9jLIagNa54JFrnLZNnmkCqpoIe17AyJl0wm3kVDVfypFmr8ntufbbhGj?=
 =?us-ascii?Q?B98g2HY7tImXff4e18uJK7FrS5S5lYEwK6l9f31NuNc9kdTFb0WXOPqHeGBf?=
 =?us-ascii?Q?UmSCXxg1IDX8Rx+56K31OHWCrPZtVacR/oo6MmEFzYtSJnxZhWh0QxNNBfbW?=
 =?us-ascii?Q?7azPPqsgOVOIN1ciuk+PIQWU1mkN0h8sI+Gp5WlqjB9VBzvwfMSZFmvvjwQI?=
 =?us-ascii?Q?iHMtHSAXXHhYzVeIhaEbmKDPUStLPVBORBTOnIdqTAPnEsjUApkIeSXdK2Gv?=
 =?us-ascii?Q?X0ggPoPJj5CHU0Qz4bvTcnydk5jvVX8Ad+AFgc8EsKF6sEXEpLUVa329WQnT?=
 =?us-ascii?Q?uMmc8kJZBj7rH4hLeJY7MLZ76M5FK/6O3hP1ZkFLvjv6nBGRLbHaJLDdbJ8h?=
 =?us-ascii?Q?ttRHlqhOnT5TAukOFtXXUoZZVLUuILV6YCiOIAzJG2vycCpc+G8Y9xdBRFYI?=
 =?us-ascii?Q?60CHZT2527zAvo/mf+4LWUa1vq4NJUcpsD2UBcnSj0a0zqutHj+1wBsPgRLl?=
 =?us-ascii?Q?6fNND7L909wuJILWLoRUfoueMktei7dhPM6JLVFB1Tewnkdx2J7/AiNspRGf?=
 =?us-ascii?Q?w0m6Bhd5kqQz1ZtqJIdpfXH8e/7lcunFJ/S3B79xR7sq4mhjNC9jiwACkfZZ?=
 =?us-ascii?Q?CkJhnH8phoN4DZhiFeC1xPjciOPvs7iWnTCyZGlj34MbeC5qLS5vKnE5Hu5C?=
 =?us-ascii?Q?l6vM7IsiVjyWa5yQuU+URyEMdPwykOznYwNwnk3D3vk/GYgRsdYRoDMe/ipd?=
 =?us-ascii?Q?+DDGe3+Xnyc9ryNDClu/jP2C4uI+PEO0EfsNHEXgQ87u9KOWT/CBL/O0jLhJ?=
 =?us-ascii?Q?zK9NKPHTslw3cPwzwsfJUL5O0pR2FSxmmTQAM3rGah8FIgFgUqdKhnnsw7/x?=
 =?us-ascii?Q?2URQwExNIxvRJd7UW/tpdLDvXPdJI27hV8P9IoCKX3YE3sbJYCD+8sdnutus?=
 =?us-ascii?Q?l1iLDmHyeq/M6tvd//msvQHhDXLdHVRTXVEgGsIrQRb7AsAsxx6ceWJJFem+?=
 =?us-ascii?Q?d/hAyTjpoDzRWwzs/ihiTBmBmTAEMT2sFwnD4eTrAUPPX4wmbcuxpzvsCZZL?=
 =?us-ascii?Q?HiZiBBY120L8XENJgMwaAji+5xKDhjeT/tys4883i45O4SHQ487gSRzbEw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 11:34:09.7773 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3736356b-f864-420b-0279-08dd39465b56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9476
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEmLyOwWbPYfH72FiFSQwDUwKNKeAr7TGrix2HlqisM=;
 b=k9kMJI0kZEN/JpDgMqzNKiv3EzbNvjfFPyk15jQEnYF/eSYXZTPyvLW9XcqGni+JaBeEIFtSzoZIbyzMSHKm5+4D9DWu1Bp/sfAOofO4ZShADSPAllh8EQ7cFjmolWtlsCkXq0gdYJjCw0js6AEpqhzhdwWLUtWgGJ1KHjeqCY4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=k9kMJI0k
Subject: [Buildroot] [PATCH v2 1/4] boot/xilinx-embeddedsw: new boot package
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

This patch adds a new boot package to Buildroot for building boot firmware
applications from the https://github.com/Xilinx/embeddedsw repo.

If a user chooses to build a boot firmware application, it will not be
installed by the xilinx-prebuilt package since it will come from the
xilinx-embeddedsw package.  In this way, users can mix and match applications
to be built by the xilinx-embeddedsw package and applications to be copied
from the xilinx-prebuilt package.  This is necessary for the versal platform
because the pdi file can only be built by AMD Vivado.

Support for additional applications in the https://github.com/Xilinx/embeddedsw
repo can always be added to this package as needed or requested.

The xilinx-embeddedsw package replaces previous solutions including
zynqmp-firmware, versal-firmware and xilinx-source.

A patch is required for the xilinx-embeddedsw repo because the LICENSE file
has the name license.txt.  A patch is thus included to create a symbolic link
from LICENCE to licence.txt, so that the Buildroot hash check will succeed.
This patch is not upstreamable.

boot/xilinx-embeddedsw/0001-LICENSE-create-link-to-license.txt.patch
Upstream: n/a

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- fix check-package issues in Config.in files
- add patch for creating a link LICENSE->license.txt
- add hash for LICENSE/license.txt file
- change BR2_TARGET_XILINX_EMBEDDEDSW_USER_CFLAGS to
  BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS
  since it really only applied to zynqmp_pmufw
---
 DEVELOPERS                                    |  1 +
 boot/Config.in                                |  1 +
 ...1-LICENSE-create-link-to-license.txt.patch | 27 +++++++
 boot/xilinx-embeddedsw/Config.in              | 67 ++++++++++++++++
 boot/xilinx-embeddedsw/xilinx-embeddedsw.hash |  5 ++
 boot/xilinx-embeddedsw/xilinx-embeddedsw.mk   | 80 +++++++++++++++++++
 boot/xilinx-prebuilt/Config.in                |  8 ++
 boot/xilinx-prebuilt/xilinx-prebuilt.mk       | 21 ++++-
 8 files changed, 207 insertions(+), 3 deletions(-)
 create mode 100644 boot/xilinx-embeddedsw/0001-LICENSE-create-link-to-license.txt.patch
 create mode 100644 boot/xilinx-embeddedsw/Config.in
 create mode 100644 boot/xilinx-embeddedsw/xilinx-embeddedsw.hash
 create mode 100644 boot/xilinx-embeddedsw/xilinx-embeddedsw.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2d8ae8289b..36de3ceb72 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2426,6 +2426,7 @@ F:	board/versal/
 F:	board/xilinx/
 F:	board/zynq/
 F:	board/zynqmp/
+F:	boot/xilinx-embeddedsw/
 F:	boot/xilinx-prebuilt/
 F:	configs/versal_vck190_defconfig
 F:	configs/versal_vek280_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index 5c8d0e7ee5..f167346cdf 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -19,6 +19,7 @@ source "boot/ti-k3-boot-firmware/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
+source "boot/xilinx-embeddedsw/Config.in"
 source "boot/xilinx-prebuilt/Config.in"
 
 endmenu
diff --git a/boot/xilinx-embeddedsw/0001-LICENSE-create-link-to-license.txt.patch b/boot/xilinx-embeddedsw/0001-LICENSE-create-link-to-license.txt.patch
new file mode 100644
index 0000000000..cc880bf2bf
--- /dev/null
+++ b/boot/xilinx-embeddedsw/0001-LICENSE-create-link-to-license.txt.patch
@@ -0,0 +1,27 @@
+From: Neal Frager <neal.frager@amd.com>
+Date: Mon, 20 Jan 2025 09:05:13 +0000
+Subject: [PATCH] LICENSE: create link to license.txt
+
+This patch creates a soft link of LICENSE -> license.txt,
+so that the following Buildroot command will succeed:
+
+	make xilinx-embeddedsw-legal-info
+
+Upstream: n/a
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ LICENSE | 1 +
+ 1 file changed, 1 insertion(+)
+ create mode 120000 LICENSE
+
+diff --git a/LICENSE b/LICENSE
+new file mode 120000
+index 0000000000..cd301a44ab
+--- /dev/null
++++ b/LICENSE
+@@ -0,0 +1 @@
++license.txt
+\ No newline at end of file
+-- 
+2.25.1
+
diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
new file mode 100644
index 0000000000..e68e6077df
--- /dev/null
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -0,0 +1,67 @@
+config BR2_TARGET_XILINX_EMBEDDEDSW
+	bool "xilinx-embeddedsw"
+	depends on BR2_aarch64
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH = "microblazeel-xilinx-elf"
+	help
+	  Build boot firmware applications from source for Xilinx
+	  boards. Users can mix and match applications to be built
+	  by xilinx-embeddedsw and applications to be copied by
+	  xilinx-prebuilt. If a xilinx-embeddedsw application is
+	  selected, it will be built and installed from the Xilinx
+	  embeddedsw repo, and it will not be copied from the
+	  xilinx-prebuilt repo.
+
+	  Applications can be found on the Xilinx embeddedsw repo:
+	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps
+
+comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
+
+if BR2_TARGET_XILINX_EMBEDDEDSW
+
+config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
+	string "xilinx-embeddedsw version"
+	default "xilinx_v2024.2"
+	help
+	  Release version of Xilinx/embeddedsw.
+	  Must be xilinx_v2023.1 or newer.
+
+config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
+	bool "versal plm"
+	help
+	  Build versal plm application from Xilinx/embeddedsw repo.
+	  If selected, the xilinx-prebuilt package will not install
+	  the plm.elf since it will come from the xilinx-embeddedsw
+	  package.
+
+	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/versal_plm
+
+config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
+	bool "versal psmfw"
+	help
+	  Build versal psmfw application from Xilinx/embeddedsw repo.
+	  If selected, the xilinx-prebuilt package will not install
+	  the psmfw.elf since it will come from the xilinx-embeddedsw
+	  package.
+
+	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/versal_psmfw
+
+config BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
+	bool "zynqmp pmufw"
+	help
+	  Build zynqmp pmufw application from Xilinx/embeddedsw repo.
+	  If selected, the xilinx-prebuilt package will not install
+	  the pmufw.elf since it will come from the xilinx-embeddedsw
+	  package.
+
+	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/zynqmp_pmufw
+
+config BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS
+	string "xilinx-embeddedsw optional zynqmp_pmufw user cflags"
+	help
+	  Add optional cflags when building xilinx zynqmp_pmufw.
+
+	  Example cflag options can be found here:
+	  https://github.com/Xilinx/embeddedsw/blob/master/lib/sw_apps/zynqmp_pmufw/src/xpfw_config.h
+
+endif # BR2_TARGET_XILINX_EMBEDDEDSW
diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash b/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash
new file mode 100644
index 0000000000..ba0214f6c2
--- /dev/null
+++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  550ba0b206848adb0085bc1ca5a6b6731681335c92912afb4a6a8dbb4c489a0c  xilinx-embeddedsw-xilinx_v2024.2.tar.gz
+
+# Locally calculated
+sha256  12bf8dad928a59644758825758b0c9d42d54478f5b04c8beb714d6f792450849  LICENSE
diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
new file mode 100644
index 0000000000..9a89f27d10
--- /dev/null
+++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
@@ -0,0 +1,80 @@
+################################################################################
+#
+# xilinx-embeddedsw
+#
+################################################################################
+
+XILINX_EMBEDDEDSW_VERSION = $(call qstrip,$(BR2_TARGET_XILINX_EMBEDDEDSW_VERSION))
+XILINX_EMBEDDEDSW_SITE = $(call github,Xilinx,embeddedsw,$(XILINX_EMBEDDEDSW_VERSION))
+XILINX_EMBEDDEDSW_LICENSE = MIT
+XILINX_EMBEDDEDSW_LICENSE_FILES = LICENSE
+XILINX_EMBEDDEDSW_INSTALL_TARGET = NO
+XILINX_EMBEDDEDSW_INSTALL_IMAGES = YES
+XILINX_EMBEDDEDSW_DEPENDENCIES = toolchain-bare-metal-buildroot
+
+# ZYNQMP_PMUFW application allows users to add cflags
+XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS = \
+	$(call qstrip,$(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS))
+XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_CFLAGS = \
+	"-Os -flto -ffat-lto-objects $(XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS)"
+
+XILINX_EMBEDDEDSW_CFLAGS = "-Os -flto -ffat-lto-objects"
+
+ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)
+define XILINX_EMBEDDEDSW_BUILD_VERSAL_PLM
+	$(MAKE) -C $(@D)/lib/sw_apps/versal_plm/src/versal \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(XILINX_EMBEDDEDSW_CFLAGS)
+endef
+
+define XILINX_EMBEDDEDSW_INSTALL_VERSAL_PLM
+	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/versal_plm/src/versal/plm.elf \
+		$(BINARIES_DIR)/plm.elf
+endef
+endif # BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
+
+ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW),y)
+define XILINX_EMBEDDEDSW_BUILD_VERSAL_PSMFW
+	$(MAKE) -C $(@D)/lib/sw_apps/versal_psmfw/src/versal \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(XILINX_EMBEDDEDSW_CFLAGS)
+endef
+
+define XILINX_EMBEDDEDSW_INSTALL_VERSAL_PSMFW
+	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/versal_psmfw/src/versal/psmfw.elf \
+		$(BINARIES_DIR)/psmfw.elf
+endef
+endif # BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
+
+ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
+define XILINX_EMBEDDEDSW_BUILD_ZYNQMP_PMUFW
+	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_CFLAGS)
+endef
+
+define XILINX_EMBEDDEDSW_INSTALL_ZYNQMP_PMUFW
+	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/zynqmp_pmufw/src/executable.elf \
+		$(BINARIES_DIR)/pmufw.elf
+endef
+endif # BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
+
+define XILINX_EMBEDDEDSW_BUILD_CMDS
+	$(XILINX_EMBEDDEDSW_BUILD_VERSAL_PLM)
+	$(XILINX_EMBEDDEDSW_BUILD_VERSAL_PSMFW)
+	$(XILINX_EMBEDDEDSW_BUILD_ZYNQMP_PMUFW)
+endef
+
+define XILINX_EMBEDDEDSW_INSTALL_IMAGES_CMDS
+	$(XILINX_EMBEDDEDSW_INSTALL_VERSAL_PLM)
+	$(XILINX_EMBEDDEDSW_INSTALL_VERSAL_PSMFW)
+	$(XILINX_EMBEDDEDSW_INSTALL_ZYNQMP_PMUFW)
+endef
+
+$(eval $(generic-package))
diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index 94ef3dd111..793baa116f 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -4,6 +4,14 @@ config BR2_TARGET_XILINX_PREBUILT
 	help
 	  Pre-built firmware files for Xilinx boards.
 
+	  The pre-built firmware applications will only be installed
+	  if they are not being built by the xilinx-embeddedsw
+	  package.
+
+	  Users can mix and match applications to build with
+	  xilinx-embeddedsw and applications to simply install with
+	  xilinx-prebuilt.
+
 	  https://github.com/Xilinx/soc-prebuilt-firmware
 
 if BR2_TARGET_XILINX_PREBUILT
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 9f36ee7285..d0817d3cc7 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -46,23 +46,38 @@ XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
 XILINX_PREBUILT_PDI = $(XILINX_PREBUILT_BOARD_DIR)/*.pdi
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
-define XILINX_PREBUILT_INSTALL
+ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)
+define XILINX_PREBUILT_INSTALL_VERSAL_PLM
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_PLM) \
 		$(BINARIES_DIR)/plm.elf
+endef
+endif # !BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
+
+ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW),y)
+define XILINX_PREBUILT_INSTALL_VERSAL_PSMFW
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_PSMFW) \
 		$(BINARIES_DIR)/psmfw.elf
+endef
+endif # !BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
+
+define XILINX_PREBUILT_INSTALL_VERSAL_PDI
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_PDI) \
 		$(BINARIES_DIR)/vpl_gen_fixed.pdi
 endef
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL
-define XILINX_PREBUILT_INSTALL
+ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
+define XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/pmufw.elf \
 		$(BINARIES_DIR)/pmufw.elf
 endef
+endif # !BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL
 
 define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
-	$(XILINX_PREBUILT_INSTALL)
+	$(XILINX_PREBUILT_INSTALL_VERSAL_PLM)
+	$(XILINX_PREBUILT_INSTALL_VERSAL_PSMFW)
+	$(XILINX_PREBUILT_INSTALL_VERSAL_PDI)
+	$(XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW)
 endef
 
 $(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
