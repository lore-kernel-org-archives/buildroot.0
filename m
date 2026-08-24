Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D72C5DF94
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 12:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26A7D40692;
	Mon, 24 Aug 2026 12:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGVWZXK-lCGz; Mon, 24 Aug 2026 12:41:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787575292;
	bh=kTQhYEi6HW7jURCwOncpS8hz9BJgBp1ir2jtP+LosnE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ogvCfxR1BAJVe8FFshGQ9vgJY7PqeU14HUFzC5EBu2+S0ubuHfX2w/XwGqlMwLtjO
	 9hEPdLa4LGL5yuRVpofcen9Hm7LLZXLejLX9EMtt+IO2f+QGCgm2GfUAc95omlGzmo
	 6E/I9iechWK3iAUks7A56rWo7EVuk9ltqK77VtSxei0V3KFNS+O1dCMg8dztKzsdsu
	 2zRiSvucirtN8TIGMupiKIGnhCm1TQU8YsfnNyTwKdCcmp0isTNNQK+FF4ilqo8mdi
	 Brh5PYnLGVP/RIuoa4mxK/V14htqpJ8rauOcILefoT4Ut2dW7fyIJ1RFAXcgF6mRKA
	 WaIXe6BuvzTHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5A7D40633;
	Mon, 24 Aug 2026 12:41:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AD8341A
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 12:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40DB140633
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 12:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wCNMwDzAEkxY for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 12:41:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10c::1;
 helo=sa9pr02cu001.outbound.protection.outlook.com;
 envelope-from=stewart.hildebrand@amd.com; receiver=<UNKNOWN> 
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10c::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C4CD40555
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 12:41:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5LzuFCQcSlXXIHka3VN9IJFiL0bUmMOfKFpsbilE6NYWVYkHu5/iQXa4APqxUv/oDpiqR0pNmeqhyv6uRQSPBa/7Fo1Bwt+7RMfl5ONPrf1JQt9bGS0rGosKglz/tqsV5qnNaey1Vsa2jn8xJWKHQPR01g3LeVvwVgjRWhxeazrZKLV4AyUlMcvwQzNlzsAt2KOwtdxz8whHP72OMVLky/eL/dm+sNcVcECkp/2EFOg5iPuc8boL21K/CnUAIQmTTYD1EGtLtxnNipWON7L1in7USmBr4q0A+KY2UfsjFnWIEJlxIIHfxC5UixiJf4YonGDuxngwwaekCU5C3dmyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Y6H32sZlVpJWvIeouDSPugmGTIR+QyJ5rB4WURVXRM=;
 b=BljPeCfGJuvgvF6xM3wI9kS0RYxOqo3oeJw5kP+gXkvPlIXKgINqOGK5L3KjjWyPG6OjSxFE7retF83q/UOPZMl07XgLQRAbjh6TEdOEbzzBx7utYgCiwPB28JSQICNYnDorqVO/84bDSRzB0Y84lpgvko0xjpT86g1Xb8ot1NNk+z5MJWLGSEDpLKJ3Uubw75TycgBJVMBIpm6sWgTioOVV34g41nntSr+ESCYbOilXvMHDnmvN7kyzox889TVePCNO/noabgokNMgBHDQJDxQIVa+u9udj1ZNLMb9EB6fZtOcXr/BqZhoi+xvfwk7VfaBnhk/lhFrLLaZgKA+eiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM4PR12MB6472.namprd12.prod.outlook.com (2603:10b6:8:bc::7) by
 IA1PR12MB6019.namprd12.prod.outlook.com (2603:10b6:208:3d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Mon, 24 Aug
 2026 12:41:22 +0000
Received: from DM4PR12MB6472.namprd12.prod.outlook.com
 ([fe80::4a4d:4208:3862:fb7a]) by DM4PR12MB6472.namprd12.prod.outlook.com
 ([fe80::4a4d:4208:3862:fb7a%6]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 12:41:22 +0000
Message-ID: <a880e3e6-f71f-45f4-aab9-9f434a65f9d0@amd.com>
Date: Mon, 24 Aug 2026 14:41:17 +0200
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Cc: alistair@alistair23.me, stefano.stabellini@amd.com,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 micheal.saleab@amd.com, yann.morin@orange.com, matthew.l.weber3@boeing.com,
 Matthew Weber <mathew.l.weber3@boeing.com>, brandon.maier@collins.com,
 john.ernberg@actia.se, brian.j.wood2@boeing.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
References: <20260803145152.102135-1-neal.frager@amd.com>
 <20260803145152.102135-2-neal.frager@amd.com>
Content-Language: en-US
In-Reply-To: <20260803145152.102135-2-neal.frager@amd.com>
X-ClientProxiedBy: CPCP307CA0001.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::11)
 To DM4PR12MB6472.namprd12.prod.outlook.com
 (2603:10b6:8:bc::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6472:EE_|IA1PR12MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: c786601c-d333-48ad-062a-08df01dd00ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|7416014|376014|56012099006|10067099003|22082099003|18002099003|4143699003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info: t34AxqqHc9q533OTGh0lOFlcvkwVi+8zADmj8OHvfEKrN7YPZGqb7wg3XpxMskOzEyEMWUm2uFsZrCVCWKVd463ymxblS1POtLMf3U7bwaBkmxHBsDBfEnIuGDquFEh1rQ014QGMXnWj5bcdgYPkLjKv1nhB76s63EuQI//kPtmhx7FLAQsxmxwQH5w+qEnYqZveJjLtRPsiuecP07OWlBGvapYx+4PoDXfhUWLmGZ4FvxA5TI+c2ffOBPtos8Vv7VEV+hRqz27Em+4f8VCUBHXc58yh5r+IdG4PPMLylVN+r1MEH5Mv+LcUxUAALUznu311zUagxh2qhet2/J29QYz3/dqHPxoY6e24G5rdgONftwNqDFyhTKmfQAa3iDIUzPDYvI/zonUKKFYi62pihqkU6JedqIM67myZNBrbo1BsQ2ze7u2/ycIPnHBBFtEUTFGiqNAJzvagpGknl5eE+8hvPSMUfLop8LKugGcHoXVs05A2utjJbFx3uWsFXmS0ddLYSLBxjdrQ44CPm3c7zRo8MW4BPmDWGu7dI3sJKsvCALMAMrxxKHhQGRPoLne5AgKRQeehe7HYSLxYJ48qBqD8Fl6Fq69SedAu50Hq6Nox7fzOVOetWWzeSGEgQjkOqe6G8hazSvZZE9dcGwXWgcuLXE8+nSutC8NLRoeffVG1xkQ4HG99y8N2f/yyl09t/AOHopeUlyJ0iAkGWR6BirAr9ty+ty1ozaj8e72mx5w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6472.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(56012099006)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjRNN3lSK1NPZ29OZlVxVUQwaWlKQXJtOGFZbkpZN3Q4UjFhQ3BaYzAwcWM5?=
 =?utf-8?B?eDFhYnZrUzhEUGo3UUFWNURGcjRFN2dlTzByd1AzeFZJSGMxVXB2bU95S2xi?=
 =?utf-8?B?R2NwSlAyejR5WmJNTXlmUDBrSXJxSThNME4zc0Qva0xCR045SlUxWG9QY09k?=
 =?utf-8?B?VlN5ZGZNcEFXamhxeGlKZUFBQU1ESlJlazZEc3REalhBWGc0UG9sUWJrelpT?=
 =?utf-8?B?dXpaSEJIckxFc1pzcE9WQy9Ec0RycnMvd1FReTVvTUVIR25XMXYwQjRjWGsz?=
 =?utf-8?B?dVJ5QXpTNWExemhjSnZGUXRNV0VUODlpZ096ai9qWGZhUUhQK3B5amJVNlg0?=
 =?utf-8?B?clJOZCtZR2lKMExHQWtpZWZvdlIwaFZYdUJ4MmZKSjlET201MVNtZXNWWVBq?=
 =?utf-8?B?Q3hXckVkSFgybzBqNEVCTHdXTTBQa3JUcTVNTzA5MjRWSDEyNE9GT3d2MlpD?=
 =?utf-8?B?KzVBbVNUcTlJTlNUWW5NS2pyRnFNczhQSi8xTzVucEt5MmtZcm9EQTFuakRU?=
 =?utf-8?B?R1QzTnRGSXJzS1JtVzJwOUcrQnlzb2lkc2xTS2p1KzJvbWlYUk8rbXorMG0w?=
 =?utf-8?B?L210TXloRDF1RFFGaUp4UXNmWTE4YjVuUUttQTExcWZCUmdocmVxaXRnd3pW?=
 =?utf-8?B?eUJMeEdSTkJlUktRUXEvTUYvbm1xa2FDSVdvY0dieVFTUzNrVTRDRjFGbk1h?=
 =?utf-8?B?a0NvRHltL3lNY3h3YkxQTStGdGlqT0tvdVpIekhPQ3YxaXEwWWg5ZDdXeTlk?=
 =?utf-8?B?THNrUnk1MVJDRjNRRDFYUHQ1RTZ0T2dKcGJVMlgxK2RkWlAxNHBSMnlqbmN6?=
 =?utf-8?B?enR5a0dkZ3VYckRyVjhtQjhmb2JiWkVuNGNiR1NvRGpVNC90YnRLREV6bVJw?=
 =?utf-8?B?c2xha2xwRHFUcW0xRElqMTliUXpXQ05XeTJEUWU3ejhmZkZuMGNuNVlrWGxE?=
 =?utf-8?B?V1k4RHdoVmxOMWsrc2tRNUJlM0lsZmpXME1NMDI4Y3FEUzlvNC9EaUFpTXc1?=
 =?utf-8?B?Q1RHYjc0Vk10WXk5SktDVnlFMXBFcWtJTlVtRS9XQmFlUG9aNXlEcnJSRmhV?=
 =?utf-8?B?MVB4MDlXaWhEZWxBaE55Sm9BaVNlSnUwQlRjK3FHcTMzODhoanF4TlRWT0lE?=
 =?utf-8?B?R1F3RHdBL2tYaXVWbVJvcmcwbElXQ3ozVnM1YVhyWFBFTEZ5ckROK001R1hB?=
 =?utf-8?B?WkZTSXM0SmZWVWE3VlBhdWZDeUkxUkFxUHdVMndvT2hZNWZ5ZmFkaFljalpU?=
 =?utf-8?B?dXd6VTBVRzFJU2tpdC9ZUnNzSENPcTRKT0lrMjlOamZuSG92TXcwQUREV1FH?=
 =?utf-8?B?Rkx2cmFhakxjSUdFY1ROMDVkQlRyRlhlMmE1cDR4SW9abWJUMjhBWklIZys5?=
 =?utf-8?B?NlVFQlIxdVJaN25ROFZhQWhpa0xLRTV6U2MyUGNTY0tkMTU4Q1dXaXBtRzBL?=
 =?utf-8?B?UDA2SUZTMjA0NTM2cU1NeHFCTDlGcml0WVhZUzQ3d3czYU1hV0NOampGWENa?=
 =?utf-8?B?MS9tSzlsQmI4Z3ZnUkMrQjRvcnpCRGlTSWlOV1hubGtlbnRRQXJHLzVpa1BJ?=
 =?utf-8?B?M0Z2Qzc4eXJBbE9IV21WczcxcnFnaXdVaXp5bm1mM28rN2JUanhGL055L0lS?=
 =?utf-8?B?Q3I1cWJCTHNGNjUzdWZ0R2gwZ0FnbXk0MHRRcDJwcitWeDFzTDUxREdrT3FD?=
 =?utf-8?B?Z1ByRVMzNWMyRHBiaGdtWkdGQzUybGdLV0d6eEFhbm1yZkt0NmV0WlFzTXZO?=
 =?utf-8?B?bmVCWkVOMEtQKzliSkNPMWZuczV2VFZ1ajZXNEh1NVMxLzVrdW5wM2toQWZw?=
 =?utf-8?B?NGV4Sk9LUEJ1V0hud09EeFVEaHFLVDZwMFFQb1I2OS9heGdYMm1jODJLYVFT?=
 =?utf-8?B?OTh1TTIvclgyQWd1aHdvaXpNeTB0WUxuUm9vbk9seHhPT3hRN2lsaGpsSXNM?=
 =?utf-8?B?dFZJalF6YXYvVkQ3RUZHM096SGdtUXMzRTBDbFQ2SWxvL3pCU2ZUWGJINElR?=
 =?utf-8?B?THNnYzgwTGpsZ2NNc20zYVVOSXZ3RTlEbTd2ekkvMFVBcXo4c2FydDMyblIx?=
 =?utf-8?B?OFZIQU5wTFhnejVyc1FraHViR1VFeGpIcDYxamVQNDhza29mdFdjMFBnVEox?=
 =?utf-8?B?RWRWRGhXTG5xR2M3bXJ0eUF1c3VyVDVKWTI1dXNrMjBlbFpIQjdCblhDbnJt?=
 =?utf-8?B?ci9TZi9LbTltSjVkd3lhNHZNdmcwM2p5Y2FIK3hRUXdjeThGeGUvdVFnMXdo?=
 =?utf-8?B?YmpkWUdDcjRRWG5PQlpGSnlQaGFCci9CNVc3SlIyRVdza2VQbW0wSWZXVzN5?=
 =?utf-8?Q?GBDg4CspQ45ji5PlJQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c786601c-d333-48ad-062a-08df01dd00ad
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6472.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 12:41:22.2443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XmFYzpVqXu6951BvyQzEEsBrxr1J5ic9KVpd08MGEFbvMyMPXuq1nmmjewYVzC9ZUPs0JeAoa70Rlsmj0kNL6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6019
Subject: Re: [Buildroot] [PATCH v4 2/4] package/xen: add custom version
 support
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
From: Stewart Hildebrand via buildroot <buildroot@buildroot.org>
Reply-To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/3/26 16:51, Neal Frager via buildroot wrote:
> Add the ability to configure specific Xen versions while leaving the default
> version unchanged to avoid breaking any builds already using Xen 4.21.1.
> 
> To test:
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
> BR2_PACKAGE_XEN=y

Nit: perhaps mention how to test the custom version feature? E.g.:
BR2_PACKAGE_XEN_CUSTOM_VERSION=y
BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE="4.22.0"

> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> Tested-by: Matthew Weber <mathew.l.weber3@boeing.com>
> Prior test details: https://gist.github.com/matthew-l-weber/c17f14a3793ccee440a383e4177ff3db
> Reviewed-by: John Ernberg <john.ernberg@actia.se>
With or without the commit message adjustment:
Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
