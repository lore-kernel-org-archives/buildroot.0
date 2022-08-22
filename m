Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B91EC28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 09:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D10A54098B;
	Mon, 22 Aug 2022 09:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D10A54098B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VM5QSmrIpJ08; Mon, 22 Aug 2022 09:50:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA3904048D;
	Mon, 22 Aug 2022 09:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA3904048D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D0EA01BF306
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB74281761
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB74281761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3BtTL8v_JApC for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 09:50:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 894968175C
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 894968175C
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 09:50:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbmbizISwyedtIaKCpEGiSVeWgppL/1XohQ1uvY+DE+QFZXCAcBF/tajAnME9dbRVFOO6ORLWNKIGZoe8kDdQblNUKZ15wEwU9YR7OiLMtAwYrTxDu0bJRTUlMV8vgmh2haNnAIwBmROm8OpLEXqogIcEEvObko73GsjoCGaWPkLwLy7sUl1GSdmkcWiZFN+i/VtNvrcbmBKT8qBj5RyGCCDnKQfDAFIuC50g2tpV7yS6tsDoLPltqI+5caV8Q+PopOKqcuC3gd36y0h3do1D/18H67qqIzfnFpM/qGjDVkutzbEYlnu8BjsorDndoIIVApeMTKy1TI4F81kPUIJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4doHH9jaKajDI1sljd3hNnWXk2PfrSbdEGl05UwRrvA=;
 b=FMyvBHQl2pgtKQxQOqLyV//zMRyDX2GVRvw+UR9Axn5bgKhYc53ImjyFtRExEwmvq5xBxjJUfMhyT/6uxzuy+BecGFlOR8W4ViwrZqPlMlatGJa3Nef55x6qI1iOLA2/Vj8FkU5G1CeS4PNTfEdtCC/bVwswP3XjlNnq9vyhz0UbVn6kQNvsENwfI9iZY5omlhyzs5JvVKEUS4DisF3Q7v+9UIJHT0bJ3QxqMfCLFwFRgF3jkuHBunQcit+6yadPHz1/ahxQASZIsLfQIctxMiWoxb8n1DVApoD00kfTEgzel8CwaNVuZMHX4KdFLrh6Z0atbfMgE1YA0lnU1w7mIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
Received: from SA0PR11CA0206.namprd11.prod.outlook.com (2603:10b6:806:1bc::31)
 by CO1PR02MB8618.namprd02.prod.outlook.com (2603:10b6:303:15d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 09:50:08 +0000
Received: from SN1NAM02FT0016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:1bc:cafe::92) by SA0PR11CA0206.outlook.office365.com
 (2603:10b6:806:1bc::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21 via Frontend
 Transport; Mon, 22 Aug 2022 09:50:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0016.mail.protection.outlook.com (10.97.4.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Mon, 22 Aug 2022 09:50:07 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Aug 2022 02:50:06 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 22 Aug 2022 02:50:06 -0700
Envelope-to: buildroot@buildroot.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, peter@korsgaard.com,
 michal.simek@amd.com, yann.morin.1998@free.fr
Received: from [172.25.176.116] (port=35922 helo=xcoapps68.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1oQ44M-0007NM-41; Mon, 22 Aug 2022 02:50:06 -0700
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Mon, 22 Aug 2022 03:49:59 -0600
Message-ID: <20220822095000.8189-2-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220822095000.8189-1-neal.frager@xilinx.com>
References: <20220822095000.8189-1-neal.frager@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad16a983-e30e-4724-6636-08da8423b20b
X-MS-TrafficTypeDiagnostic: CO1PR02MB8618:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: glr1THNu4xVkGXfQIr6H6ndq0pTaJno1htUHS6+aM5He9vbc5IVJZaSBv+SWXc4p0pJTdM3dCBz6Hh2f5NuaZNBIw33ccA+DwoL/acG2pNIo6AxINSX5ggTi/YuW3vCmw6m8VnesW65Ezk0O7Ww1wE85YPmytpCzRLfdDqVv6FqqNC4GgUvPx7hHy03VVEyYttGW2GAjHrC9F1Q5eznMiQwIwvp9VPYfLBGAXY1PW+aLyA7MuwqXeXJcv4w8PXS9LctCfGEfA9kYaIYMsLYrrSMoEOjJrvZek/15NBiIWhqMcxJiBVB2PIFWq+O353lLjQRPesIk9SAS2i0pC38vmQGvGtWkAOMTAG/byTxzcuzm4BWxHz3kEUnBLVvnGtOepU3IptTp2WTJh2qX8/IPDBxyNKopGG+tnuY0769MDc/VvRP+UsrfobceBmVc+h5W5sQfbF5lH6qomjUMA6KQoGi3k9BupJN0Cq+a1XlPaEQd6QR6mSnGw7lJHZNyvoECFPhSORq6CMNWypRzPz9uumN+12fPd4L/vWGh6zk1KpDyQvw8Xrp/O6coXeyX8h5jsiPhJ7kGU2tmJyMUCAqQEZ4wxae66OrCyRRzOhcOqz7mcIpMHIycqt0haoTHZt1y7612cB2S8ION6UDAd7e2L2q37AA65ItdurTFTkTf1WYohzYAjGOmgeDtlriGOIjW2JRnWPYyZfSHYiXSqxhsjN1X/etyaGM0AI9k/ilIEU7GiiCN1RBNN8LecjDfLXO0puFXTpseydx5uQLigb8y7Yru1CeFzWPmBANIVVLqrjeyeVMty3GMtRVSbNgG5hLE3wxHd/+1D4NsUcTSZppjUiZAXDxkLPZFbzlbLm8JXyw=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(396003)(39860400002)(40470700004)(36840700001)(46966006)(478600001)(40480700001)(83380400001)(316002)(26005)(82310400005)(336012)(54906003)(6916009)(47076005)(426003)(36756003)(36860700001)(2616005)(186003)(1076003)(82740400003)(70586007)(8676002)(4326008)(70206006)(7636003)(2906002)(7696005)(41300700001)(6666004)(107886003)(44832011)(356005)(40460700003)(5660300002)(8936002)(9786002)(102446001)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 09:50:07.1378 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad16a983-e30e-4724-6636-08da8423b20b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB8618
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4doHH9jaKajDI1sljd3hNnWXk2PfrSbdEGl05UwRrvA=;
 b=JyK3RAZIls+L22qWskf6M/PWQg9T/g4TWeiFe1iBoKFHhrq8HyD06n1//E+BRgaKlNdM8DhqbEiFsqjj7eCh7An2TOS/0LRf/KkJ9etvxfOqP/5G1sZlOq+SIIINHYZwAYZpSUlADSeoTchnpaxftgzdqHOflJh9MWlaNrc2eO0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
 header.i=@xilinx.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-xilinx-onmicrosoft-com header.b=JyK3RAZI
Subject: [Buildroot] [PATCH v2 2/3] add board/versal
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
Cc: luca.ceresoli@bootlin.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@xilinx.com>, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds board support for generating images for versal boards.

Signed-off-by: Neal Frager <neal.frager@xilinx.com>
---
 DEVELOPERS                 |  1 +
 board/versal/genimage.cfg  | 30 +++++++++++++++++++++
 board/versal/post-build.sh | 16 +++++++++++
 board/versal/post-image.sh | 15 +++++++++++
 board/versal/readme.txt    | 54 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 116 insertions(+)
 create mode 100644 board/versal/genimage.cfg
 create mode 100755 board/versal/post-build.sh
 create mode 100755 board/versal/post-image.sh
 create mode 100644 board/versal/readme.txt

diff --git a/DEVELOPERS b/DEVELOPERS
index c01563524d..8856e66085 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2161,6 +2161,7 @@ F:	package/pkg-qmake.mk
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
index 0000000000..ed6dbe188c
--- /dev/null
+++ b/board/versal/post-image.sh
@@ -0,0 +1,15 @@
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
+
+support/scripts/genimage.sh -c $BOARD_DIR/genimage.cfg
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
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
