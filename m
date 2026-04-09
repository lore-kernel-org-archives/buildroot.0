Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97631EA3C55
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 12:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AB8141071;
	Thu,  9 Apr 2026 12:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWx3BPgcCI_U; Thu,  9 Apr 2026 12:28:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1CAF40FE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775737683;
	bh=fMT8I15FahOVWsXFs++n6Ty3wJqmnxRxFj5L88C17NQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=kOIsQIfsr4KNE0iL0VK4Mwn7r7Y6e4EWfuAdFgrhIcmNhM3dbXpxmRqf14k7wx7+6
	 lj1QjHnXLWMKqq2hbT1HybkWj9kjvRTWSxwGsAhShdAiryzxuuGWcF8keoWW4igbi4
	 j4uQTQ/s658ASKO0FpPWJ48mIVCHgoh2f80q6WXLy3ONGbipICxP7uMXjBfeuGI/V+
	 NqZem0JIHUBECQOYXNIiYFqKi38FFPKoR043kOWry8zDY/2Tuso9GKv9Sh+x4mV+rk
	 fCdSeG3ZbhQk9uTpsEBuB0rdxUJcXl8NTgpRFf1QAoAixEgEtUObBGQ0Szkj5nIU7q
	 Xu/PjmQvIxoBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1CAF40FE4;
	Thu,  9 Apr 2026 12:28:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E87551D6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 12:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D23686087E
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 12:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2djKWB8grmhH for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 12:28:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::6;
 helo=am0pr02cu008.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ECC6E60631
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECC6E60631
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECC6E60631
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 12:28:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7loJ/yKlJ5giejQHxcvqqh+MJyKHKjodltHcjTHmnZqmIK6aVUE8o8GHPfFTYb4PgOumYZ0E7IBfLpr5E1PI+9OGQ7SKm/e6BtkPohG90CkiiFAo0WV4omBIBdLSALX6xS7F72Qa8iBxdRJJ7CrLhCPb6XeI8Vbg/tIPXwpKxQvLKgG2EnQQ1Havn1tzrv8E4yW1hEGC1kjzyh7p7ZfSUUxthlaRqR/ZVjzw5GUC4uPRtd5GbkIlGggK7NlijcWt+w9DSdy8xwKPrxzvxoEAqzBrdmdj5BPSMKj/5HmTmgoIGWdTmY2YzW99icEdKGhOELKre5gY5/pglfXAenmqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z79tsSAlWe9lsmghElfrYHzTVwHYs6XP7ZfMJFgycnE=;
 b=wuIendxgowfhnBVmoOxTG+VwpIKYek6WIIn0akTczfgJxaewLGdbKgQibXn/NXeOIl/sXcA349hEj2r+ed0lmtpQauzE+bzXeCsrbruptNmKe3VoQ1b8AYiHF0topoZ/LA8LHAF5Uz+qW3dBJTwsRJfII+sxuZB8AIOeRrSgRPubpz3EFtHDP1p0VGAVDp6ZVqvPLd83yhmkcQoo27K1oSrYhvV4b+v1ZNth784eVM7M5EoMsoHVlH6Vo4Py3ZZrKsvVsZzjoxPP08N7kS07Vr3fCFjK+9iLpUmIn/IFKXWTr5XlZh/07s31qebqxZ6WId4V8SM8pfnYtbMjG1/LWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by GVXPR04MB10083.eurprd04.prod.outlook.com (2603:10a6:150:1b6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 12:27:54 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 12:27:54 +0000
Message-ID: <ab90fdfe-b76b-4e3f-8ca8-5675a4473874@cherry.de>
Date: Thu, 9 Apr 2026 14:27:53 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260311140457.140041-1-thomas.perale@mind.be>
 <20260311140457.140041-4-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260311140457.140041-4-thomas.perale@mind.be>
X-ClientProxiedBy: ZR0P278CA0122.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::19) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|GVXPR04MB10083:EE_
X-MS-Office365-Filtering-Correlation-Id: 84ce4943-90e2-497b-9e10-08de96336cb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 66ZiItVXVjzZ1q7b2AypBYuOQXlE1KUoedpjS1HaELEk8Y5z3HT5Jd8thPlLBPiF2Z7SIZU2vrtE4cdbF1qPCFC+p6AoStmM5bCXOYJJoLWLr7WSHNZ0zBWpQRxr1NnjkmJhaWI8eZhucZQBEyRfwvCgzkHaMHxyi8ViOr8sSEwPi66av4MN4oWTKETOx2Lhg2cRhXwqkL6hVYpAX+fhA8OdwordS9gp7Jz/StSUhyrA2SH/KUMACq9ph8IdxnVCIDDPx4mHgc9ZWWGJaFEGqWm+muwXsf9txuQhtIJVVZIFbgG8Ce/y2CfLd+HnhVhiUX3nKljdjjlPhJ+wRSvSh4KDQ3wuiQ6LobL/Yu6fBr9UCsiT4NbclRc4WljwtgRhZjwqP7ugn1rhB/tTAyBs2FWm+C1zjaDhJj15HAgWLpEJfdbpE6SSB827VAP7o/m2FZ/cVemfOmgpbYMH+aYpBQ6LMR2FRzJ0xHRcSVkVurJkLT0/jZFALTAZ1roz1PgzaXV4YgN4OALI+7kVyk9ZC/ePXLtAjZUHqDIsTYQT1if6yVfEbpNhQ99EA36O7sXE+ofygNJ5PyF/srVycyVNqdkrulrA2qMv04DqEZXMy7qzGHaa4ktxUGP0kE1tg7TSYxGXx0lKTLdeJubS92Jo/W8OR1Kolc4KzurUq4Zd7k6UIEnOaG3D9jk2ajsV7KSVlP74rdWclSPaCyK12vAXOeims3hVi+yf5LSoDh68nO8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUNBT3FqT01rOGZuVC9HRndkUTZqazZhaUVpaEFDRGtKVFJPdnhGSS9MSGpn?=
 =?utf-8?B?ei9ldHdQMFdCZnBlS3cyVUZ4eXJpdU96NC9xUTc4ckdMTDV2Mkg1WGVtdnAr?=
 =?utf-8?B?bmFsL3VyV2FSWHlweTIvM01pMVNwdm5OSmRjTGpVbVJEYmwxem1iOTJadUxu?=
 =?utf-8?B?UEJVSTBQd0NucGQvYkx6YkFKQ0owMUdPeHJWaFM0NHpxUEllZjYwaDVLbTlP?=
 =?utf-8?B?SkxRQSs5N1h5K0tLbUg4VnJxOG5Ydi9Uc3ZPSFdSOHB5dk9PWWJQVGxpSjZK?=
 =?utf-8?B?Z3pvanVXNm1jdE5GMXBSeWs5dXBtWXhnUUVqcllJdC9tQUw5aUczdE5lc1Qr?=
 =?utf-8?B?NzJESUxqVEFQYVZoSEltNXNSYVcrQ1hzcUJWUnRUZkpFcy8waDE0UDkyQ1Bz?=
 =?utf-8?B?bDd5ZEluSXB5dlZiWVpqbkZKV2N3eWpoTjV6L2NaenpFRXdvT1ROalNReDh5?=
 =?utf-8?B?eWhyVlVHMGFzbkFRTk5CUzA0bE9ieXVqbUR2cE9KWDNDN0pSdlQ5am9qRzhH?=
 =?utf-8?B?dkgzWGZ4UDBmeGhFZXJ2bDNFRjZCWFhYVnp1eWl1d0Eza0FwV2tSM21pY0JT?=
 =?utf-8?B?SGJpZUs2RndIT1lSYUVxVjBxZnlnd256YUE4ZU9WR0VCd0tXZUNwOGh1R0px?=
 =?utf-8?B?WTYrU3FQV3ppZVRkT3ZOc296UGdLUk5KZ3AzcysxeXg2ejkzMmRqVUNVbHpY?=
 =?utf-8?B?VEtiNVdoQ3Q0WmdHQUdObUk2aHZhVFVReHhENVNncXV5NjBmV2lkQ0lRbXNh?=
 =?utf-8?B?cjFlTkVXcFNRTXFORlZxY1lpVjF5RG5mRURjOEdqdWp3Qy9CNDNaRlBqdDkr?=
 =?utf-8?B?WUE5dkFMN3dQUjJyeW1sWHFGL2h0Nng2MnRheUhPNjJlSkppK3p6RUdPOXM2?=
 =?utf-8?B?WGNsTWlaZEg5SXkydHE1aEZsZEtFQjYvcytwYWZrWXk2N3BLSjNrR3NUbUxt?=
 =?utf-8?B?eVVPRWZFdEtLeWcwRmdhYXBnVW9waEUxVFR6N3RzSEM2alhpTWhUdXZzek0w?=
 =?utf-8?B?WG9CODh6NVAyZ3JWd2E2ak8rUStlMTdZL2VLYUZHTDRnSUU5NEhDVWFzZXlv?=
 =?utf-8?B?aW1IWHVqY0djYjN5UUgzbHhxNGZWSzZNU0FWeG9yR3FGMFJCZFJoNUpYU0FC?=
 =?utf-8?B?ZERnQ1dvN0crMzBQc21oRks1WFpKbzFHRElLVWJPNm82WTZFSUkzdXBQQ09a?=
 =?utf-8?B?NEU3bDFUdkVkcWJrY0JLUjRTaVFmcW5uNk5JTCtrTlQ1WHNlMkZjU0MwdlBq?=
 =?utf-8?B?dm1HRGRUUkF1OEF1enlwZWxWd2M3dnlKUzVhQXZsK0grSlEzYmlGQmpFY3pQ?=
 =?utf-8?B?TEJzcU1oZC8vMDJuVXBNOFlvOVIwWEswdCtzWEN3bkZlNTFYMFZOeTJBL0Zi?=
 =?utf-8?B?bGYwVnp5V2FZU1NqNG9iT2JxTEdiUnZXMFZiZ0xqLzdMa2txRDE4cWp2Z3RY?=
 =?utf-8?B?MWErdDRCdndTYVVxeldRUWorVjJRcG9Rbkp3ckljYWFBVldDSjF6dUE3eWR6?=
 =?utf-8?B?Zk9LZWY5TlVTZk8zRjVSb2lKeG15NjVVTDZnMFFJa1c2cVI3NXk5M0FYQ2xm?=
 =?utf-8?B?TXp4WDFNUk5Ta3paUzF5R0FBWExjYitLbm9zSzUwQmZvZEtUeHVRNmNTcWsx?=
 =?utf-8?B?OVFYYkF0NXRuSjMzVEttR2JXSjlmMWxrdnFBTW4yVHY4c2ZCL0lKNjJpYjc4?=
 =?utf-8?B?MktWM2JTVUJWbU1TaGNwQUZOdzVxSUQ3eDV3RVo3V1NWL3RJeGRQVTlIZWtB?=
 =?utf-8?B?UDg4Ky8rYTI2WEh3QVNpY05EOHVDbEdOcEhiK2JONkZoaHFkTlNWeVhGMHJr?=
 =?utf-8?B?MVZXMElrcFlvcno0ZWhTK1pzNWMrL3FzUnRwekVOM0xYUUJETkIyekNIT2ow?=
 =?utf-8?B?VGdkZEpyR25FRUh2alYva1ZDZnRPOFNtVjBjdTNmdUVibzVBMCs2SHBaeGtz?=
 =?utf-8?B?MmpXQmZodUhMQXFWbUorVnFwbUxhT2gwQ2UxNE1UTUozOUdzSmsxeGRjMDNm?=
 =?utf-8?B?Q0duNWwvamlDcHNBVHdERWNRdlBwbmNFVXlJK3RCVkFtWm4xdnpYbDB0SHZC?=
 =?utf-8?B?KzRlZFNHdWF3RW9zR0MzUjFJeGR0Nnh4cUE5MTFDcE52WGxiMVhRVkkzYThW?=
 =?utf-8?B?eTdLdXd6My9OQkRObCtYaFU0NHhWcDRSS2F1Rm53S0lPUk1zRnJWUy9FWnhT?=
 =?utf-8?B?Q2RUY09sRFV1eXQ2b3R6MW5vcEdFZW5ubVQwd053WnFTenBURUtycWp3V1hQ?=
 =?utf-8?B?MlVJa1BpWGphZU9oVnhhWkkyWmlWYTRways3dkVpYzJKUHNWcEJ0QWVxeE9V?=
 =?utf-8?B?Mzk1WTkxc0N2Z3M0dzdtK1ZBZnptbEcxRFdtQlNENTZQa0JuY3Z2eldpUFU0?=
 =?utf-8?Q?xVubpeWfv/ZZKcSd0E8/bBJmqde1aEGc00nzk?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ce4943-90e2-497b-9e10-08de96336cb8
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 12:27:54.6836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XubsHDeZOk6qnxOTDrKBk964moi878LCwnOz2oMHEiAyix50DJ+E4sMXIEpxVsON8YOES2jniqpoWEVS3HXE2zOtlbPN7NwH3FFIIdPJt2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10083
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z79tsSAlWe9lsmghElfrYHzTVwHYs6XP7ZfMJFgycnE=;
 b=Ewx4UJdp6ov+fnWjEx+di8Csndl5M/m4wSd890ybL5mM+gInLEdUvsOh6n3xnVCZVQn5kK6RGxfzinfxCNLl2/P8MzKxUuG/FvkNSV2VBSwI81QScii//WPIBYr+qNxki8/D0b+u4I6A385xJLqFj5jPCLk9Jsb8XU+M6RKfSBE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=Ewx4UJdp
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH v5 3/8] utils/generate-cyclonedx: move
 utility function
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
> Move all the utility functions that are not generating CycloneDX
> structure to the top of the script and group the CycloneDX generation
> function together.
> 

and the non-CycloneDX functions were also reordered alphabetically 
(except br2_parse_deps) and ...

[...]

> @@ -169,7 +152,7 @@ def patch_retrieve_header(content: str) -> str:
>       DIFF_LINE_REGEX = re.compile(r"^diff\s+(?:--git|-[-\w]+)\s+(\S+)\s+(\S+)$")
>       INDEX_LINE_REGEX = re.compile(r"^Index:\s+(\S+)$")
>   
> -    lines = content.split('\n')
> +    lines = content.split("\n")

... this was also changed.

But I could reproduce this locally and indeed it's only (except the 
small change above) moving things around so:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
