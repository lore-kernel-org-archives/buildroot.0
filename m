Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6403BC3DA7A
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 17:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 486264040F;
	Wed, 14 Oct 2026 17:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bH4pcaqDFYMX; Wed, 14 Oct 2026 17:11:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 058524031C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791997863;
	b=duvd15TOCcc6AsGjXgaKsS+Q1imyvXRs6hjWvzC1/6fwm0jNssUndnaSq0tXqgnNQWnX
	 5pHduCZLfHinRrtQNzJscNrGo4ECB9/6ljQtlA3tSFEgBzA3xEFC8FQShkHtie+fyoSxy
	 RZmtA5p07af8VsDA5S3Ii8veWozTnLSTNABHn9cUIgvzcbOI2YjPuuheyydv3VvWTDCBm
	 BWieSnYb1IssiMpv7t/scLmbdhxJx4YwF4Z+iRbusgDNnFq7T5p7RSfWm8VaIWmQ9tPaP
	 9CcrkYp8otoWMJV72GsrTC0A9o+ig/IAF3kVpWfdhxltx11fB8BMFLl2d8QwM0ZuEPg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791997863;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Received:Received:Received:Date:
	 MIME-Version:Message-ID:References:In-Reply-To:To:CC:X-Mailer:
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=czg4WPAMbSooGIGjbtZeROeN/wvDdDkWJYJZPHcBmdo=;
	b=i6wJ/DwTpwltaE+ouMdf+lwLXckzXYNh81A2c0itsWPV7a4jk0crri3ShYKdjrMTJntT
	 spJT8lsu9PNvRqPTGCncAHZrWk8SqJDJgbBDUrJgSFPWGLLJ+b5JU/EbHwNyCzPoxa6dj
	 lzvywGvmTnW849AgRGMzltnAXZJI1V2T0VA7uVKhXo/HGmABGLY540uA9t4znFEm/s/be
	 yZPnxoxmH9IPqmrvv6Y7U0vtxyEptuKPH+K6KEJ092gjRweoJjb1Kjf3qpbS2fLGGlZwF
	 a/Vv/QoV43VBVA7surDFJg99af0FWAi8VcZ/2voVH8dGAJqtkTC37Ckcq/sRYxsyl0g==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791997863;
	bh=czg4WPAMbSooGIGjbtZeROeN/wvDdDkWJYJZPHcBmdo=;
	h=Date:References:In-Reply-To:To:CC:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZOgqkdIKK8s74ARFD451lT+R4J51qZGBRmR+9h3pIa4ZpkmtW+Ht4WpRYvdYg7wng
	 /ZAKUmArh24VYVFzdlaM9FN4+o/j6LRX+Wg+3YjNY09M4YB9tjx0Lnlf1wgMNES2rd
	 qlO2U6qzYfq/mTDunVTHLh5hmYM3HkwRN37eA9PG0qAxkLa59Lme8kcuLl+ANj90JY
	 5Ub6F60LyTZu44pbMYu40rt9vaFzCvrJ0gvc29Z5mLMcuqwI+t1MsSHv6BKO9lf5L9
	 fTDCGQD711PGHVmvlS5oCtl5aCw9gz204Zsk1dbfiR0PhqNT0wzAyD245fkXqqBX26
	 q1bpQe9HPcr8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 058524031C;
	Wed, 14 Oct 2026 17:11:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 25CA8A58
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 17:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17B1D807E5
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 17:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sk6xW5mgbSrU for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 17:10:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DB6CE807DC
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791997858;
 b=ZCfiWYd4yvGew4CLFd7SvpAXPYM5AKYFzHOdqccFJXjO/m7Tw3P9ZzJ+FVIEllezbQ7t
 bDRPQwobZzHvcp08SFztNlVlAtWfG11wFl0aVXNj4UPLL2yA469PiXK1B5EbD8Ek3TAql
 onkQfIsNK27h7viQS5deBZ4wJRYkT+YGHbkuT0qCseCPlO8nvvqmm7s9EtRHqCHy0QTgT
 sSslJQ3/NJUORe+SxgwBWesfoitIlyafVXRmpxFHbiKnDGCrJ3xLuE5u8hK76JxNoU6Bs
 nvWbv7cNGnRbeMtRz0lWW6zxtlz6ZZLL0LwrLrVeP8A7pJIjF3P4dXmKq/qZLmhNxJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791997858;
 h=Received-SPF:Received:DKIM-Signature:Received:DKIM-Signature:
 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
 Received:Received:Received:Received:Received:From:Date:Subject:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:
 References:In-Reply-To:To:CC:X-Mailer:X-EOPAttributedMessage:
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
 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
 bh=uzr3qQIYcZP2M+ltzg2A0U2Tu779EHiLSeF6FMttQhI=;
 b=g6KYoSnRZvb1na39aGbAawm3Xm/vWzRqevB1srz/bnzo4mWcYPMDq03hcDjm2BIuGL2J
 z6h9qZ2GkVCOcAFEYJCRWoXERN5/Ihc9cifFUoB0SCezmSsg/LAJlk4ShsHhFXfm6eJGs
 OrkpizTGpNvDKXIJwhEkNt1fPk+yJ0U1D0BbZvK7Sy5a+/r6gMgDVoGuZgNAuHwMSLjx8
 omBvGQaVEFyGYpwwEoZKZFbRW4CAOKAruuSSjMG9rfh/RUQ3tPL8Jy2hwokVvGE4QUPg0
 8dBEQiMKWdxCDg3YWpJHr/2oN/i1ZsNGAxyCsmQ/kc0eQzeAkDWg9Pwje3xZ5BMzBMQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=pass header.from=ti.com;
 dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=proofpoint-05-2026 header.b=CC8RNBGI; 
 dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com
 header.b=QIXHiNVm; 
 arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.150.75;
 helo=mx0a-0002e601.pphosted.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com
 [148.163.150.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB6CE807DC
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 17:10:57 +0000 (UTC)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
 by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69EEapXD3013058;
 Wed, 14 Oct 2026 12:10:56 -0500
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012000.outbound.protection.outlook.com [52.101.53.0])
 by m0384305.ppops.net (PPS) with ESMTPS id 4ha6ujaqdv-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2026 12:10:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAUEx3pbvxsRRvDVFDyTDmOM97iOOR2hzz2bIEQ48g3yhhChsJQ5CrfdrM7rnx0uZy2b490DfhFEdcHogunoK18cvFnkdyjUfIuBY0sdc0rm1/iI/YUMSagwVZFdHGvEc/h2+SXOZDrG1v40vF2IqJOe0E5mrzcciE+AdzfdtJ69tReB6ONBmfjwlVWG43wvi5Kduumxb1Czuj59DruetE8dKs5UzmGSNkqyAcmhFGhlME/SpP9XfUO7KsVWWf1Wn75jSWb+wfXtOHk9XvC3buLKC5fwBdxayrNWXsvqcFKyWiRLA/cZb+ah+owkuB+yb4ps81C53/9Ryj4dvjgXFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzr3qQIYcZP2M+ltzg2A0U2Tu779EHiLSeF6FMttQhI=;
 b=VV7JeXsw1jmvq47yBBwAuEo6oyULpfShz6ufWdE5JEIdz6e983ZKmua7lL9TQf+vi8v/7oljOdkzwR4FbPItMT3DAP2Pv7eHbNJMvJ6Hb5PN/qwNonB1ywCUkvW5g4TAQF21boU6iZ+SZYIWdLGfgFQp2/s7qy1ioNyTIyOEs9OwJjzsatBug8mkS/p1OU0zJGQmbDyuii/6hNw9klsdFBdCG8mTnkgr6ES13MTzyf7jgL7mVFlTqGSKqstMskuOC4Uh/55GTGis+e6CJU3gNwsmcEQMW7wOMxrF9czgBRt0Ehi3Dvzoh4cTJL8DIjjzMET3ZfOfWxQbaowFXla8zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
Received: from BY3PR04CA0029.namprd04.prod.outlook.com (2603:10b6:a03:217::34)
 by CH0PR10MB4988.namprd10.prod.outlook.com (2603:10b6:610:c8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.7; Wed, 14 Oct
 2026 17:10:46 +0000
Received: from SJ1PEPF000037B6.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::91) by BY3PR04CA0029.outlook.office365.com
 (2603:10b6:a03:217::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 17:10:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000037B6.mail.protection.outlook.com (10.167.244.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 17:10:46 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 12:10:15 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 12:10:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 14 Oct 2026 12:10:15 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.75.137])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69EHAFXi2717094;
 Wed, 14 Oct 2026 12:10:15 -0500
Date: Wed, 14 Oct 2026 12:10:13 -0500
MIME-Version: 1.0
Message-ID: <20261014-uboot-fixes-v1-3-2676fd37a97a@ti.com>
References: <20261014-uboot-fixes-v1-0-2676fd37a97a@ti.com>
In-Reply-To: <20261014-uboot-fixes-v1-0-2676fd37a97a@ti.com>
To: <buildroot@buildroot.org>
CC: Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>, "Bryan
 Brattlof" <bb@ti.com>
X-Mailer: b4 0.15.2
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B6:EE_|CH0PR10MB4988:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee86905-5a8e-46e1-1e61-08df2a161659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|6133799003|10067099003|18002099003|22082099003|261009223027099003|261009221227099003|56012099006;
X-Microsoft-Antispam-Message-Info: f/BPecC2AcCC0TGfrmjNtkvkQPrLXtTkr9/ac1M8+hfcx1mFSvheiKYuAqokEhM1uhbNMni8+i0bg9mLcT6httQJduYmVSBfVvHzTVoYs4ocx5MRzIBpvnwDKjUMJL3hauy+ePPlWbCSNptL4N0hNYaRw+ppEIY7BCCOkvtqG3BiZE9uhtNNAzZTGa6H/KToOklQZY/hM1GZluS2P3iGo6VETW2T0gZZNA+uczYXAgy6nf74+pZhWn6Qx/CFMHbv1rQMEshvED8hJ8c6gcfJ+/YP9ZsyTY1ff+TW9wBY3ATejkcjN77HqW3NQQ186fWkvxd5rGY9o0r2VL+hlMiItu5DsvGfYW9JXlJ6ehVNkslxFgRIG4URZf0O83+P1pol+RXvU2v1kpQbLt50LAQlibAUdbwZt7kIEpztXniGK/VgnBJBOQ/lOjpApYhIv0l88apfO1fmgEIgAoKtYDnQzKsHyONZjGukGVhIavu6iYOPvg1byKRbmRBHmx+Lvm1uphHQGTbQIhLfndVH2/yO2S0OMNV8LhPAxrakM2+qaOw5/hYoa5TTswARvBZuBfUb6ztQPKD6sznrnmYcNbql/YhLrWbYxzl5qXJZK9v1PWUJigzgy6zX+scj2VGvBgQyvUcYxoSBq2M0tmpXB3H/jUTlxQ0+IasBfuvH9vAPPY4iQxqdMUOoZFLwHzSxhEKIOsvkVcQGdnFSrffZwvEijw==
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(6133799003)(10067099003)(18002099003)(22082099003)(261009223027099003)(261009221227099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nv/fsLEkZGLGI4iNq3fk0Rddt2U6ViBW+GubNHFrKbX/3xeJF/dac2Pe1qzgHxIYOoW3WX5wVTNrIpkEgrDyTOuGBIHUkO8DynebDJMbJKVKa8WRleTKGqFkVDv5gE44XZtrUCIcA5qCLFhctya8Qsnlbai1RBwBMXWPQfQ/iNJjfrTX8ub8SCpLOFHBQzmAsc6EOQpihBlOF3XiVW2Abu1bg3D3iNCyWtuIOh3CmeMTsyQa3fGxcSB7a2msJ9Bkma6KXCQlF4bzOTJcUoIJ1kTKcEXKdEEnhHUJwzrinsUyvXKaqKyKs85FATpWXxUGk2wIVPRjFF7+rb+PN+D/7ld+gak2T4NK08Z5PpPgniWqy0zmq36Du2KoRnZF+5X6AXDezDFMozxxmb1yg9x5CPg2cvn8iT4L51T0qb8o7GF4kYpe9yhTM4OV+sLzicw/
X-Exchange-RoutingPolicyChecked: bdA/GsC0sSebHvGZA5kIkJIgyNzfQ+QpNtKtNJiEY/jbZ/6qDmHFcSjW3W5hGSNM/oCjbp47XWzME93nfRjfmINyz56HTkjslMFyeh2/79AV2LDxhH179pVS07JDV6pTYXq5L2UsZVzcjIX7btKJKNfxvL67cSzC3fK8kp5W9PTEE6BLGnOrK0ULF2BK7SL2Wo2GVNso8154KVALs9vgS3FZTH5xVCL64hmuBo+hjEIwDNdWE4BUOlWmDGW3r9ZZELijya+utXlebOnlSlBpDUm0EN1G9alVBGiBSIU0bHkD84XMwRCviW54y7Nnt5qJ20JRwyQ+UCcJqft7tveRtA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 17:10:46.1127 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee86905-5a8e-46e1-1e61-08df2a161659
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037B6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4988
X-Proofpoint-ORIG-GUID: 5GH-KD4uxTrZANwd4Jd4dELigGHkguKw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfX7jFvihtRxYNU
 P7djHNTu6oAS+NLoMykWktnsMJ0bn+pIOemhrG5NxCA+g3E+D2xcozwUW77HefPqUUb7r1Db63t
 9Iz/OMU/sAnJtWdJhnmm6iQGNQCbG3s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfX4ynWOCIhLvN/
 tpNRg/sSVYiGglQNAF5eDGqoI9wCn3OOUh1yxkpNOjh6mHoAkwCpGbHogPJxdrE0VdXq6YIDTkf
 XfuDIw6snWYZQeCGaOS3JcRfopzYXSj27TBtfehm5OYD5BaI0hSDTmM3mr3tGixkpQkFGmj7o4y
 Yl+j5bcO5Y2iCBa4iZqZ/KhD+SV0qttDRO6jPisxx65CYmRntfwRQnVCntKec2HmeG3P6c0sh6A
 NPZ+dkOOKwAektMlhftQ7zdpEcl3B67kjqxkLA3jvw3d6x+4ybbX8iAO2rLZ+hnly5YRKpXfC0h
 QHJfPfp/I4tG9F/jiNOWwHS/aLdyGnnMI9CQdXnz/kOoFJq2TXL/T5XTFrDoKK/L2RKlJlsjahB
 7YHph+FYYDr55tCgSw2w/B+7rLMKB+cYjEVZ56dMj6y2hA2foavpk+8pLgl9rpgTagIf/oo6X6A
 F6MLQOk0mT7Vzl4P3LQ==
X-Authority-Analysis: v=2.4 cv=U/cHnuru c=1 sm=1 tr=0 ts=6acfb7a0 cx=c_pps
 a=0Za+SRInewOPUeHoNPGlYA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=P-IC7800AAAA:8 a=pGLkceISAAAA:8 a=pUX4jX64KhXX4_uSt3AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 5GH-KD4uxTrZANwd4Jd4dELigGHkguKw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140068
Subject: [Buildroot] [PATCH 3/4] configs/ti_am64x_sk: bump tfa,
 linux and uboot versions
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVtcCB0aGUgYW02NHgtc2sgcmVmZXJlbmNlIGJvYXJkIHRvIHVzZSB0aGUgbGF0ZXN0IHN0YWJs
ZSB0ZmEsIHVib290CmFuZCBsaW51eCBrZXJuZWwgcmVsZWFzZXMgdG8gcHVsbCBpbiB0aGUgbGF0
ZXN0IGJ1ZyBmaXhlcyBhbmQgZmVhdHVyZXMuCgpCZWNhdXNlIHN3aWcgNC41LjAgcmVtb3ZlcyBz
dXBwb3J0IGZvciBQeXRob24gMiBjb21wYXRpYmlsaXR5IHdlIG5lZWQgdG8KYmFja3BvcnQgYSBw
YXRjaCBmb3IgVS1Cb290IHRvIHJlbW92ZSB0aGUgUHl0aG9uIDIgbWFjcm9zIGl0IHVzZXMgdG8K
Z2VuZXJhdGUgdGhlIGZpbmFsIGZpbXJ3YXJlIGltYWdlcy4KClNpZ25lZC1vZmYtYnk6IEJyeWFu
IEJyYXR0bG9mIDxiYkB0aS5jb20+Ci0tLQogLi4uL2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10
cnVzdGVkLWZpcm13YXJlLmhhc2ggfCAgMiArLQogYm9hcmQvdGkvYW02NHgtc2svcGF0Y2hlcy9s
aW51eC9saW51eC5oYXNoICAgICAgICAgfCAgMiArLQogLi4ucGxhY2UtcmVtb3ZlZC1TV0lHLVB5
dGhvbi0yLWNvbXBhdGliaWxpdHkucGF0Y2ggfCA2NSArKysrKysrKysrKysrKysrKysrKysrCiAu
Li5wbGFjZS1yZW1vdmVkLVNXSUctUHl0aG9uLTItY29tcGF0aWJpbGl0eS5wYXRjaCB8IDY1ICsr
KysrKysrKysrKysrKysrKysrKysKIGJvYXJkL3RpL2FtNjR4LXNrL3BhdGNoZXMvdWJvb3QvdWJv
b3QuaGFzaCAgICAgICAgIHwgIDIgKy0KIGNvbmZpZ3MvdGlfYW02NHhfc2tfZGVmY29uZmlnICAg
ICAgICAgICAgICAgICAgICAgIHwgMTAgKystLQogNiBmaWxlcyBjaGFuZ2VkLCAxMzggaW5zZXJ0
aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ib2FyZC90aS9hbTY0eC1zay9w
YXRjaGVzL2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZpcm13YXJlLmhhc2ggYi9i
b2FyZC90aS9hbTY0eC1zay9wYXRjaGVzL2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVk
LWZpcm13YXJlLmhhc2gKaW5kZXggOGI3N2UxZjE2NTNhLi4yZTI0YmNkMGRlNWIgMTAwNjQ0Ci0t
LSBhL2JvYXJkL3RpL2FtNjR4LXNrL3BhdGNoZXMvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRy
dXN0ZWQtZmlybXdhcmUuaGFzaAorKysgYi9ib2FyZC90aS9hbTY0eC1zay9wYXRjaGVzL2FybS10
cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZpcm13YXJlLmhhc2gKQEAgLTEsMiArMSwyIEBA
CiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICBjMGYyM2NjYzcxYzQ5OTg5ZTlhZDIzOGFj
ZjMzNDQ3M2MxN2I3Yzg4Zjc5YTIwYzgyOWMzZDQ0M2UzNzk0YTIyICBhcm0tdHJ1c3RlZC1maXJt
d2FyZS12Mi4xMS1naXQ0LnRhci5negorc2hhMjU2ICBiODA3ZDhiZjE5MGI3YzQ2YjQyNjA3Mjli
NGJiZTJmN2RmODNjZDEwODZlZGNiMTgxZDY2NTk1YWU2NTk4ZDIzICBhcm0tdHJ1c3RlZC1maXJt
d2FyZS12Mi4xNS4wLWdpdDQudGFyLmd6CmRpZmYgLS1naXQgYS9ib2FyZC90aS9hbTY0eC1zay9w
YXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2ggYi9ib2FyZC90aS9hbTY0eC1zay9wYXRjaGVzL2xpbnV4
L2xpbnV4Lmhhc2gKaW5kZXggNTNlYjE0Mzg5NDViLi4yMjliMDliMzU1OGYgMTAwNjQ0Ci0tLSBh
L2JvYXJkL3RpL2FtNjR4LXNrL3BhdGNoZXMvbGludXgvbGludXguaGFzaAorKysgYi9ib2FyZC90
aS9hbTY0eC1zay9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2gKQEAgLTEsMiArMSwyIEBACiAjIExv
Y2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICA3NzQ2OTg0MjJlZTU0YzVmMWU3MDQ0NTZmMzdjNjVj
MDZiNTFiNGU5YThiMDg2NmYzNDU4MGQ4NmZlZjhlMjI2ICBsaW51eC02LjEwLnRhci54egorc2hh
MjU2ICAyZmVhYTcwNDUzZTkxZjU0MWJlNmE1YzkwNzhkODE2OGUwODFhZjQ1YTNkOTcxODA1NDg1
MDUzOGNmZjJlYmYzICBsaW51eC03LjIuMTAudGFyLnh6CmRpZmYgLS1naXQgYS9ib2FyZC90aS9h
bTY0eC1zay9wYXRjaGVzL3RpLWszLXI1LWxvYWRlci8wMDAxLXB5bGliZmR0LVJlcGxhY2UtcmVt
b3ZlZC1TV0lHLVB5dGhvbi0yLWNvbXBhdGliaWxpdHkucGF0Y2ggYi9ib2FyZC90aS9hbTY0eC1z
ay9wYXRjaGVzL3RpLWszLXI1LWxvYWRlci8wMDAxLXB5bGliZmR0LVJlcGxhY2UtcmVtb3ZlZC1T
V0lHLVB5dGhvbi0yLWNvbXBhdGliaWxpdHkucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMDAwLi5lNWIxNDhlYzU1YTUKLS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC90
aS9hbTY0eC1zay9wYXRjaGVzL3RpLWszLXI1LWxvYWRlci8wMDAxLXB5bGliZmR0LVJlcGxhY2Ut
cmVtb3ZlZC1TV0lHLVB5dGhvbi0yLWNvbXBhdGliaWxpdHkucGF0Y2gKQEAgLTAsMCArMSw2NSBA
QAorRnJvbSA1MjcxMTVlZjY3ODNjZWM0OWU1NjEwYzUyM2MxMjRiMzk5MDExMzYxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbTogSmFpcGF1bCBDaGVlcm5hbSA8amFpcGF1bC5jaGVlcm5h
bUBlc3QudGVjaD4KK0RhdGU6IFR1ZSwgMTEgQXVnIDIwMjYgMTU6MzQ6MzMgKzAyMDAKK1N1Ympl
Y3Q6IFtQQVRDSF0gcHlsaWJmZHQ6IFJlcGxhY2UgcmVtb3ZlZCBTV0lHIFB5dGhvbiAyIGNvbXBh
dGliaWxpdHkgbWFjcm9zCitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3Bs
YWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK1NX
SUcgNC41LjAgcmVtb3ZlZCBQeXRob24gMiBjb21wYXRpYmlsaXR5IG1hY3JvcyAoUHlJbnRfKiwg
UHlTdHJpbmdfKikKK2Zyb20gaXRzIHJ1bnRpbWUgaGVhZGVyIHB5aGVhZC5zd2cgKHNlZSBjb21t
aXQgNzlmN2EyYjdjYjdkKS4gUmVwbGFjZQordGhlbSB3aXRoIHRoZWlyIFB5dGhvbiAzIEMgQVBJ
IGVxdWl2YWxlbnRzOgorCistIFB5U3RyaW5nX0Zyb21TdHJpbmcgLT4gUHlVbmljb2RlX0Zyb21T
dHJpbmcKKy0gUHlTdHJpbmdfQXNTdHJpbmcgLT4gUHlCeXRlc19Bc1N0cmluZworLSBQeUludF9B
c0xvbmcgLT4gUHlMb25nX0FzTG9uZworCitUaGUgcmVwbGFjZW1lbnRzIGFyZSBzYWZlIHNpbmNl
IHRoZSBtYWNyb3Mgd2VyZSBhbHJlYWR5IGFsaWFzZWQgdG8KK3RoZXNlIGV4YWN0IGZ1bmN0aW9u
cyBpbiBTV0lHJ3MgUHl0aG9uIDMgY29kZSBwYXRoLgorCitUaGlzIGlzIGEgYmFja3BvcnQgb2Yg
ZHRjIGNvbW1pdCA1MDA4ZDFkNmEzNTYgKCJweWxpYmZkdDogUmVwbGFjZQorcmVtb3ZlZCBTV0lH
IFB5dGhvbiAyIGNvbXBhdGliaWxpdHkgbWFjcm9zIikuCisKK1NpZ25lZC1vZmYtYnk6IEphaXBh
dWwgQ2hlZXJuYW0gPGphaXBhdWwuY2hlZXJuYW1AZXN0LnRlY2g+CitSZXZpZXdlZC1ieTogSsOp
csOpbWllIERhdXRoZXJpYmVzIDxqZXJlbWllLmRhdXRoZXJpYmVzQGJvb3RsaW4uY29tPgorVGVz
dGVkLWJ5OiBKw6lyw6ltaWUgRGF1dGhlcmliZXMgPGplcmVtaWUuZGF1dGhlcmliZXNAYm9vdGxp
bi5jb20+CitTaWduZWQtb2ZmLWJ5OiBQZXRlciBSb2JpbnNvbiA8cGJyb2JpbnNvbkBnbWFpbC5j
b20+CitSZXZpZXdlZC1ieTogUGV0ZXIgUm9iaW5zb24gPHBicm9iaW5zb25AZ21haWwuY29tPgor
LS0tCisgc2NyaXB0cy9kdGMvcHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBlZCB8IDYgKysrLS0tCisg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKKworZGlmZiAt
LWdpdCBhL3NjcmlwdHMvZHRjL3B5bGliZmR0L2xpYmZkdC5pX3NoaXBwZWQgYi9zY3JpcHRzL2R0
Yy9weWxpYmZkdC9saWJmZHQuaV9zaGlwcGVkCitpbmRleCBlNDY1OTQ4OWE5NmFiLi4zMjZhMTVj
Nzk0MWUzIDEwMDY0NAorLS0tIGEvc2NyaXB0cy9kdGMvcHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBl
ZAorKysrIGIvc2NyaXB0cy9kdGMvcHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBlZAorQEAgLTEwMzMs
NyArMTAzMyw3IEBAIHR5cGVkZWYgdWludDMyX3QgZmR0MzJfdDsKKyAJUHlPYmplY3QgKmJ1ZmY7
CisgCisgCWlmICgkMSkgeworLQkJcmVzdWx0b2JqID0gUHlTdHJpbmdfRnJvbVN0cmluZygKKysJ
CXJlc3VsdG9iaiA9IFB5VW5pY29kZV9Gcm9tU3RyaW5nKAorIAkJCWZkdF9zdHJpbmcoZmR0MSwg
ZmR0MzJfdG9fY3B1KCQxLT5uYW1lb2ZmKSkpOworIAkJYnVmZiA9IFB5Qnl0ZUFycmF5X0Zyb21T
dHJpbmdBbmRTaXplKAorIAkJCShjb25zdCBjaGFyICopKCQxICsgMSksIGZkdDMyX3RvX2NwdSgk
MS0+bGVuKSk7CitAQCAtMTA2NCwxMyArMTA2NCwxMyBAQCB0eXBlZGVmIHVpbnQzMl90IGZkdDMy
X3Q7CisgICAgICAgICB9CisgICAgICAgICAkMSA9IFB5Qnl0ZXNfQXNTdHJpbmcoJGlucHV0KTsK
KyAgICAgJSNlbHNlCistICAgICAgICAkMSA9IFB5U3RyaW5nX0FzU3RyaW5nKCRpbnB1dCk7ICAg
LyogY2hhciAqc3RyICovCisrICAgICAgICAkMSA9IFB5Qnl0ZXNfQXNTdHJpbmcoJGlucHV0KTsg
ICAvKiBjaGFyICpzdHIgKi8KKyAgICAgJSNlbmRpZgorIH0KKyAKKyAvKiB0eXBlbWFwcyB1c2Vk
IGZvciBmZHRfbmV4dF9ub2RlKCkgKi8KKyAldHlwZW1hcChpbiwgbnVtaW5wdXRzPTEpIGludCAq
ZGVwdGggKGludCBkZXB0aCkgeworLSAgIGRlcHRoID0gKGludCkgUHlJbnRfQXNMb25nKCRpbnB1
dCk7CisrICAgZGVwdGggPSAoaW50KSBQeUxvbmdfQXNMb25nKCRpbnB1dCk7CisgICAgJDEgPSAm
ZGVwdGg7CisgfQorIAorCitiYXNlLWNvbW1pdDogMTI2MmU1MGEzNGEwZTAxZjk3NGU4ZDkwOWM1
YjI1NWY4ZmE3MTk5ZQorLS0gCisyLjU1LjAKKwpkaWZmIC0tZ2l0IGEvYm9hcmQvdGkvYW02NHgt
c2svcGF0Y2hlcy91Ym9vdC8wMDAxLXB5bGliZmR0LVJlcGxhY2UtcmVtb3ZlZC1TV0lHLVB5dGhv
bi0yLWNvbXBhdGliaWxpdHkucGF0Y2ggYi9ib2FyZC90aS9hbTY0eC1zay9wYXRjaGVzL3Vib290
LzAwMDEtcHlsaWJmZHQtUmVwbGFjZS1yZW1vdmVkLVNXSUctUHl0aG9uLTItY29tcGF0aWJpbGl0
eS5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmU1YjE0OGVj
NTVhNQotLS0gL2Rldi9udWxsCisrKyBiL2JvYXJkL3RpL2FtNjR4LXNrL3BhdGNoZXMvdWJvb3Qv
MDAwMS1weWxpYmZkdC1SZXBsYWNlLXJlbW92ZWQtU1dJRy1QeXRob24tMi1jb21wYXRpYmlsaXR5
LnBhdGNoCkBAIC0wLDAgKzEsNjUgQEAKK0Zyb20gNTI3MTE1ZWY2NzgzY2VjNDllNTYxMGM1MjNj
MTI0YjM5OTAxMTM2MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IEphaXBhdWwgQ2hl
ZXJuYW0gPGphaXBhdWwuY2hlZXJuYW1AZXN0LnRlY2g+CitEYXRlOiBUdWUsIDExIEF1ZyAyMDI2
IDE1OjM0OjMzICswMjAwCitTdWJqZWN0OiBbUEFUQ0hdIHB5bGliZmR0OiBSZXBsYWNlIHJlbW92
ZWQgU1dJRyBQeXRob24gMiBjb21wYXRpYmlsaXR5IG1hY3JvcworTUlNRS1WZXJzaW9uOiAxLjAK
K0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zl
ci1FbmNvZGluZzogOGJpdAorCitTV0lHIDQuNS4wIHJlbW92ZWQgUHl0aG9uIDIgY29tcGF0aWJp
bGl0eSBtYWNyb3MgKFB5SW50XyosIFB5U3RyaW5nXyopCitmcm9tIGl0cyBydW50aW1lIGhlYWRl
ciBweWhlYWQuc3dnIChzZWUgY29tbWl0IDc5ZjdhMmI3Y2I3ZCkuIFJlcGxhY2UKK3RoZW0gd2l0
aCB0aGVpciBQeXRob24gMyBDIEFQSSBlcXVpdmFsZW50czoKKworLSBQeVN0cmluZ19Gcm9tU3Ry
aW5nIC0+IFB5VW5pY29kZV9Gcm9tU3RyaW5nCistIFB5U3RyaW5nX0FzU3RyaW5nIC0+IFB5Qnl0
ZXNfQXNTdHJpbmcKKy0gUHlJbnRfQXNMb25nIC0+IFB5TG9uZ19Bc0xvbmcKKworVGhlIHJlcGxh
Y2VtZW50cyBhcmUgc2FmZSBzaW5jZSB0aGUgbWFjcm9zIHdlcmUgYWxyZWFkeSBhbGlhc2VkIHRv
Cit0aGVzZSBleGFjdCBmdW5jdGlvbnMgaW4gU1dJRydzIFB5dGhvbiAzIGNvZGUgcGF0aC4KKwor
VGhpcyBpcyBhIGJhY2twb3J0IG9mIGR0YyBjb21taXQgNTAwOGQxZDZhMzU2ICgicHlsaWJmZHQ6
IFJlcGxhY2UKK3JlbW92ZWQgU1dJRyBQeXRob24gMiBjb21wYXRpYmlsaXR5IG1hY3JvcyIpLgor
CitTaWduZWQtb2ZmLWJ5OiBKYWlwYXVsIENoZWVybmFtIDxqYWlwYXVsLmNoZWVybmFtQGVzdC50
ZWNoPgorUmV2aWV3ZWQtYnk6IErDqXLDqW1pZSBEYXV0aGVyaWJlcyA8amVyZW1pZS5kYXV0aGVy
aWJlc0Bib290bGluLmNvbT4KK1Rlc3RlZC1ieTogSsOpcsOpbWllIERhdXRoZXJpYmVzIDxqZXJl
bWllLmRhdXRoZXJpYmVzQGJvb3RsaW4uY29tPgorU2lnbmVkLW9mZi1ieTogUGV0ZXIgUm9iaW5z
b24gPHBicm9iaW5zb25AZ21haWwuY29tPgorUmV2aWV3ZWQtYnk6IFBldGVyIFJvYmluc29uIDxw
YnJvYmluc29uQGdtYWlsLmNvbT4KKy0tLQorIHNjcmlwdHMvZHRjL3B5bGliZmR0L2xpYmZkdC5p
X3NoaXBwZWQgfCA2ICsrKy0tLQorIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9zY3JpcHRzL2R0Yy9weWxpYmZkdC9saWJmZHQu
aV9zaGlwcGVkIGIvc2NyaXB0cy9kdGMvcHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBlZAoraW5kZXgg
ZTQ2NTk0ODlhOTZhYi4uMzI2YTE1Yzc5NDFlMyAxMDA2NDQKKy0tLSBhL3NjcmlwdHMvZHRjL3B5
bGliZmR0L2xpYmZkdC5pX3NoaXBwZWQKKysrKyBiL3NjcmlwdHMvZHRjL3B5bGliZmR0L2xpYmZk
dC5pX3NoaXBwZWQKK0BAIC0xMDMzLDcgKzEwMzMsNyBAQCB0eXBlZGVmIHVpbnQzMl90IGZkdDMy
X3Q7CisgCVB5T2JqZWN0ICpidWZmOworIAorIAlpZiAoJDEpIHsKKy0JCXJlc3VsdG9iaiA9IFB5
U3RyaW5nX0Zyb21TdHJpbmcoCisrCQlyZXN1bHRvYmogPSBQeVVuaWNvZGVfRnJvbVN0cmluZygK
KyAJCQlmZHRfc3RyaW5nKGZkdDEsIGZkdDMyX3RvX2NwdSgkMS0+bmFtZW9mZikpKTsKKyAJCWJ1
ZmYgPSBQeUJ5dGVBcnJheV9Gcm9tU3RyaW5nQW5kU2l6ZSgKKyAJCQkoY29uc3QgY2hhciAqKSgk
MSArIDEpLCBmZHQzMl90b19jcHUoJDEtPmxlbikpOworQEAgLTEwNjQsMTMgKzEwNjQsMTMgQEAg
dHlwZWRlZiB1aW50MzJfdCBmZHQzMl90OworICAgICAgICAgfQorICAgICAgICAgJDEgPSBQeUJ5
dGVzX0FzU3RyaW5nKCRpbnB1dCk7CisgICAgICUjZWxzZQorLSAgICAgICAgJDEgPSBQeVN0cmlu
Z19Bc1N0cmluZygkaW5wdXQpOyAgIC8qIGNoYXIgKnN0ciAqLworKyAgICAgICAgJDEgPSBQeUJ5
dGVzX0FzU3RyaW5nKCRpbnB1dCk7ICAgLyogY2hhciAqc3RyICovCisgICAgICUjZW5kaWYKKyB9
CisgCisgLyogdHlwZW1hcHMgdXNlZCBmb3IgZmR0X25leHRfbm9kZSgpICovCisgJXR5cGVtYXAo
aW4sIG51bWlucHV0cz0xKSBpbnQgKmRlcHRoIChpbnQgZGVwdGgpIHsKKy0gICBkZXB0aCA9IChp
bnQpIFB5SW50X0FzTG9uZygkaW5wdXQpOworKyAgIGRlcHRoID0gKGludCkgUHlMb25nX0FzTG9u
ZygkaW5wdXQpOworICAgICQxID0gJmRlcHRoOworIH0KKyAKKworYmFzZS1jb21taXQ6IDEyNjJl
NTBhMzRhMGUwMWY5NzRlOGQ5MDljNWIyNTVmOGZhNzE5OWUKKy0tIAorMi41NS4wCisKZGlmZiAt
LWdpdCBhL2JvYXJkL3RpL2FtNjR4LXNrL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaCBiL2JvYXJk
L3RpL2FtNjR4LXNrL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaAppbmRleCBmZTliNGY1M2RjNjMu
LmZmNmU0ZWQyZTJmNiAxMDA2NDQKLS0tIGEvYm9hcmQvdGkvYW02NHgtc2svcGF0Y2hlcy91Ym9v
dC91Ym9vdC5oYXNoCisrKyBiL2JvYXJkL3RpL2FtNjR4LXNrL3BhdGNoZXMvdWJvb3QvdWJvb3Qu
aGFzaApAQCAtMSwyICsxLDIgQEAKICMgTG9jYWxseSBjYWxjdWxhdGVkCi1zaGEyNTYgIGY1OTFk
YTlhYjkwZWYzZDZiM2QxNzM3NjZkMGRkZmY5MGM0ZWQ3MzMwNjgwODk3NDg2MTE3ZGYzOTBkODNj
OGYgIHUtYm9vdC0yMDI0LjA3LnRhci5iejIKK3NoYTI1NiAgNzhlOGJmYzM4MmZlMzg4ZjliNTVh
YTFkYWY4YzU2MzUyMmEwMzc3NzliNWQ0YzM0OWQxNDE1ZTM4MWYxMjQzZSAgdS1ib290LTIwMjYu
MDcudGFyLmJ6MgpkaWZmIC0tZ2l0IGEvY29uZmlncy90aV9hbTY0eF9za19kZWZjb25maWcgYi9j
b25maWdzL3RpX2FtNjR4X3NrX2RlZmNvbmZpZwppbmRleCBmMzE5ODllMWU3MGIuLmY5MTQ0MzZk
MmQ3YyAxMDA2NDQKLS0tIGEvY29uZmlncy90aV9hbTY0eF9za19kZWZjb25maWcKKysrIGIvY29u
Zmlncy90aV9hbTY0eF9za19kZWZjb25maWcKQEAgLTEwLDcgKzEwLDcgQEAgQlIyX1JPT1RGU19Q
T1NUX0JVSUxEX1NDUklQVF9BUkdTPSItYyB0dHlTMiwxMTUyMDBuOCAtZCBrMy1hbTY0Mi1zay5k
dGIgLWwgYW02NHgKIEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFRfQVJHUz0iLWMgYm9hcmQv
dGkvYW02NHgtc2svZ2VuaW1hZ2UuY2ZnIgogQlIyX0xJTlVYX0tFUk5FTD15CiBCUjJfTElOVVhf
S0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKLUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05f
VkFMVUU9IjYuMTAiCitCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI3LjIu
MTAiCiBCUjJfTElOVVhfS0VSTkVMX1VTRV9BUkNIX0RFRkFVTFRfQ09ORklHPXkKIEJSMl9MSU5V
WF9LRVJORUxfRFRTX1NVUFBPUlQ9eQogQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9
InRpL2szLWFtNjQyLXNrIgpAQCAtMTgsMTAgKzE4LDEwIEBAIEJSMl9QQUNLQUdFX0xJTlVYX0ZJ
Uk1XQVJFPXkKIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX1RJX1dMMThYWD15CiBCUjJfVEFS
R0VUX1JPT1RGU19FWFQyPXkKIEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15Ci1CUjJfVEFSR0VU
X1JPT1RGU19FWFQyX1NJWkU9IjEyME0iCitCUjJfVEFSR0VUX1JPT1RGU19FWFQyX1NJWkU9IjE4
ME0iCiBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFPXkKIEJSMl9UQVJHRVRfQVJNX1RS
VVNURURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT049eQotQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9G
SVJNV0FSRV9DVVNUT01fVkVSU0lPTl9WQUxVRT0idjIuMTEiCitCUjJfVEFSR0VUX0FSTV9UUlVT
VEVEX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSJ2Mi4xNS4wIgogQlIyX1RBUkdFVF9B
Uk1fVFJVU1RFRF9GSVJNV0FSRV9QTEFURk9STT0iazMiCiBCUjJfVEFSR0VUX0FSTV9UUlVTVEVE
X0ZJUk1XQVJFX1RBUkdFVF9CT0FSRD0ibGl0ZSIKIEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklS
TVdBUkVfQkwzMl9PUFRFRT15CkBAIC0yOSwxMiArMjksMTIgQEAgQlIyX1RBUkdFVF9PUFRFRV9P
Uz15CiBCUjJfVEFSR0VUX09QVEVFX09TX1BMQVRGT1JNPSJrMy1hbTY0eCIKIEJSMl9UQVJHRVRf
VElfSzNfUjVfTE9BREVSPXkKIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX0NVU1RPTV9WRVJT
SU9OPXkKLUJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIy
MDI0LjA3IgorQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9
IjIwMjYuMDciCiBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9CT0FSRF9ERUZDT05GSUc9ImFt
NjR4X2V2bV9yNSIKIEJSMl9UQVJHRVRfVUJPT1Q9eQogQlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9T
WVNURU1fS0NPTkZJRz15CiBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OPXkKLUJSMl9U
QVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjQuMDciCitCUjJfVEFSR0VUX1VC
T09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDI2LjA3IgogQlIyX1RBUkdFVF9VQk9PVF9CT0FS
RF9ERUZDT05GSUc9ImFtNjR4X2V2bV9hNTMiCiBCUjJfVEFSR0VUX1VCT09UX05FRURTX0RUQz15
CiBCUjJfVEFSR0VUX1VCT09UX05FRURTX09QRU5TU0w9eQoKLS0gCjIuNTUuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
