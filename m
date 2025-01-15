Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FE8C02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 09:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBA4E415F5;
	Wed, 15 Jan 2025 09:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E6a6ctBEqlYd; Wed, 15 Jan 2025 09:50:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98584415F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98584415F6;
	Wed, 15 Jan 2025 09:50:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02D5694B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 09:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4E01607E3
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 09:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWIrSCDuXNUR for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 09:50:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::608;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2FF5460817
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FF5460817
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::608])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FF5460817
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 09:50:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vTxFdFD+0nraIV0AFxz5GPRwwhAnPz1ioAWyQ1PlQOigbfrS6VDYH/1qhfPFryOmD7cjZhV7FYeEx3oJFzwlm2RzKhYQGuDI4ckcf5dizAc/HPU0aCpswgagjmnyEfJpkMWfuSBlRm6SyqBGKebvb23B71wIiNFVWuZVobvlDcLC8ncVsfFn9Xqa2DgQ95Ln/um3ldXhF+eSRLJgURj3gopwFCLbw2TkP/+FXZFkmcS8RzbMTwhYIN5jPlxWdEdzGjltyQZDK8DaC53pQXm82yS039brgj8TNcKNzjZaqBsRPJOSdMP2D6C4UTZHAenqXDXFJCa07wVA6ZbY4mAs/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rR1EOqRlhqVIH29KC6tvqCAxs+tIPudf1uKI/GmPOfI=;
 b=nGEpjbF3qQ4nAUIJpWLQ7dVQcJ0iJT/NxsabOmyR0DF+H8j4pk3PYm3eSpn7nLshesClmkkKCnCe1oetp15UMIuvbhvVVC6HXWDjRadwi+TkJMEFfafvqI7eG3H0FbWj1m8g703S0ogbO60TUBNkjlGaKXmSgASE+W/JPYR9qNzbyMmA2wz5TINip0Cw5a5BR306fPEWf5rjeT8vXMLpeoJMER/c4hfjz4ee787TftPMMz0sq1zR10PcIPjfMClFwqZ3s1f3QT9TBoyuzxLiY0PPQO7cJfl7bPB9KF/+2Zx7XuGO4uJ7PNixkWXiXGkJwHVlHB7V9moI5qgGDbeIUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SA0PR11CA0028.namprd11.prod.outlook.com (2603:10b6:806:d3::33)
 by IA1PR12MB6114.namprd12.prod.outlook.com (2603:10b6:208:3ea::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 09:50:06 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:d3:cafe::55) by SA0PR11CA0028.outlook.office365.com
 (2603:10b6:806:d3::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Wed,
 15 Jan 2025 09:50:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 09:50:06 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 03:50:04 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 03:50:04 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 15 Jan 2025 03:50:03 -0600
From: Neal Frager <neal.frager@amd.com>
To: <buildroot@buildroot.org>
Date: Wed, 15 Jan 2025 09:49:56 +0000
Message-ID: <20250115094956.2468555-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250115094956.2468555-1-neal.frager@amd.com>
References: <20250115094956.2468555-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|IA1PR12MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: 1246bf42-f465-4840-dc69-08dd3549fdb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vjC6NkbG/AxmtuJvHRlmfB9jc18UlVAMnEr8JVg0vOPPlBsV6JWwFFwfS5Xg?=
 =?us-ascii?Q?qIhcC/ZR5dY3hGXH43euCmeK9Y2t88LgRWTR6j5f6KifqWooK6lWy5Dtej75?=
 =?us-ascii?Q?6pr5oHJzT6gdFOnz/7jql2r1vONnHrOqBh/rNv6IjmunU7Qfjgs1/yy5JAXV?=
 =?us-ascii?Q?GDs8UcLvJH1zcikd1X6pb1mETvZxn6LY6rB18PjDzD4G2KJKI4LiWNb5kQZd?=
 =?us-ascii?Q?qkU+ezx88t2mnarIeHU6KB12l/EcFp5KMFbo+un1ahUheKgCD/+Dyhututwz?=
 =?us-ascii?Q?n1sC2oBYx80WEdycTUw4+Pqgy1JqpqkilACbOhE97XnZXTZ/xwu2bprCXupo?=
 =?us-ascii?Q?hBppFquoq0UTcf6v2W8kT6UZcRDLd2Db+okbWfWfQM+cNfqawoeH3Uv0dWwD?=
 =?us-ascii?Q?mbX9dQA50itvjvUsGPUqQIu6184Hgjtn0mvdEqwFz0Rt7VgWs8KY8XQQDKgs?=
 =?us-ascii?Q?aPdh6s5SLAVXB8QOjXXjtjU3np0wi38GhCxFnQSvXL/DZgaq2xosTReW/Z56?=
 =?us-ascii?Q?VBxPj1J+kB4RZHxUTfznloLSO/t0GYpz1Wud11TXRrZZ87gYlIoMlj/4uFTQ?=
 =?us-ascii?Q?q8ZZG7DF/BMEn4HcxeWMyJh5nYV+AfEfK00FtaCRfzvBYsvPn0oh0H3djVtu?=
 =?us-ascii?Q?ipBbdoTr2gyCwflSX6suFe6u6aLDFBkYjDbdpiLyqUnqbFhNL8kGQeKWwy0N?=
 =?us-ascii?Q?GPI3hA9wB4xEP2e80ys5P5RtVY7LhN4qm985dHyPec9FuWquV+5mjg0R7hWe?=
 =?us-ascii?Q?YvA++YJAD6vi97C3Vz4mMnNT5+sgwSyuIrLQYtlYA7wZtJQ2O+UXWSELS7i4?=
 =?us-ascii?Q?+LR1JvmISAwdg9myinpQh94zs+axfq6wFxcyzuRUfPJaOm7hGq8AXrxmuQ1F?=
 =?us-ascii?Q?68OyMFjdwykh+7aXbIsbXcsCWBQ7VyUDXjnc1JXJdMOKN4783W/8iPrtPW1I?=
 =?us-ascii?Q?tmoAnfcKQJ4i73DC+8MdtiYMtqjOSwkk5HK3+lwAcExeCBdEQcZ4RqQSi2Us?=
 =?us-ascii?Q?vvnaBCCDSSXVfa/kC9CL9BMZ0fYvX4dra0D84/5cyE8QO3eYFhp5uX5rSJNB?=
 =?us-ascii?Q?8QstPebp65LtABckxYXUwko4D1ZYURHT7hiV4WpYxE/q+IpCVNwAKYxdxjs7?=
 =?us-ascii?Q?9RxAR9q9MZptvIADGSskuBR8kzPO6mftaBRxeqUmuKK2rFRaQLmWXobdyIP6?=
 =?us-ascii?Q?7AzXT7FCpLFOrdHAbCKHEodmx0KLEXIszH5Am3iIKRVCxktDJDGdLKwkr3Zj?=
 =?us-ascii?Q?E/8PuFNP4KiSyRBMcB970WVTmJhaR2+dDiG+OtC95gECwKWQYtHuT3eBlscR?=
 =?us-ascii?Q?5ZDEjTQy681vh0RX5v6ofG+yYfg3IpyOruYdl+1ZRrApSVeYBy02VhCLQbHr?=
 =?us-ascii?Q?kaOUKT3+OQtQjdwUaojDcUsGjVKm3HOq6F69sqyh6CLymhTLsQMKnpGTUEGo?=
 =?us-ascii?Q?FpOhSgRIGqmQ7KTPEkZKwV6HzmXspZpRcwFdZe4Tu1Yp8KA9K43/kpfNokot?=
 =?us-ascii?Q?tVHF32W1Vi3OOpoVrffoWxNqgtaYo2e+uo5a?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 09:50:06.0873 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1246bf42-f465-4840-dc69-08dd3549fdb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6114
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rR1EOqRlhqVIH29KC6tvqCAxs+tIPudf1uKI/GmPOfI=;
 b=QgcY1Rna9iU75Yg10WVLmPLotBtEgl3uVJRcLvA4CPI6z4scCUFg4+5a3vTB5/8uXngdP6buhcY+9DSzsZbrKg4Y+kSypU4YiNNrTptfNppJkbXQ56tQLxugN2wtvO9CLu4TzbeC7YYogsjo1ttdIVez6t88GmECo0RBO+r9vLI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=QgcY1Rna
Subject: [Buildroot] [PATCH v1 3/3] configs/versal_vpk180_defconfig: bump to
 Linux 6.6.60
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

This patch bumps the versal_vpk180_defconfig to Linux kernel 6.6.60.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal_vpk180_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 604e5f69c7..1367760325 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
