Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D29AC982CC
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 10:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9F3B81236;
	Sat, 19 Sep 2026 10:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqkcU4nqS3AO; Sat, 19 Sep 2026 10:30:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AEDCF81235
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789813807;
	b=OF0pRqdbtBIRcP5B+3YaGNWNUIBDpeNDsgEpDjTOIRudHgJ8432T8ynp/kxffnlioJ7w
	 kZEBTsp3t3X6UPsR5W6hcTmUBsBwuI5wgqPYYlxYnkWOm5uUJxDPPEht7cUd8ER5sJRYC
	 MfzzxlfFNF+TVlxb5RSbkvnCbiuPgVMENzvdzF9sts/T7nKquwZpM8+Wafst9fvy4eIF4
	 EjhWAo4tGzCjdmtZNoOANnbiFqJuiAO+hWYnYircKGSFvBOPk6TsKSVEBQSSzIA2WKgHa
	 8Rg8f370gziDjyIuKjuJho/DokBP9c7ey6SfBclOiQPnGRcoy7Qk1q7+fOGCyMeMzMw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789813807;
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
	bh=ZYNaEKsfE0wTwVRkwRApYA947irntp/mz3D2AXd9k9k=;
	b=JJdoTQ03SIWyXTcgTKFJPWO7WFqAwa+wurxz0wOYUBR3BkxnAywEM61HcSL0O1TRcMH7
	 rMRve13GZgkS4opdvuZEUFRysO4tFYd04e8DN+Epoo3NWWwHetk4+daXpbsMPMrm2gy8r
	 gi1lJu3e+qvQb/Tdg2G6PkQMNxRwwP0/gyWRZxM+71DMUE5MZKQGRzkgkL8YmNT5snmse
	 vLYzjXU3dwXFt3gmcVjUvYN42lTxG22949O+Sy4nRjv98PNojjpnE4JiwO317ZOwvItt5
	 55KAS8djyTOKsh8O9D7mHVHTNf3o+JUbKpu+v0QZYSN2ET+ajPC8iaomegXDttISnjA==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; dmarc=pass header.from=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=lT0+wcJn;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789813807;
	bh=ZYNaEKsfE0wTwVRkwRApYA947irntp/mz3D2AXd9k9k=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TTgCZzObLE2AWRswM/gpulO49monDE0WUzay4wVEBPKBcotLjxpaFs5mOegBwjWUn
	 toUIGifpN8/nUHQjir2kXSrjmRhHl7Xat1N65Nr8rFVUlAUtZ/XnIv9Df7Levu4UoY
	 AJ/JP5rah5gyBbTScXwpjzqL8hngvv9fzjpNTKugNyxM0xhdUpJyngTx33S+TldvGV
	 axaeocZoU/GelheEV4w0wfOT/NZLSiVMz3cJ78ZMNX6N4VWZRzFi7LXxmhC/3kvpSM
	 fA8EUReABx7HG4DyBPnn/8HHRtr9UFKKUCDsyJzBRIJhS8gix8IYz6eLISHi5ycbt+
	 +D7B+1UiD42zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEDCF81235;
	Sat, 19 Sep 2026 10:30:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 496451F07
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 10:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EE52811E2
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 10:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zkOsT8dicJQZ for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 10:30:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 63CE881215
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789813803;
 b=JEZ0kvRV/SC9B9KvGKEByxlaw1PjV6iIEihIjMaZQpnnchy2d1JSmsSYh9hMfKFda6B9
 kSyzHpngRqcc72uim5R5+Z0ecdqs+2JDhL7pW3Xn+zYDv0SaKq2gh/Shlisp5kWvInoF9
 Dr5BEUDnl5INM2Ck7VlXC/l0jm8CwezO+QMfpPQmKap9tr/A838LKSqW0YSYE1V/CdTfK
 rYuqQaaeYGyIeILtMYiES9QIhtCfvMpq2YKzOyM3GVcVd807AYXIA2FeTScZZyWxbXXh+
 LBWG35olnZdgaot4NnE8kEvkQIrl8jrbggZyqoYny2EJhNIi2zQK6aGLt+CkyrQRG+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789813803;
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
 bh=Mj0EKfhZYwZWdTZbrUWMhLZkZJnqAu9KOEcEhKMi8dA=;
 b=aISDXmp2b43RH8MfNscjv3/Gp2FQuj25oM6+SszHtQvNdFyIUp5sURUOVo35hzlroq+G
 DLiRdBa8eLUYBmZtr4hi+ONVJ8QzN9UK/8eBifeVBn8TgJxoD2T8AsJHhYk0kVf2fa8FY
 TiYaprVZJjrjrX2P2CM+0grXiX5ww2KDisjeQjfE+MAIjmk3UuT0bI1m3DWVJdQ4WxPHO
 4tBO6GUbWk8pHgXl3osH9A+oKK93Xe0ZVvQQXdwwvaV4JxifFuZj7R1K6Di2V8OZjyO71
 IjMxfJ0hsy9jik6145xYk76mGMlR9xdN6I5nak8rBCmAiLuVq4LseK7KSw6Dy2C7Mzg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=outlook.com; 
 dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=lT0+wcJn; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:d40d::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40d::;
 helo=sy8pr01cu002.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=lT0+wcJn
Received: from SY8PR01CU002.outbound.protection.outlook.com
 (mail-australiaeastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63CE881215
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 10:30:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PP39ovV4urhmF4fvNH1SpfNxgmC0DO2GSrpF0bRWRzVR1fzR5+qEx/0tXlMkRGql3Kk1qxuHt04dI1Z5rIAzm5ahynetBMKHd12aL7N5S4cigj6TUINZf+kmdcBjT1Ce+qiiOPtLcu4xM9dG9CcnJmPgJk/CWxSanLd6eYFOYNG4RVJWEuyFtI2aAah6sGCNGcGAmZRHQ8LsLjV3WWs95sekn8/k9knlmbTiUrtRc2fXaGEWtu1PF7vd3UAEU/onGemVrrFDG1eYyKxWHeLgxvfk+g4ibjMv7WbLHOGUwseTM4V/tFee5Lwhcqgp4hBc0Tsg3W77iT0bZPakqVoMEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mj0EKfhZYwZWdTZbrUWMhLZkZJnqAu9KOEcEhKMi8dA=;
 b=FwRYgRhFvHlRB5rK4gE+XHXHKb7Rp4BKg2rbBiShfwB3WaOY0+f0PKZk7GEC5oB4NeG5GzOgxs4f8d2IUU44sIS4Eo4zTP/Hdr/PQluZQdGY7hnywRzQ6nay3gQFP55UlshorvFq2HE9UCLeZUY3M8mkLtB2gKKirpSc3qQM8rOp2TbbYtDoooV5ZZNlaiMij1V7egixj0lQLGKcTNALxc7wAKzbjX3HmbdpzdtxGDyBcd9XTLZWski2t+Nws3Ehn6QvJSxlkMkB++D7RjgjQGqDmTk8TRDPtdlVbOOuCUciQGSUVqi0aDbcv2Zpv3SGpgZkR7ds+EcE8xmMaSznAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mj0EKfhZYwZWdTZbrUWMhLZkZJnqAu9KOEcEhKMi8dA=;
 b=lT0+wcJnTl/NacCuxjK500wCdvO9qWKZ3TVXGVB71lht6d+N+PMTMjUOIyun4BLf1tKtKOfmLG89D0ukV4bmlAgswjl1S/jk1nQnaHJcc5gmEjsA42SPUD28ZwfV8LBRR6FTZRNIXKTWwDIHbhK3VKq68NAg9ETlmFSozo/jp+TpTkRpPO0a6sLKJR4TmKPOCXDo7+QGMwoWOjQIBL/Z4ijwln3n/m/teWJaGmn0dnXtdl6y40iNqmhXQ0EJKAb6eMrfWz26osHSpS37gogXfniZsNnFp39ZlBvk+glBUy1OG3lk7cRlxtf0Bd2CFdT7SHwaieZdRdXwYKpSsv1ngA==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY2PPFF56D0327D.AUSP300.PROD.OUTLOOK.COM (2603:10c6:18::3b7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.14; Sat, 19 Sep 2026 10:29:55 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0428.014; Sat, 19 Sep 2026
 10:29:55 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 19 Sep 2026 18:29:04 +0800
Message-ID: <SY8P300MB0041C2B49EAA9164B8C4DFBFB5862@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <SY8P300MB0041D841DA8295DC7F4B2510B5862@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB0041D841DA8295DC7F4B2510B5862@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-ClientProxiedBy: SI3PR03CA0006.apcprd03.prod.outlook.com
 (2603:1096:4:297::8) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20260919-bump-visonfive2-v2-4-c6c5ffb1a452@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY2PPFF56D0327D:EE_
X-MS-Office365-Filtering-Correlation-Id: bfb1cf7f-b88e-4891-16d3-08df1638f2a4
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|5072599009|6090799003|25010399006|19110799012|8060799015|41001999006|24021099003|23021999003|15080799012|51005399006|3412199025|440099028|26104999009|40105399003|2607281247196008|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZURIOXVKTzhmVllyQ3J3SkRIanJndW9iYXFVUXQxL0JZMjJaaVR1UTNWVkNE?=
 =?utf-8?B?dm5TcEVseEZGZ2t6ZjZqdVJjLytnWVFlWlFYbW1uTVhjd240VFFMMGZxRlAv?=
 =?utf-8?B?bGtLTkhhNkhWU2pXYWtsOFZIWk1QSmtQL0szdWlUVjhwVTBHVGNHUTNKaXZu?=
 =?utf-8?B?bnpiYUwrK2ZRdmVVZmREMnJzNXJ5K1BGRGtTRDd3K1lkMmM0Z3NaK0dwNTZZ?=
 =?utf-8?B?c094eHErN0xZaXBnVjFFZTJYM1ZtYzM1VWRCNzkvSzRIZnVNMFV6elJQeGFi?=
 =?utf-8?B?YzRtQzZOM0RHT2FUUHBvQnJPaGlDVVJ6VWdPcnRvQlY4Z1krK2pwMml0a1R1?=
 =?utf-8?B?ellxYXFwTlpJM2MxYkNod3huNlB4Q3VpZVN2Nk4yc0NGWGlXMW5HSFNyNGZj?=
 =?utf-8?B?dUhYd2RRc3RlTXBXTkZSQU5NaGZhNlFqWVhEb2hRWkJPYzJ6TXhscXZRU1p6?=
 =?utf-8?B?dyt0MlNEclIxdHNZcWdPUzV3aWloSE01RkEzLzNlOXNBU3ZEcjJqSXJ2ZUlH?=
 =?utf-8?B?b1NlbEFubThLUkF5dGxhMWs5WnVSSzh5dmFpOGlPU01RZ2xTWnhjSWNuMEhK?=
 =?utf-8?B?bzFmNXVyTXExUDhWTEZVd1dMbjhYS1pOalgwK2hVMEpLNTVydE5vUUxNTGNW?=
 =?utf-8?B?djlEUDRXLzlYcXJIclJQTy9KR3JPSTZiSm5KZlZTK2dZZk1DNmkwZ2RnWUJV?=
 =?utf-8?B?dXVlZG5nUUtjNFhGbXVZeDFuQVZacEZ5bEdXcmJVUmoxTWhEaTg3NWZFb1Ja?=
 =?utf-8?B?SjhZVXdRUjNPbUVVWWtFaXBRUTI1bW5VZ2FpbTFYSkRpNGdyTnJocFJCRHJE?=
 =?utf-8?B?cHMzaUtWM0JWR3lxVFlrRDhBYUpPYUt5MXg1aWtKb293T3lqb3ZzandHU3hj?=
 =?utf-8?B?WjJ4LzhscUl4d2JQcnNLbTVkY0hMcHQ3VVc5WmJCVzNsUzJiMXlsbC9VM3NC?=
 =?utf-8?B?bkd3UVZQaVQwMEk2NXppVy83MUVIcDNYOCs5Y1FrOE9peWkxRVZIYlkweW9r?=
 =?utf-8?B?OHArQjcrdDBvb2kxOVF6WEtVWXRrWk9LRWsvYThEZVBieThMdTNxSW9KaVAr?=
 =?utf-8?B?V2NJZGhIZHArS0RPOTc1L0RhRnV2d2c5ZDY4bW83V0Y5aHhQNzh3RTI2dHY0?=
 =?utf-8?B?OVZTL3N3RzVYbEszbVJqNGFydGVXempKcEhjb0dBdDhCTkRRaGUvZTFEaWNC?=
 =?utf-8?B?UVBDdjdOeVNRakR4cXBNYzVrOGk4MTlLTklCQmdYQ2RxNEcvL21zR3VpeTFl?=
 =?utf-8?B?d1NOazdBTFE2N2hhaDZKZVdhV2gwWHpEK256MENIZWpmaW9hbTBnNU1jNW11?=
 =?utf-8?B?UWoyTWdNbHp1WTQzZmk1ZDEwWFNEK0dHUy9mQ1hEeUxlc2dVY29sY1dnV0ha?=
 =?utf-8?B?N3RvOWVZR3V6SWc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXJZOHIxbVlWRzlXL1IvSWJCcU5YYncrQmFYUEtYSUdKUXlDU0V5aS8wdVc4?=
 =?utf-8?B?Wm9EUkRHNCsyVlNQQkV6MForTWRtTitvbnBwT0ZuUTh5YUplMmcrOU9IRDRt?=
 =?utf-8?B?cnhwOUJ2a2R3L25WUVR3d1o2K3BpeTBBN1pvWjgrclVoaEcwY3AwSjEzbFVl?=
 =?utf-8?B?SklWMEEzRmRtYmMxTVNEYUZZbWhiTUt6bE12bHFIaXZVaWNEbnRsazFZQnZk?=
 =?utf-8?B?Q2xHdXVKbXRNVGN4ejIyRC90YjJPa25NeWdEdUc3cUVHUTNodlYwWUNzd1U2?=
 =?utf-8?B?TDVhbEpaMmRVRkp6K2kvbUlvOHdzckJZSWFldEI2OUxXK1NyRFFWRlk2ZVo5?=
 =?utf-8?B?ckhkSEZYRHNjT1JXRVBaRmVlWjZhdU9xNzJzUFpFaHR4Y1JOQ2VxazR1Z3c2?=
 =?utf-8?B?N0pwa3krUXI5ejFHUFB2eWR4ZUxPcjRtNVpSMndmM0xvV01TK2pzdk1yTVc3?=
 =?utf-8?B?YmkxVjA5eDlDcmhPTUF6akt5MW9RbWs5a0FHZ2d4THR6L3pFZkE2cGpPUjVT?=
 =?utf-8?B?b2U0WU0zMXYxejVBTTdZWUJTNFN6cWpyRml4UWVpcndIZ1N0czBBcUdWS3d0?=
 =?utf-8?B?SmFya2hsUVZjeitRT1NDVThjWHJaUWlCSmFwUm9lMWFVWWdrVmVUUjFLaFgy?=
 =?utf-8?B?U1FEOWN5bjNwbUgxanl1cmIvZW5OK1RoMXpkbHlDZVUvc0hoVkdvMTVSSktQ?=
 =?utf-8?B?WHpEWXovYTRMa2NmMjlId3k5clJ2cmNmdHA2Wlh6YnVmN2sxR1pQS0IwOWkw?=
 =?utf-8?B?Yk91RmM0SkZSbE5aNnpBOW42Q3I2UDJWcWp4engwcjc1bGpGZmFUdnJiRGRy?=
 =?utf-8?B?R0xraU1SdzRNdVl2cXpFUW1sVWM4VkhpVUc3emFoQjRLN2lzYkhjSGVtU1k0?=
 =?utf-8?B?VUxhS0JPT3I4WXVZS0xqZnFxd2VOVjIwUS9mcWhSb09DbU0yZ25oVzd6TDNE?=
 =?utf-8?B?Y0xxRDZnWHFVdWpEZXVISUx2TStXSG1sRDFRMHYwVlNEZXNpVlVUbkVQeDBp?=
 =?utf-8?B?NDA3U0tkVkV1dFhKTVp6b2VjZDlrZWRpN1Fpc1pqem42Z3Zra1Bxd0taTEE1?=
 =?utf-8?B?WHcvVXhtMVU2ZDd5SUVYdDNRbkJWdVUwY3h1c1hCdWtuNjFvL1BaZWdBSXho?=
 =?utf-8?B?NURMNllzdWJWK2xyekxDazE5VHE5YUtBaHM5QXlEVEVUSzNWMGdOeWxPMnpE?=
 =?utf-8?B?RjgyQW1BT01XekVtWmxaL0pjQ2tMOVpRd0xkSkJvY1BIa2pQbkpVV0VCRXQx?=
 =?utf-8?B?b0tIZC9ZY3FzZ3hEbWsxYXFGSW8wcnBMUjVyUFF2OUFWdE1VSUlQaHMwUTFR?=
 =?utf-8?B?TERUWDVvVklFUDV0akxYeEpDS053TTZwTmcya25VNzhjelA5Kyt1S3dXVk4w?=
 =?utf-8?B?Rk1NYk9nVlVnTVlhVnp5aXBOaFZqZXRsQ2NBaVQvMjFyNEEyZXZIemNpUXV2?=
 =?utf-8?B?cHVjWVNOZWZxek14NWl6b3QyTjhTLytuenJtZmpsQjM4ZkdXenJqaTJtMzh1?=
 =?utf-8?B?WUsydmNkUCsvblNneEtNUkRqZjh0K0lRYzlCS0hkMU9lczcyYklkL0NoWnhr?=
 =?utf-8?B?Yi95bHM0NnJHaHdHRERVQnJtQTBVYVNnalljcEp6TzZrb0Z6ZXJXblc2bjFC?=
 =?utf-8?B?N0E1YUcwRlRJT2RINGpGSFdjdmtKSE5VaWNSQnk3eGU2eHFibHI4YWtZQndY?=
 =?utf-8?B?VXJUMFd5akV6WEw1TmE1ejNPVVUzaVV3bGJqakJYb1dTTkprWkQvWDBiSUFp?=
 =?utf-8?B?K3R5dWZKWG9oK2twbnVpcjlLVFZZUjZzNFdKOUhQWHU0b2o0UXlnb3p2Qk1C?=
 =?utf-8?B?T0x0dkluWlhicDAwVW0vK0lXZjZQRzk5cEdKWjJ4KzFZNTRvUi8rdm5PNDJq?=
 =?utf-8?Q?NTmi8Fivd+adU?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb1cf7f-b88e-4891-16d3-08df1638f2a4
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 10:29:55.7990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY2PPFF56D0327D
Subject: [Buildroot] [PATCH v2 4/4] board/visionfive2,
 configs/visionfive2: add support for v1.2a board
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

There are two revisions of the VisionFive 2: v1.2a and v1.3b. The main
difference between them is that v1.2a has one Gigabit Ethernet port and
one Fast Ethernet port, while v1.3b has two Gigabit Ethernet ports.

Unless explicitly set, U-Boot automatically sets $fdtfile based on the
EEPROM product data during initialization, enabling <fdtdir>/<fdtfile>
to be loaded via extlinux.conf.

Additionally, since $fdtfile contains the directory name, preserve the
directory structure of the DTBs when copying them to the target
directory.

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
