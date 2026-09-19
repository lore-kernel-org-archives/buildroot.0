Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8D7C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 10:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E095811EC;
	Sat, 19 Sep 2026 10:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7dZrsK065KP; Sat, 19 Sep 2026 10:29:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2593A811C7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789813799;
	b=CBEY0vfEVkLaSLbUSuxhmRWvMpniCFYQcDa5wZMBR8rMnrxxFrfp+7vYNb/p0jjGKfQm
	 Nphtpz25aMHFSZkBNBjPHwRdI2KYcs/dZFgC7q7HVYpQ2NJC/yIc0kqO0tqxHjepy7hqU
	 auQkp/wwxBbQm/nMTyJK72d5mt2lehpuIzxKb+e+0PQKYzZpm33m5Vydg3YCOgWvoR2R/
	 lHqzCuss3goMSwebbcesMUVdI4GwvnzL2yDgR4zit6UEZSGJoL6K7MU0c8kk6p+zAMBPn
	 AGW/nknuW0FtUMwPVmYDyrCEw89ZDcXs/fT0ga0rPq0awGndS65fqUIQqcCoyJktXog==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789813799;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 X-Change-ID:X-ClientProxiedBy:X-Microsoft-Original-Message-ID:
	 MIME-Version:X-MS-Exchange-MessageSentRepresentingType:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
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
	bh=WG50pMQUPhroZEfYDCH1t30MGCs43jgwc0Npj2MRrZU=;
	b=Hk8OK3trHOSDUIg0e5h8YQDtafy5OXJ9uSYkeHIj6qtviyHlSfJ41i3sGvH8w1l/f42G
	 j7GgV8rZ/1KO2RXyTqYkaKuNBVgLH/Qdn9p8WPKHANRiCCKmCG48jY49YkJ7z/L1yTARO
	 0nI07wXTLl4A+MQ+dwaGrGl7EuO9O+7CrzHGCZhC2GqmmfQaBV4pK9/qqxNT6mlbB44y9
	 hW9yI6tsJRoDQs7Jidy44Q5Kc42ceMXC5aJkHXItlQZGtbiCixvtIDHCpXH5zLdarDcMn
	 sPFdg7n3hgsJj2bHqvAOm+aHfPGykfbGsMRAWtSjQUkaKwnKrMJBBYRbJeJjrZSMX7w==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; dmarc=pass header.from=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=nlrRjycY;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789813799;
	bh=WG50pMQUPhroZEfYDCH1t30MGCs43jgwc0Npj2MRrZU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H4nw1mR7qABVLPBxyUGwumT6plz08j1vxTx6R7n+siyxqw3rO1EFpxZTrGcOmez21
	 Hh37q3JB9r4XuUEs2d7We/LasNcquNmBG6g5LiyhDCwmxS6NMYdkAWhwTulmg8/YZG
	 Dh5CRmvkcdsQXPcqMuUsjH+4rnmCPiCUH5y/ZsHifLwXukG1r/TdfbLSQOdQLJQkda
	 8+4UAPRi6lEAdPbDKIbTd+E0NiV4XGcxyNmvzGOlYtvcJxhuGBQubl9fyVlx94hU7s
	 msqfZl5cjQ3vI8uOHTXrJHy+Dx8Fczq9QGemuTUj5vY+DmBsP75c+5bZMO8Q7iTOqH
	 /yWhKYC7wmX5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2593A811C7;
	Sat, 19 Sep 2026 10:29:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 72BC2422
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 10:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 584DF811C7
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 10:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7B5hz20I_wH6 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 10:29:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5024D8107D
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789813797;
 b=eM1RXnM4QV5bzdmL+IEmNeofWYHkr0rOL6ZZiN83ryEibfrE2A6PTfV3Dl/bMpbS28Cf
 Pqm6BpDwFiV6+gm/TkASVNuP/R+ejQJrzyEtCJoRVXh813aCrbT/aY5mrlR8JjBk82OPw
 g4v6tmEwgPmdLsz2P+pO+mFguSDLmBCazpRZV4rhlshejR3Cd4nsDsgoiYdUZvQx45jg3
 jPXW/TWidz3i7VEnp60scgZDukf5D3+t0ahuJAPJeNHABw4Iae1ZG23ixsuea8Xffpf78
 qiws9yHH9tfc8vAPjHxoew901CxkrftroheVDZBrBIpYdfRZ/PGJ29h/Gj6G2H7nF4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789813797;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:Content-Type:X-Change-ID:
 Content-Transfer-Encoding:X-ClientProxiedBy:
 X-Microsoft-Original-Message-ID:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
 X-Microsoft-Antispam-Message-Info:
 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
 X-MS-Exchange-CrossTenant-FromEntityHeader:
 X-MS-Exchange-CrossTenant-Id:
 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=zj7PsS2xcAzwgfqZhsyyDwEkyu2JiS8Zee87OYk2dkI=;
 b=A/PKRhcFkxP2EwewU2U1i1YVq5UeNjvI58kaDhSDGnfOwXvLMx3lz87RBOb/ommuilNx
 1To0IsX/zvkZiKINX8E/AGZnrklczp4EvtLTEl4idC01qMuVWV8XBv9vysBhMYPkg7KNS
 2c1Mtov6hN48Ya8m9IHcc3enreozjQCZFzOlmAeSu8mFcxvuuIz6ciV72YH70twe4HEKA
 oYxT15GHj9086o2KTsAdCbygiv+iWsUBxrFAMO7GWzNkfIr03+FUs1iaDwoZZEyaMcAM/
 fL11YiQfHyr85zxXBgaJ46L/x1AJI8Bk5uTHzpQNsNkyCtf8y5QG4kf6Cxrs7uARTrA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=outlook.com; 
 dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=nlrRjycY; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:d40d::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40d::;
 helo=sy8pr01cu002.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=nlrRjycY
Received: from SY8PR01CU002.outbound.protection.outlook.com
 (mail-australiaeastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5024D8107D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 10:29:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIJ074g3G8ZjhzJZIGDNqOr6r2gHe18Jy8E4WrzqAeJs4Xo5zSZbySYU8+tiuEOf1uy41vYh0mQFKR9eNvM8Tqq6k0y1CAy9UrzVV6y3Dw0YqvqmLzwW2LFLWDMjCvem9uOmubDJF/fp02mythSiZ1jowL6Qqf/mRM+M/EiF7qxTe67+L8sWMwsGXahsa8ZBJB2Wj5CHXVr1yGj8HqPLNP/N7E9s5G/IDHFM89vc3hwRTy/ozVFNCr4693MC5OhDkn760RR7LsJxLvN7Cr7cJn5UhBlKz7piM0XNf9RBIOdslz2TZDXcbEOYrQLEE1SNrSrnvKAXxGRmrDeHEXmAQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zj7PsS2xcAzwgfqZhsyyDwEkyu2JiS8Zee87OYk2dkI=;
 b=NiRqbHVL3OnVwXHGW7DHD+GpcDRQUh0nAaLouJ3cOTiM5DcrKyFDWQ1haua1BTl27tsaxcx3LL+JCEIOtU7RFQwoREHaW1/wJir3hvBWDbVNfN9Ix3V4ZaCmOxoZGQlCYnr45seTsatMQ+RMGqdKGJe9sK++Gsc/vpJJw3pzkbV9Pnamzo5uHTxfh3r7VWTJtKjXEp3Od6svgZqElASCaSmDboa3RDf59d5y4iniax7YDR/qWtOrG5NM2Mpu2Ac//WbQTu5XfpHzxVnKFbDKFrHmMlMCZ1gEYk4IGPGJZoiel6S2icDp0AdenWieuNLttq2cgeSfu/SsorsWOV4B8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zj7PsS2xcAzwgfqZhsyyDwEkyu2JiS8Zee87OYk2dkI=;
 b=nlrRjycYK6nTAdUFUJZi3+wbV24ZZbcNDRFBY/2LQguJAnbLaGZ66ZOHDMVJEQlahFLCFO3MbTSIunJ22dMbmiLYMyS+c/sUFRkL4/27jyj2cOiFmOxi7RELD4sWAs+kx8B14iFCpg6xJZa8NWvLlNKAeXtolQb+Dcob/riu/fO2IBGZ+mt83b/s1vxDyuJZ6eURibByZhsBHoO1Uc4M3FmJX+ycydD8nurm446yIJIyUVurvtOef7471oLcIWpU0gT+UxUr0WQ2TNtT0vrSoBtjHBGCFHd/wTirFfrnAJXwMqRvnmKiZx6uUCs8LSdClbm/Roa+QZJ+1J8GaMwuAQ==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY7P300MB1433.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2c6::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.11; Sat, 19 Sep 2026 10:29:48 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0428.014; Sat, 19 Sep 2026
 10:29:48 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 19 Sep 2026 18:29:00 +0800
Message-ID: <SY8P300MB0041D841DA8295DC7F4B2510B5862@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
X-Change-ID: 20260912-bump-visonfive2-78f9069f9a69
X-ClientProxiedBy: SI3PR03CA0006.apcprd03.prod.outlook.com
 (2603:1096:4:297::8) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20260919-bump-visonfive2-v2-0-c6c5ffb1a452@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY7P300MB1433:EE_
X-MS-Office365-Filtering-Correlation-Id: d09ff969-1dbb-43c4-6e29-08df1638ee11
X-MS-Exchange-SLBlob-MailProps: 8U9+OAG/EBKkI8GgeR43xRMrZ/+qH0EFZeWgFVTITDeJkJcbFhhYdivrcxo5+e7bz8TlDeRWtkudvoHC4FvmcMKULBq4Cnbe39L1kl7j7zuhWbg++rlT6Bt710wA/Tqv/1wjxib/ha5cKqRVD3yTK4iNWa7m6RfH2ZCQAHCy5Sucb7XtvvhmUUWVW5vYrMgF1vnMfTrCCA4izKIXCj/hJz/0np3Tf+ufTxzi/oz0qa93Rr3jgHErWxcRTuPb5+2Fo9CE5OWiz4zqbmHjDD5KnVXLyca/weoPGYiYsRbY1qxRzcYnbcYBugc/qa/UX0KqFcanBpvu5aEeWHbsbV5WFyze+FSUA3g+G9FQm1thaGn2D0LPvYUCENMnmxaK6e98Jrmk1gZwEmpU5At/KSDrXlF4B7pvkxf+NZW2SPaFx6EX6iHz+DiPvIwZP/H7c+nxmTaV0GVl0eC69FcUcb1Gid7RyD+ZNonxkoOcZ3t61UZJTN49yFAsyFzPUqi2Z+BHpMzb+pqcd5QytKPPgmJwQIj/w0rGM7asr0XPMdNLII0VuhS5V2Upw0Rw+wwbKWxQfKFVbg7hA+lLCd8Wz/PsDrMDs8j+7YREcPlGOxk+49Z18jl7QNr0AAiLAgk8jh3Z4o7wQc9BxQWTNIJhpN9Em5F/Mv0hoyIN9dZyizmm+A2ipEeAf7f5+L6fqMi0ESzuyw5z6RLLjvIV+iUSAWOXnqvtbog4bUn/joaYkPE8JcLzRBGqnyuqCHjOhk0N9O0kOaeNaPoNmogoi759u0yuwg4XKXFqU+eYoIFGknEZQidrZ3ZmLVcqywQJyX+8bp59Am4eWbb2WkCt3MF409EiTA==
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|24021099003|51005399006|15080799012|8060799015|23021999003|5072599009|6090799003|19110799012|5062599005|25010399006|40105399003|10035399007|1602099012|2607281247196008|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0FLWGtDanFUbHhXeFAzSEoyckJid2x0QlU0eFFSbGt6OHJEbGxMb3pLRlpa?=
 =?utf-8?B?bWNWcFlpVm94STVNWUp1RWc4a1dobHN4dlNONHZYLzFpdnQ2MTNuQWtxaUdR?=
 =?utf-8?B?M1JCWjRVcVozanREalI0RWVqRWpuMVQxanRRL0JPM0JjVml3Wm9MRE82MGsw?=
 =?utf-8?B?RWZhQ0l1K1ZzUm9RcGx3RWNrSjE4M0FGSFJnZ0VidjE5R2hVLzM4T3BBbFpk?=
 =?utf-8?B?bkxNaGlTNnpYS0tiL2VJeEZ4b3ByenYwNUlxZnVFVTJqckFxK0xpMUZlUWM1?=
 =?utf-8?B?YlNFZHBPTFFLbXRKSno3L1JnRnJqdVYyZERzUmZnM0ZzUFhVQTAxdmZwS0Z0?=
 =?utf-8?B?UW1TYmZmMWR3UGtEN1p2VDdtMlRTai96aS9pMDRCdmttczFPdUVHaDlQbU1n?=
 =?utf-8?B?L3JUcFdOYVVVcnhlZzl1Y3pkQ1pVVWJQOHkxdCtGcEpjT1VVY0FXUjMzWHNt?=
 =?utf-8?B?My9OQUxSdE9zdDAvN2FDZTEzZkVLeFR3NEM5Y1NaM216V1pBUGN2M1FWZk5Z?=
 =?utf-8?B?eG04eGNyS1p6TktiUmk5SGhjRkRDTnRLck0yY0UvaWE0RzRHb2tOUzhNUTZU?=
 =?utf-8?B?b05vYUJVTG4yQWdjUjJzRS85U3RqL3BzV2cwYk40VjBzazVVQ0kzazdmZDlr?=
 =?utf-8?B?ZUZzbHBOcVh0aXNXbXlPTkFibVIrK04vVjdnbzA3MlBjdmhCMlZjQmJlOEhG?=
 =?utf-8?B?Y0hwS0xZbWxhcTRJUnBFSkQxUDlpMEJEdEhjVGM3ZUticnU4bnVlbnZGUHk1?=
 =?utf-8?B?S3JiQW9BY0N3eTQ5U3ErSVdweFV5Y2pOVDJMeDJwRmNnb2N2aWlPLzJxWTdV?=
 =?utf-8?B?blorVmFSc0xnbUg0UC9DMUhNQk42NnpINnlSekk2MEVNZ0F2Ny80cFFxODEr?=
 =?utf-8?B?ZVY2T1I1d25tbnlzNVg1L3Y2Qll1K1hiWHI0QWVhaGEyQ1BVeHREM1BlT3hJ?=
 =?utf-8?B?ejluTkpvSnNQeGM5T0Q5ZFNDUmwxRlBTcHpyTXhpa0d1YUVUQlY0TUo2WDdv?=
 =?utf-8?B?RjZ6L0pzS0NYeHk5MkEyQXJDaVF6bVJtZld5KzlYaWQ0Ny9oQ1U2T1VLamJZ?=
 =?utf-8?B?bG9XRnVKbURBNGp1TjNEbCtuT25tRng1OFRObU9yYzVKMkZwT1FSL2tmNFBz?=
 =?utf-8?B?U25Gb0NYN0Y5MEZNK3l1aXdSR2drcmY2cmhWZ0NzaEpqUHNyM21mQmx0eUEz?=
 =?utf-8?B?SFR2SEtraUw2MkRDeW1PajVKSU51bVd6djBRNEdySEJsRWhUdUVRbVI5YlNj?=
 =?utf-8?B?cWlkY3BqQ0ZjZ0hBRHZ2cmhFWmdoNGpWYWVlbjBDKzFrRTcyclZjczExaWd6?=
 =?utf-8?B?RGJlVm54L3NGZGNQcTFvS00wWW81NitXSHo4MjlFK3JnTW5oOVprOFQxbVFV?=
 =?utf-8?B?NUZhdHhJWTBQeVRNSi9HbkZtWUR2a1dDektPb1d1TUZFQkJyOVdyTlJaYlRy?=
 =?utf-8?Q?f8JKOs2G?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clVkQXMxTDFTU2Exa3RDZEFkUHI0Ymd2L09iblRnT09pRG1DVVVza3Nvcyto?=
 =?utf-8?B?cFk1NzJnUlY5WFBUaHNSYWUxS1lyWG5iMWxrMFZaZzBqMGJreTE0SFpSUFE3?=
 =?utf-8?B?Qm1XQkRDZDBvVjlMbWd6T1pVZURjbkhrSENDT1JZQXJXM1VUcEZMWFZmNVNh?=
 =?utf-8?B?OGJ1VEVxU3hiOUJzb3JtbVlITEhBMTJNd0s1YWZvS2lESVVOTTJreTRscHdE?=
 =?utf-8?B?bk54SzlhTG1IWFZwOTV6OWdlZDErdHg1SzFiY3NEb3E4cjU0V3puMXJNbXRY?=
 =?utf-8?B?NnpodnNGbkhLT2E0V0JMN050dlFibGFaeGEzaE9ZWm83dG15eUMvVk9iL2xM?=
 =?utf-8?B?VERJQ1RNYW1EVkJ3NmhBSVVydU5yL3JGdWxpclZFa1Btb1VsZnhacHBGZmRx?=
 =?utf-8?B?a1c4ejk5cVVybFcreVZtVDFEZzdvdlFDZnJIdnkzZGNMMmY5b0lTNzNiWEpE?=
 =?utf-8?B?dDF0ZUJXWjdwZWR1WEtoZkhFOTFiZnRBUjA2akFlUnFWM0FmWTM3U1U4Z29j?=
 =?utf-8?B?eFhKZytIVG5Ca0JGc3dPaUZsN3ZrcDVsOGlIRGJoam5BWVIxZ25ZQmptbURX?=
 =?utf-8?B?UXlEeXIrN2RrcW1PYS8yRmRiYkFpZVFBNlJXNmZSK0wxMkl3Q1NzM3lnWkxi?=
 =?utf-8?B?OVNCVlAzeUR0ZjVwZ0l3MWRYVjZPMTh2RWpBejZkVXpOQUpoejc0V21acDdU?=
 =?utf-8?B?SmQ3dkdWNW15RjVaQ2NvTEljM2FNem5ZZXNwUEdydlVsaWFnOGdhanhDZUtZ?=
 =?utf-8?B?bUFuKzY5LzZFaUp5SHU2VUNyOHV1b1pucVZhVVZCTTJMT2o5WWRMWDFFVFls?=
 =?utf-8?B?S3BOUDJlTkJHeVNLOFR2YnNTSTVLUjNSd0ZqTU1RL2M0SDNsS3ZrSEd1TUcx?=
 =?utf-8?B?UDdmZmtrS0ZmRjQ1UnE2UFF4Wmd6TWFhemFKNlFZRTJBNUtaVFNCSldzMUNS?=
 =?utf-8?B?bUpQdGhyR2tJNGx6N3ppaXRsQWVkM1dteVBzQUcxamhiK2ROR0ZBamJYN3Ri?=
 =?utf-8?B?dDkyayt6N3NLRm93TmhndHAwRGUrMjF5NTVHN3NqQkJlZEtpN1hFaXpYUkZD?=
 =?utf-8?B?eVVKdTNOYTZXRzIxZzl3Yi9ER0dRUTN3QmhyWWMzaXdXSjdVbThzRGdkV1V5?=
 =?utf-8?B?TUVJT3pGNXE5MUNyU2p4ZVZTRys0dnFmNVNlaWl2aHRZL2lERVZLajdRQm1Y?=
 =?utf-8?B?eFNudnJJVnhrNW85N0toSUVmWXRpSnE5MDZQbk51UExiTExxN2VVRXJHM29N?=
 =?utf-8?B?b2tTMUdBb015MGRyUFI3U0JkcElqR2twWnh1ZUtCQ1ArY3JXVlJDekxQakhB?=
 =?utf-8?B?K1JsWnhveWdtd1NrODAycUtPc1BLRUlpcDRaaFp4UE1nUGFTQVNiZ0JlS3Nm?=
 =?utf-8?B?UitTb3hmemJUTnI0Uk5IZFdKQUtRd3hiMUVqODhCdU0yM2lOM0VYeDJ3T2Zu?=
 =?utf-8?B?R3F6K05rMGJycUZuSHM0c0RsbU4yQnhjZFdVZlBUcVBpdEl3eUVBd0MvUHJX?=
 =?utf-8?B?dFd1STVtbFJKaWQ4bU9lTk9ySHZBU3dzS25GQVkwR1dqS21YajYwOTU2MEg5?=
 =?utf-8?B?bWtJWVhNOGJyaUNUNGFVRjF4M0s1RVVpQ3oyNWUwUlVOQWhCU3U2QUVkaTg3?=
 =?utf-8?B?VHNmd1dQV2V4QTBkTkthclBpbFIzU255dkV6N2J4ckJZajRFc2dXcFJFYjZY?=
 =?utf-8?B?M0ExWkNWamxjMEdvbERxa1YvUTdzVm9nQmpXZlUvWXk4VWVGRVM4bnVqNzYx?=
 =?utf-8?B?dGE1UU04TVVQMUJhaFVlNGtsSm5MZCtta0lLZzVNZEZLejhLbnc3UVcwU09r?=
 =?utf-8?B?Q2E5UVYwcE1KYVNlYS9VSlBHNnFmRUYrSTI1WjZhWmg0OFdaM1huaVRHRjl2?=
 =?utf-8?Q?ggNZVJF8sBFiT?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d09ff969-1dbb-43c4-6e29-08df1638ee11
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 10:29:48.2602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB1433
Subject: [Buildroot] [PATCH v2 0/4] board/visionfive2: fix boot issue and
 bump Linux/U-Boot/OpenSBI versions
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
Changes in v2:
- Patch 2: Adjust indentation of the commands in the commit message
- Patch 3: Pin the U-Boot documentation link to v2026.07
- Patch 4: Reword the commit message to clarify that U-Boot sets
  $fdtfile automatically only when it is not already set.
- Link to v1: https://patch.msgid.link/SY8P300MB00419E6035B2DD54F72006D3B5872@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM

---
Fengwei Tan (4):
      board/visionfive2: add rootwait to kernel command line
      board/visionfive2: remove non-upstream Linux config options
      configs/visionfive2: bump Linux to 6.18.51, U-Boot to 2026.07, and OpenSBI to 1.8.1
      board/visionfive2, configs/visionfive2: add support for v1.2a board

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
base-commit: a936a80d9e566234f3060fed521181f3fc7a2120
change-id: 20260912-bump-visonfive2-78f9069f9a69

Best regards,
--  
Fengwei Tan <tfx2001@outlook.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
