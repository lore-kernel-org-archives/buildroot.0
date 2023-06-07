Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D340C7EE23
	for <buildroot@archiver.kernel.org>; Wed,  7 Jun 2023 05:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA3AD60AFD;
	Wed,  7 Jun 2023 05:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA3AD60AFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iG2I7uaHU_sn; Wed,  7 Jun 2023 05:14:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5E0060AB3;
	Wed,  7 Jun 2023 05:14:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5E0060AB3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 719DB1BF3E5
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 05:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26625818D0
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 05:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26625818D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dxXQxuikMfon for <buildroot@lists.busybox.net>;
 Wed,  7 Jun 2023 05:14:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04AC981768
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04AC981768
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 05:14:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RulXi13vY9XXvpv3vIyokuktKl4XyxJSnRqplEMVxCxlfnd6Xqgh45qAjeH4BxB6FPyjCuUfEnD6GNKRgnuua45OX/kWIbYuOirI0xnF0bVJPC/sZW80Uj1ijFRmmfBpgpw/PiR7Hq2OoAgjfhoeAOtm6EHoIolbfDvTSgfMIdSRzIxRr1a0MGlp1ZcUrBJ/86r6jo56lvh7VUCBsMBX4hX0/YM7IonTb6tpgJ0vn8VQxRukhM3UVr6CVYlUEpdb/F1aEYEJq791CxA2idlB10swbh0wrAIkGBCvzEhldXIQIl9fdqjR6kG5K8A5tBk5Aua7uIaTIvxNl+eCEsLhrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+US9FzuQaVplW15h+3tB5PVrkbuHSD6A3Oc7yKWPzI=;
 b=cVKOsu4npZzHcIW9qbkwGZ7Kgt9RmiGMBPSFuhXzfRjC9a99yEQy+oUUjZ48Ui4zBMV4ZWNYO0BAYMsvrfm+oZcQ6BAp68f1VIJfteuVkEEtbr+lOwM+zHua72+N3WQnWP/zUrJKBnqV5v98Gec6Ca6ED2r3pk3CXFW5q/FNlBmgp4XLJQ1QrYRtUs+bfuZdVutdV1gUs5XvIn8BPbtpTVJCdvU59At11/YzgMz0/qIlROewFmFl3wY86TUC5tk8gioGrs2IbrfNxdPUexfOBNeHgu3t/KyfCCGE3KjgYuvdFpeosx2U2qh7a2yo/6o7zIy+2i2blbnJsleKTGOCmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CY5PR15CA0024.namprd15.prod.outlook.com (2603:10b6:930:14::16)
 by PH0PR12MB7839.namprd12.prod.outlook.com (2603:10b6:510:286::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 05:14:24 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:930:14:cafe::e2) by CY5PR15CA0024.outlook.office365.com
 (2603:10b6:930:14::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Wed, 7 Jun 2023 05:14:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.13 via Frontend Transport; Wed, 7 Jun 2023 05:14:23 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 00:14:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 22:14:21 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Jun 2023 00:14:20 -0500
To: <buildroot@buildroot.org>
Date: Wed, 7 Jun 2023 06:14:15 +0100
Message-ID: <20230607051415.532202-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|PH0PR12MB7839:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8ff223-16f4-41af-3c4e-08db67160e6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KnBwjfPld21x47kNyZTGmV6PY6m47/SMjqp4kvyt48KztqSEZmlT+RLCllUOU4+YpXa7K+Zy7fQgYbrCAZNBZQg7gH3HjvtXZlgAXHrNuFxLgR+aYCD9wttXI8exjrOB5hOH2qOmHjIAGtO4fcHCu0NAFJRpMmwY76q/yLxriIpFBIip/7Dyi8TK36iqy+GFT7uwT9bCLwk4SJWnqdPhINc1fsrVWQ6UAp03knMP4i1uXB0brsUcFrXHWIGfrXn2zrQptnAmelMoC0EbHBxDTb8ODYN8rdeIe+FarTcfH9Mg46hXs6RhUPzzP552Ih7g0TdfPGkOA3JdaZR9WtjVZKuUzJ3cJxj2mT3bKUpZECeYb1GL71GnJYJKM2CzY8XIrrq1kGMf2CBUYCdbBSLppZL4PrpbwHsFeQoQDYH7hlSOkjxljp8UeQdbAHNq2J/m/6g2j2nRfgmB4QDOOK9T5pu1CtD68JS+F8/HtUCWyZtVWUN9zc37w1guKTULU6pXsXP76UjHLuLrzhN7NipREiah07/O4I9vckIkUZ8CxtwmfCf0ViJQ5AWVvhz78Wbrd0OxfUvO4FnGMF2QidC8eLVi9KNl1O6aCrWMuNQhmecz7aNHz/xDWT0V3vMLUKxJVISmOGu70BMlsG1ixid/z8nRk9yROZW8Wg9GUPZdpd4jXYQs37CCPL+1o8NjzY7z4wMtJ3u8/ycIvP/nC05GflA+9hZWdHwM9lwo4R+QJ3lc9LvBLMNseTDiqvfXX3cxTjPOBU7BRzbKVI11LjWKTQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(40480700001)(54906003)(70586007)(82740400003)(478600001)(81166007)(316002)(356005)(6916009)(47076005)(8676002)(8936002)(41300700001)(4326008)(70206006)(2616005)(186003)(426003)(336012)(36860700001)(6666004)(83380400001)(1076003)(40460700003)(26005)(86362001)(44832011)(5660300002)(2906002)(82310400005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 05:14:23.1166 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8ff223-16f4-41af-3c4e-08db67160e6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7839
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+US9FzuQaVplW15h+3tB5PVrkbuHSD6A3Oc7yKWPzI=;
 b=h3213+awsfymFOvvT0sVjO6ADrCtKPSYrRAo7Ll1+pBSjiqs/c0uk0KSSIgGy9j5etVzhtUar5vqu79EQRnIhREoKSrS2PBM9vXFEckI8YmpnIaXyxjOCwbYi8k3FCiF4MYyN2o2Lg4Uq0WCoPLJ1FTRdd3tRwGtx7x9JO9p2ho=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=h3213+aw
Subject: [Buildroot] [PATCH v1 1/1] board/zynq: merge post scripts
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

This patch merges the zynq post scripts as only one script is needed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynq/post-build.sh        | 8 --------
 board/zynq/post-image.sh        | 2 +-
 configs/zynq_microzed_defconfig | 1 -
 configs/zynq_qmtech_defconfig   | 1 -
 configs/zynq_zc706_defconfig    | 1 -
 configs/zynq_zed_defconfig      | 1 -
 6 files changed, 1 insertion(+), 13 deletions(-)
 delete mode 100755 board/zynq/post-build.sh

diff --git a/board/zynq/post-build.sh b/board/zynq/post-build.sh
deleted file mode 100755
index 810fe99879..0000000000
--- a/board/zynq/post-build.sh
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-
-# genimage will need to find the extlinux.conf
-# in the binaries directory
-
-BOARD_DIR="$(dirname "$0")"
-
-install -m 0644 -D "${BOARD_DIR}/extlinux.conf" "${BINARIES_DIR}/extlinux.conf"
diff --git a/board/zynq/post-image.sh b/board/zynq/post-image.sh
index 627c8ac41a..ac80b67011 100755
--- a/board/zynq/post-image.sh
+++ b/board/zynq/post-image.sh
@@ -11,5 +11,5 @@ FIRST_DT=$(sed -n \
 [ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
 
 BOARD_DIR="$(dirname "$0")"
-
+install -m 0644 -D "${BOARD_DIR}/extlinux.conf" "${BINARIES_DIR}/extlinux.conf"
 support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 459a3a40bc..586dad8c30 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -3,7 +3,6 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
diff --git a/configs/zynq_qmtech_defconfig b/configs/zynq_qmtech_defconfig
index f536b80f57..793a7967f8 100644
--- a/configs/zynq_qmtech_defconfig
+++ b/configs/zynq_qmtech_defconfig
@@ -5,7 +5,6 @@ BR2_ARM_ENABLE_VFP=y
 BR2_GLOBAL_PATCH_DIR="board/qmtech/zynq/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 3ad8cbafe3..2d1716d400 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -3,7 +3,6 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index a39911b757..aa73380c53 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -3,7 +3,6 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
