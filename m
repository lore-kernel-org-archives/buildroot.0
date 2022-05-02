Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E393C433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 08:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05A1882D96;
	Mon,  2 May 2022 08:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fq89r9FzcaKz; Mon,  2 May 2022 08:46:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFA7682C3C;
	Mon,  2 May 2022 08:46:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A83891BF3CE
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 08:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A483182C3C
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 08:46:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jPh_hyQsK2lW for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 08:46:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::628])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96C0982C1E
 for <buildroot@buildroot.org>; Mon,  2 May 2022 08:46:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3oMw4SWvpzETroidO8QyubMNEITOBK13mVE3HvpgTTilk+licxbvO+XBkMvm5T7hW8pZ5pp2v8TaJ0wPMJfmEZLhbJm3OvLAl4a7EEnIs0VYfVf2j2guSUE3Dx3KOIu7ph5K5NC16+W1gr6QkFzU06K6NH16dotAg/IuGEs/oakSnd7IoFp6U5aRYWkILr3DVzHn8hmiSq6vuD1tm7ooMQWtsPJn23oVZ9TsIfxuCgMN+ls4+v7Fc7H4yQnlSJ5dcE8h+jSgRf2MlACMeh5I4ciOSiejEqJiaUnR0JfhZVn6dWZ/8SEc2GhZOT8oFIh7YSVKrtz5bAOcPRBKBtKBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgELi+dpXjXGUD0iIyGr65ImJopdbcixSENTMpby85g=;
 b=I/mh7z2l3jDrkhbioicqPynx4Pv+RGizgUpK4kQXUjN2ZpJ7EVj8PVs/DYNWDEAYwNuu/J/0VQziID4Yv1jnfZEI0UOznVvjN/JjtIZ36xNaIF7/21Wywsbk7cSkiBxkcpNqO5VlapxVbHvN69ap3p9Jb+RzeIxhMV2DRQWkYEEP/vqianG/kxQwaDp8PLtih1vv4o7ojGeRzLaE2mmNYZrDl8njjr75r14TdeLy/cuNypwkwCyh4Ckl7Pnv7e0MbuDfV3TSb8Pe94ak5QAKDXzrY3qsLkghYcOu9prx1OdYgZxB0pYTzIUia4yjKPyygW8R+7yaqrcjbzIhEsZXaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgELi+dpXjXGUD0iIyGr65ImJopdbcixSENTMpby85g=;
 b=lDMlIWOgQhGHGpP/3ZpcD1Nse7u9o/MpNLMzdRCfkQ9xD2wxWcPs0Hjg8kBaK0aL53L4zXBEROo/pH1GoZkKAig5BSZGA8BkpivATtxIurGbPd2zvf4/5rk4Uhmd17GcmyBVSkyYNGf4CG846CaFYzQRhMx9X2fTVd/9x6uzmRM=
Received: from BN0PR04CA0195.namprd04.prod.outlook.com (2603:10b6:408:e9::20)
 by BY5PR02MB6451.namprd02.prod.outlook.com (2603:10b6:a03:1f7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Mon, 2 May
 2022 08:46:06 +0000
Received: from BN1NAM02FT003.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::74) by BN0PR04CA0195.outlook.office365.com
 (2603:10b6:408:e9::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Mon, 2 May 2022 08:46:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT003.mail.protection.outlook.com (10.13.2.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Mon, 2 May 2022 08:46:05 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 2 May 2022 01:46:03 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 2 May 2022 01:46:03 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, ju.o@free.fr,
 arnout@mind.be, peter@korsgaard.com, neal.frager@amd.com
Received: from [172.25.185.186] (port=40742 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nlRgx-0001bv-Cu; Mon, 02 May 2022 01:46:03 -0700
To: <buildroot@buildroot.org>
Date: Mon, 2 May 2022 02:45:02 -0600
Message-ID: <20220502084506.4054715-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 174f5037-8d69-4a4e-9646-08da2c183224
X-MS-TrafficTypeDiagnostic: BY5PR02MB6451:EE_
X-Microsoft-Antispam-PRVS: <BY5PR02MB6451156B45D8CF441B0F617CF0C19@BY5PR02MB6451.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SPTn7ekOMfDoU4DDgNQqc2h7BE7T9l5OFsrVccHF8xcszqR71IzdBYEUlZSwklrrpnIgzl2G58nhJcP6O4aY9lSeTi7qbKf208Kui3hB/SlqmkItVnlqHe0dnculH+leiSAec5N/9K+bzNEsciKvDFAwKLbThGy2dWnJxlIEpG/37NZFEHc/1vzZEwMTgNXmg1ahB9hCwjh7+p+SzSi2lpmt+S5JEykNpbQz61J3dAdpJ3wQV071VzOUECZm5akUOZoQJ5nze7GluiIgCSzvxAByygrdN8JZsO0Z2IKN+SpI2YqhRkTmas8SNmU/mK3SInCKUxmMysP41Iryg6EBNAPBpT4TcV65eZcJHjHqf7e6sqm3TopcHsRiPfrhjs+muEGJ4BHTym1l2lOaHv8k1X6qitHbYg3Kr1+u07NyNish3L8p2ZFHR5OHZjBXrDIVzVDP10oLdRMljOwbRRoppzGH/AFYUOfmLoD6FgV3EAC3kfxnkY78tpgovXHGdX5JEkJKLnL5M/bpcZaKFpEh7YkaGOM4hP+8C7RRGXK0ulVJIjknrIXpdSNyKOx2qrse2+zii6az7WrbTdBt4C7SAzKaSvcGr/7Sue15i1gePqTAGz5GkW0+88HgHunoEByKn+hrJWegi8/l66TKxqCmdMSKT/3HmjNbehozsE+V+GO2lLqcFNrOH4qkozh7YU0+4w3Vy91XGHWd0ol9rFvxgDIpGp6lIuDT3xBnLS9z0xpK8Y/lqDfU96t0sWmT3vHCI8NMOhsE/xbpXx1N5qqgjXN5obwcAkK9V3o82Z7xtbVr7UnHnCFC/sZhEJnSGUMz
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(7636003)(316002)(26005)(1076003)(6916009)(54906003)(356005)(2906002)(47076005)(35950700001)(86362001)(336012)(2616005)(83380400001)(40460700003)(36756003)(508600001)(82310400005)(5660300002)(44832011)(8676002)(8936002)(70586007)(4326008)(9786002)(70206006)(102446001)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 08:46:05.7036 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 174f5037-8d69-4a4e-9646-08da2c183224
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT003.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6451
Subject: [Buildroot] [PATCH v1 1/4] configs/zynq_zc706_defconfig: bump to
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

This patch bumps configs/zynq_zc706_defconfig to Xilinx software release 2022.1
which includes the following updates:
  - U-Boot bumped to 2022.01
  - Linux bumped to 5.15.19
  - rootfs changed from CPIO to EXT4
  - extlinux.conf for distro boot support
  - U-Boot migrated from git clone to tarball for faster builds

This patch has been build and run tested on a ZC706 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynq/extlinux.conf        |  4 ++++
 board/zynq/genimage.cfg         | 11 ++++++++---
 board/zynq/post-build.sh        |  8 ++++++++
 board/zynq/post-image.sh        |  6 ++++--
 board/zynq/zc706/uboot.fragment |  1 +
 configs/zynq_zc706_defconfig    | 20 ++++++++++----------
 6 files changed, 35 insertions(+), 15 deletions(-)
 create mode 100644 board/zynq/extlinux.conf
 create mode 100755 board/zynq/post-build.sh
 create mode 100644 board/zynq/zc706/uboot.fragment

diff --git a/board/zynq/extlinux.conf b/board/zynq/extlinux.conf
new file mode 100644
index 0000000000..3c2ab4f46a
--- /dev/null
+++ b/board/zynq/extlinux.conf
@@ -0,0 +1,4 @@
+label linux
+  kernel /uImage
+  devicetree /system.dtb
+  append console=ttyPS0,115200 root=/dev/mmcblk0p2 rw rootwait
diff --git a/board/zynq/genimage.cfg b/board/zynq/genimage.cfg
index 67baca795e..78eb9275dd 100644
--- a/board/zynq/genimage.cfg
+++ b/board/zynq/genimage.cfg
@@ -3,12 +3,12 @@ image boot.vfat {
 		files = {
 			"boot.bin",
 			"u-boot.img",
-			"devicetree.dtb",
+			"system.dtb",
 			"uImage"
 		}
 
-		file uramdisk.image.gz {
-			image = "rootfs.cpio.uboot"
+		file extlinux/extlinux.conf {
+			image = extlinux.conf
 		}
 	}
 
@@ -24,4 +24,9 @@ image sdcard.img {
 		bootable = "true"
 		image = "boot.vfat"
 	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
 }
diff --git a/board/zynq/post-build.sh b/board/zynq/post-build.sh
new file mode 100755
index 0000000000..9fd8bbf2c8
--- /dev/null
+++ b/board/zynq/post-build.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+# genimage will need to find the extlinux.conf
+# in the binaries directory
+
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux.conf
diff --git a/board/zynq/post-image.sh b/board/zynq/post-image.sh
index 0cf92e0aa9..ac74286cf6 100755
--- a/board/zynq/post-image.sh
+++ b/board/zynq/post-image.sh
@@ -8,6 +8,8 @@ FIRST_DT=$(sed -n \
            's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9\-]*\).*"$/\1/p' \
            ${BR2_CONFIG})
 
-[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/devicetree.dtb
+[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/system.dtb
 
-support/scripts/genimage.sh -c board/zynq/genimage.cfg
+BOARD_DIR="$(dirname $0)"
+
+support/scripts/genimage.sh -c $BOARD_DIR/genimage.cfg
diff --git a/board/zynq/zc706/uboot.fragment b/board/zynq/zc706/uboot.fragment
new file mode 100644
index 0000000000..ad5efa6204
--- /dev/null
+++ b/board/zynq/zc706/uboot.fragment
@@ -0,0 +1 @@
+CONFIG_DEFAULT_DEVICE_TREE="zynq-zc706"
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index e8019177d2..82c47be7a5 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
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
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zc706"
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
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zc706"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/zc706/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
