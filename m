Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB30C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 18:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B745E610DA;
	Tue, 17 May 2022 18:39:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RpR4hxMdQXhB; Tue, 17 May 2022 18:39:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D425C61094;
	Tue, 17 May 2022 18:39:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A6AC61BF855
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 18:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9576061094
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 18:39:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CuUVuVwmtEAb for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 18:39:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::615])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F034460E11
 for <buildroot@buildroot.org>; Tue, 17 May 2022 18:39:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZpgaPbrsLaunmzNA/nEZRVl4kwxQGeHA9ousU+lfxFPmlbLmTmCjRvh8s4Rp4OpJRDr4co+HWKMi6OiRB616pXAaIdFC/pQwzckK8ngTVkXSWvJryWphHr+g+yYxepSVQFaItWWVJMhn8xmCpI5mrVjebGIv+GrwdUVTEYA6lxUv6BX9lTtIVrcS64pM6u2QXh8SpVIEPz4lq+014Lyi9haSFqJwO01U5gXnCdHMtbp1N3B2WkWPr7+GWpZRJhuxtggJ7C566BVBhH9NsQZbT7A5ITM4AL46gTks3mc7sf4iu+ZbK0UaQg6jp0CnJtjkzEbTSWxVLucgy43n3vWD2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tY3bVU+bI8OvVREoVhj2p5DhK21CmxaxxYzcYU7IJlA=;
 b=EsTfmH0S0NfgnedqFs6bm9Ssktst5hXBtNs1X1yKZMbTU/GR60kKG23E4sAUcsUdFCdcbAV2u69drbDyXnyrU+NZOlrVb6pdDDlVE0RfuJNvoHK/iImmMGRumyxx9f5XTMeBY2w6y91rkPW4E9AABNO7hZ/R1wV6HFfAinxX7Z9xA1MFhjrraCjoq+TldF3BHJL0UTggPm/jjBzoNI4sgVIPBBOoMrLeAz/QmmjlTMmMSowa59JnNUczFzlVMSlNyRcLKMa3NbdQPlH2vIwqiHCfbYDY/XEV5Bn8YmSS2G7Nwhj6aLc1vgF0vRA/fmJ+7fH72/EOODDJJ6nIw52P7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tY3bVU+bI8OvVREoVhj2p5DhK21CmxaxxYzcYU7IJlA=;
 b=bNUIXSm8EQdfkIOiJBJ9k982/3QR+nrTBUiX6dX/gC7/EIWkH7Fg1zzR4xOXFT/PHJhM2mLtPkgJO9Tlpvd7RNDNqpepzA4nLfgEXf5mA9A3NH/dZTgwppDP5jLeV1VmSGio6zpyXE5PNBOvR4B5HXZgL1AO+4vq6uppIrrAg+Y=
Received: from BN9PR03CA0396.namprd03.prod.outlook.com (2603:10b6:408:111::11)
 by PH0PR02MB7589.namprd02.prod.outlook.com (2603:10b6:510:5a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 18:39:17 +0000
Received: from BN1NAM02FT019.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::f8) by BN9PR03CA0396.outlook.office365.com
 (2603:10b6:408:111::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18 via Frontend
 Transport; Tue, 17 May 2022 18:39:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT019.mail.protection.outlook.com (10.13.3.187) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Tue, 17 May 2022 18:39:16 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 17 May 2022 11:39:15 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 17 May 2022 11:39:15 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk, neal.frager@amd.com
Received: from [172.25.185.186] (port=33564 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nr26F-000BUP-BB; Tue, 17 May 2022 11:39:15 -0700
To: <buildroot@buildroot.org>
Date: Tue, 17 May 2022 12:38:41 -0600
Message-ID: <20220517183842.1389395-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517183842.1389395-1-neal.frager@amd.com>
References: <20220517183842.1389395-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cc0b349-2355-4764-4c98-08da38348bfb
X-MS-TrafficTypeDiagnostic: PH0PR02MB7589:EE_
X-Microsoft-Antispam-PRVS: <PH0PR02MB7589A672849F83E4F57B1978F0CE9@PH0PR02MB7589.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s7LipB5xHo688GhliR5UW94/Awc0hlAqUwrZYToeC9i9W8rMBLG3uhikzp2bAjuxeEJi52/niOfDzWqNWnTssvnFZ/wxEkovFFQNlWFrju6dIGpku7+SHBIxy7r2DvogZOOT+m1ToHk8OI2CrR5+bQVnjE/fdk1t+GbzYBuPbdgf3hxDD4hhyRr2LZbh5mV9dXgO3TZbxPM6bI5KHwOa0gxX6dOWIaE8DZKm7ZXGGeCkEoBUOwgZVhC0YI4A+kIeCBkjpVg0End4Wa7exg1AP0Dp73p1Snjp5fstE4QvQ8ic/zkxUOCEOkxQ0aHKuCXHRi+ctlmahVep2c64xw+aeCJpZ9LYifgs81WTi4e0DFfx8h7XLUoT8rOYfhI3CrVasI4LicG+Ffo7W3+bCywpyQmNazoEpO03SNBF5OxR2O51Rhxnvbdb+mzJRPvSakizLw+MAv9oE8W3gU07XB/7uypaxFELFDzltVLL+EfHLObBvIytXKGKBxRyVnt+z6z/SW3r2Ku+Spp+ZT0cPtvG2od1uPBstyjl81SNZyVG4ovPmCXVIQyfDjdleidw+dJabkl6a20UsniiyugWcOG+llYox5aM9XKhxCHD9e8U+wezvl1SPgPuNrpsq0JX9TnFpJ1X1rvwqyD58QjlEqnSyBo2gfJkBO8zPJ8lgqXvUzWcfpelemLX+xt8p5kZKKXHQKhbKRGofUDrrEOpFKg/0A==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(26005)(70206006)(86362001)(4326008)(7636003)(8676002)(70586007)(8936002)(9786002)(508600001)(44832011)(54906003)(5660300002)(4744005)(356005)(1076003)(336012)(6916009)(2906002)(6666004)(316002)(2616005)(36756003)(82310400005)(47076005)(35950700001)(40460700003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 18:39:16.2741 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc0b349-2355-4764-4c98-08da38348bfb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT019.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7589
Subject: [Buildroot] [PATCH v4 2/3] board/zynqmp/kria/kv260/uboot.fragment:
 add addl uboot build options
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

This patch adds additional uboot build options that are
required for kria k26 soms.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
V2->V3:
V3->V4:
  - added CONFIG_DTB_RESELECT and CONFIG_MULTI_DTB_FIT
---
 board/zynqmp/kria/kv260/uboot.fragment | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/board/zynqmp/kria/kv260/uboot.fragment b/board/zynqmp/kria/kv260/uboot.fragment
index e1aca68692..874eb470ac 100644
--- a/board/zynqmp/kria/kv260/uboot.fragment
+++ b/board/zynqmp/kria/kv260/uboot.fragment
@@ -1 +1,16 @@
 CONFIG_DEFAULT_DEVICE_TREE="zynqmp-smk-k26-revA"
+CONFIG_SYS_SPI_U_BOOT_OFFS=0xF80000
+CONFIG_DTB_RESELECT=y
+CONFIG_MULTI_DTB_FIT=y
+CONFIG_DMA=y
+CONFIG_XILINX_DPDMA=y
+CONFIG_PHY=y
+CONFIG_PHY_XILINX_ZYNQMP=y
+CONFIG_PINCTRL=y
+CONFIG_PINCONF=y
+CONFIG_POWER_DOMAIN=y
+CONFIG_ZYNQMP_POWER_DOMAIN=y
+CONFIG_DM_RESET=y
+CONFIG_RESET_ZYNQMP=y
+CONFIG_VIDEO_ZYNQMP_DPSUB=y
+CONFIG_SF_DEFAULT_SPEED=40000000
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
