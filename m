Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732E3C531F7
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 16:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15F2A40A4F;
	Thu, 23 Jul 2026 16:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4q9QvGup1yuH; Thu, 23 Jul 2026 16:19:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBB2740A47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784823579;
	bh=GX8Dt3sa+n9G/xYl/LHIAN+fzweOtfPhufSHACVyTEc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rWWNCg7P6/pRJvk3HgLe6656UPQObqjpDIyrJJd3o54iuVcBoXiLP6gYz3z2LUf2O
	 Ju/vKkSqBznqdkXnRX9R37SeR1PHrSuQ/RwgF9G0Dg+B80yuO2c4AfYkm+05eAzpul
	 aHt9witnScFnxjR95UElwHlnI523EUXAfzsDOM5IjW9IWbtm21uyUETuKwxG2Fdxf9
	 PZ8KzDv5HWb+SntXQfDdmFLX8ILanUOZlU9K9QEp5Spvxkyer1rGDNm/4JT6OQ0jjK
	 SGXwWtiKZaOGGnn0Uzi6dMb5+SpLbVeq3gUZmY+7tlyRHrWGUHJdz1goBgfLU7A7Kt
	 J9uN8Kcx4JbEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBB2740A47;
	Thu, 23 Jul 2026 16:19:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD4CF707
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 16:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B339140401
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 16:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OOlFwbHEkCVs for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 16:19:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::1;
 helo=db3pr0202cu003.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D492640149
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D492640149
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D492640149
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 16:19:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uO2xaSFr/L+hMVJ+E0Yf4YRtLRxroT0W0basA/jwWLzfSmMq4B39Wjg7auTeZbAu97DuCsngcHFptp8Hh6kTVijNpKEsIhAzxPJP6gwFhF/pIJn2Ma9AaDn09acB6IqvsnoTnVTT9PpdDpvLwSI+39YjvYIN0EwqO5yrCjycnjWDgKbhiQX16pC5M/h6fnDYVyhx0ffl6cam1aTjZxNMs3VDYl/+nAzUBX8ltZpLryJSLIFrCzavbViaY/zQE6tXeYnBiVwhrdJn7HJO/sPd7eWcwbG8W2ENuyvvugCTymGiTJqLJnSQtwpUZR1yAlRYeAi0zFDkfTwG0oX397PeDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqa1NadeLacBrcc5F8PEXT8EEdrtoLUsNPQrth/LC74=;
 b=nOOHWgQfvPeVdEzi2O3bEoZCaNGAErejDb9eWAHRlBzVWlIbi2p7PkHu7idMrPIRpcCqYXcMYuVLWNaXDWj6v2NW0/aiZyxDi1rnmKGULNpCrO8Hz7yP38+SUxhtwLc4zJN2PDcpbjYi221LSWikrzcqBy5KFocPV08IyoTkdzxgxwM8erCWUBVPhsSWbp6lsXxJbs9IH4aMeVMt02j2Utc91OTl7iK/S89/2JGBsI1PVO4RIOVGcNuPpagEiLzZdk5/SD/IqlAy38YFqWG8YVwTfYsy4DTT786jZkPAdUM8mWfe37oNMAnSyye8+W5zJHvlUIW0gsIn+zhiwR+Rhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PA4PR04MB9486.eurprd04.prod.outlook.com (2603:10a6:102:2a3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 16:19:33 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 16:19:33 +0000
Message-ID: <baef7f38-27fb-41b8-9b3d-881541d37055@cherry.de>
Date: Thu, 23 Jul 2026 18:19:31 +0200
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, Peter Korsgaard <peter@korsgaard.com>,
 Thomas Perale <thomas.perale@mind.be>
Cc: Quentin Schulz via buildroot <buildroot@buildroot.org>,
 Quentin Schulz <foss+buildroot@0leil.net>, Martin Bark
 <martin@barkynet.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <877bnm7aye.fsf@dell.be.48ers.dk>
 <20260626070140.4195-1-thomas.perale@mind.be>
 <87y0g163vm.fsf@dell.be.48ers.dk>
 <628553e6-5076-4374-ad62-3a49828c75dd@gmx.de>
Content-Language: en-US
In-Reply-To: <628553e6-5076-4374-ad62-3a49828c75dd@gmx.de>
X-ClientProxiedBy: VI1PR09CA0176.eurprd09.prod.outlook.com
 (2603:10a6:800:120::30) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PA4PR04MB9486:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ab3396-9a6c-4507-773e-08dee8d62e20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: fIW+PhYaH7NmqJ6deDOcqUeiMDJQ5Jum2UBAb2R9fGGf8660z6EKBf3R4AA1LT1TmANBRx32FBLLAVhpf0AMj0IjRSHMT32G7xX0aVeMp47SBUEM83TMSJyIc6wXyua4gzoJjQd0OBa4GLpGWAXIQEfPxGr5ji7kK7p8O9mlpShUcdq2jt+nf9MHASymLmCWNNK9oday5ls26drhzqkUiUnH5KEJQ+m59pk9ZXa0ASYVR/eBdA5cBckMlwHbYgWt7drQONJcc+4PqkHbrui/mTQ9myMypdIp7PiaMVWfGYUgIEipSov6fSbUPAJh8q8c6cSCMYd/Yc09a1hwX607F7xczi6+hDYm+eiQ5bUPWV2kW75UGWvIyowWYAdVzrlJARq5tGGfAIm0HfITa+CLgq4AZolkWm3FcLc1mXD1oWBNb4eGYEUYYMFSDi6h7wjPCYCO/NV2nZMt9H8ZWz4Hr25+GXUw2Cqt3p/WjNkCeMAYekYJTzTh+LSe71bYpILIDN1S3auIqdh1dOY4cnu46YZYW29I6D6avLSoSvb9ZwVXrAONbLVAO0rVdqySVWxNUbXg1XN3pSdk+0k0FS72tqjZjZMx+6AZR0JDjdjwaSrynB5aXeUzrqJfMszH78LlIN+5g0hd5BUUFXw9fNZoahteWTCCwQzsxTKTIzqGxb0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUZNL3QrMk5SL1lSOWYxNytKcGRDczVxR0ZkUnpKMHRMZzdha2tTMDhSdFB6?=
 =?utf-8?B?K2pHTlFtc3RPWUF5cEdLamplYlQ5b2VXWWFPRU5LOGFSU1B3NnA0UDVBVUt0?=
 =?utf-8?B?amd0ZmJZUTNwNkswVk1XTU9GcEEvOXJGVkRhRnU1NTl2cjRKT3JOSG5SVkZK?=
 =?utf-8?B?WWg4Q0pXUWF1UmMwVGM1ODhWK2RLSlhQaWw0UjZ0Q1FSUUliQ0I5WHcxbGZ2?=
 =?utf-8?B?bVdwajQyMllHeGhIL1lrMnc2MjJmM1M4L1FrWW4wcnVMOFlrRkJVZjE4QUZK?=
 =?utf-8?B?N3BKZGpGejV4dzNIdzBmNHVwM3dTckthd1lKNVFMbktjL3RCc050TkxPOEZT?=
 =?utf-8?B?Nzk4OHI2R212Q2ZjL21lUldPdFgyVzJzaTJXU0E0eTB0TFljbWNKMjlHZi9C?=
 =?utf-8?B?Yk9nbnpydHU2ZmltcHZwY3ZSdFhrczVGTkZlQWp1TC9lS0RKREdnWVI2eTUv?=
 =?utf-8?B?bjBhdWVOMkpLdkhQem9tWXpySWswZkwwOHhqSEtjQkhjRW9vdGlRaUVNZFgv?=
 =?utf-8?B?SElMZTFGTWRQYjJsSEJCeXNFN0ZsN3RUMlluZE9pYmY3RkE4U3Y4WjR4RTh1?=
 =?utf-8?B?ZjJRQXcyYmUvZFdIZDlOZ0RDak5scUNac2loRVFaZm5ZTTVQOEdRNnk5N2F1?=
 =?utf-8?B?bHd6SWhVTEU3bnB4eFM0c2JVYllYbnlZTWtSV3E5VFczNEFKNGRQT1BRUUxP?=
 =?utf-8?B?QnJUMm5aa25odFFnbmc3V1RvMVJQTGRqQit6clN3NElRRFpNL1JBYWgyRFNr?=
 =?utf-8?B?aHV1UElOSnNGcnhQak02dy9ZZFBJRllYNG84cFhVUE02bmdiK1Iwd1ZoL2Zy?=
 =?utf-8?B?dUNEZWszc0tCdDhpVHhTS2ljeVlRbVV2WGkzcFhSTmY4SVgrWFYvSk1pN0Zw?=
 =?utf-8?B?TGRVcnlHem1mRW9FR1ZLNmZHY2pnUy9xREN0cTRKSTRPS05Jb25ybVpTUGJu?=
 =?utf-8?B?bngyQ2lwL0dRcnZlNVR3YWdYOUI2S2lUUWlta2xybjdYckU1dVN1VXYwdkdW?=
 =?utf-8?B?U0l1dHlia0xBZTUyekFuMm51eFEwZXBFU2pmREJzNTFwd0lJNjg5bllmcTkx?=
 =?utf-8?B?amZ6TmdaeTM4cExTVTdaUWxxWDJJemlVREd5c2tONTB6L0plVGJRSWVYS1Zi?=
 =?utf-8?B?cThIdzVxVlRKN05QeVlPSFN1RzIxbndJZjVwZVJFc0RkY016Tk55WkNNWW81?=
 =?utf-8?B?RXNMRytyRjZYQnY2SGdvT2dxYWlLbm9tVFp0eWpDeGVsbkVsZnRwaVNyOG5K?=
 =?utf-8?B?Z3pkS09kMHU2QWRrWlRtcmYrbGJWN2V3dU9PZHBxcHc1Rm1nTmltMjhpZzhH?=
 =?utf-8?B?ckMwR0lzRWczbkQwV1VueFZ6YjFUdnNoY3ZZUjVzcHJtbnZJNmxjZjBVNkFi?=
 =?utf-8?B?TmVJQ2ZmTGJpeHI0TVBQRitQczJ2clRYSmlrZjhVOGdDMFFYWloyZGNyU21N?=
 =?utf-8?B?aFpRRjNZYVAveXAzbUNtWXF2N0hkeWVqN2cxdFdoTmRsNElLT1g3VnFZYXBQ?=
 =?utf-8?B?Y01TSGlQemd1ZEc4Yjh3YXh2MDladWhXL0J0N0FmTmJRYUFZM081Kys1cHpS?=
 =?utf-8?B?ZlByOEd0Sko2dkdDU29oVkVZN0l5RUFzNVd6bWYySnIvTUg5bHRnTUFadGdx?=
 =?utf-8?B?c3l0TlNoTTRkZ3Fobk9pd214Ui9qUjc4M2pIc1RQU2JmR3FWb3VjT1kxWUUy?=
 =?utf-8?B?VDV1RW1pK1R1VEw3UFlXWmM1L0lwTlhyWkttSTA0SUo2dTNTOXlIWnBLdmN4?=
 =?utf-8?B?Y3d1OUNKUzRPTnQyNkpOSGxJd1RnbEJlbzdRRHhtU0lOQ1lTSzdJdldNeE5Q?=
 =?utf-8?B?UW9nZTJxOVBqclNlRHdPaXBYV2ZnaUp6dUt1dlgxcDc2VGx2OXRNaXEzS3BS?=
 =?utf-8?B?TU9OSnRMZzc0dVlXbWFNSzJiYzdUa1MzNkVVNWRqaG5TeDZvcmxxTm1FOVRU?=
 =?utf-8?B?TFhYbHNWdkVzQzIrckZBcWVSMTR2eDVxUjI3UjZFNEFiS1pqbWtGL2d6Z0xT?=
 =?utf-8?B?NEI5Y1FLQUo3WDZkOUZQdmR5OTBmbUtUaEVOTmZOWGY1Zmw5TVFCZ1YyWElV?=
 =?utf-8?B?MkFwTFdoQUUvRThkc3FxTW15U1BjTWVvbjkzaDBnL0JDbjYwUlFwcXlnVmtj?=
 =?utf-8?B?dWdlV25LS3FQWXBhQTY1YlRoYXNjMXdzd1FIZit6aVpDT3dRMlErdTR0WE5N?=
 =?utf-8?B?c2orUTg2RkhVNFZJbnAwaTBWUFJXaXNkWjk4NWtvRVlwS2Y2L05tZ2c1Tk9X?=
 =?utf-8?B?VXhWdFZXYjF3L0g5OC9BbUNZYUxjeGxwLzZMM04rNURwYjZFTlczTEVqT2F0?=
 =?utf-8?B?MUl1SUlqWTYvMDJpSUYwam5TMnhvaHdwNTlCYnEzbXAvQy9TTWk4UT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ab3396-9a6c-4507-773e-08dee8d62e20
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 16:19:32.9791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FP1w99YoZD6Om+ZUA7e3RMmMiaD4/U5d7nggW6Fk8ZC63PzdD9mxllYKJfyDM5mlJnZCWGHT6UN/0lkTWdfqsqf2pGsBC9f5FHYUt1QUcQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9486
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqa1NadeLacBrcc5F8PEXT8EEdrtoLUsNPQrth/LC74=;
 b=mz1gvLMcQETBrQzpXviK+A1J66I7IfM0BahCEFyCCLwvtYPAjdkPt3TsJuHjKNXuxk55nX1CMk6B1E4mifgJHoiW9DT2Zx7NVlkbDfAQyqJ/FFwHkggKgUJZBakg9S+Eq6Fx9B5MOk5dngqpc9ymA2DJ0LDBaPO8En5Sw4sNYFA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=mz1gvLMc
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 0/4] make utils/generate-cyclonedx runnable
 with Buildroot host packages
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

SGkgYWxsLAoKT24gNi8yNi8yNiAxMjo0MSBQTSwgRmlvbmEgS2x1dGUgd3JvdGU6Cj4gQW0gMjYu
MDYuMjYgdW0gMTE6MzUgc2NocmllYiBQZXRlciBLb3JzZ2FhcmQ6Cj4+Pj4+Pj4gIlRob21hcyIg
PT0gVGhvbWFzIFBlcmFsZSA8dGhvbWFzLnBlcmFsZUBtaW5kLmJlPiB3cml0ZXM6Cj4+Cj4+IEhp
LAo+Pgo+PiDCoCA+PiBUaGVuIEkgdGhpbmsgdGhhdCB0aGUgcHJhZ21hdGljIHNvbHV0aW9uIGlz
IHRvIGRyb3AgdGhvc2UgbGlzdCB0eXBlCj4+IMKgID4+IGhpbnRzLiBUaG9tYXMsIEkgdGhpbmsg
eW91IG9yaWdpbmFsbHkgYWRkZWQgdGhlbSwgd2hhdCBkbyB5b3Ugc2F5Pwo+Pgo+PiDCoCA+IFN1
cmUgd2UgY2FuIHJlbW92ZSBpdC4gVGhhdCBsaW5lIGRvZXNuJ3QgYWRkIG11Y2ggcmlnaHQgbm93
Lgo+Pgo+PiBPSywgZ29vZCEgUXVlbnRpbiwgY2FuIHlvdSBzZW5kIGEgcGF0Y2ggcmVtb3Zpbmcg
dGhlbSBhZnRlciB2ZXJpZnlpbmcKPj4gdGhhdCBpdCB0aGVuIHdvcmtzPwo+Pgo+Pgo+PiDCoCA+
IEJ1dCB3b3VsZCB0aGF0IG1lYW4gdGhhdCBpbiB0aGUgZnV0dXJlIHdlIG5lZWQgdG8gbWFrZSBw
eXRob24gMy45IAo+PiBhIHBvdGVudGlhbAo+PiDCoCA+IHRhcmdldCBmb3IgYW55IG5ldyBjaGFu
Z2VzID8gVGhhdCB3b3VsZCBiZSBtb3JlIGFubm95aW5nIGluIHRoZSAKPj4gbG9uZyBydW4uCj4+
Cj4+IEkgZ3Vlc3MgeW91IG1lYW4gcHl0aG9uIDwgMy45PyBJdCBpcyBpbmRlZWQgYWx3YXlzIGEg
dHJhZGVvZmYuIE1heWJlIHdlCj4+IGNvdWxkIHN0YXJ0IHJlcXVpcmluZyBweXRob24gPj0gMy45
IGZvciB0aGUgMjAyNy4wMi54IHNlcmllcz8KPiBCeSB0aGUgdGltZSBvZiB0aGUgMjAyNy4wMi4w
IHJlbGVhc2UsIFB5dGhvbiAzLjkgd2lsbCBiZSBFT0wgZm9yIHdlbGwgCj4gb3ZlciBhIHllYXIs
IGFuZCAzLjEwIGZvciBhIGZldyBtb250aHMsIHNvIGF0IHRoYXQgcG9pbnQgSSdkIHByZWZlciB0
byAKPiBnbyByaWdodCB0byAzLjExICh3aGljaCBpcyBpbiBEZWJpYW4gb2xkc3RhYmxlIG5vdyku
IFBsdXMgaXQgYnJpbmdzIHNvbWUgCj4gbmljZSB0eXBpbmcgaW1wcm92ZW1lbnRzLgo+IAo+IElu
IGFueSBjYXNlIEknZCBkZWZpbml0ZWx5IGxpa2UgdG8gaGF2ZSBhIGNsZWFybHkgZG9jdW1lbnRl
ZCBtaW5pbXVtLCAKPiB0aGUgbWFudWFsIHN0aWxsIHJlZmVycyB0byBQeXRob24gMi43IGluIGEg
ZmV3IHBsYWNlcywgd2hpbGUgc3VwcG9ydC8gCj4gZGVwZW5kZW5jaWVzL2NoZWNrLWhvc3QtcHl0
aG9uMy5tayBsb29rcyBmb3IgMy40LiBJIHRoaW5rIGZvciBwZW9wbGUgCj4gd2l0aCB2ZXJ5IG9s
ZCBzeXN0ZW0gUHl0aG9uIHRoZSBwcmFnbWF0aWMgc29sdXRpb24gaXMgdG8gdXNlIGhvc3QtIAo+
IHB5dGhvbiwgaWYgdGhlcmUgYXJlIGFueSBpc3N1ZXMgd2l0aCB0aGF0IHdlIHNob3VsZCBmaXgg
dGhlbS4gOi0pCj4gCgpJIHRoaW5rIHdlIG5lZWQgdG8gZG9jdW1lbnQgYSBtaW5pbXVtIHZlcnNp
b24gb2YgUHl0aG9uIGV2ZXJ5IHNjcmlwdCBpbiAKQnVpbGRyb290IG11c3QgYmUgYWJsZSB0byBy
dW4gYWdhaW5zdC4KCkhvd2V2ZXIsIHRoZXJlJ3MgYWxzbyBhbm90aGVyIGlzc3VlIGlzIHRoYXQg
Zm9yIGJ1ZyBmaXhlcyB0byBzY3JpcHRzIAp0aGF0IHdlIHdhbnQgYmFja3BvcnRlZCB0byBMVFNl
cy4uLiB0aGUgY2hhbmdlcyBuZWVkIHRvIGJlIGNvbXBhdGlibGUgCndpdGggKG9yIGFkYXB0ZWQg
dG8gd29yayB3aXRoKSB0aGUgcG9zc2libHkgbG93ZXIgbWluaW11bSBQeXRob24gdmVyc2lvbiAK
aW4gdGhlIExUUyB2cyB3aGF0J3MgaW4gbWFzdGVyLiBJJ20gbm90IHN1cmUgaWYgdGhlcmUncyBh
IHRvb2wgdG8gbWFrZSAKc3VyZSB0aGlzIGlzIHRoZSBjYXNlLCBvciBob3cgd2Ugd291bGQgaGFu
ZGxlIGJ1bXBpbmcgdGhpcyBtaW5pbXVtIAp2ZXJzaW9uIHdpdGhvdXQgZm9yZ2V0dGluZyB3ZSBj
YW5ub3QgYmxpbmRseSBiYWNrcG9ydCB0byBMVFMgYnJhbmNoZXMgCnNpbmNlIGl0IG1heSBub3Qg
c3VwcG9ydCBhIG5ld2VyIHZlcnNpb24uCgpCdXQgeWVzLCBJIHRoaW5rIGJlaW5nIGFibGUgdG8g
cnVuIG91ciBzY3JpcHRzIHdpdGggdGhlIGhvc3QtcHl0aG9uIApidWlsdCBieSBCdWlsZHJvb3Qg
aXMgYSBnb29kIHdvcmstYXJvdW5kIHNvbHV0aW9uLgoKQ2hlZXJzLApRdWVudGluCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
