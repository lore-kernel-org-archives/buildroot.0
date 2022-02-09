Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9462EC4167B
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 08:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CE8D60F97;
	Wed,  9 Feb 2022 08:28:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kGo-QC-FEkG8; Wed,  9 Feb 2022 08:28:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A69260F94;
	Wed,  9 Feb 2022 08:28:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 866501BF3A3
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 08:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7512280C3E
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 08:28:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MKPPrzDS40H1 for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 08:28:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8609180C0A
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 08:28:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MoRaaZnNH2Io35ya+WF3ZWjPROS9MpMiEQrfqbDiXtr3Qfuf6AqXNYls2NdbwG8ZXnhJsYDtq9ncXk0C2AvGl2HpaCt416ofqMkAu5uQa2VprlMaKAeNxmAvfp5lsvqQXwyG+KZuctO1wowawQf/QU72bm9WXE7LzKR0cYYDIXQHee0bmcx90saxnPlfM9wCP6pZJjNZZ1uJDmmmWbQCmNDo+FA0ICXz/ZLHqHDGr9OOQSQJ0XZEUAuletTJwA6zd4+JXz17ODE7SFgLzxMMBR9fb/nPIRoeqEReexnL6i2XqXdcT6YSC0vXAr2M4MgIHzHzYCyN8Ml3OI38xb9Z8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRb+CnQF5qcbqsbwmiZL/fm3JQexHAraxfnpQ/4Jdz4=;
 b=ASzgCkttij47LyqSa7gFzRYtMaW+MRdR59rQufmeT+mklIM8GqVYeXd9rcmNuw0MUUOZnZm/WQr4dxpAi25D7VPdgulQJioO+Pa4g6x3qZHnglO5CYiHH2fKCTDL+JsamTqj/24tHQzZ+4cEVTwwC0ZmwoqAdzL90ze+sj5y4v/exhbakKKDMLWsbnFnkw+7Vynv6mpBCflrWhHM/MHYTFuJ2A4cQDSJUdAtGTvOBlgzSU+sFRCFy36FTvRSvYDahVpjiwNM2utgpxc69viJxfA6Sni1dlqAlfepQx3ukBe9NxCFyXc1AyWntpFx8GzL5CjDdaOp5a1JNc2KOG0HJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRb+CnQF5qcbqsbwmiZL/fm3JQexHAraxfnpQ/4Jdz4=;
 b=pk1j+bYONvxWy2LBFR1GGlV4yvOy3Ycg2KQurawAUOSNrdDEIono0VXXL+kwH+s2JvhuAvW39hZHEnjQ8HhlBbwWrNniQO/e7TuzA7KnNFP9Jse+9Qe3Hw9wxuEdt1B2IWpo/2hlpjlT0s+QCGtjWUlOeY6QhgS+XvQ+iKIgx1w=
Received: from BN0PR04CA0092.namprd04.prod.outlook.com (2603:10b6:408:ec::7)
 by DM5PR02MB3640.namprd02.prod.outlook.com (2603:10b6:4:af::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 08:28:35 +0000
Received: from BN1NAM02FT037.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::ee) by BN0PR04CA0092.outlook.office365.com
 (2603:10b6:408:ec::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 9 Feb 2022 08:28:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT037.mail.protection.outlook.com (10.13.2.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 08:28:34 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 9 Feb 2022 00:28:32 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 9 Feb 2022 00:28:32 -0800
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com
Received: from [172.25.185.186] (port=54942 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1nHiL2-0001ia-PG; Wed, 09 Feb 2022 00:28:32 -0800
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Wed, 9 Feb 2022 01:28:21 -0700
Message-ID: <20220209082821.72879-2-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209082821.72879-1-neal.frager@xilinx.com>
References: <20220209082821.72879-1-neal.frager@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fb1bb01-b156-4f63-aa4a-08d9eba6296c
X-MS-TrafficTypeDiagnostic: DM5PR02MB3640:EE_
X-Microsoft-Antispam-PRVS: <DM5PR02MB3640C6C51B5772BDDF69B7F3D72E9@DM5PR02MB3640.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W0jcBLcE3IPFsyyodN9OJfDN38cWd0WkRS/1DldDqXYW5K4gxDrBVllwB1GpSPJ6QDWMvZ4QVm4EmrCv9HD3WG9GhZGcYfnO9AlNiF32qYf1E0eIqU8VyBvANfvt/uROzDvD7it2MSlqfIZEjKQIBi5sarI/hMb/+Laet9PDnMqUax5uHGt6Ie8LjXsXIe4mTPR957E+IzsnH7S0/DFbkTghraP8KZjyuo/cPrmiF0HJj554d8pi4Uua6NA1q8WOyR6mOFFpj/LBowt+QBA7DyeW9X7D214QQ+zebYTyabvhhDdUJC8rkAR8CGNxhKic7kExmqHFaSQLikKtPnrUD3gHgM1ZmJW9Qe1PQqhvFA0KpI6w21Kx+W4lslH86ZYBGH42CvCwN3GGuX4CbfmfLjWi3HvlWIMNK8c/h9/oCQfj2AFcWYTn/Wz+DJtNdPHEa6neXnAJGUdy4p3klSnnNTO70vCdhuEaRGfcYSonlbeLE30DQkYxaEhCnpvgYyVCCr3mnOFiE1gbYvAwBpnz5/C2aI0PSoy83I6WMGiRIrVq3XeHdy1BjoiXCBH+hGsmM68P5scl+NbgJp9MwyoLBSYwRBlHIle/QCHKrRE90lXKjgtMxNCOtMGhEdJATUTP4PeZQmb7riF0i2afKxTmbW8dcrk3XakgAtfq1/hw5UXBiwN7lt/lxdmLKI+x+o3ozKSBMbcanp8u5XepzgxPPxBQ5KZIZuzTfHYALhJxd6V+FT72cmMHfYGanEagZCbY86iwYjulmRcQMIBUgO3/dSVAVP7iBUR4FpWY6KS3AxO5byO6nGuhfzFhBwmsFL3xekZnVFXUNPIf+F/OtfJChg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(508600001)(36756003)(316002)(70206006)(6916009)(70586007)(36860700001)(26005)(5660300002)(7636003)(44832011)(966005)(356005)(9786002)(47076005)(8936002)(8676002)(82310400004)(54906003)(4326008)(2906002)(2616005)(186003)(336012)(426003)(1076003)(107886003)(40460700003)(7696005)(6666004)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 08:28:34.0315 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb1bb01-b156-4f63-aa4a-08d9eba6296c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT037.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3640
Subject: [Buildroot] [PATCH 2/2] Add configs/zynqmp_zcu102_defconfig -v2
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
Cc: luca@lucaceresoli.net, Neal Frager <neal.frager@xilinx.com>,
 giulio.benetti@benettiengineering.com, michal.simek@xilinx.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch:
- adds support for Xilinx ZCU102 evaluation board
- ZCU102 features can be found here:
- https://www.xilinx.com/products/boards-and-kits/zcu102.html

Signed-off-by: Neal Frager <neal.frager@xilinx.com>
---
 configs/zynqmp_zcu102_defconfig | 39 +++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 configs/zynqmp_zcu102_defconfig

diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
new file mode 100644
index 0000000000..acffda64bf
--- /dev/null
+++ b/configs/zynqmp_zcu102_defconfig
@@ -0,0 +1,39 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.15"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/Xilinx/arm-trusted-firmware.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="xlnx_rebase_v2.6"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2022.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
+BR2_TARGET_UBOOT_ZYNQMP=y
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/v2021.2/bin/pmufw-v2021.2.bin"
+BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/pm_cfg_obj.c"
+BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
