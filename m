Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719BBCA5FD4
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 12:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C2F240D82;
	Thu,  1 Oct 2026 12:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OjqX5x26JjV1; Thu,  1 Oct 2026 12:41:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3F59A40D8D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790858485;
	b=GNoltgcGz2FwFjAjboUAk8aW76VT2V/sJPSY9N30f2SgPy12qPgomXj6rF4CJBDNgALL
	 pqQaLuzh2bxjA9GbidmDM2+ApxSA/5qy27ZbVfPkYKzziG03n3TJeLlc7jBRgxz+X9I47
	 IaPGBguBZtOxj3Y6zuPGK9yLg2GbPA1m0CmLsafMOlt2Abx0hmUhUrnPLjEg68t/bDwAR
	 dsT8by2NSrGStyCNVrAs380BbKPTPOr6uiJHlQwQnVZsKwjZQHcPPhLwXWUEsc67cIOxL
	 PVR9HocqnCSlLR8pyhWytK88kgsZFnMrK8BckiJoiV2SLQHBpfrrsWx60zhjcvaFyGQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790858485;
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
	bh=fg18AqW4LsLN+SlxZEjB3YA5gpDIkrXijGY+2+YmZxg=;
	b=VK90PF4MrBkE/huhqdePon/jahAOFQ4AxTU5VhVsdvxWla8Skvri2g+G7i2tbO+3PcIy
	 ZWkwsgwZxBkkHuBkS9KqkME1RqjuPCjsh+t3zYTjAf79pYM2Fc19WNJlm/B6XVUpOH9KG
	 k1+JmyxYYVJWKy0OrxxMYdw0T/bGb5hwf6uFH+3VD+Yj+0dR0c9u3Hk44bpKS8U4VWvsq
	 3fz+Zau1nWeImVIkoft/nvCgffy+18riHos4GxyGC3sKRs0ZQhQxXY1kLZuNOTsze2p8u
	 sWKC+yuVZfNVE7vxlUrwcoOaXly0HjnfslCxPSD2VnSS+5Tx5MqO0SBEVJsZU5Ldzdw==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790858485;
	bh=fg18AqW4LsLN+SlxZEjB3YA5gpDIkrXijGY+2+YmZxg=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=nR90qfFgmc4mPuYJRlNg/IhD2zxLA6kirYGvSyoymWpMujmr6dhSmXf1VJ1LwEVEo
	 jY+nXB7OhAnsQIRk9ZEIa7kRs5gQdSUQs3YVaALzRy5i7OnTywtvggljUIX5C/bREQ
	 A9alz5ojRnC5NFPteJNTrsnkUfc38Nhfc77BGp+YkOqQconSHtrqPlCzvSj09zzvZ6
	 JFeFu5QGqnp4gbnF1XwY9Q48jGeCmJvKGQYM0YnHW5afQA1Xkm3M7UDY5eqUqY67wW
	 GXnWFEVMMvFBkL7kEQwR73YxLFpQfkKPCTVBvy1Oq4YGFjQgWSWD/WKWPPlgOnXPTm
	 51bBzDkIl4GRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F59A40D8D;
	Thu,  1 Oct 2026 12:41:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 49CFD32F
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 12:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B92860C29
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 12:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gjs_5EtD8CmZ for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 12:41:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0C5A260C1C
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790858482;
 b=LZAQzQKmfCslmzfpLKmhwbKfILqGUiIBFEWgaltaH1VJs8DmogFIxwOVz8e8gC3nTC8o
 EstykJMAWKULGqq88AHg/nxb4WM4Ao3EBI8/HnhGh0cfTZ40oBndMTe8zDhspUTJgWWV6
 7PsQ+eUFh0YubiGpK/Gm/sAcFUMXp1p8YtOopUOCpa0oOy63yRMqL61Xd9/M/PjNL405J
 Vn0aOedtz2eRw10JmuJgpb2hEia+5sdNbK7VQh6/TbtAyf10R9+Fe3KE276B5XSBQLK1b
 n87KeyZskyJ0qUHOBQb09B10wJ7HVDt7bCZyu2cvhWbarhkiiw0exFpjd6fooRKqd/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790858482;
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
 bh=mmAPLrLdItuA1mcC2+7/qNdt1h6fiae4Nn+TmKUYa+w=;
 b=V42BlczaA5ZknqLjreJWwy+Kt/8kp4XLpyme9OmDDOZ7rF24DkHTDQIpTkLIoJylzo5L
 er1E7El00PgaIZiG2JducwDpqey6Tdba82fHmczZewDa/QNFwNPJJe8jqgrocUTP1ZIiv
 wA6Ci8U/iaXV8c850oDO4bNGGcJw6F8v06c1QLq06cEMT3FwVU8Txuc/vjwz+98xoynUt
 6d7pPZhY8UUGl9bb54Q9SSiE3BmOTK1W25v3vkbrbPYJAild4s53fbR1jqc5MmiyttMA7
 dPx/cjkUy2YLlReXB8b0A21TBhw6lcwShdD2jFN0csIPCVj/gOcwPLwdkbQh/ZJtzvg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org;
 dmarc=pass header.from=amd.com; 
 dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3XoV5EGL; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:c10d::3"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::3;
 helo=sn4pr0501cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C5A260C1C
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 12:41:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zP25Y71FFWfu9xqVvSkey2q6bMrrSFrPBXszLBTp1R9av7QgT/2KxcQRoNmREL0vMUcuIMCNR46imkIvl7c90U7kS1UYVI88yY91VCN/NzLdjaYKACoO0IJUEZ8oNtNWOJUf4LMW84a8rYSoFNE1c2msmFAUObhnZ0k8ZR8Ifm1NZ4Cx8SknE2n1OH6apyJflKaAQSQcirgH1x6tdZ+4j0lA515jd9LZVekXI3PMah/G+twbPO4Z6uzFhfhRm/bEaFdOY2YWCxJD/YVbZu00W/LzexHeg+3wtEy2iWa5vDvYl65hg5nfNC2npV3sQ5p8M90M0w4Ss5eRMb7BbCvT0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmAPLrLdItuA1mcC2+7/qNdt1h6fiae4Nn+TmKUYa+w=;
 b=mla3cT6HI6J3Mqx2kDbMSAPKOcx/9RcDUFQGT64CcR7VYqm+7Xmk7t4h2eGEj6GDsXSYyI2e4BIU1I25LOK0R7CGrMwK0CRRx4eyo23uHn5nVzYNqfmTNH+8pT4QYR11l94a0RxP+mR90UdRgtXEZMFKiU5JAmG6Yppqq33XUaPH121A/lO8prJuKRkcaNbrQdgLJFJ3yvtvL60OBDdHJKOBJjYFX/LcKAToFQEsz0PB2LZ49xwQdQ02Nde6QvqECqVghgUE8J66NJ2TgkLfQ++Qp8G+FxlOzgcSIU499uKi0x8DcfJwhlfkhhdufBeLLODU7FOlib0aAwnA6TpICw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN2PR11CA0020.namprd11.prod.outlook.com (2603:10b6:208:23b::25)
 by CH3PR12MB7666.namprd12.prod.outlook.com (2603:10b6:610:152::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Thu, 1 Oct
 2026 12:41:14 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:208:23b:cafe::67) by MN2PR11CA0020.outlook.office365.com
 (2603:10b6:208:23b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 12:41:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 12:41:14 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 07:41:11 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 07:41:11 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 1 Oct 2026 07:41:09 -0500
To: <buildroot@buildroot.org>
Date: Thu, 1 Oct 2026 13:40:57 +0100
Message-ID: <20261001124057.1941988-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261001124057.1941988-1-neal.frager@amd.com>
References: <20261001124057.1941988-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|CH3PR12MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: 30b19499-c248-44f6-2f9a-08df1fb947b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|7416014|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: 6d65XdWy5PhEnToF9rYXI5t29/gxkvCpTigwVCK1TaVs5c+Ls1H8O/9cy3MMUFGwy9kRHyM5FnO+QbvdklnzL3dunnuRp1ZPVeBwO3ksv7yFBjrYZlzrLYoQgReELIdcrYPArr3SZRs7acb41LgwmJZ0CAmPjQFz0Rkl03B7O5LvGqgxnrfAJDNUE/wlmo6LNe4XndymgzvlLo/sW+k4PgGfKRYz9GmS/9+SVFilJQZdkSaAmZDC8AlsZbwnpBf+rMhn7sC+AZbqbQuScfJ1IYpNa/cxCb8hKclKbxiPXlJVnW/9TnxJSMsGJfOwY/vOcxYKljtGo3PI+Fb5wxSZnbujJfuXkEhntWzPD2PcfTSwbfyabAuFyQ3EcNJYYk1A7PQg0x2f8jCdTRX3bm7SaMIH+vu9Tz563Dr4IAhW/UjJoT+jJVmZMMWQo5rQTvJBOHeH+oJRTJcMfPDe+Cu8Vl5k+mXTg/2lfmS77rimbxNFN2CY3GQea/DxcPrEusZMgAc9kH8m5iK5OStpG4ohuiTQIo8wVEyeiozTn4FXI0WBuE39C1dg1PFvFufnkbY2L5Rvu9tT0Gjw2CmloH2uQVPXnYqhQNc7yOKGYHichXPbbkIhmEDigSGpAroXp/wkA9a35jnhs1XLdl+B7FOt5Sk+6Z0drpS/vyTNeJHHU2bkiiSaDl89tUbQsSsRkdS2iB3OTKimuBxe09ofHmHemQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(7416014)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7ouiohB6rwA2JiEwqUc6q2nbBtik/CBUQA8aTM7lahoZvyztox4GLyQ8gr2pV0wHjGMAJgBI5qLJJvlcMV3WZGoAcW8KsBRkXeNcoIr8mJ4GW7mz/A+YymawrbxmkBwPiMY5GbAN+RwXZYrl0tkp42BYAFpCg2FelT+HnhZr7rZkQMBw5gPvWtaXRIgxp5FNWo52xQmSPd95ozXlwC68V1vlvz9Ey8jjRQPMbdBksTNug46yPphc6b4XL/w5zGJohdIWcbruU4EVQg4j8raS+BpVRoEupf757u0/09APs56RHX/X2c79vB75mVcomy/GL7R4kgaJhnbrX4ppSMr/qQJyMsdOsK3xQZu5cKIEyYB8EGJEfIBVNDm+6y/h8Xh3pTShKyrDe33m4HWW9i9sxn+bbBr8RHZZ30l4rm8XvkrtVzSZ1oO790xpD8Ajwsi4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:41:14.2079 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b19499-c248-44f6-2f9a-08df1fb947b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7666
Subject: [Buildroot] [PATCH v6 3/3] package/xen: add custom git support
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

For completeness, add custom git support to match the capabilities of other
packages such as Linux, uboot or ATF.

To test this feature, use the following configs to test latest release of the
Xilinx Xen vendor tree.

To test:
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_XEN=y
BR2_PACKAGE_XEN_CUSTOM_GIT=y
BR2_PACKAGE_XEN_CUSTOM_REPO_URL="https://github.com/Xilinx/xen.git"
BR2_PACKAGE_XEN_CUSTOM_REPO_VERSION="xlnx-rebase-v4.21_2026.1"

Add to package/xen/xen.hash:
sha256  e8016e81627fe3b4fca5463723428606cd3750c7fd76a3cfaa0b0d0e7cd9b32b  xen-xlnx-rebase-v4.21_2026.1-git4.tar.gz

Signed-off-by: Neal Frager <neal.frager@amd.com>
Tested-by: Matthew Weber <mathew.l.weber3@boeing.com>
Prior test details: https://gist.github.com/matthew-l-weber/c17f14a3793ccee440a383e4177ff3db
Reviewed-by: John Ernberg <john.ernberg@actia.se>
Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Tested-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Tested on VEK385 Evaluation Board
---
V1->V2:
- rebased to updated master branch
V2->V4:
- merged into new patch series as the fourth patch
V4->V5:
- updated commit message to use release tag name for test
- added error message in case no version specified
V5->V6:
- rebased to master
---
 package/xen/Config.in | 18 ++++++++++++++++++
 package/xen/xen.mk    | 12 ++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/package/xen/Config.in b/package/xen/Config.in
index 203fc60833..64c76cbc15 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -26,6 +26,9 @@ config BR2_PACKAGE_XEN_CUSTOM_VERSION
 config BR2_PACKAGE_XEN_CUSTOM_TARBALL
 	bool "Custom tarball"
 
+config BR2_PACKAGE_XEN_CUSTOM_GIT
+	bool "Custom Git repository"
+
 endchoice
 
 if BR2_PACKAGE_XEN_CUSTOM_TARBALL
@@ -45,6 +48,21 @@ config BR2_PACKAGE_XEN_VERSION
 	default BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_XEN_CUSTOM_VERSION
 	default "custom"	if BR2_PACKAGE_XEN_CUSTOM_TARBALL
+	default BR2_PACKAGE_XEN_CUSTOM_REPO_VERSION \
+				if BR2_PACKAGE_XEN_CUSTOM_GIT
+
+if BR2_PACKAGE_XEN_CUSTOM_GIT
+
+config BR2_PACKAGE_XEN_CUSTOM_REPO_URL
+	string "URL of custom repository"
+
+config BR2_PACKAGE_XEN_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	help
+	  Revision to use in the typical format used by Git
+	  E.G. a sha id, a tag, ..
+
+endif
 
 config BR2_PACKAGE_XEN_HYPERVISOR
 	bool "Xen hypervisor"
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 5fc6968d70..9f80e63dcc 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -23,6 +23,9 @@ ifeq ($(BR2_PACKAGE_XEN_CUSTOM_TARBALL),y)
 XEN_TARBALL = $(call qstrip,$(BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION))
 XEN_SITE = $(patsubst %/,%,$(dir $(XEN_TARBALL)))
 XEN_SOURCE = $(notdir $(XEN_TARBALL))
+else ifeq ($(BR2_PACKAGE_XEN_CUSTOM_GIT),y)
+XEN_SITE = $(call qstrip,$(BR2_PACKAGE_XEN_CUSTOM_REPO_URL))
+XEN_SITE_METHOD = git
 else
 # Handle stable official Xen versions
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
@@ -123,4 +126,13 @@ $(error No tarball location specified. Please check BR2_PACKAGE_XEN_CUSTOM_TARBA
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_XEN_CUSTOM_GIT),y)
+ifeq ($(call qstrip,$(BR2_PACKAGE_XEN_CUSTOM_REPO_URL)),)
+$(error No repository specified. Please check BR2_PACKAGE_XEN_CUSTOM_REPO_URL)
+endif
+ifeq ($(call qstrip,$(BR2_PACKAGE_XEN_CUSTOM_REPO_VERSION)),)
+$(error No version specified. Please check BR2_PACKAGE_XEN_CUSTOM_REPO_VERSION)
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
