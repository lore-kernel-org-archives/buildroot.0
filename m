Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A46CE7A81
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 03:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F509404F8;
	Mon, 25 Sep 2023 03:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F509404F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zG-f4S6h1Kib; Mon, 25 Sep 2023 03:43:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EB6D404F9;
	Mon, 25 Sep 2023 03:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EB6D404F9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 656821BF3BB
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 03:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E91B681C26
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 03:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E91B681C26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n177utSu8xJY for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 03:43:26 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69D8A8176C
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 03:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69D8A8176C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWnWX9w5oa5kMAPUg+nBgSCfJYadZ6tYSC+YATyQXxiYBh4/AyhqYWXj5L2pFO/dB2mIdbbEhZeeskPvj+8PT3X0fMEiDgUTmCZP9PzpgABiZVpPvU1sQrCJIR7x+DBXWR7TXSxZIBjGcilZMnQXPobZPZX9QmxU/Cvow7eMaqX+ajM/ccFNTuTG2AfQj0eqlbrVRdnQKsSLwoQEbPF8sRp/4GGSvfuWOUFYtNczSAICvZD+YPW3LO3DRzbJpZMuvYG3E31Jp62pXhjIde3j/83Q1htqGEBG6548Z/nrRruoodnzcapzgCiav74T37edhkBGq80TgT59zsCzbWfXmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ly0+FhTbFO/+wYy+9RyA/8APOpbWvN8XwtS0vbfZ81o=;
 b=Z5KCJDpM/uDLr3oFl2mHCumBa/4oIOV4juyMzUSlSgFyQO+I1Hx3FQdhlFT7CbA/9BidYKOCGe9f9lpZSQ9+Nu3zRP+FK5mQy/skuDHmXsQopz/Tkam9EKzdYv9vpmzL3YuD0li9L3lk5KMTzJ4wkJqehiireTbfgnUgQu0yFCqYV77hptL35Ff7ejEbrpP7otDSF1Nm0FsxcY0Gq77iWq+C1RR1fIdXeuVQ3dl7QeHhaFUTbNT3u1X2s2M9jyxgXQ6KZoBss2wKVMLor5Tp+hTZzGfFy//L0EU7/jni8L8aBLkDVS81fEZ1ftrIWmlMokwQmSqO2DxlNldo4dGvQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SA1PR12MB7245.namprd12.prod.outlook.com (2603:10b6:806:2bf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.31; Mon, 25 Sep
 2023 03:43:22 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::c780:32e8:203:be20]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::c780:32e8:203:be20%2]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 03:43:22 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>
Thread-Topic: [PATCH v3 1/6] package/binutils-bare-metal: new package
Thread-Index: AQHZ3xdOetzd6qes5kKjvQ75CSQimbAm6SMAgAAITYCAAAnbgIAAD+SQgAAFR4CAATUVQIACtPIAgAAMMOs=
Date: Mon, 25 Sep 2023 03:43:21 +0000
Message-ID: <7AD8C3E2-4A82-434F-8C3D-6B9B5E53E798@amd.com>
References: <20230904100443.1613306-1-neal.frager@amd.com>
 <20230922145236.027dc287@booty>
 <CH2PR12MB50040897854080471200F9E0F0FFA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20230922155735.43ddc356@booty>
 <CH2PR12MB5004C65AFCE251505428888AF0FFA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <MN0PR12MB60045761B225083426E7B1A1A0FFA@MN0PR12MB6004.namprd12.prod.outlook.com>
 <CH2PR12MB5004761ED87FCAC8E37E9667F0FEA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20230925045944.6a88abd4@booty>
In-Reply-To: <20230925045944.6a88abd4@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SA1PR12MB7245:EE_
x-ms-office365-filtering-correlation-id: f77b4882-f960-4271-56b1-08dbbd799061
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QEsUJjgMhMMKNXMFXzQnPCf/XSY33uz3OU6sASBFcMB1l1fQQZ2TCCUPXyj4+AAWtaCGZsjXc4jUokE0N72OutxbIa3llj5rU83ZETVZ3TXmn38Z+bxh2fQFPGbnQIfSmSXFHJfryVV5V9hC7elExiBUWTqKqMvQSOy5ZCvAXsW0kQcCOTSGzdo+2Kl7xZL/J02Lpp/PhBq5Ynv+y88Fz+sutCHEKRtlR6y1rhWL34zWPyM2H9Q2/qlz5ktQWrEYIix8SFqj1N/MgHLmN+0sTGEdeqs1pc4ycM/Vv2LeJXS067jSslCNsA0mKfT8Zb1uVXaWwfFfwbIt0li+1m75mq+nnk0PMO5/pijW7gflY4+HpgN1ZySc5GLnFK8rT5qPu94wWwKd5VOpKjIXWGmGw0D3z1/tuzhkKHaHSsVjNky2FwgrhIfZ9FlkRrQ8oQX8H3x0bDzOOTcRv5I/rEYfh45BvEc18/655W3jYxrCTC7xjgNgydm8KYe6Lm9IYbz3XAj4BVhrRVwJzA1T19Qg9IEhvfmKJCYz5gzez+sSnC9qQtSHZ5zza4HxNMPkxdy6nKkyTrRorBENrx6bSD3TEeFQmmPZGYZffmBY1CJ/0W5thvLT4LplL+RgQhZvUeivKwBlVGoeZt+fHyV7nda0ew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(136003)(376002)(366004)(230922051799003)(451199024)(1800799009)(186009)(66946007)(86362001)(316002)(64756008)(41300700001)(6636002)(66446008)(66476007)(66556008)(33656002)(110136005)(8936002)(8676002)(4326008)(122000001)(5660300002)(76116006)(36756003)(54906003)(83380400001)(2906002)(38070700005)(66574015)(38100700002)(478600001)(2616005)(966005)(6512007)(71200400001)(6486002)(6506007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFJXaTBWd1VNRlRtQ3k5aUVlOW9sN1BtZlVwVHF3ZTZnR1B0Zng0VVhTZXJO?=
 =?utf-8?B?ckRaNWFVeTZwWjcwWnpSVmUrN1hJRS9KZGtlckVDRjdWeE9JSUpKYWtmTTRz?=
 =?utf-8?B?ckZNalNNanVZT1Y3ZzYvL3dZcU9EQ1RtNW1hWUNNMUgyalhnYWlhR0ZxZldM?=
 =?utf-8?B?QTk3c1VJZTNXckhIWmljTEliaXR1bXJCYndhTnFhOGdIZ011bHBHMGMwS1dK?=
 =?utf-8?B?RUFmTzVCYVoyYVM5c0NKblRhSUJsaFEyUXM3RTZjYkRpdVYvRzdXN0hlVnMr?=
 =?utf-8?B?WnhlWWdFYUlKWmk5dGR1Ry9CaExpczFEQ251OTRGaHBHeDhTcXp2NnhWMlQ2?=
 =?utf-8?B?QVJxR0o3aVc0SEttNUxXeFV2d1B0SjB3V2FTaXZEVG82UkVkcmt1QlA0enVY?=
 =?utf-8?B?ZjY3L1VxbU1Yd25CUFErSXo1alRjc2lJdmxYWE9adnF1MnkzdXVzOEVYTi9B?=
 =?utf-8?B?bThwUmV6c1lOWmtaLzZDd1lhUyt0aWEyTGkyT1J6cmhQVEIwSWhJclduT1Y5?=
 =?utf-8?B?UmdiUTA2V3didzZJMk9JRHVzQnR0YjFmNjdSeCtyZUFxblJnbk1FdUR3SHRt?=
 =?utf-8?B?NHU0STdacjFQNCsvSTVlRmVTbXBlMlJ6ZTZ4VlY0WDhWTHI0WitydlptNFox?=
 =?utf-8?B?SysxZEVsRG10cmk4aEc5NkpjbHZFaDRyVnpDTUZXQzdQSVFhMWFHeitQbU8v?=
 =?utf-8?B?b2diSTQwclpIemJBQ1RzMzdRN3Qwa3loaVZ6WEZsaHdSdGRKczQwR3N4a2ta?=
 =?utf-8?B?MmFuVHFJN01raDVUM2NsL1FyOUtvVEVCemhTTXM1ZUN3b3p6ZU43YUZkOUow?=
 =?utf-8?B?dGs5TVVqU0FUaXUvQ0tud24yaVZ2UjJwb2NYd2U3NlJiUFdmUktxQ05aK2ho?=
 =?utf-8?B?QTNIcTJvNDVqL1hTVkl4cGo0UGlIZlNMVFB5YWN2d0cvNE9sUUs0bHJIS2J2?=
 =?utf-8?B?bVNYRTJrN0pyT1dpMDdNSHRNaVdpWEFyeDhkUG9DYVhudnVNdDYrZGRiR25Q?=
 =?utf-8?B?OG5DT2FTaGZCZURReG8rcmZxdWZ2V3hXcVR4REdwRlZnaFNud05ZNHBLakhM?=
 =?utf-8?B?Ui80K0UyWFRBdmZ0dnI5RkdZODBnNXVYZzd5Um56U29lMmQwaEpLQUR4WGNp?=
 =?utf-8?B?QzVpTHBnVXpBelhRQXRLQ2h2SnY1czlRTm5DaHR5eEJBVDNmM2U1a0ovc1dj?=
 =?utf-8?B?Q1hJa1cvd280UVdHemNpZGNUZk1scEQvTEs1aVJDNE8yM2FXdFpjeTFTdElK?=
 =?utf-8?B?TDF3VTlpMWV3VmdQbXNnbnFOTlN1WmljYW9TMTAwcGt6UDA0T3FnVGpGc2VK?=
 =?utf-8?B?TzViZXg3dE5lRzlkajJHV1FIc3VzelJuMWdMVFJPbHJOdVZGUTlFRW9Xc3Vm?=
 =?utf-8?B?M3YzaTVQQllLWTRIZUJncFRtQTZNRE43WmcxeXFaQ0tNV2dWZzJFL1ZsZUxK?=
 =?utf-8?B?b0g5THpBVHhGT3ZDbkpMR2w0dkV3Y3V3WUVuL2wvR2hob052MVdPc1NRTXAz?=
 =?utf-8?B?Y3FkdEFTODc4WWdJZ3c3MEl6Z0pFbVJZYmNhWEhBcUtCT1VpMnR5bjlGcW53?=
 =?utf-8?B?L1o4ZzlsbGpvYlVYdm1kK0ZhVWZTd0tEbUJRWnBQVzdPcDVvcndTMDlPNmhx?=
 =?utf-8?B?S0lUUDhUU09kVXpzNEJYSW1WSmdDVXJjbkp5VU5icUl2MnpQMXRuaVRHNC9v?=
 =?utf-8?B?cmZnTHpNUDRDL2lSYTloQ1l0L0tZZ0QxSjFIai9zZUp6cEZaMXNUd3pkRGl5?=
 =?utf-8?B?VmJ4dVhaQ2c3ZHFoRUMvcFIrcjA1cTlydW1NbTllVXNJTVlXWk5XQTI2dnVJ?=
 =?utf-8?B?M0EwVllGSnNoQnZRb2J3WEs1aVdPWlI2eDZ3d2VwckFaQ3pmSnQwTmVlbU9k?=
 =?utf-8?B?THVFUWxzR254clE2dkRNM25hZHhuUlQ4NXBCS3JtMmx5ekQ2cDRzRHRidkc3?=
 =?utf-8?B?TjhsZWVQN2hvc3RVT0RHODRRZExkckJ5SG94WnozQXJadDhNVFFiNUVNaHh6?=
 =?utf-8?B?TUlWRlo3Nm93TmVKV3FicXVjUWxFaVBISDdiMHFEb0M4V3IxTkcrYjg1cEJO?=
 =?utf-8?B?YjJXNy9Yd0dQTVNFWVpUbldNSS9oSThJcXNYLzZ2ajlxS0lxRDJRcXJweUxR?=
 =?utf-8?B?NDMyZ3F6SE1OUXBTNmVxbzUvZTRvRFhZR2w5NjIvaDJHUTZ5RDF1R2V5bmRY?=
 =?utf-8?Q?Lc/nZKOB3yBCRl2NJdmV2OE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f77b4882-f960-4271-56b1-08dbbd799061
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 03:43:21.3703 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jeh6iDwFapzSWnDYo1G0LXuZB6tKbZttgl8+lae24O6BGoNIRRDY/21yxqS1AZqm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7245
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ly0+FhTbFO/+wYy+9RyA/8APOpbWvN8XwtS0vbfZ81o=;
 b=WyZe80/StNUeCHyi6DmE6rln4ShaaMuRggZCJzbePBBJ74Y/+dFDwKIhIBYRFk2dGd55IXN7GxVfsYUCT/wGikO4WAAlyDHgRoPr4BKZXUE8ZLA/8B7tePDKvWlajiQ6FF3OwOzj4rxbQIaKgF7TjreA4k12H1SJVAQVIZhXprA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WyZe80/S
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/6] package/binutils-bare-metal: new
 package
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVjYSwNCg0KDQo+IExlIDI1IHNlcHQuIDIwMjMgw6AgMDQ6NTksIEx1Y2EgQ2VyZXNvbGkg
PGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoNCj4gDQo+IO+7v0hpIE5lYWws
IEliYWksDQo+IA0KPiBPbiBTYXQsIDIzIFNlcCAyMDIzIDA5OjUwOjM0ICswMDAwDQo+ICJGcmFn
ZXIsIE5lYWwiIDxuZWFsLmZyYWdlckBhbWQuY29tPiB3cm90ZToNCj4gDQo+Pj4+IEZyb20gbXkg
dmlldywgaXQgaXMgZWFzaWVyIGZvciBtZSB0byBtYWludGFpbiB0aGlzIGlmIHdlIGVpdGhlciB0
YWtlDQo+Pj4+IGFsbCBvZiB0aGUgIA0KPj4+IHBhdGNoZXMgYXMgaXMgb3Igbm9uZSBhdCBhbGwu
DQo+Pj4gDQo+Pj4+IEFncmVlZCBpdCBpcyBzaW1wbGVyIHRvIG1haW50YWluLCBzbyB0aGlzIGJv
aWxzIGRvd24gdG8gdGhlIHF1ZXN0aW9uOg0KPj4+PiBhcmUgdGhvc2UgcGF0Y2hlcyBiZWluZyBh
Y3RpdmVseSBtYWlubGluZWQ/IEkgaGF2ZSBhIHNhZCBmZWVsaW5nDQo+Pj4+IGFib3V0IGl0IGFz
ICANCj4+PiB0aGUgbnVtYmVyIGFuZCBvdmVyYWxsIHF1YWxpdHkgb2YgdGhvc2UgcGF0Y2hlcyBz
ZWVtcyB0aGUgc2FtZSBJIHNhdw0KPj4+IG1vcmUgdGhhbiBhbiB5ZWFyIGFnby4NCj4+PiANCj4+
PiBBcyBhIHF1aWNrIHRlc3QsIEkgdHJpZWQgcmVtb3ZpbmcgdGhlIFhpbGlueCBwYXRjaCBzZXQg
dG8gc2VlIGlmIHRoZQ0KPj4+IGJ1aWxkIHdvdWxkIHN0aWxsIHdvcmsuDQo+Pj4gDQo+Pj4gSSBl
bmRlZCB1cCBnZXR0aW5nIHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3Igd2l0aCB0aGUgenlucW1w
IHBtdWZ3Og0KPj4+IG1pY3JvYmxhemVfc2xlZXAuYzo4MTo5OiBub3RlOiAnI3ByYWdtYSBtZXNz
YWdlOiBGb3IgdGhlIHNsZWVwDQo+Pj4gcm91dGluZXMsIGFzc2VtYmx5IGluc3RydWN0aW9ucyBh
cmUgdXNlZCcNCj4+PiAgIDgxIHwgI3ByYWdtYSBtZXNzYWdlICgiRm9yIHRoZSBzbGVlcCByb3V0
aW5lcywgYXNzZW1ibHkNCj4+PiBpbnN0cnVjdGlvbnMgYXJlDQo+Pj4gdXNlZCIpDQo+Pj4gICAg
ICB8ICAgICAgICAgXn5+fn5+fg0KPj4+IG1pY3JvYmxhemVfc2VsZnRlc3QuUzogQXNzZW1ibGVy
IG1lc3NhZ2VzOg0KPj4+IG1pY3JvYmxhemVfc2VsZnRlc3QuUzo1NTQ6IEVycm9yOiB1bmtub3du
IG9wY29kZSAiYnNpZmkiDQo+Pj4gbWljcm9ibGF6ZV9zZWxmdGVzdC5TOjU1NTogRXJyb3I6IHVu
a25vd24gb3Bjb2RlICJic2VmaSINCj4+PiANCj4+PiBUaGlzIGlzIHRoZSBzYW1lIGVycm9yIHdl
IHNlZSB3aGVuIHVzaW5nIHRoZSB6eW5xbXAtcG11ZnctYnVpbGRlci4NCj4+PiANCj4+PiBJIHdp
bGwgZ28gdGhyb3VnaCB0aGUgZ2NjIHBhdGNoIHNldC4gIFBlcmhhcHMgaW5zdGVhZCBvZiBhcHBs
eWluZyBhbGwNCj4+PiBwYXRjaGVzLCBJIGp1c3QgbG9vayBmb3IgdGhlIG9uZSB0aGF0IGZpeGVz
IHRoZSBhYm92ZSBpc3N1ZSBhbmQgYXBwbHkgdGhhdC4NCj4+PiANCj4+IA0KPj4+IE5vdGUgdGhh
dCB0aGUgbWljcm9ibGF6ZSB0b29sY2hhaW4gYnVpbGQgaW4gWW9jdG8gd2hlcmUgdGhlc2UgcGF0
Y2hlcyBhcmUgY29taW5nIGZyb20sIGlzIGEgbXVsdGlsaWIgY29uZmlndXJhdGlvbiB0byBzdXBw
b3J0IGRpZmZlcmVudCBtaWNyb2JsYXplIGNvbmZpZ3VyYXRpb25zLiBBcyB0aGUgZ29hbCBvZiB0
aGlzIHBhY2thZ2UgaXMgdG8gYnVpbGQganVzdCBhIHRvb2xjaGFpbiBmb3IgdGhlIFBNVSAoYW5k
IFBNQyBpbiBWZXJzYWwpIHRoZXJlIGlzIG5vIG5lZWQgZm9yIG11bHRpbGliIGNvbmZpZ3VyYXRp
b24gYW5kIG5laXRoZXIgZm9yIHNvbWUgb2YgdGhlc2UgcGF0Y2hlcyAoaS5lLiA2NGJpdCBhcmNo
aXRlY3R1cmUpLiBUaGUgdHJpY2t5IHBvaW50IGlzIHRvIGZpZ3VyZSBvdXQgd2hpY2ggb25lcyBh
cmUgcmVhbGx5IG5lZWRlZCBmb3IgdGhpcyB1c2UgY2FzZSDwn5iKICANCj4+IA0KPj4gSSB0cmll
ZCBjaGVycnktcGlja2luZyB0aGUgcGF0Y2hlcyBuZWVkZWQgZm9yIHRoZSBic2lmaSBhbmQgYnNl
ZmkgaW5zdHJ1Y3Rpb25zLiAgVW5mb3J0dW5hdGVseSwgYm90aCB0aGUgYmludXRpbHMgYW5kIGdj
YyBwYXRjaCBzZXRzIGluY2x1ZGUgbWFueSBtb2RpZmljYXRpb25zIG9mIHRoZSBzYW1lIHNvdXJj
ZSBmaWxlcy4NCj4+IA0KPj4gRm9yIGV4YW1wbGUsIGlmIEkgb25seSBhcHBseSB0aGUgZ2NjIHBh
dGNoIDAwMjQtUGF0Y2gtTWljcm9CbGF6ZS10aGlzLXBhdGNoLWhhcy0xLkZpeGVkLXRoZS1idWct
aW4ucGF0Y2ggdGhhdCBhZGRzIHRoZSBic2lmaSBhbmQgYnNlZmkgZnVuY3Rpb25hbGl0eSwgaXQg
Y2Fubm90IGFwcGx5IHVubGVzcyBJIGhhdmUgc2V2ZXJhbCBwcm9jZWVkaW5nIHBhdGNoZXMgaW5j
bHVkZWQgdG9vLiAgQW5kIHRoZW4gd2hlbiBJIG9ubHkgaW5jbHVkZSB0aGUgcGF0Y2hlcyBuZWVk
ZWQgZm9yIGFwcGx5aW5nIHRoaXMgdXBkYXRlLCBnY2MgZG9lcyBub3QgYnVpbGQgcHJvcGVybHkg
dW5sZXNzIEkgaW5jbHVkZSBldmVuIG1vcmUgcGF0Y2hlcy4NCj4+IA0KPj4gVGhlIG9ubHkgd2F5
IEkgY2FuIGVhc2lseSBmaW5kIGZvciBhZGRpbmcgdGhlIHBhdGNoZXMgZm9yIHRoZSBic2lmaSBh
bmQgYnNlZmkgaW5zdHJ1Y3Rpb25zIGlzIHRvIGp1c3QgaW5jbHVkZSB0aGUgZnVsbCBzZXQgb2Yg
NTQgcGF0Y2hlcy4gIFdoZW4gSSBkbyB0aGlzLCBJIGNhbiBidWlsZCBnY2MgYW5kIHRoZSB6eW5x
bXAgcG11Zncgd2l0aG91dCBlcnJvcnMuDQo+PiANCj4+IFNpbmNlIHBhdGNoZXMgYXJlIHJlcXVp
cmVkIGluIGJvdGggdGhlIGJpbnV0aWxzIHNldCBhbmQgdGhlIGdjYyBzZXQsIEkgdGhpbmsgdGhl
IGVhc2llc3Qgc29sdXRpb24gZm9yIHVzIGlzIHRvIGp1c3QgdGFrZSB0aGUgZnVsbCBwYXRjaCBz
ZXQgZm9yIGVhY2ggdGhhdCB5b2N0byBpcyB1c2luZy4NCj4+IA0KPj4gSSBkbyBub3QgYmVsaWV2
ZSB0aGVyZSBpcyBjdXJyZW50bHkgYW55IG9yZ2FuaXplZCBlZmZvcnQgdG8gdXBzdHJlYW0gYW55
IG9mIHRoZXNlIHBhdGNoZXMsIGJ1dCBldmVyeSBBTUQgWGlsaW54IHNvZnR3YXJlIHJlbGVhc2Ug
d2lsbCBpbmNsdWRlIGEgbWljcm9ibGF6ZSBjb21waWxlciB3aXRoIGEgcGF0Y2ggc2V0IHRoYXQg
d2UgY2FuIGFwcGx5LiAgVG8ga2VlcCBtYWludGVuYW5jZSBvZiBhbGwgdGhpcyBhcyBlYXN5IGFz
IHBvc3NpYmxlLCBJIGJlbGlldmUgdGhlIGJlc3Qgc29sdXRpb24gaXMgdG8ganVzdCBhcHBseSB0
aGUgZnVsbCBwYXRjaCBzZXQgZm9yIGJpbnV0aWxzIGFuZCBnY2MgZXZlcnkgdGltZS4NCj4+IA0K
Pj4gSXMgdGhpcyBvayBmb3IgYm90aCBvZiB5b3U/DQo+IA0KPiBJJ20gT0sgd2l0aCB0aGUgd2hv
bGUgYXBwcm9hY2gsIGV4Y2VwdCBmb3IgdGhlIHNlbnRlbmNlICJJIGRvIG5vdA0KPiBiZWxpZXZl
IHRoZXJlIGlzIGN1cnJlbnRseSBhbnkgb3JnYW5pemVkIGVmZm9ydCB0byB1cHN0cmVhbSBhbnkg
b2YNCj4gdGhlc2UgcGF0Y2hlcyIuLi4gd2hpY2ggaXMgcHJvYmFibHkgYWxyZWFkeSBjbGVhciB0
byB0aGUgcmVjaXBpZW50cw0KPiBvZiB0aGlzIG1lc3NhZ2UsIGFuZCB0aHVzIGlzIG5vdCBnb2lu
ZyB0byBiZSBzb2x2ZWQgaW4gdGhpcyB0aHJlYWQsDQo+IGhvd2V2ZXIgSSBqdXN0IHdhbnQgdG8g
YmUgc3VyZSBteSBwb3NpdGlvbiBpcyBjbGVhci4gSSdkIGFsc28gbGlrZSB0bw0KPiBzdHJlc3Mg
dGhhdCBJIGFwcHJlY2lhdGUgYSBsb3QgdGhlIHdvcmsgeW91IGFyZSBkb2luZyB0byBwcm9wZXJs
eQ0KPiBzdXBwb3J0IHRoZSBwbXVmdyBpbiBCdWlsZHJvb3QuIFRoYW5rcyENCj4gDQo+IEx1Y2EN
Cg0KWW91ciBwb3NpdGlvbiBpcyB2ZXJ5IGNsZWFyLiAgQW5kIEkgY2FuIGFzc3VyZSB5b3UgdGhh
dCBib3RoIEliYWkgYW5kIEkgYWdyZWUgd2l0aCBpdC4NCg0KSXQgd291bGQgYmUgbXVjaCBiZXR0
ZXIgaWYgYWxsIG9mIHRoZXNlIGJpbnV0aWxzIGFuZCBnY2MgcGF0Y2hlcyBmb3IgbWljcm9ibGF6
ZSBnbyB1cHN0cmVhbSwgYW5kIGJvdGggSWJhaSBhbmQgSSBoYXZlIHB1c2hlZCBmb3IgaXQgaW50
ZXJuYWxseSBhdCBBTUQgLyBYaWxpbnguDQoNClRoZSBvbmx5IHRoaW5nIEkgY2FuIHNheSBpcyB0
aGF0IGNoYW5nZSBpcyBhbHdheXMgcG9zc2libGUuICBZZXN0ZXJkYXksIHdlIGNvdWxkIG5vdCBi
dWlsZCBhIHp5bnFtcCBwbXVmdywgdmVyc2FsIHBsbSBvciB2ZXJzYWwgcHNtZncgaW4gYnVpbGRy
b290LiAgVG9kYXksIHdlIGhhdmUgc3VibWl0dGVkIGEgc29sdXRpb24gdG8gY2hhbmdlIHRoYXQu
DQoNClRvbW9ycm93IChmaWd1cmF0aXZlIG1lYW5pbmcgdGhlIGZ1dHVyZSksIHdlIGhvcGUgdG8g
Z2V0IGFsbCB0aGVzZSBiaW51dGlscyBhbmQgZ2NjIHBhdGNoZXMgdXBzdHJlYW0sIHNvIHRoZSB1
cHN0cmVhbSB0b29sY2hhaW4gbWF0Y2hlcyB0aGUgQU1EIFhpbGlueCBkaXN0cmlidXRlZCB0b29s
Y2hhaW4uDQoNCk9uZSBzdGVwIGF0IGEgdGltZS4NCg0KPiANCj4gLS0NCj4gTHVjYSBDZXJlc29s
aSwgQm9vdGxpbg0KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0
dHBzOi8vYm9vdGxpbi5jb20NCg0KQmVzdCByZWdhcmRzLA0KTmVhbCBGcmFnZXINCkFNRApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
