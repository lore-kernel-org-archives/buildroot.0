Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E18C76196
	for <buildroot@archiver.kernel.org>; Mon,  3 Apr 2023 07:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22E7760E1A;
	Mon,  3 Apr 2023 07:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22E7760E1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KIt_7Acw7gMC; Mon,  3 Apr 2023 07:59:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6436860BAE;
	Mon,  3 Apr 2023 07:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6436860BAE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6753E1BF215
 for <buildroot@lists.busybox.net>; Mon,  3 Apr 2023 07:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CA6D410D6
 for <buildroot@lists.busybox.net>; Mon,  3 Apr 2023 07:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CA6D410D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dqkskgZGxuTg for <buildroot@lists.busybox.net>;
 Mon,  3 Apr 2023 07:59:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83B8A410D4
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaf::60d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83B8A410D4
 for <buildroot@buildroot.org>; Mon,  3 Apr 2023 07:59:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aw3n8lwXQxaS55LS2QD8fQHwT4q2Ejy4ZGo9obvEUfgBUiZ6vTAugfe0bLA805ZAOkWIoXegAgvuVVGUUpu6Q8C9pcENLWbN7rsFXdp3dxkF3oy/ST4ZP3bWdFYjtnsKfj77jbFf4UBPfR7ASo3fw/SMj74+RZl0hLwXzmHcwPxBzqZXQ3jA5AZ9YcL61KEvhy8gsOBHIN6zbmo/aSXHHyY67b9oI/jO+mnHwHABgWY2luyOILRhE3rErrgsX+2rkhVrnYelHdYbtH+c4zvfDItkyaz/9RY7WF40tdwNKjcTzg6BuWGyOqMf0A9bUnuti+cBQI1tRSbPT/oKltl78g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S256yB4An3N36qa8CVg9yjetH5XHLezmo2/SM2AF120=;
 b=XKUiqUQwAQg0IDf6O5wbtYTyir26pPxgyXNgYHEr3C5O/l+/AmNw5olXQVAudP2jvpGuaLa17s5rSd60BjLayKw6UIbDgAVkoBPVJZyiIt1AqUPgw75k04c6JqyePhWPjg+fMHeZh+6xmmxKBuYJ3eU1onD3TyNkiaSG4TYgVHK05HiBrZU3koyoMJiHZ724kFa8zcKwGArhaalY4GUyQSH3SxTsWdxYAZwzs2paGT/dLYF72ZanMH7Q62Ou0EKb6IGhqP6IzLD0qxB5Dh/bAhq5BFt3wuwBh2+GRfJaAydM2PxWcI/V8atWC5mhF7mu4a3s+mlqXzFjDAtkILBVcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=othermo.de; dmarc=pass action=none header.from=othermo.de;
 dkim=pass header.d=othermo.de; arc=none
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2ae::24)
 by GV1P193MB2245.EURP193.PROD.OUTLOOK.COM (2603:10a6:150:2c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Mon, 3 Apr
 2023 07:58:58 +0000
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::be4a:e0b7:6db2:8abe]) by DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::be4a:e0b7:6db2:8abe%9]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 07:58:58 +0000
Message-ID: <f9849822-040c-74ef-a49a-a2d7502d3e40@othermo.de>
Date: Mon, 3 Apr 2023 09:58:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Arnout Vandecappelle <arnout@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230206120400.3188421-1-james.hilliard1@gmail.com>
 <20230206120400.3188421-2-james.hilliard1@gmail.com>
 <dd2bcf74-02d9-029a-367e-2d74ff46d79b@mind.be>
Content-Language: en-US
In-Reply-To: <dd2bcf74-02d9-029a-367e-2d74ff46d79b@mind.be>
X-ClientProxiedBy: BE0P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::17) To DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:2ae::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P193MB1644:EE_|GV1P193MB2245:EE_
X-MS-Office365-Filtering-Correlation-Id: 7396b6b6-ef7c-4012-4d2c-08db341947a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0k3cxhqvtWCEsid3XWwOe3uJfsTgOnhlZuLd6u7PsK+nO4BkmlnVAsWJNtjedUjliPhqlXMy8jC5hSrDe6mMq2I/Qi6gEnEoATcFgCabSQyNyHtNAHD9pQcklayTyYmbIV7K35FvYnPo9rOQcPQmPufz4sYcbJrFnv0YxzgIVtY1vP//VAIzmwRtD1Hwwk+yhpxZwBZ5Y0XXD1wYWnzh/55jLdRMLf5JoPuFxXXHRBXM/m8V7dOrbMpY8gu8+3bqkE0q2YlGcEgbVVAiT7cboK63dg/msGVo8/wctozyvvoSUX8UMg+BnRBTS2UEXTIERIorH8ybvzSTUF5XNj2moN6MfJf0XcPNTkVgHj4a/vu9/ANE5oUHDlHj4S1HQNx8MnAKCqWcCHuoO6LeSMJZjMahSHHZAlB56odBLNcu1ULo+y6/wxboRyyDPZxZ2QtxHJGD7kYXpyRBv1Uvgql/z+GR6NS6ZoxexKJzzYElaFC7xmEg/b1+Su27Y50ia93dw0z8vdhI/mlPyYDj9iDN8pgPm5G6akVdV+6m4W2iIa+2jqQI4YKisjk81ihaBhd9rGgYmj+SmlLWXoaS7HGyesA13MF+C3u9mt/P6/7D6ivJXq1+ieIyuCc+h6VKy7GuziuMjYlw2r5W4+BxKi0q7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9P193MB1644.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(346002)(366004)(39830400003)(376002)(451199021)(31696002)(86362001)(36756003)(2906002)(31686004)(2616005)(966005)(53546011)(186003)(6506007)(6486002)(6512007)(8676002)(66946007)(478600001)(66556008)(66476007)(4326008)(41300700001)(5660300002)(38100700002)(44832011)(316002)(54906003)(110136005)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0tRSVFqQkxkTWdKNFA1dVIvZU9CTTd6eW56SG5yUHk5ajhPZWpGeGJ4RGl5?=
 =?utf-8?B?UGpYVVdzS2QwV0Nhcnd3QUliZExWRGwyWE1WdnBzVjdNVHJHVklwUllabC8z?=
 =?utf-8?B?MFRJUEc3c05Db3llanJCeTN0MTNwWlh3QlhKM0p5VWJ0TW0xeHZpWHJKaUh5?=
 =?utf-8?B?UlNxMmhmWjFCdFRZTEY2QnhIK1FFaVM0VjBlZk91MHczVFQ1OW1kdUdwenBu?=
 =?utf-8?B?UE83dVc3RCtzRFlHdEF0U3JJcWxaN1orRUtML0VNTCsyN2FNTWVsRXN2OUM4?=
 =?utf-8?B?L3VmUUFFczdSZENKajR2a1ViUDV6RFBIMDVKYkdkM0lRdWdtNE1xNUhtbmNn?=
 =?utf-8?B?bTU4VXZ6VmVQU3JRb1RZMlg4QnJwMkRpL3VjLzkveGpuMFFmNFpkUDBabTVj?=
 =?utf-8?B?MWR3N3ZWUlRMS1p2bzFwNTBaWEJPOE11RVR1VnRzVVlpTzBNN1VTQlZuSUVS?=
 =?utf-8?B?YWh4MDdMaFQzT0U5WFg3akYrWFJxZVJXTmlvVjY5UTFTUHQ2OVAxL3JycnFL?=
 =?utf-8?B?UTE0RFltOVVJMWFTRVNGeGx5UmhKT3BENVB2NS9iR3dDMUNicCtIS3pESlhR?=
 =?utf-8?B?YXBTclk2UEMzWlFHN3dYK1RVbWRJN3lXcjc0NjcrbG9JYXcvdVFBNnBCMGRp?=
 =?utf-8?B?NGlKcnN6ZWtGd2JTeTVucHdVMVpHM1JlRFd3SUMzR3FaeFFpZEZ1K1RWdkdY?=
 =?utf-8?B?czkwR0s0M3NVMDJVYkE4Z0hpK2RHd21LUEpBL2JMdWw4SFVxOWNMaUZBZjR5?=
 =?utf-8?B?OGk0Rm9FOVJBODI3c25zUEZGbWlpNHFUcEJkY2xFUFJQTzBJdGkvUHliTHhB?=
 =?utf-8?B?SzBJUFVuTmEwVEZ3eFAzRWFscTVPNUEvZGN5ZmYxUGt4aUlzOVhOSnpFbWJT?=
 =?utf-8?B?MFJBeFcxUVUvQUovVjdqSWtsakpRamZ2Y1ROdkRCUE9RQk44Rk5qV3RGZlJt?=
 =?utf-8?B?bTFUc2xGUlJUcUdIaGFBYmhGTk90WGozOVRwZm5OWmgyeUVITDV6bVN4R1k0?=
 =?utf-8?B?NEJpMTJlbER0eE5GWXBBL0NhYXY5U0o0QWxOQVVNNzE4SG5WeHFwR1dOZUVI?=
 =?utf-8?B?L21FdDlVTWZXdVdqblZSZVZzN1VQZlV4bkRVUkJDYUZxR0swM1o1WHY4Zk51?=
 =?utf-8?B?Njh2SVRGZm1wNThkWitXUXhRR3lhM1RaeGNheGNKQ2g5OWVKUzdCVTJlOGtG?=
 =?utf-8?B?MnFTSTdhVWV3VnNTWVV5dGNJcUdSV2d4aDZKT1RmYnp5M1RBWENvM0pxZU5v?=
 =?utf-8?B?MlJJdnFXa0VyQTQvWHpIejhwaFd3Z0dkcldIMUxnVXlTZzc1Rm1GbUxKN0VU?=
 =?utf-8?B?emNOcG14RHJpYW55V0V5Nk9NU0N4ektwUEhQVGJENjFVMDZTQjZWNTA1QUtY?=
 =?utf-8?B?U0djd3Q0U1JTYk5MS1c4QzVjeUo5ZzFrT0ZpcnZDekhjZHpwa3BOYzlISVh0?=
 =?utf-8?B?WUM4Ry9vYkVHc3Rya1NSU040cllNNUtidmtzc2NvbGJBZFR1Y3hYaUlTT1FL?=
 =?utf-8?B?MUZNd0tBNStPS01RN1lJMURXai9DZlB0QllhRzhJYldWUUtNRzl5cjYySW1G?=
 =?utf-8?B?L016Y2txeDg5Mm9FQzRZUDZybDZxOERIUlN3a3FKWkRzbmRrYllHSkJsNUt2?=
 =?utf-8?B?RVQ3N0J6MkxLc0dvbysxNzVrTVFDWDlQMWplNXVQYnNZMDNxWjcyeEovUTZn?=
 =?utf-8?B?b0drMlcrZmR4THFaR1N2b3gvL3FIUHA1YTRCU0ZPUjg4dnNXTkEzNUlpbzZY?=
 =?utf-8?B?ZzBNUUw5ODFlY1JIQVNVbFVOVmpNaVRLN240Z2VudkQ3VllQWEllUHBPM0tL?=
 =?utf-8?B?ZGpUZXBhRHJ2TDZxNUZyNkJFNUtpZkFLZlNRZVVuajZvRHdHYXpwQ2MrWEpK?=
 =?utf-8?B?bklaM0R4S3I0a05aMldrV1F5Wlh4UXZ4TGR0SDVUZTJid0FQZFo3QWNCWkxL?=
 =?utf-8?B?NitScWQ2K1ZWUjFxZlNWL083NTlXLzF5TjFKc1UwRFpPUGhHZlVlWXZUcGZZ?=
 =?utf-8?B?eGFUdmQxSnUycFJ3aWZJdzNWN25zajVtT1hzV2REWkpuNkpwNDhYWHVhSEQ5?=
 =?utf-8?B?cmluZ1JnMVhva2FZRnBFM2JicS9Wb3BmNHBSQlN5TnQvRElVYThFSWgvWUJn?=
 =?utf-8?B?VDE5UDZsdmRqbGE5UG1BRzZQeE1rSUwySmowWEM2cnNTSmdHbzJtOXVZdS91?=
 =?utf-8?B?UTBVYm10MTZxZklWYXFKQ1AvZWVONUxvNWg2YWg2SE9JRXVjRmRZOE1EUUF2?=
 =?utf-8?B?dEQ5Sm5kSE5BMmwzY29zUDlTa213PT0=?=
X-OriginatorOrg: othermo.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7396b6b6-ef7c-4012-4d2c-08db341947a7
X-MS-Exchange-CrossTenant-AuthSource: DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 07:58:58.6864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 85b1b12b-9424-4d9d-b1a2-39f36faa8bc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNX2Sf8SQJBdqbpkGniEs2xRmyeh4m+l7ovoSnmGQZCPibwtz5xRSeizQumC6S0Y2A7HwhvecF5IK2bU3lSTZ5jfhD4DjFR4KfKvrPZdl6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P193MB2245
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S256yB4An3N36qa8CVg9yjetH5XHLezmo2/SM2AF120=;
 b=lTmL+YbY5WPS4vWtrgRxXzJZ3WLwiPVb/0gld2uNZSVX6f8dGMAf20zt3vsVqR0QLUWw96D+SAn5jzmDGvPEjHqvsVRzgHVONY2ST0nrrXuJUVi87VYNJCpuwrnFwx9S2wUqZRf+tzoyZlzGe/zu1k7ko+HElIX4HckOFwrxVv0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=othermo.de header.i=@othermo.de header.a=rsa-sha256
 header.s=selector1 header.b=lTmL+YbY
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=othermo.de;
Subject: Re: [Buildroot] [PATCH 2/2] package/python-pypa-build: bump to
 version 0.10.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDIuMDQuMjMgMjI6NDUsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KClsuLi5d
Cgo+PiAgIFBZVEhPTl9QWVBBX0JVSUxEX0xJQ0VOU0UgPSBNSVQKPj4gICBQWVRIT05fUFlQQV9C
VUlMRF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+PiAtUFlUSE9OX1BZUEFfQlVJTERfU0VUVVBf
VFlQRSA9IHNldHVwdG9vbHMKPj4gK1BZVEhPTl9QWVBBX0JVSUxEX1NFVFVQX1RZUEUgPSBmbGl0
LWJvb3RzdHJhcAo+PiAgIEhPU1RfUFlUSE9OX1BZUEFfQlVJTERfREVQRU5ERU5DSUVTID0gXAo+
PiAgICAgICBob3N0LXB5dGhvbi1wYWNrYWdpbmcgXAo+PiAtICAgIGhvc3QtcHl0aG9uLXBlcDUx
Nwo+Cj4gICBXaXRoIHRoaXMsIHRoZSBob3N0LW9ubHkgcHl0aG9uLXBlcDUxNyBpcyBubyBsb25n
ZXIgdXNlZCBieSBhbnl0aGluZywKPiBhbmQgSSBkb24ndCB0aGluayBpdCdzIGxpa2VseSB0aGF0
IGl0J3MgZ29pbmcgdG8gYmUgdXNlZCBhbnkgdGltZSBzb29uLAo+IHJpZ2h0PyBUaGVyZWZvcmUs
IHRoZSBwYWNrYWdlIHNob3VsZCBiZSByZW1vdmVkLiBJZiB5b3UgYWdyZWUsIGNhbiB5b3UKPiB0
YWtlIGNhcmUgb2YgdGhhdD8KClNlZW1zIGxpa2UgZXNzZW50aWFsbHkgcGVwNTE3ICh0aGUgcGFj
a2FnZSkgZ290IHJlbmFtZWQgdG8KcHlwcm9qZWN0LWhvb2tzIFsxXSwgc28geWVzLCByZW1vdmlu
ZyB0aGUgY29ycmVzcG9uZGluZyBCdWlsZHJvb3QKcGFja2FnZSBzb3VuZHMgc2Vuc2libGUuCgo+
Cj4gICBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgo+Cj4gICBSZWdhcmRzLAo+ICAgQXJub3V0
Cj4KPgoKQmVzdCwKTWFyY3VzCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL3B5cGEvcHlwcm9qZWN0
LWhvb2tzL2lzc3Vlcy8xMzYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCm90aGVy
bW8gR21iSCB8IFNpdHogZGVyIEdlc2VsbHNjaGFmdDogQWx6ZW5hdSB8IEFtdHNnZXJpY2h0IEFz
Y2hhZmZlbmJ1cmc6IEhSQiAxNDc4MyB8IFVTdC1JZE5yLjogREUzMTk5Nzc5NzggfCBHZXNjaMOk
ZnRzZsO8aHJ1bmc6IERyLiBEZW5uaXMgTWV0ei4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
