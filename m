Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BA0C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 22:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A319C60797;
	Sat, 25 Jan 2025 22:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4D5P-W_ns-UR; Sat, 25 Jan 2025 22:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B0386084B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B0386084B;
	Sat, 25 Jan 2025 22:49:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7567894A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60C4040A60
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uhlFdvmdqoz3 for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 22:49:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::62c;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EAAF04003A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAAF04003A
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EAAF04003A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:49:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CkWeYhqvVmdfL2W/MraRZODY8S4R0ZMqRUr/QQwqEBo0XFjk2aaBKKwvQn12K6WiQXvbPQ8Ttb8mKIg1sbHDxJxjyH04YgznCt86ZjkQGssuCikS4qoG6Mm8pnELetZIWdNr2v+YaRCumv6nw4p7dEwy1mk2/y2aC5D3ELG5R6FhAkV1XGci0T1pK/cRmvIDTEBovin3hRPct1CtBe9On5IGO2kEMURUFpwW7w/zJ0rR4kcSvq7/t/7BJI4bdWRPm/QM7pn0bqMaa4uuNy/Zi8KFeaNSWawZypckEN9QLSY6VFtR88jvqSYm1d+N2tXgJmoKKTRrTfx0617Xsp4nnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/paTS/ciKObppkHf4qSI6aa/uTwDIWQC+LB03MlcuEg=;
 b=Y4yNgPfWTjQjLhg8u4tFUECfDFugavyBmTf/ebhtQb9kZLhIgoBzOwmLR6Wpg5u9ZcOwhD2m+oxritmdKzQDgqP0estMzYxkVpBzLuFnzF67YR1U0f9/FNPvaOUEyLuaE7O+OmlmsvKp9kkhPK+qrN+/eNBoltCSUh2xi6sjHXhdyfjfmos447Jcp1JL6N3pjs4Qx5wyH72zrGRb5bIbfB4Yywt6qgpPFD7Ju2q8U6/0JpiHUmNEs8hBe510XZCXxIzcu4DNzTY5FkatLBZKv9DjtGKyASWFRnjV1wkm7/Ek4hYKkQUrUl2tVj+0XG78rw7r9B37DZSMEBqMcs03QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0879.namprd03.prod.outlook.com (2603:10b6:408:13c::14)
 by MW4PR12MB6852.namprd12.prod.outlook.com (2603:10b6:303:207::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Sat, 25 Jan
 2025 22:49:41 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:13c:cafe::8a) by BN9PR03CA0879.outlook.office365.com
 (2603:10b6:408:13c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.19 via Frontend Transport; Sat,
 25 Jan 2025 22:49:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Sat, 25 Jan 2025 22:49:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 25 Jan
 2025 16:49:39 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 25 Jan 2025 16:49:38 -0600
From: Neal Frager <neal.frager@amd.com>
To: <buildroot@buildroot.org>
Date: Sat, 25 Jan 2025 22:49:26 +0000
Message-ID: <20250125224930.3639111-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250125224930.3639111-1-neal.frager@amd.com>
References: <20250125224930.3639111-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|MW4PR12MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: 92fec83a-c9b2-4bc2-840b-08dd3d928daf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RwPTwtOwzli4fw8lkgM0o1Z7HVvYSKvS3URo9P0+J3eIa91pRpAH5riuDQD3?=
 =?us-ascii?Q?cHky7v6enKwLgRgQgBvXxNOF2T7exiiWn9fg3KR1tYCKEU5XaTewHIBXoIlC?=
 =?us-ascii?Q?geMPDypMZNptXPeWBvyt9zYAzCfJE3TOebL2swVviwkwHmtX0TdQWnoi8eck?=
 =?us-ascii?Q?Xwhxoh/dSNjycERmo4LkNhvf4TEk6hajTVrIUNN3VouLghxEQXRPhsQWjxiq?=
 =?us-ascii?Q?PXdBJV5ixL9Z+bUJUiktOPiSd0V127KF/8FV0pDJeOih/DhqTK/KrvgwJME0?=
 =?us-ascii?Q?9kfyVMvGzPi5jNZtVGbuuzJucWKpQO6Q9PqIxDk26IuBhvrUrY1UbaEEp5US?=
 =?us-ascii?Q?9begPOXoetM+4l3e7q+h5zuVPDPpSxa2xwY4Mqw3TuvwGMivbeT2Oj9I1phv?=
 =?us-ascii?Q?on6E2ZQfK6iOdfwIwnOpDgJabuEcaOdMspgYcC54ralq9fatuz+GyIcrrgTo?=
 =?us-ascii?Q?XcSZB3LrTRTiEKk/m+CCESFiI+nbYqF3JHdz+4T9dG+DiaKjWLOB6EDIQo4B?=
 =?us-ascii?Q?s2iEVAN37l/pY/HAr3F6s85WNMEDGMSfHk3A1VfxCNxgkYuD5mNNktRwts2u?=
 =?us-ascii?Q?Ay3oXewy9CfRNGGJly/QshHVb1Sanfco9gt8+4AcSm2XLAu6rqbQKGd5MOPt?=
 =?us-ascii?Q?kH9zsVsoASP2JBFysSpblNgz5QEODyXiBIf45NlI1g87ysX/JiE8guB7nK4y?=
 =?us-ascii?Q?5DH0Ha4AYCco94lSbIrEJfiHm7qMfRZumgO37aSlROOwoABVhtvHcsX6MJtx?=
 =?us-ascii?Q?G1iQhx72UNRUoSuNTe0WjLfw6dU85oVVsvxi3qm3ehGdFhEPp4wmSVKnoDw2?=
 =?us-ascii?Q?GpcztD/ncEY0+QdyqfwbcdgS8QVdHP0eZhJc/UYtshmsUCcNJfoJSYCgBNKI?=
 =?us-ascii?Q?63aZNwFz83D71HWAs75wZ7q87KPqPK/XvtUEEByqngDISJZF9Dn4cm+23Zqq?=
 =?us-ascii?Q?Xpjx0lNjG2x0uAu0OhZ9zJbVDqd0/IGWcbdVOBUTL17lfRMcsYlU+aOm0qSn?=
 =?us-ascii?Q?uC82MHim1/Q7LbbAUeeps/fn//UL9u+qlNnq9azp92RgZQuSDMkKcII99Ug4?=
 =?us-ascii?Q?sTvJyPaNY06l+NnV3NV6iPpVUzRUyJFv39cIWw/IVA+fELnCXLZpethGbUT9?=
 =?us-ascii?Q?OR7FrDVxGhocsYPzbm069oWi4JxNoFIzx0VCHWI4PEyeSKIHUixA1MI3xbeH?=
 =?us-ascii?Q?vu9bj/DieGNGi4OX01C4I+c8SOsr2oDZm8lvz2NDeJx3GriJHWUpDX/Tx14F?=
 =?us-ascii?Q?P0xYOFzPFRRUejPB2f4z1FiS5LVtdbqycbUjK/xDzs+mEPFHmS8Nc7NLkN/u?=
 =?us-ascii?Q?81Sic+pMz9FmBDplNNtESIJT+EmNbTbr05w6VyBYa3K5tDCdcNlPM4mMFNky?=
 =?us-ascii?Q?xMiBsqaPTnX9hpfmx5A5F9z53FgMo71eRWdhmiQymZ2qt9RjNqpH0TXeW9nL?=
 =?us-ascii?Q?kHsCutqExlzjxnTOFi7ktI0TLerHOBPlJzwGNHKhzyXv5OBd2o6KTA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2025 22:49:40.7463 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92fec83a-c9b2-4bc2-840b-08dd3d928daf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6852
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/paTS/ciKObppkHf4qSI6aa/uTwDIWQC+LB03MlcuEg=;
 b=cNTEL4dEcySK0X25dV2JBR8Wg7uvgYqiZ9j+jGNmkUQwM4/MniXbR2bq/xSX7I5CbyX/NHfW2uDDEWBi8U6F1fhKsT3tRjG4ET0FAPA8qUp5kF1q4uT9Ge+51+A0TH3pnoWOqiK0M+zKzYDdBLDG1BVSlAeTonNVTtr6AcNGwV4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=cNTEL4dE
Subject: [Buildroot] [PATCH v6 2/6] boot/uboot: add qspi.bin file support
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

u-boot has introduced a new file called qspi.bin for users who boot from a
qspi flash device.  It combines the spl/boot.bin and u-boot.itb files into a
single binary that can be written to the qspi flash.

Here is an example of how binman generates the qspi.bin:
https://source.denx.de/u-boot/u-boot/-/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca

At the moment, the qspi.bin is only used for the zynqmp platform, but other
platforms may adopt it, so the buildroot support has been made in a generic
way.

This patch adds the necessary support for buildroot to install this binary.

[Tested on Kria KV260 starter kit]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - added dependency on BR2_TARGET_UBOOT_ZYNQMP
V2->V3:
 - no changes
V3->V4:
 - changed config to BR2_TARGET_UBOOT_FORMAT_QSPI_BIN
V4->V6:
 - no changes
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 13d45140eb..f17f932c9e 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -470,6 +470,14 @@ config BR2_TARGET_UBOOT_FORMAT_SD
 
 	  See doc/README.mxs (or doc/README.mx28_common before 2013.07)
 
+config BR2_TARGET_UBOOT_FORMAT_QSPI_BIN
+	bool "qspi.bin"
+	depends on BR2_TARGET_UBOOT_ZYNQMP
+	help
+	  When booting from qspi flash, u-boot can generate a single
+	  file for flashing by combining the spl/boot.bin and
+	  u-boot.itb files into a unified binary.
+
 config BR2_TARGET_UBOOT_FORMAT_STM32
 	bool "u-boot.stm32"
 	depends on BR2_arm
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index efecf2ca47..2796b0a310 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -108,6 +108,10 @@ UBOOT_MAKE_TARGET += u-boot.itb
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_QSPI_BIN),y)
+UBOOT_BINS += qspi.bin
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX),y)
 UBOOT_BINS += u-boot.imx
 UBOOT_MAKE_TARGET += u-boot.imx
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
