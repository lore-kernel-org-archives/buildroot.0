Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B984BC25B0E
	for <buildroot@archiver.kernel.org>; Fri, 19 Aug 2022 06:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5760F83F78;
	Fri, 19 Aug 2022 06:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5760F83F78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 63KUXjxcYraY; Fri, 19 Aug 2022 06:38:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73D5E83EA1;
	Fri, 19 Aug 2022 06:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73D5E83EA1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F13D91BF25F
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 06:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C968B41C6A
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 06:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C968B41C6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m8MVSTeTyr6r for <buildroot@lists.busybox.net>;
 Fri, 19 Aug 2022 06:37:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E04941C55
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E04941C55
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 06:37:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4TSfBg5wLD5LQhrSjF4aScJLJJMxnDmYg2Mur6U+dPiEq0bq/XCKTbRPN9R7gcEKX+WdQzgEjnvDSdKK2udAaNJjskbFtK5tJRdLJbyNR0PpgWZf3cSo8uz5Kae0Hqj3Aj0yXO5O9auz/J2bHgrW5UGZqt4w9L7ROkkg1i+4S/dhtBYInM/vgQC7hrE3xJu0Z5V7ioBemI/AZytZ9GPnOPf335HimKKMoux/Dx10L0rW8rXQTAOP811MbTADpe9MDgsmTmwnLmL5Y6lQXxq/IH8IREsLFrYnM79JatduA2NGOaPAHf/d6N/F04zuhvJE5p+ZidpWrBpZgjlaeF8uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6QQO4jz9jGepfYtEHMqxXnOT9jHSmPSrmwFUCpINL8=;
 b=GzE5Tva+DBikELxb9uw1BKJ766TfdBeQ70KiNinTIa46TbY6fTdcgcC0nVOX0RKHhd3EGvGHJPRzey0KHnOej7cdJDBYVmiMHGSpMyAErrIXc9PMRlje25gmTOeO3avRRWsVJXZYGPUJK7sFsrXHghDcslq2WD/q5HJMqoW6QZOIS4N1RzMJ0kKV3xmX5ME+/kPkbttDxhkVFGSJJRqw9FiG32+XX7bTu+NmFqlX8lawp0sljBU0NragQuzIHYNliwwk/3DbuJr0iDPPHW4YdDBGO7zoQindqUW/KafnDl2bt8S1i17jTzDlvvw5YZhHvum2gawiIszta2adljVDbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
Received: from BN0PR07CA0017.namprd07.prod.outlook.com (2603:10b6:408:141::31)
 by BYAPR02MB4904.namprd02.prod.outlook.com (2603:10b6:a03:47::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 19 Aug
 2022 06:37:47 +0000
Received: from BN1NAM02FT045.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::c5) by BN0PR07CA0017.outlook.office365.com
 (2603:10b6:408:141::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.16 via Frontend
 Transport; Fri, 19 Aug 2022 06:37:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT045.mail.protection.outlook.com (10.13.2.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Fri, 19 Aug 2022 06:37:47 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 18 Aug 2022 23:37:44 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 18 Aug 2022 23:37:44 -0700
Envelope-to: buildroot@buildroot.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, peter@korsgaard.com,
 michal.simek@amd.com
Received: from [172.25.176.116] (port=43244 helo=xcoapps68.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1oOvdY-0002Eh-4e; Thu, 18 Aug 2022 23:37:44 -0700
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Fri, 19 Aug 2022 00:37:17 -0600
Message-ID: <20220819063717.33591-3-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220819063717.33591-1-neal.frager@xilinx.com>
References: <20220819063717.33591-1-neal.frager@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65763a63-6436-4137-4fe9-08da81ad547a
X-MS-TrafficTypeDiagnostic: BYAPR02MB4904:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r2QXqTcNGABoAAq6LacgKo86pUI/8JBKvAB+yuvw5aEnTPItJmurkjCoKecvxTtRMQFoqMCgx6v+lciZ8iFMVLlzfEdede1C1hqJNWDXVaGsiemQSZmoLrEoxFdQpK0evbiyGvazTvPFEvYRoz1ybewjOLX8WGje1L0ncsFyhfSrAzgq+BK86vCIjgoYeWf7UbYkVzShdb/Nz7gRmwdmQs3vvM6zJELqE9vehJseDWJBQRCod0SoBERvRWEdGrbI7zcD3GCkHcI73mrlxTPsTs9p9H4waQvrDbgXDd1ko5JJBmJy9SsYrRU7FaO/1WXBc7ghTs/CTOca0q+O/bSXZw+bbxJzuGgRFkxstNOLeKCIARRAJ7vqZmoQ0tcA2jX/P8ycFnk/cQ/2Z608zIjogjY2tkF+wmfxQqh0PSVX/9GPQk1CysNnvyNHTARNt3mDU1i13SZqp456ivSU07PIKPeqX2lTGqzdpOt1yGWDc/bvW9CsTEaSMBrR8Bcg3xK9tThWVKR5ueSnH9JUvDOPNVLlqTZuSSty/FWb9uq8iC3dUb7IrBKWVzm/ttneaY9N1YKHZuDiglTqm9gVpB1BK9zdYGVF59ghwEtCMIlXWJn2eH39eyOF2fgS7xpiJbSaLkWaWDTxGkLzXWlwUhR9/1DdRCOWq0Nzgb7Nq2iq0jbASpqAHLLL/SD2ceKyXIlmv5aR9jsbxIksOOo/SIF7wXv93TAwy1hCkEyHNHnIKLim4N3Wm5L4p/fI4JAmAy6zZoibpIwFuFLfwBuiBS0FSIDGIbfsEBMo18Za0Xg3SKFCMUB5itYUXAmnpMVdHuJerBACsvUcGGss86dgkMBrBd7MwH77olbEZgDsgZoWtrkeYNxO6olUc7uFK7fcWtcb
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(376002)(396003)(136003)(40470700004)(46966006)(36840700001)(2906002)(44832011)(36756003)(478600001)(4326008)(8676002)(70206006)(70586007)(40480700001)(41300700001)(82310400005)(316002)(966005)(6666004)(26005)(107886003)(7696005)(6916009)(54906003)(356005)(1076003)(7636003)(2616005)(336012)(40460700003)(83380400001)(186003)(9786002)(82740400003)(8936002)(5660300002)(36860700001)(426003)(47076005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 06:37:47.1411 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65763a63-6436-4137-4fe9-08da81ad547a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT045.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4904
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6QQO4jz9jGepfYtEHMqxXnOT9jHSmPSrmwFUCpINL8=;
 b=Xm5vNImq8peF+Oc2wPZUuN5YqAhQ8Gkr7eLu3JJwr5MNSsYvWeDTrzJI6fTLcXrb00egG/OVoHtn6fRhmLIWBpcNjQesKD/BokkOwSdhBNHDCrRETVGd8T+P+dxeoXcJcObdOBddmm48HPZYZaBTgndN5Y2bPs316gpu+qyIyzs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
 header.i=@xilinx.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-xilinx-onmicrosoft-com header.b=Xm5vNImq
Subject: [Buildroot] [PATCH v1 3/3] add configs/versal_vck190_defconfig
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
will download a boot.bin pre-built image from the petalinux
pre-built wiki page found below.

https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842316/Linux+Prebuilt+Images

Signed-off-by: Neal Frager <neal.frager@xilinx.com>
---
 DEVELOPERS                      |  1 +
 configs/versal_vck190_defconfig | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 configs/versal_vck190_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 315866bc8f..3830200bb0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2165,6 +2165,7 @@ F:	board/zynq/
 F:	board/zynqmp/
 F:	board/zynqmp/kria/
 F:	board/versal/
+F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
new file mode 100644
index 0000000000..d0ea4c2077
--- /dev/null
+++ b/configs/versal_vck190_defconfig
@@ -0,0 +1,22 @@
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
+BR2_PACKAGE_VERSAL_FIRMWARE_LOCATION="$(call github,nealfrager,versal_boot,v2022.1)"
+BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
+BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="v2022.1"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
