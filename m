Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A096BC531D4
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 14:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60273408AF;
	Thu, 23 Jul 2026 14:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0jhe33c3cuR; Thu, 23 Jul 2026 14:19:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 821A0408C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784816378;
	bh=hri1Xwjg5A1amJozV7asN7E3dbnR/HOXJqcvFdm76A0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=HcqIq9LNpRtxaNpqyG0N6D24NofYfTCbPI0vtTbRM/vaTLh/odKH6kZOYedj2jJOw
	 j0AcrHaK6oXZ22MR1sItQgQXwgXqhkXh1z2JSe+keCYXgsu9unewgsOEjv111a6H1y
	 o7IwYbeNcQkoVI6fdqkBIEuv77Jk+joFUTFusbKEvyFOtmhqx9yo34jwWr2n8AffVt
	 xuNuJ0aLkYLEVFjSd75rdh01hphSDh1aSPuiXEr2+BC+fci5luqCNAo9XtSImOg/Tq
	 vc0sWoPt0sFc+otKMR6ptbSP2sjmvEka+WUb/nFZfnAtfUVi2sKXwcq1EwXz+WBQse
	 Gq1HojqaKI34w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 821A0408C7;
	Thu, 23 Jul 2026 14:19:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BA304BF
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 14:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01696403F1
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 14:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPq9VaqzkM_R for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 14:19:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::3;
 helo=as8pr04cu009.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0A548403DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A548403DE
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A548403DE
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 14:19:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYc5HMsOYKyrJ/KKv1DwNt4IW2aWZFz78GPq7zCnHnZnkPzPHYsEh7o92nOsaNsLvuBRJCZ8V71GYi8V1KonKUYtNJeJw5UAZCeEHQUHv+1FBn1VKiEf3C6J6g4Wh0kooTFz84DrgEqoMGGRJcscBLdeism0hBm1fj+fSPHS1kxVpWzA4pYOKnwRUqfZ9a12htnjHOtP/fNayypySHh10oqZhhAWfOxHJ8TDvT3gUaouEPhoeCzGiMz0OYwepu6Dj6GFrROumfURABRG4aoi5WsYZODyYsxYGb39jaR3wGFOddNUV+0HdEJuog75s/tI4iufhf/mjwDNO0mpvbSFgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01sTe9uiPj2MXghAlCY9s5ITzoZ9I+bgv2hbv1W8yPY=;
 b=wRXa5aAlKYa8y03x/zzHd9eOX73NiuvNP3a+YiNeAZzKM3tZBYoMBPAOKBn+iKVH19MBaDojTeJd7LpU5C/MVVwSQHAk/TwQaJ+NAirqrDd2pY9O+UR0bXKji0Hf08r0Er5EDJfWteiVfFMYO7rIGzv35rvSdis8cIcnMTA6Iz2O9pTxta/sz+r8051+YnqAsVr4R81d9TjksQnrsIh7gmpAphrVaONvT0vFwyRmJsUp4yUQDk9do5RftP/94d0Wz0eoSFAM0CweC9NomID4JVIxTHzaFIEFg6I21JW6NqTwAiWZvW8I56+4VPuMWAzwKEgiTQqScGK+z/0P0uR3AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AMBPR04MB12311.eurprd04.prod.outlook.com (2603:10a6:20b:723::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 14:19:31 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 14:19:30 +0000
Message-ID: <85581630-8fb7-471a-8ebf-6dab79d0d7e2@cherry.de>
Date: Thu, 23 Jul 2026 16:19:29 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260624101340.80670-1-thomas.perale@mind.be>
 <20260624101340.80670-6-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260624101340.80670-6-thomas.perale@mind.be>
X-ClientProxiedBy: AM9P250CA0012.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::17) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AMBPR04MB12311:EE_
X-MS-Office365-Filtering-Correlation-Id: 89c2b653-4c18-4021-2d0e-08dee8c56953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|56012099006|11063799006|5023799004|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 26rWKkx/B/L+hWCHfzaMs8O8M975lMTY2EPDwe9txIrbBzy8wIAvSBXw/TYoaXIIs/S2ykOPnCk1MDS1MRhhhrwnbKjolP/6Ur0jGqYs2mAWLGEAPYDxgEO8m7FYAOxLaw/k78uM3c7FTKqc9XL0W1Rbg4GCRXDIWOo9x6+vv4sf7tdBZ9x3KYHXqzfOcNzq5YWFmf3paNtGJwMrXQXIipLu4Dii1cqH0n53j2kmljocCb4/Kc2ly9KjXUn9h3nkGdEAN1caQClHYbVRplQ7ZAL28LeFA3M7fESftBKo+FIHXgCOTEH6ObhnpEbqZ1DuWEQKoQoH2yq/fnRYrXWTlddRFADHQX56Y2/1jtjDZkk0494QY5o0pK7Lp+x0KKL+jOzrkEc2FwRXROGsPZNXxEasxCh7R0cuFGg3wqRRSb8wJQ2FUu+eWh2uxoFSsSkl1JP3Y9mlgI0F72io68Dc4yuVRzNYdcgB0XbJ2oKJxGHbVJtbsEmHEsnkTRm57pcWo6Hbj2IJVQ2i9cGF5WbEV2zHyZ0JMAdDOAG1CxXriQPrz1lh+CJb4FkDePuf0T9wN26tDX5LOGXQgBFP+yyGXUb8C5r7GxnQW7keEMd4kECTnmZq2BybP60519Jolq/8PTllfm+BfXaU4OvoZ+1vDix06SoskpcOIm/kIn8T2us=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGFBZ1oyVWQ4OUVWUkJ4bGRrMWtTSE9MUXJDdEJ0V3hwdnNFbVNpVDZFY2Rj?=
 =?utf-8?B?SWJWbjhYU1R2NlVDOVpwVUZxMjJ1azJOY2ZwVFpCR01NNEoxN2lBcU9SamV2?=
 =?utf-8?B?S0Vta3NFYk5QR2l6MzQ4YXRmVkV1RHFQOGFRdm10azlKV3YvcExuOVBzNkRT?=
 =?utf-8?B?MUVQVjBNTG5CaDB5QzVnYjMwSWVmcnBQK3JXekZ1bEgzSC9hYnc5ZjhlRzln?=
 =?utf-8?B?c0JmTUUyQ1YxVzh0V3ZQMTRib0VvMTBaNmNrMVFLYmpzYkNhaHM1QUpUNTBD?=
 =?utf-8?B?TkpHMmd3VTFTVG1NNk1ZaFBGMGEzdklWMEtxdUVMVkExTGMyeHZ3MWhFbFQv?=
 =?utf-8?B?L09zNDRQVEhJZTNnL3EvaWZPNzRWNXJWajRLL2xmL1BtSzZDVDhQdU1vWHg0?=
 =?utf-8?B?Y05paHZMY3IzR3l6Z3c5bDdobjNrRWI2VW5DYkI2eTA1blhSdCtSYS9PU1FD?=
 =?utf-8?B?SG4xdFhMeitGdzk1MGxJeWMvZ0hZcHErNFlyMEMyb1FwdjIvQWlWZ2dId0w2?=
 =?utf-8?B?K2pXNDIvZ21MLzFwSVNxSFhUT1pOUVJqWnVlbnBFaEhBZ1MweG1NWDhRZ3po?=
 =?utf-8?B?Vk5mTndqdXdOZHFpMnZGRzJLWk43dlgxdkZXVGF3Z05wVGxJRkg1T0xEbFVK?=
 =?utf-8?B?SXlOdVBrMnExZ2M5YU5MVUVOT0Y3VGF4VDhpaW4zemZCTXJ6aUlKL0xGUU9s?=
 =?utf-8?B?K2ZHb3pCeDllVHFPRjdkOEd3QStiR0U2K282ODJtSVBtU0trMHF3SWRpZ25Q?=
 =?utf-8?B?VDFMN2lYNjdETTZKR3RLWHpFUXBjM3ZtbXdUK2hsVnA4Q2cxbTliUUFHa1U4?=
 =?utf-8?B?SlBGRXJVK1hwc2NuUjd6TUhGdHI3TnRXU3R3Rk5ybTR0VzJ6UU5zZjFQV1VV?=
 =?utf-8?B?R3BLTlJ5Um9Cc3N1cS9aMGprc3RJUUxSV2kycEYwWms1bDJXODMza3BRQ3M1?=
 =?utf-8?B?clZFVFY1OEFPQzV2eTllWmtCbkpRODBQZkdZR0pqdjJweHdITXRTUzlMOG1U?=
 =?utf-8?B?eVNiSklSajlHT0JvUjFmYVJTSVFLM0hTOGRRZjRydCtoakVSUWthSGs1ZmFL?=
 =?utf-8?B?cEZwMkhycUkvdUg0OEFuTkYvaGRKRnhFZk1WTXdIYlR4WHk4a1Z4NXVuQU9s?=
 =?utf-8?B?TW1uNFl0SThkY3hmc1k5WUxnWnMwUGc1WEhaVjEzZVhXbk9jbE1LNFVpT05C?=
 =?utf-8?B?UUI4a1QwTkg0eUUyU3B3YnF5ZUFha1ZvWTIra05OZzYzOXdxdy8zcUJQT2JC?=
 =?utf-8?B?eDVPM3p6Um5TWll2czdWRkNKZ3EwQ3NBVklLMEZXTmcrZ3JNWWxYcFVvU245?=
 =?utf-8?B?cmhsZTVvdFVKUWdybEJFNlB2TitqS1ozMXJDWVdpcmZhT0ZCRVJsMUpOSlVB?=
 =?utf-8?B?OFVRcU94aGdCWVFvcW05bm94czkvVkdsVnp3eit0ZXhhaTJCQUMwYUhrWUhL?=
 =?utf-8?B?Q0YzTEZNZXJpbTFkTWlSbHZNdlZXRUU5YS9VZDVqYnlGRUVNTzdlMXpJejlu?=
 =?utf-8?B?ZHc1TFJoS2RYSWR2QUhBdlFtVzhrK2NSbUxqdTNBNCs5d29kOEVnUVAyR2dw?=
 =?utf-8?B?cm1iQzY4eVJYSXBZM3RVSEFWQlVzRFc5aTNZRzlob2UybVRhZFNzUlRwemF6?=
 =?utf-8?B?d0xmejlwK3hVSzFnejhGSUYzSCtHaWpxRHhreHQ1U3Voc1FMNElWTlkvcmhy?=
 =?utf-8?B?bE5LTGo0Nm5qcEd3YnhDa2NVVE1aMEhteUtldTJIREprRHRmbUZVU3lCa1Er?=
 =?utf-8?B?ZVlXak9sZ05zM2R0c3pRbGNDcWVTcDFHRzE2Z0R2c3U1T1Z0dVJ1M095aVU2?=
 =?utf-8?B?ZCsrWi8rVzZIWDl5YTZpTmk2QlJCRXdySktqNUFFL2pzLzFTcXVwWXNYYURT?=
 =?utf-8?B?Z2EyOFdsdWhWSTB0WGVZSERsSWtrajJhOGx1RUxsbkhSK21RVzdsVG5kL214?=
 =?utf-8?B?Mk9kcVdFck5XZG5Ud21EOHlxR0FkaFZ0bzcwNTJROEtZMXpkeDNOY0RKc0xr?=
 =?utf-8?B?cEdpMHJ5bUw3OUxnOFpaVG1vOXNBSzFxOE02WGtZK2h6N2dUWGZPL3YzRndS?=
 =?utf-8?B?a09pUU9rYWo1RVZWRzQzU3pXZ1g1VHNUYnJqc05iZzRwQnp1TjRlUVg1WjF5?=
 =?utf-8?B?aVNBQXJPR21ESkNkdVBqTGZ0T3lwaGpiVU1ad2JrelJyOXRkK2NFYy9pakRD?=
 =?utf-8?B?SCtsbmNBaGVnRXJaY3FPRjVjcEVCWitqUllxbE5GVzRHK3JxdmhWUm5EZGkx?=
 =?utf-8?B?TXZjMndmQktYTWZ3VnV2dXB4T3drZlJVRVRRT1BqWW5xYzhucG9qRGJSZDJY?=
 =?utf-8?B?WmFiWHoyRHhQZWoyWFA4L0dqZ0pLbGNrMlFoaEltb1JYY2s0bmQzdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c2b653-4c18-4021-2d0e-08dee8c56953
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 14:19:30.7260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSyJqEsp9xnYH3BCN9X+H0CtaJiH3ZrNzaC4krS7cdyPx2Pv0urUdnVRnC85eFB5OT75HzVlTbCpQYkZc4or80wgMYfPYAeCVKsaJzTdv0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12311
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01sTe9uiPj2MXghAlCY9s5ITzoZ9I+bgv2hbv1W8yPY=;
 b=Xq4zpFscXs/xlZj6bSnG/bzMDg4I43i+m7jbw9IgmgXkLdiwcNM9H2Ov2GfOrHztKHQ64fRS0EBk+nfgLi2KMNb+1kNwL8FAlf5OLePgmeM+ot3awlVA9fv+9WIpaf7ntrij0oES1EJ/4tSxeerP7JnFjqmlz9j0BAQrl/fWesE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=Xq4zpFsc
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 6/9] utils/generate-cyclonedx: support
 custom version
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

On 6/24/26 12:13 PM, Thomas Perale wrote:
> Support using minor revision for CycloneDX 1.6 by passing the version
> from the command line. Currently supported:
> 
> - 1.6
> - 1.6.1 [1]
> - 1.6.2 (default) [2]
> 
> This is used to fetch the latest SPDX license list available upstream.
> 

Yeah it's kinda confusing to use the CycloneDX version to fetch 
something that's very little related to it (SPDX license list). I'm not 
even sure if it is actually required by the CycloneDX spec to use a 
specific version of the SPDX license list? Like I wouldn't understand 
why it needs to be a specific version, it's a list of SPDX-supported 
license, there's nothing that should break 
backward/forward-compatibility no?

> [1] https://github.com/CycloneDX/specification/releases/tag/1.6.1
> [2] https://github.com/CycloneDX/specification/releases/tag/1.6.2
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   utils/generate-cyclonedx | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 9738db71d6..8d055c3bbd 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -22,7 +22,7 @@ import sys
>   import re
>   
>   
> -CYCLONEDX_VERSION = "1.6"
> +DEFAULT_CYCLONEDX_VERSION = "1.6.2"
>   
>   brpath = Path(__file__).parent.parent
>   
> @@ -538,6 +538,9 @@ def main():
>                           help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
>       parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
>                           help="Specify the project version to use in the SBOM metadata (default: builroot version)")
> +    parser.add_argument("--cdx-version", type=str, default=DEFAULT_CYCLONEDX_VERSION,
> +                        choices=["1.6", "1.6.1", "1.6.2"],
> +                        help=f"Set CycloneDX version (default: {DEFAULT_CYCLONEDX_VERSION})")

Simply use %(default)s in lieu of {DEFAULT_CYCLONEDX_VERSION} (and 
remove the f that makes the string an f-string). c.f. 
https://docs.python.org/3/library/argparse.html#help

I could nitpick here and say you should first add support for picking a 
version, and then another commit to modify the default version.

>   
>       args = parser.parse_args()
>   
> @@ -545,7 +548,7 @@ def main():
>           parser.print_help()
>           sys.exit(1)
>   
> -    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(CYCLONEDX_VERSION))
> +    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(args.cdx_version))
>       show_info_dict = json.load(args.in_file)
>   
>       # Remove rootfs and virtual packages if not explicitly included
> @@ -553,10 +556,11 @@ def main():
>       filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
>                                  if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
>   
> +    cdx_spec_version = ".".join(args.cdx_version.split(".")[:2])

Please add a comment here to explain why we're doing this.

Looks good to me otherwise.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
