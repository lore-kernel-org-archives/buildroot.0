Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635CAC77B7A
	for <buildroot@archiver.kernel.org>; Wed, 31 May 2023 11:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97F6E60BC8;
	Wed, 31 May 2023 11:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97F6E60BC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CTnKrBrev5E7; Wed, 31 May 2023 11:40:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA7AA60A5F;
	Wed, 31 May 2023 11:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA7AA60A5F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0755C1BF41F
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 11:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4B5540529
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 11:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4B5540529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zTPhLRFIhmCo for <buildroot@lists.busybox.net>;
 Wed, 31 May 2023 11:40:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFD9040190
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFD9040190
 for <buildroot@buildroot.org>; Wed, 31 May 2023 11:40:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mihn+afBhwjqGNyOcf4KjcYIj1HTO5u53LkGnehW06oblWNMBBwQU46nUA9qB609ysiEeA66frKeFHhc9Yqh5o63u71S7O7yBSOt6IrS2MCtcVtpzjZL+yVGa0mrot5nB/zoKBf+p2o2/RMrqpc2RBZddBChsyQUdqqr8VX6jwZIX4d/VMcH3876zo2Fcu2cZA+NILBK+wmw7MXxCSzyqHfjjjYvXzojpA2b89tyXdzxeswymP1h70FM6vVhzdHGJ0R8u6pNyjmtLwZ0Goy+N3ptI9+LmzKJsuRkurjwCP0EVdOGIsUtnyVeeHJ9JJN3QSc/JkxC8dB0ApMyAfQAww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Sm3lDiuI1/kxEZEOIYAsXPXn1H9d5MrEsTsVQpLRw0=;
 b=UQymMB/xxd1Dxkx6de5VSeDJzIcE4CkQXE8l08NVqY8VaP7n3V5rJ0e0+Io86/5kr+MYfoy2TzASmQIvqIUiwXC96ukJjrznrQxwCmHXvLmrw2RXHV5aHb+RYtnxQ+3mfGxabH2BOIE6yuIIYVdWYP2nbKS6PZryms2nuo9CsfyynGYBbnW7H60Jh4E8tdDPtT1ylOjimtPHEko5vm/LikLbKp5KrEUbgLRVqR34NPvHMX2ihtKoa6cwfag2JPCZgcEhYg/Ys9JYd0BJOOzRzzhWl9TykcrzR8+A2DNBDybAWrlLD18Ujg4LnZUmYDZDSXQ5mGkkmhu+C6UdNlmrMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BN9PR03CA0154.namprd03.prod.outlook.com (2603:10b6:408:f4::9)
 by SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Wed, 31 May
 2023 11:40:14 +0000
Received: from BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::57) by BN9PR03CA0154.outlook.office365.com
 (2603:10b6:408:f4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Wed, 31 May 2023 11:40:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT050.mail.protection.outlook.com (10.13.177.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.22 via Frontend Transport; Wed, 31 May 2023 11:40:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 31 May
 2023 06:40:13 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 31 May 2023 06:40:13 -0500
To: <buildroot@buildroot.org>
Date: Wed, 31 May 2023 12:40:08 +0100
Message-ID: <20230531114008.1634631-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT050:EE_|SN7PR12MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: 696aa9b7-c074-443f-5626-08db61cbcc94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wro1Hm02v3KXTu7V+rnixUmLEK7hQsTMSyChd7WY9TW4BqConRc+Tp8dXQyqabgJa+oirgzZu51GOdl3HX5se6+23TnCNJgdsaM306TrEOIqhoSZcveGagEnEWjoWYU88UA51RrsJ2GcdX6hlYWwDfF5WKpknvPKhBmpZbJtk+Ggo3YweMX+qODn/NJhLIB0ldDTRulAATyUIlJnkd6Rr2CtScOnI8h+aL9RNrGw2x8tnbsvzr6zRTt+4Ls1WsCGtLwlj2pwpDgwVtoMOte9rioIun0XrshSWU2QmRA9TzLFc1p1d6+A4zJDlxzmIOqQjvfuvKD3H338dmc28Y1rQW+ukfhP3gx3SmMEfes2X9Sq2a/MbiZp0RAR4Lu6WdLM5x9SbQJ+d+0Zb8MzuHNy7uvV5XwJLljMsoOjKAgRsb1ivyvz9WeT4/MLh6v00prILCubbaIeSVcOYkRE2gUTcHgCulU/2B1zzZ0+Og7MdPAuLuLhkdmB+PyAVzH2g+ZX2bThaKTUlKh+mRH3s6+VW+G8OvgJVqtFn3QC9qFQeqgGQv5+wdGBcUSA5T079PkwU2CE5HZtz/jYOuZ5l9X1yZWibktb9+dAwSEs/zURg31NR9duy8MvMuQt2NRhZJ7xypyy9qIRbuIj/kSPUTzUJZDcwY8TFik9SuSkkQJPf4ygRaKoLy0IcOrp72Qn5taBvo2PmiLwEEaOY/JVwBriYfZl04if4orWY2xTlEH53enh4GQBeq33uCsxfz1Fgj9foStt1pbEv1De2RRy6iTkvw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(1076003)(26005)(2906002)(4744005)(186003)(316002)(40460700003)(5660300002)(41300700001)(36756003)(44832011)(8676002)(8936002)(6666004)(478600001)(82740400003)(81166007)(356005)(36860700001)(40480700001)(336012)(4326008)(82310400005)(54906003)(6916009)(86362001)(426003)(2616005)(47076005)(70206006)(70586007)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 11:40:14.1117 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 696aa9b7-c074-443f-5626-08db61cbcc94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6839
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Sm3lDiuI1/kxEZEOIYAsXPXn1H9d5MrEsTsVQpLRw0=;
 b=H78NCztzx4XWdTg7KYOusB8gJ2kWXhG+J/puzy7+1rpBKZTokCHb0uG1WTntsEk9h/OerV/K7jKai2rgNf2hN6SIIPqjm58hpl481gyJK73yi2EGLP9I6QStLdvQGhHJD6xs+S2rBX2y/gO/kSQaqYZGigRvIhW2Da8EvKST4S8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=H78NCztz
Subject: [Buildroot] [PATCH v1 1/1] board/kria/kv260/kv260.sh: remove
 trailing spaces
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
Cc: luca.ceresoli@bootlin.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/kria/kv260/kv260.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/zynqmp/kria/kv260/kv260.sh b/board/zynqmp/kria/kv260/kv260.sh
index e3467f3068..e03d67d8b0 100755
--- a/board/zynqmp/kria/kv260/kv260.sh
+++ b/board/zynqmp/kria/kv260/kv260.sh
@@ -1,8 +1,8 @@
 #!/bin/sh
 
 # This is a temporary work around for generating kv260 u-boot.itb.
-# The problem is there is no way to currently configure u-boot to apply 
-# the carrier board dtb overlay during build, so all kv260 carrier board 
+# The problem is there is no way to currently configure u-boot to apply
+# the carrier board dtb overlay during build, so all kv260 carrier board
 # drivers are missing.
 # This will be removed when u-boot can build the kv260 u-boot.itb natively.
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
