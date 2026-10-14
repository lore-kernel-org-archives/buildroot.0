Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA6CCC6B1A
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 17:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEFFE80A76;
	Wed, 14 Oct 2026 17:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBRie0vr0f_V; Wed, 14 Oct 2026 17:11:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A5B6780CC2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791997880;
	b=VWRml6eSn7HIs6WOZYCoDQbqoDxMmSDfQ8xz6wEYabkMZu+MrnfvruC+aVUEks6pvFYh
	 U6xCXlN4sVl6mOqZfT9xeorNrAL+tR5vDnPlN98kdH6nIa1V8bSQbepqSg8c3jHaVizcj
	 Yjbyk3DwMXjxG3eHsXjGLpnN+p8A7lCcaf5Tfvin/hH1WokynwGqAQyiSMW/yvwI19jjN
	 nQ83XjI0EjbKaNgIPsYLcXAE5sWsTGZbEyuq0UpyJNWj1+YSchU5YtERSxf3wdHAso33+
	 ryOzdhruq7CelSkdH6LjheDq/mcPjpWKukQDjNiVqxCXmPbnijNfFVpf040FkpVIJZQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791997880;
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
	bh=jt1A/sEqK5ej7G2JpHDjfByNlfkMRPk7kD6PKdjf8rs=;
	b=S8lBgKOMavXDcOZzR0tmqCcR6E8Jd/Tt8+ELDSGnLwoOXyPUgo74llnZAH6BfNBUwl0D
	 jNcALuqc17ewQLLgZLWCalO0IUftHNuiadlrrSdFJYbAvcvhYG7rQbApDy+Sg+G2MtqwU
	 Tb4laQCNzQF3UL8BH+A0NLH4nQWwSyGWDyb61Mvg9eiMiiboqcYzcILop6m5XfM53QDbX
	 4jqS8b7Y60CDl5JvVFRXX0IBUS+pIrhiddtHEO27REwM2l7vywAZYm1f+eW0/lvLiGwu0
	 8l9Vp5dh0RbFBouU0Kles0Vp3ggAaTNZpQX3fyrYkF9TbEqu/FRO3UrwZ7h2QprbUSQ==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791997880;
	bh=jt1A/sEqK5ej7G2JpHDjfByNlfkMRPk7kD6PKdjf8rs=;
	h=Date:References:In-Reply-To:To:CC:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nou6f41HExqPzJoxXQkiEFW0bGD1QEUcOyNfdDpYDVZgrOsFzkXBhLtelvGRUNsiS
	 0Cw2AOB+u8hBLUbJjNXGJTW3qC5Mn3NzDTqKEGCdmK4MDhmDHnLLskZtqMKLui3hEn
	 sTTVmwjN8Zavj92IvxFk2Tq7h4aGMW+2EP9D0K17A+OlnvXgYC/znpdRZWf4qCrKHB
	 EvHkTaajC2MSXBLlml/fJZGnQFdFm6L4gmeP6eHte8Hg0V1uPmRd8HM+AFR/fITvuz
	 Kofq/1uWe8xoufX02lccSVX0QQxwgBfbanatuxEa6e8NToT3Jfs1mwnA6duzZYWjzd
	 uP2CxZITy0bpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5B6780CC2;
	Wed, 14 Oct 2026 17:11:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D727AA58
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 17:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8EBE4040F
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 17:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yaeaoEseqrdg for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 17:11:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A24AE403B4
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791997876;
 b=M1qKpN2qGaLcnLuGiJTVFwUoiyY1GaRswsAEPP1OWfYq+w91mSGpagUM/cfGRTFkfj3W
 njGCfXCmbMBqEFveGpSdOGHwwzYKnRB1yylMlgEsaDxkGVZZzwN0S2yPkvk6F8p8ykOk/
 GXt5b5Mf0jzhUkPSIsN7P4aBZ4GECdUGofBnckRQwY4x1nd+1jfxwI+w85h39tQFgfi3m
 PBriiXAgZ7QMtYjBY7sf9mKKkr9whADrwauFnPbpj6QM7msX9OXaR6f5suyDmiXsgXM1M
 RpMiV9YoKtxnwOaXCVeIcmJ+BxIkA0dslslsqugLc0+y+gA6jNBeb2xGgXNmjusMGRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791997876;
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
 bh=g21qVXEPRSPi0LEuXnCXb8HWj4WOj8/GXlum9BZI7Ec=;
 b=UfFdbjs8Mm0yLDFHoGj9S9MZb89uYJmqSa2KU0fXoeh2GAYbWTuuF7gLYRZBcO2OnxUP
 fSHXamSvDasFv60rMy6F3cT2pTcMOTI0I6frYQ9gOtKw8dKAvV/2sR5vz081qWcyqVK8s
 ik7A+GPSDo6WFTf5sxpsXek9xuS95d6QNKhqKUz3Hb+74+SAcoZ946blSMGs7qMLx5crt
 0Z485WNl9LfrTYCMW2HM/hFF/BeMGeRv7acMPPyQhhsRjpb1xo8e4E6CvujeD+ml/gWRp
 lbmW2ZMUDBC7RZ56Hfp2AvMUUubLJGdnQOiUajyHYyePRec9vas9bzjX4HJMDLlBGhw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
 dmarc=pass header.from=ti.com;
 dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=proofpoint-05-2026 header.b=GRwINg5i; 
 dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com
 header.b=qEaXJBEF; 
 arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.150.75;
 helo=mx0a-0002e601.pphosted.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com
 [148.163.150.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A24AE403B4
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 17:11:15 +0000 (UTC)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
 by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69EEapXH3013058;
 Wed, 14 Oct 2026 12:11:15 -0500
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11010045.outbound.protection.outlook.com [52.101.56.45])
 by m0384305.ppops.net (PPS) with ESMTPS id 4ha6ujaqfk-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2026 12:11:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bl54WZFJVwMcGr91RQdcRy4Wo0ccso1NQx4LK7R0P7o/1BaYQjZxHH34KemhtqM+ecVEqbvQfibE2AJeESH64xDZKza5qVhodWDdpOq6R/mPIBb4tz0Zbi8fnkprhxVUvRUdz0IUyTTRky4s4jQlGIbrmk0Q8tf0jd8Cs3wBrGEvpjXiosmhebktHpSjIeui0bMhpPELHtKae2hpBmyfL8GuBU7GJEB/YqXWADU/cpAUItS2WNyt1zfGTbcuZ2xyi+mwE1sIZZ1OGEd0cx02Vt89ZHB/qKFxm1Dx8YfNSM41ZKZzSz2VLXH1NbTCW/S0vy96kv7VzHJYkbOhwEymYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g21qVXEPRSPi0LEuXnCXb8HWj4WOj8/GXlum9BZI7Ec=;
 b=Grt29NZmlONs0MFsBwsiHhp2o/PaDAIZd4SMd2dGgPvTKzYP0xqQZs57T33Kg6Y1D8IstJLn/cPFnO/k+3r8bg6wpZuKi9xaQSog4sqiW1Rs55AIgE6yn5SnfPB2bzKufaVR7GwleLPGQu2cdVmEYQnChWA1mPdj1Lo+cn1RoTj58cTcuWC+UDmBctgLjGxFDfVKUTumV7AfsDTmfwJ+22qP4y5DUpKp5u8p9qRTTqoIBBp+ia7SHTKAN4tyDbd8bXQek7hMhxeS0l6Zfu1pKxlDbwAQuium70aRLARdRYeILxAu6KIzQmJZUVo5ytejo6gQCesSaBUf2rWYYc/PEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
Received: from PH7PR02CA0027.namprd02.prod.outlook.com (2603:10b6:510:33d::16)
 by CH3PR10MB6689.namprd10.prod.outlook.com (2603:10b6:610:153::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.7; Wed, 14 Oct
 2026 17:11:07 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::a8) by PH7PR02CA0027.outlook.office365.com
 (2603:10b6:510:33d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 17:11:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 17:11:06 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 12:10:15 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 12:10:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 14 Oct 2026 12:10:15 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.75.137])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69EHAFbK2717091;
 Wed, 14 Oct 2026 12:10:15 -0500
Date: Wed, 14 Oct 2026 12:10:12 -0500
MIME-Version: 1.0
Message-ID: <20261014-uboot-fixes-v1-2-2676fd37a97a@ti.com>
References: <20261014-uboot-fixes-v1-0-2676fd37a97a@ti.com>
In-Reply-To: <20261014-uboot-fixes-v1-0-2676fd37a97a@ti.com>
To: <buildroot@buildroot.org>
CC: Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>, "Bryan
 Brattlof" <bb@ti.com>
X-Mailer: b4 0.15.2
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|CH3PR10MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: 61cede10-847a-42d2-fed3-08df2a162236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|56012099006|261009221227099003|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: juKW2tqYW+xVAQXvKJubNVVQU0FkBQt3Uxb7Be60TbuygPC/e77sMS1jHVs5uPAsyd6aCdXbuY/j2xwho4+oQFPfQ2m+ZPQe9K7WNz+KJX9jJN1j7t1C37qQJiQ4K6gBy+Lch74kATxpUOdrBBidzCe5jsgff/1p8BARuLcC9e/rgJ4kczi0OL8I+xJNjxnT3qg+p9XLF/qt52HnKdsqPbDNt0L9x0iFNxW3iJbjZ8tGV9gnyXJz4HYMb8sWFO6kXF9S2qDLxiDx/pwPaj0LjcH+NApDf3MTEsqbEKBGorGLF3GThsOUd1CMdvs9Az7dOASUMJMwmRutnn/xfiT5z/mEDduVbAIoixPOGm/LP0V/Kn7pKrF9rVp6naM/imPs3nP9Yog1LkDzcOTXLhpns4iTFjL3XdS8L/yxPMghpkJwYM5HAdS6yOGRQ8JUrPLAfaEh8ELzSEDeqNty6yRoB3JUVlX9PVOnPP/ByFFurGKnyXMJsiLg/Sl2CgxtZuvNrxgbaUjIsdjsbpg9go0yvsAcY8zaBp45fxbTseWI5+WOSxfc/TS7+7rreSsWaCnFQ7X3XlgsRMymAmLlHQ+maTGoZ+/x1XLS7RRsdgwF786frp4SSk5LE258tbZUHbg4wlVRnQFoe18/lLU1YwMHNxoP3oTmiY+rzCfqxek/C6gMZc4o16NvszlNslZu6I+ZpdmleYluWGmAUjfu8N6PVQ==
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(56012099006)(261009221227099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FYwRYoq+LibOII/qA1Fqe58RFaOH6BbSrq6Vi5aIyNsah1LlsofBlbCRoYBi/kNAimQrb860PssaUzULd7ioINb1X2aPZ8XIpRKk8aAwL0aBivLJzuwqg3KbWpH0HRVvQOHYS3SsHpfyZ06VhhkG6Y3b1zhpBQyg3NgS1zPV7tXqdFRZHWoIvCfgzowj1lz2HEnMdYs8S1D631yI7dMZqZ+IG2vHDeax3+mUnpvJVhwAOGLaLV5HtMdx5AZ8vwUvu70EVImczra7bf0NDvnmgc2ci6tPW+h9IRRFrI4nv9OaOVeGDc18U3Oojd0qwKLUg3KTn5obALy2eDgaFrwwaxv2CK+KTrFbDMF3/S2uoah1YHl8fl7zu2pW+3sowxxLHGm2KSiZx7tNU0aCtBGV592VWTb88qW7ZW0mO10jr5zeKbI/8DtuDsBd+oIAuegQ
X-Exchange-RoutingPolicyChecked: JkHE1Zj3HYfIf+UQVkRzzjERjGxbdzfjqjNdFbcNoKQb04RcXOIXh1UYKvLSQO/znLcZcWgA7OZJcwnzJr8NnTtGIPOOUxv8jPeL4/H3B5YYVC4HqLYXmX4ZLtfB5HUSnMXgfI0VOgkcg5mewRPnM1lw/za/9leftPgjP2bjxvdirrDVo8S5ZKECpQHeb+W4l9OKNmXIYZesq9RtjyfvRL9/wvbT+aWZrYzNm1Bz8hV7+vEa+3KG/4IABmMuno0aW9O5DroWJEWaxA6W652sIXlHSFmVPCtaNvSfXW28+dyJ5e7PeFqfM6XDeU4KfFLEdM2yqH4HDjSLnKOki1bVdA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 17:11:06.0331 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61cede10-847a-42d2-fed3-08df2a162236
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6689
X-Proofpoint-ORIG-GUID: 1DE2EJebe_sfPJ6KgO3TcnA8fpoMU7fp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfX6lq9vnb004WB
 4AmkUrkZwbPpcoZrBWMic2alUTQs2kpDNLBotWM8Dyr7JNxcisuQgKhHCYrUN2WhX/3RsSVeca+
 uAiMpG9rMH6mw+3Bn2HjigPK0hmGsog=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfXzNjL++9fF+SR
 bUCm86ctflHGJwLlByaZBhF1ebsHYPdKatWD24TVqxwEzVuqyKbvLUvBn8GvZtYI+W8Lb7OgOv1
 ZQ6zetm0tNyZA2Y+fTvpQL0pLesoTE/B1vK/O55UQlFsfn7l3PQaiB15YzAmINg5+96/tRUQ8hv
 odVrd9pmHLQVN7zIVgbLraCIDI0W80OnpGpKl4g8aySG0hsQaSvv2+RfkNzwtaweFPZyGRemzyr
 dHjHyO5vGBccX8prZOqH/+xuLefbbQzhPHW0+y9cVSurpFyEUZ9mgHEZEASa3CeE9iK4eng2Czv
 0f5ZLIkGY4/GmGxYoY6t9icmYQN+NYw0cHuHNYgkW40cqXa42oDnhyr5jsoeEGMzRmyR6xOZl7V
 7fUinNc5YzYiCbrOQxcc8/6oqHdS4EA+tAu8a4y5fwFkwSHswOGOOlK0pyXaJm/+LAQOc8EcN4C
 lyj4Y/nKdjbkIO7lcJg==
X-Authority-Analysis: v=2.4 cv=U/cHnuru c=1 sm=1 tr=0 ts=6acfb7b2 cx=c_pps
 a=jCeAeT6ZWnoYcCLLvvbvuw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=P-IC7800AAAA:8 a=pGLkceISAAAA:8
 a=-gtsS_FzhULYpJHwdC4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 1DE2EJebe_sfPJ6KgO3TcnA8fpoMU7fp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140068
Subject: [Buildroot] [PATCH 2/4] configs/ti_am62px_sk: bump tfa,
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

QnVtcCB0aGUgYW02MnB4LXNrIHJlZmVyZW5jZSBib2FyZCB0byB1c2UgdGhlIGxhdGVzdCBzdGFi
bGUgdGZhLCB1Ym9vdAphbmQgbGludXgga2VybmVsIHJlbGVhc2VzIHRvIHB1bGwgaW4gdGhlIGxh
dGVzdCBidWcgZml4ZXMgYW5kIGZlYXR1cmVzLgoKQmVjYXVzZSBzd2lnIDQuNS4wIHJlbW92ZXMg
c3VwcG9ydCBmb3IgUHl0aG9uIDIgY29tcGF0aWJpbGl0eSB3ZSBuZWVkIHRvCmJhY2twb3J0IGEg
cGF0Y2ggZm9yIFUtQm9vdCB0byByZW1vdmUgdGhlIFB5dGhvbiAyIG1hY3JvcyBpdCB1c2VzIHRv
CmdlbmVyYXRlIHRoZSBmaW5hbCBmaW1yd2FyZSBpbWFnZXMuCgpTaWduZWQtb2ZmLWJ5OiBCcnlh
biBCcmF0dGxvZiA8YmJAdGkuY29tPgotLS0KIC4uLi9hcm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0t
dHJ1c3RlZC1maXJtd2FyZS5oYXNoIHwgIDIgKy0KIGJvYXJkL3RpL2FtNjJweC1zay9wYXRjaGVz
L2xpbnV4L2xpbnV4Lmhhc2ggICAgICAgIHwgIDIgKy0KIC4uLnBsYWNlLXJlbW92ZWQtU1dJRy1Q
eXRob24tMi1jb21wYXRpYmlsaXR5LnBhdGNoIHwgNjUgKysrKysrKysrKysrKysrKysrKysrKwog
Li4ucGxhY2UtcmVtb3ZlZC1TV0lHLVB5dGhvbi0yLWNvbXBhdGliaWxpdHkucGF0Y2ggfCA2NSAr
KysrKysrKysrKysrKysrKysrKysrCiBib2FyZC90aS9hbTYycHgtc2svcGF0Y2hlcy91Ym9vdC91
Ym9vdC5oYXNoICAgICAgICB8ICAyICstCiBjb25maWdzL3RpX2FtNjJweF9za19kZWZjb25maWcg
ICAgICAgICAgICAgICAgICAgICB8ICA4ICstLQogNiBmaWxlcyBjaGFuZ2VkLCAxMzcgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ib2FyZC90aS9hbTYycHgtc2sv
cGF0Y2hlcy9hcm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNoIGIv
Ym9hcmQvdGkvYW02MnB4LXNrL3BhdGNoZXMvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0
ZWQtZmlybXdhcmUuaGFzaAppbmRleCA4Yjc3ZTFmMTY1M2EuLjJlMjRiY2QwZGU1YiAxMDA2NDQK
LS0tIGEvYm9hcmQvdGkvYW02MnB4LXNrL3BhdGNoZXMvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJt
LXRydXN0ZWQtZmlybXdhcmUuaGFzaAorKysgYi9ib2FyZC90aS9hbTYycHgtc2svcGF0Y2hlcy9h
cm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNoCkBAIC0xLDIgKzEs
MiBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgYzBmMjNjY2M3MWM0OTk4OWU5YWQy
MzhhY2YzMzQ0NzNjMTdiN2M4OGY3OWEyMGM4MjljM2Q0NDNlMzc5NGEyMiAgYXJtLXRydXN0ZWQt
ZmlybXdhcmUtdjIuMTEtZ2l0NC50YXIuZ3oKK3NoYTI1NiAgYjgwN2Q4YmYxOTBiN2M0NmI0MjYw
NzI5YjRiYmUyZjdkZjgzY2QxMDg2ZWRjYjE4MWQ2NjU5NWFlNjU5OGQyMyAgYXJtLXRydXN0ZWQt
ZmlybXdhcmUtdjIuMTUuMC1naXQ0LnRhci5negpkaWZmIC0tZ2l0IGEvYm9hcmQvdGkvYW02MnB4
LXNrL3BhdGNoZXMvbGludXgvbGludXguaGFzaCBiL2JvYXJkL3RpL2FtNjJweC1zay9wYXRjaGVz
L2xpbnV4L2xpbnV4Lmhhc2gKaW5kZXggNTNlYjE0Mzg5NDViLi4yMjliMDliMzU1OGYgMTAwNjQ0
Ci0tLSBhL2JvYXJkL3RpL2FtNjJweC1zay9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2gKKysrIGIv
Ym9hcmQvdGkvYW02MnB4LXNrL3BhdGNoZXMvbGludXgvbGludXguaGFzaApAQCAtMSwyICsxLDIg
QEAKICMgTG9jYWxseSBjYWxjdWxhdGVkCi1zaGEyNTYgIDc3NDY5ODQyMmVlNTRjNWYxZTcwNDQ1
NmYzN2M2NWMwNmI1MWI0ZTlhOGIwODY2ZjM0NTgwZDg2ZmVmOGUyMjYgIGxpbnV4LTYuMTAudGFy
Lnh6CitzaGEyNTYgIDJmZWFhNzA0NTNlOTFmNTQxYmU2YTVjOTA3OGQ4MTY4ZTA4MWFmNDVhM2Q5
NzE4MDU0ODUwNTM4Y2ZmMmViZjMgIGxpbnV4LTcuMi4xMC50YXIueHoKZGlmZiAtLWdpdCBhL2Jv
YXJkL3RpL2FtNjJweC1zay9wYXRjaGVzL3RpLWszLXI1LWxvYWRlci8wMDAxLXB5bGliZmR0LVJl
cGxhY2UtcmVtb3ZlZC1TV0lHLVB5dGhvbi0yLWNvbXBhdGliaWxpdHkucGF0Y2ggYi9ib2FyZC90
aS9hbTYycHgtc2svcGF0Y2hlcy90aS1rMy1yNS1sb2FkZXIvMDAwMS1weWxpYmZkdC1SZXBsYWNl
LXJlbW92ZWQtU1dJRy1QeXRob24tMi1jb21wYXRpYmlsaXR5LnBhdGNoCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZTViMTQ4ZWM1NWE1Ci0tLSAvZGV2L251bGwKKysr
IGIvYm9hcmQvdGkvYW02MnB4LXNrL3BhdGNoZXMvdGktazMtcjUtbG9hZGVyLzAwMDEtcHlsaWJm
ZHQtUmVwbGFjZS1yZW1vdmVkLVNXSUctUHl0aG9uLTItY29tcGF0aWJpbGl0eS5wYXRjaApAQCAt
MCwwICsxLDY1IEBACitGcm9tIDUyNzExNWVmNjc4M2NlYzQ5ZTU2MTBjNTIzYzEyNGIzOTkwMTEz
NjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBKYWlwYXVsIENoZWVybmFtIDxqYWlw
YXVsLmNoZWVybmFtQGVzdC50ZWNoPgorRGF0ZTogVHVlLCAxMSBBdWcgMjAyNiAxNTozNDozMyAr
MDIwMAorU3ViamVjdDogW1BBVENIXSBweWxpYmZkdDogUmVwbGFjZSByZW1vdmVkIFNXSUcgUHl0
aG9uIDIgY29tcGF0aWJpbGl0eSBtYWNyb3MKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5
cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6
IDhiaXQKKworU1dJRyA0LjUuMCByZW1vdmVkIFB5dGhvbiAyIGNvbXBhdGliaWxpdHkgbWFjcm9z
IChQeUludF8qLCBQeVN0cmluZ18qKQorZnJvbSBpdHMgcnVudGltZSBoZWFkZXIgcHloZWFkLnN3
ZyAoc2VlIGNvbW1pdCA3OWY3YTJiN2NiN2QpLiBSZXBsYWNlCit0aGVtIHdpdGggdGhlaXIgUHl0
aG9uIDMgQyBBUEkgZXF1aXZhbGVudHM6CisKKy0gUHlTdHJpbmdfRnJvbVN0cmluZyAtPiBQeVVu
aWNvZGVfRnJvbVN0cmluZworLSBQeVN0cmluZ19Bc1N0cmluZyAtPiBQeUJ5dGVzX0FzU3RyaW5n
CistIFB5SW50X0FzTG9uZyAtPiBQeUxvbmdfQXNMb25nCisKK1RoZSByZXBsYWNlbWVudHMgYXJl
IHNhZmUgc2luY2UgdGhlIG1hY3JvcyB3ZXJlIGFscmVhZHkgYWxpYXNlZCB0bwordGhlc2UgZXhh
Y3QgZnVuY3Rpb25zIGluIFNXSUcncyBQeXRob24gMyBjb2RlIHBhdGguCisKK1RoaXMgaXMgYSBi
YWNrcG9ydCBvZiBkdGMgY29tbWl0IDUwMDhkMWQ2YTM1NiAoInB5bGliZmR0OiBSZXBsYWNlCity
ZW1vdmVkIFNXSUcgUHl0aG9uIDIgY29tcGF0aWJpbGl0eSBtYWNyb3MiKS4KKworU2lnbmVkLW9m
Zi1ieTogSmFpcGF1bCBDaGVlcm5hbSA8amFpcGF1bC5jaGVlcm5hbUBlc3QudGVjaD4KK1Jldmll
d2VkLWJ5OiBKw6lyw6ltaWUgRGF1dGhlcmliZXMgPGplcmVtaWUuZGF1dGhlcmliZXNAYm9vdGxp
bi5jb20+CitUZXN0ZWQtYnk6IErDqXLDqW1pZSBEYXV0aGVyaWJlcyA8amVyZW1pZS5kYXV0aGVy
aWJlc0Bib290bGluLmNvbT4KK1NpZ25lZC1vZmYtYnk6IFBldGVyIFJvYmluc29uIDxwYnJvYmlu
c29uQGdtYWlsLmNvbT4KK1Jldmlld2VkLWJ5OiBQZXRlciBSb2JpbnNvbiA8cGJyb2JpbnNvbkBn
bWFpbC5jb20+CistLS0KKyBzY3JpcHRzL2R0Yy9weWxpYmZkdC9saWJmZHQuaV9zaGlwcGVkIHwg
NiArKystLS0KKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQorCitkaWZmIC0tZ2l0IGEvc2NyaXB0cy9kdGMvcHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBlZCBi
L3NjcmlwdHMvZHRjL3B5bGliZmR0L2xpYmZkdC5pX3NoaXBwZWQKK2luZGV4IGU0NjU5NDg5YTk2
YWIuLjMyNmExNWM3OTQxZTMgMTAwNjQ0CistLS0gYS9zY3JpcHRzL2R0Yy9weWxpYmZkdC9saWJm
ZHQuaV9zaGlwcGVkCisrKysgYi9zY3JpcHRzL2R0Yy9weWxpYmZkdC9saWJmZHQuaV9zaGlwcGVk
CitAQCAtMTAzMyw3ICsxMDMzLDcgQEAgdHlwZWRlZiB1aW50MzJfdCBmZHQzMl90OworIAlQeU9i
amVjdCAqYnVmZjsKKyAKKyAJaWYgKCQxKSB7CistCQlyZXN1bHRvYmogPSBQeVN0cmluZ19Gcm9t
U3RyaW5nKAorKwkJcmVzdWx0b2JqID0gUHlVbmljb2RlX0Zyb21TdHJpbmcoCisgCQkJZmR0X3N0
cmluZyhmZHQxLCBmZHQzMl90b19jcHUoJDEtPm5hbWVvZmYpKSk7CisgCQlidWZmID0gUHlCeXRl
QXJyYXlfRnJvbVN0cmluZ0FuZFNpemUoCisgCQkJKGNvbnN0IGNoYXIgKikoJDEgKyAxKSwgZmR0
MzJfdG9fY3B1KCQxLT5sZW4pKTsKK0BAIC0xMDY0LDEzICsxMDY0LDEzIEBAIHR5cGVkZWYgdWlu
dDMyX3QgZmR0MzJfdDsKKyAgICAgICAgIH0KKyAgICAgICAgICQxID0gUHlCeXRlc19Bc1N0cmlu
ZygkaW5wdXQpOworICAgICAlI2Vsc2UKKy0gICAgICAgICQxID0gUHlTdHJpbmdfQXNTdHJpbmco
JGlucHV0KTsgICAvKiBjaGFyICpzdHIgKi8KKysgICAgICAgICQxID0gUHlCeXRlc19Bc1N0cmlu
ZygkaW5wdXQpOyAgIC8qIGNoYXIgKnN0ciAqLworICAgICAlI2VuZGlmCisgfQorIAorIC8qIHR5
cGVtYXBzIHVzZWQgZm9yIGZkdF9uZXh0X25vZGUoKSAqLworICV0eXBlbWFwKGluLCBudW1pbnB1
dHM9MSkgaW50ICpkZXB0aCAoaW50IGRlcHRoKSB7CistICAgZGVwdGggPSAoaW50KSBQeUludF9B
c0xvbmcoJGlucHV0KTsKKysgICBkZXB0aCA9IChpbnQpIFB5TG9uZ19Bc0xvbmcoJGlucHV0KTsK
KyAgICAkMSA9ICZkZXB0aDsKKyB9CisgCisKK2Jhc2UtY29tbWl0OiAxMjYyZTUwYTM0YTBlMDFm
OTc0ZThkOTA5YzViMjU1ZjhmYTcxOTllCistLSAKKzIuNTUuMAorCmRpZmYgLS1naXQgYS9ib2Fy
ZC90aS9hbTYycHgtc2svcGF0Y2hlcy91Ym9vdC8wMDAxLXB5bGliZmR0LVJlcGxhY2UtcmVtb3Zl
ZC1TV0lHLVB5dGhvbi0yLWNvbXBhdGliaWxpdHkucGF0Y2ggYi9ib2FyZC90aS9hbTYycHgtc2sv
cGF0Y2hlcy91Ym9vdC8wMDAxLXB5bGliZmR0LVJlcGxhY2UtcmVtb3ZlZC1TV0lHLVB5dGhvbi0y
LWNvbXBhdGliaWxpdHkucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MDAwLi5lNWIxNDhlYzU1YTUKLS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC90aS9hbTYycHgtc2sv
cGF0Y2hlcy91Ym9vdC8wMDAxLXB5bGliZmR0LVJlcGxhY2UtcmVtb3ZlZC1TV0lHLVB5dGhvbi0y
LWNvbXBhdGliaWxpdHkucGF0Y2gKQEAgLTAsMCArMSw2NSBAQAorRnJvbSA1MjcxMTVlZjY3ODNj
ZWM0OWU1NjEwYzUyM2MxMjRiMzk5MDExMzYxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bTogSmFpcGF1bCBDaGVlcm5hbSA8amFpcGF1bC5jaGVlcm5hbUBlc3QudGVjaD4KK0RhdGU6IFR1
ZSwgMTEgQXVnIDIwMjYgMTU6MzQ6MzMgKzAyMDAKK1N1YmplY3Q6IFtQQVRDSF0gcHlsaWJmZHQ6
IFJlcGxhY2UgcmVtb3ZlZCBTV0lHIFB5dGhvbiAyIGNvbXBhdGliaWxpdHkgbWFjcm9zCitNSU1F
LVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitD
b250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK1NXSUcgNC41LjAgcmVtb3ZlZCBQeXRo
b24gMiBjb21wYXRpYmlsaXR5IG1hY3JvcyAoUHlJbnRfKiwgUHlTdHJpbmdfKikKK2Zyb20gaXRz
IHJ1bnRpbWUgaGVhZGVyIHB5aGVhZC5zd2cgKHNlZSBjb21taXQgNzlmN2EyYjdjYjdkKS4gUmVw
bGFjZQordGhlbSB3aXRoIHRoZWlyIFB5dGhvbiAzIEMgQVBJIGVxdWl2YWxlbnRzOgorCistIFB5
U3RyaW5nX0Zyb21TdHJpbmcgLT4gUHlVbmljb2RlX0Zyb21TdHJpbmcKKy0gUHlTdHJpbmdfQXNT
dHJpbmcgLT4gUHlCeXRlc19Bc1N0cmluZworLSBQeUludF9Bc0xvbmcgLT4gUHlMb25nX0FzTG9u
ZworCitUaGUgcmVwbGFjZW1lbnRzIGFyZSBzYWZlIHNpbmNlIHRoZSBtYWNyb3Mgd2VyZSBhbHJl
YWR5IGFsaWFzZWQgdG8KK3RoZXNlIGV4YWN0IGZ1bmN0aW9ucyBpbiBTV0lHJ3MgUHl0aG9uIDMg
Y29kZSBwYXRoLgorCitUaGlzIGlzIGEgYmFja3BvcnQgb2YgZHRjIGNvbW1pdCA1MDA4ZDFkNmEz
NTYgKCJweWxpYmZkdDogUmVwbGFjZQorcmVtb3ZlZCBTV0lHIFB5dGhvbiAyIGNvbXBhdGliaWxp
dHkgbWFjcm9zIikuCisKK1NpZ25lZC1vZmYtYnk6IEphaXBhdWwgQ2hlZXJuYW0gPGphaXBhdWwu
Y2hlZXJuYW1AZXN0LnRlY2g+CitSZXZpZXdlZC1ieTogSsOpcsOpbWllIERhdXRoZXJpYmVzIDxq
ZXJlbWllLmRhdXRoZXJpYmVzQGJvb3RsaW4uY29tPgorVGVzdGVkLWJ5OiBKw6lyw6ltaWUgRGF1
dGhlcmliZXMgPGplcmVtaWUuZGF1dGhlcmliZXNAYm9vdGxpbi5jb20+CitTaWduZWQtb2ZmLWJ5
OiBQZXRlciBSb2JpbnNvbiA8cGJyb2JpbnNvbkBnbWFpbC5jb20+CitSZXZpZXdlZC1ieTogUGV0
ZXIgUm9iaW5zb24gPHBicm9iaW5zb25AZ21haWwuY29tPgorLS0tCisgc2NyaXB0cy9kdGMvcHls
aWJmZHQvbGliZmR0Lmlfc2hpcHBlZCB8IDYgKysrLS0tCisgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL3NjcmlwdHMvZHRjL3B5
bGliZmR0L2xpYmZkdC5pX3NoaXBwZWQgYi9zY3JpcHRzL2R0Yy9weWxpYmZkdC9saWJmZHQuaV9z
aGlwcGVkCitpbmRleCBlNDY1OTQ4OWE5NmFiLi4zMjZhMTVjNzk0MWUzIDEwMDY0NAorLS0tIGEv
c2NyaXB0cy9kdGMvcHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBlZAorKysrIGIvc2NyaXB0cy9kdGMv
cHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBlZAorQEAgLTEwMzMsNyArMTAzMyw3IEBAIHR5cGVkZWYg
dWludDMyX3QgZmR0MzJfdDsKKyAJUHlPYmplY3QgKmJ1ZmY7CisgCisgCWlmICgkMSkgeworLQkJ
cmVzdWx0b2JqID0gUHlTdHJpbmdfRnJvbVN0cmluZygKKysJCXJlc3VsdG9iaiA9IFB5VW5pY29k
ZV9Gcm9tU3RyaW5nKAorIAkJCWZkdF9zdHJpbmcoZmR0MSwgZmR0MzJfdG9fY3B1KCQxLT5uYW1l
b2ZmKSkpOworIAkJYnVmZiA9IFB5Qnl0ZUFycmF5X0Zyb21TdHJpbmdBbmRTaXplKAorIAkJCShj
b25zdCBjaGFyICopKCQxICsgMSksIGZkdDMyX3RvX2NwdSgkMS0+bGVuKSk7CitAQCAtMTA2NCwx
MyArMTA2NCwxMyBAQCB0eXBlZGVmIHVpbnQzMl90IGZkdDMyX3Q7CisgICAgICAgICB9CisgICAg
ICAgICAkMSA9IFB5Qnl0ZXNfQXNTdHJpbmcoJGlucHV0KTsKKyAgICAgJSNlbHNlCistICAgICAg
ICAkMSA9IFB5U3RyaW5nX0FzU3RyaW5nKCRpbnB1dCk7ICAgLyogY2hhciAqc3RyICovCisrICAg
ICAgICAkMSA9IFB5Qnl0ZXNfQXNTdHJpbmcoJGlucHV0KTsgICAvKiBjaGFyICpzdHIgKi8KKyAg
ICAgJSNlbmRpZgorIH0KKyAKKyAvKiB0eXBlbWFwcyB1c2VkIGZvciBmZHRfbmV4dF9ub2RlKCkg
Ki8KKyAldHlwZW1hcChpbiwgbnVtaW5wdXRzPTEpIGludCAqZGVwdGggKGludCBkZXB0aCkgewor
LSAgIGRlcHRoID0gKGludCkgUHlJbnRfQXNMb25nKCRpbnB1dCk7CisrICAgZGVwdGggPSAoaW50
KSBQeUxvbmdfQXNMb25nKCRpbnB1dCk7CisgICAgJDEgPSAmZGVwdGg7CisgfQorIAorCitiYXNl
LWNvbW1pdDogMTI2MmU1MGEzNGEwZTAxZjk3NGU4ZDkwOWM1YjI1NWY4ZmE3MTk5ZQorLS0gCisy
LjU1LjAKKwpkaWZmIC0tZ2l0IGEvYm9hcmQvdGkvYW02MnB4LXNrL3BhdGNoZXMvdWJvb3QvdWJv
b3QuaGFzaCBiL2JvYXJkL3RpL2FtNjJweC1zay9wYXRjaGVzL3Vib290L3Vib290Lmhhc2gKaW5k
ZXggZmU5YjRmNTNkYzYzLi5mZjZlNGVkMmUyZjYgMTAwNjQ0Ci0tLSBhL2JvYXJkL3RpL2FtNjJw
eC1zay9wYXRjaGVzL3Vib290L3Vib290Lmhhc2gKKysrIGIvYm9hcmQvdGkvYW02MnB4LXNrL3Bh
dGNoZXMvdWJvb3QvdWJvb3QuaGFzaApAQCAtMSwyICsxLDIgQEAKICMgTG9jYWxseSBjYWxjdWxh
dGVkCi1zaGEyNTYgIGY1OTFkYTlhYjkwZWYzZDZiM2QxNzM3NjZkMGRkZmY5MGM0ZWQ3MzMwNjgw
ODk3NDg2MTE3ZGYzOTBkODNjOGYgIHUtYm9vdC0yMDI0LjA3LnRhci5iejIKK3NoYTI1NiAgNzhl
OGJmYzM4MmZlMzg4ZjliNTVhYTFkYWY4YzU2MzUyMmEwMzc3NzliNWQ0YzM0OWQxNDE1ZTM4MWYx
MjQzZSAgdS1ib290LTIwMjYuMDcudGFyLmJ6MgpkaWZmIC0tZ2l0IGEvY29uZmlncy90aV9hbTYy
cHhfc2tfZGVmY29uZmlnIGIvY29uZmlncy90aV9hbTYycHhfc2tfZGVmY29uZmlnCmluZGV4IDg3
NjczNGJmNGVmMy4uYzkxZjMwOTRhMjBiIDEwMDY0NAotLS0gYS9jb25maWdzL3RpX2FtNjJweF9z
a19kZWZjb25maWcKKysrIGIvY29uZmlncy90aV9hbTYycHhfc2tfZGVmY29uZmlnCkBAIC0xMCw3
ICsxMCw3IEBAIEJSMl9ST09URlNfUE9TVF9CVUlMRF9TQ1JJUFRfQVJHUz0iLWMgdHR5UzIsMTE1
MjAwbjggLWQgazMtYW02MnA1LXNrLmR0YiAtbCBhbTYyCiBCUjJfUk9PVEZTX1BPU1RfSU1BR0Vf
U0NSSVBUX0FSR1M9Ii1jIGJvYXJkL3RpL2FtNjJweC1zay9nZW5pbWFnZS5jZmciCiBCUjJfTElO
VVhfS0VSTkVMPXkKIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQotQlIyX0xJTlVY
X0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xMCIKK0JSMl9MSU5VWF9LRVJORUxfQ1VT
VE9NX1ZFUlNJT05fVkFMVUU9IjcuMi4xMCIKIEJSMl9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVG
QVVMVF9DT05GSUc9eQogQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15CiBCUjJfTElOVVhf
S0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0idGkvazMtYW02MnA1LXNrIgpAQCAtMTksNyArMTksNyBA
QCBCUjJfVEFSR0VUX1JPT1RGU19FWFQyXzQ9eQogQlIyX1RBUkdFVF9ST09URlNfRVhUMl9TSVpF
PSIyNTZNIgogQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRT15CiBCUjJfVEFSR0VUX0FS
TV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OPXkKLUJSMl9UQVJHRVRfQVJNX1RSVVNU
RURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9InYyLjExIgorQlIyX1RBUkdFVF9BUk1f
VFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTl9WQUxVRT0idjIuMTUuMCIKIEJSMl9UQVJH
RVRfQVJNX1RSVVNURURfRklSTVdBUkVfUExBVEZPUk09ImszIgogQlIyX1RBUkdFVF9BUk1fVFJV
U1RFRF9GSVJNV0FSRV9UQVJHRVRfQk9BUkQ9ImxpdGUiCiBCUjJfVEFSR0VUX0FSTV9UUlVTVEVE
X0ZJUk1XQVJFX0JMMzJfT1BURUU9eQpAQCAtMjcsMTIgKzI3LDEyIEBAIEJSMl9UQVJHRVRfT1BU
RUVfT1M9eQogQlIyX1RBUkdFVF9PUFRFRV9PU19QTEFURk9STT0iazMtYW02MngiCiBCUjJfVEFS
R0VUX1RJX0szX1I1X0xPQURFUj15CiBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9DVVNUT01f
VkVSU0lPTj15Ci1CUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9DVVNUT01fVkVSU0lPTl9WQUxV
RT0iMjAyNC4wNyIKK0JSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX0NVU1RPTV9WRVJTSU9OX1ZB
TFVFPSIyMDI2LjA3IgogQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQk9BUkRfREVGQ09ORklH
PSJhbTYycHhfZXZtX3I1IgogQlIyX1RBUkdFVF9VQk9PVD15CiBCUjJfVEFSR0VUX1VCT09UX0JV
SUxEX1NZU1RFTV9LQ09ORklHPXkKIEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT049eQot
QlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyNC4wNyIKK0JSMl9UQVJH
RVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjYuMDciCiBCUjJfVEFSR0VUX1VCT09U
X0JPQVJEX0RFRkNPTkZJRz0iYW02MnB4X2V2bV9hNTMiCiBCUjJfVEFSR0VUX1VCT09UX05FRURT
X0RUQz15CiBCUjJfVEFSR0VUX1VCT09UX05FRURTX09QRU5TU0w9eQoKLS0gCjIuNTUuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
