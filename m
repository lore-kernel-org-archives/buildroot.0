Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2169CC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 02:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7B2D84551;
	Sat,  9 Apr 2022 02:32:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vSR3XtsS1Lok; Sat,  9 Apr 2022 02:32:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C59388453F;
	Sat,  9 Apr 2022 02:32:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 962041BF239
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 02:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82C20405B0
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 02:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oCslft0Vs6aS for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 02:32:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12rlnn2006a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::6a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09B6F403A7
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 02:32:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LflsdV+ibla5qN1/PbzE8iZ5Cs4ByIGT5XVSV3sTop8jSjpb/swWK6roVCO5dEziE9b9STT6WhwbOEsAgNPr7OoFl31cBTjpzQ4j3s21SyvJUSRnOujU320eZf3NhmsMWPJrR/x0QxabXSY/fOEcpyuV3Pl1AeQkBYt6yZF0i2GYPMHmn+vmrRHs5qQk3PA07IjobmX7eqjrWNmNb5uGAjyFNaiWHbhX0huQCxttTNPisQeVJTMf3iJCg3jMIc9/6EcJEcL2KmNFtwzVOceTU04JL2Acs+McbkKdhT6/LSNMGTlPl8OIQvAcHIE+4Gf2KzpkFFbffS2Ckd//O0g1bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stajpLArCYwiMxS3Gw9IdAre6V8eu2LgRJNQXxiJIR0=;
 b=GFAa+56TXENDnUenq1ZSu8vmi7bbPwQzMizJvMcJM4HlCVgLOJ3iiinZ3a/gLLTV0IIavn70AublESntywRUKnyYjqlrH7jparOHLnQe3zWdpnUfGjtg7BD4el0edYKq1Itoa4EWie99AzpzgCWzrG8atM7Nm7ebKh7aIF4lVszePCZG8xFYZHi98/7xrWR66A6Wu+QZJG2tMwfN4E/5HeFsCXULgOOWjkUGmxEQFQMAzuCZ/2FDHhLJ5vrRM4j9QnOnyhMOLcJu7SXrV/WGNIXFeUJ0eScGTPPrrx0V3HlUkEXn+pb1mrRKzQy9Tk/cs6duCIlEsy/39z2Ud5Jmjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stajpLArCYwiMxS3Gw9IdAre6V8eu2LgRJNQXxiJIR0=;
 b=qY57KDfajx6RdNnfo/kS6sXbjhT4Yl66dOst9i7qpnYSREgh043yedyJpRf6mnHnoLNxN/JC7ShnCkv73bIo24FA7umxfRony7DVTQ5VOsE+G039a2Ntj+h7b874NNGmXnjiSJUwkd3lNU2k31via7PHOkP1wQwT2fLORiN8QVo=
Received: from BN9PR03CA0167.namprd03.prod.outlook.com (2603:10b6:408:f4::22)
 by DM5PR0201MB3526.namprd02.prod.outlook.com (2603:10b6:4:77::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Fri, 8 Apr
 2022 14:55:52 +0000
Received: from BN1NAM02FT028.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::5e) by BN9PR03CA0167.outlook.office365.com
 (2603:10b6:408:f4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22 via Frontend
 Transport; Fri, 8 Apr 2022 14:55:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT028.mail.protection.outlook.com (10.13.2.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.21 via Frontend Transport; Fri, 8 Apr 2022 14:55:51 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 8 Apr 2022 07:55:48 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 8 Apr 2022 07:55:48 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, ju.o@free.fr,
 peter@korsgaard.com, neal.frager@amd.com
Received: from [172.25.185.186] (port=52866 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1ncq1c-0000FZ-EY; Fri, 08 Apr 2022 07:55:48 -0700
To: <buildroot@buildroot.org>
Date: Fri, 8 Apr 2022 08:55:29 -0600
Message-ID: <20220408145531.1641356-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408145531.1641356-1-neal.frager@amd.com>
References: <20220408145531.1641356-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d49b31e7-da0e-4e38-166b-08da196fdfe4
X-MS-TrafficTypeDiagnostic: DM5PR0201MB3526:EE_
X-Microsoft-Antispam-PRVS: <DM5PR0201MB3526E8DC7F31A41A03E443C9F0E99@DM5PR0201MB3526.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ntOw0qopwzCFnfaset+AU+Fqvh+MczNi+VfRV0Gl6OnvLwxa1yHTP8tjs0ydd8JLXSW1pdDy/r1FeWyBJ57Rd21e4LyCZLYn0ySCpIwJ+eXl+145cC6qNjtyN5tBJQsVFgq78hbJdq+i2iiUZwISQhICgGyfP+9n3/FDmYX1YRhss08rLDfRasa1ZcTeZVag0153YIMQb6BO9sdx1BKzsiDXNcOCvV6kmzv98ceL/I+T+WSZkN28VaIzNJ18mwCRWivvFkmw/eV8TiSdqwDF2kfzYnAK4oFzbxdOZquK6Ly1RgnQiY+SpwEyTExzajV9vnYcTJcdhZ2eQJraxtTwUcBwu317oCHUCqUJAIdFD/GNbLwgWEaTtEU2ZKbGhOX2fq9Z9czc7zI8waY5Vt2GT1eFQV9bkS/EvUih1XJdIZc3GCgWq4ePUaPyE1mJT0+7QF147iYQN3N2uebD/hduiIaYWV+uTpPuBRg/TzN+kalvn2wqHOEBNOolSKp5IfGkWo26BozJYMdlYL1duK6sNASTAEDC34HgE6TTKZu5M2j2eaIFU2ZYkfov0Yi2fdYwHtKKLp4RAAvDJTn3zvQ58sGPPibi+wJluukJ7039udZSHrJeckopQ9ahkuSaXiRRVTQXhp0lA8+bxrUNwggWO/E5Rq04ON33s4u8xi5rsfJ6qBGKCEDo3V6q9j8XlHeRV1M0RQ71ga5eJMciahWZ9lQm8RyCfeZJLLL6JHNlEGbU8JfyKm5TNehNjs/83XLgqwdonln9F2IZ6+EvOv6t7NHpLlzICF0Yi8Oh8A7Wu/XGKrRRI1Q0HmkQZV3i/9oKC5SYrhVSNDuzcuVDJExXlHu0xLR8G01jn2+/38CEPU=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(54906003)(8676002)(82310400005)(47076005)(356005)(70206006)(508600001)(4326008)(7636003)(6666004)(36756003)(6916009)(2906002)(9786002)(40460700003)(8936002)(86362001)(35950700001)(2616005)(5660300002)(83380400001)(316002)(44832011)(70586007)(1076003)(26005)(336012)(102446001)(41080700001);
 DIR:OUT; SFP:1022; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 14:55:51.3271 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d49b31e7-da0e-4e38-166b-08da196fdfe4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT028.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3526
Subject: [Buildroot] [PATCH v1 2/4] configs/zynq_zed_defconfig: bump to
 Xilinx 2021.2
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
Cc: luca@lucaceresoli.net, giulio.benetti@benettiengineering.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps configs/zynq_zed_defconfig to Xilinx software release 2021.2
which includes the following updates:
  - U-Boot bumped to 2021.01
  - Linux bumped to 5.10
  - rootfs changed from CPIO to EXT4
  - extlinux.conf for distro boot support

This patch has been build tested only.
This patch is dependent on the configs/zynq_zc706_defconfig patch.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynq/zed/uboot.fragment |  1 +
 configs/zynq_zed_defconfig    | 22 ++++++++++++----------
 2 files changed, 13 insertions(+), 10 deletions(-)
 create mode 100644 board/zynq/zed/uboot.fragment

diff --git a/board/zynq/zed/uboot.fragment b/board/zynq/zed/uboot.fragment
new file mode 100644
index 0000000000..d58fcd5439
--- /dev/null
+++ b/board/zynq/zed/uboot.fragment
@@ -0,0 +1 @@
+CONFIG_DEFAULT_DEVICE_TREE="zynq-zed"
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index a215695b54..c4d95f20b7 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -2,26 +2,28 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.10_2021.2"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zed"
-BR2_TARGET_ROOTFS_CPIO=y
-BR2_TARGET_ROOTFS_CPIO_GZIP=y
-BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2018.2"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zed"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2021.01_2021.2"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/zed/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
