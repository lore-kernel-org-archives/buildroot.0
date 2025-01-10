Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDE3E77188
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 08:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FFEF60AEE;
	Fri, 10 Jan 2025 08:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3OBQoyH4tDN; Fri, 10 Jan 2025 08:12:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8987F60AF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8987F60AF6;
	Fri, 10 Jan 2025 08:12:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E10A8942
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 08:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB956400FF
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 08:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 64tZTQW56iSQ for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 08:12:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::618;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7303A40112
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7303A40112
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::618])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7303A40112
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 08:12:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxiGYa64x1GNouT3ApHNAIUcbG0iBt4MxaCLAz/2/oPuxQoeH+gj2UCPNLxcPjtwwxWoo5jNyj+dEfuUlhx1QA02jO9bUdoDOw4PfQZshrumViwsu9ClN6Vmv6vxHXLLgd1rzhzIbBzELFT+gbKiD7z8cj4qL4hh0bliAzLFacbxR2tiWQwsMNg0Z5dKvsrE41ovHuKGphQcCm6/vY3WsG474JnTNeVt6men93tp8HWhUGXQsj05qtmk/k9ZAEOAcyR+dAFy7B76nv0kVbhfttydxaAiPAcUTxBXbprOaThpSBBlW35yr4CxqI0IixWe7N+sM+ifCdB7Co2s/u9PXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjr3GaxxwY96mXOactOBxfUHqApJzTBF1IWswxq/keo=;
 b=X32B9vPAO0N9s3a1/rGBPiXMZjI/SHIFlfH4alfj1rjBJMXUEE6AOVRPLhJJN/W+LdbtDrHmfyJTEFlWdXVGbt2nb3ke9iZVp7/DE+URNfLjVrACJDMDHlUMeDc8cCR/GTCYPPerdHXXiP/ecpjGhlcVFY1SHsOjc+8ztvZZM+fyjNTD05ewnA/nfagVLFfS0v2E9Qmg+33qecGnX3WFoG6qGY/dpCWU/0mJxbJ0dEIQz4RYTzF4RrS98xLEL8mRyeX6oNqwNwN3L6sPXUm9ACzg7wnhX0aK+U8HfgahTPw/gANi4YB1mNfJ6VfIcM5jNLcl/cw9egMmW4DItiLthw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0548.namprd03.prod.outlook.com (2603:10b6:408:138::13)
 by DM4PR12MB8572.namprd12.prod.outlook.com (2603:10b6:8:17d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 08:12:00 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:408:138:cafe::fb) by BN9PR03CA0548.outlook.office365.com
 (2603:10b6:408:138::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.12 via Frontend Transport; Fri,
 10 Jan 2025 08:11:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 08:11:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Jan
 2025 02:11:58 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Jan
 2025 02:11:58 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 10 Jan 2025 02:11:56 -0600
To: <buildroot@buildroot.org>
Date: Fri, 10 Jan 2025 08:11:50 +0000
Message-ID: <20250110081154.2481-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|DM4PR12MB8572:EE_
X-MS-Office365-Filtering-Correlation-Id: 490d06d7-a8e0-479b-33eb-08dd314e7480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wydbeb8gkqfelu4ybvoKP8L9K1TvFSNAQ92/ULTKHqRgMG4Xx2IgJ7bkSzcJ?=
 =?us-ascii?Q?Apec/W9XEz+Aup3h5gGDkJ3KOv/d6K+iKRjPeKPo7AdXghLlZ55CuAzwlV+a?=
 =?us-ascii?Q?C0ao+3L4cYlbovBIV4zB4Q44mGPCF2DBX9QT+S9rgWxVO6/eaSg9sFRjpzp0?=
 =?us-ascii?Q?mpuqOUhlzTeib+6JoDADyBar6oMCL2R0CtpDfk6UxPZSH33Kq256sYjbpoq0?=
 =?us-ascii?Q?o0ATrmgg7/hZ5WxgasnIX6MyByRimU52k6DBEwBZ0Vy/cfr7I2+uMTX7Aqzm?=
 =?us-ascii?Q?GjaGEdRM/Dc4guFRK3dZfMX3e4B+8iIWCXEGqFb7bJuHPtKYkpc6BFW40RhN?=
 =?us-ascii?Q?thC01ez1XAfYmFWoj3vUf820zKF/G+oj9c0VYT5zycenLxm7+al8qvXN3jY+?=
 =?us-ascii?Q?49lQ3xWLCZQf1NA4egCD9IfJErNsQA1WC7cV41g6hG9vrnTP3MF3RvZOXScC?=
 =?us-ascii?Q?mBLWa9OoSrTw5xG278ntHMpATPNIl0dQIDuhSWvvtg44rQVDUbgXLkyedsVA?=
 =?us-ascii?Q?GJFmzDWvb14hClUIdiVZAQ8anSFQfbeJ9eXjh2YUkTcyRmW/rKCY0Ll2yE+H?=
 =?us-ascii?Q?pyCOvvWDb1IO29ZlHMgb0iQ+XLlrgpWEXe7yGirl3cVOr/8Wu0B44UO8TX12?=
 =?us-ascii?Q?bspwrAaqlbPM9UQY66mID1GxHRxsYeMZPFHw9O+sLPxKyupBVm8wcOWk5B23?=
 =?us-ascii?Q?HYQOOqODo4NxxsKMMHfC//JTbcnYSVRv3lPft0NehLqoADN7bK9WYv6NEOXu?=
 =?us-ascii?Q?pEFEaZOzND7Bq0HZyWllFV/yR65Ce4xaH8bXNShuVmMbdSyXHpSpzbbwNel0?=
 =?us-ascii?Q?AVZqUhXouk4+KFydF6AfCbdXIL2ZIVOQy91HvSAGoRxt6ZksEx46g/SsImtg?=
 =?us-ascii?Q?eMioCDkO/FAIfioubwlgr2Rw6TUDZcBl1AzCOTlOhzt+hGDekh8PSo52YE83?=
 =?us-ascii?Q?irlJFkMIkMbv1En4FmlVsMO9LRxpSrPisFYR7ZCk+XEuwAe1pzRPuITt6ccC?=
 =?us-ascii?Q?JG9GgZ040hyuKqgiZaGhCZIamiGWM+VHygcCOYHF8aZv3PlJ2JvNjfU64PWy?=
 =?us-ascii?Q?4w+cOWAxYi4GxLOWatiHsLca5el3ZxuV6oK0YWHYfg4hmtp7QanV/mMlKYmt?=
 =?us-ascii?Q?oT7YRJv37HpWD20ExSRvC1FaIIGKrmrBHG3ZkM2YTKMb/Pyo8YwjtXQJJc9n?=
 =?us-ascii?Q?zE6z4T9y/FA1eQsqHtA89Iebj5IJP+4k+rdGiDeyUgpTrsa68obeUPMwmJgD?=
 =?us-ascii?Q?i9Z00eEKvO7yiy/J54o5XKRh2xEiAlp0V1CnUDf9t1JzP0E38TYkyBbEfKmi?=
 =?us-ascii?Q?PrLFxy4xsl4bHGYa8QN0LhUFO2i8WchZPuHg75CRxGRHhEp7fSdcZpmtWg9x?=
 =?us-ascii?Q?PzPdbzm4D25VgZ3vnsog4MQEZ2XZ4i6+ND+dVDrrmjjP5FpJy+Ayh8ddFUfA?=
 =?us-ascii?Q?Sj/y3ggKx6F67TvBgck66QdlzEp1SOLn3ED7xtw3U+DwQzj9CJmU//iLofGc?=
 =?us-ascii?Q?MiKDq8TQKjhuH5rkSeaaAlbPWeiw2N+gFA2N?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 08:11:58.7466 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 490d06d7-a8e0-479b-33eb-08dd314e7480
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8572
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjr3GaxxwY96mXOactOBxfUHqApJzTBF1IWswxq/keo=;
 b=2BM+INg/kZ3cXUjldNJZaeET6F0DJIyLz9/9KPJRnhx2taMkLpZ9KxquUPMBLGXE1gcmk9PTP383RJpRgIsfzi3NDCVCU2zDlXfKO2vNtzcpO52IkgloFMBvaSTfOvN1lSuh107K2CdzLR2lunqe1VAP+yhon2xoWyRhbBgn2QQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2BM+INg/
Subject: [Buildroot] [PATCH v1 1/5] board/xilinx: add hash for Linux 6.6.60
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
Cc: martin.chabot@gmail.com, brandon.maier@collins.com, ju.o@free.fr,
 juju@cotds.org, michal.simek@amd.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds the hash for Linux version 6.6.60 for Xilinx boards.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/xilinx/patches/linux/linux.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index 41bf2141fb..ce93e4016f 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  8ebbbe2d40597d9a5f36d47a1dfe4caffcef3d9f5ffa059ed4504bb761282593  xlnx_rebase_v6.6_LTS_2024.2.tar.gz
+sha256  f59c7d260794d73ee519ba2579ef41aa8ac4985ac5af9461f94fa314969acd2e  xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
