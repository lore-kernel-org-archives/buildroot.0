Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415DCC6FD1C
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 14:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B98160757;
	Sun, 26 Mar 2023 14:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B98160757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2rGSDXPfSbvH; Sun, 26 Mar 2023 14:10:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1BBB60774;
	Sun, 26 Mar 2023 14:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1BBB60774
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21E571BF403
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 14:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1731409DD
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 14:10:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1731409DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DY5VJG_J7sj6 for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 14:10:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F1ED410A7
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F1ED410A7
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 14:10:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6hbWMI625DCD/V+cmYmNy89DMgG9IxjD+qLwR4OiIWXvAthFEHBVLyBymAlCGejOZJpP/0ESVh5q4+xQsGkvLQCChsVKb6ubDlWVcloyP4QndimLzji4XAKhjbqp1ozLm0xBWjjgTbNykzI/oxNV3DHGQ67jeCBIrcvmc/QOvabBDeRoN3bAkMyJ2hkN3LLmsgz0Ua2kf70bUBGJw/lZrp2nFVNdvZD+h4XKPZ5jFwkVB9lrQMYcSv4mYDRpu/pLO7Wh6yyEU8zYoSn/RNi1HRvTY21SvKGZj3Lf4tpjlFDRKBU4UI/FFWqchXs6FnQlDTF4mKIeUBtwss6+JC+GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2i9JWPiO5ZA+SsCT4QFy8hYnFuclfDPcejM9m1RtUuI=;
 b=Bn7zcfuCVH1PQEth99C8b8vcgDJVmZ/kpQl/Ow8fMETcLeDcBQxV4VsueqZmmnkg5wO51vQ5z16U5WeSxo8wNNONNuN6xFo5tYz5LVeipJxdTuog47I/9kqVUnGDc4G0DU19DfWe+pOYiCmfqIwHsjJQ/Fq4l6iLjxN1l1+5FV50rdwFGSV14V91HhmG5SrcP2+w3Irr+tL24Cm4qlKMoQUG4IU/gG0iI73Wo0dc37yh7to25R11T3kOMlbDb4LrabMfesElf1zNUH/eSRaPO11oUWCV80a0otPM3zXKKHkJP/AhQQ+ZXbTqwlSGIHgIYgx7RPVXlWmrxVl+3iNOGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CY5PR04CA0019.namprd04.prod.outlook.com (2603:10b6:930:1e::22)
 by SJ2PR12MB7893.namprd12.prod.outlook.com (2603:10b6:a03:4c6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Sun, 26 Mar
 2023 14:09:55 +0000
Received: from CY4PEPF0000C966.namprd02.prod.outlook.com
 (2603:10b6:930:1e:cafe::7) by CY5PR04CA0019.outlook.office365.com
 (2603:10b6:930:1e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41 via Frontend
 Transport; Sun, 26 Mar 2023 14:09:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000C966.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Sun, 26 Mar 2023 14:09:54 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 26 Mar
 2023 09:09:53 -0500
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Sun, 26 Mar 2023 09:09:52 -0500
To: <buildroot@buildroot.org>
Date: Sun, 26 Mar 2023 15:09:48 +0100
Message-ID: <20230326140949.11262-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C966:EE_|SJ2PR12MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: caa0e341-f6ed-4185-826f-08db2e03c5f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BD8MdwWFwk/I4Mw0vYQf2njSIp/6JzJBXvNy0PlRN6zg2JNnaeL2CAZpeOvC9yTj3DN1huxE0qIO4lvpP7+SFT/UxiMtFCZOrsvCw3gUV2a2BTV6HJypCJ8S2FlBbxypnTD5nAIWhy3HKFFyKlQqPJqNEGHiBWeZLu1+wuyRewrK3gVej5kztWeekw1n7GOwna9gSUUFXkoRn8nbPn4FOMDJeCVsBVqzZf8eegS+l7S+1vgA3qSNvP3sOQcExDBtzJrGcCQvENZTLOCVwAYbs7V3VcV94iQeX97Y1RnS+CFLHDtNnHXr2YX9vksafswOSF89GVLGZnFX9JRawiAd9YaVSGXtce6PsdQ0/QO+8LsNEqv1VZd+faFUCTfL0VSnKRLfiwGCjjbA1I4YTPZkKHNOi9AqAXIf+8OLG/a4lRMv1w0QGoqlk6l3YmJayOQey52ah36SHyFwiyNK9EYuS2AgVSBS1CV1wIWDtAwpnTPVBWg89BrzHd8Q77vWKwiZHSC6p8qkL/rIr2F/enJtQ7kHo4HGSHy7zWxs77FkLCs+69BmOhbBjyBWHXUFxdtpwLJnOr0ETOs/QRn8pncShf82WCBtQvHA75bNO4upMzVwlh8jger4JR54XbM1jEw3Ukbhu7d3DiIxlF7wWCJLA29GDiJZ3JbEXDzBuJKbPRudcb461aZE2i4g/HxpRk76Gne/hZ0DfxJWH2TqInp+/zwHtwwQhkq6S77htOpb2hE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(40470700004)(36840700001)(46966006)(6666004)(336012)(44832011)(70586007)(316002)(5660300002)(8936002)(81166007)(36860700001)(70206006)(82740400003)(2616005)(54906003)(2906002)(41300700001)(6916009)(4326008)(8676002)(426003)(47076005)(356005)(478600001)(40460700003)(82310400005)(36756003)(1076003)(966005)(86362001)(186003)(83380400001)(26005)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2023 14:09:54.2682 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: caa0e341-f6ed-4185-826f-08db2e03c5f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C966.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7893
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2i9JWPiO5ZA+SsCT4QFy8hYnFuclfDPcejM9m1RtUuI=;
 b=VjnsJ4x5r48wyInEVhoWDo7Pa4zeNXXGtr5VMbGeXdtT7jnCiLPfGcKfUJbEMydFqCBNdz24FI+bDwP1T4fr+D1+a28X3FT3QCYUZx7XQosj58HFC8oDgx/i5lT8ApePwL5MccN6AlHFUI2nfYW9eyrndy9e/dOnEtXuZK31UX4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=VjnsJ4x5
Subject: [Buildroot] [PATCH v1 1/2] package/zynqmp-firmware: new package
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

This patch adds a new package to buildroot for building the zynqmp pmufw
with the requirement that the user must provide an external microblaze
toolchain.

The below example config options can be used to build the pmufw.elf v2022.2
using the Xilinx toolchain.

BR2_PACKAGE_ZYNQMP_FIRMWARE=y
BR2_PACKAGE_ZYNQMP_FIRMWARE_VERSION="v2022.2"
BR2_PACKAGE_ZYNQMP_FIRMWARE_TOOLCHAIN_PATH="/opt/Xilinx/Vitis/2022.2/gnu/microblaze/lin"
BR2_PACKAGE_ZYNQMP_FIRMWARE_TOOLCHAIN_PREFIX="microblaze-xilinx-elf-"

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/zynqmp-firmware/Config.in             | 32 ++++++++++++++++
 ...misc-Makefile-build-par_libs-with-j1.patch | 31 +++++++++++++++
 package/zynqmp-firmware/zynqmp-firmware.mk    | 38 +++++++++++++++++++
 5 files changed, 103 insertions(+)
 create mode 100644 package/zynqmp-firmware/Config.in
 create mode 100644 package/zynqmp-firmware/v1-0001-pmufw-misc-Makefile-build-par_libs-with-j1.patch
 create mode 100644 package/zynqmp-firmware/zynqmp-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b6d288c54f..d3436d40f2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2151,6 +2151,7 @@ F:	configs/zynqmp_zcu106_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
 F:	package/bootgen/
 F:	package/versal-firmware/
+F:	package/zynqmp-firmware/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
diff --git a/package/Config.in b/package/Config.in
index 0f8dab3e71..6c7419490d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -450,6 +450,7 @@ menu "Firmware"
 	source "package/wilc-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
+	source "package/zynqmp-firmware/Config.in"
 endmenu
 	source "package/18xx-ti-utils/Config.in"
 	source "package/a10disp/Config.in"
diff --git a/package/zynqmp-firmware/Config.in b/package/zynqmp-firmware/Config.in
new file mode 100644
index 0000000000..3d0d0605f6
--- /dev/null
+++ b/package/zynqmp-firmware/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_ZYNQMP_FIRMWARE
+	bool "zynqmp-firmware"
+	help
+	  This package builds the PMU Firmware application required to run
+	  U-Boot and Linux in the Zynq MPSoC devices.
+
+if BR2_PACKAGE_ZYNQMP_FIRMWARE
+
+config BR2_PACKAGE_ZYNQMP_FIRMWARE_VERSION
+	string "firmware version"
+	default "v2022.2"
+	help
+	  Release version of zynqmp firmware.
+
+config BR2_PACKAGE_ZYNQMP_FIRMWARE_TOOLCHAIN_PATH
+	string "toolchain path"
+	default "/opt/Xilinx/Vitis/2022.2/gnu/microblaze/lin"
+	help
+	  Path to pre-installed microblaze toolchain.
+
+config BR2_PACKAGE_ZYNQMP_FIRMWARE_TOOLCHAIN_PREFIX
+	string "toolchain prefix"
+	default "microblaze-xilinx-elf-"
+	help
+	  Pre-installed microblaze toolchain prefix.
+
+config BR2_PACKAGE_ZYNQMP_FIRMWARE_KRIA_K26
+	bool "kria-k26"
+	help
+	  Adds additional CFLAGS for Kria K26 SOMs.
+
+endif # BR2_PACKAGE_ZYNQMP_FIRMWARE
diff --git a/package/zynqmp-firmware/v1-0001-pmufw-misc-Makefile-build-par_libs-with-j1.patch b/package/zynqmp-firmware/v1-0001-pmufw-misc-Makefile-build-par_libs-with-j1.patch
new file mode 100644
index 0000000000..adf866637b
--- /dev/null
+++ b/package/zynqmp-firmware/v1-0001-pmufw-misc-Makefile-build-par_libs-with-j1.patch
@@ -0,0 +1,31 @@
+From 4938b250982d440fec3a1bb838be10d9a73949aa Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Sun, 26 Mar 2023 13:38:02 +0100
+Subject: [PATCH v1 1/1] pmufw: misc/Makefile: build par_libs with -j1
+
+This patch fixes a build problem with the pmufw par_libs.  If the -j1
+make option is not used, then building the par_libs can fail when
+building on certain servers.  Using the -j1 option guarantees build
+success of the zynqmp_pmufw.
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ lib/sw_apps/zynqmp_pmufw/misc/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/sw_apps/zynqmp_pmufw/misc/Makefile b/lib/sw_apps/zynqmp_pmufw/misc/Makefile
+index a773498512..7f4d5540b0 100644
+--- a/lib/sw_apps/zynqmp_pmufw/misc/Makefile
++++ b/lib/sw_apps/zynqmp_pmufw/misc/Makefile
+@@ -17,7 +17,7 @@ endif
+ 
+ all:
+ 	$(MAKE) --no-print-directory seq_libs
+-	$(MAKE) -j --no-print-directory par_libs
++	$(MAKE) -j1 --no-print-directory par_libs
+ 	$(MAKE) --no-print-directory archive
+ 	@echo 'Finished building libraries'
+ 
+-- 
+2.17.1
+
diff --git a/package/zynqmp-firmware/zynqmp-firmware.mk b/package/zynqmp-firmware/zynqmp-firmware.mk
new file mode 100644
index 0000000000..3d33142258
--- /dev/null
+++ b/package/zynqmp-firmware/zynqmp-firmware.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# zynqmp-firmware
+#
+################################################################################
+
+ZYNQMP_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_ZYNQMP_FIRMWARE_VERSION))
+ZYNQMP_FIRMWARE_SOURCE = xilinx_$(ZYNQMP_FIRMWARE_VERSION).tar.gz
+ZYNQMP_FIRMWARE_SITE = https://github.com/Xilinx/embeddedsw/archive/refs/tags
+ZYNQMP_FIRMWARE_LICENSE = MIT
+ZYNQMP_FIRMWARE_LICENSE_FILES = license.txt
+ZYNQMP_FIRMWARE_INSTALL_IMAGES = YES
+ZYNQMP_FIRMWARE_INSTALL_TARGET = NO
+
+ZYNQMP_FIRMWARE_TOOLCHAIN_PATH = $(call qstrip,$(BR2_PACKAGE_ZYNQMP_FIRMWARE_TOOLCHAIN_PATH))
+ZYNQMP_FIRMWARE_TOOLCHAIN_PREFIX = $(call qstrip,$(BR2_PACKAGE_ZYNQMP_FIRMWARE_TOOLCHAIN_PREFIX))
+
+ifeq ($(BR2_PACKAGE_ZYNQMP_FIRMWARE_KRIA_K26),y)
+ZYNQMP_CFLAGS = "-Os -flto -ffat-lto-objects -DBOARD_SHUTDOWN_PIN=2 -DBOARD_SHUTDOWN_PIN_STATE=0 \
+		-DENABLE_EM -DENABLE_MOD_OVERTEMP -DENABLE_DYNAMIC_MIO_CONFIG -DENABLE_IOCTL \
+		-DCONNECT_PMU_GPO_2_VAL=0"
+else
+ZYNQMP_CFLAGS = "-Os -flto -ffat-lto-objects"
+endif
+
+define ZYNQMP_FIRMWARE_BUILD_CMDS
+	cd $(@D)/lib/sw_apps/zynqmp_pmufw/src && make \
+		COMPILER=$(ZYNQMP_FIRMWARE_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_TOOLCHAIN_PREFIX)gcc \
+		ARCHIVER=$(ZYNQMP_FIRMWARE_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_TOOLCHAIN_PREFIX)gcc-ar \
+		CC=$(ZYNQMP_FIRMWARE_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_TOOLCHAIN_PREFIX)gcc \
+		CFLAGS=$(ZYNQMP_CFLAGS)
+endef
+
+define ZYNQMP_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/lib/sw_apps/zynqmp_pmufw/src/executable.elf $(BINARIES_DIR)/pmufw.elf
+endef
+
+$(eval $(generic-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
