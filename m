Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F235CCCA479
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 11:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F4834167E;
	Mon, 20 Jun 2022 11:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F4834167E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K2csNh2sDvvD; Mon, 20 Jun 2022 11:08:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFE3F414C2;
	Mon, 20 Jun 2022 11:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFE3F414C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E72C1BF346
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 11:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBFC382CCB
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 11:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBFC382CCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hAxD7FEZLKIV for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 11:08:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55121812D9
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55121812D9
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 11:08:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZ4dEmngUQ7LsZrIIw+MpeRd1tJO8mTYbnoQp6BGkI/2UXdROUyeY+iQV25VvMhEO+5j+eQpIXcynQJ9SVIu6weiGSMvL+vCMijt8Wk4ZeFNYLeg9XRVuDvjODyUyziZatV2Ab9GLgRri756zLhRH5Q913KEc/qN9tU/Zx+x+Bv6olMT6lkpxmxmK0FzHZZmvyzuU0V7mCPwDL1aiSKyNvQu1R6xlzFEIBTde826N9KMrQ1z/Bv4Xaxkf/M73xwNT2Yhc0k9aOUlSh8wIVHm8rP4+E57uwgCzJZ6jhtHxEk0+yazfXafsN8QjTodxSVYfAEkPX7m0wniMm9suMqZtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUVUMczExvvdw0b6AddIQPUTrJfGFd5p7Dbp0yLNfTU=;
 b=IkowgAmfvj8KCEz7KCsp0pgAr2eBHGwIoN5j/9MpjAAr3qlvYN6wz9YCJVgB2phzZ7v1teDNHh38a0XUhqPIp4yMmRB6goOVAojRq96quB9OCCdYiLqUMh5k7yn8AhouOEIisc9l8mT0uBXMHYC1cKosMBnioebCrqwT1ApTGp/xAsrKyLAwRH520iKMOW84n7GawydPRDBLl/xqCoMUdPqVbSuCUNN82LJ+2w9jW9LIC7QHaWztGdq7Mva9tNcamx8xx5osxF2anmv+p74kgNd7hCJag+K2xeXoBtHsvKJ76b359QQOC7R0lA1N8vBvacsQPbBgjOPHtlRyZVgR2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
Received: from BN6PR14CA0035.namprd14.prod.outlook.com (2603:10b6:404:13f::21)
 by CH2PR02MB7014.namprd02.prod.outlook.com (2603:10b6:610:8e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Mon, 20 Jun
 2022 11:08:49 +0000
Received: from BN1NAM02FT027.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:13f:cafe::b0) by BN6PR14CA0035.outlook.office365.com
 (2603:10b6:404:13f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16 via Frontend
 Transport; Mon, 20 Jun 2022 11:08:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT027.mail.protection.outlook.com (10.13.2.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5353.14 via Frontend Transport; Mon, 20 Jun 2022 11:08:48 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 20 Jun 2022 04:08:47 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 20 Jun 2022 04:08:47 -0700
Envelope-to: buildroot@buildroot.org, luca.ceresoli@bootlin.com,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk,
 yann.morin.1998@free.fr
Received: from [172.25.176.116] (port=41266 helo=xcoapps68.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1o3FGx-000AwD-Fa; Mon, 20 Jun 2022 04:08:47 -0700
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Mon, 20 Jun 2022 05:08:43 -0600
Message-ID: <20220620110843.35930-1-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ca014d9-45aa-4873-a4bc-08da52ad4028
X-MS-TrafficTypeDiagnostic: CH2PR02MB7014:EE_
X-Microsoft-Antispam-PRVS: <CH2PR02MB701403A2C91300111C4EA05CD7B09@CH2PR02MB7014.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: prArHb6INyiRFoT1UsXdBD4AuCanQpMY2Wr/6wKP+WJ8nEkCFZLEMcq00dfdnYgSTcPPP+BYhOr413J3Q57wy14p05d6l19TXmhwUM7lHvrFPIZodQ+6aIm2jwA/uT+Se6oYc46/IhERdZLO7bBLLrOVaQzfk5x1gntsrXp/wYpW2NY9yjQJrAEsCwUwUxdBcsIccDiMiHBRX6e6vmALwTqbH36iBmtpC9ZLuDjyk+QvpJcSX8kvJt0sHqiCpQnB+ncktAM56nq7+9P6CGVkdqWd1LaO1fiqDDTngtwVpAOSjEeHcE27AtfpDDeov1dlbMJJOokPkGyDGnBjrPUi0WR04IdXL+Mg7uO+6W3YUwYpX/RE7fQ/RiaLtyb/NUYLufhbLd6mfJrK1Bj9VSVuyaFCZLCEfOrz7r+JcLj/4oWRjT6L52mkzU2UbxW9YtFfUg+B+XzOkP3z/H5oTD4u1IoMDzilZZ5zRYEGruiOsJ4WM++OJBrHpSg3I3MFDxj+VnevdBLcHjG2s3zbopsdqr1Tqi8oUmyn3Lgk8HOk4acrgST6HYBS6HnQSuSHiL7G2AaQPeGnV7nU2BKyiIVEEGzxYxuhYLQ6qpQYsSSIx3kOOy48h7RQ/fgU+vEwKktqqOiHmfXjh1V5PhaZkHyF5TCZ+arWIq7W3PskPxNjF0giDet79job4rCG0oV/08gxEfYv/J2dfdNogjDo5EtjVVitElYt09zRdzmrjSLB/bkSIfG6IeZpYlZW6hOUxx71NsPsEaX1SdQTlFo4opL9Fw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(136003)(39860400002)(376002)(36840700001)(40470700004)(46966006)(336012)(316002)(54906003)(9786002)(40460700003)(41300700001)(478600001)(2616005)(8936002)(36756003)(82740400003)(5660300002)(356005)(186003)(2906002)(83380400001)(40480700001)(6916009)(82310400005)(6666004)(70586007)(7696005)(70206006)(8676002)(107886003)(4326008)(7636003)(26005)(36860700001)(426003)(44832011)(1076003)(47076005)(102446001)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 11:08:48.4165 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca014d9-45aa-4873-a4bc-08da52ad4028
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT027.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB7014
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUVUMczExvvdw0b6AddIQPUTrJfGFd5p7Dbp0yLNfTU=;
 b=kqXz3ojn9hyQLRpVYdLcAob9RkOza1y/qGj99pSMcy5ysIcLxsCupycYsou3QfH3NA0qtOA6n5c1fUKhaxFOztFrHWpT15xz+M/zYyNqfPsPEmYbZaLVD+NVDvm9Mw8HZvy2lnpRtPnnr4QZG8ASmlyHUjoMOW8gFlf4pY5SLDM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
 header.i=@xilinx.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-xilinx-onmicrosoft-com header.b=kqXz3ojn
Subject: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig: fix
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

This patch will be removed from buildroot once u-boot can build a
correct u-boot.itb for the kria kv260 starter kit.

Signed-off-by: Neal Frager <neal.frager@xilinx.com>
---
 board/zynqmp/kria/kv260/kv260.sh    | 9 +++++++++
 configs/zynqmp_kria_kv260_defconfig | 4 ++--
 2 files changed, 11 insertions(+), 2 deletions(-)
 create mode 100755 board/zynqmp/kria/kv260/kv260.sh

diff --git a/board/zynqmp/kria/kv260/kv260.sh b/board/zynqmp/kria/kv260/kv260.sh
new file mode 100755
index 0000000000..2febb9b087
--- /dev/null
+++ b/board/zynqmp/kria/kv260/kv260.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+# temporary work around for generating kv260 u-boot.itb
+# this will be removed when u-boot can build the kv260 u-boot.itb natively
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
