Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5100CD8C92
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 10:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B260284BD3;
	Mon,  8 Jun 2026 10:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18ush7tkjh3t; Mon,  8 Jun 2026 10:23:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3E7084BD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780914183;
	bh=ga+C6e9yvH7n+4a9EN9d6tldUrZlR+6BjED84I16Bzw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ma81G7cxtA7HgbBZXvPlaDcoC5sJtJ8/YcL0BJVVLcrZJlOw9/GkU059/HFefusIH
	 BD6lyGhopbtXt7on+sWwAb6RaLMEze6/dMoDcBkixnImDE7UuRJr2L2gJjDYrwKbBq
	 BRUjLPIoJSTxaL1+wH/zwtAapzm9+HeYru+3xHrgD8j5bUOqcZ5Ff6SXqTUzQousL6
	 2jF0VqJe8Dx5vIBgDYxcmfByvwXnKKwO++KNF1i2+2KgtFe3L6Y1lEDqPEkrVilQYB
	 5+qkHlVBs49L3aSYFCnSoOv2iVESP2K+QQ5UPwzud3PjUyldrG4jFJhqgwdPN1zvRu
	 g124ti4BUTP3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3E7084BD8;
	Mon,  8 Jun 2026 10:23:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 484DB187
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 10:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4585A84BD3
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 10:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id onGcQsnKx8EZ for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 10:23:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c20f::7;
 helo=osppr02cu001.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F339A84BD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F339A84BD0
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20f::7])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F339A84BD0
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 10:22:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLS4uIWEoM1lJcB2qk0IOn3UGYrg2zvGHy/kbyDCPk5k2uItmO40iDr2gNQtiBVzjCeQRudoG2uPfCZmdG64SUxt4KmANAE1BKWIVKYxgz0hpUvMPKBD1hoDA0Uv01UhOv4yTUvzrdT0zjH99hp/tDhXDcAk5LDytxu5BMt96bDkK0jx2YkjongQK7pY1ZMucy6iBljtqL/ayerHppTAHXe8O0FHmw2htl6GbjK9UwONfuNK6l5zZmT7g5jjpDtQ8khCv4GrnlzPYPgV9mB1a5hffTQScwFRT626sp2lDNg3rN/6J7TZy3pgHb2cm3Fj1ss5oTWh7K77raBRgXhVzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3DjUDd/eOx2JHTFiWEbSACQESruyv5YZGcnbypPEls=;
 b=PnCJFe7A02qmIpLEc1gyLS5E0YIDICvUkiKL7sVABFhCqL8ePoEWWZvjOpa+lBVMsEJn3nEQAGoxSEgfSsWh24Lm4wCOeKviXCTZRO5iH1o7mo/cp/AHs5oiFg4uBmDHij0WCZgAJCfy7JYBg/HuW86DRj1yubUjl8DCwHcj8UcWWE2C9d0SSeYQ2M+QSEUO22sjWWTzWG7vS69pPxsiD5/fiEO3+Wdf9rVBlBMP0laK9RDbZeOAyyFGdCQXv/ypXk8Wcslx2KtiYCUIr+GXhajGtf6VzyeS1DfchFyflRI8ilX+VcUbbIZ67/kfi2aOBF41oWgyeRgfeGNWHhP7aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by AS8PR04MB9012.eurprd04.prod.outlook.com (2603:10a6:20b:42e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 10:22:53 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Mon, 8 Jun 2026
 10:22:53 +0000
Message-ID: <122e4c18-26b2-4b84-9c9f-3260df9e5723@cherry.de>
Date: Mon, 8 Jun 2026 12:22:52 +0200
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>,
 Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Cc: Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer
 <ps.report@gmx.net>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20260327-qt5-5-15-18-v2-0-4c98e853266a@cherry.de>
 <22e55b87-8424-4dd3-9a50-f9923d912a37@rnout.be>
Content-Language: en-US
In-Reply-To: <22e55b87-8424-4dd3-9a50-f9923d912a37@rnout.be>
X-ClientProxiedBy: VI4PEPF00000143.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::88a) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|AS8PR04MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: c7e498d2-d88b-4f43-067d-08dec547e696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: onqum7WNBLjWYri4f9XNbBy1Ba3t1AH9PXZibHmmvISjzX2dgMz4qM1SOLQeanpuh9bHeV+GXe8xhTEow3DiCfv2LxBQfbava1oZVBfC0mjJQK1fD71HHpT8swFxcDxGe7nrydMURgRt9cmJ4ddvT8w1+0FU/vkk0hx2HjbEns/D2VMeC5/gl7C6N0veAhCUz0/saLduRgWiC+wSSu3n2SIlYlAJhBp6UpzF6BbMjalntYTsnimFB2E5ClMOUio2GahqAL2MF/YpYsLLmS4sBibcge1iPODo8FJ92kDDleGYcgrSP0RV1OUp9kvW1I1EcHPaLLtCvlmGuTENXT039Dy27i+fW4IpbelM80J2SvU1tMN97CSQ6Qgnkp+3PwPdLYGub/pfQdjeLom2UsfnZEl7KStl9zImT2yCZhtkE8XyF+hJTsy0XfORvdq5xuvirsSdJnrgDjohIMs2DbzN1nX+l+k5p8L5pOtt9Za0j5DR4lVONVIqdrJoDkl/qRHhBKRNGGPC/53YntJ9+g6kRhLXfm8zUYN+8OPKRphpxsw6NXUnYR1JAEMgdzk+C9r/xDai0lQhLd5zWGj9pUaoMtdEPQh/elOAzdv/TEm2hr/T2X/hfCrOCtXoSFj/LIvtK72GWT5NRbuOM6iwDLD96A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlU3YnV1cWhIOGFaNjNhWndsWWh5aHc4TVozRWxKeFpZWEpYOUdsZHBiTGVw?=
 =?utf-8?B?L2x5RDZFRTlscFhQQzNZYVhsZVdFbnlvTnVkZEVPZ1BMMTRGbE5ZdGxJQTZq?=
 =?utf-8?B?dDl0ekNVTjZudTFTcXYzM2EvWnN3dEJ0ZytFMFc2eFdmenk1UWVDWTNNVGJN?=
 =?utf-8?B?KzRWaVl3V1NGdFdCSnc0MU1VNk9kWWdBM3RCLzlpUWw4c2VOWGFDajA4VDVZ?=
 =?utf-8?B?bS9JYW0yZnliSUpvYlFuQ05CZHNUUnZERkI4R1BBaTUrclpNWDZGQld0d1U3?=
 =?utf-8?B?QnFiUDJTUzdIT01lUlp2ZEVyUzJTRGFNekp1bkdkUXRmT1QxV0czdWJ5NWZi?=
 =?utf-8?B?Tkl5YURGWE9iSk96Q2l1bUE5QnJBaktGbWxqcEJ6L0loNVZ3ZWQwTVFlb2FH?=
 =?utf-8?B?L3oyYk8yajY5SHZtSG4xdkxIVnZCZllpbW1HTy9kNVMwaFhtbHlPYVJCYjJi?=
 =?utf-8?B?MFQ4QWtVb0thaWpKTWIzUSt3dkxwamRPNzJSQ3MxY2RpUmZZSEZmYThUR2c3?=
 =?utf-8?B?OTZCbWwxd05JN21UU1Q1SVM2bFBqTzlQS1RQMnQ3QzJFb0syWHRadmRSS1hG?=
 =?utf-8?B?YjVXUmhoUytTVFdmSGZ1a05WSDZKUTdNMUdrcGRud3p1TkUyaTFzTjdyWGI5?=
 =?utf-8?B?MmFYaUR6ak1uU2tYY3VkTUVCUit2eU9HR2Y3WGlaU2ZMS09UK2RFeHlpa05Q?=
 =?utf-8?B?czBLZlNkSVZoUTZhQjJQNmdWT3loWThVR0wxTzIzSHczOEhxWVdXTWZLajlD?=
 =?utf-8?B?eXhhcjg1UTMvYmNNTjRtMWVjTnJZZTJHNVJQN0RpSTBJK2N2SlVLS1MvdXNU?=
 =?utf-8?B?UHMzMERodmZPZkk3bWlLamtKZVMzeEk0aXk4MjZJcFFPVUJpMDZOVjlRbWNn?=
 =?utf-8?B?UFFEb2Yydkw1VDdTelY4TUtiNjAra1lld3hTZXJLaEhEOHU0bmxrcFJjNkpr?=
 =?utf-8?B?aTZsWHJOMjduUU84cUR6cklsc09ERURMd2dPVHJHWjFaTW9QbHkyS0xWUmZv?=
 =?utf-8?B?b09ZSmQ2eE1KcmhEam5oclVPWGtjRnJzMGYyenpRQjI4azVOUFN3T1RNK1VK?=
 =?utf-8?B?SEpoWHJ2c25iSTNnYUYxSytubmJ3WklEOHByeHd0VGFONDJSU2ZrOGlzdTZG?=
 =?utf-8?B?TzNMVUVqSHd3U3NKVlpuOTdjN2F3WGJtYWxIcFpxVkVIclF5a1dqU2xPeFM5?=
 =?utf-8?B?UExVcnVmUVpEYnpVQ25waVk2OGNTeWdielQrVXhlSXBwSGxpTHZRcnpYUkk3?=
 =?utf-8?B?TFRoTzhONkIzYmc2SmJIZVlWWktsZ3A3S3VLekNCVndTSzJnbWlkbmEzRXk0?=
 =?utf-8?B?RGhSZ0lub1VVWWpMQWkxNmd5Zmo2Q3BNWm4zall3WE1sSE01N0p2WFlFUStm?=
 =?utf-8?B?a3FDTWY4UmxKTGEvTEtIeFFVWkx2Z2NsWXI3bW41UVZpbVVtaHp3dzRmRXBk?=
 =?utf-8?B?L3pCZHQ3TXZwamlFQWs2a3liYkdWeFpxYnE0bE14MHd5ZFhkM21uVmc2Um1n?=
 =?utf-8?B?RlVYVDdxdXZJekNGTVdaOThEYmV6ZXQrckZWbGkxZlJiaEl3S3ppTlBCQXNZ?=
 =?utf-8?B?Um5kbkFPUVlMWkRHRm9oRXVuQWFiVW5oR2JmRUlQVUFSdmk2Q0syWjVuUHJO?=
 =?utf-8?B?QlczdkR6RnUxVi9zMHJ3TmxUaVNvMmRNZm1aeEZIYjl0SnVFRmorSXpxa0wv?=
 =?utf-8?B?ampIcWpabUFQMkVEWVNDVXVHbWpKamU5WXV1VVdJTDQ0VGM5RFpOekRGQXpY?=
 =?utf-8?B?U2lVSEVuTURVcHh2OG80d1N2NzdsZDYvUlJNTURsb3crbGhWSmxjQkJFQndT?=
 =?utf-8?B?UXNENTRjSEFzUUJXOEJOTHdBcUdyWEtrdkFST0xKVUg1MWJtaTZ0WTZqUFh1?=
 =?utf-8?B?cEd6bFJ5c2JXWTVCeDdvajlDRTRVcWZoRVJPeDhnalRodEpMRGh1TGtoRVpI?=
 =?utf-8?B?ZXBwQk4wM1hBRUd4RFFvYkY3ZTVuNTByZHBVaHp4VEp3bTROMkdxbFlReEtY?=
 =?utf-8?B?dDVnRkw2N1FzZDF2Z2oxSWgyOXM1VlVudkU4TlB6OFJCcys2M1FRTEJOM05E?=
 =?utf-8?B?Q29MQlVKU0FBcmFiQkRLbmRCNHl1clY2dEJha1pKQVNETG1IcU9scG0yNExY?=
 =?utf-8?B?UHJ3dkNXNHhNNzJZRVdVdm91dkk5MDFXY1RoWFZDRXRFS2dLU2U4ajl2V3Jx?=
 =?utf-8?B?SlprQi90TzlNN0FSaC9HYjNnbGs0RSswcVBQWWlkS1FmcExxekx4dTFhZUNu?=
 =?utf-8?B?T2hqby9qdDJQTzNTNjVNdGVqeHlkTDA0cmMyYWdMaEFXcXpCWmZ3ME5rb0NM?=
 =?utf-8?B?bmQrS2t1Z1hkcVJEMmdiTnVlbUlPQWpvYzNpYVVjYUF5Q3ZRY3c0UT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e498d2-d88b-4f43-067d-08dec547e696
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:22:53.6593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esDzF5Io+OXrrKRMadWiPeeBEpdbR6M1isg+M5goRHUpG3CCz2PvoKBbfsqfUwdtPmFL++PjLcEHnz0febuTz2KwFdZhz1I9zCnUWa3KpBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9012
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3DjUDd/eOx2JHTFiWEbSACQESruyv5YZGcnbypPEls=;
 b=H0hKOVc51Rhv4RgjQq5pwRGLS151C1FWQtt+6Znsb/6e7RKBfBpQzPB2uFIG8IEEk9/Ra80ZTAJsxIu49uf3WuYJIxS+NvyYr1RB03qO7Wogo+BpyKH88MzpyT+KizYjXjaGDvxu4QqIiwApqlzL9cgki95l6hLqIVlZn5QWuA0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=H0hKOVc5
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH v2 0/5] package/qt5: misc fixes + bump to
 5.15.18
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gNS8zMC8yNiA3OjQ2IFBNLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90
ZToKPiAKPiAKPiBPbiAyNy8wMy8yMDI2IDE3OjUzLCBRdWVudGluIFNjaHVseiB2aWEgYnVpbGRy
b290IHdyb3RlOgo+PiBxdDUzZCBjdXJyZW50bHkgZG9lc24ndCBidWlsZCB3aXRoIGFzc2ltcCBz
dXBwb3J0IGVuYWJsZWQsIGVpdGhlciBjb21pbmcKPj4gZnJvbSBCdWlsZHJvb3Qgb3Igd2l0aCB0
aGUgbW9kdWxlIHNvdXJjZXMgY29taW5nIGZyb20gcXQ1M2QgaXRzZWxmLgo+Pgo+PiBUaGUgZmly
c3QgcGF0Y2ggbWFrZXMgc3VyZSB3ZSBkaXNhYmxlIGFzc2ltcCBzdXBwb3J0IHdoZW4gd2UncmUg
YnVpbGRpbmcKPj4gd2l0aG91dCBCUjJfUEFDS0FHRV9BU1NJTVAuIFRoZSBzZWNvbmQgcGF0Y2gg
bWFrZXMgc3VyZSB3ZSB1c2UgYXNzaW1wCj4+IHBhY2thZ2UgZnJvbSBCdWlsZHJvb3Qgd2hlbiBp
dHMgc3VwcG9ydCBpcyByZXF1ZXN0ZWQuIFRoZSB0aGlyZCBwYXRjaAo+PiBmb3JjZS1kaXNhYmxl
cyBhc3NpbXAgc3VwcG9ydCBzaW5jZSBpdCBkb2Vzbid0IGJ1aWxkIHdpdGggZWl0aGVyCj4+IEJ1
aWxkcm9vdCdzIGFzc2ltcCBvciB0aGUgb25lIGNvbWluZyB3aXRoIHF0NTNkIHNvdXJjZSBjb2Rl
LiBXZSBjb3VsZAo+PiBzcXVhc2ggdGhlIHRocmVlIGludG8gb25lLCBJIGp1c3Qgd2FudGVkIHRv
IHByb3ZpZGUgaW50ZXJtZWRpYXRlIHBhdGNoZXMKPj4gaWYgYW55b25lIGlzIGludGVyZXN0ZWQg
aW4gYnJpbmdpbmcgYmFjayBzdXBwb3J0IGZvciBhc3NpbXAgbGF0ZXIgb24sCj4+IHRoZXkgd291
bGQgb25seSBuZWVkIHRvIHJldmVydCB0aGUgdGhpcmQgcGF0Y2guCj4gCj4gIMKgSXQncyBhIGJp
dCB3ZWlyZCwgYnV0IEkgYWdyZWUgd2l0aCB0aGUgcmVhc29uaW5nLgo+IAo+ICDCoFBhdGNoZXMg
MS00IGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCj4gCj4+Cj4+IFRoZSBsYXN0IHF0NXdlYmVu
Z2luZS1jaHJvbWl1bSBmb3Jnb3QgdG8gdXBkYXRlIHRoZSBsaWNlbnNlIGZpbGUgaGFzaGVzCj4+
IHNvIHRoaXMgaXMgbm93IGZpeGVkLgo+Pgo+PiBUaGVuIHdlIGJ1bXAgcXQ1IHRvIHRoZSBsYXRl
c3QgdmVyc2lvbiBhdmFpbGFibGUgaW4gS0RFJ3MgR2l0TGFiLiBUaGUKPj4gb25seSB0aGluZyBJ
J20gdW5zdXJlIGlzIHdoZXRoZXIgd2UgYWxzbyBuZWVkIHRvIGJ1bXAgY2F0YXB1bHQsIGFuZCBp
Zgo+PiB5ZXMsIHRvIHdoaWNoIHZlcnNpb24/Cj4gCj4gIMKgUHJvYmFibHkgbm90LiBBRkFJVSB0
aGUgdmVuZG9yZWQgY2F0YXB1bHQgaW4gY2hyb21pdW0gZG9lc24ndCBnZXQgCj4gdXBkYXRlZCwg
d2hpY2ggaXMgd2h5IHdlIG5lZWQgdG8gb3ZlcmxheSBpdCB3aXRoIG91dCBvd24gY2F0YXB1bHQg
Cj4gYmVjYXVzZSBpdCBkb2Vzbid0IHN1cHBvcnQgcHl0aG9uMyBhbmQgd2UgZG9uJ3QgaGF2ZSBw
eXRob24yIGFueSBtb3JlLiAKPiBBdCBsZWFzdCwgdGhhdCB3YXMgdGhlIGNhc2UgYSBjb3VwbGUg
b2YgeWVhcnMgYWdvLCBpdCdzIHBlcmhhcHMgd29ydGggCj4gY2hlY2tpbmcgaWYgdGhpcyBkYW5j
ZSBpcyBzdGlsbCBuZWVkZWQgYW5kIGp1c3QgcmVtb3ZlIGNhdGFwdWx0IGlmIG5vdC4KPiAKClRo
ZXJlJ3MgYmVlbiBhIG5ldyAoYW5kIGxhc3QsIGFzIGZhciBhcyBJIHVuZGVyc3Rvb2QsIGMuZi4g
Cmh0dHBzOi8vd3d3LnF0LmlvL2Jsb2cvY29tbWVyY2lhbC1sdHMtcXQtNS4xNS4xOS1yZWxlYXNl
ZCwgYnV0IG1heWJlIEtERSAKaGFzIEV4dGVuZGVkIFNlY3VyaXR5IE1haW50ZW5hbmNlIChFU00p
PykgdmVyc2lvbiBvZiBRdDUuMTUgc2luY2UgCihodHRwczovL2ludmVudC5rZGUub3JnL3F0L3F0
L3F0NS8tL2NvbW1pdC9hYTc0OTY5NTA3NTY4NGYwYzg1ODVlZGUxOWUzNjFmOWFjY2I0Mjg3KSwg
CnNvIEknbGwgdHJ5IHRvIHJlbWVtYmVyIHRvIGxvb2sgYXQgdGhpcyB3aGVuIEknbGwgbG9vayBp
bnRvIGJ1bXBpbmcgClF0NS4xNSBhZ2Fpbi4KCj4gIMKgQW55d2F5LCBJIGFwcGxpZWQgdGhpcyBv
bmUgdG8gbmV4dCwgdGhhbmtzLiBJIGRvIGFzc3VtZSB5b3UgZGlkIGEgdGVzdCAKPiBidWlsZCBv
ZiBxdDV3ZWJlbmdpbmU/Cj4gCgpZZXMsIGJ1dCBpdCdzIHZlcnkgZmluaWNreS4gSSB3b3JrZWQg
b24gdGhpcyBtb250aHMgYWdvIHNvIEkgZG9uJ3QgCnJlbWVtYmVyIGV4YWN0bHkgd2hhdCB3YXMg
aGFwcGVuaW5nIGJ1dCBJIHRoaW5rIEkgbmVlZGVkIHRvIGRpcmNsZWFuIGFuZCAKcmVidWlsZCBz
b21lIHBhY2thZ2VzIChpdHNlbGYsIG1heWJlIGl0cyBkZXBlbmRlbmNpZXMgdG9vKSBmb3IgaXQg
dG8gCnByb3Blcmx5IGJ1aWxkIGFmdGVyIGFuIGluaXRpYWwgZmFpbC4gVGhpcyB3YXMgYWxyZWFk
eSB0aGUgY2FzZSBiZWZvcmUgCnRoaXMgc2VyaWVzIHRob3VnaCAoSSB0ZXN0ZWQgYXQgdGhlIHRp
bWUpLgoKQ2hlZXJzLApRdWVudGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
