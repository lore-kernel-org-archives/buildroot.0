Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E068DC02185
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 10:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E7AB612C3;
	Tue, 21 Jan 2025 10:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rf3HK-wx9Bxk; Tue, 21 Jan 2025 10:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2AF46125C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2AF46125C;
	Tue, 21 Jan 2025 10:22:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 508D6D7
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 10:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 310DB41721
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 10:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4d8Rb3jRZMi for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 10:22:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::62f;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B01D8416DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B01D8416DF
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B01D8416DF
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 10:22:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uf5ywlY+iD48u5gj/Kog4tCqq9gqMDZg0a5sPndDx8ONGsMV5di30OsxP1GF6gFDyRB2sZD1waaaaCrWEtYxN3RcnMXbrJnqKtx83+KmysBMWTJmfaNdlL522Zj6YsgUO+RXgxB+V72k1mIFKwomGEcv2NRNVIliNxBXT/MkEIKiWRrY9LcsFblBGvavLP9NvoH7vSydZLksSTcVXgUV/WqvsQyE1wMWpkSHBHZ1wjALEpVtMQ/posFaQPw7MmbNmjIOoDKDMPIelTr6dCv/XrgnoTyOTkyG8vWA5Yppj7WW/1yBN2NUgb2ujhorn9sbht3S3DZxyfPhkUghdtJhug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5SbxjTCKaFySMQ1VuGg5AmwXzP2JX29h/SwiJTlkG8=;
 b=LzDMslfaeuogaSB+TKoM6N2hwBY/cy6dNfyyJynibGM093O3TNWXqxU3HwKtlJO6Tj4GgbKPolbch7Z7HGRztjJrDjkMWrxkyC3yH4ZeIPWhNMO7leTPk57bzaOyOpdlxQS1VpMZ4CFdSQWq3Ai0iyhBVkWZQtJlbj+jPPAeA5qYpIXCuMxKLbjWqU7tXis3QV37AnCy2HEjPYwqCzUUnON1XjzNGnsjKLlOHaBUKD0KG12fh6YZJHo1nITa9HMZsYq7SjjivIEZCEeAfbYxohtEAAHLh/T2cYbx9YqRtPi3CfgCUvH9DpaROa25ZM+1CIQnfZG/gvouSJrqtqlG6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SA0PR12CA0007.namprd12.prod.outlook.com (2603:10b6:806:6f::12)
 by IA1PR12MB7517.namprd12.prod.outlook.com (2603:10b6:208:41a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Tue, 21 Jan
 2025 10:22:27 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:6f:cafe::3c) by SA0PR12CA0007.outlook.office365.com
 (2603:10b6:806:6f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Tue,
 21 Jan 2025 10:22:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Tue, 21 Jan 2025 10:22:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 Jan
 2025 04:22:26 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 21 Jan 2025 04:22:24 -0600
To: <buildroot@buildroot.org>
Date: Tue, 21 Jan 2025 10:22:19 +0000
Message-ID: <20250121102222.1335874-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|IA1PR12MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: 1abb750f-320d-4dca-afff-08dd3a0580e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wP8j2w3fXATgpjTcVLuH3PWa9FkM93A+DfbMmunSqPVz41rWKXlP7O//eaEP?=
 =?us-ascii?Q?CLmNDIF6/sb0L9q6m7bFZ2RNbQ9r/9FWa7V9sosRg9OwwDCP6gxOhupWN5lT?=
 =?us-ascii?Q?AXluOPsES0vxogJc/Vesa3r+BcxUQGr4xgTxMXfd798HH7FORLJe7+9Pjt5d?=
 =?us-ascii?Q?wPYkTtR01cyOfHax3+yzwEwTMupAa73t7mk7ifRehDusqQ0pFUxoXIxWgGms?=
 =?us-ascii?Q?UkrmJmp0QXUMgRYzaLYOVeJslwjVV7Dql0RkySZ1u0e2vZ5bOPQEbgzYRR2O?=
 =?us-ascii?Q?5eu7XO/q2o+pIEUoQWtOhPToqm8ska1YvUpW8T3HzqB8zi6JQKtLx1iCJTzQ?=
 =?us-ascii?Q?wwmWroV6ZCaauwDFVsmYBPNsct3pbj/uGeNR84jQmZ4hQGVCr7fbAZi4skWT?=
 =?us-ascii?Q?IlZ1UH3NRQlH/Kqu6rLbk6HbODcCAFFBWwppLqqWTiGjeMWvAlIRRHNO05YB?=
 =?us-ascii?Q?f5qV5PPM2zbgjXPkwkeGkNCP/cTRdtaJE1b9eOW7mci5TBD6N6Kl71AZw03Z?=
 =?us-ascii?Q?PgpHoH6DeEAhM6/5q8vGwidk+TKK0OnA9xOoR3wZig/LrQ8g7Ir4+ydpzCjS?=
 =?us-ascii?Q?6spIVx0S3DATbsbE3Xc760Gd7pVH/rdWOC+fSWCM7L7WHYmeZ02RTsrZm65o?=
 =?us-ascii?Q?Uw78do7K4oGU1EzDOl908UspxHsSz2l+o6kaEWfqR0d0Nc0CepZcwjF1UoiJ?=
 =?us-ascii?Q?UdwM+Qm0rXTYjcim/My00PtdMTmdQ7tRkN7GWFaM8zDDCtefosOAKR2jA6sB?=
 =?us-ascii?Q?wKIHTaLhB/BbElOdlmNEFHBzMnrlXgP2h5Cfx0v2ap1PO4qAJ9gcp6ZXiJxB?=
 =?us-ascii?Q?DiqeLFTOe0qNJ3VuxA4tTRwu0D4nNXhMqWlwKzoRAO1GR9tEsHwLTzQORDPH?=
 =?us-ascii?Q?lKj189smIcdOPVjHc1h1kzVuXp9vPAUkjR8JgriypTMFxMtxqqCRkjlg0go5?=
 =?us-ascii?Q?K4hDOJK4ABX5dVbfYhMStSLOoB2JZVBz4Ihe4pDUJYJ1B88s+1Ju05bQ/7Ew?=
 =?us-ascii?Q?80zG4elu5Ur36l9FCoKd2y7s/Ik+4aEBJsYwINR731E6nzRJ8yzQDcxY54dz?=
 =?us-ascii?Q?pYtV9/1x4uZQKmgOb4bW5Bf1I/+8aYGSB4C4aE/9uOELCSO2YZg9s1y1foKH?=
 =?us-ascii?Q?2SSMv0AEOyPwIOpmvnJXZXfWlgcB6wapE0vmudxgCCQE3+jhDwYaSBZHxIpa?=
 =?us-ascii?Q?JXO/kSkdK5ppnvW76NFy8GMkZVBHDVKX1fCkBqvtoDkPLyE7Di6/HY+kGDhD?=
 =?us-ascii?Q?e7+GrPtPvK0aXEGeVjH5pzSBFYCtCc7SK1wL+JCrq3m8WJh6VAZgIik0QiyB?=
 =?us-ascii?Q?o/6g8iw1J4/manrMV+jijxnwPlZEDnxQYzUwWi/olY0Lm2FMVqA/4925zrFL?=
 =?us-ascii?Q?6DxtJ7l8ChlvHvum15naMFLvTOk9nGwPtiT3OVcu4+iB81IIu5BodeIQpQM5?=
 =?us-ascii?Q?XHD85fnIE1reo/8qmGmfAYk3DBUOb/BaWS8LtmtVR0EuAvY3DCujvPRWPbzK?=
 =?us-ascii?Q?D7s9QsOYKvy6kWF+ZXKzxSJOBvDC5AZqnY54M0mS42Ds1Ii8DiAvJ94TNw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 10:22:26.7481 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abb750f-320d-4dca-afff-08dd3a0580e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7517
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5SbxjTCKaFySMQ1VuGg5AmwXzP2JX29h/SwiJTlkG8=;
 b=TCz9RZvlyt8nR6TyqFR3Soe19Poi4FsRscM59bfkMiCKouRdgTKGKzKi17whj5KTITtT1zJPZf/tjWjxKwV0oYuI/xrz/2U3KqpcA7ig+cb2FIxV/EI2yijY/VS+jJF4glhwM0IdvlBxoC3l2hhjfmOBSKaXaegfNSMYcKJI51A=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=TCz9RZvl
Subject: [Buildroot] [PATCH v3 1/4] boot/xilinx-embeddedsw: new boot package
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

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- fix check-package issues in Config.in files
- add patch for creating a link LICENSE->license.txt
- add hash for LICENSE/license.txt file
- change BR2_TARGET_XILINX_EMBEDDEDSW_USER_CFLAGS to
  BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS
  since it really only applied to zynqmp_pmufw
V2->V3:
- corrected license file definition as license.txt
- added BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS
  dependency on BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
---
 DEVELOPERS                                    |  1 +
 boot/Config.in                                |  1 +
 boot/xilinx-embeddedsw/Config.in              | 68 ++++++++++++++++
 boot/xilinx-embeddedsw/xilinx-embeddedsw.hash |  5 ++
 boot/xilinx-embeddedsw/xilinx-embeddedsw.mk   | 80 +++++++++++++++++++
 boot/xilinx-prebuilt/Config.in                |  8 ++
 boot/xilinx-prebuilt/xilinx-prebuilt.mk       | 21 ++++-
 7 files changed, 181 insertions(+), 3 deletions(-)
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
diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
new file mode 100644
index 0000000000..757ff59e35
--- /dev/null
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -0,0 +1,68 @@
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
+	depends on BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
+	help
+	  Add optional cflags when building xilinx zynqmp_pmufw.
+
+	  Example cflag options can be found here:
+	  https://github.com/Xilinx/embeddedsw/blob/master/lib/sw_apps/zynqmp_pmufw/src/xpfw_config.h
+
+endif # BR2_TARGET_XILINX_EMBEDDEDSW
diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash b/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash
new file mode 100644
index 0000000000..f9eb6f7984
--- /dev/null
+++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  550ba0b206848adb0085bc1ca5a6b6731681335c92912afb4a6a8dbb4c489a0c  xilinx-embeddedsw-xilinx_v2024.2.tar.gz
+
+# Locally calculated
+sha256  12bf8dad928a59644758825758b0c9d42d54478f5b04c8beb714d6f792450849  license.txt
diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
new file mode 100644
index 0000000000..7d4fcf8b8f
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
+XILINX_EMBEDDEDSW_LICENSE_FILES = license.txt
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
