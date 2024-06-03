Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4C2C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 12:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DD0D40363;
	Mon,  3 Jun 2024 12:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJcF5yi7PWC5; Mon,  3 Jun 2024 12:00:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EF30405CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EF30405CC;
	Mon,  3 Jun 2024 12:00:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16E7A1BF383
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 12:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03BF6405CC
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 12:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GU-kv-nRJvku for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 12:00:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::600;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B14940363
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B14940363
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B14940363
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 12:00:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g15sr6g4GgPXqLy7QI/Bt3fkVQVe95gaR+08pW583lb3MfJSpPhe5wtl+eHkQibu96iLFjyjMEmPX9/EczasootqZUAAFp8BCP2lsePUwLH7Zy8vx+WSWl5UzrGV8Ir+Y7CM7WLMl1jcSfX0BsyEASjRKJJFp8kK52Q3PytaDZSmMVaiOROpOGNYe9BWMfn9M16zeONuFBilTi9EQVzYU5E5RxyYO1M/jZcLpIYPnfBlivMlDHe+UNGz5MROnHao5yijS7uqlE2jWtrozwJCnH+OUYpxUAqbQIi14bzo+WBhZwJHnOFhlYlDw/mThU+TELFlbChZryUr/c0zrAeq0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFUkLbJXm+6ZkjAxEwFVxW50h6WebBUaxjgUnv6L44s=;
 b=jZAP3JDvljeGVAYwIpwaNOVfw5sIJWnSU+Y9OA9xEw+y1jD8tJ3kAI21CvsfZXglVgwHWBhs3Og0TNaS4RtpHBNJZfRvWn44IUMgNdAGNR4wXth0AIYE7GxvmmvKz4Y8SqrAFFV6oSvDFokoYEtoI4vcK7dctSvLQVVUX3hxvmFdLn/yvMW9dLTCICJaRpArZywn8Qo3Gm2DaBeVC5/5GoQsFYW6JV69OyPavqGLU3zfEc5ZZ52OARI7yFPHm88ZvVVWQY44JpGe1ABIKIP1q/dEnh8yiOBD+sONt8Ggw/gwk6i2p3uedc6ycwXHZLZI4yG0YP5lGvOxsST35wK8xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BL0PR03CA0004.namprd03.prod.outlook.com (2603:10b6:208:2d::17)
 by SA0PR12MB4349.namprd12.prod.outlook.com (2603:10b6:806:98::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.26; Mon, 3 Jun
 2024 12:00:25 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:2d:cafe::a6) by BL0PR03CA0004.outlook.office365.com
 (2603:10b6:208:2d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30 via Frontend
 Transport; Mon, 3 Jun 2024 12:00:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Mon, 3 Jun 2024 12:00:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 3 Jun
 2024 07:00:24 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 3 Jun 2024 07:00:23 -0500
To: <buildroot@buildroot.org>
Date: Mon, 3 Jun 2024 13:00:20 +0100
Message-ID: <20240603120020.189821-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|SA0PR12MB4349:EE_
X-MS-Office365-Filtering-Correlation-Id: c4290493-a615-4ce3-ae51-08dc83c4c094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|376005|36860700004|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yndTger37p5/KHXnxhjjqOHEDI1ki90RdzmoJbEgAhV4S7BbBloahoEK3fdM?=
 =?us-ascii?Q?377dq/pqf/xZSg3R43uJULbX9Gh1LazDbBK+EycQDbzRBSeO4BUlGgEIJyD9?=
 =?us-ascii?Q?pkLlbp8kap1OTz89K5D2pjcpN+p9y9vs99E6dRssReMiHaAzJgfy65MsnmZ1?=
 =?us-ascii?Q?lCXXMaInfrMswoVNyjcQki4y1IDEYsBQ/EcdBQEmq9+dlqw9sx54+4EuyrM+?=
 =?us-ascii?Q?afh08hoVU7cffoEsmxzYIxSql78/aRvI9oOtYDx2ddmIQMzzDQBdcOj7ZCzp?=
 =?us-ascii?Q?Se2AMbqX+b7OMuohfBP4fyWwm/sldiKK8nKGcwezAe+43hkEy3PV1xouhaVE?=
 =?us-ascii?Q?I9RIqkUWYmqQVNFBeDeXV8rfitdV1g8J0uJQB+8yUigEvb17fPHHxci6hktx?=
 =?us-ascii?Q?frILua/KzNVDV9wPCrsknc5ZN4jg4vwKr6eF4BkyNQkNU++uX2tBhm2vcO2P?=
 =?us-ascii?Q?Yc4BZtInSJ3vK30TsLJGeAzdJAVuYn2TM8vKsLZ1hBUpAdkoos5qpnedYz9l?=
 =?us-ascii?Q?U3hqVAQSZXLn1n1twjLsMrH+UgKmDG4impZzRnrgwgTD2Vl2f1mG2X79l45B?=
 =?us-ascii?Q?YxpPdHdH7YGow25JOlk8UZCnETk3UnqVOATUsi8gKgw+hn7wD/sqEzCiKhgp?=
 =?us-ascii?Q?RiAJ30lHEVYAt1ogzQT9q4BH9AguihDxwofyO0u5azPGd4wrKmYUnDTfNy68?=
 =?us-ascii?Q?4YUy4RTTEzRUfbTrb7UFwNGtw1uNj/zuOGG4cAXd+fRbrRMPi6hTiCdnm/tg?=
 =?us-ascii?Q?Ydwyh/aA8HqrIlzNPk6CtjKMz6Zm+HcEIN9HUgJv5NlGpCpG73Z13kV4sO1o?=
 =?us-ascii?Q?Dj5ilNz9QxUlKGnytafLmVNC1GJy3SaM7lIhDHVhlhhq06t/asJ+duWwKoSq?=
 =?us-ascii?Q?BdXsTXah5PXFylgU9uXWtRs777c9wTgD/Oo7vkqFKf1ZDIQnSNn7mDFkfsRt?=
 =?us-ascii?Q?L7+yUpNOL4TLBeiTXrKhurQF53cQvRiCDDz7TAC9VP/E5EFep89eTYGpTdd9?=
 =?us-ascii?Q?p2QMziRON7xnAZbyAgtljVAEGkfsJbrVLP/IHjJkMTuHo4Y9X9NVgUE/6djf?=
 =?us-ascii?Q?f8H1sxo9/3ltr0s8kWIh+X2ljDTf099S/DKuT/9K040tV2ZeZ3CTjUl59cSB?=
 =?us-ascii?Q?JET8FYUxW00MEa62mOVF7qpw36yqRB+U9aChcpiQ54ZwJFhJYjEzBnBpIpmO?=
 =?us-ascii?Q?YLagDe1u2xYs1PKXg7sfxLgSxhspClP80n8O1hC711ap7RT5lmMj+AzcgR+N?=
 =?us-ascii?Q?PX1EPlaJ2j2lhV1YjNfcsHNaT2gtnEV8hrZY+Bt1/KEX4fqEofvF7IWc6Bmb?=
 =?us-ascii?Q?g5RFGb4jod16CxwyIZtYqmQxrRKgP3fTB65u6ETwD5RJ3FWXdEzWr6O4eQVe?=
 =?us-ascii?Q?pFFSsc7izMfvXZQLxWTI3KVgqrOj?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(376005)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 12:00:24.7097 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4290493-a615-4ce3-ae51-08dc83c4c094
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4349
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFUkLbJXm+6ZkjAxEwFVxW50h6WebBUaxjgUnv6L44s=;
 b=ZEltKEjsIXZm8S6rkZ31ya/bD5+hBiB36QGMQKNTI4X1WQN4yLqpePMMEMGL1H/6VUSq9i69Mm8AILZi5vqbZtZv3BDmBxpYBn7HzDlxDc7Lck58nHQUXqhiRTktdv2jAIt0dz+Nj6JCBzD8Fixf/o7ITCMJur6M3LvfTcQSE00=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ZEltKEjs
Subject: [Buildroot] [PATCH v1 1/1] configs/versal_vck190_defconfig: bump to
 xilinx-v2024.1
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

This patch bumps the versal_vck190_defconfig to xilinx-v2024.1 which includes
the following updates:

- Linux v6.6.10
- U-Boot v2024.01
- ATF v2.10
- PLM xilinx-v2024.1
- PSMFW xilinx-v2024.1

Removed ATF patches that were needed for ATF v2.8.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...-build-add-support-for-new-binutils-versions.patch |  1 -
 .../0002-build-tools-avoid-unnecessary-link.patch     |  1 -
 configs/versal_vck190_defconfig                       | 11 +++++------
 3 files changed, 5 insertions(+), 8 deletions(-)
 delete mode 120000 board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
 delete mode 120000 board/versal/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch

diff --git a/board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch b/board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
deleted file mode 120000
index 8ad996914b..0000000000
--- a/board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
+++ /dev/null
@@ -1 +0,0 @@
-../../../../boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch
\ No newline at end of file
diff --git a/board/versal/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch b/board/versal/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch
deleted file mode 120000
index fecdee5449..0000000000
--- a/board/versal/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch
+++ /dev/null
@@ -1 +0,0 @@
-../../../../boot/arm-trusted-firmware/v2.8/0002-build-tools-avoid-unnecessary-link.patch
\ No newline at end of file
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 8561b6641a..ecfc10cc91 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -1,12 +1,12 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.2)/xlnx_rebase_v6.1_LTS_2023.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
@@ -16,7 +16,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.2)/xlnx_rebase_v2.8_2023.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
@@ -24,7 +24,7 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
@@ -33,10 +33,9 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_PACKAGE_VERSAL_FIRMWARE=y
-BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="xilinx_v2023.2"
+BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="xilinx_v2024.1"
 BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_BOOTGEN=y
-BR2_GLOBAL_PATCH_DIR="board/versal/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
