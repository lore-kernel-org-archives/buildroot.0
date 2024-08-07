Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCCEC52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 10:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D943781337;
	Wed,  7 Aug 2024 10:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hsZmh4MZBKcZ; Wed,  7 Aug 2024 10:58:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BF2A8132C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BF2A8132C;
	Wed,  7 Aug 2024 10:58:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 190D51BF97F
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 048C3405E8
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MXwm--tz4pPh for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 10:58:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::601;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0936B40576
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0936B40576
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::601])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0936B40576
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 10:58:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=haIkRDSF9ieKkIaHgOhFU8ltnSnT3peEImdz5QtHho9QOIA4mh4K0Cp0YWIR+bkJY4VfTtqhEHCrNPQRjbZyoqmjaJl3sw6hGgl1yw6JKrnu45rtUWmCCap7cL7A2vrSSbk95JbY+zz0Bqm+UyWtnNTkbwxiaGCr+GyOG5hHCq9/KUzLAXbgbJx2nDnd9WhSN/M38izyqAWAR6Qae3LErbdbsLw50XbElE9KXUsOF+pV2xZvQMhxmTe+3m4LkNSRaPD0GuDaLdGNd+VBvy5NnvWRBsxudHvZBuvEfrEYMB3EFVhoecTEYEvzErcRQKMZ2IXFKsuo0k6DIlTHb7aOpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jh4gSwGtLEjwtjldkRZEw6PcZMcVGFTZ0EHFmniInJM=;
 b=B2OPmHLkGjnHqHVHntQByx5I4rNu/1MPTVlmJerWbo3Gx/8zQ5gbKWUxQxiM3MmCpjz4vqhd4Qbx4J7MpT/3C+Hgtt4j4SUg7Eue6vRohBxRgx4eJEpHUwqo2k2dUaeZpNaIwDqmciOpdZYtRdFS5F3cikMhAjvxN2URzbpCRNMjZyo53gwisEAdA1NlUeoi1Z7Mbr7kXwF6nsjHI+OF1yycwnisnrSPN6b1sO09116alpXCuCo3Y4/JMurQcn7TPUcVE+h989RxdGC6e/OnHBZWsbF8KJTHUK9kJwmljXOKYf1MVtZ780qrxap57h8IB/6c3EQEe0sA+aYcHdnsxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR05CA0040.namprd05.prod.outlook.com (2603:10b6:610:38::17)
 by IA1PR12MB6163.namprd12.prod.outlook.com (2603:10b6:208:3e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Wed, 7 Aug
 2024 10:58:33 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:38:cafe::50) by CH2PR05CA0040.outlook.office365.com
 (2603:10b6:610:38::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13 via Frontend
 Transport; Wed, 7 Aug 2024 10:58:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 10:58:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Aug
 2024 05:58:29 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 7 Aug 2024 05:58:28 -0500
To: <buildroot@buildroot.org>
Date: Wed, 7 Aug 2024 11:58:13 +0100
Message-ID: <20240807105813.3844985-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240807105813.3844985-1-neal.frager@amd.com>
References: <20240807105813.3844985-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|IA1PR12MB6163:EE_
X-MS-Office365-Filtering-Correlation-Id: 569b0cb0-f53e-4f75-91d6-08dcb6cfe0e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wrdeyPEQrTTLXwkwNB1Uq5KGyZnQC9b9LsKglt8KSjitPhTl2D7SG86Lg0mA?=
 =?us-ascii?Q?6EoWvmr5drpmJfU9SHyzFjTG62rc4aIspWX/P41Ih0ib57G9WKUChIpYWEfC?=
 =?us-ascii?Q?IZ6clHWUA+nT+dfYkc01+Kh4lLKphe8tFVvIDHM4Vea8KPQSPbDZEuaT55/+?=
 =?us-ascii?Q?FnV0hlZzBNpp+l8tiNeqQVvApFbmDPN82SzoIThDMOoAZNMOI8HsKhqm5dif?=
 =?us-ascii?Q?HDam3M7fgE2rw7jOD6z34mEEnsun+F2ntXQBUZvQHSfI2MVT0T1DxJYEsd6l?=
 =?us-ascii?Q?rDrj36XqBUi1ArIUQEb6k9KFkRt2L758CifwjxuZxDcC9lz/fTfMWCGBzlZP?=
 =?us-ascii?Q?UZ+17YLqZCkrvN68sBHGIoZHjQxpdgRSrYT7A2wcD0bRMJhm6UeO69dMWRLs?=
 =?us-ascii?Q?VYmqt+lfJscKepm8CYyd7Yb4+ShuPEJq5pvzrv3FCAZxrxfvYXoJQgHwGsK/?=
 =?us-ascii?Q?ip6I/IIOvLVjtIn4SI9nhutsSe2aafnaQ2/iPHCBazaV2mn4mzGXSWuuUUG4?=
 =?us-ascii?Q?lWF1bfzEjeFU+nHJQRrhSpuO4phhkGlrE2bnBHUyugGqEZhHMMvEZ2g0y5ZI?=
 =?us-ascii?Q?wpRpYxtWk/FjKgTJDLm0NoWMc+4Kjrn8hKUk+UTSxvZNheIXaIjDv3PBXb22?=
 =?us-ascii?Q?FdbaXTYa6ZbIfdAMEPK0J09SwktbMfBgggUYRn70ofAPX8CVCRcxIbYkQHMm?=
 =?us-ascii?Q?aF3Ch/HpPOsnSD4y5nwVjtELw8pnBAsSzqdJoKFx9wuUG4Jso5pD15+ha6lq?=
 =?us-ascii?Q?yfo5hWclz6JuEf01/0bJvc4UgItVGbhHxeUDYOBZi4QoJ+ReRdPYH5EUQDya?=
 =?us-ascii?Q?FHLO1R3n9AuxFxNvBE0uqqm5siIzfSpZsY6KU0opx+PB04cbebRtZJbujXar?=
 =?us-ascii?Q?f63v0ZiLujRRTMJjHllSpOqDMvNB/gnWvmOt9caPctDTFozcK+Njpk271fjW?=
 =?us-ascii?Q?P5XdypfJQVDiInhmL9K8ooY2yT5ZXGADzBOwlfP4oOES2TkOAK15Ma8TEYXF?=
 =?us-ascii?Q?q+Yn+4PhGRUHCwQ7vATRJPeI6hi5GJCl8D11elOWBSkey1lGq/Nod7Al5d7m?=
 =?us-ascii?Q?TuUqxE3xWa0h93HrSK+DRtGDvLY4qqEEIBvJ83M9xPdUoojOnya+StKL6mpk?=
 =?us-ascii?Q?54HWCEGLAjQB+vHn7BGtqTxl4Iu/kg27Lbz2J3/flVwiZQCkI+B1ea5kZHiS?=
 =?us-ascii?Q?84F25hMV2vZ3X6nln/xaIrHLMtvDI9oP5a0tijJOPWKOLUKEwjL5Ick5vrJA?=
 =?us-ascii?Q?6nMrxm+USloCOiYpMx1eTx9PF7l648D3IxoejRPsWsqMsePH/ru1IK+97okF?=
 =?us-ascii?Q?sJdrScv52lWfN90U2uhgwoN++0chP5FNSN/kkGEqwhgUa4BAgMP8xVLFQ6tB?=
 =?us-ascii?Q?fpAbCOC0xryoh/n96PSdik+gGSMqSUHJ4T8rXK3iqmRfKwgxP44xbp7ir+FI?=
 =?us-ascii?Q?dRMzzvpeMVWK4HK4UOVEibPwnyL9ZpoUap5HdqwxNVIWYOOxTCBmtQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 10:58:32.6810 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 569b0cb0-f53e-4f75-91d6-08dcb6cfe0e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6163
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jh4gSwGtLEjwtjldkRZEw6PcZMcVGFTZ0EHFmniInJM=;
 b=3CyjvmU3VPfZPJn/3JIYrjb953DIpg8E5dq5ToUyB3VwxhrIGrExnqQdJJ9PdDDW5FYRroklBTKgHaqXOyPA5cvyFJWPVTAjfaDUnu/WBxB+m/HqE3bp11Z5i5zM/MSjBHdUl9ZOJlWKXzzTVMYEXpWz81VW0QKe4YSv+0w/fes=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3CyjvmU3
Subject: [Buildroot] [PATCH v1 5/5] configs/zynq_zed_defconfig: bump to
 6.6.40
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynq_zed_defconfig to Linux kernel 6.6.40.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zed_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index 925faeac8e..cada3bbd47 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
