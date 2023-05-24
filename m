Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77ECCC77B7C
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 08:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C804661583;
	Wed, 24 May 2023 08:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C804661583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0qN8KeX3sERP; Wed, 24 May 2023 08:32:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA7A061595;
	Wed, 24 May 2023 08:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA7A061595
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 286221BF33F
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 08:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D15D400D7
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 08:32:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D15D400D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e5BBU9WkEZ9X for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 08:32:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B27B0401A3
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::613])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B27B0401A3
 for <buildroot@buildroot.org>; Wed, 24 May 2023 08:32:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwyL0O5/wCvhxFRW+Sok4AyCzYoRl2QAq3XOVUEksKiWvr89F99bCI09dT/qF4a3sj2GGY+Q42dgnnwE10bDLAlSXIDP+Tzt/4J1zwyvI9u8+5+Kkz7J+0VCaOJE3l5KT5BKDD08DyEuVtaFmGVX6q3E/Q4nGKHQPdBzxR3Q16FhD3OnKHrdDEnEuxLpaxLbMiiSudsVwt40t9zTjQF4YP2U2a4ZmwTptPphh/jXj0IH9aAnUFJI3ZZUSDnd6KlI86CXA3BrVSctXuuf52NmeL9Bu4DYGLDMpmcBEUWtGaJv5D+uIrXqbmv8rk4Vm085SXjWAa3b+ycJ6EFviQ3pGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkyWJWnCMG48nUwjmR1vMJsu2RFgZIwszLB3zTUF+Yc=;
 b=KYwNDQwTT3Trq2QriBu1jMrgJjVJnpuWd7YSuuoSBIi+WGrimfXM/40vubDiqr6q6+0ooo82uB+Wa9Q+eT9eWM5DjzowFVsn2w6PiIRJ5GxUuBEDRpOnL6LDoZYZ/iKYyiVK+DHGe2jENSNtuoL4n881LmHrRYI7xUkOvTp4LjqiUp1jI2nct7boOHaE8Uniqswr1bBm/LSdE9jCg4Qs0x2kbD+dQVx75I5Fdys7/AgN0dRIDP41Pm4/3lp2bCE+pTYavMaBZoZGcnO8ein0lzId5sT+4OpQG0hvq7ndkcfbnp+ScuUZp+iTheCW1AojOmwNIJsOpJnKJzvsIFO/aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vimar.com; dmarc=pass action=none header.from=vimar.com;
 dkim=pass header.d=vimar.com; arc=none
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com (2603:10a6:20b:39a::21)
 by GV1PR08MB7380.eurprd08.prod.outlook.com (2603:10a6:150:24::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 08:32:11 +0000
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::cf18:8d3e:30bc:6178]) by AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::cf18:8d3e:30bc:6178%3]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 08:32:11 +0000
To: buildroot@buildroot.org
Date: Wed, 24 May 2023 10:31:56 +0200
Message-Id: <1684917117-10063-1-git-send-email-luca.pesce@vimar.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1684507558-5929-1-git-send-email-luca.pesce@vimar.com>
References: <1684507558-5929-1-git-send-email-luca.pesce@vimar.com>
X-ClientProxiedBy: ZR0P278CA0143.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::22) To AS8PR08MB6870.eurprd08.prod.outlook.com
 (2603:10a6:20b:39a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB6870:EE_|GV1PR08MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c35d1d7-009e-45ea-334f-08db5c315e74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bIlnAasL0qciQqo7OYAc/FscmXbQicDCdoHe71x8N6qBjfplthtetYoex/1GN/d2m25AKm3PbCSZfJ/vcBbF3pda5qrdfP3K7LottmMlhKfk7l4D6XXh7f73vY5dj6d8BWyTLNpWMdNfVsJUi/s5jYC/RiFzimA4WNmknPbH1oWQCJ9GK5Gy12Hmh6zfwDhwArX8iyb2bRysvfk8h2P5+piTpBT05KEw3tzrtIr7fCdeVjhFVpKMWIzcNGOuitOPk7pB/P8vRhEzm+TTpMToxzYc886il1/sCWmkwg2UW8CbN+IMvbRDjh7tL5M0CVBJrdI78dB7pGVPnkbiPhBXi7N8Zc/UTg4xPsrbf2RWAR0m36TVkQ3pXaD08sf66p0mvhaFSdSH9YQdHdQUq3DuneBdslb8KdXK+EDUQ98RXWKRtSVSbq8rDHU6hy7alqtS3PdsUUtlpIDvQPn4kk9XY/5q8bF55s7/OdT1Y4919Icrdwstkepn+YJ3g13tM9RiWWYdpCwMr9EUYPPfbAjF1OgRhIN8sinQmkTt8NpJwi74IeDlmdA02IO2JGA/yHUc0aZlwe0WsVKG7s4bMSE/xy3/NbWcXGosjipNyrsveTZk84yR50lXc4gW17muD9gnzK4+7KNMX5YtZJOWuO6u+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6870.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39850400004)(376002)(396003)(366004)(136003)(346002)(451199021)(6512007)(26005)(186003)(6506007)(38350700002)(107886003)(44832011)(2616005)(36756003)(83380400001)(2906002)(38100700002)(41300700001)(6486002)(52116002)(316002)(6666004)(966005)(478600001)(66946007)(66556008)(66476007)(6916009)(4326008)(86362001)(8936002)(8676002)(5660300002)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8FYngHfsolvjgsfeBX4el1duvsoyNqQP+zV4pDKMduKa0N14QrEgMBO653SI?=
 =?us-ascii?Q?aBYbpRcw+msWZLWwE55Z5THFtz89rNQLTKSMh8tWL9Hv4MVIxmqIuHJC++aR?=
 =?us-ascii?Q?EB++IPIHr5AEIRW+fWy9dQPjsrO3+wmovdH0M0CgyniQ1rUtBJgbYlsnqsqv?=
 =?us-ascii?Q?p1s+YzJXAUghSrtoxl3bDXGZAyFejrCt9Cs2TFwBBHxjf/dD1feaVN0oAVtq?=
 =?us-ascii?Q?IamCRIo518WmrcMEsmo521vJk8vE2EkeaDnCLh7GBpooMd6GdfHBMaxVW3yu?=
 =?us-ascii?Q?12VjcxfYUoiAHav2B2+PGEmkb3vpvS7Ps8NM7qYsnnS1NnnAWvQCxXgYbifJ?=
 =?us-ascii?Q?vr7Az+bA8U8+3vL9L8JSiygS1kFDyEKOgThlY0Og9ZaqzRcz+/j/YWJxuwAs?=
 =?us-ascii?Q?+rzapBMHKwzJXFiyk9dyANbI/6HgM2mHRTq49Z+j5Bns8R2tZUyPzgf74wh4?=
 =?us-ascii?Q?frm6cR0Tohqal/mCBd4VLRnBCVXnHKpjiBFU/+wEJlhWuolW8z7+ivw/wtGi?=
 =?us-ascii?Q?9232KTIc682uyyKMCTDzbxE17Q1efswxp9LXHHj8yCjjjcP4Zo0UivD2f0fj?=
 =?us-ascii?Q?5EreaFTLJtRmLzOER2GN1BXh6MwLRWHs5eUAXhgwjBsEgSofn0bSVbNluV7H?=
 =?us-ascii?Q?RJTqHZiZ//sJEBDRx0RipEbk87lUh7KHvkZwdfJJyfnqhk3bO2+gmOKKNUpi?=
 =?us-ascii?Q?iKRb+tZQuraHaYcXYO8DlrkPGzt33wGj6RhLz+C2RDZenG6rz1zHY/coxUt9?=
 =?us-ascii?Q?VNc9YUfuLr6vjkdXwq429g9op8UxQYn7++KKLoVam14WAmNILoaAeaWDrvOH?=
 =?us-ascii?Q?f6rM4aBCf++KZsbp4GbBY8no1t2vzEnLPnMCx1QN6YgrArjQfCgg8tSp26fD?=
 =?us-ascii?Q?3eQpEk5YVyNfotwvbXRmfR6WcvV2qVuAePDL7CRsjp2M76JcBe6xMUe2XoSw?=
 =?us-ascii?Q?y5Eur2tozxeDo0f/Vho+S5oM5iKQ7fh6HPpRihLbvpTXcGnVQN+M3H7kWwZ8?=
 =?us-ascii?Q?PFzjsj9bUL7WnZgTs/PCJp0p5+2bGHE+GmxaETkneqCWCbhkb11P7DkgDCxc?=
 =?us-ascii?Q?1wJ3Q3R3W0CF4VbR+XblKgmkYby3SgB6qaTTCkdnRFzDgeoBRtFfgOsjxcbe?=
 =?us-ascii?Q?lt4sleMTlju2w0yhfHrvA21bJRVrdOSoJrUJDb4swjsQIa8nLzNhg/RaLMQR?=
 =?us-ascii?Q?q6D30h8VF7M0acPG1+PRw/l91IncESCTmbe1Kyo+f5BsVVsFw22qfw0CVHWC?=
 =?us-ascii?Q?soewvxERNrgeMs2135d9jS8WIZumoyGHdrYCLE+AkuHLuhhHYwBDiMynwht7?=
 =?us-ascii?Q?uxj9TSPsstOPx9Akt37MV62mWykrUNRUXZfrH3Wjrc4YxxSlxZl5Ax8/u/RT?=
 =?us-ascii?Q?7ygShNOtkvMrdxEUlMwCL8E9luf//ugJyc9AU+iso3Pj78RcQ1Km3X3BAM/o?=
 =?us-ascii?Q?Zy3tPzJvRGfBKZuXfzA+P5EBZfGrJvvwHtpeJAFZlrz3Gzu7Njq4to8QgkEJ?=
 =?us-ascii?Q?zbxUr4xeHyZ9DgHWX+6OobNdUZopBdWS0+sSI81mXpUYpMqoc5NeUaIFQXK1?=
 =?us-ascii?Q?VUUTgTPrLrtlZTeOvD6qDb5Ru90Y3NCMunnyL1kC?=
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c35d1d7-009e-45ea-334f-08db5c315e74
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6870.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 08:32:11.2227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzgC8qKHiCgDhbxx9QfeweE7J8x9p7NaVZz1xda3iidmMWTXVLsHaceRRpILgUUd6HJCrgT8CdG/6l3+wWIs/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7380
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vimar.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkyWJWnCMG48nUwjmR1vMJsu2RFgZIwszLB3zTUF+Yc=;
 b=lM5vJsUfEOxaOxKnH5Px5hlp5a/JOWBOZV8Y2WPw4jV9bc9lyjSvDkUU6UaWdwrWjPdpu5FH8uZ5pr4mv6p5ILWdeliY6/RzgdXGlmL88VaoVomhm8fW+IkNiS442UawyUwUkwbpyJsx7yqPjG1FlYYJ8l6XRCGvCex+7AbKEvw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vimar.com header.i=@vimar.com header.a=rsa-sha256
 header.s=selector1 header.b=lM5vJsUf
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vimar.com;
Subject: [Buildroot] [PATCH v2 1/2] package/libwebsockets: added option to
 (re-)enable external poll loop support
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
From: Luca Pesce via buildroot <buildroot@buildroot.org>
Reply-To: Luca Pesce <luca.pesce@vimar.com>
Cc: yann.morin.1998@free.fr, Luca Pesce <luca.pesce@vimar.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since version 3.2.0, libwebsockets does not compile its external loop support
code anymore. That code was put under LWS_WITH_EXTERNAL_POLL compile option,
which defaults to OFF.
Applications relying on that support need to turn that option on, so let's
add it to the package.

For example, when libwebsockets is enabled, mosquitto broker is built with
websocket support, but its code requires LWS_WITH_EXTERNAL_POLL to be on -
otherwise, it gives compile-time warning hinting to unusable websocket support:
https://github.com/eclipse/mosquitto/commit/1b24f625ea4ee77f3c4796ec2233d059f8c7977e

Signed-off-by: Luca Pesce <luca.pesce@vimar.com>
---
 package/libwebsockets/Config.in        | 12 ++++++++++++
 package/libwebsockets/libwebsockets.mk |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
index d7b529c..05c1326 100644
--- a/package/libwebsockets/Config.in
+++ b/package/libwebsockets/Config.in
@@ -9,5 +9,17 @@ config BR2_PACKAGE_LIBWEBSOCKETS
 
 	  https://libwebsockets.org/
 
+if BR2_PACKAGE_LIBWEBSOCKETS
+
+config BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL
+	bool "enable external poll loop support"
+	default y  # legacy, was previously always enabled
+	help
+	  Enable external poll loop support code. This was
+	  unconditionally compiled in for library versions
+	  prior to 3.2.0.
+
+endif
+
 comment "libwebsockets needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index fb0ee66..86756ca 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -94,4 +94,8 @@ ifeq ($(BR2_SHARED_LIBS),y)
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_STATIC=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL),y)
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_EXTERNAL_POLL=ON
+endif
+
 $(eval $(cmake-package))
-- 
2.7.4

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
