Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B51C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 20:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A27841756;
	Wed, 16 Feb 2022 20:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z5FJPV74w2A7; Wed, 16 Feb 2022 20:08:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5990410DB;
	Wed, 16 Feb 2022 20:08:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E9BB1BF425
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A711812FA
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:08:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com header.b="VcWxHJFx";
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.b="mxLpRS6g"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G_6OnCkBxQwL for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 20:08:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDAC5812F8
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 20:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645042124; x=1676578124;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=SN5SAcxAEsfJezqbkcUbjccmJfPmjvxWflxOOtjhpLs=;
 b=VcWxHJFxxuMaGT6o+nNeQsxJOMnbI33ucqya2dqEAzad36VWbhKF03vz
 q0Z02bX0yEgghJ56/fOtcfKB3ocvnbyHw0/5xSeO1n/32flkqrQ+fuE11
 6AGd8/fkFAXoEsANttxz8iJqydEMYm+5JbPe/hcVeUKL2BrDuAdIC0zOQ
 5GtSpI3exl94QhbmONXLGS3JjchIY4E5bN9uEhPQ1pEpfKkMjTrEL4fYe
 7S8xdUR4ZTPxdkHJ/hSyhngqvaZx4bXk42zIU2bD3SmPnMaT+PWuE7EDx
 y1NPOHIAdkDg0soKmc2GTF/ZBfEttJ1hK774sUmRQNwohVLcRfAMp15mN g==;
IronPort-SDR: BkMB2qyaH/N9aCBXHUVVyehLfc49p7sJFJbtMWDHZZ1fplKVtyHgaZjf/GkqN1DwehTSBNqrC1
 CxLqfL+EGmBiZ6P+tlDNH3FoF2SBXSjrVM6N5GwwDyDa5Hld5CalRte0y/4b9ovtLeTFa9nGE1
 mCtzrpXftESovgQGEeGjVL4oovmLYwOO6D7cQk5CIhchpK0pJZUNvoMPEMOI4KZUiYWy6Gt9YC
 nCZdqv9W2pOt45fNU11sIE/JTr2G75fRet9eSldOfFND/PtxAkRoHV/CtGs6vMY88NbBTxzlJB
 PzLkRnRJ21KdMe+EBZbzmnEO
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="162536623"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Feb 2022 13:08:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 16 Feb 2022 13:08:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 16 Feb 2022 13:08:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFAzKCj3MZYtDcL9tEX/wYVsKKzQF3te4i5qvORIzKZL3udJpTI0N7glSvnvQkAwLgIvl1AbbEjQi73o4hvpRe6fP88ifRNNeUgP3VkYmi+bPC5NqggpbpgeHmWl5M0zsN8VTkI63+oZpTEQJI1c5qOigra+CQvno0SsKWDYesOEsPp6jMnCf6FSoHUPv67NqecvnQ0GZHlNx1+iWIrKM+bfnCiYVcwhY1+6cE/UaNNlan7y8003V6jWn5bFN24qWLeZXFj/aAW8+9xmBD2yXvYzkYwnQXORx4HWhEPniCuLFAxeB9cs9CnqG0Gn2HdEj3/g+7jtVBunPxP4p0o8Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SN5SAcxAEsfJezqbkcUbjccmJfPmjvxWflxOOtjhpLs=;
 b=ocT/4qvezVAgvnfZ8nNu3QQ/TxJxiNQzM/s3yl/OQfq6JSObg0v3sf1YmtDqbrKDDWO7bYMJgZWZbd+5Fp1d1uzdiUTFeBtWrUTwnlBigtPgwIG2Yp0/zb3+qP3Ra2Xc+MqJkgEteyzwNhg1xJChs4uwM7HnMtZguZpEfYmuMTatBbO/ydSv/N19g2FSJnVwE04nNKbp1bkzWtana3rjKIUk3fwvAYmGxSlA0/ZSrW/hOs6eqm6nagFwVFY/TxUnmFG/nuBv8asYoqdukhs5aYshaIlAR/qtOC4V3+o7tyNo9t96SOJEa/YSzp23LVwwL9Po7CnvprdwMBoW9oMFYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SN5SAcxAEsfJezqbkcUbjccmJfPmjvxWflxOOtjhpLs=;
 b=mxLpRS6gEjlFONCdyTO0IRnW6Bto03dtie6rGiZcoq7umo/WNvTKQ5MJeYEXHSdGxNlLwI+nXMgtye5dK+Sj3EuRz19Zlg5U8ABhsREL6fMJ/LxiJj7UY5LssUEYmTT/ygaDTUGXWk0mzoOfCPj+eLY+suQG/02oIYMC5j/+UOU=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by DM6PR11MB4315.namprd11.prod.outlook.com (2603:10b6:5:201::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Wed, 16 Feb
 2022 20:08:41 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc%9]) with mapi id 15.20.4995.015; Wed, 16 Feb 2022
 20:08:41 +0000
To: <yegorslists@googlemail.com>, <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH] package/libusb: fix maybe-uninitialized error
Thread-Index: AQHYIzmp4VInVgUsjkyWE9a3Y/1P2qyWm4OA
Date: Wed, 16 Feb 2022 20:08:41 +0000
Message-ID: <33f86c18-a0e2-9d21-8c89-046a6edf7693@microchip.com>
References: <20220216133140.14668-1-yegorslists@googlemail.com>
In-Reply-To: <20220216133140.14668-1-yegorslists@googlemail.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 743ecd7c-2ba5-493c-9500-08d9f1882086
x-ms-traffictypediagnostic: DM6PR11MB4315:EE_
x-microsoft-antispam-prvs: <DM6PR11MB431593C84D4CE16DF7ABEAFDE8359@DM6PR11MB4315.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KwvAKp2KaXDPtdHCoQI9Bz2AyrMsaPgyRJqbTuUESw9lTJF/xDk1vmN2YbK5p+yWkD9FZTq89FDPdPP37dRBYisp3xAt6vzRB4LgaxtUUL6x81N4pjSvGfsC9vIyPFZUCdZYcxAj9mAq+GOxVNIrztiRckk8DrnHnTA01wlKNsTaTZHAO30NCVYZ9A97LaZOdt0kUSJ/7qcRVPzBz2SLq3khwdlhnszB6NUJWC2WiEigQpL0nIKUikIQKuV/8+IutVpQNc8Q9ojVPwK9PURUQN24XEY8A2QN+r3+FCrtmDaHRu/Xf0kN71UtE4q3e412P8s+rwjeFeXS0zGVJVmfRazN/45hig8hOJOnGi7YstPNLSVhwnJDHs+1EFtpP1Bwpq43EMQrpB4il8WiZd3JroEWpCr0GIOZBNbps4DClLm4znxflv/FywMP5rXjGR5Hi+UhqBxRJRvqc2YHJW1BjT/mx1HLNnjfGRMntjZ+ICzQnZaAxVXhX/KVi+cFD/yaSzbSqoVLaCNIVZdOSDwZZ3tyGShgt8sRCR9BFLGJ0VlOB4ACb1yzSPzy12Of2/RRBY8BeU6i1YxKVBib0+5u0x3YcvWVUr+yDszvXc1WQrJrN0uddaMqugXcWhRCZflhMLpHZN93AhiDYLblJa0nWsMvpFx/czobuAlQMDKITEkaaNNkRIJv6ereN8kencjY5s7leZ1pVa0Dg6g/PT3evH3vH90E28B893X3DlEG0nFsBZvrFBrQ3y7sTxNJYyBDvXWAgGKOFoT/zoJ7/W9qebHz/9uJsFmNF5c9lCf+xNz0k1Zyqv2i/3lJeBkxPsI8rPqR+ID7eRcrsasCQaLZL5ep0eelWNfJMgyQFqILcM4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5384.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(966005)(6486002)(66556008)(26005)(2616005)(110136005)(31686004)(71200400001)(186003)(36756003)(508600001)(31696002)(66476007)(66446008)(6512007)(38070700005)(66946007)(64756008)(76116006)(38100700002)(122000001)(4744005)(91956017)(6506007)(4326008)(8676002)(53546011)(316002)(8936002)(5660300002)(86362001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVpiMEV1cVNPOG44UGJEcUxrYSttRlI4aC85ZDZIcWNuenNLaUVBUHJ5aEZ0?=
 =?utf-8?B?K1JYSnVIcGd5NS9LdmwvT0hKWlNBd3lNbzZFeVA1Zks2bjh1WmxQblg2eDZz?=
 =?utf-8?B?WFBTNGhyamNUNkZsVHAzZEpmL2U3UGJScWFYUHAvRmFIS2RvcC9NRFF2aHkw?=
 =?utf-8?B?V2orNHJjZ3IrRXJOQ1J5aW9NWVBLK2xQUFNVVUY0Ky9BQjJmYVI1NDlwKzRr?=
 =?utf-8?B?ekZNbU1QSGxVbjh0bHptWG9Xa0ZnL0xuWUU4cldrN1Y2MFV6R3AweVhYRGFX?=
 =?utf-8?B?S2FjLzhVM2MvdkpTTFFhYnlaeHdWZHZMSUorZ1lYUnRaRU15Z3pqS1RVMHho?=
 =?utf-8?B?L2oxNUZEV2xaSHcvc3c2M0J2UXROWHZ2ZDY0VVNWR1RiTHFGQlVsZ1o1c2xr?=
 =?utf-8?B?eWhyL2xmNis0ZktkZEhMaHVRSXdJVGw0bUE0UlBTaWlOT1RGS2gxYkRUbGpZ?=
 =?utf-8?B?MFBlVmhCblBvSmZXTnFBdUZXaWhQVlpMRHdNQlZQL05sb2w4NXdhKzgzQkhD?=
 =?utf-8?B?SHJwL1JLaWRpdlhER3Q2ZWw2RVcvTTNnYS9iem13VkxPU1g1aHlvZGcwcDZW?=
 =?utf-8?B?NzdJc0NUd3k5anJkS0IyRTNHTWRrM0REWERCdVZscGRsRWorcjdLZHFGRWxI?=
 =?utf-8?B?b2R0ZEdDQUZiZlN6MWVNNmRFbmd2ZHF5eHNZellVZDVEcEY1ZDdxU2luTndW?=
 =?utf-8?B?SDNiS2ZEZDFhcnd5Y3dGS0JwWFEwSGhlVHhTK1o5UVcrMXV6VThsVkpLRDNI?=
 =?utf-8?B?MFhKWkZjdkFRVEFSSlZ6SWc3NkVuV3p4MlJmVUpmdW83VWJKVE9nSDJsNHNV?=
 =?utf-8?B?SXlCN1pCd0JtMUp5OUYrNksrSUhsN3dLcXNQbVNoNDg2cXowalRhMlhhUVJY?=
 =?utf-8?B?RDh2dlpUdE8wTitJSEo2UllEdmJqSmUzU3JQcDlTay8xZDVpcGxkbFMyS2Jx?=
 =?utf-8?B?blZjbEJzNzdDTXh0RjI4NTRrNjg0Y2tsNzFvME9obUVyaXgySys2dlpCS0NR?=
 =?utf-8?B?eXJiUGMxa1dyUmR4R1Vmek9IdG1Kbzhia0pJSnRtQzdWNXNka1lQaUxXSWhT?=
 =?utf-8?B?blp1eEZLeUxaMTBRcENGYTJJUm91a2RUV0prbkk0cW53WmJNWnpVZElDQldC?=
 =?utf-8?B?YSsrdi90R3VDY21JNjZsZExicEJ4WEplS1pkVWdkTnVabjMwTDJDeGNwVkU4?=
 =?utf-8?B?Nytrd2tMd0src0ZrNHIrSC9qVGNEc3JHTWtnTWpHdXJ5czRCa0lWeEhJcFFO?=
 =?utf-8?B?d0xENFFncVViZFFMUzhtdnArZUJ2YzlqOUY1N3J1cnMxbFkvUEZMVkRacTh1?=
 =?utf-8?B?MS9tL2RwL0dVb1FqbUtVdkkwcmlHbER0UjJIVUFhUGZRN3NVUC9Cc1hHaWxw?=
 =?utf-8?B?Mzk0K3pRbEpRNDhyQ1ZDUVdmZDVFbzQxaGZzaGRpalFReGRyNUl6VlNRa3lG?=
 =?utf-8?B?ZVFZMFBlWXV6RFBrTC9KL1JMTmdlRnpYT3pPM2pmdkJuMkJvaXprYmplbTZT?=
 =?utf-8?B?QkUvVWQzSzNocXZsQVBnSlY5aW5RSWl4ZzZvdmJ4dzRIL3ZTYXpUVFo5bjE5?=
 =?utf-8?B?bXVCZk1aRzcxbXY4eDhWQ2dVdFRRZ2tJUmdhbWFwL2xzR0N3SkJ4elpwU1dk?=
 =?utf-8?B?NmxvNUJaNkhLcUJkRjJjTitFM2JQOXF0ejZsUStPMEhvUXZqbTBrbFMwamp5?=
 =?utf-8?B?cFNNQWEreW0rbnZMOURyQ2pucUtXUm1tWEFheXRJaVNzSS9lMTBlOS9pUDFD?=
 =?utf-8?B?QkxqTHozbW5reUxjTHVPdDUvMEZNZ2FwSW5sYzVBZEZ3dS8xN3dkOCs4RFBs?=
 =?utf-8?B?R2NXVHpHSTlrMldyUDNMUmdNTzRQTlNPTWFpbE9BK1lGWFB4NUFtSXhYajlX?=
 =?utf-8?B?Skc1YTkyT1dodjBIRUdCQjNJbEZjbE8vTFpEbGJ6bVJBc3NNUmhiWFZFWFVw?=
 =?utf-8?B?NHBmVGpXbXBpNm95elZ5dEwza2tzTlpPYkFENVgvY1VoSEhzaEJVcHphbGxy?=
 =?utf-8?B?aG1mTDQ3ZEJKSlVQUm9GYXpVNU5kdG5LaFhvZ3FGc01NWjQ5UFF6ZGsxNmhN?=
 =?utf-8?B?Q3crOXJTUnZaQ0E0NWc3enA5YTYvam1qNE45ZVFvaGQwazM0Tm5PN3JNVFM3?=
 =?utf-8?B?K0xTUEtKVWVobWhwdE5kRExRQ1FGYno3QVpEMTEwWUFQZ2R3c0lQT0thN2RQ?=
 =?utf-8?B?cFJmN1c2TDdJanNBUE5RNTB4OE5BZndNcHVGT3pnWi9kb3I0VXBpTENSTFN6?=
 =?utf-8?B?SFd5andXcDlVajZGUUU2OXNMOHJnPT0=?=
Content-ID: <2EA18CF05DB5BC42A3ABE3490F88951C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 743ecd7c-2ba5-493c-9500-08d9f1882086
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 20:08:41.2235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ue56RentybX273JPoE3g+0rA5QaposzQqZAJoxsczgES3MrTqlGZn8AxaSJg4kO71/8LO0R9DnoP4WGaA7eJuuQe5TqO9a6jlB1me7zEjdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4315
Subject: Re: [Buildroot] [PATCH] package/libusb: fix maybe-uninitialized
 error
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
Cc: zgyarmati@zgyarmati.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMi8xNi8yMiAzOjMxIFBNLCB5ZWdvcnNsaXN0cy0tLSB2aWEgYnVpbGRyb290IHdyb3RlOg0K
PiBGcm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+DQo+IA0K
PiBJbml0aWFsaXplIGFjdGl2ZV9jb25maWcgdG8gYW4gaW52YWxpZCB2YWx1ZSB0byBhdm9pZCB0
aGUgZm9sbG93aW5nDQo+IGNvbXBpbGF0aW9uIGVycm9yOg0KPiANCj4gb3MvbGludXhfdXNiZnMu
YzogSW4gZnVuY3Rpb24g4oCYb3BfZ2V0X2NvbmZpZ3VyYXRpb27igJk6DQo+IG9zL2xpbnV4X3Vz
YmZzLmM6MTQ1MjoxMjogZXJyb3I6IOKAmGFjdGl2ZV9jb25maWfigJkgbWF5IGJlIHVzZWQgdW5p
bml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9uIFstV2Vycm9yPW1heWJlLXVuaW5pdGlhbGl6ZWRd
DQo+ICAgMTQ1MiB8ICAqY29uZmlnID0gKHVpbnQ4X3QpYWN0aXZlX2NvbmZpZzsNCj4gDQo+IFVw
c3RyZWFtIFVSTDogaHR0cHM6Ly9naXRodWIuY29tL2xpYnVzYi9saWJ1c2IvcHVsbC8xMDYyDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFp
bC5jb20+DQo+IC0tLQ0KDQpUaGlzIHByb2JsZW0gYWxzbyBhZmZlY3RzIG15IGJ1aWxkLCBidXQg
d2l0aCB0aGUgcGF0Y2gsIGl0IHdvcmtzIGZpbmU6DQoNClRlc3RlZC1ieTogRXVnZW4gSHJpc3Rl
diA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
