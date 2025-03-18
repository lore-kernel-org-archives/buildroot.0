Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78205C282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 14:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E40B582055;
	Tue, 18 Mar 2025 14:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RBzvpUgxSZO0; Tue, 18 Mar 2025 14:48:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCA118206C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCA118206C;
	Tue, 18 Mar 2025 14:48:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1159416E
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 14:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E90C740C78
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 14:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFJAUMVTxacI for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 14:48:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2614::62c;
 helo=eur05-db8-obe.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 553D5403E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 553D5403E4
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2614::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 553D5403E4
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 14:48:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXVYL1WlKeV8SkEPfO3+5svifzOl3airu6m1U7S6BTPN2ynh4JQLxdp4pqHsrhvWdQJUiFAWVszDOcpX8g3Gb/OrN2e8++eE5uyb7tCNESNF+muLxYEWl9j8qO7wiyRcC0j9SWx1vHzjXQenQZoPLX3BfwYo9wtofxLwukBfk5AbDjfVRkgKxkcfX3WRpD0gkxtaTbSFYNk6NlYD8vyXpmvFAveE2cQJVsXZtEVK0l3Nbhgn2DNOnJ3R1L0arbPEf4eXLbTNoiHdlyBc+IniDzysS4EACFDCNi3VVdupxqYnnuDBZfdF8DE9TiVVfmSC1HvC3jMUzftTrSmYP9NzUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvF+xXrZV6Z5gC7JIP9eY4QntvKe1d4yYhDqqVcsxp4=;
 b=blaw6SXQh7vHIDHIhBGJ23F9u0+SGLVyMYdVRZgwE9LjLxmTLT0S4CTnl7wh5tDvj7eO/FT9D5mViDMl1bOKamW/wLMmFfkHHyNjll3gSx6433LycdRiJ1ec237wueiXIk8RU4wAeg1/6pIZSI2OgUg1igQWuiWUzSe9HP55H+0DUzTBp2AmY4HxtetXG67CiQcD4w3MT3hcvGdpmV+lVMuWDA1cR9wRVhTdocCpgXJ16WkDKYF1nZ5FHNaxH0xlflytvW1V21n1gT2+NA/kUBBPUwQlG9GIGFmVJxqkgr81ym8R/BkgLwadE/hqeZMv0bOvV67v+ouh3dKm75S+Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10897.eurprd04.prod.outlook.com (2603:10a6:150:215::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 14:48:28 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 14:48:27 +0000
Message-ID: <514053c9-567f-4cb9-8ac6-37dff8c0206d@cherry.de>
Date: Tue, 18 Mar 2025 15:48:25 +0100
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Quentin Schulz <foss+buildroot@0leil.net>
Cc: buildroot@buildroot.org, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
References: <20250311-libcamera-qt6-v1-1-4897aadc6fe3@cherry.de>
 <87ldtbfn7p.fsf@dell.be.48ers.dk>
 <de08db82-e101-4630-b970-0081841fd4c9@cherry.de>
Content-Language: en-US
In-Reply-To: <de08db82-e101-4630-b970-0081841fd4c9@cherry.de>
X-ClientProxiedBy: FR4P281CA0376.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10897:EE_
X-MS-Office365-Filtering-Correlation-Id: 30213a28-9542-4fe5-3e45-08dd662bf0cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmdudkprbFcwWmN1WDhYT2RaajN0UE5tVVRXWmxBb1hEclJiR1BKSzRyMzJr?=
 =?utf-8?B?QWp4d3hud25ua0t4R0JCeDZwbGJjeUUvZXZsNnpXV2J6M0tLUk5JMVRyTmdt?=
 =?utf-8?B?aVZaSDhKeWFCRUdiSEI4bk9OR2w3K0luRGVSd1dxUmpKSHJrMU1EV29aTWls?=
 =?utf-8?B?SHFSSkRFbVJYaHc3d2J0dmZ0WXA4OFBwQ3JUNUdsUEs0WWs0SjVoNXVNSncv?=
 =?utf-8?B?YkF2Q2x3T1dhdzVkSUF2MVNDSUtmZERaTGRUdmZzbk9tZzVrWHZOSHlzU0RD?=
 =?utf-8?B?aHhFeGJyem01WW8wS0JmeWswSDA5RmxjakNzTzF6RVZzWmFBTVAwMjB3V0wx?=
 =?utf-8?B?NDBKbzZNOGdOTzdGQ2tqZ1BGaEg4SUN4U1l2WlhncWtJYnlRcUN6eXdydzNB?=
 =?utf-8?B?TTdYVGpvb1hzTHBSMGE5S1lVc3NGQ2gxT3pRcnI2Vk14cjBDbHdSV08xRGN3?=
 =?utf-8?B?RXUvL0NMT2lEMTYzZkRobEVVYytBTGVuNFNxSmJJOTNhTUxCRXNQTlJVZWpn?=
 =?utf-8?B?RHppNThkbjFkdXplQVFkT0htamNBR1VsRDhtRDFJUjdFZ1E2SEVwNjN6WnBF?=
 =?utf-8?B?UDBrUTIvQ3NiK1doVVR4Mi9VYUdvYTB0eHpEK2FNSlBZTmMwU0ZSdEZsK3ll?=
 =?utf-8?B?U0xSUUFXUVZGVmVScEljYUFkQ09zVHplOUxWc0I5Y29kSnp2aGxDR0tVU3FJ?=
 =?utf-8?B?TCtxOUdwYXJVRGRuOG9udzFqdXQzSEtjZXhwYU5YWW1vUDlBWllkaU16ZXlo?=
 =?utf-8?B?amtISUVKZkUyOXpoaUQ4M0l0UFJ6eW5ITTFpMEx5Y0VqNElpY251T3dqMVNw?=
 =?utf-8?B?N0Q0Y2pUN3FXdkx2RTF5eDVlVStLbURrZ2F4QnQ5QUhYY09XMzZ4d0lMZnpM?=
 =?utf-8?B?Wm5uT0hkcUNlaXE5RThadUxwNy9WbWNUbEZtMjRUTmxyWGoycFh2RVZqQTFS?=
 =?utf-8?B?U3dlZlA0eHlaVUw2bHN1TG1nWHQxcVlXaDRybTZKUjVQWU8zMEJyVkx4TCtn?=
 =?utf-8?B?MnRKRlFNWXJJbDVwdWk5R0hVQVZEdDJTclNiaDJmZXVzVkpFU0krd0J4V2Vm?=
 =?utf-8?B?RzNBKzd1c2xHcWFNNkw0REs0M0xBS3lNUDJNT2NsSGVOM2YxbytVMmRGbXgx?=
 =?utf-8?B?SGtrbTY0NGVOamJ1VlJkeW1UOHdmZlp4VjJNMEp1KzhsYmZxaXdwWmdjSUNh?=
 =?utf-8?B?TTJpVVZqVG5zL0llT3doWk1oRHFXa1RTTkRBVDJBZ1BPLzNRaWRVenFrYVND?=
 =?utf-8?B?VndvNzVNVmxtRnBkN2F4ZERadWZLVWxnOWlKVW9oZmRiSG1Rd3phSXViR1ZR?=
 =?utf-8?B?b3JLWXhCOEJnWjFlOUsyMG8rRklHQWlPODI4UC9zeE81QzlEeDdITkNDbS96?=
 =?utf-8?B?ZlhjUUZicVZTYmswWWlQOWNjUWtYT1g1bHppUEhKUWl0SjgzbWh1dVF6NXgv?=
 =?utf-8?B?WVIyR00ybFRqeVNTd0dTUEFKMVJpaGFTa1h2ZDU2TFhDamswT3lXdXpxKzRu?=
 =?utf-8?B?TWFhbWl1MVdSMjJENUo1bFJ3RjFrZG1QVTQ3U3RGZmgyYWFNSCt5emtWazZw?=
 =?utf-8?B?SlZVU29EbFUrZmhzK0ZINVYxaCszUlpKUFg2NDNqa2FyVWtUR0M5cTNic3U2?=
 =?utf-8?B?VG9TU2tSU014RFBBRWwvR0ZDK2FWTWVVejdGRG11L205TzE4NzBtaUl5MEpW?=
 =?utf-8?B?QVVvNlljbjNEemNqc3ROZnlBRkxFUG5OUnlpSXkvd0lDcnJUYzJPUk1NZW9K?=
 =?utf-8?B?MG9UenFRTmtobkZYdG1pejZRa3NPcnhjNXVVQlZyVmhYeDBPdWpmaDN3YmhP?=
 =?utf-8?B?VUlkYkZCcEJmVmpHbElnUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3lsd1lXSEtpNG9ISWdGc3ZNeVZSUHl4cHpncnE3czFTTTU0Rk9uTU9NOVE4?=
 =?utf-8?B?VUNGTWhBb2V2Ylc4SE1DRkxPMXJ1a1Y2b2l2SGloODF4YnNna1BlYzVxc2hX?=
 =?utf-8?B?Y2ltOTROZVNBMVo5VTBDQ2RZcG42bHhPVjBzdTdVZXZVOWdKYm1nTU9FRXZ2?=
 =?utf-8?B?RDIrNDVmTVZWNmZCbjRDWWxaR0FHUDRSVzE1UWgxWTNoZndUeWkyQ0FpcXNs?=
 =?utf-8?B?djFkK2FKbXBxemFucjUzMVZJQlZ1STFub0tWaDJjTkN6SjJVZlhRU2Z5NmdO?=
 =?utf-8?B?R3RGN3lVKzJEV0Y4Rm00WlpMRkcwYnpqdmwxemRDdU44N3NwSXFuNHUvNTZp?=
 =?utf-8?B?YW85UG50emxBdEd6OHVJajJTR3phL0VudHNLS0JPb1U4RWQ2dzhkVzlLTmxC?=
 =?utf-8?B?K3BTYVVwZHlCOXAvTTYvOTljMHBuNjdNUzRnQVNsRWFRQlBxUlhiZkJINkVj?=
 =?utf-8?B?dnY5djJuZWpLb29SZG5UY3ZzM05yZkxzdEpacjNTQVY4dWZ1WDJwZ2dOTGRU?=
 =?utf-8?B?Zjh5WVIvS1QwMTRCZ3FaTkNUZjVuNzZwZUhYVnBmWGE3MmpuZFIzTlVGODha?=
 =?utf-8?B?YXM0dWRtc3JxYXhvdVVKeDhaSTZYdlFTWGtlOHkzcmxkdjJOK1Y3d1hnMW5k?=
 =?utf-8?B?WGtZeS9DY293cFU3bFM3ZTZXZ1hwOUpqK2tYYWx0UW05TTZMRmFQSHFmaWl1?=
 =?utf-8?B?ZzBTcXAycGRnMTc1Y3VzN2Nnc0NucXZWOW9FRU42ZkphM1doRjA2UWt2S0hp?=
 =?utf-8?B?YldmT21JRFo1UEtUV2hwbGtrS21JTmhjMzgxK3RRbWlXT0hnQ01zcDl3NWt2?=
 =?utf-8?B?TDVEaDMwV0dxWm5rclJCdXRDaGFjaDByZU8xeDhnMnVuaEl1YlRoVnZVOWFz?=
 =?utf-8?B?OEdLQ0x0UE00ckFjQ1NkRUw2TmlabEhLMTNnaXFoL1F1cEJHUzhuR1RRZGtC?=
 =?utf-8?B?SkJ0eTN5anRpbnJHblVrNWVqZ2hzV2JIZGtEU0FLMHpLQktWMGpYYld5blQ3?=
 =?utf-8?B?SWloeHdOSWtpclo0d1BxZnMzaEU3SUhzZjFld2tqTElKeTdVbXJJY0JTZzNa?=
 =?utf-8?B?cE5JYm9qZUMzOEM2WWIvUlJEbkNTa2ttT0FRa2IvT3JBWnF6dG84eFhoRWwz?=
 =?utf-8?B?YjJ0anVsUTdPU2dJWEZOcHVRTjlwQjhmRytDVHpWeVpqdUl3TnRLNGZGWThV?=
 =?utf-8?B?dVRnd0ZSWDFRdC8vd3ZpMVhhMTBrVTd4NU94VXRwVFRhNU12MHMyakdqQTJ1?=
 =?utf-8?B?dGtPRnlZUUNDRUx2VkxFU1VoVjhJTGNKTE1xcDRwcWQ3QjBmazkvZVVZQzZt?=
 =?utf-8?B?WG1XemZWS3ZTWUR3VFdqQ2MrOUVheEd6T1c5SWszc0lFeXRpTHFQL3ZQdTB6?=
 =?utf-8?B?WEhWSHV0Y25YeGRLWkRvdU5RcGUyVUd5bzlZd3B2RXU4MmJNUzYrSnBlSGZO?=
 =?utf-8?B?YVF5VzhUenZrMitCakp0K25udHUvZzNqeXF6S3RxdDVGSjRiU0p5eW9rWmRD?=
 =?utf-8?B?RWFKem0zaEkxODR2ck1xNEFiOEFhU2ZKbndQckpYcVVobGNOdVFzc1ZPd3BX?=
 =?utf-8?B?SkxlamNnVjBrQmI2M1F3dVY5TU45dTlKOHVxZ3I1M2d3TlZOOTdvUTdPWTJj?=
 =?utf-8?B?NE5uVCtMYmlvUnoydmdPbzBsRDdFUU9XSFdWWjFOVTlxNEk1Q3QvSUZsU0RT?=
 =?utf-8?B?SEUrTmJhbUM0MmZqenl3Rmt2a0dmdm5JaU5NbitrdEZFY1l5Y3pBaDdVa0dG?=
 =?utf-8?B?RThjM3VtcHlKK0N0eTJnbWRCT1l6bFlGSjZXK1R4enJPTjZUZ0U3NGNlZHI1?=
 =?utf-8?B?MkxkYTkvaVVyZXBaUXdXOHhpVmpMRSt5cDU3ajhnbERjdmFqaHFqWGk0ZzlY?=
 =?utf-8?B?WFhtY0NhNWIyQTdQWUdwdWY5cXI4K1FqTjJDT1FjNjMrQmlYcTNRVDBQc3Y2?=
 =?utf-8?B?RE9EejJIVkswdG1NczdoT2twYThaejAzd0FLWXpmcDFkV09iTVZHNFNIUDgv?=
 =?utf-8?B?dDZYNEs5YXZaWnBtK29zU2tTSlQzaEhadmJpWUhJZUk1VmxGWVlqK3daNUNE?=
 =?utf-8?B?OURDeUtqUzNoVk84ODBUSkNaMW5DMDVTeFZaQXZhWHQ1RWlDYVNrSmY1MTlV?=
 =?utf-8?B?dHNDeUZHL0hxVDJncDRpMzRiOGV5b0JTSmd6aC9IZ3VPbkVoYnBoYUJIVDRY?=
 =?utf-8?B?RHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 30213a28-9542-4fe5-3e45-08dd662bf0cc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 14:48:27.2305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XClOp3+tbjCVx93MMJ4glku1MPVRHcFZIjfg+CPhMcXCuJIn4IK9lAfyQ1MmRm2sbZ7Kq7Np6tdRouEfpLbAfzw0JzvGz3HYcRYFs2lruEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10897
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvF+xXrZV6Z5gC7JIP9eY4QntvKe1d4yYhDqqVcsxp4=;
 b=gZyK05Ha4wjKNtk3Sb2TDFmIMUPRtcz3hWvd/RccAMmIndRhnNM5EF6XR/1WDvmIRkHtuKTayqMdKHe/4vNowpuNeTkdegT95PNHIJNpwLYVSStRZKnGLB1+0M6ZmUdB2pwVHWaP7k8zE9HVfWr9+5/0Z9QSZRW6y9USvUEYd7c=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=gZyK05Ha
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH] package/libcamera: force-disable qcam for
 now
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gMy8xOC8yNSAxMjoyMiBQTSwgUXVlbnRpbiBTY2h1bHogd3JvdGU6Cj4gSGkg
UGV0ZXIsCj4gCj4gT24gMy8xMS8yNSA3OjE1IFBNLCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6Cj4+
Pj4+Pj4gIlF1ZW50aW4iID09IFF1ZW50aW4gU2NodWx6IDxmb3NzK2J1aWxkcm9vdEAwbGVpbC5u
ZXQ+IHdyaXRlczoKPj4KPj4gwqAgPiBGcm9tOiBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1
bHpAY2hlcnJ5LmRlPgo+PiDCoCA+IHFjYW0gaXMgYmFzZWQgb24gUXQ2IHNpbmNlIGNvbW1pdCA3
MWFhM2NlZWMzMGIgKCJhcHBzOiBxY2FtOiBQb3J0IAo+PiB0byBRdAo+PiDCoCA+IDYiKSB3aGlj
aCBpcyBwYXJ0IG9mIHRoZSB2MC4zLjEgcmVsZWFzZS4KPj4KPj4gwqAgPiBxY2FtIGJlaW5nIGVu
YWJsZWQgd2hlbiBCUjJfUEFDS0FHRV9RVDVCQVNFX1dJREdFVFMgc3ltYm9sIGlzIGRlZmluZWQK
Pj4gwqAgPiBicmVha3MgdGhlIGJ1aWxkIGFzIGl0J3MgbWlzc2luZyB0aGUgcXQ2IGRlcGVuZGVu
Y2llcy4KPj4KPj4gwqAgPiBUaGUgbWlncmF0aW9uIHRvIFF0IDYgZm9yIHRoZSBCdWlsZHJvb3Qg
cGFja2FnZSBpc24ndCBzdHJhaWdodGZvcndhcmQKPj4gwqAgPiB0aG91Z2ggYXMgd2UncmUgaGl0
dGluZyBhIG1lc29uIGJ1Z1sxXS4KPj4KPj4gwqAgPiBGb3Igbm93LCBsZXQncyBqdXN0IGFsd2F5
cyBkaXNhYmxlIHFjYW0gdW50aWwgd2UgY2FuIGdldCBldmVyeXRoaW5nCj4+IMKgID4gZml4ZWQg
YW5kIG1pZ3JhdGVkIHByb3Blcmx5Lgo+Pgo+PiDCoCA+IFsxXSBodHRwczovL2dpdGh1Yi5jb20v
bWVzb25idWlsZC9tZXNvbi9pc3N1ZXMvMTMwMTgKPj4KPj4gwqAgPiBGaXhlczogNzI3NTdkMTEx
YTVkICgicGFja2FnZS9saWJjYW1lcmE6IGJ1bXAgdG8gdmVyc2lvbiAwLjMuMiIpCj4+IMKgID4g
U2lnbmVkLW9mZi1ieTogUXVlbnRpbiBTY2h1bHogPHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT4K
Pj4KPj4gQ29tbWl0dGVkIGFmdGVyIGFkZGluZyBhbiBhdXRvYnVpbGRlciByZWZlcmVuY2UsIHRo
YW5rcy4KPj4KPj4+IC0tLQo+PiDCoCA+IFRoaXMgaXMgc3Vib3B0aW1hbCBzb2x1dGlvbiB0byB1
bmJyZWFraW5nIEJ1aWxkcm9vdCBidWlsZHMgb2YgCj4+IGxpYmNhbWVyYQo+PiDCoCA+IHdoZW4g
UXQ1IFdpZGdldHMgYXJlIGVuYWJsZWQgYnV0IHRoYXQgc2hvdWxkIGRvIGZvciBCdWlsZHJvb3Qg
MjAyNS4wMgo+PiDCoCA+IHJlbGVhc2UuCj4+Cj4+IMKgID4gV2Ugc2hvdWxkIGlkZWFsbHkgd29y
ayBvbiBhZGRpbmcgcHJvcGVyIHN1cHBvcnQgZm9yIHFjYW0gaW4gYSBsYXRlcgo+PiDCoCA+IGNv
bW1pdCwgb25jZSB0aGUgaXNzdWUgcmVwb3J0ZWQgaW4KPj4gwqAgPiBodHRwczovL2dpdGh1Yi5j
b20vbWVzb25idWlsZC9tZXNvbi9pc3N1ZXMvMTMwMTggaXMgZWl0aGVyIGZpeGVkIG9yCj4+IMKg
ID4gd29ya2VkIGFyb3VuZCBpbiBCdWlsZHJvb3QuCj4+Cj4gCj4gT0sgc28gc2VlbXMgbGlrZSB0
aGUgcHJvcGVyIHdheSB0byBkbyB0aGlzIHdpdGggbWVzb24gd291bGQgYmUgdG8gYWRkIAo+IG1v
YywgcmNjLCB1aWMsIGxyZWxlYXNlLCBldGMuLi4gdG8gdGhlIGNyb3NzLWNvbXBpbGF0aW9uLmNv
bmYgW2JpbmFyaWVzXSAKPiBzZWN0aW9uLgo+IAo+IFRoZSBpc3N1ZSBpcyB0aGF0IGEgcGF0aCB0
byBhIHRvb2wgdGhhdCBkb2Vzbid0IGV4aXN0IHdpbGwgY3Jhc2ggbWVzb24gCj4gaW5zdGVhZCBv
ZiBzaW1wbHkgbWFya2luZyB0aGUgdG9vbCBhcyBub3QgZm91bmQsIGMuZi4gaHR0cHM6Ly8gCj4g
cGFzdGUuYWNrLnRmL2ExMmQzYiBPciBhdCBsZWFzdCwgaXQnbGwgY3Jhc2ggd2hlbiB1c2luZyBh
IHF0IG1vZHVsZSAKPiB0cnlpbmcgdG8gZmluZCBxdCB0b29scy4KPiAKPiBJIGd1ZXNzIHRoaXMg
Y2FuIGJlIG1pdGlnYXRlZCBieSBtYWtpbmcgdXNlIG9mIF9NRVNPTl9FWFRSQV9CSU5BUklFUyBm
b3IgCj4gZWFjaCBwYWNrYWdlLCB0aGF0IGFyZSBvbmx5IGFkZGVkIHdoZW4gc29tZSBzeW1ib2xz
IGFyZSBlbmFibGVkLyAKPiBkZXBlbmRlbmNpZXMgbWV0LiBCdXQgZG9lcyBpdCBtYWtlIHNlbnNl
IHNpbmNlIGl0J2xsIGxpa2VseSBiZSBuZWNlc3NhcnkgCj4gZm9yIG1vc3QgcXQ2IHBhY2thZ2Vz
Pwo+IAo+IFdlIGNvdWxkIGFsc28gaGF2ZSBzb21lIGxvZ2ljIGRpcmVjdGx5IGluIHBhY2thZ2Uv
cGtnLW1lc29uLm1rIHRvIGFkZCAKPiB0aG9zZSBwYXRocyBwcm92aWRlZCB0aGUgYXBwcm9wcmlh
dGUgc3ltYm9scyBhcmUgc2VsZWN0ZWQ/IChidXQgdGhhdCAKPiBjb3VsZCBzdGlsbCBtYWtlIG1l
c29uIGZhaWwgaWYgc29tZW9uZSBmb3JnZXRzIHRvIGFkZCB0aGUgYXBwcm9wcmlhdGUgUXQgCj4g
cGFja2FnZXMgYXMgX0RFUEVOREVOQ0lFUyBvZiBzYWlkIHBhY2thZ2UpLgo+IAo+IE1heWJlIHRo
ZXJlJ3MgYSB0aGlyZCBvcHRpb24gYXMgd2VsbD8KPiAKCkl0IHNlZW1zIGxpa2UgdGhlcmUgbWF5
IGJlIHNvbWV0aGluZyBiZXR0ZXI6CgpodHRwczovL2dpdGh1Yi5jb20vbWVzb25idWlsZC9tZXNv
bi9wdWxsLzE0MzgxCgpMZXQncyBzZWUgd2hhdCBtZXNvbiBtYWludGFpbmVycyBoYXZlIHRvIHNh
eSBhYm91dCB0aGlzLCBidXQgdGhpcyBtYWtlcyAKaXQgcG9zc2libGUgdG8gYnVpbGQgcWNhbSAo
cXQ2KSB3aXRoIGxpYmNhbWVyYSBhbmQgdGhlIGZvbGxvd2luZyBkaWZmIAoocGx1cyB0aGUgbWVz
b24gcGF0Y2ggb2YgY291cnNlKToKCiIiIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJjYW1lcmEv
bGliY2FtZXJhLm1rIGIvcGFja2FnZS9saWJjYW1lcmEvbGliY2FtZXJhLm1rCmluZGV4IGIzMTMy
ZGMwMTYuLjVmNTQzNWVhZjcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGliY2FtZXJhL2xpYmNhbWVy
YS5taworKysgYi9wYWNrYWdlL2xpYmNhbWVyYS9saWJjYW1lcmEubWsKQEAgLTE4LDcgKzE4LDYg
QEAgTElCQ0FNRVJBX0RFUEVOREVOQ0lFUyA9IFwKICBMSUJDQU1FUkFfQ09ORl9PUFRTID0gXAog
IAktRGFuZHJvaWQ9ZGlzYWJsZWQgXAogIAktRGRvY3VtZW50YXRpb249ZGlzYWJsZWQgXAotCS1E
cWNhbT1kaXNhYmxlZCBcCiAgCS1EdGVzdD1mYWxzZSBcCiAgCS1Ed2Vycm9yPWZhbHNlCiAgTElC
Q0FNRVJBX0lOU1RBTExfU1RBR0lORyA9IFlFUwpAQCAtODQsNiArODMsMTMgQEAgTElCQ0FNRVJB
X0NPTkZfT1BUUyArPSAtRGdzdHJlYW1lcj1lbmFibGVkCiAgTElCQ0FNRVJBX0RFUEVOREVOQ0lF
UyArPSBnc3RyZWFtZXIxIGdzdDEtcGx1Z2lucy1iYXNlCiAgZW5kaWYKCitpZmVxICgkKEJSMl9Q
QUNLQUdFX1FUNkJBU0VfV0lER0VUUykkKEJSMl9QQUNLQUdFX1FUNkJBU0VfT1BFTkdMKSx5eSkK
K0xJQkNBTUVSQV9DT05GX09QVFMgKz0gLURxY2FtPWVuYWJsZWQKK0xJQkNBTUVSQV9ERVBFTkRF
TkNJRVMgKz0gcXQ2YmFzZQorZWxzZQorTElCQ0FNRVJBX0NPTkZfT1BUUyArPSAtRHFjYW09ZGlz
YWJsZWQKK2VuZGlmCisKICBpZmVxICgkKEJSMl9QQUNLQUdFX0xJQkVWRU5UKSx5KQogIExJQkNB
TUVSQV9DT05GX09QVFMgKz0gLURjYW09ZW5hYmxlZAogIExJQkNBTUVSQV9ERVBFTkRFTkNJRVMg
Kz0gbGliZXZlbnQKIiIiCgpDaGVlcnMsClF1ZW50aW4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
