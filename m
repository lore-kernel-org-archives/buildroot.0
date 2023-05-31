Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B614AC77B7C
	for <buildroot@archiver.kernel.org>; Wed, 31 May 2023 11:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D1F782061;
	Wed, 31 May 2023 11:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D1F782061
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t6zOr3XjSUmP; Wed, 31 May 2023 11:16:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0013B812EA;
	Wed, 31 May 2023 11:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0013B812EA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD5FB1BF41F
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 11:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4670415FF
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 11:16:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4670415FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eE5-6OWHrBrw for <buildroot@lists.busybox.net>;
 Wed, 31 May 2023 11:16:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08C7241607
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::617])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08C7241607
 for <buildroot@buildroot.org>; Wed, 31 May 2023 11:16:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEpAvTHEO2fheWCllTn9OSD3HdvspH0e/jmDbhvIRuBeWoEA20jVe82Slwsv+32PsWS8/wqn7Z+Geoa0TNDamyvVUQU/kSKEwmOVWOC+Cq3bHwJ2+SvgAyY9mQHWvlj+Brd9yNtNxBstvbtXJyV3l9jwmw96lJFNQMv9sXDofbPjInFA91bJqVD1d1aOhN2f/Q6XszfgShwl3GohrLoHbYMx+v6AOMLPh4tvve0Dy17FIF1+Eyvh7GovLmuPPGosr9SgoSzNzihCvxZ/GT9nEBM2BgfPCcOedopJeGmaBKiz9LsIOcUeO/aKQimmF503FrZf7e7/0TFg6wVB+4ERHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5U8AwMF+x07OyZowPVOgH97cRqMAUsWG9J6lqbxwrE=;
 b=U3GpFHMBPJsmUidrtsznZC2oEfUX5o9hkZNjZ3tat9QogEeWSpbWr5LoASRQObi404v0ne8mcpp3bSsqC0RMPcmlA9TBlogBGx8VSo4j5Nd3OQnSf1BxG4iC3sAiY4v4NchmzGczuu5CQm9ET1TAnZp306829Q5OS2Yo7R080jEMA4C7dejD8Pt+R4RfXLCSJitLNAFnAG1MKSZXcbl91w7xc4WPTcU3Y0VgnJJCcHiBEScdCI2PsCnA/+JzGZsWZ60j2mouOXzp0PNNCwH2rToC0lttuQC7iPbeJXydvqbGrWKEQ2Sf6torflN1DsqhGwuVtQ/hrmnJWwwuIWMcWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR03CA0211.namprd03.prod.outlook.com (2603:10b6:5:3ba::6) by
 CH3PR12MB8484.namprd12.prod.outlook.com (2603:10b6:610:158::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.23; Wed, 31 May 2023 11:16:09 +0000
Received: from DM6NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::b7) by DS7PR03CA0211.outlook.office365.com
 (2603:10b6:5:3ba::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23 via Frontend
 Transport; Wed, 31 May 2023 11:16:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT108.mail.protection.outlook.com (10.13.172.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.22 via Frontend Transport; Wed, 31 May 2023 11:16:08 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 31 May
 2023 06:16:06 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 31 May
 2023 04:16:06 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 31 May 2023 06:16:05 -0500
To: <buildroot@buildroot.org>
Date: Wed, 31 May 2023 12:16:02 +0100
Message-ID: <20230531111602.1623985-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT108:EE_|CH3PR12MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a9b4fe0-ec0c-4cd4-d2c3-08db61c86efb
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /JjYlr0B5neY6Ev00Wzln8hvlmZRr8tbnW4HJkGgQyXRe7QouU8LC/QzEwSYA2t35BQgml5jXWW5WtMVAxXdlts/F4QBDelrrS7jq7o8dtguHTk0WsHLTA37NaHifFQidLpXeQDqccBhJzGVK1lql3cyPx6gT7z8A+qG1Cbo4Z+Q63KK0l/WJN0dcdFyjdf28rS6p18zGDyKafK1Teu1KO0Hi2JIeKFtL5Q1NUnb8eEQRDMfrqLrvV4yz7ZQ+BAAZnH7aPIP/eLtwkUo9ItImoJkiJitjw2uGn1U/QoGfmS30kpjPqU4PmruOfnWuoo1EKAMtqp/fav48VJ3eTDu2mChh/+6MF2IEgzdfflNy4fDFEHexiJLDDUcMfN7iG6rxc9m2W+eQXa0sfVuT5uPFbBHWfgCwGV6AphrISv+MkDzrjphvaynGENmhQtML/FPSR9LMHn2DfXd84VU+w/ZhRCNiawn9aD1rYrQ4N2jOO71xW2+0li/t07zelPgatrHKWyTSZklil61Ig2f4rPKcBnDHjqCSYlCsgxFV3EunoSV5n3iqcaUmLEkRZLv8PJclbv6j49pNGsOtcBlDuWiM8kkCPGA9E9M4fZ4krTTVubkngfSrHfPhArbxX12we9f3R/aS7lVRUjMU2y9Wp/uvtJUjOfCAeMH2gE/tJgyUTPzPFZX+w6u46dLNCEFUyvyCX8Uj1QNLWUv4Iux90YIaHJZdFvCPbdpc5GmphnD1AUkyc3eIQ6J95PioO/CtqxQzYrHwDkOVY9EnX/uHln/PDucudXn5ackfnkA+7ceOqij1Eo6a/nAuN/dL8YEcH1b
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(966005)(186003)(2616005)(41300700001)(426003)(336012)(83380400001)(1076003)(26005)(6666004)(47076005)(36860700001)(478600001)(40460700003)(54906003)(70586007)(81166007)(6916009)(70206006)(82740400003)(4326008)(356005)(316002)(8676002)(8936002)(44832011)(5660300002)(2906002)(30864003)(40480700001)(86362001)(36756003)(82310400005)(36900700001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 11:16:08.5626 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a9b4fe0-ec0c-4cd4-d2c3-08db61c86efb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8484
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5U8AwMF+x07OyZowPVOgH97cRqMAUsWG9J6lqbxwrE=;
 b=hVrxeL8FhfavBENw4BZMep5YkIf3t4N1Hl+1RFwpkK/4r6BcEkKjVVW8zKQgOOg5Co3FF/dRLOPx3WcZ57p+DDOXug8nN6TMM7tWRKm7RNvIGJh8GD/ZvoW8sQxNSR9u7zEKhO8TXDr02djxSYyUTADUYjogKglVKTcBr/a16mI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=hVrxeL8F
Subject: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kr260_defconfig: new
 defconfig
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
Cc: Bradley.Gamble@entrust.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, kris.chaplin@amd.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, david.evans@ebv.com, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support for Xilinx Kria KR260 starter kit.

KR260 features can be found here:
https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.html

While the Kria SOM is based on a ZynqMP SoC, there are some key
boot config differences from the other ZynqMP evaluation boards.

1. There are no boot switches on Kria SOMs. The boot mode is thus
hard configured for QSPI flash. A pre-programmed boot.bin comes
with every Starter Kit. U-Boot can then find the Linux kernel and
file system on the SD card.

Optional instructions for updating the boot.bin in the QSPI flash
can be found in the readme.txt file and the link below.

https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+K26+SOM

2. Kria SOMs use UART1 for the console instead of UART0. For this
reason, Kria Starter Kits will use a separate extlinux.conf file
from other ZynqMP evaluation boards.

3. The KR260 has a USB to SD card bridge, so the Linux kernel
and file system are found on /dev/sda1 and /dev/sda2.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS                                    |   3 +-
 board/zynqmp/kria/kr260/kr260.sh              |  12 +
 ...inctrl-zynqmp-add-tri-state-controls.patch |  90 ++++
 board/zynqmp/kria/kr260/pm_cfg_obj.c          | 496 ++++++++++++++++++
 board/zynqmp/kria/readme.txt                  |  29 +-
 configs/zynqmp_kria_kr260_defconfig           |  42 ++
 6 files changed, 665 insertions(+), 7 deletions(-)
 create mode 100755 board/zynqmp/kria/kr260/kr260.sh
 create mode 100644 board/zynqmp/kria/kr260/patches/uboot/v1-0001-drivers-pinctrl-zynqmp-add-tri-state-controls.patch
 create mode 100644 board/zynqmp/kria/kr260/pm_cfg_obj.c
 create mode 100644 configs/zynqmp_kria_kr260_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index e76717e845..26bcf93b0a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2152,9 +2152,10 @@ F:	board/zynqmp/
 F:	board/zynqmp/kria/
 F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc706_defconfig
+F:	configs/zynqmp_kria_kr260_defconfig
+F:	configs/zynqmp_kria_kv260_defconfig
 F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
-F:	configs/zynqmp_kria_kv260_defconfig
 F:	package/bootgen/
 F:	package/versal-firmware/
 
diff --git a/board/zynqmp/kria/kr260/kr260.sh b/board/zynqmp/kria/kr260/kr260.sh
new file mode 100755
index 0000000000..df8b0ccde5
--- /dev/null
+++ b/board/zynqmp/kria/kr260/kr260.sh
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+# This is a temporary work around for generating kr260 u-boot.itb.
+# The problem is there is no way to currently configure u-boot to apply
+# the carrier board dtb overlay during build, so all kr260 carrier board
+# drivers are missing.
+# This will be removed when u-boot can build the kr260 u-boot.itb natively.
+
+UBOOT_DIR=$4
+
+fdtoverlay -o ${UBOOT_DIR}/fit-dtb.blob -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kr-g-revB.dtbo
+${UBOOT_DIR}/tools/mkimage -E -f ${UBOOT_DIR}/u-boot.its -B 0x8 ${BINARIES_DIR}/u-boot.itb
diff --git a/board/zynqmp/kria/kr260/patches/uboot/v1-0001-drivers-pinctrl-zynqmp-add-tri-state-controls.patch b/board/zynqmp/kria/kr260/patches/uboot/v1-0001-drivers-pinctrl-zynqmp-add-tri-state-controls.patch
new file mode 100644
index 0000000000..422a5d091c
--- /dev/null
+++ b/board/zynqmp/kria/kr260/patches/uboot/v1-0001-drivers-pinctrl-zynqmp-add-tri-state-controls.patch
@@ -0,0 +1,90 @@
+From 560b2e0b6de66c4c9f4b261308263dd091c6002a Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Tue, 28 Mar 2023 14:42:59 +0100
+Subject: [PATCH v1 1/1] drivers: pinctrl-zynqmp: add tri-state controls
+
+This patch enables u-boot pinctrl of the tri-state registers.  As it does not
+check pmufw version, it assumes version 2 of the pmufw pinctrl driver which
+comes only in pmufw 2023.1 or newer.
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ arch/arm/dts/zynqmp-sck-kr-g-revB.dts | 6 ++++++
+ drivers/pinctrl/pinctrl-zynqmp.c      | 9 +++++++++
+ 2 files changed, 15 insertions(+)
+
+diff --git a/arch/arm/dts/zynqmp-sck-kr-g-revB.dts b/arch/arm/dts/zynqmp-sck-kr-g-revB.dts
+index 1ebbe683f3..104e67ddf8 100644
+--- a/arch/arm/dts/zynqmp-sck-kr-g-revB.dts
++++ b/arch/arm/dts/zynqmp-sck-kr-g-revB.dts
+@@ -248,6 +248,7 @@
+ 		conf-tx {
+ 			pins = "MIO36";
+ 			bias-disable;
++			output-enable;
+ 		};
+ 
+ 		mux {
+@@ -299,6 +300,7 @@
+ 		conf-bootstrap {
+ 			pins = "MIO45", "MIO47", "MIO49";
+ 			bias-disable;
++			output-enable;
+ 			low-power-disable;
+ 		};
+ 
+@@ -306,6 +308,7 @@
+ 			pins = "MIO38", "MIO39", "MIO40",
+ 				"MIO41", "MIO42", "MIO43";
+ 			bias-disable;
++			output-enable;
+ 			low-power-enable;
+ 		};
+ 
+@@ -314,6 +317,7 @@
+ 			slew-rate = <SLEW_RATE_SLOW>;
+ 			power-source = <IO_STANDARD_LVCMOS18>;
+ 			bias-disable;
++			output-enable;
+ 		};
+ 
+ 		mux-mdio {
+@@ -344,6 +348,7 @@
+ 			pins = "MIO54", "MIO56", "MIO57", "MIO58", "MIO59",
+ 			"MIO60", "MIO61", "MIO62", "MIO63";
+ 			bias-disable;
++			output-enable;
+ 			drive-strength = <4>;
+ 			slew-rate = <SLEW_RATE_SLOW>;
+ 		};
+@@ -371,6 +376,7 @@
+ 			pins = "MIO66", "MIO68", "MIO69", "MIO70", "MIO71",
+ 			"MIO72", "MIO73", "MIO74", "MIO75";
+ 			bias-disable;
++			output-enable;
+ 			drive-strength = <4>;
+ 			slew-rate = <SLEW_RATE_SLOW>;
+ 		};
+diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
+index 7c5a02db1b..5933be3d63 100644
+--- a/drivers/pinctrl/pinctrl-zynqmp.c
++++ b/drivers/pinctrl/pinctrl-zynqmp.c
+@@ -467,6 +467,15 @@ static int zynqmp_pinconf_set(struct udevice *dev, unsigned int pin,
+ 				 pin);
+ 		break;
+ 	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
++		param = PM_PINCTRL_CONFIG_TRI_STATE;
++		value = PM_PINCTRL_TRI_STATE_ENABLE;
++		ret = zynqmp_pm_pinctrl_set_config(pin, param, value);
++		break;
++	case PIN_CONFIG_OUTPUT_ENABLE:
++		param = PM_PINCTRL_CONFIG_TRI_STATE;
++		value = PM_PINCTRL_TRI_STATE_DISABLE;
++		ret = zynqmp_pm_pinctrl_set_config(pin, param, value);
++		break;
+ 	case PIN_CONFIG_LOW_POWER_MODE:
+ 		/*
+ 		 * This cases are mentioned in dts but configurable
+-- 
+2.17.1
+
diff --git a/board/zynqmp/kria/kr260/pm_cfg_obj.c b/board/zynqmp/kria/kr260/pm_cfg_obj.c
new file mode 100644
index 0000000000..9692a30d37
--- /dev/null
+++ b/board/zynqmp/kria/kr260/pm_cfg_obj.c
@@ -0,0 +1,496 @@
+/******************************************************************************
+* Copyright (c) 2017 - 2021 Xilinx, Inc.  All rights reserved.
+* SPDX-License-Identifier: MIT
+******************************************************************************/
+
+#include "xil_types.h"
+#include "pm_defs.h"
+
+#define PM_CONFIG_MASTER_SECTION_ID	0x101U
+#define PM_CONFIG_SLAVE_SECTION_ID	0x102U
+#define PM_CONFIG_PREALLOC_SECTION_ID	0x103U
+#define PM_CONFIG_POWER_SECTION_ID	0x104U
+#define PM_CONFIG_RESET_SECTION_ID	0x105U
+#define PM_CONFIG_SHUTDOWN_SECTION_ID	0x106U
+#define PM_CONFIG_SET_CONFIG_SECTION_ID	0x107U
+#define PM_CONFIG_GPO_SECTION_ID	0x108U
+
+#define PM_SLAVE_FLAG_IS_SHAREABLE	0x1U
+#define PM_MASTER_USING_SLAVE_MASK	0x2U
+
+#define PM_CONFIG_GPO1_MIO_PIN_34_MAP	(1U << 10U)
+#define PM_CONFIG_GPO1_MIO_PIN_35_MAP	(1U << 11U)
+#define PM_CONFIG_GPO1_MIO_PIN_36_MAP	(1U << 12U)
+#define PM_CONFIG_GPO1_MIO_PIN_37_MAP	(1U << 13U)
+
+#define PM_CONFIG_GPO1_BIT_2_MASK	(1U << 2U)
+#define PM_CONFIG_GPO1_BIT_3_MASK	(1U << 3U)
+#define PM_CONFIG_GPO1_BIT_4_MASK	(1U << 4U)
+#define PM_CONFIG_GPO1_BIT_5_MASK	(1U << 5U)
+
+#define SUSPEND_TIMEOUT	0xFFFFFFFFU
+
+#define PM_CONFIG_OBJECT_TYPE_BASE	0x1U
+
+
+#define PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK    0x00000001
+#define PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK    0x00000100
+#define PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK    0x00000200
+
+
+
+#if defined (__ICCARM__)
+#pragma language=save
+#pragma language=extended
+#endif
+#if defined (__GNUC__)
+    const u32 XPm_ConfigObject[] __attribute__((used, section(".sys_cfg_data"))) =
+#elif defined (__ICCARM__)
+#pragma location = ".sys_cfg_data"
+__root const u32 XPm_ConfigObject[] =
+#endif
+{
+	/**********************************************************************/
+	/* HEADER */
+	2,	/* Number of remaining words in the header */
+	8,	/* Number of sections included in config object */
+	PM_CONFIG_OBJECT_TYPE_BASE,	/* Type of config object as base */
+	/**********************************************************************/
+	/* MASTER SECTION */
+	PM_CONFIG_MASTER_SECTION_ID, /* Master SectionID */
+	3U, /* No. of Masters*/
+
+	NODE_APU, /* Master Node ID */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK, /* IPI Mask of this master */
+	SUSPEND_TIMEOUT, /* Suspend timeout */
+	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Suspend permissions */
+	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Wake permissions */
+
+	NODE_RPU_0, /* Master Node ID */
+	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* IPI Mask of this master */
+	SUSPEND_TIMEOUT, /* Suspend timeout */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Suspend permissions */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Wake permissions */
+
+	NODE_RPU_1, /* Master Node ID */
+	PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask of this master */
+	SUSPEND_TIMEOUT, /* Suspend timeout */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* Suspend permissions */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* Wake permissions */
+
+
+	/**********************************************************************/
+	/* SLAVE SECTION */
+
+
+	PM_CONFIG_SLAVE_SECTION_ID,	/* Section ID */
+	35,				/* Number of slaves */
+
+	NODE_OCM_BANK_0,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_OCM_BANK_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_OCM_BANK_2,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_OCM_BANK_3,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_TCM_0_A,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* IPI Mask */
+
+	NODE_TCM_0_B,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* IPI Mask */
+
+	NODE_TCM_1_A,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_TCM_1_B,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_L2,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_GPU_PP_0,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_GPU_PP_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_USB_0,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_USB_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_TTC_0,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_TTC_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_TTC_2,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_TTC_3,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_ETH_0,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_ETH_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_UART_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_SPI_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_I2C_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_DP,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_GDMA,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_ADMA,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_QSPI,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_GPIO,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_EXTERN,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_DDR,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_IPI_APU,
+	0U,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK, /* IPI Mask */
+
+	NODE_IPI_RPU_0,
+	0U,
+	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* IPI Mask */
+
+	NODE_IPI_RPU_1,
+	0U,
+	PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_GPU,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_RTC,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_PL,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+
+	/**********************************************************************/
+	/* PREALLOC SECTION */
+
+	PM_CONFIG_PREALLOC_SECTION_ID, /* Preallaoc SectionID */
+	3U, /* No. of Masters*/
+
+/* Prealloc for psu_cortexa53_0 */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK,
+	10,
+	NODE_DDR,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_L2,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_OCM_BANK_0,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_OCM_BANK_1,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_OCM_BANK_2,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_OCM_BANK_3,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_I2C_1,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_QSPI,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_PL,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_IPI_APU,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+
+	/* Prealloc for psu_cortexr5_0 */
+	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK,
+	3,
+	NODE_TCM_0_A,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_TCM_0_B,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_IPI_RPU_0,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+
+	/* Prealloc for psu_cortexr5_1 */
+	PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	3,
+	NODE_TCM_1_A,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_TCM_1_B,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_IPI_RPU_1,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+
+	
+	/**********************************************************************/
+	/* POWER SECTION */
+
+	PM_CONFIG_POWER_SECTION_ID, /* Power Section ID */
+	4U, /* Number of power nodes */
+
+	NODE_APU, /* Power node ID */
+	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Force power down permissions */
+
+	NODE_RPU, /* Power node ID */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Force power down permissions */
+
+	NODE_FPD, /* Power node ID */
+	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Force power down permissions */
+
+	NODE_PLD, /* Power node ID */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Force power down permissions */
+
+
+	/**********************************************************************/
+	/* RESET SECTION */
+
+	PM_CONFIG_RESET_SECTION_ID, /* Reset Section ID */
+	120U, /* Number of resets */
+
+	XILPM_RESET_PCIE_CFG, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_PCIE_BRIDGE, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_PCIE_CTRL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_DP, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SWDT_CRF, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_AFI_FM5, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_AFI_FM4, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_AFI_FM3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_AFI_FM2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_AFI_FM1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_AFI_FM0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GDMA, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPU_PP1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPU_PP0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPU, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GT, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SATA, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU3_PWRON, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU2_PWRON, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU1_PWRON, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU0_PWRON, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_APU_L2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_DDR, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_APM_FPD, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SOFT, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GEM0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GEM1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GEM2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GEM3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_QSPI, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_UART0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_UART1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SPI0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SPI1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SDIO0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SDIO1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_CAN0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_CAN1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_I2C0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_I2C1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_TTC0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_TTC1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_TTC2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_TTC3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SWDT_CRL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_NAND, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ADMA, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPIO, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_IOU_CC, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_TIMESTAMP, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RPU_R50, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RPU_R51, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RPU_AMBA, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_OCM, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RPU_PGE, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_USB0_CORERESET, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_USB1_CORERESET, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_USB0_HIBERRESET, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_USB1_HIBERRESET, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_USB0_APB, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_USB1_APB, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_IPI, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_APM_LPD, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RTC, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SYSMON, 0,
+	XILPM_RESET_AFI_FM6, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_LPD_SWDT, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_FPD, PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK,
+	XILPM_RESET_RPU_DBG1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RPU_DBG0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_DBG_LPD, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_DBG_FPD, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_APLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_DPLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_VPLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_IOPLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RPLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_4, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_5, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_6, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_7, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_8, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_9, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_10, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_11, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_12, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_13, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_14, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_15, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_16, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_17, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_18, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_19, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_20, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_21, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_22, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_23, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_24, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_25, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_26, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_27, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_28, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_29, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_30, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_31, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RPU_LS, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_PS_ONLY, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_PL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPIO5_EMIO_92, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPIO5_EMIO_93, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPIO5_EMIO_94, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPIO5_EMIO_95, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+
+	/**********************************************************************/
+	/* SET CONFIG SECTION */
+	PM_CONFIG_SET_CONFIG_SECTION_ID,		/* Set Config Section ID */
+	0U, /* Permissions to load base config object */
+	0U, /* Permissions to load overlay config object */
+
+	/**********************************************************************/
+	/* SHUTDOWN SECTION */
+
+	PM_CONFIG_SHUTDOWN_SECTION_ID, /* Shutdown Section ID */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* System Shutdown/Restart Permission */
+
+	/**********************************************************************/
+	/* GPO SECTION */
+	PM_CONFIG_GPO_SECTION_ID,		/* GPO Section ID */
+	PM_CONFIG_GPO1_MIO_PIN_35_MAP |
+	0,					/* State of GPO pins */
+};
+#if defined (__ICCARM__)
+#pragma language=restore
+#endif
+
diff --git a/board/zynqmp/kria/readme.txt b/board/zynqmp/kria/readme.txt
index bea1430482..dc6915f081 100644
--- a/board/zynqmp/kria/readme.txt
+++ b/board/zynqmp/kria/readme.txt
@@ -3,14 +3,17 @@ Xilinx Kria SOM Starter Kits - ZynqMP SoC
 **************************************************
 
 This document describes the Buildroot support for the Kria 
-KV260 starter kit by Xilinx, based on Kria SOM including the 
+KV260 and KR260 starter kits by Xilinx, based on Kria SOM including the 
 Zynq UltraScale+ MPSoC (aka ZynqMP).  It has been tested with 
-the KV260 production board.
+the KV260 and KR260 production boards.
 
-Evaluation board features can be found here with the link below.
+Evaluation board features can be found here with the links below.
 
 KV260:
-https://www.xilinx.com/products/boards-and-kits/kv260.html
+https://www.xilinx.com/products/som/kria/kv260-vision-starter-kit.html
+
+KR260:
+https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.html
 
 How to build it
 ===============
@@ -65,7 +68,7 @@ in that the boot.bin and u-boot.itb files need to be flashed
 into the QSPI boot flash such that U-Boot can then load all
 of the remaining images from the SD card.
 
-In addition, the KV260 Starter Kit QSPI comes pre-flashed with
+In addition, the KV260 and KR260 Starter Kits QSPI comes pre-flashed with
 a utility designed to make updating the QSPI flash memory
 easier.
 
@@ -76,8 +79,9 @@ https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+K26+SOM#Bo
 
 Additionally, it is possible to use u-boot for updating the
 QSPI with new boot.bin and u-boot.itb images with the u-boot
-commands below:
+commands below.
 
+KV260 Flashing Instructions:
 Flashing u-boot.itb:
     $ sf probe
     $ fatload mmc 1 0x1000000 u-boot.itb
@@ -90,5 +94,18 @@ Flashing boot.bin:
     $ sf erase 0x200000 +$filesize
     $ sf write 0x1000000 0x200000 $filesize
 
+KR260 Flashing Instructions:
+Flashing u-boot.itb:
+    $ sf probe
+    $ fatload usb 0 0x1000000 u-boot.itb
+    $ sf erase 0xf80000 +$filesize
+    $ sf write 0x1000000 0xf80000 $filesize
+
+Flashing boot.bin:
+    $ sf probe
+    $ fatload usb 0 0x1000000 boot.bin
+    $ sf erase 0x200000 +$filesize
+    $ sf write 0x1000000 0x200000 $filesize
+
 It is possible to boot the Buildroot generated SD card image without
 updating the QSPI boot.bin image, so this is an optional step.
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
new file mode 100644
index 0000000000..80ee376d7a
--- /dev/null
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -0,0 +1,42 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kr260/kr260.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.1)/xlnx_rebase_v2.8_2023.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.1)/xlnx_rebase_v2023.01_2023.1.tar.gz"/
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/kria/uboot.fragment"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
+BR2_TARGET_UBOOT_ZYNQMP=y
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/kr260-kria/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kr260/pm_cfg_obj.c"
+BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/kr260/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
