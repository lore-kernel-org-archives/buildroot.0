Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C665C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 07:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 318748336D;
	Fri, 13 May 2022 07:15:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ojk6MQ8T1bGO; Fri, 13 May 2022 07:15:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C4B882612;
	Fri, 13 May 2022 07:15:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B02371BF357
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D142405BF
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RAuDBSGaF4tU for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 07:15:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::607])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A246F40120
 for <buildroot@buildroot.org>; Fri, 13 May 2022 07:15:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhG2HDdARUlt4BLKntpHAkSpL8B6sJ6b0o3i6mYSqwfDaBEoixrFHRUTNCrEdx0dqdkEkqR8XInKoYGpoyLLI/XdLGsLFmQ63az8BI4C9ww2ybx1Qv27plNtbCxvltLX261/a2jSEE1jkN+NXEsDgEp5k//HT3iaNiIPGVv2szAhotfzf6Ut3emy0bnUMqv5EXcxdmscMlVwyanHQwz+IPpCmX/dc3QZLXxIng0lGJL0bxAAKhbLcGdcwxMsJBa7Q2YzoiDP7dUAY0iF/APrBgVf90NBu+3ACRphi8ZrZxzKJtREvCOjvq0XMxNHxKpHzXqXFsgytL9gF5W1ONTYjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdMm5JkyzMCXW10kZvfCPAlwhdeAqZ+9aIDsfKpgM0w=;
 b=T0NSFxXbApo46uL0pny+NfNzgzWj/yJRlYGup7bscxsoKGx5WmzfMzUnqk5aHyN3O+w/HSEgFS2dZeGK1livLjiK3sSDDonevmiT0xgPqdhjNztun7pIO9Aah1TCTERhu8GqPAmh/0t9sUQk7qGdGMSBwZ9MMOwJxALSr1UxMn4SxbVdDdx1lUFfsMLxTHZZiTi4EakKVXTvm19sX6T6TkpTDiCOBZBSwMC9i3y9RWiA58ehiTy0o+q+i+Uk96Ve7lRrKMf4XmsaMwSmPNACsESrWYhlAFOzhQ/Zo7fdIHJ9f8J+SSI1ahplHnk9AxDEXmR/TvcbaPZJRdQS+wXIKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdMm5JkyzMCXW10kZvfCPAlwhdeAqZ+9aIDsfKpgM0w=;
 b=i85Rk5xR9Ii1g4x3V9z+la+dh12DHS7qG5FhH9jdDtrNfbk7zmSCwZDfWAq9+gSdJpFdPmPYS6CiWvS16ChQKOfWTzwAlB33b1YD7vl8OgQTDunUrJfxtOWPEFYG4Ok1NAOREhXpo/NhK5OpUQkW/LeWNwE92m2FeQ8cnEZAoaQ=
Received: from DM6PR17CA0017.namprd17.prod.outlook.com (2603:10b6:5:1b3::30)
 by CY4PR02MB3288.namprd02.prod.outlook.com (2603:10b6:910:7d::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Fri, 13 May
 2022 07:15:18 +0000
Received: from DM3NAM02FT015.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::23) by DM6PR17CA0017.outlook.office365.com
 (2603:10b6:5:1b3::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Fri, 13 May 2022 07:15:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT015.mail.protection.outlook.com (10.13.5.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Fri, 13 May 2022 07:15:17 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 13 May 2022 00:15:17 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 13 May 2022 00:15:17 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk, neal.frager@amd.com
Received: from [172.25.185.186] (port=60776 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1npPVi-0005H2-Vv; Fri, 13 May 2022 00:14:51 -0700
To: <buildroot@buildroot.org>
Date: Fri, 13 May 2022 01:14:43 -0600
Message-ID: <20220513071444.2966858-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220513071444.2966858-1-neal.frager@amd.com>
References: <20220513071444.2966858-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c768ff29-0447-464d-adee-08da34b0557f
X-MS-TrafficTypeDiagnostic: CY4PR02MB3288:EE_
X-Microsoft-Antispam-PRVS: <CY4PR02MB32889EA2273FDE0D8E179B05F0CA9@CY4PR02MB3288.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T6LKKZbQpIMpA0w2vXhTE0n+0glICYJ94iVnRcJgbltABxCVf6AxskMAMYSexVCZgx9qa5B2Zyg4ASH+/5R/Eo0s5Ar3B5W/fAu7vpXWXpqSKukv4wPAjqcT56JhcBtMg7kRpuvGwCVaXFRPmxbvs7Hzxb51ABiXgHu/UZHb8F9ml/Znk0p4maEv+8Cnmkr/EvptfsNOw0uPH/0Eq3Dnjt5uKvwuEDKT867C3KcrhV/3YRUekCFb10hE8r1DwC7eqIYu77e6pg6wv2VCYqEJ+hR++Kd8+uyIGKt5CH5WzHoFiSCmyzWlK8d5XB29K9KDkUcJQNBFzMsfGYkF66Rt0MgvDuOEW0Zu4gWxZeSGXs0bV1S5OJxfMH3GBnOpQLA2ELlkwv4Yyti++/jS+GIlmChzRfnrA0prwaOspBha4JWi26IpnybZifaQgLLpKl8Kkxqss8A5Oo+hNJZvgotdC74NKp6mGEOXN11pGDqEkRFo4MdpBsr1ehQWIYGb7cF9vZqrjBVBOY46FmcTaAIXPsyhoMl2CaZlV/NL6KgozS8p6fssO4L3P6h27VWgxCx9Iud3sarnwivvShwFHE2scfA2Hzmt7vU7vR4JosSa3T/jQZgApoYditKly2kbFY+ZprBDAazbAHpWjgRi5MumKF9o9m56e6q16FBheujY3q3RKgvYmUBavRer4p/VgzqmB5gydClJQUKT3f58SqC8Kg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(47076005)(2616005)(1076003)(6666004)(2906002)(35950700001)(336012)(26005)(82310400005)(6916009)(86362001)(4326008)(4744005)(44832011)(9786002)(36756003)(5660300002)(70206006)(8676002)(70586007)(316002)(508600001)(7636003)(356005)(54906003)(40460700003)(8936002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 07:15:17.8416 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c768ff29-0447-464d-adee-08da34b0557f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT015.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3288
Subject: [Buildroot] [PATCH v1 2/3] board/zynqmp/kria/kv260/uboot.fragment:
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
