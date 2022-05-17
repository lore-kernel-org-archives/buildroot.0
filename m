Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5068C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 07:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70CDC83E13;
	Tue, 17 May 2022 07:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fS99dyfxrJ6y; Tue, 17 May 2022 07:30:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD84C83E11;
	Tue, 17 May 2022 07:30:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7CFCA1BF2F6
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 07:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C5CA83E18
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 07:30:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HmBE0WN1hbU7 for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 07:30:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::613])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A83D83E1E
 for <buildroot@buildroot.org>; Tue, 17 May 2022 07:30:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3gBwCK/wQnupfGfl7qM8CL2NLYSgFC0cw5OsC76ha5ku4KNOptC3I1XPpt9H5/oG7cKUnMJFFTvy81v8vkQnH++F0i7OAtPukIhRPFcYG1Ur1ILFx8uzJGfTM2pRoLOUt5bJWsACWpigw6UpNnP9vK3ODTuxN12WSMasXOWQPf90gM9TKW/UgnVhrDkVM2cSR1Wq43QDW+b2EgfhYOJDZ6gbgQoeImpDt2ee9+ki60KzMq5MgOryHGjwLR4OCKhFj0jPCR4wmrSf1gvpO8q1YIFryjE/nzQ7RvKfPd9fpTusoV4/BoUkwtbDcYvoznbXeek3WoSy0J4Vh5GAx9/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1HAwUeE0Xo/PqJWBHKh+84PD6//WaQABhFemx++d2M=;
 b=bEE0SALdf6wPDttnBNNfdOlDeXiahA2n+zeCSyc5HdwKu91Qn8KSGnpCnsX/DUVOb1wtiQWWDqTX1kbJMDUCqlq00RtBiMhIZTX8ct/8T120HJe8AZZ1DKwFTo5gsCj/c5gknC0VPN6tyzUge8N4sj1GtxhCBD4ChU103ECQ78vOeI/rCnzOASXE529t5acgWxFMGsOiIvaqBiYBYdJbGRjOEUQIc15zFfmIK5x1ZHJ05ptzsIHpH0VHsleDJpfZVk7mqrCdAxrEijjxafjx5YSoRDa0JP+dymtMmFph6/xz7GdimhWekLOVEerZ44TZ7zIeUcG9ePOJQTgES2s7pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1HAwUeE0Xo/PqJWBHKh+84PD6//WaQABhFemx++d2M=;
 b=KoVao9ttUMcs5ZwQBtLzdgO66GQulJmwpDv6AMqD9Zr5qgnuitGUy3hiB26n9d399C7yNk3dU9ENBVj4hosI3NzrkJ83mXHo5MqOptA+jlj0KY5DE0e6pr6uX3HWWtOsjKQzOaNAkZ5sRIOGafi0dHUj4cIjFhmXgDcKhK6ZEds=
Received: from DS7PR06CA0025.namprd06.prod.outlook.com (2603:10b6:8:54::31) by
 SN1PR02MB3710.namprd02.prod.outlook.com (2603:10b6:802:28::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.14; Tue, 17 May 2022 07:30:41 +0000
Received: from DM3NAM02FT039.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::eb) by DS7PR06CA0025.outlook.office365.com
 (2603:10b6:8:54::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Tue, 17 May 2022 07:30:41 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT039.mail.protection.outlook.com (10.13.5.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Tue, 17 May 2022 07:30:40 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 17 May 2022 00:30:02 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 17 May 2022 00:30:02 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk, neal.frager@amd.com
Received: from [172.25.185.186] (port=52476 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nqrec-000EOf-7U; Tue, 17 May 2022 00:30:02 -0700
To: <buildroot@buildroot.org>
Date: Tue, 17 May 2022 01:29:48 -0600
Message-ID: <20220517072950.1322452-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dedf3f6-873c-4247-fc56-08da37d7254b
X-MS-TrafficTypeDiagnostic: SN1PR02MB3710:EE_
X-Microsoft-Antispam-PRVS: <SN1PR02MB3710CF4E3E8A68A43119DB09F0CE9@SN1PR02MB3710.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gSHRs8hoY9KxKKnu6cGZPlBi50tgOPI+Gu4cfqJ4v0iCT9uN4k2xZOyLMxKGKPKRI+oeCJQsm0HYGNy9pnq7RMPFh4f+4wjCJH60s996LR6bV2zwwgqfLia0XU3PfUvY29PXNazTnwxKQOLrEAOl2JvOnImpYG6AZ9GL/HVQjCAr4i8MR4L3QjadDzZ5DmjEtt06yLgWN6kotxSA5hH0arq36wVnBPwR2iErTuvWKmiujBoy7gPwG7mCUZJ1wV+GuS5Lk6KEztZqGjp79RKVLpAy4BWfvQS8/5hcJ1/c4Yt3ptC8yAgGmPLAP5c1rOuApiFSk2m3p6Wxo7+Cp+lHUz3FEKFlHxg0H4P6n7C425jT87DzruX9DdlYAhTKBTvKKPAZUd9H+haAnhqgUGkQ2VpcutfUtpA880vgyMTjbL3/YSmgwmDAxfKpj/ANn/1cC0GwmoOu9ykhE6CsXe83oFlfaUE4L/cuINIC8IUCfydaAoehLcrR6FWSwA12I6GN8s62gOhQL50sM699a9opFRN4f0lCruT5LNsftny8kQS3WW+1Z0t5bVEjpzQokUeIa/xeIUlmiBDpMxmUUoe0Ig/qC2DQgQWS52O1BvpqYA9lcnU0L+0z1CwL1WKSe/F/5mM+Z7OGuZy6tYRUMPugTyiOGjHyX5iknaxfuIBueFEVCHFI9vzroHRdzA2rjBWtHSGkD87Nbi8aXAFXB9aq9SSCuvGnf3yD0s3eylDX29Q3bmpikLcQMpWhjyUXmEoGc+JqXDfkEnYxwIIw6rHuxS9EJ7C8ei5DOjlBDZwYW4E=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(316002)(44832011)(6916009)(54906003)(4326008)(9786002)(7636003)(8936002)(82310400005)(356005)(70206006)(8676002)(966005)(36756003)(70586007)(1076003)(26005)(2616005)(47076005)(40460700003)(336012)(508600001)(6666004)(35950700001)(83380400001)(2906002)(86362001)(5660300002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 07:30:40.8798 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dedf3f6-873c-4247-fc56-08da37d7254b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT039.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3710
Subject: [Buildroot] [PATCH v3 1/3] board/zynqmp/kria/readme.txt: improve
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
V2->V3:
  - fixes boot.bin file name spelling error
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
+How to write the boot.bin and u-boot.itb to QSPI boot flash
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
