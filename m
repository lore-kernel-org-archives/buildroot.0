Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C70C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 17:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D54F581346;
	Fri, 18 Sep 2026 17:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nz7oehUmpY7n; Fri, 18 Sep 2026 17:16:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DE18F8133A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789751814;
	b=IJJyBJaR1sTxV31Q5hurZoCyLch9Zay6767+s23gmTC1lZZ0UqqbSVkQYMXjNl/8UPqS
	 P7RPslUe3UZx2G7GfoCGaWxFaZmTZRbbJhXiAi3TynspuuhI4OGLvjozT/vexnTcgqBze
	 KhOt77hHAyYWAsGXsyI36CscRGsExZlPmv9Gn90P/yb1GjGhszj2rD0ydQ4Bv3hvgKMSk
	 xAdI6pXwWuxU3MPZQEtlEusrAHSsh440iHI+FrdEf0ludumu97mPrtgZ30xfRhaBnF/t2
	 fPC0XLDPXBr3YU6HjDKkuOAN5oUyR8nKUwxcYdZq8NUYbKx+pZX+Z022MIjzPqlnw0g==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789751814;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-ClientProxiedBy:
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
	bh=vaYigNalomhahfF8f4TD5563MC/UAmhPg14NRB44fY4=;
	b=G24F6u8vEDRc4qkaQtQ3fyQTmQlQnsu0G28rsQ7kMwItWMccVjjENg8RLAjyM6nDjs9V
	 JgmUNWZXAwJ/dYNvN5tyj1nmTsv9ufJNY5C+jbjgb6/jbi7/RCu0gQ5PpRA5WNpg+QVh7
	 uEXe5Bi6H7K1Qnc9Hk9jC68tUZ+6u0fvZsmrrIyDYbSa/HkxUFG0WaAzcezRwieWvpRSq
	 YYTcgni8WGPUlqbFCRulAjpEj8e/6ObIXYexMOJOx5d71+9Imtq2weTlMpYEJ6ljlnx7C
	 fXs5OHiRS1mu52tAX9YAlm3DFiyQspoSBatt0YaXlbhoqyPVUreeKwx6ncO19U/K7+g==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789751814;
	bh=vaYigNalomhahfF8f4TD5563MC/UAmhPg14NRB44fY4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RKIINQS1ugji3Gb3BS9A80z1QC8yxzizlm5zOMpTbey/0RY2Gb91I0b9YF2Bniqlx
	 hFq/6EbDvvLI9tfTh+CmKL1S/CG3whcAjTh/fjiWzZASPnXZ6xkFZ8HYsq6R7NZRuV
	 I1++1OIf63UW74v29BQcbH6UbKhg+3WbMQ/RaP2/Q48p2m2uqqio6JUGHGGiRp+k5U
	 9qPvHzgZuAUwXe+tDgxUm8YCyrzCCWT4yD+sDXLdF36dc1Nvn/VyHfaF5c72y3uaXw
	 iRnaP17bpRKEFKgxi/81b8JfJnYPgLuxiqLC5h7D73E+wCTohvyI48uWwvtbp/Hlpi
	 dULbGW1LNGyFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE18F8133A;
	Fri, 18 Sep 2026 17:16:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 317E313D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 162F140C89
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3klcNc9wu7cp for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 17:16:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 16B9540C01
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789751810;
 b=G0j+zAXa9KX9l2AZIaocaD/1q7/3QeX2/zJET+e2YQRRF/SVnWz83O6K6bmp1h/rqan5
 6V2aA6ukzl+mkOqdAnWDBN0fy0K4uIHrNHgDGf2rjsBg9eeLkVUlbKwzelzEIlzoboy/k
 Wg7qFbGD75LP1JqezPa15wfS/1zRYw+MvU6PHvrpBg9C+yAbUAH+nI1nss6B7YDaWPz9t
 PE8Wn7t11G6EGixstYlNguebJtj8/rWPAj87f8Sw8wUtG4gl1vLufI9y6fayGMZnRWT+7
 1l9e4wECw9DUu4ZqUQSpDW2XvKun0ZtjrK5R9GtzDpit9HWmT/9vE2BuZn5RqxXHMog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789751810;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
 Content-Transfer-Encoding:X-ClientProxiedBy:
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
 bh=yTWqjN1NuqzWQ774e2pgfzxAFqZz8gf11iavc2xDGuI=;
 b=InzDyyFdM2i5a5MFoAIDIe4TvGx+8AZdeJyZ3ZHH8HhDHvDbZ2at83bx8iDq6rvTLHx6
 8x/1bYDWuDtEG6xLxMctwrDWMuxY8V1gAUaXIVKHi78+Sa4Vou3LtbLn4VkeIP5kbErap
 vWAxLho0HKcJRqYr6tUYNInntlKY58YNYgKUhRaKbYd+gdysiwt/xWC0oTrhvicEUBYo6
 jr/1bO0VlCwkqauKFKzhSzzYK8yrFy7OFfWRF0jXpBlYCt4a/H4klfm8o3kijhnB/dUd4
 DCbEYbrpAiqUUNd00BPB+aSX8VK5x+6hi79H20ZZQUiOnhJkJrHjZiMOrjCvwSeNQKg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org;
 dmarc=pass header.from=outlook.com; 
 dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=Ypi1vSTj; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:d40d::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40d::;
 helo=sy8pr01cu002.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=Ypi1vSTj
Received: from SY8PR01CU002.outbound.protection.outlook.com
 (mail-australiaeastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16B9540C01
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:16:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSrJbMglGhT1S5u5ESzpCv+VoJLi+V4iC6lGGstMp8noyymI/zD65URF/CNUGcNJjv75/bkeCD8rIlsHlP3eNfKHJXWdmjOuzsm4o+S8CDPKjEc7EZN14FCgv9KyrX3YnvOcWIUvp6MST8dTSOe2bDM/uWxPzD4RFEkGtnqAXxqkMlBu8cdwBWA29j+PPN882ZRD8GQt6c3Ldlj5ZK3e2FjgHooGl3UPFWhsIJD9cQ9TIPtoK+WfZ7533gei/OAWzHDi+CSiWfL2TDXPduHNMHVgfl8KpheTp05GfKipP0G3DLykn4nscF3YOdr8jcYtgiv976Zw2JC9EKL2JbsKqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTWqjN1NuqzWQ774e2pgfzxAFqZz8gf11iavc2xDGuI=;
 b=ciGbnzHYtBW28AxJGgF5pMPMXNEBtATm70HMUoTyUUTPdIkRBMxr7RpITcrP05NPv3y+Uii1uTRahg/1jFVhChtlv/rIRzHHdTFgTlrxAE3mFdpqLPiUAg4klZQ1L4IFaF+nr4t+Gv0ZBTkRQd3uHf5fA5FEFJT9dYKcOLf8XsEeH2jRir+q2e02Dv0XtPdrZDgSlr4szgb2V9yHEQ7yk3RI8eLs49WrGB5BLC99jQbEmSnKr9tOUXDr5Lm1xttSiXiFJSyGdIj4vP9dgkcR2aGNO3l5HnKOW9NVkXfrKNV8+orvj0CSEfmmvrOvzeM2bwPVx9h+UDNqyNAFm+vN3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTWqjN1NuqzWQ774e2pgfzxAFqZz8gf11iavc2xDGuI=;
 b=Ypi1vSTjryWU/LoEOX5NpjQRu4tbYK4L9MamZowntA/AeKb4+LByevnaMNYzpfLxNB/p5ZtKayV0MJ1IR1EEyrAWTQtMj5MewS6MAwigTM/v3Sunld9JqLkF/mdEEdqoPB7A1eWkMCruia268rRGwXgujhZaDZRAiu24I4aXP1RJOL11FAZ4kubqn3qmtXhNDoebgBcrgg3XjRrZZcrPsjbBzLeuF9SqM2F8bbe9+5Y82t3msNWss77jRGTGLTQhIeU2XcKK1pehHXPb74oq29BZQuW5l8qJU7pEonVsiTffO+wJvi2wQ+piqNc0g8U+4PKrsc+t+nF93uWO9iQUwQ==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY7P300MB0607.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:28b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.14; Fri, 18 Sep 2026 17:16:39 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 17:16:39 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 19 Sep 2026 01:15:19 +0800
Message-ID: <SY8P300MB0041E489C3E47F709039B320B5872@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <SY8P300MB00419E6035B2DD54F72006D3B5872@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB00419E6035B2DD54F72006D3B5872@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20260919-bump-visonfive2-v1-2-bcb309feb582@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY7P300MB0607:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fccd1ec-85f1-4af0-f5b3-08df15a89a1c
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|19110799012|8060799015|24021099003|51005399006|25010399006|5072599009|15080799012|23021999003|6090799003|40105399003|12091999003|2607281247196008|3412199025|440099028|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWhBeDI4ckNqd2xWTVArbzc5ajh2VGVOM1IveGVSZW14R2IwWUdMYWZmTnR4?=
 =?utf-8?B?UzFpdU5GeWFQblNxa052aWk1cVVsWWd0Um9vUWhuc0MzR2c4TUlaN3hmSDM3?=
 =?utf-8?B?Z082cGxnZFJEdjV1czlCK0hyaEZFZVBFWk9pOW1TeTVkeFpxVDhSUSt0TjVh?=
 =?utf-8?B?dlg1WFhGNW8yTEhQTUdRV2hsS1BhWi9qNVNzenBGNEsranFqMFVsZEZvQ01i?=
 =?utf-8?B?dDJWUVdwMCtzV0lyeTBiSVJnNkRKSG5PNnQzQUl6YjcrV3JQUTdoM1NZa3d6?=
 =?utf-8?B?bFphTUdSWVV0dlNWRWNoQXBsRTNZTnFDYUJNRktSL2xVdndyTjZvSzdlTkhw?=
 =?utf-8?B?dVBBdmlldllETzZLVUhVMkx0NVVnMG5qTGNRYkJCb2krZ2YyS0ZTR3Vyd1Q0?=
 =?utf-8?B?eU5SQTk5VTRkMHByNFFHU29tem9EeDlLaVFoSEFMcmtIKzgrK2VBelE0U1hT?=
 =?utf-8?B?czVmNW1EUDhlbTg5U3hoU3JzZHovS2lUT1JJMzRSVzFVbVBTMTFGc0VwUk1N?=
 =?utf-8?B?Y2Q3N2xmVkp1VFZLaW84aksxckdBZkVyVTlqaGt6cjRxYXMrd3VFTmUzV1Bw?=
 =?utf-8?B?akliZVRsL0gxeXRaU2FGSGZZMnQzYzFrYTJob3lRK3doU1pReDI3b3I0SVlh?=
 =?utf-8?B?czllaGF4Ujlla0kra3cvVmdXQlBxUlJ1VkgvRDhHZEloc2NvQTZ1T1dyRWJa?=
 =?utf-8?B?Q0FGMGxBYnVqT3BvWTJmUlRZZ3VnWkpBRlBjdUVvVXNUVnhkYXVveitKQzB3?=
 =?utf-8?B?eVRveFVwYUptT1VzaDh3a1FSa3ZxVStSZWZpRlA3YmdLZGpxQkFUMXBhTnBS?=
 =?utf-8?B?NEVtQk9ISDB4dGJYUFd1YWxTR2VqaFdHNjJEZno5VGRLb2dpZkMrY2FYNWY2?=
 =?utf-8?B?UjlydlAvbTNma1ptZ00xNjYwRE43VGdiTjJlNnVpN1NDL01jeXVqOGVWcHoz?=
 =?utf-8?B?MFNDSm1HZGFSUVhSTzlLbFlPc0Z1YWdBYTJsb2RGRnJkeC8xWG52R0tidmgw?=
 =?utf-8?B?YTRxWE5KL05SeFdoUmREUlJPSDkxL2d0RDdkMlV6bENGZjFrOG1IZStyS1I1?=
 =?utf-8?B?NjhSckVHRHJqdnEzTTdrd0RyamNQQjRMVk9HY3VuY1ZaSWI1MzBJZkd2YUlm?=
 =?utf-8?B?c3lKakNwV3BKMkM2QlZwVnJqYjBQeHZoNkhTTGdvWTczZ2hkUkhLTDBYSHZj?=
 =?utf-8?B?TEpGRmNCZ1dEMkNRczJVcXV4WWhHd1Y0bHBMVHpjZ0NINlpDVVYrQ0NwcVF1?=
 =?utf-8?B?azZpZDI5bTllQnEwcVpiRCtTV1lqd1A1eW84NzhobE55U2prQXFXbDJ5d0F3?=
 =?utf-8?B?bWY2cEZLZkJPSERrVDJuNWN2eG1XcVdYSFNBdHZtcXJLUXhSZ2hiZWZmbkQ5?=
 =?utf-8?B?THZIcmt5aHhERXc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anU2KzJZNTdmSGx2VWdJQWVuclhXZ1c3Q3daK0M3K2xQVWwvaGI0WTdvdFlC?=
 =?utf-8?B?R3RnRHZueGtqQ0J0TjJnOEJMWVpMSlhhV2VIbXhFV1JLUitKZFJVSENidjhv?=
 =?utf-8?B?Z3h4L0FSRWtZb3RGL2JhVnB4WTdaaVdkam5Lc3JGcDFwcUloVnJqM0dXTmZT?=
 =?utf-8?B?QVhMV2Q2VDJBTnozd09NRHdsUUgvOTQ0ZmJJOFNnelJNUGo4WWhFc2dPbWNj?=
 =?utf-8?B?bkorVjRQQVVuT1RKWElVZGdWZm80U3V0SDB2M0l2L1k1My81aGFBLzYwdXZR?=
 =?utf-8?B?L0V6VVp2VzFVRXhNczY0TTM4elZ3YjdJczU1alJPMDJGbXMyWkR6VmJJTU04?=
 =?utf-8?B?UG9uRFR6ZkJwV0RZVStXVDJlaXVlcFJsMWhEOG1OeTJuQmwrai9qSmVPTVZn?=
 =?utf-8?B?Q01wakJNZ3VWWDIzWVBOVDMwSkpKT3o0N3cvc0FYZitnL2ZFOVlDcnA2aUFp?=
 =?utf-8?B?Y0x5ckU2MFY2MndiWnR3MlVHSVBTV3VDTnpXV0dGb2lzZVlHdmliblgvdnBV?=
 =?utf-8?B?Znh3VDJ4MHRwWUZMOTRNMnc2QzM0VmtEM3EvbmsyZDZtdVV3UWhXS3dCOEJ0?=
 =?utf-8?B?RS9IQ2RlbDV4R1dFejBTbDE2ZXFNWXRMQWdIbG5oY3dITVA5a0huVXdjYTQ2?=
 =?utf-8?B?N1c3L0hxWEFYVVg3MitEYWF4SXkzaTUzNjlLYzJFU0h4aXUza055R0xINXQz?=
 =?utf-8?B?VVE4OEloL2h4cEhGUmVvUEpZY240YXRvOTFDVlVIUEtCTFFNZlBZU1VsTExo?=
 =?utf-8?B?bkE3RXBKYVhZYVZQM2FHSUtiTkJoUUp3cm5IbnFBZWRQcWY2NGlpQ0Y1Tmpz?=
 =?utf-8?B?Z2JjOVZreHRsWThENEwwRHFoWlp2VURmRU5BbHZ4aStrU2N5RmxmQzNkN3hq?=
 =?utf-8?B?dmd6OU1yMmNUSkRsQ0R0cVZPajNVbE5wd0NIVEVGVHZZS2VMd2JJbmtJTDdV?=
 =?utf-8?B?MTZLTWdBS3JwQkdQLyt4UVJkUjhRdWpVYzk2bEVFY0c5UldUcjcyOGhBRjJv?=
 =?utf-8?B?clBtOEdzOHZJU2QvcnFuMUZ2RGFlaVAyNUJyUzNDczhCZDRBUXpPV1dmQnpE?=
 =?utf-8?B?QTBPMFZXMXJsbmRCVWQwdkJlZFVFL0FXOW1FLzdJakdrUDZYN2UxVzAwMlhU?=
 =?utf-8?B?NXBoSUZhTjlNVnpDMzA1OEtQcWJOMG43M0tUS3pRbzlkSWVoNVEwdHV4OUtk?=
 =?utf-8?B?N202RFFxL2JpYTFSS243eUZFTi9jV296MzVKT3dCL2tUR0s5SHdIVU1NUlFv?=
 =?utf-8?B?U1VlcnNZeXUwZC9mR3REVEtMaTkyOCtvdUdVd1NtdW5Td1dRKzVKalYwYkI1?=
 =?utf-8?B?aStrbkE1WklrYm5DYWJpTmVrMnYvdzlXd0pwQkFUcEN6cFhwSHh4a25qdUdF?=
 =?utf-8?B?aitnem83YVhKUWhDVkNVaTlnWUphRXhtb204WVQ1U0tCbjIrMnJlZ3BCekc0?=
 =?utf-8?B?d0hlK21YeUlmbWllYUZwSmJmREIyaytvajNZR1pJdXhBVlhtZFVWVC94WW8v?=
 =?utf-8?B?ck5RUk1ucjRzQWx0eTFkMEx1TFJMWHBqRWZqNDdWTEd4NWVTd3YrRnkrTVdU?=
 =?utf-8?B?UGhwMTN5Z0hOSXpRTTJ6ZmdndTNnVlZmV05oRFJTQzNpeTd5bWlLempST0or?=
 =?utf-8?B?MnB4YlJXVEptUDRORkZxRXpha2pnWk13b2RMaUltdTlVOVJEOVNhbzhNV1Qv?=
 =?utf-8?B?UUx2YlFRcTNIV0pFZFN5a214c2pwSFRURUlaWVlmN2NxWGN4a2V6elRRUW5E?=
 =?utf-8?B?S3p5b0xuY1RJd2YwUGNxNzJDTXIvNE1tbUw4bGFiL2haTThXbTJMK2U5ak5H?=
 =?utf-8?B?Ri9oWmRRQkpZcWZSNkZmSWNucnNMTkN3V3dXM3RldmpTVEtycjYzeE0wQUY5?=
 =?utf-8?Q?kDkAT73mHRnzZ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fccd1ec-85f1-4af0-f5b3-08df15a89a1c
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 17:16:39.5553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB0607
Subject: [Buildroot] [PATCH 2/4] board/visionfive2: remove non-upstream
 Linux config options
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

Remove vendor-specific config options from linux_defconfig as they are
not present in the upstream kernel.

Regenerate the defconfig by running:

    make visionfive2_defconfig
    make linux-menuconfig
    # Save and exit without making any changes.
    make linux-update-defconfig

Fixes: 4567c35d066e ("configs/visionfive2: bump OpenSBI to 1.6, Linux to 6.12.24 and U-Boot to 2025.04")
Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 board/visionfive2/linux_defconfig | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/board/visionfive2/linux_defconfig b/board/visionfive2/linux_defconfig
index 06942928b5..509cd0f475 100644
--- a/board/visionfive2/linux_defconfig
+++ b/board/visionfive2/linux_defconfig
@@ -22,7 +22,6 @@ CONFIG_PERF_EVENTS=y
 CONFIG_SOC_STARFIVE=y
 CONFIG_NONPORTABLE=y
 CONFIG_SMP=y
-CONFIG_RISCV_AMP=y
 CONFIG_HZ_100=y
 CONFIG_HIBERNATION=y
 CONFIG_PM_STD_PARTITION="PARTLABEL=hibernation"
@@ -40,6 +39,7 @@ CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
 CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
 CONFIG_CPUFREQ_DT=y
 # CONFIG_SECCOMP is not set
+# CONFIG_GCC_PLUGINS is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_BINFMT_MISC=y
@@ -87,7 +87,6 @@ CONFIG_BT_RFCOMM_TTY=y
 CONFIG_BT_BNEP=y
 CONFIG_BT_BNEP_MC_FILTER=y
 CONFIG_BT_BNEP_PROTO_FILTER=y
-CONFIG_BT_AICUSB=y
 CONFIG_CFG80211=y
 CONFIG_MAC80211=y
 CONFIG_RFKILL=y
@@ -104,7 +103,6 @@ CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_ADV_OPTIONS=y
 CONFIG_MTD_SPI_NOR=y
-CONFIG_OF_CONFIGFS=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_NVME=y
@@ -159,21 +157,15 @@ CONFIG_MARVELL_PHY=y
 CONFIG_MICREL_PHY=y
 CONFIG_MICROCHIP_PHY=y
 CONFIG_MOTORCOMM_PHY=y
-CONFIG_IPMS_CAN=y
 CONFIG_IWLWIFI=y
 CONFIG_IWLDVM=y
 CONFIG_IWLMVM=y
 # CONFIG_RTL_CARDS is not set
-CONFIG_USB_WIFI_ECR6600U=y
-CONFIG_AIC_WLAN_SUPPORT=y
-CONFIG_AIC8800_WLAN_SUPPORT=m
-CONFIG_AIC_LOADFW_SUPPORT=m
 CONFIG_INPUT_EVDEV=y
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_GOODIX=y
-CONFIG_TOUCHSCREEN_TINKER_FT5406=y
 CONFIG_SERIO_LIBPS2=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
@@ -221,10 +213,7 @@ CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_CADENCE_CSI2RX=y
 CONFIG_VIDEO_WAVE_VPU=m
-CONFIG_VIN_SENSOR_OV4689=y
-CONFIG_VIDEO_STF_VIN=y
 CONFIG_VIDEO_IMX219=y
-CONFIG_VIDEO_IMX708=y
 # CONFIG_CXD2880_SPI_DRV is not set
 # CONFIG_MEDIA_TUNER_E4000 is not set
 # CONFIG_MEDIA_TUNER_FC0011 is not set
@@ -371,13 +360,8 @@ CONFIG_VIDEO_IMX708=y
 # CONFIG_DVB_SP2 is not set
 CONFIG_DRM=y
 CONFIG_DRM_PANEL_JADARD_JD9365DA_H3=y
-CONFIG_DRM_PANEL_STARFIVE_JADARD=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_TOSHIBA_TC358762=y
-CONFIG_DRM_VERISILICON=y
-CONFIG_STARFIVE_INNO_HDMI=y
-CONFIG_STARFIVE_DSI=y
-CONFIG_DRM_IMG_ROGUE=y
 CONFIG_FB=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_SOUND=y
@@ -389,7 +373,6 @@ CONFIG_SND_SOC_RZ=m
 CONFIG_SND_SOC_STARFIVE=y
 CONFIG_SND_SOC_JH7110_PWMDAC=y
 CONFIG_SND_SOC_JH7110_TDM=y
-CONFIG_SND_SOC_AC108=y
 CONFIG_SND_SOC_WM8960=y
 CONFIG_SND_SIMPLE_CARD=y
 CONFIG_UHID=y
@@ -477,7 +460,6 @@ CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_STARFIVE=y
 CONFIG_RTC_DRV_GOLDFISH=y
 CONFIG_DMADEVICES=y
 CONFIG_AMBA_PL08X=y
@@ -492,22 +474,16 @@ CONFIG_CLK_STARFIVE_JH7110_STG=y
 CONFIG_CLK_STARFIVE_JH7110_ISP=y
 CONFIG_CLK_STARFIVE_JH7110_VOUT=y
 CONFIG_MAILBOX=y
-CONFIG_STARFIVE_IPI_MBOX=y
-CONFIG_STARFIVE_MBOX=m
-CONFIG_STARFIVE_MBOX_TEST=m
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
-CONFIG_RPMSG_STARFIVE=m
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
 CONFIG_IIO_ST_ACCEL_3AXIS=y
 CONFIG_PWM=y
-CONFIG_PWM_OCORES=y
 CONFIG_PHY_STARFIVE_JH7110_PCIE=y
 CONFIG_PHY_STARFIVE_JH7110_USB=y
-CONFIG_PHY_M31_DPHY_RX0=y
 CONFIG_RAS=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y

-- 
2.55.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
