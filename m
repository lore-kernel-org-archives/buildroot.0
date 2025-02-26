Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC73FC021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 15:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C0B841355;
	Wed, 26 Feb 2025 15:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BE8s9EAZXqN1; Wed, 26 Feb 2025 15:13:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CB0241357
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CB0241357;
	Wed, 26 Feb 2025 15:13:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 490AC68
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C34083661
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0bto2pEnLRvu for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 15:13:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::61f;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 407DD83658
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 407DD83658
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::61f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 407DD83658
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWFyrxMbd8i5pUQzxfHQgwL37MMhYbe+FsTkCaks1AY9u2jN1HDqYK2ZWz9UljmNWGVWthA63dtIp5t2gHdG1lb+8WaQCA7NOYextkeOpIXRKD3qNNN0Tuf2ftztqMSi3iZJCOMV8LSNGt2UH7fgWabkMGx6iz7q51FRXOamElNF+ZpW02Phm8YhTK7aIkZY4R9ZhhLQ/pP5OQSCCEx1LWczAKQtbHG+8BQjDUMKt5acvGHfKaV5mDWaApeJaRcs+T/5mfXV3yDaWXc1E27QDxNf0FpQ4YwWl9G4P4/fNVqQZsvZ8itfE47g4M15cHvHqVDgnU9bIepoOgfMTJ3Bag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXFlGrlzQV31JWp6D+7Jh2QKTpM1G1VdTIy6EULbaKU=;
 b=nUqpECwAFsih9n7L1lONu42tsGNCaTJML05cYfPqYY0fnfC1jo8p7s/Qroe809omQQ8tQXBjr1vF7jg+Xc9Rkdym53kK5cc1QCVnRNKCso80CWft/aAE0UXJK1uC7w7bCfd04L/qd4yl3sqbI+shtV+yKbSDs65v4jSLXf2TKk9w623VgTBX6qIDAXadPTjZq7p2J/I+FTNBdmQL2ZEo4e3YexT0O6IJAlOaGVEopDnd0uWFmHr6TgvEjU9VJMDQQcSWqTvBpS/y+fNtG+znF4laSf3XEv9sozCa+SeOksM4fc5P1Sbqenp5hdVdO2FOtWP6Bv6CMKC/250az7bcng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR07CA0018.namprd07.prod.outlook.com (2603:10b6:a02:bc::31)
 by DS7PR12MB5765.namprd12.prod.outlook.com (2603:10b6:8:74::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 15:13:41 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:a02:bc:cafe::70) by BYAPR07CA0018.outlook.office365.com
 (2603:10b6:a02:bc::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.18 via Frontend Transport; Wed,
 26 Feb 2025 15:13:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 15:13:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 09:13:40 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Feb 2025 09:13:39 -0600
To: <buildroot@buildroot.org>
Date: Wed, 26 Feb 2025 15:13:32 +0000
Message-ID: <20250226151332.2538312-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226151332.2538312-1-neal.frager@amd.com>
References: <20250226151332.2538312-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|DS7PR12MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: 362d6de1-2b66-4787-3c21-08dd56782776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/ULodlgCf+KQlG+Q+NHyi8rxtFJtYjoZQVkqdkfw7CMiKft4EHhuiLVS0fix?=
 =?us-ascii?Q?LLAgd9iOHzRHNjsRznmz9T8I/wG4M0cyKLpKo6RwoIMhDkCjwpXN9PhnBwi3?=
 =?us-ascii?Q?nBZ51Vhe0HsDBG62Qd+02hcIsvgi9AYqbh3tGiqfSLpCUBJsUiL5PlMrafyB?=
 =?us-ascii?Q?R2I4a72NI1rBSCi2gcyNDuBtFsX7WmS/6kLgkoJ1U1kFVVOGluQBdwUWq50g?=
 =?us-ascii?Q?GokKRUMuvAT0Jc1CsAnWLqF6gOwQrtaxLOAoJDMCvQKL1pxnQvTamoYEe1J2?=
 =?us-ascii?Q?DEjEy3yqSbsOA2ua/htPcC9QTRqgk7Mka1fwfq83xLCk0o82g9tYrUpu/Fuw?=
 =?us-ascii?Q?XXB6FoySnhZf3j7IPOq+A4kVh5y66jWu1r9b3Ur0iCWY+dawDwasYAUAkPc2?=
 =?us-ascii?Q?iRfWNEPZd3KXrdBNV19YqAOtREfy1Z4eJGpcu4tJtxnKMFAXteOh+1IolsQA?=
 =?us-ascii?Q?Lk4Tcd50ITWIbliZIOhmI+gtr24f7qJBctioRyh7UKbxulQpa/Q4xxCo4Nfd?=
 =?us-ascii?Q?HXbRfSfFkS74JUWChbcAthcFJ2wI5bEgF1TNA6oVwg/EWuxQKBVtl2GHfs5v?=
 =?us-ascii?Q?IRVRvLzp0iXfcMr1rKzjCZQs9n5RRqArDaiySrHj6EcM+qjdyDeu1CRgJ2of?=
 =?us-ascii?Q?JelDDR3VhxEsolNdtyRvt22nCGW25/ceb4N13384GBZbR71yudyT9J+xaydb?=
 =?us-ascii?Q?ofvzfWoDjKyDW0pPz2FtQf5YK1t+6Y8YmqSGjW+ahVrRBqoyB//nAMxs2F8P?=
 =?us-ascii?Q?VJap+DXIs7EG4lpjgjpG/pyY5vWBoMOyO1iYwrqDTqgQPL7QyCvdvlo3OcX6?=
 =?us-ascii?Q?r/Hdzov2UTxMLhT35TzEFIUa7o7Cnp0ykSV+RDVA5lVj52l80yZWYYjyqgYw?=
 =?us-ascii?Q?L3+6aRLlfwNpdLv7SEHzPmDuLsU6cv0tXQHbt+s+0PmihL5QKxPi/vz20Y/M?=
 =?us-ascii?Q?ayRCLfDYotxbyI2CiaJDxvnaH7dJQer0CVKu7O0LT9Le+yITtRaG0/Zs00k6?=
 =?us-ascii?Q?16b7xu5Zshy8Kq3lZ9edXaj0ctGNLvD7clJNxogPQzK8oVlwhC4KzBJJ3gw+?=
 =?us-ascii?Q?9z7vLynhZD2Lg45BOSoK3an0HS4Dtn1S29Dd9fdFY8w+inx3nYLemRoaZupG?=
 =?us-ascii?Q?cm+mhJqjh9hRagegFVk1Ts4SDoxwXtOkk6kzvphUv50o2U2B8j9wIP0oOKKR?=
 =?us-ascii?Q?QlCx/u9RwtibZbPP/1W6+dtdxp98yfJjLCHBwLDcOk85oOY/Ew06fH4VbdoF?=
 =?us-ascii?Q?b8HeNe5tyWbAsIVUsV4zICEkAMYIwqI47ztwSvdbN4ZmgfKB6S5N8HAf3fkI?=
 =?us-ascii?Q?s//E4Bo9JXXtjA6vZQ9C9H3r+1Qij9XR+iJkYK0Xv6M+0rb/lxxPd/snUEZe?=
 =?us-ascii?Q?UTk4QFRweqCXpY5xvNvw8/vnTeB0kR5KVBh+/8+UlafpEoBFjiXaK52OPExU?=
 =?us-ascii?Q?hgMnJtQNBhqfOVvTqqDlfkNH5ESBnak6NCRB7jsYx/lgwScy4qZSB9WcNW+k?=
 =?us-ascii?Q?qtSc+BG9Q7TPwCVqeM1va3RqOjroUHVfRqhT?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:13:41.3040 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 362d6de1-2b66-4787-3c21-08dd56782776
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5765
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXFlGrlzQV31JWp6D+7Jh2QKTpM1G1VdTIy6EULbaKU=;
 b=klVmAYi4+s8Dd9Dg22aGtpL+lorp0Vr9YPLbCdVBapmEMa5GN7rjo31DMbqX8MS8DoAF3bMyTwzkpyWxtL1nFAzsbRgMyy+HgPc5JkKQ8lTp86JgjvhF9dhIml1MQTaKbO0MPIWnBnEde8zfdCxQj+C81f5JhY4tkaXFycsdGkQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=klVmAYi4
Subject: [Buildroot] [PATCH v1 3/3] configs/versal_vpk180_defconfig: bump to
 Linux 6.6.70
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

This patch bumps the versal_vpk180_defconfig to Linux kernel 6.6.70.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal_vpk180_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 2d77580fab..afa606ec8c 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
