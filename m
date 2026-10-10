Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4535FCA6004
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 03:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FD2A8142B;
	Sat, 10 Oct 2026 03:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6TAAvl1ru_Xs; Sat, 10 Oct 2026 03:09:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C37B481105
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791601740;
	b=PVkhT9HM0TUXECVPd78m/dOcbJLKiRPbaUNtqqVYGFe/3125IVgnTXsuGcl6fiN1sNtm
	 aP7/XzFDJ/gv9mOOCJ/4yIfvDdwtpeQrl5jsOljQZxasXMt6IQh50+UgMOyxA0AMortRP
	 BUsUEOjh11iD3CKLH5o0EcHPdEBr09oA50vV/3HbHWBQArvb8H3iTsuTEvHAOaOv1rrH6
	 Xq6wk6bGX+ZvPyIH0M/+c+i+3E5MVGEo4hJ8zDZp1FzVl65p8CuDrTE7PjYvxQxpako3e
	 u6bPCV+BHKhJDXw0i+LwBHaWr5AufiNzKGz0wGPyNxen2Xa/m+CkJyg03R/yU9lcxYA==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791601740;
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
	bh=GbmSZKm28zedDPrKi7cmED7+zztU8RYNKqyA3wdDXIg=;
	b=AYdPqeIX5QFc3n8xsvtlEcrvoukIkfSic82V0iGq/F+Jb8eUtMatcVeChR39cNEuPROu
	 mxVuP7i0VwBgSwiIRyKFQtpA0UelMxjLNGLVnq3ntZ+lry0E5eC4a8KgJuvj6t6m5Bp5c
	 U5cpwGF2gVkhY194rCaX5YvwB6qfQSBBF4X7mmwy1K2a15tDo46ZlgrJKC57CJAVSuli1
	 EJlJJE8SYfff/ocI8PgV3f57SU/3uwp8Q1YshDAfHMk3ra9GOwqh0FZt5igITHs1HY1Tl
	 QvfCjOKZjxHkeQewXw9pQnWAHSY6wZagOyfYsYl/+PLGrqbg+tIAtRyge2IRMRx6h7g==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791601740;
	bh=GbmSZKm28zedDPrKi7cmED7+zztU8RYNKqyA3wdDXIg=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HYV1tk5T4KfJ4s3ZxBkf/h4OukdGAopnBwPiDJo+CUYPsGC0g/ODMC8K9bJ32egqk
	 RNMqZEMndfzysZ6ijcU/SXGGbz4xs25kJEpkl4JhfiDmKteRwQZMYwl6TV5fW40Ijg
	 mz2+IzyKa1b+Hyx3h9m3MDJFkrp6riYi1NQtcLk5CY06qY2abQbrJs6QDve/f3mg/w
	 yGpur0m6GbZaClqy7+UyrmMlz4ioLkVAk6o+qtynzGmNZIlk54T378uLvA1MIHzEnv
	 C1Sj8Hl4oqZpa1HiJfgCTJwZ6Cm3HYS9lupJx4qhQTzr6uCnqJX+wyExtlWYUDtmVr
	 CWd1BKlSUiZXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C37B481105;
	Sat, 10 Oct 2026 03:09:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8742E1DE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 03:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7927A40061
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 03:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0h84htbTd8H for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 03:08:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6CC7D40004
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::1"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791601737;
 b=CQa8x5tLAcytctIH/I1ktjiPQELAGSl7cLTdi4c9HAbIOgvkct2A8ye9fexADUql3ow3
 qvRgRgOC9oP7AfKic/dROvDZgVGy+nXiCDBCZp7jpOVSJm/0Ruj//jdli7/RYSMUcSNTe
 OdJECHHeieeNBkhl0vrxHv04ncrtnsHY4okLoBuW156F+bbcwKeGwdZPagyMr2znqq+VP
 uYpQjqwlyY2jfBnj9Tf57BAjbJEUPM78KJh1FCwaUMh+2VSMIDuNso5KCL9e77QJM2HM5
 cnZi4ccL6yLsQmWsAcuIH5V8NZAyvLSa1sulDXcFFIdczR0J9kEj+gK9V6vT+dY9wXw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791601737;
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
 bh=9ePbKpAFWL2QYDp/VnO7bi3SPI7BCfSXA38fsnmwuDQ=;
 b=paGIvZU3KzA8i1n5M3PxuFDyxKZcoBy1Ef5is7DqONH487EfhXFoz6PfHnIiB2pmYorz
 y0TEb4il5zFNGVm9nYD1mlM3GKgn8VJnr4XLLpknLjT3reUzfOJNbMuprdK+BeMo1n8Ho
 Ar0BF0XcBRXXH+Y18a/YTe5le8mzaHbQfJhyoFNKEXzjpUvHX6Atl/HOIHgzSlaYw4/kc
 +YR2tD5rvT9HTTOPQi+m193pCzZS64Awe9zxDpGb49gpwQcQPlELNkUQVoLSxqr73wZUB
 7OEN9RPEl3phgSm2Nw/EHDgFptYpuSVmLgUGKWCjfQEUf+3DXhFp7dAEzMYaboLiX+g==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=outlook.com;
 dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=LY9Pd03Y; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:d40d::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d40d::1;
 helo=sy2pr01cu004.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=LY9Pd03Y
Received: from SY2PR01CU004.outbound.protection.outlook.com
 (mail-australiaeastazolkn190110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CC7D40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 03:08:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JS5k++OwaJqFraOhSX4dHkxwXq0GDbMWSuOxZn2STBhAIUFwsLJaf3/hvCf4x3YI+GjxU5VUGC6zg1ew3TD/XH81S5I2o1Pwyt31Rq5gibeick3/+bH5gmgUff5SZTL52PMjg44t1yphXZmGw0JeZzISqyQZtvG6Q/21PjHRVkWVItF2EuAXVKfl2nCwZWrLlV5Ul9g5W9IZxxYpjnkvo3b2LkczD/vC7O4xLZEYVsjfM9rLmeyVDdsDzF/sJAwIlQUwUBaGhyglxKgCwgY+mx1UQwc/BhdG9YGxqCQtK2MMu+PB96bLXEVfYfCwNwek+lXDgYfSPccZP2Uj4u+VBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ePbKpAFWL2QYDp/VnO7bi3SPI7BCfSXA38fsnmwuDQ=;
 b=h6wipDeO48zIU/NscV6Qq25OeTC8iUmpZLIRB/jDZnJo23Xy1w67/2VNuC1yth37mu5XMCN3fZAJrMJTRUTfMBj067ZwJxxrOyLWrx41IATUsHdVJ422dvgzPUaw5V4d3wWh5w0znjfU7bQDm614rBJHjHGP6lA4fwq4BsX6KAyo/e59fpeFAwQIigmV351z7JkcNO4Q0z42qT9B+3jHgqXp+NjLE3BbiKvNHH8N4zvc+Rizj7jYuGWM0sILL9Z3JGimwxT45NA72J8qQ3jgNYfsJkpLVlDvD3G8qUJLTwwYjQOYAWZamsBuoomHdlgvVthgVKz1Irlo6Xc+g2/GZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ePbKpAFWL2QYDp/VnO7bi3SPI7BCfSXA38fsnmwuDQ=;
 b=LY9Pd03Ypa9/LLoIYYDLYYp+WR6X70fU4QmJteiJTv5CJpsxJ/uFwEgmGQFrErjt7bjhmTEJZuWmIQJ2nTRLTP5PcEJkjyXmiFHqZpgb9l+7dqXYEE62kA991zUCCkC9+dOcY3NLhvshn6BDy1W06JyQ+XgWP9FZn05IxSA28MROfwr6y7hUKWIxnOROl0u9/6X4iK6KPh/e6yKQTERbLgA+tDG38Tp6keCTzaKuue0HNhpz0iYlrMGEeAhcmqK932YHnzxqpZZe/l7p7q74plbBdGmLAx0vWYPF1HsGMLaZXBM2piVQ2CPkkLNI1qI5d9QwegWLXvxKF+telD6RrQ==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY8P300MB0405.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:295::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.18; Sat, 10 Oct 2026 03:08:48 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 03:08:48 +0000
Message-ID: <SY8P300MB0041BD279E1807A85D684749B5912@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
Date: Sat, 10 Oct 2026 11:08:39 +0800
User-Agent: Thunderbird/154.0
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Francois Dugast <francois.dugast.foss@gmail.com>
References: <SY8P300MB00411684A8A44ED2157BB57AB5942@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
 <ea0daeeffd12e78135a8bcc5363fd5e9@free.fr>
Content-Language: en-US
From: Fengwei Tan <tfx2001@outlook.com>
In-Reply-To: <ea0daeeffd12e78135a8bcc5363fd5e9@free.fr>
X-ClientProxiedBy: PS2PR01CA0028.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::16) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <51324ebe-3eea-4dbd-82fa-724ad8b58343@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY8P300MB0405:EE_
X-MS-Office365-Filtering-Correlation-Id: 33476604-0967-4ba2-7210-08df267bcd68
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799015|19110799012|25010399006|23021999003|15080799012|24021099003|5072599009|6090799003|51005399006|40105399003|1602099012|10035399007|2607281247196008|3412199025|440099028|4302099013|26104999009;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjlDd0RXalhtZXAxaEdqK0FXVWhtQ0R3RXkrZUl0QnJKcmt1R3F2amtNVDBs?=
 =?utf-8?B?Um5wL00wZzl3MXVUTlBDdi9oMnkrRWJRMFdBL3hFbDV6K1hLR255ZWpQY2kr?=
 =?utf-8?B?MEtTbHY5L3JuNjZiSm5YZ3ZEejhnemxva2N6VmgrY3ZrSmZSQVRvZExwR1g5?=
 =?utf-8?B?R1pXemFPVURINWQ3WnBDSTZsVTJhUEdjYWtXYlNnUnRia2FVU1J3a1hMeGp4?=
 =?utf-8?B?VDd0QTN6Q2NuVGFNcEpDajN1NjVSMUc2NUtndytxK2lIc0F6eWNTMkhGU1pF?=
 =?utf-8?B?UkM2dTZCZDY3UlVHN2I4aG5YWW5IN3doZ3ZXNDhTaFlmMU81RjQreEVTRU1M?=
 =?utf-8?B?MFFBN2JoWjlSUTZWRXFBVUUvRFlLTXJhVElGRXlkQVRTZ0RSZ3dJeE5tOEdq?=
 =?utf-8?B?cjJ4Zjg0aCtvTDJnVXNFVXpMRC9HS0FaSDNjdnk1NC9Wc0dzeUVvY0tFdDBi?=
 =?utf-8?B?ZU1EVDYyL1h6YmNCWjQ2eXVFOGxoZmJaTzlGN3VvMitpQk5kQms5a1QxaVJj?=
 =?utf-8?B?YWtkNExpV2hjVHg5YmhxRTN3am9MMzEzdFdWWTlFeWtxTWpYYy8yUmRsREhJ?=
 =?utf-8?B?RzlBK1YrNENmRXRwcTdZRnNBYlVySnN1a1B5NU5wWlVWVE15S01rWU96Yksy?=
 =?utf-8?B?cDZqQjNQRW82bjN3TGVuMUhjb29hK1F0TzNTRVp0TEpRRmswMTNQcWptQ2xZ?=
 =?utf-8?B?d3ZlSStiK05EcTJ6MnNQU0hKL3hMN2FKRTRxL2F5Y0Z5NXBtMktuNk5LSnpH?=
 =?utf-8?B?SEF4d1UrTzZXOU1XdkhQWGNnSytwWWxnY2FyQVRzQVRzb2RxWEhtV3dWUjVx?=
 =?utf-8?B?cXhVNUoxYXAxUER0amN1UC9iYnhhdmxPTUJYbCtOeXJ1ZjIxbXhKR1k4N0lW?=
 =?utf-8?B?ckdqOEpLMjA1K2tZWHk3REtzc2F1NHVsZ3ZaSHgzM1hqbmtuK0VwT1ZUb3Jo?=
 =?utf-8?B?SkZycXpKUUIyU2hHSmFvNnlTVEk3MW1DRmV1eTlzTmloQ25UNExaNzBYQ2dQ?=
 =?utf-8?B?cVFNUEh3ZVFXOG9Fd1VPbysxSnBUbjk2LzRXOW5ja1hOcjY3WkNUN2Y3WnEx?=
 =?utf-8?B?SXduSXV4di9jMmdUclAzSFJqRFBiNDJ1QTdDNDRHWDNmMmwvVFVWRFUvdUE2?=
 =?utf-8?B?aWYrZ2Q4am9JNUNOcW5DTUhqSTMzODhTS3NmcG02ME1FMUNVLzh5Tkl1WTZE?=
 =?utf-8?B?Q01FT0xOUkRFNU95VitsMVBXOU5xSkt3TkxnWFdubUU0eko4YlpXQnJnMVgz?=
 =?utf-8?B?MGtJYnZ4RGpYVjZOd1RVMENaU0l2T0R1b0lmUU5MZitvNFcyTE8xeE9xNXVG?=
 =?utf-8?B?em54clZ2QmVxQlo2VDZyMGNRdURBaVNtQ0tQazJSMjduNXR1Z21aOHNFR3RD?=
 =?utf-8?B?L1doWmtVZmNDVTFqUXF3RDN0QzA1L1d3eVBMZXZFTUpxZTB6Qm1VaGExUk13?=
 =?utf-8?Q?Bh1xcLAz?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGxYempvQXF2TysrbmluRjJ3Z3ZZbE4yL0dJR3QyZVRrT1d4NmwxbGpnSzVa?=
 =?utf-8?B?NGZxUHdmOWgwSGtqdkl3eEtQZks3NlpES2RZeHlNVzN0YU9ONmg2KzBYLzFB?=
 =?utf-8?B?M21GTlg1TVlqWEI3TzhqdFo5QUt6N21TRHZQS3A4TEgra0JXeUkvUVFObXJC?=
 =?utf-8?B?ZWExMFFFemszOWQ3bHVjMTNNWlVmZ0dXV1lhcXJnNWVzZUZ4M1FNOHVIUC9m?=
 =?utf-8?B?V21YTWJpUUE4MlcvZDdZdnpxUWpBcktEYUtIRjVmSWU5WXJ6L3hTNEcvakVI?=
 =?utf-8?B?T3pxbHhXTzFDcHlYc2ljRVpvaUhxT1Q0SURtZlMrem9mUktCYXJrTEROM3hn?=
 =?utf-8?B?Yjc3bW55dzN1S1dnQzBQbjBFN2xpSm1kVWNrODEwOGE3K1lUZHZxMkRCSmpB?=
 =?utf-8?B?T1FEdEZuZkx0Q1FKYkVsckpHVTMrdUZHVGErOFIxZGt6bVdFRUdwYTlwYlJH?=
 =?utf-8?B?YnlnRit6ODFLZnVLVExkK3VDcjRKSWVyckRSTEpOZkh3bXpucGZselZndDRr?=
 =?utf-8?B?WW5rZzhyMjNWZGRibndOZklaUjFIQWY5WDhFUzB4Y21EaTRjOFcyVUE5a0dt?=
 =?utf-8?B?SDlUa1MvRng5R2F4R0lrS0Y1ZHZOVHZhVHNmdVk4YlJPVUJBTWYwc2F0ZlhV?=
 =?utf-8?B?YUtuMFA4MGdqYWoySVlFa3R0QTNqSE5kQnR3VFp2Mk0vSmU3bFovdHVaYU9s?=
 =?utf-8?B?QW55R042bHJsamcrZFBITENGMmROeG1FTFRkT2szcmdkVjlrcTNUeWZpUVRV?=
 =?utf-8?B?RDJ0QXpmTGM0akhncm5JUUVKVy82WThKUkNYRnlhQWpEQzFhNWFUbmFNWlZ1?=
 =?utf-8?B?a0cya1F0VzlwU0xsVnFvc3F0REJlZ0VlR1FnWnNlNGtPQmJHMkhRMVFGcUZw?=
 =?utf-8?B?L0tvYi8zeUZZUktyajE3aXhuYXZuSXJXNDNEeS9SZzNiOVRKYnByemFFdW56?=
 =?utf-8?B?NEtFOU9xTVFETUEvTHdrb3BSTW1rTE9JOW43QVMyRDBnWk1IcE14ajNOS2dL?=
 =?utf-8?B?WkVpOXgwSWRqVk95eitSRTNBVTFHdmZzWkxtYmFmelVqVmg5TGk3dHJUZEd4?=
 =?utf-8?B?WGNEdEozQ21sZjZGVTJxdlZ1SEJ3dlUvTDlLY3lRRmQrWElGZjFrRVgzQm1D?=
 =?utf-8?B?cmlQaHNsQUdNUmNCUnR3eWdjTjBOYThFMWYweDN2WVVGV1o3Z0x0S0doRTQ1?=
 =?utf-8?B?VmFYQjhLU1dGakpyWWJSNmZOYVpNSGxQODdwc3MwVkVmOXFoVm5ydEdtZHlr?=
 =?utf-8?B?Y2lnNzh2WnV5WnFJM1NpeUJkanBmakxrcUZQNWZ3aHl6Rm9KQ2twYnROS3Vr?=
 =?utf-8?B?S2JsTmh6RGNPSUZNUE1Xd3ppdEZndTJJNlZ6YXROWERsSUZXTUVkZzhzTkhI?=
 =?utf-8?B?SC9Zajh0T3FiM2ZhR1ErWTdIWEl3ZXlkQUoxWFRuMk9ocDJjbUVsMGg5Tytr?=
 =?utf-8?B?L1ZzY1R0Y1o3TStsY2U1V1NBQWI5L2lLU3FZaVNWcWYxZGRmL2FTaEMrSU1z?=
 =?utf-8?B?bjByVWgzN1RJZjdTaWdVWGF1bWdDVjMxZUcreTFKUEtZdHRoRDQzTytVcWI1?=
 =?utf-8?B?L2dXY0xHQ2dselZkYWIzRjlDL3dCSHcxSXBreG1DcUJMeDZBN2tlTHQ4UkZQ?=
 =?utf-8?B?MFBpRGFXbDFlU3ppZ3IyaHdMdlZzWWl6SlRQcUJRNFNJYklKZUZoRUlma21W?=
 =?utf-8?B?dGpOejlkQS9vcjlrdkFPcURnamVVbjZXM1d3N0ZSS3dBM1BVSExqTm1QbTJW?=
 =?utf-8?B?ZFZ3SENUS2E1cVg4c0wxZ2lGWEV2MWFFSklZWml5bC8xeVh0RzZsTmRLcnFC?=
 =?utf-8?B?dTZLVU9Ycm1pYmlBSC9hUFdSU3VLZ1czSllsSnB2aldFN1hzYk5mRWF1VVVT?=
 =?utf-8?Q?Hf995HXU10kPA?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33476604-0967-4ba2-7210-08df267bcd68
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 03:08:48.3207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY8P300MB0405
Subject: Re: [Buildroot] [PATCH] configs/visionfive2_defconfig: bump Linux
 to 6.18.52
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

SGkgSnVsaWVuLAoK5ZyoIDIwMjYvMTAvMTAgMDQ6MjEsIEp1bGllbiBPbGl2YWluIOWGmemBkzoK
PiBJcyB0aGVyZSBhbnkgcmVhc29uIHRvIGJ1bXAgdG8gNi4xOC41MiB3aGlsZSB0aGVyZSBpcwo+
IHRoZSB2ZXJzaW9uIDYuMTguNTUgYWxyZWFkeSBhdmFpbGFibGUgKHdoaWNoIHByb2JhYmx5Cj4g
Y29udGFpbnMgbWFueSBvdGhlciBmaXhlcyk/Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQvP2g9djYuMTguNTUK
PiAKPiBJZiB0aGVyZSBpcyBubyBzcGVjaWZpYyByZWFzb24sIGNvdWxkIHlvdSBzZW5kIGFuIHVw
ZGF0ZWQKPiBwYXRjaCB3aGljaCBidW1wcyB0byB0aGUgbGF0ZXN0IDYuMTgueSBzZXJpZXMsIHBs
ZWFzZT8KClN1cmUuIEkgd2lsbCBzZW5kIGEgdjIgYWZ0ZXIgdGVzdGluZy4KClRoYW5rcywKRmVu
Z3dlaSBUYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
