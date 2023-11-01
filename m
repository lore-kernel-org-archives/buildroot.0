Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05310C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 10:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F49C8495C;
	Wed,  1 Nov 2023 10:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F49C8495C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zMrxM94OawGk; Wed,  1 Nov 2023 10:18:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE3248496E;
	Wed,  1 Nov 2023 10:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE3248496E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB9031BF354
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 10:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B4544307B
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 10:18:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B4544307B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J1wyu-5pcLTM for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 10:18:41 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 421A94307D
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 10:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 421A94307D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibEzzqhRITWSaMb0+m6Z6z9qAYgREHjp/YF4Icm3Mjrg2E/CDOleH30RQ7cAHqGVyTuOMKgzstwb/9YcFRS4rbtUpdM0lboRvg7rTV0tt+F6wtat+na5+hhB14nw+6xaGkyGRmgn8ZH9LgBkCWIWR6ZoraJ1CWhx0wPWvuOJwE7kSveGRBo2v1qf+Z3CcS0qRYAUGE8f/Zy+M+kCFn0FNzTwmeS2VpkwwUZkXMEoq3qLLvP/jEA7d4EY5P/mvUeXYnrIxB3CD1PeLgotOsiy3f998v9dNIc3ucJb86EA5Brfwm0ggQ5Crb3+WT+Hw9XlxXXxzSu4ZqAk+6Rb7GmifQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=869srp/hBfWjEg7ea50xVnHgTSYuknnpuBz8EFQDLPo=;
 b=W3tv4g7OeypIWRspejpjhZRh6ZtzqemVuL1t1mc7Qb4+R45GAg4H5c+kjT+WYo5eJa+XD8CvRR1+wBKhrcCEdHB1tWJyUF1ojyz/qbyECBCXhvQTOjIj1Ih4ReE0t0KpJIit+Xv871a+6WXgRdvKgBCIMLNA3ugpDhh4n3kbevIhBJKfQv+dzyLO4lOuoCKQGGTapNUj8elDxX9Er+PsL24EqjDYiRA+ditEm+c222oHyT23pJk4oiHYzL29RIqxD89YwjsrZWMyAohBPf6HQG5GiCZFEUiaR4zFH2xFadljjSwh9RwbzvSb0E/T2ob4on2fUbbWEmAFIMAHqWYurg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DS7PR12MB6008.namprd12.prod.outlook.com (2603:10b6:8:7f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.25; Wed, 1 Nov
 2023 10:18:35 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50%4]) with mapi id 15.20.6933.032; Wed, 1 Nov 2023
 10:18:35 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v6 05/10] boot/zynqmp-firmware: new boot
 firmware
Thread-Index: AQHaA0qjYN8AN4TDkUGlzUkiZkQkk7Bj7CSAgABnBOCAAPC7AIAADxLK
Date: Wed, 1 Nov 2023 10:18:35 +0000
Message-ID: <075042B7-9496-4D6B-92EA-51B515465DD1@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-5-neal.frager@amd.com>
 <20231031135419.56b25f1c@windsurf>
 <CH2PR12MB50047AC40733F136A2AE7DFAF0A0A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231101102438.3bdf8707@windsurf>
In-Reply-To: <20231101102438.3bdf8707@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DS7PR12MB6008:EE_
x-ms-office365-filtering-correlation-id: 4f3e5eee-d9eb-4f12-bb01-08dbdac3e82e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zIYfLkTHSHJxNEOoKyEs/iSUa67KLZhgRk8NfNkmM7tYUy3IqIss4/0zOuMIpza/u9TgIrppiFXl81EXRrpvKkHneiGn1UgkGubZpmekxb4h3CsEGEfPyDHpD9+bWtWh3rQy83054f4kjHBRAHRIGCXmT+bow/SLT20tBCYsSt2iYQw3PfJ37S7YDqdTbIGcR1MzkCxZybxqGLXvoPB3bJzq8Hg1xbUIMJLfoalCZbb4eLENLvboBuSIFm4xkKY4RbgXzGiBYeAFAp0kXDqCD9j5jR7+A06KcDjMWvF2eGqr9bKsf2LiRnRjAPtVi3IPtx2P4PvKctOmkY9zPk0x4mlvMipeVLLYisH7owZ5Uf18iuo54C354C8fEqy7E+C+IlkHc4aYwTuFpTJeYYEtJCuVgMuzuHwndxH0U0KYg9PKZWEHeoYQQ49u6zyOaRSUk4BL8/mUxsVcH4WyrE1mQ3Ea1kaOQ/m/fQ/omd/mdot4ntO/SJD/fUHpVe+mFyZa2PO6K1wBwGdfmkdxYinuv5TBfgnP7Nyro0BsRjcteYEsC1EjyNErILunhjkH0ax8Ea+o7Z7MvJNyI0GLYhXx5o9+nXGQeNT+Sti3g19Sfl2MNnR43JDW13M81trCGNfGCYX897mKmBpPY1xjFyv8eg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(39860400002)(346002)(366004)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(122000001)(66556008)(316002)(64756008)(91956017)(5660300002)(6916009)(83380400001)(76116006)(54906003)(66476007)(66446008)(66946007)(26005)(2616005)(38100700002)(8676002)(4326008)(8936002)(41300700001)(71200400001)(478600001)(6486002)(6506007)(2906002)(6512007)(966005)(86362001)(36756003)(38070700009)(33656002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmllSTRiSktVTkFKcWo2ZVJLNENCTmxCOEJRMWVtd1ZabTlZV2pTb29leFBX?=
 =?utf-8?B?K0c0VTBwTGhBcXNIbTVNUDl2U3l1SmRyMHBtMDNlaUpyK0QrN0hBR3FPR0hT?=
 =?utf-8?B?QTdxekVQTFdxSmdQMVYwaEU2WWV2UkRURXJXdlV6UW9XVEY4Q3dLNVRQWWFi?=
 =?utf-8?B?YTIrSXRRN0YvT0ZkTUE2UXlxMDFzVjAwOEQramVya2xRQkxOSllXUlNFMXg0?=
 =?utf-8?B?ZVd6SUxENWpkRWIydFJIdjFScVJXdzZlZVF0Q01tenh6aUNvYTJ3ZjVVV1h4?=
 =?utf-8?B?VDU5VHBZN0ZTRkhKZWRxcU5CeEZxRnFHR3I5SWdBRVd3WVdqOWNiNFlCQk5p?=
 =?utf-8?B?cWduYWdCWGE3UlpzN2RXbXh1REp5UkQ1VTdqSFlybUFmalR3QS92eWUxMHRK?=
 =?utf-8?B?UU5RTWVuVEJYNHNrM1pQQ2t1RHFMcWRucEk0V2NwRGtHN3JhMGNlZ0xDNC9Q?=
 =?utf-8?B?WTRLdllrSFpLRC9FZ3Y2VmJGRXgxOHFOZGprVHdUUHRqSlNGcGRQVCtFSTUy?=
 =?utf-8?B?Um4ybkMxbWl6dzJ6ZXZ3cjBWMGVreU1Qa1dIZVlmVzhTRUViRlNmUFZBMVVs?=
 =?utf-8?B?elBhTnZZTENkbXcvYUxzY2lZMTIramxrR29yemhad1V2UnBwc0VZRnpmM0J4?=
 =?utf-8?B?emRiU0t3TFVYZUhEMlRwVzF3VGVDM05iRWo0VUxwK2xndTV3WnBCN1pwZ29q?=
 =?utf-8?B?WGlyZURsdXJ6NmlyYksveC82N0ZubGVrZjQwOFdUNWNnaGhOdmZ5M0lrM2Y1?=
 =?utf-8?B?TlhnY1JOZmhDc3F6czIvQnV0MExxalpqdGdqWVk3N0M2dUtoYy9mQjQ3SFZk?=
 =?utf-8?B?OCtXUDZSR0xhWGwxSEE3dUdkRGsrZyttQXJFakxUaE8zd2t2V2piT0VvYmZ4?=
 =?utf-8?B?bVBJenh6b2phSmw5T1YzMHlMK3c1SVZra1h4RDB5NlZPZHVuTjdYQzJyZUdv?=
 =?utf-8?B?UE5xYUNwbmpKWHdkRUdtTHZSTlRWZ04zYy9raG9RSVoxWmNQWVZyTTVTeE9h?=
 =?utf-8?B?V3pQU05MZk9URERDN1ErQUJ2QzZVWjhRUHRWTEZ6eUE0d1RqSGxzLzhYeUZH?=
 =?utf-8?B?RkliNzgxY05EbVFpRk1lYmJhUC96UjBkejJ6UHRHSzVsVWl0SGVIZTFrN3FK?=
 =?utf-8?B?TjViWnpHdm9XeVFLczlXbEc4ZXRNNWVXdlllTHpabEcySGRYUTFGdUxVUFdH?=
 =?utf-8?B?czFIWEVpWDRRQm1MbEZCL0dOcnoxUmpMaEtmTTdDeTBRZndUd0VOUlFvQys0?=
 =?utf-8?B?YUV0NVY3L2t2K2dqUW9mTk9xM29icHI5M1FHQ1EweHlNSlJWaC9wcldLcFA5?=
 =?utf-8?B?OEhIM2FUY096VWREN3pjVlVjZ21GSkpxSzdDZzhWOTFBekkxZ3IxZmZHeGtW?=
 =?utf-8?B?dXVob1dSUXB3dWozZmpNcjZwZW5rTmhQSUpaZ2IwVkdZeFk2RXhOanFjZUNH?=
 =?utf-8?B?VWJTQkNsdTBGdjVoT0Y2bEdiSWd2Qno1eDYzRDFxOFhOcEhzcGJwSEMrSGxP?=
 =?utf-8?B?NGFEK1NiWkM3VC9ML1pvNGYvb1N5dHZ4Rmh4WXRnL0ROdmV2L1BXdVgwZ3Jy?=
 =?utf-8?B?dnRRbng3RjUwRFpyNllDeDZXVVBYQjhQU1BrZTJnUkhwSlV1K1JqZWprc0lo?=
 =?utf-8?B?SmpFbkFqTjFoT09nMHRjSDRpTEdRSkxYYUxGYW9abXN1c3VEQVlBalZ4c01E?=
 =?utf-8?B?UjdwakJURWx2MG5CRThHbGNxRDVsQnNUdVJ0YzNicXdaczNSS0xlbkNhS05U?=
 =?utf-8?B?ZWZtUVFVT3k1aXRoM0wycjZ3QWJVeFFkTlVsU2JCdkRsVXVvQjE5ajIvbkww?=
 =?utf-8?B?SVJuUGxTdTJER0VRUW1Penpvb0ZXTkI0MzErejh1cSthUHoveW9OamRBY3NT?=
 =?utf-8?B?L0NvOWN2U3NpODZqeEJqK2xVY0diV3F1aFlFdlBCVHYvSkFjU2FvWHFKb2F3?=
 =?utf-8?B?TjNNNGlaQ2RxME92eTJBUzJ3MVE5cWRFYk5LYm5BUTZsN0hvSTY0WmpCbVJC?=
 =?utf-8?B?Zm54ZHJQR1k0clVZVUNGU05vYU9UczRSRkk4bFJJcllnVEV3emQ0YWtUMnFI?=
 =?utf-8?B?bUt4bWFhODNzeEk5Y1pPd1Z0RHR2aTZYemt4R20wTWlZVFU3eEhhTkRxZXND?=
 =?utf-8?Q?n62Q=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3e5eee-d9eb-4f12-bb01-08dbdac3e82e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 10:18:35.1618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bXvukeBq5eNhcvw9AzIBgQZHoPx6Z3BaAiHMupv/F2Bbcee0Y8oAuSLrEuWFGT3E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6008
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=869srp/hBfWjEg7ea50xVnHgTSYuknnpuBz8EFQDLPo=;
 b=0VKo5wy12ugLrVOorFkcWl/ii2yYyLrVmeYsLQ0/jTEZR5ue/iuQlg2U/F09f6sd3bguOObjpw+H5c/0tyibeOCOhBiDj1Kdgh03eP++idC4r5+zvS/Ua5K12ldj4JSexkFPBw1DLDOOY6r7DzblGn4Z/EFxTb6qWMAWTnyyjV8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=0VKo5wy1
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v6 05/10] boot/zynqmp-firmware: new boot
 firmware
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

SGkgVGhvbWFzLA0KDQoNCj4gTGUgMSBub3YuIDIwMjMgw6AgMTA6MjQsIFRob21hcyBQZXRhenpv
bmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoNCj4gDQo+IO+7v0hl
bGxvIE5lYWwsDQo+IA0KPj4gT24gVHVlLCAzMSBPY3QgMjAyMyAxOTowNzoyOSArMDAwMA0KPj4g
IkZyYWdlciwgTmVhbCIgPG5lYWwuZnJhZ2VyQGFtZC5jb20+IHdyb3RlOg0KPj4gDQo+PiBXaGVu
IEkgZG8gdGhpcywgSSBhbSBzdHVjayB3aXRoIHRoZSBmb2xsb3dpbmcgbWVzc2FnZToNCj4+IG1h
a2U6ICoqKiBObyBydWxlIHRvIG1ha2UgdGFyZ2V0ICd0b29sY2hhaW4tYmFyZS1tZXRhbC1idWls
ZHJvb3QnLCBuZWVkZWQgYnkgJy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3p5bnFtcC1maXJtd2Fy
ZS14aWxpbnhfdjIwMjMuMS8uc3RhbXBfY29uZmlndXJlZCcuICBTdG9wLg0KPj4gDQo+PiBJIGFs
c28gdHJpZWQgd2l0aCBob3N0LXRvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9vdDoNCj4+IG1h
a2U6ICoqKiBObyBydWxlIHRvIG1ha2UgdGFyZ2V0ICdob3N0LXRvb2xjaGFpbi1iYXJlLW1ldGFs
LWJ1aWxkcm9vdCcsIG5lZWRlZCBieSAnL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvenlucW1wLWZp
cm13YXJlLXhpbGlueF92MjAyMy4xLy5zdGFtcF9jb25maWd1cmVkJy4gIFN0b3AuDQo+PiANCj4+
IEkgaGFkIHRoaXMgcHJvYmxlbSBiZWZvcmUgd2hpY2ggaXMgd2h5IEkgc29sdmVkIGl0IGJ5IGp1
c3QgYnlwYXNzaW5nIHRoZSBkZXBlbmRlbmN5IHN0cmFpZ2h0IHRvIG5ld2xpYi1iYXJlLW1ldGFs
Lg0KPj4gDQo+PiBBbnkgaWRlYXMgd2hhdCB0aGUgdmlydHVhbCBwYWNrYWdlIGlzIG1pc3Npbmc/
DQo+IA0KPiBZYW5uIGp1c3QgcG9pbnRlZCBvdXQgdG8gbWUgd2hhdCBpcyB2ZXJ5IGxpa2VseSB0
byBiZSB0aGUgZXhwbGFuYXRpb246DQo+IHlvdXIgdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRy
b290Lm1rIGlzIGluY29ycmVjdC4gSXQgZG9lcyB0aGlzOg0KPiANCj4gKyhldmFsICQoaG9zdC12
aXJ0dWFsLXBhY2thZ2UpKQ0KPiANCj4gV2hpbGUgaXQgc2hvdWxkIGhhdmUgYmVlbjoNCj4gDQo+
ICskKGV2YWwgJChob3N0LXZpcnR1YWwtcGFja2FnZSkpDQo+IGR1ZSB0byB0aGF0LCB0aGlzIG1h
a2VmaWxlIGlzIG1vc3QgbGlrZWx5IGluY29ycmVjdCBmcm9tIGEgc3ludGF4IHBvaW50DQo+IG9m
IHZpZXcsIGFuZCBpZ25vcmVkIGJ5IG1ha2Ugd2hlbiBhbGwgbWFrZWZpbGVzIGFyZSBwYXJzZWQu
DQoNClRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcyEgIEkgd2FzIGJ1cm5pbmcgdXAgYSBsb3Qgb2Yg
dGltZSBvbiB0aGlzIGlzc3VlLg0KDQo+IA0KPiBXaGF0IEkgYW0gYSBiaXQgc3VycHJpc2VkIHdp
dGgsIGlzIHdoeSB5b3Ugc2VuZCBhIHBhdGNoIHNlcmllcyB0aGF0DQo+IGluY2x1ZGVzIHRoaXMg
dmlydHVhbCBwYWNrYWdlIGlmIHlvdSBrbm93IHlvdSBjb3VsZG4ndCBnZXQgaXQgdG8gd29yaz8N
Cg0KVG8gYmUgaG9uZXN0LCBJIHdhc27igJl0IHN1cmUgaWYgaXQgd2FzIG5vcm1hbCB0aGF0IEkg
Y291bGQgbm90IGRlcGVuZCBvbiBhIHZpcnR1YWwgcGFja2FnZSBvciBub3QuDQoNCkFuZCBzaW5j
ZSB0aGUgQ29uZmlnLmluIHZhcmlhYmxlcyB3ZXJlIHdvcmtpbmcgcHJvcGVybHksIEkgdGhvdWdo
dCBldmVyeXRoaW5nIHdhcyBjb3JyZWN0Lg0KDQpUaGVuIGFmdGVyIHNldmVyYWwgcm91bmRzIG9m
IG1vZGlmaWNhdGlvbnMsIEkgZm9yZ290IGFib3V0IHRoZSBpc3N1ZSB1bnRpbCB0cnlpbmcgdG8g
Z2V0IGl0IHRvIHdvcmsgbm93IGFmdGVyIHlvdXIgZmVlZGJhY2suDQoNCj4gDQo+IEJlc3QgcmVn
YXJkcywNCj4gDQo+IFRob21hcw0KPiAtLQ0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBh
bmQgQ0VPLCBCb290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcg
YW5kIHRyYWluaW5nDQo+IGh0dHBzOi8vYm9vdGxpbi5jb20NCg0KVGhhbmtzIGZvciB5b3VyIGhl
bHAgYW5kIHJldmlldyENCg0KQmVzdCByZWdhcmRzLA0KTmVhbCBGcmFnZXINCkFNRApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
