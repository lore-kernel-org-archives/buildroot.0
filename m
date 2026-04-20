Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC67F5A8A5
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 17:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40E3D610B9;
	Mon, 20 Apr 2026 17:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXMibooBKZs8; Mon, 20 Apr 2026 17:39:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7487F610EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776706764;
	bh=LSfdCyWuJJRy1/IG6anDcBhx1muCKze60E3irq1aSmA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=nSb7EARyDcVSgiD96AXgBVo5BJ+8ycZ0HHNUPditEjSxBh2wnAPH8BJNXzvqtAJNs
	 gSLLSrLSeD9Z7PZM+zNkxcccnx9Y+QYtDKRWXUVhlZE4bgkbr+umlKb6Jxsv0B9DIn
	 2emZtmt58AEWwvrUCEtPgUEhPiWpXn0wrG6B0r1+onOuLoucFAuv843aw/+l4z9MGG
	 9Kh5roaUX9lhwUeWObBovMRlmqHGs0LBtq7L00O0egXAplY76OtE/tTObAnlsgDn56
	 jNQgUgjf4JDelOrGx77OgELVTDR9EA1y7wqt3bVMUYavfI5F56hDd9tmeaDdc1X55u
	 XRh19dgDLODKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7487F610EA;
	Mon, 20 Apr 2026 17:39:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 33B9F257
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19E0640873
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4VD_crujPQjg for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 17:39:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::9;
 helo=ph7pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D74640864
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D74640864
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::9])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D74640864
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:39:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kb8/ysJJpOU+y7w1xnmvsVLOwOwtfkjgTawDF6fZfTs/+OZQtdjwEhP3+XBo0FivXTShR0dXJDgVLzuPQV/vf7ifdRjgzsQFZrSHRXwAI9OvAhNttF7+OwOyuw+kCYxfbzSNHVqX7IV72wxVUcm359CxsTSnb6Xzj9GCkmBNtwEA8Cie776odOkmD+TfrunBdj1ad34KD5zA9Kqa5BtWjivEawiAsLXH9353BdBctsW/t7nCbuyG682DIMiQe4WcSN0gfDS1LIeRbxgH+zan/6m3gAIfjSoKH8S3DppFEnTDxuYxVLAohwKUQFdECVWH5BVdTlKDs43if9BJ7l4Vdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrvqq9I7US8if6pNhh8BE1X+6wpgSlXTi+2JpzjIxt0=;
 b=Y/eScCCN4G4z2Qhdrh+mppEpAd1h1ZQempsmSoaJdhlStPvKQI8gejx4ol2PYOD3jN1SnAP/zG4Vv53VputtezXe38+mCaEuirNqjuTTQX0xxnLoXOoo0Ky5P/jgOBGoHRRBvWNzBeY1gyoEcASmAJnqxirY87BRByeBd/E8byz4Hqebebz7RvX1qaz9mrTyVm8nnKH9DEeNmjornWv8Ywp82hnvqqmVRoDUGFx+xj47Cc/piiCNB6XHxnQJDdd+l4PjXo/e+IivVmeyq8II1q13PJU/T8ejcRypwrjcrdEr4WGUK7v9ibapqkD+u4Dzq+Lo+nl0/HUUbF9kzZJLmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN1PR14CA0007.namprd14.prod.outlook.com (2603:10b6:408:e3::12)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 17:39:15 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:408:e3:cafe::6a) by BN1PR14CA0007.outlook.office365.com
 (2603:10b6:408:e3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 17:39:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.4 via Frontend Transport; Mon, 20 Apr 2026 17:39:14 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 20 Apr
 2026 12:39:14 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Apr
 2026 12:39:14 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Apr 2026 12:39:12 -0500
To: <buildroot@buildroot.org>
Date: Mon, 20 Apr 2026 18:38:58 +0100
Message-ID: <20260420173858.1655069-6-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260420173858.1655069-1-neal.frager@amd.com>
References: <20260420173858.1655069-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|MN2PR12MB4111:EE_
X-MS-Office365-Filtering-Correlation-Id: d021c651-6c34-44cc-3219-08de9f03bdaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|376014|7416014|82310400026|56012099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: MjKJNpVS9Jasog2GU5bBeiDhH0MPuDqrfa9X4SL1ZZEs8GCo9fToUN8aW//MaUpvMmS9x3MlyQ445nCnBTPfeA554c19IAJ4h604zuOK5vIfVGl75HUUgsZcTNmqVcSvp4HYUurhy+8k+PlVRKd6f2Db0dIma24ZeZmZjrpr0YKOhiV81o3WTkINTSqUbJw28T8B6MqZT/p6/b8bHXwwkHQ9orGmO1/vw5qJz9xjRFX25UT0qqHefFNZFoazU3Hck36Ir5JCHZmgcxVcR2UNTkbBqsOgp4w5tvVZ+BA66UuEk9ysEoc99tBIUknmDEUH6hEKSwbnR53AAJHb0/wQnrknk2w3Pvygb4vCzbPD12x4eY3S9ZSl5G9DGz7IcAO3fA3zZNejhwAsHDvsIbfghHy12DcBsMep//J6cjY42H/NnoWJ2fh3fZ6Uw5Y89gWMCfLIKp6GcUbzkV1LtNggLGOHqI3lAyi9B+0XKqxADv0S0QBlzZjjWGpaBJxdTve53CRZeszHIRjqlvAHn7q2atFA8Y5SPVjgEIf6Q8lSqfrVOeuguS7nN40Zj8ghd3qk/ewfbT3FHmimnAjnKPD5xWJJjZnbqlmMfw4IfuRFnTKg1Do0cU2VJuPJoS49FGia4xXnb5lFUwR4uy7cjkQiJOVRZ1WhN2UnBSrcZRw/iYZuxcO4nZG2pdkGzIXFkRs+A9Hw972iPIHxt+di2f1Wrk70NqhUwmAy23mXsI2MR+rg3utc+34fVcSUZVD19cVxs1Jc/bUOHqn6aXAFNPWF8DoHxy9754sZJXL9ny0COuiay8o35Jl2oFx2giWPmkrKPt9uPZJcJFPvpMOo2HA9WQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(82310400026)(56012099003)(22082099003)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tVpaF8MPD/fSHL6Cdiity4dRwcKcpS2BvoubBlfuyW5C8UqGbYeyRRu56NXyO8Co7VSo3/ioxdHztyh+CO3Mfd3mt/fP91BT4k9VILA2xZKWsOknzNDnYc0JjFifYHHFmsk+1HE8Cfbf2r83+sn+gn/KlYd/ExVzUtih7yxfBNZatlJfoxh+8RItOzBzkWYEg8NxMGXgCK4p7NJUJftCCiTFiQh0tWSWp5vX0zF8H74TMAwAdGmcOBlXour4H4PHGZmTJ3ecGtjOT36qTJ2HTEVfkDkrnvSwA+sA+GFEnzCPRy6MCFQFPxSTfenlaBdTyeOvnYfl4Wcr31f//XkMRS2VVX12O/P9oMS4/mo3ydOq4YMCiWQExHsWBDmC+GU1eI7asZJmzVK1pOE76VgAnOTIypp2k2sAf1BBDCNeam0hG28mw7lO7WSCowU33oOZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 17:39:14.8529 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d021c651-6c34-44cc-3219-08de9f03bdaa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrvqq9I7US8if6pNhh8BE1X+6wpgSlXTi+2JpzjIxt0=;
 b=I/Qhs6OjlEd+4nBhIzqrXOywlCibj2NR0HwZzHhCA3ghv6/MGlGFZ0XITpcOU6eavEK/IeEDFZiFs1gxveiptCugg7J3MjRB+CU4RORqCC6UHMRIRmKNa7FSvOR8JRC2EIB2iH2MVF2OzcTZeLxL+MgzyX68jLXkdWCUy3/mvTc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=I/Qhs6Oj
Subject: [Buildroot] [PATCH v1 6/6] board/xilinx: remove Linux 6.12.60 hash
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

Now that all Xilinx boards have been bumped to Linux 6.12.70, remove the hash
for the xlnx_rebase_v6.12_LTS_merge_6.12.60 release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/xilinx/patches/linux/linux.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index 87db73fc78..bedb88c7ff 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,5 +1,4 @@
 # Locally calculated
-sha256  444f573cd4438af1f5062fd69fcc82965a56068e6a25cd43c062a68398f90b03  xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz
 sha256  002fa6c617d3d3eaf1e16219079f4e4303b84ea472b2b3c5d47f766a106a79c7  xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz
 
 # Locally calculated
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
