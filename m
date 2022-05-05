Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA71C433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 12:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D19886110F;
	Thu,  5 May 2022 12:55:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e887KErjd66A; Thu,  5 May 2022 12:55:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D50C161117;
	Thu,  5 May 2022 12:54:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 097461BF318
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 12:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F41536110D
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 12:54:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AuU4H32N_bfs for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 12:54:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::623])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4541461104
 for <buildroot@buildroot.org>; Thu,  5 May 2022 12:54:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZM9cGLnunpKDvP8BRAGA0ok/J3uxjkCnvVgPxdJRZWBj+UvVDSQc6Y3kGeyaN9cTXmJcg+SuVBB9exNe77IhvnLPJHnBsBy7jkL5eG/z/HJUICuKEBdJC6nyWBFb/QX7TWJXX0NzReP05oNXRIVF+Q0OxxxPReQqQ146B4eVXwHk50Q5yF+zg3cr36mMLVQ0Y26L2CZoVSHngPHnVXwX7uysdUO0GXVS905uko9D+IKtNl4lDlrZBOMFQhjZsJ2vt7j0tIMMHKbZBv8HYyVcSYktIjeTlKvLdBpSfiroZ00xc5MwtYVSLBEb4XC4YG23s9HrHuACoShS2HvlHCAcRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8MmnDt8C7hvqzxQJVx9v1SNhAYGS5H2cuLhGGBbfIE=;
 b=kQcTotbu1yfUcMVt6J7g/eTLPk/2R7Fjr698Y87g8AjDu5q/VS3sX3U7iHWoj2BuXm5ER2gXBlg/5U1ZBzloPbj2gHhB/ifyjHSrO8UKd6BJ6gwKhYpp+wlQbxrbOlAt2wLHJVXVSwqmc/MIOl2ZRqsH5uE1VSg2L/IT5rpZAtPlBxEov+uPlW2hDxM2ZBo4hXk7Jx8qRohywNI4uolTPZyBnXTAZ5BEm/7OC37BJ6w4Rask1avQsQflxNMn8HEwO1dMmM335CqEY5pi/1hMD/ug6MJoxDuuZN0kw2WMj3c1VTbp9kcO42NKzrjetsgwx62rZwNMa4o/nnDfXiRNLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8MmnDt8C7hvqzxQJVx9v1SNhAYGS5H2cuLhGGBbfIE=;
 b=AwrDQmO3OpU7USljKtWviT73Lltt5sf0wPAq/lqmMfYPOZbiJY3kddWR2St9aXO1IZedNG5RUjp8zqnTuO1edzGy2OXWGckIp7eBMs9llNJLsuUs/vjv4md/TeLP84AsLJXbjifBHF30XGjZLUhanhVYpzrjuvPigZcGKClr2j4=
Received: from DM6PR06CA0006.namprd06.prod.outlook.com (2603:10b6:5:120::19)
 by DM5PR02MB2873.namprd02.prod.outlook.com (2603:10b6:3:113::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 5 May
 2022 12:54:52 +0000
Received: from DM3NAM02FT042.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::32) by DM6PR06CA0006.outlook.office365.com
 (2603:10b6:5:120::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.23 via Frontend
 Transport; Thu, 5 May 2022 12:54:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT042.mail.protection.outlook.com (10.13.4.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 12:54:52 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 5 May 2022 05:54:46 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 5 May 2022 05:54:46 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, neal.frager@amd.com
Received: from [172.25.185.186] (port=55152 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nmb0I-0004PZ-IY; Thu, 05 May 2022 05:54:46 -0700
To: <buildroot@buildroot.org>
Date: Thu, 5 May 2022 06:54:43 -0600
Message-ID: <20220505125443.1365892-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0720a22-d728-4fd6-7a4e-08da2e967231
X-MS-TrafficTypeDiagnostic: DM5PR02MB2873:EE_
X-Microsoft-Antispam-PRVS: <DM5PR02MB287312E6BB41DE7214E580B1F0C29@DM5PR02MB2873.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VY+fjPKNS5fBQZnPOulu31gbAA5vh5VZjvt3wsHgXeEo5Qrl+qjRA9Zq9tk8rTfAYkL9BYdXUJzGG6nxaEmaPPdV8Aa8du0vdgRRLDQHrRTxD7GbvQFhS0UCq3uhTMOEPIxC0V1dB3GpWur2ZBI8UpF+cEfrGSQ7mjDLF2sVd0m+v6cEUwxr9NJOu/O22YDSVOXu81TWZajWQS89MAtO9lIY5Yy1V38/F0KXZaQNadWwCEYUID1dhKxokyjnymNSpsrDOYDcX0B6G7+xzc+9NIFURn7mxpDYbDpcI1cjE9EeGVZ2KMoq7Ok8cehgN3PlJxs7I6pPHGJdWwUvpFMAx+meDhoFoiBvyHeCkYwQsVYsNw7o+DgGEiS7GcXUFb8q8xaTElhpD61sHWZSPhTqxh46h8hLetbQ2CVU8pipKCtUFFpcta1eaadr82FdEJVAS2GWVn4Za9pxJHPjWDuyk0Qm/VaGMTf/ZX51zRCLizbh1gEQLHrQJu1EZLWYH8G5YNmRH44hJja6p9NV6PdUcmv79HkYicpDD3+AzpgegnxmhHeOjysyMzVKnnqCskrY+WH76ddLoO8RSjPHRxHnJklXKjGAHVdIKSAu05+3JhHOC+DgPBd3EvuRsi/SHV0VqXY0OQViL88jFWW9UQgQ3l04egMi8EOwT3u5nu6Lg8QUuB1XGT+fvJ0gUAlBhoASYPKqyUYjuK1MtRt0mohgkV15hfIwwd03knLVbQ6dlEmyOlfQGa08NO0cFgmo+XebiOShZ2/4Jor8F1JguviN3eaw2SxKftiij3Jbk7cAfjk=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(70206006)(36756003)(316002)(5660300002)(44832011)(2906002)(9786002)(83380400001)(19627235002)(6916009)(8676002)(4326008)(8936002)(54906003)(70586007)(35950700001)(47076005)(2616005)(336012)(86362001)(40460700003)(82310400005)(508600001)(356005)(6666004)(7636003)(1076003)(26005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 12:54:52.0757 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0720a22-d728-4fd6-7a4e-08da2e967231
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT042.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2873
Subject: [Buildroot] [PATCH v2 1/1] configs/zynqmp_zcu106_defconfig: uboot
 dp pll patch
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
Cc: luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 michal.simek@amd.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch fixes the DP audio and video PLL configurations for the
zynqmp-zcu106-revA evaluation board.

The Linux DP driver expects the DP to be using the following PLL config:
  - DP video PLL should use the VPLL (0x0)
  - DP audio PLL should use the RPLL (0x3)

Register 0xFD1A0070 configures the DP video PLL.
Register 0xFD1A0074 configures the DP audio PLL.

This patch was build and run tested on a zynqmp-zcu106-revA target board.

Upstream-Status: submitted (https://lore.kernel.org/all/62538b4a04dee28a6fc8ac5b85f8c845a5a76aa4.1651740988.git.michal.simek@amd.com/)
This patch will be removed from buildroot in a future release when no longer necessary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - added uboot upstream status and tracking link
---
 ...qmp-zcu102-revA-Fix-DP-PLL-configura.patch | 40 +++++++++++++++++++
 configs/zynqmp_zcu106_defconfig               |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 board/zynqmp/zcu106/patches/uboot/0001-arm64-zynqmp-zynqmp-zcu102-revA-Fix-DP-PLL-configura.patch

diff --git a/board/zynqmp/zcu106/patches/uboot/0001-arm64-zynqmp-zynqmp-zcu102-revA-Fix-DP-PLL-configura.patch b/board/zynqmp/zcu106/patches/uboot/0001-arm64-zynqmp-zynqmp-zcu102-revA-Fix-DP-PLL-configura.patch
new file mode 100644
index 0000000000..4281880da0
--- /dev/null
+++ b/board/zynqmp/zcu106/patches/uboot/0001-arm64-zynqmp-zynqmp-zcu102-revA-Fix-DP-PLL-configura.patch
@@ -0,0 +1,40 @@
+From aaaa10b613165b7790fe1c084de007240b5bd77a Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Thu, 5 May 2022 13:34:43 +0100
+Subject: [PATCH 1/1] arm64: zynqmp: zynqmp-zcu102-revA: Fix DP PLL
+ configuration
+
+This patch fixes the DP audio and video PLL configurations
+for the zynqmp-zcu106-revA evaluation board
+
+The Linux DP driver expects the DP to be using the following PLL config:
+  - DP video PLL should use the VPLL (0x0)
+  - DP audio PLL should use the RPLL (0x3)
+
+Register 0xFD1A0070 configures the DP video PLL.
+Register 0xFD1A0074 configures the DP audio PLL.
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+Signed-off-by: Michal Simek <michal.simek@amd.com>
+---
+ board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c b/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
+index 15f0be1a43..cbc436289f 100644
+--- a/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
++++ b/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
+@@ -81,8 +81,8 @@ static unsigned long psu_clock_init_data(void)
+ 	psu_mask_write(0xFF5E0104, 0x00000007U, 0x00000000U);
+ 	psu_mask_write(0xFF5E0128, 0x01003F07U, 0x01000F00U);
+ 	psu_mask_write(0xFD1A00A0, 0x01003F07U, 0x01000200U);
+-	psu_mask_write(0xFD1A0070, 0x013F3F07U, 0x01010203U);
+-	psu_mask_write(0xFD1A0074, 0x013F3F07U, 0x01013C00U);
++	psu_mask_write(0xFD1A0070, 0x013F3F07U, 0x01010500U);
++	psu_mask_write(0xFD1A0074, 0x013F3F07U, 0x01013C03U);
+ 	psu_mask_write(0xFD1A007C, 0x013F3F07U, 0x01011303U);
+ 	psu_mask_write(0xFD1A0060, 0x03003F07U, 0x03000100U);
+ 	psu_mask_write(0xFD1A0068, 0x01003F07U, 0x01000200U);
+-- 
+2.17.1
+
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 27967fc0bd..e1ea27a496 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -35,3 +35,4 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/zcu106/patches"
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
