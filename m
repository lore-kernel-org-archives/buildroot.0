Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05115C28B2B
	for <buildroot@archiver.kernel.org>; Fri, 19 Aug 2022 06:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7641441CA2;
	Fri, 19 Aug 2022 06:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7641441CA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hk2-_0_sQ5kq; Fri, 19 Aug 2022 06:37:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC98341C6A;
	Fri, 19 Aug 2022 06:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC98341C6A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DC691BF25F
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 06:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9CE64114F
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 06:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9CE64114F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TCSACpJwVbpH for <buildroot@lists.busybox.net>;
 Fri, 19 Aug 2022 06:37:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A2F840A90
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A2F840A90
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 06:37:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nh8w6dFmNxt9B6ln6QlZcWkPoKATMJWPXDNlyGbjQKcbgy3sqH9mT2Necg5CiqzO2GjqZCZ1kAUCISIeKWIribgsxRhjEB4DJjsxbAWdJGA2P4hpDJP5aFf//Cp0URfg9z4bTkvpJPlCzX+o37BgGSU7KczPCvZ3rqcYy2Gl5buDlkxbynEnE3RFHaf1gxmvl2ev04FdSjwzmzm1S+IIWx5fXgrUp5rlAVK/Z/nGJW7VicLmU2IxNHjTbY20vh1p4XIQPnxskMAT49TuUWEPUiLpDqIAfn/75XQcv91c2KuaWUCMLl3/4s6jCUdGgKHBjk2PsI4kG5K4SrHNmkun7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3wojCQuLUc9QZdvypJ3t73bVqTBL9u7M/GvTJmdwYc=;
 b=clVPm0/XX0W6A/ZIbOhEiZa6xvvXwiRwKPw6LmbTrAbGosulLPZm22hf10buzgK5UnoZoSXcY9FB+68Ons8DvpfqmVzazPUs64EDU88LGo/ammzN3MnB0TOvSaMzbSDLOKqDpUvXGQulG6z5v5pRfcHwpb4/fs6sKgU/8NPG73b82fYZKQMQetok4AFZHpDfEl1/KMmu7WwH6t40waZH68fkmUL9kCmc7pB1tbh5mv4z9xh8Z0mYiFpvri5MNfblQCtHm/nr42HC5jfwOl9fOGq4F+yrNIo7cuJk8cdRZQtfUkrbW2UuVTcqDklx6Ps9Rd1mbKKr0N9yqM95XNgQxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
Received: from BN0PR07CA0001.namprd07.prod.outlook.com (2603:10b6:408:141::12)
 by MWHPR02MB2319.namprd02.prod.outlook.com (2603:10b6:300:5b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.22; Fri, 19 Aug
 2022 06:37:46 +0000
Received: from BN1NAM02FT045.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::32) by BN0PR07CA0001.outlook.office365.com
 (2603:10b6:408:141::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.18 via Frontend
 Transport; Fri, 19 Aug 2022 06:37:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT045.mail.protection.outlook.com (10.13.2.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Fri, 19 Aug 2022 06:37:45 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 18 Aug 2022 23:37:41 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 18 Aug 2022 23:37:41 -0700
Envelope-to: buildroot@buildroot.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, peter@korsgaard.com,
 michal.simek@amd.com
Received: from [172.25.176.116] (port=43244 helo=xcoapps68.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1oOvdV-0002Eh-PV; Thu, 18 Aug 2022 23:37:41 -0700
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Fri, 19 Aug 2022 00:37:16 -0600
Message-ID: <20220819063717.33591-2-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220819063717.33591-1-neal.frager@xilinx.com>
References: <20220819063717.33591-1-neal.frager@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da609dde-132c-4863-75e0-08da81ad5357
X-MS-TrafficTypeDiagnostic: MWHPR02MB2319:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0+6kVlHIKgfixdA7GywekSmuf+791i9GdFzJmtb/kQpy26Vj5Str6qE1WScZjOvt6ejDwPwkehIr4aEo27K/nbliUPAGHUjTZFUOL3vhuai1fLdtB46cwSl3vjEC7DPIrZWchNrWWnj2OiDNQNVftkXRVpih3WhkniZrVGGz92HChkjVOQfZZC1yIEQucHAcYr+C2s6AizCvka1MHhlzZpEN8Bn+gTB53jWr0ssePrIwD8MffIyUZzcJtL3aqDEPJ6QnsO6nTi4xOu/NfUxXTfUnkMDdzQFoAFkvsnhpFClCUja9jkDLp1KEIWaRe9Pb4TmJkA88cjXrUZWjM5Ec5tAQXQ7gGU1n6Og2JebHB5BNPb6vHpof7kzZst5cQJBXoeq2Gw8qyDx7t6SeXHxwp7ccHVEqnUQyG/XBWofOnmij+Q0a1anLAAY95D4oqIyeca1j+Wrruz2QJSnOGjCtPuIt3dCEC+4NlfbWtv8FuWgnjRDKoC/UMRbB29auF+Gzky75qAlmN4jTUpzCBNqdhXmE2T0Bg5GKVym4/9l+5EFDuSpkHFDkuJb60HwHVsvfDapRkViMQS3yQuAJzT1alMvToo/qRQjFiv8evd5MTvs92KxI/CbAuJJ7FYwCAupKQX+uH7BvCx0OB9C6WFnv1gZtLeSutrDdYzHeIuF/JrAJAGAfpSlf7woTbxssCJggQiFjPdQXglqXLUdQGj0wud0+nvSrKPSxyRS+TA4Fvuwbu+z33ASem4pAerWQq8FUCENNce7tKTLMYnNVlu71EEdyYlwwLqkIlZk5VQoY4CNj0jGDo7tzRGBglMTxuemB3HXqUUVig1Y+cNWNsjSVJg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(376002)(346002)(396003)(46966006)(36840700001)(40470700004)(36860700001)(70206006)(316002)(82740400003)(356005)(40460700003)(7636003)(8676002)(5660300002)(54906003)(44832011)(4326008)(2906002)(83380400001)(6916009)(9786002)(8936002)(70586007)(7696005)(82310400005)(1076003)(47076005)(336012)(107886003)(26005)(41300700001)(186003)(426003)(478600001)(40480700001)(6666004)(2616005)(36756003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 06:37:45.2350 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da609dde-132c-4863-75e0-08da81ad5357
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT045.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2319
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3wojCQuLUc9QZdvypJ3t73bVqTBL9u7M/GvTJmdwYc=;
 b=jtDZbwQHO6RoSbjHNmfXe2+t1D2LwsA6Chv5KoRzzGDqAhRaTSzxc2di15rjCZ65TCdaXsveR4iAJx8+WTN5NhS6ff2hRYnPdn2XYCxU5XQSAZCKWAvebLBxJt563yK9WZNGEduIaA8ktsaHsn8WkGa9WC8NC8fcFnaIbi2kj3M=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
 header.i=@xilinx.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-xilinx-onmicrosoft-com header.b=jtDZbwQH
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
Cc: Neal Frager <neal.frager@xilinx.com>, michal.simek@amd.com,
 luca.ceresoli@bootlin.com, thomas.petazzoni@bootlin.com
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
index 1671f782ba..315866bc8f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2164,6 +2164,7 @@ N:	Neal Frager <neal.frager@amd.com>
 F:	board/zynq/
 F:	board/zynqmp/
 F:	board/zynqmp/kria/
+F:	board/versal/
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
