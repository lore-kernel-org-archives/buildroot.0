Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C2AC27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 09:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38A4D4049F;
	Fri,  7 Jun 2024 09:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQbRkqczGBKU; Fri,  7 Jun 2024 09:47:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06AD141A14
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06AD141A14;
	Fri,  7 Jun 2024 09:47:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 192101BF4D5
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 09:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1326F4086C
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 09:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqaEvGZCaqUg for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 09:47:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::601;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 83FB340871
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83FB340871
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::601])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83FB340871
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 09:47:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcSwQ6dri9hFzgrsl09n2r3s1JRF0u0/88bgXL7plfj8fVESnvNCCXhYT8SyCX4Qpk52LP3IohYX878LDZ/baIxOS01aQ3ioHYT9v8n11q+f31xy7QIdxCQKgzVN33qyLCPvo4FMQl5ki+gnoIPZQW42cijUOMDs9w/n98avwQdp5gs9e51IOTPtgThllE21CL87uRC/CoqyGgjcK9LOQ6Vl6I8GiR47l81ohFvwZw4WdpzGKNvAZndN7FXb1LlZPRnIQCjTjJCJRDuU8d8pAyuoxvtCvafoWIA7ULrrIB6JuOpUGAPBAG4ievrE5y+jqmg/mwKB4Fs1J1IP0cmnYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHM92spYPO6eZ7tvmQyeDxOeyJxwxq17QGyuW40UpOs=;
 b=AT4VDxlTLtgm1wPBMvkg8bq6vb+0WzohLiVqkUiDwnuTvetpu0/b2ceTrlHEvZdaPdhrXFlo6iFc8aMEhQ/xUmsHegTe7UK3g8xbYBM0+2u/uJGHhQFs2Bse7Eqex5R5Syl3/QtuS5tyQMQXmnA/HgOZ9B12Dp6j53yv0seRjgDuuXK5QGeEsXqIAwHcW8nOX9bHScNBnRwa9VIezi5BYXwOJCXgdNkMHGx5n9/dLJcoBb7TdmhuHphDYE02L0P1p1b3hcXaRiL7ui2wDDlzI5ExqXvXX+5OpnegL5vdzalNI/PaT+dfqBbDj6LRtPT3gHOCpxXPvo8hxRUiXh1NcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0364.namprd03.prod.outlook.com (2603:10b6:a03:3a1::9)
 by SA1PR12MB5672.namprd12.prod.outlook.com (2603:10b6:806:23c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Fri, 7 Jun
 2024 09:47:24 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::b5) by SJ0PR03CA0364.outlook.office365.com
 (2603:10b6:a03:3a1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.16 via Frontend
 Transport; Fri, 7 Jun 2024 09:47:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 7 Jun 2024 09:47:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 04:47:15 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 7 Jun 2024 04:47:13 -0500
To: <buildroot@buildroot.org>
Date: Fri, 7 Jun 2024 10:47:05 +0100
Message-ID: <20240607094705.1962913-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240607094705.1962913-1-neal.frager@amd.com>
References: <20240607094705.1962913-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|SA1PR12MB5672:EE_
X-MS-Office365-Filtering-Correlation-Id: 53017f3a-b81c-42bc-0e71-08dc86d6d504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|376005|36860700004|82310400017|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xslWlTG1jQ2PRAUZnC2EKToR/t+oPkn4mnPQIgcIbr5+cLNgb0GgoXWhbMes?=
 =?us-ascii?Q?vhG+UD1lQTgslkCUqIy6r6dBC6EGZUxDqW1KYjStHZXaHLT0wiqZkmS34Jtm?=
 =?us-ascii?Q?4vGhxjfPDZXnRBestEYQspNou4TVPKHNsG19A1O8i90RnS7Q8ZwaHgZURllb?=
 =?us-ascii?Q?ZchTjWlRJd+i8GBvXtSBqP3kgWAk2MGpbAYBxl6v3DC4WWIvFpxVg6rFJZjs?=
 =?us-ascii?Q?+PqgCIGpw87LEvGgbScGFApKUcD28YiQhqA9rxHFyi2KmJFgByG3UHoqITCo?=
 =?us-ascii?Q?9gokL8g/1zkrQKVtnBvXoMzXzBUQcwDLiaLpUzH+/feT+j5jrAz5ZyKoURMI?=
 =?us-ascii?Q?pfnRpzlB7B0kWG9aXck5cP5pUyBcZiPTjiY2/I3bUBqYB8PGwhoaZa5Lgc4h?=
 =?us-ascii?Q?aHx+Kn6UWsyM0XicHgdSRyJzJIIJqspmyyyd9IiZaayJtIh6+fnUo71MTdAh?=
 =?us-ascii?Q?HMYzZK+RapmmPPqdl+Uxkz2KF9rm8te5QTzfUfGIJ4Kf1Zlm6UhJ++X+FAbI?=
 =?us-ascii?Q?eVrQBW9zEjDzecNbETxjV7Ky6GsBCtUZQtaTlZAKgKVm8nChDYQd0R0fnvAd?=
 =?us-ascii?Q?8ve4vQdJVkK/YwOvmb19UlvuHjvfFXOLL6T6BfsuHdiSW/JqDWTBNv1bE2/f?=
 =?us-ascii?Q?APWrJhHR4JIuZAX2Ni0Ue1NraaOQPdlmIDVB07fMWGjaFiPaWDSHRWZoH7Mu?=
 =?us-ascii?Q?I0E5MY0lfZMv2f39/2z3ihyTklyBARWrcHAA4nx4RWdB0cmprdGB+nzyKcVU?=
 =?us-ascii?Q?XgI6lHDM1YXISCpjOZm8fw8zPlzJZEK4tdoxLpaZaCKWPAcku4Dv5rkpxuF4?=
 =?us-ascii?Q?ADROQSOhLDlir3eY0ZX3cdPfBBbZZsx8J6dpxaZJTwUw4TkXpS5+qwrE6auI?=
 =?us-ascii?Q?jjaU7MtL+qZaqnXXg9XZETrBzq6woNRYxdI2rdmm27Gk3+Zf4PsoP8vOg1Fs?=
 =?us-ascii?Q?+osVoZr5eXn6V6RJSvsmYnqeFjOwJMBzXWxY0Kd8M+NkJhHTwPOMy8fk1cgq?=
 =?us-ascii?Q?X72Yxs0d5YzTe0gJWz4A/SM7sZoVaal1oIzaFQTTdl1m2MuiuqgTlYmNi839?=
 =?us-ascii?Q?k7I3DWOhCfIXBR0396uVfAODO0RCwtxBoru4muEy15LI3NENpZNV3aDETtY/?=
 =?us-ascii?Q?ADwqXRbLyIHMpU81tsJfvNYulhDTLC6flGn7girHlV+v1L1oy4IELESvUkxx?=
 =?us-ascii?Q?uwpyKJi5RNgnrgiP57KIZTXFy/7R6XSeKHB/1gJIiaN901Wyc6NWayqRRkWA?=
 =?us-ascii?Q?+R7deAHkOsB54NrCnW8+OlsMf0z5cqtPXJwfKmVVpptUZaDsQLZglF9rXsCv?=
 =?us-ascii?Q?l15RcQjH9q6IbRtp1DqB6kWTyxFsNBq5nd3P9V+9n1KDf/EjspdfavnPg9m3?=
 =?us-ascii?Q?p7STobpYN8Xc2wKNpbsFd2hCGI0IhHQ3ubjQ3Q2cHKA96o2ypdAH+qXc7w8m?=
 =?us-ascii?Q?ynL8/5+slWXnxAqWRbAGeayfQko/dkvD?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 09:47:23.3141 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53017f3a-b81c-42bc-0e71-08dc86d6d504
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5672
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHM92spYPO6eZ7tvmQyeDxOeyJxwxq17QGyuW40UpOs=;
 b=WQHdv6dW9jp19gFFYaOG6XK/EUkd7NsA/B9f90et/VDBeT6ov1RdcenVWqpEtBagWcWLydAOxsuZXPTUpBCSAyjdggp1qNRvGdD0o6s+eHWG+fD0UWjAnyOSXbm93tITuw67ja71ea8ZXPXbtOZUKq5Wb8TSL3yS1ZjAzw1nLXU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WQHdv6dW
Subject: [Buildroot] [PATCH v12 3/3] configs/zynqmp*: build pmufw source
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

This patch migrates the zynqmp config files to use the new
zynqmp-firmware package for building the zynqmp pmufw from source.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V4->V7:
 - no changes
V7->V8:
 - bump to xilinx_v2023.2
V8->V9:
 - add the new zynqmp defconfigs
 - add BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH definition
V9->V10:
 - no changes
V10->V11:
 - BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH is set by zynqmp-firmware
V11->V12:
 - BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH is set in each defconfig
---
 configs/zynqmp_kria_kr260_defconfig | 6 +++++-
 configs/zynqmp_kria_kv260_defconfig | 6 +++++-
 configs/zynqmp_zcu102_defconfig     | 5 ++++-
 configs/zynqmp_zcu104_defconfig     | 5 ++++-
 configs/zynqmp_zcu106_defconfig     | 5 ++++-
 5 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 3bf269ab6b..3f475af882 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -31,10 +31,14 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/kr260-kria/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kr260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2024.1"
+BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS="-DK26_SOM"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 7b402e032c..313b324a13 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -31,10 +31,14 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/kv260-kria/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2024.1"
+BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS="-DK26_SOM"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index f40002f6d9..302ad1394e 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -30,10 +30,13 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/zcu102-zynqmp/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2024.1"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index ef9c9bad49..059858fff6 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -30,10 +30,13 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/zcu104-zynqmp/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu104/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2024.1"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 07c595436f..39dd5c8ab3 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -30,10 +30,13 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/zcu106-zynqmp/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2024.1"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
