Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA329C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 11:20:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E02E6109E
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 11:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E02E6109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32E654012E;
	Wed, 18 Aug 2021 11:20:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JKWLm1zXl8xA; Wed, 18 Aug 2021 11:20:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68BEF4016F;
	Wed, 18 Aug 2021 11:20:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B63401BF3CD
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 11:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A40D46066D
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 11:20:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com header.b="N/2kw27o";
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.b="aESuDk9p"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k8jlei3ZACnC for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 11:20:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80058600B5
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 11:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1629285631; x=1660821631;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XRoopf+ZHDCIvOXUUC+OulG9ou3l5h+0u3ZJDCUMA7s=;
 b=N/2kw27o1oKfzeF58wmYw406UG9C+teWIEdwA2GjFkcJXkOgMt2BQfNM
 47i+a94LB8X17OCW9HbV04y9NrjwNEpvVY9oaD5tBrjcR8QNUOU+RM2i0
 N2lZRz9ftsbhtkp+zLHIzp5sKnfF/woHy/ZIJ1uubgGAYNI7claSybFHm
 T5gzK3DvPBqquxYdCv0qWNE5buRob8uq1usKd8NLqYTOtnUoyJtX6Dz0L
 7S+YVT6pd9dDZk2R8jswvw59NBZdVKTezhYEgK2Z4+gaFFNBtRfpzrnA4
 1v6XB9Cp73opVzCmjs3dCjCdvddeU0oB6MD4KDkR9uPzZs0gzxCtE+hvQ g==;
IronPort-SDR: +H7+hW8vIZ7iWupB2YkuhlKPBAcuteTYsYsskx1AQSXzWLjLO1m8j9qIwffZ4rLTASXveeBlxT
 r4lOTp5zCj514D//YsLuasmiEhCdePJ3PUNybAOOKZvsIXkMmpc9f7A/ujtSLx54R6Dq7ahWAx
 rGMT1OTH88obd+f8zMtNpXJ1Zg+6yWzDxkfeWWskop74ONloFjkGpTIIQETD2FN7thVPIIrHex
 yb4Dl+UqFb65vyZh8Kiu3MziKX+qtPFQ+ZfgA1zEgQ/j6+DajYJdH0UJobSU6K2Lu2Tdb7c9P5
 Q1kWXrAVUWeBobx/Gopy5N9c
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="128741637"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Aug 2021 04:20:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 18 Aug 2021 04:20:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Wed, 18 Aug 2021 04:20:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMxo6eH/fbgX5NBrUQ/EK3MEf1OUAQ1DSTSE3H6AyoSuhSwszuSLX3LhzO4RhEAeyrYjm22eZK5UqgbRIzQGQUJ5dnOvK+DdbU/QNKtezfFzf9dU3nIyHu/nURAGP81V7zYUbfHbVBpCAmkFeLSNnDY+bcY2Svsw/2H/RV470wZ3HebCRTOS3b7PIsCTHSpT81AVhofLVCrkljnul2pTorjamkzfxkaXE2e4OOOaZHLlwrowswXBM8QWe3V9pnaWBzKHWXwI2Hkzo/vtPoJXZ+PkftNUX/Pg9v/P7pzcimGrQgNNFBnIUWFMYoZvg/ZdSJzb42lHMZav0Z4XYvvJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRoopf+ZHDCIvOXUUC+OulG9ou3l5h+0u3ZJDCUMA7s=;
 b=SQHlcXv8MkqNKKYm9SY6bNWNrgnktjZVWLG9/r9DBqU/lTbkQGXPgAvfjNsP2UMUOl/cOHHwcnn4nGG9dZa+VEjMyFTbOIlLP6gAhQYLyK6oCq0ha0wa9h1MiNS9qkcwxEAeFeJvtI0JKP+2cEXq3BiBscg+ACZK/urBWfkjYLW3YpH21OPNT8/RN9cIoLAuHb06LwlYuNVvGb53pusi/Q1GlcCQ6l+g6L0fHoYGv3aiclUBF3/X7DyGqApLWd+8i9TgmtiJ+OoQxpnEcRkfLwaT9Bp5YaN2xSWAnxLQj/odejX/iIK5WROTD3v1xScJAunWQPrHlo3MkPHJwqTp9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRoopf+ZHDCIvOXUUC+OulG9ou3l5h+0u3ZJDCUMA7s=;
 b=aESuDk9pZNHf9EB4rT0o2m2wV9w0mbYD3T2V90fAgI2pDEVl1CPzh2m3l6/FBtRUnoGSmHpplEQ9MJxbkFrI619D/VNMrM2u3ygAsfjlhCzUaDFMGuuOK8wwVC52IfYKNu5l+yUN9P+zrlllGXy9FARlre+fu99mYpNL6WydUWk=
Received: from DM6PR11MB2777.namprd11.prod.outlook.com (2603:10b6:5:bf::31) by
 DM6PR11MB4594.namprd11.prod.outlook.com (2603:10b6:5:2a0::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17; Wed, 18 Aug 2021 11:20:28 +0000
Received: from DM6PR11MB2777.namprd11.prod.outlook.com
 ([fe80::141b:2e31:de46:fe09]) by DM6PR11MB2777.namprd11.prod.outlook.com
 ([fe80::141b:2e31:de46:fe09%7]) with mapi id 15.20.4436.019; Wed, 18 Aug 2021
 11:20:28 +0000
To: <arnout@mind.be>, <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 2/3] configs/acmesystems_*: bump
 at91bootstrap3 version
Thread-Index: AQHXkpbpfV4JxvLDm0qfbqT5vv0HXKt4NgQAgADq5YA=
Date: Wed, 18 Aug 2021 11:20:28 +0000
Message-ID: <b19518d7-4b48-e3fc-6d4c-f84238f1186d@microchip.com>
References: <20210816120418.427-1-ludovic.desroches@microchip.com>
 <20210816120418.427-3-ludovic.desroches@microchip.com>
 <aeca7e19-f3f0-c66b-8033-f6bb1da29ab2@mind.be>
In-Reply-To: <aeca7e19-f3f0-c66b-8033-f6bb1da29ab2@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: mind.be; dkim=none (message not signed)
 header.d=none;mind.be; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fcb097f-0f0d-4912-bfac-08d9623a2ef0
x-ms-traffictypediagnostic: DM6PR11MB4594:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB45947B5639E81F3C6AED0893EFFF9@DM6PR11MB4594.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mVaUAU6DsBg7F7Kk7WP1dGw3dN0RqxzvTZOw0BcgzzEtLMeU8ZsSJ5X7thrkBtykyRhqtE0IhgWup4cpUpQqc8hKGM3WthUBBoyHLv7RsPEnpE4SK8FSJTbTDkcQHm8+/3BFdWpB0wO/KWVvsPN1KzE6lW9ezeJPng90M8Wa1CD4SIiFSbZTbnfeNSyS0XxTY8LHeSS2158QOzgnBxhcVQyp1s90DKdBX4yL7rdgUvXEXngmb0MC3NvkDMVTL6abivvnI205JehRyy5T2gTc7OS8ZjyvALoIVfVEv6+qTt0g1Wp1v0gHV2Y4+uNiaCh8dLqDZUsUEINjEZjuGlPDe8lHd5RjmKSrJEKWPdYKVRIIufmlHYewXOMy21rVI24mFnYnNowDsN7EjPha5skBlCO2CWB/Y8vto4ykxwXrwIrEkqYaDqq3CmhTQvgbszrqsVejGlkUhgAt1YbNcGb2i3Vunt7zT7PrQzTfoMVTU5UP1XE8r5LyVdssyl4GgMymNw+syA4gYbYxVYo9yCYJGaOHvlJ62v951RhFX2gnM0LAI2K6Dy2fDVQcZ2B0GBIR8WlXcsN8o5obvE/o9W4MmLLXKATUGenXx1m1k3ziE0NKsnW8rulTxei6WZjetkM1H82bF22l/ZbpcJitEp3fJS3x8uRuwpsrPG0DGnd9raAWbbeIDlhPkuBXqpUrFN5F95pfzcittBxHVFMgBCO0j+i0fsy9shSZ0nmN1dwyCvY14uJ/PzLZIWfjmDh2meC10qw57q6gQ46P74RMz6rKLoYkx1G3kIlqZotKy/FUWwLzzKhlxRf88fimfpYqarWneBCq0n4OoGzaoJSFZKUa5gwoAV16o9nfXtYgrYQIZYY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(36756003)(64756008)(38070700005)(2906002)(66946007)(316002)(66446008)(66476007)(110136005)(66556008)(122000001)(38100700002)(107886003)(508600001)(186003)(53546011)(31696002)(6506007)(8676002)(2616005)(86362001)(54906003)(71200400001)(31686004)(4326008)(6512007)(76116006)(91956017)(6486002)(8936002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXFQUXdJY0x0OWFNNkZCeWplSk1qOTZjRFFBZUI4aXlDQzRJVU1ZNUpSci82?=
 =?utf-8?B?M1kzWGpVVkJMLytBMFd6YVdGSGVrMjZtOFpoSFBaNkxuKy9VUkF2Qzg1U1RR?=
 =?utf-8?B?Qkl0UkRtaTNzZDFEQU1IdU52QmhvM2hHNi84TlFPd091NzNLaFI2RDhhWW5D?=
 =?utf-8?B?dFkvdWttSnpMVlF2cGUveTBiUXljbzh6cGdIRkY2alVINEwrUmt2SHhlVURr?=
 =?utf-8?B?YzZaek5UanpPU1pNTWd2QmhSVllURVorZ0lqT3k5UVd1c0RJWCtsL0RpL0pw?=
 =?utf-8?B?TGlDb3hKUkRJSXhqMitrMWVqd1R4UDlndkFSZTcwbjdEbC9xNmpYdVlIZXdU?=
 =?utf-8?B?ZFMrVnF5TTBxVlJ3NUZrWlhYV1VjWFdWbXk3N0Izdk95Q1cvcm1yNEVnYW56?=
 =?utf-8?B?dDZZRmJyVmJjSis0c1BMTTkvMDZNa0trcjRMdzB4NkpLbWk5RndEMTRHRCtB?=
 =?utf-8?B?YUJuYU1pbXdvZE01N1I2UEY1bkh4Q0RkU0RxaEI5QjNjYVdGUTUzcE9GUGVo?=
 =?utf-8?B?VU05Uzc4d082aC80WG00d242U1M1TitCanE2YUhydmpTaURwUjY5UHR3bW5j?=
 =?utf-8?B?ZzJtVWo5eThZZC9YRWlXRmNadm8vRUwzWnVoWjlpdU1GbkdudXBwazdHc0xX?=
 =?utf-8?B?bVIwTjNPSFZsMGFxcVBob0xqMWxEb1dLUEd4TGJGWVlJVVowNURuYnZTNDh0?=
 =?utf-8?B?T3JQSlZYenZKTVhHK2pwOThVREIvNTljSjFqYzRYWHhRU3kveHdWSExEVUc0?=
 =?utf-8?B?bkZycWxpSlI0UGttb2NMK2tORU1MT1NzWDdKaGJpVE5vNFhtaXQwbHVVWlF1?=
 =?utf-8?B?eWtzZ05IUklIRHY0eVVOTVJFYTZvaVNmR3lyMGdPbVJGdmR3RTBCWkRnM1JP?=
 =?utf-8?B?ZTRTOFg5TitWK0tRTUJUckx5ZXQ5VmlvZjVkRFdaWCtLVjh5SElrNWoyOVBx?=
 =?utf-8?B?TTh5bzRiQWdUczJ0aHZLcW04Ny94R3hoWDVUVjVNNFdyVEdpL2R3RzRzTThr?=
 =?utf-8?B?NkwrcG5JQTUweDBrbW5hWmlvZXlXR3NDQjlLM0Nsc3AxYVpvQ2tTZzl2djlr?=
 =?utf-8?B?aU1XL0JmVTFNRlZhMWlHbUFSQ3NGMGYzVkFWOUFhTmRMdUpGclNzenAraHUv?=
 =?utf-8?B?aHMvMWVKTktITTBOeU5lNzFidUpSM0NmN3hrS2dsYVdMM2JOZWczb3pvbTlL?=
 =?utf-8?B?UkswdHFOTnNTNjBZSGpSOXY3T2creG9Dcng5bkw1ZHVPNHJqdGVnb0JzTzJH?=
 =?utf-8?B?bnNZYVFUNjVSRitVdGdRVTZhbFdFRlRrRUtFNC9vMjY2ZnUzOFRjVTYxcWdh?=
 =?utf-8?B?TFE3RWpuWXU3TzNrN2RYRkJpL1F1Nm5ybm00bTdrOHI5aExGWGpBZ01OQld4?=
 =?utf-8?B?Y3BOcWo1YWtidElyaktTK29hOEU3YU5udFhpK2JTMXBvaGsyRU1ENk1GWjhF?=
 =?utf-8?B?R0RmNWNmWDR1b2NjM2NvejZMQnE3S2YxeVo5R1BxOWlIaXB3WmZYUm4zakk2?=
 =?utf-8?B?ZEMzQzNKbWdTN29tN2E4UmhMOWVmejBoV01BL3k4Vk51bG8yb0VUODZVWktM?=
 =?utf-8?B?ZUNESkFhMHVGQlRpc3VsYlEydzV5N0twb3VUTE1XYWdCaXJ6ZmxqMzlHTXMw?=
 =?utf-8?B?cUt2cFY2QVdBZTR2U1RQYUxLM2lqcTdPQkdUWURpLzNSbHlsclZGTUxoSTFV?=
 =?utf-8?B?MFY3NnFCYTFnKzBZZDdJQnFvbnIwZm5CaVVxc1JFWW1sSDJpTFNuYUZGV2Fl?=
 =?utf-8?B?MS9wZXVXZGFtYnBnUHRGaTVGUFFibnc2L0xYR3BRdUlERGpNaU5xMitFR3Rr?=
 =?utf-8?B?MEdydEZhY3BBVi9wMnRRN0szNElSYzh6VWJURTRVY1FjOFpQTHBIaTkxV0hM?=
 =?utf-8?Q?X7kwcvilLEvYz?=
Content-ID: <F6706002B9B1DA40B54EE63B73F8BE77@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fcb097f-0f0d-4912-bfac-08d9623a2ef0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2021 11:20:28.3271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: isyoZ+PW/AShhIC8Ntk1wozns0dYgFMUjS1VvDEH7Y1lLDlo1miuBCWqzyGM3gdd7wExVZCFhOlb6r+jNz8/3dnvDmFyeSBeeX/F4ajNdP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4594
Subject: Re: [Buildroot] [PATCH 2/3] configs/acmesystems_*: bump
 at91bootstrap3 version
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Ludovic Desroches via buildroot <buildroot@busybox.net>
Reply-To: Ludovic.Desroches@microchip.com
Cc: thomas.petazzoni@bootlin.com, Eugen.Hristev@microchip.com,
 biagio.hkr@gmail.com, bonet@grenoble.cnrs.fr, Nicolas.Ferre@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

> 
> On 16/08/2021 14:04, Ludovic Desroches via buildroot wrote:
>> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
>> ---
>>   configs/acmesystems_acqua_a5_256mb_defconfig    | 2 +-
>>   configs/acmesystems_acqua_a5_512mb_defconfig    | 2 +-
>>   configs/acmesystems_aria_g25_128mb_defconfig    | 2 +-
>>   configs/acmesystems_aria_g25_256mb_defconfig    | 2 +-
>>   configs/acmesystems_arietta_g25_128mb_defconfig | 2 +-
>>   configs/acmesystems_arietta_g25_256mb_defconfig | 2 +-
>>   6 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
>> index 00b99c0ad8..f8129f3780 100644
>> --- a/configs/acmesystems_acqua_a5_256mb_defconfig
>> +++ b/configs/acmesystems_acqua_a5_256mb_defconfig
>> @@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>>   BR2_TARGET_AT91BOOTSTRAP3=y
>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="5232adb1c42636e1e9cf495a6abd1a8d66475f83"
>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
> 
>   The point of having a fixed version is so that we are sure that it's only
> updated after actually testin on a board. If you make such a wholesale change, I
> assume you haven't actually tested it on all those boards... So you could just
> as well have set BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X...

Right I didn't test it on old boards. I discussed with Eugen, the 
maintainer of at91bootstrap, the need to release a 3.8.x and a 3.9.x or 
not. 3.9 and 3.10 are about support for new boards so there is no 
compatibility problem. Nevertheless, it's true that unless it it has 
been tested we are not 100% sure...

If we set BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X, the risk is 
higher as it becomes a continuous risk versus a one-shot risk.

I have no strong opinion, so if there is a preference to set 
BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X, I'll update the patches.

Regards,
Ludovic



> 
>   That said, we really have to do this because all the defconfigs are broken at
> the moment, so applied the series to master, thanks.
> 
>   Regards,
>   Arnout
> 
>>   BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-256m"
>>   BR2_PACKAGE_HOST_DOSFSTOOLS=y
>>   BR2_PACKAGE_HOST_GENIMAGE=y
>> diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
>> index f4af2501b8..e399d4a9ff 100644
>> --- a/configs/acmesystems_acqua_a5_512mb_defconfig
>> +++ b/configs/acmesystems_acqua_a5_512mb_defconfig
>> @@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>>   BR2_TARGET_AT91BOOTSTRAP3=y
>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="5232adb1c42636e1e9cf495a6abd1a8d66475f83"
>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>>   BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-512m"
>>   BR2_PACKAGE_HOST_DOSFSTOOLS=y
>>   BR2_PACKAGE_HOST_GENIMAGE=y
>> diff --git a/configs/acmesystems_aria_g25_128mb_defconfig b/configs/acmesystems_aria_g25_128mb_defconfig
>> index cf62b5b72e..8bc8c4dcef 100644
>> --- a/configs/acmesystems_aria_g25_128mb_defconfig
>> +++ b/configs/acmesystems_aria_g25_128mb_defconfig
>> @@ -29,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>>   BR2_TARGET_AT91BOOTSTRAP3=y
>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>>   BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-128m"
>>
>>   # Tools to build sdcard.img
>> diff --git a/configs/acmesystems_aria_g25_256mb_defconfig b/configs/acmesystems_aria_g25_256mb_defconfig
>> index 496ccd6853..d161b118ae 100644
>> --- a/configs/acmesystems_aria_g25_256mb_defconfig
>> +++ b/configs/acmesystems_aria_g25_256mb_defconfig
>> @@ -29,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>>   BR2_TARGET_AT91BOOTSTRAP3=y
>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>>   BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-256m"
>>
>>   # Tools to build sdcard.img
>> diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig b/configs/acmesystems_arietta_g25_128mb_defconfig
>> index 17ef7e757c..62bcbd44cb 100644
>> --- a/configs/acmesystems_arietta_g25_128mb_defconfig
>> +++ b/configs/acmesystems_arietta_g25_128mb_defconfig
>> @@ -29,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>>   BR2_TARGET_AT91BOOTSTRAP3=y
>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>>   BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-128m"
>>
>>   # Tools to build sdcard.img
>> diff --git a/configs/acmesystems_arietta_g25_256mb_defconfig b/configs/acmesystems_arietta_g25_256mb_defconfig
>> index aa0236bbb3..94258444a2 100644
>> --- a/configs/acmesystems_arietta_g25_256mb_defconfig
>> +++ b/configs/acmesystems_arietta_g25_256mb_defconfig
>> @@ -29,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>>   BR2_TARGET_AT91BOOTSTRAP3=y
>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>>   BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-256m"
>>
>>   # Tools to build sdcard.img
>>

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
