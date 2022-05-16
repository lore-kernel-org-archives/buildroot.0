Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA3AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 15:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 712234184C;
	Mon, 16 May 2022 15:13:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-q4W_YUJvCE; Mon, 16 May 2022 15:13:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3190740939;
	Mon, 16 May 2022 15:13:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ECB7A1BF344
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 15:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB4DE61066
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 15:12:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IdsIiOCR_keM for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 15:12:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::628])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5594960709
 for <buildroot@buildroot.org>; Mon, 16 May 2022 15:12:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhUR4OMBc1N+nNgx7DJzBEEgHSZzetuEAbI/clE3VtdeJXHyyHjunjTirlBcELW4jnY+iUGy0GJqNBYXFZjpw3hqRJGM7NKbXCgUvkDPA9MuiKyONUNWXPt7cY2//oEXpYIEnwkd8WZjnqE38pPePmOY7aZ2yWSbx41aSRVqjU880HWQvfwwiKKuxL5DB1oeo1bCMd2OUTHLxAkVn+yJhN07PyuG8OQBAqRkuvFBV1BUqwhl7jloRcPqwXlkc6GLm1nRQyUvPjYvQwl1JbCm8xszWGjeQZ8F/RJNJcTwBXC4fT1rMzp40pDMOyIQwBSTNbYWQ1UDPNyD0ZkBnInhWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdMm5JkyzMCXW10kZvfCPAlwhdeAqZ+9aIDsfKpgM0w=;
 b=Pm62lg1Vz5hsHkimiEgiSXtGc/J14YU3oPIJ3QFm/1m0sTXi05eYdTtYBgXZopmyV0W/ByaMuuCO1eO9dTeqWHJ/86ZtcOL44p/ufD/05F+z4tNHmLjMzLRE77IH012CnV+Tho7MU74p0FCeaLT1wguU+sso+Qfu5FF1zT8knzGAVZn/YL5HHZh4MBrZTw53gqLKghNreSLj0chAteYhWKgJ8+wCPxubaTFbovcyEI5iujkJX/XfTQURdNtbF3rIzDWEb93+fcoz7KQKjlI1OeWK2lm+yko8Tp2ENMP2aLrj5KGRAVW6oqypOREHw1RhWsY4eX7Z2QmKR+W9hFF5iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdMm5JkyzMCXW10kZvfCPAlwhdeAqZ+9aIDsfKpgM0w=;
 b=KdGQ/vK4bya0mA1ageprmfN9qOCYsw0VCItvkKpUjk5cMrPtv8gatx5YscsYJ7KnSIOiJxDIto544+dzRDSlc9eonh9DFM1rlePoCqk1VhzwJ5hzwPRBiOZoU+1Huca1nKBlLSwIYBW/JtEV6aSp8Q96oLsIF9nx7OF0Tj1d2hc=
Received: from BN7PR02CA0022.namprd02.prod.outlook.com (2603:10b6:408:20::35)
 by DM6PR02MB4330.namprd02.prod.outlook.com (2603:10b6:5:2a::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Mon, 16 May
 2022 15:12:26 +0000
Received: from BN1NAM02FT014.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::9d) by BN7PR02CA0022.outlook.office365.com
 (2603:10b6:408:20::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Mon, 16 May 2022 15:12:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT014.mail.protection.outlook.com (10.13.2.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Mon, 16 May 2022 15:12:26 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 16 May 2022 08:12:15 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 16 May 2022 08:12:15 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk, neal.frager@amd.com
Received: from [172.25.185.186] (port=44046 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nqcON-0000p8-Bg; Mon, 16 May 2022 08:12:15 -0700
To: <buildroot@buildroot.org>
Date: Mon, 16 May 2022 09:10:51 -0600
Message-ID: <20220516151053.2363184-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220516151053.2363184-1-neal.frager@amd.com>
References: <20220516151053.2363184-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f09c23d6-8289-442a-184a-08da374e7c79
X-MS-TrafficTypeDiagnostic: DM6PR02MB4330:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB4330A7A4B4B2C489F70ED740F0CF9@DM6PR02MB4330.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9hhArXYrt+rzQ/mOjPd8F33ecgeh1UmXpdJn4klxVXw9aDvD49UizPUZdtPu6ikHE3aBRoJippzq54YMukO66tk8cbGYlmv2eyCl6Lyc9+W0MPe6YUdDy+PCKad7zsaTB9VTl2ulsXmgvHi5dUV5YkorP9tPwOctAw9CqeHeGIYYRCbEQ9WjP6dEkFrAbAcy5z0CIU2D9K3t6/OUXWS7dHdzKXWU8ca08njtWWJ4QjOOiwtD8+43pC/wNukWlPAuf9088bjrc+GT8c/sDmYzAeua5B7bCU8XIYDSdUWBdp/7l9Z2Hhk1sFsfxrWswg9W9HUeeDz89+yTJrZdBU86jpCYKQbBCRdFo4rQvZPeIoHD8YqCa5JLU5WlZNVM8/Lk8yXFVZ0xqMyG2c12iZXzD+VwvUP6Wsk4dkX0Rf/S35YnB4veYB6xpANspMiaUqPNu+ZIMiNrxMehthiBrYFA5dEEf6nUc02Rbf/zAU1JHoPUImnc89OvLxLg2hOkLSKQmsxsWI1xD5qMhIHuLP74modi7YJnJmcbxUjzNbjLjqB5tXsAo6qsRyBz8WZkLFnDx6jojsf5MY4D/fQ6I+1VSjAQ4AcUbvIIeccJ36o6j8TFs6oVY0xzxujTYVhOAs7i2dZMEyXbBrTDTvVWA9CGJ4nttKIjsasxNuAbkD7Q5mfp71bIvqX41s4YLafoMlKXVwKPvNUHVU4T1p2m3IYnaA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(7636003)(26005)(356005)(35950700001)(44832011)(508600001)(40460700003)(54906003)(6916009)(4744005)(86362001)(9786002)(82310400005)(36756003)(6666004)(2906002)(70206006)(316002)(5660300002)(47076005)(336012)(2616005)(8936002)(70586007)(8676002)(1076003)(4326008)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 15:12:26.0384 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f09c23d6-8289-442a-184a-08da374e7c79
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT014.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4330
Subject: [Buildroot] [PATCH v2 2/4] board/zynqmp/kria/kv260/uboot.fragment:
 add uboot build options
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
 board/zynqmp/kria/kv260/uboot.fragment | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/board/zynqmp/kria/kv260/uboot.fragment b/board/zynqmp/kria/kv260/uboot.fragment
index e1aca68692..a156748168 100644
--- a/board/zynqmp/kria/kv260/uboot.fragment
+++ b/board/zynqmp/kria/kv260/uboot.fragment
@@ -1 +1,14 @@
 CONFIG_DEFAULT_DEVICE_TREE="zynqmp-smk-k26-revA"
+CONFIG_SYS_SPI_U_BOOT_OFFS=0xF80000
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
