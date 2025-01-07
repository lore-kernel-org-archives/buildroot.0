Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C540AE77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 11:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BFA960826;
	Tue,  7 Jan 2025 11:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1aCoYO0uYMR; Tue,  7 Jan 2025 11:16:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1424605B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1424605B7;
	Tue,  7 Jan 2025 11:16:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F909DB4
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 11:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F059C404D9
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 11:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1mY6-GYkw1bq for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 11:15:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::603;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F111A4049B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F111A4049B
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::603])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F111A4049B
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 11:15:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S88krImXEv9JLEtbwpKpZAJpCmMoYcBK44bjBv/tHz1WuPt3LD489UgDZqpafUZsAoAcw+yQ8Sm9dVDunOLPsvPb2F5sfI++LpVV/wUQJ2TwT1i6lVtIwpIYCpzRrCvdje3Uwb25A8wNcQnRhach8VQzHUI6C7hX4GSPvydvKNejic1+Rbv9nO9vPt5k2l4wdnP4N51v1nzFyZUjjbmN36sQ8YctfVdfsMOOtBpE1yO3iFkb8Qzec621QBYD/N/be8pV8rX66cnvTDMjrr9HQR0/XVap6pLQ2EpCOUqGTguI9DS5rTvD8Jk8Npju+I3HHAY+Xw0erZe1kXA4is3U2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rk87Krcz376kAz5mck5/gMpmNTK0qf7K8/0y3nqPQfI=;
 b=CfQfBsgTUkZSFbxNCMCnGNC/FySM9rU4Q6M+wnlllno3YHK2ND+yAcknzrCapWOvX3eQMqUr446kt8eSC2l4+dnzi8Prq9I8pozr39ih8tPaexQaSX8VUlNgU+jZ2XjyYjwXN0wtcvyplTMZJO9eK090+rZJfiwUJFn4CC3Mx0g5AazCQIdOHqehOVS4LTi2ne+5P1Zl4565rDhH+44Ohb9EO0YV9fU80RhbgeSISw3CJ/PlJezE+P+lIUtg11qdM/zw7cNwCt8kdJRL08f6QszJ3cT/DXUROQl5sGavgUKLskXLdctJE05zy0ytBkOtwsavmST3+CgIgjwhLu3fyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR18CA0030.namprd18.prod.outlook.com (2603:10b6:5:15b::43)
 by BL3PR12MB6617.namprd12.prod.outlook.com (2603:10b6:208:38c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 11:15:45 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:15b:cafe::5d) by DM6PR18CA0030.outlook.office365.com
 (2603:10b6:5:15b::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.17 via Frontend Transport; Tue,
 7 Jan 2025 11:15:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 11:15:45 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 05:15:44 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 05:15:44 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 7 Jan 2025 05:15:43 -0600
From: Neal Frager <neal.frager@amd.com>
To: <buildroot@buildroot.org>
Date: Tue, 7 Jan 2025 11:15:37 +0000
Message-ID: <20250107111540.1548042-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|BL3PR12MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec17815-9bd0-4c09-cc82-08dd2f0ca17b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NBzEa8lH8IlQHirO2bymz+RVdVbrnxtVEQKEei/UVk2hERx2exCiSLlcXyq3?=
 =?us-ascii?Q?JF3NSmGRZKzXbi+29toI+T7bRon2AartCKtcO5lP6Qwde+PxdaocGnUOIcVN?=
 =?us-ascii?Q?N4lIv5p3fI8rT7eX6Lgtw0JeQjUZnMCnmCNsnUlBeMSD2rFB3AWUsyB6bgah?=
 =?us-ascii?Q?kxxCf1myF5y+7euP7I4bZh/o6DPatAVb5oxptnF1EVZrxA9nrJ9J0LgjORlT?=
 =?us-ascii?Q?hTXTt8d5Z2/OpIZmC/INrCMa3pjGFyhD06GZKdO8lO/hIzKFmItxTWZpFvwb?=
 =?us-ascii?Q?rVvoFoY28fP2/MSXyLjQ22cMFJsvFZvoTNnqYAH+57bDyZv+ug4vaicu/RmG?=
 =?us-ascii?Q?dZyEeBWQMnxjfIcRFpV2r0T8WbRtNwu+YQ6jMIioLqOR0qGMmJ9ALyPK9Og/?=
 =?us-ascii?Q?7+sbdUZy4vjsOLFCS/PFc+YYyXIF0EFvpH5oqAZwabT+hXyZA7kM2RFSOIu4?=
 =?us-ascii?Q?FTnghyfJOAsqPXBl4Y6bB8W53lWNWjd0P6cwaWUEsJMfZqQYQ7iF2dBQVRDu?=
 =?us-ascii?Q?AnmY9SWjMFRQYlipIFAbNNQA0zFVk7QHURH+mjEoyH2qoO6rstWb6ASbZImf?=
 =?us-ascii?Q?xzltiKHeUDdywDo117WzNjME7SVoo66Sa8RR7GwBLipLwmU2NY1mjqlEDngW?=
 =?us-ascii?Q?uiV8cDy1qR/ud3EAtWHwFvBR0pnESB9VJTq4VtokGtRZxt91yCoSIzXK63LW?=
 =?us-ascii?Q?G/89XdfuTW/n9yRgbnZdaWcsS9JzoPuphC0V0+JsZEvw3Gg2JdZ8VNu3Hqr6?=
 =?us-ascii?Q?NL/UUoL7eqX+tFOKbn0ZAPpcfbsBwL3RaN5t8HFJdwZULFrp7mJBgylhxneG?=
 =?us-ascii?Q?tvMPK1YmR28p9TdFUNFlgtFv8Q1ayABoSVJwlKO7BAtsSRse+4d+eOK3m6sJ?=
 =?us-ascii?Q?J+XwCY8x9UZFuGS9xLeQnZlQMo1WvWR911rRUrhR9Q6gcbia5UPJ+JjvRseE?=
 =?us-ascii?Q?p4YPEpEd9s2JzJg/BpyEPXaX/pfbl7XJS2R6OFwhh2Q5BBNoYLL97As0H3x9?=
 =?us-ascii?Q?wbtb+wwG4WWm6yAU1pi8SlvPdsCqUZQup016oPa/2KyBCjnilRvVg0DScS5T?=
 =?us-ascii?Q?68BNe52WOqOr6MWAbxpGcfwIiwaFVh4F12FEN+tuwEOVHYZnmYxmzAT4sL0A?=
 =?us-ascii?Q?dkZyurkvMFpRE/LAvOZBGoeSMj6+2J0hEvPQ2m6wDVlxeZplXhU7foA/CuRK?=
 =?us-ascii?Q?/xqhxN6aSG8GQjpCygH9YBxmDcCfsz5ZSbO5TVDWRGS0x/8ZADq5zaWUNHmZ?=
 =?us-ascii?Q?yKPfq4/cFZkCFebb9Xtob1nHQTq0NLkbNjjsUV6T5tDtaBOi54TkLfG5O5sz?=
 =?us-ascii?Q?ulJ6xMds5NFsogvvl8/7KKn/NuchljJHIA3YNhX7JjBWvqqBPEKoI5VgNpIz?=
 =?us-ascii?Q?+J+RBwe9AniLMbE7uNgvXYXd1CDede+bwGUK/JpVPKvq+bcFCvs93c/TyeTj?=
 =?us-ascii?Q?4uUVwCSC1OsMcwaLz0lMS56Gk1IvEyxl4sWO4dcwu9yXtBsVF6+z+w=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 11:15:45.0899 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec17815-9bd0-4c09-cc82-08dd2f0ca17b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6617
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rk87Krcz376kAz5mck5/gMpmNTK0qf7K8/0y3nqPQfI=;
 b=FEIgI5VfzSj7RC/4W2LSbUqLKpFGlAVhd8B4bZi5Dxwj6uh40gnDLzciGXP4Des0Dos+DePpyD6FUGHhuuqXxdmtjvVt+cD0V95xO4z2/wvkeZrXamMFdPp3S5fD1zxEc10pJeVIy4JsDxZ/j6SUJxayzDPDLcPkSqTnuY46D7w=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=FEIgI5Vf
Subject: [Buildroot] [PATCH v1 1/4] boot/xilinx-embeddedsw: new boot package
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
 DEVELOPERS                                    |  1 +
 boot/Config.in                                |  1 +
 boot/xilinx-embeddedsw/Config.in              | 66 ++++++++++++++++
 boot/xilinx-embeddedsw/xilinx-embeddedsw.hash |  2 +
 boot/xilinx-embeddedsw/xilinx-embeddedsw.mk   | 77 +++++++++++++++++++
 boot/xilinx-prebuilt/Config.in                |  6 ++
 boot/xilinx-prebuilt/xilinx-prebuilt.mk       | 21 ++++-
 7 files changed, 171 insertions(+), 3 deletions(-)
 create mode 100644 boot/xilinx-embeddedsw/Config.in
 create mode 100644 boot/xilinx-embeddedsw/xilinx-embeddedsw.hash
 create mode 100644 boot/xilinx-embeddedsw/xilinx-embeddedsw.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 16b72eee08..5e94c3b3aa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2427,6 +2427,7 @@ F:	board/versal/
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
index 0000000000..239ae6d8cc
--- /dev/null
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -0,0 +1,66 @@
+config BR2_TARGET_XILINX_EMBEDDEDSW
+	bool "xilinx-embeddedsw"
+	depends on BR2_aarch64
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH = "microblazeel-xilinx-elf"
+	help
+	  Build boot firmware applications from source for Xilinx boards.
+	  Users can mix and match applications to be built by xilinx-embeddedsw
+	  and applications to be copied by xilinx-prebuilt.  If a
+	  xilinx-embeddedsw application is selected, it will be built and
+	  installed from the Xilinx embeddedsw repo, and it will not be copied
+	  from the xilinx-prebuilt repo.
+	  
+	  All applications can be found on the Xilinx embeddedsw repo:
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
+config BR2_TARGET_XILINX_EMBEDDEDSW_USER_CFLAGS
+	string "xilinx-embeddedsw optional user cflags"
+	help
+	  Add optional config flags when building xilinx boot firmware.
+	  
+	  Example config flag options can be found here:
+	  https://github.com/Xilinx/embeddedsw/blob/master/lib/sw_apps/zynqmp_pmufw/src/xpfw_config.h
+
+endif # BR2_TARGET_XILINX_EMBEDDEDSW
diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash b/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash
new file mode 100644
index 0000000000..fe0f1388b7
--- /dev/null
+++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  550ba0b206848adb0085bc1ca5a6b6731681335c92912afb4a6a8dbb4c489a0c  xilinx-embeddedsw-xilinx_v2024.2.tar.gz
diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
new file mode 100644
index 0000000000..836daf2f88
--- /dev/null
+++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
@@ -0,0 +1,77 @@
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
+XILINX_EMBEDDEDSW_USER_CFLAGS = \
+	$(call qstrip,$(BR2_TARGET_XILINX_EMBEDDEDSW_USER_CFLAGS))
+XILINX_EMBEDDEDSW_CFLAGS = \
+	"-Os -flto -ffat-lto-objects $(XILINX_EMBEDDEDSW_USER_CFLAGS)"
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
+		CFLAGS=$(XILINX_EMBEDDEDSW_CFLAGS)
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
index 94ef3dd111..2885422f96 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -4,6 +4,12 @@ config BR2_TARGET_XILINX_PREBUILT
 	help
 	  Pre-built firmware files for Xilinx boards.
 
+	  The pre-built firmware applications will only be installed
+	  if they are not being built by the xilinx-embeddedsw package.
+	  
+	  Users can mix and match applications to build with xilinx-embeddedsw
+	  and applications to simply install with xilinx-prebuilt.
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
