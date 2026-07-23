Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7499AC531D2
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 14:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9008409BB;
	Thu, 23 Jul 2026 14:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eXkYW1UX_uWm; Thu, 23 Jul 2026 14:23:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A81B40992
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784816597;
	bh=6L9K/aql1WCpDIE/5vcqXPHAizvN/sU+NyYNFJKlJCk=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=T88KUYOd0Q74FuhZHlSVZQxJDl6wZwv/cR3WvxTla8xxj3Zxba7GgH4U8CL+oerYB
	 Aq6aCJeXHQ7xhM4ff97vLj6fAX+1bNjJ3OobKYQwHr539dU3d+BMI8HrGTPljtQfKF
	 8amUpvOdJPgSGmC6+NrIjvFcP4RxofstwcG/6K0fnZWhGD00mey9RytH3+humloUe0
	 6H/7Gfl4TzwOHSdAPTdo41bfb4RqNBCluvt+rJKTH5NThiODsqHfeyJHLNr6zs1Dg+
	 lbYZ1GZl8HDwYGBH979I9DhwVgTFUAdgv3hh33js1FYUk528WiZmHnDL/c/lpOD8aP
	 2ZuQzPzDtFsiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A81B40992;
	Thu, 23 Jul 2026 14:23:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F36174BF
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 14:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D83D081083
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 14:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7E88-RtQttdz for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 14:23:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c20a::7;
 helo=pa4pr04cu001.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D04C181069
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D04C181069
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20a::7])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D04C181069
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 14:23:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUkGKz179x4rbFvyAVU/TNUyPPrAaqWEWGyiWoMF4Dts5p+PJVwpCc6WhlkkSyUeaGxJXhIB9yq/xx6AcJuoFG8dIo3cgIFfgXMhHraDCOZPEyoYjQFMRkXqAbhLxc3335Vig/IdMjcPpVmVXN6pJaVxYnMkHEpc/cUAqlQrk2UnbGU327etlJKbvZ5frOv+uEddbAVarGLMVTBiIw9buJqMmU19BNZr32rrXCjQDDeK359WLaH5qxIfqfYRTYRCTgo8V9HoQgnOG0ioJ5AmPNgUHiO9BF5YaOrSmsJPYs98W2lR3iws6W2KjcxYTVkmr/k9d8x4gz1pWmUba4nDhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vx8FIyWfDj1zupmMKODdWb6L42KC/47+ooX2ScAKN8s=;
 b=mX58iDk2aIlgpXADgPdZ4xTjdTHXcLZUXon5ZaYbyyFZQORtnUJu65WrkPH0be4jw0DmbLV0UpZJGL/VhvjvoxWr3K3JNvw/uTJ7rUzQFbhxWV3QKiN/Rs0uz84laXkprAH1YJCOd1HlKwlI6noCe4WutahRk8DWogavYk77eEhswfr18g92vup+yUB7OKqEFMSr/e8WTCR/wIDGT9tVnura1X3W2JJ9m7Lr2OnMg7ZOtZ2Rp/g5NT2JCCVPJlaACcKuWVlxpzymq2S/G9tqwYmmD6jzKKwZ9vI3rMuNLhN/aAbC9ncKQ3oc9NIeNHY8qnxZ7Q7Qu3pk/349vuNpvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AMBPR04MB12311.eurprd04.prod.outlook.com (2603:10a6:20b:723::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 14:23:09 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 14:23:09 +0000
Message-ID: <5ef3abca-4218-48e3-a878-cc2d11287d0a@cherry.de>
Date: Thu, 23 Jul 2026 16:23:08 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260624101340.80670-1-thomas.perale@mind.be>
 <20260624101340.80670-7-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260624101340.80670-7-thomas.perale@mind.be>
X-ClientProxiedBy: AM9P250CA0015.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::20) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AMBPR04MB12311:EE_
X-MS-Office365-Filtering-Correlation-Id: c3dfc124-f117-421f-8cfe-08dee8c5ebd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: WFQO2kWWvivuIqmeXUyaGCerkvDBGPFBYqQa32b8Bsm4qGQbXb5pUOTD0SGJwKC5U/1O9GLnr7PDTZVPDKKk+lL6uUv9AkgJYzb/2vJZD7iWwBT1nowxk0Vlr9xhfmCL8YQrzR4RY3SL8M1mX3C9sNG8aWl27ClnJEdbaYpNUqqQxEW7QDFztI9mODKl1qOjJ/xvlQqvP4GMtrFcS9v8Pkj30FAs69AYC/48oldiJMAaxAtauE7CEYtV3ZZEefMs1fO0FoHHA1qbOmUzH3klKDier6U6mziwN0l/1NYRTVUYJCO/MLU82ZdzHvNOE8cI9eT0d3Y4PDmaEMXygUNjk6MwZ3U/SSqzVSDuKirMIJAurNKMYtY5bTeRIH5gUSmDkJDJeDlJ652aTTSTDC6R230Z2h2OhX7SMlrk8koGrrCAZbk/4Je6NM8tHjFMcbQbi/eaJYJVQq4eQxy/tWyhDbAv9MuwJkfSfNQ/MDjdMJEry/WqQ7LQWwury1bC2aEblwhvbQ2Vk7mo/J8Ybe6DAvZTFQ+yab1vfdlXZMWMkFh89u1Fq3JgfS/d5/8Fzvxy7iJ/9scYq0mKww0yV81qeaqtUmSJU5OjabyoB+Eb+KfBlQVkuRE81u1vEYrNDCOncXa5NlSuXxRh1lnR43vvTH8JSABsWb8t1AW1bTit0ic=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmpJUUJRMGFQbmlFOGExV3BDTnA0cnFLNklIQWNjMmduTUFlQTl4NTVaaTRk?=
 =?utf-8?B?SWNLZGpocjZlL0MrOGVJRWFsYUc4Ym84NkF5eXlhcHY1Yjg1cGc0YjRGS2c5?=
 =?utf-8?B?eTY3YWpRM3U3UDJ2OUF1RzljbUN3QUNkWmt3cmZnZ1hubHlqYm1NdHc2T1ZW?=
 =?utf-8?B?ZDBJVkE0Qi9Pdk5BT0lPWmc3M1hUaFVlL1N4NFQzZDNMY2dSTmVnQmMyNFZy?=
 =?utf-8?B?RndSMTBPMmR5NVBMSE1TSXphN0pXM1lwNXozc09CZEZHMWN1SnZDZENFY1Fn?=
 =?utf-8?B?RWppMEpuZjE4dERScXFhN3RXSGp2dGtTczRhT2ExR3Q1bjk2L2tjV1pmc3hZ?=
 =?utf-8?B?dFcwcUEwbHF5RUE0aUprU2x3bVB6NisxdG02QW8vLzdmM3VmVGIyeHlxekg5?=
 =?utf-8?B?NkNKNHJrRXFjMzlwYmlldUdsNnZkWU1hRTE2T2Z0cndKK3hOOHA5WjhlWGxu?=
 =?utf-8?B?bVN2ZmhlSElmdk83MllqRlR0allGZVcwcFc2RVdVWWFZYkJoblB5UVBCN29H?=
 =?utf-8?B?TFRONWoyWExsQzZSSThKaGVoa0lOZVcxZWl1d2UzU0tMam1zemcrR3c1RnZt?=
 =?utf-8?B?aU45VGEvSHNNeVp1WmZycmhFVGZlWm5RZVFEemI4T0F6cC9Qa1piTnkwNklC?=
 =?utf-8?B?bmFBbS9TbDl4YkJSNTNWbFZQVWdTTjlmUjRwNG5BQnRhYTA5cmwzbTRYczlE?=
 =?utf-8?B?VDV1Rkc1RmRjNEVSVTJaaUJieE52ZVhJb0tNaVZsa2o0MUIwdWlUbVJVcDFU?=
 =?utf-8?B?SnpEV0ZkMVNMNWgrajg1NTBMaFNzTkk4SVNHaXppWWxhN3VuMm02OENYR3lv?=
 =?utf-8?B?OTZadzBsdCt6akhKVmQvUlQxd1U1WkpmejF0TFBBY0tibFFyNlhFS0NEeFpZ?=
 =?utf-8?B?ZnBWcW9PYXpnbnRCTGtmbWlqWEpBOCt5b2NUQ2g1VWlVVkl2dXhQdmM3cVFi?=
 =?utf-8?B?NTJWY2VNdldFVGZWUS9sU043cmRXZnlJWFJBVS9NZE02NjMvZzNCSHJuSXFX?=
 =?utf-8?B?K3BkWUZmWXIxS2E1MWROWksrR092Ris2ZEwzN0RhWU9rSjlpWXUxaWRoSzQ1?=
 =?utf-8?B?NVpleTBYeEVQUjg5Q3g0K0VTZlZ3bzhBeUJZdVBrV1Mrc1ZCRDRxaEhLcldZ?=
 =?utf-8?B?aEVrOHM5dEQ0V2pLWmlnMEMxUnc1L05JNGY5RmZxVVNkdTJRWFpTRE1uZkN6?=
 =?utf-8?B?dTF6ZlMxbmFyM2FWcUtVMXhZUXROREc1VTdjaHRqVWcrQVEyNWRaT0IzeHRG?=
 =?utf-8?B?cUowSERJVnBaUVBvOUJxSFRVZ0lNakUzODNXNzlSUU5GZk43amNlZlNzeUll?=
 =?utf-8?B?dkxjaGhnNnpzU0Vqc3MxTi9YTk51ekxqbi9OOXVXcXdaNXMxTnVETWpMdjRt?=
 =?utf-8?B?VzcyWkdQdE45SFhxZnRtZFR2clRSNVNNa2dmY2JEZXA3N016VHdTaHpLSCth?=
 =?utf-8?B?aU9wSk9zYk5BeEVTUjVMUXFCNnVGQjNCa1R0LzlOV2dUYWZheXdTQU1NS2hT?=
 =?utf-8?B?bGNRdGtTZnhCYzBiaWs1cXNyWnkrZ05mQWs1b2o2b05FdWpaUkJYeklHcU9R?=
 =?utf-8?B?R2ZsckZSeGl4V1JGMTVUUFFwT2FtcFRoQWxkK1plQnJXRllPZzBtQzJMcksv?=
 =?utf-8?B?bUxDY2hObXhyTTIvdzBhejVEWTI5dEhRMmNrY09waHllNFBBQXZTUzNpV3dF?=
 =?utf-8?B?UnlKN3FidXBiRFpuRk50bTA5ZURSdEJoa05OUzQ3NjQ2eGR5YXVTVkIwbnA3?=
 =?utf-8?B?VFBmSVNid0JqK3VQb3BsRjdGSVFyMUxhVVVaaUIzZUhxRXNhNDhEa3FNaVFs?=
 =?utf-8?B?b01oaVpBSUNSQ3NCVU9TTHo0UEMzaUo1RWlqU1BLNjBPWFNaaVNSaUlZR1Nl?=
 =?utf-8?B?eU1Zdkx6aStUaHR3eUpDOHpDcGVyUUNLRUhoaVBXUHdLT2Y2ZDlkNWN3bGZ6?=
 =?utf-8?B?NkgwWS8wYmpDaXAzazJJVU1IdElib2syZzBncWJOaHpTZTZJemQrY0VnR2Ex?=
 =?utf-8?B?SHNRczgrczcwMlVGWHlXRmlUOFgyM0pRMS92dkZxQzVKQjdKaFNmcU55NThS?=
 =?utf-8?B?TzlRd05LL21yM3NOWkx1REZWRTVzWWFtQ1FtbUJOT1pYS3BDS3lJdy9NcG14?=
 =?utf-8?B?NHlmQ1NZRHJCTFJuZEg5RStocTlqbFRmYWJFbDQ5NE1YOEJncGJYSi9pd0E1?=
 =?utf-8?B?K0N6Q2JrS1Uxc0RJN0FTNVBIc1A5YVkrV21ObWF1NE9SR2ZDZUN4SjZ1bDI4?=
 =?utf-8?B?d3ZBWWZvSmpWMEc3TnE1TFRXdlR6MnJtTmNIT3V2QkkrcmZaZlVVamd4bnpC?=
 =?utf-8?B?enM4TjgrMjhKOGtFUm5sNENTQmdiQXQwcWdLRnp1akVtUVIyMXZOUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c3dfc124-f117-421f-8cfe-08dee8c5ebd1
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 14:23:09.7424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YOwZnqFGwlvmZGrFjdPPL8BZVrkWrJuCSmjMjP9Xyq8MPBWHLgltPI8pxphqu6LuRrl+oMHjGHjawxZByrRN0aSCmcbnjax5hm/ypHQnDs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12311
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vx8FIyWfDj1zupmMKODdWb6L42KC/47+ooX2ScAKN8s=;
 b=Uy4JEQ/6Mtpk0OLTeKAUFRqEUmh7ZW26/sMwLwBOjPGfUDJM2b2zSra/tyhLYSRUMW2cJXBO5WCM07I8o9KFK0Qgrm4Rt+fPwg9M7/x0iJGF5UH8zVoFcTWPlOdev0yVk7tb+T+atGPKI6dB8kx8Q2KVjRN4XsoCa38iGjbivOs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=Uy4JEQ/6
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 7/9] utils/generate-cyclonedx: support for
 v1.7, 1.7.1
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
> See changes:
> 
> - https://cyclonedx.org/news/cyclonedx-v1.7-released/
> - https://github.com/CycloneDX/specification/releases/tag/1.7
> - https://github.com/CycloneDX/specification/releases/tag/1.7.1
> 

Seems like there are no breaking changes, so this very simple patch 
seems correct to me, thus:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
