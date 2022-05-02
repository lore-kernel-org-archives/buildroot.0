Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9BBC433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 07:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 279C64029B;
	Mon,  2 May 2022 07:49:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c6s3MiFOis31; Mon,  2 May 2022 07:49:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0321040122;
	Mon,  2 May 2022 07:49:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09DA41BF388
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 07:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0555060E67
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 07:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z9bR05T1PsLO for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 07:49:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::616])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C262F60D4C
 for <buildroot@buildroot.org>; Mon,  2 May 2022 07:49:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVFri/E6ot+RFtvAdr+7ZD792LHpB4nZ0Eod64KOyZ7oFZrDl3Y1sQwHYSCYTnWcUlL6MGJ4hTxaC6bO+EpF4Wh6UnA1GSxyQ9xvGY1uA+7b+NbmoR8PEUwFk+Eo4t1ChGYSoUrbgejLKJmZPH7/iEARGomFbjnqa2+9uvwiV/6Iu+o2W7BbizP41OeWrAgovSukz7d3JB7SbvZ72/8S7ZHg9bL7+HzJLsOyBHIBlWDjrF2b+FN31R0YlHibX2NqxTiD5ovd1W22+g1G4A75Nn1NqPVAT0aEsm2JIJCb5fSp5MajB1dNKqGPZo8eUJYoUTEwRsSei1HX81SJmSg2GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PES/yH3Mn5aVqP3FIwNyTnX3Rm2hWWU+ZV7YnYf1SI=;
 b=EFLvrlsrLrlsI7HzuCFVBGpNNpM3mhlF6R5pPEmmobeyoks6cTSvIyHfyP3rbW5iDDlNJVaKMChPMtaQaItmjrB03NSuTGRkefAJWFzeUfavCqq4S+zTm0NyRa19s+e0yyWNf2/2geDK+K2PDzQJhrHMtj+XjPdLOCIN6OizpfW9IZ/gsGxAa0D86QL60OxeD74tvWcry11IlNawpWis9PCRUZVSKR0hGNfamjxZmrfV7Wfpb9A49GdgLWJpWsFGFoPKpysc0H9a8MGJkDOqu5ZNUvrisucnZZ6lDdjmtYrJJz3NStfp41PTrOqAJeXrGK6bhGv953eurqQfueUsbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PES/yH3Mn5aVqP3FIwNyTnX3Rm2hWWU+ZV7YnYf1SI=;
 b=T1D3ldsVzhoMQ35HRTEMkns78z84O2FXCRPB4378lCkk4cjo2nYfYkkLTXaPiKVds4vB0mfORCzZfqA9GTM98AhXVu6HjvTdEC5gmlzRo+NKuzySS4tOK/v7ZJdsoRYlCUQEJB/QCejXHOM4sA8Wk81TSDKBv7jZ9Lfl0JZUwRM=
Received: from DM5PR07CA0072.namprd07.prod.outlook.com (2603:10b6:4:ad::37) by
 DM6PR02MB4057.namprd02.prod.outlook.com (2603:10b6:5:9d::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Mon, 2 May 2022 07:49:19 +0000
Received: from DM3NAM02FT027.eop-nam02.prod.protection.outlook.com
 (2603:10b6:4:ad:cafe::af) by DM5PR07CA0072.outlook.office365.com
 (2603:10b6:4:ad::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Mon, 2 May 2022 07:49:19 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT027.mail.protection.outlook.com (10.13.5.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Mon, 2 May 2022 07:49:18 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 2 May 2022 00:49:17 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 2 May 2022 00:49:17 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 neal.frager@amd.com
Received: from [172.25.185.186] (port=40206 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nlQo1-00062N-Qt; Mon, 02 May 2022 00:49:17 -0700
To: <buildroot@buildroot.org>
Date: Mon, 2 May 2022 01:49:06 -0600
Message-ID: <20220502074907.3941472-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49562365-292c-429e-154e-08da2c104342
X-MS-TrafficTypeDiagnostic: DM6PR02MB4057:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB4057B00E1ACC0BF0231AB87AF0C19@DM6PR02MB4057.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m5q5pxcKDVhN80AFj+I2IwKX5jw/tmV9QsdGVxBBQlrpyDmgmz6y0gX4r+JDmWx9vZEPLyxDSVPtODEcKoBI7lWkWKbZuDjZ5oQsK3gjyC+bolem7BKjxgfp3DRugS0b6Nj4wmJBkoTrj4hygnvDLHjN/PhF9n+U9aY31zt/8JoOgZO3YcZjTOFWSSgVI4pce48J5z7h99SekGODSg8z5SG4843HR6ZcqDZKnyQf35zjQn4Zlb1JOdrSNSvNz/BxaRmsjhpYcj1iRAsGkTAifOaEL7CfSm/DdQhwUt4sdCDV3/8t4F36rK0VKPZwza4VAsYLB7D6Cu0OB3+Ld/fX8pIXEg1lbSBYObCHZpne8PhRziDDQjxVYZmA8RbPJ4W8sCwF1HMo2P3zC1QKGJS4veYhCuQniOJ9FDY2dsF1LUesjCks7aiag12Rav1wvgkRtGQTnP7t+twlelNowjc4m3+XHKIAE9ttXtXRzYH6VDBuXZlqQMbVwXSBQ2HhYo14vd6ESiDrctV2fcJCqGRdP72hqfjLndjZ9z1lpU8qVGo41nbDycU9moDCF1e9ZrCPDKEFM95mgGxIKmt5XmZp31ZbMEWLxr2WPcbfOg9riL1KF1X2cZUrmoEitHyMFzSGbpzKmKb4+CBnXUwH0YQBEmMh+Ndik1lsBXvS7o9+EkIQ7eCoo56anY/hCZbwvUrHdJM0eYuWynpkFMmCfOFuj9TFq5KwHqTte2nrUWIsrisQpHBUCVOa7mCh8xLuSVUvaxEAs5yWjhv0PZNzBbQ2hMKSU1NfxqzLyQoB99ZtFPsmJ+KLAr+kW7tpSzHZDFOwLVxXd/sLgqHpQEpiqbwEww==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(2616005)(54906003)(6916009)(82310400005)(40460700003)(26005)(1076003)(508600001)(83380400001)(44832011)(8676002)(70206006)(4326008)(316002)(9786002)(8936002)(70586007)(5660300002)(356005)(36756003)(86362001)(35950700001)(7636003)(2906002)(6666004)(336012)(47076005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 07:49:18.4912 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49562365-292c-429e-154e-08da2c104342
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT027.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4057
Subject: [Buildroot] [PATCH v1 1/2] configs/zynqmp_zcu102_defconfig: bump to
 Xilinx 2022.1
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
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps configs/zynqmp_zcu102_defconfig to Xilinx software release 2022.1
which includes the following updates:
  - TF-A release version 2.6
  - U-Boot release version 2022.01
  - Linux kernel release version 5.15.19

It is better to use a Xilinx official release version than sha tags.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu102_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 2dd0817bd8..37df0977a7 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v5.15-930-g966124532656bc95d781abf57531e4cd4f962237"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.15_LTS_2022.1"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
@@ -16,14 +16,14 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/Xilinx/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.6-33-ge678d5ddc475f34dea8f5004fb6ebde118621784"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="xlnx_rebase_v2.6_2022.1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2022.01-165-g667001319cbe511ce6353195fb4910ae5cb041ce"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2022.01_2022.1"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/zcu102/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
