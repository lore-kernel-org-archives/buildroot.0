Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4112CC433EF
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 15:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAA4260D7B;
	Thu,  5 May 2022 15:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s9uFm-6-hPHV; Thu,  5 May 2022 15:54:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBB5460AD8;
	Thu,  5 May 2022 15:54:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A64EC1BF391
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 15:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 903FA40339
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 15:54:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lkvZ6yYYz65C for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 15:54:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01A784026A
 for <buildroot@buildroot.org>; Thu,  5 May 2022 15:54:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Prxi3FMBsFxIAsaVlCg/X1Q3CEoXZOkTbODREwOrTY6T7OwlXa+rjLW2/Cbb88Jx4crnqNKQASXfFNYzP/UFs9eDg2iBOaihFe6icChNQK5zaRZeICJFmh0CD+RVmU5LuDsKs36RcQt5rimoaG0rKY4P4fLJtWrabQXWLL91J30ApInvzPSWYcSLRi4b7O7Xu3BOj7HuSA0dBjMHKBNmElHNV9AEebJSOrhNHSSfXP0JL5w2hEjpQBCHExDvCDnWf2VnaCRSRdHUklh+hqJrUrFDYWV6fKgKIWRhrn9N5t/QYpJ1RETRvYJpIEvJKIPK+d2PkMUwPOgXAZ+8lrlbQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QMQeApv+DRldNIOtArddqviv8wnROD28cPtQ7WeCDA=;
 b=IC/1bQv3I5B6Vl4rZapA1y4u25d5zXeIN29KdqnyhmS0YyTSdktBI/15eMOdmvoe9Q+q8d+hIWi2pnHGn43gJbUaivQoqH5UdjsQvSdO0VSRlM7UzgcocB+JpraDHmS5mIbRTDY/bbddkJClDNxXy2sI1hcEDDyZjtb3upSNl5dCwM3TJlPd8609eneW7dUNJBKgmONYQxpv6L0xf5VEKdNQ0I2haPOY6rBXmDInh4kXnlzcctI3dGg3Yb3v8+xfwFn+2CfCKRfb60IFd2Xwsau61cxN5KTtoPM87iAGwsJ+i4euCg5/OaVCDnwmcUwT0JnXNAbo2y9pEAkcGc+/+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QMQeApv+DRldNIOtArddqviv8wnROD28cPtQ7WeCDA=;
 b=D932J7e6Wwpy6V5f1YhAe39Ews3s/d/9upxwufK9Mf6qJLXaQ+1QItfkVCWuCIUMKFeNAkiwuvoK/Pu/KDpCnfdV37v2z65ii6t/Hcbl79eIyQSJ/R+PlIuIy9sMb2oPybCvwd0XanVVR9pgrbHegISCQCUIPLpVb1b/48iYTiM=
Received: from DM5PR21CA0019.namprd21.prod.outlook.com (2603:10b6:3:ac::29) by
 BL3PR02MB8148.namprd02.prod.outlook.com (2603:10b6:208:35f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 15:54:35 +0000
Received: from DM3NAM02FT013.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:ac:cafe::97) by DM5PR21CA0019.outlook.office365.com
 (2603:10b6:3:ac::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.6 via Frontend
 Transport; Thu, 5 May 2022 15:54:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT013.mail.protection.outlook.com (10.13.5.126) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 15:54:34 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 5 May 2022 08:54:34 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 5 May 2022 08:54:34 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, neal.frager@amd.com
Received: from [172.25.185.186] (port=58056 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nmdoH-000DLx-TR; Thu, 05 May 2022 08:54:33 -0700
To: <buildroot@buildroot.org>
Date: Thu, 5 May 2022 09:54:24 -0600
Message-ID: <20220505155424.3002847-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505155424.3002847-1-neal.frager@amd.com>
References: <20220505155424.3002847-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afc99149-7f4a-44ca-881f-08da2eaf8d09
X-MS-TrafficTypeDiagnostic: BL3PR02MB8148:EE_
X-Microsoft-Antispam-PRVS: <BL3PR02MB8148A1C3EB2A839B0F299187F0C29@BL3PR02MB8148.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Npn8k81krLAQx1zMsbiegEYmXkN5ek/2xml4fjQVv9F7NaT92P6ajYtNZ1eF2mjjfVtuyWdF/+9qaW9bGuRqj4urwLvzjGMZUI4292QkWC4LaLe8fpxyzuzKC80X3BdXqYf20/bkRPkGwB7Y3P+64LJeWnqOZlOKizkrTvTGABXqT3kcMBfl8auSm+HjehgBuzgFIBzGRix0S1Pqf91R3F+gKbFCOfmPKbr2kjI2xdE7ypdtkPSOhAQ01XPCz99N7fdwP1gk1GvvOAuys4L7fSubl1jSJSh/f+8/uQ/muGmxdeqlORAak8KRRnk6k/+biYRagbxlcZJ7eRObAbkvRWR0V74JvhCz1fj0Pw7dUwwYfhCXHmeEJAky/BjufGNYClccwbbaPKY8ixolETXxqL48jXhL2NVDyfjoMl08PnjnVHLIxrkbE+aAh79KQuB03wRXN6VTgsbpTmEQvviBANsNBy6fqtYk6bYajxELo3Em6TBMGRV2jqJ8yUr2t7YTUBNL7eofqFrCZ0yBXjiBXUIgC5RQocLS7p2+TPALe9dgB8fppyuQmZ+mAy1BFNnUbBoW8F8UEhe9qXLL+WjIHaKyzZbRUIcO3A6tXi4AY3koFa5B7GhxS3I5YeQBWMgaI68jSp/wnhipU3gz00KXLoGEYZVeuNe9WYa1Y3WjbHNFDbVkckl/jJ9Ibk+9uK1GpB4V47wnMPTDZyNbfff8w==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36756003)(356005)(40460700003)(70206006)(8936002)(70586007)(7636003)(6916009)(26005)(2906002)(6666004)(54906003)(47076005)(4744005)(336012)(508600001)(44832011)(86362001)(2616005)(316002)(4326008)(5660300002)(8676002)(9786002)(82310400005)(35950700001)(1076003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 15:54:34.5773 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afc99149-7f4a-44ca-881f-08da2eaf8d09
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT013.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8148
Subject: [Buildroot] [PATCH v1 2/2] DEVELOPERS update
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
Cc: luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 michal.simek@amd.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updating Neal Frager in the DEVELOPERS file.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 292b919137..861496fb9d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2100,8 +2100,13 @@ F:	package/pkg-qmake.mk
 F:	package/qt5/qt5opcua/
 
 N:	Neal Frager <neal.frager@amd.com>
+F:	board/zynq/
 F:	board/zynqmp/
+F:	board/zynqmp/kria/
+F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_zcu102_defconfig
+F:	configs/zynqmp_zcu106_defconfig
+F:	configs/zynqmp_kria_kv260_defconfig
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
