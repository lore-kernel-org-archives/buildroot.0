Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176F2CA0FE7
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 15:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF54084CCD;
	Mon, 25 Aug 2025 15:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1j-uBnyNr9y; Mon, 25 Aug 2025 15:24:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECBBB84C78
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECBBB84C78;
	Mon, 25 Aug 2025 15:24:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AAC91CA
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 15:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90B8C42A17
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 15:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e494wBr3-znz for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 15:24:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::624;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C2FF5417A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2FF5417A0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::624])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2FF5417A0
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 15:24:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o25uJalTSsfOlz8H6nEBXlND7ywJ6tUVh9ygIyD7vtAYzxRLFokTADJvvmq3lmtMzKyJ0K4hzVifgyl7d5KDUO1fKRm3fEPj1nycA52lGJYLCqRgH0XVRIwhgMgTDTfPdYrbQFXh2Fuy2hha4ABHF7exZ2IpSUQhWZ0VzzGBJqUO2psPVcegD6eq/khKGDxA3vaqKzd8eGCP+yrdgwM7bqHX35f73Gp6uxbra9W7uuDoDzH+oVhEkB1cMVOXzi309Zinzc2pTwavKx3YzFj1cJ1TnlHbwHTsbgWSBAV4Lzn1Jip/AM7sjVPwj0JHpKf/x/Phpw0hMdJh16vJuQT0ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsNYLrcWoGMUb2CX+bU5MV1stTmhmga6SBNSr1Gnn3o=;
 b=okzNqu78YX/4JU8bC5QKGlTNSmC+RTIBXNuuivJqg/Cp3wuA5X1EW0iO8Yd48ytRrKWos9KC2XT0LPtzvSwQJhculgaTrJjCuqOuQsNsS31bE+CwaSUcYg4fBNjNm632fuXtNh+nxUepTCVyMeQ4w5/QfByH4qmnykLGY30aPtUrfMqigL0ph81FzWXobyQFP3GsYzuu44c50TT1fBPDiSLBnDfAdMDKY2JXIQsjJBctuA833mIUEk4wx5ctmV7G/WRl5jIVomxHMMqEL5y/GI3TAUtLHf2BAXwmqix5q9i9U2vAHVscYH3AZVyzVGjBucHML9mAVFdzNdnN91TbuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN0P223CA0027.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::24)
 by CY1PR12MB9649.namprd12.prod.outlook.com (2603:10b6:930:106::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 15:24:08 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:52b:cafe::a6) by MN0P223CA0027.outlook.office365.com
 (2603:10b6:208:52b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Mon,
 25 Aug 2025 15:24:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Mon, 25 Aug 2025 15:24:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 10:24:07 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 10:24:06 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Aug 2025 10:24:05 -0500
To: <buildroot@buildroot.org>
Date: Mon, 25 Aug 2025 16:23:58 +0100
Message-ID: <20250825152358.3409564-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|CY1PR12MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: 361c08f2-6267-40b6-af04-08dde3eb6ef2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3OxSGCHksHBASzEqNzgSyz3kHnQthM/hcrkK3U3bSie2Gvmed2tTe8w0n0Lu?=
 =?us-ascii?Q?eb+ZN86rM2v0mL00ZKemP8W68Eiqydql6WIP2ihGWCSZ+Y1XGPqgxJAWkH9m?=
 =?us-ascii?Q?qPVzEAyrAXrjTTtlvZLeFHR2W7OlQ4PSgwRg0Z8UM4GyD4zOD8HjHlGol8DF?=
 =?us-ascii?Q?dgI04LKpJMUTe7Y5w9szwb6uIvwVd0p+a0FSW2dK7rTedHiXkNFgKFxs2G1o?=
 =?us-ascii?Q?HIsma+S9I3VblY7VZ/JmhczPMFDjw6kCTO+DnKPnURoVWJs2ugibzL706KKf?=
 =?us-ascii?Q?A+wZnL1sKS5a4vhPa8c8R+8dDuiqJTt0fGjW5l7l3cxa6/E0ywniwrI+jtHt?=
 =?us-ascii?Q?OZLJuAPtTDzzIc+1B3cM53+O6fA2k5LU/nOMkRo0y8dcdPOk+5prNCLs0XvC?=
 =?us-ascii?Q?BIoaR2K1UEdBIp0mkIlmxfdXr0FBj5qk3wbFgCFQKJVTyWd5dKeq+kGO1CP9?=
 =?us-ascii?Q?FT/dLb7fJxzAPP+pg9dpJkzSE5SiV6R5abdSVmFAbBc/1DbnxA/lzK4jL+cR?=
 =?us-ascii?Q?GZsTl8rkP+r/4YupAmO91QZVxpqJmAg2yaqrJ4oSW65QYft7mdz7Q26o471U?=
 =?us-ascii?Q?Dvvv1+jxLW3vf3yJaeVaB6/ofITZkyAbl5uosMf85qNJqXBW0v6G/eVl92Xv?=
 =?us-ascii?Q?deOl9vJc9fOra5/pcUYvl5RLTaEm2Hk3kyW+qqFwT2hBuAQDbSKYwhIUixyK?=
 =?us-ascii?Q?XVthYlCn4N73DXcDKgsPCldXqKviaZXZPIduxKtlKqypTIeIiNeC7ibvHMBj?=
 =?us-ascii?Q?lZNB9N/AeslPM5gDWrpYC0UBBz8wdbAUJ5ZpQZAxhSn2n9j74t9/2Pd+fcSg?=
 =?us-ascii?Q?O5trVJP5YP9wZtKdJLVcJLdxQ8vaZHiygCDjThCh/06Cr+YuaTfMt7d82GYQ?=
 =?us-ascii?Q?myG9ZpWIiFSQEJbjbOK1MkMbhL41nlRQ2VXgtWmpJN2dZJMOBum1aTBI/OjE?=
 =?us-ascii?Q?N0A6HeBsovXTrAooks0HIWRv/MvNnu5rNLSjvLPz6JuWTWiBQbA4JyQnoL0R?=
 =?us-ascii?Q?t9T5H5IgcM2qDilotIWVczfPiJn5yXFD7NKdLxGbw+OEx0Gh1Wy4+MxQpLV9?=
 =?us-ascii?Q?C7ahp4J7D89Wo82JjWMWazq8+0nhV6xEl9Jh6asY10G7QCPaQXvDcHwl1sZD?=
 =?us-ascii?Q?vqbEJV4s9vq9F+QexPggx2XG5ptxxYrS/jG7CnlosmZVceu8BEGlqmoCDKbR?=
 =?us-ascii?Q?l817BY4Y8qJDdo+fn8RY4qO21XZzhCHqls/quDmYT5bDPlxsudhR5OgrfsJx?=
 =?us-ascii?Q?oiN3f5LtsAl9zJNHmndHp5tttpwf7npi24HA+hDXvoQ9Wd5MPadbwVA3zUUP?=
 =?us-ascii?Q?XmoseVJsEwAPpAwz7ZHy6aBtxDeY+FVjgQv7Ko5aC9XBWi7theg/Oo9QzIBm?=
 =?us-ascii?Q?TKkXQ9+ZF1ygr0JksCKikgW10nFAzQdb9Rj4Y6eEePN2ZIINGg6eODdu5mOK?=
 =?us-ascii?Q?lKLr/zsAaOzxr68OxOymlxl8sjh0FZ4IYCbCyW37ZQ1fnyYoAkMdtCdBITWr?=
 =?us-ascii?Q?ww++EUlWJ4Oa9EM8xXRPHDSH6DIQfEQnPL9LuBoyT1t0Log8N91I+zKPBTGK?=
 =?us-ascii?Q?0dx4Z7AVXzUsDszeCyk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 15:24:07.4264 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 361c08f2-6267-40b6-af04-08dde3eb6ef2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9649
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsNYLrcWoGMUb2CX+bU5MV1stTmhmga6SBNSr1Gnn3o=;
 b=DUBdhY4bXWrRXHSXKCVaPR5tRR/jJK0x4QJGOSpYckk+05/nJNRxjLeDb1wqca9uvuu3PD201LQd2tzU+nV7GmvwxlE0Qe0bnDgwTRTA2YEH9FYViTmjdfgDXUNw2PbSOCsHSCJmN3eJY0NxZofXFyf0iLpuFeb2zs7VCdii7yk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=DUBdhY4b
Subject: [Buildroot] [PATCH v1 1/1] board/xilinx: remove xilinx_v2024.2
 hashes
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
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch removes the xilinx_v2024.2 hashes since all xilinx defconfigs have
been bumped to xilinx_v2025.1.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash       | 1 -
 board/xilinx/patches/linux/linux.hash                            | 1 -
 board/xilinx/patches/uboot/uboot.hash                            | 1 -
 3 files changed, 3 deletions(-)

diff --git a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 2ef3825bb9..d7bd1e73ef 100644
--- a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  a45390c9e1d584a389abd37ee49dce3f8d3b41718b1fd7c977608b5387a38955  xlnx_rebase_v2.10_2024.2.tar.gz
 sha256  4d16661f367adb8713113acb420a1ad5f611ce6a309e98005a8ea3273511f03d  xlnx_rebase_v2.12_2025.1.tar.gz
diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index 0022390aa6..902169229c 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  b726226e8784d92049190f19768d393eccf3ad111c7a2e685bb29cfa1bdf1f70  xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz
 sha256  25795c354f30a3358506ab02deeac99e7f79850804c52d6c3d5539fd310f0491  xlnx_rebase_v6.12_LTS_2025.1.tar.gz
diff --git a/board/xilinx/patches/uboot/uboot.hash b/board/xilinx/patches/uboot/uboot.hash
index 56ee166378..19192b182c 100644
--- a/board/xilinx/patches/uboot/uboot.hash
+++ b/board/xilinx/patches/uboot/uboot.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  f1a86ccdbe60bac89177a24bbfd56fc6e8e67823669f0997de563c3cc0ea4dd1  xlnx_rebase_v2024.01_2024.2.tar.gz
 sha256  b86d6f07d16a83ed0bdbd9b9439e099afc87ba7dfb77246e2472183848e2ea93  xlnx_rebase_v2025.01_2025.1.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
