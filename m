Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F145C5AC67
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 13:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05DB7607C8;
	Tue, 11 Aug 2026 13:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xtnou3ZB_yoP; Tue, 11 Aug 2026 13:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA59E606C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786453238;
	bh=9a/FVCF3U4lsqtgT07zMWllg51l+clsEkjIm+c9EWXU=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=YUnzsFr69blEGnoEN//SuSiVGWxIxRfVrhLQBGoZRQWroYdp0zOVhQd0XS3yzaGHE
	 AK6IUe3IqGqAu6Qlp81qnkWo8sFRsQHg7/5zxjyrZaLM5rIt3J5wAiVL5sR4UyWCi5
	 69gqgym24fbHelApLE+cy1rJGSuNZMKqhz2ITySamSMfPNmPwMkLWuGoblJYEnBeOZ
	 ab8mw6YJPbjMFqWJ5PTNamaSkTMyp83RAz9VvrK0WlmZXwC3uD6hCqXf7JRCDgGdqe
	 99NtRj33nyLUTFiiTF0B2q326I5PUFPhj77fecA35ZuERNmxQo38OtpZ0ebcFb59/Z
	 NkLLqAuD2Gc6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA59E606C6;
	Tue, 11 Aug 2026 13:00:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4814449B
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 13:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 279D380E54
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 13:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DfSj-_i1Slz8 for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 13:00:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::6;
 helo=am0pr02cu008.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBE2480E47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBE2480E47
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBE2480E47
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 13:00:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sd7wWBhV4Qpg0sBUJ1hwq4xjY9mGHmZVn7G1RrlZK42+NYl/h9rVPyjgWI9vCWAszZRh/hVmHjd0bdh1IfSh5rnRQHolWz+HLAbCThbqzL12vRtw3WFeqjCksJvf+ogPTn3BUavv8nu3UA7Rg7WVAQq/XjRirDRa1AHWoK3v2hIuvICFGnprDBUQmX9TgHh7wtBV5SiawIkWCied0GgFP7aWh4Ip17ob24v8wwDXOo5yNko8FLrO/I1R9n6/L6xAZLSu0wd4otJp8mtZTyCBx2r6KQRBQWKDnZ+D9EVGo7RXgUcfxJfCfXjqZw7z7gG87GIZ7I84cm0ROrNqPPvmbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uZi3EIYxO6BaOq526bmvd8M9nJonO5CsMoccgiuI8M=;
 b=lnxYwutaFhnGVwZK4Yh2P+nYU6bDjPflF9+jKI+CXpBuO1Qh9/iRFaKPEkbz4Tvx3WLOYHHi8IoUWKppWkHjyGNd3YKPPgc5xbA24S+xORhwzFOPqHuZ+MmGNP2OXA92JoScefCf9QMA5eZE/S5S37zi6RuK38IWd33weowePRHzJHlAmrSENbqmpZ32r/uM2/P/zB5vzIyG2LaJhJFxr/uA6m0AAApjjbxAqcx+8iKuI+d3TD60opKWSu6wwXvEKUNzUu19rfSENmx6NbW0bcAJ5cL3EOINJb0VCEbkeizLayvhqjKZxhio0rr5suskRrKs5esA74VfmpU4uC689Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by PA4PR04MB8014.eurprd04.prod.outlook.com (2603:10a6:102:c7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 13:00:28 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 13:00:28 +0000
Message-ID: <8d6fa46d-8200-454e-b5ac-aeccc4809647@cherry.de>
Date: Tue, 11 Aug 2026 15:00:27 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260811122642.142680-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260811122642.142680-1-thomas.perale@mind.be>
X-ClientProxiedBy: AS4P189CA0065.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::8) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|PA4PR04MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: da09429b-c222-419d-2543-08def7a88456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|10070799003|366016|13003099007|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Z6rbEOM2vpfdhvXhVvrib5b6HJ+a8VA863XLrzwuEwfdtw+BYg8ImWxELGPD/3w1mUTUmrW7E0AR9FKfAmswSQUfwb5cQATKc1Gb70oyy7F8sjpgyvQd4QVxrw1eLkJ63//nxFAW1NGiJlEp7yvel4264qVP82uK8wvee5NZ2JF1juziy/pHe0tFnbtuwOQoyMLcozoG/N7ACCoi8zc1bHL0uLXHagVbgXZ8+sPLuQdqQS6C3XvkcW6XcEYYiNOFT4GBUCF7C4xH0ad76hItZ1OIWp8TXdHzsIh5D1pJryeohfneU0EqLYZ+e3hdqm5WvrlKlFIJK9tPtpkx2RcHu27Wyr2rpJ3IxuqmCZjly9I2RbDq6rkZvPgxqUWh8JEJPRJtHFTFDQsxFMuAE10wE+TChlvnVxbQfl0x+qrG9AEgVHeWZKgqKtjJ6e2v/ohJ6Qpkek1C8N6ZdsJ3br1zwIvRudoUZtyhOZbRD22SO9UbNwkcH8zDesX6XlQ40cJRR5L6bxnx/7w5ec/KfloYT1fQ2ZHdsQXJTb5/yZfOLKQZaC6XN0TedYlr3iiEGo8ZM6QIxjUyNtchKwKYFojhMpuyayTo8cO6Q1Sw9j1PmI8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(10070799003)(366016)(13003099007)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGhFUFZ0N1Z5YjhyYWZvNmJoZGZRdHM1VENpNGRFbXR3ejgrZEtLL2xiYlRu?=
 =?utf-8?B?eTZyWGVSRmJrRUV3azFpdFBrblFhM3NxUUJOUG1qdHIySWF3Z05lTERaQzdk?=
 =?utf-8?B?S2hna2J2ZXJCb05TeGdieC9IdW9PMmdRMWtJVGdTMmFudXg4VzVmNDVkVm1V?=
 =?utf-8?B?bkFDek8wQmhhRy9USVIzbU5GL2Q4QXpHcS9NRFR5SnozQllvdjhOOWdDczNX?=
 =?utf-8?B?R2ZKeFhjRVMrZVByaDdvdTJTcGNGNWFNa0tmRnpCWTY5a1BncEtjdythM3Nm?=
 =?utf-8?B?UTk0ZU1qZ0l3MkxXRzNkdjlNK0lEaTllbWRaTWVBVFlpa25qTlVLV25ZcDZO?=
 =?utf-8?B?M1dVNVB3MldLbzY1Nm9QN05FcTV6Rk40aUl5MXp6b05ra1lQTjI3K1cyWmsz?=
 =?utf-8?B?clNRY2pzaEhGMlM5U0xORVhaS0o2eXBhaEtpVHJRdGhvWnduK25lblB6TmxK?=
 =?utf-8?B?b3F2c1F6b3lURllScldueURsVExaQy8rOXE1cEN1c0dHVVlBZnN1RFBBeDZS?=
 =?utf-8?B?WDRIaDJQc2dxSUpvb0FyenJ3YmJlVm1MVWpJYXpzWGs5b3F5dkxwQmNPMWVJ?=
 =?utf-8?B?STdKSlBPNGFiWldoQVlxQkR2Z29BL3pkbFp2SG5ZV01aS1hkYS9YMG1ValJ4?=
 =?utf-8?B?T2JEcU0ySjJDNWh1bURSZHlOWWFjWWFhMmk2ajNqKzBPZmF3S3dhTHRYdTBS?=
 =?utf-8?B?Sk1zMm1sR1hvVi8zRkgxQ256SGlSZEpTeGVjdTlxV1loMkp4bHVvNGgxRkU5?=
 =?utf-8?B?TlE0Vk1FZ3JKRDBQVktPRWl2OU1zSW83NWhPbFRzSitHMGJIRDB2VjJYQVdh?=
 =?utf-8?B?RUYzNmpEdkVWVHUvQ0Z3YWRXVmJnVHh5eEk1VTNKeHhGL1Z6Wk9kTG1jZzVu?=
 =?utf-8?B?NGQvSVpzQnUyU2xXNDBrQUcyNnBaRHpXU3V5S0YzSTEzZk1rZkFOcEFOdmYv?=
 =?utf-8?B?NWYxYkZqQXQ5L0Nrd3ZjbGM4ak9qeHBOMllWL3hNWlduQ3dETHNoS0JzS1U3?=
 =?utf-8?B?YTVBUEpjZDdwVHNCYkN0Qi93QUl1b2VGZTd5UEU3d3hMUEFWcHNjekY4MFpw?=
 =?utf-8?B?VjQ5L2gxcnZ1RTRkNXU4dkJjbENaRENCQithVFNTclcvaER1aFdKTzg2VkhK?=
 =?utf-8?B?NDRSandsOUpSeHlJL0MrMW9zb3loSUJBTE1GdmJoMFM1Mmt5QzE0bk56c0FD?=
 =?utf-8?B?TWlqelAxQ0U1Vm55YzJaYW9JMm1DczFIdlBEM2Y5SGsxVW54STRSZzUrNG9k?=
 =?utf-8?B?RUZhQm1ieGFLOUlaUEhuVHp1eG9SR3NJelp4QXNYd3MxQ2pxVk9HdWtCdDAz?=
 =?utf-8?B?THlWd250U3JkbHdaTUc3aTJOSmVPS1d0SitNU3Myc1FaS0o3KzIwc0RnOHdE?=
 =?utf-8?B?QlJhN09vUmsydC9nMmlsMTZwTThLekFqRVowaEloanIyS2xKTDl0MGtGRFVQ?=
 =?utf-8?B?eXFPVERuWUJRVVducWl5ZnBqbFg2YlV4T0FqVE9icDcxZ25BRDB6UDBEeU94?=
 =?utf-8?B?SStMazI1VkpUdllLWSsvcHNVODN2QS9ITHVPaUdGM0lwQkdzTGZRT1E0cG53?=
 =?utf-8?B?T0tTTUxKY2lRU004czM0ZFFOSDRJemF3czFtdWQ2cnhYZ3dCeXViZGFIWGNH?=
 =?utf-8?B?aWtFVzdpcmVvS1htY0VaMkpRVzZPSjlSYUIydmZROXJ2UDREZ2VFaWVwRjdX?=
 =?utf-8?B?YWZITGNYdnE2aTZXK3o4S25ZMTJTc0Zsbi9vOC9PWVEzai96cmEzcU1ZR0FV?=
 =?utf-8?B?YXNjcldGYjczVGVhUkgzblhJMXhCaWMvbFNRNlVJQnFNZU1yTXlPWU1mamdT?=
 =?utf-8?B?U2tvbDVuNGo2V3loYWlhejhBb3VKS1FQbHJ5aU9EYkFKQnAyY3pFazFteHBD?=
 =?utf-8?B?TlNTcEpKSEhTQzVDOFVnWGJwNVlnY2RhdS9IMWpRb3pLeTVBRHBPdWU0ekQv?=
 =?utf-8?B?R0VNL0hVSU4vWm1KTmVkb25RSWFQdW1vODdhbXBYRHpvaXRWaURzdS9wRmJp?=
 =?utf-8?B?cjYrV1JCSkNOeW1hdmZzRGFXcFVBdWNnMUhXeHMyaVdreEpJL2RWZzVpa1Zz?=
 =?utf-8?B?WXRkb21PSWpNdE5zTVlTQ0JQaEczVUxWcXJUZWs1NGdkVGpUOHZaRU5tR2lS?=
 =?utf-8?B?ZGlQbmVmN3AwU3NHRjV5LzZJY0hnVU02VVJLUDZiV3p0OW9aYXV0dGRvSVZv?=
 =?utf-8?B?c2ltU0w2aVJQZ0tOYm9FMktheHNJYUhxeEx0Rk40SGRFMElySXoyYXNUdGV1?=
 =?utf-8?B?WjduWUlSS1I5WFdnb2pBTmJObXpPd0U0Tm9wRkVSMWNKcVZUbWgvaUg5ZmFu?=
 =?utf-8?B?ZFVxQkFERG03SjJrZGpZaE9TclVvVWthemVZcUI4SWU1Q202eTNDdTZVajdC?=
 =?utf-8?Q?Ivd+s4YnpFaNqFCx6bFeQoNtp3ZTjw8TAY8u6mxj6RBeT?=
X-MS-Exchange-AntiSpam-MessageData-1: 9I9vfqkEq2nR6A==
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: da09429b-c222-419d-2543-08def7a88456
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:00:28.1290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhhvImS8TySOGo4EZe83Y9A0iZUlOF84b8enA1+B6j+6GFumbuPRfxFgpllnjAw4YfY92YhexDrTrE7qAAr6h53dcIHMZg4yq0E4CkAK5Zg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8014
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uZi3EIYxO6BaOq526bmvd8M9nJonO5CsMoccgiuI8M=;
 b=UPOon82zTG4VkGbjeP6DCnlwOSs7/yNRUomcA6J/iKzFy18HERD6fKdJTmlRmzaM8EQonIm7aBK33roa3gKEaoX38AJTEDf9gaBZ6N9t64X3woT6vSdzxKUEO5N6EDyzokLdftgKZrYe1gcvzYrN0blAHHcISTshWE4BjuOlKLU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=UPOon82z
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH v2] docs/website: link LTS tooling
 documentation and staging branch
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

On 8/11/26 2:26 PM, Thomas Perale wrote:
> Users asked where the notes are available and if the information are
> publicly available.
> 
> Those changes clearly explain the location and convention of the staging
> branches and also link to more documentation on how to read the
> annotations.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
> v1 -> v2: took into account review from https://lore.kernel.org/r/<f6b4e9a2-8ee5-4799-960f-36dbf5710da6@cherry.de>

Please don't forget to remove the <> otherwise it's not a valid link.

> ---
>   docs/website/lts.html | 29 +++++++++++++++++++----------
>   1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/docs/website/lts.html b/docs/website/lts.html
> index 3bfd2a4374..7513acc885 100644
> --- a/docs/website/lts.html
> +++ b/docs/website/lts.html
> @@ -166,10 +166,6 @@
>       <br/>
>       <br/>
>   
> -    <p>
> -    More details about the LTS workflow at <a href="https://gitlab.com/buildroot.org/buildroot-lts-tools">buildroot.org/buildroot-lts-tools</a>.
> -    </p>
> -
>       <div id="organization" class="br-lts-section-header">
>           <div class="br-lts-bg-grid"></div>
>           <div class="br-lts-title-box">How we work</div>
> @@ -181,12 +177,25 @@
>       analyze based on the previous week's commits to the master branch. The
>       commits are then annotated to define a list of candidates for the LTS
>       branches.
> -    <br><br>
> -    On Thursday, the candidates are cherry-picked to a staging branch to be
> -    reviewed by the other maintainers. On Thursday evening the branch is
> -    synced with upstream and contributors are notified. Feedback from
> -    users, sponsors and autobuilders are then collected and vulnerability
> -    analyses updated.
> +    </p>
> +
> +    <p>
> +    On Thursday, the candidates are cherry-picked to a staging branch hosted on
> +    <a href="https://gitlab.com/essensium-mind/buildroot/">gitlab.com/essensium-mind/buildroot</a>.
> +    Every maintained branch has a staging branch, with the <code>.x</code>
> +    suffix replaced by <code>.pre</code>. The staging branch allows other
> +    maintainers to review the changes before they are pushed upstream.
> +    </p>
> +
> +    <p>
> +    On Thursday evening, the branch is synced with upstream and contributors

Which timezone :)

We don't need to be precise, so I think something like "Europe time" 
would be precise enough for that purpose.

I appreciate the "synced" term comes from 
https://gitlab.com/buildroot.org/buildroot-lts-tools/-/blob/main/tools/README.md#syncing-pre-and-x-branches 
and is clear to you, but it isn't for me, I read this as the equivalent 
of rebasing 2025.02.pre on top of 2025.02.x in case there were other 
patches pushed since 2025.02.pre branched off 2025.02.x (typical 
workflow if you have multiple maintainers with merge requests to a 
single branch). I also see it being used in the graph in "How we work". 
The only important part to the user I believe is that the .pre branch is 
pushed to the .x upstream branch (and because it's pushed, a mail per 
new commit is sent on the mailing list). Unlike the kernel and Yocto 
stable branch workflows, I seem to have understood that patches in 
Buildroot are directly merged to the stable branch(es), without prior 
public notice on the mailing list (except if they were initially posted 
on the mailing list, by other contributors). Is that correct? If so, I 
suggest to simply reword "sync[ed] with upstream [branch]" with 
"push[ed] to upstream [branch]". What do you think?

> +    are notified. Feedbacks from users, sponsors and autobuilders are then
> +    collected and vulnerability analyses updated.

Feedback is not countable, no trailing s.

Also, I'm not sure what I'm supposed to understand from this sentence. 
What do you do with feedback from users, sponsors and autobuilders? Are 
they visible somewhere? Is this what's reported in e.g. 
https://lore.kernel.org/buildroot/6a545c29.87c5160c.35d6c8.0d2e@mx.google.com/?

For the updated vulnerability analyses, I'm assuming it's the one 
available at security.buildroot.org as listed in the 2. Vulnerability 
tracking & reporting section? The link is for 2025.02.x which is a bit 
weird since 2027.02.x will also be an LTS. Maybe simply point at 
https://security.buildroot.org/ and let the user figure out where to go 
from there?

With the timezone + feedback typo fixed:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

as the rest can always be improved later on.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
