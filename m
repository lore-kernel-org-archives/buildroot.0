Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4C0C531D4
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 13:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69E1E60A42;
	Thu, 23 Jul 2026 13:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P81c_oaA63mG; Thu, 23 Jul 2026 13:59:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F2E2608F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784815140;
	bh=LLltt0RwZ9BcZwTHjhdtpkFNDz89NG1Ib3IltnmiE+E=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=V7kTFQ1aP+bGjVSTDSmNUXTXdwLj42tjdT68UHJC7Hyt/2WVH9LsIFqt4w7zEz+tZ
	 Xky+eApRVsQbXuL8jWBuNpBdGla1gAowXfLWGRT9miZvRSUf6PpJDxlMCGTpWZ3AZH
	 6i9HqqAu2RFAm2KqWUUcAxSW2fRDT+YLUO/xf0nLF2bX9zdm/rgirBfx6icZH3g2oe
	 ODvF7uIV/lKibwJpspxtkughZtUvRK9osKsKBpHrPip6NoPcYFEADR4mU0oeEM6kEv
	 c5mnZULivl2enGXLQC4Ryr6YG3wc+opPEKD+Ka9HwQK0TUrCXtv9crrXIwgb+CvTu4
	 6eOtrdEF77JBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F2E2608F7;
	Thu, 23 Jul 2026 13:59:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BDDAE490
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 13:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB49E403E9
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 13:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_8ykJ9OTT1q for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 13:58:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::3;
 helo=du2pr03cu002.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E92D5403DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E92D5403DE
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E92D5403DE
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 13:58:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZyoKunN5a+XxOKNvcArqXfFTVQdqIgQdtDvFa+T38jVSPjuRvlY+U8rpKoLA2Wgd2yvX/ukW6QpUY2uu7nGexFn8Q56dwGCoIbP+Kz1iiTgMFIxV9jmFxDnoIUvP13sdywzsyYva74fob2s8cZRFYetJN1k5NSXlo9CTBXaW3GBw+lVtfKKYW6O1aa8MRuSrvhht0ZaoL1hV1xK2I6MgyRh81USO+bOUmFhJjgGSDIyMAYeO9H9kcpUhxi8bawK7rjGHNmb4bl4vsFNUX11wQUjb9hiokpeD7knzAJlNgWQA63KNIGxfHMkCN+8gPHMB418YKF6R3xA7YXgQ0aN6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sun53HxOhlGI+6NSZYQhcFxvB13GGuR3ZGfNbejw/X0=;
 b=KN0LaiFRJicHsaD8nINeXVOTCWSgtFeQI+iNPqswovP/HNOLFWi1YG0vTax/Q1vq/raekum5G8XwCIznr7oPi5Pa7zaPiejo3iJP/ax5AdcYd8m8nbI6N/7DnQXP+TBqw26/IQnomi2cyH1pUeEdNmQ9qur2JnyhoeEh6NRycURXZf1NHm8UyDVLgykE/BAKzeFU5CE07yyHMlzrEErvA8h426fam4FlTkHJ4L3p2gHI0ZEi0yNAfL3Hn1dLuzJ692c+zmvlHBt3kaicl1j9LDGQTBbRYn/ue8f8Hw34bd52asWm+VXR/5kvnyV0jHdZRsdxyk5ub/j3Vg1F7f3MPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by VI2PR04MB10218.eurprd04.prod.outlook.com (2603:10a6:800:22b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 13:58:47 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 13:58:47 +0000
Message-ID: <c880efc7-faaa-479d-9f19-0b8f266825ff@cherry.de>
Date: Thu, 23 Jul 2026 15:58:45 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260624101340.80670-1-thomas.perale@mind.be>
 <20260624101340.80670-5-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260624101340.80670-5-thomas.perale@mind.be>
X-ClientProxiedBy: AS4P251CA0001.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::19) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|VI2PR04MB10218:EE_
X-MS-Office365-Filtering-Correlation-Id: 96434271-8327-4278-5b6e-08dee8c283fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: X6JKGxEfHmDgro0TgDP/Hmd23uEDsJJDNGcoY5aSytZTfYxHoeuoxpJfPX2VWOuU8mvCNQho4LwDYKeA7ZZMt5oNHELxcK2fQMlUjb2PIUxPZ9Wcc5oQESyYRfkY8yV+iBcZWQU4W4tpLodYEz0csivhxG2ZMpGXqwDVW7UeqdmjUby8jtCbEDM2LGVvhqZGuF1bC/IX90YjzASMKFKIGOc1a5E0u2A9pd1/hHhGHICrDpl4fMQVDLNF1vWIL1RtD2zBKAb2MSJ48PEev5VfkorEp7UAn31f+vhbJcOd7QTiANdL8eSnE4QFuoYf7TWj9rlq1KDmbVpThbIxAttEA0+C1HksgG/uaupjwbOl2CBaKj/2rB/3k4T8wZYrfQx14IjTDnPCtK1Ue7Wglm9dfbF1hI8Kf6e99Q1af8Ru1O5ioAbevux6wJqzSW/hTLkaFoYe5Y0+gjvkAf0VSLufi3TfyEjiy74vu/x8JeNoIWYz5oOKRKx3pEQgfTfsr92hSEfXlAaVNelwLfvVAgTz84H5Qq/5xLngTKH87hUfvyw9HBzbGMtCQIZvndi5lIYw++epMANKlJXph4+evum+4otglFjImG8Zw4Vi6z4a543Od8oXBB6R8BmwF/K2I7kv0feEej0vU91MmOn4Q7bB5H2sqxEJ+3V78aN8jZU9OtA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXdRcDBEaFMwa3M5aWY3Y3Y2RmhHM2F2eDFtdVhKWTA4YnYyMk8vWWlBZ0NB?=
 =?utf-8?B?bkk1Zi92L2N3RlhJdjljYU5qaUdmaDRJWlZwTEhFUTNmOVd1RWtFb1dRRW42?=
 =?utf-8?B?MXdCZGJ5TDQ5UnN1SWpDa09YQytnR2pzVnpBNG5yeVBmekppY0tDWmdhVm5a?=
 =?utf-8?B?NUsxSHRZUzRJdkZxMTBwc3kxQXQxWk1ZdE50UzVBQ3FCdHc4NUdvUS9NM1Fs?=
 =?utf-8?B?VU44WnhNSU1IdmJJbWJFZTRqVlAyNSsvbURKVHFBajBXWVlpU1pzTUlyYTcw?=
 =?utf-8?B?K0o2eTI1b2Y0OEUvMGdaZDl2b2xjZGxGY240VUdoN0N3SjNWZk9zbklNeW4y?=
 =?utf-8?B?ejhqMlM0ZXZuM3diNWFjNmUwajMzdmFjSkMvZ0MzWm1qbGlSdnA2cFYyQ2Nw?=
 =?utf-8?B?all0T2VlSlE2Skd6Nno1c0FPaDFiSjFvYnFsUHE5aDdJRjdrcjJpeStsYlY0?=
 =?utf-8?B?MjNveFRlYTkrRHFGb1hZK0NxVUtKZVpwMjFMTkpIbktZOXorTGNUejl6eDUy?=
 =?utf-8?B?OGtJZTdHSWphcFEzUTNsZzFVNWh1a3Q0NHlJTjJSUm85TmZoTFZBc1JnbzA3?=
 =?utf-8?B?OXJxdVp2S1hQTVFjRlFCZzUwTHJDcFR6aVlUZkRPTW1FNklXMGdQemJ5ekhR?=
 =?utf-8?B?UnUzdldiMVAzYUNwRHZNaisxNXgzdDMrWjZ1UUNtTjlmZkk5dzBDSU1wL1Fq?=
 =?utf-8?B?dGxLeGhnS2pnSUtuR2Z4WXorSTNaL3hWWUtuakNWaDJaYUZDU2RRTkVxNmVS?=
 =?utf-8?B?NkY3b2tyWDc5NHJ1bUdRTlE1cWtlaXBsSnJlMzJwVjNMeG1qdDlnekhQejVO?=
 =?utf-8?B?akJ0ZGVQWU5BYk10Qm9zdkQ2R2pFaTdONDVLb2djaHhUVDdjTk9BNk9mRzdO?=
 =?utf-8?B?eGg0R2xpVXNDdkMwTUp2YzJqRy9jVmJxSk43SnhDVFdwWWJydUVnd0FDbkl5?=
 =?utf-8?B?eWxKZkVJWHM3TlpaOTNhd1h1YVFmY3ZXTkt0Y3NMcXkzWk9rckM2TXpXUjB5?=
 =?utf-8?B?NDlWdndiWEhsbmE5dzlCbERNenQ0aCt4TDd3VzlWd3J4WVdrRnVKZzRvRldI?=
 =?utf-8?B?dGEyV0NSVWtEMWk4QUxnQzJWVjV4NVlRZ0N6azErYm5WSDV3L2d5V3JnNlNh?=
 =?utf-8?B?MC9vR2VVSW1LKzBDVHZVMUhLZm9JSE5CSGQvcGVLZXp3OFZlNmdUYkMvSlFM?=
 =?utf-8?B?RTRZSzcyTEx4alYvZjI5SHZoWjBUQVZpM3M1UDhNam1EN3lndTkzVU9KTVRM?=
 =?utf-8?B?MGVPZ3hSNnFTdS9ha1hqZ1daMWRjcHlhdmJrajBRQWhCRU1CNDNManJ1eXBN?=
 =?utf-8?B?S3hFTkJLRUtzeStGaWFBeDVma3hGY1ZFQkZ2UW9BUHMrN3N0YWFJYi9zUE8v?=
 =?utf-8?B?WlJPNDVrQStVS0dFMkhPaFBCWDVpQnkyUXNIODg5eXlidzl4aFpqYnJLQUVh?=
 =?utf-8?B?ZlRFbkQrRTArZExhcjhSWkEzQVJ1N0ZaVnZER294OUpqLzhud3ZUYmRrY2d1?=
 =?utf-8?B?SHV0RW9pbmlvc0YvUGFGMzlEZXZpS0xsU0FhZUNqY0xVUXhqazRPdDBqYWFM?=
 =?utf-8?B?ZUZVRnQ1VEI1aFlSRGkwSzRJb1IwamtOREhYUit2QWtZL1I4MWVKRFFGenVa?=
 =?utf-8?B?ZWtQdjFyTzRyWURCejRycEF6YVVCcTlIUTV3ekQ0dGFoWVh4MjRvVlBxaDV4?=
 =?utf-8?B?R0EyMnAvNzU3S3dGUG9qbGdYd0hxRGNCM1B1RHNSUk5RMHI5bDJMdUFvMzdq?=
 =?utf-8?B?aURiNlB6QUk2THFBQVFXYkVSMmpRR0c4ZE0zckJRWmNuaVFuN2hFeXRxTzlw?=
 =?utf-8?B?TWRhb25LTzY0eGh2R2Q4bk9sYi9aNThvWHp1dG1YWU56SklnblN0MFp6aTl1?=
 =?utf-8?B?QU1tUW0zenZ2QlpKcG9WMmY4eVdKSFdwNXVEMkNJRnFpU0ZHWEZndWhVNVZG?=
 =?utf-8?B?Mk83WE5oYlpCN3piK0pyRGJuaEU3aXMydGFNVUdINHNKeWxKL1BCZkYzK1gy?=
 =?utf-8?B?Q3IwRGdNOEFaVndlbmRmM3dHeStRWGVlUVlnME5BcmpocnpxSklEaWxXbXlV?=
 =?utf-8?B?R3NxY1hDZlVSNVZ2WHFPZXN2TCtVTzNBWHBicGEzOXh2V3Y1a3NzRzh4R1Uy?=
 =?utf-8?B?RWMyT3VqWFpsbkZJK2lPNXh2OU5rVXV5RmZSbWZ1UGV1b0VnbFlCQ0JmY3FW?=
 =?utf-8?B?VHIvM1JMekxwUEk5WXhCdUZPYWdkNEErMnBadEIwT09OaWN0OGpwb2VhWEtq?=
 =?utf-8?B?dHZLYUZDNDVDZzJWN2hWRkUyTnZCSUZtdXRxdk5PdG5KUFJET01hbHNzWjdS?=
 =?utf-8?B?T1c5UkFlUGg4RStzMWRTdWt4bUxpQThQVWJrdksxa3dZdXBYN0grZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 96434271-8327-4278-5b6e-08dee8c283fd
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 13:58:47.0846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QxolMgck8RI9P9LR5veIvLRoJH759ECsgosX7L+DLI/cx7Uys+0S7CYH5KEGUDt5wcUMLgp7HfqIApTPT5+DCHG/OVtUDSfcV6Ft7aY4dYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10218
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sun53HxOhlGI+6NSZYQhcFxvB13GGuR3ZGfNbejw/X0=;
 b=PYNmeKoAqlPo0gX56e6JI6C7VYqSxW9+ZPfyhKkFO3QBhyLvOq6en/Qsm/CIT7Y7/w7LRQrgep/Fowcqk0yYCzVaXYi01QYrv86bqsNrJDpQadKxYI+c6CNtabxN1d4WW0i+XgearW6m0RlUFcdzRuFcTG74RQtwea4UrItnuCw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=PYNmeKoA
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 5/9] utils/generate-cyclonedx: move license
 download in a function
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
> Move the code that retrieve the SPDX licenses into a function instead of
> doing it top-level.
> 
> This allows to pass the CycloneDX version as a function argument instead
> of defining it as a top-level constant.
> The next commit, introduce support for different CycloneDX spec version.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
