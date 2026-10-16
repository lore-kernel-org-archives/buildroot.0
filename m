Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DD9CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 09:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 862E38146E;
	Fri, 16 Oct 2026 09:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ePg3kNP1rKzq; Fri, 16 Oct 2026 09:35:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 83E25813CC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792143310;
	b=hnalnqtIMZcW/cNpawXeLSiTbGVmPDt3BGXgnFDVd9KIbUztLiwqJvPvqzO48vQx5j1T
	 0nCtXmGKvTXcPF5KKwdTUitejyL10R0aCw7VNuvVtzt7WMvqqE2/ScrxnOM8v5hWUpzJV
	 Qdp4Fw+KgW768DG5rUpwKg8quj1++BTjkjuXSYPk1nAAxK28CQswfavjnmetUee89XXZe
	 WhuewdHsgPkDjwIWgRThbkqMXviRn71pfYAj82yCAUFBD5Mucu4ojy9WuQgZM2OYsq8h+
	 Rb4HQHJ80K7KfYLk5nRwpu+nrpQpjLTb5VR4wFbNyWWYzQrf/9+I1qp1nWbrp8CtMaQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792143310;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Received:Received:Received:To:CC:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YOGi9LokLH25IcGdybpyrSV4+VkW0dqtkRZ9+oSqdY4=;
	b=WJgjSD370yy2F0p6ic/zk0+uLbLNRCWitnVFgToqWKVcjNYGqS2+xJwxPFSt31rE0ah9
	 6DdKws1mn+uWZ04oADz+ACvEDeWUvjWQNTMeUMAieHLtF4S0+qhV9/THezYSbatBIU/4p
	 afl/fGgwqtI2JJSVbuI62vsnVqLgVAAv1wm6YeXtjSjHVkIJOKpzGbiuUI/taL2qKj/jV
	 EVzsQgRbdYtPe2P3Q6KCWwXcrB/ua3d3bGIpNIkmMwDHy84me4Olv4dOSu2H9W0B0C9tc
	 EOFcMvFku1I/WdJIavtPdPfG5m7EthE/4Xibey3islTvD4igPJHnnASPkgI9spdipqA==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792143310;
	bh=YOGi9LokLH25IcGdybpyrSV4+VkW0dqtkRZ9+oSqdY4=;
	h=To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O7hnMWT0BzPewSIA8MvW2X6cEfpB8UCWGix7lCZzo9aJGcm88zBbGO1HLHi2g5U97
	 sG+h/4NUx9VNCJaPDEkeH/vnAcmKy633b9GVBJyQeHiLEfV2YIhahRRi5Cta6sCdo2
	 B08PNUfMNdz81oRJlXdowEHXGC9g7jftFZJh/yI2urNUqoNjSdAoLXFusGcykvxvui
	 XgZezbBtGjicBOg+5WlD6uvY6vsnO/m4oWmx9jnepy5W9MtSHrcWZQelohqo/NrHdq
	 5wz9Rn4VMoWP9W7mgzEleL6qbhJSo7IRZ9qwruY27pRDLWTythLS+DuLN3YCxz/0PV
	 ideFoSLHLA+mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83E25813CC;
	Fri, 16 Oct 2026 09:35:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F5531DE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 09:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 712CD81323
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 09:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDlFyJfUIcci for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 09:35:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8836281466
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792143307;
 b=ZzdTu+2P5lJANW7jov60F7ilgZC301WK1lh1hrHCXjRX9xsElbrB5TwTUE483w+fdQa8
 YZM2TfC28VRfw8MJOSZLkdOdVsoVaTRG0C/1XdHhixyCTzBd6sUH+XtDt1t8S6XpGGDBy
 1IzzcFcG5BdLIMYdzy/FBqUQysHzBq9MILRo/cCE1GmVnkDJqAyMbLisJ8fP4nAfRbbRc
 vwo5eNCrh7Hq4zcy4HrbPWpBYq9n+5I8in2Ns3aqeD5SdrfFdXYW8MHx/da8zuxCyGo4Y
 LUltC1e4+mJw3Avv+NFGG0+BqMQnnpU9j1bOrQazqgWT/HMMpfPbx2qhf2xCbZaV2Wg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792143307;
 h=Received-SPF:Received:DKIM-Signature:Received:DKIM-Signature:
 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
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
 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
 bh=iSzq9L2Z7fuCTKZjlb4wtIY6Wzg5MNMts0XAVhD8Abc=;
 b=XvqpjU4EEJ2I7/lClMFw5smOA7KtL/lQ+awymSSvvYRuKxIqQLg+NRSt5lawWr0eoiBq
 9PyUcRrnc5so8DtLOeMzwUCW3MhQJ339YnSRVCXBWMqCd1u7LwVN+/RAbzl/qb1I6iGbt
 mKgESjRj6As0EjBiyNLvuX6PS+GFEGgIhMwzN7oZQbyPpIZhX3qxVbZk1S/NxS8CoAsHf
 cZlnjDl06AdiP5jhZtcXMbMYeWTfm4Ldtc0W4bK3Mot6Wn1wTV4Aip/DyHFOZPqPJx6Yy
 DwKAmGYjJst3nHPceuBfTQJWC4zhYy+KNy7EVAmECr5azTgILgEkNAFoP6SRhvJQvIg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=pass header.from=ti.com;
 dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=proofpoint-05-2026 header.b=bgdiWNZE; 
 dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com
 header.b=YC8Lekcu; 
 arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.154.28;
 helo=mx0b-0002e601.pphosted.com; envelope-from=s-sadik@ti.com;
 receiver=<UNKNOWN> 
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com
 [148.163.154.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8836281466
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 09:35:05 +0000 (UTC)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
 by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69G9TvXZ475954; Fri, 16 Oct 2026 04:35:02 -0500
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11011061.outbound.protection.outlook.com [52.101.52.61])
 by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hbhbd80qv-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 16 Oct 2026 04:35:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbGwkb78+YgH+d5/jh5bjHRhHcxK5mLWXQFdukDDHTZQeaFUXNhUuO7M8aVgZ9nNlHsdnld9v9F2k70IHrQFUvRl1yHAD5n9+DBsj67VT+YURICH8SpkuElRtsXhctr1v7QDyGb973An4vpv6yLhcXp67vEINrAaexzNxOKyM+D+Vxc+wBj9kqTgdA8rDD6ZDtGWhatyhMAcB+nD9lD4wMEQMW1wqAcrKSulWjJ+kTTyMzVxKNj+1aEsMRvaoT3a9tT8akMTA/L2LSMUJp7hhjIXsO8/xbKJMszZhz07Z07DcVsw1qA2LHh/txonb4keqema0jNPHGwXDQ+KRW3CJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSzq9L2Z7fuCTKZjlb4wtIY6Wzg5MNMts0XAVhD8Abc=;
 b=y/f2RSQQnbroqvyp4SP3pwTWpjN8U0Zg2CVvaDNAzcDIsaYSFkH/qPqW1sR0ZRuuxGC11bg313WeJiykNZ9qRyNLeMo9CjOvdgOGLkFfXHQFN3W5V0ISsWv73todjQkC1gMRjdbsWyI7iU+pbEaelwMrhRDeblpC8KbIzjRolLRQVf5gtEBEJxhdpmrANY2K4oiDoAeeFRN6TREuEpBQby4bwfICYcXFRCpkkSy4hW7OLp2qxXXKsugNqGBs1/XEOt+pUpNAwScovoBRQ9DR+ueG1xkwLnOXFhMxnR0pgOO9PeDTS8F2t6SCrGUVQ4guGgRGDHvQ18KTjUt5KYQfqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
Received: from PH8P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::33)
 by PH0PR10MB6957.namprd10.prod.outlook.com (2603:10b6:510:285::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.8; Fri, 16 Oct
 2026 09:34:57 +0000
Received: from CY7PEPF000000F5.namprd05.prod.outlook.com
 (2603:10b6:510:2d8:cafe::40) by PH8P221CA0020.outlook.office365.com
 (2603:10b6:510:2d8::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 16
 Oct 2026 09:34:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY7PEPF000000F5.mail.protection.outlook.com (10.167.247.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 09:34:55 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 16 Oct
 2026 04:34:43 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 16 Oct
 2026 04:34:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 16 Oct 2026 04:34:43 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [10.24.52.210])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69G9Yem01325038;
 Fri, 16 Oct 2026 04:34:41 -0500
To: Thomas Perale <thomas.perale@mind.be>
CC: Mahammed Sadik Shaik <s-sadik@ti.com>, <buildroot@buildroot.org>, "Arnout
 Vandecappelle" <arnout@mind.be>, <thomas.petazzoni@bootlin.com>, "Bajjuri
 Praneeth" <praneeth@ti.com>, Prudhvi <prudhvi@ti.com>
Date: Fri, 16 Oct 2026 15:04:02 +0530
Message-ID: <20261016093401.2284107-1-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006191720.184725-1-thomas.perale@mind.be>
References: <20260923105122.659234-1-s-sadik@ti.com>
 <20261006191720.184725-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F5:EE_|PH0PR10MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fccb641-c100-41ff-2763-08df2b68bd31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|22082099003|18002099003|10067099003|3023799007|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: L2VAifxlQzyOQZqam8PA2L5RJo+OjZwOt600Aj4RqIse5/D4ARKwemotwKkyJGofuRjHH9L1oe2zSv5i76Vax50pENUmMrIDlebnxB5L9RbZnWLvJKvCUM9qdZyBSiTeXaM64PH6vh/DP8NroXGF8q2dOI/XYX3s92t7SRK47Lb2gRzvPMI+CbnwTfFYrNjIqlRa+s91WrilgYLp2uJic8C+3L0d6ojp7gPpPz41idPPgZQxxmJBoaiu8O3wivxiQf+m1a51nMAm4QT8srNvHIoXKcH+oMr/aUx22uhSiN/PvN4agcEM47JGNFGLBsf8CKcndAxMDT5fovwMfNBQ2oUkwl1dMEDkB4aNgKQ0goeyK/aZqN/JbUQj1xg20meeXpI/w2oDJ4FhVcJQwe+QmqMKBef6ZLgdEenFr57mmS/kMZy+PkNMx4HZxVCpgFOp9NT26/sOzYYEPb3aqSDhmXVNXJ0VOiNQ6H/cvD5wUElkOSeQ12ZnruzejT+QDSA1mMdeSZmpgycU46OOdXo4H2ADzA5fcPSvv0Ey/9RXombwPzZneppU/kB+8cjrvCAkZvU2mzu/KnQXWaVObPpLMxYaXR1LnSOmHzHJKzIil10TQFuqU8uudSmrf0+kBhpFtcRjdRZVr3WeXtA24GmeYHS+2PqjrIyRlyZrMgudhqZGOexp2K1W0wQVcOQ8qnaQ9Jt5lM7OhxvzeL0wgW0/ng==
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(3023799007)(4143699003)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: j06uyozpLWKYQeBIeUZDygBzdaELom6subuoh1o8WyBebm5SCO1hSAg8eK62IExUNrZtXmuFUb9TIIle8ztI55hcjJmetC2kf2yp9DbWTTnouM+749BbbLSUHY6/KLp+6l1gkge3zdQEsmHJYgOMZYEqVMhduJChpxMmFx317tR8zaZIfoiLSIs0Pp0LeZO/t9H8NB74POosrbdhSqtc6V9B8xSut0K80gm5YFP/TTvIYV6TJYWFSm/YYfXSJjaEsOkEnKvyyKVCQhEuT6qAW3YBXpUkt+N1qz4GSmKHQXMZgU8Ay19fhRSaWN7pcgwO2+aFoV2yDxFrZgiKdODs8biw8iWapYYJ2BMS+5ybabCE69JmXwTTKuz0Y5Tksgk0v7KgPPTy6PiEQJ0GN0hLFFxE74kBbuq5vq2vjIynSVgp1U8NzQXxh3zFNakK8+4z
X-Exchange-RoutingPolicyChecked: im82rkzPEAfdiKM0RT9f6pb0LhoSCUuwvpdIf9i3OHqp3uaXH5yrDhY3k7mvs1RkduitBXHEbLdjv0zAyHzilYpscQnFQWawVGVH0oEOvrCZn7y7A4yzTClEjkS5qHDX4QAG9kwxcuy84jUYlzuCObySUeZ0Gh+WqqzjO8wIJ1U+Y8qEwzyzE6TYMWJ/iHpg1oZsTLyhD1/baPQMM2AZY3vjy09D9NMErLWvlF+iBMf/AMMeNxtgR8ZJGlrrNA4AvNUuRtxOLs3+Ll2vc7ALJLF73uExLIJszlwQYI0cRXno5bl+q1n2HCZSyY9MZhhkPOlA76HRbTOUemmGgV9bMQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 09:34:55.9692 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fccb641-c100-41ff-2763-08df2b68bd31
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY7PEPF000000F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB6957
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNyBTYWx0ZWRfXyI06VSOVQOpg
 oJwXbqASZqjh92TUeXQ3RaRGpO6FD02ZHdKJx3eYf35KqCwPKwuECQcJJ4IOX4p9Hy0MkeHPltG
 grxJqvqmrz5Dws/eeEdTiIy/9eiNv4w=
X-Proofpoint-ORIG-GUID: xFdYanokc9D2HEa5CxqQQc7EvC38ebMl
X-Authority-Analysis: v=2.4 cv=BooIUoX5 c=1 sm=1 tr=0 ts=6ad1efc6 cx=c_pps
 a=2g0TT6LSTZPcbpz8VOOaeA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=mij9yayEdXmKMQAzshoA:9 a=ZXulRonScM0A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNyBTYWx0ZWRfX1qr4aFgMRmk+
 cRNxtk8Hr9nTVhdKptW6UilA9upvXJC7RHSCg03YYgosnBkDbfZlCUCGoeDss0AphLhknbq7Dwi
 XicTBlyp7yrtW0dlrFOQw1sbLQVaMI3m5sqVp1nIb6jsO+5mox4VR2O6TfYhPw6qMu8GHnPV95e
 rSG1V3dOhR7H1hITkcrLKWuzcK3dZJ8zf/zyRZUgpwf690nYjHG8a/+cYoRnGUB4ugZBH0BLBSQ
 HBzQQFQeDYUfXPWe9KfKiIKC/jadKsmHkF0+jDMukv/cYI7VOeDunypIyaRzKkl2p5Wzj/VR6c3
 OD7itxZm96VjpkprLXh1m71PEL06l3o9VTeBXrm6hWWVjMgZZxBQWM6qix6L/bhzfELRHRU/2I1
 9u19D4OB6IGg5SFGQh1+v8y7Y61PuokbxsbTGR7dA0BL6i7KLzXoV2q0bd0p5KrjzbrJ8xT7M7q
 vM56+kvNxk5TXkfljdw==
X-Proofpoint-GUID: xFdYanokc9D2HEa5CxqQQc7EvC38ebMl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160037
Subject: Re: [Buildroot] [PATCH][RFC] utils/generate-spdx3: add script to
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

Hi Thomas,

On Tue, 6 Oct 2026 21:17:20 +0200, PERALE Thomas wrote:
> I checked the output in spdx3_viz. Do you know if there a tool I can
> feed the SPDX SBOM into to perform a security scan ? I would like to
> compare the results with the one we have with
> `support/scripts/cve-check`.

For performing security scan we can use the spdx3_viz which has security
scanning feature also displays pretty much all the CVE's in this SBOM. 
Right now there is no utility script for cve-check.
But we can figure out ways to make this work with sbom-cve-check which
is used by yocto.

Best regards,

S.Md.Sadik
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
