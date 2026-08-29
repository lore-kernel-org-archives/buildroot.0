Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E05C61DBE
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 11:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8CA6606A3;
	Sat, 29 Aug 2026 11:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0TZgsaBwKv4i; Sat, 29 Aug 2026 11:13:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788001994;
	bh=jvo+vcWgaoAR4uJj69tm5T06u8E38MRxWM1xHZFc9Ac=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f98qa5LqATLurYLdeAfRQeVLHxTynckTl0wOQt2z5FfYR+iebzcClM5xSSSem2Q1z
	 3UzGGlmK1+DUeC9AdoqDkGwZ9gGpwii4AZvlNkcbjQc8ItzhcqoulnPWczGubFrC19
	 WDlWVD52Ow+kqT5hvcNxBZmhi8Kfw0ulaQFPyE0k1iQXjUZTkZFaIMAyiz70r+fdhL
	 f8uBWxfNVYd4mFeOu9CekFi0nWa2K+fmSEaNO10ANIHDJbz/dudm1t9f0+ETdCLw3K
	 LDOn17b1FZSL8f8/BRRYVTZVwTSF35dMg2uXZzvzsKYY8al2Nef1aJDD0EQxjLoCIk
	 NpoXrMs/TOT8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEE7460644;
	Sat, 29 Aug 2026 11:13:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A65D334
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 11:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D04B400A5
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 11:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VleJj6ELOuYd for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 11:13:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40e::;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=k0v/YLOS
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40e::])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A81E4009A
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 11:13:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdBkdWAQhGM5KFvxN0aSEpT13/EEjCI0KJoNmTKhU5hTsyMvu8rXkk/43f9gtoCqvrHjh3DdLnZE1RGRMwP7UqvIlbzVqcFNCc/T+ci+Zj9RpC28O0KEazUbzSm+KUqhHVphZJOZdV+GpOkGJhMgRgXVfG303dkVw3pSNDlDtuZR4h6BgQLgGVt7fmd900qDF7DWUfKid/gE7GPzaL6rEiyP8nHJWgDIsXyFP5mpIee3BbwOu3qXZnxNMMkv5eKSuUQ8YCSaCwyU6idwlZIJG3MzlCp1a9xBrJjJ0jmB2UEyPCYuWs4dxs/skwsdOLfYwGcp4D2pgCzoOiEwTd7wUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xvMuDmpb2BbjvRosWXjpcgu0G9KiAfZTpNqMi8Ff6I=;
 b=Dp7Ez4eIvFiLswWBIfjGY/zS1kJ8Birhj599Nv7w7L3sZf2N/BoKmSYXluGk4m6pFo4WkJXOvOVldJJKaEnWSrnsqPaCl42Pll8rexlaDp0XdpHDRKSwIKlEb9+3oAmuK7DHuQlF/UQ2OYPbYUKltr4h2cR491mK6+dWoNysn2hz2VnDIcmJBu0Q0poMvaRJNqFW7fFwG8S6vE8Y0RtQsDRvM2HEtoO84Jy7rIQisRqX5eSr+ALwEtssLuoElsL1IdfYSyXAB2EyD4IkyCO0oY0BwB9qKDVJQaBffH2liAiS7AI056JC8/KuOxGS3u+cEw24R7sSjdlEldWfMCdD8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xvMuDmpb2BbjvRosWXjpcgu0G9KiAfZTpNqMi8Ff6I=;
 b=k0v/YLOSRadygVDXSnXlsP+4PdyXHC31P27of+9vyiqGk2XRsyPWAVjb+q0Ctc2y3qjirfxy3TZmUF8cTyHnf9g3D49weI5XwWksPZxPSdDxLvdJQGpDYOCqJmQiFe+V02JqattvH+6XFl8tLVMamlabH9JKN2xqyG9sxvbNi/YOy9T+6mCkgnmuJv6FFI+lhDEHarPC6VFlnZdwUVpUi8Uv9BDlU4mdgZou33Fu+GFdZLx8RZx1yWUoxdM3U4hiygU1KuI3VbXlkkdK5OpsV9+y6tANsxhNWIqaaz3s63tpe3he30rHRHF0saoM1VYlDVtlMP1dNt0Q272Yo/A03w==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY0P300MB0708.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:27d::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.12; Sat, 29 Aug 2026 11:13:05 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 11:13:05 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 29 Aug 2026 19:12:12 +0800
Message-ID: <SY8P300MB00410C376146872F9A78FBE6B5AB2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <SY8P300MB0041EFD8D13BF20DAB3D61FCB5AB2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB0041EFD8D13BF20DAB3D61FCB5AB2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-ClientProxiedBy: TP0P295CA0015.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::13) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20260829-missing-toolchain-deps-v1-3-1c2b4919c455@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY0P300MB0708:EE_
X-MS-Office365-Filtering-Correlation-Id: 368f8be3-28ee-417a-a5a3-08df05be7fc4
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|25010399006|21061999006|6090799003|5072599009|23021999003|19110799012|8060799015|24021099003|51005399006|15080799012|3412199025|440099028|26104999009|40105399003|2607281247196008|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b25UaVRRNDUvd3lhYmlSN3R3SnVqOHo1TWl6eWI4V2JpUnhsS05WMG51THll?=
 =?utf-8?B?NEdGNU1hUHBlTVpyc0oreGo3V3hyNUhNTGE2SEtJNmdXYjFtUUk2Z055OHkv?=
 =?utf-8?B?cnRLU0toZzZqTCt6WEJ5Y1puNktxVEhaV2JZSVNmQ3VBcG9raURiUXYrYVIw?=
 =?utf-8?B?bjhOaU5Za3hYWklEVTZIVUF2YWxLc0tkUkdlRkZCMWhVbEoxVjJyODhIZW5Q?=
 =?utf-8?B?ekJPZXYyV01pUEE2UWpvUzFHck16MFFDYzRLbHlQT2ZFR2tXbGhEWExwMkFa?=
 =?utf-8?B?dEdabHplZ1lXNWpTVVlFZUpRdER1Znd0MXhlT3RCTDR5STRUTkpacTZOa1ox?=
 =?utf-8?B?Z05qSmdsaGU0QTJiUkdUa3FTWHF5Y0liTGYrMFptL0R1UWdtU2s3eFJSa0pT?=
 =?utf-8?B?OVdqRnFjM1VrNEpZdnBQMGx0NTNQTDdvMnJ0NnI5a0xLNjhhOUFLUVhxczha?=
 =?utf-8?B?dlk4S0F3T1NtUmpRTFRZTUNxUkdlYnQ4TjgyeGp6TUgvRGtvc1dpMStpWXZt?=
 =?utf-8?B?bzYzbk5INmRBK2orVDdaTER0NHI4dW0zNGhla0lEclp0bWJvRm43S3A1UkZY?=
 =?utf-8?B?aFlyb2srTTZiWWx6QWxoM01vdDVySE8xeVZEOHhuL3MxOXJiczE5TUFIS0tP?=
 =?utf-8?B?RlBKZHN6U1E4Y2VGQSsrUVd0cEphajlYS0NaSk14WHB5UWZ1Q2hBeDJYdlhN?=
 =?utf-8?B?Q0pqeklvcW0xbWNDS0hCZG93cGd1bFprcUplTEg3Ui8wdEo2dUR4VDRicVE5?=
 =?utf-8?B?RFdBRDlJajFSZDhZc1FGc0ZmazhkMUdlTE8xWDFwMXlzL3VNN09kd0dJeXdU?=
 =?utf-8?B?TXZiZ05jcm16RmFmcDBjcEhTeG5jSXJDRVA3WnBpRlAvL0VqQ1hoNFZWSlNN?=
 =?utf-8?B?Nm9OTFAyUWlScmRyK3U4dlRqbFVZd1hGOElWdEMvNnJ2T0FONE9peDFDQTJh?=
 =?utf-8?B?NGxLM1A1TGMzd3BZdjY2ZS9Kei9TR2ZzZmozS1FKNzFCY1AzRE4yRnQ0WkYz?=
 =?utf-8?B?b25tMHZwUU1yNzBlNXpIbU9DTUwwMTg2c3BSUzZQK1RpSEt4azdqSVJiQWZM?=
 =?utf-8?B?MWIvODJtU3ZmYlgzRFBZam42ZkdGcE1pNVhDMXJ4MEwzeWI2eFVJU2dVZ0I0?=
 =?utf-8?B?V0NUL3A3TW1FalZ6cW16eVJ6VXhHWTBIYTBDODQrNkRqa3Z3WXV6L2xIa25O?=
 =?utf-8?B?S2hFRlFFeUg3TGZuQS9lUjlMVDRQSUtJRmF0V2Npa2NYZmd1WDJIRkhNbENi?=
 =?utf-8?B?S0RLSmsrQURwWTcxNllJK2FvRmpQMDc2Tk1EVFErMTdIb096TnNhRFNpdmxS?=
 =?utf-8?B?ZzlpUm5iU3lQYTVxTGRmdzE5dXQ0TXh4KzFpSmdaVURHZGIvZ0IzZFZwczdi?=
 =?utf-8?B?SC9lcllsbXNrYWc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzZFOXkvT0VhcWtkMjF3UmpCT1JvbVZ0RHVKTnV2OFpLMWZ3NmQ1QjZON3BU?=
 =?utf-8?B?dHkzM1hWR3krcnBPalE4UXRpZi9HUXl6NjMzUE9CLytSWUV4NWpvOFlTUlFx?=
 =?utf-8?B?VUZ2UVJ0Mlg0STM3UWppaGcrK3RhdGJpZ3Y3ckViU1diTjRobklIdHdENFlX?=
 =?utf-8?B?eGNob3V3RzI0YXVDUnZmaFV2d29leUpTeHlydHZKRzFERjFyeEJ3ay9md29k?=
 =?utf-8?B?dlA5OFRQTGR2RHZpdnFIS00rTm9KNnFzWEl1dVNpV1BSOGExSDFqYnk2UTF1?=
 =?utf-8?B?UHdwb3RFaytoczdnNit5cXQ5cGNCd0pSUjhlbktKR1hSYlRuS2dDSWdrMG9z?=
 =?utf-8?B?dXdSQWNkdHg0TWVxY0ZoWHdGZmZLMjk5OHFxWWV5RHdYVVYrY1dYOGxFSjV6?=
 =?utf-8?B?enVTWlJMazEvWHBzTGxiWmxRQ1hiVklZWlpuNG9aa0ZYSDVONjlEUHJvQi8y?=
 =?utf-8?B?UGtITWUrTkdiRUZ4dk5veXVibERIMXBoSUlNVW1LcTUzMUNkSDFqbjV2NFNJ?=
 =?utf-8?B?Wm9FbXUzTXpVMWMwRE1LQWpwaS9ScHkzU0FMNHdDeWR0Rk51WmNzQ0d3QXY2?=
 =?utf-8?B?U2Y1WEhyakNlNGJWczJpRVhadlM1S0NHdENGVDlObWljdm5UUDcrdGY3Qjh2?=
 =?utf-8?B?aGhLb2wrY0IrMWNHVElmUFk4WmZPWmhqZTVUNDU5U0ZYTVhWSWxnVFVKdEd1?=
 =?utf-8?B?MTd5TzlxajRmYTBHengrMjgwM1JnV0VoTE1jVXQ1a1ZYc1VSY3J0QUl5MWhX?=
 =?utf-8?B?dWhTQkN1MGM5cDY3cEtmZzVxMnNXMnRqMVZkakg0ZzZ6ZmtqS1hITW5XRXBC?=
 =?utf-8?B?cm1rVmZWUG1DeEtrQ1p1OGs4WnQzUVppMFNsTWh1UU1CaGFkMytPTUxueXVJ?=
 =?utf-8?B?Ym5FUEp5aUhUVCtHTURSQ3BldXRRM2hTakFaSWJyWlU1cy9PSVR2U1VSdjdO?=
 =?utf-8?B?dmIwbDdqRXJWbXhVeDJyTVltNEkwKyttbVRzOUswOGlLQ0t4cWtiQVFSTnRM?=
 =?utf-8?B?cWt6NmxmN3VxUXA4bEorSUpBT3pQMUZVcHdGb3NHdFRLTjZjSjBQb1k5NzE1?=
 =?utf-8?B?dGpWZVF1YnJua0lkakJlWmppTXUrVUhDR1dKU2dHVTNIb2RmTDBrTWR4emtS?=
 =?utf-8?B?MWppeXVZN0lTUzlXaUl5ZnJ3TSswRUZWMUh6ZDhmcVdISjduYUlDZFM0YmpL?=
 =?utf-8?B?bWJwTFJMWm9vZnRZU1JjdllBM1JKaEQxaHg1UDZRVjMrNVN1OVVkaXhxMHUv?=
 =?utf-8?B?SU16UGVKTmJUT283TFRqUW5BcjB1L0xMRklsdHNtZEVNQ1FSa09obExWVklG?=
 =?utf-8?B?ZDc1cXZieHYrcnV3RllmcHkyZEVpZmhUc1BRYWkvbE9oNlc3QmhVT0s5YThN?=
 =?utf-8?B?U3FCVGx1NVNKSHRRa0hnYWZ3bitBRkIwbmZGaEFnazVUaVE0K3ZXa0pybzZw?=
 =?utf-8?B?SFJsaU4rV0cxdVZpS3ZVYlJ2K2VDT0x5Qy9UYWhHRE1FaDZqdFdiSU9ZOGpT?=
 =?utf-8?B?T1laWU50Mi9tVG8vWXNVNnBudkVPclNRTWZtejBXL1pvSDVWaXhZMzR3NTFH?=
 =?utf-8?B?M0d6THdCWjJHZDJQR3pZcTdpVmtUOFVaVVlzSThGa1dreWRWNVFtY2w4RHVw?=
 =?utf-8?B?Rk5PNTY3SndWdjI2RmlMQThDZUltODEzNUZpS1Zkc21LSzFwSUcvUjErQkZo?=
 =?utf-8?B?d25DT2EyS1N2TUY0TGRkWU0zckNYSVIzSFdKNDNrN0MvRWo5U1ZxdC9UZWF4?=
 =?utf-8?B?TjdXMkEzWkVVbWExbVdraUNZaVRYUTVIVWRjUUFjL0pMSmZ5ZnJtZTN0bW5v?=
 =?utf-8?B?dk4rM0YvZEJzTTY5THBQRHVCV29KN0FRTXlRY0VWYkZIa2g3ZWVOSzkyVHFp?=
 =?utf-8?Q?mFe/NDo/cLSMT?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 368f8be3-28ee-417a-a5a3-08df05be7fc4
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 11:13:05.8181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY0P300MB0708
Subject: [Buildroot] [PATCH 3/3] support/testing,
 toolchain/toolchain-external/toolchain-external-bootlin: regenerate
 after MMU dependency update
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Regenerate the Bootlin toolchain Kconfig and test configurations using
support/scripts/gen-bootlin-toolchains.

This adds BR2_USE_MMU to the affected uClibc entries and to the
architecture support conditions, and updates the generated tests.
The glibc and musl changes only reorder their existing BR2_USE_MMU
dependencies.

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 .../tests/toolchain/test_external_bootlin.py       |  8 +++++++
 .../toolchain-external-bootlin/Config.in.options   | 28 +++++++++++++---------
 2 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/support/testing/tests/toolchain/test_external_bootlin.py b/support/testing/tests/toolchain/test_external_bootlin.py
index 6bcebf80c0..ecbb364642 100644
--- a/support/testing/tests/toolchain/test_external_bootlin.py
+++ b/support/testing/tests/toolchain/test_external_bootlin.py
@@ -2223,6 +2223,7 @@ class TestExternalToolchainBootlinRiscv32ilp32dGlibcBleedingEdge(TestExternalToo
         BR2_riscv_g=y
         BR2_RISCV_32=y
         BR2_RISCV_ABI_ILP32D=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE=y
@@ -2240,6 +2241,7 @@ class TestExternalToolchainBootlinRiscv32ilp32dGlibcStable(TestExternalToolchain
         BR2_riscv_g=y
         BR2_RISCV_32=y
         BR2_RISCV_ABI_ILP32D=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_STABLE=y
@@ -2257,6 +2259,7 @@ class TestExternalToolchainBootlinRiscv32ilp32dMuslBleedingEdge(TestExternalTool
         BR2_riscv_g=y
         BR2_RISCV_32=y
         BR2_RISCV_ABI_ILP32D=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_BLEEDING_EDGE=y
@@ -2274,6 +2277,7 @@ class TestExternalToolchainBootlinRiscv32ilp32dMuslStable(TestExternalToolchain)
         BR2_riscv_g=y
         BR2_RISCV_32=y
         BR2_RISCV_ABI_ILP32D=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_STABLE=y
@@ -2291,6 +2295,7 @@ class TestExternalToolchainBootlinRiscv32ilp32dUclibcBleedingEdge(TestExternalTo
         BR2_riscv_g=y
         BR2_RISCV_32=y
         BR2_RISCV_ABI_ILP32D=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_BLEEDING_EDGE=y
@@ -2308,6 +2313,7 @@ class TestExternalToolchainBootlinRiscv32ilp32dUclibcStable(TestExternalToolchai
         BR2_riscv_g=y
         BR2_RISCV_32=y
         BR2_RISCV_ABI_ILP32D=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_STABLE=y
@@ -3332,6 +3338,7 @@ class TestExternalToolchainBootlinXtensalx60UclibcBleedingEdge(TestExternalToolc
         BR2_xtensa=y
         BR2_XTENSA_CUSTOM=y
         BR2_XTENSA_LITTLE_ENDIAN=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE=y
@@ -3348,6 +3355,7 @@ class TestExternalToolchainBootlinXtensalx60UclibcStable(TestExternalToolchain):
         BR2_xtensa=y
         BR2_XTENSA_CUSTOM=y
         BR2_XTENSA_LITTLE_ENDIAN=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE=y
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index e8c5301780..f59c6aed5e 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -11,7 +11,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_arm && (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
 	default y if BR2_armeb && (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
 	default y if BR2_arm && BR2_ARM_CPU_ARMV7M && BR2_BINFMT_FLAT
-	default y if BR2_m68k_m68k
+	default y if BR2_m68k_m68k && BR2_USE_MMU
 	default y if BR2_m68k_cf
 	default y if BR2_microblazebe
 	default y if BR2_microblazeel
@@ -30,7 +30,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_powerpc64 && BR2_powerpc_e6500
 	default y if BR2_powerpc64 && BR2_powerpc_power8
 	default y if BR2_powerpc64le && BR2_powerpc_power8
-	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_32 && BR2_RISCV_ABI_ILP32D
+	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_32 && BR2_RISCV_ABI_ILP32D && BR2_USE_MMU
 	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_64 && BR2_RISCV_ABI_LP64D && BR2_USE_MMU
 	default y if BR2_s390x && BR2_s390x_z13
 	default y if BR2_sh && BR2_sh4
@@ -44,7 +44,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_x86_64 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2 && BR2_X86_CPU_HAS_SSE3 && BR2_X86_CPU_HAS_SSSE3 && BR2_X86_CPU_HAS_SSE4 && BR2_X86_CPU_HAS_SSE42
 	default y if BR2_i386 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2 && BR2_X86_CPU_HAS_SSE3 && BR2_X86_CPU_HAS_SSSE3
 	default y if BR2_i386 && !BR2_x86_i486 && !BR2_x86_i586 && !BR2_x86_x1000 && !BR2_x86_pentium_mmx && !BR2_x86_geode && !BR2_x86_c3 && !BR2_x86_winchip_c6 && !BR2_x86_winchip2
-	default y if BR2_xtensa && BR2_XTENSA_CUSTOM && BR2_XTENSA_LITTLE_ENDIAN
+	default y if BR2_xtensa && BR2_XTENSA_CUSTOM && BR2_XTENSA_LITTLE_ENDIAN && BR2_USE_MMU
 
 if BR2_TOOLCHAIN_EXTERNAL_BOOTLIN
 
@@ -1087,8 +1087,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_BLEEDING_EDGE
 	bool "m68k-68xxx glibc bleeding-edge 2025.08-1"
 	depends on BR2_m68k_m68k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -1110,8 +1110,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_STABLE
 	bool "m68k-68xxx glibc stable 2025.08-1"
 	depends on BR2_m68k_m68k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -1132,8 +1132,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_BLEEDING_EDGE
 	bool "m68k-68xxx musl bleeding-edge 2025.08-1"
 	depends on BR2_m68k_m68k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -1155,8 +1155,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_STABLE
 	bool "m68k-68xxx musl stable 2025.08-1"
 	depends on BR2_m68k_m68k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -1177,6 +1177,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE
 	bool "m68k-68xxx uclibc bleeding-edge 2025.08-1"
 	depends on BR2_m68k_m68k
+	depends on BR2_USE_MMU
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -1200,6 +1201,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE
 	bool "m68k-68xxx uclibc stable 2025.08-1"
 	depends on BR2_m68k_m68k
+	depends on BR2_USE_MMU
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
@@ -3455,8 +3457,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -3481,8 +3483,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_STABLE
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3506,8 +3508,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_BLEEDING_EDGE
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -3532,8 +3534,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_STABLE
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3557,6 +3559,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_BLEEDING_EDGE
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
+	depends on BR2_USE_MMU
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -3583,6 +3586,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_STABLE
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
+	depends on BR2_USE_MMU
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
@@ -5411,6 +5415,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE
 	depends on BR2_xtensa
 	depends on BR2_XTENSA_CUSTOM
 	depends on BR2_XTENSA_LITTLE_ENDIAN
+	depends on BR2_USE_MMU
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -5436,6 +5441,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE
 	depends on BR2_xtensa
 	depends on BR2_XTENSA_CUSTOM
 	depends on BR2_XTENSA_LITTLE_ENDIAN
+	depends on BR2_USE_MMU
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4

-- 
2.55.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
