Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C16C25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 08:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B662440346;
	Fri, 31 May 2024 08:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u74_TM7VyJC2; Fri, 31 May 2024 08:44:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85E9540708
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85E9540708;
	Fri, 31 May 2024 08:44:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA6211BF395
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 08:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3A156066D
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 08:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DyTf_QUAOfx for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 08:44:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::601;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 461F4605BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 461F4605BB
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::601])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 461F4605BB
 for <buildroot@buildroot.org>; Fri, 31 May 2024 08:44:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNZ5oMrKSdFYNeMm51PFt6a39uaNvrPXcR8YguuC8C0+48DvYA61rKnPWKYBUdJt0N34sUJTgRzddiTdbRyO294MQ7/l2B9k53mbLJWMPutsr2VhxnoJMm0PUPURN0zizxWEcV1JFrKtARa3vZ42DtGJ14IVJTkuRgdQxCtmaCIaglgCDTUjiMcIT2VKpa0A0CdquxGCxdtzRIgGJLD9rp8ekLWjj0bDtVn1CPbND9n9Z9I5DxEVNw8nWh+MkrmbS4MhIoGYZDgx/Pv/tIcz5USzJPzxJuuSZ4clhKqZNl+iYYSADCknA8c1UgV/q4MUQQ6/xVYXhEhIED8oqPwg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x19FM2xdgPmMBpXHO6Qu/RLtzziQCBzn6eMYWb3OH6A=;
 b=kWkYOsxPlxmKPc5wTBRqCwgRBFPpJk2Z56NfOzH2esOBUf2bq210ORl1ZSpSbmLilu3DwYlnyCx250Ks0Z+QOQYAor+/R4AMLl9eUkTryhzCFgwA2NTm0GZI4kgWueVTNtrQUT5Nye8ywHG0ObIlGW9+c/WTKk8XFGF6R8ndlWHt3lh6v/WBBuRI47BeLMYmOVg4W2GuotnIBcd2emBTz+Ngrk/t7hVXTBUvkNj2HFXKUWfcJknMFwqTauLx5JwXDuMv3fNxRdJ9Mizo26P7CKT8UrSGRdzpHnTVydi2NCGQcnlCbiv5Zm6NVZajIdMWt5AQGDtiKMRZ27lmacBSfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR21CA0016.namprd21.prod.outlook.com (2603:10b6:a03:114::26)
 by IA0PR12MB8326.namprd12.prod.outlook.com (2603:10b6:208:40d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.26; Fri, 31 May
 2024 08:43:58 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::61) by BYAPR21CA0016.outlook.office365.com
 (2603:10b6:a03:114::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.10 via Frontend
 Transport; Fri, 31 May 2024 08:43:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 31 May 2024 08:43:55 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 31 May
 2024 03:43:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 31 May
 2024 03:43:54 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 31 May 2024 03:43:53 -0500
To: <buildroot@buildroot.org>
Date: Fri, 31 May 2024 09:43:45 +0100
Message-ID: <20240531084350.3703469-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|IA0PR12MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d09779f-bc62-4084-9066-08dc814dce94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|376005|82310400017|1800799015|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VMIMq/QSCcv6cK0bxqgBinYtOxZIrU4GlBeHlhJt0PyIFj5xpdGeeXe++UPT?=
 =?us-ascii?Q?HcogKMn9ngl5cVtQXGm2mwPT0Dj966VF0OCgJ35b/E8RaCkKATCymL+xR3Vu?=
 =?us-ascii?Q?RGMqDlXwaEvzIWHXhozAQmpFKZ5QkF9090rOsdEY7wxQNid+lhPCBn436Oir?=
 =?us-ascii?Q?8ozpspom3V5hUZLXhxyflYp3Xf3GTTgMGXHdRFKDT+5BwZIJ10JfCIh+PP8+?=
 =?us-ascii?Q?XU3usoKzZmOalbS4UBQwezB+2vk12jpsQsCQfk+LFCIrhge0B34WwwHcAHJg?=
 =?us-ascii?Q?CupVpP6q/EQXvZEWoRuzX9AlQ8CLmumReDh30kWJnc3F5ietXvbY7qzkko21?=
 =?us-ascii?Q?u5X+vdRdDe6ZX3dZWz4UF1pytCBSiNBGidLTFaz4Dwhe35cpw3OIqtzquz2x?=
 =?us-ascii?Q?aJ1n0QS6bdM0p5taaOIa3teya+zA5tM8buA1LcZbJG6j1h6qxEsITBOUSZKv?=
 =?us-ascii?Q?i1ak04n1UMqu90H9AcsgVYjplxy1b1vZqVgV6zTaUr1W0XOYlmMDPM85vEYD?=
 =?us-ascii?Q?dnEOXPJkaoHAQ5lX+SHhXQ/2xu+F49lVmogn+PCpEotwAfB+5Ypn5Y6HvAkh?=
 =?us-ascii?Q?8uv5bPhgrZQJxKG8AEAuZW0FpL3milnGWwb8zv3vtwQaUUq04nv5VqqvZgrJ?=
 =?us-ascii?Q?deHYXb1VKlDVDCEQAeD3QDlb36Ei/5GxZYm8caaKc5+4wrYWQJa7xO369yPZ?=
 =?us-ascii?Q?0GQ4/plFy4VTRZ6EMVma6+bs3LdYSu5rYl97cl4XMydKIvsXNiVC8bunAlJj?=
 =?us-ascii?Q?RabIfOHirpN+bzKmxjkrtwJPU1EPDvsSUZnSF+/6/E49B3hfVqeyc4mLKnia?=
 =?us-ascii?Q?wKymbamWpv3aZTOw/+HEqiMnCpM66J7yUXYKFSAZEsipWOkKFalz6hiHDdiQ?=
 =?us-ascii?Q?22MG64f9lkTOmPyvT+nNrLD7mVC0NU5ZcFZhgI+XyquZwCfFHt4HdkOE55aC?=
 =?us-ascii?Q?DYUN6abLZ939mpYpDos9tmDEZbqy9XUmsGjpVbTT5J5mbmLesfRWemfWsn1d?=
 =?us-ascii?Q?OJd62jFXdhXNUnHXbSSMx3ZsQcTA6X+Yg1AWt+a+LMJrphzz2HAxjX6tWaKZ?=
 =?us-ascii?Q?nIDSBrA/OzqmTjB3K/994wtvJOJUGI/u+RQrihWAbBjFPJjFSG405JpkNynP?=
 =?us-ascii?Q?IOJBXf+vfyUay55n0CdFPdmy+7TwmeIo/nWHrFsJBrfub2EsP8KysXEwAWgn?=
 =?us-ascii?Q?cokfvWFE8V1elI1AyscciVXi0u+HFahIAigx+K9XrxjWRzcN61bXlKHEvCr7?=
 =?us-ascii?Q?TVGSmJtozdBHiycHxLweLGahpka0sWvF0pGFZ6t5nBKLHHkP+ahSAwVIb9AA?=
 =?us-ascii?Q?4kf4LC689nNzyjmEAZ/OiYWI6JyuKhUsW6czpiTVZS7/V/Ds+5/1kGm/8+bd?=
 =?us-ascii?Q?7fYb28q0nDTMld3NPQ1r3Si1ar5zClFvk0i/wjGSfSWMIiSs3Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 08:43:55.6825 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d09779f-bc62-4084-9066-08dc814dce94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8326
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x19FM2xdgPmMBpXHO6Qu/RLtzziQCBzn6eMYWb3OH6A=;
 b=cCOfZs6crreIIaVNiPDnh09d8N/bmSGCYgm2ZCyGP3ROrqWhcfr67flblU0/7UVkpNaNV40hnno4Q8G+6sY+kLGY0W+4sSdCcT0ACgMkAYivvaPeLUUvOC9dteb51aIcWu1d0l4dFUYDJZlz8U4xlXGKpRV6yg87JzZhtJKqOBo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=cCOfZs6c
Subject: [Buildroot] [PATCH v1 1/6] board/zynq/patches: add xilinx_2024.1
 hashes
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
Cc: martin.chabot@gmail.com, brandon.maier@collins.com, ju.o@free.fr,
 juju@cotds.org, michal.simek@amd.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the Linux and u-boot hashes for xilinx_2024.1 release.

xilinx_2024.1 release includes:
 - uboot 2024.01
 - linux 6.6.10

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynq/patches/linux/linux.hash | 1 +
 board/zynq/patches/uboot/uboot.hash | 1 +
 2 files changed, 2 insertions(+)

diff --git a/board/zynq/patches/linux/linux.hash b/board/zynq/patches/linux/linux.hash
index 8ed4bbead4..db57012f98 100644
--- a/board/zynq/patches/linux/linux.hash
+++ b/board/zynq/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  56acddefc6f6fdc00df5b75ceb4f86a9d0af9a4fef78cf57f9f2c274b22f006f  xlnx_rebase_v6.1_LTS_merge_6.1.70.tar.gz
+sha256  ea85988e66b9a2e19ccd76d0f5f5e657988a873fed292160917712f45605a805  xlnx_rebase_v6.6_LTS_2024.1.tar.gz
diff --git a/board/zynq/patches/uboot/uboot.hash b/board/zynq/patches/uboot/uboot.hash
index 35e54e0baf..516707bf26 100644
--- a/board/zynq/patches/uboot/uboot.hash
+++ b/board/zynq/patches/uboot/uboot.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  32a997a748697ff27e5e6db8edaff5ba893077214bc18b5267daff0b708dab53  xlnx_rebase_v2023.01_2023.2.tar.gz
+sha256  58e391a001d9d8ed347ab3258ff7c8435c866b1ff2b2c22ebc95af592444c0f5  xlnx_rebase_v2024.01_2024.1.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
