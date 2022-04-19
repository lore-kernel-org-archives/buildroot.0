Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0FAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 05:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 167ED612A0;
	Tue, 19 Apr 2022 05:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eZRLW6xdNmvt; Tue, 19 Apr 2022 05:21:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E8BC61298;
	Tue, 19 Apr 2022 05:21:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2D7F1BF2BB
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 05:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F63C41056
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 05:21:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com header.b="GWdBUQo7";
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.b="B36/JmVW"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nRtXrgnOaXb8 for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 05:21:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 371F141054
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 05:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650345680; x=1681881680;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=G/iOVD0F8LzzwDsXrVRO+QGmOdEUvLbSol7ethDKbdE=;
 b=GWdBUQo7B34N4mrnvijG4gaL9Q6I12pnW8ji4oGxqSSj3Ki8WgThCQaO
 r4eyC4EDRGk0indHZ1usxCdlw7A+Q9oAooMWNWJamatucIs44TqFxGhzi
 oi5IfSI3s7QjIwRY2OTQAKoi3y/rzhQJCcL4A5ryE6udnV7MQ4rmMipoJ
 usnS97919rmpCrnFAPJxMCb9QohqGRezkpmlyaJYoi8/kyibxLrjq85vR
 yy22XvnYGUB18/97lXpHkt9EZZrwC7IhftbDMiMBF8XjlwuPDmI3gUDWP
 2/FXZh2Dx2Fot1VGtkSujBQvpVH7+2IBu9sMSA0ZfgAWp5rKsfHnL8+lQ g==;
X-IronPort-AV: E=Sophos;i="5.90,271,1643698800"; d="scan'208";a="170049409"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Apr 2022 22:21:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 18 Apr 2022 22:21:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 18 Apr 2022 22:21:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5TEK6dlz2D5xWA6lAmnpFrB957yD1z9M85cxDDm24OQw29h8qEydBdeXLbRnD2/Eszm1mfniyLoOAQwgS7omoMUbbz2iZhjL/7etYekL7Cf7ABuBSXosObdnBO7MRb9wEKAN3f2mtsBjWNmL/1FEO8aKE88t1NXEGxZV/1lswSbDn4LHoAL/OiZ2B+qnsNqDqf4ePupT8Gy9HBeez8t93kQlNP5N2LR8MHa8dvAEvTdumaHtMPemLdSQsi/Uh62rSwOn80/AI8glkV+A3gRmmB1sO0HKVA+vCJsQ0Tn9W3OAkxlmqvn9abQmel/43rwQXLBrqrgEBxobKi1UmL1yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/iOVD0F8LzzwDsXrVRO+QGmOdEUvLbSol7ethDKbdE=;
 b=ehNEF3huOF/nmmIR4f5ru+DMfZjJlSHH27JijUpIm4ufH0QeAfTVvkNPfnJpR5DJBhnHMrEYp45E1qHeCmTnN94bdEm9NMzfccxlB3pnwQUYjDVwxKFYPzXL+TxPGRc7VZBti/8ygEFruPzi9NlSDwqZTpyn6V7+IjupnxIc7JT51AekhGPs7yFLXl9Jt1wlEiXcS6/AYsUSa3sLAlUn/nwPhOjGzkVxByxBMEHI5lEG9c/YqncZAQtW4vq3aUjo9DR56GZrx0KbPZGoYGxmIood3pFdTteqe5twyrkTJ1w1h0eCk8EfN5AVT+uK13ihhbMrPfkVJaHDwkXn9adLcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/iOVD0F8LzzwDsXrVRO+QGmOdEUvLbSol7ethDKbdE=;
 b=B36/JmVWzOi67l0co1mRZj9JtouOKGjd0R0T9haABgj2GyFUTuGd9JXcXw+s3q6oZrPMuvHbSfRdjMhVl9Sj+eOafXGLbU54EagXfYFG6ndOFyDWFRnhtnk7HSLfOBgEt8OUNvB9Uzs1pqcQdoIhuM6xw0hbKXWKGhT8DqTM4vc=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 05:21:18 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2%7]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 05:21:18 +0000
To: <fontaine.fabrice@gmail.com>
Thread-Topic: [PATCH 1/1] package/dhcp: use internal bind
Thread-Index: AQHYTmEZ03FYkSO1E0aa3ZrEpJPiy6zsKDSAgAAOXOOAAF/EAIAA5G6AgAAJoDiAAZ23gIAADdeAgABxAwCABxzhgA==
Date: Tue, 19 Apr 2022 05:21:18 +0000
Message-ID: <f10430c3-6805-eadd-7161-82db2309c198@microchip.com>
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
 <d864ae21-b68f-b30b-ce07-cd66b473e4f9@microchip.com>
 <CAPi7W82XAg4jMw6z5LR=rg-HoZGBbfDC13XbpXtr0hppW92QEw@mail.gmail.com>
 <CAPi7W83uC=WLeMufRy9OC2G2m61BtUu1v_KX-nuiUBRFTwd8sQ@mail.gmail.com>
In-Reply-To: <CAPi7W83uC=WLeMufRy9OC2G2m61BtUu1v_KX-nuiUBRFTwd8sQ@mail.gmail.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63bb579c-c764-4060-4ec5-08da21c46eca
x-ms-traffictypediagnostic: CH0PR11MB5409:EE_
x-microsoft-antispam-prvs: <CH0PR11MB54094928C1A7BAAB984896A9E8F29@CH0PR11MB5409.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +xeoZ/H4r3sbRRHW7LGUGtMU/qri3MCXUzvg3gfs0Tk7pwZ8VZLto42EbUOqssq51n5I/meoR3exLb9CzBq21AUmqP23WCgIRhOYIscYNs+8JIYOqYvn2KysK6AtXkNMSHJjXZfbyFhbuIXti8FPGpILxqJJHfe93eUh+pmTsh7R5MvhKDoznxoLEzl+e8M1PeXqaSlu6z1AWnsQk+OMFmJG19b40O1A+yFHX/bBzMXIdXp6qHuFw89x6OGBHbujvUJ06lGjzWd4mpo3MiM69GERF7MVq9bXVrJF5Giwq53y2y9BEoYVsgy5WK2GpMFI29EOE+I1sLS9HFticL4/j/0535X6UAOi+S5CxdhwEado/GQdYq9k/9L0QHljAFqseK91KtlZUh/mq1Rst6lZnzDylZZH61620CoIFLuZNeu54Q7yCfUUd4/c/ne2n0uj34mXXJvO2C0Oi2vsUcWtYJHra5JJeT9f4g12R/+w+7wau204uZEJguXXxalJhn0N3jmNPL53GOvAM3tI7FMHpdjjEGGcSWA0jK8CP66+vOzsZ4WTVf3u3reF3b7oDFREWQCnO5Cj2cvh0wJTmIrSrsFT49Wuh3FiiEVRyfAUmH+9WIpKEdHgTY4Cwkv7bCsmbRCC91u1gV6uWxxWVYwNjz4fcKIzq6O5ZTALu7HuFVgCTvl6rYbSyrqhOg9Xlfp0D2Zkn7zVSi9WYkLS79QPcBbXKup8u8qnkb8X4SpRXdX98S8JaOeA2yMwcs/DrLE3xl5Zjvi3WcegMgCGRNEZ3spQc7xW8hs7d63I4vT22ciYLlB5LLoz3Yp7APqrYQGB6geWs/loeQKAy5h4LnOOfw7o7sLvVZWgaj8ppGy0ssI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5384.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(71200400001)(6486002)(966005)(66946007)(31686004)(2616005)(38100700002)(66556008)(5660300002)(6512007)(53546011)(38070700005)(36756003)(6506007)(508600001)(8936002)(45080400002)(2906002)(64756008)(66446008)(66476007)(76116006)(4326008)(91956017)(122000001)(8676002)(83380400001)(31696002)(26005)(86362001)(6916009)(316002)(54906003)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDRsZTJQcFZHYjRiUTZYL2xEOHF6UnpYZ2Q3WVFqTlgxdVYwaFpJM3BVOGgr?=
 =?utf-8?B?RmZiMzRkYzVhdUwramRaanZlSDJGS1RRejNqaTFGNnlrLzB0cDZpSWRCbWwv?=
 =?utf-8?B?VitwR0tSa25UTkExMEtrZW85bEJLQTFXbkMyNFZZRlBlS3pwNURzWTJLcDlF?=
 =?utf-8?B?QXJUUXNoMWxGQmlLTWZiczJHVFRBT1dROXdnZ05NMGIwUm83TnU2L010Qkxh?=
 =?utf-8?B?M1A2dWtlbU5rTjFKcUF2MDA1em9TdmdqRlI5YTJJT25GM0RKa01vSzJ1dE9P?=
 =?utf-8?B?YjhaM3dLYnFIT0dGRFBPaEE5WXFLSHhpZHJyTXBveE4vZDRJODYwcjlqKzYw?=
 =?utf-8?B?Q1ZjeXVXMU11TDdoK01tYW1GRVdnc29YaEFLNjlJN0JVNEVESEtaOTB0bHFR?=
 =?utf-8?B?bURVNDd2dEFTa01NelZ2R09TVU16MWhjY1hPZ1loMytvUEFoMDdXbElTTzV6?=
 =?utf-8?B?cVVUQm1VZ1lMbVo2bEs1NTZxc29mWGRuNmVBK01zd214TEMxT21oK1pYaXp4?=
 =?utf-8?B?U1F4YVZHMXBHbUZDbXp3MkMzbUNqUlFPcXJaU0dFUzZFSElIeXJ5R3BjNXR0?=
 =?utf-8?B?U2tMV1A0UGF1VHBHVDZWeXFXeW83SUxWa0EyMHJ6bVVCQ2lTYWN6VzVERFFa?=
 =?utf-8?B?TE8wNWQyMUJMZm1xVnBINDAyNDdnV2U3enVHLzhBeVNyaU5SclM5VFBwZ3lx?=
 =?utf-8?B?U3FPM3VvM0dpeW5KQTF3MGpDbUNMME03R0ZibnltTmVTb2I0TUhiOFhDcERl?=
 =?utf-8?B?V04zNlZTVytkeVpLMWN2b2pYdTdIcjdJWllpcmhzK1hXdVc5dTVRL1FTSkx2?=
 =?utf-8?B?QlltQlJZY3VnY0RBWE92bXpYR2lYSkVyQ056Tk82d2hBTXVBNTBHRTZXSFYy?=
 =?utf-8?B?RHBNU011UHB1WFpjNEJ0TitvMW03ZVlCOUhKM1hQVlZBT0M5LzY3dGliLzEv?=
 =?utf-8?B?UnJGMmNQMll3eG1Zby9jaWJxSEVDck95eldKaHVGNGdHaTJXWXpaNHp4U002?=
 =?utf-8?B?MjM1YTBaK2NCa1lodkh5Mk1ESmNsSlR6RVh2RHdJek55TGZtdTdiUHlGQm0r?=
 =?utf-8?B?SS8xeTNUQzhTWG50SGtGMmE5clNEak11Y2tUNlp3dXdrR1FrbFRyaFlhMk5t?=
 =?utf-8?B?UnRnQ3dKNnRCczVwQlVISzBaWUdTaUt3V29vUERYVXZicG5CamxIYkdnZnVq?=
 =?utf-8?B?YjRYTmZHT2RIaDhqMTU0aytTT1pNSVRNbm93Rldwc1RUVUtVeWRWV2w0VjZQ?=
 =?utf-8?B?Z3dPRFFaNFY4SU41eTJ4R1hSdDFoMEJyck5XeHJLbmZQdGxqM0UwMWpKMmVh?=
 =?utf-8?B?OUorS3F4SWxUN25WWDdwc2N6bGZTWTdiMDBBbStMa1Q3VVU0aVFMMlBYMm9U?=
 =?utf-8?B?dXdERWsrQTZmYm1ua3NEczVrQUZ5ZWdMVnEzNTR4dkFVRmZpR1VTaXhiUUUw?=
 =?utf-8?B?Z01YQjlmK1MzR2QzWlNEWXBsNGx0NmYrWG0xZEwyL1ZjcTE0OGxYU3pTVnIx?=
 =?utf-8?B?WjNMTW1ZTFlSa1dUNVdtaEMyazI4K3BRcHRPSDZvMmlJY0dJQ3RkMVFTRnY4?=
 =?utf-8?B?WDEyZW0vTkx0cGxhZllXL1Y4eHhpRFBKNDFQY2dSQitwdUd0dGtCL2IvZXJp?=
 =?utf-8?B?dXJRblBTWFhqUXNBOUVXT0Yyakh4M2txWEg5U2VqQWZuMlpqckFKY0lBZVp1?=
 =?utf-8?B?K2RjdjBGdFRFNWZsS3lOeHhPTDVPOWlxOWxPQnZKbzVDYk1zdi9GMGdiQURs?=
 =?utf-8?B?dDd6WDZsTStWcElhZUlTTDJOd1o2dXlzY3phRnF5TUs3cE92QzVHc1R0djRS?=
 =?utf-8?B?Mi92STdHaFBOTVJCQVVTbFkvNGpuSjdhNVMzZStvZUNOVnVEelh5bUtRTEV2?=
 =?utf-8?B?V0lyR2hzekUrdHZHdG9ZU2laSXJMait0Y0JkMnlhQjhyUDJkeUtwK0d4clFF?=
 =?utf-8?B?WUNjTDIySjRwK3FWZytDa2N4d1c1MWdRUlAwQmtobGliQWZmMEpTS0dQLzkx?=
 =?utf-8?B?WW96L2JPRCthUy9JTWlXSTM3S1V5Y0g5YjJyaEVDb2pwVmR4NlZvNXRoaVdQ?=
 =?utf-8?B?OXJza1ZoYys2L2tIeFJMQmN1YzVHZjZ0b25HN3BBN2V1TzhyMlJPZ3IzZGJN?=
 =?utf-8?B?emwvT1RReTBsU2FLeVIwUlpKblJyNytxQTRXWmpOY1FRTzVTVC90RzNHOXZV?=
 =?utf-8?B?L0w4N05iY0x0aGFqSDJ1YmNjUHZDZGtlMXNCa1RHTnEvc2Z3OWptb2daOHBY?=
 =?utf-8?B?dVBUOWFia3JVZlh5WU82OS9Eekx4R0VIbU02SWhPUUpyMDlHMXZjWTdidGhH?=
 =?utf-8?B?SjBvWjlOS2VUb0RCWU54c1JqaTdzVGZoZFVCTVA1cTJzTjJIdTVIeDROVlJk?=
 =?utf-8?Q?/jtAIlrh4kNoP+SE=3D?=
Content-ID: <FD10C6D6BCFF874F804ECECB2089B22B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bb579c-c764-4060-4ec5-08da21c46eca
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 05:21:18.1792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wExeQN6avH7zM8NSSySsgxrtJA8H1q1HpSTMEGL+0+G9rnVLvPs5+CkWREZyB4nj5/ef24xEBUHB838yIMa09J/cEviWi2449y/pfjZvjYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5409
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

T24gNC8xNC8yMiA3OjQ0IFBNLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOg0KPiBMZSBqZXUuIDE0
IGF2ci4gMjAyMiDDoCAxMTo1OSwgRmFicmljZSBGb250YWluZQ0KPiA8Zm9udGFpbmUuZmFicmlj
ZUBnbWFpbC5jb20+IGEgw6ljcml0IDoNCj4+DQo+PiBIZWxsbyBFdWdlbiwNCj4+DQo+PiBMZSBq
ZXUuIDE0IGF2ci4gMjAyMiDDoCAxMToxMCwgPEV1Z2VuLkhyaXN0ZXZAbWljcm9jaGlwLmNvbT4g
YSDDqWNyaXQgOg0KPj4+DQo+Pj4gT24gNC8xMy8yMiAxMToyOSBBTSwgUGV0ZXIgS29yc2dhYXJk
IHdyb3RlOg0KPj4+Pj4+Pj4+ICAgICA8RXVnZW4uSHJpc3RldkBtaWNyb2NoaXAuY29tPiB3cml0
ZXM6DQo+Pj4+DQo+Pj4+ICAgID4gT24gNC8xMi8yMiA5OjE3IFBNLCBGYWJyaWNlIEZvbnRhaW5l
IHdyb3RlOg0KPj4+PiAgICA+PiBMZSBtYXIuIDEyIGF2ci4gMjAyMiDDoCAxNDozNCwgUGV0ZXIg
S29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiBhIMOpY3JpdCA6DQo+Pj4+ICAgID4+Pg0K
Pj4+PiAgICA+Pj4+Pj4+PiA8RXVnZW4uSHJpc3RldkBtaWNyb2NoaXAuY29tPiB3cml0ZXM6DQo+
Pj4+ICAgID4+Pg0KPj4+PiAgICA+Pj4gSGksDQo+Pj4+ICAgID4+Pg0KPj4+PiAgICA+Pj4gPj4g
WWVhaC4gRXVnZW4sIGlzIHRoZXJlIGFueSBzcGVjaWZpYyByZWFzb24gd2h5IHlvdSB1c2UgdGhl
IGRoY3AgcGFja2FnZQ0KPj4+PiAgICA+Pj4gPj4gb3ZlciB0aGUgb3RoZXIgREhDUCBjbGllbnRz
IHdlIHByb3ZpZGU/DQo+Pj4+ICAgID4+Pg0KPj4+PiAgICA+Pj4gPiBIaXN0b3JpY2FsIHJlYXNv
bnMsIGFuZCB0aGUgZmFjdCB0aGF0IHBlb3BsZSBoYXZlIHdvcmtpbmcgY29uZmlndXJhdGlvbnMN
Cj4+Pj4gICAgPj4+ID4gdXNpbmcgdGhpcyBwYWNrYWdlLi4uIEkgd2FzIHVuYXdhcmUgdGhhdCBp
dCB3YXMgZHVlIHRvIGJlIHJlbW92ZWQuDQo+Pj4+ICAgID4+PiA+IFdlIHdpbGwgdHJ5IHRvIHN3
aXRjaCB0byBhIGRpZmZlcmVudCBwYWNrYWdlIGluIHRoZSBmdXR1cmUuIFRoYW5rcyBmb3INCj4+
Pj4gICAgPj4+ID4gbGV0dGluZyBtZSBrbm93Lg0KPj4+PiAgICA+Pj4gPiBIb3dldmVyLCBpZiB0
aGUgcGFja2FnZSBpcyBzdGlsbCBpbiB0aGlzIGJ1aWxkcm9vdCByZWxlYXNlLCBpdCBoYXMgdG8N
Cj4+Pj4gICAgPj4+ID4gd29yayByaWdodCA/DQo+Pj4+ICAgID4+Pg0KPj4+PiAgICA+Pj4gWWVz
LCB0aGF0IGlzIHRoZSBpZGVhLiBJZiBpdCBpcyBkZWFkIHVwc3RyZWFtIGFuZCBoYXJkIHRvIGZp
eCB0aGVuIHRoYXQNCj4+Pj4gICAgPj4+IG5hdHVyYWxseSBtYWtlcyBpdCBoYXJkZXIgdG8gZG8s
IGJ1dCB0aGUgaW50ZW50aW9uIGlzIHRvIGZpeCBpdC4NCj4+Pj4gICAgPj4NCj4+Pj4gICAgPj4g
VGhlIGZvbGxvd2luZyBwYXRjaCBzaG91bGQgZml4IHRoZSBpc3N1ZToNCj4+Pj4gICAgPj4gaHR0
cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMDQx
MjE4MTYwNy4xNDUxNTgwLTEtZm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20vDQo+Pj4+DQo+Pj4+
ICAgID4gSGksDQo+Pj4+DQo+Pj4+ICAgID4geW91ciBwYXRjaCB0b2dldGhlciB3aXRoIHRoZSBv
dGhlciBvbmUgKA0KPj4+PiAgICA+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVj
dC9idWlsZHJvb3QvcGF0Y2gvRFUwUDI1MU1CMDc3OTdDQUFFODBDOTg1REM4OTc2MzM1RTNFNzlA
RFUwUDI1MU1CMDc3OS5FVVJQMjUxLlBST0QuT1VUTE9PSy5DT00vDQo+Pj4+ICAgID4gKSwNCj4+
Pj4NCj4+Pj4gICAgPiBzb2x2ZSB0aGUgYnVpbGQgcHJvYmxlbSBmb3IgdGhpcyBwYWNrYWdlLg0K
Pj4+Pg0KPj4+PiBUaGV5IGFyZSBub3cgYm90aCBhZGRlZCB0byB0aGUgMjAyMi4wMi54IGJyYW5j
aCwgdGhhbmtzLg0KPj4+Pg0KPj4+PiAtLQ0KPj4+PiBCeWUsIFBldGVyIEtvcnNnYWFyZA0KPj4+
Pg0KPj4+DQo+Pj4gSGVsbG8gYWdhaW4gRmFicmljZSwNCj4+Pg0KPj4+IEFmdGVyIG1hbmFnaW5n
IHRvIHN1Y2Nlc3NmdWxseSBidWlsZCBhbGwgb3VyIGRlZmNvbmZpZ3Mgbm93LCB3aGlsZQ0KPj4+
IHRlc3Rpbmcgb24gYW5vdGhlciBib2FyZCAoc2FtYTdnNWVrKSwgSSBub3RpY2VkIHRoaXMgbWVz
c2FnZSBhdCBib290IGxvZyA6DQo+Pj4NCj4+PiBTdGFydGluZyBESENQIHNlcnZlcjogL3Vzci9z
YmluL2RoY3BkOiBlcnJvciB3aGlsZSBsb2FkaW5nIHNoYXJlZA0KPj4+IGxpYnJhcmllczogbGli
aXJzLnNvLjE2MTogY2Fubm90IG9wZW4gc2hhcmVkIG9iamVjdCBmaWxlOiBObyBzdWNoIGZpbGUN
Cj4+PiBvciBkaXJlY3RvcnkNCj4+Pg0KPj4+IERpZ2dpbmcgeWllbGRzIHRoYXQgbGliaXJzIGlz
IHBhcnQgb2YgYmluZCBwYWNrYWdlLiBEbyB5b3Uga25vdyB3aHkgdGhpcw0KPj4+IGhhcHBlbnMg
YW5kIHdoYXQgY291bGQgYmUgdGhlIGNhdXNlPyBDb3VsZCBsYXRlc3QgcGF0Y2hlcyBhZmZlY3Qg
dGhlIGRoY3BkID8NCj4+DQo+PiBJbmRlZWQsIHRoZSBpbnRlcm5hbCBiaW5kIGxpYnJhcmllcyAo
aW5jbHVkaW5nIGxpYmlycy5zby4xNjEpIGFyZQ0KPj4gY29ycmVjdGx5IGluc3RhbGxlZCBpbiBz
dGFnaW5nIGRpcmVjdG9yeSBidXQgbm90IGluIHRoZSB0YXJnZXQNCj4+IGRpcmVjdG9yeSBiZWNh
dXNlIGRoY3AubWsgaXMgb3ZlcnJpZGluZyBESENQX0lOU1RBTExfVEFSR0VUX0NNRFMuDQo+PiBJ
J2xsIHNlbmQgYSBwYXRjaCBieSB0aGUgZW5kIG9mIHRoZSBkYXkuDQo+IA0KPiBUaGUgZm9sbG93
aW5nIHBhdGNoIHNob3VsZCBmaXggdGhlIGlzc3VlOg0KPiBodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIwNDE0MTY0MTA5LjE3MjQ4NzMtMS1m
b250YWluZS5mYWJyaWNlQGdtYWlsLmNvbS8NCj4gDQoNCkhlbGxvIEZhYnJpY2UsDQoNClRoZSBs
aWJpcnMgcHJvYmxlbSBpcyBnb25lIG5vdywgdGhhbmtzLiBIb3dldmVyLCBJIGdldCBhIG5ldyBl
cnJvcjoNCg0KDQpTdGFydGluZyBESENQIHNlcnZlcjogL3Vzci9zYmluL2RoY3BkOiBlcnJvciB3
aGlsZSBsb2FkaW5nIHNoYXJlZCANCmxpYnJhcmllczogbGliaXNjY2ZnLnNvLjE2MzogY2Fubm90
IG9wZW4gc2hhcmVkIG9iamVjdCBmaWxlOiBObyBzdWNoIA0KZmlsZSBvciBkaXJlY3RvcnkNCg0K
TG9va3MgbGlrZSB0aGVyZSBhcmUgc3RpbGwgcHJvYmxlbXMgb24gbXkgc2lkZQ0KDQpUaGFua3Ms
DQpFdWdlbg0KDQo+Pg0KPj4+DQo+Pj4gVGhhbmtzICENCj4+PiBFdWdlbg0KPj4NCj4+IEJlc3Qg
UmVnYXJkcywNCj4+DQo+PiBGYWJyaWNlDQo+IA0KPiBCZXN0IFJlZ2FyZHMsDQo+IA0KPiBGYWJy
aWNlDQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
