Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A43ACF64B1
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 13:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45241843A5;
	Sat, 22 Nov 2025 13:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9kFAJ7y6b-is; Sat, 22 Nov 2025 13:09:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0609D8436F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0609D8436F;
	Sat, 22 Nov 2025 13:09:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF80634E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E245C40D3E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9f_AxDp10fT for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 13:09:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d201::1;
 helo=as8pr04cu009.outbound.protection.outlook.com;
 envelope-from=ozandurgut.2001@hotmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F1A940C52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F1A940C52
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazolkn190110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d201::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F1A940C52
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:09:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2D9g0QWlR79lBSWGSkN244LeH0fJGEbujN9muD9mWB4oZEOr74VAhDkMXkrVuUsekd1H7hvcQNwJHHKjXIlHP5qymccGIFu/6tlM0irp8gyxh59KsIZGN0044LcdMWOXt88SFGmWHJ/KCL9149DLuv1VkK1HtantyR518YHZ+wzx4yVOgpLirbWahFaT1IaT4esASuc2f0vAHNoEkkCe2aqBgHVPiGBfdXb/KseG82+AE4PjnxarNN6aso5q/8Z1X+CbXZ1g3UBW3Uom7B3Bg1eq36RBMM+uxOGgsTkLi0NdiCRmhs9CTwjU1zNGM/N9mLpHFv3k3vXHz99F6aS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQMQ935YnIFmp4NzGGm8apruBXsNpPCPG/ggQxfFowo=;
 b=tcCWVTE9yCLmDLheNdSNWTbJFQLrYcfJjdY9vbbeXymOu7X/ZtFhRjWoYxIuwGoxLUJPHmWRo2FrFgEwJtoYW8GEVnOdwCU5JBedGoCmWEShlPAVBMV+j2qe7R+Q+8mZz+rU5cfgdFou3DEf12Y2cNQNYlKsU7YuAoU4/BeeQlxNxg71coHzIZE4UFSSuGrTSCfhwYQ+CQm52hgMAvlNUgV9HGjwzSamUuSfiWXcyG/alYLy2DpVTvpbA3kKgeQTm7QXeQ2IAPrZgQVfP7cf07l8kVI2ntrfbb9ov/0z7tBWXX8QnrELVqFNTadkeDoBnTQkypBv7Nbv6fXzPPWOgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DU2PPFBA6D4FC4D.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::aa0)
 by AS8P189MB2272.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:549::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 22 Nov
 2025 13:09:06 +0000
Received: from DU2PPFBA6D4FC4D.EURP189.PROD.OUTLOOK.COM
 ([fe80::630b:e9d:95ce:df37]) by DU2PPFBA6D4FC4D.EURP189.PROD.OUTLOOK.COM
 ([fe80::630b:e9d:95ce:df37%4]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 13:09:06 +0000
Message-ID: <DU2PPFBA6D4FC4D36A3F79A66448EBD2A21FDD2A@DU2PPFBA6D4FC4D.EURP189.PROD.OUTLOOK.COM>
Date: Sat, 22 Nov 2025 14:09:04 +0100
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
From: Ozan Durgut <ozandurgut.2001@hotmail.com>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::14) To DU2PPFBA6D4FC4D.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::aa0)
X-Microsoft-Original-Message-ID: <55277568-54d3-43df-9586-80c978856ad1@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PPFBA6D4FC4D:EE_|AS8P189MB2272:EE_
X-MS-Office365-Filtering-Correlation-Id: cbab33ed-ef22-49d8-b1b5-08de29c850b4
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|5072599009|461199028|6090799003|19110799012|8060799015|23021999003|12121999013|15080799012|39105399006|3412199025|440099028|40105399003|12091999003|56899033;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjBFT2JrRFVmQjJFckRPK3dZd2hEM3liMjRSZjh4MGpLMUZwb3NBUW5zd0JL?=
 =?utf-8?B?TU13RUhZazFTTW4ranJFWTB4RVpKaWo5M0NnYTBMaklKbkdHQkhzWVFvNnhr?=
 =?utf-8?B?Z0dMdlhObmxOakFMV3I4eU9TS281YjhmK2dQSVB3bmE4ZW1WQmpJT2JpU0dI?=
 =?utf-8?B?eWF5ZVZ5c3h5cytkTVZwckJXTHZ3WFlEd1NJSzA4bDEyd3IydHlMTVBvYmVz?=
 =?utf-8?B?WFFZZjRjZldmM0dKdFdJWkNSNm5FanBTWHc5ZlM3Nzc0Q3B5cnVJUU9FdVJG?=
 =?utf-8?B?ZHMzKy9yV1NyL25UVFZ2SXlRZWNUQzVxWlBHVW42V1hONDFhMEdxNDJmcmNU?=
 =?utf-8?B?NVBWNm4xSXkwM2NkYUFraXJUQzlvRXdLNUxKdEo4dXAwK0hxK1g5YXpWeGVr?=
 =?utf-8?B?ZFNtRWQvYnEzTmcrWlU4a3RwaUtUSXdwcmJDN1BGZ3BWMFhKMjBrSTU5eG45?=
 =?utf-8?B?dEZQWExHTmF0YUhOTVV6RjBRQldpbnZkeFF4RUxGbFBkN0hsMEdDdFNYVUxi?=
 =?utf-8?B?RlRveCs1SW9keGhjSkxmMXhIRzR3RUtsTHJDMUNxZ0tBakxwRE94aXZLaHVU?=
 =?utf-8?B?L1JGRlI1Wlp1Z0YyMTRjZ2NycWtKM1JlMEU5dCsxak56WVROREFLbXRZSDZs?=
 =?utf-8?B?eDF1eU40ZVd2RVQyQ1A1TGlhVU5Ea290VjVtQ21sSDVzWnU2VFJuRTBRMDh0?=
 =?utf-8?B?endrVmY4TEIyTkZFanVhTWJOV09ubkMyMFZjSmhIeUJqZWdNcVJkU1BFYXFX?=
 =?utf-8?B?ck5OVEN2eE82dVphWnhEZ3JPR0hlRVBMVmxrVUN2aTdvM3huSlFYSlpvcW1p?=
 =?utf-8?B?WEhsNkVhNjg2WG40Nm5Cb2V6WEVMeXlraWE4RDVYdnNvZHdHbTBrc2pnd2tH?=
 =?utf-8?B?VGczUm83VmlCMlp3YnhDOXJ0TzFkYjhabzhaRDI0cXUvd1RXS2NiOFJKWTVS?=
 =?utf-8?B?RUtYK0lUczF1YXVlakFSblZJbDlVV2gzaTc3bFp6UXpJbzQ3UjBDM3JxV21q?=
 =?utf-8?B?QjdVdm9vSUpzK2h4MjVrUDFmdzdoejBKamdvTFcvK2J5UWRDc0xZaUNlaHR6?=
 =?utf-8?B?MW1RMVZlMDlQZUF6UGl3bkZmS2R2L2JDVlcyaGIxNXlEaFkwTkpmU3h1Y3RD?=
 =?utf-8?B?cGtoTHFyRUhsM0ovRStBdWVDaWEyaENHbFRoc3JtM2dmZUgyWG9JZk5zSFdR?=
 =?utf-8?B?M1p1OG12L1hxUTJRYVBoNkxlUkxnQ1k0eHFhTUVwTTJVTG5aSENTZzlyZXJC?=
 =?utf-8?B?SGdWZXAveUFPNWRnQmpoZHRGaFRUZmM0QXNEeS83eU8rMEFjMEhJa0FUcHpy?=
 =?utf-8?B?cDQ2ZWJGVm1lT2wydFhrZ3dyY29ERnhBWUlsdTVGVHZxaDZTMFZSRzNNaXJ2?=
 =?utf-8?B?R3ZyMGhUVWsyOHpnQ0xQbFE4NUhLcTcwN0VGZytvWlZCY3Z1aXhxcFp6bUJ2?=
 =?utf-8?B?TUpra3pzL3VvWEhlaklPSjRDUUZMSENFd2duWGtzeS9MVno4eWhWb3Q0WUVh?=
 =?utf-8?B?b2c3SzB4dUxOUlhOL2dQYmN2WU9MZVNHSStKUnVsWjE0WWxKdVZxeDlqWlUw?=
 =?utf-8?B?cUZhSlJyMTM4WTY5OW05Qm1RU2tQQ2l0VTFzNmxTUFVTNVhLZEVBTlF3N2VG?=
 =?utf-8?B?TzB0cmg2aEdvQ3JsMnNZTHlBc2ZqRC9kTGZZbWgxMlpxVFBMU0UyM1lTWll1?=
 =?utf-8?B?K3FjbHdXZEhWS08vazlCNEdIN2Z6U2orOFhOcXh0OGVua2g1RWhlcjB3PT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUV6T1Vqa25NakExcGtOV2t6alhWS3F2ekQ4cFpReDRDWHhIa1FqblBhSzly?=
 =?utf-8?B?SnZyWjRreEduLzRzeEUrZHVpeWFlSW1QNHE1QklwWnBGYXdZZHpEQk9NdlBR?=
 =?utf-8?B?RXNlMnI5d0dGL2dwUlVqZjFDSDJTK2F5M0ZyQ293bW01U2Q3RUU0WFdaVG5Z?=
 =?utf-8?B?bXFlWUpTaThtWE1abU40NGhibGwvenVGQnltSTU4T25JZUN6TmV2eEtwWFNv?=
 =?utf-8?B?elc5Ni9PaVRMRGFvdzNlSUFEWXpMRjIyVmlBc3NVQlBFV2NZaHpTU1VXazZB?=
 =?utf-8?B?bkhCakFrQzdGVlVRVEJiYjVNekQ4YVhKY1dJN2lKamppbXZCRGE0RkxtZWEr?=
 =?utf-8?B?ZzRReUVHWjlUQU9PWXZ6anRvVDhMNklwUE9OU3JoMWpGV204UytrNkdvVS9l?=
 =?utf-8?B?Z1dmNm1yamZDWnkvYktwSkt1cjJsVFcrMktZZ28xdGVoR3ZVWkpnMHBPZFA5?=
 =?utf-8?B?L0IzaXdseTVnMS9GQkN0K2hlU0RHYUhoTHpOdFluanJBdTFCczVTMFZZYjEv?=
 =?utf-8?B?RnMxTmlpUXVwWWlFc1VJSkpFQ1p2ZGoxREM4WVJZT3Nhbjg2amRaS1YxYURR?=
 =?utf-8?B?R05pUm0vRGI4T3RJdjFrbTIxTXpXU0IzL2p1YVFSOVhMejN5OHYwQU55ZGtm?=
 =?utf-8?B?YTlsTzJPeXduZ21rVVlGeWNMK0ExZ3ZYL3RqM0ZrVDVpK21FVkV3cGRCcGVw?=
 =?utf-8?B?QzJhaTNLVTE4dHE3SzBnbzhzQTRDWWRId0NxRlBjc0tHTVpFRG8vSkdIdU9l?=
 =?utf-8?B?NFpnZWpEblU1b3hSUmMwTWNHdVhqK0xpVnBxSHRoYTFSeU01OWhJaGNzVlVO?=
 =?utf-8?B?RHpPclFYN3p0bXV3U0JaME5XVzQ3R05PcG5LKzlkK0FuUnVXUzhWL0NCdUtC?=
 =?utf-8?B?MzdWVHFSSkpQdEtCWkFHdDF5UzdXMkxkbDBGUDlJZ3NWVFFaRGdDSXVtUWVj?=
 =?utf-8?B?VW9FakVZbnlhbTEzUmFDU3dUSWpvUjA2TmYrZy9BcXZuMGk3bTVtY01iUCs3?=
 =?utf-8?B?TDdQQnY1dnlRUnNUaUFJYmZoTERvVGZTOEpQeUtMU2trNjltQ2Z0Q2pUak1C?=
 =?utf-8?B?bmZrelh0Q0kxWGRlU09KemhTMTBUZE5Ia1VuWXVQNVRmcWJaWXc2TGlxR0JM?=
 =?utf-8?B?Qm9FbUhzeWNPYmIwUm4xREE3dFZRclhZVmUrbXZLNU0yRmdJSytvdm5pRmZh?=
 =?utf-8?B?dWxMR1lIbU5HcnNva0wxRVlrUmNqV1ZYNG5OZDRIcXFhbGw4Z05sTHZ3b0ZY?=
 =?utf-8?B?bGRKK2thOVBUYThzcFkwMDg3bG9TblhWQllUWmFsMmhsakVMd1BGbXBwSU1Y?=
 =?utf-8?B?MDN0NmxGWHpOTnRiNU9oMHkxMjNoZkN4azVaU0Zrc21ocFAyYlVLVnU5Zmkw?=
 =?utf-8?B?V2NHNzJZOUp4Y0RlWVRDWjlCeW9rRFRRWjBlNFUzTHBXK2lMU2tydXZSZGpQ?=
 =?utf-8?B?N3VoU29uUnZSV2k0b0p4V3lOYTBXc0d1eU1iWVlXTEppVHJmdmlIcUMvWjFM?=
 =?utf-8?B?dHNCSk5hbjc1cVJrZ0swSjk1VjFjWE50REtVSjUwSVYzYkdBdHhuYWpFN0FI?=
 =?utf-8?B?TnNrWmRGakUrWnVPMFlSWDA5VldFQUNDYlJIYjhtd3ZrSTNlZStGZHBDL1hj?=
 =?utf-8?B?QkZDSlZWRjNOVEtFcVh0N2pDd0FSQnEyMFJDVG05SjNlU0pGZU5KdDdaSFlt?=
 =?utf-8?Q?Eq9ZqUznh2RF5oBO950v?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-2ef4d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: cbab33ed-ef22-49d8-b1b5-08de29c850b4
X-MS-Exchange-CrossTenant-AuthSource: DU2PPFBA6D4FC4D.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 13:09:06.1737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2272
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hotmail.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQMQ935YnIFmp4NzGGm8apruBXsNpPCPG/ggQxfFowo=;
 b=VOCQ7BsiZbtpN+fpSUs0ToJEuXYiWRJvKyh+wmDe61bsm9sE4ThZzNLWeDKvhSmxdAGCDjFTf64yg26wRic3AiVIxQ3iRAUmMOG9yrKVe1gbPIJYfxffv/P76imCQQwLGbqyU1CNY8DOLNuHMxOhr/CYWSwJic+3XnVkAqP8zrFyMNFtyavImcL+QvPTd7ThUgVpcfwLFvFgvNr1cjNUvdGh0PFwycju6IQ9+nttqN4yOONnoVzIGaWlWG1ZT7rz6NQJlOjM4rBMroRg00GXSAViwuQAXIqiZ1H3H9OmnV3ots2kv90JI67jUpTK93u5v4DdIScQHdLiikwrJj4Y2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=hotmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=VOCQ7Bsi
Subject: [Buildroot] Lack of conditional support for U-Boot Kconfig changes
 in Buildroot
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dear Buildroot developers,

I am reaching out regarding an issue we faced after upgrading to U-Boot 
v2025.10.

A recent upstream change in U-Boot (commit fb5235239aad) renamed two 
Kconfig symbols related to default environment files:
- CONFIG_USE_DEFAULT_ENV_FILE - CONFIG_ENV_USE_DEFAULT_ENV_TEXT_FILE
- CONFIG_DEFAULT_ENV_FILE - CONFIG_ENV_DEFAULT_ENV_TEXT_FILE

The older symbols were removed without backward compatibility, which 
makes it difficult to maintain a single Buildroot configuration that 
supports both pre- and post-v2025.10 U-Boot versions.

Currently, Buildroot does not offer a way to conditionally set 
configuration options based on the version. This limitation leads to a 
rigid setup, where supporting multiple U-Boot versions in a single 
Buildroot tree becomes unmanageable.

Would there be interest in extending Buildroot to handle such 
version-based conditionals, or is there an existing pattern the 
community recommends for this kind of case?

Looking forward to your input.

Best regards,
Ozan Durgut
Analog Devices

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
