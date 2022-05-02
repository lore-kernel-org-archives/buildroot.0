Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB50C433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 07:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C86040526;
	Mon,  2 May 2022 07:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JwmqXguMnIEg; Mon,  2 May 2022 07:49:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55191403FB;
	Mon,  2 May 2022 07:49:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A67A71BF388
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 07:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 930FD4091E
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 07:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w4oCzzt6w3AJ for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 07:49:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::614])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 705F14091A
 for <buildroot@buildroot.org>; Mon,  2 May 2022 07:49:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chfGCoPPHwFnclsVQu8gPlKeL8RCaSNNgm7gNd/cb6VqyVpXsKZbHijm2b5/o5b9skt+gJGha4RfT/b8jHx5SPe5Macmnvx7gRbWEYMsxI+Y5pINSjxiUX347puEkUqRVQ2wCffdgXQ6dUHMEo0yfwLRiEZ+fTqiHnLV4PQ55qQkmMIcXfxh3254GP9xXcVoYuAJX2mFHO9gtLloqTNYdtEu2L4kGB/N8pgmGSFHO+u1jSIeCiO6W5D4iIa0MC9A+ZZQ8ikOZuEcsh9aL65MYk+aP4qoLmmpgEdjLAX6oFjRf2+O3dQu34PAOdqfjWGPtFtQwKvOpdvcaZ14aUBuiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vbNvsAkxi6CS0nmlSHfSkh5HVlxnkUBFAaeadJWghc=;
 b=khneprb2SV23++f5LvSPCIABuMoJr1+jtMgAe1UQ7E5EVUynNrmvxzvDaj32Of6hIyRvXZogPd0jjcmTa0G/BhoQvI5EZtHBvYqGCGSQ/qvg3XnXEz1wtl707dFWNkpMS6WyM3eRVH0cI0r9rJvUJ+MufuNcK77M6FH2G+s/sDV60COIoOUbA7uucj+CkflmCqb2PqcOJXxWtb1KMDmtzFMXx/CfNS8j6NBtIn+F4Ad0u++U4zn5Sbc4Q71R/LY4b1iXUgs9zwbn5SWGhUNJsoOy5jqN4VI986T4Xcmam9iY1jLXfnxTKMNM3MtCHZgGLVogKFEu1jkkQNS1iLdejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vbNvsAkxi6CS0nmlSHfSkh5HVlxnkUBFAaeadJWghc=;
 b=Jz6BxGB1tXZiuXIN6QL3fSa/8Om9BdiYOGWXhqHIFMY+jzUrTU+deX+mElRVRUihpmFEAoLPv4mgMIn6kfUja+OW00QMmTkPy/KXpYY9NlfyCadVp9G2iOZhN7BC2cyazEyWdDfqoCbAIYll98brcBttw2xrY1pstGMBHjvvlxU=
Received: from DM6PR03CA0095.namprd03.prod.outlook.com (2603:10b6:5:333::28)
 by BY5PR02MB6083.namprd02.prod.outlook.com (2603:10b6:a03:1ff::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Mon, 2 May
 2022 07:49:25 +0000
Received: from DM3NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::67) by DM6PR03CA0095.outlook.office365.com
 (2603:10b6:5:333::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Mon, 2 May 2022 07:49:25 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT063.mail.protection.outlook.com (10.13.5.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Mon, 2 May 2022 07:49:24 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 2 May 2022 00:49:24 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 2 May 2022 00:49:24 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 neal.frager@amd.com
Received: from [172.25.185.186] (port=40206 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nlQo8-00062N-BV; Mon, 02 May 2022 00:49:24 -0700
To: <buildroot@buildroot.org>
Date: Mon, 2 May 2022 01:49:07 -0600
Message-ID: <20220502074907.3941472-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502074907.3941472-1-neal.frager@amd.com>
References: <20220502074907.3941472-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6589f772-b8ce-440c-581c-08da2c10470f
X-MS-TrafficTypeDiagnostic: BY5PR02MB6083:EE_
X-Microsoft-Antispam-PRVS: <BY5PR02MB6083BBD36873367CD64D9C51F0C19@BY5PR02MB6083.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZpA4LYqFeUsH9W9/SZs7z7vPOJbxJSZNX0h0TsliK9KDq89uOMeYa9Wbkvjj4KBIeas+lRtRA65ALSdw0p7imx5MOKuSrUATY57DB5vrS8ZDg3Q2sm/rXOokoZqVmNTat9ALOIaAWBIeI1goY49h8NvPEaJDExj9Xzi1zeX6BwknsTRNxYRlg+C+MNk3lxrOms656nfBTyleCpXMf/qJgKzHOrDQsZPne7p7XtYyXtrIBM6MkxysfOMjn06uMb3yZ0COfcRELDQ6NPYWFbrud9HoWhDNLW2/p6bSvDaeex1pteeHoLuoiChg+wTVNkcCQBbFdQ/AUBce57l+aSus7/9ijcbliQjypQ1XZl3ZqYApFZuYA24Zhz/s3CgJoIHiLATNNawSU7gAHl9yEzYVo7OcSf5Jy8qDC4iy78ACHCX8f9qUic4IoZk5iuRLMgzC1ipVn14O9VegtlcSz8FFB99cMk/h6ya/JTP40sr+aYL5otXEAlsbJtugdrZZxFlTSwZcOHE+tBBXzUKEh0t2w+tBSxNuXRCNogR8YYgz+n4l2E3JgnwaqCkzLgLRo8BnbiHuR9I0qrnykv3O5vVsEka4ZO1xwZRp9R5i5nifJDSKYR6uguG5N7n+LYNpvM8WGVa7L3hKBziap6MWNi0xwbCJL1r3MA+XZfr/3BTvhpLCbtdU/mrX17apYt84+5ErhIBZohPFr/xAjx6v8PGhGT/UQtjApAWvvMToJo0GiYeMW/Rofd1mIMsHfIs1aOFM7kM5UY5t2yzqpqOunua/j4uWfDALlja3osT8biptqRGPCiB9ZhXJmiOU/BF4CXbWK9tonr+Mxb1pVXhsFfGZfw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(508600001)(83380400001)(8936002)(9786002)(70586007)(70206006)(8676002)(44832011)(1076003)(26005)(5660300002)(86362001)(40460700003)(2616005)(4326008)(336012)(47076005)(2906002)(6666004)(82310400005)(356005)(7636003)(316002)(36756003)(35950700001)(6916009)(54906003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 07:49:24.8695 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6589f772-b8ce-440c-581c-08da2c10470f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT063.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6083
Subject: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig: bump to
 Xilinx 2022.1
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
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps configs/zynqmp_zcu106_defconfig to Xilinx software release 2022.1
which includes the following updates:
  - TF-A release version 2.6
  - U-Boot release version 2022.01
  - Linux kernel release version 5.15.19

It is better to use a Xilinx official release version than sha tags.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu106_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index d836edfaf0..c8b507f0db 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v5.15-930-g966124532656bc95d781abf57531e4cd4f962237"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.15_LTS_2022.1"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
@@ -16,14 +16,14 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/Xilinx/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.6-33-ge678d5ddc475f34dea8f5004fb6ebde118621784"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="xlnx_rebase_v2.6_2022.1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2022.01-165-g667001319cbe511ce6353195fb4910ae5cb041ce"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2022.01_2022.1"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/zcu106/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
