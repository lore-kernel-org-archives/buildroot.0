Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADAAC3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 14:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9CEC41574;
	Wed, 10 Jul 2024 14:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id infsjPyHNDzO; Wed, 10 Jul 2024 14:43:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57F7641577
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57F7641577;
	Wed, 10 Jul 2024 14:43:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5368F1BF232
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 14:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3ED9441577
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 14:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFeGoZPAIPFs for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 14:43:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::3;
 helo=as8pr04cu009.outbound.protection.outlook.com;
 envelope-from=josua@solid-run.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2129341574
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2129341574
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2129341574
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 14:43:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJOnH8vxYHVTwnj4f3uCgGv7FVB4ClEog+vqu45NHYHNYNzh2mpRJGM1K8s1fJOwnR61qrrFVMnoPUsVggrwyxgMWvpvbwTCp4/4SMYYmBb1CMR48cp2nFx85W7rm7YP+cCk7K0FdSFQgZvsQmIBKLRuk5fSMupP/ewUt/mdfeFjsOs35l0bElfq3WZHoJua0XImP6FjMV7wGa5VIBs7gwJmJufBEluSxcSWnA9Z+W64Dx6RtIcbsaKKwSvcf1BZoNdz6gB/gWv8mjMO/FWxeR29SMOZk9Hg8dhAoc22R/H7ZPAY6kUJGN2ObPf+SGMuJDxYEAdK+s/xLDXCpuDUug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIl9ARWpIzjnCZfhSmItxdfCAAkJOEnUXPv+l9hV+7c=;
 b=oW+nG1hhkJPwqwYURBEvKlbZWi6sUTQX6JHQelVa5zj7xFGahxZZ0WsW5DCwYLRyIPFMuGrloK9m0s0TLMoJWmJUO/SNXT8JmuGICSpCm2zE4L+D7/92H7+scMpLcMLMtDH5p4r/f//IWcChXsTdTGUdbr3K+mZsId9PKT+2cdOVkYL5AOxjGMpCytSDOxSgnHFE6l2iw2D5mm3xqCb6ms4XvG/pnWJQItANzgUvnOgTbJrU3XCjqnMUfnjl/3MbGUKZe+O7Rsk7yDk3L/pvy08fUKPlur+hMsLmJbU9ECPiL6JyKsoP3tULAnV1ahUJbYyUOQN9p0D8JWN4kxWAaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::17)
 by AM9PR04MB7619.eurprd04.prod.outlook.com (2603:10a6:20b:284::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Wed, 10 Jul
 2024 14:43:06 +0000
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529]) by AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529%6]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 14:43:05 +0000
From: Josua Mayer <josua@solid-run.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 16:42:57 +0200
Message-Id: <20240710144257.27528-1-josua@solid-run.com>
X-Mailer: git-send-email 2.35.3
X-ClientProxiedBy: FR0P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::20) To AM9PR04MB7586.eurprd04.prod.outlook.com
 (2603:10a6:20b:2d5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB7586:EE_|AM9PR04MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: cff630ca-55d6-41fe-e1e2-08dca0ee9bd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5via36pymxo/3ERHDJw3Y+bbeUCbvAaAK4xuyIpw6U9qPauqyXx6744uDHwG?=
 =?us-ascii?Q?zAa40WAHv71TxOyTGwi5Y72FzgmYMBT+OpmWqDaiZ5ZJzGPvsUinbDbPV53B?=
 =?us-ascii?Q?d6zulPpRYMyCDm8R9BJ67Dj/X2h0cVyG8Xs4WZFnEXjCv6ExE79D8T0BB9oq?=
 =?us-ascii?Q?xI2fTlTAQS2f0KVD+sRTJ75HRTvg5y72MLTsMS4Dpb2i5ViDex9SrXXpGky+?=
 =?us-ascii?Q?luu7kBmYzT5gnUQiA0+tePlwt4/JfpJfFkxmo0Spnast5OI/BDAv3uDvZtXD?=
 =?us-ascii?Q?4xPdZ1KYzIO1RwIUAOyzXK0tjbzCLEcIvL5u4JMhwr/1ssOvbSdlVICI/wL/?=
 =?us-ascii?Q?dA5QhWOqomk7g+i40wohbIa55Efi01SZRPnfz5/46hjbPpKjIFJ3usOPl0kH?=
 =?us-ascii?Q?SLD0hBYVpEL0u0M8OuUxtIVOaVs5im6AjKFOXcukDPaGMnCM6z1YE/6S2kWM?=
 =?us-ascii?Q?uqs/JLIzdaEs5hRZrkKQPWwsPwtzjJY5Y7eZZol76oX4NriynQP8VthZhY5q?=
 =?us-ascii?Q?r+v1/e64eo2k+eZWUUSnsn/o9CGQRpypFceDzu+f8o1g4M9xi3TCgmJclO7N?=
 =?us-ascii?Q?+sFEM5c8bRcVBfpt7Ww07rVZxnw1+cCGhgAr/xgGAnCCXcPq0lPkQO8emKRl?=
 =?us-ascii?Q?HabqAvu4SWGH79DiHhBUhM7WQaUWdqbKSFUbcAIh6dEhqD7SF2dXBgHE/XHW?=
 =?us-ascii?Q?PvLtA7fUyKP3dVQKp0hdIFwPdxrmMAGm9avfFAjnRYhUEu109DvLO6KIc+oT?=
 =?us-ascii?Q?hS/Gle1SzNv/+vyNKk5b7ZHCQ/W1bPdc2haZJ2C3n6Lu1YaFQ1RZzFJHPbCF?=
 =?us-ascii?Q?HfbHrhDia75C9eGVwxHvWKnNP7V+BSTw2StomuUPByqwmP1TG67ucjyxDbAn?=
 =?us-ascii?Q?wPP/oretEIt0EdFs74M42Ghra3D77nSWaNQRGBQbiw4sboN0VPxQfJJA2+dV?=
 =?us-ascii?Q?be5EgFx5RpBm5ktnYofMzQ4b5RU/eUH290+Bqx1oUVlZLQIEoSwGFdMNM8X1?=
 =?us-ascii?Q?qVsAeQgjn1dyjO1HgwLvMR5YtFAci4ej5yejQtNlRdEWvWdrLd6ZCId8BJbb?=
 =?us-ascii?Q?VeVrrUfBkUeR3ZlrtDrOqx22NlsjBIp9wv10blgqU8iK6anDF2G3FnkBT30j?=
 =?us-ascii?Q?e2NW/6WRhln4jrzR1fpKpMYuocjsvjUWcQ5EghKgID2tP3FGyrnoVTjPUK8p?=
 =?us-ascii?Q?i89whDtxHp1a1veocgNSkqRxGd2syK+cpIED+LRRR6zIiL/bfebjC56IobMZ?=
 =?us-ascii?Q?f19UDFM+kXj1vqfg46iKZkLg9OmpaqIXs7iDTaeaQINTgNxZCdS53v/ERpUv?=
 =?us-ascii?Q?dIDMKUHs6CTkqgm2mZc95x6tPO2SnaLpASrsLJzJtTvIJNJlHK3buP1PtMiU?=
 =?us-ascii?Q?zcMYiNMje/bFgHefS7/2XLsXmxGLzOyqBoACPRwJN+K6KUlYJQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB7586.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RTGcZMF4iaDclV+VOdmqsZrn/EN5407vuRlWEGY3+MVHxILhwf4ZyXHYHjIz?=
 =?us-ascii?Q?3v4f53OvJA1OiCe9YOrKMhd6t4E4iB6LFfDImcH4RzJDm2LtBTPznT0KLO08?=
 =?us-ascii?Q?QLQPSYf7yVF0itmawAyg4pOAQ943JNXxxAuZsPrZAuGrQ3oZ85c+KG3fidxZ?=
 =?us-ascii?Q?qsYC/I7m8PpPLv6kC3sq6PbEfmcz6awDQmO5nOQ2Ppl/JFRbnqKJH76KhXuY?=
 =?us-ascii?Q?eyDoLtBY9GETFpC8KvkNKmBvnN7yiySkh4t/g0KoLeG4Z2uBx1xKJ6zHEcAY?=
 =?us-ascii?Q?9yuzjPC5ZQoKtaclGhfKfM5BcSpz7nZ164EemtKpsjU3j3EOKskCPURavmNj?=
 =?us-ascii?Q?/1ZtmTY4xYKwKonTweFQxmf/9VQk8DWTFpZRcengxCYgK7tZr0OLXF+VL1+b?=
 =?us-ascii?Q?BZ/TWLaepf/uauM0K53HSRiXVMwZZyVPmJVWHkIaIiPH8FjAG5QnpaQL0a+E?=
 =?us-ascii?Q?ZT4zDJTtF7+0X7SUA4IlANMFV3MpJBCbwiElxdwFkNFYZpilKPjRIfdLuixF?=
 =?us-ascii?Q?XrwxaQVT+UzpkHWVXUdzTpIER8MB40UATZ7dyvI4OCSVInN5Qcvf/H7onApS?=
 =?us-ascii?Q?PGoc/PAlQovBpotbJQJc1LO8p4jxlBrs+tyUeVvvNNEHetkepp8URc8I8jVV?=
 =?us-ascii?Q?A3cxMlxbqZ3ptjAzUsldSx3wvEAfln0Jxblgz9fjP79RI/VDAAu7T64o5eMj?=
 =?us-ascii?Q?ImxSGsbGYNngrkkgI6rZGijiQdDcmr0GiFZIvSiuWcJGSaJ1JE6YD+sdih2j?=
 =?us-ascii?Q?9UKpwsRTESO+alZRDh2XZeu74iN7Y6Fjz+UrGULs9drNUnV7Q6NSuoqOVvw3?=
 =?us-ascii?Q?BC7BBl56V5FPURNV6z3Ma67eO5AQSHplhe2M2AlDqoJyzWPObTrHNiShcS0g?=
 =?us-ascii?Q?zWk3jGJplNUkrc+d2ZYAfRuABoPFy58y5tpjPS04vwXAq/hyKz9zOhVxzJDj?=
 =?us-ascii?Q?kptEfdkAPgQgMwjEhDQFIRqFmDElt9UFXUm9emw5mVO8V3+OyvnE5tY/K0Bh?=
 =?us-ascii?Q?iOK/HZ/cZJNgHcc7MD27rEkkQho+iQKf8g8YTZO1+K75ZEcvG+EDtMYbGWt7?=
 =?us-ascii?Q?Barg3FxGeuwR9GqKCHfty81tH0FksJt1qDi/8OGImVki9ugtBsFlFjBFKisv?=
 =?us-ascii?Q?P4hT3lBAA8CvG1kDDpyKRWz+oeTr72hLqPp9eDrT4DvoW+MNGRXuPEAD6K+X?=
 =?us-ascii?Q?jTTfW9iwwkYzkPHI8dkgMYw+8235hYtO5Z5Ik17feE6BX7JEQ5HJLcLZZ2uT?=
 =?us-ascii?Q?UhwGsPMtCPvEzoz6F4XX+o+VyDug3Zb4/AkiTo/0Nek161CH0yRk3UduZUal?=
 =?us-ascii?Q?gsazdszOF5aRXa0lIrFA+6UrhehYl5OJ8xJUFiBeHxBbvfyzXCXPHYQ2zDzs?=
 =?us-ascii?Q?qN30v3szdx1TBygW/cNygNQwYhDOJKf7DYEM5VLDiPTZzm7gcjrKiexN63pX?=
 =?us-ascii?Q?q42cdPFuIgvsNpMuWDMNpWzGx24yFaF7FZO4kw90ZTzVg5J4pWybCwFfLtqu?=
 =?us-ascii?Q?cn+VvN8ZrpRaMDvrOr2EoyJ0njl6fRCndtrG/S4gfwBDY2UROkFpa3yPXDzs?=
 =?us-ascii?Q?sShn1j7UzFSbYGU96XJC8F0C0aLDkeHyC+bhlL3L?=
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cff630ca-55d6-41fe-e1e2-08dca0ee9bd7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB7586.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 14:43:05.8509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VpdnF5GTeQury8g1bhajLonDgsPemXOYONp+OfVA7N0zjTsRuNxP9MEzXWDynrLT5DS68QD2mpQ2L9jp2ynatA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7619
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIl9ARWpIzjnCZfhSmItxdfCAAkJOEnUXPv+l9hV+7c=;
 b=BhFV0blPZgUdS7aNTyGXuky/FCefcy7DCpzDJo9AFerptdGm2s3V1SQwqQmh1iL+gMzIDAtTohJS/D0HGp2PC77jekR76lQm9ILTj4032s18jdJLeeH2qUHGCszanfQwQQ5rRML8c07oQ4Wa6cijY+rvUMHjtXBzS+Y9sG5B7MM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=solid-run.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=solidrn.onmicrosoft.com
 header.i=@solidrn.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-solidrn-onmicrosoft-com header.b=BhFV0blP
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Subject: [Buildroot] [PATCH 1/1] package/openocd: add config variable for
 imx_gpio driver
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
Cc: Josua Mayer <josua@solid-run.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

imx_gpio driver is used on NXP i.MX family of SoCs and required e.g. for
programming noridc microcontrollers on SolidRun SolidSense family of
devices.

Add new config variable BR2_PACKAGE_OPENOCD_IMXGPIO for imx_gpio driver.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 package/openocd/Config.in  | 6 ++++++
 package/openocd/openocd.mk | 1 +
 2 files changed, 7 insertions(+)

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index cef109b511..b2398f32da 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -200,6 +200,12 @@ config BR2_PACKAGE_OPENOCD_BCM2835
 	  Enable building support for bitbanging on BCM2835
 	  (as found in Raspberry Pi)
 
+config BR2_PACKAGE_OPENOCD_IMXGPIO
+	bool "Enable support for bitbanging on NXP i.MX family"
+	help
+	  Enable support for bitbanging on NXP i.MX family
+	  (as found in SolidSense N6, N8, etc.)
+
 endif # BR2_arm || BR2_aarch64
 
 config BR2_PACKAGE_OPENOCD_GW16012
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index b24d1eacf0..6b9f5541cd 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -90,6 +90,7 @@ OPENOCD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_OPENOCD_AT91RM),--enable-at91rm9200,--disable-at91rm9200) \
 	$(if $(BR2_PACKAGE_OPENOCD_BCM2835),--enable-bcm2835gpio,--disable-bcm2835gpio) \
 	$(if $(BR2_PACKAGE_OPENOCD_GW16012),--enable-gw16012,--disable-gw16012) \
+	$(if $(BR2_PACKAGE_OPENOCD_IMXGPIO),--enable-imx_gpio,--disable-imx_gpio) \
 	$(if $(BR2_PACKAGE_OPENOCD_PRESTO),--enable-presto,--disable-presto) \
 	$(if $(BR2_PACKAGE_OPENOCD_OPENJTAG),--enable-openjtag,--disable-openjtag) \
 	$(if $(BR2_PACKAGE_OPENOCD_BUSPIRATE),--enable-buspirate,--disable-buspirate) \
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
