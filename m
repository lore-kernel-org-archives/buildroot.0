Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F40C43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 15:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DB3660EBC;
	Mon,  4 Jul 2022 15:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DB3660EBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UWrhz93fnRkw; Mon,  4 Jul 2022 15:25:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8A6A60E94;
	Mon,  4 Jul 2022 15:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8A6A60E94
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43B6E1BF314
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 15:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C793415A6
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 15:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C793415A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XXptrITYGR1f for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 15:25:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 732CE415FD
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70047.outbound.protection.outlook.com [40.107.7.47])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 732CE415FD
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 15:25:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HsBD/vFFjGwjU0bAkr+G+2ebX+0Msaix6339Be+S9yFFcV/6dAuVaKwdqOMRtXSz8NxWChigSifefvIvfDmYQvLEdtQ7BZ7aOGRuiOOv1iB8ZxLjFcq6jfFaTEzmV8Zw80nHTbVXxDRpIYM4P3/XlYVyip3BxRS6tMjeeJKxQEit6+TjZElOCVtHUlxAPkbyynOIwyxcC9swkcPem7XpXkmKqWNuZY/y0aeQJSvOigZST2BQtUmd4IqzpRKIxy4/spsDnyw2uH4UjOvxpSsbnGlTKYuRk+Md0MyZyXHP+sFc59zwKLpodwlb72Oz0dxZYvmXbNKDrhJ4gb+N8aQGHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woTW4noNB6KpQrkTFnpWnT+RmyqvWFjsYR2+B4drAp4=;
 b=fiXM9nQzhwC9kj7g31vQybZ1RESA5QaSCrNJwL1p3TJP6ViCrXX9dMAh5kcR1961qF/bAj0OyY7rlAhLcj3jBado0yZ88EZIkD+ZYQZ16l232M6ntxxxApiOP3MUSj4qZCBhpFU7/orO5hEa+UZ1FsX5Ez39hdwuYOG1FYjfBsnZSGbwm6HyoeFIqTVa2M5YiCcMw3gdavpH0GooIejgcTs617IPeRFSRKkjwd7JtfSfrumjyapHokGzCBoSptYQgS6UXc1JBQkeBdNkncGBipMCdIaW5qmE0Ii0/+QCgC2/t1tDvszpiXSjIvqP3j/LNifdbZrOXNWPOT9d8iZu8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DB7PR04MB5993.eurprd04.prod.outlook.com (2603:10a6:10:8d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 15:25:41 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::cc58:11a8:839f:895f]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::cc58:11a8:839f:895f%7]) with mapi id 15.20.5395.017; Mon, 4 Jul 2022
 15:25:40 +0000
Message-ID: <3362e2c2-dae8-3e0a-1db5-bf6f5e1df450@theobroma-systems.com>
Date: Mon, 4 Jul 2022 17:25:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
References: <20220506104658.3174243-1-foss+buildroot@0leil.net>
 <615471f0-f1d5-40e3-607e-3d4f114507c8@theobroma-systems.com>
In-Reply-To: <615471f0-f1d5-40e3-607e-3d4f114507c8@theobroma-systems.com>
X-ClientProxiedBy: AM6P195CA0107.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::48) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f8e8344-7311-45f7-ee5b-08da5dd17426
X-MS-TrafficTypeDiagnostic: DB7PR04MB5993:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g6ECKk/lGYLaUy3L7GDAYQLrpHnXeu4Txo/geqLVRJVLA9EqAS7R3hb+xX1S5ma5TVrCgtIkL7rJUxAaEx4KDBh4v/zilnHCiN0Mdxdhs33MMebo0x0cvqANX6MqrFk5utJakoRabAFylaJVpmy0HdPHyIxp2jHI6nwaR6y4O8pKkHtJhpuDxMqZv4VKrbUEEwFqlHet1oEIrfvCPSXT3cA2se2AYS3WNw6NlZcov3M0w3B1xFrpMuoKHSKcaihCAqrgcPF6Echgbp9uhrChqH5vWBTeVX/vTz96M8lFhj6Kf+2UfqsX83m/9KkiWLriI3cK2on1xgchRoDcY1cSFeq2D990YTXWM8N/FkLo+z6h7D1t9ef45U7C7AMuBSqA44txiWX+Z61sEoYa7Nu5Q2l0ncSAHzKFq9Jb5oYdwc6s9Tc/ngBGXs1m9CwdFTUZV4aQyAiupCZa7DOsJSFNndxkj8wXard/1mIpZrA+rV808MIgtaqqYmWVcMNg5hHronzuJSOVYxnbT2PjWk/fgKN/PdN4/4h/IN+6Ym9rnwyUnbR1m8Vc312PtpSmxrdowRYqvxVpK6LIluAmsTcjHolgReVQH4/+sOWD+ZKLl/obzKafCEpMavhk+dN3xQ8uVFS1geEBELxJZETTO5E7uEdde74RlxdNMh1DSESlK3j2tdo+KYaCPvGuomFpTQgG725m6JODAlDymvQ02W+1rjZxgXhfAgXAMTnf8jhA/a5tsJEMOb2a9iTkYALVq3N1UyViXi6Q2xzauwVZfvtTT9jbSyXvqg8D7Jvk975zUB6d3PaWMVzS1hoQFnGKt5Zxi8wmG8vj+nLY9bZ6OXlKVW5Gxyq6ZUfeU8et2hwU5KtuCqzTtEd9c+hMicUgQdx2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9367.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(366004)(396003)(346002)(39850400004)(6506007)(53546011)(66946007)(8676002)(4326008)(2616005)(66476007)(6486002)(966005)(41300700001)(86362001)(31696002)(6512007)(66556008)(26005)(316002)(38100700002)(478600001)(31686004)(2906002)(8936002)(36756003)(186003)(5660300002)(44832011)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bi9VR3c0emU2N3VZRmZrdjFqRTJDODdTbUJVRkIxalhKV04zMFZ2SDFuNngz?=
 =?utf-8?B?cTB0K1c5RHN4OXB0NnR0ZlhzN2RvTTBMSUoyRVh1TERqWmFsdGpZdDViWGRo?=
 =?utf-8?B?UmV4SDkxQnZqZ3JsajhGRFlOQk02YXBnbEpZYk50V1hvNXhSVno3cFdHQitV?=
 =?utf-8?B?ejlYL0dtR29adjZBdkRQWG1aWTlkbWJQK0w2VFJMVE1NUjZNbHBSaDU2VFFG?=
 =?utf-8?B?ajA2ZStXZ3o5eTB3T3lwM1ZIK3NnZlpVaUx1OFUyaUVYbC9GS01oNkhobklK?=
 =?utf-8?B?OHM5eVZVZDBuRXduN0JoZnAxUHRtazdqT2g2dDlIN1FrNDAxSXFmcHhDNjA5?=
 =?utf-8?B?V1pDVFlZR2cwajV4YjFmdDl1cXF3WHNJbklQUG1YcngvU3MyRG94WDZTZlls?=
 =?utf-8?B?Si95dDR2N0ZCNlczQS8xY3FNRm5vQjJMaHdqOS9xaHVlSmJGUFl5U0NVS1VR?=
 =?utf-8?B?UFlXTHN1N3dLalNZWi9hVk54UkQ1Yi9OeWtrQWFOcGExKzlkNnVtNlBoSHoy?=
 =?utf-8?B?K1ZaenE4S1k1c2hNMVdBWGcxeUMxWjFsdTNIaHYvTEYwQnYrKzFSQW1lK1pH?=
 =?utf-8?B?Q3R0bDFCbkZqWmQ3eWk3c2pIOTZuNzNEa3FsbDJXRGp6SU55Q0xwTHR5aWds?=
 =?utf-8?B?Wituc0d1Q0JiUGlyMVB0OFJPeXNYYzNzd05yTFY2U0dwSVB6Nlo0SFJ1TEMw?=
 =?utf-8?B?RjQ1RXFuUzBIK2JMdTFYU25FT042eW90dGFtZjk3L2Zxc1I3enVwRWtVdXFY?=
 =?utf-8?B?Uk1CSWpHZS92QlRaMTR5WXVQUUdmUURHVkdvb05tL0FORmxOQ2JaWk1RYlh2?=
 =?utf-8?B?ZDk3WlVYa0hYdVFnRTlUcmhqQVAweWd3T3M5djdmNDcrNXZib0RWYktnenk5?=
 =?utf-8?B?SDZWc0hjWEQzUlZVbDlXRnZ4VjZYKzBpOFNaaGVGWmhXNDdvNytibmhNUlBl?=
 =?utf-8?B?VmwxS0tnRzFnWkgwNHk0aFRjSnNEcEpFaUZFYk5CUGFxOWNNMlZ5SVZHbXY5?=
 =?utf-8?B?REd0UitHUnk3Rm9mK3JvRDU4cUpQcm16bmV3OG9lWFVRSkgyM1UrRkIyTmlR?=
 =?utf-8?B?Z3NUWmVPclYyenZhTGQxLzVpZVdTdnN4Z2cyVzJJbUQvT2R6dlZNUnVJNXFr?=
 =?utf-8?B?N0J2REROeWF6YmNuZ3VQVmg5cHpwdmdWT0FoNVRIN20rVmVtRVVxMjNMaEtj?=
 =?utf-8?B?VlJCUUF3bVFuaW9BRUVMUjB3dGJIWlRTb29PemVEejMrR25zbWt3QzRTQ3FP?=
 =?utf-8?B?OXRJbWhKRVcyK2c4SUZrcDBEVTJGY3lXb2w1R0kyU1U1elhGaUZjaHZjdk0z?=
 =?utf-8?B?UFluSVZUYUpnUnpydTd5MFBQMFkvK3BxSVpiZ0N5d1lCSklmS2Ztc3RQQ0xB?=
 =?utf-8?B?Qm54VFNhUGhlUEV2cU5VcW1OMmlvNTM2TkZRYWtHS2hxSEdmUVlkcUZIbzcr?=
 =?utf-8?B?Y01yb1pzOXJUdm9kNjNmMktscGZpRzhYNi8yK0R1R3JtcjZFbEtQb0E5emh2?=
 =?utf-8?B?Q3lMcmE0R3hHMGQ5VXZrMk1wQ1BvbmQ0dWQ5K3hFYWtpaXlkVWVTeDhtZjF5?=
 =?utf-8?B?Y1RPa1VtK29UWjlVRTJKaW4yYmZhNkh0RWxtMHBaWjUxa0wwUWxFcFBzS1FL?=
 =?utf-8?B?RDY0S2JtYkVUS0pVcVFZcE4wL3NmQ0xoTUIyY0pBcmd1Ymo2RzNCNURwT1Vz?=
 =?utf-8?B?aElIQ204YWVqblYxUUhSSy9Id3RWMGxqR1FhanUrdVI5WGZDWlU2ZExtM0Fs?=
 =?utf-8?B?aWVlRG9lbUhycTUycENLbzNNQ1N1eGpZOXF6U3gyWkhlTmVRZE13M2xpdmdG?=
 =?utf-8?B?TzJtbU1aNzN4bzBRUVE0K2NkL081cG5JYkc2NVZoTndHQWdPYkNaMTdxdVBh?=
 =?utf-8?B?clRadk5TSmY2Tm5yUzl5azNyRkIwYjJWeUhoM0xKT2lLMW5UbHlUMkx4VmhP?=
 =?utf-8?B?Q3F0SUNoRTR0VUxrdUU0c2ZVaytaaFlqRUMvSnpKY0Y0QkpjQ1p1ZnhPRCtJ?=
 =?utf-8?B?NlBSUVZZb005a1BBNnhHTlhOQW0vZ3llWTFlMk5aYTVTZCtlalBPLytPSElp?=
 =?utf-8?B?M09mRVlwMVNpZHFKTlU4enRKTlRWV1BSRjhFdlRoZi9hNTlOVGZpdktGUnZj?=
 =?utf-8?B?NWxNZ3J4cm90WkJWV0I0N2orWW1wVFM3ZzBnTHhDOTF4RWJvb1FZY0hmM3Bw?=
 =?utf-8?Q?yTvTrdE6RRJhaZh5RHOPuGo=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8e8344-7311-45f7-ee5b-08da5dd17426
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 15:25:40.8820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbbTObUFas6GfXOrYGeSdNmq/Vw+gkyvPKEA8bMLV5lgDDm9DCPs1dkYjG0/kzf4wYCDvaMlMQy2zADIw6q4qg+/QzriMxMD2aZcwTTENC6/bM24GavIBjI7yDjljFjI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5993
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woTW4noNB6KpQrkTFnpWnT+RmyqvWFjsYR2+B4drAp4=;
 b=Qu97nYVmFWpKOgABooGAGVHMORF/dT5X4VyI55xdrh9or61M/oEZWJ2tQViaLtl5JuZFWB+9haRdZlVyvpa/umyl+SGiGUmKVcXjPv4n0xQa0YUn4bz5dE+wsTXQi4CrURNo2LulZqhhG5eSkRg5ma/aIo0ukF5QvIq/D+ZD4qk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
 header.i=@cherrycloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=Qu97nYVm
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [PATCH v2] package/libcamera: strip symbols before
 signing IPA libs
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKR2VudGxlIHBpbmcuCgpDaGVlcnMsClF1ZW50aW4KCk9uIDUvMzEvMjIgMTI6MTMs
IFF1ZW50aW4gU2NodWx6IHdyb3RlOgo+IEhpIGFsbCwKPiAKPiBBbnkgZmVlZGJhY2sgdG8gb2Zm
ZXIgb24gdGhpcyBwYXRjaD8KPiAKPiBDaGVlcnMsCj4gUXVlbnRpbgo+IAo+IE9uIDUvNi8yMiAx
Mjo0NiwgUXVlbnRpbiBTY2h1bHogd3JvdGU6Cj4+IEZyb206IFF1ZW50aW4gU2NodWx6IDxxdWVu
dGluLnNjaHVsekB0aGVvYnJvbWEtc3lzdGVtcy5jb20+Cj4+Cj4+IE9wZW4tU291cmNlIElQQSBz
aGxpYnMgbmVlZCB0byBiZSBzaWduZWQgaW4gb3JkZXIgdG8gYmUgcnVubmFibGUgd2l0aGluCj4+
IHRoZSBzYW1lIHByb2Nlc3MsIG90aGVyd2lzZSB0aGV5IGFyZSBkZWVtZWQgQ2xvc2VkLVNvdXJj
ZSBhbmQgcnVuIGluCj4+IGFub3RoZXIgcHJvY2VzcyBhbmQgY29tbXVuaWNhdGUgb3ZlciBJUEMu
Cj4+Cj4+IFRoZSBzaGxpYiBpbnN0YWxsZWQgb24gdGhlIHRhcmdldCBzaG91bGQgYmUgdGhlIHNh
bWUgYXMgdGhlIG9uZSBzaWduZWQKPj4gYnkgbGliY2FtZXJhIGR1cmluZyBwYWNrYWdlIGNyZWF0
aW9uIG90aGVyd2lzZSB0aGUgc2lnbmF0dXJlIHdvbid0IG1hdGNoCj4+IHRoZSBzaGxpYi4KPj4K
Pj4gQnVpbGRyb290IHNhbml0aXplcyBSUEFUSCBpbiBhIHBvc3QgYnVpbGQgcHJvY2Vzcy4gbWVz
b24gZ2V0cyByaWQgb2YKPj4gcnBhdGggd2hpbGUgaW5zdGFsbGluZyBzbyB3ZSBkb24ndCBuZWVk
IHRvIGRvIGl0IG1hbnVhbGx5Lgo+Pgo+PiBCdWlsZHJvb3QgbWF5IHN0cmlwIHN5bWJvbHMsIHNv
IHdlIG5lZWQgdG8gZG8gdGhlIHNhbWUgYmVmb3JlIHNpZ25pbmcuCj4+IFNpbmNlIG1lc29uIGlu
c3RhbGwgdGFyZ2V0IGlzIGFsc28gc2lnbmluZyB0aGUgSVBBIHNobGlicywgbGV0J3Mgc3RyaXAK
Pj4gdGhlbSBiZWZvcmUgdGhpcyBoYXBwZW5zLgo+Pgo+PiBDYzogUXVlbnRpbiBTY2h1bHogPGZv
c3MrYnVpbGRyb290QDBsZWlsLm5ldD4KPj4gU2lnbmVkLW9mZi1ieTogUXVlbnRpbiBTY2h1bHog
PHF1ZW50aW4uc2NodWx6QHRoZW9icm9tYS1zeXN0ZW1zLmNvbT4KPj4gLS0tCj4+Cj4+IHYyOgo+
PiDCoCAtIHVzZSBMSUJDQU1FUkFfUE9TVF9CVUlMRF9IT09LUyBpbnN0ZWFkIG9mIHJlcGxhY2lu
Zwo+PiDCoCBMSUJDQU1FUkFfSU5TVEFMTF9UQVJHRVRfQ01EUywKPj4gwqAgLSBhZGQgaGFuZGxp
bmcgb2YgQlIyX1NUUklQX0VYQ0xVREVfRklMRVMgdG8gbm90IHN0cmlwIGZpbGVzIHdoaWNoCj4+
IMKgIHNob3VsZG4ndCwKPj4gwqAgLSBhZGRlZCAtLW5vLXJ1bi1pZi1lbXB0eSB0byB4YXJncywg
aW4gY2FzZSBubyBJUEEgaXMgc2VsZWN0ZWQsCj4+IMKgIC0gcmVtb3ZlZCBzdGRlcnIgcmVkaXJl
Y3QgYW5kIHBpcGUgdG8gdHJ1ZSB0byBub3QgaGlkZSB1c2VmdWwKPj4gwqAgaW5mb3JtYXRpb24g
b3IgZmFpbCB0aGUgYnVpbGQgaWYgc3RyaXAgZG9lcyBub3Qgd29yaywKPj4KPj4gwqAgcGFja2Fn
ZS9saWJjYW1lcmEvbGliY2FtZXJhLm1rIHwgMjAgKysrKysrKysrKysrKysrKysrKysKPj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbGliY2FtZXJhL2xpYmNhbWVyYS5tayAKPj4gYi9wYWNrYWdlL2xpYmNhbWVyYS9saWJjYW1l
cmEubWsKPj4gaW5kZXggNzczODFhYjNjYS4uNDFkNmE1YWJlZiAxMDA2NDQKPj4gLS0tIGEvcGFj
a2FnZS9saWJjYW1lcmEvbGliY2FtZXJhLm1rCj4+ICsrKyBiL3BhY2thZ2UvbGliY2FtZXJhL2xp
YmNhbWVyYS5tawo+PiBAQCAtMTA0LDQgKzEwNCwyNCBAQCBMSUJDQU1FUkFfREVQRU5ERU5DSUVT
ICs9IGxpYmV4ZWNpbmZvCj4+IMKgIExJQkNBTUVSQV9MREZMQUdTID0gJChUQVJHRVRfTERGTEFH
UykgLWxleGVjaW5mbwo+PiDCoCBlbmRpZgo+PiArIyBPcGVuLVNvdXJjZSBJUEEgc2hsaWJzIG5l
ZWQgdG8gYmUgc2lnbmVkIGluIG9yZGVyIHRvIGJlIHJ1bm5hYmxlIAo+PiB3aXRoaW4gdGhlCj4+
ICsjIHNhbWUgcHJvY2Vzcywgb3RoZXJ3aXNlIHRoZXkgYXJlIGRlZW1lZCBDbG9zZWQtU291cmNl
IGFuZCBydW4gaW4gCj4+IGFub3RoZXIKPj4gKyMgcHJvY2VzcyBhbmQgY29tbXVuaWNhdGUgb3Zl
ciBJUEMuCj4+ICsjIEJ1aWxkcm9vdCBzYW5pdGl6ZXMgUlBBVEggaW4gYSBwb3N0IGJ1aWxkIHBy
b2Nlc3MuIG1lc29uIGdldHMgcmlkIAo+PiBvZiBycGF0aAo+PiArIyB3aGlsZSBpbnN0YWxsaW5n
IHNvIHdlIGRvbid0IG5lZWQgdG8gZG8gaXQgbWFudWFsbHkgaGVyZS4KPj4gKyMgQnVpbGRyb290
IG1heSBzdHJpcCBzeW1ib2xzLCBzbyB3ZSBuZWVkIHRvIGRvIHRoZSBzYW1lIGJlZm9yZSBzaWdu
aW5nCj4+ICsjIG90aGVyd2lzZSB0aGUgc2lnbmF0dXJlIHdvbid0IG1hdGNoIHRoZSBzaGxpYiBv
biB0aGUgcm9vdGZzLiBTaW5jZSAKPj4gbWVzb24KPj4gKyMgaW5zdGFsbCB0YXJnZXQgaXMgc2ln
bmluZyB0aGUgc2hsaWJzLCB3ZSBuZWVkIHRvIHN0cmlwIHRoZW0gYmVmb3JlLgo+PiArTElCQ0FN
RVJBX1NUUklQX0ZJTkRfQ01EID0gXAo+PiArwqDCoMKgIGZpbmQgJChARCkvYnVpbGQvc3JjL2lw
YSBcCj4+ICvCoMKgwqAgJChpZiAkKGNhbGwgcXN0cmlwLCQoQlIyX1NUUklQX0VYQ0xVREVfRklM
RVMpKSwgXAo+PiArwqDCoMKgwqDCoMKgwqAgLW5vdCBcKCAkKGNhbGwgZmluZGZpbGVjbGF1c2Vz
LCQoY2FsbCAKPj4gcXN0cmlwLCQoQlIyX1NUUklQX0VYQ0xVREVfRklMRVMpKSkgXCkgKSBcCj4+
ICvCoMKgwqAgLXR5cGUgZiAtbmFtZSAnaXBhXyouc28nIC1wcmludDAKPj4gKwo+PiArZGVmaW5l
IExJQkNBTUVSQV9CVUlMRF9TVFJJUF9JUEFfU08KPj4gK8KgwqDCoCAkKExJQkNBTUVSQV9TVFJJ
UF9GSU5EX0NNRCkgfCB4YXJncyAtLW5vLXJ1bi1pZi1lbXB0eSAtMCAkKFNUUklQQ01EKQo+PiAr
ZW5kZWYKPj4gKwo+PiArTElCQ0FNRVJBX1BPU1RfQlVJTERfSE9PS1MgKz0gTElCQ0FNRVJBX0JV
SUxEX1NUUklQX0lQQV9TTwo+PiArCj4+IMKgICQoZXZhbCAkKG1lc29uLXBhY2thZ2UpKQo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290
IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly91cmxkZWZl
bnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19saXN0cy5idWlsZHJvb3Qub3Jn
X21haWxtYW5fbGlzdGluZm9fYnVpbGRyb290JmQ9RHdJQ0FnJmM9X3NFcjV4OWtVV2h1azRfbkZ3
akp0QSZyPUxZakxleERuN3JYSXpWbWtOUHZ3NXltQTFYVFNxSEdxOHlCUDZtNnFaWjRualpndVFo
WmhrSV8tMTcySUl5MXQmbT1CYzV0SGpYR0ZOYThxT09PbEMyNWI5d2VhU0hZeVVuZm1yTGFYeERP
UmQxUGw5VGdWUUU5ZHBxRUlOV0JyNVZCJnM9NExCZVpsRnRJcU5GSEpEQlpPOW13RkdXQTE0akxB
Zmp0LTE2M3lYZ0plYyZlPSAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
