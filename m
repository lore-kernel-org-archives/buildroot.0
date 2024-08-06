Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA8FC3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 04:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25778408BA;
	Tue,  6 Aug 2024 04:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7l_867rtfgze; Tue,  6 Aug 2024 04:48:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AABE14027D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AABE14027D;
	Tue,  6 Aug 2024 04:48:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 901831BF304
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 04:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 773338116A
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 04:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s72Zs2-gUU8D for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 04:48:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::624;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0EFA581149
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EFA581149
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::624])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EFA581149
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 04:48:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfZolZ/mBIRuhuw7fkzjMIweM3mgONv7dS6yvy3YnT0asOS2K430cFdaTe95ekZaYbuZQ/Z589AwUnfs+2/J8ylf3tp6z3aAefdQH4etBEYfXQefm/9DROUqZ7koJbqVlJWM2svXDbzv1l/rIN2OrrsOmdT/8YuifGHFh8b3KPEOIMxZJeahprn1eeedSEwAHIo+//X3lBBe+rX7IzSvcuNVSL4Ens3cJLJT8OpSo/IsntkSRaCxaebSR0Vcp5CNIlwFmEdPTSjduOa3YrrMsl7Uhm+fDL8ugyAE1G5HwiUpptZvzjnmcyE6WhRHO8VAH/eTbFxeEbzvYCSv5u6pzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4tnKabePkDPK+3q9BuDSYXVaTAsycs8NSPwJeLCN3PY=;
 b=KMvoJf0aAMt7gxxXDeWokU2GBszq9Nrfn7qcVh6H0fsKGzxRL9nWRYhQyTcT9RoQmrbG3nNBZ0WsGrCnZKiO1iWYzi7ObbZOoXA7/I3F67fYVgbXRHlu0pDskm6mAlGuV9U6JOeyCJFiL8Npkp1sp+0vAzoPUlRA3XIPpHGO7kd2WB1v5J4BGQGCr+Sd5DW8oNJKCP6WbYU/kyjPqTpKrOfzLcC1mjj6D3SrmKBjEzhSzeIjkHTxt8Ixs2Jh0NAtYEVJVDlqe/b4eok7rc+XAuXw19qsQ3/V+7AqX7mgWX+Pb8iUy6rm/leAOpivtItIN9Ehyhqhb2upYa/CD2hV1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SN1PR12CA0104.namprd12.prod.outlook.com (2603:10b6:802:21::39)
 by SA1PR12MB6995.namprd12.prod.outlook.com (2603:10b6:806:24e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Tue, 6 Aug
 2024 04:48:29 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:802:21:cafe::39) by SN1PR12CA0104.outlook.office365.com
 (2603:10b6:802:21::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Tue, 6 Aug 2024 04:48:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 6 Aug 2024 04:48:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 Aug
 2024 23:48:28 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 5 Aug 2024 23:48:27 -0500
To: <buildroot@buildroot.org>
Date: Tue, 6 Aug 2024 05:48:26 +0100
Message-ID: <20240806044826.980205-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|SA1PR12MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: 590485b1-40d4-4146-4523-08dcb5d303d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pcpEUQ9WHgq73zkcc6TC/SPmdtXEKLHqcikvr7YRcNrUJI2s6spsBwKK6hTE?=
 =?us-ascii?Q?+sRohufmHSX98PHmNVU/3YUTQMSsLHwkbVYDfin3c8AzgW40kitixpUehjHI?=
 =?us-ascii?Q?6fxZbTMnKJC+NsRVEwohPTSX9/a9LRKxmX3cfAE/pSHLwlIvdLAqgvWCCtIw?=
 =?us-ascii?Q?a3tyKdIvZyb+8zCC2axqj45/h2CH10iwxtEonYhS91GdjxVN/iGQ8BvNMhRv?=
 =?us-ascii?Q?wLKokkvUJ79ivNkkh4l/cqjgL+x+7DTwHJkyGMrWiwzQRI6xSE8TGTDlYgPF?=
 =?us-ascii?Q?WFKHOMdidmwPtegmS42xrt/iL2VfusIRuq3ng4vn8lTArY5YeYe2x0gtDhLx?=
 =?us-ascii?Q?gI1ALPtpWOV5HZel2Lx1aKa5Wb5MhUX/g8Ruw6BbqaAFutF9rmkB922aog6o?=
 =?us-ascii?Q?eIs2t97TAOh1TJ0vxSQDiWIH8FmFzUpPbRYm/sGQ8bj7qX/20VFMxRd1GNiW?=
 =?us-ascii?Q?6TLOMUE7u4h4+6MLnF6bX7/32zLBQkg7kBZcj4iBeICwDU+kQZoX4RTe8O6v?=
 =?us-ascii?Q?dDzxGgJGXtax+PtT1Dihgcjw134PqJs0U3FmZkIkpMvwI5GH5SoNtig9z0VC?=
 =?us-ascii?Q?qU1+xTWSH7MfxCPShZFN3PV7PipPy9mSW+jIXy3gO/Qh9/FH3cdWhtaGb2XA?=
 =?us-ascii?Q?muzaEIPi3wBGaMRPEbUsdPKsEG/cOPBXmp1NESQuR2qmwLBrp7wanxEfJecE?=
 =?us-ascii?Q?ucntKuKagcXyl7C4mWoz9DwNnFjrdVPtTyLhr184hsxFvsH9n7/XQafV7F0R?=
 =?us-ascii?Q?QAiGm6RL5wpiD6y17zZfHqGYtKt5spT1EzIv0WLgEvyZifNn5iVLZFGpC1gC?=
 =?us-ascii?Q?0U/DVEay1htkqAaG+vxE5vPBjKe3afs7B1+LtelxyW63IjwRxPxkg4kKGbYV?=
 =?us-ascii?Q?mgBYZEEhXmdDW7Bf2izYh+2d0RQrnvMbGl+/ljeRbHEMZOo2D8GYskU38m5a?=
 =?us-ascii?Q?YEqSsevr695flJm0HU2/2w5fI/ih8k7yOdYOFUgR4sC/2LkivxZT9fIfpihD?=
 =?us-ascii?Q?w5DErQ8ylIy9T5Ra4s2GTLFvsZFTTNRtBn3SY1ks4IyQfZWzPZqyVwC9fbZb?=
 =?us-ascii?Q?qGOK/hpZKj31mJ4WCRQNrdM+AAbhiCVd/vLTN18gfZPQ3d2GC5E1tbK1/WMJ?=
 =?us-ascii?Q?3HPabWuVhb2qM5YbhFWOkfDO3oBIiXZpmQkAvyg2jAEJYE7Ou5USbUpNxuwP?=
 =?us-ascii?Q?hbi9GjizzX283I5y+MYSUTqHBndNZrd9ClTYhEsk6mmjnDGO5dvbifywCklQ?=
 =?us-ascii?Q?emqdki0B8/i42Ld1iqyXFkS48N1NJLqitzuf7L5pCUc2Un1jS7o2zEjpa1yY?=
 =?us-ascii?Q?p52d2Ki4a5y81lcL+4iOsE4HKikorxHExKRl/zk72JyiZJJ7pqmgJjtDNqp0?=
 =?us-ascii?Q?22XCGi9N4DzxVq1m00AMWaj7wWBAMGLirMSD31ocVwbrhJpmj3sXODoyZKZA?=
 =?us-ascii?Q?eGHyHwzXjPqf1mtLmAC3mVjtVlOKO2L7?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 04:48:28.6127 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 590485b1-40d4-4146-4523-08dcb5d303d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6995
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tnKabePkDPK+3q9BuDSYXVaTAsycs8NSPwJeLCN3PY=;
 b=Yg86IhEZbMm4c+2gORVy2r0jUo1aA8XV3CJe7HTcwis0ByYCk8yZcDxepxzysshZemgPyXC44Nk6Xm1K3AtOxnlzlLTvl0UY4Ue457TUDdPBLmMss3LHLQv/jmAK1qCg+e3EtujtFOmE5riQCvEPWT8scfSDusKl0NEMpgNgjYY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Yg86IhEZ
Subject: [Buildroot] [PATCH v1 1/1] package/gcc-bare-metal: bump to gcc
 14.2.0
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
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps gcc-bare-metal to gcc 14.2.0.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/gcc-bare-metal/14.1.0            | 1 -
 package/gcc-bare-metal/14.2.0            | 1 +
 package/gcc-bare-metal/gcc-bare-metal.mk | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 delete mode 120000 package/gcc-bare-metal/14.1.0
 create mode 120000 package/gcc-bare-metal/14.2.0

diff --git a/package/gcc-bare-metal/14.1.0 b/package/gcc-bare-metal/14.1.0
deleted file mode 120000
index e519bfb6fd..0000000000
--- a/package/gcc-bare-metal/14.1.0
+++ /dev/null
@@ -1 +0,0 @@
-../gcc/14.1.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/14.2.0 b/package/gcc-bare-metal/14.2.0
new file mode 120000
index 0000000000..0737236850
--- /dev/null
+++ b/package/gcc-bare-metal/14.2.0
@@ -0,0 +1 @@
+../gcc/14.2.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index 2f36b49125..501f12bc33 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_GCC_BARE_METAL_VERSION = 14.1.0
+HOST_GCC_BARE_METAL_VERSION = 14.2.0
 HOST_GCC_BARE_METAL_SITE = \
 	https://ftp.gnu.org/gnu/gcc/gcc-$(HOST_GCC_BARE_METAL_VERSION)
 HOST_GCC_BARE_METAL_SOURCE = gcc-$(HOST_GCC_BARE_METAL_VERSION).tar.xz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
