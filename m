Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CCDEB64D7
	for <buildroot@archiver.kernel.org>; Wed, 28 Jun 2023 16:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4AB44185A;
	Wed, 28 Jun 2023 16:59:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4AB44185A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tXtgJ5Lxxmaz; Wed, 28 Jun 2023 16:59:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D8D04184D;
	Wed, 28 Jun 2023 16:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D8D04184D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 130FD1BF2CC
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 16:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D545881494
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 16:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D545881494
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wdhKe7xGONjx for <buildroot@lists.busybox.net>;
 Wed, 28 Jun 2023 16:59:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69B2181430
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaf::60c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69B2181430
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 16:59:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqQ7836znv5o1GWmz/E+GyYHjdODV9EB8cqCBp2Z/E5DDbMhVJrL656dVROlPYZkAchVx7acErMK2of6ThsMP9Ufh8s9RPpHG+8NEdGB6EQ9Z3nvWBnog0vvauZgZ6kHGAePAqspbjw3W8BkZneBRV8m657fGq2Ft4YjX5Th0Hobt59bjHlRWO93rUrJR0HMHCikk6Cd68gdvQpsmDF23UC5ZKRI20qOzi3TYXV/ObV8uHRgymlgWFnFxGGH5pk9YBmNAdR6P8uxaxycNNrpC0u3EyanHbGCcH4bAit3O+85ZZDvP2e/PDEqgaHahg/mdN+8hqshjWavIdR+RldScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9nxptalnxEikDTK3ZJZ6spftJxXOEvlYjlzXx+XFP4=;
 b=Z3GKugDB3sBfmO0f3ImQX8cuvvGDouEofMWPEZj6TPYJov1V04BDASmWvDuiXfc3adgserKilr8aXufC7UmexsNP7n3zuUZdHvHj4Q0C4a20aRZVc7tsE0jewyed6Qy4PPkaCBlwsjOxwyggoijgp9HBzyfl5juVCJI3xGqogZkKVKC9UKPX9sjMW8FSwVFmQ45kEZJ02vTzAfIP4oym1McDioxQ4NFTc5V/Ik8qVMxVh+r372DiexDsqrk97HEuE8s0dmRwv18rPE5o4enUm6OJJZt0WI8rVa0HmIyMYt3OgWgay+Auac9aaSxB4R7ITkEWLccDlTJDq/FQAVcTkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=othermo.de; dmarc=pass action=none header.from=othermo.de;
 dkim=pass header.d=othermo.de; arc=none
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2ae::24)
 by AS8P193MB1670.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3b2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 16:59:23 +0000
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::82b4:7e36:1fa9:282f]) by DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::82b4:7e36:1fa9:282f%7]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 16:59:23 +0000
Message-ID: <c1f5511e-cc64-34da-c2a0-746498e88752@othermo.de>
Date: Wed, 28 Jun 2023 18:59:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-ClientProxiedBy: FR3P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::12) To DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:2ae::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P193MB1644:EE_|AS8P193MB1670:EE_
X-MS-Office365-Filtering-Correlation-Id: c5e40863-2eae-4ccd-f433-08db77f905d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oaKr9G8vCURe0uVlmvJubB2vF++nr9LqKC4XFUMxqY9eNxSpd8+IOjx1eQao4YFN2jzX5vwRzYO/wCfcM9yB+2ir+bcIJzb9sFKaDXWA9gZBUVl5u5+RqVrwkcyNX/n0TvtklDwah7Flt5IQmURCkdPrR+Dgqa5MEQ5JGveWrO60AMEtg41anWT48EuTgD9/VWbOqqNJDIRlknonwmldM6//awsmVMYBrp1JV3HlcX7zazy/fnXTQxF59OSENscjO2mKF5BOKxC7M2v3p8dzSaeL4lVlPQxnoFM/XZaPNBHy3lWSlS8ylz2nRO63MldnDqcqlanGL5UdjQjD5EzmH/r/Hn6C2TY/+/gaec2aHnA/9SWUlonTIrM9X6SP9wW1sY5GndoPJ4oIzUDA0tPwRQ5Cr32AbMuzbYk5k05XRaEZu99oZA4mTIJiIHEcG2wZFRG1+ZicF2ACjtsXmNaHO8eBttyuVKikgUiUQaBjcsKzIvZuw/XNUS7KAI6DMit/Pn6gSn6tP5eD0b/yRcbKcdCaAte2jfHRhks3h8tDHvMHKFciwqm/MmorOJ/qyWduJj/UvQnxRl+efhLrEH0HMp/6GGeJYJAYRk8H3llC8RV3A5uTtDW9ovwvpNHfOkrl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9P193MB1644.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(346002)(396003)(376002)(39830400003)(451199021)(2906002)(6486002)(38100700002)(2616005)(6666004)(186003)(26005)(4744005)(31696002)(86362001)(966005)(41300700001)(36756003)(66476007)(66946007)(6916009)(66556008)(316002)(6506007)(6512007)(44832011)(5660300002)(8676002)(8936002)(478600001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0NROGNGbXU0R2hQRDBBM3pZMGlkamdyLzM1VmRaZ0Joc1JhbFdmRW40WE1N?=
 =?utf-8?B?dEhlaGpwSmhKVW1SdS9Gc2JEclozZnRDcVhDcnFHNllqZmhOOGxBbEgzMk43?=
 =?utf-8?B?aW1MaXNWMWZMNTM5ajJSQmZ3MGh2djBka2FmSFEyM0tiYzl4WU43SFhnNWpi?=
 =?utf-8?B?WllPSjBCRGxsRUF2Uk5oekZ2RzFNK2FqcUN1cjYxWDhuRm1kcDJpaCtMQmVo?=
 =?utf-8?B?a25XT1hRVDR3bkNWS29PYitCRElBU1hJRVNqU1ZsU2VPU0N2cXlNZ2ZuZ1BZ?=
 =?utf-8?B?VU1BWUdFYUZRS3VJOG1yWXFYTnh5ZEd6TUwrK2I0M2tDY3BmSzlZWFVYS0Rp?=
 =?utf-8?B?a1lsZHd3RFVtVEQvNFJtTVMwaHNucE1keU1ZajV4QzFyMTFUakpNMEdCUDFx?=
 =?utf-8?B?bGZXdTcwbFgyRUkwUWh4Qm1DWjQ4WDUzdlRwNHNJcXV4eFJoRk5SOGE5ZUFn?=
 =?utf-8?B?RlZtN1lZUjdVd0tUUDdIcjhoY2F4aFJxemp6bkxHYVBQbHZkeldycmdqcmZv?=
 =?utf-8?B?bWY2dnJ3RUlLQTlrY3JLcGlFNElaK2dVekwvM1lpN0pEVG5mblRBaVhuQ2xO?=
 =?utf-8?B?MVp5akkwY0lWOCs5bXduc29JV3dtck4yQWVvUHAvZUxaN1A2R0VJVWNIdVZa?=
 =?utf-8?B?TjVVYmo0R01vVUg1d0h1UWNYYUlzNGcrd3VHcmlKbW9hS0dEWVo4L0Rvbits?=
 =?utf-8?B?MmYzd0J0cXNoQy9kMmwrQ08zWis4NzBVcG5ITUtsVjh0cmtDb2hzL0pFbDI0?=
 =?utf-8?B?Zi9NVlA0V1M1Z2J4SDhUdDYzemtOTHBDL2sxRjdSQXRnS3k5cDgrUlhpQzZN?=
 =?utf-8?B?blFGcWZMOWxhM0VhKzhqWFJZQkNLNFRUdlpZUUM0SnJmTklYODZrK3lPNzFr?=
 =?utf-8?B?bzV2TXQyRXlJSmVXekRYbi9XVVppNVV0MFpERXJXZUdWQUJxRTJWOG9yNUVl?=
 =?utf-8?B?MWRkVnZaRFc0RmlBRmZGajVFMkgrOUU3WnRNd2wyYklsemIzSHVQdFYwNTc0?=
 =?utf-8?B?Ulkvb0t1UXNveG9BaVp0bC9CQ2xOSUJXWkQrTjRVVXczcmJMcU52eXJXYVZP?=
 =?utf-8?B?ME1vNnNEQm4yTWYzaVNiTHZMYnVIWjc5ZzZBMkFqRFBVM0Y2OHBYNk90VDI3?=
 =?utf-8?B?Z2JBc2M1QmZRWDBBeDJvU3l2cVlXVTYwOVpXa3pUWTRHd2xlMExwK2NYYWpr?=
 =?utf-8?B?MlVLM1VoVEt0dmJpMTE0MVNvUEs5S05iMWY4SGgrbFNyM0tMUkRlR0tQTTFO?=
 =?utf-8?B?RTlDc1FidzJma04vK01LWkdNRDNnc214WVdzUTFnbEpmZEdya0duY3VWUy92?=
 =?utf-8?B?SDErTmxJNDI5THpacTVTRUlXZ0VxdnF5ZGdxYXdFbWliYlAwT011QXdwNWZo?=
 =?utf-8?B?cVdKZy9KVW56bjJtSy9rdy9mbVBCUzF5MktPck9KTGMyZUFIWVVOVnBMbE9x?=
 =?utf-8?B?dGprQm5BcWNuMGI4WXdJWVJpUlkzQUtIZXNXZDZmQzZpRUFlby9Ta0p5Z1kv?=
 =?utf-8?B?ZW51L29LckwvMm0zdUZybXNhT3lQKzN3enVlSWRSUlliS0xYM1gxK1lSMlg1?=
 =?utf-8?B?RlhnTGVleHprNTc3ZHQ5SExJemZiYmhXZ01JakNKekdVdzNWelZoa01ITVNj?=
 =?utf-8?B?STQrMmhLSGNDenFvOTVwZFVNc3pKTUFXWnJLVkVYTjRGdTM3RFZYODYvbGhu?=
 =?utf-8?B?bEsveVN4OE1Zc1dHdFNKL0w2SDdHT3hGZTREd3prcGQ5SkgvY1g4ek5LRTcw?=
 =?utf-8?B?ekxBRUQ3Njk0VzF5OGVPN2xsalNzSHJlVHhybGhjeHNQV0Qvd2R5Nk1hQVpY?=
 =?utf-8?B?U3ovc2hNNVkwWlFJaTVkWHRRbkU0U3BObnlSRUIxbjFMRkhNSHpEK29uakkr?=
 =?utf-8?B?VStyZTZFZi93UFgwZVhpcGZHRGFuUDNtL2pyTlF3Y1RMUnhUOUpRSVVpcFBL?=
 =?utf-8?B?Um9rZ3dQM3BqR211UW1lSzRwM2Z0QXc5cWJkTG5ZczFnMVhvUWszdTFqNGlp?=
 =?utf-8?B?RVB4SVdMRzVHcksyZnZEQjF2N1cwcnZBU2JjZFBmckNzOU9ZNSt5TDQyT0E5?=
 =?utf-8?B?Y2xKKzZnK0pJcTQrVEZvUGVIZVg5TEFna2l2YjJmY29WTWNnNVVSY0JQUThV?=
 =?utf-8?B?UEpXQXlKYzB0VU13VEZoVGR0Y2dkdUwzRHFTNE5CcTNVZThKYzVObjNBdzBa?=
 =?utf-8?B?b0E9PQ==?=
X-OriginatorOrg: othermo.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e40863-2eae-4ccd-f433-08db77f905d7
X-MS-Exchange-CrossTenant-AuthSource: DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 16:59:23.5633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 85b1b12b-9424-4d9d-b1a2-39f36faa8bc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T1vISZlHKG891n2myTsEBXgYmOx7dc2IVDCV/VVsM0YwUCLm9YGRyzvGbgZJiyWqc9uYGQ5qliJNnU6/PHwGkVX0sa5865waHVG1ElptdJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB1670
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9nxptalnxEikDTK3ZJZ6spftJxXOEvlYjlzXx+XFP4=;
 b=xkL0o49kB++kiQ/nFXlAmr9LA14MUMWuRdSJORwtaZ6StSDGQ3Rscg6y9QK3aV0L8AquEmt5WvE3pJmW2Nd7flOxJ3fRFkMrPX6tG8eaxG1n45viLWmHjLklYM6vaUDnGcC31boAc7BOdWfmd6kPqLeh4WHqdepCtvT0+u2ol5E=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=othermo.de header.i=@othermo.de header.a=rsa-sha256
 header.s=selector1 header.b=xkL0o49k
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=othermo.de;
Subject: [Buildroot] Reproducible Builds Summit - Oct 31st - Nov 2nd in
 Hamburg
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKdGhpcyBEZWMvTm92IGFub3RoZXIgUmVwcm9kdWNpYmxlIEJ1aWxkcyBTdW1taXQg
d2lsbCBiZSBoYXBwZW5pbmcgaW4KSGFtYnVyZyBbMV0uCgpBcyBhIGxvbmd0aW1lIGJ1aWxkcm9v
dCB1c2VyIGFuZCBvY2Nhc2lvbmFsIGNvbnRyaWJ1dG9yIEknZCBhY3RpdmVseQpsaWtlIHRvIGlu
dml0ZSBidWlsZHJvb3QgY29tbXVuaXR5IG1lbWJlcnMgdG8gYXR0ZW5kIHRoZSBzdW1taXQuCgpJ
J3ZlIGJlZW4gdG8gdGhlIHByZXZpb3VzIHN1bW1pdHMgaW4gTWFycmFrZXNoLCBQYXJpcyBhbmQg
QmVybGluIGFuZAp0aGV5J3ZlIGFsd2F5cyBiZWVuIGEgZ3JlYXQgYW5kIHByb2R1Y3RpdmUgdGlt
ZS4gVGhlcmUgaGFzIGJlZW4gbGl0dGxlCmZvY3VzIG9uIGVtYmVkZGVkIHRvcGljcyB0aG91Z2gg
KEkndmUgYmVlbiB0byB0aGUgc3VtbWl0cyB3aXRoIG15CkYtRHJvaWQgaGF0IG9uKSBzbyBJJ2Qg
bG92ZSB0byBzZWUgbW9yZSBwYXJ0aWNpcGF0aW9uIGZyb20gdGhhdCBzaWRlLgoKQmVzdCwKTWFy
Y3VzCgpbMV06IGh0dHBzOi8vcmVwcm9kdWNpYmxlLWJ1aWxkcy5vcmcvZXZlbnRzL2hhbWJ1cmcy
MDIzLwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKb3RoZXJtbyBHbWJIIHwgU2l0
eiBkZXIgR2VzZWxsc2NoYWZ0OiBBbHplbmF1IHwgQW10c2dlcmljaHQgQXNjaGFmZmVuYnVyZzog
SFJCIDE0NzgzIHwgVVN0LUlkTnIuOiBERTMxOTk3Nzk3OCB8IEdlc2Now6RmdHNmw7xocnVuZzog
RHIuIERlbm5pcyBNZXR6LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
