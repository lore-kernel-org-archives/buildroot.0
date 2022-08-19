Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E52C25B0E
	for <buildroot@archiver.kernel.org>; Fri, 19 Aug 2022 06:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3778B41599;
	Fri, 19 Aug 2022 06:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3778B41599
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BAyUySr9aL4S; Fri, 19 Aug 2022 06:37:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6755C40A90;
	Fri, 19 Aug 2022 06:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6755C40A90
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB3541BF25F
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 06:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 956E283EA1
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 06:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 956E283EA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XTg0hWQi_u0Y for <buildroot@lists.busybox.net>;
 Fri, 19 Aug 2022 06:37:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 826B383E6A
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 826B383E6A
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 06:37:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/7s2UH3feAcco3T7kQuMzECKGAi1PfHyP4GDOtSQA1bchYwsujkg7/J0oHNXjbCgisBF7xHL6hXigkKtswhC42g9QQWIQjbd39ZEr80wjLIfZdb1afEcpo3coBexAe7stjUETlXZTpeu8htNyg7NZ6xVOYx1FtuDJ5/DgR9mUPBVDK4Mn0kPhF0/yTcldQ6BXCSxzztJCJoYmiRO+xASVAEvAWGghQ6c1DPMNIByB6eTaJmUSBSLESHNZOFSgSL6iQ+2ueoQ3BD0EMMeFYS6oC4fnfk2iuJ7YaCrP7iZDxK5NJMYqn1eEyFD0sPErY+8zgXo1t2Z3Oh1voElTpoPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOch8UyoV3v7uAS2hkAGptpR5ZX6xyzY4a1cryMqPSU=;
 b=oJ+CoaMGGqeZH1Ik6QDu2W1Djpylq6CXqaOgogSjnd4VO6+e6aQYgiVwkloEfCPlu9MQkoOL2OcEkuz6PdQv/ykk83tPf/VmVtTHnZUzBVk/ZowZaZ1ZGPQl223wdsPdbKlv259aKoiYvW/y7UmDmfHhrXa9MuyyrUIALEv36ID5A15Wktw40e1iJDWrWcEKS2KjNJdLokyek6Jkrwh0qk6BJjghtWRQEuGjAbq32DFBR4s9JQgyspYW1c/YHbn2NnJ82f0DBDtdVgG2b3irBGziu1PfuVZeLOxOLT/To/ieXWXG1mWet9o6wj06RF9hECKva+ivf86CuU3OgSH6sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
Received: from DM6PR08CA0056.namprd08.prod.outlook.com (2603:10b6:5:1e0::30)
 by CY4PR02MB3224.namprd02.prod.outlook.com (2603:10b6:910:7a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 19 Aug
 2022 06:37:35 +0000
Received: from DM3NAM02FT048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::1d) by DM6PR08CA0056.outlook.office365.com
 (2603:10b6:5:1e0::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19 via Frontend
 Transport; Fri, 19 Aug 2022 06:37:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT048.mail.protection.outlook.com (10.13.4.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Fri, 19 Aug 2022 06:37:33 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 18 Aug 2022 23:37:33 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 18 Aug 2022 23:37:33 -0700
Envelope-to: buildroot@buildroot.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, peter@korsgaard.com,
 michal.simek@amd.com
Received: from [172.25.176.116] (port=43244 helo=xcoapps68.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1oOvdM-0002Eh-Tn; Thu, 18 Aug 2022 23:37:33 -0700
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Fri, 19 Aug 2022 00:37:15 -0600
Message-ID: <20220819063717.33591-1-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d52a2033-428f-4a4f-bb61-08da81ad4c86
X-MS-TrafficTypeDiagnostic: CY4PR02MB3224:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UWv9y+a1KyCAzo3FZIz8mKgYV9QgFNAq04ysmRIxCSz6D7zSHElGfat3MY/2yPXYfDk5BJSDl9jyXrSrCjnBuXVxM+0kYtAF+ALBUiu4gBGjDaeQzc0HPEtUpPQ41raYMkM7dYfAxSYbZp1fPBOMQZSm5KBoLZMzYSp9oNNH+tSogV1PMqIEgFCJsySOaaxeR/1EEVJRtBQdzGJSmpUMR7EqCbt6bO04SMc76qCiSNUEXDZDwb8mOzLx7W9Zu8fSifQWk/0QQup/Xv/+eE88ncQDoqjgTfQ8xFIioJToee+JGS4WgaRlfbE/Pf6XaeazOwu7CMExFDwztMAt58xIMJpqfELPvufeOQ/3qbxFygmija+ssInuWb1fllA2h4UwaHwHSNkv/7PPHL24L1IqOOwBHBKbsj68y7GtyrGmR4I6BL62D3OAW0QjoHfgM4cMxCFq8cqr6HQ7azpz8xRF1mL/zwuAk+1TKx1GnFNZOxN5cD60Dp41vSBzFcqJPuxwnZFEOi4kdY3pgvcDWZfBuPNZAKMDuMTQvAu/kUY1hLIqtvDWwlcARYXKG77zAWepbuSNf1y5tPVG7N9wohPIoarZf842Bu2d/sprRw22Zv3IGeK2kDTUEpEImFKr9W4JXqsmV8Gwa+VTddqfOIi1Lpdzx4kDP9NSqIKdYwuvVI4eo4dqkaElO5PCdLQOsk3m/PsF6+wAZdDM1MhNg0pZhjVYhm2opjPocIMm5QlQkxjVMl4ha8i8OXio85UVdYzx7MRgXylI+FCTbN1sAXuifenKPSPUa1UwNzmaZ13VcI9rR+y40vnq1+o1jr6A16SSdOuEKOjt0P4aRYNqeAPRHg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(346002)(136003)(376002)(46966006)(40470700004)(36840700001)(44832011)(356005)(966005)(7636003)(40460700003)(70586007)(70206006)(2616005)(4326008)(1076003)(186003)(26005)(7696005)(8676002)(5660300002)(8936002)(41300700001)(47076005)(426003)(83380400001)(9786002)(336012)(478600001)(107886003)(6666004)(2906002)(316002)(82740400003)(6916009)(36756003)(82310400005)(54906003)(36860700001)(40480700001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 06:37:33.8632 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d52a2033-428f-4a4f-bb61-08da81ad4c86
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3224
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOch8UyoV3v7uAS2hkAGptpR5ZX6xyzY4a1cryMqPSU=;
 b=ORJoaUq0CXi2sgnYnT4qrX2Op5a9hetUyURpwod/Px0Zqn+rLXT3iIe45XVboHyaoXQtHe33mCC38vjUDEgH6axpipAfpHbc2zwOmlK9EAlJv4g8jZwvp/Y2XNmIOGjMZI/nie8Z7cLf4W85Oxbrxukd4czNFWUIT6zVYaQV+4w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
 header.i=@xilinx.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-xilinx-onmicrosoft-com header.b=ORJoaUq0
Subject: [Buildroot] [PATCH v1 1/3] add package/versal-firmware
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
Cc: Neal Frager <neal.frager@xilinx.com>, michal.simek@amd.com,
 luca.ceresoli@bootlin.com, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support for downloading versal firmware binaries.
These are necessary for booting Xilinx versal devices.

Signed-off-by: Neal Frager <neal.frager@xilinx.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/versal-firmware/Config.in          | 32 ++++++++++++++++++++++
 package/versal-firmware/versal-firmware.mk | 25 +++++++++++++++++
 4 files changed, 59 insertions(+)
 create mode 100644 package/versal-firmware/Config.in
 create mode 100644 package/versal-firmware/versal-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d2bd0d809a..1671f782ba 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2168,6 +2168,7 @@ F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
+F:	package/versal-firmware
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
diff --git a/package/Config.in b/package/Config.in
index d1c098c48f..d69c3eff9a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -440,6 +440,7 @@ menu "Firmware"
 	source "package/sunxi-boards/Config.in"
 	source "package/ts4900-fpga/Config.in"
 	source "package/ux500-firmware/Config.in"
+	source "package/versal-firmware/Config.in"
 	source "package/wilc-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
diff --git a/package/versal-firmware/Config.in b/package/versal-firmware/Config.in
new file mode 100644
index 0000000000..9ca46b1d16
--- /dev/null
+++ b/package/versal-firmware/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_VERSAL_FIRMWARE
+	bool "versal-firmware"
+	depends on BR2_aarch64
+	help
+	  Versal Firmware
+
+	  Pre-built binaries of the current bootloader firmware
+
+	  https://github.com/nealfrager/versal_boot
+
+if BR2_PACKAGE_VERSAL_FIRMWARE
+
+config BR2_PACKAGE_VERSAL_FIRMWARE_LOCATION
+	string "versal firmware location"
+	help
+	  Location of a versal firmware boot.bin.
+
+	  The value should be a git repository.
+
+config BR2_PACKAGE_VERSAL_FIRMWARE_BOARD
+	string "versal board name"
+	help
+	  Name of versal target board.
+
+	  Used for installing the appropriate firmware boot.bin.
+
+config BR2_PACKAGE_VERSAL_FIRMWARE_VERSION
+	string "versal firmware version"
+	help
+	  Release version of versal firmware.
+
+endif # BR2_PACKAGE_VERSAL_FIRMWARE
diff --git a/package/versal-firmware/versal-firmware.mk b/package/versal-firmware/versal-firmware.mk
new file mode 100644
index 0000000000..b465b2bd83
--- /dev/null
+++ b/package/versal-firmware/versal-firmware.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# versal-firmware
+#
+################################################################################
+
+VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_SITE = $(BR2_PACKAGE_VERSAL_FIRMWARE_LOCATION)
+
+VERSAL_FIRMWARE_INSTALL_IMAGES = YES
+
+VERSAL_FIRMWARE_FILES = \
+	$(if $(BR2_PACKAGE_VERSAL_FIRMWARE), boot.bin)
+
+define VERSAL_FIRMWARE_INSTALL_BIN
+	$(foreach f,$(VERSAL_FIRMWARE_FILES), \
+		$(INSTALL) -D -m 0644 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/$(f) $(BINARIES_DIR)/$(f)
+	)
+endef
+
+define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(VERSAL_FIRMWARE_INSTALL_BIN)
+endef
+
+$(eval $(generic-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
