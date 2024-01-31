Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96FAC47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 11:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70F62614F1;
	Wed, 31 Jan 2024 11:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70F62614F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dTlMFi4M2ymf; Wed, 31 Jan 2024 11:23:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F0B561558;
	Wed, 31 Jan 2024 11:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F0B561558
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 453A61BF5E6
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F2E54017B
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F2E54017B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7UyJ5_ju9kFh for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 11:23:48 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::601])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 818644012F
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 11:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 818644012F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lh+lGTK2TrTZPX4cfk+a35nAHl1v3834K2V0jbrL762rrvZS1qf/wRSjZXquw8KPYKLnFC5y8dXaxFmZhrw8GYVu8ori/YQaRWfpeu6GtTVcbzYeSShTYWiamQWCzwb4Cmuk+oyJDvKrJ7t7s87/7Wxj+Uro8M2xaNuVD8VWAWUTj/G0/QpUDzLhvN4ikZfcZ21yN1bdA3wDdXjR7IjGdk9PMPPuU6BphNxfXDBN+m/mufsI8QBCIFAbi6zzxlijH15MMxlxcgphLJx5/FVHOgndsxF82TRWyKQ+Q7hjRlQYVF3SCjRggnMoYq9mbI0R4+GhJeBIituyW8bmuVkd1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Boi5YO1CgIrXv38PIoOb2h0x/zNzYUDMscXG8eQA74=;
 b=erA9gZam99XR/K9dEC7JNLay1l2BdGULeK38GSOtbVZ3grw0HrMCyWGmy7wzF+pTwSKg4JUShy21GchxjfozLcXkIiE8jWQC3yQQzTu/pcwvddEPDZMHMx4mKOhQQrJHZsqzeANWHz9NyOEAJRsoZ2miKGsFYZVfw6WKKPY46/78dZICFmgV9BLcIqqdkU8jPd89I58gztBCmSZftFOGTjfc/72DT277VtZ2j4c/j/ITD/2FiJM+a5rONMpengZdc+j0XHkF42p5RgpyXa+4/ad+ML3OGpQ/mlYktVla0jOqLJlxIAOOxeo8mSTZM8IVmu/Aju/0Wlb72sR2mLTaBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR11CA0048.namprd11.prod.outlook.com (2603:10b6:a03:80::25)
 by CY5PR12MB6059.namprd12.prod.outlook.com (2603:10b6:930:2c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 11:23:44 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:a03:80:cafe::1f) by BYAPR11CA0048.outlook.office365.com
 (2603:10b6:a03:80::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24 via Frontend
 Transport; Wed, 31 Jan 2024 11:23:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 31 Jan 2024 11:23:44 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 05:23:43 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 31 Jan 2024 05:23:42 -0600
To: <buildroot@buildroot.org>
Date: Wed, 31 Jan 2024 11:22:18 +0000
Message-ID: <20240131112223.2175855-6-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131112223.2175855-1-neal.frager@amd.com>
References: <20240131112223.2175855-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|CY5PR12MB6059:EE_
X-MS-Office365-Filtering-Correlation-Id: 00c952cd-87ce-4d72-f33c-08dc224f15cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: thNuarEllfdpUkjugxtH26gYE2CZLidnPKO0X13/bmMHI3B8Vsjx42r2CsOXpWRCcnwMoJ90ml0Nqza1YlPwDiQkqKaZSl/mrA31R6GSMoaKHVwrvDa5/eRWg/yv77jNgGCiiu8Mi77N4UEIBwTTS6axImcaOXE9VnjIIVppP0j8fT0kftfQgVjDTVl0DcJoaR/hidTCxXWqFEd61KE7j13GqHo+E1QSoXoKnzoMAQBOuG5L0Poa10hrowHIJ2vtxIctunmbfQrqfjsttchAiJVbVSYy25XBSmfrjBhf5FAsPmEaLnRH20Ah1J1GZZCg+MGNUxQu0hbxBVl6UI6uEMOwWejCagVEXNBPGFX/IDqxnwGvL+yHzdY9AGkcJWDJwY7GoudxSrNRjWs7uyi1fP80q37UIoGIjiVoWRU4hmzzckD54pciGAucstVtTZgwyUNpgUtUMXRIEU3PITBanvlyzjyDaoJXXLLiDZZP7TVwguECNiKBuw6TM6x31Kc6THq5NHCo2SoDgCCO2Xu6vnulQOdaLgLvHyyUv0V+nMdY9VnT9eWAqWgid2VpWnuymUgvpD6k76vW9KFSE1pS5qrSd/xR2uDWBEx2HYGb9uSDfXi/Lq1qUZTn74B4GwkCDEt3GNXUOVsTdnDb1OUAeAXeZ5MHFNeTHRXArTWtQd1VOGg98rQ/646OIO/7z9x0/q+USp15GUbC41r9L5K4LMnnLVqKL8LkisQ/sYIb1RI9Q/0makJhdAIhK3KPt2iOtkcwvTzPwgD+PLq0Z71VQgAV05DTw2/OOFirb5tcs5tyXGajTAAbVyCpcTygLaAN
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(230173577357003)(230273577357003)(451199024)(1800799012)(186009)(64100799003)(82310400011)(40470700004)(36840700001)(46966006)(83380400001)(41300700001)(47076005)(26005)(2616005)(336012)(426003)(1076003)(356005)(82740400003)(81166007)(36860700001)(8936002)(8676002)(4326008)(5660300002)(30864003)(2906002)(478600001)(44832011)(70586007)(6666004)(54906003)(6916009)(70206006)(316002)(86362001)(36756003)(40480700001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 11:23:44.2697 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c952cd-87ce-4d72-f33c-08dc224f15cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6059
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Boi5YO1CgIrXv38PIoOb2h0x/zNzYUDMscXG8eQA74=;
 b=YFZPEy9rUk2K1C+8fUI43U95r6nmvSkSvYkVaR9/nGdP4EEIEZYJjpTcTGKV84/jH1CdNrHjIxkr0Jes7fBMg9fIpOQTMsC8+TQBnJQxzgYehATX/NX8B89YHBzFl8TOnFAe2wmm/TdHTHk5U1dPQrHriwYg9FWi7A1ypoYYB2E=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=YFZPEy9r
Subject: [Buildroot] [PATCH v9 06/11] boot/zynqmp-firmware: new boot firmware
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
been submitted upstream internally at AMD / Xilinx and is included with the
2023.2 release of the embeddedsw repository.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - builds a bare-metal gcc toolchain instead of requiring an external
   microblaze toolchain
V2->V3:
 - corrected custom cflags option
 - added support for xilinx_v2022.2 version
 - added zynqmp-firmware.hash
V3->V4:
 - no changes
V4->V5:
 - reduced all lines to <80 chars
V5->V6:
 - migrated to toolchain-bare-metal-buildroot
V6->V7:
 - removed patch numbers
 - changed dependency to toolchain-bare-metal-buildroot
 - removed hash since version is configurable
V7->V9:
 - no changes
---
 DEVELOPERS                                    |   1 +
 boot/Config.in                                |   1 +
 boot/zynqmp-firmware/Config.in                |  22 ++++
 ...akefile-specify-sequential-Makefiles.patch |   1 +
 ...akefile-specify-sequential-Makefiles.patch | 115 ++++++++++++++++++
 boot/zynqmp-firmware/zynqmp-firmware.mk       |  33 +++++
 6 files changed, 173 insertions(+)
 create mode 100644 boot/zynqmp-firmware/Config.in
 create mode 120000 boot/zynqmp-firmware/xilinx_v2022.2/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
 create mode 100644 boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
 create mode 100644 boot/zynqmp-firmware/zynqmp-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 057eac7845..fcb3734229 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2234,6 +2234,7 @@ N:	Neal Frager <neal.frager@amd.com>
 F:	board/versal/
 F:	board/zynq/
 F:	board/zynqmp/
+F:	boot/zynqmp-firmware/
 F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc702_defconfig
 F:	configs/zynq_zc706_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index e5fdf7ad43..c7478fef2e 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -24,5 +24,6 @@ source "boot/ti-k3-image-gen/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
+source "boot/zynqmp-firmware/Config.in"
 
 endmenu
diff --git a/boot/zynqmp-firmware/Config.in b/boot/zynqmp-firmware/Config.in
new file mode 100644
index 0000000000..b567efe634
--- /dev/null
+++ b/boot/zynqmp-firmware/Config.in
@@ -0,0 +1,22 @@
+config BR2_TARGET_ZYNQMP_FIRMWARE
+	bool "zynqmp-firmware"
+	select BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
+	help
+	  This package builds the PMU Firmware application required
+	  to run U-Boot and Linux in the Zynq MPSoC devices.
+
+if BR2_TARGET_ZYNQMP_FIRMWARE
+
+config BR2_TARGET_ZYNQMP_FIRMWARE_VERSION
+	string "firmware version"
+	default "xilinx_v2023.2"
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
index 0000000000..92dedc7e81
--- /dev/null
+++ b/boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
@@ -0,0 +1,115 @@
+From 23002defd462845db376425a7b7d975f3deba83d Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Mon, 24 Apr 2023 12:53:25 +0100
+Subject: [PATCH] pmufw: misc/Makefile: specify sequential Makefiles
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
index 0000000000..383d888fba
--- /dev/null
+++ b/boot/zynqmp-firmware/zynqmp-firmware.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# zynqmp-firmware
+#
+################################################################################
+
+ZYNQMP_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_VERSION))
+ZYNQMP_FIRMWARE_SITE = \
+	$(call github,Xilinx,embeddedsw,$(ZYNQMP_FIRMWARE_VERSION))
+ZYNQMP_FIRMWARE_LICENSE = MIT
+ZYNQMP_FIRMWARE_LICENSE_FILES = license.txt
+ZYNQMP_FIRMWARE_INSTALL_IMAGES = YES
+ZYNQMP_FIRMWARE_INSTALL_TARGET = NO
+ZYNQMP_FIRMWARE_DEPENDENCIES = toolchain-bare-metal-buildroot
+
+CUSTOM_CFLAGS = $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS))
+ZYNQMP_FIRMWARE_CFLAGS = "-Os -flto -ffat-lto-objects $(CUSTOM_CFLAGS)"
+
+define ZYNQMP_FIRMWARE_BUILD_CMDS
+	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(ZYNQMP_FIRMWARE_CFLAGS)
+endef
+
+ZYNQMP_PMUFW = $(@D)/lib/sw_apps/zynqmp_pmufw/src/executable.elf
+
+define ZYNQMP_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0755 $(ZYNQMP_PMUFW) $(BINARIES_DIR)/pmufw.elf
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
