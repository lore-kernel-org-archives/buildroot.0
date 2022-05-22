Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C14C433EF
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 13:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEE6A83DEF;
	Sun, 22 May 2022 13:16:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OcvKxG78vjG5; Sun, 22 May 2022 13:16:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEA7E83E5A;
	Sun, 22 May 2022 13:16:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F6BA1BF384
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 13:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A32983498
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 13:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ThTZkjp9qZOx for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 13:15:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 778E383459
 for <buildroot@buildroot.org>; Sun, 22 May 2022 13:15:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJLtv3QFSqgT+v2Ht3GPxRwJZh+7R7Cm7D0ABOpbXQQzxfyo90fH3N6QLFcMieWLVS65deIk9CRJxFWT4eGuBtqaC172xgNKLipIvPa/fSIXWbBm673sIu3yDRxgJL+0sXrICq+6jtmHu5hJXGd2/5dsd6jmdeJo4nVxjOKZ+KE53x+RB58gQogkGcsfBPVGIcxlCke8h14r6xt5mO8pgkCeywsah+xac8CCHjWGBk5npxJv9bWa0LTCbligZoo+OlWGhZXBKdvWdtMwDtLS/HJMnNiU9o6OCE4LNuZtbJV9FDNifZ4J9pTotf0uq6QywtCJt52Ac71m5sCU9Bb7Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3HY/53i9luPpQE20XPL7pX2XGQSNlRmQ8oUu+CcNFU=;
 b=CEoi8y4I5vQQ6No4/xDewamcrUlLANIYU2hiNezqvpnHKdRf67xH4otz00K+Wxe5f1LTETFLLL2X8S4lcrsXu2C9wIt+mNir5X7S3BFQyZ1oD2jH7ChfW2cjtPt+KkNyBT+zL/g9cocqvVl/BDUkWS0kHi3P6eBLoE+9JV+N0r6sCWdtSAyYwCWviFXvv3hD08ugr0YjRuFLOE+rl6Cu70wknHDM3msA6RhFaSLJKhVdfa4gSnKmqtvIBiZbF51xL1hnwrA0rUX3HGGsfD8ZBtGS0Sx3h3SDPIaQiGgLQ81mtKjG4f2xX2WkiT873XDNbuhVpyl0Ibutm3BHW3ovew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3HY/53i9luPpQE20XPL7pX2XGQSNlRmQ8oUu+CcNFU=;
 b=cl6ScO2au+2EX8sC2bOg1OLPuWdbDGRq4KPA1FTMT7weoOe1pHzD09ugrn9K73oC+7dseJmnXFqbdpCR6Nn/8Ddv3nFYsWv95e78YJ9XW+5TSmt3lqH3ZXKcL3LownhrI+SWHY3FtsS92jRn3khBlHYC/da2/0rvtI99rNcvIBw=
Received: from SN2PR01CA0025.prod.exchangelabs.com (2603:10b6:804:2::35) by
 BYAPR02MB5990.namprd02.prod.outlook.com (2603:10b6:a03:123::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Sun, 22 May
 2022 13:15:49 +0000
Received: from SN1NAM02FT0005.eop-nam02.prod.protection.outlook.com
 (2603:10b6:804:2:cafe::d8) by SN2PR01CA0025.outlook.office365.com
 (2603:10b6:804:2::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.21 via Frontend
 Transport; Sun, 22 May 2022 13:15:48 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0005.mail.protection.outlook.com (10.97.4.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Sun, 22 May 2022 13:15:48 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 22 May 2022 06:15:43 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 22 May 2022 06:15:43 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk, neal.frager@amd.com
Received: from [172.25.185.186] (port=39774 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nslQs-0004kl-UE; Sun, 22 May 2022 06:15:43 -0700
To: <buildroot@buildroot.org>
Date: Sun, 22 May 2022 07:15:33 -0600
Message-ID: <20220522131535.1498502-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220522131535.1498502-1-neal.frager@amd.com>
References: <20220522131535.1498502-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ee65820-8066-46dd-bfef-08da3bf5301b
X-MS-TrafficTypeDiagnostic: BYAPR02MB5990:EE_
X-Microsoft-Antispam-PRVS: <BYAPR02MB5990B39A966B4E35253E767FF0D59@BYAPR02MB5990.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zTdWiw9HvOgEenbnxzuC06ZD3/fJvrKYXoqDsfK6e2Dob/5xOzB7BDrsltUYEw5ruIvJhF5jcHc8igKDVR96H0ixKAdCuglghM/D4g9h4ahngPuLfARXMSh4uA70pMYu5cCj8i4QA43XkV1hDO8MxRjzPCFtvNpSx1b99J5uCnQVuljJ/NCgZ2ePwRvDIScV6zHMPGmZzFzAU6zCYq0W4juFmVSyHdNvwV/2vBVtvpus49Hjod3ActSDCORNBqU4DFM3XUsah8F0ouKG66IXKg1r0C00GUpu1laBKiWpBzD3jPIUtbforJ1amev1m9r2TiBQRWWGyVnVvY83Zn0Mh0Uq06qxkp2jsqUxiUEXtHblPYG5icIcheWD5/2hGtysKp8CRvo/mA6VS8O8va8taBupTPEcoeh/ypy1AdPwDL+Ov27j+/SIkfmPoCFzkRGzVa4fLk00rm60Tp5CyBqh3eKGVCsCJJv+I4E2Y2920kYrY8JjdRCoxRF65aultLdsIu237dlXugZWGrPEX33cKSNygSUbUJ+pF5J8v1VCo900IOq1QeosqlVC0M01FyUNe57iKmV7ONiDXG4X2CbMf9P4Zgna7d0hyRoaI3mXajTd+53DIn932idvwUJOVFnEwAUzi3FZitAPR6ZnwpMGA3CyKVF/WUYauFmCY3RBtVPeS4uO3fz0iz6pglTpdgcRjtwfL22npTysS9FOzy5fKA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(7636003)(8676002)(4326008)(8936002)(70586007)(70206006)(82310400005)(316002)(9786002)(26005)(40460700003)(4744005)(2906002)(356005)(5660300002)(36756003)(44832011)(47076005)(1076003)(2616005)(336012)(54906003)(6916009)(6666004)(508600001)(86362001)(35950700001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2022 13:15:48.5560 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee65820-8066-46dd-bfef-08da3bf5301b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0005.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5990
Subject: [Buildroot] [PATCH v1 2/4] configs/zynqmp_zcu102_defconfig: add
 parameters to generate extlinux.conf
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

This patch enables the zynqmp_zcu102_defconfig to auto-generate the
extlinux.conf file.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu102_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 5361981f5b..217fa0814b 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -2,6 +2,7 @@ BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
