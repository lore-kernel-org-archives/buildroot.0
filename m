Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFFBC4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 09:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC4C04339F;
	Thu,  2 Nov 2023 09:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC4C04339F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ry8fNUmk7DjB; Thu,  2 Nov 2023 09:47:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68F5B43388;
	Thu,  2 Nov 2023 09:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68F5B43388
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E7521BF591
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 09:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4024143388
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 09:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4024143388
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ya6urqZKziz8 for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 09:47:40 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::622])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 272694337C
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 09:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 272694337C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltCSZdNSqM7K+LThqhWkwA/MsbAOaHOSHRgOTkxhT4ytN9+QvDK8xEBdGqWYhdaSaUE0aF9ESnj2a82earzckMvtddcJA5y3ohNjHqRDKEUNrPMioi+lbso9oLHldFYlPQ/G9ha4s2W6LrI1DLnf+EOcrYq5X4FIKLdbdDYHpAkYPvt/O1CdeCy1przNcwwwUSFGYMv1veMjcE6j5EWBqNt5/W50orTW80nkaSBKFRfhjVpsyCWdWR4eE3YX07UmUiQIMmfUDAumNzosM0FIcu9WhIf0r7SqUedb/0AHl0YqNDHATX6W6GFh5oyY1VcU+DjYNws7J9FEP4SqyNjCag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FaXNSuBleT41GdruEowoP4VT1E15WxyV9wyALon6ggw=;
 b=hZd9V1KobjKxtO5PfHeMZnL59LtdNMDF7cESQRTkMzH56gAqSMGs+/9rdaga93a5aHF45/i41EGUsanTTHLEBHCFbG/xcVFX+675HdBTCaQBPxmqHBTyJNQyiHEt12HALdkQMu2seUn+fUDkfKqCZirpPIRzUIEdDM6YYzkm1k8KzIHyKwuRvbxJiAQgSYAbDA+yACBRgUFt1MyE/2UQvFhofF/MZ2T2eurUEK5n55GP7et8yNmEuUiSXyJo2RUzPeAwv+vAkUvHL6rHCV4NuqB7ZnxHkNKaB9LA/RaqiCFaMPAwAKRYUTwXpF5fE25vTBi5U0fh9GxDUwglSvqIbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MN0PR12MB6319.namprd12.prod.outlook.com (2603:10b6:208:3c0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 2 Nov
 2023 09:47:36 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50%4]) with mapi id 15.20.6954.021; Thu, 2 Nov 2023
 09:47:36 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v6 04/10]
 toolchain/toolchain-bare-metal-buildroot: new toolchain
Thread-Index: AQHaA0qad9mHuuihr06tcb2VP9Zx+7Bj60IAgALxYL4=
Date: Thu, 2 Nov 2023 09:47:36 +0000
Message-ID: <39BA60D6-D966-4792-87C8-214212C2ED41@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-4-neal.frager@amd.com>
 <20231031135110.3927dd18@windsurf>
In-Reply-To: <20231031135110.3927dd18@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MN0PR12MB6319:EE_
x-ms-office365-filtering-correlation-id: 0c4fa5cd-7177-4dac-e813-08dbdb88be9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SYaOgqmYRB3H0Ft2yrwG/mCCx0jjq7xx0/1dKrNAcP+VcFIcL8FInZnnrPmiYBc9K3T16qoeqmDPpc2qIcoA8ySlKAui9bfL7iQswzoPA9qyn2QPsMNoMjFrbeh4D3Zw4OeK+WwQdBjItZ2GeyuI6hn/pNfs4kQzVsULtXq0ltgIV5R9izjsd77cO9K0CG6qPmk+R+R/L87oUBvxHBsumYIbWujJ06PaoFXUivd2mJpOyUDYTCfZx20TendbbXyJJln32biOrY4zIcGHGVpzuF/rIrbEDZaxeQ7WL1jjJ9kdVyf3epxLBREQo5Xir9dfq2x0LHkFGsueYlNCoUgLvR8VMgTgEL65KoYWFtffX6O5sOaMWYUrCv5qF3MmkuPq88RtSy1Fa2lt9HfSJM17p3ZEiqWmzeq0pPMZCZ2rt5sI1Wb/FAD1SZHk/elfDQZN94LArYLshKUo4pP+6Ofa/dzLndAUfl/383VRr8gfZ0rA4W2u1OixhIh3MzXuY/qTKDlYMOEugMiKUJvJ7xC01xsvTPK+lc8XfVlFEF83ng91cJ7/FMyP10RMMVro594BPAgJoH9DstOlp1H78xtuAKNUro9MYT8PdNV5xQ2Za/GFyppcDVltVyFI5la1oUUuo0xk79U3QBXopIGMNr2ggOOUyQ/wTJtPUMBcJOC8KIhGbz5gvhfxskwl3vGfX/0v
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(230173577357003)(230273577357003)(64100799003)(451199024)(186009)(1800799009)(71200400001)(6486002)(966005)(2906002)(478600001)(2616005)(66574015)(26005)(38070700009)(86362001)(38100700002)(33656002)(36756003)(83380400001)(6512007)(6506007)(8676002)(122000001)(5660300002)(6916009)(66946007)(66556008)(64756008)(54906003)(66476007)(66446008)(316002)(91956017)(76116006)(41300700001)(8936002)(4326008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXMxRktPa3VEdjVyNHpXZnZ5MUM3bXNyN0FXdENHSGpSb3hTOXN3QTRkdmgx?=
 =?utf-8?B?VXRyTGVzcWNITDJiVStuMTYrUWxvVXdMNXBuUDIvTkdBenJWNjBSbXBpanlL?=
 =?utf-8?B?K0NlbDcvQ2RsWFJ5RFdvczUrNnR2ME9NdHBvK2kvZG1jdHdUMU4rbVlyUkZ4?=
 =?utf-8?B?eW5oQ0VCQTYwWEdOMzlWWFVzU1FpSUtvTWxWVlhXYUtGZkZjSm9hWDRSMHR1?=
 =?utf-8?B?MEtmVnFteDQ0a2NYdEU4bGFibmZ4Mnh1eHhmSFBYL0RjakE5V2hWdlNOckkw?=
 =?utf-8?B?WFNBMVFwNlBZKzFDN0hDckJMcEdVdWF0YUZCanNQdlR1WHRWVTQ2S2ovWVdh?=
 =?utf-8?B?Ulh4TDl2ZnVDQlFoQmE4d3lBaXVtRTd3ZnJIcmlHd2pmQ25SS0Z0d0c1dkpm?=
 =?utf-8?B?MnNZaHB1MHRWRGRSRGNSL0dJTTUycG8xRm5VNjY1NVU2bHh4aGYwUXpyVkNJ?=
 =?utf-8?B?MC95Z1lYbHJjVGRtS3NhbXJOaEtpcnVXODlYNTRBVjRVQVozUkYxMVVtTXZ0?=
 =?utf-8?B?UHc3dWM1bkhEWkVBUDlSMG1HcS96MG1HL2dpaHJvQjJmYkVxZUhWNUkrTWd4?=
 =?utf-8?B?NXU0QiszZjE1cHNCajFNNUlDZ2NuRUprQ0dsaGwrMTBVT1JjZkpGekx3bENu?=
 =?utf-8?B?MmxFRDZpWE1kVnNxUzl2SXlPU2xYOFl4R2laK2psTTVPaGVsTlNlbVFHMGl0?=
 =?utf-8?B?d2RqQnJuNzVHelBoYXM5dk9zVzBiWjllK29iN3ZsSDlrcUYybW5pdzhMVWVK?=
 =?utf-8?B?M3BVRTFtRHZBd0lobjViK1drMzdCK0MveGlFeVY4RUJoL0FIZjhFNEhtOFBR?=
 =?utf-8?B?c2VIcWJieWZab1RONXNyMGJNbXdKcHJPY1lKcG1JUExYQk9mU0tpUVhxZkYz?=
 =?utf-8?B?OVFHL3NUejNTbTZ2cXNBcDVyclJnbklraGJJSnE0eXFidzFkSld3ODdOMmwx?=
 =?utf-8?B?ejJBTzlyRHkrdnJhUVBqUFg3OXd1Q2VjcmphRlVnSXprWk1wbWtqWXFTbDd3?=
 =?utf-8?B?Z2RUQ0J4L3I1ekdadzZvU1ZsaVJtZ2krbCtOdThKcnJqMmpnVjdqY0EzQndT?=
 =?utf-8?B?ZXNyR2xUZElGbkhPZWN0U3hKZWtIWlQ2T3Y0NjhjZlNielZkczFWMXFRTG44?=
 =?utf-8?B?UXpUM05tV2QzdVptSnRPYVE2SlZjaTRKalRBOVpRemNjTEZHQ0JMQis0T2xH?=
 =?utf-8?B?dWFJTzJ4VWdwS1lhMU9SWXhpbENVOHBZUmdOeFh3WW5qTmtvbW8yVW0rdVly?=
 =?utf-8?B?SFJvR1loc1JXQW0zN2R3ZDhpL1VNNEt4SzFobW1nN01DS1U3b0dZUXF5bHpr?=
 =?utf-8?B?c05EbzNDSEt6aDJGa1NOOGJSZndGdWgzbmdNcnB5REdqdXZENzlZd0VBWGZh?=
 =?utf-8?B?SjZpcm45ckVaTHJMSFJSNFArSjNJOGNlc09pOTU1Z0x1d1NBaVBUTERocnRF?=
 =?utf-8?B?L01XdXk2cVFyd1ZPWGJLWGZSR2F0V3J3VWlqcEt3aCtGWWgxUnhIaEpJaS9y?=
 =?utf-8?B?OUlVbGFlMUVaTlJVNk5MemZJMkR5NmNjV1QzV3FiQzYzRmVPeDh4L091a1Ni?=
 =?utf-8?B?bTR2Q01kZXBSNUU0N0c4TEtreVh6ZVI2UXJSQlVKMVRwa2ZoVlFtc2VuL3FW?=
 =?utf-8?B?aDhRejl4ZThuMkNqSjJLMndkbzJFYjFMTUx6Ymw1MWZGekExNjV2TEhNOGk4?=
 =?utf-8?B?ZGh0ZFVBUTd3cmt0NnBKUnBFcHdRQ2U1S1NGaU84d1YwMllwUFZ0QUR6NC9P?=
 =?utf-8?B?ay9ZUWNVZi9JQVFaNE1KYUE1Z3Y5WjUvSWV2c1c4SGt2L0c3VFBNVFZLN2dW?=
 =?utf-8?B?V25BQUd5V3pvUDlvdkhGRGFPTGl6QVQzMnBFWHZoUGVtQ1owa1hGUUNGYnBv?=
 =?utf-8?B?VWRKdno4WVFaWkJZQ2NSdWtjS05POFJXLzZaR3c4N0x1d094aGRpM05wcHZY?=
 =?utf-8?B?c1Z1NGdkeFpSYjBGMk1ySDlXc1daenVBOHNVTHhwRUVHaHprR3c3NkFoTkVZ?=
 =?utf-8?B?U1F2dCttM2k1bmZnNFdkV1ZvN21OZWRsbWdVM1R2NTdBbjFBYkFsdEFkN1Ux?=
 =?utf-8?B?YWxMNnFzc2pzbXhwZXhmdmFpN052RmhBY0QrbEJORkpxckdEQWhycTFWaHhz?=
 =?utf-8?Q?CrTM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4fa5cd-7177-4dac-e813-08dbdb88be9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2023 09:47:36.2939 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u5xqqaqBf7oWSPKyP2N9/+3o5bP57yIeT7DI7IhPSI6qjPPIPN2+7bvoE1LlekYL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6319
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FaXNSuBleT41GdruEowoP4VT1E15WxyV9wyALon6ggw=;
 b=w84X6aKOSgSOEDa3NYuKla6/qaUxMHQ7N2Ia3VjDNcmpLoni6JmZCFbYS+KoeEPy3Z0kBM8nBhdnOryr8vatmLehiNn5HGptjrXHf1HJp2OW2tT1vy2o2bqrmYyb/t1LeZUTHICMGaVMjUreaOF9SyACquQWSOk+phea4Fn1378=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=w84X6aKO
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v6 04/10]
 toolchain/toolchain-bare-metal-buildroot: new toolchain
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Simek, Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLA0KDQoNCj4gTGUgMzEgb2N0LiAyMDIzIMOgIDA2OjUxLCBUaG9tYXMgUGV0YXp6
b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6DQo+IA0KPiDvu79I
ZWxsbywNCj4gDQo+PiBPbiBGcmksIDIwIE9jdCAyMDIzIDEyOjQyOjMwICswMTAwDQo+PiBOZWFs
IEZyYWdlciB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6DQo+
PiANCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xjaGFpbi9Db25maWcuaW4gYi90b29sY2hhaW4v
Q29uZmlnLmluDQo+PiBpbmRleCBkODA4MWYxYjlkLi5iMTMzM2Y5MmYwIDEwMDY0NA0KPj4gLS0t
IGEvdG9vbGNoYWluL0NvbmZpZy5pbg0KPj4gKysrIGIvdG9vbGNoYWluL0NvbmZpZy5pbg0KPj4g
QEAgLTU5LDYgKzU5LDcgQEAgY29uZmlnIEJSMl9UT09MQ0hBSU5fRVhURVJOQUwNCj4+IA0KPj4g
ZW5kY2hvaWNlDQo+PiANCj4+ICtzb3VyY2UgInRvb2xjaGFpbi90b29sY2hhaW4tYmFyZS1tZXRh
bC1idWlsZHJvb3QvQ29uZmlnLmluIg0KPj4gc291cmNlICJ0b29sY2hhaW4vdG9vbGNoYWluLWJ1
aWxkcm9vdC9Db25maWcuaW4iDQo+PiBzb3VyY2UgInRvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJu
YWwvQ29uZmlnLmluIg0KPiANCj4gSSdtIG5vdCByZWFsbHkgaGFwcHkgd2l0aCB3aGVyZSB0aGlz
IGVuZHMgdXAgc2hvd2luZyBpbiBtZW51Y29uZmlnLg0KPiBJbmRlZWQsIGluIG1lbnVjb25maWcs
IHdlIGVuZCB1cCBzZWVpbmcgc29tZXRoaW5nIGxpa2UgdGhpczoNCj4gDQo+ICAgIFRvb2xjaGFp
biB0eXBlIChFeHRlcm5hbCB0b29sY2hhaW4pICAtLS0+DQo+IFsqXSBob3N0IHRvb2xjaGFpbi1i
YXJlLW1ldGFsDQo+IC0qLSAgIGhvc3QgYmludXRpbHMtYmFyZS1tZXRhbA0KPiAtKi0gICBob3N0
IGdjYy1iYXJlLW1ldGFsDQo+IC0qLSAgIGhvc3QgbmV3bGliLWJhcmUtbWV0YWwNCj4gICAgKioq
IFRvb2xjaGFpbiBFeHRlcm5hbCBPcHRpb25zICoqKg0KPiAgICBUb29sY2hhaW4gKEJvb3RsaW4g
dG9vbGNoYWlucykgIC0tLT4NCj4gDQo+IFNvIGJhc2ljYWxseSwgcmlnaHQgaW4gdGhlIG1pZGRs
ZSBvZiB0aGUgc2V0dGluZ3MgZm9yIHRoZSAibm9ybWFsIg0KPiB0b29sY2hhaW4sIHdlIGhhdmUg
dGhvc2Ugb3B0aW9ucyBhYm91dCB0aGUgYmFyZS1tZXRhbCB0b29sY2hhaW4uDQo+IA0KPiBNYXli
ZSBzb21ldGhpbmcgbGlrZSB0aGlzIGluc3RlYWQ6DQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbGNo
YWluL0NvbmZpZy5pbiBiL3Rvb2xjaGFpbi9Db25maWcuaW4NCj4gaW5kZXggYjEzMzNmOTJmMC4u
Mjc4ZDFkZTY1YyAxMDA2NDQNCj4gLS0tIGEvdG9vbGNoYWluL0NvbmZpZy5pbg0KPiArKysgYi90
b29sY2hhaW4vQ29uZmlnLmluDQo+IEBAIC01OSw3ICs1OSw2IEBAIGNvbmZpZyBCUjJfVE9PTENI
QUlOX0VYVEVSTkFMDQo+IA0KPiBlbmRjaG9pY2UNCj4gDQo+IC1zb3VyY2UgInRvb2xjaGFpbi90
b29sY2hhaW4tYmFyZS1tZXRhbC1idWlsZHJvb3QvQ29uZmlnLmluIg0KPiBzb3VyY2UgInRvb2xj
aGFpbi90b29sY2hhaW4tYnVpbGRyb290L0NvbmZpZy5pbiINCj4gc291cmNlICJ0b29sY2hhaW4v
dG9vbGNoYWluLWV4dGVybmFsL0NvbmZpZy5pbiINCj4gDQo+IEBAIC05MTksNCArOTE4LDggQEAg
Y29uZmlnIEJSMl9UT09MQ0hBSU5fSEFTX0xJQlFVQURNQVRIDQo+ICAgICAgICBkZWZhdWx0IHkg
aWYgQlIyX2kzODYgfHwgQlIyX3g4Nl82NA0KPiAgICAgICAgZGVmYXVsdCB5IGlmIEJSMl9QT1dF
UlBDX0NQVV9IQVNfVlNYDQo+IA0KPiArY29tbWVudCAiQmFyZSBtZXRhbCB0b29sY2hhaW4iDQo+
ICsNCj4gK3NvdXJjZSAidG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9vdC9D
b25maWcuaW4iDQo+ICsNCj4gZW5kbWVudQ0KPiANCj4gQmFzaWNhbGx5LCBtb3ZlIGl0IGF0IHRo
ZSBlbmQgb2YgdG9vbGNoYWluL0NvbmZpZy5pbiwgd2l0aCBhIHNtYWxsDQo+IENvbmZpZy5pbiBj
b21tZW50IHNlcGFyYXRpbmcgaXQgZnJvbSB0aGUgcmVzdC4NCg0KR29vZCBpZGVhLiAgSSBhbSBp
bXBsZW1lbnRpbmcgdGhpcyBmb3IgdjcuDQoNCj4gDQo+PiANCj4+IGRpZmYgLS1naXQgYS90b29s
Y2hhaW4vdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290L0NvbmZpZy5pbiBiL3Rvb2xjaGFp
bi90b29sY2hhaW4tYmFyZS1tZXRhbC1idWlsZHJvb3QvQ29uZmlnLmluDQo+PiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMC4uNmViZjJjZGY4Ng0KPj4gLS0tIC9kZXYv
bnVsbA0KPj4gKysrIGIvdG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9vdC9D
b25maWcuaW4NCj4+IEBAIC0wLDAgKzEsMjEgQEANCj4+ICtjb25maWcgQlIyX1BBQ0tBR0VfSE9T
VF9UT09MQ0hBSU5fQkFSRV9NRVRBTF9CVUlMRFJPT1QNCj4+ICsgICAgYm9vbCAiaG9zdCB0b29s
Y2hhaW4tYmFyZS1tZXRhbCINCj4+ICsgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfQklOVVRJ
TFNfQkFSRV9NRVRBTA0KPj4gKyAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfSE9TVF9HQ0NfQkFSRV9N
RVRBTA0KPj4gKyAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfSE9TVF9ORVdMSUJfQkFSRV9NRVRBTA0K
PiANCj4gVGhvc2Ugc2VsZWN0cyBhcmUgbm8gbG9uZ2VyIG5lZWRlZCwgYXMgYWxsIHRob3NlIG9w
dGlvbnMgd2lsbCBiZSBnb25lLg0KDQpZZXMsIGNoYW5nZXMgZG9uZSBmb3IgdjcuICBFeGNlcHQg
Zm9yIHRoZSBuZXdsaWItYmFyZS1tZXRhbCBwYWNrYWdlIHdoaWNoIHdpbGwgYmUgYSB0YXJnZXQg
cGFja2FnZSBzdGlsbCByZXF1aXJpbmcgYSBzZWxlY3QuDQoNCj4gDQo+PiArICAgIGhlbHANCj4+
ICsgICAgICBCdWlsZCBhIGJhcmUtbWV0YWwgdG9vbGNoYWluIGluIGFkZGl0aW9uIHRvIHRoZSBt
YWluIExpbnV4IHRvb2xjaGFpbg0KPj4gKw0KPj4gK2lmIEJSMl9QQUNLQUdFX0hPU1RfVE9PTENI
QUlOX0JBUkVfTUVUQUxfQlVJTERST09UDQo+PiArDQo+PiArY29uZmlnIEJSMl9QQUNLQUdFX0hP
U1RfVE9PTENIQUlOX0JBUkVfTUVUQUxfQlVJTERST09UX0FSQ0gNCj4+ICsgICAgc3RyaW5nDQo+
IA0KPiBUaGlzIG9wdGlvbiBuZWVkcyB0byBiZSBtYWRlIHZpc2libGUgKHdpdGggYSBwcm9tcHQp
LCBvdGhlcndpc2Ugbm9ib2R5DQo+IGNhbiBjaG9zZSBhIGRpZmZlcmVudCBhcmNoaXRlY3R1cmUv
dHVwbGUuDQoNClllcywgeW91IGFyZSByaWdodC4gIEkgYW0gZml4aW5nIHRoaXMgZm9yIHY3Lg0K
DQo+IA0KPj4gKyAgICBkZWZhdWx0ICJtaWNyb2JsYXplZWwteGlsaW54Ig0KPiANCj4gSXMgInhp
bGlueCIgcmVhbGx5IHJlbGV2YW50IGhlcmU/IEkgZG9uJ3QgdGhpbmsgaXQgaXMuIEknbSBhbHNv
DQo+IHdvbmRlcmluZyB3aGV0aGVyIGhhdmluZyBhIGRlZmF1bHQgdmFsdWUgYWN0dWFsbHkgbWFr
ZXMgc2Vuc2UuIEl0DQo+IHNob3VsZCBwcm9iYWJseSBqdXN0IHN0YXkgZW1wdHkgYnkgZGVmYXVs
dCwgYW5kIGJlIGRlZmluZWQgYnkgdGhlDQo+IHNwZWNpZmljIGRlZmNvbmZpZ3MgdGhhdCBuZWVk
IHRoaXM/DQo+IA0KDQpJbiBteSB0ZXN0aW5nLCBiaW51dGlscyBhbmQgZ2NjIGV4cGVjdCB0aGUg
YXJjaCBuYW1lIG1pY3JvYmxhemVlbC14aWxpbngtZWxmIHdpdGggdGhlIHhpbGlueCBpbmNsdWRl
ZC4NCg0KSSB3aWxsIGNoYW5nZSB0aGUgZGVmaW5pdGlvbiB0byB0aGUgZnVsbCB0dXBsZSB1c2lu
ZyBtaWNyb2JsYXplZWwteGlsaW54LWVsZiBpbiB2Ny4NCg0KQXMgZm9yIHRoZSBkZWZhdWx0LCBJ
IGFtIG5vdCBzdXJlIHdlIHNob3VsZCBnZXQgcmlkIG9mIGhhdmluZyBhIGRlZmF1bHQuICBJZiB0
aGUgdG9vbGNoYWluIGJhcmUgbWV0YWwgYnVpbGRyb290IGdldHMgc2VsZWN0ZWQgd2l0aG91dCBh
biBhcmNoaXRlY3R1cmUgZGVmaW5lZCwgd2Ugd2lsbCBoYXZlIGJ1aWxkIGVycm9ycyB3aXRoIGJp
bnV0aWxzLCBnY2MgYW5kIG5ld2xpYi4NCg0KSWYgaXQgaXMgb2sgd2l0aCB5b3UsIEkgd291bGQg
cHJlZmVyIHRvIGtlZXAgYSBkZWZhdWx0IGFyY2hpdGVjdHVyZSBkZWZpbml0aW9uLCBidXQgbWFr
aW5nIGl0IHZpc2libGUsIHNvIHVzZXJzIGNvdWxkIGNvbmZpZ3VyZSBhIGRpZmZlcmVudCBhcmNo
aXRlY3R1cmUgZm9yIGFub3RoZXIgcGxhdGZvcm0uDQoNCj4+ICsgICAgaGVscA0KPj4gKyAgICAg
IHNlbGVjdCBhcmNoaXRlY3R1cmUgZm9yIGJhcmUtbWV0YWwgdG9vbGNoYWluDQo+PiArDQo+PiAr
c291cmNlICJwYWNrYWdlL2JpbnV0aWxzLWJhcmUtbWV0YWwvQ29uZmlnLmluLmhvc3QiDQo+PiAr
c291cmNlICJwYWNrYWdlL2djYy1iYXJlLW1ldGFsL0NvbmZpZy5pbi5ob3N0Ig0KPj4gK3NvdXJj
ZSAicGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC9Db25maWcuaW4uaG9zdCINCj4gDQo+IFRoZXNl
IGZpbGUgaW5jbHVzaW9ucyBjYW4gYmUgZHJvcHBlZC4NCg0KRXhjZXB0IGZvciB0aGUgbmV3bGli
IG9uZSwgeWVzLCB0aGUgb3RoZXJzIHdpbGwgYmUgZHJvcHBlZCBpbiB2Ny4NCg0KPiANCj4+ICsr
KyBiL3Rvb2xjaGFpbi90b29sY2hhaW4tYmFyZS1tZXRhbC1idWlsZHJvb3QvdG9vbGNoYWluLWJh
cmUtbWV0YWwtYnVpbGRyb290Lm1rDQo+PiBAQCAtMCwwICsxLDcgQEANCj4+ICsjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIw0KPj4gKyMNCj4+ICsjIHRvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9v
dA0KPj4gKyMNCj4+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPj4gKw0KPj4gKyhldmFsICQo
aG9zdC12aXJ0dWFsLXBhY2thZ2UpKQ0KPiANCj4gSSdtIGEgYml0IHJ1c3R5IHdpdGggdmlydHVh
bCBwYWNrYWdlcywgYnV0IEkgZG9uJ3Qgc2VlIHdoZXJlIHRoaXMNCj4gdmlydHVhbCBwYWNrYWdl
IHB1bGxzIGluIGhvc3QtbmV3bGliLWJhcmUtbWV0YWwgYXMgYSBkZXBlbmRlbmN5LiBEb24ndA0K
PiB5b3UgbmVlZDoNCj4gDQo+IFRPT0xDSEFJTl9CQVJFX01FVEFMX0JVSUxEUk9PVF9ERVBFTkRF
TkNJRVMgPSBob3N0LW5ld2xpYi1iYXJlLW1ldGFsDQo+IA0KPiB0byBtYWtlIHN1cmUgeW91IHRy
aWdnZXIgdGhlIGJ1aWxkIG9mIGhvc3QtbmV3bGliLWJhcmUtbWV0YWwgLT4NCj4gaG9zdC1nY2Mt
YmFyZS1tZXRhbCAtPiBob3N0LWJpbnV0aWxzLWJhcmUtbWV0YWwgPw0KDQpZZXMsIEkgYW0gZml4
aW5nIGFsbCBvZiB0aGUgZGVwZW5kZW5jaWVzIGZvciB2Nywgc28gYWxsIG9mIHRoZSBwYWNrYWdl
cyBidWlsZCBpbiB0aGUgY29ycmVjdCBvcmRlci4NCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAN
Cj4gVGhvbWFzDQo+IC0tDQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJv
b3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5p
bmcNCj4gaHR0cHM6Ly9ib290bGluLmNvbQ0KDQpUaGFuayB5b3UgZm9yIHlvdXIgc3VwcG9ydCEN
Cg0KQmVzdCByZWdhcmRzLA0KTmVhbCBGcmFnZXINCkFNRA0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
