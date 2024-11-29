Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7446D6EBF2
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 09:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F3974083C;
	Fri, 29 Nov 2024 09:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cjVnQ0W18Hkc; Fri, 29 Nov 2024 09:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECAD640814
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECAD640814;
	Fri, 29 Nov 2024 09:53:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 93120712
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 09:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73307606A9
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 09:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cxl0HlMct7-U for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 09:53:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2406::62b;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 963BC605C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 963BC605C8
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2406::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 963BC605C8
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 09:53:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbnHZBObKYqyKao70y3KqxhdwjSFmyVjdo0f0Z+wrOBJytzJztZofGdVVVmUj7lTDZePOTFru+JQxRQq9ax58/zBDIixqfAvQfszCcfKh0u9GnN+VBUNkfgZ2n1ekOjyquKt1K/imAkAyvUOcPBLyhsrXJErLUyHatia1HvjTdMqDfco4o1fJe2hz3lbeo/teDRH3u0lKz+vCPWXp8/qYvayjnmPgivu2Cvjp33I+SbFG5tUb5u5TzGoTtumH+QTJK85UCD1VKQMhAtL5C5AIi8ECrbQhWTPjZ5nDVAK2brAyPfRclEPIl8dEZvTbQ7nEqJh8qldhNHGU+kdrPPE1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RKtdophpmFNagUnzBwvHuO3zKo9Lpkw8aBh9tysnwA=;
 b=LgIANAABfaRdNC8moNKnlwvpup7gK46IgXpXa4eQmoZ768DmbXYXIpwTD6xnK/q92L6YVMH55Vw0Uy6YfvqqFELpwcEo7i8GAlHeSw1f41/Es8PVkJ34MOn1fFyJ3SpLCdP1Yc4qmXBJFbjbyuoYdRknCVkmCrdh0TwIaSOlgfy3xYBzVcz4nLyA/KjACrl2HuAUYc5ej4C4SDJvmsk65Phn8ho8RCMZBetwIOaejBaBUCokNAfSgxbSjNIxR2N7nzC8duGHYsBPsZ69u7ZY9PUM6icz1/n4BYQ3PGYghWnPr8nnttF36WvBE2VhEbZWHG4aLm8ph44XJD/wC1pB7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0P221CA0045.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::15)
 by MN0PR12MB5955.namprd12.prod.outlook.com (2603:10b6:208:37e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 09:53:21 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:11d:cafe::8c) by CH0P221CA0045.outlook.office365.com
 (2603:10b6:610:11d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.13 via Frontend Transport; Fri,
 29 Nov 2024 09:53:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.0 via Frontend Transport; Fri, 29 Nov 2024 09:53:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Nov
 2024 03:53:19 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 29 Nov 2024 03:53:18 -0600
To: <buildroot@buildroot.org>
Date: Fri, 29 Nov 2024 09:53:03 +0000
Message-ID: <20241129095304.950313-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241129095304.950313-1-neal.frager@amd.com>
References: <20241129095304.950313-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|MN0PR12MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: 658ac852-8005-488f-5303-08dd105ba84b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ofIcE40ImoW1L8TmrrGEI9wTfhbJdV+/aYOBanjTIRZmZRoC33xy6ZhEDEC9?=
 =?us-ascii?Q?Rf6Jgt54Sv+hFZcJneb6EFBCjDzLudevGdH80+nWikXoUJkgBFtlmSXMZtbk?=
 =?us-ascii?Q?gAIeHzO2GAvVgHCPumpMuyJVez+L+K8sg4/HNW42yu7h/KZ31AN1CbQly3f3?=
 =?us-ascii?Q?+3vUACUb3cK2omMehYRTHOpDcMpasaC/6oCN29T9mkaeYlj9FC0qZKt5T+jm?=
 =?us-ascii?Q?d3HeclkzDt37bJZ3Hnen1HOBgHyZ4sd2rX0aM7l4UlGtfmEQ6ZaD9RRKzDso?=
 =?us-ascii?Q?akqNQLrNQ87W1zf9jauBAS77f4+5IABYTFE1/jYyjleOWBdKkKafTQkJa+EO?=
 =?us-ascii?Q?0CRsgxBxXr1v88my98vgGqhaMMW25UBU9sfAgbmgEs3sBnP+ubW7TjAnPgsy?=
 =?us-ascii?Q?vegxpRrY6YRmh7bDaNk3SyYsuLDAkGvAcxH6/AnnFY3YgnK/p0/LhIQKeOmT?=
 =?us-ascii?Q?GUKDl59yyWfEDoCR7dSlcz7dT0JHjvJw8kYomX22v+FBWg/nJ31g7oKn9cEz?=
 =?us-ascii?Q?sHiW6GBHWCUHv2ltMLZWnz5P6IEGI/ORulXhCmtuRd8obcx5N7OzeGd4JDJr?=
 =?us-ascii?Q?raDmwHApwqEYf5LVP4YTyiDyl8sTrXa4ce6xWFKC9bSifGvgmefWD8yM/2GK?=
 =?us-ascii?Q?6jjqkKjpAuV111BBIY37GQN5v8irp5Uq4+08XZsbOiBksa458wKI0UVE6l7Z?=
 =?us-ascii?Q?ly1MLOA2L5c54ysVfDni9lJ2YQibCQUMp+IZkD1W4cRIwyZUDrt+Myx7COs1?=
 =?us-ascii?Q?vd6kvxgcSQtgVC4G5IIE7pVV9pwFZREwOP2VlhV2ZAxYc5f3zCz4obyOmtaE?=
 =?us-ascii?Q?c0Bxf34kZy0ouA9GnrhHsvXvCXLizoFG0L5Mcp0qEkO9RVyjW8EeRzYEyA8R?=
 =?us-ascii?Q?A/N270Lad2+/+gj+Ac/vyGlA2VbkC9n4/7hSEvjeEEmk/zD3uJLSAcos/VG6?=
 =?us-ascii?Q?osNHh/WZ+xEBIJFOnJVrtd/iNFC0w3ukj+mue9P5V/Gd7szUylSJBGdw3Czk?=
 =?us-ascii?Q?ACJe/ZrgmnObdVcPH6hL+4USTr/8p766Kq3IafBPJnMb/QfXUfUzvXMSiCQe?=
 =?us-ascii?Q?oacjHkAZ1V/sTIbUCGa2OSa61lasou6zmy3YAIZXY2q5dueJenFeXBuSiyXL?=
 =?us-ascii?Q?jweURoWz/zuq0g/0DeQF1ovxHGlboTIHDFWpWmA1thicanhk8EtuYvcUxwYL?=
 =?us-ascii?Q?cjIafgw4KIqgwO5hSQdYwP8GmmjqosS4M0iY5gCwC8yLODSsz0G/9B1hraYn?=
 =?us-ascii?Q?Ds9y/cnsnf+oZTvEmeAsLgMpGxGlQ2ixD0jW9SGV4zSJ0gT0MMiFUi50FQNK?=
 =?us-ascii?Q?ftfjr0pB3moqttA+fn7hcu8D/EvD+1YEbXktSneduAUJRsN02q9lMV7RGxny?=
 =?us-ascii?Q?UPiprVH/Q/AAyMRs2qzSquFE1a8ud2Ideuk1dLYeUrz+J68WGZ3UCyGNSy4Y?=
 =?us-ascii?Q?xo1TWneDGokwkXOTMuJfs29jL6NjtIMWFXc/ICliGchnv6JfePDv8g=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 09:53:20.7118 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 658ac852-8005-488f-5303-08dd105ba84b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5955
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RKtdophpmFNagUnzBwvHuO3zKo9Lpkw8aBh9tysnwA=;
 b=DdAXAupY8iUJN3inAklzj7K5y0JyEQ7NWhV0mGEyQVDl1NAVm1LIB8lX25nc6GGzP83mIxYyLUc7i8BhRzOYlPQrlccSK9o1O6+HDO19vjCWVlqGIlCsW+ut6puTJ0sbN9LovVBnt4JVRHRfc0fv/vELJgsjzwU5qFNMKI0n/ck=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=DdAXAupY
Subject: [Buildroot] [PATCH v1 3/4] configs/zynqmp_kria_kv260_defconfig:
 bump to xilinx-v2024.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynqmp_kria_kv260_defconfig to xilinx-v2024.2 which
includes the following updates:

- ATF v2.10
- Linux v6.6.40
- U-Boot v2024.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_kria_kv260_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 06efa86e14..9aed096e5d 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2 ${UBOOT_DIR}"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
@@ -17,14 +17,14 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.2)/xlnx_rebase_v2.10_2024.2.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_kria"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
