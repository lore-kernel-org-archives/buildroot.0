Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC51C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 11:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4A1C409E8;
	Mon, 24 Mar 2025 11:07:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7orJVZbvpPW; Mon, 24 Mar 2025 11:07:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C2574088A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C2574088A;
	Mon, 24 Mar 2025 11:07:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C3061B8
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 11:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E93A81E45
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 11:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMEu85nMFPaL for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 11:07:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2607::62a;
 helo=eur02-vi1-obe.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BBBBB81E41
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBBBB81E41
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2607::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBBBB81E41
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 11:07:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mXGG0RuVXzAYHHF9p8fs4Hf6fRq69zM7notO9HU+DG/VL+KWNF/Gn/BWbdC1cGjMY+j5prxhCgRJqm49s9MYW2+m9QoyRPNIzoTlkDM2jjIN7S0VIoJxmcwZkFWrIEDcIYYRJor0MMBugEZ+rfR1I8ACGx2FlWuFcSwBCuTDetgxlU9sntXn6EWpk/BjEvon5810Ax06tNKjAnxxw92TmfrtD2r9zdOXo1Yflu3T6q8Q27yVEEt8F0i7aMFDtPJnKyDYLvPb2e3SEwJDFY1rGncwkXsUzXEe3O7fAhz4pyZ1Qo+8GZk6TszVyFBMVfeIhNw/j/Te3J1f4Ea3+iMlPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aa1iDD3qCy1nHO/r097gIXctPmapLCT7jmTVemOYWRo=;
 b=jENrlxh6xcRlSBEE2lLHmsbr3RD5z3FLDWga7EhAztzh/7z2PuriMXHf1LChM6c+OioCGiHzA4ZsqI7LLUo+NHQQNHKORBKrsFvMaEVuSNXzoyWRaatQRatJol09k3n3l/Ia4sRO39Zn6WYuAnRw+BPCVuIFwJL7hCIyLn1UcwfphbvSNRq2ZnN2JE34CGKNpuUDwQZRz/+tEvULgtG8DqPJHDF59tM7mqquEmap2jI5U5fdOs8lyQQz/D59DkMvj9+LdQ0eaR9n4WcC+zTJ5/urZgI1ROumP71GWJMwACQdgnc1ODHdEurMcykcCShgr4/3ee/zCwvxbfaQk0ZqSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU6PR04MB11232.eurprd04.prod.outlook.com (2603:10a6:10:5c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 11:07:13 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 11:07:13 +0000
Message-ID: <72e9dab0-e4ee-4efa-b629-6b51f5e81d07@cherry.de>
Date: Mon, 24 Mar 2025 12:07:12 +0100
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
References: <20250224-libwebsockets-zlib-opt-v1-1-16419ae3e82b@cherry.de>
Content-Language: en-US
In-Reply-To: <20250224-libwebsockets-zlib-opt-v1-1-16419ae3e82b@cherry.de>
X-ClientProxiedBy: FR5P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU6PR04MB11232:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f9dccd8-aeba-4a6e-8a5e-08dd6ac4079f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TU5SV0tJQUFFT3g5VTl1Yys0V1NZY0o5VVZkUVVyWGRrd1hncUFNeDBKY3VU?=
 =?utf-8?B?RFZXV200ZnhITWJaM2VidjdGbysrRjRHbmNXMmJlL3hFWGxIT0I2YkZqdUhx?=
 =?utf-8?B?WUgwWGtaeTE0OHJhM0F6a0R2Z0VEaVpsM0xNTndJcys4STZTb0ZMeEJJa1h5?=
 =?utf-8?B?ZGVtR09LdjdHMjYwdU9rdXNjRFVCMmQ2UEwwSENiZHFKWVM1cGh4OHEveEt5?=
 =?utf-8?B?ZmM0L0pQR29ncXpFQ0ZZSnNLL3k4M1hEVVp0Ni91Ty9NeTFOMktMR21aYmcy?=
 =?utf-8?B?R1V1UGpJbzlPQ2pGZ3Y4QzNsQzhwdnVRdE90Sll0bHFiOHgwSmpYcXVEc2RG?=
 =?utf-8?B?RVh0NmdJaHVQTFZ0M2ZVVlVJa21WNXNZbzhBMmNiRTNlQTBsWUZkSUZBdHNX?=
 =?utf-8?B?eElSbTVqcXBrT2JnVmFiUzJ1YWNJbFRab2hlb25CLzk0Vys3RWJvWCt0c3dC?=
 =?utf-8?B?ZUZTL1lRcGJXMDRJR2g1UVovMUVEbFEvWm12VzZWV2JYMnRDZUxTWGhDKzdD?=
 =?utf-8?B?Wm5xbVpsVXp2RWtmUlFTM3U5eGI4T2dncTU0WXk3MnZCVFBjQTQyZmJ1R3VJ?=
 =?utf-8?B?cXZydGgyQ0xzRENkbVN5RFZBbkpPc3FVblpzelhpWjluUW4wL0Naa1dncWkz?=
 =?utf-8?B?cVpOVFZSSXhFSDFkVy9ydE9NUFhTRy9nUk0rY2FXVmtldDkvcVF2Y0RpUTlm?=
 =?utf-8?B?VWowNkpvS05HQXVidEFCK0tNNW1wUWxXTTNyZCt2UHdjcy9EOHRJWlJ3dFlt?=
 =?utf-8?B?aCtRaU8xaSs3Q0JNaEdNOWx2b1NhblJqYWRjVGtnYndDSjUwSUwyUG9FOS85?=
 =?utf-8?B?OWxIb3dRLzZOSkgzQndmK2JWQlRtbjdGb3VEWXZQLzlHak1kR2ZBdnB3cG9j?=
 =?utf-8?B?K1V6WXN2T2RITVJ6NnhpT2hyMUN2UGhWQVlYSzZ2NFA3UGxUVmF5d0VNMTBl?=
 =?utf-8?B?RnltSmVXcjlLZFV0dk5temUvTFJTWlFCZ3hBLzNiM0F5VDFYei9CR3dSNDdF?=
 =?utf-8?B?eGtPelBNREp1ZnU3R251bnlMTnI0blJiODJsTm5DaklkaGhENE4xYkc0R0d5?=
 =?utf-8?B?dWpkUE9kNGZjVGY1Q2ZYak10bzBvZ0JjbVRqbUxGS0llcWYvTndlMUtHVG43?=
 =?utf-8?B?NTcwN1VLQytnY2xPTW1FSFppaEM5MWN3N0lIb1pxcE9lZ1NWeTZ0TkExeTIr?=
 =?utf-8?B?bUdMN0FPc25yTGxyY3J5NUZvRS9DM0xqZFpOeHplWURxWm1UNnNMWFYrWlJC?=
 =?utf-8?B?NVp1dkZVQlV1UkxHM2oyM21mYmRoeEt4Z1phTXJVK1lQVkJ3QkQxaFFHNXhB?=
 =?utf-8?B?aG5zTnF3aWNqYjdObXhjUkp5ckFlZ3QrRitSVU84SGJCUFQwbHdqcitoa01o?=
 =?utf-8?B?bGd6dEhYOUl2K3BjUVo5bWhWZExnUFJJdVpIZVMyUm5FU21xeFRvV1ZyL2ox?=
 =?utf-8?B?bFBkYWNVK2NIVUswN0F2SFBDUUZFaEp5QmxFUzNVTGFWbGtyc2ZHMjhuYkdo?=
 =?utf-8?B?Y2tRdXVwdnRGR1gvK1dpWGdhT1N2Z01XN3c4YmRKalh0ai8rU1J5MFlWbXdu?=
 =?utf-8?B?NTFvNGlnNFhFS3p5U1JaMnU0Y2pSeEVGUHpXZDMwbzBKck1LU3N2Rlh0WExJ?=
 =?utf-8?B?ZjJJSW1TaWx4b2RNWXd2dmdqdklwRWJtYk0vSmEwNjEvekVJQmtkSjdoZ1hX?=
 =?utf-8?B?OEF3em9jbjRUNTVQNlpCYmRnWWVQek1WelNTRHVWSFFtVEQvTkhaTW1ERnZ2?=
 =?utf-8?Q?liLmzZ8gcqrgZXw1oyyNNGyriKH3dLM/TxmibgC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R28zRHpjL0ZDd0dvT3N1cXI4aElXUTlwbjQzUkNCdVROaW8rV1ppTVdEZGlj?=
 =?utf-8?B?M3hHTEE1Q3RXbzVLZWpJTEpqcERuaUxTVWhIamhTVWVMZE14c01hczBTMlRQ?=
 =?utf-8?B?U0hheEJRMTk5L1pDeWFpWnpwNG9NekxGYnNGWld0TmxUejZxMXFxTEtvcGUy?=
 =?utf-8?B?TWxMQ2xJeTFmUm5CRnE0a0R1Q2k0eW1HTXJFYW5ZK1UyRFJXNWtuU2luRlB0?=
 =?utf-8?B?N0Q1SDlPZ05JcjZ3WmVKMXV1UERCajVsQml0NTZMaVZvNnlzTG5xVGhwMklR?=
 =?utf-8?B?bzBwU2RzZnNBK0l1aXBVTURtTW9FNjhPc3l6aHF1YlNMWndxL3JXeFZHUjN3?=
 =?utf-8?B?UElWR0VOc3VibzYyeEROdm0zN0lmQWJjQ2lweWpXQUNYYThKbjNNS3NnbVZK?=
 =?utf-8?B?dE1lcU9WZGxycXZyQjBneVROeFhIdTlYLzBpbGV0cC9sL2RLVU9GY2VOQmY1?=
 =?utf-8?B?NzA5a3hWS0NJSllTN2tQcHhjUk14V20ra3R3cHppSXFVWTNERFA0TzZUWlVh?=
 =?utf-8?B?T21uYlhGaXNOaXpENEkwN3lnTHo4aHBFZ29HZGtBSXQrRmRoRWYybE1BRzM4?=
 =?utf-8?B?TnYwNHRXRHRjVUxHUzZEcnNxM3p0VVRSOUl6ZjlLRzI3a0VSZ1FpSGt3WmJs?=
 =?utf-8?B?NHVmQ29TRGFmdmRZSXBkcmREUHZZOGRFZW9GSzBYZVpvYURRZUwrR3EvazUx?=
 =?utf-8?B?MjRQbXpiNytqcHBzWXVyR0Z4eDJaUHo4NFl5OVVsaURhWFdxczY0bVpRRHdj?=
 =?utf-8?B?S2ExQmlLdkdFdEEraDNMVzlHSXVBU1NaVkZ3dlVmdlpoeDlkUUdzMk1ibDJn?=
 =?utf-8?B?SlA2aC9SYWdTcXhEODFScm5DYVZkRlJzQmNMZXlNRGkzbHRPSGgyS2hnUUR4?=
 =?utf-8?B?blJmZi92TXMyRCt3QnpYVXJrVTJaNk1HY1lwdFB4ZmpSRFI3NmxxWmhFLy8z?=
 =?utf-8?B?YThUSzVnSUpNMHk2NlFHUWF0cy9hMDFFYlBKWEo3QjZzMW1qTmliRVBrWFp3?=
 =?utf-8?B?dHF2ZTZGcG9rYnpjWkZSdkJzSWVISXUra2tiUXNjV2dOS0dKYmZsemc0V05t?=
 =?utf-8?B?ZEtiLzhDMzIxUFlOSjloNnIvSWlXYll1MHhTR2lML1YxSnRyNC8vY1BDUGhV?=
 =?utf-8?B?Rzl4MXZpT291VEI3OTF6MkQ1eGhlNHE3U2tmbmdoUjdkczJjblBxYytmdTVh?=
 =?utf-8?B?Q2NVVnFkT0NXODEvVUJYVEtvQzdtUU1BaStoREZ1Rm81SFVlZW5MbSt2S25Z?=
 =?utf-8?B?N2xsZ0ZQN3BUZXhDajlXRGRmTXFvYWxZOUVoZVZRbk4vTDhkUmU3VG14djk0?=
 =?utf-8?B?YmhtY2JNR3djMm1KZ2g0ZFpZMWIvRTdzYTRoRHhJaXNZenJ3Rk1RSUtnbFps?=
 =?utf-8?B?blZmU2Rwb1Nvb3BWai83MUp0VW9JaGpqUlQwREVsQm8xQXNjMHh5UGwraXpD?=
 =?utf-8?B?QXFHMUFxQmsvc0hOYitBMnZkM0QwVFFmTVBSQ2gxYy80aGFqUThkRll1bEt0?=
 =?utf-8?B?L3VQckdyMzVEcHMrbTlTQng0REUwQzNzR0luTkVwVkgxS3U4cGxIWXR2MzNy?=
 =?utf-8?B?VVI2SkxQNzExczA4ZWNraHg1MDBKcm9QakZtN1J0ajZDNUxvNWtydHJaRlQ1?=
 =?utf-8?B?d2wrTkNQUFQ3OG1MbmFxL0d1VXhzT1RTbU9Lb2lQUm5NOUllRzFwd2hxZUZz?=
 =?utf-8?B?RlFmdzd5Y0ZnTEZkZk1Dd0JyM0cybVJKaEFUNXZXNTFmUXp0TVQxblZtemU2?=
 =?utf-8?B?Zi9rWjV2Z2krWm5JTEdFczZLbi9KRkp4WFhGRk9UQWt1VWRBSzAwbXBoK2NV?=
 =?utf-8?B?S1E5a0FaOEk4SXhuZURqZG9HVE1QdDh2U0pwVTJ4SjNNaEhVbTh5VVpCZkM5?=
 =?utf-8?B?cHNJYlJENmt3UTNCWW5RKzZNTk5DcTB5OUZCODl6NzlTY09uUXBaRHRnSkxq?=
 =?utf-8?B?WXdQakNTVGgzejhMTERRVHFDUE5rVDVSMGxwbFdLeFYvME1nMDJrSkxpM054?=
 =?utf-8?B?djBDbGZEb01VT1dTcDVxNHRaM2x4ekJTZUpSL2kvL3VndGZGYmJiRlZjNTBF?=
 =?utf-8?B?Nm55MlVBV3Q1WU1EZGFhbGxhbXJGY3JHem9NZE5IWW80S3pkVWtrTkVjUy9i?=
 =?utf-8?B?VEhpVEoyK3NCVHZrQzhxZEdkaXlLR2pjYUlzMVZGSFdsWnIxRWV1WGhteVA4?=
 =?utf-8?B?a1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f9dccd8-aeba-4a6e-8a5e-08dd6ac4079f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 11:07:13.2361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJhUcK7IacPq7WFFxU9d2baVVeyyLkG0iWAlY1Ca0ZYCdTZGjFKAcxqyIxWm1EPu36dW01W5Mx4X4J+erGU+QMG8ba/1KIxzozkuzk4lGqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11232
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aa1iDD3qCy1nHO/r097gIXctPmapLCT7jmTVemOYWRo=;
 b=P/hiJ10YDU55/yrYcapBZWrxa92cwTbONUsSCnAHnz8CLSRsjdJ88a68kO1O5F6V7tZ0TDLDP2iiUp6n20sHHWUao9NofH3elyX1Fd5hXCZe4A5eus+LcpIh1+WoEXz/tBNCkVilYiGBozJPGf+dFjedF0qtAUmAlUm17gIGh4o=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=P/hiJ10Y
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH RFC] package/libwebsockets: make zlib
 dependency optional
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
Cc: Gregory Dymarek <gregd72002@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gMi8yNC8yNSAyOjEwIFBNLCBRdWVudGluIFNjaHVseiB3cm90ZToKPiBGcm9t
OiBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpAY2hlcnJ5LmRlPgo+IAo+IHpsaWIgaXMg
YSBkZXBlbmRlbmN5IG9mIGV4dGVuc2lvbnMgYW5kIEhUVFAgc3RyZWFtIGNvbXByZXNzaW9uIGZl
YXR1cmVzLgo+IFRoZSBsYXR0ZXIgaXMgZGlzYWJsZWQgYnkgZGVmYXVsdCBpbiBDTWFrZSBpbiB0
aGUgcHJvamVjdC4gVGhlIHNhbWUgY2FuCj4gYmUgc2FpZCBvZiB0aGUgZm9ybWVyIGJ1dCBCdWls
ZHJvb3QgY3VycmVudGx5IGVuYWJsZXMgaXQKPiB1bmNvbmRpdGlvbmFsbHksIG1ha2luZyB0aGUg
emxpYiBkZXBlbmRlbmN5IGEgcmVxdWlyZW1lbnQuCj4gCj4gSW5zdGVhZCwgbGV0J3MgbWFrZSBl
eHRlbnNpb25zIGRlcGVuZGVudCBvbiB0aGUgcHJlc2VuY2Ugb2YgemxpYiwKPiBhbGxvd2luZyB6
bGliIChhbmQgdGh1cyBleHRlbnNpb25zKSB0byBub3QgYmUgaW5zdGFsbGVkLgo+IAo+IFRoaXMg
ZG9lcyBkaXNhYmxlIGV4dGVuc2lvbnMgYnkgZGVmYXVsdCBub3csIGR1ZSB0byB0aGUgcmVtb3Zh
bCBvZiB0aGUKPiBzZWxlY3QgQlIyX1BBQ0tBR0VfWkxJQiBmb3IgQlIyX1BBQ0tBR0VfTElCV0VC
U09DS0VUUy4gVGhlIHBhY2thZ2VzCj4gY3VycmVudGx5IGFuZCBkaXJlY3RseSBkZXBlbmRpbmcg
b24gbGlid2Vic29ja2V0cyBhcmUgdHR5ZCwgc3d1cGRhdGUsCj4gbW9zcXVpdHRvLCBraXNtZXQs
IGphbnVzLWdhdGV3YXksIGd0a2lvc3RyZWFtLiBBY2NvcmRpbmcgdG8gbXkgcmVhZGluZwo+IG9m
IGxpYndlYnNvY2tldHMgZG9jdW1lbnRhdGlvblsxXSwgZXh0ZW5zaW9ucyBhcmUgdXNlZCBvbmx5
IHdoZW4gb25lIG9mCj4gbHdzX3NldF9leHRlbnNpb25fb3B0aW9uLCBsd3NfZXh0X3BhcnNlX29w
dGlvbnMgb3IKPiBsd3NfZXh0ZW5zaW9uX2NhbGxiYWNrX3BtX2RlZmxhdGUgYXJlIHVzZWQuCj4g
QW1vbmcgdGhlIHBhY2thZ2VzIGRlcGVuZGluZyBvbiBsaWJ3ZXNvY2tldHMsIG9ubHkgdHR5ZCBh
bmQKPiBqYW51cy1nYXRld2F5IHNlZW0gdG8gYmUgdXNpbmcgdGhlIGV4dGVuc2lvbnMuIHR0eWQg
bGlzdHMgemxpYiBhcyBhCj4gZGlyZWN0IGRlcGVuZGVuY3kgc28gaXQnbGwgZW5hYmxlIGxpYndl
YnNvY2tldHMgZXh0ZW5zaW9ucyBzdXBwb3J0IGJ5Cj4gZXh0ZW5zaW9uLiBqYW51cy1nYXRld2F5
IGRvZXMgbm90LCB0aGVyZWZvcmUgdGhlIGRlcGVuZGVuY3kgaXMgYWRkZWQKPiB0byBpdHMgQ29u
ZmlnLmluLgo+IAo+IFsxXSBodHRwczovL2xpYndlYnNvY2tldHMub3JnL2x3cy1hcGktZG9jLW1h
aW4vaHRtbC9ncm91cF9fZXh0ZW5zaW9ucy5odG1sCj4gCj4gU2lnbmVkLW9mZi1ieTogUXVlbnRp
biBTY2h1bHogPHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT4KPiAtLS0KPiBNYXJrZWQgYXMgUkZD
IGJlY2F1c2UgSSdtIG5vdCBmb25kIG9mIGFkZGluZyB0aGUgWkxJQiBkZXBlbmRlbmN5IHRvCj4g
amFudXMtZ2F0ZXdheSB0byBlbmFibGUgbGlid2Vic29ja2V0cyBleHRlbnNpb25zIHN1cHBvcnQu
Cj4gCj4gQW5vdGhlciBzb2x1dGlvbiBpcyB0byBhZGQgYSBuZXcgb3B0aW9uIMOgLWxhCj4gQlIy
X1BBQ0tBR0VfTElCV0VCU09DS0VUU19BU1lOQ19ETlMgZm9yIGV4dGVuc2lvbnMgc3VwcG9ydC4g
SXQncyBqdXN0Cj4gdGhhdCB1c3VhbGx5IG9wdGlvbnMgdGhhdCBkZXBlbmQgb24gYSBzaW5nbGUg
cGFja2FnZSBwcmVzZW5jZSBhcmUKPiBoYW5kbGVkIGxpa2UgaW4gdGhpcyBwYXRjaCBpZiBJIHVu
ZGVyc3Rvb2QgY29ycmVjdGx5Pwo+IAo+IFRoaXMgd2FzIG9ubHkgYnVpbGQgdGVzdGVkLgoKQW55
IGZlZWRiYWNrPwoKQ2hlZXJzLApRdWVudGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
