Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA965C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 12:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB605409B7;
	Mon,  3 Jun 2024 12:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJ4XUZ69vAb3; Mon,  3 Jun 2024 12:14:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE897405F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE897405F0;
	Mon,  3 Jun 2024 12:14:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 737531BF3EA
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 12:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D45B403C0
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 12:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oa_a_9fOEFqn for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 12:14:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::62b;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 286C7401CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 286C7401CE
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 286C7401CE
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 12:14:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6dJaroBUc6Ms1QMKt+lXd4URjrTlpBw4WCMP/czp1Nf3jxMQWDqbaszjR/1uKNoOU9DGnmxO/yMSjKyO2iRy05Fw1iuQlIbXYeIpP1xelJcI1ilvQRibmgKUTORajfsBGg6zn2eoRdEi/acd6Du6N6YWfg4PPHws1yXTmDdRJ+XUwoEi7dxsgubk8IrNWhNmtvd7mXwo4Sssv1HUW8a5tGbRuoUeZuo0GDLZ4k7foMzxzyK62XdtI5jDjLXBW7FFRTJGANOoZuO2yzNsBB9f0QK1BZ2oIkOcgznR5ADmhCnnmtzN/802qhh+Iz0oAT6xmkdZ2D1Payo1hRrZ0CdIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cuxVFVXP1KlWLBDTqyPHW3PbTObUH5YahgKbNoa4Ec=;
 b=dD0RA3OPJWl1KNhU7j8H11Wh+JliZNn2aC7LOf3lvK0MqyGyCIFu6gc5VVeA6BdXwqAIdUxZwRJwZ9NNBnVRv7LP8DmNEGcfwORjOk5UL1rB1SscuzY3sG5p9zJ+e09RdktAAKlwGZ+bUc0ltDU4tcTSQzpLdKTv+3eIvxiV//zO8Zvp1VA3/8v79aopo1FZIUimRjlLNaKl1N3gF4iIn8svTx5YLJrX9Cmg6mIxo9CYKc6CjWeyWgXswCGJ/89fSSsktZ9nUT3SVYOQFQ0BtJH8A0cuWDinTk4pAE2uDjjy0chZBc/mYLoNwQKvXPqwq9oapCo8r2Bo+TxcEo4P6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN8PR04CA0064.namprd04.prod.outlook.com (2603:10b6:408:d4::38)
 by SN7PR12MB7297.namprd12.prod.outlook.com (2603:10b6:806:2ad::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Mon, 3 Jun
 2024 12:14:49 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:d4:cafe::a2) by BN8PR04CA0064.outlook.office365.com
 (2603:10b6:408:d4::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30 via Frontend
 Transport; Mon, 3 Jun 2024 12:14:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Mon, 3 Jun 2024 12:14:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 3 Jun
 2024 07:14:47 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 3 Jun
 2024 07:14:47 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 3 Jun 2024 07:14:46 -0500
To: <buildroot@buildroot.org>
Date: Mon, 3 Jun 2024 13:14:35 +0100
Message-ID: <20240603121435.197680-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240603121435.197680-1-neal.frager@amd.com>
References: <20240603121435.197680-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|SN7PR12MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: 486b3a51-9742-40de-e18d-08dc83c6c321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|1800799015|82310400017|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5GVAaNk6dye6La5skBTouhy7Z2yGh108RkWgL3U43Vu7NV+CZclzg/s/9Yy+?=
 =?us-ascii?Q?oMtw9cyc/x1VgwpjEB8KkCfgJWy2nPDs33CtYMeqd37NJ0CmjjGcQ6qK3PtL?=
 =?us-ascii?Q?fFYckIu6p4XtrkHHOvPXiNBcD0JOTYyTrSZDd8h54lBluA9ZmVtM/vrlXVTM?=
 =?us-ascii?Q?gk2MCUfpgCVoRsoLmCggqQ8kcVl5ivg3XaeOM9LvgtZ23b3SmSftBPtglUNj?=
 =?us-ascii?Q?iCypZX3/r6anQ/8UeML0I9CSgonaYe0qDqWhWyZoWDc9rMqGCZpI3JxSHDBq?=
 =?us-ascii?Q?1DJRUFrwboIUUwZpidS/cbKNjy/1arpCbWKJaz+doCIttI5IsAq235qoLd00?=
 =?us-ascii?Q?r0Ks5DYDKSZH6kQP/Y0muOvMds+K/c8rurstW6GzRBKwg7ie0tDy6vdEwjaK?=
 =?us-ascii?Q?fTjTQhLEypW1duy9Gp9nZQAZif3yTq2pkRuj7Vv6g925tdFBeR/SyvbRVP8T?=
 =?us-ascii?Q?4s1kZaFQDwX5GrTjHKsiLhc80gDzKx7MMnsBIGaWLduYe36BKhCcYngFZNr7?=
 =?us-ascii?Q?UEfoKYUXORj7ewIIr4UhMiHMfJ46zzSdD/mTWFj+fzA0B8UAgZcmyIk3xzrp?=
 =?us-ascii?Q?5MAR7wE7OTMNDNN5ZND01EC5FxnLVIhfSztFRt1NxYAQ7ZIltLU+yFgiOkv7?=
 =?us-ascii?Q?0TpuC33/2P5UUg2ZLT9yWpL+D279R65cYrFFXlmGrGDhbDYbGm/znJqnR1AO?=
 =?us-ascii?Q?iWIzUVqRP0HIV4wUwzfuj/BEwmjl0s8/eS/7LUm5dMxqlU+II/tmhiLHJHrj?=
 =?us-ascii?Q?SIpIDqgjmZHQzwYpj2JUuHzaxhGrnC8uDvFDrQY5ce7uFo4BLu2urOHx/2dq?=
 =?us-ascii?Q?UkAczmhW+i/TDmeCQ6yKEvsFtLeZ0aDdVovct8mPwPNad5+4PCUM2vELxVpp?=
 =?us-ascii?Q?+sVJwOWsC7H6R53tHaU4X3GZO3CgQ1IecYxshPk+X+6Qq4rKm+SvOesosZbK?=
 =?us-ascii?Q?Kzg3GP09S+9pyLbVzEebYSujVphK4aGyeX0VQjFH/Rrl88moO/yTyMVF6H84?=
 =?us-ascii?Q?qbRkTvenRA3E5FNvToZKnAICFb8tEcGH45oZwUJV7q5lFH7iAHHHOwQhms4x?=
 =?us-ascii?Q?uG826KCDXPvZ31+UpL6oZxlNmlNQQFycpo4G39PeO3mEYaSbDZ+A0EDXGE1Y?=
 =?us-ascii?Q?OKrJCGrgJOloEkDBgzAcI5s10W9r67vKVBqJ2uvnbHufPWTJKyfMva6CBK3f?=
 =?us-ascii?Q?qwAbYh+2s+oUbYghBG5IKRvoSyCZiV9GiWMOKXd4ZSYWfXIyiw/xZ4djhBxr?=
 =?us-ascii?Q?lqs5OHEUv8Gt9UOXhk0HkTR/d1MBguyt242PsH++mOgTm8Lby+prw450XEzQ?=
 =?us-ascii?Q?5rdc+J9VKCz+AXQCdDh/9KVEs4+zkhSNJqjLKo+U+VKIdkXniKeEcoLiZPGG?=
 =?us-ascii?Q?6SP3K0EfRh38ib/LDPqezslBlrfj?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(82310400017)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 12:14:47.9839 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 486b3a51-9742-40de-e18d-08dc83c6c321
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7297
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cuxVFVXP1KlWLBDTqyPHW3PbTObUH5YahgKbNoa4Ec=;
 b=BmUOquE++L7QWGQx/MxYFL5bgxVOefVFmVBzvWl6+oTDB2sic98VH9M2UMULRn4XqFbE4BMMC59TYs5uw3gzm2HTOA2m5L5BChxhrcqpJO2GAjzGHoc6djWTy8EZHKPvLIoiNUsR0SFnYo+aHiLTEB9LqoxPZEhTvVK5qxgFhIA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=BmUOquE+
Subject: [Buildroot] [PATCH v1 2/2] configs/zynqmp_kria_kr260_defconfig:
 bump to xilinx-v2024.1
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
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynqmp_kria_kr260_defconfig to xilinx-v2024.1 which includes
the following updates:

- Linux v6.6.10
- U-Boot v2024.01
- ATF v2.10
- PMUFW xilinx-v2024.1

Migrated u-boot to xilinx_zynqmp_kria_defconfig, so uboot.fragment no longer
needed.

With u-boot 2024.1, CONFIG_SYS_SPI_U_BOOT_OFFS has a new meaning. It is now
the offset between the base address of the boot.bin and u-boot.itb instead of
a raw base address of u-boot.itb. This allows for A/B firmware updates since
the u-boot.itb is set by default to a 0x80000 offset of the boot.bin.

Thus, Kria SOMs come with the following QSPI address table.

Partition A:
0x200000 - boot.bin
0x280000 - u-boot.itb

Partition B:
0xF80000 - boot.bin
0x1000000 - u-boot.itb

This patch updates the addressing in the readme.txt accordingly.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/kria/readme.txt        |  4 ++--
 configs/zynqmp_kria_kr260_defconfig | 14 ++++++--------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/board/zynqmp/kria/readme.txt b/board/zynqmp/kria/readme.txt
index c6be22133c..ca3164383a 100644
--- a/board/zynqmp/kria/readme.txt
+++ b/board/zynqmp/kria/readme.txt
@@ -103,8 +103,8 @@ KD240 / KR260 Flashing Instructions:
 Flashing u-boot.itb:
     $ sf probe
     $ fatload usb 0 0x1000000 u-boot.itb
-    $ sf erase 0xf80000 +$filesize
-    $ sf write 0x1000000 0xf80000 $filesize
+    $ sf erase 0x280000 +$filesize
+    $ sf write 0x1000000 0x280000 $filesize
 
 Flashing boot.bin:
     $ sf probe
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 2089c3f355..3bf269ab6b 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -1,11 +1,11 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kr260/kr260.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.2)/xlnx_rebase_v6.1_LTS_2023.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB"
@@ -15,16 +15,15 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.2)/xlnx_rebase_v2.8_2023.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/kria/uboot.fragment"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_kria"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -32,11 +31,10 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/kr260-kria/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/kr260-kria/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kr260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
