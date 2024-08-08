Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B93C52D6F
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 12:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1481360A98;
	Thu,  8 Aug 2024 12:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cq7cs0EJ5l1x; Thu,  8 Aug 2024 12:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBCA960A99
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBCA960A99;
	Thu,  8 Aug 2024 12:57:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F28DC1BF2A6
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 12:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFF7160A98
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 12:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fuL1FtDOvVLE for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 12:57:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=210.130.202.135;
 helo=mo-csw.securemx.jp; envelope-from=nick.whitlock@eizo.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9AEB460A99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AEB460A99
Received: from mo-csw.securemx.jp (mo-csw1801.securemx.jp [210.130.202.135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9AEB460A99
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 12:57:32 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1801) id 478CvLkq3162084;
 Thu, 8 Aug 2024 21:57:21 +0900
X-Iguazu-Qid: 2yAa7nzfZiDRCpP0eg
X-Iguazu-QSIG: v=2; s=0; t=1723121841; q=2yAa7nzfZiDRCpP0eg;
 m=vtQ4CaO63uX+22tRXHXnJOHgOFzUsQGIgTr6wzurrXk=
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp17010005.outbound.protection.outlook.com [40.93.130.5])
 by relay.securemx.jp (mx-mr1803) id 478CvI8b4109932
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 8 Aug 2024 21:57:19 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TERon/tpxBkGLrPOnjl8vK/EfxjEc+qStvmEug85JLsFq2hGcryrwOXpJHDQCWovMX297FYdIlJgaiuFwdF27Gt/cG5TDAJqoxTVhhvYVxfjMbFy/dBRlZTtXY0G97FhB09fv9YtAg6I/ynTzwEiyfyGpCmc6gJEBfa7eTHjxiVytER4w/rwXb5YYxd52TY9FMWeLVd9O/fWg/xBrPtNkzwXRrBH/NgiMHtz1/SVARhTP8yyQNNM/7W93sOvQXHh+brXwNxaWlGidhDBPe3Ll9KsUvbQcvSmVX8moFhPDZ3qwQ+fvZUKl/SBOwvQyttGsmxAeOdhfegQar+mlhRSgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bojC1o0SdY9eihDrynOMNDeyQKZL5jZ573dta+5UgAw=;
 b=jOWApm51E7pQd82qEvG6c9tzioS6HSS4E8slHA9ii9UQFqjGDIapyXT2Lxo3eNFWw3xrWauFIajRVJSLz3vFRGeMzBLjkguvCmnj35gWlmBdzAZB0IAqeegjq09LoEkjhfLkvLLtnS4GjoI3implIt5OkKYWFW9XecdlgArb7HbIIxukbNB6pPrAM9CgrcuM/PI3iZPGcaJAH+XIXTnXbo3UZXju6+tCvw77k2I3Ei427K9KbucMpnEJ1XD+mOKTNwbXPRMwasTALnimdiToLMwKibbHcvr3yB8fe/qdmR25z3HHD2ZpPONDQM7QrQaPZbR2Mr3wP/YStNGebzbdFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eizo.com; dmarc=pass action=none header.from=eizo.com;
 dkim=pass header.d=eizo.com; arc=none
Received: from OSAPR01MB4561.jpnprd01.prod.outlook.com (2603:1096:604:63::12)
 by OSOPR01MB12265.jpnprd01.prod.outlook.com (2603:1096:604:2de::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Thu, 8 Aug
 2024 12:57:16 +0000
Received: from OSAPR01MB4561.jpnprd01.prod.outlook.com
 ([fe80::6e34:3db9:1ae4:74b8]) by OSAPR01MB4561.jpnprd01.prod.outlook.com
 ([fe80::6e34:3db9:1ae4:74b8%5]) with mapi id 15.20.7849.008; Thu, 8 Aug 2024
 12:57:16 +0000
From: <nick.whitlock@eizo.com>
To: <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [External] - [PATCH] package/nvidia-driver: bump
 version to 550.78
Thread-Index: AQHa6EhN8AR2Z6Clu0SwkHqBJAHLtrIcCcQggABFn4CAAQQ/0A==
Date: Thu, 8 Aug 2024 12:57:16 +0000
Message-ID: <OSAPR01MB4561F0D78E1778875DBAC4E284B92@OSAPR01MB4561.jpnprd01.prod.outlook.com>
References: <20240513155907.104270-1-nick.whitlock@eizo.com>
 <PH1P110MB1603A56A788CF657472E9F8C9FE2A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <OSAPR01MB45613F3A13D852BB4C96256D84E22@OSAPR01MB4561.jpnprd01.prod.outlook.com>
 <20240806233322.679a8d3a@windsurf>
 <OSAPR01MB4561B7C6E4EB47DADDCDF9E084B82@OSAPR01MB4561.jpnprd01.prod.outlook.com>
 <20240807232259.6536f3c9@windsurf>
In-Reply-To: <20240807232259.6536f3c9@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB4561:EE_|OSOPR01MB12265:EE_
x-ms-office365-filtering-correlation-id: b38db261-dbbc-4da2-e628-08dcb7a9a129
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|15866825006|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?H+9KD64md6jvSzUnv2Wh2qwuak/0xUf6ANDh4Kyw1cNsR3LL/C8zjgkHnneF?=
 =?us-ascii?Q?5MZ8ZxYuK5QtnJKYEO8BmbRKOmf5wJq5nuCy/rcDDqri9Knzreeo9AxbKZcg?=
 =?us-ascii?Q?E3TwGUS+hhG3sGhJ4KYyjmzmPLh9agZoLZiQxpKjpf2BaMRehVrnrgyfRDTM?=
 =?us-ascii?Q?Wkv1SYy3/0HZrd2BZU/qtZSekKwIj93Q8yLri0zsEtZz8wH64oPeBM+9K6bT?=
 =?us-ascii?Q?s+be0J2W1XglQFb0Pc8+X0IWbXjoEDmkizamrLfjBZLoxq9rFOYSlDZiDw0q?=
 =?us-ascii?Q?+NkEq3MxDDA6++g2RNBrYuZWXaAeaeYrLZh9x1CnHpEDsBDZu5h/1QR3DvG8?=
 =?us-ascii?Q?T9d8Ia1Q+KiJDC9oDA2YnqGmqF9IDr1y1Kay8u8kNjVBz8OsQ9BcFYkhjrSY?=
 =?us-ascii?Q?n1QszzXOLrGNvT31zdIzRNbQVtI08Z9DpU2Lv5XGTSMPPcHfGI2I70vItWl2?=
 =?us-ascii?Q?BJDVO1w5lAJJ1g5O//tFjiSlPB8RgnsVuyYNOgtgfFWCJwHRLeEoIXGsm4xW?=
 =?us-ascii?Q?CZ9wK0EjMYheuVQsPAd0fWMcHoz5qRGGiEzeNrX5IC4eQOS5Xxxk9WphyfAf?=
 =?us-ascii?Q?NOgWXgu+DxUqnAieUveFwYPDd3+cuVu6c9SMuBFKaeFemLbOqCOyt/zsfrNR?=
 =?us-ascii?Q?MPNljWtMJlbULferPW8Pk1YqAONHvTmsAAgv7iiXIds+aiKWb28l7tKy+lw2?=
 =?us-ascii?Q?snnqfdd9TaxTCt8SplZAY+afz+B7TrL4Y0W+k6fMQIepv/M3Rgj1Mq5doinI?=
 =?us-ascii?Q?r36KvrorkU2gn2V8m9Y7jhwi1K44CfMxGIGkX7FN8BgtdkTSEB5qhN7TfyQS?=
 =?us-ascii?Q?s0L5X8wVnWpxuu9RwclOoHiTym0Bug8zpzP898/rZgVxhWCQ2Et65sKLTc13?=
 =?us-ascii?Q?EIGE+xcJq1GxA0GkE/9N95ufhknMxf31rWVSLa6cWCktpsUmH8N9QaZM2PCI?=
 =?us-ascii?Q?5NX7QsZbB89dIPwklPOr20zbCFVZq5qLYzDF+VQSUKbdHOOqh6+H+PTj0nG3?=
 =?us-ascii?Q?3trfCk2RYmgknqZDUSfNkbs3BmrxKFlPPJ/fAePPxHrovsBT9a+ebZ6KBZEv?=
 =?us-ascii?Q?RXMuo/QAUn3AX4KId8GCrCNOD5gFO06jbRWqb0IA5UGIhhPCShqJBFeW1ztI?=
 =?us-ascii?Q?IZp9yRoz28LZr1JZkusKqpy8z2PqfhpFKQ9HnC2SbRINJ3M8ViLEAgUMLT11?=
 =?us-ascii?Q?hIUZgsb7C4ZOKkWaUABJ8SHye27UHfqZovwJVT/LhhqFaUrdpNirNbiT8YI8?=
 =?us-ascii?Q?Msbx799wChTX28nTy5a6EITCHWuQrTWP6l3jEv9Rt9lNd0rP7QgjlhoEhNky?=
 =?us-ascii?Q?PZDHyMlejlfIzYfYC4N9rJDfKTFdywuEAF+XDB7bcZgJbTfKkSC8zFaYg1Vk?=
 =?us-ascii?Q?84cJR4EHLZke53581lZpNW3gHxSdpxK+85B5p2m1ll+Ggy9DFTMXrKvK/x4c?=
 =?us-ascii?Q?H0QR1PFM6kQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSAPR01MB4561.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(15866825006)(41080700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wrGCrxcRw8OigP1IP4oeKlbptp2TMs/1YYy2h8wNYklHJxSNpu+dgg2DLMzn?=
 =?us-ascii?Q?dWTSfpX8InRftHDvigJ04Qb/EpVmLOFKNOG2LuyccjyYtjX+IekOs5mX4FEr?=
 =?us-ascii?Q?O50qU81+kbzCGcIog+viH0GEftbJGCfNmRYn/E6rbu6Lj8iACT9lXros6+jJ?=
 =?us-ascii?Q?/N5GOYGI8bT9iIXGnCq4JUYyhYkgoDUV5DJX79l0wIPbJF/bF3EDlhka50O3?=
 =?us-ascii?Q?XYD8IgOGKs0/RM96Z16cj7WZEiOXI9P1OdGdBdi1e9ocAan5m9Af5eWx5H8J?=
 =?us-ascii?Q?ggW62/wZ8nBAMCxb9QJgRS4kUZ5FduIx/7gn6NjwytA7OvJuXpXwQe7GFWxi?=
 =?us-ascii?Q?HTFs678DXJB2VpXLMh5+fJVz2zxqHL8wgWSkqOWB4JrTLS4F1O07GV7kAXqX?=
 =?us-ascii?Q?xjzfMMCxlwYYiv6j1jlRo7y0/3g7SS2DwhNZ3Ko+ZyeD34IYcQEwZbfZuuUf?=
 =?us-ascii?Q?OcFb0dj3y6m2QAaHRXzut5WJK2CJUocf4pKpGynVJP9CysZyXC8DO2GzNjSB?=
 =?us-ascii?Q?1KR7uXgzhEDLI9x+BcbSmsPJ85pbHuAi4Y/aS0aIk46Z8TPNysSDsR6pl5Cp?=
 =?us-ascii?Q?oKMmIvxbBaPHUP7IyCBntNpZAP1oYMBseI70AneSmaWHI5vD56rAoMA77Zcu?=
 =?us-ascii?Q?YycbSdv9+WZaOiRmYyoZ2IIQbP3ygI9ffT0sd7IFtqza9PXuCyBZCap6/Aym?=
 =?us-ascii?Q?cWXuqSpstrkbcWwcJ+4Utw5EM+mG7gdZrWGOlvf/UpNg5vcI9pDxfe/x60Jw?=
 =?us-ascii?Q?wmdDwuPaPm6bLbMzSvOy/lfpoeaXNUsOFtn1TBsI0Qj6f/GvSs9NWZO6Y57k?=
 =?us-ascii?Q?Wyt9swz4A6Pofk/WeFdduuzOV0uLBqlII+hs99ObzRhSYxJy69zxNhinH235?=
 =?us-ascii?Q?UPyJyTNWTYKZ5GBQggPbO6qpr0w6ZbRjRKD8eVdZ7qtV1T8C7MqN55BnYOp9?=
 =?us-ascii?Q?WCCCDMrUDV5zavRnZGWGOzay19/G2YdanOmoNBE+h5oc8gztqTDREXlIyzFI?=
 =?us-ascii?Q?0ZLMgH7gLXXhWDzTc8WaNPi0QKD5mXV3YiVS8R1GlC/sJKF05Bv/VVRF6OUh?=
 =?us-ascii?Q?7FGmVSUlz80oysPIBQfIiFB6zXI3IpBbwcuyL2Wxim868cqK2qzuwbNneSKW?=
 =?us-ascii?Q?6xBP2OA5doOdtX4W7XP/iP/Nz5tIg5qMqiLrmB1YSqBLZTyjud9t1+s02g/F?=
 =?us-ascii?Q?2dWUA+x+CY7gFjCmzMH+DBZmPL6IN/3c48BpHfjBAOGdUbS49tuEG/Kb4jFl?=
 =?us-ascii?Q?QORZfL+sMJhiVj1Mbd+ziXREsVLg0F1YnVMLHcJDQ4C7i7GebIrtSmXCp22+?=
 =?us-ascii?Q?7J3kUcgnp7AnyLM2DnVMiPnVjgvmEBr51KfAOEntAzk7vLJP1qJq+HQHJkoN?=
 =?us-ascii?Q?qM2CG2f1CdE9yxzGq9iF5sn9X9B4BWbXPiedNAJD+vmJ2waCfCyhDEpbyFMO?=
 =?us-ascii?Q?c1K02wUuR36PtXuOZjBN3jpiBPoxN5syF/ThU5kZbbS9GjBOg0z1Fmng64pX?=
 =?us-ascii?Q?TrbLWa1YCo9R9TeGPVPwem4okQD55X5CxXD9hKz8jmoXUGfBQFziW+PWdGIL?=
 =?us-ascii?Q?KlUPx05t6anYkY8oyFSi8MhYN8LJNXAsVaKhjdB1WU3K9dnhYGTcw1MDJnT/?=
 =?us-ascii?Q?SfrgAkRwHyQI08pILGDCEMN8GHIn0Q67VMerZpdAZMSroSKHvC4uJ4vSb4bw?=
 =?us-ascii?Q?xo2e/A=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: xzqDLff/akP1hQO13rB6XUqPR54QR8BBIbsK6x0CPWk0iAGGkPtlHDRqHyMuHZMUXr2tIkMeyypidRLLGaXDCNLWPUyfpgzVWOhY5R+9ZhapawMbVj0wCuZIneqWBehrQ9unDBSq9U4uphH2Qnb/TyfjJyMpI3+DzC4fDjQ+JdGD0wy3ku4lp+vwUcIiv3gFrwaZRQ4wkYDgXa0TkNBUTA0wa/yEmEItFQ/pkXFUlP9UWkOiTfBP1QPn31sf5bMGtHue23tboJo04eGr0w/6xXWkZKxoegtIjedNk0a3SoHakxoUsVgn3FHBLXIBEIg8QYm+dHj7ZCXRoMYg3yKePiffjldEGbqVRGhcpxhBTKlyDxf5Nofi1MZ1C1qTMrhT83L2xFWQ/s2O9yAIGXU80wPAPlAl9wsjUjjDU+dy9dAGZ4Pdc8SU5n8l1jl5rsAr7WSKvmcAKJKbLL6iVUwfCtGbYuTcjhPlYAcSmACkboJ/zE3CiHhQM0QgQgwO+afLupliw/f34oVY5QKgNU7Odke1gDE62kL+q9FxQGCZl4uDOEK7OYJyerfOIfa8+yVW1HMde/+GrV3Ti8+36gD/jQ==
X-OriginatorOrg: eizo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB4561.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b38db261-dbbc-4da2-e628-08dcb7a9a129
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 12:57:16.0791 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2329f911-3157-4dd1-9105-ef837241b69d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vmHsfhKCBPCa1fwgF/v2mS4Va3Uh4JpnXRgGzjFApr5JZqF7GLeHs+p/4AUCVhDQV6K7Ad+qHZFet2Hn5ayCWSryF9Hr+FgY2O81dXPISHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12265
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=eizo.com; h=From:To:CC:
 Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:MIME-Version; i=nick.whitlock@eizo.com; s=key2.smx;
 t=
 1723121842; x=1724331442; bh=bojC1o0SdY9eihDrynOMNDeyQKZL5jZ573dta+5UgAw=;
 b=Qoo
 oAX4QRon9SYmj7bFYpM5QLKepriSmoXNulXwkfQVScMgzQnv2eMMMxDAjQ1tg4LM3XJI2kNd0r+Iy
 QvHQz6HZ283XP7z0gLYsfS8zD5yS7SI7LMd1q0puEyA9/T1cPtHrIgfM40s86+fIoAo0jo/7CIHNw
 jO71wUEZoYzTzPZrQ5G9ZHQ3WNPy46A06Fw1sWK7nMn09BgwtjBMXJ18wzVHmux8DNkm+dmOcZMA1
 eF4HWfmhCwC4o2uja4XjNpBNxGA7FuXs/1+nq/vfheM3gFTTN4zvsQf4ugCiv0jv0B/1E3ptmaGnH
 9YvCZoc/fib5zZBLs6yl7pmeihdbyAA==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eizo365.onmicrosoft.com; s=selector1-eizo365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bojC1o0SdY9eihDrynOMNDeyQKZL5jZ573dta+5UgAw=;
 b=kv7kKXFp4NylutRK85Q5kRLd0rz6XFLLFLbNaih1l71faUspvr8viaX0qA3mKRmpQOlTaL0kp1VFFyt2FttSnfvGpPgOdK2yGU07RpWOBce5NgX5coIpxYzy4E3UMq1DWS7pwm91vSsh4gV2VxTsAVIuVkFwvjMXjGaKl8gnFN4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=eizo.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=eizo.com
 header.i=nick.whitlock@eizo.com header.a=rsa-sha256 header.s=key2.smx
 header.b=QoooAX4Q; 
 dkim=pass (1024-bit key,
 unprotected) header.d=eizo365.onmicrosoft.com
 header.i=@eizo365.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-eizo365-onmicrosoft-com header.b=kv7kKXFp
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eizo.com;
Subject: Re: [Buildroot] [External] - [PATCH] package/nvidia-driver: bump
 version to 550.78
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
Cc: vfazio@xes-inc.com, yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas,

> But how does it hook up into Gtk to accelerate it?

I'm honestly not sure as I haven't looked into it too deeply yet.

> I prefer two separate and simple packages than a single convoluted package that supports two versions, but with in fact nothing shared between the two versions supported.

Yeah, I share the same position. I think an "nvidia-open-gpu-modules" module would easier to support since it's just a matter of using their GitHub repository.




-----Original Message-----
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com> 
Sent: Wednesday, August 7, 2024 5:23 PM
To: ERS Nick Whitlock <nick.whitlock@eizo.com>
Cc: vfazio@xes-inc.com; buildroot@buildroot.org; yann.morin.1998@free.fr
Subject: Re: [Buildroot] [External] - [PATCH] package/nvidia-driver: bump version to 550.78

Hello Nick,

On Wed, 7 Aug 2024 17:16:38 +0000
<nick.whitlock@eizo.com> wrote:

> I can look into adding a version selection mechanism.

Awesome, thanks!

> About the GTK acceleration. The library (from my understanding) 
> provides GPU hardware acceleration support for GTK so it renders on 
> the GPU instead of on the CPU.

But how does it hook up into Gtk to accelerate it?

> Side note:
> Originally when I wrote this patch, I wrote it with the proprietary 
> NVIDIA driver in mind. However, I'm now aware of the 
> open-kernel-modules package of NVIDIA and I may submit a different 
> patch to add support for this (bearing in mind that the open kernel 
> modules only supports Ampere and up).

I'd say it's up to you which version(s) you want to add support for, as long as support for already supported HW is preserved (by using a version selection). So if you add support for the open kernel modules, which means only support for Ampere platforms is added, that's fine by me.

BTW, instead of a version selection, we could also decide to introduce a separate package. Maybe rename nvidia-driver to nvidia-driver-legacy, or something similar, and add a new nvidia-driver package. This would be sensible if the packages are radically different in their "build"
process for example.

I prefer two separate and simple packages than a single convoluted package that supports two versions, but with in fact nothing shared between the two versions supported.

Thomas
--
Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel engineering and training https://bootlin.com

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
