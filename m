Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF264C982DA
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 10:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E60460687;
	Sat, 19 Sep 2026 10:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q71d6GKA-Zw8; Sat, 19 Sep 2026 10:30:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 80FEA60686
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789813803;
	b=rWEiUR4L90W2v1LcHiDZ1pau4YbLF5MAsUbVod950eK3xlqvlpzYzEwHheJAyFV10ZIr
	 qlqI4VI7Yn1LNb9bZCWSVuxdlAAJ0r8g1zLHuXdWzFLZC7UTDRTPfsrNAYyfNOppcY9rt
	 s4VjDoJIlB03sNNsjGrAfyTQmc9W5yKTfkk0RkqJ8+M3hPV+jAwQkBOeYyo1RIA+DwAM4
	 5cRa9q1H6HOHPUqq1OrRwDrrt6Bf/Ru2nX3sVCJap4XaHKmpOg4F+0FlHE1tggxuR47Dm
	 1RkYzAce8WxPjaGo0GxgqXNDyJrKJctWvTbG2BM2n47bebF3qBwLiHnGZTRwiZWcBxw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789813803;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vaYigNalomhahfF8f4TD5563MC/UAmhPg14NRB44fY4=;
	b=hAIVSCy+ULSdINxxKjRLM8d5FbZOfu+lLG8W7xKRvLjOjHZZOaazgbmYfpsth0Ic7LES
	 Dap2dFT1rbtGeSpOpp9ym0iHX1uKRKg+MTMBnitQJQVqYHqbCVlCYq1OFJk0XhbnokHbp
	 Yw+RrTXzpdBXqUMAivPGSZm0a5gYxM8NDeYjHTQSn4as+6I6P3hg+IbRnSksWzBF9P9Wy
	 vtejuw433JmFCEUnPidiaw+f8Vicbl/rS9108T28JCDwnse+buZbDZskXVPCNR6TRRqQa
	 NLjn8T5jpBomQjXyzQcWqN1XE2/ZIQVaSkILxq46fWRwfhABP9Vy7Y3hHhZ37VIMB5w==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789813803;
	bh=vaYigNalomhahfF8f4TD5563MC/UAmhPg14NRB44fY4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Px/DgQJnqA8jFpXP+Dh0Wb9REI1AK5UJuGF1HrRaGvxn07o971EFRiHAZBqZw7YcY
	 u3/NHlJMVFsG593V7PB5//XN9WbZRrcuImpb5l2evYJ3Q8rspSbhQTPQDhY89BtkTV
	 BBBnqRpM6uHv1Stfisr4dixJeO1yD9enafxpswwQBakmJbyUXOdVWikkpBi3EcpbP8
	 iM9f+FSzAmWjSiv6VHA34LwmzqHGEZGvfdX9OGW+79XJGx8tl7anzI3yUg5c8BFiaq
	 mxCIefXa7M9MKNbjIlv1ch6ijfeDMjE7tHvOAmqCOC2fZ8lVG7j2ijRD3D72VqNBxW
	 r5Xcp64+mFVaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80FEA60686;
	Sat, 19 Sep 2026 10:30:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2225422
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 10:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BC85811E2
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 10:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_uLeFa9kGXE for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 10:29:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 836288107D
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789813799;
 b=CCqwHjSN/d6jREBJVSPDYmNiT+OjyxqDrggRRpDpe2mwmlHRK7Qmq6nFdxfU5FD7qWGN
 MI4wDoz8ezBquiHfdkPTB9SPuKWMxwiBLQNgK7HO+LtqSfYAYQ75vWi7Uv7kuyzH7RHft
 X0IJM6Vfrc7TmtMWF4clFrY5yLGM4mfTvMI/Cu5M14eFS2+Wc/exH+rgBe3LBXp2Bk5Pj
 ZYX7FSgZJg79TjIIzLYb++GFry3NV+4Mk21AhHoXMKHycLWmuQ8V7JQl+t12K+yx+CtME
 Uc11H+yKknXzrrPXhD9cOD1w2aMRb0QjwxiXkhzJFtHq8faEgNCv/QjpCyiWoylWkkg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789813799;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
 Content-Transfer-Encoding:X-ClientProxiedBy:
 X-Microsoft-Original-Message-ID:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
 X-Microsoft-Antispam-Message-Info:
 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
 X-MS-Exchange-CrossTenant-FromEntityHeader:
 X-MS-Exchange-CrossTenant-Id:
 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=yTWqjN1NuqzWQ774e2pgfzxAFqZz8gf11iavc2xDGuI=;
 b=cY+V11EKtKU+1fY14zXasucSLxCdT4Y/LUcrIBTdEEbpVtslnLbRDYXoAKOMrliyJTLM
 Eoa6HiWR7lWXlU/PLIeBvZJGqFowkO+NefjBhEKQyt6sgeAn4rIy8Y57sFip0jsuiIGYg
 cvp7CP0NnpXAhDG0EF8qOy39ixoJh7HkF8GhvX3Hw/+xftOlimebwpqJ+t5qAoYsdF3hu
 BshBp70IWfu+NMaWRnQAZMRN1S/TIAyKXSGf89deSNI2+9dtBG7ou1Bq1WSpjGyeLWFsM
 Hzwg8LR4WBeoaYhQbAZCNciEnDHzJgq2+vzyDyWEl0RX8pBbh69CdSoMKvnW9RL1Hmg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=outlook.com; 
 dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=qNQorkOK; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:d40d::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40d::;
 helo=sy8pr01cu002.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=qNQorkOK
Received: from SY8PR01CU002.outbound.protection.outlook.com
 (mail-australiaeastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 836288107D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 10:29:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m5x4Y0dKMESLROydoDGp3GwjkWHnyijhrSxC00WENn4Bv8rB0LCcDLnkngPsHXX30FxTFNZib2JUYE4NOGb92SZas1dcCJLrx1ZxbezoZzhr2MSbZTckfW0lDCRSveLS24aF/mXM2AAx3obA48e7AYu2pOX2+qW2CaHUZGLkjbzCRy1VPZnT6leaRmNsen5SLdOLgtmgWZLWNoYlGIZZlArdEe2z7UnI+k9GYZAWGCDgGFyY34RHYJU/kn04HEIYHTAaqTOL+m3UJv/XzfNs5kWYW//dcUR8U57QhVyMHmYQbr3vF/WIY32yh5wJvD2htS00QsR5WbooQnGGOuVK4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTWqjN1NuqzWQ774e2pgfzxAFqZz8gf11iavc2xDGuI=;
 b=vtAMA3G1Z4yN0GgPIEdPLn8lFxqWvKlamoxOr75DtdhFivGczyjLR8Wt+uzw4Sbe3yVBPTl4AFDoBvTpbS95cRbN2JPTAIjJc+LUn696ryYPn5WFJD1bYShdIdZdPup/lBbQaqKUeLgj+CQDeDWu4/3jleANE1SPqMQwYqoZMCeKXv33B+Em7qFnfdl9Eo6V+V4HME4QH2P3hivord1jZBTwdC1Ybls9FJVXX31Jkf8RYX1cj+8v4Erngijf3ex/jsIkyJX9iZex74EcmlLsNyQAA1Sj5xCKfJS6YiLnG7MKmZLX68ptll7+URyt1D9+biRPMkOCc/1kkzkDH977UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTWqjN1NuqzWQ774e2pgfzxAFqZz8gf11iavc2xDGuI=;
 b=qNQorkOK1FrZwH1f/Zg4jWacmHjElDswegPDbnrm7q3qEs7UMt1D77hTfgNYK9BRVXnKAuE/2+cANkSbERCA3dteAHI3LoDYPhV8dq3bwMWkMALCIM2wfGNFuNYfCVXLLYSHb1DQ1NvZt6wBBSsNL5Rkfe+9n8qifFFrBVkHHvctnY/f4bd8ZhKkVT0KLjsslNF0TRDX0NHyBI3AX7T7chuL19DRzCmNRVjZlA7FH8FkT05UMdGSjmgiAuj3XJ8OtK3/9APvI6yxdos5bq8gyeCC9nAs3PNkNRDe+qQMUl7TfamTSypmQ5XcM93KPydG6Ql44JgXYPbLqlqHRO1xwA==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY7P300MB1433.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2c6::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.11; Sat, 19 Sep 2026 10:29:51 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0428.014; Sat, 19 Sep 2026
 10:29:51 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 19 Sep 2026 18:29:02 +0800
Message-ID: <SY8P300MB00415DCD2BD6282D5B23A6DFB5862@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <SY8P300MB0041D841DA8295DC7F4B2510B5862@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB0041D841DA8295DC7F4B2510B5862@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-ClientProxiedBy: SI3PR03CA0006.apcprd03.prod.outlook.com
 (2603:1096:4:297::8) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20260919-bump-visonfive2-v2-2-c6c5ffb1a452@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY7P300MB1433:EE_
X-MS-Office365-Filtering-Correlation-Id: 24474016-2053-46a8-768b-08df1638f047
X-MS-Exchange-SLBlob-MailProps: ScCmN3RHayHq8QFbWW6Ra03gxaeZK6u4JOg1srK/Hc+bnDbIyGGj2+bgQL1dIB086bzuDjhEPFn+/T4nkcMngmrE7uejkbbVNaQDoXeI8/3aBP++8jVLFyjcDeHgrD9DObUjJPZJlPzjmDpgbPUQPZog5vZlisffrIjAxvCRXBxXgAzyg7MLsqJWlcZPrPyDgQ+/b80pcIgFo/ACHA4QpKqqvzWnRAA+0/irST1x6uijgd+bfEChMA7U971Pn6dB3JrSBM/TOSgEprGx03prRPBcO7DBAseoUxasgkU4Vq4UTWUNzcg/gxinnUOaAEGzOcF8Yv+x+bWQMm0qyzNRSxsK0pyCThzfaGS0DwYhO1+jmqyxPF5tjDqEfhEdumzenXYkRmCvhRkRJ5dO3lUqMcRorwzOzC4/IO3GyghGcA8lFu7ItznBOlXgC1RpHlY+Cq5UDlRbrlz42xQIhSuWugmahTutjDcMe4V2sDEJ3OYpSLnOOtQUeoHIlBPB+9UDhQSpcduS7MTs5w/FL3BFToB5yWUMifj7WnApMwYtZoVNLQq/kPXJP//9KKYNm7G5m/s2w79g2ti4D/ZvH6xioafxj3pt+qRuyseVnVUTTGJcDlqo2/LrhYYtAXJsK+CxMLFdyCunJcIHWKmJnuyYwwpX9fsi75g7NrcgfWB4i4O6BM5fl314sKIv+MEsql6Ls7euuAujN5XPXNrRFdIdtNdZEe6REuc474GWpgnDqEc=
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|24021099003|51005399006|15080799012|8060799015|23021999003|5072599009|6090799003|19110799012|25010399006|40105399003|12091999003|2607281247196008|440099028|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWJldkYrSHhWTFpYaGVnTGdwY3VhaWltZEk2UUU2QXl4S3N4RnlPV1BLQS9M?=
 =?utf-8?B?NXpKVlBTWnZPUjZxL0RCUU5uUGUrbzg0RHJHU0NRTUsvRWo2ZHI3bFlCZXpo?=
 =?utf-8?B?OEVtU2hpUHVlK1NVL1JVMktGR0lWODIrb29OdnVUeHJhVkg0TXZXS2ZHWGZh?=
 =?utf-8?B?Ylo3THNkRjNuUU5OQVNZVzN6WHA0RHMrWTAvMURTU0hEd2xQUEdHQVdrcjlP?=
 =?utf-8?B?S0RFNXZsSm8xQVJYc3lxODNudGdobkFZY0cwaS93Yk5FR0tKZnNZdjdDTjE4?=
 =?utf-8?B?THArdHdlY1EzbGIvRlZ3cGd1a1NTU1hXSVJibm1ZRTRsRFJxTTBzR1B4NU5y?=
 =?utf-8?B?eTdpdEh3NnJmT25RMko2eWJ6NTB1ZFA5b0hzcVZTRmwzb0M5UlBCSGRjcTFC?=
 =?utf-8?B?RnkzcTBMVW5CRG51RDJnaytreUNpbitEbjY3WVJkZnZVNEhZbi9XUXVLNy93?=
 =?utf-8?B?ZVlhVG9nUCtwZ29tbE93T1VlNG54bDEzUjdIMlNudXYyRXNjMVN6VVNiSnFj?=
 =?utf-8?B?b2g5V3B1RnJKR2VEaU1sQnQ2Z1lZTThiWTJPZ2xCWTRQK3FCbXNMYjJEQkEr?=
 =?utf-8?B?V241QnVnNWMwb0dKeERHNklKQkpDbEZudFkwRFdmbW5GT2xpNG5VeUkrOFdN?=
 =?utf-8?B?bkpSNmhCdUdSbVF4eXIxdUFvMmFPQXJybUgreWVqK1cvUmcrT1BjRTBJNk9I?=
 =?utf-8?B?YkgrTVBhMXQrTWp2Z29aVG95TmowVU9OUENPak9qUmd2WkpxUG9TczlieUtD?=
 =?utf-8?B?cHpZUkJrMmVKK1BBR3pxT3gxa3U3SGpaZXZoT2JjNzlIYTE1ejdNV2h5WC9J?=
 =?utf-8?B?WXR5eUZYSVdVSlpMQzBtZUhsRlM3UkZXUWhacm9jZUNwelpWczArcDg3N3pr?=
 =?utf-8?B?eWRWcklwR204QWdxSDVoZHFYTXdxN1YvVzE4eGJheWh2UDQ3RlpZS25YQzZK?=
 =?utf-8?B?aWZtZkZSdUZtUjJrdnNGZjBKamFZOW93NG9jR01rdkR5ZTRwYjZwZTF3ekt5?=
 =?utf-8?B?dDRwSnpSRXowNjhLWWRqdm1zZDlqaHloQVg0WHk0bU1MYWxHT3pHRmYvVEox?=
 =?utf-8?B?c2lhOUUzVVJVOWRLZ3Bzd2k4WUJBclRaK1FYalVFY1lXMUc2SG0zWCtWaTl4?=
 =?utf-8?B?VGxNK1lzYXI0WnFkRDVoTFNvWDJhR0diRjZsTmUzQ1hkRm9BcWk4dERZTmIz?=
 =?utf-8?B?amFFYTd6RzZzZHAwdkFNWDNLRlBLVUxtMmpJOW05MmREblp4cW0rZE9BUkNW?=
 =?utf-8?B?RW81T202bzNmK0U1TTVPZUNrdm5TS1NITmlOaVNvYnZUZWhqRVpQSjB0TU9p?=
 =?utf-8?B?RTFhL0J4Rmh6QjZHVzlsaEFVQmxnOXJRc1RVMDEvMVFzU0gxYWVhWnpPN2tJ?=
 =?utf-8?B?cEdwb0lnTDhnZ3c9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTV2OUhLYzNEWmQ3aEhZMlBGb3lBN2E5Q2dkeVNHbEJPR01BK0U3by8xRzZO?=
 =?utf-8?B?QmgvZzN5eGRHRmExMDZKTGJCZzRKWk5pVGliZzlKTlhZRHlUMlBJZDdMRnI1?=
 =?utf-8?B?Zm5oOHZ1YitGUzhLa085eGl6ZkxHNG9naFNRckZSS1RFTnVRWVFFVzBMNjZK?=
 =?utf-8?B?SDZtWnQ5S1BBWW9RNk4zMlJ2NjNnbGdxWFE0Mnhib2N2TDFBUHROSkFlVHdt?=
 =?utf-8?B?UWxYWWxTTEYvL29XOTJDUmt0RU15cWVCcmhhcnRQWHlnSHVWeXp0UFBQckpa?=
 =?utf-8?B?UDRWeFBFUFdmaTYvQVlTemRVZFhUemhQa0dMU21UTSs0ZkZDYng3Z3pTTU85?=
 =?utf-8?B?cjhkVDIrbnI0ZDFmR2hHbXhrWTk4WjVITnBCVGNMaFZjQ2hNTU0vT1FaaG9M?=
 =?utf-8?B?ZlFSSUczTGxiUW5wWGZMaUJrYTB0VlhxN1p6RnRVZTFxbUNCTUU2ZEJFTnJp?=
 =?utf-8?B?ZVE4Y0VBWDJwNE8wYWVCUno3RWV1T2paUnROZmgvMmlOTi9KK0c2L0R0YU80?=
 =?utf-8?B?a25ZUmpkOTRselRDaTVCUThpd3lwUm1EOGpDdjVDZDhHM2hIdjExZDVUR1hD?=
 =?utf-8?B?cStYR3VXYnA3dnk3N1VObzVhODZHM3lvQXB6Mi9GY2RsUUh1T3hLeFpiYU5q?=
 =?utf-8?B?VmVtT0NHM1huSTdCTk83U3B3UVVsWkZtdDRQRTNCeW56c2hFcU1pcWU0KzBq?=
 =?utf-8?B?aVZTN01qaTR6eHVQVmtvaXpwVVZjQ0ZQNU9ZMmo3R3IzTC81SVZWODcrczRk?=
 =?utf-8?B?WjQ4ZTNuaWRucHpmZkw0eDdka1c3eHRIalJpUWZJdCtDUXVROHdpQ2w2azFp?=
 =?utf-8?B?RUtmUlI0SHVjWXlzQlNtZ2kvYloreWl0VnNLdWVkRWhSaFhFZTZ3NVM1K2Vi?=
 =?utf-8?B?YlgxdGJ0NHRRd09kOCtGZ29MNG9lTlZySjc5WEJZNzJqZ2Y4QVFrWGVrbllQ?=
 =?utf-8?B?SW9ncnNjazlHWk1Lbnlka1ZpV0I4YUdlN28rT2xuYW9nU0Z1U1NuU0ZMVjBz?=
 =?utf-8?B?eWZvTkY0RFBGU2NhNW04Vk1zZXpkZlZ1VUg1Tk1lbytjdDdxQmpsZzdUdE1o?=
 =?utf-8?B?b3BOZEZCZSt1Q3MyVXZVNG5rYzJiaWJNNmd1aDdGNmJ0ejlHRDhySThnZ0I4?=
 =?utf-8?B?WlZLWWt1VmNxcDJFcTZaVkhiOGpRUW1XRGdqeWt6N0VwWEtEVUMxOWU2Z2pq?=
 =?utf-8?B?d3oxczh4OG5mN2Rpd29nTjNUSkFOT25ZeHFqVlJOMVlKNEFVOStnUVRRMStr?=
 =?utf-8?B?QXlMYkhQdzd2elhwNjVieGhnV0lnR2tpenE1bUE5Y0FJcHk4bDQ3bzlaZTBX?=
 =?utf-8?B?UTFtN3lXQUJIc1IvRTB0ekE4VE9lMmVTTU5QMFlFdkN5eHdUUk9ueU4zQ1BK?=
 =?utf-8?B?d3U2V3k4M3hsWHcyeUNsakxBMWQ1UmJZWk85NGo5cUFDZHowSTF4bDlhOUdM?=
 =?utf-8?B?WHpXdWlLeTZEdENDNm80OTgzeFFDN09Rc1FZNmhhOHllWkJFQmVMZnVYQzNT?=
 =?utf-8?B?ZElNaytVZ3JjZ3ZiWUpPdTcwVXI4OGVHVVAwRENPc2pwdC9zN2RWQ3JCV0wy?=
 =?utf-8?B?TXEwakVUMHFVUWhYLzdiVDREdFVYL1ZLNktQQlpmak5XUFNZb29DakZCaEZq?=
 =?utf-8?B?aDAxcUl5WVN5a1UrZktMQjVrQ1F2eHdVTlQyaFA2M2JJWDlNWmt1cnFHYjlk?=
 =?utf-8?B?YWw1TG1PTW9sZEliZERQMHZXTElyNnhPTW5La2NPRTA0UE5uSFhFa2JndWlK?=
 =?utf-8?B?dE41NmEvVk5qOGFwWjVZNVVRWE5sSEkwanRJRGhOTUFjbmJzRVlwLy9rdU9X?=
 =?utf-8?B?ZGcvUGhqOXdLQnFjYk5nN0N3WXlRVG1zamIrc3lkdHFnOE91QUw1VE9iVWhI?=
 =?utf-8?Q?DH0eQs1qS+Q7e?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24474016-2053-46a8-768b-08df1638f047
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 10:29:51.8127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB1433
Subject: [Buildroot] [PATCH v2 2/4] board/visionfive2: remove non-upstream
 Linux config options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove vendor-specific config options from linux_defconfig as they are
not present in the upstream kernel.

Regenerate the defconfig by running:

  make visionfive2_defconfig
  make linux-menuconfig
  # Save and exit without making any changes.
  make linux-update-defconfig

Fixes: 4567c35d066e ("configs/visionfive2: bump OpenSBI to 1.6, Linux to 6.12.24 and U-Boot to 2025.04")
Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 board/visionfive2/linux_defconfig | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/board/visionfive2/linux_defconfig b/board/visionfive2/linux_defconfig
index 06942928b5..509cd0f475 100644
--- a/board/visionfive2/linux_defconfig
+++ b/board/visionfive2/linux_defconfig
@@ -22,7 +22,6 @@ CONFIG_PERF_EVENTS=y
 CONFIG_SOC_STARFIVE=y
 CONFIG_NONPORTABLE=y
 CONFIG_SMP=y
-CONFIG_RISCV_AMP=y
 CONFIG_HZ_100=y
 CONFIG_HIBERNATION=y
 CONFIG_PM_STD_PARTITION="PARTLABEL=hibernation"
@@ -40,6 +39,7 @@ CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
 CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
 CONFIG_CPUFREQ_DT=y
 # CONFIG_SECCOMP is not set
+# CONFIG_GCC_PLUGINS is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_BINFMT_MISC=y
@@ -87,7 +87,6 @@ CONFIG_BT_RFCOMM_TTY=y
 CONFIG_BT_BNEP=y
 CONFIG_BT_BNEP_MC_FILTER=y
 CONFIG_BT_BNEP_PROTO_FILTER=y
-CONFIG_BT_AICUSB=y
 CONFIG_CFG80211=y
 CONFIG_MAC80211=y
 CONFIG_RFKILL=y
@@ -104,7 +103,6 @@ CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_ADV_OPTIONS=y
 CONFIG_MTD_SPI_NOR=y
-CONFIG_OF_CONFIGFS=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_NVME=y
@@ -159,21 +157,15 @@ CONFIG_MARVELL_PHY=y
 CONFIG_MICREL_PHY=y
 CONFIG_MICROCHIP_PHY=y
 CONFIG_MOTORCOMM_PHY=y
-CONFIG_IPMS_CAN=y
 CONFIG_IWLWIFI=y
 CONFIG_IWLDVM=y
 CONFIG_IWLMVM=y
 # CONFIG_RTL_CARDS is not set
-CONFIG_USB_WIFI_ECR6600U=y
-CONFIG_AIC_WLAN_SUPPORT=y
-CONFIG_AIC8800_WLAN_SUPPORT=m
-CONFIG_AIC_LOADFW_SUPPORT=m
 CONFIG_INPUT_EVDEV=y
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_GOODIX=y
-CONFIG_TOUCHSCREEN_TINKER_FT5406=y
 CONFIG_SERIO_LIBPS2=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
@@ -221,10 +213,7 @@ CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_CADENCE_CSI2RX=y
 CONFIG_VIDEO_WAVE_VPU=m
-CONFIG_VIN_SENSOR_OV4689=y
-CONFIG_VIDEO_STF_VIN=y
 CONFIG_VIDEO_IMX219=y
-CONFIG_VIDEO_IMX708=y
 # CONFIG_CXD2880_SPI_DRV is not set
 # CONFIG_MEDIA_TUNER_E4000 is not set
 # CONFIG_MEDIA_TUNER_FC0011 is not set
@@ -371,13 +360,8 @@ CONFIG_VIDEO_IMX708=y
 # CONFIG_DVB_SP2 is not set
 CONFIG_DRM=y
 CONFIG_DRM_PANEL_JADARD_JD9365DA_H3=y
-CONFIG_DRM_PANEL_STARFIVE_JADARD=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_TOSHIBA_TC358762=y
-CONFIG_DRM_VERISILICON=y
-CONFIG_STARFIVE_INNO_HDMI=y
-CONFIG_STARFIVE_DSI=y
-CONFIG_DRM_IMG_ROGUE=y
 CONFIG_FB=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_SOUND=y
@@ -389,7 +373,6 @@ CONFIG_SND_SOC_RZ=m
 CONFIG_SND_SOC_STARFIVE=y
 CONFIG_SND_SOC_JH7110_PWMDAC=y
 CONFIG_SND_SOC_JH7110_TDM=y
-CONFIG_SND_SOC_AC108=y
 CONFIG_SND_SOC_WM8960=y
 CONFIG_SND_SIMPLE_CARD=y
 CONFIG_UHID=y
@@ -477,7 +460,6 @@ CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_STARFIVE=y
 CONFIG_RTC_DRV_GOLDFISH=y
 CONFIG_DMADEVICES=y
 CONFIG_AMBA_PL08X=y
@@ -492,22 +474,16 @@ CONFIG_CLK_STARFIVE_JH7110_STG=y
 CONFIG_CLK_STARFIVE_JH7110_ISP=y
 CONFIG_CLK_STARFIVE_JH7110_VOUT=y
 CONFIG_MAILBOX=y
-CONFIG_STARFIVE_IPI_MBOX=y
-CONFIG_STARFIVE_MBOX=m
-CONFIG_STARFIVE_MBOX_TEST=m
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
-CONFIG_RPMSG_STARFIVE=m
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
 CONFIG_IIO_ST_ACCEL_3AXIS=y
 CONFIG_PWM=y
-CONFIG_PWM_OCORES=y
 CONFIG_PHY_STARFIVE_JH7110_PCIE=y
 CONFIG_PHY_STARFIVE_JH7110_USB=y
-CONFIG_PHY_M31_DPHY_RX0=y
 CONFIG_RAS=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y

-- 
2.55.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
