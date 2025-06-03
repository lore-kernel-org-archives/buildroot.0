Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500CCC5AD49
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 07:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFC9440A01;
	Tue,  3 Jun 2025 07:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ylv6UlzAZOuA; Tue,  3 Jun 2025 07:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1416B40954
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1416B40954;
	Tue,  3 Jun 2025 07:36:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B8051F7
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D0F24115D
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJM_kgKxNH4B for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 07:36:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::611;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9CB26411BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CB26411BA
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::611])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CB26411BA
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJ2ss6H1YNe7UmC/JHNDHfP0qq+ORAEcWJFDO5Zh+iF0Pui+qyW68SwvGPK4V9MuZy4/OYJwMpT22hTkvAwVHBIp92HVPvmE2zE4f0IPzoWNtgeyRgzDPRP8fOjGYBxXvCqIXwcvXAjUojkpuA32Mpnb+Ec7kOkdW4e0osEdZViQRCYiMdhIqKqer9rLMldAc8TuNL4nV6PNlpdOmXDjRU0qyl2gaNcK8YGtKETTBEjr+ue/Gy8obyeFUQuqiJ9PaE+pjquDdlqbZVZsb1fqFtC2N7ar/EmBiF/LV0PTWfRfs6FbMTLzbUOFjPCaNB5jyX14+35nin3QtXMhUGz+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dwljrn/jr9L648yyK9xCM0RopBkh8lWMZ7mVpKgcRJg=;
 b=j/LnDkiwd029n8sUYoGcT9zVV6VK1xKn7HpMrCFyyUZKRifugHX1AW6Ll/XD4xhBZpWuOXqQnNYdQByoEc17aWRHspz6x33mH/GgkXH8EJNWFVowfZKM8pOy9etELumLQQY6TVGSWxhRC1Rq9uMzMQTaVMDjj+gf/J7VQTmb01i6KXXprjbj0KVOQ+axeUNcKOz7s9W0vWG4TSFy0xW8YX6MYYOSXwSZkRxFjdt5OuVgcoC+5EDahY8hiyhh0b5cchrAWrpIKlq0wfqyTgnSXcY1SpdW1BEBIRCQPTojkRQglxOfn1SGmMv5ib9iJAFMgryO38Nn1t7Mlzp3uNRSDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN2PR05CA0004.namprd05.prod.outlook.com (2603:10b6:208:c0::17)
 by DS7PR12MB8275.namprd12.prod.outlook.com (2603:10b6:8:ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 07:36:21 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:c0:cafe::d2) by MN2PR05CA0004.outlook.office365.com
 (2603:10b6:208:c0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.13 via Frontend Transport; Tue,
 3 Jun 2025 07:36:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 07:36:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 02:36:16 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Jun 2025 02:36:15 -0500
To: <buildroot@buildroot.org>
Date: Tue, 3 Jun 2025 08:35:58 +0100
Message-ID: <20250603073606.2679424-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|DS7PR12MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: 23bb2711-2544-40ef-180f-08dda2715514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3sOY0UXwzEpaofMURsXKSha9HODzqp1KAa1V2Mrfp8jDoXs+jZIKaw2Nu8UN?=
 =?us-ascii?Q?xBmz+FAPd1YKKKKVKze6FKXgfBSrwUy/aGUjMlweUp+Kj3naIX9wUsKlRbSe?=
 =?us-ascii?Q?JZNRfWXV7mXzud47eE4Ex2Ew38s1vBMfdB2kWNFYXmMt87KpOONDAj6v2X2K?=
 =?us-ascii?Q?kL/AWrI7G1pVrgEjJhEIbsqjl9uWxOfbiuEq7MZC4VsP/lo/u/4eiokgqP02?=
 =?us-ascii?Q?PSkL7/M95ipxF1t7hmwy1VCODFpD2O/cIf6ZEvzMEghUVoe39gHcVVZlogqm?=
 =?us-ascii?Q?lcF6CmrE/747oUAE3zag5PWOAGlW1B/xO8fUsaiVFwjuhwQOMuN7aE00HFGK?=
 =?us-ascii?Q?X+Yu6hX9qWlAkZGlpFR+ZR7gyfhu1R8Oeobb87PxUdg3BVT7vz9SwBhHZbNK?=
 =?us-ascii?Q?VeZ0ku/4oPV/JL0XxXnRgShXucV5FVifkFC85eS3qP0K0VfemtxTVwMNQYSE?=
 =?us-ascii?Q?oIBL2lCD7XUaGQ0TdsKWq3X7Jip07Nkq2Uz0cjh9yt8MfZ7n8+GCP8Sklh/G?=
 =?us-ascii?Q?82sZFxElEWQlzZFLYFYEuOQjkvt0KRB4+wF9FgTbhNXshiHCu1zv8n0jlCSQ?=
 =?us-ascii?Q?z3/Nscq7jQwL/2BrgggXFukCn7/f3SlUs/ESXLjtHWYFQbNpGZMuqH6nf1xA?=
 =?us-ascii?Q?7vYYxsxpZFTxVJ0LC+b8J2okvR0YQepA1hYUxWiDTSZdq/tq+xxk7X2SIQ2X?=
 =?us-ascii?Q?YIsIe77g5efMKcMjsSeOcJgWOD3lPd9TRTPWEI0QouIG+cxa1RTcKfjjsKrQ?=
 =?us-ascii?Q?93JEiTzLeDBHeuOAWMD8uFqUeYntuBXcc1YcxYud04BRq0F4OJOWTnbAyNDp?=
 =?us-ascii?Q?r6wGz/WSj7yi26Pzb6WZtOveGpKO/Tb+8CTnvE01/EMK3PYZmMbxDfFpBA8+?=
 =?us-ascii?Q?FPlKkKfQa/N778tEhP8PNRs97ryoYS+YPjtj+flExCrC5uTU9w1BPKjYNms3?=
 =?us-ascii?Q?COgvOYQbFIeA7I1CRpU1n8Ia4Zz8gCW1X0Z8J0eOlgI3e7h4U1LIBPtyXvbH?=
 =?us-ascii?Q?E82NvUEdkGHZ0CmFBicJV9ZqiMSc/bBX65dcYsEb0RraeHaUOxo/BKaTMNEL?=
 =?us-ascii?Q?Ll7M0qp7ClT7t5w/7cMKBhYDPN93n2DHkd2yhVUgH6HctjW8wdovEBmdJ8Lh?=
 =?us-ascii?Q?MfezrEpY4L9VZ3H/8JfiGkBIFppKKiHeJDWqqv1GaGe3H/4ay3SMyfT5eDXw?=
 =?us-ascii?Q?eJCm959mBSHkmdkpqYr6lAw7N74bvllBgjZ9x8RYU/XeukFga/rX9Kz09DQ1?=
 =?us-ascii?Q?W3fsWJqCWnR3VPAuFD/gVj5DQW+qTv+yeWa1W9D0QnVC4WQuQE9wfk+UMNwb?=
 =?us-ascii?Q?9hzZNzawDbj7K6nqhUnXkDoNLAnma9wyAZjjW9Ynjy/CyQuCz7mQMoLeh2ZI?=
 =?us-ascii?Q?xnykKyvhNa/APrxu8o3sy62XpBGU+00xhegMp47IcqoRAqUzeapjpDhS0k5q?=
 =?us-ascii?Q?si6nJFotwR72gjS+ImhCkCYla0OB/cImSmZLcYXjmM5ZYNxZv2TbdEbWLkfy?=
 =?us-ascii?Q?GZrqrbY7Y6C+2Zf2WdiBb0AggLEMIrXrIQuWrFqRMY0/4Q/WFz/iXKuB8+gO?=
 =?us-ascii?Q?Px8kVOoR1ADJm0L9lk8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 07:36:19.8413 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bb2711-2544-40ef-180f-08dda2715514
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8275
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dwljrn/jr9L648yyK9xCM0RopBkh8lWMZ7mVpKgcRJg=;
 b=cYSlgSrKNt/zqWoPjgSqf8LxOKaKDJdcK+2tchdHA85dwKLSr+fmb+OpVMN5Xr7ggdJBj5M81zRNi2F+e24Xe6k8vpFEsEZhqhIiq6ZxcRkG0yjqvCMRhCdSvikJZHS36kiy5GVjxef0qpb3eOV2yvQNSCrLC0HCjg8kWI0dYjM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=cYSlgSrK
Subject: [Buildroot] [PATCH v1 1/9] boot/xilinx-embeddedsw: add support for
 xilinx_v2025.1
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
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support for version xilinx_v2025.1 without changing the
default version.  This way, the zynqmp and versal defconfigs can bump
individually from xilinx_v2024.2 to xilinx_v2025.1.

In addition, new software apps were added to the Xilinx/embedddedsw repo.
While they do not change the buildroot xilinx-embeddedsw boot package, the
version xilinx_v2025.1 has a new license.txt file.  For this reason, this
patch adds a hash file for the xilinx_v2025.1 version, so that both the
default xilinx_v2024.2 and xilinx_v2025.1 versions will have independent
hashes for their license.txt files.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
Please only apply this series after the following series has been applied:
https://patchwork.ozlabs.org/project/buildroot/list/?series=459217
---
---
 boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash

diff --git a/boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash b/boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash
new file mode 100644
index 0000000000..0a42bab314
--- /dev/null
+++ b/boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  867b7c7652f754d1a3d6edfe76e53223670e2b4c7e4144d4db1604403d68f616  xilinx-embeddedsw-xilinx_v2025.1.tar.gz
+
+# Locally calculated
+sha256  fbee87edd32cf203fdd7925f0bab15c98e2dc1e0d61e70867f1190dc4a605b12  license.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
