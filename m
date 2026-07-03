Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D74C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03B5882324;
	Fri,  3 Jul 2026 14:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9HIIY1t9M9gH; Fri,  3 Jul 2026 14:18:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 144898231F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088298;
	bh=3CepZ2Nf/MermPl3QoDFbg/EtH674cfky4dOzbdQ9LY=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=LMTkQM+eidW+UzKJ0I1ko2fFyUkB0B+HQhWBZ4+0MRraROglHNlstegJYCPAKgsgw
	 dI5j87udo6uVNOEJl9VnbIocBmMZHi0aUFCX7T33XMz2vjmJnf9SkMxfSmArccezYR
	 8/QpUOUhEHJxQfDdcqQ+EfcP7/5DGy6sqp3GwXw3OqVyz6p0QreFfrQO2TIiwj9LTT
	 xRhhiKULYwLM+iVXHfIplO1ZlVKuwPnpsUEx2HXK+VtKKQvIBNJhl8J8ZoZwLOee6O
	 hPkPB4nhv8dit4ry+bYFKP6K7sBsNRoFJdtOACMk6jcCOeM3Dbp3djt3/uLp31nkG4
	 sdZIRBKVpf/Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 144898231F;
	Fri,  3 Jul 2026 14:18:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 88D2C14F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C7A3410EE
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xrHm7d4j3PUS for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:18:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c20f::7;
 helo=osppr02cu001.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5C74B40FDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C74B40FDB
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20f::7])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C74B40FDB
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:18:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFAnkUBhkbkL+IHmz0zTwHWIaDQTMreUnf/CiFikYFF0v+gdsxJtqyv5IMf4dkIDZDvk9SWy1QWW2O1eymdVTWOcnkyr12T9Gov5OT8sW26MTLbw/lCJPRJnbBecJO0TKcjrnjxUEg+Cr37Ow2GVOVGYW4pz7xSOGwFxtPwZK5vUo7ptZH4aI3xBClNBKCLzLUnDScvbQKaip9xE3gIggtDiabVlvxy65Idcdhi4Jf/tc8a+GUF4zcLhi2e7KdfvxSzXMFaJNo0xYhL9TmTTZgUS7MMlHy3xyKp7hhj5J/TSYk5GFnSo2oYdh0NwZcJppS6v4QV8oDNxO7YDwXhniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzmH8MbpdjUrrm2B5bwCjgfB9HK0SZed4ql+Fdlr2S8=;
 b=Bhlt5I3/ns4M3GYOi9YOAD3ROctrk53+5Hm0vLhNiY8HELzYJQOwuaN973gDlVSYTLWT+pDDMnxPpFfIIzsBMq1zioNXGTkwF9lDo/uJmtUBxnHRVXApdCIHve6F5/k3fwgEKPBFyoKXK9JiWdy7ai+C3OQcJmFekrw83bxTgdd03wcXgUHiHunoZsaeWYsw2bPL3ccGDVR4qBgjDhpN9YTFftwtjhnZD4X86iyJHTbzfmHbX/Og7IWj7fIVsU6GIpRTKsx57eEjRE7UNbQ7mAsbpAPpxrvdbSceSNkcCx3N1eGcFR66q4z0g6/EkchLaUcr9uF31muLXMHRrIqeRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by GV1PR04MB10677.eurprd04.prod.outlook.com (2603:10a6:150:20f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:18:07 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 14:18:07 +0000
Message-ID: <cc95911e-63dd-4b5d-998b-89be0a257149@cherry.de>
Date: Fri, 3 Jul 2026 16:18:05 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260624101340.80670-1-thomas.perale@mind.be>
 <20260624101340.80670-2-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260624101340.80670-2-thomas.perale@mind.be>
X-ClientProxiedBy: WA2P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::20) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|GV1PR04MB10677:EE_
X-MS-Office365-Filtering-Correlation-Id: 6516bd3d-18ec-4dce-e589-08ded90de72d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|3023799007|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: QshrXheSuhsPTYgaWzKg5Xm6RHIYoDxmxtu5zBalq96NvwnVfvDCrc6WrUBCSMHSUaPCfdq1te5T5w8KXc56DK6FsODoCSZr7u9+1cHZggPNhT9jCrlZqoGDSqjGLsp7whSBzZfIh0MEWoICT4dJOSk28W26utEIUILLT/nvnlX7u3LKivGFgp9664MCVZidT6ToJlueNTcgfQ1/KmixbUkRt7OWGjeeMbJeQlE1LoAkIrxYzmsq1kk4+JNbGi7u7RPrNpdNp6Ji8RyTc0P+8/r1SK0mIELUMr0Xpzi6Y8vYa8HsWUkSbYb4cyyz3YYUFbtZT47fxdoQnISkNbhnTl2PlphS1k6+xeT2sRVywFobzDy24uZlfyBot1f766aSeSQb8wZJzSRTxM0L9dlcmi7l9mKc/xDIuXqqiHYBjCjChrBwa9onjh8hSSahkr7o01ya7jwY9jT5OH2kJQiQlKJAopRqO0DgliUGHneFT/sxLrNhrnbf7AspSLXdQJRj+3pZOxvnM0YuIA+iAxFB5jNjqVA7/8FYXG/uZ4QHZBgAiD+pJKdWvbq66TuWHxGWaQLJOA3gmd6FUqaQYROG/9IluIlBEP0lo14THexyb57PUGQXv8QwSQQMOnVZDgY94QSZkLJ0vKMO79iz1EieJj9+N6iQYcugn1by+TV4ECs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkMzUVJUQjI5aTNZcHRUZVdHNmtGdDBndThlRFVnLzEzNXF2cFZ1b0lLNDVp?=
 =?utf-8?B?MmNiRU1QWWpYWDQ2dnRNb0U3ZVF5T1VpTWVhWlZZZEdqaUJBM21QREdMZ29u?=
 =?utf-8?B?b1EzOHpnb2VCZFBOY3cydm5mQkdCRUw0TStFeE1ma1owY0RrWkt1N2pTSVZ2?=
 =?utf-8?B?Y3hMang4dW04THY2QVJxVStjNDJnMWtzOXFqd1MvNFZZWUZPQ2hTZXNka0Ix?=
 =?utf-8?B?d3hxRlA4UnVJdG9GY1VkVUFTZVdJRFlzQUN5RVZtdGVISnlRZ0Zrcndnb3lu?=
 =?utf-8?B?UDlScGdQak9CR2poWDVBUlNlbmJXaXlzalhNbW5Tb1lxSWJsM0JLRitUTFVu?=
 =?utf-8?B?OFU4a2FOVEtPZGtkaFB0L3Y4T1RDdGxkdG5FdHdCRnN3bWRTZFdZeHpYR0I1?=
 =?utf-8?B?OTR6VnlyRExNK1c4TmtVRHFQRWtBVC8yK2lGUW5pQjd3MHhsbkptQ3RWZ3JB?=
 =?utf-8?B?RGNqOTZjWUY0Tm1JczI3QUlpMWFKMTJsK1QvdDdGVmJPRWdlTFdBa1lpWnlx?=
 =?utf-8?B?Z0pMZVFpWGRidmozUWxtMzE2OUxTNlZwN3dpM1lqZVVabTVIRU11c1ZBc29W?=
 =?utf-8?B?NHFoK084VzBXeGJQODcrdGZXZjBVbDVnVnpJM2drMVRuQ2Y2TXlUbzhUTjZz?=
 =?utf-8?B?c0REZ0tkS0k1REFIUm10UWlEajNNaUZzMXpTUjRLOCtZb0wzdFMwY2hER0pK?=
 =?utf-8?B?QVQ0UkVkUjI2Q2hVYjFQcTZJZjVqTStuWmlBa3hYS1JtZ1NjSURaWTNOLzF4?=
 =?utf-8?B?OHZSdGFuTjFnblh2dStvWVllS0p6NTE0M3dSODZLaWpnNUVWekJ1ZFB1OVZi?=
 =?utf-8?B?OXFuUTdmZHBvRk5WM01FOWFGRFZDRENMQjRtRi9UL0dnaWFMWDdVNHVzMWlB?=
 =?utf-8?B?RTBKRzgyQitBSGZNOFBsanp4VzVPVHMxZ0NHdjZXNVVDaTF5VGhKT2dEaVJj?=
 =?utf-8?B?TkJsdDJiYnUvMUVURzBSdzR1NzhBOXlXTGtKTHV0bHNleXFaaW1UZkdqcW52?=
 =?utf-8?B?RzJFOWVNc1h6b2YwWXFrNDVva2ZwVnBXOWtEWVd6K0NqaldpdVIzVUFBaUpS?=
 =?utf-8?B?c3YweHQ2ZURkeDNCUDE0djlUQTRYLzJBT1l3MFBMbEpqc21SQmt0TFl4eHI3?=
 =?utf-8?B?S0wydVhVMFJ2M0NqakJ0Ym9obElPMjI1aWxwR0tPYmFySU9XMm5XYUZwTHhE?=
 =?utf-8?B?aGtqVmZISTlRQ0E2QTFRUStsMmlVdURsVktDTjRkY1NqMVdZN095NFR6dHdr?=
 =?utf-8?B?QkFKMXJPREIyTnVEMlZLYkNqQ2V3V1hMbjhuU2VEUVBjaThhR3F2R28xU0M1?=
 =?utf-8?B?MXhSVUtLbHpYRlF6YUcvRzUxNCtFQUxLZytqNCtvQ2dwN2FiRFNoeUt3ZFRL?=
 =?utf-8?B?Z2VnWTdpc1k1eGovekppSkdvU1B2emRXUkg2R3Jiek01SEI3dTRpVUxOakR2?=
 =?utf-8?B?NGV4VDM0ZGJrcTNGaFhtR0xKTEdjMCtHdmZTQVpIVzBlQzk0b1NDaVJaRy9K?=
 =?utf-8?B?SENlZjFyWGhmNXlhK2tscVJTcDNUblBncURHeElYZTdIYTI0QXVpbHkzNTJX?=
 =?utf-8?B?N0xlRFZwaXF3a0xpR3Jka3ltZ3FWRy9DZWtXdTI2c01hMHJiYUVDNUREeXFV?=
 =?utf-8?B?NmVXMEJzNjVOODExUEsvTFdES3k0QnhoTTE2cDdtWG9hZ1ZNblhHWWpWZjly?=
 =?utf-8?B?bk9IUzRXcmdLc2tMano3NjluMXVnWCt4Y3RBcDk2SWdpUnlSbExYeGQ1UHRG?=
 =?utf-8?B?MDE3eXN5akFoWmdUdlBwc21vR29VaTJSQ3E5b1FRbStmc2ZkOFRyYkdXaFQ1?=
 =?utf-8?B?K0c2UXRCclVyOWJveEpNUU9KSjhkZFpFTVJHdFdKMzAydmc2citWSjRiYm1l?=
 =?utf-8?B?cmtpSjA0eGdzcGpncm9nNGNtVFRPeHp1NU1YV1IwMkx6cm5WQWtCMXVRWXhp?=
 =?utf-8?B?YnR5SlJ0T29ra3VvKzhCbjRuWXhnTk15b1orYjRNT1RmdCt1T1ZFcFZWaGhB?=
 =?utf-8?B?ajdZeFZ6bTloMTdXZU44WXRDeWdUWGpMMHhsODllMGhCSkVhcXovNHpLYzQv?=
 =?utf-8?B?bFVBRVowcnkrWU9yeE9TRjVPamNqWUJDTzlReEdhTmdLbTQ3a01WaGVFbHpt?=
 =?utf-8?B?ajJsSkMwMFo5SjhYMEV6TUNrWWtxbkx3VDhjQngyT1VmZWRSYjFxQXFEelND?=
 =?utf-8?B?dEprU3A2NEdnTnc5UUNJVDRCZXVBTlY4U084dC9SZk8xTmNVdkZ6aUdFdGZp?=
 =?utf-8?B?MHFKa3N3TUxFb1o4ejBlbGRJemIzU1JFL2ZFRHhQVjlFKzgvVWZwQVBRM0NR?=
 =?utf-8?B?VzF1ZXpVeTJ5ZlZlQzcvNzZhZm45VTZMY1lCejIzZ0pPanArZWxkdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6516bd3d-18ec-4dce-e589-08ded90de72d
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:18:07.0952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vNxGgQu3JGYr5GXkvG9I9OOgLuHEgLrXEV+OVS2VjU2DIT/DmEZ8qM8dYhQ6Kj5qXnAWBBhBqoXO1JNlAVujAEIdboMCBOe3Y/2GhBrQ0Yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10677
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzmH8MbpdjUrrm2B5bwCjgfB9HK0SZed4ql+Fdlr2S8=;
 b=d+8z3TFa+ECmImmXOROOGoiEY9n19NCo+AZaRZCy3uPoTzY+X5Nnp/O8vNLmsk5mW0VDsRXFo7k/NIoZWzrdQw/bEPz+p6DQnX8+o1QOcB0jhH1CGZOKJJR8bt7HyqXmb0e7TF32xDmbMSQkScLf3fQwkQiOlZdnVPfHZrTmpsA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=d+8z3TFa
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 2/9] utils/generate-cyclonedx: make
 urllib.error import explicit
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

On 6/24/26 12:13 PM, Thomas Perale wrote:
> Commit [1] introduced a code block that reference
> 'urllib.error.URLError'. There is not explicit import to 'urllib.error'.
> While this is not an issue in practice, linter complains that the import
> is not explicit.
> 
> [1] 17c9deb115 utils/generate-cyclonedx: hint at missing Buildroot host package on a specific error
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
