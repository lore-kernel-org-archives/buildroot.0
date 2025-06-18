Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D62BC7115B
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 13:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 692D9608FD;
	Wed, 18 Jun 2025 13:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvyrhQ1QutCH; Wed, 18 Jun 2025 13:36:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C123607B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C123607B4;
	Wed, 18 Jun 2025 13:36:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95242151
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 13:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8708D402D8
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 13:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNih-4x2PR7x for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 13:36:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::623;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B491240071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B491240071
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::623])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B491240071
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 13:36:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INrrbXSal4Asx2Cq000OW5gt/QI1/5GzBn7SiffWzDKPL4Qq9BrchrfQ1/HWxkuY7vqHdlnSyfxznWqqLeqH4dLcZCTf1ewwUl82GMGVPXeiC3peDXYxhStWpolK4Xic3evff9M+5Rm4oqFMZjIBJ1fjsjh5DNhmcJcZ+yEUpGl3ebqCpHZakAIcV5O2XQwLFy9lOU9E0zidlmMndWuWx2t2Ya5JKbX+NPMj39hoHF9+UzRZ797JFSy1XFS0baCmv8MhpLs7fUN+xtf0FohjTKRBF9AzCHzU2ZOT3qOoni7WUGHJgg/qDjRPVIUOidX617KjcPHGKhF7ea8//6YCrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoqQZnT+72PmOa3l0HJ6F10kQRHhylg/P2ZbCpWLh54=;
 b=ornSeZDdT34+1YvbWNp4+olAlnAcfewqnS6y+ifbqxkhM7cexUGMSzAYpLK+SOps2gLT/PS/3xNRhEUascRF0+N7v7+gs7AysJ2ntrZHL3QwqGt/b2nZV0J1l97dXoF0/juTf4L/pB8BXKG4ofOqJmeX7b21/gO9Un/72U1aEJJ2XMHAMoGrelcYGSY/l2T2AMercnnkkjBMGvV0XuHgGMnPrQtQ+H/vSw93ThtdKt0GqjeZ7/BPJWDTXvqfs2fnHWOhJQu8EIfjoRH0v3szTQJDgx0Ib/z71okOGHGROXSflzoiYmKx45PH/F0NF5tABQsb5gwmiwUFSDNUb33r4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SA1P222CA0106.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::11)
 by MN0PR12MB6151.namprd12.prod.outlook.com (2603:10b6:208:3c5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 13:36:27 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:806:3c5:cafe::5c) by SA1P222CA0106.outlook.office365.com
 (2603:10b6:806:3c5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.35 via Frontend Transport; Wed,
 18 Jun 2025 13:36:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 13:36:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Jun
 2025 08:36:24 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 18 Jun 2025 08:36:23 -0500
To: <buildroot@buildroot.org>
Date: Wed, 18 Jun 2025 14:36:21 +0100
Message-ID: <20250618133621.3047127-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|MN0PR12MB6151:EE_
X-MS-Office365-Filtering-Correlation-Id: ef7fdf59-6aef-455a-41ae-08ddae6d1f49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HaQEKE2TuN270sah9eJ3k9lPIf08w1h3i7bQePirhxIwJHD4t4Q1f1x9HaHq?=
 =?us-ascii?Q?U/8qTKhebW+Y8CNhc0dXBKe6LYO+lwcKjiysoWjyY8WIlQqcFdDr+Wv5iXzf?=
 =?us-ascii?Q?EJN3FyxkLqXjXezJjVdtmPx68NiYaIiZpwB7T54lLd+jxybX21TNhPqOZzX7?=
 =?us-ascii?Q?m1w0Asy36GCJ2/pDtdn0acHjLbrFz9Ju2IsGszLxnqdSz36G9TerS5Ul+wO0?=
 =?us-ascii?Q?AwY5jujrRwH3NEVtaA/XtihOCVFSqFjN6PtzGIqgxQizQrBuxy6Dr71TsXwa?=
 =?us-ascii?Q?DmCeoD/KKDDbmn+2eeqwvUs78BygzFPWtnYZufdiurjPXXG0tEMfcV4e1N7r?=
 =?us-ascii?Q?p0rJl6nsxq2j52UHifo5bhF1Vw0keXqLg8DEQWpbXIpADyXS/V0BcXpys8Kv?=
 =?us-ascii?Q?vSETYKYqU0G3TctKwIUH4Tw/jTzhwf/vuaTpzh3MfkN6ZfpBWcNpOV+q7u4h?=
 =?us-ascii?Q?BIj+CJvuK18okCYwCJvQlqXRAbzVt8FXOEP/bU+zn2RBtTwlLJsvCIxEb60O?=
 =?us-ascii?Q?uCCYWZRDv1LU7peSp6U2OLTdYVlQP9X77iiNg2R9mmUeqsSk7G06fD6GbhaQ?=
 =?us-ascii?Q?gSchmbSaY5KShAYdhZbq5wf7abNVC20tQcbM2dvuQIt7vJgLhmj+hrj7mhP9?=
 =?us-ascii?Q?FRAsOxdhT9RejrlrMjTXGDv6ZHsPMKTrnDZOUX1s4cRpJwB7Zc9ft+bYLe5C?=
 =?us-ascii?Q?J2m8J6nom/4J0So25nMZc+BtjFBHLOI3Rixw2o+LvlN0lzfasdRKybYKmt3F?=
 =?us-ascii?Q?jyc8/XGOIjLgeU7bbx7szHkShDWyDJLIuB/5wkPluQUky15/Aqdh05rK5du1?=
 =?us-ascii?Q?MDFiHBiZW4UWAjO0N83yIDYSXr7cC4ySQqseH/VyVNcK6yRmibCelJjnUonh?=
 =?us-ascii?Q?m8EcVwzW5U59wMALLd1/PncSmqA4OEgcxicRjd0FKmHvihttiq81gHylwc5U?=
 =?us-ascii?Q?V2AFFcCPJKOwDTcepON0gG88BfGN9a5seWFjL1dVmmmKzLJIibWWOeZkeG9J?=
 =?us-ascii?Q?w3gcVYg4YwHNdWemcbROUXJHZOjQYvsCOc7ovlXB2lKPmWWNNEtFffFjXvF5?=
 =?us-ascii?Q?gEiLVvcudY+RJG4nS8D2jCDoqUFyYceJ6EXsHWQpxZjpJhFq9NXtXUE2NZ3w?=
 =?us-ascii?Q?1S2U0QCyuKjtcefm28dSDHH1ot5An0du7ESPXWELaaYaV483OtTnTT92BxzJ?=
 =?us-ascii?Q?jYCI95nJLx9OL0ql+XmNUR/FmjaYGU1wOGvD+pz9MwGLNz+kUwIqnNZF6KaL?=
 =?us-ascii?Q?gt8u089f/XEZRhqXlE8SGh33ww0IXSheA+VvE1tzvp3bnIbcFGgIo9xj8EcA?=
 =?us-ascii?Q?fEkLcuuwWW3bMy2xCHuOhpARYYxZMynz0OqorQvS3WStX0TFm3MQkadLGvTL?=
 =?us-ascii?Q?sYa9VaVqLPmQIDc7xuuWhLo7rNqOoZWV3gmo5gObmX29SsdvNwMyG1JZR2TB?=
 =?us-ascii?Q?T312/i1wxUJRDcfZ6z1zVNjjU3hNXFxg2iXdF3lkqBw2Gkp6B/jibdL+qXd0?=
 =?us-ascii?Q?4VWgNY18gAO8WBOMAmd7lClsNJZXv6oXaRDAAZ+Y9sbYAvIRQCkuaztv1BX7?=
 =?us-ascii?Q?Qsmrxg8vR69XmqYU490=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 13:36:25.5371 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7fdf59-6aef-455a-41ae-08ddae6d1f49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6151
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoqQZnT+72PmOa3l0HJ6F10kQRHhylg/P2ZbCpWLh54=;
 b=OAYsoPUwyMttAbRZEHUwTnDIaDUL+qZMHmK6Znb5G/V7Gl19fxz9bVo1t7srUF3yMjh+bcOs3wJw1NZozTvMUVH7mlqh3pOry4rvFhClSrClWFpIWYFJG2iHEyUhR8jafx/wscRFUQRjvdpsD95rUuW/LViKDFoVzbT0veq/Ve4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=OAYsoPUw
Subject: [Buildroot] [PATCH v1 1/1] board/zynqmp: update custom board
 documentation
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the zynqmp readme.txt file to use BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE
option for configuring custom zynqmp boards with Buildroot.  There is no need
for any custom / manual steps since the support is included with Buildroot.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/readme.txt | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/board/zynqmp/readme.txt b/board/zynqmp/readme.txt
index a98ff78f6f..e76f0f03e0 100644
--- a/board/zynqmp/readme.txt
+++ b/board/zynqmp/readme.txt
@@ -86,25 +86,19 @@ updated for any programmable logic or DDR customizations which impact
 psu_init (clock/pin setup & mapping/AXI bridge setup/etc). See
 board/xilinx/zynqmp/ directory of U-Boot for natively supported psu_init
 files. If the psu_init files for your board are not found in U-Boot,
-you need to add them by yourself.
+you need to add them using BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE.
 
 1) Start with a defconfig supported by Buildroot (e.g. ZCU106)
     make zynqmp_zcu106_defconfig
 
-2) make uboot-menuconfig
-    Visit the following menu and enable CONFIG_XILINX_PS_INIT_FILE
+2) make menuconfig
+    Visit the following menu to configure BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE
 
-    ARM architecture  --->
-       [*] Zynq/ZynqMP PS init file(s) location
+    Bootloaders  --->
+       U-Boot  ---> 
+          (<Path to psu_init_gpl.c>) Custom psu_init_gpl file
 
-3) Copy psu_init_gpl.c/h generated by the Xilinx Vivado tools into
-   output/build/uboot-custom/board/xilinx/zynqmp/custom_hw_platform/
-
-4) make
-
-Note: The files in step 3 will need to be re-copied after cleaning the
-output directory and at this time, there is no way to save them as
-part of the buildroot configuration, except as a U-Boot patch.
+3) make
 
 ==============
 Important Note
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
