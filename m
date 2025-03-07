Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F230BC19F32
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 19:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F12981259;
	Fri,  7 Mar 2025 19:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MApwOWaDM_jH; Fri,  7 Mar 2025 19:00:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3CCD81264
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3CCD81264;
	Fri,  7 Mar 2025 19:00:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CD751C9
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 19:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F2B881259
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 19:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJ8Pb7OYM6lr for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 19:00:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::3;
 helo=as8pr04cu009.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F17281228
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F17281228
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F17281228
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 19:00:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ydyj6S1FGdpAGzF/TPPL5n3gfYYXaImrPBVcxhDbUgWQX7H3+OR6b8A1oOg3VJh+TLUTR5K3MXrcOll0uxbYdL14qM9K6IJfYK9epXC3WN/DHc4tSoY6R80zhW7v3cckAOzTsX4/hRJp9DtiZ8s9i9Ud8gMmQgzICZz4vWDc9oXTnK4c3L718uqjmmvkfS2vDdsdSqn7WPaectUXIyo9gtTATwga1Cl0TOZBRdkoQQ62B1NJ53c607xo3iIfFwFU4Je13zHIJynq5c4sWc0hJKJ4HKyThMVBp8Zi6TEFeazr7GRDJjuErQPQxRR8kKZkAt3MqziibOY2Bx2NmH7b6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1YnlS0RHuVtYQBBUjYvFdCpuG3BgszbFe0EowGGFzU=;
 b=A1W1sO1eQV/oIvD3/DBqsRzH71O9JWFXzexU2wusahIGOWS00MgWc2wrhkIqTCO4NffCUwY/UdGYyPOgImzGkZxYNior5OfJGYoJU6VX467IyGmctkyKU0Ptc9tVKRHexRoAvRTSxt7kPpQfn3ye4Qm5QuZKsFdAxXX2OncMbQH8LnHg7zch09FFjreIiJ72ehW4qNXQDrHLEGMdx8nQvqK4oh3/25GYZSdaSY5gVs1MMwYo+iTq0e8AEhpOZvcw87gKLq+5jByMyBVzQ+Iu9pTtifSqK2YquR/Zas6cl4yOwSBcfNlMrvPy/wGDNEMtf/Drp9rLymwCfO1C5JfCkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM7PR04MB6775.eurprd04.prod.outlook.com (2603:10a6:20b:102::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 19:00:18 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 19:00:17 +0000
Message-ID: <ccce7fd8-ca1a-498f-b784-da79d7a04bad@cherry.de>
Date: Fri, 7 Mar 2025 20:00:16 +0100
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Cc: Peter Korsgaard <jacmet@sunsite.dk>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
References: <20250307-setserial-fix-v1-0-c37c1e7e8234@cherry.de>
Content-Language: en-US
In-Reply-To: <20250307-setserial-fix-v1-0-c37c1e7e8234@cherry.de>
X-ClientProxiedBy: FR0P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM7PR04MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: ab0daae0-f23b-4bfe-408d-08dd5daa4d22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmkweGxxK0YveDFtbUxnQjZEMUdlVHc1eEpFQlU4cjdOVWx3eDRBOEZNS2pX?=
 =?utf-8?B?aktuaFRRdDdScE1laHd4bmVlN050R1drL01MK1VTNGtMRWs0a0I3a3YvODcr?=
 =?utf-8?B?c2hLVFVEZU02VVRIcHBHR3J0KzkxMlNkSXVXNXF3SlRBSEpsZi91OWJSeVgr?=
 =?utf-8?B?US91bWxDOUxjb1ZpdW5UT3ZvSWs4WE02T0tKWkI0ZWZ2TXNoL0hqTVA2NGJ0?=
 =?utf-8?B?QWFKNlY2U29WN3dNZXkwcVowZTRla2xNaW9JSEpjU2NUN1R4QVYzM1Buc0hS?=
 =?utf-8?B?TC84MCtHdlZ2VWlldGpRWU0rdjJSQ0tMTWx0T0M2TVdQY2VvaEdKSjV6Njhx?=
 =?utf-8?B?dWE2bVkzNHE1Rm1mZnJLVFJONlVjdGZNRUJBeDQ5eTQ5TDFJRHhNdGRzNGpE?=
 =?utf-8?B?aitFV2VrNWVCMDRWMkR6VTdlaFV0VE1EajRIbWl4ai9RSTRxajRKTUY0dGJp?=
 =?utf-8?B?Y1JzOVpVVWVvVW5IY1pmbDBZVHMrd3ZTcllzbi9RSHVQOWI4NjA2bUpVL2VR?=
 =?utf-8?B?QUt6MGFJVWJnR2hlOEpqWC9sdWJtenM0WVVhRHZRTUZGdUdBTiswUm94L1hD?=
 =?utf-8?B?R2d0T3A3UkhtMno5Ump6RWJ3RWFXZWN2TVQ1MFoya2FPQU9zSHJwbnluZ1lW?=
 =?utf-8?B?SFpmbmRpOTJYSzhxTDlWaVZHRURRSXRaUFUxa1pHWVpTWFdEbGY3SWgzVkhz?=
 =?utf-8?B?NmhhcWFiRWtsQnJwbWgwZ3E1anZsOTVZSHQrc3M5S0dKNzcyK05KYUpRYjRL?=
 =?utf-8?B?WmpzM1gzbGtsZ05IUEkxOU5qYi9GakZYUzUvRnlOU1lWNTBrYlFBSk5Sei9C?=
 =?utf-8?B?TmNLQWlwbnFKSEpDZEc1YnVWc0xTd0FnWU96WHQ1Vld1dTdheVBFR2xPWTBN?=
 =?utf-8?B?MzY0SHE0YkdPTjBsZVVHTlFMU2RUODhWRi9NQVRmWlhVcnNySzdYd1NkT0hy?=
 =?utf-8?B?UUcvcE5Ua1h6MERxaFFvYndTcjZWT2s5TFNxL241RlVwWmM0d2wyYTR5cXNE?=
 =?utf-8?B?Uy9IaWdWRUcwK0hxK1VUbFdCRVJ1NkNsSmFMRWIrK3E0bmxJMWxtRkU1bWJr?=
 =?utf-8?B?UzBKNkdjTEQ3czRzak80RU5jTG9vRWcya003K1Q2czVUK1dxWThXVGNWTGlE?=
 =?utf-8?B?bjFRbjhHa1YyNXhQdTh5N1o2bmlDSkJ3aW9RQWpNVG1XeWhIbTBDb2xmcG1k?=
 =?utf-8?B?Sm9UQktnTkY3M1FKeExRYnhKMzR4UytmOXBURmordmszeGJ3dCtmVk56OUQv?=
 =?utf-8?B?ZFBEVm5TbVFJTGFNSVlGODhUeUNlcVhkaEdLRWFpdThwOFhvcW1kaldzSGxk?=
 =?utf-8?B?NnpkcTFwcEszWjNxdWlKQVRqcHVWYS9OWTA2V2F0QzFSQ0xTaldrZGd3em4r?=
 =?utf-8?B?M2JqL1k0U0ZNNDQya2lJa1A2QjQwd3JHNkNkTFNKMmdzdE1KaW5BaGlQaVJY?=
 =?utf-8?B?QWhxMDNKL3FxcExER1I3NUl3NzZBcWsyb1kyenNtdzZSNkFrQmJ1UFdza2FI?=
 =?utf-8?B?RFlnQUFidFp1WFdpMjJHbXgzUXA5UmJLZC94c1NrYWhnQ1ErOEx0K3JnZy8w?=
 =?utf-8?B?NE9Bc0tIbHdaM2JGUWV0Uk8xa2ZQMk8rTzVDbW5rVXFwdVdZWmdoU0lEMHI4?=
 =?utf-8?B?ekQ3N3Z1UGx0Q3hXQVVWeGFwNkJiMmhDWVFEaVA5a0hFaGZQOThic1JrZktB?=
 =?utf-8?B?WkQxOTM3QzhlZG0rVzl5OXpaSklkSTVXZkVaTXZBRzAreW4xblBTMzgwclVy?=
 =?utf-8?B?VThvcGJjb2N5RXRhbzd4RHRZV2U0dlo2eXZYZ1NTS3UzakltOUVBOGZSOTJX?=
 =?utf-8?B?a3pmU3VaNktHVmwrU1ROL1laV3RFUmF1c2FRaXZoOTRlRTJYL1F2cWNzZ3Er?=
 =?utf-8?Q?JzuJDJlTh+CaZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnNUTTBUTGFCV0NDZytPV1Bhenk4MFJYYTlQallCS1YwaVg0bHFnT0N4MW9k?=
 =?utf-8?B?UjBTVitpd0M2Wk5vaHVyb0VQa3o4UDlsTHlKQXVTazRweXBDUXZaQXRoeVZz?=
 =?utf-8?B?ZVVuUndpTDlXTnIvaXBZdjVHNExIMWhVbHZxQitmU2UyUUcrcElHWm00S0h0?=
 =?utf-8?B?THF5YUtEQjJiLzJwMlNBL1B3ZDNHUlpEeGsvdk9SQW9jeXYxT0pDRnJXWFV2?=
 =?utf-8?B?VEtMMjBMU3hiak1INk9ERUlHQmE5N3FkaSs3WGYyRHllNjVpdG1sSXpLT3Rt?=
 =?utf-8?B?VDc4QjA5Q2lMS0pQNHNDSWpsWHF0bEFPVHZDaTc5UDF0UStnL01pNTFHRzUy?=
 =?utf-8?B?UVNJMVhPZ0I5RkxRNzBvMlhjaVlVelhOU1hidVFlcWh3Y0U3bTA3UUwzV09H?=
 =?utf-8?B?UnFvd1M4UHk1aTZZZENwNnpaNXBHREY5MGxXNzNvMFpIRHUweGVtTjNBem1Y?=
 =?utf-8?B?dC9ReUtwbWVVYkhNMEF3bUVySUIrK0djMkd4Nlk5amtrUUwvUzJKQXFldzJI?=
 =?utf-8?B?TkttS0IwMC9CbGdrZm5GYlJ4cEZvN0RmVFZKOENwSTlXbTVOZWI0UkVFNFJK?=
 =?utf-8?B?bDNudG5FZWxVV200WFF4S25DNXRORlJpOVdsYXJyb08yUm0xcmJmdWg0eDVn?=
 =?utf-8?B?R2NQYjV1WVp1ZkNWNmNZZDFESHhidWUzbE5sMUltQzNkUCtIeUhzbi9US2xN?=
 =?utf-8?B?Um45ZkRCblNHQVFERWZoNC9xc3hzWW5kNm5kVDFFM2pKV0x4RHltSGw1anc0?=
 =?utf-8?B?QTUvakEvc2sxMjQ4eVZaOFZFZVVJNmJyQnlYU1I3OXI1S0tjYzdpWnNZWW9T?=
 =?utf-8?B?UXVnVmdnZ0I1MSt0S2pHSlVnQlgvdWlFb0xnVXYxemU4U2ROMk1tSXB4dFVn?=
 =?utf-8?B?eVJIQ21ITm5nRUg2MXVXTmRRT3lyNlo1Y0F4V2Vza2EwMXhsY1ZkUGhIMkE4?=
 =?utf-8?B?cVJ4UDgzS09CanV1S3BkOU94UEtDM2hlcUtnc3l3c05xQ3JraXM1TU1ESG5V?=
 =?utf-8?B?aHVDMzM1QjdOb3FpTStwengwNUNVV21jcElHTU84V0dEUjNzeG5NTkkzek1I?=
 =?utf-8?B?ZmsvUUZ0eGxPY3FsZGpMajVwZ2lsaTFIenhLVUJNQ0pzbE9UbFdwN1BFbFBy?=
 =?utf-8?B?ajRvTjBHVVJGbjE2Z3BaaUcwTUxiZEVrM2ZsQThLRDA2NFlKVnphSzJ3M2Ix?=
 =?utf-8?B?YWMvN3d2VWVpR3BLYlJ5YVNRbE56aHVNdmtQdTh6dndBK2ZGdFJRWUc0RFBk?=
 =?utf-8?B?djZNdm5WWkxJZ1VLcVQwd0xCTXBXS08xaldrSkhDMHluNGVoNjBrYUN2V1lo?=
 =?utf-8?B?ZUs3aC9CZFVSc3JvMW9yUk9YMkV5dFRrdjkyUXh3QU96NXhGdUw1eW1LODUy?=
 =?utf-8?B?akRZZkxWY2I2WUNVb05rZU5oMWN2bHpSV3AzOWpDT1JOUXd2dC95dlArTnpr?=
 =?utf-8?B?RzQ1dHNWSnlkc084UGg0STVrV3FFMGlsWnhFSlRTR29LTWRYY1QyK3JZajV2?=
 =?utf-8?B?ekh5SUlNcUJoMzJscC9MRmVkV0Y4ZmlkR3Q2WlNGbVY1NzZETW5IY1U5NUxt?=
 =?utf-8?B?THZOdDRoZEloSmM5UWs1SmNQcDR5cURxVlZpZEFmTXk3bnlsV1ZZZXBDVUFq?=
 =?utf-8?B?b3JoSHB3SmFtZTJWdkJlVXJKRDdRMjdaL21hWUZGSFB4UURGTllEZVhQTCtl?=
 =?utf-8?B?b2puZXBBQWZNUm5ZQWxuQnl4T09VUTJlelhwWnpnRXVjZnRSSEZabStRcWxJ?=
 =?utf-8?B?TEU4cnFFdXA5dElGei9VWFJzalhNaGVJTVVSVlRVK09YOVh4dCs1aVJMWndz?=
 =?utf-8?B?RzVINlBHRFY4NVoyMzY1RkF5d3lIRi9mSlhQTStiUll0QXNlc1ZJMnNtS243?=
 =?utf-8?B?ekpMQkhuZzNTT0owcWVIZEFCSkZTc3o2Z1VYeUFHRGw4U0phdXk3V21YVHh2?=
 =?utf-8?B?SUVKbXFtc3Z3RzhKTG8vTDd1RU5TRmNhcFNnU2YrMjV6OXJJOHRzcXhLcUZ2?=
 =?utf-8?B?a2R5RTNEQ1poQU5KU3AwTmgyU2dzZGR5UUlLbTMxMEdvMk05THdpRG1scVhL?=
 =?utf-8?B?M004dURlTENaamFCVUw0Z2R0WTZEZzdBRmh3K2xlVURoTTd0cWtYanNyWGlu?=
 =?utf-8?B?QjRmQkQzSTArdDBqOHZhRFgvYzdFbitkOStpYXA3QWtiN0owS0prTERpWU1K?=
 =?utf-8?B?d3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0daae0-f23b-4bfe-408d-08dd5daa4d22
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 19:00:17.8699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7e2mdPMm81ycEUeMG/KlQ0Lx43skoUWyW5ezFmmCLKPX3iJ9g6vVd+4kAvHYfeLTKv1LUPxpsQYqssSLEZdXqHCPtutTsu6JHh2pHa6XFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6775
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1YnlS0RHuVtYQBBUjYvFdCpuG3BgszbFe0EowGGFzU=;
 b=mYIJwMLJ71preUOzO08NHVBqKimfJZB6hiFxGFTJtL1BiiIDqyU3W6TPLZ94uK/O0fo1G15/P5nTka47hEGkMsiY1GU/XNvojxQoheHpjytrpq437livAp1nOccugdXq/jgzOWq9AOGx8R2Yb7Pxwb1VJRNfQ6Y/QEajZFPGZZ8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=mYIJwMLJ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 0/4] package/setserial: patch with _PATCH
 content and fix build on newer toolchains
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <quentin.schulz@cherry.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On 3/7/25 7:58 PM, Quentin Schulz wrote:
> The patching logic is broken for a while (only 13 years :) ) since
> commit 64ac7199525f ("apply-patches.sh: add recursivity when scanning
> patchdir") where support for patch files whose file extension is .dpatch
> got dropped, therefore the patch were simply and silently not applied
> anymore.
> 
> This series fixes that but is a bit more complex because we have patches
> inside Buildroot tree that conflict with the patches we get from the
> package's upstream.
> 
> Finally, setserial currently doesn't build on the Aarch64 external
> toolchain, so this fixes that by running ./configure (via _AUTORECONF =
> YES) to fix a configure-time compiler warning that fails the compiler

Forgot to mention that this makes the following messages appear:

 >>> setserial 2.17 Autoreconfiguring
autoreconf: warning: autoconf input should be named 'configure.ac', not 
'configure.in'
aclocal: warning: autoconf input should be named 'configure.ac', not 
'configure.in'
configure.in:51: warning: AC_OUTPUT should be used without arguments.
configure.in:51: You should run autoupdate.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
