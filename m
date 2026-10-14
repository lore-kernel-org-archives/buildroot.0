Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5B3CC6B2D
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 17:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DDD7807DC;
	Wed, 14 Oct 2026 17:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TcgSwfvDoJ7v; Wed, 14 Oct 2026 17:10:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B41AE807E5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791997859;
	b=SRUDdwdQfUWwLahKvffZ4gL9ypMaElTXD6bgDOxA9iXviaqact0EeffMGb8H6AZHU8Pq
	 sfGwnwq5Qxj1DzONfEJMOX2QQnPmJnPWanIq5w9wAl5sypd3Rr30ihFy0bN7LZpJY8Gjl
	 UxDfEVyndiYQGIsgkVVmk9eQXnKeP88m5+IyTyUHv6vJba/kfPMchC2UFTJ8rVO39jK60
	 SX0ILiMOohg/Dtvu6+Fr+jUFq2rL1SLLuuDuthULhdLMAqPXACoeoVkjCMnom09JajOjF
	 PJrGVUjH9NPn9CdcVpiK/ZB78oBozjeuKp910ZBFnDSrsvUK3zP3ehvAsgpmVeYynVQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791997859;
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ckhV7Smj/dymkq6+vnlwXL6XKkBmbZm6aZlKKjvxHf4=;
	b=KPQIR9olpx4jQhxEZqvujT8KBfmk8TjXxNPFZjuKljTsFve6fYUSoR1DW+liYQ1uf/lM
	 UVf39UwFOIo0RkQKn+AuI2p3wv9g8HhJIGmD1u8XykNeAjxUJlMXDXn8AWoHNxbU/tP9s
	 ugKBGxLOGfo2n8t77mWaQ4II2KrIkIoJkZtzx01FYxGTwscwb8GJJzqL107GE8hDSH7Jy
	 od+gX2+KvOaCn/PEeWOf2TzvaG950kx5Rl1R1la51FqVZIjEQBMr3Ro3gr1lmRPniI1DP
	 oXCPWGd7H3gZ2sdIY67CleeMb1uminwzvKWKOw822gdYAStZzqJcXJIcmC81d8edgWg==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791997859;
	bh=ckhV7Smj/dymkq6+vnlwXL6XKkBmbZm6aZlKKjvxHf4=;
	h=Date:References:In-Reply-To:To:CC:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cxneH2ugg7iAohc3xE3G0AuX+sHvRML28HM2y7TV6RjE0KcW7EPOpVhp90P+h6knh
	 cqcBU4iITSEl0MiQh8rpXH0JFOcVqTOmcNapTE+qiO6dSw6rMy3E7LY09QKT91je+F
	 eottcxvfDqgUGzWy3rg0Zgr5ydWHhYNYumzkfD3ufxpStLy6hAtyhOecjgGucr+y1I
	 03Z7lpRhpA6opZJ/ncd7NvfE28ZdVvo/fibwhOB6bKBLNkjq2F2a7eYO4IQHFyCyw9
	 0cYMW4TDr5peYbbV7PSyCFAHsNKOgQiebsdLPK9wOebGetyWmSAtqohm9GNDa/e5OK
	 p06c8UM6x68Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B41AE807E5;
	Wed, 14 Oct 2026 17:10:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 841B92AC
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 17:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6956D4036E
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 17:10:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MhN1zuXAWWHp for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 17:10:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4A044401A3
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791997856;
 b=RHI6kupkMrNDxCiZJHpD25M2QHJiEw8bsPyhwCGAMen2vHmm3WWpKHuTFzKxqbGC9osH
 h/2hdW4EroS8TZDJw1zOCMaEMOZg6ja3huCBzoTYTRj/y0OEXmuptLgfke2WnIHh2rM3G
 rbzK7WcngUQA4oGpAj+likhbXd/ahF2GPmLWHnyvu/Rf+WZLae8NRiPOKWba9bAjk89Oo
 KCdQ1Ol5QFl7u9OdPVfPRGT10I/SkukZ7kpUMAn8R0B4P6SY/Rt0ieTn6xihcluBfneHM
 nHw5unBfcX51Nyrp8svP6GeT0KYMC8HPhvCPW6Np0SxNkBdZTdOwhaLBff1S5xGbC2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791997856;
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
 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
 bh=v0ojHH8yfDa3NKbXVxDKeoYmoMA9gwZebiwiDbJ/TEQ=;
 b=BG1W0Z3Txvet9LNLdehdJX7lqG+zziR6Rj3dTftikWUPj+J7jkR0nXfkNUGWGyb6ixxS
 ajuXtlFaKWGOnyULK65YHuDNr8n4q/zWi32Nz3iiZw0La98tNdtg2YpS5GmilodAhrF9C
 CwJoGckJoim1DRTdQgJftCY7+A/Qt5q78Cjuna2JQE2NGScUPFgHf+WMcUEcdjxKUtXbb
 7UGkL0sCxXXDhHoEAM4X6R8jfUsgIx+s8QkyMtB1vOwqC0H2yZLyXFMsRhdaDog11PMVt
 SmCZ/ME8FFY7dTFvGSUm+gtgFa4XVlqgcO0JVKQtJaNmCIayxFOnre/ORwh1dCboKZQ==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=ti.com;
 dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=proofpoint-05-2026 header.b=dB5nzZBt; 
 dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com
 header.b=jpweElqt; 
 arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.150.75;
 helo=mx0a-0002e601.pphosted.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com
 [148.163.150.75])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A044401A3
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 17:10:55 +0000 (UTC)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
 by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69EEaf1p3713208;
 Wed, 14 Oct 2026 12:10:55 -0500
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11012058.outbound.protection.outlook.com
 [40.93.195.58])
 by m0380145.ppops.net (PPS) with ESMTPS id 4ha6xcjqrm-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2026 12:10:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgxnkrInak+AWRiJk6bIexr1x3TF2DAKeS9f9TxUnHec3KgLTfDIRhcZ3Cv1tsUKk50Je5dE59cvRm5LAaOHHkEq8OyIi/Gdrh7dCOxBZRE9Sul7wcP6vnevXoLYOkqcM/ObgcOpVoeD0s2uE16jnvcd8770OU1/1AzWroJQQOXOLWyxhzQlzSAPl1awzIG7EQ+3r4JrosOKiv4oR+AUevg6YjRYZbx0G6QJehDdvAZRhWwlv6alCHTKUyr6hQ3z3jZl0s5kpKbe3TiQqXyaapQGJAyYk/cX9mOT4gPf75YtOMj0aW1+qvd+u5hphFfxRcvwgyrFFTihfSHju+WigQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0ojHH8yfDa3NKbXVxDKeoYmoMA9gwZebiwiDbJ/TEQ=;
 b=veqAbHTe9tCwkSl1ZNtXJbJb0Pi+pxPjVPDd+rUOpAstaBw32z4ONShTAkwNlIpc0/awL3s2oI2NJZ35AjZKWWnQSBqeHpT9Tlme3tuvu6UXrSwczo5XjU1Wv99caO7OVRmakB5et1VeXq9BoURYrjpL6uTlU+RJzQS67+nLbHEU2XirA8KYKQwL5n34iyniX5teNPo5NrHlxijvtmTJtQFYxeb4xGpiBdSOWslnWZh56PfV8zP6UdgivrdgD3Gb8z2WVNbOwo8v1dBFBpgeuse5G/m+6dVUxpPz78BZ1ZJQJCA6sms+zVnBiPblRbfIYJG8lnr2mrTQTy+58F83VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
Received: from BY3PR04CA0006.namprd04.prod.outlook.com (2603:10b6:a03:217::11)
 by PH7PR10MB7801.namprd10.prod.outlook.com (2603:10b6:510:308::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.7; Wed, 14 Oct
 2026 17:10:48 +0000
Received: from SJ1PEPF000037B6.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::82) by BY3PR04CA0006.outlook.office365.com
 (2603:10b6:a03:217::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
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
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
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
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69EHAFVn1775703;
 Wed, 14 Oct 2026 12:10:15 -0500
Date: Wed, 14 Oct 2026 12:10:14 -0500
MIME-Version: 1.0
Message-ID: <20261014-uboot-fixes-v1-4-2676fd37a97a@ti.com>
References: <20261014-uboot-fixes-v1-0-2676fd37a97a@ti.com>
In-Reply-To: <20261014-uboot-fixes-v1-0-2676fd37a97a@ti.com>
To: <buildroot@buildroot.org>
CC: Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>, "Bryan
 Brattlof" <bb@ti.com>
X-Mailer: b4 0.15.2
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B6:EE_|PH7PR10MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: e93275f8-147c-40fb-256f-08df2a1616af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|6133799003|18002099003|10067099003|22082099003|261009223027099003|261009221227099003|56012099006;
X-Microsoft-Antispam-Message-Info: WYJWiSJEQEIQ7n+OlBtYp+wwuBwX0f8vYjWQjdPbJm6iLNM+LjdYflLHEa4cIzn8hmBpKm7mLgn19H5/kl5SBrO9rpMH3C7NvbyRrkVFR++kBQVrKbjjMh4gfrMvWKZAGpQazDB6t2SdCnrWCwtdQYLnKi1zuruYnHUnTzeIG1I2HhsrHRiV0nJMaenSAD9RS5waXhAZgWXrKQLn+S06mLO5Kmmgwo4Deg/l+ZEzV34i1arOOedN5V35MYEx9mZpdDEkTmQwhtUq66KrJaqKLIA+okU2ZgXT2TaMVlZB0y0LEWEo1ehHXp3evE6MMSFvHpCT//GIJAe8kOBxJvQCScA9FyQdzwglFVvxkqoH1hG+a6iFgwks9fuXyk+/cmxRfbewGcBy60hYEQc45YafNZm1Ne/6NsF08CoD1q+7eyB0wdw4O2g5zXK76CbystbHuYvhkB2wUzsUjGjgoiM0spaZpn907oY+xnxy7t0xumYalhmSViV/zcIFxF39HzaJQXZHqIZiFZrOqUx7oIoZGt79FzflYWIu16YJ/xSEnFoLCPBwXVIarte3s+6r5uoC61ivOrf5XW7MckXuze3H8iB7xr3UuG+6lcquD+XxmC63+eiBPrYO2dTFwt46E6kdOwLgeBHD2/g132EI4e9Ejrh2rquK79wjvkk46kaB7r1iMsDclLFVIiF7U/1ggBB7th7b+uHb9OjPGnk7D37lrQ==
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(6133799003)(18002099003)(10067099003)(22082099003)(261009223027099003)(261009221227099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Y42YZN1SrW8c8aDcw4Z3vwv/WnXnnPtkrQ2MgFmpdri6UfNAseg3oSUTjAYDx/FKHCon0K2C1mGg4a2NasjEqP3jbZ9iP9ocXmZkZvrwGuLnr/jpOMb5kMVMsBP0ftwSpt45OeyKVxroug/iRH2KKVH0pIi++8WBFIkVwiwo0VgRR5idcBUHUrM8Xu6U/4fuzfVG3Vj4HI6i0xSLXNgEWgp6ED1XGZX2ud+o5np9/5PB2JuALUttzztiwZrDJE3IQc1kP61fsynkToymJdb1uHkba4cUztB8pgAMlnsppvtqe+oD2RNYfWhKVoFEdjiu1IFmVbFf0L+v2t8RkHKVamZzktVA7K1tCGnuSiUnQ3LfZgMtJdMjAS0gr/g8gRD0YrUpZCOyc1TrCd85iSmpasEYUURj1YiBsm2ItLshrxdiJkKUDS+0FF4L/QbKsWit
X-Exchange-RoutingPolicyChecked: MYk9f6kCVihGISKi4k7FvG68vT7bvaaM1N7RhfcgSOKgikQwMTrv10HY5btHczAGJyvxc3RzIhCozItsVuXat4ZTSugSmRGafUjG/AKhEmsrbdXkxofhc0NG/Qxph7QFB16JIALL2kmiNW19mPc433kMuykrW4dDIBLka5FUpOqwn84EFunKk/o47+msxaDmmEue61F+TQGI6/GlxBSL3V7gUgaDYWjGSaIz6mBBhY0g1vCIihyr1fQaMelbyrubZxRDGDVjwV+/1Hrh7z9sklJUbnp818he2YfA0DKwvmLsaE8rnJbWEtgsjkQJJwNaWQoF4SdWboFFQ/MZl9NG6A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 17:10:46.6886 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e93275f8-147c-40fb-256f-08df2a1616af
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037B6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7801
X-Authority-Analysis: v=2.4 cv=fMysTpae c=1 sm=1 tr=0 ts=6acfb79f cx=c_pps
 a=3V5Erj4uy8rJXAE3nhxHpg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=P-IC7800AAAA:8 a=pGLkceISAAAA:8 a=cSuE3sNe0L0gGS49nMEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: RWR7gxms1aTN9fKSRcWbWwMI5RsEOBoH
X-Proofpoint-GUID: RWR7gxms1aTN9fKSRcWbWwMI5RsEOBoH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfX7ppz1Mc/Y2hi
 zsntGdAEYfBlVNEYvHKUGW8bj8Rxdzc/Bx3iwlFJMAe5C098OcDhsOnFCKd7lrQ/nAwCM0T2H/F
 B5WLIP9j23Y1uxpDUlVFzgchhMTyFr4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfX0yQr7BdSVuSE
 UrLnVEJ7kgxLMNIriy7hIOWK40q5ZdMoaAZ7gVlZeI6Njek4+JlV50OQRxe4N4dws/n6LiqT2E/
 4z/khqDgZULNMbUQc4QwAkyaDiaWUXv2KZJahg5uR7LRaoLs0VgGy1J6TNeFJxWq6nsRTm52wmD
 mNG+xRbuW32cSnw13MXOMXLmBNSVaz4IhOQTSWiupZL6QFwnvl/0Q1l7J+KxspFyc9lRNzprLfv
 BWL7mS0p+j8hdOXMXvc35JGwCY78lUrxlEfhJRtE185VuB/XXZwT5pR/KQz7Thuq5JJtm2oSH2x
 gNQ6spnGa5WD1YY0APCsGmrCSjIZMWszsAxAGzHBi0Dq1V91sKR0KhQAcX+mGkMoBrsQZ032jmk
 T4x+tGJIEHF9AgFYlM+f+/ne47WMKbIq8MTv7LuZcmOzVW6vRrayVeuuDToXjIJ8HK33G8WI+dO
 Qy94bENsSw07c/gfgDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140068
Subject: [Buildroot] [PATCH 4/4] configs/beagleplay: bump tfa,
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

QnVtcCB0aGUgYmVhZ2xlcGxheSB0byB1c2UgdGhlIGxhdGVzdCBzdGFibGUgdGZhLCB1Ym9vdCBh
bmQgbGludXgga2VybmVsCnJlbGVhc2VzIHRvIHB1bGwgaW4gdGhlIGxhdGVzdCBidWcgZml4ZXMg
YW5kIGZlYXR1cmVzLgoKQmVjYXVzZSBzd2lnIDQuNS4wIHJlbW92ZXMgc3VwcG9ydCBmb3IgUHl0
aG9uIDIgY29tcGF0aWJpbGl0eSB3ZSBuZWVkIHRvCmJhY2twb3J0IGEgcGF0Y2ggZm9yIFUtQm9v
dCB0byByZW1vdmUgdGhlIFB5dGhvbiAyIG1hY3JvcyBpdCB1c2VzIHRvCmdlbmVyYXRlIHRoZSBm
aW5hbCBmaW1yd2FyZSBpbWFnZXMuCgpTaWduZWQtb2ZmLWJ5OiBCcnlhbiBCcmF0dGxvZiA8YmJA
dGkuY29tPgotLS0KIC4uLi9hcm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2Fy
ZS5oYXNoIHwgIDIgKwogLi4uL2JlYWdsZXBsYXkvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoICAg
ICAgICAgICAgfCAgNCArLQogLi4ucGxhY2UtcmVtb3ZlZC1TV0lHLVB5dGhvbi0yLWNvbXBhdGli
aWxpdHkucGF0Y2ggfCA2NSArKysrKysrKysrKysrKysrKysrKysrCiAuLi5wbGFjZS1yZW1vdmVk
LVNXSUctUHl0aG9uLTItY29tcGF0aWJpbGl0eS5wYXRjaCB8IDY1ICsrKysrKysrKysrKysrKysr
KysrKysKIC4uLi9iZWFnbGVwbGF5L3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaCAgICAgICAgICAg
IHwgIDIgKy0KIGNvbmZpZ3MvYmVhZ2xlcGxheV9kZWZjb25maWcgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDkgKy0tCiA2IGZpbGVzIGNoYW5nZWQsIDE0MCBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2JvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXBsYXkvcGF0Y2hl
cy9hcm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNoIGIvYm9hcmQv
YmVhZ2xlYm9hcmQvYmVhZ2xlcGxheS9wYXRjaGVzL2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10
cnVzdGVkLWZpcm13YXJlLmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MDAwLi4yZTI0YmNkMGRlNWIKLS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC9iZWFnbGVib2FyZC9i
ZWFnbGVwbGF5L3BhdGNoZXMvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdh
cmUuaGFzaApAQCAtMCwwICsxLDIgQEAKKyMgTG9jYWxseSBjYWxjdWxhdGVkCitzaGEyNTYgIGI4
MDdkOGJmMTkwYjdjNDZiNDI2MDcyOWI0YmJlMmY3ZGY4M2NkMTA4NmVkY2IxODFkNjY1OTVhZTY1
OThkMjMgIGFybS10cnVzdGVkLWZpcm13YXJlLXYyLjE1LjAtZ2l0NC50YXIuZ3oKZGlmZiAtLWdp
dCBhL2JvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXBsYXkvcGF0Y2hlcy9saW51eC9saW51eC5oYXNo
IGIvYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xlcGxheS9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2gK
aW5kZXggZWI0ZGNlZTk1ODZkLi4yMjliMDliMzU1OGYgMTAwNjQ0Ci0tLSBhL2JvYXJkL2JlYWds
ZWJvYXJkL2JlYWdsZXBsYXkvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCisrKyBiL2JvYXJkL2Jl
YWdsZWJvYXJkL2JlYWdsZXBsYXkvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCkBAIC0xLDIgKzEs
MiBAQAotIyBGcm9tIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL2xpbnV4L2tlcm5lbC92Ni54
L3NoYTI1NnN1bXMuYXNjCi1zaGEyNTYgIDRmMjFjMDFmNGQwNGMxZDFiM2VkNzk0MTUzZjg5MDA4
MDJjOTI0OTdiZTYyMGIwN2M0ODY5NTMwZjJkMjhlZTMgIGxpbnV4LTYuMTguMTYudGFyLnh6Cisj
IExvY2FsbHkgY2FsY3VsYXRlZAorc2hhMjU2ICAyZmVhYTcwNDUzZTkxZjU0MWJlNmE1YzkwNzhk
ODE2OGUwODFhZjQ1YTNkOTcxODA1NDg1MDUzOGNmZjJlYmYzICBsaW51eC03LjIuMTAudGFyLnh6
CmRpZmYgLS1naXQgYS9ib2FyZC9iZWFnbGVib2FyZC9iZWFnbGVwbGF5L3BhdGNoZXMvdGktazMt
cjUtbG9hZGVyLzAwMDEtcHlsaWJmZHQtUmVwbGFjZS1yZW1vdmVkLVNXSUctUHl0aG9uLTItY29t
cGF0aWJpbGl0eS5wYXRjaCBiL2JvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXBsYXkvcGF0Y2hlcy90
aS1rMy1yNS1sb2FkZXIvMDAwMS1weWxpYmZkdC1SZXBsYWNlLXJlbW92ZWQtU1dJRy1QeXRob24t
Mi1jb21wYXRpYmlsaXR5LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAwMC4uZTViMTQ4ZWM1NWE1Ci0tLSAvZGV2L251bGwKKysrIGIvYm9hcmQvYmVhZ2xlYm9hcmQv
YmVhZ2xlcGxheS9wYXRjaGVzL3RpLWszLXI1LWxvYWRlci8wMDAxLXB5bGliZmR0LVJlcGxhY2Ut
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
YjI1NWY4ZmE3MTk5ZQorLS0gCisyLjU1LjAKKwpkaWZmIC0tZ2l0IGEvYm9hcmQvYmVhZ2xlYm9h
cmQvYmVhZ2xlcGxheS9wYXRjaGVzL3Vib290LzAwMDEtcHlsaWJmZHQtUmVwbGFjZS1yZW1vdmVk
LVNXSUctUHl0aG9uLTItY29tcGF0aWJpbGl0eS5wYXRjaCBiL2JvYXJkL2JlYWdsZWJvYXJkL2Jl
YWdsZXBsYXkvcGF0Y2hlcy91Ym9vdC8wMDAxLXB5bGliZmR0LVJlcGxhY2UtcmVtb3ZlZC1TV0lH
LVB5dGhvbi0yLWNvbXBhdGliaWxpdHkucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMDAwLi5lNWIxNDhlYzU1YTUKLS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC9iZWFn
bGVib2FyZC9iZWFnbGVwbGF5L3BhdGNoZXMvdWJvb3QvMDAwMS1weWxpYmZkdC1SZXBsYWNlLXJl
bW92ZWQtU1dJRy1QeXRob24tMi1jb21wYXRpYmlsaXR5LnBhdGNoCkBAIC0wLDAgKzEsNjUgQEAK
K0Zyb20gNTI3MTE1ZWY2NzgzY2VjNDllNTYxMGM1MjNjMTI0YjM5OTAxMTM2MSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb206IEphaXBhdWwgQ2hlZXJuYW0gPGphaXBhdWwuY2hlZXJuYW1A
ZXN0LnRlY2g+CitEYXRlOiBUdWUsIDExIEF1ZyAyMDI2IDE1OjM0OjMzICswMjAwCitTdWJqZWN0
OiBbUEFUQ0hdIHB5bGliZmR0OiBSZXBsYWNlIHJlbW92ZWQgU1dJRyBQeXRob24gMiBjb21wYXRp
YmlsaXR5IG1hY3JvcworTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFp
bjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCitTV0lH
IDQuNS4wIHJlbW92ZWQgUHl0aG9uIDIgY29tcGF0aWJpbGl0eSBtYWNyb3MgKFB5SW50XyosIFB5
U3RyaW5nXyopCitmcm9tIGl0cyBydW50aW1lIGhlYWRlciBweWhlYWQuc3dnIChzZWUgY29tbWl0
IDc5ZjdhMmI3Y2I3ZCkuIFJlcGxhY2UKK3RoZW0gd2l0aCB0aGVpciBQeXRob24gMyBDIEFQSSBl
cXVpdmFsZW50czoKKworLSBQeVN0cmluZ19Gcm9tU3RyaW5nIC0+IFB5VW5pY29kZV9Gcm9tU3Ry
aW5nCistIFB5U3RyaW5nX0FzU3RyaW5nIC0+IFB5Qnl0ZXNfQXNTdHJpbmcKKy0gUHlJbnRfQXNM
b25nIC0+IFB5TG9uZ19Bc0xvbmcKKworVGhlIHJlcGxhY2VtZW50cyBhcmUgc2FmZSBzaW5jZSB0
aGUgbWFjcm9zIHdlcmUgYWxyZWFkeSBhbGlhc2VkIHRvCit0aGVzZSBleGFjdCBmdW5jdGlvbnMg
aW4gU1dJRydzIFB5dGhvbiAzIGNvZGUgcGF0aC4KKworVGhpcyBpcyBhIGJhY2twb3J0IG9mIGR0
YyBjb21taXQgNTAwOGQxZDZhMzU2ICgicHlsaWJmZHQ6IFJlcGxhY2UKK3JlbW92ZWQgU1dJRyBQ
eXRob24gMiBjb21wYXRpYmlsaXR5IG1hY3JvcyIpLgorCitTaWduZWQtb2ZmLWJ5OiBKYWlwYXVs
IENoZWVybmFtIDxqYWlwYXVsLmNoZWVybmFtQGVzdC50ZWNoPgorUmV2aWV3ZWQtYnk6IErDqXLD
qW1pZSBEYXV0aGVyaWJlcyA8amVyZW1pZS5kYXV0aGVyaWJlc0Bib290bGluLmNvbT4KK1Rlc3Rl
ZC1ieTogSsOpcsOpbWllIERhdXRoZXJpYmVzIDxqZXJlbWllLmRhdXRoZXJpYmVzQGJvb3RsaW4u
Y29tPgorU2lnbmVkLW9mZi1ieTogUGV0ZXIgUm9iaW5zb24gPHBicm9iaW5zb25AZ21haWwuY29t
PgorUmV2aWV3ZWQtYnk6IFBldGVyIFJvYmluc29uIDxwYnJvYmluc29uQGdtYWlsLmNvbT4KKy0t
LQorIHNjcmlwdHMvZHRjL3B5bGliZmR0L2xpYmZkdC5pX3NoaXBwZWQgfCA2ICsrKy0tLQorIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1n
aXQgYS9zY3JpcHRzL2R0Yy9weWxpYmZkdC9saWJmZHQuaV9zaGlwcGVkIGIvc2NyaXB0cy9kdGMv
cHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBlZAoraW5kZXggZTQ2NTk0ODlhOTZhYi4uMzI2YTE1Yzc5
NDFlMyAxMDA2NDQKKy0tLSBhL3NjcmlwdHMvZHRjL3B5bGliZmR0L2xpYmZkdC5pX3NoaXBwZWQK
KysrKyBiL3NjcmlwdHMvZHRjL3B5bGliZmR0L2xpYmZkdC5pX3NoaXBwZWQKK0BAIC0xMDMzLDcg
KzEwMzMsNyBAQCB0eXBlZGVmIHVpbnQzMl90IGZkdDMyX3Q7CisgCVB5T2JqZWN0ICpidWZmOwor
IAorIAlpZiAoJDEpIHsKKy0JCXJlc3VsdG9iaiA9IFB5U3RyaW5nX0Zyb21TdHJpbmcoCisrCQly
ZXN1bHRvYmogPSBQeVVuaWNvZGVfRnJvbVN0cmluZygKKyAJCQlmZHRfc3RyaW5nKGZkdDEsIGZk
dDMyX3RvX2NwdSgkMS0+bmFtZW9mZikpKTsKKyAJCWJ1ZmYgPSBQeUJ5dGVBcnJheV9Gcm9tU3Ry
aW5nQW5kU2l6ZSgKKyAJCQkoY29uc3QgY2hhciAqKSgkMSArIDEpLCBmZHQzMl90b19jcHUoJDEt
PmxlbikpOworQEAgLTEwNjQsMTMgKzEwNjQsMTMgQEAgdHlwZWRlZiB1aW50MzJfdCBmZHQzMl90
OworICAgICAgICAgfQorICAgICAgICAgJDEgPSBQeUJ5dGVzX0FzU3RyaW5nKCRpbnB1dCk7Cisg
ICAgICUjZWxzZQorLSAgICAgICAgJDEgPSBQeVN0cmluZ19Bc1N0cmluZygkaW5wdXQpOyAgIC8q
IGNoYXIgKnN0ciAqLworKyAgICAgICAgJDEgPSBQeUJ5dGVzX0FzU3RyaW5nKCRpbnB1dCk7ICAg
LyogY2hhciAqc3RyICovCisgICAgICUjZW5kaWYKKyB9CisgCisgLyogdHlwZW1hcHMgdXNlZCBm
b3IgZmR0X25leHRfbm9kZSgpICovCisgJXR5cGVtYXAoaW4sIG51bWlucHV0cz0xKSBpbnQgKmRl
cHRoIChpbnQgZGVwdGgpIHsKKy0gICBkZXB0aCA9IChpbnQpIFB5SW50X0FzTG9uZygkaW5wdXQp
OworKyAgIGRlcHRoID0gKGludCkgUHlMb25nX0FzTG9uZygkaW5wdXQpOworICAgICQxID0gJmRl
cHRoOworIH0KKyAKKworYmFzZS1jb21taXQ6IDEyNjJlNTBhMzRhMGUwMWY5NzRlOGQ5MDljNWIy
NTVmOGZhNzE5OWUKKy0tIAorMi41NS4wCisKZGlmZiAtLWdpdCBhL2JvYXJkL2JlYWdsZWJvYXJk
L2JlYWdsZXBsYXkvcGF0Y2hlcy91Ym9vdC91Ym9vdC5oYXNoIGIvYm9hcmQvYmVhZ2xlYm9hcmQv
YmVhZ2xlcGxheS9wYXRjaGVzL3Vib290L3Vib290Lmhhc2gKaW5kZXggYjZhOTI1ZWE0ZTg5Li5m
ZjZlNGVkMmUyZjYgMTAwNjQ0Ci0tLSBhL2JvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXBsYXkvcGF0
Y2hlcy91Ym9vdC91Ym9vdC5oYXNoCisrKyBiL2JvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXBsYXkv
cGF0Y2hlcy91Ym9vdC91Ym9vdC5oYXNoCkBAIC0xLDIgKzEsMiBAQAogIyBMb2NhbGx5IGNhbGN1
bGF0ZWQKLXNoYTI1NiAgYjYwZDU4NjVjZWZkYmM3NWRhOGRhNDE1NmM1NmM0NThlMDBkZTc1YTQ5
YjgwYzFhMmU1OGE5NmUzMGFkMGQ1NCAgdS1ib290LTIwMjYuMDEudGFyLmJ6Mgorc2hhMjU2ICA3
OGU4YmZjMzgyZmUzODhmOWI1NWFhMWRhZjhjNTYzNTIyYTAzNzc3OWI1ZDRjMzQ5ZDE0MTVlMzgx
ZjEyNDNlICB1LWJvb3QtMjAyNi4wNy50YXIuYnoyCmRpZmYgLS1naXQgYS9jb25maWdzL2JlYWds
ZXBsYXlfZGVmY29uZmlnIGIvY29uZmlncy9iZWFnbGVwbGF5X2RlZmNvbmZpZwppbmRleCA5MDIx
MmJkYTQ0N2UuLjllNDU2ODBjMzFjZSAxMDA2NDQKLS0tIGEvY29uZmlncy9iZWFnbGVwbGF5X2Rl
ZmNvbmZpZworKysgYi9jb25maWdzL2JlYWdsZXBsYXlfZGVmY29uZmlnCkBAIC05LDcgKzksNyBA
QCBCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJzdXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uu
c2giCiBCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUX0FSR1M9Ii1jIGJvYXJkL2JlYWdsZWJv
YXJkL2JlYWdsZXBsYXkvZ2VuaW1hZ2UuY2ZnIgogQlIyX0xJTlVYX0tFUk5FTD15CiBCUjJfTElO
VVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKLUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJ
T05fVkFMVUU9IjYuMTguMTYiCitCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVF
PSI3LjIuMTAiCiBCUjJfTElOVVhfS0VSTkVMX1VTRV9BUkNIX0RFRkFVTFRfQ09ORklHPXkKIEJS
Ml9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQogQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRT
X05BTUU9InRpL2szLWFtNjI1LWJlYWdsZXBsYXkiCkBAIC0yNCw3ICsyNCw4IEBAIEJSMl9UQVJH
RVRfUk9PVEZTX0VYVDJfND15CiBCUjJfVEFSR0VUX1JPT1RGU19FWFQyX1NJWkU9IjI1Nk0iCiAj
IEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0CiBCUjJfVEFSR0VUX0FSTV9UUlVTVEVE
X0ZJUk1XQVJFPXkKLUJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfTEFURVNUX0xUU18y
XzEyX1ZFUlNJT049eQorQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVkVS
U0lPTj15CitCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OX1ZB
TFVFPSJ2Mi4xNS4wIgogQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9QTEFURk9STT0i
azMiCiBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX1RBUkdFVF9CT0FSRD0ibGl0ZSIK
IEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQkwzMl9PUFRFRT15CkBAIC0zMiwxMyAr
MzMsMTMgQEAgQlIyX1RBUkdFVF9PUFRFRV9PUz15CiBCUjJfVEFSR0VUX09QVEVFX09TX1BMQVRG
T1JNPSJrMy1hbTYyeCIKIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSPXkKIEJSMl9UQVJHRVRf
VElfSzNfUjVfTE9BREVSX0NVU1RPTV9WRVJTSU9OPXkKLUJSMl9UQVJHRVRfVElfSzNfUjVfTE9B
REVSX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDI2LjAxIgorQlIyX1RBUkdFVF9USV9LM19SNV9M
T0FERVJfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjYuMDciCiBCUjJfVEFSR0VUX1RJX0szX1I1
X0xPQURFUl9CT0FSRF9ERUZDT05GSUc9ImFtNjJ4X2JlYWdsZXBsYXlfcjUiCiBCUjJfVEFSR0VU
X1RJX0szX1I1X0xPQURFUl9USUJPT1QzX0JJTj0idGlib290My1hbTYyeC1ncC1ldm0uYmluIgog
QlIyX1RBUkdFVF9VQk9PVD15CiBCUjJfVEFSR0VUX1VCT09UX0JVSUxEX1NZU1RFTV9LQ09ORklH
PXkKIEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT049eQotQlIyX1RBUkdFVF9VQk9PVF9D
VVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyNi4wMSIKK0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZF
UlNJT05fVkFMVUU9IjIwMjYuMDciCiBCUjJfVEFSR0VUX1VCT09UX0JPQVJEX0RFRkNPTkZJRz0i
YW02MnhfYmVhZ2xlcGxheV9hNTMiCiBCUjJfVEFSR0VUX1VCT09UX05FRURTX0RUQz15CiBCUjJf
VEFSR0VUX1VCT09UX05FRURTX09QRU5TU0w9eQoKLS0gCjIuNTUuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
