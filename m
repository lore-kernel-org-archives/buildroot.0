Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA71CCD1BC
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 10:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8454341126;
	Thu, 23 Oct 2025 10:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5b87VGigWjDO; Thu, 23 Oct 2025 10:29:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 170114106C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 170114106C;
	Thu, 23 Oct 2025 10:29:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6854C70A
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 10:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E00281402
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 10:29:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zW6nvcCZn7SK for <buildroot@buildroot.org>;
 Thu, 23 Oct 2025 10:29:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c408::1;
 helo=pnypr01cu001.outbound.protection.outlook.com;
 envelope-from=esakkiammal.murugan@iwave-global.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6AD61813B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AD61813B7
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c408::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AD61813B7
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 10:29:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOhnVF8DnPDW/B/+kAzk9j+xXWAcWgng+7E8OE5SU9n4zmDy5g5rGLIXP84enulEjC8fi06V84jkxJxx9+boT8VFAtKqrm9Mxw6B35wThWpGowXE2uwUFjX9MxtDh5GUS4xq+jsSNHvC38zndUpno6ymPG6YIqMQsNJPBUU5l10rr1OFFobPzvofjp57DMY34BtMRsbsWPR0PDuiLQj657VKMX7BkkKhGReE2lwwQnmaf4DDnKmExlrXTkG9Cl/ppjIodkO4YAT90S7zZrSV+9UmE+FdMEjrIoqAfj5gi7lrGmokAc0RG+bhMfKArea5NEJUuArFDdqVA+91wcQSng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DaqeWyuqJLGOWRbqtMWjjIWQ2NSO4I5279f1Uh2IsE=;
 b=DTiDG5OxAtRjen5Rajch8jBxrwNIdVuVGNNpgHv1JPnt4lK8F+AKAZraecHrFSW2P9tSW6NeGDqxsiGXmGZdSayElJkeeWJat5DzfzhFuEcUCovjvSG2y6/TtxGFgTeRorS8O42mhSUYNG25wTHQqsd5vmiypZillA/rsUciKBEI6kxtUzBViu7SAu0eqqnVEjP2j0cJ5cYT9x7i4s35EdTAUGSMsjcfzvxr7Acgu8VsHi85oCu7yP5fo1tSWLr+pqTuC79GZYNykV+GqyX+4TbJ54I6WPS3QD8Nv9MRZtAz32Axl2AWtGciXHkf/W8tZo7TKqOwcJQstHsN2tlg7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iwave-global.com; dmarc=pass action=none
 header.from=iwave-global.com; dkim=pass header.d=iwave-global.com; arc=none
Received: from MA0P287MB2448.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:122::11)
 by MA0P287MB0555.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:116::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 10:29:05 +0000
Received: from MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 ([fe80::fafd:97ba:ad13:4c1e]) by MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 ([fe80::fafd:97ba:ad13:4c1e%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 10:29:05 +0000
Message-ID: <68a237a6-6e79-42b9-a3b5-52194d42e782@iwave-global.com>
Date: Thu, 23 Oct 2025 15:59:04 +0530
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <23d1f4ad-241a-4fe1-9db0-08bffa4775b6@iwave-global.com>
 <45b0422f-620c-4db5-9a35-423466de2db5@iwave-global.com>
 <584f433e-3ace-4493-a073-7cb92eae6d08@gmx.de>
 <3ac2065a-8ac7-4a59-9889-51fce1eae53d@iwave-global.com>
 <5eb375f3-d026-4592-81f4-462548717d61@iwave-global.com>
 <a08cca53-7d11-4101-ac6f-b34de963d870@iwave-global.com>
Content-Language: en-US
In-Reply-To: <a08cca53-7d11-4101-ac6f-b34de963d870@iwave-global.com>
X-ClientProxiedBy: MA5P287CA0229.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::9) To MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:122::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2448:EE_|MA0P287MB0555:EE_
X-MS-Office365-Filtering-Correlation-Id: 717eb4ef-ba85-44ef-29e0-08de121efde0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVpvZU5TdWNOVHhTYm41b2JPWVhHcXczQi8weFRDMW9XNVIxSy9VSW5mTkNJ?=
 =?utf-8?B?Y0FaYUVNZWtoSiswdVhSdHBhazVJUHFnNXlPQ3lMaytsTmtUTDV3NVBKZ3NI?=
 =?utf-8?B?aTFiRmFGU08xL3ZUMmVMSzZiZ1I2d1pYM3ZYVDBBWVdDM3hDSlp6L0ZqcmJx?=
 =?utf-8?B?c1ErQlNuRld2Zjk3SXBGQnJnV3pydW5zRDU2dWZVbVFzY29QTzlKVzhvRGFI?=
 =?utf-8?B?Um55cTlNcXFhNHFsaGpuSHdQVUViVjZuWEY1QkxaM2pLV3hjeHZVbk9iMThQ?=
 =?utf-8?B?bUxOTVA0MVdiT1ZKcmg3RE9WdE0xREVWVkV2KzFSdDM0YjdjRUU3QWpaQ0tQ?=
 =?utf-8?B?K0R2b0dWUGZBWEFENlhEelJoY2JxLzh2RHNud1hlVlpmYjlxWEhpRHFWUko1?=
 =?utf-8?B?Z3BMQmpwQ0NGQktkU3EzNkxTM1R2M0hhT3JES09oazltaVhlY2pXRlAweHJV?=
 =?utf-8?B?SjdJLzd2SXhDREdMUWxiS2IzUTZyVEVZeENYaFQxMVhsNmtLbzFlTWFxczZr?=
 =?utf-8?B?V21JRmJlQldhU2QrenNvbHR2dER4S1lLQVVtSWxoUGlNQ0JRRERzbCthRThU?=
 =?utf-8?B?YXY2bE94U3duSjRLbGJwUnJzNkZsRXBlMlBnY25TZHp3SmI1dlNwa0d5b0oy?=
 =?utf-8?B?U0J6ZGxsM2RyT1E3UlhPaTg5TFJzdjNRR3VVdEt5VUU5b2Fqbmt3aW4rNGNn?=
 =?utf-8?B?Y1J0TzRTMkc1V0Y4UXFHbHR2UVJzakRpZHV5L2wzU2p2ZEY4djZRVVFKNkJu?=
 =?utf-8?B?YXlveVorVFh1L2JjenB3SDVLakpMV0N6aTlGbnJUYldjTjhCSllQM29YUDBP?=
 =?utf-8?B?ZlBCbm5MSzdITjBZNnk5OUUvZjEzNGdWblNRcWJ6WWxhQkE0MUFkWjVZcFFt?=
 =?utf-8?B?ZGZlaG5EajZhVldoc3oyU1lrM3NHRUxONlZJUW1KZTBRWFh1WG9FKzU0WWRt?=
 =?utf-8?B?aHhDYWFuUkJZLzVkbFJUOGtkUXpsNlBlK3R5ZzlWMTNXTHZuQ0cyaVFwRWI0?=
 =?utf-8?B?T3VSMU16TnZpeWNrY0RzWUx0Q3RhTXlCYTZ6WExmd0h6LzR2bUdFWlRTeXdk?=
 =?utf-8?B?TCszd3NkZVMrd1RzQjZtSENuODROMzUxUVhpVDRQSVluZ3VvYzYweDA4Ylh3?=
 =?utf-8?B?RXpIZDNDUHoyV0dDRDBUVmhiZGRCS2RzZ2hCWVpVcUZPNHhYOW1rdjB3REZ0?=
 =?utf-8?B?cnNSaEYwRFgrM296elJob3U0eU54ZGRoZWQvOVFzQWhHQVN0NkM1ZVRLdkxt?=
 =?utf-8?B?aVR5aHJDVDJ3WVIzOUdiaVBjZ3J0blFvSWptT0o1bitUZ1J3VXl1YUhUSkp0?=
 =?utf-8?B?L1IrNzk3NGpxTkptUnBHSkwwTlBtbFFzUEhRR0lPRGZ3WkhScWdodmZpeXpi?=
 =?utf-8?B?TDFRandoMXN6VGR4QXU2TUpuVkxkQ2VPTmY0MUJSOGJQOWU0ZWxXdkhOZ2xp?=
 =?utf-8?B?bjFFSVY2SlBRbFVuQ0hFN2VXaE0zRG95YkNPTmdTSzVhWWtBc05qbFB6UXBm?=
 =?utf-8?B?SVZRcTFIRjNiQXFyVUxRdWs0RE5hbFNFZ1Vva0VHY1RJVkZpSE5DNEpwM3Qy?=
 =?utf-8?B?V1ZVLzNVV1dXbEhCWkNJdysyQ2tRVG9UNS9NYTZvNlFoYWxoajNxUDB6VWx0?=
 =?utf-8?B?Q2VMV0l0M1NsS3NkY2pFZXE4UEk0R1VlY0MwOGxtS2NzUFc5SlZSZFdiM0ZM?=
 =?utf-8?B?NndraThXeTFhdGNWUHQzTnBTemRlWjYvR0Z4YmNUVW1WdXQ1L1VZaC8reUdm?=
 =?utf-8?B?TlBBME1sWE5rSkxadzFQeTg2SGQ0em83YnRTR295SVZwRFFZVjJtbWRYYjBI?=
 =?utf-8?B?SzhUL2tsdkIyRTJCUXJvcHBxYk1XQW0wNUs2WXRob08rNmgxeW5ySTR1MXJI?=
 =?utf-8?B?Zm9obGgrVmo0NzR1SXozV3VYNG9nUXliNGp1eGVodUxrTWRCZ3o0OXpqL3RD?=
 =?utf-8?B?TzlsbzhxaHU2d3VHekV1Mi82VG9ReTBrK1d3S2dhYVlHL2paUjlMOTVjcGRj?=
 =?utf-8?B?Mm43WWRmVlhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MA0P287MB2448.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(8096899003); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d25XaGVtSEZzZVVjN1lCcDBqbnBUbFRoVXNCeS9ZL0ZnRmg4dkpBMHV4N0w2?=
 =?utf-8?B?RGlkTm1iUVlDcFlEbkFackFYVWZkT09XbnIvL3J5UUdzbVo1TytycW1uVktG?=
 =?utf-8?B?TnovN2QwZjJ6VDVpUWo3eVZLN2d1Y3lGbHVmdVNRT2wxL1JtRWVVeVlRb2Q0?=
 =?utf-8?B?SkRkaGk5aisxOTRJUG92RGdrMVFkVEs1WXpsRWhiYmhhd0R0U0ViWDRta3lx?=
 =?utf-8?B?d3ovNnlkTlpaUDlFQ20zcm1DcTdQVDIvd2FOVjVIRlVPUnBsNHd4UUxHNVFO?=
 =?utf-8?B?WjVHZlRyUllKR2syUDBKNkNmQXlEZEJYeEU2RWFmL0Q0dCtxdUhLZU5HVmFK?=
 =?utf-8?B?cTNKa2hBVS85K0l4aEdRSFd3ZDlRdHhyMkxtb1pqbHJuU2VnTXRZM1BxamFE?=
 =?utf-8?B?Ti9OVXBuKzJDSWJLTjh1RTAxWjIyQW02d1l1MlhkTDBEdkVrdEFHVWFiK0FS?=
 =?utf-8?B?azd0ZTB3c2o4YkNxTXF1RXNZeGVNUllQbzlSb1pkbWliWG1zUFRTNG9vaTkr?=
 =?utf-8?B?RXo3dCt1ZFQ2eWJhUkx0S3VOTWZPeFIrMCtvWnNOTE0vd2VLSThwREZrMVU4?=
 =?utf-8?B?eTNjQXBEVkhRS3A1THhsS3FDRmJlaThoVUl1bWY4RVZnSUVybUQzdzRweGQ0?=
 =?utf-8?B?Tk51dGJha2JNV1VZdmNSbHc4NCtYbnM0dTl4TkphZVdadk9EcngzS0ZCRjZQ?=
 =?utf-8?B?T0lwaXltb1hRWCtyL2YrOHp4TUxhd1V1OHU3ZE5qZkd2cGhVckVoaGUzYllJ?=
 =?utf-8?B?ZDJOOGkxTGZ5Q0VySjJXZTMzcTJVYmlqREhnMk8vaGFOVmMzWllPQXRobXAr?=
 =?utf-8?B?R1QwRFI4TFd4SEdScHBObExMSFZQRUZ1UWFENHc4Zm1haWpJQTFYbDFjUXNY?=
 =?utf-8?B?aDBvd0RVVFJ5WkIvdHhaOStYY0xxQ01xd1MvdGtENkFKVEtxRXUxTnh2czNQ?=
 =?utf-8?B?SUJBNnhCakJkQ2t5OXlYdUhEQS95bEJQQ2NtdW1LUXpCbWFJSFluNUIvdk0v?=
 =?utf-8?B?ajh2RHM1dGpGclZpdXRwOHdIQ1NtYUw0cm5DRS9JQWVlN2IxSGNmMGxIc0pT?=
 =?utf-8?B?N09lSUJzOTY5RUVTSzhVZ2R3TE85NFdJZWVFdzB6LzFxK2tvcVFHOThKT2tK?=
 =?utf-8?B?dmI1VkFtTnQwVlNOZXVxbUR0ZWF2dTlHY3V0TkV6bTFqMlpOOUc2VkYvaVMw?=
 =?utf-8?B?bmpERFBCNzJ2K0F5dGhwZXZPMTVnTVk1TWc3ZXFRaFpubUFZN0JDWkJoVStL?=
 =?utf-8?B?Q1hZUk9YdHlBOHRtU0R4UnppdkhQQU4weSsrdG1YVWVTTnVpZnJ4S055bmRu?=
 =?utf-8?B?VW5FOEhCazZWZmo3UGxGZmVPa0pjVE5lMnpJem05R1J2eHRHa2VFb0ZzbkJm?=
 =?utf-8?B?T3k3dzRzZE52Mkk0QmQ1RTNyZWRSazJqTzgva3VvSVZlUXllZnpPWnQzL3g0?=
 =?utf-8?B?NWdnLy9XSkJDVmV1MGxJempjSmlISVNhOEpUR1g4RmU5YVVhcVdvOGE2Nk44?=
 =?utf-8?B?ZElQVE5KWHFSbWNReDRQTTFBbDcrMG05eHA0WHpTdVNXNXdnU210YmwzUzlw?=
 =?utf-8?B?Zm05NjcrcFJpbzd5dmFWM0VVT0NsYUFreFhTSFpraWY0QUdubEV6QVd6NGFE?=
 =?utf-8?B?QU9ZVTFXQ1FUZ2IveHFmRWVvMkFQVW8yblhieTFEVm9RclowS0pNQW9heUd1?=
 =?utf-8?B?VkdTaHNRWmE0NWVlUnoyeFFZeFRpTFFnMzBVQ1BYQ2ZUSW8vZWdyUUo0MW5Y?=
 =?utf-8?B?UGtNUGRpaUZ1T0RDb3Uvalh5T0VDUEFkZmJ4U1QvdjNQZkEvSExHOEcxYXNn?=
 =?utf-8?B?dEtsUWhDMmQxeVVoSE5CZXQyeTBXMmswb2dINFJqOXdoVFdFZ3JFT1F3ZUQr?=
 =?utf-8?B?cVJyVU05RG45czY4MVh0YzFmWXp4ck5YM3F2bmhoeUMxNXRKWE5JYXBWWGJp?=
 =?utf-8?B?ZkpRN3l0TVdzb1RMWDJCbEptZ0hLTWdLQ2xrSXVzNTlpMmpWdEEwRzlUUk5O?=
 =?utf-8?B?cW5NbkF2UVdSRVF2SCszL0I2U0pJSUdoSTdJNmdtWHZSM1B3TDMzZDNpaTJE?=
 =?utf-8?B?VEtIWjgwYmZiR2xVN0dpZ01DSXZIS3dJQ1NrT2lLNTJqUnRQVlBnd0pMTFky?=
 =?utf-8?B?aFlkOGVYOFNlQUtZLzV6bHFTWGlXVkZUNG5UNmpyYnBKUE9zQTJTSUdVWTdN?=
 =?utf-8?Q?UqfN69Nrzuzup7d6wFnMLXU=3D?=
X-OriginatorOrg: iwave-global.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 717eb4ef-ba85-44ef-29e0-08de121efde0
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 10:29:05.2385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 507ae903-cc48-4d6e-bdb6-35278120a345
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8DXThTHzrhaMBPSSmc2SduP7D4VS7js4UmLQYUGVqID8jU/s1fhgK4t94jFb8Nch/ugI8YN4nZytgye7wGH8O7wjvAbCLWOkZmqJpp0Y+HczBh1vCoPRr1cX+7GVY14
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0555
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=iwave-global.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DaqeWyuqJLGOWRbqtMWjjIWQ2NSO4I5279f1Uh2IsE=;
 b=W3jOl4Q7LHcSKNQ2wGI0tnnjhc4J9nwxGYF6IE3He+p1GAqrk7mG6idpxATtOluDS91Qkj2gP3zOioeD7ZavmkrtEX/fUulGkkNVJTtKv1gjTU3HDBl0S/ot1iLT18SA4nTFR53i7auQkCMCtjZbtKJN8EwVA8cX2j01OMKK44VkU0bdxwFQGi2S0w/azneXQKIt8ZQIqMBeT0Fmp/rQJL/849j0kVNqc6DAxE2auDgbUzxCTmJR4rSb8fC0ftf8Voxv/FTIIA0B1F5jfh2oMZdaqR4iFnIgqPc76H09sXWLSjo3TBMhi5D9O2U6v+HVXId3mhF9pMqIMOKpQX55DQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=iwave-global.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=iwave-global.com header.i=@iwave-global.com
 header.a=rsa-sha256 header.s=selector1 header.b=W3jOl4Q7
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
Content-Type: multipart/mixed; boundary="===============6518718185588619794=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6518718185588619794==
Content-Type: multipart/alternative;
 boundary="------------3NKg6ltaGzJFxGiaAIMkUqXF"
Content-Language: en-US

--------------3NKg6ltaGzJFxGiaAIMkUqXF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

WiFi firmware issue is resolved but while validation open network like 
without password it is connecting with password like WPA2 and WPA3 not 
working.

connmanctl> connect 
wifi_10322c69d5fa_4e65686127732053323420556c747261_managed_p
Agent RequestInput 
wifi_10322c69d5fa_4e65686127732053323420556c747261_managed_psk
   Passphrase = [ Type=psk, Requirement=mandatory ]
Passphrase? 12345678
Agent ReportError 
wifi_10322c69d5fa_4e65686127732053323420556c747261_managed_psk
   invalid-key

Kindly let us know the solution of this issue.

Thanks & Regards,

Esakkiammal M

------------------------------------------------------------------------


On 23/10/25 10:59, Esakkiammal M wrote:
>
> Hello,
>
> Kindly tell me the solution for this issue in build root wifi porting.
>
> Thanks & Regards,
>
> Esakkiammal M
>
> ------------------------------------------------------------------------
> On 16/10/25 11:07, Esakkiammal M wrote:
>>
>> Hello,
>>
>> I have enabled the MWIFIEX Wi-Fi driver in Buildroot for my platform. 
>> During validation, I observed that the driver fails to initialize the 
>> firmware properly. Please find the log details and observations below.
>>
>>
>> Steps Performed
>>
>> Enabled MWIFIEX configuration in Buildroot.
>>
>> Loaded the driver using the command:
>>
>>
>> modprobe moal mod_para=nxp/wifi_mod_para.conf
>>
>>
>> # modprobe moal mod_para=nxp/wifi_mod_para.conf
>> [   28.293486] mlan: loading out-of-tree module taints kernel.
>> [   28.332881] wlan: Loading MWLAN driver
>> [   28.336987] wlan: Register to Bus Driver...
>> [   28.341369] vendor=0x0471 device=0x0205 class=0 function=1
>> [   28.346989] Attach moal handle ops, card interface type: 0x109
>> [   28.352833] rps set to 0 from module param
>> [   28.359963] SDIW612: init module param from usr cfg
>> [   28.364906] card_type: SDIW612, config block: 0
>> [   28.369439] cfg80211_wext=0xf
>> [   28.372405] max_vir_bss=1
>> [   28.375018] cal_data_cfg=none
>> [   28.377984] ps_mode = 1
>> [   28.380435] auto_ds = 1
>> [   28.382879] host_mlme=enable
>> [   28.385765] fw_name=nxp/sduart_nw61x_v1.bin.se
>> [   28.390227] SDIO: max_segs=128 max_seg_size=65535
>> [   28.394921] rx_work=1 cpu_num=2
>> [   28.398063] Enable moal_recv_amsdu_packet
>> [   28.402098] Attach mlan adapter operations.card_type is 0x109.
>> [   28.408248] wlan: Enable TX SG mode
>> [   28.411751] wlan: Enable RX SG mode
>> [   28.416394] Request firmware: nxp/sduart_nw61x_v1.bin.se
>> [   28.642440] Wlan: FW download over, firmwarelen=1065364 downloaded 
>> 953164
>> [   34.648319] Fail to poll firmware status: firmwarestat=0x0
>> [   34.653811] FW failed to be active in time!
>> [   34.657996] wlan_dnld_fw fail ret=0xffffffff
>> [   34.662266] WLAN: Fail download FW with nowwait: 0
>> [   34.667216] SDIO Func0 (0x0-0x9): 43 03 02 02 03 00 00 02 03 00
>> [   34.673318] SDIO Func1 (0x10-0x17): 00 00 00 00 00 00 00 00
>> [   34.679151] SDIO Func1: (0x8) 00 (0x58) 00 (0x5c) 0d (0x5d) 00 
>> (0x60) 01 (0x61) 00 (0x62) 00 (0x64) 10 (0x65) 01 (0x66) 00 (0x68) 00 
>> (0x69) 00 (0x6a) 00
>> [   34.693708] SDIO Func1 (0xe8-0xff): 00 00 00 00 4c 8b 0e 00 24 14 
>> 70 c8 ab 37 80 00 00 00 00 00 01 00 00 00
>> [   34.803809] SDIO Func1 (0xe8-0xff): 00 00 00 00 4c 8b 0e 00 24 14 
>> 70 c8 ab 37 80 00 00 00 00 00 01 00 00 00
>> [   34.813727] woal_request_fw failed
>> [   34.817132] Firmware Init Failed
>> [   34.824576] Free module params
>> [   34.827631] woal_add_card failed
>> [   34.831003] wlan_sdio: probe of mmc2:0001:1 failed with error -1
>> [   34.837160] wlan: Register to Bus Driver Done
>> [   34.841535] wlan: Driver loaded successfully
>> #
>> # connmanctl
>> Error getting VPN connections: The name net.connman.vpn was not 
>> provided by any .service files
>> connmanctl> [   62.608517] cfg80211: failed to load regulatory.db
>> enable wifi
>> wifi is not available
>> connmanctl> exit
>> # ls /lib/firmware/nxp/
>> helper_uart_3000000.bin  sduart_nw61x_v1.bin.se uartuart_n61x_v1.bin.se
>> sd_w61x_v1.bin.se        uartspi_n61x_v1.bin.se wifi_mod_para.conf
>> #
>>
>> Could you please help me identify the reason for the firmware 
>> activation failure and guide me on how to resolve it?
>>
>>
>> Thanks & Regards,
>>
>> Esakkiammal M
>>
>>
>> ------------------------------------------------------------------------
>>
>>
>> On 15/10/25 16:38, Esakkiammal M wrote:
>>>
>>> Hello,
>>>
>>> My kernel and U-Boot are working fine under Yocto on this custom 
>>> board. The hardware includes Wi-Fi 6, Bluetooth 5.3, and IEEE 802.15.4.
>>>
>>> I’m now testing the same setup in Buildroot, but when I try to load 
>>> the Wi-Fi driver using:
>>>
>>> modprobe moal mod_para=nxp/wifi_mod_para.conf
>>>
>>> I get this error:
>>>
>>> modprobe: module moal not found in modules.dep
>>>
>>> It seems the NXP Wi-Fi driver (moal.ko) isn’t being built or 
>>> included in my Buildroot image. Could you please suggest the 
>>> recommended way to integrate the nxp-modwifi driver or any patches 
>>> required to enable it in Buildroot?
>>>
>>>
>>> Thanks & Regards,
>>>
>>> Esakkiammal M
>>>
>>> ------------------------------------------------------------------------
>>>
>>>
>>> On 15/10/25 16:30, Fiona Klute wrote:
>>>> Hi Esakkiammal!
>>>> Am 15.10.25 um 11:56 schrieb Esakkiammal M via buildroot:
>>>>> Hello,
>>>>>
>>>>> I have implemented support for our i.MX93 custom board by 
>>>>> referring to the i.MX93 EVK configuration.
>>>>>
>>>>> git clone https://github.com/buildroot/buildroot.git
>>>>> git switch 2025.02.x
>>>>>
>>>>> make freescale_imx93evk_defconfig
>>>>> make
>>>>>
>>>>> Can you tell how port WiFi and BT for imx93 custom board.
>>>>
>>>> It's impossible to give a definitive answer without knowing the 
>>>> details of your board, but in general:
>>>>
>>>> 1. If you have a custom board, you may need a custom DTS that 
>>>> correctly describes your board (instead of the default one) for all 
>>>> hardware to be detected correctly.
>>>>
>>>> 2. Make sure the kernel drivers for any additional hardware are 
>>>> enabled in the kernel config you use.
>>>>
>>>> 3. The defconfigs are intentionally minimal. You'll need to add the 
>>>> target packages to support what you want to do with wifi and BT:
>>>>
>>>> * any firmware needed for the devices on your board
>>>> * wpa_supplicant or iwd or hostapd, maybe NetworkManager too 
>>>> (depending on how you want to use wifi)
>>>> * bluez5-utils (probably) for BT
>>>>
>>>> Some of those packages have optional components that you may or may 
>>>> not need.
>>>>
>>>> Best regards,
>>>> Fiona
>>>>
--------------3NKg6ltaGzJFxGiaAIMkUqXF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hello,<br>
      <br>
      WiFi firmware issue is resolved but while validation open network
      like without password it is connecting with password like WPA2 and
      WPA3 not working.<br>
      <br>
    </p>
    <p>connmanctl&gt; connect
      wifi_10322c69d5fa_4e65686127732053323420556c747261_managed_p <br>
      Agent RequestInput
      wifi_10322c69d5fa_4e65686127732053323420556c747261_managed_psk<br>
      &nbsp; Passphrase = [ Type=psk, Requirement=mandatory ]<br>
      Passphrase? 12345678<br>
      Agent ReportError
      wifi_10322c69d5fa_4e65686127732053323420556c747261_managed_psk<br>
      &nbsp; invalid-key<br>
    </p>
    <p>Kindly let us know the solution of this issue.<br>
    </p>
    <p><span data-teams="true"> Thanks &amp; Regards,<br>
      </span> </p>
    <p><span data-teams="true">Esakkiammal M</span></p>
    <p><span data-teams="true"></span></p>
    <hr width="100%" size="2">
    <p><span data-teams="true"><br>
      </span></p>
    <div class="moz-cite-prefix">On 23/10/25 10:59, Esakkiammal M wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:a08cca53-7d11-4101-ac6f-b34de963d870@iwave-global.com">
      
      <p>Hello,</p>
      <p>Kindly tell me the solution for this issue in build root wifi
        porting.<br>
        <br>
      </p>
      <p><span data-teams="true"> Thanks &amp; Regards,<br>
        </span> </p>
      <p><span data-teams="true">Esakkiammal M</span></p>
      <hr width="100%" size="2">
      <div class="moz-cite-prefix">On 16/10/25 11:07, Esakkiammal M
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:5eb375f3-d026-4592-81f4-462548717d61@iwave-global.com">
        
        <p>Hello,</p>
        <p>I have enabled the MWIFIEX Wi-Fi driver in Buildroot for my
          platform. During validation, I observed that the driver fails
          to initialize the firmware properly. Please find the log
          details and observations below.<br>
          <br>
          <br>
          Steps Performed<br>
          <br>
          Enabled MWIFIEX configuration in Buildroot.<br>
          <br>
          Loaded the driver using the command:<br>
          <br>
          <br>
          modprobe moal mod_para=nxp/wifi_mod_para.conf<br>
          <br>
          <br>
          # modprobe moal mod_para=nxp/wifi_mod_para.conf<br>
          [&nbsp;&nbsp; 28.293486] mlan: loading out-of-tree module taints kernel.<br>
          [&nbsp;&nbsp; 28.332881] wlan: Loading MWLAN driver<br>
          [&nbsp;&nbsp; 28.336987] wlan: Register to Bus Driver...<br>
          [&nbsp;&nbsp; 28.341369] vendor=0x0471 device=0x0205 class=0 function=1<br>
          [&nbsp;&nbsp; 28.346989] Attach moal handle ops, card interface type:
          0x109<br>
          [&nbsp;&nbsp; 28.352833] rps set to 0 from module param<br>
          [&nbsp;&nbsp; 28.359963] SDIW612: init module param from usr cfg<br>
          [&nbsp;&nbsp; 28.364906] card_type: SDIW612, config block: 0<br>
          [&nbsp;&nbsp; 28.369439] cfg80211_wext=0xf<br>
          [&nbsp;&nbsp; 28.372405] max_vir_bss=1<br>
          [&nbsp;&nbsp; 28.375018] cal_data_cfg=none<br>
          [&nbsp;&nbsp; 28.377984] ps_mode = 1<br>
          [&nbsp;&nbsp; 28.380435] auto_ds = 1<br>
          [&nbsp;&nbsp; 28.382879] host_mlme=enable<br>
          [&nbsp;&nbsp; 28.385765] fw_name=nxp/sduart_nw61x_v1.bin.se<br>
          [&nbsp;&nbsp; 28.390227] SDIO: max_segs=128 max_seg_size=65535<br>
          [&nbsp;&nbsp; 28.394921] rx_work=1 cpu_num=2<br>
          [&nbsp;&nbsp; 28.398063] Enable moal_recv_amsdu_packet<br>
          [&nbsp;&nbsp; 28.402098] Attach mlan adapter operations.card_type is
          0x109.<br>
          [&nbsp;&nbsp; 28.408248] wlan: Enable TX SG mode<br>
          [&nbsp;&nbsp; 28.411751] wlan: Enable RX SG mode<br>
          [&nbsp;&nbsp; 28.416394] Request firmware: nxp/sduart_nw61x_v1.bin.se<br>
          [&nbsp;&nbsp; 28.642440] Wlan: FW download over, firmwarelen=1065364
          downloaded 953164<br>
          [&nbsp;&nbsp; 34.648319] Fail to poll firmware status: firmwarestat=0x0<br>
          [&nbsp;&nbsp; 34.653811] FW failed to be active in time!<br>
          [&nbsp;&nbsp; 34.657996] wlan_dnld_fw fail ret=0xffffffff<br>
          [&nbsp;&nbsp; 34.662266] WLAN: Fail download FW with nowwait: 0<br>
          [&nbsp;&nbsp; 34.667216] SDIO Func0 (0x0-0x9): 43 03 02 02 03 00 00 02
          03 00 <br>
          [&nbsp;&nbsp; 34.673318] SDIO Func1 (0x10-0x17): 00 00 00 00 00 00 00 00
          <br>
          [&nbsp;&nbsp; 34.679151] SDIO Func1: (0x8) 00 (0x58) 00 (0x5c) 0d (0x5d)
          00 (0x60) 01 (0x61) 00 (0x62) 00 (0x64) 10 (0x65) 01 (0x66) 00
          (0x68) 00 (0x69) 00 (0x6a) 00 <br>
          [&nbsp;&nbsp; 34.693708] SDIO Func1 (0xe8-0xff): 00 00 00 00 4c 8b 0e 00
          24 14 70 c8 ab 37 80 00 00 00 00 00 01 00 00 00 <br>
          [&nbsp;&nbsp; 34.803809] SDIO Func1 (0xe8-0xff): 00 00 00 00 4c 8b 0e 00
          24 14 70 c8 ab 37 80 00 00 00 00 00 01 00 00 00 <br>
          [&nbsp;&nbsp; 34.813727] woal_request_fw failed<br>
          [&nbsp;&nbsp; 34.817132] Firmware Init Failed<br>
          [&nbsp;&nbsp; 34.824576] Free module params<br>
          [&nbsp;&nbsp; 34.827631] woal_add_card failed<br>
          [&nbsp;&nbsp; 34.831003] wlan_sdio: probe of mmc2:0001:1 failed with
          error -1<br>
          [&nbsp;&nbsp; 34.837160] wlan: Register to Bus Driver Done<br>
          [&nbsp;&nbsp; 34.841535] wlan: Driver loaded successfully<br>
          # <br>
          # connmanctl<br>
          Error getting VPN connections: The name net.connman.vpn was
          not provided by any .service files<br>
          connmanctl&gt; [&nbsp;&nbsp; 62.608517] cfg80211: failed to load
          regulatory.db<br>
          enable wifi<br>
          wifi is not available<br>
          connmanctl&gt; exit<br>
          # ls /lib/firmware/nxp/<br>
          helper_uart_3000000.bin&nbsp; sduart_nw61x_v1.bin.se&nbsp;&nbsp;
          uartuart_n61x_v1.bin.se<br>
          sd_w61x_v1.bin.se&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uartspi_n61x_v1.bin.se&nbsp;&nbsp;
          wifi_mod_para.conf<br>
          # <br>
          <br>
          Could you please help me identify the reason for the firmware
          activation failure and guide me on how to resolve it?<br>
          <br>
          <br>
        </p>
        <p><span data-teams="true"> Thanks &amp; Regards,<br>
          </span> </p>
        <p><span data-teams="true">Esakkiammal M</span></p>
        <p><br>
        </p>
        <hr width="100%" size="2">
        <p><br>
        </p>
        <div class="moz-cite-prefix">On 15/10/25 16:38, Esakkiammal M
          wrote:<br>
        </div>
        <blockquote type="cite" cite="mid:3ac2065a-8ac7-4a59-9889-51fce1eae53d@iwave-global.com">
          <p>Hello,</p>
          <p>My kernel and U-Boot are working fine under Yocto on this
            custom board. The hardware includes Wi-Fi 6, Bluetooth 5.3,
            and IEEE 802.15.4.<br>
            <br>
            I’m now testing the same setup in Buildroot, but when I try
            to load the Wi-Fi driver using:<br>
            <br>
            modprobe moal mod_para=nxp/wifi_mod_para.conf<br>
            <br>
            I get this error:<br>
            <br>
            modprobe: module moal not found in modules.dep<br>
            <br>
            It seems the NXP Wi-Fi driver (moal.ko) isn’t being built or
            included in my Buildroot image. Could you please suggest the
            recommended way to integrate the nxp-modwifi driver or any
            patches required to enable it in Buildroot?</p>
          <p>&nbsp;<br>
          </p>
          <p><span data-teams="true"> Thanks &amp; Regards,<br>
            </span> </p>
          <p><span data-teams="true">Esakkiammal M</span></p>
          <p><span data-teams="true"></span></p>
          <hr width="100%" size="2">
          <p><span data-teams="true"><br>
            </span></p>
          <div class="moz-cite-prefix">On 15/10/25 16:30, Fiona Klute
            wrote:<br>
          </div>
          <blockquote type="cite" cite="mid:584f433e-3ace-4493-a073-7cb92eae6d08@gmx.de">Hi
            Esakkiammal! <br>
            Am 15.10.25 um 11:56 schrieb Esakkiammal M via buildroot: <br>
            <blockquote type="cite">Hello, <br>
              <br>
              I have implemented support for our i.MX93 custom board by
              referring to the i.MX93 EVK configuration. <br>
              <br>
              git clone <a class="moz-txt-link-freetext" href="https://github.com/buildroot/buildroot.git" moz-do-not-send="true">https://github.com/buildroot/buildroot.git</a>
              <br>
              git switch 2025.02.x <br>
              <br>
              make freescale_imx93evk_defconfig <br>
              make <br>
              <br>
              Can you tell how port WiFi and BT for imx93 custom board.
              <br>
            </blockquote>
            <br>
            It's impossible to give a definitive answer without knowing
            the details of your board, but in general: <br>
            <br>
            1. If you have a custom board, you may need a custom DTS
            that correctly describes your board (instead of the default
            one) for all hardware to be detected correctly. <br>
            <br>
            2. Make sure the kernel drivers for any additional hardware
            are enabled in the kernel config you use. <br>
            <br>
            3. The defconfigs are intentionally minimal. You'll need to
            add the target packages to support what you want to do with
            wifi and BT: <br>
            <br>
            * any firmware needed for the devices on your board <br>
            * wpa_supplicant or iwd or hostapd, maybe NetworkManager too
            (depending on how you want to use wifi) <br>
            * bluez5-utils (probably) for BT <br>
            <br>
            Some of those packages have optional components that you may
            or may not need. <br>
            <br>
            Best regards, <br>
            Fiona <br>
            <br>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------3NKg6ltaGzJFxGiaAIMkUqXF--

--===============6518718185588619794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6518718185588619794==--
