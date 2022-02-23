Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52377C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 17:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD202408E6;
	Wed, 23 Feb 2022 17:40:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nzzCiRJoDBrv; Wed, 23 Feb 2022 17:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0D1340124;
	Wed, 23 Feb 2022 17:40:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE2201BF263
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 17:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB05B60F96
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 17:40:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZPxt85TRsYqc for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 17:40:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::61f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F09FE60B96
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 17:40:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzxX0gYE5LVanNkuY9NuX+n6HdASEaatm2NbrHqA788axUOvdF1crtrZgtB2UWfB5D37vKrAlp1PJ6uPhrb5vD75u+eSVnOzML7OoqcebGU7d+QwCe9rPH0XUblG9LBmLtIwGy4KkhfKQgWPGofRfARnlE2EVIkmFdWIp5yjZEP1SIDKm0KD6ObTTbJlcY6D3nmUJPOGWuqzNcQCltDxkFvUgf51TxVsNh3hhDmG1nJQMu9GMVNE2eD/Ma/JQlj1txxWDnr1r1j0prfI+xvF6HPCGoxLPQDr0nIXNzRyLayLgv2DL+tV52L4ORiHQjJqZOF7WIuLREdtWB01ulwXKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4O9noFY7/2QCF8IqVhNrgIf5FU1z8P7EqtX7lJXD1yI=;
 b=lsQBZ5rulP2PICrQpNO5mpb7/LiQG6VZFDIu6urn1BtpaS1e7/mnvY/G+PKhVej34u10ry4o4BU/aklSM7SzAjDdksTd8cFMXBkLZ0I5Ch6SED39CxS2MRuRGyOVnG7st4ZxeL+Z3ZjyjHvISNE3TXo6lZJwe2nUWF4bbKSYmg/WR0+npOQboq+Kda8bDKvF7hf+18i0fwQkbyLx9XOCoqV1Ir8V1e62hFJnaGaJixADpw2nn+4hXj7P9pZM8QErD/QTrT4qI+Enhh63CC33ygmC1yjeLWFun7pLtXm6K7E97ysOZrL8C7SYLhc3H6QaV9GPO8J8qGot492Ybf523w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4O9noFY7/2QCF8IqVhNrgIf5FU1z8P7EqtX7lJXD1yI=;
 b=VFYyOD03OuHgzZptT90JJRCb01O4EB0xVbSAZPKazCxIwRfO1SW4IMM9QHwJffQdLqUCk6iUutKsDSQKs8uNYlXIee4K5O7Leo+YyeR505srLgCxMz6rgXhcT4DBKOAfiH7qGwLNy2tQH44t8A16vIwEVmuHjunJJAIOQ4pLvgU=
Received: from SN7PR04CA0163.namprd04.prod.outlook.com (2603:10b6:806:125::18)
 by PH0PR02MB8599.namprd02.prod.outlook.com (2603:10b6:510:10c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 17:40:26 +0000
Received: from SN1NAM02FT0052.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:125:cafe::f0) by SN7PR04CA0163.outlook.office365.com
 (2603:10b6:806:125::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21 via Frontend
 Transport; Wed, 23 Feb 2022 17:40:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0052.mail.protection.outlook.com (10.97.5.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Wed, 23 Feb 2022 17:40:26 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 23 Feb 2022 09:40:25 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 23 Feb 2022 09:40:25 -0800
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com
Received: from [172.25.185.186] (port=57784 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1nMvcn-000DYC-DC; Wed, 23 Feb 2022 09:40:25 -0800
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Wed, 23 Feb 2022 10:39:38 -0700
Message-ID: <20220223173938.3307529-1-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 185ed03e-5243-4284-0740-08d9f6f39386
X-MS-TrafficTypeDiagnostic: PH0PR02MB8599:EE_
X-Microsoft-Antispam-PRVS: <PH0PR02MB859993078FA5A4DCA32CC717D73C9@PH0PR02MB8599.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MIsd7Grmn7Og4Dw3IG26p5c5QKPrqLhPlE4GLSFZzzPAyveug8J3tieHsby78CtbIAV9KhZUbUhfbmj2DjJo64SxgJ5HrO3UQazSdpS1mzcBaXpLL5wnykseQuo/h+d4t3CfFZS7FaIb9Hsr8ba8Oe+MB+gfNkDWnXlTN4RznIpUNBrT8A+0Z35w6q9dRu5rDPk7E55K1rekm6PtjeBzxPpu/Vm7PCx8njMNJRg7WUHYhKxRuSIpTNvL5TJ+QoJNZsE6Qdsq/yhoyIKmrGpHyc3nKOV1w33GbGxTe47/xzdR9eer6d9/oa3O9obp5fccPNQ8+/wPxajLdZ/zZ8PYGLjtLZ4bKvIjTYm8ZF/hb/Ynm/hK1Ei5Y5F12N6KHk2EHwb+prNDqPS+Piv3hveugA468cqE2BxJ4v7UGIqo14189YMpoHtAoeBY4tZ7Uz4eBxZgmBfb8jzTf1xBTPYDMm1ccdsmtVqut1Z/ihFpj8UpbKJVHUfxzz90eddGA0Z4sxyLld1haFbBICqnobyjx7uaBkpfII1OgZalCP/iy6mzOJF58GGze2yt7qr1xrMBekijHs68VIs5fsbXpBVxSGYu3sfucnJ9Pm0QFtiX/3iFlcaVn+B4TEl9N2+7JlIKPDZhY4diaGkg0ZtnmLO2SYztazd8N7yaWwM5DniyB5lOImeIZ/mCrN672GIN0JCCuRS+iofR33QieLVSwevj5A==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(47076005)(426003)(1076003)(508600001)(40460700003)(8936002)(7636003)(356005)(36756003)(186003)(7696005)(26005)(9786002)(336012)(107886003)(2616005)(44832011)(82310400004)(6916009)(316002)(2906002)(36860700001)(54906003)(4326008)(8676002)(5660300002)(70586007)(70206006)(6666004)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 17:40:26.1374 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 185ed03e-5243-4284-0740-08d9f6f39386
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0052.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8599
Subject: [Buildroot] [PATCH v2 1/1] configs/zynqmp_zcu10x: fix U-Boot dts
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
---
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
index 3e51cbfaab..836e050df4 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -25,6 +25,7 @@ BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2022.01-165-g667001319cbe511ce6353195fb4910ae5cb041ce"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/zcu102/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
