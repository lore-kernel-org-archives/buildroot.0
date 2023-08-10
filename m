Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E95EC001DB
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 10:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3452B83C29;
	Thu, 10 Aug 2023 10:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3452B83C29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MZTxvWC4TnH1; Thu, 10 Aug 2023 10:46:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4420B83C12;
	Thu, 10 Aug 2023 10:46:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4420B83C12
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E5CED1BF34D
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 10:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE9ED404DD
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 10:46:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE9ED404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BKoPNd7omIqv for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 10:46:34 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CF42400D1
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 10:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CF42400D1
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="228216393"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Aug 2023 03:46:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 10 Aug 2023 03:46:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 10 Aug 2023 03:46:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVuux0VMEeY62fqFW+KSoBhdTHTBGWlyjZliRqpjNNuUENm23Au+RdqASCLmzm4GouwS0T4NPzmrQhxsFUzqtlNvZW0HtxvScSl4mbCn87E4uBCHhp9wZrjqAv1SGvIVlPLLqIyqhBXJk2lxJk6kzwiMXY0qaYwxaxrXTNkXYUW0POwXtxeUp+tM5l3aVQKha4gsArowOmsSxcda6nFNqilVOWSJ4Ak+Qe0F9c1dyev+jMWtzScVzyWj1Hick2rWL4ryg/Bi4kHE83oY+DzCPfSpd9qxHgr/PX4lrZmzHbhEtC9dwwRyaUjoP+cWvT+gM2gMMbt1mYLtAzABJhVlIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxQV6J6ntTsI4Uohwf+kQR0v1hs/u1Z38Yu6d7E6dfk=;
 b=ZpgROKA26bVZydB6ImweGnijbiGDRGUyUOsEc+8oLexz9KykKPwuMt23vNOeWC24gnG3SE8tr6PF/Ux2KsoiK9qGaUgsbFC0ba8VVF05IwrDNpksQB+HWkwaAED0j24++XHDlRDFDHuuALg1cHb/Li9YcTgGMvyGee9H9u6M5U82QBUdVuKERaHWMZ7qHouAoJhjeSZgAhGVtU7W2baJ1NVx7E925B0TOlT3ZaxcsgScaEmp8dvlvrHhH6+Exw3LmJZ11z8Sv9DPZoqvkYny4AAebozuTK47LUOwGYwNH1IvfMI9mVR/lQzkXekurhuZ/PU0WRv+rQKEcwgz4xDA4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 DM8PR11MB5702.namprd11.prod.outlook.com (2603:10b6:8:21::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.30; Thu, 10 Aug 2023 10:46:30 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::2644:bbc4:c4eb:cf6d]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::2644:bbc4:c4eb:cf6d%7]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 10:46:30 +0000
To: <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v3 2/2] configs/microchip_mpfs_icicle: add
 support for Microchip's Icicle Kit
Thread-Index: AQHZtL+rNz3spepjz0usLwXCbpd2eq/hHaqAgAEYkYCAAAVOAIABSs2A
Date: Thu, 10 Aug 2023 10:46:30 +0000
Message-ID: <36d1e8110955931efe354356c9b09c29f332f8fb.camel@microchip.com>
References: <20230712125154.1361000-1-jamie.gibbons@microchip.com>
 <20230712125154.1361000-3-jamie.gibbons@microchip.com>
 <20230808235919.0002f19d@windsurf>
 <40906858eaa11edb306b0f56e425d7b13948e0b9.camel@microchip.com>
 <20230809170230.59759159@windsurf>
In-Reply-To: <20230809170230.59759159@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|DM8PR11MB5702:EE_
x-ms-office365-filtering-correlation-id: 44ada5b1-bc6a-4e3d-aed0-08db998f0e49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GtECvg6h8BJN+/h672mywHG9SPdse9BogjwEnz76dNrK3T+gu0gip2RA4K99F/y5QjuANeyHNmB3xcWDssbPb+Rbw/Do4BP7Cl3Z/O5zO+aI5eRICkTZwLnSsqO6sRSukcwevgXgs4idePq9JWyIqmmYXNtbZwMI1RwnDt26zBV/rgVR22lNecRzaY5+QwJrYvxiWMCm6m4xcNcXtlScEffK/EquQ1CPeCjYPeMXf0ZKV98rlTarbBxFvm+BQ/lEo+ShhYHNkGjLBmpQnVwjX+oXAl540n/UE/RgVJzX2pIwOcuHuwkzqW2Pme8X398OHpB7L282+OR7rVOjsdB/knYZj8vpbOCK4/Rd72JNehmpfladCf9Ab8wuvpS5PzNCzARUU4trd0ADISx0xBnN8eEpd4b1QmE2Bj/ff3iKG1p7quFSxAv6rb+XJYrJKoginm8UpRp0xVUI1elwMGVbSe3IT7I6qHU3a1r70Op9fDKxxsEj/at84r4sMy7q+Pwa6PJh+f1dq6RJeJThyc/Wd6qTFvKKF9mtsD9Z+4TdqieHJXOURG8vxoppbPnbRkX6IxZRIpn5+YK30ilwco6WNIIDyUkgIsyAnmyHb8sCmGg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(136003)(366004)(376002)(1800799006)(186006)(451199021)(122000001)(6916009)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(478600001)(5660300002)(54906003)(71200400001)(91956017)(38100700002)(6486002)(38070700005)(4326008)(316002)(6512007)(966005)(86362001)(8676002)(8936002)(107886003)(41300700001)(26005)(6506007)(2906002)(83380400001)(36756003)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVhXcnVUOTI1SkMvOFBJWS9GdE1WUXp4NTNncmxKREhBZkxrRlY2MS8raGxD?=
 =?utf-8?B?TmYzRC9PVE9Ua2E1MnRlOWltZzg5ZmMwNFNYaU5SOEpId0NZdTR6SFJ3Lzlk?=
 =?utf-8?B?UkphSWZUMVg1aHpVOXhPU2V2MHZZekJoSVBkN3ZFYmpzQXJaU3JudEIzV2x3?=
 =?utf-8?B?VUUwemFuaTBpWHpEYndxK1pGaElqVnA5YndVeE9rRWdzMXV0TUQyMldhRitj?=
 =?utf-8?B?dEFlc2hPQ3Y1SUN4OEZLa1ZJRnZrakN5MFQ1T1dQb3RGR1N6VncvTUs2VktY?=
 =?utf-8?B?NDd1L3VOZ3lVZCs3ZVU1ZGVJaU1kZFdXZ0QzQWRNd2dTOHdZSUswNVhKTU8r?=
 =?utf-8?B?YzF1YVJQNXFYK1UvM253OWw2eGpyeHB5YzVMYW5VY3phRDB2VjYyNmNGVURF?=
 =?utf-8?B?R3ZtaHlpZjJwUmluNmxXZWp2cEt3ODEvQjB6MUFnYmp5V1FIWFY3NmhoVDhk?=
 =?utf-8?B?dUIwRUR0blNzbWNRaWIydE1DTlV2OVpab0lGcU9LejFNUkloQ1pkaXBPYTlx?=
 =?utf-8?B?Ykd0bW1BZEkrZWd2MjhhaGNobnlQNEhrY2xoekE1TUVER3IzV0RoY2JrQXlp?=
 =?utf-8?B?UkJCWUtPbVhTaFVRQ0FGbzlXcmxKNmJWU2ora2xnQUhxSU1kYmdoUjR1V2ZW?=
 =?utf-8?B?dHBHZFIrd0hrejdSbENoM2Y2c1dURm1FUVJWTmF1Rjg2SmxJYWxkcldCWDRz?=
 =?utf-8?B?dlQ1VlZJVVJDWTlGUlN2SE1hWTJDVTNMOTJ1M3pRK1lzTmlqaDNJUDV6YTJt?=
 =?utf-8?B?RXpScjdRcDd6aVc2K3NrQ1dnam5WVThDRENURTMwem9yUUVCOW5BY2VOSVNx?=
 =?utf-8?B?VHdNdnc0dlo0SUlVZlRzMUw4c2NRMFYvekUyTXJONXdDQXdqMVBrZTRmbTdp?=
 =?utf-8?B?YVphZkxyWW11RVZWN3RpZ3pDd1BWc1BVR1o2bTBzQVdNYVVYa2MrVlBMRFlw?=
 =?utf-8?B?SXd5RndELytFRlJ5ZG05dXVyRU5lOEZqSDR1VlVTVFlCazlWc2Y0V29HM1Zx?=
 =?utf-8?B?amthekoxVXJ4TDBPbDZmSy93b1hmNkdOTXNkR2JJMUE4ZXJSN0d0RmYweU45?=
 =?utf-8?B?ZjgxekdYUXlia2lCeCtZOU5JMGdkODZoa1J0bzg4VVRUU3ZjR1dNK3NtTzho?=
 =?utf-8?B?SDZhZXNtR2llNk0rM1puZy8yL2hub3VvU1ZPVmdmdksvL01HSmlZT1l4VzlJ?=
 =?utf-8?B?SzI4bnRJYVFZTjQzMko1aThDMzVqb2ZkcDQ3WXg0QjhxM3l0OWd4eUpBaEUr?=
 =?utf-8?B?eFkzZmpiQ2plcFdnM2V0M2JZVFpQOTF4U1VJVHFSL3FYZjVoc25vcW9sZktV?=
 =?utf-8?B?RGMrOG9CUXBKbkRSTUtvMHJhdzlRd09BcGZpRDNpb2p0TWhEbE1FazRYTTBt?=
 =?utf-8?B?RWdZc1dYckJFM0dJVnNEY05Cd2dueEhwdEtGdDc4NWdvRUJhLzc5dnpnTTF2?=
 =?utf-8?B?enJFY0gwMytJdS9VNFppR2Jmckp0NEtGVEFPZE5INWR2NVcwSlRxVHJUMmFY?=
 =?utf-8?B?MjZKUEFxT0FUdE5ZS2dmVGxaU2xFZTEzNFJJL1g0alFkMzZwbXFjWVkxVGZO?=
 =?utf-8?B?VSt3ZEhERjZ1dkFuWStPL2ZWSWJyWHB3Z0pPN2FoOW1MWXFjVFAxOXJqaTlx?=
 =?utf-8?B?Qkh2YVZzYklWVUs5RUpYcXFaM0JlWllQd3ltZGxxSTVxOFkxSktsaHdhLy9m?=
 =?utf-8?B?M2xtRzNUMlUzeVNaZGxDYk40K05HQU9qSGZsU0lwckZYNG8rcGtjUm5aeEE3?=
 =?utf-8?B?Qi9PaUMreklaenp1N0g0QnI1ZnVtQ3JZY1N0WU1Xbkd3L3B6VStSY05mMitm?=
 =?utf-8?B?U2Vpalc5aHZ6d3dNbnd2aml5N282eFZQQXlEWWUvZk5WazRDVUxUMXdJd21N?=
 =?utf-8?B?VnhwMWhpRS9FSUpQVVl2Yy9HOENlUHcvUEJGakIvZ2xGUytncHA0bCtDTXRk?=
 =?utf-8?B?K2FmYm0zZ0RhVEtMWHRCOXBRU2MyN3dUOHNudy9jbUlETXRPUVh0ZWEwQ1dP?=
 =?utf-8?B?TDBYVDdqeDdBU21YL25pNU5pUlZFc3VFK3hwREtkSjFWODRtaGhUTnROSzFH?=
 =?utf-8?B?NnFuQnVGeVBrU1Q3WDRLZkh1MlNKeTNBcHJNejAyLy8vQ05iY044UW5TMHRx?=
 =?utf-8?B?RjdyZFZ5Tk5lTGxkK2kyVXdTd2pwTEsza0pDR0hVVUI3SFFvdW81aXN4akNz?=
 =?utf-8?B?amc9PQ==?=
Content-ID: <7427E35C13761A43B5577642207C09FE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ada5b1-bc6a-4e3d-aed0-08db998f0e49
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2023 10:46:30.1569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8AAfcmTChWQt/KUEiRzkvYcTKnb4ctJ6eZvM1ddMyZRG7wEyoh9N3edQGIRwV8hju2c1dwZ2pu25bEgsttIcS9LhqjCjzqPsHX3cpqQU5oQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5702
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1691664394; x=1723200394;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=NxQV6J6ntTsI4Uohwf+kQR0v1hs/u1Z38Yu6d7E6dfk=;
 b=mSnFZcdU54qKFCfk/8KDN8eNg20xCKydgBb1UMlGtAHMjVzX3sx8Z2R0
 JiPwEB5c4tOBNUV+UQ4y4MOD41YWyEk4i6t3mwbiY5PdQWpN/nRfku4QN
 mcA2m/86LmjSkRImw49cOwKUwFbLYKSF37sws/nd9hxqi95JYsmnlBV3Q
 +jGxsFiLMsjoNzn83cafu5rZvSya24IfMHN0CQ7ExuIia17Z4snW4RiD5
 Smakl92JNyFYnm7jrhFPS94YzmqNt6hmRzZEM4MO39UXIauhnIFVnMcRD
 zCTirun8cg6GsRC+yBLFW+kxEyhZX+/4zlNTHengLswJCgWyZ+5IUGevk
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxQV6J6ntTsI4Uohwf+kQR0v1hs/u1Z38Yu6d7E6dfk=;
 b=ezOGN9/uyL7spiXgoJrk3bPRfl/x24qTSINvqNSsVgsadqxlgBNAF3k0+yV1fCnAhvG7JyjR4g7OmUN6FbqeQV/AoYAy5VjuqUGZQ26EhxXs0mB2jZdvcmcPRSHe5e33HXLXBPsMqyOU6W/KA0q+KOemO81S1XJSgWB3kkKCJ1Q=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=mSnFZcdU; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=ezOGN9/u
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH v3 2/2] configs/microchip_mpfs_icicle: add
 support for Microchip's Icicle Kit
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
From: "Jamie.Gibbons--- via buildroot" <buildroot@buildroot.org>
Reply-To: Jamie.Gibbons@microchip.com
Cc: Conor.Dooley@microchip.com, Nicolas.Ferre@microchip.com,
 Ludovic.Desroches@microchip.com, buildroot@buildroot.org,
 Valentina.FernandezAlanis@microchip.com, giulio.benetti@benettiengineering.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

DQpIaSBUaG9tYXMsDQoNCk9uIFdlZCwgMjAyMy0wOC0wOSBhdCAxNzowMiArMDIwMCwgVGhvbWFz
IFBldGF6em9uaSB3cm90ZToNCj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBv
ciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdw0KPiB0aGUgY29udGVudCBpcyBzYWZl
DQo+IA0KPiBIZWxsbyBKYW1pZSwNCj4gDQo+IE9uIFdlZCwgOSBBdWcgMjAyMyAxNDo0MzoxOSAr
MDAwMA0KPiA8SmFtaWUuR2liYm9uc0BtaWNyb2NoaXAuY29tPiB3cm90ZToNCj4gDQo+ID4gPiBD
b3VsZCB5b3UgY2xhcmlmeSB3aGF0IHRoaXMgImVtYmVkZGVkIGluIGEgSGFydCBTb2Z0d2FyZSBT
ZXJ2aWNlcw0KPiA+ID4gcGF5bG9hZCIgbWVhbnM/IERvZXMgaXQgbWVhbiB0aGF0IHRoZXJlIGlz
IGFkZGl0aW9uYWwgY29kZSBydW5uaW5nDQo+ID4gPiBvbg0KPiA+ID4gdGhlIHRhcmdldCBvdGhl
ciB0aGFuIFUtQm9vdCwgTGludXggYW5kIHVzZXItc3BhY2U/IEkgZG9uJ3Qgc2VlDQo+ID4gPiBP
cGVuU0JJDQo+ID4gPiBiZWluZyBjb21waWxlZCBpbiB0aGlzIGRlZmNvbmZpZy4NCj4gPiA+IA0K
PiA+ID4gSSdkIGxpa2UgdG8gbWFrZSBzdXJlIHdlIGhhdmUgcHJvcGVybHkgY2FwdHVyZWQgYWxs
IHRoZSBjb2RlIHRoYXQNCj4gPiA+IGVuZHMNCj4gPiA+IHVwIHJ1bm5pbmcgb24gdGhlIHRhcmdl
dCwgc28gdGhhdCB3ZSBhcmUgY29tcGxldGUgZnJvbSBhIGxpY2Vuc2luZw0KPiA+ID4gc3RhbmQt
cG9pbnQuDQo+ID4gPiANCj4gPiBUaGUgSFNTIChIYXJ0IFNvZnR3YXJlIFNlcnZpY2VzKSBhY3Rz
IGFzIGEgemVyby1zdGFnZSBib290bG9hZGVyIG9uDQo+ID4gdGhlDQo+ID4gSWNpY2xlIGtpdC4N
Cj4gDQo+IFdoZXJlIGlzIHRoaXMgSFNTIGNvZGUgbG9jYXRlZD8gSXMgaXQgYnVpbGQgYnkgQnVp
bGRyb290LCBvciBpdCBpcw0KPiBwYXJ0DQo+IG9mIHNvbWUga2luZCBvZiBST00gY29kZSBidXJu
ZWQgaW50byB0aGUgU29DPw0KDQpUSGUgSFNTIGNvZGUgaXMgbG9jYXRlZCBpbiBlTlZNIG9mIHRo
ZSBJY2ljbGUga2l0IGZvciBQb2xhckZpcmUgU29DIGFuZA0KYnVpbHQgb3V0c2lkZSBvZiBCdWls
ZHJvb3QuDQoNCj4gDQo+ID4gVGhlIEhTUyByZWFkcyBhbiBIU1MgZm9ybWF0dGVkIHBheWxvYWQg
ZnJvbSBlTU1DL1NEIHRoYXQNCj4gPiBjb250YWlucyBiaW5hcnkgaW1hZ2VzIChlLmcuIFUtYm9v
dCkgdG8gYmUgYm9vdGVkIHZpYSBPcGVuU0JJLiBUaGUNCj4gPiBIU1MNCj4gPiBpbmNsdWRlcyBP
cGVuU0JJIHNvIHdlIGRvbid0IG5lZWQgdG8gZW5hYmxlIE9wZW5TQkkgaW4gdGhlIGJ1aWxkcm9v
dA0KPiA+IGRlZmNvbmZpZy4NCj4gDQo+IFdobyBpcyBidWlsZGluZyB0aGUgT3BlblNCSSBjb2Rl
Pw0KDQpUaGUgT3BlblNCSSBjb2RlIGlzIGJ1aWx0IGJ5IHRoZSBIU1MsIHNvIGl0IGlzIGFsc28g
b3V0c2lkZSBvZiB0aGUgc2NvcGUNCm9mIGJ1aWxkcm9vdC4NCj4gDQo+IEFnYWluLCBteSBjb25j
ZXJuIGlzIHRvIG1ha2Ugc3VyZSB0aGF0IHdlIGhhdmUgcHJvcGVybHkgY2FwdHVyZWQgdGhlDQo+
IGxpY2Vuc2luZyBvZiBhbGwgc29mdHdhcmUgY29tcG9uZW50cyBidWlsdCBieSBCdWlsZHJvb3Qg
YW5kIHRoYXQgd2UncmUNCj4gcHJvdmlkaW5nIHRoZSByZWxldmFudCBzb3VyY2UgY29kZSBtYXRj
aGluZyB0aGUgc29mdHdhcmUgY29tcG9uZW50cw0KPiB0aGF0IGFyZSBidWlsdCBieSBCdWlsZHJv
b3QuDQo+IA0KPiBSaWdodCBub3csIGl0IGlzIGNsZWFyIHRoYXQgeW91ciBkZWZjb25maWcgaXMg
YnVpbGRpbmcgVS1Cb290ICsgTGludXgNCj4gKw0KPiByb290ZnMsIGJ1dCBpdCBpc24ndCBjbGVh
ciB3aGVyZSB0aGUgSFNTIGNvZGUgYW5kIE9wZW5TQkkgY29kZSBjb21lcw0KPiBmcm9tLCBhbmQg
d2hvIGJ1aWxkcyBpdC4NCg0KVGhlIEhTUyBwYXlsYW9kIGdlbmVyYXRvciB3aGljaCBpcyBhIGhv
c3QgdG9vbCB0byBjcmVhdGUgSFNTIGZvcm1hdHRlZA0KcGF5bG9hZHMgaXMgYnVpbHQgYnkgYnVp
bGRyb290LiBUaGlzIGlzIGNvdmVyZWQgaW4gdGhlIG1pY3JvY2hpcC1oc3MtDQpwYXlsb2FkLWdl
bmVyYXRvciBwYWNrYWdlLiBUaGlzIHRvb2wgaXMgcmVsZWFzZWQgdW5kZXIgZHVhbCBNSVQvR1BM
djIrDQpsaWNlbnNlcy4NCmh0dHBzOi8vZ2l0aHViLmNvbS9wb2xhcmZpcmUtc29jL2hhcnQtc29m
dHdhcmUtc2VydmljZXMvYmxvYi9tYXN0ZXIvdG9vbHMvaHNzLXBheWxvYWQtZ2VuZXJhdG9yL0xJ
Q0VOU0UubWQNCg0KVGhlIEhTUyBwYXlsb2FkIGdlbmVyYXRvciBpcyB0aGUgb25seSBzb2Z0d2Fy
ZSBjb21wbmVudCBoZXJlIHRoYXQgaXMNCmJ1aWx0IGluc2lkZSBCdWlsZHJvb3QuIFRoZSBIU1Mg
Y29kZSBhbmQgT3BlblNCSSBhcmUgYm90aCBidWlsdCBvdXRzaWRlDQpCdWlsZHJvb3QsIHNvIHRo
ZWlyIGxpY2VuY2VzIGFyZSBub3QgYSBjb25jZXJuLg0KDQpJIGhvcGUgdGhpcyBjbGVhcnMgdGhp
bmdzIHVwIGZ1cnRoZXIuDQo+IA0KPiA+ID4gU28geW91J3JlIG5vdCBhIHJpc2N2X2cgY29yZSBi
ZWNhdXNlIHlvdSBkb24ndCBoYXZlIHRoZSBhdG9taWMNCj4gPiA+IGV4dGVuc2lvbj8NCj4gPiBX
ZSBoYXZlIHNlbGVjdGVkIHJpc2N2X2N1c3RvbSBiZWNhdXNlIHdlIGhhdmUgY29tcHJlc3NlZA0K
PiA+IGluc3RydWN0aW9ucw0KPiA+IGV4dGVuc2lvbiAoUlZDKSB3aGljaCBpcyBub3QgcGFydCBv
ZiByaXNjdl9nLg0KPiA+IA0KPiA+IFdoaWxlIGxvb2tpbmcgaW50byB0aGF0IHdlIG5vdGljZWQg
dGhhdCB3ZSBkb24ndCBoYXZlDQo+ID4gQlIyX1JJU0NWX0lTQV9DVVNUT01fUlZBIGluIG91ciBk
ZWZjb25maWcgd2hpY2ggd2UgbmVlZCB0byBhZGQsIHRoaXMNCj4gPiB3YXMgYmVjYXVzZSBCUjJf
UklTQ1ZfSVNBX0NVU1RPTV9SVkEgd2FzIHNlbGVjdGVkIGluIHByZXZpb3VzDQo+ID4gdmVyc2lv
bnMNCj4gPiBvZiBidWlsZHJvb3QgdXNpbmcgcmlzY3ZfY3VzdG9tLCBhbmQgbm93IGl0IGlzbid0
Lg0KPiA+IA0KPiA+IEkgY2FuIHNlbmQgYSBwYXRjaCB0byBhZGQgQlIyX1JJU0NWX0lTQV9DVVNU
T01fUlZBPw0KPiANCj4gWWVzLg0KV2lsbCBzZW5kIGEgcGF0Y2ggdG8gZml4IG9uY2UgdGhlIGZv
bGxvd2luZyBkaXNjdXNzaW9uIGlzIHNldHRsZWQgc28gSQ0KY2FuIHVwZGF0ZSBhbGwgdGhlIGNv
bmZpZ3MgYWNjb3JkaW5nbHkuDQo+IA0KPiBJIGFtIHdvbmRlcmluZyBpZiB3ZSBhbHNvIGRvbid0
IG5lZWQgdG8gbW92ZSB0aGUgZm9sbG93aW5nIG9wdGlvbnM6DQo+IA0KPiBjb25maWcgQlIyX1JJ
U0NWX0lTQV9DVVNUT01fUlZDDQo+IMKgwqDCoMKgwqDCoMKgIGJvb2wgIkNvbXByZXNzZWQgSW5z
dHJ1Y3Rpb25zIChDKSINCj4gwqDCoMKgwqDCoMKgwqAgc2VsZWN0IEJSMl9SSVNDVl9JU0FfUlZD
DQo+IA0KPiBjb25maWcgQlIyX1JJU0NWX0lTQV9DVVNUT01fUlZWDQo+IMKgwqDCoMKgwqDCoMKg
IGJvb2wgIlZlY3RvciBJbnN0cnVjdGlvbnMgKFYpIg0KPiDCoMKgwqDCoMKgwqDCoCBzZWxlY3Qg
QlIyX1JJU0NWX0lTQV9SVlYNCj4gwqDCoMKgwqDCoMKgwqAgc2VsZWN0IEJSMl9BUkNIX05FRURT
X0dDQ19BVF9MRUFTVF8xMg0KPiANCj4gdG8gYmUgYXZhaWxhYmxlL3Zpc2libGUgZXZlbiB3aGVu
IEJSMl9yaXNjdl9nIGlzIHNlbGVjdGVkLg0KPiANCj4gSW5kZWVkIHRvIG1lIHJpc2N2X2cgaW1w
bGllcyBJTUFGRCwgYnV0IHlvdSBjYW4gaGF2ZSBJTUFGRCArIEMgb3INCj4gSU1BRkQNCj4gKyBW
LCBzbyBpdCBzaG91bGQgYmUgcG9zc2libGUgdG8gc2F5ICJJIGhhdmUgYSBSSVNDLVYgRyBjb3Jl
LCB3aGljaA0KPiDCoCBhbHNvIHN1cHBvcnRzIHRob3NlIGV4dHJhIEMgYW5kL29yIFYgZXh0ZW5z
aW9ucyIuDQo+IA0KPiBEb2VzIHRoYXQgbWFrZSBzZW5zZSBpbiB0aGUgUklTQy1WIHdvcmxkPw0K
DQpBZnRlciBhIGRpc2N1c3Npb24gd2l0aCBjb2xsbGVndWVzIHdlIGJlbGlldmUgdGhhdCB0aGUg
YWJvdmUgdHdvIGNvbmZpZ3MNCnNob3VsZCBiZSBhdmFpbGFibGUgd2hlbiBCUjJfcmlzY3ZfZyBp
cyBzZWxlY3RlZCBhcyBzdWdnZXN0ZWQuIFRoaXMgZG9lcw0KbWFrZSBzZW5zZS4gDQoNCldvdWxk
IHlvdSBsaWtlIG1lIHRvIGluY2x1ZGUgdGhpcyBjaGFuZ2UgaW4gYSBwYXRjaHNldCB0byBmaXgg
dGhlDQpjb25maWdzIGZvciB0aGUgbWljcm9jaGlwX21wZnNfaWNpY2xlX2RlZmNvbmZpZyBvciBk
byB5b3Ugd2FudCB0byBtYWtlDQp0aGlzIHVwZGF0ZSB5b3Vyc2VsZj8NCj4gDQpUaGFua3MsDQoN
CkphbWllDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
