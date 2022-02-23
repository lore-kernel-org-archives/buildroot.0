Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE34C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 12:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A31A960F41;
	Wed, 23 Feb 2022 12:51:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nfgs2eJIgHjB; Wed, 23 Feb 2022 12:51:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B131560B9A;
	Wed, 23 Feb 2022 12:51:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3364A1BF83C
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 12:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20E394152A
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 12:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c-ej7vCtmguX for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 12:51:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::60e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 533DB41512
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 12:51:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzxpxylAmf5Jl7rqpSHNgDijhhxn7NwF/rmduFB0+CgsbE1fi+zYO0rnPgiC5sHrwbZpQ14/W/ir/HW3Bwtm4GaepdH4w9jRqLQpzcZhFYn/cjFpcgii7gTLLDBsXXiVFvMZCZfL7EdHcORE6j6m+qftxiwBa6LGiY+PIgmtp+9quqI76T/O3XI/6CMDFtN4nQh4hFQ4hWKBnr4lI1lI15okDaT85uuyYNKpjRBBdbrnhTxS+1fjhxb4kxbJVuMKCQJ0CotU4HxgMdAwrvPgG2Ug3MhygyFQT6g06BxPwN5+f0ucUsDfXutzpGyWi8oqVFdeMvfz59hn2cYN/ursmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsYK0AlWaPZmElVz5VJzNbkgDtxGNuyA2rND2XWK7fI=;
 b=b59wjoLZ1IG1PMWQbNOsXvVOh+1hb3w6Gf6j6mTpcVhNCd6MaTzNUnMLvixTo8iJZ8P5CvvuTeNEaOK1wu1FbdKsbzoCusR9/Ch4ZPv4SCvkEV5tpafXY6t6CgC6LQhnAiS+WJ8czc+8Z7YTfUYmPevTzk3D+o2XulV1541W0fJsIbbw8L9qtD52xuYdLEsbniOMDlTKl+AkiXPPcUl8jBfn7pY83+09VhFVUfKwvDac5imdbfW4cumG/CFYLYwKbOmMyrwR3amBz9dOPghK9ffoIr7lQj5mBsuG7LvBCSi7NVM0AVvGu51EQ7T1EhKPbmY5hC+/aHCpg5XTDNQXyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsYK0AlWaPZmElVz5VJzNbkgDtxGNuyA2rND2XWK7fI=;
 b=RYdwthh+PPJ1j3jymLFVD5qqU/lsqwraksMaPwfWzTZuVCr2E4ui1bLzp8W8cToeADmEOH0LmnYvHClj1sekWHY3ysxwNuEjqZY0wS4FthAQ4u0dexzkxDfKC5bCZDM29AkOWpp0WGuEGRRac1VlSrbqINGPjcFL1pHv7RHwm1E=
Received: from SN4PR0501CA0011.namprd05.prod.outlook.com
 (2603:10b6:803:40::24) by SJ0PR02MB7311.namprd02.prod.outlook.com
 (2603:10b6:a03:29f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 12:51:39 +0000
Received: from SN1NAM02FT0006.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:40:cafe::7b) by SN4PR0501CA0011.outlook.office365.com
 (2603:10b6:803:40::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.9 via Frontend
 Transport; Wed, 23 Feb 2022 12:51:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0006.mail.protection.outlook.com (10.97.5.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Wed, 23 Feb 2022 12:51:38 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 23 Feb 2022 04:51:38 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 23 Feb 2022 04:51:38 -0800
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com
Received: from [172.25.185.186] (port=54804 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1nMr7J-000Dcn-Rm; Wed, 23 Feb 2022 04:51:37 -0800
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Wed, 23 Feb 2022 05:51:18 -0700
Message-ID: <20220223125118.2325363-1-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 258cd617-721f-44e1-3680-08d9f6cb3b5c
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7311:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR02MB73116D6A5F1CA7A04AF37CD2D73C9@SJ0PR02MB7311.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fxvRJDnQH0mjW48C5GJkAMa9jxo06Db12vmBzJPOl7/MpIWmw1HG8tBA0ao8Jttc0RplX5/eSF/HP18JZNmWWJZFXxqCnJlcFLNcxEVpvwNUGoHdAYqs0Si6fzJz124hx3qWfWhe5qcAYQSKgfcfQ8x+lYmQwFPfJItQ82GEuk0k9y/hPJF0vMOFSlUGu7LdqjlQj9WfbztHK0V5xsVBNpzkJmfs/Rg9nTEqX6gAjfpLTKg2CnImuj4mI12HHxs+J0yA5EfVyvHUneuqSrptwMgik0xi4QSobP9mLuUC5C/4YtrZUO7xwOZ6QOnMJmJl+Zsm0kmTwFTQKE4YcerY33q5puQ3gApBoqZllWNasHtTC1QFcmJ0OZC7avs2jA5qe6Irf18vAKIKWD830DE2BPE9DFCc2AmeRYsPg8OaropwI3o3MgQRBT5VO/NtVLWoBIvysDQxS6vKTNQUx+kudv759+yDj2GyDFZE39mHl+Qq/uO6Jq1C0n5c5tmjFuYG15/pVTOEmKkZgg9bX4C8rU7ST7hCY7B19r17EONLmk4oL0uyM5rPhQeTcVQW/6umctTrVZGsV646dTTIY5ZBS5MIRFtjCcSTu+ddVQC531S1R6Jt5BX9CbFoqE2kasp2ngfwHVUJ6QTBdEdNmzSGkR/c6kwL8vg1+RfWMrFUjLIMgQKSONeVCiv7aEDQlPY1+jE403BR/XHveE70M+J6Kw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(70206006)(70586007)(8676002)(4326008)(36756003)(7696005)(47076005)(9786002)(8936002)(5660300002)(44832011)(6916009)(54906003)(6666004)(508600001)(316002)(40460700003)(2616005)(2906002)(7636003)(356005)(107886003)(1076003)(82310400004)(83380400001)(26005)(426003)(336012)(186003)(36860700001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 12:51:38.3547 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 258cd617-721f-44e1-3680-08d9f6cb3b5c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0006.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7311
Subject: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu10x: fix U-Boot dts
 config
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
  - fixes U-Boot issue when DEVICE_TREE environment variable undefined
  - bumps U-Boot to Xilinx 2022.01-171
  - bumps Linux to Xilinx 5.15-945

Signed-off-by: Neal Frager <neal.frager@xilinx.com>
---
 board/zynqmp/zcu102/uboot-fragment.config | 2 ++
 board/zynqmp/zcu106/uboot-fragment.config | 2 ++
 configs/zynqmp_zcu102_defconfig           | 5 +++--
 configs/zynqmp_zcu106_defconfig           | 5 +++--
 4 files changed, 10 insertions(+), 4 deletions(-)
 create mode 100644 board/zynqmp/zcu102/uboot-fragment.config
 create mode 100644 board/zynqmp/zcu106/uboot-fragment.config

diff --git a/board/zynqmp/zcu102/uboot-fragment.config b/board/zynqmp/zcu102/uboot-fragment.config
new file mode 100644
index 0000000000..51b4f3c96a
--- /dev/null
+++ b/board/zynqmp/zcu102/uboot-fragment.config
@@ -0,0 +1,2 @@
+CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu102-rev1.0"
+
diff --git a/board/zynqmp/zcu106/uboot-fragment.config b/board/zynqmp/zcu106/uboot-fragment.config
new file mode 100644
index 0000000000..bdb0fafea7
--- /dev/null
+++ b/board/zynqmp/zcu106/uboot-fragment.config
@@ -0,0 +1,2 @@
+CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu106-revA"
+
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 298ce2388c..0c12b9c0e9 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v5.15-930-g966124532656bc95d781abf57531e4cd4f962237"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v5.15-945-gbf3378b260738e3193470858df7996871cbb8389"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
@@ -23,8 +23,9 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2022.01-165-g667001319cbe511ce6353195fb4910ae5cb041ce"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2022.01-171-g61a294ab1b89e2078aa87ad78926d5f46a6af74c"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/zcu102/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 3e51cbfaab..9bb75d1624 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v5.15-930-g966124532656bc95d781abf57531e4cd4f962237"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v5.15-945-gbf3378b260738e3193470858df7996871cbb8389"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
@@ -23,8 +23,9 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2022.01-165-g667001319cbe511ce6353195fb4910ae5cb041ce"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2022.01-171-g61a294ab1b89e2078aa87ad78926d5f46a6af74c"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/zcu106/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
