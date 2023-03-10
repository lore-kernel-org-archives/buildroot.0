Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEB9C6FA99
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 13:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89D7181FDF;
	Fri, 10 Mar 2023 13:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89D7181FDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vZl8fzeMUVdz; Fri, 10 Mar 2023 13:48:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE01881FBB;
	Fri, 10 Mar 2023 13:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE01881FBB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C8491BF292
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 13:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06D3C402E6
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 13:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06D3C402E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DD5pGA-h5aZh for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 13:48:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA34640123
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA34640123
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 13:48:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnTBq92PaZ9NrwTusvDSJVXlPe3lLMmAoYv8qeDw9CZ5tQmtQ531fkcTYlswFy7Ta3T/DSyumiBb/XivDmG7WY4kdYL9nUeK456Q9dYv0hGxu3z0/JVU6aOopMQjFLPmEf2FE3wzBKD5Gx4FvNqrDXBKFkAVn34NQxKiTnn8CboCO8kztgC0NevIm2aCXZj5oKXlR+4kKA7ZXzNxmbNOPx0FYVXMcPxd6w9W1XkwvWQcTm1f2igfEHxuKzZUcfLc2K1df80vf08ZFi2fzBxEuc80zwT+aa8Tvtxg42i13TS9AYvO/ljts7Gm+kRtp1kUZowPGA1zUVsjG6W7IuOXLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8R5DyYudN3qgINYlJyD1M1OV3T8qCdaYYKyWL6WiRI=;
 b=OLHwJPBIz5M0dYAN62Bq39J+D1FIGmXTZB837vJ9TSOjDYws4uQHPXcWNeg6sDTASXJZqXuYPOpEbpf80EeZGPqW/cXTHOrVYLPmwBm+DIh/En29ggP+CeMgg2WEleMA9KcFXcwuKjqavAc3ep1Sem7hy8fUpxy+9Dxrpyb0AExGpCoYglWWC4hr/1nKu9BVAYsyGh9ylfy3kfEXWMn773rJ9WworWORl8nprv1/uNsMYkM27jdbnp2S1gwLvTJIkqU5s7nA2pubWg1O0+KY9WX2eZYGleP5v7qaZpJhGdjENYahZDLjnz20hYGBppE4nZyzQmpIm6pkYVQGoeJ7kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vimar.com; dmarc=pass action=none header.from=vimar.com;
 dkim=pass header.d=vimar.com; arc=none
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com (2603:10a6:20b:39a::21)
 by GVXPR08MB7845.eurprd08.prod.outlook.com (2603:10a6:150:1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Fri, 10 Mar
 2023 13:48:38 +0000
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::a3a5:f56f:536d:4fa]) by AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::a3a5:f56f:536d:4fa%3]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 13:48:38 +0000
To: buildroot@buildroot.org
Date: Fri, 10 Mar 2023 14:48:31 +0100
Message-Id: <1678456111-30786-1-git-send-email-luca.pesce@vimar.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: ZR2P278CA0017.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::11) To AS8PR08MB6870.eurprd08.prod.outlook.com
 (2603:10a6:20b:39a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB6870:EE_|GVXPR08MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ea85eb1-a60c-4be3-519f-08db216e26c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pj3je1I85s8aA7mL2oe5nuecOwL4rsxSC1xOmmZUzt4hZvNWzPzjna48Au6nBvWuQfpOMEQLbYu9F+Np6dMsBWG0xWcNVowvlt6G0tf/fqeCytZk1zoCmZaSYnamzv7PxYN/ddTqGqVLAFqC86ScKeUns+54YvEgq67crSjR2IjDIeRS1ykBM8qs0KjfXtqKTIQ+xFvTg+ZIzT8vzgFZPbWm0s/wWM9zNkfu+VrTqG/LV12bxk6t70xZ+KUIfrHcS5p7YLHrpq2Nrb6Hr3W06bUT5jQEy2B8h85oRY9lrj7IktkrtA5QWXbiLqTrdnxrsIr2kulGqbz/+RK3CrBkaasTRCmUVWhZICOy+NiZXDFC8FQXazyVi6tpjMjBVOgYvyq9aCWraBirmpQdnoJnmm2mH2dgxuV10BRbpeg2u0S5Ledb1iwwXHNwTPPO24zSrwUXIk96nFlRMngbXOMfu0JINfNk9rCl18jt4QxpiXesTb911RhjfknniDGuX/HUyeuZLOxpQuxRJWPFuX699rif6D4WSGsvUm3I9H47PcRDB1f3hJVSTafyYk0VioDvA+Av9AJrktgOW4uxspIJJzW3ROPgkPnsZ8vDohJjm18OXlLF2usc46yNwhGan61nc4HkJuWgf633eig1ZlTMOPEK+j5Xv97DvXpdpENYtQ277+pNS0Dnu04mhDfMmvIn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6870.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39850400004)(136003)(366004)(396003)(376002)(451199018)(2906002)(44832011)(5660300002)(26005)(36756003)(38350700002)(8936002)(66556008)(4326008)(41300700001)(66476007)(8676002)(66946007)(6916009)(316002)(86362001)(54906003)(478600001)(52116002)(966005)(6486002)(6666004)(38100700002)(6512007)(107886003)(6506007)(186003)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ASICs+liJg9bH2d+Sz9IMmhVOLtKGoUZykrwbqkhbEVqygGgaDvOqWFaiIcF?=
 =?us-ascii?Q?izd3pu5E0WbX/r8QdPa+q+1MKB5gnb3eKIf127d5Rz6YbTaN2SURJVQ26tx1?=
 =?us-ascii?Q?lOlle3mWkVnR0MWc+l4Cq6xyeYTJbQonpJOM3YV517MbxPdOr4ypbXQEAy5Z?=
 =?us-ascii?Q?ILeRplbOybCf40zCm7EysX3Ylug+IwDS1Vf70PDa3YStJjYOL8GZAfym9B6F?=
 =?us-ascii?Q?PVvUXED2R3zZC7Dv1NYhfybltUf9lbSqdmhPExoiyjUQ1ehujBldLPUx1ZE7?=
 =?us-ascii?Q?6EIca2XjMV/iGoRFKF8s0mAfBEd/ybEJZvm/sZ55kEIGBLEHrgNsBgNTJJc/?=
 =?us-ascii?Q?m3Ld6q8MjuKbQVl6+DkbN84zpCGWVr1a5NbI+NkOCkEI+dHzbfSXicggNtPf?=
 =?us-ascii?Q?khc8z72syBaoz6RoNSP4PJ4MAeBhDMRaEgw3vex1YSlouBawIRuzUX6M7F9n?=
 =?us-ascii?Q?zJgIBiLG6A+Hn1NMjYzFFEOu5ck0Sn1fQCPKxxU9G6e8bqWaJBiRHyYILcIf?=
 =?us-ascii?Q?+AxtizeGehm91xRFz1VnPTaKfLcb0TRSVyUqQmBvudi3V1J6losNYrxAh4l0?=
 =?us-ascii?Q?XpWIQjJKiFu4IrZG8vOzUYu8PynAINpwSGWq4u4ymx08vPZ57rmQyuMPjlMX?=
 =?us-ascii?Q?We3JvQS88mwu+S4RvbPl85GJfu5KJrT8zrHLNGR34n3mN5NF04sx5wZY8kEJ?=
 =?us-ascii?Q?KcDV2aUC866IQoe8WkwIVMl4bsq9F7AjqzEmjIfG97Sjvez7mBh0/xqqz8MH?=
 =?us-ascii?Q?y+oHpxBwK4UH4b2V5NqbqAEyXlzFirAG0XCjahbweUa2mfVcihznMvkev9D1?=
 =?us-ascii?Q?+6UwyFG5LDtz5UT/5gh+BsLLM0l8Qiu8iyARSq0w9u+ryrpjd36OcvEXekfg?=
 =?us-ascii?Q?0Gkwbt3tda/cxHY2iBclcAJYkoHP2Aim4Q74OhM/NcVTr54aAPlnZPUeH8Qa?=
 =?us-ascii?Q?YeIzuASOSSUyNC2wVTKiI4vqsMLQwKSliZSUHbp0aCCfEtLXfL9jmRZxFQof?=
 =?us-ascii?Q?ldnXLMtrPBssrdNz1eb/je+aS/k+MYOhjwrVavLwVjube7FnTbw5A6DOwkrZ?=
 =?us-ascii?Q?Aoi3tP1nI5bSJ54cGSZ7kr/HWOwkBjrP2x9IVSw9J7plEVen5L+htDpWniDB?=
 =?us-ascii?Q?JAlTk2cPIDp+72P2kDpcvDLJL1RkXMtU5E9MqK78+Js3NJizn1zFf8+kD1Dm?=
 =?us-ascii?Q?EgY6Rzf6W/6uRujZheJ/NP+sPnyCxfMIufgfXdY/OUJld//zOyJ8sX0eRGlw?=
 =?us-ascii?Q?ogZ32LNziBUTWfor/SC+fTtBhhGvDv6Cbhrdt8gV/sXZR1QoKgYx/xPbU/F5?=
 =?us-ascii?Q?ZrRfzDtKbL0fmKkYUL2WOJLzqULejamWNLvEd2Moa3sjgvTGbSXbMo9tHmM/?=
 =?us-ascii?Q?NHMhNvsc4k1ubegTSVDLnZPL6YH7+H6yVcBZI2A+PEUDE1yAB6nl2244KC5X?=
 =?us-ascii?Q?362a3RuASwll/5y7nYQcWa1zBfbkmNruF68AWzRBpnU7KzglPkmqMoIs+W3u?=
 =?us-ascii?Q?Du7apbUsi546j2Ylaq7ghOmogC3LgPie0a9vbn9TZPC6yhtMF7mHywlt746j?=
 =?us-ascii?Q?U4LDdCKkJ6H+XLWaJkt9NBLbUmFqeKOjcnNlntg4BuxCBuAD4/KO4tX2N5qb?=
 =?us-ascii?Q?jg=3D=3D?=
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea85eb1-a60c-4be3-519f-08db216e26c6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6870.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 13:48:38.5269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2uqzvMoBwmlyMbQPmCs2ssypwbJJt4jxO/Ze2B6uo4xNgpBFCRwqs9EEdMKrHaRI4zTfI5dj7M26zN5g74tMgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7845
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vimar.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8R5DyYudN3qgINYlJyD1M1OV3T8qCdaYYKyWL6WiRI=;
 b=Pp+SmX2GK9RVazyS4MYf0Vyd5quft6TK0bQDb+q7nZ/NZ1QH78qJQ7GMygOWZBLFL09pPHy5Kd2mOzD7vsKAFeEfJxJ3PAQK6lyVDOqZy0duQxmmT28D+RPuaj8sRnMFEtN10dL53K971tQoJwW6XHG1zKIoGMm3lNZjCWHDZvc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vimar.com header.i=@vimar.com header.a=rsa-sha256
 header.s=selector1 header.b=Pp+SmX2G
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vimar.com;
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: enable libev and
 libevent support indipendently
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
Cc: Luca Pesce <luca.pesce@vimar.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libev and libevent can be enabled at the same time since version 4.1.0,
thanks to the event lib support refactoring into plugins, which is enabled by
default for unix platform builds (LWS_WITH_EVLIB_PLUGINS=ON):
https://github.com/warmcat/libwebsockets/commit/c6c7ab2b4498c62bf9461b36395d8466e023575d

In this way, libwebsockets can be compiled with both libev and libevent
support, which is then user-selectable at runtime.

This basically restores the behavior changed by previous commit 27f257e.

Signed-off-by: Luca Pesce <luca.pesce@vimar.com>
---
 package/libwebsockets/libwebsockets.mk | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 7962494..fb0ee66 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -57,18 +57,16 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBEV),y)
 LIBWEBSOCKETS_DEPENDENCIES += libev
-LIBWEBSOCKETS_CONF_OPTS += \
-	-DLWS_WITH_LIBEV=ON \
-	-DLWS_WITH_LIBEVENT=OFF
-else ifeq ($(BR2_PACKAGE_LIBEVENT),y)
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBEV=ON
+else
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBEV=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVENT),y)
 LIBWEBSOCKETS_DEPENDENCIES += libevent
-LIBWEBSOCKETS_CONF_OPTS += \
-	-DLWS_WITH_LIBEV=OFF \
-	-DLWS_WITH_LIBEVENT=ON
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBEVENT=ON
 else
-LIBWEBSOCKETS_CONF_OPTS += \
-	-DLWS_WITH_LIBEV=OFF \
-	-DLWS_WITH_LIBEVENT=OFF
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBEVENT=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-- 
2.7.4

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
