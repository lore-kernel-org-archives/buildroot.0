Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2915BCA5FCB
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 12:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A3C781324;
	Thu,  1 Oct 2026 12:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78jd3VuiCzBo; Thu,  1 Oct 2026 12:41:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BA81381317
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790858481;
	b=IqQtw1rg8lTT9MN3CJrHTVQujlvltm0LncCR47qeUjqAVkXrexS1nM2dnDne/5tSmpBJ
	 agcSrwcNYxWumiahtqjOLugHcgiRYe1SPwZVVfTKQcN0G07jvAH1034fGLOdUdJh4qSu0
	 jxvp18GbVnZpBFSZRnNUPSDlMA6RFPNecQu5HOsGz8i3IYwQZDeJAzbesQOyr/YAFU4rk
	 Kt6sT7F01VdvRRxR0Xe9Etnka5BIUb5WhiOL8WRm5b/bt9GOVXMj6KKGaH7ToHK0OLPnO
	 x5+wo+2uU974Ctmtf0H5I9p14vRWcVbcbLrv2HdlgdRnnvPACoAT8h4IEkAkRzOfyTQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790858481;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 Received:Received:Received:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2e1RbuHJj4uleJ+ED2QIC6WiChFhW5efBeH2hcbnB8o=;
	b=kj9PLV10f6fyAxYlnkFBnAMRMlbi/vWPDk36/6iX/hmk/Xbl8qoUdY4MoD+4US1vJHjz
	 LXS1PwsbvMuk6gDkbGi0ROQJwFy7D6vXABmT3jpFJmo3aISc20TzsbKZ1r7aU7R0X9wPE
	 /C5NMkj2hzgN5h1wSWBOsO8KS+i7eLbwR6zIGp/zygRqtimh4aw58MnU1uRDjD7tmmQrW
	 GwF8JD46gxIHjkW1HKXDo8OwJ06puJw0MWRC45p8MbPacLyK0yf8iMpCH9cGy2fcFtua5
	 kIWIu00q4UYVmp5U/Kp+3sIDkG8O9Mvqk+7wPdGXj/UYrIjiLHuDz8ZazdOci2tJaqQ==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790858481;
	bh=2e1RbuHJj4uleJ+ED2QIC6WiChFhW5efBeH2hcbnB8o=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=B4xub/xF4AkLj2O5yysd1TC9G9hNf+6BcXMs9ZVuQrhIGU1xuBBZd3jce9l1i6vS7
	 HDnu9O/mdS6YbbH3XojddDqAqgGp3ylECDWBcz9KjDcROtDbW8L0/jArtGlsaORS6x
	 aTPKIZIjxHK3UNU3F5J5K9SUazjUtimNex89RmtAzqRPKCpdKj7mZccaAfdYU3Qxe9
	 FlZ0/1LndapAlENRfpnrAOq/UsXkwP5k0kB6h/9U5knqoGIvGGAeNQ34yed9vT/zpQ
	 gwpE2VQukzT1YAYJqFWPK5mLOlNt34ECGNYVWyd6ll/jMzU6Smvna/sqDmK4tuVNh2
	 HZtHS9eeVjBGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA81381317;
	Thu,  1 Oct 2026 12:41:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AC3D32F
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 12:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 621D740D8B
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 12:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6MyuJaBoaUU for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 12:41:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CC03940D7B
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790858479;
 b=Hhx5WttYYunGWwgIrZD9aSho6f6DwCtDi3aW1n3tJLN6khWwGM+SqGYJgEidmD5O1Eva
 InKkIxNmReOZtiJ0DubSHb2Iukpxm317tiN5JmCeD0fcfR30uKXdG1t0kpTD0iEYSTUAA
 IT+9yeh3mFD9cK3UQuxSb4tXHKjxwAl2O2R1b7p3zjvqS91Kp6eVv4UIoC6TC/B5aXLhZ
 5SD6BdEHd1Cs3iHOpyI3kSz03FoLMNL0rxUL5pKKmhQ6dcmp2LjBjqTJ2bSJMKLNSLvF/
 koY6f2YnbFZWcfLf0iyHsIJprNhGAt/ZeYfgQtFNXdxyg+oU8TD2f7W9XxfX6eXZcUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790858479;
 h=Received-SPF:DKIM-Signature:Received:Received:
 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
 X-Forefront-Antispam-Report:
 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-Id:
 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-FromEntityHeader:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=wqx2gvInx2bSzFhwQ0i2z/wPdCnJsI8YFoUtOFPqLgc=;
 b=AWZrL5kzp4jKufSimwB1l4kEBXhd1jHYF22gndZvChIhZ2aixevdcBpB44YrLuenbFez
 6m+poPLSGlL7Gxr7/ZpIHlHzqvBeKLlDnQ9p49A/DqU6tLq3BZQpw2UuWJwedHW1VnuEQ
 zmkfN10ts/RBz5OExxRuqyRiN4mbAelGanbh4fE5fGJv3tEr+mcqaX8vzibghrwF5u4k3
 ZrLZLBzFtqwWeYODZprWIyYQpjJJLaH8KgLrdRZTzkwQzFTdWfBDoBUmZX7XTJvNDOoI0
 mHV3E32ZVVe1hDj9+w6Ew7bwFlhBiATpkqFnOSTxXgOHNeYn/7clzVgtMzN6GGjondg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org;
 dmarc=pass header.from=amd.com; 
 dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=boN3BtXr; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:c105::5"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::5;
 helo=ch5pr02cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC03940D7B
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 12:41:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLoNZnZ3j1Cyr6Lmx3dHejbUd1SkFJQs55Qdp7iLXx2dJvsM9k/iwfno7DUe4/7yZ7UUTvbqtVU3x2mnSTexGrqOVORMgyEfz+v+OfeK2a4ZcCNwceitiRD54Ul65ZKNAKIkd/gei69zup4Aph9ogesRE0ar/MsIF6u9P8kPxNh6egPR5DJheoJtwDB7m7MRWfp6/NwBwaM2JTa1bJXHZlLIEVcmnGM7gwO4a3cQGm9zLmfAIQytJZRmMzAXSJr7LswiqvXqs+Jf4qLA/BAk54nmAJvYH9YXVCkmlVKSwSdaLeIO9AlSVM8jzKp2pY6AAaXaq5Wp+FZbGIPQEh5HuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqx2gvInx2bSzFhwQ0i2z/wPdCnJsI8YFoUtOFPqLgc=;
 b=xmq3IBUtT5YfbHyiy2wWYtMJeRFv5CSPw2sG3eMz/mlo/5/en+1i4xJybPPwz1HfVKpJ1mYER0ziPlQ6nItpSsrO1yy11jGZrB9Ar+7urYYmLmKz/526o9s986J7nKMLe2AErx+GoDO7Asdkcvfi75SkS3V8MDrsl+bioRW6tBTXTjju0y3g1SlyTKRaxKYbJv1BGfk4STybM1crCBfHnQxCXJSlhTulUhTe23+Yn7mKNyiq78gKwhBGvukuERcfZ+HWQLELL/P1qIe87rJ+ZeFs0V8zsyDmvakCNITOsfFAzHcShiWAaSCa9x4bX5PtDPUkOU31xRATnB4FxBy29g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BLAP220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::33)
 by SA3PR12MB9197.namprd12.prod.outlook.com (2603:10b6:806:39e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Thu, 1 Oct
 2026 12:41:09 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:208:32c:cafe::23) by BLAP220CA0028.outlook.office365.com
 (2603:10b6:208:32c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 12:41:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 12:41:08 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 07:41:07 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 07:41:06 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 1 Oct 2026 07:41:04 -0500
To: <buildroot@buildroot.org>
Date: Thu, 1 Oct 2026 13:40:56 +0100
Message-ID: <20261001124057.1941988-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261001124057.1941988-1-neal.frager@amd.com>
References: <20261001124057.1941988-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|SA3PR12MB9197:EE_
X-MS-Office365-Filtering-Correlation-Id: abdad8de-1ed9-41f4-02ed-08df1fb94406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|23010399003|6133799003|22082099003|10067099003|18002099003|13003099007|11063799006|56012099006|41080700001;
X-Microsoft-Antispam-Message-Info: aai8lyQX78OhSJQ9PoDhQUiqgOroEYAcWU1ky/matQHnDY5BAWzT6KdI1gPtCUTCblORs1L5bpjdvr7vwb9CKiZqPmCwLYJAWLcDoghtGbCNbmonRC61Cr1S5Lz8/HvBbNdYc1kdn4icN6OGVxxmklOO0hMavUThsDyYwS1SeiFVPnUxuZxp8GWsVu/vGhpL4OPgnZnwPGxCrXfxuaqLVssYsExKCJ5i93uea/dpQxocSup9uuHr1g14kYBn0a2k4zNyFLzzXe2vE8pd+U7+d/KfCcwuhiOlKMYo2i4tk5nRqOT+x5GN/ZMaAJF8lNJk8glPsgiKJiUvh5Co9Ji5JAAuUiRTk0A/cVWYFQHzGqsdISHkAWdq04e8v7K7VLyGECo+bQBRbraejNwhY2Huz8KdNyFq89p9Rq3ohF+Ic/wNtRlq8qpH4eFrNvAIGW08n6vfGKINyu67CsU15xKZefyBkKMng0INFs4yQIvgXSKGnhCHt4jckWpFFlOElHiF7QU6R7vH+kKd4aO+EDZAiJFAt5BK3P08kt7rvYNbTdD7djt0tCWjzocff0j8sIs/rp8XAyXVnML0FsI1MRAa+loVke1ejSa0B6vB5iRWSQcHIgzMe/nw63ql+9wjrPdXeWtmx27not3SzK1BRtn7jb3GjwxUlEg22iDP04Z6l7Gtunf/gLRZaXuQBwZirsMEOkbnQYCb65DXookvucivFA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(23010399003)(6133799003)(22082099003)(10067099003)(18002099003)(13003099007)(11063799006)(56012099006)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: djN3kIQIvgFHYn2TR27pCjzvi0EAH4dAGaC3n7+MFOv401Ty+9c+I4DbuM7gZ1X77EEkAtwP4TudGyFkYWPC9iMA7AQdozEf16Z0FBF0r5fhFCCV/3zPCmD5qonPebIRD0nAj0kmAogv0Xp4QGfle0m8mWFp4w3Z02OuH5TWtzk6rwkbFY8EMzKlKqGsvoLKckA63Jt5+wlIUzLdvtDSstGGTge/oZ8czywFTHoNSR1mxtzU5QMqFAVhEmsFtRu9081quasARghLtSY+XGPfqaAWIfNDzNQoDLaNuU/gC76CXw9eqYCBRUqHa/nw7OYQTMLtBcwTHjT4xYRJueUzJgWCFM3CpqXdyPrh+dSg2u9iXAp3OwREssvUWTPCjSGjSv7a48E2L0YkTra5uGg5/zdqm/pxUKB1rRhojNdO7nOSEvj/MLzSRa1+MsWRTSRc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:41:08.0138 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abdad8de-1ed9-41f4-02ed-08df1fb94406
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9197
Subject: [Buildroot] [PATCH v6 2/3] package/xen: add custom tarball support
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: alistair@alistair23.me, stefano.stabellini@amd.com,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com, micheal.saleab@amd.com,
 yann.morin@orange.com, matthew.l.weber3@boeing.com,
 Matthew Weber <mathew.l.weber3@boeing.com>, brandon.maier@collins.com,
 john.ernberg@actia.se, brian.j.wood2@boeing.com, ju.o@free.fr,
 stewart.hildebrand@amd.com, thomas.petazzoni@bootlin.com, arnout@rnout.be,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for custom tarballs such as tarballs from vendor Xen trees.

To test this feature, use the following configs to test latest release of the
Xilinx Xen vendor tree.

To test:
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_XEN=y
BR2_PACKAGE_XEN_CUSTOM_TARBALL=y
BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,xen,xlnx-rebase-v4.21_2026.1)/xlnx-rebase-v4.21_2026.1.tar.gz"

Add to package/xen/xen.hash:
sha256  03498f51b8daae70c429ace4bde6e2be679b3a0ac28b886c7335c022feef6100  xlnx-rebase-v4.21_2026.1.tar.gz

Signed-off-by: Neal Frager <neal.frager@amd.com>
Tested-by: Matthew Weber <mathew.l.weber3@boeing.com>
Prior test details: https://gist.github.com/matthew-l-weber/c17f14a3793ccee440a383e4177ff3db
Reviewed-by: John Ernberg <john.ernberg@actia.se>
---
V1->V2:
- rebased to updated master branch
- added the line move of the XEN_SITE definition
V2->V4:
- merged into new patch series as the third patch
V4->V5:
- removed unnecessary BR_NO_CHECK_HASH_FOR
V5->V6:
- rebased to master
---
 package/xen/Config.in | 11 +++++++++++
 package/xen/xen.mk    | 17 ++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/package/xen/Config.in b/package/xen/Config.in
index c27600cae1..203fc60833 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -23,8 +23,18 @@ config BR2_PACKAGE_XEN_CUSTOM_VERSION
 	help
 	  This option allows to use a specific official version
 
+config BR2_PACKAGE_XEN_CUSTOM_TARBALL
+	bool "Custom tarball"
+
 endchoice
 
+if BR2_PACKAGE_XEN_CUSTOM_TARBALL
+
+config BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION
+	string "URL of custom Xen tarball"
+
+endif
+
 config BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE
 	string "Xen version"
 	depends on BR2_PACKAGE_XEN_CUSTOM_VERSION
@@ -34,6 +44,7 @@ config BR2_PACKAGE_XEN_VERSION
 	default "4.22.0"	if BR2_PACKAGE_XEN_LATEST_VERSION
 	default BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_XEN_CUSTOM_VERSION
+	default "custom"	if BR2_PACKAGE_XEN_CUSTOM_TARBALL
 
 config BR2_PACKAGE_XEN_HYPERVISOR
 	bool "Xen hypervisor"
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 5e3013cf63..5fc6968d70 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 XEN_VERSION = $(call qstrip,$(BR2_PACKAGE_XEN_VERSION))
-XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_SELINUX_MODULES = systemd udev xen
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING LICENSES/GPL-2.0
@@ -19,6 +18,16 @@ XEN_DEPENDENCIES = \
 	host-python3 \
 	host-python-distlib
 
+ifeq ($(BR2_PACKAGE_XEN_CUSTOM_TARBALL),y)
+# Handle custom Xen tarballs as specified by the configuration
+XEN_TARBALL = $(call qstrip,$(BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION))
+XEN_SITE = $(patsubst %/,%,$(dir $(XEN_TARBALL)))
+XEN_SOURCE = $(notdir $(XEN_TARBALL))
+else
+# Handle stable official Xen versions
+XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
+endif
+
 # Calculate XEN_ARCH
 ifeq ($(ARCH),aarch64)
 XEN_ARCH = arm64
@@ -108,4 +117,10 @@ XEN_INSTALL_TARGET = NO
 XEN_CONF_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_XEN_CUSTOM_TARBALL),y)
+ifeq ($(call qstrip,$(BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION)),)
+$(error No tarball location specified. Please check BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION)
+endif
+endif
+
 $(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
