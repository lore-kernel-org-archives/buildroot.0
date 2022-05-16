Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00244C433EF
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 15:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E8A781754;
	Mon, 16 May 2022 15:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hXL5J-pQ1j-O; Mon, 16 May 2022 15:12:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4C9D8149E;
	Mon, 16 May 2022 15:12:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 966221BF344
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 15:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 845DC61066
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 15:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rq1hE5vK8bsJ for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 15:12:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDA7C60709
 for <buildroot@buildroot.org>; Mon, 16 May 2022 15:12:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M39tNrQH5TjGrpcjoErOKfUlekSdmY0Nf/FT8l6DO/Oxo0Zi7yrtQE2XqIum+/LDEgFGR+wpiLr6CH8zZkx94onftXn1B83TUCEaEcPr0bKD+12lWvuTJthRFWhSdG5f+vBUEU9B11Ivw2GIHcxstmFQABhvn48i8hp5ZQC38LO2RcspuimZcihCSq0fQvwaF3lAm1Nnz+poHsE2kjqPml1IwJb1kqxNioSUtrGKM1GLjE5+jHHVSo2FY8UInLJbdgkZWvPc7FjX5jlLYO0Kaenohr23AXjcwvBJ4glytyfOXhHH1nWizM7nWxp/nEvoRFbqn7B/kFsrzPx2ta0TMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8+HIt3yU8C2cXg7ZD9UdgHXl9R3KAZq/PaYXB4QeMY=;
 b=koi/HQDBaSl5tDWxhVOCfCOC84LhWq4jFNO9S3edPq6yNrd6raJ6aQ5VDCb1uEOHxqtFMyOwQcMHoK7V3geVSCYjz7R6aAB8IFJwzoFP7CkSt3ia0PC1U6oqdCHNkZFstIznov+oJIsZLC4tJd58n/ybToBRhvFf8QqAwhG+HCD+wSPkpMg5LVBuDT1lYPdTtE3gi0xcAUZUOpOzI8VU9HqNAtWQVZ4WGPeThwyI7l82APDvcXvCegks1idnNwbsKEF9+DHctqAbTFsTMj1rpkGdUq23oMSkb1DfwMGAK7Hv5SmUovnQSU+aIG5PhsPuQWFX4rD691TzSN53KuZc6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8+HIt3yU8C2cXg7ZD9UdgHXl9R3KAZq/PaYXB4QeMY=;
 b=WXRG8/0bDG0YRhUyCd/YGSJ7x7XQ6Osnk6AkdCUvgADDgmZEpSk35Lnp7tnrKy5nwIHh1sos5K571rxZhSQjJtvY4+HC0hu1ecQSz33UtcELvvw5R25U/dL1rYNIILAYQe0xUmaKIVZPrUgCYkN1Ljf8ICKWzQh8IT7UsNdWydE=
Received: from DM6PR10CA0029.namprd10.prod.outlook.com (2603:10b6:5:60::42) by
 BY5PR02MB6753.namprd02.prod.outlook.com (2603:10b6:a03:209::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 15:12:23 +0000
Received: from DM3NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::84) by DM6PR10CA0029.outlook.office365.com
 (2603:10b6:5:60::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Mon, 16 May 2022 15:12:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT016.mail.protection.outlook.com (10.13.4.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Mon, 16 May 2022 15:12:23 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 16 May 2022 08:12:20 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 16 May 2022 08:12:20 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk, neal.frager@amd.com
Received: from [172.25.185.186] (port=44046 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nqcOS-0000p8-NH; Mon, 16 May 2022 08:12:20 -0700
To: <buildroot@buildroot.org>
Date: Mon, 16 May 2022 09:10:53 -0600
Message-ID: <20220516151053.2363184-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220516151053.2363184-1-neal.frager@amd.com>
References: <20220516151053.2363184-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62b6ceec-0725-46ba-1ad7-08da374e7acb
X-MS-TrafficTypeDiagnostic: BY5PR02MB6753:EE_
X-Microsoft-Antispam-PRVS: <BY5PR02MB6753DB686C737BA2613A3E4FF0CF9@BY5PR02MB6753.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mJ8wfq8lZE5p2KT0TgB4jpOrscQnNVmHg8A1p4iGJyAASrm78zW9O9uOUGDUF2/doIdXFkhq/Fjle2Nw9UWMsOVQXSlQP6j4levG1oKm9Rkos51sQDhF7DajorBSiBK9qQC9vkbXXPDVRGB1F7z7jmmXj1ZA5HB7hp3nmPTgKXfXIuxqzyFPgeJw9WJv2Xi4VwOfkzqMqrsdcuuHW98C7qf8WsaDpaW7hgdsvgMcb8puNCRdl45ofTV5jd5Cg/73miYzoDai9zqkjT5NyT3norO39qO9vZXuBpSF04ckQOuitGLQ2BK2bSVHShEXLwZ0fOJbs4f/kLiL0vzqeZRwn8z5Dh4uHSPXst6xV7X4JV3ADUjfS1T+QeFWMDCJd54iWwYuPWWvsKwzc0K6hc/Uvwo4I9d4FnM2TJ+qRKvVunYJJM5Q1sOmU0qF5bBxiKZs1rRWo4CkfX+piS5P+FN6k/jQCDrXsnb1LBQQC8wueEqWfF1oamjWwMYEwgP+SQ3ZnOwxGb8UT4LYgnG7E0FznMsjLoQy40NLVwXq+A6yx9RJdT3s7jkrD40CJMTwo4O+fLJuB9P7rnHhSNcF6NOAzN88xe9t5yvWPvjWZAKOkrcq1BuxUaZHF7/A/E7Yz2Wc+GtbKe+TJSNIhq1yfHJFS9SNldhZGm2W/jwyYR77eh6DJ/KhBhJ3OpKJ2NVNqzAGDYFgpOj6IiFPF5oy5tTCnQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(8676002)(54906003)(4326008)(316002)(70586007)(7636003)(40460700003)(5660300002)(44832011)(70206006)(6916009)(6666004)(26005)(2616005)(36756003)(9786002)(8936002)(356005)(1076003)(4744005)(336012)(2906002)(83380400001)(82310400005)(86362001)(47076005)(35950700001)(508600001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 15:12:23.2516 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b6ceec-0725-46ba-1ad7-08da374e7acb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6753
Subject: [Buildroot] [PATCH v2 4/4] board/zynqmp/kria/readme.txt: improve
 documentation for qspi programming
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
Cc: wesley@sonifex.co.uk, Neal Frager <neal.frager@amd.com>,
 luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch improves the documentation for kria k26 som qspi programming.

Signed-off-by: Neal Frager <neal.frager@amd.com>

---
V1->V2:
  - fixes boot.bin file name spelling error
---
 board/zynqmp/kria/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/zynqmp/kria/readme.txt b/board/zynqmp/kria/readme.txt
index d64427a52c..579271e804 100644
--- a/board/zynqmp/kria/readme.txt
+++ b/board/zynqmp/kria/readme.txt
@@ -56,7 +56,7 @@ Where 'sdX' is the device node of the SD.
 
 Eject the SD card, insert it in the board, and power it up.
 
-How to write the boot.bn and u-boot.itb to QSPI boot flash
+How to write the boot.bin and u-boot.itb to QSPI boot flash
 ==========================================================
 
 The Kria SOMs are preconfigured to boot initially from QSPI.
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
