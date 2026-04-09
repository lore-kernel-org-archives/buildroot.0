Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDEEEA3C4E
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 12:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 969F940D49;
	Thu,  9 Apr 2026 12:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_YO9E4Ro69E; Thu,  9 Apr 2026 12:59:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0D6940D71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775739541;
	bh=QifrzDrEmC4JwbIe8/m39sGefaSITnY1aR9rA8rLNgA=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=PL7hTAipD6Z1uUnA/1kt2h39QdJj3MPK4eSsHiS7d7hYEAHuII81JPPdPUuDbV0IV
	 6AIMUwj9jiRNYwJ82KKQW+0U2Ud9FNu/phsvYAylq5sUhoOS36z9cBK5GnFk0QuRhB
	 4uT3aqsMgYdeflXd78Gts8ELK+ujqTzpD0oJWpXVVHUMHO8TkVoBQEPYtxwAYVARN8
	 ZAHIj4RcDNZBIvOve/F5DqRTow9oMAf6C1OTVTtrHLGQOAQUcFp3TZDlSNfd2jFu/j
	 eM7Cgm3OHuWwLWHPQn053kvBg+9dGnPS/vGZi6U/s8MA0dQfYZ87+Y9VrIPM5jU7OC
	 IfIGJsWV3L6PQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0D6940D71;
	Thu,  9 Apr 2026 12:59:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 69A7E1F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 12:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57F4440D71
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 12:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5tJc5kP-O_zB for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 12:58:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::6;
 helo=am0pr02cu008.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 69DE140D49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69DE140D49
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69DE140D49
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 12:58:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOWoINkBvSdt8+xJ3sonQpiM1ldu2wZ8qCfcw2P5MxPLgLvLPnJoQUR0m+QOZ00C+a60D2VAEwOEuJDio9qU1PKPxDuq/gJ8vvu4HYrQvH24029UyjOp9LtkUR+kEXK4rWaCjRrYvWopzBTwaRDBD8HDJoZ7bQtUF8Kv6JqtAQG8RrY96PBVI+UhKc/dJXpSBuQOymytaE9KkxgMFlNphxcBHC/67QVYuskJD0tK4YQByL4UydFEzxXR3smmwcrD9Q0K0nPt7wvwvbHwAZr8ENKY+b7+M3KCiJD3cW/SkWl1PuMW9qKgxw6P9s9GHM7X47BQU5s4XcyMDOem9VwaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzCdv5NfSh7RVpErZRkOXrlQNjcBK4+mSTXF1ffHXIg=;
 b=e4HtaT9yu1y2LKTqves26jGwlrztDz4Qk3KGhThWMqgWaarDHstfPoM9yQgYFrq9NTVjN92YXAz6onG3mQ0wbFkbGyz+BwlHOMITG2tkQSeDL1wGRWYmjyBl66VbLaevxheNr4NSvHVpoF2begHXKQmSirXWCSu3eDGCpDY4vBDyy6UBd8QzZQFsO4qhyQ4FiV60EMNDbmRjtCi1+biK+NTS7b5tQaOwVbbmEo9INohxRidH9rS+wE7rm4Y+quvOctzFQifdYCacwWTPA7LiAylBfIQgkvc+IhlbagvtWU8XbL200lxrqu1n+NrgBMXGZSUqHGlT9eRi/RjsxPo0WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PA4PR04MB7805.eurprd04.prod.outlook.com (2603:10a6:102:c2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 12:58:54 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 12:58:54 +0000
Message-ID: <de0bb761-ca88-4bc6-8d7b-6bd14e9d1cbe@cherry.de>
Date: Thu, 9 Apr 2026 14:58:53 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260311140457.140041-1-thomas.perale@mind.be>
 <20260311140457.140041-7-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260311140457.140041-7-thomas.perale@mind.be>
X-ClientProxiedBy: FR4P281CA0406.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::11) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PA4PR04MB7805:EE_
X-MS-Office365-Filtering-Correlation-Id: 2006939c-55e2-4b7a-9198-08de9637c129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7NT/zwSn7GMPDFYoVRQq7cI3XZbimT5pPHRCA5AAh4K8k4ZyhnCjHsj3SiK2ojOcGUOzYg2A5JfyAZ2IkiEXG5U/0Ap66aTO6ML8K2XOOo2f/pD+DTHQPL0Y1FLrSwJqSz63rI6+Ik5sNIiXNaO/1XhJdOy6wEqpwUt3pQSVNwuPqLYpA0PVFl0770qmkEN7SCl32tp6xlwDJkhxwRqVe3wYyJHAVLWs13FWEh/QXzcr0sQWhTsPEdUjeLu69JsfFwwmqgqX83On1+jR9JaNhMkLIfbadcVcnMkdQe1vOvmYLXZpVyfwo6AnwoRt2pNgqC0i2MJaMiZYlrxH3FOwkjARel6r8P4xAkIPbvkLXdXRElo3Ri+veKZhThjEMmPIQHk8Cl2AaTjQSQFzsv94gqaap9yDp5nWjpFJdErFHIof/XkO8F+YfkF16bp94d7OfXC1NiMnuc3CKyH4hplBozyWf92pt0CMe2pKqcgPQZ5/yICcNS+r7NgXsmKfZVe1NGjhgeDP54ouxz9fhR1E6lb9QMYx7gR8pjrmki+2G8nhYndNRdimPGZctz13hfFUKL80LTgks9rBaG4r5lm5JV2nTOBIi7N1okKQu+FrmvaE4ZFEC2IL6hClXS1bz0Wii1PyAYGkNFjYowD1IFvnXboMuLmY+DmHfKDTrpsGjUeFGIBRKGESbcfwQnkidjqf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnNtM0dkR2RwbnAwSkM3cGllaEhPaWxkZFRyZEpTMUdQbWlrU0wxQWJtREZQ?=
 =?utf-8?B?YTk2U2o2NjNlbi9qUTlQWjlDaFJ2YytQT0JlVmN1N2g1UTdlZkdKMjN3dlpk?=
 =?utf-8?B?V0tOMC9lMDBNd3NvOG1tWnZNWlE2dFpkaFQ0WktzQVJzUkJaSFpBL1orRks5?=
 =?utf-8?B?YXJRaEg2dWl5VzdKL0hvdDBPeTN6Mm96Yitlc2ZmVkhJTndpZis2VG1RazhK?=
 =?utf-8?B?bUVIdWVseEtmM1hxZnh6T0dsZ2JKWkhlb01FMkJteThDWEhIWU1GT0ttbVhr?=
 =?utf-8?B?RGJvK283eGtDbmQxdFlMR0hFcVVvU1VtREE5dnl0b01jOHgrNzc1N2EyZFlh?=
 =?utf-8?B?S2Z2SDQzSGsvclpEWm4rVG01MGl3S3dtN1YwUThrUmp0M0hIYmtuU0xvWHVp?=
 =?utf-8?B?ZWF6RHVxbzl6SmhjVEkxTW52QVpFd1JuTXRibVYxRTlPbGkyeUhHbWJEaytD?=
 =?utf-8?B?aDBrN1dvV3hKUnllY2hhTG82VGZJaXVXTEdtOUp4a1BudkJRcEtCSml0cFFJ?=
 =?utf-8?B?ZlVPckxXWlR3Nnh5VnJ6bThpdnVtQi93QTcybTNOL2ppWDZRZFZvL3d2Ujkz?=
 =?utf-8?B?Yy9vcUVNZTBUNU44TlYxUWpsaEozeW5LV1k0dFFidjJnaitEUWR4Slc3M2tB?=
 =?utf-8?B?R1BhcG43c0xlRDVSZDN5LzNUQVlRNU9VMVJENkxRRlhRS09OYVNBTjU0bEdt?=
 =?utf-8?B?V1U4eWs4SmNHYWdaa0FvT3cxcFJoRTU1bUZkR0ZZMzZvd2VwdnExalN0YmNa?=
 =?utf-8?B?b2ZKeVRHYkNoQzNTKzIyVnhldkhIdExBOHpkVW5DWS9qZ0JQVlVBSERZcS8w?=
 =?utf-8?B?N1F4K3gxUDZjUEthNjQzQkc3MjE4ZWxtOG1WTml1TUZFUUxqWWlGWU5Id01r?=
 =?utf-8?B?WFpMWGVMN1hLZzZlbnU5R0hOeTlabFNsMGhoNkdyZlpWOXlhR0tJVDN2c3Z2?=
 =?utf-8?B?QmE1RWNXcDcyQVNGc0M3M1huS2s1Um1odFdtVlpoVTJTempHY3p6dGxGYS9x?=
 =?utf-8?B?OUwvS1BuL2IzQ2ZTclJwMzRKM3A0VmFVY2J3M1FwKzdLQzBXNkJWVTVRazhT?=
 =?utf-8?B?bFBSeG5GNHd2K1o5T2JQZFVzMndhdHk0MExnUG5nTnM1cjhOaEd2VHNyeU9Z?=
 =?utf-8?B?Y2lYbE5SR2Y1WG1IcWg2Q21XYUNobkxyOG1xay9hbW5Wb2l6ZitLdVg4Q0xy?=
 =?utf-8?B?NlZLMWlSa0N5YmNPWDBOeTdIVldMbVRjRDMyL05zZUtJc0hWblVkMVB2RUxV?=
 =?utf-8?B?dVZSUndvZVZYdEJFTnJmQytnVlZDT0pyMkFyaVplMHZPMlNvcnNncUtNT0NF?=
 =?utf-8?B?MWhLbDdZL1l1Y05RMDN3SEtEcjFCM0lwRjhHWENlSDRsMjE0alF1Q01FVVZQ?=
 =?utf-8?B?RDBBY3J3NFVla0Y2RXNaVytSOE1GODBUcXRUZ1hkZWRlWUNWODRrTGFreDBq?=
 =?utf-8?B?NnRENVpCdFRvc1dPTkZMaVk3bkNrTEtSSVo1MmFtTDgwWExISHRrcE4wT2Yw?=
 =?utf-8?B?ckMxUVNlVXFhRzdDRUNuWFhzdnFUaCticnZ0dU5nd2RPZWJiSzJGaHEzb0x5?=
 =?utf-8?B?LzJEdXhnRXFBYW5mcDlaTU0vdmtob3VxdE1YeGcyUTZRUHZBV2wxenlRbkdR?=
 =?utf-8?B?Sk1KcUd2bi91RTZDelpESTJzUU9tNU0zUUlGSGtnOUk5M1UrN3k2VnNNQTdC?=
 =?utf-8?B?d2dFN1EzTVE1UHhvZVhXZktsSS9PaWMvSExBM0V1ZkRGOHhtOGN1UEw4UWd0?=
 =?utf-8?B?bW56T3pNc2FPSXlTZVAvWUZlSkJSbE9tTWcxVGFlV2g4YWxUUjU0WjF4b1V3?=
 =?utf-8?B?SENvVzNxQldqYjRicXVXcUM4ZGdSdzdCdm9lMFZkN1hCbVVrWHRlNkdoR0xz?=
 =?utf-8?B?UzV2U1dOeWR5RTNDRFVYbVBDS0FDeEdZejFRbjVaMkZ3eEk5ZVZmVnp4N2cz?=
 =?utf-8?B?S0hWU0dSdTJWcXRRZHFqOGJuM3IxcUVLNVM3eFJ4VU9MZU1pcjJ1Z0pxVTFD?=
 =?utf-8?B?Ky9qNUNKUVFNM0NLdHc4SWFVZUNxemYvaGN0REh4aTF3QXZ1TU8vdWlGeHZp?=
 =?utf-8?B?SVhTODhvdVlJVkdIY0Q3T3JJdkVaNVhLbmFlTnQrS2NpeDQ3VllkWUVFL0x6?=
 =?utf-8?B?UUNrTEVSZ2RROWFXOU80QW1jdzBuUCtCRDByN2NHeHlsaU12dlJJdGJqU3BW?=
 =?utf-8?B?M0JIZjJHa09XVnZEcHc3YkpTQStTczkxdWttOTB2ZDhpbmdGU3NWTC9BZ3NM?=
 =?utf-8?B?QkZhaWk2Sy9pTXp5YzgyeVNQaHRnVVRGSW9kckFHUFZwR1JzaVliUGtaNmtR?=
 =?utf-8?B?WGpHNllWQ1NHZlVWLy85VnMwWWltNmJwOFYzdU9TYUU3MlJ0L3Uvb3ZQaklM?=
 =?utf-8?Q?WvbKrHwx9PZcPprti3vhlVBTCulUsVKysOyEc?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2006939c-55e2-4b7a-9198-08de9637c129
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 12:58:54.2495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVreIttu0vUjjLzJFRkfT7csiHowwf8AXWg5Qy9BZe3QiQ15gK1allG+q5qqFyR7xvXrzg3bcqgz5ovdO9T7QLdCDwgPDXTM2vugJzNgWEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7805
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzCdv5NfSh7RVpErZRkOXrlQNjcBK4+mSTXF1ffHXIg=;
 b=E+6ifZRD37pNlsyERTg11HxGCblMMZj56oiAm30+3CdslcSVzNgGKxBwIKRZPn7E0m5u4JRD9V2hJrNV7TokmzLOUR0few+ddLy4X8YQxX8jKJE/pLVCvYXvcXQsRFOUz60pEL7I1gz93StCDguWD+oLAVzaJLMwktXWdaxHQLU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=E+6ifZRD
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH v5 6/8] utils/generate-cyclonedx: mark host
 packages as external
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

Hi Thomas,

On 3/11/26 3:04 PM, Thomas Perale via buildroot wrote:
> Mark Buildroot's host packages as 'external' with the 'isExternal'
> property. Starting CycloneDX v1.7 [1][2] the CycloneDX spec defines this
> property like the following [3].
> 
>> An external component is one that is not part of an assembly, but is
>> expected to be provided by the environment, regardless of the
>> component's .scope. This setting can be useful for distinguishing which
>> components are bundled with the product and which can be relied upon to
>> be present in the deployment environment.
> 
> This fits the usage of 'host' packages : a package provided by the
> environment and not bundled with the target.
> 

That's not my understanding. None of the examples provided in the GitHub 
issue match a requirement on host executables (in the context of 
cross-compilation). They all are related to runtime dependencies 
(dynamic linking, interpreters, hardware-limitation (which SoC/CPU can 
this run on)) you need to use with the binary(ies) associated with that 
SBOM. What Buildroot generates is likely self-sufficient? A Buildroot 
SDK is kinda different, but then the host packages wouldn't be external 
anyway since they would be part of the SDK and thus "internal". Do you 
have a different reading of the spec on this? (We just started to look 
at CycloneDX generated by Buildroot so I wouldn't trust my own 
gut-feeling on that :) ).

> [1] https://github.com/CycloneDX/specification/releases/tag/1.7
> [2] https://cyclonedx.org/docs/1.7/json/#components_items_isExternal
> [3] https://github.com/CycloneDX/specification/issues/321
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   utils/generate-cyclonedx | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index cbce3364de..35d8c72057 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -373,6 +373,9 @@ class CycloneDX:
>           return {
>               "bom-ref": name,
>               "type": "library",
> +            **({
> +                "isExternal": True
> +            } if self.options.cyclonedx_version >= (1, 7) and comp["type"] == "host" else {}),
>               **({
>                   "name": comp["name"],
>               } if "name" in comp else {}),

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
