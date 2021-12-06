Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99981C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 07:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4D4E40459;
	Mon,  6 Dec 2021 07:45:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wk5mfsQeXBTn; Mon,  6 Dec 2021 07:45:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93FD240469;
	Mon,  6 Dec 2021 07:45:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 78F151BF983
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 07:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74C5F403BF
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 07:45:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com header.b="bWU/mcI8";
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.b="iGoQ28ie"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nju7FOdJhxI5 for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 07:45:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F2D6403BD
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 07:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638776737; x=1670312737;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0/An8Nvd0yEUCgh+/d+hTYEi360IRObVW6RNO1lcr0M=;
 b=bWU/mcI8N8AxTnArnYzzYK7RavOA2zaD+h99ElH+mI7Quvg7w0T/LawI
 jNhSkI2dQYNITWXu8gysCC505s1AAPaLS29WR7efjLBMg7uipGCPpXZOi
 mc5CB94JZuXg3Mu+y4kv9HyQVDIgPlY7gD67t2EgleKei9FN9jMOabeLr
 TocnVNwd13lLE+I6uhpFRLD62fD6X4Zct6jXE4ihvOoxAiTcqVLodP96Y
 JYy7XUBFljTfRMvM20u06JdeoioJB9rFFtPOe5U0Fifswuu++OXKr30hH
 k7EWsQcBpOGgfoz0rfAUpaVIffoDuDViuP2UGVkwE/VwGOzsiDYlr/E/w w==;
IronPort-SDR: HBt9Cg/HvQv8LcFiXUhSWoVusZksLKBiEUvyFyNWU4tXHR4wyyQ+Oqu0s12GKNXLbTFhKktQAQ
 E8Q1eJUR8Ue15lytZ6CYRN5GhoplU+x36b1GPi/pEYuXMJsbs1FjJxOz39ymgY6tq9xIDlubNh
 WwRmsLrtK0VYmFmu+KG77f2ZFevB6ycif7uE8gWVd7dCF+TblhR9GwjlakMxts5HCbZFjPQvIw
 CG/GjajWvtxmy6CTYiGs8A4gb17gcUJwDx/3/Nm8/ymSZafKYZrsLtb2ZivhcYQPXYBB4hj2DV
 seJplzRwh/XYLb51KcRaLREd
X-IronPort-AV: E=Sophos;i="5.87,290,1631602800"; d="scan'208";a="146180809"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Dec 2021 00:45:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 6 Dec 2021 00:45:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Mon, 6 Dec 2021 00:45:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1yEL3AUPo7uI8tUkLBKfDxsU5ksnG+6MYMnts5N7aDoVMiZx0Wx+4tkt6c9crNzmi0V51PiHgAmRwfaAdk6A8kE+WitqeUUJsaEcR8/NWtjT4+Uj10cGM/Hyfh9b2X3wfMaHzl05AGZ6LJaJIk0EFWcyQQW/P9nkN62HZMDueqNt/cFc0CLZVzcJ5MTo7A+9mBFMVtHmJyt3jvl1B74kAOW8d+iDg2hmdU89JHJNOhBo6DItBcdK7C03qlc/2c/RzBuRbhKZ27u1QnREpFUrcInfj3qX0YtS2yhZ0cW0yZIORh4Mvxx6gfA30TbXbHiHfE0ibDaHo9gUpIV4EVeNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/An8Nvd0yEUCgh+/d+hTYEi360IRObVW6RNO1lcr0M=;
 b=Jmq6WK7glvFjcccm89DqKDzOdCCBSXwaZQsB20iVbOSwlQaJ6etl20bikBA2A+KmfeXcZPjKjHRx/NFoStaw3m0wmqkl8ex6I0+nemTzVJM/DyuZ7AqpGXrUygdFIG0sP9OSLYnKqD+Ak2y7FZGwXlF179nvd/82axY5hmNb/5q4tIObRh0HfTrR3p8f8ECDxt0eo04o2+c31YK6NRAknXMr+BruRiBqJAtTYYLdqNtJQY/lsD7wdzkE2ukE35NJDHb5H4wAH5OSzyMnrorKQO02yYaurhDNq7BP+R+0fAjPerqDL1Y3S/nnRxJlvqwwIOf3HFfyhL3GFqCKJxfmMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/An8Nvd0yEUCgh+/d+hTYEi360IRObVW6RNO1lcr0M=;
 b=iGoQ28iecwrlAoDl+rAcz32YilMx7bvmmgv5wJ3VYxeL1bY3p8sxbT+AmBEmAWZPg6lF5Fk6Q/T4GWudcbCVJXm0NW0M0OX3533QsZ2NmYSBjT02owmGeTDZhvmCscsecisYW6wY9Gzv1S/aj7kC0TcX6Yx8fc0FsdZLC5aCpbg=
Received: from PH0PR11MB4920.namprd11.prod.outlook.com (2603:10b6:510:41::22)
 by PH0PR11MB5144.namprd11.prod.outlook.com (2603:10b6:510:3e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 07:45:33 +0000
Received: from PH0PR11MB4920.namprd11.prod.outlook.com
 ([fe80::1433:9dcf:4912:b8f]) by PH0PR11MB4920.namprd11.prod.outlook.com
 ([fe80::1433:9dcf:4912:b8f%7]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 07:45:33 +0000
To: <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH 1/2] configs/microchip_sama7g5ek: add new defconfigs
Thread-Index: AQHX0Y/6skDGodrkkk2Ca0cSz5//LawlR14A
Date: Mon, 6 Dec 2021 07:45:33 +0000
Message-ID: <6f7a0f33-05f5-e4ef-a92f-f4b7c08c51ca@microchip.com>
References: <20211104152329.1560933-1-eugen.hristev@microchip.com>
In-Reply-To: <20211104152329.1560933-1-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 599ae66d-89b1-4960-ba46-08d9b88c6252
x-ms-traffictypediagnostic: PH0PR11MB5144:EE_
x-microsoft-antispam-prvs: <PH0PR11MB5144FB4F61E7207F2761385AE86D9@PH0PR11MB5144.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iYZz59tAlAPg8lRiqFCtqDM3lqJlfVv6+IBj9ZXvitMWpRUvOZ4nF2FajzvQDNjMlZ0swgWCv//m7yHrEQRKes8N2A1eUo7wGUUlLCfFh1oME8DO7+90L01lNs+88abmshD53TAY4YX7wOll9GJ7QYFk+E2J0ztlKNXFiEXipw99PGPw3e1ZopyLuNFe70v3loZUKTh6G/523Fze8Ad7o5/vWSD3tnniw/fJI6+bamBc4nmYf01v17v9YGZoPq3AIVJ5RKf47yDg/vvf3h5cS/2m4H/YiEARAvDdKBfPJZN1lrDyP7mQSNWjXpnj9niyVjxOsMSKR7Vif0wvCRMiEqib5dkgm03gTVQnSnldJvILchyWgXtLM5Pe5P/XEJ3AUenKmEesNh61GuDt9432axsOzoAqSnB9g9pLoe7ME9V+X5tNedObtwpQJyPzicDEdkRL/K9a31M2dkBSc4WvQNcjQsNp8+mkEZnvsgeO0A4QaKKlSh7lLxYqesO6KOGK9s97rG+f0YcpIfTct5/ON0qGaNHCZbyZD4Ps6+pJ1BztZrm0U9QlL56gIWCE/pRdCi7nA8a1MogC3O28y2DPh5xRhELxcAFYiQXv/6jiXfIBaHNr0a4hdXPmwWpf1bcozgRMZRyhyONZZNdD6kZC5liJgNnnesHpyzCZradagPORoCzok4TIq6NhO+pQ9FmX2ge+W5P7ZcUoD/s300xpHQCbMXNuoJdjnrpAq4xdZan8MFS7EqtfTd0kRwRTzv2iE5zPE/DT/jX35+mEJZq9mtDcSFo0uXbnMSQWUnxIo0Nl15AX/UF9qRztqvtPfzZW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4920.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(64756008)(66446008)(6916009)(66476007)(38070700005)(66556008)(38100700002)(6512007)(53546011)(91956017)(76116006)(66946007)(4744005)(122000001)(8936002)(26005)(36756003)(6486002)(186003)(5660300002)(6506007)(2906002)(8676002)(31686004)(508600001)(31696002)(83380400001)(316002)(86362001)(71200400001)(4326008)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3pTSVZCRnhaZFJ0b2JxUnRaVzBuRkZtZ0k0R1FGV3pxSkVlYzZPMlZHdkZq?=
 =?utf-8?B?bnR0eUNFUG1KbFBSQnRNcW5WSUh2Vk9LOUVNRTVPdjJjYUl1VytwRHhtRUxF?=
 =?utf-8?B?M0hWbjQ1ZnM2eXNaZHh2bW1DVTFzbC82cUFpVDJZRmd1c1QrK01Oc2ZEYnBr?=
 =?utf-8?B?NS9tSXdYay9WdWE3bDFidlU5QVBhZ2l1ODUrRkJCNCttN0ZrYjJvanV4NzZx?=
 =?utf-8?B?Q21rVlBzZWlYYzlQZnVPUWdJcEE5U0RzK04yaWphUTBncnV2b24xSWFZWjlo?=
 =?utf-8?B?NUdqbHFoc2o4ZUhyZk5vWW1PbTgvNjRHWjViMTU4dFhNQjJERFExS05ZUkJm?=
 =?utf-8?B?SlZKa0J2UFpOODRjZlFQZWoyMFlaTUIvMWoyNlBQNDBNeTZCYVI5M3VsSUkr?=
 =?utf-8?B?NWtjcElLaUdyRjhMQzJXamFFQ3Nsd3FIdUo5NFZkTWZsaUVuL3ZlYUJ3WjJr?=
 =?utf-8?B?Z01QMGF1UjAzbGxFTXFPeER6WGozQkJtcFBsanpOZnVpWGxTNGVoRk8wU3My?=
 =?utf-8?B?VFFId0luNHluRUtBc2E5Y09mK2pvSkprSVhBS2pGaGUyNmdjbmhnYStJMy9p?=
 =?utf-8?B?N2dzQ0REOURjWFdCTzBaa3J0eHQwU014M1lLb2dPY2RNUHRmREd5ajhZTk1l?=
 =?utf-8?B?cmpodzlVOG1vS0lGTmR5NWJSU2ZHQ3F0YUl3dVdnVkRxYkpvdjdJSlpxYThB?=
 =?utf-8?B?aTBnK1VJVTU2dTZzYTU3S0N0L1FDWG81cXhmQWZmSGJRdjJYd1lkMnNvU3l6?=
 =?utf-8?B?SVpSWWFETW1YUUd4UHZid2RkRElyYno2eUEvL3lXVTNUalZNVjVpZnBjaDFY?=
 =?utf-8?B?dGpUZEI1cmp3empCN29tN1Nyalpsb1VzZER5UXVTa3RwSC9IVVgxL3VpaDlI?=
 =?utf-8?B?SjJkT05FTHcrcWJOV3RPODdoVnVwYnZPZnBOSUx4OHNSWHM3T0FiaURzaytC?=
 =?utf-8?B?NUJod3RyalZ5aUVwUGNzY0JtVXRMOEdWUlk1MG5heUhFWCtrWnBuVkwyVDlh?=
 =?utf-8?B?Q09oN2l5UFFRb2c4alBWckFTV0o3Y09mSzJ4a2Y3SkRnTGpJeGxqcElmdGpE?=
 =?utf-8?B?Y3JpQkVzUnNnY0c0WjNraEgwMjlDU0M4ZTN6WFh0R3NBd1BqZ0prRlVQSGY3?=
 =?utf-8?B?UTdMZTB5OHU1b1BubE55RFZNUDhYQnl6bndIYmNUN0pOMWpHRXlrRWs1UUFF?=
 =?utf-8?B?L3NYQmR4ZUVRVEp3aFF5cGhpd2pGa1ZQVEZKMW50TG83K2VBRjVFcmpyek9t?=
 =?utf-8?B?TjJMbnRlRlFGQmtXc1FTU1Z3NFNsdlJlZ0lNMlNEaEVEVW9ibHRGN1pvRDhD?=
 =?utf-8?B?b2xkWTlwUis1V0d3TWwreVIya0V4dGx6bU1meCtFT0ZlMVNFckcyTDZYNmNF?=
 =?utf-8?B?MDZldTJmLzU0MmVNZVAxaXJsY3RGTURwWDRqR0RYWUFLczdyQU16a3RKTU83?=
 =?utf-8?B?Qzcydnkxa1NvdTFlUzdMcVllMnMrc2Y2S1hLYkp4WHJJVFVEekRXWUwyMWRE?=
 =?utf-8?B?ZWY5L2FXWU04U3lqdC91OFltUDZaVWc2Smp4UW00RlhteFZRa2NJdW5WcTZB?=
 =?utf-8?B?WFVHVkZSTlhYMGlrV2Z4cFZiVWE3bTN5QncxQ0QrMmIvTC9kUFlxaXVONGcy?=
 =?utf-8?B?TnFTdVM2YWVabzA5SnQ1aHhoU09NNHlaSGZyZ2p6ZHRxcUxCd0JteUM0NWsx?=
 =?utf-8?B?VGtnOVJmVU1FZTh0R2VKOUpUdWxtd0M5a3dKNFdGRWRnclJMVjk3RHRZVk5I?=
 =?utf-8?B?MHAvMnNGa3lHNU9iQVdQQjh2dGhJTWFQbW9rU0o3UDJkbG5sS01Ndk9qck5a?=
 =?utf-8?B?S05OQU1aUHpSOWdVTk9vV0JPM3IxOWRZS0V1cHlBZlUrRW5TaEYwRGJ6Y2Er?=
 =?utf-8?B?OWgvbjVtUnk1NSs3N3UrUTYrbE5jMU51QVl3RU5kTkRxY2hPd2dUTmtySTdW?=
 =?utf-8?B?Y0xjb3ljWVZqR3NIRHFSUFQrcFJwdmxOMmNOU2puR1E2aTF5Y0VmQXJjbVhS?=
 =?utf-8?B?RDlNS3Z6R2pSbi9HNys1QTNjRGRaSnFsTUduWGpISnRSbVJnWFNXN2pwUDla?=
 =?utf-8?B?TUFqbVZjT0pDQzZPNDhxRzRUOXQ5UFlkODhhZlUxYnZTQWRoeGRzQ3gxQ3Y3?=
 =?utf-8?B?RnhWTFBrSWpieFpCZGZrUTFYYTVrV0l6dkY1Z3Z3SmJEYlFjMDB0RWZkN2VR?=
 =?utf-8?B?eFpWOFdhMkxLSUIrMTMwUGZMMFA1VHAvYWpNeit6ejI1V3MzVFBobk93aDJJ?=
 =?utf-8?B?dzNQR3M2Z3lBOUhJWDJtbGdCRjl3PT0=?=
Content-ID: <86D2466D1F261B45AF135F17E3CB937D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 599ae66d-89b1-4960-ba46-08d9b88c6252
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2021 07:45:33.3390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wz2KDF20gWJ+JRMQYnnVRnGhZbQVfHwPDfXNL6vhGHw4zAsUZgu7ymGfEQuGpIeNgTQ2Wd36l1oNiJ6Ll7RfoiIiObNXXn7h4kGti2k/z1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5144
Subject: Re: [Buildroot] [PATCH 1/2] configs/microchip_sama7g5ek: add new
 defconfigs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/4/21 5:23 PM, Eugen Hristev wrote:
> Add new defconfigs for sama7g5 evaluation kit.
> Update README with new defconfigs.
> Board uses linux 5.15 mainline.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---


Hi Thomas,

Will this go into -next as well?
We plan to move to the 2022.02 LTS next year and it would be a big 
milestone for us to have this board for the next buildroot major LTS.

Thanks,
Eugen

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
