Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82985C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 07:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 183E583E3A;
	Fri, 13 May 2022 07:15:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FVt9SFL3j6lH; Fri, 13 May 2022 07:15:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0DB983E1C;
	Fri, 13 May 2022 07:15:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CB081C11A5
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 145B160B25
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bgaqOSQiXIUE for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 07:15:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::620])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DD1D60AEE
 for <buildroot@buildroot.org>; Fri, 13 May 2022 07:15:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIXC1QZNmX+6ek1pMHhEvbfOCh3dPaH64pp9QkG93p7jr4lxRig05VMvgrV6PzSklBRuWtNgEq3PF6NG5pLfX9tDSoq/XsbQGobxipfywloDTEnqSYq/G0BssRFi1swR6Ezxvq7UgdJeTt/Nh8f5C1xEiHmwpVDd7+bXCgz1/OJZu2virOrleZKN7sPIUZXQLw2IkGb4yWVlCsKU4/qqjxqVmcEo6srWjMBMw5IP3KE+Essy8R2Z6KgxbBMW7snNMWgn06QVdsoSRqbQy+sREDvBeN10NX2C6/NKf6L08wavdgUQI2KhYaGSf38ZTp0KKFS1I3nf6lJQXOF4Qqa0ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDGzdFCi0+T+bKfia2yuJrIGaaeHn2IKJ+ookfdgigc=;
 b=ioUXzS6W+g5GOCV8fwEVkEpSoJDayBCGekJDVjxajHmvNn7GmpDMmNv8uFBEDFrxKLXBpPSuQGhgs/1jDZD/xIKQuwmbE1K0jo+kY0k3lz12deqx6xmjZ0oae7vRntiljGIjOOinRffp6aHgGQyfj1kk5ywA6pGfYeH3ds57/ah3We2o55Li/q+LclCtcJ2zuP4+DORrJY5VP2M7s0Pw1IzimESYG3Bo6eJToN9bZvmIwLhKeTRIKpqAMYdK6EGD4OthBWmsePa2LtLC6bpo+jIZdD2Gk5BDFiVghSNSq0rH3WUqI7b7peYNEKg7P/wTxJEC8ejGR0GkRpK0E5CHJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDGzdFCi0+T+bKfia2yuJrIGaaeHn2IKJ+ookfdgigc=;
 b=SdqtxSK99L798ZHfVpthh3TJy84aWiIDQ3wxCiLHBzvDdQl0Ij21fUJC8k5jGq4GC64IeZenXv42thNfz/y7SKZ+ZtnJJatztTf0zWH7H4ZgP4gFS9dTKrurzXXGAhKPi1+IxVIZKUM3Qv1sn+VqLzLFifVO9pKzlt6lGaFXl0w=
Received: from DM6PR17CA0030.namprd17.prod.outlook.com (2603:10b6:5:1b3::43)
 by DM6PR02MB5739.namprd02.prod.outlook.com (2603:10b6:5:179::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Fri, 13 May
 2022 07:15:18 +0000
Received: from DM3NAM02FT015.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::4f) by DM6PR17CA0030.outlook.office365.com
 (2603:10b6:5:1b3::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14 via Frontend
 Transport; Fri, 13 May 2022 07:15:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT015.mail.protection.outlook.com (10.13.5.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Fri, 13 May 2022 07:15:18 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 13 May 2022 00:15:17 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 13 May 2022 00:15:17 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk, neal.frager@amd.com
Received: from [172.25.185.186] (port=60776 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1npPVg-0005H2-2c; Fri, 13 May 2022 00:14:48 -0700
To: <buildroot@buildroot.org>
Date: Fri, 13 May 2022 01:14:42 -0600
Message-ID: <20220513071444.2966858-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2304cd9f-e65a-407d-80e2-08da34b055d5
X-MS-TrafficTypeDiagnostic: DM6PR02MB5739:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB5739D6D0085CD16E5270E0F2F0CA9@DM6PR02MB5739.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mmVhePk0HaANR3QcNf8E+pLoFDyLcFePBaq+kOjgqUeJH0RgRWQZxv19JWN9PDCCydUxu6tCPsv+vgSEsV/favCwEpbX1CqMOHFHlPa/x1u8hm1vi/jGRocMXdfGT0Kv5Me8Z3hysMr+jB+/ujPPXDm3sy2PsfbYWSL8auUXsz+2weTUmZYDoBec+3Ko2TEM2EcPRndyu78pCioEmL+JtKCFtewlw4XEGWrKrvgfS8AO6AdUHZAVIkAlGhQ9PU4+NaoW6V+S0AqwByNQMc0LniirwCwyaMT6OMnrLHSMYzYNMldTjWGoPO3q0UXXjOhMnczA3fNFfVNrUnEinOq39+M0x0Gho2F0K8CYV2cr7ftSVUlwY7KJTzdbfgq9P0k4DSEyPWmMXSqLYjDIB51JSeb1A0D/byiy0tW/H68KoZhZWDreK2+Y5vURzIDKji5SlgZcyrUi7BM/m8ag6D88qCgF5kXjRG3vEJ2v5Mpd0OocSQZSPQmIErqesETJ4VpeBuGOEa6GNHKLdjAos+gcVc9GjzTE812MLoe65Pq2VPbgOtWFWnxlRUSO+Zm/DWCoN5UqZZQpFnv3AiXx1yGPGFfrtGLnE0d/dB1p5YmKMnJyHc2hT1NAim3M05I3idVSeeX1NvOQTkTZql0Tm9DQ3MjSTucCqC+6SbyXJC9ufx4SJiIK19r4ZCnxxR1j6YSS01VY9KJUCZ2xt0wh8/B3/RXr+BzkFGV92+1XJhZ1Ic9qV+15A3M9kK3FGF3Kc91wTj2hRCTGbTXuBRMKT9MGIlzOZCyS4hF2/LCsGU10kTc=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(336012)(2616005)(1076003)(26005)(47076005)(36756003)(966005)(82310400005)(6916009)(35950700001)(6666004)(54906003)(508600001)(9786002)(8936002)(316002)(44832011)(86362001)(5660300002)(356005)(7636003)(2906002)(83380400001)(40460700003)(4326008)(8676002)(70206006)(70586007)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 07:15:18.4353 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2304cd9f-e65a-407d-80e2-08da34b055d5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT015.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5739
Subject: [Buildroot] [PATCH v1 1/3] board/zynqmp/kria/readme.txt: improve
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
