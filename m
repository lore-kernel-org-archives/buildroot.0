Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A01C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 12:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E70E340A76;
	Tue,  5 Apr 2022 12:15:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7SqrZvcARDj7; Tue,  5 Apr 2022 12:15:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFE014055F;
	Tue,  5 Apr 2022 12:15:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B65A1BF846
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 12:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 151548271D
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 12:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=orolia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HRmkvY16lCdj for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 12:15:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6343F8145F
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 12:15:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlXKasLqszTYNSz3ssvwenVCi55bfBWppkloQ9v5G5vxH3jvhV6ooikqInQSXKmdZ/diJGl9KlLsmuWiz5Hm/sGHXZRYIIkw0/2BdwYOgj6QpMWJBnON4Du4+a416oxHtiuPbdkzVSpU1Tfr2cc/t8bZhd014QuGFNHVIviWEw2jaJPs9oW4IXLnL2Pnic6FwijGK/+nV4/Sd2ytGyAiOnXJb0O5ac07pPQZNMIaMgNJRvzeXkp6tfrwqYHy/Nyyy7B47NIH5zV4K8c5PBepyePLRC44DrEjL4FSe64jjMd6cmwyud8U2buAG5gdWhJEauYN3dC2oReLWk4+XLItDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCtFThohQc/bqOIbyAYvPutkEKzRS+IMmsUi5k+tlg4=;
 b=ki8NHH8taJcTLjBnbJBHaetQwPjAMEEPZXi4OF1lHzJTpatjyyJENoE0nmCEw1Exj+rPZF0R5sUbmV//BvlUTAHYuxsOptJZj6cXUfB8jYW3CWbam/1OgWkdUUXVZo1zgVVMBeP4T9pxdtFMMmGZw2tGuHtfE8zuPEomXE3UGYn9bYCiA99xc/ziIRVzNIxxbzOvd4QFy2ZzidMa93hNnlDRyp2w1BwabtatQMktkSEwKF3X+zlRdlroppcHwVhROUcv8DsMYfVFS6Wn/LzjfSejud7cKFzmXU2QMCjV9Xj8ha9JEuR2wn69dK4o6onP1MQixfk6yDdRQLHumVV2YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orolia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCtFThohQc/bqOIbyAYvPutkEKzRS+IMmsUi5k+tlg4=;
 b=Z6SvyWwO0Knm1PfsuNNC8xF5GEc4PKq4TD87BHxLBYU0uNFBq/EBj9srJPQ47Ye6hCsb/qICPQYGsfY9pRXO+abg//Kv8C61cAyZUCFGmnE59l0GN1Pzgk1Y4s74iIYxmJVayrO0BoUWJUDKSBI4BaXFZ5hpXsixLCetU1q6Q5g=
Received: from DU0P251MB0779.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:3a4::16)
 by DB9P251MB0473.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:33e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 12:15:14 +0000
Received: from DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
 ([fe80::bd71:8465:bc3:b72e]) by DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
 ([fe80::bd71:8465:bc3:b72e%6]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 12:15:14 +0000
From: Tim Hammer <Tim.Hammer@orolia.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
Thread-Index: AQHYSLVQ1NO7vzXZKUeYGkY5EMcBFKzhOUPg
Date: Tue, 5 Apr 2022 12:15:14 +0000
Message-ID: <DU0P251MB07793F7BF68D17755B50F5F1E3E49@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
References: <DU0P251MB0779CD19DBCAA7F149788B41E3E49@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
 <CAPi7W83fzfin6_1KXV8BTy=AmcguoAK86mm4bFRrviFHBKmPbw@mail.gmail.com>
In-Reply-To: <CAPi7W83fzfin6_1KXV8BTy=AmcguoAK86mm4bFRrviFHBKmPbw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d59be411-d7e4-4e9f-f46e-08da16fdf0a8
x-ms-traffictypediagnostic: DB9P251MB0473:EE_
x-microsoft-antispam-prvs: <DB9P251MB0473140F492451818562F30FE3E49@DB9P251MB0473.EURP251.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jqk7XIa7jzfcrSqUU0aQTzQxeoseinTafg+OhH0pzPC7EqGCDmvfpS4rhRHxpQv5uSBa5fsnpwspplCmVxMG5fL1o4luQcaNi1v56/lY/GmjYLI5V6XGTbSakj8qYVh0KkGbJWgocGvKWN6XrmD4iI46GjD4Sm781ZdahA0EQ3jLoINeqwYvNVC72bkuT/W/RNwR2mE9DjkGPB/yhL7NVtCA8GMYGD4GLkVVG7no6zSmY95N0d6O6EsvA1iaD77jcEvWpQKFtzKP6YH494UTRbeImAhVZ3lWl8Jr6z52o4qVjWbDzRvUCTWeC+bhlBydwGUH44Tda6WrKpij6EN69KfTsFU22DO97dT0USs7QMBI59YwZ80juWSo7ADZ5pSARLfdncM8tMtr/mjtbnOH9GfZTIX/4OrRjUPASBfsoNB90PG8tzGceGfkIfibsilDzsexy/gGdfJ5dUv6+KIkGRIqz9OQnm3VXXs9XARhffvoYh/smeede0928zhku/dO6LZ/VdNN0K+kWganKvphEOVc0ZPd2um5DBXjXyHvKErAPLVu4hjvTxiQ5V+bQ67N9Et/isEVgSRVSWZWZ6FUbV77oREuyVWV71cfSfEN6J/olagHAQtZKzEbYTxFn0us7WH2nrmOfocnqsmu7BUnwF3kbLs8dcfXXnR0tbxsYcSit1ZJ4snuqgO/ANA1fmzdgtCcfK6B3yNIU4oOn4HMLpUTiqBFqr9aN3WVrBLzim6tlhBAiNCbXDLL2gvjsLjyrVgI+heDu1eVSxh5shdpZPnFDq3YV/xlz560giyJrAs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0P251MB0779.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(66946007)(8676002)(38070700005)(76116006)(6506007)(9686003)(66556008)(66476007)(66446008)(64756008)(86362001)(83380400001)(4326008)(52536014)(7696005)(8936002)(186003)(2906002)(316002)(71200400001)(122000001)(38100700002)(66574015)(966005)(5660300002)(55016003)(6916009)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2VPYjIzd1UvZ2hlbFFNYU1NMGJNUVUrT2Vhcm5NZFQ3NkVWckQxVnJVYkRG?=
 =?utf-8?B?QTdDWTZ0d3VQMGZ5NGVLQytwQTlqUkdJVnNkMjRtMlVBK3hKTUtVSnlsemx5?=
 =?utf-8?B?bEhDZHhRM01CYTNmMnl1M08zNlFVbUN2clBzVS9lZGtrZGllbzIxb2VxSGw4?=
 =?utf-8?B?b3RFVWo0V3g2cldPS3B4WjVIWEMwMHBSdWwybXd4L2ZJdCt1ajVIbkxWa29q?=
 =?utf-8?B?TDF4T1cxZWRzOHR6ZjM0bjVhSm1HZlFlUjZCbUg4bkZVdUdzUklRMGxNWUVC?=
 =?utf-8?B?YWRZTUt1aHRwS1pVbGZGU05iWG1oOTV5ZW92WEEwTVFVTXMyVU44bVR5ZUNl?=
 =?utf-8?B?a0VSZlhYR1RPaW8wZXhEaGJzNC9lZ2x0RGxKc01ZSU5ubndVWU1rTVQrM3hv?=
 =?utf-8?B?OHBlWXIrVmNydUR5MjJUVk9SUW9MdkliT25ZODRzeHRIaHJvWGF0UW10MXdl?=
 =?utf-8?B?NFc3c1JzMThZMG1TZFN0T3ZzdUpDcWkzb01QVEFHa1p2c1hBWXJEUXU5Skxt?=
 =?utf-8?B?UFQzeFMra1pZT2YrcnowL2l1VGJjQkRTMkIxa056dHJPeDNQT21uZWgwSEU0?=
 =?utf-8?B?Ymk2VDNuS2dZdUVOQUR1L0VsT2NFbW1WNnlSa3E3aGRpUTlIbkVwZkFJNjdZ?=
 =?utf-8?B?aXgvcjQzTElDL1pNc2xTTndMaGcyam5yZFQxeGpJK0pSMHdaeS9uRjcyc1M1?=
 =?utf-8?B?WTJRdTB5Y3I1QnlNbHYza0VTT1ZyUkhwcFJ0VDh1Y2g1YTY4a010RW16M2tH?=
 =?utf-8?B?aE40YWlmMUphODVDTjk2MHF0dGpsUnhibENiakI5TDNQVHBNV1lIRnNZS24r?=
 =?utf-8?B?NzFaenZiVjIxZU4xWXBacUs0UTlmR1NhcFhJRFA5OGE4eEROem9iSnVuTmRx?=
 =?utf-8?B?MkI4bzJtR1BVUjM0emNQaDZYaWFwdVlIdW54bVp2ald6R1FnUDhhNjFEcTBK?=
 =?utf-8?B?NTE5aVZjaFpEanFXbGcwcUt3dzVBN3hXWmxyQ3BkWFBlS1NiU1kzVURyOVlM?=
 =?utf-8?B?eFNVVTE4QTVaditwREtjMTdNVHI4ZE9UMHlDbGVQMkNXTkFRNUo0YjIwSVQz?=
 =?utf-8?B?TmVQZHB6RGY4RU14SUZnbTN4Y0tlSS8vd0N0Q3NOa2ZQTU9lTHZJczJaWllq?=
 =?utf-8?B?TGh3R3gxOWtiWmoyTFJZRlZFV3E3cDRsVTNpRnBCSk9RdFBBUUhWSGwwTjh0?=
 =?utf-8?B?M245Znl4RUtBMEJGbnd1blVHYnRTK09zS3RHQWVVTWI1SWNrRE5rTHdDQkxq?=
 =?utf-8?B?M0hMV2crUk9LS25RT0NjOWNBMUJacXJGS0F0S29NZU5tZ0JhWExia2pGK2Rj?=
 =?utf-8?B?c2FlREE0SUVkY1ZHdmZEMC9ZRzNGeGkwT1ZWSlM0TFpmUnI3QjJGTXZ1clV5?=
 =?utf-8?B?TW1SakJDR3MrTDNNR3ZrMjJEQjJYMU13VGd5MllFblpwbnpkQzJiOEhEOFpQ?=
 =?utf-8?B?dmIvaEVRZ1ZjMEFjaFI2Tm1tRkh6OHJ2WFRaSU11VGh4RmtyOVZpSDlRZllR?=
 =?utf-8?B?Y2VoU3ozTVRqL2hoWktjL0FnNVArNFZJMmZxSmZYcXM0MjYxY0RqYm5oKy93?=
 =?utf-8?B?TW9kTjUzK1pQWkJJK25GN2l5cmlkc2RLK2pvdld1NFFNY29QbGdsRytCVlZy?=
 =?utf-8?B?TWFkQWxiSEdhUVFRTUMzQzUyU05uayswZWQ1eVhuS0sxRm5kcnNrdjFqQ1FE?=
 =?utf-8?B?MCtuZWRPK0hFSDRnMjBSWEJOQUk3VHJIOGYyM2ZET1ZVdytmbGtWa3Y1L1FX?=
 =?utf-8?B?djNTV21xMVJ6TFdyNEhCbVA4aXltdzVwd1dvOTc5Tm5YdU10Yjc0UTA4K2Fm?=
 =?utf-8?B?bnI2aERwNzJseVVjZHRDZ0xFc1JER01Rb0txQTVqN2VGR285QVk5NXZDbTVq?=
 =?utf-8?B?RkN0TkkzTkM1REVqWER5bkkySHc2RlpON00vWkZuQ0RSMGw3WW94ZW5UUHMx?=
 =?utf-8?B?VmhQRjZsV1RuS01MWWl0aGlyc0w5NkRncm5iWC8xL1BRL1RRMVJqcUFnNHZv?=
 =?utf-8?B?eXVzaml3UnRzSDRTbTZNbUNUdTgzVkFpSzVqNnNOblZGcDZObUd4T2RBYjBJ?=
 =?utf-8?B?c0l1aXk4MkgrL2dYLzVJK1E1TWtBWHVmdjlVaVZCdWlRNzVsRDZGQm5KQlFv?=
 =?utf-8?B?VmRuMko1L0RGRXcwaTNzWGtTWnpSSUtRcE16eGFZVExKWldBb2xNTGNKNndY?=
 =?utf-8?B?bmZXWmZZdnUrdG5TamY1am96VEVWQTlVWnJhQjZBdU50d2FqU2pNVVdQSDh2?=
 =?utf-8?B?eDhoWVhqTEMvZmZsWFVnNnBqTktXOWxzbitnMXhOcHduR3NLT3BhbURPc1pC?=
 =?utf-8?B?aXRQWmR2UTJQTFg2NHpGNWVYblZVZS8xUUdpbk9rVnM5NFpPNTlBclloZ3Uv?=
 =?utf-8?Q?L5VI9jUKyo8A6thODT1iAelaCF934/CYobvCEIjN69EBg?=
x-ms-exchange-antispam-messagedata-1: jfQnghzMWksdZw==
MIME-Version: 1.0
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d59be411-d7e4-4e9f-f46e-08da16fdf0a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2022 12:15:14.4925 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9JuWhfa/GxK2P3HDCgYYoXIyWfeB9NfDPZ0q/YErkjeUJroqqqU1I6M5rVbNBOfebsJgjLCXDZRw4CdRz1Kldw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P251MB0473
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBBcHIgMDUsIDIwMjIgYXQgMDg6MTk6MDhBTSArMDIwMCwgRmFicmljZSBGb250YWlu
ZSB3cm90ZToNCj4gRGVhciBUaW0sDQo+IA0KPiBMZSBtYXIuIDUgYXZyLiAyMDIyIMOgIDA1OjU0
LCBUaW0gSGFtbWVyIDxUaW0uSGFtbWVyQG9yb2xpYS5jb20+IGEgw6ljcml0IDoNCj4gPg0KPiA+
IE9uIFN1biwgQXByIDAzLCAyMDIyIGF0IDEyOjAzOjE4UE0gKzAyMDAsIEZhYnJpY2UgRm9udGFp
bmUgd3JvdGU6DQo+ID4gPiBVc2UgaW50ZXJuYWwgYmluZCBhcyBkaGNwIGRvZXNuJ3QgYnVpbGQg
c2luY2UgYnVtcCBvZiBiaW5kIHRvIHZlcnNpb24NCj4gPiA+IDkuMTYuMjYgaW4gY29tbWl0IDhh
ZGVhZWM4YWZhY2JjNjgwZWRlYmFlOTE1MjRmNjE0NDkyNmFjOTIgYW5kIHVwc3RyZWFtDQo+ID4g
PiBkb2Vzbid0IHBsYW4gdG8gZml4IGl0IGFueSB0aW1lIHNvb246DQo+ID4gPiBodHRwczovL2dp
dGxhYi5pc2Mub3JnL2lzYy1wcm9qZWN0cy9kaGNwLy0vaXNzdWVzLzIzMyNub3RlXzI3Njg4Mw0K
PiA+ID4NCj4gPiA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9pbmNsdWRlcy9kaGNwZC5oOjkx
LA0KPiA+ID4gICAgICAgICAgICAgICAgICBmcm9tIGN0cmFjZS5jOjI5Og0KPiA+ID4gLi4vaW5j
bHVkZXMvb21hcGlwL2lzY2xpYi5oOjUxOjEwOiBmYXRhbCBlcnJvcjogaXNjL2Jvb2xlYW4uaDog
Tm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KPiA+ID4gICAgNTEgfCAjaW5jbHVkZSA8aXNjL2Jv
b2xlYW4uaD4NCj4gPiA+ICAgICAgIHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+DQo+ID4gPg0K
PiA+ID4gICAuLi4NCj4gPiA+DQo+ID4gPiAgIyB1c2UgbGlidG9vbC1lbmFibGVkIGNvbmZpZ3Vy
ZS5hYw0KPiA+ID4gIGRlZmluZSBESENQX0xJQlRPT0xfQVVUT1JFQ09ORg0KPiA+ID4gQEAgLTIx
LDExICsyMywxMiBAQCBESENQX0NPTkZfRU5WID0gXA0KPiA+ID4gICAgICAgQ1BQRkxBR1M9Jy1E
X1BBVEhfREhDUERfQ09ORj1cIi9ldGMvZGhjcC9kaGNwZC5jb25mXCIgXA0KPiA+ID4gICAgICAg
ICAgICAgICAtRF9QQVRIX0RIQ0xJRU5UX0NPTkY9XCIvZXRjL2RoY3AvZGhjbGllbnQuY29uZlwi
JyBcDQo+ID4gPiAgICAgICBDRkxBR1M9JyQoVEFSR0VUX0NGTEFHUykgLURJU0NfQ0hFQ0tfTk9O
RT0xJw0KPiA+ID4gK0RIQ1BfQklORF9FWFRSQV9DT05GSUcgPSBCVUlMRF9DQz0nJChUQVJHRVRf
Q0MpJw0KPiA+ID4NCj4gPg0KPiA+IFRoZSBvbmx5IHBsYWNlIEJVSUxEX0NDIGlzIHVzZWQgaW4g
dGhlIGJ1bmRsZWQgYmluZC05LjExIGlzIHRvIGJ1aWxkIGxpYi9kbnMvZ2VuLCB3aGljaCBuZWVk
cyB0byBydW4gb24gdGhlIGhvc3QuDQo+ID4gU28gdGhpcyBzaG91bGQgYmUgdGhlIGhvc3QgY29t
cGlsZXIsIG5vdCB0aGUgdGFyZ2V0Lg0KPiA+IEkgZG8gbm90IGtub3cgdGhlIGJlc3QvY29ycmVj
dCB3YXkgdG8gaW5kaWNhdGUgdGhpcy4gVG8gZ2V0IHBhc3QgdGhlIGlzc3VlIEkgY2hhbmdlZCBp
dCB0byAnL3Vzci9iaW4vZ2NjJy4uLg0KPiANCj4gVGhhbmtzIGZvciBzcG90dGluZyB0aGlzLCBJ
IGJhc2ljYWxseSBjb3B5L3Bhc3RlZCB3aGF0IHdhcyBkb25lIGluIGJpbmQubWsuDQo+IFRoZSBj
b3JyZWN0IHdheSB0byBkbyB0aGlzIGlzIHRvIHVzZSAkKEhPU1RfQ0MpIGluc3RlYWQgb2YgJChU
QVJHRVRfQ0MpLg0KPiANCg0KVGhpcyBpcyB3aHkgSSBzYWlkIEkgZG8gbm90IGtub3cgdGhlIGNv
cnJlY3Qgd2F5LSB3aGVuIEkgdXNlICQoSE9TVF9DQyksIEkgZ2V0DQogICAgID4+PiBkaGNwIDQu
NC4yLVAxIEJ1aWxkaW5nDQogICAgIFBBVEg9Ii9ob21lL3RoYW1tZXIvUHVibGljL2J1aWxkcm9v
dC9URVNUL2hvc3QvYmluOi9ob21lL3RoYW1tZXIvUHVibGljL2J1aWxkcm9vdC9URVNUL2hvc3Qv
c2JpbjovaG9tZS90aGFtbWVyLy5sb2NhbC9iaW46L2hvbWUvdGhhbW1lci9iaW46L3Vzci9sb2Nh
bC9zYmluOi91c3IvbG9jYWwvYmluOi91c3Ivc2JpbjovdXNyL2Jpbjovc2JpbjovYmluOi91c3Iv
Z2FtZXM6L3Vzci9sb2NhbC9nYW1lczovc25hcC9iaW46L29wdC9hbHRlcmEvbmlvczJlZHMvYmlu
L2dudS9ILXg4Nl82NC1wYy1saW51eC1nbnUvYmluOi9vcHQvYWx0ZXJhL25pb3MyZWRzL3NkazIv
YmluOi9vcHQvYWx0ZXJhL25pb3MyZWRzL2Jpbjovb3B0L2FsdGVyYS9xdWFydHVzL2Jpbjovb3B0
L2FsdGVyYS9xdWFydHVzL3NvcGNfYnVpbGRlci9iaW4iICAvdXNyL2Jpbi9tYWtlIC1qMSAgLUMg
L2hvbWUvdGhhbW1lci9QdWJsaWMvYnVpbGRyb290L1RFU1QvYnVpbGQvZGhjcC00LjQuMi1QMS8N
CiAgICAgTWFraW5nIGFsbCBpbiAuL2JpbmQNCiAgICAgQ29uZmlndXJpbmcgQklORCBsaWJyYXJp
ZXMgZm9yIERIQ1AuDQogICAgIGNvbmZpZ3VyZTogV0FSTklORzogdXNpbmcgY3Jvc3MgdG9vbHMg
bm90IHByZWZpeGVkIHdpdGggaG9zdCB0cmlwbGV0DQogICAgIGNvbmZpZ3VyZTogZXJyb3I6IEJV
SUxEX0NDIG5vdCBzZXQNCiAgICAgbWFrZVszXTogKioqIFtNYWtlZmlsZTo0MjogYmluZDFdIEVy
cm9yIDENCg0KDQo+IEhvd2V2ZXIsIEkgYXNzdW1lIHRoYXQgQlVJTERfQ0MgYW5kIEJVSUxEX0NG
TEFHUyBpbiBiaW5kLm1rIHNob3VsZA0KPiBhbHNvIGJlIHVwZGF0ZWQ/DQoNCkkgZG8gbm90IGhh
dmUgdGhlIGlzc3VlIGJ1aWxkaW5nIGJpbmQgKDkuMTYuMjYpLCB0aGVyZSBsaWIvZG5zL01ha2Vm
aWxlLmluIHNlZW1zIHRvIGJlIGJldHRlciB3cml0dGVuOg0KDQogICAgIGdlbjogZ2VuLmMNCgkk
e0hPU1RDQ30gJHtIT1NUX0NGTEFHU30gLUkke3RvcF9zcmNkaXJ9L2xpYi9pc2MvaW5jbHVkZSBc
DQoJJHtIT1NUX0xERkxBR1N9IC1vICRAICR7c3JjZGlyfS9nZW4uYw0KDQpQZXJoYXBzIHdlIHNo
b3VsZCBiZSBwYXRjaGluZyB0aGF0IGZpbGUgaW5zdGVhZCBvZiB0aGUgY29uZmlnPw0KDQo+IA0K
PiBDb3VsZCB5b3Ugc2VuZCB0aG9zZSB0d28gcGF0Y2hlcyAoZGhjcCBhbmQgYmluZCkgdG8gdGhl
IGJ1aWxkcm9vdA0KPiBtYWlsaW5nIG9yIGRvIHlvdSBwcmVmZXIgdGhhdCBJIHNlbmQgdGhlbT8N
Cj4gDQoNCkkgY2FuIHRyeSBvdXQgbXkgb3RoZXIgdGhvdWdodCBhbmQgc2VuZCB0aGF0IGluIGEg
d2hpbGUgKGlmIGl0IHNlZW1zIHRvIHdvcmspLg0KDQo+ID4gLi4uDQo+ID4NCj4gDQo+IEJlc3Qg
UmVnYXJkcywNCj4gRmFicmljZQ0KDQouVGltDQpUaW0gRC4gSGFtbWVyDQp0aW0uaGFtbWVyQG9y
b2xpYS5jb20NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
