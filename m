Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EDCC00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 19:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A8364074E;
	Tue,  2 Aug 2022 19:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A8364074E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jvqhl5GUgqWu; Tue,  2 Aug 2022 19:47:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D6ED402FE;
	Tue,  2 Aug 2022 19:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D6ED402FE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB5C81BF400
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 19:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9274D8177A
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 19:47:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9274D8177A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KDCTVUxH-2XV for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 19:47:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F75681776
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2099.outbound.protection.outlook.com [40.107.223.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F75681776
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 19:47:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSjA0XPBKDSlV4N3+pyDCN9UB7Ks2z+Cr3YOOqzankwJX5hWq4slgnRL2yHVfEoSRHG1nUj4e1lO+w1MMajq6RWgto6r3bwqBW9OzCpxgNTAVCWvCgy7XJ526qYD0y/Ot71s5wiWPbbzH0ee7UYZRDFUpjn245be5inlWgv90XBFRLOYYBsJ6It6TXKk7K0YHuWyVHlH02BlJkmXmHlLxb8g9IKgfjdRvOiNB+l2tPUwf4fex8gIYqd29L2FIG2OxgXaUoOsljA7xL59KdBWkswkaOvlsHHut37mhaxcPsVRO+ugu4+kSJHdMHHCr5b6MHfFk3o8/A1Zyhf3QRkn5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWlRpUHbLq8gt9ZOqpVMSi774DqbIrOI+b1UGC2SQMA=;
 b=h53hKIvRsTMVZRJ+DMyKjqhq4U/kiaDkDdkSB1BuHgI1B/lpAofb+XxzAv4LP58OmYG/+4HlG9YQkdINVaiPrJ4qsty1dgIxWpHx+2RdaMG4QamVivDE+mCnQsvmh6IaeMTyPT1MvLrpBgAY/zXs3EWi6F1w5zgt5NMo2H/bMaqkbQSdi6J/L2MYVmI4jSXuJRHTgX0zRuhDNVvR0jQ6+LQXKWDN/MhoEZ9kLKNF4GAPZoB8a3AfDH7qlVCgwA37G9+pv8vSybIMLueMDt79YOJKNI9bBpgNcTNDu8Ey2e5VCIzl6Pw6M+ROuQYcR81/6TlMUfeK7LkZN5v/XD1p5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by BYAPR17MB2615.namprd17.prod.outlook.com (2603:10b6:a03:8c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 19:47:10 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f%3]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 19:47:10 +0000
Message-ID: <8083b9ea-a0e4-6682-b43f-65a5ad0d2737@phobosdpl.com>
Date: Tue, 2 Aug 2022 14:47:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Sen Hastings <sen@phobosdpl.com>
References: <76c8fcd6-d477-7cbe-dcc5-b382d65f3498@phobosdpl.com>
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <76c8fcd6-d477-7cbe-dcc5-b382d65f3498@phobosdpl.com>
X-ClientProxiedBy: SN6PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:805:de::25) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a44aca5-bc19-4ab0-a16b-08da74bfc9c0
X-MS-TrafficTypeDiagnostic: BYAPR17MB2615:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7BMnKFZCzQ38pTD/7RdUBqhdsw+hGWLLTurm3kYo5lzRhUUldKKzEWsJUulbX0rviK4piIqXmzStexwpz6TJOVzhYtWvEgekiPgIPgvrlNMHznjdIUmr8E6VdShr/n0EUF0IkKBYT3bO6237sVKmvNidzQKqrS/iZT+fO2wyWKisaNUQcfDizpxgvPYPKxHnWRyoPDtEcaTK9RGoKqvDqXlo3PfksXwPIQWcn57jELjxfEXfvM/vU8n47f8BjxSms66dhaMsXW6qUcK+eeTtLM65NB2NIRU4jGQtEb90pV1wkWcxA8dnJ6XIZCCHSg7xmKNIGIvqvEYizl3MpasRSUW/g06nchnbiU8BPVzcVS+WIGQ2/Lr6L1BeCWdxSTi3fheR15TLp7j/ldzYrzF1/cHYQqurd4TWnu/MQhJzXriIJzndnLdzx6D7ylfleT8f1PHzZ1AyfQemJ5ApzfTR8uJyOcSn/eRHFSMMqbxPFAZnR7N1Yfc32SbsRD6B4NgmCUGA3jGCfT4Yup+OMnB6RQiRQHt0B5rNKHL/2qAb9NdMm7Jh/8I3TMxMfNPDAnQrANH8LDME47sBcRdzGBpM3MbXl1lfvSDmrR4fJoe/SkhPnVh6JtNivG+gYdDMYRbR6nuCwjvzhti9vvTW4PU+69KS3BvjCVU2qvZKtKcq0ODQH+6epJHfrRmzr/fPo3KfiW2mgrvjSBaudZ+bQ325EMxQji+c4qs8lr92hS50PqJHS/5ArrqL2hNZ8qvmDE4IRNX2HjwI3L8KHcBS6JDafb5yzED9nlmJ3KpPdRnarWnb1qGz02W/01fn2jlWFLSAlEUlkrbMqlcCywYBu7KyBbtd+dEv7wBpnSB3romlro2w7L48SoG+SqHOpOLXj+v4fYpiRQPHfe+sRZh8FnZl5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(39830400003)(366004)(136003)(376002)(83380400001)(66946007)(3450700001)(66556008)(2906002)(2616005)(186003)(5660300002)(8676002)(4326008)(36756003)(66476007)(8936002)(31686004)(316002)(966005)(6486002)(26005)(6512007)(53546011)(6916009)(41300700001)(31696002)(86362001)(52116002)(478600001)(6506007)(38350700002)(66574015)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THlVT2lqSDZRMUZhWlFhM2Y1VkpzUEN2UmVXSGgxZ3hGbDlMS2RUa1RERE95?=
 =?utf-8?B?d0pubzBPMDVydlRtYnJyUGN3dGo4MUxaTyttcEJ0THhtRnBSVUZyVk1Ea01R?=
 =?utf-8?B?VXJ6SU4rNFRtNHgyanAvQ0preFdITVVZWmFlL0RJZDQyTjI5ZlZ5WWJ6ckhj?=
 =?utf-8?B?Q3ZxYlNyYzQvWWVuUXF3NS96TDZoVnlNVkoveUloNVlYb1BJZDMyYmNlOGxY?=
 =?utf-8?B?dGFYdEZkUVkwU0lRdzV0aGZONnpmUlA0YkFuZW5nRUhEbDFZZjJpNnFtWWFp?=
 =?utf-8?B?a0VqY3pHNHpIK3R4QXpCK1lPUmFUZUg5SFVFQjFGU0VFNHppZGpGTFl5dGx5?=
 =?utf-8?B?bEgrT1ZBMTZTcmt5QnFic3dxQmRHOStZVWJEcXBDWGF0bWZBcTNQR28wNzZa?=
 =?utf-8?B?eUFoSURQQjFyWEl1TjlvY25XQWFQZ3JOUTgxNjQ5MXEwOGJSS2xFUXZTTFlD?=
 =?utf-8?B?TDl1Z0JZS0dRTmljcklEUzlKU0p2azlIbkg0MEk5U2Fkb1dLd0VsNGc2QzAy?=
 =?utf-8?B?ZkJsWDJZVm5lY0Frd1FwclYwSm5meDhhS25RMGxYcmZiUDYwN1lCWHFIYTc3?=
 =?utf-8?B?YTJZaHIxYTVncDJ0RDY3NVViUkVkODI4TnY3bTkrNDM0RFlNdGhCT0NyWmIx?=
 =?utf-8?B?RlUwRWFwcEhJdDVINEJHbkY5d1hYWU03K3ZqWmxqTGh4VUpPVnplTzNWQmxB?=
 =?utf-8?B?UWxudDRhOHlxOXpFM2ZDNjcxVVNQT0RvbTFYVnA1RFRzSE9tNGp2bkZmazlv?=
 =?utf-8?B?L0RKam5taHh6eXF6eFdBUEtFL1NnODNBWDAxbTlOWG4zSk95bUFVd1pKdUhE?=
 =?utf-8?B?UG5EZWlueDgzM2huTitJd01uQ1V0bXdSd20reWQ4YUQxOVpYU0NmMmhZMU41?=
 =?utf-8?B?cVIzenZCcnZEZFd2VnhLbUtBYUlDeWZtaTI0RFZTeWVXdk54OGxxQmRxS0FX?=
 =?utf-8?B?WkdWRVptUkFsaGdsOGhydSt6ZmVxdVZWdUkwWEZLczBMU2wwSXIvcGxhbEt4?=
 =?utf-8?B?U2RsU3lKYjBXeXRNU2pGSlNKZloyL1Aza1BsQURLR0VPRVlxVloxOFl4VnNl?=
 =?utf-8?B?ay9ZR09GN1RqTFdHSXZubitsNkQ5K0gydEhoSUl1dlZ6dWl2bVREUXk1NWU4?=
 =?utf-8?B?Sk52aFpVb2tCQTB5SWM2VW1qVXdMNjhsVllwWGJPQkd3TmVycmNHenNlZjVs?=
 =?utf-8?B?TE1nT0dFTnlBT1RYbEY4TE5lNTlka1l6VUJFVmhHSnl0Mmp6dHNrUldMUFpu?=
 =?utf-8?B?UVpuR3hCUDJ6citFeDJOWGE0RkpDN0ZNMWx2SEQ2aWtzRmNCUmFLSlNySGUz?=
 =?utf-8?B?WWVYdWxLaUJ5Qjk5OFY5SDQvQ0tIUHhkSjRic002UVdoNDhOZXl1aXg0UHJ0?=
 =?utf-8?B?OHNrZTBXUllnVTE2ZktoUHlhYyszdjZkTEJrLzZGY3Z2ZUNVeGxXM1d6WWdp?=
 =?utf-8?B?MXVVVjBpYmExbUx4VmZQSW81U0V0a2hrUURhZXpBdnVPTVc0VXY2SEJGaGZE?=
 =?utf-8?B?ZEhtNk9WcGlSbGhUaXVmYm51eFg5TlJZcmlVL25UR2VkU09LNU5MRVFzWVBj?=
 =?utf-8?B?UDY0c05jZldxYXNEeVMwR3RTSkpvOVB6OXRkeE5yVkRXZ2xFRXJ6RnQxaUll?=
 =?utf-8?B?WTFQRnhMTFV3dkRhc25oQ3oxYUp5c2o1eEJNRnh5UFpYRjV2eEk3YzZVRHZK?=
 =?utf-8?B?U1ZYdnlZcFJmMG1qRkVKNGFMa0VWblJ0NnlDWUluL2JwbHd4ejdHTkRDWUFC?=
 =?utf-8?B?WlNIN2E5T2t6eW4vSXNXTzZqeXdQYkJnS3R4akUvTEk3QUVFdi9uc29KMklm?=
 =?utf-8?B?eU1SQm53RVBwQ2IzRjJMZDNJRGFzb3NxdHZZSmRsbGhqZGxqY0MyT1lBdFJx?=
 =?utf-8?B?cXo4bGtZNC83dEtOUXpsWkZPU05MQnFHd2M0MGhuNU9ZNEJwUm1IVFdoVHVw?=
 =?utf-8?B?dEQ1Nk5wcmlyYnNNaU9FZ3pkR1Z6cTZpakNxYldMa1E2MVMwbVlNb1laWEdJ?=
 =?utf-8?B?S1RHd0ZOb3B0bVN4RE9mdVpwd2I5NE4xTkJJaUlleUpIQngrbWFHNERZUkoz?=
 =?utf-8?B?aEdXQVZiaXBkNlUwdlBzK3FxZmVmck9oQkJheENVZlhHU3NIV0lCTU8vRTB1?=
 =?utf-8?Q?cIC59CUFPFlqZ8YO7xWHZo0ao?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a44aca5-bc19-4ab0-a16b-08da74bfc9c0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 19:47:10.0016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KnSywY60NZrHjm8wQ7O1/2Bs2IyZJprkX0BipliQWYd1hNRIb/ggB91upjmsPF04NiVvCCbIOJ7HSMiRdvQ/vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR17MB2615
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWlRpUHbLq8gt9ZOqpVMSi774DqbIrOI+b1UGC2SQMA=;
 b=lk3BnsrIvWEiJdBFIhQBso+JWRL3inaReI/igLO4Bm29syWbp+ImVPsqDF5it3QXGS1SKwdHb+kCQIfsYlnwTztWCEBBN/w5sEsQqu+NCC1mAGO7kJm2cVlSEEHQdYABV95GjQV8c0rYuGicCVVmMUI1fhIB+uydlsoQ8C86HUA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=lk3BnsrI
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: Re: [Buildroot] [PATCH 2/3] support/scripts/pkg-stats: adjust
 column widths
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
Reply-To: Sen Hastings <sen@phobosdpl.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/1/22 12:04, Thomas Petazzoni wrote:
> On Thu, 28 Jul 2022 18:23:56 -0500
> Sen Hastings <sen@phobosdpl.com> wrote:
> 
>> This adjusts the column widths, mostly for asthetics/legibility.
>>
>> It is primarily for chrome based browsers, which like to
>> linebreak on explicit hyphens, meaning every CVE takes multiple lines.
>>
>> see: https://github.com/w3c/csswg-drafts/issues/3434
>>
>> Signed-off-by: Sen Hastings <sen@phobosdpl.com>
> 
> This doesn't behave extremely well here as it prevents wrapping of the
> package .mk file path in the first column, making this first column
> larger than it was. I guess wrapping on "/" would be ideally for this
> first column.
> 
> Here the table continues to exceed the width of my large browser window
> (with or without this patch), which is not very nice :-/
> 
Yeah, I noticed that even with the older sortable based versions of
pkg-stats.html. It appears to be caused by the extremely long formatted
string binding WFN for ssdp-responder:

"cpe:2.3:a:simple_service_discovery_protocol_responder_project:simple_service_discovery_protocol_responder:1.8:*:*:*:*:*:*:*"

In order to get that cell narrower we would need to either do line
wrapping or horizontal scrolling. As an example for line wrapping,
the <wbr> element could be inserted between vendor and product.

something like:
<code>cpe:2.3:part:vendor<wbr>product:version:update:edition:language:sw_edition:target_sw:target_hw:other</code>


The good news is that this does not actually introduce any new
characters (newline or otherwise) into the rendered text.

Any thoughts?

Sen H.
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
