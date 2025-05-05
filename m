Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693A1C3ABAA
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 15:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E55AF81159;
	Mon,  5 May 2025 15:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D51L9k6dpXBt; Mon,  5 May 2025 15:36:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9E6F8119E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9E6F8119E;
	Mon,  5 May 2025 15:36:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 937DC183
 for <buildroot@buildroot.org>; Mon,  5 May 2025 15:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63E62607DF
 for <buildroot@buildroot.org>; Mon,  5 May 2025 15:36:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_J50kRDJVCR for <buildroot@buildroot.org>;
 Mon,  5 May 2025 15:36:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::7;
 helo=am0pr02cu008.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2D3066065E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D3066065E
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::7])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D3066065E
 for <buildroot@buildroot.org>; Mon,  5 May 2025 15:36:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWwV7wLjNobGpQ4i1RzTmoxvKzLb1iNJmTPp7CE1Vm9TDM/qlbZUSWsF/GjC5tV94fLIomK6TX9yPTgRpD+Fki7txDrJcQ2myT09uZpuzd6oSnWiJ48kt38rj19JfcNyOTDOxg1uxW1v2VvGGUvIZfpobnCe+meFLbQeUcVfmjfKS8zAv25I5hnYpmIvEACGiWJU5DyhT/PZ1LQOfLY43ZJ6Sa6RCjfTwVlsrxdhWlbBmXwGDS+Eb68YTmludjLoqjEOkjGwJPMnhWABEUk1YwQEDJYBGSLC+rhxOCNMOKREFXqTEQpkwe7nnEjZlc2LgIqFactBz1GSdiQABBRbug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aa1iDD3qCy1nHO/r097gIXctPmapLCT7jmTVemOYWRo=;
 b=wU7nD5+KC0ETfxmnukjgORdpTfGvbliKQEKyyr8V/mF2WpZbjKKVJj6LxVB6OCFghhCazqi8zz7I0P/KMmCjyNRoQKyegw9NwYvU4IJ0jcasidi0fRXJeCIrtIkJx+Kih7Y8zPFGtsbeCUx1clwv0P1gbABDJGuV6F9ydRbFqhyAYUYgsbXvWr4qjGj5JNVrF4Q+cuAUAlWBWQKOdSEe0kbQdPEYkkk6+gTy6Q8IkQ5vLHDvYa3HXjYCb/PsB9cp84UxxXwLqxIYz+83323cY7+Z+TPmFSkmvY0BBfxFGxMKY5PJCrMa+9O0TJo8/higZtLMwu9n8JLkbAptTHVxlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB10268.eurprd04.prod.outlook.com (2603:10a6:800:21f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Mon, 5 May
 2025 15:35:54 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 15:35:54 +0000
Message-ID: <6297a044-5c1e-4ac8-80e2-68f32194547e@cherry.de>
Date: Mon, 5 May 2025 17:35:53 +0200
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
References: <20250224-libwebsockets-zlib-opt-v1-1-16419ae3e82b@cherry.de>
Content-Language: en-US
In-Reply-To: <20250224-libwebsockets-zlib-opt-v1-1-16419ae3e82b@cherry.de>
X-ClientProxiedBy: VI1PR04CA0096.eurprd04.prod.outlook.com
 (2603:10a6:803:64::31) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB10268:EE_
X-MS-Office365-Filtering-Correlation-Id: db531154-52a3-4007-ff60-08dd8bea85c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzVEaFJqbG9OVlpneUphbmJXcVhVQlB5YThBQWd5Z21OSy80a013bVRtRTVB?=
 =?utf-8?B?VDNRdG91SXZpSTVMWUJ5SWUxR0hsa2VhNkh4NFlSMk53dG9NU2U0ajBrN3N6?=
 =?utf-8?B?Wll0dFozaUIxQmZYUFRqWXY5dE5wU2Zqang3MEpzSXQ5SlBpaU5QNUIxNXg5?=
 =?utf-8?B?T3ZWMkpQQ05tUElIYnVhWW9LL01hOXZ2REI1MlNYVUtZSGtKa29kVFJTTWsz?=
 =?utf-8?B?clM0bmkrWjV3dVkwTXR1enMrME1OSEM1YmNybkxBbHE0R1B1L1JRdlYyb29Y?=
 =?utf-8?B?MWNSdDdHR3RWTTJhTHRVVm9PUi81S3AzeGs0UzNWL3IzRXNrSlBnVytUNTR1?=
 =?utf-8?B?STFtbGpNdmR1NUc4eHBsL24zaEpVcVFXMEVjVStZY2MwcnVSQ3dJVWFDNDlx?=
 =?utf-8?B?ODlWdjFVN1ZxSkN3ajI4Z2tiRklHdHdjZjEvWDAybW14M1EraTZkdVhURHhw?=
 =?utf-8?B?ODk4N0RCUGRjc0VOb1NHOGJpcjN0MGI0bzJybHIwdkp6NmozMmw0eFZVdUZi?=
 =?utf-8?B?S0d6RUxnd1FTU3JzVHE3TzZLeERXVGdJOVBtdW9IZk0rcnROeS9Ob0F0R3VU?=
 =?utf-8?B?U1IrUXBYVzVENzkwVGxpRGRJTGRCZVVhT25qNWhiakxWMXlFOTlPMi9XZGQ4?=
 =?utf-8?B?bkxCMUVlckV3b01id0xHSmo3Rm00WFJ5QnJLYXh3bklscTlYYVp4QUt0YStH?=
 =?utf-8?B?K0FtRGw5SHZ4Qno0QUpsMjRueUNXeFRXWGJxT2tqeWlyamJ6WUxwSFNtNEd5?=
 =?utf-8?B?N1htYnkrdSt1SnhtOExjU3RrU0gxNzcxdE0vdmk3L3huZTRmcmJnL0NYVDdX?=
 =?utf-8?B?TWpqcTBvcldyTnlzWmFxSkJnMlJrcEhzWVpndW5ySHhaSXkzSnpYRmV3dUZO?=
 =?utf-8?B?ejRFWDBPR2UwbTJsMTdReTJlUXU3TldlQ0REdHY4UWs5YzdCR1ZLT0ZKUlE5?=
 =?utf-8?B?bGpRd1BIRGVZREZxNUtUVGNySFpJV3BZQ044elRkamVFSTBGRlNCc0g4TWpp?=
 =?utf-8?B?cVNidlBiMi92ZGlRaE54ZDdxZGdtL2pkb0tBYVJsa29VcFkrK3hGOHZlZWlv?=
 =?utf-8?B?VGhZY2dHUno1ZTRHSjFMVWM0VHpPSzdPTXBRS05wKzJyWVlxekxuZEwxMHdn?=
 =?utf-8?B?bzZJWUxXaUpRK3UwbHNQV0ppZjVaS0ozNzFaWXIweGVKcC9IUExFOTZEbUwx?=
 =?utf-8?B?Y0FLRlFvcjlWeTE1UkEyYlcwUW5FZ1VyWGRlR1dKazlaQmlvMU40aGVwbkpw?=
 =?utf-8?B?Q3ZVT2Q4WWhpeDE2M1RWSER1OGpMVlZjU1o4N2JQNmhqbktvL3ZVTjhxSXVY?=
 =?utf-8?B?Y1Q0bmFIREZkb1dMb1Z3Z3VobXdTclFQSVRUZ1ZsU1RDU0lwM0dyQjk5Y3pS?=
 =?utf-8?B?TVh2NTUvOC80ZjVNdW83RXpoRzVSaEp1Q3J6ZTZPRjUyZUt2eTFqV1FaTDdw?=
 =?utf-8?B?NlduUWYvR0kzZi96cGIzOG40L0VOazVjSXhCejZDbU5YQ2k4VktMSjNLMTVv?=
 =?utf-8?B?S0g0cDN3K1RjeTNUUVNUVTlaOHZBWlViUnJWaExibGlZV1FQVytaUzFoRWJi?=
 =?utf-8?B?VElPa0ZWTFdYN3htNmFVZmNDWXNyRUNFbVpUVklEaVBDWnZuU09jalpQRXlv?=
 =?utf-8?B?dVFXUThvKytpSjdocGhHb0JJZVcyTHgvcTNwRmwrUEVmZFZmRk9YdlpxVENs?=
 =?utf-8?B?b2txUEtJMWhPUFNWdGVCd1lCbUtlcFFnK0VGSkR5ZDM0dHQxcDUyc2t0RVNi?=
 =?utf-8?B?MkM3elpWZTZQV2hZWmlGUFJjS3A0YW96TGlaQ0dtb0RiRTdNU2dWMHRjYW03?=
 =?utf-8?Q?8ZboNW/i22rKEblx4CTHTrVyJnulPIUKSlV34=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmZRU0E5MEJTeTFHcDI2SGl4S1ZkTTJUNk5HZkpLZS9DamlJN3dQbkV6VVBx?=
 =?utf-8?B?SitWWEs3MWxHd3VvbkRFSHgvV0V1MDNxRitCTllUZ1UxN3NWNEZ5LzJNNnpQ?=
 =?utf-8?B?UDdRbllOOG4wcTdyUGkwa2lnUDZBWXpSRkx3RWxlMVl1Yjg1UTZ5S1FTMTFt?=
 =?utf-8?B?QU03b1NIYXpyQ3E2UjJKOVFXUlJyengvODJjeFdRMlJvOGJzWDNWT2JwUTM4?=
 =?utf-8?B?aytBR24xWW9UTUQrdGtBenIxOU1JU01Fc1NqMGVIRUhqdUV3MDhnTjNiYWJm?=
 =?utf-8?B?d2JwQm1jRFI1RDdDQnpaa3M4RlJudzhVeTNpVFlxSEpVRGtCZi9rSlRvUjVn?=
 =?utf-8?B?K0FxNFI4bjBoWFVyc2M0WGdEMmZCWWdMQmRqV3l6RWxYVVY1ZlJGSkE1OXRF?=
 =?utf-8?B?UkVIZ1hkeU80TFVMbHpqejJQdzhRbmlFNkFjdnNVWDhQVCtFZXlBbUpqUjFI?=
 =?utf-8?B?TCs2djBDS1h3TExFWWliV0xmSGxYbTJuMUxpT0ZjNTFhOERMQzVPRUZrQVlZ?=
 =?utf-8?B?OURKOXJNU0d4Z2NYcGxzV2hMYTRqdE9qaUtZeG8wd3o3VHUwNTh0WEFScUM4?=
 =?utf-8?B?S1ZBMXNsZm1tTVV4eUlTZWtaSW1WRkRIZnU1VXBGSm4wTWxTbUVpS3U1RVpR?=
 =?utf-8?B?Z2pxeHFvRUJ4VXFMMGpGdk9DL0QvRlV5b1M5L1c4bjJZczJWMDU5L2hsYWRM?=
 =?utf-8?B?THdYcUlsazVMdTJKanZ2TXlqQTlDRVJnQTY3b0x1RjBYRXk4WjFKeG5lcEpi?=
 =?utf-8?B?N2JEYXBncE5HU0VKeUh2cHFieFUvMFhtMFBVODdJSzdqMXBScXJxL2ZCUTBs?=
 =?utf-8?B?QjMxZ0owckRNUEliTlExdlhCWkV4bWZ4dmVTUnVEb0trWVZueGVqejRkMlRm?=
 =?utf-8?B?QVl0MUsrRGdVNUNOUzU5aENvVlFQT204ZG1TRE45cy9TcGtMWGlJd2JTN1BX?=
 =?utf-8?B?ZFhYa21RdTlKODhJcVhIcGw3V3FXRlZvaG5iMEdSVDJ0YTNERjNVREI3V2Ez?=
 =?utf-8?B?U0tUdFhPNHgxbGIvVjVmaDRQVS9qWjNvcmMyU1UrR2YrbEFVcHFNUkFzODNO?=
 =?utf-8?B?dTVOeHk3VHFlT2laVStKdm5KS1U3ZnNYcFZ5QUFQQ25YcXl3YUl0NWRUZWVY?=
 =?utf-8?B?ZEM1SFdneG1GWTFCa2RtT090b0NkMjA5eTh5bGdITG41VUdqdU1xYzFFVmVN?=
 =?utf-8?B?dzZTejNWZVUrL0I0cVZla2xzOW9WMEJXeExDU0oydDdWTGdRUk92MUFERGhw?=
 =?utf-8?B?NVlLUlBPdFRVcElLcUwvOHFDWkN4V21nVzJPSjZDZmFDYThzeFRPa1IyUFhU?=
 =?utf-8?B?ZHFxWWliZHQ1WUtnU3pCWVdXbFh4eDhYMzhNY1VsYlM4UlpndkVqaWJYMnVB?=
 =?utf-8?B?ZHliMSt5WWJ3TkJmLytOYkdaSmtMeUQxbjJHK2pGclZaa29OS052RTF0a3VR?=
 =?utf-8?B?VlI5WUUyVFQxYy9HOG12ZUV3dXlucmhMbnpXTFBCeDVQMmhLSmMyZGUvZUw3?=
 =?utf-8?B?dnZqNUFnWU1LN1lFV01sNFpOOE0xaUVaYWVWK2ZCU0plOURBZWw0SmZFN3Ju?=
 =?utf-8?B?aHdIT3BFcHVmSUFqVjNSVHdoMGtna1FaR0paelhCMG5FTFlwU25VaVM3QTNT?=
 =?utf-8?B?cDZsZTZrNmsrbTd1d3A3UVQ1OS84dE5qUG1oY3pRZW80dFdNR2dPT09kMHR3?=
 =?utf-8?B?VVpJa0lNTTFTVkFaQ01FYjcvUUZzTkVZY2EzSzJOSlY4SFhDLzZJbWUzVGFM?=
 =?utf-8?B?bkNrUnB6b1gvdjR2ZXpwbEpCOXhFMldFUWFrNFJ6MDZOdDhJYm96ZTg2TWlj?=
 =?utf-8?B?QzBKazZ4Z1RFcHZEUlNVNlZTcFYwZlpvRjlNRVdtSnZTaGhQT0tDN2JPVTBn?=
 =?utf-8?B?R3RGYUhUaVZDOXV2UnhYN1I2b1BWVTRQTW1BUU1EUHhUelIxQlM1MGkwVk0y?=
 =?utf-8?B?bDR6U1RlalBkMGxDYzhGNkU4SXVYZFF2OXIrQXBzL1JzT054a0tvVHBncEFZ?=
 =?utf-8?B?dmpzVUtXTjFnam0wZHlDcmNmY2l3S202MWd6aFNtQTNFb3ppM0ZxMGtwL2pN?=
 =?utf-8?B?ak1pMHJoQWFDNEMvRXBTczRHWHNvWis3azRPRTVyM0laRzdrK0hCcmNnQWZH?=
 =?utf-8?B?UUkwdEpEMGI3N1N5NWVCVXBKdjhCdHhsd01FY0lnamdNYnhFNGNETWZrOS95?=
 =?utf-8?B?RGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: db531154-52a3-4007-ff60-08dd8bea85c6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 15:35:54.1021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ep+pT7L15BO7n10/1BR03PyJCla32ajBU3KBELdFPaYCjdSFmU8PtVyw6BNjacWaA/kQkHPgJgppdr/zTk9/VGz6qoV5wli7WWBgpZGl4Tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10268
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aa1iDD3qCy1nHO/r097gIXctPmapLCT7jmTVemOYWRo=;
 b=e3t4IfEb6iytJXBRW0zBO/I4BIrjg5M54wl5p77r9iq8fU1B3w7Za9qMWkJu974E1TIA4opH8VOs00KNogjzhCTSQEyjRL2wW9wN7lcT/felxKKzuvgjrOU3OmkYV65Tr+PjvbGpWP8mXHT1zd9bkOjDrUeBBrTSSz7cDFNVm9I=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=e3t4IfEb
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH RFC] package/libwebsockets: make zlib
 dependency optional
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
Cc: Gregory Dymarek <gregd72002@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gMi8yNC8yNSAyOjEwIFBNLCBRdWVudGluIFNjaHVseiB3cm90ZToKPiBGcm9t
OiBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpAY2hlcnJ5LmRlPgo+IAo+IHpsaWIgaXMg
YSBkZXBlbmRlbmN5IG9mIGV4dGVuc2lvbnMgYW5kIEhUVFAgc3RyZWFtIGNvbXByZXNzaW9uIGZl
YXR1cmVzLgo+IFRoZSBsYXR0ZXIgaXMgZGlzYWJsZWQgYnkgZGVmYXVsdCBpbiBDTWFrZSBpbiB0
aGUgcHJvamVjdC4gVGhlIHNhbWUgY2FuCj4gYmUgc2FpZCBvZiB0aGUgZm9ybWVyIGJ1dCBCdWls
ZHJvb3QgY3VycmVudGx5IGVuYWJsZXMgaXQKPiB1bmNvbmRpdGlvbmFsbHksIG1ha2luZyB0aGUg
emxpYiBkZXBlbmRlbmN5IGEgcmVxdWlyZW1lbnQuCj4gCj4gSW5zdGVhZCwgbGV0J3MgbWFrZSBl
eHRlbnNpb25zIGRlcGVuZGVudCBvbiB0aGUgcHJlc2VuY2Ugb2YgemxpYiwKPiBhbGxvd2luZyB6
bGliIChhbmQgdGh1cyBleHRlbnNpb25zKSB0byBub3QgYmUgaW5zdGFsbGVkLgo+IAo+IFRoaXMg
ZG9lcyBkaXNhYmxlIGV4dGVuc2lvbnMgYnkgZGVmYXVsdCBub3csIGR1ZSB0byB0aGUgcmVtb3Zh
bCBvZiB0aGUKPiBzZWxlY3QgQlIyX1BBQ0tBR0VfWkxJQiBmb3IgQlIyX1BBQ0tBR0VfTElCV0VC
U09DS0VUUy4gVGhlIHBhY2thZ2VzCj4gY3VycmVudGx5IGFuZCBkaXJlY3RseSBkZXBlbmRpbmcg
b24gbGlid2Vic29ja2V0cyBhcmUgdHR5ZCwgc3d1cGRhdGUsCj4gbW9zcXVpdHRvLCBraXNtZXQs
IGphbnVzLWdhdGV3YXksIGd0a2lvc3RyZWFtLiBBY2NvcmRpbmcgdG8gbXkgcmVhZGluZwo+IG9m
IGxpYndlYnNvY2tldHMgZG9jdW1lbnRhdGlvblsxXSwgZXh0ZW5zaW9ucyBhcmUgdXNlZCBvbmx5
IHdoZW4gb25lIG9mCj4gbHdzX3NldF9leHRlbnNpb25fb3B0aW9uLCBsd3NfZXh0X3BhcnNlX29w
dGlvbnMgb3IKPiBsd3NfZXh0ZW5zaW9uX2NhbGxiYWNrX3BtX2RlZmxhdGUgYXJlIHVzZWQuCj4g
QW1vbmcgdGhlIHBhY2thZ2VzIGRlcGVuZGluZyBvbiBsaWJ3ZXNvY2tldHMsIG9ubHkgdHR5ZCBh
bmQKPiBqYW51cy1nYXRld2F5IHNlZW0gdG8gYmUgdXNpbmcgdGhlIGV4dGVuc2lvbnMuIHR0eWQg
bGlzdHMgemxpYiBhcyBhCj4gZGlyZWN0IGRlcGVuZGVuY3kgc28gaXQnbGwgZW5hYmxlIGxpYndl
YnNvY2tldHMgZXh0ZW5zaW9ucyBzdXBwb3J0IGJ5Cj4gZXh0ZW5zaW9uLiBqYW51cy1nYXRld2F5
IGRvZXMgbm90LCB0aGVyZWZvcmUgdGhlIGRlcGVuZGVuY3kgaXMgYWRkZWQKPiB0byBpdHMgQ29u
ZmlnLmluLgo+IAo+IFsxXSBodHRwczovL2xpYndlYnNvY2tldHMub3JnL2x3cy1hcGktZG9jLW1h
aW4vaHRtbC9ncm91cF9fZXh0ZW5zaW9ucy5odG1sCj4gCj4gU2lnbmVkLW9mZi1ieTogUXVlbnRp
biBTY2h1bHogPHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT4KPiAtLS0KPiBNYXJrZWQgYXMgUkZD
IGJlY2F1c2UgSSdtIG5vdCBmb25kIG9mIGFkZGluZyB0aGUgWkxJQiBkZXBlbmRlbmN5IHRvCj4g
amFudXMtZ2F0ZXdheSB0byBlbmFibGUgbGlid2Vic29ja2V0cyBleHRlbnNpb25zIHN1cHBvcnQu
Cj4gCj4gQW5vdGhlciBzb2x1dGlvbiBpcyB0byBhZGQgYSBuZXcgb3B0aW9uIMOgLWxhCj4gQlIy
X1BBQ0tBR0VfTElCV0VCU09DS0VUU19BU1lOQ19ETlMgZm9yIGV4dGVuc2lvbnMgc3VwcG9ydC4g
SXQncyBqdXN0Cj4gdGhhdCB1c3VhbGx5IG9wdGlvbnMgdGhhdCBkZXBlbmQgb24gYSBzaW5nbGUg
cGFja2FnZSBwcmVzZW5jZSBhcmUKPiBoYW5kbGVkIGxpa2UgaW4gdGhpcyBwYXRjaCBpZiBJIHVu
ZGVyc3Rvb2QgY29ycmVjdGx5Pwo+IAo+IFRoaXMgd2FzIG9ubHkgYnVpbGQgdGVzdGVkLgoKQW55
IGZlZWRiYWNrPwoKQ2hlZXJzLApRdWVudGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
