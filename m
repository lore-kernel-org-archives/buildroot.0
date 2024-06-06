Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036CCC25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 12:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B74BE81BD4;
	Thu,  6 Jun 2024 12:08:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7eedRfUkR394; Thu,  6 Jun 2024 12:08:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 935E681D16
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 935E681D16;
	Thu,  6 Jun 2024 12:08:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9799F1BF589
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 12:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9021B416D5
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 12:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L_WwUoxC7aKM for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 12:08:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::601;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5106441697
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5106441697
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::601])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5106441697
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 12:08:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDkYWxl9n2JKyLVXaOAfWUlltdIvAILRhO/j6fnr/yba6LuUfsK7uZeUOgDDukTx4r6ZoDjYeweTkVVfaThF0gr2OKA8ABP2//walUkMfihbp2vw8E7AwUubqGU1dGdH2FLmp3ndCscEAvr4Lk3rmXb8AjTDxsXUgu6EP/00+iZhb0wCg5yrPdJ+n4lFpJmW+F+8UzdQPHWEq5Ls1Dko9YWsxU7xZ7RLTZPNRyBgKN5t4CEyEGsIPHqLyEI7EAsZ5g/Ev/Fefe1Yr01syM7NrUNHyNLkhYrYoo5FQ0p14T8d5ps9S6Fpphi44wakKn15LwkZ7q8HWS3A7VeJtzc4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgllaCX/hPZIOud4l4z7iGFw3i0IZ60OF486JM4rhrE=;
 b=MarZ63+8IYPBrOrQfEdIUb4I73N1y6UZ0mHa3L8J80bsGBcRZ16kN3I/dBDDCI+IOUiYNeGggew1yS4OMNrEsXMoSmAXW+yZxU/MxGe5JpVzR4m8JggFQjo1aUqJiQiAJkW9KAtEdmgd4V412QVTZJGyk1gwoZf138ZLHVgrsneOnzwVr8KuZ2UCBFaiuR/9CZSKzAms9eOBm5fUQUnJlvSZ2Ks83O7t9aJ9wnJC3l9ULR2zjtpCYQin3FpDH9iqzWHYEUrj6vMwNRoYzxIL70Zu3/5UyagOOLpNsVTeK53qnNlJCEkNFR2biyrsPy/rcwNGrzm2OaT/XSoImsCJnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR04CA0032.namprd04.prod.outlook.com (2603:10b6:a03:40::45)
 by CY8PR12MB7681.namprd12.prod.outlook.com (2603:10b6:930:84::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 12:08:02 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:40:cafe::51) by BYAPR04CA0032.outlook.office365.com
 (2603:10b6:a03:40::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31 via Frontend
 Transport; Thu, 6 Jun 2024 12:08:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Thu, 6 Jun 2024 12:08:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 6 Jun
 2024 07:08:00 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 6 Jun
 2024 07:07:59 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 6 Jun 2024 07:07:58 -0500
To: <buildroot@buildroot.org>
Date: Thu, 6 Jun 2024 13:07:56 +0100
Message-ID: <20240606120756.953582-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|CY8PR12MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: e81cd7c9-519f-4c48-e408-08dc86215013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|36860700004|376005|82310400017|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kr17cimgBrM6GUjRs1cD5xtq8UBUKONxY2MLWrAFDf3kXs6JXsbZajU2P5mH?=
 =?us-ascii?Q?ncFaEPBfZuttEctTCHfGMlxUY/IswtqY32Vp/KyMyaPm/MkJgUa+ckt+0cgB?=
 =?us-ascii?Q?B6PwaLaBM5u/4O3hOPYzMpA2RlP0Nh7vhYslfZ4EamTlaC47pS/4qL47IWOa?=
 =?us-ascii?Q?3RvoBHfzdLE3g3TOb/KsSgiBs16GZhoeFGFgqSRxYqm1LAO9eWV+3gcTjJR5?=
 =?us-ascii?Q?OysQ21WNAY2DAI3xieccl4YHoOv2tkT3eqnObzcz2Sq+2o5Et+lTrwMFeqgC?=
 =?us-ascii?Q?D4jul7U+hd3sYm4c0c132ue+RkEpQd1Wz+TKFk8XloHcAe8zt5K45TEAn3ya?=
 =?us-ascii?Q?+3YwQrTHORPCXMLICsWbG7nI5K6S3mxBEUqji6enBb9jkb1PtNBXI5ZsTU0f?=
 =?us-ascii?Q?jLLWa6Q8LygL9VZkXbrytuEpd/+Ts2r68MqrLYBxvkxzQgS3GkOmOhWpxPef?=
 =?us-ascii?Q?+bGKVWtXTtckb8IILmiQ1VjYFvLcmws3Te69GndDrTXTQWG8zhFcEotUFEd4?=
 =?us-ascii?Q?dL/TTTgLSqBe4qihWfHKm5IVoSOM0nHdrXINxgOHhEDeVKJbMxuJwhV0aQDR?=
 =?us-ascii?Q?NuGf90+eRFkqAABetfS29faWWUO9Wye5AurVkbtLN3weUR+Fklbm/imgy3QO?=
 =?us-ascii?Q?YLvBXQgHB15IK5tFxtKlNXLAgOb5X+qYG9M01DNBtUk1Emw7OE39zrdLd0G0?=
 =?us-ascii?Q?MeSJOvCzwobKztu09DMQ9j3QY5wf9APdKmYHC35s3LIcHMa2vmcBU3vBgB8M?=
 =?us-ascii?Q?F0/qm4zXaWpgJo2TXlPluHxlSZOT02cSu8PX99ShkdTtfyYOxzyBqQrj1lYz?=
 =?us-ascii?Q?SvktAR4dyl/17uMYOYPjdmK6VCLzJhnO6YMcpNfXBaeOUWLVuK9vX1eH1FOE?=
 =?us-ascii?Q?ZebjjlQTeGk7m/kZAvLcB1ijQWHiB/l5FcPA+ov2lhVJcUklFTzdgpFXv5kG?=
 =?us-ascii?Q?H0W39OOE5vRdmphXiP/MlJp6/9d9LOkbUqvnoHjNfzVH76ZKPTnCKNqYlT3E?=
 =?us-ascii?Q?IC+5AZVGbgyxRfy3d336vHeuXjtWuskmB2twq/17qaFIaDWkBU/t1RxPDZB5?=
 =?us-ascii?Q?xS6mr34frIBqLBk8YW5pj2IdeQii9r3eED/qy1SpQpyC6qFeyo4eWPLNW8/x?=
 =?us-ascii?Q?MX78nXNvIvvROyOQ0kD/MqRKzbhmPKoolhgmNwsWGdqGEj3A4WQlqx4sCHiT?=
 =?us-ascii?Q?Q4meZy9P9L/8fH8iJUHK/icar/oyaDTG6q5rUmQbEIRQpiDD9RGINDy2JgKV?=
 =?us-ascii?Q?XOmHy8UQ41mP1o+Nrd24Q9NTpuw86AUlnNRxnbmOPKZzSHTejmYKga+akGS7?=
 =?us-ascii?Q?cu7XQz39722pPEsGJTqzV7o6jRjPPVRN8UXx2y2fD2ECHCMXC9equAampoPa?=
 =?us-ascii?Q?tgXk8K9cujlfjERMg8ofam1dwW0n+nCipq5FmxNKjU24/6+0mPFFkl0DumPm?=
 =?us-ascii?Q?hvpeFxVo79LCUNGrplmbaHGJiZEzomZT?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(376005)(82310400017)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 12:08:01.1541 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e81cd7c9-519f-4c48-e408-08dc86215013
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7681
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgllaCX/hPZIOud4l4z7iGFw3i0IZ60OF486JM4rhrE=;
 b=ov94kJL1u361CDrxh9eVJ+l+GG4ysTdiJWbyM/ohutiRH8uPu4secB2DQPqGIH+0Y9WKFlypBZ6HYTkWyhJGKxYjm6DwP8g4wR4K8bhnk51kf/msv6zqyXpgHBg8VXL7aSTtiN0d3NNqXgzIaKlmIuE3lqhk8MmPOkvJV9/hTPU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ov94kJL1
Subject: [Buildroot] [PATCH v1 1/1] configs/versal_vck190_defconfig: add
 hashes
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .checkpackageignore                                             | 1 -
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash      | 2 ++
 board/xilinx/patches/versal-firmware/versal-firmware.hash       | 2 ++
 configs/versal_vck190_defconfig                                 | 2 ++
 4 files changed, 6 insertions(+), 1 deletion(-)
 create mode 100644 board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 100644 board/xilinx/patches/versal-firmware/versal-firmware.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index c3de61111f..eea412d01d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -358,7 +358,6 @@ configs/ts4900_defconfig lib_defconfig.ForceCheckHash
 configs/ts5500_defconfig lib_defconfig.ForceCheckHash
 configs/ts7680_defconfig lib_defconfig.ForceCheckHash
 configs/uevm5432_defconfig lib_defconfig.ForceCheckHash
-configs/versal_vck190_defconfig lib_defconfig.ForceCheckHash
 configs/visionfive_defconfig lib_defconfig.ForceCheckHash
 configs/wandboard_defconfig lib_defconfig.ForceCheckHash
 configs/warp7_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..e300398541
--- /dev/null
+++ b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c3369c89eab4e452bbc76c630e5dccb6c0ae588c0175b6c8549aa0241deb06ef  xlnx_rebase_v2.10_2024.1.tar.gz
diff --git a/board/xilinx/patches/versal-firmware/versal-firmware.hash b/board/xilinx/patches/versal-firmware/versal-firmware.hash
new file mode 100644
index 0000000000..c4d745f22c
--- /dev/null
+++ b/board/xilinx/patches/versal-firmware/versal-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  versal-firmware-xilinx_v2024.1.tar.gz
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index ecfc10cc91..69272e721c 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -39,3 +39,5 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_BOOTGEN=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
