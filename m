Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349ABE7717F
	for <buildroot@archiver.kernel.org>; Tue, 10 Dec 2024 08:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFBB880D4C;
	Tue, 10 Dec 2024 08:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FMMPYscceQC; Tue, 10 Dec 2024 08:15:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2C3C80D55
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2C3C80D55;
	Tue, 10 Dec 2024 08:14:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 07760E11
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 08:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB9164053F
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 08:14:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r6Ya0CEhEkDy for <buildroot@buildroot.org>;
 Tue, 10 Dec 2024 08:14:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::61b;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A5A2A40132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5A2A40132
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::61b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5A2A40132
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 08:14:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wbmagjpFHw00d04TnVuOWxT/eiFZzKqMPMsybApEHe3hVxvWvoiNfnk2N88oIWFinb0cDY+v9zwSkCApJGtwyZdQdwZAQKWOIL7j0ix25x59hJnO3cHzKk90qhc5f4SZoM6tdt9NqLX4wgQP1iHVZ0AB0OJ7SZI70ynUU2B/LOrf0ocZp3rm6/+MK0Qm/ZXBQK6eseMPvfVS83+BTi5xNdst7eAvA+x68C8hq5++PzkAtyM56br8Vf7/9szM+n3ExLWz+OC5tKmPUHAEsZcNwx6z4HOnCDDidymizrg/R2SYkthGXBH0I7lUqtOMB148R/yZFWdxh04NsVwGi8wyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ut2E77WsLSpKsrnuyElVLk8aew2naMhSmjfOwtG4uQE=;
 b=hO31OBBpN4EKKcyVPHmmrVccm/LBhZZRAWLhzR2YC3nshOiFQNILAt9DIg7RnIjy2HPayafGSYiuDfWuptFRCc4nmuRcZGSPOOdlB42Pf2SGmQ1JXuUn7u8T7UoPzSo2MxuXLGt3b2maYiZqmmxUxOCGqls4CsqMqniZGmJeFWyBFvIMEvNEWCcD8DmNrv1o22dGMfamapZ8znV+lagvyI2bWD/m2k9G3pVpsynNEvnE9UBclzeK1PYkYZJ+TwbVX+5qR7jV7pkR+aFE5v9erEIXt/zKm87wT5kC3yUrGdb+08nsrXkyxXzSl4HHU3+VdQHakErBzW7zPG08gS4nGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY1P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::9)
 by DM6PR12MB4284.namprd12.prod.outlook.com (2603:10b6:5:21a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Tue, 10 Dec
 2024 08:14:52 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::28) by BY1P220CA0024.outlook.office365.com
 (2603:10b6:a03:5c3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.18 via Frontend Transport; Tue,
 10 Dec 2024 08:14:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Tue, 10 Dec 2024 08:14:50 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 02:14:49 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Dec 2024 02:14:48 -0600
To: <buildroot@buildroot.org>
Date: Tue, 10 Dec 2024 08:14:40 +0000
Message-ID: <20241210081440.1423417-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|DM6PR12MB4284:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c5ac0aa-8230-404d-8920-08dd18f2b834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Tu1+RB2kaNXD14vVjliYBF8suMYKj+TsdrijorlyJFc1HwdRLhRPQqxTxsek?=
 =?us-ascii?Q?F9X7LcB01NEtUyyXv3ld0yGiIW/HK2AD6Al2vMTXun98hABnUttuES2EKGpd?=
 =?us-ascii?Q?Gio9c3fRvAKJP78yPJbdRK0/aQQjr/4kMg/CWMX353fJrIjMkjoLR62r+swr?=
 =?us-ascii?Q?v/lW78fxedfGTYrCDy6Gnohfoev8OAAHfJ+jAhqXiAA5NJdM7arxhgc8GXV5?=
 =?us-ascii?Q?SwSLHNYkOUKSeT4dEveZVbzmgThZWENN6ATgDH41NXvbqICZHCOJIGVeqBWJ?=
 =?us-ascii?Q?gMD+tO5BnykWaN+NmooIFfc0OffsshP4ECpZCnxUP5duzo4G421Nez8VCFen?=
 =?us-ascii?Q?viCIf9vh/CBTofz19ExazcoJH8GskYAxQdwcKhigRmr3qYWMH4DG6MGytlRM?=
 =?us-ascii?Q?yu5AWxAMXfJNzjZ+fwHV1+C875Vl5rPcRkmfoBiso0HBWmGkd4s6Cj4imaOm?=
 =?us-ascii?Q?obspn7fvO0k7lv4cCFi7QGFevDLE6rDB6l1HsEz17W5ZcCEQNuBFq916JU9l?=
 =?us-ascii?Q?Pw6adSNjFNGrAOvoypc6ggyDmlZkJmUuywVfHGFEXV68DNNjDD1CKboeqTAj?=
 =?us-ascii?Q?1TAJHF9ocQ10QVLOSzter4mozOpuQ13Tku8Hn+9bv3noZx3+WVX8rPlSn/Zu?=
 =?us-ascii?Q?/DEFduvwNo9cm4mY6xygWxq60KFRndBtoza/sKEhDRf2aP1EXCRM0Tu1CPyo?=
 =?us-ascii?Q?qw8DXJMwWBUhEJsmnGZVAFsCSIXmWoXRFUSej81AlE7Br/GZu9CNaFHk9WDX?=
 =?us-ascii?Q?tXqYT6F6+0lnEbFCNrPbGOA5uJpsAOx2gQrWmOY00u1byOhAmizm253jDuGF?=
 =?us-ascii?Q?TnQXQKSTxhPR3D6oskh3PPWT/hZUBKjYjrQwfTw6HTuPMDuTFm1S+GVuqGsw?=
 =?us-ascii?Q?BO6yV9rZYYbQ9KLlWfV4TY3zUlG6TQ7TkWSGU9BcTBpX/NrBEqxrUNnknVr1?=
 =?us-ascii?Q?TN22SZpCypDbn6Qmb18mxI5eRBb6KVjpqVGBLm88j7ROTcVJHux31syw3D2D?=
 =?us-ascii?Q?iailAjhIf1ishze4tHel7/6GD7F1+1bnQClIDm66i670nSqf/8k4g0cPgwUC?=
 =?us-ascii?Q?Xmaw7dA1ztnhmUPS+2JavsriyZYZ8rWI9Wncoh/OR881vVs9lx2B7TMcDOck?=
 =?us-ascii?Q?4rdz2EvFdbrrPQVPwohlzROyaiVBz/T4YYH2gzx6f4cColTET91aitxoy++6?=
 =?us-ascii?Q?ur6f8B5OCcjTw0ysXzLOt6PKXKI1QMxTo4Ef8XUIyhi8EuwC65wmk2Vs1jzR?=
 =?us-ascii?Q?kl2afOERT0zZJFDnKcWLje/u/P/eYDqtr/7mQTuAmh5To8bQrp0COvvSZ8XL?=
 =?us-ascii?Q?TA4P5uk0oEal7fF7sAxA2jTn7SExt+ASTvu2q+Hguf5/8EykbukOPulQxlw/?=
 =?us-ascii?Q?DxMwCP49GNyhbO5N80cGlyvnp83m2dO1RuyAKmY5guQeMRa3l1czhsm7MmG/?=
 =?us-ascii?Q?aI+4r+ZN3SNJWk93ZgqxYGpyGo7A9v4xKi/RZnM+FBcVD7wQw0VAsg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 08:14:50.6362 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c5ac0aa-8230-404d-8920-08dd18f2b834
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4284
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ut2E77WsLSpKsrnuyElVLk8aew2naMhSmjfOwtG4uQE=;
 b=BKmKBUO3hKNQJoCEmSoOF06dqAoZsdHSOUw+Yawa1f1azKHrjM7dF/xY+mL6Vwwuj8Kh3zy0SviP2Jkh5mXQvZrOPpYmUtTpLkdh1R84eAgSGqiVYCc+UMsWYCOcDbMfvksSi+BwKG6G4AXtLy6PtHXWi+biLGps4vDtcnvILDs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=BKmKBUO3
Subject: [Buildroot] [PATCH v1 1/1] board/versal/post-build.sh: link to
 board/zynqmp/post-build.sh
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

The board/versal/post-build.sh and board/zynqmp/post-build.sh files are
identical.  So this patch removes the board/versal/post-build.sh script and
replaces it with a link to the board/zynqmp/post-build.sh script.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/versal/post-build.sh | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)
 mode change 100755 => 120000 board/versal/post-build.sh

diff --git a/board/versal/post-build.sh b/board/versal/post-build.sh
deleted file mode 100755
index faa75a0de3..0000000000
--- a/board/versal/post-build.sh
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-
-# genimage will need to find the extlinux.conf
-# in the binaries directory
-
-CONSOLE="$2"
-ROOT="$3"
-
-mkdir -p "${BINARIES_DIR}"
-cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
-	label linux
-	  kernel /Image
-	  devicetree /system.dtb
-	  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
-	__HEADER_EOF
diff --git a/board/versal/post-build.sh b/board/versal/post-build.sh
new file mode 120000
index 0000000000..0130ff23d2
--- /dev/null
+++ b/board/versal/post-build.sh
@@ -0,0 +1 @@
+../zynqmp/post-build.sh
\ No newline at end of file
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
