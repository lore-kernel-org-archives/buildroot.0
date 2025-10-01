Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99920CCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 16:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 680448379C;
	Wed,  1 Oct 2025 16:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRCcekOi65-A; Wed,  1 Oct 2025 16:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72E01837AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72E01837AD;
	Wed,  1 Oct 2025 16:52:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1017293C
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFEBB41040
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:52:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RqeJ3aYWJe6s for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 16:52:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d116::;
 helo=ph8pr06cu001.outbound.protection.outlook.com;
 envelope-from=ohitsdylan@outlook.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5930F4103F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5930F4103F
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azolkn190120000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d116::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5930F4103F
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:52:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VT3wVnqre5CQZonQg60NF6BtytEXrL8hE7VKJeQ5uMH7O0ZTp+59i/DpSSNvLIADUCBGsjGU/j+lUCmfmuLC7YDM8i6WgeCgGHwRI6bi27/pfTnrZv9M9BHEZ5aAbymEtdVLwFSiKIkMN6Kys1nyXe7rutYAWI496vXMJrmIzNmW0/7f23dtRf4JiwvxKKnfuVSqz1KiHPMjHkyINDbRWAC7q+jD+tx6q22rS3Rd+qbc67MkWkRb5QOWw5wywTTPXoqccqtKoKD+Fd0+382TSEfErwJXA52LQIG1N50RYV+YQ2GdFtTv/Ju2PrAgkkERl+e478TErU+u609dfXxBtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVRYy1SnY+5kln/3j6Lo7H8FOxbIioLTqj5SeZwqm28=;
 b=F7qpaxhS1bQ6y3L4Ebjm+lRa/MgsnPj3ml8kv9R+rLaQxvCvKZDNz1s73sROKOXuINMNHXgWVA1WVniuR9S8bJXUwRxRAB2yJQIVnKI+NxOrmvK7AG1eieHlkFWOwlxR46yyvyhV3lBUPnPQuA91e4JVFID+rmPXrriEvF6NwYUjEbkAAM0GH/VfiBBMbdTFTaXtckm7qsFY5cQEGmdQ8fCXFPNnxGT4P6DIG5rb8b+ntzZ3PRImTLLEyKTqvUcw9C8XaU6yly2TG3oiMARgnvin+LFePfGK8BVj9sPhu7rIZ/n/IldjWMTc7ClUucFt2xlEJMXxmEsXO/KfiPTX4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from IA0PPFC38B3687C.namprd19.prod.outlook.com
 (2603:10b6:20f:fc04::ccc) by SA3PR19MB8193.namprd19.prod.outlook.com
 (2603:10b6:806:37e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 16:52:17 +0000
Received: from IA0PPFC38B3687C.namprd19.prod.outlook.com
 ([fe80::c6f:bd1d:b8c4:e7a2]) by IA0PPFC38B3687C.namprd19.prod.outlook.com
 ([fe80::c6f:bd1d:b8c4:e7a2%7]) with mapi id 15.20.9137.018; Wed, 1 Oct 2025
 16:52:17 +0000
Message-ID: <IA0PPFC38B3687C9C75440A153CF5B108B7CBE6A@IA0PPFC38B3687C.namprd19.prod.outlook.com>
Date: Wed, 1 Oct 2025 12:52:19 -0400
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: bonet@grenoble.cnrs.fr, ohitsdylan@outlook.com
References: <15f12d6e-87b8-4faf-bbe7-8da6bc440015@grenoble.cnrs.fr>
Content-Language: en-US
From: Dylan <ohitsdylan@outlook.com>
In-Reply-To: <15f12d6e-87b8-4faf-bbe7-8da6bc440015@grenoble.cnrs.fr>
X-ClientProxiedBy: CH2PR08CA0020.namprd08.prod.outlook.com
 (2603:10b6:610:5a::30) To IA0PPFC38B3687C.namprd19.prod.outlook.com
 (2603:10b6:20f:fc04::ccc)
X-Microsoft-Original-Message-ID: <ddc7d237-ad5e-4b24-8e93-61fbe0b36508@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PPFC38B3687C:EE_|SA3PR19MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: eb6402b7-2578-4ca7-b86d-08de010ae146
X-MS-Exchange-SLBlob-MailProps: JdQcnb18bc4MlRpwu2L78SEA13rL32WN9JMFt8L9N6N82PrLn5OdprMM0t+Yf72vNU4e8rOCR0KFhE8LxGE0oeNhVSrY/31Mi3dy1lIAKttZ7fnhu9FtUpMJN7HaJGFUha6Do7qAyEij11bQRGTOFzIdRDjBqJ1261q3B/KeqHmjEMd4rgNfGQ5dJ3oStDvf9OmX1x3RvgsVUT7Q+f6xI1qw/aPFaWXbXG0n/MKTZmnyg7wc0IY6OGXQne3xeApoEnsnDMqbuOaf1q4KyrGiUzZd6gUUTVtzpUY0kS+bO51TojMH1gvvHMnqlELDZmVhrFm54pxKZYp3x9KUIk6YWoLP/r55W7AWfgtJEICEZgpoBHJ5E0NcEmzzP4arJhtqsEB0+aLJQegz/UdcPGzd80zj5vc+PW3VPEgPdc3sS2xRwm9S86fBHUZQsrKKei5oQ7hEnx70KO3DVvcXoBL5zr9mViQigIWm4t8aHTjPz5+E7ksJx6MyD7pD/pkYbfDjiIUfbpDkEGVfm5cgY48LqKVtKKt6m/gwlF61W9CjhXj11yHq2xjyAxbHeEmwYdLDSTRW52It7Rb2BjCujk9W/oZDZZqDj0SpRFaTSmm5D3va8BcfQOjLN3ek2D8T7L/EfV//OyezziE=
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|19110799012|5072599009|461199028|6090799003|8060799015|23021999003|15080799012|440099028|40105399003|52005399003|3412199025|13041999003|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L20wK0NLa0piUHZHVFExYWFndFh1SWdGM3VaWlpXL2RpVnZDZm0xZjVuTkVw?=
 =?utf-8?B?c1NWRndDdWxvK1ZiQ1loRGViRndyd3RzOEMwOU5ncGEySkVwaHFjQUhYb2hj?=
 =?utf-8?B?S0sra01GenpwNFpvaWM0aXpaWnhLRzdOM21DQ3lKU3FWUjh1eG12ckcrTXhN?=
 =?utf-8?B?Zmp0UjJjM0pKSEpXTm82THJobW9YWGZqTFVpdVVJRVZVcEdMMzljeDBKMHph?=
 =?utf-8?B?L0Y1TVp1aFB3T1ZNMFV2bGZBUkFxWWxNMXRQcFpqKzZtenJuWC83Y1RyS0Nj?=
 =?utf-8?B?cWM2emp2aTExWlYvOUI5bkN2L3ZLbGZJOVdSM0dNTmdwYXgwaHZ2QnVzR1hU?=
 =?utf-8?B?NmVsSkpKbGpKUFNWWlFrY3dMSkp1MDBJTkx3S2k1b2k2cVRtMjhpVkhENmJz?=
 =?utf-8?B?enpjTjhrUWhPc0p4SkdiY1hmV1VtN3VtM2VHOC9hMCtsaGh5ckI1M3RhVU1R?=
 =?utf-8?B?QTM3L3ZuYTdubEZPVFlKREwwNmpMTjZ1c0dsbkNqWGhybjRXTklCd0VKSkIv?=
 =?utf-8?B?THdFMjZKUFY1eVE0bC9kWTAxOFhNeCt0UmI0VTFxdHNaM3VZNlFjeVdQWkIx?=
 =?utf-8?B?WTlZcnFoMTI4ZmVqaEU3dW54akF5MzAyTkd3V2pvVmFKVjdDOWhjZWhnOXN5?=
 =?utf-8?B?ekZSV21sdGRsY3JFbjdrQmNGbzFuajJxdWRBN204ckEwNVBZVTdTeGNPTG5N?=
 =?utf-8?B?M1FKcm1oZlpQa2tEZDBQR05EZHNnM0pSdTc5Snp6Y01TcTg3aXc0MmZhZlZu?=
 =?utf-8?B?UFRsTHBvdHNrWGp4ek0vbmJFQzFIREtXWnBRYi80a3pFVzd6Vi8zTi9MMG91?=
 =?utf-8?B?Q3JzV0lDRGQwYzFoNkFDbzdhU0hmVVRLNlVyeW5PUjEyZCsvbmcrNzZTTDcx?=
 =?utf-8?B?TjU4VGZjUURJUUxxSWtoZkNuV0JyaWkrTkJBTFlZbTlENG9QUmJKYXJsWnBE?=
 =?utf-8?B?Wk1LTWZMTWJzRHhIRHNKVGQ0K1VCQnQrTzMrem5aR3NqOXEzNzlVbThPLzdX?=
 =?utf-8?B?MW52T1ZGQlRXVnZyZGhpbU9SYjIxVnlXMW5qdE1YV1FkanB4VzBtZWJQUlps?=
 =?utf-8?B?WGdyZllkM0pvNVJ6aEZVMVpjSmNrR1h4bSt3VE5ibHFycVBpanVTNDNJczBB?=
 =?utf-8?B?Q3ZVWDRTZWxpazlhOUtrOW1ZellnVklnRGNCNkFCQTdteDAzVmFCWWtqR0dI?=
 =?utf-8?B?WTVCQm9rV3RDcWxMZ2gwNmZSS09CUitZN09Za1JJSVNCeGEybWtGK2cxM1d3?=
 =?utf-8?B?KzUrQkdSZzZLWXYzdHJYN3BHbGRrdVlyc2JRUVIyMXE2MWJrdFRTT2NnTmRp?=
 =?utf-8?B?WEtVYjZLTTlPVjdaR0RCUk9pSm1sVkkyajBoRkZrOCtzZUh6dG1qdW5LK1Zo?=
 =?utf-8?B?bXplZ1UzUG41UkFIN0hrZXppWDJReitCczN0cDljajhPVlc2S3luRlhPS0RF?=
 =?utf-8?B?T3JwdGVtR0dQbzJabWI4WXIwa2JWcjJGYW9jUjhDS2hsdUlSdkhWaEY0RHJx?=
 =?utf-8?B?Y1kvM1NrM3IvL0FDZUNQWGdtcnF6cFIwRHhmUm1qMnRYUStJeXd3UFFDUS9O?=
 =?utf-8?B?WmhuUm1HWklyb1RHSEc3aUFEOXU2OUJtS2t6UENYcVRNTkNheGNYUXZMVjJq?=
 =?utf-8?B?TFRDMnFBV1JvMlFoSUgvcTlBTW1YNVU1engzT0hGNVFyUmZzVXd2dkpaVXd6?=
 =?utf-8?B?eVlnalJ0d01Ha0FRbDBRWHc5YytqN00vZ0d3UjQ1VWJ4bWdsWk9RbGtRPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wk1PZjFPNGVJblNpQkFZMDdJTnZrZ0tkV3JhRnVsUmlBcjZ6bW5ZcVZQME1H?=
 =?utf-8?B?UHY0SUxGYStzZFZPNnN0QVpQaHFYYzg3QXF4ZzFNTTNXeDcrWjMya0IxUWcx?=
 =?utf-8?B?R3hiYkFCVE1HbG9rZDVRcTA3bXlkYzAwVUorY3BlcitGU3Yrb0VQTlZEYWxl?=
 =?utf-8?B?TEtHdlU1TDBycldWS1VyN0krNnhURVAxUXZXeFJ6aUdxRW5RalBPa1VjekF4?=
 =?utf-8?B?MG91NVpxY1grUy8rK05CNjJtaUlicWR6aHhqL2pUTGV4V2Q5VWFZSCtlTVJw?=
 =?utf-8?B?U1U3VUdwRmhtNXYya2hHMkswUUFSUVdDZ2VuU2Z4RUJWQVRBczhLaXpqOEIr?=
 =?utf-8?B?ZjJhTjhucDRKdUIwRm1hWDduVmhNd3BGT2dQclFDN3dkM3BQRW5ldVphS2dR?=
 =?utf-8?B?enZvL0JNazdJK2RWamt2UDFDRFlTdXR3aGxrREx3VEp1cmErSUdSNnBMYTlM?=
 =?utf-8?B?MU45ZXZZQ0p5TGtOZ3lhTVdHYmQ4aThIV2NnWTVya3VSSmlDUzk5RFRCSHpH?=
 =?utf-8?B?T2xuWEhMdFIrZnQ0K1RPS3pNUDNiaUtzMXhvTDZDUzNML1RPSFBVUUh4OUQy?=
 =?utf-8?B?OUMwcG1vaU9iL1U0TmVZeURRUERqYmRBZk50cjJWc1o0ZGF5dXRXZ3NGN0pN?=
 =?utf-8?B?WG9jeXcxbVorckthSlg5bFBvbm5sVndub2xnampxQkVXaWJza1FZOExqOUF4?=
 =?utf-8?B?MTNwUnp6eVJhM1VWZTlPRWNvdFVJVVNrVFBNOGJtYjY3cUt2QlpxNS90RXpY?=
 =?utf-8?B?S3pDaXJFblRyYTNJUkpYeFI1SkxLc0RGUThoeVRUN1lkZnc5ejJhbVVUczBm?=
 =?utf-8?B?QzdwckwrL2JXOVpYcHNETzBORVZZcVFNT2dGR0Fwc2RvZzhlUG4rN3FQeUx3?=
 =?utf-8?B?WlZ4ZFRZYW9sS05ic1IwS2RibDl5TCsrcEFqQjdhQStzYlVBRWdHSTRhRXpz?=
 =?utf-8?B?YVFMOHlEWlhGemdQd0ZSTFJDdGcyUTJSbHpqUTNpMHp6NW9mdzJlWkZqZmgw?=
 =?utf-8?B?ekU4elZZbWpXdzU5RFJmbmNvNGNkMDB1bmVJa1V0NG5RUjdQVVEzMFpTWmw1?=
 =?utf-8?B?QXpWcjlwQ0VoRUhtWFNxZGZzZGI1ZVJiUjVxUVJWOEtMQmlyUm9nZ3pIbnJy?=
 =?utf-8?B?dVBBdnV3WEpZU0pWNkl2eHpPWGZsZDc0aG42Z3pOUjJoanMwVFhqQTR3Ri80?=
 =?utf-8?B?c0NFa2psZTJydEE2d1pBcloyNVZNbll3OTVsRVFUcUdqYm5DMHMzeVgrSXJR?=
 =?utf-8?B?WFpoeGVDWHVTSENkTndZcmFRSm0zeEtOc09kdFcrY1VKNDZqeXlFTFRIOUpw?=
 =?utf-8?B?TFoySE44bjJqZFI2UjJsVGF1SUd2N2ZMcUo5NXdpdUFFaWRJUGhvTERuRHhO?=
 =?utf-8?B?cmxqdE8wck1kb0FMdDJNSWtUbzhnclVpVThrd2twaThYRlBjL3JGVnZXU2ZU?=
 =?utf-8?B?VnlOajNiWkw0NDhpeWtsK3hJUEZtcmkrK0xBcm8ycENyd2hwTkRPYmY4WmJX?=
 =?utf-8?B?MEN3cmQzbThHc09mRGhEa05Hdm4yMmNkUktaM2RtYVlOczJjN21WWVZxTGZP?=
 =?utf-8?B?bURiSlZMMy9xQnVIM1VHMGlrQXd1TUNqbEgvYnlrajZwZnc3OGNyOFY4aEx4?=
 =?utf-8?Q?ztejH5/GSiUU0SqYsjSUs3EEJwJe3H0c7nGnDDw9Fh8s=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6402b7-2578-4ca7-b86d-08de010ae146
X-MS-Exchange-CrossTenant-AuthSource: IA0PPFC38B3687C.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 16:52:17.6937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB8193
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outlook.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVRYy1SnY+5kln/3j6Lo7H8FOxbIioLTqj5SeZwqm28=;
 b=VYYHiG0anpwIQiTmUNJC9VWqe1Hfz4HjVFKCQKcUaNs26ED9T/M+PbR0xRWMPqByfM4Gy3RYihXrwomMfZheBEvlPr6BVpbE38EbhHr2zyumermWo4EJ1fw9A9UBiUkq4PEWr/b95Pf+tPW8FUn+TjK80DZeNl907kgOd/fiAVBeeRam4P0OSW+A0ovGjBpVby3A9aedr3ePVWt+vZLlJtG0g7+FUKUyAQd0ljM8J4pu+hHCJRLtDQspeKYrFQEnCBp+unIPhWxiVvu/PjLjUcjRtbly6rBpA+PDpC0VJkx/MipOT+nwKSlEZaDkX1JRUxjpXwPZ0ZoN6AGzmIKjAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=outlook.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=VYYHiG0a
Subject: Re: [Buildroot] Issue Applying Patches to Package
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpBcHBlbmRpbmcgImEvIiBhbmQgImIvIiB0byB0aGUgaGVhZGVycyBpbiB0aGUgcGF0
Y2ggZmlsZXMgZGlkIHRoZSB0cmljayEKCgpJJ20gY3VyaW91cyB0byBrbm93IHdoeSBteSBwYXRj
aCBmaWxlcyBkaWQgbm90IGluY2x1ZGUgdGhpcy4gQ2hlY2tpbmcgbXkgCm5vdGVzLCBJIHJhbiB0
aGUgZGlmZiBjb21tYW5kIGxpa2U6CgogwqAgwqAgZGlmZiAtdSAib2xkX2ZpbGUiICJuZXdfZmls
ZSIgPiBmaWxlLnBhdGNoCgp3aGVyZSAib2xkX2ZpbGUiIGFuZCAibmV3X2ZpbGUiIHdlcmUgaW4g
dGhlIHNhbWUgZGlyZWN0b3J5IHRvZ2V0aGVyLiBJIApyYW4gdGhlIGRpZmYgY29tbWFuZCBmcm9t
IHRoZSBzYW1lIGRpcmVjdG9yeSBhcyB0aGVzZSBmaWxlcywgdG9vLgoKClRoYW5rIHlvdSBhbGwg
Zm9yIHlvdXIgaGVscC4gSSBhcHByZWNpYXRlIGl0LgpEeWxhbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
