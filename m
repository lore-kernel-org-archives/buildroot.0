Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE45BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 09:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F70E40262;
	Thu, 21 Apr 2022 09:25:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IA7zPIBxD0v5; Thu, 21 Apr 2022 09:25:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30A4B41BE9;
	Thu, 21 Apr 2022 09:25:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4ECCF1BF356
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 09:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C055404DF
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 09:25:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com header.b="eH4kFCW0";
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.b="hzrQxh+D"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8FFheKM3tAF2 for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 09:24:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C40A3400E5
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 09:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650533098; x=1682069098;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=dXWD47iA1qgO6QyGmg80CkYAGsbXCajLrAO7lZjHs2o=;
 b=eH4kFCW0MDe0XQedAmUSyrDnxY6328okn08setQsUuEGQLL1ZHdUyv7K
 1N1OhqeOqj9hVoh4pIBzKAMHOfas5ufn1isLK5jDa6VADuET/35Tlcwl7
 rWthot6B1Oc1ZpU2s8rYZZZ4F2Tm6H6BnGYb/n+ppe8QKuTQ//bYuB/zc
 hsViEwsDzJ4bEUM4a+vk+00DAhg/4K61AD9vYHxm9OnAYdr71u4ApQT8a
 Hd2t4w5EKDg+H3+FNP2JQszbwVWrf5CKdDbkHvKkess7bnjoOhCQB6RPc
 0s51qgAiS221WgM1BMog1ycuX4WBTFNDOYIgYbxmKPqC6wwMpMpWnHXsx w==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="161237113"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 02:24:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 02:24:53 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 21 Apr 2022 02:24:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQERLpBMIqFobUDsuWPEHikfAnO3ezax/srWguZT7eJsZjhJ+d9z8SJqC9JMAytQgBZIJ9B5mfZTQhM+sjaGbDuRYsYkullRnMtsMM866uZPaM+cPSQJVnAmB82PpIl9jsM3B2OPAC9CxGNUNNhRwMbVF8l1laexhg4VDZkq3NF9IIWQ+QGMijS5vMR9cPyQyRPw0UpFr6bUtumY8bm8Z+fLIj6VRwZj6vWw51uBctpbjQjSHWnYydxkRu71bXU05sphmz2gMbZChC58HD079E1n0DC+3ul2L98pc3NF70XvZdeKXSaClU1PpSmow13Z5wTX757d5xMmgNirQ+TX9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXWD47iA1qgO6QyGmg80CkYAGsbXCajLrAO7lZjHs2o=;
 b=EyT80zIkY+iei0Ml5/W1oPjPUvbU0fSqrP6stIzpI5lf4VNfvvMPpq4Vd7uO5tTT975Wnn4wsFzOX6ZgkZsIxFE2FUpKxh1fQfKUnL61FHPQzX8XxRQb1D/r3Y6P+Av6j/ooPdPBAmTYJJW0QjPPoElVMfGFJ4BxEsTDfF1nOuC97ubEjYD7gp2mBViQthWHFW6VWSC/9WkNnLgAicLArsYAvq/K8GiY7bSjlxzAjCaEZZJKFMYRGqIKqMrnt9nGb0dL+H1Pyc93YdJ8s9ms+Ma7cuCsGyICbRA4D61PeoJ1rIWVEC2MtKRwzWYNspnhJcl+41fET+3DyA+0tVz2gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXWD47iA1qgO6QyGmg80CkYAGsbXCajLrAO7lZjHs2o=;
 b=hzrQxh+Dfojvv7qio/kpO1sTsqrTCBN5zPacYiBo1QY9nfqPz9qdroq11XdgRzK7Rzymt2/wCXqvfYONZedB3uxHaImss3VBfNr9MitVksPEqZPZPGLH36wsv3P7nVR+qT4jbXQ2oCoeNeHqdOPe3IK5ScpeqhAeLsr0xr3SHPs=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by SJ0PR11MB5939.namprd11.prod.outlook.com (2603:10b6:a03:42e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 09:24:52 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2%8]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 09:24:51 +0000
To: <fontaine.fabrice@gmail.com>, <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/1] package/dhcp: untar internal bind
Thread-Index: AQHYVAiVyofN5/DigESil0vSiBTzJaz6GzsA
Date: Thu, 21 Apr 2022 09:24:51 +0000
Message-ID: <2507ebbe-3dc4-e2a2-f3e8-f668603b52d8@microchip.com>
References: <20220419161130.3431492-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20220419161130.3431492-1-fontaine.fabrice@gmail.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0cef28f3-59e1-42f8-ebb5-08da2378c9ed
x-ms-traffictypediagnostic: SJ0PR11MB5939:EE_
x-microsoft-antispam-prvs: <SJ0PR11MB5939CA9169398D15A2F79EF9E8F49@SJ0PR11MB5939.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PPMl99oebLKaPCyJADa/mAv3tpeRAzj+YLCDRaNb+y9xgBxt0lnOjD3v8DSH6Q+pLjJry3w95O6QzV2m29XRmY8GbogUI245c1dK2u5Z+Qcm3E4swOMUhAE6DEhWTJJ9SC/cdRKRAZ3M/JToN8au+p0mbQCEbiUtlwL4i5KD6/iWIzWjDvkp5t3wU1OIY21ghiK10fsAXG5POSdkEF398seHtkXT448qVUDD8G3XnU15e12QTiLDjS+Ycx6u4xLHQnBF34b8OnR7FBtgvl31K74S0WlCQfUHTPGvAJldLM7up+kCzSYjg4dYHj6AFD/9C0fDGPT2AJonOp/fq+4yeqxsQwUN0PkLu8YCTMdoKmN/5hFxR+1/2aX/cbCdixigP0sAcotQWomF0LCcEOXeISkAnDtqYa1XsDxQzEpwvfm1EDHoNOxC1zMFb/8zBqZLgAdi6NF81eVLAaQdQxEhicCM7WxPgnwf/MoktzObcrqAxFQzM7nGvoPrEGdElmDUZySGGVuRwCBpCIlWP4QB/M6BxQLRJVlPrZtWpioGnnFTVX6Cr6FG5qiSsd+w2XjY874afUggp1CDdHf2JDLc78gtHjX5TqNpIp/ncE1Gtaq97v2waf50qo/xAdKW4orc4dIcEIaIfOnwovEU6Jawpf5psoC/gZwbNX/oqy+fB0uIlWxCQWUeZ/IAs08P5bHN5i0h12rcjE3HmgYFg43ujYSSZqEUEDh/D2Hl9FpCm8HdW9B6A/DU2JIQyBddI63BxcLXd7TePE0yUbnCw0lPuyCd0s+7rz+KE2RGSMXMOjj77eSw5mwnfgKmnLW//g1S1Ins5L/lSXf+pu8NeVrJ3v7oyr40cCGPFyjUjRZxhtAjdJoXR40AHrY/AC+aAzme
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5384.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(110136005)(5660300002)(186003)(38100700002)(38070700005)(966005)(508600001)(66946007)(31696002)(8676002)(64756008)(91956017)(66446008)(2616005)(6486002)(122000001)(76116006)(316002)(71200400001)(66476007)(86362001)(2906002)(26005)(66556008)(83380400001)(31686004)(6506007)(6512007)(53546011)(8936002)(36756003)(43740500002)(45980500001)(357404004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkVNMmtaODQ4Z1hKSU5lbXNJb0NFL3ZyV1RVVHBKYnV6dnp3MDZaM3N6dkFt?=
 =?utf-8?B?ZllpTVM5WTcxaGREWHQ3dHd2elgwYWMvcW5jeUZSdTV5ZkZVdTV1a1BBOXRV?=
 =?utf-8?B?elg5Mm5xWGRkYk80QnB1aHI0QXFqSi9IN0lkM1A4Q3U0RzNJdzRxSVpDLy9G?=
 =?utf-8?B?WS9Za3V6alB2SGlOTmpKTDk3dFViTHU1SmZ1dHhmY21IRUhHM0tSdlIvZ2hR?=
 =?utf-8?B?N2RaaTR6S0p6VlBlclcrbHFvM2MzMVVsVC9mSEdHY3E0Nmpua2Z6U2R3N0M1?=
 =?utf-8?B?U0lxMXEwNjJ6SWxqSUZrSkVUV3hoejZUNHdtTjlSVDl1Y3FXT1Yrc21mM01R?=
 =?utf-8?B?a3BFNzFRRnhzbVNUMWpaSVN1SjhSdFE3SXp4N1JRWCtUUlFzTEpEeFQ3NmFs?=
 =?utf-8?B?czZDSllmcGNoWFA3ZjRlcXVhWHZ4ZnEwazQ2L2FRKzZtOUZibVoxUjNQYksx?=
 =?utf-8?B?VGN3dHBqQzZseDdJaWlZMFVVenU1UkRycDN3eExWSnFnS3U4amYzSEZnQWhv?=
 =?utf-8?B?VmZRNlN4YXcxeHZodTJ6QytSdUVkbzRzZE5hQ25ja0hENkFqaC84UUNLR3Nw?=
 =?utf-8?B?TUgzbW95ZnlHbGR0VlVCYVk4U0lEVTNFL044d2RmTmkzSjNMc2xROFUvTEsv?=
 =?utf-8?B?dEtZUWo4U0pEdWs3ZWQ0RFVGRU5aTGgrOFFwZ1MyOEFzcG85ZE5ldGxiZnU2?=
 =?utf-8?B?NE5xSjYxS0srZE9XR2tDSy80citMWGljelJ4dDZkNEZTMWwzK1J2ck1XOUNI?=
 =?utf-8?B?LzlHQllWNWw4WXFtM1RvblYvVldYTElyRmFNMzQzZE5EK3Vxa1FRRFBXR1Zn?=
 =?utf-8?B?NnR5SUFPYUJYSGlGTkc2K0JqbldLY2lSZ1FmVG41M1hLTjJsbklRaDdqNG05?=
 =?utf-8?B?Vko4Z2dxcmtUUVRwUUJjN1A0N1ZtY25DRHAwVlNXVlhjZ0w2Y1dtckNLcktH?=
 =?utf-8?B?TkZTNnFvNnhuOHMyTllOdGRVb1hwSkhmMmNCd295ekZDOC9WWDV5Z2ZCeEdr?=
 =?utf-8?B?SnptRDduOU5DUXVPNyttMWIwQm1yelVLd29aTlc4bW52NXFKOVlnMGFjZTNr?=
 =?utf-8?B?VElCeFVNTk9VdVc4R1R5VXBSeTA1azJvMzZTSmhsNitpOUJyT3RLTlFnd2Zk?=
 =?utf-8?B?ZnZ4S0t0bG0rczVTOTRhOXdPRUVQd3VtTXdpZEY2RFpjVlR5cGVHYVlXYWxm?=
 =?utf-8?B?MlAzcHorZmtkRG11dDZhZXQ4RzJZSm9OVVZGYWhjTVkxL3RCaWZiQ3Y0anpx?=
 =?utf-8?B?emNhTXBjbGw4Nlk3amdZbms4Vzc4NnlHaERQRitHSWZGcjFLZ1pvb3p5UEZ6?=
 =?utf-8?B?dDFMSjJxdUlsVVVhc05xVTFSNXpOQ1ZzWFNkdHdUb3RpeCsrRTZVSndTcTVp?=
 =?utf-8?B?d1NYbDArcEVmMFdGcjZrRHVjUnZVZFZCMkZYcGo5N0RNcm5oYVdCWlNIeWx0?=
 =?utf-8?B?cjdMSm9JZTJDN1A5QUUvWUxPdjBZQmpTbFQrWWpSYnA2YUtaakFpZDliZHho?=
 =?utf-8?B?OVJSVWxCbVRxK2ppYjZsSmswZEFLTG1FaE93NVA4Zkx5VUozTWpZSVZiU2Jy?=
 =?utf-8?B?NVVZYmdGTTEzMGhNS3VZMjBKNUlwcXRaRGZnVW5xL2ZYV3NZYnFhWHVHMklH?=
 =?utf-8?B?V0pmcEJXcDNSOFFjQVYzZ3lYcWhVQmJoaWluczgwN3lYMnhhcUhVZmdpczJ5?=
 =?utf-8?B?NGVORXhnMDBrSGFOZWtQS1BMeTJwbThUTXpETGFoR0EwZFpvUndodExDa3Qv?=
 =?utf-8?B?aVJRRHFHL0lkOHJXMHBJZ0piZm9Bc3NlL3RsanRYV2V6Sm9mZUJxTDhLTWhZ?=
 =?utf-8?B?eVNPRUY5STBzYkduQ09lbmZ3WjdKKzlXb2F6L09ZRENkV0tOeWlCQmozbDlU?=
 =?utf-8?B?SlUvYjlrbkI2V2dacjNLTnRTTTJvMFFGNWNEN29HOWYrc3k2cHNuNmRnVUdC?=
 =?utf-8?B?b3RTWjJyMDhEbDMyam9kSy9idnZYTDRCZHhDUmpBemxJeEowYklEL2hLVjJI?=
 =?utf-8?B?Z2sxRXRjNE5Kd2tQZG1HN1FiczFQWUNBQlpQNVY1Y3J5dFloNWNrTHVaTGVX?=
 =?utf-8?B?UVdsV3FXdDRrUjVUVytQV21XOERJeGNUbWMyN0NpQ3hBUWxOS2RvK0J4dTFu?=
 =?utf-8?B?MlVqZk1rZEJVSDJROVRCdk9FOUw2bjFIT1NVQkFlNTBmSnpCQ2ZXRGpJcEI2?=
 =?utf-8?B?Z3ZKc2hkenBVTURCQTdUNzJ0bHZ4czFvV3pva3k3eU1wOU5vTmJzaTVCcUFJ?=
 =?utf-8?B?Q2FTWFl6dHdGd3N1REZQaUxtSGY2STBMWjNHWGJRYWJ1ZlVCMTh3c2oxbHFI?=
 =?utf-8?B?eXB6U1dIRmk0NmpLZ0ZXekhxNDA3TXh4aXphbU1ZRHpPSDZON2Vzbk1KdlpK?=
 =?utf-8?Q?s9h8+HyB7SMF9amQ=3D?=
Content-ID: <FE3F0D0FCDE7544EB838078F821B4160@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cef28f3-59e1-42f8-ebb5-08da2378c9ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 09:24:51.7050 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k3LQrVO8y6euCUU0EZi+5SqjOXHxShwXwSR9xMFMlUOC7UjxU5094J7RyFSoKTTVzt6bn7DQXs/U/fWcN3OeLuyGIicoII52gf0Oflvzw/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5939
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: untar internal bind
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 4/19/22 7:11 PM, Fabrice Fontaine wrote:
> Untar internal bind so libtool patches will be applied on bind's
> libtool. This will fix:
>   - installation of some libraries such as libisccfg. Indeed, if libtool
>     is not patched those libraries will be "relinked" and so not
>     installed.
>   - build failures with riscv and or1k:
> 
>    Invalid configuration `riscv64-buildroot-linux-musl': machine `riscv64-buildroot' not recognized
> 
>    Invalid configuration `or1k-buildroot-linux-uclibc': machine `or1k-buildroot' not recognized
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/d25b76e628ffe5293c6bc1fd467a6b8966cb1bc2
>   - http://autobuild.buildroot.org/results/ba3258d8df00a7626784189125f0202fb161c40e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Tested-by: Eugen Hristev <eugen.hristev@microchip.com>

Tested on AT91 boards

> ---
>   package/dhcp/dhcp.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index e6f4c419f4..f815c6c802 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -14,6 +14,13 @@ DHCP_CPE_ID_VENDOR = isc
>   # internal bind does not support parallel builds.
>   DHCP_MAKE = $(MAKE1)
> 
> +# untar internal bind so libtool patches will be applied on bind's libtool
> +define DHCP_UNTAR_INTERNAL_BIND
> +       $(TAR) xf $(@D)/bind/bind.tar.gz -C $(@D)/bind/
> +endef
> +
> +DHCP_POST_EXTRACT_HOOKS = DHCP_UNTAR_INTERNAL_BIND
> +
>   # use libtool-enabled configure.ac
>   define DHCP_LIBTOOL_AUTORECONF
>          cp $(@D)/configure.ac+lt $(@D)/configure.ac
> --
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
