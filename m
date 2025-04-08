Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0816DC36010
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 11:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57F59610F2;
	Tue,  8 Apr 2025 11:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvjL5R5nOatO; Tue,  8 Apr 2025 11:48:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E54D60AFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E54D60AFE;
	Tue,  8 Apr 2025 11:48:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 35889DA
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 11:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26D3F810BB
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 11:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aif8IFiXQMPR for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 11:48:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::60a;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5658A80F9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5658A80F9E
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::60a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5658A80F9E
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 11:48:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1skS+cX2il7LNx9lIYc8Vhf1wqNNdODYfk2bcvmVoYR+urdu4rFj+ZcSew7Nsqy1yoXGv7m2fGsTLF8pNufQ8DfrjYUzNHkcx/cEQS200hoKLdLjlrsR4AcoBEmtibBS+CYWXw+j7JVc31Gayu3bXab7zPVtFeVsFynbcCQ7ietqHYoiszOuCAsSeyRACThafC1S/H+9oezhg6JwxtmmzjYfwpBRKW/agnzIswSOrY7hf9BFNYp5u36QWSKsTehXehC45cHLwIRTT7Poxj6tgoT28+xr8mnEssD9vgMBmpgqeo/xkSbwKiNjONTfMtj4QcpYU+0MJ/1gny2lLcYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cHxYiFZJsqcD/HLDsLTJZz419GbNyVpO6uhnD2eCsk=;
 b=KWs4BprYVz4OYLKL+87nqruswaPtPURvcee+ngr15q/c50Si95Qds/EGXVDW7DhIo5n7rOksV1TgAg130UiSsulLux2MFgaRFUoKjHBNfTfEGlkyPw6UyKKhn1vuzIXBX5UsXnEB+iwgHgPrWifANe996J+xrAv5wimzVAG8ZOM7+9+5jJeWDoW65lQjjlxfD7NlgO6P7WzQTbG2z4AsEaqp4JDFK+qaiAV5I6g/lYAQ+S6YFP+y+wMCdr3sQjE+1bLbSMKsfANryfD2i2H4ypdboHJd1kcvukztzBZAjp3v76zT41uUDR+bZ2uXt6Qj2q0fxDX/4ry2fPJ8Zk0fHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR03CA0029.namprd03.prod.outlook.com (2603:10b6:a02:a8::42)
 by PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Tue, 8 Apr
 2025 11:48:46 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a02:a8:cafe::20) by BYAPR03CA0029.outlook.office365.com
 (2603:10b6:a02:a8::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Tue,
 8 Apr 2025 11:48:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 11:48:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 06:48:45 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Apr 2025 06:48:44 -0500
To: <buildroot@buildroot.org>
Date: Tue, 8 Apr 2025 12:48:34 +0100
Message-ID: <20250408114834.733285-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250408114834.733285-1-neal.frager@amd.com>
References: <20250408114834.733285-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 1218b1cc-3217-48c0-e75d-08dd76935213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mr/70IgtG7eetpdimxIyJ2k5G8o3FYN00SabsL8Y+NMz2MhYh1v2VdWft5vh?=
 =?us-ascii?Q?wad+MffD2T32qoh4jQPVbax4rwrWdtRznrw9STRx7kzwCfsS5LKa28ZhqqlR?=
 =?us-ascii?Q?ERmRruOio+ouLCDMD/hgmqaQM3O6s0Z9oJEPc3ybrv9lfXU96yNcUvqI7o+N?=
 =?us-ascii?Q?KiDvs7Wc9Wse9sAWqoW468nFdh9n9f3ZuTV63hiEr3nf2gul/l1fcs6gs5Ap?=
 =?us-ascii?Q?PYD1obie0vtL2BI7aRnF6DqRUcp8K1DFhs2jPUrb41wHl6hQiYaXnblTw9p0?=
 =?us-ascii?Q?yUiW3blZmisxgtKEkXFt+3DNwkkzz7uLSAWgWEuf9hr41/H3kVyGX8EkgBPj?=
 =?us-ascii?Q?NQMdq4BO+hKC3AQYyktYa1EX3CHO5b4AdqX7O6fIOriiM8KeTuujGnd2xLCg?=
 =?us-ascii?Q?hrnCMFu09vCirL2ojPH3yAD+UTVW2Bv45/UKCpm0mATs4qsFNToPCZfPCkXs?=
 =?us-ascii?Q?oCUd4X7agDuF9zRNOrxKqr/JwVUQU4lO3l+1GRAL2AXvy5OxbKX2qt3YAJzC?=
 =?us-ascii?Q?xTylvaZMJgu+/JWORRjh3plFf1/v6zsxo0sLKb37K52sg2386QWcca/NBvm6?=
 =?us-ascii?Q?UdVU9mtTvaoaCJfS/wE+Oe/WHkkRMhfLmHrf5Q8XMMUtQbKtAdkftlh3sIfl?=
 =?us-ascii?Q?IKalMUGzaPRGto/5EgLdt6kxnFOhyayq/sw+4ym5CqMhzrwOzyxhu5BwI0N4?=
 =?us-ascii?Q?FzE5sswqf6V3xmBcp8fJ5dMHIvWuISAgHMoTGWHMNt9EPfEk/XCbsHKHiio1?=
 =?us-ascii?Q?6Q0Ag2T1E1onZjsHE1PFLj7I3d0J6Qdntyq0zs+F4POJGNkxLJv6g6hs5LVv?=
 =?us-ascii?Q?QfIGorsuttdytUXUg+BY3Y/XVm33tQgCwgk9CrwYYZXyP2YaZ0M+Lp5m+mQU?=
 =?us-ascii?Q?V73UTnA/zsjSFkDL14vrxdvkBNVc99uzVpoem2aOj8L5RX31yP6giV4kwwp/?=
 =?us-ascii?Q?Ah4/zroAonJzvBqBzZUef1wG/C/aggDx+fPmoimjeY+3krosgJAeEWTwUfov?=
 =?us-ascii?Q?JkeyJn6+2XvCF/CydrfROSVkFw8UmbTQovzjBcBse7aNlkkQbY/MNUSCr2CS?=
 =?us-ascii?Q?mtq1R1HJy7pn08up8NGtrBN31z+Ro0Dezt8sLU1RK4HMtPEv3EvFwfKiIUSx?=
 =?us-ascii?Q?TchuqPz3bd4BwqavBIv/k5mnfe/fiOKh1c7cqrqBG0PofaOYfBzm07AfZedp?=
 =?us-ascii?Q?eKQx0CRNyGXzExF4i1kPNsZi+Di9nPVPA8zsRXt4Ta7q/eiic4HBONJnpQn/?=
 =?us-ascii?Q?m1EkJ+rO+DWeuyg235GiHRKrIuDG3ErlK6zsSKSJMfTEOYH6oTvtGv5mUvX5?=
 =?us-ascii?Q?EN4tgS3DghaAl7R4stSPlO3cz8SnVRWhbxO5Ba4f8S+9Ws+sTpdymAtja06w?=
 =?us-ascii?Q?Tys0PN2Sk2hDa7e648dvvgziQhnl0cFK5dsCfsAC00FpYD4kiK5A6n85tRxO?=
 =?us-ascii?Q?nvsb8X5WUSdvI5IgowozMVy2LPeE0G2LfE2L2zmPZrohZsdjueT1pwN2Kw9W?=
 =?us-ascii?Q?A+pA1qXIesVOr2IBUZytfVZ3uQf3vzg5da1q?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 11:48:46.4222 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1218b1cc-3217-48c0-e75d-08dd76935213
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6809
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cHxYiFZJsqcD/HLDsLTJZz419GbNyVpO6uhnD2eCsk=;
 b=fiKSoul3QqNDvbPxT14i0qR7N7rVmlZHwOrkKMrgBg8VkrTHrIgu4aTjyZXlOC8H0WCex6fU/6L4u8V2jxJOJnWYZREjr283N3tqYYlozfXrSNx99oGa1MPlubOzwKRikv8aDpN0euUTFj1F7H28cItIH5/FXBhc/zookeyJZaE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=fiKSoul3
Subject: [Buildroot] [PATCH v1 2/2] configs/xilinx: add fpgautil to xilinx
 defconfigs
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
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, fabio.caccamo@amd.com,
 romain.naour@smile.fr, michal.simek@amd.com, arnout@mind.be
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adds the fpgautil application to all Xilinx zynq, zynqmp and versal
defconfigs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal_vck190_defconfig     | 1 +
 configs/versal_vek280_defconfig     | 1 +
 configs/versal_vpk180_defconfig     | 1 +
 configs/zynq_microzed_defconfig     | 1 +
 configs/zynq_zc702_defconfig        | 1 +
 configs/zynq_zc706_defconfig        | 1 +
 configs/zynq_zed_defconfig          | 1 +
 configs/zynqmp_kria_kd240_defconfig | 1 +
 configs/zynqmp_kria_kr260_defconfig | 1 +
 configs/zynqmp_kria_kv260_defconfig | 1 +
 configs/zynqmp_zcu102_defconfig     | 1 +
 configs/zynqmp_zcu104_defconfig     | 1 +
 configs/zynqmp_zcu106_defconfig     | 1 +
 13 files changed, 13 insertions(+)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 2f40c210a8..dfc2651f49 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index af8bed884f..c444b04e97 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index afa606ec8c..7f8ed0421c 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index b9b2da3849..864e9cafd3 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynq-microzed"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index ab42abe655..8108bbc7e7 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynq-zc702"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index d7ce9cf11a..eaa0b8daea 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynq-zc706"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index c9e8e7ea2c..d0c9820273 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynq-zed"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 261b73d6cf..9cb7c1d5fe 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 2cf2b98aa5..ae873a455d 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index ef6a23f2a2..aec4f9359c 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 762a54d968..b2acea63bb 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 92e0d41736..4dd6e50d72 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu104-revC"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 51287fdffb..840bbf68f2 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
