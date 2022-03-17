Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE01C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 16:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCDDB60BC3;
	Thu, 17 Mar 2022 16:41:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ASdWsFZN-gKn; Thu, 17 Mar 2022 16:41:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EA2560B9D;
	Thu, 17 Mar 2022 16:41:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C16AB1BF27C
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 16:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD69340116
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 16:40:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zP_SBZH2LeWh for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 16:40:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::610])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74DE340017
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 16:40:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QCr4DFEqHqUS8p2k7Pqc83iKOI5CqXG8Cjz3vFDzeHnotheg/CY88HXFrXI8Bv208dijiPfWKOO1naWMBaHPAljrr+PUx+as5HO15EezF2EBGapWZ6i/Uym/WVYCm7OTVhgKLraKfCCYoddUaM895HYJu7I6NFESNfzr/Woj0/tX3RCg2qvsmySjMnUZgKtE21fP7nkEh/Es152JZksUzPYCjv+Hfo2bpZ/Cqiz20jItVytH7xENaJPLTPke7jv38EfDpErBN1usEB+UvM0eE9KdSGo+mFdWDA98p0s3hiVpHiOT7jPABSPrw1v/qtxbro4uwNYe1WxeQPi6wczSWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KR2edWiA+SSNgydPFf353TaVQCBzF+ise7JO1rlc+XY=;
 b=SWrqa92cmKTfDX/9FT13Hj7Nw56jFJ945kirNT9KlPL0tfc5uv4uawf7On+mct7xwPFFpYS3G+oxCZ4P5GMJ6NNA1FpD+friHah95IDm0c+b6h2wPSHiAERXolO0xKI6Lull5zarr8W3SadGQeaUtimLjkPlJ1SnwgRUoKXeFF6C6uXRi8am6BWXSmO5HVcPfuhd9M2zSPh48OjzvKXRHPpSkpJ4ugKF3uPfKG/GlqEg3b+1rmaSTgtowPE3nyM8d0cRFKfhHDGhfm5wH8wpvXS5VFs4rJ5Bb/D6knvzl/gAlzsxBUNuemEkHTydW2tCc01jGXagemmmkSr5V3g2yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KR2edWiA+SSNgydPFf353TaVQCBzF+ise7JO1rlc+XY=;
 b=TKnqDm0qrzUWWmNmRzZyLQHU1ULWG3o3nHSHqVwjEjxfge3/8XgEngMuOt/jsrCFPrviLXMu0ZGtYfSvUVY+9xN03fKHeQ6aRCOgzq3ozq8+Ft1I6IaIZYpQqBbVzGZ1qMU7igYqR+xrh/dzpkl0VkFW1Xonl/hpwu71MnVuN7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM5PR0401MB2676.eurprd04.prod.outlook.com (2603:10a6:203:2f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 16:40:54 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391%6]) with mapi id 15.20.5081.016; Thu, 17 Mar 2022
 16:40:54 +0000
Message-ID: <008dcac4-aa59-0311-9e86-fef7bc80cdca@theobroma-systems.com>
Date: Thu, 17 Mar 2022 17:40:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Peter Seiderer <ps.report@gmx.net>, Arnout Vandecappelle <arnout@mind.be>
References: <20220309142913.2102898-1-foss+buildroot@0leil.net>
 <e47e01eb-0992-20ba-130e-f53df351c1c9@mind.be>
 <20220310215914.3d26c317@gmx.net>
 <639cd3a7-bcdc-4720-e587-bc22b431bb2e@theobroma-systems.com>
In-Reply-To: <639cd3a7-bcdc-4720-e587-bc22b431bb2e@theobroma-systems.com>
X-ClientProxiedBy: VI1P194CA0003.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:be::13) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ab5efee-80a0-4ad5-b114-08da0834e76a
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2676:EE_
X-Microsoft-Antispam-PRVS: <AM5PR0401MB2676E5B86FA256A7028A5EE4C2129@AM5PR0401MB2676.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2KNCgJ/+VTvVt+o9QvWBlYjJ7aQUnJltYuxqSTxridgLdyfEbZbzvskXBbmHcL/vjPhvd+pRbiZYXdJxHa4MHjo3uk+BKH8PXgxCleUyVwQszjWLhQKh3uVF+ur6didrTaSD/VzjJyAwVtIeShhiPJnznexIK7FrCcKRTTTU5yZMksb24Q7FYVdxiM/IBoY7aVFDvt9GyEAh9z9E8i5VIkj7DHD/MVUPTgO+c154JKs+4x/c9yB2rcOG/zrqys1b28Lxcf8R80Rm0ovR38+DPfypZUZFfmq5BS/6MXy/anHauNMqROQEVIecxZp4M/xxHuJGLAFmbeK87xmeDl0dGxsxZRaKq5Sw/GOkmjk5wZhWCUkvuJzwtdE/lMRWF+Tgh/W7qR2Ktoiq34rNcxdnQ3MhvaJndTxDj9STxBbcQ4p7Qg8ksIBP+0W+8PvtTJ7shWr9UizKccMqGwbMwfgAtvBWl+xEjwjiyTgZ5ECy+KKZdwk6Pik3oif1ZhkXIAuRvn1U7gChHgle0a9BI9ybqva+iOvRr/QntX28Iwulsb5flM3DxA5SE9r7GSyavwtAvostGAkqsx0s1rHqtiydFMOSbhGlaOa1yeatGeR1K9IpeQCoeiC3PE50qefpPMQ0tRvWm7yK1icaKexKUGhUX+lJKGWLIYHQDCsXg/LUSdVhFNy0PrP7UhlmTcEOZVMdKrzL2j8sJMzZYlLND0lyp3YYs7d1z+Qlx73QFo4/7dENJFSHX/3xhQZa2dbze4fPZvsv5aGQhVhhRWIcainYfl0wgrv9jAwE1GTRPBt8tpkhYlt4fK6wqMEOLIb/IHPfRKqDmA005H6jlN+JgSx1zg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9367.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(86362001)(31696002)(66556008)(8676002)(110136005)(54906003)(66946007)(66476007)(6666004)(4326008)(558084003)(6506007)(6512007)(36756003)(508600001)(966005)(6486002)(186003)(38100700002)(2616005)(8936002)(31686004)(44832011)(2906002)(5660300002)(45980500001)(43740500002)(15302535012);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFowbEVFWkNsSVErQjRCYlg2ZDRnQmpuMUhGaHo0dkllMHFrRURLUm43SGwr?=
 =?utf-8?B?RlRmNWxEY0xJZ2NQZDVqNzA5Z2NuQTBVdEk4TU1qWDZJcVpTRGl4L2NISHJl?=
 =?utf-8?B?YVkzRlRKWWMvODJUVmRnRzhnUDdvK0owNmE4Z2pqOUt1QXUwNHNqT1E0OE4r?=
 =?utf-8?B?S2FCd0NoVTB4bFV2d3ZzNkNENWVRSWY2ZW1tUjlqMUs5dXh4anZmSGZBTjFK?=
 =?utf-8?B?N1p0MjJvVkhsUkczdDZPVnBUbnluLzdHdHd1YmNjdlA4QXpsenVua1A2bnIw?=
 =?utf-8?B?WUJUMDljYVJDOUNaZzFyRTNIWjBvcUpXb3JydDFEZys3VnVqd3l4cVlaNnZY?=
 =?utf-8?B?OWRicWdvNDlqVU54OUt6RHdKNDIxbWcxM1NTTFVNNGtYZVY4ZEVnWXZYdS9F?=
 =?utf-8?B?bkYvV2FIZk1pa1BWM2w4N3ByZ0lya0U3REhyaEdaeSt6RWs4R2w5QXVLbEIv?=
 =?utf-8?B?MlU3TS9QYjMzUXdnWlp3Sk5WRDVHd2RNazB2UEtaamtlRGpOY0podExLTllh?=
 =?utf-8?B?dlc4aFVOVEdHR1oxeXczaUt0LzArZ2UvVFRBTnNhZjVJQVF2N3J2Y1VvR0lT?=
 =?utf-8?B?WWt4SDFyR0RPTkZvRTlCMFllRW05ZUtFRGU0MUlPRjZHSjNQS29yMEVPb2Z4?=
 =?utf-8?B?dEdLWEh6ZTVlS1NocXV5SExsY0Q1dS9qUkhZak9qZ3hnSkJyLzZMY3B4UUFp?=
 =?utf-8?B?QnNxVFJCRE1rRkhEU2xwMmF2WTBlWTJIRHJrK2UydXUvbTZWRkhhKzI2VUlW?=
 =?utf-8?B?MEZNYmZDZWV5d1ZmR3VZNksvWmxqdVlRSnR6K2VtOUJMcXY3NlNicllBT1RY?=
 =?utf-8?B?S0prdHB1NDJIMys2NTZUSHdYSXJXQSsxVTFhYmhoVThDU0dGNHpMeVJ4cjQz?=
 =?utf-8?B?RTF4eDAxbXdTTjlwYkxqOEpzWGkveVN0bnpZYXJPNHdYaWFZd1FDUXpZU2NY?=
 =?utf-8?B?eDdQT1FSMkROMEQ1UVFVSlpMcjRYdHBIeGNNbURVZURESXNJNkp3WnBXVC9V?=
 =?utf-8?B?OWFRMjhXL1NWM0RHVUl1a091TWk4ZFlJcGtOKzJaajJ0Z2daV0Z1UDBJS2k0?=
 =?utf-8?B?RzNTNkJHN3VVdlViWmFwVGpnNEdGTzF0Y2xOWUhhTzhDazkxbHMyRkdMS3Fo?=
 =?utf-8?B?V2ZlZkFkazcxU0NHeUNGYTlTWVgwQ3JJTTh0K20wK1o2MEZLQ1FuQjJ4RmZ5?=
 =?utf-8?B?UEpybXRqSGxZK1NmNi9VRFlJc2dlTGVnaUtZTHhZS0U5T2hUclkrYnJBUjIv?=
 =?utf-8?B?V1hQNDBoYTQ0ZkVTUm04Z1FHRmJ4eDNMaTRraXVyVzZmTHVTVXFVR1lZWllD?=
 =?utf-8?B?NWp4djd2SXY3MEpXRFVQVUtuSXdsZDVPTmRtaUtBWUdjK2xmd2x2bERWa0JI?=
 =?utf-8?B?OUpOY05ZNExsQ1plSitvWENjUVdEMXA1bzJBTnhGOFI4c0FFVVQzUXZqS3N5?=
 =?utf-8?B?WmpJSXJxcElKTW1hRndmZUMrY2VHcUpuaThnK1BxRlBuSytXOUFzSmRmUXJa?=
 =?utf-8?B?SGRGWGpvTUhPZU5VdCtkYUMzT2dkS3hkbFFJM3RaUU9CbHlNMmhlcW1lcnVQ?=
 =?utf-8?B?ZWlVcHNtdGl2YllmTEExK1ZpRzlsNldyQW1IbmtxOWdzOVJSeHFIMTVNNUdh?=
 =?utf-8?B?MXZtVXBPVkV6Z1YrRkRUT3NONU03ZWlpMXh0a1R6VWhEdTdLNDNrVTNuay96?=
 =?utf-8?B?ZkhDbFd3RjZoOWwzY3VQOStmY0F6d0ltYjdJbE84Q2w1UVpUNFEyY1JieDYz?=
 =?utf-8?B?Wk9uU1c4RGkvMnFObGdBckpQL2VMcy9HcVZsUUM3MkhkQjM2R0FmdldRQWdS?=
 =?utf-8?B?MlY3Rkd5elFnOXhRb3JQVFVIcnVmOUxSQ1ZlMzJjUU9zTW0rWnNmZmVtUmVj?=
 =?utf-8?B?dXoyWElIa2sxd2tEcTBRVVEyOXFnc1YvbldFNTBlMkJzZ21LS253UDdxYTJz?=
 =?utf-8?B?ZE1sNFBTRjNsYzdqUnNpMTg1QXQ5NG02K1ZiQnQ1bnZ2U2xmejd2ZUpJbVJi?=
 =?utf-8?B?TUlrUHlzWUlHWXZnSzZiN084dDlEUkVkcXkrNlVXc3crUGNpRk5QeHlSTmlo?=
 =?utf-8?B?Snc2czl4dWZxN2hyV2loaHpLMFEvOVMyakg1UT09?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab5efee-80a0-4ad5-b114-08da0834e76a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 16:40:54.2071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46EXJsWyIMpkrFNOE4V68bIV6J91au3t9HP9ZHguafUdiXZSQGrsRgyvJABx0y6ERAVcPwqhKDVIYr6dN3sZapwG7TjmnpFt/jfZYm7/LoX8rzdIWP84z/MEvIXWTVQF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2676
Subject: Re: [Buildroot] [PATCH] package/qt5/qt5base: fix CVE-2022-25255
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
Cc: Quentin Schulz <foss+buildroot@0leil.net>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Please ignore this patch because it is superseded by:
http://lists.busybox.net/pipermail/buildroot/2022-March/638898.html

Thanks,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
