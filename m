Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86540C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 00:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 252C741ECE;
	Sat,  9 Apr 2022 00:30:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V3LvrYqELHnm; Sat,  9 Apr 2022 00:30:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C371841ECB;
	Sat,  9 Apr 2022 00:30:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E46071C11A9
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 00:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2B8D41ECB
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 00:30:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fK4QJOji0j6V for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 00:30:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12rlnn2005f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::5f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3042941ECA
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 00:30:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5MF7W6A3+vqce7u3Nya32RNKl9cVtYCZzxtM6e51uWxclaY/ZX5Djx2S9jPD0gDrXQFiDvrJIIMesmwtUQ7cgRf/+Cp7RyCTk7gZXGGdZpI0YTg5+fqvZlj0KV6kFpG8Y8mIpaIX1shCLyW5OZbK5FnW32SRgguuwysO8U1SwgNwV1Z23DfJ1OJ+FiYqY5+c8X5mrvHOr6yVz1fltSHZOlWzlyFmpL6j5xTrs2wgII+flThxWsjZCDHT9lVi0Epx3cmB+52yy+hLZqUUJ/RKySaxlYMtwECCZE/zXA3kL93k6AbfTp8QSO5x92R5rpyLutjDc3972RcbpC86u5w9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9unguFVFGrsdAWQzJbZiByN0PqXIxTM4c7VEsLP6jU=;
 b=AnryWVV2iPYYzx3qffbnK9VZnGwXiAhsEh1vqvOjJi4Uy/Id7yP/fKAMzE0Ld/LTrM//L0RmtoL/4ctHKr9S8/4YdxyW+Af7kJ5jgfQUp69IsOG3JZiuSAHUG/ajQMUWffRGI6hLvNo7uwlBAZo03UKYRBHqtFkr/Eusma56WP3CYb53VxkJTQdJpDeZYDqfnxdi7TUGHjGqt160mwHl9bhFZKAdrt2P578RNwUmvl0QOqv0JzEZkR4plZkPxmCKtXkwtl+xifsis3WTfTlXOTfxDcZxdSdWihMAJ6I9y3GZPboaqbNYNR0D4MbO1s9GbiVlsnPp4TW9ZnVtKenMrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9unguFVFGrsdAWQzJbZiByN0PqXIxTM4c7VEsLP6jU=;
 b=nGaYKg1vdQqdexDILi5Ld8ol7zeyNBXzn0Rn23IkP0cQzeGjwyMnQjsMR6zWcibFS9uJcjc8E8diYXw9UU0Wg+gWKKu4RGK4xc7t2ORwglR+CnolaEphip77JX5b39SMCPDz+jDwmhTJt7rSOSNeuwpwS3S+5GW0f8KAczbrD6g=
Received: from BN9PR03CA0170.namprd03.prod.outlook.com (2603:10b6:408:f4::25)
 by DM5PR02MB2409.namprd02.prod.outlook.com (2603:10b6:3:51::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Fri, 8 Apr
 2022 14:55:58 +0000
Received: from BN1NAM02FT028.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::13) by BN9PR03CA0170.outlook.office365.com
 (2603:10b6:408:f4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26 via Frontend
 Transport; Fri, 8 Apr 2022 14:55:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT028.mail.protection.outlook.com (10.13.2.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.21 via Frontend Transport; Fri, 8 Apr 2022 14:55:57 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 8 Apr 2022 07:55:55 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 8 Apr 2022 07:55:55 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, ju.o@free.fr,
 peter@korsgaard.com, neal.frager@amd.com
Received: from [172.25.185.186] (port=52866 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1ncq1j-0000FZ-Px; Fri, 08 Apr 2022 07:55:55 -0700
To: <buildroot@buildroot.org>
Date: Fri, 8 Apr 2022 08:55:31 -0600
Message-ID: <20220408145531.1641356-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408145531.1641356-1-neal.frager@amd.com>
References: <20220408145531.1641356-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcb3358d-d3c4-4f63-5db7-08da196fe3cd
X-MS-TrafficTypeDiagnostic: DM5PR02MB2409:EE_
X-Microsoft-Antispam-PRVS: <DM5PR02MB24098864F86B82E9B71D1E05F0E99@DM5PR02MB2409.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n/yoTt+a2Dsuu9EDh8J9m7vtgMximOSblXDPbWJEzsLZchY+zD+tv34DKEzDW4f3DtR/vsFB9pVHktuJP3R0ZsuNhlpqXb4sLKUmV8YWlNYTujDEXGgbBgywPjN4yLpSh2r6NdFtyjf4KOLiDqqnRzxiesoCTsAHRM4C3j8/+tnp8ELcPnxN9y1JTO7mvtM3XmBkGfOwQ4ZoWvIL7d70/+SiI54L3KAiKASUSNvtBwEhvQyEd/ErQA0E4WisEH0UKmzE5aCLEzMjKmP3JUZ+6HtNWR+e6ziXrpq7AzZjddYEY+JCFLSgrJeowG+amHFqd0cFfhpwdJYuHXwU+45MfoFpqdyJ9QdtE27/7uDoIoHclhCiw9UCqJH59fGE6VOI3trs81EMi+hObHrIwZcd7I8H6YfkhBJPYfSG3ruX3btzzoCOay9c2tK0JqfQR//h/uh2fOzvBRKLgm5rnIwLjDW7BIGCeVdfsnqIceo3g8Q7wU2LG+/3XDDYzsx4asu5wYOCdzTy1qLhtv/Y7VwPmt9KLadSVInUPxepD+BcbTHzPvOo3Jg6wqtXibuYpwQdFAoUaPbFGRQThgSHDLV/Kqcyx487TNOaJOcuZuKO3WgwuCbDibPLxVgJZ2gxUZ4yUocTnhx9uSpkaEmwLgWYGgVEAgDVrOPyGomYia4vHxb2cphnR+X59F+1XzBARUmWXNtDVXvIfr9sDMEZ7mqJEKllL2r0lAOGMbLS314jXqo=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(70586007)(70206006)(4326008)(2616005)(8676002)(82310400005)(36756003)(26005)(7636003)(1076003)(316002)(54906003)(6916009)(9786002)(8936002)(83380400001)(336012)(6666004)(44832011)(356005)(86362001)(40460700003)(5660300002)(508600001)(35950700001)(2906002)(47076005)(102446001)(41080700001);
 DIR:OUT; SFP:1022; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 14:55:57.8735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb3358d-d3c4-4f63-5db7-08da196fe3cd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT028.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2409
Subject: [Buildroot] [PATCH v1 4/4] configs/zynq_qmtech_defconfig: bump to
 ext4 and distro boot
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

This patch includes the following updates for configs/zynq_qmtech_defconfig:
  - rootfs changed from CPIO to EXT4
  - extlinux.conf for distro boot support
  - enables support for host machines without OpenSSL required by U-Boot and Linux

This patch is necessary to support the new board/zynq/post-image.sh.
This patch has been build tested only.
This patch is dependent on the configs/zynq_zc706_defconfig patch.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_qmtech_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/zynq_qmtech_defconfig b/configs/zynq_qmtech_defconfig
index 4db3f68b1f..f536b80f57 100644
--- a/configs/zynq_qmtech_defconfig
+++ b/configs/zynq_qmtech_defconfig
@@ -5,6 +5,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_GLOBAL_PATCH_DIR="board/qmtech/zynq/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
@@ -14,9 +15,9 @@ BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-qmtech"
-BR2_TARGET_ROOTFS_CPIO=y
-BR2_TARGET_ROOTFS_CPIO_GZIP=y
-BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
