Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D43C3DA61
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 08:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02747608F7;
	Tue, 30 Jul 2024 08:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nMyTCq-EwcyM; Tue, 30 Jul 2024 08:52:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AB62608EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AB62608EA;
	Tue, 30 Jul 2024 08:52:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36E3B1BF420
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 08:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 238F04025C
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 08:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOhAe9Dsl78h for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 08:52:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2409::600;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9874C400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9874C400F1
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9874C400F1
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 08:52:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6HH6GB2SmC4udSpc25YPd+lCln5cd7fK72OFx4c2m95B0fIUJDPpNA7gurBEp7dXqjDeKXc13HZMMUhbPO98fwdS5bbMvPwiNWQj2p7ngftDhubSIyBoekIp0lJzrB2iaBOafPBuOQ+wbL2HqG9IBV5mbkeJtuX81YHiR9YFQ6QhZADZ4sgbV+ug6Rp4pGMJbwus0dwhZsFf7H4qnHKeCYSYW75qpbuvisc0xYde4AXNs8rCVtevAPajEvE055xyli3S0xjR/qHOTVtQ4eSB23w94wDsvXLa3Ezm4R24BjvjVQ+CYmcrFnkt6H50WDC40kQKByIGd4jH6VZ/m3bBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dr4AOyrCbir6MCi9dc7yD6zIU6e0oGJzDVLh8MYdXQ8=;
 b=XzL8BAFkrkt/5PbwQc511BClWJPL1YzO+dTs7yzkVRyYdy3rR8ZTczLMxS5DxXlWPScivHvQErZBrj6g2P+H73CDjgWObdDfznuI17gggafHhn9kzPId3c5Rs63D/i2W4PRYd0RXLCDcubkqBpUlDszsCd02Vf5+ZZoErbpOEdIUAVhjKjlNx0oyxer/CiMR91CSpUUuGJowpeqU43/fDb0v3LvpkFcUyLksMzXFReI5qeHNO5uObFXFjAFRXxLJ3QET6EzRKntgRgYas0vVXfYuP4ZY/RShPJ4ismhxo7Ako+92dv/7SEAjzGff8H+oxNZebnKxkbum+xN42GL96Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH8PR21CA0022.namprd21.prod.outlook.com (2603:10b6:510:2ce::7)
 by SJ0PR12MB6966.namprd12.prod.outlook.com (2603:10b6:a03:449::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 08:51:59 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:510:2ce:cafe::a1) by PH8PR21CA0022.outlook.office365.com
 (2603:10b6:510:2ce::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.4 via Frontend
 Transport; Tue, 30 Jul 2024 08:51:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 30 Jul 2024 08:51:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 30 Jul
 2024 03:51:58 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 30 Jul
 2024 03:51:57 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 30 Jul 2024 03:51:56 -0500
To: <buildroot@buildroot.org>
Date: Tue, 30 Jul 2024 09:51:53 +0100
Message-ID: <20240730085153.3496255-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|SJ0PR12MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: baeb39ce-21df-4ba5-167f-08dcb074df6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6SWkeTVjIWKxKJpOgQ+PatDhg/jrOVZLZ5Oi8QpQw1QKF+7NZltvTjkc2gq4?=
 =?us-ascii?Q?BwW3ra2WkurtyrAp6X7WpAf7+bEqPi3J5lIz65v1KfWn4LDWMLwbnFW0wF6M?=
 =?us-ascii?Q?tpcchd2nQ1YLird6v6XndE6Ws1nG/IGbGi+YrGjMQqX1VtjNVZPJT8sHWXfY?=
 =?us-ascii?Q?5fKSH4U2LsOzA6SqPEeRKbI5fK0gw3yeVn5zYdeCInekIPUrbr9/x2IrLe8f?=
 =?us-ascii?Q?i2OSGGsQRIouJ+lvewSdaaKKsPatiYtD+WmKEXNDOZ+CToouX27iw7AEzWK0?=
 =?us-ascii?Q?vFMWC0/XAT0xXxmihAqpBcUn9ruIYDrKQTmDuwoXzdcUwxUARPfr9wu/7itj?=
 =?us-ascii?Q?mDbI60SXHk32336B5cryro6DgfyiVxemzrQ6i3gKbLnyiz/fjriYxWJTNKgi?=
 =?us-ascii?Q?TZr2ruqMDD7mt+Z48ihoRNGWE5TB8NFSCJqixaATa+yf5OtmVPe/nB2dukJ8?=
 =?us-ascii?Q?6t7YNsN0KfOEtro4WsEVw6aX7wLgs6iRHOvIwfWdEsOvjjyyzZCj+r31eFuB?=
 =?us-ascii?Q?3xSQ+AV5U8izT0aN8RMcpx6pRhFLt4v03QEPYkoaoWjugxNYFIttME2qKnBc?=
 =?us-ascii?Q?CslNY6e6KS34Uf4PR1kpGvwbRrNv54RDSQaaQ3blNodGa/T1oJbKbXoDrqG8?=
 =?us-ascii?Q?kL21B05LKQHIx1v2bXqJ5C7NV8If2AcNAD0pUiuD28eDMgneQ8Ls/MTrAJO2?=
 =?us-ascii?Q?0OyH9fLaIPw0pORUH/pB2AyHFR8l/ARLDs6en2USjpVLU4C//0GxBeEfg4kJ?=
 =?us-ascii?Q?kwVyuH1uAQjCWgoUQPd2BD7uuj/fppHoRguFlL7+tgGVB5gun2czhv8SRSKd?=
 =?us-ascii?Q?+9bMOyLvoywbo5sA0lEit4kLGIds+jX6QIioEHdAuenrA2X7Ta3W8UzmVQKx?=
 =?us-ascii?Q?I3YLcgYqR/prG8j55FxdbYspP+5JIWeGuY7CrEVDWB5+hexIpcrdKuqUzh+L?=
 =?us-ascii?Q?6vRUjewBbdd/PCPnM39d86voU72tCsBgcw0h40Wo2tQN7XUPy77NWHHx1m3G?=
 =?us-ascii?Q?acJcP+fL6lUqDrUh0Gqmlb2yF4FQZQIOOBisxGEcAri51xiwgm03DrzEfKvE?=
 =?us-ascii?Q?UEmGuZJjm3O/0A8vS8s+hDfb9S5FoTASFqE1nlJpYSh7nlwB7jFRvMjakxQY?=
 =?us-ascii?Q?KjctNOWHCuDUpgY1iP8wdo0NKf7G+X6jvVynY1V5Bf/sHNMJhDrvdsP12QMJ?=
 =?us-ascii?Q?SFODwQdqOdVrIIWkUuTTSeKrduKkgLmUOH1/emZFr/2aoxGHxMq+J+l/AEdA?=
 =?us-ascii?Q?wXp7nbIlDhnqT88Y4xVuM0jrJj0rX4I0xyMFsMRsPyxwat6W5cMzkHhhW3Tk?=
 =?us-ascii?Q?5m7QcDYqAM5VSIjUS+mD7kHi+B4qqv+oHgkJFYlghPenExoREN+SFUbnPRQ4?=
 =?us-ascii?Q?04W9nXuCk4ErzFF5D6S1O1ywV8X79NLxcoaKiRU6WcyLXKPLPqIH7XUtkLcd?=
 =?us-ascii?Q?OqXxiiEYlVer4tPfgZbDuXUcBI64I8y1U1g7zHukmSTVCS1OZUpnbjqkquRf?=
 =?us-ascii?Q?u1uH4dV59Hl+u+s=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 08:51:58.9303 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baeb39ce-21df-4ba5-167f-08dcb074df6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6966
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dr4AOyrCbir6MCi9dc7yD6zIU6e0oGJzDVLh8MYdXQ8=;
 b=f4k9YZe0L9rzcrQm9NzBcnEEfbg0iSAO1quz03VZAnpvW2NV1ez43RQrBhB7ifvwfRand/SL4R5w96a0YgGMqOx29xemz3LjGyUCkYdTdBapU2cp74bao7j+vfXaOvuFm2GIOKgrcjRCXTo5r+kC7TYMWUAnznEf9wDw66BSvzU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=f4k9YZe0
Subject: [Buildroot] [PATCH v2 1/1] configs/versal_vek280_defconfig: new
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
Cc: andy.a.kennedy@collins.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support for Xilinx Versal VEK280 Evaluation Kit.

VEK280 features can be found here:
https://www.xilinx.com/products/boards-and-kits/vek280.html

The VEK280 requires a patch for the memory node in the dts file because it is
not currently correct.  This patch has been applied to the linux-xlnx repo and
will be included in the 2024.2 release.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- Fixed memory range in dts files for vek280 evaluation board.
---
 DEVELOPERS                                    |  1 +
 board/versal/readme.txt                       |  4 ++
 ...rsal-Fix-vek280-memory-configuration.patch | 45 +++++++++++++++++++
 configs/versal_vek280_defconfig               | 44 ++++++++++++++++++
 4 files changed, 94 insertions(+)
 create mode 100644 board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
 create mode 100644 configs/versal_vek280_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 78ea65205d..1fac1da208 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2400,6 +2400,7 @@ F:	board/zynq/
 F:	board/zynqmp/
 F:	boot/xilinx-prebuilt/
 F:	configs/versal_vck190_defconfig
+F:	configs/versal_vek280_defconfig
 F:	configs/versal_vpk180_defconfig
 F:	configs/zynq_zc702_defconfig
 F:	configs/zynq_zc706_defconfig
diff --git a/board/versal/readme.txt b/board/versal/readme.txt
index 9cf499b35b..4d8406fb1f 100644
--- a/board/versal/readme.txt
+++ b/board/versal/readme.txt
@@ -4,6 +4,7 @@ Xilinx Versal boards:
 ******************************************
 Supported Versal Boards:
 Xilinx VCK190 board
+Xilinx VEK280 board
 Xilinx VPK180 board
 ******************************************
 
@@ -12,6 +13,9 @@ Evaluation board features can be found here with the links below.
 VCK190:
 https://www.xilinx.com/products/boards-and-kits/vck190.html
 
+VEK280:
+https://www.xilinx.com/products/boards-and-kits/vek280.html
+
 VPK180:
 https://www.xilinx.com/products/boards-and-kits/vpk180.html
 
diff --git a/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch b/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
new file mode 100644
index 0000000000..2eff388f50
--- /dev/null
+++ b/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
@@ -0,0 +1,45 @@
+From: Michal Simek <michal.simek@amd.com>
+Date: Mon, 15 Jul 2024 08:24:57 +0200
+Subject: [PATCH] arm64: versal: Fix vek280 memory configuration
+
+Board has 12GB total but Vivado wizard supports one channel LPDDR4 4GB
+configuration (2GB low + 2GB high) or two channel LPDDR 8GB configuration
+(2GB low + 6GB high). Wiring the remaining 4GB LPDDR can be done via board
+tab but not available as option in wizard. That's why only describe 8GB by
+default.
+
+Signed-off-by: Michal Simek <michal.simek@amd.com>
+---
+ arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts | 2 +-
+ arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
+index 1641dc0b5141..ad5d590318e6 100644
+--- a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
++++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
+@@ -19,7 +19,7 @@ / {
+ 
+ 	memory: memory@0 {
+ 		device_type = "memory";
+-		reg = <0 0 0 0x80000000>, <0x8 0x0 0x7 0x80000000>; /* 32GB */
++		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
+ 	};
+ 
+ 	chosen {
+diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
+index fda47cd87b3a..80aae8fa4b11 100644
+--- a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
++++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
+@@ -19,7 +19,7 @@ / {
+ 
+ 	memory: memory@0 {
+ 		device_type = "memory";
+-		reg = <0 0 0 0x80000000>, <0x8 0x0 0x7 0x80000000>; /* 32GB */
++		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
+ 	};
+ 
+ 	chosen {
+-- 
+2.43.0
+
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
new file mode 100644
index 0000000000..37e479d692
--- /dev/null
+++ b/configs/versal_vek280_defconfig
@@ -0,0 +1,44 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vek280-revB"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
+BR2_TARGET_UBOOT_FORMAT_DTB=y
+BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
+BR2_TARGET_XILINX_PREBUILT_VERSAL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_BOOTGEN=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
