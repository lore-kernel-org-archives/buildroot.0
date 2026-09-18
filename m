Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BF0C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 17:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B167840C89;
	Fri, 18 Sep 2026 17:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xG14QyiB-wXL; Fri, 18 Sep 2026 17:16:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 85A9B40C95
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789751815;
	b=r9AwsHR1dgTs9MP5HoyW9fKcDAeKg9e27AA5E75nRZJGpR6baAJdEUztnfrk2GdBKAi5
	 8gMYZ0dMAbSu6IEukHYXtabnq05N0yvtqNsgaPIRUmP6no8yfo19jYApx6pBHzPxQBl/0
	 on6/MztrrFHd+KlrZWRQkkU/MlUKcEqcXU2Aq+oxzYe4i7hYXQosDU/LcXQGDzXBb1bjf
	 JzN0Snmfb1TL27yFFuGb5mqyrL2efDcbNb/eEkWDg7tiBGAKdZw+3bMdQcnHkvYkRWvXU
	 iMmKQeNrCMUmocmsC0/MIPfyUfrlCd++J0f4ecDUr0ClUayngVn1jTqINxaAJx57mqQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789751815;
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
	bh=waku7ZN//DxZBwpCgwuL4sEdiGPkT2GBOOjaK688Q8E=;
	b=WmnUGSCZOrtc+olfJck518rYaoZsYK6iKa1CSvlU0+qtF+ZjZxJ6VUvu2Pc8p9oqyOfk
	 gR/UMJub+Nnrf2UCNTf7eSrRUoubXtuihi6nMH3lXXnxdd4ZcV4cnvMcin/uuNRFhsTqF
	 TGszk/yirfExkv/sRYxNHIPriZlxkAoQm5f+0EMML82/kPvUD7+coUbEMlOWKjutnXGOQ
	 A9gyDfwIotfprZCRVZK+Xe8/qz6uKJETcD54a5s6VsrU4TACFsiKLQS6UFnPYN85O8LdF
	 xXe7d9oN1DW4Sw7tzukaZ1pII/U4KYA72lmjXXkHI/uvanIxbI3jevhGg7vl4o8atkQ==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; dmarc=pass header.from=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=HnraZVSH;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789751815;
	bh=waku7ZN//DxZBwpCgwuL4sEdiGPkT2GBOOjaK688Q8E=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VFmY+P/bfhFWTHwq/yt6ZeH4c9ov2hv9dvAqq19Zg79ckuSTCVlN/DkAm7usJmFm5
	 uig51LuVkBHcdltCP7vUn2R/SLL2oVFGTHArV6SA2Y2GBepuMx563dA/N+rWn+zcsP
	 t8vmTgAMvDe9Z4SX2L4Kf9w4vp5gjI9AHmszwJe0dH/wzwzXr0cnYMqOJbf1LHBte1
	 re05mKy1n8bCaxBDGreCYnJl1Pl/d2daWmfAYegglqYQzVnE2woj5igM0ib1sSaulv
	 Q5Uf1Uo1yVQDpdxEymjuG+01lvHpwNXPnWAmIWQYLsZokE8Enm8gt4umUKRsMrZVry
	 7ZQkMMqdo8byQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85A9B40C95;
	Fri, 18 Sep 2026 17:16:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25C39237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A59740C8A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1iclEWYA1rJE for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 17:16:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C8F0D40C87
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789751811;
 b=Z+n5e718wUjVptdMmrMFk/fJ31P7grCW3Z/BkvIqTWY1/bCeQyAQ8/HZcS8X53gOHS6Z
 NsqPBlAc/3SLkZLx0EsMnzruLUXlVHsxPK2C6psye1oHUVLOzKSSAM3McYgTp4PDRxj9O
 JHUfqEQGnDrxp7OWtOE83sxmGyWckcg54VulwUPtIsbHvD2gZhVTLZ50sFYWrYJl3KttV
 ooAsIOhZngRBB15qjKxv4+0DWWYjmY9KB9mKu7w0LX77V42u4hsal/ytTG+/L6L6G46Fo
 GmQ/9OyJVv3Uu7XiEovr8BiMtSHXU6ZNXbxJhnZyRFEK3mItWoCZFAblIBEMaUVYdnQ==
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
 bh=ePMVmfLRs4r9m3hAOgReHyZfMVbBGPFGdFjawnMpNcQ=;
 b=UcfKB395EOMKUTXrFBgNExgIAMZNf3GD5Id+mzVmW730FGqJ9RFwHSXg+VisLdua8dAk
 NfIRaLXvGfWjR6tSOvsMurCbnp/bIF1BKdNzx5vfydFiWtOAClEsW2TUNjV1v7Rt+myl8
 AgUV743oMWzJ8TLyhyBz7HPsS5z2+yqZT90b4GSRJb73+rkALP1qeBWwIw7PVvOCRIvMv
 thumjE4fNwDsnfMsNmWcaFStq0EFymsKgEKy0A0EgrMOOoJC64erfsy5JJfivmjLLEtuw
 sbG6fUCBric72MlbZ23cd09BbwiiltZR1Uix9xx0/8JIMCJGyfVmjIKXpYi/cAcECjQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org;
 dmarc=pass header.from=outlook.com; 
 dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=HnraZVSH; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:d40d::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40d::;
 helo=sy8pr01cu002.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=HnraZVSH
Received: from SY8PR01CU002.outbound.protection.outlook.com
 (mail-australiaeastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8F0D40C87
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:16:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2NXO+GNXTRMAzrAROeuSiz3/ETfG5N6G7nOrttp7kUcZ59KA4DNz4VzWX5XJPxcdjgVU+x+/ggZginLdN0nqdgnAhFZQsUyazl5mD1MicuF9uhnuzeX5grwuxrsWnMD5odMIFAoT9/KCxgccFRi2/QQH8Kyn1w0YOnpYutrVtRbLgu811XdDz3aZo2JjnBf46wUsHUpmFMWLTjcHjjHOK2jRdz0QrJ+cxdT69uyeQtVeU02zBAQxYn5jPcUgxoCfGYk7C5JrF8KFD8aB0kqv+fUvDvkLndRjy/wzbPIvguLPPaweuzup0lc7IVwydllP+JEnzV/M1kZpd+wsyrAkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePMVmfLRs4r9m3hAOgReHyZfMVbBGPFGdFjawnMpNcQ=;
 b=Xeutu3ZNawDzIO81xOV4yJtrMlzAIH6fvPub4zALmGCwMvGuUzSxTW8JR5hNSn31ga+fKpQVx4M9ay2y1KM4S+5NODjobPIaa2lDIKT05EC7kuia180VvsZv39eDfLLZTIfblXBwus42QE+FKApBzgroDMREyD30O0axr6BhheiFTKObFwqkbzI3CF/E7GLV7Kj+v6Q0Qtxi8ACCxtl8ZGkOLoz8mja9n5EyrjWE3/72IrWplvIIkgNdIgUYDKGco9uIAgal+UtTJVrIpzOOii8NS7nMyO6f995051Tvfmt2aJ7S5qZoN2vUeQyU2LvmM7jytk+CV0Iu5AuWTfk95Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePMVmfLRs4r9m3hAOgReHyZfMVbBGPFGdFjawnMpNcQ=;
 b=HnraZVSHuR8YI4Ew66mYJIftEan+MivfOkauh5SZhWSKcsYsShfCDYNdAkYVCk6tTFK8RNaCJYkaRMIm1f/3J0UnFN3nRtrn81GwUslYEyLtIdsCZFLeGxmyUkfXhiULiqQR6W97rR7dg7w8Iz70dq5NmkZEAL9zSXhT1CEkdjwSmrdg/Ry6WAr+0mmMMVhALXYUUlyjzwsu+mq00JD06yrro4CkjqI1bzp6l6sehAsv6aqh02BYBuzwXe02N9lq7Lm99jgXJJZhKKqSLeAkDyBj5gmkJcydA4bU5MxrvJ5xDaVECaN0nSlUErPff4V/ArlUpTmB7EAjJsdREzInXA==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY7P300MB0607.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:28b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.14; Fri, 18 Sep 2026 17:16:41 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 17:16:41 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 19 Sep 2026 01:15:20 +0800
Message-ID: <SY8P300MB0041226B30E111B5CB5D5967B5872@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <SY8P300MB00419E6035B2DD54F72006D3B5872@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB00419E6035B2DD54F72006D3B5872@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20260919-bump-visonfive2-v1-3-bcb309feb582@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY7P300MB0607:EE_
X-MS-Office365-Filtering-Correlation-Id: fabdfb73-76ff-4ad1-785d-08df15a89aef
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|12121999013|19110799012|8060799015|24021099003|51005399006|25010399006|41001999006|5072599009|15080799012|23021999003|6090799003|40105399003|1602099012|10035399007|2607281247196008|4302099013|3412199025|440099028|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1NlUmFraXRYTVlidkN5MVdTVEgyMnd6SVBINWFrUjBIN3dIbFpHUkYwMi9D?=
 =?utf-8?B?SGZWN1R1VWJaeWVlT3pPMmxPRWhCakk5YlJacVRhWWxlVTlvR291TTZpemZZ?=
 =?utf-8?B?dERjT2ZacHU2aXNlUnZIZEhYZ0U4bkJFbzdDb0EvL3Q5eXREeXBmL3hwVCtw?=
 =?utf-8?B?MEZGTVRMTG9WY2dMTFFKTGJlTEpBZFF0TUFWRnc0bW80YkJJUHhSaTRLZ2I3?=
 =?utf-8?B?TmdzZmpZRTFSZXNmU0VQYTFDaTFORDV1Y3FRTzZMbDU5TVNCaXVNR3V4bjdy?=
 =?utf-8?B?SFFqSTkyS3ZYWGNQOXZvb3ZrQzYvY21BVTVjdW9FeGJXVzJadERyS1dCM09I?=
 =?utf-8?B?QUNlT2cxalUyQjJHblJTVWhQcS9Da2NjZkhoZlJNeWFoLzEyUU8rYnNZTXhk?=
 =?utf-8?B?MU9UaGhFODd0UkwrQ0FNc2RuLy9qaXJpUTB3WEhNRjdlWndWUy8vbWRtVDVk?=
 =?utf-8?B?NmhYMXZaMlEvWHpNWHlETEd1bmxTQmU1VUJkSHgveXltKzZYS29iL0F6Zkll?=
 =?utf-8?B?T2NTMkNwTDh6bkRFam1iUlFOemcwb0Q5T0w0NmZ5WXZ6VlNCSXpBL25NcnlJ?=
 =?utf-8?B?cU1ia2tROHREU3FweFVlZXdyODZYQlFIU1dMTkVnd3V2SUdrSTFNYm1QTUwz?=
 =?utf-8?B?SEpPdXRYTFFVK3hOR3VkMlhrdTdvMzVZa2pNVXlOQnNPVHRoSWc3OUQ2VnRD?=
 =?utf-8?B?cmY4SmFKZm9KbTRyRm1oUitWbElJQkhMWVIzSTRvN1ZQWHgvUzljU2Q5ZmI3?=
 =?utf-8?B?ZUt6VTIzeHAxbWlyL2tlcFFURXlTTHduYTV5U1JTRjdFN2RpbE1iUXlkTW5F?=
 =?utf-8?B?YlphU0pPYUkxN2hZWGJ0aC8vQWFiRisxUWg0MkVnNGFURjYvM1d0U1BWOWlX?=
 =?utf-8?B?TlZDejRQSTVVenRqS0taQnUzdTZSeSt4a1dvY3Bnc2Nid0VzNnhxRWRETUlj?=
 =?utf-8?B?SlNUUzk1UnlqYWxXeGZEeExDNXcxaTUwb3FDa3pnaGhYSFhpZmdudWtPNjdR?=
 =?utf-8?B?RkJXMDlZazFOalRzWDBxcExPUWloQThwNHdQQW9Yd3h5cDNsTFdUYUJ3SUdz?=
 =?utf-8?B?MjZpdWRld1FxdUEzMFpLb1Y5RWVxaENZZ2s4eVpIVllDTk1uMjZUMDFDNGxy?=
 =?utf-8?B?MXl1Z0l0ai9sSUk5aEhzZUdBT0lPQ3c5aTRkeVdpVzZKbWNVcXE1N0RTQVB1?=
 =?utf-8?B?WDZJdSs0RnhWK0g2WFc3OXdCNGhFVE5xcVcyVjRNSDhvZklCcFplQW44aGJT?=
 =?utf-8?B?NXhySE8rM2V3dGhxbGp5RTNiQmVzd3UyT2U4bUQ3ZitJQVpCSnJ0VkNxWGMv?=
 =?utf-8?B?T0M4ZW1RTk1RV1NsbExyNGlOMEplSXJmdFNRdUpMSzJzVzcrMnlDYzRLV0hK?=
 =?utf-8?B?MkZuMVJwUkJETW01Y21Pa3h6N2ZLS2ZGSy9SYjhzaVptaWNiRzhZQUwydTF6?=
 =?utf-8?B?Y0xQOHV4eXFrT0RKTE5Oa3dwL2Q3S1BkZ2JTQnpqRlhJWGNJWU5aVStwU09Z?=
 =?utf-8?Q?N2nBVU=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkhEN2cyU1J2aXBYWUpVWXpRdHZCc21xU3k5Y3MzQ3ZMTUw3VmdoZXZNNFpJ?=
 =?utf-8?B?UzFOQVpmVE43WGNzNXR0Z3RnMWQ2czVENi8weG5EMHFRMFpDcUplc2dlK3BO?=
 =?utf-8?B?NkxkOFdUQ2ZsWFJ2Sm1sb2MvcmxCZ0pTckdOSFpSWEJhU2xIQmJyNGM3TVRZ?=
 =?utf-8?B?dEtYSjJSL2xyOVl2bFdKN1NyMUp6Z29zT2R2bU8wdHVkZkVLRElTTUt5QmNk?=
 =?utf-8?B?Z0FtNUYzYUZQQnR6ck44ZWVBSy9wRC9iODlsaVFGS3RTeU5KSWdSMkg2cWgr?=
 =?utf-8?B?ZXY0VzBHMldHWDBMVHZQTGpzZElXQnAxRmQvTnVacUp2TXFmd1MwRlF1VStR?=
 =?utf-8?B?cmVmaVZBMThwMWNySHRuYkx4d25scHdzeHBZKzJNRHpDbkpuZk9vTk5oMEgy?=
 =?utf-8?B?ZEFmUWx1M29ZRnVjV1R2cE5DSHlpSUdvbmhyZVc1Q2psUWc5aFNkRFRYZHFr?=
 =?utf-8?B?NVpYb29iU2c1bmFOTDkrajQ4TnRuRmFHeGxHMDc2ZFlPb0tLZlFwVVg4eEx6?=
 =?utf-8?B?NlVFY25QTnRXUlRGNXYxazNQTlF5UkRmdjdYV2VLVzduOXJwRnZFK0JIeUpF?=
 =?utf-8?B?VnFSTWR5ZEFhZWRNQk9yN0RnaEl1Z1dSYUd2enFRK3RYQVJwbStHbVBKc1N4?=
 =?utf-8?B?bzh3SDBDSkFsS0VoZDl0all4dXUyaDBlVHlGSC8rRUZROVhyczVmU1lyZW5H?=
 =?utf-8?B?enhSVVdoVWk5aVZFWmRJSVZTMzhmbzZLR2U2cmtFbVJIYkVwdEIwOW04cWpr?=
 =?utf-8?B?QXRyRmdXcUxJaVd3N1JRRk9QM3FFTTJXSXR4ZXExSzdNWng1a3lHSmE1d3Nv?=
 =?utf-8?B?bGE1am5pWkgweGNzNGhPenM0NHNnTC9JMUJpcXVsdWptUFZQRm13WC9EU2ov?=
 =?utf-8?B?ME5PcElPYUovNlRPK2M0ZldiZ2M4QS9GZDNiZlhlZURCbHFrVmpKZDRCY0s3?=
 =?utf-8?B?Z1h1Q3BkL1pqODlEeCtka3o5bEZtTVZqM01lTmJocHlFNVZsa2psaGJqeEpZ?=
 =?utf-8?B?dlNEYmJUOGEwQXQ0bGdrM3pia1hsZmlKVGprdWMyTFpoKzIvdHlhbitxcmIw?=
 =?utf-8?B?NHpMbHJyK2FGM3hBUzBuSis3cFpBYUROL2dBZ0xKY2pOempYNzhVK1RmWmZC?=
 =?utf-8?B?UHMzWkltOU8yMFZhS0dOSDcxS2dRVnB1SHQ2RnlORnFmTGtjRjdqNzJIY0Fz?=
 =?utf-8?B?WHlDMW9VSkNhWjZKTk54cElQZWJFTE1xV2xxNjlDYTBUMkVzc1JRR0k5S1l5?=
 =?utf-8?B?eFRERk9hUGVrc2YyaStoMkRJZExIR3JtNWpocVRZSy81aFc4ZGhBQ21xVEJo?=
 =?utf-8?B?RDgzZjYwb0dFemxycUdzYmhMTy9oSWxuaW5Ha2VIM1ZIK3h2d3lrM2F0L1hW?=
 =?utf-8?B?ZmFQZFdFRWFYTFJlTWlKcmR6bEtZZlhrUWJGZjZlR1VtKzdaNHJ2OGFscjhY?=
 =?utf-8?B?Q0dha0MvU2pTcTBIKzZVQlBtRVc5RENSMzA4RTBVSEo0aDF4MVV4eWVvdUtS?=
 =?utf-8?B?OXp5RUNmSGJhQk5tZjcyZGEvdkluYmd2ZVRZVHl5VkRSRlVOTkkwbzd3RHVm?=
 =?utf-8?B?dUw3NlVhakx0a1dGaWhKbHlpejdYM1dHZE5UR3JhcURua0pwOElUcWFGNXcr?=
 =?utf-8?B?UjNuZndTdGExdUNqUHNrSWg3ektmdndMaHZDdHEreFN2NXlDUVRQRmFNczA5?=
 =?utf-8?B?YVpncVZkOEQyTHhHdEZ2UjRsSE9PQ0NWa1VwR3g0OTJRQkZFd3NJb2ltaGxh?=
 =?utf-8?B?RzFDejlRK0VmMEdERXMxbXh5S015c3pONVNCOGJ3SGZNelpKSTU3Ly96bml2?=
 =?utf-8?B?cXJXWGc1T2FvZ3BIZURyNHdPOHJsMWdEcUYxNWpnMEVuZXoyanZMMGlmc3JX?=
 =?utf-8?Q?zxgFWWxhIG+6B?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fabdfb73-76ff-4ad1-785d-08df15a89aef
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 17:16:41.0972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB0607
Subject: [Buildroot] [PATCH 3/4] configs/visionfive2: bump Linux to 6.18.51,
 U-Boot to 2026.07, and OpenSBI to 1.8.1
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

Migrate and clean up removed kernel config options during the upgrade.

Drop uboot and spl partitions from the SD card genimage configuration,
as U-Boot has deprecated the SD card and eMMC boot modes since
v2025.10 [1]. Update the rootfs block device in the kernel command line
accordingly.

Update readme.txt to reflect the new boot flow and instructions.

[1] https://docs.u-boot-project.org/en/v2026.07/board/starfive/visionfive2.html#zero-stage-bootloader

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 board/visionfive2/genimage.cfg                     | 10 --------
 board/visionfive2/linux_defconfig                  |  7 +++---
 .../overlay/boot/extlinux/extlinux.conf            |  2 +-
 board/visionfive2/patches/linux/linux.hash         |  2 +-
 board/visionfive2/patches/opensbi/opensbi.hash     |  2 +-
 board/visionfive2/patches/uboot/uboot.hash         |  2 +-
 board/visionfive2/readme.txt                       | 27 ++++++++++++----------
 configs/visionfive2_defconfig                      |  8 +++----
 8 files changed, 26 insertions(+), 34 deletions(-)

diff --git a/board/visionfive2/genimage.cfg b/board/visionfive2/genimage.cfg
index 8133e740c0..af7bc70d1a 100644
--- a/board/visionfive2/genimage.cfg
+++ b/board/visionfive2/genimage.cfg
@@ -5,16 +5,6 @@ image sdcard.img {
 		partition-table-type = "gpt"
 	}
 
-	partition spl {
-		partition-type-uuid = 2E54B353-1271-4842-806F-E436D6AF6985
-		image = "u-boot-spl.bin.normal.out"
-	}
-
-	partition uboot {
-		partition-type-uuid = BC13C2FF-59E6-4262-A352-B275FD6F7172
-		image = "u-boot.itb"
-	}
-
 	partition rootfs {
 		partition-type-uuid = 0FC63DAF-8483-4772-8E79-3D69D8477DE4
 		bootable = true
diff --git a/board/visionfive2/linux_defconfig b/board/visionfive2/linux_defconfig
index 509cd0f475..1ca11f4097 100644
--- a/board/visionfive2/linux_defconfig
+++ b/board/visionfive2/linux_defconfig
@@ -3,7 +3,6 @@ CONFIG_COMPILE_TEST=y
 CONFIG_DEFAULT_HOSTNAME="StarFive"
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_USELIB=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_BPF_SYSCALL=y
@@ -59,6 +58,7 @@ CONFIG_NF_CONNTRACK=y
 CONFIG_NF_TABLES=y
 CONFIG_NFT_CT=y
 CONFIG_NFT_COMPAT=y
+CONFIG_NETFILTER_XTABLES_LEGACY=y
 CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
 CONFIG_NETFILTER_XT_MATCH_IPCOMP=y
 CONFIG_NETFILTER_XT_MATCH_IPRANGE=y
@@ -69,6 +69,7 @@ CONFIG_NETFILTER_XT_MATCH_SOCKET=y
 CONFIG_NETFILTER_XT_MATCH_STATE=y
 CONFIG_NETFILTER_XT_MATCH_STRING=y
 CONFIG_NETFILTER_XT_MATCH_U32=y
+CONFIG_IP_NF_IPTABLES_LEGACY=y
 CONFIG_NF_TABLES_IPV4=y
 CONFIG_NFT_DUP_IPV4=y
 CONFIG_NFT_FIB_IPV4=y
@@ -197,7 +198,6 @@ CONFIG_THERMAL=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
-# CONFIG_HISI_THERMAL is not set
 CONFIG_WATCHDOG=y
 CONFIG_WATCHDOG_SYSFS=y
 CONFIG_MFD_AXP20X_I2C=y
@@ -370,7 +370,6 @@ CONFIG_SND_USB_AUDIO=y
 CONFIG_SND_SOC=y
 CONFIG_SND_DESIGNWARE_I2S=y
 CONFIG_SND_SOC_RZ=m
-CONFIG_SND_SOC_STARFIVE=y
 CONFIG_SND_SOC_JH7110_PWMDAC=y
 CONFIG_SND_SOC_JH7110_TDM=y
 CONFIG_SND_SOC_WM8960=y
@@ -522,7 +521,7 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_INIT_STACK_NONE=y
 CONFIG_CRYPTO_USER=y
-CONFIG_CRYPTO_TEST=m
+CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_USER_API_SKCIPHER=y
 CONFIG_CRYPTO_USER_API_RNG=y
diff --git a/board/visionfive2/overlay/boot/extlinux/extlinux.conf b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
index 48d267f725..7934d70e15 100644
--- a/board/visionfive2/overlay/boot/extlinux/extlinux.conf
+++ b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label linux
   kernel /boot/Image
   devicetree /boot/jh7110-starfive-visionfive-2-v1.3b.dtb
-  append console=ttyS0,115200 root=/dev/mmcblk1p3 rootwait
+  append console=ttyS0,115200 root=/dev/mmcblk1p1 rootwait
diff --git a/board/visionfive2/patches/linux/linux.hash b/board/visionfive2/patches/linux/linux.hash
index 1213da86b1..b2cfc9b7e7 100644
--- a/board/visionfive2/patches/linux/linux.hash
+++ b/board/visionfive2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  643142c1b5991560dd12f950825cc19e4497b95b82641918ecff1177f4130c1d  linux-6.12.24.tar.xz
+sha256  ba2f60f858bf4d1f929101faa356c93dc8b925b17aaa9f95eabd4627758df613  linux-6.18.51.tar.xz
diff --git a/board/visionfive2/patches/opensbi/opensbi.hash b/board/visionfive2/patches/opensbi/opensbi.hash
index d7893a1dee..5e2e695bc1 100644
--- a/board/visionfive2/patches/opensbi/opensbi.hash
+++ b/board/visionfive2/patches/opensbi/opensbi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  d11702103f177a2914e94eec57ce5ed820296d874f6b6525c4482e55d71a3667  opensbi-1.6.tar.gz
+sha256  fb1ae61a85e966322101acb1c982f84d9eaafc4de7dd474a7d7546d9bb321c6f  opensbi-1.8.1.tar.gz
diff --git a/board/visionfive2/patches/uboot/uboot.hash b/board/visionfive2/patches/uboot/uboot.hash
index 80ea21b7cb..ff6e4ed2e2 100644
--- a/board/visionfive2/patches/uboot/uboot.hash
+++ b/board/visionfive2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
diff --git a/board/visionfive2/readme.txt b/board/visionfive2/readme.txt
index cc4fece6e9..3fa0bbd5e5 100644
--- a/board/visionfive2/readme.txt
+++ b/board/visionfive2/readme.txt
@@ -1,8 +1,8 @@
-Starfive VisionFive2
+StarFive VisionFive2
 ====================
 
 The VisionFive2 is a low-cost RISC-V 64-bit based platform, powered by a
-Starfive JH7110 processor.
+StarFive JH7110 processor.
 
 https://doc-en.rvspace.org/Doc_Center/visionfive_2.html
 
@@ -24,33 +24,36 @@ If you have a booting device use u-boot and tftp:
 
   # tftpboot 0x82000000 spi-nor.img
   # sf probe
-  # sf update 0x82000000 0x0 {filesize}
+  # sf update 0x82000000 0x0 ${filesize}
 
-Otherwise, follow the recovery instruction:
+Otherwise, follow the recovery instructions:
 
 https://doc-en.rvspace.org/VisionFive2/Quick_Start_Guide/VisionFive2_SDK_QSG/recovering_bootloader%20-%20vf2.html
 
 How to write the SD card
 ========================
 
-Copy the bootable "sdcard.img" onto an SD card with "dd":
+Write "sdcard.img" onto an SD card with "dd":
 
-  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX bs=1M conv=fsync
 
 Preparing the board
 ===================
 
 Connect a TTL UART cable to pin 6 (GND), 8 (TX) and 10 (RX).
 
-Use the correct mode for booting:
-- SD card RGPIO_0=1, GRPIO_1=0
-- SPI NOR flash RGPIO_0=1, GRPIO_1=1
-
-Note that Buildroot puts the bootloader both in SPI NOR and on the SD card,
-so after flashing as instructed above, either boot mode should work.
+Select SPI NOR flash boot mode:
+- RGPIO_0=0, RGPIO_1=0
 
 https://doc-en.rvspace.org/VisionFive2/Quick_Start_Guide/VisionFive2_SDK_QSG/boot_mode_settings.html
 
 Insert your SD card.
 
 Power-up the board using an USB-C cable.
+
+Note that starting with U-Boot v2025.10, booting U-Boot directly from an
+SD card is no longer supported on this board. In this configuration, the
+bootloader is loaded from SPI NOR flash, while the SD card contains the
+Linux kernel, device trees and root filesystem.
+
+https://docs.u-boot.org/en/stable/board/starfive/visionfive2.html#zero-stage-bootloader
diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index 8223e6faa1..3e30c0649c 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -1,5 +1,5 @@
 BR2_riscv=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_GLOBAL_PATCH_DIR="board/visionfive2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -7,7 +7,7 @@ BR2_ROOTFS_OVERLAY="board/visionfive2/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/visionfive2/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.24"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.51"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/visionfive2/linux_defconfig"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -19,14 +19,14 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.8.1"
 BR2_TARGET_OPENSBI_PLAT="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES="FW_TEXT_START=0x40000000 FW_OPTIONS=0"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="starfive_visionfive2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y

-- 
2.55.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
