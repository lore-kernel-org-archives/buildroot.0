Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6321FC4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 07:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E786380FAA;
	Tue, 20 Dec 2022 07:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E786380FAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uFKyOiY-nFPY; Tue, 20 Dec 2022 07:54:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E79780F48;
	Tue, 20 Dec 2022 07:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E79780F48
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D8061BF300
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 07:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3256780BB0
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 07:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3256780BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VHPPpEa7uOje for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 07:54:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BC8181919
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BC8181919
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 07:54:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEQDmtRuY7RzNvxAh89V0x6UDSNKR9fyuBeWJlc2OnJe3cxNgBcyKUCm/Q3gDvsRHe1m+uM4008uE4wBCL7TJGCaLDDAXwXePBDhROAl5DkNRH2pby5O/Ll3zQ43ECPnGKZgLyM5s0JVSc4GK3+eTDa+d+w42EVp6H8mT7zznblkLqTG6xcT+XWNc85usdMOJu0WGPHiVBR+xszi4OolDx4rMCWaHZ2T8JE5YLSw/br2sibyFL9fTbf1X8VZDi8dxRh1z8DM7sT28NnsOMZEF6Gh/KvgsTIE7aoaumCiEcZTr9n2lhi5LlAcp6/2MIYVpvDSjp7WFNP1KnMhB0oejw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrN+rX1wKuceZG7SkwoAKMp+PM5QD9x6fiG76c9tgmU=;
 b=LkCa+9Gy25oSsW+7ITu2uCmOKj5wENGn4bhR5L5n63Fe2Ympph/H/WWrAr1qFrv5N3E+k/rhXdPuvTy+hgRBdZPIAfkBXqFrtZbCS8FFHJzBEA6hs85ljqqKrdqN4mv9Oncs3BYpatHWh4ZRxGesS227hvQipYGKJF6W3TyefHCmfFJz9dfxwnIs6tLn393rBpCD5zkXkc/ovOc68pEAbITg5AHxy/9wW4Cpr+qQHZed7bv1tW6/fbIAzdj2470KUlXIXr9ghUSQ6YySSz6+GKnCLKiS9ex8LV89wEJGmSOlx2rQ3WU0OoGC3QPLt0mCtwiwGur3i2pHoCa3xBHHnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ0PR12MB6967.namprd12.prod.outlook.com (2603:10b6:a03:44b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 07:54:05 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 07:54:05 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig: use
 CONFIG_MULTI_DTB_FIT work around
Thread-Index: AQHZETVPblOC0EkMJ02+6LohnRI2Aa52bDUAgAABxoA=
Date: Tue, 20 Dec 2022 07:54:04 +0000
Message-ID: <38D3027F-389D-47B6-B030-1C918282969D@amd.com>
References: <20221220084730.5acd395d@booty>
In-Reply-To: <20221220084730.5acd395d@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ0PR12MB6967:EE_
x-ms-office365-filtering-correlation-id: 79c39877-17bf-4c21-a9b7-08dae25f5dd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AWMEXz5ea4ClxwKNZ/h8Ip8/ZCqoxt2fZD+scrJC4yf7I+dj5dpxKpZ8ACcW7/+VmkB/T4bNzvC4Vs6s6n5ud+KNy7sR8xa7aTiODHCTVJh+k5YCbcARG0no3XhyA8b/ZiosdU/0tFQYsAGFJBFs26ejl4weNplOihHDdDJhj811w9Hc1rLTm+N735qIWg7sQT+3+NeQGpw5a5CVyWEWYzEl+3BIRsnF6UOkcZ6le4QLhd5nS7QuLCb1baP0Bltfi+5eMVAIOsGMRcdFus7MqfcO3mLWn5b8KrIz0KG2pCM4ExPurVYxd39HSBHGrIq+ZhdBHuN1iIHKDFKKs7FdLLbLgffotHy3GswXmX3CIxlE3w3feYToPa1EKsJzE/DPsMh/OpX099yNtH+v7svuOMepW7U6SHaTsXDW5Hvanfy6nwVvSVi7mvdYVjs5vHqJEMWV+3pcInqP35sn1ECJqJY2ZPm4cDZQZEwmXgx41XZusv0Q0cSy52GmY4i0lfFHZGx/ryB2pzmdyEF3fiYYMBMbYKdhettm3WUJfqSU3S09ggoO3+bbpxPCldxWNoG2MYnGKCql59KAJ3qj7bYyNVESUbJeX7XuEOSgo+Q72R18OmP1tHR5UGpbnddZmzadY3Et1oAGIi9z0+b1IBVRk4cuSM4d2KMjB0+I4U/WNS6a5rktUisgGwdvO9+ji3zwEfpeW19UL1KYS70grflhNvBJr35yJ2lpXfv3HAMZa+hB1xR2I1AS9l0nB0z6nXuR3tI+ZcFBYwu31/2JwO7P0A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(451199015)(6916009)(36756003)(54906003)(2906002)(66574015)(38070700005)(316002)(83380400001)(478600001)(6486002)(33656002)(6506007)(966005)(86362001)(2616005)(6512007)(186003)(71200400001)(122000001)(38100700002)(41300700001)(8936002)(76116006)(91956017)(5660300002)(66946007)(66446008)(64756008)(66476007)(4326008)(66556008)(8676002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TS92czB3Nk5WOVBwaGF6clYxOGJ3bGFLQzM1a3I5dDFYWEd1M2NLaUJzNGgy?=
 =?utf-8?B?SE9TQWxzb2oxUnNUVWxRUTRlemJzd3JLd0RPaE5EMytXU3h1UTAxbk5JS29n?=
 =?utf-8?B?TGUvWHFRVldvMVloS2V1ekxhUDFjZmZPa21MOUF1SnhCMk5MelhDL25IN1BP?=
 =?utf-8?B?U0ltRzRvOFlhalBMMVEzRXZJZWk2YlA0d2lnUEpyR3F0Rld0NGZNa2lBNGo4?=
 =?utf-8?B?K284N3RuWnhDU2VEYzV4RzB1MW9TcmhuTEoxeFJSVjdma0RuOWs4S05vMUhp?=
 =?utf-8?B?VVJuNTVLT3N6R1ZhVzFxRnllVlJ2Z3NHZ2RMNTc2K3hSWHZyZFdPSytYdFg0?=
 =?utf-8?B?RVhDdHFVcHVKK0pXU29Db1JQdFVXSnV3VVpaRXp6Rk1tSTRBQXJMTjlUNDhY?=
 =?utf-8?B?TVU2bm5zQ2dnSklrSVVSMzNwNmJqUXlCM0JUdzJOaEhRQmtOdDhuMkdRZFlB?=
 =?utf-8?B?MWpQRVR5L3NLUVdENmY3ZUszWHplZnhPTWtqVllaa2JldVRUbzNCcXg5YWd6?=
 =?utf-8?B?UHJkWkdRNzh4OTRwbGZmT1g0Tkp1bE1HMTVRNmdobk9kbG5oemVCRTZJYzg0?=
 =?utf-8?B?UmtFNHZ5QkJ2amNscWVoZWMvVE5rdlJOS1JGNlpWT3BDWUxadEVzNXZhZFdD?=
 =?utf-8?B?eTdTNWJsQ2cwVk10ZzhOdjIzczhIY0NlSjViQ0svQithbmtoYjV4YzhqMXF1?=
 =?utf-8?B?RXNsT1RONkVwZzNuRUR0OHhGQ3BZYzNPelpSOFM2bmpTZCtNVzZkRk5neDNH?=
 =?utf-8?B?K0RTaURpOGhUZWpIT0twTjJ5S2tLckExM0FmR01RYmxaTXd2aVFyeVpaN1hv?=
 =?utf-8?B?QTFoOVRGUHVBQUttRTdwNVc3V3F3YXV1a3JBdld6K3JUVUtsZGxQd2hHUE5v?=
 =?utf-8?B?WmNXRjFtK2pyYTZKR0VFblk1Q0ZXOFZJOW5SLzNuSjM2Mjk5Qzd5RStubUNO?=
 =?utf-8?B?WklxOHJsVHlvNFV0MTErMmRXZUVHTXZyNUhJWnlFRlFPZ3o2Y3ZNbnJaVGFG?=
 =?utf-8?B?WDNPNSs3bnAwMmF0K3l1bHozODdSb1VmbDFybjVLbGZLYTFIblZtQjcrbEx4?=
 =?utf-8?B?R3JjaXFEZFdNT2VOeUtFWER1WGQ4djlKWlVBL1BvRXZxa2lmS0NKSnZ4Yzdh?=
 =?utf-8?B?UExKVy9CRU1oNXM2R0dqd0VnYWFqR0Nhb1pOK1NldVNpZHo2RmN6TUpjNlEw?=
 =?utf-8?B?REpoNWVSUWE0RUhQU3BrRUFXdTZ5VHdDWCs3NURCVVJQTFZLeTA1dnF2akVw?=
 =?utf-8?B?MmhtVEQzS0Q2dllRcHU0Zi82Vy9oNHUxSXExZmNEcXNwWTNYMlE4dngyNW5v?=
 =?utf-8?B?ZG5ycnlUZ3RNdGxVcmVOaDRpL0tZT2NzY0pUQ2F4eUM0WW44aE5YbE12TzdG?=
 =?utf-8?B?MUppOWNZOHAxRG1OYU16cUZQdDdBLzlXY3RGTFVKZXl5RWJrZW55aHNEYzRS?=
 =?utf-8?B?MTB3bS9wdVUwUE9MdVh0aWxETnZSQk52WFRjZHZ0aHNnTStGa1ZNcCsvemJk?=
 =?utf-8?B?UU1qNEdpT0tOOVpZcEhYY2U2ekJTY0NNZDl3TVNZbXlUV2c0S2w1L2hldUx4?=
 =?utf-8?B?dis0TDgwMUlzanZEN2dUdjA1Z3B0emFYSzNOSkRwR3lEbm5DT2pmY3k4QnVv?=
 =?utf-8?B?YUhhOWJmWmorL3FvQ2NLWlRnR05lNE4wWktNbVdmalByQVRERUV2VHhCY0hW?=
 =?utf-8?B?eTJOQ1pWTVgzR0M5R2ZYZTFYcHZwTWF6Z1hGdVVNd2REa1dVTmhkeXdqU2xF?=
 =?utf-8?B?Z0IvNkwrRm1iSW9rekJlZ2syREcxYzV5eXFiUXk5ekEyN3I4QXlXU2ZvNDhJ?=
 =?utf-8?B?MkVTT3lTWFlXc0I5MkVjNjhSR0dkOFYraGZWZERVSm1wR0Yrc296MmJrbHpo?=
 =?utf-8?B?Rnp3NzVSVWZmV3FhS21hRkRWYXFUMFZOL1ZVWmVCMWdzb1NWQ2JHL1NSSDZj?=
 =?utf-8?B?QStCRTNHNnZpNXBqdnpVZmxQY3BpbVVJQ0JWc25rRFVLTDlwSXJJZHZnbG9m?=
 =?utf-8?B?eFdiNGpLeEVuWTljYTRmcXRlS3c1VndPN3A2NlBuZVJoN2dPYzl2VFREaWI4?=
 =?utf-8?B?aktFUHBwUFZaTVZHS1JwMUFtOTYwRWNqL3p1ZUNuVnlpRzkrVlRiLzBoM0JS?=
 =?utf-8?B?bUp3aVZkTW5HejJUa1ZzZjZJcS9xbkd4Vk9nRjcwcDRpWE1hcVozbEhYamtZ?=
 =?utf-8?Q?dw2s7JJByiEWqke1HoKz1GSPq0aMIHIIzAMwY6O7tpRW?=
Content-ID: <7C5C1C718E71014DB1B92252A57B2296@amdcloud.onmicrosoft.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c39877-17bf-4c21-a9b7-08dae25f5dd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2022 07:54:04.9826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1gSUyc1CjGd2B6DrdrtLR0pa5huRthjJgFfIr8PnP42Xn7TX7UN+ZP7zTYWDgEEc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6967
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrN+rX1wKuceZG7SkwoAKMp+PM5QD9x6fiG76c9tgmU=;
 b=HHDgLt50Jocr3il6ctKSl65xEzYm3ecHtmjgRcGnitJRjkbzCpyip5fVaIyuh0yV6Ljquy+B8EBTFZNiBC0PPZvZf3yeDE0dgkuf1IfBTKlRYyzXZiYrSko5iTbf2c5MMW/Nq/YIAUadNbXCIMx5a+WkIsBxecJx9w/pUE0YkaE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=HHDgLt50
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig:
 use CONFIG_MULTI_DTB_FIT work around
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

SGkgTHVjYSwNCg0KDQo+IExlIDIwIGTDqWMuIDIwMjIgw6AgMDg6NDcsIEx1Y2EgQ2VyZXNvbGkg
PGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoNCj4gDQo+IO+7v0hlbGxvIE5l
YWwsDQo+IA0KPj4gT24gRnJpLCAxNiBEZWMgMjAyMiAxMDowMDo0NCArMDAwMA0KPj4gTmVhbCBG
cmFnZXIgPG5lYWwuZnJhZ2VyQGFtZC5jb20+IHdyb3RlOg0KPj4gDQo+PiBDaGFuZ2Ugd29yayBh
cm91bmQgZm9yIGt2MjYwIHUtYm9vdC5pdGIuIFVzZXMgQ09ORklHX01VTFRJX0RUQl9GSVQgZm9y
IGZpdC1kdGIuYmxvYiBnZW5lcmF0aW9uLg0KPj4gQWRkcyBhIGRlbGF5IGJldHdlZW4gZml0LWR0
Yi5ibG9iIGdlbmVyYXRpb24gYW5kIGJ1aWxkaW5nIHRoZSB1LWJvb3QuaXRiIGR1ZSB0byBhIGJ1
aWxkIGlzc3VlDQo+PiB3aGVuIHVzaW5nIHRoZSBidWlsZHJvb3QgY29tcGlsZXIuDQo+PiANCj4+
IFRoaXMgd29yayBhcm91bmQgd2lsbCBldmVudHVhbGx5IGJlIHJlcGxhY2VkIHdoZW4gWGlsaW54
IHUtYm9vdCBtaWdyYXRlcyB0byBiaW5tYW4uDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IE5lYWwg
RnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQuY29tPg0KPj4gLS0tDQo+PiBib2FyZC96eW5xbXAva3Jp
YS9rdjI2MC9rdjI2MC5zaCAgICAgICAgICAgICAgfCAgMiArLQ0KPj4gLi4uaWxlLWFkZC1kZWxh
eS1mb3ItYnVpbGRyb290LWNvbXBpbGVyLnBhdGNoIHwgMzMgKysrKysrKysrKysrKysrKysrKw0K
Pj4gYm9hcmQvenlucW1wL2tyaWEvdWJvb3QuZnJhZ21lbnQgICAgICAgICAgICAgIHwgIDEgKw0K
Pj4gY29uZmlncy96eW5xbXBfa3JpYV9rdjI2MF9kZWZjb25maWcgICAgICAgICAgIHwgIDEgKw0K
Pj4gNCBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+PiBj
cmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvenlucW1wL2tyaWEvcGF0Y2hlcy91Ym9vdC92MS0wMDAx
LU1ha2VmaWxlLWFkZC1kZWxheS1mb3ItYnVpbGRyb290LWNvbXBpbGVyLnBhdGNoDQo+PiANCj4+
IGRpZmYgLS1naXQgYS9ib2FyZC96eW5xbXAva3JpYS9rdjI2MC9rdjI2MC5zaCBiL2JvYXJkL3p5
bnFtcC9rcmlhL2t2MjYwL2t2MjYwLnNoDQo+PiBpbmRleCBlODkxODUyMDA5Li5lMzQ2N2YzMDY4
IDEwMDc1NQ0KPj4gLS0tIGEvYm9hcmQvenlucW1wL2tyaWEva3YyNjAva3YyNjAuc2gNCj4+ICsr
KyBiL2JvYXJkL3p5bnFtcC9rcmlhL2t2MjYwL2t2MjYwLnNoDQo+PiBAQCAtOCw1ICs4LDUgQEAN
Cj4+IA0KPj4gVUJPT1RfRElSPSQ0DQo+PiANCj4+IC1mZHRvdmVybGF5IC1vICR7VUJPT1RfRElS
fS9hcmNoL2FybS9kdHMvenlucW1wLXNtay1rMjYtcmV2QS5kdGIgLWkgJHtVQk9PVF9ESVJ9L2Fy
Y2gvYXJtL2R0cy96eW5xbXAtc21rLWsyNi1yZXZBLmR0YiAke1VCT09UX0RJUn0vYXJjaC9hcm0v
ZHRzL3p5bnFtcC1zY2sta3YtZy1yZXZCLmR0Ym8NCj4+ICtmZHRvdmVybGF5IC1vICR7VUJPT1Rf
RElSfS9maXQtZHRiLmJsb2IgLWkgJHtVQk9PVF9ESVJ9L2FyY2gvYXJtL2R0cy96eW5xbXAtc21r
LWsyNi1yZXZBLmR0YiAke1VCT09UX0RJUn0vYXJjaC9hcm0vZHRzL3p5bnFtcC1zY2sta3YtZy1y
ZXZCLmR0Ym8NCj4+ICR7VUJPT1RfRElSfS90b29scy9ta2ltYWdlIC1FIC1mICR7VUJPT1RfRElS
fS91LWJvb3QuaXRzIC1CIDB4OCAke0JJTkFSSUVTX0RJUn0vdS1ib290Lml0Yg0KPj4gZGlmZiAt
LWdpdCBhL2JvYXJkL3p5bnFtcC9rcmlhL3BhdGNoZXMvdWJvb3QvdjEtMDAwMS1NYWtlZmlsZS1h
ZGQtZGVsYXktZm9yLWJ1aWxkcm9vdC1jb21waWxlci5wYXRjaCBiL2JvYXJkL3p5bnFtcC9rcmlh
L3BhdGNoZXMvdWJvb3QvdjEtMDAwMS1NYWtlZmlsZS1hZGQtZGVsYXktZm9yLWJ1aWxkcm9vdC1j
b21waWxlci5wYXRjaA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAw
MDAuLjM5MWZhODYxYmQNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL2JvYXJkL3p5bnFtcC9r
cmlhL3BhdGNoZXMvdWJvb3QvdjEtMDAwMS1NYWtlZmlsZS1hZGQtZGVsYXktZm9yLWJ1aWxkcm9v
dC1jb21waWxlci5wYXRjaA0KPj4gQEAgLTAsMCArMSwzMyBAQA0KPj4gK0Zyb20gNTgyYjUyYmVm
NjkyMTlkZjY3OGVkMDQ3NzFlYjY0MzExN2NkMDk0YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEN
Cj4+ICtGcm9tOiBOZWFsIEZyYWdlciA8bmVhbC5mcmFnZXJAYW1kLmNvbT4NCj4+ICtEYXRlOiBG
cmksIDE2IERlYyAyMDIyIDA4OjM1OjQxICswMDAwDQo+PiArU3ViamVjdDogW1BBVENIIHYxIDEv
MV0gTWFrZWZpbGU6IGFkZCBkZWxheSBmb3IgYnVpbGRyb290IGNvbXBpbGVyDQo+PiArDQo+PiAr
V2hlbiB1c2luZyB0aGUgYnVpbGRyb290IGNvbXBpbGVyLCBpdCBidWlsZHMgdGhlIHUtYm9vdC5p
dGIgaW1tZWRpYXRlbHkNCj4+ICthZnRlciBidWlsZGluZyB0aGUgZml0LWR0Yi5ibG9iLiAgVGhp
cyBjYXVzZXMgYSBidWlsZCBmYWlsdXJlIHdoZW4gdXNpbmcNCj4+ICt0aGUgQ09ORklHX01VTFRJ
X0RUQl9GSVQgYnVpbGQgY29uZmlndXJhdGlvbi4gIFRoaXMgcGF0Y2ggZm9yY2VzIGEgbWluaW1h
bA0KPj4gK2RlbGF5IGJlZm9yZSBidWlsZGluZyB0aGUgdS1ib290Lml0YiB3aGljaCB3b3JrcyBh
cm91bmQgdGhlIHByb2JsZW0uDQo+PiArDQo+PiArVGhpcyBwYXRjaCBoYXMgbm90IGJlZW4gc3Vi
bWl0dGVkIHRvIHUtYm9vdCBtYWlubGluZSBhcyBpdCBpcyBhIHdvcmsgYXJvdW5kDQo+PiArYW5k
IG5vdCBhIHByb3BlciBzb2x1dGlvbi4NCj4+ICsNCj4+ICtTaWduZWQtb2ZmLWJ5OiBOZWFsIEZy
YWdlciA8bmVhbC5mcmFnZXJAYW1kLmNvbT4NCj4+ICstLS0NCj4+ICsgTWFrZWZpbGUgfCAxICsN
Cj4+ICsgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+PiArDQo+PiArZGlmZiAtLWdp
dCBhL01ha2VmaWxlIGIvTWFrZWZpbGUNCj4+ICtpbmRleCBiOTZlMmZmYTE1Li4wZDNlMzM3MDRk
IDEwMDY0NA0KPj4gKy0tLSBhL01ha2VmaWxlDQo+PiArKysrIGIvTWFrZWZpbGUNCj4+ICtAQCAt
MTQyNiw2ICsxNDI2LDcgQEAgaWZkZWYgVV9CT09UX0lUUw0KPj4gKyB1LWJvb3QuaXRiOiB1LWJv
b3Qtbm9kdGIuYmluIFwNCj4+ICsgICAgICAgICQoaWYgJChDT05GSUdfT0ZfU0VQQVJBVEUpJChD
T05GSUdfT0ZfRU1CRUQpJChDT05GSUdfU0FOREJPWCksZHRzL2R0LmR0YikgXA0KPj4gKyAgICAg
ICAgJChVX0JPT1RfSVRTKSBGT1JDRQ0KPj4gKysgICAgc2xlZXAgMQ0KPj4gKyAgICAkKGNhbGwg
aWZfY2hhbmdlZCxta2ZpdGltYWdlKQ0KPj4gKyAgICAkKEJPQVJEX1NJWkVfQ0hFQ0spDQo+PiAr
IGVuZGlmDQo+IA0KPiBJIGRpZG4ndCBzdHVkeSB0aGUgY3VycmVudCBzb3VyY2UgY29kZSB0byB1
bmRlcnN0YW5kIHRoZSBpc3N1ZSwgaG93ZXZlcg0KPiB0aGUgJ3NsZWVwIDEnIGhlcmUgc2VlbXMg
YSBwcmV0dHkgYmFkIGhhY2sgYW5kIG5vdCBuZWNlc3NhcmlseSBzb2x2aW5nDQo+IHRoZSBwcm9i
bGVtIGluIGFsbCBjYXNlcy4NCj4gDQo+IEFzIE1pY2hhbCB3cm90ZSwgZGVwZW5kZW5jaWVzIG11
c3QgYmUgZW5mb3JjZWQgdmlhIG1ha2VmaWxlIHJ1bGVzLiBBbnkNCj4gcmVhc29uIHRoaXMgY2Fu
bm90IGJlIGRvbmUgaW4gdGhpcyBzaXR1YXRpb24/DQo+IA0KDQpVc2luZyB0aGUgWGlsaW54IGNv
bXBpbGVyLCB0aGUgYnVpbGQgb3JkZXIgb2YgdS1ib290IGlzIG5vdCB0aGUgc2FtZSBhcyB3aXRo
IHRoZSBidWlsZHJvb3QgY29tcGlsZXIgYW5kIEkgZG8gbm90IHVuZGVyc3RhbmQgd2h5Lg0KDQpX
aXRoIHRoZSBYaWxpbnggY29tcGlsZXIsIHRoZSBmaXQtZHRiLmJsb2IgaXMgYnVpbHQsIHRoZW4g
dGhlIHNwbCBnZXRzIGJ1aWx0IGFuZCB0aGUgdS1ib290Lml0YiBkb2VzIG5vdCBnZXQgZ2VuZXJh
dGVkIHVudGlsIHRoZSB2ZXJ5IGVuZC4gIFRoYW5rcyB0byB0aGlzIG9yZGVyLCBldmVyeXRoaW5n
IGlzIGZpbmUgd2l0aCB0aGUgWGlsaW54IGNvbXBpbGVyLg0KDQpXaGVuIHVzaW5nIHRoZSBidWls
ZHJvb3QgY29tcGlsZXIsIGl0IGF0dGVtcHRzIHRvIGJ1aWxkIHRoZSB1LWJvb3QuaXRiIGltbWVk
aWF0ZWx5IGFmdGVyIGJ1aWxkaW5nIHRoZSBmaXQtZHRiLmJsb2IuICBUaGlzIHByb2JsZW0gc3Rh
cnRlZCB3aGVuIGJ1aWxkcm9vdCB1cGRhdGVkIHRvIGNvbXBpbGVyIDExLjMgYXMgaXQgd2FzIGJ1
aWxkaW5nIGZpbmUgYmVmb3JlLg0KDQpFdmVuIHRob3VnaCB0aGUgZml0LWR0Yi5ibG9iIGlzIHN0
aWxsIGJ1aWx0IGJlZm9yZSB0aGUgdS1ib290Lml0YiwgdGhlIGJ1aWxkcm9vdCBjb21waWxlciBj
b21wbGFpbnMgdGhhdCB0aGUgZml0LWR0Yi5ibG9iIGRvZXMgbm90IGV4aXN0IHlldCBhbmQgZXJy
b3JzIG91dC4gIFN1YnNlcXVlbnQgYnVpbGRzIHdvcmsganVzdCBmaW5lIGJlY2F1c2UgdGhlIGZp
dC1kdGIuYmxvYiBhbHJlYWR5IGV4aXN0cy4NCg0KQnkgYWRkaW5nIHRoZSDigJxzbGVlcCAx4oCd
LCBpdCBpcyBpbmRlZWQgYSBoYWNrLCBidXQgaXQgZm9yY2VzIHRoZXJlIHRvIGJlIHRpbWUgYmV0
d2VlbiB0aGUgZml0LWR0Yi5ibG9iIGJ1aWxkIGFuZCB0aGUgdS1ib290Lml0YiBidWlsZCB3aGVu
IHVzaW5nIHRoZSBidWlsZHJvb3QgY29tcGlsZXIuICBJdCBpcyBub3QgYSBnb29kIHNvbHV0aW9u
LCBidXQgaXQgc29sdmVzIHRoZSBwcm9ibGVtLg0KDQpJIGFtIGhhcHB5IHRvIHRha2UgYW55IGlk
ZWFzIGZvciBhIGJldHRlciBzb2x1dGlvbiENCg0KPiAtLSANCj4gTHVjYSBDZXJlc29saSwgQm9v
dGxpbg0KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0dHBzOi8v
Ym9vdGxpbi5jb20NCg0KQmVzdCByZWdhcmRzLA0KTmVhbCBGcmFnZXINCkFNRApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
