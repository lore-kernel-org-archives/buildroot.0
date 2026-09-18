Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AAFC982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 17:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F50181334;
	Fri, 18 Sep 2026 17:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hD1o0aiYiewd; Fri, 18 Sep 2026 17:16:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A91F381335
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789751810;
	b=UyGqw7E2obFQ5P+4ehK6uEV6KXZimQf9PlCmtp1O5BLDZnTzFZjj6ReWee4FCDj36wAT
	 ft6T/v1qTFhagQIPZooEzhL6FsearJJc0em2qyvNo/ioKD6N6oMLN92+26IjcMufdE4O5
	 /wsHk5Sg8RnM4ZkmrmT/zDGYaOaH1+PCa6Wgxt6M8hVnzqaG5jcKRjBr8lbDA4Pv6zjQ/
	 Pxo+Nd+Z1P4nr87C5RAECgUHQayBVD1xara99xfLuba0XgJN9RFjGBzorl46673jJV+la
	 q6LuoAECEBVgKlVZp+yqZ8ouSNrx0MawbZ5VLcpPR43ZTsb/Xn7vKEP7uNX4Ws37l1w==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789751810;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 X-Change-ID:X-ClientProxiedBy:X-Microsoft-Original-Message-ID:
	 MIME-Version:X-MS-Exchange-MessageSentRepresentingType:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
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
	bh=wMiaQXWxyQzhTwCDLRqbzSXmN3Ssh+Vr8zKRs7v46Kw=;
	b=Yie3WJXrv//1PW/4oxRfoD4axRKtL51r0bxy8ap6FIpFeJw/wM7RKXdjQi23Qhoq+ZFP
	 AUbEpv3qmI3YXafOhykSA84HT+zVf0KDKRCiA+GHkeereee/zb6Zq3IOTRO35HjS3vg1R
	 FsQrqjli0kVlVb4Hnp/N7n+GXR9wnjL4KkUwWZ/J2BT26gG2y+MhJJznAY1NuRRdE/2oL
	 DfF9pTbsqpbhuAuf3Dhm3XHB7mL7js54g0WxAb/MM4xQZXLynKlOMRT2Udx1KnsvyUqiJ
	 Z/rvoM/gz3VpL1OrxXQcBohbqMC0Rl8JyFuMiCDkVwMbDiWiofgFii9hF7L4Eb6DpzA==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789751810;
	bh=wMiaQXWxyQzhTwCDLRqbzSXmN3Ssh+Vr8zKRs7v46Kw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SgCpOodku/YXTCSKDJ5X7nOuz+I7VEn0uB7eE3uvNxrzIqbcGniPNEJLZFvcKB25C
	 2z2bjEBY9/ujHkOIOGLSkliLRbktrZa/q0o0SVTtbeH5ZCk03u8/Q6QjHbnecJ44lv
	 nm3GQfPtZwlYoYEDl/juh4ti/kR9CMXVq42l8dwRHXl/2thyHD2ngg+xacVHqvu6CA
	 rbTXrf4cRNoARvMKPfx+LEVy3NqqbShtjuaeUP09xxcyS0ILZwnCHc44WnavIi19up
	 7pYoU8XLCXXKE/jGwZGVbfX/QGsYUMh8DLGZJbZaJk6n4CfIN2eobZ2w5LDM3U/JF4
	 FRuVfFTs78eQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A91F381335;
	Fri, 18 Sep 2026 17:16:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12F1A237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC96640C89
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id awzZ_KTTTd3A for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 17:16:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BBAB240C01
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789751809;
 b=nw3CEfX9P6C8G6AFyyUf5cBLciy0z/miphX0xPS97U/NLDcQyvEze1+mOqq6EG0Gw2zk
 WcBLQpmbLAC7gw6w2l/QpC11iZEs24nzC6UR4v+B7ZxGkaWhJp7TsCNo33cow1227fJmh
 MBYvol9/lGv0zxxjulvzM9p6VdN+Mrf7dXWePaC740N+xW3s+tiCapHyfdqWMOaMVK/su
 //tu7XfNkqjqLhncXsc69wiQPkSkyfYMHH/t/sTpGlyEZ6Kg48fqIr1Fl+EJQIIOXV8LI
 wnjSuyiNJj7dl8x59palc8ouOE5W65d1O06iq01m/eD3IEbHhh5crp9EI3eRq6CMjZA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789751809;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:Content-Type:X-Change-ID:
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
 bh=HDOgQkBsqdZuH0S7/y+4q1xFjS7wfjNdYoNahcL3+jU=;
 b=DoBiZYkABD2D/1El3ImH5kfWqeayMWOO0I4UDs51uBk81tiBQ5MUhi7E0jyh0kZRE/7v
 wZW6pgFnSqZObqcXx3WO9szFzq8Uc/mHn5qGBTkteDeKU19dSQjYsnprWOSicJyLjdUM3
 MAAI7F+Uik/FfxartoSZWu5r7Jj0mn3/aLV3yNRs51z98P2hH7p4Yvh9Sk9X+87WsuMOH
 OijULSSwmB9K8DP/r9dcEL0tuYWUiYCTuySZyjz4WbYJs3civ2UK0Ls1cgLeHJHBJmEnW
 +vE3EvxveouCjftQiKyiPffJqljqqwaBcou9Wc1y/YfLm21DiPdL3Gj6jxgpi8pjKPQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org;
 dmarc=pass header.from=outlook.com; 
 dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b="lQ/98wMs"; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:d40d::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40d::;
 helo=sy8pr01cu002.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=lQ/98wMs
Received: from SY8PR01CU002.outbound.protection.outlook.com
 (mail-australiaeastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBAB240C01
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:16:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKpJimpEzl/lpKuyJUnFJJf6cn1juSOMHKlr37qdEUXy7gf4w4+jP1765c16rmzSy1witrGENA+PNJUfuYjg3PKfuKnGCJk4kBBHL7Syq+nbgiQcmcyqC+WndI8GRBk83O/tGh1EH12qlPSPY2I84WDGELqbokArFNAEOlhB5agOWmnlZCeMGaH17PjEwkxhoqS0+g/Cfw5qRRtImXDXFna3cVautn5sseYtTThWBkGVvVmU7Y3t4cZEXq3/dogD5yOy58Apkb0+p0EnRgQduDQFFVAZ079V/YluNm+4hojF+qC+59AgbNbaJSWL/nXHYFDXuGsOX/98QAwzVGhOsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDOgQkBsqdZuH0S7/y+4q1xFjS7wfjNdYoNahcL3+jU=;
 b=RJvbmOEH4nrRQaJtw7oFYnqsH8FKjFGMOIRcjmVG+jjHoNgyzBV3RuJGB8RYK/hRjEs2aOBqxO5WGWhR22IcItZBMkmZ7fUGumeDl+hISx9m1u63zjs2CtTVOAMaqQx77oq7Y9Bj4sMLvHY9E1eJ539Ak6LIxfDvLrg/sFIi3Yhw5ALJD3xh4HvHSQMemriWQxttauLUSfG6gDDERmymYuhIyu6JSu8GdDQJP2QRqPmefuC7TdsEKGA6pnCfanDlwXQ0pBHM0JSfBLnoKkNTfGI1fnuESGInbrKfhjQh47v6igp8lt7+pRzoa6VRGJBsGUvyQ/SaO8Sl+qzH5+WTCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDOgQkBsqdZuH0S7/y+4q1xFjS7wfjNdYoNahcL3+jU=;
 b=lQ/98wMsIz9vaJbJ0i2EqrO3FCkgoJ3FqY3TbOoAkplhyXVF1VNFVRyqiCbYKtwDYU1aTKzQX/D4N5wwDg3ivTs5xd87e6kjtJf/G+sc/ngcgIsIo2wNukuHWX3dhqtaQs2SikAuKaKGtleDrLcZ9SfQR5VORdPnfA9/AXegYVFZpl31k5hzYdOgSDLl2nVOT56BkoMhMnI/otGzs0Bp0c+4nCrddTeiKzAgZkba+PvDt2e7k4jyxQroUaXP7/paZpjthJIqSGxs2UUBblOg89pNSAPmaDf1Ldj/oJChQG/jitu97RbTvYZ0ctRLfbGPYIZwuO3ST47G4pXkblQ2ZA==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY7P300MB0607.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:28b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.14; Fri, 18 Sep 2026 17:16:36 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 17:16:36 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 19 Sep 2026 01:15:17 +0800
Message-ID: <SY8P300MB00419E6035B2DD54F72006D3B5872@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
X-Change-ID: 20260912-bump-visonfive2-78f9069f9a69
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20260919-bump-visonfive2-v1-0-bcb309feb582@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY7P300MB0607:EE_
X-MS-Office365-Filtering-Correlation-Id: 292b2271-f2fd-4787-2572-08df15a89842
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|19110799012|8060799015|24021099003|4140399003|25010399006|5072599009|15080799012|23021999003|6090799003|5062599005|40105399003|52005399003|10035399007|2607281247196008|3412199025|440099028|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnJmMzBZeXdHWjVPcngxaE8rRjM1Z3RuQmlFZ0U3OWVPdjF6aU5CaGc3UTVD?=
 =?utf-8?B?Q0JWSWZsd2lZZnhMMWpablIyTlU5ZGJyc0ViY2ZCRC85Uis1Skx0aGJXVjhB?=
 =?utf-8?B?bWo5VXM1dG5wTHkwTzIwNTRRZ1hrUk84RTlFRDJ4N1MzZVFoRTZlR215RFBU?=
 =?utf-8?B?Sm1CQ1ZRY2FnYUF3R0ZqZkI5S3RXZXh4MkJLTjNuaVlLZFlJaGtUWVpHd2ha?=
 =?utf-8?B?UlZsNjB4Qm00bGs0cW9xekZpcmZiM29teXFjR244Y3k0ckdDd3o4NENuSVk4?=
 =?utf-8?B?ekEyMDczZ3NlMEhsYzBhZ0xSUXlzWjl1YjI2WmgzZ09heCtmS24zWktXayt0?=
 =?utf-8?B?U0pOWjNKMFI1KzNyRTI2MG83SUZKazFkQ0I4NHNpdEdEZVMvaDJGaUkyTDdn?=
 =?utf-8?B?RXBlL0RlZklMaDM5dXVTcEVwSlQ0TkdId1BtbnIwR3p0YWEybVN1UkMrcW5a?=
 =?utf-8?B?NGNFRFp4SHVWOHNlb1FKTm8veURYdUNDRXNZRm1BZDBSc0RKWHJpMXdNWG0w?=
 =?utf-8?B?Q1k1cldLeS9HUDZqeE80UnY4dTlrRGJzWkpjSEM2MTJQL0Jpd21IN0RpVzRE?=
 =?utf-8?B?cHUvbnoyNlFqOURoSjNsbjdQRkxtSGxPenFPZ2NOeEhBcXZzMkZmdE83NTVo?=
 =?utf-8?B?dU5NOWZIdTR6dmFVYk5maUtnR0JZZ3UzTERqTXBXa2tWc0VBUVNwbm91MldL?=
 =?utf-8?B?MFN5WFQ1S2phKzhFSkRiald4bHB0THhvS0kxamFwRTdSQktoYkJ1OWdCY3lI?=
 =?utf-8?B?TEcrT3FWVVBQRGxobEVya3RqQlRUMVJLVEZlOXoxemFvb2g5QXhGSENSQ1lp?=
 =?utf-8?B?SXBscEdEVVl6V3p1cWM4Tjh2cGxIOGllMmdQd05SRExSeVZFblFHMHJqbHYv?=
 =?utf-8?B?ZWx0MzZQSlI0S1pSUDJTMkY3M2pFUGY4OVFkcVMyU0ZFZ1d2VWRxY3M1VjRs?=
 =?utf-8?B?UnhjVE1GUXoya3hQaUc4N09xbmdJU0hjempuL3BaS0pXbVpZZC8yaGZ2dTIw?=
 =?utf-8?B?ZXc4SFN1WmUvRHhVS0cwdFUxaFc3WlROckNKaC9oMnZBTEswSWRhaWdlWVZ5?=
 =?utf-8?B?Z1J3aGhIMmNJOFpXTWxpeW9CL0E0K0lUVWZXdTltc2VzTzRKODJCa0hvVzd5?=
 =?utf-8?B?cnNDZ1BsNkt0QVN5blJnelB0bWVCNmw1cVg3VzVkSnIrcWN1Z21YQTVNRGRW?=
 =?utf-8?B?d1J6VU5pNzNGbkQ2WlU0dU9la3U0akgrbEwxd3VlbFlmdWQ3MUdPaHlxRGZM?=
 =?utf-8?B?NzduL2JoM2h0YWN3TkIzT1RSTXJzaUNSZG1CVEJTYmxSMm1GOGhnWWFYL0RR?=
 =?utf-8?Q?gYNICALcHkkxBJmUps+N7BcRrAh6llablw?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0hCVkpNZ0haUzljb1VoT1FTRHFBSjlrbGR4K2REZi91RVJhRmVQTTF2UmRM?=
 =?utf-8?B?NzZOMmNEaHNuWUQyNzhTUHgxK0ZUbkdzUWlva3ViMk9abFdLNUx6RE1EdytH?=
 =?utf-8?B?QXJmTUVldHhSbFFLdHlXTW85eFlOek1YbXhMWVBLUlpDbk9TN3A4VHo5T3Rs?=
 =?utf-8?B?dWNscWdpclRCYkllSzZXVUJva1hRbG1aRlhvaU9jL2U3elc3NmxxVUlwL2N6?=
 =?utf-8?B?alVJbWlCOHYwSlFQWVZUSUUvd2YrQkt6SmhMYkNRNFR6bVVDTVFMSUllMFNv?=
 =?utf-8?B?KzRFRUZDdC83SUd4VmpvUXZUM1F4UkVjcHNzRzV0VDc2dDZia0xEZzB0dytp?=
 =?utf-8?B?U0pWOGtEN08rOTBVWVNmS0Rmd1JIYkxsb24ya3lBemlYUzNKNm1ZZmIxK3hD?=
 =?utf-8?B?QTViMlBNSFJvWDVWeTlsOFFXVU83M1g2c2xHU0lxMG5EN1ZRbFRYTWY2OTRs?=
 =?utf-8?B?ejdFUnZlaUFEYlBtQ1FlNWRET00wNzljV05iYmZ2U200MmVYbVFMNUFocUZ6?=
 =?utf-8?B?K2VHUVdOZVRGSEs0T1dIaVV0R3BTSndlNE1lVVRNSjhqajVMSTRIMFJ6U3dy?=
 =?utf-8?B?SFZ0UEVkWWdBRjhiek1DU0haV1RVemY0c0pMYmZVM2NCODJjME1jcVErOHFt?=
 =?utf-8?B?NHhjcUdxajA2WmlTcnBlWURCVnF2Ly9lZ1RUTUhORTh0dzZrZlB5eDlUNDly?=
 =?utf-8?B?WjgxRDBLbXpsQ2VYcEpYc2JNRUF4bVdzZUhGTEUrVDhZZVcvVlV1YVdqMi85?=
 =?utf-8?B?RkZMZXk3UTFXTzhreWcwSzJkY1BJRWxWQzl6V2pFN3J6TEw4NjZkMm1yeko4?=
 =?utf-8?B?MXUzQ3J1dSt3Y2pzdVpSK1pvSDN3bUZOckJlQmJtUmhKR2IySzc4aURSb3Nr?=
 =?utf-8?B?MU8xVHdlc1J4ZjErSnJnUkJCSHZZM05GQW9hcnpxd0crUHg0ajliL2w3bEg4?=
 =?utf-8?B?OGhuelBVMlJ6cUhRWi8vUXJITHNuZXJVTXdxczhWU00zYU5Wc0hwazFyUDFZ?=
 =?utf-8?B?d1g1cE1PZm5iSk9oeFZIQ0wyOGdkRGlYT3Z2NUR5RmRha2xMVVdDc1F2ODFB?=
 =?utf-8?B?NmRkZnMvR29xQmYycEt4U1lWTW4yR2JTekowcmdTVkM1aG9wL3B5ZGJyMDNK?=
 =?utf-8?B?QzJ3Q2NiODZnZytDOS84cHVTNHRBS3VtRzQ3SUtONUhFQnVIK2daYlVsNktF?=
 =?utf-8?B?elBqRWFaS1RzR1ltd0I0Tm5hZmtjZGdOZU1reUwxVXZ2Z3lFUmNsOHdGUUN0?=
 =?utf-8?B?dmJ5N0tiK3JlMTQvMk9WY1VqNEs4QmRzelBEb1FWd2ZDS05PVTUrTVlhOFdX?=
 =?utf-8?B?MG51WllHeTc5N2tDSTJpTEljN2hJaXZxeHRMMDFvbzl4UXR0REh5cGVINkRz?=
 =?utf-8?B?ekVraHBpQVdRNGIvRHZHN0xXYnUzV0hGWVhtbXE1WS9BUHk4UVZxZnR4bFRP?=
 =?utf-8?B?eFdueWtXK2Q3NStHOUxLL1RjREJzVGtaUEZCWHVsMkYvaUdvUUlSUVJBY0JV?=
 =?utf-8?B?K0tqc2E1VHlPbE44ejRKci9OM1p2d3BoZmllQWJ2cVpEdUN2RmNoc05CQS9q?=
 =?utf-8?B?WFU1cGJHWXZnUHBxdmMxTlFrZGRLZ0hzQVI2cjVqSmlrZlVFSHpxSTNDTEwy?=
 =?utf-8?B?RjIwcmVHOURMUVZUbjlqRUF6bWhuaXZUWlB4a1Z3a2Zxa3BRQnRSZ0JiblZS?=
 =?utf-8?B?M3ZjRmpRazViLzNVeVVVUEhCc0U2by85NVBDQ0RqYUYwOWt4ZmV0MFVnTkxV?=
 =?utf-8?B?YmhWUnNXbjFYSjVKZVc4YW1uanp1MkdoWWRFSjNNSDlCU2pHSExEL0lPSGpQ?=
 =?utf-8?B?bCtRU2I4UE1JanVBQ1U5WEh5N2Jqb1FFREV2Sy9OZFhXeDdJd1ZiT0czeG9Y?=
 =?utf-8?Q?Y3GxHiagZnGLM?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 292b2271-f2fd-4787-2572-08df15a89842
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 17:16:36.6644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB0607
Subject: [Buildroot] [PATCH 0/4] board/visionfive2: fix boot issue and bump
 Linux/U-Boot/OpenSBI versions
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

Hello all,

This series fixes a boot issue on the StarFive VisionFive 2 and bumps
the Linux, U-Boot, and OpenSBI versions.

The main changes in this series:

- Add the missing 'rootwait' parameter to prevent kernel panics caused
  by asynchronous MMC cards detection.
- Remove the SPL and U-Boot partitions from the SD card image, following
  the deprecation of SD card boot mode in U-Boot since v2025.10.
- Add support for VisionFive 2 v1.2a by enabling U-Boot to dynamically
  decide which FDT to load.

I have tested this series on a VisionFive 2 v1.2a board, and the system
boots successfully [1].

[1] https://gist.github.com/tfx2001/ff21435d8d535160662e13f3da6b7b3f

---
Fengwei Tan (4):
      board/visionfive2: add rootwait to kernel command line
      board/visionfive2: remove non-upstream Linux config options
      configs/visionfive2: bump Linux to 6.18.51, U-Boot to 2026.07, and OpenSBI to 1.8.1
      board/visionfive2, configs/visionfive2: support version 1.2a board

 board/visionfive2/genimage.cfg                     | 10 -------
 board/visionfive2/linux_defconfig                  | 33 +++-------------------
 .../overlay/boot/extlinux/extlinux.conf            |  4 +--
 board/visionfive2/patches/linux/linux.hash         |  2 +-
 board/visionfive2/patches/opensbi/opensbi.hash     |  2 +-
 board/visionfive2/patches/uboot/uboot.hash         |  2 +-
 board/visionfive2/readme.txt                       | 27 ++++++++++--------
 configs/visionfive2_defconfig                      | 11 ++++----
 8 files changed, 30 insertions(+), 61 deletions(-)
---
base-commit: 098be4f99a33b9ca67e2edfc92c517a66097fb2a
change-id: 20260912-bump-visonfive2-78f9069f9a69

Best regards,
--  
Fengwei Tan <tfx2001@outlook.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
