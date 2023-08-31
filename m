Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300D3C83F01
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 14:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC28441885;
	Thu, 31 Aug 2023 14:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC28441885
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4pvHpFC4AslX; Thu, 31 Aug 2023 14:52:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC6604189A;
	Thu, 31 Aug 2023 14:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC6604189A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EE471BF418
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 14:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 461C041827
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 14:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 461C041827
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kXNXGCPdSFYG for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 14:52:09 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::61a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB534417CB
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 14:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB534417CB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YW6L3aNuqkepnRLltmeDR6cs4RELBCo6UoAEyD2HyA09FWGR7Y4+ieemwa+jruanTCCATzUpseSq2sThZf50L+VP5y1RJ+ytTHw46EesvKkmBLrsple8/HSc199vWV5TIxM8gifGLLQaYo5UnMxFykpDgX4qt0Obp3HQzf35p+ruULpuzOMMZY4SKMMs2sKVQYRs0YQxpA00Z9clvZojfcJIHcm2fwOINI0nNCv3vsTMUp6D8F7g5I5YcEvD5hv3lICP99xKk6o++etomRicOy2PgRNSTX6sCnXPAQ6nwmdn4C5WGO8lLjVFqgwFObCU4elEyWLyDBnHMpkjO2Y1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygUmIbp+vmyfI4UlwgHJHHinp16PRQZBSGN70cvQFjc=;
 b=JsGv1ERDgFa0m3O/F3tSXgf8uj+pk6Waxa7uCMRrhCbLNIW3OB7P7WKPmXB4grcYoA+WybTz5Ylk2yx3KiRmRd3BAIet6oFoqqW93C8E2yT0UwMv5tqusUyFRwH7Tin3+jhV47FJbriThGdUQwRlrfczg/SUzVVmYDdGQglhryDXL8fNcOjv1c70OLMBH3EcITvxtLBNRJ3Z1nB7WLaBKFcaFDVShn/f/n/+PU2iK5vY0Tcs9ajBqy/I/KnKIuIR2eJkphyr1WbSGl0GixIfqHL6TcEm9Xr3BBrpyzrBQUZBMf/PVGNwwYZ5u1lJ/0CQ4Zb/nwjY2j/kuoXFLdMPYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CH2PR08CA0022.namprd08.prod.outlook.com (2603:10b6:610:5a::32)
 by DS7PR12MB6008.namprd12.prod.outlook.com (2603:10b6:8:7f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.37; Thu, 31 Aug
 2023 14:52:06 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::f4) by CH2PR08CA0022.outlook.office365.com
 (2603:10b6:610:5a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21 via Frontend
 Transport; Thu, 31 Aug 2023 14:52:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.20 via Frontend Transport; Thu, 31 Aug 2023 14:52:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 09:52:04 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 31 Aug 2023 09:52:03 -0500
To: <buildroot@buildroot.org>
Date: Thu, 31 Aug 2023 15:51:39 +0100
Message-ID: <20230831145140.2537382-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831145140.2537382-1-neal.frager@amd.com>
References: <20230831145140.2537382-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|DS7PR12MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef58c29-f903-4195-cc43-08dbaa31d85e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zej6uXMOO+vZB/E8J0gh1lqGHfSLcg8EHSZ/RyIBqFHX/GQISNx9E/StKxCctfFY1ZHWEx+ao2CZIJLpix1/H9ZLz3JvpH7HG1HQT7SmIAo032nHfgoBOSBLWvk874UGUtWszrYik7+ozuHg95pnGpLIKusUNTyKaQxXcBI/Kuw13Cm9G53U1I3ZPFL+I3eK5+ijy2KJ2+myUgixjUsuFpdX+7apw6vYrEAMtAt8tIZaq7J6D297KL+atr1HP/Xt1I+POr7yF5Ws8xI+3VZZGk2QanDOqd+Ano8OAcrAes7J2wuqCHVzNPHIb9fwz+ibi7YKS8TUZPNit0Qqa5VjHKHkAbGDD3T/nmNvRPK6/UIjpn1i2Tz5w2qIIYZQIVHLZESD/oXi4BVgjf8/9HcsxP4uE9h57KWano+fIU9K+ajnUQTc5H3VnM8aCGMs9TTKJiSJ8LmQNTWnaBR31Q5tIHIM8V/jf8pSeRQSIO06zLaq4QNCFyeXPPr/RnsIjt4onB+Cclr/oB5XcgFtBSwL8+vgjeCyPA8fzd4bI6mA948aRonKtzHJDv+iecCtE3ZhMzJph4dHtJspTbZKCcqpSOZ+/nMkfEX4AQvE3o6myYkzWo/1jNfp1R/ZMtVuk9KDoJ0WDtJWrq6uAGi6comoyZriMLBy/6S2mGQyHm+qT68xfGcuVp0PqYtFgHOU3ExCbh67XfsRrvKcisnGBWgslBNtHrrA2424OSjwS8piQgi3VNoS3+C7yL2yZ9sXgBDCMtZvrQoADQ5GD+yhRKje4g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(39860400002)(136003)(376002)(82310400011)(1800799009)(186009)(451199024)(40470700004)(36840700001)(46966006)(36860700001)(40460700003)(47076005)(26005)(44832011)(40480700001)(5660300002)(1076003)(336012)(6666004)(426003)(6916009)(316002)(86362001)(81166007)(83380400001)(82740400003)(356005)(70206006)(70586007)(54906003)(478600001)(41300700001)(8936002)(8676002)(36756003)(4326008)(2616005)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 14:52:06.2642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef58c29-f903-4195-cc43-08dbaa31d85e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6008
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygUmIbp+vmyfI4UlwgHJHHinp16PRQZBSGN70cvQFjc=;
 b=4lNTG2lf2/cbR+3H6mlm140P+MhyTum7H3y3HTU91M24FcbWG5qy1dPkquO8dJq00ysnGTlEc9v54hhUTQtQbfpfpg76LBBjlIxdOOs6SW0J8Cg8XWjsKlmISEgjQOw+979KoBDlvTo8VJXxJbjryQFc5xXkIi0rJv3jtgffSvQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=4lNTG2lf
Subject: [Buildroot] [PATCH v2 5/6] boot/zynqmp-firmware: new boot firmware
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
---
 DEVELOPERS                                    |   1 +
 boot/Config.in                                |   1 +
 boot/zynqmp-firmware/Config.in                |  21 ++++
 ...akefile-specify-sequential-Makefiles.patch | 115 ++++++++++++++++++
 boot/zynqmp-firmware/zynqmp-firmware.mk       |  29 +++++
 5 files changed, 167 insertions(+)
 create mode 100644 boot/zynqmp-firmware/Config.in
 create mode 100644 boot/zynqmp-firmware/v1-0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
 create mode 100644 boot/zynqmp-firmware/zynqmp-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8ddb629f05..1dd68ecc85 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2191,6 +2191,7 @@ N:	Neal Frager <neal.frager@amd.com>
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
index 0000000000..3208a24d61
--- /dev/null
+++ b/boot/zynqmp-firmware/Config.in
@@ -0,0 +1,21 @@
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
+
+config BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS
+	string "custom cflags"
+	help
+	  Adds additional CFLAGS for building zynqmp firmware.
+
+endif # BR2_TARGET_ZYNQMP_FIRMWARE
diff --git a/boot/zynqmp-firmware/v1-0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch b/boot/zynqmp-firmware/v1-0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
new file mode 100644
index 0000000000..29c652d6ef
--- /dev/null
+++ b/boot/zynqmp-firmware/v1-0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
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
diff --git a/boot/zynqmp-firmware/zynqmp-firmware.mk b/boot/zynqmp-firmware/zynqmp-firmware.mk
new file mode 100644
index 0000000000..5ed3af360b
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
+ZYNQMP_CFLAGS = "-Os -flto -ffat-lto-objects $(call qstrip,$(BR2_PACKAGE_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS))"
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
