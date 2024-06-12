Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAD3C27C75
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 07:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11B20821DB;
	Wed, 12 Jun 2024 07:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPRct1kRKUP6; Wed, 12 Jun 2024 07:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E25C98220D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E25C98220D;
	Wed, 12 Jun 2024 07:56:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1D581BF3A1
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 07:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE66A4025E
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 07:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZk5eoT59rUS for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 07:56:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::610;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5AB6F40259
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AB6F40259
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::610])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5AB6F40259
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 07:56:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DPnfXJAyeve4ehR9In69nSy/wF19wDqmd6L12hpw2Km74d7rsie76i1GTqf74W28vJnlisgn9s3Mq0kwfgdN6yCniwaWu46xFQV8lWwWdfgFU7jfhhjY5pb7fxzk7FtQdG124OQE5yiE44CbYdirBgRbaRTA6AMPQguFTIA0SAR1xm9dgkzr8AZXTg/9rqRjWU/TSkD2v4e6FtKrQkUY/ETi81xGixSn7Z3FAsxg0xeXAXaNLKciGGKDjeNwZbP36y8XOSYyeXSiho5yX8ceFJKvLfr3Zsx1K/eZ3zLIne3IEnSrl8qThZHtg2b4rQsYQ+89J+PjQdASxU46ddaX+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkMqBDwpGco/YElCUsi7NZl12AmymJpBvr2ZyABwB7w=;
 b=B2tR/sC9JiksBtLU/B08ILrpaq+apDVAOV+sXAbR1xsYB70pwxp76efq/eSw3X+VJ6BgLYTh+1hmYzSvSkp256zLBkFL8N3Dgw00onbuJ1zMElqTZx78Jjv8kSMXneP2cdBaVWtPQ/nCISy13llG9WcfnXQFnW8hDXRbiEktfQjBdKVe+D+1MrvhcxNgzqNqe7MPwPXQbn0R8oqmw22u+2hMjKYivdsjGDexmB+/p4R2dqRRcIxZ/rnYp11EhTByq/k9X7222sdOiVThhc7KmbQ88oDWxwPy5lId0Dy/KtJHF1sDKx6Rdf5Vaq3mYqvRwUXnX8RCH3Gblxw9ohd7JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH3PEPF000040B0.namprd05.prod.outlook.com (2603:10b6:518:1::5c)
 by IA1PR12MB6388.namprd12.prod.outlook.com (2603:10b6:208:388::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 07:56:09 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2a01:111:f403:f913::) by PH3PEPF000040B0.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20 via Frontend
 Transport; Wed, 12 Jun 2024 07:56:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Wed, 12 Jun 2024 07:56:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Jun
 2024 02:56:06 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Jun
 2024 02:56:05 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 12 Jun 2024 02:56:04 -0500
To: <buildroot@buildroot.org>
Date: Wed, 12 Jun 2024 08:55:55 +0100
Message-ID: <20240612075559.436482-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240612075559.436482-1-neal.frager@amd.com>
References: <20240612075559.436482-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|IA1PR12MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: 1808c814-6b65-4304-57a0-08dc8ab51e00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230032|82310400018|36860700005|376006|1800799016|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fp0/gEUoTpQiWBBv4pHCpKYichipPA9RMMu1ih6BZb2XlqdYkvWZWE8GmHwl?=
 =?us-ascii?Q?pV66vq4iMHK9pKeEevXKBxFwAAEnbkM0wUQBpEtyucKjcWWgUEXqsdB9XiVM?=
 =?us-ascii?Q?Q1rHPj4DtpOqD9XjUlHMTT+2azgUkJLFSU4N3nKW+W1j4DdRwNggEGcYx/oz?=
 =?us-ascii?Q?vQqytIEiXG4vCPdGmdQp/yJY0tqk52xLVHTqemm4Dbwsb9+exrjEztpUn9YO?=
 =?us-ascii?Q?/U9A1V+mYd/B/mSuhPZaYmezjno9HJjz2Sqr8P2kygVHus4N+K1flYiUwbRw?=
 =?us-ascii?Q?fjTOktjJm3zPFDs+hy0HpFZrURSNj2WFvpZJs9jdm1nJ1TvJK1f3z5LW3L7C?=
 =?us-ascii?Q?DBXh62BPxhMOx4plyv7KorC328GFMQv697hwV7+Arj8EWZ8Wm0SooUBa/qSM?=
 =?us-ascii?Q?GVl3Q9kGRF1I34Q+nyHmAnNFmEOj11J+iLQsEFK6MBs9HJjxudftkMlbFYCt?=
 =?us-ascii?Q?ELyoUM8DKmCDj3lfjiGUjVitNidFqlmxuOJi++X1d40MA6VbcxPLTAqWjUhj?=
 =?us-ascii?Q?PYcsTgvyZp7ZWu1aKzzsrIMIT1rAW5r5u8FXyklGlz9MsVp0VCpY2UpFgBGf?=
 =?us-ascii?Q?MJW3mPkvIuY2Z59mK1dIbGAc0GrLIOi3CMe9aeO9+Cq16nTOqy7K8PF3KB6r?=
 =?us-ascii?Q?er0JRw2NcGDg1Md9ZOeN5k4mliL5BE+dHXJ51/LC667aNnoRsASGoF/ppIHJ?=
 =?us-ascii?Q?DFvE0Gyhzp+EoIc3l0QP3ODjgiFfORY8Fr6QVlUIfqzvQIqZJDiIxr9otbsQ?=
 =?us-ascii?Q?IK7zo5f2yH9m6Uyc+lr5m0nHe0bIL9kK+2P/Vy7TGi5TcXldV6iR2m8fgXTu?=
 =?us-ascii?Q?Q3fHI1+jXXJpZvEUqIeNBMV4XS/Eq9bT0TYDGbzERIeNOMVrqEBDeu++VcYc?=
 =?us-ascii?Q?SqvU03znrFpKLoIEfonQfeqLVFaTTUbfMVV2coKnJuDNgliQvh7EwssYr489?=
 =?us-ascii?Q?Jx2X+P0XuL5v/fFZHaKd3KwEA7Jb1Pu2muv0WbXbFa+f9n/w5rd6ar4Cknu0?=
 =?us-ascii?Q?hmv5bb1SuT6+Gl+ErROwC1rH7EtXCJ4pMPuxONBr3186dR6OMkY7uyLhg6ZQ?=
 =?us-ascii?Q?0VjktIokgk9BYS7ZSJlXdmjOPhLew1FhG/skv8kD8KNlg5mFhS7m1GNDdI0m?=
 =?us-ascii?Q?GNU2bUMwtFqLcvQDu8czwZabicnlgnjlUnr3erqzGNTKhRAS11ICPmokow1Z?=
 =?us-ascii?Q?055bZJiEr/Coy1rEW1dU2hXaDaVeD0JhOd0woAazTOt5HyYUWX82hYeIqqVK?=
 =?us-ascii?Q?jmbaVosus1rGrcgtVwvdmN03vANYU3u+xaIJke3Ip3dJ8AHkkUkJKo92ySC2?=
 =?us-ascii?Q?ekSV9201wA6KZcPnpQ0aZzwqNkCCG8JYAbuHo+mo6l6Pw2sI9sNWV39/MQ2y?=
 =?us-ascii?Q?t3/+2+Uh6Y2maewQk1K7xpHyp8q5WQxRdwM6BYJNqaIcyKqptwvKnSn55Ylz?=
 =?us-ascii?Q?2tsIxxO7h095TxRuYNp9R5O+EAbaQMFW?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230032)(82310400018)(36860700005)(376006)(1800799016)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 07:56:07.4007 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1808c814-6b65-4304-57a0-08dc8ab51e00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6388
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkMqBDwpGco/YElCUsi7NZl12AmymJpBvr2ZyABwB7w=;
 b=5la+3Ee55vdW82yznQowQ3CH4yYexUIGpsYBbN2jfLnCdtWEknWht/DP1T6ybIkbtr9gVoKhA7TOqz76AulhpzgEAeAbmsdayt/YydL7B7ZThx07JYdmi5GQrL8Xx6FPpfuE1iMF9TJYXKchyntC8JHKtK17+BAHgB2caNtx4ZE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=5la+3Ee5
Subject: [Buildroot] [PATCH v1 2/5] boot/uboot.mk: new zynqmp pmufw prebuilt
 option
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
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT option will enable u-boot to
use the xilinx-prebuilt package for downloading a pmufw.elf that gets included
in the generated boot.bin.

If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT option is enabled, then the
BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw will
be ignored.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/uboot/Config.in | 16 ++++++++++++++++
 boot/uboot/uboot.mk  |  5 +++++
 2 files changed, 21 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d0901edc9d..9d275e8611 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -512,9 +512,25 @@ config BR2_TARGET_UBOOT_ZYNQMP
 
 if BR2_TARGET_UBOOT_ZYNQMP
 
+config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
+	bool "xilinx-prebuilt pmufw.elf"
+	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	depends on BR2_TARGET_XILINX_PREBUILT
+	help
+	  Use xilinx-prebuilt boot package for downloading prebuilt zynqmp
+	  pmufw.elf from https://github.com/Xilinx/soc-prebuilt-firmware repo.
+
+	  U-Boot build process will generate a boot.bin (to be loaded by the
+	  ZynqMP boot ROM) containing both the U-Boot SPL and the PMU firmware
+	  in the Xilinx-specific boot format.
+
+	  If this option is selected, the BR2_TARGET_UBOOT_ZYNQMP_PMUFW
+	  prebuilt option will be ignored.
+
 config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
 	string "PMU firmware location"
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
 	help
 	  Location of a PMU firmware binary.
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index b9f165f041..5d12c6283b 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -436,7 +436,12 @@ endef
 
 ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
 
+ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT),y)
+UBOOT_DEPENDENCIES += xilinx-prebuilt
+UBOOT_ZYNQMP_PMUFW = $(BINARIES_DIR)/pmufw.elf
+else
 UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
+endif #BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
 
 ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)
 UBOOT_EXTRA_DOWNLOADS += $(UBOOT_ZYNQMP_PMUFW)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
