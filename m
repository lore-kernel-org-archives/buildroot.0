Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F388C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 05:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6370C41E70;
	Thu, 14 Dec 2023 05:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6370C41E70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o1VIkUgLl6qC; Thu, 14 Dec 2023 05:29:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BAB941D8B;
	Thu, 14 Dec 2023 05:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BAB941D8B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F9781BF3BA
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 05:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E85C8305A
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 05:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E85C8305A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDtMwAYyaukZ for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 05:29:52 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::616])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0250A81E3A
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 05:29:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0250A81E3A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmXV0Jot8H2TJn7nt6pGjNeXBPmnFNdEf/Iv2C8EYnbI95ma6/fsMuFtpuU7XNbZpRFmdbXcN8we1rI9HH7ftaCp9dAueI7kdWx6+/94EDZkxUozE+NiDLTGZlFXUO2rR6O2vzDQPozNK+wVlK6h5knyqNPw82wNPNYYK3g3C+bXBmIk0EEUbU4vxUdV32kJhhc2PVb4eWzjw5mZYFbGMk6p5bwBEBNKlk2EG8T8KjG8VI5Oi+3goqMMbxH3eN7Qq0fdzcEVibPPLlZrXfsvfogSMQVqfaPrcQdLEa8mZ/TgN5WXw0aUp56bYTnvBrDtJCD9GA2Bdugs5iXT3OoC3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQzwMd72fMSuHTpXB1278u4Q7IbC493L89zf6Ayv2yk=;
 b=SS+upbg49iVjtpEQaaQdlQtOkWnLd8U+JpRw/azEl2XEryNIzP/EPKgBaZwhTiLO28meviXufEiAMoHEW1GwOWbstfku+giwKLSNrFGYjfYZpqNBkTjio1G06xSrOxaqHaPH1v7rHMrRPY+nYVihEQQacLpmtyoLMzer4/0Cjr5CksYM4f2rjwGecTs+GlOYCo6JJkOotar4Zo+oT9QkeuT2zB7/0PunGNVIIR3C+5xCEkpPOq2v9NN/YnK6WDsOcTjG9dvoM2M36EvadZljZLiZ/HeXAK+cyjX3KfqptQB1hKfl/x2oD1ccvifcR9u8UkK+ytHOxFLg3ezgeoqOhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MW4PR12MB7334.namprd12.prod.outlook.com (2603:10b6:303:219::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.38; Thu, 14 Dec
 2023 05:29:47 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::cd8a:4814:157c:bbe]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::cd8a:4814:157c:bbe%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 05:29:47 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v8 01/10] package/binutils-bare-metal: new
 package
Thread-Index: AQHaJoRsxU6mz5uOtESx1TgKL/L3BLCn2nkAgAB1mMk=
Date: Thu, 14 Dec 2023 05:29:47 +0000
Message-ID: <5EB6E748-BA27-414C-9AB0-434429B724BF@amd.com>
References: <20231204073443.1543587-1-neal.frager@amd.com>
 <20231213232854.5242117f@windsurf>
In-Reply-To: <20231213232854.5242117f@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MW4PR12MB7334:EE_
x-ms-office365-filtering-correlation-id: 6506be92-62a1-4bd7-286a-08dbfc65af9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nPTxr1sGrmtI/Un2lvLk2UgyqBJ9Dw6IIAV0eLK30DS+vSeFH/VN3UxeIahs/wPkUog6tij9gm94jXwS4xcpzehGUKlCJxn0UcQGztr+Pu3Ve5mLUPHrIjWA2AtyFOzKbPlTSoU6IBo8OqZmwfvCQWWlFRe1AsQ0R96Ag1L2xRcp+B+/184cEKyNMjdRCDABEX9+3NfkXBdVU4BC9gJ0pz2HliPG8kdKbsQ7V4hjCP2SGQ/oO4IydXtMuvhwCRqnzfAOeyWnojvt7YMslOFSjDiS/H2Q7aHZSR5qLUlZL/hHjlLhP6uaOTDIQvnD+xjBWIdqou1fNtpiP07XwfP+qH/THwJB9H0ElkqbK4hvGDhg/JRwhTU0Wta083MvWpzOC91snj2BCW26WzYLaky67UvHRglL6clq2U8HW2TL0jMBs6gEiWGwerlzQfbIKYkTFfvk6IqWQN1ovrlRnSK45KLty6+0+OuoYj1TctUBjnODorTwoociShZzqUiE+5FF711h5drQe7wb+QGlCPVYs60MLiDnSQ4t19W3D52TRRb5yH5Bn8XsRRTq7Q3WrlYDIwuzT4f48FJ5KgiA85ion5QydQ7GN7qOzl2j/66KLJrv40tqtoXYHOzsDUyiGlFa19VNWjGrsoDYe1CIJ1s+XiwlITCt7OAuIADArMqNYJ9iTY3VbgZWJtWxOnJ8Asy/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(2906002)(41300700001)(122000001)(86362001)(38100700002)(6512007)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(33656002)(71200400001)(6506007)(316002)(6916009)(4326008)(8676002)(8936002)(2616005)(6486002)(966005)(478600001)(36756003)(83380400001)(66574015)(38070700009)(5660300002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmZqczhzUEcrdTI3OHFKYTdCbzFmYjVYQTZPWXhrUkJuYzVJV3lqV1N4NmQ0?=
 =?utf-8?B?L1k4c1BYdmRLQ1FYMVFtcG1UdCtVY1prdWdMaFdpc3V6RUlkKzJGeGwvdENB?=
 =?utf-8?B?ajk2bThZUkNPbjAwaWdlZGU3bS9wU0pwTHI4RWh4QjErNVR1ZEFnZDZ2K3I4?=
 =?utf-8?B?RWorY25XWGRKZzNPRk91QUFaZEd0Q3RlV1VaWWErNy9xS2FLL1hlNHRmWVBy?=
 =?utf-8?B?UWNzRmNOcHQyby9jZE5uamZwV2lXbWpVbE5wNmpqL2gvNU5HOUh0ODRSZWtn?=
 =?utf-8?B?Z2k2UmV3T0xuLzlLVzhSaWR0eGU1RXZacWZUa3dXb3pwV3pjcFlUeitzUlgx?=
 =?utf-8?B?QjFoV0RCM3pURmdUSWU0cVdvOEpYNG9yYlVrdWd5SkxoNGs3OWdvazkrZVpz?=
 =?utf-8?B?ZkdZRGJIVGFOMkE4Si9SbXF3S1NuSUJoaUN2NGpUSG1Qbi9oWGlSLzhWU1lN?=
 =?utf-8?B?Q1IvblNIVklzakI3TnhuOTRwbEJOTUppb0d0WUxKbUJtQTRzMTkxaTVQdGsv?=
 =?utf-8?B?ZDA4ZjlEc0JZNHJ5UGVNeVZ3RXdqSzBEbi9naXNydGIvclowakxYc0NnOU4x?=
 =?utf-8?B?TXA2eWcwNHFFbkdaenBlMnQvRVZYZXVUU0pmeXFjckc4azlpS1pvZUVXcDA1?=
 =?utf-8?B?OEdjWmpBODB0U0ZzMWlzSkxKSGM0ZzROSzJwOFdsc2tqOHRmelRZZm1RZm5x?=
 =?utf-8?B?VHRDTUpkTnhKSVVyMVg2L0l1WlBNTmV4MEp0aGVFbzc0dFMydldobDluZi9M?=
 =?utf-8?B?MncrN2hGTndUaUIxdnlUUEU1MHZyVmFpYTh2UWJsK2U5N2JxUzlDbTFLc3g3?=
 =?utf-8?B?eE5FaFZqeGF0a2RQTC8zb1RkWXRqZ3ZaTHlmckJuUWR6NVNoVE56ZEdGUXhq?=
 =?utf-8?B?aHBQYWVwdWYybFZUazNQTWdRNVphYm43VE13RENEVFdyTThuMUFXdFBTZUIy?=
 =?utf-8?B?eFk5RW5EUVIzb2plUm5pdXY3L0U0UTFKbHJ0dHdXNFN6Rk1taURKWVNCUjlL?=
 =?utf-8?B?NXhaTGxaM2JxdVF1SmtMV0IzZU5VZ0dVK1RVMFVlbkw5WVJWcllRVi9ubUpv?=
 =?utf-8?B?eWkyNWV0cE9xZDQyajZJTFYrOGRtV1ZPMnJpYmZ1ejdtSGpTYXQ1KzB6SU8y?=
 =?utf-8?B?WWdpT2NGYzFteHpVQjQrT0hqZEZoUS9jVWlDOU1Gb2dtRkRXdnB5dFp4VVdI?=
 =?utf-8?B?YmV5M1dqUHdtZkVhOWRnUjJ3RW9XcHZYc1lhdzMzWCthdUdQczUya3BMK1BG?=
 =?utf-8?B?d2hZcEwvYnFPdVY3RXMvc1d1RFM2RXNyU2grQTF0M2psRGRRNXYzMmhnRzJH?=
 =?utf-8?B?U0dROG94b09UQUtpSUZOOXFCWU1wY1QwbC81VC9obkVlSy9QS2FVMUVsSVFl?=
 =?utf-8?B?YU5wS1NNeVJGZnA1cmFYcklsOUM3cFhnWDEvU3lad3Fqb1ltZ09adVpPUy9Q?=
 =?utf-8?B?UWVPU2kzNklBbndPeDlPeDhlVEhxT1hVbDNDT015Q0dqa0hwNUx4b0JCenFU?=
 =?utf-8?B?UE9BVi9Ha2ZkaFpObmt3bDhKUlJIZzFha1M0WlR0N1RSakVUM1VCVUxnTHA3?=
 =?utf-8?B?Mm8xZXptT09jcmJuekRvZFRUcHRvR21xVlczTVdub21PTFExekJyYlRIWktD?=
 =?utf-8?B?N2VhQnVrNlNkekVBd3JsWnlrQjY2bVQxMGRybHBmMEx6QmFieEhJTzRuQVBz?=
 =?utf-8?B?bkl6cGFOQllTQkNBdHZkV0d5OWErVWFrSllvdEtzS2N0cUliUDBBd1owQk9S?=
 =?utf-8?B?RVIyR0hoY1VTR3Y0TE1nU3A1ckpheU80QUlkbG9vYTdYU0ZWU2VscEZqRU1i?=
 =?utf-8?B?Q2EwNjB0R3gzRmhkUUN2SnlZVXBjUk92emRwTTF5NFhKdG5mcnk4MGhrZUZD?=
 =?utf-8?B?RDJKMHRUanBGQ3NUQkptK0QxbkZnNGtJd1gvcGk0REhYTmNjbHliWjZXOTNu?=
 =?utf-8?B?YnNock5RL3lPMlRYelVaK0YyS3FGZ2lyeHpDYUdvR3E0cysrTDdsTWtDT29V?=
 =?utf-8?B?am9QU0FlZlVmc0N4dmFNT0ZYNUFjNHdxZzRTSi84ZDAzbHpLMXd0TjhXM0Fn?=
 =?utf-8?B?OWtMWkRoMUV4SGpoaXpkeVJzL01hdnJQQnIzTUdjcHBIdFJTU2VMaTl1OWxy?=
 =?utf-8?B?bXA5MC9la3l2TGJoMEZDQVdrZmo3SzJQR0dZOHRCaUlmVGxObGYxNnhhTHlh?=
 =?utf-8?Q?0mtNfpJdlVanOGT3xVwoKIU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6506be92-62a1-4bd7-286a-08dbfc65af9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 05:29:47.1027 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0F32yAG3qxGHhKSiQYvqPnmAhitgyAzvp8VTAKVzKRQqwkavw5H/ZI6E4mPt9ziN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7334
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQzwMd72fMSuHTpXB1278u4Q7IbC493L89zf6Ayv2yk=;
 b=RM0ruWwGpEAKLP4Pzg2aO+zUTl8HjsePBONyO98Gd7ZcOukJBLeVhyFu5V5Y2md4Ja/YnOnMTmyu8MI6z68+Bzq0yASoGNtWBNS75agndeXVEAqR9wJKevjmJR5t4iPrlUfD0PQbQecwub42n39mpxB9TrySru8VY3hDi546ATE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=RM0ruWwG
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v8 01/10] package/binutils-bare-metal: new
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
Cc: "Simek, Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLA0KDQo+IExlIDEzIGTDqWMuIDIwMjMgw6AgMjM6MjgsIFRob21hcyBQZXRhenpv
bmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoNCj4gDQo+IO+7v0hl
bGxvIE5lYWwsDQo+IA0KPj4gT24gTW9uLCA0IERlYyAyMDIzIDA3OjM0OjMzICswMDAwDQo+PiBO
ZWFsIEZyYWdlciB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6
DQo+PiANCj4+IFRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBwYWNrYWdlIGZvciBidWlsZGluZyBiaW51
dGlscyBmb3IgYSBiYXJlLW1ldGFsIHRvb2xjaGFpbi4NCj4+IFRoZSBjcHUgYXJjaGl0ZWN0dXJl
IGlzIGRlZmluZWQgYnkgYSB0b29sY2hhaW4tYmFyZS1tZXRhbCB2aXJ0dWFsIHBhY2thZ2UuDQo+
PiBXaGlsZSBhbnkgY3B1IGFyY2hpdGVjdHVyZSBjb3VsZCBiZSB1c2VkLCB0aGUgZGVmYXVsdCBj
b25maWd1cmF0aW9uIHdpbGwgYmUgYQ0KPj4gWGlsaW54IG1pY3JvYmxhemUgbGl0dGxlIGVuZGlh
biBhcmNoaXRlY3R1cmUsIHNvIHRoYXQgYnVpbGRyb290IHdpbGwgYmUgYWJsZQ0KPj4gdG8gYnVp
bGQgdGhlIG1pY3JvYmxhemUgZmlybXdhcmUgYXBwbGljYXRpb25zIGZvciB6eW5xbXAgYW5kIHZl
cnNhbC4NCj4gDQo+IFRoYW5rcyBmb3Igc2VuZGluZyB0aGlzIG5ldyBpdGVyYXRpb24uIEkgZmlu
YWxseSB0b29rIHNvbWUgdGltZSB0byBsb29rDQo+IGludG8gaXQsIGFzIEkgd2FudGVkIHRvIG1l
cmdlIHBhdGNoZXMgMSB0byA0IHRvZGF5LiBJIGRpZCBzb21lIGdvb2QNCj4gcHJvZ3Jlc3MgaW4g
Zml4aW5nIGEgbnVtYmVyIG9mIGlzc3VlcywgYW5kIG15IGN1cnJlbnQgcHJvZ3Jlc3MgY2FuIGJl
DQo+IHNlZW4gYXQ6DQo+IA0KPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS90cGV0YXp6b25pL2J1aWxk
cm9vdC90cmVlL2JhcmUtbWV0YWwNCj4gDQo+IERvIHlvdSB0aGluayB5b3UgY291bGQgcmViYXNl
IHlvdXIgY2hhbmdlcyBvbiB0b3Agb2YgdGhpcywgYW5kIHNlZSBpZg0KPiBpdCBhbGwgd29ya3Mg
ZmluZT8gSSBvZiBjb3Vyc2UgZW5jb3VyYWdlIHlvdSB0byByZXZpZXcgdGhlIG1vZGlmaWVkDQo+
IGNvbW1pdHMsIHRvIHNwb3Qgd2hhdCBJIGZpeGVkL2NoYW5nZWQuIElmIHlvdSBhZ3JlZSB3aXRo
IG15IGNoYW5nZXMsDQo+IGFuZCB0aGV5IHdvcmsgZm9yIHlvdSwgSSB0aGluayB0aGUgY2hhbmdl
cyBpbiBteSBicmFuY2ggYXJlIHJlYWR5IHRvIGJlDQo+IG1lcmdlZCwgc28gSSB3aWxsIGJlIGhh
cHB5IHRvIGFwcGx5IHRoZW0uDQo+IA0KDQpZZXMsIEkgd2lsbCBnaXZlIHRoaXMgYnJhbmNoIGEg
dHJ5IGFuZCBjb25maXJtIGlmIHBhdGNoZXMgNS0xMCB3b3JrIGFzIGlzIG9uIHRvcCBvZiB0aGlz
IGJyYW5jaC4NCg0KPiBPbmUgdGhpbmcgdGhhdCBzdGlsbCBib3RoZXJzIG1lIGlzOg0KPiANCj4g
K2RlZmluZSBORVdMSUJfQkFSRV9NRVRBTF9GSVhVUA0KPiArbXYgJChIT1NUX0dDQ19CQVJFX01F
VEFMX1NZU1JPT1QpL3Vzci8kKE5FV0xJQl9CQVJFX01FVEFMX0FSQ0gpL2luY2x1ZGUgXA0KPiAr
ICAgICQoSE9TVF9HQ0NfQkFSRV9NRVRBTF9TWVNST09UKS91c3IvaW5jbHVkZQ0KPiArbXYgJChI
T1NUX0dDQ19CQVJFX01FVEFMX1NZU1JPT1QpL3Vzci8kKE5FV0xJQl9CQVJFX01FVEFMX0FSQ0gp
L2xpYiBcDQo+ICsgICAgJChIT1NUX0dDQ19CQVJFX01FVEFMX1NZU1JPT1QpL3Vzci9saWINCj4g
K2VuZGVmDQo+ICsNCj4gK05FV0xJQl9CQVJFX01FVEFMX1BPU1RfSU5TVEFMTF9TVEFHSU5HX0hP
T0tTICs9IE5FV0xJQl9CQVJFX01FVEFMX0ZJWFVQDQo+IA0KPiBCdXQgSSB3YXMgYWJsZSB0byBm
aW5kIHRoYXQgaXQncyBkdWUgdG86DQo+IA0KPiB0b29sZGlyPScke2V4ZWNfcHJlZml4fScvJHt0
YXJnZXRfbm9uY2Fub25pY2FsfQ0KPiANCj4gaW4gbmV3bGliJ3MgY29uZmlndXJlLmFjIHNjcmlw
dC4NCj4gDQo+IEFuZCBpbnRlcmVzdGluZ2x5LCB0aGlzIGlzc3VlIGhhZCBhbHJlYWR5IGJlZW4g
c3BvdHRlZCBpbiBhbiBlYXJsaWVyDQo+ICgyMDE1KSBhdHRlbXB0IGF0IGJyaW5naW5nIG5ld2xp
YiBzdXBwb3J0IGluIEJ1aWxkcm9vdDoNCj4gDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1
aWxkcm9vdC8xNDQyMTI3NzY4LTI2NDQ3LTEtZ2l0LXNlbmQtZW1haWwtY2p3ZmlybXdhcmVAdnht
ZGVzaWduLmNvbS8jWjMxbmV3bGliLTAwMDEtY29uZmlndXJlLXRvb2xkaXItcGF0aC5wYXRjaA0K
PiANCj4gSSdtIG5vdCB5ZXQgZGVjaWRlZCBvbiB3aGF0IGlzIHRoZSBtb3N0IGFwcHJvcHJpYXRl
OiB5b3VyIGhvb2sgdGhhdA0KPiBtb3ZlcyB0aGluZ3MgYXJvdW5kIGFmdGVyIGluc3RhbGxhdGlv
biwgb3IgcGF0Y2hpbmcgdGhlIGNvbmZpZ3VyZS5hYw0KPiBzY3JpcHQgdG8gZ2V0IHRoaW5ncyBh
dCB0aGUgcmlnaHQgcGxhY2UgZnJvbSB0aGUgc3RhcnQuDQo+IA0KDQpUaGFuayB5b3UgZm9yIHlv
dXIgcmVzZWFyY2guICBJIGhhZCBub3QgbG9va2VkIGludG8gaG93IHRvIGZpeCBuZXdsaWIsIHNv
IHRoYXQgaXQgaW5zdGFsbHMgdG8gdGhlIGNvcnJlY3QgcGxhY2UgdG8gYmVnaW4gd2l0aC4NCg0K
RnJvbSBteSBzaWRlLCBJIHRoaW5rIHBhdGNoaW5nIG5ld2xpYiBpcyBjbGVhcmx5IGJldHRlciBi
ZWNhdXNlIHdlIGNhbiB0cnkgdG8gdXBzdHJlYW0gdGhlIHBhdGNoIHRvIG5ld2xpYi4gIE9uY2Ug
dXBzdHJlYW0sIG5vIHBhdGNoIG9yIGZpeCB1cCBoYWNrIHdpbGwgYmUgbmVlZGVkIGFueW1vcmUg
d2hlbiB3ZSBidW1wIHRvIGEgbmV3ZXIgbmV3bGliIHZlcnNpb24uDQoNCkkgd2lsbCB0ZXN0IHRo
aXMgcGF0Y2ggd2l0aCB5b3VyIGJyYW5jaCBhcyB3ZWxsIHRvIHZlcmlmeSB0aGF0IHdlIGNhbiBy
ZW1vdmUgbXkgZml4IHVwIHBvc3QgaW5zdGFsbGF0aW9uIGhhY2suICBJZiB0aGlzIHBhdGNoIHdv
cmtzLCBJIHByb3Bvc2UgZ29pbmcgd2l0aCB0aGUgcGF0Y2guDQoNCj4gQmVzdCByZWdhcmRzLA0K
PiANCj4gVGhvbWFzDQo+IC0tDQo+IFRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbg0KPiBF
bWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0dHBzOi8vYm9vdGxpbi5j
b20NCg0KVGhhbmtzIGFnYWluIGZvciB5b3VyIHRob3JvdWdoIHJldmlldyENCg0KQmVzdCByZWdh
cmRzLA0KTmVhbCBGcmFnZXINCkFNRApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
