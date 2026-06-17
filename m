Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E946CD98E1
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 05:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88DE96F79E;
	Wed, 17 Jun 2026 05:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5pXUKuMoKiMu; Wed, 17 Jun 2026 05:05:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ECA56F79C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781672747;
	bh=+2uVhk86ZL7CYuWj2w0ZRzNdFIA+FGDYxfmGB1nmdTs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=JZARoEdXgW0it3WN8367NDGYttOF3MYDZsODNb+W7DIDGL2m2PtB9jh0acbIrVurj
	 aBw5ji8gUlIPFz5vcHVMOF5FOBIV1JvVpalIY6F+3V3Gzj542lmDYAzbaeELYPJ0j+
	 7f1JM/852TTrFmRSc+gyeXnM+33f7XwFxlWYn1pWzfnLTyJ4QSbF6zqBWv57pxOW04
	 9Xd+gC1yR5kLTuLnUHLo1rKQm7YmcVsHLJqyHnsnlw7w9b4mKAn3HbK+176F8MZasW
	 cOrp9Uj0s7SUSO/9MJ/RiH5XbIj6KWjIBuu/+2qo49D6AtayzIj272iKuA3htf55ne
	 ROoudVPyWWsqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ECA56F79C;
	Wed, 17 Jun 2026 05:05:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A9E4347
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C230406D6
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jA7_fKCsavN for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 05:05:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::3;
 helo=sn4pr0501cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1EF6B40317
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EF6B40317
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EF6B40317
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:05:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bsXyygx8dME5fhNbdBGP55+5KGKCRdLM1LkobpSf/gIEapzuQAeGX1xYaDrcGDoQqTiv4GdJ01lQ0M2jtssmJ/WloDMe4KdC6kpO4HWiMQRfU68cWXhL82T6KDs/FGNJaZGi1G71QI3eRJbn/RqCYakk+US8EIUQfNKKqVWYar/la05LtHMzBDOjxUu0rZn5kI8QeSkyPHFcZDqBnkqL11G+YkYidnsNnzHx+V1xwPVe4urFWKQS+YfnhCDzyBv0WxfISDzigA28b3MwH65+iInQ4ejf5tX5WJg67xf9FxuC5lT1WIXXn5n6F4lBi3axUnJcaxmjUic5OOR9Y72TjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BG3VV6xCnqaACyvUFgGbHbcoWsYC9kNF0ZEfGuVMBs=;
 b=CGxb7kRklqaiSEB0V/2SIiITzYiF5HlwUqshHjbJ8kxVaX79GKHfu+5+Fdz+lH4Y7Zq2y0Po7pQmPWINM7XVL4aiz91RpQZylsC7i8fMbndTPAkoh2kK9b5Tyd3KbHssT4PxjRRcSBwW2YbZCMvw7SPLCxCvbHbHXx9XRwQQsz1RO+Hc7vEWyrLbMvvgyrKkonSAjw3LxgdecvjaKhPpV3mfQRDum3MOBnWqU46on/LrCFTIdo8ZQdd/4UjB/81Hdj4wMh8sxyo52JCHd3c4bUztBMCL0IpcIGo8XlXKvp62jq81SP7+X6xudCIcRqIfLPVvHCMuPOA5m74mYgHXwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR02CA0002.namprd02.prod.outlook.com (2603:10b6:303:16d::10)
 by SA5PPFE3F7EF2AE.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 05:05:40 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:303:16d:cafe::6e) by MW4PR02CA0002.outlook.office365.com
 (2603:10b6:303:16d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 05:05:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 05:05:38 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 17 Jun
 2026 00:05:38 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 17 Jun 2026 00:05:37 -0500
To: <buildroot@buildroot.org>
Date: Wed, 17 Jun 2026 06:05:26 +0100
Message-ID: <20260617050535.2670810-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|SA5PPFE3F7EF2AE:EE_
X-MS-Office365-Filtering-Correlation-Id: 6323670b-e2d6-4627-840d-08decc2e12d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|18002099003|56012099006|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info: VgWo9conLucS7RFktppn9PVqi18uV87VVFDhY3wH+lMZj8F999qMBxZyu8Zd9xK6VpK7vB4xFYR2/gHhHd2WgjGXw0vx0Rrp22uFXpd0uBlTXmnkNxbkrfEZMsjFf9WVb/XcIuxKmYaJ6XCNjhpa+S6+xEF1aViIBd/Gh9P0/ehpVjxZnZEsDgmILQLEjLxLNtu2caDKrBeETk/B9JUeT8vFp9HZyo4cm5Fgz3Fp4Po5A9uSz8S2Y5hv25or6hFNfo2WFsOCLpKZpZYYOZomThaiDJQ4HSerqKU2cQKviSjquA6B7Di064rK5GXhRnIZjlNTZq9Gib1G+VkOgQ4/sGL2mEWJalNbPqfZLEDBxJDH0brYCb7QSH3cAHafh62dnE47/9ZEdp1cxUGVEAEJt0JFehHEEmVnNxqDP5Dc1iXg8XB0P9pJBfRXfgLB5Cgd5rRKSA3w4NnJnQUoa1IDNvFyRDWqDDAXzrc9SesLVD+RmB1MWLP4WhMj72cS5bQcj5AWwNNPEoAiHF5dmiLfu2dG5VDvLcmtDGShum3/zU3ARFd1ko10Uv/4VfxGtylZojM3z/UW7dHqx+rPkBKNZlC/n0I9Kjoj/iSlxznaiOnyJ+YZAFVWVaXB5iRlV+tCjkJ/Ha+nz+4VPA3O2eE69glnsIIPdd+Yv2DIya47YdwRUthNERfJRY71N7jMTkceM0P8ztqfn2JOe8/RIoy9tHKLPA28jERCGfWuz+6kl7urMgjiO/b+mEjJ2x92eqG35mpslGb9K1Wf5H/1gyI7eSvIF5k8b9YBSwTVLJuLbb4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(18002099003)(56012099006)(11063799006)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7Qh2V9bmLMI7jCKhdDvkjmsHL5m+A3kTRnyVcGD3OaJ3pBGLfnODHw89y3hk/faKSA8FKPNuXyRNs9CRztJb4zXGPi/rntQF3SqpxbmOdIHWSWsxiXa+FiPMfVCyOGGzVe+LdWOpGKGoksYI9f0ohtfnQFWXVzupdxZ22Y4gt8LorHfI7c2s/e6sZOEdxHUF3KP1GEOmhY2S9/OPbgfgzKG9wxR9UAjHfFIBxM4Htvv6FExgboTXiRUxQWIw9HmXIso+2N12w6Dlbpbmb1DKwzTmITtbbURVtytbLFquZ7YBp2l/dJ5TMc1h9oMhaJgCWOLuoR+iZA6Wm8/0cNnAcC43mGze2qMDUQHs08Np7aXA2R3c8LDeg48IyqWj9IAaFHKewOxW5ebTtew+3JhVtVpPsD+EDBXMWBG5T15FaaEKBpskuslCpHGrtl42Cjg+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 05:05:38.8389 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6323670b-e2d6-4627-840d-08decc2e12d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFE3F7EF2AE
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BG3VV6xCnqaACyvUFgGbHbcoWsYC9kNF0ZEfGuVMBs=;
 b=hD57qTWGMirkIVu6OD1NyXvKT2InQZL3sliqHfk2CE7Mm0kPSb4D+N7mrRnCIpikwb0H1FQAdBtYPVYhKzqJj3Z19Q0ejhpeu5dsZ8/A6sgduqaAhYo0GEibwNINvYQfERp5sToHu2dRLuiSW8FwmOR5kyftfIsxe0aq40KsZgI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=hD57qTWG
Subject: [Buildroot] [PATCH v1 01/10] boot/xilinx-embeddedsw: add
 xilinx_v2026.1 hash
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
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add hash to xilinx-embeddedsw for xilinx_v2026.1 release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/xilinx-embeddedsw/xilinx_v2026.1/xilinx-embeddedsw.hash | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 boot/xilinx-embeddedsw/xilinx_v2026.1/xilinx-embeddedsw.hash

diff --git a/boot/xilinx-embeddedsw/xilinx_v2026.1/xilinx-embeddedsw.hash b/boot/xilinx-embeddedsw/xilinx_v2026.1/xilinx-embeddedsw.hash
new file mode 100644
index 0000000000..35d443e965
--- /dev/null
+++ b/boot/xilinx-embeddedsw/xilinx_v2026.1/xilinx-embeddedsw.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  c6cce76eec367bda35c0c02fea18b0cb913b57a30ae809aa803e4c8c64e6991f  xilinx-embeddedsw-xilinx_v2026.1.tar.gz
+
+# Locally calculated
+sha256  bfcf86c2e567dd91b311be961ef0a144934e1c79f8b9c4518d0a65e44006ea5d  license.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
