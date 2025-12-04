Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44355D1CDC0
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 03:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62B9E60E46;
	Thu,  4 Dec 2025 03:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_r66BLzQKq3; Thu,  4 Dec 2025 03:55:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0866560AD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764820519;
	bh=FGVKkdlCHAAAARi2Ouhg26m9VuQKUP8Id3lFfPPWEqY=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=HQpMxvQDUmAVCjUZ32EEmSW9GWxC80vhUvvb6HUrSKs3+jitDMMNve1Kjnlge10bM
	 bcbtrqDzV4g5H6nmfa9wJYjEJk6bkM5EsgfK+lakYhaNEmxNn82p5nu671j+0xmtEA
	 hxu7/gBhEW3Vh2bZBFD9kRa/gPNPH6EmBOK+iwHyP0c//+1cHRffGp8NjjCU13kpeN
	 UZyOn3Dav06HeSH8r8eTh5cfwbXAO0bN6P/hth9CJdCUoF8h9kPbuk6vKVipnOPY6B
	 zmLkGODOQg9wH4fZeuB2RP+ld61p03kp+du6qgB+3vDgIq+jbLEnrP6njaQO7TJBbf
	 5ULDVsYEyp3SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0866560AD2;
	Thu,  4 Dec 2025 03:55:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DBC08D3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 03:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8B9982356
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 03:55:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cWL-vQgISBCm for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 03:55:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c409::1;
 helo=ma0pr01cu009.outbound.protection.outlook.com;
 envelope-from=esakkiammal.murugan@iwave-global.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DFA2E82233
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFA2E82233
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c409::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFA2E82233
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 03:55:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HN+RbZbSmyWQ/1YD5i14DLrDG/r5Y+/6Kw4m81Z97y0Vo2AJHESuNGyhvtjbkACmqEAYhPUciAUz1oscw3JbHiyJMmWTMTNvY093V7E8FcrFqz+HEifFujqHknAP4huKcR68eEXsdPp3xghIq+ToReie+FltnSYLZof6uODuMvOkXm87hNmy1NR9rUGKuTyw/2nm01ArdjzcmCUUVjJGxML687V+yG1ASDSm6zR4Q926hOcS/fTBHytIGhU5OjLxpGgxxtdWFAFlyNJt8wLhVgsfzLM9Dk57eHmUolvzZpiG7CU4wATYRaE3+US/fbPjcQMzsu1wJs/L7o6EneLMYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLI66J28NecmmUHW/bj5sP2DsIbF3HK1KNrcAmEzOys=;
 b=TiF96zSFuT+/wgFbJAqlC6I26XTrn9w8nY8jTClkqDMA+Wco0F8kFsXUIlfAr8GAUJ7oKAE9NCISoI0cKsoLVfA/auXuBHxlEl+OoA78tLTJcre87W6T/A/RsEYF4waXybO0Y0Epq6gshYBmeFUhrNOTfRv5rb2dyfhv0hcfjW6tYKnIuwL0D35KnNfWLoTiNoCzUxV4vQzHcfbYMBx+5O0AT+FrvhnQ9maF8acGYMmzClCgdftVaQ7Llhmznoil/UL87srQjL7F1VpjDonecsVI8/RMx0s+zvxeGFJOG/Qr8BQySwCj5gfrCL8klRzBwgkzG1kG9iorSd5wmZzENA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iwave-global.com; dmarc=pass action=none
 header.from=iwave-global.com; dkim=pass header.d=iwave-global.com; arc=none
Received: from MA0P287MB2448.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:122::11)
 by PN0P287MB0409.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:122::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 03:55:07 +0000
Received: from MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 ([fe80::fafd:97ba:ad13:4c1e]) by MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 ([fe80::fafd:97ba:ad13:4c1e%5]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 03:55:07 +0000
Message-ID: <6ae83dec-c764-4916-8e37-c3d0e9e02a46@iwave-global.com>
Date: Thu, 4 Dec 2025 09:25:07 +0530
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <23d1f4ad-241a-4fe1-9db0-08bffa4775b6@iwave-global.com>
Content-Language: en-US
In-Reply-To: <23d1f4ad-241a-4fe1-9db0-08bffa4775b6@iwave-global.com>
X-ClientProxiedBy: MA5P287CA0227.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::8) To MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:122::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2448:EE_|PN0P287MB0409:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c66cc65-c72d-4373-ed32-08de32e8ea2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFh2b214dXR4a1BKNDFyV0U1ZC9FYUdUUFZyVStrRlh5NTQ0Y3Q0eGcrMjF0?=
 =?utf-8?B?bXhxZjVTN0FGdy82c1BnajZqbWwzdzdvQ1VrUzhncnJ6TE1lS2dnOXhsRGUr?=
 =?utf-8?B?eWJhc2YwN1o0dmlyL3JXSjArTGlKMElLWXlOQ2phelU5cFJ2NDc3cFM1ZXpV?=
 =?utf-8?B?NkxxNjJyMGpTYktZRVlFQ0FKRGtqcjFuNnRlSEJWc0oxdnVVUWpTREJ1RVRh?=
 =?utf-8?B?TncrREpWSStHbjZWem5kQWNzWmd4Qm1CdVBJUFdhMlJFWWlUTlB0dEVGOVlK?=
 =?utf-8?B?VWNrdjBLT056Ri9INUp0L2hsOUhUejc1b0VqaDZrQmxsTncwZjBFK1U2VGxH?=
 =?utf-8?B?N3lrVnkyUTV3N3VrcWNGWDkrOVZpclZ4V1B6SE9CZ3VNSDVmZ2pSeUVzcTQ4?=
 =?utf-8?B?aUI0U0xMdTFKWWVxL2htMnhvdkNQcVlqd2tMay90QWpoQ2ZGSDlOaFhWMVVa?=
 =?utf-8?B?aElMQVM3THFXdVBmb3Qva0M2akhxem1seTB6TXZhc2ltT1kwT29xejdxRXI5?=
 =?utf-8?B?TGhuSi9qam5RNitPV1k0WWd3bkplZWREK2dneE5BeDB0c2MxVno3UlNuaGpM?=
 =?utf-8?B?YzZWcWtraS9zc3lwRG5wMFFYRC9DTzZHZDQ3L0JpTE56L0VlRDVHbjdmeFh1?=
 =?utf-8?B?NlU5ZTdCV1JMKzZNcGJKSkRvM3g0WDkvcWpPeE1yZlQydHJLVXNWN3Voc0dC?=
 =?utf-8?B?ZVRBenptZll2LzF1WExPclFaQ1UwdDF5RWwxYndaeEtnN2xVNlU5NGM2cGw3?=
 =?utf-8?B?cFZpbGNZQXlsbFg5RHVJVFhKejcwbE1qNnBRdVdOSVlnaHFET0dUTmNmVnJR?=
 =?utf-8?B?blA3aHVGL3F5c1B4WmpqSUowdHhKTU91OHphU1FiNEZjTllkVkwxREgwRU5T?=
 =?utf-8?B?aU1lZTMreGJmM2pMWXVWU2w2RzYxOTRiZHNlTVY1QnM1c1Fyc0lDdGNqV0NQ?=
 =?utf-8?B?dWljNzNMZHVtRUxKRlQwV0ZyZ3JzYXh3L3VlbWgvUmoydVIyNU4xTE1ac3ps?=
 =?utf-8?B?L2h5S1l6UHFDdEhKcGwyNytpWlhaVnZ0OFhBQkJZUmtwQW1XN0dtZEEwb1JY?=
 =?utf-8?B?b1N2L2RSYjdMYndrRklWTzlCeGVpSVhRM0VLY3Frd3dWK3NoV0RYTWpYemx0?=
 =?utf-8?B?RXlteUpjU1FYK0lkbCs3Y2tuTkFpYzJ3MU1JNVQxZXBHbUIrZHZ4Y1IyYlFv?=
 =?utf-8?B?ZGxoWWpyeXk2NkVwMUJFWWhHODJXazd2RStFOXluZHNIR0lqZ1JVc0lSWjg5?=
 =?utf-8?B?U1BYTXpJMGoxT2VuNXBISmU4ekErYzE3bXdtZU5NcDl3Uk5FZ05CVWtFWGpR?=
 =?utf-8?B?NGZSVEhZNE9jdlc3Y3NVN3d0UGFKVWNnTTROYUxKb2I2QW1LaFQzNmJEVlFM?=
 =?utf-8?B?NlR5SnpnRzFITjVhV3FJbUgzSk03dkduMlltMmhpbXRmSncrcnU2QWFGa1VD?=
 =?utf-8?B?N1NNNlZObmEvdVJJZ3VJb3pkeW5WRmdFOWxNK2NvN0U0UmFrV0NtbjVkY3Vt?=
 =?utf-8?B?aUpXOVRJZ1VHa1JSMDdHVzRVdkFNa010cTVoTTZsT2pLSHRlc3pGdFBQTHlF?=
 =?utf-8?B?OU1pSzBkL0xqSWF2c0pZckJiTEx1K2JmVGdkejM2S3M5WlowRmExZElYSmxW?=
 =?utf-8?B?QnY5RXFUdUdZcThGTE5kazAzZk9TOUlJanFaYm12TUZLaFVjMnNoOTQxeXNi?=
 =?utf-8?B?K1BpODN0UHNUSmZSQW1RL1VqNWI0bGZ5ZXpwSUpqbVE4NVlaMTNpMERJbzJx?=
 =?utf-8?B?L2ViaFBOcUh2elFIRXpUSXZvNkJXTmZUdDh0MnlCVmtFZVFzUE96ajdMUjlG?=
 =?utf-8?B?SjN2aUhiWWJMRTNpUXROQXhZeHkwMHJSYnBNQVdkQ0FCRXFlcVVnTEI4VnpO?=
 =?utf-8?B?a0lzQ1FzM1F5QkUzY0srK0s3cGpRWUZvTUdtNW1XZ3hWREgyM21EblpHU3Uz?=
 =?utf-8?Q?G8K0OXYI2KRrlWEvfcLZQmPu7FQm+WMQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MA0P287MB2448.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emFUc1pxa1U3dllRenQ0ZTdlSzZZdnpoVTRmdVUrYXpGTTBWUFhtUXpJenpt?=
 =?utf-8?B?MjNOU3N5c01ITTh3Nk1ZSWJKc2RkRjE0a3ViOWl0WmUxeDlZUDNwWVV6cmdz?=
 =?utf-8?B?RzA0NFkvOE9lcWtncWVKZkNIdFFGMFVHbDhXUjVpdzgwSE1IUHhFQW1JYlpP?=
 =?utf-8?B?UGRnd2o5ejlUVnc1RHAzK0lpaitocDRaVVRUVFFpVEhBMGhSdXFJNzd3b0RE?=
 =?utf-8?B?Ulg0WjRZVkg5N0RVU0k0M05JaFBzdEtEeXNGek5jL2JUQko4d016eU10bytJ?=
 =?utf-8?B?RENaektxazNMS2t0ajNkWWtsOUhqRHNNMjJqRzN6SW5sTWlSL0w3VlZDTlZh?=
 =?utf-8?B?TVNPb25hVEFJTG8zdWtwdGN2dzBmS0JORGlRMTAxTUFEVG9JMVRJSjQ3MGEz?=
 =?utf-8?B?TS85QUJobi80MEljNkV2TEtIOEQ5bmhmRXZVYVo0OGNQcGVHZkYwdlA3VWlO?=
 =?utf-8?B?YUhsMy9pY1pucWI3T055WVlETFhhUUlkb2NBa2hIL0FQQUxyYkE5T1VFR1oz?=
 =?utf-8?B?SG40RlNIck1zQzBUYWszZWdmdjQrVWhMdC9YblFiRW9ReHdNRDNOMVVpY1N6?=
 =?utf-8?B?alI2NTQwc1pvUzNQcE9qR2JZdUFaNFVkQm9kcnZaYklraVV5UG44dFpiQ2VY?=
 =?utf-8?B?ME0wNklQcXZOQkx5dSszRDZXS1l4NXA4UWNJb1dIT0lYNFZrUVRxUTd2azVV?=
 =?utf-8?B?WllxQXVxZzVsWldPemlIQ2R6VlZRVVlJRUpMUDd4L3cvZm9qVVhIemIzV21C?=
 =?utf-8?B?QVBNYVZPUXBPSEZlWGtiOFA0ejExUjdFZnpyb3p0UVRZTWRlU3ArbzZrS3M4?=
 =?utf-8?B?YWFpM3JvV2ROZFN2VEcyNURCTloxcUlYYm9tVmlFVWVpNlR5dnJWYzJKQUpR?=
 =?utf-8?B?cUxHSmVxWS9lM3gvWG1WSEswNHlIejFMVWNGUUc4Qjk1b0ZnT0pKWWpiak9Z?=
 =?utf-8?B?MC9FSVpBVm8rL0UxSTJLUytMMmhDM2RrL3lWekd2Y1NBZS81QkJvZVEzM3Nv?=
 =?utf-8?B?OENQQ2hQbmY0MUR0UHJqdXg1alROVUl6TWE2am5yNU10OVRxUHRoS2FOQkUy?=
 =?utf-8?B?aFE1MnZ5UVhXcVR6YnRPUGVXSzlHSFdiakNYL3g0dUFrVnY5UnZGS25LelE4?=
 =?utf-8?B?Q2NVTWRsciszMnRSLzRCRmNhTTBzelJVaFgwMzZPM2pvSkZqWGRUL1VZckVM?=
 =?utf-8?B?MXZaUDAwdmdjZ2FNanRpTUxpYkRkM1pNc0ZUZHFoMk1mSllvbiswc0RWUm9p?=
 =?utf-8?B?RzNPZjB0UVNLWG56TnppajZUUHg1b1I2ai95bExTSVVIL2hZQWJBVXkzMzMv?=
 =?utf-8?B?R3h5Y2hkdmR4ZHkzUWU1Q0xlSnV0NEk3M1J0cEU1djc3elB3dW1FelpZRkMy?=
 =?utf-8?B?T1Y5MThsMHQ0VjRFcHN1M29HZ1phd0p0S1hXaGZaRlczQ2JzWXdDYTQ2V1Ex?=
 =?utf-8?B?b284S3plSU05SDgwKy9aN2o2NlV4ZGZRTWhyc1JrQ21MZXgvckNzazV5T1dG?=
 =?utf-8?B?aEdPMy9CKzB2OWEvaHR0YWZwK3RCRi84T0F1d2krUG4zVjhSZFBrNFNUZU5n?=
 =?utf-8?B?MjVkd2VvWEQwK25XOHRIck9oQ084RXFoSVFOODhjekVDVk1reXd0MlBYL1hL?=
 =?utf-8?B?aTZYVUk1MTE4M0NJZ3hMSFRQZXhQNjY3YUlPNWtKZWJiVjgyMzlvWEI1RWNH?=
 =?utf-8?B?ZlBValdhLzZQbjkzWmloQ1hyZ2ZTU3ZRaEpLSjRFamExVjI3VkFIdndhQlgy?=
 =?utf-8?B?SWhyTHp5SDIzejR3MEl5b080cHRoa1psR3NHWWhvSFNUQUlmSnB5bXI1OGRp?=
 =?utf-8?B?YVRQRVl0UHkwOHpGZWE4YVZGMEhGanpDL05jbkZRZjNFcFFjZlBjTXE5WTR4?=
 =?utf-8?B?RWdIN2ZWRys1cmUzWU9qb1ZaRGJPNThSaVQyQjVJbll2aGlvWkJzUHE4Nm5m?=
 =?utf-8?B?SVdjZDh0VzlDWVJuOHErUTFjZHZPR3BTZlRIbGZDQXdqbXZsdk1NQTZyeUZW?=
 =?utf-8?B?dFZLVnRIMUp5RkJqa3kvTVNsWFBBeFVlUHdTRHA0WElrUms5SlY2MmwzczRQ?=
 =?utf-8?B?QmNObmFBVEc1eEhPNWFOVXF3bUtDSm1tWXZnVWlpSXBHQkpza0lBUzI1djFV?=
 =?utf-8?B?eW9vaGoyOFFIYnRkenhLd0JCZithN0tDRmJ0N2xMNm5jUVRDY2NiUzR5VGgz?=
 =?utf-8?Q?SjBsQtzz7QJV4PGqHYGHwF8=3D?=
X-OriginatorOrg: iwave-global.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c66cc65-c72d-4373-ed32-08de32e8ea2a
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 03:55:07.6618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 507ae903-cc48-4d6e-bdb6-35278120a345
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uj49Q1Wz26hTDoTNIocLz23kI2U1cdYQhsgUxs2x/M5gMtlm9YoZW2Kssp79CtYf5EhAtVv2r1A9V1aa1PUTEDOx2MiE/1gQ/q53hI8Y3LOOXNBWjM2km7JlUpzUF0ik
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0409
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=iwave-global.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLI66J28NecmmUHW/bj5sP2DsIbF3HK1KNrcAmEzOys=;
 b=js30Wae8uvSz1Te3q8x+psATDBbRp91MO0OYvKfxZJffLhJbQtlladuhQl8NMI0c10/b5XLmBMXYPtqkZRJrq2RgtHrY6rfPEitYb56jYjqu5LIgQpIrVa/eNxKkyzHLIIpgt53ub4qMl12hjof06zFiAKfODw5AleloNt0+JxEJqQaaIlSgViQ7VIUX1wycx7ZojNJoZOXXwgGWkCNzlFGqolRUu4oBu1HLs84H4yHnN0a/26qJ7L0PUPc63ZTTph3mMBmFACs0v2WH8t+boHGwzKyxoeD/M8RGSQFPLLo4LYHxZhmCi/RSYKNnxPIeOe/Y7uYCDv8in8rr+hxNTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=iwave-global.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=iwave-global.com header.i=@iwave-global.com
 header.a=rsa-sha256 header.s=selector1 header.b=js30Wae8
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iwave-global.com;
Subject: Re: [Buildroot] Implementation Procedure for i.MX93 Custom Board
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
From: Esakkiammal M via buildroot <buildroot@buildroot.org>
Reply-To: Esakkiammal M <esakkiammal.murugan@iwave-global.com>
Content-Type: multipart/mixed; boundary="===============3011428879187438854=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3011428879187438854==
Content-Type: multipart/alternative;
 boundary="------------sy1z1PKYaRd1fj0uJsAF1Lio"
Content-Language: en-US

--------------sy1z1PKYaRd1fj0uJsAF1Lio
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have implemented support for our i.MX93 custom board by referring to 
the i.MX93 EVK configuration.

I used the freescale_imx93evk_defconfig, and the board is successfully 
booting into U-Boot. I have validated that the following interfaces are 
working in the kernel: eMMC, SD, USB, Ethernet, etc.

However, the following interfaces are not working in the kernel: Wi-Fi 
AP mode 5GHz, Bluetooth sink and source, Camera and Display GUI.

Kindly guide me on how to add the required packages in Buildroot for 
validating the above interfaces in the Buildroot user area.

Thanks & Regards,

Esakkiammal M


------------------------------------------------------------------------


On 14/10/25 17:43, Esakkiammal M wrote:
>
> Hello,
>
> I have implemented support for our i.MX93 custom board by referring to 
> the i.MX93 EVK configuration.
>
> I used the freescale_imx93evk_defconfig, and the board is successfully 
> booting into U-Boot. I have validated that the following interfaces 
> are working in the kernel: eMMC, SD, USB, and Ethernet.
>
> However, the following interfaces are not working in the kernel: 
> Wi-Fi, Bluetooth, Watchdog, SPI, CAN, Audio, Camera, and Display.
>
> U-Boot and kernel have already been validated using the Yocto root 
> filesystem, so the U-Boot and kernel configurations are confirmed to 
> be proper.
>
> Kindly guide me on how to add the required packages in Buildroot for 
> validating the above interfaces (Wi-Fi, BT, Wdog, SPI, CAN, Audio, 
> Camera, and Display) in the Buildroot user area.
>
> Thanks & Regards,
>
> Esakkiammal M
>
> ------------------------------------------------------------------------
>
>
--------------sy1z1PKYaRd1fj0uJsAF1Lio
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><span data-teams="true">Hello,<br>
        <br>
        I have implemented support for our i.MX93 custom board by
        referring to the i.MX93 EVK configuration.<br>
        <br>
        I used the freescale_imx93evk_defconfig, and the board is
        successfully booting into U-Boot. I have validated that the
        following interfaces are working in the kernel: eMMC, SD, USB,
        Ethernet, etc.<br>
        <br>
        However, the following interfaces are not working in the kernel:
        Wi-Fi AP mode 5GHz, Bluetooth sink and source, Camera and
        Display GUI.<br>
        <br>
        Kindly guide me on how to add the required packages in Buildroot
        for validating the above interfaces in the Buildroot user area.<br>
        <br>
        Thanks &amp; Regards,<br>
      </span> </p>
    <p><span data-teams="true">Esakkiammal M</span></p>
    <p><br>
    </p>
    <hr width="100%" size="2">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 14/10/25 17:43, Esakkiammal M wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:23d1f4ad-241a-4fe1-9db0-08bffa4775b6@iwave-global.com">
      
      <span data-teams="true"><br>
        Hello,<br>
        <br>
        I have implemented support for our i.MX93 custom board by
        referring to the i.MX93 EVK configuration.<br>
        <br>
        I used the freescale_imx93evk_defconfig, and the board is
        successfully booting into U-Boot. I have validated that the
        following interfaces are working in the kernel: eMMC, SD, USB,
        and Ethernet.<br>
        <br>
        However, the following interfaces are not working in the kernel:
        Wi-Fi, Bluetooth, Watchdog, SPI, CAN, Audio, Camera, and
        Display.<br>
        <br>
        U-Boot and kernel have already been validated using the Yocto
        root filesystem, so the U-Boot and kernel configurations are
        confirmed to be proper.<br>
        <br>
        Kindly guide me on how to add the required packages in Buildroot
        for validating the above interfaces (Wi-Fi, BT, Wdog, SPI, CAN,
        Audio, Camera, and Display) in the Buildroot user area.<br>
        <br>
        Thanks &amp; Regards,<br>
      </span>
      <p><span data-teams="true">Esakkiammal M</span></p>
      <p><span data-teams="true"></span></p>
      <hr width="100%" size="2">
      <p><span data-teams="true"><br>
        </span></p>
    </blockquote>
  </body>
</html>

--------------sy1z1PKYaRd1fj0uJsAF1Lio--

--===============3011428879187438854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3011428879187438854==--
