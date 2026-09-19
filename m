Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FF5C982CC
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 10:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20761811F1;
	Sat, 19 Sep 2026 10:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xUJ6WGXQ73E; Sat, 19 Sep 2026 10:30:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B03AC80E1A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789813800;
	b=MaVn9igzBwK/BH8DyUvhO+JlKlzniF1ORQaJG7l0ZMZxwtV2SyjkHdBUzDOURwL3w67k
	 Nce7j78hWtg35hTO/ZMJb5WA3V9m2rnUsfmKKWgmie7DohU5Pu9HVmd15CBh16IFoiM1t
	 DtRDgKCXVMAEx/rQMPsrkYhahO5KOSbUPicG4DnfRIQqjP6akFRQgbdSKxyunW9OfArVj
	 THvENjLguWJExo089z3sc+mBnMFp6Fqkp/a0qMR0M5gIrSngqd9uLwt5VwJ9spjJHXk+h
	 vVitBYgO6rziuUSzjaaIQmN3MeJny3atSP3xACzfLnijkv42WoN6Cbqge1nV8sJ+X1g==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789813800;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-ClientProxiedBy:
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9k5f6VLRgO+v5rpLcsXgNB990DCGXOuRfF7CfPgWI8U=;
	b=K01WlML8WZw5tynWSMwqFhwSPc84jqiq/fE93Ff/IXRLOPPQEv8L+4nE9GAFNc2WlIy4
	 mSEdjuLRuarMzdFn2hajzMzDbk6CJKGDKfH1alJzuteRMDCXVsPrxSlJOEQfzGeFzdNgj
	 njbaSZjnjnSITclU68Dnx05msQ/UL/JYhchLy76YMMi0fj+3xBIHqzvDwLq6Ota0tp9cd
	 p20+IOCx5p23fkehFTxTsdVLLjtWGatXdO7pYyvHNQlmR+5IJC9v8u3pNV5nl/UrJi++c
	 Q/bpSY9QyQS0mEOlHAY0MKHWUKscd2nAdsCHqz6kp/QDyoaLEfwFZDbzAicpvLmEo/Q==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; dmarc=pass header.from=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=UmcEyeBJ;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789813800;
	bh=9k5f6VLRgO+v5rpLcsXgNB990DCGXOuRfF7CfPgWI8U=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J8jACGism4+SqfIiAHKiQXXABlvSLDyZwT6zi9Ru0kk+rLHatt0gODJciVtIqjJMs
	 rrUtDVsaHbgevxPCEK/UKJyqWIKPxVqBXebPhxqba2Tby51I8V/mDIbOlDs2wAg4pD
	 7Pe77lrKTT2lry4K3ZjLlpnT4QMEb3B1CrrHWv9eI6tCPxaUPJJuTuY7aTUzlsP35q
	 GkKPIhZFZCd85SjECdlCglH0wCqHQI08UCnFBMSNVG4Rpqt6vp2TkaMhnU2916UknB
	 lSor9UWq69enwnP3w0jnXUUwZkWqF1CUbMJRGUSm9A1HtHRtQbtVgKcEHe299ZkPdb
	 bEVA/DU5dxj3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B03AC80E1A;
	Sat, 19 Sep 2026 10:30:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C30DF333
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 10:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8F1A811C7
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 10:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCrwyjD1yIBt for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 10:29:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EAB358116E
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789813798;
 b=CbedR0j3bbKsxf/69YIwxueA/OFeaF2NFxoglghieXAp43Swec5eWMn1qe9nlmzM42LV
 gAIth6Q/ENN8Cr4iXScChr1BkTQq21JdfYuSelNQ2opFsrNJWtO7AqVyin1ujUrWMY1Mb
 YYPonFbP/VeV60WW31jep6GdZNLrUUTghUTKVcSayjkwrclfvd9akTZ94RvattRcYjwaZ
 Yh6wnP+CZV9biDndrpVOI5yZIeu8bTcPHIcGH16c1jC5idZbkf/JwxyBDgm/ii+wjGc8U
 Iv8mDfjgdqayr8XGk8Ns9dq9zjhrQz3ZVqyduPfot3bu9c2PWpXD7Wt5jjbi1VS+WQA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789813798;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
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
 bh=NEkrSqGKZt8sgyyR7nQVj8ib7oqViiAhErQOEXJpjKU=;
 b=F5ZlzH9QLKttXR4WCnbWlOFoHftPuPlO/RCRJ44LKeblaNbBoQ9QhfSj2tFLX0rNkTrH
 sNG5qpTIZz4ee/jlnFzAHrgTF/4aViT18slAxe0MznD2cV7iqIMvVcR43LSGIf9ysjcEn
 Ah3NL8SvWPsrjXvaNiMZrk2dQmbdBN4vLrUGpRGRg8Emvb6WGoh7JnWUheO+X9GLfQNnB
 CEwlx0NjwFpzOKhRPVA1basfAjh4gLts8P6M/xbhwMQ6KsYUBZQZ50Le4dBUrjFGKduAB
 dhq7os6BJdQiYMAPgwqgMtyLrsg8+P9hqYXlG/RPVCMU7jJUJ/5acsy0Jke3DvGZTRA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=outlook.com; 
 dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=UmcEyeBJ; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:d40d::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40d::;
 helo=sy8pr01cu002.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=UmcEyeBJ
Received: from SY8PR01CU002.outbound.protection.outlook.com
 (mail-australiaeastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAB358116E
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 10:29:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQ5q1MXZvGN7OAdL+kvr8YuwIiq5WdbRnPmA0ykks936Mgv+n/ugB2nCmIwBpV7m6ygKTtedwWoBObsAs3SteNHh49NrTIib++AADC+ZAT24KqY5JWamb27u0Bjjy/qoLMZf+DOdn1EMgiQgA4Oa/VsWfrpEqal+777G0Hf2eXTE6LYbFpbWd8xGRgEOEcllBmkFDM4fdv7rAxEr+THh8TVbbQU4iziHdH9IYSe65acbUq/U7M8OeLS9yBoGHMlKE2WPfE99zTSaXmiBR/Nbwm5JI+eTTEf5PVrMiJflgiEuz80hYjQCHLWbq+64X6V2TEsogbjVcwfB5a7Qo5XB5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEkrSqGKZt8sgyyR7nQVj8ib7oqViiAhErQOEXJpjKU=;
 b=mBAVyoycPv6F6Yt5e8Pvn4mnPMTm8+Xk++sfCl9txVdG0qXgJWgohLGkP4hmvKSKEk45KBBHUt0R576CVryN0JD3G1FKYB6z0JDcH6xAZgwtRL9KMKY+S1Z/LjUe/3DHvMFvZ+nhyQgvJC/cCP2PQmTcgNC6si1sKgfuIEgHK9gP0+pDtcA3iIe85dw9nIWQZ7HA/cWIBLZT13E1o1nrz7r5agqQaJOqDO/bc+dHhqrsYkfibgm4mjkRKha27FSRMVvZcGnkGbyGSKwJLlAg7vnkConmbPTsJz8s67udQchEJixBuRPNNUw0aaxu/q8bX1Ix/Qh68E8lYOXaCI8qPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEkrSqGKZt8sgyyR7nQVj8ib7oqViiAhErQOEXJpjKU=;
 b=UmcEyeBJjJ4X66oMfUNSgedtmam8T+qPoOPJUbBRXjkCRl/aJ4DT5ozpWR70CC4BWCDnCd9RP9OHCIm7v/81JQQitcD9m+fyNO9rY+7OsqUtieHhc28yqDcXBJLYvHouM/kKYIvLBF0G0tB1cPIs8jQFCmwPBg5vqeeQ8tj5AwcJTj00DQrOvsljnCvJtEj/iezmg2/Ee2tBBVNzSxOcP06xELtK9KY1UNqLRZu2iwcRdeH2ygnjejQF5dyBDzZzKwfk8Sxi9x0UthQrkl96SxJh2GVL3rtwbt7qukeGIfHMSFKHKZrT0GfhGcdJTx4KYJL+CuNpDQB8PS+qTPrIYQ==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY7P300MB1433.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2c6::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.11; Sat, 19 Sep 2026 10:29:50 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0428.014; Sat, 19 Sep 2026
 10:29:50 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 19 Sep 2026 18:29:01 +0800
Message-ID: <SY8P300MB0041D02EDFF736A28FAEB766B5862@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <SY8P300MB0041D841DA8295DC7F4B2510B5862@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB0041D841DA8295DC7F4B2510B5862@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-ClientProxiedBy: SI3PR03CA0006.apcprd03.prod.outlook.com
 (2603:1096:4:297::8) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20260919-bump-visonfive2-v2-1-c6c5ffb1a452@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY7P300MB1433:EE_
X-MS-Office365-Filtering-Correlation-Id: 3011d905-38c6-45b0-7b97-08df1638ef2d
X-MS-Exchange-SLBlob-MailProps: WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRWvPNP6WXDoKuWUDQ4qbx4uTdTOKRWaS48Mx+SLH34FDNknn9GrdLG9xloCvRk9UTPaMEzD69oaup8/6/Srx4R+kyz1ugOvGHtHVtfEAnCKHiFT8AMadzuuC+sIKeiItVNTj0hDVkiZF5ZXnFti3S2i4hvpgHlBuqp2UUHG1tli/JT90CBjbzLaUDFNmmyhRSdO4d/rKNT0dZVQBC7rpHaRhcB1xxSQkez9xr9TlLYFzFI7PwZ4SK4wZdqe1Mx74eCxvADrXkRrID0DMGLtAjDgB3YEXOREX/OSin26qgW+12S+C2xDGSrBkpOuouqVH5i7cGlIUPrLgVrMjvq2J5zgljPr+XJhUNAy+s4/OGNjhhl183j4O3SIluUmsMT1Bff1X1cWLIs+dwEwBsTf/eOXtfVfNllrUp5G/u+sm3zRbTy0VZ6/Ljr/xJHbV2oUGy88hB6GOD53alttBgWVapd0oMgupQMG05rCp7HAlrI0gqJ1bztulo0m1M1e6HEseRD849nJe8Vd6TxOqRzlTohtLFODPUpoVMyjptY61kPcsIT1NQkYqkuslNhaCH9eLagy5OvyV+VgApXhXnKxH/CVIm0UuHmux6H1AfgTpe8pK23mwEgb4bx3P06pqR1VN87J8OEFg/9Dm7/QmpN6eI9uJiVi5tdNN6wHFWTArriFycCe4u5TMlnmEG7A4sof1lny/n6QeOGbA3N6LHG1e1CAuMR9lOBfk8P+9B34s7Wy8=
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|24021099003|41001999006|51005399006|15080799012|8060799015|23021999003|5072599009|6090799003|19110799012|25010399006|40105399003|2607281247196008|440099028|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1BVSm83eWxWOEc3VkRkN3lFUjd1QmNITU5YdVB0TjVMYUlsRktSWkJTQ21a?=
 =?utf-8?B?dnVWTEZ2dlhWNFQ3U3RPcEJuY0tud0VnYXFvV2w2MFpacmhZdVFOZ1ZFcnVO?=
 =?utf-8?B?VjU4cHg2V3dSQXJrcytxaU5PRnk4bXVlajczcUdMT2FBclF0bFdrbmJySmR2?=
 =?utf-8?B?d09TZmdXTXM5VGRZR1lkRVNaWlRWdms5SHVKaElqRUEwWWh2V2lyVi9BWnRF?=
 =?utf-8?B?d24vK2dUK3gxZGI4QU9ac0t1d1luMmRJU1Rza1FqcDh0di82REJic3NmYXdJ?=
 =?utf-8?B?OGs2WWpweVdvL3hXSFdFbmFRWUpHUjZVd1hNMTdHdzdPN0dZZ2g0WVJlVTBu?=
 =?utf-8?B?NlU2dXhpTEZQSmk1cThKMEZFZGJjenIveGYvOVNtSWdseERkNE1jRWd2alky?=
 =?utf-8?B?akpQaXp3dlJWaUVZU1RZQTFtMXBhSTJHWWlJbGdRa3BGS0x6VWh3WlNLYUVD?=
 =?utf-8?B?Wm5XRTVKUFMybm5iaVViYWJOOHdDdk04QTRyMkVKYzl4VDNDZWJ5MHo5aVhn?=
 =?utf-8?B?VStOd0lMeE84ODhtc2tsaHlvMjNxYjBXYSswTmdwY0lvL2pIR2dSOWdCK1lP?=
 =?utf-8?B?TUJ3TnVyd0tFa1hkS0x3MktTQ3RMU3lzYklvSEpWMEVsaWJkbXpLRXVxMWp4?=
 =?utf-8?B?UGtyVHl6ZXRaaWxVc2k2SkUrR3JURkk5WGIzbDBZZk53ZEh6TXczUmppUXhO?=
 =?utf-8?B?OUkrc09kOFlTYUNPazZjNHNzNnA1Mlh1c01hV0cyL3Iva3IxL1hKQnFGYkFl?=
 =?utf-8?B?T3FXOE9CVVM5Q2J4WEZKNDdpOFhyNU1FZnIzQ0ZSMUpia1NKNnMxYi9GWnZ4?=
 =?utf-8?B?cDhxNjZ3N0x3bXgxMHpjMDk1dkF5bVJzdmpkMEhyTjk5QlRpWGJOYTh1SGxz?=
 =?utf-8?B?M21XQVhTUHducHZqV3pBYnhqL3lKWkJtMGtTWnMreng2OVZzYUltUDdxUkpO?=
 =?utf-8?B?WHEwbXUwbmpGamJqbHNOL09jZ0hmMDRXcUp4K2tLcFEyV3NpR091aTU2YTBk?=
 =?utf-8?B?M0ErbmhwTmU2Z3N1SU4zSlZZaDQ2K2VDemJPT2t2aFdFZnVLaEdQK2s5Y2NU?=
 =?utf-8?B?c1F6VStHVDlFSHEwd1RvVC93eFovRUVFT2pkb1RTbkNleUEvalExUTVkS2VL?=
 =?utf-8?B?dDhLT24wRVhYejE1ZWw3M1dwbGJLV0JGS0dWcTVIOVd4aGpHd2JvSnV2SURk?=
 =?utf-8?B?MVZEQjI5b2lTTHJYUS85NXFFVDFFT0VBR3AyYlltUmFibnVlbHRYcCt3WDB1?=
 =?utf-8?B?Q3JqcHVET3lKNDhMNUtyWWIyeENJQjdhR1h1RkpDTWlZaHdLSGhHU21YWGtG?=
 =?utf-8?B?U0JpcXJtZVNPUFpvOG5xbi82SGhRZFFmc1hvMENNYldwWTBuQjBlQXB1MlZ4?=
 =?utf-8?B?SzVYUzlxWjkzMWc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c29zbTBGSzBBRlZMZldaclRDZmQ0YlJ4REJyaWErUG1KOWY2U0lCZ0JzOEt2?=
 =?utf-8?B?VFJBSkVYV2FlcldFL2pQaWVlOFlVRVl6UFp4Mi9rN3FWQ25URjlpZ1hEM1hQ?=
 =?utf-8?B?MFZ2OVNkUEFvbzVoTGxZNHBCQ0I1SXlXa09Cczd2ZHVLd2VYbXRmUHZNZmRt?=
 =?utf-8?B?VkZuYVh3OVdiTm1jYlc2dXE2KzhHMVRUR3U0MnpTSzJLQnJxcTBjeVdtMlpX?=
 =?utf-8?B?a05mcG1IN1hRalhrK01CUGgrVWo5QUJqLzZXZzNpOG9Ca0k3aFVWeUtIRmhr?=
 =?utf-8?B?Zk5WZHczRncwdW5VdHZRU0xVWlBhUEJsQzhuY3lIOXQ4T3VUdHd3YTlURUk1?=
 =?utf-8?B?bHp1QWdwNFBiV01Pbjg4bVMxK3ByMVdidTJlSzU3MEhZNS9GbU1hS2hEamp0?=
 =?utf-8?B?ZUdlTUlGUG5LcUdRb2hEKy9QUG9hSjd1SEhYU3ZUc2x5QmZVZFZ2WSt0anpX?=
 =?utf-8?B?dGRyaWFibnkyd0JqNDF5N3FteVJWK0wrYlcwTzk5SUJkTkMrQ21KMUdXeWVR?=
 =?utf-8?B?bXdySEZJdTZ2ZDZlWmp6VmFZc1gzd1lNSjFISnY1NndEYUxSeXFyMlpVQ2JG?=
 =?utf-8?B?MWtYMFJ5NkFvdDdQVnhzQk9QTmZUUUY4VzFQOHVVODFRRzBOL1kvN2NySXVB?=
 =?utf-8?B?UUZJc2h4c3JsQVlPcU9POUhlNjZ4T3N2U0d6NFdUdDFwTE5yYzZlbUFGb1B6?=
 =?utf-8?B?OXEwSUNlT1ZYR0hNc0JzSVoyVWk2MXpPTXEzWXRSZVlMZkd6MmlwTUllRHdn?=
 =?utf-8?B?UVBaMjh6ZEF0bVptNnlCUXdwYlJZUitVSHVIQ3pacUpIRVBjNVJaOHRBRGVS?=
 =?utf-8?B?UmJPdDl1VktHWEhUT0ZIZG90TE5UZTQ4N3FNSi9ORGtrREtqZFJ1R2U4M1Za?=
 =?utf-8?B?dGoxdm5VUmdsSjBCdlNkMGNDaGs5TDRZNlZUVFZhcXZJL0N6V2NPTVprMFlM?=
 =?utf-8?B?VTB4K2RySUNNUXFRLzlZSWZHSExTTTdxcnBBSGtVcW84VkpXU2lRSHF1bGha?=
 =?utf-8?B?cHAyc0hLYnRvc2dsUzVQL0xOVFNNeDQwOVBQYUYySFZPQm9DMEVuQWczZ3hG?=
 =?utf-8?B?Vk1NZXNJbmpSK3IrZW9CUDFKOG9jUlJtNkVxN2RXcTZ6UExQb0RRbjI3d0NF?=
 =?utf-8?B?Skk3bGVjRmZqZU1mU0RmZ1RvWkNRRGF5Z3ZrM0dNamRrSWxINzJiSnRtZ1Jl?=
 =?utf-8?B?K2ozNmUyc2c1YjRkM3hNL3A1UGQ2dnkxRUk1QzEyRjlOUTdkZEhLOTJTdjRz?=
 =?utf-8?B?VzVQeC9YaUtmMWhEVDM3aEQ5TE0rK0dPaTEvcGlMc0ptaDhOaisyWXNWK1NN?=
 =?utf-8?B?dFdYUmk3UkYycUdtazRZdXZtQXpocDVvb1ZRTjRUM2w5T0FldGQvc3VRcnlm?=
 =?utf-8?B?Zmc5UGI2V3JCTE1JWFREY2VlM1BJYkNSSFdkWEwya3pCdHI5L3VaVkJWQ216?=
 =?utf-8?B?SHBXazZXTmdTdlpNNTBvc21UZ3ptamhwU3Flb3pxb2xKRnBZWUMxR3VrcVJp?=
 =?utf-8?B?Q0FXTXhHSWFNSExZZzZEb2lUOXhJVnMyZGtQbTV4WXpzWmdFMERlWktNR1ZU?=
 =?utf-8?B?VHhRaUNhQ2RDdWtTbzlvWHF0ekM2c21nMG1IMWJFUU5PNkxCakVmTmZaRitJ?=
 =?utf-8?B?V2hTM29hdDBuUTV6TVJ5ckF0eFBRcGx0N05nUFZJOGVXOFBiaDFLK0RQMWk2?=
 =?utf-8?B?eHZESlRxSndPcjVxc1JmL2xnNEFWM1diclBLK1BZdUVQNXBxaXpGait0UDRM?=
 =?utf-8?B?VHRVTXZoWVNwS1JKQ25QQkt4ZERPSFZYTlF0cE5aNGZoM1hYaVhIdHRhdW51?=
 =?utf-8?B?YWwxZ1NnU21VbTNEZFB3MGdiTi9kQzViWnJxY0tWZjBPVllwbW00aHhpaUFj?=
 =?utf-8?Q?VGokzQbHuEUAf?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3011d905-38c6-45b0-7b97-08df1638ef2d
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 10:29:50.0524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB1433
Subject: [Buildroot] [PATCH v2 1/4] board/visionfive2: add rootwait to
 kernel command line
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
