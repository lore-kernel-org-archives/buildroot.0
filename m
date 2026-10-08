Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A65CA600B
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 06:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB6F6810AD;
	Thu,  8 Oct 2026 06:22:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syPMRin-xnTt; Thu,  8 Oct 2026 06:22:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E2A4181107
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791440577;
	b=fIYFxEWX0mwb+eFEhfWKDT/7PjEjGy+fA3OU6CO1SfPInYjRDKiiEmZcHVbiVxfD0PKy
	 JCJCJyCJTUUK2MM+QOBLTyNnZs1nzUfUj4CiVyZUH+k1fPBF9fu5nV7921D0rguOqikWy
	 nKt99vyFUgBheAwgtuN3ZytLwUKQqFdFeri2ov2//a+lMp2nfb2elDT6D82qNYpYcNDn7
	 VaxnPFJ7wI8x2dPmC20Nsi2CbXy8VmO4MZ7x7qTnENlBXuiUxM3Ewx0vR40P7Cm9mq2Jm
	 1R7vy5s3xO0/7qnKWTP4Mkc9K69dwEyFgRTqLExc4N/LZ3lXNvKQKjbq23Sjh+G2oYg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791440577;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:To:Cc:
	 References:Content-Language:From:In-Reply-To:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tU5bOL2X3STfOA1l6caNUXACrlIDagNaoaiEUp3Y1Jw=;
	b=bGurtxHKiQhoE9Wur2MeVvgwgxYAxg6aAfOl6sb3CVJee5AE+Lp9riWioljiyMm5V9r0
	 U3cSqlm5CwXBldte4NcAcVTjFjFZqgPb7K4l5RSZbcmPuMR84lmtg0NOdE+j/1NRpuDgY
	 LSST4YLY35MsFpQvOn9Jq6mDqofUMvJqK+TjpVjEg4L5LEY26S+O+iS/XOzo/pP+IZePq
	 X2MsBoIxPimMGDuNASqIDbfkUWIOUmtE6rE+Xdfq5IZfL4DKi9wM+f53qi+V2XyQmDBXX
	 o6YebzMz6lay7K2U6GkR5AsMne3k6Ln1A4p0jT9tkLiAZKobpSRMyOQ4Z+OIh+gRfaQ==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791440577;
	bh=tU5bOL2X3STfOA1l6caNUXACrlIDagNaoaiEUp3Y1Jw=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j0ZoKiJixpqdzW51cDBXr/h2qylm295Fqnb6ldBd08DneAo8TubssyRHVycHM81uA
	 PicszwX0ZKA1cOtH0TekRz9rrgSnebM2/NZPxV/E2PmGzoQ2Fx7V6fFbRV0R13wBC6
	 y4XRxIvtTfrxkZxCRAy4KISPQQ179VREBXXedLcvUyU0OV7RGoXX7nwGa+WsC7WJrQ
	 WfQ3oVNthkThkR85FAkznghmjRuvJbPIBCBAnRG5P+gL6hdFGDaQdkzWWeLQDz5ae6
	 O1T7qqQWakjmqNpoRT/hkn4y05BbDd4zf2cWlFj3Dcr6qYrG9QABxuuXMz453UhiCD
	 Xtrynd45PWr/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2A4181107;
	Thu,  8 Oct 2026 06:22:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 392462B2
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 06:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 369CF400AA
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 06:22:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lhhxtqTzFf1b for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 06:22:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 193D140062
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40e::"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791440573;
 b=RUR7AlNEcx0Hi9n0sEtlaGGuGq6iOJBNFh2RjefXayaqahktevuzMDFHmM5ok6uaANVA
 grCuPf3vH69itwkrM42rmcP56P710H8DaiznRMI8MV35cbGWXooJlNR7xt5QJ+A67tHBr
 EHqQM+rImbzXR6LarJKvLiFiK8TqApQSjGe8sevXN1UlEyaKrCw/il8eYE80q4npXTMXv
 DCy44JfKj51Tx8grtzizXPjT2AHxNJcIfE+PQtCFxherR7XIYLE+kE5uhqo9sdOWimyB2
 zVg0I30bMqOWmgIYm5lrt4vVQ0aa6lDlAnZO/oegKVQFSrgKUEVXX48pDawMN3hKuPA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791440573;
 h=Received-SPF:DKIM-Signature:Received:Received:Message-ID:Date:
 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
 X-Microsoft-Original-Message-ID:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
 X-MS-Exchange-CrossTenant-FromEntityHeader:
 X-MS-Exchange-CrossTenant-Id:
 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=Tk6Wj7rWObI9IuBl0p/9CtLELCGaRF2XRvyZF5VdMeM=;
 b=gPmpL3oU1qfoKELRqKkfZA5YF3TFb2ErTwUc+lxxum0RybKUDp3W7+PFSkRSubAHJ5F3
 0TpB5uW8YrezxiFG52Sd6bebSvQsgp+jTw8rfvbnueqRhDqfRKNz1STW4hlNGblfievYF
 61N2bYlI1HdCC4cDOP2R820KgXc47xhszkJXzIBg+6SZoskSoqfFJH11kEnTCuJA3/2h5
 +nQMGo2UKR3yXNKT+deN0Ndpwydd1jkqWmcw8bk7piB6jTIZ5zz4EQ0BTqoRXIMRAKmpg
 OCROYH0vxA3LwmJ/xWW8yXz1uWoVrRZb2bbPY5H0yQ8e37KwTdtVPs5hzX2z4nY6lkQ==
ARC-Authentication-Results: i=2; smtp2.osuosl.org;
 dmarc=pass header.from=outlook.com; 
 dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b="o7ldHBv/"; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:d40e::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40e::;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=o7ldHBv/
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40e::])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 193D140062
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 06:22:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgMvJpY8NWc83nvb15J0Ga58EDrCvc2pqp5Vs5XKqwj9d3HHI5AtdCUm+af4yj0GYpGtLS8l62Zt+bRnw2s9Q8esQ26X2/1H0aonPLhyOE+7UFhpLrc+Gfog9lkwWQHwkpfaAoKDUifV8M7xzzB7FNQhqA+Ch6XKKHvLlqutUqIN0za5zPUiJzn8RpLqQx/FrHws/9pQ1j10TjEwpoKNieH8/Df28It7fXIhUmy8jxZj7B58Z69XilUrs3o180QA04tKl0Sm2J8E+9MuZZC9C/cBBhtUjxP+VcCEnc2fk1SM9r+Z4LbU8Zg1yzq+afeoaatY3uyU5P1sY/UvPOmt4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tk6Wj7rWObI9IuBl0p/9CtLELCGaRF2XRvyZF5VdMeM=;
 b=NTjrKetFNZeYUJEO6rF94ho+qlK91UV2h9EMndhPSns0sRAw3RHh0YaApxjPaj+xZrVkD/SuaMbfbPlDaLwXqBYY6tYN/lUiKpO8w6r0wzb/NwEahBp7xICZZaLbquON2vIjyPSiFNoSJr08gtA8BXQR6m74Kc4/JwwHv7CcXC9evULzM7yrnxVDnvEdGO5W8ELfFpW4iF9WoeaTwdEEr2cZ1j2J16pT7rCDJMvMjiV3Bw9pvjNlELDw0skgGKDgFNbET9j71/UW3ccdWKC9PGlaAbNHPB6t8+M9Lq20v2iN6LDJ4VbPUYW7WHOnqjXytashuL7R0QuhAssA+EWwQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tk6Wj7rWObI9IuBl0p/9CtLELCGaRF2XRvyZF5VdMeM=;
 b=o7ldHBv/sQFD6ErjSxrYOel0A+13boPvikBPJ+QgWd7Ejh00TuLxQDknj8f/beN3C2IJt/Xu2tyUkbRh/MA/4Fhb3DQ3e6izQ/vj2t9XsY57++a8RiB3L5ygjvIaNIvCOFgmPcNWz/LrlGHMCiWahh3pfxVjYXhZuIf4cniUf0Adf7sO9AH03nVFSLcVZviN+PeM/AQuDbwdUDNePEGZnwFunylh6knVB6mmm/CUkpEoXJsA84Q8yxDluWweuVEBAqiiJ0JduYFt6cOdICBh+cv76fMjVxGrPONGQcm4JO/G2/7byaR3/Fv7gr2+PJMoQEp24l6xiwFyP+5F14z6Wg==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY9P300MB044782.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:37c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 06:22:41 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 06:22:41 +0000
Message-ID: <SY8P300MB00412ADFB8EF49FC53CA635EB5932@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
Date: Thu, 8 Oct 2026 14:22:31 +0800
User-Agent: Thunderbird/154.0
To: Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260727-perf-fix-v1-1-6bffb9146263@bootlin.com>
 <asYn5Z6J9aX3h1tS@blinky> <37119eec-f213-4fca-a54c-2c4af2b3d3df@bootlin.com>
Content-Language: en-US
From: Fengwei Tan <tfx2001@outlook.com>
In-Reply-To: <37119eec-f213-4fca-a54c-2c4af2b3d3df@bootlin.com>
X-ClientProxiedBy: TPYP295CA0018.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::19) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <1a5f069c-7e91-4884-8ff6-174792f824d2@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY9P300MB044782:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f746355-dead-4df0-98e9-08df25048e8c
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|4140399003|19110799012|25010399006|12121999013|8060799015|41001999006|24021099003|6090799003|23021999003|15080799012|5072599009|40105399003|52005399003|1602099012|10035399007|2607281247196008|440099028|4302099013|3412199025|26104999009;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzRvQXM0OUFFNVlBSXphSlVjTk1ZajRWVmlaL294bFJablZzbFVLOWRHc0I4?=
 =?utf-8?B?Vm8yZCsxZ3NuU2Jna00xL2djbVVtQ1FVVHB1aGkvOW94L3BpU3MvakNXQms0?=
 =?utf-8?B?cDg1VEt6RlEvMUh0dzNkSHJ1T2ZzNDBXVXIrTytQVVU2eU85MUpHZ0FIdkp4?=
 =?utf-8?B?UzlzYTBwYkRZYU1EQ2pFV3cxTGg1ZjNpNFViZzZYY1MwNENnNkcxdG9QdDli?=
 =?utf-8?B?K1BXWVJNSzNFRGh6ZmR2L1UxVGtBcGIxSnlOQTNIRWs1K3JrZkR6Z3NQNjY3?=
 =?utf-8?B?SFlyMTgxZTR6UWlXcTh2bE1VRzJrcWhMcXZnc2Jsc01sek9iSkNpVmJqYm9x?=
 =?utf-8?B?MmcrMTRmYWIxeWxrRndrYUZFWUpXeFpQVzNDWGJYamkvZmJPRVR5R05BSVJM?=
 =?utf-8?B?eTNhWFRjN1ExL2sxdWFvZFh3K0NCOGE5cXV0VU9ialA3bmZNYktoUTdqWEVp?=
 =?utf-8?B?TEJ2d1pyK0paaVZ3QXdRT0w4bDBsYnhmcjFVVGttenFoQ0s0SnVjT2d0dzVp?=
 =?utf-8?B?UkNmc0FJSk5yaWZNbXEvRVJncExMZEtSMUx1K2NVWm10NUttNG8vQkNmU2lp?=
 =?utf-8?B?TXZRVm1XMU5kdHJQRFZ0S21lTnNtNWhyWCtmZ29xMXhQdDR6VGU5RVJrSmtr?=
 =?utf-8?B?U2NOSzRqSGNLSzIrMlZpUFhuTUdIWW1DRVF4MXlwWWQ4V0J5QkFFSkphMndU?=
 =?utf-8?B?VUtpVTlTMFllMkN4U3ZheCt0MXZUTmZxZ2FQODlZaG4xbHoyZDA5Qloyb3ZZ?=
 =?utf-8?B?YnlKOTFLcWhqaUloZ2JVUktCZjJBUXlFMERmb1c1WS8rWWltbHlDNXdzM3VQ?=
 =?utf-8?B?Ny9hQnp1cU5sNE9vbUI2WHdrWDladitCWGdwVzNyTkZwMUhEVjBFZkhtYUNq?=
 =?utf-8?B?SUVZUTdLNmdab1FKRUtKdFNJNjZVTkxLMmd3YXBRREc3SXdxaTdyNDJoNWgy?=
 =?utf-8?B?cnJFdWFsN0h5cU9GSFVjZEU3d215SUhIWk5FYXpqMnVBY3F3SEhTU0JYeVZW?=
 =?utf-8?B?Y29hRGMvK1JJcloxcjB4ZlBQaGJGNUdzeWZTL0NMbjFKWlUzM2g1QXRGdVlB?=
 =?utf-8?B?NWJPeTdlY05FeFVHazMvZTVnc05obkdsZmVENDJqQzRjb0ZrenZXRlN4bzVI?=
 =?utf-8?B?MCs2T3lybGsvMmEyd0JZUTF2VWlCRWp0N0FxYXNFOE4wTjJtM0ppaEliR05H?=
 =?utf-8?B?LzlHNlpkckRIaG8wZzNHU1NMVms3cGNla0NjdUlaZERzVE1BamdkcEI5eFBm?=
 =?utf-8?B?NUlFeVN3TkNENEdOVHZWY05VYUdhUUlhRDVaQVlpZ1VCcXRXMno3Y2ltUU9L?=
 =?utf-8?B?eUcwbzA2Z09halB4Z05IM3BEdDJ4UXVYeXQzMUFoSDdMMmh5d1JSeUdsUjY5?=
 =?utf-8?B?K05kVTNSdkhjTEJqcHBwUHU1aW5lWDZHR21wbFlFVVIrUXQwaTVqZG9JY3Jv?=
 =?utf-8?Q?H0OAm0JG?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVZPeW5xM0hzbW4vK214SE05ZVREUlFqS3ROcDBoc2dKeWh4WlV0aDkyZ2ND?=
 =?utf-8?B?amZOQlFQdWVYcWdvY2ZPS1VtNFgvU2ppU2h5N0F4RFprQlBSVy9jemRxTlhX?=
 =?utf-8?B?VWtaL3lKYnlaaGRVUnZQYTlLN2ZVTDYzWlQ0dWVOa0xtQWozVWdsRHY4YXFk?=
 =?utf-8?B?bUN5SjlJQWphall2ZEI5eW5PSDNvRTFEOFBwUnRjVi81SEVWZXduVkxLL2ZB?=
 =?utf-8?B?U2EzN0hicHk3ZGl4cXJ5UGJqRStibXFhMm05STZnNE9hYUF4VmdvS2VYWkNr?=
 =?utf-8?B?cjMySGNIeWFUZDhBK1JvQUxHQThGbTQ4YmtUdGkzNTliMW9HbzJvcUdzYndG?=
 =?utf-8?B?SThpTjVyeHZkUC9tZys0U2p0bWZvblJJTnZMNml3TWIzbXFnOW9FTHBmYXBa?=
 =?utf-8?B?bnIwWnFQWkUwRWx3NlFqNEhwd3h0MDhkczBKQjVST2JLZHFreE9rSU5rUmFE?=
 =?utf-8?B?SkR4OGdzL093aHUwYWg0aEZNdmJlM1FUdzVGdytTNThLQzFQYjBWazN2TnU2?=
 =?utf-8?B?S0FTSDNTTHdlck1JcHhDK2tMRUtMS202UXhtcDlvOWNhNGN2elNQM05XTkln?=
 =?utf-8?B?TzJsYkdtMUU2ZjJDSHdWaFlyd2RoKy8wMlM1aTdiR25kN0tlbU0wNElHT1Rm?=
 =?utf-8?B?d3o0bE5ZckpITmlqYS9GckU2YUEwa3dGeUlIV3E0anlHRGJWNDlQVUx4dWdt?=
 =?utf-8?B?S0V0NW1VMFgyMGJ3T3BzMG5JenFsT2xpUFpTZkEwOE80b0hVamdab09VNi96?=
 =?utf-8?B?aU9qa2RlbHdOd2VWeG9KU1dRRUN3eW5neExrQjRZODI5MkQzYXgweGJHeG45?=
 =?utf-8?B?TUtzeExEdXdaL2pMalV6OWJsUVYwQmwwa2pjelNabzV2SStRSFRONUtnaVUz?=
 =?utf-8?B?WW9ONGtRWk9wRzY0LzMxSjNmSUNJbkpiSWplVFV4K2JNcWMwQTN4bmcyZCtx?=
 =?utf-8?B?K3p0aGxybVdTRXhRRFlNc0Q3aVRCN2R1OVRHRStUL3dwa2kwNGlsSmY4ckJ0?=
 =?utf-8?B?S2ZIaTB5OENBaVBsUVp6UlE2ZytOL1M5WEdETEZWelZ4U2cxaGJUL0x4YW9a?=
 =?utf-8?B?WWtEK1A2VUFMTGtWL1M0M0JGYVlGa2pYWVhXU0cwbm10V1pCN3Jma29TRmFK?=
 =?utf-8?B?ejJSR1Q2WkYxWkxvREFNazFYODFJdHU1YXZZR3dSRUlpRHlBM0w5a1JrRTlG?=
 =?utf-8?B?NDRlRG5acVU3ZjJpZXNPdGFWbUFybEpMK0txWUxzcytGNFVMNU9WTEhpcU14?=
 =?utf-8?B?dTUxWnVDcnZQOEFWSTJwbDJKZzM0UFh3cis5VkNMWnFRSmFVTlgzSURQNlpI?=
 =?utf-8?B?T2V2cUVBbmVLNkNKblVCVDlydVV3VThWTm43LzBTU09XcnlIQ1hLWktJRnZU?=
 =?utf-8?B?YU50RDVLT04rd2dlRFhva0Z5c3BnbzVISjRmUkE0UTRFblJUUkNDbDBMczFV?=
 =?utf-8?B?cUlQenpReUJhcG9pRFJySlRYZm5oOURNa0p6NmJSMnhyZk9zazhhNDVWSExS?=
 =?utf-8?B?M0xtTldmVmNWNXlEMnZ0NVpiSER2cThTM2Q1Z2hTQUtjckJkamhCRlZ1QWxj?=
 =?utf-8?B?bEtXOTRhbkZtTTEwaXdGT0dXQkxTaVJmQkdtSisvdjhoTFlpZEpiZGdORzRY?=
 =?utf-8?B?OFRSa2hxQU1kV2Ztb1hIeTVpU2pJU0tzeit5eUpmd09tM1JPSzhFSi8rckQ4?=
 =?utf-8?B?MkVtRm12aHFwV3U2L0s1c1dPcUQydk1WNnBXejNYdk90NVY5YVNxVFkwNTJy?=
 =?utf-8?B?bHQ2TFYxcnYraXZXVWdiT1pRMEdEdjUzcjhsTlZmQzgyRzhsMCs0eDl0TmdC?=
 =?utf-8?B?WEE0UW1STzZuRmZRVFBJa202QUZNZnB6N05qVFYzRjhvYUtjanppKzc5Yjht?=
 =?utf-8?Q?BH5aCfJVKF6kO?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f746355-dead-4df0-98e9-08df25048e8c
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 06:22:41.5186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY9P300MB044782
Subject: Re: [Buildroot] [PATCH] packages/linux-tools: perf: explicitily
 disable rust if not selected
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoK5ZyoIDIwMjYvMTAvNyAyMTozNiwgQmFzdGllbiBDdXJ1dGNoZXQgdmlhIGJ1aWxk
cm9vdCDlhpnpgZM6Cj4+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saW51eC10b29scy9saW51eC10
b29sLXBlcmYubWsuaW4gYi9wYWNrYWdlL2xpbnV4LXRvb2xzL2xpbnV4LXRvb2wtcGVyZi5tay5p
bgo+Pj4gaW5kZXggMzIzODk0OGQ3Ni4uOTcxOGQ4MzEyMSAxMDA2NDQKPj4+IC0tLSBhL3BhY2th
Z2UvbGludXgtdG9vbHMvbGludXgtdG9vbC1wZXJmLm1rLmluCj4+PiArKysgYi9wYWNrYWdlL2xp
bnV4LXRvb2xzL2xpbnV4LXRvb2wtcGVyZi5tay5pbgo+Pj4gQEAgLTEzNCw2ICsxMzQsMTIgQEAg
ZWxzZQo+Pj4gICBQRVJGX01BS0VfRkxBR1MgKz0gTk9fTElCVFJBQ0VFVkVOVD0xCj4+PiAgIGVu
ZGlmCj4+PiAgICtpZmVxICgkKEJSMl9QQUNLQUdFX0hPU1RfUlVTVEMpLHkpCj4+PiArUEVSRl9E
RVBFTkRFTkNJRVMgKz0gaG9zdC1ydXN0Ywo+Pgo+PiBFdmVuIHdpdGggdGhpcyBkZXBlbmRlbmN5
IEkgYW0gc3RpbGwgZ2V0dGluZyB0aGUgc3RkIGVycm9yLiBJIGFtCj4+IGJ1aWxkaW5nIGZvciBy
aXNjdjY0LiBEb2VzIHRoaXMgcmVzb2x2ZSBmb3IgeW91Pwo+Pgo+IAo+IFllcyBpdCBkaWQgc29s
dmUgbXkgaXNzdWUgKG9uIGFybS02NCkuCgpJIHJlcHJvZHVjZWQgdGhlIHNhbWUgZXJyb3Igd2hl
biBidWlsZGluZyBmb3IgcmlzY3Y2NCB3aXRoIHRoaXMgY29uZmlnOgpodHRwczovL2dpc3QuZ2l0
aHViLmNvbS90ZngyMDAxLzY5MDJlODQ1MGVlOTNhOWZiMmRmOTczNzVjYWIzMThmCgpUaGUgcm9v
dCBjYXVzZSBpcyB0aGF0IGhvc3QtcnVzdGMgd2lsbCBvbmx5IGluc3RhbGwgdGFyZ2V0IHJ1c3Qt
c3RkCmxpYnJhcnkgd2hlbiBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBP
UlRTIGlzIHksIHdoaWNoCmRlcGVuZHMgb24gQlIyX1JJU0NWX0lTQV9SVkM6Cmh0dHBzOi8vZ2l0
bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvYjY1MjVlOWNmODkzOTRkNDVl
MWM3NDA4NWQwZDFkMDM5YmQ4OTBkMC9wYWNrYWdlL3J1c3RjL0NvbmZpZy5pbi5ob3N0I0w1NwoK
VGhlcmVmb3JlLCBzaW1wbHkgY2hlY2tpbmcgQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQyBpcyBub3Qg
ZW5vdWdoLiBJZiB3ZQp3YW50IHRvIGtlZXAgcnVzdCBwYXJ0IGVuYWJsZWQgd2hlbiBhdmFpbGFi
bGUsIHdlIHNob3VsZCBhbHNvIGNoZWNrCkJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX0FS
Q0hfU1VQUE9SVFMgYW5kIHNldCBOT19SVVNUPTEgb3RoZXJ3aXNlLgoKPiAKPj4gVGhlcmUgaXMg
dGhlIEtjb25maWcgQlIyX1BBQ0tBR0VfTElOVVhfVE9PTFNfUEVSRl9ORUVEU19IT1NUX1BZVEhP
TjMsCj4+IG1heWJlIGluc3RlYWQgb2YgZGVwZW5kaW5nIG9uIFJVU1RDIHdoZW4gZW5hYmxlZCBz
aG91bGQgdGhpcyBpbnRyb2R1Y2UKPj4gYW4gb3B0aW9uIHNpbWlsYXIgdG8gdGhlIHB5dGhvbiBv
cHRpb24/Cj4+Cj4gCj4gSXQgZG9lc24ndCBzZWVtIG5lZWRlZCB0byBtZS4gSWYgaG9zdC1ydXN0
YyBoYXMgYWxyZWFkeSBiZWVuIHNlbGVjdGVkIGJ5IGFub3RoZXIgcGFja2FnZSB0aGVuIGhhdmlu
ZyB0aGUgZGVwZW5kZW5jeSBlbmFibGVkIHNob3VsZCBiZSBlbm91Z2guCj4gCj4+IFJ1c3QgaXMg
YWxzbyBvbmx5IGJlaW5nIHVzZWQgYnkgYSBsaW51eCBwZXJmIHRlc3QgY2FzZSBzbyBpdCdzIG5v
dAo+PiByZWFsbHkgZXZlbiBuZWVkZWQgZm9yIHJlZ3VsYXIgcGVyZiB1c2FnZS4KPj4KPiAKPiBJ
IGhhZG4ndCBsb29rZWQgYXQgaG93IHBlcmYgdXNlIHJ1c3QuIE1heWJlIHdlIGNhbiBhbHdheXMg
Y2FsbCBOT19SVVNUPTEgdGhlbi4KCkFsdGVybmF0aXZlbHksIHNpbmNlIHJ1c3QgaXMgb25seSB1
c2VkIGZvciBhIHBlcmYgdGVzdCB3b3JrbG9hZCBoZXJlOgpodHRwczovL2dpdGh1Yi5jb20vdG9y
dmFsZHMvbGludXgvYmxvYi92Ny4yL3Rvb2xzL3BlcmYvdGVzdHMvd29ya2xvYWRzL2NvZGVfd2l0
aF90eXBlLnJzCgpBbHdheXMgc2V0dGluZyBOT19SVVNUPTEgd291bGQgYWxzbyBhdm9pZCB0aGlz
IGlzc3VlLgoKQmVzdCByZWdhcmRzLApGZW5nd2VpIFRhbgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
