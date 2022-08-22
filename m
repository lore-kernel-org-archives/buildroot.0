Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF54C28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 09:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57AA540925;
	Mon, 22 Aug 2022 09:50:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57AA540925
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jqh9u3fQZd0E; Mon, 22 Aug 2022 09:50:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAB544048D;
	Mon, 22 Aug 2022 09:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAB544048D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 387AB1BF306
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FBFB4048D
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FBFB4048D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l6-guRFO_UpO for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 09:50:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A789400D2
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A789400D2
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 09:50:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReGfuNDqWvDshCZTsrw9DINjXcwip61+ccef4b2TAk5NGoly1uFk+IZBf4Q+VdUn+HozW5PrUUfLGEk1V5SNt2/c6vlyeYh6jeyCoMe84nlpE2zUCM/x1H9hRTKQdwNdBCLpKWPWF0AKS/uwcpfY8F8RNVvdT43FcIFI6Fs75hXkNA08Qnbq8yd5NMpzW4zf0AtJ1HMSkc0vMbqPSS96G5p+x4Dg6CEglnFDmuF5c3wrcXXvNY6cPtB2tr/YhbSDM2CsM6PQaSuNFPJFABascoWpt5Z1NZEhG/x57zGvUOgZh5DC94g2ZCj8KaRFkkXlsbgWUNWcNdzjAIwCXYQLng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmbYdQfNdgcLkYIwY/wS790D1aiRgKXvy8iZaNmkfvs=;
 b=MfsZL0uWh37yr3XXU8SleoTSjtODj/E7VoebXJV4VpsmJD9N5GTXJMfezICtMyo/sPdjDrt3pqFNhPLFRyk0p3iRT5vm3ObI9cCl199VlvlTdLWIKwfsResKe/w5KVCVm/RDIzR6vgL7M6vWKjQEvTVkkCW6jkLqQjwibsZKa8ZGj0IwkoF3ZLXaA5LSIVEfhOyKGeGVIN/IcOFjvh/2XCHuy842FGC5k+sGYtlxGM4LySn4cFrK6rYkdvVesIFJLasGLLHOc0VimTtp2AacTXI3ivDF2V6fL84hZakVx0p74fqiKlWHS/AcytbRq5+CZxjunU3bFXxFLzjlf2APNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
Received: from SA0PR11CA0186.namprd11.prod.outlook.com (2603:10b6:806:1bc::11)
 by CY4PR02MB2741.namprd02.prod.outlook.com (2603:10b6:903:128::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Mon, 22 Aug
 2022 09:50:05 +0000
Received: from SN1NAM02FT0016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:1bc:cafe::4b) by SA0PR11CA0186.outlook.office365.com
 (2603:10b6:806:1bc::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.20 via Frontend
 Transport; Mon, 22 Aug 2022 09:50:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0016.mail.protection.outlook.com (10.97.4.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Mon, 22 Aug 2022 09:50:04 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Aug 2022 02:50:03 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 22 Aug 2022 02:50:03 -0700
Envelope-to: buildroot@buildroot.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, peter@korsgaard.com,
 michal.simek@amd.com, yann.morin.1998@free.fr
Received: from [172.25.176.116] (port=35922 helo=xcoapps68.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1oQ44J-0007NM-Mo; Mon, 22 Aug 2022 02:50:03 -0700
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Mon, 22 Aug 2022 03:49:58 -0600
Message-ID: <20220822095000.8189-1-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e87c2833-0ee5-44a7-55ac-08da8423b0af
X-MS-TrafficTypeDiagnostic: CY4PR02MB2741:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G+BjIRQxrYwKXPt/ENhJPENX7wgb7RkcBUb59kdgVsd0t42DpepH0j4ilQy26HuI/aZUmLd0Ec8j6w6q9UBzvnHmX5LKfb7w2nyIclZd72vgVU8vkVXRYrNuO6gmXr7U/gISdeNJo4gsakVjAplZ/B/NhUJi5/l5LgYfaMtLrzZ9i6MspOlN7scMQr7tvkbHF+9NssfdH8cA3aR4oszlSYbFE297Wr4frK3r1FKkEBVYKRTgoWO5lDqUz/5W23b4aAywan7czMn6O7YesqDvR6DT0Vetw+7Yiwg4CLCEc0kWkhMLpPpBJLjSisJEOH1FU4KeK3fvtUOPJa1IdoDdpICv9YYYtQDgcykdVvczUxqvmV9FeD3kgooCtLWr7GIQJLmUWyHnlSJqpaQXN+5d92zFVLE+ir5O5sImJAzhLbnOItj++oz9pDExOvZhwMEzqPKvW6cfnJ8w5sPaOvkQ2qld6jUtKs26thQeL1EjoxZDemzi7u1k6062/8LrFHzyOgzWbIZhynAYvNpW6atgjEQjEozf7vkjFTTLA4i/zivsbh2evIAu0hpdh4Jd+H/ZJmK8ezTH/gC1pc+qsExvOqkHtmn0pj+HBhCspuaNEiRE6jsb7N464xc2HMvZ0yWA7qGOzuKnW5MQchKjL3bKTNFXQGIy7y4/xjhr/2L4SRJFQGsbIWPuojY0j2Ae4I4lF6t9IuAeZ9QV7vNtbVrLMYKin6v+CwzUwsrURJ+ir62/I1lp494kCExhsrjToMtO+8xk8FVAYOmBwdYCXkflKHFgBHjvgCCoMlrO2wo8PzEXNEqlO9LpF80I/SqUN+sxlupCl/G33eHraLZjQy1OE6mRAZRTX8j9hrmMy2D5X2A=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(396003)(346002)(136003)(36840700001)(40470700004)(46966006)(47076005)(426003)(83380400001)(7696005)(2616005)(26005)(336012)(2906002)(1076003)(186003)(356005)(7636003)(40460700003)(82740400003)(36860700001)(40480700001)(82310400005)(966005)(4326008)(8676002)(5660300002)(70206006)(70586007)(41300700001)(44832011)(316002)(36756003)(6916009)(54906003)(478600001)(6666004)(8936002)(9786002)(107886003)(102446001)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 09:50:04.8567 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e87c2833-0ee5-44a7-55ac-08da8423b0af
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2741
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NmbYdQfNdgcLkYIwY/wS790D1aiRgKXvy8iZaNmkfvs=;
 b=rqlA9o8Z8wkGPsFOIKs0kKoQnYV7n09GnlQnkIezBzbY5ZMrZg5u/lpeOKVl2oLaKxNkdnLCn4/EM4eHGaKBCT+VZ/Q/UjtSZvnXOBM22talzwmR68gzjBUWSG/P3ezQj3czKUw1Op2v3AcJ5CzvbNiAp0L1j1iK0BjkdE42YQ4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
 header.i=@xilinx.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-xilinx-onmicrosoft-com header.b=rqlA9o8Z
Subject: [Buildroot] [PATCH v2 1/3] add package/versal-firmware
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
Cc: luca.ceresoli@bootlin.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@xilinx.com>, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support for downloading versal firmware binaries.
These are necessary for booting Xilinx versal devices.

Signed-off-by: Neal Frager <neal.frager@xilinx.com>
---
V1->V2:
  - github location no longer configurable
  - removed unnecessary loop from versal-firmware.mk
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/versal-firmware/Config.in          | 22 ++++++++++++++++++++++
 package/versal-firmware/versal-firmware.mk | 17 +++++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 package/versal-firmware/Config.in
 create mode 100644 package/versal-firmware/versal-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d2bd0d809a..c01563524d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2168,6 +2168,7 @@ F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
+F:	package/versal-firmware/
 
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
index 0000000000..e184ba1925
--- /dev/null
+++ b/package/versal-firmware/Config.in
@@ -0,0 +1,22 @@
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
+	help
+	  Release version of Versal firmware.
+
+config BR2_PACKAGE_VERSAL_FIRMWARE_BOARD
+	string "versal board name"
+	help
+	  Name of Versal target board.
+	  Used for installing the appropriate firmware boot.bin.
+
+endif # BR2_PACKAGE_VERSAL_FIRMWARE
diff --git a/package/versal-firmware/versal-firmware.mk b/package/versal-firmware/versal-firmware.mk
new file mode 100644
index 0000000000..7609910b44
--- /dev/null
+++ b/package/versal-firmware/versal-firmware.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# versal-firmware
+#
+################################################################################
+
+VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_SITE = $(call github,nealfrager,buildroot-firmware,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
+
+VERSAL_FIRMWARE_INSTALL_TARGET = NO
+VERSAL_FIRMWARE_INSTALL_IMAGES = YES
+
+define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/boot.bin $(BINARIES_DIR)/boot.bin
+endef
+
+$(eval $(generic-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
