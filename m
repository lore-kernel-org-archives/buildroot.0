Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81079C35FF4
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 08:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22B4140190;
	Tue, 17 Sep 2024 08:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPZ5i4HdLtbF; Tue, 17 Sep 2024 08:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB29840231
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB29840231;
	Tue, 17 Sep 2024 08:46:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 777351BF276
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 08:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 732CC40231
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 08:46:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjJ2A7304l7H for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 08:46:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.45;
 helo=esa6.hgst.iphmx.com; envelope-from=prvs=983e09248=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 20E0C40190
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20E0C40190
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20E0C40190
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 08:46:55 +0000 (UTC)
X-CSE-ConnectionGUID: 3immWG5qQCSo5MQYirDv/g==
X-CSE-MsgGUID: tHEmEi0oSMutdGmmk/Gi5g==
X-IronPort-AV: E=Sophos;i="6.10,235,1719849600"; d="scan'208";a="26862497"
Received: from mail-centralusazlp17011031.outbound.protection.outlook.com
 (HELO DM5PR21CU001.outbound.protection.outlook.com) ([40.93.13.31])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2024 16:46:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uW/Kl7ax8W1U4v6lfEMy9R20iokk3RsrucDyzVhz8ejb51tPaLXxmZ8IoCfTC/gXz4bWnRoMAZ+0kbSYQ4ijYeWdHeJ2hsyVwve+HqeD5TvCZ8NqflT20UVrkIZRCgs1DWXwQ/KFdNk2pyJ4HvvIzWUsWgC6V1NheNJ4Il74/GXiEAFVuuuAEoeVGGvM4gQrF9/JpDH49MG//QF8AKwX5Nu2f8cD4e6JFMpRelvAz7hqNZuNcGPoqVxDggweke4bO6SWGs3nyE/3OICof2BGQS/B6o5wST/AQl5wEt0eXvzxyatRKN/1Ri60dNeOsKVM7d7QRVx4m9VnNiv47znWfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZtCLqWZXtviwnJvEo3u2KZN8n2Mw39z7s8zBqFER04=;
 b=ul9CxnPDCctb0XI/SDmudmyfgLlO9Iu2fvWT2BHz7VE1EtFI6tTMovsdti8YL7I/vqodcwOOqJMBL/lhmSE+DgX6Ye556INZYRaFwvQ8kLKet2aeZXpDtWw+cHVsNmvTGalLLaLkA30pZNNABkiyXSeVTBTGX3oMFjlusKKNvtaRaintEMy7hhdhsX1Cu4yctqEBRKy1iwjtkbQM84f8Tgk/T3w3NcYzg1eilk+h5nh8NzCnUeTznc2BiLpSvPUlg/ivz8kkpaBKhplq0i6sCpTBNv7glZ2vXN9EGrCLBpzqDeCQt9XLIIaPJsGw1B1qjeHR57gGX8uM2aoXxNGmFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by SA3PR04MB9001.namprd04.prod.outlook.com (2603:10b6:806:398::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 08:46:48 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 08:46:48 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 2/2] configs/rock5b_defconfig: enable
 uboot-env on the SD card
Thread-Index: AQHbAuUc1CB3U8OPVUq64u+ENUXuQbJXwU4AgAPx8gCAAAM4gA==
Date: Tue, 17 Sep 2024 08:46:48 +0000
Message-ID: <ZulB93Wq-ZvMb_fc@ryzen.lan>
References: <20240909182103.3667296-1-niklas.cassel@wdc.com>
 <20240909182103.3667296-3-niklas.cassel@wdc.com>
 <20240914222032.3fee5e2e@windsurf> <Zuk_RMVJAzqVO5s8@ryzen.lan>
In-Reply-To: <Zuk_RMVJAzqVO5s8@ryzen.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|SA3PR04MB9001:EE_
x-ms-office365-filtering-correlation-id: 8ca9a002-0350-4195-ecf2-08dcd6f544af
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?IgXpLmSabNce19JnTMvnubWPXTZvYJOr0z9b7hk/f5MVEyqVcKxIb8RsfqMG?=
 =?us-ascii?Q?8WGr5IiL0ny4p/mJu18X50yeWpMrlj98XVpeAHkiGGFZW8aQOC7X00q4EO1q?=
 =?us-ascii?Q?wa13AuFdGNEvlVbL9n0xe1fMBMLIBCBkwVAepcq+314q5ZLg2+epOIzRHd1T?=
 =?us-ascii?Q?bNxxFKMqb308zoA+pLK4Gp9k7TaToxt92BrQgEADcslS7FL5lDgoLMsUeQwT?=
 =?us-ascii?Q?GaA/mEHysQg99DdwYxvSkQ4/3UeQQ/2PsxlwE1S9uctHyp2hoTzH5p1iuUB3?=
 =?us-ascii?Q?r+jSenwnuJsPt2qAGJbU8W64Li2eVNOrcBKbeEJWVSFqwLXxQG3r3T45qTA6?=
 =?us-ascii?Q?PF+kelMBkkThBqVY0DUEX5KgTWLl7Wy7nHryAoNEfqs8hEm9zJz0PvMYm9ox?=
 =?us-ascii?Q?NepSSRif2uvtlP0JSSKJBU+4h/L9UOzQtHeBdYO1HhSNj2pt/RYTJPS8ss3/?=
 =?us-ascii?Q?bW39V7aPpsbfwKcZljya3h/fJSHP4fLrxLo7bwyofZbd+243aAk8Gn7X68Hb?=
 =?us-ascii?Q?1VDUADhp5x+Exwa9weVLzR0AzWgxepehmVBKMn5zWtsgIv5rQ1PpGi7u9GQd?=
 =?us-ascii?Q?+6cq0KSfreToe3j10q3EOKssmp1RX72FBbBgWVhuGKGAO/CjSJLK034jtWQz?=
 =?us-ascii?Q?SBUsN0v81l57BhOdg9sJkO+9yZZkXsH3/d3weD6n909uPsKUzZq5L7KjSb1k?=
 =?us-ascii?Q?p634SSzUq8Jd0nkUFm4NcSfOP+oQoycu2qYhE3pfEe3g4/lVqKVeKgTTtPtM?=
 =?us-ascii?Q?EgyQQbw05Xh1yA4PEJ2VGbxDqjDzI0a8mTWCgz7UENGDUJHCsRKRk2ciMAMR?=
 =?us-ascii?Q?NFA17Rl86mCkysRlG4pZZdYHnopWri6PHgUjAADM8AlKDrhGUIv6Lp92liBa?=
 =?us-ascii?Q?F/L34HD9StfyrGUHXLhikfN0h7uRKDvXf3ltIs9yCJEEL/9pipcfDebdcCiD?=
 =?us-ascii?Q?jCX9Z+qaLyvivFx5W3vfNcdqnMINCBJEoRHp4w6bolMEaaGUfNs/q8KZJtIo?=
 =?us-ascii?Q?dWoKyLII7mqIoO95wiJa2w9jPGw+zKnXbdpP7akbPsWs9J8LRyQO+7XaYbG9?=
 =?us-ascii?Q?Sui7x8MlA9YZ4g2mrhmZLXuXF9Q2v/CS2JkXCX5/NkD3QALyWy8lYoNkjDog?=
 =?us-ascii?Q?VYdKCsn9ylxfuRatrXkZhee5oD3BEro7ZfMwngUvUR5FY9APlQPJhMWwDRpo?=
 =?us-ascii?Q?ZYRr+tStFTHOItZX80qR1k22nxQmTR7LQmGlm88W5E/btPV419nQUDYFz97G?=
 =?us-ascii?Q?COT4O8I34JAxv83mi/lgWYo0sTRlLzlKa7/92kyvF1awCWmNHBv+LPm8gYNB?=
 =?us-ascii?Q?kZVAdqEjs7SPDungeEHQLXVkPXlvA15eCkszDAWpVFws8ly9LRKRGClg6NSA?=
 =?us-ascii?Q?GJxJhLA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IkRttfaG0O/vkmjV5fygO59ks16+65Rjw7s8wrixZC8kOm5dFuusoc7qz+eu?=
 =?us-ascii?Q?faqC4nPDgI+5jPrNAmaV1lRX6izZBSnWK5hbeA0MGfGKllWRHBsvSBvyEICX?=
 =?us-ascii?Q?/Md6qMafwcWYgbGuhboLqgZ1Pj+ltAKmfebv/Dxul4C3yz+aochjvCR1/G9q?=
 =?us-ascii?Q?Fw7SEkqKiG9l4qMX1WbYs+tjMUusXZBLxcu0cbtbKPsVOUWUy/eYAyLE1cKB?=
 =?us-ascii?Q?o2aAsOOTrWYoTN0fku+/jCwn6OwQCt4QShu4ssaOvpynQCO45mUWU4Ur5lFL?=
 =?us-ascii?Q?xB9lEt6E1asputHrPWdImd7bZg2wU6RuuCRymvtV0ZgSDSAdqkVqzlPwGe8j?=
 =?us-ascii?Q?daP35S9HRd33ZzsgzASS5WnUo8+1JE6RqD4VkBqZP/R9p5HEacxHuUnA5iwA?=
 =?us-ascii?Q?eudL1raVl5g99uKrnbhL10cdeh6OT0PzIM2+0tCQVX1HyJ22kNd7qc4ifbmw?=
 =?us-ascii?Q?uD3Kog5Rt8BlTEES0ZiyVWJBMZEJjGYW9PAVhyB17GMcYtrSqC+hpJLcrtfi?=
 =?us-ascii?Q?4+UzTUdgM1LnaL77igv8UQzd5pQOyxrj9xVp9Z92/5jbONyivBqnmsqXEzo1?=
 =?us-ascii?Q?zcxiTfs+oWeYUfxggd1ZHkBZ3eO8ekakz7mE9VcCJyXhsImGx3fVgY31Neb5?=
 =?us-ascii?Q?aftC7Yv7LKkz/9Vi6Hdrj/BKYkAejjD+H+K2gGMqtoMraT/k5j0h96btpAqf?=
 =?us-ascii?Q?9u2rVxJ1Z7MB5S+q4++zsOLIj9NLX+bMBVFodSdbIgfEzFr2j37ByAoK5Hw2?=
 =?us-ascii?Q?5WDLL3UwwIuAZELq1IMteHk0LStVIX6MVOGvrQmvW++p62Fn/jqLRogtcW6v?=
 =?us-ascii?Q?tKoVJMXhtj+IbieTbUuDcwnl+hK3VSlTRon6WMLZOCIzuncXNvftrWflOJ1U?=
 =?us-ascii?Q?76qUg4KpeOvOZIB3LGaKSv+IjNpgroN+00xZOVOcODQs8RfkYId8FpU81/Ti?=
 =?us-ascii?Q?5Zy5Fw2dRkaRNHSfnKn40kgK0B4KCJ04XDHTgRdtUvb4R/mR8tRDXXJ9mW3f?=
 =?us-ascii?Q?GVbt2WLyokX5TwKV6r8H2Cz5eMMFefVGWwaBZJhvKWYD502JjIjXqJN0j0zQ?=
 =?us-ascii?Q?Ang5kRiNGw1AttEHxoK9+8RHNLx9Ud95sRuOandm1oW4lwOnbGLi0Q20MkIq?=
 =?us-ascii?Q?ilo4r7bthKcbROjRUTdu5nMM6UxswJQsKJsm/gN/6PCdYs9rRcbBYX1PMj4/?=
 =?us-ascii?Q?fWlFPIbnsAeTxqL1kQwVAkRyIB1FK2g4X8XheCqUo3HXqoxS3fc8L2ikn+1v?=
 =?us-ascii?Q?nppupAOiT5e4aAKDwV3x32ma945xPIC3tso1C/fc16HaXSV9irBVGJMxlB49?=
 =?us-ascii?Q?QWYeGk1i30Tid2A2efSzqb95neLIBMgcs8JXQD8dafcaSZxjMP8U2SBz/1Es?=
 =?us-ascii?Q?KjlJWTnm+Joe+qkYmoAtVkFxuznZYnK4ckKLr0PsaPgIhY6ZSGyiIXpn52mx?=
 =?us-ascii?Q?wOResRYT834R/Czy0wSWO7cMOaWujFV6QCa5kFQMuwGwBFGA39Sp7CmzFaNe?=
 =?us-ascii?Q?9/YfxIIs+KNaG9+G/87E+qDdoGEcLFu9P/33Z5K2T231IBFq28MXSVxlXZIN?=
 =?us-ascii?Q?QR8hiRXtcLYMwwitSAu3eQO/WJcIOZ7fazAngaRGkZZbGuO6eOtSQg58668O?=
 =?us-ascii?Q?CQ=3D=3D?=
Content-ID: <D1139BACAADE964B872BCE0B6B1F6572@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: AxW6WUpH6NQH7XliZA7ob/+xLxVYoqLGGk21NyNF62BXapJvAcX7yngICQrt4/jTUOHa3ZmxrncxmatCmahkE3MhUIiECe86jA4ps2sXOe1pdhvkkIyMPia9xsGvAFhes4aS6Z7Hl1h+2CpPHb1UD44uiA41kteP7IrZdJ25OJ29xMA0QLPDFoFn4fF23V1DDSpfHK7K7t4kyu78Y8fIXiwY5aE8botGtpGGYPCc79UN/ui8CdS57pTWL5eKlqqnB/TKjL2fzwEsMRTcXDjMam6mKYxhJ1/tsNkyDOKgMu2IfyPNjP6grfqrykTF9y9feiy3YSOJYkFiFDq8cfZKfukSFcgq50+xoEQIGHnRKa7/ofaC65URTsBPyL5Bg1xpwSZqFQrxP1aBTAszkZCX0/PHwGcYOuxxRcJezGwmqfCA8wMlb0/pZhmrfy3Hc2cn6WVwvGVlD/KOZQ8n+024v1mhT6U1RKYkVfXdrzNUK1ZgJrwNwn4A2JMwF8ZkAko4uKv88TluYVtoTb2SoqBhC1lccsaffE1ptFMRyJttoHsrTXHqCqgWflPLPCBE4EsEekk+5+Ee96fLphlJvNeL9v76nnKnd3yfFgslNiitiiUf9iDgWHPRX0in023YtHV0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca9a002-0350-4195-ecf2-08dcd6f544af
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2024 08:46:48.6933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R81RgukDhvjaN5UbIRTlKIRvEqKW5sUu9/qYjWTwG5aIoFxIii09KDEHHUOayCdHsbw6h93bHZYzy3V8axwcmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR04MB9001
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1726562816; x=1758098816;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=eZtCLqWZXtviwnJvEo3u2KZN8n2Mw39z7s8zBqFER04=;
 b=D/5Rp96uqFUyCrmTKHQhHq9oH0r6hRB2R7yfatEQVqhf6cLcfwxUaK6V
 SLjGlLDRFBhGK6EGHmQhSuLEXZhm0Xl6F6u2Ckc3piUfOu1CVOj5nIl7l
 hNgR7332Z+o2+9nyd06eobHEOMRroZ5S1a08BHmGpHBwttStOo1BMXnKN
 9QnZnPHlOy5B5TK6icBjK8MDg+LR+TrwWjNFJWTdEnBAX5AN+/bkx3jvk
 sDywGHc+imHmvKlcxDkYz+hg5b8FoFTXIb3gSQi0JxseKniL8+cAy7xdB
 SMhUofq1Scu8cAlwq/9o2jw/BQy4g8PJb/tU/5BJWWdwlMpdkTMoqYfKL
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZtCLqWZXtviwnJvEo3u2KZN8n2Mw39z7s8zBqFER04=;
 b=IAcfTDO7WqST3m39IHVqovHghBYHen/mXkRQBy44n+of0drqSS/rDeSKhbmxxIaVSMrx+Fhcof5m3zmaOqjClztp3byOIJwKuJb9UhaWVLCwG8r4UasYudjWrGZrSk479rYjTJpRaa9w/3bpwxaA8QTahKC21AYiiwxsYjmj/7A=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=D/5Rp96u; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=IAcfTDO7
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 2/2] configs/rock5b_defconfig: enable
 uboot-env on the SD card
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Niklas Cassel via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Sep 17, 2024 at 10:35:16AM +0200, Niklas Cassel wrote:
> I will submit v2 using this solution so that you can have a look.

Hello Thomas,

You can find v2 here:
https://lore.kernel.org/buildroot/20240917084203.998272-1-niklas.cassel@wdc.com/T/#u

(I forgot to put you in To: or Cc:)


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
