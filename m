Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21708C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 17:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7ED840C8C;
	Fri, 18 Sep 2026 17:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GcHYQS6NRQLA; Fri, 18 Sep 2026 17:16:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 17A3A40C87
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789751812;
	b=KIx/ghxFM3khGucdEmIJR3BYHSoYFt7aKu5utdLencIhgOZsekQG2aA82xuC0K050SCo
	 gpy2QkTqCPuk2NuO5d/ZksSpbixn4Czv1K+exwWXkCt2ObE4mhFYO4nWGHklIJKVZ8OUb
	 HK66IoHBJp19tPpLMftGopMeoJZtrYesvQ7t/dhjDC3+o2TG8mO8NQHgP1QEVQYuxqXjX
	 piVMUbpMjJSH6asKY1blSF+chFqeAXIFO/HzRJC21IU0JrOOxHBpqHO+RrANLdrR10x8r
	 ZLUjeF5yMgmcZNtnqpQKbXC/MWvu9ZZUtRoPoKD9jt8FoSNG9KYGaSekJ5b4hN3OU0A==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789751812;
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
	bh=9k5f6VLRgO+v5rpLcsXgNB990DCGXOuRfF7CfPgWI8U=;
	b=RB+6glpTTyQww17N13t/wl2IYpJXObS7ivEkJwTm5TpEGdDlKVhAO7JUKvslpWfFaceS
	 0ovBV5WspZyyIzRV8IQJPGqo40/DCAyTeI9vpQrhlYCBLJ3N/7FMyd3RS20if9MbVRC0y
	 xZ3DXuUxxuUMmscR3e3m8O5WXl+Xk8KfdCNb5pmxmAlK+g84a6+k7ot3Qd6z0+Jm0xIhI
	 nHfy/PyiYerQCeenkQbzOB8etZ2WhtwmIcCYgyTZNueyrdhnW3N9nDUIZPgfqt5ckq23L
	 foRe16AHY7AOIZZ7Ys7ii/jrzJ3qgKQsRb4C0pbfcZMLYQNkrsTbGmyjYIWowkDtTtA==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; dmarc=pass header.from=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=BEJI3ivv;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789751812;
	bh=9k5f6VLRgO+v5rpLcsXgNB990DCGXOuRfF7CfPgWI8U=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ujo/vYclWOukry4OMlmumBunn9RFqft6LOuFQmNjvqi5KF0kDrapvoAjo2i6jS0xV
	 4sxBvGtesM9ky70FV5GtFs9s/lEKLwPEXjNoe+jlkrLsEDdEAeUEvSYO2G0AbSb+zU
	 2XWi92+Al1ojeoBKk+CCrGRPIblkuXZnnW+IlgT19jdPGW4+WYQMRL+nGvlU2x1BbN
	 tqZwchJFmyy+4PdhKLIpjFjN/C0M84AD0kwv4gUqHKrPkX56XU4W4vCEa4ODiOOXlX
	 V6q0aGxVUzCL+UrsVFRhlGR+TNHxbwuYTj5h9DYU3K3IjIflQSb4AsVKVu/X4UKbBG
	 yuxsmJp899mxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17A3A40C87;
	Fri, 18 Sep 2026 17:16:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 51ED4237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43B8340C89
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XkAtDqplRuzF for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 17:16:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6D4A240C87
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789751809;
 b=A+E443pTl3cVqLlV1Co+BvD0FCBmeFvfwDPpXqsRljbqvIuY2MoIF7YDo55KuImSZ8H1
 +JXy/0Y7zd1TJgX8ruDxCyf96JgJCzDA8EIHRwLeizusJTs5blWGLqC8tZWrMkCyDVQbX
 WUuuEOd8jehamk3MgsZiAs4n9LIK2fhEv6TMH3hMQO/BagddTkYL6yZQ7qTKWY9p3TTzK
 9+3poUIeyb9PhVEooVCGvgrqXG6tOrrXPl7Z9/qoT7DSXF2dsZYlrrGZZ7DTbkhfeu6GE
 yj1gWMdmneSZN9Na6LY7Jobo6ip4IMZ3u7d5PVTzbiC0jkZ0WlIgEVYmHDFLPmCeSlg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789751809;
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
 bh=NEkrSqGKZt8sgyyR7nQVj8ib7oqViiAhErQOEXJpjKU=;
 b=Vcg+hQ4ZlZRW4UXEo2U8v7iE26aDfKRFy+08hfBryN7mzfHbxvlsgIY1R3hiFei7Ec+F
 u8z3X1LBHtrP0Y9ExMcbNYnlkCKits7l1kDU6PcyI6d709h5Pq34nT/qFs3/0g5gkZRwT
 TGEI7V40LqOSJt8qdkSDnAQZuaFyWcYv39ZA1SzHxz5CqCZ+q/N/LfKgrNWyeB2G0ITEX
 asJWf9hJkJDZn2IUwVuGrWBYAref+x21kv44zxiZvAPZ48dpsCsfko+9IIBXUWopl+gik
 mKX/EcoKswwMSCMMu5lA9cSMgRTTQat2VY5RBX5MypepV/IzUKbi6t21GCTBZ/IcvGQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org;
 dmarc=pass header.from=outlook.com; 
 dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=BEJI3ivv; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:d40d::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40d::;
 helo=sy8pr01cu002.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=BEJI3ivv
Received: from SY8PR01CU002.outbound.protection.outlook.com
 (mail-australiaeastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D4A240C87
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:16:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMkpQHsQkIKJyBmstYYO8bGne46bgBv4wRzrg6CEXl2wi8kg1K9dYXkDCoH0eg3MTiAZ7+DcgtFQfv4SFlZwyvBtqNTlffRde2Gmzs7xmpUwzOinK2Y77IIt2ENhBfu8a4zNv1V3f87vJBFch8s1xmhyn6IdOK5vyZRu2HgMjY/htyjmIycZauSjrt3eCp8+pjAS5QlSmMfjfmuWSejAyvGdqlUgv0m6+qBFqO0Ap2Tf/qCBfs1p3Du6HHMHhvQ36sJlUKj6CzFoe209O6nj5P5Lz7qK5xdHn/ColLQK5uKVsO85zizXFOseLXL8JOfyx15TKxzFmx/gi9FuHqRszw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEkrSqGKZt8sgyyR7nQVj8ib7oqViiAhErQOEXJpjKU=;
 b=l+weRqIWZk57RZTxIgGEzydHN+BCKWOZNoDYq+ohtVxH5ewcPD2EOcdq5S4E91WKYGJrPzx3IEUWcoplNFI63Wpuw+MDi4VDIYQlDGehqtjMUZTDz1gHzFaaJoNVs2x9rEXaQihHfI9xjXplO/i10swHq/Be63rT/s+dAhMnY0wrGa8s2jRuPCd/6rKrifm+0EGwggWhJ7OIqeWqXPBYXgatJypqKrZEh+FTZJEcy5iP/NsRMgNxciqhi76yZW1xBRQV4dJCUs0p+uX8PMHVuRMIWPtJdZ05G9uuTWGUs7KCfK4d+60KRp1O7Vg9LmnxeFxw0g1A2YVVIJRB+HdEuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEkrSqGKZt8sgyyR7nQVj8ib7oqViiAhErQOEXJpjKU=;
 b=BEJI3ivvw8TSm9Co14YNLTkVXfUFZW9jigeydl0/bDfk+DU96jGac8BF3PGYwtmuGYGiMrW+0dUFDNcLBoswolgVh5ZUtMr9oXDtMPElNzymJvanmnpTCndzfaERGId3vWjrfi2aV2i0YeYtjJ6Zz0wIZ3YGTehww/3zf9FTB7P+bsCXlLnjGbL2JiABvrx5MkQOO/odc+EvFSvN7+zEo65KpS5g+ZY4loUTJZkG2FGG6h2IY+nwmA1QojXxHy/jdQ3kn9J7XN0EV5urm0bBbC/jKPXIdRPKHmmNqgw8yw+7OsCk16/3/8gBoIOrXO23Cy1LonRfomodb+tG6AIbMg==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY7P300MB0607.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:28b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.14; Fri, 18 Sep 2026 17:16:38 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 17:16:38 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 19 Sep 2026 01:15:18 +0800
Message-ID: <SY8P300MB0041D3D7472ACD7C23B13F39B5872@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <SY8P300MB00419E6035B2DD54F72006D3B5872@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB00419E6035B2DD54F72006D3B5872@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20260919-bump-visonfive2-v1-1-bcb309feb582@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY7P300MB0607:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b269bbc-bbb7-486b-3b4f-08df15a89934
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|19110799012|8060799015|24021099003|51005399006|25010399006|41001999006|5072599009|15080799012|23021999003|6090799003|40105399003|2607281247196008|3412199025|440099028|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGNyVTRtODA1QUFXeXR6RDlOZmJ1UlcyaTEzYWQ1ZTkvTnJUVitsZFRtSlhx?=
 =?utf-8?B?YVV4cm52dm9TQnpGZWlNbkg0Mmh6Y0s0bGZYc2ZDNVA1ajlmOUhyU05JdE5L?=
 =?utf-8?B?bkpNd2toUGI4NmllV0h4YU8xUi9FUEhUNldDRk91YlJ2SWZtaEluT09paGxD?=
 =?utf-8?B?RXBQMkhCRHA0UzBYRTg2dzBEb0lMaWNzRXBYbEU2UTlzYVhUU2tleXNPeVNQ?=
 =?utf-8?B?NkZTTkl1UzE5eklhNGs4bDU3czBWQldROVRpSHJTZXAzNWxMVGZ5YWVjK0ds?=
 =?utf-8?B?UE5kblp6R0tUa3MxcDFlTGFHay81MGtoL081Q0t1Z1c3ZTRIc2dZUVVxZmZx?=
 =?utf-8?B?TkJ6TEs2L0NjblpQWkh5R205ZkRmQkxZZFZHOWhiVzhTVkk4NXBtb1NtaXlq?=
 =?utf-8?B?eU1JYU1WRVBHZ1BoT09wakxYd054dUhVclFEWTFFNjBwUFlXSDRuVHUvV29H?=
 =?utf-8?B?d2Vsb2w4clZHOVA1VnFVcGthYVA0SGs0TEswVGFJQTROWUttb25FU2x5U1hT?=
 =?utf-8?B?Z1ZaWUtJdlRBQlhKV0pCYVVTQmVhYTZKYkVhOG44UUFoTzdYODVXSlhObnNZ?=
 =?utf-8?B?STJpb1lWOFd2M0kxWEhCcU1lUW9HcG1vL2J2dU1vMFprbm42Sy80OWlPbkJV?=
 =?utf-8?B?U3RIRGZvMWw5cURVenM0MkFMdXF2MUhWcGhTVGp1SmJ4bEwwQncxMERkYzFu?=
 =?utf-8?B?UEsvZ3UxMWdWWUVpRmpUZUJ0V2dONDV2UWpocjIrWkRrR0NmVVFZSnFVR1JN?=
 =?utf-8?B?RkxUVnQ0aEVidkpTYmswcmNzaXhVNW1NMUpyQUNYa3o1Q2JoaWRrcytyOHAr?=
 =?utf-8?B?QTNuK3pZWmlWZHEvT3o1OW9pUEVhR05OQXUrKzVPYlI2dTF2SXd5RHE2bWRD?=
 =?utf-8?B?REZOT2dhaG1VU0RmbTE4NnNaeDZYNlpwdCtFWjZUMFNEK04xZ2c1ZW5XeGx0?=
 =?utf-8?B?bVhYYkczYWRpdU50TUtFNUEvK3Q2cUd1Q3hWSXVFWGJ0cHFPOTNieGZzMHlT?=
 =?utf-8?B?Wko3N1phdkpXMCtKbjlWdGhweCtOdXMrd0laeVF1MnBnVTZyVHBMWXhDRXhN?=
 =?utf-8?B?aUNHQTFuRXl2LytKOEJPWnFFK1BkTFhseHgraDRTbVNjclBoWlhxYW5uVTEw?=
 =?utf-8?B?UzBEYWdLbXdzaURiLytnaVIrSmwxdWhNbDB6cXcxdnpDMFJYZEhSMHRJaWNT?=
 =?utf-8?B?T28wWkR1QTNmbXBtMm11elAxUnE5d3pWOGhsdXlYTmlvLzFtVzJHUkdhL0ZF?=
 =?utf-8?B?OGVqUWc2WXM2RmhRcFQxWTJkQnlwSm5IQmFlZWZ3RlIxeDJ0anRROW9VSFpn?=
 =?utf-8?B?dEF6VmhUUkpkQzVUZUpTeGVjUXU3L0NJUWV2NHdkYlVpbmpxZWdYY28yczdt?=
 =?utf-8?B?QWtvZmtHZjJ3aEE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEFKOTZKcmxZaThWZVE0dlkycHA3R3N3RjBQRm16cVpDNmxkQlFmd3pZRHA3?=
 =?utf-8?B?emJIbjRkNzhVVlM5cFNVYmxiTHBHREd5TWNQaEpmVWlWTmJzK3hIOXRvZ3Fn?=
 =?utf-8?B?TDB1WEthS0JXTkV3dEw0RFI4Q2ZMOTVxZnM4akRGSnhTUW9LRlplZ1pDNEdH?=
 =?utf-8?B?S2oxRXdwcnhVbFRmSEtHaWZaTXJVR25zNUpKYVV2SzhpVFp3cHBscEFob1dL?=
 =?utf-8?B?TENsNXdCcGRSWm5Gb2Q4TVdiSy9pbzArK3pNTlRjYTlsdWNwelJRdDFFVWww?=
 =?utf-8?B?c3VoNHdWSUZiVkd0enlFc3ZPNUowaER3ZTkzb3luR3g2K3pZMG5ycmplVzZU?=
 =?utf-8?B?NXR5QTdoQzlaRlNnV2pJQ2JPejBTeGV3UkQ2MkovNVZoQmcxK0l0dXkzZzdp?=
 =?utf-8?B?UDl4QVRqUFZFSFF0dkFzMnJsbkNRUU5VQjdKTGZZYnArcW1MTUZkQTNQY2RQ?=
 =?utf-8?B?YWNhNGI5QUpzaFI1NE9oQTA2ZGpkYjBBZHNkQ0JzYkpVWjJDY0F4dDhPcHRa?=
 =?utf-8?B?ZXV3Tm41OVQxZ2t1WXdXVzZ6Nkw2T0lwZTArc25XQy9BeDBmK1pYV1l5WG9L?=
 =?utf-8?B?MGhnWnRnY1FSR2Z3SVZzdGNVdnM4bjlxTW9hOUFiZEhyekNyNnVOSk1pWm43?=
 =?utf-8?B?TitHQUVhM1dhYU1XZ3hRekZuRkFobklGdWl2WHFnYmRpQ0xYOVZnYnNNSzVi?=
 =?utf-8?B?R2FpUE9zYXNwT0xxN2p6QTIyd05ybVdYUG96U3E5bUUxS0c4ekRCM3Zjd1pm?=
 =?utf-8?B?VjJCc1k5S0hVTklnQkJSR0kzU1R5WTRXb0VOeW5hRDFxU2plTkxod21ubEQ0?=
 =?utf-8?B?eGFNbkhWUFA2NWlPQ3pIcVlieldmamJ0TXhETEN3UWZBbnFDTmJQeXNiQVUv?=
 =?utf-8?B?dGRoNG9qY0s2ZHZTbnR0cDMzMXdteEJoaWhaS1lLZXZPZkU3elVpZmxUTW03?=
 =?utf-8?B?T0M3QUpMRzBaMzNYbW5CZ214ODN5KzY4RjJ3TEFFcHRnV3RuczFiY0xtK256?=
 =?utf-8?B?QWxSM1UrRUI4TGNnUEN5RE5zVFlrc3JoWm1lTElMN0xhaWlpdU15MWd1UmVK?=
 =?utf-8?B?a0swV3FhcS9LRFZWTEtrTUNLazFnZEd4Q080SHRxK3dKSHFrUlRKdkFYdk1K?=
 =?utf-8?B?ZVZUVUgzVERlNkYwcFdIWWU1TE0rVmhDalIraXZYMUZJOGlrTzZCU1FhTldo?=
 =?utf-8?B?ei95aSthTVFCR2RUSWc2M3hFRUEwNkcxL011MHhzNjhaWXJHK1F0WVFKT0ZW?=
 =?utf-8?B?bkhOS0pNTGZIeVpHSHNEZVZ0RTFMUVpacmNRa2cxMFY2M2hXTWY5VkROY2cr?=
 =?utf-8?B?K0hVdVBkbisyRUxRVGpJTVNEc0w2QzdFTHRhc3BEUGN0ZllDdUJ4TlYvQzM2?=
 =?utf-8?B?VjM0M0xZUkhPekhXWXRkMzRiZ2tpeGt6Wkc1ZWFUNXhrK2k0SGYvd09TSUFC?=
 =?utf-8?B?NnBnRm40c3FBRUJDRXJ1ZkVKV0hLSzJFb1lPK0lIbEh3SE43amlyekU0SitU?=
 =?utf-8?B?MkZCaHFMUzdjVjRyaCs0Rlo4V091bUJ5Y0wyM2ZyYUtsS1pLVE5QMTdvS3pt?=
 =?utf-8?B?S21iU1Q1RUx0b05JSnkxZVdhdkVZa2g1WmgzQVpFMHpCL2JNNFY3NUNyZTRw?=
 =?utf-8?B?VDRQTnNZUlJFOFhBY0JQSDRUOEw0a0FIcVhSTjlDS0U5TnV4UzJNM0ZXRms1?=
 =?utf-8?B?UUplMlRuU3BNc1ZhZG1LWTlLaFBwN05aWFloNTRCVkU5UCtiRGtXQ2RuMW52?=
 =?utf-8?B?NXVlWWdLWU5JSlhYYmc1NDVJSGtCakxPbis2ZC9tZGQ3elcyU1hiUkRWUk55?=
 =?utf-8?B?UU1DaXR5MmVPSCt0U0lLSHF4VXJJU1Z0UnU1ajhpTUJXMmNiM2M5NE5tOGxO?=
 =?utf-8?Q?TqDLyR+2yAcWP?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b269bbc-bbb7-486b-3b4f-08df15a89934
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 17:16:38.1852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB0607
Subject: [Buildroot] [PATCH 1/4] board/visionfive2: add rootwait to kernel
 command line
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

MMC cards are detected asynchronously, so the root device may not be
available when the kernel tries to mount the root filesystem.

Add rootwait to wait for the root device and avoid a kernel panic.

Fixes: 4567c35d066e ("configs/visionfive2: bump OpenSBI to 1.6, Linux to 6.12.24 and U-Boot to 2025.04")
Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 board/visionfive2/overlay/boot/extlinux/extlinux.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/visionfive2/overlay/boot/extlinux/extlinux.conf b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
index fd772f3675..48d267f725 100644
--- a/board/visionfive2/overlay/boot/extlinux/extlinux.conf
+++ b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label linux
   kernel /boot/Image
   devicetree /boot/jh7110-starfive-visionfive-2-v1.3b.dtb
-  append console=ttyS0,115200 root=/dev/mmcblk1p3
+  append console=ttyS0,115200 root=/dev/mmcblk1p3 rootwait

-- 
2.55.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
