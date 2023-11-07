Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A897FC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 20:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46273416AE;
	Tue,  7 Nov 2023 20:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46273416AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7InQo29fuHSZ; Tue,  7 Nov 2023 20:24:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5152341675;
	Tue,  7 Nov 2023 20:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5152341675
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A74DE1BF291
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 20:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F0DE81A92
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 20:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F0DE81A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6596T8VjPY02 for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 20:24:25 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBFF781A81
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 20:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBFF781A81
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMH0oU19czrT3OMQw992CuCkXV5GR2L/n5x01kqfOLjG+zn1CJjNtuxJBeFov+Bw/WID8EaVQAXNAN/OBdZs3dZsxqf3iVOcu1TdCGl9GZmbaniGDZ3Wi905R7TY6oxH4jZPxegHEa3TmvAk+ThF3JWrh2SsgqXv5/pl7UH9fIBGv3X3RpiKMFO5LaH6ehGtEOamHd4429ydL0WKAKn8mYTKxUOzezuqdH5WHIu56ph9ezR+H1zcNfuK3DPZ8NmFRd9vYPi3YCG4/49QF7IkPx3uVlHvqFrxQbkARzQhojM+/66Gga7+RKymUrBqn/e8I/vjS0PcCGRKgDRdt3XW+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1i69/5F7UIojFZ4Re04iTDawJEVeEBjH6I1XV4zkgI=;
 b=fRdXuOrJcdIOvk1H5SAZ0d/QYf5HDmqja2pWESe2iqeyrJbbJAIFBtNsMbQfloo9b8vTX0XkXtkcHpjUnFGujWu0QOC0tktYUem59r3PUp4kR5hmavHTJVDDhZEJd0mmVLorF15v+yXrD+tOTPpcfRAMEHmBmhCCU+uvmfcsDOAL13cn42YN3BIKGeiTQBrmzaYEBdnffm+yCVWd+vFsjCkwxYbMsAJER0j/mQITqpkQLvtfDVppV0qttzfEHX5KlWgr2sl4qZFdlbgVxDFzQNs9J65NwUAZ+p5O4Ex+WvdqnBAMP9BhJ9m3hJ+jr487vK5Nlea2TgR3PyNpTZoKcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=othermo.de; dmarc=pass action=none header.from=othermo.de;
 dkim=pass header.d=othermo.de; arc=none
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2ae::24)
 by PR3P193MB1103.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 20:24:20 +0000
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::67a4:c94:e069:11a7]) by DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::67a4:c94:e069:11a7%7]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 20:24:20 +0000
Message-ID: <0fb9f965-f9d9-4fe9-aac2-e0a2f9ea3b26@othermo.de>
Date: Tue, 7 Nov 2023 21:24:17 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christian Hitz <christian@klarinett.li>, buildroot@buildroot.org
References: <20231107124157.594529-1-christian@klarinett.li>
In-Reply-To: <20231107124157.594529-1-christian@klarinett.li>
X-ClientProxiedBy: FR3P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::23) To DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:2ae::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P193MB1644:EE_|PR3P193MB1103:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc33301-0364-4bfe-bff2-08dbdfcf85df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YRCAuoD8EKXM+IujiO+9+0X1aEpQx34GWgKU7V6WpU3bW8JEPE0xLvRUdExFPENo3/tY7G5ijjaSWchwIWfpsx4Fzk44J/sQJrfmCW9LbOBZKDOyjOE4MD/bX6y7C7HkY48moS2aEInuh27kZY/muF3RI4gTRMNOcnG8MbeX5beGnQ6+ZWXw5Yod7pO2R7rNekhtN1srwGGmfZJ2Ott5BrHVIIo+3mgqziWazHVD89UYgCfjbq+oYntA7wTRTAfuP4DWD4vS2FOMS4aM4idsChiy/BfNg0zN43nJWVLrM6HmnLCEu2k2iBVxb/bYvR4Gj1vayM1+zfyurai08ENs0XY2VYrPQcYMtEkjPKNm4FmTQxqslDpchtqrPCCfptSMRCD4lduggJB0BVxeZqvKIeW2qU2656bdHw54Hm9WIcx5XQ7N34O9Sqs8TwN0BB0BJhX+stORVftmQ45Ez1FFJIXYMhXZCT0IaCUJdJMvFd8wB+lVzPJNSX//Ze9HdHi9Ai8MC5NZvyjXCn2yE5H8IgxkYR0qOlblgJGsrGtak/tfEWb43t/jHULIBkJqSlXoy3f3i3xRAAdVeydnKIKkflNBLKgq08wgBxfO+/33+mKTfqnlyhDL/7f8C9q8huvH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9P193MB1644.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(396003)(136003)(39830400003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(31686004)(6486002)(966005)(478600001)(86362001)(36756003)(38100700002)(31696002)(83380400001)(41300700001)(6512007)(66556008)(6506007)(66476007)(66946007)(6666004)(53546011)(66574015)(2616005)(5660300002)(44832011)(2906002)(316002)(8676002)(8936002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0svM1hxMS8xRnBFNnFETDlrODlWd3dPREZOMkVyeVJqVkMwdDFadDJqcEQ4?=
 =?utf-8?B?RHJuNUdaUTkyRVdWZEcwRGFQTUdDb3FJZkI4SFpIZ1crci82VnhUMTlDQlhM?=
 =?utf-8?B?aCs5WGhRU2RvcnZTMElKMFljR0ZtVUFCZ3JmMDNlZnltS0ZPQXJLbWY5bDNX?=
 =?utf-8?B?cE9JNmgxYWVoL1QzOTd5b2NxNWYxVFZTOVpySTEzTzBBbnRDN3dlVkVPbGZE?=
 =?utf-8?B?c2tXV0s4SVN3LzBZWTltc0RCbkxWNTRld2V0ZU93eUlpNlBlWG1jM2RpYkZ0?=
 =?utf-8?B?aGRDaFVwM2lCYkg2TXJlSUJqczZjeXE1OHZVVmNMdFZ4L1hSN1hKak5oV1Yw?=
 =?utf-8?B?YXY0cnlFemJrcjZOckV4ajdrSnVuV2pjeCtIaEhsVmRBbGFuVXFXQ3BtNnR3?=
 =?utf-8?B?aFhDdkN1ZmNvdEJ5QkxRUzJ3R0xFcGpHVlRrdkc4cnVjNlJ1QU9LUWRuYzBJ?=
 =?utf-8?B?Y0J2cXQ2b2FKcHNMd3JGeGFDaDluVGt2Uldva1E2M2NMQ0JXZE9ndjJvTUZX?=
 =?utf-8?B?dGdxazVQODIrNWZrZ0dsdDF2N2pkeXNNVEVuSWVGWUxmRlM2WTdkVElDaFI2?=
 =?utf-8?B?dmZ3dC9RU2pNazRNSEtCU0djU0JheUZrT3BzdEFXcFJFSjJtU2s0QW9scTN0?=
 =?utf-8?B?TkFQTDNrRk5TQ0pWQ1NVemE5TkRGU3h4ZHdiUVdxaVJiV1IrZnZYajlxNGlJ?=
 =?utf-8?B?TkFteGZBK29tUDBzNFVCcE12SFczclQzcG1UdGhCdFRLdUw5T3UxMHNudTVU?=
 =?utf-8?B?akVTZkFCblF6MEt0c1pBZUZuRUxXZ2ZhRytYQ1pXUkpBeVIrZHNUTWc4VW1B?=
 =?utf-8?B?V0F1OXRpd3FCSVJXR1NEZFNGby9NeWw1ZjZnMDN4eTc1bmdSV2lOUllWek5L?=
 =?utf-8?B?cWlsUlhJbEltcE9CM0VZbU4va0tQUWhCN0RrQ2hJOFBVMkNwQ252d0pXTHZS?=
 =?utf-8?B?c0RPVTV4bGdFOGR3MkVkelQzYzIrZnRadGVTWW0vSzYvT0NBZVBnQnI1MTRT?=
 =?utf-8?B?cVN5R0NMaVhIdEltRzlIbWI3SzBVZHA1YnVIYjEwQjFOTThXc080dEpVbkxh?=
 =?utf-8?B?MGozTjlMSWc5VEd5NHNwTGJ0bVh6eU9hSGxrTFRVdCtkNDZkNnRIRUhpVWh6?=
 =?utf-8?B?MXUyamV3WWJaT3BIQVRMeWc2YzZUMDFmMWp3K0lORzJnRXQydTlDeVhvS1lT?=
 =?utf-8?B?NnoxdXVOeXB5TERpVWRydUJ1SXNoOFN3aEFpay9NQzFzK1QyVFFiRGJIYUxq?=
 =?utf-8?B?TTFWbU8zN3RaMmlTbjdhOGdIbWtqbTlCdXQ5RDFKMnlneEt2Y3BvM0VrZk9H?=
 =?utf-8?B?dlM3Y05jMDc1TWxVKzFZUzhXY09kbVA1WTYvdDVhUmJlcENmRUQ3UWxxZEQ4?=
 =?utf-8?B?SGZHdTBCVlN5ckQxOXdZRVhkY1F3OXkrQ0dwRWgvTHRrd1JhOWJJYXhhVEJj?=
 =?utf-8?B?andueHdSVy91ajdvcysvZ1ZhSko4NkttcktTNmhnY0cvNW1hc2JsdEg2alE4?=
 =?utf-8?B?NXFDU1ZycjJHQ204WmZKcDlmRHd1NmVUcjVRY2Z4VEVrdmNweVdnQUs0ZDVM?=
 =?utf-8?B?N0ltZTUyVzh2Rjh6cUF5SEpNT1NMTit0eGwza05zYnI0TTBZSWdQL2Z4Qkky?=
 =?utf-8?B?ditxSFc5bXNzVktGbUtlQU91c3lPOHpXQ2R5WjgzNEQ4NHNuMGIzNWZYaVRQ?=
 =?utf-8?B?cXFib0pwbGxkeFBsKzB0dThaNVJESVpUZXc3elBOVlV6VEt3NjNpUHkvM3RM?=
 =?utf-8?B?MkVPUXduZWgyTE56VTgyT3ZCdk53ZnYyNFcydUI0a2V0S2ZQSGcxQU9pT3ZL?=
 =?utf-8?B?SzFWcnZlMi8vZ21maGx4ZndwLzlDSlp5dVYzK2tPdjRYaHNNaE5EZ05aTmhQ?=
 =?utf-8?B?L1NnUVNrbDdYYzlmY1pvdytwa1Q1ekpLR3JTdHROOUlUNVoxb2FhUUJaRmF1?=
 =?utf-8?B?QkFJemtSRkN3UWdhMkRLaHNHYmUyMi9CMmpNUCtVd1pRUFhjQVZyNGtYcjRF?=
 =?utf-8?B?SDVKbU9QaGJXUUIyY25GNU42MHFlbTdvcmZSL3pqZ3o4WTFKUkZlZGJLRmZp?=
 =?utf-8?B?UnllbU5rQTV1QU9hS2xvUjhyemVURm5Bci85akpLNU1wdmE0QWNSeWpOOFcx?=
 =?utf-8?B?NmdQaVNOcHZtemNQbmZFNmpDMHA4MkN4dGhjUUNBcXFuak54ZmJWTS9OMkdY?=
 =?utf-8?B?Q3RjSnR0MnJuL0lrTkRzeWxVaFMrNWF2aHRRejZpZDBIa25DWVJCYXRMQzZa?=
 =?utf-8?B?djRLY3ROeWRJQTcxVHhTNDRKV0FRPT0=?=
X-OriginatorOrg: othermo.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc33301-0364-4bfe-bff2-08dbdfcf85df
X-MS-Exchange-CrossTenant-AuthSource: DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 20:24:20.3996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 85b1b12b-9424-4d9d-b1a2-39f36faa8bc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9cYobnxjTIkpn0L1CfCl95Z88DspCtevig8IbrRMbrbnSMN3TXZ350On61whnXP/f5fpDb6LLDIOYuJYBKS4izompADtF3b/fr3Xy3Wpv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P193MB1103
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1i69/5F7UIojFZ4Re04iTDawJEVeEBjH6I1XV4zkgI=;
 b=wfcrZG2pzM9jZ4xGizLIk4rOrAtdqS7ffdGQy6EjfMKk3zDd/G4aVPm9NsTtqc+8YdTD4XeryhFu0DP3FnY7Oc8utSPcATywOwvYUYEWGr8ldw5XngPvacxpOhzFhncc5CzIJGRaS6VddkBBox7KYbDPIsVeAQYwOdsqRva+Q4I=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=othermo.de header.i=@othermo.de header.a=rsa-sha256
 header.s=selector1 header.b=wfcrZG2p
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=othermo.de;
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: add patch for
 compatibility with curl 8.4
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Cc: Christian Hitz <christian.hitz@bbv.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDcuMTEuMjMgMTM6NDEsIENocmlzdGlhbiBIaXR6IHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4g
RnJvbTogQ2hyaXN0aWFuIEhpdHogPGNocmlzdGlhbi5oaXR6QGJidi5jaD4KPgo+IFRoaXMgdXBz
dHJlYW0gcGF0Y2ggcmVzdG9yZXMgdGhlIGNvbm5lY3Rpdml0eSBjaGVjayBmdW5jdGlvbmFsaXR5
IHdpdGgKPiBsaWJjdXJsIDguNC4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBIaXR6IDxj
aHJpc3RpYW4uaGl0ekBiYnYuY2g+CgpSZXZpZXdlZC1ieTogTWFyY3VzIEhvZmZtYW5uIDxtYXJj
dXMuaG9mZm1hbm5Ab3RoZXJtby5kZT4KCj4gLS0tCj4gQmFja3BvcnQgdG86IDIwMjMuMDIueCwg
MjAyMy4wOC54Cj4gLS0tCj4gICAuLi4tY3VybC10aW1lb3V0LWNhbGxiYWNrLW5vbi1yZXBlYXRp
bmcucGF0Y2ggfCA0NCArKysrKysrKysrKysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNDQg
aW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbmV0d29yay1tYW5h
Z2VyLzAwMDEtY29ubmVjdGl2aXR5LW1ha2UtY3VybC10aW1lb3V0LWNhbGxiYWNrLW5vbi1yZXBl
YXRpbmcucGF0Y2gKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL25ldHdvcmstbWFuYWdlci8wMDAx
LWNvbm5lY3Rpdml0eS1tYWtlLWN1cmwtdGltZW91dC1jYWxsYmFjay1ub24tcmVwZWF0aW5nLnBh
dGNoIGIvcGFja2FnZS9uZXR3b3JrLW1hbmFnZXIvMDAwMS1jb25uZWN0aXZpdHktbWFrZS1jdXJs
LXRpbWVvdXQtY2FsbGJhY2stbm9uLXJlcGVhdGluZy5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uOGUyNTgwNWQwYwo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9wYWNrYWdlL25ldHdvcmstbWFuYWdlci8wMDAxLWNvbm5lY3Rpdml0eS1tYWtlLWN1cmwtdGlt
ZW91dC1jYWxsYmFjay1ub24tcmVwZWF0aW5nLnBhdGNoCj4gQEAgLTAsMCArMSw0NCBAQAo+ICtG
cm9tIGFiYzZlMWNmMjU4YWIzMzJiZWQxNjEwMzZhMzU4YmJlOWMyZDFlOTAgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCj4gK0Zyb206IFRhdHN1eXVraSBJc2hpIDxpc2hpdGF0c3V5dWtpQGdtYWls
LmNvbT4KPiArRGF0ZTogRnJpLCAxMyBPY3QgMjAyMyAxNjo0NjowOSArMDAwMAo+ICtTdWJqZWN0
OiBbUEFUQ0hdIGNvbm5lY3Rpdml0eTogTWFrZSBjdXJsIHRpbWVvdXQgY2FsbGJhY2sgbm9uLXJl
cGVhdGluZy4KPiArCj4gK1RoaXMgcmV2ZXJ0cyBjb21taXQgMDVjMzFkYTRkOS4KPiArCj4gK0lu
IHRoZSBsaW5rZWQgY29tbWl0IHRoZSBjYWxsYmFjayB3YXMgbWFkZSByZXBlYXRpbmcgb24gdGhl
IGFzc3VtcHRpb24KPiArdGhhdCBmb3J3YXJkIHByb2dyZXNzIHdvdWxkIHJlc3VsdCBpbiB0aGUg
Y2FsbGJhY2sgZ2V0dGluZyBjYW5jZWxlZCBpbgo+ICtjYl9kYXRhX2NvbXBsZXRlLiBIb3dldmVy
LCB0aGlzIGFzc3VtcHRpb24gZG9lcyBub3QgaG9sZCBzaW5jZSBhIHRpbWVvdXQKPiArY2FsbGJh
Y2sgZG9lcyBub3QgZ3VhcmFudGVlIGNvbXBsZXRpb24gKG9yIGVycm9yIG91dCkgb2YgYSByZXF1
ZXN0Lgo+ICsKPiArY3VybCB0d2Vha2VkIHNvbWUgaW50ZXJuYWxzIGluIHY4LjQuMCBhbmQgc3Rh
cnRlZCBnaXZpbmcgMCB0aW1lb3V0cywgYW5kCj4gK2EgcmVwZWF0aW5nIGNhbGxiYWNrIGlzIGZp
cmluZyBiYWNrLXRvLWJhY2sgd2l0aG91dCBtYWtpbmcgYW55IHByb2dyZXNzCj4gK2luIGRvaW5n
IHNvLgo+ICsKPiArUmV2ZXJ0IHRoZSBjaGFuZ2UgYW5kIG1ha2UgdGhlIGNhbGxiYWNrIG5vbi1y
ZXBlYXRpbmcgYWdhaW4uCj4gKwo+ICtGaXhlczogMDVjMzFkYTRkOWNiICgnY29ubmVjdGl2aXR5
OiBkb24ndCBjYW5jZWwgY3VybCB0aW1lcmZ1bmN0aW9uIGZyb20gdGltZW91dCcpCj4gK1Vwc3Ry
ZWFtOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvTmV0d29ya01hbmFnZXIvTmV0d29y
a01hbmFnZXIvLS9jb21taXQvYWJjNmUxY2YyNThhYjMzMmJlZDE2MTAzNmEzNThiYmU5YzJkMWU5
MAo+ICtTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gSGl0eiA8Y2hyaXN0aWFuLmhpdHpAYmJ2LmNo
Pgo+ICstLS0KPiArIHNyYy9jb3JlL25tLWNvbm5lY3Rpdml0eS5jIHwgMyArKy0KPiArIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiArCj4gK2RpZmYgLS1n
aXQgYS9zcmMvY29yZS9ubS1jb25uZWN0aXZpdHkuYyBiL3NyYy9jb3JlL25tLWNvbm5lY3Rpdml0
eS5jCj4gK2luZGV4IDkyZGU0NGYxN2QuLmQ4YjAwMDRjMzggMTAwNjQ0Cj4gKy0tLSBhL3NyYy9j
b3JlL25tLWNvbm5lY3Rpdml0eS5jCj4gKysrKyBiL3NyYy9jb3JlL25tLWNvbm5lY3Rpdml0eS5j
Cj4gK0BAIC00MDYsOSArNDA2LDEwIEBAIF9jb25fY3VybF90aW1lb3V0X2NiKGdwb2ludGVyIHVz
ZXJfZGF0YSkKPiArIHsKPiArICAgICBOTUNvbm5lY3Rpdml0eUNoZWNrSGFuZGxlICpjYl9kYXRh
ID0gdXNlcl9kYXRhOwo+ICsKPiArKyAgICBjYl9kYXRhLT5jb25jaGVjay5jdXJsX3RpbWVyID0g
MDsKPiArICAgICBfY29uX2N1cmxfY2hlY2tfY29ubmVjdGl2aXR5KGNiX2RhdGEtPmNvbmNoZWNr
LmN1cmxfbWhhbmRsZSwgQ1VSTF9TT0NLRVRfVElNRU9VVCwgMCk7Cj4gKyAgICAgX2NvbXBsZXRl
X3F1ZXVlZChjYl9kYXRhLT5zZWxmKTsKPiArLSAgICByZXR1cm4gR19TT1VSQ0VfQ09OVElOVUU7
Cj4gKysgICAgcmV0dXJuIEdfU09VUkNFX1JFTU9WRTsKPiArIH0KPiArCj4gKyBzdGF0aWMgaW50
Cj4gKy0tCj4gK0dpdExhYgo+ICsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCm90
aGVybW8gR21iSCB8IFNpdHogZGVyIEdlc2VsbHNjaGFmdDogQWx6ZW5hdSB8IEFtdHNnZXJpY2h0
IEFzY2hhZmZlbmJ1cmc6IEhSQiAxNDc4MyB8IFVTdC1JZE5yLjogREUzMTk5Nzc5NzggfCBHZXNj
aMOkZnRzZsO8aHJ1bmc6IERyLiBEZW5uaXMgTWV0ei4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
