Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81E2C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 11:39:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FCE160FDA
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 11:39:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8FCE160FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 549024012E;
	Wed, 18 Aug 2021 11:39:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kd9TtvcIdcJj; Wed, 18 Aug 2021 11:39:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94CEE4016F;
	Wed, 18 Aug 2021 11:39:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 969161BF3CD
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 11:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8646B80CFE
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 11:39:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com header.b="rF8PGdJw";
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.b="pNdxf9Kg"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kd8wH6altORw for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 11:39:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77F9F80CFD
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 11:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1629286748; x=1660822748;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=C+aDfL4OKibPB5yDObVcrTiPzrVUfffTfUsL6ryPRV4=;
 b=rF8PGdJwF8NVm94bXHnMTJ6c3S12S3wgT+FFwlfgxiG9K+eErfVs7H7B
 VlUtQTKjmrSWYP2kpiLCwaWfjwUNDo3PYpVRAVQfo1wckykosFv0pzNvL
 kEazSY/aI4kf8oSh5x07S7U6fJe1wtuLEsDkxtTsnY/JBj3M5HGa/ptBU
 pyM5hrALBYWZQolTSTTpGFIVjz7dGdr20ZQ6kp3vTFXWT/OmxY1e9QEQf
 kQ/2NzeSHs4M/MmEelqHPtO1Hlv7ePl28CWwAy2clynySf/z5QxnwuBHb
 BkLxJR3P6ueJrTRcO2HSl212Sm5WcL/+Rx/nhOq7A27VuulBEt2UkZCSZ Q==;
IronPort-SDR: XXFsXVRSxnoEaNFSo3NUH81pHtgQIMyjGsYPDsrRORVZYtbQHQ+6TA0whoJK00Cn3PtwcmTLUp
 MqTuiIa0HUdUGL+8PHrKplZMdXuPO+6XD3gtbE9EvrIBHeWf0gRzuT76d6OF9+3D3vWj2TSspM
 wLFTcFt323AsCD59+CjQW543X0sDyaQyPkTUEk+gZgV45QQaZtFeARVIENNgqfoVg/X/NPhlPd
 VwnpM2wo0bQ5HWcTH8JYkuW6lywc/9XPDF1+81g1pI1UfqcvkeJkBdhw/YSf/+c1+NDbS8WB1d
 kMITkDbkORD1nPLZED3Bcsl2
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="132715016"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Aug 2021 04:39:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 18 Aug 2021 04:39:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Wed, 18 Aug 2021 04:39:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mEWV9WpoNMdtZpWdXpz9FKci/plCo+D5/cxN8Y5YDKFyhoqkLrl1IquYMnUYyhhhToNmjWt15gdW1BKdpNlOTMyNGiMHOtgMOeO9l0JF7XQa5q8sc//k/StY8aWtr63rg4jVLtP/JbTh+r1C0GCUpDVg67cgAtwSIHhbskSMTxV0gIF6ObElSt+6/dv7g0deijbqxiJ3pvWX22Oi0ZouFdFc7C/58ODe3hjXMxZBI0nZhug/HMx7931+G5GnDFo7bVBfffwX/7u/UBLp5qd5JGrueVOFWWAc8g/ggC/h1E1FYpa9gbz3uI95wJH1Uc7zBv99l12CaPT2qA9v4FpLLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+aDfL4OKibPB5yDObVcrTiPzrVUfffTfUsL6ryPRV4=;
 b=acgxMvB43SSgSKBLQVMkfF+4Fpnr4rmRLD1oWILBmBIWNQor8g1fa92oSywVKJSk9HJ0Z3zHcMyqB7JdXlDzelk0V8npB2xbrpz7W/XdP7UwjEx6nu7+vTGL9nTRihYcZMZt55ia4o/kitfp0AYfbn/07ofIjYBNByA6mUBcPn5YMiP0JkbsAi1HcaAMlCd8GdVUgFNy4U5hFZBwgljzZHPCFqg0b4DnBIgtTBcefhNB5jFviqLBh4vJJexrlUdcTLQ2SwrrK8PA0iHWXJ+h30bBbHneeSo9Oh5KxGho6WVWPREqIqZRa7hkdm1iLK4hRcd839BmkQ9ExELNLJJ30Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+aDfL4OKibPB5yDObVcrTiPzrVUfffTfUsL6ryPRV4=;
 b=pNdxf9KgncEg5EmoWh044AOlI8boN14i0bbG0mbCj0UFx76dq5zaT7hsQBWlVxGe6ujbpLB3RgrREyoBA2twdRdYmWPq5sEu6rVkjTjzA+aD0e8/fBRgWIY+wItifhJzGmUp7Ru1XZhEL1d7yKvjhaKXE3JAkL4r5x8fG5oJJQk=
Received: from BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 by BN6PR11MB1666.namprd11.prod.outlook.com (2603:10b6:405:4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Wed, 18 Aug
 2021 11:39:02 +0000
Received: from BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::6c59:63a3:da2d:fcf9]) by BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::6c59:63a3:da2d:fcf9%5]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 11:39:02 +0000
To: <Ludovic.Desroches@microchip.com>, <arnout@mind.be>,
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 2/3] configs/acmesystems_*: bump
 at91bootstrap3 version
Thread-Index: AQHXkpbpUGZTRUsgcUi1jfohojAtKqt4NgQAgADq5gCAAAUqgA==
Date: Wed, 18 Aug 2021 11:39:02 +0000
Message-ID: <c1d84d62-0a13-f3a1-5e5c-a0797143dc4b@microchip.com>
References: <20210816120418.427-1-ludovic.desroches@microchip.com>
 <20210816120418.427-3-ludovic.desroches@microchip.com>
 <aeca7e19-f3f0-c66b-8033-f6bb1da29ab2@mind.be>
 <b19518d7-4b48-e3fc-6d4c-f84238f1186d@microchip.com>
In-Reply-To: <b19518d7-4b48-e3fc-6d4c-f84238f1186d@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8653b1ae-463b-4678-214b-08d9623cc70c
x-ms-traffictypediagnostic: BN6PR11MB1666:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR11MB166642488F834EE8CC627EC0E8FF9@BN6PR11MB1666.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mku1kpFHFZo4Gd0jEA2v68+gIbCJ3L9bKWm8wWptdb2YCkVEjtghk8UR4lRD1SbBQh7lxVqVEg+tDHMuHrYRPflZRQpu28nbJpnGKNqEecUg+jVoOmNlaYueG7NG+sF71yWfMAgmT5Lmhqh5fHlwZv7tAxfJdT+38LsV5UmwJ2EDLa7nxp5CcQv4IKplhlfm4AOU8ILKw+BVzD3H36KrSn4JO4FjJhA2G0kE+hc13H9iy0Yd/Yg3uXW3KZ54se5k8U/S4SF2ilm+/seFb0g3rNRDXvxbAxfTQngTr6i4n0n1KmHK1aGfXh8UvLw0zJ4yg1AR6+wo8fsFNQ0H0UgolSsvQu3zYEIq7tGWhbC/gOv0bOWPlvV9F2zn834paPiqF1knVj3OUtso0a8O36V2uqORj3J6vlVtIK4PsxyaJPMPjmKyahg/YAa3HGAaF3yDrksSl8eqUsUjURhCh/GBYA4RNhm1CNORT0A/S+ABLgSh92dlIKItg45WenBZtP/fbgD9tpodPIEG2S1QlcEAPzaG+MZhzjce8KyCQrJtJHs3j2DUJdsHyevL+0VHTwaylPRP5sujFHixFq8NgBC/mlEgHQXhuXBREY+MmPzMsVJr3NYjySQ+khXqb8Tx1bxc+VIiK4IjazYJZOPB6ovTeXxUwFqQX9fEj6SK0CXCmNRdXCfx3WsIDhpCRqQH2uIEUVO2+jnpdNDPRBO1PdaeNAAXNDkMPd9MLeDXkYhHPQQFcyaEQqA3hZe7qsdzVWEIHWu5+S2PZHi/zwUIsLcPafOJVrBB7eRCvJI0TZtW5Z4EmoyUBhOaYZbNmV2Xht46CjnFjGx+cLtJf9LJATdQD5ssjrMP4TnzuUwVjR7wiR8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5514.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6512007)(6506007)(38070700005)(4326008)(83380400001)(5660300002)(71200400001)(53546011)(2906002)(508600001)(66556008)(76116006)(66476007)(64756008)(66446008)(8936002)(2616005)(66946007)(91956017)(36756003)(31696002)(6486002)(38100700002)(31686004)(186003)(122000001)(26005)(316002)(54906003)(110136005)(8676002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czVQbG5HRWNCSTBaUUNPelBlUjlydjM5OTFSVVltRHlibGwyazBxMGVNRG5B?=
 =?utf-8?B?TVQzWWVYc2x5T2RaSCs3YzZqb2I4QjBjempuaGRsWnN5QnFGVGV3VjFVQm5i?=
 =?utf-8?B?cThXc0ZEdFhxTUE1cGZDekFBbDhLaE1IcFg1cmhoK2tLNXduclB4aFN0YkxM?=
 =?utf-8?B?V0lJMVdKQVNtZGlnU0kvVGNPdHRnbzdRNWpqSnVWUlE4MWkyT0UyWTN5UWY2?=
 =?utf-8?B?WUF6ZUREUXBLbWE3UWl3UTVVQ1lsU0d5K3NldGpqVUp0a1BjQjk2WHNBd2VT?=
 =?utf-8?B?ekZjaE9OaHNTR05VZTJ4bVFERlgyRWZLR1RYVHZTQ1ZXNmcxdGlvTkExTDdu?=
 =?utf-8?B?YU5Lc0pENlJhOWVsdzU1ZWx3TWY1S3FDVy9LS2p6a01naW5OdkhpWmtZUzBZ?=
 =?utf-8?B?ZlpwdXZDbGxKMHZVbVJEQ0J6Y3lqL1lwZUFVcGJPRXJEcWZrZE5XcDNxQ3FE?=
 =?utf-8?B?OURqQU43SVl6UEdjOUVyVXdDaTcxOStKUjVKbkNhNEpxb1phbmk2Y1pQTTB6?=
 =?utf-8?B?NE5CdXlvS2wrZk1vcXlyQTgzVVJyUE9hL1c2SzhZZVNpUVMwQTBYYW5mQW8v?=
 =?utf-8?B?aW9qK0h2M3ZyQWptUkVXdW5MM2VPT3lMcDRDWlcrSElUVjh3am8yVXFsRGw2?=
 =?utf-8?B?eFkxL3p2U2ZzMFUvcnFVVERJVzkyQ2t2Z0ZJYkZKaFAzNVdSYXZpZlNhaWxx?=
 =?utf-8?B?Y09kZjlpSE10eEdldXRrZW54RjNHUVNscnBsQk9wUVllOVlRNEVRa1Vzdng0?=
 =?utf-8?B?N21CYnVpelpUMmNGaHhsT0p3NDBlNDQwQWl1d0Njak9oMDVqcjZKUVZGL0R1?=
 =?utf-8?B?TkR5SjJoTHRPVE1VRmJuTDVIR0RwWjRGcjA5ZnVZVVF2UjBzWSt3NHh6aHYv?=
 =?utf-8?B?bTJrQkZ2VlY4V0ZWSjh6VDdJZkhKZTdzUU56alZ5bkYzQWYvbzljNlFXWjhD?=
 =?utf-8?B?NGhUN1M1SjhXcm5UYmtERGM0ZVp1ZDhZNi9IZ2NNbU1LcFRzRnhxT3h6RWtn?=
 =?utf-8?B?QWFZSXdYK25CVEdDMzMwckI5a1JxZWp0cmJ4Z3E3aGJiYStZd1ZNUkcrci9l?=
 =?utf-8?B?SWcxQXUxVjg0ODkyY2VoWlRLSHBTZzM3S3lzUHpnSVI5S1kxU3JOREQydUNv?=
 =?utf-8?B?MWwyMDRXNUYzSUMxVSt0c1E3Q2hvNDFlRTVsL0NrS1lRd0tzYUM4cFlXMndD?=
 =?utf-8?B?Ulh3SGEyTWpMV2Z2ak5XZDM5N0ZweFcvVUpYKzUwNy9jSTlmZXh0ZVhzNits?=
 =?utf-8?B?Z2RYdG1FTUE0UVFmcVNhUG8rYXVtL04yb0pGWWdtUkJmdUc5MEVBdGloMWdk?=
 =?utf-8?B?RWZXTm9TaytSNXFXcnQrdkhVcTJsMWdFRE1kRnM4U3RyMXpoUFpGZVhrM2py?=
 =?utf-8?B?TkE0bnB3WHFSN001cWlMMkpUdUs0VnIyYVFTOVJjc2J3Y1RyK0pKVHphbUhs?=
 =?utf-8?B?Um1Lemt4SXc0eTRBZlpmMlZ3bVNLZmZiZzVhcldLcWpHWmtyNzlVenVVUXJt?=
 =?utf-8?B?d0dUWjk3SzkvSE5lZjdkOExmc1g2eVhmSUZvaG1DMVhVdi9qTnp5bmZDdVhq?=
 =?utf-8?B?K3ZyaG1JWTlBb3JLTTZkUUZaS0Ftc0pXNFM2bUMvTzRjbWRCUGpRa0FNSkQw?=
 =?utf-8?B?Wm94L2V2Z3d5dVFkODFBaFIzanlXMUt4d1VMeGlRbWdDWXVkdG56N1VNNUNu?=
 =?utf-8?B?UXI4QzlGVTVuSHpCeGhXN00vcGJPSGhmK216NG8yNUNGOWFHNmpPYTV2M3Yr?=
 =?utf-8?Q?u3HtBLrk6rw2TDvVlg=3D?=
Content-ID: <22CCF49D50020442976FE0D504D44DD7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8653b1ae-463b-4678-214b-08d9623cc70c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2021 11:39:02.5292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z82wfB0Iw5XWSF1D9vK/JDRRgHGg2CSeTdORIVkEVQ7K3RsQl25lV6aTb8dKY6d4ci3q8W8lEmocWIO+3yOQCT9MVcXgmHJDJ/1WDZQBeCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1666
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
From: "Eugen.Hristev--- via buildroot" <buildroot@busybox.net>
Reply-To: Eugen.Hristev@microchip.com
Cc: thomas.petazzoni@bootlin.com, biagio.hkr@gmail.com, bonet@grenoble.cnrs.fr,
 Nicolas.Ferre@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On 8/18/21 2:20 PM, Ludovic Desroches - M43218 wrote:
>>
>> On 16/08/2021 14:04, Ludovic Desroches via buildroot wrote:
>>> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
>>> ---
>>>    configs/acmesystems_acqua_a5_256mb_defconfig    | 2 +-
>>>    configs/acmesystems_acqua_a5_512mb_defconfig    | 2 +-
>>>    configs/acmesystems_aria_g25_128mb_defconfig    | 2 +-
>>>    configs/acmesystems_aria_g25_256mb_defconfig    | 2 +-
>>>    configs/acmesystems_arietta_g25_128mb_defconfig | 2 +-
>>>    configs/acmesystems_arietta_g25_256mb_defconfig | 2 +-
>>>    6 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
>>> index 00b99c0ad8..f8129f3780 100644
>>> --- a/configs/acmesystems_acqua_a5_256mb_defconfig
>>> +++ b/configs/acmesystems_acqua_a5_256mb_defconfig
>>> @@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>>>    BR2_TARGET_AT91BOOTSTRAP3=y
>>>    BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>>>    BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
>>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="5232adb1c42636e1e9cf495a6abd1a8d66475f83"
>>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>>
>>    The point of having a fixed version is so that we are sure that it's only
>> updated after actually testin on a board. If you make such a wholesale change, I
>> assume you haven't actually tested it on all those boards... So you could just
>> as well have set BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X...
> 
> Right I didn't test it on old boards. I discussed with Eugen, the
> maintainer of at91bootstrap, the need to release a 3.8.x and a 3.9.x or
> not. 3.9 and 3.10 are about support for new boards so there is no
> compatibility problem. Nevertheless, it's true that unless it it has
> been tested we are not 100% sure...

Hi,

3.8.x 3.9.x and 3.10.x are the same. It's like the linux kernel move to 
4.0 or 5.0 . There isn't a backwards compatibility issue.

4.x series of bootstrap is a similar, but different project where all 
old SoCs are not supported anymore.

In fact, we do not have any kind of branches for 3.8.x or 3.9.x . 
Everything moved forward to 3.10.x

I suggest everyone to move to 3.10.3 which is the latest release.
We cannot hold updates to components just because nobody (that we know 
of) tested them on some specific boards.
I am the fan of "move forward and report breakages if it's the case" 
approach. That's why we have the buildroot release candidates right ?
If nobody really tests the boards during a longer time frame, then it 
wouldn't really be a problem if they are broken, as it looks like an 
older working release is enough for the people using them.

Eugen
> 
> If we set BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X, the risk is
> higher as it becomes a continuous risk versus a one-shot risk.
> 
> I have no strong opinion, so if there is a preference to set
> BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X, I'll update the patches.
> 
> Regards,
> Ludovic
> 
> 
> 
>>
>>    That said, we really have to do this because all the defconfigs are broken at
>> the moment, so applied the series to master, thanks.
>>
>>    Regards,
>>    Arnout
>>
>>>    BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-256m"
>>>    BR2_PACKAGE_HOST_DOSFSTOOLS=y
>>>    BR2_PACKAGE_HOST_GENIMAGE=y
>>> diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
>>> index f4af2501b8..e399d4a9ff 100644
>>> --- a/configs/acmesystems_acqua_a5_512mb_defconfig
>>> +++ b/configs/acmesystems_acqua_a5_512mb_defconfig
>>> @@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>>>    BR2_TARGET_AT91BOOTSTRAP3=y
>>>    BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>>>    BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
>>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="5232adb1c42636e1e9cf495a6abd1a8d66475f83"
>>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>>>    BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-512m"
>>>    BR2_PACKAGE_HOST_DOSFSTOOLS=y
>>>    BR2_PACKAGE_HOST_GENIMAGE=y
>>> diff --git a/configs/acmesystems_aria_g25_128mb_defconfig b/configs/acmesystems_aria_g25_128mb_defconfig
>>> index cf62b5b72e..8bc8c4dcef 100644
>>> --- a/configs/acmesystems_aria_g25_128mb_defconfig
>>> +++ b/configs/acmesystems_aria_g25_128mb_defconfig
>>> @@ -29,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>>>    BR2_TARGET_AT91BOOTSTRAP3=y
>>>    BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>>>    BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
>>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
>>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>>>    BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-128m"
>>>
>>>    # Tools to build sdcard.img
>>> diff --git a/configs/acmesystems_aria_g25_256mb_defconfig b/configs/acmesystems_aria_g25_256mb_defconfig
>>> index 496ccd6853..d161b118ae 100644
>>> --- a/configs/acmesystems_aria_g25_256mb_defconfig
>>> +++ b/configs/acmesystems_aria_g25_256mb_defconfig
>>> @@ -29,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>>>    BR2_TARGET_AT91BOOTSTRAP3=y
>>>    BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>>>    BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
>>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
>>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>>>    BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-256m"
>>>
>>>    # Tools to build sdcard.img
>>> diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig b/configs/acmesystems_arietta_g25_128mb_defconfig
>>> index 17ef7e757c..62bcbd44cb 100644
>>> --- a/configs/acmesystems_arietta_g25_128mb_defconfig
>>> +++ b/configs/acmesystems_arietta_g25_128mb_defconfig
>>> @@ -29,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>>>    BR2_TARGET_AT91BOOTSTRAP3=y
>>>    BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>>>    BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
>>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
>>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>>>    BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-128m"
>>>
>>>    # Tools to build sdcard.img
>>> diff --git a/configs/acmesystems_arietta_g25_256mb_defconfig b/configs/acmesystems_arietta_g25_256mb_defconfig
>>> index aa0236bbb3..94258444a2 100644
>>> --- a/configs/acmesystems_arietta_g25_256mb_defconfig
>>> +++ b/configs/acmesystems_arietta_g25_256mb_defconfig
>>> @@ -29,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>>>    BR2_TARGET_AT91BOOTSTRAP3=y
>>>    BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>>>    BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
>>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
>>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>>>    BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-256m"
>>>
>>>    # Tools to build sdcard.img
>>>
> 

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
