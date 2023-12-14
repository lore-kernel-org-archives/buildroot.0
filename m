Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75751C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 14:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 102EB408C7;
	Thu, 14 Dec 2023 14:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 102EB408C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yo3p0LbcfXf0; Thu, 14 Dec 2023 14:43:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30ED4408AA;
	Thu, 14 Dec 2023 14:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30ED4408AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5785E1BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 14:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B09C408FC
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 14:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B09C408FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GI-3FFDSczsX for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 14:43:14 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::628])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A87B540545
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 14:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A87B540545
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDXhaPD0aZph0F5zTK8dZhZtJjKqB7KBrrmCccmQAHuJ7oMK7md5K/38qVjvIySNpFSYrLFqfVshwcoU1uSYGlRUsa8VU9arbU07Min9WkBNCGrgIVHyHaNsmqnaX/Ui8UT4PELo2k49gvpLCOuO5now/hXEq66aavyyKGSc0/dPpssbGqq1uVta8luS/QgMPoK1PhwbdadCKsNKXTZcfhD8F0vaEAl7P+9bfp7sz5rcKTG8Lz3chsCwEDlnENZR5x6Vvn0IN1aN3bvMD9f+dA8OnS6W4dGf2nL/3bcg1Bd6RElVcqReihAtbRxYCW5x1L1OowaQvbdn8WNjhVt8EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fO40OFU3nt7HsMAnNiV/OleCdpCf0yAWF9c//gUvccg=;
 b=TyhGVgI95eysMg05x39yArZI9dWO6PZrGDWFy+wD+LCHtrjdQ2AFqE8djBwE7nih6KLTWTcOLAgsU+2KNfLTPieQc0OABPYgYe56OeqAi5MY1ZAE589dfIN+WgMLaidIxS30PCaawjUvre8ytwcRBkeXZp2QTVl8TKVQgDaS4mF8CeYOQ1/b7BO4crmKEVS/jcIMzN/gxgzR1CuSzx3MWEokQdf/f19qMm7sKvSo2SxaxXAP1Tp3pO6ngKQSRArJPP3JkKGr3+kaBU6BJhC0dZILQB6G2KRgOyKVYme4j/TViVbKMZ1jqzv02BMWAfDdHIwNCvT58bzK4TRzV0f0Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SA1PR12MB8722.namprd12.prod.outlook.com (2603:10b6:806:373::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 14:43:10 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::cd8a:4814:157c:bbe]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::cd8a:4814:157c:bbe%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 14:43:10 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v8 01/10] package/binutils-bare-metal: new
 package
Thread-Index: AQHaJoRsxU6mz5uOtESx1TgKL/L3BLCn2nkAgAB1mMmAACS8AIAAARrQgAAD0wCAAAPUlIAAEXaAgABZzUA=
Date: Thu, 14 Dec 2023 14:43:09 +0000
Message-ID: <CH2PR12MB500466A773982DAFA362BEADF08CA@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231204073443.1543587-1-neal.frager@amd.com>
 <20231213232854.5242117f@windsurf>
 <5EB6E748-BA27-414C-9AB0-434429B724BF@amd.com>
 <20231214084116.48e04ecf@windsurf>
 <CH2PR12MB5004DAEB064E623D3575D3A2F08CA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231214085854.558ce0c1@windsurf>
 <D15E2E86-61C5-4344-8669-FDE201516BF5@amd.com>
 <20231214101505.3dcac5e7@windsurf>
In-Reply-To: <20231214101505.3dcac5e7@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SA1PR12MB8722:EE_
x-ms-office365-filtering-correlation-id: 977f7adb-0c1c-4624-d163-08dbfcb2fe0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LVZIaLwabw7SInEpZ8jwxzMKHZd8aHgdagIuO3IgKJPtS+OCkVANBYmoVTOns/RUOvypCPI8N5jE4Ps4oB4wwLTf90YtPNw5Gp302MgD5ROy5F4QIB+eBYa2kaGt/Ve76W+oMs1eQKh0YGKKswJFggGBXgO4XkGAK8DuXnTulDTsvXcep9MyU8n+D7wtDzEUy6ayY1Say2UZJDZ5yhz2bYpzJL0DdWc6wIbRVIXCi3an7MvqZX0jdR+dJbXUimRRtEEvizgCtaKyZud0tifAM6FgYx4o7tAeympm4LlfE+w2CEJuNKtX2NBG6G39kF8JRpT1T+xlZZEll12jdL0/0xnk2gdPdrEjsn69f00U4DeyULrsqI4oo1qSbg4jXU9MnaeoinynuEAWzvT9MCwHhHzXwALQtILF7KRQQ9fWC+OCNyh/3/PX4oyHXpf15XdRApsBTwvUTd/e0pT4BLeS91Ov9IBD1F5cTc04yxdYet8fMtveTS39oQHeuECYIVMLTvUK9sikO4pvejKn4ZG+6jMDgm8ItxudpkUfkItLzQqcfkclm3Obx1TWnIVpjm0DrWYEr04dPv8gGgURvB7pCjGx9AMpiWIpPc11HULncJaFj4nyUOOY1I4NpSW7zrvU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(136003)(39860400002)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(5660300002)(478600001)(45080400002)(7696005)(9686003)(6506007)(66556008)(66446008)(64756008)(6916009)(54906003)(316002)(66476007)(2906002)(122000001)(71200400001)(86362001)(38070700009)(55016003)(52536014)(76116006)(66946007)(4326008)(8936002)(8676002)(41300700001)(83380400001)(38100700002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXNvS3l2TEdPSE1lU0VNT3Bud0Zoa1lmZEJEVFZlL21ZdGl6MEZiRjhzTDVH?=
 =?utf-8?B?Mk4vaER0d094VkliS0dqb1NSRmcvZnJlMTN1N2lOK3BGYVFxZkhnODNrdXlO?=
 =?utf-8?B?WFgyV3pxbUhMZ2ZNZWtqM21aNmdxYzRMOWJTQnBjcG04ZDV0ek1GUVlqSDVI?=
 =?utf-8?B?ekxJdmpGVzd5MVJpWUx1c2k2Yms2UWxNZlZmd3lFNDMwU2lTeGNNeVlBMUtB?=
 =?utf-8?B?Q2thdG5FWEZVR0h2VGlZY2pTcFNpWUo5YlFBNzNwRENQNVpIa095cG1TMEdL?=
 =?utf-8?B?M1NHTmpyYVhFSUdNV1Vuc2YrSURqV3dYc0lqVHNaZi9qRkx0dXkyWFY3dWhj?=
 =?utf-8?B?bWcreWJBYWJTZE1KcnNFWWdST3dGaUp3VkQzSnQvMDBQWmZKYXI0SXp6T3Rh?=
 =?utf-8?B?SFlkQmNMcFYzMldxb25WTE44dmJJbGVjZ3BqL1hLNFJoalhCVVdJL1hGalJu?=
 =?utf-8?B?dzRKNExmVGgxak5yNzhteDdsL2hnQWExeTh0ZnJZR0J0WFVKVzNBSUJKNHBB?=
 =?utf-8?B?SVZKTzR5V25xUDF3cjhqeDk5ZHVMdzlHSnM2MStZS2cvOWM1bVB0ZWRzcjY4?=
 =?utf-8?B?V2RUL3h2L2UvdHNBeWNYUmY3bkc1ZEJITzViekdoSmxSelBSQldnQWMzZEZH?=
 =?utf-8?B?eUFOcE1wQzFzLzJmTVhKa3ptblpxcG5Pc0hUc29VREhQRkh3emF0bmduUlcx?=
 =?utf-8?B?RzhUZW9YenhvcjR1TXF4VTd6S2ZRWFdBSElocm5SdE51NURWbWVYWGE0Wm8z?=
 =?utf-8?B?Rm5TYnhQR1hRNFhEWWRoeGlwcmJObm9JSDY2OHBoMThhSWNWMmYzUmE4TVBU?=
 =?utf-8?B?WmNlTi9UU2VoU3dLMDJqVThiYXpWdWxGcHdYN21TSEJ5UjFyZ0RQMWdwemZj?=
 =?utf-8?B?RDlhSTJhcjFQNk4xSGxRSkVUM0NVWGxDMVRnMVM3N0FiSGhObmlscHhiK080?=
 =?utf-8?B?dkJBNjlDaVRwSVVEcHVwclJHNlo0ZHpVa1VHeTBwczZYWHVUWFFCbkcvMW9L?=
 =?utf-8?B?ZEhrNGhxVzRZV2J2VENqMVpMR0lSWEduLzdXMGdoaElsSk5seXAwSGw3cE0z?=
 =?utf-8?B?WmVVSUZrWkVyTk9zYmt2UFd5Qm1QdlZOekpNeWt4UXduem1NakhOSXBxZUZ4?=
 =?utf-8?B?Rk5CellQLzAxc3Q2N0VnNkcxcUtqMHFxK0RWVkl4N0hhdnZzc0F4bk5SYTBU?=
 =?utf-8?B?N3UxSHZ5OVFSc0RwV0Nvb0pKTkNDdDg0ZDQ5dlBuWndtbWpYU3E2U3NnaEs1?=
 =?utf-8?B?TWgzQ0RaOU0vSit6UWh6THlEOFRrUGNtU2M5QlFTcnRKVUNzZFl4dEZQVVJk?=
 =?utf-8?B?N0lxQ3VKbUxsZmN1UVh0S3BGK0RXMXExWnlsWmM3Z3p1NjBCcnVRbDlpTWty?=
 =?utf-8?B?ZTljY2xGTDNXMTBKUGRRMURyTkwxOHNmeUxOditydmZjeWdZaWMrL3Q4UGw0?=
 =?utf-8?B?M004YmJrK3doZnRvREsrRVFGdmJhWnQ5VzdrN1N3cXVjZktVRTRrVkIwK3JI?=
 =?utf-8?B?Z3NYbDRRdlNqUFhvZEQwL29Ta1pZYmY3Q2NHQXBIRDlOdDMwUzRwTzh2NDd1?=
 =?utf-8?B?MkpNNGx2c1pjc2E1dHp1Y1BXR2ZyYnZYOWtyc202NjhSbjdPMmZsTUxiREl6?=
 =?utf-8?B?Q1RncndSbzFYcFhDSUZHblp2VVZtRmJZL29rbmhYUEpvNTZlTGNJQjhNS1hP?=
 =?utf-8?B?eStSWHBpNzd4cjhZNm9sa2dRZ0NEUHZFRjdSNzJSSWJiTjVhSnk4NjFIUnB6?=
 =?utf-8?B?QW1VZEplRzBESEwvZXFLRENSUk9iSjJCdnpBNi9qdTVNeStyTUkyaVQ1RWY5?=
 =?utf-8?B?Vk9qUXBzb0JIdUVvMlVOMlI4UW1VWjEwVGJHdkV5RHlWN3I2UVhFeFFLZnJs?=
 =?utf-8?B?QzNTazYwWVVReEcyWUNwRURubzVXUmRzM1RNckd6N0RVbEEzaFgxc3RHaFJH?=
 =?utf-8?B?aU5uRFFNaFl3VGhxNm9XSC9RWlV2Q1FBQUEvMWYvbG02c05ad0h4RWViWHlw?=
 =?utf-8?B?TS9UTXROU0t4T3h0UnFpZlJTSUsxWUxqRGhHdmpYUTU3UmJ4M3pTSHJ5V0c2?=
 =?utf-8?B?bzg3TXh5bjRaNzc1ZlE1eTJkakZyZUlOUm9sb2poc0dNanVZdWV1QkNaV0lF?=
 =?utf-8?B?emZYckVHRjVXd2tFVTRlRzZPNVVCVXBEcFlodGVwQ2ppVVJZNGRVS3RYT2Fo?=
 =?utf-8?Q?dnXHK2W/WjLGYePZAF5pcG0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 977f7adb-0c1c-4624-d163-08dbfcb2fe0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 14:43:09.9465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fj3QfRqH3gbZDv49frMZNsefTIekxvaSAzkkyMwj8TtTKMuUMEqJhjOuQfTltzbG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8722
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fO40OFU3nt7HsMAnNiV/OleCdpCf0yAWF9c//gUvccg=;
 b=KmdmJ5MecZf/AxQXFuYuNgZwQulLJcGMD4h/wC7vaIprXOCuHX/8/vFqdNTuXuIAoygz3ufG5IPN3NL3Wk+vvBZtDUycqaNzqZKz3rfHPKT1KRVAoO+DFuKBGWI6WYPCDX/u4DDkHbH+axlfCQGaJ4pMlmLOuGUbRT+ZF4qawYU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=KmdmJ5Me
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

SGVsbG8gVGhvbWFzLA0KDQo+IChJdCB3b3VsZCBiZSBnb29kIGlmIHlvdSBjb3VsZCBjb25maWd1
cmUgeW91ciBlLW1haWwgY2xpZW50IHRvIHdyYXAgbGluZXMpLg0KDQpJIGFwb2xvZ2l6ZSBmb3Ig
dGhpcy4gIE91dGxvb2sgaXMgYnkgZmFyIHRoZSBtb3N0IHVuZnJpZW5kbHkNCmUtbWFpbCBjbGll
bnQgZm9yIHdyYXBwaW5nIGxpbmVzLg0KDQpTb21ldGltZXMgaXMgd29ya3MgYXV0b21hdGljYWxs
eSBhbmQgc29tZXRpbWVzIG5vdCwNCmFuZCBJIGhhdmUgbm90IGZpZ3VyZWQgb3V0IGhvdyB0byBn
ZXQgaXQgdG8gYmUgc3lzdGVtYXRpYy4NCg0KPiA+IFRoaW5nIGlzIHlvdSB3aWxsIGhhdmUgdG8g
ZXhwbGFpbiB2ZXJ5IGNsZWFybHkgd2hhdCB3ZSBuZWVkIGENCj4gPiBkaWZmZXJlbnQgdmFsdWUs
IGFuZCBJJ20gbm90IHN1cmUgd2UgaGF2ZSBzdWNoIGEgY2xlYXIgZXhwbGFuYXRpb24NCj4gPiAo
YXQgbGVhc3QgSSBkb24ndCBoYXZlIGl0KS4gIA0KPiANCj4gVGhlIGNsZWFyIGV4cGxhbmF0aW9u
IGlzIHRoYXQgZ2NjIGRvZXMgbm90IGZpbmQgbmV3bGliIGluIHRoZSBzeXNyb290DQo+IGRpcmVj
dG9yeSB3aXRob3V0IHRoaXMgY2hhbmdlLiAgSSBkb27igJl0IGtub3cgaG93IGl0IHdvcmtzIHdp
dGggYQ0KPiBzeXNyb290IGFzIGN1cnJlbnRseSB3cml0dGVuLg0KDQo+IFdlbGwsIGJ1dCBpdCdz
IGxpa2UgdGhhdCBpbiBuZXdsaWIsIGFuZCBpdCdzIGJlZW4gbGlrZSB0aGF0IGZvciB5ZWFycywN
Cj4gc28gaXQgbXVzdCB3b3JrIGZvciBvdGhlcnMuIEZvciBleGFtcGxlLCBDcm9zc3Rvb2wtTkcg
ZG9lcyBub3Qgc2VlbSB0bw0KPiBiZSBwYXRjaGluZyBuZXdsaWIgb24gdGhpcyBhc3BlY3QsIHll
dCBpdCBpcyBhYmxlIHRvIGdlbmVyYXRlDQo+IGZ1bmN0aW9uYWwgYmFyZS1tZXRhbCB0b29sY2hh
aW5zLCBzb21laG93Lg0KDQpEb2VzIHRoZSBjcm9zc3Rvb2wtbmcgdXNlIGEgc3lzcm9vdD8gIEkg
YmVsaWV2ZSB0aGUgaXNzdWUgaXMgcmVsYXRlZCB0bw0Kc3lzcm9vdCBzcGVjaWZpY2FsbHkuICBJ
IGRpZCBub3QgZW5jb3VudGVyIHRoZSBpc3N1ZSB1bnRpbCBzd2l0Y2hpbmcgdG8NCmEgc3lzcm9v
dCBpbnN0YWxsIGRpcmVjdG9yeS4NCg0KPiA+PiBJZiB0aGVyZSBpcyBhIHJlYXNvbiwgcGVyaGFw
cyB0aGV5IGNhbiBoZWxwIHVzIHdpdGggaW1wbGVtZW50aW5nIGENCj4gPj4gY29uZmlndXJhYmxl
IHNvbHV0aW9uLCBhcyB5b3Ugc3VnZ2VzdC4gIEluIGFueSBjYXNlLCBJIHRoaW5rDQo+ID4+IHdv
cmtpbmcgdG8gdXBzdHJlYW0gYSBwcm9wZXIgc29sdXRpb24gaXMgc3RpbGwgYmV0dGVyIHRoYW4g
bXkNCj4gPj4gZml4dXAgc29sdXRpb24uIEkgb25seSBpbXBsZW1lbnRlZCB0aGUgZml4dXAgc29s
dXRpb24gYXMgaXQgd2FzDQo+ID4+IHF1aWNrZXIgdGhhbiBzcGVuZGluZyBtYW55IGhvdXJzIGxl
YXJuaW5nIHRoZSBuZXdsaWIgY29uZmlndXJlDQo+ID4+IHNjcmlwdC4gIE5vdyB0aGF0IHlvdSBo
YXZlIGZvdW5kIHRoZSByb290IG9mIHRoZSBwcm9ibGVtLCBJIHRoaW5rDQo+ID4+IHBhdGNoaW5n
IGl0IHVwc3RyZWFtIGlzIHRoZSBiZXN0IG9wdGlvbi4gIA0KPiA+IA0KPiA+IE1hbnkgaG91cnMg
dG8gYWRkIGEgLS13aXRoLW9wdGlvbj8gSXQgc2hvdWxkIHRha2UgMTAgbWludXRlcyBvciBzby4N
Cj4gDQo+IDEwIG1pbnV0ZXMgbm93IHRoYXQgd2Uga25vdyBleGFjdGx5IHdoZXJlIHRoZSBpc3N1
ZSBpcyBjb21pbmcgZnJvbS4NCj4gTXkgY29tbWVudCBhYm91dCBtYW55IGhvdXJzIHdhcyBiYXNl
ZCBvbiBub3Qga25vd2luZyBhbnkgcGF0Y2gNCj4gYWxyZWFkeSBleGlzdGVkLiAgQ3JlYXRpbmcg
YSBwYXRjaCB0byB0aGUgY29uZmlndXJlIHNjcmlwdCBmcm9tDQo+IHNjcmF0Y2ggd291bGQgaGF2
ZSB0YWtlbiBtZSBhIGZldyBob3Vycy4gIFRoaXMgaXMgd2h5IEkgZGlkIHRoZSBmaXgNCj4gdXAu
DQoNCj4gSSdtIG5vdCBzdXJlIHdlJ3JlIHRhbGtpbmcgYWJvdXQgdGhlIHNhbWUgdGhpbmcuIEkn
bSBub3QgdGFsa2luZyBhYm91dA0KPiB0aGUgdGltZSBuZWVkZWQgdG8gZmluZCB0aGUgcm9vdCBj
YXVzZSBvZiB0aGUgaXNzdWUsIGJ1dCByYXRoZXIgdGhlDQo+IHRpbWUgdG8gd3JpdGUgYSBwYXRj
aCB0aGF0IGFjdHVhbGx5IGhhcyBhIGNoYW5jZSB0byBiZSBhY2NlcHRlZA0KPiB1cHN0cmVhbS4g
VGhlIHBhdGNoIHRoYXQgeW91IGhhdmUgZm9yIG5vdyBoYXMgYWJzb2x1dGVseSAwIGNoYW5jZXMg
b2YNCj4gYmVpbmcgYWNjZXB0ZWQgdXBzdHJlYW0sIGFzIGl0IGJyZWFrcyBleGlzdGluZyBiZWhh
dmlvciB0aGF0IHByZXN1bWFibHkNCj4gd29ya3MgZm9yIHVzZXJzIHRvZGF5Lg0KDQpZZXMsIHRo
aXMgaXMgd2hhdCBJIG1lYW50IGJ5IG15IHByZXZpb3VzIGNvbW1lbnQuICBJIHNhdw0Kd2Ugd2Vy
ZSB0YWxraW5nIGFib3V0IHR3byBkaWZmZXJlbnQgdGhpbmdzLg0KDQpCeSB0aGUgd2F5LCBoYXZl
IHlvdSB0ZXN0ZWQgeW91ciB2ZXJzaW9uIG9mIHRoZSBwYXRjaCBzZXQNCndpdGggdGhlIG1pY3Jv
YmxhemVlbC14aWxpbngtZWxmIHRhcmdldD8gIEkgY2Fubm90IGdldCB0aGUNCmdjYy1iYXJlLW1l
dGFsIHBhY2thZ2UgdG8gYnVpbGQgdXNpbmcgeW91ciB2ZXJzaW9uIG9mIHRoZQ0KcGF0Y2ggc2V0
Lg0KDQpDb3VsZCB5b3UgaGF2ZSBhIGxvb2sgYXQgdGhpcyBvbiB5b3VyIGVuZD8NCg0KQmVzdCBy
ZWdhcmRzLA0KTmVhbCBGcmFnZXINCkFNRA0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
