Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0463CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 17:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A036441548;
	Wed, 23 Feb 2022 17:54:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VqJ9TZL24yNw; Wed, 23 Feb 2022 17:54:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3B7041513;
	Wed, 23 Feb 2022 17:54:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A59C01BF263
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 17:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0CD181A99
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 17:54:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MlZYaykGtCMM for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 17:54:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82BD381A29
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 17:54:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+7hZyQDgJ4J2JFFiElW4a4xCxF3a/Xa6IMw+tH1vhCi/G/SlWHbo+SmoLM0AT4bMcbNPlh386CsmYp09GB1NNSz0mO4U01ZkDwdYmi9tVTJVCfGR2YE82gWQYXE8A6wXDaLfFscQjmtmcAyoBMYDARjSVXD5GNb1OqFCQeJvVIB4Sapl4KaAgcSKmkhcD1TTcCDb8HVH82l9p5D2WTkILKfUPRZcVw7KodMgjeUiiABvcAsE8sQQJ7kvlhUfC8QVWiWKj25S+fxqOws9DlXceMJLaoXtAkt2lCKMlFr60iAi4M6/LHeSS0OHZLd2+cdIGlFTmKgXJSV7Q8gDhHpfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXv4SfydG6DwRfV0SIAaOSQr59i45FKRm4YyeXQkWU0=;
 b=EK6fpdG3V1e+uiJlvCUe7TuyVf8rDtVaZiB5PPw0c2LkTniCWqQK8Zi7FnIDY4yomTtmEpSuLIrWT7y7zf4epms9/Ggr/mIOXVQ5rRlEmrGPQoXRzH9ywS/jkpr4ApemD0idwVEkaAuaXdj8R1gb67F1eOkzteP3iJZy3o1JuU9Mij5N1pVp2LEpqbD+PGTImcBqj05K7b3wb7ueVpavmKtr1WQQiyHFK2Xr+64GtALSdSIf7fujUPYkTLX4GQnZ2eRHGJllIlXRCYzLzKhQPbkfO5c57Ybi9egO/8psU44eUh8z+3vqGmeSTg9J0mbRHp1FitJmle+uPsW0zK+ABw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXv4SfydG6DwRfV0SIAaOSQr59i45FKRm4YyeXQkWU0=;
 b=o69rHT3EEocHxjcoHFgz7vu0gewlxORKHOZLA9skp6RqnWy0ioRS3P5Ka+yEIyj6mzBug3jGo2krnLc/jHiV7yto3mjCi8rxHAzeqfISQEoIOwniGyWPKFq3hbwKs7XTuCCTNcfOrmCZzKYObTxIbwzVo9U8UaYdE4E/y1Vb6ko=
Received: from DM6PR03CA0069.namprd03.prod.outlook.com (2603:10b6:5:100::46)
 by SN6PR02MB4589.namprd02.prod.outlook.com (2603:10b6:805:b3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Wed, 23 Feb
 2022 17:54:13 +0000
Received: from DM3NAM02FT045.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::c) by DM6PR03CA0069.outlook.office365.com
 (2603:10b6:5:100::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23 via Frontend
 Transport; Wed, 23 Feb 2022 17:54:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT045.mail.protection.outlook.com (10.13.4.189) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Wed, 23 Feb 2022 17:54:12 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 23 Feb 2022 09:54:09 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 23 Feb 2022 09:54:09 -0800
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com
Received: from [172.25.185.186] (port=57942 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1nMvq5-0000Ym-P2; Wed, 23 Feb 2022 09:54:09 -0800
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Wed, 23 Feb 2022 10:54:06 -0700
Message-ID: <20220223175406.3347267-1-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18cce39e-13c4-4006-bcce-08d9f6f58046
X-MS-TrafficTypeDiagnostic: SN6PR02MB4589:EE_
X-Microsoft-Antispam-PRVS: <SN6PR02MB4589BF14DB6FF3879A8F3E9FD73C9@SN6PR02MB4589.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vH6z14XyK61XuIPy+H7DVwA+1ZOIVKSF5hblNNmXmv/2Wahcg52dubwKtuagArSgmhL40Q8H3KnIHoKjQSoxNNXtGtISX+pblwotCpHAi+58KffJ+acLYA2HYDPFmwGrlypx1UtTWHxuI0RY5crPpYIX1KRFbzEEFv+/uLaISzJU0K+2/6JWQd9NT3L7lwiYf+CTocXVNt2kJmAaq4A4earduBLRTU2H34P2RLffxtPTMAF82A5LkKqBdZ0mANZY5IZmPr79XE7ACOLDHEZ2oPTbjOaGQT67xXCcVJXFLsuiG3sUQyyqOqRPguGAAguYMT1liur0WE4SZKa4PTdHK2mmPH/4Pk1+aWKJTPy3wV/ePPJF9I2CNL3osThwzMDDvRUrC2VVBazh9GJNYKNH/TB97q5a2OP0xnkKqwAh2ZGGuhBonF4ZRlqWrbCQZMzI61mP2NttnxkNLBXYtMrXpD8Y5n8BO0i0hilBnjntGvSjTvz2C3JhzNr0xcL0TEZ/t/9ThHo3cyNxQYUJWGZIjZu/sdg7GHzevkQiFuwS9Et6hy7qw1A1tvKFJYkBJNkXYb+CZWYDptBLA/bc2raVUAl4i1O9R7f9hBckE7D8vSR42RhpA7ttNG33hLDTnTOpd8k9ij05DpIr9w6spCwAG5sHkP1L8BXKnVzDFwnGBUuuMpo1e+5iFCHI2n2PC3LmEmn9Zmt7jBL/day3QSmeqg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(4326008)(26005)(7636003)(8676002)(356005)(1076003)(2616005)(107886003)(186003)(508600001)(70206006)(82310400004)(316002)(70586007)(5660300002)(426003)(336012)(40460700003)(36860700001)(8936002)(47076005)(54906003)(36756003)(6916009)(7696005)(2906002)(9786002)(6666004)(44832011)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 17:54:12.8394 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18cce39e-13c4-4006-bcce-08d9f6f58046
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT045.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4589
Subject: [Buildroot] [PATCH v3 1/1] configs/zynqmp_zcu10x: fix U-Boot dts
 config
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
Cc: luca@lucaceresoli.net, Neal Frager <neal.frager@xilinx.com>,
 giulio.benetti@benettiengineering.com, michal.simek@xilinx.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Neal Frager <neal.frager@xilinx.com>
---
 board/zynqmp/zcu102/uboot-fragment.config | 1 +
 board/zynqmp/zcu106/uboot-fragment.config | 1 +
 configs/zynqmp_zcu102_defconfig           | 1 +
 configs/zynqmp_zcu106_defconfig           | 1 +
 4 files changed, 4 insertions(+)
 create mode 100644 board/zynqmp/zcu102/uboot-fragment.config
 create mode 100644 board/zynqmp/zcu106/uboot-fragment.config

diff --git a/board/zynqmp/zcu102/uboot-fragment.config b/board/zynqmp/zcu102/uboot-fragment.config
new file mode 100644
index 0000000000..52d6d9dff8
--- /dev/null
+++ b/board/zynqmp/zcu102/uboot-fragment.config
@@ -0,0 +1 @@
+CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu102-rev1.0"
diff --git a/board/zynqmp/zcu106/uboot-fragment.config b/board/zynqmp/zcu106/uboot-fragment.config
new file mode 100644
index 0000000000..cd571171ac
--- /dev/null
+++ b/board/zynqmp/zcu106/uboot-fragment.config
@@ -0,0 +1 @@
+CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu106-revA"
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 298ce2388c..88e84fe791 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -25,6 +25,7 @@ BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2022.01-165-g667001319cbe511ce6353195fb4910ae5cb041ce"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/zcu102/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 3e51cbfaab..81f625a73b 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -25,6 +25,7 @@ BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2022.01-165-g667001319cbe511ce6353195fb4910ae5cb041ce"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/zcu106/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
