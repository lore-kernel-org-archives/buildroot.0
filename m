Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADC8CE8343
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 13:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82763401A4;
	Mon, 30 Sep 2024 13:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IVbQqby0vWcW; Mon, 30 Sep 2024 13:43:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32D8E404D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32D8E404D3;
	Mon, 30 Sep 2024 13:43:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC5F91BF300
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 13:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA17B404D1
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 13:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c45MuyHQbT7J for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 13:42:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2e0c::82c;
 helo=eur03-vi1-obe.outbound.protection.outlook.com;
 envelope-from=rai.sagarzazu@outlook.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6FE69401A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FE69401A4
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03olkn2082c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2e0c::82c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FE69401A4
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 13:42:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRO+mofCsE3fg6MJ4SxUp73tkFH8i9TfVB++iDgMiScTGuhk/SR9XFkBh2ZYZBVb3wBvfXmigFmeXqnyOV73X9zaAzuzfqtAC35t0RhXZQpAa7XjjA5uzpuM31bW6rEicP2sW4EYfCo0J+8LOKakNfWKKHHjT41F+SjAHSIjsAEG1ValWAXfLaj4Tpyw+WOkHBT4kmxExCG9y1YdFby8LGm2JjpZHBGdr67mdvTaZzXfqO3fItZ4qT94qNPBkz9ZyBlB/aX2jQa0GJ6KEG3Ztj2ITwfBgfWqF/d2IgMXDaNqQHsQQx0RsVX+94YzAxjjMwnNXV2xHZYpJ0pgfgLvfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCrKM8awHmvCMKdr198B4Q8teh+H6bJ/6QJhgMxQTdI=;
 b=OWUOCaRDnBZXrHL4jPs6/KMSk8bBEHHn78iNSZ2esyja97RTWG2EnfcEWEXVONNVgJojIR78RLvJ06Du4oIH45tCEyDO1EXyO5iXwG4xav8p3orYA0XP5nV/Mp7EYBv5hDSphGL6w2RnlPdY4crmJO+Ymwh+gtg4tmYWpQ4qtNloSRXgD1I0VwETtA5H0hHaE+w18kPSLPcd1BKTdweiZcUw8t9mHdXIYMs3pGa3nNTb4Dhi0NRedx41saX1fOwIdc5c0Bruc9ArT3WPKpgYIXpC+amjXXk+qjWrtWjktHkwIRlyM4QmaLV6hg0Lwtx9qUjrNdEoKt7KUNqK6Ecn3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DU0P251MB0801.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:3bf::16)
 by AM9P251MB0072.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:41d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.19; Mon, 30 Sep
 2024 13:42:14 +0000
Received: from DU0P251MB0801.EURP251.PROD.OUTLOOK.COM
 ([fe80::f046:1b4c:d963:c913]) by DU0P251MB0801.EURP251.PROD.OUTLOOK.COM
 ([fe80::f046:1b4c:d963:c913%5]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 13:42:14 +0000
From: Raimundo Sagarzazu <rai.sagarzazu@outlook.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: package/jailhouse: small typo error when installing helper
 scripts
Thread-Index: AQHbEznrUT2SIw+oKkO8Qa4p57yO3A==
Date: Mon, 30 Sep 2024 13:42:14 +0000
Message-ID: <DU0P251MB0801A93E7F9B025DA4AF40CEFA762@DU0P251MB0801.EURP251.PROD.OUTLOOK.COM>
Accept-Language: es-ES, en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P251MB0801:EE_|AM9P251MB0072:EE_
x-ms-office365-filtering-correlation-id: efe6f9d0-470c-4139-11c3-08dce155b161
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|7092599003|8060799006|461199028|15030799003|19110799003|8062599003|3412199025|440099028|102099032|3430499032;
x-microsoft-antispam-message-info: INBfsZKsg/RDvgkks6HW5bC8ZSKYtiPaI9ZzKNaIsdPoCAR3pCMmuD/0JW0m43NTvStdpGKwFxSK74FJ2SydWn6BzxyVbCFPxQMmYuNN+R/8vcvbt0akwlpoXCjTu4i3t0iG4We4PV2zUF2Dyj0X/MTRwzU++1USU8Zm+pAswj3fjYULpf2fnpjVG7xcI5EWo3qysMqZfZFpazwnuw0lt1O3NOEPP9EsP4+2X/dXyRiLGk2Ah0PobOPJf8Sv4EdmjYAlDw6RBSpjJz7S8JGNMFx5NLKsZkEJ6s0XGH9hx2gbFuOudKrPzY4N+QwhdAvdG3Bzjk2IVAzOvC5vNHc4ZoUF4jB9FCm/qfeX+2EJUqEIwok1LUgUvw6GsWGhuUYfyBARoDU6vGQyq9rl/iG1V0Ur5RaPE0AfJV/sbwW077FJqfeQ7RxX3N1tgGQIMHIto5FBsQGj8+Wd22guGSZMzSzwcKFMaklbpaSeGLX6dtXqpOBVzbJP5aPfu16bTZUhFrk9m8qpzb8yI06s1lD/0AQSQ/1N7OIKXke/R+SSZmu4ZIQMy0At3b1ThBsDX5C8OH4p2yfyrC9BgBDVhd9/5mBY3i2yz/oqDWGjU7Hc4X1a26ausZeII5+vEm9fMA2NXc3aA4BX0jO0a2BgS3vYjKH15mFe9mpd5vuRf155R3DTPWUuwl8TUh5c8kCsJNgexOvXz+Z8Qgndh7BcBAuttsGmtOeVjy6VcgrlHifwP/z+fJqBUZX3D0cYH6ZQHbKbdT4MHRf+gm4bhWYjtNNByg==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXNNR0xHY0RSSDlMdG55Y0c1b3RTV3FFcVhrai84Sy9VaHl1eFVYY01rY3BT?=
 =?utf-8?B?MkhFcFJWY1JnWGdlc3NEQWpJTjdRTGdkTVdjSHlhUHMyZ29xUmdLVk1ObTZk?=
 =?utf-8?B?ZjFwNW51dGRmNFVTY3RxOGtRWXFQeDM5dGVHMTJWamhQSHA4Nm1NcUwzSWFs?=
 =?utf-8?B?UTZ0Q1c1SVVEZmpwN2tuTlFWMytGNzZNTWNlV1V5WUZwUkhCWHR4RnJxNTY0?=
 =?utf-8?B?R0FNNUFhM3RUVkQvYnlud1dqQlcxNzVVZXhLWU1aQlZOUlp3bFlINDJDRnBB?=
 =?utf-8?B?ZEcrU29vZFV0SzEvcnUwWHJSNnJvR3IyM1BkQ0g3UjJ5dTRjY0dCZE9rSDNP?=
 =?utf-8?B?N1Z1QnA4S3hHTVZ4Mm9IRjc2L1hwbm1Ud29MYWdrbUdoNmMzNnN5TStjUVRO?=
 =?utf-8?B?QzRQelJXdFdURzk2NTVBbFV0Qkt4aDhFQ0hENEN0ZU5ESTU0aGFndEQ4RmhO?=
 =?utf-8?B?Q093QzJMRVNab3dKM0R1dVBQOXpHUGlVK05tVjVpWEVlbDJFUGtsVFNWVWVC?=
 =?utf-8?B?S1hMb2d6OUJOMnMrS3ltRWtDK2FaS0s2dm9BUlZSL3dGWXhjMTkycDNtYkJJ?=
 =?utf-8?B?bm5sVFRUYkxHakFRTlA4UWJYM3BYRk1lTmZva2JPQ2hoeisxNmFOUDFkRGkr?=
 =?utf-8?B?UmxnWkhrNjhDbjhiWFFyMG9aanZwNnRzWUUzY0FpbDVGYUdtTHVsdnRZbEF4?=
 =?utf-8?B?ZVlOU0tNc2djaHdJMVpsY1RSQjBQWmFmZ1haNTBrYXk4OUxpQ3c4ZzgzY2Yy?=
 =?utf-8?B?ek41UjN2TGJhdGVQdDA4QkRvMGtLMGNGOUFvZ3BoZVlTRVhaNTlhcEJvTWY4?=
 =?utf-8?B?RGtIcmlUSW9pUGxGTU9lWmhWYXJaSjZFOTdMMm5pc2ZFTmdFaHRIR3dPbHlI?=
 =?utf-8?B?eDJ1VTZRY3VIbFIwY2RlYUhjVFozSEROSm9qMlhKNjdEL1JRdFlxVW5YRExp?=
 =?utf-8?B?ZFU4MmlRQ1ZRLzJGV1pxUFdwdm5Zai95anhSVmFxSWhVQUJnc1YzSmxwY2NL?=
 =?utf-8?B?NGZCYWwrNVY3NVVLbVFJWEhpT09sS0VrbmJPSXhuMkxkMjIwdVBHc2Fnb3Ay?=
 =?utf-8?B?U1Z4MVAyZWNMdU9mNUZqMkdpU3dzV0pGTEtYamY0b3cxcnpGYkpKWVhvT2x3?=
 =?utf-8?B?SGxWd0NnWE16UzBSanJKbEc2SVpicDM2WHA2Y21IM1FnWW42emlRd0w5K3NZ?=
 =?utf-8?B?RGpWUWdEcHVuaHpWUUxvc0JkTTdaREc3VnNzUXZHdWNUalVxR0c0YkhFQ29z?=
 =?utf-8?B?NXNaVVB1QUs4UjFOWG1KaDhvbkk2dzBBUjRaTm9RR1BZN1Vld0ExUkNrT1JY?=
 =?utf-8?B?NVR4c1RNSGZUdmlSU3I3VExXQkRPN1d1clVFZlhFU2lYL3RpVjg4eTRQU29Q?=
 =?utf-8?B?cHoybnFyZmN5cXRLWHk4VXZsdzRXTlJQZzNFd0o5YjNOUlcvdUx6d2RYMU9R?=
 =?utf-8?B?aWdoemE3VWJOaHJTUmxIQVRtcThNMGtxOTlsampaaXVsS0ZMMktxbVV3NFNI?=
 =?utf-8?B?am5jQVVjVTdpRGt4YXZ5Ung0ei9yMU1wMkF1N0VPTFRITlFKeWZHaEZvQldE?=
 =?utf-8?B?amwvNUdwUStkYXRPTUhjamt0QTg2MUh2MWZFTXZGMFVURTU1SlhxN0VTQ2ZE?=
 =?utf-8?Q?rZFS0ItNKYIn9nCr8kMf/FpY1YuF3yoYXx7Ll7FFwd9Y=3D?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P251MB0801.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: efe6f9d0-470c-4139-11c3-08dce155b161
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 13:42:14.3751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P251MB0072
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outlook.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCrKM8awHmvCMKdr198B4Q8teh+H6bJ/6QJhgMxQTdI=;
 b=A9/RwuiLHpZ54J4uQy7OVlDyaJfJJJHgKBtDKoJ8MgGtFMjnDKBcKs86KeotV0KXHVJ91UASI0fz/Gpi6pMPJW76JUv5TjtfX8igZJJYcIdqbbkfyiY7PPVlk4MD2YyfNBd/sMgMOl8q1O+GvK1uSATBvRZkuL6Ku0V+iLoVQkLamxC8ctkDBR63CJEE/QjhKjNpsW7LPzQ7rwhxRshuwDzRyTj6MuXkOdpyEj3fg7Q4tfSWg4H2xcxyGg4GMGORJczixwNPDRngqQYoTgVAm9V/mstwpw0QHp1hUw78s3MPNVQl6Zxj7n6olllfH/4/9lb+ELWMr9AtBAt7zhHoZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=outlook.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=A9/RwuiL
Subject: [Buildroot] package/jailhouse: small typo error when installing
 helper scripts
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
Content-Type: multipart/mixed; boundary="===============8008984085011574723=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8008984085011574723==
Content-Language: es-ES
Content-Type: multipart/alternative;
	boundary="_000_DU0P251MB0801A93E7F9B025DA4AF40CEFA762DU0P251MB0801EURP_"

--_000_DU0P251MB0801A93E7F9B025DA4AF40CEFA762DU0P251MB0801EURP_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

LS0tDQoNCmRpZmYgLXJ1cCBhL3BhY2thZ2UvamFpbGhvdXNlL2phaWxob3VzZS5tayBiL3BhY2th
Z2UvamFpbGhvdXNlL2phaWxob3VzZS5taw0KLS0tIGEvcGFja2FnZS9qYWlsaG91c2UvamFpbGhv
dXNlLm1r4oCC4oCC4oCC4oCC4oCC4oCCMjAyNC0wOS0yNyAxNzowNzoxMy4zMjU2NzMzNzYgKzAy
MDANCisrKyBiL3BhY2thZ2UvamFpbGhvdXNlL2phaWxob3VzZS5ta+KAguKAguKAguKAguKAguKA
gjIwMjQtMDktMzAgMDk6MDM6MzYuOTk4MzUwNzkwICswMjAwDQpAQCAtNjMsNyArNjMsNyBAQCBk
ZWZpbmUgSkFJTEhPVVNFX0lOU1RBTExfSEVMUEVSX1NDUklQVFMNCiDigILigILigILigILigIIk
KEhPU1RfRElSKS9iaW4vcHl0aG9uIHNldHVwLnB5IFwNCiDigILigILigILigILigILigILigILi
gILigILigILigIJpbnN0YWxsIC0tbm8tY29tcGlsZSBcDQog4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCCJChQS0dfUFlUSE9OX1NFVFVQVE9PTFNfSU5TVEFMTF9PUFRTKSBcDQot4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCLS1yb290PSQoVEFSR0VUX0RJUikpDQor4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCLS1yb290PSQoVEFSR0VUX0RJUikNCiBlbmRl
Zg0KIGVuZGlmDQoNCg0KLS0tDQoNCiAgUmFpLg0KDQo=

--_000_DU0P251MB0801A93E7F9B025DA4AF40CEFA762DU0P251MB0801EURP_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxwcmU+PGRpdiBzdHlsZT0iZm9udC1mYW1p
bHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGli
cmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAs
IDAsIDApOyI+LS0tPC9kaXY+PC9wcmU+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5
bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRT
ZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsg
Y29sb3I6IHJnYigwLCAwLCAwKTsiPg0KZGlmZiAtcnVwIGEvcGFja2FnZS9qYWlsaG91c2UvamFp
bGhvdXNlLm1rIGIvcGFja2FnZS9qYWlsaG91c2UvamFpbGhvdXNlLm1rPC9kaXY+DQo8ZGl2IHN0
eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250
U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7
IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCi0tLSBhL3BhY2thZ2UvamFpbGhvdXNlL2phaWxob3Vz
ZS5ta+KAguKAguKAguKAguKAguKAgjIwMjQtMDktMjcgMTc6MDc6MTMuMzI1NjczMzc2ICswMjAw
PC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9u
dCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBm
b250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCisrKyBiL3BhY2thZ2UvamFp
bGhvdXNlL2phaWxob3VzZS5ta+KAguKAguKAguKAguKAguKAgjIwMjQtMDktMzAgMDk6MDM6MzYu
OTk4MzUwNzkwICswMjAwPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFw
dG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNh
LCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCkBA
IC02Myw3ICs2Myw3IEBAIGRlZmluZSBKQUlMSE9VU0VfSU5TVEFMTF9IRUxQRVJfU0NSSVBUUzwv
ZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0
b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVs
dmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7
Ij4NCiZuYnNwO+KAguKAguKAguKAguKAgiQoSE9TVF9ESVIpL2Jpbi9weXRob24gc2V0dXAucHkg
XDwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZv
bnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsg
Zm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQombmJzcDvigILigILigILi
gILigILigILigILigILigILigILigIJpbnN0YWxsIC0tbm8tY29tcGlsZSBcPC9kaXY+DQo8ZGl2
IHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNG
b250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEy
cHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCiZuYnNwO+KAguKAguKAguKAguKAguKAguKAguKA
guKAguKAguKAgiQoUEtHX1BZVEhPTl9TRVRVUFRPT0xTX0lOU1RBTExfT1BUUykgXDwvZGl2Pg0K
PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9z
X01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXpl
OiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQot4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCCLS1yb290PSQoVEFSR0VUX0RJUikpPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZh
bWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2Fs
aWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2Io
MCwgMCwgMCk7Ij4NCivigILigILigILigILigILigILigILigILigILigILigIItLXJvb3Q9JChU
QVJHRVRfRElSKTwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19F
bWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fu
cy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQombmJzcDtl
bmRlZjwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRl
ZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJp
ZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQombmJzcDtlbmRpZjwv
ZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0
b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVs
dmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7
Ij4NCiZuYnNwOzwvZGl2Pg0KPHByZT48ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9
ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2
aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29s
b3I6IHJnYigwLCAwLCAwKTsiPi0tLTwvZGl2PjwvcHJlPg0KPGRpdiBjbGFzcz0iZWxlbWVudFRv
UHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0
b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNp
emU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0KPGRpdiBjbGFz
cz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVk
ZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNl
cmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCiZuYnNwOyBSYWku
PC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBB
cHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBI
ZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAw
KTsiPg0KJm5ic3A7PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_DU0P251MB0801A93E7F9B025DA4AF40CEFA762DU0P251MB0801EURP_--

--===============8008984085011574723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8008984085011574723==--
