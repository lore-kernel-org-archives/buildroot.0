Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A4DCFD2F6
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 10:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6833440FA9;
	Tue,  2 Dec 2025 10:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MEcvtvgPnz5y; Tue,  2 Dec 2025 10:05:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0647240FF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0647240FF7;
	Tue,  2 Dec 2025 10:05:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B018A1BD
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 10:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9638C40365
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 10:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLWfTuLVu5Ef for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 10:05:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c112::7;
 helo=cy3pr05cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4D2294032E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D2294032E
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::7])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D2294032E
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 10:05:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8Frdv1yz7sfupueNkeF9jHAXQonLMm9scfv/h3ZTQb4dvHoXVzNeblm36gTDd6g1dC1kFEFVLIaiEtJd7lg2sYsGJW8NBwKRU3ZfSLCD3791eYOHgfB5FlKX8d5xPUajJ6qCy0MZNE5Stl3OXHYOQQwXrujU1j+m7LKo/reSpWN9L8LiggAfnRz/zEyZqSAdaA267t8poz8tqHydT9KV+NSQzJSn98MYqQ5i+6mjBP+ZrkuzBl/9/GpfhLthi4HlNTJ/PTbRAdkzmnHf8p7yIrDj0kPzTPbbjpQHxiVf4GfpaVPBStwyxFQuQvzVySPgtvDNf4e9XUJ/ACTU3i/YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbFcgi+mcwBCyLeRHn+7xiYfXwLvZh0oTJLJ3YRLxbg=;
 b=bIjudiJPJpI+N/iHtHVZ+q6qYtLfRcHem5QqHNM8bTWIw/6nF6mgmr9h1LgSUJ7Cp7TXAfn5vo997vT2IP93xNQbvEUFwvhebv1qcJ2fab83tzhBWtKvA2KeX5d4MR3KYn/N1dGGmpqN7xH47FmgPvvC0LsYaCVOUoG81bqioPcrqY3bQUlw5PR3mYPS4q+RnS9+s5Olmirh2t7pcinx9EjXrJRiOP9dULLn7aSWGp+ROGC+cFuORgn9V7sIuDbXCApdmT4KM6zakgkTqV7B6wevW1r/GSU5q+V1Pb5WepQgVhfg0WRoUVgzAaYQ8HFCxFJW6Ib/igoHG5x0j0/RoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0P221CA0044.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::27)
 by IA0PR12MB9046.namprd12.prod.outlook.com (2603:10b6:208:405::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 10:05:27 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::2c) by CH0P221CA0044.outlook.office365.com
 (2603:10b6:610:11d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 10:05:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 10:05:27 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 2 Dec
 2025 04:05:24 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 2 Dec 2025 02:05:23 -0800
To: <buildroot@buildroot.org>
Date: Tue, 2 Dec 2025 10:05:16 +0000
Message-ID: <20251202100516.1097984-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251202100516.1097984-1-neal.frager@amd.com>
References: <20251202100516.1097984-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|IA0PR12MB9046:EE_
X-MS-Office365-Filtering-Correlation-Id: fd6a6829-8173-480b-2ff8-08de318a5130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|7416014|1800799024|82310400026|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NrGWwDnxTqB++H+Z2HU9I02gQeU6HoYZQEXWLelO7L+fPWjzwDdlDh5pcw20?=
 =?us-ascii?Q?t1m65J9vE/2gx3RMN38Nh3VQ7p968f54aTWsMpv26BHzdMN01rGTwunASkwE?=
 =?us-ascii?Q?3q/3nEJIiwckMOYpixaD7ARevWVPj1fF4w4dXNpDC/kwCK5AsZkAs55i2l/o?=
 =?us-ascii?Q?QnW/xdhWh3FBDRgjJO/AbZ1renKCRxS5+aJEs7GQMmWhycaBQVqa+/sCQykd?=
 =?us-ascii?Q?O4xxmrSANe4THECFygaLibcKb8ozp+eoqi67FSwy9GmODxaznORK+D2gkt1D?=
 =?us-ascii?Q?CoPnvPj8pP0pXGKUfBmJf9MfAZWUoWa3t7zUW4oBOk8joVhp9JCM4d1PDjsn?=
 =?us-ascii?Q?4p5P1nax6TD7EXiH4zYamGLTHYorHaFeUvBapBKG5TgZPtPqEQzfkNh5VA7G?=
 =?us-ascii?Q?SyYBWX8uNMuTl7EdVVR+WEdjrTZbU0cRM0spWaownSSDQ/EbMtQ58PBW7ulR?=
 =?us-ascii?Q?40D3HRqfiC9XqaJ6gmvAOkOGhyZxYJLsxLf5KlzxbFRMLJabI5liCL2im7zX?=
 =?us-ascii?Q?oxF3uvgawIdf1QEJEH69tgHIne4d+ks2pzDc2SapdEkllTlOfQvYo+a0C2w/?=
 =?us-ascii?Q?Pezl+eMd8bwh0fVUsNx8DtdX0b7VkXfGp1p1vded30z5Yr+wTDDMXM8oLNDv?=
 =?us-ascii?Q?eHErUmajzSpOWkTmAXgbCO2z49/QGu+1/q6CPtMqeGeY3P30FqoDTQeVoLeL?=
 =?us-ascii?Q?NOy4mQIU8gbfiTb3AWX4OIzxESywV2odyoCO1ZVD3uX8wE+y/UL85Y5Acnq0?=
 =?us-ascii?Q?d6G1Dp9fuMTIsFStO6aAreJQHgXBdRpEz+UCpFtWjgmVJOk8EiAlhA0ylvsp?=
 =?us-ascii?Q?t33+j11z5nPK2XeTtIQVbonrBAQHb7WBiCrEPK2sKJCqEf1IKuSr7GuMZ7tP?=
 =?us-ascii?Q?XHUiTAVUf0wzSEf2dhS/uIpN71YNa0+Lr0awJA3CwCB8hBMRRYeHVmJKBsS7?=
 =?us-ascii?Q?rfa0yONbsI7RzK2DrC6dIRRdPTQ83FeuD7WY6aV1CplPcyT5xdABi7WC14is?=
 =?us-ascii?Q?uE0zq3MULqbe/TMDCQH/lFaFnM0x4s1juV1gmohUvH66ye8aEfe7AUl45OwR?=
 =?us-ascii?Q?drxZC7iEh7HWptPNMUixRhm49HcZVsAdEPBriFPQ6q/oUc15aPs0r0DRho7z?=
 =?us-ascii?Q?SKThYhDi3OTZiM04U0ibHDAIIxxsK+S8uzhB9wl7DvBkj0ulzlgfdIw8aygv?=
 =?us-ascii?Q?0oxIZQS42woKEwDP7eSxk8Z9rfJhBVc1zZf+BKZ4Dg19lcSDrAezaZBxGDyb?=
 =?us-ascii?Q?8UnTa4ze4FN5R7NN8ejT0a0M7HxJF3txLZkIAZGtGy1dZc+xFU4R+/joXxwN?=
 =?us-ascii?Q?aheRtq62s1LqiUBFTctfGlwEuboD+m5+wctm1u+UjOImffB77vvf6QPgCygX?=
 =?us-ascii?Q?zkYPt0FxjYjTmoESgSt9S2c27QA4xutoNot3tHIGfmFRLpBXC3wB3bhbXp23?=
 =?us-ascii?Q?OPRvhmDdzl8S5GTG//M+fyjMJqBVFa0UFfEqoyrkrPZYJiJ14vJYe7MvFxrp?=
 =?us-ascii?Q?5ZN99VKGBiE6h0L1mgnA4uxb79UTue8ijV8o9tAXB/E7p0Mv4WVoCFwe6yje?=
 =?us-ascii?Q?9Cl9I5Iu29nhllMC8F902Uf2AdNXG7XtaGaZnBB3LSnsAg6ZTYuYiD8oaHk+?=
 =?us-ascii?Q?sA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(7416014)(1800799024)(82310400026)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 10:05:27.0237 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd6a6829-8173-480b-2ff8-08de318a5130
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9046
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbFcgi+mcwBCyLeRHn+7xiYfXwLvZh0oTJLJ3YRLxbg=;
 b=XZ5LsPkTXyg4OEUXCVZZbOBcmDF7hXJ/DN8k799fTQw5eXd4zuhlBJpCt07bG2Fi47FIlAHxur2DH4JhclebbZ20xrU7LBDccCJvmGCyuX5ERaex0nwmu3I/acf01S8f3xoAvEORHIqSTH11MUN3tuHyPtyPynU/vnpId2OibdU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=XZ5LsPkT
Subject: [Buildroot] [PATCH v1 3/3] board/versal2: add versal2 vek385 support
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
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add an example config for the Versal2 VEK385 evaluation board. This board has
the superset 2VE3858 device of the Versal AI Edge Gen 2 family with
8 Cortex-A78AE cores, 10 Cortex-R52 cores, 144 AIE-ML tiles and over 500k LUTs.

With this patch, Buildroot is capable to build a full image for the VEK385
evaluation board along with all the necessary firmware components.

More information about the VEK385 evaluation board can be found here:
https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vek385.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS                       |   2 +
 board/versal2/genimage.cfg       |   1 +
 board/versal2/post-build.sh      |   1 +
 board/versal2/post-image.sh      |  28 +++++
 board/versal2/readme.txt         | 181 +++++++++++++++++++++++++++++++
 configs/versal2_vek385_defconfig |  49 +++++++++
 6 files changed, 262 insertions(+)
 create mode 120000 board/versal2/genimage.cfg
 create mode 120000 board/versal2/post-build.sh
 create mode 100755 board/versal2/post-image.sh
 create mode 100644 board/versal2/readme.txt
 create mode 100644 configs/versal2_vek385_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 62d1e7f914..45229ecf41 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2482,6 +2482,7 @@ F:	package/libgudev/
 
 N:	Neal Frager <neal.frager@amd.com>
 F:	board/versal/
+F:	board/versal2/
 F:	board/xilinx/
 F:	board/zynq/
 F:	board/zynqmp/
@@ -2490,6 +2491,7 @@ F:	boot/xilinx-prebuilt/
 F:	configs/versal_vck190_defconfig
 F:	configs/versal_vek280_defconfig
 F:	configs/versal_vpk180_defconfig
+F:	configs/versal2_vek385_defconfig
 F:	configs/zynq_zc702_defconfig
 F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_kria_kd240_defconfig
diff --git a/board/versal2/genimage.cfg b/board/versal2/genimage.cfg
new file mode 120000
index 0000000000..3aa5543165
--- /dev/null
+++ b/board/versal2/genimage.cfg
@@ -0,0 +1 @@
+../versal/genimage.cfg
\ No newline at end of file
diff --git a/board/versal2/post-build.sh b/board/versal2/post-build.sh
new file mode 120000
index 0000000000..0130ff23d2
--- /dev/null
+++ b/board/versal2/post-build.sh
@@ -0,0 +1 @@
+../zynqmp/post-build.sh
\ No newline at end of file
diff --git a/board/versal2/post-image.sh b/board/versal2/post-image.sh
new file mode 100755
index 0000000000..36cd2eda19
--- /dev/null
+++ b/board/versal2/post-image.sh
@@ -0,0 +1,28 @@
+#!/bin/sh
+
+# By default U-Boot loads DTB from a file named "system.dtb", and
+# with versal2, the Linux DTB is the same as the U-Boot DTB, so
+# let's use a symlink since the DTB is the same.
+ln -fs "${BINARIES_DIR}/u-boot.dtb" "${BINARIES_DIR}/system.dtb"
+
+BOARD_DIR="$(dirname "$0")"
+
+cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
+	the_ROM_image:
+	{
+	  image {
+	    { type=bootimage, file=${BINARIES_DIR}/boot.pdi }
+	    { type=bootloader, file=${BINARIES_DIR}/plm.elf }
+	    { core=asu, file=${BINARIES_DIR}/asufw.elf }
+	  }
+	  image {
+	    id = 0x1c000000, name=apu_subsystem
+	    { type=raw, load=0x01000000, file=${BINARIES_DIR}/u-boot.dtb }
+	    { core=a78-0, cluster=0, exception_level=el-3, trustzone, file=${BINARIES_DIR}/bl31.elf }
+	    { core=a78-0, cluster=0, exception_level=el-2, file=${BINARIES_DIR}/u-boot.elf }
+	  }
+	}
+	__HEADER_EOF
+
+"${HOST_DIR}/bin/bootgen" -arch versal_2ve_2vm -image "${BINARIES_DIR}/bootgen.bif" -o "${BINARIES_DIR}/boot.bin" -w on
+support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
diff --git a/board/versal2/readme.txt b/board/versal2/readme.txt
new file mode 100644
index 0000000000..fd7d092cc4
--- /dev/null
+++ b/board/versal2/readme.txt
@@ -0,0 +1,181 @@
+This document describes the Buildroot support for the following
+Xilinx Versal Gen2 boards:
+
+******************************************
+Supported Versal Gen2 Boards:
+Xilinx VEK385 board
+******************************************
+
+Evaluation board features can be found here with the links below.
+
+VEK385:
+https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vek385.html
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make versal2_vek385_defconfig
+
+Compile everything and build the rootfs image:
+
+    $ make
+
+Result of the build
+-------------------
+
+After building, you should get a tree like this:
+
+    output/images/
+    +-- asufw.elf
+    +-- bl31.elf
+    +-- boot.bin
+    +-- bootgen.bif
+    +-- boot.pdi
+    +-- boot.vfat
+    +-- extlinux.conf
+    +-- Image
+    +-- plm.elf
+    +-- rootfs.ext2
+    +-- rootfs.ext4 -> rootfs.ext2
+    +-- sdcard.img
+    +-- system.dtb -> u-boot.dtb
+    +-- u-boot.dtb
+    `-- u-boot.elf
+
+How to write the SD card
+========================
+
+WARNING! This will destroy all the card content. Use with care!
+
+The sdcard.img file is a complete bootable image ready to be written
+on the boot medium. To install it, simply copy the image to an SD
+card:
+
+    # dd if=output/images/sdcard.img of=/dev/sdX
+
+Where 'sdX' is the device node of the SD.
+
+Eject the SD card, insert it in the board, and power it up.
+
+Support for other boards:
+=========================
+
+If you want to build a system for other boards based on the same SoC, and the
+board is already supported by the upstream kernel, U-Boot, and
+xilinx-prebuilt, you simply need to change the following Buildroot options:
+
+ - U-Boot (BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=<dts file name>")
+ - xilinx-prebuilt (BR2_TARGET_XILINX_PREBUILT_BOARD)
+
+Custom versal2 board support:
+
+To generate a boot.bin image, Versal2 boards require a PDI (Programmable Device
+Image) generated by Xilinx Vivado which contains all the hardware specific
+boot information, such as clock, MIO and DDR initializations as well as any
+customizations in the programmable logic. Since this PDI can only be generated
+by Xilinx Vivado, Buildroot needs access to the prebuilt image. The Buildroot
+xilinx-prebuilt package has support for Versal2 XSA files exported from Xilinx
+Vivado.
+
+Using the option BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA, Buildroot can obtain
+the prebuilt PDI from the XSA file.
+
+1) Start with a defconfig supported by Buildroot (e.g. VEK385)
+    make versal2_vek385_defconfig
+
+2) make menuconfig
+    Visit the following menu and enable BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
+
+    Bootloaders  --->
+        xilinx-prebuilt  --->
+            [*] download a prebuilt Versal XSA
+
+3) Within the same menuconfig, configure location of XSA. It can be in the
+   local file system or downloadable from an https:// location.
+
+    Bootloaders  --->
+        xilinx-prebuilt  --->
+            (<path to XSA>) URL of custom XSA
+
+4) make
+
+The resulting output/images will contain a boot.bin that includes the custom
+PDI file extracted from the Xilinx Vivado exported XSA file.
+
+How to write boot.bin to VEK385 OSPI boot flash
+=======================================================
+
+The VEK385 cannot be configured to boot from the SD card directly because it
+is connected to the 2VE3858 by a USB to SD card bridge and not connected
+directly. For this reason, the boot.bin needs to be in the OSPI flash for
+booting the first boot stage, and u-boot can then boot Linux and the file
+system from the SD card.
+
+For writing the boot.bin file to the OSPI flash the first time, it is
+recommended to use the board system controller with the instructions on the
+wiki page below:
+https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/2273738753/Versal+Evaluation+Board+-+System+Controller+-+Update+7
+
+Once the first boot.bin has been flashed and the VEK385 is able to boot into
+u-boot, u-boot can then be used for subsequent updates to the OSPI flash using
+the instructions below.
+
+VEK385 U-Boot Flashing Instructions:
+    $ usb start
+    $ sf probe
+    $ fatload usb 0 0x40000000 boot.bin
+    $ sf erase 0x0 +$filesize
+    $ sf write 0x40000000 0x0 $filesize
+
+If a valid boot.bin is already in the OSPI flash, it is possible to boot the
+Buildroot generated SD card image without updating the OSPI boot.bin image, so
+this is an optional step when just updating Linux and the file system.
+
+IMPORTANT NOTES for the VEK385
+=======================================================
+
+1) The base-design.pdi on the https://github.com/Xilinx/soc-prebuilt-firmware
+repo is designed for revB of the VEK385 and will not work properly on revA.
+Users should either create their own Vivado XSA file if they have a revA
+board, or make sure to get a VEK385 revB or newer board.
+
+2) The default u-boot bootcmd is not the distro_bootcmd that buildroot
+expects. When booting for the first time, please stop the boot in u-boot
+and run the following commands:
+    $ setenv bootcmd 'run distro_bootcmd'
+    $ saveenv
+    $ boot
+
+3) When using the 2025.2 release, the default u-boot env value for fdt_addr_r
+is 0x21000000 which overlaps with the OS image causing the following boot
+failure:
+
+Found /extlinux/extlinux.conf
+Retrieving file: /extlinux/extlinux.conf
+1:      linux
+Retrieving file: /Image
+append: console="ttyAMA1,115200" root="/dev/sdd2" rw rootwait
+Retrieving file: /system.dtb
+## Flattened Device Tree blob at 21000000
+   Booting using the fdt blob at 0x21000000
+ERROR: FDT image overlaps OS image (OS=20200000..21cf0000)
+EXTLINUX FAILED: continuing...
+
+This will be fixed with 2026.1 and future releases, but for 2025.2, users
+must run the following u-boot commands to change the default value.
+    $ setenv fdt_addr_r 0x31000000
+    $ saveenv
+
+4) Depending on the device tree used, the USB->SD card interface may not be
+probed as /dev/sdd as the probing order can vary based on the device tree
+configuration. To deal with this, users will need to change the last
+parameter of BR2_ROOTFS_POST_SCRIPT_ARGS to sda2, sdb2 or sdc2 depending on
+which corresponds to their configuration's USB->SD card.
+
+For example, the default value in the versal2_vek385_defconfig:
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA1,115200 sdd2"
+
+If the USB->SD card interface probed first, this would need to be changed to:
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA1,115200 sda2"
diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
new file mode 100644
index 0000000000..a2d57a0976
--- /dev/null
+++ b/configs/versal2_vek385_defconfig
@@ -0,0 +1,49 @@
+BR2_aarch64=y
+BR2_cortex_a78=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf riscv32-buildroot-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB=y
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal2/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal2/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA1,115200 sdd2"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.12_2025.2)/xlnx_rebase_v2.12_2025.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal2"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="VERSAL2_CONSOLE=cadence1"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.2)/xlnx_rebase_v2025.01_2025.2.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="amd_versal2_virt"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT_FORMAT_DTB=y
+BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal2-vek385-revB"
+BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_ASUFW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM=y
+BR2_TARGET_XILINX_PREBUILT=y
+BR2_PACKAGE_HOST_BOOTGEN=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
