Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16515D6EBF4
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 09:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2ABA84143;
	Fri, 29 Nov 2024 09:53:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DZrE7sbHiF6a; Fri, 29 Nov 2024 09:53:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FCB084163
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FCB084163;
	Fri, 29 Nov 2024 09:53:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CB9E712
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 09:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29EA8405AC
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 09:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sSc1BMBG-meR for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 09:53:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2408::60e;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0805640499
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0805640499
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::60e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0805640499
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 09:53:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1jfLMugBzmBoOdMuCKXXDw/6X5p36Sgm3BwPmoYHysBdfpjDcCmUFzPXyKt6U0LRLQvREwvDIQP9Xuh+ngdpi9bdMhifRyaQjm5mD4/GS+k7vnxKYYgRt4epYfTBqjSP8V9ix15iCcm2XMoY9DTjBvTKyedlgAcF4JdBzJG9yl2LM7Of3bVpe5noTe/dDrd2cTymQSxviBjQjKnaYs1kiPVkqffjsHeUvo3m/txPmvWMTqBFA0xx5cJhHlcadf4orM04t7d9fNEmgxsH5NNn13cvleSvZtG//M9+duItuC1nhdttfviYw5dqNoeEiTVuFGWkYXqHDUf4+CpwtnIMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUlsoG6awg4HeO60Rqe9oBv9SGE1piDN/Csgzoggw3Y=;
 b=UgTVGaL50cH0li3ONJ8fr6oYyo2E/T8hs78yDbUja5KOmaC/Ml5iRB2tyexj28Rg5eyr224kC448PbulHSrgVsXdn2JEuBTFX+g0amC3nNLGk1WasDE9Vwsg2uQXFpF3P+w5CB9VJj6txCUVtEkTBv4hWUUiDgN9MgOc0FkODBBOHX0OnakCrdk6sx90ly8UDDhdUJ1qD+B8fHagxAsXwDEDtAT/sW8clW50nkmr1kn6pWfRqxxu/mLMXxAFsG4xVIHCi9RPRG5DM8UFvTnM0yU1heJQLeiHdnfvtSlLNUDQ4uSf69mHm/Kthu1CXtU8RlsQCQNVjO27tENoS9PsvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR07CA0044.namprd07.prod.outlook.com (2603:10b6:610:5b::18)
 by SA3PR12MB9180.namprd12.prod.outlook.com (2603:10b6:806:39b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 09:53:24 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:5b:cafe::8) by CH2PR07CA0044.outlook.office365.com
 (2603:10b6:610:5b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.13 via Frontend Transport; Fri,
 29 Nov 2024 09:53:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.0 via Frontend Transport; Fri, 29 Nov 2024 09:53:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Nov
 2024 03:53:23 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Nov
 2024 03:53:23 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 29 Nov 2024 03:53:22 -0600
To: <buildroot@buildroot.org>
Date: Fri, 29 Nov 2024 09:53:04 +0000
Message-ID: <20241129095304.950313-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241129095304.950313-1-neal.frager@amd.com>
References: <20241129095304.950313-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|SA3PR12MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: 95f3ea04-4d80-49ad-45e7-08dd105baa67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QaBZAcMgIr09/rqQ1QqjPIoCdAAmNzf97vT7cWQyaNN7yoIvHx9YL6eFBH/8?=
 =?us-ascii?Q?EYHUJGE+MWwAct0bhdIBmOo+bVV0pF3wfNZmXvmYlPCUhudMBo+dFpRGwVaF?=
 =?us-ascii?Q?bqqJVZ2RD2nI3wjsLReTpqsEyLnlj3MwpUCu59iuSoTAxmLHT69yXb93Mm5N?=
 =?us-ascii?Q?AOxY615K1IqDwgr1gheGlsqrn0SF391yEHsjr4K1HPR/wr1dcYbihE85DvFd?=
 =?us-ascii?Q?ExZG7NXO0wPcFtFjoS9ZHUkQwA5Ea3qWsKVyvFc/ZrIu838VNHne0e2l8PAM?=
 =?us-ascii?Q?963ZQdB1qIeDUazmiqAoCWiw+NZpjYq1iNX3WKj7PwzXvqvIbrUNuplup6ic?=
 =?us-ascii?Q?9YZlU7lwfG5+juCwVG+zde/YjWfMa4SGBB2uDrXzPZayk9h0MkQ2ABdx0nob?=
 =?us-ascii?Q?/T6MgxQbmuMi3dNaWFy4tD0rBkCl36LOMtZfZRgWLMmpPHPuwe2spGwr2RPo?=
 =?us-ascii?Q?BGSggpT1Ziu/PUJ1VNvXS75DhiXgYpyu9PY7KHEL9KpFWtMDlJbGgKjkIZIy?=
 =?us-ascii?Q?z6zq41K7CysnUDIfqJ9xtRHV1ielV7Y2T6BxTo2PWj9gpj1hBvyGszDXzF7V?=
 =?us-ascii?Q?bPsBtfXlc7mwQfq9ymL9q2fyUxtiFjIwQwTL21S2WyKFu6JbnyejVMzlQrCg?=
 =?us-ascii?Q?VQ0J1paRmrBoYWLSkR8h46UFAm1sdUSKahdxnewq+AFyB0/nncI600KJ65u/?=
 =?us-ascii?Q?BKEksS1hklycMVa7q+tGt/YJEgyon7L9vZHsOey3iUxDre58LCU7csR+F1sn?=
 =?us-ascii?Q?f/J5YXxVKrHrYX24GO70Ct9XuSnQl8UoUHgE/tqY6+ZOlCX0EDHF8Y7/6RRS?=
 =?us-ascii?Q?0IFr1te7b66PIX3UL9EzGPpAUKN5hOkeNSJn+25a3NUpawhOvxhPw9Zb36gk?=
 =?us-ascii?Q?u1dFTVm5F0d5rEd+h+6qdlU5N+i75giKzcFQBY9cKO11LQz5sJAHN83yu0y0?=
 =?us-ascii?Q?bNeYM/raO0ieEVE5wZ3yIm7j/qiq7JG1FIsa1Fz0rdbxLZXuyHpcPR0c2o5y?=
 =?us-ascii?Q?sLlG5TVEG5AGJVkSJb0JU7GLnV7U+esWz2VxKBcJc2e4L8jwi8CmOokWvBuM?=
 =?us-ascii?Q?S1st9lrwF4LY/jj3D14GE2RwJm/A5lQuHQSp5H8RiSnYTL4+aTuY07h9KFwy?=
 =?us-ascii?Q?KfWL+jawTJCMnuhC1UmxSwUOpBwkjR+QndY5ubha33PIPC7Lb8cXa+Bu/GhU?=
 =?us-ascii?Q?CKroGk0HonO857cbmS/17c8A3+psWAekUoFoXS8YvSk4WfU+GAANqS6qkNJK?=
 =?us-ascii?Q?k+Gu98Nr4oG21mv0An/K1d84XLLfa/J8coTR0S0SAgiW8zdjTIx4nsqWIeic?=
 =?us-ascii?Q?AxxwJ9Ep+zFwphrWbr/CcjpAQVot4f0dxiJgw5iMUa/7VHjSeX4VmGy3H988?=
 =?us-ascii?Q?X6OIqLzelKQAulpSco0sk30HGyRoDPTYjmrCmdltxY9TXrP7+mkyAa+8D5cI?=
 =?us-ascii?Q?nc+zv1aDIctoWMqkUNpEIxtI4vc+aXtGS7d7pfnS0cAbOgLDk5mj0mDy/eXX?=
 =?us-ascii?Q?Rw0kakB8kZTLkmY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 09:53:24.2504 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f3ea04-4d80-49ad-45e7-08dd105baa67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUlsoG6awg4HeO60Rqe9oBv9SGE1piDN/Csgzoggw3Y=;
 b=a4sbynQgiqGn8tJslc6BASnoLuZXwIc47xRigLyTbB/sshSE0/8kyf7bH4kiwz0FxGCxNXiANvEYiRNPWT2on5X4N8ZAWvsFMZBF5YRrjh15CXkv6/iY0pgzxFVH/sztgWIIRuTYCRUzanXSHtZPNbllTWS35vI0Ga26JNtB4Yk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=a4sbynQg
Subject: [Buildroot] [PATCH v1 4/4] board/xilinx/patches: remove
 xilinx_v2024.1 hashes
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that all defconfigs have been bumped to xilinx_v2024.2, the
xilinx_v2024.1 hashes can be removed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash       | 1 -
 board/xilinx/patches/linux/linux.hash                            | 1 -
 board/xilinx/patches/uboot/uboot.hash                            | 1 -
 board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash        | 1 -
 4 files changed, 4 deletions(-)

diff --git a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 2ef3a98196..15cceebb80 100644
--- a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  c3369c89eab4e452bbc76c630e5dccb6c0ae588c0175b6c8549aa0241deb06ef  xlnx_rebase_v2.10_2024.1.tar.gz
 sha256  a45390c9e1d584a389abd37ee49dce3f8d3b41718b1fd7c977608b5387a38955  xlnx_rebase_v2.10_2024.2.tar.gz
diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index 6f269e1c71..41bf2141fb 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  6415cfcfd74e943d6ae44f6c1edcae09bf6cd89410b03c4290bf1464a8368f84  xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz
 sha256  8ebbbe2d40597d9a5f36d47a1dfe4caffcef3d9f5ffa059ed4504bb761282593  xlnx_rebase_v6.6_LTS_2024.2.tar.gz
diff --git a/board/xilinx/patches/uboot/uboot.hash b/board/xilinx/patches/uboot/uboot.hash
index 1fb12d1a11..de0e6adad1 100644
--- a/board/xilinx/patches/uboot/uboot.hash
+++ b/board/xilinx/patches/uboot/uboot.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  58e391a001d9d8ed347ab3258ff7c8435c866b1ff2b2c22ebc95af592444c0f5  xlnx_rebase_v2024.01_2024.1.tar.gz
 sha256  f1a86ccdbe60bac89177a24bbfd56fc6e8e67823669f0997de563c3cc0ea4dd1  xlnx_rebase_v2024.01_2024.2.tar.gz
diff --git a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
index 3bd33a29a0..fe6963872c 100644
--- a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
+++ b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  xilinx-prebuilt-xilinx_v2024.1.tar.gz
 sha256  ef61a4b249ecbf632a25cc34c3b03b8290be44397ff739467ac92ec1701e23bf  xilinx-prebuilt-xilinx_v2024.2.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
