Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C8ECA5FFC
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 18:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AD1460BB2;
	Wed,  7 Oct 2026 18:12:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrtZIdZ__Zoj; Wed,  7 Oct 2026 18:12:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1893A60B6B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791396772;
	b=hArd+rj+tj78AmaP1QJzg/dFjdGx0yE7RChYcDAJjSEUPHZIVQFp0TBk4nFbiQ7fVeLn
	 L7No0NZvgDeeBVUDhi5BfWy6wMLKn+QYVGjLmoj8y5TCnRo5II10pLY6ywXNg58u2KhqA
	 VExOrwjDWknEatqIrFwT4LRqiKjX2vZrXSrKYGN/Us2Z0DoCeLHPaAMyWTD53IBb8SDHH
	 eTPVt1dW8wzDgbQID3LRXUDqgnB03+WMvASOVQnsRnYbPn/r/6tf+Fr4nLl9zPX7fpnut
	 qFKDgP4cSn3G4VWhtwgYrdbj4++J9DUiwnHQ03Lz3t7JP/Hn6Kx+MNbfbcLu/dc9tGA==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791396772;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 X-Change-ID:X-Developer-Signature:X-Developer-Key:X-ClientProxiedBy:
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
	bh=wNJ1hszpZJZl6Ociiz2dL0VN0OxpHodXCvfLRS064co=;
	b=l1x2wewWf33YY45Xuditz9kvviwckgNQElizk/SpOal1i3lExt1VHAydmS1L7XvAzDJR
	 kSQTJTAY9O7oyZgmxxg+YZ8nu3D2lUtMa7YP/ByKY/+P73JnK2XL5aTBPc8dEAiYUbjPB
	 qUcMZiqXXMpnL1CDXgumPj2vYicSVDOrgvTzJFqUAgoSFS0aNdj59woF1im7QgmeUZNCK
	 ehaUpAmof4T0juWAZNonJSfJZbv+vllc6J4luBJIE0gJ4VDtgbi42VIabgH4A+1lhudH+
	 4BJeAgE64e0ABAvZD0UwhN82bv8YWv12cXFsLiqQL4qdG5lEWsNv2lduh+01e2vfqKg==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; dmarc=pass header.from=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=R6r69xEE;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791396772;
	bh=wNJ1hszpZJZl6Ociiz2dL0VN0OxpHodXCvfLRS064co=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IYISmylElwz/ABOyulm6ic2YfbttQkZeMHXhjGVyv6Tbr3QN7oJ/gODGcQtEI5FR1
	 QhVEb8H0A2hA5JU5DUuURwf3BvSwGss6DH9uWW1vXqG0TmXNZ/IbiXUcS6JwgOuutJ
	 V/jw/LLvXqLzsd2KilegKdhd359PQfdgFLmY5OE4+3JRjj0R/O9bzHy5zHJBcDvADZ
	 LZJSoDnG7SdPgRVF+qoPvYPQ1Pexse4f6WE+9UOZ0erSa+mUrUv1mvlZ4NrJjfh/jn
	 YGu/QUGqRmZi0FBjKsowJvaBwCEGCPwnSKQv/kkHOwhSoaRtrcH8PuKX4HV8JrjIOm
	 zVPtO8mKaDqFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1893A60B6B;
	Wed,  7 Oct 2026 18:12:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19FA975
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 17:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B02360D4F
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 17:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xt3K88-8BaeU for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 17:46:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 19414703A2
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::2"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791395161;
 b=rYKfg9GYF+AYceZJcqelbop5V1mtZv+I150bJPlmTHT1gI0mQwHDfo9iEemOCizEkyxC
 ZBgdFEY3t7naqCG9XA+FZCTvqXJnaAtDJYi3FgBsc/OGD85H2j5SwiKaY3GAZ3RK1fcQA
 08m8nU6wnCJdtEBD/aYc4fKlALGD1aC2DoEiitdtDJkq4bpXiIzXdcKYsxXc5TcGtFeCA
 kPQYooqvbQP08TML+o8AqpX8S6+2q5lmgMiBIE88FjWRj0voijz4AxvIAy8ZH01vCEDCj
 +v5BGZtxLHIT2pWMPUAPfFQGDgaVGJq+EgqSIq2yeENUJXhj2dnt3gGzmsMtRo4Z+Tg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791395161;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:Content-Type:X-Change-ID:
 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
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
 bh=Mzh/RyB7UEf4aK+Wv+C3nY0FjNc1o5fovJuA0KAHw68=;
 b=m9o2P4YOLWvo7WSQ/AHlkh4+MJxVercZ626+VXrzYSPlv4vfZgIQAukmNH4/6We2KGNo
 lXkiW9T2vN64aPJM/reeIUzf27Tx4Ou/BDkWM94630JIqlNI5/28Pbm1aw3eWcB42U4yj
 khIfdMGQr+lUYXb8J2/M+nDUklyDj0vfv5bqMkG7Xu7N0coiaPsVUfBOdtWO9sHbZwQ9W
 ke/739FekCIijha9wyNzj5MnBSrhGa2RGsqtto1lm6Yy5nBbBlsxbuWqSIhh6g/XtyteA
 9Zv8DSwf6ZhhPi72IrsiEDf24XcP3QYMYQd9+gqb7cMyGRRiHgipOzerpwSHNrQYgCg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org;
 dmarc=pass header.from=outlook.com; 
 dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=R6r69xEE; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:d40d::2"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d40d::2;
 helo=sy5pr01cu010.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=R6r69xEE
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (mail-australiaeastazolkn190120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19414703A2
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 17:46:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/zO9x7Nl952FM6YskFa1MmduCzcIkc08p6QTLdfjr9cAbRHPJcFxgHDahJgdfc1Fc8w3/jBvY9scF6KFQxdaHJJnT20xp8NP9kwMeCLki2IWPdO2+kI4Zl6yQcdcmqYlrQSeLNYifZu7or6AqQsDelZchOF44cu3aA/IZVLn6IdhzRgIwguQxmib13kL0MyjP4BjCpJgjsBCoQ4+1FMpf3zv/GGk2vxPY6oiSeV6zGKLdOuLIaRBPclbbroHhFRY0gVaL+AYP8TkSTJoLbRI/Ot0q2tHaG2ATy5fPxT5IYOuQW/+nrqNoxCSaWsXoYhGR+8NDDgQcTRC0sapPC+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mzh/RyB7UEf4aK+Wv+C3nY0FjNc1o5fovJuA0KAHw68=;
 b=XJXbyNkRj8kRmC22lSUdw9LR32PdPw7M7jVey1y911+bFwjaDtXI4KwiLa232MvVl6aYr6sCFWl7wDHPpyU30HNB0YxeZ7h29nNrPQ/qWSTAyQl64ssmQAJsQClxC6SyWC6M95w7le1iwo2LzW8tWEoTeLXULkLqSQty8Ew+DD0+047XjuzkxkeECsqPghJfyCQQdpKV/GbNet8k84RIy8MTb3WyLuykbih6RrbPcNlPFC1Bu2MTqr3m+KmHQBWf7g2rYwVABYYIQRK80ZnJepm4voxGHdOqvWnW7xcJ+pz2Anoz4lwnrDbvi6A22QsVASh1sYH8+J8BRSDuYs46/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mzh/RyB7UEf4aK+Wv+C3nY0FjNc1o5fovJuA0KAHw68=;
 b=R6r69xEEhJCqe7UE6aRklLuZINPdcphKVlOG++2IIJ1S04ErtexNwGX1aeKHiIkU/qDTAegmWu8vCzPSMS/PQcpGkBOMsgCdlXjY4Lg+GWQHXQDeJym3L/FsHhiUPUD0u7rJQAnvmbDaIXwZ6re9d2LFGMixuUg6t0IGGTRvcIIFvWLrQrScMcX3ZowQL61lRuus/23yy6r+xt06xkSfnNHvxiZTltU5/ufS+pnoNNi2SkNV0cyDCI9y5HKXF3UgOGhOdaKG3ttmE6lin1RVspYVRhbBJ4+lzyyw/iovBaeQSsxEogCKWLb/GRUT8YBlog0HrS1wMsw8nPgFO0YPZA==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY0P300MB0483.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:280::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.16; Wed, 7 Oct 2026 17:45:52 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0496.015; Wed, 7 Oct 2026
 17:45:52 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Thu,  8 Oct 2026 01:45:25 +0800
Message-ID: <SY8P300MB00411684A8A44ED2157BB57AB5942@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
X-Change-ID: 20261007-visionfive2-bump-linux-version-0de383d488d3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3546; i=tfx2001@outlook.com;
 h=from:subject:message-id; bh=v2AL5rlB63U2meg6SGp2o52Bsb5rxUSC1h4Gp2N0Cd8=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBqxoU0LrODU/YhzMjekP5ChQ+CyC8bklUNjf/zy
 T4VZaw6bziJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCasaFNAAKCRAcD62l0/wL
 2v75EACWKn68nZsVGw9d/h5gn/NENsVfz9txIFwoUUjgcWmz8ycg4YrtWGBRNc5wQ1mzs2tWJz1
 vxLdfVmxs+lYQkOmB02aRzvnTOxJxBXZk19Uurt+Mt2TAPHgAydPhRub/WtC6J2dEja5VjXsEGo
 rDY/BBDCN8lfU0DQEUuQn58UjoyZa8fAYabJfp55Z/EH56KGpvSvU2fItE0KxnenQNifIiQGHPA
 yfhbutAKeWuBDy5CT+beXH1msUI56TSEuyftbABMlhgpWYYDyYcVd4JtWGSzFo7h8tOX/7JtuAx
 yf4kTNYu/o9vSg12TQfLZqSl4ca9rgnxhRn4jxTWCu4ifV+o8/pMbRfGtCy0NdKZ+c80ZYmFkwF
 R/fEZ/6AD87pWuQdeNHLCCJPZ86gfdRXIr31TYXoLTo4ZjVMMx5s3WuTh03iX3oPHS47z5wHB85
 kf8JM1ik2N3I4um7zKxRntDwURX+UpCuK7K8VG7Ao15WK2rqHiPMQ3PWJXHDpUXscdHKwRTBiu6
 kUOqT/kU7jOUkckBM90qZaBu5LwxgHqIV0oDDLU3pRG82XastJVlgPBWuWFTskIqAJhdnJBDGAH
 uabAAWrN5TBcpo5/WT+I6GOa4xKj0Qrbpk9n6cyO3AztHoVzd5vTHdHMMQ8oXUommQ9wLHiIbpO
 apfdK3j2HqYaE6Q==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: SI2PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::12) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261008-visionfive2-bump-linux-version-v1-1-08ce0086a369@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY0P300MB0483:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a22d401-17a9-4507-75e3-08df249ad4a7
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|24021099003|6090799003|5062599005|260925184616899003|51005399006|5072599009|23021999003|15080799012|12121999013|25010399006|19110799012|8060799015|26104999009|3412199025|440099028|4302099013|1602099012|40105399003|2607281247196008|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGpNaUxCSk9kOTV5RllyRjl1cTkveUk3VzNpMUo5ZFBmSFJGZnlwWGI2bmVV?=
 =?utf-8?B?d25iUG1vWHUyNnRHNUxrZEYyOEZYMklxTEVmODQyVjVQWkVzVGdxRE43OE1N?=
 =?utf-8?B?b3JwMnNJZUN1Tm5SS1JvRG5INlVBTlgyaTk4RXJvbjd5bkZmUCtkNERsdmtV?=
 =?utf-8?B?SE9BSG02MEdXejBHci9ISU8xWDZHV2NPK3FFRFgyL0twdUVJWUEzemZUZFpw?=
 =?utf-8?B?UUpNdkRzbXNpZ1ZkK0Izd0YxUU9QTTJ5MVVSbDE5VC9DOW1ZVGJTUXM5c2pz?=
 =?utf-8?B?eFhsTkFLWWZOOUtWUU1PTEhQUVFIWGNwQUp2c1dSNXJsTTNKWGZKOTBZdDZE?=
 =?utf-8?B?V0ZPQ0hoaUx3YUJKUmJVMWlQTzVTTmJVREZIOGhvT1k5cVBtK0VZcUxQNHZC?=
 =?utf-8?B?K09UZDdYRFdQYmh1WHk4UkxockRRZ0lKOG5CM29QZExmd3gzZ0hXM0FSSEI0?=
 =?utf-8?B?NWRlUWtVN25sRi9kUlhTQkdLeGxZTVcxbVRvWjZ5SDNROVZwcTdJRDB0MHJK?=
 =?utf-8?B?ZnJkUzNTcGg3VDlNVFl4OGpkQ0JEWnlsMTlMaERtZlpwcWdyWWxLdlVjUEtq?=
 =?utf-8?B?KzFxZndmSjUzZnBFbGVZUDZUZUk2bkJqajlFalhsNi8wQjdxUXlTYTQ0WjMy?=
 =?utf-8?B?OXl2L0ZiZWtIR09zdFRHQnEwS2tsSlU1ek1jQzhRMkdOemdnbnVPNzk0NG9K?=
 =?utf-8?B?WUhHZGxFd0lFVkJ2ekVHWHlBUzMwOXR5ZGRZdis4UWYvems0Y1dUdUhYcWlI?=
 =?utf-8?B?ekFmK1NoV3lUVnkwNFlDNnplY2prYUhMcjFyTHVWMEtuTTgwQzY2allyQ1VW?=
 =?utf-8?B?eDNDNzlyM2QwdHh1WXlFVEpDcU1rM3IrWitTejJSMzZCb0tYcXdQMU54UDdK?=
 =?utf-8?B?SGI2dWdvemlTVlc0QmpFdnJRczJjRURmdUl6cEt0SFV2NjFNSThZeWo1Q1d3?=
 =?utf-8?B?UFNETE5OM2xLczQ2VmxvSHFLR1phYXQ4Qk05eTUxQys2NlFYTHgxYUtaTEht?=
 =?utf-8?B?dU5xTW1ocEJBQjA1dGJYK3FkdHFaSUdGcGVFdlBZemlqNnFmY3lTTTMwZTNO?=
 =?utf-8?B?M012M1BFWlpHTm9rZEpVYmpaK2F0MWxOeFRubmxhS1djVllablhJbXozaWNz?=
 =?utf-8?B?dW5KbEs1T2hMbnAyUTRJSlRmYWk0eDF2ZkFTUnA2R1hRSFlyNndLYU9lZHJr?=
 =?utf-8?B?NE5tS3V0Tloyc2ZsVDRmcCtmWmM4TGNKMW5xano4ZHhIM2NnU3lNem85WERx?=
 =?utf-8?B?OThGRVhuRHcvRG1taVlTWElxZ2Y4QW5qdDZLVUlILzk5YWM1ZUVpa3pIUC9w?=
 =?utf-8?B?Y2ttNDJqSUFUeXowdml1NVVEc3VOaEk4cnllK0diaW9aWENpczZISWxoWnB4?=
 =?utf-8?B?LzUzcHdEeWxDUHBQQ0pwZjlLSjU2RHIzWUdLeVhsWitIV0xINXBIeHFIWThZ?=
 =?utf-8?B?OFYwVTdvTFZJMUhMaEEzYVdnMm5LUk9YczhOdkRCUGs0WnhMRUt2eHR4bnVF?=
 =?utf-8?B?NmFRRlk0WDNaYVhqNUVoU2NKNVdxU0hhVEExZUx3MHU5Tkw4ekZKdUtod3Vq?=
 =?utf-8?B?OEUrUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFVwQmdwenZDVGlQK3lBR2hpZ2R3ekhmV3hQVjZDeWlnb05YcjlEYklFUVZs?=
 =?utf-8?B?NUFGUEczcldKRTlhYkdOYUJqRjkydTNhcWNyUk5WcDFSZ2dSOTdHRnpYU0xj?=
 =?utf-8?B?T280QXR5Rk1pdm9PaERkRGMyL1NSVmZ2bzM5MmkwUlJBbG5LSFp1UlNnclB3?=
 =?utf-8?B?YkszS0phelRsYmJYMDUzWHVtTEQxVFFUbmVkK2ZXS1lNZ09ONkRad2x1VFVK?=
 =?utf-8?B?ZzcrZisrMGhiRWZKVGRMWmM1cEJadzVlUWlDeEo1djVLdGVlM1NpbFpTTWhn?=
 =?utf-8?B?dURBTDNuRFRPek5GeWdySzBNTnVrNnJCTGpMY1lvdHVqaVFURUl0WGhpNVVm?=
 =?utf-8?B?OW1YVEdDVWg2Nm8yMnBXcjZJUE55eEpab01Gb0xzWk1QUGUrNGFKSGdaZFU0?=
 =?utf-8?B?Q3dZQSsrZkg1NWxhQ21JT1VkSGZYVW5DNy9HUW1NcitNS29XNUp5THZzdC93?=
 =?utf-8?B?SEVVNGJzSWNRTmdCL0ZwL045b3Z1bFl4ZmNMZEgremJVd0xueXlmdGJFTHl6?=
 =?utf-8?B?R1N6THBvSThOSkVsSTNnWWhmRHBneHBLR2pEUWMxL2t4emtGWkR6bVgxRnFI?=
 =?utf-8?B?ZWhQTDdxRzBFTkl1bHdsTXJTREV2VVVmT29NSkgzWWJuQmZRSU1uN1QyaS95?=
 =?utf-8?B?aGt2VlVCbXBkYTd2dVExS3dZQTFBcTY2bGFXR0doSkx5UmovRFB1dmRiTG55?=
 =?utf-8?B?YVVhOWsxeXlQcEp5ZDBCbVZZekhxbVRRajB6ZkhQZHVxdy9KWEdYek5ndFNa?=
 =?utf-8?B?VEM3RUxjdURiVTVPNk83U094eTQzS3hsRE4wTDcyWWhPa0EyT0d5cjNWbEcv?=
 =?utf-8?B?YVFWYTZRekdqZEVvZW1yMXZIRHZHZy8yVzlBK0ZCQzFnZnB0RE5aMGNNN3lU?=
 =?utf-8?B?dVVVcmU4RjNBNDViSnFIY29PTExXZHdCeW8zL3k2Q0daN0tnNEY1Z3k4M1BK?=
 =?utf-8?B?NURKQmZ5ajR2UEs4RVBBMldoRjdVLzdlL2dTUHN6YlZ4c2c3aWk4SHkzb0sy?=
 =?utf-8?B?Zi92TGZCSTlsV0Zscmp5WDFRZ3I4ZktxTnJVZE1sUThhMG9oTHZuZmRkVEcx?=
 =?utf-8?B?RFJTbmJpZlVDSXQxZ2ZYdkpNYTZWNFJtcEpPMFVwOWlrcnV6Vjc3TTl2RU9v?=
 =?utf-8?B?S0htZEppdGpHYTJqV0VnOVl1WDJaRjlZdnpEWVpOZGlyWGQvMGh6bml1ZkF5?=
 =?utf-8?B?R0g2S1BraSt5aS9yTThyRTJ0aW9yZVdaS2hEWFVTNS8wNmpwaWVxeXFQbG50?=
 =?utf-8?B?RmJINlNkUTJPV2dRQ1NqdmZjRTRhaExhQzVHcW1VTiszRSs0dkZsN0lnSCtL?=
 =?utf-8?B?NTNlcjc2TkNIY09TUTByVVZOQm9jTUhENko5ZGFOOCtDNWlyNEIxRlNlZXRs?=
 =?utf-8?B?dm1vWmgxSEF6ZmxOVEV1T1ZPeDRvbGNCb24rZE1LWXROSjV1N3BBUzRQK3hx?=
 =?utf-8?B?bjhZRDdQdk1CVWFnQjk1STEwWkhkbVVKSXZ3QTY3MUo0R244YnVSQzJLc0Fw?=
 =?utf-8?B?QmhlRFRxbmdYQ2l6YU1WVVFwOGExSEZmNWFSd2VQSmdKbnJjUmQrVWNNdCtU?=
 =?utf-8?B?NXo4ckllNklqTE1SNVA2R3YxRE9lYkd3R0tRNmtiY25TT1NFSXM5eXFtUjdj?=
 =?utf-8?B?SjFJdGZEV0t1Q1NUaXdjQktDM0ZzTDBTcUpMaFhCVmp1azUxU2EvbUlZNWJH?=
 =?utf-8?B?UXJoQllRS0Z0WEJxRktLKy8zd2J5VkFxVkI5MWY2SDU5a1g5NnZoN3ZwdWxC?=
 =?utf-8?B?M3ZvVEZ6SkZzb2FPL0s3VzFwQXc2MVRpWFBEZEl3MlZSUGJzU0prZ0l1bUpN?=
 =?utf-8?B?R3dXcHRKRUJ5STIwc3pNMFFSZXNSL2hYRTNuQVg0UHFLVWtYUXNwQlBSbVM0?=
 =?utf-8?Q?Sc6EVOH09W7V7?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a22d401-17a9-4507-75e3-08df249ad4a7
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 17:45:52.5164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY0P300MB0483
Subject: [Buildroot] [PATCH] configs/visionfive2_defconfig: bump Linux to
 6.18.52
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

When running iperf3 with Linux 6.18.51 on VisionFive 2, one CPU core
stays at 100% load during the test. The iperf3 server log shows the
throughput is limited to approximately 793 Mbits/sec:

[ ID] Interval           Transfer     Bitrate
[  5]   0.00-10.01  sec   945 MBytes   793 Mbits/sec                  receiver

The regression was introduced in Linux 6.14 by commit df542f669307
("net: stmmac: Switch to zero-copy in non-XDP RX path"). It leads to
misaligned access exceptions when parsing packet headers. During the
iperf3 test, perf stat reported approximately 9.6 million alignment
faults over 5 seconds:

$ perf stat -a -e alignment-faults -- sleep 5

 Performance counter stats for 'system wide':

           9620073      alignment-faults

       5.029337000 seconds time elapsed

The kernel must emulate these unaligned accesses, resulting in
significant overhead.

The Linux kernel CVE team assigned CVE-2026-90059 to this issue [1].

Bump kernel to 6.18.52, which contains the fix for this issue.

[1] https://lore.kernel.org/all/2026091704-CVE-2026-90059-36e6@gregkh

Fixes: 98aa14a186e1 ("configs/visionfive2: bump Linux to 6.18.51, U-Boot to 2026.07, and OpenSBI to 1.8.1")
Assisted-by: Codex:GPT-6.1-Sol
Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
Hello all,

This patch fixes a performance issue on the VisionFive 2, caused by
misaligned access when the Linux kernel network stack parses packet
headers.

I noticed this issue while running iperf3 tests on the VisionFive 2
board. I captured perf data [1] and analyzed it with LLM, which
quickly identified the relevant upstream kernel commit and the
corresponding lore archive [2].

I rebuilt Linux 6.18.51 with the fix patch [3] applied and retested; the
issue was resolved. So I am pretty sure this issue was introduced by the
commit identified by the LLM.

[1] https://gist.github.com/tfx2001/f1f10ee1274acb7063ef1def5f2b119a
[2] https://lore.kernel.org/all/2026091704-CVE-2026-90059-36e6@gregkh/
[3] https://git.kernel.org/stable/c/2ea42936416b29cca42b2c7bc7d3d3768f77c199
---
 board/visionfive2/patches/linux/linux.hash | 2 +-
 configs/visionfive2_defconfig              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/visionfive2/patches/linux/linux.hash b/board/visionfive2/patches/linux/linux.hash
index b2cfc9b7e7..1e58cd0b9f 100644
--- a/board/visionfive2/patches/linux/linux.hash
+++ b/board/visionfive2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ba2f60f858bf4d1f929101faa356c93dc8b925b17aaa9f95eabd4627758df613  linux-6.18.51.tar.xz
+sha256  2b69564f7d4fea0c859b1959ba33709ee6e9139bd100e30a853b57159a8221b8  linux-6.18.52.tar.xz
diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index 7ce605b84b..bfe5e42cc5 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_OVERLAY="board/visionfive2/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/visionfive2/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.51"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.52"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/visionfive2/linux_defconfig"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y

---
base-commit: 1ab8f8ef5af5a170a1ecbea3209ca39afd49194c
change-id: 20261007-visionfive2-bump-linux-version-0de383d488d3

Best regards,
--  
Fengwei Tan <tfx2001@outlook.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
