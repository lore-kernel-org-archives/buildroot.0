Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55AAC197A0
	for <buildroot@archiver.kernel.org>; Thu, 16 Nov 2023 12:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 663B340A5C;
	Thu, 16 Nov 2023 12:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 663B340A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxIuTiBS4Plt; Thu, 16 Nov 2023 12:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECB574198B;
	Thu, 16 Nov 2023 12:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECB574198B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6095C1BF5A5
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 12:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38E3B42527
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 12:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38E3B42527
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d8_K663K3W1x for <buildroot@lists.busybox.net>;
 Thu, 16 Nov 2023 12:24:07 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 219C242666
 for <buildroot@buildroot.org>; Thu, 16 Nov 2023 12:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 219C242666
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQgYwIP3m/hajznqEohk10GSz40UmHqF/uk0Qbelej6AXhDqblFSdPRQZQemt9/TzIKzN9ddwuJ6K2jj0UgHf4u0/xwfxMVqU1+XT9doHqEEHcb+Cv1T++/nJfu2uI4DQ8kxpfwYqqBV+Mo4cvj4aw8zBAyO3gzmTUMYbJwNu4j/uC0MmsV81quLVlZ2A1R+mIjPxl+pgMhpwMrTaiQLAi1LD4T8dpqj9nuH0MQHClhtn+gBsnxTE2DC/EzTr41DTojUQOiHmqbq47UL6dWZbCbrR7/VpHy2c9Sf/xWgVDkB5paIAgEFkHt2zoIlyngKaJ/DwT5G9phyId5pSOzGqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ofnp2r5/R3lNoXhM1qh1C+2Nfa5fs6rgudDUvq5CGAs=;
 b=N+mZ4Wv91kuRFKF3sR89JZCszN+Q9mPYS8lmU/pP8SVNgxXiwKnWVJ1/10rdUi7xpmJ6ZLBd1MzWVJD2mMyHtGCRGi6+SoqDcRTJc84ugkNSfnVJV8l0/OQjJ5JVuDp/caM/DamXXycPZYBzyJAtHjnWQdTKQbgF9I6ZwoD7M3vbkealPxfwqOR+WsLV4quZeCLdumkBa8v4E3VTqkRh8Rm9peZOpty59vrwgQXzenEE6BlR+1NZ4Li0AROIpXA5m60M2xzRPkbEndOBQjxidpyMI1pSEAT357xzHvMXNmDysPWxzlB5AsDiQEFRBhZ/UI7MxljuHXq6mpyFKUHO2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0P221CA0046.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::19)
 by LV3PR12MB9259.namprd12.prod.outlook.com (2603:10b6:408:1b0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 16 Nov
 2023 12:24:03 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::70) by CH0P221CA0046.outlook.office365.com
 (2603:10b6:610:11d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21 via Frontend
 Transport; Thu, 16 Nov 2023 12:24:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.19 via Frontend Transport; Thu, 16 Nov 2023 12:24:03 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 16 Nov
 2023 06:23:41 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 16 Nov 2023 06:23:40 -0600
To: <buildroot@buildroot.org>
Date: Thu, 16 Nov 2023 12:23:23 +0000
Message-ID: <20231116122324.3457681-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116122324.3457681-1-neal.frager@amd.com>
References: <20231116122324.3457681-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|LV3PR12MB9259:EE_
X-MS-Office365-Filtering-Correlation-Id: 4067be44-4120-4406-6bbc-08dbe69eeb8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xRt7h66TDcydp1m0utCoR9RnFyxXlPQQnG/fiMuEwEFSssLMWiBUPhAZogaLgi5FyXmNG5MTSvxeZ/qLtHePog4vbD8VlYyPgljs99NV6fwE4UBb+Bv+9BNtjIU7toSv8ZnfQXtq1AgqyBzI/mAPnP5MnxUCsy0tD+OGNE18ztdNLQEiiomLRZTuy1QmEAnHpOitLNgVHGfnlsHW/Rxlhj7LuCDioMJkba7Ru9oEXrWbrWaDlJY4Qp6/LcEY2gvTbazXbMApzfHRrLeIIOCgNC7u74eMrFIYO4AG/kzH1uH3bhIFn8XPycKKfn9yiMXId3y4eU3Yqso8Ky0Y1HR63zUY6acj7c0IqMbNvndT/ERj88gAy3Y9sYGpY2/sicxUgXdRuOm1PHiTnSK4kW/PYg3+Mq4mwiU1LmrSPTcqscrExy8Y2eJUMnY98DIcdit1Je68K8rl8C5jtj7k6+FMw/gxaCqTcmBH6S4p+Z/0LDJACfEMJnrrbKRubt5MoUMlv3KP3QmnLCcCiV/fbfdXtepV9yfurvjdNrrnBs9b+T8brxn5fhV31+ZKJE+lhdC4326BUBsN75GWtPpMyRj+GpKOeIE4h7y5JMYiCYIpnWb65NDJA9IRO7n7qnG1U27Ns2lEgprpnl+1/BBqWj1qb0rFtkDY5QscYCNouv5bdGiqBaJWHoOCao2pmp5EbEWbwNa2dbYa9aEzR6sd5MoyTUN7SaFN6+VDfn80Xm75PzmepUOOAQdAYAoBMk0fNwrO4h5mbkAVH4NkZ4hOGnFxHo8yr7yB0MdAwp8e/ACFqDs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(82310400011)(451199024)(1800799009)(186009)(40470700004)(36840700001)(46966006)(82740400003)(2906002)(40480700001)(356005)(6666004)(86362001)(41300700001)(478600001)(36756003)(81166007)(36860700001)(70206006)(40460700003)(1076003)(4326008)(2616005)(6916009)(5660300002)(70586007)(26005)(316002)(47076005)(54906003)(44832011)(336012)(8676002)(426003)(8936002)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 12:24:03.2589 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4067be44-4120-4406-6bbc-08dbe69eeb8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9259
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ofnp2r5/R3lNoXhM1qh1C+2Nfa5fs6rgudDUvq5CGAs=;
 b=iN82Y5VemieD50DU+9zZVw5JJXyUkPQ8PfGDcvkXXgmU/RXLVhjrEAcy8TvZP9AFzwclthApArl/43yZVdFMLZOf4Azm0sMyaUNSuDQ0KVQIRJsjDYjH7Gmb/u0nVdjOuT4qBceNBc/kgf1Bj0ltLtcfg1VcN+qII0oCuNy30vI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=iN82Y5Ve
Subject: [Buildroot] [PATCH v1 2/3] configs/zynqmp_zcu106_defconfig: bump to
 xilinx-v2023.2
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynqmp_zcu106_defconfig to xilinx-v2023.2 which includes
the following updates:

- Linux v6.1.30 with additional bug fixes
- U-Boot v2023.01 with additional bug fixes
- ATF v2.8 with additional bug fixes
- PMUFW xilinx_v2023.2

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu106_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 21f41a2d8f..011c7f0fae 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.2)/xlnx_rebase_v6.1_LTS_2023.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
@@ -15,13 +15,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.1)/xlnx_rebase_v2.8_2023.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.2)/xlnx_rebase_v2.8_2023.2.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.1)/xlnx_rebase_v2023.01_2023.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
@@ -30,7 +30,7 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/zcu106-zynqmp/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/zcu106-zynqmp/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
