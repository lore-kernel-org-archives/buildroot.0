Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7473AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 00:43:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA1C56113E
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 00:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA1C56113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=live.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9220182862;
	Sun, 12 Sep 2021 00:42:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I7b9NSiPnyzt; Sun, 12 Sep 2021 00:42:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F36CF8280E;
	Sun, 12 Sep 2021 00:42:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 099441BF95A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 00:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC34540480
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 00:42:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=live.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LSINDpWSzXSQ for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 00:42:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11olkn2096.outbound.protection.outlook.com [40.92.19.96])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A18E8400DB
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 00:42:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvoXvWsR3u12SeehN1RYjZb23vObT0+BIoRZoN5Jhk6fdZP67rtIo0szJcmcchK0+scA2zqMoYjWAuWYBb0EIurEyOjCxqjkVcJI6L78tuOYSQx4d5pssAStJDs2TvPof11O7p9D9dVYUYbtV338EjC+y++8gfFgok2zGRdtCf96QzF9Sxb1GL31RVFHNeRlKDhhAE+3ZMmyOnQ4tQmmTdWUS8yEprYB25FhjT/mxHatwvhRea3vOP5FYdwGiCYwx/ncURhm8qvU/TuY1oYZYydSp+LkLNC7k5P6tRejqy4TgN/SUkOXB3V9ybQLT7Yym2E3JvJCuFDxNh0j/dfpQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=WDlj07AVziavTgLX+U02tkB/G6sBd+QtFelzA5Pmdcw=;
 b=S8B7boTwijgrHxI5FYYU8uIeX4U1x53JBzm+CcRdYiPm84ZwDNTbXImUxHpN5QkbaPBu9+tr7Vg+BThlOUkUeO03QKGhzKGr6fLBHTEJL1Rn/i+YRrs2EQXg0Mix+raQzL2N+T8I4cmpx8ghW7mwHPE68u2wZZJc8LojFR+4Bh5ITZkM+lxnhM46QyIB27AvJqS+zwG6Q5uln25PmryZLsLdWGVnRA5PcuT/OOKnd64XHFNGKBGhXRkBakNpxH3IEElfd+Cx4VUlfFiXi2RKiNH3OvdLY7fRBB9k++frjXukQ+QNbVRlT6IsLMCyoYMsOVSnVnxEJDoiw+C74y8XBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDlj07AVziavTgLX+U02tkB/G6sBd+QtFelzA5Pmdcw=;
 b=P5lMkd1HhB7KUVz5qR6vG0tQoakvdFhkH2o8YJ3zD6iZqo9tHXqQffxhRnKS4XHK3OBeZoI3wfWhsbyiV8CKRwjY4OGBv8IUB9QKccdyQ9k1s1e5Zyo8iGJRAmQWbEaccYxwgvd+SqQXgDnjIy1aGRDzBvh1voAyBjclRIozxG7xxRA00EwD9scahoFlT236jUmmxQZYma4/A8++Ov9OiQkEOQAaNfZwoh1M39ohCyoFf+d+94WE7/nGKMOcMOmTRxCIQ2aqT7ebHRytTAuwdD9xUaBfbh8EjfhWW7IKO6yL4zikcSavHx92IOvXg3KbpbsTeBoiDk0uDhYVC2srYw==
Received: from DM6PR08MB3993.namprd08.prod.outlook.com (2603:10b6:5:85::28) by
 DM5PR0801MB3766.namprd08.prod.outlook.com (2603:10b6:4:7f::37) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.22; Sun, 12 Sep 2021 00:42:51 +0000
Received: from DM6PR08MB3993.namprd08.prod.outlook.com
 ([fe80::54e7:e665:1ca:5013]) by DM6PR08MB3993.namprd08.prod.outlook.com
 ([fe80::54e7:e665:1ca:5013%5]) with mapi id 15.20.4478.025; Sun, 12 Sep 2021
 00:42:50 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 20:42:13 -0400
Message-ID: <DM6PR08MB39939D38806EB3DFF8EB65D6A0D89@DM6PR08MB3993.namprd08.prod.outlook.com>
X-Mailer: git-send-email 2.28.0.windows.1
X-TMN: [HreVAALRQFa6wXytwkKv8AUVhl5bDiQ1B7yFZZahBk0r0k6hpCR09ksySm60lR7mBiwGXcmd0uI=]
X-ClientProxiedBy: YT1PR01CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::14) To DM6PR08MB3993.namprd08.prod.outlook.com
 (2603:10b6:5:85::28)
X-Microsoft-Original-Message-ID: <20210912004213.20783-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2607:fea8:e341:f0f0:d4fa:8e56:4b6b:6667)
 by YT1PR01CA0045.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Sun, 12 Sep 2021 00:42:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: daf36ff9-85c6-452e-08b3-08d975863f5d
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiQfmMn7lLS9s3SVtZkDelAhr6GERwkZTfa9bH+KfoEOBy0M1MuvDimOGxo8kM6J+gZfyxjEIP6bo+x8shkSOqQ4PQfp+d3sc6moRqQvjUZVtsJdwKZ11iv2+9DccqUQHCxwaojaBrHv90ZrNZq2L+7TYZr/LNV4eTRLbyoW23zbtbknuvGtL9FBnMvblXRp2EH5GkcJl4Wh2F/yY9r2lmUZXSThi7b8Yf+MH1XNIglVpNEII0PittEkDsRzf5MbB9byzpSt6RPWVEtDUqmqfMGpoRR1ZmpQ0BBnxBYzQobHR1WmyUAUYIQuJQV2mEsQf/40uyv/OJV9mO5bysklXpVaniDE116k/bWs7VO6seDbLKcniYlbDoHJWdOfARNCx2E4hY9ionM5Ddr/LnrdqXo9KqIKxxgDdvCXWdmzkj28YhnUyyOCm8bYRRThV2BPUmY2aHFiQKv1XZoUn3iWZfHdHn6+d4uV8ZwJpHUHYr61zEfGxwcLau1zSdkbnm1zm9KvxnLuvW4zPZrftJxkh1a5qKM/uwn5UUU6jXtnEijpsUyg4DYRazySprooZLfg9rC7sGo0KadJkzsRLQ6zCBpi5A4H+KvU7CatPvC2fxkUsJFc26UC8lx7yfil1Vc+yPj6oJt6GiaHM1IOo30bJkXFjZgJ8XcBn9aBrVS0deAfucTGMvReDC1ooUkSimmNAB+ZQHpeWPVbX4w4nzcjGG4zvzQa8oA92bFyUaHZ96m0jq66rS1wGNU1Hfv3GzX7fSk=
X-MS-TrafficTypeDiagnostic: DM5PR0801MB3766:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DSMXwpOq2Lq0nidrtWnG2tILmnI6rbzuCRdoAfPlM4IJ0FURNrocsMdlFyLtetPKqwkuURwg6F4wdKRVE5t6ovxvFT59Yku1cw6DscEQnv5Hoo6VXesB8E4X1lcjLQVL2XDzSa1HmqkmHp3w1Qyy+R8Qh+/5vjD5m+9+BPrqAhaYSmePFE5WOORdIIUGtBd17IYB8avAbYM2qiQAovgXvlASMDOgnZkbrCCWurAlQS8xWHscAdU4/PxGYD57wdybQXX/E5KXnTdmVQBs+160IC6dQgr7FQ6whsxRpSTTqMrCG4xsg1xMVXPjQMgCvG3V0a1RfG5Mc9xRLanqnIjGLHZokdZBt33hk6rzKMgFRiYAZlUa++odF82LNeQRqWVWZiHwKz0WlTgSKWLRdn8+vElz7CF2EJ5BEeoqbVIjBWnWMMbG+uFU+x0bmB2Kr3VA
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bWSIlhnL+uQGr++WaSeh66txVY5DNxrLR+DEN3xv0OLcMY9bVNcgWIR/D9P1Siiu52IkKELU5+VjuSJepT9v/wj9WzmPRY6i8S0wUx6R2dvNrlsIyZlj47j2L3bfoCksDVlVEOBUpf/YEkNslf598YB1p2iPi+c+Mf/uOtwMksTqkiq3LDKNZzH9G8d7SGcHfThsTTCW4990jrThsGhkIQ==
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-124b4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: daf36ff9-85c6-452e-08b3-08d975863f5d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR08MB3993.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2021 00:42:50.7659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0801MB3766
Subject: [Buildroot] [PATCH 1/1] package/rpm: support lua v5.3+
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

The version bump [1] for the rpm package to v4.17 added the newly
required dependency to Lua; however, the change limited support to only
v5.3 (and not higher). Correcting support for v5.3 or higher by making
a dependency on the Lua package and omitting older versions which are
not supported (specifically, the v5.1 series)

[1]: 429e247b869027f6ecd4efa0f31bccd2765e3875

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/rpm/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 2af04b41b4be8f779912644245e3ee5f2a3422b8..e4a7e00a4c705f31a7ab47aa64a4bec1f86c1ec0 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -1,6 +1,6 @@
 comment "rpm needs a toolchain w/ dynamic library, threads and lua >= 5.3"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
-		|| !BR2_PACKAGE_LUA_5_3
+		|| !BR2_PACKAGE_LUA || BR2_PACKAGE_LUA_5_1
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	depends on BR2_USE_MMU
 
@@ -8,7 +8,7 @@ config BR2_PACKAGE_RPM
 	bool "rpm"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	depends on BR2_PACKAGE_LUA_5_3
+	depends on BR2_PACKAGE_LUA && !BR2_PACKAGE_LUA_5_1
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
-- 
2.28.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
