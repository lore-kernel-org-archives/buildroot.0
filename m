Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E600EC9EC7A
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 12:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5FD7616AD;
	Mon, 12 Jan 2026 12:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 888C8CaMiq13; Mon, 12 Jan 2026 12:05:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A104615F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768219504;
	bh=tOH2WqLF3ab+ZdE2clAzZ2yliYp3+7YhrIXgligXax4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O7bOPUNzN+ZKKMZ4lbnmQg6udMIyVzIQSt89wOyIFGnjaclhPqHbVUNpntMoSudTO
	 qrlQCRv/aTJCvzXjXmgQHK3cEBFspkOLv9kJWT0bCrlCAa3msDj/7bKp6XvZdji5Lh
	 4YH1pPDfIsBeYdkbqfI2cgOrVlvr/0xEU3dHj79WVng1klBW3Rj2pPUK7kSnC3rRHr
	 wCv0qulfj/OkyJuEVyfyqHouE1qvPQtpe+ZQvGHNg+CtE3wHDhNNe/lI5TmznXt+Ia
	 Gjv49xVQhbXkacBOOhr/hNMofeCiQHs6A06SH1b97kPvh4bDCXTFj3Qyd/XE9scBqi
	 unyaF2qEsvx3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A104615F2;
	Mon, 12 Jan 2026 12:05:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 755AB18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 12:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67C0D8476F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 12:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zeXzj-lKX5h6 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 12:05:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::5;
 helo=duzpr83cu001.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0FC3E84761
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FC3E84761
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FC3E84761
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 12:04:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJQ+I6p+VK7I2YtKN98/TTZL93OkRCDttHkppEihv7CM87o9/FWGY6q4Qs0VtSSjqwv0HAlRhVt3dNvCI4JYUNi5LDqoGvpMuFpfKATzVChQPvuSkUYpvjczdO6Xv/Gb24q4wC2/ODiINGB6HKDn6oCrK6sCLOTgFsSxwv/vmtN8fWRXMxBf6A6PNeyxPo0N9KWH/grVh9x2s2TKjlM5ho+AzoRcT5TrrtS75dxk0DD5P2kUPC/wuShpXmKnTm4d9y1zhaj+z/bGhpCbtfY0Vt4XGJCYwjFuVTZDZ4ZC/p4N2P3r4Sv3B6HeAkH8GvvPWhZJp++oRN+U+tjNNkBb7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yt8HyM7M8S7gxFb6+DC+bAI2XlvT7iFRPEOdKqd1JYY=;
 b=H1yS4OP+0rwzpQZYV+hMbxTMKSxNNbWE6hfW73xNpSoocxEQB9A0ACQeazdPbuqOCNdmWjMkpLn9aBQQr6m9jJxIM3Et7hyIMPRzWeobZmpsP3WTXEXEapKeh/9K196FwA+jQUl50uOp+vZ0cg2NQlADzYeNqd2ZnM79z2Sz6jvCi7WLLXXd6Vv0d4H5JohIa5OO39w9BFlX9Ut8W7aZ89ZUAxNqYlyDD+coDnM7t0v0AjH33dHRYfPAi7fKUPlUKz8EOeudWHPEnqGm58UHCf+bc+E4/FdeEfgqtd4tWdllbaEM2TxczJ6BVddJY6tTPV1FigalmxFD1ifz1+5U2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA4PR04MB7888.eurprd04.prod.outlook.com (2603:10a6:102:b9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 12:04:55 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 12:04:55 +0000
Message-ID: <b2394bff-7f48-431b-b20d-dd92f1a97d28@cherry.de>
Date: Mon, 12 Jan 2026 13:04:52 +0100
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Cc: Danomi Manchego <danomimanchego123@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>
References: <20250224-libwebsockets-zlib-opt-v1-1-16419ae3e82b@cherry.de>
Content-Language: en-US
In-Reply-To: <20250224-libwebsockets-zlib-opt-v1-1-16419ae3e82b@cherry.de>
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA4PR04MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: 153a57e3-eca3-455e-63dc-08de51d2ccde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0hMV2xMNVBEbVc4aTgzRmFHMEQ5K1pBbWxHSnk2S2Q4K3ZoSlJhcThNTG1a?=
 =?utf-8?B?bWFOSmR4TEw3MWYrMCtlK2VjMG8vTFhsK1ozU2dZOU1JVUNlcG1FOUNlZktD?=
 =?utf-8?B?NGJBenQ2enpiMU01NEtVZDZjQ1hYTlk4WStXaHdGbEJnZnpuUjJzN3BoOHdU?=
 =?utf-8?B?cW1lZ2RRWjV6aEJyL3NYNkJ1eHhIN2FDUjV1NUQrK2VaYytvZ3BzMmxVOXEz?=
 =?utf-8?B?S0pnODVOaFdzVGZEbEV6ZGRGbjN3RkkxdVYvR3YwT25FUnNrT3NnNk01M0VN?=
 =?utf-8?B?dkh0U3krRGc5cm9zUEVpc0p6NjhkOE54YWdkVHZpZlBYa0tySDlzQXR0ZTB3?=
 =?utf-8?B?R3dET0VQMHlnd0h2RmVDSXdhVnBBUG9DNE8rdlVoRzlqam1aL0tWRk5RRksy?=
 =?utf-8?B?Y2lRM3h5WkZDR2NMZDhoVWhZSDExV1F1R3R4djMzd0xvYVBoZldDRDZ6Rmhs?=
 =?utf-8?B?VGlXNS95TS9tY1pnTGN4OG1wOEgwWXJZVFZGOXJNUEY0YUhWd2svaXluRVha?=
 =?utf-8?B?ZDFSTnlpdnQyN3M4eEc3SG5kV2lCYVRHazFyZTJJQ2FsMERzZXRpUVZDVWt3?=
 =?utf-8?B?SG5OYXpibE9aT29YVGdXTURBS3hPREZhNFdXZm9PRTgyelNwS0p2b0g3WnNC?=
 =?utf-8?B?UVF5ZllrcWdjVnUxQWNRcHk2ZjA4NkRkemJyWVEyNnl1QXpGMXhhRlZkZWxn?=
 =?utf-8?B?VitraU9VY0pna0VpZldab3Y1NzIxbDRYa2EwY0JkQ3NYeVhqZ1ZodDRRR2R1?=
 =?utf-8?B?V0IrMEFyaWJLMHl4K05Bc1licDRYQVdMejhnWlFJM1pSSUxMQ21oYXBWS0Jv?=
 =?utf-8?B?bW0vd1UrV3Z0QTRwckdEZDRTc2VLTkE1TlJCQzZlRE1pUjBTUEgwUEhYRnBQ?=
 =?utf-8?B?b2JLa1JMejFsNy9wZDdDL2JBT0s4MDBoS05RYUw5Z0VJcU9tRVZGNDRXVVdJ?=
 =?utf-8?B?WFg0bGhGQ3JaUnBqdDk5OTFZVUUvdFJpaDBlbkp6Ky9iUDlXbUhXY0dndFRl?=
 =?utf-8?B?UTIwenpLUEF0WTlMcFhtLzNlTUIxUDcyVFpUL0dTT2pOeXZ2UVFPUUhOZVBl?=
 =?utf-8?B?OFZJVVZ3Q3l4ckt3anhuZXVhTjVQMktJdXZJVVdlOGVvTmFyUGJRRVRTSGYw?=
 =?utf-8?B?NW1nak5hZGo4akNqOXl5Y1JvRTZjTHBUQWV4N1BxRWNKb2I0ZXJnZkxwa3VG?=
 =?utf-8?B?clN1Q0lXM3czaFlOci9zQUpBMG1NaHllOGp1NFlTNFlSa0kxRmZSZEwwRmRv?=
 =?utf-8?B?d1U1VlFEaHpJL0VkclEySnZXbUlzV0NxQkthU09yMUdueS9vT1ZUMzRueDFF?=
 =?utf-8?B?M0NEb3I1M1FJa0RBZ2dkNHlzME1Xc2x1dmlCMStqSW9QSUJEK205RVBSZlQ5?=
 =?utf-8?B?b1FaS25ROUlSTTE0KzAxL3ZwSGRYc0dTZlpFcldKVXU0VzRyY09hcld2cjlr?=
 =?utf-8?B?bjQwSUdXSnlXZWlTb05wWW5Hdk5uM3pDU0tKa1hNa1pWd0g4Q0s2L01MSzln?=
 =?utf-8?B?TXZQS0tOcTU3L3lWTUFjNzZwUHc1Q1U2QmpUUUR0S1NUNmcyNzlqMEhKSDBJ?=
 =?utf-8?B?dGNzSmhJSEg4UHpuZUVOYU9TRkk0Skd4VENzYkthOEJpVG9UcVNCL2o1Q3My?=
 =?utf-8?B?ZDRaekZ6M25yaUUwNHRzQTRreWcxRDVKQjlxV1A1dTJXTEx3UFhCc085SFo5?=
 =?utf-8?B?bzFaVTVxRXBOSGFZS09NOHhMcW0zaWpyRzNjUC9PUG44T25FMmVySjhyQ3dK?=
 =?utf-8?B?UlBmN04xTngzbTlMYmVNZEtnV1dLd1NBTGs3M3ZHNFBzWGlxckZ0Um9DK2lq?=
 =?utf-8?B?dWRxS3ltZ1R6YzgxSTRURUhtMEhBRkdYc01GMC9CclhrU2tWdGY4amFCdldr?=
 =?utf-8?B?UFB1Nm5HZUZMK3h0SC9QN3pMWXk5YklnSndQQ01TWXlTMnpyQUlXMmgya0dX?=
 =?utf-8?Q?WAodpX0rfhJRfmaYBN7jFOO7zPTGjbma?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFA5NVBmT0dNUHpRS0lvNnFsNlNyVUhXRnQwaUhMa3FLZ3g4Q1BWR01FdWFm?=
 =?utf-8?B?V1o5UlFOVHIrT1FtdE5MU05UaitaeDc1QnFIVlU1WXY2dUk1enBzVlRjUkFV?=
 =?utf-8?B?TTRsQ0JkQW1Wc1NucWV1Vk1JRUhiUjAyMWpvQTFLbkt4aDVKKzFlclRGeGc5?=
 =?utf-8?B?ZGNwM0JhZldWd256MTNtdEJLcGZSMzFrOXRRUFJyaWVyVmorcUtwNDFHVXRE?=
 =?utf-8?B?VStYci81bHBIUldqNUZqdk9kL1lodlA3T1FuRW0zQXJrRG50bzdBbEdPQVRy?=
 =?utf-8?B?SDRMVGJlY3ZKR2hRRmRpYzl1NEJucXhOYUQ1WWdYeUpxRlBENjNWQTRyT2t1?=
 =?utf-8?B?Lzk1S1Fkcjhxa2k5Wk9VYmNlQVRiYk9SNGloZExoa3lJWFNseHhLdURLdm01?=
 =?utf-8?B?emg1U2E4aXNBamE1NFRuaFh0NFZ6UmdQQ01FSndDeFN0Zm1iZkk5TGF2RFNW?=
 =?utf-8?B?Uzh3NTlOUTNvN3JFNDRmb3BpaCtSL0RlaEl6djhlcVkySk1QM1AxNXdNdGhW?=
 =?utf-8?B?d1pPYzBteXFoMkFYanN4c1ZhUzhwMEt2UTd0OTl5Y1ZXOE1NQ2h0MDdEdTNO?=
 =?utf-8?B?QnZUc2dpSFpVYWVneGlDTEpGVHQzd0ZzeFZRbzd1MmwzVnJHaWRsdFZOdEJj?=
 =?utf-8?B?M2NqODBrOWNpZzVadmt3b2VOR0JaMElzdUlRcmd3dXhwTDNTeGw4cklIQkZi?=
 =?utf-8?B?UldNalFPZWF2a1Y4QmYxWGNPQkFlZnZPM1BZSllLZDE0S0JQanBwOVFQWUpj?=
 =?utf-8?B?eW5BTDNlN0Nza2kzSUFTbWVyZGlVUW9FQUl0UkkxOVRRbjhCTStHaEljaGpD?=
 =?utf-8?B?TmxlcUNNQWVTd3kxektRVkJqWStHcytkUnF4MFhJTmtMcU1obnJMNFRTOUtE?=
 =?utf-8?B?SzNCSDRESnZ6MU1GUDZrQytuK3RaVXJpUTZVd2txaFNYLzZDaDNlbjVDbDlv?=
 =?utf-8?B?djJ5SnNOSGI3QlVJNW95MkJMVlRzR1ZsQW12TjgzdW1UeTAvS3lxUFlRd2xj?=
 =?utf-8?B?em9XUzhpKzdRRVlXRU1HblFwZTFjSGo4bDlCWmo4bGJjdlcyNXF6cS9IaGhw?=
 =?utf-8?B?TkVHTnpOMmdIZEhlWCtSRFdtdDg1aUQ5YWx4MFladWkrQ3dUMithdGRTOXFN?=
 =?utf-8?B?Ukx6eDZiTWFhQkN0YzBoaFIrT1pIVUdnM1EvZTdUaVlzYXBIeGg5NnpxeHRw?=
 =?utf-8?B?MjAzYWpRSVNsd0Q0bjMzNndOMVdPU3YxQ3RDSEx6MnN1Y1F3N3A0S0dZekow?=
 =?utf-8?B?bThUdnNpTlFueTJxUEhCbUhSSXB5YUw0UVJDa3kxZ2Fld0ltN2lUWm5td3Ix?=
 =?utf-8?B?REJsQWE3RlZkSjhJMDhldzBMR1FaOVlYY0o0aFZsV2lpaElkdTV5SGl0cDhD?=
 =?utf-8?B?M2lmYlVZS2x5SUtPUTcreU9Yd01iMnAwUEVCTldKWGcvOG9TQ3RZbmg2UjYr?=
 =?utf-8?B?aktZMGhRVERON3JzRjNubjlyYUxNcmZZQTI0dGtkL2phVmNsV3l6UG9OM2Y2?=
 =?utf-8?B?STJDeWRYb05rUGNoTFdVY0RMdXZQRm9Nb3JLcVQ2SVlNc1lvQmdLSUxsUzAz?=
 =?utf-8?B?OGRHMVhHSGZHK0crbVN6Y2xUN2NWb3NUSmFLcEFIK2VnbU5rRGJYQ05sdUxB?=
 =?utf-8?B?MlNaWmQzRlZmT3NvSW1ieVBwYjZLMUJqUEF3eUdDbUxQUC9FQm5kUFBFME9t?=
 =?utf-8?B?YjFwUW9UbWtYRU9uRndxVzZjYmtPZzhGZXhWcGgwS2dHN0pyUHh5alk1eTh5?=
 =?utf-8?B?RmxuM3gzZEg4L2pabGhZczV4aXVuSm03ZHpFZlB1NDJnanR1a1JQQ1ArZDE2?=
 =?utf-8?B?RlVsUXc3aURTd0hjU3NwWDE4Ym92bjZSZU5mMUxieGVaT3dUZm0rNmZYMkFt?=
 =?utf-8?B?azZmdkdvb1V2am1mamJzUGpjSVlIN215STB6MGkrMGtkWGF0b3d4NjZoRVgr?=
 =?utf-8?B?cTV1N1d4ajZzc0poZHdHQk15T3FTZTg0RGI1ZlVVSGpiU0Q1a0UvYXRMWkJ5?=
 =?utf-8?B?d01JdjJyRDlBV1BwMzZoTUpLRGRYQlRvWWNPcjVvWk80VDBZeDRZTVNJdDlw?=
 =?utf-8?B?QW5hNlk1RVpuTFVEVi9rc3BEaDhBWklaV2hpZmdnMTZuRGZqeDZRYnh5Wmxl?=
 =?utf-8?B?Y2tHZEM4dmlIbXFUdlFaL3loQjJncjgrUzRxNVQ2dVRNb3ZEcGovRUFJTnZK?=
 =?utf-8?B?WWszZ3BEMkRkYndLU0F6N1JOclk3a0J3NWI0UHVnb1JwMmtSdHBLQ2dlSjBk?=
 =?utf-8?B?VDByZCtkLzBmSGg0SU5nS0VBb0ZMbCt5RDFGWGRiOHpnYlNjSy9aZmZUUE5Y?=
 =?utf-8?B?d3pKYTZXL0RhWHpJWXpMdmdpdDlFcDU4MC9SbDYzNVdUZjVJd3NYUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 153a57e3-eca3-455e-63dc-08de51d2ccde
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 12:04:55.6239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpDBqxgdwsARACbCYlcu/W/++/PUrQIQ0/b/+mohkOqXZQR2QHbtqM4IQ+RNOZzqxBtcm22xfDJFpi82eX2IwV5nbK0NbOwZsYfrrRl5lFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7888
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yt8HyM7M8S7gxFb6+DC+bAI2XlvT7iFRPEOdKqd1JYY=;
 b=f3VwglaOtGve0tKio1Ywv2l/47/UVMQtzdPOLiz3OiPWhl3OVJwXEWZPfy+ivTCuchCQmV+t6VDw4awbEBs55Y0HC3s2X/rw85g+j7L0KqvF1qsV1L+Hxf84kfuONXo5TWyIZ3hh0myTVK717LLQa/QdxWMwXtADqowq7/LSVng=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=f3VwglaO
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
IGZlZWRiYWNrPyBTdGlsbCBzZWVtcyB0byBhcHBseSBjbGVhbmx5IHRvIG1hc3RlciBhbmQgYnVp
bGRpbmcgCndpdGhvdXQgemxpYiAobWFrZSByYXNwYmVycnlwaTRfZGVmY29uZmlnICsgZW5hYmxp
bmcgTElCV0VCU09DS0VUUywgKyAKdGhlIHN5bWJvbHMgYXNzb2NpYXRlZCB3aXRoIHRoZSBidWls
dCBwYWNrYWdlOiBzd3VwZGF0ZSBtb3NxdWl0dG8ga2lzbWV0IApndGtpb3N0cmVhbSkgYW5kIHdp
dGggemxpYiAobWFrZSByYXNwYmVycnlwaTRfZGVmY29uZmlnICsgZW5hYmxpbmcgCkxJQldFQlNP
Q0tFVFMsICsgdGhlIHN5bWJvbHMgYXNzb2NpYXRlZCB3aXRoIHRoZSBidWlsdCBwYWNrYWdlOiBz
d3VwZGF0ZSAKbW9zcXVpdHRvIGtpc21ldCBndGtpb3N0cmVhbSB0dHlkIGphbnVzLWdhdGV3YXkp
IHJldHVybnMgMCBhcyBleGl0IGNvZGUuCgpDaGVlcnMsClF1ZW50aW4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
