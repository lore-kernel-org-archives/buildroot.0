Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5515E77188
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 10:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C9F1417F6;
	Fri, 20 Dec 2024 10:36:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xCU2iSy2lkQe; Fri, 20 Dec 2024 10:36:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44D07417CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44D07417CA;
	Fri, 20 Dec 2024 10:36:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A499A730
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 10:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47AB683B9A
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 10:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NfiQfBDngP7b for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 10:35:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2405::603;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B64283B9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B64283B9F
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::603])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B64283B9F
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 10:35:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJuL07J27dk5nL6Lu7ugwDzTJEno2p7MDSr08t4UKnx+zDQDcJugk8ZswRgwgBxZV6o3wGSLcP7pDVm2Bs9YhB3UxPAipF7Ze2bWo4IFFVjhKebDcUnWfxWcbPnRtQFsDfb5BTRkzcxvT+Uy7wr8UOhXG6lZ1huEOXzZXflj2emMvOePD1t2eqO2MOFWxoiTCUpTyzngLD7ttQaWFfqwxpLpMKpUmVHe99F4vc8DUNEzWfV1zFLxma9ZHP0kHKq0ms4IJB64eu2GrrBXGHA/MYE3G5FnuLToar1TQeBk/sN3X6V5libdvU0TxZmLeHATjCHBEVAFRifat7s4kYVABA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbtN5qqtKHqBG+ZnQPM+1CBWXzH+TZ55+5iPfjgHW2M=;
 b=J8Vo5Qq7HP4OvH/jv6GlXDZoOqQfFFGpjN0hCI/8Kx9ixPdE2zI1RaVQJJYOSzmlynI4HMtODAl3nE3uBpoVuxMkIZwufnfUeauX7d3cvAsoB4uwiMwE7yMrwqFW//S30/K+HsWen8gxOGHW1QlFv/tLqZ+vcdo5eO/zXPPtGHKBsE84tgjXYdWM/Lx82j1cJz0b4af3PzMLKovrxVXw7J3w/e3w0vJgIBipXxwIpLbiIWY56wkcBQW+IDt8w9csqTnSoMGTcp0pnKGV36vO/lZg52egNGkRN0UYsgqZWstw+e1WdhDLq673kEsXEodC4pJ1ogY/U8GhOmio0xjEGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0181.namprd03.prod.outlook.com (2603:10b6:408:f9::6)
 by IA0PR12MB8350.namprd12.prod.outlook.com (2603:10b6:208:40d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 10:35:43 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:f9:cafe::28) by BN9PR03CA0181.outlook.office365.com
 (2603:10b6:408:f9::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.12 via Frontend Transport; Fri,
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
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 10:35:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 04:35:41 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 04:35:41 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Dec 2024 04:35:39 -0600
To: <buildroot@buildroot.org>
Date: Fri, 20 Dec 2024 10:35:21 +0000
Message-ID: <20241220103523.2301721-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241220103523.2301721-1-neal.frager@amd.com>
References: <20241220103523.2301721-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|IA0PR12MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: 03f80795-80de-4c05-9cc2-08dd20e20d9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6VmkrOtGfjk1slA72n26cMDF3FNJiG8rxHi5HIe8DrfuDyI4pRgkWAv+hRZk?=
 =?us-ascii?Q?xj2fm5MPFO3kdBKdaLUOnF3biNrsWoAkGnCM616UAzwfHsnz5N5Xzvq4m37n?=
 =?us-ascii?Q?HBRo8bOZTRRwQ/xlM9nrftzoSPmZW+958kU01JcvOoVMD16aNQWYl9jbOCHD?=
 =?us-ascii?Q?GRR4UCHo0QoQoB0fGK8+IHpYvTII2SaHe4iY5BckM3k0P8dDXMAcT/3CWfwt?=
 =?us-ascii?Q?FmTmC0ax1UJyhxArLNfEMge/rhL51/TX9h7wNhz83Bw1uCm80XGqtsBBPaSM?=
 =?us-ascii?Q?yP9WnvZkZygCCIFtF9w/pZeK0j2HLMZgfxRp+rsNk3jGwpdxO66KIMuoCwt7?=
 =?us-ascii?Q?c6+jLWv4/pJIq0brY8APRaq1daMjqdFIQCiNZOhgZtelIo35u1kfHE684pER?=
 =?us-ascii?Q?qeFmcqpQABc4PONwpUi8opklN3u3DFXXZ81s1jLeCPccjMNBPe9fN2Ia/4g6?=
 =?us-ascii?Q?tY9aZ3v28Ap/XrLS0h8pBpZYxB6B1Y88HDpZuaFscEs3Fyb1Tk+YZ4JXlWgA?=
 =?us-ascii?Q?7xtCwUKK/6XOR/h6qnRSr9m7v+f8cQambwxlqJ1Q0fIp4v/Umw4zhq1WYWU8?=
 =?us-ascii?Q?IhZ2+fD1qsg+ocpy/zoJob34spLU58KSlOFOuJcOpPSyHpgRImD8DHWAhPtG?=
 =?us-ascii?Q?0G9mQYyHhDcYikUvzMsLMymAirHs9auWHBXHYW51r/kCKNYKyRTk9Ac4Zldk?=
 =?us-ascii?Q?CLD/75zilV09cLLLKUzrZ/3/Qckm1cUi8jvkh/liXI5vJ3fsaoVm/4JtnjN/?=
 =?us-ascii?Q?Zclg4HfjBrDyCCn9vFC/dH52f1wedLS42CXla4rzqSlLnCr0jItsS8NhADIh?=
 =?us-ascii?Q?IPT+LQwwsH8jMwgOCkZVQEmW5D/VAAq19L9n2Ow7+qqhwVxTXuMXXvaZs1mR?=
 =?us-ascii?Q?Pcm7ScQ1hjEH81nfloijtZdhoYvmGmuBCCdc7jb5mdNDfdymld5L1ZSlYFQ1?=
 =?us-ascii?Q?5HA2V1w0Sql+YEG+5ehjg4fbuVuVz0d17rFBFElFiBKZHXooQvB12l03swj6?=
 =?us-ascii?Q?Mt+7+m+bg4wHfeoWZs7rzGewNiFN/Y+11RfwpWwAN/iDl1K3//yEDNgNV7SK?=
 =?us-ascii?Q?/XAbK7OhfOuqzgDSnQIPat4rBt32tpnE5HQUQpKzGf3BQzMEmgyGSNWlOgTS?=
 =?us-ascii?Q?Tn4nfpuAwO157kcuREGdg05cXlai9zNAxTJfKT0ZlWM/kKyZEXkGi3E4ZWh1?=
 =?us-ascii?Q?dBLbY0TVsT/P6ZMeKi7FqBpPI8qQscZXkFjZd49zivgFTg7rCw4jbb9oSiLu?=
 =?us-ascii?Q?huPrKQ/fPD2hjbnInfPYJlMogXxqBPzaIvyvi0RCpKxqcK/S+i2yk3cF9zqN?=
 =?us-ascii?Q?fbzdyAMS7u7I697JSVccESfnyEtvhhU0d/bIvgIliB9ZzC2ey7c+D22tn9If?=
 =?us-ascii?Q?fSdMTymOvF1A12HJkNWc6OvivCV4j2HVSa2TmcRkylasRxjHwJQ+ZTSbqa5s?=
 =?us-ascii?Q?53/ckZ2Ym82MJIy/XRMhOti6lkAIiBpVPEsyRLSX6ZrO7mmKplG4AZF94355?=
 =?us-ascii?Q?fCBU90TTlYOfcjU/HI12xlykUzBRPFg2g5N6?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 10:35:41.8959 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f80795-80de-4c05-9cc2-08dd20e20d9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8350
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbtN5qqtKHqBG+ZnQPM+1CBWXzH+TZ55+5iPfjgHW2M=;
 b=DQ4vxFYJTE/VZQldDF5uiTY9zsFgq8D7I2jKOVVQfGAdzY8OixjfL1ptrOTvsBUIQoETRHKTYJ5QYsRRPnYh3wZNOJOSmRqPAaTbSl5IWVzoKAlZ+PiHwHAxnp4GhxZivbQb0Pu0lAyxjMihHWyUP9wa3cV+whZxZQLb12C3j5g=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=DQ4vxFYJ
Subject: [Buildroot] [PATCH v2 5/7] board/zynqmp/kria: remove post-build
 fixup scripts
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

With binman, u-boot can now build the correct u-boot.itb files for kria
natively.  So the post-build fixup scripts are no longer needed and can
be removed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - new to patch series
---
 board/zynqmp/kria/kd240/kd240.sh | 16 ----------------
 board/zynqmp/kria/kr260/kr260.sh | 16 ----------------
 board/zynqmp/kria/kv260/kv260.sh | 16 ----------------
 3 files changed, 48 deletions(-)
 delete mode 100755 board/zynqmp/kria/kd240/kd240.sh
 delete mode 100755 board/zynqmp/kria/kr260/kr260.sh
 delete mode 100755 board/zynqmp/kria/kv260/kv260.sh

diff --git a/board/zynqmp/kria/kd240/kd240.sh b/board/zynqmp/kria/kd240/kd240.sh
deleted file mode 100755
index 2203536a52..0000000000
--- a/board/zynqmp/kria/kd240/kd240.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-# This is a temporary work around for generating kd240 u-boot.itb.
-# The problem is there is no way to currently configure u-boot to apply
-# the carrier board dtb overlay during build, so all kd240 carrier board
-# drivers are missing.
-# This will be removed when u-boot can build the kd240 u-boot.itb natively.
-
-UBOOT_DIR="$4"
-
-fdtoverlay -o "${UBOOT_DIR}/fit-dtb.blob" \
-	   -i "${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k24-revA.dtb" \
-	   "${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kd-g-revA.dtbo"
-
-"${UBOOT_DIR}/tools/mkimage" -E -f "${UBOOT_DIR}/u-boot.its" \
-			     -B 0x8 "${BINARIES_DIR}/u-boot.itb"
diff --git a/board/zynqmp/kria/kr260/kr260.sh b/board/zynqmp/kria/kr260/kr260.sh
deleted file mode 100755
index ac49fa5ee4..0000000000
--- a/board/zynqmp/kria/kr260/kr260.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-# This is a temporary work around for generating kr260 u-boot.itb.
-# The problem is there is no way to currently configure u-boot to apply
-# the carrier board dtb overlay during build, so all kr260 carrier board
-# drivers are missing.
-# This will be removed when u-boot can build the kr260 u-boot.itb natively.
-
-UBOOT_DIR="$4"
-
-fdtoverlay -o "${UBOOT_DIR}/fit-dtb.blob" \
-	   -i "${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb" \
-	   "${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kr-g-revB.dtbo"
-
-"${UBOOT_DIR}/tools/mkimage" -E -f "${UBOOT_DIR}/u-boot.its" \
-			     -B 0x8 "${BINARIES_DIR}/u-boot.itb"
diff --git a/board/zynqmp/kria/kv260/kv260.sh b/board/zynqmp/kria/kv260/kv260.sh
deleted file mode 100755
index dc92c51d43..0000000000
--- a/board/zynqmp/kria/kv260/kv260.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-# This is a temporary work around for generating kv260 u-boot.itb.
-# The problem is there is no way to currently configure u-boot to apply
-# the carrier board dtb overlay during build, so all kv260 carrier board
-# drivers are missing.
-# This will be removed when u-boot can build the kv260 u-boot.itb natively.
-
-UBOOT_DIR="$4"
-
-fdtoverlay -o "${UBOOT_DIR}/fit-dtb.blob" \
-	   -i "${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb" \
-	   "${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo"
-
-"${UBOOT_DIR}/tools/mkimage" -E -f "${UBOOT_DIR}/u-boot.its" \
-			     -B 0x8 "${BINARIES_DIR}/u-boot.itb"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
