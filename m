Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F833C87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 13:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C26141B5D;
	Wed,  6 Aug 2025 13:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNkLLGCafdWz; Wed,  6 Aug 2025 13:53:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0A5F41B83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0A5F41B83;
	Wed,  6 Aug 2025 13:53:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08DAB31
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 13:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05DC941B83
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 13:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T03Y3Vjo4lW2 for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 13:53:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::629;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4DE1841288
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DE1841288
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DE1841288
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 13:53:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fq/hoxeUGd1+eakWuFC0A/LkbHGtHMsdkExzUhJXQZFoZBsjR37CohMPwLhqRVBnbg6r9Ap9TPGE03xYWuZ/QR1MFbcfOBXEcuwIF6KnP0diIp7DcN0xb3V7J2YezMzuEn0OM0An0V1WqHNb+P/scvkB7LIfthjg2kanInO37nSx4rmAnJF/4pl35C/LaEi0CBtyvOjKjgsHkE2SSXWaXJricOqveGAn+qifyqmbCMgNLWBDjhikAvExVw+qjgUDiCQJJRpRFSu8kasch+uzojeSIsKe/FvHj0jeukoiOvzF/rJNG28gV0S8Y6hyUC2fATr/VV0JekWrCPyvqaz9bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=up06jMq0llF4sfTaBdnXkhCm/tOkJRIybZsj14ruHOg=;
 b=P2qK9Ig1OeIh5Zb0bJQekHqrrxfntl6QitecyIuDpfVNMI/hvhEGfaOxptc2zaZNQTeIm3Okq3QyRJ181uL1vYinL97lqojCpWmBe+lMUm7BB3ih8larW6Tmgbts2Wb2WJ5Jfd/WzG+B5UpbyG+eQNi8ncHSyFBUwnTFX2+owYOHp5QctvO4ovi7W8QW/JH/Aef+gXAgIDFximX+4Lnh5n/odXUoHJ1b1YF4MdFs8lSdxlq0FbtBylScRkd7tGFYh4n2p0clFskzkYNp2LNy7mqWBA7Yi9fEt/T95wjZ2GHmcJCDfpERHPBBqkk1gYbDhRV9RMjcXHAS2PV+3ggQuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from PH7PR12MB5595.namprd12.prod.outlook.com (2603:10b6:510:135::20)
 by CYYPR12MB8924.namprd12.prod.outlook.com (2603:10b6:930:bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Wed, 6 Aug
 2025 13:53:42 +0000
Received: from PH7PR12MB5595.namprd12.prod.outlook.com
 ([fe80::6c0:e416:3955:9ea0]) by PH7PR12MB5595.namprd12.prod.outlook.com
 ([fe80::6c0:e416:3955:9ea0%3]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 13:53:42 +0000
To: Jesse T <mr.bossman075@gmail.com>
Thread-Topic: [PATCH] package/gcc-bare-metal: Add extra options to bare-metal
 gcc
Thread-Index: AQHcBbKW9PEPJxZleUm6cXoKKAF5yrRTbFBwgACdhgCAAZpDcA==
Date: Wed, 6 Aug 2025 13:53:42 +0000
Message-ID: <PH7PR12MB55951AFABE5FC0E3245B250BF02DA@PH7PR12MB5595.namprd12.prod.outlook.com>
References: <20250805024222.247903-1-Mr.Bossman075@gmail.com>
 <SA1PR12MB5615FCBAADC904C28ECC3D36F022A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <CAJFTR8QFBJO4yd_AW+rcEJPcme_M6dbrOWFwaFNUp_b8AcsECQ@mail.gmail.com>
In-Reply-To: <CAJFTR8QFBJO4yd_AW+rcEJPcme_M6dbrOWFwaFNUp_b8AcsECQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-06T13:41:01.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5595:EE_|CYYPR12MB8924:EE_
x-ms-office365-filtering-correlation-id: b87950a5-5c03-4a15-2ba1-08ddd4f0a777
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?QmJLaGswcTY4aVRCdVU1OXFvOGdJM2dKUXdaSjFqZzIvUmtBL3lVU29tdkNK?=
 =?utf-8?B?RGwyeDY2d0trQ09BU0Z5ZDVLNWZJOEVSR2dQUmU5cmZ2THNJbXhBamd4aVB2?=
 =?utf-8?B?WVFOTVhsSkp2WDg4V0R6VVoyTW1IRkdLbStrVzhLb3pCblVGdEZzRXRUSTJ5?=
 =?utf-8?B?RWRMTUp6WjM2bnV3SXNJTFFIeVBpYkc5TmJFOC9uOGZ6WWZlU1Z0bmRveUl2?=
 =?utf-8?B?ZTJqK3U3V29HQ0FvTnFlSWxEYkNoWFV1MmlvT0J1VFFnYzRFZFFLZnFjMGxy?=
 =?utf-8?B?a21SQmlxdlRwYmxFVXd0L1dFMGlPckFHcHJlV2xzalYrWEZYcHBIcTUyVVhm?=
 =?utf-8?B?VmN5Zkx0Zk85K3hqN2NYd3EzQmdJaWxWdWlaaXVaa0lBdys0elFJaHYwbmZs?=
 =?utf-8?B?WVJIYWxkSUl4WE5xUE9CV2JEam1jSnU5eTVzWkV1UG4zTVhVQmp5ZVFZWlFh?=
 =?utf-8?B?cWk0bGxLYTdJMzNYSWVmRE9wZkFVSTBhdTA3SXluRnQzMW1SSGREaVJDaEx6?=
 =?utf-8?B?ek51ZUxrZ2ZoK3hwU3lXbmRHSWpKYjY4OTd3ZXZ0Mi9DZ3Q1RzBWdERmS1l6?=
 =?utf-8?B?dHVvWENLTUJ6MlM1am1ZdzJhM1BsNXdHVlpySzFpMk5KRU91TDFYSFdERHdK?=
 =?utf-8?B?SGE5MFZ2T2plRUNjcGg0bGhCYVdtbFg5dU5BSWQvczVtd1B4UXZYcFlldk5w?=
 =?utf-8?B?NCs1S0R6Q0VoZFhUZGhVdzNHb1NZVG5oZ0tRbmtuSndwVndReGF5ajJvUXlK?=
 =?utf-8?B?V2dLV0xySDJ6NVBHQ1pSbW5Ha3BFdm5zRFNQY3ZOZUcrQUtDK2NpNXd3WnVR?=
 =?utf-8?B?OUNJTTNTV2dBRVRjUm16UW11eDJPWndIRm0rS3RZaHFGVDVtd2JpYjBFSGRy?=
 =?utf-8?B?UXUzNmpJUlZjbUlScGo4WjRKYkdrdEJTanVqNStZNnNlbnNFejhiY29oL2hW?=
 =?utf-8?B?bEgwc0Z3MnE1dHoyMFJoNU5iSVdlaWZZMGRLRnFtc0JLektXeWl4clgvcDF5?=
 =?utf-8?B?NHZhWmNyaUJqS0xJazRpSHdVbi92NXNMN1JUcUw4dXRNd1ZHaFVKTUxiZmJp?=
 =?utf-8?B?bDhvc1FjL3FEV1R4b0FMa1VhZGJSZnhIYmZZbmw1K1ZFY0IxbjdqVmFLd1or?=
 =?utf-8?B?ZnVBcGo0UlVzRjdLM1pTcnoxVWl2K3BwemtRSStUb25CUXpxMHlKVERXQjFW?=
 =?utf-8?B?SEVPZmRFVWtPelVBMEtoeVV2NVFWUkFXbGJZdk5oMmhjZkl6N2ZRa0NydC9P?=
 =?utf-8?B?cXp6a1VGWktpQVZKR0YyVEpNQ051UkxkN0ozQ25tUGZSNjc5V2ZSMnVmVmtG?=
 =?utf-8?B?ZWlMU29sZ1hXZjZVaTlYMkI4dWdiQVlxTVRES3l5VXNTZlVnMVNvb3g5UmZO?=
 =?utf-8?B?OVpsQjlpbnRjcFM0VFZTV1QxNUdqcTJ5RFBXTFd4b0JyckpFNTNQZ1RoR0Ex?=
 =?utf-8?B?UGVhRXBYeWFaU0pBM3BQRDF5NSswUGJmU0FiTnZGSGlhYXZYNlU0T2tWdklM?=
 =?utf-8?B?ZVhyTVB3b1JGOUxBa2hqL0pPZEVKVnAvWDJPNmppa05tRzdnNUpXcGliaXhs?=
 =?utf-8?B?dCtpUzJGR1c2RGhoeVBJVzZRdmhPL3RkRWhTNFhkdnl1eDFsTVZyaEllY0M0?=
 =?utf-8?B?b3dYTi9abGpNSEdLdjUrVGtKTnNEZENOaWUveU93V0c1MzBFeWQ4TU85K2ta?=
 =?utf-8?B?Y0ZLY3RDUW1ZMGZucEFFMDhTK1p2RkVidlJOMUNheHdPU1h0b1A5TnBQTW4v?=
 =?utf-8?B?SkFmV0E3d0U1VUgya3FvaEhrbUl5cTY3QzJjWVFRcnZqbEU1YUlzQnNGUURR?=
 =?utf-8?B?QVlnWDVDbTdOS2Vua0dCQlpkOWVhb3RwNnBwZC9EVFp2VWVBWlEyOW5XUXZK?=
 =?utf-8?B?WjY4a0wyMDlzRkZkaTBkTmxCcWpEenFnZFJYU0JEb3VCZkRDbVlJTjdwLzQz?=
 =?utf-8?B?a0NGZU1WSVRGTmRmMDh3cDMxbFZWV2IzdVZ4TThwcjdmanNqaDA0a1NnK1ll?=
 =?utf-8?B?U3VyS001RkZDY2hNbXVKSktzdGIvWk14aE1INC90dTJNbmxXTmpNTHNQSTNp?=
 =?utf-8?Q?grXTp7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5595.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2hleUZWQS9RbW1JREwwUHpycU4yVTE2U21lYno0dHVvMkxVYlgxbzZ5VmlD?=
 =?utf-8?B?NnEyQ0dpSkV3K2ZPVmJBQzJVclBKMHhJdkxHek1FT0VraUJ3bEI2aUtqTlJ2?=
 =?utf-8?B?UlRISW4vdElMc1BrUkNxSWRhajh0RWdKZTVrcHFoSHZGQmNRcVMxbkJ1RnJ2?=
 =?utf-8?B?Mko0eXp6aWJ4N3hLNkM4QXBtTHJvZTZtVUloOTYzdDBnci93SkVhd1VqcTZG?=
 =?utf-8?B?aDRSUHdNZEtmK0JtWEVJa25OWUd6aXVvTktoWlFib3pnT09OL3pyU1BwTWo0?=
 =?utf-8?B?Z2RNSTFINUQvZm5uMHpBWmdPUTBwUkZSUHk2cW5WK29yWDF2OTg5Q3J0L1A0?=
 =?utf-8?B?VHlSVm9wYlRkR0lnY21mWUs0RHFaa2twSGhFOE10ZzVrNzQ1NXNJa2tiM1pP?=
 =?utf-8?B?Z245SUlUR3NGTlNsaEVPVHI3L3B3K2hGeWNYR2M1RTlqN1F6S1Y0dU00RzVt?=
 =?utf-8?B?UUczSzBRZXUyUHBtVll2WCtKbGIyamtaVFJyejZaUVhkenR0NWpyU3NOSVlE?=
 =?utf-8?B?bDFoNm14ZWJOcUJmN29pYWErZHJ0SXlqRld0clRtOEZIZ0RxOUZIRDA1ZXY0?=
 =?utf-8?B?anZ6MnJwOUEyMXZuQW1pYlRLZU50WkxOVWw0dUdDL0dhM0JqOW9aZmFYOUdP?=
 =?utf-8?B?UGlRTXZkR1plQWZYaWVBZFRnaXEveEVBcVMzZk4rdDAxQ3R6TlNQeTRJV01W?=
 =?utf-8?B?a0c2cGxOYlJUSElHZW5kNSt6Q3I5eEdIQ2doNFBscE4rOUVoVnowQjFEQlNq?=
 =?utf-8?B?b2ZVWVFDc2dsbGNkOWRNdWE5bW5tWHpjVjRHUWFrZWFWZEd0amt6dWRGOFc1?=
 =?utf-8?B?UWJqRVIzd2RKWkFMa0M4aGRpS1BHRzI1YkV5NVh4dlhhRVBZcUxCSWxUNkMz?=
 =?utf-8?B?VEZBM2tBQWdOZlZ4NjlGWWZvT2wzeXMvMU5FWGM1MVBzMkRmK1p0Z3d0OVZz?=
 =?utf-8?B?M2ErR3BPbStscGtubXhObjM0bWVReXp5emo1YXNMZjBRTG1ZSEtmVGh4RU9o?=
 =?utf-8?B?U1AvR3VCbDdjbTdIZlpKejM5Ri9KbDJCV2lQaU51T25SQVVyR1RyOTRmK2Z2?=
 =?utf-8?B?bGFZYjllSVJFdFgwb2NJS1BEQlBhRnMyTjNVV05jcHZzMzBsazIxNVlLbTl1?=
 =?utf-8?B?cms3SFYzc001VnpCNkowZ0J3YVkzVStvd3MxeWhqMzNrUzcxZ3E1T1lwZXZ2?=
 =?utf-8?B?WFpOQmEyR3huelYxVW1Bc1h5UFZodkIxMnpwdHBGU2x5WTcyWGtFQ0RLREtH?=
 =?utf-8?B?bGxMY3laRzRqR3Fyb1RUOEZSOGZlTGRpcmp1UVlONFhwWXFXa1hna202dVY4?=
 =?utf-8?B?bHZxN2ExYTQvR2gwVFhUYnB5M1ZGekdKY3NjaHFxa0R4NjlJWVdSWldielQ2?=
 =?utf-8?B?ejdoZEUvZVJZYkE4cWVVNlUxSFJHcmRndnpBS3ZkZ3pnRWc5dXk1dVJwcnhl?=
 =?utf-8?B?U2NwNmNjOUI5V3U4OU9ROGF1MFNFZndQWDZzOEtVQStiUm1lOEY1YzlxNU9V?=
 =?utf-8?B?aVNvRlhuWW4xaW1IbEpqZHFZbVVGR2dKb0FJWUZKTUxlcmRyNEtaOWZvQ2x0?=
 =?utf-8?B?WjVOQldCQ0I4T2x5TXU2aTdNdUJrNjM2aDUycS9zdnNvSXRqLzV3bWRUYjht?=
 =?utf-8?B?ajl1YXJXQmhFMUErYWZLZ3dscGZBWGh0Ymw2TkpMQXRUMzc5a1RqZFpoaVBr?=
 =?utf-8?B?eTdDYi81WnZ0eWdxSmdtR292UHRyODJ0SjNVKzFqdkdpYXFWb0JFbUpPc0tx?=
 =?utf-8?B?OTBWVE9COGptdXF3NXdRaGZLbkVaR0E3OFpRMU5pYm5TQ2huZmIzaFFJQXdZ?=
 =?utf-8?B?LzlXWEdDVlozcUFGRnY3MUZId0VhaUt4OUVSS0xKc3NSaHorYkZyREFHU0Fz?=
 =?utf-8?B?RGIvSnRUbkpYdlByOTU0YUVTZWFUb21tSisvamdqOU5yWTdZblU2Z3R2UkY3?=
 =?utf-8?B?VlZNL3h2NTV2SWRCSWtaS3VyQTgyVjVXcHlsZVdmWlVTaGhJNWpLMjFqWnRh?=
 =?utf-8?B?RTlBaHRQNFBHYTNSZFFDR0RlU3BTNUFNSC9BQTdRZUJjVjFVUWhaVU8ycmxS?=
 =?utf-8?B?cjVtL25GZ0YvYnBMRGcxclh3U0NTTDNpazA2V2xGTGc0RDc4M1pMQjdqemNw?=
 =?utf-8?Q?v3Vc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5595.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b87950a5-5c03-4a15-2ba1-08ddd4f0a777
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 13:53:42.2730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7lhie8JFiBD5EadTNQRsVKUZ5brRf7O3RpnEmmsvfYLD4+MFklRzmXtGXRWJCpTQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8924
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=up06jMq0llF4sfTaBdnXkhCm/tOkJRIybZsj14ruHOg=;
 b=ucIhy18vCqv5qbaMGcKEAs5AFm2qCo1E8ziJPvYUgzBTnLMX6ceae4Mx5Jmeweg46TMlX+wgV3nF8VG7Vqqsj44AMEXZAclCflj0OlCoAsKENIeWJWa0mtT8p7IVCzr08rDjQ+z5puGEwPZ1ua6hVci+nVguqmrDYyShPwVkCHk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ucIhy18v
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH] package/gcc-bare-metal: Add extra options
 to bare-metal gcc
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Jesse,

>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Hi Jesse,
>
> > Users may want to add extra options to the bare-metal gcc
> > configuration, such as a default abi. Add a new option to
> > allow this, similar to the existing one for the regular gcc.
>
> > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>
> Thank you for contributing to the bare-metal toolchain!
>
> Regarding the default abi option, I just have two questions about that.
>
> 1. If you change the gcc default abi option, doesn't the newlib abi option
> also need to change?

> I could not figure out how to set the default ABI that newlib uses
> without setting multilib.
> The solution I found was to set the ABI on gcc with `--with-abi=` like
> the other toolchains do.
> This does change the ABI that newlib uses, without the need for multilib.

Thanks for verifying this. I think it is ok to have extra config options,
including a different abi from the default. You may want to add a note in the
help that since the extra options are applied to all arch tuples defined in
the list, only options that will work with all the tuples should be used. If
an arch specific option needs to be added, such as an arch specific abi,
only one tuple should be in the toolchain-bare-metal-buildroot tuples list.

>
> 2. The abi names are different from arch to arch, so if we have a string of
> bare-metal toolchains, this option will not work because a valid abi for one
> arch will be invalid for another.  If you only need this config for the
> default abi, could my multilib patch below be a solution for you?

> Yes, it does solve my problem, though it significantly increases the
> compile time.

Yes, I know. On my side, I need the enable multilib option because the xilinx
versal-gen2 family will need two bare-metal toolchains, riscv32 and
microblaze. Since I also need to configure the riscv32 abi for this case, I
need to be able to enable multilib, so that I can also build a microblaze
bare-metal toolchain.

> The problem that I encountered is that the default ABI for riscv32 is
> ilp32d, so newlib uses that ABI even though my CPU doesn't have
> floating point support. I was going to send a patch to set the default
> ABI, ARCH, etc to match that of the target, but as you mentioned, for
> multiple or differing architectures or ABIs that wouldn't work.

I am ok with adding both your gcc-bare-metal extra config option and
the enable-multilib option. I see why having both would be beneficial for
different use cases.

>
> https://patchwork.ozlabs.org/project/buildroot/patch/20250619154811.936265-1-neal.frager@amd.com/
>
> > ---
> > package/gcc-bare-metal/gcc-bare-metal.mk           | 3 ++-
> > toolchain/toolchain-bare-metal-buildroot/Config.in | 8 ++++++++
> > 2 files changed, 10 insertions(+), 1 deletion(-)
>
> > diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
> > index 17232a8ef1..e7290a11bf 100644
> > --- a/package/gcc-bare-metal/gcc-bare-metal.mk
> > +++ b/package/gcc-bare-metal/gcc-bare-metal.mk
> > @@ -53,7 +53,8 @@ HOST_GCC_BARE_METAL_CONF_OPTS = \
> >       --with-gmp=$(HOST_DIR) \
> >       --with-mpc=$(HOST_DIR) \
> >       --with-mpfr=$(HOST_DIR) \
> > -     --with-isl=$(HOST_DIR)
> > +     --with-isl=$(HOST_DIR) \
> > +     $(call qstrip,$(BR2_EXTRA_GCC_BARE_METAL_CONF_OPTIONS))
>
> > define HOST_GCC_BARE_METAL_CONFIGURE_CMDS
> >       $(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
> > diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
> > index 19c97410c6..89b0a98fdd 100644
> > --- a/toolchain/toolchain-bare-metal-buildroot/Config.in
> > +++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
> > @@ -12,6 +12,14 @@ config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
> >         metal toolchain, use the following definition:
> >         "microblazeel-buildroot-elf riscv32-buildroot-elf"
>
> > +config BR2_EXTRA_GCC_BARE_METAL_CONF_OPTIONS
>
> I believe the naming convention should be:
> BR2_HOST_GCC_BARE_METAL_EXTRA_CONF_OPTIONS
>
> This way all options have format BR2_<package_name>_<option_name>.
>
> Also, since this option is specific to gcc-bare-metal and not the other
> packages included by toolchain-bare-metal-buildroot, I think this option
> would belong in a new file called:
> ../package/gcc-bare-metal/Config.in.host
>
> instead of:
>  ..toolchain/toolchain-bare-metal-buildroot/Config.in

> Ok, will send V2 wasn't sure about these two issues, as the built-in
> toolchain does
> it like this, not the typical format.

I see what you mean. Maybe one of the maintainers could explain the history on
that? I guess the issue is once the config is created, it needs to be
supported basically forever...

In any case, a gcc-bare-metal specific config should be in the
package/gcc-bare-metal/Config.in.host file which your patch will create.

>
> > +     string "Additional bare-metal gcc options"
> > +     default ""
> > +     help
> > +       Any additional bare-metal gcc configure options you
> > +       may want to include. Affects al architecture tuples

> Also will fix this typo...

Good catch!

> Thanks,
> Jesse Taube

> > +       specified in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH.
> > +
> > source "package/newlib-bare-metal/Config.in"
>
> > endif # BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
> > --
> > 2.49.0
>
> Thanks again for contributing!
>

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
