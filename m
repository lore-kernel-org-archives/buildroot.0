Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8634CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 04:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A9A26122E;
	Wed, 22 Jun 2022 04:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A9A26122E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QXtbd-Y6cwSz; Wed, 22 Jun 2022 04:24:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21FB961226;
	Wed, 22 Jun 2022 04:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21FB961226
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4DFC1BF41B
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 04:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8378541CB4
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 04:24:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8378541CB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YDv0uGIrnKNd for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 04:24:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C81B41CB3
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C81B41CB3
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 04:24:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PcB0b1Zu55rs4FDQHuhjlDZjNxUXYOLqsQAGxL19MlPqTR002gQ7zglsG1ilaOEjhvePe2l3CoCVe2mqsUjVzA+CQdbF/zgNnG0WjDqCN1mi3YWUUe1sNzbCej8yoZVoMTFQ8/8Q4m/63EzzV5yxohoPrzfUcXdQm9dTRMRaM5QPY2Y7qCWs+4zvk6HRLC2FspoJaVxjQ8qztRG0FxdouCCGi+V0ooYRu7sqrQIdRegvK4ult8yQQazCMNOLGtLfSfcTFuJKcGK2wV7v22VcMlVw6n9bdzXwcL/hCXWnxQRk+OqHnyIV1g8tz2ZTAxGP6r6Y5a93gNvwLSTObJlZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIgPKiHmqzGQNtQJ2fHeS4XezCML/xQ7OA4hV8wHeNA=;
 b=PxGG0ANNd34Jp2LIlMjkDoTcbpVIlo4JO9dfCGSAynQq7+dc8PoyXFr7XL6Z8VlIuYovFrK/OTr8WNqpGbNfK7p/gq8f4LwIFWCbGlt0C/8739BquVKnwe0iFVKP647KNYS406MMWVHTvumYXpNSZqtCznlhawv/mK9U6Ad6/aydXGPj5YvlZBe/YfuVbdf9/JA45sqWWCWg8YWNb7RZbULEGvK4PM6K9FiVM9yXJGzbk2pS634XHPu2hr5M9I3hgXIOpp/xWd2suWh7FEt8+eBKkqBsMCj30DiL8LB6GtjczMyJKPFzUwQvGWNZekMXqo8HLNRaZm00FKlFD6uc3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
Received: from SA0PR11CA0166.namprd11.prod.outlook.com (2603:10b6:806:1bb::21)
 by DM5PR02MB3894.namprd02.prod.outlook.com (2603:10b6:4:b1::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 22 Jun
 2022 04:24:45 +0000
Received: from SN1NAM02FT0009.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:1bb:cafe::fe) by SA0PR11CA0166.outlook.office365.com
 (2603:10b6:806:1bb::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Wed, 22 Jun 2022 04:24:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0009.mail.protection.outlook.com (10.97.4.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Wed, 22 Jun 2022 04:24:44 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 21 Jun 2022 21:24:43 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 21 Jun 2022 21:24:43 -0700
Envelope-to: buildroot@buildroot.org, luca.ceresoli@bootlin.com,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk,
 yann.morin.1998@free.fr
Received: from [172.25.176.116] (port=55320 helo=xcoapps68.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1o3rv1-000GA9-Hj; Tue, 21 Jun 2022 21:24:43 -0700
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Tue, 21 Jun 2022 22:24:39 -0600
Message-ID: <20220622042439.30423-1-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e141748a-5d62-4d9e-bd4f-08da54072236
X-MS-TrafficTypeDiagnostic: DM5PR02MB3894:EE_
X-Microsoft-Antispam-PRVS: <DM5PR02MB3894F72F8B1C6D723DD21F05D7B29@DM5PR02MB3894.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qEusMzjcuWArPyLAyjHOyUxltkXUcdpbAvoNT3rjE4nq3HL8elupUsC4eiW5i08wOIwIRBD7hLcg0OnPpqOGNWvNZVwHfJVKIq8sPidfCJkXYOFOsfSxjx/bs2+QgEUDFpujQk1X05gq4J2PZWTIz+tRhp3Ncxq2za26gUX0fK9aS3nKejccr3wRiu4s63jGKh3hL9j6BYFnzKzWWrLLGvB3N2NpybTyNn+Os85qc60W1h77C4Xv5YTg39JeDfQenxRdqSrWs0ZauaLpo7lZPBz8ykPRRO/0e7HVoZSRRnTnYQYgyNNZGVjNo2upiefr8MEPMk+FzaDdBJDv0JrUW9b6ynEYWsPOlHB8BUqdHVmPr+Ojp02J52iEbaB2UYFJm06wxpMPE04x8wowzanqBvC4wh7Wo4VzSQdHczDJ4Qk3MACl+nuLjie3DRIJ4WC9oM6ZFrW3SmEaVTQF0miX3F0+U15Mm8dTsJG7tBzindroVzjFOu+1teqC/HYTCTVnVlAOmdvZh71mOUEinUbaaBmjncsyCLXR3afS5UE0YiwAG7F0VOs2LLraxstmQ9QU8ymG46YYze6IrSMDkE8I3PfO5BfWPfEszqJq1ORLV0VjXXtejJaMPnhPcXP6nTA2tIXBU8Rmx1pWHl4GczbxL61G7Pt7Kv+cSiboEMDp6AznHXjzcFx2BbEaH4oLetdpreoi2ws6QIq7FUd6x4Qwo9MC/HHyhTqykkKbmoDLUwIlhhA2b9vxKLZBxuZ0b0Il8+fVVjxHJ0ktLYEWVkdvMQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(346002)(136003)(376002)(36840700001)(40470700004)(46966006)(6666004)(41300700001)(26005)(36860700001)(82740400003)(7636003)(356005)(336012)(186003)(1076003)(107886003)(40460700003)(2616005)(82310400005)(7696005)(54906003)(47076005)(426003)(5660300002)(83380400001)(316002)(8676002)(70586007)(70206006)(4326008)(9786002)(8936002)(40480700001)(36756003)(44832011)(2906002)(6916009)(478600001)(102446001)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 04:24:44.0926 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e141748a-5d62-4d9e-bd4f-08da54072236
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0009.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3894
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIgPKiHmqzGQNtQJ2fHeS4XezCML/xQ7OA4hV8wHeNA=;
 b=dV523KYMegKYg61bMeMu8Rz9mXox8hQ4kIKsSxrMs4Y7c5ALvMnQBcvzWHG0VU22qb1Lst32V1R2H3nBlUyOI/kWVl4Q6deF+ll58tu0gJRqSx6kM9WTW9CJjOv/OwrY4WlOzq70/fmcrkMWh+F1zhfg+flJ3Lol650x51E2cuQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
 header.i=@xilinx.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-xilinx-onmicrosoft-com header.b=dV523KYM
Subject: [Buildroot] [PATCH v2 1/1] configs/zynqmp_kria_kv260_defconfig: fix
 to u-boot.itb generation
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
Cc: luca.ceresoli@bootlin.com, wesley@sonifex.co.uk,
 Neal Frager <neal.frager@xilinx.com>, giulio.benetti@benettiengineering.com,
 michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch is a temporary fix for the kv260 u-boot.itb generation
until a proper fix has been implemented within u-boot.

The problem is u-boot can only be configured to use the kria k26
som dts configuration at build time, and the kv260 carrier board
overlay is missing from the build.  Without this, all of the carrier
board drivers are missing.

This patch will be removed from buildroot once u-boot can build a
correct u-boot.itb for the kria kv260 starter kit including the
carrier board overlay and corresponding drivers.

Signed-off-by: Neal Frager <neal.frager@xilinx.com>
---
V1->V2:
  - improved comments describing the u-boot.itb build issue
---
 board/zynqmp/kria/kv260/kv260.sh    | 12 ++++++++++++
 configs/zynqmp_kria_kv260_defconfig |  4 ++--
 2 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100755 board/zynqmp/kria/kv260/kv260.sh

diff --git a/board/zynqmp/kria/kv260/kv260.sh b/board/zynqmp/kria/kv260/kv260.sh
new file mode 100755
index 0000000000..e3467f3068
--- /dev/null
+++ b/board/zynqmp/kria/kv260/kv260.sh
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+# This is a temporary work around for generating kv260 u-boot.itb.
+# The problem is there is no way to currently configure u-boot to apply 
+# the carrier board dtb overlay during build, so all kv260 carrier board 
+# drivers are missing.
+# This will be removed when u-boot can build the kv260 u-boot.itb natively.
+
+UBOOT_DIR=$4
+
+fdtoverlay -o ${UBOOT_DIR}/fit-dtb.blob -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
+${UBOOT_DIR}/tools/mkimage -E -f ${UBOOT_DIR}/u-boot.its -B 0x8 ${BINARIES_DIR}/u-boot.itb
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index c1366b705c..d98ac89c63 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -1,8 +1,8 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kv260/kv260.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2 ${UBOOT_DIR}"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
