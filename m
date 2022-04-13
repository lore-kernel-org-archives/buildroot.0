Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A59C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 07:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66EA160F33;
	Wed, 13 Apr 2022 07:55:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QDKUwLyDbo5S; Wed, 13 Apr 2022 07:55:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7263E60E26;
	Wed, 13 Apr 2022 07:55:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 594421BF4E6
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 07:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5521660E26
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 07:55:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SNyCWc56J_Sd for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 07:55:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 730A860C03
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 07:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649836501; x=1681372501;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iqfPyVl8QnDF2ZDnGIFaurhtPaaFNYJXkKiXViF7kqQ=;
 b=dRiFKGObRrzzkG1NAK1YWzADLHkQz/KkpTMS7zGfL3cEd6n5WdkZ22+t
 670ZB3PBm/kYGDX7h+FosabcNWz/8sj0g0VNJPFBBrcOwmfmUx6ZadVsU
 9oWQRbjvd+06ecGKI82jMjnB0s8rlefuzRiN24BQVaDO5Lhp66Gzztusa
 0uiUpdYRRSOeHNwNzzZaAYlHsYGqlf82kplnauZ8c9zOFW+iIzePHeO/P
 HP6IhwI4I9uy5MAbKpZeEkOdnflzDWIffjVZiZhXSMzU6uszNevX8yHhQ
 rueOqEx18Z6Y6TeR4nbs+AvR2jR9Kka2QWM1w1HYkInmU45+PnpavX8Pc g==;
X-IronPort-AV: E=Sophos;i="5.90,256,1643698800"; d="scan'208";a="160363699"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Apr 2022 00:55:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Apr 2022 00:54:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 13 Apr 2022 00:54:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ViluNwnhwrosWkTY5t0y8nIEDflTWAdyfaI5zK1xwSyG6i46sttuOmtvPY7xbWBKO5XZN2YtNTkDwNY4HYPDKx/nH2GWwrzuFLjZOdB1CIxthhF1tlP7TrOrmc3qlOTALLXPjTo+JvWGkVBn3RAaC4KSBiBBCrnXQAe/9N1cqOvNeGTpKANAoYImRHaQ3esSiUg09VhmDIvXhhE41coLXeFzVXT0PBLppuHGZAVqQW0fRjaAfcsfTmCs7WxqtfBOmqN0yByQNootdkWbzaNapvj7438dqF8X5XiHvq4XO6iSkdoFf+WHEhfl0mXjmftlInyfXdW9/nm5D1xrSqbpAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqfPyVl8QnDF2ZDnGIFaurhtPaaFNYJXkKiXViF7kqQ=;
 b=YM8runluUvyZ05im9gyyyGXg/xXRTd3i9XM89WhN1bwoJxGVFbx5q29QaflgIUVNdO1Hcf5p82ds6gybv3p2KZXDSZzxc9+XvjjKHPHlzy4iXW2Aw9GqC+CpLFMF8XX6TyJpmQZhBQjSk3O9cfFxtKo7csxcG5uds5zqr3kBbCeWar8LAeCJrzWgurAd+Sj3IE1GyPFzhU5qVj47roxw4trVhW+umQpvOMP0JqMEo99OzyuUlBuIu1W6I3ikGOQQZ7f54bBfQ1kKEW1McK5MENkxHKAPlFAPvpj9EeW6N1q6exzAXVUrXZvcWn28Swl4e9kRumxok0rfVrHAbXKvHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqfPyVl8QnDF2ZDnGIFaurhtPaaFNYJXkKiXViF7kqQ=;
 b=lKdiuG+arThzgPe6K5ME1JFty6gB8FI4q+EA80rPGGPb7YgR3zvlS5/MyBFdlQVj3hyBlfBsMUMA84fISjMBZHQUTjrwJsUZ6zwhwEly3lfcxxzJUCAaYqlurrsale92HDvuZUtY2xZCE3josiedjvBeB0kTQ9NwTsLqfqsKyOk=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by DM6PR11MB3771.namprd11.prod.outlook.com (2603:10b6:5:13f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 07:54:54 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2%7]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 07:54:54 +0000
To: <fontaine.fabrice@gmail.com>, <peter@korsgaard.com>
Thread-Topic: [PATCH 1/1] package/dhcp: use internal bind
Thread-Index: AQHYTmEZ03FYkSO1E0aa3ZrEpJPiy6zsKDSAgAAOXOOAAF/EAIAA5G6A
Date: Wed, 13 Apr 2022 07:54:54 +0000
Message-ID: <8d53da79-2a90-8649-6f46-22b33b7bdbe5@microchip.com>
References: <20220403100318.2581647-1-fontaine.fabrice@gmail.com>
 <8735ims60b.fsf@dell.be.48ers.dk>
 <d1a1ead3-98a8-35fe-4c4c-e7fd3f02e058@microchip.com>
 <CAPi7W81VbAArhoyDEJrNMeseVXgmJzu2+K39njx1j5y3_5mb5g@mail.gmail.com>
 <8735iifser.fsf@dell.be.48ers.dk>
 <34fddc8f-8710-65f9-330d-81fefe64354a@microchip.com>
 <87y20aeb04.fsf@dell.be.48ers.dk>
 <CAPi7W83dikm9d7KWjKfqYwr7mP3U4WzAzdw6iLF6gmOkTgwB-Q@mail.gmail.com>
In-Reply-To: <CAPi7W83dikm9d7KWjKfqYwr7mP3U4WzAzdw6iLF6gmOkTgwB-Q@mail.gmail.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b9c7176-3b39-40ae-f6ea-08da1d22e589
x-ms-traffictypediagnostic: DM6PR11MB3771:EE_
x-microsoft-antispam-prvs: <DM6PR11MB377176229A3C9B696D71E1AEE8EC9@DM6PR11MB3771.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wJBuNEEEqCSPRKAiWeru6w6RVIulDlE/vW/SW1vTJvQhisWw1fQwBVJLbC3rjokAegYMjC/hxjE+blwr6/7z3KJT6BzWJ4XBDDnrnUYlLG+ndRwPCyVT2qtOfOoCFpXgXaYSY9AfORLIOHDJSyxxWjHbf3MoItWnkdNzPw36D7KbQFKAsLnuhUSb3CG4+ggKjypo6/EHrUAtpceEEjXvdNw6T6l0vdxZGRbBdCzMh3V9hsKYR11BxDXkPURj5Yefarfl7go9ygQzKsGTk7KFurRXPIZMWUtFkCURrRmQKbZ7futhN+NWRTTKuMB+Yt25+68a8V+pi27nfnN0BN9FiUiZrPtnc1cs5duipubD+PgAzHp0ggSVu0XdvpwmOPwn1qnbrYEYWf18uEfiQD/N5i2b201Xp7MM+FllqFDGBDKSkX8M5CERmA8gRGS1TTbJ7PYoltSdmlz3zcwGPJoQWZFFJsNvA2/6fwQcuePT+E/EhP++EU/PuND+yashfeoxHLGTgA8zOox211kwbq347zcqG1r3/x4RbEFyXSF08AXG6Wuuon58RdP290ot9bSnmuNtm3EHVc3dirK61zug18zeu3xKZcWlKObhzy8REnnKOePOiLmNxj7C6YedyaH6S1p8U+VQHQmkGXfXVnwSVWKs27qckeMJDEKs5wJV4Rsv2KafVK4OddUmBRZcM+eM4fACKS61JwL6voUXBwHao8xEjjPSQTru9Q6HbbQSe0XbprDopwBhGE+V1kevlh87hKfayxSmZXZ/u1Q9XQfjw8b/VqMq5my5idf4QSDp7ZBZ4JJwGAJCLiNQbcT24OwE6UyaWc0ORrbHiBXyoZeGjdNC0VO29gF30sS5jS69zIA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5384.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(86362001)(38100700002)(966005)(508600001)(71200400001)(122000001)(6486002)(8936002)(6506007)(5660300002)(91956017)(8676002)(316002)(38070700005)(66556008)(66946007)(4326008)(76116006)(66446008)(64756008)(66476007)(26005)(186003)(110136005)(45080400002)(2616005)(53546011)(6512007)(36756003)(31686004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkpzM1JyWm5GRlFQM01WczlXbk1rZVFhWjh1eDkyL0ljNE02WHBNUWdnRFE4?=
 =?utf-8?B?WUc1emtUM0d5UmJodCtrZXZOTWQzclNjc3NMTklYZEpjK1p4ZGZmbzliOXlM?=
 =?utf-8?B?OFRLajFUN01zQlNwQWlxWlFaMGQxRFRFL21GT3JLY1ZxWFBtK09rbHNqTTN0?=
 =?utf-8?B?TGF6R0Q3THlKcjZHaWVwaU5YRkw2TkgrY0JuN0IvR3hmOWk0WjFUUTQxQ25y?=
 =?utf-8?B?MG5DWDg5bHk1cURpejlUd1Q3Z2F4a0l5bDdKUDNjd21jVktoUWpxc25RV0o3?=
 =?utf-8?B?dHB1K2Z3eGN0OGlwTzlpTEhWa2xuVVRNcEorYmZCdFY1cllxTDFKSWFGZzhP?=
 =?utf-8?B?STdnMm1pbVRZRGdOcmZ6TENLbzMwbDg0TlFNQTlmYkdORHVSQ2lqWHdqODc3?=
 =?utf-8?B?Z3ZBTW0vS0s5UW80VDIxWXIwdCtpSWFlZnI5TnlmcmxMMlZFMW01d05jMm94?=
 =?utf-8?B?TjdrMkZBY0NYRDZKVUhjdFRaNXJmWUpCQUJZVVJxMkhpQnRjUXpiVzhWSDVs?=
 =?utf-8?B?ZW9xckR6QlBhdVkxaUg5akZBSlI0Z2NwS2lFeXFvaGFJVk1FVWpDbWV3YzJ4?=
 =?utf-8?B?Q3dwSHpuTG4yQzYvTU44bUVZS3dobFpZeGU5WUhqTVc4VHVHZFA0dXpiczFV?=
 =?utf-8?B?Y0JCSFVDd2ltKy8wbGFxRWZ4Q0dNU0YzMjJUYWpHRVczQWNtSkhwRm5oUnJQ?=
 =?utf-8?B?dHJzNVY5Slc0cnlnK1NiejE3d1F3WiszZWlpbnpyb2NGSXZNS0ZmbXFqZGdU?=
 =?utf-8?B?WnRBNXJoYkZnaVh4V2hhcnljb3RpWEhlVVdyb0hMalRoME1taklhckFIN0Jv?=
 =?utf-8?B?bDl0T1BweUM1dFQ4OENzUjFRckZybEhtNEs3Q0dDRUZ1MUhPNXI0eEt5ZzNZ?=
 =?utf-8?B?b2syWkFyQ0FjS3h1REJxaGZBUG93Y2xQdnlhTHNManAyZUwwdjZWT0xHeDBr?=
 =?utf-8?B?NE13bk5tRlR1L1g1MENFdE81dVE2R1c3TExBQXQyRzRBakZoTHNVU091NVc1?=
 =?utf-8?B?Q1ZxTG10dFh6Y3MraERWV3k0TFpQM1lQQlgxMVFWU0lyeXlRYTJwd3VzV00w?=
 =?utf-8?B?THpiZkM5ZWl0TzVQRVZCc3lXSG0vUlBJRHc0T25PcXZSeFcwSVBJU1YzVG1h?=
 =?utf-8?B?SldrS3UxWGJjazNCb2RlcXdFcHN4MW1QeHR0dlQ2TU80T2pNcFdRYjJJaUp3?=
 =?utf-8?B?bUk4N3l0c3VWZXE1c1hEY2NKcVBWbVQ3WlFmQ2xNa0d6U3kwTzlTUlF3aENM?=
 =?utf-8?B?SkxYcW5MR3FCQVE5UUUvS2JJRW4zMlFITWlFVnp6NGh1OEJTVi9DYmZEN3Rw?=
 =?utf-8?B?eFdYM0h5N2JFS1ZseW9KSEo1NVNIOXFFMWdudS9CUTZwNkF5SGt4UDI3RStI?=
 =?utf-8?B?SElsNkpRM3FrYk9mM2VDR1VBQlIvWDlHRitQNnQ4NnR6QWVaRlh1NXp3Y3l5?=
 =?utf-8?B?eExLSmFaNTI3SmxRcHJYQlRSTXVZbzY4byt1MmRucDl6YWVtb1RHVkR4cTlx?=
 =?utf-8?B?ZjdjcG8wSHg0MzZWMk9xckVibFRXRS9ka25ZRk5wQUJMNldZc1pGMjhnbFdt?=
 =?utf-8?B?U3FKWVFuUk1GVnBOT1NGbzhoWHJqcnR4TVdJWXZDVWxPdUtoNE9IRkFxN1NG?=
 =?utf-8?B?ckROdWtCUERDNHJJano2TUhoc1YwL0ZRVmp0dG95b3pMaW4rS0R0aHpHb2ZX?=
 =?utf-8?B?Mlh2QUNLaXdaSTBCVExRWVM2OUYrbVp2TDhBVW9iTXZHZXo0aExlaHVNOUF6?=
 =?utf-8?B?RmQvME9xWlhQZndYdHJVYStJR0Q2emZBRkxFN1d0NkRaSUd1T0Q3NzhCY2h6?=
 =?utf-8?B?Z0x6NFNJS052SzB1NWp2ZFFBdExXcHNDaVZ1S3h6TWkwZ0o2V1dTSjYweStl?=
 =?utf-8?B?Uk52NW1tek5HQnN1SWRFdDRmRHZXVGo4WE1KZDdTMTdaVTFzTWdJLzIyY1d6?=
 =?utf-8?B?NE5sa1hJZTUyVWh3dHN2Qno1WWxvMTJ6RThlVG54Q0ZYWk5aZHUxWHVPa3VM?=
 =?utf-8?B?Y3FKOEVzY0krRUkwY25MV2R3dTJHNUc3WUxZSDNCa0V1Qk1JZm1yd0VuTm5o?=
 =?utf-8?B?cGY5VFRVbkRyMWcwSlVyRmRLU0hSQ2gybWRJYXh3Zld6QVFxeVB2a3lCSUdX?=
 =?utf-8?B?WmtORWVhbmNiRUUwbHpGcmJ5VUk2MDRPeUVWMVJJS1ZhWTZpVms4Sk1MUEhC?=
 =?utf-8?B?ZkdESFk2aUgvcFN3bVlEWUR4REQ0QzlhWFRvNXZYTkJpVzdlYVNJdldueDcz?=
 =?utf-8?B?SDFmMHBHSXVVVWNYVWJ3QytnemNlMEUyMXFBbXFuYXZXRldRa1IwcUxxS1E5?=
 =?utf-8?B?MU1XU2wrWGczRzVJVEJGVlpSWDRQTTJqK0RGNGF5N1ZYUFBnSi8zbHh6V21W?=
 =?utf-8?Q?2gsshL2Gqzlyialw=3D?=
Content-ID: <901EB77563E26B48A2DB75F0262EE931@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9c7176-3b39-40ae-f6ea-08da1d22e589
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 07:54:54.2214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SAbQIeGeK1xouJlO4ROyrDlWnzm8qO4+cK/qBg+6iWHqR9BL7yHD1zjFkJBqV7BDdcwjY+WzMFiDElpliHPZdR1iyO+8IBG38xoTOfdlY+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3771
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

T24gNC8xMi8yMiA5OjE3IFBNLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOg0KPiBMZSBtYXIuIDEy
IGF2ci4gMjAyMiDDoCAxNDozNCwgUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29t
PiBhIMOpY3JpdCA6DQo+Pg0KPj4+Pj4+PiAgICA8RXVnZW4uSHJpc3RldkBtaWNyb2NoaXAuY29t
PiB3cml0ZXM6DQo+Pg0KPj4gSGksDQo+Pg0KPj4gICA+PiBZZWFoLiBFdWdlbiwgaXMgdGhlcmUg
YW55IHNwZWNpZmljIHJlYXNvbiB3aHkgeW91IHVzZSB0aGUgZGhjcCBwYWNrYWdlDQo+PiAgID4+
IG92ZXIgdGhlIG90aGVyIERIQ1AgY2xpZW50cyB3ZSBwcm92aWRlPw0KPj4NCj4+ICAgPiBIaXN0
b3JpY2FsIHJlYXNvbnMsIGFuZCB0aGUgZmFjdCB0aGF0IHBlb3BsZSBoYXZlIHdvcmtpbmcgY29u
ZmlndXJhdGlvbnMNCj4+ICAgPiB1c2luZyB0aGlzIHBhY2thZ2UuLi4gSSB3YXMgdW5hd2FyZSB0
aGF0IGl0IHdhcyBkdWUgdG8gYmUgcmVtb3ZlZC4NCj4+ICAgPiBXZSB3aWxsIHRyeSB0byBzd2l0
Y2ggdG8gYSBkaWZmZXJlbnQgcGFja2FnZSBpbiB0aGUgZnV0dXJlLiBUaGFua3MgZm9yDQo+PiAg
ID4gbGV0dGluZyBtZSBrbm93Lg0KPj4gICA+IEhvd2V2ZXIsIGlmIHRoZSBwYWNrYWdlIGlzIHN0
aWxsIGluIHRoaXMgYnVpbGRyb290IHJlbGVhc2UsIGl0IGhhcyB0bw0KPj4gICA+IHdvcmsgcmln
aHQgPw0KPj4NCj4+IFllcywgdGhhdCBpcyB0aGUgaWRlYS4gSWYgaXQgaXMgZGVhZCB1cHN0cmVh
bSBhbmQgaGFyZCB0byBmaXggdGhlbiB0aGF0DQo+PiBuYXR1cmFsbHkgbWFrZXMgaXQgaGFyZGVy
IHRvIGRvLCBidXQgdGhlIGludGVudGlvbiBpcyB0byBmaXggaXQuDQo+IA0KPiBUaGUgZm9sbG93
aW5nIHBhdGNoIHNob3VsZCBmaXggdGhlIGlzc3VlOg0KPiBodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIwNDEyMTgxNjA3LjE0NTE1ODAtMS1m
b250YWluZS5mYWJyaWNlQGdtYWlsLmNvbS8NCg0KSGksDQoNCnlvdXIgcGF0Y2ggdG9nZXRoZXIg
d2l0aCB0aGUgb3RoZXIgb25lICggDQpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2pl
Y3QvYnVpbGRyb290L3BhdGNoL0RVMFAyNTFNQjA3Nzk3Q0FBRTgwQzk4NURDODk3NjMzNUUzRTc5
QERVMFAyNTFNQjA3NzkuRVVSUDI1MS5QUk9ELk9VVExPT0suQ09NLyANCiksDQoNCnNvbHZlIHRo
ZSBidWlsZCBwcm9ibGVtIGZvciB0aGlzIHBhY2thZ2UuDQoNClRoYW5rIHlvdSAhDQoNCkV1Z2Vu
DQoNCj4gDQo+Pg0KPj4gLS0NCj4+IEJ5ZSwgUGV0ZXIgS29yc2dhYXJkDQo+IA0KPiBCZXN0IFJl
Z2FyZHMsDQo+IA0KPiBGYWJyaWNlDQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
