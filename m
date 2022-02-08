Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AC5C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 07:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDA0460C1E;
	Tue,  8 Feb 2022 07:16:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WTzGbGqpUaUL; Tue,  8 Feb 2022 07:16:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15C5F60ABB;
	Tue,  8 Feb 2022 07:16:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B92B1BF318
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 07:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09F7860ABB
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 07:16:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m3QK-lkc_MAK for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 07:16:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CAA460888
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 07:16:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l60V+zb7JHwqZCxecdowIGQ8WB1fgHx3HzldWB7HaLL7Tt89YB2MXKiUCs8JXQh58W0huqTegV2KQTjDS/Mjdkzg8wCmoibShdy70TES0VNHu26Cdh29Ohbfh+Tq/tNBVUsMiLO1218jTc5jWfcac03M/6XIsllZ6rLMTv82nb3r2mGddhaK73VoW0OVskp1gZcPwNyWMQA8aNsjDevqMEwDXrRWh8N2F2ooDh25piPu9+e5uBjA/k9vkuGsTcL9FwHTEUXxf9d/qJt4IXLAELsagk8Vw0V4XQN5hE9ILYy5dn0+G5tWMZq1Qe+4+4wyQdYV5ge3uXIm6tnbOnWePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTGEJl//sTW1SZ/Wt4M6y9iK/NS2FZE34wqPWVh92W4=;
 b=YKZ6UuWCwAvpztHYNz0DC7/DneHTEAL+lH3OTp2YV20cvzuwle/k+SZMcVUMnwi+s/CPdT0yqH9m1WY7SQQC/V2Th8B+4EmEo3UiisTIqk1bdpRL/KLulTLW/sVMd7HS4Fk3GK9sESwN5BAEN3frPs2UVSeKA78ScN1J3RouV6KFaRBSk4I0w0xlfesUqgN6wllnefyd/w2mwFVrhG7DSqNE0b09Cf4ZPDnBgSqzDwyFlPhr7Ah3Ar8vZCXdm1cjpVosRpONB4naB6VnxpJP8WD/KDhxbitIXUW7W7ujvIAlyahsxIbV1oCPLvxWnmjzA5//GJfCd/JJ8GRIunRSew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTGEJl//sTW1SZ/Wt4M6y9iK/NS2FZE34wqPWVh92W4=;
 b=RCEsBegyj2mIat1C8nXZQPmo3LUc2ehRVyrrEF2j/DYhKsrKNMmTBWYmI159RVRiPgi4ArUB356UMYpqWfRshC2Kotn32DXnPLSoxYqqNBpG527WjNNEGZ2FVgtBl3hZho3sm+4kGYpte4X2WiE2gweXWzPLpSTM5OxnuUxywYA=
Received: from DM6PR12CA0006.namprd12.prod.outlook.com (2603:10b6:5:1c0::19)
 by CH2PR02MB6790.namprd02.prod.outlook.com (2603:10b6:610:7d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 07:16:10 +0000
Received: from DM3NAM02FT004.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::57) by DM6PR12CA0006.outlook.office365.com
 (2603:10b6:5:1c0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Tue, 8 Feb 2022 07:16:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT004.mail.protection.outlook.com (10.13.5.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Tue, 8 Feb 2022 07:16:09 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 7 Feb 2022 23:16:09 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 7 Feb 2022 23:16:09 -0800
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com
Received: from [172.25.185.186] (port=34918 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1nHKjR-0007zm-BS; Mon, 07 Feb 2022 23:16:09 -0800
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Tue, 8 Feb 2022 00:15:59 -0700
Message-ID: <20220208071559.2862411-2-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208071559.2862411-1-neal.frager@xilinx.com>
References: <20220208071559.2862411-1-neal.frager@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd06542f-fbc9-408d-dd54-08d9ead2e1aa
X-MS-TrafficTypeDiagnostic: CH2PR02MB6790:EE_
X-Microsoft-Antispam-PRVS: <CH2PR02MB67906836F472163CD257575FD72D9@CH2PR02MB6790.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ItWMs9wMHPfxvx1W+ome8h8RoHGQFkhRiiyeoco7oSsk9iU5vXqGvwlY8z0f7ctuVi8HJuQ6fdFeq/9l7scqsFcvHXAVtBgTMCQYd1TSXeoDymdx6Rm51Ii15Y3cz9ptnrH3DeGeNn2dAM5FpckEUBt6CntzUwt2Qp/uCa2BcKXKAhy1IYAZZOLj5Ngw4/n2THsIeQZ3k1pznGBXj7y+OmzV44kMKGEpFaofJyAQbXuniyy/faP4t10HXEqidoccbRue39tSUpKEbjZqyfyrnU/BKOhry37tBfXC3YUiU8uE3+6ey14deum8aGfT6cNWn1RcjTTPu1/DuucegPVjTZBs1RkcBvfoZ3Zf4zOL3qwxfalLPvK2qQYPnOv7V4tClwbkpYWHbYII+aXBW3szmVHMOEHjUQF0PLWF91NY3f+V0tbO2OFDe+LYBAfpAsi/tMni5gAQ/1Aki+B8B2Pof9R8P5SFRw4tWQwmsY8FLNopE/8PV2Nqc7FMZbedjQIf0XJRH61pyWgAwN4Eejprb8cNTgLxOTUxPKHW6VQW8NFjCyN8PEgqTuwBPyD+qHmy8NfkRknx8XZW3V1EQ9ENHSDW35fQiq4VAXYJRWbge0CjrNpZemDEbAeim23cq6y96ImNavEbq2mjxIdJQ5UuMg4PC6WCj6MIeIrQXsDKAwfRVcnul+ZAt1BCo6rVf/FNxPvJdaS7akrJCxLa+l+WjXXgKYivEV3TeokVesMRMB3ZCz5ickIPhSYAHQzmW5+FFtWKB/O0pt6aGnHF83RSH/U/yWkmL698fC1KzdJTiz4EtklNcyb7LOgczFXhuEu1uWRBV5Dsqhfb7SxfezVvKg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(2616005)(36756003)(6666004)(7696005)(36860700001)(107886003)(316002)(426003)(508600001)(44832011)(2906002)(1076003)(186003)(26005)(336012)(5660300002)(47076005)(966005)(82310400004)(40460700003)(8676002)(8936002)(70206006)(70586007)(4326008)(54906003)(7636003)(6916009)(9786002)(356005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 07:16:09.8801 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd06542f-fbc9-408d-dd54-08d9ead2e1aa
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT004.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6790
Subject: [Buildroot] [PATCH 2/2] Add configs/zynqmp_zcu102_defconfig
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
Cc: luca@lucaceresoli.net, Neal Frager <neal.frager@xilinx.com>,
 giulio.benetti@benettiengineering.com, michal.simek@xilinx.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch:
- adds support for Xilinx ZCU102 evaluation board
- ZCU102 features can be found here:
- https://www.xilinx.com/products/boards-and-kits/zcu102.html

Signed-off-by: Neal Frager <neal.frager@xilinx.com>
---
 configs/zynqmp_zcu102_defconfig | 37 +++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 configs/zynqmp_zcu102_defconfig

diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
new file mode 100644
index 0000000000..65a32d11d0
--- /dev/null
+++ b/configs/zynqmp_zcu102_defconfig
@@ -0,0 +1,37 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.15"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/Xilinx/arm-trusted-firmware.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="xlnx_rebase_v2.6"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2022.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
+BR2_TARGET_UBOOT_ZYNQMP=y
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/v2021.2/bin/pmufw-v2021.2.bin"
+BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/pm_cfg_obj.c"
+BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
