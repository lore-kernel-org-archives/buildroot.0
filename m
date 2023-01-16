Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE62C46467
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 08:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E85E81304;
	Mon, 16 Jan 2023 08:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E85E81304
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WrVRA_3wVmlE; Mon, 16 Jan 2023 08:01:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FF918177A;
	Mon, 16 Jan 2023 08:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FF918177A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA0111BF30A
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 08:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86FF681304
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 08:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86FF681304
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mzDeggjpYGQJ for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 08:01:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D815F814BB
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D815F814BB
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 08:01:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y71MSlFXG6MULWApqemlgHFLBXKVUT4//Miu+mDDLK8QNhhd2mkYfEHlRwg76RJ8OHk6cembtHJD2O1gW4FVwYr6DYd7uXk+4FmYnpLNwdlzCIzAWLVgLCAErC/9Re7uSIQ+3BczKhSDXh7nUrAbqcbtLGq3/34DYnhgJYneROzjHssDM/t+kUQyWb5psiqUSB1evIDE1ZIxjq00PGg2grBAWNUmM5lVShUNlDLRQ0+atJugi1BpKmDtD3M7nXzFyRBKBYmjKsQyEXpnEMaBmCWNLbYzlF0f5g4kIJlH7+tpQdGHp+fRRrYCMyjZErh+kXW65V2PRzRTVhh6v+TEuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KiUrS76wSy3egrphIkFxhGVPon3wkQhMjUpKGJ1Iuhs=;
 b=kWmAOcL4KiB8GAwug4BmezhlvrzYZtN6yaW7SDYf9sQx9B7KJrXxMrvS0QDVrR5g3QVoqGtGCfoCavnIIUArVVM/Ib9sAu2XUCzCy49U4CzP6eNVtAYtgExTneuE3dI4Zj2sSSHdrvImZyaDHH7R3u4B/8whUurXqSLIWMUjTe5ZEoB2JaBW9ksAuXb2oi4g1OjHV0XlAT7SH/dfioIbOYGau2R/SKWfo1UyiQisRkLJzXj9is+4HOh2S5gjLcHysjZerTOLPq30BLFWYS1YcSB33+bir3XI7TdjXYawqsahvdp0UaH6l7YkWNlkAFt7wxYD/JKKf6Sr0TTbJR04og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM8P190MB0804.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:1d2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 08:01:05 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.019; Mon, 16 Jan 2023
 08:01:05 +0000
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 2/3] package/freescale-imx/imx-gpu-viv: add
 IMX8 framebuffer support
Thread-Index: AQHZJNXR40NDFJ3cC0efFYZS2MGTWa6efqqAgAIx0lo=
Date: Mon, 16 Jan 2023 08:01:05 +0000
Message-ID: <VI1P190MB0493FDD722F075DB5C2BB6029FC19@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB0493F59C8F6F866D287232FC9FFF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <20230114230427.1ccfc5ac@windsurf>
In-Reply-To: <20230114230427.1ccfc5ac@windsurf>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM8P190MB0804:EE_
x-ms-office365-filtering-correlation-id: f45e181d-e21a-4a37-d920-08daf797d1af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3351hzp/9tX1O/vE5lIihZk2Nd4g7qzdu+xr6L2C8/1m6YXpoJ0Th/VC7a//yPM/gI4AWHZaFsYDA3vYaSUCeUVNYqU+Hm9KNNjKjY+WA7XSRcsoUOZrfTkPUZaKIqNPLFruf/FDLeCnLD7YFMTcQDafopM7ZQAYfUbdDLcUsZvdhAFE/pOFkRBA9qj4CYyM1E0HvrvBhvPS29R/Nvv4OvKHGJFn9WGE/yedFmVhdpKTUoTZZR/+zgqo/MQEUfEVWGn6k6znVMoh7D0tIEl9RdkAJTy80T7uKkRaS4gzc9j7qRUrmQOROWN0R90mD7QhsWPgwn97izc64ZkNPHEe+7iAsmleWWvKr4vK/ThtadYwgFXCEuf37UVxwBwMl7+uUz29VKVThjCmWscjBjhEzkGFVfAfv/ASv5xCu02PTY0egstk64Ba1PvT6B5hAM01kRbCsDpU/XL2EstWMlvYootjYnHt8K0x3ReT4Rpz99G8aNv9izBFcEjixO8ohlIhHc04UdaTualjWkL1n0P1deDgQRDWqaJ0Dv/Iot/so7udEvwpl/nveUO4X9TsI5JCH5uwqM0u81n2pJnvKCjgOId/WoUGH+tcJLz9eOPWiicHWmSu3241bNTa3T/YIkQt8mZPitNmxylfTzAoDu1iKoHWD3Xj2eFeOsJUtbV2gx7wAhIl6jqEc7WyU3nS3j/CIBUQIwRHEpBretrcXnYl8LxeWhxaIiAECtsu7FWaT2k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(346002)(136003)(396003)(39840400004)(451199015)(83380400001)(122000001)(38100700002)(33656002)(55016003)(38070700005)(86362001)(8936002)(5660300002)(2906002)(8676002)(6916009)(4326008)(66946007)(66446008)(66476007)(66556008)(64756008)(52536014)(76116006)(41300700001)(9686003)(186003)(6506007)(26005)(54906003)(316002)(478600001)(7696005)(71200400001)(966005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWFYclR6WFVNSnNmZ3hHRDlNcTd2YWwxQ2NMcGhsM2VFNzVwYmlFSUw1Yzc2?=
 =?utf-8?B?YktXR0xBbjdlamZOcmlCckZLNENKeTVlL1ppanBRL2FsbGM2cytIb0NSNWEv?=
 =?utf-8?B?QllUUkxFMGllbm9mbkRXOXdZeDMwd3FhUzUwL2F5cVBBV1hsOS9UVnhqMjdm?=
 =?utf-8?B?SzI3SWVpNXIvc2Jpa0ZaTnByV2w3aDlWM3dFTnF5a0REWEtMT213bmtVOS82?=
 =?utf-8?B?TkNvTXZ2UXljNVAyZDc1TmF2a3pTTlFYN0tBWE9Jb293YmZLVkR0SDVvMjNj?=
 =?utf-8?B?d2N5bGVxV3FzWm15Y0FVaEhaS29XWUk4cmJGWitSVmxkUFREUjJ0N1pjSldL?=
 =?utf-8?B?MmJGdXVaK29EeGlBWDFLS01yakpGNlIzaEp3RnIwVU5OQUJEeEVDSjIzejFJ?=
 =?utf-8?B?Ym1PMUZFR1c1SDZMc0ZUMWdiMHZEUXBWZForL3NWTEhQOHIxZE5RdXNMa2J4?=
 =?utf-8?B?WGVGT1UvUVFGTmt1VktQSllZVTlFbEpIdHE3QWNBSVkwSURyV2xZMEFybGJx?=
 =?utf-8?B?d24rR1E1Ym5aYVArYUNXQU93U2ZhS3RPUkQyMVNKNThpZlVNaGpwT1BxZHhu?=
 =?utf-8?B?engvZGZSZ1k5d0NuRDhycmg3SDEwTVFRWWUrSDdsdTZSUjhZdy9kcDhoYUxH?=
 =?utf-8?B?VXpHcGFydjQvRDcvcFJOZjlHZFpXaUdMdXRKOTJCUmZ2SWVNYUJuSWFDT0Fp?=
 =?utf-8?B?ME5TTVNmRlBXRVpEQTJnMjNaRmpCZkQrWjNjeXJ1VzFVUzdpNFE4UkpLUllC?=
 =?utf-8?B?YTluSEVuVDlrT2hkR2k0a0NBNlUwcG94R2t3K25wTEttNlN6dzJ4YUpudThX?=
 =?utf-8?B?ZFZxaEh5TFpUMnhvamU4Tklxd2JLSmJRSWxaZDVrT1hiNytHenRCa2dLU2V4?=
 =?utf-8?B?eGIyQjdmeVRhU3E2SzBQQnBFN2d1VW41MWJFdVM5MVV6K2VXQ2lWQTI0M2xE?=
 =?utf-8?B?ZGgwRkJhMEtWSHU4dnBSWVltb1luTXJkSHFpSDdNT2NEVHp2U1pqbm00bVBa?=
 =?utf-8?B?aGpEcWFFSDlnWUR2NDhaWnlualBlWWk3bTJaa3pXYll0NHVtREJiVGlGZUdK?=
 =?utf-8?B?Z1lCUTZtYmtRK1g4NXlDK1cyWThWRHNsNnBKZHhUOUJiRk5DcGppV2RZc1A0?=
 =?utf-8?B?WFhiRVR4ZnBqdmYwZEpqYVFQaTFsalZnd2RwR09EcjVLREdqWTZHcU5xYllW?=
 =?utf-8?B?L3AvQVFFaU1zME1wbGVkY2RXbXFOZ1BKakZyZEY3WGFIM21GaSs0Mm1nN2hW?=
 =?utf-8?B?OU1jZVpjNmNMdFI0aFlOOThqcllZeW5zWFZkSmR3UHdVSjJWbkZuWFpFamN4?=
 =?utf-8?B?b05STmpmSDFwVWFidXVOUGozMDZaNmtTTUtyV1hZdkFmSGxUZjdibEpxM1Qv?=
 =?utf-8?B?N2d3WjFWVEl6eFFlcG1wZ2NMVi9TRlB2SnlrWXdrZExmL0dBYjBRemNoakVS?=
 =?utf-8?B?QVdqNExJMnY3MlhHaHhVU3cybkRvNTRNQXVlOFRhTnZ1TVpnaGsvODNFbWJF?=
 =?utf-8?B?TWdOT1RIdzFRSFYxMUN0ZTg3N2xIYUJ2V09PdlZCSW9zcW40TjlXTzRzYWxN?=
 =?utf-8?B?bnhsOGQrVHZLanJ3dlZ0NVdZT25TQTdEbVhJZ1FpTGs3MHhIemNNQVYxUlBF?=
 =?utf-8?B?TkdmSFJ1eWQrejVpL0g2MGZYVWhQeTQ0RlY0aWkyUXpoSkpLVXh5RkxzeDZL?=
 =?utf-8?B?dXBHUTNFWktGTjl0ZDA4TWlEUDBSY1p3cSt4RGZ5WGFJS3lJQ3BRdElGb29I?=
 =?utf-8?B?Mi8vQ2wzMTdwdjhSQVltSWwwSkJuNWlzdHVzOFRJbHB0Q2FkYXVySTAxZkUy?=
 =?utf-8?B?djRPQlNSWEhqUEdWZEtIUEcvbGdYUHM1YjNvTkJmOHp6Y001TFdjd1NFU0lP?=
 =?utf-8?B?aitTRFdabGdJUE9oeW9weEhuNktjdHZxWi84MUFON3dLYnNqdzNxUTZtdm5N?=
 =?utf-8?B?UWQvOUthVlI5TUFtYlFZZmtqL2VzSU8xTWdKdkNHTnNwOGhNVmRyOCtvNy9G?=
 =?utf-8?B?S3VzUS9uU3ZPRHdyKzNiWmxDUjFsZmNNSFdETmVmTTNid0Vta09vbGxtWGEv?=
 =?utf-8?B?MnpZVTFFNDI2TlFIMjdPYUErckp3NUZBQjBKTFJRcFp3RVowdUpGOS9oUE1V?=
 =?utf-8?Q?4M3c=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f45e181d-e21a-4a37-d920-08daf797d1af
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 08:01:05.6118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1d/KtH7nR/Z49c9tbQSf0X/Bz2+yok7UUOqLp0A/iHUMWDKbdxw8OWOOyAIbFfl83FlBmvIfX/CctXycuKJsqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P190MB0804
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiUrS76wSy3egrphIkFxhGVPon3wkQhMjUpKGJ1Iuhs=;
 b=OfDRZHfYOAzsQsyDX2Y6lemUaD7C3Pa6FURUb3koNSYxkCgpw0lA3sfgQwRoV7nuGMXSPR/yIyU9BkHrONpLY2QkQ8UZP4XIBaa8UINh3oXpRf7OpmmFfkZP9i8sF0ml+2XOGWGDlkF5QaS+QL58qygBuVCynG7c7X4uxOH4Hr4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=OfDRZHfY
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: Re: [Buildroot] [PATCH 2/3] package/freescale-imx/imx-gpu-viv: add
 IMX8 framebuffer support
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "tuzakli.refik@gmail.com" <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKPiBPbiBUdWUsIDEwIEphbiAyMDIzIDA5OjMzOjE0ICswMDAwCj4gTGFu
ZyBEYW5pZWwgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+
IAo+ID4gQWNjb3JkaW5nIHRvIG1ldGEtZnJlZXNjYWxlIFswXSB0aGUgZnJhbWVidWZmZXIgb3V0
cHV0IGNhbiBiZSBlbmFibGVkIG9uCj4gPiBJTVg4IGJ5IHVzaW5nIHRoZSB3YXlsYW5kIGxpYnJh
cmllcyB0b2dldGhlciB3aXRoIGVnbC5wYy4KPiA+IAo+ID4gVGVzdGVkIG9uIGFuIGlteDhtbiBi
eSBydW5uaW5nIGttc2N1YmUuIEVHTCBhbmQgR0xFUyBzdXBwb3J0IGRldGVjdGVkLgo+IAo+IElu
ZGVlZC4gSSd2ZSBzZWVuIHNvbWV0aGluZyBzaW1pbGFyIG9uIHRoZSBWaXZhbnRlIGJpbmFyaWVz
IHVzZWQgb24KPiBTVE0zMk1QMSBwbGF0Zm9ybXMsIHdoZXJlIHRoZSAiZnJhbWVidWZmZXIiIGxp
YnMgYXJlIGxpbmtlZCBhZ2FpbnN0Cj4gbGlid2F5bGFuZCBldmVuIHRob3VnaCB0aGV5IGRvbid0
IHVzZSBpdC4KPiAKPiA+IC0jIExpYnJhcmllcyBhcmUgbGlua2VkIGFnYWluc3QgbGliZHJtLCBl
eGNlcHQgZnJhbWVidWZmZXIgb3V0cHV0IG9uIEFSTQo+ID4gKyMgTGlicmFyaWVzIGFyZSBsaW5r
ZWQgYWdhaW5zdCBsaWJkcm0gYW5kIHdheWxhbmQsIGV4Y2VwdCBmcmFtZWJ1ZmZlciBvdXRwdXQg
b24gQVJNCj4gPiAgaWZuZXEgKCQoSU1YX0dQVV9WSVZfTElCX1RBUkdFVCkkKEJSMl9hcm0pLGZi
eSkKPiA+IC1JTVhfR1BVX1ZJVl9ERVBFTkRFTkNJRVMgKz0gbGliZHJtCj4gPiAtZW5kaWYKPiA+
IC0KPiA+IC1pZmVxICgkKElNWF9HUFVfVklWX0xJQl9UQVJHRVQpLHdheWxhbmQpCj4gPiAtSU1Y
X0dQVV9WSVZfREVQRU5ERU5DSUVTICs9IHdheWxhbmQKPiA+ICtJTVhfR1BVX1ZJVl9ERVBFTkRF
TkNJRVMgKz0gbGliZHJtIHdheWxhbmQKPiA+ICBlbmRpZgo+ID4gIAo+ID4gIGRlZmluZSBJTVhf
R1BVX1ZJVl9FWFRSQUNUX0NNRFMKPiA+ICDigILigILigILigILigIIkKGNhbGwgTlhQX0VYVFJB
Q1RfSEVMUEVSLCQoSU1YX0dQVV9WSVZfRExfRElSKS8kKElNWF9HUFVfVklWX1NPVVJDRSkpCj4g
PiAgZW5kZWYKPiA+ICAKPiA+IC1pZmVxICgkKElNWF9HUFVfVklWX0xJQl9UQVJHRVQpLGZiKQo+
ID4gK2lmZXEgKCQoSU1YX0dQVV9WSVZfTElCX1RBUkdFVCkkKEJSMl9hcm0pLGZieSkKPiA+ICtJ
TVhfR1BVX1ZJVl9CQUNLRU5EX0RJUiA9IGZiCj4gPiAgZGVmaW5lIElNWF9HUFVfVklWX0ZJWFVQ
X1BLR0NPTkZJRwo+ID4gIOKAguKAguKAguKAguKAgmxuIC1zZiBlZ2xfbGludXhmYi5wYyAkKEBE
KS9ncHUtY29yZS91c3IvbGliL3BrZ2NvbmZpZy9lZ2wucGMKPiA+ICBlbmRlZgo+ID4gLWVsc2Ug
aWZlcSAoJChJTVhfR1BVX1ZJVl9MSUJfVEFSR0VUKSx3YXlsYW5kKQo+ID4gK2Vsc2UKPiA+ICsj
IEZyYW1lYnVmZmVyIG91dHB1dCBvbiBJTVg4IChBUk02NCkgdXNlcyBlZ2wucGMKPiA+ICsjIGFu
ZCB0aGUgc2FtZSBsaWJyYXJpZXMgYXMgdGhlIHdheWxhbmQgYmFja2VuZC4KPiA+ICtJTVhfR1BV
X1ZJVl9CQUNLRU5EX0RJUiA9IHdheWxhbmQKPiA+ICtpZmVxICgkKElNWF9HUFVfVklWX0xJQl9U
QVJHRVQpLHdheWxhbmQpCj4gPiAgZGVmaW5lIElNWF9HUFVfVklWX0ZJWFVQX1BLR0NPTkZJRwo+
ID4gIOKAguKAguKAguKAguKAgmxuIC1zZiBlZ2xfd2F5bGFuZC5wYyAkKEBEKS9ncHUtY29yZS91
c3IvbGliL3BrZ2NvbmZpZy9lZ2wucGMKPiA+ICBlbmRlZgo+ID4gIGVuZGlmCj4gPiArZW5kaWYK
PiAKPiBPbiB0aGlzIHNlY29uZCBwYXJ0IEknbSBhIGJpdCBjb25mdXNlZCBiZWNhdXNlIGluIHRo
ZSAiZmIiIGNhc2Ugb24KPiBBUk02NCB5b3UncmUgZG9uJ3QgaGF2ZSBhbnkgZWdsLnBjIHBrZ2Nv
bmZpZyBmaXh1cC4gQXJlIHlvdSBzdXJlIHRoaXMKPiBpcyBub3JtYWw/Cj4gCj4gSW5kZWVkIHRo
ZSBjb2RlIHlvdSBoYXZlIGRvZXMgdGhpczoKPiAKPiBpZiBmcmFtZWJ1ZmZlciBvdXRwdXQgYW5k
IEFSTToKPiAgICAgICAgIGluc3RhbGwgZWdsLnBjIGFzIGEgc3ltbGluayB0byBlZ2xfbGludXhm
Yi5wYwo+IGVsc2U6Cj4gICAgICAgICBpZiB3YXlsYW5kIG91dHB1dDoKPiAgICAgICAgICAgICAg
ICAgaW5zdGFsbCBlZ2wucGMgYXMgYSBzeW1saW5rIHRvIGVnbF93YXlsYW5kLnBjCj4gCj4gd2hp
Y2ggbWVhbnMgdGhhdCBpbiB0aGUgZnJhbWVidWZmZXIgY2FzZSBvbiBBUk02NCwgeW91J3JlIG5v
dAo+IGluc3RhbGxpbmcgYW55IGVnbC5wYyBzeW1saW5rLiBJcyB0aGlzIHJlYWxseSBPSz8KPiAK
ClRoZSBBTUQ2NCBibG9iIGNvbnRhaW5zIG11bHRpcGxlIHZlcnNpb25zIG9mIGVnbC5wYzoKLSBl
Z2xfbGludXhmYi5wYwotIGVnbF93YXlsYW5kLnBjCi0gZWdsLnBjCgptZXRhLWZyZWVzY2FsZSBb
MV0gaW5zdGFsbHMKLSBlZ2xfbGludXhmYi5wYyBhcyBlZ2wucGMgZm9yIGZyYW1lYnVmZmVyIGJh
Y2tlbmQgb24gaW14NiBhbmQgNy4KLSBlZ2xfd2F5bGFuZC5wYyBhcyBlZ2wucGMgZm9yIHdheWxh
bmQgYmFja2VuZAotIGVnbC5wYyBhcyBlZ2wucGMgZm9yIGZyYW1lYnVmZmVyIGJhY2tlbmQgb24g
aW14OCBhbmQgYmV5b25kLgoKVGhlIGlteC1ncHUtdml2IHBhY2thZ2UgaW5zdGFsbHMvY29waWVz
IGV2ZXJ5dGhpbmcgaW4gb25lIGdvLAp0aGVyZWZvcmUgc3ltbGlua3MgYXJlIGNyZWF0ZWQgdGhh
dCByZXBsYWNlIHRoZSBvcmlnaW5hbGx5IHByb3ZpZGVkCmVnbC5wYyBpZiBhbm90aGVyIHZlcnNp
b24gaXMgbmVlZGVkLgpBTUQ2NCBmcmFtZWJ1ZmZlciBiYWNrZW5kIHVzZXMgZWdsLnBjIGRpcmVj
dGx5LgoKWzFdOiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL21ldGEtZnJlZXNjYWxlL3Ry
ZWUvcmVjaXBlcy1ncmFwaGljcy9pbXgtZ3B1LXZpdi9pbXgtZ3B1LXZpdi02LmluYyNuMjA5Cgo+
IFRoYW5rcyEKPiAKPiBUaG9tYXMKClJlZ2FyZHMKRGFuaWVsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
