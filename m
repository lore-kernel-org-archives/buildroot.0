Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD90E77188
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 10:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06CE54198C;
	Fri, 20 Dec 2024 10:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4Va9cW4YqN0; Fri, 20 Dec 2024 10:36:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D08CD41882
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D08CD41882;
	Fri, 20 Dec 2024 10:36:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 487A6730
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 10:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E6C66080E
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 10:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6IyNPYxLbtg for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 10:35:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:240a::615;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 10D2D6061E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10D2D6061E
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::615])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10D2D6061E
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 10:35:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+16ZiXxHGDIJgfQIR58Hx3jLnFFRWSYrAJfBRcw8O3myh8YQi3gpv5aB5pgoxlXMYuhD2Gq9t8bsJvlkuiAXFtvdEEiz1zoGkgmjf3mTSHFA7sHV2eP9wYvHF798XuQ+lZXA7kjgmsnCYX6sx6bs9vqeZZPz7vCVcGYBZeg1YIa42pkchbspOpWDgvhlvZvgAr0kf0FLDpsHySoZ/cD1HHhJhr+Z1w1ntuojiiVkhfDWhFxX/7wMJqlqQLescCCKhug+tJQQkxEU8ngGJJFPyYqPtqn0cfr+DVcpZs9G2wLZMtDkXcxBuBuXS6wGbEFQC+x9M4Ll1zYOhePrhFXHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rk0dKmDogZpczE14KQr1OIv2ManZEc5SdjN/VB/qseM=;
 b=FqBATVBVyZC5skD45+HNBf2vY2+I92lprOVUtcysbvNQTPBA57ErBcI3WV4NKp8xPXxOmqG/P8lOdln+/Zgx2MShlQY+YsW9MSNW1+O43snw+73+7m7JKTIZ7uggCw2aQgUpL0kjIrxgJVubQZ3XzXVwvDTEhWoJvxcVMrmpxO8gjKvlzyxIHtrpoNP8fEVBHVx309sU/jXPD5qhJQjh2ey1yl7f3hE2VTxNzZf+7I3vYoysVQBQ+lgdPiCvrz1If8Zr4CMoY8pfYylnu2uv+qq4Vvzv7lL9O08uocWvjIQfYWHrmo9AEaxIdeMMT1CFo+SHkxhdJDoSkuHx1EBbHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0208.namprd03.prod.outlook.com (2603:10b6:408:f9::33)
 by BL3PR12MB6452.namprd12.prod.outlook.com (2603:10b6:208:3bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Fri, 20 Dec
 2024 10:35:44 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:f9:cafe::18) by BN9PR03CA0208.outlook.office365.com
 (2603:10b6:408:f9::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.15 via Frontend Transport; Fri,
 20 Dec 2024 10:35:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 10:35:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 04:35:43 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Dec 2024 04:35:42 -0600
To: <buildroot@buildroot.org>
Date: Fri, 20 Dec 2024 10:35:22 +0000
Message-ID: <20241220103523.2301721-6-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241220103523.2301721-1-neal.frager@amd.com>
References: <20241220103523.2301721-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|BL3PR12MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: 056b944f-45b7-4b31-685f-08dd20e20ece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f/reoLbU/oT9zDXJvoTWLRiMB63a2I+KSy7iBVdiMYQKcg2qhL0DS2JWp7vF?=
 =?us-ascii?Q?ZKQ5h+94Qw3alzRY4TPk4ZtTFcAnxeilY4S4khJNyGZp0u5fzUrdylMfA2a5?=
 =?us-ascii?Q?OIZFNQRYAZ6syJ/3CPjsP8WIbrXfSl4oQbv0uR2VqcDgDv/1ju3w1LdaRJjp?=
 =?us-ascii?Q?UndZkHJrGwQaA0zLjH/LutuSb4KhQiNP+ybpQpxiJKkJWEDp0m+V81ToV9od?=
 =?us-ascii?Q?LKSeMe3HD6ZOUI3t2h264rhVvhuYvp9ffBIQEripKILGFm1eoFxJ/MHfaNHn?=
 =?us-ascii?Q?Zc7j/U5RCayVY1lL2iMylUJCGhexGueXAIVaz/oBWQCpdgn80po8xGHqY9uU?=
 =?us-ascii?Q?+kG0RCUBpuacxJlCdpoDIBJebWBHk0+WbdRpgYpv2VFnx7WDkXb5brjrKheM?=
 =?us-ascii?Q?C5qNuQoBIX+IWvNkRGwxBGImLQhu5p51mjN+qL27fVh852/UEyy5W5d/BrV8?=
 =?us-ascii?Q?zaDKSY7viMy1bNQSt2aot2od0F2viKM2op/b2ikwKTVsWUpqVyUz2rbI/kae?=
 =?us-ascii?Q?+dexeefeg4oSVEB7tpT+iH24d6f2IN7fGU16vLZDpI1IL3E19W7iYXMf2iRC?=
 =?us-ascii?Q?MpMvK6bz+QqHPHo56R0PMwWgtMYa1Rw+6ZUpoAzDkPj186jnL2WkryiHE0vI?=
 =?us-ascii?Q?Mdc1J5EU6ZPGgPa25PVlQ6m0Wb9pvsmyTOmxHeDw53qly8BijU8cJsXDpDPB?=
 =?us-ascii?Q?TdI16NmYfhBsOvqpQCwRmqv8frKl131Eqr6SBaobOrLmFQXxkesEQZlHU3ip?=
 =?us-ascii?Q?jIua8lVfVkRjZVgccq+x449//JlCl+zGMQTQBaDS1zkV4AVD2CFz4MfXke0Q?=
 =?us-ascii?Q?4bzkCZXAVIy0O2ccikqpur+G0XLXcS7mfAErH5x0h/keww+/TWTBU+1GSKYq?=
 =?us-ascii?Q?185oVfQXMLLCBXrdZNqqyJd6YaMcholVN/DCOdEETS4JEWDzeKR+9r+oIhCF?=
 =?us-ascii?Q?U/Iou3zWWVUo9kqBKg98Zo+rmzAyTEsB7Q9kzQKyefZ+iXiHHhDeDRra/1k9?=
 =?us-ascii?Q?J+n+gbVpqjeVD2M4lfVz7UGMaq4Oxr6YfWW0IsQezbxGYj3liuAWNRYOL/GJ?=
 =?us-ascii?Q?mfvtceIvyEo8w2vjvxnIJBPVpZOnd/IfMZkPqvpCFq6/OpUGhnGZoXXpfP9W?=
 =?us-ascii?Q?7+lU8SaW2x7+KiE7/rP/0BfSn0datXLZWGxJ5bErWwNw7OtWitKJsQG10TQX?=
 =?us-ascii?Q?EXLE7dwjuQneNsT6/eE3jK9wmU0IdhWIW5foZd/EBm8qXuOxcj3FJAP2Xahm?=
 =?us-ascii?Q?NZ+pbP1pLVA/NwRuB1Xzox+kM40C+8gkx2/OgAAERKKOFBsoqkpeLeHEojJi?=
 =?us-ascii?Q?PXSGwEnoZ8mhNqb8KenUQYJSokASuCfgwcVef4PyGud4vdCnZ4wwxI4YgYDA?=
 =?us-ascii?Q?+5Rz90FLwZbzAW4IRk5n0AvtfMd+b7KmcYSiI4mQMcuBWl2L15CFJb4M9hzC?=
 =?us-ascii?Q?w3B+4CL8ie2FdwpYsAAezE7M256JTHIbm9jaRBEP8RjQS9MP+x3L2w=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 10:35:43.8959 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 056b944f-45b7-4b31-685f-08dd20e20ece
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6452
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rk0dKmDogZpczE14KQr1OIv2ManZEc5SdjN/VB/qseM=;
 b=f0VRDlAu4PP3Y6I2jJbdX24UEcFEh5oMp2EgIP1y8c1XiAZWXZhwmXsY57DBG5s+fJuRdoaSVTIHnWWo2Zvdp9TkOuOOKc/g2YY26N+gYQ3e0GkWg8jokJRT/yR8h/sjqn+uHfutYpR3pLj9qRQ+h86BwTekY0kunCXyhF1EXoE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=f0VRDlAu
Subject: [Buildroot] [PATCH v2 6/7] board/zynqmp: add new qspi.bin binary to
 images
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds the new qspi.bin file to the zynqmp sdcard.img.

For SD card booting, the qspi.bin file is unnecessary and can just be ignored.
For QSPI booting, only the qspi.bin file needs to be written to the flash.

This patch enables the Kria BIRT tool for Kria SOM reflashing using qspi.bin
as either "ImageA" or "ImageB".

Kria SBIRT (Boot Image Recovery Tool):
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+SOMs+Starter+Kits#Boot-FW-Update-Process

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - new to patch series
---
 board/zynqmp/genimage.cfg           | 1 +
 configs/zynqmp_kria_kd240_defconfig | 1 +
 configs/zynqmp_kria_kr260_defconfig | 1 +
 configs/zynqmp_kria_kv260_defconfig | 1 +
 configs/zynqmp_zcu102_defconfig     | 1 +
 configs/zynqmp_zcu104_defconfig     | 1 +
 configs/zynqmp_zcu106_defconfig     | 1 +
 7 files changed, 7 insertions(+)

diff --git a/board/zynqmp/genimage.cfg b/board/zynqmp/genimage.cfg
index 20d8352c08..0a6aea7a29 100644
--- a/board/zynqmp/genimage.cfg
+++ b/board/zynqmp/genimage.cfg
@@ -3,6 +3,7 @@ image boot.vfat {
 		files = {
 			"boot.bin",
 			"u-boot.itb",
+			"qspi.bin",
 			"system.dtb",
 			"Image"
 		}
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 5755129bc5..0c4e3e6237 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -33,6 +33,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 4233992c00..81412c8204 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -33,6 +33,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index ab78e9005e..1e2c55facd 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -33,6 +33,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index af2f6ebc40..65fc583707 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -32,6 +32,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 6754381f2f..d4deb3853c 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -32,6 +32,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index bf0cadc699..0526ec9107 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -32,6 +32,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
