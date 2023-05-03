Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82A5C77B75
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 14:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D24383C3E;
	Wed,  3 May 2023 14:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D24383C3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bwxZON1gCnUi; Wed,  3 May 2023 14:56:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B00883C3C;
	Wed,  3 May 2023 14:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B00883C3C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AEA261BF31F
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 14:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7861A4191C
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 14:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7861A4191C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pv1tEd7e5faF for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 14:56:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8298A41913
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10acsn20807.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::807])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8298A41913
 for <buildroot@buildroot.org>; Wed,  3 May 2023 14:56:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4zIGskpzMjEwuwFAucXnNg/9rwl8MAqyl2ERhV5Ktcf6jstGOoPI/3Wu6/Gqyo3QJFuT3Amz5IlivGVE2JOtzFwk3aWFjm4gm5MmfGOOrvw8g7/MaLi/z27BzbaSsUyEypcX/834QVRlvc8uPLuVSdxzclKYl18po8n1UdNuzussOrNlwyhKRlL91IBQbCN/0ALfQD3cBAdBe8bQpDaf1otWGNVeIub1m0J5j5MuPVoRBUb0tme+OHcCRPXmdzgsBhgj1VG4d13e0XEB3wbXcywJBcsdAAVZ7Rval8rFkKThZPIi/53BNaTRQCEG9FgzY724bwbYCFnv8UYdZBA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t83OQUuPhHc2WimjqtRgDaT8C8zIJnzsjoTFaVGEYTI=;
 b=RHWVvsNjK9McJtt4xe9rkUE5dgxvTEXYZ8oTkOcvBUdUzWKpB7U49NIQnZHHBUsdfWjJl3yfpzdsnq6tGzXlAWRP1SHAsvlO5/KTIC+i0CZdIefHfthP35+mVJIQET4wCwpNR7W/v5+Dq6IE72OTatSPynyV0Y3ZQIA/n+xKG5mWL2pwE8CjvbNEXuXGotlt3tucNBP7/IOEZOVTukSV/mv+WPwdpqf6f1KPN/nfRye3+2rojY4eTBrqUCPD+cv2iHYdM1O/wfkjqJ0Nsym69OJi8dj8EMukwa0DInTdzEtnbat/Iu73lLXPpRWTyg4Ji/LAzb20kjD2xdZ+bFRNag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SJ0P221MB0689.NAMP221.PROD.OUTLOOK.COM (2603:10b6:a03:3d1::21)
 by DS7P221MB0867.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:9d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.22; Wed, 3 May 2023 14:56:22 +0000
Received: from SJ0P221MB0689.NAMP221.PROD.OUTLOOK.COM
 ([fe80::5261:f10:fe0d:f48e]) by SJ0P221MB0689.NAMP221.PROD.OUTLOOK.COM
 ([fe80::5261:f10:fe0d:f48e%5]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 14:56:21 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Wed,  3 May 2023 10:55:54 -0400
Message-ID: <SJ0P221MB06891584D4A1A8E230113F46A06C9@SJ0P221MB0689.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
X-TMN: [nC+1qCtq7DLoQ/pc1E3W75t57PyeZDKc]
X-ClientProxiedBy: YQBPR01CA0031.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::39)
 To SJ0P221MB0689.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:3d1::21)
X-Microsoft-Original-Message-ID: <20230503145554.1550-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0P221MB0689:EE_|DS7P221MB0867:EE_
X-MS-Office365-Filtering-Correlation-Id: e1113c71-8642-494b-6c78-08db4be68e4b
X-MS-Exchange-SLBlob-MailProps: 0wLWl8rLpvt5yZG6IttL1raaQOJY2ybgevD3zeSGyN2CY8PK/HrdtLsdqULPahI5iZxwxWta9NI1YbbZRyinWbIHQKr3N5aX6a+0fiEjExOE79SqZSOXVKP0VI4UwY+xWVTxRmKmuYNo5cyMiGLVr6ZSwj1lV5DH5QyEHlmSKh2SzaCAzsXbIMM9iT4i8RIOGS7N3gtxC+Yd2lbeWj/7PteDkjpol5YKtaiGkLHJkmOPDb0jgCJg4/aIoAYen7UNnhHEbhlHSRU/DSuXxuZhUoITkkCWn1Uq3fxqX4o+JMcQwcblyPznROCiNTgAwko/VgyfahnvGFJWCnYZuLfnNIYhzscqsVUkv9WsQko6n7ZpxhXzXAboo8lgXJMOJNmRrpVGC/Q5gKZ7gCBdHGBLNe+S0pIxFbQmUpjP6NA8iLkHWbCtnHU2vd64ZwazBqEib9yoklkISvxN748YLnSOK2DFEowW5T5mCvT598MGJwoJNYzcFlsaTfAPEkStVlJ9MVuoTTqpj2dly3Twy+cQRESHwjVXAMWM5w6fwuHF2n5NjDw5uDDJLVtOG6jaIeOHHd741GtuGVuY8sqjyTgVDy7Cqqj0bhhFUEeFNwu6txHnUqgSl2XsxJbAXEOpk95SH+9rZhm7t/d5PPresLBbBQ0zNXHO7qzmnjfqeoPQmvy3phFTAveWkQFhYMviexskygh8aEXD99G35FWdOvnyTsWhihDVuPrUbCks6h3x2v1zh5AmlgVqeIEES/rjhvSYR6SUmfkgVhE=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WdgFSMV42y8FJ3dSGA+/HSsowHgH3OTmUj0a4aV4btk/DVcVpj7fecVweBrmdWuOl8SrCXkFHlyccsRAmrJfv5j2Wsnai/7Z+uPtto7tdBPIUQx75UqNQ8G9VdE6Lqxnn08cURz6C0Bf4ITj9X9GgQHHe/xEmENnzg3aK1ezBOHw72P4epUgTgnQocOWSIUu5w1Tir0zJ0XITEqSC0gBBpVKRCEDE+UMFkbm3OxaKEQ2cTCqCSZ2asvpXKekBDMzjOo6+FQdHgSQNiy7qtIhkxjk1dAQvF5P8Ce/3LrBb/ujl4/LgjfX4bMoEQp5Io4uFbA3T7VNQrds8V3o6DgfSZK4ynHcdJ7Jpk/4Nq674KcBLxH54N0H2abryjjFcSZ2c/clq9Azs751Bftr8tWkND8xQNloayT8uWyLt8MxYdFxt2hac/oKPrHERKd6B1XsXTySkz1eGFoSAmGaUWf3NK5eZ6gh1dhw6VqVCl9xaNSIH0HdF8yuxW5zXGGoCYHL/5hbhg6Pl0EJ72QurqUHQnopqCROsjMTE3o0VaD6M+F748KcziUBpKF/nJon+1Y78rxAnAjSCxtEk3h3myGlooEcPxxcO3aRobryCYT+qbADDW8CqV76cLHLXfiHCfRN
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EzOm9UV1v6oH2s8Q6i+dP0p068PsSOpf73tk12HOQS4ki7IeJxOJdeTbQw+m?=
 =?us-ascii?Q?5xiWMv84M41pjkJUaoZqXhugIV1jCEbDWSEK1w891MUDe+hdbSnqjAVwzJOR?=
 =?us-ascii?Q?cKIPrhKPBRvTEIfVgsJMpjQBIAhse38kaWGHbt4wSRGjHp1HworbRXMUCWH9?=
 =?us-ascii?Q?wUMgHniB2Whza8mRdQEkQyMwiBx3e3mHzrTcu8tzc7/54zPL6RmMGHqKCnOb?=
 =?us-ascii?Q?Xwwv0A7yio8mwrWxTMz8JApw6gu/q3YDrtxqQORqqxw8zxVdwf89Af0/L0zY?=
 =?us-ascii?Q?pKI8InHQBh2DAhnAHPwUOAbGG+i5FuJK3IhNWgYGQfYv+DSes+ecZBpU9mlf?=
 =?us-ascii?Q?IFAWI2nIvYzHrq8Vdk4nHGQv+A9V3FbUcdWs1Y7TmqueXZk//9B9OViPzOqa?=
 =?us-ascii?Q?VjQnlcgm6IGhn3hONOvRx3mbBzjwbQPMDkIcvE1IqhH0fA2gRTKAEqHyCtZt?=
 =?us-ascii?Q?2i/XcTzEULnKIqhVEcWI60TyhDQ1bsYM8V0aG9kcM/WF1sD8vprOhJZU++9i?=
 =?us-ascii?Q?Xmvw7O3wPFAvt1bV4aLcU/TcRgZTKKC+rOhFV23LYTIzBpqtVtVspZSoLEJx?=
 =?us-ascii?Q?ujo7Vy2MnfoXwmDNSHfhIm9JFT41QpgP9AchxC3505DQ1s/UubKn/cDu8HO9?=
 =?us-ascii?Q?97VoBqbK49Pht83kT7INjl6lnRuARQ0fImUpPTdSp16+jbxTm9E1/JaOMVcX?=
 =?us-ascii?Q?OB4wPai34khXNMFAoCubbaBUR7dIXpzD2BBEOsNP+Ll/dOmZ7iXQlVfB40Zj?=
 =?us-ascii?Q?yr0YZaZ2uCz6KDJwuevZJtmd5NF+1ri+YRAMmIyWaTWOB6IWJSQy6fiFXa/e?=
 =?us-ascii?Q?KEgQ25wOSlEn9fenJSZ/G4ts7GnOtEQRzunmkGRKpVFTZTxar+GU90NC4wex?=
 =?us-ascii?Q?h+ED3m4BsevctygjN/8OiykkvrPB6NiKlTkiOwRx8FWw9NTvXSXLQFgxU0KR?=
 =?us-ascii?Q?O8C3CB1BYY73Sm6iJLI5s0xtJ4GgwcWufFJgIKgqnfw52ax21b5d9c36x8AY?=
 =?us-ascii?Q?JMfM5g28Q10V57/q5AZ3ozXe8MoQLpSmdfefnq6Afu7oyj4iTFqPm2AAecbC?=
 =?us-ascii?Q?pZ4Zop16BprQhdo+VZlujrQJNDhXC45K5UYA2EkJ2b1wKrb1IbeYLWmXiHTD?=
 =?us-ascii?Q?ImUWqLZjxqu20DL/yyFceFlC1jwhdKZ8DPsQKkTb1DpJ8s/LNDlHTux9tQTB?=
 =?us-ascii?Q?zwfSAVd5IJmXqBTkaPdXkEq38U2xxRh5TO5GdjayOiTIZQ6qSm+9+IOwehM?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e1113c71-8642-494b-6c78-08db4be68e4b
X-MS-Exchange-CrossTenant-AuthSource: SJ0P221MB0689.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 14:56:21.1604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7P221MB0867
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t83OQUuPhHc2WimjqtRgDaT8C8zIJnzsjoTFaVGEYTI=;
 b=mtrNOSaslEbo5hcekjBJwjckjsOur6rslHJUj/RDK0jZWOsiUopPXGoQuF+lh5XlJ2CGOSQFDX7V+SOplDOc2Nr0yYvLGKEZzCyQ6uno2vpqcISF6sgJYE38xUHTWbCQQ915cCtBA4qQX7mZSdSOzqWuYXtQiT2VGf5Ttmt5WyqZu9nuuVrKHvIN2rfKNphyog8o+mBc9hEMBq8U9kry9xo9qmme5zg5Z9oKqUwWFEJ1zJ56ADFok89aIckcn0eCoy4oz1cBV+zCZVbuqTmlukx8ijRxI4OviZ402LaB3I7k0z/hzy/XcT7YiARh3x5pUWSpjbj/RUlC34zWqMo7Sg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=mtrNOSas
Subject: [Buildroot] [PATCH] package/libpqxx: bump version to 7.7.5
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

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/libpqxx/libpqxx.hash | 4 ++--
 package/libpqxx/libpqxx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpqxx/libpqxx.hash b/package/libpqxx/libpqxx.hash
index 167b5edc9d6b4260f60ce667e5e77c65d226a72b..1c0e4c185dedb910abd911059e6ada60b436802f 100644
--- a/package/libpqxx/libpqxx.hash
+++ b/package/libpqxx/libpqxx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  86921fdb0fe54495a79d5af2c96f2c771098c31e9b352d0834230fd2799ad362  libpqxx-6.4.5.tar.gz
-sha256  36c48c1ca1b0a68639d919196b5d92c971858ad8e24da24385ba1c65cc5eac38  COPYING
+sha256  c7dc3e8fa2eee656f2b6a8179d72f15db10e97a80dc4f173f806e615ea990973  libpqxx-7.7.5.tar.gz
+sha256  91718581edafc9f722915133d75f74c82d7c2e41a1831c1e042206423e5a63b0  COPYING
diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index 9de7df3ed28ba26d3d979b32d34d6c0cdae0da9a..b280f5a52a15b7c60d3da16ad326dbedac123137 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPQXX_VERSION = 6.4.5
+LIBPQXX_VERSION = 7.7.5
 LIBPQXX_SITE = $(call github,jtv,libpqxx,$(LIBPQXX_VERSION))
 LIBPQXX_INSTALL_STAGING = YES
 LIBPQXX_DEPENDENCIES = postgresql
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
