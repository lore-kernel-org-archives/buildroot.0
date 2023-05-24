Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525F8C77B73
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 08:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 819E96113D;
	Wed, 24 May 2023 08:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 819E96113D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q8O7CTfUzt3r; Wed, 24 May 2023 08:32:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD43D61124;
	Wed, 24 May 2023 08:32:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD43D61124
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 00B6A1BF33F
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 08:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9C6041E23
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 08:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9C6041E23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I6Kvn4KnafuG for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 08:32:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3068400D7
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::613])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3068400D7
 for <buildroot@buildroot.org>; Wed, 24 May 2023 08:32:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hg120ibX3bSi5bx3FKJGeFfIAxJKxQFdjQt2YL88ZOYwFzVVmuMC/fNONrkKOrkIjFEHGapBKecoqELQTl50ah93uRbxtDckTHxZorpQxob9Q5/nhM48Yz/PYOp5X8nsO+PJlmN4iuLd4FJ9iTtTMsOaMSAj3GrpOkmLwt2So2bMTZQxSegBSmleviI3dC2kXF6Hj5cbjkbaiSpquQOw1luCkmmpHg9s/MLtQYRuz7oWUdG0jP14n5+2j8DJqXCgjPb4SJ0Y3AzkeiBvRUt3ARAIPoJhfJlt5GeID6Ps8BbNj9ox57Hw9KLG9r4Z68EKQsB6oLUu3vIy9d8bkrdN4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1u9unSHCh/oFAvYtkvHd3aUdbWytg5lfHnLEX9aA740=;
 b=JV1ycDlA1jI3Ay8WVrf13jFwH7tjyoD+lbyHoh5xJlNB/1p04B5ei+55sINCZIf72yvmNY1FFCKLTusTBVAWWyg/R7VfuIxra80QQf2OK7rPCo7FdHNZxBNTWFNdFNaS8qfrvz5hibgHdcOv55vf1yzjGiOm6PvZId4aXEf4AML0nqUiOLYEvJJtQzZJgCSw+U2P3bpIzr8+389EwYNyA4FCGopNGA/ljGQWArXo9Vx3W73suZFCmsFGQ4c+bW+bUzQJLAluDc3hkukG3HwMw4CVCARTAn4LrH2inJEkBuN9oLDE02MJ3E8nmh+Z1llM++czS5RHS5NmmTRPghuvhw==
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
Date: Wed, 24 May 2023 10:31:57 +0200
Message-Id: <1684917117-10063-2-git-send-email-luca.pesce@vimar.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1684917117-10063-1-git-send-email-luca.pesce@vimar.com>
References: <1684507558-5929-1-git-send-email-luca.pesce@vimar.com>
 <1684917117-10063-1-git-send-email-luca.pesce@vimar.com>
X-ClientProxiedBy: ZR0P278CA0143.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::22) To AS8PR08MB6870.eurprd08.prod.outlook.com
 (2603:10a6:20b:39a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB6870:EE_|GV1PR08MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 1076056f-3821-4e9d-2db1-08db5c315eb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LZV3BjJ/u/qqlacjzS+V863XpxWEhrCuCtnkkMjbwb4aOa9IvVmuKiv5PPRJg1BMTHR16VRG4SRypRYLxAkub/Aktx3BUgffjavxL4U9DpsMTbFiAuQuL51EMZaM7ibsUDqWi+skozFQjPUf15h1fLY9RV50+TOBBzvrv9gSF+s6AlzMzb5l0iiXGAAUnDNnmjLIll3wYYWbxzetuf4eLtldQDvY8KwBV9wVLW0AnBWFzkg9dMdcknfxHxT40ZKFe0vpnty/ltqwutXya7RLIxlgu5K8J6QnRA4p2rcf49qmcPKgvoP5D83+ZXM04udLiiLwsAkgueyXeppuIGr1DJK69uhyScpGVjz3p4wzXq5EeIEcIKbYvxXR3K6tvfM3Ub1zSFJVj3vCUh/zVKP5x8cb3WzPfxkdISUkGiIkxEtx/+4xvO5kJYnGhU8IkseI2miXKNTU5GYvzmOm+9nQF5t7Y3tu79Okmd3hE2SvvlDn/YbGB0WNFZ3ATwC/ohfNzPCa6i58UBmyduXjy2jjVuOBh9lIcXLTILFlm7uJi5KGMrwRrG1pHFrcE+JsO8CDhYc/10sUAIsp/EDlfILltHzqQQULMENOd4wJes/MQD/WXqn/020GhNLO6prsznN8cwGaQxSHahxM2Yt0Xeb3SQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6870.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39850400004)(376002)(396003)(366004)(136003)(346002)(451199021)(6512007)(26005)(186003)(6506007)(38350700002)(107886003)(4744005)(44832011)(2616005)(36756003)(83380400001)(2906002)(38100700002)(41300700001)(6486002)(52116002)(316002)(6666004)(966005)(478600001)(66946007)(66556008)(66476007)(6916009)(4326008)(86362001)(8936002)(8676002)(5660300002)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p2CD7YgAU+KLFN6wRDtwEXeB3ElYxNelREJiQe5JivykfcuIbd9SJ2AXQ1Gf?=
 =?us-ascii?Q?gC/CeFaHYqRe6Qv7Y23JC97KwID4spNWgJMgejbxc7PJjPuqZGfHDOcX3ZGg?=
 =?us-ascii?Q?PYo5gDrKVIVBxmItg6dR9tFExxIKn02sVVcVMNfDKxQEVvnOBYse5T7hSm/l?=
 =?us-ascii?Q?idSTJ4U5V4DtdFD7LoXhNZVuKWYbxJ//qR26pYW26sTTWUyfmKQWv5Y1xMgj?=
 =?us-ascii?Q?9owLHZeP1hD4gQNBmDaDY7kkw+gVqZovsMiAq/l7AWmwVPw1Wz0Hc4lfU//v?=
 =?us-ascii?Q?i8cXfpRLuxsh6LUsHLV08/lohU9dakO0tLtJJIQuB2lP9v9mm31ori8MPCGH?=
 =?us-ascii?Q?pMgWLTjXITsy0K4z4aNg3M+gtZUc/xjMoZJ05c0WBoX+EePYNhHnu7gRdAjq?=
 =?us-ascii?Q?Ni+dnejS5ITYSkK5uqS4HROJEUBry9M7xSsmVjYPwtxVjIxFVFUeYXVH45ef?=
 =?us-ascii?Q?bxH9Pmqo2hB+GA0Ydn1spd6wX33VKPAhJM2S6On8Z6Os/YgxgKUqLgp+QujA?=
 =?us-ascii?Q?H4BAD0bfuArNAWSZE5pf/Cx8/eSyV1IQ2D3fb8pFWN1P1N9CEch6+7L4xWrt?=
 =?us-ascii?Q?uVWV700MvCbaLRyv6PyXp/4NudlVkhgguPEhjyFO6qu9u25dVEW2kbT1e4tv?=
 =?us-ascii?Q?Oal/qZPUQtleHn0UrWi2JN5ygbM4QsndSkJ8bgrQc+GTkl91Oi7vWrw47IGB?=
 =?us-ascii?Q?MoL6IDF8CuZ5SybReo9jPOekzUrQBtssjCtQUDPYOPTvDugM2zI1XqrBkRUg?=
 =?us-ascii?Q?Cq+IuNaGS5zaHS4YYmWCQ4yKIuTGYfRdpT8yi5OzDMXk3lAEGHH8GQ0rBClN?=
 =?us-ascii?Q?R9SfIVReTILAq48pJLj5FqI5KXtlnLKJkY4HGgD+wwNRmflGDjOr0NYv+jSP?=
 =?us-ascii?Q?nN46tg+h0pJXQHd3acJz/ESK4VcQPTOhued1e3gPHD67Q3ISEN52CkGwpUuw?=
 =?us-ascii?Q?qnIZxpGO1pmoW9medRkrK/vKX45e4DCIl7ZGmnpGMctOx4xE1epcL092tcAF?=
 =?us-ascii?Q?7IXZtMspNZ057oCHlgRZUtjjC2AeCMV36lsyQarcpn9qgRhDFMi7DRgluWMt?=
 =?us-ascii?Q?Ceoh5WFpFDlSZCFtnADadHJkt+rmlGKh5DyZMk0wcGk0eiPW+9qFd59N6LEL?=
 =?us-ascii?Q?3woWq14fYoyffsmaz+g4MJCrcQwPgrGWTi/Er4cnLVaWKJrw9xCJnssUSumv?=
 =?us-ascii?Q?fOjoCUB+Br44Um+WM59jDNQCgVLxvZVmOPCRIUtxCgZgjS+drA+81AmEUyq4?=
 =?us-ascii?Q?kh6hOxIbiFLfcmSxrviz4ob71euKjgEt6DN2WNzX13T+73kAJPPyXBs/ZpQz?=
 =?us-ascii?Q?luhVYZAj9mJklh12LehpjrhVRc2f0bFPIJjUewLrdognRnIjCxnLZZ4LQl+x?=
 =?us-ascii?Q?KTPc42GP3XDhpO6z0LlBUS4oBcfi8iEhdX8iqVAfzXRmgsUmFPkfk9anMRjB?=
 =?us-ascii?Q?6/i0ahZKfQC1WY0/mdjHTNUni2RckDgrtV11R3DjpfRmgnokeGtTNDKJW4iJ?=
 =?us-ascii?Q?XxHpLBl7Osx+WdFS4DEEH9T9G2ooyHhEL4kCtk/UdM/RmbBztZB2oSsihUJi?=
 =?us-ascii?Q?tsw357v8lbvuQXyr7jm6gxQ6J6EicG/pVob1FlPp?=
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1076056f-3821-4e9d-2db1-08db5c315eb2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6870.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 08:32:11.7975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOu7oQ9Ql9ewrvVtefuDbddb4s0mUTS0+iRzOQ0GSa5yst40IvAcE9r0EAx+OOXUnnzKzC8G5+TtorA/KVwhiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7380
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vimar.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1u9unSHCh/oFAvYtkvHd3aUdbWytg5lfHnLEX9aA740=;
 b=g36G4AYpZu/Uv5RLie73d+eD4GFWrDFNj4j2qihFTYY4ihCgibhkLTFVs3bZkCzmJXHP9VNtdLbULtHLc3DDYYHUYz5tIBjvxuk4GnFIKwJ27aN1e0X6nmc197yAMCEkGLyUugaAKsieiW2Qw7dbY1pTVmoWW97Wuh5Yr1X1xTE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vimar.com header.i=@vimar.com header.a=rsa-sha256
 header.s=selector1 header.b=g36G4AYp
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vimar.com;
Subject: [Buildroot] [PATCH v2 2/2] package/mosquitto: when building with
 libwebsockets support, select its external loop support option
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

When libwebsockets is enabled, mosquitto broker is built with
websocket support, but its code requires libwebsockets being built with
external loop option - otherwise, mosquitto gives a compile-time warning
hinting to unusable websocket support:
https://github.com/eclipse/mosquitto/commit/1b24f625ea4ee77f3c4796ec2233d059f8c7977e
To fix this, select the BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL option.

Signed-off-by: Luca Pesce <luca.pesce@vimar.com>
---
 package/mosquitto/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 6fa5f79..8bedf2a 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -25,6 +25,7 @@ config BR2_PACKAGE_MOSQUITTO_BROKER
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # include <dlfcn.h>
 	depends on BR2_PACKAGE_MOSQUITTO
+	select BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL if BR2_PACKAGE_LIBWEBSOCKETS
 	help
 	  Build and install the mosquitto broker onto target.
 
-- 
2.7.4

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
