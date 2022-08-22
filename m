Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2B7C28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 09:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D76F60D67;
	Mon, 22 Aug 2022 09:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D76F60D67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LlGsfFtVBBGw; Mon, 22 Aug 2022 09:50:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6622D60B95;
	Mon, 22 Aug 2022 09:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6622D60B95
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB7911BF306
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8612E81761
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8612E81761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WrzL-QAqCgDC for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 09:50:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F91A8175C
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F91A8175C
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 09:50:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8vr0Jwmp5NfEWHVfaEfoFUqSDqHjGtTK4fGsyem1kd2AxlbVCthB7YtZEJT0QjeVF26ZysQh1Qr+m3EVdOw6OMZDwxBeh6mQbBPZGfmp6wxvqK2a6w6SNACDOjqMmi6+kPxHUimmTPSwe++HKn/bK4gn4Jxu2lSXcIm7jlnUGVJ3QTPD5D0bcBa1m/2AnE6Zo9HCS0R/ZLLbt9Wz9TXaaAAV0EKOs95xYuqpbcY9jhenD5SiG+12qYBRbwi1n33XumDxaEFUTLTsI6Vw4PEf8C4sKEPh2HLmQAVQH5pL8oqq2XqgWrXgj+f1WaaLmWWrQB6aRZFv131LsxPhlK+pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxiAQsKL+OVSKTSRENZy3SQSKzDnYv2h0q4H7C/+np4=;
 b=kUCETlAEdt2UZzmjAvPYQVGBabmD3WNelu7SyP5KcBDlxcnOLMLr198GhXi02dYV2E3XgnDoFP6687f5sjSAY8gY2J4m1Ejz8KZwRMbFTZPUpQx/IHevTe23BHv6ahKQz49llb/6H3fpkr/c+DK0nIYi4Qnuu9/uGCBKBV8Gd8ifU5JGg0I9zBSJmnr1oJyc2jfuPz+JOiuWwshAJSiiCsr0pAqnststJu2vrfG8aeN7mURv/M8GCWPZ1gEUjphU238MtrjJ/6jetGX94Eqv/ZI/R7FQT621k3V7Rv/NwEd/pU6GuMqxOlN+Jfz61vfRXPqlr/uw1KaTk+iNxqje/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
Received: from DM6PR07CA0061.namprd07.prod.outlook.com (2603:10b6:5:74::38) by
 MN2PR02MB6926.namprd02.prod.outlook.com (2603:10b6:208:201::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Mon, 22 Aug
 2022 09:50:13 +0000
Received: from DM3NAM02FT041.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::ac) by DM6PR07CA0061.outlook.office365.com
 (2603:10b6:5:74::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19 via Frontend
 Transport; Mon, 22 Aug 2022 09:50:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT041.mail.protection.outlook.com (10.13.5.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Mon, 22 Aug 2022 09:50:11 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Aug 2022 02:50:08 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 22 Aug 2022 02:50:08 -0700
Envelope-to: buildroot@buildroot.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, peter@korsgaard.com,
 michal.simek@amd.com, yann.morin.1998@free.fr
Received: from [172.25.176.116] (port=35922 helo=xcoapps68.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1oQ44O-0007NM-DS; Mon, 22 Aug 2022 02:50:08 -0700
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Mon, 22 Aug 2022 03:50:00 -0600
Message-ID: <20220822095000.8189-3-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220822095000.8189-1-neal.frager@xilinx.com>
References: <20220822095000.8189-1-neal.frager@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03201ddc-c773-43af-7116-08da8423b4f0
X-MS-TrafficTypeDiagnostic: MN2PR02MB6926:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X0NjhuHoAxOE1X77Zm00AeOlkQOFq9DceNuIZmvVyh9qrH8o3qOueRAoblxLTTCDHRCe2Q6UVTEcJG0gRDd2kv0rvIRoYl/A7/gwEaUuWeggU5eZr0lucGwzxobeQhOEQFXBJgxIxvIq2v4MRwmaHlBVtoZMJm0lyHOLZ5GKlcIm5+7WFGO8erOxGMk6y6M0eNvXlIjwJRzJGM+UEutALQgcO/3pVVfNLMbIsAKyeNoKlqUJitMQOnJpCFDElQwQJnp5/IgELIS6+a5RyRMfNkCJCmiaLV7ttoH9nIK+097J9Za7qqyZCayTiapfExslENmDZPx1VV3vf2yRe+h4aeR4mzZEDMwkHCF7BQR9+WA3Oe8Gwu4c+DdAycMz+6trw52zhR2seRzp4C9/I/fKrWRIKzduzO6TGEvzDgG/0uurKBtHIJKOftzqTTMhkfBXqtSy7qbs/qRxshf+ifXhhUVmlSERD0wDZZUqRcU/R/tB9VVZWo2K3VwF4EJkpGp1GBGqHMdG6svFjEY5vvt4W5OYM6zutwKO4KlkD/4BoQe9IcXx6Slqbll/75UJLAMIUIOz9uccV6PEGAsc0ExnXdx5avfddL2oKxOSGByrLeAoCoph6NQ5vmEUvdPGWRXI2ExtU743YHkbI3+JkB4X8sLAmZRrkxa0HsJuQNwjKD0/cM5cNgswcWJ54lAa6BmzS1yZ+zdW5WK2Gl+VjL/7y5+ylMDtAkotyIgOaqOlSXZn4zeyp2oweDyk9GUr7vKdk1ut5/irjeXC+ANrZQZpz73JfRHeoV8Hw7i6639xFPcpMzfbVcKPZPb5kLDyObFUJ4d1DfsbylSMkPcu/zI9vkiCNzi9E/JFD325dn6BNv5f3dkhiZdrMjcwfi3j4LQn+X08TphLWq2qqqqyw039Aw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(396003)(39860400002)(346002)(36840700001)(40470700004)(46966006)(7696005)(6666004)(966005)(107886003)(41300700001)(478600001)(47076005)(186003)(1076003)(336012)(83380400001)(426003)(26005)(9786002)(2616005)(2906002)(8936002)(5660300002)(82310400005)(40460700003)(40480700001)(316002)(54906003)(6916009)(4326008)(8676002)(82740400003)(44832011)(70206006)(70586007)(36756003)(7636003)(36860700001)(356005)(102446001)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 09:50:11.9787 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03201ddc-c773-43af-7116-08da8423b4f0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT041.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6926
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxiAQsKL+OVSKTSRENZy3SQSKzDnYv2h0q4H7C/+np4=;
 b=RL1q1Htzs3J8yG0qBpTgkBCf47ptrbmkJWBW7Ie/KnQLObQECLDdiavjkgDdsrfsH0NmjfoO4j8Ls6i+8sogAUzs+vclLKA2w+Wi9dw1pKOYj4WlEsCX70sWmRc0Reaj6SJ4gD76PjT/Qs7xuvEj72kGE/MoW1mfrAgTLt/dkAI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
 header.i=@xilinx.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-xilinx-onmicrosoft-com header.b=RL1q1Htz
Subject: [Buildroot] [PATCH v2 3/3] add configs/versal_vck190_defconfig
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
will download a boot.bin pre-built firmware image from the
github below.

https://github.com/nealfrager/buildroot-firmware

Signed-off-by: Neal Frager <neal.frager@xilinx.com>
---
 DEVELOPERS                      |  1 +
 configs/versal_vck190_defconfig | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 configs/versal_vck190_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 8856e66085..94b9f02310 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2165,6 +2165,7 @@ F:	board/versal/
 F:	board/zynq/
 F:	board/zynqmp/
 F:	board/zynqmp/kria/
+F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
new file mode 100644
index 0000000000..8dbd0ae69d
--- /dev/null
+++ b/configs/versal_vck190_defconfig
@@ -0,0 +1,21 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx_versal"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_VERSAL_FIRMWARE=y
+BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="v2022.1"
+BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
