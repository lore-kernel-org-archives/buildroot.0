Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59569C5B572
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 09:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7198409F7;
	Sat, 22 Aug 2026 09:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIqXCkMiaZlt; Sat, 22 Aug 2026 09:14:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787390096;
	bh=gBWEiJd+zNVQTetY48clbyJCm0j0sPr4GQBsLDS6py4=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S7E7IzSBkfFNERtpUwhlE5EAvcOIvgegvoVYZk4Q/G53G4GEwDg2eQvQOl6VQ6iPp
	 kjz80+F1HOSz+FpJlJg6Bgf2ikFU3J8lKYaoDkOW1eTBM1DzUQmSKPFcJv6D3YD7qJ
	 800MqugHGMMzUXXzpx6Q+smF097TpqXruDPgzFWuIB5zVUXN2B1gbJcyFFxcAVqNNl
	 wP6+elcYqLqMTPVOJIMzp7FW7croQldyOoyWNmtKqlKqLMNUX6Mi/o31C8W/21w5xp
	 vBnFXlMUGqdnAkDjmqH6vjd++E4YBj9mkkxe37TZowCIiSYK0Rttz330rlAdzWAlwi
	 xgnODnRAu4o5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C6064060C;
	Sat, 22 Aug 2026 09:14:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 69D67476
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 09:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6730180FA2
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 09:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SerNS4-lRrkS for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 09:14:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40d::;
 helo=sy8pr01cu002.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=R0ouvFjR
Received: from SY8PR01CU002.outbound.protection.outlook.com
 (mail-australiaeastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65CFD80F7E
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 09:14:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTZBhhrjtgozI6NmgXsOrDCCWuczTjS3L22eTLnRoQ8bGb9CMh4eYwR1fp4AEphj39LICqDLE30Z7nDE2iE9EibnbSYd4xWZbetLZr2KwUfe573gVVlMfZJokw9O7oNrMIeCVqoTDAdXhK5M/MdaasLqyyYmm8z5gCTMEeFNlxD7kTLr7ecG8oQgFSqkn/Z8Cej7oPRcE9NZQTJQgLGafHG/FaAdy4F8PbQgHzAeC+UDM9WC/o+TVho7FyEosOpprwNdFT+VzeBrh92i12rmUw1TJHGF4DuS9HIhpOZVdh/RZA0ykKQ18tkBNPb6tRGQetoKv3KgTO1Grr86hYPiIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYJ/1Qih+/cJoNrsR2nTCkSjJmCZWNuo/5CWq8t/eYk=;
 b=qT9bJkWjdw10dhBJBP4S8KCnwKXMOJgY/PoXPpCyeKBAK8vC79NG65t+qunXWoCgdVKBjZfeSG1MzxCap+LeTX1iSL3/TcoEjYZVTrfFl8RcDGhzB/moTzqzvE6nsyD5o7jxUAITOr3rDrvkjdV74TKrn14Vm/2JyAfvaHpk6yRgZcfv6NbU+opWHrxGtqGC37kS6nykGzpZDlf4hF/wUK6hyVH+GTHlFJpdY+CWEUNe9bDUwjXPPWooEWKT6NXj+4tNgt9X846nAlXSAuwyfOMGdrPM7Mya71lxBWHcrTLulBt5wqYjeKG41wHcKR9Ckb1WmzAd8coKgq1xSrrHOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYJ/1Qih+/cJoNrsR2nTCkSjJmCZWNuo/5CWq8t/eYk=;
 b=R0ouvFjRskSucrsmzTjjXb72CtA1+aG4ochVwmJXmvo9EPTLwMMEt1EvvwuL5C/ghDwiWwTSx/T2Jp3uF7o62P9N03KUxRYf9+VpieaiOh3tGhV8NsvsIirhrRhxKZ0yw69fZ5rSkRW3v0ViVmqCrOZe0wb04A/FTh4pzW1Mg6j+w2EBLjHKSIljCTnxxq3J3XU1nAmI8iv6pDC7u0Wt88tN2ryVuytvz+PNuLt+eeQibS/9XSJUab1Pdf8E0JLKxnbtBMaQzxeGfqqivVVqTFMj83o6F27/sebQMLDrxMa9PDJhyVW/ZOlM0f3LSXsnD3Drqw98lESDZf970NTJZQ==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY7P300MB1324.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2c1::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.11; Sat, 22 Aug 2026 09:14:44 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%6]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 09:14:44 +0000
Message-ID: <SY8P300MB0041DD7E48EB9FF02AB13414F8A22@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
Date: Sat, 22 Aug 2026 17:14:39 +0800
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
References: <aodS3qtR9YJL5U63@windsurf>
 <SY8P300MB0041233A165784A8729859B2F8A32@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
 <aoizvh0-63Qk71KB@windsurf>
From: Fengwei Tan <tfx2001@outlook.com>
In-Reply-To: <aoizvh0-63Qk71KB@windsurf>
X-ClientProxiedBy: TPYP295CA0008.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::9)
 To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <2d2dbd2f-8f29-47ff-90b8-2492fcc27083@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY7P300MB1324:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c592a6c-cbe9-4468-e22d-08df002dce4e
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|51005399006|15080799012|19110799012|8060799015|24021099003|23021999003|25010399006|5072599009|6090799003|40105399003|10035399007|2607281247196008|440099028|26104999009|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVRacXg3eFAyT2RVam9rRTlvNDJsaytBc0ZOc1diaGkraW8xbTEwd05KMCtx?=
 =?utf-8?B?MmpKQ3RGMm9GSVBueFNyOGM1bVQxR2NFSDZaV3BsSk1Hck5pait5ZDY0TCt3?=
 =?utf-8?B?TWo0TG9JUUtKVlI3eW5VV1dZUXRYRGNNcW5LTVltZitvL0NJNWtOZXYxZTFa?=
 =?utf-8?B?dTJEbW1EaCtycGUrdTJXeG1memxPYWllQzFocWJzQnBmQUZ5Zi80YjBZbUs4?=
 =?utf-8?B?QjJnYURMOE5yZUc0aVU3RWZmclUxWEdnZi9YWERaN0x0cU1NMmt0Rm5ENDNr?=
 =?utf-8?B?ZGtid21aTjdkbkRZUmlScTc4Y1lUVlBvRzRPZUVDRVNJNGdvWFNXM2o2Mk5I?=
 =?utf-8?B?WTFrQ0RIT0tLWStUdWd5WFlwc2JNb0k1aGlnWkFhNVlROHNFY01UaFhCN09F?=
 =?utf-8?B?Uko0ZFFmSVlsZHVPNzlVUmtPdHNlTjc5V0trNVE3eGhuTXFpbi8raHR1MUhX?=
 =?utf-8?B?TERIZitLbGdURm41Zks3Q3pZSkozSWE4WEZXTExUbzRETHJFRlZ6WFdzZjdL?=
 =?utf-8?B?TUdnVmN2ZURzOWlSNDQwa2FWWWlyeWplN0lYTkZXNVpRTnlDYlh1ZVZvTUxR?=
 =?utf-8?B?R3FhRm1CNDg5MGJRYkEySjdBaERQWDlzMzJPV1RtN1BBRlZ6c1VzM1U2UGQx?=
 =?utf-8?B?YjV2RVBGeFVsZmxIdURQdjkxeFdKRFlKZG9wR2ZGSmtIUGpHVWFkMlJuQnlY?=
 =?utf-8?B?V09ZcTFUOVVOTnF0U3FsK3crUGVTcEhFbnlXZVdTR2RPUzhXZnZ0YkxmMVhE?=
 =?utf-8?B?UFIwL29KMEZIMXZzNWs1SFFMZmswcHZHL0VnSFhSbUVnYmN4Rmt5eTcxN1lZ?=
 =?utf-8?B?YlpQQ3dsNzhxSGVoTG1BS1VVSnJHN1VzSG9YQmtvYXUyOG9XbEdZcGxLMlB4?=
 =?utf-8?B?Y0VGdlhvVHJMWWpCRWo4OER4VW12WHBUcVlmT0xrRUcrRXVwOXJlU3FhcHVm?=
 =?utf-8?B?VGFYN3pIaUlOanBhcUNsdUNINTgxVzh4RmdNZWp2ejFRS1Z4bERneTB2c0Rz?=
 =?utf-8?B?OGdXQlUrblA0VUxGSXZHSlJXRDBmNzRVQ2QvMkdOZDQ5KzlWdGdoOGNWMTNs?=
 =?utf-8?B?akcycmhzY1QvRm9OOG5QYlh4c0prMjNnT1lCUkZReUJaTXVTbEpvWFFROWF1?=
 =?utf-8?B?bzFhSUxsaURPWVg2d01uU21qQS9TcDRqUTlTeVZBeENpdkFkdkhVWE1ndGZz?=
 =?utf-8?B?TjR6RTRwUk1HMHh2NmExV2ZEZEZVZ3VvTmREVDQ4dVNCOUloYWlHcEpnNFpT?=
 =?utf-8?B?ZEI4Q2xjbHNNWXR2UjNuZHVvdDlyeWlFcGVWeFc1YjlhSU13Zz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkhBUG1VS0J2WWJFb3dQMk9QcjIrSlZuL3FKQWkvYys1S2NHMjhFWmVJSUJM?=
 =?utf-8?B?YklnZTJDN0xYVGFJUGVJODZTZlN1RmtieElJY01VTjc1NW9rMzUvTGJMTzZ3?=
 =?utf-8?B?MGFLYXVROTFLdWFJL05LN1YzRTVXbHhSUXhTUnozaytzaW41cGJLTEhFMkpo?=
 =?utf-8?B?TWNES3VGczdISDh6VWZsclRET01vcE4xS3VpVTkzQUNQOWRXNnF6NTNCWFdR?=
 =?utf-8?B?bzlaWWZZeWJwYXgxZ2UzamNaZXpiWFBCdW9pdmh1cFRqVjFLYzZuMTU3Sy8x?=
 =?utf-8?B?bnNDUWh1SHJXOFRURm4wb25PWERlNTVVVXpNSVNsWDRUcWc3NmkzamhlK0lO?=
 =?utf-8?B?OFBYR2VwWldKNWpOR1U3dTRXWGx6TlArSW1OK0dWMzRYRytIbmxHYkRtS04r?=
 =?utf-8?B?Rk9jSjBqK1BPYnVrVEhIbTRoUnpsaGVIN0RZVkhZSGhBbDFJK2JjMER6cXFo?=
 =?utf-8?B?WmZhdmRPd09YSHgwdjQ4YnVvb0JpRGZOb3B2ZzVPcS91RXRqMmlzdkgvWVBR?=
 =?utf-8?B?cWYzNHcvTHB5QS9RaWlCTzZPMHgvTVFPZ1NGdGhLclU4ZFltM3p3dVpVRDNB?=
 =?utf-8?B?OHRLN0JWR1RxN1VwYlF3clFBSkJ3WkJqWnVXT3N5a0ZQUWRkWGFTZUhZZy9W?=
 =?utf-8?B?VUI1Z3Rsek1FWGxhTTYvSVQ3L2F1b3RWaG1SNHhhZElRWmN0YzlxTW1YMUNw?=
 =?utf-8?B?MUtOQU9aVGxCVWxhL2FSVzZIaDlITFJ1eFZhYm9zSzA2ZlhXNUNaOVN0bHJi?=
 =?utf-8?B?Q29QYU8zMkdEc1V2V3RCTm9GNFMyV3NlbE8rNFhjN3U2TFRnTDdqT1p0MlR4?=
 =?utf-8?B?ZTlBN1NmUGoyM3JyMjh6RGtDK0tmckFIWmRXVUE2WFQxaFBrRm8rUTlFNDlS?=
 =?utf-8?B?VXgyZ3ZxV1NhMkxXWFRHWDNTVERocExPUXE2aFo0NkdXYkJjYmxWR2lSQ2JI?=
 =?utf-8?B?VHVhcEdHbTRwYUlmWjVUZGhRczZVa2p6azhMQ2dtTzZsaDRranBnb1c1VEh5?=
 =?utf-8?B?ZStaWkZWVFZYUkZaYktnUkpBZWxwRlh6Q0ZTU3FUZ2QyemZxYjJ6eWtJcmQ5?=
 =?utf-8?B?RVlkSHBoandVb0w0V0pVaXNObzR6bjd3dlRzWUhMb05LNUoxbmR2ekFvWDZX?=
 =?utf-8?B?cENKWXNlN3k3WXRKMzVzbWI1Zkc4QTgwVTJ3VmEwMktBMmY3ZitsVzM3aDdl?=
 =?utf-8?B?bVdJRE56NThldGl6ZWc2Nk9EZlFJMjkxTUt3TGpIZ1FWWUNTQmx6cHFGeGQ1?=
 =?utf-8?B?dVNaZVJKYnUyYW9UODdrRnQ1N3A1bVE5ZlpGTkMrbGZmRDk0eElINW1hL3RS?=
 =?utf-8?B?YWo2TGhIY3VCRkNYSmJPQ0hGcVd1MktNY3FHNnNRVzZrRXg5VmFGM1V5TUZG?=
 =?utf-8?B?S1RDN2FXRWxGYnJvbE40VThGQkMzV0RBdWlScXZsY3c4Q1hncFkxN0Z5UCtO?=
 =?utf-8?B?NzlxQldXcmNUcUEwMk1wUFB3QlZuR1hsVmdBaGYrODkvaWdxTElNMGFUVXdV?=
 =?utf-8?B?UURaRndGbW52d2J2dEExLzdsSnZOU29zR3ZBaGxVcHVnbXpWOEtJSmJwTy9V?=
 =?utf-8?B?VkpQZ1hDZmxpdklHQkljS0hvWDNoOE1ka3Z2QXFKRngrVnFxN1EvenZsV25H?=
 =?utf-8?B?bE5XVjMrTldORXNqR1dXSVpna283Y3dLVzNBeGtybGM0TGpxNkV4Qm83YWt4?=
 =?utf-8?B?MldZYkZCdm5WMUo2OVh1dVU0dWFrSHJKU2xDWWI5Z3Q3YThWd0U5Y2x5cE0y?=
 =?utf-8?B?TS9qSXJJVDRFcHFTUU5PNkRyKzVLMkw0bUtoUTI1aTk5U2VUMUgxbkp6MkNR?=
 =?utf-8?B?ZVZyQ3Erc0RtMFNwdGl2OGtDVHV5UjYrZXNTUGd5cmN0L3hEZzUrdmNRUWRr?=
 =?utf-8?Q?vwCMi+CPILzbN?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c592a6c-cbe9-4468-e22d-08df002dce4e
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 09:14:44.7092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB1324
Subject: Re: [Buildroot] [PATCH] package: fix builds with
 $(PKG)_FLAT_STACKSIZE
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoK5ZyoIDIwMjYvOC8yMiAwNDoyNCwgVGhvbWFzIFBldGF6em9uaSDlhpnpgZM6
Cgo+PiBJIGFtIHdvcmtpbmcgb24gYSBmb3JrIG9mIEJ1aWxkcm9vdCBmb3IgSFBNaWNybyBNQ1Vz
Ogo+PiBodHRwczovL2dpdGh1Yi5jb20vaHBtLXJzL2J1aWxkcm9vdAo+Pgo+PiBJIGhhdmUgcG9y
dGVkIExpbnV4IHRvIGEgbmV3IFJJU0MtViBNQ1UgY2FsbGVkIEhQTTY3NTAgZnJvbSBIUE1pY3Jv
Cj4+IFNlbWljb25kdWN0b3IgTHRkLiwgYW5kIEkgYW0gYWRkaW5nIGJvYXJkIHN1cHBvcnQgZm9y
IGl0IHRvIEJ1aWxkcm9vdC4KPj4KPj4gSSByYW4gaW50byB0aGlzIHByb2JsZW0gd2hlbiB0cnlp
bmcgdG8gcnVuIEZGbXBlZyBvbiBpdC4gSW5pdGlhbGx5LCBpdAo+PiBmYWlsZWQgd2l0aCBhICJz
dGFjayBzbWFzaGluZyBkZXRlY3RlZCIgZXJyb3IuIFRvIHJlc29sdmUgdGhpcywgSQo+PiBhdHRl
bXB0ZWQgdG8gdXNlIEZGTVBFR19GTEFUX1NUQUNLU0laRSB0byBhbGxvY2F0ZSBhIGxhcmdlciBG
TEFUIHN0YWNrLAo+PiB3aGljaCBsZWQgbWUgdG8gZGlzY292ZXIgdGhlIGJ1aWxkIGZhaWx1cmUg
Y2F1c2VkIGJ5IHRoaXMgYnVnLgo+Cj4gTmljZSEgVG8gYmUgaG9uZXN0IEkgaGFkIG5ldmVyIGhl
YXJkIG9mIEhQTWljcm8sIHNvIGl0J3MgbmljZSB0bwo+IGRpc2NvdmVyLgo+Cj4gRG8gbm90IGhl
c2l0YXRlIHRvIHNlbmQgcGF0Y2hlcyB0byBhZGQgc3VwcG9ydCBmb3IgeW91cgo+IHBsYXRmb3Jt
KHMpLiBIb3dldmVyLCBmb3IgdGhpcywgd2Ugd2lsbCByZXF1aXJlIHRoYXQgdGhlIHN1cHBvcnQg
Zm9yCj4geW91ciBwbGF0Zm9ybSBpcyBhbHNvIGluIHRoZSB1cHN0cmVhbSBMaW51eCBrZXJuZWw6
IHdlIGRvbid0IHdhbnQgdG8KPiBjYXJyeSBkb3plbnMvaHVuZHJlZHMgb2YgcGxhdGZvcm0tc3Bl
Y2lmaWMgcGF0Y2hlcyBpbiBCdWlsZHJvb3QuCj4KPiBCdXQgYXNpZGUgZnJvbSB5b3VyIHBsYXRm
b3JtLXNwZWNpZmljIHN1cHBvcnQsIGRvIG5vdCBoZXNpdGF0ZSB0bwo+IHN1Ym1pdCBhbnkgbm9N
TVUgZml4ZXMgeW91IG1pZ2h0IGhhdmUsIGxpa2UgdGhlIG9uZSB5b3UgYWxyZWFkeQo+IHN1Ym1p
dHRlZC4KClNpbmNlIHRoZXJlIGlzIGFuIG9uZ29pbmcgZGlzY3Vzc2lvbiBhYm91dCByZW1vdmlu
ZyBub01NVSBzdXBwb3J0IGZyb20KdGhlIExpbnV4IGtlcm5lbFsxXSwgSSBkbyBub3QgcGxhbiB0
byB1cHN0cmVhbSB0aGUgSFBNaWNybyBwbGF0Zm9ybQpzdXBwb3J0IHRoZXJlLgoKSG93ZXZlciwg
SSB3aWxsIGNvbnRpbnVlIHRvIHN1Ym1pdCBhbnkgbm9NTVUgZml4ZXMgdG8gQnVpbGRyb290IHdo
ZW5ldmVyCkkgZmluZCB0aGVtLgoKVGhhbmtzIGZvciB5b3VyIGFkdmljZSEKCkJlc3QgUmVnYXJk
cywKRmVuZ3dlaSBUYW4KClsxXSBodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMvMTAzNTcyNy8KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
