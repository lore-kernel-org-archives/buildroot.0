Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E76E9905C
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 09:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 149C640D5D;
	Fri, 10 Apr 2026 09:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W0Ab_V_c1yk3; Fri, 10 Apr 2026 09:12:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4255940CEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775812356;
	bh=jQzUdGNXbWO5nwEcr1XYq1GVh+vF1/n5hceD6Jaov78=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bwex4aOlztT5ZSB/3rF8ecPPP4rO4egppACsDJrU2Mlw2UWRDCc/1zbZr4PYCacL0
	 qRC1B9/2q21ss5v9+/eB9z5ZB6L4uN8w0kinLwyuHGT8XQoNbLKyHN2WqPgGOsie8B
	 q3HjCjlL6Z/gHR8cFk1ewVGT5vmUFz/tSx6sQB8mq3q/88fFHN7uxHnOKcCOv51n/2
	 17u3XZ1n2alv7TlPq/txRmi+WnrduBrxWdfYk/o4foRQQ/dCrdYLofgeDjNPaE/UW2
	 l7ey09pEHkiwtBY0iMeDyZgSmv3I22D4uZIYR1RE+O2wnXqYO8L4uM0exVkq8YdnSk
	 yGa37kTH+zHSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4255940CEB;
	Fri, 10 Apr 2026 09:12:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FB47194
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 09:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FC9640CEB
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 09:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7I7r7EhAEpGY for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 09:12:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::3;
 helo=as8pr04cu009.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1398D40C86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1398D40C86
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1398D40C86
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 09:12:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QdBRoF91Yn7ldhksnXCxLngkRbNfOZYjCvnfCYa1BobI/5cAN1H1jqxP4TEHfeS+4hHXKOV/vRe6Tc+ZNX7WonI/CzzGkAFf4CnPm/XuFFrg9M1Rp2/wRLPOoVI6JmimI/2EC+goLjGvULK9Ia3m3g7gV6xM6KQ3JqFWWVKFidGpf9fFiC4EGOVb5zxN6jUWZJXHHdK4wNVpXNYB3Z3PtYHh0sXsmVeTY+Aq+VhdcWG4RfJPlTQabEAswRiKhWeI1sJMVN6hb2vY2CVqV0f2uGgThSFOPpeHVwnJ5XP6eWDhEpv1QE5Ze/GpVhRuOjZP2JFMrA6fCQ/18RDomTZpFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HK9az5EfJgHtAPQ7rv5CWFNe1Md7mdHBzrKmqmskU/s=;
 b=Ce3bVJE5YCkhJ99tJYaLbnfiF0HeD4WrCnbnb4x5rXxd2RkJ3bQaYWDGeTBXXGVfCQG6XNaDvgT3iEXz6aweDy22W4RILfD2Et+ZKHr/0y3qCqSw5w4IYZ18qKOobMsR+n3TN1oH27KF/12kKvr0D0uT+ux2Gg6Hq69tbJ3StXPGRqOYVD+D5JAwsoNCYm+3e3hPEoszx09I3A3fCt82zHTILgoLraM2OPss9UJKuNZghWcnPrwVbJyH9FG8uzgoIV4L/5huogUN/pRVyEzWSw3SW95qPqyqEuE1eS1Vbc4jixrlCZ4L2VjnYqZGE0D0roNsgCDAH4yYnLZXhU/VbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DBBPR04MB7785.eurprd04.prod.outlook.com (2603:10a6:10:1e7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 10 Apr
 2026 09:12:29 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9769.016; Fri, 10 Apr 2026
 09:12:29 +0000
Message-ID: <bd0f43c9-ebdc-4717-b8d4-783ec712bed2@cherry.de>
Date: Fri, 10 Apr 2026 11:12:27 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>,
 Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org
References: <de0bb761-ca88-4bc6-8d7b-6bd14e9d1cbe@cherry.de>
 <20260409204208.302842-1-thomas.perale@mind.be>
 <386b0af2-9193-4479-8b50-79c7da2d3853@mind.be>
Content-Language: en-US
In-Reply-To: <386b0af2-9193-4479-8b50-79c7da2d3853@mind.be>
X-ClientProxiedBy: WA1P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::21) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DBBPR04MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d77ef0e-a3db-49d2-52a0-08de96e14a1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 4fl3z9aDsow8yqRUfJV+c1DloNav9O8uV1szlmNV67XmyXH9fAq7Bo2Q69tWZLthZsh8pmTd9CpGQ5DRC9Hh8j1UcuiQngySAp6SfhKjne3GOzmR4RK3SPecti8siNQYA6q/R6g9zG8kYAB2XCNGeCqxnL9ZmwTs5V5bs+OJnRz5FPIgHbwTQWvbCcHp0UOLtBtsgq+t0a60Jkd72fITQGOJncHmiIBVn6MKoE/hRDGnkOHlovqXKuupV5QV1ku5DjMYdWVeo3Gv3UZXDoZjvCKayPa2Kfm5RMOhN60fNu+wxtAZLbw1aq9SPp29Rpv9ixj21NIDTEcdUbq5BuxzucU0zTLt7fPKBFhqMRT2EUApLdw82zFXlb25P5Xl+I+tLuyzE1AaDVJzFinweihqA+FxK0CObL3EJZpuJeuwIXUE/cHbDIeSz6Ht7HlirBt5hRlVtP/KwaqiuJ7j2uiQtWnofwc6DIvfz4KBNN4b4DF5F/CEjKw6tV61sLFHjGZoSoGeDx1dUXl/TQ/38o2xDuoqH6WZcxYdybdw2SqPbPM5HzGZGkIT0EFTmrDga5Ftb0PNynuMwGM+dyqw2fLAgP3cQzU3IiT3e+WduZ96sL9VbfUNtBUOH0kA9GfIIEIQ8aMUYQYfs8x3JrO2vvkjIBpB4aVrhC1dARr41TG1KAqBJGAsfn+e+p2MeiGaUtPCivhtq48Mys5sHvvLhFm6heHqt+sWyBgpZBMylwd6liA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmNPQSsrREtpYW9seEN2aFRTa1M1UGllYmF4OTd0L0U2NHdhM0pDVm8xUGlp?=
 =?utf-8?B?OW5mSkxUSlBMdk1BRE9vRUthSGF5R1VBQUZuMitvNnBvOEkwd0gxR251c1ZI?=
 =?utf-8?B?cDdOMnNhVnMyMVBXZTVxS3owbEVBT1VTSHRaRnFyTmt5bC9lWUFicHQ5SlRB?=
 =?utf-8?B?WUR4TlJzUFZXSTFFWnNiSU5UT3JrcUVrK1FhTTY1ZmZPRGxpaXE1UjVoV1g5?=
 =?utf-8?B?MHVYMXlIQ3QrbkpXWDJPdGZmK3hPUG5RRHp2ekdmcGIvbkxDUnpmdGROanJO?=
 =?utf-8?B?bktRR1YxbkdjaU5JeEVkMHVoMVloL3IyU3ErODFCWGNLOE9vRTYxWE1kRmxW?=
 =?utf-8?B?MGd4QkhJYU5FRm5hcHYvNEdxbkltTjMrb3pTendvRVNmaUR6ZTgxSWhZSmVh?=
 =?utf-8?B?TUV3NnRxZVpka3NLMmxzOTRjZ0REWnl6YThsSFZOS2g5QjJra3QvUWVMa25N?=
 =?utf-8?B?MmcyU1VRd1IyQk9GQ3VLb3hhU0d5aHZPS0o2czdlYTBJS0hMekU1KzVGU3hh?=
 =?utf-8?B?L1BsemttaDhOSHMyeHc3bkRXT095cE1kbVB4OGNSRzN0RFFySmFETGNUVFdu?=
 =?utf-8?B?dkhwNHNWV0RMZW5Md0gzd3ViNzNoMGlxN0ZKdWZadG9YZjdpTlRlcUVGSkpC?=
 =?utf-8?B?L1NQM3ZSSVNySThJa2FjMlFldGJlS1NPeDg3QldtNExrckZOcWVMc05ZOUFJ?=
 =?utf-8?B?RG9yMThqWHF1Z2dJVGFCdlJLYkQ5Sk1MUk1VOW5pdkFkUXo0M3oyVmtpMC9k?=
 =?utf-8?B?TWJ5QnpHOW1vK28raXlXbE5PczhNaXJXVHpHUFhOTUZpRHBCclB4bEdQN2I3?=
 =?utf-8?B?aURLWUhtWEVVOXQ1UGlYb3NTUjFYeEFmZVNuOUpPclZQWlRzWHhyYnpmd2h6?=
 =?utf-8?B?d2dvS014MWxmckphS0YyYnVTalZuUHV5QmlCa1JzcFIzM0x6KzQvSjhhYUQy?=
 =?utf-8?B?Z0o1dkw2V0RmbVRsOVZxT0p5ZUNSVXpjWjdqY0MwdlNqdWR2MjYvU3FmbWwz?=
 =?utf-8?B?S3ZSZE4rNlRxOEVpMExSSmdpQXV2Z2g1UWtjU3p1RUh1QlFOeW9tdU5neHFY?=
 =?utf-8?B?a0psVU84NTd2dEJtSlM2bmVTZlpKNW1LNUNuVCttS0JMazkwdTRpTDZZUnVC?=
 =?utf-8?B?aktCMU5MZVp5SWFXMXIrZHAxNFlNeEE4RHkrTTRMUGY2aHZrYmJCTXd6YVpO?=
 =?utf-8?B?Sm4rWkhxLzE3amhGS3poMThCRlNXc3ROeXcwMjdicDZ3QUo0WVIrRmhjLytI?=
 =?utf-8?B?SkFTM2d4V1BKN0RuOUl2aDM1KzR3NFBCQUhxV1FzYjlnejRqN1Q0c011anpQ?=
 =?utf-8?B?V2JTK0tzYUYva1FwN1RqQmFxR1lEZ3ZmK3U4Lzc5aGI2NHRmM2w5bDUxS1Ni?=
 =?utf-8?B?djRJZnB3M3Z1dDFwVGJKamxZQlB2NERBWGVvNXRwdnAvV3Z2aXZkMVgrWHYv?=
 =?utf-8?B?N2NqdTRKUjRMekFUVHYzMWhYU2JwaUJEYWtsci85ZTBNWEhoUGRRTGVBUmJV?=
 =?utf-8?B?czQzQjJlb29RSGNUM1lnVkxPU1J3eEpZaWpkcy9WN0ZNMjZiMnlCNFFVbG82?=
 =?utf-8?B?WGhWOU5rSTlyTlpKWnp6WlpHSVhGdVFGL3BBZHhHemZKU3h5SUIyc2o3cm5N?=
 =?utf-8?B?ZnJUVS9LUklLek5UaTBpOUpRM0hwbGt1RWN1dnhtckpkeVB5am5CNXp3V3hu?=
 =?utf-8?B?cTcxU3FqbDRUWnJpeUd5WVNQTGx5Nm0xaUZZVk5TcXpxQzROUlZwU0FkN3E2?=
 =?utf-8?B?SllKTnRORGtOcHFzZkJ2VjBBU0FuVXBmMEJQNUNxTE4zSStwa0hycWhHSDJW?=
 =?utf-8?B?NmJScUlkNDYyZ0pES1UvUUZMeXhDL21hY2p2d2RNZ2VVcTNiT1dBUGMxWDVl?=
 =?utf-8?B?VTYzdWZjVGF5UEFHUi9lSU1qQzdiTGsyZVZHeG5VcFRQVVpETUR5TUV1dm14?=
 =?utf-8?B?emtjcGpMTUpCWU5mVHp6TVNBQ0F0T1ArSkVxMjhzZXNaYkJkMUJlTXNYVDQw?=
 =?utf-8?B?cXdIRWljS04xRjQyOWNoK21kZGtydFFXWmUwbElFSjM1OExhS2tHaTdYeXJo?=
 =?utf-8?B?RU5RbjlVT1lYdFdXQ01maG1IdmJOSCt0R1phZE11Wlg5MEYzeWUzSWthNXpN?=
 =?utf-8?B?S0MvQSt4Z3IvVGMzUS81ZUJ2aE5ISTBHaWFVQ3llNlVYS0ZaQzMzYUtmaUxD?=
 =?utf-8?B?NFk1RzdYMlpVYTJROFNEOUF6VHpMTkpueVQ4bXFjajJYeVZOT1YzNFhZTHZj?=
 =?utf-8?B?dWhJWjJGSVpGVWMrclY0dHlhWTkwcWxWMXBJNmwxdi9qL0tMdFR0aWdWYVlr?=
 =?utf-8?B?Mkk4dUhobDliY25vdG5xaUVSeUNJd2ZraGVWS1Z4TnMwWllQM2ppTFozdmJZ?=
 =?utf-8?Q?QU2N7eKnbXKdP95oevLmZVZFvuiHePTZ7SQ4H?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d77ef0e-a3db-49d2-52a0-08de96e14a1d
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 09:12:28.9925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7MrIi3VL1kGZ5mFgr5htg5RBLgJvEKMHbe7lZDx6T7aVUtYuqyilo6pHWXFT6ZUKSYjhPpOK1bTdlB5O4HlXGmkSF2XObyQC45uu/AGSBy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7785
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HK9az5EfJgHtAPQ7rv5CWFNe1Md7mdHBzrKmqmskU/s=;
 b=B5sNfnZRD9lLlicw+1h8RVjpuUJVRbg7nxuXwZ+hUAxTnNlysiuRpxhS4+s4A9sZ0U9xhFb1MI1bF3ne9Wv2Xy8pbwv0U5tN71YLz4NB7ZuTT7x5mNgzcpy/6iJLrSpjx1rIn4LPD2HKoTLVqcENGmDw4Ycjxts7ekPzzE8iEbM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=B5sNfnZR
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

On 4/9/26 10:43 PM, Thomas Perale wrote:
> Adding Arnout to the discussion, we briefly discussed this during the 
> FOSDEM Dev Meeting. Maybe he can share his point of view as well.
> 
> On 4/9/26 10:42 PM, Thomas Perale wrote:
>> Hi Quentin,
>>
>> In reply of:
>>> Hi Thomas,
>>>
>>> On 3/11/26 3:04 PM, Thomas Perale via buildroot wrote:
>>>> Mark Buildroot's host packages as 'external' with the 'isExternal'
>>>> property. Starting CycloneDX v1.7 [1][2] the CycloneDX spec defines 
>>>> this
>>>> property like the following [3].
>>>>>> An external component is one that is not part of an assembly, but is
>>>>> expected to be provided by the environment, regardless of the
>>>>> component's .scope. This setting can be useful for distinguishing 
>>>>> which
>>>>> components are bundled with the product and which can be relied 
>>>>> upon to
>>>>> be present in the deployment environment.
>>>>> This fits the usage of 'host' packages : a package provided by the
>>>> environment and not bundled with the target.
>>>>
>>> That's not my understanding. None of the examples provided in the 
>>> GitHub issue match a requirement on host executables (in the context 
>>> of cross-compilation).
>> Couldn't find any example that would suit the Buildroot case as well.
>>
>>> They all are related to runtime dependencies (dynamic linking, 
>>> interpreters, hardware-limitation (which SoC/CPU can this run on)) 
>>> you need to use with the binary(ies) associated with that SBOM.
>>> What Buildroot generates is likely self-sufficient?
>> As you said, I think this property was mostly added to support 
>> dynamicly linked libraries.
>>
>>> A Buildroot SDK is kinda different, but then the host packages 
>>> wouldn't be external anyway since they would be part of the SDK and 
>>> thus "internal".
>> If you need to create an SBOM of the Buildroot SDK itself indeed that 
>> would be
>> a completely different "point of view" for the software and would 
>> require a
>> different logic.
>>
>> Is it something you are trying to create ?
>>

Nope, but I think it could be important (though not sure 
generate-cyclonedx have a way to know whether you're building an image 
or an sdk, or even if it should). FWIW, we strip our SBOM of the host 
packages. We weren't asked for an SBOM but for versions of the software 
running on our products, so a strictly valid SBOM isn't required per-se 
for now. That may change though. (we also duplicate components for which 
we know there are multiple CPEs, since CycloneDX has decided to not 
support that and there are multiple instances of packages having 
multiple CPEs (arm-trusted-firmware, optee-os to name only those).

>>> Do you have a different reading of the spec on this? (We just started 
>>> to look at CycloneDX generated by Buildroot so I wouldn't trust my 
>>> own gut-feeling on that :) ).
>> As you said, I don't think they have taken into account the use-cases for
>> build-systems. It's mostly an interpretation of the spec that made me 
>> add this
>> property.
>>
>> I saw other implementation use the `scope: excluded` property but imo 
>> it make
>> less sense.
>>
>> According to this discussion: https:// 
>> eur02.safelinks.protection.outlook.com/? 
>> url=https%3A%2F%2Fgithub.com%2FCycloneDX%2Fspecification%2Fdiscussions%2F712&data=05%7C02%7Cquentin.schulz%40cherry.de%7C571d171992b84ec86a4208de9678ad6c%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C639113642214259479%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=gl4Nx2Id9MjfJ4DfXvVVlmfhhG5xxqVkhAqnGzrCcL4%3D&reserved=0
>>
>> For `isExternal` they mention:
>>
>>> This setting can be useful for distinguishing which components are 
>>> bundled
>>> with the product and which can be relied upon to be present in the 
>>> deployment
>>> environment
>> If the firmware you generate with Buildroot is the "bundled product" 
>> and the
>> build-system the "deployment environment" I found this property to 
>> suit well
>> our use-case.
>>

I don't understand deployment environment as being Buildroot. I 
understand it as being the device where this runs (hardware, OS, shared 
libraries and external binaries linked against/called at runtime). So 
the target device is the deployment environment. Deployment environment 
is where it's deployed, not where it's built. When I say "I'm deploying 
to production", nobody cares from which PC I do this, but to which 
device/server I'm deploying.

>> For the `scope` property they mention:
>>
>>> "excluded" - Components that are excluded provide the ability to 
>>> document
>>> component usage for test and other non-runtime purposes. Excluded 
>>> components
>>> are not reachable within a call graph at runtime.
>> The "other non-runtime purposes" part could also suits the "host" package
>> definition I guess ?
>>

This sounds like a better match for a Buildroot host package. Though the 
comment you referred to uses both .isExternal=True and .scope=excluded 
as example. The question is where to draw the line... As far as I 
remember, some host tools are not built by Buildroot, Buildroot expects 
them to be available on the host system. So, should the host system be 
part of the SBOM too? (Of course, that's likely outside of Buildroot's 
scope for generating an SBOM).

>> It's all interpretation so it's good that we have these discussions :-)

Maybe we should start a Discussion on GitHub about that? Yocto doesn't 
have official support for CycloneDX (only SPDX) so not much we can check 
on that side.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
