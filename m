Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB47C54EAA
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 19:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEC54611F6;
	Fri, 27 Jan 2023 19:32:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEC54611F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9jgkr_Q60BA; Fri, 27 Jan 2023 19:32:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00717611F1;
	Fri, 27 Jan 2023 19:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00717611F1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E557E1BF2FD
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 19:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AAD981E32
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 19:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AAD981E32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wADxrR-4-iH0 for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 19:32:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4855481E2B
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::607])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4855481E2B
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 19:32:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2q5zSPXMkP6TSLuNK7AeoQHVweqRno/TmjkYSihhTEFO5LtgERs9SQB18RVLFRRY8126haHcWUF6LDO7RVkfDbIaAtsFA4+wzVhHjPXIETgK8vwIOXjAN1ue5uTLfPkvXtZHy9lzx3Kc9q+2ari7E7NJAm49KW5VmHdy/t3dx3PEzWw8e2i7oopBxOmZ9msndGOmWyyyFcih4igZEgLQt33fXW7lRzdVGAxHp0oFb//DKtwu53twbH3khcUc8LTbiN4LSaR9OqR2+T6p57R845wucJGysrQeO6k6pRNVptcSACE3yK5VjKr0sulw/WvlpmNvx7i173XY2ZysSh8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4zPTXEtojEuwzrxfMz5PMYtgfehqFlIeqp2hmv9uZY=;
 b=byvq4A+03l8nAylRIu9L3cSuGdRDQc6HfFl/cyTsIWuCHluyaVoF0AgZzwJ7iyEX0OHZkfeoYM/NrvqMzb57d4fRDwVBoad5Mj3lkMAGqHh4zmw1WbHjdQIkqPliXmnUlloYG0xldKRr6RBspfcVXeIQxSZ15ilM2O9uqIgdcPe/kIw6xG3hU5WaR4krWXr0vURMZ2nXbUROXzsMe/O0KZfH8tI6SPrUUUZEoGMnUsvGh12dgYIg24lEjD/t/RhPrdOdB8Fcg/5hODKJdRagcMbhkSZuXH58LmBhAycgWiGp4SQ6PiL1VA+fHIG7nwmmpbOTvPcR5difAKQwdB/Pgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MW3PR12MB4507.namprd12.prod.outlook.com (2603:10b6:303:2c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 19:32:01 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::6b2:a11:b5b7:1e59]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::6b2:a11:b5b7:1e59%6]) with mapi id 15.20.6002.033; Fri, 27 Jan 2023
 19:32:01 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v4 1/1] configs/zynqmp_kria_kr260_defconfig:
 new defconfig
Thread-Index: AQHZFgoMZwhdvNQ7zk+o5o4BXtj+ga6DCHQAgC/EJQCAABNhBQ==
Date: Fri, 27 Jan 2023 19:32:01 +0000
Message-ID: <AF9F16A5-565A-436E-8AC1-0F57096677FB@amd.com>
References: <20221222133350.13402-1-neal.frager@amd.com>
 <20221228095626.2976f2b3@booty> <20230127192240.096828b2@booty>
In-Reply-To: <20230127192240.096828b2@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MW3PR12MB4507:EE_
x-ms-office365-filtering-correlation-id: 0ae5e8ec-9b77-4f7d-7bdf-08db009d29c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: taAjcuox648iE3I2hpI0dqEd+PDr//7FWZQjEV1pu2XuCUULTjqpD66w8VlF6m6xylMWoCPZKg6I3ZLs1P11b5JVqu9lkRlqGypJ41iatDEA+DbrKTygyd5YdbpamSmHIFINJ27uxsgSJgnJB7BNdyLDFm0J1YBlBkxtLaz+ceotS2kos00JFAKrAKAoN98veo67f9QaL1G7F+4XoVm4YYqjRUVS/Q3mjo3HzX7N93Xzc1KcS40yBpY5Xg2UufHWIIAmNwIX06aEhJ/NLreNzL4acM+dHDBOmdUgrAoaVw9UpkzwclpTPj8mKjUBrxiBvYp+kMx284bAroSiGu93FsI22Zh6j0/fWvRKlRecb5TTV2pMsXxsJaNgvqgIhIYm1j/8L/l+hmFmuRR/4/tdO/GusTiUe76RghbJAwvOojSinC67RC353EzbG/SibwlE/7R/SeBRK0zG0kCZilizsdTmGvR+rLXHT5lmr84jEbMcwJmTDJc98/wh2FQjydrKyiv+VUxXGgcaRPzHUOBZBiVDUbpaZXwD3Ubrtv7Qfu20w9SD2Mm3V8buKUrAzY6ibWL5h0P4/YCJcQ7E2K1YqiMmPlP7D90n5cTe34z36F1jb+s+t5j4ha8GNj1bvxxifMOSNEi9t3d3ReBTe066DiKJsDj/siE8OVv/6iQ2W9T87hVHaIXhIzAajsrbPTUQkathJVBkNb1wpu0qim9+DAilj2ZMZfhuhPl2C/7WQD+euBggeK1ZpwyK82j1dxgl29b5I4iEJCkpdcfRjxXMwM9GTGufr2QRdyUa2d+3XcU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(451199018)(83380400001)(66574015)(8676002)(71200400001)(86362001)(33656002)(36756003)(186003)(122000001)(38070700005)(64756008)(8936002)(6512007)(2616005)(478600001)(5660300002)(6506007)(38100700002)(6486002)(54906003)(316002)(966005)(66476007)(66556008)(41300700001)(6916009)(66946007)(2906002)(76116006)(66446008)(91956017)(4326008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0g3Y01Ec1VSUkhMVzlyWkUxcm5oRlJEdVN2R2wyZlhPZGNvY0x3S2h2Wkp5?=
 =?utf-8?B?bzBBMkRqajFlSk9CM3RqRzFWbG1OMkRmSG1DNWZETFRMUm1sRVRERzczYVhW?=
 =?utf-8?B?N3U4VFZuZUVWaG56Nld3ZGJhdUtXVXpZVjBNNnJXdGxtWTNhUVBDbDlGNTFK?=
 =?utf-8?B?THNSOS93Y0VHVS84ZjMrYjhMOEhkZ0d4V21LQWxtOEZFVExrTUpXNHVnb0I0?=
 =?utf-8?B?SERPM1NDaGZBNzBMRnNOUDNUb2Rwb3BHdnI2bXl5K1g2Zk16T3FPV2gwcWxN?=
 =?utf-8?B?TzM5Z0VtOTROYnV1YVErYkJ2MENvYVF4clllZE13VEdFMUNESDBZT2ZpOEJ2?=
 =?utf-8?B?VmVSUVkrbDRRVjlwVHhOWXpsTDAxV1FRcEdvYjF3K3oyVGpiRjdNbEE1QnJO?=
 =?utf-8?B?WHBia2g5QVZsRXdFaGdWZHVxVmFTM3VyUnJEcy81ODNuMTFVREcvN1pMcFVi?=
 =?utf-8?B?MGhQSmFoY2ZyamRCTmFlandIbU9OWkkxMzRXTnVDanhVZnJlSUxPV2hJc0ln?=
 =?utf-8?B?YTlFR0RIc2RLOTFDWThxaTljOXN5cHhITEh2dWpTQ1h2NmZrMXJhS0tHS2Yw?=
 =?utf-8?B?SFZlNUVud3VxYk9rcXRFbDZmbWp4RjhzOTdjcE9Icmdqa01XNXkxNXdKeWVS?=
 =?utf-8?B?Mkx1bUFvLzhlQ2NsNU5RaXRhSEtFWW50NlkvdFNEUEpHTnIxN0NyeWpldW0v?=
 =?utf-8?B?dTFmUUF6MkY1bFZvcXpSdzVxdWxUWDBZZUJ1VkpQSWNxVTF5RFZmNFhrYlVQ?=
 =?utf-8?B?MnZiQUhqMnFIMW9hZFE0S21XZjlweGp6d3VsNzRudWJTNktHZWdsTWJFU25B?=
 =?utf-8?B?aTMvNnNJZGdKMnhFVHlWS1NxSlhvMDVoa016NW1GR0lQSXMydHFDZEdMV1Rw?=
 =?utf-8?B?aXg2ZUxjVUZSTVFKMlI2YjZlYjFkRXBwSS9KQkE1d2tYbmdJTDdOZ0tuWWoz?=
 =?utf-8?B?d1djWFYwZVN6SXBSTVVvc2dFU2lnb3NUcEk2akprK2M1d29wRis1VWRPOGZv?=
 =?utf-8?B?T0I1YUx6L1hBR215cXRPOTZOMytKVndwUzBBYlg4aEMvS1l3UGNRVjFCeFV1?=
 =?utf-8?B?UVNsRXpld253bXJhRm50dlg3WnN5OEFHU0xpT0FuWHNHU3VWcU5ON0pNeG9B?=
 =?utf-8?B?WWVna00xekxETlNGOEg5Rk4rek5VZy9pbjRlUG9XalhtVTdhNkIyM1JYQU13?=
 =?utf-8?B?UC9WSDNRV29LM3RmeURFZFI5cXdVL092MHFHWVBIWW5RSzNtSXppS2JpVUlZ?=
 =?utf-8?B?UFc5cGE1REwyT2E0MUpnQWNwb1E3enhnd2xmSm51N2o4WFdGa2FUVlZQUDhH?=
 =?utf-8?B?c2V5WkVHeUZXUTl2aHVBT2EzUjd6SzFTYmxic1VjRHVMUHpUZFlYMkFwQkZw?=
 =?utf-8?B?L1RoS29oTm5KNmFiYUc2NUlQUmJrOWdabEpJM1gwcGs4V2tzOFkzWmRTQU8w?=
 =?utf-8?B?bk40bndpckxKQTdBb2NzUTlFRkZFcU10NHdLSzJDalRTUUp0YjFSL1htVGRa?=
 =?utf-8?B?M0VqanZhOHNGUFU1UFZCTGREWjhFbThFckJwVW5ycG9oNHhZQXZtOVMzN20z?=
 =?utf-8?B?M3RDZEpHazdZNWNZdHI0dzNPY1NERFVjNklyOC9uV2NuN0N0Z2FqaEQxL0Yw?=
 =?utf-8?B?UGllNFRXRXFNWXJrbEl0ZG1Vc2F1bmpqSUFncTN1Tnh5TmZBVDVKU3R4TjVy?=
 =?utf-8?B?MFlFWnY4LzJTK1FKSk14eWFBWDh0OG9IVmJZMzVUTGtpZSt0d2VUV2sxaFZJ?=
 =?utf-8?B?dk1rM01IVlhnQ254K29PeU5JTSs3ZytCckhLVFBqeW1KWGVtT295aWtDSEQx?=
 =?utf-8?B?TjJ6cHpHRW5Xd1NDMDY5Uy9aY3NkbE5Nck9wb1k2YlB1OUhFcjlPRndFVExx?=
 =?utf-8?B?Mi8rK3BMeFozZ2FLeE8vdlpNYkZBSm5uWU84elllSGdSUDZnOFlMSStUa0Mx?=
 =?utf-8?B?NE9Va2JOTnZBbFdkcFp2ZUgvamZaelQ4K2QwMDcra21hV3hPNm9aTXFZQkNL?=
 =?utf-8?B?NC9oTkc1UTdMZEpCRElwY3JUK0RCaUpuYTlJTXhKekUwNUZ3NFozYm1HU3VS?=
 =?utf-8?B?ZkFqcXg2Qml0cVBrdEpEOU9mbkdsYk45SU92SzN0SG5Eai9uUFJwck9Sb1R3?=
 =?utf-8?B?OTVod08xa1NOMmFPbXRTd1pYYVdnbjI4SWY4Y0lTY0s4d3l3YVp2RXFOQWow?=
 =?utf-8?Q?bJ2woUcEKVh+iSbAHEg1yEY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae5e8ec-9b77-4f7d-7bdf-08db009d29c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2023 19:32:01.3640 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 94owrljcEbugLChqEQWxpq4b8IbtoXO2kEKl4rfi9Rcn3E8pJnLC12G/x7Ashn/j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4507
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4zPTXEtojEuwzrxfMz5PMYtgfehqFlIeqp2hmv9uZY=;
 b=tFULM+iCwa4oqUQvAbsk3aOYda0vDlrDmw6f+RXR6XUzYozZ50MZc+YcHDtJvP8MpgEEXAJgvFrNhEYiygEmIVUXE5FgEzbzaoZ9I64/+dxEMC+RK4mVJmjxGFBJNHS7CICa5uu/gDQU/9SxS6R0SPuUON8OnEz2T5JpH3CLifQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=tFULM+iC
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v4 1/1] configs/zynqmp_kria_kr260_defconfig:
 new defconfig
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVjYSwNCg0KDQo+IExlIDI3IGphbnYuIDIwMjMgw6AgMTk6MjIsIEx1Y2EgQ2VyZXNvbGkg
PGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoNCj4gDQo+IO+7v0hlbGxvLA0K
PiANCj4+IE9uIFdlZCwgMjggRGVjIDIwMjIgMDk6NTY6MjYgKzAxMDANCj4+IEx1Y2EgQ2VyZXNv
bGkgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOg0KPj4gDQo+
PiBPbiBUaHUsIDIyIERlYyAyMDIyIDEzOjMzOjUwICswMDAwDQo+PiBOZWFsIEZyYWdlciA8bmVh
bC5mcmFnZXJAYW1kLmNvbT4gd3JvdGU6DQo+PiANCj4+PiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9y
dCBmb3IgWGlsaW54IEtyaWEgS1IyNjAgc3RhcnRlciBraXQuDQo+Pj4gDQo+Pj4gS1IyNjAgZmVh
dHVyZXMgY2FuIGJlIGZvdW5kIGhlcmU6DQo+Pj4gaHR0cHM6Ly93d3cueGlsaW54LmNvbS9wcm9k
dWN0cy9zb20va3JpYS9rcjI2MC1yb2JvdGljcy1zdGFydGVyLWtpdC5odG1sDQo+Pj4gDQo+Pj4g
V2hpbGUgdGhlIEtyaWEgU09NIGlzIGJhc2VkIG9uIGEgWnlucU1QIFNvQywgdGhlcmUgYXJlIHNv
bWUga2V5DQo+Pj4gYm9vdCBjb25maWcgZGlmZmVyZW5jZXMgZnJvbSB0aGUgb3RoZXIgWnlucU1Q
IGV2YWx1YXRpb24gYm9hcmRzLg0KPj4+IA0KPj4+IDEuIFRoZXJlIGFyZSBubyBib290IHN3aXRj
aGVzIG9uIEtyaWEgU09Ncy4gVGhlIGJvb3QgbW9kZSBpcyB0aHVzDQo+Pj4gaGFyZCBjb25maWd1
cmVkIGZvciBRU1BJIGZsYXNoLiBBIHByZS1wcm9ncmFtbWVkIGJvb3QuYmluIGNvbWVzDQo+Pj4g
d2l0aCBldmVyeSBTdGFydGVyIEtpdC4gVS1Cb290IGNhbiB0aGVuIGZpbmQgdGhlIExpbnV4IGtl
cm5lbCBhbmQNCj4+PiBmaWxlIHN5c3RlbSBvbiB0aGUgU0QgY2FyZC4NCj4+PiANCj4+PiBPcHRp
b25hbCBpbnN0cnVjdGlvbnMgZm9yIHVwZGF0aW5nIHRoZSBib290LmJpbiBpbiB0aGUgUVNQSSBm
bGFzaA0KPj4+IGNhbiBiZSBmb3VuZCBpbiB0aGUgcmVhZG1lLnR4dCBmaWxlIGFuZCB0aGUgbGlu
ayBiZWxvdy4NCj4+PiANCj4+PiBodHRwczovL3hpbGlueC13aWtpLmF0bGFzc2lhbi5uZXQvd2lr
aS9zcGFjZXMvQS9wYWdlcy8xNjQxMTUyNTEzL0tyaWErSzI2K1NPTQ0KPj4+IA0KPj4+IDIuIEty
aWEgU09NcyB1c2UgVUFSVDEgZm9yIHRoZSBjb25zb2xlIGluc3RlYWQgb2YgVUFSVDAuIEZvciB0
aGlzDQo+Pj4gcmVhc29uLCBLcmlhIFN0YXJ0ZXIgS2l0cyB3aWxsIHVzZSBhIHNlcGFyYXRlIGV4
dGxpbnV4LmNvbmYgZmlsZQ0KPj4+IGZyb20gb3RoZXIgWnlucU1QIGV2YWx1YXRpb24gYm9hcmRz
Lg0KPj4+IA0KPj4+IFNpZ25lZC1vZmYtYnk6IE5lYWwgRnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQu
Y29tPiAgDQo+PiANCj4+IFJldmlld2VkLWJ5OiBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xp
QGJvb3RsaW4uY29tPg0KPiANCj4gVGhlIGRlcGVuZGVuY3kgcGF0Y2ggZ290IGFwcGxpZWQgdG8g
bWFzdGVyLCBzbyB0aGlzIG9uZSBzaG91bGQgYmUgY2xlYXINCj4gdG8gZ28uDQo+IA0KPiBTdHJh
bmdlIGhvd2V2ZXIsIEkgY2FuJ3QgZmluZCB0aGlzIG9uZSBpbiBwYXRjaHdvcmsuDQoNClllcywg
SSB0b29rIHRoaXMgcGF0Y2ggZG93biBhcyBJIGRpc2NvdmVyZWQgYW5vdGhlciBpc3N1ZSB3aGlj
aCBpcyBlZmZlY3Rpbmcgb25seSB0aGUga3IyNjAgc3RhcnRlciBraXQuDQoNCk9uIHRoZSBrcjI2
MCwgdGhlIHNkIGNhcmQgaW50ZXJmYWNlIGlzIGNvbm5lY3RlZCB2aWEgYSB1c2IgdG8gc2QgY2Fy
ZCBicmlkZ2UuICANCg0KVGhlIHUtYm9vdCBwaW5jdHJsIGRyaXZlciBpcyBmYWlsaW5nIHRvIGNv
bmZpZ3VyZSB0aGUgbWlvIHRyaS1zdGF0ZSByZWdpc3RlcnMgY29ycmVjdGx5IHdoaWNoIGNhdXNl
cyB0aGUgc2QgY2FyZCBub3QgdG8gYmUgZGV0ZWN0ZWQgaW4gdS1ib290Lg0KDQpJIGFtIGFibGUg
dG8gZml4IHRoZSBwcm9ibGVtIGJ5IG1vZGlmeWluZyB0aGUgcHN1X2luaXQgcm91dGluZSwgYnV0
IHRoaXMgaXMgbm90IGEgcHJvcGVyIHNvbHV0aW9uLg0KSXQgY291bGQgY2F1c2UgcHJvYmxlbXMg
Zm9yIHBlb3BsZSB1c2luZyB0aGUgazI2IHNvbSB3aXRoIHRoZWlyIG93biBkYXVnaHRlciBib2Fy
ZCBzaW5jZSBhbGwga3JpYSBiYXNlZCBkZXNpZ25zIHVzZSB0aGUgc2FtZSBwc3VfaW5pdF9ncGwu
Yy4NCg0KSSBhbSB3b3JraW5nIG9uIGlkZW50aWZ5aW5nIGEgcHJvcGVyIHNvbHV0aW9uIGJlZm9y
ZSBicmluZ2luZyB0aGlzIGRlZmNvbmZpZyB0byBidWlsZHJvb3Qgd2l0aCBhIHY1IG9mIHRoZSBw
YXRjaC4NCg0KPiANCj4gLS0gDQo+IEx1Y2EgQ2VyZXNvbGksIEJvb3RsaW4NCj4gRW1iZWRkZWQg
TGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KPiBodHRwczovL2Jvb3RsaW4uY29tDQoNCkJl
c3QgcmVnYXJkcywNCk5lYWwgRnJhZ2VyDQpBTUQKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
