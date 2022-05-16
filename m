Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B29C433EF
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 15:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0EEA6109D;
	Mon, 16 May 2022 15:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q4eo8AHW38QM; Mon, 16 May 2022 15:12:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 074E061066;
	Mon, 16 May 2022 15:12:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03DD21BF344
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 15:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2B5F61066
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 15:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iGi7ZAZFc6Bf for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 15:12:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 556C360709
 for <buildroot@buildroot.org>; Mon, 16 May 2022 15:12:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/s21d/COMdwLIPNegjJeAMjNcub7DxvC6fHzrIgrU26TjAsz54u3+zjIqLHZCyTMON0ONrhUuIXzr2DzTZOfAlLvNWFAybOE69jqhBkvpl8/xsG3oaWlAAGpSs1C3l3/qNYrtqOCE0TNZ/St0EQqjem3/3xKRNcq7D+IUodGCxNx0nucD2257cqprJoIM6HNbuGo2uW2KrxvV28FCt+eE4EXN0wO7QVZQuWum5DT7bHJBrUCoWLNKDC+c30uye8WXrQe8u0QptWqi/ogdr556ZCRJUbjrCdXrbn5Rm5nbhuWn5U9ViEE0ICxeveqnwN+GMS96qRktTpol/H7KyEfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQNYJamuAwL7PqZhatZJGpCYkaL59JPVq1u0Z3Ax9OU=;
 b=UL9hpJaf5BTxNkSI+Ulaa+4DpUM8EqhDdXdhLhqJUr0ofmXuEtz9pIvj3mxAuJX3EjDtQ1dxJjAmvVM0gT4Z9csafucn/LdLA9/Yxw20DzqWLOiH5wEM9lNlRvcTEfeaQBrzbhWlqNMByNDfKAyFm86FZnbcOPR60V4RZMLxYS2+Dhu1QA2qMpIilFqvdlutlK9CmFb1Xkrwv2uxmKl983A6w+gl0xX0+8MMbUxK4Wab2s/AMhGH8pr9ZfIaFf5ObCMNaNunSfLaDzPEQuhKhjIPK12Wdg+1URZr2cmD1ks7wpEpiRFkNKOYVgALe2WsAihG6cljDgw1/xzRAF9auQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQNYJamuAwL7PqZhatZJGpCYkaL59JPVq1u0Z3Ax9OU=;
 b=JmCWKAi01DQjZzh9f/Y4gXxAFbik1FnADesGb4V8OgUSfHCMnuOHvitqY5FYNkAvWSRiOx9csCyeVh5RUv+DWd6l3Jbm2+CbtqJOziBnRUY1aqaLMjyJU5s8YIxg1TwN/yIkXz1+cuyuVU9s04z3SlSQtCswsNjvaP0tnsMECLI=
Received: from DM6PR10CA0025.namprd10.prod.outlook.com (2603:10b6:5:60::38) by
 DM6PR02MB5500.namprd02.prod.outlook.com (2603:10b6:5:77::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.18; Mon, 16 May 2022 15:12:21 +0000
Received: from DM3NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::8d) by DM6PR10CA0025.outlook.office365.com
 (2603:10b6:5:60::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18 via Frontend
 Transport; Mon, 16 May 2022 15:12:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT016.mail.protection.outlook.com (10.13.4.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Mon, 16 May 2022 15:12:21 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 16 May 2022 08:12:18 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 16 May 2022 08:12:18 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk, neal.frager@amd.com
Received: from [172.25.185.186] (port=44046 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nqcOP-0000p8-Vn; Mon, 16 May 2022 08:12:18 -0700
To: <buildroot@buildroot.org>
Date: Mon, 16 May 2022 09:10:52 -0600
Message-ID: <20220516151053.2363184-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220516151053.2363184-1-neal.frager@amd.com>
References: <20220516151053.2363184-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98e90425-e9b5-4c1c-c8f0-08da374e79d0
X-MS-TrafficTypeDiagnostic: DM6PR02MB5500:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB5500ABB004033F84914C7773F0CF9@DM6PR02MB5500.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2PRDyAGro4Zuh95E5lhuEWi9mZ7TrMDd5Em278NV7YV44TTEjdeY3y4FwYvIcPonwIZbOiXPk8pHopJhyWbQJ304NBpW0qDbXIT1juEDWWfczo2t+MiY4CyZDSwYImGBe6AvkwVLgFNH0nPhRLcM8u3Oau7iE6ymRnSSS2ALFy9cP/+PfC1UXRlEUhDnmWEhBUzv65RReqRaRzFMrOgdH2gCMMzzRv8fj6OvLEILP1uB9CCLMd6NKFvbcwBbUXmvMHYZ4KjEjJyY7Ac30xqXmnzzy7wl4zgWSMzEKM81ZogqNK/AePq5dEW/EnSKBLgGngglMykqaLVLkdCkoeWcDUTn8T/wJTJgWrD1frh808BKQE8q0wKc+gUIT9g4PnUkzmgOO0cRIP5EJLw0fo5JXBX55TkfX5N9InXHcWRQOHDGaM7apQGClUAVK9gfljOKDqniy4tvvKY5yoBntNFL6dJFrOix/bVfBUn1zXpam9BqU1pDV1ZIY+ED5z1jFto20O0MulI9AValSE9oJjfU86GnnATwICwcxtBguU86nsZK+0+OlHg61ZGeoZnxElkBtYJE0XgADgeocmmU7tcEL2b2rwpkgcTSZVo8QUVzfTasYzYLEK2byr+OQhSkx8tfj5UDl+nkXMZLGXyqgENzZF6NXhFALwav3NTqo/XFZBSssOxiDeK1fJczcBciEYuXea0xOiOPG7EDhL38VEZPqw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(7636003)(6666004)(2906002)(47076005)(356005)(336012)(82310400005)(316002)(6916009)(54906003)(1076003)(40460700003)(70206006)(4326008)(8676002)(70586007)(44832011)(9786002)(4744005)(5660300002)(508600001)(8936002)(26005)(35950700001)(36756003)(86362001)(2616005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 15:12:21.5955 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e90425-e9b5-4c1c-c8f0-08da374e79d0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5500
Subject: [Buildroot] [PATCH v2 3/4] configs/zynqmp_kria_kv260_defconfig:
 build atf with uart1 console
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

This patch fixes an ATF issue by building the ATF for uart1 instead
of uart0 for the Kria KV260 Starter Kit.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_kria_kv260_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index d4a72a0d19..cc01fb9155 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -16,6 +16,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.1)/xlnx_rebase_v2.6_2022.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
