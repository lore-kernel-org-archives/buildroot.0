Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600C0C433F5
	for <buildroot@archiver.kernel.org>; Fri,  8 Apr 2022 16:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE85F4115E;
	Fri,  8 Apr 2022 16:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kvvK1Hb2Logt; Fri,  8 Apr 2022 16:30:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E189941156;
	Fri,  8 Apr 2022 16:30:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E40621C113E
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 16:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0BA141156
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 16:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id foEdON-OJyss for <buildroot@lists.busybox.net>;
 Fri,  8 Apr 2022 16:30:49 +0000 (UTC)
X-Greylist: delayed 01:19:33 by SQLgrey-1.8.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (unknown
 [IPv6:2a01:111:f400:7e83::4f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D56A40438
 for <buildroot@buildroot.org>; Fri,  8 Apr 2022 16:30:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYxhrRRvx6R/wx0RA+Czs2Z19yxGIGHwKiWtoJtDPGvp83nnOwXlG9GLFUczaQBuWP34YRhCPZesT6+7RN0vuSzK0A4h0HYQ8VK7G8SXhuiBGgCXkam3uYrmg3+2TU2nKJDIJJ0I3apx2c5mpcvlanSOAxZ1x43ClL17G8JW3gPdGrGcxjMXkoZJTuekJ0Wp2+m+S6Uj2Fw1Po3GrNxR19arsPaOmDwuSvGBfCK4joDEbLipGkrDMEOu71Gam4OrsEznE9iw95DPxqQ4OWURcMvi+LqiyyvAlbzvJrAHIXuKuqOlnvXQNSoFHNAPxTTL9J7byxlFvgmXB2OASC/0FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cT9iVS9KsgovzDPSk3Ix3HVdnOo1364J068b4b7izKQ=;
 b=O2jGBHrPc17C21tGrhHHK/s1MMZaKllKAtAu+3Uq1pU9wX5EUc2EduT2gjTU+VjcxNKMt/sLUlETyw7iPWvfFQDMFINlJC2cqKLU/y0Ac7LpLIz7tTkvJFOFLvdoMcYahCGiGAAHR4BtYkKd5rNT+cl4D4ClXlnf5c+HoUy3LIdoijShyonWkUHXwpOLz6wSonFUchHkcKSsvDsy3yVjw4WjAbeHTd56NyFz+SXsugKhc523ZKJ+Q5ORECS+uBaYBIfcceT+J++GWVo4V25PGm/UPrE9G5wX4uQumUkmauNBjoebfdAFtyB+ybltNrweV8fUQSSrmGoqKGru7VwwSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cT9iVS9KsgovzDPSk3Ix3HVdnOo1364J068b4b7izKQ=;
 b=Y1xoYloMGISvw58FLJ0U7LyX3DJ2MS9a0Cg8+km4VO/4E29CyAa4Z9CDDjf3rGLlOKgrBMatWOWpoZ4URQvuI20wfrD1c44dA9mria4hcXKywcZgVIVmEiaNp6UzhSqIsFCT0rHx62aaqCaXo5PR8Fbb8vdT+fXyy/I62xDH1Rk=
Received: from BN9PR03CA0157.namprd03.prod.outlook.com (2603:10b6:408:f4::12)
 by BYAPR02MB4456.namprd02.prod.outlook.com (2603:10b6:a03:57::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 14:55:55 +0000
Received: from BN1NAM02FT028.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::cd) by BN9PR03CA0157.outlook.office365.com
 (2603:10b6:408:f4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25 via Frontend
 Transport; Fri, 8 Apr 2022 14:55:55 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT028.mail.protection.outlook.com (10.13.2.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.21 via Frontend Transport; Fri, 8 Apr 2022 14:55:55 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 8 Apr 2022 07:55:53 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 8 Apr 2022 07:55:53 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, ju.o@free.fr,
 peter@korsgaard.com, neal.frager@amd.com
Received: from [172.25.185.186] (port=52866 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1ncq1g-0000FZ-UR; Fri, 08 Apr 2022 07:55:53 -0700
To: <buildroot@buildroot.org>
Date: Fri, 8 Apr 2022 08:55:30 -0600
Message-ID: <20220408145531.1641356-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408145531.1641356-1-neal.frager@amd.com>
References: <20220408145531.1641356-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29f63c24-1995-4b82-c63f-08da196fe248
X-MS-TrafficTypeDiagnostic: BYAPR02MB4456:EE_
X-Microsoft-Antispam-PRVS: <BYAPR02MB4456982F3BBE561AEEC246E4F0E99@BYAPR02MB4456.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U7yKM7ru9fpxufmEZrLjpXAu5eQIA8sICBxdqrUc6JzzV92WuIEinFKoElVGVtRMloqRFCKbduEgr8hs1dNlyG1+L7WoWVUaD4cqu6l3kT3DmIJgkQykkF2LXmlmbWCmXvsbLHIS5Aalem2RD6TCui3/4enqc4DG5NfYqdrJp3NAV+aYSsKPyqhUa0AIVlcsvZ1UzJg8ToXxlhfY5Jl0REbf1IyRDP65wKAb3znKYyiYgjMAIp5atxBjjeKXHY8+LviUt9zOdG3ulaPwvcJ+kkZkJqidYUUIIQV8hp20aT1PprJZQMsmbp/eEFjKHFRYwH9NwzbfJYUNA8z9XHDumvPZUe8nJRirTgE0WCGzQrQo3KQxHt6TEu1XMW6MDSbzHtaFSgPfPsF/9S4xjc5X7CQxw1jwYvgriJujEJi/RVcijrS51kolMbmeYEKBFzl6bOEFFBL54ux7ZYmVxgpsw0sCJlw0VdWgRP15M/H1TEQu3QsGXElH97EvmvcRBoZIayw33Iq3QeVq/e3F7DJ9BkN1RIhW3cPKSdJsN7vVeJCF4cC8NCNRON1HI2p47TdxiDuljNlWqGY77FkPVGj2Mz8/BFYJJ/2o4j3kX+OwRIcR+8ZfFKWbaw5leyfw/8iRxpk84oMQbBb+BRutZDQ998TwJRL8ri8+DqqqrP1wC0Ia1FkSHvg7WOzKd3/UOFAnA7uSW01lCueZTokIJMRLhBesyVWp6syNnx+Dn5aK9hAQK/vehPVZPJxvo2v569AtO53PvYzUw8i4n1+3cDc+1Y9PIZJC/c8HDAULYDkjcpej6vQLIJASMB4oQWnSjRFzitH5VvPcGXfUjsa4b0RIBVXftIR3Z9Y2PZJ0im0aKf8=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(336012)(83380400001)(36756003)(6666004)(6916009)(54906003)(2906002)(356005)(2616005)(82310400005)(7636003)(40460700003)(26005)(508600001)(1076003)(70586007)(4326008)(8676002)(9786002)(70206006)(86362001)(44832011)(5660300002)(47076005)(316002)(8936002)(35950700001)(102446001)(41080700001);
 DIR:OUT; SFP:1022; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 14:55:55.3581 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f63c24-1995-4b82-c63f-08da196fe248
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT028.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4456
Subject: [Buildroot] [PATCH v1 3/4] configs/zynq_microzed_defconfig: bump to
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

This patch bumps configs/zynq_microzed_defconfig to Xilinx software release 2021.2
which includes the following updates:
  - U-Boot bumped to 2021.01
  - Linux bumped to 5.10
  - rootfs changed from CPIO to EXT4
  - extlinux.conf for distro boot support

This patch has been build tested only.
This patch is dependent on the configs/zynq_zc706_defconfig patch.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynq/microzed/uboot.fragment |  1 +
 configs/zynq_microzed_defconfig    | 22 ++++++++++++----------
 2 files changed, 13 insertions(+), 10 deletions(-)
 create mode 100644 board/zynq/microzed/uboot.fragment

diff --git a/board/zynq/microzed/uboot.fragment b/board/zynq/microzed/uboot.fragment
new file mode 100644
index 0000000000..bc4dffaffa
--- /dev/null
+++ b/board/zynq/microzed/uboot.fragment
@@ -0,0 +1 @@
+CONFIG_DEFAULT_DEVICE_TREE="zynq-microzed"
diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 1bb11fee7e..f1f98086a8 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -2,26 +2,28 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xilinx-v2017.3)/linux-xilinx-v2017.3.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.10_2021.2"
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
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2018.2"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_microzed"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2021.01_2021.2"
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
