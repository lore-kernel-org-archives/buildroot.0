Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555A1C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 17:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFF9140C5F;
	Thu, 15 Aug 2024 17:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQKFPIPI-BGC; Thu, 15 Aug 2024 17:44:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF9F540C67
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF9F540C67;
	Thu, 15 Aug 2024 17:44:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6ACEB1BF475
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 17:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 593C060AC6
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 17:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id buRRDricq1iG for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 17:44:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::60f;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B6F760590
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B6F760590
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::60f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B6F760590
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 17:44:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uY8vCCIOtHThdueGe/HtzobSlTiaHQwXJsA6p7zHqEkQ3BSvZx09hmrZT2fqS5u40JXCKWam3gbAO9ci5NNhwZVIyrbcdLMMlBW06q04WBbfY9iIWraaaR6tZAes0bi2QRPsQKtigsbAKEWwl5kd9kGeVDqM+gCztUZ/VPTv5mW4QL09wi//oDFKhtC2Nk1WRfqeNCiogH3eXaMnzk78Ss48qnmPaybhEhQBJJnC6N9+ku3vX/HOHWktNZusX429BsMrAfOATb/eIrqyqfSrHhqYDuaDFwOSbOoaxwMktCrNjLRYiv0hRal1trS8wxTM+ppBLtxfX0KgeRwEWy/lWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOqqiGFGGKx0Y6XhSGPn7jzGHuThJcGfrxxpy55T1r0=;
 b=O3/nEMMKlUTov2s8rUwtoLjhMtRw5r57CZhUirmI/f/naUKfLNl1QdNGuix68QMUmpovaIy1H595Fhyuil0PZWS6ZPzEHDNwlD1/ZVkgqZnie7Qlfiq5LKxH9j/RAUmiPpDsm/HZItcgBMhuO+bTiYKycHm8Rjggh86denYuxZhCBA5ZAZDmvHJOKe2yVNqjPTn9O33lIdRVS9E7p3X0AulXWqAaXDAT7b1kasFwJwBeeyuvbGa5/FtOm7YupYtoiL5LYgf1bN7uqFAzg6wh3yDTobR2R3iBGeb5FLxFqW6rZqlWEQUI0REGQCk7sLrtzeUgiTJDB36pq2vyxH8uSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CYYPR12MB8921.namprd12.prod.outlook.com (2603:10b6:930:c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23; Thu, 15 Aug
 2024 17:44:40 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 17:44:40 +0000
To: Brandon Maier <brandon.maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/2] boot/uboot: avoid setting PMUFW_INIT_FILE when not
 used
Thread-Index: AQHa7x6UME8dMrTR+kmz67jWO6jqp7Iolx2g
Date: Thu, 15 Aug 2024 17:44:40 +0000
Message-ID: <CH2PR12MB5004060FCBFDFE57A1B4B9CFF0802@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240815-boot-uboot-clean-for-pmufw-v1-0-3f0d9909c0b4@collins.com>
 <20240815-boot-uboot-clean-for-pmufw-v1-1-3f0d9909c0b4@collins.com>
In-Reply-To: <20240815-boot-uboot-clean-for-pmufw-v1-1-3f0d9909c0b4@collins.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CYYPR12MB8921:EE_
x-ms-office365-filtering-correlation-id: f7488f08-dbbb-4477-d9db-08dcbd51f06c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NVhIOWgvNU9OWU53cHJvOU02OXdvOFRXOTNrMjBWaHlFTnpRTDBuSmQ1N1Fw?=
 =?utf-8?B?ZFZLWThHamRNRFI4eU5jYUtlZnhNdmwxb0x5cDVlWWhBUWR3MG15WlAvQjRP?=
 =?utf-8?B?REhqVWM3T2kvV3BvZStKZXZVdFlIU0YwcGwrTGszSkJZbGJyQ0R5NnJlOE1H?=
 =?utf-8?B?OGU3bCtvK1QyWExZSkdOS1BUSitxNGJUMThVN1Q4bjV3WEpUbVlaOXVkNVdC?=
 =?utf-8?B?NE5GOFFLZWJEcHFWUVhPaCtmZzBOYzFDR2NqNFg0VEEzc01aUnFKekNLMEFz?=
 =?utf-8?B?T2ZlRy9NTWNIN00vckZvUXp3VDAwL3k2MXhVZVMvc01xc2ZXVmIzYjNwQkNS?=
 =?utf-8?B?Z1ZBMmJjZFZjanJNdlVsOWpRUHk3NzJKVEkvdUZNT3FnYVdaMUtrdGxyd2sz?=
 =?utf-8?B?eDNNRzlkUHVMbHR0bEMxYUZ4blcvZlg1OWFlRGxSZExFcm1WcjlPUWxIUG42?=
 =?utf-8?B?RjVUMnRJOEFld0l3Qi9VY1pKcnNFeUlHbStuMjRjbnI1NEF5WG1sVnhnK0da?=
 =?utf-8?B?SUx1L0NzazRYVncrMFdOQWhsR3U0MVFLZU5vcDdoeVY0L0I0TDNQVTlpazNI?=
 =?utf-8?B?VStxTmJxVW9QYWtEeVFoeGNWTTNQV0FVVlZpTk52d294c0NReTMvWU1BQTcr?=
 =?utf-8?B?cHV0T2xwYmNVRFZmN3h1cjczbzRETWY2Z3hTUEl1dUlzZlRNNDNRVUlNekZM?=
 =?utf-8?B?dGh0UzJIRTQrd1pJSlRZeVFHRnVTdWFiLyswWTZVSllTTSt0ZDJtekFIYmtS?=
 =?utf-8?B?cDhxNCtoeUEyY1BaYnpWUWxST1hUNGI3NUtZYWp2OU5Rd1hudHhnY0hFVUNv?=
 =?utf-8?B?YVA2bWwzTGFyTWNjeVhUbENDT3hRNzVONHo4SnRvcDB3Tk1XTzJuOVlEWVox?=
 =?utf-8?B?clFScFM3cGo1M1JxK1kxa2x0dlM1TmRtRzNTaXIxRjNDUHFsbWdjbGM4a0Nv?=
 =?utf-8?B?SVNKVW04ZVVKbWlHWk95WXBYK3hwLzRxYjAzNjh5NWIwcUJpMi9FUUlaL1pt?=
 =?utf-8?B?UGlvK2F1MFdoRFdwRTlIa1BndGFFeHl4S2ZIaCtIVWpGVXNKRDA2bjNRREJL?=
 =?utf-8?B?aW5YQk9zU3pjMFRweFI1T2hVb0xqeTVSMTdBQitzUlI5L3FlaFhtTGhua0U4?=
 =?utf-8?B?VWsxdjBTUHhsWVZaTnRITXN5MnZTYTJnNDh4U0RKVTNqNGgrNHdSYS81bS9X?=
 =?utf-8?B?dDhyd2FxV3I1L0RKVGxyVEtuMnhQWGRzNHJvRmhXeGFUaENqTWtsalkzWm44?=
 =?utf-8?B?YlN0bDJnekh2MnE1ZTdrQm45UGNpK1lqTndGbzZhaHk2bnRJT3lkb3AvMVdv?=
 =?utf-8?B?V2daNlpKaDhkTk9LeXp2dUljbTFzVTY5NVhHUVprOVRyYWwxWHNpdHFSYTRm?=
 =?utf-8?B?aTJIZkxZWEs4MjVmWWJXSWM2UE5mUEIrNFJhaDhlNWg0dlJuWjVBUUh5KzQr?=
 =?utf-8?B?VHBhU3FNVStvVmhpVVQ1M1QzNDR0clpKRFpWWkVmd2tHdHp3S2wvSmRNdUdR?=
 =?utf-8?B?dkxtTzI0Ym90MzdoWUozSVlKSGtHNTFoSmF5UE9tcytYakN2ZXY1c3pCTjJp?=
 =?utf-8?B?YWpCckhyRFRETml2Rk5nN0d1eWFya2lLQVJxYVFJMWtlcXpSeTlXOUtXZ3Vt?=
 =?utf-8?B?NU1HcS9JMjBBRUx0NSs3cE1DTW9SYmFvc25adzB5Z2ZRQ00rSkt0a0xqZWlG?=
 =?utf-8?B?VmhDVGZsMllCaDdjZ3pBemkwUXBPMkNKRUlSeWpFWi96Z2tXWmJFU2wvZGkv?=
 =?utf-8?B?V1pIWUJjalBmLzRkeEdLRWU0bUQ1S1g3dmFlNHg3UXZjY1M2a0JTc3BmY1Rx?=
 =?utf-8?B?OXJtU1ZwVEtTeHpETzRwMTUzZ2h5ZmgxSUU2a01JS3dYK0ZwTncreGdSeEVr?=
 =?utf-8?B?NTFlUjQydGh1RFhKMlFMUHNyRDMrVWRmSTUrTnROT052ZUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWhsTlpBcE9BS0FzUE0zS1VDNXVVcldkbzhIUVdBdm1BMFB0d3RpTlFXeG0y?=
 =?utf-8?B?Z3gyWnliZHJIWVZ2ZkZBaTk5ZjRVS0g0MTlhWExlV3hYQ1NiemZYNm5wbSs5?=
 =?utf-8?B?RFVJRXE5UTZCQjZqNDRvWDY3Yjg2eFNWRkN6bFlkODY1Z1dzS05sTUswUVpt?=
 =?utf-8?B?TTFzeExzMFFnVlYxY25IVlFHdlVGOVNCc3M3NjlGOU5QS0RmbHppRmxnRXkx?=
 =?utf-8?B?OGh2VmJGK2hvS3h6ZEpOdjBtYkVPTVJ5RVIvOEJBMndRdldHem56NTF2d255?=
 =?utf-8?B?ZlVHc0UyUmg3Rm9GMXJBbkZTZHZOL2g0Vm9iSGpTZWxKZ2RhcXlNeHlGM3J3?=
 =?utf-8?B?L205QWNmNTJsZXoyOEhDTEMyTnFjbkRLTElaY2lJZnFwOGJSNk9kcjdXSjlY?=
 =?utf-8?B?SnlUaEczZUlEbFJyVzg5c2NlU1puS0kyR1JQQmhKdkkzRjlVRFM3OEVmUU5j?=
 =?utf-8?B?Z3E2djQydzlRRnpMRWI2WGFQVHJ0dks5V3pzTnMxczJYZUI0Nkh1VUF3bGV6?=
 =?utf-8?B?SW44aFZqUlZXV0dPYko2K09wYUVpVG9GYnNNL04yQjV4SGNyRWhmbElwWXhS?=
 =?utf-8?B?N0xacW5OdFljQkpYVmdYaEhlYVVGT3BtVGNsTWJoVFV5RFhDN3ZOUzE1cURi?=
 =?utf-8?B?ZFFnR2s5YWpzUDN6Z08zSERnaE1Yam5ISkxjOERNWkZwQmZpS1kvOUpudGFY?=
 =?utf-8?B?QWlZS1c4Zm1OdGRHM0d5Y1ZvZzJ1RGhZRVFnS0dIR21aKzJjRzZJVnFTZkFH?=
 =?utf-8?B?c2dVclBheEQ3ZU01dHN5K3NyWVQra0s5Uy9tWStZRE81cGR6ODNZbmUyVlVS?=
 =?utf-8?B?Z0tJOGVNUHg2cFRReCtrMytHTnBjNW1pZXdIQzVKcndWQXlad2dHWlNtTDdn?=
 =?utf-8?B?R05UNkZpTGNhaExWbXplZWtzQWZBSiticWs1NHBnS2dGdzFxamNUTjF1WnRX?=
 =?utf-8?B?aUZvMkdVVks1ZkJmazJQSGJZZEtSTmRLNi9FVEJuNGhrL1VIS1FtSFB6N0lL?=
 =?utf-8?B?OWgwYUQ0QWhxRGE2c08rNHRqaGFhOU1oaTViSFJqODlhbWEwN25qQ1N1cVpi?=
 =?utf-8?B?NUxqMWZtY3c0a1ZhUkFkUVVrVmJxOHZFWjQxMU9sdlVmQTVNemhLOFVRbFUz?=
 =?utf-8?B?c2JzSkxhUk9SdXFnOTNJdko5RWZaajFuSUNNNW14V1BCY094NENaL01IVnJl?=
 =?utf-8?B?TmhlYkRmcmdXNnBkOU9sY3ozVThuQ1JZQ2l0R0ozVXFycnVWdnkyTmNCK0VU?=
 =?utf-8?B?b2dFVnQzdTB5dnlRMXFPQ2JJMkZLTitrajVHRk5YSTc5Q29zd2NqaEEwWVpx?=
 =?utf-8?B?ZVgxbFRoSlZyU2JITno2K2dKVlhjaXM5ckg0bUxzNnR1b09HTERmRUo2Vm44?=
 =?utf-8?B?a1Vma29HVkJoaExoaVVYTVZNUVlUcDVvMUxIclp2aTA4RlcycU5FNnFDRXZT?=
 =?utf-8?B?blVVTFZucm94eHVvZWlFdzV5T2lMYWMraFl2NnRJdFhKelg1QUZxamZHWUtN?=
 =?utf-8?B?cnlpTU01UW5kcDF0aWVxbmxWZks3QlBYaHRGRGpiUmJWUnRza3A0NGRJMm1v?=
 =?utf-8?B?K2x2T3ZMNzVna2Ntc1AxMllRSXp2dm9kV0ZOUE5zS1Rza2prUkRoeGNXRHRY?=
 =?utf-8?B?VmdLaGV1UzVxZ3g5cGQxTUtrdWhlRTFrd3NMaWxNY29OVHBDb0pwRk5ubWRS?=
 =?utf-8?B?T1VxbURhb2V4YXlSMVplREJzV1RqWGUwc1VZaG40Y2RaQ3laaVIyYmZ5L0NC?=
 =?utf-8?B?NW1yR01UczN2OHBtb2xpOU5NOFNhUkE0WExKSnFhbjFGODM4dTkwdy9rajg4?=
 =?utf-8?B?M2hhckdsWWlUM3pzbUs3NGJlQm92UU1zUFpNLzlqZy92enFIY2hRdy9tTlk3?=
 =?utf-8?B?ZTNTalNRZDdCMlN6ZGZtc1d6NHVYT1ZNNzVSQnE4c1R5UFJOd0VKdFhDeU94?=
 =?utf-8?B?Ym5ZSVJsRUZrUWc4bWRudTRrV0NNMGhia1pjc0xKVEhvVFhvUG8xOUQ4VW5G?=
 =?utf-8?B?ZHMvZjVXQnFtdFVjbVFxaFJaUDlRTTk1UW8yTFk5OUZxS0tTT05iM081T1Ji?=
 =?utf-8?B?Q1FzVzlCRkZOWTJTRStST0ZHQStjdm5XdExSdEx5NjREUVA5SFhEYk4yRXdo?=
 =?utf-8?Q?/H+Q=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7488f08-dbbb-4477-d9db-08dcbd51f06c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 17:44:40.3073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QzIbjwaLOPz9U2nK5VqJUgaq9ixlKMSVk/gzqarQAcIvJRgYCh/MMxWWhJ6Ya5jH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8921
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOqqiGFGGKx0Y6XhSGPn7jzGHuThJcGfrxxpy55T1r0=;
 b=vD7va7SqFnVze/8rZYS5iMyJKtoLUcvRE4LhieL3cQMycKc0TF8kANsJxnf8/MwGsrcAYnVGxS2NVLaAvyR4cUU38iPm6SSbfvaFl/B4IEgDnIYfJiDiacrKwUs7CEj/cuoBsgCx2jEKiLqnf8gaYts9oOdI76ImJOHUzvJhDDs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=vD7va7Sq
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH 1/2] boot/uboot: avoid setting
 PMUFW_INIT_FILE when not used
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> The CONFIG_PMUFW_INIT_FILE is always set, even when
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW is an empty string, which prevents a user
> from setting this directly in their U-Boot defconfig or frag.

> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Reviewed-by: Neal Frager <neal.frager@amd.com>

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
