Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89F3109C040
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 18:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D8FD6138C;
	Wed, 25 Mar 2026 18:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5pQiNg3CHYO6; Wed, 25 Mar 2026 18:12:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5865160855
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774462362;
	bh=/yD6NxZLMShFJPNCUcyftrIl0PtZOaqCPq1U/SkAsrE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rFsnVerb5AmpglwHwp9fuhMiPOSUa4uoMFcy8pnnLIiD+B55zE7rzRM4MLHMaD+SG
	 HA+xMH/kGnSgtrHwgVfJxhrrcNy0eLIP+2pGe3BL5DYnNDGzxuBWJtc7LpFlWJOwiq
	 IMKJpcfdnb2rNMSvbeTEL7BcUNHZslS3vKUzz+w+S1gPbtTMcb/0hOQfcrNJyjEeik
	 L3zkYEM5PCxsTQxabOvGebRbct6MqAh7hENTfyxx9eM1rv0ffvo3YJkkF29dFWvgmL
	 10cubiVMDNZZmKt0o1693N7szz56UVpTwyoMAdmieFuTib19KpVWbVcT/oL6O0wWZD
	 XXqFjnp+tqprw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5865160855;
	Wed, 25 Mar 2026 18:12:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B0151D3
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 18:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BCE360855
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 18:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dM-nL0dlNLRC for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 18:12:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::5;
 helo=duzpr83cu001.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F94F607F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F94F607F2
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F94F607F2
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 18:12:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsLsYPjJmz0vuhJCJzuybDjwZQfloUCRWIlp5Be/2RESP/+J08aZnnuaniU11590T7J7xdkqdHpDu4mbin5AaGAGpn/D5Q7YhpPQ5YufnxUbUXAoxnqmh19qrT/knULujvqgEydJqgsom59vVlxJ9fT8j9fhQPsGyEzYNZNEICTajkHBPBhRu3boRAI7kRF+XZ+12ZyXg8vUrhG2hxi5gLN+iFQtj/wgbnmkOoj+WyfZ2kKVYeGps/U3LEhtD2imis839hw3Fo5kUdTqEGMWZYv3rfwEezSnwf0rxyj/YOwbuvNK4OhnflP4xSNO5BsRItMNujapRhGUb90EnsMs/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAD/3Hm/CB3wP2zGo7poWpDha2Upe93Mys9x9oO/tBk=;
 b=e+rBAcq3IwQjUxK8nrgG82NnirgTJm/AnWkEcdTHfn46LkD3wA0FXs+kRrCp+ln82xvjyDm4J1+8BBNsXfTkPH0FRtH8UdCHIbA0jRVBiPzE0zG46g4ZNnGtKHJGAOEC0/evPiki8dliUWT12V8pbeF/8XqYEmT5IWLMrey/UBn3pHHpcObRS+ivKvb9k40N6HtcWWpbP5eDXNcdDXIGBx1MW1z1e2HvhtwVmdkpt58KlF7gT41NXoETuyemctXuUqMXZRgU4lOmIsjhQQoHH/KueIEKDcYN5rpRcU1r4fwRd6l30ToEVw0MFjQW6LY+d0LxNRxz3CiKGBHwIU2Vtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM0PR04MB12098.eurprd04.prod.outlook.com (2603:10a6:20b:743::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 18:12:34 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 18:12:34 +0000
Message-ID: <d728395d-316b-4ab6-be7e-bba218dcf31a@cherry.de>
Date: Wed, 25 Mar 2026 19:12:33 +0100
User-Agent: Mozilla Thunderbird
To: Heiko Stuebner <heiko@sntech.de>, buildroot@buildroot.org
Cc: Etienne Carriere <etienne.carriere@foss.st.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20260325150346.414826-1-heiko@sntech.de>
Content-Language: en-US
In-Reply-To: <20260325150346.414826-1-heiko@sntech.de>
X-ClientProxiedBy: FR0P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM0PR04MB12098:EE_
X-MS-Office365-Filtering-Correlation-Id: e8e0b309-f1dc-4eb9-3f51-08de8a9a168f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: eNCOkNOt8t7N2458hzZYtl0eNbuCBhf1dzDdwE/pyFPL8BvN0f/K6/Lb5ApgxC30JIkxb7QvtU/VI50Vr15xs+HWFKfDa6TfoYxd960Dz8QkXdWjCufBMZ/nxYlOT3eAxhw5ejYR+hhfjegkSke7SXKSbpHHOfGXVfub9pF2Fqbcy4MrjLaM2Tz+0BiSyAddM6qg3aAn/iuATGktl3e2goC0k6lCNss+S1oH1z9LqlBj8oLwJF+wmwZ0Uawxz59g7rOYl6ljtiWpL53rcCNG4uDJgQfy04rxm2ZxQYaJ3RKUDRSzEUhF/MbRcUUmgmhZ1Dt1nx3RB9MmS3zjitU8WfCV+NU6ahlF9ASAoRCGW+jXs+0rRxJAL5qOyAXec0XKOOdqKDEENbtQve3sYLXbsMHouV+nSMaJ+UoTlGsjn0HEnO8/pj5f5Bw2hMh2Vp9bj+PAT+I0wuQJGvlCDxW50kL1nc48hM+QVmSFSjh5jlPDoYtGoTlEhe+IkjC1rlLdJRLdNA3cWyKyIjhk5CTBnecUO2ZhLlE1nqlD+K53Mj4nEUVi+nMx44e3/zVdV+7+ggyWJY+JD8lTKSMo2+IBkikWtixwrhniBHlTCtAx/lshuiDAN26UQVjjgJJkAUqQO+i0LXo+AiO4d+2SxDNddMXZDfz4ZQ03UDSAP3DT2Oa6prVu2kKq7wRZm+/8zG6ofuqvDUD8kpiQmBoikf5cBzIK4VQFIT6/jEcZBE3mTWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUgzR0xyakVnMjB2Q0NiUUdoaXhlQXVhRFVNUnFrZmRJSlZMM1dqVDczK254?=
 =?utf-8?B?eDBzQnlWNHZGbXV1VWw5L212NmtnQk9JNEo0SVRva1ZQamlnVHhHamQ0YUF5?=
 =?utf-8?B?a3hOWERad1k2OGpBUnl6Z0RtdW1CUEVRanZ4OWdDOStiWWhzcGdsc3MzYlZq?=
 =?utf-8?B?V0ljRDBEbXdkNncxbk1icDhxbUo3SWtpSzQzNlVTU3AwWDJTUlZ6b2QwRlQx?=
 =?utf-8?B?SkJieVg1bStPN1U1OGIvbjBxZXJrcFNDWjRWNnRFZHZPRHpkUDVUYStxTzlh?=
 =?utf-8?B?QUtGcmF5RGRIWm9BNUVSWjFsWTczTlJRZXVrbC8zYUM5b2Y4d3lsZ2o4MVoy?=
 =?utf-8?B?WHIvc3ozNzU4RVUxMHZ3ZDFsSlc4YjhxRjNGRGZBUmdLOXh2cEsyZ1BhU2s0?=
 =?utf-8?B?QmRKSHBmOWd1NllpY1VvVVNPMUdiaThjVldGVEIwREc4ZXpnOGRjVDl6dGFX?=
 =?utf-8?B?WitxMlRWZXpsaFVLVHhtZktlU0tmWFV3VGxGem5RZFM3K09tSkFmSGFqc0Fu?=
 =?utf-8?B?cEVFcWdIcHZEMWJpTVJtQSswa3NDd0ZvSWM3R3kwNUNvZUxoWEhBUHJkN090?=
 =?utf-8?B?Nkg5SFNLdDRIeEMwUlVtUGtoSnZxenJkS2tKa1lINU9EMGk3dWJmMmRpanln?=
 =?utf-8?B?c1l2bnQrbjJiRWFYY0RrSlVaNFY5bElhZFBDZU1CK0VNTlVMVTljUUtQRWlm?=
 =?utf-8?B?VGpWZEdGZG01QUJsZkpLaTd0STBFM21VcTZoajFsNGtDVmhCVUhPWVMreCtu?=
 =?utf-8?B?VFJ4MjlNSnI5elBGVElvQmwxcEJkZFdQMUlGNEJCVkYzR2tnZnViR0ZhUFRJ?=
 =?utf-8?B?OUV1NTJyeFFYcXhtQklLUXhxK3B6SDA5eVdQSWVLR053Tk1WRHFvbXFJVmFP?=
 =?utf-8?B?NTRMUFVQRi9WNU53S2lqV1JWZEtBVUtBMzU1VUxZQlQvRXVCdGxkZDVVK0Fj?=
 =?utf-8?B?bU82UUJjWXliKzY5NnQ5bUVyZGdQak1RQzB5L1hTRGY2RlU0UDdWeWRiVHFU?=
 =?utf-8?B?Z0o5WEJzQ3dyMUl1Yko1Yjl1UENVRWtVWDN0UG4rTUMrL2l0bkRlTWJwZDJl?=
 =?utf-8?B?Z0EvUkp6TlpjaWQyMGFjcXJHV3EwMTViMWJkeDFoeFlpY3Q2VnlTNHVRdnlY?=
 =?utf-8?B?R3VJc0dlS2JRNmZLdU9BQnhmS0dvbVRyczh6dSsvb1pFVFdjbHQxclF2dHEw?=
 =?utf-8?B?TUt4eEd0OGo0dE91b3FKcldBYVo1TUo0S09UQ2wwQ3BIZnZ2eGhZVVZlMnli?=
 =?utf-8?B?TU1DS2N0UGdxbnE2Ny9NNlFIbVJrMGdRYkdWc2RpQ3d6L3JmcmlGYWFFeHpo?=
 =?utf-8?B?VVFTdFpRMkRhNHNmSmtTWFByd3pBM3oyeUZWRlhNZkZaVjQ4S2duaHJCelhF?=
 =?utf-8?B?ckQ4VUJXWmZ3VnFXRmlTanl2SXRjNjFRcUZwMXlub2FkN3N5UGpPM21UY1VN?=
 =?utf-8?B?V21nVGRZM1grN3pSRDBtOEd5RW83Vk9LcW9HQkhiZDZObm1RRlQxS0YveE1t?=
 =?utf-8?B?YVdhTFJleVAvTk0yc2ZqV3VjSU0yMjdUaEEycUQzVHQvRGlQSFp4RllMK2NR?=
 =?utf-8?B?NXA1UFdSVzV4amdwUGkwam5MMm01dklXeGFmVDM0cnhBSHhvY0JYbHFlUzNE?=
 =?utf-8?B?dkJaUE9Xd1RJZGM2N280cGUzeDR1VTI0aHhlWVJNOU9Ybm00ME5QUXVtVWpn?=
 =?utf-8?B?c2dWa1QrMnhDd0FwcGpMSlhUNmpGZmJrdndURUh2SEE2Y3RUSGdOdGJMMDJt?=
 =?utf-8?B?WndIMGIyMUtJRnhjWVdwbWFBYm83N05OSTl5TGRDdzJKMnlmS3YzWWxCYnZM?=
 =?utf-8?B?d2tiWEtVbXE0UzdGNmpmUzdEV20wcmMrbXJuVkg3YnNZSlhjcFd0S2NBc0xC?=
 =?utf-8?B?WGpOVEVDZzdjM05Wd1ZsbkZlTUlEZ2g0cHNkU2xseFpLMHhZV2QwaW5RZTRU?=
 =?utf-8?B?NVYzbEZRK2hya1JLc0ZMV0UwUm5KT09pOTRCZWpVYTVxekp0Q0JDdkpYendY?=
 =?utf-8?B?amhzMFNlcHloTm0reHg4V1FzOXZuelV5U0Nsd05MYzdXZHUwMmovNElqVUEy?=
 =?utf-8?B?VEczTk9sOGd1bkdpSnpwdUwyRVMzOE1jcXFjUEhZV09IUURMdjhGWElLM3dD?=
 =?utf-8?B?c2FmSjFnZGtHUkk4WUxwVy9tNVF2bVB2UWJPUlNCc2l1RjRrOSs3MXdLM0lj?=
 =?utf-8?B?dzY2ajM0cVVza2VCZVlYbndsckVWekJjL0hlbDRVNmZUNEJXQTRHK0xVdXc2?=
 =?utf-8?B?Ykd2enc4dlhiVUpEMFRRamdQVEUwYTd1ejFieStzYmw2RDhQOVEzNmRlc1dQ?=
 =?utf-8?B?QWRzRlZBRTF5UzZ3VVJBSEIzV3NWd2IyeGJNQytnbHV1M1Izdzh1QT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e0b309-f1dc-4eb9-3f51-08de8a9a168f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 18:12:34.2327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/EYqr+nMpsAATr7NdfSs5YUQYa0elhNUXDtqvuY081jgsXYetE5NY9sH+N7XMaxdKublkIDyCkjZKCbHCSx4KXhp2mgOAJWCrp+QLEq3Dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12098
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAD/3Hm/CB3wP2zGo7poWpDha2Upe93Mys9x9oO/tBk=;
 b=PGG56tkRY8CNyc8c4pSsvH3BSvY4Jv2PDOqBcDrMAtnlxrMaWNAOCBzCkjnX10TiNqmVaoTtAMfzlYLKTK48cXYojJS7qyJr4Ut4c3dS/iqCdET82apQKeHUe6x8dz6HcKQRiXlbrmIE0qQafNufLvAinHxXQarfZfWiYhFm64Q=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=PGG56tkR
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH] package/arm-trusted-firmware: add
 ARM_TRUSTED_FIRMWARE_CPE_ID_*
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

Hi Heiko,

On 3/25/26 4:03 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Trusted-Firmware has been using a number of CPE identifiers in the past
> but especially after v2.4, the correct identifier would be similar
> to cpe:2.3:o:arm:trusted_firmware-a:2.12:rc0:*:*:-:*:*:*
> 
>    https://nvd.nist.gov/products/cpe/detail/65DEC230-1CD5-40DB-903A-22537D1E44FE
> 
> Add the relevant CPE fields to the trusted-firmware package.
> 

Thinking about it a bit more, I **think** we may want to strip lts- 
prefix for the CPE_ID_VERSION. I don't see any version past 2.4 on NVD 
so we cannot really know what they'll do once they need to tackle LTSes, 
but I am assuming they are NOT going to use the lts- prefix?

What do you think?

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
