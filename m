Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E757C982DE
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 17:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B629560D9C;
	Fri, 18 Sep 2026 17:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MzZBmmpsB1gH; Fri, 18 Sep 2026 17:16:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EB15F60D62
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789751817;
	b=CbXKy+NWy6ol3B9QOkB4IKnPOS6CsaouhbMaBzmCKdkywuH1SNGG5T6BTDHptE3YFcC/
	 aIC1rcEbI1mj37hHRlgzh+OOuqH60uzrjgBwQ5D+hgD1h+Tdgz5tWie4vcIy5BaiAHglX
	 1DjHLanStXhRp5YI8QP4QnTyi8Itp2gxkiyDEo6YT03ACNoaQfGKaEqtEW+Ga0HNQTDlE
	 ix+L74BrOIAXEORhLYLJ4UvGpn31a3b1cnLEy+Z3r9/x5IfiPaYC7CgRcKDbmcbUKmE8V
	 EABKxsGKosLuqoj4buKg2F5brgAjg9HzkbxHZANSwnilzK8CiDUSM2LbGvfTBLQzecg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789751817;
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
	bh=BAE7QRNv5b3LFW5HlerBv9bU9+ac0UQztd1kTKf7Beg=;
	b=Xw94Yt3EnpPSVExpbRNlex6WkgaUqJZcEZ9b/s+OjApOS5sniru7oT3a2bInBOorPhRt
	 JuCjocIQ4ALqZmgveRTh2rLEiiV3lzXc5qUXfNU9J/ydX+uhgaCbfJsufyPnO9wQAkbRH
	 j+dDEvG0fxMce7tykAwVINFCJzEO2J2akJQXg0FUnDK9hGNFpRk5/3PFqhYOJZ+Ma7fMN
	 /rI94wD5IIWu25cCBRyTTOW0MemRvErFGhun0KE6EkrzXdwQXqAVR3ZlK+Z4Dubk7f/am
	 CrhuzGxKhDDJ6rlrLkkLaEajYr8GKnquT3sN+Z+Jzam3hafs0yZnhrMZMARKWu5Enew==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789751817;
	bh=BAE7QRNv5b3LFW5HlerBv9bU9+ac0UQztd1kTKf7Beg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oQRIeRPd1bn1nK87+PVCX2MgxzjAzdL7FX7rrKsWlXFx9ChCBrXJcbIbQBxN+nae9
	 TaWCk2UkwCg+4hbOonlFqparn2X4POxXWC0q+1gGTYYAQuEue4flXsrUE0S/WLp+BM
	 XoCmt9QdiKzV3xDro7aO4kJXF0QBCpYcbj1Ps14pEJiALEl9c3UmR8OqDaQ6pLjR8S
	 h5YWTyTqkG3Qqpma3U8w6E87/WKker2zsGzA6i91vtvw1KsknqC6AWf/KuNbA202U1
	 +G4DrBtOp/hFol3LiONT6MwkO5hzJpiBN3WcI6OxfMl7s7UnJUDRT/Jb/oMQZqaMrE
	 s0+sEuna7lp0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB15F60D62;
	Fri, 18 Sep 2026 17:16:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4106642D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EF5640C8A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmp0ZRkXFoer for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 17:16:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6DA9A40C01
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789751811;
 b=bdBsTtcQioAuE3ekG1blMAt1nFYr++uymWc5IgEvJ8vaLZIQtsNYfWaE9YQpL22votnO
 nUUuKXJl5FnvUkAf3qSyTutKOu3LlEW8kpBn/9WnaVT9Wq1LhVYYnGls+Rsgf322lmWIH
 KxPdE/hDrhzRYAvY9T4lCTSfRXbFxDAc/t6b20CtmnjKVCEQaViVSYVryw51vWalfVQhy
 F8N2XFML5tUeKF9GeADAx/NgKtKXYz1PzirlfthOMKaxIv5cO69CVp7MNx7tRUdb0dvUS
 ADGC1C2rda+oQNN7SI/XEaY87Uqh+CmOMF7tDs611EAbzRiH7kD2ZkOkybIDjybQX1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789751811;
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
 bh=TCkJiQkW8AdgHHleJl88t74UDY4DkadDQYk54oyVcDU=;
 b=COwhXfcmLPKOshiy/LOo+wbyxYIvn5Gty/OuxM7pt7pJueLJHWGYayn0Go3SOjQh66A1
 E7XqSg7K2XP6ENsG3dqUyfifwKZjc7vNFbSw7V2n6XRuAd8ErARpM3VofSA1DtPCMXaHt
 rCfUmhgWLnhgznV6C5XPgicTz56UfVV9apppFYKtjv7JG64LwgvawkzdV7YF0zc+1F2BU
 xz6AUBu4ugWrBBLFfl92j+93RkK3RumIaZ1S4UI8E0igjPst3Zz8HVeBnpm9Kew/7SMbo
 MvQD0zAnGuhvFsfigzf4cRMQbrzrA3reuvFaApJ9fGJq+LziJ/X2k+J1mOxRWx83qYA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org;
 dmarc=pass header.from=outlook.com; 
 dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=pwEEprq2; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:d40d::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40d::;
 helo=sy8pr01cu002.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=pwEEprq2
Received: from SY8PR01CU002.outbound.protection.outlook.com
 (mail-australiaeastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DA9A40C01
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:16:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYEsbFkIKRcS24WxqXf9dDdCslJwTFoZ/zUuUOYHFATc/edfBniip5P/XkG/TbV0KqcvBCWtRtMAZdHwyESYzSSMs4VoRzdQh17nFZAU7DyhRBPtDzdrF9dfo/u1crkCYpc/BFtwe9aHo9Nwwmzb18mbE0SXBb1lU5t9VRcCHqe7owAa25p+JIRta+DgyIm34OSFvI5iZAzTv8s+rTCx5U5v7KIbvXRF+OSziC7i8SWIXamSC/yxjoOWrJpBbkoin90qZOPE2e7GbGl9+wVonmJp5mtLGqaO3q47HiGteompbewrnVUXwLbd+8HFhGMBNWfjV567j0uE57011rbecQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCkJiQkW8AdgHHleJl88t74UDY4DkadDQYk54oyVcDU=;
 b=COK+jyYZ+1lxnnc6E/oYx0T+TRhtbUjH+MNbo0P2aTGpbxzOzHX2JaGRSPzH6Ib4pfAyt+G3HwbkU9pcFgjzhQreJBq1LYj7CaKYv9+DqZsEqJcxofFhNNGjyMlJIWtfFojZPWAbvqsKdbMwG+zCiLj8DBav2P9R6CcJ8MKgQPCQCVRhuomCAPrlZi0GPWXdWX2u9+qiVv6tKx08ya8axVzFGOWistlqQCrkaV+keexONEjp1sTD012vn7Hok3txWhg9Rg/mQIv4xnnHax8LjhFUBHCTPgKa2SYcBvfbeVAPgvMqyc3FC0/+JbULuOWhXMUfcxzjpduL4LtJTI06ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCkJiQkW8AdgHHleJl88t74UDY4DkadDQYk54oyVcDU=;
 b=pwEEprq2dIghyuRbqTu0OL3WZRTlmcyejocv7wySps8B4OWw9ThysQDTfGQJ9KSBBND9GcHZ38b8x5xAz79xnQw2Tx2pI82rxVe04fVXyDsj3550pRkxUnx/vNwgqfPYdeo/s32EHKY4XbeDG0BLwlWfvXrHl/Cda30m9YhDiicJAchPvVI/mGqd23CpMNkBOkZlXQrCGMuB/LzUcsziUQMimn8fcM60FKQECez1lh6SLiuStmKI5SpPkMPmVDM+Lmcq4hZFTjf2/vD/3BChqbaRRd6mXk8ToBv98Qg4pdFM1MRBMBgY369N+RR4sCBfUKqlUncR9VVRduMqthUAZg==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY7P300MB0607.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:28b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.14; Fri, 18 Sep 2026 17:16:42 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 17:16:42 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 19 Sep 2026 01:15:21 +0800
Message-ID: <SY8P300MB0041C083DA3C3DBC8ADB5804B5872@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <SY8P300MB00419E6035B2DD54F72006D3B5872@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB00419E6035B2DD54F72006D3B5872@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20260919-bump-visonfive2-v1-4-bcb309feb582@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY7P300MB0607:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e118d97-35c0-4472-2c8f-08df15a89bdd
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|19110799012|8060799015|24021099003|51005399006|25010399006|41001999006|5072599009|15080799012|23021999003|6090799003|40105399003|2607281247196008|3412199025|440099028|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTVYa3VDM0IwajFXM1dtdHJ5ZlV3Z3FKTGFwZUtxRW56THU1WVEvUnoxcXhW?=
 =?utf-8?B?SlkyaWJienVaTXowVUh2SE5QcFJmVGZXWFdvano0V0lkdW1GUWFsS0lxeXRR?=
 =?utf-8?B?cE1zTWN2QlBiNXF5RVFvTzdDMjNKOEpiTkhXc0VvaFZPK052T2dIbUxoczdF?=
 =?utf-8?B?eHhudUp3SnZhbTBMMXBBdXlSdUpnWWwwVUJydldzTjRmMXJyKzFQKzMyaGty?=
 =?utf-8?B?WjhkZ3BjanNZc2ZVT04zbHBmS2dMWnkwNTNsckRRdVZhTHpDbko3STVndjcx?=
 =?utf-8?B?VVo4UmlTandlSnE1UjB0eXJaRVdHWG1pbGdxVmsrY1FGZzR1ciswS3g3SUhj?=
 =?utf-8?B?UnErdG9oUys3RmI1dlNLU1h2SjhFRnp5ZXFCejhFR1dxeXZPQVFOUlVHZGpz?=
 =?utf-8?B?Q0RrQ01KanB2eDFhSWVMVFdtUkV1QjhhTDBwQ0l0SkhVU2taeU01Q28yZ3Ax?=
 =?utf-8?B?eEJueVlCZ3pPN2k0OG1nK09aVGVkQTRaYWdWbzRQTjFWMWRZRnkzT2YxNWRX?=
 =?utf-8?B?WjJwbnJscGpSeVdsT3NaSzRsaXJXVTc0WmtqVllaMURHSTRld0FXRFBoTlpy?=
 =?utf-8?B?UW55RGF1MFJKL243OXdjamozSnREVlJKZDZ5WkhPQ0JwRms4U05MK2R3ZThz?=
 =?utf-8?B?SDBPQURPTkVHK2dpYm5BVjljMTdKZEhiQk9JTkg5U2hxMkFUaDA0VUpKMXRQ?=
 =?utf-8?B?L3NUMERESUxjWlZuUWdmNVVTTnAyQUtacXozSVRvQjhkU3pjSWtoQitUWG9q?=
 =?utf-8?B?bkRobG95UUxyZElFUUl1KzlTWTdtRDN1TXNaM05WdXpWRVh4SSt2V25BbVpX?=
 =?utf-8?B?SDlvZ1JzTk5JMEZTV0lDWWZuN0szd1ZXMnZBdFFxMm16OHkxa1B0L2oxS3dK?=
 =?utf-8?B?RWZCM0lqNnJMQmpVekdkQ0w2NWNpQlJNL1RmcWdzTWhNU0xLd1dxeXZBWk1m?=
 =?utf-8?B?N1lqMThGbU5yUW9WRXdQcXhXdXc1Zy9mMmJienU1NWdmWmMwRlRFRWJaUDIy?=
 =?utf-8?B?ZndtMWs0SVl4dS9nOWtQMFl6WlhlUmZSczhJUGlVbWJieXY4V09KUFpSdTNJ?=
 =?utf-8?B?ZkFFM0l6OFNBZjRTaDdrZHowRWVVaHNvYmU4STVrZDlLc1Z4c1MxSFQ2cTJC?=
 =?utf-8?B?S01qVXZxRHhrcGgxVmhxVk9scVdMWGNnZFY0MGNwYUJDdmhaTVR0WXkxQ3cw?=
 =?utf-8?B?anE3U2VNOHlIWWwxcDcxbW4rVERVQlZGTW9lM0pBWHFHeUg5UXVxWjRjbU9X?=
 =?utf-8?B?U0dUN28rTGFPTXd4dThDYU5xVGh5ZGt0S0crdFNOUEVXaXZEeTQ0ZHpoRlVF?=
 =?utf-8?B?Y0JRMXdLMlY3NkhOTFEyQkp4MXQzbVFIK0kyRjZFeWVYbE9TY3dkbHcyUUdi?=
 =?utf-8?B?T2MxQ0hQemhYc2c9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmVlUzdxV0NkUy92NEJjKzkwalYzdGJ5aHk1MmxlUE9pbjZlR0FMTXh3TkQv?=
 =?utf-8?B?WEwwWnFGdXRsNjNoNlhrY1BlSVZmVis1RGZFdFd6RDlsdUI3ZUlkZHlxRDhJ?=
 =?utf-8?B?UnVLVndpZFA4UmNjMEh4Um5qZlBMYlA2RXFkYVFJUld5dWYzaUU4RllsNnZT?=
 =?utf-8?B?UncrZmUwYkpXcEhVb0ExOEVjQnhVUTBMRkNFcU9BMWRDS0h5OFYzcTluSGIr?=
 =?utf-8?B?UWRFSXlLYWpWbU5ja2RkTUhGVnBFL3k1aVpHdENua2wyaDFtQ0EwNGFubWpG?=
 =?utf-8?B?bGNJZklvTWwyM0t2bVhxb1ZKU1NXRHVhRHF4Q09LVVVhVUp6L1JXS25Iczgv?=
 =?utf-8?B?M2VlNnVzV252VjNhd3RRck9aK3kyb1NhMVRja2Urb2xxc2VhbzZmTnh1Z0xu?=
 =?utf-8?B?TEticlRLblNVMG1lNU45WFJia1kwQndPbEdWTnd6SkJkaXlwMXJOL2NQcGZH?=
 =?utf-8?B?M3ZNM3IwenhpZUN0YnpWNVFwUjQ1bC9SN1Qwcnl1RllKU2hBOTF6SHhHb0NE?=
 =?utf-8?B?RzNwVkIzUkc4cXdWbGplbWJJbG13VGEvNUhoQU9jTFd0WDJlVE9XSCtUVjhT?=
 =?utf-8?B?a0cxdG5Vc01iRW42YW5tSnQxNGNHRkltMFZrTW9mODdYdHIwYzZSQU9Iejdi?=
 =?utf-8?B?YWdqOStqQTVGSnYwRXFiUDdFbkl5a0VqQVNvZ045UWs5S08rNHlwWnJVU0Ix?=
 =?utf-8?B?VnJ6djRHbHgrbkVkZjhCSGR0L3cwVFllUkg5VE5pdWhwZGNCTWRIRFFLY3dP?=
 =?utf-8?B?RmJDbVNuc0NCR1RjSmNaOFpWaHZEaVpoNCtib0taT3pBWkpoaDVCMkJZeU5X?=
 =?utf-8?B?T0E5YXlIblFMdGsycExEQUNrN1Z2TnVXcFJLa1Y2aXN5aTJmWEJtZDhZQmRN?=
 =?utf-8?B?bmlFYjhqTFZrdWF5NTlyQ1pCZGNGNENsb3huL25WUElQSUZ0cjYvYkNTSHdD?=
 =?utf-8?B?OW9JUmRKN2VjOGZNVmxEQkhpdWtxQmpuc3pscG5sU1FGWXJ1aTYvSVBwUUgx?=
 =?utf-8?B?ZWNpN3hsTXByS0dqL21Uc0ZRZTdSRlRia2YwQ3ZOV01CaERsT0NJUUwzZWRw?=
 =?utf-8?B?c1VJV2I1MDNKNld2R3hzWGNMRXZ6THBHblpFUkg2Z1A1enMrVHJPYkRIaGNo?=
 =?utf-8?B?OWdVQk40bUVNaDZOdWlHQUNqa1BtVTl6Z0Uwdm96a0dQS2tTQUtSUkFML3JT?=
 =?utf-8?B?UXBsT01hU3l0M3VnYUZwUkZNWnlUcFBPeUNraGNSMXZvUmtMbVVIK0c0TVc4?=
 =?utf-8?B?OUVibjRPMFhFaEFpdTJPWTBSUUhvQW0xUnZIWXRyTGF5QXhSenkrYi9ZRVlt?=
 =?utf-8?B?TnVzSkdmMHIySXRmZkN0QURSWGs3YTRsakdQa2Z1MVpFS3VXUlVKdEVsMy84?=
 =?utf-8?B?THJ5WVdYZ2xVNGZJUHVCWWF3WkVyOWhSbFh2YkI1Wi9rWmJCZi9Yb21jMGxz?=
 =?utf-8?B?VEpqc2IweFl2dFZNc0hrQ0VuQ0lEUXYzSnM5bnJ2RVBpWkx4ZDBRdDNnUDZG?=
 =?utf-8?B?TGpka3cySVJnUkpMekxDOWE0d0tJb0J4QzRGcHRYK1RJYXhoNlV6VEFaeWVw?=
 =?utf-8?B?dE1sMWRtRTNWWEdna0FqVCtSS0RRUUR3RTRZT3J6WUQ0dXFnc2IrTHBjaWR5?=
 =?utf-8?B?OCtHS0ZSNGRacjJYOTlFSU1xL0piOHk2VlRxeUdkU1RwZm9SenBqZUVZVHZk?=
 =?utf-8?B?Qlo1YU5XQzRYUDZTeUNScU9zb0Q4Z0VXU0FJOU9tTnRVOEo1SEhGZGdDcEc0?=
 =?utf-8?B?RHJSd0ZwbHM3OUZKc1BCeENKSTd4aklBMzhwUXpnMFN1am00VTNaelJlTnA1?=
 =?utf-8?B?WXQ2UFVTNjlpY2NPQnYyV2xHTmZJTUdDWUpMM2p1eUFpWHdGNTVEUU1Vdm8w?=
 =?utf-8?Q?ve2mXZTqcy5mL?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e118d97-35c0-4472-2c8f-08df15a89bdd
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 17:16:42.5170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB0607
Subject: [Buildroot] [PATCH 4/4] board/visionfive2,
 configs/visionfive2: support version 1.2a board
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

There are two revisions of the VisionFive 2: 1.2a and 1.3b. The main
difference between them is that 1.2a has one Gigabit Ethernet port and
one Fast Ethernet port, while 1.3b has two Gigabit Ethernet ports.

U-Boot sets the $fdtfile variable based on the product data in the
EEPROM during board initialization. Then, <fdtdir>/<fdtfile> is
loaded based on the value in extlinux.conf.

Additionally, since the $fdtfile variable contains the directory name,
preserve the directory structure of the DTBs when copying them to the
target directory.

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 board/visionfive2/overlay/boot/extlinux/extlinux.conf | 2 +-
 configs/visionfive2_defconfig                         | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/visionfive2/overlay/boot/extlinux/extlinux.conf b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
index 7934d70e15..6c290f519c 100644
--- a/board/visionfive2/overlay/boot/extlinux/extlinux.conf
+++ b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label linux
   kernel /boot/Image
-  devicetree /boot/jh7110-starfive-visionfive-2-v1.3b.dtb
+  fdtdir /boot
   append console=ttyS0,115200 root=/dev/mmcblk1p1 rootwait
diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index 3e30c0649c..7ce605b84b 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -11,7 +11,8 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.51"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/visionfive2/linux_defconfig"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7110-starfive-visionfive-2-v1.3b"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7110-starfive-visionfive-2-v1.2a starfive/jh7110-starfive-visionfive-2-v1.3b"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y

-- 
2.55.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
