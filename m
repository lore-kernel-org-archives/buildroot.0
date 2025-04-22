Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7645C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 09:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79B1560D61;
	Tue, 22 Apr 2025 09:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ohZSvQnHTYLE; Tue, 22 Apr 2025 09:13:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E26160D4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E26160D4E;
	Tue, 22 Apr 2025 09:13:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE5CE1A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 09:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9F4E60D50
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 09:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTQ5ETs81ANa for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 09:13:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2612::615;
 helo=eur05-am6-obe.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 707C160D4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 707C160D4E
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2612::615])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 707C160D4E
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 09:13:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=daTKJvcmkR+nWs7N8SiqWGmyJgfPXYNsTxlEbJRZYBYWugO2TcoHSh96h1Znkm6Hr0we07tYgV47vVk1ZWi0wn+mICBpPJ3uSen0rw/tH2b8N+dqrrcln2fZqd8rl7PiSBmU8UREbqSIUV4gkYZuiJgO7LAqh3Q2p+Yq+M1J96aGfw8nTcADJ0nYaVymS5kB7CHkCQlAIV3hQVgPNWi+ySoEzWuwhd4HmNrj1HXdw8UYuDaRjwPgYhTS4Y8H1lrd4c0xZHkDMl7a1Jl65Ji8j1h70gxdx3vEbReA4vk/8kwE+dF3tuDBCLkFs08rBZxadmqA8HV9n8A2tfrbGatjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4v2RSoJyZ7NKmn9HvAFKPcBnpHqiZ4ibDqJ0wv+MHeY=;
 b=ZsyK/nXiPnKpQWM0rCrtsg4vGf519ISK1RA3vhhtQkaaOuaT8OVMH+M9nZwMaNZNG2h72/LMOzMs7LiWZ7pJIGfXexJ94S6AqYGVFFj7pYDLRURpyxOy7CXOieFJSi93wcBUPZek3IJfyXQyY7vd4WDOY/FPtQS2U9/2YFt+wfuXDfthCGZmrvR7ChP7h+8nTxDnLQWPXCVO85xQSikBCi3Uw6xv3SpHYr5iUjC00K6loilv4xq6vspcrOkYU/2op71ok92+tIVBAqUhDJ77dFR8/yJ3dWjA2+k+f6HeZW2fUSDNNEkflmF6XnCjvv5daVBTRA8/TAkkEeLBRdQhSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB9676.eurprd04.prod.outlook.com (2603:10a6:10:308::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 09:13:00 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 09:13:00 +0000
Message-ID: <69442a9a-4001-4927-b235-b5b168582aeb@cherry.de>
Date: Tue, 22 Apr 2025 11:12:58 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Quentin Schulz <foss+buildroot@0leil.net>
Cc: buildroot@buildroot.org, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
 <20250404-libcamera-0-5-0-v1-2-e2ca9d029aeb@cherry.de>
 <20250419222624.238f31c4@windsurf>
Content-Language: en-US
In-Reply-To: <20250419222624.238f31c4@windsurf>
X-ClientProxiedBy: FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB9676:EE_
X-MS-Office365-Filtering-Correlation-Id: 6772a322-25a7-443d-87dc-08dd817de0b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1A1NDZQeDFWWWpUMWNqU0ludU1hT0VxdVh1VHFQdThrdU9FcWVXcXZLZ0I0?=
 =?utf-8?B?VktUNXdqS0JZcVVzMnpMaW9TTWJsK3h5Mjl6WG44TjNMbU1yNVJ4R3ZlR3FF?=
 =?utf-8?B?bXNUaXRQM3BBRmtUSW16TGd0RW5ZRHJNbStJbjF1SXpBZFM1QkU0RlNWT0RF?=
 =?utf-8?B?SElaZU5DNlJXdWNxZnk0RnJzZ0lHb1o1cHYzcWRMajhzVExFRlBJMDlFRnhX?=
 =?utf-8?B?Y0JlUDVvdGNIMDdlb3RxSHhqaC9mQm93Zk8yQXZmQ291S1RXVmM1bTdHcHdo?=
 =?utf-8?B?dHJxOUdWNVZtNGlraDJoeWFUUkJwenVYZHN1Y3cxK3p5VGNuVjFISGhXR242?=
 =?utf-8?B?QTlxa09hYWtBTnRML2VoWGpaSWhPcXg3TllJQldYOFR4V2FzenhuU1N6K29s?=
 =?utf-8?B?MGhlenIzQjQrMWNyeWxlTzcybWtlc21zOEtSLys3eUwyUVlXVno0MU94Y0g0?=
 =?utf-8?B?aWExNFFRbWtiR0xVeitUNVh3M0dKeEpwMlNuc0kwM2tDbGhqMkgvamdPcHAx?=
 =?utf-8?B?c1ZDQnBYTkhzSGU2T3NVYmdaWExGL3EyUExoRGxUd0xKMVlnRzJxTGc1WG1U?=
 =?utf-8?B?SjAyNVBET3RTY0IxUHB0enVVZk11bDdvRXphQ09zdnFHcFp4aXpVeVJGZ0w2?=
 =?utf-8?B?RGVDdHkwNFM4bDE0UThGWGplZW1FWEJmbUtLMGdzZEpZMFQ5OFNpUklXRVRB?=
 =?utf-8?B?WkN2MmxlVjVHdlB2YitiMHd5MTJEZzEvOURHbWwzeGx0eUozMHYrS3dtbi9k?=
 =?utf-8?B?SUtyTUt1U3FKbzNXRHlMUGlVQ24rOVBkTXluRmhhbndOcVRqWU9GWEJMeXFl?=
 =?utf-8?B?UEJxbUh5NThaVmt3WkFFaEVpcmVPUWEvWlJsUThrdlFCOEI5dXR3elBIL0Ft?=
 =?utf-8?B?MjloS3hDckFRakRwWXp4cVZSR3UrV1hWa2xyS2RuN0tUUmtLZ3RvSTFuMXln?=
 =?utf-8?B?OGYvdXd3MlhjNkxVVVhGVXZwbU1oUzcxTVJuKy9rc3o0RzhXU0RBSEE0SHUr?=
 =?utf-8?B?NFNTU1BMaWE4aE9iZlBFUEVnUlkvblAwUWs1VW1nMlFqUjlJK3JxalZTZVVh?=
 =?utf-8?B?WEkrVDk3NzVHK0ppV2xXOW1sS3R0bSt4RzNhZUo2Wnc1SlRHL2loWUxrQ0I2?=
 =?utf-8?B?Slp5WEVkZk1HK0xZM3BLdWE3THppSU9BbUVDSkx5aWFxcmxMK1F4bHZZTHRW?=
 =?utf-8?B?bjYzYkJpcFJ6YzVCeVNSN0lwSHR3ZldCcE52a3dEZEh4WHJiWjFRMFoyVUZT?=
 =?utf-8?B?Y2prZmZGS1lxa0lzemJMbUhudXNhd3JOSEt0eGhHMS9mZWdSR01hV04xaEFr?=
 =?utf-8?B?WmxjRFBQd2Y2S2hNZWRXZnhJQVF6Rk40eFpUOHQ2eXA1cjFHUlNPT3VUZUg5?=
 =?utf-8?B?ZjF4THVHWEo4UHh0QUVMaTBTUFlwQldxaFNkQTdaQk9KMmNrR3JRbXhSWWJE?=
 =?utf-8?B?MCtncGdyMk9JdHRITmNmUVIyMkVlYkFoVXVYZ2NkaDZqUkxqbU4ycXYzYUZY?=
 =?utf-8?B?cW9hb0tESzFIYmlINVJZNElTTDRsZVFOaWt4L1NVSzVaYzR5cWx2MFNYa0gx?=
 =?utf-8?B?dUFmVHVUeDJIaXgrL3g2QWNqYVBBOXRveGpOc2dYVkxhQ3lKYXBoajBrTUNw?=
 =?utf-8?B?cTYvb3hvUnN0WDJ4YUl0KzFiWlcwUUlyOVdacDhONDF4WlVrckRGbTBVTzBC?=
 =?utf-8?B?UkRtR05GUENDVzdXZmY5MTJDV0tSdjVoWEE1ZWNzaHUxcFBraWF3ckFjWm5l?=
 =?utf-8?B?c3luNjVDN3E2MkdlYzNKWDJXeTIvVHhvamZJT0dEUXZFaC8xYjUvTXpJTW9z?=
 =?utf-8?B?N3g3TlZuVkpINHNlWjFtZFM2dzNBUEFWaGNLYjNoRXB1d0JtdWY5c1ZGbUdv?=
 =?utf-8?B?bWdOVjEwSzRubHRQUkszaXBERXh6U2tqYjVUcDYybkQ0UVRRMmUvK29ZNUk4?=
 =?utf-8?Q?fRBSk1rj9vw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(41080700001); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZW0wYkpqclhCejdQWldDTGZRczF0OFRvc1p6bWF3cEw1bk5VK3JRdENOZmlD?=
 =?utf-8?B?OTUvWU1rUzM0UE1KUTVMaVovSXRFbDZRSEVRZ3ZTR3BvajZWZ2tFblFFQjVD?=
 =?utf-8?B?RFcwcC9WazU1ci9hUGhTL2U3YXN3N0Z6QkxqRS9KRFRKUUZSYk9YM0xoVTRp?=
 =?utf-8?B?WEtDdUV0T1ppTFJtd2x6RXhXSnUwQWN0ZHhFbTg4YkY3aWFBYzVmM2Z3MEw5?=
 =?utf-8?B?bkN5T3p2S2kyUGhnNUZQSnNQSVJBNHl0NzVHK0s2Ny9Td3cvcThHOEswUEZT?=
 =?utf-8?B?T1JJQmVXYjRFWlFPVVdNdUppREFPaDZHTzdzS1BFMDU2d0tMbjJkYk9nU0F5?=
 =?utf-8?B?MGs3Y3Vqay9lUWRYZ1FVTkJlNDNrdVZYQlg5K2VPRWlaaHFkNDZnZFhBRXoz?=
 =?utf-8?B?ODlBdnE3amwwYk1HWG1NTFgva3cweEJYemE3N1IzSnF3dE5zSEpWTWpSeU03?=
 =?utf-8?B?STNPYkFyaUgvQVZ1YVJGUmVZY0dCTHl5QVUveUFhS1pGMmFHMXJjTHFDUjZW?=
 =?utf-8?B?anRMdjdzalJ1ZVJpdS9LWmNyRzJacWp2OUZuK3BnK3V1N0RYUEQ3VzFKWm5S?=
 =?utf-8?B?V0hoc0dxZi9OQWlmUkVHaHdWYko1RERKMVFpR1dIdzZuWklKUUtYSDBydDND?=
 =?utf-8?B?d1NFY0RyVHFWbkNtd2VDS1B0MHRSVVMzK3lwMnhNb1ZwTFd5ZndBK3dJOUpO?=
 =?utf-8?B?ZERBZ2swdzFSY3JxRTdrS0poZ3B0VXg5eExWWWoybTAwbVFzdnNPWFNpMGhR?=
 =?utf-8?B?MVFZTnNhU0pwdjhCVi9uOVhsejk1V1hpT1FEU1htdlMvMi83Y0VUMDFub1hV?=
 =?utf-8?B?TldBeVJFVGdDYkVDSzYwRE1DdUpmbXBQYzRmTWpsSXdvZWFFNWJjT25Xclk1?=
 =?utf-8?B?TUt0M2F5STA2V0NvWk5iMEdpL0dIb25WMGN1VmlicU81RFZWZFluNWhkOWZX?=
 =?utf-8?B?dS83ZVB6T2UwV2pKQTUwZ1pKNHZiYThDalByTjdKUnpqY0UzOUNwemJXUXRs?=
 =?utf-8?B?RExka0FUb3p2a3hvdjA0R0d6ODN4dHF6a3RWbEx6YndDTFF5OFZxWnJQeGRE?=
 =?utf-8?B?WU1lSEs0NW9zcktURVZBdGJtYzYzdEYwdXU0R3lKVW9vcVZvWTNEM2xoaVJp?=
 =?utf-8?B?Mk1SVDRFK3J6Z0dzb1JNSkFOb1JPdkZkNUNPVGlpd09uWHFnaEV3Y1dYM1Nq?=
 =?utf-8?B?UVlwSG9Qa1ZmMHJuLzQ0RXBaRHBIRGwvS2pmb2ZPMDJJOXdseGVvQXVjUlVU?=
 =?utf-8?B?NGtQSnVCYmZuV3V1SzhOcHBTZ3FkV3dNemxsUzhROCszczNpcjMwY0c3U3d6?=
 =?utf-8?B?Y1NxV3ZEWjc1VU81QnZxTG12WWxSTEhDSjRmenZ3M3QzRENSZ1dLdGp1Y0hL?=
 =?utf-8?B?SHpCdkhzRzhPdWE0ZHJvWXZtTXMxS3JvR0NsV0JvK0RxMElPcjVwRlpXNVRz?=
 =?utf-8?B?VTNFTEM2V3JiZXJsOERzS0EyVGtzd0xZZ1dYOVA2aHl2ekovSGJaNHJNbjcw?=
 =?utf-8?B?S0RXWUZoV0hFUWtHeDNBeDhiM1FWdlJqalVTYWRPTHFNTHBlVGpUeXBjc2Fk?=
 =?utf-8?B?djRnSXNGU1Z1THhZYitzU1VUMzRrdFpnR003Wkh5Tk5sVzdiYVg1M2hpRUZB?=
 =?utf-8?B?U3I4QzJQL1lCS0JaVmY5VnE0UnRoSXgxMjNmTkViZU1lY0dwMXBrVk4vanNN?=
 =?utf-8?B?d0JVUnNTbmVySU9kOERNQXUzRnNac1V0TVNVWnk1YVlKSVU2b096THNxMHpM?=
 =?utf-8?B?eVlveU9MaDU2OW1paTlpMWFlN3AzemRQV1g5emhvZ2VRYnh5VGs3eVZEYUJE?=
 =?utf-8?B?b3JFRFZKLzNMS09pOCs5Nm95Z3J0UG8ya29yOXVuSllSYzAyUDNuTTc1cWd4?=
 =?utf-8?B?QkZEMks4M2QzRlh2M2FoYlorYkl5N2lKSDRVQkhtZWhNTzdPQ1R3c0tPRW1N?=
 =?utf-8?B?WStNdWpjT1FVZmVtWkhvQThSQW1tbGRLRlpjbHlDOWUvWkZCQy91MU5OTGls?=
 =?utf-8?B?cUY5K01CQXZLMDFqaVZVS2IwL2hWbFYrQ2VrT01zVnRmbG9hS29YcDh6L3Ux?=
 =?utf-8?B?OUJpMXllbFNPRXkwZUlGWFVEbHNtQ0hkVVF2ZVkydGhqbC9WT1p2OHc2SEZM?=
 =?utf-8?B?UlBHWFJWV1JjaUxNSzVhdGp6bW1IOWJqc0ptSm5mTDdMMXNLL2tQQUpXOFJk?=
 =?utf-8?B?a0hLZkxkRk1Ia0xPU2s4YXVuc0NKbmY2aTI3aURWNnRxaHUyakt3UWYvRkpO?=
 =?utf-8?B?MExaWkNJYjk4NW5xQzFYb1hFUVFnPT0=?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6772a322-25a7-443d-87dc-08dd817de0b8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:13:00.1048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvMnRmnjFFSAUnnWOVTJyYyDq5gV5Gy59AMCTgFHsDWi1rFaM/Jv6u9o5zhQDvh7q98Xz34SZYXR0NayfFhCV166onStZtqYfLOHJ760gbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9676
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4v2RSoJyZ7NKmn9HvAFKPcBnpHqiZ4ibDqJ0wv+MHeY=;
 b=NAJJ5cccryYCpf32kkeDS+lJsbbuHSIraP6BWN+cdBQB8h/RqcRQBd0sr9tysCe+AjEc7SAjXDzFS+66g8eG6uWANhUKqUKGbe6czzled+r8wSDanAb6YEcsZRiAvUX2DywYLoKgXj2dranx78c2TOONOO8eXOjW7KpXBnIuzbU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=NAJJ5ccc
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 2/9] package/libcamera: fix documentation
 being built even if disabled
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <quentin.schulz@cherry.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 4/19/25 10:26 PM, Thomas Petazzoni wrote:
> On Fri, 04 Apr 2025 18:47:33 +0200
> Quentin Schulz <foss+buildroot@0leil.net> wrote:
> 
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> We currently disable building the documentation via the "documentation"
>> feature, but it is enabled nonetheless by meson if sphinx-build-3 is
>> found on the host.
>>
>> This makes sure it doesn't happen by making the sphinx-build-3 check
>> only happen when the "documentation" feature is "auto" or "enabled",
>> which isn't the case for Buildroot.
>>
>> The bug seems to have been introduced in v0.0.1 release.
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>>   ...t-automatically-build-documentation-if-sp.patch | 42 ++++++++++++++++++++++
>>   1 file changed, 42 insertions(+)
> 
> Applied to master, thanks. However, you got some feedback from upstream
> that requested some changes in order for the patch to get merged. Do
> you think you will have the chance to follow-up with upstream? (Or
> maybe you did and I didn't see it?)
> 

Another patch got merged instead, c.f. 
https://git.libcamera.org/libcamera/libcamera.git/commit/?id=ae2b6cb3cac6a38a6c96625915cea4b9cf3fc180 
so will send a v2 with that patch instead :)

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
