Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0579C433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 08:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DBE880C93;
	Mon,  7 Feb 2022 08:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bn3pdFO14W6X; Mon,  7 Feb 2022 08:53:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 872BE80C53;
	Mon,  7 Feb 2022 08:53:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C6831BF289
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 08:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5674F80C53
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 08:53:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aF0zhUD_g9QT for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 08:53:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E63880C32
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 08:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644224026; x=1675760026;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gjmjkfzA11sp431KGQKU4iOSNSl8BWiSfiWssxCtWM4=;
 b=uLcfnJMY9jNs3KqJYp6xNvmUJV/J18MuFCvI3oFEtKJe7NiriSdElLg2
 bcBqbFnYShpEeZttX3HiljIP2NbzkqBymctcQdnO9ZoJOYoT4d1CPGUgT
 4QXbcV2UeFsIQmDL2GwNvh6Oh/DyQ79d7uU22ZL9j+g6eyHTmupQvo9Ip
 zdRSRZnXRSZ73vk5Tu8Q5hq0A63IJJlNZ1wizjD7QtgIZ/N77Uaqvfdlc
 u/HZ1dYUFldVNN7fk/qZh9QndDHXmb2/0RlrTamRvsfH33AY0J7P2CAUn
 RU3kpHFhh/4PzwzwkWxlvO9GnK2U6JUfUlmqBcj2/eVCGa+m/0SyZxWsi w==;
IronPort-SDR: F4dKHN1yr0U9wbrQbYZKXsOex6angurpShqF2aOLDpP7pmLApRZCkKsmSFKhaG3LzgEp5lcfjA
 9YAREz/D1pMMOHsizPyNAf/Eve9nZIreGuiowO5KQL6s4Z0BVCM2sozxhYLwpLWByy5NvWekuI
 cuz5sXLeLMDRH7Sz1L913nxC3ZDvMlhhC/5E8TLHP8pSYkYwz60JFRjly+saKktyXUREzmyhil
 0iC4AgoH5dweSaXnYx6eY3hpMKVgpONL9w1LbwoNfySAWBgPhhqm4LpXdtNHPZiWeQHp/6oGSa
 1fQksmQRQH/1VBCAIOqpXyYF
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="147830082"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Feb 2022 01:53:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Feb 2022 01:53:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 7 Feb 2022 01:53:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nt42PGPssWfBFFVCQtX+doH87FNMkBmh7ZjOKHF71DJn009xPIcmzj1O5gwKVUcrbh12frCV37AjJk+ZjsbZvYdLriJ5KHjWS7kh7FsDD1IOWZDd3UTqskDzNv86Ha+c7CzbxmKgrBHRkv43F/rMb/iSM6Q8f5eLzg768DNoHNjIKbnBHWdmAn3mmnuiZZID+FIoz4yOnCHmJ4yVuXiLvKNdeFx7a8rvypX6RBoGA/kK7UTpWH1I2BxhMEISoIyrS6B6ubgwxcpBtSAGb4JkqY+4dJAk3YDOcDCvocFtAj8g4ghp1HCLv2ky5MdZ1poTFcBf8hkgsY3d8Exx5JQU0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjmjkfzA11sp431KGQKU4iOSNSl8BWiSfiWssxCtWM4=;
 b=TYEOAuO++kBsnqtS8x/4b0a+egnyq+NLY3Tyk4BklyLWAOaPnjDXsaYDVj1/4eAVuuJB5CpKvrNe/chRf8pJGl+WxCykYjutLsYLYmXM0yJg1ygUYllV2MzxsVdM1gei3WgPrjA5rOBFwKAhxrQM7aP/bMi8J1MwqEE0eJ4aLru1GG/qVJnYtzgmdSev02VS8pBjXXPQaB5u9KD6CMHgNhoCeV+xKSlJY9L2gGh6Enw7rmrHUdINxLxwa8YgbrB54Tt55VosUxtHhZZLPPULZmD8dlDefkiT+kaoajTWy4u/OX7iiE+eU5vSaBTvqKW2jA0qAzcyqXjmMc+eJ/mQPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjmjkfzA11sp431KGQKU4iOSNSl8BWiSfiWssxCtWM4=;
 b=eZGAsd/ZvG7L31Pc8WNTJAizdbFJ73hTHRKpHIzFD1jKZRigUPuTw2O+XrAVvA40GvdTBkeZ2y10X+sASpdAX7cHI4c17kkj7wrtwart/BoW0LwKePOJodZ0MLpd9l7AJcVg0mLVAM4uQ0VSnixU9aaLBPONxQfYq11PTspGijA=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by CY4PR11MB1638.namprd11.prod.outlook.com (2603:10b6:910:e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 08:53:42 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc%6]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 08:53:42 +0000
To: <giulio.benetti@benettiengineering.com>, <buildroot@buildroot.org>
Thread-Topic: [PATCH v3 2/2] configs/microchip_sama7g5ek_mmc_dev_defconfig:
 set custom linux version to 5.15.21 and add host openssl for linux
Thread-Index: AQHYG0xnMh07azI7lESuGTLOYMvja6yHycqA
Date: Mon, 7 Feb 2022 08:53:42 +0000
Message-ID: <f3665d60-3421-c82e-e3a3-58cb756c6953@microchip.com>
References: <20220206115156.6042cc1b@windsurf>
 <20220206112620.1637342-1-giulio.benetti@benettiengineering.com>
 <20220206112620.1637342-3-giulio.benetti@benettiengineering.com>
In-Reply-To: <20220206112620.1637342-3-giulio.benetti@benettiengineering.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: faebf47b-f716-41db-a1a9-08d9ea1757a2
x-ms-traffictypediagnostic: CY4PR11MB1638:EE_
x-microsoft-antispam-prvs: <CY4PR11MB16381D84811D2FD8BB160781E82C9@CY4PR11MB1638.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rfFrAz1o5JJLgXv2TEp1dOcMwzddE3LqitbMnLLcK9YcU8f8z7U+520q+SnIF5bXKhcNKyf1STNao1gJqkWCwhWuEKwkxjfgh36juZOFPr7O6GUbE+c+ZMUMPD3B/7d7FmFr5jPtwe3uyBgNUy/F9oqits6mPdEtSiHOuUyvfNK9c9RYTg7ITp690vxPG6MjKMwg/hVEGHila3splvTZdsIpQ1CmaTL4PlDPcfg8JPtU712BDNX2zK7NPL1SC0OlNC93jJue4bWq+V49ZQkQhUdn7KfpQVyjt2Sv8bNq6S04ImX78gcG/u9jf/9UumcyzLRy6A9OAqIXYgHBZAqg3gZyeZvBgqUmvrsnldNlRHWksK/87N+oaKZTCLFSV05yubJqjFxz/lZzE0voTuzm76hVKKdD34qackbDOUd4kFTUpbM6BUwCI00lXZRTtBudsD09LPnu6tdF3pIV75qeJoQaAp45/AAbI+9C9giflumQ/+aHr4iBIxt3K5PciLVhhUGlt/QtgLRE3D201Ov85ya3rH+38wYJzeSDXx8Hup+gGtGslVSiHzGh287DLlXFX9KFYu+utZX2hya7uZ+DzYpw1+b/6G8mNxQ8uNJM5jdbyQ63nmWF7DrW2SFKBzUmt3IdF0wlNOD65w78f6A8/s0javlq9eIUbQtGcrdB7uWEvvqdmxHamkrtgaBePY3jD72jKoolBV99nxj19IwCvCu6KBOdqWg3q7+NrRssKc8By1QZrLJEFZ2gAAymOl/yhX+gg3FV9NK9F/IF40PQ1tkHrIUq7xjeJA96VhVwo3R25WZHsx/YNNMU/qFwmFTGzdY0EtA05kmVHyutarCsz3W2gTbxSphCUgxrh1WzKLw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5384.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38070700005)(2616005)(54906003)(5660300002)(31686004)(31696002)(36756003)(186003)(26005)(83380400001)(6512007)(316002)(53546011)(2906002)(6486002)(64756008)(66446008)(66476007)(66556008)(76116006)(66946007)(966005)(8936002)(8676002)(508600001)(122000001)(6506007)(110136005)(71200400001)(38100700002)(86362001)(4326008)(91956017)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzZQWmdUZE5QNnhFSkY3VENLSUpvbnM2RFNSbnhvdlhYMVM5d1VEQzhWVnJ3?=
 =?utf-8?B?dXdwTXlrWlM1QVRLNUVYMTVpWHNvY1owVDI4UWhXNWZvMHBLQTJpam0yREdZ?=
 =?utf-8?B?MlV3NGtDYnlGRElHb1RWQ21wV2JabWtSaXVkZDVIUFFOanQzUUF0TjlDZHFS?=
 =?utf-8?B?dmx2cmVZYmtocHVlK0k4SmZUSmtNaVNMTG8xUjNUZW1aUm5HY1NMZ3lnQkYw?=
 =?utf-8?B?Q21XZ2JiWC8rT2JzVVQ0QmhTRzFlVXNOZjdQSGZkNHpmdEtLVVZ3d01tQ0tX?=
 =?utf-8?B?M0VobStOSnZ2YUkwNDNpb3hQOUsxaWtGR3Q1Zm9hb0hkd015ZzVvRDdDZ3lT?=
 =?utf-8?B?bWxjYVV2UFdnV1Rqa3M5eTExTmJwR29kR2wyZFp2WjZQRTBETE9lM2ZST296?=
 =?utf-8?B?ODhaczBtN2NDaTJsb0RrSkI1Qk1tMlk0SXl6eXd0eXM1V2UyeTcxbzhKWjZa?=
 =?utf-8?B?L09TeldtQVpFNkpYTlAxTGRxQS9sWHU4aHR6c0lVVGJicnpPRzl0djl5YlND?=
 =?utf-8?B?aDIrV293M2VaRWFSelU1VDFhKzRwcE1IL2FrSGQ3K2hyQzBqY0hzNHZsa0lr?=
 =?utf-8?B?STVzL1llOWlOeWE2dktKQ2FNWXBZaEpobkVjY2lNL2ZTQTZqc3Joa2d4Q0lJ?=
 =?utf-8?B?bnZwdDArQlF5ZnVNcHIvOThPMVM5b0Z4NnBqSU9zK2lZdFZCQXVySlpZS2VQ?=
 =?utf-8?B?L3NzMy8xTjFFc1psSmhXajlXTEV3QmpWQmlFU0dpUTBOcWVibjZ4NEdTVy9C?=
 =?utf-8?B?MHE5OXVEbk1oc1ZIZDloSEpBcGtqaTFxUFdNbG1mSEprRUpmdE5jaFBKcE1N?=
 =?utf-8?B?UVhKWFlhQ2xzVjdBUkRWOWZhaU5QYmhzNEZIL0VqQnpiOXBIdlhYeUgrVDZN?=
 =?utf-8?B?L0o4S0p3anFlVWkrb0oxR2haVTRzWE5CK2dtZmVJMUVSb1Q0MHpRYWo4bEZQ?=
 =?utf-8?B?anpXN1NDd0s1QUFaWDJoU1BadXgrM3RFS29CTTlRb0RGRm9JaUc3RHhhdC9j?=
 =?utf-8?B?Nmloc0ErOHlRU1lCQzcwUCtndGtWN3VnVTFIb0NzZGtzNjdQaTYyOU9UamMw?=
 =?utf-8?B?QUt4MEw5Tkt2RFdXRUdadEJ4R0xDejQzV1hEeHpocGN2QWpqWGRXVXkrUHBG?=
 =?utf-8?B?dHorRVBoRmF0VEdnZVdqY3lGbkltNHUyaEJEUGlwbStuYXl2eHhiT2N1aVN2?=
 =?utf-8?B?TWFuT1hPd0c1STZsY3daNzJ0Si9ocnhCc3hNdEVtOGd0MlNWQWFxUWxhQmxF?=
 =?utf-8?B?dTJNcDU5bEUxNlZxZEdkZFJ2dFNjLzU5eEdKaDd3VFBrcWYvdW9JSnh5c1Va?=
 =?utf-8?B?SldhVnBYVTgvczB3SW1MRTVKbFo1NVhaaGc5aVk3SVlDSHVYNlpVSU5EQ1g0?=
 =?utf-8?B?dm4vbGl3aVliTlBHK0kyMlI4cDZxbWUzVlUxUDFDTEVsYmFjMTAxRWF5azdF?=
 =?utf-8?B?VXpqMnFIcUZVczMrNXhuRUUyYXA2V1hRRmpSRFpjbTc5Y2IyOTBxWm5CcmJx?=
 =?utf-8?B?SEJ6Y3ZNRHc5ZHF4bldjSi9PSVpQVGEyaEFzWThJc21iaU5oM3pLV3E1ZERa?=
 =?utf-8?B?OHoxM1V0SUpGb0VNL0hscUdpQXR0U3dqd0gxcldpbXJITTRUbzBPMFFPblR5?=
 =?utf-8?B?b0lOMHJmaGJ6c3NkTjFJTWczNGU4SEpKRnZZR294ejZVUUlKUTJGNVRuZ3ZK?=
 =?utf-8?B?SHBtM0dZL0o2ditkRVhnOFo5NVFUZE84WEUwVVNuV0FjWTF6d1RLS2VVcm96?=
 =?utf-8?B?REl2dG1zNVhFaCtaYWVISlQ4bTlQUG4wRVRtTm1QVFFlcHo4OVNmeDFqNTRY?=
 =?utf-8?B?UHJOb2d6TXJvakZZYXlkR1ZxYVMxVkVKaXE3OU05bFB4MzJLcHJhb0VDVEJk?=
 =?utf-8?B?TnJibGpFK1AzSkUxbmRRQ0dPeXZ0TXV1ZkxPRmVzL3VMaUZFbVhWU2l4TlBD?=
 =?utf-8?B?Y3pMNnpncWN2M0dEb0xpbWZMMnFsSkQzQ3ZrVEdOYWJaNmxOa21oZG1TYUNM?=
 =?utf-8?B?MUNXemtmS25JajYwckw4R05ScHZwN3NKN2JCVnc4MjhPbUlUcjRMYTNkSUhL?=
 =?utf-8?B?S21XK2lVdlZDQVVqQ2lTYjRrWXpqd1NyaXl0WUw0NnVld1N3eXAvZVF3UGVj?=
 =?utf-8?B?TmR6K3ptTjd0TGNpUEtpRWFwQk5rekF5V1pjUGVUOUtqTmFQQVF0RGw0R3Mv?=
 =?utf-8?B?Zm8rZkJCaDZYUGY4TXJxTWlQOXgza1hZTmhrYUQzWFVYQ3hUZytIZGp2eWZC?=
 =?utf-8?B?c20reFkzeGxsLzJiM0FaUTBwektRPT0=?=
Content-ID: <8C3B50798559BF45AF0C9DDDF09F7510@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faebf47b-f716-41db-a1a9-08d9ea1757a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 08:53:42.3809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LlSfZQg0bcxhnnd1qCHJgQWfmZ4CvCNFYEuD5bcmOkojN+nEgUo196NnOM7xfEa23Y5zG9mzkHXxFbjMDZ1su/WX5azrNyiMv+Aq2V8Z18Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1638
Subject: Re: [Buildroot] [PATCH v3 2/2]
 configs/microchip_sama7g5ek_mmc_dev_defconfig: set custom linux version to
 5.15.21 and add host openssl for linux
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
Cc: Ludovic.Desroches@microchip.com, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2/6/22 1:26 PM, Giulio Benetti wrote:
> Fixes:
> https://gitlab.com/ymorin/buildroot/-/jobs/2035821100
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * add host openssl linux
> V2->V3:
> * set custom linux version as suggested by Thomas
> ---
>   configs/microchip_sama7g5ek_mmc_dev_defconfig | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/configs/microchip_sama7g5ek_mmc_dev_defconfig b/configs/microchip_sama7g5ek_mmc_dev_defconfig
> index 3253bce401..c11ea2f518 100644
> --- a/configs/microchip_sama7g5ek_mmc_dev_defconfig
> +++ b/configs/microchip_sama7g5ek_mmc_dev_defconfig
> @@ -1,6 +1,7 @@
>   BR2_arm=y
>   BR2_cortex_a7=y
>   BR2_ARM_FPU_NEON_VFPV4=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
>   BR2_PTHREAD_DEBUG=y
>   BR2_TOOLCHAIN_BUILDROOT_CXX=y
> @@ -8,9 +9,12 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sama7g5ek/genimage.cfg"
>   BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.21"
>   BR2_LINUX_KERNEL_DEFCONFIG="sama7"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama7g5ek"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>   BR2_PACKAGE_LINUX_TOOLS_IIO=y
>   BR2_PACKAGE_BZIP2=y
>   BR2_PACKAGE_XZ=y
> --
> 2.25.1
> 

Hi,

This one boots , but it has a small problem

Here is the log :

Waiting for root device /dev/mmcblk1p2...
mmc1: new SDHC card at address aaaa
mmcblk1: mmc1:aaaa SL16G 14.8 GiB
  mmcblk1: p1 p2
EXT4-fs (mmcblk1p2): mounted filesystem with ordered data mode. Opts: 
(null). Quota mode: disabled.
VFS: Mounted root (ext4 filesystem) on device 179:2.
devtmpfs: mounted
Freeing unused kernel image (initmem) memory: 1024K
Run /sbin/init as init process
mmc0: new MMC card at address 0001
mmcblk0: mmc0:0001 S40004 3.64 GiB
  mmcblk0: p1
mmcblk0boot0: mmc0:0001 S40004 4.00 MiB
mmcblk0boot1: mmc0:0001 S40004 4.00 MiB
mmcblk0rpmb: mmc0:0001 S40004 4.00 MiB, chardev (246:0)
EXT4-fs (mmcblk1p2): re-mounted. Opts: (null). Quota mode: disabled.
Starting syslogd: OK
Starting klogd: OK
Running sysctl: OK
Populating /dev using udev: udevd[101]: starting version 3.2.11
random: udevd: uninitialized urandom read (16 bytes read)
random: udevd: uninitialized urandom read (16 bytes read)
random: udevd: uninitialized urandom read (16 bytes read)
udevd[102]: starting eudev-3.2.11
done
Saving random seed: OK
Starting system message bus: done
Starting iptables: OK
Starting bluetoothd: OK
Starting network: OK
urandom_read: 5 callbacks suppressed
random: bluetoothd: uninitialized urandom read (4 bytes read)
LDO2: disabling
VDDOUT25: disabling




^C^C


^Z


random: crng init done
ssh-keygen: generating new host keys: RSA DSA ECDSA ED25519
Starting sshd: OK

Welcome to Buildroot
buildroot login:


It takes a few minutes before crng init done.

I remember such problem was caused by libjitterentropy .

Even so, it looks like a different problem, so,

Tested-by: Eugen Hristev <eugen.hristev@microchip.com>

Eugen


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
