Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32325CA0EE4
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 06:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA7676F778;
	Tue, 26 Aug 2025 06:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2ScfAS9FwqH; Tue, 26 Aug 2025 06:10:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CB436F76B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CB436F76B;
	Tue, 26 Aug 2025 06:10:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 39920CD
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 06:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FE3841C42
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 06:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4D47051Rg-UB for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 06:10:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::62d;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5F3AD4076C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F3AD4076C
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F3AD4076C
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 06:10:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rwN3ynUk1ZKO6O+c6WejejhPkkWDj26LbhLl+9z5RdVEQqBfuveRL+hBvubWJMBxIS2O2ionaIReyVJ/hkWMnEAoMKXYFD/VU70XYt2wRVDHizNM5Xa/N5NHTXS5tZEhS+fCOE0trRovh3NOQO8aAp9g3kuU+fRBPt3IMi1CD4nr6tmR6YKtefIEWoHTf2LEyeyQBEhMBXOX/UHAC/gU4FS7jhMKi2Bwk4//Wyqv5xqecSjKIzvj1P/UtoZG7IFPdbSre90K6s2kQq1A7fj5UV8ZTrAPJMXQRtuJjsSbDBCsrPEbhVh57WaZt2bHP9r98UO1j0Eq6B3R8x0M0V/5Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrmejogQfttBER1wbnWnKTJp9nKka6H44I97JM6F8OY=;
 b=HmE+HiMa3hRSUDJPcJYbf172ZkBcgaqBwLTr6uGBWgGcEbppkOZxUCJTFky8sHFBiGXyhZnyk6xVkhM8MrXA50uo1VejILCI5tccVGydHcA9+GnTCQ/0t4CWMnr6qi/sl7cRXex+AwcaQcakHJOpm0Z+ulAIvVke9TD7ijYD9jy/sz0sqCitfQ0m9LvoICa7PhD4T6v8DFDDgZ1CKQ4iqsOGL0j+yfohC152fVSqG6cUJ9CvqBc66UYvdDhNKtKKm2XmLAFbqrcUyN5LAu+qDqqq7sqHd0XbEbnZhm08sHiddjMQkcyr+H8S8F0mTFH0Aku5XtLyWHf+487EHLAy2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN2PR16CA0045.namprd16.prod.outlook.com (2603:10b6:208:234::14)
 by CH3PR12MB7569.namprd12.prod.outlook.com (2603:10b6:610:146::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 06:09:56 +0000
Received: from BL02EPF00021F6D.namprd02.prod.outlook.com
 (2603:10b6:208:234:cafe::57) by MN2PR16CA0045.outlook.office365.com
 (2603:10b6:208:234::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Tue,
 26 Aug 2025 06:09:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6D.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Tue, 26 Aug 2025 06:09:55 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 01:09:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 25 Aug
 2025 23:09:55 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 01:09:53 -0500
To: <buildroot@buildroot.org>
Date: Tue, 26 Aug 2025 07:09:42 +0100
Message-ID: <20250826060943.1394934-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250826060943.1394934-1-neal.frager@amd.com>
References: <20250826060943.1394934-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6D:EE_|CH3PR12MB7569:EE_
X-MS-Office365-Filtering-Correlation-Id: aadcb598-2ea1-44d2-e558-08dde4672dbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|7416014|82310400026|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3nYRvDZoskYHNvOcqLtGwT77ydbfOcotGTx2kF+mfF1wj7OXCb9UVVcAsBi3?=
 =?us-ascii?Q?TFQAS4VYQiHZeRSGVGF6yElGx7HcDi9996aapwEwW+6q6u7Wwp2QilUdBgHR?=
 =?us-ascii?Q?WQJMZ18Og3xJvo1oWB3ZeQK5c8VNRKXUNJdlIdTT2q7ko9faF7QIw+P0cDNd?=
 =?us-ascii?Q?ECSs+1P9Tu5LOsftzfp3zcR0DSqx18vHIffiVDxK0XcdWhPIeVMebuMxm9FD?=
 =?us-ascii?Q?xZ19u5XogW3YC87C3vtRfIDpMiVFZqfSpyhYHan6qGrbST0JHAfsMnG6Ayqk?=
 =?us-ascii?Q?KobqxJCJNjZZitRlDyz3oWUkYBQtX5DJ3pLQBM4hiNSWjh8tS77bwdnkVSLK?=
 =?us-ascii?Q?Rfm84Zdhh0/oUcOx8Yag6s7edKzgPZlkiyxP1MBDY3hM6Su6irjSHltbrkfG?=
 =?us-ascii?Q?F7vigJXldKwrPQgwCwOHcLBuG04oJq6ScjmFSbMvNzT9HAbrfik2xCCI5Mgo?=
 =?us-ascii?Q?Kd1WR1yx3sWC8nG5Upu1YvyAH868Y63nb2//d0agJa40gUV7Lg5Kj3laR/qa?=
 =?us-ascii?Q?d44jLAsKvfJLGXyykLXd/F54X+wqnpamdTsg8RF8drTA3O3RCvSd8lP6lf4I?=
 =?us-ascii?Q?iKml45NYBGNzAJptQ/4SfiEAV7EJyw83m5dnAxjneM7o5Z1pDuU5YvpiZDEf?=
 =?us-ascii?Q?GUYeAa67y7yKihSfHrTKiVpvZ8XR7vkcJH8cYVKs2anGQL1AytfPm1s1FEMu?=
 =?us-ascii?Q?nK2dWQeLvjcQGcvNzochcqW8NeSEhd7GLmI5weunCSDDSL+dPQDjcHlISsh/?=
 =?us-ascii?Q?yZEQ4pWa9tKYXs6W9UHQ0K0VjYimIb8qxtMCOWz5F50ln1OCqQvy7M8fny9c?=
 =?us-ascii?Q?4m8P+SeK05TnD5H12psYD6FPqolR5zd4cSPe2C1qsTmbLfQxkt7+PCM95GWB?=
 =?us-ascii?Q?1CkO2idhmEd/R9o80q/W0h0hCmZlkhXV0eOWWhluz7TLmbD4GLPy6oKG3Djj?=
 =?us-ascii?Q?MlUH2+8Ko+7LIT4yzpOB5qsY1RWb3Q/9gy48K49XwNsNLStOaejiNiqju6y4?=
 =?us-ascii?Q?8pTmTpzQbXNLBlBz6FMovAhFUa4iiBmXxF3/Ox/uXBQGkTGhqnlTF1COw+2+?=
 =?us-ascii?Q?grNqFay/2tw0rkZfqmVW5LRXmORt5bfbRsCbNb4YojC/EU6yg5Va0VbQjFMq?=
 =?us-ascii?Q?pbsClVAPS670FHXDzOCL1CuQ70GQQ6cppNXtVUdBQFU6nje00nza+V/OtEPI?=
 =?us-ascii?Q?+YJpnlBuGaU7y8t03M9slm2rJL3W0jN+l24SFkJjzEnIptc8dbMih+l3H1N4?=
 =?us-ascii?Q?BVah1kUDDPOJjc4j6Pi4ovlY8yGanpEtS4d+gbVq6nDuRS6DEHo35+A4x0wA?=
 =?us-ascii?Q?VFI9yFZpTywTK0I+O5ZQAMBE8PJa1kzBVrgIHxjlmjHIZOqZ+gHY4kID8/N3?=
 =?us-ascii?Q?1aiTD4VTySCU8eSb4bfqshsNVEk9vqwLSM4ekxJeokJcBNP7TvNBI7XQwiWu?=
 =?us-ascii?Q?zR/LzXbdMk//NZx/D3IDQSxxHvOGxmu7iEhujchbafJo08DL++6CyNDKIoSA?=
 =?us-ascii?Q?bXiVp44Y8BR2jTiOWZD67w8Im9/fayFJptnl17T+IuPY7+G2HX1PAyv6ZF8x?=
 =?us-ascii?Q?C6mYgPua2T60wGHy50w=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(7416014)(82310400026)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 06:09:55.6136 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aadcb598-2ea1-44d2-e558-08dde4672dbc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7569
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrmejogQfttBER1wbnWnKTJp9nKka6H44I97JM6F8OY=;
 b=eiaI2Xh7a1DuI75A8/QnK12hA/WSDUhqbpEhm2jG/hvZ69VmUkm8H/sYXRBmu9Ll0/CECSIlSF3eUIdV3TJcLAH88DZjmMfdzcTsbYRESBTU3SwjIx6ziVBpgIKJarP+bMxItQw/RT8hmrztGtwwPOo3ret3H/I4rmqiviTrS48=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eiaI2Xh7
Subject: [Buildroot] [PATCH v2 4/5] configs/versal_*: bump xilinx-prebuilt
 to xilinx_v2025.1_update1
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
 yann.morin@orange.com, brandon.maier@collins.com, manikanta.sreeram@amd.com,
 ju.o@free.fr, Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the other versal defconfigs xilinx-prebuilt package to
version xilinx_v2025.1_update1.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- new to patch series
---
 configs/versal_vck190_defconfig | 1 +
 configs/versal_vpk180_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index c9d99876d5..8338e36a90 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -43,6 +43,7 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2025.1_update1"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 500298c2f4..6307cf115f 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -43,6 +43,7 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2025.1_update1"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vpk180"
 BR2_PACKAGE_HOST_BOOTGEN=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
