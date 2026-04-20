Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B9AF5A8A5
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 17:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0606181FB3;
	Mon, 20 Apr 2026 17:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 07ERNV4_S-3y; Mon, 20 Apr 2026 17:39:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FB1082003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776706756;
	bh=ZEbexsP8ehVOQRa8/YajpjWfaRJflEMKsu4KtqRIj0I=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=ZTS6h9kPitOFf+EWzY7nJlpPk4KiXJ03Yh0cEOcLJT2D5lJGvdldsCc8UB+9iYEsJ
	 PXCKote47KnOE79uO51H7dEtNU7ym8t+oe70Cy1/0NeeEtkaBVUgOV/UHNboopz2SF
	 IVcR7mwKX2TOmiinv2Nx5SqSEeLtolaEOkGmCJ1NeBw77UD+l7lXXuBucqMiQbk0BL
	 l7jm7h+stivCXbKe/YyHzDpMc3ybYp+yGzcOM+7f1B9AHpYyoH4whltKuZF05J6w/Z
	 A1Iw/8b5cf7zQu5jNwkV7hlsolLwX7JW1pZVWTFYEv/3megUmHTSJnN6uk99Ud9qcZ
	 VaVbnnQDM26vQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FB1082003;
	Mon, 20 Apr 2026 17:39:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EFCE724D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E205340864
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrJBj8BUEtIz for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 17:39:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c005::5;
 helo=co1pr03cu002.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3AEB240839
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AEB240839
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c005::5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AEB240839
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:39:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWGrMviKzwi9i08ObQO7b63oZ8LNg053HvhC8AYoJGF04U0vKM91HBtDjO2WM96E/uJnybR84SoSObU2mkj3ompNcfONMNv/1tWhPteFF5dleDJhx/9WTDILIYuo3oF0wrkWQSJ8GMZff5LeAu26GV12J0sR1F1u4TRNzth8uDJOzqoaV8us9uHcQeHctbPnEaxBVeIgwRdkTivRDeIpZCsjbJCLPrFk0zyPqqGYSllBBO7qfoKZoMyLpd0CzrqJ+RxhXbtSkm/ZDDbAUhASZE8v+5HjAHSDme3xokR9c3wmy4ZeXNaJHSZB0auAeerm19E4or/mAuORqUVbU9gdMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j77cJ0ZgNijB+iuTfzNVYkIEu1RxE3mQ+R68vVmgEaw=;
 b=G09f5NJ38szNWnC0ZMe3aWqZlmZ6zaNW7x/Ai+ZfFvdF71/9BhhifNrOq8nor896GdUXAQbRvfjamua8My3VAPvr7bFfUahiXSHyu8eCqbBfByksrSUxHEJ8gsOoQ8SdgqcgRxs77kscBxbzT10/nLc0BhEB5eiFOY1oPX4u0ldCLPSiGWmITg0WdrCpgbKf8tf6r7KBu51/NmkGv+3Q0Lr/L16Yx7OvpqcEOFBeniq45CTwfAbtJsqOSBXRd7JXjNc1SBrBRdosKWUx/csB64Yn/YOz6p/m5y58hhQHwBvU7OghrS838AuggltWeQ1eYZOPSokK7W+Sv5J19w6u9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN2PR06CA0014.namprd06.prod.outlook.com (2603:10b6:208:23d::19)
 by SJ2PR12MB9240.namprd12.prod.outlook.com (2603:10b6:a03:563::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 17:39:11 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:208:23d:cafe::4a) by MN2PR06CA0014.outlook.office365.com
 (2603:10b6:208:23d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 17:39:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.4 via Frontend Transport; Mon, 20 Apr 2026 17:39:10 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Apr
 2026 12:39:05 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Apr
 2026 10:39:05 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Apr 2026 12:39:04 -0500
To: <buildroot@buildroot.org>
Date: Mon, 20 Apr 2026 18:38:54 +0100
Message-ID: <20260420173858.1655069-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260420173858.1655069-1-neal.frager@amd.com>
References: <20260420173858.1655069-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|SJ2PR12MB9240:EE_
X-MS-Office365-Filtering-Correlation-Id: abfd8673-ac12-4bff-0301-08de9f03bb5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700016|1800799024|22082099003|56012099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: mkpjE2ilj/GHd0PIBLHUOIvCHMaqGyYA35XmqLaZ6AP/mMWMcYv6adeTonIK9VfJ3RdKAwiw1uNe14eXofMikiA+E3g9mCkOZGklRhQdL2suGbmf2vLUT/YzyQBhYXes544tLmxVZAToyTyv3F0q1FJDIXCDVmD9QLFHg8gO1zE0QB29QFHYZieVlBGqbeITlPEauoc7VV6B2jGRgFfXfrrJfqUnjBSanJm59nWeAMj4ECaajoe0yxllyOtlIhLP4xrU0gZD5PX6FUSj3UVXf3OxQeVeZ5W5lzTcP1m39VXgiMft6Kcu6HrWzHb4qlYQ44nzyaCsOlQaOnw44hLq/evkLwnb1ZMhAU3WS7z0xJZaNrAvXFFWiasNnvqwuJR1pxFVZjd5dnyTfTrvJusBMvTKHj6hhULFqcGWi6g9uv0Rd+G6Be+sa7ZhsrrCeZwW/mSZmy/6tr3KafAVmdvGdt0nnutjeX3fFXXsfjO4JG8wfN7y24g0RAPbagWX0wVdr5wVb9Vt5KVIcLQHp5WK7HEzfII1BuIGVV88dHoX3md3Yiexvj4GNUddDT9mR1S3atatVd+LJirh5aquNQ/Tv2GbNdcm0xq0QYcrnG8os+Wtj1lhMbL/It9KgPx0nHtAfFPxrzygW5/dchhAGOhbM891BEvpkizmz9spr6TleVJ8PO6eemZM3+wUVY+gibdz2ZfmW6jvlSRV5yvugaUP1CpXECNANRXLuJ2SpTMZ6iBUPbyP8XbSKzxC3o/GufXM6IaCR6oR2FpQNAuRmi+V19Q/l0vq6X0rlM/X5hUHZkK8xzPpVxxysAmX4wiTOHAC0NytsOZ/yBvdjH0BuITDEw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(1800799024)(22082099003)(56012099003)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: foIteVSrKT4c3Mn3m9WPANGZ98TF2EwM207TWPzXKAKH+O7fVRdqEZ8SKn9cYXhMaB8z8RSbGHpQRYH5yRUD92h5Pnt65b4d7molx9wzL2wu/36n8KkWcutXg3IXvmFzbO6X1kML78MuDn+1co5LfiHelatySD7zu4LWy+5yCDc3P/vmWgxCGutpRw5oH1srgLK0gli9cBug1QG2N/UZRvjgEsdynpfS1XMZvqBO2TcjAE+ewLiCDxedlBKnuTTRFVRP620D4uqkw75quGGb5hHbhCnzqnRlki+UXBmGu/ktqDhn767ITwi5tZzbTDq2P5QETisWyYx4HsybAWZCVVCiarCVQzpfI1GW9hLuI29Kqq54DNvhqsZVhBoREarVwGYVlVo3yk6RxiRCl4o0aPR+exiCRGjQ5TvG1T9quFkMtH+XyOjzEMHKf1j4iyhY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 17:39:10.9929 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abfd8673-ac12-4bff-0301-08de9f03bb5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9240
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j77cJ0ZgNijB+iuTfzNVYkIEu1RxE3mQ+R68vVmgEaw=;
 b=MF88MttnYi6CE8QI8TU1/rf0ZW7IN+ZnVCPHFepmOtXIEe/CB6sQ6qXPOA+v0zlwZrTqLn/j53ieD9rON3mCNR+5K4oMaRToNzNHrmlmD8bPl6eNrVFeL9rjA1p8p7icXeWPsFUM3rn3ueABxRL0Osw6d+ZUkt2n6dURXq5Pwuk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MF88Mttn
Subject: [Buildroot] [PATCH v1 2/6] configs/zynq_*: bump to Linux 6.12.70
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
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the zynq defconfigs to Linux 6.12.70.

Run-tested on a ZC702 Evaluation Board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_microzed_defconfig | 2 +-
 configs/zynq_zc702_defconfig    | 2 +-
 configs/zynq_zc706_defconfig    | 2 +-
 configs/zynq_zed_defconfig      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index f307614337..cc1f001d37 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.70)/xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index 5056d96441..c6022ca670 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.70)/xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 8ec71a2716..94b7880c76 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.70)/xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index bf9fd40e33..0cf1b259aa 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.70)/xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
