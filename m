Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605F2C7EE23
	for <buildroot@archiver.kernel.org>; Wed,  7 Jun 2023 05:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9AA060AFD;
	Wed,  7 Jun 2023 05:26:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9AA060AFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8v1aucjPQDhu; Wed,  7 Jun 2023 05:26:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8515160AB3;
	Wed,  7 Jun 2023 05:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8515160AB3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 046A11BF3E5
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 05:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DED744018F
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 05:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DED744018F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 14jktJugZcAs for <buildroot@lists.busybox.net>;
 Wed,  7 Jun 2023 05:26:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1AA64016D
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::615])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1AA64016D
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 05:26:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJlUOSG5PJ89GFEswbJhWMmqbAuwGKkByyiTUM57wzppoQ5QTyKxIZziP9ZD6ZH0IkkRjRFPArDjy4JalwjncsTeJnBdeX226puaiOV3WxU3/X2JPqnqKPUgeYyXlMnY5iFqx9uytVyScrJeQpfdLVxt9wFoAB2YTbIPNDAIlfZ/z6RJduJt7IUYLM9pPCVkqhnZ9HjCNKOjgPsYeZx6K1vomD+4qypTXI+U7lJtXhjS7iYCyg2s4Z69aNU9Eim3SYtvlIcfJp31XgzYpXm5/wcDXki8HvSqhAukocgjdkHPOZ8iJ386p2vnGo/6361ZtKdovaef5m+1lEimLwW2hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcAUgnbGFZKx3v9jMo1JDHO2BzekmkShb6Ea0qal0vk=;
 b=D9ozgCdo7y9YX1jWzS+MFZBXfN0uiiVZqpT8Rht5V5ci0F43s7CtfpTq8E9nzYPJjOYxCDTuVMkuMiZouXTm1qc+igTP1eVxt5MlZtHAlXkyMkvUibJzDrcA18j2XHX5veN3ruimmg746jbjkSU93H9xZvHYygNedrjJOLxTjzWa8Pct9tT435YC0eQCae5f8RRY9cWJUq117s65Hb8uSviSs8uOUrpJHQj8+0cpr52Rn+5EdwBlmFlFa5ZuQSudmKljopQp4fM67rHSB8ENmBZZGbL2h7OOvYkF6RUtFutvP/REKe3W7HCLHRqH7MPPvPulaPwscta7MDhgMVonyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BYAPR03CA0034.namprd03.prod.outlook.com (2603:10b6:a02:a8::47)
 by IA0PR12MB8421.namprd12.prod.outlook.com (2603:10b6:208:40f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 05:26:30 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a02:a8:cafe::a9) by BYAPR03CA0034.outlook.office365.com
 (2603:10b6:a02:a8::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Wed, 7 Jun 2023 05:26:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Wed, 7 Jun 2023 05:26:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 00:26:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 00:26:24 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Jun 2023 00:26:23 -0500
To: <buildroot@buildroot.org>
Date: Wed, 7 Jun 2023 06:26:16 +0100
Message-ID: <20230607052616.533411-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT052:EE_|IA0PR12MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: 683c0dde-7e41-4b77-dc95-08db6717bea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ol3A+Ujmc6QbpvK55CNpmwSVijloOykQucqpm7bL2QTKYpAs2XpdZxMbNUx3uQZRC1wzysE/G9E1ZRNqne7Zbp/46dOHZH6BgfL5Jon/9iAgKHOsyOwF5pby1qIl7H5NvAsY2DXDE7M4s0vzQhpO0+zpE1O4L5LMMsLJBdcrz7/Rmi7bECuR4B5uUiGhpb0QRf/iCFi7aX5VJXLQNfMlFLRBW0zA/FPBjPFrdB9JH/ut3/lGyEmvrz8WyA7jQu4WX6LieKf4MXRCwSag2BSiVxo1wmp7nPQmhJ/QPmB5DNi7B5+M2dPaa/HVOWQj8cNz4mwXqQn1ve+TNguIInFTfH/iq/Uzzdocpw1M673WV3elJTrz7cR5nCUb1NwtdcRceGRzKx8yN5YnjCWB5TxAcdF3rHKizhzAxcQoZ4mByUNR1Jo4vPwlkHov9a12onl/aEfrmtyD2dQoDJMD+3vgUnoKYfXHbbLIO3z38b42FARFNVXl7Xk9Z/e47rgM6YFcP+H0nVncWQm2/pk8tyq39q5zCmZmRelnyxQFXZHUrqLwZQRWpySnzD3O5OIUvKUKJ1Z9JLUyPrJ9fU/oNzDdngLw9t9lyLimL/tfCZUi4OSdYvrW4yEcuvWZkWKeEBAQ7O7hGm9WOcMl2FmmdokT9RE6JSqyitJDMPXRjLCGj/lQq9tH6R87YNhro3NVOh4cN4VLJxQWJRYWQjH+nEfF4ntm2xkuXqLJWa8hbXZhpoWCbnqx735tLqgVp9XOAQ87ZzXF3UAgje2YHNA1xOmF0g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199021)(36840700001)(46966006)(40470700004)(1076003)(186003)(26005)(2616005)(426003)(336012)(83380400001)(47076005)(36756003)(6666004)(54906003)(36860700001)(82310400005)(2906002)(8676002)(8936002)(44832011)(40480700001)(82740400003)(478600001)(40460700003)(41300700001)(5660300002)(316002)(6916009)(86362001)(4326008)(70206006)(70586007)(356005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 05:26:28.2231 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 683c0dde-7e41-4b77-dc95-08db6717bea7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcAUgnbGFZKx3v9jMo1JDHO2BzekmkShb6Ea0qal0vk=;
 b=JfEEuVvAVcx5rOySdoESdkEuynw4o2wIYkrkMZXJYcsiBd+dm8ztzzWet8wNBPEF3FoqFFZ8fxlu25E7yv1aeeqcB0/S8maqvrqOSNwfHF67Ex+j4kopS+jytT/KGkJVDvnAK04VqP+8Z5/B+boESqOdwWZKyjqfV/fm0M+jAUY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=JfEEuVvA
Subject: [Buildroot] [PATCH v2 1/1] board/zynq: merge post scripts
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
V1->V2:
  - Corrected comment in post-image.sh with system.dtb file name.
---
 board/zynq/post-build.sh        | 8 --------
 board/zynq/post-image.sh        | 4 ++--
 configs/zynq_microzed_defconfig | 1 -
 configs/zynq_qmtech_defconfig   | 1 -
 configs/zynq_zc706_defconfig    | 1 -
 configs/zynq_zed_defconfig      | 1 -
 6 files changed, 2 insertions(+), 14 deletions(-)
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
index 627c8ac41a..463f3ccd68 100755
--- a/board/zynq/post-image.sh
+++ b/board/zynq/post-image.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-# By default U-Boot loads DTB from a file named "devicetree.dtb", so
+# By default U-Boot loads DTB from a file named "system.dtb", so
 # let's use a symlink with that name that points to the *first*
 # devicetree listed in the config.
 
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
