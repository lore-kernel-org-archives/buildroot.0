Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCC3E77182
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 09:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B5FC608CB;
	Wed, 11 Dec 2024 09:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7tnn6nAKi9AZ; Wed, 11 Dec 2024 09:45:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DA08608F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DA08608F2;
	Wed, 11 Dec 2024 09:45:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BC04E11
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 09:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82D53608F2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 09:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U8XvBousANbk for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 09:45:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:240a::608;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 93B41608CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93B41608CB
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::608])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93B41608CB
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 09:45:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SolsVowizaP5qOm83dlWyoBhIyZ4lTJpKPkgc+OW+ZC38ZS8IQQFrOxGRscT4U3hMGwggVDO9DPLQG80FWDGrLFaHuJb/yvbVnUwnIMFAkrt9VHIVmOlOex0XQOWTbPHYEVmzQPDR6DjC6uk5wsjo8l1BX4S3tZQwujSG5v79uoxblZZqJoucLtjJJdBG1eqw/s1BhEy5l6JfUreIHyIs6jGizH3Ws0aaTgAaE+ZwkW6rjXVKxfZ7pveEtNuvomOtNF4kEJx/PFeFe2aZugKFQyTgEft1Xn4HychDH+TxRvNJaWv6SoTdVEnlPFDveoVlw9rlEeAE7aWssnJ+P1f2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTk97dGcToBwJgjUSTm7zuuBIYoQVfhegW3F+n5VW4c=;
 b=e7INjcpp78ugXZ/E4UgOj5BXCOwvZg4KyA4Sljt0oCOn/J3Dppc6XESBbg1DMs7beecU0yFNdT5yHtL1q5VYEXyq4xV1fzC/IXKgUd2RkJXS7Dt9rXmVSb5g0Dd+Fa+vND2lo0U5Rvxe10KsNVMTyOpAJOZS+3muYlLCnNgencY/Jz4H4/rjeagGXjxuaEedtCsQjBE+iUjl2lbi3/XqI5Zcp0yYntnZ1kItaKCZt7XdwxGnNTLjcdnEuoNw3kbcJAGaXXORgK0klhvgby3p/Ya72tNEC90byW85017DKASsJ1jHOTOcSC+gHx1C0NmDsr2EBTpd5Eg/O8xHcC1AXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 PH8PR11MB7142.namprd11.prod.outlook.com (2603:10b6:510:22e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 09:45:11 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::3adb:8c97:94da:80]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::3adb:8c97:94da:80%3]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 09:45:11 +0000
To: <buildroot@buildroot.org>
CC: <Conor.Dooley@microchip.com>, <Valentina.FernandezAlanis@microchip.com>,
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH 1/3] board/beagleboard/beaglev_fire: fix update gateware
 feature
Thread-Index: AQHbJGw65okyesZWnUGl+4nOgz260rLhGrmA
Date: Wed, 11 Dec 2024 09:45:11 +0000
Message-ID: <f01a3f4a5c5c525aeecfb8e6a485a3378511306e.camel@microchip.com>
References: <20241022102426.220196-1-jamie.gibbons@microchip.com>
 <20241022102426.220196-2-jamie.gibbons@microchip.com>
In-Reply-To: <20241022102426.220196-2-jamie.gibbons@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|PH8PR11MB7142:EE_
x-ms-office365-filtering-correlation-id: 2581b23b-389e-4fe5-f358-08dd19c881a6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Z3Fob0RPSEU0anVOUVE5WXNDMHZ6akh3OFNKb2JaTTdjMExYL0I1M2FmZWt0?=
 =?utf-8?B?d0M0OW93YktUSEFNZjk0eVVONzJIVmRxbTBCNDlPajZmUGRxMkFhQkhXUUtk?=
 =?utf-8?B?dyt1eDZvV1phWUh4M0lTYVgwV1M4a3ZlRUpPRkFJWUN6V2l6cEJBa0w5YnBk?=
 =?utf-8?B?MDZXNWF0dFEzSEVKRXNwMUt3ZUJwbW1FaWVzQ3VmbVN2M2NGdWxadFgyYW93?=
 =?utf-8?B?YjlaeWRTcERYeEQ1M0x2bDcvU25KSjVXL1pOUkFlOW1vb3Rmc05ZVWpqdXFM?=
 =?utf-8?B?b05qcnFPVTZWMEJzMFhvdkNBSFZ4OVRPeFJuVFhsRnY0MVIyVGxJeGZqVjMr?=
 =?utf-8?B?QUxVeWV6cWNid2lVTytadjBqRzVqejhGam1PS0FGNittVUZsZVNkbFQzNlJ2?=
 =?utf-8?B?NWk3SDZqNzYyR0pEa0Q3TXJscjlrNzQ4aktrMzR2d0RqZTBzbnI1QitZeVJY?=
 =?utf-8?B?YUl3NkxiVGxEMUxsUGRsMUdJTWg0YzYrK0FGUi9oVGxyeDF6ZTlORHIyL3ZJ?=
 =?utf-8?B?THZmZkFoa0s4R01vcmg1cGlJdDBWcGk5L2tPbGYvdGQzNmRwSkR1SWJSZFNS?=
 =?utf-8?B?RmgwMUUveXJtZmFTN2tmNzI5ZjMwYi9mVG8wNzltVkhLdGMzSmVHa1JpZS9H?=
 =?utf-8?B?aVVyZFgyZFFDNlV2QjJkWEhRZTRuKy95MlVWS0hBekt0eFVVK04xanA3bTkx?=
 =?utf-8?B?RStYTzRRaEVSNmRCclIzQmowd252STBZdGVvUFZCYU43SjRnalRGMnNVbjVN?=
 =?utf-8?B?S1pWUlIrVmFXNXNNVGI4RUI5RFhhYU9XWk1kQ3N3ZVF3SmZKYVpsQVJqenBY?=
 =?utf-8?B?OFlFc1hNNVZieDltOEdNWkpWb0R3eTV2Y1F2NkRBNkpreFdVdGhoRmc1b2hQ?=
 =?utf-8?B?dEZ5R0NQMmpXZjhia0FTMmtRYjBxMG9lbmwvQ1R1Y3pCTjNwcm02eHNLZHlL?=
 =?utf-8?B?MXRoOGNqZGZONVJ0ajNHckxyblVHOGFNNmhZMjFVejlmc1R2aHczWTNTQkEr?=
 =?utf-8?B?V3ZYck9HdkF3d3lEV1BMbWpGL1V5T0M1MW5vVmxSQ1I2eFZaa054Z2Exeldy?=
 =?utf-8?B?SmEwaVJoTGJkUHNETXB5dWZ5WWVoL3BWWWlPWEFXd0lQbDFtb1Q5K1RqSUFN?=
 =?utf-8?B?c0FLc1dXTCs0KzdwVW92ZDEzWDdwd0JyUEpQMGFTVUx2c3ZlbFRDb3hEWHlu?=
 =?utf-8?B?bytsWnBlUm4wdGVIMHovNFEydDVaMzk3Y2FHaXpjTzhmdEx0dFZQNWxyWnhI?=
 =?utf-8?B?ZDdCRWg0emFhaTRFcVlNOEllb2lPQVoyWmNBWHZadDBURlhPTm5LVHgwc21i?=
 =?utf-8?B?eVlmNjZJOXEyTVpLelhtT1YybW5IWjhwM1AvMkxYRU5VOFp0V0oxdFpRTk9K?=
 =?utf-8?B?RmsxSjV3b3Z3N1BIeHgxNDgxaHVGTlNSNHR6Vml5QjRtWHV5b3ZwZGZmMzk4?=
 =?utf-8?B?R3NpcHRWaTZjYkxzMEg0Wm9waC9mL2srMUV3aWcrT3J6Mk5odmZyV0N1MmxT?=
 =?utf-8?B?SFBVZDhBKzRtcG80NlQweTZRcXZtdHRCbDZZN0l4U1NOQ2dzR29ZVG1vSU5Z?=
 =?utf-8?B?cDV6YkJGamE3VExXM1FscWZ0cURSdHFBUkNKeEU4dTdROFZhL3pVS0N4bjFP?=
 =?utf-8?B?ME83cWJrdDNxNGJIaHlCdHhhc2xJNDEvajVGeUxSTk1TVTAwb1M2RTlqSFFl?=
 =?utf-8?B?OWIwaGt2L1I1R3QxcUduZHJkVmJLZTVhUGRXSjVFOGdNTFZDSVZCaFpjTkh5?=
 =?utf-8?B?SWI0bStwZkpLa1FqL0pMYUpiZFc1MkN3czZWS1o0cnpKWU5hYldpWWIzeDJT?=
 =?utf-8?B?WmlXMW9WS3YyanA2d0V4YUczd2l4RTZvNmhheFNmY1FST1ZBOXczRVo1OXBT?=
 =?utf-8?B?QU5uelgrZUt6YUphYWhDeEVpSWtuYjMxTnNZbTlNc01CbHc9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjZlcmJERVlZelVNQ1U5NVVWSThQcWJhNjFFWW1ZVHlnTldNTGdERjVHcHoz?=
 =?utf-8?B?YjQ2YlcwamRDZGdnZ1FNbFc2RkdjUUxhYkx6VEtuOEZsU0pKU3RVOW0vV21m?=
 =?utf-8?B?VmNVZ0R5VmlaeTB3endFL001cEx2eEFya29UN092cEgxbEVjc25URE1UWFll?=
 =?utf-8?B?VWdZZHBDSjVQZ1ArN25ZVkJPdFZUQmRJVkFxUSswcXJQaG0rU0ttZ3U0K2du?=
 =?utf-8?B?RitPalR5d055SDhUSS9nM1M0bCtDbmhHazR2UW1CQXVtNDRNNTlqeW01NGVR?=
 =?utf-8?B?TXlBUHlSUzE1WkVDNnhmOXljaGgwbmJNUWltYTQxcHNlYkc4aTZEYXZ2T1pn?=
 =?utf-8?B?U3ZzZGUvYjVsbitrMXhzeXdJLzJNQmw2bW5IbUYvSWhrTThVdXVWUHJUUnlK?=
 =?utf-8?B?L3NjK2lLdmNXRldaaDRpbm90SXpGY0htN09yREZXQ1FPeUdvR0pOSEs5MFJj?=
 =?utf-8?B?UVFjeHlyeVA2cVM2dXBKemZPaEF5MXc3ckU1bTFPVnJRVG5OYWh1VkdqbXZH?=
 =?utf-8?B?ZWNoT1BmMDVnSTdhQVNqazczTTNieVNrZDkwdE1RZGt3ZXVBVzJ1TzhjbW5l?=
 =?utf-8?B?NUpPcDMyNWhlYkRzUkU3RCtNTXFRTFNyVW5HMmFxRjQ1djF5eXZ5Q1l4Vzhl?=
 =?utf-8?B?TjNUVDI2aVlsRlRJNkNoUDRUTXdhSFVwUjNBWTVCMVkrbS9DakRFNEpFOGls?=
 =?utf-8?B?VnBESmpRMHVla2IvcGR3MGJhYUFLUHdHSzNGdUF1YXVXRkRjYUZJVGxkU0px?=
 =?utf-8?B?aFkyeUVZcXpLN3NDajB4RXpSS0IzY1RyYlJRbGRudnBnNGFTTWd0ZHg4MzVo?=
 =?utf-8?B?M0FrY2tZWXlUQlBDN0ZIY29LT0lGK2o2bS9OY0dYN3cvUXhKK3gwYktUNDN2?=
 =?utf-8?B?c1h0RC92R1lNRWFBeWVEdWo3eUJ1TmRSNE1FM2ZPRWJQUmlpWjk1d2pkZmpw?=
 =?utf-8?B?U2cvOW5LeG44MlhXUUhEcmhyWjJDU2pvY01jSXg2ZFRFVk9HZ3ZXQS95Zm4v?=
 =?utf-8?B?NG1JTXl1N215cTJwaXFZSlBRZHlacklnRTdIVzE1VzR6VmNQNm1FMW5kNlJl?=
 =?utf-8?B?OHJEZXhsS1IxMlM2bzB2b2JOY3M2aldQZkxaeXdjbGpXQ0M5SnM4SUFFbHdD?=
 =?utf-8?B?R0s1dDRPQTFLRzNmNkpzQzAzWFlYWTQrdno3c2FveUVtaTRSdDU5ZW5oQ25x?=
 =?utf-8?B?aEJKSWNmNmkvaTYwQVQrKy9EanB3NHVjSy8rdWloQzBQWU9UclVEZ25oZk8r?=
 =?utf-8?B?dTRabzRlYnZxemZEb1NqWXlEanVWa3dqQTZOUFprVXpyck9DOHhocmZRVC85?=
 =?utf-8?B?aWF2K0YxeFhOZU01K0FIU1ZVTWk5TXdSRlQyMTUxc01iOUNEZWpTTHFNbktL?=
 =?utf-8?B?Zm1talBMRFdCNXEveHVVdnJNSXdNdE5TKzRWWnZEalJTNUYrQzV4ZjVmRnUx?=
 =?utf-8?B?TEpyZkE2RmE1YmJTN01kcllCa3pWUDREYXNCbUhtMmhxOW9yUFc2Si9tMEtH?=
 =?utf-8?B?NTVHQWR2ZW91RlFTTjdqN25DVTFVRy9LamdzdExIOGtZTHhwNXJKZG5vNUJM?=
 =?utf-8?B?TnQ5S0xGZXhqUm41K1FBc3ltV1JFYzY2WWl2U1duRDlvdWgrT3lQRFI3N3lZ?=
 =?utf-8?B?SUNBTnJrYit4WWM0TmUxaXczVldnN1F2TjhxU0VWelZRWDdvdDB0VnN6Qm9M?=
 =?utf-8?B?L09KNWZEbVNUUFU0YkhheUUwWXZhMlVDZloraDhxWWpuTm13TS9sYWZaaXU0?=
 =?utf-8?B?UjlTRHpVeWU4REJMV1A5bStSU1o0Mk82STlsenN4R25CMzFPU0dnUG9saE9r?=
 =?utf-8?B?QUt3VzJKb1ZrZmwxLzBueU9QZTRGV2N0WEcvSnBBdVRmR1g4bFFDL0V2OTFK?=
 =?utf-8?B?ZXFuTnAyVHVlN3lnZXRvd2hNMERmUFY5R3BxbkFoQUhJN0IxYTZqOWRaRGJQ?=
 =?utf-8?B?VmxSNW05VVk2QkJTU2tkYUhGR3JKejgxaUVsSXBpNVFteXBnSU9DcUZGZFly?=
 =?utf-8?B?TXJuNFhWcTVOblB3b016eGJtS3JkVFVUaVpPaWFxTExERjBQbExMTnRWaUNm?=
 =?utf-8?B?YUxDbzVVaG1UTUw0dVhWWUJ0V01VSFRkUlRUdFdxMTcyemZ2dzhyT1gvbHZw?=
 =?utf-8?B?T3BQeW9LVFhZTEhaVUNCeXJVcDhTS3hTbWlIaGt2eU9TNUY5aHh2YXd0c0tp?=
 =?utf-8?B?T3c9PQ==?=
Content-ID: <6D5F8EC16B134248841AAEEFC22881EA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2581b23b-389e-4fe5-f358-08dd19c881a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 09:45:11.5355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dyj2QxSoP9EcqY3pogEd1K8mpkSUoslFJXtDlsNrYMFN8E+2VrruY41Mp+qLsIY9qro1bYKGrE/OroOSPhgvikjxh5Y7WwPrGvZxXxwLz9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7142
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchip.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTk97dGcToBwJgjUSTm7zuuBIYoQVfhegW3F+n5VW4c=;
 b=Fxgz2b1n2p4h4urnbebcqq4W3o101+uH9wxgagup7LZ6WiClDwNbLRsoqqCYUIO3WgdiWNFlgD9x8u3YfnOQ7O3jDVkRnVC9l3gvvminyYNOLxNzP+oZRMV01netFEGy1SDCE5ywRBGPghLILUz6f2AE5/p4OOVDkeNjNU0oTzEwpLQKhOtyPXWzZnSSrpxMAOrZCMVakEy/JRwqwnDoFP1ukY4JdgJ3Rx6U3STnFZdYTXoNlqu+TZgucT/eshUcgZoBS7XwXo2fi+nHO9ec04D3p9XFF6OaLstFnXm+EzcIeKs/kC8toM2a7iJgRVEDflvY90LFxkLWaJWTVLoXBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=selector1 header.b=Fxgz2b1n
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH 1/3] board/beagleboard/beaglev_fire: fix
 update gateware feature
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: "Jamie.Gibbons--- via buildroot" <buildroot@buildroot.org>
Reply-To: Jamie.Gibbons@microchip.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAyMDI0LTEwLTIyIGF0IDExOjI0ICswMTAwLCBKYW1pZSBHaWJib25zIHdyb3RlOg0K
PiBGb2xsb3dpbmcgdGhlIGFkZGl0aW9uIG9mIHRoZSBmaXJtd2FyZSB1cGxvYWQgQVBJIGluIGxp
bnV4IHY2LjYsDQo+IHVzaW5nDQo+IGRlYnVnZnMgZm9yIGZpcm13YXJlIHVwZGF0aW5nIGhhcyBi
ZWVuIHJlbW92ZWQuIFVwZGF0ZSB0aGUNCj4gdXBkYXRlLWdhdGV3YXJlIHNjcmlwdCB0byB1c2Ug
dGhlIGZpcm13YXJlIHVwbG9hZCBBUEkgd2l0aCBzeXNmcyBhbmQNCj4gZW5hYmxlIGFwcGx5aW5n
IHRoZSBvdmVybGF5cyBkdXJpbmcgYm9vdC4NCj4gDQpIaSBhbGwsDQoNCkFueXRoaW5nIGhvbGRp
bmcgdGhpcyBzZXJpZXMgYmFjayBmcm9tIGJlaW5nIGFwcGxpZWQ/DQoNCkFsc28gYSByZXZpZXdl
ZC1ieSB0YWcgd2FzIHNlbnQgYnkgbXkgY29sbGVhZ3VlIGhvd2V2ZXIsIGl0IG1heSBub3QNCmhh
dmUgYmVlbiBwaWNrZWQgdXAgYXMgaGUgaXMgbm90IG9uIHRoZSBtYWlsaW5nIGxpc3QuDQoNClJl
dmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KDQpU
aGFua3MsDQpKYW1pZQ0KPiBTaWduZWQtb2ZmLWJ5OiBKYW1pZSBHaWJib25zIDxqYW1pZS5naWJi
b25zQG1pY3JvY2hpcC5jb20+DQo+IC0tLQ0KPiDCoGJvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXZf
ZmlyZS9ib290LmNtZMKgwqDCoMKgwqDCoCB8wqAgMSArDQo+IMKgLi4uL3Vzci9zaGFyZS9taWNy
b2NoaXAvdXBkYXRlLWdhdGV3YXJlLnNowqDCoMKgIHwgNDEgKysrKysrKysrKysrKystLS0NCj4g
LS0NCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQ0KPiDCoG1vZGUgY2hhbmdlIDEwMDY0NCA9PiAxMDA3NTUgYm9hcmQvYmVhZ2xlYm9hcmQvYmVh
Z2xldl9maXJlL3Jvb3Rmcy0NCj4gb3ZlcmxheS91c3Ivc2hhcmUvbWljcm9jaGlwL3VwZGF0ZS1n
YXRld2FyZS5zaA0KPiANCj4gZGlmZiAtLWdpdCBhL2JvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXZf
ZmlyZS9ib290LmNtZA0KPiBiL2JvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXZfZmlyZS9ib290LmNt
ZA0KPiBpbmRleCAwNWY0ODU4YmFjLi4xNDAyNDU4ZDhiIDEwMDY0NA0KPiAtLS0gYS9ib2FyZC9i
ZWFnbGVib2FyZC9iZWFnbGV2X2ZpcmUvYm9vdC5jbWQNCj4gKysrIGIvYm9hcmQvYmVhZ2xlYm9h
cmQvYmVhZ2xldl9maXJlL2Jvb3QuY21kDQo+IEBAIC0xMiw0ICsxMiw1IEBAIGJvb3RtIGxvYWRv
cyAke3NjcmlwdGFkZHJ9Ow0KPiDCoGJvb3RtIHJhbWRpc2s7DQo+IMKgYm9vdG0gcHJlcDsNCj4g
wqBmZHQgc2V0IC9zb2MvZXRoZXJuZXRAMjAxMTAwMDAgbWFjLWFkZHJlc3MgJHtiZWFnbGV2Zmly
ZV9tYWNfYWRkcjB9Ow0KPiArcnVuIGRlc2lnbl9vdmVybGF5czsNCj4gwqBib290bSBnbzsNCj4g
ZGlmZiAtLWdpdCBhL2JvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXZfZmlyZS9yb290ZnMtDQo+IG92
ZXJsYXkvdXNyL3NoYXJlL21pY3JvY2hpcC91cGRhdGUtZ2F0ZXdhcmUuc2gNCj4gYi9ib2FyZC9i
ZWFnbGVib2FyZC9iZWFnbGV2X2ZpcmUvcm9vdGZzLQ0KPiBvdmVybGF5L3Vzci9zaGFyZS9taWNy
b2NoaXAvdXBkYXRlLWdhdGV3YXJlLnNoDQo+IG9sZCBtb2RlIDEwMDY0NA0KPiBuZXcgbW9kZSAx
MDA3NTUNCj4gaW5kZXggZjQ1NTAzN2I2MC4uY2U1NTM5NDM0Mw0KPiAtLS0gYS9ib2FyZC9iZWFn
bGVib2FyZC9iZWFnbGV2X2ZpcmUvcm9vdGZzLQ0KPiBvdmVybGF5L3Vzci9zaGFyZS9taWNyb2No
aXAvdXBkYXRlLWdhdGV3YXJlLnNoDQo+ICsrKyBiL2JvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXZf
ZmlyZS9yb290ZnMtDQo+IG92ZXJsYXkvdXNyL3NoYXJlL21pY3JvY2hpcC91cGRhdGUtZ2F0ZXdh
cmUuc2gNCj4gQEAgLTEzLDIwICsxMywzOSBAQCBmaQ0KPiDCoGNwICIkMSIvbXBmc19kdGJvLnNw
aSAvbGliL2Zpcm13YXJlL21wZnNfZHRiby5zcGkNCj4gwqBjcCAiJDEiL21wZnNfYml0c3RyZWFt
LnNwaSAvbGliL2Zpcm13YXJlL21wZnNfYml0c3RyZWFtLnNwaQ0KPiDCoA0KPiAtbW91bnQgLXQg
ZGVidWdmcyBub25lIC9zeXMva2VybmVsL2RlYnVnDQo+IC0NCj4gwqAjIFRyYXNoIGV4aXN0aW5n
IGRldmljZSB0cmVlIG92ZXJsYXkgaW4gY2FzZSB0aGUgcmVzdCBvZiB0aGUgcHJvY2Vzcw0KPiBm
YWlsczoNCj4gLWZsYXNoX2VyYXNlIC9kZXYvbXRkMCAwIDEwMjQNCj4gK2ZsYXNoX2VyYXNlIC9k
ZXYvbXRkMCAwIDE2DQo+ICsNCj4gKyMgR2V0IGRldmljZSB0cmVlIG92ZXJsYXkgc2l6ZQ0KPiAr
ZHRib19zaXplPSQoc3RhdCAtYyAlcyAvbGliL2Zpcm13YXJlL21wZnNfZHRiby5zcGkpDQo+IMKg
DQo+IC0jICMgV3JpdGUgZGV2aWNlIHRyZWUgb3ZlcmxheQ0KPiAtZGQgaWY9L2xpYi9maXJtd2Fy
ZS9tcGZzX2R0Ym8uc3BpIG9mPS9kZXYvbXRkMCBzZWVrPTEwMjQNCj4gKyMgV3JpdGUgZGV2aWNl
IHRyZWUgb3ZlcmxheQ0KPiArZGQgaWY9L2xpYi9maXJtd2FyZS9tcGZzX2R0Ym8uc3BpIG9mPS9k
ZXYvbXRkMCBicz0xIHNlZWs9JCgoMHg0MDApKQ0KPiBjb3VudD0iJGR0Ym9fc2l6ZSIgc3RhdHVz
PXByb2dyZXNzDQo+IMKgDQo+IMKgIyBGYWtlIHRoZSBwcmVzZW5jZSBvZiBhIGdvbGRlbiBpbWFn
ZSBmb3Igbm93Lg0KPiAtZGQgaWY9L2Rldi96ZXJvIG9mPS9kZXYvbXRkMCBjb3VudD00IGJzPTEN
Cj4gK2RkIGlmPS9kZXYvemVybyBvZj0vZGV2L210ZDAgY291bnQ9MSBicz00DQo+IMKgDQo+IMKg
IyBJbml0aWF0ZSBGUEdBIHVwZGF0ZS4NCj4gLWVjaG8gMSA+IC9zeXMva2VybmVsL2RlYnVnL2Zw
Z2EvbWljcm9jaGlwX2V4ZWNfdXBkYXRlDQo+IC0NCj4gLSMgUmVib290IExpbnV4IGZvciB0aGUg
Z2F0ZXdhcmUgdXBkYXRlIHRvIHRha2UgZWZmZWN0Lg0KPiAtIyBGUEdBIHJlcHJvZ3JhbW1pbmcg
dGFrZXMgcGxhY2VzIGJldHdlZW4gTGludXggc2h1dC1kb3duIGFuZCBIU1MNCj4gcmVzdGFydGlu
ZyB0aGUgYm9hcmQuDQo+IC1yZWJvb3QNCj4gK2VjaG8gMSA+IC9zeXMvY2xhc3MvZmlybXdhcmUv
bXBmcy1hdXRvLXVwZGF0ZS9sb2FkaW5nDQo+ICsNCj4gKyMgV3JpdGUgdGhlIGZpcm13YXJlIGlt
YWdlIHRvIHRoZSBkYXRhIHN5c2ZzIGZpbGUNCj4gK2NhdCAvbGliL2Zpcm13YXJlL21wZnNfYml0
c3RyZWFtLnNwaSA+IC9zeXMvY2xhc3MvZmlybXdhcmUvbXBmcy0NCj4gYXV0by11cGRhdGUvZGF0
YQ0KPiArDQo+ICsjIFNpZ25hbCBjb21wbGV0aW9uDQo+ICtlY2hvIDAgPiAvc3lzL2NsYXNzL2Zp
cm13YXJlL21wZnMtYXV0by11cGRhdGUvbG9hZGluZw0KPiArDQo+ICt3aGlsZSBbICIkKGNhdCAv
c3lzL2NsYXNzL2Zpcm13YXJlL21wZnMtYXV0by11cGRhdGUvc3RhdHVzKSIgIT0NCj4gImlkbGUi
IF07IGRvDQo+ICvCoMKgwqAgIyBEbyBub3RoaW5nLCBqdXN0IGtlZXAgY2hlY2tpbmcNCj4gK8Kg
wqDCoCBzbGVlcCAxDQo+ICtkb25lDQo+ICsNCj4gKyMgV2hlbiB0aGUgc3RhdHVzIGlzICdpZGxl
JyBhbmQgbm8gZXJyb3IgaGFzIG9jY3VyZWQsIHJlYm9vdCB0aGUNCj4gc3lzdGVtIGZvcg0KPiAr
IyB0aGUgZ2F0ZXdhcmUgdXBkYXRlIHRvIHRha2UgZWZmZWN0LiBGUEdBIHJlcHJvZ3JhbW1pbmcg
dGFrZXMNCj4gcGxhY2VzIGJldHdlZW4NCj4gKyMgTGludXggc2h1dC1kb3duIGFuZCBIU1MgcmVz
dGFydGluZyB0aGUgYm9hcmQuDQo+ICtpZiBbICIkKGNhdCAvc3lzL2NsYXNzL2Zpcm13YXJlL21w
ZnMtYXV0by11cGRhdGUvZXJyb3IpIiA9ICIiIF07DQo+IHRoZW4NCj4gK8KgwqDCoCBlY2hvICJG
UEdBIHVwZGF0ZSByZWFkeS4gUmVib290aW5nLiINCj4gK8KgwqDCoCByZWJvb3QNCj4gK2Vsc2UN
Cj4gK8KgwqDCoCBlY2hvICJGUEdBIHVwZGF0ZSBmYWlsZWQgd2l0aCBzdGF0dXM6ICQoY2F0DQo+
IC9zeXMvY2xhc3MvZmlybXdhcmUvbXBmcy1hdXRvLXVwZGF0ZS9lcnJvcikiDQo+ICvCoMKgwqAg
ZXhpdCAxDQo+ICtmaQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
