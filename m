Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCC4E77198
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 09:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4571A608B8;
	Tue,  7 Jan 2025 09:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jsltf2A62VD8; Tue,  7 Jan 2025 09:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8580960834
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8580960834;
	Tue,  7 Jan 2025 09:12:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34ADFDB4
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 09:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11C5F40561
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 09:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pllHtocBImNL for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 09:12:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::61d;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0994E40557
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0994E40557
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::61d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0994E40557
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 09:12:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cDZbT7/zIzlYUbNeNnVhBLFuUJxBGntXm7N5eniecJUWL0tjU18GM55mbsecguGIOCzjznHsCDaAR7s/BrPz15RXJHbPMA2E7kaQMMOy/h6JmY+o9pid+yiBLJnKpzIDZYZGVGNAkCDnqBRgAHZTuWkz1CPWI4+F8PaXTwbeFRtMAW1J4CmM5mN7EORJWZ3f83kpsv6r/RQ0m2+Q1/KBNdCRE6nhiEnItPuZbyvl5G7pjhy72X7s7/PmOrMAPL4OjyV3dHO3V8uj1da/ckrvhWkrZFAbQJwXj8WSx2mBB/xV7N7HoNcGlJ7shDdx+ECQRlac27BNcrA6enz+z5RrVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QS8LvNjN6r7Nejiq/mbmRxKBIRTP32U5JtKc7Ufz6c0=;
 b=BJR/jasnD0I9W2XOpRkfF0CLKn6a417TZ42W7KXezKBemvhMNA/qyPm6t3vcScN0u+fuTaQt7bBBDrxfpoWz8rQfVJsnxckmHKz2/4lGPtRfKdSxsbU/5UD5dVzHsW+l3BXLcSPLjIEykEUIQz36P/vrs8MNckr8kNyPdLc897gXJdlwfYyJVhQVsXiDRRD4lQ06XKSpvjbIvfN1z17y/vZfX94L7/Y9UtsqSKIZBHgVeZSuNNb+EIBGqoVm+9k9ScgBz6/ZR2SdjasAuRsTQ/qlHl8YEikuaUhmPOtowh128tRsn7vWcRooc++vW+imfuvPojkQ3YqrXqxMZ92RsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 PH8PR11MB6780.namprd11.prod.outlook.com (2603:10b6:510:1cb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 09:12:13 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::3adb:8c97:94da:80]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::3adb:8c97:94da:80%5]) with mapi id 15.20.8314.013; Tue, 7 Jan 2025
 09:12:12 +0000
To: <buildroot@buildroot.org>
CC: <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 1/3] board/beagleboard/beaglev_fire: fix
 update gateware feature
Thread-Index: AQHbJGw65okyesZWnUGl+4nOgz260rLhGrmAgCplxwA=
Date: Tue, 7 Jan 2025 09:12:12 +0000
Message-ID: <c0e97cf822d8b164047145c32bde8d7da05d4ca9.camel@microchip.com>
References: <20241022102426.220196-1-jamie.gibbons@microchip.com>
 <20241022102426.220196-2-jamie.gibbons@microchip.com>
 <f01a3f4a5c5c525aeecfb8e6a485a3378511306e.camel@microchip.com>
In-Reply-To: <f01a3f4a5c5c525aeecfb8e6a485a3378511306e.camel@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|PH8PR11MB6780:EE_
x-ms-office365-filtering-correlation-id: 1ef91ae7-4c13-4c2f-ddd0-08dd2efb5f59
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N2hlcHZxMDQrMW9Qb0pLZld3SUlWT1E0UVQrNW5aR3RMTElRQUlnVHpEa21M?=
 =?utf-8?B?SVBRY25TZWNPUkxmVGtTRVhuRklLUGsvTWNzb0RWbDZlcTJ2NitLVWMrODAv?=
 =?utf-8?B?N2NTQW1MYTBNK2lJczBraUhuZklHRjNsL2ZmbHFMQlF6Uld3Y3dIdjZyTzd0?=
 =?utf-8?B?N1RkcE9DMFVHemlYQ2dHdFA2N2hURFh3R1ZUV2E5QVIwVGRxMUcyYmpVNDhN?=
 =?utf-8?B?TlNtWk85TnA0N0gvU2xtR29qVi9RZmFCYmgwYStuc3JxNS9mY2J1aUI3L0dU?=
 =?utf-8?B?bVIraWNTRFN1NzczdGVhQk9tMjduQXNHSXFpTUczMTE4ZGNGdmk4QkhtYWpS?=
 =?utf-8?B?a1NmNVlDRFpjQzFGUFhHb2RuSklUb2YrTE1pTkxkOHE1dE41M0tCQ0pIQisz?=
 =?utf-8?B?K3hCZWRuRUNQTEt5YlNBNjg1cWxYWVJYa0ZaRE5yMkNkU2hWZlA0ZjFLKzhY?=
 =?utf-8?B?c0FTbmFhSlcrMzRmRUpyWERNb09RSDljMmZtNzRtbk9YTTBqVWNTQ3hnaDQ2?=
 =?utf-8?B?TDlRdzN4ajlWLzk1YWRCZ3lBUGFrYm9HK3RqdWVsSHdod2l0eVBDTXJHeXBh?=
 =?utf-8?B?RFB2eGFSZFhjeHhSem5CWjB5Sm9hekFuNmxnbVpYNDVTWEw2TXRpLzgxVzU1?=
 =?utf-8?B?R0RodmxpSURoaDVnajU3eHFoYmJUOTdmdmQ3TlI1VHA2VFd1NXBNOU9vdEpU?=
 =?utf-8?B?UmVTdjZUQ01XYWtGb3BlY0xsdjFZZnpNTTVHQVhOcTRLTmhlaWtQSytkL1By?=
 =?utf-8?B?aU9TNTYwMFJTL05lT0RmSFhjQWZ0Wkh6R0RoZzFBUEtPT200WmhWbS9uUWFm?=
 =?utf-8?B?RVo1NXMwSVh3RHQyR3p5YTNOQ1oyUi9ySG1nUHVXWVVxRzgxQXNIeVVoZngy?=
 =?utf-8?B?M25SbXlqNWdINnlVb2FpQWIvVXFmZEtKVkhrWkRnOWVGZUVHRzJQb2ZoZmxp?=
 =?utf-8?B?R3ZQcDJzcW55RXpTQ0dSVmZsRTZQUTFLRlRmRFFScDkrL2JzYWUvdittWW5C?=
 =?utf-8?B?SitNTXkvSW5GNVpGeVduWWJUcTluaDB5MjZDVERzb1pQZy90dUdQN3N1dXoy?=
 =?utf-8?B?TnBsVW5VVlk5T3F0b3g4aXNOemZTUnFFU0ZiRng3Y3F4L3J4dkg1MEh1Zk53?=
 =?utf-8?B?aWZsVnZsRmhDUldvM0xYOWNneHpkclM4TEdLQzlCSHUrelhNYk95alU1czB1?=
 =?utf-8?B?M2oxOExqRUoyZ3hHck1lUEY2eXhuVGR1TnhkdExTLzVMSkFFRGNhekNhVENV?=
 =?utf-8?B?dmFxbjVKSkJEK0hZYzFXclF1aHkvbTE0UEZmb3hIelkvMnZpTWtmUWFUQ3Ex?=
 =?utf-8?B?QzJnQm9rcnVabDdHOVlSRzRsdk00dllWTDBFVXJOcWg0bFZlalBqQ2ZEUjFv?=
 =?utf-8?B?VStTUnBCZExvYkhMSDV2NXdheHNWUU5oT3c0dTFXN2Q2UWhLcmlINll3OE9W?=
 =?utf-8?B?bC8rR0FORWxyeEorV3haYmZKQ21RUitRckNmQytxbEwxVFcxUThLVG8yOXRa?=
 =?utf-8?B?c1VwcS9VblpuTjl6aGpNSnBCUWRZTVJZWnhJUHdycFFUNm85cStjMTdMeXAr?=
 =?utf-8?B?dlNXZ2pZaE16bGgvd3A2c1V5N0lGWHhIdDFUdkNidGlxcEZyQnVXak1oblF1?=
 =?utf-8?B?QllCRm4vMFphT0xqZnNlUStsWk0zelJVSzIyT1FhOUpUbjdoREJFbHRlcFg3?=
 =?utf-8?B?RUJBNW43Qm04SXdhUmpZQzZNTmN1SDVzeUVtRkhkalh2TnljTWNmV1BQeWlu?=
 =?utf-8?B?eHYxZk1PcUJDMlVha0lwa0p4UTFqdUNCZEJJYkVjRFlBSFlBZWtaT21uNERV?=
 =?utf-8?B?Y2dqcjZZOG1IelpnQTlpMDFSWUJhVHhNL1NFSUFDYXZSdzF5VVJKVjRqSlUy?=
 =?utf-8?Q?pkMkqwZ4nmPDD?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yzlub2N6M3N2ZzVIMDJmS20vZncwcTBXanI2cktiSlJac0tmcFJmdVhFRFlR?=
 =?utf-8?B?ajhLUkMxZmdaVGthZ0VHQTRjYk1hVnMveW53U0FPTHpZSk8wLzlMa3pwUyt0?=
 =?utf-8?B?bUpMVjdKeXMrVGFhYkhNdEMvaStvUmo1cGZwcGkzRkhQVmJrcUVteFl3dHc5?=
 =?utf-8?B?bnhHSUJQU3dDN0VGaWIxTHlPSVd5NEh5d0NBYUNBQjJDdkZGRnJBZm9janB3?=
 =?utf-8?B?UG55WDJ4S0lZTy93UzBKemU5dEZaRlM4Z0J0eFMwelYrb0l1b3ZuUWkwTm9o?=
 =?utf-8?B?N1FSVzhjb29Ccm9Wa0ZXU3hvSnJSenhkdnVuYTdab1BqVnNGTFlKdmdORk14?=
 =?utf-8?B?MmVJWHdqMGhxelFoVXRsckk2bDB4KzhDcXdGUE82NFovRXFQRzBDdWZIMndT?=
 =?utf-8?B?VHJ1YXA0bVVKYjJyNlc1M3pMa3h1T1cyd2Y5Mmp6OTVIdDlWaU1aK25MREY0?=
 =?utf-8?B?bVQ4SWhubFhkTFVwUitVcEs4U1NqNWpKcTNJUjdjOCtaQlljNnFhSGtLWWV4?=
 =?utf-8?B?aEp6MjV0bFlKMlUyUllzbUEzOFVENGtnU3Zta3VobEZTN0hvNHAvV2R2WHNV?=
 =?utf-8?B?b2RUdUYwaThYOGdpeGg3N2NIcXZLQVhEYW9aQXBrWkJqdjhYaEVnWVM4VFAw?=
 =?utf-8?B?RW55eEV6WG0yaUd2WTJocnoycHlxM2NVUTA5RzVNNm1IRDBZQ2JEdmJodFhS?=
 =?utf-8?B?YW1xRE5uMXg0aVkrZ1BSM2JVVHowWXF5elo2WDVwQkxzVXpvdytBYis4dm5K?=
 =?utf-8?B?a1l3NXNSR0U5b0dsZ0lBcWp5MVU5UkpYUnVveFEwM3FCeitrVVptclAxdFF6?=
 =?utf-8?B?Z2lVWUdZRkwyaSs1QmVycDR2VndTQ09rNlBrOGlzWXFhcGZCaFFrSWUxWXVw?=
 =?utf-8?B?V2xCQXhnNkY3NnhjdGNzWEdVTFhCS0xRaEtGS3pqcE8vUy80aWZNcE9zeEFP?=
 =?utf-8?B?a0JQOXJUK000WDFmK0x0VEJrMjBBdE84N01rMFZyQm1DdWUwdjNNMVpmYXM5?=
 =?utf-8?B?aHNkVkRpbHVvVEdpVU13UmVTOE9SU3NrS1h5Sk5UZzNhbHpyV2REeS9KS2FF?=
 =?utf-8?B?OWtacWVocGVNeDAyam01S3VtbmZqdjVuY1VyekYwbEltZW5RN0MwYmJiRUVH?=
 =?utf-8?B?aWIvellRbHg0Q3crS1pEUmZiaitXWGV6R0wyei9aMnVDMmM4ZHYybXpaQTJD?=
 =?utf-8?B?SUVjOTgrMVVFRDdzYW5JcTAvR1YxZ0dHdTlmU2pYdFFHanVLQXhvcUEwRVdG?=
 =?utf-8?B?cWRTZDRtU2ltZlozbTQ1TitnamZielZjNTFWZzJoRlVVZjZuQUM3NFdBK0Zy?=
 =?utf-8?B?R0o1ckNPdnlUYm9nZ1c2SXNOUm41NXpxbkdZRzFkOVpYRzVSN1VuRmFVKzFE?=
 =?utf-8?B?ZzI0RUYxZVd6RElGY1RWbExGM3ErL0kycDY0SXVYeWlvOWltUkJ3Y1c0NW42?=
 =?utf-8?B?YUNacTgzMlpzclpaR2JPTFlsWmN5R0phdEpZbW9LVm92OWQ4ZHhaa0FPQmZh?=
 =?utf-8?B?SzFKazVkYjkzRnFWQlFrekZwemI3VVFhYmtoaUVPN1N1bHpjNlVFQU1Mb1VL?=
 =?utf-8?B?Q2w1M2FZc1lMMmJORytvU3BUOE83T2RwSklzNlJTdVRkMmJZdG1DUCtvc2xq?=
 =?utf-8?B?RnhCcjkrYk1iM2dVSDgwNjJnUGlFckNEQ1Z4akQ0V2dPdEZldlFDUEY0ZTVO?=
 =?utf-8?B?R3pIMWZ4eGw3Qno0RzBRTjI1QlU2R2pGZFI3eVQ1RmFIdWdkOWlMdUdPb2dL?=
 =?utf-8?B?WWtyYTBKdlg1YVlmaEdTSkNnWEl4blZKdlNzTnVFR0ZGQWF0bS9aeDZua2s0?=
 =?utf-8?B?a3ZkekN3RGlMcE15NHVjK1JMYWRieTJPekNJczVLOE5TVVN4Um5FN3pXY2pr?=
 =?utf-8?B?NGdkM29Zanpvbm5ZcFBFSDhONjllT080N2toM2gvQVJiRnkwV2pqVnRCVDZC?=
 =?utf-8?B?RXBhV2RES2p3UnhyMjR6YmZYNi91QWdkMXJtbFRqbVA4YzBMK0k2N3FhaWpQ?=
 =?utf-8?B?dk5nSWNQZGM5dkdYbGdnRG1iRDk0dmMzVWwzSHVQeFJWLzUyL3h5ZjBwNlpE?=
 =?utf-8?B?NVBNVS9XdFZ4Q1pMWkkvY043U2hUMStteDhXUkFvRStpSXJzSDBYVVRVTjA5?=
 =?utf-8?B?SW9RWFFEZzhtamcwV1hZZGk5c214T0VlbGNrSXh1R2JhcEJmSngwVlp4emdC?=
 =?utf-8?B?RkE9PQ==?=
Content-ID: <E6E1C5C18976624AA6DEC4A9225B2044@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef91ae7-4c13-4c2f-ddd0-08dd2efb5f59
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 09:12:12.7512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AWJXezKozOJzlbOBFX/fojykT19NlWMo+dEbv4ZGqdeHPGYq3NuhJDVUd/zv8CIpneeJEUDcQRCkGU+8a3oatX2WG/c1i1JtmGBA3t6X8Tc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6780
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchip.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QS8LvNjN6r7Nejiq/mbmRxKBIRTP32U5JtKc7Ufz6c0=;
 b=plwgHePCKBUoTXFNn2b8qzhFWylvxAb2rIbl1Eq3jWpKeI1Oplw3LUsy1ppFU0OsNoZg19PnuOClsyB3V4IBgP9T+KPRu314QBy2rS3RWKUHWS3e78xvTdmnwp1ci5CMbmt6BP6ZxQW9jo+I9Sc0VXAWLb3W2rElLuGf0s3QQi7oUSfSYQfsYYs7wXSvoPep3zWsU1F9ZpFomCugqYkPZQPQDp7SambnVZuo3pWEG0cvpWEILrr+Z897Uxg8OobhvEHneIvIa31M5JN/o1CktSjfpEn8aA+d+EHBrRcNFVzK6tSgN/c9zNGigYfknUT9CViuhAozFUz1+V++nFcKNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=selector1 header.b=plwgHePC
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

SGkgYWxsLA0KDQpPbiBXZWQsIDIwMjQtMTItMTEgYXQgMDk6NDUgKzAwMDAsIEphbWllLkdpYmJv
bnMtLS0gdmlhIGJ1aWxkcm9vdA0Kd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xp
Y2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91DQo+IGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZQ0KPiANCj4gT24gVHVlLCAyMDI0LTEwLTIyIGF0IDExOjI0ICswMTAwLCBKYW1p
ZSBHaWJib25zIHdyb3RlOg0KPiA+IEZvbGxvd2luZyB0aGUgYWRkaXRpb24gb2YgdGhlIGZpcm13
YXJlIHVwbG9hZCBBUEkgaW4gbGludXggdjYuNiwNCj4gPiB1c2luZw0KPiA+IGRlYnVnZnMgZm9y
IGZpcm13YXJlIHVwZGF0aW5nIGhhcyBiZWVuIHJlbW92ZWQuIFVwZGF0ZSB0aGUNCj4gPiB1cGRh
dGUtZ2F0ZXdhcmUgc2NyaXB0IHRvIHVzZSB0aGUgZmlybXdhcmUgdXBsb2FkIEFQSSB3aXRoIHN5
c2ZzDQo+ID4gYW5kDQo+ID4gZW5hYmxlIGFwcGx5aW5nIHRoZSBvdmVybGF5cyBkdXJpbmcgYm9v
dC4NCj4gPiANCj4gSGkgYWxsLA0KPiANCj4gQW55dGhpbmcgaG9sZGluZyB0aGlzIHNlcmllcyBi
YWNrIGZyb20gYmVpbmcgYXBwbGllZD8NCj4gDQo+IEFsc28gYSByZXZpZXdlZC1ieSB0YWcgd2Fz
IHNlbnQgYnkgbXkgY29sbGVhZ3VlIGhvd2V2ZXIsIGl0IG1heSBub3QNCj4gaGF2ZSBiZWVuIHBp
Y2tlZCB1cCBhcyBoZSBpcyBub3Qgb24gdGhlIG1haWxpbmcgbGlzdC4NCj4gDQo+IFJldmlld2Vk
LWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPiANClRoaXMg
cGF0Y2ggc2VyaWVzIHdhcyBzZW50IDIuNSBtb250aHMgYWdvIGFuZCBJIGhhdmUgbm90IHJlY2Vp
dmVkIGFueQ0KZmVlZGJhY2ssIHJlcGxpZXMgbm9yIGhhcyBpdCBiZWVuIG1lcmdlZC4gVGhpcyBz
ZXJpZXMgaXMgaW1wb3J0YW50IGFzDQp3aGF0IGlzIGN1cnJlbnRseSBpbiBtYXN0ZXIgZG9lcyBu
b3Qgd29yayBhbnltb3JlLiANCg0KUGxlYXNlIGxldCBtZSBrbm93IGlmIHRoZXJlIGlzIGFueXRo
aW5nIGhvbGRpbmcgdGhpcyBiYWNrIGZyb20gYmVpbmcNCm1lcmdlZC4NCg0KVGhhbmtzLA0KSmFt
aWUuDQo+IFRoYW5rcywNCj4gSmFtaWUNCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1pZSBHaWJib25z
IDxqYW1pZS5naWJib25zQG1pY3JvY2hpcC5jb20+DQo+ID4gLS0tDQo+ID4gwqBib2FyZC9iZWFn
bGVib2FyZC9iZWFnbGV2X2ZpcmUvYm9vdC5jbWTCoMKgwqDCoMKgwqAgfMKgIDEgKw0KPiA+IMKg
Li4uL3Vzci9zaGFyZS9taWNyb2NoaXAvdXBkYXRlLWdhdGV3YXJlLnNowqDCoMKgIHwgNDEgKysr
KysrKysrKysrKystDQo+ID4gLS0NCj4gPiAtLQ0KPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCAzMSBp
bnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4gPiDCoG1vZGUgY2hhbmdlIDEwMDY0NCA9
PiAxMDA3NTUNCj4gPiBib2FyZC9iZWFnbGVib2FyZC9iZWFnbGV2X2ZpcmUvcm9vdGZzLQ0KPiA+
IG92ZXJsYXkvdXNyL3NoYXJlL21pY3JvY2hpcC91cGRhdGUtZ2F0ZXdhcmUuc2gNCj4gPiANCj4g
PiBkaWZmIC0tZ2l0IGEvYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xldl9maXJlL2Jvb3QuY21kDQo+
ID4gYi9ib2FyZC9iZWFnbGVib2FyZC9iZWFnbGV2X2ZpcmUvYm9vdC5jbWQNCj4gPiBpbmRleCAw
NWY0ODU4YmFjLi4xNDAyNDU4ZDhiIDEwMDY0NA0KPiA+IC0tLSBhL2JvYXJkL2JlYWdsZWJvYXJk
L2JlYWdsZXZfZmlyZS9ib290LmNtZA0KPiA+ICsrKyBiL2JvYXJkL2JlYWdsZWJvYXJkL2JlYWds
ZXZfZmlyZS9ib290LmNtZA0KPiA+IEBAIC0xMiw0ICsxMiw1IEBAIGJvb3RtIGxvYWRvcyAke3Nj
cmlwdGFkZHJ9Ow0KPiA+IMKgYm9vdG0gcmFtZGlzazsNCj4gPiDCoGJvb3RtIHByZXA7DQo+ID4g
wqBmZHQgc2V0IC9zb2MvZXRoZXJuZXRAMjAxMTAwMDAgbWFjLWFkZHJlc3MNCj4gPiAke2JlYWds
ZXZmaXJlX21hY19hZGRyMH07DQo+ID4gK3J1biBkZXNpZ25fb3ZlcmxheXM7DQo+ID4gwqBib290
bSBnbzsNCj4gPiBkaWZmIC0tZ2l0IGEvYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xldl9maXJlL3Jv
b3Rmcy0NCj4gPiBvdmVybGF5L3Vzci9zaGFyZS9taWNyb2NoaXAvdXBkYXRlLWdhdGV3YXJlLnNo
DQo+ID4gYi9ib2FyZC9iZWFnbGVib2FyZC9iZWFnbGV2X2ZpcmUvcm9vdGZzLQ0KPiA+IG92ZXJs
YXkvdXNyL3NoYXJlL21pY3JvY2hpcC91cGRhdGUtZ2F0ZXdhcmUuc2gNCj4gPiBvbGQgbW9kZSAx
MDA2NDQNCj4gPiBuZXcgbW9kZSAxMDA3NTUNCj4gPiBpbmRleCBmNDU1MDM3YjYwLi5jZTU1Mzk0
MzQzDQo+ID4gLS0tIGEvYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xldl9maXJlL3Jvb3Rmcy0NCj4g
PiBvdmVybGF5L3Vzci9zaGFyZS9taWNyb2NoaXAvdXBkYXRlLWdhdGV3YXJlLnNoDQo+ID4gKysr
IGIvYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xldl9maXJlL3Jvb3Rmcy0NCj4gPiBvdmVybGF5L3Vz
ci9zaGFyZS9taWNyb2NoaXAvdXBkYXRlLWdhdGV3YXJlLnNoDQo+ID4gQEAgLTEzLDIwICsxMywz
OSBAQCBmaQ0KPiA+IMKgY3AgIiQxIi9tcGZzX2R0Ym8uc3BpIC9saWIvZmlybXdhcmUvbXBmc19k
dGJvLnNwaQ0KPiA+IMKgY3AgIiQxIi9tcGZzX2JpdHN0cmVhbS5zcGkgL2xpYi9maXJtd2FyZS9t
cGZzX2JpdHN0cmVhbS5zcGkNCj4gPiANCj4gPiAtbW91bnQgLXQgZGVidWdmcyBub25lIC9zeXMv
a2VybmVsL2RlYnVnDQo+ID4gLQ0KPiA+IMKgIyBUcmFzaCBleGlzdGluZyBkZXZpY2UgdHJlZSBv
dmVybGF5IGluIGNhc2UgdGhlIHJlc3Qgb2YgdGhlDQo+ID4gcHJvY2Vzcw0KPiA+IGZhaWxzOg0K
PiA+IC1mbGFzaF9lcmFzZSAvZGV2L210ZDAgMCAxMDI0DQo+ID4gK2ZsYXNoX2VyYXNlIC9kZXYv
bXRkMCAwIDE2DQo+ID4gKw0KPiA+ICsjIEdldCBkZXZpY2UgdHJlZSBvdmVybGF5IHNpemUNCj4g
PiArZHRib19zaXplPSQoc3RhdCAtYyAlcyAvbGliL2Zpcm13YXJlL21wZnNfZHRiby5zcGkpDQo+
ID4gDQo+ID4gLSMgIyBXcml0ZSBkZXZpY2UgdHJlZSBvdmVybGF5DQo+ID4gLWRkIGlmPS9saWIv
ZmlybXdhcmUvbXBmc19kdGJvLnNwaSBvZj0vZGV2L210ZDAgc2Vlaz0xMDI0DQo+ID4gKyMgV3Jp
dGUgZGV2aWNlIHRyZWUgb3ZlcmxheQ0KPiA+ICtkZCBpZj0vbGliL2Zpcm13YXJlL21wZnNfZHRi
by5zcGkgb2Y9L2Rldi9tdGQwIGJzPTENCj4gPiBzZWVrPSQoKDB4NDAwKSkNCj4gPiBjb3VudD0i
JGR0Ym9fc2l6ZSIgc3RhdHVzPXByb2dyZXNzDQo+ID4gDQo+ID4gwqAjIEZha2UgdGhlIHByZXNl
bmNlIG9mIGEgZ29sZGVuIGltYWdlIGZvciBub3cuDQo+ID4gLWRkIGlmPS9kZXYvemVybyBvZj0v
ZGV2L210ZDAgY291bnQ9NCBicz0xDQo+ID4gK2RkIGlmPS9kZXYvemVybyBvZj0vZGV2L210ZDAg
Y291bnQ9MSBicz00DQo+ID4gDQo+ID4gwqAjIEluaXRpYXRlIEZQR0EgdXBkYXRlLg0KPiA+IC1l
Y2hvIDEgPiAvc3lzL2tlcm5lbC9kZWJ1Zy9mcGdhL21pY3JvY2hpcF9leGVjX3VwZGF0ZQ0KPiA+
IC0NCj4gPiAtIyBSZWJvb3QgTGludXggZm9yIHRoZSBnYXRld2FyZSB1cGRhdGUgdG8gdGFrZSBl
ZmZlY3QuDQo+ID4gLSMgRlBHQSByZXByb2dyYW1taW5nIHRha2VzIHBsYWNlcyBiZXR3ZWVuIExp
bnV4IHNodXQtZG93biBhbmQgSFNTDQo+ID4gcmVzdGFydGluZyB0aGUgYm9hcmQuDQo+ID4gLXJl
Ym9vdA0KPiA+ICtlY2hvIDEgPiAvc3lzL2NsYXNzL2Zpcm13YXJlL21wZnMtYXV0by11cGRhdGUv
bG9hZGluZw0KPiA+ICsNCj4gPiArIyBXcml0ZSB0aGUgZmlybXdhcmUgaW1hZ2UgdG8gdGhlIGRh
dGEgc3lzZnMgZmlsZQ0KPiA+ICtjYXQgL2xpYi9maXJtd2FyZS9tcGZzX2JpdHN0cmVhbS5zcGkg
PiAvc3lzL2NsYXNzL2Zpcm13YXJlL21wZnMtDQo+ID4gYXV0by11cGRhdGUvZGF0YQ0KPiA+ICsN
Cj4gPiArIyBTaWduYWwgY29tcGxldGlvbg0KPiA+ICtlY2hvIDAgPiAvc3lzL2NsYXNzL2Zpcm13
YXJlL21wZnMtYXV0by11cGRhdGUvbG9hZGluZw0KPiA+ICsNCj4gPiArd2hpbGUgWyAiJChjYXQg
L3N5cy9jbGFzcy9maXJtd2FyZS9tcGZzLWF1dG8tdXBkYXRlL3N0YXR1cykiICE9DQo+ID4gImlk
bGUiIF07IGRvDQo+ID4gK8KgwqDCoCAjIERvIG5vdGhpbmcsIGp1c3Qga2VlcCBjaGVja2luZw0K
PiA+ICvCoMKgwqAgc2xlZXAgMQ0KPiA+ICtkb25lDQo+ID4gKw0KPiA+ICsjIFdoZW4gdGhlIHN0
YXR1cyBpcyAnaWRsZScgYW5kIG5vIGVycm9yIGhhcyBvY2N1cmVkLCByZWJvb3QgdGhlDQo+ID4g
c3lzdGVtIGZvcg0KPiA+ICsjIHRoZSBnYXRld2FyZSB1cGRhdGUgdG8gdGFrZSBlZmZlY3QuIEZQ
R0EgcmVwcm9ncmFtbWluZyB0YWtlcw0KPiA+IHBsYWNlcyBiZXR3ZWVuDQo+ID4gKyMgTGludXgg
c2h1dC1kb3duIGFuZCBIU1MgcmVzdGFydGluZyB0aGUgYm9hcmQuDQo+ID4gK2lmIFsgIiQoY2F0
IC9zeXMvY2xhc3MvZmlybXdhcmUvbXBmcy1hdXRvLXVwZGF0ZS9lcnJvcikiID0gIiIgXTsNCj4g
PiB0aGVuDQo+ID4gK8KgwqDCoCBlY2hvICJGUEdBIHVwZGF0ZSByZWFkeS4gUmVib290aW5nLiIN
Cj4gPiArwqDCoMKgIHJlYm9vdA0KPiA+ICtlbHNlDQo+ID4gK8KgwqDCoCBlY2hvICJGUEdBIHVw
ZGF0ZSBmYWlsZWQgd2l0aCBzdGF0dXM6ICQoY2F0DQo+ID4gL3N5cy9jbGFzcy9maXJtd2FyZS9t
cGZzLWF1dG8tdXBkYXRlL2Vycm9yKSINCj4gPiArwqDCoMKgIGV4aXQgMQ0KPiA+ICtmaQ0KPiAN
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYnVp
bGRyb290IG1haWxpbmcgbGlzdA0KPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZw0KPiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QNCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
