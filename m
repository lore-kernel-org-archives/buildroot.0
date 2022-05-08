Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88005C433EF
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 06:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFABC408FB;
	Sun,  8 May 2022 06:46:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JLZG4wkX8V72; Sun,  8 May 2022 06:46:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBEE6408F8;
	Sun,  8 May 2022 06:46:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2AB141BF82C
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 06:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 129CF4010D
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 06:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b1yV-e0o4U7N for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 06:46:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42D0440003
 for <buildroot@buildroot.org>; Sun,  8 May 2022 06:46:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nb7Do33A614Jr0pamibv6+4w/FOsN+goycmQO84nOt0Ub7Jz5qd1I+jk5aL0wHZOmyG3LCeX1w2hgnzy4nyboPTtx/R4JOexgJMURa3Qu+fwLIqbd0NbOJ377gawi7uid4Dj9l2XUoreEdG9JLNrUCHCwzl2t1hWxPEhuNZ7RwAh69IKYeyQmrJaVZMpXU3tkL1OFzKLb2m4paRcrJkuZ3C0hz8xpeeFbWQRnUujNNmuptnelOS4uwta0ZjWKojf/xIT0AI5PA27l0aFACgQIKcv8QmDU+M972dNgD5fXyRFMeaU2WaJgiGYEWESM/M0IfteUPm85sGBz3XnqGInfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBklw6WnTwv85pW1/ZTj10MIMCHN6zVGn6RfL0D8D84=;
 b=YSGR6iu5QH0qajeigSRe/9CQsoJhStV/wWLoguXhRX4BE18fdFXT0XvFgu24epNcBmzrw6ljRCwQ0eEwJ2Pla7cTfmhnQ5mJqz9pTHwEVPxzlKA43JMSoXn9WAMGxi7R7zrb5izKb9q0LVp58wuDLg4J7OZm6P7Za/zsInWM2frI9C58vAlsAZsc9Gk7kHg4d/EvP/hVcPREDzPRchN76O3mmmsdLq1PTneUEokCBAu2E0ilZXEF6fEgw8ALSBcntmYSI2MB9IM9Dd6rlv0lpaq0oJPq1vOABkeRKzjQ/SDR4hGfJgB94IVtiWuiqCAgSlqAvpQ0ZagTIrgyB4gEtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBklw6WnTwv85pW1/ZTj10MIMCHN6zVGn6RfL0D8D84=;
 b=hupelIYk0p6+moTBMB1SiwY8RP4y69TDjOD1r3ZzsafHmOtLQlttVjkjrhyn+Lc7//tGM/pxRomaF+9V6QfuoXb8odHj3OyqiS3x0ZW3WnZe12o/pvFUZZZuUt5jTc8nSujh7cR1YElZaeC4uyaqoODIZCSqY3DAgxlgFuwIFGA=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by CY4PR02MB3256.namprd02.prod.outlook.com (2603:10b6:910:7c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Sun, 8 May
 2022 06:46:32 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%4]) with mapi id 15.20.5206.025; Sun, 8 May 2022
 06:46:32 +0000
From: Neal Frager <nealf@xilinx.com>
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v1 1/2] add configs/zynqmp_kria_kv260_defconfig
Thread-Index: AQHYYJhu5wIi+XoP/0SfaUcCKPdJpa0SPCfngAC5bCKAAPSDvoAAo232
Date: Sun, 8 May 2022 06:46:32 +0000
Message-ID: <8555E21D-3D7E-4C1B-8738-150AB664F8B8@xilinx.com>
References: <20220505155424.3002847-1-neal.frager@amd.com>
 <87pmkqzcsf.fsf@dell.be.48ers.dk>
 <BE2A1487-0690-4BE3-BFEA-AC439B98FD3D@xilinx.com>
 <87czgpys46.fsf@dell.be.48ers.dk>
In-Reply-To: <87czgpys46.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56e68262-58ab-42a4-6189-08da30be7cb7
x-ms-traffictypediagnostic: CY4PR02MB3256:EE_
x-microsoft-antispam-prvs: <CY4PR02MB325638DF760E771B8BB398A4D7C79@CY4PR02MB3256.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 23VvekwH8Qlpvi1nRQRGSs6OIHqjc9XNkXxHQkpnyQxXRRNv9U9lW4GoVd6BlpJ6poBy2x6xlC+S46vaHie+QcvitB0A5h4TPoLmqRwmTmjx7PFkmcNkp/xdd1LWhkeUUlo4+cjURLl7NOO5pat6BafSLn1FrE8Lg1JkO0aNs4gMKB+ZBH4krWTrCI3YjIW0maQf4/hBXZQ6Ny4hB3eIZ58PkOEOHvxdc4YcAtY4KMn8f/urzxDhEDNFuQbId/ALGgotQypDlATb52LKgF7ydF/FcJyy0ZWcs19aVK6tXfXoirtCz0zVnooxjn0UkaWwAvZGctrDJs3rULyLoLiAGFU/znSbkX4Li8FZ2EhXrQ+/XYW6zzjWPlkFNGz6j7XZsVz/uEVRXd93tb2S8ObXxXThWJUM8dC+ieLApnbmXVm5NZ7pZOMvYuj4fSr4D1MoaPl7X+YkD0g8bf+8ays7i0CJ4VYU3pxoDWn6aLkYHDeEz0CmbfIPZ15iR+CgdjbECZyXJxsR9xGQnLULay+1N2o/PLEMS8czis3M1u05ShvpGir3M/xBvYejyalZRiM4TRDMny1tQaw3wt9UZ0tkoi6ZjNGKL5UgUaIgobpbt9GCHPCA8WXjrbGlAL168lim8h+nW1D/NWklZEOK2nATvscspyJF0i3+wA7FRnBg7/7OsQNMrP9GyNP05f/xKzCq4qEC7JOP0sDp8lPfYqF49vHjDKf8WKT3RF+0jQfKldZJtx6IGQ4UNm/1B2zl2/G0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(4326008)(66574015)(86362001)(122000001)(6506007)(38100700002)(38070700005)(186003)(6512007)(26005)(316002)(5660300002)(6486002)(8936002)(71200400001)(91956017)(36756003)(76116006)(66946007)(2906002)(33656002)(64756008)(66556008)(66476007)(66446008)(83380400001)(54906003)(6916009)(8676002)(508600001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnRmd3ZDNGxwVEJIQjdKRWpJVnpTaEx4cWhPVmxRb0pXK2IrTjZjT3R6MUpF?=
 =?utf-8?B?OWJ4dXlDNVlZc29ZbklnU3IvSFl4eUFjSDFSS3JCRktyNTJZK2tmdkljZG00?=
 =?utf-8?B?RUsxbXFueXh0c0VMS1FleDhXOU5RZWorVnZOaDcyRWJ4Z1RUM3FMb1pFTEt4?=
 =?utf-8?B?dHlMM3hqcUkzQ3l6YXc3elJHV21GQ0ZldHNXL3FrdzBHcnNOalRScXlUQWVn?=
 =?utf-8?B?M2ZMOWFxcnlQYTZOemRGQ2dzU21CbE5PR1I5bnFCMHdCc1ZCb2hwbFQ1NlAx?=
 =?utf-8?B?ZmhhTFY1cmlUNlozcy95aDlhNDB6RGhwS00zQUN0MTF1R1JoRTdXcnpHNVpi?=
 =?utf-8?B?VE4vc3loaUNjQW44TXB2N2gwT09iUCsrZTA2Yi9DTFdVakdzcFdlNmF2L1hF?=
 =?utf-8?B?TFY1RTZsc0Y0OVRPaHRTQ1JPOHVmbmVIeVdDUjd1T3E5QTRDSHNyNXp4aUtZ?=
 =?utf-8?B?LzUvckhLM3lzc1FQelQ0SWQzQStNODg0V21DKzdjclVReUZCMFdBMEFSUGZY?=
 =?utf-8?B?OEtPRHk1MnMxeHlXMDNNeUI4OE5ETmltQkh0VTA5Q01sTk5qQXNzczduZkxh?=
 =?utf-8?B?ZGtta2pKSkFLUndXVll3ejI4Uys3bU5la3FXa0VubzE0aXMycERlM0hyOFVZ?=
 =?utf-8?B?NlR4bXB3aTk0NW1FTlpjbUFCYitjRVp6NThyNlNEbU9EdzdoemxZYWV0eS9Q?=
 =?utf-8?B?MlRZMXJmOUwyMnBzaWtMQzJ3aFE4WUdJZmdaK2dVSHY1Rm1RS1ErYU93SnNt?=
 =?utf-8?B?cTBnOWhKSDhkYWo1TXdJNmR0L0IvNTVhWmF0V3BYc1hkNWg5eCtYRGc0Um9O?=
 =?utf-8?B?WWdjalJFUEwybnB1OSt1aDYyYWdLVHhTRGVxVzB2SU51aG5zcFdpTGFVaEU4?=
 =?utf-8?B?UHVyWDNrM0VydFowV3N4bVNBNzRpay9LL3FsWktRR2FHRWFlLzA5UnRzSTFO?=
 =?utf-8?B?cWthQ3lRZ2FidkppM2FKWTQzOW1tRStLQktKNkRBN3RTMUthcGhlZ00wNzFV?=
 =?utf-8?B?RVB4RlFaZit1bUdYU29ZcFBudms1VUJSMFBMQkQ3L3BBS2lJTW1meTNjejNn?=
 =?utf-8?B?dFdubUpzcWJqM0tUeWc1TlBFWGc1STFmZDM1OW56ZDM3M2cvdEtXWVpUdEx2?=
 =?utf-8?B?UWNSVU5vazNMaURHck00VjR5aWJBQ0xPU0NoZUtscTkwYlZqaHhMQzNrT2pX?=
 =?utf-8?B?SmF5b2wrU3JGeU9lSjQwNHQvajF5WWw0eXQ5MXFzWko4TW5zNHhBOS81VVAw?=
 =?utf-8?B?VVRCeTZ4U0dyVzFVcnNBNWVZUlR3MUF3ZVhuaXJ1alI2aXQzMEpLa0NlQ3dJ?=
 =?utf-8?B?aW4zbjZnelNmRzhYclRRYWNVSUhmaWJsaUhBa1pOMHpTVEQ2SWxBSzFOMENs?=
 =?utf-8?B?N1E1Y0gySHN0Mm5UMEpmVWw3Ykh4cnY4ZnVtZ2s5N3JRQ21wRi81bk9FRW9u?=
 =?utf-8?B?TExqNWJxVE5QRCtwc3NrcWg0Y20rN1E1cWo5NUdKK3N3cTdlMWdhbkQvbzZE?=
 =?utf-8?B?anBoR0NsV3F5Vm5sdTBUNlJJNkRFellsMjlnbDBCazRjeVBQUFNCN1lvdjhU?=
 =?utf-8?B?WFBYU01WaWVhemdmWk9PSFRpU2V5WmZyTzRtTjQ0UVJVQmExak5RV0dqM2s5?=
 =?utf-8?B?UnNub0RBM1dPN2Vva1pkcTU3dXVxQlNWamZsZjMvSTQ0b01OVS9MZDJSbVln?=
 =?utf-8?B?TXl2VkdNWU1pKy93NkdyUjVleEJoc1VJMFluYkxFbjZxUGI3MjhwOGd4TlEz?=
 =?utf-8?B?cXA1WmpIYk5QaUR5amxpWHhIb1NySUN3RHZPRHgrUGkwRkIyRnVrQWIrNHFJ?=
 =?utf-8?B?eEE3aE4rdlkrSFh5ZnB3RTBnNlVFV0orak05OExvTEJYK2NsQ1BJdGw5QWxV?=
 =?utf-8?B?Mk44UnZGTHVDUlJ0ZmswaGxyb1czWlBuN042dWQ0NWlGSnFhbGxhcDdXQThL?=
 =?utf-8?B?eC90a09uRngyTUgrcG1hblVwWjZwSkhnQlJJZHlQTDlyclYyVkE4VlhOR1pN?=
 =?utf-8?B?WXE3SGVuZUx2YVMxQWhTejVWL0RqVWhzYUxlTURXbExPbmJ0elhHdTdyQ0xB?=
 =?utf-8?B?MGMvaW1nOFQvVzRLVXlyOCtnM1V1Z1QydHBscGM2allwdjdYaFF0T0FDVUpZ?=
 =?utf-8?B?Vk9VK2ptWmJyY2IyeGVZY3N4UW1kY0p1Zlc4YngxVnpXTzhTakJRdTFCdHIw?=
 =?utf-8?B?c0VSTUMwcXJ3RnRVK3F4OTdvSjcwNkI3enRrWGVXSEI3QStTQmN5ZnVaME5K?=
 =?utf-8?B?ZzdTc0twY0luN0ZCeDR3VUFZQ2J3aTQrQ3I3ZXJkYzRjUEhNSkVJMWRsUUpz?=
 =?utf-8?B?RFVSMGVwR1ZTcW1PMmpxdUZLcStQZGpWM3V6TU9FL2JlUVpIRzhtZz09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e68262-58ab-42a4-6189-08da30be7cb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2022 06:46:32.0502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2yrKNR2N8ZZAcxTKZugL5hmWPsDFYi7gliiU92MNCEwmT4ad1qVajdKOyYT0IJrpUL1d71kp0BLIjzNjyJSr6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3256
Subject: Re: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsDQoNCg0KPiBMZSA3IG1haSAyMDIyIMOgIDIzOjAxLCBQZXRlciBLb3JzZ2FhcmQg
PHBldGVyQGtvcnNnYWFyZC5jb20+IGEgw6ljcml0IDoNCj4gDQo+IO+7v0NBVVRJT046IFRoaXMg
bWVzc2FnZSBoYXMgb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gUGxlYXNlIHVz
ZSBwcm9wZXIganVkZ21lbnQgYW5kIGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBj
bGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZyB0byB0aGlzIGVtYWlsLg0KPiANCj4gDQo+Pj4+
Pj4gIk5lYWwiID09IE5lYWwgRnJhZ2VyIDxuZWFsZkB4aWxpbnguY29tPiB3cml0ZXM6DQo+IA0K
PiBIaSwNCj4gDQo+Pj4gQXJlIHlvdSBwbGFubmluZyB0byBhbHNvIHN1cHBvcnQgb3RoZXIga3Jp
YSBib2FyZHMgZ2l2ZW4gdGhlIGtyaWEvDQo+Pj4gc3ViZGlyPw0KPiANCj4+IFllcywgdGhlcmUg
aXMgYW5vdGhlciBLcmlhIGNhcnJpZXIgYm9hcmQgd2UgYXJlIGFib3V0IHRvIGFubm91bmNlLiAg
SXQNCj4+IGlzIG5vdCBwdWJsaWMgeWV0LCBidXQgSSBzZXR1cCB0aGUgZGlyZWN0b3JpZXMgaW4g
cGxhbm5pbmcgZm9yIHRoaXMuDQo+IA0KPiBBaGgsIHNvdW5kcyBpbnRlcmVzdGluZyA7KQ0KPiAN
Cj4+PiANCj4+Pj4gYm9hcmQvenlucW1wL2tyaWEvcG9zdC1idWlsZC5zaCAgICAgICAgfCAgIDgg
Kw0KPj4+IA0KPj4+IFRoZSBwb3N0LWJ1aWxkLnNoIGNvcHkgaXMgbm90IHNvIG5pY2UsIGJ1dCBv
ay4NCj4gDQo+PiBJIGFncmVlLiAgSWYgeW91IGhhdmUgYSBiZXR0ZXIgc29sdXRpb24sIEkgd291
bGQgYmUgaGFwcHkgdG8gaGF2ZSBhbnkgc3VnZ2VzdGlvbnMuDQo+IA0KPiBUaGVyZSdzIGEgbnVt
YmVyIG9mIG9wdGlvbnMsIEUuRy4gd2UgY291bGQgdXNlIGEgc3ltbGluayB0byB0aGUgZXhpc3Rp
bmcNCj4gc2NyaXB0IG9yIHBhc3MgdGhlIGZpbGUgdG8gY29weSBhcyBhbiBhcmd1bWVudCBpbg0K
PiBCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1MuIFUtQm9vdCBhZmFpayBhbHNvIGV4cGFuZHMg
dmFyaWFibGUNCj4gcmVmZXJlbmNlcyBpbiB0aGUgZXh0bGludXggZmlsZXMsIHNvIGlmIHRoZXJl
IGlzIGFscmVhZHkgYSBVLUJvb3QNCj4gdmFyaWFibGUgd2l0aCB0aGUgc2VyaWFsIHBvcnQgbmFt
ZSB0aGVuIHRoYXQgY291bGQgYmUgdXNlZC4NCg0KVGhhbmsgeW91IGZvciB0aGlzIGlkZWEuICBE
byB5b3UgaGF2ZSBhIHNvbHV0aW9uIGZvciB0aGUgU0QgY2FyZCBmaWxlIHN5c3RlbSBhcyB3ZWxs
Pw0KDQpUaGUgS3JpYSBTdGFydGVyIGtpdHMgdXNlIG1tYzEgaW5zdGVhZCBvZiBtbWMwIGZvciB0
aGUgU0QgY2FyZCwgc28gdGhpcyBpcyBhbHNvIGRpZmZlcmVudCBpbiB0aGUgZXh0bGxpbnV4LmNv
bmYgZmlsZXMuDQoNCj4gDQo+IC0tDQo+IEJ5ZSwgUGV0ZXIgS29yc2dhYXJkDQoNClRoYW5rcyBm
b3IgeW91ciBoZWxwIQ0KDQpCZXN0IHJlZ2FyZHMsDQpOZWFsIEZyYWdlcg0KQU1ECl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
