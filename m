Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7067C3DA7A
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 17:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A55F60791;
	Wed, 14 Oct 2026 17:10:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9UDpaCCO_Gga; Wed, 14 Oct 2026 17:10:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 66A2F607CF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791997856;
	b=nyckWRCqAnwuHYD12Y3LD58/dmzm+CCq11+SkQlnXvIWg3HoY9RyCwhjbGAAxZNknxjF
	 VpP777Wt5jj0iBlVyUvRPPlzqRRFbkCZ1MeCc0yVoebcN57k2qep97QR8TCtoJcCMYDO9
	 9OYdGSD74QtvAF/u+Yg3S4zxQXNdA3IuzxAfgt/y47Iz6HQIeWN0UNQK/uRKlNvQNG9aq
	 9TBObyAWMFBjciibL5MlH7GZXL6bfFssaquY44BFHhySbSlljeMcMAzufuXzz3bAVZVpo
	 /9fG/ZPU7FXVU0BpfUqeO/QzzeEyXdDuqdfQ8Lf/vHhzAQer2VemEJqWr3yx2F1nXrw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791997856;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Received:Received:Received:Date:
	 Message-ID:MIME-Version:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=WENZOb72QlsSQ1/KvAXHlUi7SOnTu/JInlFFD8c9K7o=;
	b=P+eQR0zpCC+eStl5eTxmtV1MTRWZf08Zzcu+wvdrCmauiuBdLHQUmdlsnu2+UueKBNCU
	 p/ns2RdoFVt91g6cEobO5I0lI8vs8tAT0wbDYD1oo2nGwCM7onSMR+RMroDZotVVSJKd4
	 CH8KiUi1JfiFzcV9uBojKHLTZVrlwvt4R8S16pMCXemnqkNbpnuQBD/pj5adAG0Ib9TW5
	 yz3gjddc/Oy6s3lHfDAkyGGJc3nY/RMorsdAMrdNQKG/kvfwN5ke7jZKWPKMVIyRw8kTd
	 r1ESODeI5abmCw0U9lIw1xNabcWAFvWtj7s+hJF5ZZWzmtpIdYOSiU/KRBJah8ehhHw==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791997856;
	bh=WENZOb72QlsSQ1/KvAXHlUi7SOnTu/JInlFFD8c9K7o=;
	h=Date:To:CC:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=YltpDL366MlCjUdnCDTY1HC7I9Q02MDwpy0wFmNcxAqFFT6bJBqV1ESgIll3tebYz
	 WnaXmybHCuQovCmCTJKtWvnOb8aqrrggpX7rzTYyQk0aY+wND1LieXt9HINIzM0u+9
	 +XDrq/Q2PBgIfcmljeT7GkM6RHT8H9EqCJiJ4aaR8qpRefrxpWBil6BjTfOMZuUmSH
	 KPPpx5R6Qg+713ZQ36DCKKQhpUMsCkXSEqY/imeuujRB29j0zDdT8KTFTF6/WXPHWH
	 CeCutYzXUGtH250eFEgGuKxd/MhGLqE2mhrlSmyrcjd8NfSkcQxArQTKQOKjP95vG9
	 uUIoCfkXFq8kQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66A2F607CF;
	Wed, 14 Oct 2026 17:10:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C961CA58
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 17:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB22B40363
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 17:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNDD55FYAqp5 for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 17:10:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 38B06401A3
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791997854;
 b=F3tqrqGagW8PgnDqYe56wE5DzJsQ/Ndzv9jqcYMzv0ve+XTedrzvqVzYXEBLFywibzsv
 xCz2FXWcM291EopeDenixUILr2mLuORV8OZ+7S7/15kMHKpmjcfsGd/zeS1NwBT7RbETK
 pSoP/VOUfyaPP4M0S8uAGb7+dFua1OXoKgU1EixMqJeYWmTZYDLn/NEAxNMuZcrYk1/zo
 NhJM0P496cM/BNyz8YEXhZsAmFNXILKSvZeeZvOt1b/kmqPfdMpNXp0NOkAT/4u+44pqF
 FJ/wDqfxeOd3bOV8pGhpaIIQKnRSNkg7e5HY4uy0kP6SqU9eGPRzm3vvtPTfQcZog1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791997854;
 h=Received-SPF:Received:DKIM-Signature:Received:DKIM-Signature:
 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
 Received:Received:Received:Received:Received:From:Subject:Date:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
 X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:X-EOPAttributedMessage:
 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-Id:
 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-FromEntityHeader:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
 bh=h2Ai8xBygr+iz5zTyOy/MRoOwprjEWV9JS1N5Rbr5pM=;
 b=h4wG/BIwTe5pbLKdNvBbpaI9AC5D8Me2u8nw1MB9187P5SAtf5VMp1oZdBnWzoZSYQrZ
 EB0LV2MY7sLvNz9dC6F5V4uq7BTnKGbSPeEi95M5RLlXoL8qj5GLn3bogIy2IkAKBjYIn
 r8G/iT3PQn8vZitqDuh8wkkI4Fe+jdezi4s4B/7TIzrxvtV/UJlUyWRU4boHBz9nkAtbJ
 w2c8lwnkrM7puDxp2oCiHnL1SQEjVmWTCeA7TZZuiWIkJ81jOzPgZ5B7NtOFjBK7z/iU0
 A/V+hUlfi/kzaCkPkZRx/QISCZRiciFNa52GVHtjwJpuy3IEk+iSZyN3MscRb3mAbCw==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=ti.com;
 dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=proofpoint-05-2026 header.b="Kai79/l1"; 
 dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com
 header.b=is9+IETG; 
 arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.154.28;
 helo=mx0b-0002e601.pphosted.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com
 [148.163.154.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38B06401A3
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 17:10:52 +0000 (UTC)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
 by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69EEauQt3893206; Wed, 14 Oct 2026 12:10:51 -0500
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
 by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h9ys5573j-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2026 12:10:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWw7cuK6tLV6nKBc0A4V0YGBdZCYAr1aq71qHDF2dE7kzdn3xfEY4yTaQ0zbA87Hw4PTjr5OLBEMJZo8f3/0ygTfqTteYIZO76u/oRfGEazgbkZ0BjZ2JX52WUx5v4ZqFKniBkv31yKBJexzAlpqBIbCfgJ8ihikzhh5jsRjUY2TzJYKVqtGlzKlA0RNDSpnFV4ne8FniOS/9fY1byPy8Xog3HzRXLE4AEHNSWNfVeeZMXu766YQ5GR+jhifLigoZwsngM1vaHvJRseDkR4r9Kd48hhFy/XNx5EB1BUJU/V2Lc4DIdoA+X0Tl07lyABcH4gLJD6fUlftBV3y18GxlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2Ai8xBygr+iz5zTyOy/MRoOwprjEWV9JS1N5Rbr5pM=;
 b=SONEqQsUqulZFhSBUjKurNNA14jP+mesHFxWHVVpZA4Um3LxLoGDyGdA+Zu5Ik0sOnIJUYxGHBveEJPam3GLK7pYxtdvpDJ5i5wnd0TjcFSMiB2npgQaiUbGOWbbAKquBZqj9ZmdprYmj2URZmDedB98dBlcCm7VtlRTt/MS0unCMSUCLTRVxYVf6eU8nwyUQKXTVwJnYeCs5QXEG2Zrd2yFB3WKrF9DfZ1wsFHWI0BB6LsfwNMWGWzMhaOIgDiJqeTFkkVTZjqu3NQEgQ1hqWTDgLrIl3vVvCMAgxP0+Mnq41rHaVDf4JV2xFsuCVc0JhpJtY0JU1KGenZZHI/c0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
Received: from MW4P222CA0011.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::16)
 by PH0PR10MB4757.namprd10.prod.outlook.com (2603:10b6:510:3f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 17:10:48 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:303:114:cafe::98) by MW4P222CA0011.outlook.office365.com
 (2603:10b6:303:114::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 17:10:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 17:10:47 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 12:10:15 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 12:10:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 14 Oct 2026 12:10:15 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.75.137])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69EHAF5T1775690;
 Wed, 14 Oct 2026 12:10:15 -0500
Date: Wed, 14 Oct 2026 12:10:10 -0500
Message-ID: <20261014-uboot-fixes-v1-0-2676fd37a97a@ti.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHK3z2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0ND3dKk/PwS3bTMitRiXWNjUyNjE/NUo1RDQyWgjoKiVLAEUEN0LIR
 fXJqUlZpcAjJCqbYWAD4+721vAAAA
X-Change-ID: 20261011-uboot-fixes-3352347e2e11
To: <buildroot@buildroot.org>
CC: Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>, "Bryan
 Brattlof" <bb@ti.com>
X-Mailer: b4 0.15.2
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|PH0PR10MB4757:EE_
X-MS-Office365-Filtering-Correlation-Id: d31dcebb-94ab-4b07-7f4e-08df2a16175e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|10067099003|18002099003|261009221227099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: wO4cHYwSigLOEX04hMFoNhG/TEt9ZUPxViHZynay/dCyseOO3Uq3nFOu0h6YitoiogBOnNIitaPr9RRX6+Mi//+fFqZW7DitltS+z3xC2P5qpbHUO8tJGcS4hbcqV9bVGtTEol7qhX4rPhdWUALu98kMvyVJWiZHHeKa49KcNs1wYVNbhr5GMxlKCEh45cuBBAoWXTwqOcgeE6FQENU7dHdMsuO/HOx8FW0UXKVjMQ8gHdInTqF2yC9zSjUvGsKY6sHXYmvzl/mKvGldDpCZwsDHw6cZ16iX+TsW/YQGO0ZYsTud0ynTt74duzr7JPqhP9PvI0sItFahd9d2WhmbsAhgkqXgsbJQxOxO6seXTSvh+peWgQacefn/VgXHB3UbSx/fCnqLD4RpLHZFiYcwkas3xSLM6W9O3pPTtvff21v8hWsg4ZzoUyQAS4cpUY36Q2aykEY6BhVsb+DWa8o0mjrFlu1I2DsDSyXpx8Zef7azkfsj2kxbUyT4TtFsocoOeovzgo2kgneDfhBWjfkLuQCqR/16Gvwj5imPVqOXEUL/9EMuk+9li0NgYbYXK3+SRgDACkRsRKCywIqU6j8KwWNscd+NeDoHkMO9g7huThQWVmntEEA6Iso7O4HzIpPSgKaWz1XcQ/J5vr1h5RRE6awTOhHVfqQpt/iuDGnYhA/cpITjKBnXp56ckL7q0MKz/pN0rr19qbzaCNKp2NQnOQ==
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(10067099003)(18002099003)(261009221227099003)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jXtf2KbUxojg/MaXjiRgh8gHkKgf7snraUVN1T1HHRotpJ+a3FHqRGPJ8hNIj8TK6IZu9T8t3IcU9SZP8eIXl5UdZCPw8oUqv6NCDtqizG5jt5OO3rJaUHxioq1QTS+8Af03C+9ec0SbWy4HVUoskF4e9+qHiZXSQKaHRfQsh0SeTSIXoYahPlRzUIEiGxm/fiULlAdvIs0foaXo+90OQJhc/yjnwdcaBgnBMztrJew7pzgHhYA9n90JMLdCBkzT0J7c7sbhERLFOJpTXh4Xn7B/TvKy/opEQHm1vmSNoZG51ZyUa6JGyDLmTsxwmV2e2pgT2zFv95hELhs9fMtYFBMGFTuKX/JWZiVTLBNp2XrCm/4BV+4/DtH+KcUHPj6UTvgmd4reDspX1l3GmxdcNszyFDm4GqPbcKivfjHfN/i3ulUHTS8Q4m40+ptoS/Lm
X-Exchange-RoutingPolicyChecked: bVXi9N+Ohng/eZWYRXQy+vuZI9pYJYjBSOv7e7shkCpooK8zl6pBjJU+0IhrWNt1Ronew0prIUkboUwxespFQ13uHvrWMSnSTg2dJtXNdufANNNI6703ONvuKTzU5KSYX7M2N+jPgVQ1dIq9+W33lnmetaBLC+vE6d4E74nORLXcYkx47jKGKFnU8LqVixGtfutoh8qrmWSeh8HucTmShvFcx0XxuzAEmo9D1sjpV6xJb0ITwRWx3FfikliL++8fFDzaD84pOgUWua7DaTm7yBloJo+3UErFjluOyTekwsmszheXjXL4y/zsvH7whedwTtf+aQQmNx4ttAYhQV5GNA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 17:10:47.8324 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d31dcebb-94ab-4b07-7f4e-08df2a16175e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4757
X-Authority-Analysis: v=2.4 cv=ANGCXYlm c=1 sm=1 tr=0 ts=6acfb79b cx=c_pps
 a=ht+bKkBNmLq2ln/DE6MnYA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=olwg2ZC89XoP5fOhcdUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: S0V3AlZZ6oH_gfzQe_SvQrmmJ1cmTVUH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfXxH/bs5WauJmC
 KjeRqOXJKfLUieJcofVb8abBkSx4YGnUJ9FRNRlJBOESh8UhsfpKK/XAReVqhwh5J/B2wlXfDhq
 YiJZQaI5xQP0+lrauPPup7BSNoxZ/HU=
X-Proofpoint-GUID: S0V3AlZZ6oH_gfzQe_SvQrmmJ1cmTVUH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfX6RQTzepb270r
 XqBgWsI+Kzlc23z6fvE9MMl9yJwNM4OZoVfJryqj0s9phc+erVndYitF09C5DlkDhXZXn47fi20
 y88ltr+akXpJQr/FaOvHxlxoNvcgHsjA17Gfveasu76xvi3p7e3K9J2r61YCIsLI06MXMnboF4T
 NclhQnNK8NMubX8rpxuexe+edvDNOd4G3WlrCaMPu3VpYiY7Vg7pMlqhcIePwkvmgJspk6x6b3/
 kjQFerM9OB/Y/yjWq5gK+V1eLNpE689KEN+t51YC2lcm9PMt4kY/j6jgw/SyPpKsXaSshjBp5Sj
 ojYYp07IwRbvu9kHjeDWwALt2y6fgoHmO7LhvVq7M3wa9y62wdZgAKdQMNrz1G85V7lgyBjkkhm
 YuYDBcaZwc8d+UfYKLaheGeJIxGhYqVjVPXkZh+PWDZRaJtdhG8hqCRlkv4jyFuFL2vpEkvUEtV
 cxZg1cTHDZi3sCmnIqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 phishscore=0
 clxscore=1011 impostorscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140068
Subject: [Buildroot] [PATCH 0/4] Version bump for TI reference boards and
 beagleplay
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Everyone!

This small series bumps the baseport versions to their stable releases
for TI's K3 boards along with the beagleplay.

There is a patch we need to backport in U-Boot to remove the Python 2
macros it's still using to be able to generate the final images using
U-Boot's binman system. I'm not sure this is the best way to do this but
I'm open to suggestions :)

Happy Hacking
~Bryan

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Bryan Brattlof (4):
      configs/ti_am62ax_sk: bump tfa, linux and uboot versions
      configs/ti_am62px_sk: bump tfa, linux and uboot versions
      configs/ti_am64x_sk: bump tfa, linux and uboot versions
      configs/beagleplay: bump tfa, linux and uboot versions

 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +
 .../beagleplay/patches/linux/linux.hash            |  4 +-
 ...place-removed-SWIG-Python-2-compatibility.patch | 65 ++++++++++++++++++++++
 ...place-removed-SWIG-Python-2-compatibility.patch | 65 ++++++++++++++++++++++
 .../beagleplay/patches/uboot/uboot.hash            |  2 +-
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +-
 board/ti/am62ax-sk/patches/linux/linux.hash        |  2 +-
 ...place-removed-SWIG-Python-2-compatibility.patch | 65 ++++++++++++++++++++++
 ...place-removed-SWIG-Python-2-compatibility.patch | 65 ++++++++++++++++++++++
 board/ti/am62ax-sk/patches/uboot/uboot.hash        |  2 +-
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +-
 board/ti/am62px-sk/patches/linux/linux.hash        |  2 +-
 ...place-removed-SWIG-Python-2-compatibility.patch | 65 ++++++++++++++++++++++
 ...place-removed-SWIG-Python-2-compatibility.patch | 65 ++++++++++++++++++++++
 board/ti/am62px-sk/patches/uboot/uboot.hash        |  2 +-
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +-
 board/ti/am64x-sk/patches/linux/linux.hash         |  2 +-
 ...place-removed-SWIG-Python-2-compatibility.patch | 65 ++++++++++++++++++++++
 ...place-removed-SWIG-Python-2-compatibility.patch | 65 ++++++++++++++++++++++
 board/ti/am64x-sk/patches/uboot/uboot.hash         |  2 +-
 configs/beagleplay_defconfig                       |  9 +--
 configs/ti_am62ax_sk_defconfig                     |  8 +--
 configs/ti_am62px_sk_defconfig                     |  8 +--
 configs/ti_am64x_sk_defconfig                      | 10 ++--
 24 files changed, 552 insertions(+), 29 deletions(-)
---
base-commit: acbcc911b71f93bb7ea9400aa19713f3464c8e69
change-id: 20261011-uboot-fixes-3352347e2e11

Best regards,
--  
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
