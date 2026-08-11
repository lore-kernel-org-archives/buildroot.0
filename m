Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D08C5CFCF
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 14:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A598F407D3;
	Tue, 11 Aug 2026 14:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W6Voijq0Pa3d; Tue, 11 Aug 2026 14:02:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E34D140759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786456924;
	bh=4QQpTGTVuMBE/Ml18nQlfjl5pAN4EFpPZI0Z/jS+aBw=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=bIHZzoEzFlh7Z6WHJXpdF2hb6sB81nMLUyNLOohkr8EW4yKD0ANkBtunSJNPAKNxP
	 ZGqain/+AKbJ16cj7icHlrVqmq0k7oB7zwXdv2z9O5IPr3LgTjVgKgRH4MQ9J7xk1r
	 NL7TKLotikhM2TSS8ALrivs7z+Xs5aRHXsWqLPveRNVaFr2IwFxrh/HhSHRNrS4B2z
	 yJrJv9BgeO0o8UV6exPuKubfEq6dJXpmFIm6cM/rgUXJ2ytaQ79Rf7FJA7A6RbFABA
	 ZJIlF4iMdltD51sk3qn+7z95RP6WjUlueIhFl6NLtRiP2+8g+1rcraUXGsOxMGOOef
	 n4Y5jB7XnZLOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E34D140759;
	Tue, 11 Aug 2026 14:02:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C08A28A
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 14:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E5B080F94
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 14:02:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pe4Bv5HCLJoY for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 14:02:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c20f::7;
 helo=osppr02cu001.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8154480F91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8154480F91
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20f::7])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8154480F91
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 14:02:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZ4PYnJKy+blJd+WY9EySNzptWEzhReLjoZmmLe2FtGvf9ylnMtMzofPzTTXMjOMPDhhlMpXCWu18FKgVJu3rVuR4oqi+hUUH0j0TmRqdBMdxOHgKmb4t1bEWD0nIKFXnYLvdnsvjKYmfaKBcxJiwY4oLi92HRpfU/sDqgZG31PvJr2lErcGD9fGPXQ/cP2QgCBVtrBo0Yfn6Apm7N54NaNstIdESL1SkeX81YZ7QK23sOdkQ5WHuFYHngV0+3FRpRiRh0ohSAajjCzd7oxhz4D4AVB4PJ5aritnxcrBcCtvENlnVvYK4hzMd1IpCzSQQ2uFMNxcO6+bdHOzrb2bjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQMNW2Z9O6PczSYhbpHuv+cFEDyS00QH5Z13UNVkNCc=;
 b=jv+0ntHIhCEfobt/Ubgw21x5o1vT8ZFlhaLFjMM9xQ0BgoU+dB716nT/UU/RWT8AEZC49jOwscRtbsbDdEiwa3kt7t9S3fjDJcF6GflE/V97y8vyxhEvzJZxWZxcioAOlZABvRGGzzBI4E4R6jwCTs+EpkbpMZvxzm0iPEANaOmBD4MVxgL58k50R41MhTLXbolsuTdsMP0BgojHOFhoCO6Gh6A2GjiG8tD42cPz5J4pEj5JaQHxo0BEcWTnGJm9+H/6LcpynY54MPgs7I4mARlUxa+gXCo2WzxxvJa97I35nTbmiuvOQY3LgqtyOmJRrmOQhyx1r0e879A9Rb3kTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by AS4PR04MB9291.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 14:01:58 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 14:01:57 +0000
Message-ID: <9b001de8-e54b-4542-93b0-ce5288dfe54f@cherry.de>
Date: Tue, 11 Aug 2026 16:01:57 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260811134312.170306-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260811134312.170306-1-thomas.perale@mind.be>
X-ClientProxiedBy: AS4P192CA0006.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::7) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|AS4PR04MB9291:EE_
X-MS-Office365-Filtering-Correlation-Id: aa853074-2904-4830-6a6e-08def7b11b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|23010399003|366016|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: /bxNH++OM9E2RL2rhxbWSQWmk8DgA8Xz2B360H4v8TR34mC02YrhtcsuU4SMrznKvPBQLE3LXbM/Z6swDKpDbijHikcXVgzul9Da1sB0KVPE1diVxQHjfhHj/MYP3vUc2hYpiakqYrfwDtOuoJWXcQyvH51pSz+LJhuiCuVYMJXMpuiPNkr8WWNhrfh4X4nyXwyGV5TlpU34XvTeDq+1IyRhR3UrhPQfWnZmRAfBI7FqT5tjXN9FYpcxdI/M+yH7m/Sjzi48fgBd89XOQ05L2qLPGJL9KvXWyO1qQDgtHRCmR1uAHRHJHTgoftaOwPcTENRwx/Myqre6S3e6/AsW0FsuR4WsnjGv7bRSxuQgZIq06hAzeVXPLi3SYp/oaAZe/W5tJn6CDhyVx0An7gOc8TPpYaPUt9fLbv0PkXH7K4VP/TfHY83zHfilD8fqerMV22BALsbZE67oLQlxmFBzk0omVZoqeMw8/J686LfuRf62Qihmi/IYhUXjwUHpwR4HEfrC1T+88agxKHH2x3Gpd7eiwYgwhdv06wgjErFzssWml+LrEzgCgcHMKhUFExV7uC2614xmnkE+q5WkNO1NcKc94YfYtWLnrEHEE72vyhGVugkKL7ICdcUBBoT6KrXUnbrECPepCmZjyU3ziN33agBat5bEvFS/kKlP9tHUWtM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1VnaXkzaVgwSDZmQlIvdmh6WVRLM2Iydjl4TGpoNXQ1ZkpieXl6ZlVCbXVI?=
 =?utf-8?B?R25OczlpZjNZUmduUVZFL0NZeERJTXlYa3VtbkFiTzZ6dHFqL3YwYmJlRnR4?=
 =?utf-8?B?WTRka2Q3akRNeEtPcWVUS2RmUXR6Qm5iN2dOWEJLVnVaVHhmZlZlMVkzUnA1?=
 =?utf-8?B?enNNdVIvT255Nk5JVVVLMm11ZUFscFAxUTE4bmZiekVWUGhoYTUvQlllanA4?=
 =?utf-8?B?ZnVLSFNOd2dVUXpzUnROWmtMQThXaXozTTlTZEZTYmZRY1BRUlFGRHFFVmJ5?=
 =?utf-8?B?aSticGRxWk5pR0Q0V0gzNit1d2wrWTJNdS95RXVsQnhoZUJkVWs5L0ZCbVpi?=
 =?utf-8?B?cnNsYkpiZElSS1RRcjZmZUJBUmQyeDFOYnJnakpmdnlDT3FGemhMdmF5VFFz?=
 =?utf-8?B?WUIxZkwxeDFMRlA4S2xKUXIxd2drSHdxWExkYkNxL0x4WjRKR1lwekdSU1dv?=
 =?utf-8?B?d3RYMG5vcFlzV0pTM2MrUnU4UG5Cai9tcE93V1pIaGpuVFVjU21jN2VVKzZQ?=
 =?utf-8?B?bWZlU3pHUjZsYk5heW9CWktnOUx5ZTFnL0tTT1NJbFduQkFWY3owL29ya1l2?=
 =?utf-8?B?TWpGMnQ3SjBNWDlvbDh6K3BpTWw4bStDb29yQ1hITk1XeE5hN0Q0UmkzVVlN?=
 =?utf-8?B?WHdvUGpTOTVIeG1oZWZXcGQzWjAvRnFaRE95T2pUUlZBTGZ1V3JaT2VRNFJn?=
 =?utf-8?B?UktlU1J1dmFycDZLTlU2MDNtbDU4eW55NlBodjE1ckt4ZjVGNjlWWDByZlV6?=
 =?utf-8?B?c2QvUE95SC9ZYUVwTkVhZk5YU0RlVDdlcUVEMnQ1MG9nbktQVTdUbGg1R25u?=
 =?utf-8?B?enYyQ3BWMUhicFlJZlliT1paN1lLWFBkZHZpVG1ISUx4cjI2cllSaUtCMXQ5?=
 =?utf-8?B?b3hMRExLUDdRaE0zVGk1c3U3Mk5xZVhCVTJPcGs5d3N6V3FaTHd3eTBoR3k3?=
 =?utf-8?B?M3VBSktpaERzUFYwbkRXYmREK2JpZTEzTkMyeUNsM1FQaXFEZmZ3V3lXcmZM?=
 =?utf-8?B?OFBtcG5FSm8rNGROOFc1VGd5aUhIZTZPQmtWb3pKaW5zYjFueFBsdTJRN2xE?=
 =?utf-8?B?Q0NMajh6VnFTYWFwdFJLL1pCaGpFbGZ1aW4rRG53MnNUcnNOTmNnTC9FeEdJ?=
 =?utf-8?B?MTNZNExkQkdSN1hpZXlFaXRBUnhmRU9yY3FuWVBpaVhvZUJSNFlDbis0dzBT?=
 =?utf-8?B?YWQvbXRsTDFOWTNRZXIxLzFpS3Y5OUMyYWJLQmJJbEh6OHhoQmNOUlUwOURM?=
 =?utf-8?B?VEQxRlRnV0s4Mjg4WlU2cFJVR2o2N3U3K3NZWDg3bE8xd2FHTGwrOWtyYmlH?=
 =?utf-8?B?RnJiU3YwSmxkYjhIaVBzeURNZ0pYdEJ0eU5OVG1EUHJhQkpPY1ZUV28xS3BW?=
 =?utf-8?B?MTB5TU4rYVpBSEo4RlZOejlDZXpOZytIcDNjMHBQQk1OanBTUWwwTnJQdm1Q?=
 =?utf-8?B?bWRJNW5MUUR1MG9IaDRpOXpzT2dPTmlhM25YSnErOGJid3FVY25lS1BuNEpZ?=
 =?utf-8?B?UEUvSzRtblhEaXg4MDJjam5QQTZKc0pVNm8vZUhTeXMwWkVoVi9ITVQ2YVNX?=
 =?utf-8?B?Yll4RTMxMWc2VGRDVDV0RW1KZFdMa0hzUHBIV3ZXcmtwL1h4K1I0Q0kzbnNL?=
 =?utf-8?B?MmlsemJzaWRtRWwyUWV3TUdMM0lkaWdQRk9DVG40cDJUQmkySDlmd2ZBVllh?=
 =?utf-8?B?My9uMTdBS1EvYUd3OXRqNm1qNndndXkvYndwT0M5T1NjZTUwWmpEZkpNb2hB?=
 =?utf-8?B?dktNYjVIbGpNNWNBVE5DNmh1ZWxJNy9xa1ljZDZDbmk0MGdOM1ZMQVVnT25k?=
 =?utf-8?B?N1d6b05ybTdmbzdSeEF2ZmltVytqNnRRQVNjV3EzbHFxOE0wbWEvWVBORTA3?=
 =?utf-8?B?RVNlNTBweE5oYzVJZ01VMGhJMmt2dkFsN0hQWDd5NlVVbmVaUkNPZzVja3ZM?=
 =?utf-8?B?d2laUGlUY3ZNRDNuZzRSTDlNcnUwNDdZcXlxbWhlc3ZUQzc1dkV4bEErbndv?=
 =?utf-8?B?d0NmNnlXcEtDMmZVN05ERkZGZ3dOT3A0Ym5tMFdCdnFCeTlPTHcvNW1kOTEz?=
 =?utf-8?B?VUFrUllEdnpyNitCYUVKN0pVblNDVnByc051Zk5tQmh5QUNSS2g2Z3FBVEY3?=
 =?utf-8?B?MDhzK3BFdHFFb2R1NHltd1VrMWdoa3BGYUI3dWV4UFBiQWczaGo3RldjMkNo?=
 =?utf-8?B?RXZ2WC9XZmxUTjNVMm9uZG8rMk1WcHVQT01QbFdqK3pIWFdMODZ3SThrRHdx?=
 =?utf-8?B?dzJpcXFsK3I0NnlBOUNPSWxoaFZUaUhtcTJuVDdHMjlWc3ljb24rMEFYTVRI?=
 =?utf-8?B?a1ZoZXNqcGVQcWxBZk1FYjhFbzVDNVJ4MmdHSmZnK1J2SnpJM0N2TlE1TGcv?=
 =?utf-8?Q?YYX6Af4u/AWhlpCcrhTH4Vv8EkJrTJltBqmqlo4Ihcd5p?=
X-MS-Exchange-AntiSpam-MessageData-1: L0P3NpXsDWkmXYzmXwthO62DdwSTy2WN0Fk=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: aa853074-2904-4830-6a6e-08def7b11b98
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 14:01:57.9100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Ow7gEmNxRSX7Dy8oNPtVOTN+kOsS6kFycJowlJjmTIkSZHaIi0/4D2+GABQRDPOZq77XuVrZYKNpQNWxyptyEcVTzdz5pB626g/q59QfEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9291
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQMNW2Z9O6PczSYhbpHuv+cFEDyS00QH5Z13UNVkNCc=;
 b=K9Y9KAqUxtAUg8kkVnSNvhGI1UahEbUDH8WlevTObwsqeZWZC0cZ7Y3i453gOaJNaLatiiSnqrupiAKSUD1dY0J/XMWvTATK4tGQjqlRJOiAkmIy5H8eenQG1U7vxQP0AFPsSRH+PxQZcPTMxZB7rvY0rjxEz3iYGPFf107r5Es=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=K9Y9KAqU
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH v3] docs/website: link LTS tooling
 documentation and staging branch
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

On 8/11/26 3:43 PM, Thomas Perale wrote:
> Users asked where the notes are available and if the information are
> publicly available.
> 
> Those changes clearly explain the location and convention of the staging
> branches and also link to more documentation on how to read the
> annotations.
> 
> Also update the timing of the different steps to be less specific.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
