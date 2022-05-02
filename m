Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1756CC433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 08:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6A3C403FB;
	Mon,  2 May 2022 08:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RiUixwACpGnw; Mon,  2 May 2022 08:46:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 522004052A;
	Mon,  2 May 2022 08:46:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A9B41BF3CE
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 08:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56FFF82CCA
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 08:46:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SL-0xm0VbO3h for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 08:46:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CAB182C3C
 for <buildroot@buildroot.org>; Mon,  2 May 2022 08:46:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjSIr3dDnbfNlceV/+59bvt6kzdYiKdoEgEDFuENA0j7qvK7lO0nm/eCONzJE8vKp2P8CHQn/lwxTVZxXMQLIcRBaaiWHjqVPujUr1KUu8E4nP0eTSGIiDDfHM9aA1gZgn7wTDtMgmV9BX7h4nIDhakqCJW5PEj6CiyKknyWeGOp3MmZEjAyv7WVUWILyEXv64NUFcNlpi+EWbauh7KjF3zAAvRW3U0QjGoG46Bd2/H26Pr0VRQzgk9/PmmvRJkQGtgy1Tk7TRAyaqQCQT9CEeVGW8bFPOvSxdeNbDFxFrs60+KOUxl+7EV6ePb4qOOyM4xKGikhF7NI8fBBdSr0Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teQXZ0SSXkn5aWrLtyV/3wO/386CvfxCl/CoadLm/LQ=;
 b=EphdB/VSe/TNyCeqU2WEnL5C+DIeSad/PygfP1tqK214ccQpEyj6zKMBVwJuljms7TvevYGMDgB7OmHlvf5zCfI86c1L4vjR+5qPHW7UH4LqVKs0mqnJxEfdzNifDnbLIl5ST0B8rWadPeOeXMN/aHoL9Fsi+uy53SxUdD3qzNFdVyTWKpmxwdaF3IycKSFQ4igXBdITyajKaIpU9o8C0202W2OzXFlUBIRnELeAz7qYn9wDZJUqoca848ntu+lTYBSJ8fRTjpjq1ceonlj4gT0/Y8eQ8sSU2whWljsMRpMcXza5P/Iow0PstVUYzciLO4++eMnyEywggT0BuR58Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teQXZ0SSXkn5aWrLtyV/3wO/386CvfxCl/CoadLm/LQ=;
 b=sMX3s7IPdgvln662936akAhyKIK3rK2JUNUkNq5MgXJFTF2lO4CwyQHwWyIud+ZIiNIK3t7JJlHPuOWKPaj6filkRP0VrfApzQKrMOu9JfdCTwCg8VWAwmWstbb4DpLbp8jdCEBjkTmi/Xs5GEPt4TZbax58XSDFYtt1vCRQOCw=
Received: from DS7PR03CA0020.namprd03.prod.outlook.com (2603:10b6:5:3b8::25)
 by SN6PR02MB5024.namprd02.prod.outlook.com (2603:10b6:805:6a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 2 May
 2022 08:46:13 +0000
Received: from DM3NAM02FT056.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3b8:cafe::38) by DS7PR03CA0020.outlook.office365.com
 (2603:10b6:5:3b8::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.23 via Frontend
 Transport; Mon, 2 May 2022 08:46:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT056.mail.protection.outlook.com (10.13.4.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Mon, 2 May 2022 08:46:13 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 2 May 2022 01:46:12 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 2 May 2022 01:46:12 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, ju.o@free.fr,
 arnout@mind.be, peter@korsgaard.com, neal.frager@amd.com
Received: from [172.25.185.186] (port=40742 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nlRh6-0001bv-BT; Mon, 02 May 2022 01:46:12 -0700
To: <buildroot@buildroot.org>
Date: Mon, 2 May 2022 02:45:04 -0600
Message-ID: <20220502084506.4054715-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502084506.4054715-1-neal.frager@amd.com>
References: <20220502084506.4054715-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dd1f288-de61-4e14-a1f1-08da2c1836b6
X-MS-TrafficTypeDiagnostic: SN6PR02MB5024:EE_
X-Microsoft-Antispam-PRVS: <SN6PR02MB5024DAAC4E8892431965D757F0C19@SN6PR02MB5024.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m+LBc2ysWDxETCTf3amcVUI5Pel6ApPFqTnU2Go9pGdT1prxsmMcyVBH/p5pLOZlAcZTsC5HG3m3tLBNZvTZ+bKkVsEPd4Orcu/3p2smgap+i7eb2is/iFYIHOsy3Tc1/+eItpaKEKn7zhlJvvG0mz0PwYP2MZweI68Pm6hW05JRSC2Spi+2fqSAA9Aibr/oESohnIZZe4mtiExlF+NJFkFjxilBJp36l3pv/40We6AOD1eUtd8v0owjGDfWZT/zEneYMZDdjpY6Ypw97DTDPqRssgUfL3Z8GKvFkecjP/eZpKpU7GpKKOiRC6vaskIsd3iK7zVOIHl64sJZmPX9jb0gOgsn66jh24/al9Q0EDq+L5KAMUnIrf0mD9TQSdnYF/8+Jqa2xfuyMCFN1v2XWDBQt4ynZNZAJq2kAqG/hj3SLDauPCWA+6s/rKIoHCc5igC9fT/yFgspykFkabLvWbHkKTCtE2Y4XjwlTS2/0C10ywJNn+UWOM1NQeYcmWVYL9nq7grPvJ7tAJMEAk9FfDrQJOc+9eleVnuCB5BmAfaa2wQQBqGDulJ6J1ynr1UYVKYZdnCF6ijNu22opxi0C/l15diVmVv7cdt40Usxr6yQ+zihz4hn390UbMeKkbaFj7vVKTabGETchPSiGeBB5AotjhBsYPv2qzEPoS43bE7/P9+JsSKzD5EHB8w4NDpRVbfYWRsD2S3vb2d1E2wBRtYmLBmoieSKUaYi7JgsDivAfVxiEnO87RZbHSSE9JJ2EE/S10UyRx2VA9IaYKulTrX6NlW3dCn8QrfynW5lLxWe4q4bt22lh3v3Q47Tyhek
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(4326008)(70586007)(8676002)(86362001)(70206006)(508600001)(35950700001)(6916009)(316002)(54906003)(82310400005)(336012)(36756003)(2906002)(83380400001)(2616005)(47076005)(1076003)(40460700003)(8936002)(356005)(5660300002)(7636003)(6666004)(26005)(9786002)(44832011)(102446001)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 08:46:13.4184 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd1f288-de61-4e14-a1f1-08da2c1836b6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT056.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5024
Subject: [Buildroot] [PATCH v1 3/4] configs/zynq_microzed_defconfig: bump to
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
Cc: ju.o@free.fr, Neal Frager <neal.frager@amd.com>, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps configs/zynq_microzed_defconfig to Xilinx software release 2022.1
which includes the following updates:
  - U-Boot bumped to 2022.01
  - Linux bumped to 5.15.19
  - rootfs changed from CPIO to EXT4
  - extlinux.conf for distro boot support
  - U-Boot migrated from git clone to tarball for faster builds

This patch has been build tested only.
This patch is dependent on the configs/zynq_zc706_defconfig patch.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynq/microzed/uboot.fragment |  1 +
 configs/zynq_microzed_defconfig    | 22 +++++++++++-----------
 2 files changed, 12 insertions(+), 11 deletions(-)
 create mode 100644 board/zynq/microzed/uboot.fragment

diff --git a/board/zynq/microzed/uboot.fragment b/board/zynq/microzed/uboot.fragment
new file mode 100644
index 0000000000..bc4dffaffa
--- /dev/null
+++ b/board/zynq/microzed/uboot.fragment
@@ -0,0 +1 @@
+CONFIG_DEFAULT_DEVICE_TREE="zynq-microzed"
diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 1bb11fee7e..10a4f4095f 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -2,26 +2,26 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xilinx-v2017.3)/linux-xilinx-v2017.3.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zed"
-BR2_TARGET_ROOTFS_CPIO=y
-BR2_TARGET_ROOTFS_CPIO_GZIP=y
-BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-microzed"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2018.2"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_microzed"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/microzed/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
