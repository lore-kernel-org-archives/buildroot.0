Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFC9CD342E
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 13:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DC2B40340;
	Tue,  3 Sep 2024 13:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_HA-ch56dok; Tue,  3 Sep 2024 13:29:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D41B7402ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D41B7402ED;
	Tue,  3 Sep 2024 13:29:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14CED1BF4E4
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 13:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01C42402ED
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 13:29:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXyxkCGznJSW for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 13:29:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.42;
 helo=esa4.hgst.iphmx.com; envelope-from=prvs=969f4f420=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B935402EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B935402EC
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B935402EC
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 13:29:05 +0000 (UTC)
X-CSE-ConnectionGUID: WaQHHzOES2WDsrqtt3lcjQ==
X-CSE-MsgGUID: glvZUz6YRdidP1WZ+bvM8Q==
X-IronPort-AV: E=Sophos;i="6.10,198,1719849600"; d="scan'208";a="25192336"
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hgst.iphmx.com with ESMTP; 03 Sep 2024 21:29:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7Lg/V3Jm1ZnhHRKdai6aIDrkmoL1wNeLsezmERiubRSvWz7HlSs1KCTwW4Zakdp+21T9D6r3Jas34rGFd/gQ5qbNSzf60wiwAP14MOplJFQzgNPtEhUv+B4oB5oWgIJrGtwgHQo2X9kwb64v/y9A2wvHzLn/JPp3SqiMBqE0OLvuFssxRBlDefgHdgaX+Rp7oZzeSDOnHpX6MHoOE/d1qEnUOXP7gfLL+OQ1d6lxIOIgoPUabFnMvh04YjGkuQfggw4qz/Yd6F95gWLbUIv0nZRd6xzxEKCgiLx9WxGAoAhe8RiiURq0HXdXr+ertaXI4+PCEm1Kasnb/+onfAZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQw7MyLySuvpdwq0E85ZbJmYoXEmapJvDybTBPjeeVA=;
 b=AA5Jb/hQG9Tma//EznzDBnURe4BncPJjuu2V0COZnUjyRChaOfMBiUgyx7jUq8tjC/Qa1B4F/hzEgbcV3C6KinkNmg4i7mlyhCaVXV4n7Q0DYzRRWZETYEegl69cjLrG32RgglPQpKX9OTkKK1R9piaa86FsklBBpmb0iA6UZsFYSa541r3L3Y68jhBo64wrDSRmlThyolOfyI7ZtucpUmsEHGlNcR1bulKA7jQpVUCas5Iru7at7S1hAOEk1vnS6PqSoYiRH7NJQokW0XbiJwmNotfKr87wx13MbvRpksr7Y/bP1SPUvy8B/8qYxry+4gJIXRFv7i+IJdguAMoP/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by PH0PR04MB7590.namprd04.prod.outlook.com (2603:10b6:510:52::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.26; Tue, 3 Sep
 2024 13:29:01 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 13:29:01 +0000
To: Fiona Klute <fiona.klute@gmx.de>
Thread-Topic: [Buildroot] [PATCH next v2 3/3]
 configs/raspberrypicm4io_64_uboot_defconfig: new defconfig
Thread-Index: AQHa+9hWBI88W/7iHkCDRf4EFYXEy7JF65qAgAAh9YCAAAU2AA==
Date: Tue, 3 Sep 2024 13:29:01 +0000
Message-ID: <ZtcPGjS9gktPuNNK@ryzen.lan>
References: <20240831190126.366600-1-fiona.klute@gmx.de>
 <20240831190126.366600-4-fiona.klute@gmx.de> <ZtbuP9we0h8B9YE0@ryzen.lan>
 <98537c50-9e0c-4bee-97af-4e4815c310e4@gmx.de>
In-Reply-To: <98537c50-9e0c-4bee-97af-4e4815c310e4@gmx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|PH0PR04MB7590:EE_
x-ms-office365-filtering-correlation-id: dff3c7b2-89c2-475f-92c1-08dccc1c5f68
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?G7JvQB7MtxiuqufAe+LmFUgVzCQLDarj1Jc5o6BTljecZHAyXByuB7nPt1?=
 =?iso-8859-1?Q?74znieB5Ee8wttkSh5xam2lSjLrPsJ4udcbtSalBoUVMAQg3Z89X0ajVwS?=
 =?iso-8859-1?Q?Tara9avaKfnGHPVMdnGM8TN3Kol6TgzMJn0p5WA3mJwsKlVVgkiww+EMNz?=
 =?iso-8859-1?Q?n3hJXlfjA/pFs4bBnfoMutqMH2e0/7k+GPQPUXzpPgmA2OwV97m0mGrZLd?=
 =?iso-8859-1?Q?G6C67TY70V3LEDJtJHbVJguPxvJrtEzjP60EWXOW/QNTwZtz/WEYqViSpt?=
 =?iso-8859-1?Q?OUYvCHlOPgLVA/GFBolZzV/RauzaIDB1zEjHSW3IgDF35JtptHxEnlJk7h?=
 =?iso-8859-1?Q?Ng2d6rKihaWV8NpwfQFWqFPqDj5PHbEoR2GQidTZSms+2Dsz+N3YPnNMic?=
 =?iso-8859-1?Q?6nxppAXF/Z5tVN+H1FJO1k1+NkeUsD6OTntBD/ynZkbi1TMK6lzS5hEm7E?=
 =?iso-8859-1?Q?3CKfdy5lLoKr0WiWNFy3xqQArQYBQfcPOIg33IHd5v6kR+fOBaKYfiYd7u?=
 =?iso-8859-1?Q?ZTkKlLKwFcx3Dg5fQtIqoRoTe/cJQSdrG4Xtupmb7z4DF2kHGxqgM6mvMI?=
 =?iso-8859-1?Q?RHmVH1WpukUtIUkjmdct+d9S1zklsQZ3VP1AG3OG9Ue+YF2q5xEpGYyW5Y?=
 =?iso-8859-1?Q?42tEAkJ8k/gu0WIrVYoCJChuXiQYyrnLdBnE/W6bzFTI0O13JFAar4S192?=
 =?iso-8859-1?Q?l7inO48aRzs8U5rqvDmLIHirKD05zy4bBkvJnjkKfbj6+A4k6n236IP8Dw?=
 =?iso-8859-1?Q?FsBcW5tuqMv7JhBNg5tOvSbpR+5aK8LZXdB1UMNNfmruIYwi2WkkAqbazW?=
 =?iso-8859-1?Q?CKZx6RMvzbu/+9rBVRpWdLEKPAhEisxZHW6pQScriKKhtDYPHH0Oq88Kiv?=
 =?iso-8859-1?Q?8RAYp2fdEZvBY7oeDmMwwE9KfyiU7fm8c52VsZDP16+iMZYooYpjYctQ9t?=
 =?iso-8859-1?Q?AU5EyHj7vUkqZRJy/XJCGgHlVyCHwC++BaVuU0vHzUfsBEG09vJAQlYE1d?=
 =?iso-8859-1?Q?Cae+rPn2lbvxRoLH40FPL0Hq32s8nA3trAP0xEuT3k5/ZERCvDKcVKlHPO?=
 =?iso-8859-1?Q?59oSrI7Gm3HZROQcICLY4+kZpbfVDyR2toQEiXQFx16f0tWQV9dBmu7F6k?=
 =?iso-8859-1?Q?N82BiYUchRFmWFtbiNCfceU4LHfZy/N4eF+Z4AVHtSaHuGXJh5hc/IafjV?=
 =?iso-8859-1?Q?mrrmPwBY9onTPvq4xoAfHV1gnXNGqwD64fB3jJ9HRe0bUbTg91KHoj88dS?=
 =?iso-8859-1?Q?lrcJn0qSrp8g8lm/XC2xY1/aBA65OfKK9Zoa7QgYztjcDvQb25gpI302YG?=
 =?iso-8859-1?Q?hW8fWd96Y68rYmmSw+Lmx2A8e43o+AuQt5LY/cA4JWm2LJYAeQxW+whtxG?=
 =?iso-8859-1?Q?X/0xjCNMqnfm/ZtaQYqc77FBNCoheRH2FHBzEj0nyXFklwzCTdzkCC84cV?=
 =?iso-8859-1?Q?vq8k71us1MFGNVUKuYPu0XOQEEGKiC70G/6/bQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sS+zsryV2p9ZLE4zpoV9wXCWs7kSs+4ypUkJ0aFjmjU/Z0rPUw6thnahBN?=
 =?iso-8859-1?Q?FYvsGZHvUK0N8U22r6jJslcW3ToRPtj/BiMBQV9xa6qyEvENmVuCsDTyVR?=
 =?iso-8859-1?Q?c4kejkuu1hFlkDqvSZ+WNrg2vYzUoTV6Wyx6JKv/K2mKXCpsaFFzQ+uOvz?=
 =?iso-8859-1?Q?yMOPTzjAqR39MTc0gyCtCwrU+ENPq0Lx7L3x+Qw0GAE5JEIltTQICDNg0Y?=
 =?iso-8859-1?Q?8FHcZtzTFpg8ZOpbtl5oc+IG/X4lOX4JaUaDZpQTvZ5pLig6MPlpYUhNxG?=
 =?iso-8859-1?Q?s3hJxuEzutQl8F6W/QDo6d7eqz7h9VGdgO91CHLFFVcs1ViMVm+2FOgt+Y?=
 =?iso-8859-1?Q?oZ4sipzIVSiWQ9eJtOlSuoT+9PHDq9rRmC1J0lcbBruPHQEE+lBQPT6JWY?=
 =?iso-8859-1?Q?XGoHcsuyAs0QiKnCe3FmKo6wdxdJHtjOm3qIjkEZJmJTDr75D68LVb9xjs?=
 =?iso-8859-1?Q?43MVe78FqIpCLGnTVcHqidfQzXhxrRPeqDnM8HJA49Inq/VpgkQeQv/CoV?=
 =?iso-8859-1?Q?f8CVRqkVXRvcdnAiH050YBPc3dbrx3YG3C8aK1pNtbBBa73+Au3rqhcy1H?=
 =?iso-8859-1?Q?bgyANv6Lf0CWlH18wGoXd2da7GFCgoSzCI1zOmluML+osDprXbbOiwHb29?=
 =?iso-8859-1?Q?3yknxjbf6Qy4xyddPO8b4d4U/ZKhy5W9kaCxuaqvDi4+dE/chclYWBJb9T?=
 =?iso-8859-1?Q?S7XZPBMeQ/jFEksZg/c/kWB3pmMMw0qEUaeM4NMarXQCV1ScS12pkBtf2J?=
 =?iso-8859-1?Q?WOY3nosE8+4aQBG1irs/IPI24ypVKabmnz0aswi5z2oFeSTUpkudgIBKED?=
 =?iso-8859-1?Q?3Tm0K4lijCKuRzig06K5YQHpav45/SaGYiTEYYVBRxqdgyPS87NF/GhVuZ?=
 =?iso-8859-1?Q?xeNuAs00hEl0tfQdyLJs1Dg7d0mQLByGgZQMqRgLFrUdGeZCv47OA3RMjb?=
 =?iso-8859-1?Q?sCMZwCiTGxpjUbLOuuU2IxuTMpg9dXsnHegmtVEZWQZhdd97LApdFFNAOG?=
 =?iso-8859-1?Q?74gVegDjWEG7MCCdwRx2lxsi1vZhsPv0XNlMU7N4p/iN9bh8rhhx4DSgRI?=
 =?iso-8859-1?Q?A80oork/53k1CH1pFbQpaddguI+nsMGxwn4NuwFmb9/ueuNextAnq2mF0/?=
 =?iso-8859-1?Q?dWN17eUdzO/n1TXmWCNQUjXdHMRw7KemsxTLPrJl9P+jaZE4jfX7ONsln4?=
 =?iso-8859-1?Q?p8CGa3Xt2Jwxn5o0Vc7c2NQ2XSjLVc4Gffn94/rXTovsYVs6kCFEhC3ycx?=
 =?iso-8859-1?Q?DsZAbj+z6Otk+EekWv4h22S/CV2DcQAYCLJMZ7YMaYwqFfe0rT452nNAtu?=
 =?iso-8859-1?Q?decvF7VnEspw78cvMZKVlAAH78R1a1mThRZiqf7hsaWz/Vm6fHT/RZDgro?=
 =?iso-8859-1?Q?urMPBtO87S6zBYEf+2TjLwYvCLQzyXC1plBjdykR++HBu+mzbycqJTDsg+?=
 =?iso-8859-1?Q?MOihqQ0NPBE0WsdmmZgyasoX92xaPB1kUiH1lPLlRrK+qxi6Zo631403+C?=
 =?iso-8859-1?Q?pB9oMqQ+gVSjQe9zyWvJ3xZ9wwP8NmVGUotYGKjDwcD1hPOrsLQ3E0ongq?=
 =?iso-8859-1?Q?bNDYymcEgCvedWNbAiq8eXin6uSKI2PKmdW4Jat4MwA67paUgUUxsPUIz3?=
 =?iso-8859-1?Q?zaQTFrJ/2qWpthBTovWqaCdSnJrq6WRfuU1LhFW8T0dc/QgrdC8dPJxA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-ID: <1CF8B0521E249A47850BCE0323C0DE5A@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: +D7qGgMzgKEKLoIl3aDztSZwfyDck+DLTOigyWtvQ9k7YKE4vIxgWCNONZr3QDw7Le5AsDf9KE8+btZT1LylMbOx/z/gVg7e5FvM4wY32tXVv3zARIb0FUPq40o96PHEiUP+rdKFLa3jiY2XRTFj+ZMct0/LgbzVatNv50StTTGKguUuOE9NmmtU01nfQ3QRjR1YdUNRYPYeVM63vjlTX42eH0Fy9kLm8QRfdNF3SwFFfkQLlbTfSmkli2bTFBzPaIIhL4KBqhte9zEI1DOUi5Nhl/2WPrcQIio6gjSaRpS3q+Mft6d7oAJagxF5cbJwPlUPkM0SdlgTlZjwqta07wL0YX2Ajn37eF6j8y3vW92vSQjNCVZXSFimcYkw2fDmMbfst4+LBIy3sq1XYraSY7dqtMRMm99t2AZK4grtpOvDTne7VVaLfqx/bQgh8lICSu2JCPBNA3fXxI97JXMwsdQ7U40+KVRGhc06NMTIzA5NAfWDGBEzaXMMUHHkldhz8MvxdKk7IhXijleC5pOJSOke7JvOi+4SJWzwHaAKlKR1/w/fdtyBZBcsqSdhUqxf3QMS34aS5oVxRb51mA0v/4eNM6xqp4MA+OluI5gehVfyP2S6cfQKPOBTNf1KGZJd
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dff3c7b2-89c2-475f-92c1-08dccc1c5f68
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 13:29:01.1326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ccjm2z6bfLmhAVjlK6ygg7UPDUQ3Uj8W+Qcw7/U9RoOlWkIJ/ss18B7fe+p+os2atKLvhNdJD0uIxN6cU+m+UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7590
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725370145; x=1756906145;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=Se1RXBHQNzi905CqLZwXdO7raJdgd3thmcY31z1NuaU=;
 b=TWoOA+wU69HMvv79SYqntfEwibIq2fqsIGWS/T0gbXTV4hf1U2rG2uh4
 LU9aijLeNSu25ZTklyN/6HYuJBPP+oMoPSiBJVfPYXQWhuWqvwxBCUuei
 zuPNbMGZU9UYVKWowrgwqKXlzvwlYfn0DDd3iSRHWHg8jul5kZQFWBGDO
 yZteTuSnQ3nVxpouqDOcT5aORgfP4A8mjgfkHsyOEL/RgmM4K+xMAJEfu
 4SMhloRo30mDAJJiwu0VrQAdJS3zxpKr+XKdcGrpV8yPJVr8rlhSsJH+W
 on+PIBk0lmfNij33tcNubNC4zLh7F96KkBFzFRnsICKcaPDTdg6UsvSz/
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQw7MyLySuvpdwq0E85ZbJmYoXEmapJvDybTBPjeeVA=;
 b=CnIVvVUcg/7ezO/rzLqnBZUu/BqkSapZAgvo8qHlwr7WA7DgqoJYxfBkASoTMr9ZTOdYlKZvgboLku9I8KfcXDcOpQjEN4eRL0+AjBQhKZhabpZq3a+uUj1Om0UO4rh0kpLYw2FMTUYJnvJ24O+mIniEYujvvzlb0frIfdrl4p0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=TWoOA+wU; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=CnIVvVUc
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH next v2 3/3]
 configs/raspberrypicm4io_64_uboot_defconfig: new defconfig
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?iso-8859-1?Q?Jos=E9_Mendes?= <jp.baltazar.mendes@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Sep 03, 2024 at 03:10:19PM +0200, Fiona Klute wrote:
> Am 03.09.24 um 13:08 schrieb Niklas Cassel:
> > On Sat, Aug 31, 2024 at 09:01:26PM +0200, Fiona Klute via buildroot wrote:
> > > From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> > > 
> > > The new config deviates from the existing
> > > configs/raspberrypicm4io_64_defconfig only as far as necessary to
> > > demonstrate booting through U-Boot instead of having the firmware load
> > > the kernel directly. The sample boot script loads the kernel from the
> > > rootfs and uses the device tree provided by the firmware.
> > > 
> > > Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> > > ---
> > > The config I'm usually using is a bit different, including using a
> > > mainline kernel (which seems strongly preferable to me), but for
> > > defconfig maintenance staying close to the other RPi defconfigs is
> > > probably easiest.
> > > 
> > >   board/raspberrypi/boot.scr.in                 |  9 +++
> > >   .../raspberrypi/config_cm4io_64bit_uboot.txt  | 23 +++++++
> > >   board/raspberrypi/readme.txt                  |  4 ++
> > >   configs/raspberrypicm4io_64_uboot_defconfig   | 60 +++++++++++++++++++
> > >   4 files changed, 96 insertions(+)
> > >   create mode 100644 board/raspberrypi/boot.scr.in
> > >   create mode 100644 board/raspberrypi/config_cm4io_64bit_uboot.txt
> > >   create mode 100644 configs/raspberrypicm4io_64_uboot_defconfig
> > > 
> > > diff --git a/board/raspberrypi/boot.scr.in b/board/raspberrypi/boot.scr.in
> > > new file mode 100644
> > > index 0000000000..a5c986ef99
> > > --- /dev/null
> > > +++ b/board/raspberrypi/boot.scr.in
> > > @@ -0,0 +1,9 @@
> > > +# Please note that this is only a sample, we recommend you to change
> > > +# it to fit your needs. You should override this file using
> > > +# BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE.
> > > +
> > > +# load kernel from the root partition
> > > +load mmc 0:2 ${kernel_addr_r} boot/Image
> > > +env set bootargs "root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA0,115200"
> > > +# boot using the FDT provided by firmware
> > > +booti ${kernel_addr_r} - ${fdt_addr}
> > 
> > Hello Fiona,
> > 
> > While I'm not a u-boot expert, I am slightly surprised to see a new
> > buildroot defconfig use boot.scr instead of extlinux.conf.
> > 
> > extlinux.conf is the default configuration format in u-boot:
> > https://github.com/u-boot/u-boot/blob/v2024.10-rc4/doc/develop/distro.rst?plain=1#L69-L71
> > 
> > Even though boot.scr still seems to be supported for backwards-compatibility:
> > https://github.com/u-boot/u-boot/blob/v2024.10-rc4/doc/develop/distro.rst?plain=1#L367-L368
> > 
> > See e.g. this buildroot commit that converted rock5b from boot.scr to
> > extlinux.conf:
> > https://github.com/buildroot/buildroot/commit/b7dbdd3d775b8e94664c6f37b11afc8a6a352e35
> > 
> > I don't see anthing exotic in your boot.scr that wouldn't work with
> > extlinux.conf.
> 
> AFAIK things like configuring watchdogs and handling A/B boot slot
> selection (with RAUC integration) aren't possible with extlinux.conf,
> and a menu isn't going to be much help in a headless system. If there is
> a better way than boot.scr to handle those I'd very much like to read
> about it.

My point was just that the boot.scr.in that you have above could easily be
replaced by a extlinux.conf instead.

I hear your argument that certain features (like watchdog an A/B boot slot)
is not possible with extlinux.conf.

But if you want your example to be minimal... isn't extlinux.conf enough/
exactly what you want? (extlinux.conf is definitely simpler for a beginner
to understand, compared to a boot.scr or a .its file.)

Your comment in boot.scr.in itself says that if you want something more fancy,
you should provide your own config.

Anyway, I'm just providing a suggestion. Feel free to ignore :)

Another suggestion is for your new defconfig to use the upstream kernel
instead of the downstream kernel. A person running u-boot has already taken
the step to use the "upstream" way of booting. It is far more likely that
such a person also wants to use the upstream kernel (rather than the
downstream kernel).


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
