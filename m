Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6359FC433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 04:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A900483252;
	Fri, 13 May 2022 04:21:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nFjtmQi9m2-w; Fri, 13 May 2022 04:21:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F3A383211;
	Fri, 13 May 2022 04:21:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDDF41BF314
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 04:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D94144155A
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 04:21:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id txHY8k-RYc8y for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 04:21:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::602])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95A3D403A8
 for <buildroot@buildroot.org>; Fri, 13 May 2022 04:21:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDQH0Qt3V+RF6FOwO2ExAAWqp/w+JIF3KFJACIfpbDPfwsYjNEg7w+Pth/cpn7XJHQgKzdDdahHUVbtgLr4UBlmRJNkiqnfCg6Kl9jtjT+zmu/rHM6asIE5NcPvvGjgyNqK5h+ZMdrz1xpQ3v3XIuOcTfhoJgJ2l8MPVNGG2+MUU+xV6xfVQou9rFGd4E7mdrogoVzBqhDBJ1nW76zOCHxxyb//ygB42MB7FmdZwWrbNMX5qa+iJYw7rcdr9fFGMZWOnxRGiySmvtvuOKaTahDOm9DeSZ8zBVtEwKf7GZeMO7myLyqFuc6DxBKCFX3uOzPEsFA9mGuVj1A/UW65o8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXTi53A1PzSwwP5VV0D567OWXwHrJTxiXZNijSD0gYk=;
 b=gC3Ll4zAazRckAdn/FVU1hr6MIdmn+wnb+hg8nExQ+a+tgRLCemiyGHYnqhVPUCl7JB7ObJqcZF5k9g/XNr9J3HNP4vBzIZ8QGHrxd9jji5KbA64TtMka/Mpa5yEUDJJDwm2CeGOm1tzo4VNUF9QHju4zKF5Ej9fhB8byVsaI1VWZHrG3Wcdp8JvtvRBe2xG3lE+rKH4GD6mXtHNEqNuURYWRbO8xgcQOUnDcMiVedR6hSt1WS4BI5DEY84580M4jDj7lCq7Zob795A+XvZcL1yBM3cImutZtZgCdv8kzVtWsjhlrSJFD9DjoRdnpMCigUoUUkIuI1r/bI35wtOFxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXTi53A1PzSwwP5VV0D567OWXwHrJTxiXZNijSD0gYk=;
 b=j655SF+M5QPSPuZqYlQm4QhIeAe+WGJe3skgnf4FOVOfCsACDkdXGscQLnm6eg48YzhT4U8uhIxlzPAeNwZwky8MqlQkhO//sjCd4Md1dyiqZzBlqZQhZqT2BSbBLShl/lLgI3TlzzA/Hcp4/ml4iMnC3Pq3xnivL1ChM5fWwXo=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by SJ0PR02MB8468.namprd02.prod.outlook.com (2603:10b6:a03:3f8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Fri, 13 May
 2022 04:21:13 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%5]) with mapi id 15.20.5250.014; Fri, 13 May 2022
 04:21:13 +0000
From: Neal Frager <nealf@xilinx.com>
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig: transition to
 tarballs
Thread-Index: AQHYXwIELEy/0Pm99UOOfHYHNJ8zuK0OSCO6gAAGK4CACyHP5oAAHg6ggAAnsZCAACrQ24ABfTcAgAAZeWeAADjQu4AAk5KB
Date: Fri, 13 May 2022 04:21:12 +0000
Message-ID: <B695963F-1D4C-4D05-B152-54F424FE025B@xilinx.com>
References: <20220503152425.1069617-1-neal.frager@amd.com>
 <20220503152425.1069617-2-neal.frager@amd.com>
 <87h7653i8q.fsf@dell.be.48ers.dk>
 <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com>
 <87ilqccu3k.fsf@dell.be.48ers.dk>
 <SJ0PR02MB7758738449EEBFE4991D7973D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758FE7F237530275606A745D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <875ymcawvb.fsf@dell.be.48ers.dk>
 <56c3feaa-cbd2-eaa9-7800-cd2102fa8545@lucaceresoli.net>
 <D9EEAC86-D8CB-46E0-A019-B0F792B0511C@xilinx.com>
 <874k1ua6mw.fsf@dell.be.48ers.dk>
In-Reply-To: <874k1ua6mw.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23b64faf-1f2a-4548-3dcc-08da349803cc
x-ms-traffictypediagnostic: SJ0PR02MB8468:EE_
x-microsoft-antispam-prvs: <SJ0PR02MB8468F3FCFBC76C6B55AF5E12D7CA9@SJ0PR02MB8468.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yM/UW/ZHRGzzEMV4YH1f5yy8m5b3r/dLOT1Hl9I/XE6N+5/4RAwJaAztbQ4SzHOfOSQTIDWTgC9k+bknq9Crf8pJ5uHO0sTziM1fdkAbnat65f8E4v5ybDz2mYXZc0QWhvFA58IOmNptkN/AWz3+pdXDo+lC5MzBng93z9GxCN/DPAh7UjJrbbV699+dbtfShtHyBbFs/lSDeC2CA4JlslH3Ob/i4UFHCB6+3PlGLEDFzy9awV4idjgFH6Lf2lxhUUIQ0NkcLpvJ8UVNdcovoIfUYmBBbeJByi6WNYgO8/ep4z/b9kI8x6l48XKbhRJ3me9+Z1s32pWidJtqBzRF0vTw72ZWXq5Fl/YEniOS2Yplux+GjgffFUfb8d2pHDt1A0D0HtTN3/8zHsJlq2zModKIlRx1rmds8grG4fx6dtjKaEJvEInh/vRwpb2xAwmJj4qPfdmk4UlWd5BU+5Y1RmX/NqG4T8FzA7soqbcQJRiGqjxo9gSR7w3JJYW2qWsyia6hnBZc1C7p6yBCVrQediHx0ztNLvHvw9hQdH3CY3Imnm0sNVVHxwa1zx1oePKKcqR1wUzaxmcB9g11KQrya7vp8+TKEzwkqbrBcfHQ7nkxCA8+5QKWq63ExU1fPvScH1+8V9FuU9pC7/jPmnh9jtA0g6gyj4XDeQ3EBtgAOB8NOrJJtI0lNKIz1etvKuPfg6dZ2xDRnO34NlVJaHlFYSVwEzFYA9S8mLMLzvW2oojmDORGjKeh9McEqYAjSd/S
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(86362001)(8936002)(33656002)(6486002)(122000001)(5660300002)(508600001)(6506007)(83380400001)(6512007)(2616005)(38100700002)(26005)(38070700005)(66574015)(71200400001)(186003)(66556008)(66946007)(54906003)(66476007)(316002)(76116006)(6916009)(64756008)(66446008)(4326008)(8676002)(36756003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUkySDQvanROUVFteVNXeXFxTDZEaGFvdWJscnRrNXExRFFFMFBZZ29FTWxC?=
 =?utf-8?B?elQxdTFaNWZ2WlI1ZG02WE5oVGtkQ21ic3dPdkJ3RGpoSjdTckFqZ2d3SFdG?=
 =?utf-8?B?M3BCY09qcE9lODNKRng2bklkbXNQQk83WXhLcDF3emY5RE1ZNHVOVEhZWjgr?=
 =?utf-8?B?YUx5UFpWMWtHb0RTQ3BaYTBwRUhoUHFBQTRlN0ZDcXJmNGdKYjYxaHVUbjlW?=
 =?utf-8?B?WGU1aExJV2xzK3JHUUkvd0VzdDhXdXVmVkxpSTR4YXpNclVWM0FLbElZUkRJ?=
 =?utf-8?B?TTNucUV5QStWOTYxeUFSRWR4bkJjbnBQNElLWnRpT2JxNWJyUWpIZlYzRk5Z?=
 =?utf-8?B?bkpFLzNQbHUrYkkzYW40cmRMK2w2WXYxUWZOVkczelRWaW9NMlB4blBsaG9W?=
 =?utf-8?B?aW4xRi9aeWtjNEM1R05tRVVNQ1p2RDAxc0FnRm5iQUhaSG5ZYzFWWnd6N0tH?=
 =?utf-8?B?VmNKV25kblZoeU9IUXZuNi9kcGFmZ3poeHEweGc0UHBsWkt4aHQxcTZjR1My?=
 =?utf-8?B?MWVGb0UyWURRTXphbzV2d29kN2tzeVA3MmtZRUwvS1lLMUh4WlRyTUlQZFlS?=
 =?utf-8?B?U2RJS1dtcDFNTW5ROWgzTjUyU0RHT0kvVktpNnlOdjh1WUdLNGJmRDdXYi9i?=
 =?utf-8?B?eUV3ZWN4Q012U1EwRWZFTkRMSDVFQzZwN2o4RkZLdWpTNlR1TWxzQzBheEpu?=
 =?utf-8?B?ckpyc2FURGxicFFjdk9FRTkwdG9Nbm1lcUkvVWpjajE2MWdFRlJWOXpaN2lO?=
 =?utf-8?B?YnY0MHh0VU1IakYyUW5PaVBjT25ack9UZ3JXdjNvc2FzQTY3QlYrRlo0Sk1x?=
 =?utf-8?B?MGplb0g2NnJMa2wxTWJLdE1Wd3o1NElTNGNqMy9Dd00rbzhkU21uTm1MQWFL?=
 =?utf-8?B?VXJQSUZvdDliZDVTTTU3N0tHWDZSRVhReEtDZGxadEYxNTVOOEdSMk1jenZV?=
 =?utf-8?B?RzVFcG5xNng3dlN1aXhxMDNLK2FoMzY0b05rZXI2MjJPTnllV1pvdGdPLzZJ?=
 =?utf-8?B?S0ExQnZyU0gwRERNeFhIa1hkTkNXTWIyYzlIQ2xkM2NRa0ZhQllQYXdHWEJk?=
 =?utf-8?B?QXZ4NkhjN0VGTCt4b3ZHU0JtV01mR0lPNTdpaDhRbzQ0OFBMTHRVenZmRmR4?=
 =?utf-8?B?VmdMbDBrK3A3anorUzdNaHhGeHBjTlIxV1lTNzRVZHpxaitXNnE1Q0pDWXhy?=
 =?utf-8?B?cE1HVm9zTitlaG9vVk9pVmVXQ1RCSzhFWEZ6T0QvM3RhSzg1QngyeWVLclNT?=
 =?utf-8?B?aU93ZGQwL2NzQ1VJbGtPSloxa1VvcG9NVkUvNVZwdmd4S1NaWlRYd3BHUTJF?=
 =?utf-8?B?Y0ZweDVWSTQ3dWQyVUc3eUtpVkVLL0VBckg1SVBkd1QzZENudEdGdEw0SmF4?=
 =?utf-8?B?TXI4TmdaSE5ZSUx6M0hPZlg0STgvYXdjOGVwRFY3STdiczJIK0JxK0NaTGM2?=
 =?utf-8?B?bTZtQkE2clRkcFU4K3ZUb05pYWVJeUdraXUrSzlwWlZGNGUraTBOU1dXZVpD?=
 =?utf-8?B?R1ZKdDhidTduRHloeGhmUFlqcm1JZkp2dTdnMndoMEhGNHVzOU9JOGwzSUpn?=
 =?utf-8?B?Y1R3Ykx6STFQVWNrVVB6QlRvaFVXcXNQVGJkU0Fsay9JWmxITkhHYXpUeS9K?=
 =?utf-8?B?d2lVdENkOE9IdFR5enM0bVZaaDEwdkphTkRkVUFKZkx1R3ljODJQc3R3STU2?=
 =?utf-8?B?cGhPZU45R1RoaG54c1lJWitTV2xxQWtsTFJvd2h3c0xaQnhoWWlxOWhRVDM4?=
 =?utf-8?B?Y0o2V2NjWExmVW5Qd1U1SDVybjJLQzIxWk4xTVZmREZxeWo2eUNieEd3WUgz?=
 =?utf-8?B?WTQvVnd6eUdtTXhRanB5cFFUUXdyWnIrcXJQR2N0M3NGc1V2TFRzeWNiZEkx?=
 =?utf-8?B?M3UwbEhLZDRyYTdoVEtXN0hueDY1dmdCVGEvTGJnT01CS1lPRDVQL0R0bXJI?=
 =?utf-8?B?c2RsY05RNWhucW1nNFlSczRmcVdaLzlUbngyMkN1YWNKdGFOL3JqcE5ta2Uy?=
 =?utf-8?B?TDZmazFKdkxkd3gxV29lZHF5U29uVTRqQ05rSHZOL1FDaXpqTFBCK3JhK3hY?=
 =?utf-8?B?V09MSjFmajQ4VW5EeU5aNEc3QW1ubGkyamY1S1hOTUZ5cEQxNE9SdHN1U25K?=
 =?utf-8?B?TlhaN1pUZFpDYkNvdEd4STRIOVFrdmx4a0VPRUNlMEZrSTlodzltNGlnRW9k?=
 =?utf-8?B?Y25rREhvRU9RYjdlUGhXZzB6bmV5dnhseWtxdHI0VVlMeWhibnU1RkMxWDl2?=
 =?utf-8?B?WmR6ZFZqNml1UVlqdDExOTJqdW1CK2gzOEtNYnAvT1hNd1NWZFRvMFBmVkNU?=
 =?utf-8?B?ZThvVFBES0JyNXhsaEN4SGM5VE5qcWNjamlUMTVpSkpJTlBSMFJEQT09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b64faf-1f2a-4548-3dcc-08da349803cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 04:21:12.9111 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: htgAEMaDegki9OacU1i+bg0IT/WSDcOl6kdSWXhQGUhsyh+u+qK4ce85YVx8eSPvny7weIMMU8HPQpPBl40L7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8468
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig:
 transition to tarballs
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Michal Simek <michals@xilinx.com>, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsIEx1Y2EsDQoNCg0KDQo+IExlIDEyIG1haSAyMDIyIMOgIDIxOjMzLCBQZXRlciBL
b3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IGEgw6ljcml0IDoNCj4gDQo+IO+7v0NBVVRJ
T046IFRoaXMgbWVzc2FnZSBoYXMgb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4g
UGxlYXNlIHVzZSBwcm9wZXIganVkZ21lbnQgYW5kIGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFj
aG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZyB0byB0aGlzIGVtYWlsLg0KPiAN
Cj4gDQo+Pj4+Pj4gIk5lYWwiID09IE5lYWwgRnJhZ2VyIDxuZWFsZkB4aWxpbnguY29tPiB3cml0
ZXM6DQo+IA0KPiBIaSwNCj4gDQo+Pj4+IEkgaGFkIHRvIGFsc28gcGFzcyB0aGUgLW0qIGZsYWdz
IGluIEVYVFJBX0NPTVBJTEVSX0ZMQUdTIHRvIGdldCBpdCB0bw0KPj4+PiBsaW5rLCBwcmVzdW1h
Ymx5IHRoZSBwZXRhbGludXggdG9vbGNoYWluIGhhcyBpbmNvbXBhdGlibGUNCj4+Pj4gZGVmYXVs
dHMuIEx1Y2EsIGFueSBzcGVjaWZpYyByZWFzb25zIHRvIG5vdCBwYXNzIENGTEFHUyB0aGVyZT8N
Cj4+PiANCj4+PiBJJ20gYWZyYWlkIEkgaGF2ZSBubyByZWFsIGFuc3dlci4gOiggV2hlbiBJIGlu
aXRpYWxseSB3cm90ZSB0aGUgc2NyaXB0IEkNCj4+PiBkaWQgaXQgdG8gaGF2ZSB0aGUgc2FtZSBs
b2dpYyBhcyBwZXRhbGludXguIExhdGVyIEkgZGlkbid0IHdhdGNoIGZvciBpdHMNCj4+PiBjaGFu
Z2VzLiBJIHdvdWxkIGxvdmUgdG8gYmUgaGVscGZ1bCBidXQgSSBoYXZlIG5vIGFjY2VzcyB0byBh
IHp5bnFtcA0KPj4+IGJvYXJkIG5vdy4NCj4gDQo+PiBXb3VsZCBpdCBiZSBwb3NzaWJsZSBmb3Ig
eW91IHRvIGp1c3QgaW1wbGVtZW50IHRoZSBjaGFuZ2VzIHRoYXQgUGV0ZXINCj4+IGhhcyBwcm9w
b3NlZD8gIFBldGVyIGFwcGVhcnMgdG8gaGF2ZSBhbHJlYWR5IGlkZW50aWZpZWQgYSBzb2x1dGlv
bi4NCj4gDQo+PiBCb3RoIFBldGVyIGFuZCBJIGhhdmUgemN1MTA2IGJvYXJkcywgc28gd2UgY2Fu
IGJvdGggdGVzdCBhbmQgdmVyaWZ5DQo+PiB0aGUgdXBkYXRlIHdvcmtzLg0KPiANCj4gU29ycnks
IHRoYXQgaXMgbm90IHRydWUuIEkgaGF2ZW4ndCBmb3VuZCB0aGUgbWFnaWMgaW5jYXJuYXRpb24g
dG8gZ2V0IGENCj4gd29ya2luZyBwbXVmdyBidWlsZCB3aXRoIHRoZSB0b29sY2hhaW4gYnVpbHQg
YnkgY3Jvc3N0b29sLW5nLiBNeSBkaWZmDQo+IHdhcyBqdXN0IHRvIHNob3cgd2hhdCBJIGhhZCB0
byBjaGFuZ2UgdG8gYWRqdXN0IHp5bnFtcC1wbXVmdy1idWlsZGVyIHRvDQo+IHVzZSBhIHBldGFs
aW51eCB0b29sY2hhaW4uDQo+IA0KDQpJcyB0aGVyZSBhIHJlYXNvbiB3aHkgd2UgY2Fubm90IGNo
YW5nZSB0aGUgenlucW1wLXBtdWZ3LWJ1aWxkZXIgdG8gZG93bmxvYWQgdGhlIHNhbWUgdG9vbGNo
YWluIHRoYXQgcGV0YWxpbnV4IHVzZXMgYXMgdGhlIGNyb3NzdG9vbC1uZyB0b29sY2hhaW4/DQoN
Ckl0IHNlZW1zIHRvIG1lIHRoYXQgdGhpcyB3b3VsZCBiZSB0aGUgYmVzdCB3YXkgdG8gYXZvaWQg
cG11ZncgYnVpbGQgaXNzdWVzIG1vdmluZyBmb3J3YXJkLg0KDQpBbSBJIG1pc3Npbmcgc29tZXRo
aW5nPw0KDQpCZXN0IHJlZ2FyZHMsDQpOZWFsIEZyYWdlcg0KQU1ECl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
