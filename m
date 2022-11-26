Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105CBC4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 10:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FF7C415F8;
	Sat, 26 Nov 2022 10:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FF7C415F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6cS4uOmHr5kZ; Sat, 26 Nov 2022 10:54:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84945415E7;
	Sat, 26 Nov 2022 10:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84945415E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B9EA1BF85D
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 10:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E51F860E2A
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 10:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E51F860E2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I9U5NRGrlRKI for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 10:53:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75EA360A69
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::607])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75EA360A69
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 10:53:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJYBtoe1dh1ZzerUhwStyvoIhAe63IpB1X2+HRXnpLqqFa7Z+kqrA/LPLGyYa1BgW6yRMFxM6Sl+8crCDyPhce0OeDk3G6l9XCSsyS5BT8wYFNOJ4jGXqNcGak2b81gwmEyHaBZt+Yxi866HbOeSjJ6FHWENAMypF7/LlQQjraVJqfs3+qtP+m4bAXb4wQT8zhh45ogwkRNPwq3EyIAV3gh8ppMFMxausX7NVMTU96gnUCCP/IeLE2tVGxHpQvBu68aD1UqjbG7i4owC8CXj3deppWaIbgw86F3xX5GEKqau6mS6F7SV9IrxLta8JwFz3ujgD1lrrjRnuF29pr876Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhvW12Dy2Oew9KS9as7QwhnlzIySKfDIPNE2JFQbFuo=;
 b=nSQKC4DaSuGElk2zZFvNj0qT6dlbDIO/uHH7Ovv4+ZEqOnzU80U+FVEUhL0FBbo+qFx6GOb+N3scTIuz6l4xOMQa+ssk/1Ta5iJsGyZ21pRmIcwiwop04Yqw/qoRfCvsA+c++WF4EnGY5G6AcaXusAdXcUKPSvd8ykn+YJwvUKvfyUak+QLsftJ+QZ6jFhLJJi6/1h2OHFuo3OHdtka1Wiix454Xvz06ehmugIaz67p2v37uidKmbk4KcvYGyqPlVRus977QWZYLIQuL+XFW+HgMTo36bnwSEoz8b6uRUFa1zHxvFol1RyDUBn5BapvzIlnIZzB/bLBUhpXgrIs1kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR05CA0029.namprd05.prod.outlook.com (2603:10b6:5:3b9::34)
 by SJ0PR12MB8115.namprd12.prod.outlook.com (2603:10b6:a03:4e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Sat, 26 Nov
 2022 10:53:55 +0000
Received: from DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::87) by DS7PR05CA0029.outlook.office365.com
 (2603:10b6:5:3b9::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.8 via Frontend
 Transport; Sat, 26 Nov 2022 10:53:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT060.mail.protection.outlook.com (10.13.173.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.19 via Frontend Transport; Sat, 26 Nov 2022 10:53:54 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sat, 26 Nov
 2022 04:53:54 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sat, 26 Nov
 2022 02:53:53 -0800
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Sat, 26 Nov 2022 04:53:53 -0600
To: <buildroot@buildroot.org>
Date: Sat, 26 Nov 2022 03:53:48 -0700
Message-ID: <20221126105350.14687-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT060:EE_|SJ0PR12MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c7f00d-0e93-4386-0567-08dacf9c82f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zF076wGd5XTlj990gPZPZRJxlQt16uGrCxkD2L+3UWs2PeeF44MRMeeApNVuiOC5cZ+4jkAh7XgtODU+WdSAh9+lwJPzjQDdlmRQyDv1MDK+1j7GKRmguLD2EHqkBxYZOMo36qpkiRuziCxFUY9zbzFhGJf0IU4FHInKySwVu5xQppYzdlEdpImC/sngNcvH2eo9zeUSabzXmjYfRX5AOLPr4pvcxfxQ1pV/9/zGf9oL7Mt7dlZz0oIlx/7xxK16fcxxLwMwCCXZRFcqQ1pK+KoR85Vxa0DJfyc+Ika39eEGiJ5qHs3/WNAU7N4dULUnMODLbU8yrB91Eou31Jr3TygFbPfSShF4PK+8q9cSx9NnyTfJG4aMGvwCJSavy3Fcrd3GXsxWDtxd6vaUtKT4VwofwSjibRXn3HxnJBzllMFchMVNlWcx/LTw1b7LKM8ODQPcktdFQRm973SrfAIDFkn5vg3ogCBzZmsMDCXaNO9z3lmwslKFCeuc2k5YYtrR2XYqKuddwl0zsvn8/5hxT8OuxpgC02mconvDSB9F9ACHygKe8uYjY/hNx/i+CyJ1ngRz6uDNw2k3dK95dBfefkmz0DTAddlTdp69Iw/KSM4ob9I4ZPFka7zZPfblu/nj7IlkADFxi2tP1wlOvSLScRHEbi7JCKqXHkyl3r+o4os6EZLUOtVc+W5j4DN3P3kK7lT4eIdq9qyUkvDemzTri2COhq+mGYvH6WKnR/RrOuAbuzN0JSl+3rHqb/dy0s+qKk6/D2ZpowlNiZONokCpq8pn/H2cqL5QgVxl+2yW4hqYUnWOigAgBjc25eQpTSuU
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(70206006)(8676002)(6916009)(70586007)(54906003)(41300700001)(4326008)(316002)(336012)(36756003)(5660300002)(8936002)(86362001)(186003)(40460700003)(478600001)(2906002)(44832011)(40480700001)(6666004)(356005)(81166007)(36860700001)(2616005)(26005)(82740400003)(1076003)(82310400005)(426003)(83380400001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2022 10:53:54.4771 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c7f00d-0e93-4386-0567-08dacf9c82f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8115
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhvW12Dy2Oew9KS9as7QwhnlzIySKfDIPNE2JFQbFuo=;
 b=XK9i7IU0VkJc8ZiAwcBT7umi58ZmjcN2zXOEEmaNo3TukPLXlNtaSm/XHED46DMyMe1wcgfW046zpjUgjCs1akiMRImtFs+rex7mmp8lRKHqFoqNAnQctZo5vj1yUa7X/jADNRTUnAr58L4RTkU54it8QTqPJda3LG7CSLP4sX8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=XK9i7IU0
Subject: [Buildroot] [PATCH v1 1/3] configs/zynqmp_zcu102_defconfig: bump to
 Xilinx 2022.2
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
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynqmp_zcu102_defconfig to Xilinx release 2022.2.

Xilinx 2022.2 includes:
- U-Boot 2022.01 bug fixes
- Linux bump to Linux 5.15.36 with bug fixes
- TF-A 2.6 bug fixes
- PMUFW bug fixes

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu102_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index e27dfdb6c9..6047d4299c 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
@@ -15,13 +15,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.1)/xlnx_rebase_v2.6_2022.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.2)/xlnx_rebase_v2.6_2022.2.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
@@ -29,7 +29,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/ubuntu-firmware/raw/v2022.1_22.04_1/xlnx-firmware/zcu102/zcu102_pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/nealfrager/buildroot-firmware/raw/v2022.2/zcu102/zcu102_pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
