Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D998D1118E
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 20:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F0ED60B66;
	Wed, 26 Nov 2025 20:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYJYf4gRCrlu; Wed, 26 Nov 2025 20:23:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6625760B71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6625760B71;
	Wed, 26 Nov 2025 20:23:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 49E8035E
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 20:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2525260B71
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 20:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28nEQffR5emo for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 20:23:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::1;
 helo=sn4pr2101cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2740E60B66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2740E60B66
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2740E60B66
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 20:23:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/YZYICCunXbOcz5EgZMKRLrcK9FP1/KYYWDyQcPXIpV7gpiT6aSjI5Pzr6Znkt3t/Ia9XKL4Jh2v567wgDfzVyWqjLPwUUftCXhprqmP96SpzXn3DcgYxU7TdJK/FCTYIG1aqyshPOitoRtG9+g2ylJmzko6bngDaKb6gdxn/q+r6YHjM79sMeEkzl2OveM4+Zuv0KdqKYK+L6LcjFESMQfoQMJkQ1u1O5zCtVv3+aa74S+I43hnkVTQh9fxDf4X55yxeuZiX7Vl3OnDTWRdR3xARw6L3COPZIg1ONSTSs2WrSbKC62Uhr8s0lNwe4YbUicTEobvPXTqStXe1Hfqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYnJPjeGv8b/9WqR8k89cR1DyOv3u+WI2xbGimJQ8fo=;
 b=joket2tJN/r3ruavkX4cF7Cc5CTpyN585aqiTrPIqxsaquoJzf7wWckmtahzD7jB9x8m0yezSlaA6TXd+wjPe4YzDzeV+bkZCDd587I8EuvU/YKZ4bJLnVt0xVPpoLeZgKALTNkcXTZAOC4CxO76CEb83PISK3r1XjZ/rMo0Mc7ozqRA9lYNLDbG8jX3F/7FyASkijLRaYOPBEdgqazT54qL+qgDoiykNby+xpJEUXVsdEvW5ZWbvHnpBtm8zlzukAsrXuYizRcb/+gQGGuzaKxv6EB6g5+EIw3A7nd1POY8+9/z7JQYsIWAam7nVP1Cf4pcPBlsVB/BsOHoDai34g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0148.namprd03.prod.outlook.com (2603:10b6:a03:33c::33)
 by SA1PR12MB6918.namprd12.prod.outlook.com (2603:10b6:806:24d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 20:23:20 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::3a) by SJ0PR03CA0148.outlook.office365.com
 (2603:10b6:a03:33c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 20:23:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 20:23:18 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 14:23:17 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 26 Nov 2025 12:23:16 -0800
To: <buildroot@buildroot.org>
Date: Wed, 26 Nov 2025 20:23:05 +0000
Message-ID: <20251126202307.1269790-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|SA1PR12MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: c879fc7e-f6fe-49b7-94cb-08de2d29a358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|7416014|376014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AIpIXty2vlnQAEWysSXPwo9F7f7EvnCohsZL2uYwutGpK5xAPcp14qRrJ9GT?=
 =?us-ascii?Q?DFkSxzHAwU3UOFKUTpvwGxc2h4vyp5HolRoQI5petflBYf9CKflF4TltR3zP?=
 =?us-ascii?Q?h73lNdFt1N/CmeVUyBZcobi0A+UGdACFdyiZDl+Nmn0zve+OFf847zZ4/q9k?=
 =?us-ascii?Q?a0qmnxTz9gPA6WP625/EXWQtGM+8tRilmYDNbv7VHGlTHYd9oMYgfROHNWy7?=
 =?us-ascii?Q?qTU6HqzeCpJnx6tvqpBdWDa1WIAXlkfhkQcY9jB4tTnI/YmXMGxAx5JqWAyV?=
 =?us-ascii?Q?9ooLZ0rkKQMoL6FIyDrb761w/LjjmeKQJVTshN4SLkgQVIgWBIZ4G95j2BY2?=
 =?us-ascii?Q?eWhm/NyLDMl9khxoUxF2tJXALt8dLjexWsGRTKC4xg54M1jOH+c+V4UKsRn3?=
 =?us-ascii?Q?sKw76Xd/QUbxL1kfEJzNuVNxtCWrCIBoHri9tFEw+z79Yv8BGUwDBGXJhMQl?=
 =?us-ascii?Q?r4LDyofBtdXqZRqn4cIj+fgiOHWpVH5BnFHalaLAzQfk3AmyElO5oQzTS3GB?=
 =?us-ascii?Q?NUCi7BJ4q0sg1HhfEkJbjGOpEXpdj8HFD1QfM35c0CU0s6mZXNDm+5JZzNh9?=
 =?us-ascii?Q?EFohxnbJd6OGRmEdyS2agjNQpi+K2QYe2hjeqh4Qdnyz2o+8fBPoJcngCjAk?=
 =?us-ascii?Q?qYGQbLoZfeEFPI6CtAaoplLffd8GPRJMiaTOyt4pW8DyISK7VMRaXYcpintB?=
 =?us-ascii?Q?uhSrqSsCfhGnxqbOQa3xQja3CQQJem5Q1arXDdCdL0ZTkPC25Q35NHhMicN7?=
 =?us-ascii?Q?UEvbp8y3uA0Ba/UEPeO2ZqRPOf26/j7YFGl13ARs74g83u7JhsN+s+c5ZYbe?=
 =?us-ascii?Q?aS5bJ/EkknSdeiykHyE3Dblg/1vagDjeJEYPBGvwexX4aA/lxn/7a5Io/qnI?=
 =?us-ascii?Q?/YEKSo/Rk2n6s5TK71fNawfPy8QGJkkHREGtmI8PLFGrpTBGkVH89IistRBW?=
 =?us-ascii?Q?wyWtFedtgAOgogO6VswdahAdek4pncM0+Qjof9x1NwHx6iqSt5stCItKjSh8?=
 =?us-ascii?Q?hqQFO5r/zBDlWUe9iGSt5nmuSdfIKXsKx2Cz1eu9L0XKUADiYKxLNVCBx+Bv?=
 =?us-ascii?Q?BsLD0+LMLgqzIKUC5NFTcLTU2D0tEDF3OIyCXeKf7rXDTb2StlpgTukJj6m3?=
 =?us-ascii?Q?ZwjqG3aXijBwz+rNcPx9zCbP/olPqSEaBFnjGB4ucYKHoUI/EEwlDzZtoyC1?=
 =?us-ascii?Q?yjnCz8K6g2a8+CHhA4ficUH3HIGJZ01sbwYQ0FmqgUJtNQvWDJPFI08Bnkwf?=
 =?us-ascii?Q?tj4KidUSfWL5hbSE5f89/YUlj+hYwgoY0uDPDH/bWCbtx6bx33HFBqz+Ppy+?=
 =?us-ascii?Q?Al+7AEItkU87gSFCsNHfzYHWmijJoReUblwza3tRNhd0JL6F/6u0kasYdezn?=
 =?us-ascii?Q?mgptxpr4nDzbo5dqYwV59TS1HOMqLjtWlltyZMQZSydP/tDjT9CBMnt8dEiq?=
 =?us-ascii?Q?NwH+ZYh4X+2sV3dutnX1soPOHq3I9YJEoaAVZyVh+ocgLoQxL5MPm9+UI+3Y?=
 =?us-ascii?Q?QDyVbRoxb+t1IiuMbraMoa9gCg4xGme0JtONWS5EAzbO/vcvCvCZKrZOVil3?=
 =?us-ascii?Q?ep0ZB6X6ChikAzciOIXXe0atFHU4W7ZoeuvYtIGW?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 20:23:18.9250 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c879fc7e-f6fe-49b7-94cb-08de2d29a358
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6918
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYnJPjeGv8b/9WqR8k89cR1DyOv3u+WI2xbGimJQ8fo=;
 b=mf4m25UJJE9WtOPVJo1mpEYP9YkaApSsdg/Fx7KLfDlMI3wW7IQ42aZfAwbuxJwjFL6Jr0bfbRaI7bmRK5wlwHtlENGXoQ5P+51EH/Y2LqKn4XT+8IrGdvqG5nN2v+oRJEluBpzMo4TcZ6troCKNfsHwVl7xK/FiM+xh6mGc15U=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=mf4m25UJ
Subject: [Buildroot] [PATCH v1 1/3] board/xilinx: remove xilinx_v2025.1
 hashes
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

Now that all Xilinx board configs have been bumped to xilinx_v2025.2, remove
the xilinx_v2025.1 hashes which are no longer needed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
To be applied to next branch
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash       | 1 -
 board/xilinx/patches/linux/linux.hash                            | 1 -
 board/xilinx/patches/uboot/uboot.hash                            | 1 -
 3 files changed, 3 deletions(-)

diff --git a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index ef387496b1..429f610a56 100644
--- a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  4d16661f367adb8713113acb420a1ad5f611ce6a309e98005a8ea3273511f03d  xlnx_rebase_v2.12_2025.1.tar.gz
 sha256  ea59fbfb702857a24f96ee8e9cf04f997942db1de98f8406b7daf9dcc8f4e9ea  xlnx_rebase_v2.12_2025.2.tar.gz
diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index 3ecbd03a27..90feba3d62 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  ea55acf69bead3d4cf121de414cccfbe75a3c36465c93d9500cc00688d9b8d9d  xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz
 sha256  38aec9ce252ed6a0b64d294d4d58bf51e25b249eefb31b800a5ce62cb084298a  xlnx_rebase_v6.12_LTS_2025.2.tar.gz
diff --git a/board/xilinx/patches/uboot/uboot.hash b/board/xilinx/patches/uboot/uboot.hash
index d46063b7b1..6ef11ef02c 100644
--- a/board/xilinx/patches/uboot/uboot.hash
+++ b/board/xilinx/patches/uboot/uboot.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  b86d6f07d16a83ed0bdbd9b9439e099afc87ba7dfb77246e2472183848e2ea93  xlnx_rebase_v2025.01_2025.1.tar.gz
 sha256  8819cbebda739436d5d2fbdef578ec3c9b902f7edbe0ce4ed6f0ddf254fcf2a7  xlnx_rebase_v2025.01_2025.2.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
