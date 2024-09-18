Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB28CDD55D
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 22:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B94AD84367;
	Wed, 18 Sep 2024 22:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5mM84yMdKf34; Wed, 18 Sep 2024 22:19:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B87B184396
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B87B184396;
	Wed, 18 Sep 2024 22:19:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B36A1BF352
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 22:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4760C42732
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 22:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0JeYJWbUCgbQ for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 22:19:54 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::725;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neilw@tungstencollaborative.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 05EEE42727
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05EEE42727
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20725.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::725])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05EEE42727
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 22:19:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byAThgDSU8HqZpWubejupyAWvpDhKhiDd92R92+JgYCEUecML7OiarrHuVFYpxDJzWvnQtKVlUH3F83B1jp5tXP+WSrehPDJ0C2yOtbddTacB3xSUXvHYNB7WqXCV3sHZiHxvDDEtQiSNui73MZythaNzOcRcIZZtV9vbsllgKnJ2MItYfZSEdKWJtMpIAEybd0Zej3yj7I0lsgZ1PX/oSajfUUSYxUX+tkOJpBw0AX3MXU5dtE6sIJmvys9SEk6ubXmkc36kGN8a1sSLPZC5eis5rFmIYpMGiPRuItLi2NHnOlTd+biq14CBmLNLglqH/I3RmT/s78NiQ6dTEo7jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/0dVXldo+Mw8mmYT3aT2NeezEAy2fVopnF44L4PPSo=;
 b=dAPgIGL7ki7gfFBDPtKIZULkJ/TfeUOucdHyRBgyYJTrWC91ddCKhUPcAZXst6Snk9tbMgvb8Kb9BOT0X6pERvsJjPcEN9dNze4qEJ2iFOX/CM+gdK+s0TlRm3mht0/GJtDirwJK1bSobQtasdNp0iNXe39uYOifDtvyQqdnV+ZidFboTRJhNoEEOjkVShgdG87Ur2QoOo8m6GCAX7bnv70Xbvc78KP/7SQbVZdAzC+u/RJSKvg7164UFzECoLeb/V1FfN8WqrBUO5VzHZMh9urtqjzOMPg66mC9qH/uPAo2KaSPZ/seKMgwh5ZWJF0b7QlRiyqdwOKNs9z4PIlgwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tungstencollaborative.com; dmarc=pass action=none
 header.from=tungstencollaborative.com; dkim=pass
 header.d=tungstencollaborative.com; arc=none
Received: from DM6PR10MB2619.namprd10.prod.outlook.com (2603:10b6:5:aa::23) by
 DS7PR10MB5949.namprd10.prod.outlook.com (2603:10b6:8:86::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.11; Wed, 18 Sep 2024 22:19:49 +0000
Received: from DM6PR10MB2619.namprd10.prod.outlook.com
 ([fe80::9ff6:58d9:2a0e:cd52]) by DM6PR10MB2619.namprd10.prod.outlook.com
 ([fe80::9ff6:58d9:2a0e:cd52%3]) with mapi id 15.20.7982.012; Wed, 18 Sep 2024
 22:19:49 +0000
From: Neil Webster <neilw@tungstencollaborative.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Variscite Dart
Thread-Index: AQHbChjf4UcZ61Uek0WeavZApfyJbQ==
Date: Wed, 18 Sep 2024 22:19:48 +0000
Message-ID: <bf3a752a-6954-44dc-b805-c7850be85539@tungstencollaborative.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR10MB2619:EE_|DS7PR10MB5949:EE_
x-ms-office365-filtering-correlation-id: b4a87dc6-a341-4825-31bf-08dcd830025c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WmtqU2VReEoxTmowczNLTjZvWVNETzBxZXdjRE9MQWwwcnpUYi9JbkxGQ3Zm?=
 =?utf-8?B?R3Nqa2h3S3NUUnR4UGhPK0c1cjlxQVh5VDFycUptM3JIeVNLak9OeHI2WURz?=
 =?utf-8?B?VStLc0pWY2NrMGFtZVlKdUI3bVJkT2dXUFo0aGI2a0x6alRFMmE2WGVETFFy?=
 =?utf-8?B?SFVZUlBiUld5OE9Nb2NNSC9IRlEzaUFrTnhkVkpyTll6ZDZYeEVYMk1Jdkk1?=
 =?utf-8?B?OEQ2Y3djM21oRGt1cVVsYWdZM2h5bTUzbnpFaHJ1R3d2QWp3RFVFNkdQcnNN?=
 =?utf-8?B?ZzZjL1dUcElxcjBkdFU2K215M1ZRWDZ1S0dSMFZjbGgwSW4xaG1jK05vUDB1?=
 =?utf-8?B?SXg3Qld1UUhTK05hd1ZBYjkzU09BMWpxamFDV0duc3ZBOXlzc2N3ZmlaeUJD?=
 =?utf-8?B?bG00cXRwU0FtZVk4N3FKTEh1RmZYU21IVTZFWEliblNnSjJ3SFd2MXIvQVlu?=
 =?utf-8?B?am1vbjVsM2R6WGRuYXFsdk5xeDZkaE4ydEN5UHYvTFdsa2pIWFBMTWNzK2Ux?=
 =?utf-8?B?UmkyQjdyQWhmbWkzSTlMeFhFTy9Hc1VIcXN0azU0eXBBSkpjUmxiT2RpSThk?=
 =?utf-8?B?M3lUbXBmRndtWW80MVpGR3RpYklnZ2FBeHBPTEdDTHdUVy9KWXl4ZUVlcVFV?=
 =?utf-8?B?c0crOTlMRU1ydXU0SVhGM0ZBMFBDNFY4T0lJWFg4MERJRGQ1Sk0rZUZrMnl2?=
 =?utf-8?B?ZFZhRGNmVk9lcGtPaU4vbkhTRi9Ya3hzeGFldWN6L1F3djRPaVVqbU91cVJO?=
 =?utf-8?B?VjcrSDZ3clNWTVlQSTNrTksrSE9qclVVYUpkVzVTaDdheDdCSVc3amgwVUhZ?=
 =?utf-8?B?NmZ1d3lRMUh1Znh1KzFIRjJYc0pQMHhTNDlxMzZ6TGxaU0xsWlc3c3o0ZFdi?=
 =?utf-8?B?ajVTOFJKVEZFOWdla05VUVZsdGZRcEw0d1ZLOHJNcTFBMDNjZmNQcERCNEtC?=
 =?utf-8?B?MTdTU0I3V3V3OEYxdEZYQmhZek9GSHVmcnV0bGt6RjBDdEx0cmZkUDU4bWxO?=
 =?utf-8?B?bDRrQ0wyQTVxdnk0Nk50UkhFc2ljcVRmZ1lmZ21vRWgxVTVyS05rR3UxbS9Z?=
 =?utf-8?B?OFV4OEVtMlpBVVBGUXhQazBYY2YxTjlMTjRTaUdRZkczLzFyL2hCOUVSQmxP?=
 =?utf-8?B?WFlsUkNHRVFwRWVsbnhaM1FBRVhUaEVnOVJSTk1VRnR5OTIycDN3bEo5N3hT?=
 =?utf-8?B?aDMyVzNrNGJSS0htSTkvQVpJRC9oTzF0LzJIVDkxcGNnNXgrVWxiU2VXWG0x?=
 =?utf-8?B?WWZvRVpCVThEQUNreWtwTTlkcE1Wd1F5MFpKZW1DaGZESjRYNjVJYVc1dTlV?=
 =?utf-8?B?dWtpM0xyL3Jaa0ZSM0hpblg2SzlBYTlPSk4rVVdNWFNtVnB6Qk5zNFVvTEMv?=
 =?utf-8?B?REdwTkVnMVpNL2xKVUVKVldlS0NDbCtOZC81N2ZIRGRSNFdPZ0V1YmZxM1FJ?=
 =?utf-8?B?V0lsMGl2bUs2RVFMYlIvTnJleEZMNGdXL1FIT0FaOUk3Y1NFNEhxcEo0SWFj?=
 =?utf-8?B?WVN5d2thbkFsVHl0T3UxL240c0lEcDZ3UUZuMW5DNjJUZVdMcTdIZDljSUYv?=
 =?utf-8?B?UlhwV0ZUUHQzZ25XbXF4bWVYZXV3WWltcktuZVlNSkN6dTZSd1ZqZDJLWDNk?=
 =?utf-8?B?OUZUbXlIak82blNQRm4rTmh0T1RFL2o0Q0t3K0tjNUFjUmh3QStFcERCMDAx?=
 =?utf-8?B?R0lzTGgxK1phTGUzcFZwVnlaMXhGMERhMGx4R3hweUViN1ZEellsc1ZBRWw5?=
 =?utf-8?B?TVZjMXk1RFJTdU9ockp6QW5qc0Y2RUNCVTVmcDB3aEFzcDRXK004eXZYcTdl?=
 =?utf-8?Q?mOYcM2blDtiZyxYJgMc2qCMAYiisUlHDxfe08=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2619.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dWhrWkVTNld4ajJ4NGpmeDh3OTE3cTM2ZjFnbzBzL2ZQbjVZbUh6bnArejdq?=
 =?utf-8?B?M0xGTEJwM0VaWmhOWURISS94UVJzUDZ5aVVEd053a3YxTXdvaFhXTk1oRnlK?=
 =?utf-8?B?WUtISGx3QWxxcnB1Z1lmWGI1TGEzTEt6eVNJMzNwaFFKYUlSZFdhVkZyQnYv?=
 =?utf-8?B?VDVyQlZiY0oxS0tEWWlhaDRPbVNQbzNWL21XZll6SWZCcWpTNjMwYTJyTFVV?=
 =?utf-8?B?d1prM2RlSmpMSDYxeUljZEg2SlpaSEczMkVyVDJwQjMxZTRrTTdFaGg2OVFs?=
 =?utf-8?B?dTIxWlc1WStnUXdrSjJaeDNHQ3gyeFN3eStIK1pHMVh2VVpLSzNvY0dUUlhU?=
 =?utf-8?B?a2YzUk5vZFlKanpxUStaRlFxVDMxRjI1bUJHZ3M0UysxMEUxRjhIOFgyM1lU?=
 =?utf-8?B?RVlYWWpUdTlzMnRWa0RPUDEyREJhNEVacjk2ajFEcDAwSjEvcXBxNkZBRnVQ?=
 =?utf-8?B?eG8xbkx2TTY0SUQrNTliQXNDc0QrMVFXK3k5T2JmeHBub1kxaUR4MHlBMXoz?=
 =?utf-8?B?V1R0M2Z5Vks5QXJLWXdodThycy9JbmxuaGlkcEZ4RGUzK29SL2lvUDFxMlYv?=
 =?utf-8?B?cTRDM3BkblltZEcrRDYraHRTc2tFN2xkS1p3MUNyMlgwTWJBbXRnRzVoMGRX?=
 =?utf-8?B?MzhCZkczTmVEYkhGNWVMamIvTHpwUno1WThzZHBSOGZBL0s1cFBrV2QwT0tx?=
 =?utf-8?B?N2tvZHh5VExVQ2Y4S1MwaHlaQ0gxZUYzcFdBa2lBbzB2blpaL3VwcktIV0N0?=
 =?utf-8?B?Rjh0aFVVUVBuZ2lFZDdudFJUVi9pZThncjNDajlGMmJCaHVtVFU4ZU5TRWRi?=
 =?utf-8?B?Ukx5VmR5SGp5WnY2am1jRkFqd2M2ZnlicTJ5SFNiMDk4clZpWU5VZ2taT2hs?=
 =?utf-8?B?T3ZlWDc0WXZVUDBEdzl1aENyekZWdk1hRlFJM0lab3kvb3Vwekl0S2RVRzVF?=
 =?utf-8?B?UVZQMEJ3ZHpjVXZWNjl0VDZUWit0Q3pVT050S1ZoTDNCYlNkQzMrK0ZjRnNq?=
 =?utf-8?B?dTNLZS91SWk0Q0tHYWxxQ2d5eC9TM1RGdkVEMmllcytWVXhrZDI0NXVFL2pq?=
 =?utf-8?B?cjlIMXV6UzdhWHZvSmdtRFRqSEYwSVFlVFlqK0xhWmRWOFVHYUUxZUZLNnZS?=
 =?utf-8?B?NnRlMkF1dm9OYVNneXpKcmRlc1FGOFI1dHM1YWUzMWVYVEhwS2E3U3dkNGkx?=
 =?utf-8?B?VHZud0d2VS9lUEJkNEpkWEVhUlRUUU5wRVp1MFpReXBXYkNRUmwxVmdUSWNn?=
 =?utf-8?B?Mit5TDRjREVOZUJ5TDFnMHhLU3gvd2dmenRkQnFHSEp6SndjT2x6bUkxYXlM?=
 =?utf-8?B?YVdjbDlpMjQrNU1IWVRzQyt5TnNEWjNmbVgramR1a3JVeFcyTDAzSExKSkRr?=
 =?utf-8?B?ZjN0Z3FHQVFYUXBlVGZyU254K1hSeTF5SnFIV0xYTEMyK3kvMGlBaU1Mbnk3?=
 =?utf-8?B?K284eVluKzhjWkpYb0pyTUg5QzkxWEFZLy82YmQyV0lxU2JDM045ZVliR016?=
 =?utf-8?B?R1J6elZhL1VDbE9Kd1MrQldkbVJreUpQNE5WK0puKzFrSjQ0K2lWWUhVVWFS?=
 =?utf-8?B?LzRkRnJxSkcrN2YvTFozWjFBeXVPSmw3bWkrV0t3RExDNWFYdkpBd0ZRd2dH?=
 =?utf-8?B?ZHlZZ3kvRTUzdWpkdlJVclFYQTZBcUVwS0VhVzhKYWZVUjB5ajdxdjVLejEy?=
 =?utf-8?B?dXFMa2UrUjZORzVJOTltMkp3QkRwdGs0MlFEVm4rN1M3SWZLSlFLUDFLMUo2?=
 =?utf-8?B?ZVZqVy96QTJxR25Ha280d0s5YW1EVUFRc2h3c2Myd1V2R2kzODYxZW1WUFV4?=
 =?utf-8?B?a3JkRC8wdG1QYjM1Y0F0Zmd1amNJNklJVUg5S216MENRcmwyRHJ3end6WS9k?=
 =?utf-8?B?V29KNTRwbTlDWVdpZDJvZWloYVp4U01YS3IrM0hxclRyM3NUbDhxQzNHaDM3?=
 =?utf-8?B?Qjl3bmE3Z1lpQWZvZVZTeE5PRktCbndNa3g4WEU4Rk1UOGgvZjZhdmhaekJp?=
 =?utf-8?B?MXNMemtoQWpPV3NQZWxTa2RHWnMwQTkxemlWV2k2TDg0TGo5TE5PZGZnSXpz?=
 =?utf-8?B?V0hVT0tzMStpeWkzZjVhOG1OSU1PM1VOaWJHaEE4M0NHUnJNUkMyQjhsK0lB?=
 =?utf-8?B?YWd5bU14VWpqaUhPZU0wMkMyQzJmaEdPbzBwZ1UyZXVycThDYTNwWlhEb3hv?=
 =?utf-8?B?WlE9PQ==?=
Content-ID: <F10F196E8B6000499B53973675DCD0F6@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: tungstencollaborative.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2619.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a87dc6-a341-4825-31bf-08dcd830025c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 22:19:48.8953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a087e2e8-b1d2-42d4-a7b4-7bb41022e8ef
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgujM8HeU8E9TmHmoOiYyCwhoZyDb0+BiJKKzC0RIK5aravSsxsh5NvQMynm4/JH5VZ7yGcyvjCqSdcb31r1/6uYFS461uk4rk2bmf9QWFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5949
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tungstencollaborative.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/0dVXldo+Mw8mmYT3aT2NeezEAy2fVopnF44L4PPSo=;
 b=1GVhW0VMV8+0F1DnrRikrKbYwo47MA5UjJn/nZ3qi54I4qmYyYOnAo9QjCCV/TK9E+8pMCknxeebF+oTFo/H1eb2bhoupaPFkAKi0ZDyq8jnOicgHZeKMaaQKt6ebTgLkU6berdUPuvO2AN/Vs32MWybXrjWQ1/Q4DtTQjUpEhisXBBenF7e5SQIjtiuTFVnoGXibJYyEheP6XbIZpcqygTW/XtwNkELrrPuQ/jrnaMIgXXym//3WmfZKrV281pvaiZTZqhE15HWYN898RS7SPIr52ahePrN34vjBxP3OkNnLVEtLI0aYNVd7a1ItHx9M7Dflqfs/gmyALTCPQoD9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=tungstencollaborative.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tungstencollaborative.com
 header.i=@tungstencollaborative.com header.a=rsa-sha256 header.s=selector1
 header.b=1GVhW0VM
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tungstencollaborative.com;
Subject: [Buildroot] Variscite Dart
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I am new to Buildroot and have been struggling for a couple of days with 
something and wondering if I could get some pointers. Please let me know 
if this is not the appropriate place to post such questions.

I want to get an embedded Linux image running on a Variscite Dart Mini 
(link below)

https://www.variscite.com/product/system-on-module-som/cortex-a53-krait/dart-mx8m-mini-nxp-i-mx8m-mini/

I have the SOM connected to a dev kit referenced in the same link above.

I wanted to use the opportunity to get familiar with Buildroot but sadly 
Variscite do not support Buildroot and instead they steered me towards 
Yocto.

I have been able to get an image running with Yocto following their 
recipes but I found the whole process to be obscure and opaque and I am 
therefore back to my original objective of using Buildroot.

I have been able to follow the tutorials and get a build working on a 
Raspberry Pi.

However, as mentioned above there is no support available from Variscite 
and there is no specific defconfig for my hardware, so I tried to start 
with freescale_imx8mmevk_defconfig as this seems to be close with what 
appear to be correct settings under the "target options" menu.

However I am not getting anything at the console.

I noticed that the freescale_imx8mmevk_defconfig sets the getty TTY port 
to ttymxc1, so I tried changing this to ttymxc0 as that is the port 
mapped to the debug interface on the development board. Still nothing at 
the console.

I tried changing the init system from busybox to systemd. Still nothing.

I feel like I am poking around in the dark. Any thoughts on what I 
should try next?

Regards, Neil

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
