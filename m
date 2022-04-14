Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7D5C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 09:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52CA28308A;
	Thu, 14 Apr 2022 09:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X48FK9l72nsi; Thu, 14 Apr 2022 09:10:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FA7583ED4;
	Thu, 14 Apr 2022 09:10:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 810421BF290
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 09:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6ECD083DF4
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 09:10:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d-K6FzhJY2U2 for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 09:10:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 268F683F3C
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 09:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649927415; x=1681463415;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4ZG+WzQz400JYnBezatIbb/AFb/jPw+Rr2Ga2MtecEU=;
 b=eYt2bRx97XQ69WVdnQYsY/wte+CEnB8762KevvHf9sxFfqtnhEIZMry3
 fwUceJ0gft1SvgAn9Aa1mJbDRqcVdbxE4FywsIKdoIeW3Zvj4LF9HEuOX
 JtogVyCZmuwQmNe5U7xxxw/0bIFuEClFxE+SJvHl2h5FDCiAeG/JTDUxC
 2usRzGymieAYxsUXosxScMo0bXnv2rl56oinK4kU6CWxWQBOgtNcbCcn9
 elvbIzAjTb9dlhSEhXRj/4KJfE5LBOV7GBkqR2N/7ODWOjCTnG6RcTXRU
 0LsZVZxeFGpgB+0ETdP4/4c1fvx5qdNADDZcvuG6t0pqlbGmBnjUoaeAC g==;
X-IronPort-AV: E=Sophos;i="5.90,259,1643698800"; d="scan'208";a="160085882"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Apr 2022 02:10:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 14 Apr 2022 02:10:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 14 Apr 2022 02:10:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKp8rJ5gwPf285ybxovCihBjZOy4P8fP5k1dJWFegnw5lXSGfVE3txlYKlA8IhKnTq/ixTV07yoGioRsvs150Z72BtN7dPXE6ktddVa8PmBnm7FpzXO2uO9kwnLQq+NWB1UKZjcXPd5agn4w2GsGnBtiDWX8Pzfl1WbzvsuWriipo1B1orEY0cLxUx/hfehDDGUzK9hsYQ1ujgTlgcKnSTlCbOIyn6IOMMW5SItU8CxUd1+CBygOzsEJUEy7N2G6F5VwPZoCqKEwiQ3Sud1of/x2BYoq8YOq9xI9zEbidQ+mSmPP4vzKxOSUH0sSkhUSOYO2quvp4WBKENjAstbJQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZG+WzQz400JYnBezatIbb/AFb/jPw+Rr2Ga2MtecEU=;
 b=nXoDmJfR85R2ZtLh+2jDJory7vmV3Q+VLz9o6N5Jv6aQt8Vk67nR65lNhewlKjAV4dcTdeqabSS5LkzyKPfmSPINQ0PiEtiIsYvqRmGQV8NAkWgNpsmZTAjsK/3qgXya/eDfIOXfv5aqHv+mV7QIXyWgLQ0hff3sGpA0NeqA1Sdn89NJs1kbNWsztTe5eeNlTRP7iHVF9dLiJuwuiagec79uNI7IMBqAk1rGTlnqvHXKJrD8outMz4puuOzMCxWOyjj3Wx+2oQT6nP6BR8u0++peBm3pNsJjAnriZVfOVSVG6i3S9maX0tcWZN72AoUcZ7kUFfEzCUD5A4AV6fX1fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZG+WzQz400JYnBezatIbb/AFb/jPw+Rr2Ga2MtecEU=;
 b=bPAFeZSRHAcwg2hIOP5rkX0BgywCbasxoz5rKbpOSNj0Sz+DXryMId0GQfrlofLg4VWhg21XgMG3VwBmggkHoss+c+WCpA9ek94HP1ElRfJ8YmRyRPqaMGxqxSPuDszLu9qAD06rWPe7Va+82D/a3lUXO5lQ639wJUgX0ShIhRQ=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by DM6PR11MB4108.namprd11.prod.outlook.com (2603:10b6:5:197::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Thu, 14 Apr
 2022 09:10:08 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2%7]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 09:10:08 +0000
To: <fontaine.fabrice@gmail.com>
Thread-Topic: [PATCH 1/1] package/dhcp: use internal bind
Thread-Index: AQHYTmEZ03FYkSO1E0aa3ZrEpJPiy6zsKDSAgAAOXOOAAF/EAIAA5G6AgAAJoDiAAZ23gA==
Date: Thu, 14 Apr 2022 09:10:08 +0000
Message-ID: <d864ae21-b68f-b30b-ce07-cd66b473e4f9@microchip.com>
References: <20220403100318.2581647-1-fontaine.fabrice@gmail.com>
 <8735ims60b.fsf@dell.be.48ers.dk>
 <d1a1ead3-98a8-35fe-4c4c-e7fd3f02e058@microchip.com>
 <CAPi7W81VbAArhoyDEJrNMeseVXgmJzu2+K39njx1j5y3_5mb5g@mail.gmail.com>
 <8735iifser.fsf@dell.be.48ers.dk>
 <34fddc8f-8710-65f9-330d-81fefe64354a@microchip.com>
 <87y20aeb04.fsf@dell.be.48ers.dk>
 <CAPi7W83dikm9d7KWjKfqYwr7mP3U4WzAzdw6iLF6gmOkTgwB-Q@mail.gmail.com>
 <8d53da79-2a90-8649-6f46-22b33b7bdbe5@microchip.com>
 <87bkx5crop.fsf@dell.be.48ers.dk>
In-Reply-To: <87bkx5crop.fsf@dell.be.48ers.dk>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17ff85df-a3e7-477a-a7e7-08da1df692a4
x-ms-traffictypediagnostic: DM6PR11MB4108:EE_
x-microsoft-antispam-prvs: <DM6PR11MB410836B6495EADB87863FE3EE8EF9@DM6PR11MB4108.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FDF/giQ1HpKrVqzOSHKnhlByFQn6YyF+SNWhMbrINVy6Ip4oCKlee5/Tbbfra1DVWD9b3l3p9d+j7pwVOU43ICCodW8Q2s2+hbYiyT7/W+qU5rW1P4jzJINokJvpKdps1sOImQYg0DqZfBnL7pk3fld8zYnR0a/H0P3map1fPpIwQCyjfj0zvXsMbhc7W6rPVM0A43K416IMBZPGSeaLOrY6mewNCUpQ8HSnnevPf/AQBeDBVjUtBUJlaolVnQbODCAtRoHqU7lTOIv7NSFM6Wyd7lEghCE56Ly37ON8/K29D32ygcxv6RDqdoeyF+G8gw/TbG/b8Zy1fXBnTmVLvV8DZ8hKWoXZ4NKMpogNnC0iMNDVuJK8EswVPmyCEE58Q8LzgBuNMlLcmezO8vmUvudpM4sFSULjxGB8yoRMdXF5bDZ2O7aUJIEBq32PhuJv2WQeEwFMG+4IgsDSatQ/Tvo68JwbshCdydfFwPx59kloIh8f4rPbybloQHiIQDZADzgJBszjzKDf5AUiVVn5kGleIicP5V0tLx2xzuN8vHGxD1XHb5sLtuD7aeYOgqZYf+Lp0Hw6kG3pL+hFCLbH7U7Vl0SyJZvhfX6VzLHsHEDbjGA9XkVsPBrSAXDCmtMTq0szrdo29uEqR97ZHJahGuTwVv3immxzm8Bv3r17/ojaU0KYdhNy6VLmQo00YGXvC4jWg/CuAShdllUUcpfb3B5zIJ/ZMfRl4v4lsPyp+QJ7wWqDfJYqShrUcA0RsGbU89fzUdS/g3yzSt+qRdVwiRwZe1zfoXDUMJJPrjqMpIhqH8WX6E0aOkFkG6mCQSzyxgsc67DO8DFO3U5efYbcL1USjyaLKNpFIyOsTZR6g9o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5384.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(2906002)(91956017)(6486002)(36756003)(5660300002)(31686004)(316002)(76116006)(4326008)(66556008)(64756008)(38100700002)(66946007)(66476007)(38070700005)(66446008)(6506007)(54906003)(122000001)(966005)(6916009)(8936002)(26005)(6512007)(83380400001)(508600001)(71200400001)(45080400002)(2616005)(53546011)(186003)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDgwWDlzWE80OVRjc0dnbUtXaEJ6RTYwU0N6RGZxNm95R25sSTRNaUV3ZzNu?=
 =?utf-8?B?alh5TktHMDZhNVV1ZUNrRmdtOFd6dCtFMUttWDJFaTdaZ3lCMzROWTYzVjc3?=
 =?utf-8?B?T2IxTHZKWDk5eVBrN0FnREdCSHBvV0o4WEZqM0I3RVV5NEQrOUlLaW9ES1hI?=
 =?utf-8?B?dE83bTlQamJmTTFId29obTRjL2ltZ1phb3YxZGJUMU4xVnh3d3hQN1JHZHlZ?=
 =?utf-8?B?a2xscGxCMGoydTlOdzdtYW94S25iRmcxY1k3SUxWOVprZDIvNk5uUU5zKzFy?=
 =?utf-8?B?UEVHVjlCNnk2S1JKbndnVksydWpGQTF6Q1NOMGpjRmhYM040bis4VVAvTjhn?=
 =?utf-8?B?dU1NTkI5VmYxSWhxOUxjamx1K1ljRWFMdmQ4WGYyUnVQT2dqRVEyWXZoV0tE?=
 =?utf-8?B?c3daWmFpWGlaR3V0TjI5ZVFTOFZJaVY2NWMrb3ZRZmRFVm1wVnpLNzRDWjkx?=
 =?utf-8?B?T2dkS2hlWldaYVBTc09ZRm8reG56QVVwL0xWM2ZVVTJydmZHRHdUbDJtMWFo?=
 =?utf-8?B?K0FLU0xncGs0Zk40Y1VlcmZPNHJqUHFIVC85WHlHY2huSFJld0FOU0JJYUM5?=
 =?utf-8?B?RnJia2VIREtpcWtrNWcxa0Z2bHRRT0xqRE5ObzJNYXJXNjdRRHByYnE2clRL?=
 =?utf-8?B?dUM1bk1rMks2QjhhaWtiRHM2bmhHNFRCcUEvMnFsSTNUNFhZbWxrRHhzN3Fk?=
 =?utf-8?B?RFM2QlZRRldPbFlTZU9CN1V4amp3UE0xS1A1VDdKVkYvSkdRMUo2Y2JKZUxr?=
 =?utf-8?B?VEQrVmpVNk0xOFhndzVyUXNhcDVKNkhGZWlnbXdYVFZZYTlRL2sySWw0VHhi?=
 =?utf-8?B?WmxVdXNGL2tMN29kc1ZMUnhhd3duZVZlSUtld1NjQ3dVU01WMHYwTnRvbW1Q?=
 =?utf-8?B?TUtOc2Y1b2FBV01zblVTUHh0TzlkcGg3VUV5NWxvbGlyNlM0Z1FiUnBLeWRC?=
 =?utf-8?B?NWlYeW5qNnI5UUhsaWZPME1Eb2pvZklkUVIwbmFoeVhLbHNzWnRSZFJkYmVR?=
 =?utf-8?B?VE1IdEdxdko0M1lOMmRySHpUNzZUYmJxSy9CdjFyMldOMzQ4MjBRb3pyUWlV?=
 =?utf-8?B?ai90UXlKUFdnc1hRR3VINTI4T3dmdWJ3eHI0OEc4b0xjSXBrd1lQNCtlVnIy?=
 =?utf-8?B?Mlh2TFE3OHByTGppOTY0a0d3YWZ5c1pPUXhsRHI0aG5KSVQ1M055eWxxVDNp?=
 =?utf-8?B?Rm9qZW9Id3RKT0VPYUJOeW9PWkNoMTJyell5Z0dYbFJwaTdQTS8zMzlzZStO?=
 =?utf-8?B?QVJoKzlJSnBPanppdXVhUkxUazdKN3V3bnlJR3E0M2xRU1NhMTRNM3RiSHNK?=
 =?utf-8?B?TE8ycVJQc0hnTUU4OGROTi91UEVwNXdtOTQ0NFliQTY1SStOQ3kzK3NxclV3?=
 =?utf-8?B?SU9vcVl1b3dZdEthMGREbUNRMEkza29kN212R0FpaGdGMnRhTjFqUFV4ZUdP?=
 =?utf-8?B?aEJBcDh2cFg5S0t4c2Zzb1pQbTFieWlacVBOaVBnYUtZVTcxWmRQaFN4Rml2?=
 =?utf-8?B?b3Z4Zyt2d0JKL2dRUUpIQkVJUFhwcnBCdkJENUY0K2ovZjJUV0NDWDZXQW9L?=
 =?utf-8?B?UXQyUW84ampHSUJ2bVNzK215UCtwY3l5eTQrT0E3TU9LdlhranN3M1g4OERi?=
 =?utf-8?B?V0trVTJTMmlRQ0tIcDVJbTBheDVieW5BVVc2eEhkNmltMU1PN3k0WDYxYVpG?=
 =?utf-8?B?QXhvUEFqR0Rpbml2OU15WUdZem16a3V3SzY5N3VQY1k5WEdWaFZieER5SENx?=
 =?utf-8?B?WkE1RXRqWGJQY054YkRzWDBaYTYzNkZrQmQ4MVF4TWJrajdTMDlmLyttUVVW?=
 =?utf-8?B?YkJ4THIrU2haclloZE51YnhvemQyTjdHT0haNEUzajB5a3E2MWw1R2ZHcE02?=
 =?utf-8?B?WTJSS0pzSGt6UklNR2FRaEJQUFRCNVBkM0xRamNtOHE4cGdLaU8vc2NBNXI0?=
 =?utf-8?B?RHhaTy9UQVlyUlpJMUpEWUFhOEE0bDd1RUZUckhNR1hhb0tVbEtYU2RSeEpy?=
 =?utf-8?B?NzdSUTEwTmdOM0tPVGpUaWdpTVRGUU5vNjFqTHAzMGdyNlAvNmZ5eTZCNUpL?=
 =?utf-8?B?Z1NYTWYwTHF4WXBockZNbno0TTdjdjZPZGVseWxhbDNzN1hVVHArQXN3RXZ5?=
 =?utf-8?B?R3ZyYm8wRTJzVGVmaVBReVNKbkZ4dGYvck01eEpNRDFzWEtGaWwvUzJXK291?=
 =?utf-8?B?NEhJMktoR0x1U1BvWHNINCtrREhJOU9MU1BLTzhKYWVBVjcvS3ZNUlRXcGdk?=
 =?utf-8?B?d1Nxa1Rkc2dzTmozdEl0RGJ0QlZ2cW9aQjE2OXcwcHYra1RMb09NeFRNb1R3?=
 =?utf-8?B?WHd6aThrVklBME1yQzhjWHlvRmtUenoxeWVqTW5JeFlaVjVWOWpmYjlzQ0pP?=
 =?utf-8?Q?iVlUBw30mpcXC3BY=3D?=
Content-ID: <6FFC9C64E52B564192D125CBC35E270A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ff85df-a3e7-477a-a7e7-08da1df692a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 09:10:08.1865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VxqMF8LcEazE3IjkM3YpKvxhZWoagQInbzyfZCUtWtLofy+aLTW5qzEvFmD8d4RG+pU+XJ6C4BjJhNr1TR9DULGOw69LgZ+6Jr47/TOIu6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4108
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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
From: "Eugen.Hristev--- via buildroot" <buildroot@buildroot.org>
Reply-To: Eugen.Hristev@microchip.com
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gNC8xMy8yMiAxMToyOSBBTSwgUGV0ZXIgS29yc2dhYXJkIHdyb3RlOg0KPj4+Pj4+ICAgIDxF
dWdlbi5IcmlzdGV2QG1pY3JvY2hpcC5jb20+IHdyaXRlczoNCj4gDQo+ICAgPiBPbiA0LzEyLzIy
IDk6MTcgUE0sIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6DQo+ICAgPj4gTGUgbWFyLiAxMiBhdnIu
IDIwMjIgw6AgMTQ6MzQsIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gYSDD
qWNyaXQgOg0KPiAgID4+Pg0KPiAgID4+Pj4+Pj4+IDxFdWdlbi5IcmlzdGV2QG1pY3JvY2hpcC5j
b20+IHdyaXRlczoNCj4gICA+Pj4NCj4gICA+Pj4gSGksDQo+ICAgPj4+DQo+ICAgPj4+ID4+IFll
YWguIEV1Z2VuLCBpcyB0aGVyZSBhbnkgc3BlY2lmaWMgcmVhc29uIHdoeSB5b3UgdXNlIHRoZSBk
aGNwIHBhY2thZ2UNCj4gICA+Pj4gPj4gb3ZlciB0aGUgb3RoZXIgREhDUCBjbGllbnRzIHdlIHBy
b3ZpZGU/DQo+ICAgPj4+DQo+ICAgPj4+ID4gSGlzdG9yaWNhbCByZWFzb25zLCBhbmQgdGhlIGZh
Y3QgdGhhdCBwZW9wbGUgaGF2ZSB3b3JraW5nIGNvbmZpZ3VyYXRpb25zDQo+ICAgPj4+ID4gdXNp
bmcgdGhpcyBwYWNrYWdlLi4uIEkgd2FzIHVuYXdhcmUgdGhhdCBpdCB3YXMgZHVlIHRvIGJlIHJl
bW92ZWQuDQo+ICAgPj4+ID4gV2Ugd2lsbCB0cnkgdG8gc3dpdGNoIHRvIGEgZGlmZmVyZW50IHBh
Y2thZ2UgaW4gdGhlIGZ1dHVyZS4gVGhhbmtzIGZvcg0KPiAgID4+PiA+IGxldHRpbmcgbWUga25v
dy4NCj4gICA+Pj4gPiBIb3dldmVyLCBpZiB0aGUgcGFja2FnZSBpcyBzdGlsbCBpbiB0aGlzIGJ1
aWxkcm9vdCByZWxlYXNlLCBpdCBoYXMgdG8NCj4gICA+Pj4gPiB3b3JrIHJpZ2h0ID8NCj4gICA+
Pj4NCj4gICA+Pj4gWWVzLCB0aGF0IGlzIHRoZSBpZGVhLiBJZiBpdCBpcyBkZWFkIHVwc3RyZWFt
IGFuZCBoYXJkIHRvIGZpeCB0aGVuIHRoYXQNCj4gICA+Pj4gbmF0dXJhbGx5IG1ha2VzIGl0IGhh
cmRlciB0byBkbywgYnV0IHRoZSBpbnRlbnRpb24gaXMgdG8gZml4IGl0Lg0KPiAgID4+DQo+ICAg
Pj4gVGhlIGZvbGxvd2luZyBwYXRjaCBzaG91bGQgZml4IHRoZSBpc3N1ZToNCj4gICA+PiBodHRw
czovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIwNDEy
MTgxNjA3LjE0NTE1ODAtMS1mb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbS8NCj4gDQo+ICAgPiBI
aSwNCj4gDQo+ICAgPiB5b3VyIHBhdGNoIHRvZ2V0aGVyIHdpdGggdGhlIG90aGVyIG9uZSAoDQo+
ICAgPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNo
L0RVMFAyNTFNQjA3Nzk3Q0FBRTgwQzk4NURDODk3NjMzNUUzRTc5QERVMFAyNTFNQjA3NzkuRVVS
UDI1MS5QUk9ELk9VVExPT0suQ09NLw0KPiAgID4gKSwNCj4gDQo+ICAgPiBzb2x2ZSB0aGUgYnVp
bGQgcHJvYmxlbSBmb3IgdGhpcyBwYWNrYWdlLg0KPiANCj4gVGhleSBhcmUgbm93IGJvdGggYWRk
ZWQgdG8gdGhlIDIwMjIuMDIueCBicmFuY2gsIHRoYW5rcy4NCj4gDQo+IC0tDQo+IEJ5ZSwgUGV0
ZXIgS29yc2dhYXJkDQo+IA0KDQpIZWxsbyBhZ2FpbiBGYWJyaWNlLA0KDQpBZnRlciBtYW5hZ2lu
ZyB0byBzdWNjZXNzZnVsbHkgYnVpbGQgYWxsIG91ciBkZWZjb25maWdzIG5vdywgd2hpbGUgDQp0
ZXN0aW5nIG9uIGFub3RoZXIgYm9hcmQgKHNhbWE3ZzVlayksIEkgbm90aWNlZCB0aGlzIG1lc3Nh
Z2UgYXQgYm9vdCBsb2cgOg0KDQpTdGFydGluZyBESENQIHNlcnZlcjogL3Vzci9zYmluL2RoY3Bk
OiBlcnJvciB3aGlsZSBsb2FkaW5nIHNoYXJlZCANCmxpYnJhcmllczogbGliaXJzLnNvLjE2MTog
Y2Fubm90IG9wZW4gc2hhcmVkIG9iamVjdCBmaWxlOiBObyBzdWNoIGZpbGUgDQpvciBkaXJlY3Rv
cnkNCg0KRGlnZ2luZyB5aWVsZHMgdGhhdCBsaWJpcnMgaXMgcGFydCBvZiBiaW5kIHBhY2thZ2Uu
IERvIHlvdSBrbm93IHdoeSB0aGlzIA0KaGFwcGVucyBhbmQgd2hhdCBjb3VsZCBiZSB0aGUgY2F1
c2U/IENvdWxkIGxhdGVzdCBwYXRjaGVzIGFmZmVjdCB0aGUgZGhjcGQgPw0KDQpUaGFua3MgIQ0K
RXVnZW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
