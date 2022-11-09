Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FE9C433FE
	for <buildroot@archiver.kernel.org>; Wed,  9 Nov 2022 09:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72B0E40B00;
	Wed,  9 Nov 2022 09:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72B0E40B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MqQcEWJ87SEq; Wed,  9 Nov 2022 09:12:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8818640AF5;
	Wed,  9 Nov 2022 09:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8818640AF5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6843E1BF5B5
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 09:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FE06607F1
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 09:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FE06607F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cm5z0b05O8-A for <buildroot@lists.busybox.net>;
 Wed,  9 Nov 2022 09:12:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D5D16068A
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2065.outbound.protection.outlook.com [40.107.212.65])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D5D16068A
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 09:12:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9C3uOJ8QVTtC8NIEkO+r7TL0+C6Nhw/VPzcNPec874xawuTQnG4bbAhxllSVH7kgOS3DvynMM3l1X+3l4adEe6C0c86NRA9KAWLHUSRkNTaLAnEUGuCKi0Pd1hzocRczo58/+0kTRheWkkMwBrjuEzzTWbspqmVCSTNojPfyY/nt/IqMqYz1GKQljQN+KXfKXHZ3OfdPFW1OqyfTKvYJhx3myXvNiZA97xz/2gidcR8owZYBQKxwYj3p1CpgpnaLmKYxPBO6e5StipsEOWuyx3pBvw2bMBOyDheuIuaQ1IhkvWmjbPKDgwLdWg8ME/Co3vDGtnPQ5UT2Hldyyijtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+yVZLD0l55jg++ekB6rwLg4ash8zPKEfBYrZQVFRxg=;
 b=A9wPlApKSQYWexCCbSoRdk/Ef7KSLKZwXwoX9PXBowQ636yVx1eul5gUyH1V0PWCqAeyPKAOCSBMyv2rVkODbqIobC4iybYG7VR7xEeWG1RRc4LwQrlcR5a7E00h+jx2Vg6+Kkedj1n5ekbMoMeu7wLgE3TKBEXkQikIgjPDY3cALLBAS1u7xN2FFen6Z2uQ6T6vHQOJ0hWiCUQbLZxXxHpRzMU1qvR0Br0Jx6fBpglocdHXO+4W6VsZ0fJjTcwU1LgQ67D6axklywTvIn1/lZ73UhldalN+DOzIyn4Xo9rmcVwrBZgyTPOyOrTxsKVFcnYEd2yaeXL3WuRIvHbIQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CY5PR14CA0011.namprd14.prod.outlook.com (2603:10b6:930:2::20)
 by BY5PR12MB4179.namprd12.prod.outlook.com (2603:10b6:a03:211::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 9 Nov
 2022 09:12:19 +0000
Received: from CY4PEPF0000B8EF.namprd05.prod.outlook.com
 (2603:10b6:930:2:cafe::45) by CY5PR14CA0011.outlook.office365.com
 (2603:10b6:930:2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Wed, 9 Nov 2022 09:12:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8EF.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.11 via Frontend Transport; Wed, 9 Nov 2022 09:12:18 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 9 Nov
 2022 03:12:18 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 9 Nov
 2022 01:12:17 -0800
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Wed, 9 Nov 2022 03:12:17 -0600
To: <buildroot@buildroot.org>
Date: Wed, 9 Nov 2022 02:12:13 -0700
Message-ID: <20221109091214.65185-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EF:EE_|BY5PR12MB4179:EE_
X-MS-Office365-Filtering-Correlation-Id: baeab93d-77c5-4258-d0bf-08dac23280a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uhjTJe6Vd5Utk9ASeCRqLEo88t5/p7gicOTgh0JocGFnzwrASpL8QNWL6QMqBHj0+AKtaN/UcRFHyC+XyeOVK/RpSDZMeduRMslMmvJBuZ1oDCR5D1TbMtM0hdXTnUveba465UrExP69wZbwcaIVcoySvvgB3AKm1Ps+9ZwJv386ds3N9ddHywYRxKWM6xH2HBpyy3Hm98NcnkdWQtSBFfrRPIk8r7UEXJzbQ0QBjTxHQLFb6UMf3c/c8CuuFU8iMDbMRBG75qhSTlDVvMysTmdmSFBGPaX2ifjbSpfuQJX8lQj4VgDra5sETfVNjk+GcQcj6+jLmHFDX8YG2FCenHLwbgI9TKhyhklp2pGlDE34EhbT3HP0BLLgVN9Hr1ou9/pDauJBx4MKPcPwjHGiNcisPDVhV8mah0WeQPc6wwRvKMGftH3Ddq/QMwPltjCVtsnmIxhSJO6JxklE4GhtyyPzMBJiXdIp0XVZ4wOCCsalfVDcX9SMvp1mmp0+vfvrX2R9OqUJppXUPhXOQmTZU9Z5cJcCyhsD6tt3fKwcQvmw8zbyr8i94tBSkxQqakisTuCylzuNaIfwAp8kbxIqAWtmw4mp8RWnCpAsBqt+ZLN1KJfEHcesZGk0ISffxXBRoVYZJ1y4cwfaN6KzaeDkriNeAQK+r8tmcgMQdh6ph9zu2nt+mq3U61RTuvG1KDFp8CSqStWowNnIkRygCZXMJDbl8YQj49FkX9jDc8XO2zxPHOwiuWI+gbFFH8evue2EIfQXA4uMI8aqK0CKhBl8JMGSY27ZisGbc0KELjNAjswaRa9Mkdl+5VxTNQ3vFhrSuvFBTWCCqvmbQI1Rf5K+Wg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(8676002)(82740400003)(4326008)(70206006)(70586007)(316002)(40480700001)(44832011)(336012)(36860700001)(83380400001)(40460700003)(426003)(2906002)(47076005)(41300700001)(86362001)(26005)(36756003)(186003)(2616005)(1076003)(5660300002)(8936002)(82310400005)(966005)(478600001)(356005)(6666004)(54906003)(6916009)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 09:12:18.7156 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baeab93d-77c5-4258-d0bf-08dac23280a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4179
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+yVZLD0l55jg++ekB6rwLg4ash8zPKEfBYrZQVFRxg=;
 b=DA8iOfcpusRvXJRrx3/7AzgVvQoZrGBX5Def2y5eZsARwlmQRObeqrm5TCqSUKIVwIpSWTO/Yj8rjfx7mS5m6u2net28Zp2JlPFLQ3mxgPLnJUFWE5NCRujIR7n6wq8gc9Xs4OivaX39QXUM+NdHWm6F1re6GjXYJI2ZdxbP7Tw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=DA8iOfcp
Subject: [Buildroot] [PATCH v4 1/2] package/versal-firmware: new package
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
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/versal-firmware/Config.in          | 24 ++++++++++++++++++++++
 package/versal-firmware/versal-firmware.mk | 23 +++++++++++++++++++++
 4 files changed, 49 insertions(+)
 create mode 100644 package/versal-firmware/Config.in
 create mode 100644 package/versal-firmware/versal-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 81e6cd54ab..6ef52df15e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2158,6 +2158,7 @@ F:	configs/zynqmp_zcu102_defconfig
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
index 0000000000..122ef02175
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
+	string "versal firmware version"
+	default v2022.2
+	help
+	  Release version of Versal firmware.
+
+config BR2_PACKAGE_VERSAL_FIRMWARE_BOARD
+	string "versal board name"
+	default vck190
+	help
+	  Name of Versal target board.
+	  Used for installing the appropriate firmware boot.bin.
+
+endif # BR2_PACKAGE_VERSAL_FIRMWARE
diff --git a/package/versal-firmware/versal-firmware.mk b/package/versal-firmware/versal-firmware.mk
new file mode 100644
index 0000000000..cb36d1e045
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
+VERSAL_FIRMWARE_SITE = $(call github,nealfrager,buildroot-firmware,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_LICENSE = "Xilinx-Binary-Only or GPL-2.0-or-later"
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
