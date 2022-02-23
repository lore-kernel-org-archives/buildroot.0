Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7E2C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 18:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBD1882410;
	Wed, 23 Feb 2022 18:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id btK9hDpi4qfm; Wed, 23 Feb 2022 18:04:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1064781B10;
	Wed, 23 Feb 2022 18:04:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 534D21BF263
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 18:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FD4681B0A
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 18:04:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 33dXa-0TGR6h for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 18:04:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::603])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5C3B81B60
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 18:04:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLZkHwGGDvwoTo7B6uClBHN+kDlzvyOedCM4X8J+bS4pNEwa0zOFU+rXcjm4Nhpq4BPe42lKNKTd11ISfDaSxBjVf0eQyGVIns6B5QS+aJjKoL2XrFcO2pnikhs4hCrqSMPMdwgqQNSTQFOad8uJshBnSRM/EHD0DUhiVJPHZtezTnygVz32MlXqmZnAP8RnqJE/wjcsb8iqX9r+/iruz9ZsUXEk3pJGmSj5e0/yUA1oqvlb3LoNfOrKNaeYp5V7eArrwV6MVMaD6LMXRa8RMR6yD4wLoPcIFsBn0mkOSmD2TqZUY7ysVfivK6+DJvse3ZPiB+Djk5NLQp168k7lFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZBE5ZYFNIYeBX/Rum1xc2xJTCuPm4qpvYswa1yfSRE=;
 b=PZfb45KfU1fDxfhlvntwKcUK6kAcCarYXUUPcZqsLKeYhotzDqc/F79m5h1IqQEflm9FjAhkhFE3609jns/VUPv+iTphpun1MPpSxuWUKACQlXrSOuOtoUyezHUqhM9TDooyq7470OkCdsRoU0PORNGk04iD+sN+B7tR0wSnWspIVQsGBGLGVyfPtB5iQw4d9JY1/cnA/FwiPyz94t0JdU0Q2wP35lfIYIkMgrne4Y6eUt/CzS1ES//0AXddER1Fs/6U+ECmjmHkKK3kiUg3QWzO3h2OCwrWK6Albi0Fw+7RRG56CgiZOSIN3hy5/1Vqo1niPVeMeC6i6y+YhxxEVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ZBE5ZYFNIYeBX/Rum1xc2xJTCuPm4qpvYswa1yfSRE=;
 b=NeToWOrEEOku8XIw9REt0jYZOtpR6psAoQ4mx655NscLWoOxljTilv9IAuMEUoxzF8NCPUXvLDcKABR2IIu3mAFqqzgoQXUsH9SJxNxHFE1GTZRNhGCX/GYE9onNRxDqZyecxORPTtguLxWLKBls2X1wX/AKdujJHeIt4Uf+00g=
Received: from BN9PR03CA0795.namprd03.prod.outlook.com (2603:10b6:408:13f::20)
 by PH0PR02MB8843.namprd02.prod.outlook.com (2603:10b6:510:f6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Wed, 23 Feb
 2022 18:04:02 +0000
Received: from BN1NAM02FT050.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::e7) by BN9PR03CA0795.outlook.office365.com
 (2603:10b6:408:13f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22 via Frontend
 Transport; Wed, 23 Feb 2022 18:04:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT050.mail.protection.outlook.com (10.13.2.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Wed, 23 Feb 2022 18:04:01 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 23 Feb 2022 10:03:47 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 23 Feb 2022 10:03:47 -0800
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com
Received: from [172.25.185.186] (port=58090 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1nMvzP-000Dsy-12; Wed, 23 Feb 2022 10:03:47 -0800
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Wed, 23 Feb 2022 11:03:36 -0700
Message-ID: <20220223180336.3372352-1-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b9ee48e-a5b0-4248-861a-08d9f6f6df4c
X-MS-TrafficTypeDiagnostic: PH0PR02MB8843:EE_
X-Microsoft-Antispam-PRVS: <PH0PR02MB88438D779B8377A8D4B6185CD73C9@PH0PR02MB8843.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uIlm7+9IUCFSCLhttJAdpHSFhna5RYg+h5L2XOkUnQ9mjytXYX5pJZPeY9WdLMcTErYzyRVMlqcCkQVPPeYUd3dZp9kotoO5KnsVDXFKMoQuR/AHCb2eIUz7YA4wgiF9KzINcVxEc4CyCmOPD3Wx3WECTtud1tCBCp6UB0xjIXvetNJGjIHANT6lPkT/AKkesXMrHWg+TJJeGdd7Slses0hAiJ/rRVjVPoQjGb62D4v7FmbGDS4Arcm7EqDPlPPaLqkENgxBjIpgMnRl/Y/PF46PNvbNwYQyDCysjl782bCcPk7HQDILOaVmAek68lJfUYg/BZ+8GGQSWib1vUkbB4JmBFJUWuxPvq91xcIjWA37IrpTSTOukoIN5yTngk7Iup1W/xR5KWoWfh17dRNLuExrW1GJQzbjOqTRT8SZJgoNDnPMgbJXssKJv8Bb6U/dwCjwudYoMOcW8oYXpaAfTxTxC04esYULkSnGEs0lnpNB5UMFCSB6lVfCQJAy3aQ9cLXRfaEF8cW7Dbo7JBd/tJCndt3+A5fhyOcWPH8Lxp34Vr779yLpgai1dI0QJd7FkuuGay3I+wG8i2qezynwHDsEOQhbZG6qx5pdGapq+vGta0HxGUb8TzFhL4jFiKKcbveQWfrMj7cnZHUG0VBV10ZB3BAs3Hus0pm4DdfNqglZATh5xIbS0R0TlrnfaTMTxa1g4pFltpi1FVoD6IasDQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(2906002)(8936002)(40460700003)(36860700001)(70586007)(4326008)(70206006)(8676002)(36756003)(356005)(7636003)(5660300002)(508600001)(47076005)(54906003)(316002)(9786002)(44832011)(186003)(107886003)(6916009)(2616005)(336012)(1076003)(426003)(7696005)(82310400004)(6666004)(26005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 18:04:01.6951 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9ee48e-a5b0-4248-861a-08d9f6f6df4c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT050.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8843
Subject: [Buildroot] [PATCH v4 1/1] configs/zynqmp_zcu10x: fix U-Boot dts
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

This patch:
  - fixes U-Boot issue when DEVICE_TREE environment variable is not defined

Signed-off-by: Neal Frager <neal.frager@xilinx.com>
Reviewed-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Peter Korsgaard <peter@korsgaard.com>

---
V1->V2:
  - removed version bumps from patch
  - removed unnecessary blank lines from uboot-fragment.config files
V2->V3:
  - fixed typo in zynqmp_zcu106_defconfig
V3->V4:
  - re-added patch notes
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
