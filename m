Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CA2C71153
	for <buildroot@archiver.kernel.org>; Mon,  4 Sep 2023 10:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE19481BBD;
	Mon,  4 Sep 2023 10:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE19481BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rKZCVSaDHBud; Mon,  4 Sep 2023 10:06:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D477581D47;
	Mon,  4 Sep 2023 10:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D477581D47
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5ED351BF215
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 10:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37CFA81CA0
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 10:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37CFA81CA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kBUxUOQFGtNP for <buildroot@lists.busybox.net>;
 Mon,  4 Sep 2023 10:06:10 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01BEC81C46
 for <buildroot@buildroot.org>; Mon,  4 Sep 2023 10:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01BEC81C46
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NteKu883p0sad40FZyWJCOoKloKsmSPrabzdeWyWTDpjT/7+/UoPPm5gbyiPsAWGlZQUikdZA3fimPBWTMoF75n9hzHC85cPWJdGhwb/+zny2OkHeNb7oSwV1VKngn+lCP3ijfyumxvjc8UWlI8JUvKkhPdg4cIYJf+DVuFmP84E7X98ZSAgO9uA4WtYZgs4DWgACSdNZf5ZoXvYShd9UV4ceuZxbbiFMdFghYO3cZy4CX2c0G6fYC9fBk7vL/aCW++hogxL23F5ffbn/Xy7bJZ/awMTCKzZb297H30D8QFemXeELj4FebRnS+wLH3uWV7EVySsarKey06zCLCPoIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jI/80kB7j4otFrvvHY+EURJK42ALOthry0qfNe0Kj/c=;
 b=GBBKSuu5goEy2xurH3IqcDn847D5bFtdX7s7BIjpCeMfy7N3na2jIkFaHomXR3iFEnlBtLMnQVqfc22Cv0verhwqKZBO+I8iTzvcxEo2gib/4HY/bIAG2ZvZKG8DrsfaKS+VvXytv6fdQ4oBzxyCyL5xKiQzePj84vqgwqSPWkU73HmluXdKfB5seVXpJyjtyPceSKSkjdJaag0S4Y9IjF+BWSwo086n0dCuU+FRXtSdJB7PfTfejvJF70KavAYC80KIuxblk5NxOn39c6Z/cHcxK+LCZFxzTb66lM29YZKVz4QeLogduJCwOb4O3bTK5BtZE3DNzunK0nuQ6YxR/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CY8PR12CA0042.namprd12.prod.outlook.com (2603:10b6:930:49::21)
 by MN2PR12MB4127.namprd12.prod.outlook.com (2603:10b6:208:1d1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 10:06:03 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:930:49:cafe::51) by CY8PR12CA0042.outlook.office365.com
 (2603:10b6:930:49::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Mon, 4 Sep 2023 10:06:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.211) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Mon, 4 Sep 2023 10:06:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 05:05:53 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 4 Sep 2023 05:05:52 -0500
To: <buildroot@buildroot.org>
Date: Mon, 4 Sep 2023 11:04:42 +0100
Message-ID: <20230904100443.1613306-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230904100443.1613306-1-neal.frager@amd.com>
References: <20230904100443.1613306-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|MN2PR12MB4127:EE_
X-MS-Office365-Filtering-Correlation-Id: 873f6be9-c9ce-42aa-e724-08dbad2e8b9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iTJwAA7HqS1G+YbreRBDIM54wfaxYW3aDVVcjNfXnVai0dr48DEV1SxLOgXC4kmm1IV+j65ReaImY5hB6HTgX7sx1aXqg345wALxOEJznYfqhBT7KIeJAs1iD0k81K3x+IYl3imvYkqJAN2svPwPs1hNg32sCU6gdNVaayBdtC8jeooyy6vLxtdR3n/qrTGZyHlZZOGsm9vxt1AYJetSFjVFQzjfHme8y6PVTPnynbOCry3OVctf/R5SDC4+ejhZPILOd+E9h9CAdiRc7oeMmaeRKvBbpL4NYgijKx7UkBAXlDRKN3Huh8FItIMZ0NOFdHb60Bq54LKzszmC9zdvJs4uJ/SopYI5//UPRA23HaEUjgEfLg+ACYTnXsZxZtBm7r0RtELv8TMLhiTFJdJ4s3DM7b+xdRJq5BbUyY4doOA1ixHUThCS67ZHFpmAWBATYmK1F1ee4YofLbcAwYeFdnozXNYN6V9P81SqYVt9vEiXo7epxjBoU93/LGTQsU89yEH7H0hSTu7KVpTaQW/FrLSSmbC36+Dz+8sfpBrSeww3HnzmLoWcxKBaJr/H4iLr39tlLjzMKrzKIR6LUndEQGu6WXTLyI4eew2vKNOWbje9CtnVE2OKAiqYYbQT23vaV3PMb2V7DJRsKynBe0eluK1m+bxuGHb2vtvwoY7NMERMMz9Z1MtErwobBVeMgpbYSBwqq4lE4H1b0fJVw+tjyuiA8vw9Vzrxs2rCAv7shcH4wTmrydXBSpxilg9x9lok1s+Rx4J0mS4mnM2wBCakzA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(186009)(1800799009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(40460700003)(41300700001)(356005)(82740400003)(6666004)(81166007)(86362001)(478600001)(2616005)(83380400001)(336012)(26005)(1076003)(47076005)(36860700001)(40480700001)(426003)(70586007)(70206006)(2906002)(36756003)(54906003)(316002)(6916009)(30864003)(8676002)(8936002)(5660300002)(44832011)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 10:06:02.4315 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 873f6be9-c9ce-42aa-e724-08dbad2e8b9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4127
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jI/80kB7j4otFrvvHY+EURJK42ALOthry0qfNe0Kj/c=;
 b=i54QtTuijDAmQH+iQ8573y+Z4oSF/mUqyQbOYAXrF/krF5bbs46++Bt+I95R/H3iVr8vcaImHg74yGbMiZZEqFhHVBu63RFZ/DfpSiibM0gEvl8JmsES5AeVrrnAn7E3a7eCbUUX4ok6aVtoFOivroRmVO6faVKsAvb7IiFl2sc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=i54QtTui
Subject: [Buildroot] [PATCH v3 5/6] boot/zynqmp-firmware: new boot firmware
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a new boot firmware to buildroot for building the zynqmp pmufw.
It requires the toolchain-bare-metal package that includes a bare-metal
binutils, gcc and newlib which can be built for the microblaze architecture.

A patch is required to enable parallel building of the pmufw.  This patch has
been submitted upstream internally at AMD / Xilinx and will be included with
the 2023.2 release of the embeddedsw repository.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - builds a bare-metal gcc toolchain instead of requiring an external
   microblaze toolchain
V2->V3:
 - corrected custom cflags option
 - added support for xilinx_v2022.2 version
 - added zynqmp-firmware.hash
---
 DEVELOPERS                                    |   1 +
 boot/Config.in                                |   1 +
 boot/zynqmp-firmware/Config.in                |  22 ++++
 ...akefile-specify-sequential-Makefiles.patch |   1 +
 ...akefile-specify-sequential-Makefiles.patch | 115 ++++++++++++++++++
 boot/zynqmp-firmware/zynqmp-firmware.hash     |   3 +
 boot/zynqmp-firmware/zynqmp-firmware.mk       |  29 +++++
 7 files changed, 172 insertions(+)
 create mode 100644 boot/zynqmp-firmware/Config.in
 create mode 120000 boot/zynqmp-firmware/xilinx_v2022.2/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
 create mode 100644 boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
 create mode 100644 boot/zynqmp-firmware/zynqmp-firmware.hash
 create mode 100644 boot/zynqmp-firmware/zynqmp-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5978d79a06..361c6767da 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2192,6 +2192,7 @@ N:	Neal Frager <neal.frager@amd.com>
 F:	board/versal/
 F:	board/zynq/
 F:	board/zynqmp/
+F:	boot/zynqmp-firmware/
 F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index 9d7f5c4cb9..b105a43d27 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -22,5 +22,6 @@ source "boot/syslinux/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
+source "boot/zynqmp-firmware/Config.in"
 
 endmenu
diff --git a/boot/zynqmp-firmware/Config.in b/boot/zynqmp-firmware/Config.in
new file mode 100644
index 0000000000..3419a099e3
--- /dev/null
+++ b/boot/zynqmp-firmware/Config.in
@@ -0,0 +1,22 @@
+config BR2_TARGET_ZYNQMP_FIRMWARE
+	bool "zynqmp-firmware"
+	select BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL
+	help
+	  This package builds the PMU Firmware application required to run
+	  U-Boot and Linux in the Zynq MPSoC devices.
+
+if BR2_TARGET_ZYNQMP_FIRMWARE
+
+config BR2_TARGET_ZYNQMP_FIRMWARE_VERSION
+	string "firmware version"
+	default "xilinx_v2023.1"
+	help
+	  Release version of zynqmp firmware.
+	  Only versions xilinx_v2022.2 and newer are supported.
+
+config BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS
+	string "custom cflags"
+	help
+	  Adds additional CFLAGS for building zynqmp firmware.
+
+endif # BR2_TARGET_ZYNQMP_FIRMWARE
diff --git a/boot/zynqmp-firmware/xilinx_v2022.2/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch b/boot/zynqmp-firmware/xilinx_v2022.2/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
new file mode 120000
index 0000000000..51cb8a6ae0
--- /dev/null
+++ b/boot/zynqmp-firmware/xilinx_v2022.2/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
@@ -0,0 +1 @@
+../xilinx_v2023.1/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
\ No newline at end of file
diff --git a/boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch b/boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
new file mode 100644
index 0000000000..29c652d6ef
--- /dev/null
+++ b/boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
@@ -0,0 +1,115 @@
+From 23002defd462845db376425a7b7d975f3deba83d Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Mon, 24 Apr 2023 12:53:25 +0100
+Subject: [PATCH v1 1/1] pmufw: misc/Makefile: specify sequential Makefiles
+
+The BSP_SEQUENTIAL_MAKEFILES variable is not properly assigned and exported
+from copy_bsp.sh.
+
+Because of this, no library is built sequentially even if it was desired to
+build them sequentially by assigning to BSP_SEQUENTIAL_MAKEFILES. All the
+libraries are built in parallel.
+
+This patch resolves this issue, so that libraries that must be built
+sequentially are indeed built sequentially.
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ lib/sw_apps/zynqmp_pmufw/misc/Makefile    | 10 +++++++++-
+ lib/sw_apps/zynqmp_pmufw/misc/copy_bsp.sh |  7 -------
+ lib/sw_apps/zynqmp_pmufw/src/Makefile     |  2 ++
+ 3 files changed, 11 insertions(+), 8 deletions(-)
+
+diff --git a/lib/sw_apps/zynqmp_pmufw/misc/Makefile b/lib/sw_apps/zynqmp_pmufw/misc/Makefile
+index a773498512..fe2d23c965 100644
+--- a/lib/sw_apps/zynqmp_pmufw/misc/Makefile
++++ b/lib/sw_apps/zynqmp_pmufw/misc/Makefile
+@@ -7,6 +7,14 @@ PROCESSOR = psu_pmu_0
+ LIBRARIES = ${PROCESSOR}/lib/libxil.a
+ BSP_MAKEFILES := $(wildcard $(PROCESSOR)/libsrc/*/src/Makefile)
+ SUBDIRS := $(patsubst %/Makefile, %, $(BSP_MAKEFILES))
++DRIVERS_LIST=../drivers.txt
++SEQUENTIAL_MAKEFILES := $(shell cat ${DRIVERS_LIST})
++BSP_SEQUENTIAL_MAKEFILES = $(patsubst %, ${PROCESSOR}/libsrc/%/src/Makefile, $(SEQUENTIAL_MAKEFILES))
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilskey/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilfpga/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilsecure/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/dppsu/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/dpdma/src/Makefile
+ BSP_PARALLEL_MAKEFILES := $(filter-out $(BSP_SEQUENTIAL_MAKEFILES),$(BSP_MAKEFILES))
+ SEQ_SUBDIRS := $(patsubst %/Makefile, %, $(BSP_SEQUENTIAL_MAKEFILES))
+ PAR_SUBDIRS := $(patsubst %/Makefile, %, $(BSP_PARALLEL_MAKEFILES))
+@@ -16,7 +24,7 @@ ifneq (,$(findstring win,$(RDI_PLATFORM)))
+ endif
+ 
+ all:
+-	$(MAKE) --no-print-directory seq_libs
++	$(MAKE) -j1 --no-print-directory seq_libs
+ 	$(MAKE) -j --no-print-directory par_libs
+ 	$(MAKE) --no-print-directory archive
+ 	@echo 'Finished building libraries'
+diff --git a/lib/sw_apps/zynqmp_pmufw/misc/copy_bsp.sh b/lib/sw_apps/zynqmp_pmufw/misc/copy_bsp.sh
+index 197f7af844..ac8dd8249e 100755
+--- a/lib/sw_apps/zynqmp_pmufw/misc/copy_bsp.sh
++++ b/lib/sw_apps/zynqmp_pmufw/misc/copy_bsp.sh
+@@ -29,8 +29,6 @@ STANDALONE_DIR=$EMBEDDED_SW_DIR/lib/bsp/standalone/src
+ # libraries dir
+ SERVICES_DIR=$EMBEDDED_SW_DIR/lib/sw_services
+ 
+-BSP_SEQUENTIAL_MAKEFILES=
+-
+ # creation of BSP folders required
+ if [ -d $BSP_DIR ]; then
+ 	echo "BSP directory already exists"
+@@ -55,14 +53,12 @@ cp -r $SERVICES_DIR/xilfpga/src/interface/zynqmp/xilfpga_pcap.c $BSP_DIR/libsrc/
+ cp -r $SERVICES_DIR/xilfpga/src/*.h $BSP_DIR/include/
+ cp -r $SERVICES_DIR/xilfpga/src/interface/zynqmp/*.h $BSP_DIR/include/
+ rm -r $BSP_DIR/libsrc/xilfpga/src/interface/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilfpga/src/Makefile"
+ mkdir -p $BSP_DIR/libsrc/xilsecure/src/
+ cp -r $SERVICES_DIR/xilsecure/src/Makefile $BSP_DIR/libsrc/xilsecure/src/
+ cp -r $SERVICES_DIR/xilsecure/src/common/all/* $BSP_DIR/libsrc/xilsecure/src/
+ cp -r $SERVICES_DIR/xilsecure/src/zynqmp/* $BSP_DIR/libsrc/xilsecure/src/
+ cp -r $SERVICES_DIR/xilsecure/src/common/all/*.h $BSP_DIR/include/
+ cp -r $SERVICES_DIR/xilsecure/src/zynqmp/*.h $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilsecure/src/Makefile"
+ cp -r $SERVICES_DIR/xilskey/ $BSP_DIR/libsrc/
+ 
+ # remove the xilskey library files which are not required for PMU
+@@ -84,7 +80,6 @@ rm -r $BSP_DIR/libsrc/xilskey/src/include/xilskey_bbram.h
+ # copy the xilskey library header files to include directory
+ cp -r $BSP_DIR/libsrc/xilskey/src/*.h $BSP_DIR/include/
+ cp -r $BSP_DIR/libsrc/xilskey/src/include/*.h $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilskey/src/Makefile"
+ 
+ # copy bsp standalone code
+ cp -r $STANDALONE_DIR/common/*  $BSP_DIR/libsrc/standalone/src/
+@@ -113,7 +108,6 @@ do
+ 	if [ $line != "avbuf" ] && [ $line != "video_common" ]; then
+ 		cp $WORKING_DIR/x"$line"_g.c $BSP_DIR/libsrc/$line/src/
+ 	fi
+-	BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/$line/src/Makefile"
+ 
+ done < $DRIVERS_LIST
+ 
+@@ -136,4 +130,3 @@ cp $STANDALONE_DIR/profile/*.h  $BSP_DIR/include/
+ 
+ # no inbyte and outbyte present in standalone
+ cp $WORKING_DIR/inbyte.c $WORKING_DIR/outbyte.c  $BSP_DIR/libsrc/standalone/src/
+-export BSP_SEQUENTIAL_MAKEFILES
+diff --git a/lib/sw_apps/zynqmp_pmufw/src/Makefile b/lib/sw_apps/zynqmp_pmufw/src/Makefile
+index 1750c0a329..8747db5cdf 100644
+--- a/lib/sw_apps/zynqmp_pmufw/src/Makefile
++++ b/lib/sw_apps/zynqmp_pmufw/src/Makefile
+@@ -27,6 +27,8 @@ all: $(EXEC)
+ $(EXEC): $(LIBS) $(OBJS) $(INCLUDES)
+ 	$(CC) -o $@ $(OBJS) $(CC_FLAGS) $(CFLAGS) $(LN_FLAGS) $(LIBPATH) $(LSCRIPT)
+ 
++$(OBJS): $(LIBS)
++
+ $(LIBS):
+ 	echo "Copying BSP files"
+ 	../misc/copy_bsp.sh
+-- 
+2.17.1
+
diff --git a/boot/zynqmp-firmware/zynqmp-firmware.hash b/boot/zynqmp-firmware/zynqmp-firmware.hash
new file mode 100644
index 0000000000..ee2d656110
--- /dev/null
+++ b/boot/zynqmp-firmware/zynqmp-firmware.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  fc0e86027bdba53f5df373bcb38a171d61704db4ff1b4671f3886a87ceec7068  zynqmp-firmware-xilinx_v2022.2.tar.gz
+sha256  9850f893113936b9959cc76cc3e9152e30f815ff1acaa4b45f7a60fe3e1836f0  zynqmp-firmware-xilinx_v2023.1.tar.gz
diff --git a/boot/zynqmp-firmware/zynqmp-firmware.mk b/boot/zynqmp-firmware/zynqmp-firmware.mk
new file mode 100644
index 0000000000..695cec4b74
--- /dev/null
+++ b/boot/zynqmp-firmware/zynqmp-firmware.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# zynqmp-firmware
+#
+################################################################################
+
+ZYNQMP_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_VERSION))
+ZYNQMP_FIRMWARE_SITE = $(call github,Xilinx,embeddedsw,$(ZYNQMP_FIRMWARE_VERSION))
+ZYNQMP_FIRMWARE_LICENSE = MIT
+ZYNQMP_FIRMWARE_LICENSE_FILES = license.txt
+ZYNQMP_FIRMWARE_INSTALL_IMAGES = YES
+ZYNQMP_FIRMWARE_INSTALL_TARGET = NO
+ZYNQMP_FIRMWARE_DEPENDENCIES = host-newlib-bare-metal
+
+ZYNQMP_CFLAGS = "-Os -flto -ffat-lto-objects $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS))"
+
+define ZYNQMP_FIRMWARE_BUILD_CMDS
+	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(ZYNQMP_CFLAGS)
+endef
+
+define ZYNQMP_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/zynqmp_pmufw/src/executable.elf $(BINARIES_DIR)/pmufw.elf
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
