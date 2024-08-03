Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F6BC3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 17:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FA8B4031D;
	Sat,  3 Aug 2024 17:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W778xdl6ZEq8; Sat,  3 Aug 2024 17:42:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA1A540377
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA1A540377;
	Sat,  3 Aug 2024 17:42:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A0F31BF3AE
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 17:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 338F040382
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 17:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZFlrzLA9X9fX for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 17:42:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2805::829;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=james.d.knight@live.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1159340102
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1159340102
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn20829.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2805::829])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1159340102
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 17:42:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=waroGRnb55nqK+hbgpLxGY2nUDm1FORlHOEemxl+rTuouyK1ZzAQR/YZr1HdP+JlcCt0bZVERbPcKC4nBPt/chxTciOToLP5NoVshVtDRLIF3p91am6N8o9oPJX+7QbPGxaMN808KEFkrL+V5Gds88pA1BUnG58WWb9TjvZE6UxQJj9jX5qUhZIdaQY7l9gWelVvg7oLi2Yr436DtuK1jOj2Sb9Ymt3dm98etSygq8RDAYtEcVerEiNbnjJivvyQoFY86qryG5SLcWr6crPKxolXeQHdRnxY6e474d7r2o4UuNgVAWiNM0m56MpJyvYCZ6bGYtyJPv7PP4MiEOFCkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQH6HvOQG9x3seKJ0rG5VngH24FCdZI9pl0pIk9C49Y=;
 b=akH6BGo2iNq/bgWldB4PnXH5kwFqzPa0j9uf50jXOhFQtneU4X7fOjjVaXEf8iGcR7fonWT6i6fRppfbhofDF+NjWiKfnSC1DLhhwlMqikvB3ZRk7h0LVZonvuuw9ce5obPJ0P1M3JZ/g0epYB+7j9RP0LGqYW5iZwlL+e1TTatjo916w2cu5BY/90l8t9VDVMYuuLR9wVCVHNO6BjW7nMTf/t48G2lmahYJSYfwdUAcM2DWjahabwNZ2glJ0qtUoF7le0qmpBeEkZExQYB0tz/rvh/Rs61vlNlcL81P4BurHao991E/cYw8gSuMLVaXm06vn3Sh0RbpI5v9/mAX+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:c2::14)
 by LV3P221MB1238.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:1ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Sat, 3 Aug
 2024 17:42:40 +0000
Received: from CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
 ([fe80::9a91:a5b6:6154:5b3a]) by CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
 ([fe80::9a91:a5b6:6154:5b3a%5]) with mapi id 15.20.7828.023; Sat, 3 Aug 2024
 17:42:40 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 13:42:03 -0400
Message-ID: <CYYP221MB11405AEAC8606191B20489FAA0BC2@CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0.windows.1
X-TMN: [Bvm0dPWUsyd6EmxnXH0wTL84llf7WEq4]
X-ClientProxiedBy: YQBP288CA0031.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9d::15) To CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:c2::14)
X-Microsoft-Original-Message-ID: <20240803174203.1931-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYP221MB1140:EE_|LV3P221MB1238:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be6048e-bdfc-431d-3e9e-08dcb3e3abdd
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|461199028|19110799003|5072599009|8060799006|4302099013|3412199025|440099028|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: 4dKkOeHBfmOMh8ia4fD0l8fQpgVHf04IZ8XU7YaKLYLuz4V8YzJn9H7Pp8559WYoziAWCucj7RHlMl+wXEjk1Di+EPCYPdgw9KOjvNgZqCDFgGRWgJm9KGq4iIfX7AO6htabh9QAvPI5W37lq6jWN7k0jn84LwF3oZ1ynEwtoKpldRKj2RXAFMVhybz4llU2CWkRh9zWkV+HU/BXxzeNgQuhoHOgjvDut1Owd1FSwyLb7xmUihBg8lytRuij8QUnt36ehzd5IExpVO0nnmb3dM6PN5vlGnbOQ8rTDLO9bQNFda4xNa52OGVVYohqIhsaT34CkQYIjSX6vybUmMbVWzNEp6InWsKwxmk+LZprBu16TbEPCNL4xUswGLiqAaerfsEd9Tq/GRP2Ry7iAyZTZtLzry986C1dJ4PwjZDjmcw5MwFYp0Y5sQVi1soive5aQ4yGXjSDyWBXh/Wa5f8wKcaT6U1YAnHFjvuvAzmEM5FjyDDZbcQJz03a2xZyOjP2daLD7if13y/uq87X5SLkFijX0TVoW/hWbZa3du2J73OJqE5qpmZmxgUdnUe1S05Mude217Cm1ZriSNzyfwEUwu6yWeYZ5Pof7ILzIIx8Xgx0zhG+79qfI7Z/vjbhOVoU+g/P2TS4yIqCqf5It68jc3QtGFhVlhLXMDMVEjGvMVyCL2L7LJFjEUkkMif5KrEZE+phnHoKSk2txRbaU6eoUtwzFkVWd6rE9jXwiOhcVd67Qd0pMFGooyHHGK/lHzE/9CkjCknXyTSoD6CO+2gVtIvT6ZT3jD+R6dGSPhPy+FUGFGO/kz/i+zFvxvUWSzN6
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XMIoiyDibha15z9jzy/TNlI39fI88leZ/sqPG+mv5vRu015TWvJY2kY3OPa7?=
 =?us-ascii?Q?9Zfb6gm8qy5jNGSxXU90BldACrKbk/TX9haOjr8Ua956S3qWH91giLiVQb4E?=
 =?us-ascii?Q?uMw5enTBy5Uyic7dNs1aLXZG23zqwiHcXjPxq4HtRNSjr/cOp5o2M9C+BoeI?=
 =?us-ascii?Q?DBihQOGqhZ9q5JJeqgtIlR52/zb6JpkC5y/yAGPnSpOHFUeNUzphEcdHScLX?=
 =?us-ascii?Q?jvQP390WKDNMtWAoU+sBVFexAtYyuBVrrEF6xiypMI+MW4CCVxS6oHi3d+St?=
 =?us-ascii?Q?IhdG5uI7MgwVHmW7isKUyhAuOXKtH3g6941uAixkvGTEFSk/FzNG8iHG6+Vq?=
 =?us-ascii?Q?EU1ioOqnPv43+KzUgGF/oyHuyDYSdE38DFc/l1bTVSZKlU5iaW72BrthRFas?=
 =?us-ascii?Q?mew4Nw8ExWAxRbeKZlU5jRC/ecX48GwXblA+Unfvft9iftaK1ft59dlia1RP?=
 =?us-ascii?Q?zs8VI3T3CBWQirPggRvaAs19h2vtiwAu+IybzyglqO2knZmylobquzML9epf?=
 =?us-ascii?Q?gDGBphJtkcZpcgzSbrEP5Wrwa2IKg1qkH4wXmws4f3Z6XMmx3tCPA7MrBbbL?=
 =?us-ascii?Q?MB5vQbkjBCErYf3cH6jqdUOp8JBByMZ4UfZzCTyvKNZejgtELiw2TYhS7042?=
 =?us-ascii?Q?DLrRw6Y/e1UpeZLifCH1EzQNmRnl0nzCN9EhYPuvuBnXFPTmLI2WXvahO4C9?=
 =?us-ascii?Q?CcBd29ZUkzHA2omqzHQSfwTvFdvoCbmE6bEVjFUdxhCSetbUV90Uo0Cq/JIP?=
 =?us-ascii?Q?NxKqc0aAP90wXhm+hdJh3LfSOA3Fsn+DafPC+9/Z2ATx5r/ds04gsYcloo1A?=
 =?us-ascii?Q?rYisDMT9N9yMzUWU76h0NZDPwpGYvxb7+F6waL6LeUopWVth1jI0J2r4t5gU?=
 =?us-ascii?Q?SsnJfOIuspr1r6mi10ZthVGp8QgAG9HUMXZ4pZqm/dUKZsPe0TvIZ2cnvtPu?=
 =?us-ascii?Q?POQTPZ6u8ekUrQosyk8BXF8oR9MqUPOI+r7/rzbiM/I/Uj6yf7WhRV1ye34r?=
 =?us-ascii?Q?QejI/wgWujt+5a0GTHd+jZJgS0SiZ1HdAPl+VX+xBzopmH27snI+xFP1IAk9?=
 =?us-ascii?Q?iS4IGqP4FMKxy5FJRRnsYXQwkQOBDs6bUlVhWjtd4w0cJKBF0fvs2JFo+cTJ?=
 =?us-ascii?Q?p0uNwnjQHhcVS5djtj/tRCa05m20eroJs06cKfEo99MB3A6vznsBW4SmBX1n?=
 =?us-ascii?Q?f6VGhb17gP8T6rOp3HgKv5DkBluDJRdGcvt2cPJZviE/QkK/Erp2FQM757c?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7762-17-msonline-outlook-7d150.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be6048e-bdfc-431d-3e9e-08dcb3e3abdd
X-MS-Exchange-CrossTenant-AuthSource: CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2024 17:42:40.4530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3P221MB1238
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQH6HvOQG9x3seKJ0rG5VngH24FCdZI9pl0pIk9C49Y=;
 b=MB2Ct+KKtJIW5Asb3Mhe/2qf6Mz7OiZqNKjzwfUfg+FtmJVssI7dqeifl9lH+dpf/C0W+XrW3rSPjJHIn9qtGY6iez0CLO35emYAOhTIyLaQPFoACwBYDWFLW9TGh8o+CHAZxcV0/Q0ia0eofmA8/NDcuRkZ5oOdU+o61zvSpwvvc2dtLVntnDGnnq/UGpvGXuu8Y74MVTw8N9xLseVP1R93qOb2NnIcDLPezWq1D6AsEG/PPuJNlc8CNlLy26I1HkvUZ5H5JQQxL7ye4RIo0lCfkPx0IS1nAGIO7yevbkN4SE4cXixU8KhPciy+JOdPuTwWat0YNtNR2zcwa5woQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=live.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=MB2Ct+KK
Subject: [Buildroot] [PATCH 1/1] package/swaybg: bump to version 1.2.1
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
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See also: https://github.com/swaywm/swaybg/releases/tag/v1.2.1

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/swaybg/swaybg.hash | 5 +++--
 package/swaybg/swaybg.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/swaybg/swaybg.hash b/package/swaybg/swaybg.hash
index 62bf048d6125ebe7d6d936875bdd0083a105d60c..e528349db905cba1f3a47d4bab8d4125f303ccd8 100644
--- a/package/swaybg/swaybg.hash
+++ b/package/swaybg/swaybg.hash
@@ -1,3 +1,4 @@
-# Locally computed, tarball verified with GPG signature
-sha256  c0205b34f1fad94553b6cb2c2b983cc33186018026058cad0b841a00bc3087e3  swaybg-1.2.0.tar.gz
+# Locally calculated after checking pgp signature:
+# https://github.com/swaywm/swaybg/releases/download/v1.2.1/swaybg-1.2.1.tar.gz.sig
+sha256  6af1fdf0e57b1cc5345febed786b761fea0e170943a82639f94cfaed7df84f8f  swaybg-1.2.1.tar.gz
 sha256  95224d118a325daf31828afcca98cd958d53f0a7cdd856b50b1be8ac44832faf  LICENSE
diff --git a/package/swaybg/swaybg.mk b/package/swaybg/swaybg.mk
index 90a8cb5d809ac78509c3e07c487232010f2966a7..87374e035eef2206139cbf9c8edf8c334d66e2e6 100644
--- a/package/swaybg/swaybg.mk
+++ b/package/swaybg/swaybg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWAYBG_VERSION = 1.2.0
+SWAYBG_VERSION = 1.2.1
 SWAYBG_SITE = https://github.com/swaywm/swaybg/releases/download/v$(SWAYBG_VERSION)
 SWAYBG_LICENSE = MIT
 SWAYBG_LICENSE_FILES = LICENSE
-- 
2.43.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
