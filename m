Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD72EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 08:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33654409E3;
	Thu, 10 Feb 2022 08:20:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MtDElNL_fAt7; Thu, 10 Feb 2022 08:20:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48E51409BE;
	Thu, 10 Feb 2022 08:20:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF4A71BF38A
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 08:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE417409BE
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 08:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7rIhF609RbNe for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 08:19:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::60a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CAC88409AD
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 08:19:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLSgfwwaEVPMJNcS/fzcPCP8Wl8Ej54E3Y2JTjXk1z1g+5Ka61OB+Lq4pWvYOSxHEA0Wx38aPxZYzlE3jKbKvyyTA0L0LU8tgyUgVuG99u0iw7+tVfk1sIiRLIpmyqTzYOArwJbs9mDcRmrmE7geDCCoRgsVRcXErSAeM9DU2+sLA3K2qTCReOjcUktzu1j4BQsCpIVzbNNu3chqVnuJ5lEIumhZ5Ejzt9+TaqOO4FzTyPSnVmOJQGcyfZ30rKFpk8eWTlG7cqci/iqwpFlIPePAoLThRde11MdQyn2zWfvxY3fpBvOTcZ/OhPWOSXe9P4Weza/p/J8bs/MhY6VQqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTlAxiqsQuSg0X2qd1ems/u15xe8h3bRzCov6FvTlDo=;
 b=EyWqrU4GfrnrgKAE/ysQuvEo16X1N67TFkfxdu1k4BRVWTq6L3I93o3AOjlzy6H6in0L8NxQ/O8iNtXXxUdLFXfIpmAUNgFqVGehUQ4Soed9YscSjpNMCE3Roa3/Lf/gQN82I7LvZdlh8lV3NV5YqtczLtS/RqQElrE/cKSdyCwllvR1C/j4e968NMxLLf6prRPyEJ90DAVxJbqGyJO4WbnA+QduqxSG8JpJov/vzVVxv5MLg00rvputFxguzkGuTBcMyScN/u8KMoAROzf08XARrOaL5ngeTDyWp8g3taCm7aHH6mS3MWAMGimQlkdcdG3xSda1UjeJhgojfAtP4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTlAxiqsQuSg0X2qd1ems/u15xe8h3bRzCov6FvTlDo=;
 b=ougS3SQSnjFLk3rIDqY1R7zdXnW6UA1s5mGj/7ZflEU96KEJOpWujl4QUslQwYvOyCV6b4dJDiMyPKjKEmdI19/9q2Rikr39U5Cey+72J8UBvDqjT2huilGy/oRiS68jODypPN+aYLRBZYMlCeHhW0+MJ0cySS53MOq7hA2wWWc=
Received: from DM6PR08CA0026.namprd08.prod.outlook.com (2603:10b6:5:80::39) by
 BL0PR02MB6498.namprd02.prod.outlook.com (2603:10b6:208:1cb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 08:19:48 +0000
Received: from DM3NAM02FT041.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::c1) by DM6PR08CA0026.outlook.office365.com
 (2603:10b6:5:80::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Thu, 10 Feb 2022 08:19:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT041.mail.protection.outlook.com (10.13.5.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 08:19:47 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 10 Feb 2022 00:19:47 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 10 Feb 2022 00:19:47 -0800
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com
Received: from [172.25.185.186] (port=48492 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1nI4g7-0003iw-Bl; Thu, 10 Feb 2022 00:19:47 -0800
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Thu, 10 Feb 2022 01:19:32 -0700
Message-ID: <20220210081932.3114763-2-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210081932.3114763-1-neal.frager@xilinx.com>
References: <20220210081932.3114763-1-neal.frager@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 591da445-9146-4be8-61ea-08d9ec6e1a21
X-MS-TrafficTypeDiagnostic: BL0PR02MB6498:EE_
X-Microsoft-Antispam-PRVS: <BL0PR02MB649809E8F296F896212F02ACD72F9@BL0PR02MB6498.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ffHwzBTToJLWNijrLOJ0Sk/R3zvujA+uDwi6yxJPOBvtDXH5tpjNMwT2BJqaJ8rdMqW86obJKoS/geEszyU/JOHcVyQapG4kJTnkRCIiTf2gr4ScRVheXRVcPR7v4FgPdq4znDvJBe6y+RZon2FMsnokPsyHkHyBpez9LCbjlidUF7ZZMRC71fIyVMn9qGlT7/uew5Gn9nI7SI6SnTfdNiwYWsc0LV92SpgJf57I/WOdK8ffJHHh9x1NtZudnLLjC6YjqcPyhWqpR07KbUJDkEX2VkvuOYwxmwfGx8NgAy71piZEfypFM9tQC7cjN4jLRFMxsAuGybWDTiO2wcGlSlmQWCDBgwsJiBDa00wrqMNcWiDhT4uM/Rgx9i0d9mKa9GCcPs7HRscju94g+Wg6i8I6SUaYi9rE/90w/UcCH5USSyN3oLUPRveOOQxX8/cIzrVq2FTREiVPYuP48YSzisemwLiRRYgI5GX/LDaTosTLbJ6Sun16Ov/LWcIKOeKYx9/6CB0v50S7vBr/gQwq7PS5T+TOEtIhsitVX9GPDlpEcYzfcwnjMRywPJKFMJSLnX6pVCE5U8MAuTF+JIp11Z/wZLsK3R3n5km/poO5xGRPFKckE/1cTvABsSi4ZffmJAW93+JIa4Kt7viIhUKBuCJi3z741bOGFIfT44Pe0J/huDp4cIgexHXKcjbn/+0gxaMwNaZ0qAIn5LPAoxWUACYQgKIFJM9vP5xbhI8WOGhgbj7zk78SeZDIlJWCdiVfAE1YCL+JiGJ/F3nTlA46PkrDsjcSpaJABwNAUubuYhg=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(9786002)(70586007)(966005)(5660300002)(4326008)(8676002)(8936002)(36756003)(6666004)(316002)(6916009)(54906003)(70206006)(44832011)(508600001)(2906002)(83380400001)(47076005)(7636003)(26005)(82310400004)(2616005)(7696005)(426003)(336012)(107886003)(36860700001)(1076003)(356005)(186003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 08:19:47.7651 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 591da445-9146-4be8-61ea-08d9ec6e1a21
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT041.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6498
Subject: [Buildroot] [PATCH v4 2/2] add configs/zynqmp_zcu102_defconfig
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
https://www.xilinx.com/products/boards-and-kits/zcu102.html

---
V1->V2:
* fixed general build issues
* added extlinux.conf for run-time boot issue
V2->V3:
* enabled support for host machines without OpenSSL required by U-Boot and Linux
* moved board/zynqmp/readme.txt update to zynqmp_zcu102_defconfig patch 2/2
V3->V4:
* cleaned up commit log messages
* added version history
---

Signed-off-by: Neal Frager <neal.frager@xilinx.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Giulio: only build tested]

Signed-off-by: Neal Frager <neal.frager@xilinx.com>
---
 board/zynqmp/readme.txt         | 23 +++++++++++++------
 configs/zynqmp_zcu102_defconfig | 39 +++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 7 deletions(-)
 create mode 100644 configs/zynqmp_zcu102_defconfig

diff --git a/board/zynqmp/readme.txt b/board/zynqmp/readme.txt
index da37f4ccc9..0dc1793e03 100644
--- a/board/zynqmp/readme.txt
+++ b/board/zynqmp/readme.txt
@@ -1,10 +1,19 @@
-********************************
-Xilinx ZCU106 board - ZynqMP SoC
-********************************
+******************************************
+Xilinx ZCU102 / ZCU106 boards - ZynqMP SoC
+******************************************
+
+This document describes the Buildroot support for the ZCU102 and ZCU106
+boards by Xilinx, based on the Zynq UltraScale+ MPSoC (aka ZynqMP). 
+It has been tested with the ZCU102 and ZCU106 production boards.
+
+Evaluation board features can be found here with the links below.
+
+ZCU102:
+https://www.xilinx.com/products/boards-and-kits/zcu102.html
+
+ZCU106:
+https://www.xilinx.com/products/boards-and-kits/zcu106.html
 
-This document describes the Buildroot support for the ZCU106 board by
-Xilinx, based on the Zynq UltraScale+ MPSoC (aka ZynqMP). It has been
-tested with the EK-U1-ZCU106-ES2 pre-production board.
 
 How to build it
 ===============
@@ -32,7 +41,7 @@ After building, you should get a tree like this:
     +-- rootfs.ext4 -> rootfs.ext2
     +-- sdcard.img
     +-- system.dtb -> zynqmp-zcu106-revA.dtb
-    +-- u-boot.bin
+    +-- u-boot.itb
     `-- zynqmp-zcu106-revA.dtb
 
 How to write the SD card
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
