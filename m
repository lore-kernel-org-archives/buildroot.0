Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363C9C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 14:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D29D88219A;
	Fri, 25 Nov 2022 14:08:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D29D88219A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ivg2JUK86TXH; Fri, 25 Nov 2022 14:08:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F08182181;
	Fri, 25 Nov 2022 14:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F08182181
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4AB71BF30A
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 14:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DA7E40017
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 14:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DA7E40017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HwHYCbS7uOvk for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 14:08:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 162614000B
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 162614000B
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 14:08:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOY7UOdkc+R3cBSG3Emso3HHr9h7Rm9Rz7NRjCEr+YGLkEmwOB7DiwyqBOtKJD4TnCeynbXfGvf7ToSlTw5QdGAgMeJmrFyb88YxjYMXRHh4vCpmAwbfnBRhzpe7WjdU8MMwWpR8y6b/1ia99KRWRQ5fqgxSa+4PYa9jsJcuDCBInJvrz9+/V2+x04xdJgMX+NldLP/IOTaJpTL7qeV3Xs22K8YT7bIvEnNSO9uPMlaro8sk4P6TtuLeF2ubFJDa95XGTQo07TAWL3jG+So2J1NSKzeuyUDPN/rqWokUTg1BD3pLmcWcLqOFNbtZFhCDKbWdttmcVi3nRJ3JDvaMlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqBSM0D4VrV3BZyHk26QQnLnRxDZjP2MkWwwVfDFEcc=;
 b=fEkyD1jtLN+hS4vVNu5Ku0PJ3JZQU/y1L/thugtHfg5Ri60WhTzsRLw++UlKYQQOmnWZs5QhSvLl7gs9BmOygg/EAmO1enkTo1fv6tQ6zwADSxoubohFcZ+7XIoRRDAc8DO7bSwyjUSTFWaVaMpZkOMHS6e4OrOmShTEcnsZV8uQ8ExbYmyWh4QxGzBQ/km68meGwS1Qofm5ETdXbA3fH72q6ZwQVyfHEGat68+AbylRqcP0wkEIs/zFvyhonbr0af5mSYfiITkcpVMLuYUj4aay8E3Qa5SxDdQ5Z2cxxOQq72kAA1XsfQB4v50kLe96xj8yx+Ap2x7nrMq8RNbE0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR03CA0273.namprd03.prod.outlook.com (2603:10b6:5:3ad::8) by
 DM6PR12MB5520.namprd12.prod.outlook.com (2603:10b6:5:208::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.20; Fri, 25 Nov 2022 14:08:06 +0000
Received: from DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::73) by DS7PR03CA0273.outlook.office365.com
 (2603:10b6:5:3ad::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20 via Frontend
 Transport; Fri, 25 Nov 2022 14:08:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT062.mail.protection.outlook.com (10.13.173.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.20 via Frontend Transport; Fri, 25 Nov 2022 14:08:05 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 25 Nov
 2022 08:08:05 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 25 Nov
 2022 06:08:05 -0800
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 25 Nov 2022 08:08:04 -0600
To: <buildroot@buildroot.org>
Date: Fri, 25 Nov 2022 07:08:00 -0700
Message-ID: <20221125140800.38511-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221125140800.38511-1-neal.frager@amd.com>
References: <20221125140800.38511-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT062:EE_|DM6PR12MB5520:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a82fe8b-85c2-420c-d074-08daceee7956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rWjVNe3/0XGfgoSa7vKtrjrAJmhXH+sWbmj6ZJJwV7eZmzTdR0La5K3JkQacI0nOJC1lJ94PjM6zN4Tw7oIjWYkBDB/OBszyAOP+xdroVRMQ67XrmcVl4nMyFkpTSujTWzC81Y6d1SUSxDrlk7LebdoKeqQzFBr1Y8yoERcdZdROqbTFKxZbtX08XCxCrA9zcYCTtSjXe7NY60Ft9ti5+IGTRbfLc97zofOPyksZpgKf7sh5bmbSbBDmcQXSAQFMlENcoCq/WbdUQVZOBwhkNFxV4UybjuOy8T/HMzBwdqf3u0Bh5CQ/wYNTjBPZmtxOjM7MiJyzfL/4FWTRlnExDxWiFBUWaL5VsE8aVr8qSnTB4UtWcF4l9d8forFFlWdJsOwvy02xGHMBZO4m5pe5S8LqWxGsf9awc+wbclsNpUesjbvZYWUn4h22rO9mSaQ2JgbiSBeruwQGziSaym/UFbKMDkFyt7TuFCCXLQA2Fa4N3lrc0NRUhGP3BfBEC2hXT3JqdcevhBVTUfOmdh8piWODVXuTDZ5FcImlmD5hHKdBDhhiVRzv6TAXUcgWXSFHTIkZJ2WXWabEjUmeOHIZV1vm3vPOSM5y59zZvsr+m/FEQ7fbTwmLfk1MtSIltODEyez/ryoeLFmABZen1EDxG2g9Oywmbz6hN9L39UPTJMINqfC6v287Fiz67UtZhLfb4E6j1l4WKuiI664LZ5NfbBc0q8uiSWwJqorFBzXlB2g0CbcmvcBOiUnfFj1SKx9wvEG8SxeJ7wF5TbnlSUcvSGezlwV7ib+6tpTHYXOnXxU/LYrFk8W78xtXrAdrqDp0
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(36840700001)(40470700004)(46966006)(6666004)(82310400005)(36860700001)(82740400003)(36756003)(2906002)(478600001)(966005)(70586007)(70206006)(5660300002)(41300700001)(8936002)(8676002)(4326008)(40460700003)(356005)(54906003)(40480700001)(6916009)(81166007)(316002)(44832011)(83380400001)(2616005)(86362001)(47076005)(426003)(186003)(336012)(1076003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 14:08:05.8836 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a82fe8b-85c2-420c-d074-08daceee7956
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5520
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqBSM0D4VrV3BZyHk26QQnLnRxDZjP2MkWwwVfDFEcc=;
 b=LBI70DGK0zBNSW/HnR73+qcycumf53ixeWRSO0Mr+cA76cQcV7WB/5JQJhOPGQzSoOHjAQbAualTSks19lrVNRQJAKXztdNvF99xCBwcuFTOygLM4mLwtu2xUmZnIVfQoVLkj6y1idzR8nyQIoh8A3V62QtYU3TB61stap8RIlo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=LBI70DGK
Subject: [Buildroot] [PATCH v7 2/2] configs/versal_vck190: new defconfig
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
V6->V7:
  - no changes
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
index c51bd65f09..205af186b5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2147,9 +2147,11 @@ F:	package/pkg-qmake.mk
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
