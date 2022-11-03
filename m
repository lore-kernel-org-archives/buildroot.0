Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24421C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 09:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A306A80EE1;
	Thu,  3 Nov 2022 09:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A306A80EE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xHmuSMqgkMxr; Thu,  3 Nov 2022 09:29:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD5C580D96;
	Thu,  3 Nov 2022 09:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD5C580D96
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B873C1BF83C
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 09:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92D2A40190
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 09:29:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92D2A40190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o-OCzu4A6GcY for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 09:29:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B7AC40165
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2084.outbound.protection.outlook.com [40.107.102.84])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B7AC40165
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 09:29:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCU68+guR61g0EeLp5rI3zH2ND4KS3zpk4M3UlKeqwPnPhaJz9QlGp4zIGKj9MK+viFvbVXeEAHHVQH4XbQCcPIYVUPnI0FpGfyV9p+EDgttzlu/OM+wLbDZNzdv/6uNV6xO4owsKlX9p7PbwVW3RnroD+PLWPOOEO2QtYKojGrifuJMi8ITEZjr5cYjlq+qWPKwsZaUEhvMS7whm4SgTqei4ztEwe/lVbjM7G47Zl7S4jVdmUYhiDIsTcjPHlgd8QBmOA2vDwaZ+9G5N5cxUrKVCfH6ZHv6YfxDv/KoS13utEYX/vTgFfWzVxjq/UYkkdEqKZlkPg3V4/xYyTyb5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AD1WerwsXHQhkqej13LXRPs0dsei9TGWItfmU+hDUvE=;
 b=mXShX7EQA+Ik9mmUS8znsUZHJT0cPuWlkSTzjy4c0WU59ATkbzVU5AtvA9PvgI4IZrOyd2B0XxH2mzaTTOY9pJxg35T5Vtd2wWUicjYnbdQ2rMX98hTADLxcxmGvt/ByhhvLQPQFSVggci6lZ2N0RQXWmcw3Pl2Mqn6zh490IAJi2rTw1ovKpaeUi+sD4UJcN+IKMNyAL4HgOaApdjVf0mGMbL5rQAvmbx1hoyILhMLEH0JhrIHlCBn+T/hwAWzS0qTpFWc3U2+tZ49jlSEl0h2b+q3O3wyqH7B14ghVPVzUWbh7TwGTiD7AouqcS6Pp+v7krqdlcbcndvC65gLO2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BN9PR03CA0464.namprd03.prod.outlook.com (2603:10b6:408:139::19)
 by DM4PR12MB6064.namprd12.prod.outlook.com (2603:10b6:8:af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Thu, 3 Nov
 2022 09:29:47 +0000
Received: from BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::a5) by BN9PR03CA0464.outlook.office365.com
 (2603:10b6:408:139::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 09:29:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT064.mail.protection.outlook.com (10.13.176.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 09:29:46 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 3 Nov
 2022 04:29:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 3 Nov
 2022 04:29:36 -0500
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Thu, 3 Nov 2022 04:29:35 -0500
To: <buildroot@buildroot.org>
Date: Thu, 3 Nov 2022 03:29:31 -0600
Message-ID: <20221103092932.17159-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT064:EE_|DM4PR12MB6064:EE_
X-MS-Office365-Filtering-Correlation-Id: 063612bf-3146-4ca8-6cb2-08dabd7df2d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KZsBb55Ja8aDh4/dSRBLIkSSzoAglu0uJLruDXBAXHw5XouKwDI46a59GX07TJ9wfRli8tvm94TezH1WhLhID/Ij/0wPL0XnQj4ELcCjvd6bzvnCXQyoZ1+62CyhPiuArTDU6RvL6l9QZ9TIjXNwnTBqDtR6u6WW9WxwuMerUu4nscUxRuAy70udmenQm8SIL7dbeWpJu/+TP7LjlKDqs3SHqe4NzLW8BCieotDNCPu/jmWLDDC5x+XgKiXP83obSB+oPweSSmMdHoReHrKsJUZs1kj+wAGpfy7U2fXGKVDKWnNGwFcrcrUgtda2MW8qvSd73Lsl2+rCHW3wx0iaet9jQjh6zXVX3a/ZjtVnLKDQD0T46GO2ZvpF21+UhGI9gHltmZhHVTEBIIBsjE6J+ZCmWUSjhtQfZFWA/RBDCfouRokARn+vUX3afkYZ8ynpzwj9su82duShQXl7IjRHM1UHvua41bw6qd8xjHZw3P0lEeCxFjPoEOJoimxEdqukoNg7Y0DdrJU9B6ZZ85g3evrYKdbFySh1iqSh9CZ87Vs7DLDhIKGuc+VSCav9M8K9srbGh/YBzrM2EVsF02iV0kSIkBRvSzvggY/Ut170qO+GtLh4iEYpyBxzTCrLVwIwHCiDP7Yi7gh8kmo+6z1vqyc83QiIG+hyC/PYQ1QOraFhrGYNfewWOBC2XQuYiK7INQwxhQ4kxLtgxQ2SefYbnLyTQ3UzI6/ef/41BlrRK0C7XwJx8E49Y8LP7l9cT+S87fnFdADjWlrSuct8UARCZcrxinu8ruVwRfE6wlnJK6M5u+H4NbgR/L8uzgkQt+cQ3suQlrD4vH7jNCx1rjsBhA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(86362001)(36756003)(6916009)(81166007)(82740400003)(356005)(186003)(1076003)(336012)(40480700001)(44832011)(40460700003)(47076005)(2906002)(426003)(2616005)(478600001)(6666004)(26005)(36860700001)(83380400001)(54906003)(41300700001)(70586007)(82310400005)(966005)(5660300002)(4326008)(316002)(8936002)(70206006)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 09:29:46.8512 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 063612bf-3146-4ca8-6cb2-08dabd7df2d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6064
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AD1WerwsXHQhkqej13LXRPs0dsei9TGWItfmU+hDUvE=;
 b=Q8vX1zzqvqEiI3AH9T7W74XpzSLTPXw9YWpawTkGkx+zSsi9soxrhRP/MlXfGBf53rRNiWYfB4gFktHIhw+NllhGgFZX4dAuoXUsbgX5VUDYiuR/MKiZRVEX7veutXDAmPhCUskf9GJVAOUUxSgrmhLWwTxHLoGKrmBoQ4rJaI0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Q8vX1zzq
Subject: [Buildroot] [PATCH v2 1/2] package/versal-firmware: new package
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
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/versal-firmware/Config.in          | 24 ++++++++++++++++++++++
 package/versal-firmware/versal-firmware.mk | 23 +++++++++++++++++++++
 4 files changed, 49 insertions(+)
 create mode 100644 package/versal-firmware/Config.in
 create mode 100644 package/versal-firmware/versal-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7d27936992..fcb46bf59d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2188,6 +2188,7 @@ F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
 F:	package/bootgen/
+F:	package/versal-firmware/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
diff --git a/package/Config.in b/package/Config.in
index 238d7813f0..c2080b9d9d 100644
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
