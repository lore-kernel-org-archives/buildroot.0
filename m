Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4533C433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 14:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2450661C31;
	Fri, 11 Feb 2022 14:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8K5U_1NcAlIz; Fri, 11 Feb 2022 14:53:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F81A61C12;
	Fri, 11 Feb 2022 14:53:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B9CC1BF255
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 14:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8830041673
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 14:53:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com header.b="QQdG+2S4";
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.b="dfeoRpgr"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uscaBgbn9Hhi for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 14:53:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB8D540495
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 14:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644591224; x=1676127224;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jw7z0gZMDjsAeXRKTf1Tm13i4hQGC787H4GdcrhkFh0=;
 b=QQdG+2S4N0s7Z4E5WI9viXk0ej45hU6Ic5brdsP+bMlNpniVHqmdmT5v
 Fifm47hUwJhLYLjK5xJt9n0b1sBkFLaDyK7HMTXcOxkjo+/kBnEu7sVyr
 aIXryeBNJqzLgkIcW5000Fh769um0asc5g8dINIOJTgEEgS6tVh3S2a8D
 RQGfvUgY6x7mF48Zap5fvdXMt5Xrkq8hQ2ZXmmllh4hqTaER4IQgnglV4
 I/h/E3JukjMRmLOrGGkdOdmMWAnKUACtBLRVeLr/W9mAKcxKQP13KXcQv
 80xhQyKGdCvD9yUEO2koqGw6nTnXg1oVapZD+92d1B9aZ/HpEPnj3zR25 w==;
IronPort-SDR: q9Jbmhu+FpyPVnmcqjQz43j3NTh0V6veOPrLYkpSs1WOVCKrjzUeWDhO/nbXFZcINj2tAX8GUA
 O6k4Qe2ZpXZpR2RUrMaosKkQp6ErrCAT9vvWzKKmNkAoC57lD+TqK+1cW0uO3ThyZ6bLl+rZYz
 qur1QoDxGdNsiTE/QXYQxfu+ImOfWzREH3yZshpoYQIA/UEmIAJZaht5EjwoXLEewq32dQfvv2
 Sg6TnDyOQ8k/H1xS3+oysEEYlNSPuree2uE5mGV4KUKzEW0LFdCrjh3lwjP91k2lWDkscfgtLJ
 Lmgbj8c0gZPU/5KYnEZ1iP9f
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="161934642"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Feb 2022 07:53:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 11 Feb 2022 07:53:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 11 Feb 2022 07:53:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3LC3VJzul8+n3VoQj+ynN1mWY1GYDqhrXRdRMa0//xdwRU274XtEodI+QugHoB1wncH3W21WA1Bf3rsjVFeGP9VerEh3b2biGI90KFHk7LBMYxIv4+Zu+wb9qdo/Co4nZgvd9+fuwhZxZHliCtd8rAnXGlA2C1DJIgzIHNmM50QzB7t+JmLc7xkOmhD3wVHMBO5wW9e3b6WvKE64683i8EKYE+TkLisjP3EOv/gPyThCtRXjCeYlajFG+S7oXBAYf9LtyKRoy27saeaLpKDbf8ZVmq4k2dYPhRHvtitXBi0yDiLQhBtjovLiOaWGqnoMoCa8MGbeUDE9OLg0WQG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jw7z0gZMDjsAeXRKTf1Tm13i4hQGC787H4GdcrhkFh0=;
 b=lrTVecK1hFyDkr401aLlJJhk79y0qoPY9iuAfHWpm1xLJD3kAEVTFuCe/H4YwlXlpujTbXeCtgOGXDJnvVp3oIVPrwnJvfDNgh9gTbsL4eVPJ5GXLzU/lPxc80tY4K0faHW2mFTIkkp/Q7Y9irHDSpS+m7S08U03S6m2Xg7UIkV+iF+4VgUnoSn7mAMnxN86Qqloo3g4uFldpjXuVpYpyurElJpoalKcYS7LN4I7+S6ZmjFQxVxWjCC9XmVWsXGnkEFhXjstOkIcx613zWAPeNw6/obhFP3pUtX8dzNaCwpNue9pZgAKCACo/FYXCWr5nGUdKIfPSeXv78007XmyYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jw7z0gZMDjsAeXRKTf1Tm13i4hQGC787H4GdcrhkFh0=;
 b=dfeoRpgr/GFVMAMLNjGNYOIM2OvE4gSnWN7Epd2+fHYhCeScfND+mQVbLWyRj3Yc/E5zMTbl9kn/1cMFr/Gg0Gw+dQO6SfY6h3OF5DTMoTf8K/ZlxsEr0K8RGgNzOHaHJGTjwjLCHxf1BUfIz9RMtPJOdxj9AcFqaOIN1y68RgI=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by DM6PR11MB3753.namprd11.prod.outlook.com (2603:10b6:5:141::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 14:53:36 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc%9]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 14:53:36 +0000
To: <giulio.benetti@benettiengineering.com>
Thread-Topic: [Buildroot] [PATCH]
 configs/microchip_sama7g5ek_mmc_dev_defconfig: add rng tools
Thread-Index: AQHYH1Dt0dBu39RWQUe8ti4VtGyO16yOaZeAgAAGDwA=
Date: Fri, 11 Feb 2022 14:53:36 +0000
Message-ID: <a4228ec2-c44d-8985-faf5-3ea935e87d58@microchip.com>
References: <20220211140855.917229-1-eugen.hristev@microchip.com>
 <C7BBE4CB-5D29-40AC-830D-C4A78198CE02@benettiengineering.com>
In-Reply-To: <C7BBE4CB-5D29-40AC-830D-C4A78198CE02@benettiengineering.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1085859e-2054-498e-1498-08d9ed6e4830
x-ms-traffictypediagnostic: DM6PR11MB3753:EE_
x-microsoft-antispam-prvs: <DM6PR11MB37530B7838E943E99303BF36E8309@DM6PR11MB3753.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ti2QQQSgzvf1RWiTVUDxdpnMEjMILEBj2DWNYKuabtoKAKiPWkIHMUjOhnIEHw/vH9iLhskqIkIohPang7UQD73zuC1LGT9cBZ01Ii5r3zGGyEjOmsN4Wt2dmEZ9msV8iMT2dO643N5C38BBC0vsm+gJzcIDtj5H4XyJ4NzwniLRVjdrQO3/DZpChXdknGf/uVL1cQtq2rEFDcfobW7R53t1s3yj/EZoZmA78wOeEod+L4IE8AanWJx/7z8HzKfuZRjvXur8doFr8HkBdpr/GY6poaLwSM1ZTQW+s1V92R6AMcDtELEUfFHcG2OLPG4l/W6hF35jO8F6NQ1ixovOM0eexTFzF23aitSBg00D/M9gvV9BpdCCxOItRi0XJFF2lh2eB1arm5er3sxTSCGfI9sR/eYzobT0j5cSEOJmQm3Xo7Bhn7tvfMTB/mfTmE7EHC4IzIbqx9U5pXs239TzNQLLCxtckU8gkyLwxhoiRsxq9/h5gR6t6aCHBOz7TvmNb2COQMyy+Og8sNFgmIV4c7PFpoif5uvDQA8jf4y5ljqCISI2S1DgFKeKD/jCOfGBUoD4/tStjUtgb1g+qPGqqoZbVMYBQli3WBYrhuRID/ruib1JwmDHHXm86Ah2eLZ934iQHKdux6FewbHiXTKIzN3fMzT69pxNXLV18KjY4M03JyQwjeljaRyBeTUGhcjBw5XbmWTqdYRs0dwzAwnyDVz9f2tWCi0vGVLNgeCUU/Ye4jNQLhQv5xGfRpFL8+MBiuu88wjwvmgdqhdAu7RF6i1AJ0FXR0OBfjxck65UtzD3QWIitVoIY19rTUB2PY9nUZOE/Ky+7Fegafsuzgerji5YbIViDgrkUfZmdGa28AM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5384.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(316002)(64756008)(66476007)(66446008)(66556008)(66946007)(4326008)(53546011)(8936002)(122000001)(6506007)(2906002)(966005)(6512007)(31686004)(6486002)(508600001)(26005)(186003)(86362001)(5660300002)(91956017)(31696002)(71200400001)(36756003)(76116006)(6916009)(2616005)(38100700002)(38070700005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUhUS3lsZExsY1NUN2kwWFdJRENVeGYxV3o5RkFZdXVYRmVjaHVyWk1qRmU2?=
 =?utf-8?B?bm5zR2hEMHE1SWFRUTRSZzh0c0JJYTB0NXpIUGIvbVJxZ1YrOE51OVd1VE9a?=
 =?utf-8?B?dHUzTmJkZ2huT0VZbjlmdEgybkNrQTRUZllZc3NzUmR2ZVRqSW9iRWFDekN4?=
 =?utf-8?B?R2RYaUsxd1ZRZmZRWlEySGY0ZkhxZGZQbEtIRVFDRjlIa0RiL3FPb0EwZVF6?=
 =?utf-8?B?L3RXZHVyTW44TDR2QXJwcnQ1ODlRcjd4Kzk4OEdxWjVKeHJndjBIcDcxYjZp?=
 =?utf-8?B?ZXNva1VFWFZ0eUpZd09DY2x1bDNVYTg4dm9WSXRLY0NNeS94VnVGNm82WHY3?=
 =?utf-8?B?NUptNHBvMHZtaHBMZk1TdGQ2ekJWOFJmM2dyRzl1WUJSdWs5OUpHcStiK1BC?=
 =?utf-8?B?cE4yd2xHRENPbUluNEEySzYrVmZ0bExuU2Z4TG1MVnRBZWlpdkprU3QvU1Np?=
 =?utf-8?B?eEw0QkI0SUluVzFXTDFkMi83aTJCdU84VGdHdFAyMllrc1RObmwrTlZ5WmlF?=
 =?utf-8?B?TllWOFd5dWQwKzhPRHBBL1p6LzBRaUM2QnFRWk9rNzJmVjNybzVkczBSa015?=
 =?utf-8?B?T0FTTU9QajcwRnZOc0lUQU8rVkpIWHU3V2Rud2xsSHErTWIrd1hROUZXWkQr?=
 =?utf-8?B?STZyZmxPSk5TOFQwdi9JYi9qVWVjVUFPRDFyaHZZemFJaW5uV0h4a3J6S2dJ?=
 =?utf-8?B?MHhnWWs2NXl3NzUwRDVMSlRKc2tsU2dCRnJyVXNUaXk0b1pRb3BRRnZpTVAr?=
 =?utf-8?B?OWxKZ09iMFNwbkJpaWU2UU9kNHBra24va2FYQjFsTWdob1hFdzIzY25TdlA3?=
 =?utf-8?B?RjJnRWYzWW5XUnQvVlBLZmZ6ci9XMkUvNEZWbUR5NHdsaEh4L1JBN2Q4cVNj?=
 =?utf-8?B?UGY4U05UaWY1K0N1d3RMYnByYWhRRGtIejZicTBsZmZ6dFdFbEx1N1lEZ1JE?=
 =?utf-8?B?UURXU0NWMzZJV2RsOVhDeURtbktKRG1zdzhmSHk0TVJUYk1JUW9sOG8yeVlF?=
 =?utf-8?B?ZjA2RTVpMWxhN3Rwck40cVNiYmVoK1NOMzU2RGFiOHY0Smo5cnREaVl3cmFZ?=
 =?utf-8?B?WWlzUmRiVkpKVXNlSll3N1pNQlU1Z1VUNEZKb21HVG5KU0tQdG45RkJpK042?=
 =?utf-8?B?T3pTcmUrMXhac2QvWHBqbk1hWEFoWnhmaVBsZ2t5Smx3SGJSUXQ0Q2JWWDNW?=
 =?utf-8?B?eW52aVZVc0xiWkhsWkEwbDBPQzhVQWxWVSs1V1h1Rkg1QXdPb0phc1d1VGZ6?=
 =?utf-8?B?YTA4RmhGbmJuR1ljMHp0aVJrRmJERDJ2anJCK3NicWtEdWVrcUNnMVVFT1dq?=
 =?utf-8?B?a2EzR3ozNGpsakJheEoraWZTQVl1bkUwSVpVN2lmb3VwSHBkWUVlSFlXKzhI?=
 =?utf-8?B?WFVpWk96WmFOZWFCUDV0N3laTTlqUlFCckNadTJrZ1hQQzZDM09tVzB2S3hh?=
 =?utf-8?B?N0NSYk5mSCs0ZU5PYjBjbTBwdUNmeVZBSHMrdWFLa1NDY3hXcTVPUmx0TmtX?=
 =?utf-8?B?VGxaeCtVYUxTdGl1UlYxa3RzQlVIWFNEQi9RSkZ2bHNZOVRwWXNJUUcyQXhV?=
 =?utf-8?B?MmMwaVVNbDVGZlNEeTdtbGlnbmJubElpK21NcWoxcG4rZ3htZDh2SWFoU1Y5?=
 =?utf-8?B?eDVjNXpNaUw3ZG1sZjgxaW1rYmllRUlKNXM4Rm4zWmhpL2dxTUlVV25CNmxX?=
 =?utf-8?B?VFpOdFNiQnUrSk1tMThnQ1d4M3dyb1kvNzNaUnJ6dkJweUtienJLVHB2KzFF?=
 =?utf-8?B?RUorYXBxY3FEc0lpN3Rhd0ZQYXZ0RTczUXoyWkpnL0hSK0VhdlF2cXhqOG9U?=
 =?utf-8?B?VUJPR1R4bGs5UDN5MlBYTlFwQXdBeTlNY1VoK2VFNGtnQXkwL21POENzWVI0?=
 =?utf-8?B?Si9raFpia2pJMU4rUVNlb0Q0NXAySHBpL3N1TGZrckdWc1pMZWoyckVqaDlt?=
 =?utf-8?B?bUNHWUdFUU95RWZvMGYwVUUzSDRZN1NTbElrL1J0aDV3eEdlaHUzTkN0bk5H?=
 =?utf-8?B?blhTVmpCOWUrT1RnNVNxZDlMV0I3MndVdkpFb2Z6dEVjam45Y01ZdzZBYkxh?=
 =?utf-8?B?TVBBQitGSmhSdS9UKzNFcStiWE9ROVBHaURLNklxMmExNWhtRC91anpJQTBh?=
 =?utf-8?B?YzlJSVh0aXpYekRmYVhnZjdEVXdudFRzU0hEeC95cE9iWXhrQVY1aUJmVzFw?=
 =?utf-8?B?TTJkTnhKelJiVnZnOFpNcVVPc051SVBSNHpzREpoVGhrQW9qYlVtajk2bVdu?=
 =?utf-8?B?OVk1RHpIcnc4ckVDT3VKbFJKcEZ3PT0=?=
Content-ID: <D6570F593FE63F42AF94281C2F87DDA7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1085859e-2054-498e-1498-08d9ed6e4830
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 14:53:36.2463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q5p5X8wh8OACBFhobzqJU7lvLG9FjxfxKTOnOWKWTUpGotzpPpuydQJIxP1fA7alm/ieSk6bNMAmS+EuzkwabFp3X12gCkH9c7KFIOF0yrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3753
Subject: Re: [Buildroot] [PATCH]
 configs/microchip_sama7g5ek_mmc_dev_defconfig: add rng tools
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

T24gMi8xMS8yMiA0OjMxIFBNLCBHaXVsaW8gQmVuZXR0aSB3cm90ZToNCj4gSGkgRW5naW4sIEFs
bCwNCj4gDQo+IHNvcnJ5IGZvciBodG1sIGJ1dCBJ4oCZbSBvbiBtb2JpbGUsDQo+IA0KPj4gSWwg
Z2lvcm5vIDExIGZlYiAyMDIyLCBhbGxlIG9yZSAxNTowOSwgRXVnZW4gSHJpc3RldiB2aWEgYnVp
bGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gaGEgc2NyaXR0bzoNCj4+DQo+PiDvu79B
ZGQgcm5nIHRvb2xzLiBXaXRob3V0IHRoaXMsIHdoZW4gYm9vdGluZywgcHJvbXB0IHdpbGwgbm90
DQo+PiBhcHBlYXIgdW50aWwgJ3JhbmRvbTogY3JuZyBpbml0IGRvbmUnIGFwcGVhcnMuDQo+PiBB
dm9pZCB0aGlzIGJ5IHVzaW5nIHJuZyB0b29scyB3aXRob3V0IHRoZSBsaWJqaXR0ZXJlbnRyb3B5
Lg0KPj4gTGliaml0dGVyZW50cm9weSBpcyBhIGppdHRlciBzb3VyY2Ugb2YgZW50cm9weSB3aGlj
aCBkb2VzDQo+PiBub3QgaGVscCBmb3IgQVQ5MSBjcHVzIGFzIHRoZSBqaXR0ZXIgZG9lcyBub3Qg
aGF2ZQ0KPj4gZW5vdWdoIHZhcmlhbmNlIHRvIGdlbmVyYXRlIGZhc3QgZW5vdWdoIGVudHJvcHku
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNy
b2NoaXAuY29tPg0KPj4gLS0tDQo+PiBIaSwNCj4+DQo+PiBUaGlzIHNob3VsZCBnbyBmb3IgMjAy
Mi4wMiBpbiBteSBvcGluaW9uLg0KPj4NCj4+IFRoYW5rcywNCj4gDQo+IEhlcmUgeW91IHNob3Vs
ZCBhZGQgb3RoZXIgMyBkYXNoZXMgbW9yZS4NCj4gDQo+IFRoYW5rIHlvdSBmb3IgcHJvdmlkaW5n
IHN1Y2ggZml4LiBVbmZvcnR1bmF0ZWx5IEkgZGlkbuKAmXQgaGF2ZSB0aGUgaGFyZHdhcmUgdG8g
dGVzdCBhbmQgZml4IGl0Lg0KDQpJIHRlc3RlZCBpdCBvbiB0aGUgcmVhbCBib2FyZCwgb24gdG9w
IG9mIHlvdXIgcGVuZGluZyBmaXggZm9yIHRoZSBrZXJuZWwgDQpidWlsZCB3aGljaCBJIGFsc28g
dGVzdGVkIGVhcmxpZXIgdGhpcyB3ZWVrLg0KDQoNCj4gDQo+IFJldmlld2VkLWJ5OiBHaXVsaW8g
QmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4NCj4gDQo+IEJl
c3QgcmVnYXJkcw0KPiDigJQtDQo+IEdpdWxpbyBCZW5ldHRpDQo+IEJlbmV0dGkgRW5naW5lZXJp
bmcgc2FzDQo+IA0KPj4NCj4+IGNvbmZpZ3MvbWljcm9jaGlwX3NhbWE3ZzVla19tbWNfZGV2X2Rl
ZmNvbmZpZyB8IDIgKysNCj4+IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9taWNyb2NoaXBfc2FtYTdnNWVrX21tY19kZXZfZGVmY29u
ZmlnIGIvY29uZmlncy9taWNyb2NoaXBfc2FtYTdnNWVrX21tY19kZXZfZGVmY29uZmlnDQo+PiBp
bmRleCAzMjUzYmNlNDAxLi44OTVlNjNlZGNkIDEwMDY0NA0KPj4gLS0tIGEvY29uZmlncy9taWNy
b2NoaXBfc2FtYTdnNWVrX21tY19kZXZfZGVmY29uZmlnDQo+PiArKysgYi9jb25maWdzL21pY3Jv
Y2hpcF9zYW1hN2c1ZWtfbW1jX2Rldl9kZWZjb25maWcNCj4+IEBAIC0yNyw2ICsyNyw4IEBAIEJS
Ml9QQUNLQUdFX01NQ19VVElMUz15DQo+PiBCUjJfUEFDS0FHRV9NVEQ9eQ0KPj4gQlIyX1BBQ0tB
R0VfV0lMQzEwMDBfRklSTVdBUkU9eQ0KPj4gQlIyX1BBQ0tBR0VfRVZURVNUPXkNCj4+ICtCUjJf
UEFDS0FHRV9STkdfVE9PTFM9eQ0KPj4gKyMgQlIyX1BBQ0tBR0VfUk5HX1RPT0xTX0pJVFRFUkVO
VFJPUFlfTElCUkFSWSBpcyBub3Qgc2V0DQo+PiBCUjJfUEFDS0FHRV9TRVRTRVJJQUw9eQ0KPj4g
QlIyX1BBQ0tBR0VfU1BJX1RPT0xTPXkNCj4+IEJSMl9QQUNLQUdFX1VTQlVUSUxTPXkNCj4+IC0t
DQo+PiAyLjMzLjANCj4+DQo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdA0KPj4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcNCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdA0KPiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
