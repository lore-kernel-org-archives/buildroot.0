Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E4FCA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 08:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A912941489;
	Mon,  1 Sep 2025 08:03:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kD1v5_Pb8erE; Mon,  1 Sep 2025 08:03:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D8BD41480
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D8BD41480;
	Mon,  1 Sep 2025 08:03:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 21B6510E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0849140457
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9G4ccQhSYotH for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 08:03:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::627;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5671B40455
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5671B40455
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::627])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5671B40455
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:03:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XuFWMqJ3doq3sj03cq8q0AOWR5V+SCqrRTT5aGoHGQzrlsLOxYAoSKTY0nEdyY1uODmKsRmOl/C36u2+qZZacJ3aAekiOaxJPvVrGFVKMQyzYmxCijAZdLiOTQhQAUFpGOKlBGjz3H9dcvVpizHWNrOPWT3U9arD2OmLg6REYhKYJoFHSjd3U+DoMthYAku1bzEN4EsvlkIsST5+s4jaXpGk5fQCdjHyB5dPfRxhwpcSxvDmL/+pSm8uPlqiF+5Ll2vXOATU+xCCv7KmU5ZJn59Ni+o7F5rD+XPQd+gHwvSIw7KaozYmEyYQjLQiHUjyEXLjxfKq6129ccsj2+BkTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuB0hw87qyYc1DH9g2ntXK+OuDVyXIh+N2Eh8YBqJJ4=;
 b=yK45uc8dIy0WFFq+FZm5+i+3D7+8sLdTmlun4hDIu0P7gK5UHyLlN9+YrAteqBMSHn1CwkTE2XF8y3VrZYHirOoFwnypdB0efIQ7UvL3I9fLDB2a4lsG4EDZ604Q9UGc8JRMfcHujh7m7kRU+RBTnum51gYuRgyy2LjZKueUey7xphCeooaVqtimH4OtloohdacxIRlXjKDAMe521cMAQqBLbQICxQMeLBJ429biXOcKs+MoqMEgdLX2tQMy5bDoPf61bofK7Sj9pr+wp8GU1GjfJRv0WZEBqttv5zDHmsIYZjqemXymj9JtWGf/w6SI8H23NscCxvew+PL1Ly49uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY3PR05CA0003.namprd05.prod.outlook.com (2603:10b6:a03:254::8)
 by MN6PR12MB8492.namprd12.prod.outlook.com (2603:10b6:208:472::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Mon, 1 Sep
 2025 08:03:16 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:254:cafe::cc) by BY3PR05CA0003.outlook.office365.com
 (2603:10b6:a03:254::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.15 via Frontend Transport; Mon,
 1 Sep 2025 08:03:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 08:03:14 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 03:03:08 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 1 Sep
 2025 01:03:08 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Sep 2025 03:03:06 -0500
To: <buildroot@buildroot.org>
Date: Mon, 1 Sep 2025 09:02:49 +0100
Message-ID: <20250901080249.454090-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250901080249.454090-1-neal.frager@amd.com>
References: <20250901080249.454090-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|MN6PR12MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: e1809965-ba3a-4533-73de-08dde92e00d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gZx5sp1/cscO7egXkrK1f+T72K74FYf2aLbzcpPlMSeu68GiKXhXKR4zTuXc?=
 =?us-ascii?Q?BCOblIwKyW/3yMRUUg6Zlz9xB1CkiQ8E7Cx2LfpjaAPDA9Mgdmup2A8mJMrz?=
 =?us-ascii?Q?B7aMpRKNNXE2k6EynGwxcWqncAomret9MSVXzALXgoMHE1Vb3ZoLy5rdSaky?=
 =?us-ascii?Q?v8RbyHfsoggA0zMCuF+njW6ipKXmZKlu5FDKoj0xk1j+C5qLwwVEPvFb2Nca?=
 =?us-ascii?Q?kZ2xc8iRp5wgCf+uMfwKPPrAnDmrpWMaimc0ZiojJMvZCY6aTlw/Fh43GicT?=
 =?us-ascii?Q?/Tt7gn6oFcoheGZL2eCDEoRNP2oX3c0NjHJilPQgy5vRx8SHL9s/eyjOx9RE?=
 =?us-ascii?Q?wGVsJUuPluUhMg215xnvejoHa1h+3PRZC4kMO5Upf/vBP9NUZQWnwI1L68Xh?=
 =?us-ascii?Q?r9t8p+VYLPaXcYTiVqITOiHsrXU++AvDwVYn+/uEhJ02MpR1AGsHCLFtLYzS?=
 =?us-ascii?Q?rsmHX7UAjWcFjLyDj7leo4H0H7FnqWaxK5UQVtto4yiEYfIi8Dn+502oxzkw?=
 =?us-ascii?Q?t0J6T6ogHH1LuB4Mn4QahdG4a4H3d6SgiqTnJnSx5hV3lxY+kJTCFo6nPXl9?=
 =?us-ascii?Q?HvXRZFH0BwyEAi0wblMQGx6USqTGBxXjoOa+yIXnOwDJGBN16z9p0L9GmJf8?=
 =?us-ascii?Q?gPZbL+QJFE0dLnz3ZQnWk3aMzXnXkbLsNN7OJi/qmOSHf7ZBQP9yJwgFECor?=
 =?us-ascii?Q?ZT6JkJmGQ/dlj4Dz+X+KnC67FfYtQJ9Vcq5QQeMholy8xuDDGrupLL3VXc8V?=
 =?us-ascii?Q?YuFlkSF3pQXu+GRaK/1RhzU/VZLOJ9qIbdtL/UM1CkMLZoepSKo2+PI01GRe?=
 =?us-ascii?Q?7CFoLQ1FVR+ktCpmU0Q3CTrdUP/1NawEcxTbVkKc+8i2rSmaYxc83G1RbtC1?=
 =?us-ascii?Q?CgUTZNvk3Z2hnVk7EsKWjEz1pQ8u1SlNhR0ocUb9frqc3OD0h8NoWJNfOTnt?=
 =?us-ascii?Q?Xb8kIIwZhNoXQx2aqZEFq1R9X4USDSWnAf+Iz2QhRiFB14kXdS5lWxYJv5po?=
 =?us-ascii?Q?e/qNTxXRrXWKdX2zqmeCrjR8WDdaPYkjamO4JO1ydkxdh9S0t7W0+rQWRvQN?=
 =?us-ascii?Q?B800FiEVA3gmVTrg3IFx6QO1wCBW7mNlm9Xb2fAYYefyvtBm0xahNnCh7afi?=
 =?us-ascii?Q?fudp6BNNg18XFiDDzSXntfWi8C6ayl5cQhDO3LDxSeww2LpGa2L9kyOOvu7F?=
 =?us-ascii?Q?o5HATNxJ8PQDOVr4qHRArHRmNt4eyZ3sQ1ck/T2U+10LX0/Mjs3W5irogO01?=
 =?us-ascii?Q?pTDx84Mv8gEcjjkNbLi8mxpTbWA+GTsOEBk2RQ4aKNV4yOt2T2U+ITU5pkPM?=
 =?us-ascii?Q?e96on35rYt6NYBEXhs3TGSBS8rwUVcXQe7KHL8I/uSzyUmq7ccIbsl813j6Y?=
 =?us-ascii?Q?UAPdXkn2ghrGs8OOwWt96ZQurBqMu7R37PaLu6rDfOL1wWCpDWYZ/anVjUNQ?=
 =?us-ascii?Q?N5zVoY1yl32RZZrQ436AUBoKBjUfRN1dSZf0Pssp0KuuVmSCCFReYmapYr1E?=
 =?us-ascii?Q?N4T25bO5PJmCg8iFJULNCm4jYZ7YpuxaS0itG57q8y4pmUHezp/aQdQGu7Y0?=
 =?us-ascii?Q?ScrqMSw+CMGN7ob18UA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 08:03:14.6349 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1809965-ba3a-4533-73de-08dde92e00d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8492
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cuB0hw87qyYc1DH9g2ntXK+OuDVyXIh+N2Eh8YBqJJ4=;
 b=VC4TJGQIjAKrn1hY/gAw7QRCFU+7bSawQRRFFK4YqIiCR5OWJek7WqV4QIDtjFmlx1nrHXHr/RZA/axhIuSIbRSyCsD3S2/OAxSxC2Fgs+7+GO25oX3VKqsAtE2yXSoHIhkoXNQzTrRVzxR2MRoaa1DVOzMIXfoa5AHMsDXdjrI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=VC4TJGQI
Subject: [Buildroot] [PATCH v7 5/5] boot/uboot: use
 BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
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

Migrate the BR2_TARGET_UBOOT_ZYNQMP dependency to the new
BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS symbol. Also, add a cpu dependency
on BR2_cortex_a53 since the zynqmp platform is based on the ARM Cortex-A53
and the BR2_TARGET_UBOOT_ZYNQMP should not be available for other CPUs with
aarch64 architecture.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V6:
- new patch added to series
V6->V7:
- improved commit message
---
 boot/uboot/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 52e6050c81..0b27874e24 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -575,7 +575,8 @@ config BR2_TARGET_UBOOT_INITIAL_ENV
 
 config BR2_TARGET_UBOOT_ZYNQMP
 	bool "Boot on the Xilinx ZynqMP SoCs"
-	depends on BR2_aarch64
+	depends on BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
+	depends on BR2_cortex_a53
 	help
 	  Enable options specific to the Xilinx ZynqMP family of SoCs.
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
