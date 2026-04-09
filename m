Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9380DEA3C59
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 12:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3871560FCD;
	Thu,  9 Apr 2026 12:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyDSCO_9-Ks4; Thu,  9 Apr 2026 12:08:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5247060FF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775736539;
	bh=bx7e0oI1OKZPp9zTBe4PDT9Y/v3HqWt5lWdxoGSfAtQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=PNGEKAZCWSLAQEfviDuXfXt0Wy3loIFu+w7sDLJb0i36Rb5TnjuuWd1JICCgFe4A8
	 /DcbQ3QqEiRZ5yn2sCOeY6gBQ2yzJgvix1EMsEgsFZQ4x3E/kLUf+egAGCkQ7Zq5MO
	 B2nuf/gjHrXreEd/KAsRdvPSyQQT+rxqdBT/hXzSWTWJIZ5/hTJF5CUUIDxJUV0tDC
	 ohGPLxiAEH7eayQJOXfAtYbils5FknrEP1Zaj0dYSIT9ffcZfksZ9+gH3jXMPXqM31
	 L8s66rGYmKiClcXfnpFeFDHlaGyCOi8zmElvgp+luITVimWOROZ+FBmSrsRfVY/FuD
	 P09FYG6jfZ7+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5247060FF4;
	Thu,  9 Apr 2026 12:08:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3551D1F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 12:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AABE60FF4
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 12:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdVJJwM0P4Gb for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 12:08:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::1;
 helo=am0pr83cu005.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B710C60FCD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B710C60FCD
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B710C60FCD
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 12:08:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkQql20XUooQEAczmkwfG/05KMQI46+co53KoPBW+jGlJ/SKCZz5avzCateI1X/sjHU5z6veDcHShA5L1BHAclEMWRmoRNZX0Zp3/aSnaLM7cYVpSlufs/zK2qnHBqmxHJWggVvr6tA67Cv4dkhANUr4DF1ado9THGVwls+2nFvs0PHRCAg7fqpy0jYxu02cuk2DmdPid4Uz8qgymajXQIrmK+noWPoVOxMGjUpJ4OFiQgg5nSgs/5E7TYO4bxmolWJTgC+a8Ix0YGlyYTYWSDlu/Xqqaulo4wWDgm141Yc6tIUDzMz92+QOu4R7Dpo/JU2I2soNtqV3Qxg89/oUOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezJC0zoGzzA5xx4TL5mChLbyMNaL3c4LRYcodTM6o9Y=;
 b=iRXu35GT/VJXSnKJ/3RdUw8i//FRC812Z8CBJl6X5hAs7fj+1BZ2b9mqQXjcUizzrm+RthFnPJi48k/zm4BZIW2W4fxJMCBhrQ6mxIjvSr6ysGI+bkBI48WgsEIRQziDMig8ToOcxZTlOFJcWms9ibf1whw7LHZMbkABMz1ON+nGtcdW3ukTzbnqcTvUpeGPaeRoGkYbkeiWyI7ZKF6WYprWPcPowCSWtvR8JrCkB1ScuAWmWukYykZtttE/sxYMReVqg7C2rcRs8B2lQf50k7NpI5/5yl3RftX4iP2ptcu4P8Q0TaoAR0LQ4mR/QjtL63XoElhLEEzsUSliwuuNTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DB9PR04MB9645.eurprd04.prod.outlook.com (2603:10a6:10:309::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Thu, 9 Apr
 2026 12:08:49 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 12:08:49 +0000
Message-ID: <af55c098-2733-49fa-8d98-ffeb8072de94@cherry.de>
Date: Thu, 9 Apr 2026 14:08:48 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260311140457.140041-1-thomas.perale@mind.be>
 <20260311140457.140041-2-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260311140457.140041-2-thomas.perale@mind.be>
X-ClientProxiedBy: VI5PEPF00000911.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::933) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DB9PR04MB9645:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bc55ec4-1da2-4ced-5eea-08de9630c23e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10070799003|18002099003|22082099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info: iXJgR6HOnkGdquXgjH7/spVAtlil1+4ZzShISpIwp4bospcwv5mK6FqSXMc+rBwWvGMeO8pb/0PgV1ST8dhaC7aL2zNkpbTuK1ivOizLSPFlHx7IksJbOYADetVWtVKch+mTswXFnOdmFrPl2+i9jLcSCmo1eqdQgx49yBagc/Kg6/FGci4Db1PlaOULnFBRAFMTRtK5YMW5SazvrgiSPLTFuEmb8h7d2LbFl62ejneCjoa8xtGczfFumn2F3nE3KGzTDfOLQr16DABGwubscRKq+CfvPoQD2UAxJ8u1bQPEcpEWz9uzK6G+mtJeYaH5CMShovYjy3ZwTjxCIljmPz5t2GVvDnvLno6WemmDvx2bCkTrQKcM8Mzy84UoFSiPcn/vks9LAyTA5Z/lltPTEOW4vI/S7whhJGmZ8niaDe6xhwZtjwhslfeCR4I0zGsV7MTUknX5wYVd5Wj/3LSB1p7E6EuCD/yQDQeTqOi0d2WMrYi5QR9Da2QG3Gy/hLDNSCYxmCPxvM9iqV9lvUVnqxiOlacZxRtqYXFHqXS2kOV3ZmGcmQq1D2uBgOX7p9v0K/udN1r5J2w+z2K2oORrftPBP1bvlylWqBoRLrZe/Uh4mwNyezyjA7hRmiT0OnzjRN0mgrUUrR7gdxOD+fV40wz32HnkOQbsQaMepVDMwVy1odMDYja4bayvofhsDmS4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(18002099003)(22082099003)(56012099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUxlRGVXQXRzM1RTcHNGeEZ3bU9WKzJ4bTBOZzFqQTNsY2loVTRXQXpKZVBp?=
 =?utf-8?B?QTFxQnoxS2ZqdzdrWlZodjEwUlVqSVRBSVlvMEkxSTI4KzdMSHkwbk5ocUNt?=
 =?utf-8?B?cGUzMkZFems0NTNLMXdRMjlwbVJDejhRelJ6YkFVZVNpV3RGUXhDYVZFRjVi?=
 =?utf-8?B?bzNOcDhvbk5ldC9KcmJXaW4zZVV3WEhtZldYQzJqQ2FMazU0Z205OXpRVkcx?=
 =?utf-8?B?RDFqVWdwbW1Sbnh3WXQ0ZUpLZFpHQW02K0poeERPK3owTEg2ZEZWZjlsY1Ft?=
 =?utf-8?B?aUFEQnJIY0hWbStXTERWL3BPWlpkNGtRWVRDV054eE1ZMXYvQmw3elcwOW5a?=
 =?utf-8?B?RlMyWUVvbUdFUy9jT0ZNaDRJbEVZcy9zSnVDRERKSVVpcnZJK3FEUTdNV2RT?=
 =?utf-8?B?enNGemV4aWh6MWlCaUhBYXVaem1DaFpqYStxdmt4RFhWSjJOVWRXY3NKajZZ?=
 =?utf-8?B?TERuOGM4RHFNYmtKeThrRmRzVFVOUkRQOWFhSERZaS9wSE9qaVloSGJKVHYw?=
 =?utf-8?B?NlRhbFR0MzBLa2RrSmN2dmRJWUhrN0dJT3Avd3lNR1EvSjR2WlQraVNYZXUy?=
 =?utf-8?B?dEE1RlE5UG0xcHVBK2hvbXFxZE9pdGJzMmJwOWVBTUJyN2ZhRjBjQkhKTUFj?=
 =?utf-8?B?VjltVUJIQnA4WExJajNDYTdKamt4UkFiVmFzUUpXWDhvQkhmRFdoOEY0aEdJ?=
 =?utf-8?B?L2h0N3h5ZVc4QWVnbjZoUno5M1o4K0pGZWE0SjRTMmpRMjhQK1RoRFRyTVd0?=
 =?utf-8?B?bVdmU25ZVTRIaENuM0d2VTh5WGljb1R4S2JYMGQ4NEc2UmJUeTUzMGdsakJB?=
 =?utf-8?B?TG80UEZpT0IxNnlQK3h2MDZGenBpU1BqeHBrWEpQRlpXdUR6N1VCTWRoOVNE?=
 =?utf-8?B?OGVIbDhjY3IvOGJHS3ZFOUVsVUhMNzNSVG5hcTJxQ0ZKaXNDYlFLNXBuV1Q1?=
 =?utf-8?B?dE54dld2MjZWMlBucXIxMFpYQVY3S2xaQXhXb1RTMG9MeGFqSlIzR0gwM1lp?=
 =?utf-8?B?TUczUFltUEZJcFprY1REV2lGeEVPVXdYZDNadHNZSjVZejYxWDJseklBOVZk?=
 =?utf-8?B?Yk9zeEYxNkd4UjNiaVNjcGYvRlhvWFZOQ0FtNmRpT0VydlEzKzR5Rkdwa0hF?=
 =?utf-8?B?bjJNVm84ZVJNeUQ1aC9rblRaVHJVQ0Uxc0l0SWRUSDZwbmovWjVBcGdHaUhv?=
 =?utf-8?B?S3NGdjlSa1NVOGo3dCsrTS9YMW1SNElVVEVSSnI5UFZhNUtUOUlwQlF2YllD?=
 =?utf-8?B?WG5FdXR4b2dWb1lESmZsRmhsUHp3OXJwbnd1WVdYSy9XLzZWYUNGV0RtL2pH?=
 =?utf-8?B?L3phNUkrV01FNUV0TlJmY2dTbFBYRXkvYXZ3ckhwQkZ1TlljcUFhREJwZHJJ?=
 =?utf-8?B?SW9QSmMvQ2JPZEJYT0IzQ2lqU2YxRE9tVVUySzNiUEZGQVEyenkwRWcwRmo1?=
 =?utf-8?B?dlhQT3ExRkhpdnRFTWV3d011dGF1R0Nad3NlTWR2ZUl4VTF5TEpkanl2M3F0?=
 =?utf-8?B?bjUvaFl3TGFkYUxmb2xNSUUxOTY3dTJicVc0Mnh6b3dORjVnTWJWckdLY0tC?=
 =?utf-8?B?ZkFDbjgwZUVkMG9Ic0wrbm5MY1dTTmdibHF1SUtoZTlBR0lwYXkycHZFS25k?=
 =?utf-8?B?UEg1V2w0OUdFdm8zYldUeldnRm10a0N5SjdPbTdnYzZHWFhBbVo5d2JPZUJG?=
 =?utf-8?B?NnNRSFl4TFQ2Q2lkUUsrdnhWdmttajN4V3NTSjlkT1Ewc20vT0ZqM1dFOHJq?=
 =?utf-8?B?VHpkeWgyNWJsdmlZTm56ZTlLLzFsQUFKdFp6bGpLd2ZWOUh3UUZqSHhQN0hp?=
 =?utf-8?B?QmQwTldmY3BETTVIdnp0dzlxMDEwRURmZE9CcGQzRDNoSHpaais1eGxlQUps?=
 =?utf-8?B?cytKeFhjZVFIRmppMzAvak5pUHlRU1E5djdPZU1hWmVDVUdPa21EelVNZWFl?=
 =?utf-8?B?VWJTVWdKTVBLeFZzS1M3ZmVpL3NHeGZnbTlDdE1pYzNYbzA0dDZZdVlQOHd6?=
 =?utf-8?B?Uy94NjUrZlBoeklTZWw1QlNFdlE2aVdmK2ZuV2xMbHlrYmFGRngvNmF3b3JX?=
 =?utf-8?B?OUVNSlFINlR5eTdrNnh3VmJzM2hqNzdoSC80ZXBOeHpZc1h2RkYwY3BQeFFC?=
 =?utf-8?B?bllVZ1JxY1h0SnU0a0Vmc0Q3ZlZVU2lQZGNraTlKWkRkSnZHWVJEZWkzS1NT?=
 =?utf-8?B?RXJ1VUR6UTYvOTQ0bW96U1ZLSERKdUFUbEdUSFAwWlB5WnZ6NEMrc2xkT3Bl?=
 =?utf-8?B?bFB2VHdoWHZxOWJBSzV3Sk5GNVJUQUFHajdaSlBYWGN2UVRTL3dGd2RsTVhJ?=
 =?utf-8?B?dytiU1VSMDAxSFRqRE4wWGVlZm5uU0IxenVBODA4SWxjRkRwVWEwdnNaa21X?=
 =?utf-8?Q?3AdYxv8ayKpkJkrK47asQFR8DyxC4Cs84iSwv?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc55ec4-1da2-4ced-5eea-08de9630c23e
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 12:08:49.5988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4BUvCYYdDWpbmg4wzx1eovlD92dDRdASwQjwTBG1AVgySn9It0Dj1v/3akpRNJDOnhbI9BGlVodxmqEBG772yPBGyJGw5mAJo+ZQB8TmU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9645
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezJC0zoGzzA5xx4TL5mChLbyMNaL3c4LRYcodTM6o9Y=;
 b=MzILjt7POX9rhGQntrmNZfoHhrpKklYUXNXOKU7AvTea0OhFTMBGr11ruqvPqVFXCtw/S6zwGNM61dIFAFyGl7P4TKumDFTrS06hFkTrIysg6MP/4IOxx9u4Eo7ltpaYhHT4JJ1ZYdwwDGqckspG8gG95ySMlpqni+97LFRUn10=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=MzILjt7P
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH v5 1/8] utils/generate-cyclonedx: use tuple
 for version
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
> Allows to compare different (major, minor) version easily.
> 
> In next commit, an optional newer version of CycloneDX will be
> introduced and this syntax makes it easy to compare without introducing
> a dependency to 'packaging.version'.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   utils/generate-cyclonedx | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 2b6c6d63d3..eff55bf598 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -20,13 +20,13 @@ import sys
>   import re
>   
>   
> -CYCLONEDX_VERSION = "1.6"
> -SPDX_SCHEMA_URL = f"https://raw.githubusercontent.com/CycloneDX/specification/{CYCLONEDX_VERSION}/schema/spdx.schema.json"
> +CYCLONEDX_VERSION = (1, 6)
> +SPDX_SCHEMA_URL = "https://raw.githubusercontent.com/CycloneDX/specification/{}.{}/schema/

How about generating the version with

'.'.join(str(x) for x in CYCLONEDX_VERSION)
? This way, we support when there are patch versions as well (1.6.1 
exists after all).

Maybe a class for the version would be best, then we can convert to 
(__init__) and from (__str__) the class to a string and compare two 
versions against each other (using tuples or list for example; 
__eq__/__lt__).

Now I'm wondering whether the SPDX schema version needs to be in sync 
with the BOM schema? Because while there exists a 1.6.1 SPDX schema 
which differs from 1.6 SPDX schema, see commit 5f3ee8066491 ("Updating 
SPDX license list to 3.24.0."), the BOM schema too is different but it's 
kept under the same name of bom-1.6.schema.json (and the $id is the same).

Also, are we validating that our SBOM generated by this script is 
actually CycloneDX version X.Y compatible? Should we download the 
bom-1.6.schema.json and validate it with e.g. jsonschema?

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
