Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65980C433F5
	for <buildroot@archiver.kernel.org>; Sat,  7 May 2022 06:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A772C41520;
	Sat,  7 May 2022 06:23:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NQj6D4HPSJMC; Sat,  7 May 2022 06:23:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13B95414C2;
	Sat,  7 May 2022 06:23:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16EFD1BF400
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 06:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05BD860A7D
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 06:23:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5EDaOawCyB4G for <buildroot@lists.busybox.net>;
 Sat,  7 May 2022 06:23:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::604])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E150A606F5
 for <buildroot@buildroot.org>; Sat,  7 May 2022 06:23:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iR2I3eCF30zmQIfbWYO1iiM1WmNNzC2xZigAiFtIXKQbXncAlhR/U8qB25on51B3hFO8c5Gf0hBSbWoV0NYSTP5fD1BWafhyAFRmKUDhPYGYVTscXxDVF57JBBKQsNCyt6UDcsu3yseKleinVntT1sXE8CRhky5bJvxvYyxHkx6LUz6AqhXfArbZOfh/pXm/VnwTmcUUxDI2GFspVKXPKKwa+AUhEkDYzWTZLr9EKMArh329869Io1ZAC/Wyz5IGO4trDs+8nfyzKz7zs73k/d8HuRC+76MLPDWWCjupLwG2sm0Z0nMYwrqWbsWJP+LwUMx+NagZ6XkWSFVpLFzeLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVh+/jLO/KS+PYtfwaM6jaSaGVS2CDpGrt+CLcsVgDE=;
 b=iBewfaAfmYqU+hvECm/SKcL2WuMdFd4Typ3MbzCJODgRs1VZMcSufvFuE1ZWLeId3fn3rztGRbTFpoeX2C7MmgjtMyQij/MZ4btT+HPYxdt2BPIas9GJOsU/OMWSomhk3Xtgr/Oqz+riV1JZ8y7JRJOArVdPR4SZVn9r5V00jbZ0HDWbIRNhNOMEU4pecOD+ObqFZl5z9rAZ4/8QkiMzI2BICIo2BhlCxsYrisHyFDmcllIRn53LUdUYY9sydNR0fv8rg8DGQOq6+91czdjVG25Jpfxy7zbbYDkEx3cUQAdya0d9Z1aMHcN/avKay66qulhA1Mb9HyZz1VAogFKAYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVh+/jLO/KS+PYtfwaM6jaSaGVS2CDpGrt+CLcsVgDE=;
 b=ZxHQMutQ5csNZg4vx1fNDOpOOF4WOfLcAH1lY7vQWx85O5iKXSutpKPdkDmRbhrzA9ags5YMzc3IQAkqv5WLid1TR0SUS/cRGq03QWieq41qrjHUOmjws0qWoyNNQN1PY18/InZI0RDFM9VYPP7TFrz81W7p1NgpsOhcAhss7l8=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BL0PR02MB3666.namprd02.prod.outlook.com (2603:10b6:207:45::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Sat, 7 May
 2022 06:23:49 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%4]) with mapi id 15.20.5206.025; Sat, 7 May 2022
 06:23:49 +0000
From: Neal Frager <nealf@xilinx.com>
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v2 1/1] configs/zynqmp_zcu106_defconfig: uboot dp pll
 patch
Thread-Index: AQHYYH9YnOaEgfd2CEyFRA/w+jVveK0SOXQJgAC7lAs=
Date: Sat, 7 May 2022 06:23:49 +0000
Message-ID: <B0A8981E-0ACC-4E2D-ADE7-6671F193FDB3@xilinx.com>
References: <20220505125443.1365892-1-neal.frager@amd.com>
 <87y1zezd9u.fsf@dell.be.48ers.dk>
In-Reply-To: <87y1zezd9u.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c222c109-bb90-4509-c39e-08da2ff22628
x-ms-traffictypediagnostic: BL0PR02MB3666:EE_
x-microsoft-antispam-prvs: <BL0PR02MB3666C11E168FA6BB9F557F82D7C49@BL0PR02MB3666.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IQluzB6IA2haRnA117YJbJ0AQNeM8etO2PSo2dfH2noYAN3lvivSmZOJoVQheQ5y7Vm/yTmQ2ZKY5YUSto7GGSfBxTeAxIez8FwHvt2ycivvOo/eYz3TkXPYweMQpaGRbLQyCqKNbQU4p3mpK5JvJOf6AGKTxMaSHgP9n1CwxfsZ1JdgPIO1RxcB2Qk+1B6W/Aq4WXyMh4V2fbOjyHOP7pPpG5QWwQUpT9gHkG9Qk1S3vvqXSHp5WWZGhYEI4iMEOlg3ZoHJYeKbdaBAGZHt20iP6Bge/pi/BCN/lJ4XbOpOz3ja+GTiRwG+bU3xxZVPYv+wK1QYM+pkWZ69uPm41d5ZNv584RMqzXyj2muIL1c4opAp0K562niRW+HLmMBZAMG1RZdHd0pjOWTpdnR4z6ltp1zQHUCR2KbtXBm6Q1hjwLYMJAJLVBMzLg9SsHUodlXpIZu2D43Oseup3dFIw7tDzmaWYNkaSGpX46sB4ZSHgosyCKgMs0kXX7/h5sOmUmMpaBsYcR4yne5GUo7o+NViDnys7sCM9e/Xop57vaKOJfNHYGMWmul8hht0eCHiwdN3FM0RGjQaNFHx61Ro2QN5UtloinRgcEffUzE5DS+AMuY0sazGlU4AdLGMf2Vz93jpahrfJhrqW9+7My/Tv6x8hlGb9hmCMey2bIzT02+NTmcjn4Mnkejoyl31rcw22DfdzwuNiPdmTCObGR1v5lD6ywGpYpjQ94FR2pJWthI9tMtTtMQii4jnXqwqAcXf9Eh/eCOIern+RAPwi1YVXB0gayjWBlxpfOH3IqCH7JNb3pslhBD4XYt4EDEs8xgr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(316002)(6916009)(2906002)(8936002)(5660300002)(66446008)(4326008)(64756008)(38100700002)(76116006)(66476007)(8676002)(38070700005)(66946007)(91956017)(66556008)(122000001)(83380400001)(6506007)(186003)(2616005)(6486002)(508600001)(71200400001)(86362001)(36756003)(33656002)(26005)(6512007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTdyMloxQURBdytDMk5uOEh5Z2k5UHpWTm1LUW84TVhZK25OSjlWT0lRUll3?=
 =?utf-8?B?em10MTBwNitlL0ZYaTdCendDY1ExcEtaVnowcTREYzlWeFZYeXpVaGJRR1RM?=
 =?utf-8?B?bE9sMDdLQi9wQytrQnRHSEVTSTlXdDFTNzNWQTRUYTRmOW5KRzhFTzlOYnZR?=
 =?utf-8?B?c2VGZ3BNaUFNOEJhMzV4QjdxcmNxOTlUN05Vd1cvb3o3czBXMEY2T3N3UEJk?=
 =?utf-8?B?OXdMUkhIYTE4NWxYWGVqQ25FaUNzLzlOMXE5VGlHZlRzSzluVzBoNEtNZmE0?=
 =?utf-8?B?OFhLbzhidSs3ZFkzSCtuaWtFRkJMYm0zTEE4UVVBUytIcFRMU0dWN2tNby9k?=
 =?utf-8?B?cTZ6enBySjhoZjFYejZTeHFyVmErYVhWSkxCNFFnaVhaNlVZSGdubHdjb2hT?=
 =?utf-8?B?VGdBOHN2L2FhTmRwSEJCeGJQZTNxYTZRelhwdWJ1REJtNjVtdk5kNDVlSGEx?=
 =?utf-8?B?ZTJVYXBSSGVOeUR3dW15Rjc3NTlhTGlMOEJnVzRld3c3NVp4TVBJYTZBREh4?=
 =?utf-8?B?c3hLYmZhVW0rMDRZK3hTRzJybTlhanY4WXAyWGNJNXh4elN6RnU2Z09pMUNx?=
 =?utf-8?B?bEQ5bEUzam9rOHBoN3hoWkdjcG93U1p6MzJXOTJVMk90R3Ywd1hqT1pkM0Zv?=
 =?utf-8?B?cEZ3SHRaNThGcU96eU9XeWNnY09Yb01uMWIzZzRwaDNkc3FvMGM1Rlc1bE0v?=
 =?utf-8?B?d1ArbTUya0xLSmg2Sm9DSnVCam45R1ViQmZQTlZmNENHaXJrSFZ3bG15Si9U?=
 =?utf-8?B?NStQYk1wa3dXRnZuRDJwbURQNEhtVTZNUjBqak53aXVkRzdVUEdLK3dXLzdF?=
 =?utf-8?B?UG81L3Rkazl3VStFbUlSbDMzYzZvanpsTExYVndQMExKWkZaOE16WHFMNW85?=
 =?utf-8?B?bkIrdVBIcXlpNlIwNXdGSC80MlFTYld5LzFhOHpCZnU5V1dVOGNsa3Zlc1Qv?=
 =?utf-8?B?a21nK0FMdEwyNjZKQ3haMnMzdldvWldSRHZtdlhiVGFvZStVZlRlOGRXTk4z?=
 =?utf-8?B?VTZWanZnQmplcnVjQTdRd01EYjVlaStsdE9WUzc4eWFGdHhUR1Q3dFRpTkpo?=
 =?utf-8?B?bkVIQVlvOG1uS0w5THlHS0tJU2dIaDcxUVhGZU4yT0NwMFRaeGRMc0VxVHU2?=
 =?utf-8?B?WDZoSDRRbEpJaW9GT0p6YlU1WXRTdWtXMHdMVkVKZ3BEajVxbkx0N3F3UENV?=
 =?utf-8?B?OG02ajcrZnRiclFubFhDMVFrYUIwc0szbFRXbldlaFFoZGlNYmI5ME9SYlcz?=
 =?utf-8?B?b0pSVjZxdlhxQUFvTWVFYkFRUWlpZXhrdzU0UnVuRFIvY3lYdUFVcHJHL0Jv?=
 =?utf-8?B?b0tkY0JFSlQzVWZCODRRelp3MTdIT2ZjWVVNYTBZZXpwc21FRW03Wlc4TEJ1?=
 =?utf-8?B?SjNhWDhYa2RablpjUVhGUVgrK3dHK2VDem9qR2swZXFEajJOWWwvMzUyK3Yy?=
 =?utf-8?B?N3RmQVRkK1c5c2VVSkUwZlhwVlZ0ZCtndXBvemVaNGdpVFJjQ1Irc3k4L21w?=
 =?utf-8?B?aE9TeXJvdjJvZmp2VW5DTlpockZZb2VMblZ3cnJVUkFkeUNIY0JHZXZEWklk?=
 =?utf-8?B?VGYyU2xrSmZiRk1vMWxYQy9ISUJLUTZKZnk4RnZ3M1BjZkNJK3B6MWxSTmsy?=
 =?utf-8?B?UzVvaXpQR1ByelBXOTIzbWZYSTRvWDdDMkxZc0pqdEFsWUZHU25oVjR6dnAx?=
 =?utf-8?B?dk1HVG1pVU1MOCtsdWdvczFJbUF6b2h5WHdsVkdDeGtkdndGQnRURjBrMDkz?=
 =?utf-8?B?aGFTc05rNUdVS1NOVG5jZWxYZGcxYUQweFNCc3dwZXdMQkI3OXB4bmJhVlBx?=
 =?utf-8?B?N1JHU3FjZjRITG4zUWlSb25qai9zMVA2ektKRGc2RFBnRHhVbWpXTkZFM29w?=
 =?utf-8?B?S2F0Tk93WXZoalhFVmV4UFlySllScUNwendhQmg2NWFFUXlvVms2ZGEzM2Fi?=
 =?utf-8?B?K012OGVtODB3NkN5VzJRSmN5SFRDZWNFNUR4THp3QkRZUlRwaWczTzFRTm5q?=
 =?utf-8?B?QVYyOTlnNXN2STQrQVFrRWVpelV4UUljV212ejRUSHpyVmQweHlzU0plWEk5?=
 =?utf-8?B?RnRsdTk5eGhvYnRMUlgzWUdRVEJidXJMd1V6ZnliRytLWVNHMjlVMmxOYlpX?=
 =?utf-8?B?QUFTNkFFY2JUT2NSd3hSKytFVUZEakVtdmtaV0ljN2NVU09oc1RoVTJJcGkz?=
 =?utf-8?B?VllkQW9PSjBjOVFzcU5lKzVIRklqSDlwNUVvbHBnWEg0U1dSYURxeXFCdW52?=
 =?utf-8?B?T2V6QmdTcHg4MHljM0tWMGZyeUloQVp3Rk90V3dIN0UzVWdyc2VFUGhLL3E0?=
 =?utf-8?B?a2s1MWorODFWWmdtUVBPTlBpMEZ6R2taUkRSK1BOcU9DNXg2bTZNdz09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c222c109-bb90-4509-c39e-08da2ff22628
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2022 06:23:49.4987 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MUPJ7cGVPdGqKXfFscUyBnuc2obDYPZbwVBeCWAdZ5W/qegiS1WJTRS8+fU4KURyTWYlFiT00uIs6vE9tfITGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB3666
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/zynqmp_zcu106_defconfig:
 uboot dp pll patch
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsDQoNCg0KPiBMZSA2IG1haSAyMDIyIMOgIDIxOjEyLCBQZXRlciBLb3JzZ2FhcmQg
PHBldGVyQGtvcnNnYWFyZC5jb20+IGEgw6ljcml0IDoNCj4gDQo+IO+7v0NBVVRJT046IFRoaXMg
bWVzc2FnZSBoYXMgb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gUGxlYXNlIHVz
ZSBwcm9wZXIganVkZ21lbnQgYW5kIGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBj
bGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZyB0byB0aGlzIGVtYWlsLg0KPiANCj4gDQo+IFtD
QVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCj4gDQo+Pj4+Pj4gIk5lYWwiID09IE5lYWwgRnJhZ2Vy
IDxuZWFsLmZyYWdlckBhbWQuY29tPiB3cml0ZXM6DQo+IA0KPj4gVGhpcyBwYXRjaCBmaXhlcyB0
aGUgRFAgYXVkaW8gYW5kIHZpZGVvIFBMTCBjb25maWd1cmF0aW9ucyBmb3IgdGhlDQo+PiB6eW5x
bXAtemN1MTA2LXJldkEgZXZhbHVhdGlvbiBib2FyZC4NCj4gDQo+PiBUaGUgTGludXggRFAgZHJp
dmVyIGV4cGVjdHMgdGhlIERQIHRvIGJlIHVzaW5nIHRoZSBmb2xsb3dpbmcgUExMIGNvbmZpZzoN
Cj4+ICAtIERQIHZpZGVvIFBMTCBzaG91bGQgdXNlIHRoZSBWUExMICgweDApDQo+PiAgLSBEUCBh
dWRpbyBQTEwgc2hvdWxkIHVzZSB0aGUgUlBMTCAoMHgzKQ0KPiANCj4+IFJlZ2lzdGVyIDB4RkQx
QTAwNzAgY29uZmlndXJlcyB0aGUgRFAgdmlkZW8gUExMLg0KPj4gUmVnaXN0ZXIgMHhGRDFBMDA3
NCBjb25maWd1cmVzIHRoZSBEUCBhdWRpbyBQTEwuDQo+IA0KPj4gVGhpcyBwYXRjaCB3YXMgYnVp
bGQgYW5kIHJ1biB0ZXN0ZWQgb24gYSB6eW5xbXAtemN1MTA2LXJldkEgdGFyZ2V0IGJvYXJkLg0K
PiANCj4+IFVwc3RyZWFtLVN0YXR1czogc3VibWl0dGVkIChodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvNjI1MzhiNGEwNGRlZTI4YTZmYzhhYzViODVmOGM4NDVhNWE3NmFhNC4xNjUxNzQwOTg4
LmdpdC5taWNoYWwuc2ltZWtAYW1kLmNvbS8pDQo+PiBUaGlzIHBhdGNoIHdpbGwgYmUgcmVtb3Zl
ZCBmcm9tIGJ1aWxkcm9vdCBpbiBhIGZ1dHVyZSByZWxlYXNlIHdoZW4gbm8gbG9uZ2VyIG5lY2Vz
c2FyeS4NCj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBOZWFsIEZyYWdlciA8bmVhbC5mcmFnZXJAYW1k
LmNvbT4NCj4+IC0tLQ0KPj4gVjEtPiBWMjoNCj4+ICAtIGFkZGVkIHVib290IHVwc3RyZWFtIHN0
YXR1cyBhbmQgdHJhY2tpbmcgbGluaw0KPiANCj4gQ29tbWl0dGVkLCB0aGFua3MuIFdoYXQgYWJv
dXQgdGhlIHpjdTEwMj8NCg0KVGhlIHp5bnFtcC16Y3UxMDItcmV2MS4wIHBzdV9pbml0X2dwbC5j
IGlzIGFscmVhZHkgY29ycmVjdCBhbmQgZG9lcyBub3QgbmVlZCBhIHBhdGNoLg0KDQpUaGUgcGF0
Y2ggaXMgb25seSBuZWVkZWQgZm9yIHRoZSB6Y3UxMDYgZm9yIG5vdy4NCg0KQmVzdCByZWdhcmRz
LA0KTmVhbCBGcmFnZXINCkFNRA0KDQo+IA0KPiAtLQ0KPiBCeWUsIFBldGVyIEtvcnNnYWFyZA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
