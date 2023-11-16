Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1323BC54FB9
	for <buildroot@archiver.kernel.org>; Thu, 16 Nov 2023 12:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B480940A5C;
	Thu, 16 Nov 2023 12:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B480940A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SzA8MeUFQpvQ; Thu, 16 Nov 2023 12:24:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6416340BFE;
	Thu, 16 Nov 2023 12:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6416340BFE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C93C21BF5A5
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 12:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF2FA80E4E
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 12:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF2FA80E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UdAGvOy7fiMM for <buildroot@lists.busybox.net>;
 Thu, 16 Nov 2023 12:24:53 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::614])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91B9480DCF
 for <buildroot@buildroot.org>; Thu, 16 Nov 2023 12:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91B9480DCF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Er6Ugq9U8MxwAcVsEVTrr/1eBKVNPin20CAynD6ehKfuHqPo1Zsegq4xcWE+adVkSQ0m7bRW+Y/kOgejGCT+ov2pgDcswvUrKRgSWYusUpWz8RE+1uz0XxmGnNKBhX6SkblyMDJ9rr4fuQuySao54OwaDfas6aAnKJujWmt0YmF1/yWmJnLZLfDpz9fqL61Q3cmyCC8y7cHOSnu6jxTSxkAeLuB96qT07Fn+d/ZbW3LqvAbkgi9DvpMoNnFXlIz+bcb2Otc7NaBpKWrnpWO08wEZFawly79hS4S14gkKNvAm61phVfVE8RR15gFgjSB/u5pLhhqnDi20sHp9ghaBIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpozDxoy7qL57TEwlYm73C82ADACZ1ADifOhJVAqo3c=;
 b=f641kPyWP8aQN2Pe+MgsoN2mgTe7cG8yeAjAEuGo2+GGwV0Mlzoyd8rgoCjVxNTAjhJtdXmRhcw5GsujRmtlckjLNG9tgQYsJ9uVwZhSQD3OxRvroSTkeJsmnI/Iy3qixj7eHIP9yZcUNAFOlH/081KzN3VkoAsVrsCTFdSCkOvPqduuTIWy9YOnDwE3/VKktt2VYUkhZcDnZqW4az3byp4ElLyWexsp+wy9utvFftQdRAGnVQhs5LckFTPaNIQsVMuPJ9r78+fKBqyjSHb0+qbOXM/3gzVwiuzr+HMBfKoiVPjgBeIoIJzP1ZmNKlvZ+95+NvJHsHbTxq+yh3fFkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN2PR12CA0015.namprd12.prod.outlook.com (2603:10b6:208:a8::28)
 by BL1PR12MB5239.namprd12.prod.outlook.com (2603:10b6:208:315::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Thu, 16 Nov
 2023 12:24:50 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:a8:cafe::ea) by MN2PR12CA0015.outlook.office365.com
 (2603:10b6:208:a8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21 via Frontend
 Transport; Thu, 16 Nov 2023 12:24:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.20 via Frontend Transport; Thu, 16 Nov 2023 12:24:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 16 Nov
 2023 06:24:41 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 16 Nov
 2023 06:24:41 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 16 Nov 2023 06:24:40 -0600
To: <buildroot@buildroot.org>
Date: Thu, 16 Nov 2023 12:23:24 +0000
Message-ID: <20231116122324.3457681-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116122324.3457681-1-neal.frager@amd.com>
References: <20231116122324.3457681-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|BL1PR12MB5239:EE_
X-MS-Office365-Filtering-Correlation-Id: e0089bcf-7ddc-4bbf-60f1-08dbe69f06e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RC71kCIy3BqxkbeIgqc/+StxQt7ci/gOGt+5qcp4S1vwsRVxwEtvq2fnndiOjSnlKBncXkBcB9eKO6gkWHIZk4UmugbnUZIQNdbLwbVrvU10XiTvafSvwBUdlSf8q6UtCO38pqtwUvZcuH24leBSKhI9oANLmTDXLS8+AeiMe+SjMSOVGacYE/HpXzt2Y4dDun2q5EqehTwJCYVI26lsjqQDd1KazdzG4R8euTWd0lbiOxOCDthc9OE6o7efQvCy9G8it3u6Nwwsd0NWmiGYpGxgMqoRAkAZ1Z+CdjSdjKps1BZa2N9P4GzT0Shi9Pswg8W6sYMDzK4B4562708Qz3CPVEf9y4Dpt+Y3rqFG9Muzp06nK1YHqMgCcU+qzXyMj6TTFwZh+cR2191Kan//mwR9u8o+5kegPGmkiGocAUZVtDCCz4ngmYUA04tpuyZy3jCy64C0O9z0a1Q8zaVBw60oVHkqeHtlVdgUEUuSFSqjs8x0Pqr+fnhV2qYhkpe+INBI1S6bbCmBneqpMeJ72Fsc2tNqMN12R4z81doZiwRqft6HJy7CHT1LzMCSngxuHQ2uDiifL/N3SIY7Q6h75McrmzK2VfU9cXndO05Uu/HnthDYSMNCPhsqERflx8rGVTljzIV2slE2wHwRruGbypWwhfHdyhEm2PgdTF4Ps+PLvW8R87mMpuNy+DtzC/L+Cath6piap3R16VxCiU5KuLkquvrnt20ijlAIbMpXpqnDoJ6/vbPXdgkYxI3H01qsRRAx9wR55ec6BKEYWtMfPHXXjt5Rv9MzPsKTKpiejKc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(396003)(346002)(136003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(82310400011)(40470700004)(46966006)(36840700001)(356005)(6666004)(36860700001)(81166007)(47076005)(336012)(82740400003)(426003)(26005)(83380400001)(40480700001)(40460700003)(2616005)(2906002)(8936002)(8676002)(5660300002)(86362001)(4326008)(36756003)(44832011)(41300700001)(54906003)(6916009)(70586007)(70206006)(316002)(1076003)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 12:24:49.2603 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0089bcf-7ddc-4bbf-60f1-08dbe69f06e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5239
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpozDxoy7qL57TEwlYm73C82ADACZ1ADifOhJVAqo3c=;
 b=HWdv6TlpotsBSZMCKxtLjE0DdrWFVWebJ3vBpv5pW1jBv9n6DlYx6ihkq4900WB+23w2dk2bt35T6TIQtOaCRB27QGsuMSS6gbMFsK2WALmJ+r5f/Z1kFhaiX2w9jf/IgnxtFU0ydM4dBB+zsA/r8i8+nTD0yjkaSHSxMpsMyG4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=HWdv6Tlp
Subject: [Buildroot] [PATCH v1 3/3] configs/zynqmp_kria_kv260_defconfig:
 bump to xilinx-v2023.2
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

This patch bumps the zynqmp_kria_kv260_defconfig to xilinx-v2023.2 which includes
the following updates:

- Linux v6.1.30 with additional bug fixes
- U-Boot v2023.01 with additional bug fixes
- ATF v2.8 with additional bug fixes
- PMUFW xilinx_v2023.2

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_kria_kv260_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 78b62a9ff8..a3a157267c 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2 ${UBOOT_DIR}"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.2)/xlnx_rebase_v6.1_LTS_2023.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
@@ -15,14 +15,14 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.1)/xlnx_rebase_v2.8_2023.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.2)/xlnx_rebase_v2.8_2023.2.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.1)/xlnx_rebase_v2023.01_2023.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/kria/uboot.fragment"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
@@ -32,7 +32,7 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/kv260-kria/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/kv260-kria/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
