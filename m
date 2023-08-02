Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90876C001E0
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 15:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E1CF40AFC;
	Wed,  2 Aug 2023 15:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E1CF40AFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1f_Lnw6ni_VT; Wed,  2 Aug 2023 15:39:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3007340502;
	Wed,  2 Aug 2023 15:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3007340502
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E6B2F1BF372
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 15:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFB2740AFC
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 15:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFB2740AFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UXWN676EM8fO for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 15:39:41 +0000 (UTC)
X-Greylist: delayed 905 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 02 Aug 2023 15:39:40 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A31C400B9
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0726.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::726])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A31C400B9
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 15:39:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=LRlwK/KJQmTvbWNj2SeRX8LEKoq1TiN4tXdRhlYc3JkS7pqiGoOtfLIokRZJa0UsAsYhlGWPyis6QcfdRv2XKfXj9P2F6Q+rBhmcWjVIh/gfl3bJtV3j96I4T8fDRCogtSC8LYsVqezdoxJDjcL+KIwLBvt5Qj0xPVUgQfxhISNcoh2/MoTaFLlw8Y4Xb6l8+Jih7ek5NaaN9IFx6EjBG4FGhumvf3IVaREZvi8wOAuhQ2Ie1a8c7CdwhcKLE8kzb23gPhfgUfVmRECot1fe8N7eEDbU2KRnX1wAgLCKMtlYRGgWozENc4kzc97pM+CVzt/O32T64Ez6Coji8V75Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuzLctm4WYXBY+uIC3OneTpdBndgsPVnJH5HXDb8khM=;
 b=dh/08e1vWbI6PmIqImvAwcDr3vxLuhvPfM7EiBjtAEQqE7ZeQDbPY5d7ifEcbhOv10diGeGEI1rwttepGiqN+a/BKyRVLVEBbJ1tu2dIgnjM+E0TJlPwkLXRbolaoC7IBy8SUxldgtJZ+I+DKgMzVPIOG3BhjeTdMfvK8ceHHlUt3vmBtQQFZhalINqqGulLkBpHjbeqC5DFHveo/RW+ElmJRYWeCAGFL4/6Nh/TuXkuHfXbWj/tkW/XdxCI/IAAYQ8mf78GdAHwXMqmVb/exRDwqNXXM/rAULPMhxb0G69mwv35ouf1XDwciKHQB7Y7+V0TdVsUfiDotzQnAjncOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1268.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:189::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Wed, 2 Aug
 2023 15:24:27 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::d2cc:98b7:dd97:e8fe]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::d2cc:98b7:dd97:e8fe%7]) with mapi id 15.20.6631.043; Wed, 2 Aug 2023
 15:24:27 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Nick Betteridge <lists.nick.betteridge@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [External] - [Buildroot] Arm cortex-a55 problem when building
 busybox
Thread-Index: AQHZxU3QaV2NiogNjk+ESX8GwtRrma/XHxDg
Date: Wed, 2 Aug 2023 15:24:27 +0000
Message-ID: <PH1P110MB1603A41B40688C71A511E6D19F0BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <38cce51d-40e8-1e28-ed5a-0d2c9f8a710a@gmail.com>
In-Reply-To: <38cce51d-40e8-1e28-ed5a-0d2c9f8a710a@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1268:EE_
x-ms-office365-filtering-correlation-id: 39c3f492-b9f2-45e1-7712-08db936c8f62
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gvpOR5zh2m0GPbDXvPwHNF7imlQskftfHz8uh7FZCCdTosvQjOPLfYrysfZNmwATCkWzaFWkwcXlru4DoezAaNk+pv2smHnyZgfqQj7mvZIRxvpWdE0vynAhwmyZpMLtxewWs3t+WlmjTPW81+1HV62Iynx26mDiUGPV1uuRJR7PEkr+gy9I05H7yiWoHBlMgvPJw3+JXPUB0swwICH4RTKRJJqEVgpDHS1P/DhqcHDX8TwGeHF9D5c+2TKX6ueNzOfAQQInZ/OZ5T6DG0ZvP6rnmjzQVYa8zP7sesy+evnSHPHEWus+wksUGnx2k16wq+9K5/iponru8aOdPJinwutghyLqTUVD8wzeS2Um8kTU9eWXYjeO/01kDUQLkTQFfVDLNbJ0T8ahddRZa2V9wdOrCvKXJGAMMzSEKGZWxWXAYYud1ytrjUTn+jJ4L7C3ucAKFmpny6mbF2NKnE29swo/2wNUUKhSPMyJ9LMlE1KkjHWCOuAT2rGuLg6CgvJhGFLrmBhHTelJfn7Pi7UEelWYTenDaXfsu1SV1K58iNiUlAoiSYeKgBIvn+/UDqxVnwHGl7WEmevGHYFZTMQ2e7Rl7sFL1+wspboxUzLk75A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39830400003)(136003)(396003)(451199021)(52536014)(5660300002)(2906002)(55016003)(66446008)(64756008)(66476007)(66556008)(66946007)(76116006)(8676002)(8936002)(41300700001)(508600001)(110136005)(71200400001)(7696005)(9686003)(966005)(53546011)(38100700002)(26005)(186003)(6506007)(83380400001)(33656002)(38070700005)(41320700001)(122000001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: exxf6WBpRQjCsrhp9nj9N9E6F47ReQAmj969yQ4xbZjHzEkZsKgw1REuYbZm7PadWuvGRXLIXFtru89CKtuS6NGNc/0H9YuLkBVnhjiGc+TgWnlxs7Rdc5uu+oYcYgSDl9csQpXCsbINbpaH/0TQxLsSy4+PqB25INDlGcxeEzoQdnU69vZyDpXKMqe8lmQJJ0h0MIEaXKEYI+ROq+UEg8t3uoZmIxlylMZrWfHYjBW9LhpBMvtjrqELr9KfY56kIJbRw9uizWPygeOIP9vsU6U4JYP6/3i2SbieqBst/TnwiArGMEuiXEv/Dh12ggFoy6usSr00dnWAxqS8qx7fx21p9IF071T9v3VDTuu1yObAVlNx41HlYznyTr+rv72kqE0v6FruyKh36B7zWg5ilV7zH4z+LNfEarLNs7nNfzY=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c3f492-b9f2-45e1-7712-08db936c8f62
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 15:24:27.4320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1268
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuzLctm4WYXBY+uIC3OneTpdBndgsPVnJH5HXDb8khM=;
 b=JrMvY8rKqD0s4kcShBEJ6qzKf/NvTWWorv5GdViWhFqpfhjBSxN6sG2qFJFWLR/U0gpDFYxloGdD+gyWvgmJ4skmiyCOmLcz3c93RS8IryJvF5Amtvskcy4o1G/aL56G8qAYpZxBcqmGrVRW08c+lNmW+ivVXEE5Vym2TzN/NCZnvsx9lD0ExzMzpcaHGrABJ116xtw+agd8Cxw8anr04zQOAQeNPTp20sjyzET39O8O8KBn0z5aeGIHWW/u7IeydHuRS8KYazme6qfI+vJ3HxOGGrmrpEKVTY9Eo6EGLeVaL34z1189vuHrBwGMEmoIH1tbRct/I+kFnFOnFFJQtQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=JrMvY8rK
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - Arm cortex-a55 problem when building
 busybox
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TmljaywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBidWlsZHJvb3Qg
PGJ1aWxkcm9vdC1ib3VuY2VzQGJ1aWxkcm9vdC5vcmc+IE9uIEJlaGFsZiBPZiBOaWNrDQo+IEJl
dHRlcmlkZ2UNCj4gU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMiwgMjAyMyA5OjI5IEFNDQo+IFRv
OiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZw0KPiBTdWJqZWN0OiBbRXh0ZXJuYWxdIC0gW0J1aWxk
cm9vdF0gQXJtIGNvcnRleC1hNTUgcHJvYmxlbSB3aGVuIGJ1aWxkaW5nDQo+IGJ1c3lib3gNCj4g
DQo+IEhlbGxvLA0KPiANCj4gSSd2ZSBqdXN0IHB1bGxlZCBidWlsZHJvb3QgaGVhZCBhbmQgZGVm
aW5lZCB0aGUgZm9sbG93aW5nIHRhcmdldCAtDQo+IA0KPiBUYXJnZXQgQXJjaGl0ZWN0dXJlIChB
QXJjaDY0IChsaXR0bGUgZW5kaWFuKSkNCj4gDQo+IFRhcmdldCBBcmNoaXRlY3R1cmUgVmFyaWFu
dCAoY29ydGV4LUE1NSkNCj4gDQo+IEZsb2F0aW5nIHBvaW50IHN0cmF0ZWd5IChGUC1BUk12OCkN
Cj4gDQo+IA0KPiBXaGVuIEkgZG8gYSBtYWtlLCBJIGdldCB0aGUgZm9sbG93aW5nIGVycm9yIHN0
YXRpbmcgdGhhdCBjb3J0ZXgtYTU1IGRvZXNuJ3QNCj4gZXhpc3QsIGV2ZW4gdGhvdWdoIGl0J3Mg
ZGVmaW5lZCBpbiBtZW51Y29uZmlnOg0KPiANCj4gLi4uDQo+IA0KPiAyMDIzLTA4LTAyVDE1OjEw
OjQxIExpbnV4IGtlcm5lbCBwcmludGsgYnVmZmVyIHN1cHBvcnQNCj4gKEZFQVRVUkVfS01TR19T
WVNMT0cpIFtOL3kvP10gbg0KPiAyMDIzLTA4LTAyVDE1OjEwOjQyIF5bWzAxbV5bW0tjYzE6Xltb
bV5bW0sgXltbMDE7MzFtXltbS2Vycm9yOg0KPiBeW1ttXltbS3Vua25vd24gdmFsdWUg4oCYXltb
MDFtXltbS2NvcnRleC1hNTVeW1ttXltbS+KAmSBmb3IgLW1jcHUNCj4gMjAyMy0wOC0wMlQxNTox
MDo0MiBeW1swMW1eW1tLY2MxOl5bW21eW1tLIF5bWzAxOzM2bV5bW0tub3RlOg0KPiBeW1ttXltb
S3ZhbGlkIGFyZ3VtZW50cyBhcmU6IGNvcnRleC1hMzUgY29ydGV4LWE1MyBjb3J0ZXgtYTU3IGNv
cnRleC1hNzINCj4gY29ydGV4LWE3MyB0aHVuZGVyeCB0aHVuZGVyeHQ4OHAxIHRodW5kZXJ4dDg4
IHRodW5kZXJ4dDgxIHRodW5kZXJ4dDgzDQo+IHhnZW5lMSBmYWxrb3IgcWRmMjR4eCBleHlub3Mt
bTEgdGh1bmRlcngydDk5cDEgdnVsY2FuIHRodW5kZXJ4MnQ5OQ0KPiBjb3J0ZXgtYTU3LmNvcnRl
eC1hNTMgY29ydGV4LWE3Mi5jb3J0ZXgtYTUzIGNvcnRleC1hNzMuY29ydGV4LWEzNQ0KPiBjb3J0
ZXgtYTczLmNvcnRleC1hNTMgZ2VuZXJpYzsgZGlkIHlvdSBtZWFuIOKAmF5bWzAxbV5bW0tjb3J0
ZXgtDQo+IGEzNV5bW21eW1tL4oCZPw0KPiAyMDIzLTA4LTAyVDE1OjEwOjQyDQo+IC9ob21lL25p
Y2svaW1hZ2UvZTI1L2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYnVzeWJveC0xLjM2LjEvc2NyaXB0
cy9nY2MtDQo+IHZlcnNpb24uc2g6DQo+IGxpbmUgMTI6IHByaW50ZjogIzogaW52YWxpZCBudW1i
ZXINCj4gMjAyMy0wOC0wMlQxNToxMDo0MiAvYmluL3NoOiAxOiBbOiAwMDAxOiB1bmV4cGVjdGVk
IG9wZXJhdG9yDQo+IDIwMjMtMDgtMDJUMTU6MTA6NDIgXltbN20+Pj4gYnVzeWJveCAxLjM2LjEg
Q29uZmlndXJpbmdeW1syN20NCj4gMjAyMy0wOC0wMlQxNToxMDo0MiBeW1s3bT4+PiBidXN5Ym94
IDEuMzYuMSBCdWlsZGluZ15bWzI3bQ0KPiAyMDIzLTA4LTAyVDE1OjEwOjQyDQo+IFBBVEg9Ii9o
b21lL25pY2svaW1hZ2UvZTI1L2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9iaW46L2hvbWUvbmljay9p
bWFnDQo+IGUvZTI1L2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9zYmluOi9ob21lL25pY2svLm9wYW0v
NS4wLjArb3B0aW9ucy9iaW46L2gNCj4gb21lL25pY2svYmluOi91c3IvbG9jYWwvc2JpbjovdXNy
L2xvY2FsL2JpbjovdXNyL3NiaW46L3Vzci9iaW46L3NiaW46L2JpbjovdXNyDQo+IC9nYW1lczov
dXNyL2xvY2FsL2dhbWVzOi9zbmFwL2Jpbjovc25hcC9iaW4iDQo+IENGTEFHUz0iLURfTEFSR0VG
SUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UNCj4gLURfRklMRV9PRkZTRVRfQklUUz02
NCAgLU9zIC1nMCAtRF9GT1JUSUZZX1NPVVJDRT0xIg0KPiBDRkxBR1NfYnVzeWJveD0iIg0KPiAv
dXNyL2Jpbi9tYWtlIC1qMzMNCj4gQVI9Ii9ob21lL25pY2svaW1hZ2UvZTI1L2J1aWxkcm9vdC9v
dXRwdXQvaG9zdC9iaW4vYWFyY2g2NC1saW51eC1nbnUtDQo+IGdjYy1hciINCj4gTk09Ii9ob21l
L25pY2svaW1hZ2UvZTI1L2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9iaW4vYWFyY2g2NC1saW51eC1n
bnUtDQo+IGdjYy1ubSINCj4gUkFOTElCPSIvaG9tZS9uaWNrL2ltYWdlL2UyNS9idWlsZHJvb3Qv
b3V0cHV0L2hvc3QvYmluL2FhcmNoNjQtbGludXgtDQo+IGdudS1nY2MtcmFubGliIg0KPiBDQz0i
L2hvbWUvbmljay9pbWFnZS9lMjUvYnVpbGRyb290L291dHB1dC9ob3N0L2Jpbi9hYXJjaDY0LWxp
bnV4LWdudS0NCj4gZ2NjIg0KPiBBUkNIPWFybTY0IFBSRUZJWD0iL2hvbWUvbmljay9pbWFnZS9l
MjUvYnVpbGRyb290L291dHB1dC90YXJnZXQiDQo+IEVYVFJBX0xERkxBR1M9IiINCj4gQ1JPU1Nf
Q09NUElMRT0iL2hvbWUvbmljay9pbWFnZS9lMjUvYnVpbGRyb290L291dHB1dC9ob3N0L2Jpbi9h
YXJjaA0KPiA2NC1saW51eC1nbnUtIg0KPiBDT05GSUdfUFJFRklYPSIvaG9tZS9uaWNrL2ltYWdl
L2UyNS9idWlsZHJvb3Qvb3V0cHV0L3RhcmdldCINCj4gU0tJUF9TVFJJUD15IC1DIC9ob21lL25p
Y2svaW1hZ2UvZTI1L2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYnVzeWJveC0NCj4gMS4zNi4xDQo+
IDIwMjMtMDgtMDJUMTU6MTA6NDIgXltbMDFtXltbS2NjMTpeW1ttXltbSyBeW1swMTszMW1eW1tL
ZXJyb3I6DQo+IF5bW21eW1tLdW5rbm93biB2YWx1ZSDigJheW1swMW1eW1tLY29ydGV4LWE1NV5b
W21eW1tL4oCZIGZvciAtbWNwdQ0KPiAyMDIzLTA4LTAyVDE1OjEwOjQyIF5bWzAxbV5bW0tjYzE6
XltbbV5bW0sgXltbMDE7MzZtXltbS25vdGU6DQo+IF5bW21eW1tLdmFsaWQgYXJndW1lbnRzIGFy
ZTogY29ydGV4LWEzNSBjb3J0ZXgtYTUzIGNvcnRleC1hNTcgY29ydGV4LWE3Mg0KPiBjb3J0ZXgt
YTczIHRodW5kZXJ4IHRodW5kZXJ4dDg4cDEgdGh1bmRlcnh0ODggdGh1bmRlcnh0ODEgdGh1bmRl
cnh0ODMNCj4geGdlbmUxIGZhbGtvciBxZGYyNHh4IGV4eW5vcy1tMSB0aHVuZGVyeDJ0OTlwMSB2
dWxjYW4gdGh1bmRlcngydDk5DQo+IGNvcnRleC1hNTcuY29ydGV4LWE1MyBjb3J0ZXgtYTcyLmNv
cnRleC1hNTMgY29ydGV4LWE3My5jb3J0ZXgtYTM1DQo+IGNvcnRleC1hNzMuY29ydGV4LWE1MyBn
ZW5lcmljOyBkaWQgeW91IG1lYW4g4oCYXltbMDFtXltbS2NvcnRleC0NCj4gYTM1XltbbV5bW0vi
gJk/DQoNCldpdGhvdXQgYSBkZWZjb25maWcgd2l0aCB3aGljaCB0byByZXByb2R1Y2UsIGl0J3Mg
aGFyZCB0byBzYXkgZm9yIHN1cmUsIGJ1dCBpdCBzZWVtcyBsaWtlDQp5b3VyIGNvbXBpbGVyIGRv
ZXMgbm90IHN1cHBvcnQgYC1tY3B1PWNvcnRleC1hNTVgIHdoaWNoIHdhcyBhZGRlZCBpbiBHQ0Mg
OC4gVGhlcmUNCmlzIGEgY2hlY2sgaW4gdGhlIEtjb25maWcgbWVudSBmb3IgdGhpcyB3aGVuIGJ1
aWxkaW5nIGEgQlIgdG9vbGNoYWluLiBBcmUgeW91IHVzaW5nIGENCmN1c3RvbSB0b29sY2hhaW4g
cGVyaGFwcz8NCg0KPiAyMDIzLTA4LTAyVDE1OjEwOjQyDQo+IC9ob21lL25pY2svaW1hZ2UvZTI1
L2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYnVzeWJveC0xLjM2LjEvc2NyaXB0cy9nY2MtDQo+IHZl
cnNpb24uc2g6DQo+IGxpbmUgMTI6IHByaW50ZjogIzogaW52YWxpZCBudW1iZXINCj4gMjAyMy0w
OC0wMlQxNToxMDo0MiAvYmluL3NoOiAxOiBbOiAwMDAxOiB1bmV4cGVjdGVkIG9wZXJhdG9yDQo+
IDIwMjMtMDgtMDJUMTU6MTA6NDIgSE9TVENDICBzY3JpcHRzL2Jhc2ljL2ZpeGRlcA0KPiAyMDIz
LTA4LTAyVDE1OjEwOjQyIEhPU1RDQyAgc2NyaXB0cy9iYXNpYy9zcGxpdC1pbmNsdWRlDQo+IDIw
MjMtMDgtMDJUMTU6MTA6NDIgSE9TVENDICBzY3JpcHRzL2Jhc2ljL2RvY3Byb2MNCj4gDQo+IC4u
Lg0KPiANCj4gSXMgdGhlcmUgYSBzaW1wbGUgd2F5IGZvciBtZSB0byBmaXggdGhpcz8NCj4gDQo+
IFRoYW5rcyBpbiBhZHZhbmNlLA0KPiANCj4gTmljaw0KPiANCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdA0K
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZw0KPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QNCj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5h
dGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sNCj4gbGlu
a3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFu
ZCBrbm93IHRoZQ0KPiBjb250ZW50IGlzIHNhZmUuDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
