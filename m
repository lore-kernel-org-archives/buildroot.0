Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11472C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98B8081E3B;
	Mon, 19 May 2025 10:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vlNuIi4DyGaj; Mon, 19 May 2025 10:04:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E79081E49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E79081E49;
	Mon, 19 May 2025 10:04:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CFAAEE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C053840D04
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOWeeMU-r6hv for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:04:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2607::610;
 helo=eur02-vi1-obe.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8542C40CF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8542C40CF7
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2607::610])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8542C40CF7
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:04:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LzL7Ro5cZP+K0TUMjeAzCyz8t32VrKiReV5NhV79iO7qig2Re+yp8MPTbTS6ine4vFHaM+nakOenNUzrnULKZ/mZn3Fs2Mov93KdJo45UAEO/d+aynz49pX0rxUbto/ocnpfhbHdyagsxHEcaH1b8ggUxtQywfwstiNbfYyne0Dz7nGkhQxbKL/Iaytw78ZrReGIibPuCGEP6cMyjq7i3X2uuUxr7dhY4gB4HsGT5pe0/lU7/UEYTMW8TO6kz4op5fsMF+hOOTO3yAtZtvEURNwEQAnbspYJsfTtlh1KgCizgu7s0i+9uQZ3TUMKifiKIPoYdRHU5RMIYUVYa/M09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1wIOZdo1dpzJMESJZY/t0UpiBv38TwbcE7ZZgc21kI=;
 b=tndUREpi1NCX6rLsssn3SRZmbVOLxq+VelUDK/2ONKhdG5lnnoDj5zhqcPT/zSnUexrrwLve6j3psaDWHKJErOaO0NdGGsZ6lAFIRvtjBHoSd1bf6qfIUgslAFLit1BbfNrz5Gm96EBNKyqN/Lo1Td0w3WaVfjNbL09Gl9FyutFv+odzsjuDmXZGzo03v2sZvPKkJ1zhLOkturaojxZBKFfAsKoUlDKr+KXQCxWboRN8WNDRwak/qpcRJl6DBHo/65DB7Dwuz3eEadagCOJv9Lw5+G8NDDNaPu5YtwSvfLIf/VXr2K67R0yDiFF3INpuj0Y38mSQaLt3CJHxiWqyiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB7784.eurprd04.prod.outlook.com (2603:10a6:20b:2ae::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Mon, 19 May
 2025 10:04:06 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 10:04:05 +0000
Message-ID: <0df93b13-7ecc-40b2-a7c3-ba7b51b94495@cherry.de>
Date: Mon, 19 May 2025 12:04:04 +0200
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>,
 Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
References: <20250415-libcamera-qcam-v2-0-84301a46a144@cherry.de>
 <20250415-libcamera-qcam-v2-1-84301a46a144@cherry.de>
 <65e477f4-54a5-4d5d-ab48-600a1913af73@rnout.be>
Content-Language: en-US
In-Reply-To: <65e477f4-54a5-4d5d-ab48-600a1913af73@rnout.be>
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 63eb8953-e436-4b3e-cf71-08dd96bc7d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|13003099007|41080700001; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1JkYVhla1AwUFduMzdsK3NkK3JPL282bzRsUEFYTEtrNEtudEdmYlRlamc3?=
 =?utf-8?B?bHZabWFQVjlNMEUrcHNxZEZua3N0OUlQQ0VRQkE3SGFTb0tscW8zYkdrckhD?=
 =?utf-8?B?WitUY1ptVVp6QlJEY2w5S1NEOERBQ1p6M1FhMS9JM0ZpVk5TZVdXaGxnZWoy?=
 =?utf-8?B?cjA0eHBmVmQwdVdYc0Q3Wk9lSTQvOEtXZldua2dXSEkraWJZdHBXKzBBTVln?=
 =?utf-8?B?U0RsUnk1eXQ5aDM5N0ZwT1lpSGo2WjdzMWFuemFlYlBtVnlLekhWWXlYSkN6?=
 =?utf-8?B?N3JuUzQ1cHpuTjRwOXdHZC94c1IyMFNZZ0JNbTBBQXBmaCtGNlE4MlUzQU5y?=
 =?utf-8?B?R2tTcEJSazNDZWd6dFhwSDNYVjU2Ky9wZFEzUDVMdFpLK1R5YnZVdjRpVnR1?=
 =?utf-8?B?S1FXbW9Ua0g3VFo3eXFRU3poYSt5WkhKR2c4OE9JYVJGOTR6YmIreHRGaDg3?=
 =?utf-8?B?SjZKVzNyZXNjQUpRVldzUjcxT1ZGMkF0YjlQUTFmSmU5SWdobitxYUZIcStJ?=
 =?utf-8?B?OG00a2JFVmtCSFkyQUpDSXM0QVZWVG05cUxrLzV3SGcrR1Z4WE0vc1lDdzJ6?=
 =?utf-8?B?SytnR1ZZaEE4Q1RlMlNyZWNybFZISk1CejNocmM1NUVwT293c2xVQjE1WE9M?=
 =?utf-8?B?Nmtjakg5aWl0aE5iL1Naei9nM0dXN0RidXBhdVhSbmhGS0dLRkNFbTBEUEt2?=
 =?utf-8?B?bkRFRjBzZEthekRtcDEwWkFWTzJxK0lSZzA5a3VmTXd6Q25PcUZBaGg0NnZ5?=
 =?utf-8?B?NHdqWGFOZW1SdTgwYzZxTDQvandOZ0ZEVmpmUGdIUG13dDZrSi81L1JPdlRk?=
 =?utf-8?B?dFF6WWQrbWV5TEliNnpscThsRjJWWW9wREw4WlA0cmVQL0hMV1poaVdTakow?=
 =?utf-8?B?MUtZZkpkd01IUGNERnpTREoxamEydHp1TGxqWGZRTndaZmlHSkVnTVNaSzBV?=
 =?utf-8?B?TWxEN2ZHallwdXBJV1hqZ0VnOEFiNUNvU096NUZRc09xZ2J3dmh2cFpSNldn?=
 =?utf-8?B?VHpwN1ptSGZwdmticUJQWmVZNHh1UWgwTmVNbzQ4SGgxZlRzMEQyWktQOC9V?=
 =?utf-8?B?Q0VWdndrUU5xMDF2OUx1RzZldVF1OURxNmdQOHlBMjBNWi9jTXdhM21JN0E0?=
 =?utf-8?B?NFdsWmd4QlpoYXhVWTlLQnVseU1NRWorNW9xM3pSMDhUcjN5QU9WNHRTTm9R?=
 =?utf-8?B?YjJNSWljRm1SRTM2WTg2bEQrS3owNGhHRVR5Z01ubzlxVzdycEdpSlZTNWF1?=
 =?utf-8?B?M3QvL3RTS3U0bGlFYU4rM29TSzBKZTVrT3JRY2NqZTVyMTIwZGFOWHJIZHBp?=
 =?utf-8?B?UkpNNHJ0OGhIN0V0cnFqSWVQbUZ1QVN6c2ZoRWpqUmIzM1dDQ0o5MVJpbERx?=
 =?utf-8?B?d05nSm84K0NLQW41OWxNM3ZxL0dZb1JYSHVUc0owVVJPWEhjNDVjSzgvdUJH?=
 =?utf-8?B?SG5ESWNMaFg0K01nZmNTSFdDcHlSbElFR3l5QUdrOGtOdUVPUDFnMzY4Uis2?=
 =?utf-8?B?VVJkOFVUcEpTS0paTjhsVTBJTWNXZkxEV3FIZlBiSzB0QkpKNlhTSDV0TzNt?=
 =?utf-8?B?Wi9YazF2RUdBSUVMbm9La1AyMldMUWdqZ1NpT0hmWnExMXBtNmFDL1AzUkRU?=
 =?utf-8?B?UEd4UXFuRUQ0dlZwTGlnek05WEZ2TVJXWVJsTnJrSHQvdmJMTzZPVGl1TUQx?=
 =?utf-8?B?b0wzMWlXdGhQQWRaa1hlTkF0bUNhY1BJWEt1K3BmcTJaY2liMkl2dXcyZ1hB?=
 =?utf-8?B?N2lyRFNUMWhvSDZtNmRmQXVrdkZxTkk3QmhRZWdUL292NHpkMkZiVEE2TDJh?=
 =?utf-8?B?ZHZFNzlPdnR5YU81cmRRT0lIcHJETHVYL2F1V2FWenBGOFdPV3VDU0JsOTlW?=
 =?utf-8?B?ZTAxOTR4UVlhRTJScEwvZXdDVFo1SzhmM3N1c1J6R3ZSeENNRWEreGlsZC9k?=
 =?utf-8?Q?NGG7TWcYwC8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjF4cFlLTXBza1pLL1dXZXVYc2lOdm5FRGh4N1JpMWV4UDRpTC9oQk5DY05F?=
 =?utf-8?B?bm1XcmxKbkFlVysyZ0pjYjY4OEpCZHNCTjVjYW5ZMU55SkxIdDV1WENFbnJX?=
 =?utf-8?B?RU9BSnRxTTdab0g3MzhEUDRuekljU1o2SzRMdVQvMjJVaVhTVHg3azQzbWZ6?=
 =?utf-8?B?MmJrOWsvakcwdmpkNTJqLzI3OWRLMlRXQnprRzYweUp1MlRzd3R2eW1mYkF3?=
 =?utf-8?B?dHRUdmdwcENVR2k0a2FJRUdEVDB3ZEZaSGRBRE9nS1BDS1FlMmoxUU5SY1BY?=
 =?utf-8?B?QTZPSGkvME5oVGZqamIyTEIyRlV0bFA5ZUtjWmhFOHc3QjNEN3JxN3RKTTNZ?=
 =?utf-8?B?NnIvUVZ2WVFNUWw3RE9yaVI4cnVXbnVOT2Z5dW9VNFl1c0JJUkE4NFg2Tk1j?=
 =?utf-8?B?STdOUFpjUGpQaWw4Q05DQ1JxK1A5WTRXVWJkQVp0SVdnNWtMVHNDbEJSTEdw?=
 =?utf-8?B?WXFzek5xZ1dQd0xrSUZnWFpOdUk1Z2VNWnhWTlYrYktoMXNDTkRFUTRvWVdv?=
 =?utf-8?B?NFlRaThneEVkM3FCQzRpY242dldib29TTEh4enk0dE1WaG1DeFNZT1FaMmMw?=
 =?utf-8?B?NVZRUTdlT0YxNDRVb3VtYldXTzdJTVVUdWFOZU40bUpsRnRlMldTRlZ5OThs?=
 =?utf-8?B?cUVra2xBaXFuY2c2bG5NUER4UmJUWk9WdUxUQXFlMHVndWxGOGNBMEFIcmg2?=
 =?utf-8?B?c3hyakNXc05NRTRvbG9ZUWk5VWFiVzJqSTFhd1dHNnJxSGdjcllFZ2IrcEtX?=
 =?utf-8?B?Q0x4WHg4ZXZxQXg3VWZ5OEJ4bUVvdHplZitvY002dHZCL3FucTZjUC94aEZq?=
 =?utf-8?B?YTZjYWdhRFpHdlN6NDgzNTFpQU00UURUZlZPYzYrTWEveUYydXVMQlpWTlJG?=
 =?utf-8?B?dHRMNE41WVBzTnVWMTJ2OVJuWHQ0YWlOYkNQa3BLSjlNRmZxdlN1VXplcHhz?=
 =?utf-8?B?OUlIc2gvTWloak52U3oydC8wRVdMcjRscHM2U3VMeGNTWDh0YjlLS3F0MkRM?=
 =?utf-8?B?VG5vNVZYemlzWXovYmRRSjh5UWdGWFl5TzcwZHhaZk03TUxRby9GZ3pyZkx2?=
 =?utf-8?B?eFJZVUlDMW5BL2JBRW1IUStEeFQyU1Zwczg1MzlJeDJuY1ppMFVSMjlsZmJ1?=
 =?utf-8?B?dy8raUUrczhHaWdLMDNYd0hDdnk4TGI5eXcybUt2V3I5NHpWelpSWFQ1MlFh?=
 =?utf-8?B?eFN2SEtyTlc0L3FGaStwMEMyMlR0eTNTZzg5WXZPaGprZnBDczFWaHAyaktK?=
 =?utf-8?B?Z1FOZGtISVRFcVA0NXhHNFF4YSsrYVh0Y0xkV3ZVcHpSZWRUYXFobmE4dys4?=
 =?utf-8?B?aUxoNTJZbWVqb0RUMElvUE5LZnVPQXZWVmd4c0t3R01ubm5vRGIyQnVWbSt3?=
 =?utf-8?B?WFNnU2ZWNWZiT1VLZzdVbDIwNm4wRXZ2NSsrenZKZXlaOTJqNTlPemhIcmtI?=
 =?utf-8?B?ektPMDU5bk5xMEpCRW81aWVnaDRDcnpxSURLeGJoa3Iwb1hyZzMyb3B0bFla?=
 =?utf-8?B?dy9EMk5kRmR4WHVTVDY5WERTbkRtUnFDQzN6cmlBTFp6cjRFcnRkM200a0c4?=
 =?utf-8?B?UWdNR0k1dmg4SVJGZEZqZjFhaGczdlVGQ1Mva3RYb2RZVDVMVC9ZVERxQnVB?=
 =?utf-8?B?SzU2WWVXb0dDU1dHRUlWNFZVaGJ6UVh1OGxRMjJ0c2YyaGxkMk9HL3NhcGRZ?=
 =?utf-8?B?SG15VlRNeFZYeWRLNENqNEE1ckdldHh5MEpIb3NCOENEZVVCeGxPWDZjUC9p?=
 =?utf-8?B?NVJqVG9xK1ZXYUpyZDBCRnNHVXBRZXRLNm4xQW9TeDFCd2tpei9IQ2NHQlV5?=
 =?utf-8?B?YldkNzJhS3k2UGN1REhVTXR5em5GeWJzQ2Fld0hRc3BQYk94Wjl3NkdqU09l?=
 =?utf-8?B?UVp2bEd3dXkva0g3bzdGSDE1R2dRWm1JYXloVHIxVXl2V2tvNHNXWnBFS3Jt?=
 =?utf-8?B?S3ZSTGVhUjlYS1BJYlBTVmtYOFdxNWJmZzM0NnV2QmI2czF5cXIwRW5Ebko0?=
 =?utf-8?B?dTE1TytkTms0a3JIZWE0U0hGUDZ2VlJBMGhKdWJ4NXdYVkVBYXd1d2RPMytr?=
 =?utf-8?B?aWhNRU9kVTBUNHAvYjNHWjVkVTBlOXRrK1IybkhNbDBCcXZYMGo1OEpKa29C?=
 =?utf-8?B?ZnNmY0s2M1ZqZHMwMkNOUnhXRElmc3BjclJxOWFMenAzd3ZEVWFXaWlYMlZU?=
 =?utf-8?B?Unc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 63eb8953-e436-4b3e-cf71-08dd96bc7d4c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 10:04:05.8203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZZKAlEwLCmx4if8v66u+fcRDRRbD98U9yauLlLG8qaxohCdPz/iqkKX2ssoMIrp14vghjdBsvY1nVf8lpnb+jnbPL5SKB5ouEUpUPFikDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7784
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1wIOZdo1dpzJMESJZY/t0UpiBv38TwbcE7ZZgc21kI=;
 b=Xfd+EHKREtzHDV4QW+W6iaENN+vw4hWw6snPcQQnDE18LK5HTgSWUlZgSPYqs5KC+fGk0Vxry1k/MMiJUXVaYni2cOgoxw6esOlQiSRKm3UwI0VyI+D+/26oFr1Pn2gf51LI4uAMrpKhFv6o4Zvm4F5obXJYcHDOlbKy4abyDhA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=Xfd+EHKR
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH v2 1/2] Makefile: add libexec to BR_PATH
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

SGkgQXJub3V0LAoKT24gNS8xNi8yNSA2OjA3IFBNLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90
ZToKPiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIGFybm91dEBybm91dC5iZS4gTGVh
cm4gd2h5IHRoaXMgaXMgCj4gaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRT
ZW5kZXJJZGVudGlmaWNhdGlvbiBdCj4gCj4gIMKgSGkgUXVlbnRpbiwKPiAKPiBPbiAxNS8wNC8y
MDI1IDExOjU3LCBRdWVudGluIFNjaHVseiB3cm90ZToKPj4gRnJvbTogUXVlbnRpbiBTY2h1bHog
PHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT4KPj4KPj4gTWVzb24gcXQ2IG1vZHVsZSBpcyBsb29r
aW5nIGZvciB1aWMsIG1vYyBhbmQgb3RoZXIgaG9zdCB0b29scyB0aGF0IGFyZQo+PiBub3cgaW5z
dGFsbGVkIGluIC9saWJleGVjIHNpbmNlIFF0IDYuMS5bMV0KPj4KPj4gU2luY2UgdGhlIGxpYmV4
ZWMgZGlyZWN0b3J5IGNhbiBjb250YWluIGV4ZWN1dGFibGVzLAo+IAo+ICDCoGxpYmV4ZWMgaXMg
bWVhbnQgZm9yIGV4ZWN1dGFibGVzIHRoYXQgYXJlIGNhbGxlZCBmcm9tIG90aGVyIHBsYWNlcyBh
bmQgCj4gdGhhdCBhCj4gdXNlciBzaG91bGQgbmV2ZXIgY2FsbCBkaXJlY3RseS4gU29tZXRpbWVz
LCB0aGV5IGhhdmUgdGhlIHNhbWUgbmFtZSBhcyBhIAo+IHJlbGF0ZWQKPiBleGVjdXRhYmxlIGlu
IGJpbiBvciBzYmluLgo+IAo+PiBpdCBzZWVtaW5nbHkgbWFrZXMKPj4gc2Vuc2UgdG8gYWRkIHRo
YXQgcGF0aCB0byB0aGUgQlJfUEFUSCBlbnZpcm9ubWVudCB2YXJpYWJsZQo+IAo+ICDCoFNvIG5v
LCBpdCBkb2VzIG5vdCBtYWtlIHNlbnNlIHRvIGRvIHRoYXQuCj4gCj4+IHNvIHRoYXQgUXQ2Cj4+
IGFwcGxpY2F0aW9ucyBidWlsdCB3aXRoIG1lc29uIGNhbiBmaW5kIHVpYywgbW9jLCByY2MsIGV0
Yy4uLgo+IAo+ICDCoEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgUXQgZGlkIHRoaXMuLi4gSXQgaW1w
bGllcyB0aGF0IHRoZXNlIHRvb2xzIGFyZSBubwo+IGxvbmdlciBtZWFudCB0byBiZSBjYWxsZWQg
ZGlyZWN0bHksIGJ1dCBvbmx5IHRocm91Z2ggcW1ha2U/IFRoZXJlIGlzCj4gZG9jdW1lbnRhdGlv
biBmb3IgY2FsbGluZyBtb2MgZnJvbSB0aGUgTWFrZWZpbGVbMV0sIGJ1dCB0aGF0IHdvbid0IHdv
cmsgCj4gaWYgdGhleQo+IGluc3RhbGwgaW4gbGliZXhlYy4uLgo+IAo+IAo+PiBpbiB0aGUKPj4g
QnVpbGRyb290IGhvc3QgdG9vbHMuCj4+Cj4+IEFub3RoZXIgYXR0ZW1wdFsyXSB3YXMgbWFkZSB0
byBtYWtlIE1lc29uIGxvb2sgaW50byB0aGUgQnVpbGRyb290IGhvc3QKPj4gZGlyZWN0b3J5IGJ1
dCBtYXliZSBpdCBkb2VzIG1ha2UgbW9yZSBzZW5zZSB0byBoYXZlIGxpYmV4ZWMgcGFydCBvZgo+
PiBCUl9QQVRIIGFueXdheS4gQm90aCBzb2x1dGlvbnMgdG8gdGhlIGlzc3VlIGFyZW4ndCBleGNs
dXNpdmUgdGhvdWdoLgo+Pgo+PiBbMV0gaHR0cHM6Ly9ldXIwMi5zYWZlbGlua3MucHJvdGVjdGlv
bi5vdXRsb29rLmNvbS8/IAo+PiB1cmw9aHR0cHMlM0ElMkYlMkZnaXRodWIuY29tJTJGbWVzb25i
dWlsZCUyRm1lc29uJTJGaXNzdWVzJTJGOTc5MSZkYXRhPTA1JTdDMDIlN0NxdWVudGluLnNjaHVs
eiU0MGNoZXJyeS5kZSU3QzI2ZDkzYTg2MzUwMjQ0M2UwYWNlMDhkZDk0YTM2Y2QyJTdDNWUwZTFi
NTIyMWI1NGU3YjgzYmI1MTRlYzQ2MDY3N2UlN0MwJTdDMCU3QzYzODgzMDE1MTgyODM2MjIzNyU3
Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpGYlhCMGVVMWhjR2tpT25SeWRXVXNJbFlpT2lJd0xq
QXVNREF3TUNJc0lsQWlPaUpYYVc0ek1pSXNJa0ZPSWpvaVRXRnBiQ0lzSWxkVUlqb3lmUSUzRCUz
RCU3QzAlN0MlN0MlN0Mmc2RhdGE9TmZONkVGMWVWN0xVYWRlRk9CZVdTWkFsWU1NQ2hKTSUyQnlv
YlNjMlNHZHh3JTNEJnJlc2VydmVkPTAKPiAKPiAgwqBJdCBzZWVtcyBpdCBoYXMgYmVlbiBmaXhl
ZCBpbiBtZXNvbiBub3cgWzJdWzNdIHNvIEkgdGhpbmsgd2Ugc2hvdWxkIAo+IHRha2UgdGhvc2UK
PiBwYXRjaGVzIChvciB1cGRhdGUgbWVzb24gdG8gMS44LjApIGluc3RlYWQuCj4gCgpUaG9zZSBh
cmUgYWxyZWFkeSBhdmFpbGFibGUgc2luY2UgMC42My4wIGl0IHNlZW1zLCBzbyB0aGF0IGNsZWFy
bHkgaXNuJ3QgCmVub3VnaCBmb3IgdXMgKG9yIHdlJ3JlIG1pc3Npbmcgc29tZXRoaW5nIGVsc2Up
LgoKPj4gWzJdIGh0dHBzOi8vZXVyMDIuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20v
PyAKPj4gdXJsPWh0dHBzJTNBJTJGJTJGZ2l0aHViLmNvbSUyRm1lc29uYnVpbGQlMkZtZXNvbiUy
RnB1bGwlMkYxNDM4MSZkYXRhPTA1JTdDMDIlN0NxdWVudGluLnNjaHVseiU0MGNoZXJyeS5kZSU3
QzI2ZDkzYTg2MzUwMjQ0M2UwYWNlMDhkZDk0YTM2Y2QyJTdDNWUwZTFiNTIyMWI1NGU3YjgzYmI1
MTRlYzQ2MDY3N2UlN0MwJTdDMCU3QzYzODgzMDE1MTgyODM4OTIyMCU3Q1Vua25vd24lN0NUV0Zw
Ykdac2IzZDhleUpGYlhCMGVVMWhjR2tpT25SeWRXVXNJbFlpT2lJd0xqQXVNREF3TUNJc0lsQWlP
aUpYYVc0ek1pSXNJa0ZPSWpvaVRXRnBiQ0lzSWxkVUlqb3lmUSUzRCUzRCU3QzAlN0MlN0MlN0Mm
c2RhdGE9d1hJYUZ2TXFQMThINkJTdVp0OVVBJTJCTlVYVzBRY2xOS1puT1BYM3VGbTRFJTNEJnJl
c2VydmVkPTAKPiAKPiAgwqBUaGVyZSdzIGFuIGludGVyZXN0aW5nIGNvbW1lbnQgdGhlcmUgWzRd
IHdoaWNoIHNheXMgdGhhdCB3ZSBjYWxsIG1lc29uCj4gaW5jb3JyZWN0bHkuIFRoYXQncyB1c2Vm
dWwgdG8gaW52ZXN0aWdhdGUgYXMgd2VsbC4KPiAKCkxvb2tpbmcgdGhyb3VnaCB0aGUgZ2l0IGhp
c3Rvcnkgb2YgdGhlIHF0IG1vZHVsZSBhIGJpdCBtb3JlLCBpdCBzZWVtcyAKbGlrZSB0aGVyZSdz
IGEgcGtnY29uZiBsaWJleGVjZGlyIHZhcmlhYmxlIGF2YWlsYWJsZSBzaW5jZSBxdDYuMywgYy5m
LiAKNDljY2Y4MTI0YWFlZGE0MzVlYzhjZDMxMTY3NDE4MzcwZTM2NDQxZC4gVGhpcyBhbHNvIHJl
ZmxlY3RzIHdoYXQgCkxhdXJlbnQgc2FpZCBpbiB0aGUgTWVyZ2UgUmVxdWVzdCBmb3IgbWVzb24u
CgpNZXNvbiBhY3R1YWxseSB1c2VzIGl0Li4uIGJ1dCBmcm9tIHRoZSB3cm9uZyBmaWxlLiBJdCB0
YWtlcyB0aGUgdGFyZ2V0IApvbmUgYW5kIG5vdCB0aGUgYnVpbGQgcGtnY29uZmlnLiBJZiBJIGFk
ZCB0aGUgcGF0Y2ggZnJvbSAKaHR0cHM6Ly9naXRodWIuY29tL21lc29uYnVpbGQvbWVzb24vcHVs
bC8xNDM4MSwgdGhlbiBpdCBsb29rcyB1cCB0aGUgCnByb3BlciBvbmUsIHdoZW4gbmVlZGVkLgoK
SSBhbHNvIGRpZCB3aGF0IEJhdGNoeXggc2FpZCBpbiB0aGVpciBjb21tZW50LCByZWJ1aWx0IGxp
YmNhbWVyYSBvbmx5LCAKbm8gY2hhbmdlIGluIGJlaGF2aW9yLgoKTm90IHN1cmUgaG93IHRvIGdv
IGZvcndhcmQgd2l0aCB0aGlzLCB3ZSdyZSBzdGlsbCBpbiB0aGUgc2FtZSBzaXR1YXRpb24uIApJ
IGRvbid0IHVuZGVyc3RhbmQgd2hhdCBlaXRoZXIgTGF1cmVudCBvciBFbGkgd2FudGVkIHRvIGNv
bnZleSBhcyAKcG90ZW50aWFsIGlzc3Vlcy4KCkNoZWVycywKUXVlbnRpbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
