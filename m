Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DD2C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 14:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C572581D3A;
	Fri, 25 Nov 2022 14:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C572581D3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJM9Q6WD-8M9; Fri, 25 Nov 2022 14:08:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D63FA81D70;
	Fri, 25 Nov 2022 14:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D63FA81D70
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91D131BF30A
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 14:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A3BB60ABB
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 14:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A3BB60ABB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DSKVKsCcJRCk for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 14:08:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC86660AB9
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::616])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC86660AB9
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 14:08:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGPeOJSpV4JgTWBa6FE7zoSe/beIEl+NT0dyo5vCyc3K/KZgDnxf9pAn1AFINlz+4MXCac6I+62748ImsKAnk7V9F6LImYSv5yALMNIzWtonbggU196w2f9z2zbLzFWMAKqIrTtFN8ut1A6xowT20gelQcbidBDoW22tQUFy0KQJCMMm60xEL/enAguXx9i8znF3C2B4Uix/ovyGt82rSRU+vHNlY3w/SnDTES7eB8a29C5gyXRl6+VIh43h5bM7wGSTq6sNEd89Rm5+5xFs+9qzu7w1tnIVhgw8+y56bhIkNUCWKUdDSPcaK2r3h68/RPl0p2cYzP+JGGUytPorZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q70aQMvr1xGaFi0nXJiSVrQnWyI6dCJiAHUWTyped3A=;
 b=Tg6+SzuyFzAv3IMUF0FgpHFrVpW5+XIV3jOIPK1athcRT7bg92qDklAmV/ru5VE0UAO8BvOoKhiLx/z7gUXUyABJSGIdgah9MXgeLfHCsvw/7rS9vbXaP+zwUocEDcPeaoL7ZHX4xZv4L415gS8n7cw7b8t0Q8wI8kSJcXR1goAe7Qi0ddSRieNGbMkzLnmhVLIUWAMBnht9bIVzXHb29/Vt5pgScr2ynH8YeXPMkpc1WD4A6S1ASWBRHYEG76GihoCuMnAp5dvCKhQwFAHqTir7kyIbOhxMZwFup5od2Gyx/knMF+4i/EG8KDyePzYjjbevrQ/d6nQhlfkF1Eb0xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DM6PR06CA0046.namprd06.prod.outlook.com (2603:10b6:5:54::23) by
 PH7PR12MB7017.namprd12.prod.outlook.com (2603:10b6:510:1b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Fri, 25 Nov
 2022 14:08:05 +0000
Received: from DM6NAM11FT071.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::f5) by DM6PR06CA0046.outlook.office365.com
 (2603:10b6:5:54::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20 via Frontend
 Transport; Fri, 25 Nov 2022 14:08:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT071.mail.protection.outlook.com (10.13.173.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.17 via Frontend Transport; Fri, 25 Nov 2022 14:08:04 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 25 Nov
 2022 08:08:03 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 25 Nov
 2022 06:08:03 -0800
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 25 Nov 2022 08:08:02 -0600
To: <buildroot@buildroot.org>
Date: Fri, 25 Nov 2022 07:07:59 -0700
Message-ID: <20221125140800.38511-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT071:EE_|PH7PR12MB7017:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e23c6fe-628c-4c03-0fba-08daceee78c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bsadO2hr6r0quz4asdLXYrluKHngkP27fa5LYsq4uAw+c4amb8Z/DFkpeidS8Vbwku12Etyln0tb4bGLl7ejQTJIx/5QnRiEmDfW3LJ68JoPw48PkPksDzrpzAWBFC5VMpahCvcrpU+uj30REqPrNW0CNjBt5nbcMxCS+Xsx3PW4DuDW8SR5z9N8qare90G04eUd9VHhwUBvvyV5tvVNYk+0gL+SAVcZMqD7wiJtMTRR0AUzo6iypWcfkHpA/uTx3m5WbbYQRd7l/bwNxWaVdeElB340v7Pn1n/eZNVCZ9ZeePs3z4TprP/PyG4lHQ6uqnTazm68YpGO/2W/ZECY0bMwDtUuhyZdO6nSzX2MWUXD8FFAPuQfOOufhHme+LCXjrpuAaYrnNdVsEij4QwmbHSEf9Tq5YBT93rihsrzyyIE3rupQI44Hf3SMvy8BqrLmnbHrP5R4YZ+4TEQV/avDikvOQP4PizRka0Mub6ophJgQ0gycCjN+ctlVCA3K6zYs7n7l8WQ7rfExlGB3UXEfxfJo4amOvA/NIaT/3rvlZerDrHnYEGyo3oj4+XQejc2GW0bwbg6jmdvEGylQ8n06DJbvJc3OBEBPb+ChsPE1HD/8/84RxOqsAJ8XaXvWGzW8GnzA6Uve689JOGZFAKZec31B16cZwxvXOEJP1uq99Y8nBPJrfxL57YDRCpkndB3nt8yHthy2Z9qMT5wf8dnKS//lTlRS+s8uC1UYjwYBBSokgylP8i6QWyvn/l172yUwhaB31bXm/0dOmWqke0aOA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(46966006)(36840700001)(40470700004)(2906002)(82740400003)(356005)(40480700001)(81166007)(83380400001)(8936002)(41300700001)(36756003)(44832011)(316002)(54906003)(6916009)(86362001)(336012)(1076003)(2616005)(426003)(186003)(82310400005)(26005)(47076005)(5660300002)(6666004)(70586007)(478600001)(70206006)(36860700001)(8676002)(966005)(4326008)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 14:08:04.9374 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e23c6fe-628c-4c03-0fba-08daceee78c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT071.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7017
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q70aQMvr1xGaFi0nXJiSVrQnWyI6dCJiAHUWTyped3A=;
 b=uxPBmG0L1FHV0pUS9w/OJtMuxE6XBlg2zoEsQDYNgNA67Ozxsk6tC0oqURgHVEkupyAsUwehmLW0+8cmAirVpfavhgm4Zyf8+lpQwVLbcMXSCyMPNrTb/Kraboq4Y6HFvIwU53jDj7ITfgr8MU3hYNhfmBgKXLi+P0JbmRVNl3g=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=uxPBmG0L
Subject: [Buildroot] [PATCH v7 1/2] package/versal-firmware: new package
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
Cc: terry.oneal@amd.com, luca.ceresoli@bootlin.com, kris.chaplin@amd.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support for downloading versal microblaze firmware binaries.
These are necessary for booting Xilinx versal devices.

The location of these binaries is temporary, and will soon be added to the
Xilinx firmware repository.  The temporary location is using the same free
distribution license as the Xilinx firmware repository.

Once these files are available on the Xilinx repository, this package will
be updated to the new location.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - set defaults for version and board name
  - improved format of install commands
V2->V3:
  - no changes
V3->V4:
  - no changes
V4->V5:
  - no changes
V5->V6:
  - no changes
V6->V7:
  - removed incorrect GPL licensing
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/versal-firmware/Config.in          | 24 ++++++++++++++++++++++
 package/versal-firmware/versal-firmware.mk | 23 +++++++++++++++++++++
 4 files changed, 49 insertions(+)
 create mode 100644 package/versal-firmware/Config.in
 create mode 100644 package/versal-firmware/versal-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 569d58407a..c51bd65f09 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2155,6 +2155,7 @@ F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
 F:	package/bootgen/
+F:	package/versal-firmware/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
diff --git a/package/Config.in b/package/Config.in
index aef80f9ab0..ebc7df10ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -443,6 +443,7 @@ menu "Firmware"
 	source "package/sunxi-boards/Config.in"
 	source "package/ts4900-fpga/Config.in"
 	source "package/ux500-firmware/Config.in"
+	source "package/versal-firmware/Config.in"
 	source "package/wilc-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
diff --git a/package/versal-firmware/Config.in b/package/versal-firmware/Config.in
new file mode 100644
index 0000000000..8d13816149
--- /dev/null
+++ b/package/versal-firmware/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_VERSAL_FIRMWARE
+	bool "versal-firmware"
+	depends on BR2_aarch64
+	help
+	  Pre-built firmware files for Xilinx Versal boards.
+
+	  https://github.com/nealfrager/buildroot-firmware
+
+if BR2_PACKAGE_VERSAL_FIRMWARE
+
+config BR2_PACKAGE_VERSAL_FIRMWARE_VERSION
+	string "firmware version"
+	default "v2022.2"
+	help
+	  Release version of Versal firmware.
+
+config BR2_PACKAGE_VERSAL_FIRMWARE_BOARD
+	string "board name"
+	default "vck190"
+	help
+	  Name of Versal target board.
+	  Used for installing the appropriate firmware.
+
+endif # BR2_PACKAGE_VERSAL_FIRMWARE
diff --git a/package/versal-firmware/versal-firmware.mk b/package/versal-firmware/versal-firmware.mk
new file mode 100644
index 0000000000..6fbe7c8935
--- /dev/null
+++ b/package/versal-firmware/versal-firmware.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# versal-firmware
+#
+################################################################################
+
+VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_SITE = $(call github,nealfrager,buildroot-firmware,$(VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_LICENSE = "Xilinx-Binary-Only"
+
+VERSAL_FIRMWARE_LICENSE_FILES = LICENSE
+
+VERSAL_FIRMWARE_INSTALL_TARGET = NO
+VERSAL_FIRMWARE_INSTALL_IMAGES = YES
+
+define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(foreach f,plm.elf psmfw.elf vpl_gen_fixed.pdi,\
+		$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_$(f) \
+			$(BINARIES_DIR)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_$(f)
+	)
+endef
+
+$(eval $(generic-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
