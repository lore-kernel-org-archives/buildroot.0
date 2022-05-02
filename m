Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBF8C433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 08:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27A8D40192;
	Mon,  2 May 2022 08:46:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j3cb0PZCXnLJ; Mon,  2 May 2022 08:46:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CFF7403FB;
	Mon,  2 May 2022 08:46:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 045A11BF3CE
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 08:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3EEE40192
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 08:46:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n0WBzkO1Swit for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 08:46:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::60b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 204C04016A
 for <buildroot@buildroot.org>; Mon,  2 May 2022 08:46:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQm+PgSuBiNN/tI46Z/C6IuK2bUkEM96OcrUUnk6mbvpWh51RWBH9dGxnbJBDT1BtlHqJE6V0Byeh6nQlUNT2KAWlDkiHiL1YqdvDeU2iQohRU5gLJsLRGZPyNzR+b45T5hGztKW5E1QieiteB+TAJWnUj+9PtV3KMyMfeSq9c1xCUpVnpnChodCoZJFnA9Wv8GNCV/aflL+DLaVjuDYH8Wydk+rrjdDrN6/gQ5/RVh1qJxVQMofymKDZBCu3C5rgOw/PEnomJa51xXhJAtIPzXdLMaakGm4wsHjq4Mqed5ieInnG3mNSO40Api3sz85LYB/nYZDGEkrIpKcL2pDrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kx9JjUVf1Vu+1A5kLawPKT6P0nOv/UzLAg53sJf38v8=;
 b=Q8c+YlXIf9EVQ/4OTIPr7ul1qHaea39ESRJiBnknt2LktjdchukSQpkoyI87jwMooDVjGjElJY7hzhcpnAJLSqA8a8S0qBbIpIeORJM/PJLJfuz07lNq3P9tGPWLLOcvDJ8d/kIs52lpq+4CHgpCxXv9yDvOF43ZkI2E8tIjzPp0DbBslsWSyPhoMZ+xkVVjh2CjzEFlLwxJrg/S52J8eM31PP4kzqmUKVXwAd7Y6azZRpPYzvvI/nOBrn/WHiL3HiGb2Qz2MGWMilMCAolnB9G4ja8nLq6W/RNdWaxKaNjTSEvPvndhePCjylOYMwP9DZMjZ7W3MKS/854rOgNPxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kx9JjUVf1Vu+1A5kLawPKT6P0nOv/UzLAg53sJf38v8=;
 b=WyaIWU0RCqAixQSUBPyfJr54XDVMfsvhUbcXAXRMuHEfNQq9IUKlNvMCe7WBaXxCvbhh/me5hZ+Yv1vmc9Nxm6m+7bBFKGt2BsmwfkF8MK3MqtM34407qAm0bwUMkkAWHA638JIzhtK1hjOHf/rjfP1g5wvlvDhKbAZY9uxzrsA=
Received: from BN0PR04CA0189.namprd04.prod.outlook.com (2603:10b6:408:e9::14)
 by MN2PR02MB6304.namprd02.prod.outlook.com (2603:10b6:208:183::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Mon, 2 May
 2022 08:46:08 +0000
Received: from BN1NAM02FT003.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::9a) by BN0PR04CA0189.outlook.office365.com
 (2603:10b6:408:e9::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Mon, 2 May 2022 08:46:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT003.mail.protection.outlook.com (10.13.2.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Mon, 2 May 2022 08:46:08 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 2 May 2022 01:46:07 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 2 May 2022 01:46:07 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, ju.o@free.fr,
 arnout@mind.be, peter@korsgaard.com, neal.frager@amd.com
Received: from [172.25.185.186] (port=40742 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nlRh1-0001bv-CF; Mon, 02 May 2022 01:46:07 -0700
To: <buildroot@buildroot.org>
Date: Mon, 2 May 2022 02:45:03 -0600
Message-ID: <20220502084506.4054715-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502084506.4054715-1-neal.frager@amd.com>
References: <20220502084506.4054715-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e631b26-4ac8-4810-6a24-08da2c1833a4
X-MS-TrafficTypeDiagnostic: MN2PR02MB6304:EE_
X-Microsoft-Antispam-PRVS: <MN2PR02MB6304E6C1584C17726507FF4FF0C19@MN2PR02MB6304.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XWSFvcDzpwQ+uSD0hZLjGZyQN8Qo5yY0jMxa4QrPzDUXe7e1OI0TKf0jx0FCVcdFuOvZL33gGX0q4OUV2cdpDwo30WY0KHv8cu7EhUlc/wS9hvIq3VUiKZ6DLJ61Yl3S0MI5URAzKGAjgQk00hPkD4Fa1Tx8lUlz6Geo7RnWeI6R/fDmON6/tgAFkm73ddyJHY29HaK9d23hjr6sj6fll7/DuF2msQul74Wip3xRjrKtvJ2qB8UGq29XOGmut2uxcPnJsy+WMrNLlJU0Xvfkb+6VWNe2aexGcgBUNWLwP+rNrXSaHyKoA5h7ndyeM28TuJPN6frh1B9UDALIa6gJ+YkRiPgpRlqDWdbHyq/zss8bK5ClTDYM5hBqXTF3GeoCFe0X7Pjdex/8Si4XXo2UGPFqnbeeiqe/bE9DG0zbZCqKiZx3grGBqEhtOSWPiwHEkiQOGDvSV+LbvYh5Pu4erxU5g8obgTKDo+23E1Qq8I5K77xx3FOqI301m5MFqFqAFiinzq9dO7o4KQGevO3F42c3dNxRFHFdVvkOFhpUAEFO87eayOlmbIBlt0YAywyWe+XjL8qhD4AaSSX/zxramJ1UbWgbo0Sy5VtEBVYepvctN/fc7eclSasa5wvh+1imTr5Jp5mhsAsnvkFZAjGI+eD+HMpVYJ/ojKyKkv4wuosr31g6rb/2p/oJV6GkKGI7Zz6Pb3ozPMp0OJSkQG5z0ldZP4a/qKZxUaAf0TcjH9JefbtGyN88TyyLzROEuApUf5JBoWwogY67/GwsiDU9gW9Ys2GSI19t9tKbiXuaRsmVgltclHA5NS8VhqUj1pE4
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(5660300002)(82310400005)(70206006)(4326008)(9786002)(70586007)(508600001)(8676002)(8936002)(44832011)(35950700001)(6666004)(356005)(2906002)(1076003)(6916009)(54906003)(316002)(7636003)(26005)(2616005)(83380400001)(40460700003)(36756003)(336012)(86362001)(47076005)(102446001)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 08:46:08.2190 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e631b26-4ac8-4810-6a24-08da2c1833a4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT003.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6304
Subject: [Buildroot] [PATCH v1 2/4] configs/zynq_zed_defconfig: bump to
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

This patch bumps configs/zynq_zed_defconfig to Xilinx software release 2022.1
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
 board/zynq/zed/uboot.fragment |  1 +
 configs/zynq_zed_defconfig    | 24 ++++++++++++------------
 2 files changed, 13 insertions(+), 12 deletions(-)
 create mode 100644 board/zynq/zed/uboot.fragment

diff --git a/board/zynq/zed/uboot.fragment b/board/zynq/zed/uboot.fragment
new file mode 100644
index 0000000000..d58fcd5439
--- /dev/null
+++ b/board/zynq/zed/uboot.fragment
@@ -0,0 +1 @@
+CONFIG_DEFAULT_DEVICE_TREE="zynq-zed"
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index a215695b54..34e1b67184 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -2,26 +2,26 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
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
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2018.2"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zed"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
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
