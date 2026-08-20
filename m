Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6982C5DF81
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 10:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B3E36072D;
	Thu, 20 Aug 2026 10:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38n2qKjBHH7e; Thu, 20 Aug 2026 10:13:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787220827;
	bh=MuhZW+vMqOGVIlxG4q0dUHgVBrjmgmAEWlSjm65goLA=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NIFeP1bt5stUl6E1+58nyB4aNJlhizMtsQ1qh9ZSdiR3ZZbSToK3URMcfF3vDJqq8
	 N19Y7gZkPbkRnaug0hIhzUM6V0tjtaH2j8BBAuEkh67iw2w+RqHiY/gPpZr6mM5VjJ
	 dnyXeuwg6WF1UAK4Gm20riv9TYMbI7XsVVITLmFHbgJAYxzlpKXZTeq2r/6rmv0v1U
	 TqZ7JvtkpzjgWQIeoVbvh8P6s8EgH2VFTMtXR21ROrGvRpL1Bh0VxpzNkYGDQ3nWtA
	 0qHJZlXgYGkwggeS6wRXxfsEpbeW9lb/FxfUslvxG2q3vOjZF8ekzkhjKubOTBP9Pc
	 oMlCo9mJ5KORg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FB1E60656;
	Thu, 20 Aug 2026 10:13:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 918B729D
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 10:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76FD9405AA
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 10:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WdTKTUWb3VuF for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 10:13:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c000::1;
 helo=byapr05cu005.outbound.protection.outlook.com;
 envelope-from=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c000::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA08B4056A
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 10:13:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBGucbXdkGv1wBRSgYQyG3b+T7hDLMqALkNd4xQpgJAiPE6I5zTNa0KtLvfLEVv1qoDAhN+w2g3/X9pMZgy+w/mnF6Bfp+nn14fkGXs2BrGEs5YwVytc+FMr2hsN7xfwrqjA9Mz1E3wm3GehIhdHCFrTaS+ZB/3tvVub3XXlC6v1OrKv5PBIKatSkVronV8HvZ1WJorvc0ooWwP0rGSSeB6C/XxebnrNcY1JNWQvHfaAIcTRG4iYqOz6TNo6vLN3XWlHCPMODYXB49hsx0EGz2t3wKnTh3fX/q0KGF9PMDapdHJQC++Iw9l97Kj1im4kYFmHJ0nFX9gQ5/AlN8rKIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5Wm9sZyOYpSWMS+sZAdL2e9cMX6wUbrcz/41UKTFfE=;
 b=RE3Nqkw0IcjVjHkqjpH7ICp1IDUWX0J4eEvHzHXk77CD/+xFUF9mNMPyRD/1/w3S1BiMpPyckAH3nXml2aMohpHHSam5NL1gtza4DynlRdTTwTTaakJYUlBEy3H2rBXR65lx7DMHoBHcz5IVrX292KionbUiC7RjO2OYoJCiBUrqqGj0NCGglmgTrZBpwh2apVMi9zuY9jipdl7nQfQ+HFS96+WKSXzp4wgcPmKamC9UV0fTMI7+v/6slfoGbPhqPlMbaI9DYDVcfQiM4isGbFaUx/bCOXIMiInCioY2/wG856Fz8YdSn0AmGBSRwWABiUn5ql2OSXLY3FOCLojtww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 BL3PR11MB6361.namprd11.prod.outlook.com (2603:10b6:208:3b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.9; Thu, 20 Aug
 2026 10:13:38 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::b76:913:9a3c:a4d1]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::b76:913:9a3c:a4d1%5]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 10:13:38 +0000
To: <buildroot@buildroot.org>, <Manikandan.M@microchip.com>
CC: <Balamanikandan.Gunasundar@microchip.com>,
 <Nayabbasha.Sayed@microchip.com>, <Cristian.Birsan@microchip.com>
Thread-Topic: dm-verity: Rebuilding the kernel/FIT after rootfs - Support in
 Buildroot
Thread-Index: AQHdMIPg0wKHF6LbIES1wKmT3XoNTLamuRGA
Date: Thu, 20 Aug 2026 10:13:38 +0000
Message-ID: <df33bc035cae9c82af36ef2d62a0b8a9e83ca201.camel@microchip.com>
References: <d87d0ad0-27c0-4f29-bbd8-8fc06421e537@microchip.com>
In-Reply-To: <d87d0ad0-27c0-4f29-bbd8-8fc06421e537@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|BL3PR11MB6361:EE_
x-ms-office365-filtering-correlation-id: d68c9997-29c8-4a2a-70a6-08defea3b3c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|38070700021|11063799006|56012099006|18002099003|22082099003|10067099003;
x-microsoft-antispam-message-info: Fea63flVFDe9qgws+nFsuHnTlFc4+iBrfqx6aGVdDIUCQaAtlWEXGpCa2kwIL3cXBMnCzqVZNvQXyrHfLbrwttsjJXLtnV9wamy1h0jQhG+gEzNdPSpmqgdbdcMG98tHLBSgyh/FOBZy33TNbVa/2Aq+GODbA4Tz334a275CBfV/r1PL86OuX/zpO4w/SJuwSQcFw32AK6UhSCQNPCAAwI2vsLAF6QVgUFf3M/2gNsEeNQdhUVRIYnz5xOh8gH3IA7sr1CuKOP2rMAbPJgDTBMUQdR+M8sWDYs8TaJVCX8qAkSIQbnKPFXtZve/pYihbkT3zlrEk3NvlkEu2qDeYS0x/SFPPpO1UlGp+PZmuArz0cuDCUGz5YXyGML56k1u+BlgV5iZVMs/aSB4SADVddERTBVuoArLVYHdeAJxgmsVzqG0y20KpNuyleELsYHOBNWNXGtiXrC690GwKgi1hz/7vSmAqOYeu4mmGS08D2BwzVYE38gQcSbDMPpL3yjv/HPYFJB4oyXtSP6V1T6swFa0bj2UJkwfduqwmClIk2H7GlW7Qn3QfTy1wW68/FrgKESGBuDjir/ak/YUBFVwXde1y7QMqk5squBzXgw3HmNAWu2qwjmP5rDtXQjNY1UCzcnpRaX5/TbiQTvcbbp9thnxOW1OPGADuWOOjBg/q9rwnolEETBl5O+7zIIMrU0piRjD9jWyPVfN6s+D6UpGky+/s6j4YOAEj/JfV/D3onGI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(38070700021)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aStVdTdJdWhhV0dSL2gySHYwWEZ5VkJZQWhuTFR4UXNDV3h5MVhnZ1JJOFpi?=
 =?utf-8?B?OXNhQ1hmTlBpOTBEMkZGZ3BrbkUwMytwZDl0LytrUUEvcUprMEZ0OTFkbVlL?=
 =?utf-8?B?R2FYbThtMmpDOWZ5OTRzS1Y4TlBEQmJ1OXltOG03cllxcjFnM1Vka1Q3YnlO?=
 =?utf-8?B?ejlNeWJHalBaU1hWUzNDUUdsdTcrejBLVW40T1VWT0Jtcm4wY25DZHJZQ09v?=
 =?utf-8?B?VkpiNHplQ20rL3RpY1N6SkwwYzVVK1lNOHNxYkwyTEhtNHJEdlE5TDZYZCtF?=
 =?utf-8?B?RnlTUjdmMG9pQW8ydE11eWJzNkk2SnBNTkJmTEhsY1k3Rlg1U25pRktCSTUv?=
 =?utf-8?B?djhEeWdCVm5yMy9zNWFVQU5oMjVIOG5pYmlvQmg3cjZNcncwK3FVNjZzYU52?=
 =?utf-8?B?cU9oL1d3ZEtGZHZzOHRnUGUxMnRmUnJUSkFPM21qR0x2ZmhZSjBpcHZJK0pH?=
 =?utf-8?B?cDlUQ1E0bUo5aXFkSjJMQjRXOHBIM2laRHF2YWdORnRZR3l2aWZwaHpPZXky?=
 =?utf-8?B?WWpVaXNHRGIwQnJBd2FwbWRSRzVkV05PMWx5Njg3MUlmeXhuWEZ0Y2YxTmpB?=
 =?utf-8?B?b0ZjejRUNGI0RzF5Q0J2UWNiS3hGN2xRK09kblcydzVjbnZEOGxJR0o0R2s1?=
 =?utf-8?B?YzBTOU13WDcyU0oxWnBLQWxaaEpkZ3BjaHZKRlRzREZIOWlKRnNaOGxUVHpW?=
 =?utf-8?B?VG9sVVFDa3ZCWjNCaE1PbVhxUnhnWlNlS2ZiLzkwWnF2QUZ3dG1VSit2Rk5K?=
 =?utf-8?B?TmpYM0VPQ0VQOWtoelFmS1dQRDdSbWZmd3lPNGV0Nk5LRzFPQmFVaGp2MzBI?=
 =?utf-8?B?Wm11bXVXenpORlJhVVBXUmNHL0hFSEMvaXI5MG13NmNCY1NhaDh4SUlTblA0?=
 =?utf-8?B?NnJxSllEbXk3c3V3ajQyOFo2TXlpRVQrMVFmNnlrRFBpOVR5NDVlcWNyMHJB?=
 =?utf-8?B?dnQydTU0cWhQMjBqdXdMN25oSU9nR0ZYUVExOWhhU0VEQkgxMlUvSzV0NVl6?=
 =?utf-8?B?NHNidm5QcC92WUtTdTFySWh0TFJGN2Z1N05DOFkzSEF2NUxkanV4M0xsV1N5?=
 =?utf-8?B?MWlNV1dmMnNwNUtubWFZVjJRM1dhM1NnbFdPUW5QOStxY1UxTTJraWsrYktl?=
 =?utf-8?B?VnNMNHgzV2cxUHlBRmFzN3VxVkxqWjVEU1JWaXJ2NXZWMHdaQzQ5eTRiT3Av?=
 =?utf-8?B?Ri80TkExVHR5bUN2RFZJcCtER0NoYWw5UXpvY25zSFFrYWRwWXh5aFVWS3lx?=
 =?utf-8?B?a05GRDJsOEhSRlA0VTRDajdGZnpoRFNKaVFUcXNFSTdManI3d0pVSVAyYzh3?=
 =?utf-8?B?aUZzcW1Fc0Nqd0d5cGMxMzAzdUdEdUFmZ1NraEZJZE90aEFRcnI1VEd6ZUs3?=
 =?utf-8?B?WWRnVGhUVUZTN3A1VURQTTZiYkRHSmZlb2NKWnU1OHp4NzlIUUF1WkFsWEF5?=
 =?utf-8?B?RzlFeVJyOUFzM3NvOENLZEJ4d1ZKbUcrazdjT2RzRFc3ZGZwS3o3TmZlZW55?=
 =?utf-8?B?RjBDTWR2NHdadkVDOFhvdzFhKzA1YkltRjBxdFJIVU5TSkVweU52d2tFNlVX?=
 =?utf-8?B?ZytnZEpEaGZaaTBGWFNHNVRQL2ZuYWZhaUF1U2dockxyK0FwNW5WK2RHRFRq?=
 =?utf-8?B?eGtiMkZDa1AxczNxeVA5NTV0dGJiWTVEbUMrazVhU3V5Vkp1LzNwOHh1R2R3?=
 =?utf-8?B?RXM2cHNNZ3hIOVNpWmhPTUFXQm80dkJQeVZTLzAraExybkJNNThIWUlyUXpw?=
 =?utf-8?B?MWZxZEpkN0JnWnhKTnU5SjVBWTBuTWN0YTdWYXBKYkExcENKbHJFUjJpUnRB?=
 =?utf-8?B?ZjhLYmU5Szlpczg1ejdraUlKdjIxbHJ6em1DQTViMVlCMm5xVWYrbG04aHF1?=
 =?utf-8?B?TGlJdFlVcXhrQ3pJdWdlcEEzdDdSLzgzTWgwRmttelFGQTFYQ2FmNktCSXdn?=
 =?utf-8?B?M3FLK1FHbzhGb0Z5TEdncitUY08wcTg4ZUpHaFNRMW9FV29TS2NkK1BlNTRC?=
 =?utf-8?B?VDNZWG1JZHliVkdpNzJpN1FYVFZwYTgvZWU5K2ZTenVTT0E0RFBVK2xTNU1v?=
 =?utf-8?B?eTlpUWhDVDFLdDdJMmp2b2g1K2dXaVVrTnh2ZWdEeGV6VmxLa3ZOdkNzOWIw?=
 =?utf-8?B?UUt6RlBxQzFncGhCemZKaDg4SEVVcXVha2JBdWd4M0x2QnhCRC9KdWZTYVRP?=
 =?utf-8?B?ZFFBVmhrSGt6YU5wcnZpQ3pjRXR5akpwaE9FNE9yTzhGb2FZVXlERzNmWlJx?=
 =?utf-8?B?bmNxRlJrZFFjZDhRZ1dCU3FROWxWZWM5Ulp4bUtDTjZDM1RjZ1JJbkk4WUpV?=
 =?utf-8?B?dExsbmtEVEsvc1Y1a0pDTENnVmNoZFZnbGxtaGl2ak1oVHhPd3Y1Z25lSXc3?=
 =?utf-8?Q?izdK295SeU1V4eQY=3D?=
Content-ID: <631BE113BABBF44C9E91F39DD2607D9B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d68c9997-29c8-4a2a-70a6-08defea3b3c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2026 10:13:38.1496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fq/f5pL32CslmjARcvLCHlH4H4B1Pi2kAUtxMwntkspYt6Z3VHlRDONHQ76TYmeVoM5hsOKuWOaYxyXUK3jVc/jBM7FQ5F7duBWSJ6/Souc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6361
Subject: Re: [Buildroot] dm-verity: Rebuilding the kernel/FIT after rootfs -
 Support in Buildroot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: "Jamie.Gibbons--- via buildroot" <buildroot@buildroot.org>
Reply-To: Jamie.Gibbons@microchip.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAyMDI2LTA4LTIwIGF0IDA5OjExICswMDAwLCBNYW5pa2FuZGFuIE0gLSBJNjcxMzEg
d3JvdGU6DQo+IEhlbGxvLA0KPiANCkhpIE1hbmlrYW5kYW4sDQoNCj4gV2UgYXJlIGFkZGluZyB2
ZXJpZmllZCBib290IChkbS12ZXJpdHkpIHRvIGFuIEFSTSBib2FyZCBpbiBCdWlsZHJvb3QsDQo+
IHVzaW5nIGEgZHJhY3V0IGluaXRyYW1mcyB0aGF0IG9wZW5zIHRoZSBkbS12ZXJpdHkgZGV2aWNl
IGFuZCANCj4gc3dpdGNoX3Jvb3RzIHRvIGEgcmVhZC1vbmx5IHNxdWFzaGZzLiBXZSBoYXZlIGEg
d29ya2luZyBwcm9vZiBvZiANCj4gY29uY2VwdCwgYnV0IGdldHRpbmcgdGhlcmUgcmVxdWlyZWQg
d29ya2luZyBhcm91bmQgQnVpbGRyb290J3MgYnVpbGQgDQo+IG9yZGVyaW5nLCBhbmQgd2Ugd291
bGQgbGlrZSB0aGUgbGlzdCdzL21haW50YWluZXJzJyB2aWV3IG9uIHdoZXRoZXIgDQo+IHRoZXJl
IGlzIGEgY2xlYW5lciwgc3VwcG9ydGVkIHdheSB0byBleHByZXNzIHRoaXMuDQo+IA0KPiBJbiBZ
b2N0byhiYXNlZCBvbiBteSB1bmRlcnN0YW5kaW5nKSwgdGhlIGZsb3cgZmFsbHMgb3V0IHdpdGgN
Cj4gZGVwZW5kZW5jeSANCj4gZ3JhcGggKGJpdGJha2UgREFHKToNCj4gDQo+IMKgwqAgMS4gQnVp
bGQgdGhlIHJvb3QgZmlsZXN5c3RlbSBpbWFnZS4NCj4gwqDCoCAyLiBSdW4gdmVyaXR5c2V0dXAg
b3ZlciBpdCAtPiBoYXNoIHRyZWUgKyBhIHJvb3QgaGFzaA0KPiDCoMKgIDMuIEJha2UgdGhlIHJv
b3QgaGFzaCBpbnRvIGFuIGluaXRyYW1mcyAoYSBzZXBhcmF0ZSBtaW5pbWFsIGltYWdlIA0KPiBm
cm9tIHRoZSByb290ZnMpLg0KPiDCoMKgIDQuIEJ1bmRsZSB0aGF0IGluaXRyYW1mcyBpbnRvIHRo
ZSBrZXJuZWwgKElOSVRSQU1GU19JTUFHRV9CVU5ETEUpDQo+IGFuZCANCj4gYXNzZW1ibGUgdGhl
IEZJVC4NCj4gDQo+IFRoZSBrZXJuZWwvRklUIHRhc2sgaXMgYWxsb3dlZCB0byBkZXBlbmQgb24g
YW4gYXJ0aWZhY3QgdGhhdCBpcw0KPiBkZXJpdmVkIA0KPiBmcm9tIHRoZSBmaW5pc2hlZCByb290
ZnMgaW1hZ2UuIFRoZSByb290IGhhc2ggaXMgZHluYW1pYyAob25seSBleGlzdHMNCj4gYWZ0ZXIg
dGhlIHJvb3RmcyBpcyBidWlsdCksIGFuZCBpdCBmbG93cyBpbnRvIHRoZSBpbml0cmFtZnMsIHdo
aWNoIGlzDQo+IGEgDQo+IGRpc3RpbmN0IGFydGlmYWN0IGZyb20gdGhlIHJvb3RmcyBiZWluZyBo
YXNoZWQuDQo+IA0KPiBCdWlsZHJvb3QgaGFzIGEgZml4ZWQgcGlwZWxpbmU6DQo+IA0KPiDCoMKg
wqDCoCBwYWNrYWdlcyAoaW5jbC4gdGhlIGtlcm5lbCnCoCAtPsKgIHRhcmdldC1maW5hbGl6ZcKg
IC0+DQo+IMKgwqDCoMKgIGZpbGVzeXN0ZW0gaW1hZ2VzIChyb290ZnMuc3F1YXNoZnMsIHJvb3Rm
cy5jcGlvLCAuLi4pIC0+wqAgcG9zdA0KPiBpbWFnZQ0KPiANCj4gVGhlIGtlcm5lbCBpcyBidWls
dCBkdXJpbmcgdGhlIHBhY2thZ2UgcGhhc2UsIGkuZS4gYmVmb3JlIGFueQ0KPiBmaWxlc3lzdGVt
DQo+IGltYWdlIGV4aXN0cy4gVGhlIGRtLXZlcml0eSByb290IGhhc2ggY2FuIG9ubHkgYmUgY29t
cHV0ZWQgYWZ0ZXIgdGhlIA0KPiByb290ZnMgaW1hZ2UgKHNxdWFzaGZzKSBpcyBnZW5lcmF0ZWQs
IGluIHRoZSBmaWxlc3lzdGVtLWltYWdlIHBoYXNlLg0KPiBUbyANCj4gYmFrZSB0aGF0IHJvb3Qg
aGFzaCBpbnRvIGFuIGluaXRyYW1mcy1pbi1rZXJuZWwsIHRoZSBrZXJuZWwgd291bGQNCj4gaGF2
ZSANCj4gdG8gYmUgKHJlKWJ1aWx0IGFmdGVyIHRoZSByb290ZnMgaW1hZ2UuDQo+IA0KPiBCdWls
ZHJvb3RzIEJSMl9UQVJHRVRfUk9PVEZTX0lOSVRSQU1GUydzIChsaW51eC1yZWJ1aWxkLXdpdGgt
DQo+IGluaXRyYW1mcykNCj4gZG9lc24ndCBoZWxwIGZ1bGx5OiB0aGUgcm9vdCBoYXNoIGlzbid0
IGtub3duIHVudGlsIHRoZSBzcXVhc2hmcw0KPiBleGlzdHMsIA0KPiB0aGVyZSdzIG5vIG9yZGVy
aW5nIGJldHdlZW4gcm9vdGZzLWNwaW8gYW5kIHJvb3Rmcy1zcXVhc2hmcywgYW5kIG5vDQo+IGhv
b2sgDQo+IHRvIHJlYnVpbGQgdGhlIGtlcm5lbCBhZnRlciBhIGdpdmVuIGZzIGltYWdlLg0KPiAN
Cj4gT3VyIGN1cnJlbnQgd29ya2Fyb3VuZDogYSBwb3N0LWltYWdlIHNjcmlwdCBydW5zIHZlcml0
eXNldHVwLCB0aGVuIA0KPiByZWN1cnNpdmVseSBjYWxscyBgbWFrZSBsaW51eC1yZWJ1aWxkLXdp
dGgtaW5pdHJhbWZzYCB3aXRoIHRoZSByb290DQo+IGhhc2ggDQo+IGluIHRoZSBlbnZpcm9ubWVu
dCB0byByZS1iYWtlIHRoZSBjcGlvIGFuZCByZS1saW5rIHRoZSBrZXJuZWwsIHRoZW4gDQo+IHJl
YnVpbGRzIHRoZSBGSVQuIEl0IGJvb3RzLCBidXQgbmVlZHMgYSByZWN1cnNpdmUgYG1ha2VgIGZy
b20gcG9zdC0NCj4gaW1hZ2UgDQo+IGFuZCByZS1saW5rIHRoZSBrZXJuZWwgYW4gZXh0cmEgdGlt
ZSBwZXIgYnVpbGQuDQo+IA0KPiBRdWVzdGlvbnM6DQo+IMKgwqAgMS4gSXMgdGhlcmUgYSBzdXBw
b3J0ZWQgd2F5LCB0b2RheSwgdG8gaGF2ZSB0aGUga2VybmVsIChvciBhIEZJVCkNCj4gYmUNCj4g
wqDCoMKgwqDCoCAocmUpZ2VuZXJhdGVkIGFmdGVyIGEgZmlsZXN5c3RlbSBpbWFnZSBoYXMgYmVl
biBwcm9kdWNlZCBhbmQNCj4gwqDCoMKgwqDCoCBwb3N0LXByb2Nlc3NlZCDigJQgaS5lLiB0byBm
ZWVkIGEgcm9vdGZzLWltYWdlLWRlcml2ZWQgYXJ0aWZhY3QNCj4gYmFjaw0KPiDCoMKgwqDCoMKg
IGludG8gdGhlIGtlcm5lbC9pbml0cmFtZnMg4oCUIHdpdGhvdXQgYSByZWN1cnNpdmUgYG1ha2Vg
IGZyb20gYQ0KPiBwb3N0DQo+IMKgwqDCoMKgwqAgaW1hZ2Ugc2NyaXB0Pw0KPiANCg0KSSB0aGlu
ayB5b3VyIGFuYWx5c2lzIG9mIHRoZSBCdWlsZHJvb3QgcGlwZWxpbmUgaXMgYWNjdXJhdGUsIGFu
ZCBJDQpkb27igJl0IGJlbGlldmUgeW91IGFyZSBtaXNzaW5nIGFuIGV4aXN0aW5nIOKAnHByb3Bl
cuKAnSBtZWNoYW5pc20gZm9yIHRoaXMNCnNvbyBJIHRoaW5rIHRoZSB3b3JrYXJvdW5kIHlvdSBk
ZXNjcmliZSBpcyByZWFzb25hYmxlIGdpdmVuIHRoZSBjdXJyZW50DQptb2RlbC4NCg0KRm9yIGNv
bXBhcmlzb24sIG91ciBvd24gZmxvdyBhbHJlYWR5IHJlbGllcyBvbiBwb3N0LWltYWdlIGZvciBm
aW5hbA0KYm9vdCBhcnRpZmFjdCBhc3NlbWJseS4gSW4gb3VyIGNhc2UgdGhlIHBvc3QtaW1hZ2Ug
c2NyaXB0OiByZWFycmFuZ2VzDQpEVHMvb3ZlcmxheXMsIGNvbXByZXNzZXMgdGhlIGtlcm5lbCwg
cmVidWlsZHMgdGhlIEZJVCB1c2luZyBta2ltYWdlLA0KcnVucyBnZW5pbWFnZSwgYW5kIGdlbmVy
YXRlcyAuYm1hcC4gU28gY29uY2VwdHVhbGx5IHdlIGFyZSBhbHJlYWR5DQp0cmVhdGluZyB0aGUg
RklUIGFzIGEgZGVwbG95bWVudCBhcnRpZmFjdCBhc3NlbWJsZWQgYWZ0ZXIgQnVpbGRyb2904oCZ
cw0Kbm9ybWFsIGltYWdlIGdlbmVyYXRpb24gcGhhc2UuDQoNClRoYXQgc2FpZCwgSSB0aGluayB0
aGVyZSBjb3VsZCBiZSBhbHRlcm5hdGl2ZSBhcHByb2FjaGVzIHdvcnRoDQpjb25zaWRlcmluZyB3
aGljaCBtYXkgZml0IEJ1aWxkcm9vdOKAmXMgbW9kZWwgYSBiaXQgbW9yZSBuYXR1cmFsbHkuDQoN
Cj4gwqDCoCAyLiBJZiBub3QsIGlzIHRoZSByZWN1cnNpdmUtYG1ha2VgLWZyb20tcG9zdC1pbWFn
ZSBwYXR0ZXJuDQo+IGNvbnNpZGVyZWQNCj4gwqDCoMKgwqDCoCBhY2NlcHRhYmxlLCBvciBpcyB0
aGVyZSBhIGNsZWFuZXIgaWRpb20gd2UgYXJlIG1pc3NpbmcuDQo+IA0KPiANCk9uZSBwb3NzaWJs
ZSBhbHRlcm5hdGl2ZSBjb3VsZCBiZSB0byBhdm9pZCBiYWtpbmcgdGhlIGRtLXZlcml0eSBoYXNo
DQppbnRvIHRoZSBrZXJuZWwtYnVuZGxlZCBpbml0cmFtZnMsIGFuZCBpbnN0ZWFkIHByb3ZpZGUg
aXQgZXh0ZXJuYWxseQ0KKGUuZy4gdmlhIGNtZGxpbmUsIEZJVCBtZXRhZGF0YSwgb3Igc2lnbmVk
IG1hbmlmZXN0KT8NCg0KQW5vdGhlciBvcHRpb24gbWF5IGJlIHRvIGtlZXAgdGhlIGluaXRyYW1m
cyBleHRlcm5hbCB0byB0aGUga2VybmVsIGFuZA0KZ2VuZXJhdGUgaXQgb25seSBhZnRlciB2ZXJp
dHlzZXR1cCwgdGhlbiBhc3NlbWJsZS9zaWduIHRoZSBmaW5hbCBGSVQNCmZyb20gcG9zdC1pbWFn
ZT8NCg0KPiBBbnkgZ3VpZGFuY2Ugb3IgcG9pbnRlcnMgd291bGQgYmUgaGVscGZ1bCBhbmQgYXBw
cmVjaWF0ZWQgLSBpbmNsdWRpbmcNCj4gaWYgDQo+IEkgaGF2ZSBvdmVybG9va2VkIGFuIHNpbXBs
ZSBleGlzdGluZyBtZWNoYW5pc20NCj4gDQpIb25lc3RseSwgeW91IGhhdmVuJ3QsIGFzIGZhciBh
cyBJIGtub3csIHNvIHlvdXIgZXhpc3RpbmcgbWVjaGFuaXNtDQpjb3VsZCBiZSBhY2NlcHRhYmxl
IGJ1dCBtYXliZSB3b3J0aCBhdHRlbXB0aW5nIHNvbWV0aGluZyB0byBhdm9pZCB0aGUNCnJlY3Vy
c2l2ZSBtYWtlLg0KDQpSZWdhcmRzLA0KSmFtaWUNCj4gDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
