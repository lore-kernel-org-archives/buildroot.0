Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0C4C0219B
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 11:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81A8441303;
	Tue, 11 Feb 2025 11:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2Uz3FmADXa2; Tue, 11 Feb 2025 11:33:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D5ED40704
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D5ED40704;
	Tue, 11 Feb 2025 11:33:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 84F94194
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 11:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65BC0401A2
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 11:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fK4APvf7bOoh for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 11:33:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::61d;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E1764013D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E1764013D
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::61d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E1764013D
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 11:33:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4BKv/sHsSfkgnE50IOgt/6pP8PSobEFfS6WBJ3H+FbgXBh66g0Cs8mWgvMmSLGejKuS7NJho4L2LR2dsLQzkYZ1hMb+qDpG7bnQxST1kKk6dsnBhIvO+7flzuZkNfAYiaHYkaHWkzMsk+81eEIkKDsYI7eCcEfJe7FXPmuj8euVlcoIUD6mD5vRmvKj9nAzNBjMLIta2ytqpIpyQxeg/cv/Xgn03S8P2NQ7evgq9+SPrrvCPiStBdtDeSQPytkVALUfV2qgsg3dm8bGalJUDpi1sgdPEc4HPas+wSaMcv4K8JdIPr+O2Wd5WwqToiQNdUwD47HySucxDqZoWkH7QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arPq1+e0prZPzkr0leMrZxiBA3pt6yJJrCc9SuCU7dY=;
 b=xs2gU0LNV5O52L/UBcgNszov6udU4wLWDoUnXkbBp0gwApQ4i7mrtGUy5np/CQQpvC04dgTEKgBpjdH36pU/bjzl9GC93I4BeaZFi/1qeaH4M6NhdXceFTrxVx7VfG74WGbESk9Ge2w3kzJ1BhyyOGy1FnygiQzHp0LcVmdq7KevdkbQWM3yoCW8YQu9PmXfY9Gu2SRpykqUrhpi4WOGTPa05Wm+YgNHqLB0lRClrvzyS/h+z+Sv1Xp3zUWABwBuWqhRiN8KCgVx/PsIUKkE/TPH9X+a65Ay4VYAcb+MPxB1MLHtHlm9GpZe+h3UDM7hDyazCO67JWuapimlSLc0zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 DS0PR11MB7969.namprd11.prod.outlook.com (2603:10b6:8:120::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.18; Tue, 11 Feb 2025 11:33:28 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::3adb:8c97:94da:80]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::3adb:8c97:94da:80%6]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 11:33:28 +0000
To: <buildroot@buildroot.org>
CC: <Nicolas.Ferre@microchip.com>, <Ludovic.Desroches@microchip.com>,
 <Conor.Dooley@microchip.com>, <thomas.petazzoni@bootlin.com>,
 <Valentina.FernandezAlanis@microchip.com>
Thread-Topic: [PATCH v2 1/3] board/beagleboard/beaglev_fire: fix update
 gateware feature
Thread-Index: AQHba+M2Zpg/G+hEOEOt677pKR/czLNCGrEA
Date: Tue, 11 Feb 2025 11:33:27 +0000
Message-ID: <5a6ffcbee85fd4c7efdd72badaf735a6ef36713c.camel@microchip.com>
References: <20250121090513.3375533-1-jamie.gibbons@microchip.com>
 <20250121090513.3375533-2-jamie.gibbons@microchip.com>
In-Reply-To: <20250121090513.3375533-2-jamie.gibbons@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|DS0PR11MB7969:EE_
x-ms-office365-filtering-correlation-id: 4f4ade4e-0500-4d96-4889-08dd4a8fe76a
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Y1lNQVRoQmx0bXZ6RnFHaXVKWStjMmZrUWFMTmgrVm9ER1dML1VQMVFoWjJu?=
 =?utf-8?B?aUtYdUFOc1lqYTY3Vk9aUmlkc1cra1crUGJnNko2Nld0ZExlUkp6bDZ0Z3kw?=
 =?utf-8?B?bDExVk44WnR1M3FYLzdDbWgxd0h0WDRLdFVQYktVNG1qcTluVHE5WUx3K0dy?=
 =?utf-8?B?cEg5eEttdkVuenZyR21qZ0E5aWh5VElNdXdDRk1jL0g0MzZQb08rcm9sbHVv?=
 =?utf-8?B?aDlXZERKVlB4VnlNb2RXSkZ2TkRyT3BuZ1dXV0x0Sm54VWdtR2lSdzR6akxM?=
 =?utf-8?B?bzNubU9zMk14c1dkakRLZkxBR3FYZFEwcXgxZzlGRFFKdEMvdHlYOC93eGJU?=
 =?utf-8?B?MzhjQ3VURlY5SDNaL1g1cThvdGc1VGZRNDM0eGN0ZVdkWS9NcXUzeGZVSDZz?=
 =?utf-8?B?NGhQOG5aOUtkSmRBREd4cmR1SVAvSTNuVWJFU1hPc203N015UzgzRmlCUmoy?=
 =?utf-8?B?eTFXWkVQU3B2N3hna25kTGxBZDk1ckNtbTBKdjJFcGFQcjZvdlBqSE1TTW5P?=
 =?utf-8?B?Vk15cWowRko4QkQ2bVQ2VHRDTyttZ2hQcGJJTDhYRkpwRU5kQ3BLZWxobkl0?=
 =?utf-8?B?aWp5UWpkK3pXd010cm5vT0pvSzEyWEpCOXd5MzJZMU9xWFFvd2FkZUhzcHdT?=
 =?utf-8?B?VHZYL1NOOUE0TEdnWWpHRWtLcU9DZG8zd29zb1ZHUXNDaTlBN1JVMXhnVDA1?=
 =?utf-8?B?ZzF3R1lvVnp1NlNIYmJ0aHBjUFZvUjhqQzQ0NEhvY0FvcHEvK2NpS2tTaFpa?=
 =?utf-8?B?R055RGM3MEFhM3lNaVVjekxPV2Q1bTZlNldSS3NuS0tNdUVwWExLT05IM1A3?=
 =?utf-8?B?b29wdmVsS1Q1ZmdsK3A5ODVEc3dFRmZtSlRVMjh5Wm9jNWdVbWIralhDTzh2?=
 =?utf-8?B?bVBJQmtVMHdxU0pESGZDRjByT2NKdzVmOXZIVFJUdzRYOXFxNjluSGtuajhx?=
 =?utf-8?B?MjVxME5mbnp1ZEFYZWwydzhkN09nSFY1clZrWko4TnhLeTQ5aHl5bGNITHhG?=
 =?utf-8?B?c09Za05nTHhuZyt4cnRPZGJqSzkwTW9WU1BmcEtyMThlL01raXhqdENGcFF2?=
 =?utf-8?B?Q0syc1hCWVRKSUxkSTNHMFpUR05mZjdmN1l5NDdhOS9rT3ZPTElTaFVBVDBK?=
 =?utf-8?B?OFBTVSsySDBVQzZmQjF5ZGhBWUh2cjdScEhDUnZaRlZWUGErMHRlSG4yblR1?=
 =?utf-8?B?VWJ2QmlxZnRMZHowQ2N4bklQY3Y0VFRFY1drWStPem9FK01ReXJwMSt3NlJD?=
 =?utf-8?B?UGxJVk5ENThiR2g1TkY1Rm9oQ0JtVU5CS0s2RWRTRlVmQXpFRVY1alZUTktB?=
 =?utf-8?B?SDFaTHIxZDljZUdUL0VPNlB1OFh5VjROQ0tFMFhXT20xL1pPb00zcFNqbGI5?=
 =?utf-8?B?djE2QVRrdDlzanJHZDQvUXVyczl1T0dVcUozYUZhVjRCNkprNllwcDFnMGg4?=
 =?utf-8?B?WXBYcjZLWXZUdnNqR0UvdENYYmd6SjRFSHdyMWE4SzlqMytWTmlESktOZERs?=
 =?utf-8?B?b2IzcEhkM29LaG1rYitXWGtsWHMySWgxVTZDaVhLS0Ztd0Ixa2dDMXVmUzNQ?=
 =?utf-8?B?TmxGM3BSVlIyTHUrK084YVdJcE41S2U0QXY1ZXF5SDM4bENndHlUOWhxa005?=
 =?utf-8?B?K3lObmpMNXVwNHVkR1J6ZDZVYnphdFpQVVJtSTlpK0gxRTZ1SHJWZ2pRNlBS?=
 =?utf-8?B?Q2Qyb1JyTDlhaGFqKy94VTNaT1E3d2htU1JhUE50eEZkdVpYY0x5RTU1UXRp?=
 =?utf-8?B?TU9jVEd2Vk14N3FkOWJGWTJMUTBQcWROYzBuZm04NkIwRnp6SlhOOUFUbS8y?=
 =?utf-8?B?Z2pSYjB4M1NINjlPaERTTldqb1BUeUQxbkFlWkU5dStFQUNBeXkyNDRISmd4?=
 =?utf-8?B?RkgyRlI0SmJpTFJEZTFXMDlwbGpXRFM1REl4VFhMb1hRSU15RlBWSC9PMzBQ?=
 =?utf-8?Q?Mr7HN9kmrDMtBL4jYQtRiKNVmMM64sH9?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTVkUFpiWDRIRXJzdG5HemVRK0xxTmY1OFFhc0FuWEV4Ym8wNmV4NE52a1BO?=
 =?utf-8?B?MXFVZFo5clg0b0JKM3JtNlA2eHBPcXY4cTA1U25IWXQ3ejlHVXB5OWxyRTgw?=
 =?utf-8?B?bFpYNGZUTHJUaUp1V0xWMDZNUXZaV0xiL1ErSWZTVjVWTnRSbkFQTnNwd0Mz?=
 =?utf-8?B?TFBIMUI1Y0NiYzJpTXJQZ0djMHpJeG10QnFmcFN6UUpoT0N1ZlhNOWtabGpM?=
 =?utf-8?B?UzRZMVAvMjAxd0kxa1JjR1A1MWhUam5kYVRtdFhSWmw1eHF2ZXFUNzEvSHVV?=
 =?utf-8?B?SldCd09Ta0p6QWpRMTZUM0FNNTBpc2J2c0FqOFBBRUM1SlFici90YkhxNTUz?=
 =?utf-8?B?bytIRnM2dTVpanVpZmlYVXdwTVBBYTkweHBLaER0dzN6RFhHbHZVZUlMTnEx?=
 =?utf-8?B?Y1RoQnBxQytxbHNrbzN1TWlRRGZobjdTenVKUk1nU2ovdzZxd0Z3ZlhDMnBt?=
 =?utf-8?B?M0EraTNzS1U1SGh3SzJtR1FyQU82aFhibUlURW5tZjNKendBdGFFSm9sVzZM?=
 =?utf-8?B?SE9rdUh4TmgxR09WN2hHSGM5YldMQlcrdmJESXdsMWk5OTF0cHNlWXZuQndE?=
 =?utf-8?B?VlMzMU9UbGlTSUlzaThIUnJrWEFYRXVjVGVrUHVJU1luYVM5NXpxZ09jRndO?=
 =?utf-8?B?QU9JOVM3endlenNRSkNxVEtaODU3YzRKbHZBU1pLcVh2blZEMlRBNnUvYmI2?=
 =?utf-8?B?WUsvVGo3bWhnVWhKeGV4WHg2YmxpK0FLcWxidEJMczBQUjBqbEYvcXlzQWRE?=
 =?utf-8?B?eFp6UEJMT2FaWHZiTFFFTUh4czZJT21qcURmVGw0VWp5YzlSdi9mVThtY0Zk?=
 =?utf-8?B?SE5hWDZ0czJCaUdUbjZCc1ZaRVExL0ZxWlBEZ3R1S1JjN0tBSW16MkNtRE9H?=
 =?utf-8?B?Wm5XV2dteFRwOFJMNlVIY3ErMENJc1NYa3JEc0F5L0h6RjNxQVdFUDdlaWtQ?=
 =?utf-8?B?V3FYbjZ3N3p0VnpHOW02L2hmM1RLbGpTRFpTYVdGQ1NGdkcxOVBWMytiVTlQ?=
 =?utf-8?B?ZFd1dXdMTUxURUpWUWVFdW9XMGd3SXZvbmd0NzAzNllFT1UyQVcyUmdhTlcy?=
 =?utf-8?B?VVpBRUpYMkQyWkxOWCtTd3Njb0poR2FPd2lLeG5UUDFqc0VLMkpwNmF6NnZZ?=
 =?utf-8?B?RUhEM2VndHhlRndscXhoQTJsdXNwM2cyWExLVjRlaW9SZmNGTEVjdGoxQkhZ?=
 =?utf-8?B?UWtZMkRLSmZ5V1VCVGZlNkxjNlRjaGp2SVA2ZGcvbUlBeUU3dS8zWU54ZlVT?=
 =?utf-8?B?RHJzTVN6Snc5VXZGTzJMdy9KUmhTUWR3MFBjM0h3K1NBZk1NdlROY3ZRTktP?=
 =?utf-8?B?YjFIdWIrOUZCSVZHckV5am1SNUVTRG5CWTJDdTFHTUxxcVp4YlBxYjF0YVpY?=
 =?utf-8?B?djc5b3Q3RHhJMVVtNnZkWnlhM1JuZEZYZWRWQWpXMDByd2drcDQyQW16QzBl?=
 =?utf-8?B?ZWhkd2FsU0haWmF5SXBOeFNZRDBIUXpCcUM5OXNScEVlbFlvUVlyZFc0WC95?=
 =?utf-8?B?N28rMWZGTmg2TXVJdzhUWEJUSWFqaWdCVWFRZXlQdUdsNEJycDBWdExSZFIy?=
 =?utf-8?B?Tll1RXdaeXQ2eW9SWmVoSHNzQkRIUVc4eXdDS1NQREpGNFdtL3ZUYzJiQWQ0?=
 =?utf-8?B?Q0toZHJaTFN3VHNuQUY0bTEzcXhSSjAwU2Jvd0NiLzFUd2xiLy9LMS8yZG9J?=
 =?utf-8?B?QjFUeXEwRWQ5cGcrcHB6Qm5EWmU5eVpqV0ZqVzNYcC9leldBVVBDMUNWN3Ay?=
 =?utf-8?B?a0VOV1Btd1NNZEhSVUsxWnVFbHNUZVRJcmtGMzdEN2JOZlRKRDkrcGl2V0tm?=
 =?utf-8?B?dU9XeWV0eUZLc1BtSy9YMVBMa2JyZXJsbDZoMWc4ZnZtNGtIbU1jUU5XRE5r?=
 =?utf-8?B?WVhSM2tiMEVkd2VjUGthVU1hblJNWmgrYXVJNkFudmsvVE1TNkw3dVNoaEE2?=
 =?utf-8?B?RDFWRDNOY2VKL3hPTEN0K0hjOS9wZlhHa1NJSDNjMElEOGNUMklDRTJBUnFW?=
 =?utf-8?B?UTZxc0hUSmF6QmxJbGNva3p5aG5XY1UrTnVaTVI1aVRlOTY3d1FnREJOVmxV?=
 =?utf-8?B?ZXNveStscm02L2pHSWtVNHQrUkEyazEwUklTQWJlMGhKVklkTE1DUXZLeEtt?=
 =?utf-8?B?ZHA1WmV0WHREd0QrYW4xd3dGbWlvRTdKaEc0NE95QkdCYUNqZTdqL2Uycjlt?=
 =?utf-8?B?SVE9PQ==?=
Content-ID: <26755798385F7D4692F16864E9A71FCA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4ade4e-0500-4d96-4889-08dd4a8fe76a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 11:33:27.9232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /LsGQ/NqmKdgEreZCP6tv8+HrzwJUj7s9bPXxq6yi3CBgZTt8wn+8oIjO8MReS+tu1SoVQfMmZh8/oQ60x+5DGGvYShFeL6PdDMFMg74/GU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7969
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchip.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arPq1+e0prZPzkr0leMrZxiBA3pt6yJJrCc9SuCU7dY=;
 b=GWr4Pb9eyRL8xtXgvpazCl0FvoBqhm/pwfN2qsZw1y7DBabY4fmDxKb3RVjTpK2iEh7FA6e91I8iOVJ0ba9VEGt0/l/ShQXVKPihWIn+sQEIqWjNj7oW/DRvx50wSmJmzFOOhW8Ahfkh/iYX/QUX81OAY0bYBGGxUr+DTrF/h6NKjKpqOTKzIYoGbMuFMsv0MYfINaAfpr2Qhyq/ZHULomXGu8HRhWf9f+OUcp3XGK3CYaC5r1NZqkRkLoyswVVFmFhtB7wvtesytD2ObdM//Fy0H0mswV7jbEk6pkKCU+7ysR0VVBAzyc0pv/TBZrZ/9vXKpuQ+1e4SaITLV2WcZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=selector1 header.b=GWr4Pb9e
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH v2 1/3] board/beagleboard/beaglev_fire: fix
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

T24gVHVlLCAyMDI1LTAxLTIxIGF0IDA5OjA1ICswMDAwLCBKYW1pZSBHaWJib25zIHdyb3RlOg0K
PiBGb2xsb3dpbmcgdGhlIGFkZGl0aW9uIG9mIHRoZSBmaXJtd2FyZSB1cGxvYWQgQVBJIGluIGxp
bnV4IHY2LjYsDQo+IHVzaW5nDQo+IGRlYnVnZnMgZm9yIGZpcm13YXJlIHVwZGF0aW5nIGhhcyBi
ZWVuIHJlbW92ZWQuIFVwZGF0ZSB0aGUNCj4gdXBkYXRlLWdhdGV3YXJlIHNjcmlwdCB0byB1c2Ug
dGhlIGZpcm13YXJlIHVwbG9hZCBBUEkgd2l0aCBzeXNmcyBhbmQNCj4gZW5hYmxlIGFwcGx5aW5n
IHRoZSBvdmVybGF5cyBkdXJpbmcgYm9vdC4NCj4gVGhlIGZ3X3VwbG9hZCBpbnRlcmZhY2UgY2Fu
IGRldGVjdCB3aGVuIHRoZXJlIGlzIGFuIG92ZXJsYXkgZmlsZSBhbmQNCj4gd2lsbCB3cml0ZSBp
dCBjb3JyZWN0bHkuIFVzZSB0aGlzIGZ1bmN0aW9uYWxpdHkgdG8gd3JpdGUgdGhlIG92ZXJsYXkN
Cj4gZmlsZSBhbmQgcmVtb3ZlIGRkIGNvbW1hbmQgcmVsYXRlZCBjb2RlLg0KPiANCj4gUmV2aWV3
ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+IFNpZ25l
ZC1vZmYtYnk6IEphbWllIEdpYmJvbnMgPGphbWllLmdpYmJvbnNAbWljcm9jaGlwLmNvbT4NCj4g
LS0tDQo+IMKgYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xldl9maXJlL2Jvb3QuY21kwqDCoMKgwqDC
oMKgIHzCoCAxICsNCj4gwqAuLi4vdXNyL3NoYXJlL21pY3JvY2hpcC91cGRhdGUtZ2F0ZXdhcmUu
c2jCoMKgwqAgfCA1MSArKysrKysrKysrKysrKy0tLQ0KPiAtLQ0KPiDCoDIgZmlsZXMgY2hhbmdl
ZCwgNDAgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+IMKgbW9kZSBjaGFuZ2UgMTAw
NjQ0ID0+IDEwMDc1NSBib2FyZC9iZWFnbGVib2FyZC9iZWFnbGV2X2ZpcmUvcm9vdGZzLQ0KPiBv
dmVybGF5L3Vzci9zaGFyZS9taWNyb2NoaXAvdXBkYXRlLWdhdGV3YXJlLnNoDQo+IA0KSGkgYWxs
LA0KDQpHZW50bGUgcmVtaW5kZXIgYXMgSSBhbSBzdGlsbCBhd2FpdGluZyBhbnkgcmVzcG9uc2Ug
b24gdGhpcyBzZXJpZXMuIEl0DQppcyBhbG1vc3QgNCBtb250aHMgb2xkLiBXaXRoIHVwZGF0ZXMg
bWFkZSB0byBzb3VyY2UsIHdoYXQgaXMgY3VycmVudGx5DQppbiB0aGUgQnVpbGRyb290IHJlcG9z
aXRvcnkgZG9lc24ndCB3b3JrIHNvIHRoaXMgaXMgYSByZXF1aXJlZCBmaXguIEFueQ0KZmVlZGJh
Y2s/IEFueSBjaGFuZ2VzIG5lZWRlZD8gQW55dGhpbmcgaG9sZGluZyB0aGlzIGJhY2sgZnJvbSBi
ZWluZw0KYXBwbGllZD8NCg0KTG9va2luZyBmb3J3YXJkIHRvIGEgcmVzcG9uc2UuDQoNClRoYW5r
cyBhZ2FpbiwNCkphbWllDQo+IGRpZmYgLS1naXQgYS9ib2FyZC9iZWFnbGVib2FyZC9iZWFnbGV2
X2ZpcmUvYm9vdC5jbWQNCj4gYi9ib2FyZC9iZWFnbGVib2FyZC9iZWFnbGV2X2ZpcmUvYm9vdC5j
bWQNCj4gaW5kZXggMDVmNDg1OGJhYy4uMTQwMjQ1OGQ4YiAxMDA2NDQNCj4gLS0tIGEvYm9hcmQv
YmVhZ2xlYm9hcmQvYmVhZ2xldl9maXJlL2Jvb3QuY21kDQo+ICsrKyBiL2JvYXJkL2JlYWdsZWJv
YXJkL2JlYWdsZXZfZmlyZS9ib290LmNtZA0KPiBAQCAtMTIsNCArMTIsNSBAQCBib290bSBsb2Fk
b3MgJHtzY3JpcHRhZGRyfTsNCj4gwqBib290bSByYW1kaXNrOw0KPiDCoGJvb3RtIHByZXA7DQo+
IMKgZmR0IHNldCAvc29jL2V0aGVybmV0QDIwMTEwMDAwIG1hYy1hZGRyZXNzICR7YmVhZ2xldmZp
cmVfbWFjX2FkZHIwfTsNCj4gK3J1biBkZXNpZ25fb3ZlcmxheXM7DQo+IMKgYm9vdG0gZ287DQo+
IGRpZmYgLS1naXQgYS9ib2FyZC9iZWFnbGVib2FyZC9iZWFnbGV2X2ZpcmUvcm9vdGZzLQ0KPiBv
dmVybGF5L3Vzci9zaGFyZS9taWNyb2NoaXAvdXBkYXRlLWdhdGV3YXJlLnNoDQo+IGIvYm9hcmQv
YmVhZ2xlYm9hcmQvYmVhZ2xldl9maXJlL3Jvb3Rmcy0NCj4gb3ZlcmxheS91c3Ivc2hhcmUvbWlj
cm9jaGlwL3VwZGF0ZS1nYXRld2FyZS5zaA0KPiBvbGQgbW9kZSAxMDA2NDQNCj4gbmV3IG1vZGUg
MTAwNzU1DQo+IGluZGV4IGY0NTUwMzdiNjAuLjI0OWM1YmQyNjANCj4gLS0tIGEvYm9hcmQvYmVh
Z2xlYm9hcmQvYmVhZ2xldl9maXJlL3Jvb3Rmcy0NCj4gb3ZlcmxheS91c3Ivc2hhcmUvbWljcm9j
aGlwL3VwZGF0ZS1nYXRld2FyZS5zaA0KPiArKysgYi9ib2FyZC9iZWFnbGVib2FyZC9iZWFnbGV2
X2ZpcmUvcm9vdGZzLQ0KPiBvdmVybGF5L3Vzci9zaGFyZS9taWNyb2NoaXAvdXBkYXRlLWdhdGV3
YXJlLnNoDQo+IEBAIC0xMywyMCArMTMsNDcgQEAgZmkNCj4gwqBjcCAiJDEiL21wZnNfZHRiby5z
cGkgL2xpYi9maXJtd2FyZS9tcGZzX2R0Ym8uc3BpDQo+IMKgY3AgIiQxIi9tcGZzX2JpdHN0cmVh
bS5zcGkgL2xpYi9maXJtd2FyZS9tcGZzX2JpdHN0cmVhbS5zcGkNCj4gwqANCj4gLW1vdW50IC10
IGRlYnVnZnMgbm9uZSAvc3lzL2tlcm5lbC9kZWJ1Zw0KPiAtDQo+IMKgIyBUcmFzaCBleGlzdGlu
ZyBkZXZpY2UgdHJlZSBvdmVybGF5IGluIGNhc2UgdGhlIHJlc3Qgb2YgdGhlIHByb2Nlc3MNCj4g
ZmFpbHM6DQo+IC1mbGFzaF9lcmFzZSAvZGV2L210ZDAgMCAxMDI0DQo+ICtmbGFzaF9lcmFzZSAv
ZGV2L210ZDAgMCAxNg0KPiDCoA0KPiAtIyAjIFdyaXRlIGRldmljZSB0cmVlIG92ZXJsYXkNCj4g
LWRkIGlmPS9saWIvZmlybXdhcmUvbXBmc19kdGJvLnNwaSBvZj0vZGV2L210ZDAgc2Vlaz0xMDI0
DQo+ICsjIEluaXRpYXRlIEZQR0EgdXBkYXRlIGZvciBkdGJvDQo+ICtlY2hvIDEgPiAvc3lzL2Ns
YXNzL2Zpcm13YXJlL21wZnMtYXV0by11cGRhdGUvbG9hZGluZw0KPiDCoA0KPiAtIyBGYWtlIHRo
ZSBwcmVzZW5jZSBvZiBhIGdvbGRlbiBpbWFnZSBmb3Igbm93Lg0KPiAtZGQgaWY9L2Rldi96ZXJv
IG9mPS9kZXYvbXRkMCBjb3VudD00IGJzPTENCj4gKyMgV3JpdGUgZGV2aWNlIHRyZWUgb3Zlcmxh
eQ0KPiArY2F0IC9saWIvZmlybXdhcmUvbXBmc19kdGJvLnNwaSA+IC9zeXMvY2xhc3MvZmlybXdh
cmUvbXBmcy1hdXRvLQ0KPiB1cGRhdGUvZGF0YQ0KPiArDQo+ICsjIFNpZ25hbCBjb21wbGV0aW9u
IGZvciBkdGJvIGxvYWQNCj4gK2VjaG8gMCA+IC9zeXMvY2xhc3MvZmlybXdhcmUvbXBmcy1hdXRv
LXVwZGF0ZS9sb2FkaW5nDQo+IMKgDQo+IC0jIEluaXRpYXRlIEZQR0EgdXBkYXRlLg0KPiAtZWNo
byAxID4gL3N5cy9rZXJuZWwvZGVidWcvZnBnYS9taWNyb2NoaXBfZXhlY191cGRhdGUNCj4gK3do
aWxlIFsgIiQoY2F0IC9zeXMvY2xhc3MvZmlybXdhcmUvbXBmcy1hdXRvLXVwZGF0ZS9zdGF0dXMp
IiAhPQ0KPiAiaWRsZSIgXTsgZG8NCj4gK8KgwqDCoCAjIERvIG5vdGhpbmcsIGp1c3Qga2VlcCBj
aGVja2luZw0KPiArwqDCoMKgIHNsZWVwIDENCj4gK2RvbmUNCj4gwqANCj4gLSMgUmVib290IExp
bnV4IGZvciB0aGUgZ2F0ZXdhcmUgdXBkYXRlIHRvIHRha2UgZWZmZWN0Lg0KPiAtIyBGUEdBIHJl
cHJvZ3JhbW1pbmcgdGFrZXMgcGxhY2VzIGJldHdlZW4gTGludXggc2h1dC1kb3duIGFuZCBIU1MN
Cj4gcmVzdGFydGluZyB0aGUgYm9hcmQuDQo+IC1yZWJvb3QNCj4gKyMgRmFrZSB0aGUgcHJlc2Vu
Y2Ugb2YgYSBnb2xkZW4gaW1hZ2UgZm9yIG5vdy4NCj4gK2RkIGlmPS9kZXYvemVybyBvZj0vZGV2
L210ZDAgY291bnQ9MSBicz00DQo+ICsNCj4gKyMgSW5pdGlhdGUgRlBHQSB1cGRhdGUgZm9yIGJp
dHN0cmVhbQ0KPiArZWNobyAxID4gL3N5cy9jbGFzcy9maXJtd2FyZS9tcGZzLWF1dG8tdXBkYXRl
L2xvYWRpbmcNCj4gKw0KPiArIyBXcml0ZSB0aGUgZmlybXdhcmUgaW1hZ2UgdG8gdGhlIGRhdGEg
c3lzZnMgZmlsZQ0KPiArY2F0IC9saWIvZmlybXdhcmUvbXBmc19iaXRzdHJlYW0uc3BpID4gL3N5
cy9jbGFzcy9maXJtd2FyZS9tcGZzLQ0KPiBhdXRvLXVwZGF0ZS9kYXRhDQo+ICsNCj4gKyMgU2ln
bmFsIGNvbXBsZXRpb24gZm9yIGJpdHN0cmVhbSBsb2FkDQo+ICtlY2hvIDAgPiAvc3lzL2NsYXNz
L2Zpcm13YXJlL21wZnMtYXV0by11cGRhdGUvbG9hZGluZw0KPiArDQo+ICt3aGlsZSBbICIkKGNh
dCAvc3lzL2NsYXNzL2Zpcm13YXJlL21wZnMtYXV0by11cGRhdGUvc3RhdHVzKSIgIT0NCj4gImlk
bGUiIF07IGRvDQo+ICvCoMKgwqAgIyBEbyBub3RoaW5nLCBqdXN0IGtlZXAgY2hlY2tpbmcNCj4g
K8KgwqDCoCBzbGVlcCAxDQo+ICtkb25lDQo+ICsNCj4gKyMgV2hlbiB0aGUgc3RhdHVzIGlzICdp
ZGxlJyBhbmQgbm8gZXJyb3IgaGFzIG9jY3VyZWQsIHJlYm9vdCB0aGUNCj4gc3lzdGVtIGZvcg0K
PiArIyB0aGUgZ2F0ZXdhcmUgdXBkYXRlIHRvIHRha2UgZWZmZWN0LiBGUEdBIHJlcHJvZ3JhbW1p
bmcgdGFrZXMNCj4gcGxhY2VzIGJldHdlZW4NCj4gKyMgTGludXggc2h1dC1kb3duIGFuZCBIU1Mg
cmVzdGFydGluZyB0aGUgYm9hcmQuDQo+ICtpZiBbICIkKGNhdCAvc3lzL2NsYXNzL2Zpcm13YXJl
L21wZnMtYXV0by11cGRhdGUvZXJyb3IpIiA9ICIiIF07DQo+IHRoZW4NCj4gK8KgwqDCoCBlY2hv
ICJGUEdBIHVwZGF0ZSByZWFkeS4gUmVib290aW5nLiINCj4gK8KgwqDCoCByZWJvb3QNCj4gK2Vs
c2UNCj4gK8KgwqDCoCBlY2hvICJGUEdBIHVwZGF0ZSBmYWlsZWQgd2l0aCBzdGF0dXM6ICQoY2F0
DQo+IC9zeXMvY2xhc3MvZmlybXdhcmUvbXBmcy1hdXRvLXVwZGF0ZS9lcnJvcikiDQo+ICvCoMKg
wqAgZXhpdCAxDQo+ICtmaQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
