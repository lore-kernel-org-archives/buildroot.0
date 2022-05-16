Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16251C433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 15:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B65240939;
	Mon, 16 May 2022 15:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZnohFT0UMF30; Mon, 16 May 2022 15:12:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C9EB408FF;
	Mon, 16 May 2022 15:12:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 355C51BF344
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 15:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31E4361066
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 15:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 64vCyNQpy7v9 for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 15:12:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0958E60709
 for <buildroot@buildroot.org>; Mon, 16 May 2022 15:12:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMfHkB6zssAt/5/3V4X1swFOjVA1nlgeAkGLQbqy1VzZ9WWQuwjvBtEz1WlAfiz6Vepe/T7t0DQb05mhTx/YQJMOHI/88bSSkU6p1AJnj4DphpcQctDGgPx8kapjoPpYd3Qn4nRIt2mmETovw31ZyPaNnScOmskxVYhqpIf38pu8NWLPVwkbvdAFqKJmn35Uvd47u/Wg5AFTAzHDMEsidKed3UdjYKdFv0sHwV15J9H42GxfrGHIvAxUH4qX2KPBVTQr5/TXg2X4/eJPq/jxkqdjlQf+/zz5iUD8UwpJqrisD/8wpFbYdWW7Upp4O3PLc9wl86icWphUaQm5BeobjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDGzdFCi0+T+bKfia2yuJrIGaaeHn2IKJ+ookfdgigc=;
 b=D8vqEwXd98q83k6/8r/hXSCdt6i9AbbQzZpy544mbhe95aG+6hvx0RPZUSCIwfnNKq7ZGM4Sfqv9jHMTA4dDdgqVDwxGFbRvkfBsAtVIt1dR3ZXf3ZCnHsyBoY7p6mU6kP90YmGUauVoATYREvMGmmUTp9F3+7irjM9LWxHDW6ygdHn4FD9jmQgh0TdawiKTeTDrN1xB34pK7cI6nT8uCM2griPqIwX7X60a6coMCuOlYloqqvsW2y8Br8FffhGsFWjEFgBlkn50Kz4nkTk/hdrJ4Kyb3dw2ExqLq/Y7coFH8i28q9GmBdYBSzjPeDjWOGzs7bh8Fh0AGoKcq3ufhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDGzdFCi0+T+bKfia2yuJrIGaaeHn2IKJ+ookfdgigc=;
 b=AeKxTNtB6UtCBZJO7aFQlAcoAv+IgcGc7BC05cpdzlEnWdKl/VSNybS46l6DGlaEOuhRouXKiRBd00cuCzBkLQmwWRf00emi2mXs6TOVYrjnK20z9NkZL5ugC1PE74pvAI6rLu9wqfMbJKuPGIjjP/Ejiz/u4GUC4GM6ZG9qI20=
Received: from DM6PR10CA0028.namprd10.prod.outlook.com (2603:10b6:5:60::41) by
 MWHPR0201MB3530.namprd02.prod.outlook.com (2603:10b6:301:76::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Mon, 16 May
 2022 15:12:17 +0000
Received: from DM3NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::9b) by DM6PR10CA0028.outlook.office365.com
 (2603:10b6:5:60::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Mon, 16 May 2022 15:12:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT016.mail.protection.outlook.com (10.13.4.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Mon, 16 May 2022 15:12:16 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 16 May 2022 08:12:11 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 16 May 2022 08:12:11 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk, neal.frager@amd.com
Received: from [172.25.185.186] (port=44046 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nqcOI-0000p8-05; Mon, 16 May 2022 08:12:10 -0700
To: <buildroot@buildroot.org>
Date: Mon, 16 May 2022 09:10:50 -0600
Message-ID: <20220516151053.2363184-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca86b7b7-c0df-451f-bec7-08da374e76ed
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3530:EE_
X-Microsoft-Antispam-PRVS: <MWHPR0201MB35300BCF6E86BACD29406869F0CF9@MWHPR0201MB3530.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XLlTDEZGTrIbSZY2tpbwbMZZAPqkQSE7bIHc1ICTiV/F1sN3Mn21AEo+jllD99WF/zC28TbNTbbT+p7hHc70QK489NEB2O7+DgZVjNkg9fmAG//UIvBwFynm1fhnAG2NEbZt0MENHAuJtfStT+SSFpxAoa2U6kMawBiX8RAbhezh8mSEVV7ZPrHFbP+agtmfGUyr/WR26o6otoc1omBH7FRmpEPprLF82qNhpDiwHmdMh99mjId2fmOvYl4KBVEODZKNTPhMYk77JfXRVECcq4xXi5JRnvayVb+JCmtPGA5WqeW8Y5Wnk2TSR1Ds/95DamOzBUC1YZcn084pSGCE/XEy78xiO9KuOMZ27vGcl1su51xnF8zRewyQfZImKJCUOAmBCWtnjj8puPRrRcN1Vdzpagrzd0vomoOC7I9tiTpq80ruX8fnPBgBXtZMYSQEdlR5CiOOWJdEmFDHQ/sN1Dab3GEzJpHZ6meLDtcLLpypMrTV0eIqus8hj5C9TTPJmlbDxDJLOLcFBwhg+W5sSxj/S+Z+X/zxTStVS6hO1LH4BpUEKXmPV8MdtZnPZoPTxk42OmgdBuDJLcDGE2JednDcOp1MeUnOuNnck7UrOIg8880TZ0JHJGbDnLRa41E64UtZSGGv9WY1FIewjx8TC9St/SvysqdDwLm6e6Mmu4sK0p+GD9V+ZD+OLieruldbcbSwRNECGN2Wmnl5cmEkHgFnILJnXGI02vFwIrNGSYGTMPa4FBs5H9WARnMGsBh00HXrQrFLYlydMA3Prs+t7vol8i0o69GbO6dMZ0n2bpU=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(47076005)(82310400005)(54906003)(8936002)(36756003)(6666004)(316002)(1076003)(966005)(44832011)(26005)(86362001)(336012)(40460700003)(356005)(2616005)(4326008)(8676002)(508600001)(70586007)(7636003)(70206006)(9786002)(2906002)(6916009)(5660300002)(83380400001)(35950700001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 15:12:16.7678 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca86b7b7-c0df-451f-bec7-08da374e76ed
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3530
Subject: [Buildroot] [PATCH v2 1/4] board/zynqmp/kria/readme.txt: improve
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
 board/zynqmp/kria/readme.txt | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/board/zynqmp/kria/readme.txt b/board/zynqmp/kria/readme.txt
index a3a4b5e65a..d64427a52c 100644
--- a/board/zynqmp/kria/readme.txt
+++ b/board/zynqmp/kria/readme.txt
@@ -56,23 +56,39 @@ Where 'sdX' is the device node of the SD.
 
 Eject the SD card, insert it in the board, and power it up.
 
-How to write the boot.bn to QSPI boot flash
-===========================================
+How to write the boot.bn and u-boot.itb to QSPI boot flash
+==========================================================
 
 The Kria SOMs are preconfigured to boot initially from QSPI.
 This makes these boards different from other ZynqMP boards
-in that the boot.bin needs to be flashed into the QSPI boot
-flash such that the U-Boot SPL can then load all of the
-remaining images from the SD card.
+in that the boot.bin and u-boot.itb files need to be flashed 
+into the QSPI boot flash such that U-Boot can then load all 
+of the remaining images from the SD card.
 
 In addition, the KV260 Starter Kit QSPI comes pre-flashed with
 a utility designed to make updating the QSPI flash memory
 easier.
 
-Instructions for using these utilities to update the boot.bin
+Instructions for using these utilities to update the files
 in QSPI flash can be found on the wiki link below.
 
 https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+K26+SOM#Boot-Firmware-Updates
 
+Additionally, it is possible to use u-boot for updating the
+QSPI with new boot.bin and u-boot.itb images with the u-boot
+commands below:
+
+Flashing u-boot.itb:
+    $ sf probe
+    $ fatload mmc 1 0x1000000 u-boot.itb
+    $ sf erase 0xf80000 (size of u-boot.itb)
+    $ sf write 0x1000000 0xf80000 (size of u-boot.itb)
+
+Flashing boot.bin:
+    $ sf probe
+    $ fatload mmc 1 0x1000000 boot.bin
+    $ sf erase 0x200000 (size of boot.bin)
+    $ sf write 0x1000000 0x200000 (size of boot.bin)
+
 It is possible to boot the Buildroot generated SD card image without
 updating the QSPI boot.bin image, so this is an optional step.
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
