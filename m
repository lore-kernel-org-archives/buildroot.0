Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7854EC77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 05:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D545403CA;
	Tue, 16 May 2023 05:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D545403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sz6F03Y98-gN; Tue, 16 May 2023 05:41:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4ACC040338;
	Tue, 16 May 2023 05:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4ACC040338
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E40DF1BF34D
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 05:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C073E415C7
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 05:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C073E415C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ndjDRU1yQ8xR for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 05:41:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE9B5415BB
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::609])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE9B5415BB
 for <buildroot@buildroot.org>; Tue, 16 May 2023 05:41:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADs4JykpQF8H/JeDprHCCuaZzENs+vh/t5MZX/VbyqFqcpjnvKLzwLADfRTMOfcTcohSxsReSXI4j6SEERkfyQIsGWL+BwhbZ2II5lIHy1tWy6ryiXquHd7hmjIg4w6EaYurvOkrB+dC4ErMUNdPzQE/Pj5vO9Vc2f2fLaytBSZ7R55SmTqxNIuQdhjtczntPOdMF4N2Q82BrvBzgfdVNVptz5mufyqnRH3X3rpMFv+mbpMViOgW1+lUN085FDg2kfj9OYYNaKBop+N7har/AM7kinXBrgn1ZP3eLMBHOiBP0gh+HQODoyceUZwRWxufFtuHKTlU49sSkIezQn+GzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJWbMcWpGxvRbNhSaa8QOBqJ2rslZRT9do0dW0k/H80=;
 b=dRwt69tY/zkbXEkVbmlGvFUqkUjW73qZ/nlv507BiYOHuvqSmg/XKlib1c/xtiCaov7q99AIqtNUSlJxrQVgUhjDUZ+khVcLWbUBD0C6XKeQ72d3IzjKpIs5z7RkhnYnaoZxC8DHCKYHhGQK2N36RRQ0xKgGb/LGmJfZXoD0L3pmeMSUbfhzlS0ZfvvH/kPZhRiYSh2F2T2nOpStkg5j86zEq+eFD8j/cxHyZO72eAOTa/jGJ3awTI7X8x28ffSXzFY+NAehYeRe6JsJbpMcQyFjJIrLyISa9rElqQKWAG68xC8kovmjXfPaQpk/zBODFQ28hYMbvc8Hvts0wLfpMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BYAPR08CA0012.namprd08.prod.outlook.com (2603:10b6:a03:100::25)
 by CH2PR12MB4184.namprd12.prod.outlook.com (2603:10b6:610:a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 05:41:09 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:100:cafe::32) by BYAPR08CA0012.outlook.office365.com
 (2603:10b6:a03:100::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30 via Frontend
 Transport; Tue, 16 May 2023 05:41:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 05:41:08 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 00:41:07 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 15 May
 2023 22:41:01 -0700
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 16 May 2023 00:41:00 -0500
To: <buildroot@buildroot.org>
Date: Tue, 16 May 2023 06:40:51 +0100
Message-ID: <20230516054053.22133-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT039:EE_|CH2PR12MB4184:EE_
X-MS-Office365-Filtering-Correlation-Id: c8992c11-f4db-4451-0071-08db55d02621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L2BkGWSXIu7qTQuc/1p96aocZSXKZR2LIQgOkHScJRxrm0vhCbtkUCeQzcSYHawFOsMeXBcZ3LFa1ZJnma4uMka5Uf+3bGkvO3gXPX4Aoyf4hmZkUxhI+sgEyfZdNdTG98GqinnmzRNlMdPduMw3bu8zmDEbgl1IeqrHGp/9iaE6ihDkN4LcU6Ejg/vnquu79AgLdmgzERopIdODupc8usV8FgjZT355IF2yakbPTec05Cf/O+Zna4gK9NVUMPfOwAz8HMesK1AulrydN3lY+qJwZ7BOHOlRG3R5ZxDV8NGOGjg8lNYLydsC5LPxQFjqA0xpiW52qOpfgDrrb59S7EnuSfOHLCkyXSGuPSdXGgZCoC38UBhMEnJ6BggNbcHzgpV5mHIdvYoQFJ7DzkKyRrHS3kfaCpxQNBp/Ff7Jr56PmXQju7xZKz4NooCzWTqJ7GDkZvB9MumixAK/40+MG6APtzpG1deSkFDC/+Oj/sdwMZm/iK6w3aYV3peuKJe8hGRG/8jSUsZoYGM926RwjiHQ9lAkaOCvauSaFcUEY7OlEQ2maDSKQDRNSi+C5Xaz+Bq+eKeGQwI8QEQi2nhb7ATMQ91QilcVwcTpUsRtCm+KttS0YqLhjddRv8dKvhhM/fkxxn2rYXG3UmAZ00/xx5ho48BrPXBc9ozAbz8ifq3L7kakJ/VpMKZbA5xh+X+IbfSU2fra4qNAqXH7TW/IbHiBS+Ja3Uiin3Qw+aj8fcvsAkaAq0OPRrP0n0uB6Doy72ciif1p1h1jfnYqxaAUQA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199021)(36840700001)(40470700004)(46966006)(86362001)(41300700001)(54906003)(316002)(5660300002)(44832011)(82310400005)(82740400003)(81166007)(356005)(2906002)(478600001)(8676002)(8936002)(70206006)(4326008)(70586007)(6916009)(6666004)(36756003)(36860700001)(1076003)(47076005)(26005)(336012)(426003)(40460700003)(186003)(2616005)(83380400001)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 05:41:08.3531 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8992c11-f4db-4451-0071-08db55d02621
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4184
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJWbMcWpGxvRbNhSaa8QOBqJ2rslZRT9do0dW0k/H80=;
 b=UDgtunk1q8zVHmOPBpA43oAz/LBp1y1e4Br56TH9/6jn8TcrzRHFBPQEzCVkESoS/SxxWY0OnPqSD3h9tZ+Qgbf2PWfvm4LiiHF3fvJKB6XwEm0+8y2Dqi4NK6+2OxUwgQTggqZhZdFt56iCY+SYDNAvhUG+VP9xtJTkYPqMcxM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=UDgtunk1
Subject: [Buildroot] [PATCH v1 1/3] configs/zynq_zc706_defconfig: bump to
 xilinx-v2023.1
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
Cc: thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynq_zc706_defconfig to xilinx-v2023.1 which includes
the following updates:

- Linux v6.1.5
- U-Boot v2023.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zc706_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 3ad8cbafe3..55e4d8ea23 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -2,12 +2,12 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -19,11 +19,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.1)/xlnx_rebase_v2023.01_2023.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zc706"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
