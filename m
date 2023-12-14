Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A918AC4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 08:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 360C383BEF;
	Thu, 14 Dec 2023 08:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 360C383BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ErE7eXzVT2JK; Thu, 14 Dec 2023 08:12:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 763E483B87;
	Thu, 14 Dec 2023 08:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 763E483B87
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16CAD1BF3FC
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 08:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFA9D83B87
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 08:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFA9D83B87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9T5s1jcXFuSI for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 08:12:40 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::613])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 779F88385D
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 08:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 779F88385D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krJpq4ukjP3JEP+3wyFshpHkKP/Kd5wvKMzMNFNFU+v3CRuiwS/nn/U9DDvy3lMLWMpaZeiCUegtDcvf4gRWHddVb40WyEDlFR3QyoZoWNki+6bo7KLAxipylvc92dEDl3D/Oim9x8sZZXX2NCX58FyP+6WXpC9CiifSfpgVoRcpdG3UU64mf6uBUPiyy9w0RGksBB/aJTu0KM/EkDr1mgpMgod/3SPI3TlhPVcXN7yYLcu3ru/OUKo/Wbz6WPlyQ2W8NsA2SoEo88DncSDTUjM8JcSdQh2z8aL8LeK7TYoTuaH+rxoAx8XNPTSPkYrIgaPRB5qbTkEJSJoYNYGdpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCqYC1r+k2H4gK8RN1xgjLtizGx5YrpHRCmudjaV6oM=;
 b=FUUSXKtHLlG9DZz7ZgYGyixkVdKriIXU5bqF+BrRslCbX9AcYx+6elSWDeGXMroDsR2qD0hlD//Dgn68MUIQM1AYqPQMFmfeAc5t53Nebzk3IwXoEOV3Z6iAeESAobmgNAN79eZCyh827vkbOK0UjYW/gfxSTy43mZfGcxBOAjf3WAvLwAvseUI4gr/Q/c2rhjMOw3hf9zv8HV1c2RJLeiEQhT2lGMb8jzoD3pjOnMvvVxOKf/Iy0YV27zDq9M77jq7Q1HJVLpcjRS3QhI4y3O5jEvdgfUOcdXRqMacJ1yIJU06AFWQ8Z0xJCUhjQZhQM1Hz2erGQrKdE6L43zFKeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM4PR12MB8523.namprd12.prod.outlook.com (2603:10b6:8:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 08:12:35 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::cd8a:4814:157c:bbe]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::cd8a:4814:157c:bbe%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 08:12:35 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v8 01/10] package/binutils-bare-metal: new
 package
Thread-Index: AQHaJoRsxU6mz5uOtESx1TgKL/L3BLCn2nkAgAB1mMmAACS8AIAAARrQgAAD0wCAAAPUlA==
Date: Thu, 14 Dec 2023 08:12:35 +0000
Message-ID: <D15E2E86-61C5-4344-8669-FDE201516BF5@amd.com>
References: <20231204073443.1543587-1-neal.frager@amd.com>
 <20231213232854.5242117f@windsurf>
 <5EB6E748-BA27-414C-9AB0-434429B724BF@amd.com>
 <20231214084116.48e04ecf@windsurf>
 <CH2PR12MB5004DAEB064E623D3575D3A2F08CA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231214085854.558ce0c1@windsurf>
In-Reply-To: <20231214085854.558ce0c1@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DM4PR12MB8523:EE_
x-ms-office365-filtering-correlation-id: 7355748f-6009-492a-8d77-08dbfc7c6e33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ucN5nvPH0ol/83380Yb+hdElf5bQm6cVjqqRqQq0xjZIYJY83YC9Xxfh/4hyMOofxtzTa5ij/eo+lvU0bF3mUtQFhgwii/f4i2cb+Zrn98b4LbfdUcIoTuKA6GGpQ0esZmZRuohD/V90ydh7yCIzAdDJG+Zq6JsyKK1I1dpP2kWOpir5q8AynwrchCcQ+o7CV/CmNiIXIN9SQL89Y7AaKSw39/i+S8wHjgPyYiOIstGizaViqbtsw2maFjxguPRuSddLPViwhAt0Ib6kCVYCZRu4oLUG8Dp6Q5szJJ/jca2Kn0qPs7HSpl0jkYp7u7cfYaxVAt87J+RG48e8+UF2bCKwRMHOGtAsdD8eq1P9kq2QXXAJ++F5E9UtR0iaOG01lbTGXhXq7Shc/SJ7DqMie1ylfJAVbPX8dPvPfVxVLylz7MWbUaiVNdeDudfTjZuMr4EHQWl1X8xyqZEaC7Rv+dslp/6mKUKrwkq2ETnBtfoHIOVrlXmCYxMnU/yKnz1xzjUfmMV1YIS+vLM2RKYUaEgleqzfnz9K6AdruvPhWyUllcC4KUTIRNVnO6bEfeqiGfpJnDcq+2+N+EsENoKgosVBaxl0scjli9mZs2GmRMRnceU7wesylACz//lKR0GW/Lz8dOR6lcqkDPyrlp2rOA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(396003)(366004)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(66574015)(6506007)(2616005)(33656002)(38070700009)(36756003)(86362001)(38100700002)(122000001)(83380400001)(4326008)(5660300002)(6512007)(71200400001)(76116006)(6916009)(316002)(66946007)(8676002)(6486002)(8936002)(54906003)(66556008)(66476007)(66446008)(64756008)(2906002)(41300700001)(478600001)(966005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L05ibUdkRzh1djY0Z1NhYmt4cmRPSmI1Z1lOelNXQVRZRWlOQXpvY0NNMk1P?=
 =?utf-8?B?bk9acVpsSnFnelJGd1RDb0g5VytMcU16L1lpZGhvK1JuMkZhemVhcVByMzYy?=
 =?utf-8?B?ZDRLU09kQ1lVdXlvSExiQkpORVJreW00L2J5VFVLckEvczdJM3VNaFNTaThV?=
 =?utf-8?B?NDR2ZlR0ZUozZGtEVlk4NVdoRTJXK2lVNGJjR2ZrdjkrRHczNjZpVkI2UEZi?=
 =?utf-8?B?R09HSmptY1RaOFZsL2RybytIMWxTUjNZaDZwWXFJclZLT3MwdElOQ3lIWjF3?=
 =?utf-8?B?N2oyLyszd1lKZld1VmYvR0tVd3dkMElNRlBjSzQzSmpqS2lLbEd2elhDUFIx?=
 =?utf-8?B?RUlQSXg0RjVaNkF5VmJsSDNrY0l1QlYyMFRxeXh2ajNjZm9TQ3N1WnhteURQ?=
 =?utf-8?B?OEt5VGJkQ013ankyQVFIOE1UZytBdWhxTHg0SDUySk1Sa2xtSUNmZ09FaFRF?=
 =?utf-8?B?bng0c2lpZ3F2TU1EeFJaUEpraUNCWHhEZGxKUzZJc2dXYWtWcE1aU1YrYzU1?=
 =?utf-8?B?bmtUUVVsMzE4ckdtTDlaUG1ENzVHUVNSRjdqRFlMRm9zU2tLcEVVa3dlT3pk?=
 =?utf-8?B?QmZVN0Vrd09jN29tS3d0anpsL2xIOUhRNi94VXl6K1B2amJuaWhHOWhCOFdY?=
 =?utf-8?B?UEtwa2JCZVdlWEpqME9Ka0EzcFN2RlVDWEM0UkIxWjFpWFlEMWJ5bGtWbHNH?=
 =?utf-8?B?Q3FLRmhGOU9sWW5HY2gxeVpOazNQaEdCMkxBMTd1VWx4cTA5TjdsMFJkN0FL?=
 =?utf-8?B?R2paMk1yUnNCVWpObWdqblowbHRGZDloQXhhUHQzR0lZQlpjZytYN2RseUhZ?=
 =?utf-8?B?bEl4RHZnR3Q2NWFpUEdRSFZEN1E5aExqVmZsOGU4NXNYTDA2b2plQnZiamhv?=
 =?utf-8?B?aGsrN0lSanZxU3YwMTZiQTFUZUhhYkwrVWNzem5ZNlV2Rm9HSzBHSXhPa2Ra?=
 =?utf-8?B?NVgvT2RmM1A5OElTdE5HSnFiSjVrRHQzeDNmYWNtb25yMWFWNHdSMWFidWhZ?=
 =?utf-8?B?WS9wS0tTYmxIS3RmSVVVWmpNQVhBQmp6Qk1RalhMbHIzelYxTmRzSk5PdGJv?=
 =?utf-8?B?S0FSa01LajlqWmtXWGRSSzBmQmduYzFnNGMvVmoyZGltaVhBeVg3b0FMdU9E?=
 =?utf-8?B?QmFYdFZjUSs5dXpZMUdiRE5HRzVRbVRtWTZNZVM0WU9qR0g5Y0V5dG9MQzR4?=
 =?utf-8?B?NG9Nc1pzV1RKeHg5dVVKTm5QdHMzMjRSdnlhU3p3OFJRWVA1Ni90Ylp1cTNv?=
 =?utf-8?B?UEY5MW1pN2pNTXYxM1Z0Rk95NWhWZ1J6Zmxxb1hrU3RYdnFpMDg1RDBBZ2Jk?=
 =?utf-8?B?N01mZUZFK2o5UDJpK2hRbWVrWmExUG9oalJoUlR0b0FMdmxONXU2d2UwSWlP?=
 =?utf-8?B?NUV1Ry90WE9hR1Vjb1k2L21ETUFSZlE5aWtLYnlJNXJDemxzbXhGU1RScUtR?=
 =?utf-8?B?TkRGZ2hScy9DWkQ4eHBzbjBVR1F4TFlkSGJKaHZUaURUb0wzSUtZbEFCcnk1?=
 =?utf-8?B?ZVNVVjVzWm85emYxUEtWOEZkL2x4WHlZWjQzcElmSDdZSEVrWjBLeXZZbERN?=
 =?utf-8?B?NzBZRi9nTUFnZ25jNnA4cytJbUtpeW5rbTc5MTFTS2RwQjJvaVFiVFlpSkZ3?=
 =?utf-8?B?WGdvZ2s0NFlIRXZJOUx0RWxOSXFpUnYrSll0R3liMTVEUHVmUkxqaVpIbkVu?=
 =?utf-8?B?akVaajJEZXZPUkNzK3FOWUFFOGNoSEg2WmRZM2pUUnkxNzJyVFYrVkhET1hP?=
 =?utf-8?B?SFpCYTJiaTJFMVJoc0pINm9sUmszd0xhUVh6SDAvQkRwTldZUHBuQ0JmejR3?=
 =?utf-8?B?dm9PUmF0RUVIa1pQZWlTTjIwK0diaVFoS2toWG55YmRDU2VyMzduTjhKcmVB?=
 =?utf-8?B?WW9IQjd2MEEvZGNPU0VhaXBmNUEyZDEwWmxZZGhmcUpNbzBUalVJQjRDWGVk?=
 =?utf-8?B?bzNXR2taK04yMW90WFhqZjl5c05pOTVJMnozT3hDMng5RWVQNGVHcG40TVhZ?=
 =?utf-8?B?c2x6bC9STmxSS3VUMEEwbWdQaDMrQks4RzdvRHpia3NuVDZ0SzE2TWVxRGpP?=
 =?utf-8?B?MXpmbE9CRWNTdW0zOUdKbEs3ODNDRUs2TWF2Z2d0dlJyNGwwWFZOcHlkL3NU?=
 =?utf-8?B?ODdlZlRkb3p1QTVJUWJZM3dBUUZCYTBhbHI2UkoyUXF0UU9PTjc4WTFZVlNM?=
 =?utf-8?Q?QaOXgrReV9sq4G3vOLbZ230=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7355748f-6009-492a-8d77-08dbfc7c6e33
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 08:12:35.7513 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pQ9fplvy8ww81lXWyL/WvrtJC6vckQZ73OwD5tb4sTdEef3z+pvcOiTV2natEISG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8523
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCqYC1r+k2H4gK8RN1xgjLtizGx5YrpHRCmudjaV6oM=;
 b=l43zGLC5NnDZVL+P7gbKNYvHuM8p0d/t+FPwVwvCkA0cRs382ifdWnNNykf573oAhGNQmI/v3YkysiapxCuleI9pYodW96xxEX72KYqSr43R6RE+Oyuw2JCYCCVI35DssjavuoadhFn/2AO2AiHKL4oZmmmBvrMTFflUqwkk4gI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=l43zGLC5
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

SGkgVGhvbWFzLA0KDQo+IExlIDE0IGTDqWMuIDIwMjMgw6AgMDg6NTksIFRob21hcyBQZXRhenpv
bmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoNCj4gDQo+IO+7v0hl
bGxvLA0KPiANCj4+IE9uIFRodSwgMTQgRGVjIDIwMjMgMDc6NTE6MDMgKzAwMDANCj4+ICJGcmFn
ZXIsIE5lYWwiIDxuZWFsLmZyYWdlckBhbWQuY29tPiB3cm90ZToNCj4+IA0KPj4gU2luY2Ugd2Ug
YXJlIG5vdCBzdXJlIGFib3V0IHRoaXMsIEkgd2lsbCBnbyBhaGVhZCBhbmQgdHJ5IHRvIHVwc3Ry
ZWFtDQo+PiB0aGUgcGF0Y2ggdG8gdGhlIG5ld2xpYiBjb21tdW5pdHksIGFuZCBzZWUgd2hhdCB0
aGV5IHNheS4NCj4gDQo+IFRoaW5nIGlzIHlvdSB3aWxsIGhhdmUgdG8gZXhwbGFpbiB2ZXJ5IGNs
ZWFybHkgd2hhdCB3ZSBuZWVkIGEgZGlmZmVyZW50DQo+IHZhbHVlLCBhbmQgSSdtIG5vdCBzdXJl
IHdlIGhhdmUgc3VjaCBhIGNsZWFyIGV4cGxhbmF0aW9uIChhdCBsZWFzdCBJDQo+IGRvbid0IGhh
dmUgaXQpLg0KDQpUaGUgY2xlYXIgZXhwbGFuYXRpb24gaXMgdGhhdCBnY2MgZG9lcyBub3QgZmlu
ZCBuZXdsaWIgaW4gdGhlIHN5c3Jvb3QgZGlyZWN0b3J5IHdpdGhvdXQgdGhpcyBjaGFuZ2UuICBJ
IGRvbuKAmXQga25vdyBob3cgaXQgd29ya3Mgd2l0aCBhIHN5c3Jvb3QgYXMgY3VycmVudGx5IHdy
aXR0ZW4uDQoNCj4gDQo+PiBJZiB0aGVyZSBpcyBhIHJlYXNvbiwgcGVyaGFwcyB0aGV5IGNhbiBo
ZWxwIHVzIHdpdGggaW1wbGVtZW50aW5nIGENCj4+IGNvbmZpZ3VyYWJsZSBzb2x1dGlvbiwgYXMg
eW91IHN1Z2dlc3QuICBJbiBhbnkgY2FzZSwgSSB0aGluayB3b3JraW5nDQo+PiB0byB1cHN0cmVh
bSBhIHByb3BlciBzb2x1dGlvbiBpcyBzdGlsbCBiZXR0ZXIgdGhhbiBteSBmaXh1cCBzb2x1dGlv
bi4NCj4+IEkgb25seSBpbXBsZW1lbnRlZCB0aGUgZml4dXAgc29sdXRpb24gYXMgaXQgd2FzIHF1
aWNrZXIgdGhhbg0KPj4gc3BlbmRpbmcgbWFueSBob3VycyBsZWFybmluZyB0aGUgbmV3bGliIGNv
bmZpZ3VyZSBzY3JpcHQuICBOb3cgdGhhdA0KPj4geW91IGhhdmUgZm91bmQgdGhlIHJvb3Qgb2Yg
dGhlIHByb2JsZW0sIEkgdGhpbmsgcGF0Y2hpbmcgaXQgdXBzdHJlYW0NCj4+IGlzIHRoZSBiZXN0
IG9wdGlvbi4NCj4gDQo+IE1hbnkgaG91cnMgdG8gYWRkIGEgLS13aXRoLW9wdGlvbj8gSXQgc2hv
dWxkIHRha2UgMTAgbWludXRlcyBvciBzby4NCg0KMTAgbWludXRlcyBub3cgdGhhdCB3ZSBrbm93
IGV4YWN0bHkgd2hlcmUgdGhlIGlzc3VlIGlzIGNvbWluZyBmcm9tLiAgTXkgY29tbWVudCBhYm91
dCBtYW55IGhvdXJzIHdhcyBiYXNlZCBvbiBub3Qga25vd2luZyBhbnkgcGF0Y2ggYWxyZWFkeSBl
eGlzdGVkLiAgQ3JlYXRpbmcgYSBwYXRjaCB0byB0aGUgY29uZmlndXJlIHNjcmlwdCBmcm9tIHNj
cmF0Y2ggd291bGQgaGF2ZSB0YWtlbiBtZSBhIGZldyBob3Vycy4gIFRoaXMgaXMgd2h5IEkgZGlk
IHRoZSBmaXggdXAuDQoNCj4gDQo+PiBCeSB0aGUgd2F5LCBzaW5jZSB0aGUgYmFyZS1tZXRhbCB0
b29sY2hhaW4gbm8gbG9uZ2VyIGhhcyBhIGRlZmF1bHQNCj4+IGFyY2hpdGVjdHVyZSwgYWxsIG9m
IHRoZSBjb25maWcgZmlsZXMgaW4gcGF0Y2hlcyA3IGFuZCA5IG5lZWQgdGhlDQo+PiBmb2xsb3dp
bmcgbGluZSBhZGRlZDoNCj4+IEJSMl9UT09MQ0hBSU5fQkFSRV9NRVRBTF9CVUlMRFJPT1RfQVJD
SD0ibWljcm9ibGF6ZWVsLXhpbGlueC1lbGYiDQo+IA0KPiBDb3JyZWN0LiBUaGVyZSB3YXMgbm8g
cmVhc29uIHRvIGhhdmUgdGhpcyBhcyB0aGUgZGVmYXVsdC4NCj4gDQo+PiBXaWxsIEkgbmVlZCB0
byBzdWJtaXQgYSB2OSBmb3IgdGhpcywgb3IgY291bGQgeW91IGp1c3QgYWRkIHRoaXMNCj4+IGNv
bmZpZyBmb3IgbWUgdG8gZWFjaCBvZiB0aGUgenlucW1wIGFuZCB2ZXJzYWwgY29uZmlnIGZpbGVz
Pw0KPiANCj4gV2UnbGwgc2VlIGhvdyB3ZSBtZXJnZSB0aGluZ3MuIFBlcmhhcHMgYSB2OSB3aWxs
IG5vdCBiZSBuZWVkZWQsIGFuZA0KPiBJJ2xsIGZpeCB0aGluZ3MgdXAgd2hlbiBhcHBseWluZy4N
Cg0KT2ssIHNvdW5kcyBnb29kLg0KDQo+IA0KPiBUaG9tYXMNCj4gLS0NCj4gVGhvbWFzIFBldGF6
em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbg0KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2Vy
bmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZw0KPiBodHRwczovL2Jvb3RsaW4uY29tDQoNCkJl
c3QgcmVnYXJkcywNCk5lYWwgRnJhZ2VyDQpBTUQKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
