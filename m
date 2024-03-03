Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D91C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 09:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32BBF410CA;
	Sun,  3 Mar 2024 09:20:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7X1jR5LbVPY2; Sun,  3 Mar 2024 09:20:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B984A41696
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B984A41696;
	Sun,  3 Mar 2024 09:20:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 64C891BF2BF
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 515E940373
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tJlPnVBHeOt5 for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 09:20:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::600;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B036F401AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B036F401AE
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B036F401AE
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 09:20:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Syx9YzPnKzeBgx0YLOy3flD97Fbbbn80T4Kd5w0UcqkAYxkYmNaMuZvRQkDfIl7zltwMsBnuIn68supo2DAX/JiCOfdwlUVlTWcS5byW5v8hBkmfk0OmMgAw1wJtugmGh4BNvgOxmpTnVBzTDsXdqLAKImKR++c9GVe23yweCsjhhDv7jV4ufznyrocOtBq26lNeEePnBGmroz5+55CBoOjXOsAcXTUsXPLhlqkabIy6QLQPwts5X/ejMocBZUpayx/0Sb5Xs252w4K6FbPbkZYtA403bdZMm2QJTYT5yXuZFEN7tyHAgoRKYUlu3oi1M3tzt6UVp5/rJOi0/Su4Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXcrXJlqShyi7MQod3vdMDyB+xSFOUh3QDGLno2aPZE=;
 b=XSLqfQfGabl6nkkeNKxA1uppbLHbLV+AnUGt03aHlnulCtcs9ma7gdlySR5UjYY603Y4dl4VyMOB5j2LSrWqNR7M+LSU7tNtQrLsWH/o+CHwWGdRmnH9Bi2RsT1vfDG1NpppClRGQFlh6NzIhwpGz74ofkt2XO6WKRtl50iyIkHwzAYJswovSDotP1lYOioYLgTpPzS8fKMchllVgg/mLH9o1GicVV8zKcdbjTS8oNirm/RK7hyy/OUiSP2FSu7cZJ+3GVdWq1ASMm3MAfEzobSLm9qdAPHuu8pbE05NqXiv9lSiHDjvqWY19EzODHwPwYqSoiSfnBvCHHRQKFCbBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR04CA0253.namprd04.prod.outlook.com (2603:10b6:303:88::18)
 by DM4PR12MB6470.namprd12.prod.outlook.com (2603:10b6:8:b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.37; Sun, 3 Mar
 2024 09:20:28 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:303:88:cafe::d3) by MW4PR04CA0253.outlook.office365.com
 (2603:10b6:303:88::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38 via Frontend
 Transport; Sun, 3 Mar 2024 09:20:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Sun, 3 Mar 2024 09:20:27 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 3 Mar
 2024 03:20:26 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 3 Mar
 2024 01:20:26 -0800
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 3 Mar 2024 03:20:25 -0600
To: <buildroot@buildroot.org>
Date: Sun, 3 Mar 2024 09:19:52 +0000
Message-ID: <20240303091956.352661-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240303091956.352661-1-neal.frager@amd.com>
References: <20240303091956.352661-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|DM4PR12MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: fcd57993-829a-4f6e-49aa-08dc3b632a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ACSJoCHbBePr3azY4wC8sGYjujLjTqWZhlyaVlnqmkv02wnuus6cY9cbHVQHipuirZ0sCEP5EaTK1xMD82YfcfeB9H+e9Fc/yPbC5UVRdqqSYbOaA2FNRF0YIAaRcdLJrF0tzQOpABA54Dw38zzclGLytPgR6I90JN/nCc8WNGrINxngRFZY3IRFGnz1AYjRPvLzi24vf59dkkhDqCBR8LxtaOpf8dRDLTk2Yb9YUKBFohKfNzw/rTK2KyVaVMQzHa0FozsECDlhv+dCI65DxbyVfFyuZL1LJKM6kk60Q4ukV+r6UfQM8QD88k4UQx1Q1Ky72BTg4ioGmdQnIt4GhqsqXGrgQNoTae6gmQrAzOiFHmwFK/Fn6ARcMFReMqgEzcsjAgQ05FvDKlEFLsu4aVVBT08x58T3VnFGRhqtRIuZHpEULLT0oLNuG4wHGIjWjVn5ybRKUDPb4LbBtruqLvAxtNCfLZotLWmBL5mP3Jak3/pHJMmSYUaKJJlXKQap4GaAUjDmBmrGAGg992wEihWN6aGO3AlZYTzKbzCyG9fjttgeCKf2mjCUWSIpOCKBoVN4kALKWsWrPMhMHB/24u4Dmd1DCYrSdplz4pe22sUGni7aCiuKh74JHulk40rHDMQEoX4Vitw4gOZU/cnqOCNp35r8YWGYOGQVh+sAT8drrFJ/FdATdy8u5SgtM3tjPMBfAYBtLdIxaD43ELn4Kg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2024 09:20:27.4101 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd57993-829a-4f6e-49aa-08dc3b632a32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6470
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXcrXJlqShyi7MQod3vdMDyB+xSFOUh3QDGLno2aPZE=;
 b=UbxHxeZu/pQmr5pZQRbN0fuYxrpTcawZZhZw1sWaR6W+WsyZBgec1QwuY7W+RWd4MrjiVfyM4YHSJsPsLAEpbis3qhLjQApyEKWuhx3ZFE5EjRsvzmJA+FvfluMmFmpBz1RJ6IQ3iSxEzIYPpk16DLe57ZGDgHnIx5WFew45bys=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=UbxHxeZu
Subject: [Buildroot] [PATCH v10 3/6] configs/zynqmp*: build pmufw source
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
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
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
---
 configs/zynqmp_kria_kd240_defconfig | 5 ++++-
 configs/zynqmp_kria_kr260_defconfig | 5 ++++-
 configs/zynqmp_kria_kv260_defconfig | 5 ++++-
 configs/zynqmp_zcu102_defconfig     | 4 +++-
 configs/zynqmp_zcu104_defconfig     | 4 +++-
 configs/zynqmp_zcu106_defconfig     | 4 +++-
 6 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 78302a48c0..1c82585feb 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -32,7 +32,10 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/kd240-kria/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2023.2"
+BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS="-DBOARD_SHUTDOWN_PIN=2 -DBOARD_SHUTDOWN_PIN_STATE=0 -DENABLE_EM -DENABLE_MOD_OVERTEMP -DENABLE_DYNAMIC_MIO_CONFIG -DENABLE_IOCTL -DCONNECT_PMU_GPO_2_VAL=0"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kd240/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 2089c3f355..8a2d9db87e 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -32,7 +32,10 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/kr260-kria/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2023.2"
+BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS="-DBOARD_SHUTDOWN_PIN=2 -DBOARD_SHUTDOWN_PIN_STATE=0 -DENABLE_EM -DENABLE_MOD_OVERTEMP -DENABLE_DYNAMIC_MIO_CONFIG -DENABLE_IOCTL -DCONNECT_PMU_GPO_2_VAL=0"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kr260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index a3a157267c..2d39818599 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -32,7 +32,10 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/kv260-kria/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2023.2"
+BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS="-DBOARD_SHUTDOWN_PIN=2 -DBOARD_SHUTDOWN_PIN_STATE=0 -DENABLE_EM -DENABLE_MOD_OVERTEMP -DENABLE_DYNAMIC_MIO_CONFIG -DENABLE_IOCTL -DCONNECT_PMU_GPO_2_VAL=0"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index c920093d8d..9ae4ce7995 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -30,7 +30,9 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/zcu102-zynqmp/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2023.2"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 452f2343c8..d86f17e384 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -30,7 +30,9 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/zcu104-zynqmp/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2023.2"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu104/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 011c7f0fae..03c04dff39 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -30,7 +30,9 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/zcu106-zynqmp/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2023.2"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
