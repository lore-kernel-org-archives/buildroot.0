Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCA0C4332F
	for <buildroot@archiver.kernel.org>; Thu, 15 Dec 2022 13:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BFD0409AC;
	Thu, 15 Dec 2022 13:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BFD0409AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f8MgZ0fqbBWV; Thu, 15 Dec 2022 13:20:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4429C409F1;
	Thu, 15 Dec 2022 13:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4429C409F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F59B1BF30C
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 13:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AE1C409F1
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 13:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AE1C409F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYhpT_wGPLB4 for <buildroot@lists.busybox.net>;
 Thu, 15 Dec 2022 13:20:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63D67409AC
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63D67409AC
 for <buildroot@buildroot.org>; Thu, 15 Dec 2022 13:20:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnla7UOBW72m9xskt3euki56DvfC34HjR1/szx42Eiwfihrj7fzhYe1Ws4mN8Tc/QfumzWllTR2FjlzTITqSUq9136+kLz7VYZ+tmNkOfinT2AxH9GyhzNkMfZtyvL7VtrdAuUZucGVBvcd9sKYAZxH73WO7LEH1L3bUKIM63LG0MiuCqsNft4QxiFU5UfUVZz6vfBhmjYnDR5MzUF2vBezqlcakqERIR4vZm7ju4Ajs9U/MQsq6qgKjCBQFC/9AHGhAa3/PSj//St6KXVV+38dL94MDB2M+vXPbwuKFDzTWbBKYm53WG7vJBgbIolYxv++Wha8GQ0Rl3SYqx4Y0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlzBBVBWKh5IueNRvqrbXfZK4UVICkjg4Vlb6na0xSI=;
 b=bDHAb6EvyBMPnVCK0EPr6mKNZocK8vDhfbE3YV5dc+seXAXomLychQkwULT+VBr+y0O0Ur6Y3dprtYxdjQq2Hy2DWs4rdnL89ce3Sc7dHCDGwHG+kfXvS2bl87ePkqfpvZQbtmWF1Mc+ywyEE7yGlJp4cLJyF7Nnfx6pAckghtvM6B1RXRqR83XeDNdWSMHHJZWkDufeKmLHoMOgRJncP3WyvbZ0tFunFgnOc4LFzoSInHdkEfOPnJy6vwOyQPnoGYQsiqi5JukmCtEt1VQCatCEayzwxes5L5K3EgESExciYB0C4zZVSalPd3ocW0AOWL+0DElsqznfqgKmeSUrVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 13:20:44 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%7]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 13:20:44 +0000
Message-ID: <450d76a0-6324-5ec5-e3ba-e9f615555810@theobroma-systems.com>
Date: Thu, 15 Dec 2022 14:20:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>
References: <20220917215300.1330070-1-james.hilliard1@gmail.com>
 <cca657ee-bbf2-2fcc-8e09-e7d7f6733694@theobroma-systems.com>
 <878rj9u79k.fsf@dell.be.48ers.dk>
In-Reply-To: <878rj9u79k.fsf@dell.be.48ers.dk>
X-ClientProxiedBy: VI1P193CA0022.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:bd::32) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM8PR04MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: cc074843-478d-4dc7-2547-08dade9f2b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JfndUvnUbFlr8wjB+gmD37+fq89V81xhW8GeYyN8+tK+VWS47lOODsfFNeTum3ciX+kJxGMu4HvioyC7Y91CerzDt1VQIZQ07jhAJR5sS0cax4JryhMZo1WyeRVeumza4O1Hhqu3+EQcD5mQGvhSjDdUBUTf24uKuAOQKMBMTxGYxQNQWRZxtM1k4oRJlNGI8pP9t7jFJXyUxZqh9qEjJh07vRw3Uh358m0giESGpsgla29+QFAWvK00ei7JURQJ7kYnLsr6cggqRREo6O9Sjot14rsvK7OBfIgvzMT2y/TApbHF3J3BGpvWYIkB6kPC8LuMcX27w6fX0bcCooP7nJw4WYjEbxVcpok2hleV9cbqO8btAGrsDNF5IGHhSqniuPBJMjb/bkfAwAVqCMwbgX3fnSuxbXPIC8FyIHomZxH562E7hXZqPgej0Ec9bNvFrto2xxOeXZ3h4Uag4bRuT3D2ddMYXU03e4vwRjJqrqeB52fkbgKvsHxgakWOh1DX8DKp3Ajhdik8FKCG9TABAsM3Fznb7nvXz71XqhvQ/myQOtjkX8Y4xzQ2/gQ+MJ2IZ0ZXZBtBTtjwQt7JJb1HoMf6dyhIvL5BDHYvYsndFJ2s01GNNBLMYV7njJRIEuXpTztpHbUac8dZk8XW6A1Asgum4MyEVKxc3884UWk+OSMSKufApGyGfmBjZc6LjzKDc0BdTANnn3J+CGnMDES19EogIwaobuoxDPn6O08swxqeG8NS1+xcJM8md2TlEmxx2r96cSeTykWNQz0MKtIt1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8536.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39850400004)(396003)(366004)(136003)(451199015)(966005)(54906003)(6916009)(6506007)(6486002)(31686004)(66556008)(66476007)(478600001)(2616005)(66946007)(6512007)(53546011)(186003)(4326008)(8676002)(41300700001)(83380400001)(8936002)(5660300002)(44832011)(2906002)(38100700002)(36756003)(6666004)(316002)(31696002)(86362001)(43740500002)(45980500001)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amRDT3Z6eWhDeWdKWGtqOU5uVXJ1TmxJc04ySUV1eWxzaHptSDEyV0tmU2hp?=
 =?utf-8?B?dmdjZXpXRjhHaVYwdXNVa0lTbjhBb3RoanBwUWx0c091akM2NzdKcDUwOVFE?=
 =?utf-8?B?blJIUkNkeklUM0JUODF2b05OSXh3eUpJUjNYcEpUb0lRSnRZb21XRHhVblll?=
 =?utf-8?B?L2lhMkdQK0N0bXprSU5nVllnZHZhTFNRcUdaSkNQNVhKNnh4UFBVSXlORDdT?=
 =?utf-8?B?YjRrQWNtbGVCKzdNMkFWMjZXeU9FUFB3YzRZbGdONEpIdmVNV04zdTgxZGd1?=
 =?utf-8?B?K2hvTjBpREM0ZW84V1o2bnFlTldSM282OUJRVTFuWGpCQk1EaysxWGJWdE5X?=
 =?utf-8?B?WDFJbHE5b1A2TzFwWjdhM0YzZVd6ZHk2QTJFMFNhY241ZkNiU1gxd1RHbkVZ?=
 =?utf-8?B?Mk9zRUNRUFN6MkpncFRRWmZxYVpXbGEyaUVOR3ZSdlpBdjF6NEFBMldacWo1?=
 =?utf-8?B?RDlsTWNkY1AxQmcvM1ZWRkhDS21SdnB6U0FvTU42cW5Ma3A4clVybkZIelNF?=
 =?utf-8?B?RDRsdEQ2QWVSajlBWnZhamNjTnNKa1dDc0o3akJoTGozS0JXa0h2M0xsZWtw?=
 =?utf-8?B?eXo4clVBbk1sK3dFZWxuMEQ5Ym5jWHlQNFJKeFQ3aW91R2JTWXN6d21aTDVO?=
 =?utf-8?B?OGJsZjd6dStqblpMQlR1V0hTb1VxUDZDYmJqWG9KbUdiaHlNTGZGSk5hekU1?=
 =?utf-8?B?aVdOczM1bTZmY2JLRHdqcTNDUUxqSDFnUUlyOHFsRGVJMU13K2VPWU5haTJk?=
 =?utf-8?B?Zm16ZHNQTkdOekdRQVZ2eWJVTVF2akhCMTRFb2d6cnhIa1pSS04wZzl2MzJU?=
 =?utf-8?B?V2kwRjJJUlRIZW1Yd2xkRDhlQU14MXBZNy91WlRsaEtIQTBabHg2Qk1uYmdl?=
 =?utf-8?B?R0dNcFY0R0EwdENlOEszbnNPbEFpZi9JeGRkUEJWMzljSW5wZU1LM05iRG9N?=
 =?utf-8?B?WldoQ09FWHZ0ckxlR013TmtQZStOYXU0am9qK1JoTlBQd29KbXRjNmdER0FZ?=
 =?utf-8?B?Y0JDd2hGdXhXV2p3RE02VndiTkdPNTJGM3dmRUd1aFk2bG5sNW8yU0hJZ2dH?=
 =?utf-8?B?Y2NJYllCR29xTmxhVnpGSmdTMjZGaW9mWlVnZFB1U25HQlNISlk0akNRWktq?=
 =?utf-8?B?T1JOVno2elVZek50QVZ2cXZ4dkFMNnZsVmtocUduZWE2b0pEdGRSaFVZUmx6?=
 =?utf-8?B?d24vekhaYWFvL0w4Tk1GSEZaY3hZMDZGQ215Q0hlaE5QZzlEMXNMVDZGeldi?=
 =?utf-8?B?d0FveHVnOE5GcUFyZFU5Z3FGVXZ4NlRLQjBIK0dCY3k3TEFwUmdlUENYNmw2?=
 =?utf-8?B?YVhMLy90aGg3U2ZlbXF4ZU91cmVva3E0QVBsd0xvZnBFTG81eng3bWtuNDNW?=
 =?utf-8?B?UCs3clA4YndFVTVzUTBlUHRlOXh5NkJiR1N3L2hVa2h0eXdpeCtERUdYTFBp?=
 =?utf-8?B?NGxWOHFlS0wvOFhiOHlpUDFRRUdka0YxUk5FMGMxcU5iSlF4cWJ1aFdFanBH?=
 =?utf-8?B?Q1JDL2Nrdkl2RlQ2YlcraTlKTkk1QWhRK0pRZlVYa1VrSGRZOWcxdCtPNkw2?=
 =?utf-8?B?NFNLS04xbHg4TUd2R0hoNTMvSzhWTGNVOS9raFVYMzRIZWtjRSs0N1FSMHU5?=
 =?utf-8?B?NXdqV0tuazFIY0RPZ1A5L2Q3WnIzZTM5VWVpQzUwVUVkK0Z2enR1UVNNYWth?=
 =?utf-8?B?aDVmS2ZwZmJCR2lvSjlWRnM1eStFOGpBVmk4UmJPSE5GOWMyeU1PUWd3NTl0?=
 =?utf-8?B?RlRhemY5TjV2azFnSWFjUW9VWjgrbUN1WUIzNFpxbGU2c2VCM1FQaUpXWEZF?=
 =?utf-8?B?eDI2VEZnaGpaNXAzRDNUKzk3SWZqZkVuZnNERlA1UUF2b3NBL1N1eEluZlQ1?=
 =?utf-8?B?UEZtcFQ1NnIzSFF0WVBEY0JQWnc5YWpCU2svR0MySS9zWUNYTGg5VnFUTGcr?=
 =?utf-8?B?am9xVjY5YndPV3l0TG0wV0RrY0hIdGJKcVR4Nnhid24rbG5ydFFKYll2R3hW?=
 =?utf-8?B?alNob3orRkRHaGpYYU11ekRBM3pYeFM3eFpwVjB5UzFxaDJYSXlxYmlLL1Zv?=
 =?utf-8?B?eE5JNXdRYzlKUVg0NnRDb0JHNXpBVHVWQTlFd0FpcDczL0hnQ08xQmtsRXox?=
 =?utf-8?B?aDk3VGowbTZPWm41YXpQbGlxOEQzRUJzUWlMM3ZXc3VxRVFsK0dvVzlkL2tk?=
 =?utf-8?B?Slh1NkVPZ29PMFE3ckRIWE51TEhVOXR4YzNGRnFhNlRZdXFnVFhOdUxIQ3RT?=
 =?utf-8?B?dWNCWmtQNUhKUmZHOFArRHZWTkdBPT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc074843-478d-4dc7-2547-08dade9f2b04
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 13:20:44.7170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fyf0e/ugqXlwZJ5X/JQtsln/qycX2BaLpudty+HrkU4Ft04XiNbmP6kW4MmXtqGE/6FT4twci1hGFZW1/WadrQxYumAFO04xyDqKGVTEfcXz4DVEtKsIRvXi9ftufoMb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7300
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theobroma-systems.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlzBBVBWKh5IueNRvqrbXfZK4UVICkjg4Vlb6na0xSI=;
 b=VbbMzpHN8f+OnLlWA5N2DgHUPGU1B2uTSeZIqemdh6fOY4McE6al11ERmg0Ef+iSMXtLFBW4DJKv57+shPdhbEifvwK7SnrpSZUz3WOcxTiNEfmHc5HbTEjD0p+ay8K1zo6drjADIpSqcJHava4Urr/BirpL6P4yFUBJCD7NBSrJ96Sj07gQkHxeBOulyPiWtJUKjpLi3uUPw2pKOXiMqBMNKE4lCTG65ii9YQCZKHnbB2Y66QVQk0D5IA8l6zVGMpgrc0bRrqQzQPxH2j334lhWkpeEqY9Gg5DnseCIWlpFXMH2nr78cVMuO6eb/ebv6fyhTQEwU3THGJP7tiIM5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=theobroma-systems.com header.i=@theobroma-systems.com
 header.a=rsa-sha256 header.s=selector1 header.b=VbbMzpHN
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/wayland: bump to version 1.21.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 12/14/22 20:15, Peter Korsgaard wrote:
>>>>>> "Quentin" == Quentin Schulz <quentin.schulz@theobroma-systems.com> writes:
> 
> Hello,
> 
>   > Can this be merged back to 2022.02.x and 2022.08.x as a security fix please?
> 
>   > Versions before 1.20.91 are vulnerable to
>   > https://urldefense.com/v3/__https://nvd.nist.gov/vuln/detail/CVE-2021-3782__;!!OOPJP91ZZw!ht7B4n-NHoUinOJyrCggycWhjw_79i_yqZiuq1exA7VMLcIwTf2Lzwu1iL-UviZg2Eb9AzmymXXtdALNJ-9-_K3yl5hV3g$ .
> 
> Thanks for the heads up. 2022.08.x is now EOL, but we can do it for
> 2022.02.x.
> 
> What are the reverse dependencies? We're currently using 1.19.0 on
> 2022.02.x, so perhaps it would be safer to instead just backport the
> fix:
> 
> https://urldefense.com/v3/__https://gitlab.freedesktop.org/wayland/wayland/-/commit/b19488c7154b902354cb26a27f11415d7799b0b2__;!!OOPJP91ZZw!ht7B4n-NHoUinOJyrCggycWhjw_79i_yqZiuq1exA7VMLcIwTf2Lzwu1iL-UviZg2Eb9AzmymXXtdALNJ-9-_K3HtNL-tw$
>

It cleanly applies after 
https://gitlab.freedesktop.org/wayland/wayland/-/commit/03e8a1f84b6a15c9531db1ca8d0a25f9fcffaf25 
is applied too. So that could be an option too yes.

> Is this something you can do (and have a setup to verify on?)
>
The commit specifies: "This would currently take a massive amount of RAM 
[...] take an improbable amount of RAM to hit this, and a client could 
still exhaust all RAM in this way, but our goal is to prevent overflow 
and undefined behaviour."

In the merge request there's some rought estimate: "conservatiely 416G 
of memory allocation to get to this point. We do touch it all, so it 
needs to exist as RAM or swap." and later on "if you can convince the 
compositor to hold a ton of references to the pool, you could make it 
happen with fewer objects; wl_shm_buffer_ref_pool() exists and asserts 
that the external + internal refcount stays positive. So I think you'd 
'just' need to get it to take (2 << 31) external refs, then you'd only 
need a single live client buffer to break the addition test we do in the 
unref path.".

There doesn't seem to be an exploit PoC available somewhere (as is often 
the case) and I wouldn't even have a machine at hand with that much 
RAM/swap to test this properly if there was one.

As for the reverse dependencies, I was planning on doing a simple test 
with weston (which is the only compositor we use) but that is of the 
same version in 2022.02.x that it is in master so that won't tell us much.

Are you concerned about something specifically? Is there something you'd 
want me to check?

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
