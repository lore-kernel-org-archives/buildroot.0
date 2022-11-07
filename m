Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031D4C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 11:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73FB34088A;
	Mon,  7 Nov 2022 11:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73FB34088A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X2eb-oIhmGFP; Mon,  7 Nov 2022 11:31:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78642402E2;
	Mon,  7 Nov 2022 11:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78642402E2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C28311BF94B
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 11:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77A9060A80
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 11:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77A9060A80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i0318GwOu9Cq for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 11:31:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B8AF605A9
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B8AF605A9
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 11:31:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ujscx3qFkf0hXAzrMBqXdVmQlEt9wDBG//srv3nnDmCnIZiKalICI+VsICyMloj2QpnkvJO9o0mWVae9d8VPecXEPTyhAkhR3f6PmqOpwgcbORj1wep71G/uQ1hsgh4rC3Y5QebL41Aq0XLp3GL1xfrYOtpjgD7AtJguFu9eba6xhF2p/tVCEMGTSYgI0VSWMIS3mMQWdRAD47j82FMRAVJbdfKDwFecU7G6H1v/smdHdNYHPGgtsK9WmsknG7bwqQzgges0sUIe/gGmDerWs1kJLRclyD8MbwoB/rAeVFwDMg4XhtByx9wK84wyUPYzJEX0ePGxGvNyC7AU1ZNVKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7e/tXTIV+myA9nkJo1BsLHAzlPTct01BQBPhknkJLs=;
 b=OF4AYmPeacO56WMp2dKlXDLXt6z6Dp6wsk3amlul+zA2/zsIeOaj8mv1L/8j+Y8FIK30Kx3cJcgm+kw3eWj+ICUTpOH3kzFOkrTfYy5t4yc+3ESh7qOUGERVRIvr7faaEwBMD6W+XdPtWYlTuWhCSRydsIUWh0+SiP651a9BMqi8NSyJhndzjWvJQY6WJ9OyDtsFdqTTpN8ZUIfhvVLGzIfzc9aqCH/7LjNKi0+fvPe+gSOZX56V9MSm7+KKJiOZ7eKcOfryZdRQtZLjWGvMFIVnRluCUSO+/aIOy3pz1VbQI0AYUGCjI7TbaOdF/GlOafmXmaeXTuXHol+5brNjuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR03CA0055.namprd03.prod.outlook.com (2603:10b6:303:8e::30)
 by SJ0PR12MB6878.namprd12.prod.outlook.com (2603:10b6:a03:483::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 11:31:38 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::6c) by MW4PR03CA0055.outlook.office365.com
 (2603:10b6:303:8e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26 via Frontend
 Transport; Mon, 7 Nov 2022 11:31:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Mon, 7 Nov 2022 11:31:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 7 Nov
 2022 05:31:25 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 7 Nov
 2022 05:31:24 -0600
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 7 Nov 2022 05:31:24 -0600
To: <buildroot@buildroot.org>
Date: Mon, 7 Nov 2022 04:31:20 -0700
Message-ID: <20221107113121.6857-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT063:EE_|SJ0PR12MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: 50035a75-ac87-4edd-9018-08dac0b3a287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KKk+SzcNYceAsDu6+TKLH5f0mxMlXWXc+8E0daeEP0JP/sq8s5c8YV7EbsVlPz/ba5NxSzYNEUu+Xtxu45NUKnQrbChrnTH3ITZGO0+syHNZ/f/5lpxdYzCYszWRq72AkQ+dReXOaeVCCv4IpIMX0bVn/+43mbUNEhcGx+kLrfCtxf6EAiVf3QgiQGYA+YWpzqjm+48ovsBNoudwbxB1bGQAhRJe3tz6sq+3jDwI7LYVjU3vqQof5VjO8oSRX4wOmTOFrZw5R+s2TXHjvasz0qNCM7GtPVqqG9ex1flCK3c/8yuyIF926aGHlPcFiYMi4cgMznXZQ1JN2BQQkFsJ7pqdZ7XrhzcGEhUH7bQrV1Z31Eq5UDO/EClzCk4BJ5Uu9CSIA/yneyCBTjmJK5JuIssv/WKPhFBBs2iOlMAY+goCAu/O4eNM2KN8T/R9Rzr1p1paCv9lHaHCmUmprcu29qHxliBKoUEObwT7ftwYaZcdeFyqXLxN/qB8nd+JTYgGzlv3xteNCuiS8wMAV5hIToBCkq6JBID1A45ULcv0Ija9MvgTyEm+t+UMROvqlTSZYLDN3zDrLTisd8qh+I7RhavPpooWIwf07liBDQgxzpclptlOtiBszQo3nwmfd0LS9ArQIa+c6jIdvf1ToZ2t9CyFngQVOfTl703k/hu/ZfeizUR7KnFcS3mHvTP3Q4DQhq4dqn2OjQVeNySFQeJ8qxjfHsoQu5KWsLtCLByFDyCCFqCjy/OzjqlXksjeQMWP9vuRIeWDO3iHYMuNYz7Rb6zIT0NZ6syfWK/U46lTqt8OsirPDIhAIof5DCzj3wrg/XkbuFRlGZAojpopHJRQ3w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199015)(40470700004)(46966006)(36840700001)(1076003)(186003)(336012)(426003)(47076005)(26005)(6666004)(2616005)(36860700001)(83380400001)(44832011)(2906002)(40460700003)(40480700001)(82310400005)(54906003)(6916009)(478600001)(966005)(5660300002)(41300700001)(8936002)(70206006)(70586007)(316002)(4326008)(8676002)(36756003)(81166007)(356005)(82740400003)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 11:31:38.3256 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50035a75-ac87-4edd-9018-08dac0b3a287
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6878
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7e/tXTIV+myA9nkJo1BsLHAzlPTct01BQBPhknkJLs=;
 b=Jpnr+tupmlegly1VxQE37v6JSlZx3JX6JYhivqP102j68mqCu0SO+hQt6oM3r54vS6jPfkx3K+oFUojDvCT+x6UxkjC8Urhkb1liX2qqe+ug9/ixs/HecbmwcoVHvdISW2dy4lXQ4ylv3w+WlwYh67/twKOEk6ZEkQsn0iGVJnQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Jpnr+tup
Subject: [Buildroot] [PATCH v3 1/2] package/versal-firmware: new package
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
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/versal-firmware/Config.in          | 24 ++++++++++++++++++++++
 package/versal-firmware/versal-firmware.mk | 23 +++++++++++++++++++++
 4 files changed, 49 insertions(+)
 create mode 100644 package/versal-firmware/Config.in
 create mode 100644 package/versal-firmware/versal-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9bd98da5ef..fa70834475 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2189,6 +2189,7 @@ F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
 F:	package/bootgen/
+F:	package/versal-firmware/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
diff --git a/package/Config.in b/package/Config.in
index aef80f9ab0..f28bdc200b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -442,6 +442,7 @@ menu "Firmware"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
 	source "package/ts4900-fpga/Config.in"
+	source "package/versal-firmware/Config.in"
 	source "package/ux500-firmware/Config.in"
 	source "package/wilc-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
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
