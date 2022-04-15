Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0CFC433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Apr 2022 11:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 744DE41867;
	Fri, 15 Apr 2022 11:02:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DfaH_06sLqGy; Fri, 15 Apr 2022 11:01:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A45B41829;
	Fri, 15 Apr 2022 11:01:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 400C91BF3A7
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 11:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C450607AA
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 11:01:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com header.b="K2uJX7if";
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.b="sBqxskgE"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BKe5xKilNGnQ for <buildroot@lists.busybox.net>;
 Fri, 15 Apr 2022 11:01:56 +0000 (UTC)
X-Greylist: delayed 00:07:06 by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1EEB607A8
 for <buildroot@buildroot.org>; Fri, 15 Apr 2022 11:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650020515; x=1681556515;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1i6qcAOl5rfd88PEu05ghgtm78Cpe9gbkaQDQsakOFo=;
 b=K2uJX7if/hSBgmQhzV6+dqaftycubbgRoMxvIfENT1pdGumRmrfXcmOF
 gUeuW+oGgKEPoG9uDvF7JSGBwhRzcDpNXrdpon0ENZEAPQ7PoPt9zryWy
 XYNvaNzvO0JgPuHRr52uNvkCvhhC+Sr9T6nfk/nb5H21wHGcusI78/0jx
 mw9+Jvxqn7P5pmzdoeCFLEZEB60qBa0YjzJh+ol5gF3a9XwrBkvnwO3vu
 GjjceeOvtAbYhlzkuMeA/1Nx6MB2AqpPDfVXSs+ByuOymBal93rEHVwrB
 UXTYlaS9yN8Iw8MjMi2tYU4qQ0YCk9ZDHBFXDhf0Y543N1Tuv2wbGhGAr w==;
X-IronPort-AV: E=Sophos;i="5.90,262,1643698800"; d="scan'208";a="155672593"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Apr 2022 03:54:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 15 Apr 2022 03:54:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 15 Apr 2022 03:54:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxHFarnnvbTWBm5E6IbOMo5vqw3vKAYE9fQvcgbplLhShP3AWPKPlO8Bt8eOdARfO492RoGgHTdP01xIzeeZNvlxjN3J/r+xU2XGpdPLll93UFmXmsRA1nV+2UZVO8t1q5EtXtxDPj9LXIHxWl4Sh4oc3jNCxbngmDbD7CN9z/gTQaVaznkv+7KuZIPQjfo0czCna7z1HFdh5Kh+NDruz9bfqRDp/KSQJWTKQ7Y8UIIahaWnyvDRCWZ3YIbxIAfPgKrd3aIWiyrg0rHIG+HVuEYRRIYmLeW6mMdOw65/3dXqi9354j1NrLPj24nQDX7aXixFjxhooPT5xl/xERQoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1i6qcAOl5rfd88PEu05ghgtm78Cpe9gbkaQDQsakOFo=;
 b=AWaTIzDID42Q4BZxb/nDf/ozRQw6IIeZRufePZJ2+sOW/YOeep1HToNFjAbh0G0Wc9R7owXJgv18zMCAElgPwGvBtjuV//vcSZwk0A7lmo5ub3qCjSUviGC/YJFywkUe8X1sng28GrLEltj6ijuxCLmWIIrZJFCUqOwtwueV3unvw1ezfMgK/ZXpmkyP0AuqIoihZ0EQHs4S3fdx4Iafk+m3O7hdrFyPI34I+fUAdjm0Bt3hzSRI1oxwn94X6iK7mbbMcAvwPJGtpeer4bAy3XVD8Fp2nT8A7cjyegwV7hS4OcX3YhjRjLXvmekcLhOL5euQeJXGhcUOquYMF7jnOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1i6qcAOl5rfd88PEu05ghgtm78Cpe9gbkaQDQsakOFo=;
 b=sBqxskgEoTlEwYsSjVFC+1KIvoVl2scuXwIvdb/6DFpD+3aOCuH+tevjzAecIPLkP2ZvDG8JxTYKvsKUnxz3G3TP8pqcvql9Q3u1Ah91Mppo9f3HF8WcwbwPQUKOMaQay29E3rRLSSrvvny+01InBh3Qnel/7GqOkKcffv0OPJs=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by DM6PR11MB3195.namprd11.prod.outlook.com (2603:10b6:5:5d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 10:54:42 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2%7]) with mapi id 15.20.5164.020; Fri, 15 Apr 2022
 10:54:42 +0000
To: <Jason@zx2c4.com>
Thread-Topic: [Buildroot] [PATCH v2] package/urandom-scripts: hash old seed
 with new seed when saving
Thread-Index: AQHYPvG2i9XkGBxbVUCjK0YZEk7r5azOM0qAgAabY82AHCHWAA==
Date: Fri, 15 Apr 2022 10:54:42 +0000
Message-ID: <df314344-f151-7ae4-1e56-b65b8532d6d2@microchip.com>
References: <CAHmME9oUAXNpjWF266m3mH5HvEvVWCthy64RHFye+mOktMegzg@mail.gmail.com>
 <20220323200731.170409-1-Jason@zx2c4.com> <20220324082433.GA3649946@scaer>
 <87fsn2b4ht.fsf@dell.be.48ers.dk>
In-Reply-To: <87fsn2b4ht.fsf@dell.be.48ers.dk>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f50af88-7551-4926-01e5-08da1ece586e
x-ms-traffictypediagnostic: DM6PR11MB3195:EE_
x-microsoft-antispam-prvs: <DM6PR11MB31955B71B20CED737005BA99E8EE9@DM6PR11MB3195.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KudeaZIZoWvnY20e/oCsv37p72WodiTZpcTUqvwjKTSbQQy+FpuiIPTRVdu/jUXc37uAwsibet7lUDY1PQTJ8jxv9zF8cjDYOTRIkGH1ToNETg/TQBcTvRfjtBGTGXxd6zpdWBJamhgrxhyScA7Mzxun5vBuqQx46hPqOpazHFd8XvHyNy+Q2C+bCug0PeNPN9gqxcy5lee2dbr2glfghvuUCs34mge7U5U8N62D17aZ5R+/3qFREQNRZP/GCTSd7KtpOggKJi2oik5AO7i5HzvmQEZ+Y22aayb/Ib3X4pUsXdic5Up7vMdPHsCKy9wuR+UnuvUbfNGkrExFjsjc05Syf+oh7eRQMQHHcQSGDyPbrRnhQNLLOLZfgC3ilertwijY0w8kRWZ3c4EZg3Q4pvqB08/PZMHFCGLQiiExWV/3c+2wB5vf9dMt2d0NOenLtBBPv677GxI80xd0I4TpYrjGp8vx0IijLBrneAtoaQfUgupBJdqEW4D/qK+EOAkZFxAOCAEeAM23iRD5urI4+rox2V7tDlgq3QY9BtgCYuTIV5qI2Veg/gjtqAoSOF62hx2YXbqzY7JotZpoKOfJRD1NVtM1pcTtGVyA8H38DjuamKNfPXYhKGIBBlVybKbdHApUAp44l3Z/S5/AvNlt/p8t21RrVuF0qDErNM8K6hFMJ1+tn5vHjWl1NFetX5/pUWSWlG51EByCcLbSWpw6E2oLtL201SBViMYKTuIIP2bqvQIP624JHffGSTx4PPfmeFIhImxHEl99Cvrqf4BF3FBzKfzb++S3uf9boxGiWTMd6MNEd7o6Hv+6aQ5tmUNwAR+WW9+a/fVqhajF5RRmQyU6zhr89ulvLgQSFQGj4SJOaKknnf6ANOzCUjej6m+pHCiC35A0eHl8CWv2V/eBv2YDIc5Jlc7+VH3n/ZRcRz8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5384.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(54906003)(6916009)(2906002)(6512007)(186003)(6506007)(26005)(2616005)(966005)(6486002)(71200400001)(53546011)(83380400001)(316002)(508600001)(8936002)(5660300002)(31686004)(122000001)(31696002)(4326008)(86362001)(91956017)(66476007)(38100700002)(8676002)(66946007)(64756008)(66446008)(66556008)(38070700005)(76116006)(36756003)(41080700001)(43740500002)(45980500001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWtaZUQ0WDhhYmpMaVd5NDFhd2xmdzl1MVJzeXlnVXZtRVB4emNCNDF3YTd2?=
 =?utf-8?B?WlQzWExRR2Zaa1FwSzdic0VrenptRG5hQXc5aHVxTlU3dWE3UWVNd1hGSlIy?=
 =?utf-8?B?bTR0NXlHR0dWZVBPZ1JpUW1DUitZdjlBbGRFNzBVSjFwYXBiK0VzL3p5M2k4?=
 =?utf-8?B?cjhORUR1U3Bqb0FUZVVlN0VKR0JkdkNiZ1hIclZwLy9mdzFSMFJJYmxTSE51?=
 =?utf-8?B?aDNWSkVwK0xROC8zNUo2V01kZjNkQXByZFZQdGM1WnREQlVyU0ZhV09NNDJy?=
 =?utf-8?B?WmFoSG1hZVA2KzU4Z2loZ3FtS1laZEFMQVIzVkRMQTBPU2RaN3JFNTJqd3BQ?=
 =?utf-8?B?NWx3aUNwTGZiLzZsbDFJdFlEbmlEeEZCYkNXVGVoTHFqN3R2RkV6RmJwUC9E?=
 =?utf-8?B?cnZ2ZFpRWGNqUWRqTmdUYkltWXBqMXdXc3RVdzlyaXQ3aDYwT3ZhSEpQaFJw?=
 =?utf-8?B?b2ZvNWJ4N0NRNHVqMi9kVXFmVTlxd21CcmZyd3kwV0V4SlAxdmxrbFN0dEZJ?=
 =?utf-8?B?eGpQdWNSQ3oxTTRtRDB0NVkzV3Byd0NCZGg2aDRmWFJLZkRXWG1pUTlsTnJS?=
 =?utf-8?B?Yytnb3pudkxPaGFWK1MxQ0oyVUxLc0ZQclUvNTFJNTZ2aGwyVEMwcHB5UVFS?=
 =?utf-8?B?R2lRUmRCcXBSTGhiL3hiV3dWd2lPa292R0tYdExxNks1ZHVoWWdMdU1QWFBo?=
 =?utf-8?B?MkFHaUt2eDBhZk8xNm5IWlBzSW5kNWRIaWFZRVd2MXR2enJXVVRycmxNR3l3?=
 =?utf-8?B?SFEvakJoYmF6M3lERlVUWk9pY1VuVzRUU2lHRUdvMm9pZFhkK01KTjVrS0M2?=
 =?utf-8?B?Y1RDRVVaUktIdG8rcGdXb01hL29uR3pMRGZJR3NHZHJNUk10ZDBUMCs4aW03?=
 =?utf-8?B?NmQ4RXpuWncrejRXaHhxVS82d2gvQUhBYkk5akNlUW53azBRL0dFQXpKMU5I?=
 =?utf-8?B?QmZFTWJFY1dMTkFoenhCRmFzVlVxZWVmNVZobUxOVHI2aEF1RHNsNnFRU010?=
 =?utf-8?B?c2s5akhjcE5vakZFaG9rZzhjMnJVbi9UdFRydk9uUWd5SWp5NE0zODMwaXA1?=
 =?utf-8?B?UnlRT1RkYUhod2ZYNkd4eFBaY2hEL3dDb3RhTS9VOStUZzZTRXExZXVQRHRO?=
 =?utf-8?B?YXlwTFlBL3Mwd09WdkJlRVNnTmluVkJWcjNlKzdvSnlKT2dFSFRMYXBaZHNv?=
 =?utf-8?B?V0VpMWRHZUR3bW1oMkRCaXpBbnNSVmMwYzlzWmxNT0ZhV0dKQXdFL0sraDdE?=
 =?utf-8?B?QUZ1bHZWQjBMMzNBdm1WSXN3dFJCb21aY09LSkZOaW0yRFJhUFRnT0N5bjZT?=
 =?utf-8?B?REVJYndVclRaYnlRY1E2a3hmSG1TOE1TWExpR1FNOEliOFo5cVl1dnRBQ1JB?=
 =?utf-8?B?bFRLTlAxL2lnTjFoWHNBYUZwNmtrK29lS0lEelZ2RDV0LzlZMUhrRHQxMFJj?=
 =?utf-8?B?TlMzWkhoRVdlK2pMRnhoT1lIVzVFNXVzdU1uZ1JvMzFGaFdra2xFejlldnVa?=
 =?utf-8?B?czdjRjBlSUcvZVFNS1M5TlNuajJUWXcyK21adHI3ODdVcHVBd0s5R1E3aVZ5?=
 =?utf-8?B?eWZNaUVneXUyMGorbSs4ei93T3FqVHJ1OU5JVXJ2UkNMTzE5Sk9haHQrYTFM?=
 =?utf-8?B?c3ZzSlRCdGhMUW84ejFVS21ZRFR0RkttMkV3OThrS1NoZStVOWwwN3I4SGxN?=
 =?utf-8?B?M1pXY0xENGlVVWVGUmpuOXJuQzhPRkRBTkFoZE5UVmtOcVFiMnVEN1pNUUdD?=
 =?utf-8?B?dmZWYllyOTJ5NnZqWk9vYmVCTzhjc1Z4WDRWUy8rKzg5T2R6Y0cyS1RYRjEy?=
 =?utf-8?B?NGNsRzFob0wrWmtJTHRKK3RNVE1NSFJha3dFQ2lEc1owRXV0bi9BeDRoMXdi?=
 =?utf-8?B?Z2swRWFScnU2SUVTUUR2cU1UL0FQM3kwdHdmb1BCM0xjeFRQWXJRank4S05Q?=
 =?utf-8?B?L25aZGZ4TG9wYjRxSXhnWVR5UWVwS252L1UybU1IcXlxTmk5MHRaUTMyaXJT?=
 =?utf-8?B?NVVXZkdHZkZ4c3pQRnRVR2h3bHBFczZYUWFhM0ZldkhWNm9hbnh2NzdiRy8x?=
 =?utf-8?B?dkxEb3Rld2JPdXkrcUVxSUdSOUFmU2NlYk9nV1A1NkdVUUtxOVV1SXN2amdO?=
 =?utf-8?B?Umc3VlBnWjRYU1NJUG50bTUxY2Y4QWJXb0h3Ri94Q3M1c2FFVDVYbGNUMmRL?=
 =?utf-8?B?c0RKUU1HZ0h3VG5PeWh6WDZiSkluWG1iT1dlS200aWRNY0Z2eUNBdUNxellT?=
 =?utf-8?B?dlZoV3BQbTdNaVlCeHB4dmtWTzh0cGZVTXlvMFFoUEl0ZFBkOGkzUlpmNDht?=
 =?utf-8?B?VjlqMnF0VzRTUXYveDIzK1JiUXZRL3dvTnVDQ0hNbUdDQmJEWklleXZRY1Zk?=
 =?utf-8?Q?B9hRaPLWqMWUBTRA=3D?=
Content-ID: <B25AA811FA1EA545B69A579EF599206C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f50af88-7551-4926-01e5-08da1ece586e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 10:54:42.1734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YJG5HwFqAMDPVVPf5qR+AANQ5v0xF8yuyOEPftM8XYBOL1eQ1w85CoDmh597vriyCKUXNNNMn/LMeGTf5AuWvN+K7D+eSK+JUKbaUC2am7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3195
Subject: Re: [Buildroot] [PATCH v2] package/urandom-scripts: hash old seed
 with new seed when saving
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
Cc: yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 3/28/22 4:17 PM, Peter Korsgaard wrote:
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>   > Jason, All,
>   > +Peter: candidate for backporting as a security fix
> 
>   > On 2022-03-23 14:07 -0600, Jason A. Donenfeld spake thusly:
>   >> Writing into /dev/urandom doesn't actually credit any entropy bits. And
>   >> while it adds that data to the entropy pool, it won't actually be
>   >> immediately used when reading from /dev/urandom subsequently. This is
>   >> how the kernel's /dev/urandom has always worked, unfortunately.
>   >>
>   >> As a result of this behavior, which may be understandably surprising,
>   >> writing a good seed file into /dev/urandom and then saving a new seed
>   >> file immediately after is dangerous, because the new seed file may wind
>   >> up being entirely deterministic, even if the old seed file was quite
>   >> good.
>   >>
>   >> This has been fixed in systemd with
>   >> <https://github.com/systemd/systemd/commit/da2862ef06f22fc8d31dafced6d2d6dc14f2ee0b>,
>   >> and fortunately it's possible to do the same thing in shell script here.
>   >> Specifically, instead of just saving new /dev/urandom output straight
>   >> up, we hash the new /dev/urandom together with the old seed, in order to
>   >> produce the new seed. This way the amount of entropy in the new seed
>   >> will stay the same or get better, but not appreciably regress.
>   >>
>   >> At the same time, the pool size check in this script is useless. Writing
>   >> to /dev/urandom never credits bits anyway, so no matter what, writing
>   >> into /dev/urandom is useful and not harmful. There's also not much of a
>   >> point in seeding with more than 256 bits, which is what the hashing
>   >> operation above produces. So this commit removes the file size check.
>   >>
>   >> As a final note, while this commit improves upon the status quo by
>   >> removing a vulnerability, this shell script still does not actually
>   >> initialize the RNG like it says it does. For initialization via a seed
>   >> file, the RNDADDENTROPY ioctl must be used.
>   >>
>   >> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> 
>   > Applied to master, thanks.
> 
> Committed to 2021.02.x and 2022.02.x, thanks.

Hello Jason,

I noticed that you worked a lot on the S20urandom init script for 
sysvinit in buildroot.

I recently updated from 2022.02 release to 2022.02.1 and now on booting 
all our boards, I noticed this message:

"Initializing random number generator: FAIL"


With the 2022.02 release, with the same kernel, the message stated "OK".

So it might be something changed on this BR revision that causes this fail.

As you worked more on these scripts , do you have maybe an idea or a 
hint about what I can try , to have it working as before ?
Or maybe what change can cause it ?

I tried to test 2022.02 + this patch I am replying to, and things appear 
to work fine. So it must be something else then...

Thank you for your help !

Eugen

> 
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
