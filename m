Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD31C32772
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 11:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D37A041028;
	Wed, 17 Aug 2022 11:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D37A041028
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w7nYtrh0P8XF; Wed, 17 Aug 2022 11:53:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E27624101B;
	Wed, 17 Aug 2022 11:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E27624101B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B06481BF5A0
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 11:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B3DA83417
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 11:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B3DA83417
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oB9LB7TUc-2j for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 11:52:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D40A833FB
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D40A833FB
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 11:52:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpscJ1PP+zM/e6Bqd3olGmlqGdFKCV++/PBZy3X5zZkrDkFfF2bsjuS4DsAnN+Fo4phBQf7nbDPISDcGoP9HyW6/SmyY3v//1tvoIQg4QZBKcPyIGncOI/WixPX88oO/azdL4g5vhtC41U3+cobqnQsbeEDKlkxCDKj//D751EESsAkPJJwXw1/vGP5twsk6DeHthOZQmMbFfWknWcpNP621YFHeiTG4pnRZmu6NElL5o/I3CvPF/ob2phDZPqqHdpsl/cUFgCB9VteVJaaEggt9gOPSt9ngTgosISm2NyPS+P3Onq0+YRJirUDdwrTTVfmRTsIIZB4na36Ae4xq1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEWa4l1o5ZVB4VVY6cvJESj5EV0QgsRMahSq7gG7krQ=;
 b=G0FNjQ2izH8WmuJ0IHs/1HjG57l1EiQxmX43yuPVkJtNJbAbE4z7zzdSKJ0+sriLx2gbTBn5rkkB6t9Uq2zhKIpg2FeAkTBZFZC9El5lbvSd6Hnyhhk/4UIfd3c4YIsXk9sLfuKaemjx/eeWurArKI3l4d5zWNe9bi+VD0Ke9yP9psYTyC9gMqSsHrFfhUc6TcSmQWIqQkU+PZkuK0ahZmpKsKM136xhonof5+BtfEOuGW86nwunBppA9HnBrkfZjx2rUqNn3mvHW0XJroC+Nr4K6W/eYWLmGE6OuM5X41Ncih1v+ndZ/ZELdR0mAxiLzR8hjnc/Z5kpSqnVZ1d5Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
Received: from DS7PR05CA0044.namprd05.prod.outlook.com (2603:10b6:8:2f::10) by
 CH0PR02MB8041.namprd02.prod.outlook.com (2603:10b6:610:106::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Wed, 17 Aug
 2022 11:52:54 +0000
Received: from DM3NAM02FT040.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::d3) by DS7PR05CA0044.outlook.office365.com
 (2603:10b6:8:2f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.12 via Frontend
 Transport; Wed, 17 Aug 2022 11:52:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT040.mail.protection.outlook.com (10.13.5.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Wed, 17 Aug 2022 11:52:53 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 17 Aug 2022 04:52:52 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 17 Aug 2022 04:52:52 -0700
Envelope-to: buildroot@buildroot.org, luca.ceresoli@bootlin.com,
 peter@korsgaard.com, wesley@sonifex.co.uk
Received: from [172.25.176.116] (port=39866 helo=xcoapps68.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1oOHbQ-0006Tr-Rs; Wed, 17 Aug 2022 04:52:52 -0700
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Wed, 17 Aug 2022 05:52:49 -0600
Message-ID: <20220817115249.9894-1-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45563cc2-9e7d-452c-430c-08da804704ca
X-MS-TrafficTypeDiagnostic: CH0PR02MB8041:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uknSo8mAwPyqpYNUFbKEDTiJAfqFZgX04p8N0KtJzbFo4FA9MlJRSimkl3WDH/jCIMgoLt7Jcfs+P55qX6e+tNYK3Wvbut3iVWZJCgwMWRtm2/Qq72jYqakpknSHv/mKDUH/TbbVDd2Fou6/Itu2MwdJX+R/hnVzwFxcG29i84mW3+qAcMEJVdNWcQmS9M9g8QcVxpbR0dH2AuOV7TP74ZJuIfv3dIfzMMOgTiH6laDG2tBuxAZqTdFzMq/LYAjqAXYfh2peibqJoPTdDltQdKHo6HKC9E8Rq+7pCW2WqPS9cQUa1OWNxtUasow+lD+esHvAn/Qm12VIiuUxr/yjGx3v6YhGYmhLMcewIMXi5buOL4YB7uNd9u1BYvV+vkCkspmEGogUSO+PoaDdeNzATGX36w3uAK6zBMAZeQjr+EBZgtVB589XUMYpMyTcqej8t0uzRhLUqYzTAcQnmK18q4jR8OK0g7UJABE7FfDvZ+Dz0j9S6BtF9XJ3O1kkkTedrcJFXwBszkqEgBHfZp/VMUJDKXwQ+qoUImYu3ctUnvz6inwbMZK7MqHU5ACzlpi9WvFQQRiLTAO3KEUEOrrjfQ1UIWqedV3cfq3hd8MXNzzdYo7l8RlLsmtmdAC836GZhGZWdr7FycRxpXXClKR1MdXkHJHLj8+HsYjxhUDcjHdlZ3ra1VqoQufeEOO+ifjsMSo4gsEFl+esASDqvfC7peJvYlxHSlOTEupmKmcd7iwAXrApuhElPFt7DRQ8xn9N2LxaC1KSqDyWfGFyeBBNFiOmFpTGrk9u8hi9bDrr1a+sBjgFiIhkJC4lgEvP2/58TSGFGAWue6kH51JdjyoyBpszvJQrsCr69IVnEWDGJfe4MU4ea9sTwuXimKYrR0qeWpKRHanKx9Es4W1AqZ7jXQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(396003)(376002)(346002)(36840700001)(46966006)(40470700004)(7696005)(26005)(2616005)(1076003)(186003)(36860700001)(82740400003)(82310400005)(83380400001)(336012)(47076005)(426003)(7636003)(356005)(40480700001)(40460700003)(5660300002)(36756003)(44832011)(478600001)(966005)(70586007)(70206006)(9786002)(8936002)(8676002)(4326008)(2906002)(107886003)(41300700001)(54906003)(6666004)(6916009)(316002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 11:52:53.6650 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45563cc2-9e7d-452c-430c-08da804704ca
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT040.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8041
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEWa4l1o5ZVB4VVY6cvJESj5EV0QgsRMahSq7gG7krQ=;
 b=rN+8AUOWikNh62F1XU7/i10uzMc+73qtJqDFKVl9HuIPaFudibDb0KmOkTXknBgHirxejylAvnicLCYU5ms03AdSvKJBVqaum6gLJCPmjiyKTyob9BjzNBU1h18c9Q4UaSZWq3RXbb3fN3AmJGiJ15sUgUlcNfBhVyL92kaZj80=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
 header.i=@xilinx.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-xilinx-onmicrosoft-com header.b=rN+8AUOW
Subject: [Buildroot] [PATCH v1 1/1] configs/zynqmp_xxx_defconfig: fix pmufw
 with version built by petalinux compiler
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
Cc: Neal Frager <neal.frager@xilinx.com>, luca.ceresoli@bootlin.com,
 wesley@sonifex.co.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch fixes a problem with the pmufw built by the
zynqmp-pmufw-builder where soft resets crash.  Details of the issue
can be found here:

https://lore.kernel.org/buildroot/87ilqccu3k.fsf@dell.be.48ers.dk/

Instead of using a pmufw binary built by the zynqmp-pmufw-builder, this patch
uses a pmufw binary built by petalinux 2022.1 to solve the issue.

This patch has been tested on the zcu102, zcu106 and kria kv260 boards.

Signed-off-by: Neal Frager <neal.frager@xilinx.com>
---
 configs/zynqmp_kria_kv260_defconfig | 2 +-
 configs/zynqmp_zcu102_defconfig     | 2 +-
 configs/zynqmp_zcu106_defconfig     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 4700e651dc..3f1a0682af 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -30,7 +30,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/v2022.1/bin/pmufw-v2022.1.bin"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/nealfrager/zynqmp_pmufw/raw/v2022.1/pmufw_k26_v2022.1.bin"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 217fa0814b..b77680dfd3 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -29,7 +29,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/v2022.1/bin/pmufw-v2022.1.bin"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/nealfrager/zynqmp_pmufw/raw/v2022.1/pmufw_v2022.1.bin"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 3d98dffe01..694eb3c816 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -29,7 +29,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/v2022.1/bin/pmufw-v2022.1.bin"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/nealfrager/zynqmp_pmufw/raw/v2022.1/pmufw_v2022.1.bin"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
