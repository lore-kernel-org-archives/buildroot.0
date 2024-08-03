Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A412C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 23:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1AF880AC8;
	Sat,  3 Aug 2024 23:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xK8S-INm5RIJ; Sat,  3 Aug 2024 23:54:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D93CF80AC9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D93CF80AC9;
	Sat,  3 Aug 2024 23:54:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B9E21BF389
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 23:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09793605EB
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 23:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zx3l6F5Xrcnb for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 23:54:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2c15::801;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=james.d.knight@live.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E05F2605D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E05F2605D8
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11olkn20801.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2c15::801])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E05F2605D8
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 23:54:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aziQaBTZzjb63cAKfxEvxblwuU4MMFo5KB8CtKOaEbz6XvDtF5s4SFl8zv4xWiUlgUA52cJjzyp05M+sqTsDzsJiLr9eAhIfdlK7Lz0GMZRAQxYFu8vrxCg1lBfoEBR8MXGFk7KrEuQDw7909vCiQscjmrC94D742mSK7bDnwBLoZTih9cPWLGn7vILn8iI+G4AsthAqKQQsH9HqEIBahj8TKD+okzsG1V+FIpHXO/IYdIGxYR61Z7zf9ziOLH6upiIA3z98Nae+NFAI059UqpUWDJXJBqL+RmLaTB5X3LHhhFmqpdUXLWXTYr7UFr0RMy0D3nW/lENQym5QQE1upA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTIQNveIy2TV+1NJtULS4ZyCJQCHb/OqqbHU8knVIi8=;
 b=vWSa05f7Ch6h+32NooIPnmes60Dg9MMaoktIqYU2vOseUQmLJvBBimN4VaC0Eip5ANFmJ2JT9zam25iiSowzU1XY1U4cx/9c87zYjgxiq+HhqPZuI59fZjPvaOlwsNiqu+v9prtVqdr0qiz95/9DrP/u4aA96H5iEffgjJ8erkfEZInhE42oPiExEBcOFlIMvegdaAKBsoxWQxa7H6gwZQ5fTbHSxBEICyXc4W27w/227dOSQBrAPLQ9ltoBM44tbebrYHquXtwl2fgHPu98j2f9QjusHTdG/mUTivQPj5L1wimJc7V0k/k8nxnibhbXVjqSIADeT8tY14oDuCZaKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:c2::14)
 by BL3P221MB0387.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:356::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Sat, 3 Aug
 2024 23:54:48 +0000
Received: from CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
 ([fe80::9a91:a5b6:6154:5b3a]) by CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
 ([fe80::9a91:a5b6:6154:5b3a%5]) with mapi id 15.20.7828.023; Sat, 3 Aug 2024
 23:54:48 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 19:54:01 -0400
Message-ID: <CYYP221MB11406664D14900C3AA420AA6A0BC2@CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0.windows.1
X-TMN: [fQRvXHJwyW9P8BsmzXPzWRIeNlc/RGrL]
X-ClientProxiedBy: YQXP288CA0028.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::40) To CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:c2::14)
X-Microsoft-Original-Message-ID: <20240803235402.2064-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYP221MB1140:EE_|BL3P221MB0387:EE_
X-MS-Office365-Filtering-Correlation-Id: aeb55f31-7c32-44a8-bbe6-08dcb417a861
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|461199028|8060799006|5072599009|19110799003|4302099013|3412199025|440099028|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: tvAfapXZ0rxwRwHHPGqZm/UikBIzYrdaEN8opv8uyERIE6QkwBOQU6M9w9jBiclt6aHcPGORgZUPPseNugnEzniJhHD9NPow//K4BaPtkwSHMU56xTFYMr9mxLT3X/EYfkKKXj0lfsyGgYH70UaomKvX1dTCUUZbQxQ6rmadm86fz6rBUZecK6jVbePnq9m5mCCYsfXU/ogc1i/E4KFqHUY4Y9Y80wbITS4VY5THlfhrIJ/eFUsgC8FrcTr0ibtC4H/5UM3kamtSv6IQw85skQSGl7PeQPEoYA9P5zTnLcEFWkj7B6K46gv41PMxilGGoLzDHNwH33npa82n9BeEHexW5DUrI8tVe1reSJEUdBpYLSv3Ow7Uhsw21BzSqut4H4Q2A+MdX7EPZsqcSEqpej5GRl8dGmIHzvQyN4G9k1Vw+9UO9w9XCdbn0i+MeCeJcQn3jgtI8KgY0kwXr88XBo3GthMaEscOdh73tkT9tJAu4uXTTgDUhNs+wXSoat7CNjzatlxN+6Zf4u9b5Ja8BE7QA720SzX6ASYhBk4aiL9fktM99QWrBGH4xI+N+TbEoHjrNysZ7ArWB2yJDFKIIVuj1LM66u4vzhNutd6ObvsqnvO+bCQ3w4mGZHd4aBL0aiLjGxjhw5dc+mUSofgfiqnsDUAVz3yv9N7iACPoSX1Ua4usVLmQ/d9u5kfy2h13unCORRnKM7y+a4v7iHwcoJnMmJ4Vx6ooX2xuNqYX5crssbkrHMvSv2CvHaj5dtuQv1OyvHLjmuzQdkX+71Zl5Kh8mWdy2jYsdyWrTUbL6lhRhfb1UL1lQAJhPh7ZnpCf
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p8Vdhjw1S1OaZmkhblGTYuW7G5sd6OtjC3qJvs5bHu30E6V+JufQEoXNu6QK?=
 =?us-ascii?Q?RsdPq/nf2Re6dlrkw+1DtFChMpPYbVFX/UDWM2x+GPSQ7vCranMXzZH2wHf2?=
 =?us-ascii?Q?YL7nJhdBiF1HH9W6XOV2adhwGeKupgbinqZ67RQPbsWKi5ozlWcwxjjO51mD?=
 =?us-ascii?Q?i9mzP9gIOW+2WbN7IqMDG1X6wHrpUYOJ7Yu/138crU0z3Kx1zyfUcFd0hAj3?=
 =?us-ascii?Q?UpZwLcSoEbDCBloWvj/wwfXYIISGPMfKIAipLrCWx/kgFSPpMZ3hboQsKRIl?=
 =?us-ascii?Q?EfPNbhllY+0zwtnOmT1wdW+cp/YXYYMZTHgd3z7QxnIIIs+Y4MmnOMLrcRop?=
 =?us-ascii?Q?vh4scWkFjHqmTuh+GBkLGfmXp/uRnGhWNFno9e4qTKAew+WJ6WCggy5Unjxl?=
 =?us-ascii?Q?+lXn4yF5ckjdG52vUXUuSIpUY+QqrUKR0QFZ408fZDQ7IjG2T6PqjBdWSFxv?=
 =?us-ascii?Q?osPG2MRG5z15XSNYqO/Sdt/5Md8nV8rr8hPgdY8CcmKX1H9XlUHcw6x1lra7?=
 =?us-ascii?Q?4gSM++zMeo5VIqOx0rG/PCe+xZHTHrrRJklpFBqluVxS+dmj9djT8WgVT0+2?=
 =?us-ascii?Q?hOaetENTcjShFOsevlnMxYg1r0VVMENFxyeIkoIVcA9P5IAl73JvxMdpmVnC?=
 =?us-ascii?Q?xoe/E5EdrvRo7jxn5/IdXDmzKLfuMAcQtT6Zr3koq6pWRYbZa7bmhx+Dg/aO?=
 =?us-ascii?Q?7117WGEeLlBxq8/nwAvQWIrOV4WdIWZcEzwrrYItCYoksdMM0NeRk8eQK/aJ?=
 =?us-ascii?Q?aGSelGis4qQxgy8tv1Bjx9en7Uw2X4TgJt3Mwdch8EA74JUtNKMTOlla676s?=
 =?us-ascii?Q?VL4PIkyoVcVaZXWRAwgLo8YSlbLjTstiLdQLPiWfgWgj/nLZwtsrUGXN/lqa?=
 =?us-ascii?Q?jyDUzvHpZC6VLRfs47M8C7mz4ySnXsoRH4vA5pfw+VLeKqYeE+Wssh2bTnzW?=
 =?us-ascii?Q?2uthPMzDGCafKOBS08NeX7jpRxsLShV6lMBF2soEDHj0yovJqo4erqptuJHC?=
 =?us-ascii?Q?/G4qE3/Ftqr95ztdhW168RCbM7Ckn9PPx8KxUOjrRC8KzHcN6ME8WdTSwnMQ?=
 =?us-ascii?Q?XnBWD+VkYvucokJs3BXL+6IB5j5k8hIZZxh5DOqjrOHLWJol8+pWD1m3DBkk?=
 =?us-ascii?Q?Ys06ROh20eHFNO7ml4jYo4Wlb9X2roY3rIdq2QFch0EkkJEacR6yf1YXIzXa?=
 =?us-ascii?Q?IZZFrBz5/7F+ASRl4uwDPUv9nuT7oSVSs2Db4CrR5ZzpfJnYymdFYZ8Vh8U?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7762-17-msonline-outlook-7d150.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb55f31-7c32-44a8-bbe6-08dcb417a861
X-MS-Exchange-CrossTenant-AuthSource: CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2024 23:54:48.5036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3P221MB0387
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTIQNveIy2TV+1NJtULS4ZyCJQCHb/OqqbHU8knVIi8=;
 b=mtydIXZN1ydypL27OgsKkYkwi4G7H+7fka0KcYT0Rw53M3MHrLRb2xGMiqrs8sLdBQpbiEiAvV4rSHjffeU8a9Higqve9a5DGgy50X8dPXsWuvqkbc0Smws8NAWtFBI4HWekLTMAHL/UlPFfy5Ps3d9pB8UpQYBrTOjgyfZA7cADM4+Q5tEW0IeNOBMJHcpdHTuN3oqZ/3ifV6pkUCofDsbX9ZtlzUgdWtxL3bMR0Y4K0oyH1a//wCYEkrVyrgAmUl3b5hxem9IAXOC3tTWio+Yn5x20RPBdlvIJn4PprYo5aEeOtmdO+7MUpQaq2MhttkUePzARxO3MS3/ptsRIfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=live.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=mtydIXZN
Subject: [Buildroot] [PATCH 1/1] package/libpqxx: bump to version 7.9.2
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

Requires GCC 8.3 due to the introduction of the charconv header.
However, as there is no BR2_TOOLCHAIN_GCC_AT_LEAST_8_3, we round up to
BR2_TOOLCHAIN_GCC_AT_LEAST_9.

Note the `COPYING` file has changed due to copyright year bumps.

See also: https://github.com/jtv/libpqxx/blob/master/NEWS

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/libpqxx/Config.in    | 6 +++---
 package/libpqxx/libpqxx.hash | 4 ++--
 package/libpqxx/libpqxx.mk   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libpqxx/Config.in b/package/libpqxx/Config.in
index f5fe2b38079fb3c619710e387c4676d7744a2416..845692eae68ea577985ca1f2d30bb759312db15e 100644
--- a/package/libpqxx/Config.in
+++ b/package/libpqxx/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBPQXX
 	bool "libpqxx"
 	depends on BR2_PACKAGE_POSTGRESQL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # C++17/charconv
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  libpqxx is the official C++ client API for PostgreSQL, the
@@ -10,8 +10,8 @@ config BR2_PACKAGE_LIBPQXX
 
 	  http://pqxx.org/development/libpqxx/
 
-comment "libpqxx needs toolchain w/ C++, gcc >= 7, threads"
+comment "libpqxx needs toolchain w/ C++, gcc >= 9, threads"
 	depends on BR2_PACKAGE_POSTGRESQL
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libpqxx/libpqxx.hash b/package/libpqxx/libpqxx.hash
index 1c0e4c185dedb910abd911059e6ada60b436802f..7e13e7415b5a3d4d71020d88655f5b73c2d13109 100644
--- a/package/libpqxx/libpqxx.hash
+++ b/package/libpqxx/libpqxx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c7dc3e8fa2eee656f2b6a8179d72f15db10e97a80dc4f173f806e615ea990973  libpqxx-7.7.5.tar.gz
-sha256  91718581edafc9f722915133d75f74c82d7c2e41a1831c1e042206423e5a63b0  COPYING
+sha256  e37d5774c39f6c802e32d7f418e88b8e530404fb54758516e884fc0ebdee6da4  libpqxx-7.9.2.tar.gz
+sha256  3dd057a614dd24688aafc38d4c41111140e17147cfd94f314a80af30879641b2  COPYING
diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index 434cefd06950e1a467fa31d23f9155764e8e12e8..c69b77260dbd12c93b64a7a990f932987b96a529 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPQXX_VERSION = 7.7.5
+LIBPQXX_VERSION = 7.9.2
 LIBPQXX_SITE = $(call github,jtv,libpqxx,$(LIBPQXX_VERSION))
 LIBPQXX_INSTALL_STAGING = YES
 LIBPQXX_DEPENDENCIES = postgresql
-- 
2.43.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
