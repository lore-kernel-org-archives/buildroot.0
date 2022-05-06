Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA70C433FE
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 08:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E84081C20;
	Fri,  6 May 2022 08:56:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id intjDiEBTRmQ; Fri,  6 May 2022 08:56:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21236819CC;
	Fri,  6 May 2022 08:56:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92F381BF2EC
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 08:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BA7D819CC
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 08:56:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Byg3PISPFavR for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 08:56:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::617])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17D6F81769
 for <buildroot@buildroot.org>; Fri,  6 May 2022 08:56:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jerUqxjLM8MmwPub6v6JxV6dFl9suBm16ofgP2BdA7eFVw79Zt57uMPqK8C2fX1pnkxNirEG1PPc0vXtQQLUCeabz6F+75Rq3a6oogLeTMTqMgGzZI7KRJ7LQrK2FRe1uNkMIJddPzOTTvt1uRQPtNcs9PGlrRrfn0TgmcLCAkiIJ6p2C1ld62FvY5GrHAgy4Bxbcz0mwu/ZBlL9gxkEnAUP61XSeqIYGZhIk5vyQHVb+Qr0Zze6xHGz6HrUvG0kT8nrLu8QmTITvtZnrmElw8VNliw4a+wvPqs2vDsd5wByFYzbIfszdyLbCiZF/MHSnu/9PhsoFQ3tdhRRUTkbrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F74CpC7xRF4uuZdU71aOhGCHpPbm9ZUYMDIg6ugnWSQ=;
 b=b2fR2Zgb7Z6y2iwMJKZoFWi3Ddlca1K8BJCP2r/odsXKeJ/aPOOTpJJ909hSeu8h8uOSsLIZajwJUojZVk7Zif70m57JGlWxr5oR2eEH45WAgltcd/jBZ5VXDoE3oL6F7Fo2kxwv2cbnIAZGTNTaFy1VYTkc3+NldWTdJhvC3i3c+kDWDPaFJy0DKSRg130eoJ3xDRJB4gf7/F22UJXyzKGN2ZyclgyadwBgvyxSGH0sU3A1K3oOyy+PjikNfxPHxsMmwG2hXP5wKrO0GNnBpeobfNyOP//CtYtolr1lgHlp36V9/3b+28wmOeA+ZVyLkW4niE7YLk8tzCbtdzMRLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F74CpC7xRF4uuZdU71aOhGCHpPbm9ZUYMDIg6ugnWSQ=;
 b=SPAVYPe2xaxPsAGSXvA8iRVnkb+zuJ1/pafmVNH4LOA8s7pjYO2OiNXXZCB93PLbXxvqnIXUVGK584vqtGXSQ/HjeXbyheBVhG1cD3nfwg2t7aJGONbT6M3/vXq9hHHiwgUcRkWLMZmt+R1D/znNM6wLZ4bw/ZCnjRO+RNXfeBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by HE1PR0401MB2521.eurprd04.prod.outlook.com (2603:10a6:3:7d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 08:56:39 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::28d3:b4fa:2319:83fb]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::28d3:b4fa:2319:83fb%5]) with mapi id 15.20.5206.025; Fri, 6 May 2022
 08:56:38 +0000
Message-ID: <c02e5e65-9bdf-f13f-d152-e3a1c800277c@theobroma-systems.com>
Date: Fri, 6 May 2022 10:56:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>,
 Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
References: <20220505120138.493950-1-foss+buildroot@0leil.net>
 <c30dd1d2-4087-edb4-6f62-ffe8d213a48c@mind.be>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <c30dd1d2-4087-edb4-6f62-ffe8d213a48c@mind.be>
X-ClientProxiedBy: AS9PR06CA0189.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::7) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7be60efd-318e-4cf3-be73-08da2f3e54be
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2521:EE_
X-Microsoft-Antispam-PRVS: <HE1PR0401MB25210070186DFC3EBF5CB865C2C59@HE1PR0401MB2521.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3rkhWFJ6tvgB5Vxt+3pHre8NAYhrWOLnnpsc+egM+dqeQIHX6JVkD34rn10TVTWmF0+dxKmy+qR9DqxwHzbUcGVD3TOcB5VIPCSQNU2xoPKC9DS/RIQt7oFhXvmlZwwLaP9kLjmLqRZfRQeAlGBS13rI1Gfr+8Hlo3jfEP/fPMH1gYtK1h6IZWA56MBFpamAvK1Msyg4hbiu1usEpvdW4QgHx4JTNq8FVbpByJRclo9MP4eGkDQE3hn1MfrMyPkCUoLvgEajZ1d7lhZEPsf1OfedFDxHwL1OZxrNYVrvJeOt85MDWJgUBWmXreXS6POqn5g0f9xseOdh5i4DR1Dzodw73pzuXbYP6sYQQ620opCyD5+FooB2hO50btFoJgGGH2XSM9F/AYBmxNkwRHDYgXTy1b4iC1UXUxDSAlwlDCZvMdzhcYHvPNGpxmHSFJSuLk7bWtc6ayqYDFxYpznHb0OOAqfnQT9K0TvPS0kKQDPBNwv+VuAUrDigwbbzmhUh6KwtVQjJ7x9vKt3y0dygN4B+jSg7OpI1hwFW/Lr15iC1AiZ5n/BUgeyKbTqRSpeJJ5Fq6IMsutauThVRXg0NQSXOxPp0jePAppJ4Ia7b60Qr3qGoGVgJwasCKC0/HcF50IDFMh23ShC7BCKS7SgmB3HPYV6FN3H+L00fR3A9OqSgzedjzQ0XtGiFpQTF2r2s6E9cXLWjxL6QwZkvtIbbRzi5RJdIqdBgQwpJ8E5TEK5+QJhRShT8iOha54goI8tVTcTNZWa56FFM9HKCk8VDtsn6LR3jjgiDj2G8aQxxCmlJDOgRax/CIJR8faF1cuCl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9367.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(110136005)(31686004)(36756003)(26005)(2906002)(53546011)(38100700002)(186003)(6506007)(2616005)(316002)(6512007)(54906003)(31696002)(8676002)(5660300002)(4326008)(44832011)(86362001)(8936002)(66946007)(6486002)(83380400001)(508600001)(66556008)(966005)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjhrUCt3UGhpWFg5cmYxTnVBY1VYN09OSEJkZEZxdThRUDFBUThEREtmVks5?=
 =?utf-8?B?bS9SeHhFQVRmbnRGMDc5b29lMloxSGV3UVA5UUtQcVQza2g4Rk1UQTl5LzE5?=
 =?utf-8?B?S2pEZURINkZlbnR5eVJrbDN3WTNqZitYMGNsajJVMTRvZUhlN2F3a056WDY3?=
 =?utf-8?B?OCt6ZTFsUlFHajFmckpwQlJGdGp6L1Q4UzdBTHM1cnJ3Q0xzeE5HRzBzN3NP?=
 =?utf-8?B?Tmp4NzBwdHlkd3kwcDBRa3oralBIZk8wRFl6NXF2ZWRpZ0hhUXlIV2d1bHc1?=
 =?utf-8?B?N2NDYm4zcHFKR2VYdTBVRW94RE9VNnZxcWJEM0EvZjVrbnJIb3JmTUg1L2hT?=
 =?utf-8?B?MUdNOUtZaVlxS2V1OUVUMlJXaWJ6YXhPRTNXNEVRZGVhWDBTeml3Rkw1VlhM?=
 =?utf-8?B?RDdMUDZrb0ZOUUMxU24xZUxXd2dtWlNkSGt2cFJpTWdzVmlUTVV4M0wxTWdm?=
 =?utf-8?B?MFQwVllXbXpTRGU2Q2wzSm0xbkNwUFkzQUVNVTNma0sxZVB5WUZiZ3ZXdjFK?=
 =?utf-8?B?WEhuWlNlR0ZVRmhDL080d2pJWWFKenRFUGNVc3BlLzg0bndBREdjU2p0TVRw?=
 =?utf-8?B?ZXBkazdMbkhrd3RJQWpCOTdjNnlvbVRHQnJJeEw5SzdTT2hBaXJyQ3dOUGhC?=
 =?utf-8?B?aXF3YWRROHU5bDBVYjhHL1BjUTFpZVZKMVg3OE1zZzRqMFBCVlY3eGFFcnlp?=
 =?utf-8?B?TElFTUI3T3lkOWN1SkpGUklncEFWbUtMRDZrLytVSkR3L2F1NEZDTThOWEN6?=
 =?utf-8?B?VGsybVZsQUdVZjhJY0FoeG9CT0UwSW5halMxbVFnWXMvV2J4ZnVQVlRIQWRs?=
 =?utf-8?B?SDdrazc2MFRIeU4rQjhBK0ZwTzJSek9PS3hWRmI5ZkhkNjFnQXVrN0tUUkNi?=
 =?utf-8?B?UVF6MXJVVzVvMWlvZXlqaWdQaHBiaUd2VTllV2JkODN0bm1LbUFxNk9UT050?=
 =?utf-8?B?aXJCMmhVREJUYzBFWWFuMytaUGtmbDFwTE41dHpwejYwc1FIdzRacjFvamxF?=
 =?utf-8?B?b3NPOG1qQmtBOHNZSmp5Vm0velZzZjV6cFZuSFhjK0FvQ1p0ZTJCeXIvQ3p0?=
 =?utf-8?B?SFlSc09nU1hNVHhaV05oS1dyV3RpWE9NQ0hYSlcyNHpqejBjVWtHMy9yVU00?=
 =?utf-8?B?OE1EZFhmYndRMm1qR1pia0hBZnJjTTkwdGNyYnV2ZUhiZFQ2d3RIREk3YlJO?=
 =?utf-8?B?Y04yQ0k2T3MyRWtZbU11eFpNM2MyYUhzM1QxK0dmN2NiekdrUHZCSGxWdHZx?=
 =?utf-8?B?VVh0Q1pLU2w5MTdOU01ITHdFQ2hVYk5GNWVvTjVVWDNnR0ZrYThoOHJXZFhW?=
 =?utf-8?B?V2ltN0tSNjlKdE5yUzVFb1l1M013Vkwva1NQdCt2bldHQ1h5SnI5K1dRajRW?=
 =?utf-8?B?WkVvRnh2MVFmZW9mK3dzcFJ5RFlPenp5N2dPTW5VRURxa2ovdTRVTU9ldHFK?=
 =?utf-8?B?U3JtOXNwNEI5Y1huR0RIM1JFRjAyeS9rMHBVbU5Sc3E2OTFGS0psOEtFSVBK?=
 =?utf-8?B?dDRCbmlBdm9HTWcvZ1ZCcXBLRHE3OXg3ZEFjSTlORG96MDhlQUcwaTV3WnpC?=
 =?utf-8?B?aHFoNFlnOGZvTExIYTZxR3g3UVEyN2poRWlhVjEweFFBcVZPY0VaMkppMmpm?=
 =?utf-8?B?YmFjSWNIVWs2dUZQNkd0SEgyOWpzVW1hbUdWWlhIL0dlQmFhaTQ1cVlyS0FG?=
 =?utf-8?B?UXVlNldyRUQwcUV1bVV5UlRXYVp6WU1iMklISm1nQzF1N2d2TitDRFZBNy9o?=
 =?utf-8?B?VTc3VEJCU21IdDNOOCtmSkJDa3FzMCthVnpyWHRoc1YyNG90TkEvUWZaOEV2?=
 =?utf-8?B?SGVPaWx6dit0YnpNMU1laGZHNXdtbFJCWmxNWndWOWN0WCtWYkpDc3Z0RzhQ?=
 =?utf-8?B?dkR1NEJXcDFhTzRMZFRVd0M4bm5DbjhGcExDanBhWnBvMUc4TDI0Y1NnTGZm?=
 =?utf-8?B?SmY2bnc5SUdQSmFHc3dLZTJKbFlWbVg0Y3locjl0S25lUEZNZDFiMjRWaTJx?=
 =?utf-8?B?YmV2M29qOGNPWXlKOGtzcTNycWNSbGhqY0MyY2x6TTlhZlFQRHV1S2MrUnRw?=
 =?utf-8?B?TFBTb0RrRS9nWXpJMEpRSXJCcGR4aXFLK0dVeUg0ZXBFWHQvS0lybnRFS2c1?=
 =?utf-8?B?Y25QRXhJUkMxUSs1TTUwcDRrSW5WMUpmdm16aVBvMlRpVmdLNE9ud0JNa2Fx?=
 =?utf-8?B?NzRMMGlsRmpQL0hnWGZKTFR0MDNGVFdtRGRrMzQwWXE4OGczYzI4dS9welZN?=
 =?utf-8?B?TzVpUGdiRFh1R1l1d0JxZDgwS05ib0c0RnJwRnA5ek15SkgrUzYwQ2ZCWENp?=
 =?utf-8?B?MDEwRTYzWnZkUkJ2U0lJRzBibktNbzM0djg5VVlMUUZrNTljR1lsOTlHWjhr?=
 =?utf-8?Q?mjrWAPcwJvoceGAc5MBvwrKwJ4wTRNwl305IS?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be60efd-318e-4cf3-be73-08da2f3e54be
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 08:56:38.8234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nuGoxX5Gt9sxP4ejNeFrx+dSrKNFGlaLwC+r8sFmy7qtzIyrnxfhwHq4UKvC6vEuDl1ovrUU0RsFNPz87ai+IOM3hiqevvvP3baIJwOCqbHrds4uAhjGK4LQ828sT244
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2521
Subject: Re: [Buildroot] [RFC PATCH] package/libcamera: remove rpath and
 strip debug symbols before signing IPA libs
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gNS81LzIyIDIyOjU3LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToK
PiAgwqBIaSBRdWVudGluLAo+IAo+IE9uIDA1LzA1LzIwMjIgMTQ6MDEsIFF1ZW50aW4gU2NodWx6
IHdyb3RlOgo+PiBGcm9tOiBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpAdGhlb2Jyb21h
LXN5c3RlbXMuY29tPgo+Pgo+PiBPcGVuLVNvdXJjZSBJUEEgc2hsaWJzIG5lZWQgdG8gYmUgc2ln
bmVkIGluIG9yZGVyIHRvIGJlIHJ1bm5hYmxlIHdpdGhpbgo+PiB0aGUgc2FtZSBwcm9jZXNzLCBv
dGhlcndpc2UgdGhleSBhcmUgZGVlbWVkIENsb3NlZC1Tb3VyY2UgYW5kIHJ1biBpbgo+PiBhbm90
aGVyIHByb2Nlc3MgYW5kIGNvbW11bmljYXRlIG92ZXIgSVBDLgo+PiBCdWlsZHJvb3Qgc3RyaXBz
IGRlYnVnIHN5bWJvbHMgYW5kIHNhbml0aXplcyBSUEFUSCBpbiBhIHBvc3QgYnVpbGQKPj4gcHJv
Y2Vzcy4gV2UgbmVlZCB0byBkbyB0aGUgc2FtZSBiZWZvcmUgc2lnbmluZyB0aGUgSVBBIHNobGli
cyBvdGhlcndpc2UKPj4gdGhlIHNpZ25hdHVyZSB3b24ndCBtYXRjaCB0aGUgc2hsaWIgb24gdGhl
IHJvb3Rmcy4KPj4KPj4gbWVzb24gZ2V0cyByaWQgb2YgcnBhdGggd2hpbGUgaW5zdGFsbGluZyBz
byB3ZSBkb24ndCBuZWVkIHRvIGRvIGl0Cj4+IG1hbnVhbGx5Lgo+PiBIb3dldmVyIHRoZSBzaWdu
aW5nIHByb2Nlc3MgaXMgYWxzbyBwYXJ0IG9mIHRoZSBtZXNvbiBpbnN0YWxsIHRhcmdldCwgc28K
Pj4gd2UgaGF2ZSBhIGNoaWNrZW4gYW5kIHRoZSBlZ2cgcHJvYmxlbS4gTGV0J3MgaW5zdGFsbCB0
aGUgbGlicyBpbiB0aGUKPj4gdGFyZ2V0IGRpcmVjdG9yeSAoYW5kIGRvIGEgdXNlbGVzcyBzaWdu
aW5nKSB0byBnZXQgcmlkIG9mIHJwYXRoLCB0aGVuCj4+IHN0cmlwIGRlYnVnIHN5bWJvbHMgdGhl
IHNhbWUgd2F5IEJ1aWxkcm9vdCBkb2VzIGluIHBvc3QgYnVpbGQgc3RlcCwgdGhlbgo+PiByZS1z
aWduIHNobGlicyBkaXJlY3RseSBpbiBUQVJHRVRfRElSIHdpdGggc2lnbmluZyBzY3JpcHQgZnJv
bQo+PiBsaWJjYW1lcmEuCj4+Cj4+IENjOiBRdWVudGluIFNjaHVseiA8Zm9zcytidWlsZHJvb3RA
MGxlaWwubmV0Pgo+PiBTaWduZWQtb2ZmLWJ5OiBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1
bHpAdGhlb2Jyb21hLXN5c3RlbXMuY29tPgo+PiAtLS0KPj4gwqAgcGFja2FnZS9saWJjYW1lcmEv
bGliY2FtZXJhLm1rIHwgMjEgKysrKysrKysrKysrKysrKysrKysrCj4+IMKgIDEgZmlsZSBjaGFu
Z2VkLCAyMSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmNhbWVy
YS9saWJjYW1lcmEubWsgCj4+IGIvcGFja2FnZS9saWJjYW1lcmEvbGliY2FtZXJhLm1rCj4+IGlu
ZGV4IDc3MzgxYWIzY2EuLmQxMzAzYTJmZjUgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvbGliY2Ft
ZXJhL2xpYmNhbWVyYS5tawo+PiArKysgYi9wYWNrYWdlL2xpYmNhbWVyYS9saWJjYW1lcmEubWsK
Pj4gQEAgLTEwNCw0ICsxMDQsMjUgQEAgTElCQ0FNRVJBX0RFUEVOREVOQ0lFUyArPSBsaWJleGVj
aW5mbwo+PiDCoCBMSUJDQU1FUkFfTERGTEFHUyA9ICQoVEFSR0VUX0xERkxBR1MpIC1sZXhlY2lu
Zm8KPj4gwqAgZW5kaWYKPj4gKyMgT3Blbi1Tb3VyY2UgSVBBIHNobGlicyBuZWVkIHRvIGJlIHNp
Z25lZCBpbiBvcmRlciB0byBiZSBydW5uYWJsZSAKPj4gd2l0aGluIHRoZQo+PiArIyBzYW1lIHBy
b2Nlc3MsIG90aGVyd2lzZSB0aGV5IGFyZSBkZWVtZWQgQ2xvc2VkLVNvdXJjZSBhbmQgcnVuIGlu
IAo+PiBhbm90aGVyCj4+ICsjIHByb2Nlc3MgYW5kIGNvbW11bmljYXRlIG92ZXIgSVBDLgo+PiAr
IyBCdWlsZHJvb3Qgc3RyaXBzIGRlYnVnIHN5bWJvbHMgYW5kIHNhbml0aXplcyBSUEFUSCBpbiBh
IHBvc3QgYnVpbGQgCj4+IHByb2Nlc3MuIFdlCj4+ICsjIG5lZWQgdG8gZG8gdGhlIHNhbWUgYmVm
b3JlIHNpZ25pbmcgdGhlIElQQSBzaGxpYnMgb3RoZXJ3aXNlIHRoZSAKPj4gc2lnbmF0dXJlCj4+
ICsjIHdvbid0IG1hdGNoIHRoZSBzaGxpYiBvbiB0aGUgcm9vdGZzLgo+PiArIwo+PiArIyBtZXNv
biBnZXRzIHJpZCBvZiBycGF0aCB3aGlsZSBpbnN0YWxsaW5nIHNvIHdlIGRvbid0IG5lZWQgdG8g
ZG8gaXQgCj4+IG1hbnVhbGx5Lgo+PiArIyBIb3dldmVyIHRoZSBzaWduaW5nIHByb2Nlc3MgaXMg
YWxzbyBwYXJ0IG9mIHRoZSBtZXNvbiBpbnN0YWxsIAo+PiB0YXJnZXQsIHNvIHdlCj4+ICsjIGhh
dmUgYSBjaGlja2VuIGFuZCB0aGUgZWdnIHByb2JsZW0uIExldCdzIGluc3RhbGwgdGhlIGxpYnMg
aW4gdGhlIAo+PiB0YXJnZXQKPj4gKyMgZGlyZWN0b3J5IChhbmQgZG8gYSB1c2VsZXNzIHNpZ25p
bmcpIHRvIGdldCByaWQgb2YgcnBhdGgsIHRoZW4gCj4+IHN0cmlwIGRlYnVnCj4+ICsjIHN5bWJv
bHMgdGhlIHNhbWUgd2F5IEJ1aWxkcm9vdCBkb2VzIGluIHBvc3QgYnVpbGQgc3RlcCwgdGhlbiAK
Pj4gcmUtc2lnbiBzaGxpYnMKPj4gKyMgZGlyZWN0bHkgaW4gVEFSR0VUX0RJUiB3aXRoIHNpZ25p
bmcgc2NyaXB0IGZyb20gbGliY2FtZXJhLgo+PiArZGVmaW5lIExJQkNBTUVSQV9JTlNUQUxMX1RB
UkdFVF9DTURTCj4+ICvCoMKgwqAgJChUQVJHRVRfTUFLRV9FTlYpICQoTElCQ0FNRVJBX05JTkpB
X0VOVikgREVTVERJUj0kKFRBUkdFVF9ESVIpIFwKPj4gK8KgwqDCoMKgwqDCoMKgICQoTklOSkEp
ICQoTklOSkFfT1BUUykgLUMgJChMSUJDQU1FUkFfU1JDRElSKS9idWlsZCBpbnN0YWxsCj4+ICvC
oMKgwqAgZmluZCAkKFRBUkdFVF9ESVIpIC10eXBlIGYgLW5hbWUgImlwYV8qLnNvIiAtcHJpbnQw
IHwgeGFyZ3MgLTAgCj4+ICQoU1RSSVBDTUQpIDI+L2Rldi9udWxsIHx8IHRydWUKPiAKPiAgwqBZ
b3Ugc2hvdWxkIGFkZCAtLW5vLXJ1bi1pZi1lbXB0eSB0byB4YXJncywgaW4gY2FzZSB0aGVyZSBp
cyBubyBsaWJyYXJ5IAo+IGF0IGFsbCAodW5sZXNzIHlvdSdyZSB2ZXJ5IHN1cmUgdGhhdCBkb2Vz
bid0IGhhcHBlbikuIEFsc28sIHdoeSBpcyB0aGUgCj4gfHwgdHJ1ZSBuZWVkZWQ/Cj4gCgpTaGFt
ZWxlc3NseSBzdG9sZW4gZnJvbSBtYWluIE1ha2VmaWxlIDopIApodHRwczovL2dpdC5idXN5Ym94
Lm5ldC9idWlsZHJvb3QvdHJlZS9NYWtlZmlsZSNuNzU4CgpCdXQgeWVzLCBubyBndWFyYW50ZWUg
dG9kYXkgdGhhdCBhbiBJUEEgc2hsaWIgd2lsbCBiZSBpbnN0YWxsZWQgYnkgCmxpYmNhbWVyYSBw
YWNrYWdlLCBzbyBJJ2xsIGFkZCB0aGlzIG9wdGlvbiB0byB4YXJncyBjb21tYW5kLiBUaGFua3Mg
Zm9yIAp0aGUgaGVhZHMgdXAuCgpXaWxsIHJlbW92ZSB0aGUgcmVkaXJlY3QgYW5kIHRoZSB8fCB0
cnVlIGFzIHRoZXkgYXJlIG5vdCByZWFsbHkgdXNlZnVsIAppbiB0aGF0IHBhY2thZ2UuCgo+PiAr
wqDCoMKgIE1FU09OX0lOU1RBTExfREVTVERJUl9QUkVGSVg9JChUQVJHRVRfRElSKS91c3IvbGli
L2xpYmNhbWVyYS8gCj4+ICQoQEQpL3NyYy9pcGEvaXBhLXNpZ24taW5zdGFsbC5zaCAkKEBEKS9i
dWlsZC9zcmMvaXBhLXByaXYta2V5LnBlbSAKPj4gJChhZGRwcmVmaXggaXBhXywkKGFkZHN1ZmZp
eCAuc28sJChMSUJDQU1FUkFfUElQRUxJTkVTLXkpKSkKPj4gK8KgwqDCoCBNRVNPTl9JTlNUQUxM
X0RFU1RESVJfUFJFRklYPSQoVEFSR0VUX0RJUikvdXNyL2xpYjY0L2xpYmNhbWVyYS8gCj4+ICQo
QEQpL3NyYy9pcGEvaXBhLXNpZ24taW5zdGFsbC5zaCAkKEBEKS9idWlsZC9zcmMvaXBhLXByaXYt
a2V5LnBlbSAKPj4gJChhZGRwcmVmaXggaXBhXywkKGFkZHN1ZmZpeCAuc28sJChMSUJDQU1FUkFf
UElQRUxJTkVTLXkpKSkKPiAKPiAgwqBJbnN0ZWFkIG9mIG92ZXJyaWRpbmcgSU5TVEFMTF9UQVJH
RVRfQ01EUywgeW91IGNvdWxkIGFsc28gZG8gdGhlIAo+IGFkZGl0aW9uYWwgc3RlcHMgaW4gUE9T
VF9JTlNUQUxMX1RBUkdFVF9IT09LUy4KPiAKCldhcyBub3QgYXdhcmUgb2YgdGhvc2UgaG9va3Ms
IG5lYXQgOikKCj4gIMKgSG93ZXZlciwgSSB0aGluayBpdCBtYXkgYmUgc2ltcGxlciB0byBkbyB0
aGUgc3RyaXBwaW5nIGluIGEgCj4gUE9TVF9CVUlMRF9IT09LLiBUaGF0IHdheSwgeW91IG9ubHkg
bmVlZCB0byBkbyB0aGUgc3RyaXA7IHRoZSBzaWduaW5nIGlzIAo+IGRvbmUgaW4gdGhlIGluc3Rh
bGwgc3RlcCwgc28gaWYgd2UgbWFrZSBzdXJlIHRoZSAuc28gaXMgc3RyaXBwZWQgYnkgCj4gdGhl
biwgYWxsIHNob3VsZCBiZSB3ZWxsLCByaWdodD8KPiAKCklmIGhhdmluZyB0aGUgc3RhZ2luZyBz
aGxpYnMgc3RyaXBwZWQgaXMgZmluZSwgdGhlbiB0aGlzIHNob3VsZG4ndCBiZSBhbiAKaXNzdWUg
aW5kZWVkLgoKPiAgwqBGaW5hbGx5LCB0aGVyZSBpcyBvbmUgbGl0dGxlIGNhdmVhdDogaWYgdGhl
IGxpYnJhcmllcyBhcmUgaW5zdGFsbGVkIGluIAo+IEJSMl9TVFJJUF9FWENMVURFX0RJUlMgKGku
ZS4gaWYgQlIyX1NUUklQX0VYQ0xVREVfRElSUyBpcyBzZXQgdG8gCj4gL3Vzci9saWIpLCBvciBp
ZiB0aGV5IG1hdGNoIEJSMl9TVFJJUF9FWENMVURFX0ZJTEVTIChlLmcuIGlmIGl0IGlzIHNldCAK
PiB0byAiaXBhXyouc28iKSwgdGhlbiB0aGUgbGlicyB3b3VsZCBiZSBzdHJpcHBlZCB3aGlsZSB0
aGV5IHNob3VsZG4ndCBiZS4gCj4gSG93ZXZlciwgSSBkb24ndCB0aGluayB0aGF0J3MgYSBiaWcg
ZGVhbC4KPiAKCkRvZXMgbm90IGh1cnQgdG8gdXNlIHRoZSBzYW1lIGxvZ2ljIGFzIGluIFNUUklQ
X0ZJTkRfQ01EIGluIG1haW4gCk1ha2VmaWxlLCBzbyB3aWxsIGRvLgoKV2lsbCBzZW5kIGEgdjIg
c29vbiwgdGhhbmtzIQoKUXVlbnRpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
