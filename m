Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D3AC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 18:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FCA140943;
	Wed,  9 Feb 2022 18:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A_YXkBe32qll; Wed,  9 Feb 2022 18:03:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFB1F40924;
	Wed,  9 Feb 2022 18:03:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C63031BF3F9
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 18:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4B3060A98
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 18:03:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id leDnjqLrByZ0 for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 18:03:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::626])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AA0D606A9
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 18:03:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYyF40EKmxs7H7vMRxmM55QcA35v/TBhjXzIMctLO7JcCCmzzdKfOCj31cG76qaok2ut4wT9Iak5dKnmby460mO2NZTeuCPW9QgaIEhFy3rbYGMh2vm5pXuK1td0s6WbXQz0VWHaC5RaIUOjNf9CH7DvYSXeW1ZcRtkjh7140JIA+AIrbeO5tTtj2uqkglRFDjTDEbQWqrX4UiupXQe7PX+Mf7x3cT8H69x6uLHpqT2PWqqMiXTKqovaOwziO0UEslHkDnvZO/4sh/V9t2k4j0DWhAsR/p3KxQ6EyHTD71q0RUD+BAXiKR1VMy5u+J14t/0ZL0/Wq+IBiX1Q6vo6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kz3Gw3xn0R+hUbJ4HoopBVGrOh1chvS/80DqzRgZryU=;
 b=F3O5ZhGi5AMU5r4JyDWknP04dh4O/A0wmZyfMHB32teCUoLU7hoXPHTv2t+AW/PpB6kgU6a9lCeKbbrihgxWGq0Flbpq3biX8uLGJ1x4Xmzmj4ZvqkAnn2YOQdsT1ReLHtH3NVjPDNFgIi4744j9tPcNHQiEDvajP+vqLzCn97ZrbCiZo1m3lv4RVz/uQmk0sAzFEf9A/pjbcyIJEO64W4X2wKGAfSp8S3w/nr0Da4htOy7G4fPEasqpW47PuROzqLqJswFpw9oqimEPXXxTJ6iHzM3fXyuOqaNP9+RGSnu/uN8iGtbpsxTiKQ5jERki16PrIaS8wmB6V2HetzDHMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kz3Gw3xn0R+hUbJ4HoopBVGrOh1chvS/80DqzRgZryU=;
 b=sKKf8weFLfF6oISd0bwhsx9n8DId8M63b6aYaej4bYGR+PHhkA0i5o/bOreORm0sagvHMMEGpfBWbIDKSGEGyMSTqTeZhw+eO/pLoaKRzAUG04Y2rXf9s2RCqoAnLZoAk+wInaIW3DLCrjnyU5lYN5mUJEfb0/L0PE/kmybWT1k=
Received: from BN9P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::22)
 by DM6PR02MB6377.namprd02.prod.outlook.com (2603:10b6:5:1d0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 18:03:33 +0000
Received: from BN1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13e:cafe::e4) by BN9P220CA0017.outlook.office365.com
 (2603:10b6:408:13e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Wed, 9 Feb 2022 18:03:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT007.mail.protection.outlook.com (10.13.3.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 18:03:32 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 9 Feb 2022 10:03:23 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 9 Feb 2022 10:03:23 -0800
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com
Received: from [172.25.185.186] (port=34730 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1nHrJL-0002o6-9t; Wed, 09 Feb 2022 10:03:23 -0800
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Wed, 9 Feb 2022 11:03:06 -0700
Message-ID: <20220209180306.2629180-2-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209180306.2629180-1-neal.frager@xilinx.com>
References: <20220209180306.2629180-1-neal.frager@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 493b6214-1bca-4066-5d1c-08d9ebf67c5e
X-MS-TrafficTypeDiagnostic: DM6PR02MB6377:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB637773C6DCA6D00A1F26D985D72E9@DM6PR02MB6377.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3eBYl5/IzV1LbRMxPkY30SNkdV2vmNf08u+EF3gjIMJlTXhrM6V5Z9pDxJ33f1CphkfzNdiUu1IdpWysGC0tZph7irjvYaL0K86iPNnGCOgVeola1hfpeJhwSPnT8SLJ2MGYIKP/5EpXyDuj+jFn1jNruB/ZrLYgBgKu5QMwXQ+8jCLHFOq5ertfEYd6h3QaLC2C7sWKpyxKfmIgsE6GtEfaY4ysNSabhl3HfJ1kJFe0gczOnXbHW4tOmofJQ3WUW/+vxhi+tt7SfdijnWE1qnZqJA+4Nf+tT19t2UHrRObqTUM57cXNRTrtbYLhNfBhjoGWh+AqbjpE24SkUm3ik48BogEaP0S/HodP7OREFaJ35aBcg/b0ceTDUFJp77a9WsWRJWHlmDy4MdljEO77e2Kc/KTA7L7peGzucqxxuE8CcgDUy6EkT3Rf1TsSoJ9sCvXvMbPskWmaNcKmmzfNioN2qlP9A7AHgAR83DYSu6Puge1gVUjQ4VbtxhljRsZx/9SaCSOuPf7qLG3smJ07hPO5m1VvT6NhPAx3KL0jqaJAdLpiN+oH99C2MFoq0cz8t3kueq9L9BxO1VxKiOLp953RWLOHiitScqMVjy1Rlagt96htIZ6xojVoCjPRWEDMWCTgW9YE65pOsXczl5YM5jxf/BAHYpIYp6ydK81EMO26/qJmT+ayReyUStNru7LWjPRgU6l3rEhbDMVsXlMUmBrbEAChDONS+42r+mkRH/NYPqZclyAgo+f4NuG05/YGDyy7LwEnVilucHCNQsyJZ8Qlw8RtkDmeM8G7OLK9M5C3fmf0TQrQX4QTsZ4vNtTxvBjRqFllOJ3Ta5c9HGvoTQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(40460700003)(36860700001)(8936002)(336012)(508600001)(70206006)(966005)(7696005)(8676002)(426003)(70586007)(107886003)(9786002)(83380400001)(6666004)(4326008)(47076005)(26005)(6916009)(316002)(54906003)(1076003)(7636003)(36756003)(82310400004)(356005)(5660300002)(2616005)(44832011)(186003)(2906002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 18:03:32.9270 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 493b6214-1bca-4066-5d1c-08d9ebf67c5e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6377
Subject: [Buildroot] [PATCH v3 2/2] add configs/zynqmp_zcu102_defconfig
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
