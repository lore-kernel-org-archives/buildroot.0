Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DC6D111BD
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 08:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF807404F9;
	Mon,  4 Nov 2024 08:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tovo2oJ2Sj9t; Mon,  4 Nov 2024 08:15:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4457D4051E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4457D4051E;
	Mon,  4 Nov 2024 08:15:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ED7F1B8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 08:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF9B980BA4
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 08:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SikftdFvLlT5 for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 08:15:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::610;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C06D980B51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C06D980B51
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::610])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C06D980B51
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 08:15:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjX2aeEdhFpmU/gJPzvCTA4Sm/m6U1N+VXR0/NVIE/G16+4WAcVRJjlqH5mWm6ULt+koRpDk0dy7ooXAcC6+Bgc5L7aw1K5+9UUKi4FH0qLd4hKisw7+GAept8MY5SBze5opc4Olwz99UfzQ21UjX3NvjNGxEqsKrxv06ZQxfkcxUek3Qwgq5reFVpzSWKURBrK7UAD9tQKXwgJMiaZ32hJdrj9mEAHDswK28rgNsyZpz/L9zWPTyI1ew1a4bSl6p2MzHO33mOiaAK17wK5W9K+4VwUKAdE0gpXJs3mXxUl5DdvHjuFEDLT07fwg7JDQ1RrVP3y597gVXSJqClXYkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8lZl09xwexUgry+fW+Q24Y509+Foh1QEqw0z9DDNzY=;
 b=Qm5RD/os8P0EmHl82xqcj+yZ1+xLenx4HH/CAV5YHDppd+EJckgD8iOHvXDj6uPyoVmAaQ4mrx/wXUW7C0eEvByEcZWWUr63cVM/OgrW4bYepQShGD0C2m4BsIvzsg4VIkqmZQ7r4gauez0me3gro7669bF6Xcr8n1Vn67dTCWvLTUC8v1Vo9M/+zd+GCGMeU1wPQnCrl+uLkIv9ENlR+1N6vJnQjJtWUSi0Jq0+wiFZHY/FwGVB+kK1SRyFdrLZ9fLTasKTWvbXaSjjsyJWaunfWRysRZhlYKPIj6Zsr8RLU0JAk/icpB9GfFssD61/tiACX4aKvAufLcabQ/4rDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH0P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::18)
 by CH3PR12MB8877.namprd12.prod.outlook.com (2603:10b6:610:170::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 08:15:09 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:510:d3:cafe::15) by PH0P220CA0025.outlook.office365.com
 (2603:10b6:510:d3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30 via Frontend
 Transport; Mon, 4 Nov 2024 08:15:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Mon, 4 Nov 2024 08:15:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Nov
 2024 02:15:05 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 4 Nov 2024 02:15:04 -0600
To: <buildroot@buildroot.org>
Date: Mon, 4 Nov 2024 08:14:53 +0000
Message-ID: <20241104081453.430619-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241104081453.430619-1-neal.frager@amd.com>
References: <20241104081453.430619-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|CH3PR12MB8877:EE_
X-MS-Office365-Filtering-Correlation-Id: 7269563a-e14f-4d8b-dadc-08dcfca8cc2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m4iMRXXqCli2x0Rvjye5IeeN41G03oE6Gs3KoGrr5bPQ9u0BMBin0a/Zup/w?=
 =?us-ascii?Q?QOito6ZuHGe2l4jg80Z8vI95YVndIXAxCgraJGXezxaGQm24hHkPRSccg6cp?=
 =?us-ascii?Q?6UclCRH512Iqhnuf2RHpTh2mEBiiYKj1i2bsolfWW99eJHhaQ4vf45a8ZT54?=
 =?us-ascii?Q?ylVvsOSHGhqEuEzwLwbNFBuid+umCh+Uc3YLvk5paP1mPI6mRRV62zSATBAN?=
 =?us-ascii?Q?HUkq3+azgon7iySKUOuwd3TDhkQRk4X2da6b9JBq9QJHZaTP9PoooDMLCieU?=
 =?us-ascii?Q?qKzTsqt5NixJUWlsGG2hkMYDzpE8joBoGDC1OGsp2PlyPKE8DE7+jl2C8I64?=
 =?us-ascii?Q?+gb2mzoGWRk+8ziGrt9G5IkSmDU+YHxcAfQ2xvMGE6H1aJhhGxJ1IP25gZBy?=
 =?us-ascii?Q?4As/2osytygmBgZal0R9EIb/UIJAiyXVIGA7fUDFaKSRBcGYM6+Fz92V5VWZ?=
 =?us-ascii?Q?sL43xgGciYiXsC0FWKT8ILHNrOV+rnorjsdIS5FRJ1jz5ARmhUPSH1BHH//o?=
 =?us-ascii?Q?BR2RsP19xrold82txvYKQ+FmvTJGUrt7vCNDtrlyOlTM4kZBCG1UosiIN6fz?=
 =?us-ascii?Q?Qvl/KHHyksfW9ELa6ndO8kBQ8LFTS6mbczHv/Zi407kqJcKm5XzrDjq83gVg?=
 =?us-ascii?Q?GDAosxGVamhnnEt7eCgPFUlYlsIPyUAOOZ3061SHYKKhRNRlBZyaGKXsxfO/?=
 =?us-ascii?Q?0b+TB5VcFN4Xq2jGZBbmI2aAq7Omd88wuZ5G61izR/jK8VskvMyq5TD745Iw?=
 =?us-ascii?Q?ZpqPLBs3JtNe6sIwG8AWg/vmGa8Eu/W5RyTgdG38BF1yTy/69WclN/lkaly/?=
 =?us-ascii?Q?komCunss7YfHj1PADO4BrXQokF9yFLPEhLYPDwNgIXZdAfrZmab0Xx4Eckot?=
 =?us-ascii?Q?+CI9QvlVK76E4lhhiGaRXXRsr36eM94jnWJGl4x0MPGH4eWHfyy3x5c9HNmM?=
 =?us-ascii?Q?7+HsUj3LVgqPgIg9oz6MJ9BFUavpOhiuDhuPglJH74dRDWSLK6BeF5m1px8K?=
 =?us-ascii?Q?RmADIngRPK0J2pC7qDm9TWBKSnSPxW91M012TH+K+5yJrV4CtzugwI1+j4Wl?=
 =?us-ascii?Q?qdlgM6GJemvB2b1+Gu0VZvelBDX1SIrAfz7YXqghSL0l9nn8+FU3ZawrB+DV?=
 =?us-ascii?Q?MRHTqS936IaWM5ts7nP479JrGlyOChdQ4fUejeR1ZDQP5KVYRREI1SQw4Ir0?=
 =?us-ascii?Q?mLj8dBY9UZpyjUTpGst01E0y6KUNuYW0q45jy9cG9KNFk1fRK6ozLMOMpc4y?=
 =?us-ascii?Q?aXKcxCr4ntWhzzdwgzrlHIAUpf23DCGLmSSgKll4EKAHZfNyw6cFGMHY7yD/?=
 =?us-ascii?Q?dn+iTLsrU6SD4dgfFNcXh/mFa426p49P7uAeWfkq9pcUO9MT8BD68D8vCtXv?=
 =?us-ascii?Q?jZ4O12fTJLUXaYdfjl/NnurXR+lt?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 08:15:08.8287 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7269563a-e14f-4d8b-dadc-08dcfca8cc2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8877
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8lZl09xwexUgry+fW+Q24Y509+Foh1QEqw0z9DDNzY=;
 b=YH2OnsKO5/XoxJt87L8AvPlRWm4Nk0cFQnNDKeIQ2ArKKcmw5/fHHFWgBIUvQjJ8pRywzkHVcecGrpYOhw7/tDWrIUGRjGvB31rGIvh3YYjAHN82uv8RMZlAtIk+xixj2S9FGSSzLxzMlf8JoXllYjyNqrHQEcJ3QgJ648Z3DyU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=YH2OnsKO
Subject: [Buildroot] [PATCH v1 2/2] configs/zynqmp: re-adding
 xilinx-prebuilt version
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

The regenerate all defconfigs commit removed the xilinx-prebuilt version from
the zynqmp defconfigs.  If the version is not defined in the defconfig, then
it is not possible to change the xilinx-prebuilt default version number
independently of the board configs.  For this reason, this patch re-adds the
xilinx-prebuilt version to the zynqmp defconfigs.

Also, the zcu102 board name has been added to the zynqmp_zcu102_defconfig in
case the default zynqmp board name ever changes.

And, the kr260 board name has been added to the zynqmp_kria_kr260_defconfig
in case the default kria board name ever changes.

https://github.com/buildroot/buildroot/commit/edc0a6b1a43689fb832bc024b5997312e0770e99

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_kria_kd240_defconfig | 1 +
 configs/zynqmp_kria_kr260_defconfig | 2 ++
 configs/zynqmp_kria_kv260_defconfig | 1 +
 configs/zynqmp_zcu102_defconfig     | 2 ++
 configs/zynqmp_zcu104_defconfig     | 1 +
 configs/zynqmp_zcu106_defconfig     | 1 +
 6 files changed, 8 insertions(+)

diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 8cbc172a41..b40923b337 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -39,6 +39,7 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kd240/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k24-revA"
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
 BR2_TARGET_XILINX_PREBUILT_KRIA=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="kd240"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index d5a292b143..c802443e74 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -39,7 +39,9 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kr260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
 BR2_TARGET_XILINX_PREBUILT_KRIA=y
+BR2_TARGET_XILINX_PREBUILT_BOARD="kr260"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 06efa86e14..f42ae90f8b 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -39,6 +39,7 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
 BR2_TARGET_XILINX_PREBUILT_KRIA=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="kv260"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index c7a25eefb1..d3bba54d0b 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -38,6 +38,8 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_PREBUILT_BOARD="zcu102"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index bcd6b16488..5a0d68204a 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -38,6 +38,7 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu104/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu104-revC"
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
 BR2_TARGET_XILINX_PREBUILT_BOARD="zcu104"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 3a13834c96..bdd2cc12d0 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -38,6 +38,7 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
 BR2_TARGET_XILINX_PREBUILT_BOARD="zcu106"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
