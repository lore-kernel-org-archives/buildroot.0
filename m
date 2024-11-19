Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B17D44160
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 13:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2F116FA31;
	Tue, 19 Nov 2024 13:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JdeSQl83zkei; Tue, 19 Nov 2024 13:46:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF3276FA33
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF3276FA33;
	Tue, 19 Nov 2024 13:46:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F741DB2
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 13:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C6366FA30
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 13:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CClQItbUjhFc for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 13:46:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::61a;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A9146FA1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A9146FA1E
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::61a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A9146FA1E
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 13:46:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQMBMNPKQGIoEZ8AAFSKJwnaAUicLcMBjU98qsVWgW64jIWCgfTwc1rXHOXvd0aaNUZgtsaye+pmqn7kAcsl5b09HG4gZSthw8oD5+ERFdpjP7tlpTXlZMFzRXIE6O3A2k0UUb8Yg1qOLhAAGm5ZM/w343FTzj7rF1ZCRZt4Cw5e2v2GyJzwE9uTnzpRzY1EUGtvyqB+ShEk+UadZ1p0LrNX6RUW5FtWx5JicF/e4qKx4FvmcaCfRm1q46O4vD1z66414KWXmaoWyGEqJyiwdtivIbVS+SJI3TlV4B8ryKpir5q4Hcz3xLZbUjbUEkeLPIE3vrtNuAFYuvIyLWcIPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZT7vdNuYWga1zM000hDJZkDdUG7SkVF/R6KRgDDhfX4=;
 b=Ixnd+cdkKEPN2caloOYUVbiCHrcG/pQx4jtDC1xmIlqkJIU5UkTCr/lyzgm6r17NU8IstTs3YL8a5wW9xVcWfDwgwNk+ZinaXKDfjSkWK/wCVlc3EUxcGWkC/aE5YhM4th6Nosg4PS2ne5e9nQ5Wlqs3+b9C7RzshYrXrCI5Uuj/MbeJndi4F8BAnl0jfnIzyu+wOky5j5jbUyfAP3eqgs+yOgc7l9kvLc7IqfoRgX2vCOVTo3gR8uGdFh2CquBFywnaCX2AiZmqsIc9cWqIHGavQOhNZcm/PV/EESTFclUMoGGMH3JXvlgWUS6GEkjHQdF/BWCXu/GLRAevuQfGBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR08CA0018.namprd08.prod.outlook.com (2603:10b6:610:33::23)
 by CY8PR12MB7489.namprd12.prod.outlook.com (2603:10b6:930:90::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Tue, 19 Nov
 2024 13:46:16 +0000
Received: from CH2PEPF0000009F.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::78) by CH0PR08CA0018.outlook.office365.com
 (2603:10b6:610:33::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23 via Frontend
 Transport; Tue, 19 Nov 2024 13:46:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.12) by
 CH2PEPF0000009F.mail.protection.outlook.com (10.167.244.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 13:46:15 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Nov
 2024 07:46:15 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Nov
 2024 07:46:14 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 19 Nov 2024 07:46:13 -0600
To: <buildroot@buildroot.org>
Date: Tue, 19 Nov 2024 13:45:58 +0000
Message-ID: <20241119134559.3891625-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241119134559.3891625-1-neal.frager@amd.com>
References: <20241119134559.3891625-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009F:EE_|CY8PR12MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: 22bbc2ac-f74e-4cea-d59f-08dd08a089f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VIVMAX0ZFFzltK0Rtc3N4ca5HWojSY1lPQaBz/JNe9PdZgPjBPKmMT+Lpqpm?=
 =?us-ascii?Q?hkpNf/UZaiDzvZPYpSGEA1L3QSReePUzPHrYODchUkd5XBLUgo8TfVvsUF8E?=
 =?us-ascii?Q?o5lLaQ5m/7cuhhSaORfzjoxj81jdrASGxvs7Er32p31Qy/2mFZ2aQLTeAzHe?=
 =?us-ascii?Q?QQhBPvZcs7Uyz48/CZoDNqUZbXFUbvfjNcLR3iaLEmnfzDQBVY/qKXMkLIia?=
 =?us-ascii?Q?dOcujyWBkcParirwfdCSnAmrwHjl/rft6oeAeIedtBtVjYUD2Xyo8M4qJl3q?=
 =?us-ascii?Q?P97OBgixFJBFZSLIntsepzv9EouR3FQt28PPQmSbVoVZZ4AjAympgu0QeDnC?=
 =?us-ascii?Q?or3te0Fknoj5PF+vyZ66koSXw/RWFUpo3awN98PVLOg+CT871gSwayaSw2uw?=
 =?us-ascii?Q?cGfUtpK8Ko4n7luM6XB7gvh6Spf70KzBb0M2Mdp2pPGLIFcnNsfYCybwulxr?=
 =?us-ascii?Q?oY67jdgQI5s/dmod6zhKyCUgcsl84N+wxYwdwlv/T9lASw46sNuo9SBgurha?=
 =?us-ascii?Q?CIBpAqnuO4N1Y+TVWXIKJcKFzi1TQXVMBrvO1W+4jiJI3lStnuzaUw1PfvAm?=
 =?us-ascii?Q?qvEWmp3T7liaFg1E0W9Rda8gSDp04zyh0pV8U+4T0rKTH+NVbOr30ZQZ4lJD?=
 =?us-ascii?Q?djWb6uxnEUknc4V7cM8lfbmrzU6UODvTB9VKU9mWR9o+JNhujDFXzk6VrKHJ?=
 =?us-ascii?Q?wyhBTYQ3FbQXQ3/lx8LcrfuYoMsvW0PppKhHGWqrCE5HQ9AI9VpWQPjYzSwf?=
 =?us-ascii?Q?KeR2r1OhEsFZCwDa5n85xDuVgaF9d3KIy1qqOEkTvqv/g00UQEgxnMLUvdgQ?=
 =?us-ascii?Q?xaWPD9Oq5EVaA3i9ggLXn24t1hVVS8Cz1I1MtHd8onnN/QENUlZzlPrTtYRP?=
 =?us-ascii?Q?88ECeTEwFUPJL2J3TJaZZ3A2OTHM4OeEPfFcDUXefCY/xKoD62pQEkly9T0S?=
 =?us-ascii?Q?yRYr3dlSHHvMMjnJML7CsJfRjLTKUHJiNfeIRM7oGnNlK/+7c8rnzSTqTpsR?=
 =?us-ascii?Q?Dj/R6C3xs4MLOaH0j2DPqBWaqM0WrTdsBZCtvOsa+H1FfZUSR3hCS86BsMwf?=
 =?us-ascii?Q?VA7WHYRUibs1kWkSLmwvv/XdqQHEk2ptdYPxah6z9NO4oIg48xqAPQIFIz9u?=
 =?us-ascii?Q?agxyRlTi+z3PoPxatuoT3ZaYHzw2QciAq6nLpKTjq6xP0s2iSaOGoF9Zkxjk?=
 =?us-ascii?Q?C8GnejOVRrJuU+Pbp/VQmujGtYEN+2JFWdzn/RiihsKRaWO5e36kO4kiJL1K?=
 =?us-ascii?Q?aenDKb9DELtTgcXEPeeL+4TYP2/4ghURDyg7rbmL+gITguueMCLpooMdTf0g?=
 =?us-ascii?Q?KNvvLvUoJNMwD0uE/R16NLFHQQe2PzD0v0wT1cnFB1h8sJ+9rc7tNjSPln3R?=
 =?us-ascii?Q?Tuvlcn7zS+ztIluPdzi4rrfOYivN6HK4mtUuZgVQmKqBZ1/3ZiCFP3uLRIlD?=
 =?us-ascii?Q?22pNUXR1dND19eXGqmFow+AD588t9ATH?=
X-Forefront-Antispam-Report: CIP:165.204.84.12; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:atlvpn-bp.amd.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 13:46:15.7789 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22bbc2ac-f74e-4cea-d59f-08dd08a089f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.12];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7489
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZT7vdNuYWga1zM000hDJZkDdUG7SkVF/R6KRgDDhfX4=;
 b=Ju1BFYBPPbYCLymnrz/q6eJ4mdGDM5Sf+LHJAjckGwCkNwb+CBLajtkvsWuorY9iWZGenoW9cz2YA2PwxXqwAP/u8zVu19mFXdB63JHyGXThg10GyznomLdwPjUhRDokrWKtPHVAS7AGpgXO8iVci4JhMyr4JC0i4ctA/G59tH8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Ju1BFYBP
Subject: [Buildroot] [PATCH v1 4/5] configs/zynq_microzed_defconfig: bump to
 xilinx-v2024.2
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
Cc: martin.chabot@gmail.com, brandon.maier@collins.com, ju.o@free.fr,
 juju@cotds.org, michal.simek@amd.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynq_microzed_defconfig to xilinx-v2024.2 which includes
the following updates:

- Linux v6.6.40
- U-Boot v2024.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_microzed_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index a00992c8b6..7d08331cd6 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -21,7 +21,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
