Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FF3C531D4
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 14:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FBF040660;
	Thu, 23 Jul 2026 14:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9h_TYJrXQ3Z; Thu, 23 Jul 2026 14:51:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5E5F406C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784818269;
	bh=+Nq7t8zyrhUrniMoCibiG0elOOlfgB2mA5tB9E4ppk8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Bu/jvcrXmwDLHukNEmnNuXGuBfs5Ud1ID7rbldcL9zN1hgQcPLAefYjeQ7yqAo3zP
	 qHTjFJDqk6XiR6F0GjXRRQB+SAcqWQT3lrXmHVcJgsRX+CSQcAE7JEWC1Zmqm9l1of
	 SJoC/X0ZCboJj6iOXmCn5rBjt5qKOfF4Wmb+Af05kmj+94JeufvulXD0ux05WAU+NO
	 eSEuqp6v89fETnendtryIHqXUvlIi9XIbdEtmSWc9ahTtg5uK8b47tQIAgjtxwJ6H0
	 5HktcrYOXPx5e7BtNRXX++5S/K0Z+59K2tWApDHUnYrXNe4mnDwSgP+lsU93qZJhb3
	 YiSrT74FFrAsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5E5F406C4;
	Thu, 23 Jul 2026 14:51:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EAB6707
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 14:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 402F4406C4
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 14:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uRcoAbqYkd0d for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 14:51:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c20a::7;
 helo=pa4pr04cu001.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C01540660
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C01540660
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20a::7])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C01540660
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 14:51:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0IXlG0q11hVhIH9JZLVjZO3wlyZEvh6gk9FarQlte6hdeAcDPXr9KrRth5MniOMJVgJ7Utpa6LM0sm9IESS6tbotv0LKScnl0+XZjCsYk4+mHUfiZ53UXUAiCiwPHZUQ7CA4k3LZJ4novy0DTuJg8F9mjQsz8u+oOdWmOp5u9IqNODCDWcxVmsnroUxyfL6Q6+0klqfiD7qJfOrGJw4rlR+KkGqPF82JEsoH5/eppumOwW4G4cYPE5z6t7vBsRIygjAlRTdzTRRWmYIVj1qVFPv4E/M+tg3BT/lzlr5pd38K0Gl+d5I5pi09USmO+J2vG2sgFoS7TPOgswvrc07pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2XadUYLVd8PcF75kqzgZmiBN/1xa+zxYBXXzx/dBiE=;
 b=r59+7vvNoTucf2qTNp38KigNM8vmLKEfnTnaKsb547xmZeXfVms7kLB/m8s9oJ5SuRe7gtD+JWWdA+dX1bvznx6tT6uHkbe6703Dr39huDjjDlwaf5lVW49WaKSVBd537oGshGz/0+1WS/F2rdytnRZgHFloNsZuJJokOLQktFO13G6B6BJ4t1vBFHg8kOBYI57guivRJhSjVfn1wRCMEam/l1HLcnOSHsX31tMoeEbw8Qnt7XJ2bhQFpCfozF75bZOzbNr3Ac4nPVZDbncZNP9D94/E1JceWIl30LlMvmEMmIo6xgSnXqyTrnhkkxUmOfDh9DTHJXZqzC+0emWo1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by GV2PR04MB12168.eurprd04.prod.outlook.com (2603:10a6:150:339::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 14:50:59 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 14:50:59 +0000
Message-ID: <ba19d6d7-c2fc-4e1f-8b62-095c3d889711@cherry.de>
Date: Thu, 23 Jul 2026 16:50:58 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260624101340.80670-1-thomas.perale@mind.be>
 <20260624101340.80670-9-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260624101340.80670-9-thomas.perale@mind.be>
X-ClientProxiedBy: AS4P195CA0021.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::9) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|GV2PR04MB12168:EE_
X-MS-Office365-Filtering-Correlation-Id: 16a50847-8439-4db6-10da-08dee8c9cf0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|3023799007|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: uYHvDFBBK2WHY0YtmnSZfeJb1Vactl1W8CIKBe3vTEgdIEXKo3c1qJ31UvP79Dv8bP2Da714QWzbKfNyA7MAqUCCY0NzP6uEK1CxLua4l2nm2ugy21ikGLZ18VKQQL+q0IE+Tb5VGDYNTpoaNuSKErf0aq0Hd22MRKuYPDwJUg4LVeAeIZabOfz7YRqp2P0SCkBOubRV+3scA249mzElQRHb000fsgoXQHtUZMWmZ2cJHvXz2tPVtoFMPi0MbEvdsAvBCcedUu/VlAMiByvhgK8ZpMMgT9bj0yXy1loxv+wX2nSKTdONYwHQwBBGqSOQHZwFNyyOxpOXmMm9b/FI0wTzUBRD2K67Qu0gjawlvD81p5mj118xh3TkeDjCxFwQWrA7Dos5bVSxQNww57gVrpBOlyaqvgqVXOooJDho4YiPB/tjP3E0wsFNxyyJsa/khDuKS3kznQTfopvcZXpAo7qnGXSSPQwizgxzIKFLX0krzV80Dn/GX6KURL1dRhG5RVZO1vFvT0BAUMnvFy2tCba2hJLEnHtZmyHGyBMaNek04Be6ZbqtbIZ7wcgW7WZ2NdfO/DXSdQD77kKMZgw6LYBacYJTXem+XVE0y0JVUMhXII0ecAKJreY0Unjv2D24ijhUi37lIcXvpqp171VU3vHaZgRI/R2f8zvz18m7yNs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3dVWE1sdkhIUmdScXlFaURBY1dQRlZxSS9JSTJteTJrNUYzNDlRZElPWC9J?=
 =?utf-8?B?cVc3RkhiSGR2L290QUpXczVnSmZSWG5paHdybmRpblpCdlFBN0kvUGFhUzVV?=
 =?utf-8?B?ek43ZkdHM0NaY2t6QlVERjc2ZG80d0QzMkpSVTF1RXMyYzVkSTdpbEVsdjFS?=
 =?utf-8?B?TSsyaU16UkdpVFB2aWdhRHA5cjFXdm5JMkRTcnRUdVFMSXRkUi9hUzZ2S0F0?=
 =?utf-8?B?TDVqUmdoa3pTVkpqOUpUUHQwSStsTkxDU3gvN2NWbmJSMFRNWFgzeHEzeU1j?=
 =?utf-8?B?MjRyQzNQWFlPOER3MCtCcGtIRktUK2RkQXZwaGFSR0VxWWc3V05YSXEyclg0?=
 =?utf-8?B?cFg0Smcxd1FCSjlueTc0NHlDQ1Q5L3EvTm91blZFS3lHSjAxRzZVS1p4UDdS?=
 =?utf-8?B?ZXd6TEFEQmNVVlZicTZjSVFUdC9XVkNjVzlJMm92bFRDSG5PWHRkVUpjaFhx?=
 =?utf-8?B?T2tuUExsUWpMeTgxdnBxNG5xSVBIa1hlTWdOakJEOHgwY0o5OVBOcWVyUUh2?=
 =?utf-8?B?dnorN2NUT21CSFd5d051SGEyYUU2RzI2LzZLY0k2QmtYRFU4TjRhTFpwbndI?=
 =?utf-8?B?eG1aeWZvSmx6UStxR2xoZjJRM3E1d0VHeG42dkwzaTVBRy9aVXJuTjdtS2J5?=
 =?utf-8?B?TTRLWmRyQzkzT1RGQ01jSHArNnlmWWlHbUpzZ2JIUCtyUXZPelZtQzl5WERH?=
 =?utf-8?B?M2RUTXVOMGU4blUrbHUvMmpyVkxNd2FHbmsxQ1JRU0svbVpMamFWSERwcTRU?=
 =?utf-8?B?Qm5pT28vU2Q1ek1NY3l0MWNuKzhVSTliRy9wNzU0QWs3ZXhlRUJ2UzhueTls?=
 =?utf-8?B?OTFlWnpMSkVRWkU4SW5iMXBKUDMrR0xzV3pESUNzK2M5RjZwNm00cWlxRDd0?=
 =?utf-8?B?b1lhTTRZVitGVVcxeHZPb0FFT09OQTBEbWphS2JwcFJ3VzdkdE5JSks4TkFC?=
 =?utf-8?B?M1VOdnpTVkgwejdSZUZzRFRBVkd1WEpxTXk5YVo2ZUwvU3RoOUNZWjJTdXI4?=
 =?utf-8?B?cjBYdzIyckg2dXNLVEtHb1A3YWZSTUJkdWZIWjRPeDNnWFZvcGszYVBYZ1BL?=
 =?utf-8?B?WlkrY0JCTEllQ3VPQnNjMWM4SGx0Q3pPZmFNYWtlNXBPSWhRbkExTklaMnhv?=
 =?utf-8?B?RkhuMEFDRmlPU1JjZC9aYjRrMW9TUE9jZlJUNWd6anZ0K1pTZGQ1M1BqM0R2?=
 =?utf-8?B?Q29tWEdnQUxiUVlDZ3FBSWxac25UZklVV1UxWTRPYmtkbVpxVUtVN2x6MDBn?=
 =?utf-8?B?clJMYU9yZFRnQ0lJZmxZSlBDWXMwUnV3NHRBK3VqUVllbnFHalI4YVlhQml1?=
 =?utf-8?B?TXFFQVlKdGF6QmtxdlVTWFJxbTQxUGF1eFdTdjd5b2lhRi8yZllVeXFDekRs?=
 =?utf-8?B?NGQ2aTl4c2RjQUVUUTdrdVRtQ1VaVld2UnYwdGF5MVYwa3ZYdFpxb2JveW5n?=
 =?utf-8?B?eHVNbm54TllicmlDZXc5aUhGb0I0MkdWcFJJR1R6aFlkQlUrTmpScjdEdWlD?=
 =?utf-8?B?RDV1Ym1pR09FOGwzd0RmNzMveGtoUUNDYldJdGJxMXdMWDJxaEd2T2JPdEc2?=
 =?utf-8?B?YTJqWS85cE5HbnJLdFo5Z3BDb2hqUjI2c2V3VVJPd1N2VE83RWUwWVVXTklk?=
 =?utf-8?B?aGVScWI5VStNUFltNjYzcUdCVnd5Q0I3bWxNQzYwLzVTODB2NUgrMDA5UFlX?=
 =?utf-8?B?a0phNTRLTyt3MWlHeGc0N2xMRlZiOWhGaTMvZm5EM2pzYkd2eC90ZmkwSGhu?=
 =?utf-8?B?VUFFSG1LaU05ang1czFXV01zQzl4K2pia2xzbnl5c2lhNUVrSit0d2lzalRu?=
 =?utf-8?B?MmROTWZEZWppaFF3M1NNMXRZOStSZC9wK2lZd0E4Zi9wUHZYeG4zWTRXeXVH?=
 =?utf-8?B?S3V4eDhCNzRZQUtucVBaRWFjMW9Od1dwUEl4OXdQblNxYW1KbzFtMDU0YXd0?=
 =?utf-8?B?N3BDK2xKZ0RDQndUME03QkpsUUMvakJnZ1lqMnBPNmlnQTJvUEsrbGJrNEFF?=
 =?utf-8?B?MXI0SU90TUtteFVybWlTZXErRmhuN1J6eThENjJqY1FJMCt6T3UrdTJwa25D?=
 =?utf-8?B?cWc3d3AxdXo3ZFNGVVF2a3dIN2FUcDRXYXNUN2lkcm5JMlUvc0tscUhBMWJT?=
 =?utf-8?B?QzFoWnBqdVIyVWZmLzFZa2lOZHd0ZnpGRkQ2NjFHNkpXaTFpRXFFKy9kcDVL?=
 =?utf-8?B?djEwZzF3eWFaS2NHSkdHMENYKzY5WG5aTHhCSHZQRjc2a0hodFcyT2Q0TE1T?=
 =?utf-8?B?bDVwa09GL0FwcURTaVNKMmZxc2NUalF3L1A3RjB3c0QvZU01L0gvZTVGNGc1?=
 =?utf-8?B?dlRxcFZOZC9ZY09lUlMzZHhqcllEL25XUnl1QmwrbUlUTkUrT1JnUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 16a50847-8439-4db6-10da-08dee8c9cf0a
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 14:50:59.4332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1H/aWXyz+jLvSUuCDRbrNeuYbnPusulEVuufSMjWzxog8u1GziTnTRB8Ia+JIqXyaZC8+v/Yzy+gDXFycqvn4GUh9Mt5J+SgRNL7hK73DQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12168
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2XadUYLVd8PcF75kqzgZmiBN/1xa+zxYBXXzx/dBiE=;
 b=GALgH1mb6Sr8OuPx+EVlZO6RQGmo4haVsMRF/H3cgp/ib2lA3LPUPWGDwlwpP+xV2+sIvGCFi2BOunLeSAtr8y7qm7ug0awx70Cwj9fElR6lNPHZcmH7/SJ+ef8sWSnigNyPoVN1pvjG1GytOH4dDZzWBAxoyyJCWi77b5eMGT8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=GALgH1mb
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 9/9]
 testing/tests/utils/test_generate_cyclonedx.py: test vuln with different
 analysis
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
> Add test for CycloneDX vulnerability generation.
> 
> If multiple packages ignore the same vulnerability but provide different
> analyses, the generator must produce multiple vulnerability entries with
> the same vulnerability ID but different analysis information.
> 
> This situation can occur when generating a CycloneDX SBOM from the
> output of 'make show-info-all'. The resulting SBOM includes packages
> that exist in multiple versions within Buildroot (gnupg for instance).
> 
> In such a case, one package version may ignore a vulnerability because
> it is not affected, while another package version may address it through
> a patch.
> 
> Therefore, multiple vulnerability entries must be generated, each with
> its own analysis and reference information.
> 
> This add test case for such scenario.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   .../tests/utils/test_generate_cyclonedx.py    | 69 ++++++++++++++++++-
>   1 file changed, 66 insertions(+), 3 deletions(-)
> 
> diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
> index b91add2349..2f1109b178 100644
> --- a/support/testing/tests/utils/test_generate_cyclonedx.py
> +++ b/support/testing/tests/utils/test_generate_cyclonedx.py
> @@ -6,6 +6,7 @@ import subprocess
>   import tempfile
>   import unittest
>   from pathlib import Path
> +from collections import defaultdict
>   
>   import infra
>   
> @@ -100,15 +101,23 @@ class TestGenerateCycloneDX(unittest.TestCase):
>                   return component
>           self.fail(f"component {name} missing")
>   
> +    def _map_vulnerabilities(self, result: dict) -> dict:
> +        vuln_map = defaultdict(list)
> +        for vuln in result["vulnerabilities"]:
> +            vuln_map[vuln["id"]].append(vuln)
> +        return vuln_map
> +
>       def test_default(self):
>           result = self._run_script()
>   
>           self.assertEqual(len(result["components"]), 4)
>           self.assertIn("vulnerabilities", result)
> -        vulnerabilities = {v["id"]: v for v in result["vulnerabilities"]}
> +        vulnerabilities = self._map_vulnerabilities(result)
>           self.assertEqual(len(vulnerabilities), 2)
> -        self.assertEqual(vulnerabilities["CVE-2025-0001"]["analysis"]["state"], "resolved_with_pedigree")
> -        self.assertEqual(vulnerabilities["CVE-2025-0002"]["analysis"]["state"], "in_triage")
> +        self.assertEqual(len(vulnerabilities["CVE-2025-0001"]), 1)
> +        self.assertEqual(len(vulnerabilities["CVE-2025-0002"]), 1)
> +        self.assertEqual(vulnerabilities["CVE-2025-0001"][0]["analysis"]["state"], "resolved_with_pedigree")
> +        self.assertEqual(vulnerabilities["CVE-2025-0002"][0]["analysis"]["state"], "in_triage")
>   
>           foo = self._find_component(result, "package-foo")
>           patch = foo["pedigree"]["patches"][0]
> @@ -244,3 +253,57 @@ class TestGenerateCycloneDX(unittest.TestCase):
>                   }
>               ],
>           )
> +
> +    def test_vulnerabilities_with_different_analysis(self):
> +        """
> +        If multiple packages ignore the same vulnerability but provide
> +        different analyses, the generator must produce multiple
> +        vulnerability entries with the same vulnerability ID but different
> +        analysis information.
> +
> +        This situation can occur when generating a CycloneDX SBOM from the
> +        output of 'make show-info-all'. The resulting SBOM includes packages
> +        that exist in multiple versions within Buildroot (gnupg for instance).
> +
> +        In such a case, one package version may ignore a vulnerability because
> +        it is not affected, while another package version may address it
> +        through a patch.
> +
> +        Therefore, multiple vulnerability entries must be generated, each with
> +        its own analysis and reference information.
> +        """
> +
> +        info = {
> +            "gnupg": {
> +                "name": "gnupg",
> +                "version": "1.4.23",
> +                "type": "target",
> +                "ignore_cves": ["CVE-2025-0001"],
> +                "virtual": False,
> +            },
> +            "gnupg2": {
> +                "name": "gnupg2",
> +                "version": "2.5.20",
> +                "type": "target",
> +                "virtual": False,
> +                "patches": [PATCH],
> +                "ignore_cves": ["CVE-2025-0001"],

nitpick: reorder virtual+patches after ignore_cves in gnupg2 so it 
visually matches the order in gnupg.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
