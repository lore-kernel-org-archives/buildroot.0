Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA826C4167B
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 09:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DBA44338B;
	Thu,  2 Nov 2023 09:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DBA44338B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OiBfs1zsVfVs; Thu,  2 Nov 2023 09:35:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7988E40A92;
	Thu,  2 Nov 2023 09:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7988E40A92
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D9CB1BF591
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 09:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35AEF4EBCB
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 09:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35AEF4EBCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2qY92R0RXk76 for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 09:35:41 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA30E4EBB3
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 09:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA30E4EBB3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XK7nCv0ii8gYk3p00HUuOcKvVjaekl37JxNChEja+vVDyx3yuxPbPpQHreKfiAUKGQxaYbh+BsF0eIpCFwtAb1ue9YETJCYB+byLJXIWg2RvWNWdZD5tP7eXoHKnDe5YgFeO47a5nzMD0J92q5ZHH7aPiAfwEDk3KiaL2ErbvmXSqOvpV9dG10LQssVpIknimyL05BRs3L/LnnupMHVl3u7xskg1tu8pGun5zpIi0JVR0/8xKCqFl9mc2J8FYoNOYit6TZwG8vaQMP/QAb2pOgFHfSSEcqy/OhV+yb4d3ecVOpU9RR1ncE/1YhhWSlZ0uC0mK1NEo8A9hieX7cQXIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60ZHkgVdAtsS58/yhoF3Ukvf8xfpvAF2wEshV++ch38=;
 b=TDexCGpzJJCDq9apUgOlnhO7iHruHW/LjBsbZWO+w7Uj35WFekdCL8uHeFtIOrRRKAW62QdoLRKFhW18j82DQYSXvF/BmCDDKdTcRO0GQaOBhQZF4QlqA/ECcUfvtEZsVwZgNAXzNIbvKns9mJxc12RUyu60VB87MShFWaIVUeHEJkU0WCplMBT71KFon60V5BVcZ9Q2If0ipLLDyIfG58a2uDvqg78ASGMUzSfJKxxEPll8pz42tFwLb6ympBF+yn+ZkEAjDM9OVFC9nSTwA7l521q5mdYR+YNoqCbbxN7XRxhNPzzYItmV8oChW6uIJSituj0j0rAzzx9mBIHijg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DS0PR12MB8367.namprd12.prod.outlook.com (2603:10b6:8:fd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Thu, 2 Nov
 2023 09:35:36 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50%4]) with mapi id 15.20.6954.021; Thu, 2 Nov 2023
 09:35:36 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH v6 03/10] package/newlib-bare-metal: new
 package
Thread-Index: AQHaA0qXU55l7C7pwkan+EbiGTH5Q7Bj6Q6AgAGBHmCAAAKNAIAAGPkwgAAGH4CAAU13hg==
Date: Thu, 2 Nov 2023 09:35:35 +0000
Message-ID: <5A1B4380-E6F8-47CD-9118-694D76488877@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-3-neal.frager@amd.com>
 <20231031134317.4ce2349e@windsurf>
 <CH2PR12MB5004C8F27820E2EC98FC5232F0A7A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231101125048.01553f76@windsurf>
 <CH2PR12MB50049049609F6BE2EF07D89FF0A7A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231101134205.GC114892@scaer>
In-Reply-To: <20231101134205.GC114892@scaer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DS0PR12MB8367:EE_
x-ms-office365-filtering-correlation-id: a1a88f32-262a-4dae-c87a-08dbdb87114e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eAAKxv5ZGWK3o2D4eeft+divcPKnWLZUJKH2qCIqBC76QEYF8h2xXT1ynvycWY9mu5Z0GHPyMgInlk357Z5SA4GDgsUZJJHrfnMZQEvBgy1tRcMBqQchNQ3ULmZZpu7Kyt1N6h34Ez+D7jl9+trUdyl8xlKlHk93PNLKoDdkMYwBEAfE2LPosxh71sTrtCgCh4VE0Wl9Z01t/6tqDKkTwLDi1ZC99HXncfUtIa/ceYxf810Y4zyJIuUHfD2hZX7TQt5zsBTtmtefdQr4AtBQl6z2syJRkB7XanN4c6xUTLCNgRpn5545b/dTLOb/wpuecbktQfLidoR4XjtORAADL6nSWdnvj3rqYQoeGeDaWxcDwXNFRDmc2HyEF3BBp2Qy3zlRLeOZX2aX4x7Ztdi+n6sqWMm8gVLjjHUBfu4Ek6R22vYSCum955mWvzr27SPCAwwgo9y3eLL0i/TaLSvYWq+tVcLrUIwVGABcP5BAqIkzW9uy9cipA1F3ACD++0AMzvsXJUaitBiq44QcW7cxjoBCXOQIl9LtETi0ah92cmgfT9a2vfMGEYlezKIJ5M8IBs3Nco42EspwMP581HB7DY76lQQN4esnVgvSukMNZX0EXBd51t3tq4z2chEHvjPs4xudxUiQh7KCz3srAS89t/9OT5Cq9xZ5RhNOl0DDgM+pUr6+XX1R1xYvx7yWq+vTWlCU//79cKjoilv6JFctqw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(366004)(396003)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(38070700009)(6512007)(26005)(6506007)(122000001)(33656002)(38100700002)(36756003)(2906002)(478600001)(71200400001)(64756008)(66946007)(66574015)(2616005)(6486002)(316002)(8676002)(66476007)(86362001)(54906003)(966005)(4326008)(8936002)(6916009)(66446008)(76116006)(41300700001)(66556008)(83380400001)(5660300002)(91956017)(15866825006)(45980500001)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1hUd3l4UzR0aFphWFRHMW9WbXlDQUV2TDdRQ1FPZHpNZTQyNEtPTmZud3BY?=
 =?utf-8?B?QlIzbUluL2hSOVlzMTRpdGV6TTFSTWgzS1dDdmM3aTdubzVuaHZQcUEwdHJH?=
 =?utf-8?B?RG43b2d6U3VweDU0MXgzbHhFNGhjMGk0MVovb1Y0S0VLSlpseHY2OEpOMG1y?=
 =?utf-8?B?dzB2WG5BV3ZJQURITEQ4WTViUFNYZHJMVW1KKzFCVFMzNGJ6Qk9jbUhyRXpZ?=
 =?utf-8?B?SzQzQ0hRMGd3UXpxVjlhSW5iZlZJOU1IS215SWhRaFF6L25Zd0t3b1V0L042?=
 =?utf-8?B?TjZacmFEeHp0akdXVEs2NmdXajArVTRqUGdYaUhjTVVza2hLTlZId1BaazA4?=
 =?utf-8?B?RjVVVWcxc1cvWW5aREFWb2IwYmVSeWV3b0d1TjA4VzFWYmM2dVBpY29BZlBN?=
 =?utf-8?B?NHgxTzVCYUgydnhsT2hCbzBuUFF5aUxFcDRhK3d3NDREeGV1OTJCcjM5VWM0?=
 =?utf-8?B?OGJvUGFuM2o3SmZCdW9Rd1gyY1VXWkRBVE1acTRzNHdqQVg5STZiNysvdytp?=
 =?utf-8?B?QVI1NzJnS2QxT0EwbUlsWVlEVGdoSG5vK3lUY2NhRVpsVzNnSCt6cXhRb2NN?=
 =?utf-8?B?UFRlZzFTSE9EVDFtUU5KeXJOV0JzdTFocjU3dXlsZEFRc0E0ZU9sT29WK3VV?=
 =?utf-8?B?YXYyT1QxOVVXZE8zMVhlNXpuak9vMHdNekRYVUpUdklVdkM4RHZNMFBXY0dS?=
 =?utf-8?B?Y2FPT3dyZXF2Zm8xaXdiejlEUzQ0cFpDQ2hsSG5tUVlJUXhsbDNOMlFuRnMy?=
 =?utf-8?B?bUdtLzBGdno3TEZGdDVQK0RZbllNRFdlaE1jc2RaWGhxMTdaRTNRNmEzK092?=
 =?utf-8?B?MGN3bEY4VkNuMVJIVGVkc05NaFpISnpqYmRwb3EyVGVjZ2ZIL01CZUhYVU11?=
 =?utf-8?B?MTFOMGJwb3ltUU5QZERrMFNzakhiMzZuN0hReXlDVEFrRDJDV1FTMFNTRHBT?=
 =?utf-8?B?SisvQitSV256MzVENEZNYmVTb2lPWHNtSzcxMVh3a3ROVVVFMzl3Z09LczNZ?=
 =?utf-8?B?a242ZHNzVU5WdHJ4TjJjQlVpV0VDSWh0QmxoK0ZpYityK1Z2YTlhWlNFQzBC?=
 =?utf-8?B?cytkbHlpQ2tiaERwRjBVajkwQ1RvL0E2bmdWM052RzJncnlHVFhGSXNFdWRJ?=
 =?utf-8?B?MmcwWDU2NnQwSGcwYnF5dVFjYUtyNDdOd2dsaW8wcHpGV1I3QmhMSDRCeGlM?=
 =?utf-8?B?Q2hlRHUxbUpqenIxTWxVWkJxdW9VVUNmcDExOGVGUnRZR05vMitFT01MVW5j?=
 =?utf-8?B?c1hJQlJ4RDNNOEpMU1k4RU4zeGI2Wm1vQ2FBMnFEYzJBcmdURmk0NUkwV1hq?=
 =?utf-8?B?bXVxbURCNWI4NnJORElNOFg1aWFyeXdRaXlaN3o4bzRzYXQzMlk4MXUrWjBK?=
 =?utf-8?B?N0p5SUgwcnFQaDNQajdhUkhxN0pqSXk1RTJiYW5McUVySmdja1VIKzc2Qksx?=
 =?utf-8?B?U3pDR213emYxVVZUOUh5NlYwclVxOXRiZnVkN0xJVng4dnhiejU5UExpa293?=
 =?utf-8?B?bEg0d05YNDlVQWp6VmhwTHZXZk9XdFhaYVRvSGN5c2FUMll4TjhnUDNNWk92?=
 =?utf-8?B?OFFzRHU4OFBndFlsWFo0UzdtVTR3NG8wbG9CLy9kanFBNFN4cE82dGdUZWxn?=
 =?utf-8?B?K29KZExuVWt6MENoS1hVclVsd0EweFBWeTJOd0pNaS9Gc24zYmkweVFBZXpp?=
 =?utf-8?B?T0s4T1V5SjBlcjg4M3llemN5T2gzS1FldUplaWd0bVl6WE9tQUNjMC9McDBr?=
 =?utf-8?B?V2Y2endHQmp5YklxN0FiaVdJY3B4R1JvZjlNQjNjbzFhNXZHZ3dKQkliczBr?=
 =?utf-8?B?OEZPcGhsREtzUk5EZ0QzR1MzMHFBMGNScHc1SnFYeVM4UG9ydW1FbEZyNWRO?=
 =?utf-8?B?TExpeTZQeUdnSFlhbVJwQm5mWXZ1L1llOTJFdlpLR3NuMFYwY1NKc2w5MWJp?=
 =?utf-8?B?OFkvVjFHUDFvU25kbEdha21wRStodG80TWp5K0lLeXpYVW9ldGRiUDdPSk9G?=
 =?utf-8?B?QzlJekJ6aDNLa05sQytKb3hEcEpsNXl2djBLcy9MRDFiT3p4VExjVnp2UXZG?=
 =?utf-8?B?cENTRkIyQVk5Y3daTlhsYWpGTkFBK2dKeTJCRGxxblloSzBEaTFwcFdZR0lw?=
 =?utf-8?Q?GHqI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a88f32-262a-4dae-c87a-08dbdb87114e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2023 09:35:35.9905 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Q8nY1CvxHfQgZj2sfFkLTSrjngwB0/RYh9NjGSGh4+8+AYs+NIaSSkET8XzEorl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8367
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60ZHkgVdAtsS58/yhoF3Ukvf8xfpvAF2wEshV++ch38=;
 b=VlzizdoP6/kCB1/eGZgiesd6Ek25s3YMNrWr0CMsZYftP8192LQSfblyDcNyVbfHhwoZbcJVWztE6ZoAya+UtxNkRSAYXPS+aYi+GTkc5iReWUqSRG00mKpvK5yKs1TVAoqwruKYO/RGwzDSB1Uj+GgV4APA+icYSlbMPB95M7Q=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=VlzizdoP
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v6 03/10] package/newlib-bare-metal: new
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwNCg0KDQo+IExlIDEgbm92LiAyMDIzIMOgIDA3OjQyLCBZYW5uIEUuIE1PUklOIDx5
YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gYSDDqWNyaXQgOg0KPiANCj4g77u/TmVhbCwgQWxsLA0K
PiANCj4gT24gMjAyMy0xMS0wMSAxMzoyMyArMDAwMCwgRnJhZ2VyLCBOZWFsIHZpYSBidWlsZHJv
b3Qgc3Bha2UgdGh1c2x5Og0KPiBbLS1TTklQLS1dDQo+PiBVbmZvcnR1bmF0ZWx5LCBieSBtYWtp
bmcgbmV3bGliIGEgdGFyZ2V0IHBhY2thZ2UgaW5zdGVhZCBvZiBob3N0LCB0aGUgYnVpbGRyb290
DQo+PiBpbmZyYXN0cnVjdHVyZSBkb2VzIG5vdCBzZWVtIHRvIGxpa2UgdGhhdCBuZXdsaWIgd2Fz
IGJ1aWx0IGZvciBYaWxpbnggTWljcm9CbGF6ZQ0KPj4gYW5kIG5vdCB0aGUgZXhwZWN0ZWQgQUFy
Y2g2NCB0YXJnZXQgYXJjaGl0ZWN0dXJlLg0KPj4gDQo+PiBCZWxvdyBpcyBhbiBleGFtcGxlIG9m
IHRoZSBlcnJvciBtZXNzYWdlOg0KPj4gRVJST1I6IGFyY2hpdGVjdHVyZSBmb3IgIi91c3IvbWlj
cm9ibGF6ZWVsLXhpbGlueC1lbGYvbGliL2xpYmMuYSIgaXMgIlhpbGlueCBNaWNyb0JsYXplIiwg
c2hvdWxkIGJlICJBQXJjaDY0Ig0KPj4gDQo+PiBJcyB0aGVyZSBhIHdheSBhcm91bmQgdGhpcywg
b3IgZG8gd2UgbmVlZCB0byBrZWVwIG5ld2xpYi1iYXJlLW1ldGFsIGFzIGEgImhvc3QiIHBhY2th
Z2UNCj4+IHRvIGF2b2lkIHRoaXMgaXNzdWU/eg0KPiANCj4gWW91IGNhbiB1c2UgX0JJTl9BUkNI
X0VYQ0xVREUsIHNlZSB0aGUgbWFudWFsOg0KPiAgICBodHRwczovL2J1aWxkcm9vdC5vcmcvZG93
bmxvYWRzL21hbnVhbC9tYW51YWwuaHRtbCNfaW5mcmFzdHJ1Y3R1cmVfZm9yX3BhY2thZ2VzX3dp
dGhfc3BlY2lmaWNfYnVpbGRfc3lzdGVtcw0KPiANCj4gSG93ZXZlciAoYnV0IEkgaGF2ZW4ndCBy
ZWFkIGFsbCB0aGUgcHJldmlvdXMgcmV2aWV3cyksIHdoeSB3b3VsZCB0aGF0DQo+IGZpbGUgZW5k
IHVwIGluIHRhcmdldCB0byBiZWdpbmcgd2l0aD8NCj4gDQo+IEl0IGlzIGEgc3RhdGljIGxpYnJh
cnksIGFuZCBmcm9tIHdoYXQgSSB1bmRlcnN0YW5kIGFib3V0IHRoaXMgYmFyZS1tZXRhbA0KPiB0
b29sY2hhaW4sIHRoZSBnb2FsIGlzIHRvIGJ1aWxkIGZpcm13YXJlcyBmb3IgY28tcHJvY2Vzc29y
cywgYW5kIHRob3NlDQo+IGFyZSBhbHd5cyBnb2luZyB0byBiZSBzdGF0aWNhbGx5IGxpbmtlZCwg
cmlnaHQ/DQo+IA0KPiBGdXJ0aGVybW9yZSwgbmV3bGliIGlzIGFsd2F5cyBnb2luZyB0byBiZSBh
IHN0YXRpYyBsaWJyYXJ5LCBuZXZlciBhDQo+IHNoYXJlZCBvbmUsIHJpZ2h0Pw0KPiANCj4gQXMg
c3VjaCwgaXQgc2hvdWxkIG9ubHkgbmVlZCB0byBiZSBpbnN0YWxsZWQgaW4gc3RhZ2luZy8sIG5v
dCBpbg0KPiB0YXJnZXQvLCBhbmQgdGh1czoNCj4gICAgTkVXTElCX0JBUkVfTUVUQUxfSU5TVEFM
TF9TVEFHSU5HID0gWUVTDQo+ICAgIE5FV0xJQl9CQVJFX01FVEFMX0lOU1RBTExfVEFSR0VUID0g
Tk8NCj4gDQo+IEFuZCB0aGVuLCB0aGUgY2hlY2stYmluLWFyY2ggd291bGQgbm90IGZpbmQgdGhh
dCBmaWxlLCBiZWNhdXNlIGl0IHdvdWxkDQo+IG5vdCBiZSBpbiB0YXJnZXQvIGFueW1vcmUgKGFu
ZCB0aHVzIF9CSU5fQVJDSF9FWENMVURFIHdvdWxkIG5vdCBiZQ0KPiBuZWVkZWQgZWl0aGVyKS4N
Cj4gDQo+IEFuZCB0aGVuLCB0aGlua2luZyB5ZXQgYSBiaXQgbW9yZTogaXQgbm90IG5vdCBldmVu
IG5lZWQgdG8gYmUgaW4NCj4gc3RhZ2luZy8gZWl0aGVyLCBhcyBzdGFnaW5nLyBpcyBmb3Igc3R1
ZmYgdGhhdCBhY3R1YWxseSBydW5zIG9uIHRoZQ0KPiB0YXJnZXQncyBDUFUsIG5vdCBjby1wcm9j
cy4NCj4gDQo+IFNvLCBJIHRoaW5rIHRoZSBnY2MtYmFyZS1tZXRhbCBwYWNrYWdlIHNob3VsZCBi
ZSBjb25maWd1cmVkIHdpdGggYQ0KPiBzcGVjaWFsIHN5c3Jvb3QsIGFuZCBuZXdsaWItYmFyZS1t
ZXRhbCBpbnN0YWxsZWQgaW4gdGhhdCBzeXNyb290LCBlLmcuDQo+IHNvbWV0aGlnIGxpa2U6DQo+
IA0KPiAgICBIT1NUX0dDQ19CQVJFX01FVEFMX1NZU1JPT1QgPSAkKEhPU1RfRElSKS8kKEdDQ19C
QVJFX01FVEFMX0FSQ0gpLWVsZi9zeXNyb290DQo+IA0KPiAgICBIT1NUX0dDQ19CQVJFX01FVEFM
X0NPTkZfT1BUUyA9IFwNCj4gICAgICAgIFsuLi5dDQo+ICAgICAgICAtLXdpdGgtc3lzcm9vdD0k
KEhPU1RfR0NDX0JBUkVfTUVUQUxfU1lTUk9PVCkNCj4gDQo+IGFuZCB0aGVuOg0KPiANCj4gICAg
TkVXTElCX0JBUkVfTUVUQUxfSU5TVEFMTF9PUFRTID0gREVTVERJUj0kKEhPU1RfR0NDX0JBUkVf
TUVUQUxfU1lTUk9PVCkNCj4gDQo+IFRvdGFsbHkgdW50ZXN0ZWQsIGJ1dCB0aGlzIHNob3VsZCBn
aXZlIHNvbWUgaGludHMgYXMgdG8gd2hlcmUgdG8gaW5zdGFsbA0KPiBzdHVmZi4NCj4gDQo+IFRo
b21hcywgd2hhdCBkbyB5b3UgdGhpbms/DQoNClRoYW5rIHlvdSBmb3IgdGhlc2UgZGV0YWlscy4g
IEkgd2lsbCBzdGFydCB3b3JraW5nIG9uIGltcGxlbWVudGluZyB0aGlzLg0KDQpJdCB3b3VsZCBi
ZSBncmVhdCB0byBnZXQgZmVlZGJhY2sgZnJvbSBUaG9tYXMgYXMgd2VsbC4NCg0KVGhhbmsgeW91
IGJvdGggZm9yIHlvdXIgc3VwcG9ydCENCg0KQmVzdCByZWdhcmRzLA0KTmVhbCBGcmFnZXINCkFN
RApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
