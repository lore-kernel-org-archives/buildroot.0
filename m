Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9D6C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F69B403E0;
	Sat, 12 Feb 2022 13:19:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iNSHaEK2qCSJ; Sat, 12 Feb 2022 13:19:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EF9740272;
	Sat, 12 Feb 2022 13:19:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F333E1BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E013740272
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wow_QlyrMl-r for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:18:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B135F40227
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:18:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OCPmQ6S77trxtdVshjroDfGsJIdUcRW9/Z0tR6ixC0E4a2s/DYFiwz/qq2jGSEBrPgzocyj/KgzN9qLHFug7M3jyuipnJY7w+wtfJ5BW+AeUsXFrRwnGgqoXAqjijuD2R2zYhCpvtSSIDs1l5ZKfrwSybDOTqnuXnkne2WFWQy/Vc/e477K1xg2qkH+2UULOYMKj0UO+dd7o4OmpffgkFVaBLiHZVpIt+ebp7943oXwsAPs4lFMzI0lelL6GgOlhGiu7YyRDlUwA6v7TrLtQQ+KCDPaKisjGI4AmO4XpDpQAIbFDITWsk4U1GFydtQSHqjJroDbvT8WvkY1VmZURNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VlgiHrjo1UTFu+J9+fOXKHlg2MTGGHSDZY7KIdkAz4=;
 b=jmIR0H3L9BUsW9/T7LldFK6bhttrzZRBioKX51VWR8/o6qb2+J14N80I2MPt0GQ7UvLMhe8djwoCr8hjGcnf0hWz7+a5yuIcmOCE3NoedJpBApF+85w6+An2z8taqj9hfAoiCFl6fqepCDK+JjKfRqsIjiZw7BvpElOypvls+YCXs4Cz2IsBC1qtUMJSjl8+qEW5UMbMNebz1bSWFHoxgGCCbZ1FWcO1pz3Il7OAeIeUT1aY9pzcBjPJAwhnFaNE+pfggg4FO+ZDjsXnW3oSVA1SGnStFCT3dWWLpLXsri+JW15ncOLWhp7+FFflOaboPsw0oool2HpRg3VmxnQawQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VlgiHrjo1UTFu+J9+fOXKHlg2MTGGHSDZY7KIdkAz4=;
 b=iuoU6TE323EO290xdhBxWT02oDHS07RVTZX5nP1wNJN7+2iiMsEK/0rdOWnEZ0+jYtyTsX45XxP+8rWpJO5sunKF2BVmJky85x7LYI1EQf8iZVBWORP+6dxLqOfeDqHGs5+dtmkkHsETXsy7qbZ+XFQroOgHqUW9QIYwXNd6fNM=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BL0PR02MB3780.namprd02.prod.outlook.com (2603:10b6:207:48::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Sat, 12 Feb
 2022 13:18:55 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3%6]) with mapi id 15.20.4975.011; Sat, 12 Feb 2022
 13:18:54 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>
Thread-Topic: [PATCH v6 1/2] configs/zynqmp_zcu106: bump ATF/U-Boot/Linux to
 Xilinx 2022
Thread-Index: AQHYH1Xayzc2KIF7FkeZID31n2sKs6yP5foAgAABhdY=
Date: Sat, 12 Feb 2022 13:18:54 +0000
Message-ID: <039975A9-9273-4FC1-852B-C81AC2EF7077@xilinx.com>
References: <20220211144402.1626443-1-neal.frager@xilinx.com>
 <69189572-6eba-ed26-52dd-08a8b098f124@lucaceresoli.net>
In-Reply-To: <69189572-6eba-ed26-52dd-08a8b098f124@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8adb9633-eb30-4937-bf41-08d9ee2a383d
x-ms-traffictypediagnostic: BL0PR02MB3780:EE_
x-microsoft-antispam-prvs: <BL0PR02MB378013BA2C2C6A4B04479BC5D7319@BL0PR02MB3780.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GYJzVdM0eLlnMEcbY361AZOGTeEyc5hk9PVLeb8YH2gw8DTkJO4D/hVaT6D8qQfnjXGMHIgJr+xYZgA7RJ7Jg6EExX6e4cEmjIDOhQcgx1J3xJkOrGX/IU7n4GoDiEIFm05tvGjfHWjtfF1bs95maPmigUtqsCOa12HcAppemDgPiXw4z10iIG8rXfaJi7TeHu6ELzA7hXL26L0U01a86rexc237jPf3CPQjM845PUR55WIAFZ41NsByJaeqmeu0+eRp2d7MpLVloo5fH89KosfejYsaMBTR6R3XlSs1CR0zhjRuKrkCupeOHUd7T3ucYR1RXQGQ9ZN5G9/5jiKIeXWNe9z9YqlHIVNddRM3Gae/aYSWgI12azOxxAU89RlPczP9uA1jNX0l5rrWh97QcLTTKIlDwCe8xj1cUOFbBFGSJXV25yqCgDe5FmT94qnbshytvkDuOVH/r6FGADQmet07TFeRYHd4fme/YICrncoHSHF5azrRRSrpQfV8xMZJvkSJBo0csSdRSUANh5YSe1M6KA8hW/TgGYMZ35yiUh6V5MbWSJ/ciINuf9ecr7HTUr/jWNyvs6eeigMUnpA31QEmNwi624/EklWly3cqm0itbr6Z1PeFl+yWAp9tIaGO3GwR1MY+WlgXJG60qESgnlospoPZDAPwe1t9F1ME7RR/f/MNYbWB1/NyA7yh5c/Gq8c4gDsLh0KvwZwQY+JJrY6/oykdWM3Bq0R9AzMF5n6NtraYYIp6cwoCNwCq2NzQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(36756003)(83380400001)(316002)(71200400001)(4744005)(8936002)(2906002)(6512007)(6506007)(5660300002)(38070700005)(107886003)(508600001)(66446008)(66556008)(66946007)(4326008)(33656002)(54906003)(66476007)(8676002)(122000001)(186003)(26005)(6916009)(86362001)(64756008)(6486002)(76116006)(2616005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTllNFBuMEoxRHIrOXJjcnhTZ2FUbjRkVVdscWRUdGZTVEFYUkEvMnQxbEJp?=
 =?utf-8?B?cks5cW1RT0Rla2FFRmxtakx4bG40cmFGWkJCM3hYc0JIb3VPajFlajBOL1lU?=
 =?utf-8?B?ZW05K2JiSG5QT0NtcEUvZjNBaVBVUHhVUU1ZMzFLVXhKU0JLRU5hUnBQVGoz?=
 =?utf-8?B?a0djV1R4bWlNUWdRdzF1ZkhFTVpKTVZVZFEzbE5Ca2xYRlpOVlZZbEVUeTRa?=
 =?utf-8?B?djFGdlRiL1hqa1FVRHlPQVdTNVJOVEVUcWVNVktTbzl5VEIxakxSTkI0Vm56?=
 =?utf-8?B?OCswRzM5alBXUUtoRGhMRHM2V1AyQUYwM252Nm9MSERjYy8vZkJzMS90SGsy?=
 =?utf-8?B?YkhhcjNyV1NRVm00Mm1YK1JTMEJzeU1HUUR6eXF6aUR4RnZDYk1IWTd3T1Mr?=
 =?utf-8?B?TDBFV2hrRTk5WHpBNWt0K0U0SGkvRkRFRUFQK2RyMU02Z01HZkg0am1XZTVr?=
 =?utf-8?B?bjVON2RnVWgyeEZ4V0RzQXNKS1JiK3VTM1R1NHdCKy8yRHFhcEMvVERSS2Mr?=
 =?utf-8?B?WmR0YTNoMEIrZFRPV1lmSW9LQ3hSVFNFaE5PZGFaL2xoeFJrcnJTREkwTHhT?=
 =?utf-8?B?bTJyQTZ2RSt4THVqMHpDajQ2SkVxMW5XbEVHR2thNkI2WTBDYjEybEtuWlkz?=
 =?utf-8?B?endoeVVyVnAzNUhkc2Y1SGlmOEkzeDhueVpVeGxKQUo0QzkvRXBvS3BxS24x?=
 =?utf-8?B?K1dZb3ZxU1FLb2hYQVlXcUJqWmt2a21SeTlVcEZ6MFRJL2FHRzU0SGVndDhK?=
 =?utf-8?B?b3FuM0dRWVZOdFJ5ZDJOOUpMVjB1MGdRVUhsbmVWaWVnVDMrdk14bVFCdUx1?=
 =?utf-8?B?MTRTK0g0R2UxMGFXVzRWVkJiaEFQUWdYZTg0NVdLM3lPQ2t5aEduVDEwK2xo?=
 =?utf-8?B?TEo3YTBGSC9HSG04WlRMMDBkdHlaZkZKT2dPWTBkektocUxGbC96a0llay9B?=
 =?utf-8?B?RDIraDBJZVZhNnpNNU5DeXhkY1A3L2U3bWQ3S2trb254VjhETFNzWUh4MzBB?=
 =?utf-8?B?NmVYUDZZYXpKTzVLT3NrVW5wZC9CSURQSU1pUFN4TUp0STNsNmo3U1VjMEZ6?=
 =?utf-8?B?VXlzamVPWkhUTURHK3djWS9lc25sZnBTN3ZINFdRdVZlVzBNL0lBVzhhYzZi?=
 =?utf-8?B?TEJHNUdUNzV1eSs5V0ZYeThISjlUM29KRWJGWWZjZ1BXWFlOcGNCZEhRNlBK?=
 =?utf-8?B?Ym4rQWRheS85VWxLeWF6RCtEdUJYWCtQTHZyeGo1Sk8rdmhHcDcvZm5LWEk5?=
 =?utf-8?B?VHlYN04wL1NtbHhUMTN0RUhnZHFid044eTZnT0dJT3ZuOXhsbFZLNzZlNHh3?=
 =?utf-8?B?a1RkRFpVODAwbXU5a1RWOUk5d1l5VmZPZG9QZytjMTc2NU81TXRxaVV0dW9X?=
 =?utf-8?B?NWVzbWJFa2h6OVo0cWMxTnBMNll3eHdRM1pCV3p0YjRQUExWUEFrd1BZS1hG?=
 =?utf-8?B?WjhjRFFKQTY5R2xQVUR4SEpCYWxHc1Z5SXJmUTh2UEwwRlpFZlZCZ2YwaEdE?=
 =?utf-8?B?TlN6bWVQMTM1WGZ6QjVIZU1sSlJXYzBYN2hJaEl1S1N5QVBYT2xyUCtOa3B1?=
 =?utf-8?B?M2c2NUI3RDFJYVl6R3NZS2hJTjRFQm4zNDdaYWZiT1ZDeVFFVlVEZUcyQkpt?=
 =?utf-8?B?akVkbE8yNkFLN3JBdXYwemJVV1Vhamk4YXVUUHY4dGFxeG1UQkJNdUlHVHZr?=
 =?utf-8?B?cU1pZk1STmxwQ3ZFZDlkTHRCaFRFY28ydTV3SCtBeXpDVUJFZXB6bTUzeFlR?=
 =?utf-8?B?R1N3aHdBSjY2b2FUY0xXTTJkYzlpQ3o2YzZ4d09iZk9mZkE1eDFOWWkyQnk0?=
 =?utf-8?B?NmlESjJlajRDL1lQRXh6aEh3aHA0TkFWMGEwVS9EVnowM2ptMkwxdzg3OER4?=
 =?utf-8?B?VXJoRU5xNUlkYmk3TldaZ1cwOVFRakViNW90OVczL3VhTDJ3SDFrc2NCZXBm?=
 =?utf-8?B?RmIrSjh5SmN5ZlBoUUJvZ0t1U09XNVQzWE1vZkNnMWZCMTJZWjBrWUpGZjlE?=
 =?utf-8?B?KzlVWE4vWTRNd1ZxM3g1YS9RZERQSEVldTgxa2h3Y2NUTUFQSGNrTmtwR2d6?=
 =?utf-8?B?dFh3R3o4bUgyNTZONzBiWXdDb2ljMHNZM2RtOWx0cHl6UnhNNndZbFhaQk9F?=
 =?utf-8?B?QUw5N0hoa0ZhNDkzR2R0RzJLNGtxeXYremlnN0Z1aWJvaTNHNUpGSFFUTGpa?=
 =?utf-8?Q?O+1g9fFAYSmiDzdKb8IF8VM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8adb9633-eb30-4937-bf41-08d9ee2a383d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2022 13:18:54.8306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZorZ2GNfZSQ2U0V3rB/Hw3oVPHOY5jUkUTHOWwFISgOPukJdRVwS0j5cJ9tTlVQkthZ+L+Gb0VOEBrH1rO4R4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB3780
Subject: Re: [Buildroot] [PATCH v6 1/2] configs/zynqmp_zcu106: bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVjYSwNCg0KPiANCj4gSGVyZSdzIHdoZXJlIHlvdSBoYXZlIG1hbnVhbGx5IHJlcGxhY2Vk
ICJQTV9DT05GSUdfT0JKRUNUX1RZUEVfQkFTRSIgLT4NCj4gIjFVIiwgcmlnaHQ/IFdlbGwsIGl0
IHNob3VsZCBiZSB3ZWxsIG5vdGVkIGluIHRoZSBjb21taXQgbWVzc2FnZS4gVGhpcw0KPiBmaWxl
IGlzIHN1cHBvc2VkIHRvIGJlIGdlbmVyYXRlZCBieSBWaXRpcyBhbmQgdXNlZCB1bnRvdWNoZWQs
IGFueSBtYW51YWwNCj4gZWRpdHMgd2hvdWxkIGJlIGRvY3VtZW50ZWQuDQo+IA0KPiBPciwgZXZl
biBiZXR0ZXIsIHVzZSB0aGUgVS1Cb290IHBhdGNoIEkgc2VudCAoc2VlIG90aGVyIGUtbWFpbCBJ
IGp1c3QNCj4gd3JvdGUpIGFuZCB1c2UgYW4gdW5tb2RpZmllZCBwbV9jZmdfb2JqLmMNCj4gDQo+
IC0tDQo+IEx1Y2ENCg0KWWVzLCBleGFjdGx5LiAgSSBqdXN0IGRlbGV0ZWQgdGhlIGRlZmluZSBh
bmQgcmVwbGFjZWQgdGhlIG9uZSBsaW5lIHdoZXJlIGl0IHdhcyB1c2VkIHdpdGggdGhlIDFVIHZh
bHVlLg0KDQpVbmZvcnR1bmF0ZWx5LCBJIGFtIG9uIHZhY2F0aW9uIHRoaXMgd2Vlaywgd2hpY2gg
aXMgd2h5IEkgd2FudGVkIHRvIGdldCB0aGUgdjYgcGF0Y2ggaW4gc28gcXVpY2tseS4NCg0KSSBs
ZWF2ZSBpdCB1cCB0byBHaXVsaW8gYW5kIFBldGVyIGlmIHRoaXMgcGF0Y2ggY2FuIGJlIGFjY2Vw
dGVkIGFzIGlzLCBvciBpZiB3ZSBuZWVkIHRvIHdhaXQgdW50aWwgSSByZXR1cm4gaW4gb3JkZXIg
dG8gc3VibWl0IGEgbmV3IHZlcnNpb24gb2YgdGhlIHBhdGNoLg0KDQpJdCB3b3VsZCBiZSByZWFs
bHkgZ3JlYXQgaWYgd2UgY2FuIGdldCB0aGlzIGluY2x1ZGVkIGluIHRpbWUgZm9yIHRoZSAyMDIy
IGxvbmcgdGVybSBzdXBwb3J0IHZlcnNpb24gb2YgYnVpbGRyb290Lg0KDQpUaGFua3MgZm9yIGV2
ZXJ5b25l4oCZcyBzdXBwb3J0IQ0KDQpCZXN0IHJlZ2FyZHMsDQpOZWFsIEZyYWdlcg0KWGlsaW54
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
