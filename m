Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C64EC52D6F
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 05:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8601B402DD;
	Wed, 21 Aug 2024 05:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iCk4dBrxAh2U; Wed, 21 Aug 2024 05:52:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4190F40302
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4190F40302;
	Wed, 21 Aug 2024 05:52:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A47691BF389
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 05:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B3BC81170
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 05:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAB5UAyRQngY for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 05:52:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2406:e500:4420:2::710;
 helo=chn02-sh0-obe.outbound.protection.partner.outlook.cn;
 envelope-from=ende.tan@starfivetech.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3BC3281134
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BC3281134
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on20710.outbound.protection.partner.outlook.cn
 [IPv6:2406:e500:4420:2::710])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BC3281134
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 05:52:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpMMf0FT3qpFmzmjh/KHfL1xHHjC4FgQK46W72rjfyzIdU7eTHJRh6WZhj0PI26fj5AxkQmc9jp4ZgEso9LlsMU0S2ikCndwKV8n69E7M3F/oYv73/0xbW0vJ8cqmLfoVhGMidbHoAvj9yxthzgx3RKjvxFjjX/pzdho1lqwp0Aa3FWRUS7Df5UBARyaNMWyz0DJ8nbCoM3f2L7a/+LD2cmILUJbYj4lw4WmKKt1TOf+zcx6q8P/Q05fRtisZyiIFSGLzYdb/XONKTOShe3+fHwTWQiNZhyFgTaWT1nISEAbgjUsG5aVEoYzIB928CoFrQPHD6Bi0S78byLvryj1MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2byNRxbhduE428OqFs86TRzCOpQ+fuc+mw4PxRUiuYc=;
 b=F1d/bo29jdH47zTh9+KkUjXWHomKRfI04BvuK0eyDNzu1P7lEZVZ71SKS6IklKjQ+fMLwqnrtCZebkQQFkr/qtIHEzNbe6PDM2kf9IekKjrIjfDsPNLTu4G1LtVycHtDJQaZ7QKmCfXfrhJvGQzsh+z+yia+I3ttQ66i5XDdu5t7MXviUVP9+P5iU+XD5m5I3GRdhGpZOLv9bavtWpv2jB2MuWDxDtuG7KsIKYTZPT8fMs4PcczDyfyK82Zcz7ZDzm6J3NN1OcpvwNQ+GpUdXVGtuqKkLU8KErj+8hCSxcnd8HXxjlpSBbgomZzwTVA6ecgP4yUVrzN+RotEFCqPHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::7) by NTZPR01MB1132.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 05:51:55 +0000
Received: from NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 ([fe80::e1c4:5bb3:adc:97f5]) by NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 ([fe80::e1c4:5bb3:adc:97f5%5]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 05:51:55 +0000
From: ende.tan@starfivetech.com
To: buildroot@buildroot.org
Date: Wed, 21 Aug 2024 13:51:46 +0800
Message-Id: <20240821055146.46029-1-ende.tan@starfivetech.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: NT0PR01CA0012.CHNPR01.prod.partner.outlook.cn (10.2.10.7)
 To NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn (10.2.8.231)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB1018:EE_|NTZPR01MB1132:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e6ec8ea-f257-401c-cdbf-08dcc1a55d03
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|41320700013|1800799024|366016|52116014|38350700014|41080700001; 
X-Microsoft-Antispam-Message-Info: FIWQM1tXukBRccrqQCWQdVMlZTpSpMO7+T4xUkYGuMiEwHhwm2NTFsr3+da8znwHrI4ac7cM4DcvbEFF63//T26qqigl5BxUXI/7tptf/BnE73H4P4W5yAyuUmu63qJLXrxxGCQw90g/4QPsvjDATNJg93e9nCyiqy7WndvFSQLbfeYUbSuBnhPQBCyl/FzfiQMYDaYcwzjs6OQoAWZEgRblWoUSKk6PR0QVmk2IouX0U2HNWvS3c4EKlJZLTKD7oHukaI2h2ehGnnaJxb8nQseisaD2xsYrJ8YfxeOkmSHtUPWvOpRDtdxjo8bLvRIYIT+9eTa1r3oviuQ41GEliAGatVe+f27AdUYEQwwdL8Qs+7vJkAHZUsLtgvaX6W//RgIwQ1T1/UNaHJMJsAHg4KSxrZOKPZzaOu9yyoUFsRVTyQwTs9Cal64bDIXYQDgQSRAguaJ7nGUq25AeurOHK3Qd6OI2q0DgfJ7EjDccoC6kVIL1W1uI3UgU4mVroK+jx120qI/3oQT5uwVSKJ8TCuqpodEM6aqo3a6ckc8EjBFmXW7ha40na6gfBiXBiiQkleUHZ/XsXjsCdLQN5tFT7JqYQ/ycLWxhrI/veCak6MXit5DV0hTc3+aMb6WbZJuiGUPfPjzI8c5lpriuvR1EsFzEIVDhncBaiwLpYEOjxWU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(41320700013)(1800799024)(366016)(52116014)(38350700014)(41080700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3RRSed6HZQJ7dHIibMwp0NgxvGmAhwofs5f4BhiTAttLa2RuqxCAsu44H9oG?=
 =?us-ascii?Q?MWfyrIJzwO9ev1vKuuzvy36ZFlma6/4bEnQBaDoJVySZmIScIO6t97RvZbEa?=
 =?us-ascii?Q?gOSfZfJ2tz2GUz1ajFDQTqaxfpAHJ+//mSIxOa53iLxtyAs6tfDgcQn3hXIk?=
 =?us-ascii?Q?HFF6N97Z6X98cIWQld7zEm7RDbPC1nMq8JY9UHvNz1VQznkOeT6AEOTMswux?=
 =?us-ascii?Q?CcLV3DvwIQciCWmY5+bEeNkmcr4fSvwmj4Kwuhs93zvL47YPSNBd1xlFrMga?=
 =?us-ascii?Q?w2MBhNU57dFzYpQ6Or5mBLLt4hFqD5XVH/b+L584E5yK5FzA5yQwHsrqVezR?=
 =?us-ascii?Q?w/hgxUVo74VtC5x3YevFdjY4P0tIlYqTywzss7ciJWDxEv8gp/QpTDaFRk66?=
 =?us-ascii?Q?wQDxm/zRJ0Uy59lspQIjAmts+TaF71i/Sh5jv7idNxpg3IYzd6iwEI31Y8D0?=
 =?us-ascii?Q?mKvM8iHZ4xzXOdPtF5xMZ3NoSRnRXiXR7dCyywjNdUGEGyArYyDrMgV7CNtR?=
 =?us-ascii?Q?4YNw4e8mQfHvglPSvR2YW8B0YLeKZgHKFx7H/X49jL8O4Yz/eOR/1LZg40j6?=
 =?us-ascii?Q?sHlXLURRJzpBik9fdOAwqk1OdlMFXTGlrf0/Is9iz/riCirjwxZFgUqb8ydu?=
 =?us-ascii?Q?Rjk/TnzBe9AbhhyVQ6waMDrWTaTyB9uHPSJNqgon6WorusWDHSfJmd0fgcRa?=
 =?us-ascii?Q?FcTFXGqxcnlNEiQOGhavaf20+ZWbnzaU5nZNys5+bQdr5k/kmG/jp5ZWAifK?=
 =?us-ascii?Q?6nkZ8KIEcAyREbyhvzB7j2O69evjxUg3dxlVzlz6xjyywkoUoV12U99Ml9mI?=
 =?us-ascii?Q?VQFM7TCii9IVEA0Vn/SmdYqaxD48fjdyRqOwThGUTIINDFhW+Bm9P43qQd0/?=
 =?us-ascii?Q?2GwgXpNS7YU9l+QMOk0VxFrphv3bNz+kp3oBQYjVtWDN22Tml87L3rj7+BQ8?=
 =?us-ascii?Q?IXTNQDNSMcegYu3djMxat7e65PpyUFeVtraCWBMwMDgvpFRISSEqw+r7k3CU?=
 =?us-ascii?Q?75V30s/Auxnt8g83W6a2v2AHShVLIXdfpaHAMrFNbrBCCzMqImsn1/oSJPJU?=
 =?us-ascii?Q?4thetuCGuIqXfCfwPNNPjq3ZhxenSXLzIU92GSLtU/OYnS0NvS5lO/2yLXFw?=
 =?us-ascii?Q?dKGmgklJrjhDSYt5ILpkZuefrHURfQ38Y7E+OxjaveO8W6yCq9yCX8q9oJ6W?=
 =?us-ascii?Q?VH2p2c/gaJr3qMmiX3J6R9md3ah/OBZ1o70SSRFmB7qxIvCoOpufOy81DSV3?=
 =?us-ascii?Q?mEMVe0uVzggLAKPC8mJceR68MJ8YmDmdUSsGt0ZJLAYTslL0GT78sc2oYxdv?=
 =?us-ascii?Q?2O1SeAMN7qjM+wOBY74JQ1Y6xhLcUQjdkaTEDc3rfUGmau27KrG4ovk18AMf?=
 =?us-ascii?Q?vBUJkmPexEFDJwudbn56B6JwcgiyZ6+LUSsuHwQuo3nonKaWgJDKpdaSFu2U?=
 =?us-ascii?Q?0I7PEp3ahUQWp3GlXIICGfNt7rH2X2aRB3GQSYQQ7sm57VbynhOiGcZRLoC3?=
 =?us-ascii?Q?w17WZ5oF+lFUnmkP+Fm8z137JiafPC4q5u4dyP96GFRm+rswiLCh9Dc1C6fr?=
 =?us-ascii?Q?wEtnXG6WVURVQLRJQWQm7ikdpFIBn14c9XMfx21Dt8ijgei3ucRXF2gMjdTg?=
 =?us-ascii?Q?7w=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6ec8ea-f257-401c-cdbf-08dcc1a55d03
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 05:51:55.5192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqhmDg4T4thycXKtb8uBu30w8Eba8Rro4GAxmyAPr8KFO38FUcwRrjrokB+lPIIlJfdQ4wUfjNCmGA1aWo8Se4JmDDrQTLKrZXtj3frv4vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1132
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=starfivetech.com
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Subject: [Buildroot] [1/1] package/libkcapi: update site path
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
Cc: smueller@chronox.de, Tan En De <ende.tan@starfivetech.com>,
 yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com,
 fontaine.fabrice@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Tan En De <ende.tan@starfivetech.com>

Update the site path to reflect the recent organizational changes on the
chronox.de website.

Fixes:
- http://autobuild.buildroot.org/results/77243633783ac2d037d15d7e9c01384781fe700e

Signed-off-by: Tan En De <ende.tan@starfivetech.com>
---
 package/libkcapi/libkcapi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index 11462d6e2a..7a79dd55ae 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -6,7 +6,7 @@
 
 LIBKCAPI_VERSION = 1.5.0
 LIBKCAPI_SOURCE = libkcapi-$(LIBKCAPI_VERSION).tar.xz
-LIBKCAPI_SITE = http://www.chronox.de/libkcapi
+LIBKCAPI_SITE = http://www.chronox.de/libkcapi/releases/$(LIBKCAPI_VERSION)
 LIBKCAPI_AUTORECONF = YES
 LIBKCAPI_INSTALL_STAGING = YES
 LIBKCAPI_LICENSE = BSD-3-Clause (library), BSD-3-Clause or GPL-2.0 (programs)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
