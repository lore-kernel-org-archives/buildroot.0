Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29912C4332F
	for <buildroot@archiver.kernel.org>; Sat, 12 Nov 2022 07:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67CC44189E;
	Sat, 12 Nov 2022 07:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67CC44189E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DmywtSfr1o-T; Sat, 12 Nov 2022 07:58:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0434F41896;
	Sat, 12 Nov 2022 07:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0434F41896
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CCE61BF41A
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 07:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA7A94010D
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 07:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA7A94010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YBUFcjR8SoQi for <buildroot@lists.busybox.net>;
 Sat, 12 Nov 2022 07:57:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D742400C8
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D742400C8
 for <buildroot@buildroot.org>; Sat, 12 Nov 2022 07:57:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBmTbRZ3wucn0yeA35OAW1pViQkY4zdw/l63YawbwPETsebXSldF6P03fHYFxO4uCsHUAvJq5la9qzC6hST2q/OBEc1LdMe3wMKqgjM7bNAknrJwHxhtT7V3Dp7LYyO7MNy6RjJC1yS4WyE/vgHo6D9wCxysI1EXEl0kLnL4u6dF9tP3zFJxRavE0TJcIkdEcTh1VLpcxC5o0dsWFP7do9NjTXL/GsH4yOCL+gHPyg7BdqFVgRBe7ppLjLX9IdRSmkDF50IHpkP9cGfvcMjsKh0/1ZY1A9dhV4AwWGK3BebvrvYC4w4ljkHTR740WG7Z6v7b7GKN2l+BBeVOwNOx6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdnHddF7rrd/VnjNkbbWT+CBNJ+HBNEA4Qlz+AV1rkk=;
 b=UNMX+i9quRWPBxZC19v4VCBXhwq8sWsb5Bx1+I65HYl2D65Nv6glSLryEVjNteYfLYDbJzbkbXjcY8MorYA34nwJQtVQJwifMRs4av+9kpUS0d+hTZsHnxbAuOODebmwtWt5HbyyPGwssFvWpmV0Ypir3r0Xu+BXjREzpSOjpavGT8LmsWuzzd4zuufvsA1yKmXrihcfNG2ant7mAibro1hE2tiRQ0M05Im9rpKXkS9t7Bd//Il9q+ztG/rVdGKdxx5vquRpFhSAgnqUuNcLHh/WSLHfRELZFupIrL6ykaV9JPFRwwQnqR3XdQwGHqdbXMT/8Zd68/c4yCBWumlHqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MW3PR12MB4474.namprd12.prod.outlook.com (2603:10b6:303:2e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Sat, 12 Nov
 2022 07:57:50 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%5]) with mapi id 15.20.5813.016; Sat, 12 Nov 2022
 07:57:49 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [git commit] add configs/zynqmp_kria_kv260_defconfig
Thread-Index: AQHY9g5Pz/8KQxO0J0OZ94r1tSRSgK467M3v
Date: Sat, 12 Nov 2022 07:57:48 +0000
Message-ID: <0C68589E-3CD4-45B3-9664-016BB50D510B@amd.com>
References: <20220506191229.6154E85C61@busybox.osuosl.org>
 <20221111214345.419477ef@windsurf>
In-Reply-To: <20221111214345.419477ef@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MW3PR12MB4474:EE_
x-ms-office365-filtering-correlation-id: 43f855eb-3525-4273-0216-08dac48397a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q2E48W2OlI5RY7qVRE2ku5Z/kJBSHdTUchWbeQemJMFlFJRep0jhE8Z8/MbrU59+AWfE1vaOJduCSy+opi26Srjyc/AN34SlPJzOOWhQC6kuZeNMmZmQc2FbRcRHAz1akCIn9QBglo6oY8u71nWXPL6n6XcWwFZ58WcgTGkukNTM4JwboItgQqzsJGxvLAtB+7eyyiF/67o3gcp5rfXFBhaW8Fw0QeJdXnsUS9Nj8D5bVZlKBMDY9eOIEeIQK41XyJjPqgrkYjsxqdQkyk4ZSOjIMvyiaCMxbPFBzFdOu7sZiavnWAs7xWId63l+OKjwZPsPfMtVEBf3ejL3Sl2Q4LRnNh7FctKFapFgPjSwhy++ilJ47NjSUH0mSUVCum4kB6gAulFQ3jJMcOw9Yh5xhlEYxYU/LSuhjvt+YTJzqz7eJi7tl6K3WYtKPrfUuBv/chz6IFn/jEs9RSykdlgbZuKeYFHgRH6LFlez/OsQ5YJDORGJM9uVJNsZ2Uv36eJV20tKUbvga9QuwhWfsNlqT65Q1eDRYKLCzk19Pudv8/REcZJs09GMQ1TRq2oTFwGqMpivQpHHj0aM8elbVflhT59znniHT9Hk8xNAWCRW1G5QfZLQDSmF6ZmKt605KuKUPWEd8itQumyD2e+J/cdS4S1B0+C6pY3BMX7vgm8YP2pg9jSwknUSgRQyshvWVnM31X7/nBvAuziF1vBTMa1uC23thu45zO4KuMq3KmEfgYDw9NRTpJrc3k/omXykDdxEpF8iKUmPoYdUErfAlWPTKWsPZDxk2DxPICDVJ4f9CoQZ/WgzdZ/HeL6oK+TSd5zTA5LnLnJ52TGiPjJzG3x/Usu2SZCZRQfFS2kwwBdCi8k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199015)(66946007)(8936002)(36756003)(33656002)(6506007)(38070700005)(86362001)(122000001)(38100700002)(2906002)(66574015)(41300700001)(83380400001)(5660300002)(71200400001)(2616005)(6512007)(186003)(6486002)(966005)(8676002)(478600001)(4326008)(66556008)(66476007)(64756008)(316002)(76116006)(66446008)(91956017)(6916009)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVBUYVV3NTJKYVhkd3R2bnNwc05yeTRFYUV3SkpuR0lBamZkeHRHRGM4WHlx?=
 =?utf-8?B?NHRRcTNEZ0JwRVdGTGdoOFRPZUY3YkZsUE5jZVB2Vjk5amhKTS9hUDd2UXRS?=
 =?utf-8?B?Zkt6QVhZTGRkM0MxOWhwNlo2cUx2M1JHRFhqQW5ZUHc0Sm83dzBLSXUvV3VV?=
 =?utf-8?B?Z2llbjZVdXRONWF4MUw4YXpHa1BXM3Jld0NXUHRVMFhYU2NWQVRxTFd6NkZE?=
 =?utf-8?B?ZnBheHYvWEFVRXVMbDI5bmd1UThLN0prUFg0ZC9pZDF3RjdLZ2VsK1Z2SUlP?=
 =?utf-8?B?UXN1YmhDRklFaWcwK3MrQ0NXUmtYOWJSaHlwdXRFc0RHWTJqRURHTE92amx2?=
 =?utf-8?B?VDBDMFNUT1NvVmlkTEVuVVltVTFGUmJMNDZzYVBpMnc2M2ZWK0g3T0Ezc1Rw?=
 =?utf-8?B?Q3pCOGpoeHE2WGZQNms2eXQ2YkhRUyt3SG11MzNsVmxZMlR6Um1SOGdpMUdR?=
 =?utf-8?B?bUlZT1FoakhUVjhxbUJtbXlVK0RPbFZySnNVeU5wbktSSnlBWms2RDUyeE12?=
 =?utf-8?B?SEhJdS9PY0hpQ0hjZ1dUL2NzSEgrT1VuaDlYRVRPOW1vQU1HR05OaXhBcmVW?=
 =?utf-8?B?Z0ZXaU0vaUp6RFI5MW5ZSzhnYkovbFFtUFhLNjdlQ1JEM25qc1NMRXpRR3dD?=
 =?utf-8?B?RTJUTGVySHlnSG5wWDhMMjVWRkN5VVlFSHE1dFhnNXNOS2cvVDRvZEVQMy8x?=
 =?utf-8?B?VWVNZWxPWVBxb3VNV1VwZjBMMk90VXpBaWpJak05ZXMvS3J2ZlAvek4wL0Vi?=
 =?utf-8?B?ZENsTUpVY3ZqaElxNHhDSjlUdTRYQmwzQlpIOWg1T1BDd1pLczh1TzlBMWpR?=
 =?utf-8?B?cUxvT2x1L2lIcEF4a29VMkJlMUtMT2MzQWh0MUhyMGVDYjh4OCt4N0tqSDlH?=
 =?utf-8?B?U2hmL1FrWnc1RDhRa2R2ZUxreEV4TjZ6VEZVM3lucDZmb0lScTFvQlhFcnEv?=
 =?utf-8?B?KzU1V3QxQmxoMWNCbGhmRGtCTUZwVVRKTFVzUmhCZnZZQUtsTjVBQmcrbURT?=
 =?utf-8?B?KzFCZ0RhY3VReGpvYVRZejJhQWZtbmRMaVhKVXpKODR3SE9lTk5kZVo2a3pq?=
 =?utf-8?B?ZFRZR2x0NGlEK1VZNU1NMnBRNFF0Vy8vY2lMbXpKc0F3ZUVRY0s1ZDhiTjBJ?=
 =?utf-8?B?cnFPZGx2ckVwdWxQbFYrbGdZR3pTQmduMk9LZUhma1puYnIvYUVtR3ZoZEwx?=
 =?utf-8?B?UU9DUEFNemVWeHg0dENURktvclNhdHl3b1g3emh5bE54d0JXdVVvbTY5K2RD?=
 =?utf-8?B?UkFWd2tnZlBPb1JlVTdvNzgrNU95S2wwSm5NVzBjZ3hXbFZlYWZlUDltL0li?=
 =?utf-8?B?Q0N1OENqM1BEWDVVb1JTOEJnOWNidnNlQXEwUllYUElDNU02Tmp1YW1FNExX?=
 =?utf-8?B?WDBCbGRNUGxEb3huS3VOTFA5VmZxS1FuV20zME9WQXhGdUNiT3pUYlZoSHR2?=
 =?utf-8?B?M0VSSjlmbDRKb09JNnFJekczaFRkdVc4YzRhM3NsRGVHK3hmTW01SXltWHNU?=
 =?utf-8?B?eC81VkVRTHFORFVjbzV2Y1ZSZ2RvL1d5SHkwZ0F6aVFVaHlMdUVScWU5RFMz?=
 =?utf-8?B?YWgxa0R6WUt6TUN1UGQzM21uelFEZGowb2dlend0SVNOUURTRHF4dGc5aU16?=
 =?utf-8?B?VWlaNEpjeXp6ZmVSS0Jzay9hVWNmY0R3TFkwMStqZ1FrRE45UHY3VzcwTFRF?=
 =?utf-8?B?N2FtR1grcEZPN3NhcjFvKzVaa2YrRU16SnNSeXg4T3htL1B0c05YSW1zVlFp?=
 =?utf-8?B?bW9ra1FFOEg1WUtQOEVNSG9YakVHSTdubVN0SmE1QXQ5c3N0eFhHMkVXQUdh?=
 =?utf-8?B?dnd6Y1BGWjZKVlUybWhVdkhlZzhVb2Q4YXV4ejlPYWRsVEEwMTltM0pRRllw?=
 =?utf-8?B?VERPRlFiTmQrS3ZlVXRvVHE1a1VTWWlwb3owMlErSzlzaEtYNGVkd1RPTllN?=
 =?utf-8?B?bXNmcktyamdOOTNnZjFrU01RTzIxbmk0K2RQOXRab3lDNFRZSnE5Szd2TTFi?=
 =?utf-8?B?aFZlNGZoTzBYc0phTUFyc0RBSUcxRFgrNFlZMytSRUpleG5VaVNKbzVaam56?=
 =?utf-8?B?RHVCRzJrNGxQdytCYjlzRmZuVWF3Ri9EcGQ3ZVFKY1BsR0tpeUp0ckw4SFM4?=
 =?utf-8?B?enNLVGp0dVlhK2ZEK3RaMWRydmNmaUltTGs0dHUzRkZGeFBxZ3cxUVZScXdq?=
 =?utf-8?Q?3//Ap2nIniVpa9h7yv+83+g=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f855eb-3525-4273-0216-08dac48397a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2022 07:57:48.9771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: if2rrcI3Yr+2wnQJf9pebhWiEK/wNtCxGsQF6Fvlev4TOKbSziuj/Lvy3cgIiyHh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4474
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdnHddF7rrd/VnjNkbbWT+CBNJ+HBNEA4Qlz+AV1rkk=;
 b=sPEFN4/90V/xxlJZnxFmSpNaJqsq+dJ7PVhDEIIX/it5rN6Y5m5i1BndLy9cG92KC7hNfu512dALvmMyfnfsA9OqjuHOvkjtr6pKJMI88+hmgxFrb4JF4XXVzat10842FWG/jQ6ns29G+kHIB85hMKQuwGVXIpdcOjyLZZ+JAQE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=sPEFN4/9
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [git commit] add configs/zynqmp_kria_kv260_defconfig
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLA0KDQoNCj4gTGUgMTEgbm92LiAyMDIyIMOgIDIxOjQzLCBUaG9tYXMgUGV0YXp6
b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6DQo+IA0KPiDvu79I
ZWxsbyBOZWFsLA0KPiANCj4+IE9uIEZyaSwgNiBNYXkgMjAyMiAyMToxOTozMCArMDIwMA0KPj4g
UGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cm90ZToNCj4+IA0KPj4gY29t
bWl0OiBodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPWI3M2Y1
YzMyYWY4YTViZmM0YWY5YjM4ZGM2OTFkMDEwNTdmNzM0NDMNCj4+IGJyYW5jaDogaHR0cHM6Ly9n
aXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD1yZWZzL2hlYWRzL21hc3Rlcg0K
Pj4gDQo+PiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgWGlsaW54IEtyaWEgS1YyNjAgc3Rh
cnRlciBraXQuDQo+PiANCj4+IEtWMjYwIGZlYXR1cmVzIGNhbiBiZSBmb3VuZCBoZXJlOg0KPj4g
aHR0cHM6Ly93d3cueGlsaW54LmNvbS9wcm9kdWN0cy9ib2FyZHMtYW5kLWtpdHMva3YyNjAuaHRt
bA0KPiANCj4gVGhlIGJ1aWxkIG9mIHRoaXMgZGVmY29uZmlnIGlzIGN1cnJlbnRseSBicm9rZW4u
IFRoZSBmYWlsdXJlIGNhbiBiZQ0KPiBzZWVuIGF0IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMzMxMDQ2MzI4MS4NCj4gRnVsbCBidWlsZCBsb2cgaXMg
YXQNCj4gaHR0cHM6Ly9idWlsZHJvb3Qub3JnLmdpdGxhYi5pby8tL2J1aWxkcm9vdC8tL2pvYnMv
MzMxMDQ2MzI4MS9hcnRpZmFjdHMvYnVpbGQubG9nLg0KPiANCj4gVGhlIGVycm9yIGxvb2tzIGxp
a2UgdGhpczoNCj4gDQo+ICBNS0lNQUdFIHUtYm9vdC5pdGINCj4gRkFUQUwgRVJST1I6IENvdWxk
bid0IG9wZW4gImZpdC1kdGIuYmxvYiI6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCj4gLi90
b29scy9ta2ltYWdlOiBDYW4ndCBvcGVuIHUtYm9vdC5pdGIudG1wOiBObyBzdWNoIGZpbGUgb3Ig
ZGlyZWN0b3J5DQo+IG1ha2VbMl06ICoqKiBbTWFrZWZpbGU6MTQzMTogdS1ib290Lml0Yl0gRXJy
b3IgMjU1DQo+IG1ha2VbMl06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uDQo+
IA0KPiBDb3VsZCB5b3UgaGF2ZSBhIGxvb2s/DQo+IA0KDQpJIGFtIGF3YXkgZm9yIHRoZSB3ZWVr
ZW5kLCBhbmQgSSBkbyBub3QgaGF2ZSBhY2Nlc3MgdG8gYSBjb21wdXRlciBhdCB0aGUgbW9tZW50
Lg0KDQpMb29raW5nIGF0IHRoZSBlcnJvciwgcGVyaGFwcyBzb21ldGhpbmcgaGFwcGVuZWQgdG8g
dGhlIHVib290LmZyYWdtZW50IGZpbGU/ICBUaGVyZSBpcyBhbiBvcHRpb24gY29uZmlnX211bHRp
X2R0Yl9maXQgd2hpY2ggbmVlZHMgdG8gYmUgZW5hYmxlZCBmb3IgZ2VuZXJhdGluZyB0aGUgZml0
LWR0Yi5ibG9iLiAgSSBzdGlsbCBzZWUgaXQgaW4gdGhlIHNvdXJjZXMgd2hlbiBJIGxvb2sgYXQg
dGhlIHNvdXJjZSB0cmVlLg0KDQpCdXQgSSBkbyBzZWUgc29tZXRoaW5nIHN0cmFuZ2UuICBUaGUg
bWFpbiBicmFuY2ggYXBwZWFycyBub3QgdG8gaW5jbHVkZSB0aGUgbW92ZSBvZiB0aGUgZGV2aWNl
IHRyZWUgZGVmaW5pdGlvbiB0byBjdXN0b20gbWFrZSBvcHRzIGluc3RlYWQgb2YgdGhlIHVib290
LmZyYWdtZW50IGZpbGUuICBEaWQgdGhlIGxhdGVzdCBwYXRjaCBmb3IgdGhlIGt2MjYwIGdldCB1
bmRvbmU/DQoNCj4gVGhhbmtzIGEgbG90IQ0KPiANCj4gVGhvbWFzIFBldGF6em9uaQ0KPiAtLSAN
Cj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbg0KPiBFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZw0KPiBodHRwczovL2Jv
b3RsaW4uY29tDQoNCklmIG5vdCBzb2x2ZWQgYnkgdGhlbiwgSSBjYW4gbG9vayBhdCBpdCB3aGVu
IEkgYW0gYmFjayBvbiBNb25kYXkuDQoNCkJlc3QgcmVnYXJkcywNCk5lYWwgRnJhZ2VyDQpBTUQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
