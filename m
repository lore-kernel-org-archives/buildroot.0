Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFB4C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 22:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 066A981C46;
	Sat, 25 Jan 2025 22:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AqZyOUa9Y2jn; Sat, 25 Jan 2025 22:50:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92AAF81C26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92AAF81C26;
	Sat, 25 Jan 2025 22:49:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 709FD94A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B1F0408D8
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjgPml7hB0Ov for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 22:49:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2409::624;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E18D340884
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E18D340884
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::624])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E18D340884
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:49:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9qYozzl46ny1squ8zzO0SoNwd7cWLyTbDAPxk8tK/siTM2A+znrbHgsLLvVzW3KCtHeCt/oUiXsBmtUsTUOfODEwSi6fBLA5ofQE95vmrIRmqtLMqa/gYSyJoEZYocoVLOC7J7Wof7s1J7nPE87UuqdfuIGSr2aFsfoshQeL6fe3NeD6gO9gb5kOEX3tECM+t9dc21y+xV5WgNnn8wYzDzJRlVjL93rx/1+YMuRUdKIPowF1uG2aG2RbEUpjOHUjKWz2YEf/ROIlDm11Mp35j4CY2W2k7A9fl5zn0O0eqJxVUWzSiKFG/4uS1fNAgIknqFpSN4NRQ2OhGZpBhEnqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bELilYa7rsxdexT9gaDJk+fWylaw85n6uHGsL5KjFlY=;
 b=ZBRz4kNapfOozQCsbx9m0CPTNbWjnRcOxxpSrlIu5FTTz+9ChLIKYWnwIW0rGQ1O0RbYPdRegdE+d3J92ZtVD/UolvI9s3u4tApHz9hYsglxnJEXft58lWEnClNlYBvB5CG3qECEcQvZSJEPCkBvCZVumflVL9hNI+QVtJ8wrpJOSrzbXNo+u7Ka6PH2DN1G9yaPx4c9FkdcRMwd49LdMvN2Ay8gl+NXWHgZwvCBYJ/3Uyv4AwY5CQsqapRlwXmjzMCKAGK+fWIuRAo2aHziL52lP8+KClPpzQH+w7korcGQDKZ6bkW2oaepWsSxWYkNfjU83sNmDnSyigD5lQSwjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0119.namprd03.prod.outlook.com (2603:10b6:408:fd::34)
 by PH8PR12MB6745.namprd12.prod.outlook.com (2603:10b6:510:1c0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.20; Sat, 25 Jan
 2025 22:49:45 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::93) by BN9PR03CA0119.outlook.office365.com
 (2603:10b6:408:fd::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Sat,
 25 Jan 2025 22:49:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Sat, 25 Jan 2025 22:49:44 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 25 Jan
 2025 16:49:43 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 25 Jan 2025 16:49:42 -0600
To: <buildroot@buildroot.org>
Date: Sat, 25 Jan 2025 22:49:28 +0000
Message-ID: <20250125224930.3639111-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250125224930.3639111-1-neal.frager@amd.com>
References: <20250125224930.3639111-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|PH8PR12MB6745:EE_
X-MS-Office365-Filtering-Correlation-Id: 55f8dd08-6c46-4526-bc3f-08dd3d928fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?45ZS87GMzScixJxhovAAdErjLWys804NcYBCRC+Yg1iNwNVMfNN+kROdjJNH?=
 =?us-ascii?Q?GdcaGrYRW1DT+qaVJW0d304KIET5DdQq2jvPu40rgKob9Zj65FjAhBGqT7dz?=
 =?us-ascii?Q?kgd8anQlso6aE4Wprlptdi63/MspLQFCNWw6zB+VhkYt6MBxlhyZS3Q08tSz?=
 =?us-ascii?Q?jJIzXtnCGv1rr6JREkielrm5161BMjUqw95ZvvbxoKEDWRVwhCec6mkB6bCD?=
 =?us-ascii?Q?NMA/1AoUCB2sP+gXAynLzTdx/pF7puBQN6Q/gvVmawCnuDvbTawFYiOPf6gP?=
 =?us-ascii?Q?k2C2/fljajefnlaEY8tnHlCN1u6s9CHtzQXx4HyglAoOFWAO8M9mVEdwLn4W?=
 =?us-ascii?Q?F+6mpZ8PL3bnpDHmUQIVfb+Vkq3zxBxqObVvfNdr0EiT8UJ3mMhDHU68MIOW?=
 =?us-ascii?Q?CnzLmBJpcS+HfNOx+fDfEYSuzqzePI7bNTSn3/zXccvAuWZoUzlhQaj9E0kh?=
 =?us-ascii?Q?SQOuTB3598R9WZAmlaHKSPE8E5rNQP+YLrFGhwfOUApT0MCBCQxGBoMcIWNt?=
 =?us-ascii?Q?CZCki3yX0QO8L0YQ1WkgIPcbxPGM+i8A6yFtShezyCknaux/GBMgEHNJOzvR?=
 =?us-ascii?Q?0IHTDiPBloIdR1Ub65nKMk9M20SQBNSdy+hQ9Q4mj4q5bnOVB0C42HiDvgnK?=
 =?us-ascii?Q?bulTVOmIAI1RHawhAbFWmZp8QnlRoMzyLjlHAE5yc9aWn2YeOimHFLRm1UxL?=
 =?us-ascii?Q?GbhQaS6KrJzwjPveQSiHD9ecdHLOvOJTOSjKhwigCb7KRBcIL0J5/gjsbKjG?=
 =?us-ascii?Q?Iv/IAFMfYb9U6wmef55fTILG8sw035w58Q6km5wQ25ZgEv5l7wPzeOh/uHp7?=
 =?us-ascii?Q?x2aghb0/wH+ps98+0HNKsMmIralizWRibpCm4tP56gunWNYRGhxgZmljLw5P?=
 =?us-ascii?Q?FlQNep3He9Da5t3gQ+iV40XuSVSaa/eVyEvTIc8soWpg5rbKSTHqQSA9WDVw?=
 =?us-ascii?Q?xra+Kc4VB6x9MxoXF/srUp0BK0MhvlEcrG6rV0xQj/dMr1t9+HkhM6o4im5O?=
 =?us-ascii?Q?rOr2JmWxThyQsSfaZZkiaON7awF4wasMFKi1DxoUosr8rgb93JZNCgxvA7U7?=
 =?us-ascii?Q?jzK92Yu8YziDeDyZ9eh15B4EKEwsGCdSjta5X3+q61aFMA0xvcQVOoiQkUFq?=
 =?us-ascii?Q?bk5mSSe6qy4z5VfREMqHJCE/6FuEP/d+cXbVO+ZFnwD0kbStIHDalYqkM6RQ?=
 =?us-ascii?Q?ElVUiBoak1mHMVoSPVfqSpOwrSN3glPKG766lhFUcVaS4ESp8xhjSyC1G9X+?=
 =?us-ascii?Q?0a3SjlzuFL2E23l8lDIP4Z4aEDKzV9qEoWfpgPRcRuG/IqknrFQG/wGYNpF4?=
 =?us-ascii?Q?vhHZukJPPiHNlM4NY/d0PRqIsbh+PcvGnWPewfNCszNDm4W2siHtkMljXyqJ?=
 =?us-ascii?Q?DJXtdfj9gJwHdmBp65bEPEQbBH8bZjY1QH8+UbOtcvNW9wLWmPa/WqYjmDj+?=
 =?us-ascii?Q?8V0pkxWgNIsc00Pe6bgN4gd19OihFG1hVL99OdcrVLiDOIyWSnwWPhst5OPd?=
 =?us-ascii?Q?Hcvu8jPptGWNm/mrk/raqpZv+0ghyXyfT4vL?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2025 22:49:44.2055 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f8dd08-6c46-4526-bc3f-08dd3d928fc1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6745
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bELilYa7rsxdexT9gaDJk+fWylaw85n6uHGsL5KjFlY=;
 b=u9WLJ+qznzl0UrTKY4gsQ97We0MIn4sOs/wwYsJ39DGwemfqScGDh5I+LZht3SWkyHbSHy7zg3DGdRbUivCg9ZhRGtM0dyZ93AiMgtkxyHZcVAhuN0JbdQHCMMehFLBCEAtM8ShQ5kEc4djjdj3Gu4Cqhe5yiClWSPvCBtDqZKo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=u9WLJ+qz
Subject: [Buildroot] [PATCH v6 4/6] configs/zynqmp_*: migrate to binman
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch migrates the zynqmp defconfigs to binman applying the necessary
upstream uboot patches.

With binman, u-boot can now build the correct u-boot.itb files for kria
natively.  So the post-build fixup scripts are no longer needed and can
be removed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - new to patch series
V2->V3:
 - squashed patch that removes the kria post-build fixup scripts
V3->V4:
 - no changes
V4->V5:
 - rebase Buildroot for zynqmp_kria defconfig changes
V5->V6:
 - rebase Buildroot for zynqmp defconfig changes
---
 board/zynqmp/kria/kd240/kd240.sh    | 16 ----------------
 board/zynqmp/kria/kr260/kr260.sh    | 16 ----------------
 board/zynqmp/kria/kv260/kv260.sh    | 16 ----------------
 configs/zynqmp_kria_kd240_defconfig |  7 ++++---
 configs/zynqmp_kria_kr260_defconfig |  7 ++++---
 configs/zynqmp_kria_kv260_defconfig |  7 ++++---
 configs/zynqmp_zcu102_defconfig     |  3 ++-
 configs/zynqmp_zcu104_defconfig     |  3 ++-
 configs/zynqmp_zcu106_defconfig     |  3 ++-
 9 files changed, 18 insertions(+), 60 deletions(-)
 delete mode 100755 board/zynqmp/kria/kd240/kd240.sh
 delete mode 100755 board/zynqmp/kria/kr260/kr260.sh
 delete mode 100755 board/zynqmp/kria/kv260/kv260.sh

diff --git a/board/zynqmp/kria/kd240/kd240.sh b/board/zynqmp/kria/kd240/kd240.sh
deleted file mode 100755
index 2203536a52..0000000000
--- a/board/zynqmp/kria/kd240/kd240.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-# This is a temporary work around for generating kd240 u-boot.itb.
-# The problem is there is no way to currently configure u-boot to apply
-# the carrier board dtb overlay during build, so all kd240 carrier board
-# drivers are missing.
-# This will be removed when u-boot can build the kd240 u-boot.itb natively.
-
-UBOOT_DIR="$4"
-
-fdtoverlay -o "${UBOOT_DIR}/fit-dtb.blob" \
-	   -i "${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k24-revA.dtb" \
-	   "${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kd-g-revA.dtbo"
-
-"${UBOOT_DIR}/tools/mkimage" -E -f "${UBOOT_DIR}/u-boot.its" \
-			     -B 0x8 "${BINARIES_DIR}/u-boot.itb"
diff --git a/board/zynqmp/kria/kr260/kr260.sh b/board/zynqmp/kria/kr260/kr260.sh
deleted file mode 100755
index ac49fa5ee4..0000000000
--- a/board/zynqmp/kria/kr260/kr260.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-# This is a temporary work around for generating kr260 u-boot.itb.
-# The problem is there is no way to currently configure u-boot to apply
-# the carrier board dtb overlay during build, so all kr260 carrier board
-# drivers are missing.
-# This will be removed when u-boot can build the kr260 u-boot.itb natively.
-
-UBOOT_DIR="$4"
-
-fdtoverlay -o "${UBOOT_DIR}/fit-dtb.blob" \
-	   -i "${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb" \
-	   "${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kr-g-revB.dtbo"
-
-"${UBOOT_DIR}/tools/mkimage" -E -f "${UBOOT_DIR}/u-boot.its" \
-			     -B 0x8 "${BINARIES_DIR}/u-boot.itb"
diff --git a/board/zynqmp/kria/kv260/kv260.sh b/board/zynqmp/kria/kv260/kv260.sh
deleted file mode 100755
index dc92c51d43..0000000000
--- a/board/zynqmp/kria/kv260/kv260.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-# This is a temporary work around for generating kv260 u-boot.itb.
-# The problem is there is no way to currently configure u-boot to apply
-# the carrier board dtb overlay during build, so all kv260 carrier board
-# drivers are missing.
-# This will be removed when u-boot can build the kv260 u-boot.itb natively.
-
-UBOOT_DIR="$4"
-
-fdtoverlay -o "${UBOOT_DIR}/fit-dtb.blob" \
-	   -i "${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb" \
-	   "${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo"
-
-"${UBOOT_DIR}/tools/mkimage" -E -f "${UBOOT_DIR}/u-boot.its" \
-			     -B 0x8 "${BINARIES_DIR}/u-boot.itb"
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 6a6ed87dff..139ad7157e 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -2,11 +2,11 @@ BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kd240/kd240.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
@@ -33,6 +33,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index e679010d8a..700b378bd2 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -2,11 +2,11 @@ BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kr260/kr260.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
@@ -33,6 +33,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 353ec165d3..4dd0226c33 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -2,11 +2,11 @@ BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kv260/kv260.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2 ${UBOOT_DIR}"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
@@ -33,6 +33,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 5be8947ba3..2a316958f2 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
@@ -32,6 +32,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 64d177b8d1..4574898d72 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
@@ -32,6 +32,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 6fa078a84f..d6e2617552 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
@@ -32,6 +32,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
