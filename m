Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF14FC3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 14:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42CC240195;
	Mon, 16 Sep 2024 14:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfZyOGEdR5oD; Mon, 16 Sep 2024 14:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE55C40B38
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE55C40B38;
	Mon, 16 Sep 2024 14:22:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06F8D1BF3B0
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 14:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02AEE40B38
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 14:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kmrLTK2Oovgm for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 14:22:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f400:7ea9::619;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 855F240195
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 855F240195
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::619])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 855F240195
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 14:22:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3QjEHOCBuEKeqyGSWRON0UxqiKqi5cY0TT/CHld7pYrGNhu7GwnZvDRRAmKlKFxO+rKd/SdSUG9rPfnkDNmnRa1oNUiSKnKdOThTufVNozh4iz3ctVSY2bc2ZAq5kUgv0C3PpXhqRg11NLKJ3909zyj73/bdNEA54LJ/JKmeGBnOrcj/IvL64TAsW5d7L7idC7PPD3jhR5pWKY78lRSFymhTl1gIX+A6uiPBVWKai3Tobm1g4+8L1dk80uuHaKwQEu2jxZZziyefmY6dzsajdv9wQdwmeienbv2KCZ1vayL2WO4mKuMUEAgGet60+YuS2MIsMZJ0gSsMgw4IjJSxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSezoKdIpSpyCQ9IaPr7Ls16OSRqj9OwYcWDTm1qlYU=;
 b=cNJMvdRhEbUfwMVOrIu4PQL2WspaTKDIK6aw39vTASgH/vS/QOM0hcHU7bPXmSAUh6uL+wzL1OJMv5MiGrEK7E/dw24vlc+0yiq4HErI3VfjUpoZCmGl/wKxBLypf6EblETc7kfTkaVsV2dWNOthcVW3MkvrgbUG3HIaLwEyBdIRv+dXoR5tdKL7yFjen2IpMJ4uCga8PYj83Ag3pDwofqoOk17BsH4USX3Jl4jgo3UfeoibNL5mU08dLmbOIs+q0T+LWRUT80dYK6pzu9Tl980TlKsi63m7+wpduBckfadvtIT0vaAUhhaDDuusjPaTknEnxwbtTi1iL5gQ/RVUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CH3PR12MB8209.namprd12.prod.outlook.com (2603:10b6:610:123::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Mon, 16 Sep
 2024 14:22:20 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 14:22:20 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v3 1/1] board/xilinx: bump to linux 6.6.40
Thread-Index: AQHa7HYKOTF8QjpK6EeE1Yw9YA6hibJZBY0AgAGoxWA=
Date: Mon, 16 Sep 2024 14:22:20 +0000
Message-ID: <CH2PR12MB500452FC45040BC9B78A4E75F0602@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240812051058.2911075-1-neal.frager@amd.com>
 <642f92fa-bfb7-411c-aeb3-b49504059912@mind.be>
In-Reply-To: <642f92fa-bfb7-411c-aeb3-b49504059912@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CH3PR12MB8209:EE_
x-ms-office365-filtering-correlation-id: 1c03cbc2-b459-4543-a926-08dcd65af9b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?YThoZFpsVldVRTZ4MGhkeHFhQ2xHMys3UlFJSk56QUtKY3V3L1RadjZGKzFh?=
 =?utf-8?B?cnE0K3BJMkZSbm41RkdFTVIrWUQyMUZPdzZVc2xyMkZzRUFuc2YrZVY3QnB5?=
 =?utf-8?B?VGF0T3BrdUMzcG1xcUQ4STBZcG5GTXBXc0JobWdTUjlmc1ZVdUowRnpjclhF?=
 =?utf-8?B?bHdWdkptUDZLTXJmWXY0NUwxc3IyQThaTXg2bE5jclNSQ0gwajRINFpkenNT?=
 =?utf-8?B?QStaTTh5dS80T21sRTBRcDJjd2xUVER6N0ROSXE5K2xTbk5qbkljbGtMamoy?=
 =?utf-8?B?NnVnS1dmRWRoTU4yMUxYMVlzUk53eUNGVTBMVkpDWXBwL2ZIdU56UjNCeE9N?=
 =?utf-8?B?UnRZbVdYTm5ValJnSEk5Z21VdUFNUnNYSDRZV1BtbW9WYlJTRFh5R1hjV2hy?=
 =?utf-8?B?MkVXUnJORk5kVFR2a3poSWRLcGZHdGFnK3FkSDVIM0RBdlczVCs1eW1PQXRM?=
 =?utf-8?B?UzJkTG5La3BXOUtoWmQzVG1QU3lZRndNQ2ZGZlJoYllmbXZ1OVpGODV4SFdO?=
 =?utf-8?B?bjc0Z21EWDdjTW1nVmZjMTBTdzVCTmZCcjd0eVRaSk1VWng5V3p4U2w3c3Ju?=
 =?utf-8?B?RnljYzdpT0k3TjAwQ3BncDZ1dTZPMzJvbFl4cWFlNVpRNWx0M1R0b0xnRUkw?=
 =?utf-8?B?ZTN2Vkg0NnVtOGw4UjgrZjlmV0h3dnFudWdzVFFmVEpQVFhEMHVuaFE1ZDFv?=
 =?utf-8?B?YnZ2Qzl5V1dmL21XSDFkNnpNbW56dlp3S3JtNjFEMVI3eUxFNkU1bTBMcEoz?=
 =?utf-8?B?ZVp3NGd4WDRpZjFnN0pOdUVmRnkxd1NHeVJMekZIYVc3cStMbDNtQytyK290?=
 =?utf-8?B?cVBpUEhsVmxhNlkyM0lxQXJLbG1qNW5GbC9LM0RsMkFzVXdtTXlidlhRVVZN?=
 =?utf-8?B?eTgwbEp5K3NCemx4alVOa3RnTjhSVmNUaWN1WGdEckpOdDI3TXJkbkVudFNS?=
 =?utf-8?B?d0ZUOFllZ3RMdDN4dXlEUHdpUjVKSTFrQzVhdnVrY0c5cDZiZ05jQnVDNUp0?=
 =?utf-8?B?Wm0xb29VaGRpMityOGY1Y1I4eFlVQTVwR0FueFNiaVRyNUJGNUtkRWlTQWg3?=
 =?utf-8?B?V0ZYUWxkeW1saWRJME9lNjkyTFJmSmo1TWd1SERVQ3FkUXpsQ05CMk91Z0Mv?=
 =?utf-8?B?LytrUGtOdTczVmErZDlJTkFtVk93MlhVRUFMaGJuSmxaTWpxT0VkSHVtMGZx?=
 =?utf-8?B?c1A3VW9NV2grMEEwL1JiNHdNeUJNcTI4Z0M4cnNzVDl6c1dnUUp4QVRZNEVG?=
 =?utf-8?B?cDdOOHVpeDEwbVVwcGR5WGd5SVhxdW5RbTB3ajR3U0V2MC9EOHYxS0NzOXJS?=
 =?utf-8?B?dTJNZHh2c2I1RHZpSXZFZkZDNGtoaFZnNFEzNjd5TUpISTFhZGNOQ0d2TmZV?=
 =?utf-8?B?NERrM0QvRXpUSTUwUTlNRDllWlZxTEpkYXJtdEF1bjl0c09lMXcwczdmTVRV?=
 =?utf-8?B?NUZFNmYyR1QrblRBWHNHUUZYQUhsRXVhekt1QnJqcnVyNGNRWlMvNXNWVlVu?=
 =?utf-8?B?c3YyWSs3ZE9QYmVsWkhFUW11ZjFIc2ZNYUptK3orY3RCM3cwbUhNSEY5aG90?=
 =?utf-8?B?bDM5ZkxSeGhXU2treklOT3VlUmhRRytuTk8rVEoyUjlacEQ3ZnhjTjZLRDkz?=
 =?utf-8?B?TUhWTmQrVVRoV2YrUmZHZWl4dmRvU2JicDM2NkxHK1ZjNmhrQ2Exck8zRnds?=
 =?utf-8?B?VmFiNGNSdnBIaDhlSk90WFFuck4zVjdKY2FsZ08vTHVBQ2dKS0g2WWpvaTls?=
 =?utf-8?B?bmZNMjU5TjMwallRUjVsV3JFdmZzSnl1dTVYd2xqVTRRRmpaMlpIUWpLd3BY?=
 =?utf-8?B?eVhxbEEzamxuaXNtTGtHbVJiSVJYNks3M0oyS25BREVsQ2JBWncycHF6dDdu?=
 =?utf-8?B?Z1JJYTJ1RThhVTQ0bFg1MXJvS1E0Y0hQdmwrc1FKSXZUTUorMHFJTU5wRDZy?=
 =?utf-8?Q?zIENw5oBfBnCQpQ4uLDDqXnCd8Wn+/8N?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjFPbnlMbGZtYVluMFFhbzhiSFhPTUJGRnJTVDIwRjNwS2Q4QjRtWkhGMTQv?=
 =?utf-8?B?YUx2UFpUVEpzcTlzNHNqRXVYQmYycklCajB3V1p1UGY1RW8zR0t5RXVMZE9B?=
 =?utf-8?B?VFcrZUpjNjQ3MXdqTi93RVFmM0lVbTZqV3k1SDNsQ05yTFhmMEtWNldkN3Uw?=
 =?utf-8?B?eUZuYzhiNFFzY0FnMDlEVzFtb01oOTlCOWRya0tXb2lzKzB1RFMzaU5Zd0wx?=
 =?utf-8?B?bFZjOTdJNG5PUkFNZmpWbmxvY0NaTXZlWGNFQUlCa2NBbUtjR1gwYjFJRTc0?=
 =?utf-8?B?TnVlV0NmeFQ1TkZpVEhqcExJNzZmbXlWWHN5LzgvWkNkZUhJVGk4UGJ6bWlF?=
 =?utf-8?B?Z2VvZ0VPeDJzYmRuVUFKMGNENU5lblVQS0ZtKzVvcW9lbnRXSlFXRTczZEdk?=
 =?utf-8?B?SE5jeEdyVWtoYTFEdk9jbnpLOFg5RDBsMUxOejhLUmxZaHNWVEF2NlROMDZo?=
 =?utf-8?B?VHpaSDdCTW1rb25FZU1HR3NQamVLY2luVDEzd2JIYytEdUZURnN2aVUxMHFG?=
 =?utf-8?B?MnRlZ1JsOE1uOWZucTFyWVpiSWxDQmVCQWgzRVFzcDdoenV6SDRNTWZkNU12?=
 =?utf-8?B?QWtZeDUzOG5nTmhzOFluUEpuU0JXT2xIQUM1NkR6Rk1IdXl1WDJvbDNhcjdG?=
 =?utf-8?B?b0VvR1AwRXpkSGwwcUljWityWEdTNmhtdkJBMFNwNi9IKzh5K3RlRXJJVFJu?=
 =?utf-8?B?c0h1YmhzclJZM0JRazVXRm5LODBzbldqZEVCZm1zVzNFWklhVmxjOElYU3BD?=
 =?utf-8?B?SFE4dFF2cDVOZVBIYzZKRVh5U3NwOXVmRmlMWTRBalllaHdONUhxVHN6RXBC?=
 =?utf-8?B?TWhkQld5M0J6aVdKYzRNRTJpR0UvejF0WllXNnAwdjd4WlVxWGdrVno5Y1lL?=
 =?utf-8?B?Q2FnRGdxaE05NFFqRDMycUwrMVU1c0ljaFVRODVQSzV6MDVFaFhtRnpnaTh6?=
 =?utf-8?B?S3pGZFhha3hXcCtzRXMraTR0NUNqUUd6Q04vNGhGMm1xSFNHZlBDWGdoNk9i?=
 =?utf-8?B?MHg4TUZDWlJjQncvMVM0WDI2MnNuY2xQcW9ieUlGZ2lSUFlaTVo5MGZTbVZX?=
 =?utf-8?B?MmREOU9xWENmbXp5STdIQTFoUHZ3bit5Sis4ZWVqbVE4SGJtd2JTOEF4NnRz?=
 =?utf-8?B?amdTN01lR3l4OEU0ako5d1NlY2h5T2hpWXlodWt2dWdtRWoxS0dpK2lFeTgx?=
 =?utf-8?B?d0VTVGJXdFdPcU12a0thY3J2ZFpQY0xhSVJvQ2hoWWNOdVVkYzJTdGxwVloz?=
 =?utf-8?B?L3BYQTJDVmtOcHJ6ellYTkQ0SFRnQ3FlbVdrcmRGQlFtTUpIZVBtb05vMDB5?=
 =?utf-8?B?M1p2QWtVaXVpMFl6QWJVQ2V4T3FWdkdTaWVCNkpQTEU2R1pLYTI2Q0dOSjJn?=
 =?utf-8?B?ZUNzZ0ZPWDFNRFZkN0g0Nk9nTXFKN3hJRDhZc0hZYVlxOXZMUVh3Vk5wVU5x?=
 =?utf-8?B?K0d5b3VqT0hLY3pZK1U4aitmQitmNTdzODVNRG1WUEdXUmV2cHJEWkZYRHJh?=
 =?utf-8?B?L3VyNVdDendObVMxRTBQbjdxVGtwcWREMHNOS0xad3JpTkhlSzQzYk1NdXV1?=
 =?utf-8?B?T0VVWUxTSHd3c1BUMjNBTFJiQjFKL0twNWZDaVp1R3BVYTRNQ0t4bUZtMzU2?=
 =?utf-8?B?Z3RVQ29vcVNpUVhidWl6MDFLQm1nemZydk1LYkpUU21ab2pySkpHbDlCUXFW?=
 =?utf-8?B?aFQ3LytnTEI0UzBsQnV5dVdjb0pSczdEVFZZaXlTQ2tzVGQrYk5reldQbjg2?=
 =?utf-8?B?ZGp0SWoxR1hxcHNzempFclhneUNxQVlNeE1lZG13a2FQMlFiM01NZ3hxb2ZH?=
 =?utf-8?B?MGswMEpCaS9udm5nTlFRcDlaWUhiL1pMU0U3elErSEVrZkhOaDBxc1NYeXVi?=
 =?utf-8?B?REtmbEpyV1psVmFqS09DZ3E2NFlFR3MzYUtUMzY5T0hONFdCU3IyKysybjBK?=
 =?utf-8?B?bTZ5WHVGQVZuYStPYnRYN2RjV3RVd1VPUWpqeVRaZVdkZ3lsOWgrSk04SnhI?=
 =?utf-8?B?Ry9YUWlGT2Y5SGZHUlRwNTlCMFpBRTZKbjNUQURMYjFFTi8zNFFQUVM1Q2Vv?=
 =?utf-8?B?c0dhUWRaYVhLWTJXSXJTY0toazZHK3YzRFhlTU43Tnhib0k5eGNIZ3dtL0dz?=
 =?utf-8?Q?nTg8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c03cbc2-b459-4543-a926-08dcd65af9b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2024 14:22:20.4318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: joQ7ZD6yRdmHTwzKO6pdlGL5ZlLtzeObiAd9ED7VBJPpYiZpe7EADgDp0BzlPDwJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8209
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSezoKdIpSpyCQ9IaPr7Ls16OSRqj9OwYcWDTm1qlYU=;
 b=AsbElJTs5ioq+eEmZGM5MCBi21WkTofQxu53XZnu/veJys5YTPl/fZm0+UNJEh65T8liIVm4oGeYNuiR0cAgLRZuJPSVRTcjloWvylf7L2vGTbJwEWXaGYuZKfxJW8S1W5cv/rYxR4l7srJ6M9ZChKX0nL7HWYmWgX0fMItO47Q=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=AsbElJTs
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/1] board/xilinx: bump to linux 6.6.40
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

> This patch bumps all Xilinx board defconfigs to Linux 6.6.40.
> 
> Xilinx Evaluation Boards:
> configs/versal_vck190_defconfig
> configs/versal_vpk180_defconfig
> configs/zynq_microzed_defconfig
> configs/zynq_zc702_defconfig
> configs/zynq_zc706_defconfig
> configs/zynq_zed_defconfig
> configs/zynqmp_kria_kd240_defconfig
> configs/zynqmp_kria_kr260_defconfig
> configs/zynqmp_kria_kv260_defconfig
> configs/zynqmp_zcu102_defconfig
> configs/zynqmp_zcu104_defconfig
> configs/zynqmp_zcu106_defconfig
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

>  Applied to master, thanks.

>  Regards,
>  Arnout

Has this patch been applied to master?

I do not see the commit.

Thanks!
Neal Frager
AMD

> ---
> V1->V2:
> - Squashed bump of all Xilinx board defconfigs to single patch
> - Removed linux patch which is no longer necessary
> V2->V3:
> - Removed linux.hash for 2024.1
> ---
>   board/xilinx/patches/linux/linux.hash | 2 +-
>   configs/versal_vck190_defconfig       | 2 +-
>   configs/versal_vpk180_defconfig       | 2 +-
>   configs/zynq_microzed_defconfig       | 2 +-
>   configs/zynq_zc702_defconfig          | 2 +-
>   configs/zynq_zc706_defconfig          | 2 +-
>   configs/zynq_zed_defconfig            | 2 +-
>   configs/zynqmp_kria_kd240_defconfig   | 2 +-
>   configs/zynqmp_kria_kr260_defconfig   | 2 +-
>   configs/zynqmp_kria_kv260_defconfig   | 2 +-
>   configs/zynqmp_zcu102_defconfig       | 2 +-
>   configs/zynqmp_zcu104_defconfig       | 2 +-
>   configs/zynqmp_zcu106_defconfig       | 2 +-
>   13 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
> index d85f773478..b007db4303 100644
> --- a/board/xilinx/patches/linux/linux.hash
> +++ b/board/xilinx/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  ea85988e66b9a2e19ccd76d0f5f5e657988a873fed292160917712f45605a805  xlnx_rebase_v6.6_LTS_2024.1.tar.gz
> +sha256  6415cfcfd74e943d6ae44f6c1edcae09bf6cd89410b03c4290bf1464a8368f84  xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz
> diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
> index 21dfe2577a..58479c9f2d 100644
> --- a/configs/versal_vck190_defconfig
> +++ b/configs/versal_vck190_defconfig
> @@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
> diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
> index 253a6d2cff..4d3afc0e98 100644
> --- a/configs/versal_vpk180_defconfig
> +++ b/configs/versal_vpk180_defconfig
> @@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
> diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
> index f955a0c4ad..71a5d880b3 100644
> --- a/configs/zynq_microzed_defconfig
> +++ b/configs/zynq_microzed_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>   BR2_LINUX_KERNEL_UIMAGE=y
>   BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
> index 75ebc2a3ba..f3fc32145b 100644
> --- a/configs/zynq_zc702_defconfig
> +++ b/configs/zynq_zc702_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>   BR2_LINUX_KERNEL_UIMAGE=y
>   BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
> index ce539eefaf..f1c9bd6622 100644
> --- a/configs/zynq_zc706_defconfig
> +++ b/configs/zynq_zc706_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>   BR2_LINUX_KERNEL_UIMAGE=y
>   BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
> index 925faeac8e..cada3bbd47 100644
> --- a/configs/zynq_zed_defconfig
> +++ b/configs/zynq_zed_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>   BR2_LINUX_KERNEL_UIMAGE=y
>   BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
> index dff49b9837..262e80a145 100644
> --- a/configs/zynqmp_kria_kd240_defconfig
> +++ b/configs/zynqmp_kria_kd240_defconfig
> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
> diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
> index 24fdea9c30..65bba693a0 100644
> --- a/configs/zynqmp_kria_kr260_defconfig
> +++ b/configs/zynqmp_kria_kr260_defconfig
> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB"
> diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
> index a16da66e38..22df2a4112 100644
> --- a/configs/zynqmp_kria_kv260_defconfig
> +++ b/configs/zynqmp_kria_kv260_defconfig
> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2 ${UBOOT_DIR}"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
> diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
> index 3f1726a13f..c2feb393de 100644
> --- a/configs/zynqmp_zcu102_defconfig
> +++ b/configs/zynqmp_zcu102_defconfig
> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
> diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
> index b6d943333f..c26210b49c 100644
> --- a/configs/zynqmp_zcu104_defconfig
> +++ b/configs/zynqmp_zcu104_defconfig
> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu104-revC"
> diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
> index c10ec70ed8..737a8454bb 100644
> --- a/configs/zynqmp_zcu106_defconfig
> +++ b/configs/zynqmp_zcu106_defconfig
> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
