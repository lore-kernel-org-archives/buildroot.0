Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FEEC982F1
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 08:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FE8F406F2;
	Tue, 22 Sep 2026 08:47:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dlZ70hGwopr; Tue, 22 Sep 2026 08:47:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7DADC4072B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790066854;
	b=eB5JnqvMf1GFdvztjSR0RI8GNw/VI31eBDMFyd1ADl59LWnrnS19zE1DnuSGKtH9Qv7x
	 d91szIw+U8pGQ5b3TA5VUqgN7V9apzARMDQynEOu5MCLQ0OSIdH+T8lxrZeheXIqENKot
	 0HLgGBdGcFfTfN9yQN0MPWTi184tE4jn1KOcQ6Y/zxoVdUND9bsIEj/bxxsghJ1Fjs5uF
	 5ZKMb1rdbnX/4+Z3d90TPI50UK9YnnGfR7Nh8ozUk4ZF+dwlAjgxqm4QKsds7x2tjdTFv
	 86inKyzdlvHnf2ORF7cQR5tvpz1DM1zhbNrhmOc9BA2InVbvOdwLtxxhcenbEiRvPPw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790066854;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=l0HNCSzfj5ImB1i64+PxPFrb7ra/pym6PX+NWwV7F9k=;
	b=K8COwptFqo96SgvmmEPPbM8fWDzf6DK2uzmfAhKclLnISrKuGJJDA6b0/3Z7QhDuynFU
	 HfDu4nTWsQqTKWFVihH+SaHejkTpHJ312r9wRlGLeLtZ9qcwq1mMbjO3ZpupzcGxPgw60
	 ZY4swcYrioVQ8i4gfMDnSXnnQyJGH0zfLOchrs9YQxmM5BRk2UAkeggFIQzfftc93+Wma
	 Rdlclx1Caj2kK1rIahH2OlfRB6qIh2HWlkArd4BSnolNznX38TkGHQBhLuK1vQHXM1u2k
	 06bwXXlrf8njhV01QOgjllo7DIg5yl2ytwaF2/qV2QziU4aWY/5BeOZxlK5zaEGUS7Q==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790066854;
	bh=l0HNCSzfj5ImB1i64+PxPFrb7ra/pym6PX+NWwV7F9k=;
	h=To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=fPMf2DeFDvKDzK2rvpfAeDL5QEL1fwF2gIIhuDeKGg5QhOe8WW9+j31yfruKlOyN2
	 7b2QaXvKh/UvyAthD+dO56MDD2df0hqsVmYNF3YGBAbtWhC04w1TPmIDFcZw/2Ok6j
	 Za3oQS3LRMefJ9RoLeb6HEZmLjqu5z5amk7poIzVlvL3k+Xnl2beQwt6XY38BxruhJ
	 JrXTTF//Q8Q4BvdyYltL0JRKkPUz3w9/iNZ9AACi0WsIjv9P4jPqRpSx6TJXDpHeZx
	 qmZehNXsfPLJZt9K2xXc6on5G7aXX21/meq1MYPORjohvKpJucf5x1ZrJwry5EJzP3
	 +gHTbqq4X3nSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DADC4072B;
	Tue, 22 Sep 2026 08:47:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DA34194
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 08:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82E4580A8C
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 08:47:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VZaKocRFBUot for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 08:47:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EEE56809CE
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790066853;
 b=YAEuAZY9A++FXKHaWTKuWWZEbcE3lgOkCx61uXUrBulTvW6IrHPVMzHu44UKUscWCUlH
 28scOh1YRHtQ7MoVuP2/tN+iIUjjpk4RW/eE46pC0p1h4UJCKao1cLRlGcm1GznO9+zMy
 u48KAjWz/raUGwYpTS1hAaZpo7QTuGNblDMgywYHkhWLiprJ6vh0eOl/jnESSEI/M9pb7
 sFSxq9xWNap2ttD4P0pU6el5AKC5gGJoi/jUWW1r2zTLAtS9UE4Hw3jc2aOWf2S/V8449
 owf6f3eDSPbh363k49gCwGQwXpM0qnWJJjjl8qAZvJsRt7Rm+T8a43+6Ak8kkeurh3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790066853;
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
 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
 bh=1ez3/DD0cWcWV5H3IjtTFVUbj5/jcQ3rcoPxKDEK7L4=;
 b=EDAjMfSMWs1tr3YVD6p6oBgxX6qK0pegdnw9DJtJs2M/Psmx9ZelcoNFW1UKTW02PMr+
 /8i6ZYy6L+pFKVaLumxH7Y90ZlrCS8Ct91L/P6A6sMPUIvD+R39Z3ZSaiaBQqDGhf7DY5
 WwD7JloIAye2qONl73kPMZDKxDyRvY9iJvbXJCbT7Dvx87rGKGpgQ3EvoNlJhxnDoauaP
 mnWzwt9R3SaWU5AkEDdJLftltCRW3Q+WlqKdqHV3Z/5JC2JjXavkz3dvyCIYb/Ubo9fGT
 Wip4V99eO9OraNCX3PvCDIS7MyikzP6juFKnfmOmg2aYiivsM+vxsAdLponjCCtC2pw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=ti.com; 
 dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=proofpoint-05-2026 header.b=WEsGpgId; 
 dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b="e/gPWJL1"; 
 arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.150.75;
 helo=mx0a-0002e601.pphosted.com; envelope-from=s-sadik@ti.com;
 receiver=<UNKNOWN> 
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com
 [148.163.150.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEE56809CE
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 08:47:32 +0000 (UTC)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
 by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68M5sfBB932416;
 Tue, 22 Sep 2026 03:47:30 -0500
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11011059.outbound.protection.outlook.com [52.101.52.59])
 by m0380145.ppops.net (PPS) with ESMTPS id 4guf4x2fpk-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 22 Sep 2026 03:47:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzlrlaIHgWoYoA26DmqlQrkV4o6P+L39jgVfuoAoqAWFIzd0bIlIpCYC+Pnf0mUa28OKa36uKQOO/NSV6D7LT7Nyte7x8jgounOifdaKuKwWAcKlYvWWhuZ9FKASg0ow33OFAJ1V6qKczWGcigBz3ZdlJgHafXImri7lPHBF28iAZC9Z8dyA0EBjMjOKEK+SWyfu8nkohndHqrj1I+/GXzkqzr2QmjhYB/0/uHv5PHkIMEPFaGOIQ3ZGvFYA+SrGk2hOqV5GeZ0EpZu5p2wiZMGvn1Cu1O8kAgmHx8YZLw3sWYMI3svn2SEX+oHQHTaC4kmDj+e40QtFkhm2BRPv4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ez3/DD0cWcWV5H3IjtTFVUbj5/jcQ3rcoPxKDEK7L4=;
 b=D8bKp0Wn/soD31lbBmfTIN7x7z3Pbisan4GMRwQ4wVDZOcw2nhUBqglePKWBJCHO96l5vLYTy+Dy1dbu8tEg7b2vsmHm6PaW7z/pN460bugQkU5+YrM422v7tCWCgIXq82nTtuI0OskJS3530gG473pHpG2c6oPE9SU32Eeiz5eB8Xn4680mYAutLmBWYc85I7zVdTd23DOsaNYKmgs5Picu4/ttssP4CpqHUeZPkizS4IujgYlGN5GhzYNGCrj+q284ry7SfDV4FKcDB7Leb2zRsIrSgzDypC4fhw/Ji9qKMoPhCkVGeeaJwzgXGkQ4oEJePyGnOW/3irkUYdPkAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
Received: from CH3P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::17)
 by CH3PR10MB6692.namprd10.prod.outlook.com (2603:10b6:610:148::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 08:47:26 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:610:1e8:cafe::79) by CH3P220CA0003.outlook.office365.com
 (2603:10b6:610:1e8::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 08:47:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 08:47:25 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 03:47:14 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 03:47:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 03:47:14 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [10.24.52.210])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68M8lCAP523801;
 Tue, 22 Sep 2026 03:47:13 -0500
To: <buildroot@buildroot.org>
CC: Bryan Brattlof <bb@ti.com>, <thomas.petazzoni@bootlin.com>, "Bajjuri
 Praneeth" <praneeth@ti.com>
Date: Tue, 22 Sep 2026 14:17:08 +0530
Message-ID: <20260922084708.391207-1-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|CH3PR10MB6692:EE_
X-MS-Office365-Filtering-Correlation-Id: 128ac182-3ae1-422d-599e-08df18862055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: dumgK8iuxCMkP3xLe0Lw4YMTsVBJukWemy06quHnwRvo2dn4N8gawl1a668BB2KqX0t9dQWzGxFn/+XPvMOEdXFVJf/AafWhxzw6YNjxjS4dww40+2eMww24R94LT66CdW89hf5YtJWnpDHb7YK/VB4ihPVPrdgHSO9q2RaYcJJcz5FVdTok0alSLLEnZX2fsvgMdVgX1dKNQloTxXuFL3HDvgShpMwPFSCGSFQKvxybSShjl/3AAt8wf0tQGvF6vI+SWXfpeTWx1F8OQ4BfdCbUKMxDvwuY6mSHZLnqSSoBbRvg0X2gTJzmxVJJXijN9fAxaGti4YtcmaVBtawk/v4nkZtLjZjbkZn7mFtCOVQjGQ1QH4U9f8fXXpRWFXdJrzvFo5UG8FVS1Z+slsjuemsz5iwE9tzcyALjqUC0vRfIZLO391I4/sEsYlav0R++M2ioltdMsN2xEnnL4H4oz+IdFl7VE17wIQGS7iTOIf2TIjAYhVYQb4DTWCL6p1pkN4Fo/TkY0ygT5VFETOEvQdo4L5nN6RFYdylSzGQtSmtPxl4P+voAaWPEfpe9Wx/daSwB48HWtA0KlBxhfm5n6L980JRItVUFtuMfotAb3xpKj/sSBcwW0Ves4zH+LW0PMKSHnMa4CXoNdgB2lDd2TXWlr2h3zHDNlE1Uq56AG0USnlQX3TUVgwkmLgUQ2xwHcEFsU+vzg20UPjDyLPWgeA==
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4ep1ThEW33uYHvlYKkUGTnQL5X1AWdpT0YDws+qZCeJLGFlqCLsQfS1tAspmB8nlmvT4tNRpAxwfTrBWNA89m3OeE5CyvIXmvr6sYDxB5NHFaaOzfNkNEZQSPm79U1d/4TKX5RgmNep77JJSG1k0qI4u4AILMLnxSzIrHgz96ZzUGytkxze6TT4Z1EdFmqd9kthjCIJJrh9G6/2B1SLu5n2UNuXAp7XvKhOK6u0USH34BV6RwD5nmqm8kknbqqA9REGt0BCMs7XkFUurlZ+iX8gMVqjolt1dXm2JlzGPMU2QFG7Ipk+1F3jL46IGBPq6p/IoV1PvrV0U5DDGf2CZTWpsYDgt4h0Q1qMruAlrK1gJ+tBOXZwfgEb6DJGhn+XpHHC5STZkxBjSYZwjuKe4NaDSmQBojv891uyTNo0FfYiLGvueECE8jRc/4XcIkPqO
X-Exchange-RoutingPolicyChecked: T8OFvOYyZREtLJ2QTmKTC6p1gHtv4lJLvhzazuAykqqygiV+n7ifExX2gTJOr+Y5lSUoLKcnf2vOsZ5KbAGa6EC/k9Vl3alIKayvSJQhVTVIiHWM5J7tZW1d5WdyFD0h9xd7tUoNvVubuCesDu2XfIZK3pRW7BAKeS0o/01nJ92B5x/tuRRxWLlPk2za0vghoOp7m9B7Xs01UXp7PhaOmO1cJq9BWETxWy/JPz7WqX9TJhEZ/PQag/AbLQF/ILJRWARbsncPCuUZbTVL85U3wkMPKFqLWqUtWOWxXlnd+nC5z+oHBsao9Ltwbqct5ufJNeiogD0dfgKuKoObdYCLsA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 08:47:25.5765 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 128ac182-3ae1-422d-599e-08df18862055
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6692
X-Proofpoint-ORIG-GUID: b1yYWDrkc94_SHb0CMM2UdYNBv8BOcWc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEyNSBTYWx0ZWRfX1sQ3vGxJcD6j
 60WTCGkDvi73BI72gIhbO3mCXlxgWuiocaSNTrOkbqxKvYa3BaEooeLdI1lqra8UXoelY7hBteQ
 7kxYL26GACnjoAnoZkRaHLFXMLIT8wYyzA5TlwDocugjV3l1kifbCaTSnMJb5fjwqiZmn/aiUqw
 /uin4SJy9LKhpcmPPD6XedydLJEL/s9wewsROibJdueBDXGy/RxPrfv/fCAQ90fBthChu4dgbGX
 OMJk4Fpj1yRQzBlc74+LZV2QB4aLU3lZDB2kpOSPjBPt/+vWjHDcvIWw8dlOPLlG+2e/QC9sBcU
 5TOU7Fkv3BtGvnSa/YXoTFbe2jUTd05Tt9THYlAfCX7LOPGF5K+Bs1hdx50Mix2JyvXMYDEsaEv
 TdwollDcz8L6w0f+rZV0FflhTdXGbQ3YQRHZ0dqug1IswSsJkVaiXJlgcgZk4ZCXkFKxrXtWRUH
 trMD3rXA8g799TinA2w==
X-Proofpoint-GUID: b1yYWDrkc94_SHb0CMM2UdYNBv8BOcWc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEyNSBTYWx0ZWRfX195FtqQrRDlM
 vHNrjv3d3lW24jZ5FCCfhHKauYUbqOsXtI6KtAGBSZFAPwcpleguJMMZEJRSZuLcJ5hivBbSzfY
 OYdY6mm3KHZr4ZmhwB1bN+yC3xm2mvY=
X-Authority-Analysis: v=2.4 cv=XYYcX455 c=1 sm=1 tr=0 ts=6ab240a2 cx=c_pps
 a=MNM/txilNqeExyaWs+jKwg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=8_A3fo19WNOA_lr3xa0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220125
Subject: [Buildroot] [PATCH] boot/ti-k3-r5-loader: install all tiboot3
 variants to BINARIES_DIR
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

u-boot for k3 r5 core (ti-k3-r5-loader)
install different target image (tiboot3*.bin) depending on the K3
SoC boot ROM:

General Purpose devices (gp)
High Security - Field Securable devices (hs-fs)
High Security - Security Enforcing devices (hs)

This copies all the tiboot3 variants into the BINARIES_DIR

Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
---
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 178db5c0f3..221bf33641 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -103,9 +103,16 @@ define TI_K3_R5_LOADER_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
 endef
 
+define TI_K3_R5_LOADER_INSTALL_TIBOOT3_VARIANTS
+	for f in $(@D)/tiboot3-*.bin; do \
+		[ -e "$$f" ] && cp "$$f" $(BINARIES_DIR)/; \
+	done
+endef
+
 define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
 	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
 	$(TI_K3_R5_LOADER_INSTALL_TIBOOT3_BIN)
+	$(TI_K3_R5_LOADER_INSTALL_TIBOOT3_VARIANTS)
 	$(TI_K3_R5_LOADER_INSTALL_SWSFW_ITB)
 endef
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
