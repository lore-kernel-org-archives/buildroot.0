Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF27C38A2D
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 14:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B69B24088F;
	Mon, 24 Oct 2022 14:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B69B24088F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NDxCQFLNmoFP; Mon, 24 Oct 2022 14:22:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E72B340070;
	Mon, 24 Oct 2022 14:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E72B340070
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BFE61BF2C8
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 14:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB2EF60B55
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 14:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB2EF60B55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4egDfUWWdqbt for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 14:22:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C485F60AF6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C485F60AF6
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 14:22:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJuOhwfCypIp7x4OWWbXORE65PseP4dP9K4N8p6uJIT58f8480nPXDbgN8pe1NKZYyNrN6NQi81OkKOvSpofXCe+WDOzDfAk9cYWZUVdsfwukt085wbgZDGC14LaaLNaeSIq+eoSYrcOONvI+2GpzqPuI1DmfuFT+TyRtzhJ2m849x+8kNUAcEQg043/g4avT2PHkCwxnU+Bqlh/l3knFvFeqsXI6UD/6w+5/EDILnfsN6JrUX6lTbnBzsEMG0aYriHGQzoH9/ow0i7PMc2A4cC1zO98vCUDmy2jI4jiNfAuNE2jG4VvOd4ZOLrRp/EmcVJgI5qto4XxI8QEte6jrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ms84bLHsKshyGkXUseFlB/x1M8va4EJ279/VUGsS6ZM=;
 b=e5pFCDqIbWnzWUIEs7UxR8i74L+9u55jXQOB+7eaw9ZXorH4xw70Tq9yqcVZKQQaqBC1Cp5yJwgok3k4FAykAcNxoGuz/XTYfnnjB3g3K3GLlbMpJg4vpGAy37ACdl0a7US1q236+GtSGokcG1ASt540oNSm0eX+19/wyuUU9XrEW0o83GZnjkQRVcEivoHYOma0frjHce9Ki+om7OdUqhbEVxy58FB6LEXjqST+Q1MUmrmA1a8ZZd1IcsMWh2RcHf6SVfTFbqH6kjbGHLvG9liIBeyy93oC7T3zns/WuCImEElog52wE5z6+4s4vL+hWK7HMczPLxQV0hwM9CA36Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR03CA0055.namprd03.prod.outlook.com (2603:10b6:303:8e::30)
 by DM8PR12MB5432.namprd12.prod.outlook.com (2603:10b6:8:32::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 14:22:24 +0000
Received: from CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::16) by MW4PR03CA0055.outlook.office365.com
 (2603:10b6:303:8e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26 via Frontend
 Transport; Mon, 24 Oct 2022 14:22:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT044.mail.protection.outlook.com (10.13.175.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 14:22:24 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 09:22:23 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 07:22:23 -0700
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 24 Oct 2022 09:22:22 -0500
To: <buildroot@buildroot.org>
Date: Mon, 24 Oct 2022 08:22:15 -0600
Message-ID: <20221024142216.31273-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221024142216.31273-1-neal.frager@amd.com>
References: <20221024142216.31273-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT044:EE_|DM8PR12MB5432:EE_
X-MS-Office365-Filtering-Correlation-Id: c2cd4cc4-e555-4403-a9da-08dab5cb2bc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hLWuHb3qyBrSfhcKD7MUevY+R6j0RS4SzXAkyKWdLjfLSDlnHdzUl3j1ypR2JQBAtoS5Ve7GJ7B8nnSf7qnD7swF0VK7C1Si2qdymFWgNIlFp3PcD2uhLQnF+ssOgJl4kD8ZhPPgjGIc2UoIKstE9hDufKdg4SxfJEMtcbqzi/pGko6zRu0kVYIJEBQE+yoQtSNdoUu/7abcKMAXQF/SZ3qFR9ck/SgvOYPwNYFGjXp9o55PIZIe7F/iXrc6fAXlbGzaUx4R4j1bOYqfTfLdxKLbsbLtbWHQyyufZGneZ2APGiiyBMws5obNt4IcgY1PISKR9+qXToz116PyKGub4jdl13FZ7Vw0FpQ9M448I/QDXaiaRIgzbZ3RjkDpCOtqz02CB1KFxIdiWZNES1R+tkZhUHHgZXmifkslU2sb4/d8Z7fLhWSWKvwarrI3BU+P4eALUaFGXDmo0JK9XM0PbeXxyHmrZO26S18qDIMOwqHz8AZabgfhO0iRKgHeKfrCy9VVxDu4/+fyji8y0bKZwFKFyRNQdZBWr5bBYcMISpzYnYp5QIvQyAyWoDHu8xd66UD2xsdVUMd4sSAfNvkfKo6lt/w5/yR1Dxth8PR9gNoljR/3YaUtofAMCzwYWpCWIEK9/ZlCJMRn0336vrpmvVxcHKpbJ8gSAFNmqFssYk2CKewasuQZTmbXO82WjNjRy/KRcb5rKb12YiWTXf2SuoA1X+sLekT/mqzT/D5upeRqpFpB76kcU8w3pcKZ6z5gJk/8MA0UrFfMcmI25gnnE6XG7XrnKjAY1/n1WbjZdAHS81xhpyBTLMyZhW7+9C7s4frnMar++IiuTuYAOV0APQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(41300700001)(36860700001)(6666004)(44832011)(4326008)(81166007)(40480700001)(8936002)(356005)(86362001)(8676002)(54906003)(6916009)(83380400001)(26005)(2906002)(426003)(82310400005)(47076005)(5660300002)(478600001)(186003)(1076003)(336012)(40460700003)(36756003)(316002)(70206006)(70586007)(82740400003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 14:22:24.1859 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2cd4cc4-e555-4403-a9da-08dab5cb2bc3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5432
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ms84bLHsKshyGkXUseFlB/x1M8va4EJ279/VUGsS6ZM=;
 b=RccXTkXBwc5zcJD9JE97iEYcMOkFadJ3K3lTvD7OnqMhvXeqKKGMKv8P5s56RCC3+MO8qdX8fF3JKWwgwm1MVA/ymK8tStHupgIaKF5aKWml5/19Lru3X+4zZPC4Gi7QuIVRIjgULMI6nbgR7Y/DdfI/Uh02CcOX2qxgaM7FGCM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=RccXTkXB
Subject: [Buildroot] [PATCH v1 2/3] add board/versal
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

This patch adds board support for generating images for versal boards.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS                         |  1 +
 board/versal/genimage.cfg          | 30 +++++++++++++++++
 board/versal/post-build.sh         | 16 +++++++++
 board/versal/post-image.sh         | 35 +++++++++++++++++++
 board/versal/readme.txt            | 54 ++++++++++++++++++++++++++++++
 board/versal/vck190/uboot.fragment |  1 +
 6 files changed, 137 insertions(+)
 create mode 100644 board/versal/genimage.cfg
 create mode 100755 board/versal/post-build.sh
 create mode 100755 board/versal/post-image.sh
 create mode 100644 board/versal/readme.txt
 create mode 100644 board/versal/vck190/uboot.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index ed696f4cd0..08095c9702 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2168,6 +2168,7 @@ F:	package/pkg-qmake.mk
 F:	package/qt5/qt5opcua/
 
 N:	Neal Frager <neal.frager@amd.com>
+F:	board/versal/
 F:	board/zynq/
 F:	board/zynqmp/
 F:	board/zynqmp/kria/
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
index 0000000000..0713bd1b05
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
+	  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
+	__HEADER_EOF
diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
new file mode 100755
index 0000000000..aad6813052
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
+	image {
+		{ type=bootimage, file=${BINARIES_DIR}/${BOARD_NAME}_vpl_gen_fixed.pdi }
+		{ type=bootloader, file=${BINARIES_DIR}/${BOARD_NAME}_plm.elf }
+		{ core=psm, file=${BINARIES_DIR}/${BOARD_NAME}_psmfw.elf }
+	}
+	image {
+		id = 0x1c000000, name=apu_subsystem 
+		{ type=raw, load=0x00001000, file=${BINARIES_DIR}/system.dtb }
+		{ core=a72-0, exception_level=el-3, trustzone, file=${BINARIES_DIR}/bl31.elf }
+		{ core=a72-0, exception_level=el-2, file=${BINARIES_DIR}/u-boot }
+	}
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
diff --git a/board/versal/vck190/uboot.fragment b/board/versal/vck190/uboot.fragment
new file mode 100644
index 0000000000..961c4239bd
--- /dev/null
+++ b/board/versal/vck190/uboot.fragment
@@ -0,0 +1 @@
+CONFIG_DEFAULT_DEVICE_TREE="versal-vck190-rev1.1"
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
