Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22668C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 19:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D209641125;
	Thu, 21 Apr 2022 19:35:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SKOpZ0d45BQ2; Thu, 21 Apr 2022 19:35:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6ACD40AB8;
	Thu, 21 Apr 2022 19:35:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D9A7A1BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D58E340A92
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Da8NB488HRu for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 19:35:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9235F40AB8
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 19:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650569706; x=1682105706;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+WN/6wGQqniCjacNcIUFM6EJOur8pn5EnjMr3YCJgHE=;
 b=auesFaI9nNDgaaeW+oKBSXGIlF1loRdHK7GxoHpQavCSHDjjdylu2eLf
 TQADM2G5eiMYmEc18mcD5wRihhC9xJdEmYsm5/ZrHoQpqVJbKZhgIIXwg
 PSuaEyhJixWms9P/BmGXaHP52pUoo5tALMnePTQANgX8TDYQE5TfZ1Zjl
 DiW5tIXkzZYXVFIzIPOIqZ45JyPjow4qcL4MkyK6KzF4a7x0pJf9tFVV4
 4HPArRf8aNq5Om9cNplImRxm0xzUDivTw5TO/ZaGVmtDa++xUajYFZayz
 aRlDre5Wcmdyjzb9rGHevJvlxnMGNG1nI2+6dazq7gPrZalaM6XwToAS+ Q==;
X-IronPort-AV: E=Sophos;i="5.90,279,1643698800"; d="scan'208";a="153410713"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 12:35:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 12:34:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 21 Apr 2022 12:34:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4bTPlHkl7v7J7Vb0T7edRrd/m4auzdSyRbkH2AS5Lbgs6KflAyO4/aaUSBmptZ9ykgFlUu/gIt2PW+tSpJ152/D4h5t8Jhz85MOv8j/ugAz0N08ipf+utU8tE/VbxcENl+mbXS7aGGfFoa0w21kN0VsFPW6MLcz7aWRWfeU8rM5ieJDZMBevUzc41yGUjiTKYvjJ64KLfaP9g3bLOOsW3EPHdQMsU2BwQZwnQfpS7icSDfHZBQCg1+49+NXahmzWgXi5Ygdd/qICKYjdpqbbVsG8hfUWtREhoMReFpt0I6C7nSrxsAJ8+CG/F7DlmKSpwa1gcdrLAGgXUQruc540w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WN/6wGQqniCjacNcIUFM6EJOur8pn5EnjMr3YCJgHE=;
 b=jdwToo+TJbqXTVbXsxuh7t38BLotGNw2kbDpLvgiM/fFEjhdTZAsv9A6Q+kM+z8oaAtXgtHYAmCeRauPlGb0Byz/0GfrQFMPvSZ71g+/bDDhBv6iV6Xg01QK/JUfXHVkSQsSxviYdHrxJP6FdRXpc+67tY2KL30ZQR/27fjrnRKw8h69hL3WEU7jc7+wz3OV+QTk5JUqPGR/W+8ohU6/ToPDxcZans3AusN9j+xsi4fFSsxONxtTCtA+j7vLd4sab0LYfyz2kfgchjLUq0f+2RtPElcSF6Oc0es3raEJRLJPP6Ra2UYK4R4MNQNDpjff+7Sxf0/7uYw2g/3POs31cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WN/6wGQqniCjacNcIUFM6EJOur8pn5EnjMr3YCJgHE=;
 b=KUmupBO+IEJtc8GFO9xZ0p2RklEbovOnNKMWYlydSeBs3OM/J1qNUdEiQWHvehA9/WHVsDF2RF9xTJd/Ezn01w7krPZZU237JsEVSmxcWHM2MJurgHepOlvXXwQ44Td/p/n1aC+od6v+VGCD2w0qMkHgZHCMjimFMvnm68terGk=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by DM5PR11MB2041.namprd11.prod.outlook.com (2603:10b6:3:d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14; Thu, 21 Apr 2022 19:34:52 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2%8]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 19:34:52 +0000
To: <yann.morin.1998@free.fr>, <fontaine.fabrice@gmail.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/dhcp: untar internal bind
Thread-Index: AQHYVAiVyofN5/DigESil0vSiBTzJaz6xPkAgAAAsIA=
Date: Thu, 21 Apr 2022 19:34:52 +0000
Message-ID: <5e18565f-206e-a704-8b88-2471096141d6@microchip.com>
References: <20220419161130.3431492-1-fontaine.fabrice@gmail.com>
 <20220421193222.GP2730@scaer>
In-Reply-To: <20220421193222.GP2730@scaer>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c8cc061-c884-499d-7752-08da23ce01a4
x-ms-traffictypediagnostic: DM5PR11MB2041:EE_
x-microsoft-antispam-prvs: <DM5PR11MB204143CB66B3EC6ABD58831DE8F49@DM5PR11MB2041.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eisglazNgYB7SqI87mci+W1ycoX7xlNw3dkescyGNZ14kuEH9czOBM2tXpKdny9pnTyzSdHUuyjP2Ox6JK4dokvMVbGT0HnSs5R+S5zgbYNkSMis4JMYPbI9ecBnIM6sZlj1ZnJ22DlDMOA5oOOsTe0X3BGGzKZ5yp2qApqjMt4MTLG/2Wji24Qs2BaU2ABApLcEkIsHyvYZ2RurxFKvi1aT8R1Ek0K6davfTar9O0e3fo4Vkc+kjO5/Na5g2iH/WyxVFVKexl/0IZ3PyEJy2jmTMDD9nO32HD6OyotD+YwGmS40/HaTVPwfYWhjvcxPnH/R4KnPUuzyZ9iEtPtimwDqscbvaSY8Jousn3KzWP4MzbKNKsTYal9qaxcffhhEXBGQ2JmgL2OfU03rGv6/J5U5iMf8v3pNI36zHo3NsB1FGJu/RkiqoNqfybC5N+0krD4VuPEC2Ipojsg4qP/pULtGdYEQptQh+DAhhzrj6HSD7xe7FuLMupa1mP2V6ypMfEYwjsR2wbIltRFQn71xv3IYLmOp09yfK9EUbPdrJ3CfEsr3aPgtlhZmSFsRi22oe9+ynTHjrLxshvY9eIVnvMAU17xakmpCVy3QZQErjx5+TLHnHKuvgRBgvdhet352ZtffDC8zO1lKTbJrPGwZSut8S6lyKXGuXNPKVPrllT53emi/cxzDUEiAFdkt1cqapsHIgblvVE82zimRKcgO929HGUHrtWq7SbvpwREKQsqC9RiPt4ECk5HppL4TB3j1zyBRDYoRJRUJP9neL0FtxqIn6YqMJEk7XXPkC2/Rn/q1xl6mXxZKlv8gNDKKGvOOk/+iD4DPp9KAZanAQ7q05v0SivO23aIzPOfosIDBpG972HC3nFAN3zaI+Aw6QafKL4QtVVOhUq853H+0js6LrsQvz/pE9IavTyimThnROVw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5384.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(110136005)(316002)(54906003)(86362001)(71200400001)(8676002)(6506007)(31696002)(2906002)(66946007)(66446008)(66556008)(64756008)(76116006)(91956017)(66476007)(38100700002)(38070700005)(4326008)(8936002)(5660300002)(122000001)(966005)(508600001)(6486002)(83380400001)(31686004)(6512007)(36756003)(186003)(26005)(2616005)(43740500002)(41080700001)(45980500001)(357404004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzAreGZpMnVnbXRtSE5zZ2dscW4wbDlDbTYxYzM2eEpZQUxyT0tLT2p2OFA0?=
 =?utf-8?B?eHljem02Zng3NitGRnpzRnJ2UDlMQldNMU9WMi9zV1NURHF3QjRuNi9TeDhF?=
 =?utf-8?B?M0xRMW04RDJBL0FZQUhsZFBiNUNsclN4NmVZSGpabXNBdFVPU2dWTWN1QXpK?=
 =?utf-8?B?R3hiUUswdHNIK2QvdXdJR2phOE9ZMHJLaFgwKzkzNDBabHpuaTVpak5FaG0y?=
 =?utf-8?B?cUV2UnhHSFZPL3E5Q3dvb0FEZURJVDR2eTFnM1FZZE9NWHhHSVpKb2pXcHEx?=
 =?utf-8?B?dVNrYVorQm9EYUJ4T2JKTUwwUWlmQ3V2T0wzbVVnaDRIbjJVeG9YcDY4WkZI?=
 =?utf-8?B?Z0dUcmYxSXdPek5BK0NzbmJSQi81MnRmeW5Tc2FjUS9scEUwT1dCL3hqT3Rr?=
 =?utf-8?B?ZlZaeWtjakszNFdMSWE0Vmx3YzM2RWNGZyswZEpoR3RFcXhDemo1dkppQUVr?=
 =?utf-8?B?ZS96SkNuYWtFQzA1YnMyNUo2ejFIL3AyZHY1dFpQeUw5aGJ3Vy9VOWcwaGxl?=
 =?utf-8?B?eHFEaDVFTE5uVVRlZ3FhVkc3aGo5ZEVNUldUaVRLSG5YMjVIdzR4UXRSODQ0?=
 =?utf-8?B?UzFqUjRIRnAwdnNXUEtZRFN3Q2FrUktWaEZvVEh5T0pibEZ0OGpjWWJZNTNT?=
 =?utf-8?B?alJzRTBGSXJyelBxZm1LTXlnVENFOHdiQjUwaE1La0dpK3o4bTZlRG8wMlJn?=
 =?utf-8?B?b0ZKa0ppdThjYXdhTm00WEhGcEl5NzlhbUNWOVp4OW81Zm5pT1pWT2h5U2ox?=
 =?utf-8?B?dlhQVFEwTkljUk1FWSswaHBPV1FjQVlrRm9HU0VRbU4rSGNXSzlGZk93MjFZ?=
 =?utf-8?B?MXc5dDN1ZFI5MnZFOUJsWEVOak5NUHZIQ1BqRmswWEdMUnZmeG9JTnB1R0VB?=
 =?utf-8?B?ckU0UWJSZFlucFdEOURvNHp4ZGxMNytPSnBKTUJxblNpNlJ1SThobGlOSEpL?=
 =?utf-8?B?SG9XTHZtb2JNSU5CbDE4QnBmOVhidURRTXlyVkJvbzZCNXpzSHF2MkZ3WXVF?=
 =?utf-8?B?dzNCNXVMVENJdDEzdHphK3pjQVowTUR5Q2JkMUtXSzNOZ0gvRGlwMFlKa2lp?=
 =?utf-8?B?OENhMWNGV29ibGszYlozOFJhVk1abVVpU2VldXNINTFlUzJCT0FvbnFBcEJL?=
 =?utf-8?B?ajhoR1NhTERLQUF4ZE40NE8wR1BwOXpsSkNXbmVTSE9BeVVXTTY1WkZ6UFpt?=
 =?utf-8?B?QnFyUC9BR2xrZnF4S1lmNkk2YWtoYnNwSXJ6KzcvUDhkSHVUZFhLaEFFRXhz?=
 =?utf-8?B?ZHNYbUphUFBNV2IwOEVPS2h6clpqN2JLRDBWK2lvZFNub2srMUpDM0RTUzlI?=
 =?utf-8?B?K2JZRzV1TkRrT3dGZy9ienQ0b2MyblV4dWhHNHNBSUlveTNoV0lGT3JnbkVV?=
 =?utf-8?B?Mm5NV2RZUFUyZExKdkRZUXRTM3luWVYwWnpqL2EwVGtobGp6Qm1Ta2xXRHFu?=
 =?utf-8?B?RkpXdXdUcTdGMkN1QlRLbVlURnZ2QXZUR3Bwdng2L2FhTExYUk5Bd1BrUlVz?=
 =?utf-8?B?YUFsejZGaG41WUlYWmYrSk5FVjZsTE50NnVWT25SM2svZzJrSVMxVk16T0g1?=
 =?utf-8?B?RURBaUtTeXExY1hqT3BpVElPc24vMGZ0SWhhd0FRbmE3bkMvd3pzTDg5a2Vh?=
 =?utf-8?B?R2o1RTc3VCsya3RCaGdmQ1V3ODdyTHFMeVp6dm04TXJFLzBEeFA3SXN0aS9X?=
 =?utf-8?B?WlVLK0x1TGhZYnRuZFlueXllMFBiMlJGNmQ3OCtZa1dZYTQ0TVJPZSt6KytQ?=
 =?utf-8?B?WGZzTythREp2dktyODVGY2x0MTR0QVBqLzJXL0lHL2syekZaWVJ4MUZ2WW5W?=
 =?utf-8?B?Y0NoNHhTMFNuR2FnZVB0WnNkbHVuNU13T0ZYcVl5TmFpNkN2OXJ6M2NQZ3lF?=
 =?utf-8?B?NXhmOGM3b0dWMCt0bUhOTlhDc2gyWTZuVWhPTlpPbWZpbitVV2s1SitsVW1K?=
 =?utf-8?B?TTEvV09zVnRyMTJnd2JsQkt3ZHpDNVlGS3dkR2lMbkxBUzJzbTdlTysxdXZX?=
 =?utf-8?B?Um9WcitNdThoS2N1K2dMTEZBcG9tMEVXaEtDRDMzY0h0Tks3a1QrRUtmOFVR?=
 =?utf-8?B?Z0gySUFnTVRZTXNMbG5kRFdzRUhrQ1RVQXRIS3U2bEplL1h3eEVHdjJEQWwz?=
 =?utf-8?B?Y1FqT0UraitRZE8vWklZTTFXNWhDRStlMjRFU0UxUHczWXlraVUrS01GT2My?=
 =?utf-8?B?RDJzSGRZSjVCcHBqQlJpT3VWTnV0dEkvQWc5bzZHY0hiV0pDQzkxUGsvRnpo?=
 =?utf-8?B?QitmYWJxenF2Ky9TRXpKSno0RzI4S0NMS0w2M2hyOGlvZzhVeUJJajhFSGZB?=
 =?utf-8?B?cnB4bG5PVUtyR0tuenhuNjluQzVJQ2ltak1BSmZLVWM3dTZDa25OUWd3dHFt?=
 =?utf-8?Q?iSFJdKfhmDQP+rbI=3D?=
Content-ID: <CD3F8FF2F1EAF64EB5AF6F72BA690BAC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8cc061-c884-499d-7752-08da23ce01a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 19:34:52.3981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U7R5rG+iYkkwDgj+QzADsTUXnHR1tqy/teNqIfO2oVWRYkC7eHe1MqKSggaUI9fJNfmCowplQ5i+VwiFIO1xA9tY0cU2+P7DvWxZuYz6S3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2041
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
Cc: havran.jan@email.cz, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 4/21/22 10:32 PM, Yann E. MORIN wrote:
> Fabrice, All,
> 
> On 2022-04-19 18:11 +0200, Fabrice Fontaine spake thusly:
>> Untar internal bind so libtool patches will be applied on bind's
>> libtool. This will fix:
>>   - installation of some libraries such as libisccfg. Indeed, if libtool
>>     is not patched those libraries will be "relinked" and so not
>>     installed.
>>   - build failures with riscv and or1k:
>>
>>    Invalid configuration `riscv64-buildroot-linux-musl': machine `riscv64-buildroot' not recognized
>>
>>    Invalid configuration `or1k-buildroot-linux-uclibc': machine `or1k-buildroot' not recognized
> 
> dhcp, the package that keeps on giving...
> 
> Jan, Eugen, what keeps you from switching away from dhcp?

Actually this time it was the dhcpd that was failing .. not the client.
It looks like they share some library.

BTW, can you point some more different packets that we can use instead 
of the client and of the server that are due to be deprecated ?

Thanks

> 
>> Fixes:
>>   - http://autobuild.buildroot.org/results/d25b76e628ffe5293c6bc1fd467a6b8966cb1bc2
>>   - http://autobuild.buildroot.org/results/ba3258d8df00a7626784189125f0202fb161c40e
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> Applied to master, thanks.
> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>>   package/dhcp/dhcp.mk | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
>> index e6f4c419f4..f815c6c802 100644
>> --- a/package/dhcp/dhcp.mk
>> +++ b/package/dhcp/dhcp.mk
>> @@ -14,6 +14,13 @@ DHCP_CPE_ID_VENDOR = isc
>>   # internal bind does not support parallel builds.
>>   DHCP_MAKE = $(MAKE1)
>>
>> +# untar internal bind so libtool patches will be applied on bind's libtool
>> +define DHCP_UNTAR_INTERNAL_BIND
>> +     $(TAR) xf $(@D)/bind/bind.tar.gz -C $(@D)/bind/
>> +endef
>> +
>> +DHCP_POST_EXTRACT_HOOKS = DHCP_UNTAR_INTERNAL_BIND
>> +
>>   # use libtool-enabled configure.ac
>>   define DHCP_LIBTOOL_AUTORECONF
>>        cp $(@D)/configure.ac+lt $(@D)/configure.ac
>> --
>> 2.35.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
