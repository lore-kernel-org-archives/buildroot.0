Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A13C98307
	for <buildroot@archiver.kernel.org>; Wed, 23 Sep 2026 10:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80ADC40564;
	Wed, 23 Sep 2026 10:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SUZ25qiMn7OE; Wed, 23 Sep 2026 10:53:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 35917405AB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790160809;
	b=iGn/pa7Ecw1pyO2v3seMn9WYZ5gvDUBvjecUClQg4HDT8tLBH3ely62SRkPs0Ia//crO
	 iQi4wNdjbYtQAlwE3PQM3fo2vF586aLX3TZ2ZyyzPV3eLQ9/xksfUdpyN2PLnthvs4PSs
	 3+P4pBte8RcqLSW5VBEWs5tlvrF8pPKo0/AEA6uOkwrRUbwPoFPifPa+cBrKK67th7tJe
	 KAFH20Nz6KvIez6yrN7yZTXyImX58xduDkm3oEybP22rmfKXv5HsggTXI0ZzF0StFtelq
	 7h7NGFd8W6aFYgvivCRJv0UmfQkcHOI8URHtqOVzk4kByrcCSj5FthqfTv9Ce7c1H/g==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790160809;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Received:Received:Received:To:CC:Date:
	 Message-ID:X-Mailer:MIME-Version:X-EOPAttributedMessage:
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xMi9yAS85vD9nyUAmOdanhRgiZgOgPoBGE47g3LLAfU=;
	b=cLTi6SktN8u37UWXVwUo3Omq9NqsLVDVSDQiV1GK+FfiYx7RX9nUXEWocERB4CGt4zXy
	 iUzInDQOxr1n+4P3mqnlGPXrlyOjLVEjmIhlAxDl5dhiGa/zbxYPh9BQc/iv0sk+AyrZ3
	 5eBGFtG2Oca8ovt9d1vNFKT9oE30uqj6iiVlkfo0ccGQPKcfRniHqy/TXRh8dovOoYEn2
	 7UBa53LG2Kh1T/RHxTeUCgBndWA2UzfBlMx7U80e1vubboYIjbuZX4cQdq1I4pJAo6Z4M
	 E2ML3A5y3YmT2TvTaHYdIhvTvgUXt1oIgf8ZIr0OvZ3YGEiYT6gb98U1UHaW42mHmTw==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790160809;
	bh=xMi9yAS85vD9nyUAmOdanhRgiZgOgPoBGE47g3LLAfU=;
	h=To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=XiskrTDZm75F9fyPaqpjC32TZ/8FPez1UOsd0Fyxu/sOHuMT/U4ssbcHFOs6h0TBw
	 fz5WVQkJRRL0SRjbOtBvHm3wsnm/kE814ncI/vjTF1Uc5tHDc0PGb4sPwFf/bO6z6A
	 gVM2sHqnshC1C7s8Xp/II79lvPfsklHfmJssGM0Ua/wuiBq19csmhJXWAzkFUept08
	 EMV00qLXMSrS4LMCq5lTjn6WiJhVcVj3kZ0gra7kQF1RyE/i+k/uw9naLudwUfFSEI
	 oOsflySnXeANRMAUwezOu4YAgemBO80s9ijy418y9nBTKiPv4Cyt2gkNrt1irTY1tb
	 Khh290wf41eig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35917405AB;
	Wed, 23 Sep 2026 10:53:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7340194
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 10:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2DBF80C6A
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 10:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LL1aBs5Hczr for <buildroot@buildroot.org>;
 Wed, 23 Sep 2026 10:53:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6480780C5D
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790160805;
 b=gEN8MW9KPhHbmlRIXrkJa7d6wU5SR0fD2i2tgyyKuDxT4h+WX2xcVNNVgamEohOE1YWM
 Keb9RPAj+JvK578hg9kIAPErc/Ve6yY3HwyHurXYBBM5gvzYpTkFJGHqJJbKX+kFeJc0G
 6fZbIlwCFGMFBtTrCIRHg4HBLj87YiFoM8WusfE+5qy4HX8rNxQz5yMdcNmmIKitV2u7G
 ywjC6qqqntBU68VL5mN/v34C8b4hMKLymghUq9zngnjJs7pp8RlTZdoKZ78KmAYBFNmpx
 5run9EXutz4PUMj267bQVLBdAqtYmFYUi5/3FXxgdC0Zru4UFh2OLM+Xj3hUhDTqxOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790160805;
 h=Received-SPF:Received:DKIM-Signature:Received:DKIM-Signature:
 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
 bh=H09qeq4DwAFLP07DeMmGDVz+rXkO+4QlOsxM4QgqQNo=;
 b=MABspCHttylNDIyNX1bj0DYoixJnqm+TCMTz3cFqNQwPHtXunf2dGEz2YcLe2INukAyn
 Fo5yR7nGCrftFEqH0Vhnlo5iTGvhBfN170ggoYE2U8f7C8tuvWhaedGKY8+FIftCCmuL3
 0C1V8n39t/wlomphzLoJJwqjtn/gyk+P065H5DPq9BAvOHK7d34JhznAycVgwvPYKgc36
 RPXNzN+IpH3PgKegWDy9yLOdbK61/BpNg9SjHby8/+/wpUhVsZiEFW29YKDJrxgMAbBoo
 3Nr0c4OFUpxmsO8/g5pq7y5EKiODKGHHFNSoUAQFHd83C+fJG3AYeE7s0PAU8D0Saow==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=ti.com; 
 dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=proofpoint-05-2026 header.b=JXmgz025; 
 dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=g3J50ksf; 
 arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.150.75;
 helo=mx0a-0002e601.pphosted.com; envelope-from=s-sadik@ti.com;
 receiver=<UNKNOWN> 
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com
 [148.163.150.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6480780C5D
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 10:53:24 +0000 (UTC)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
 by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68N8NKwm1611931;
 Wed, 23 Sep 2026 05:53:20 -0500
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012024.outbound.protection.outlook.com [52.101.53.24])
 by m0384305.ppops.net (PPS) with ESMTPS id 4gvb77rrwv-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 23 Sep 2026 05:53:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pM+h2bZDy5tpuZ/YppXSZbwTn6bEOOuohChSKDCGnjRAePd0SfKjlEifL6pScEs3eRmZGdxmHa0aJlLEDK2vq5Kdd31gUZxTJ4d3KgsOgYjBqidJCdH4ym2tW3Fqa7m43QbDj5vf4oFUmtz4cPZsmOpW59afACP3psr5nW6eca3820I2IwfjtE4VPf4yB9gYvF8kiRMR4kT6fABgE8ANHIpNDJ2ndudIc3sN9ABxodmHEoBJ42ddkbML7A/m5ADd3mncRTc3JTw4F2dLSDfZT9t1nzGwSUH7MGi3Qobwn9mA7sZag6WDAA6pFjHRBZcq5cJ5RXp6/m2hQcqICQ7YZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H09qeq4DwAFLP07DeMmGDVz+rXkO+4QlOsxM4QgqQNo=;
 b=r8XYF6/xHhvY9049yVPHBeyn0OOb1lWLo+3HJi0CLwoM4e/hWoF3Hw41m3rPLwxF46Crgix8s3dz6G+228YVtZs2tfGRA/UER5+SWSzmUyuDqmAoDIX0T0sSlQ4xhxQQZw/7r+NGdHo69VjDShXatVMEHzRdC++cuejoCsj9Q/2pJySY4KX+RKuKMozNejESaXdLE1QpWkXJuQSXcc/MctIAqvzIFolfhtiYFevRBgOt3mmPKzzqbQyFyu6euzLUNezvE1h5XEBkwGp0CcyzRf2J0nyo7NSEPtm71hXoy163pudrD4BTphbQU+ztIT4SVHXHk0E0svnNVv+/SOF3SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
Received: from BN9PR03CA0701.namprd03.prod.outlook.com (2603:10b6:408:ef::16)
 by SAVPR10MB997793.namprd10.prod.outlook.com (2603:10b6:806:4e9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 10:53:15 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:ef:cafe::9) by BN9PR03CA0701.outlook.office365.com
 (2603:10b6:408:ef::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 10:53:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.5 via Frontend Transport; Wed, 23 Sep 2026 10:53:14 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 05:52:46 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 05:52:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 05:52:46 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [10.24.52.210])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NAqhoH2768014;
 Wed, 23 Sep 2026 05:52:44 -0500
To: <buildroot@buildroot.org>
CC: Thomas Perale <thomas.perale@mind.be>, Arnout Vandecappelle
 <arnout@mind.be>, <thomas.petazzoni@bootlin.com>, Bajjuri Praneeth
 <praneeth@ti.com>, Prudhvi <prudhvi@ti.com>
Date: Wed, 23 Sep 2026 16:21:23 +0530
Message-ID: <20260923105122.659234-1-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|SAVPR10MB997793:EE_
X-MS-Office365-Filtering-Correlation-Id: d29f919f-e66c-4e98-4baa-08df1960de7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|10067099003|56012099006|5023799004|6133799003|3023799007|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: WXKGZvdEI6W160OiyZn3HYRHwCUEYBX5v0suAisH+oV7stXun3L1pperj4L3GDE/a1poefOHhw2OPBUFfY8uXJmvkY7mm92q7CNl2EhhDoPdCnMBGUxhSm0p/aaxEi0CrPb1gDf14eUD18b+A+mi8WfouzQnJ3aBOIpx+zx+10JByUCvhxze35z7ni0/wwlFAIae9JqP5LnTa44YlCGUK+Me6vQnJqOImeoo5YTYJiJxaJLNRVFjflRGPXIGfapbZmL4qL0ytfiJoptnKsr5HaRU+qBvFaBGiSE5v7fgqEIXrFqd74CD8585Kd7u+/740Yg8YlLGp+nHtC+iX2PJuuPbD/ejS9TjtYailTqJIlY9LUJYkNmS8O1uyphgD5k9yJZ8EtZO+v1NoDPXHf2pgOA+1gYQ2/UCcpZLyzPo7srUit9enHa9it42YX3REGDthvFyW3OYf6lU2sb3qpQpFY5KwgGGgl4A7AaGFKhwuE4ozVdVYG8LDDmfhl/7brm0JX999twJ7ZDhDQEknmZ77e6/pc8hUFsXmjrCGJ0sjeof2WAlW223WKVZ8gEsxhd6iZ8VeVmjlxiTzwAKIWn3yKKgfLvH0Dpd9TR01Sbr7b/u1WN0YtEoJqKSvs7QxEDacedciO4ku43qGj7A9v5NXQ==
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(10067099003)(56012099006)(5023799004)(6133799003)(3023799007)(18002099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MUFhTQykuIbG+JQmjNZhttMCbEOJ71mvvNKbWia/jcfGvcDOYEAGNxGuTNfYX+oKkFKQ+4icQMs40MIrum5IhsT+Ps8Z7cXMCgataqFJkr+KyysTxJ4Ydusb6H3MP7c2Ze0M7LOMNcnsC+ztgZ7kFUL3GRg+uKpyA8+nnagn1u5gH7WUA/TL8N5g3aUrcfkpox2OXqlr7doh0x6otHP1t3M7VMmbdgLF41q6ufc/8uoI5yHKrw4flnxobyMwRSqsGf61Zl/Pn0RMe1bk5kKRLbJO4n9efCPinIb+A9T2C5fgu3oFjYRLwMjSYBeCZ73bXHhqHzisaZ8XZyz+SSagcVF54++cVH9CzF65fd64s0J/mtGEwvz0fPazi6UHDvwfzKjK+QWORzdogN+Klpw4o5Ezc0LVIlzMnbdcsjdo855pbFY7Kd7ezvWj9m+NqsEm
X-Exchange-RoutingPolicyChecked: kXKX3viYHeumT51+pMZjb/61sMrmUY1MjvVLcpvQm+bkcy2emNl4NaVAdTZrmu7DA6cximUoPzDPVTpBMg2ufouxK7olOYOiwdyU1nuu1ux7HKiKEk/UhHjI5PyLhUst9Or7LGCLAh9EZs6i3d/j5QOog4dVStKTQftce+BTwz08xFs7bPYrnFsIXc/GUAqH2M+TIulRiwfugvB5RsTcyMIiHQ4/GcHgHwyD77HgfAGZ3zriQVUPciORFw3AluzrMRcOH94L14qrsOaQUx8yAuWyD+gFHO6mgNQgkvyM5q5kSE9+abKD6ECZ93+iHoZXkDxBxvg8m70HfZjlf2i6CQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 10:53:14.9022 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d29f919f-e66c-4e98-4baa-08df1960de7d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR10MB997793
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MyBTYWx0ZWRfX9EenAzdLWpOK
 ihYueDZUsto9iSr2f45Wjt0o1LxHyVrOYXYxR2u4Ww22NQTTI6OqOXpduIGcghBX8VfVfie1jNj
 xXI3+jLUkH64nFegsnISLGjF1OVihpDPVcxVxRp7baTRBS7r17Gj/1X5scZyz+DF5lDUIK9Lj7a
 eqbe/fx0bMkEHzvQoYdtfr8Cp6r6OZiGKbNRFEUGo+3Hf6A71MsetsaJngLzbKaouAY7DPFKq/6
 Hg0ipNaqe8SPqbpQfU6NAQtUFndqnHSfIXwOMG3QL6neFgKQ1MuEVPFoRlvZEDBdm14H4QkX0GP
 6PZBi+I6K47uTEJt/e7bkBzKQA5XuWAsezP4it8T0J22gTZ/PkAjbbCTOVaNUBF04IZd6zaXqEi
 cBejwUuPjgx4GN4z7/3O80BnVfToRduGpM/EMMSvhiXorZoqJ3dAxRJ5tc4itBILz5jyBiu0Mnt
 dGhcsXPPRve0dyOXQZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MyBTYWx0ZWRfX1iBDwqEAPoaU
 IOdc72aALZVy0DozlkhjW10nRxGDWtbcEhOdAsdjUxljNlaY3z/GjU0JVF/bGIMmQpXZBrZk4Jv
 nTDk9Cvu4XBPIuh6PtakLb8qTT1X0CM=
X-Proofpoint-GUID: Q0umSCbXtZzGoCslP1AROL8dH8ot2T82
X-Proofpoint-ORIG-GUID: Q0umSCbXtZzGoCslP1AROL8dH8ot2T82
X-Authority-Analysis: v=2.4 cv=cPt1IVeN c=1 sm=1 tr=0 ts=6ab3afa0 cx=c_pps
 a=62XUoh1M8q72LGroxeb6lQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=24AZYWMyAAAA:8 a=wECf3xPYAAAA:8 a=YRHvXXt1AAAA:8 a=NEAV23lmAAAA:8
 a=-rRa6nrqAAAA:20 a=sozttTNsAAAA:8 a=BoJB4dgYAAAA:8 a=i7I0H7uZFZIQHOfRp-8A:9
 a=qcg49hLlgF0N60+LroqrWnV/Vu4=:19 a=bG88sKzkDEFeXWNnvthB:22
 a=ccNonjl4-tybilS9-zgM:22 a=9bw_jnHfPby8klRCszyn:22 a=zGR_d48pMUbmtCY1HACo:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230043
Subject: [Buildroot] [PATCH][RFC]utils/generate-spdx3: add script to
 generate SPDX 3.0.1 SBOM
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
From: Mahammed Sadik Shaik via buildroot <buildroot@buildroot.org>
Reply-To: Mahammed Sadik Shaik <s-sadik@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There is a growing need to generate software bill of materials (SBOM) from
buildroot configurations. Right now there is CycloneDX which is optimized for
application security and Vulnerabity. while SPDX is designed for legal
complainces, copyrights, and deep license analysis.
SPDX 3.0 is a ground-up redesign of the SPDX specification. All elements
(packages, relationships, annotations, licenses) are first-class Elements
with their own spdxId URI and creationInfo, serialized as a flat @graph
array in JSON-LD format. This format allows the generated SBOM to be used
with modern SPDX 3.0 visualization tools, such as https://tools.spdx.org/app/spdx3_viz/.
This patch introduces a Python script that converts the JSON output of the
show-info Makefile target to an SPDX 3.0.1 JSON-LD SBOM.
The script output contains the following information:
- A list of all packages as software_Package elements with information
  about version, download location, checksums (from .hash files),
  CPE identifiers, VCS references, and applied patches recorded in
  software_sourceInfo.
- By default virtual packages are not listed in the SBOM.
- The Buildroot package type (target/host/toolchain) is recorded in the
  software_primaryPurpose field and the element comment.
- Per package, a simplelicensing_LicenseExpression element is emitted
  for the declared license. Deprecated SPDX identifiers (GPL-2.0,
  GPL-3.0, LGPL-2.1, etc.) are mapped to their current equivalents
  (GPL-2.0-only, GPL-3.0-only, LGPL-2.1-only, etc.).
- Structural relationships: the SpdxDocument describes the root
  firmware package; the root firmware package contains each top-level
  package; inter-package dependencies are expressed as dependsOn
  relationships.
- hasDeclaredLicense relationships linking each package to its
  LicenseExpression element.
- Ignored CVEs are recorded as Annotation elements (annotationType
  review) on the affected package, noting whether the CVE was fixed
  by a patch in the Buildroot tree or simply marked as ignored.

More information on SPDX 3.0 at https://spdx.github.io/spdx-spec/v3.0.1/.
Usage:
make show-info | utils/generate-spdx3 > sbom.spdx3.json

  Example output (abbreviated):

  {
    "@context": "https://spdx.org/rdf/3.0.1/spdx-context.jsonld",
    "@graph": [
      {
        "@id": "_:creationInfo",
        "type": "CreationInfo",
        "specVersion": "3.0.1",
        "created": "2024-01-01T00:00:00Z",
        "createdBy": ["https://buildroot.org/sbom/...#tool-..."]
      },
      {
        "type": "SpdxDocument",
        "spdxId": "https://buildroot.org/sbom/...#document",
        "rootElement": ["https://buildroot.org/sbom/...#buildroot"],
        ...
      },
      {
        "type": "software_Package",
        "spdxId": "https://buildroot.org/sbom/...#busybox",
        "name": "busybox",
        "software_packageVersion": "1.36.1",
        "software_primaryPurpose": "library",
        "externalIdentifier": [
          {
            "type": "ExternalIdentifier",
            "externalIdentifierType": "cpe23",
            "identifier": "cpe:2.3:a:busybox:busybox:1.36.1:*:*:*:*:*:*:*"
          }
        ],
        ...
      },
      {
        "type": "simplelicensing_LicenseExpression",
        "spdxId": "https://buildroot.org/sbom/...#lic-GPL-2-0-only",
        "simplelicensing_licenseExpression": "GPL-2.0-only",
        ...
      },
      {
        "type": "Relationship",
        "spdxId": "https://buildroot.org/sbom/...#rel-1",
        "from": "https://buildroot.org/sbom/...#busybox",
        "to": ["https://buildroot.org/sbom/...#lic-GPL-2-0-only"],
        "relationshipType": "hasDeclaredLicense"
      },
      {
        "type": "Annotation",
        "spdxId": "https://buildroot.org/sbom/...#ann-1",
        "annotationType": "review",
        "subject": "https://buildroot.org/sbom/...#busybox",
        "statement": "CVE-2022-28391: Marked as ignored by Buildroot"
      },
      ...
    ]
  }

Sample SPDX3 SBOM generated is available here:https://gist.github.com/sadik-smd/4d428052f71c90d85ddf0a15b2c998f5
This SBOM can be validated at:https://tools.spdx.org/app/spdx3_viz/

Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
---
 utils/generate-spdx3 | 813 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 813 insertions(+)
 create mode 100755 utils/generate-spdx3

diff --git a/utils/generate-spdx3 b/utils/generate-spdx3
new file mode 100755
index 0000000000..1dc84e286f
--- /dev/null
+++ b/utils/generate-spdx3
@@ -0,0 +1,813 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# This script converts the output of the show-info make target
+# to SPDX 3.0.1 JSON-LD format.
+#
+# Example usage:
+# $ make show-info | utils/generate-spdx3 > sbom.spdx3.json
+
+
+import argparse
+import importlib.util
+import json
+import os
+from pathlib import Path
+from typing import Iterator
+import urllib.parse
+import urllib.request
+import subprocess
+import sys
+import re
+import uuid
+import datetime
+
+
+SPDX_VERSION = "3.0.1"
+SPDX_CONTEXT_URL = f"https://spdx.org/rdf/{SPDX_VERSION}/spdx-context.jsonld"
+
+# Namespace prefix used for all spdxId URIs generated by this script.
+# Every element's spdxId is  "<SPDX_NS>#<local-id>".
+SPDX_NS_BASE = "https://buildroot.org/sbom"
+
+# The official SPDX license list JSON from the spdx/license-list-data repo.
+# It provides the list of valid SPDX license identifiers and the license list
+# version string used in creationInfo.
+SPDX_LICENSE_LIST_URL = "https://raw.githubusercontent.com/spdx/license-list-data/main/json/licenses.json"
+
+brpath = Path(__file__).parent.parent
+
+spdxpath = Path(os.getenv("BR2_DL_DIR", brpath / "dl")) / "spdx"
+SPDX_LICENSE_LIST_PATH = spdxpath / "licenses.json"
+
+BR2_VERSION_FULL = (
+    subprocess.check_output(
+        ["make", "--no-print-directory", "-C", brpath, "print-version"]
+    )
+    .decode()
+    .strip()
+)
+
+SPDX_LICENSE_IDS = set()
+SPDX_LICENSE_LIST_VERSION = ""
+
+if not SPDX_LICENSE_LIST_PATH.exists():
+    if not importlib.util.find_spec("_ssl"):
+        print(f"ssl module required for downloading {SPDX_LICENSE_LIST_URL}. Try enabling BR2_PACKAGE_HOST_PYTHON3_SSL.",
+              file=sys.stderr)
+        exit(1)
+
+    spdxpath.mkdir(parents=True, exist_ok=True)
+    try:
+        urllib.request.urlretrieve(SPDX_LICENSE_LIST_URL, SPDX_LICENSE_LIST_PATH)
+    except urllib.error.URLError as e:
+        if "CERTIFICATE_VERIFY_FAILED" in str(e.reason):
+            raise Exception("Couldn't verify certificate. Try enabling BR2_PACKAGE_HOST_CA_CERTIFICATES.")
+        raise e
+
+try:
+    with SPDX_LICENSE_LIST_PATH.open() as f:
+        license_data = json.load(f)
+        SPDX_LICENSE_IDS = {lic["licenseId"] for lic in license_data.get("licenses", [])}
+        SPDX_LICENSE_LIST_VERSION = license_data.get("licenseListVersion", "")
+except (json.JSONDecodeError, KeyError):
+    print(f"Failed to load the SPDX license list file: {SPDX_LICENSE_LIST_PATH}",
+          file=sys.stderr)
+
+
+def split_top_level_comma(subj):
+    """Split a string at commas, but do not split at commas inside parentheses.
+
+    Args:
+        subj (str): String to be split.
+
+    Yields:
+        str: Substrings between top-level commas.
+    """
+    counter = 0
+    substring = ""
+
+    for char in subj:
+        if char == "," and counter == 0:
+            yield substring
+            substring = ""
+        else:
+            if char == "(":
+                counter += 1
+            elif char == ")":
+                counter -= 1
+            substring += char
+
+    yield substring
+
+
+def extract_cves_from_header(header: str) -> list[str]:
+    """Extract CVE identifiers from the patch header.
+
+    Args:
+        header (str): Content of the header of a patch.
+
+    Returns:
+        list: Array of CVE identifiers present in a patch header passed as
+        argument.
+    """
+    PATCH_CVE_HEADER = "CVE: "
+    return [
+        line.partition(PATCH_CVE_HEADER)[2].strip()
+        for line in header.splitlines()
+        if line.startswith(PATCH_CVE_HEADER)
+    ]
+
+
+def patch_retrieve_header(content: str) -> str:
+    """Read the content of a patch and split the header from the content.
+
+    Args:
+        content (str): Patch content.
+
+    Returns:
+        str: Patch header content.
+    """
+    DIFF_LINE_REGEX = re.compile(r"^diff\s+(?:--git|-[-\w]+)\s+(\S+)\s+(\S+)$")
+    INDEX_LINE_REGEX = re.compile(r"^Index:\s+(\S+)$")
+
+    lines = content.split('\n')
+
+    header = []
+    for i, line in enumerate(lines):
+        if DIFF_LINE_REGEX.match(line):
+            break
+        elif INDEX_LINE_REGEX.match(line):
+            if i < len(lines) - 2 and lines[i + 1].startswith("===") and lines[i + 2].startswith("---"):
+                break
+        elif line.startswith("---"):
+            if i < len(lines) - 2 and lines[i + 1].startswith("+++") and lines[i + 2].startswith("@@"):
+                break
+        else:
+            header.append(line)
+
+    return '\n'.join(header)
+
+
+def read_patch_file(patch_path: Path) -> str:
+    """Read the content of a patch file.
+
+    Args:
+        patch_path (Path): Patch path.
+
+    Returns:
+        str: Patch content.
+    """
+    with open(patch_path) as f:
+        return f.read()
+
+
+def parse_uris(uris: list[str]) -> Iterator[tuple[list[str], str]]:
+    """Parse download URIs into (schemes, url) tuples.
+
+    Splits the Buildroot URI format "scheme[|scheme]+url" and yields all
+    Buildroot schemes with the stripped URL, excluding
+    sources.buildroot.net mirrors.
+
+    Args:
+        uris (list): Array of URI strings from the show-info output.
+    Yields:
+        tuple[list[str], str]: (schemes, url) for each usable URI.
+    """
+    for uri in uris:
+        scheme, _, stripped_uri = uri.partition("+")
+        if stripped_uri:
+            parsed = urllib.parse.urlparse(stripped_uri)
+            if parsed.hostname != "sources.buildroot.net":
+                yield scheme.split("|"), stripped_uri
+
+
+def br2_virtual_is_provided_by(ref, show_info_dict) -> list[str]:
+    """Retrieve the list of packages that provide a virtual package.
+
+    Args:
+        ref (str): The identifier of the virtual package.
+        show_info_dict (dict): The JSON output of the show-info
+            command, parsed into a Python dictionary.
+
+    Returns:
+        list: package list that provides the virtual package.
+    """
+    return [
+        name
+        for name, comp in show_info_dict.items()
+        if "provides" in comp and ref in comp["provides"]
+    ]
+
+
+def br2_parse_deps(ref, show_info_dict, virtual=False) -> list[str]:
+    """This function will collect all dependencies from the show-info output.
+
+    The dependency on virtual package will collect the final dependency without
+    including the virtual one.
+
+    Args:
+        ref (str): The identifier of the package for which the dependencies have
+            to be looked up.
+        show_info_dict (dict): The JSON output of the show-info
+            command, parsed into a Python dictionary.
+
+    Returns:
+        list: A list of dependencies of the 'ref' package.
+    """
+    deps = set()
+
+    for dep in show_info_dict.get(ref, {}).get("dependencies", []):
+        if not virtual and show_info_dict.get(dep, {}).get("virtual"):
+            deps.update(br2_virtual_is_provided_by(dep, show_info_dict))
+        else:
+            deps.add(dep)
+
+    return list(deps)
+
+
+def br2_root_deps(show_info_dict, virtual=False) -> list[str]:
+    """Retrieve the list of direct dependencies of the root component.
+
+    This function returns all components that are not a dependency of any
+    other component.
+
+    Args:
+        show_info_dict (dict): The JSON output of the show-info command.
+        virtual (bool): Whether to resolve virtual dependencies to their providers.
+
+    Returns:
+        list: List of direct dependencies of the root component.
+    """
+    indirect = set()
+    for ref in show_info_dict:
+        indirect.update(br2_parse_deps(ref, show_info_dict, virtual))
+    return [ref for ref in show_info_dict if ref not in indirect]
+
+
+# ---------------------------------------------------------------------------
+# SPDX 3.0 helpers
+# ---------------------------------------------------------------------------
+
+# Map deprecated SPDX license IDs to their current equivalents.
+# Buildroot package .mk files commonly use these short-form IDs.
+# The "-only" interpretation is used for versionless IDs per common
+# open-source convention; "+" suffix means "-or-later".
+DEPRECATED_LICENSE_MAP = {
+    "GPL-1.0":                    "GPL-1.0-only",
+    "GPL-1.0+":                   "GPL-1.0-or-later",
+    "GPL-2.0":                    "GPL-2.0-only",
+    "GPL-2.0+":                   "GPL-2.0-or-later",
+    "GPL-3.0":                    "GPL-3.0-only",
+    "GPL-3.0+":                   "GPL-3.0-or-later",
+    "LGPL-2.0":                   "LGPL-2.0-only",
+    "LGPL-2.0+":                  "LGPL-2.0-or-later",
+    "LGPL-2.1":                   "LGPL-2.1-only",
+    "LGPL-2.1+":                  "LGPL-2.1-or-later",
+    "LGPL-3.0":                   "LGPL-3.0-only",
+    "LGPL-3.0+":                  "LGPL-3.0-or-later",
+    "AGPL-1.0":                   "AGPL-1.0-only",
+    "AGPL-3.0":                   "AGPL-3.0-only",
+    "AGPL-3.0+":                  "AGPL-3.0-or-later",
+    "GPL-3.0-with-GCC-exception": "GPL-3.0-only WITH GCC-exception-3.1",
+}
+
+
+def normalize_license_id(token: str) -> str:
+    """Return the current SPDX ID for a (possibly deprecated) license token.
+
+    Args:
+        token (str): A single license identifier token.
+
+    Returns:
+        str: Normalized SPDX ID, or the original token if no mapping exists.
+    """
+    return DEPRECATED_LICENSE_MAP.get(token, token)
+
+
+def spdx_uri(ns: str, local: str) -> str:
+    """Build a full spdxId URI from a namespace and a local identifier.
+
+    Args:
+        ns (str): Document namespace URI (without trailing #).
+        local (str): Local identifier string.
+
+    Returns:
+        str: Full URI suitable for use as spdxId.
+    """
+    sanitized = re.sub(r"[^A-Za-z0-9.\-+]", "-", local).strip("-") or "unknown"
+    return f"{ns}#{sanitized}"
+
+
+def br_type_to_purpose(br_type: str) -> str:
+    """Map a Buildroot package type to an SPDX 3.0 SoftwarePurpose value.
+
+    Args:
+        br_type (str): Buildroot package type from show-info.
+
+    Returns:
+        str: SPDX 3.0 SoftwarePurpose enum value (camelCase).
+    """
+    return {
+        "target":    "library",
+        "host":      "application",
+        "toolchain": "application",
+        "rootfs":    "operatingSystem",
+        "linux":     "operatingSystem",
+    }.get(br_type, "other")
+
+
+def license_expression_string(lic_list: str) -> str:
+    """Convert a Buildroot comma-separated license string to an SPDX expression.
+
+    Buildroot comma-separated licenses mean "all of these apply" (AND semantics).
+    Deprecated IDs are mapped to current equivalents. Unknown IDs are kept as-is
+    since SPDX 3.0 LicenseExpression elements carry the raw expression string
+    without needing a separate hasExtractedLicensingInfos list.
+
+    Args:
+        lic_list (str): Comma-separated license string from show-info.
+
+    Returns:
+        str: SPDX license expression string.
+    """
+    if not lic_list or not lic_list.strip():
+        return "NOASSERTION"
+
+    tokens = []
+    for token in split_top_level_comma(lic_list):
+        token = token.strip()
+        if not token:
+            continue
+        tokens.append(normalize_license_id(token))
+
+    if not tokens:
+        return "NOASSERTION"
+
+    if len(tokens) == 1:
+        return tokens[0]
+    return " AND ".join(f"({t})" if " " in t else t for t in tokens)
+
+
+def spdx3_hashes(comp: dict) -> list[dict]:
+    """Build SPDX 3.0 Hash objects from Buildroot .hash files.
+
+    In SPDX 3.0, checksums are represented as Hash inline objects with
+    fields 'type', 'algorithm', and 'hashValue'.
+
+    Args:
+        comp (dict): Component information from show-info.
+
+    Returns:
+        list: List of Hash inline objects.
+    """
+    ALGO_MAP = {
+        "sha1":   "sha1",
+        "sha256": "sha256",
+        "sha512": "sha512",
+        "md5":    "md5",
+    }
+
+    hashes = []
+    seen = set()
+
+    for download in comp.get("downloads", []):
+        source = download.get("source")
+        if not source:
+            continue
+        for hash_file in comp.get("hashes", []):
+            try:
+                with (brpath / hash_file).open() as f:
+                    for line in f:
+                        line = line.strip()
+                        if not line.startswith("#") and line.endswith(f" {source}"):
+                            parts = line.split()
+                            if len(parts) >= 3 and parts[0] in ALGO_MAP:
+                                key = (ALGO_MAP[parts[0]], parts[1])
+                                if key not in seen:
+                                    seen.add(key)
+                                    hashes.append({
+                                        "type": "Hash",
+                                        "algorithm": ALGO_MAP[parts[0]],
+                                        "hashValue": parts[1],
+                                    })
+            except OSError:
+                pass
+
+    return hashes
+
+
+def spdx3_download_location(comp: dict) -> str | None:
+    """Extract the primary download URL for a package.
+
+    Returns the first non-mirror HTTP/HTTPS source distribution URL,
+    or the first VCS URL, or None if no URL is found.
+
+    Args:
+        comp (dict): Component information from show-info.
+
+    Returns:
+        str or None: Download URL or None.
+    """
+    SOURCE_DIST_SCHEMES = {"http", "https"}
+    VCS_SCHEMES = {"git", "svn", "cvs", "hg", "bzr"}
+
+    first_vcs = None
+
+    for download in comp.get("downloads", []):
+        source = download.get("source")
+        for schemes, uri in parse_uris(download.get("uris", [])):
+            scheme_set = set(schemes)
+            if scheme_set & SOURCE_DIST_SCHEMES and source:
+                return f"{uri}/{source}"
+            if scheme_set & VCS_SCHEMES and first_vcs is None:
+                first_vcs = uri
+
+    return first_vcs
+
+
+def spdx3_external_identifiers(comp: dict) -> list[dict]:
+    """Build SPDX 3.0 ExternalIdentifier objects for a package.
+
+    In SPDX 3.0, CPE identifiers use ExternalIdentifier with
+    externalIdentifierType='cpe23'.
+
+    Args:
+        comp (dict): Component information from show-info.
+
+    Returns:
+        list: List of ExternalIdentifier inline objects.
+    """
+    refs = []
+    if "cpe-id" in comp:
+        refs.append({
+            "type": "ExternalIdentifier",
+            "externalIdentifierType": "cpe23",
+            "identifier": comp["cpe-id"],
+        })
+    return refs
+
+
+def spdx3_external_refs(comp: dict) -> list[dict]:
+    """Build SPDX 3.0 ExternalRef objects for VCS URLs.
+
+    In SPDX 3.0, VCS references use ExternalRef with
+    externalRefType='vcs'.
+
+    Args:
+        comp (dict): Component information from show-info.
+
+    Returns:
+        list: List of ExternalRef inline objects.
+    """
+    VCS_SCHEMES = {"git", "svn", "cvs", "hg", "bzr"}
+
+    refs = []
+    for download in comp.get("downloads", []):
+        for schemes, uri in parse_uris(download.get("uris", [])):
+            if set(schemes) & VCS_SCHEMES:
+                refs.append({
+                    "type": "ExternalRef",
+                    "externalRefType": "vcs",
+                    "locator": uri,
+                })
+    return refs
+
+
+def spdx3_patch_source_info(comp: dict) -> tuple[set, str]:
+    """Extract CVEs fixed by patches and a sourceInfo string for a component.
+
+    Args:
+        comp (dict): Component information from show-info.
+
+    Returns:
+        tuple: (cves_fixed: set[str], source_info: str)
+    """
+    cves_fixed = set()
+    lines = []
+
+    for patch in comp.get("patches", []):
+        patch_path = brpath / patch
+        if patch_path.exists():
+            try:
+                content = read_patch_file(patch_path)
+            except Exception:
+                print(f"Failed to handle patch: {patch}", file=sys.stderr)
+                continue
+            header = patch_retrieve_header(content)
+            cves = extract_cves_from_header(header)
+            cves_fixed.update(cves)
+            if cves:
+                lines.append(f"Patch {patch_path.name} fixes: {', '.join(cves)}")
+            else:
+                lines.append(f"Patch applied: {patch_path.name}")
+        else:
+            lines.append(f"Patch (remote): {patch}")
+
+    return cves_fixed, "; ".join(lines)
+
+
+def build_graph(ns: str, project_name: str, project_version: str,
+                filtered_dict: dict, show_info_dict: dict,
+                virtual: bool, timestamp: str) -> list[dict]:
+    """Build the complete SPDX 3.0 @graph element list.
+
+    Produces the following elements:
+      - CreationInfo blank node (shared by all elements)
+      - Tool element (the generator itself)
+      - SpdxDocument element
+      - software_Package for the root firmware
+      - software_Package for each filtered package
+      - simplelicensing_LicenseExpression for each distinct license expression
+      - Relationship: describes, contains, dependsOn, hasDeclaredLicense
+      - Annotation: one per ignored CVE per package
+
+    Args:
+        ns (str): Document namespace URI (without trailing #).
+        project_name (str): Root firmware package name.
+        project_version (str): Root firmware package version.
+        filtered_dict (dict): Filtered show-info (no rootfs, optionally no virtual).
+        show_info_dict (dict): Full show-info for dependency resolution.
+        virtual (bool): Whether virtual packages are included.
+        timestamp (str): ISO 8601 UTC timestamp.
+
+    Returns:
+        list: All SPDX 3.0 Element dicts for the @graph array.
+    """
+    graph = []
+
+    # Relationship and annotation element counter for unique IDs
+    counters = {"rel": 0, "ann": 0, "lic": 0}
+
+    def next_rel_uri():
+        counters["rel"] += 1
+        return spdx_uri(ns, f"rel-{counters['rel']}")
+
+    def next_ann_uri():
+        counters["ann"] += 1
+        return spdx_uri(ns, f"ann-{counters['ann']}")
+
+    def next_lic_uri(expr_key):
+        # Re-use the same URI for identical expressions to avoid duplicates
+        return spdx_uri(ns, f"lic-{re.sub(r'[^A-Za-z0-9]', '-', expr_key)[:60]}")
+
+    # --- Shared CreationInfo blank node ---
+    tool_uri = spdx_uri(ns, f"tool-buildroot-generate-spdx3-{BR2_VERSION_FULL}")
+
+    creation_info_id = "_:creationInfo"
+    creation_info = {
+        "@id": creation_info_id,
+        "type": "CreationInfo",
+        "specVersion": SPDX_VERSION,
+        "created": timestamp,
+        "createdBy": [tool_uri],
+    }
+    if SPDX_LICENSE_LIST_VERSION:
+        creation_info["comment"] = f"SPDX license list version: {SPDX_LICENSE_LIST_VERSION}"
+    graph.append(creation_info)
+
+    # --- Tool element ---
+    graph.append({
+        "type": "Tool",
+        "spdxId": tool_uri,
+        "name": f"Buildroot generate-spdx3 {BR2_VERSION_FULL}",
+        "creationInfo": creation_info_id,
+    })
+
+    # --- Collect all element URIs for SpdxDocument.element ---
+    # We build them first so we can populate element[] and rootElement[].
+    root_pkg_uri = spdx_uri(ns, project_name)
+    pkg_uris = {name: spdx_uri(ns, name) for name in filtered_dict}
+
+    # We accumulate relationship and annotation elements as we go;
+    # collect their URIs for the SpdxDocument element list.
+    deferred_elements = []   # (uri, element_dict) pairs added after packages
+
+    # --- Root firmware package ---
+    root_pkg = {
+        "type": "software_Package",
+        "spdxId": root_pkg_uri,
+        "creationInfo": creation_info_id,
+        "name": project_name,
+        "software_packageVersion": project_version,
+        "software_primaryPurpose": "firmware",
+        "comment": "Root firmware image",
+    }
+    graph.append(root_pkg)
+
+    # --- Per-package elements ---
+    # Track which license expressions have already been emitted (deduplicate)
+    emitted_lic_uris = {}   # expression_string -> lic_uri
+
+    # Pre-pass: collect all CVEs fixed by patches
+    cves_fixed_by_patch = set()
+    for comp in filtered_dict.values():
+        fixed, _ = spdx3_patch_source_info(comp)
+        cves_fixed_by_patch.update(fixed)
+
+    for name, comp in filtered_dict.items():
+        pkg_uri = pkg_uris[name]
+
+        pkg = {
+            "type": "software_Package",
+            "spdxId": pkg_uri,
+            "creationInfo": creation_info_id,
+            "name": comp.get("name", name),
+            "comment": f"BR_TYPE={comp.get('type', '')}",
+        }
+
+        if not comp.get("virtual"):
+            if "version" in comp:
+                pkg["software_packageVersion"] = comp["version"]
+
+        purpose = br_type_to_purpose(comp.get("type", ""))
+        if purpose:
+            pkg["software_primaryPurpose"] = purpose
+
+        dl = spdx3_download_location(comp)
+        if dl:
+            pkg["software_downloadLocation"] = dl
+
+        hashes = spdx3_hashes(comp)
+        if hashes:
+            pkg["verifiedUsing"] = hashes
+
+        ext_ids = spdx3_external_identifiers(comp)
+        if ext_ids:
+            pkg["externalIdentifier"] = ext_ids
+
+        ext_refs = spdx3_external_refs(comp)
+        if ext_refs:
+            pkg["externalRef"] = ext_refs
+
+        _, source_info = spdx3_patch_source_info(comp)
+        if source_info:
+            pkg["software_sourceInfo"] = source_info
+
+        graph.append(pkg)
+
+        # --- hasDeclaredLicense relationship ---
+        if not comp.get("virtual") and "licenses" in comp:
+            expr = license_expression_string(comp["licenses"])
+        else:
+            expr = "NOASSERTION"
+
+        if expr not in emitted_lic_uris:
+            lic_uri = next_lic_uri(expr)
+            emitted_lic_uris[expr] = lic_uri
+            lic_element = {
+                "type": "simplelicensing_LicenseExpression",
+                "spdxId": lic_uri,
+                "creationInfo": creation_info_id,
+                "simplelicensing_licenseExpression": expr,
+            }
+            if SPDX_LICENSE_LIST_VERSION:
+                lic_element["simplelicensing_licenseListVersion"] = SPDX_LICENSE_LIST_VERSION
+            deferred_elements.append((lic_uri, lic_element))
+
+        lic_uri = emitted_lic_uris[expr]
+        rel_lic_uri = next_rel_uri()
+        deferred_elements.append((rel_lic_uri, {
+            "type": "Relationship",
+            "spdxId": rel_lic_uri,
+            "creationInfo": creation_info_id,
+            "from": pkg_uri,
+            "to": [lic_uri],
+            "relationshipType": "hasDeclaredLicense",
+        }))
+
+        # --- CVE annotations ---
+        for cve in comp.get("ignore_cves", []):
+            if cve in cves_fixed_by_patch:
+                statement = f"{cve}: Fixed by patch in Buildroot tree"
+            else:
+                statement = f"{cve}: Marked as ignored by Buildroot"
+            ann_uri = next_ann_uri()
+            deferred_elements.append((ann_uri, {
+                "type": "Annotation",
+                "spdxId": ann_uri,
+                "creationInfo": creation_info_id,
+                "annotationType": "review",
+                "subject": pkg_uri,
+                "statement": statement,
+            }))
+
+    # --- Structural relationships ---
+    # Document describes the root firmware package
+    rel_describes_uri = next_rel_uri()
+    doc_uri = spdx_uri(ns, "document")
+    deferred_elements.append((rel_describes_uri, {
+        "type": "Relationship",
+        "spdxId": rel_describes_uri,
+        "creationInfo": creation_info_id,
+        "from": doc_uri,
+        "to": [root_pkg_uri],
+        "relationshipType": "describes",
+    }))
+
+    # Root firmware contains each top-level package
+    for ref in br2_root_deps(filtered_dict, virtual):
+        rel_uri = next_rel_uri()
+        deferred_elements.append((rel_uri, {
+            "type": "Relationship",
+            "spdxId": rel_uri,
+            "creationInfo": creation_info_id,
+            "from": root_pkg_uri,
+            "to": [pkg_uris[ref]],
+            "relationshipType": "contains",
+        }))
+
+    # Inter-package dependsOn
+    for ref in filtered_dict:
+        for dep in sorted(br2_parse_deps(ref, show_info_dict, virtual)):
+            if dep in filtered_dict:
+                rel_uri = next_rel_uri()
+                deferred_elements.append((rel_uri, {
+                    "type": "Relationship",
+                    "spdxId": rel_uri,
+                    "creationInfo": creation_info_id,
+                    "from": pkg_uris[ref],
+                    "to": [pkg_uris[dep]],
+                    "relationshipType": "dependsOn",
+                }))
+
+    # Append all deferred elements (licenses, relationships, annotations)
+    for _, elem in deferred_elements:
+        graph.append(elem)
+
+    # --- SpdxDocument ---
+    # Collect every element URI except the CreationInfo blank node and the
+    # Tool (Tool is referenced via createdBy, not element[]).
+    all_element_uris = (
+        [root_pkg_uri]
+        + list(pkg_uris.values())
+        + [uri for uri, _ in deferred_elements]
+    )
+
+    spdx_document = {
+        "type": "SpdxDocument",
+        "spdxId": doc_uri,
+        "creationInfo": creation_info_id,
+        "name": project_name,
+        "profileConformance": ["core", "software", "simpleLicensing"],
+        "element": all_element_uris,
+        "rootElement": [root_pkg_uri],
+    }
+    # Insert the SpdxDocument right after the Tool element (index 2)
+    graph.insert(2, spdx_document)
+
+    return graph
+
+
+def main():
+    parser = argparse.ArgumentParser(
+            description='''Create an SPDX 3.0.1 SBoM for the Buildroot configuration.
+                Example usage: make show-info | utils/generate-spdx3 > sbom.spdx3.json
+            '''
+        )
+    parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"),
+                        default=(None if sys.stdin.isatty() else sys.stdin))
+    parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
+                        default=sys.stdout)
+    parser.add_argument("--virtual", default=False, action='store_true',
+                        help="This option includes virtual packages to the SPDX output")
+    parser.add_argument("--project-name", type=str, default="buildroot",
+                        help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
+    parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
+                        help="Specify the project version to use in the SBOM metadata (default: buildroot version)")
+
+    args = parser.parse_args()
+
+    if args.in_file is None:
+        parser.print_help()
+        sys.exit(1)
+
+    show_info_dict = json.load(args.in_file)
+
+    # Remove rootfs and virtual packages if not explicitly included
+    # from the cli arguments
+    filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
+                               if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
+
+    timestamp = datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
+
+    # Unique namespace URI for this document (UUID v4 per run)
+    ns = f"{SPDX_NS_BASE}/{args.project_name}-{BR2_VERSION_FULL}-{uuid.uuid4()}"
+
+    graph = build_graph(
+        ns, args.project_name, args.project_version,
+        filtered_show_info_dict, show_info_dict,
+        args.virtual, timestamp,
+    )
+
+    doc = {
+        "@context": SPDX_CONTEXT_URL,
+        "@graph": graph,
+    }
+
+    args.out_file.write(json.dumps(doc, indent=2))
+    args.out_file.write('\n')
+
+
+if __name__ == "__main__":
+    main()
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
