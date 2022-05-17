Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD71EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 07:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6768783E41;
	Tue, 17 May 2022 07:30:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gDYQ1VAr_z4v; Tue, 17 May 2022 07:30:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BC7F83E1E;
	Tue, 17 May 2022 07:30:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 704E71BF2F6
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 07:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F4BF83E15
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 07:30:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6E5IDfpVfiR2 for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 07:30:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::622])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFB1583E13
 for <buildroot@buildroot.org>; Tue, 17 May 2022 07:30:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9CZbMBSJC+gjAmTYC/LsxHSOgyeU66oOc7g1NVZ031oh3EpCOBgwmMubgSbHsoLOIVjJR826kVP6OV7sz0mtcfNOZiIes16NRb5guRrfI5rbqHAAYYGokTGK9gMm7Jbbzv6VC8uT1LK5s3JLvUVbcxvGELq2JjEIuyer8cfp6FvHipBNP3ZdaUbhJT2WHISURgDedrGkCuJY7HWFGAMZHJN8CtuQBvFMHbgwl1kAFhjnPxWRFLUQ6DQ7J0rss/3bpjkL4YwFYjRvCW0q/PlY0fv0YPpgW7Zzm0dQq6ziksrEY68KQHgkRQ9wHCTyQ9/CHDn3yqAEpqQi/EwA0qgMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQNYJamuAwL7PqZhatZJGpCYkaL59JPVq1u0Z3Ax9OU=;
 b=J3Ijihiolu5O3yDHv9Gt0kS9ZKQ+K/+aLOY1aAI6PmIk2Xl4EWNx9GYp3Zg2L/Z5+dvNRCeq9hHOn4Kbl7/eTJvSfXt9fsJgE+lBt7ajGeUBf8WZ5gKexmuzf1UpHVbVD4+7uwugjh+wgLtNKiX2fgIKBiFlJr7eh6IxNfv2mu+avN/uJJGZPrzM0gXt8zwpREfsZpet6RJJgwy99cqDTCjECDC4Q2I4lQLvV7CmdRss0flpEjTpB1ENWw3LxNTQMqyRDquKFu2opeA2bezQ4phKqC9KjVluC9pEua8gMSRmbguMWRMRgxaSd/harJpu0zQOC0qJgPfHyw7LONlkXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQNYJamuAwL7PqZhatZJGpCYkaL59JPVq1u0Z3Ax9OU=;
 b=PLASJ8mbeaODC6sz7uIQDknIBYAKnDhqtkClSAkTC10CwVbtdqt00wyCWTIacm+PJRt3hT+to/sRiixW2eU9rN9iSWqRSTHjWjrZMXgayvCJWR/fqHj7pOuhYpqdelzrdLhJPEYy6RDdXPqwUe25LG7elCg9wnASqEtUjiExS90=
Received: from BN0PR08CA0018.namprd08.prod.outlook.com (2603:10b6:408:142::29)
 by BN7PR02MB5012.namprd02.prod.outlook.com (2603:10b6:408:22::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 07:30:26 +0000
Received: from BN1NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::c2) by BN0PR08CA0018.outlook.office365.com
 (2603:10b6:408:142::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Tue, 17 May 2022 07:30:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT017.mail.protection.outlook.com (10.13.2.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Tue, 17 May 2022 07:30:26 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 17 May 2022 00:30:14 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 17 May 2022 00:30:14 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk, neal.frager@amd.com
Received: from [172.25.185.186] (port=52476 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nqreo-000EOf-6o; Tue, 17 May 2022 00:30:14 -0700
To: <buildroot@buildroot.org>
Date: Tue, 17 May 2022 01:29:50 -0600
Message-ID: <20220517072950.1322452-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517072950.1322452-1-neal.frager@amd.com>
References: <20220517072950.1322452-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 394beeba-d377-45b7-cc7a-08da37d71cb2
X-MS-TrafficTypeDiagnostic: BN7PR02MB5012:EE_
X-Microsoft-Antispam-PRVS: <BN7PR02MB50124E5FA2DC0421173E9864F0CE9@BN7PR02MB5012.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AVIEpRgqgEoWZPW0vNzucfrXI0OylBWgoHoNFFHDl+rYUT0c+7Ie9KQweTtL7TW5BhOOSTRKgUHWyya3WyY1aCTObU6bQMsWV2BE8r9SmYoZ6rLkwRlm+wHdk98Ny9Ksc99cW5Sp96gRzJthwPkrhxt5UMoN8wDlMMCEEuAYKsK1TXeNFLqdnXQJiW+N0fTob9jY3rA+757JZYg0ct/HHfe5cEcdTzOJjD8Py0o2YXRO/SIgG3sV2Rb67169D3o9u6PjxT83+JztUfsy8ujnqGda725fo7mZfND6h+52soWXvbI8FXfjPPBqSM48WctwRavpIat4AKpj9pN8YfxhGLqgkgPLV/5pw3F7D64B0TeppPYESjBpbY7bnNU+GqZ/52uoOpmsjg9aNa4ZbbRn1qoGg7ZxIcWiY/mZA4P9riR91LZC8WE146Y0HkRBnlJUlZFIF/ECdwNI+bM9kWrA6phDpjyH+GArkOgwwsTleaddQLw4rsBv7p4kfZKCPaDzL6eo+PDKODO6zZFU6Rkzgk97ZtOTGcrYLExX+tWkrjV/kiTgHxt67wU6nLGMoIQMvvqBfQzi2U9/vvUJfmUlOFwboKlig2EmGNM+8DOzUTGrLIcb5Z1xfdNC7KkWiD/PzdD2BkiwItaVYuL6wEfIuU5Ds53Czt0VOLvEQyccszXwh7PvYLWjOgIfDKZLMpKIuQkzCI1ShcDp0zSkfIgK/A==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(47076005)(5660300002)(336012)(9786002)(70586007)(86362001)(44832011)(4744005)(26005)(8676002)(82310400005)(70206006)(4326008)(7636003)(356005)(35950700001)(6916009)(54906003)(316002)(2616005)(6666004)(508600001)(40460700003)(36756003)(1076003)(8936002)(2906002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 07:30:26.3916 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 394beeba-d377-45b7-cc7a-08da37d71cb2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT017.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5012
Subject: [Buildroot] [PATCH v3 3/3] configs/zynqmp_kria_kv260_defconfig:
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
