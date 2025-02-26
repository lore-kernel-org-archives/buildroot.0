Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B641C021BC
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 07:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B8AE81F57;
	Wed, 26 Feb 2025 07:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3dCCO1WArku; Wed, 26 Feb 2025 07:07:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A5CA81EF0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A5CA81EF0;
	Wed, 26 Feb 2025 07:07:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 286BE2DE0
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 07:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 156BA6085C
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 07:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYf7rMF8oK5d for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 07:07:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::612;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3E78D60B7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E78D60B7C
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::612])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E78D60B7C
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 07:07:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKDT2gWdQpD/PC1K5jCITH4LUojPTO9BOC1SOVEuSmiAQb6UOR0t12958LjCbSz5gxHqQKK2VTzkVMiNqKpn6iuar4Uyl0IR/MD/rnEWT3GEAQWdXmSbNLz8ZmfAS0/5JCoe3cmZn47eOiMcTfJ3Q7RVNzt96doDWWwESraMK88wsKEFagH+hvrTK89/NGlCiYuN+NB/7IUFSwh4mwNAdkGykBend1x6Q8s92Y3fDJYz2PfM/btAIC/jK/iNPZxrN1AHZ6ChNZlskhKd7aJg1snwRcRoY8a3J1NmxBlCORhkntduxGe8FNpvMCwPVGCmxpF0tYStwpKmIgJ+kokArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1c5PweFk+UX51tOgZbHTSZB8Q1lQxtRJJEunDxDZzRM=;
 b=rgP/k5P82YLA1JExDTe97M3Xcg1lmf2mtmiBNhFqUZnlbic6m8zw5JbtfyYLsNWKU1p4pV5fjAFyk1WYO27gVYdyOL8zHdiCbqHKr3qoKCw/KvJV5zpXdM0uDBgae//rVcy1mgDDQyAHi2cZOeugjzL47335PfsOH7tqXkIeOdsT43RBhI+Q7exjocq5mLi4lDsfFUFAZrMJKH88j1Enc7+jRX9Bt4gdVm9AzomwQhV15ZuA86LtIrP+Rth2Ie7Uzx7POe4KuY7L8z/JaWjk9fUeDN7OEFe7M5a7zZYLQ2rqWMXAcHGLle+MoQzur+uNVeKPWXcu9bg76mTn3QiTXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR04CA0285.namprd04.prod.outlook.com (2603:10b6:303:89::20)
 by PH8PR12MB7231.namprd12.prod.outlook.com (2603:10b6:510:225::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.20; Wed, 26 Feb
 2025 07:07:02 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:303:89:cafe::b8) by MW4PR04CA0285.outlook.office365.com
 (2603:10b6:303:89::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.20 via Frontend Transport; Wed,
 26 Feb 2025 07:07:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 07:07:01 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 01:06:59 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 01:06:59 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Feb 2025 01:06:57 -0600
To: <buildroot@buildroot.org>
Date: Wed, 26 Feb 2025 07:06:37 +0000
Message-ID: <20250226070637.3866930-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226070637.3866930-1-neal.frager@amd.com>
References: <20250226070637.3866930-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|PH8PR12MB7231:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d4368ee-3328-48d1-7ae9-08dd56342b3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JXxKLT5GN9uWtI/QwNXcM4cJe7o2/cylKbjk8ZyX5TsViuCebb8P3+SJZn/j?=
 =?us-ascii?Q?QH49E5chAzjqJDEQK1qyQMzVpAdnCOrybUi+obzyKtE/+QVyTkMHKdxdrSCz?=
 =?us-ascii?Q?WQ9PA5WyQwoEETjx5eCBryXe4xCjDUzKHaCUvR+PUuXICWwav1aGOl4NOsMF?=
 =?us-ascii?Q?gjYkF7QGEO4/nEE9AA3+8Ln7Z/KrLvDI0d/nOW1ZBDYhMYqyKGNOoKXVCX+f?=
 =?us-ascii?Q?e0Q9zAcq0SimGlw8dR6BXWqElgruH5TU/BUYZmLfbGfi46LADy2OCT1in5+k?=
 =?us-ascii?Q?MVC3sNTCzSvbKC1qrKEjdJjEmDeM8H1PGyJ9WdAiZCtQVQWSYaXMGw+kAkFD?=
 =?us-ascii?Q?rbotab0KYtJf5ZVFQjBE8XmIcK4lsvOutWxkf3Fw6u2HnU46/iGSnjtpg4LG?=
 =?us-ascii?Q?XY4NYoYsb/ikFyKCgd7jYUQ0Zcx1+n3TEQBqjPA9u41JE4SvWnZcND4liGVT?=
 =?us-ascii?Q?gkBIbSDyq//rnxMjUX99VK340jecmJEBEpGoDMNgcT35qYUtuSgB7ywJP7Au?=
 =?us-ascii?Q?uZqyu0VEs7RHK76lF84AHYlFk6QtyzlpX6qdI7aN5ojoj2Dh1K+NysXVCLZW?=
 =?us-ascii?Q?chRKPEi+Q1kpxnsrPZ4M6UQDMjz4fqXR+3M1EJw6bOaOw84yR7sazDg3cp4W?=
 =?us-ascii?Q?I5qbAIsFrb34tUXLjIVYkWhNIjNQhri2EbxSd8DU8ixcfYCt39fGDqKd5ShD?=
 =?us-ascii?Q?W9djpWOKWTjQnHNf+R31GtSijC7UgLeCqwOlbNYtwFKrc/TKCZe7ofMzyguZ?=
 =?us-ascii?Q?fG8bxx3/FtjHrh2O/weTnM0KmCPLjQXAjFUK7G0VsfGuZBxPZIwe9iuJZoba?=
 =?us-ascii?Q?Blfgb2qTy21mke/0lh0ZcNy039vQd82M0chKZorgcTU+9QzV4suo3os0b+Sf?=
 =?us-ascii?Q?c7w4vnnanTT2nFmPbn/a5OnRRduVE6dCIYU3T38lq2iugpWnK7+CkIxSC2Il?=
 =?us-ascii?Q?4esao6F7pDf7Y+XbtizmVJKE6RXjxD5hHiqov+vDZnOsQgTxXufw6zkEYAUS?=
 =?us-ascii?Q?IzErKn535PJJJxX93Gw6bjYq31bOqUGA3RqULmctwSfkErBqamM4EBySRmoa?=
 =?us-ascii?Q?yNqVGdCTxifvLGY40HFeMMcDz7tFSxuJ4DX/aV087v/T46yQuZOj+tIIOEmZ?=
 =?us-ascii?Q?Ke7LuBH7sMbpgDgISOwmcefhylDkcsm3eQpNfrILBFDft0b+uqeyirjrvSuv?=
 =?us-ascii?Q?3jivPHUloIGkrofMOmI4FkXGaHVdiAZ2J3ypTDFoqpYBSZQwvHmBxFasEm2X?=
 =?us-ascii?Q?MjtM5wdmjHcs3ULMMBkcBPyUtxRM0IYpFSTeqBzeTp6KFPhyT+l3svSkvZJ8?=
 =?us-ascii?Q?iYcfLOTaaOwi1neZpj0bZgq90YWht6iiZHM+5ONzw/PvKIUQI8rlgH4oqLZb?=
 =?us-ascii?Q?ei/+9BOESVog1xWFLwF3oxCAwoJoDmr49WaR2xLD4eV8312WMgS0CKR4KnXz?=
 =?us-ascii?Q?cYbDAXkyB3103zPoemM2u8wAXISqoD1myt2GUFHgPXPZd/Dp6C7i/SnQKu3X?=
 =?us-ascii?Q?D0m79aSt5NW+XIBnXA8sSIRFxclYPbiFxUKT?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 07:07:01.8456 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4368ee-3328-48d1-7ae9-08dd56342b3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7231
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1c5PweFk+UX51tOgZbHTSZB8Q1lQxtRJJEunDxDZzRM=;
 b=S7bneVtcJlXspGVSvPAWDxZzjkb+s33HPcSw2BErONpNmKcCClJk8sXlTjAY32YcKMilMriOB7ylm+d43sl8HBAl1H2BSy/8O1KO2MD3glAFavU3BBP3iihxjWl0HT5rw0OlgenJvTjFn2LWafxt/jwyt9GK8srZ0unkgH4Jc88=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=S7bneVtc
Subject: [Buildroot] [PATCH v1 5/5] configs/zynq_zed_defconfig: bump to
 6.6.70
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

This patch bumps the zynq_zed_defconfig to Linux kernel 6.6.70.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zed_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index ef74c73b3b..c9e8e7ea2c 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
