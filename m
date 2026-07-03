Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41BCC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A580A82328;
	Fri,  3 Jul 2026 14:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IED5AbeEvBVU; Fri,  3 Jul 2026 14:23:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BADA48231F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088639;
	bh=J49fxY84H52En97Dy+oaw2+A9hSb0bdJECr5LNKw4xA=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=YxD/RDO4ial9XNN3035HNqPG6EBygrZF4sFAe1RxDTp88+xOABhXDFwkNwb5YNWO4
	 gpfkPBqUb7yvkX6lHtGxA1i2++8sEgN1nINHkqKbdL3piOMns5AUwmyLpkfqzgCI2M
	 MS7qyLmiZAULi19JJsqO2AMtaB2CNkBEXt8Wy9AUlbM6XA+L0b+FGVMksXMa5mF5I8
	 46wg3kVRk051n5A8e/Yrt1tLpzIKsyKXgjrcN4NaDpHmanwuhB1Ex7AoDaKW0fgIRX
	 wTey3rui540pp2TBLVgSVuH07JqtDpzKpe64xwum2BRjwx+5JHgIxDNFERouVKDiEn
	 J+f9kRzBpc23g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BADA48231F;
	Fri,  3 Jul 2026 14:23:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CA3D1363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0445410EE
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YkDZ7Fs5lqye for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:23:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c20a::7;
 helo=pa4pr04cu001.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DAAB540E43
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAAB540E43
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20a::7])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAAB540E43
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:23:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVe7nU0CwkXEJHoLSEvbVSgOWDG0REt0WD5WjA/EAc/KWb29JL1dL+4Hz3bzsss+HnKpEZ+QpoKkJxtd0DclKgnGI/GzXGOYlAn1gV+nlo9W6WxkWNCaxAddLPhXDVP5JmszErZwIEqAtkKi9bP5+GRSc3ac+fTnduC+GJNFGerBR+xJs6ce3GnYj4Aqo+V3szAkgrVjqThpTq/zIg2ibbvW4/enWnOjm69oiVb+0aiZcPtSez2byYGzDonKXXK2Zv47MwDJguMNEbfIgeDgWrqhvgiCt9GJjVQOmlVCr1Cn2FqdjC0m4HuZFyNYt9AC24z0VMmsE7wys5jeM07Ejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BUGm7rKxVaoNtOcPmgGiAYkVvrJ+XudMbfFgepTDh8=;
 b=o+pAdg1F4KbY/BHf7I0M02aniNiAiojdFs6ceSkkLtSxmWvc6v0TLKQPcxMmD8ZmAnMyVSlfYLtYH8SLHbgzxdqrJv6RmD0xnPjrPyW7dYV7tP9cCk7cUfEabNy/b0yaMlo53gAJ2IwNTPG7hdWnsaMFbnVZ1TUCjSC6PEyqRRqf8+ZxMn2zYAcZd/0c4WhkbrswAjYEGS8fUdSNDh4YXKQQALt/dq+9cf1Q+Rye0EbIJYsIwN4SRvKfjyOFjFy6yE+EBpThGeLpLvxW9VOcxXJEQ2fz5mh/tz2gSBRWGCZM0Kaazd6Qhu6nXcCSVl6pP4NzMgsnPSIwTLxhPlFfpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PAWPR04MB11549.eurprd04.prod.outlook.com (2603:10a6:102:512::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:23:52 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 14:23:52 +0000
Message-ID: <82c2136c-b85d-40b0-a540-146d4b31cac1@cherry.de>
Date: Fri, 3 Jul 2026 16:23:51 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260624101340.80670-1-thomas.perale@mind.be>
 <20260624101340.80670-3-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260624101340.80670-3-thomas.perale@mind.be>
X-ClientProxiedBy: WA2P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::24) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PAWPR04MB11549:EE_
X-MS-Office365-Filtering-Correlation-Id: f6125de7-46a2-4d46-cae9-08ded90eb53d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|11063799006|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: szKg0aKGsFjJCrguPg5JMZK52ZhDlKq6F6895NNXnZT/YIDy3ZqjNfctMkFGinjfso8Qt7A6SIvHJOgdEPfoegrJGY+4gJK+DzmRf96/BbeJ0BX2IQp9jIf582pD95Is7O+tEeVL8YzAFiEZsJOnKjLRK+sjddGl9tTBkMTDxA4FbdcvOzbIW1UERslD3T8UupszpykfHDtCienP5oqwcKm4Jmu8bzYxaGgDLejXuhRdI6fp5R0ZzOl9IPaOAsmaRF7bbHptoWA7/1iYp0H5PeB18mRH3msT4KgQ8dQAirh0gNxyhUkkD3GhWqKqIEn5ynUaZO4q/+lELKSJhXGivwep/8gUScpwoa7WufoUxpYkM673cFkaYEPyDSh+xIFElWmj/V4bzZe5KWbljILQwrAKTn/XWOkvdctFd7r5OckaGrZIxuURhmG811kViIn/b3QHVeqQyFVyuDYuoq1lusTeDpvKP3CN2L5MniET6Zvj5ODNg/iC+GA4IUUWhBGO3tQWqu2rUaTPd36dCjm2yAZMxfwPJ3MCWB5/3jLSx00K0OImUg2AaWLzqvi9KCDXMB1LfP8xpX915DdQRYKgQ8mdRK+Mi8u5A1u2NKOUPWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SG92RU41Vk5yb0Z0cUxIWUxEbGprN1dUWnQ0STFydjIva1o0bXliS1pJRmxG?=
 =?utf-8?B?eWNuQUxtM3BFOW8yS3V3bXZBZ0lBWVV6K3l3SWRkYzV0bmdNMW80UlVyK3Vo?=
 =?utf-8?B?YTZiNll3eTFsNFZlVnIvYUJZVXRKeGFldnlxYnkvTHhHY0dOejNTTnBLWExR?=
 =?utf-8?B?Q3FTT0RIdE9LaE1tMm5Da1FVc0o5TmR6cmZQc1VxU09EaHRNM1B5NzVEaENY?=
 =?utf-8?B?REs4d0M3T0l4UUgzY3NIV25hYWg3U0VHbDRDQ3lXcFZLbWxjMjRHVFlUMy9Q?=
 =?utf-8?B?K0pobWUvZlV4QTkwa0RKNnFlUlpFckhDT0RmYm1UMlU0OFEwUzdGMEsxa2JM?=
 =?utf-8?B?VGFKakFvdUl4YzRCS1BCdjhxMk1YRFV1VEMwa0lmL25UcHhQNTRLNVpoeE5n?=
 =?utf-8?B?dGZXL25Xem5LWngzTDJHK21nWE04NEE5THJvQllFYjl6WFRiYmZzbVc1UnRP?=
 =?utf-8?B?RlhtUFJqbGlSeXc0ZVFUNW5mb2dXQ2JHemtjaGFBVmtCR1hMQVJFaFA3Qk1o?=
 =?utf-8?B?ekJQek9Tc0pDdnVPdkFhMEFZOUJndHdrQjR6a2dITUtRelNoRlVqMzdISEJF?=
 =?utf-8?B?a3ZaMmVocDRDeDN6djVvdWduTCtSRmxKcUVSTFlCTG9halIxOHBjYko2akFl?=
 =?utf-8?B?d0tkU0dxZzRRdlQ3S1ZWRTJSVHlmQUlQZEFFRUlQenlkamExZjIwN0dnUm5G?=
 =?utf-8?B?UnVlK3ZOeEkrSUViS3ltWmNhYWZ2YnRpbWEyUituUmRCOFhJZi8vYXFlS3RN?=
 =?utf-8?B?bVh1YkFBdEJNWW5ZcEYwYWV4Qko4SUh5Z0ZhazVOWXJjZkZLYXc3UjFYempW?=
 =?utf-8?B?YWZPR05yQjUwVTdJTzl3bG9icTdpcFZ6dmFvbVJoSVR4eDNmcExnMHRCVmho?=
 =?utf-8?B?UCtnVXE3OHBWSC9lcEpvT044bk9UdVNMWWxxV2RHczd5TTZTdHVkQ2RpMTVr?=
 =?utf-8?B?Qi9tN09qOEdBTGt5ZmxTSG9QWVFXdmFobUVhWGg0YWdZZGFLZ3VMRzJ3MUQy?=
 =?utf-8?B?T1BJcGFXS1JLZVh5YnNPOFRhM2JOSVBCQ2RIM2ZmZW1uLzJsYXprMFd0S3dk?=
 =?utf-8?B?c0VmRjdBTmFxelpqYWkxZXdjQ3QwdmxLY1BiRmE3Yi8xc21oNXhUZ21OUWdu?=
 =?utf-8?B?Rk5iK3J6c3NiK1NLck5wSUtVdG5SQUhaTnBTZit1Yk9OeDNDUlFWNUNpUk9r?=
 =?utf-8?B?WDcrVE5rbVYrM3FDcWozbmo2NithTXJLMWFDblVwQlVVWW9HY2cycjlHM3hB?=
 =?utf-8?B?ZXFwN25YcjVKM2trTFBNNmZaQXJIM0hHSjBjMGQyczBoejAvRlNRbmY3WldL?=
 =?utf-8?B?Ym1jRUkvRU5QdkFhclVhSy9YWmI3eFJhY3lwUFMrRCs0bnZiTmJGeDFDS0lL?=
 =?utf-8?B?UGltTzgrem9vNlFYK05YSHFRaUdBaGUrK1RKZFVFN3FoZUx1ZGZEM3pYRC9D?=
 =?utf-8?B?YkZYV0tsa3VONkhvWXhFbUVNYnZHc015WERsbTZrWmk1ZE9uYjRTYzhuUlUy?=
 =?utf-8?B?L0tTL3NiOEpmRjJ5eXdKYzJ4UktTZnIycU1XMnc0Y2h0bjlFcXVxN2krSzhE?=
 =?utf-8?B?d1I2MndjWW8rblY4K3FaZ2pBcFB4Y2tranFuUkdUR3NVTFZneWF1YTIzUXJL?=
 =?utf-8?B?Ujh4aElBL2thTGorWTAraGM0WTN6TXY5MEx4bk1KQ2JZVDhiSzlLRWorK0lz?=
 =?utf-8?B?Uk1ud1ZrRk5TV0lTYllLOS85ajdrSlgzd1ZRczRKZmdNKzBma09kbGRiazBm?=
 =?utf-8?B?ZjhqQm1FQlZwOUd2Szc4bUxpRkpyQ3pGSnQxU3lRcXpDc096djhKYjdQb2dw?=
 =?utf-8?B?TFZyVWFmNnhqQ3RWSU91Y0JiZkZtTzNWMUVIT29UOVZ3ZHdiMzZtV0dHaW5v?=
 =?utf-8?B?NHB0TWI2b3U1c21BSWJhY0grWEhGRDNKT28ydnBRemZnUTJ4NWlKbExBUWti?=
 =?utf-8?B?dHp1TW9xV3BPUytjVWsxRHprSE8zQkZ0ZVFhVFpIM0lELzJsZTYxS3NzSHZN?=
 =?utf-8?B?VEFCbUk3SDUxRkpWZUdkTEU2Y3lZSUR1LzMyQzltcmNQUEZmQnNpMGtPbU9Y?=
 =?utf-8?B?RVFmUVcxSTFZY0VNdldNaHNIV0pWTUd0cU9LUlk3MUp0NDZPYk5rNFl6eVV4?=
 =?utf-8?B?Z3JidVRYN3RKTkNwNzNBMStJSVFTRXdSU1pFMkNsZ0JCSUtDa0ZNRVBseXI3?=
 =?utf-8?B?aHJnWnJSR1Q1YmdTaHBvRFFEcjVvcDBxOUpyRld6Wlp2eWkxNnE1VHM1Wktq?=
 =?utf-8?B?L01rV0dON2V5aUU5RjhyUlVpQnF4aWd6VCtCYTY5NzUxejdvZ0NmUnJZWHhI?=
 =?utf-8?B?ekhOMVFTM0JJb0d0VmZ5OW5aNkF0ajVUT1RYcUp0QTdMRVFLMG5iQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f6125de7-46a2-4d46-cae9-08ded90eb53d
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:23:52.8589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqspPpNkWIqscFKBEP/2luxznr0myA8QV6ANe6YW8EL02T71TNAS6hQTTmKdSMpkUYAaaIjbVvRFtpoS8+NNOS9ysUAdMdPYonMnbGCt2ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11549
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BUGm7rKxVaoNtOcPmgGiAYkVvrJ+XudMbfFgepTDh8=;
 b=AYwjl85GiHQIchDMaaKVhqwzglgrLd0cJ7bchl6D9HFDC/XR+fEuSkHuVMU9ArUk6eFyen4io8T/hS+toRv38fbsDux9+TFLFXqSxlCcPZkGUK6LSchH7Za97Go3/z7p08pDHPPGbajikHws4xzNUqx4RRXyBhu+mnjHfBvZQ8c=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=AYwjl85G
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 3/9] utils/generate-cyclonedx: add 'id'
 property to resolves
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
> The CycloneDX spec defines the `components.pedigree.patches.resolves`
> object [1] as supporting both a 'name' & 'id' property.
> 
> The definition provided for the `id` property is the following [2]:
> 
>> The identifier of the issue assigned by the source of the issue
> 
> And for the `name` property [3]:
> 
>> The name of the issue
> 
> The `resolves` object was introduced in commit [4] and only used the
> `name` property to link to the vulnerability it resolves.
> 
> In example [5] provided on the CycloneDX website, both the `name` & `id`
> properties are set in the security example.
> 
> In the vulnerability context, and more precisely the CVEs, the `name`
> and the `id' are the same and thus the value can be duplicated across
> the two properties.
> 
> This commit replicates the behavior documented in [5] to improve
> compatibility with tools.
> 
> [1] https://cyclonedx.org/docs/1.6/json/#components_items_pedigree_patches_items_resolves
> [2] https://cyclonedx.org/docs/1.6/json/#components_items_pedigree_patches_items_resolves_items_id
> [3] https://cyclonedx.org/docs/1.6/json/#components_items_pedigree_patches_items_resolves_items_name
> [4] 9415529923 utils/generate-cyclonedx: add support for 'resolved_with_pedigree'
> [5] https://cyclonedx.org/use-cases/pedigree/
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
