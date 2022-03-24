Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D6CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 23:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27CDC41CD8;
	Thu, 24 Mar 2022 23:56:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0b_ne8bk1L6y; Thu, 24 Mar 2022 23:56:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 627CB41CD1;
	Thu, 24 Mar 2022 23:56:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 203051BF3BF
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 23:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06DFE41098
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 23:56:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z_orZAH_yxUO for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 23:56:49 +0000 (UTC)
X-Greylist: delayed 05:01:03 by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (unknown
 [IPv6:2a01:111:f400:7e89::46])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 926FC41094
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 23:56:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VE5vqJxfanPHxn1c44ZdJbPJ5u5JXwn0zJE5axJ+MoT39DGMoK1QnjrourKPurbQMWu+plsCmetWEWBvI/+eXvStggHlvGkCuvESQ0rTqUjYUziTh6J/Yy7XjoCRRoNy3y5OaVYabZ4tHf+bEleBOWwiU1ShtuDC4GHuTfjbW+m5NldG5oA9fZrx4fzUxpaiRzYleXLuRkSx0TcW5OPzLYuV8Ib/8O3VHJ1gwzFT7IC7VZPYjqMtT+zlDKvZzAqzkzr5hJ+5+ufJjCt2xwL4Tl+xRSa3cQDeJ3GKCtJNgoXBxDwQFqmQmw9DRvBVdCOWPOs+1sXuJhkViOOm0h3hpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0kg3/1e8zRg0EfLsRZmURL0smA7AuvyMaijezz5Mng=;
 b=aD2Mq6EEsSHfzdwyAhYZUhjZL/uP0gbYLg+isIpRhTUejMVyDrbGsKbDb1vGeTzS0G9awF6OagC87qKJmSAOpxKE9pdto3P5ZJMDEW2M/YnkqXFZIaeBwj3/ww2HgGSdJhxhV/XgKaCJrj/PWEvTR/tOAMpPQkofUuaucLZLT6/VyeoICMb8xh0JifRsmWjasdawMWNuMnsphMbQQQKxUTSWuu1YcrwwFe9wulXZMCrTHmg8MKBZFVTWmt/jaF6WXpyO7EjqC6kIXV0oYfsgI9SkNUQ0gOmNetH1ggaFyNO6DAFBkjmpR+YvmCSJwfxfRVadK8Kxwott8WS/cE8oow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0kg3/1e8zRg0EfLsRZmURL0smA7AuvyMaijezz5Mng=;
 b=BmaVAAsadaARzsMiWMYMgxx6rBNOCwdSR/Zx3R/HnjwvTxrKy2oMqf+NecbgpQiKlcwj7UDM1hYMlIJMQ5TTywf+HI0ey/KEa0GQNf2bQzYuZ5FRA0mXz7rWzvudoadQ1V1vvObHuqs8O6WCkX/cMD8/3kzHuGL/fkOChP24IvI=
Received: from BN9PR03CA0697.namprd03.prod.outlook.com (2603:10b6:408:ef::12)
 by MWHPR02MB3296.namprd02.prod.outlook.com (2603:10b6:301:6c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Thu, 24 Mar
 2022 14:25:49 +0000
Received: from BN1NAM02FT050.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::32) by BN9PR03CA0697.outlook.office365.com
 (2603:10b6:408:ef::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19 via Frontend
 Transport; Thu, 24 Mar 2022 14:25:48 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT050.mail.protection.outlook.com (10.13.2.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.17 via Frontend Transport; Thu, 24 Mar 2022 14:25:48 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 24 Mar 2022 07:25:36 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 24 Mar 2022 07:25:35 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, michal.simek@amd.com,
 peter@korsgaard.com, neal.frager@amd.com
Received: from [172.25.185.186] (port=40354 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nXMef-000DGW-CZ; Thu, 24 Mar 2022 05:33:29 -0700
To: <buildroot@buildroot.org>
Date: Thu, 24 Mar 2022 06:31:17 -0600
Message-ID: <20220324123117.2369981-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e423d5ae-a66d-4268-9446-08da0da230f0
X-MS-TrafficTypeDiagnostic: MWHPR02MB3296:EE_
X-Microsoft-Antispam-PRVS: <MWHPR02MB3296AB688E344491116D6C2FF0199@MWHPR02MB3296.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vEvRgAtlp36zij0u5hVmoxLaZfNMNdNpvbOwnKI/gvuE8CIojsNmM2rdeQaGB8qCJ17odkYn5US1nDiwko2+GVle12QajEFe2i8vljuZogZGxu3hp6C2qdCmF8FbGMsaFVxlSVJaXmj/6J4Re/94Gk5q0pul2KsbUKJCVkZEFdQGH5izIfBjjYF3Gt6D4e8erKIGYhnp51TxsaVQJ9ZdgcNPQLZl8zhtcNKXUnQ3mLvX1ly+ySyKJxDo6NovpkXpbWAdPlLtyWb5RUFWOUTR9PIDBCQUuq5kAU8R/S7tD/eEucblsXV0UhO9bEC9iPwYE4smYPXLYsEdlXZzxqmLODrrqzaQ2wVa2uUBPVdV7VCC8O7Kz6aj1yPTn2HE07IGJ09bPS1wRc9VrwPO8P+2ab+BFvdYYTiU3TVbUlu/eo7kQ9YClkqjT4g0MT9ikW9XMGyVaRYBca7j3VxodQ0T644gqfvaMEc+mZLtsTyR9q/9X0TlmJ0ZiV0Do0EI0Kn7dD4e1XSF40EiVg3AMWcZgB8LrOWhVSIN8LxEpZf/10+QO1kRxK+Do/A+wIpcULjO/HqrJh0/gjaHNogt1E5vK4rNZnIhGdLyIy/GeK6HzD+lRbgY5UssY415EFamFxMUA9seOPtFkvhdRvieSg6+7Va6WdCCoLMacU64BWH/C9hG9zlNJLGQ7rTd5tniw5aqjdvGQZmOmNNCQOw+mA+ElK2NTcCyUsGW1IAaPXjUCYjje19EAaiztoJe1HwNtK9vpHo+AZBUBU2oTeDENk6FM/Cd5r8eSFvg2EQXLCG9SVB17fJv4m0mxPaizqOrExP16Fsb8PM02DQ31sMGeGM9mg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(70206006)(8676002)(54906003)(70586007)(2906002)(966005)(86362001)(4326008)(82310400004)(5660300002)(6666004)(7636003)(36756003)(9786002)(336012)(356005)(26005)(35950700001)(2616005)(1076003)(8936002)(40460700003)(47076005)(508600001)(316002)(83380400001)(6916009)(44832011)(102446001);
 DIR:OUT; SFP:1022; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 14:25:48.2032 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e423d5ae-a66d-4268-9446-08da0da230f0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT050.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3296
Subject: [Buildroot] [PATCH v2 1/1] configs/zynqmp_zcu10x: change git to
 https
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
Cc: luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 michal.simek@amd.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch migrates Xilinx Linux kernel and U-Boot from git:// to https://
The git:// location is no longer supported.

For more details:
https://github.blog/2021-09-01-improving-git-protocol-security-github/

Signed-off-by: Neal Frager <neal.frager@amd.com>

---
V1->V2:
 -separated DEVELOPERS file update to make stand alone patch
---
 configs/zynqmp_zcu102_defconfig | 4 ++--
 configs/zynqmp_zcu106_defconfig | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 4e96489179..2dd0817bd8 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -4,7 +4,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v5.15-930-g966124532656bc95d781abf57531e4cd4f962237"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -22,7 +22,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2022.01-165-g667001319cbe511ce6353195fb4910ae5cb041ce"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/zcu102/uboot.fragment"
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 0a97975aa0..d836edfaf0 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -4,7 +4,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v5.15-930-g966124532656bc95d781abf57531e4cd4f962237"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -22,7 +22,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2022.01-165-g667001319cbe511ce6353195fb4910ae5cb041ce"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/zcu106/uboot.fragment"
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
