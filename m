Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A66DC43219
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 10:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2CA3400C4;
	Thu, 24 Nov 2022 10:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2CA3400C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gkWDlb6L10lC; Thu, 24 Nov 2022 10:22:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8734A410C6;
	Thu, 24 Nov 2022 10:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8734A410C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DEF551BF3D6
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 10:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B836441BBE
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 10:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B836441BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GOrWY1awoLpa for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 10:22:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F38DC41BDC
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::61f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F38DC41BDC
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 10:22:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sa9PhQP0nfyLpaoRUr4nSka5UqXIYstZPlxPpwaSBOYQSQLc6Hu97WTOR25JqbpGZP5AF0wvegXoxbvh5UQO5qv3cIXbFgApkUEXpI1nH+oQxngVeErmtTbJi8z3bvGddunzJk6jXY/ahZWQePNfTXvN3cLKRkbXiLIbkr8EGAGgVehheIOZLZpW9B0Ck+wkVOu/wbvX+tNIITtRDlTnxGqA2HQcRrd4Qm94lxVDDZxCRBs0vRZ3Ovyqf6V992OFcg6SaSbnvfCX7E7WLIg7rcKfdZPf1FKU9CU7v79zq8u0LbfvBTVadxB6uVQEiK9rJT980TLzrgieBv029slPRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1UBhz8avI6FdmF9ThUHmKRzDrGA7n89v3JVGLfJhM8=;
 b=F1A0RVstNc8DyoY2t3WM4sctuqTx9CcJUSO8oTRuE4Y3J+88qjJ9VSeQZ6rDFk5ycdAMFPCExAUnSpQavpncsSXZQrMt6NkxcZpkOvVkTmvdEFFTlAgpsbbLHGPRGEtthIthZVmdVpRzUgQ267vHCu0g5T11jsYteRZSkH8azG2ByVc7pF9+ng+WEUXKUKG34BzFnGqbxu8wZNw5+yiGgSJ+rOm5394OkoNAJmKOwUFHn7v439huqhJ5bG+fd8+FqoixjqsED9rbnBlsiwIkAnSN2gjcyhAvI9YutoN7lQfqxl0opBlJf2etCR8JkQG8dSWldWoWGb+7AQ/35gd5dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DM6PR06CA0080.namprd06.prod.outlook.com (2603:10b6:5:336::13)
 by CH2PR12MB4151.namprd12.prod.outlook.com (2603:10b6:610:78::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 10:22:03 +0000
Received: from DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::a0) by DM6PR06CA0080.outlook.office365.com
 (2603:10b6:5:336::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19 via Frontend
 Transport; Thu, 24 Nov 2022 10:22:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT003.mail.protection.outlook.com (10.13.173.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.19 via Frontend Transport; Thu, 24 Nov 2022 10:22:01 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 24 Nov
 2022 04:21:59 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 24 Nov
 2022 04:21:55 -0600
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 24 Nov 2022 04:21:54 -0600
To: <buildroot@buildroot.org>
Date: Thu, 24 Nov 2022 03:21:44 -0700
Message-ID: <20221124102144.16833-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221124102144.16833-1-neal.frager@amd.com>
References: <20221124102144.16833-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT003:EE_|CH2PR12MB4151:EE_
X-MS-Office365-Filtering-Correlation-Id: 198b6c9e-3e68-4172-5477-08dace05b9cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7OlNejuidn/XhPbLBN2qGDZ4wVXPiq67wBckINRsKLbQTc8i6zZizKG2+LHWBW/V6g/rOB9SJg4p3jawoyo+LN0EPpg0F4TIvlxirLjsA3IThJrOr5MkzH8OVhFY62/gfG7yO/4+IyOaSq5oFbp6+N8kXO6odxlX71bw00MDXTwbZhFJFQO3wzRExP4iMTevKhvYxMuUihW4+vDFFt0LxyQU1NdgnuTOvO7T9T02Z3j/Sf6tJai7Qfm+TEqSLPPBGxuBfCoNuioIwTr6aXcISXZovH8AjRwoOYEa1PG95u9fQbgvvx/BDuvJQP2Mkyjwg/zT+rXIymmMb05sX+TRo9Hnw2+3pqQeCqRJ4dPfnzU8eDmcVjiTwePAfIRk0XHuCbp2C1t/JGGmjHuWzvO3+U4aKn38yvjos8jk/HNdeCUVxRH8fiCWAxDHk9jwo7aj5kxZBaTleq2KzwLb6Au4M6BCRoFR+l/0roXlsUVZFHuKXdpKt69R/nvoaSBc2caO5s3A10JdiS7nV4rbat8MxllTK12lwjQ20TsAGC7yTpLLS5czKpPRKQKn2mN1ouE4uy9g2NcQduKdHJAY+MkpA2sllW/68NfUKqutRMYv9xJxFUCWkVA+39jQl/afbbziYSG6+hbajG4PFZk6FD4mSp5qI69xvX4IS9mI6zrTYAtxHalKV6WvHUidPyeivB1W3KAfI6aD1Md3To84d6KTcfVy4A7yPIoWJeyfT5Z4rGT/1WA/uK1eR7fLuFMmkxELz3Y4WJ9cdl5wOD4ZREEehBwAc5XGgmOvRR3oIDhy8tAlB2+n/9Ob1REONL9nH6ml
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199015)(36840700001)(46966006)(40470700004)(36756003)(83380400001)(1076003)(2906002)(2616005)(41300700001)(336012)(5660300002)(44832011)(426003)(47076005)(8936002)(186003)(36860700001)(86362001)(40480700001)(40460700003)(82310400005)(82740400003)(356005)(26005)(54906003)(6916009)(966005)(316002)(6666004)(81166007)(4326008)(478600001)(70586007)(70206006)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 10:22:01.2965 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 198b6c9e-3e68-4172-5477-08dace05b9cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4151
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1UBhz8avI6FdmF9ThUHmKRzDrGA7n89v3JVGLfJhM8=;
 b=tPNBofSW8kJ227BlbmqfAlop59uP5tDEW37v8CugJl3/3xET/4iINA/NxKMNnmnloQaVyXQ8Lg7Klk2XzVmlEQJ2JDqCtLXzu60N8ZMbyxNcSpUa+g1dnjlKaKbH6qFWaE+hWnVY+/bOE/xbe0Umy+tgrimRWhV9tZwPSeHpxlg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=tPNBofSW
Subject: [Buildroot] [PATCH v6 2/2] configs/versal_vck190: new defconfig
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
Cc: terry.oneal@amd.com, luca.ceresoli@bootlin.com, kris.chaplin@amd.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support for Xilinx Versal VCK190 evaluation board.

VCK190 features can be found here:
https://www.xilinx.com/products/boards-and-kits/vck190.html

The VCK190 is based on the Xilinx Versal family:
https://www.xilinx.com/products/silicon-devices/acap/versal.html

The VC1902 included with the VCK190 evaluation board has Xilinx
AI Engine acclerators designed for accelerating machine learning
applications.  Also included is an upgrade from prior Zynq and
ZynqMP families to ARM Cortex-A72 cores.

While the Linux kernel for Versal is quite similar to ZynqMP,
the boot process has significantly changed.

Triple-redundant MicroBlaze cores are used to boot and setup
Versal devices.  For this reason, current buildroot support
will download pre-built firmware images and use Xilinx bootgen
to generate the boot.bin for the vck190.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - removed uboot.fragment and using BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS instead
  - squashed versal_vck190_defconfig and board files into single patch
V2->V3:
  - correct console name to ttyAMA0
  - added necessary extlinux.conf append flags
V3->V4:
  - switch to stripped u-boot.elf binary
  - clean up bootgen.bif file format
V4->V5:
  - using new BR2_TARGET_UBOOT_FORMAT_BIN_ELF config
V5->V6:
  - using new BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF config
---
 DEVELOPERS                      |  2 ++
 board/versal/genimage.cfg       | 30 ++++++++++++++++++
 board/versal/post-build.sh      | 16 ++++++++++
 board/versal/post-image.sh      | 35 +++++++++++++++++++++
 board/versal/readme.txt         | 54 +++++++++++++++++++++++++++++++++
 configs/versal_vck190_defconfig | 38 +++++++++++++++++++++++
 6 files changed, 175 insertions(+)
 create mode 100644 board/versal/genimage.cfg
 create mode 100755 board/versal/post-build.sh
 create mode 100755 board/versal/post-image.sh
 create mode 100644 board/versal/readme.txt
 create mode 100644 configs/versal_vck190_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 4689453d54..63d0758858 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2146,9 +2146,11 @@ F:	package/pkg-qmake.mk
 F:	package/qt5/qt5opcua/
 
 N:	Neal Frager <neal.frager@amd.com>
+F:	board/versal/
 F:	board/zynq/
 F:	board/zynqmp/
 F:	board/zynqmp/kria/
+F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
diff --git a/board/versal/genimage.cfg b/board/versal/genimage.cfg
new file mode 100644
index 0000000000..d994d3a2bf
--- /dev/null
+++ b/board/versal/genimage.cfg
@@ -0,0 +1,30 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"boot.bin",
+			"system.dtb",
+			"Image"
+		}
+		file extlinux/extlinux.conf {
+			image = extlinux.conf
+		}
+	}
+
+	size = 32M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/versal/post-build.sh b/board/versal/post-build.sh
new file mode 100755
index 0000000000..ff8f8a6071
--- /dev/null
+++ b/board/versal/post-build.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+# genimage will need to find the extlinux.conf
+# in the binaries directory
+
+BOARD_DIR="$(dirname $0)"
+CONSOLE=$2
+ROOT=$3
+
+mkdir -p "${BINARIES_DIR}"
+cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
+	label linux
+	  kernel /Image
+	  devicetree /system.dtb
+	  append console=${CONSOLE} clk_ignore_unused root=/dev/${ROOT} rw rootwait
+	__HEADER_EOF
diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
new file mode 100755
index 0000000000..890522c31d
--- /dev/null
+++ b/board/versal/post-image.sh
@@ -0,0 +1,35 @@
+#!/bin/sh
+
+# By default U-Boot loads DTB from a file named "system.dtb", so
+# let's use a symlink with that name that points to the *first*
+# devicetree listed in the config.
+
+FIRST_DT=$(sed -nr \
+               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/([-_/[:alnum:]\\.]*).*"$|\1|p' \
+               ${BR2_CONFIG})
+
+[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/system.dtb
+
+BOARD_DIR="$(dirname $0)"
+BOARD_NAME=$4
+
+mkdir -p "${BINARIES_DIR}"
+cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
+	the_ROM_image:
+	{
+	  image {
+	    { type=bootimage, file=${BINARIES_DIR}/${BOARD_NAME}_vpl_gen_fixed.pdi }
+	    { type=bootloader, file=${BINARIES_DIR}/${BOARD_NAME}_plm.elf }
+	    { core=psm, file=${BINARIES_DIR}/${BOARD_NAME}_psmfw.elf }
+	  }
+	  image {
+	    id = 0x1c000000, name=apu_subsystem 
+	    { type=raw, load=0x00001000, file=${BINARIES_DIR}/system.dtb }
+	    { core=a72-0, exception_level=el-3, trustzone, file=${BINARIES_DIR}/bl31.elf }
+	    { core=a72-0, exception_level=el-2, file=${BINARIES_DIR}/u-boot.elf }
+	  }
+	}
+	__HEADER_EOF
+
+${HOST_DIR}/bin/bootgen -arch versal -image ${BINARIES_DIR}/bootgen.bif -o ${BINARIES_DIR}/boot.bin -w on
+support/scripts/genimage.sh -c ${BOARD_DIR}/genimage.cfg
diff --git a/board/versal/readme.txt b/board/versal/readme.txt
new file mode 100644
index 0000000000..9f234be620
--- /dev/null
+++ b/board/versal/readme.txt
@@ -0,0 +1,54 @@
+******************************************
+Xilinx VCK190 board - Versal
+******************************************
+
+This document describes the Buildroot support for the VCK190
+board by Xilinx, based on Versal.  It has been tested with the 
+VCK190 production board.
+
+Evaluation board features can be found here with the link below.
+
+VCK190:
+https://www.xilinx.com/products/boards-and-kits/vck190.html
+
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make versal_vck190_defconfig
+
+Compile everything and build the rootfs image:
+
+    $ make
+
+Result of the build
+-------------------
+
+After building, you should get a tree like this:
+
+    output/images/
+    +-- boot.bin
+    +-- boot.vfat
+    +-- Image
+    +-- rootfs.ext2
+    +-- rootfs.ext4 -> rootfs.ext2
+    +-- sdcard.img
+    +-- system.dtb -> versal-vck190-rev1.1.dtb
+    `-- versal-vck190-rev1.1.dtb
+
+How to write the SD card
+========================
+
+WARNING! This will destroy all the card content. Use with care!
+
+The sdcard.img file is a complete bootable image ready to be written
+on the boot medium. To install it, simply copy the image to an SD
+card:
+
+    # dd if=output/images/sdcard.img of=/dev/sdX
+
+Where 'sdX' is the device node of the SD.
+
+Eject the SD card, insert it in the board, and power it up.
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
new file mode 100644
index 0000000000..d87df221c6
--- /dev/null
+++ b/configs/versal_vck190_defconfig
@@ -0,0 +1,38 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2 vck190"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx_versal"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.2)/xlnx_rebase_v2.6_2022.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
+BR2_PACKAGE_VERSAL_FIRMWARE=y
+BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="v2022.2"
+BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_BOOTGEN=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
