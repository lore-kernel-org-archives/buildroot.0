Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36FDC02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 11:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AF5981E1A;
	Tue, 18 Feb 2025 11:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uH2n2bU4j-su; Tue, 18 Feb 2025 11:35:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7425D81E4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7425D81E4C;
	Tue, 18 Feb 2025 11:35:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DE424968
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 11:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD7A681236
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 11:34:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0t4HaoTHlJS0 for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 11:34:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2406::603;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A8EF9811F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8EF9811F4
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2406::603])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8EF9811F4
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 11:34:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOV/JU0Qg+oDlJD+mY7bcbtQffJaBU0wREssgUjqKuJkOoz/s/PwdeqD4/RG5m6PDk4eYLK9Y+75z+bh7SqYW21oU+NZ2KtstQDsLWekuxeeYkwApt3OBqsTLOKqUdCeD6meDoo8jUFOMc7xBlg3JLpm8N2Oqp0McXTQTxGx9gjtQnpSyZgzdKa5ZA1o6D1mbWxhISHZzcpRFMjMo0em6UZYnaQBhp1QGyohud0CE9fLlKH/AG7GgyioCW2kGFkBYp9R5iY1tFEfvI079YJrLuAB/HujjG8UzbQtWQxlH69xiuVlzoJP1wy8AFEx47X3lr+Z0IDAgcgKDaa+YK7r3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhhSISja7bSHnEF3RvnNjE7EE72d7VbOtV9BRCy7DvM=;
 b=ZZH71mwwZkzsFkUS9fORsKfKO3Kj1hX317M8CnLt/JQDyF9ix7q1EwKDzDaxFxbVSB++hf2NsGZ078Pdt62TNISzWquX/SOfPBH7V5KI1sWHVfXFTjTIgu5peWwnX6Y7SRpkdRLD4IAT12XZ0i3k6LIQgmlO8uWl895cY2jXsoxpCAvGOIsdlmt7nqa4tjJw3YTymzSdWMK/wrhHipYFLyI8vPzUhYHeO2pa4JFQ2yxW2pK0cJlbhO+8jAN77/8FbDgs+4auH9R27H9RQaxUdPAyVadwDWjCiiPVdFsvo5NYQd4n9acou7OWfnCOMVjBiLl3aBhoifr74ZWCZxzf9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by MN2PR12MB4079.namprd12.prod.outlook.com (2603:10b6:208:1d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 11:34:53 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 11:34:51 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v5 4/5] toolchain/toolchain-bare-metal-buildroot: update
 help text for multiple tuple support
Thread-Index: AQHbgTp11Y1IxdF6B0+vR9k9do66KrNMEuWAgAB/1eCAACEiAIAAAKPwgAAwv4CAAAl3QA==
Date: Tue, 18 Feb 2025 11:34:51 +0000
Message-ID: <SA1PR12MB561572EBBEE981A4B6E62AAEF0FA2@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250217124932.2653445-1-neal.frager@amd.com>
 <20250217124932.2653445-4-neal.frager@amd.com>
 <191e1010-5580-47ac-ac91-dae8fc0064d3@mind.be>
 <SA1PR12MB5615F539F6C0BEA4E38DDA2BF0FA2@SA1PR12MB5615.namprd12.prod.outlook.com>
 <17f2c8f6-0e3a-4070-ba49-3c58889fe83b@mind.be>
 <SA1PR12MB5615BD8CC8188A05A71DA016F0FA2@SA1PR12MB5615.namprd12.prod.outlook.com>
 <2451e9ee-a8d0-4bd1-b70f-a6582975f2ea@mind.be>
In-Reply-To: <2451e9ee-a8d0-4bd1-b70f-a6582975f2ea@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|MN2PR12MB4079:EE_
x-ms-office365-filtering-correlation-id: 4eababdd-7f26-49b0-78ff-08dd5010421f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?ejVtbnBPNjZERkIrVnZPd1JmVGZXWUN6R1pibFBrL3BYQjlRSm52bHI2aE9r?=
 =?utf-8?B?UUNlTllqTDA4TnRlTlpEWkRFTVBQVm9DMmRLeUJxZE94VVhTQkdHL3RIcGxq?=
 =?utf-8?B?NkVuai84WlRoRHVpb2pDekkxUmIzMTkxU3B3d3N4S1dMNEh5Y05zd1A1RGo0?=
 =?utf-8?B?MnZuUkJUSEJJaC9EREMrczBDQjlBZ2xSTGlFTkIzbWQ5Q0pSYkkyWlZTa0xy?=
 =?utf-8?B?UlVLMlNkNWhPcTE2VEVBSTVQVGgvbzZ0eWpId2tHWDQ3SW5rNGdnQzI5d2Jh?=
 =?utf-8?B?OURWVjczV1I5UExyc1BoZnRBcmFxNFUxSmFsaVN2SXhIUTRJVk1NUHI4enlY?=
 =?utf-8?B?UG0zRHZ0Q25ncGRXaXlpVWdMTjJidmh4aXVkT1dvR0xubzdaemJFUENtOFB5?=
 =?utf-8?B?VGVNb0E3MklldXVzUFlySzJ2aU9DQTZFQU9VWHh6dklaL2xyWUFWekxycncw?=
 =?utf-8?B?R1U3Nm5LOTdITEc2WlVzdHowZzhHTCtWd2txbUI4THNTdzd4anBTd091TzlE?=
 =?utf-8?B?TnFqR2hEajhhRVkvazIvOXJ0b0FUVGtSb002cWZNU2pPL0tZRGgvUll3VlBv?=
 =?utf-8?B?aXMvRlhkdjJwbWRDYXgwWEE0dmFVWHU5RWE3NTNhSVhSTWc2d3NtR2d3Vmdj?=
 =?utf-8?B?Snlwdk1BTWhBbEpYRXo4KzNYK0cxNnQwaUpwQmtSSk5ROWg4bmZST0Z0SHBG?=
 =?utf-8?B?TkVZdXUvUW0rUjJmZk9MSUt2dE9jcGV4aXFUK0Evbkd4a0xmR0g5MjYwN2hY?=
 =?utf-8?B?NjFrVmZmTmdZTnRZdkJCaGZzT3dRQU5ETmdTb21Ba05uNkpybEtqWmRZeWk1?=
 =?utf-8?B?NE5XcEc0akZaZkw4ZWZndUl3aDdGS0JISE05ZW5nL3gwcC9Tdkw1bGdhdllr?=
 =?utf-8?B?OWxML21VR1lOaFVnS01INGpLNmlVUXRRR3RJd0NkWUtFOEVyNkRQd050WnYx?=
 =?utf-8?B?MVpJZjFmdTlma3AxV1grUWJDd1FpT1VqS0JoQW1VREltYkNhQU1jL3ZwL0hV?=
 =?utf-8?B?bFA5Zllhd0RZM0xqRVMxQnhVMndPcFZ5T0x3QnVTWnJNc2lmeXl1UlJ2bnFO?=
 =?utf-8?B?Y2hqTnE5Uk9xN00yQmFNVC9BeXZadC9oQmlWeUhIZ1EvZDB2WnVjV2I3c1or?=
 =?utf-8?B?TzlXYlBKQ3ptQjRhcU1mdlVVb2JabGtvUEsrTEk5cTAvR25VRzJqQ05sT0x2?=
 =?utf-8?B?Yno4d2hmQkRzQm5LSDJ0ZmlDcHdZSTFaaGZaQU9jb1dUZGUzSmluU29HbGJy?=
 =?utf-8?B?V2pQTE1ocFVibHFPUHpVaU1BcnV3dTFnZzBYUmh4MVJRL2taWWlCVlkzMlNX?=
 =?utf-8?B?ekhxVnlXTkZwNkN4SmVzWkhwMHo0cEJORis2Z0JWdnNqcUFsbEtZZHJuMFA4?=
 =?utf-8?B?eDlMblZFZE5qU0l4dWtnQ2I3cDFlWDQ5dlVTdFV4TUxBWkZ6cmc5WTVacVA1?=
 =?utf-8?B?SEZSeDRxckVWbjgzWGdjMEZhTVBscmt4RHp0QkdUK09Zblljd2NtdHFram1m?=
 =?utf-8?B?ZzAwQ3JEQ3lkbVBPZG12TEdGaTJzN0N5c2NyRjlLMXdrM0haMzNQa2FIZCty?=
 =?utf-8?B?SUZoN1JXaGJyUWpKTXN6ZDBORzlSZVJDcVR2YXNBRENMcUFZN251T1FlSkxZ?=
 =?utf-8?B?T3RSNzBNeTFDV3FmUXdzelZ2SU9HOG5yOW1sK2c4ZjJ0WmFCUGQwYTFNcnBM?=
 =?utf-8?B?MXVTU1J5a05KRGJuT0VxNEpTYjlzV2ZSQkdRYXpmT1hiYU1XRUJRd3BGcnlD?=
 =?utf-8?B?ZXJXVityUDNVTm9kM29TYmQ0ZDVDcXlMQWNBS2gzUW5ueTNZTktXNjlUdlgx?=
 =?utf-8?B?aFBpM1k3S3J0UVh5Y0VuWUFtZVFXWmswcVpZTEdUd215a2F6a0tSUUJxVUVk?=
 =?utf-8?B?a1hnQkVDTEFjNk5PeFFOSmJlSTVrcjEwUU5XM0lrZk1EaDVoOGcyVjZWa2FI?=
 =?utf-8?Q?ru224zvPa6o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ulh3NHo0dlgycHhRSEhzNzArQVNQUGVJNU9RVDQ5cSsvdG1nQXJ2MVBQWGFt?=
 =?utf-8?B?aWovdllUMlF3cExjNjhPd00ycnFTUzVFUWlBN1B5Q1JUbHZ4VDdnYmt5ZnpY?=
 =?utf-8?B?Y0FLY09wZCtHQnlYSjFKYk54MUhyVkxTSTFMZWsrQVZNd1hITUxiSnA2Mndl?=
 =?utf-8?B?K1M4TStUR1hieWNTVmNwcERSc0hIL2ZZeHBUK2dCeXZ2WUtMQzZUZkpUaHhZ?=
 =?utf-8?B?NDRNaUZUQUZZODE2ek1BcmFGTm5pMUNaVTFtTlJxUkJQMG5OYjAvSHE5aXFR?=
 =?utf-8?B?QkhGWDVSRXNFWG5tT0toSUtVNG0rSjg3UnNQV2pMQytOdUZiUXk4dElOVjVp?=
 =?utf-8?B?dGNpRDVmRTZ1ZUczSHRmWmVzY0tvd3k0TlVHcm1PVFltZWNFeVdIKzBlaTBD?=
 =?utf-8?B?U2w4dVdMUmlielpPbGJwNjFkWGlvQ0YwQU5ETUZYMlhvN2RkaE9udkU1TCtE?=
 =?utf-8?B?N2xSZzZFQjVvWXZ4dHE4Z2NrNXdrSFpkcWppN244VFozSHFEYUgwNUVrSmtH?=
 =?utf-8?B?OGYwV2IwRlc3VG9sVkgyY1dNdEV3bFB5VVRRQlN0WUhySyszOWNHYTVSRXM1?=
 =?utf-8?B?SWNEQU13NXZGWTl4am5CVUdPQ0J5aVRQUlFxdXNnVUszSGoreDJkREZFbzEz?=
 =?utf-8?B?b1laVTJ6eUsrV3ZhZllZcHI5WjlRZGxmZXpGblc2WUJxbW15UnFLUld3QTlo?=
 =?utf-8?B?NHkvbXJrV2Z5VERJK1pCcFJJenh4SmxpTGtxYmFya3JVdlVlRjlHUlNCWXhl?=
 =?utf-8?B?MUJabXZ0dksrbUQ2Q2k4Mm9ZOXR3V2czQ2k0RXU0ZWFPZ2RSRjVuOXpYSHdi?=
 =?utf-8?B?ZnBHV2RZZEIxZVMwR21mbnd1TC91RUtPQXJmWHFsVXdyNUdUZXlNV3pyOEMz?=
 =?utf-8?B?WDdlVFV6cGFJNjdtK0NLNzFEUFFtcHdrS2dJajRXQnhYaWg5RjYxOU5Rbk1n?=
 =?utf-8?B?blZxY1hWcUZ3ZlJsSWNuVFVhMkJXeFpOaWJQQ2NQSTJmek9Iem5maG84M2Jr?=
 =?utf-8?B?NWd1eVZNa0MyYUxTVWdtNm1lNXM1d0tXWWpvVno2d2xBQStVL1ptQ3MwZnVF?=
 =?utf-8?B?V0M3aUg5R0ZwTUlkZkZLa1crekNsandhYmtQZlNGN2c5UVN0b2tLNGVEd3lM?=
 =?utf-8?B?em12eC9icmkyaUp2MW9ZUmtZMldoY1ZaYkJGTWR3dmdteDJ6cXR6Mjhtek5z?=
 =?utf-8?B?MHlwVUVtMlVwUzdMQWF4ekNuSEpGQXMwS0dycTAyc3hXQnBhdUwzNUJUbHZB?=
 =?utf-8?B?T1VOTEwzWFRJZHg1MFZJT3hISStoMW1oZEd5elg4MGw1Y284ZU00dzNMYlR5?=
 =?utf-8?B?TVEzdlhCdDYvb2NiUHJWKzcxT3kvc0dmVHM3ZW9OOVNEbXBXa3JKd0R4dGU5?=
 =?utf-8?B?WHBtNHNXYkh4UzJKZG1qcGtraHFYSUFaZnFnSndrYWtjZHVZem5BVFowVGQ2?=
 =?utf-8?B?S21KaExwdmRONFh5Vy8vVUVWT3RNc1lqUmpNVm10MFFvcXJCQ3orTFMvdGY0?=
 =?utf-8?B?MGdncEo1dlpIbWk1R3BxazVlSk9IV0ZJNGxiOXhlN1N1YjhSWENtTWthKzBy?=
 =?utf-8?B?WHpiczNWMGQ3MWNqZFVMZDJIYTROS0RRVWhBbkpYZS9jeDlYT2x3UVQ4SFdM?=
 =?utf-8?B?RG5BVVFhL1phbXFxb2Y3RGVvd090K3pQOHFRNW5uemxxRFl4aXh1alY1SzR5?=
 =?utf-8?B?NE1hUXFnRXNhUDhJTVdscm9VSFp5Y3U2a00zR2FPTDhnTDFRQ0pZNmpNQ1Zw?=
 =?utf-8?B?ZTRhRUtibnVBWXMxRVhEakloYVF6V01QRUJlMXppdkYwbHdpWEpKRnJ1Y3dq?=
 =?utf-8?B?YVp2L0dpTGRaUUVlVlFCZy9CeG5vMVFMZWR0NEdCZ0duL0svdHI4ek0rNDdH?=
 =?utf-8?B?b2VIZFIvdFFIVGxlTkNTcG5rR2xaWmoxSGlUd2RhdjRqNXB5cUx2T1BXMW9u?=
 =?utf-8?B?K2VKaFp2WlN3QXdoYXB1cFpUR2tnYnhMTUt4cmdtRVpBMDIwYTNMMlltSHYw?=
 =?utf-8?B?VExUS2pXdTNmRC9ZR0VkOXhWeVkxRkhLT0V3cklnSnllN01SaE94cVdJVk8z?=
 =?utf-8?B?ekRWNkV1T3VCRS94WTVLUHZ5WE15QjFRNzNrRmVEdHFPK2MwMm5KWk1Vdzlq?=
 =?utf-8?Q?A43M=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eababdd-7f26-49b0-78ff-08dd5010421f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 11:34:51.5301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5MDndOiqPuFDrD4uIfWlibWf1jFVcToW+p8yL0FU+6gHTZmXoj1hPKGTd26JxLfB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4079
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhhSISja7bSHnEF3RvnNjE7EE72d7VbOtV9BRCy7DvM=;
 b=VjExAoqRH3nVKnSD5pePAgHJoWPjGZVCLuSDyLzepwZAZF1ngg7g3sCER71afiEdkwZXtVszhOh0mwBSL/HK8GbC1ELapEq7T5AvFtCRUQB1H9PCgUUS25WY7X1hr5RTEtfoiHE1H9BJMgAjakurzK1dEsm0vcVOeaWHn53jxo0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=VjExAoqR
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v5 4/5]
 toolchain/toolchain-bare-metal-buildroot: update help text for multiple
 tuple support
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

> Hi Arnout,
> 
>> Hi Arnout,
>> [snip]
>> Even though Microblaze only ever exists on Xilinx silicon, if someone
>> wanted to run Linux on a Microblaze core, they would get a toolchain
>> named microblazeel-buildroot-linux-gnu and not microblazeel-xilinx-linux-gnu.
>>
>> Since we are using Buildroot as the build system, and since the vendor name
>> does not change functionality, it is probably better if we re-name the
>> bare-metal toolchain to microblazeel-buildroot-elf instead of
>> microblazeel-xilinx-elf as it is named today.
> 
>>   It might have been better, but changing it now means that anybody who has a
>> current config which includes xilinx-embeddedsw will also already have the tuple
>> set to microblazeel-xilinx-elf and will get a build failure when
>> xilinx-embeddedsw tries to build with microblazeel-buildroot-elf.
> 
> I understand.  However, unless I am wrong, we have not yet issued any
> release tags with xilinx-embeddedsw included.
> 
> This means that anyone working with xilinx-embeddedsw already is working
> from the buildroot master branch, and would probably catch the name change.
> 
> Do you think it is really too late to change this?

>  Ah, I didn't realize that that was the case... In that case, it is worth 
> "fixing" it.

In this case, I leave it up to you regarding which version to take.

v1: vendor name change without backwards compatibility
https://patchwork.ozlabs.org/project/buildroot/patch/20250218065026.4907-1-neal.frager@amd.com/

v2: either xilinx or buildroot vendor name supported
https://patchwork.ozlabs.org/project/buildroot/patch/20250218092256.1000685-1-neal.frager@amd.com/

I am fine with either solution.

Best regards,
Neal Frager
AMD


>  Regards,
>  Arnout

> 
>> The toolchain package is called toolchain-bare-metal-buildroot and not
>> toolchain-bare-metal-xilinx after all...
>>
>> Assuming you agree with this, I will submit a patch that changes the name.
> 
>>   I don't think the consistency aspect is important enough to be worth the churn
>> and the backward incompatibility.
> 
> I understand.  It is a bit of a shame to have to live with it.
> 
> I suppose another solution is creating a symlink for backwards
> compatibility, but not sure if this is better...
> 
> Best regards,
> Neal Frager
> AMD

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
