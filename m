Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35A4C433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 09:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 532A48141F;
	Thu,  5 May 2022 09:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ei3IRxZi42BS; Thu,  5 May 2022 09:15:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F89081410;
	Thu,  5 May 2022 09:15:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DEDD61BF3D5
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 09:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAB9F4195A
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 09:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CyYayWxhUtJR for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 09:15:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA5D54196E
 for <buildroot@buildroot.org>; Thu,  5 May 2022 09:15:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwrQVwBvtkBtD5pd6+hwwJ4ispRNbqoHt1f6WcFOfsVQNK/WWVGRK1b6aZ98qobD0b4lNhpGAhBwIGuhxSdRIGSYH4JKma/tKNK0qndkSF1eSt0ozCvhmZekgTrwQKQnhz3nf8CX9+/jxZFeuBMfDlbFvcHwaSi1kr3ijiQ3vciyXYM7wGgtb7eQmjKl6k6d+NwKql4+gQGK9W5+g81UOY3tnvNeNrBwTIuXbrJ1nMsTllrGfxi3zqV99viteYlVnv4rbSoQ8IHOvhht0QTK1JvPFp3+238TGNHRBonZQUXjvN4rmsddSZUpMp6MW/g+9pbcdxftvOPFnkB49m8mEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrP1fqMb3pAw8wgRzQUbpPhvvZM1Z02wEYFZZudyHok=;
 b=csZkXRFYr/R5lbrK7pWsDvXnPkHhqkAHM35id0G31PZFvjSNRYQwcRrJ3TbtYQJvMENrW4wXCy2RhmqfSkG2/vQWq2sxwY0Im4KFjJv5JwYkBsnyfzDYoUI/ilYnJICfR/Z0rMrBpMj+ArEbYHLjvDpldCLE82d01vcS911yCNiSBfAp+eXo/vtrbLX5oM4TacTSNu6E1lZn/KQV6uL3p39lSJM5PGOBugUUzqsPcMiyDbCYwV5ei2BEAG5/ZxDlg0nf6xjPl6wJAGUN6eOFmahUM0NxgFn7s/x3LHjjfYQROf7R4AUXMxH0LD9yLOQhobEYNYk+dLziceUNUe3Q5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrP1fqMb3pAw8wgRzQUbpPhvvZM1Z02wEYFZZudyHok=;
 b=o/oJBm1O6kTyzx2IWw6dsryTwC5vOArC00DllqYuGHos5aQdygOGhoe9TSYCpVhCUhtHr+GhCOQNDUgCTsVxhcXi+QqodhUrOEltmNFx9P+X1nk40di7RM29sxOkxKTDN2aHOdNDjXD/m7ABIep0snpO2cxU0vEgpSFpUlis0iA=
Received: from BN0PR04CA0023.namprd04.prod.outlook.com (2603:10b6:408:ee::28)
 by MWHPR02MB2623.namprd02.prod.outlook.com (2603:10b6:300:44::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 09:15:35 +0000
Received: from BN1NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:ee:cafe::ae) by BN0PR04CA0023.outlook.office365.com
 (2603:10b6:408:ee::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Thu, 5 May 2022 09:15:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT049.mail.protection.outlook.com (10.13.2.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 09:15:34 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 5 May 2022 02:15:29 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 5 May 2022 02:15:29 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, neal.frager@amd.com
Received: from [172.25.185.186] (port=53514 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nmXa5-000D06-Hg; Thu, 05 May 2022 02:15:29 -0700
To: <buildroot@buildroot.org>
Date: Thu, 5 May 2022 03:15:22 -0600
Message-ID: <20220505091522.646109-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505091522.646109-1-neal.frager@amd.com>
References: <20220505091522.646109-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cb8e025-3110-4fbb-240d-08da2e77cf97
X-MS-TrafficTypeDiagnostic: MWHPR02MB2623:EE_
X-Microsoft-Antispam-PRVS: <MWHPR02MB26234212DC9BD2C91B542A21F0C29@MWHPR02MB2623.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mDOQawVw3dPH6Tr+AqP5VAjiiDxp+7mRrKev2CNhewyl5cUdrRkStVCUOov/gsZG5NPbmoo3rURKarTSEIbBOoCKjSvB8bpZT42RjDeTS9mWfJlhaGsEGHb6h6/GOY1QU91/hrirdBFc+i9gT2HMjrgYwI+lck7fafF9T33M5zYRJukwDGpaIxBxFMXxQNcUEDjhRab7NQ3GrAs1T/K89KzV8RSxBiV7PYhSw1GbpNnQVsN7GD77+4WmjKR+gGEsaP7EYSUWxabO3grZ08YV+k0iqQIvUDP9U59NN05KW/3eeBygRPjk1micSk4RaSoc3tmFJogZxMTRZoMLOjSEt6HsOCY93/GUherKst8NKTeeMkT82+v1oEfq3WAxl81UXHqD66/+tdJ1kk262qqWHP6o9Dppcg8Rr3YGPKZx0bXIhZCPunvJJ2DskMComRWKOXjOruTd9Xzc10oxWtuIUyGqmg+lRVoRvKYcpp2gT+Ayq2GorroJ4FQMZLzJJ+hFkv8GRGnZyCYsFdUxn1vIg9+HcXRCELxdMfTM3p0GIGDNecE0xuIRzzoBfc+EiLP17um5daGmPmllHkN5Mn0+/ZrrtyCZzFi4ZvV025n4Nj2GcNKiipQd1MGU26MMBKusSxmwNsDO+qaAjBoA4uFIuU054Wo+N7vBN1V3o7LCMny/LFSmqgwTGiqCnAa8Ayf+qC6GCLQj2CBGMpRVla5B1KLB6AbRACTU/7Vy3V0v70OqYbr+JXqCTEvmRqXYDSCSFUtzJ5COfFAlOe6gLasnXhXlijiEsko9bCLihX6476xgk/8INh40Fq4fCC3M64IVqzg2qYNzy1DNhmYh5YaiwA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(2906002)(6916009)(5660300002)(83380400001)(54906003)(336012)(47076005)(35950700001)(8936002)(1076003)(36756003)(2616005)(44832011)(9786002)(316002)(70206006)(86362001)(40460700003)(70586007)(26005)(82310400005)(7636003)(6666004)(8676002)(4326008)(508600001)(356005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 09:15:34.3715 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb8e025-3110-4fbb-240d-08da2e77cf97
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2623
Subject: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig: bump
 pmufw to 2022.1
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

This patch bumps configs/zynqmp_zcu106_defconfig pmufw to 2022.1.
The pm_cfg_obj.c has not changed between 2021.2 and 2022.1.
The pmufw_v2022.1.bin has been tested on a zcu106 board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu106_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 96b15eea81..27967fc0bd 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -28,7 +28,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/v2021.2/bin/pmufw-v2021.2.bin"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/v2022.1/bin/pmufw-v2022.1.bin"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
