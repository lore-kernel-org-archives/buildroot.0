Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53ED3E7718F
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 14:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C79D6078F;
	Sat, 28 Dec 2024 14:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OO4yci8M9WJJ; Sat, 28 Dec 2024 14:58:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD099607CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD099607CE;
	Sat, 28 Dec 2024 14:58:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8997DF1C
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68FEB60748
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gu9KlyQEFYRa for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 14:58:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::621;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 178E460790
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 178E460790
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::621])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 178E460790
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:58:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VY+V1CKMh+IxO/0GgzgAIHrIwOdZtdBDWfxfEfVJqabLzrbQgY8rzcmB/2oZMBLXKwFShAj30TDRpCAWfT1tPaC05jniZXjs96VnMak8WN022tg1/yr3LmfUJuHmFDBGA2Pz+kKEShL4dPTcFdP55oqIg//RDtDC+5wOzyuJlO9cdgUtOyQKZ7ajlyM5y6drOxZkLnxSTqRfVDECgi+YXt5VhrKr00wFF2mT8jA2lLskc45jOfI0fMPNivJKsmisMmnehoN6oIlXRlqjXW0JLL9GZ7r3YtVKEUHHoMkBU4VhK7hNuGKC6vyug/hk9s5v1cYWDB1aZ5y2WsZ5y/RjAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=838IU/8xEevdlAkp/imaFwcWjn3PW3qQ/rMWjKMEr3Y=;
 b=Vx44H5bUD48x+dauAArWsgUrfZHqRT3fdKWKQLUu9fN9+ZewxlqCgWGv6GH0OeMP0nyQS38kU/QFXXed7FIRc9JCdk8Efiuc7Uk42jNbfqWHSd8dM5nSiixO9FGakQmTZxwJbgvmYNE6lunBZO828GW9Ibbatb06frZ09/MKJV8dxc4kLNbMbhnxPOOJg4vBUFSo5es41J8mEzxrED/+277/k9CMPv4/7JZBeCaqBZ8OOf6xipbOeHILbu5TT0WhjcRtKXQihUWkUwKbKUvHPsBNyuFGPnn/2pUjK+0b664N+jkqMjUPfE1+EXWcJ74REhAaR1Pu1JLXSDFCdYjepA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR03CA0056.namprd03.prod.outlook.com (2603:10b6:5:100::33)
 by SN7PR12MB6743.namprd12.prod.outlook.com (2603:10b6:806:26d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.15; Sat, 28 Dec
 2024 14:58:33 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:5:100:cafe::65) by DM6PR03CA0056.outlook.office365.com
 (2603:10b6:5:100::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.14 via Frontend Transport; Sat,
 28 Dec 2024 14:58:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Sat, 28 Dec 2024 14:58:32 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 28 Dec
 2024 08:58:31 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 28 Dec 2024 08:58:30 -0600
To: <buildroot@buildroot.org>
Date: Sat, 28 Dec 2024 14:58:17 +0000
Message-ID: <20241228145818.2211273-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241228145818.2211273-1-neal.frager@amd.com>
References: <20241228145818.2211273-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|SN7PR12MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c389626-c90d-4ae2-ee6c-08dd275018da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UQGjyFophgxbLBSosq2Cus/vda3xfqXO/iK3UZ73R86T2f32mL3TfpiyMVrT?=
 =?us-ascii?Q?do832FmT07uOa4qjn2Baks4gtL1ajGnIYuNqgchU5dSSA0cmSkmyj9B3MNUY?=
 =?us-ascii?Q?Kqih/BF9JX7gLl5TbF15gJzvFrp+LUx7nAa/KrVzjLTrrp1gUcupcZAmNsx4?=
 =?us-ascii?Q?gBl0Efa5RqVJ7JSGd307pxDEdXZAmkcCc2kO74UPLjvufXTmTfUG0yOw72HF?=
 =?us-ascii?Q?UXiskPjhh+msW94suI4sumWRfs4W3nIdjxfrHNmKFCzeuHhHMYY+fFhHoosp?=
 =?us-ascii?Q?XJC/5HyidqKx+ciI77WHlKwegTt1QFSOxmVzArLB03iMpWVH+Pb5KTbUwUGv?=
 =?us-ascii?Q?NKflkq8bNDzyopINaLp2P0bzKqMYqiQvi1h3qJPeHNFEgso7+4Gwz1l39Fa8?=
 =?us-ascii?Q?VkTkz42KeKZAZJr9YAxFA2qDnHYEQ5l0tX7tTKf+msVDFvS3UFqjzfJged5U?=
 =?us-ascii?Q?u2Er0ghfGGyXyQ3LUKHSQXVWLJAYCaFxP8uHaMhrtFWBJ0sRk6KV1Vno3es7?=
 =?us-ascii?Q?vTdcmL+keKbBX/ssf9hgMy4hqfw1wqP25ur/efrzqV4CVgfUAUc7R7VLvxLp?=
 =?us-ascii?Q?nL0PbPxO9PpY48GXqCS73YuCMHavtPA+0PmGsO2qLzFdwUssI4xhjHWRbvCV?=
 =?us-ascii?Q?0XMcbGyHNsb2YznGpXLshQ/PKyuEi4GpLOK5dz0YbhVHRcIm2gQJdLPaWzWN?=
 =?us-ascii?Q?+UlOebq2dUkyo1lM0agJxa7s6g1HlNvp9HsHwFQ9fO1fti54O7Nx8wFGGBxQ?=
 =?us-ascii?Q?cbiTZSvudMBwMHtXCkB6vmRAYdQqR6kyjgHLMJKhN5e3LSnLlXRPxlBy+OL7?=
 =?us-ascii?Q?/MF04lm3DOJ2B9NUWFy0GdD0JlhteW6N01rLJadFW/NFxQDs+Bx28ivGBpRv?=
 =?us-ascii?Q?bWVKiHMJOrsqnpuRqVO+CSwk7o/mNMhc53M7/T1nODn1hmHb5VPuwhGCRWW+?=
 =?us-ascii?Q?f2UhDQvMqvR0MvLcVDgBQGZB5RRCpddIVfstk0Pm7AqIc0Sip3eBl7EImf0y?=
 =?us-ascii?Q?AFP1RplKCngv0n+trxXPMXfqMzTD99cay3oMgc9bEDIkFacyQz7ZnWcRjmdp?=
 =?us-ascii?Q?iICDNn4A6uS+LeMeEgG6mTevg7GRoraNiw+vVBQxe8bALTRzp0PruHGuV9SG?=
 =?us-ascii?Q?N5oP21i4ghrS4FQuL98Ky66CSxmICku+UJwKRkrWa8MLVSb7NyGe/gKn0wua?=
 =?us-ascii?Q?gyKV1ePvw//mC9NWkXMWCULkK773HhBglYwe4qnLBBg1/06vLTBmSjUXoXpq?=
 =?us-ascii?Q?KrMUbrqmfxrBmso1Q0vkaY4Rc25aFA8HL6jkxzdtDmq1Cim5Z/JDlfDQOhpE?=
 =?us-ascii?Q?IB5PlJuLBjK4fCtPCyD6zpphuskGN/fUUtEGutI9A/dSE3vWiZHDMQJ36eDD?=
 =?us-ascii?Q?7BBQL5VXKB7J990B1J4l5x4P6RBlFw6Ull/v20MChk8TavGDn+8pIWBhddU/?=
 =?us-ascii?Q?wIRAtqubyyMY1uq4dZ7zIYoBhZj7THlQeL7nLdSWEmZvk9vEAoXRCw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2024 14:58:32.2627 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c389626-c90d-4ae2-ee6c-08dd275018da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6743
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=838IU/8xEevdlAkp/imaFwcWjn3PW3qQ/rMWjKMEr3Y=;
 b=5TeEuVSLVROUdlAV6YUoanCEo91GWSh2FuEbQQS1PptJw/ejMVpNOi83wVrXWTWEQLiWTdARB6dYSHMjw0OD4BaGcv085wUaXOInx4397Ve4F1Z+7lNLFNvr7CkesAKCPJaakWLEs7bioNzXSTpuhgQIq9GB7C7EboXxJOqLWT4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=5TeEuVSL
Subject: [Buildroot] [PATCH v3 5/6] board/zynqmp: add new qspi.bin binary to
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

Kria BIRT (Boot Image Recovery Tool):
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+SOMs+Starter+Kits#Boot-FW-Update-Process

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - new to patch series
V2->V3:
 - corrected commit message to use BIRT instead of SBIRT
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
index 789bf21964..7cac34a8ce 100644
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
index 577f4afb1d..1f86623402 100644
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
index 34e536750c..9ebde4dfbe 100644
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
index fb553c1b02..8870a7998d 100644
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
index 42b585b5a7..c3516aca65 100644
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
index 271c54a0ba..0963d49731 100644
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
