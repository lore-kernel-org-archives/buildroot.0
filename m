Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE36EC55838
	for <buildroot@archiver.kernel.org>; Wed,  5 Aug 2026 02:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2401580D06;
	Wed,  5 Aug 2026 02:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ht-L0LDVoJ2; Wed,  5 Aug 2026 02:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0573280C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785896537;
	bh=bHy+AnkD8mMEtDeIF4u+xLJt7GcMrgoRYovq47FIzVs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=BZEyiNEm3xka+Wfqo8vN1foWmINyt0zO2rQUVUvUtAVqoRz6fpP1iugklbFPHohiT
	 vpAG3SNjhkUJZruokogn7oYdKWaZIVWNQvqnJmcE9wrHjUYe28/fc6cCG7BdFSMTcH
	 npkI/2ES3+W3nSDNTTAnpKbenZB0EQ0WT9NL+giffsA/qf4/LERGxu7v7Vo//uTzRJ
	 IDSAAkyNUt1eL8SrgcA/zQlM5mRFCXsXRGWR7JoWfm29zWhY5cyJMVJ9gAsWrOCw0i
	 SULeJChlzVnXBf61vvnJVimqaWFg3vc3mL04TmBkjQf5iVoeYmdPVnFjMyBbb28kIr
	 A/qNllnGXq64A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0573280C7C;
	Wed,  5 Aug 2026 02:22:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0104144
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 02:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8967E60787
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 02:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jjgn0gyEkG6s for <buildroot@buildroot.org>;
 Wed,  5 Aug 2026 02:22:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c40d::4;
 helo=sy5pr01cu010.outbound.protection.outlook.com;
 envelope-from=afshin.pir@gallagher.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 69C1F6077B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69C1F6077B
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (mail-australiaeastazlp170120004.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c40d::4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69C1F6077B
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 02:22:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7w0nl9zlGC72R5WjmMiyUHb08zSopDjdcq9EfgrTflAvjr6Lx7lJYTcAstangcDxyLredcE643Z0uK8S9ZTL6+z7rE+7uvZ5IEaIU2Q9rm869jBTn3HpAhjB3zuFVgKopLkcU5zuTwZ1abEkVtToXQpNI3abLOFv6CA0Qry3xUwQsWv1+xQPFyaY4g2FSionqmS+fRKOu9JKw4rJG0k+rvrsVx7MdB8o7apcWIiZYmPX18lSMS2L0VRqTccNNmWmXVxZ+r9mDNU8Ilm4hM3wE9+SHWNpCly8pVN1bRSUKoAyeMcV8fbLXDbhtJlXhyj6T2NgaYQ/wa7cDkVMnYTwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wi5FJdvEnr3WJRyCch4MivDUJyNCwwCVnBBchMQ4Zo8=;
 b=srZfTwwRDZLg7OnCACpmSdhl/5fLIjNr5K7+DK3o41x32RxDGl3AX1Xk7hWrmfI10bMiC1cqMc3+bYbFheJwQ5IKvDaZWX/qRLJbHy4lmdhNRiCZv1GFtEmCBK5CJKdnrw7uHEINsbJGl78xqFpvwYp1qEfJakE3YZHMyqZ4Beeb6Y+6R1A+VLomXmRZou7CTmI8xDvm8TBsuJSMop/ZM15cGPNUjnYI79O8dejDGSo6HIuUgsrljN10gGMYjYesowNUDD+KNjNT06IE7PwtstTKMIcuPdKn3PY3iiduBxp3ZtiZfDdJcUhKhiIH+lu7BwhBe8Ov+myjTUEH97s/oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 54.252.196.160) smtp.rcpttodomain=buildroot.org
 smtp.mailfrom=gallagher.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=gallagher.com; dkim=none (message not signed); arc=none (0)
Received: from TY4PR01CA0023.jpnprd01.prod.outlook.com (2603:1096:405:2bf::16)
 by SY7PR01MB9105.ausprd01.prod.outlook.com (2603:10c6:10:215::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 02:21:59 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:405:2bf:cafe::89) by TY4PR01CA0023.outlook.office365.com
 (2603:1096:405:2bf::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Wed, 5
 Aug 2026 02:21:59 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 54.252.196.160) smtp.mailfrom=gallagher.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gallagher.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gallagher.com discourages use of 54.252.196.160 as permitted sender)
Received: from smtp.au1.defend.egress.com (54.252.196.160) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 02:21:57 +0000
Received: from SY2PR01CU004.outbound.protection.outlook.com
 (ip-10-241-240-126.ap-southeast-2.compute.internal [10.241.240.126])
 by smtp1.au1.defend.egress.com (Haraka) with ESMTPS id
 6C86B204-9121-4143-8EC8-B6F2D3C1F088.1
 envelope-from <Afshin.Pir@gallagher.com>
 tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256;
 Wed, 05 Aug 2026 02:21:56 +0000
Received: from SG2P153CA0053.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::22) by
 SY4PR01MB6092.ausprd01.prod.outlook.com (2603:10c6:10:f8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.16; Wed, 5 Aug 2026 02:21:49 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096:4:c6:cafe::9e) by SG2P153CA0053.outlook.office365.com
 (2603:1096:4:c6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.4 via Frontend Transport; Wed, 5
 Aug 2026 02:21:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.203.55.1)
 smtp.mailfrom=gallagher.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=gallagher.com;
Received-SPF: Pass (protection.outlook.com: domain of gallagher.com designates
 131.203.55.1 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=131.203.55.1; helo=mail-server.gallagher.com; pr=C
Received: from mail-server.gallagher.com (131.203.55.1) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 02:21:47 +0000
Received: from GNZ-382FKR3.gallagher.local (10.60.2.115) by
 GGLVMAIL.gallagher.local (10.20.0.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 14:21:43 +1200
From: Afshin Pir <afshin.pir@gallagher.com>
To: <buildroot@buildroot.org>
Date: Wed, 5 Aug 2026 14:21:22 +1200
Message-ID: <20260805022122.417221-1-afshin.pir@gallagher.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.60.2.115]
X-ClientProxiedBy: GGLVMAIL.gallagher.local (10.20.0.73) To
 GGLVMAIL.gallagher.local (10.20.0.73)
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CC:EE_|SY4PR01MB6092:EE_|TY2PEPF0000AB88:EE_|SY7PR01MB9105:EE_
X-MS-Office365-Filtering-Correlation-Id: 62cf9110-0b81-498f-c243-08def2985371
X-Egress-Defend-Domain: gallagher.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|7416014|5023799004|56012099006|11063799006|10067099003|6133799003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 3yOt8b0Y+PzZRMKf+xOmun6vacXtYMHN+Jvo9h0h/b505Ot0I1T0VSnvhT/XPUqjPu3+IqYRle5CHiOCgEPPDlxzLjNwjT2UvoqeIKnJsZ0vXBkCEtsRBNKz4bgju5u7MFpnE7Apm0oSbCiHz1Uq0HwHT59Dis/o+8jSjT3r9/q3L7IyFU8gF8HuqUN/bNxhxlalZL4NnLsoRgpBFxCnD+wjybQoQ7TFO1QoS95rEuyXgXf6RY9BsPsnJe+Di0Sj40ID6XYrDPVvW74EPFqzM0AE6MF2fE0s0EbPvcKr4FHNCMSs31qq3ZnFb7Zb4BI1sjwU7GpCJArbWBUUl4SPyLUggPCafRqWBh4Xdh4gxwrDrA3sccotYN9a7EF8c22WYHbWNQYg1X/LthlF7PbPXhJQqtfbPawLRG0YYYvyT1xjBGmr564LrmEKsWWlFHz03Y9qj12/5sHCZ5GJYRgtxc1XPEqmnG4nXuD1Zdbf/vX/thrw4InbAaFsRTR+0uT5/RQ5oht2e41lsH7oGVyMAGhZdmdHj44dGOOzJLJjB/CCnwBgtFNpzBG10zcv9xUC0x1AtaHYiQDK/+tCTWGGh4K4jCtfp1LwfT/NHCmfu5S3jdvZvCylHBuUrwAVK7H3bK+SPs2YjdaDn6ZbJvXupoeTTChlmS0jQytdz65cZU2NviFU8NnaDCrq/oxb4rSnQxa+Py3z3/Adc2QlEjS6zg==
X-Forefront-Antispam-Report-Untrusted: CIP:131.203.55.1; CTRY:NZ; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:mail-server.gallagher.com;
 PTR:default-rdns.vocus.co.nz; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(7416014)(5023799004)(56012099006)(11063799006)(10067099003)(6133799003)(3023799007)(18002099003);
 DIR:OUT; SFP:1102; 
X-Exchange-RoutingPolicyChecked: OEfrNMFBXUB3JwVpjVf5vg5tG0BzrjtzdX6TtXJLkumYI67dF0XN99EoFq3dF8/olKOuHmvsLrWT93rKBEpR5jMUL52TKMpVg7TlpogD9hjr1MR/7Ydb4kIBooNB3RJzNwIkQWL+CDPP1VKB0Fi+SmjHfursosBPoUU8FIoI//pqykHwrI4+csPVlKk6/AsOaZgTb7sD8chlFj7roPxDb/JODB7VjSBdxnUJoypezcorUCmDy7iwXivhvdGfHl0RZAI2Yohu7jFzEORBvalt3d1dykIOkcYN2y0bOKfh13FUNYQ/Im/mgFtKofa0QyzTdcEQsQeDEMxRJ3Ouul9JfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY4PR01MB6092
X-Ajax-SCL: 1
X-Egress-Defend-SCL: 1
X-Processed-By-Ajax: true
X-Processed-By-Egress-Defend: true
X-Sentry-Times-Processed-Count: 1
X-MS-Exchange-Transport-CrossTenantHeadersStripped: TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: de3ae026-2de1-4d4a-545a-08def2984d66
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|23010399003|14060799003|82310400026|35042699022|376014|7416014|5023799004|11063799006|56012099006|10067099003|6133799003|18002099003|8096899003|3023799007;
X-Microsoft-Antispam-Message-Info: YCkW9a4id82qwHu6CsJzGlqI3X66Sh1i4zO/fM2ZFLB/4q7yEkj6wPm8HLYBzugMZPPFQa8ihRTk44lLqBY+fedbB8nL0Tt/S+kW25mSXjb58HMRYUlf/ElxkpS7iwG4A58NU7d0J2JAUubu+h3l7YqL9WKadwWWLjFILvqoCWYEjFIEs3W17k0kEJZ7CEzQv/9o9ARlZFQ0hVuzeNQSmJ0gVeLceO66N/E6EiSZkPSokYjGEEmVoIEQ5d8zyHF7U6UjmJsXYdAL/1TEXARGIhR52ymHPdtlMu19qfaCQ+8tSYEC0o9OVYmNLTSUrd+zbj1fABnkebfahXYL2GmtjGXzC9k1SqTeypIpwAY9XM6rn3usK5IEXBM3ZQ2npKNmN/K21P6JZrIB2/1DwlAo/nIoP3hhefyIuYda9Alh90YdWQWbK2c9wrucCL21k0o7fxfVjvlRnk9kRO3yTNWHzK4SvffY0u3TLGOTTJ7ZMxWy2Tt51UYExzI/SV3yuxtDYo+lla6732bB5FYWav4w4ua5NmLPD4AffoHePuMGNVoI0RTNBOm3r7xo9OyKl59TgRYmsDSjEOg7jhChdN3lgpssIEJ32WF+zBglTMretEXZhToGEWM7y7ZFFwSx2vkGPAw/hhPrX9NZcdpof9QiVVGpSQamM4/dWH6gc0pJosDw43+Zw84hMu8WYkHxfB+Ln3flZ7D/bjFmXNxzRmv12g==
X-Forefront-Antispam-Report: CIP:54.252.196.160; CTRY:AU; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:smtp.au1.defend.egress.com;
 PTR:smtp.au1.defend.egress.com; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(23010399003)(14060799003)(82310400026)(35042699022)(376014)(7416014)(5023799004)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(8096899003)(3023799007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8l+tAweqRz0m+ggR1Bn0RxxqWD4/QekmZXfzbl7Eewg8gNWTKaEMhlcySa4T7l0P9xrMKFA2ZhWSwa0OhY4PzEmsIhwd9pODJj5+WLt/ZNgRNkAZJzWAMbTMgeC4hGACZbPgX8QL8kPGvKKkWUw6Qtyd3LgmkZjQTlMYS6smitjtY3/v7C8otL3haNnjTyDOG2NwUsAQ4B46DeiXBddG646+eGZVsemawUwcOUqIBwThkwA4zvc+w/54XChmsopyIOVWtp8UrY9PLLi+FkcSBYR+Vu6180Y0IWwiVA+Xp08SXuIGqPG4mcq6KEhF3+t/5Ehiao2I4d04op4zuGN3JEdqKyQ+tyuYab20+zYlt43EfhoiznEzXV2FMjZnY+0PKhgO2616yEw6zGewAURuTbVQ0p/QcE1EFb/bXKz1qyCNYD2mJ29jM9dP+z1RNftX
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 02:21:57.8636 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62cf9110-0b81-498f-c243-08def2985371
X-MS-Exchange-CrossTenant-Id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=2156b869-431f-4815-b2ce-b4893b5c9aaa; Ip=[54.252.196.160];
 Helo=[smtp.au1.defend.egress.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7PR01MB9105
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gallagher.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wi5FJdvEnr3WJRyCch4MivDUJyNCwwCVnBBchMQ4Zo8=;
 b=KvfwVe84IMTSUzoc5pmkcxw4gfkfLMLzq7aEEDH8EbpfuNai3s7OvqYstS9RlABQEnJTscGjGichsdB6hKmvyWV7BWLu6VPmnfPDAC1Rd3oDx1H9InPxS1R3CrF+oasSC7vqUdlWMS1Mq30txrPRKHigThwegA00JXzBOcze87hLas5e/7+PkDhfeAbfA8fbSdNHcqCDdA9DUMB6Tn/ACXdurcQOLsXX1hkrsyVaxlQIHGikkKT5WH1uQ/VmWSh6lhe6aXwcKui4YFIt498YZxZqL2r6oPy7mdOBbQEgo9LDBLzdsFOeFK9ykBuv2DfQeeogzeumTVaxs+gQS3pPeg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gallagher.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gallagher.com header.i=@gallagher.com
 header.a=rsa-sha256 header.s=selector2 header.b=KvfwVe84
Subject: [Buildroot] [PATCH 1/1] support/download: update rust package
 dependency resolving
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 David Pierret <david.pierret@smile.fr>, Danilo
 Bargen <mail@dbrgn.ch>, Graeme
 Smecher <gsmecher@threespeedlogic.com>, Torben Voltmer <mail@t-voltmer.net>,
 James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>,
 Alexander Shirokov <shirokovalexs@gmail.com>, Sam
 Voss <sam.voss@gmail.com>, Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>, Leo
 Yu-Chi Liang <ycliang@andestech.com>, Christopher Obbard <obbardc@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Afshin Pir <afshin.pir@gallagher.com>
Content-Type: multipart/mixed; boundary="===============8325946543592222857=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8325946543592222857==
Content-Type: multipart/alternative; boundary="=-n6reoiHJ9LGMeH9ESQIDOQ=="

--=-n6reoiHJ9LGMeH9ESQIDOQ==
Content-Type: text/plain; charset=utf-8

Buildroot currently uses vendoring method to resolve Rust package
dependencies. In this method, all package dependencies are vendored
alongside packge sources inside VENDOR folder and as a result, a new
package file with source code of packge and all of its dependencies is
stored inside download folder which is used to build package later.
But this method is very fragile. Whenever cargo is updated, these
packages will be come incompatible and we need to update cargo package
version. For example, in past 6 month, cargo package version has gone up
to cargo6 from cargo3. In this scenario, all buildroot Rust packages
need to be updated with new hashes. Currently, there are only 35 Rust
packages inside buildroot and this process is already pain. When number
of these Rust packages increases, maintaining these packages will be
problemistic.
This patch tries to resolve this issue by changing how Rust package
dependencies are maintained in this buildroot. Rather than vendoring
each package dependency and creating new package, we just fetch package
dependencies into `BR_CARGO_HOME` folder. So rust package source and as
a result, its hash, will stay consistent on Rust/Cargo updates. When we
build Rust packages, dependencies will be resolved in the
`BR_CARGO_HOME` holder and no internet for building will be required.
Here is the summeried benefits of this new build mechanism:
1. Updating Rust/Cargo will not affect any Rust packages
2. We don't need to calculate each Rust package hash manually locally
3. Since we don't repack Rust packages, collecting sources will be
   quicker
4. The overall size of sources may decrease
5. Maintaing and backporting Rust packages will be simpler.
There is one drawback as well. The drawback is the fact that the
contents of `BR_CARGO_HOME` folder will be needed for building Rust
packages.
The main changes are in the `support/download/cargo-post-process` file,
but since this approach drops vendoring of sources, Rust package hashes
need to be updated for one last time. Also dropped `-cargo6` dowload
suffix because these new packages are the original source without any
changes.

Signed-off-by: Afshin Pir <afshin.pir@gallagher.com>
---
 docs/manual/adding-packages-cargo.adoc        | 10 +-------
 package/aardvark-dns/aardvark-dns.hash        |  2 +-
 package/aichat/aichat.hash                    |  2 +-
 package/bat/bat.hash                          |  2 +-
 package/broot/broot.hash                      |  2 +-
 package/dtui/dtui.hash                        |  2 +-
 package/dust/dust.hash                        |  2 +-
 package/espflash/espflash.hash                |  2 +-
 package/eza/eza.hash                          |  2 +-
 package/fd/fd.hash                            |  2 +-
 package/hyperfine/hyperfine.hash              |  2 +-
 package/kibi/kibi.hash                        |  2 +-
 package/kmon/kmon.hash                        |  2 +-
 package/libzenoh-c/libzenoh-c.hash            |  2 +-
 package/netavark/netavark.hash                |  2 +-
 package/nushell/nushell.hash                  |  2 +-
 package/parsec-tool/parsec-tool.hash          |  2 +-
 package/parsec/parsec.hash                    |  2 +-
 package/pkg-download.mk                       |  1 -
 package/procs/procs.hash                      |  2 +-
 package/python-bcrypt/python-bcrypt.hash      |  3 +--
 .../python-cryptography.hash                  |  3 +--
 package/python-logbook/python-logbook.hash    |  3 +--
 package/python-maturin/python-maturin.hash    |  3 +--
 package/python-orjson/python-orjson.hash      |  3 +--
 .../python-pydantic-core.hash                 |  3 +--
 package/python-rpds-py/python-rpds-py.hash    |  3 +--
 package/python-rtoml/python-rtoml.hash        |  3 +--
 package/python-selenium/python-selenium.hash  |  3 +--
 package/ripgrep/ripgrep.hash                  |  2 +-
 package/rust-bindgen/rust-bindgen.hash        |  2 +-
 package/sentry-cli/sentry-cli.hash            |  2 +-
 package/tbtools/tbtools.hash                  |  2 +-
 package/tealdeer/tealdeer.hash                |  2 +-
 package/uefisettings/uefisettings.hash        |  2 +-
 package/zellij/zellij.hash                    |  2 +-
 package/zoxide/zoxide.hash                    |  2 +-
 support/download/cargo-post-process           | 24 +++++--------------
 38 files changed, 42 insertions(+), 72 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.adoc b/docs/manual/adding-packages-cargo.adoc
index 4df758537b..1cb70b7518 100644
--- a/docs/manual/adding-packages-cargo.adoc
+++ b/docs/manual/adding-packages-cargo.adoc
@@ -90,12 +90,4 @@ typical packages will therefore only use a few of them.
 A crate can depend on other libraries from crates.io or git
 repositories, listed in its +Cargo.toml+ file. Buildroot automatically
 takes care of downloading such dependencies as part of the download
-step of packages that use the +cargo-package+ infrastructure. Such
-dependencies are then kept together with the package source code in
-the tarball cached in Buildroot's +DL_DIR+, and therefore the hash of
-the package's tarball doesn't only cover the source of the package
-itself, but also covers the sources of the dependencies. Thus, a change
-injected into one of the dependencies will also be discovered by the
-hash check. In addition,  this mechanism allows the build to be
-performed completely offline since cargo will not do any downloads
-during the build. This mechanism is called vendoring the dependencies.
+step of packages that use the +cargo-package+ infrastructure.
diff --git a/package/aardvark-dns/aardvark-dns.hash b/package/aardvark-dns/aardvark-dns.hash
index c01a46c02c..e6b21e226f 100644
--- a/package/aardvark-dns/aardvark-dns.hash
+++ b/package/aardvark-dns/aardvark-dns.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4b22fb6586f84805b9170d5514b2070f3a090a88c0669a831c7e2a86dd150f17  aardvark-dns-v1.17.1-git4-cargo6.tar.gz
+sha256  6c4de24e5b1551b53e03b34326339931332cb0407e6cec3242be6e591b4d8190  aardvark-dns-v1.17.1-git4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/aichat/aichat.hash b/package/aichat/aichat.hash
index f5e8486137..26090b0746 100644
--- a/package/aichat/aichat.hash
+++ b/package/aichat/aichat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  7a6e5071ea05543d0022fa98d1a96625bfb6c1b094768d9cf0123057376129d1  aichat-0.30.0-cargo6.tar.gz
+sha256  e194cc89afc213a6e3169738221cae641c347421c4f2aacd5d6f4f7cc6edb387  aichat-0.30.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  5af431a6a9869052e2be4e71ccd731c7efe45dca47eaca84d4d1fb38f134cb79  LICENSE-MIT
diff --git a/package/bat/bat.hash b/package/bat/bat.hash
index b6a6d43a76..e545a63e8d 100644
--- a/package/bat/bat.hash
+++ b/package/bat/bat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  e090445aa321355571302ca78fc6c7d9a5ddbfa5fa876be06df8721302f92501  bat-0.26.1-cargo6.tar.gz
+sha256  4474de87e084953eefc1120cf905a79f72bbbf85091e30cf37c9214eafcaa9c9  bat-0.26.1.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  dccda9eb9533f5c65624a1106536c6cfde46008d58e60b3faf154e8b9fd5b46e  LICENSE-MIT
diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index 176c663d62..3a7b0f04e2 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  cad8fb5e23b422aef80ea14797de7c709c97a5d2bb8019cddaea87811b17a652  broot-1.58.0-cargo6.tar.gz
+sha256  2e61f7cddafa39417ff1484d24773190c6a472975a400204d901080a6335a652  broot-1.58.0.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/dtui/dtui.hash b/package/dtui/dtui.hash
index e45f979934..8618a3b025 100644
--- a/package/dtui/dtui.hash
+++ b/package/dtui/dtui.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  57bcf3a8b6681be2695762da17c20d2efb7c121131138868ba7a4485fa08c335  dtui-3.0.0-cargo6.tar.gz
+sha256  8d80be5cb3df543927a9f1ac7861b0a1ac23df249a38e0151c0cfec975583306  dtui-3.0.0.tar.gz
 sha256  b7b3cd0d92fc6638f0a7bd2306d715c747d040c6d851ed821a45c5538663e57a  LICENSE
diff --git a/package/dust/dust.hash b/package/dust/dust.hash
index af963611f5..832826ff32 100644
--- a/package/dust/dust.hash
+++ b/package/dust/dust.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b0b3a217f6b90882777944ad4e7bd1f38daaf37ec2b66549503b201aba89d4b1  dust-1.2.3-cargo6.tar.gz
+sha256  424b26adfbafeac31da269ecb3f189eca09803e60fad90b3ff692cf52e0aeeee  dust-1.2.3.tar.gz
 sha256  aee6e2d13d3a55c7881630c09b41ca7b3b44bb1437b5d36695d22decc3655160  LICENSE
diff --git a/package/espflash/espflash.hash b/package/espflash/espflash.hash
index bcd24a0167..ff30f45fca 100644
--- a/package/espflash/espflash.hash
+++ b/package/espflash/espflash.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  10f2ed2db01359cbc7316cb694731a6a307a639d5698e14506b6b52483d36163  espflash-4.0.1-cargo6.tar.gz
+sha256  f4eb66af5ca11a396b238878d339ca38d9ddcb7c619b47ed5fc91b7f7b4e54ac  espflash-4.0.1.tar.gz
 sha256  811f4d4d7ae8f88090dcd14cddf1982ca75cc30b5604e6ebb636693d9b885788  LICENSE-APACHE
 sha256  8daec6f7e829af4dfc7c99a251986648f718b90589aa819bc48be8ef82b0c12f  LICENSE-MIT
diff --git a/package/eza/eza.hash b/package/eza/eza.hash
index d303e129a0..7aabbe4e9a 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5df44637acd270bbd7dce76ab989db946ea79d969bfdd382400da39dc2b3e98d  eza-0.23.3-cargo6.tar.gz
+sha256  ebd13c47763cb0cd9337a1d6e89e1a3be4e76e0dd9225ac8058d6d338c617a29  eza-0.23.3.tar.gz
 sha256  57fb42fbcd0b037ce528ed8f72f1ec095d67bc6825ecf1448ff39be1fe68a4b4  LICENSE.txt
diff --git a/package/fd/fd.hash b/package/fd/fd.hash
index 0134cf5d21..d07d446f09 100644
--- a/package/fd/fd.hash
+++ b/package/fd/fd.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  58af97d85e7ddb1601c172f15565521e7fb5ca2ed559774e4ce1443068d3e1c7  fd-10.3.0-cargo6.tar.gz
+sha256  2edbc917a533053855d5b635dff368d65756ce6f82ddefd57b6c202622d791e9  fd-10.3.0.tar.gz
 sha256  73c83c60d817e7df1943cb3f0af81e4939a8352c9a96c2fd00451b1116fa635c  LICENSE-APACHE
 sha256  322cfc7aa0c774d0eca3b2610f1d414de3ddbd7d8dd4b9dea941a13a6eb07455  LICENSE-MIT
diff --git a/package/hyperfine/hyperfine.hash b/package/hyperfine/hyperfine.hash
index 0bd5a1b873..e9e25b10e1 100644
--- a/package/hyperfine/hyperfine.hash
+++ b/package/hyperfine/hyperfine.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  10ef59c1ae8c368f3663cecff219f872ada90dd6bdd52d07e544bf9bdf777093  hyperfine-1.20.0-cargo6.tar.gz
+sha256  f90c3b096af568438be7da52336784635a962c9822f10f98e5ad11ae8c7f5c64  hyperfine-1.20.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  1dfee18c2ff07ce551de4d6a1d2db158c0380746b488a7f0d08c8e0d3568b7c3  LICENSE-MIT
diff --git a/package/kibi/kibi.hash b/package/kibi/kibi.hash
index d56571e4d5..f6eea77942 100644
--- a/package/kibi/kibi.hash
+++ b/package/kibi/kibi.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  b1edddd4daf0a38d79673bb42f386f91a68fe7b2212defde5e531cbc93dc1bac  kibi-0.3.3-cargo6.tar.gz
+sha256  a7a7b6f6937f39ae86fd4f556034a3744bb99091c102bc6f38b281ee751d10e9  kibi-0.3.3.tar.gz
 sha256  53cdcb17642e801f813712b4844293b037c23d4b482004b77c15ae2f36f551c3  LICENSE-MIT
 sha256  8c6db340475136df3c1201d458fa5755698eace76e510471ecc9d857d6083dac  LICENSE-APACHE
diff --git a/package/kmon/kmon.hash b/package/kmon/kmon.hash
index cfd7824f75..a9eb23976e 100644
--- a/package/kmon/kmon.hash
+++ b/package/kmon/kmon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e44c6d6b69dd606b1097183886f6d29680346738a1778d500becde6b94c313dc  kmon-1.7.1-cargo6.tar.gz
+sha256  fd8e02c17089e88c2b019e116e0b7fdd9fe4285327bd795de90622aba4b79469  kmon-1.7.1.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
index d623a27d83..bde4c006ff 100644
--- a/package/libzenoh-c/libzenoh-c.hash
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a741fbe80cb5f159b830100e145f2fbf02a8084f8cdd0658640dd282cd39635e  libzenoh-c-1.2.1-cargo6.tar.gz
+sha256  108d17bcf7670754712f75665abf5d550003b7c80fc3a5df75f41fd62cf8658c  libzenoh-c-1.2.1.tar.gz
 sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/netavark/netavark.hash b/package/netavark/netavark.hash
index f86728e834..760dfa5190 100644
--- a/package/netavark/netavark.hash
+++ b/package/netavark/netavark.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  599fb6d2bb920025ebfef83856afa5bb9be5929806516e7b233ff36107a99b00  netavark-v1.17.1-git4-cargo6.tar.gz
+sha256  defd28c70cb981cea8afe2a0257acc408196de96e00afd293b9de8fd861fbca1  netavark-v1.17.1-git4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/nushell/nushell.hash b/package/nushell/nushell.hash
index 9f93792917..4d2107b76c 100644
--- a/package/nushell/nushell.hash
+++ b/package/nushell/nushell.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  7a0cfb4bee97a34c7d1883eaa72b07b25f24d4ccd96795704d235a9c6854c695  nushell-0.108.0-cargo6.tar.gz
+sha256  5995c211411ad1d5dd7da904b9db238a543958675b9e45f5e84fbdf217499eee  nushell-0.108.0.tar.gz
 sha256  ff5dcaaba6140ec57cafdd4f707cd0d329e727477cf7d5b9ba7a244ec2678b79  LICENSE
diff --git a/package/parsec-tool/parsec-tool.hash b/package/parsec-tool/parsec-tool.hash
index fd98c9ecf2..6e5079e923 100644
--- a/package/parsec-tool/parsec-tool.hash
+++ b/package/parsec-tool/parsec-tool.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f63b9b677410ef25fc466830c437961b579086b5f9928c6000e0c3a97f5ba775  parsec-tool-0.7.0-cargo6.tar.gz
+sha256  b9d455cdfa21100bb2f824d8fa8784d8c9cf5bf6d8229f7603e7634ee33c0191  parsec-tool-0.7.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/parsec/parsec.hash b/package/parsec/parsec.hash
index e2a7b99fdf..1a2618862a 100644
--- a/package/parsec/parsec.hash
+++ b/package/parsec/parsec.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5ec0ea98d2270b17c3615931f6adb20bcd975614cd92ced9eb3513c55bc1f6e5  parsec-1.4.1-cargo6.tar.gz
+sha256  35460233b0cc7d7289faecd0bdf6eb0be7c47aa9435d1039d553a57efd5d3621  parsec-1.4.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index b38f0c7053..222f5a63a6 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -12,7 +12,6 @@
 BR_FMT_VERSION_git = -git4
 BR_FMT_VERSION_svn = -svn5
 BR_FMT_VERSION_go = -go2
-BR_FMT_VERSION_cargo = -cargo6

 DL_WRAPPER = support/download/dl-wrapper

diff --git a/package/procs/procs.hash b/package/procs/procs.hash
index b44825409d..6f847c0dcf 100644
--- a/package/procs/procs.hash
+++ b/package/procs/procs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b90a367469c48eea133a3f44fa8969fd95c17d2542f703416a5b6378240acb53  procs-0.14.10-cargo6.tar.gz
+sha256  7b287ac253fd1d202b0ea6a9a8ba2ed97598cf8e7dfd539bd40e382c6dc6d350  procs-0.14.10.tar.gz
 sha256  feb87a2e0c305de3464cc44077da5393c52d8ca6362d37427157d04ec6f4510d  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index 5e3ffb8a7f..48ab539719 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,4 +1,3 @@
-# Locally calculated after vendoring
-sha256  b8a767a0f37ecdacff1df6772aec8bd6d458a77a1a5b9ad6657c6c5d9657a9b0  python-bcrypt-5.0.0-cargo6.tar.gz
+sha256  f748f7c2d6fd375cc93d3fba7ef4a9e3a092421b8dbf34d8d4dc06be9492dfdd  python-bcrypt-5.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 02d199ac3b..bf8ca601bd 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,4 @@
-# Locally calculated after vendoring
-sha256  f4d6d4b4671ebaf2c86f2fa5ec4beac9056f30129fea17338c35c87eb25daf1b  python-cryptography-48.0.0-cargo6.tar.gz
+sha256  5c3932f4436d1cccb036cb0eaef46e6e2db91035166f1ad6505c3c9d5a635920  python-cryptography-48.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-logbook/python-logbook.hash b/package/python-logbook/python-logbook.hash
index ee812562ea..15bb3c9642 100644
--- a/package/python-logbook/python-logbook.hash
+++ b/package/python-logbook/python-logbook.hash
@@ -1,4 +1,3 @@
-# Locally calculated after vendoring
-sha256  07d53ef8b7cb1f267862f72df81857c9d6665104535cc5309774de7966164c46  python-logbook-1.9.2-cargo6.tar.gz
+sha256  0538cabfd8e8a02b8185fb7a2be20b3965d225fbd7f4a5726b007d8e26b39ee0  python-logbook-1.9.2.tar.gz
 # Locally computed sha256 checksums
 sha256  2ca266337cc6947578654ab0dd6438de4d01fa78b2e6eb554b09757df1178f98  LICENSE
diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 117a2b9463..f6487ef0f6 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,4 @@
-# Locally calculated after vendoring
-sha256  703e4542966258bc728916f99fc78e38b670a538339cbf7f0e1b3bc9f9ab166f  python-maturin-1.11.2-cargo6.tar.gz
+sha256  24d2502ee8e6e6a33b3993bc78251da8d982e4da16d6c0ad9b4256135ff8694b  python-maturin-1.11.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index f4443fcc9b..880bc8fb09 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,4 @@
-# Locally calculated after vendoring
-sha256  cd415890f20e7f29055b5057d3ff5af7c673ffc3d7e659ec68e9377f13604065  python-orjson-3.11.5-cargo6.tar.gz
+sha256  82393ab47b4fe44ffd0a7659fa9cfaacc717eb617c93cde83795f14af5c2e9d5  python-orjson-3.11.5.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 92e97f6755..1a6d50e4c8 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,3 @@
-# Locally calculated after vendoring
-sha256  a79f876fbf65e2568c30c9b8a5be0a2817bd314c2aa483b4aaeb80ba8443cc4d  python-pydantic-core-2.46.3-cargo6.tar.gz
+sha256  41c178f65b8c29807239d47e6050262eb6bf84eb695e41101e62e38df4a5bc2c  python-pydantic-core-2.46.3.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index 32593a1f7c..307939dac8 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,3 @@
-# Locally calculated after vendoring
-sha256  9a3d3078a2fc34efd16e22b73c61f6a25ae61e26d5b3dc84d656cc0b716de4b1  python-rpds-py-0.30.0-cargo6.tar.gz
+sha256  dd8ff7cf90014af0c0f787eea34794ebf6415242ee1d6fa91eaba725cc441e84  python-rpds-py-0.30.0.tar.gz
 # Locally computed sha256 checksums
 sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rtoml/python-rtoml.hash b/package/python-rtoml/python-rtoml.hash
index 9f40e2abdf..1486f69612 100644
--- a/package/python-rtoml/python-rtoml.hash
+++ b/package/python-rtoml/python-rtoml.hash
@@ -1,4 +1,3 @@
-# Locally calculated after vendoring
-sha256  9c9cd121f893bf7e8360519df29088e97d5455cc437d9400d10757ac84846d17  python-rtoml-0.10.0-cargo6.tar.gz
+sha256  e1c9af50c6e8c53bc07fdf3277ab1b90e83648c689ea73dadae7d78d1e18d752  python-rtoml-0.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cd5ffde80e6d3286a2e2e5f02fb2cb07b823931ca368e7c735a6c5f5aebe7103  LICENSE
diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index f2048092e3..2c78b016bd 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,4 +1,3 @@
-# Locally calculated after vendoring
-sha256  fc578e57f98032ab4d89193bfdfed5dac965362d08aa436b8b713e182ea43f4c  python-selenium-4.39.0-cargo6.tar.gz
+sha256  12f3325f02d43b6c24030fc9602b34a3c6865abbb1db9406641d13d108aa1889  python-selenium-4.39.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1ee8454a0696ac46b0d5b67f85b2a0e3af2b7726e1b82cd182af60fd285bcba3  LICENSE
diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index 287d350d6b..600b613cf4 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c3427fa1f0909263da4a43d73a9cf1a4fa3f37d09c938cc40cd923239f57770d  ripgrep-14.1.1-cargo6.tar.gz
+sha256  4dad02a2f9c8c3c8d89434e47337aa654cb0e2aa50e806589132f186bf5c2b66  ripgrep-14.1.1.tar.gz
 sha256  0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
index fecafcd4fd..9045106e3d 100644
--- a/package/rust-bindgen/rust-bindgen.hash
+++ b/package/rust-bindgen/rust-bindgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8e5a0999c2f4f6ab1cdee508e913e2ffef5225fb313816a0151742cd2103576c  rust-bindgen-0.72.1-cargo6.tar.gz
+sha256  4ffb17061b2d71f19c5062d2e17e64107248f484f9775c0b7d30a16a8238dfd1  rust-bindgen-0.72.1.tar.gz
 sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
diff --git a/package/sentry-cli/sentry-cli.hash b/package/sentry-cli/sentry-cli.hash
index 0b1ef402e1..9deddede16 100644
--- a/package/sentry-cli/sentry-cli.hash
+++ b/package/sentry-cli/sentry-cli.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  19d62065788c0b72d54875e834462f444204fcae99fe76f69a836cc17a7a0935  sentry-cli-2.20.3-cargo6.tar.gz
+sha256  9cc7669087c32ca2770634b0005ef09b82633f794524e7d6ab1187280a826023  sentry-cli-2.20.3.tar.gz
 sha256  9503def7b54ceb6e3cd182fd59bc05d3a30d7eae481e65aaba4b495133c83c14  LICENSE
diff --git a/package/tbtools/tbtools.hash b/package/tbtools/tbtools.hash
index 832f5f13b4..11a341697d 100644
--- a/package/tbtools/tbtools.hash
+++ b/package/tbtools/tbtools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a83b6413b20508632a2278b1e9311b2483a2ef2994bdd82e5089794a1270dfa8  tbtools-0.8.0-cargo6.tar.gz
+sha256  262d0b383a150b44ffb7509f216cb797124da06a5cfdb0b3c38ca58943ba2cf4  tbtools-0.8.0.tar.gz
 sha256  9b16a3add311d607af8d9b348a842a37840d0f47dfcc6cf2a7756ee02c24ed69  LICENSE
diff --git a/package/tealdeer/tealdeer.hash b/package/tealdeer/tealdeer.hash
index b54129dd1e..e36403cb46 100644
--- a/package/tealdeer/tealdeer.hash
+++ b/package/tealdeer/tealdeer.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  28b8fc80f1409476f8a093249b083995b2099a5283580815cad94c3b1cc46453  tealdeer-1.6.1-cargo6.tar.gz
+sha256  d42db25a56a72faec173c86192656c5381281dc197171f385fccffd518930430  tealdeer-1.6.1.tar.gz
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  a313b5e62b80a08f3aae0fa62ff3de8482ef55247299eb352ab44f87ef456b1b  LICENSE-MIT
diff --git a/package/uefisettings/uefisettings.hash b/package/uefisettings/uefisettings.hash
index 4e620ac8b8..90d65bd6d2 100644
--- a/package/uefisettings/uefisettings.hash
+++ b/package/uefisettings/uefisettings.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8be49ed7fe97a153e3f1470db54cb563090cdd431bef59a115266f1f724c1f14  uefisettings-149bc92970949d44be641ae1e3e942220d7390e7-cargo6.tar.gz
+sha256  c9a0166d001fe1bd7ae7241cf1b7023400b0d06bc2f84759f0d10b8016fb2577  uefisettings-149bc92970949d44be641ae1e3e942220d7390e7.tar.gz
 sha256  acc0b83e151985bb943d35ac37e7522fef28d707af9a4829678e92baa409aaf1  LICENSE
diff --git a/package/zellij/zellij.hash b/package/zellij/zellij.hash
index ac6a219270..7580ce17fe 100644
--- a/package/zellij/zellij.hash
+++ b/package/zellij/zellij.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  2a565f28d89c9e8caf2bad7a0f07f03747e3d3ee2d988297a41d1ffcfb034237  zellij-0.44.3-cargo6.tar.gz
+sha256  33ae61fc802b59462fed49b424893596d3aa819646bdce53d5602f714c1264fe  zellij-0.44.3.tar.gz
 sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zoxide/zoxide.hash b/package/zoxide/zoxide.hash
index 196d682e2d..3a317d197f 100644
--- a/package/zoxide/zoxide.hash
+++ b/package/zoxide/zoxide.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bf836b249e22a736e8b1b53d7f6d4f9d4616d4ab2c388839453e176bc6365bec  zoxide-0.9.8-cargo6.tar.gz
+sha256  1b276edbf328aafc86afe1ebce41f45ccba3a3125412e89c8c5d8e825b0c7407  zoxide-0.9.8.tar.gz
 sha256  23aa3b08366e4ed6050f3d9950070201802aadbe5675fa1c19f24f4de91cf294  LICENSE
diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index b0e59ad74d..29b990d808 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -21,31 +21,19 @@ while getopts "n:o:m:" OPT; do
     esac
 done

-# Already vendored tarball, nothing to do
-if tar tf "${output}" | grep -q "^[^/]*/VENDOR" ; then
-    exit 0
-fi
-
+# Extract package to access Cargo.toml / Cargo.lock
 post_process_unpack "${base_name}" "${output}"

-# Do the Cargo vendoring
 pushd "${base_name}" > /dev/null

-# Create the local .cargo/config.toml with vendor info
-mkdir -p .cargo/
+# Fetch package dependencies
 mkdir -p "${CARGO_HOME}"
 flock "${CARGO_HOME}"/.br-lock \
-cargo vendor \
+cargo fetch \
     --manifest-path "${manifest}" \
-    --locked VENDOR \
-    > .cargo/config.toml
-
-# "cargo vendor' outputs on stderr a message directing to add some data
-# to the project's .cargo/config.toml, data that it outputs on stdout.
-# Since we redirect stdout to .cargo/config.toml, the message on stderr
-# gets confusing, so instruct the user that it's been handled.
-printf '(note: .cargo/config.toml automatically updated by Buildroot)\n\n'
+    --locked

 popd > /dev/null

-post_process_repack "$(pwd)" "${base_name}" "${output}"
+# Remove unpacked package folder
+rm -rf "${base_name}"
--
2.43.0

________________________________
 This email is confidential and may contain information subject to legal privilege. If you are not the intended recipient please advise us of our error by return e-mail then delete this email and any attached files. You may not copy, disclose or use the contents in any way. The views expressed in this email may not be those of Gallagher Group Ltd or subsidiary companies thereof.
________________________________

--=-n6reoiHJ9LGMeH9ESQIDOQ==
Content-Type: text/html; charset=utf-8

<html><head></head><body><pre style="font-family: Calibri, Arial, sans-serif; font-size: 11pt;">Buildroot currently uses vendoring method to resolve Rust package
dependencies. In this method, all package dependencies are vendored
alongside packge sources inside VENDOR folder and as a result, a new
package file with source code of packge and all of its dependencies is
stored inside download folder which is used to build package later.
But this method is very fragile. Whenever cargo is updated, these
packages will be come incompatible and we need to update cargo package
version. For example, in past 6 month, cargo package version has gone up
to cargo6 from cargo3. In this scenario, all buildroot Rust packages
need to be updated with new hashes. Currently, there are only 35 Rust
packages inside buildroot and this process is already pain. When number
of these Rust packages increases, maintaining these packages will be
problemistic.
This patch tries to resolve this issue by changing how Rust package
dependencies are maintained in this buildroot. Rather than vendoring
each package dependency and creating new package, we just fetch package
dependencies into `BR_CARGO_HOME` folder. So rust package source and as
a result, its hash, will stay consistent on Rust/Cargo updates. When we
build Rust packages, dependencies will be resolved in the
`BR_CARGO_HOME` holder and no internet for building will be required.
Here is the summeried benefits of this new build mechanism:
1. Updating Rust/Cargo will not affect any Rust packages
2. We don't need to calculate each Rust package hash manually locally
3. Since we don't repack Rust packages, collecting sources will be
   quicker
4. The overall size of sources may decrease
5. Maintaing and backporting Rust packages will be simpler.
There is one drawback as well. The drawback is the fact that the
contents of `BR_CARGO_HOME` folder will be needed for building Rust
packages.
The main changes are in the `support/download/cargo-post-process` file,
but since this approach drops vendoring of sources, Rust package hashes
need to be updated for one last time. Also dropped `-cargo6` dowload
suffix because these new packages are the original source without any
changes.

Signed-off-by: Afshin Pir &lt;afshin.pir@gallagher.com&gt;
---
 docs/manual/adding-packages-cargo.adoc        | 10 +-------
 package/aardvark-dns/aardvark-dns.hash        |  2 +-
 package/aichat/aichat.hash                    |  2 +-
 package/bat/bat.hash                          |  2 +-
 package/broot/broot.hash                      |  2 +-
 package/dtui/dtui.hash                        |  2 +-
 package/dust/dust.hash                        |  2 +-
 package/espflash/espflash.hash                |  2 +-
 package/eza/eza.hash                          |  2 +-
 package/fd/fd.hash                            |  2 +-
 package/hyperfine/hyperfine.hash              |  2 +-
 package/kibi/kibi.hash                        |  2 +-
 package/kmon/kmon.hash                        |  2 +-
 package/libzenoh-c/libzenoh-c.hash            |  2 +-
 package/netavark/netavark.hash                |  2 +-
 package/nushell/nushell.hash                  |  2 +-
 package/parsec-tool/parsec-tool.hash          |  2 +-
 package/parsec/parsec.hash                    |  2 +-
 package/pkg-download.mk                       |  1 -
 package/procs/procs.hash                      |  2 +-
 package/python-bcrypt/python-bcrypt.hash      |  3 +--
 .../python-cryptography.hash                  |  3 +--
 package/python-logbook/python-logbook.hash    |  3 +--
 package/python-maturin/python-maturin.hash    |  3 +--
 package/python-orjson/python-orjson.hash      |  3 +--
 .../python-pydantic-core.hash                 |  3 +--
 package/python-rpds-py/python-rpds-py.hash    |  3 +--
 package/python-rtoml/python-rtoml.hash        |  3 +--
 package/python-selenium/python-selenium.hash  |  3 +--
 package/ripgrep/ripgrep.hash                  |  2 +-
 package/rust-bindgen/rust-bindgen.hash        |  2 +-
 package/sentry-cli/sentry-cli.hash            |  2 +-
 package/tbtools/tbtools.hash                  |  2 +-
 package/tealdeer/tealdeer.hash                |  2 +-
 package/uefisettings/uefisettings.hash        |  2 +-
 package/zellij/zellij.hash                    |  2 +-
 package/zoxide/zoxide.hash                    |  2 +-
 support/download/cargo-post-process           | 24 +++++--------------
 38 files changed, 42 insertions(+), 72 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.adoc b/docs/manual/adding-packages-cargo.adoc
index 4df758537b..1cb70b7518 100644
--- a/docs/manual/adding-packages-cargo.adoc
+++ b/docs/manual/adding-packages-cargo.adoc
@@ -90,12 +90,4 @@ typical packages will therefore only use a few of them.
 A crate can depend on other libraries from crates.io or git
 repositories, listed in its +Cargo.toml+ file. Buildroot automatically
 takes care of downloading such dependencies as part of the download
-step of packages that use the +cargo-package+ infrastructure. Such
-dependencies are then kept together with the package source code in
-the tarball cached in Buildroot's +DL_DIR+, and therefore the hash of
-the package's tarball doesn't only cover the source of the package
-itself, but also covers the sources of the dependencies. Thus, a change
-injected into one of the dependencies will also be discovered by the
-hash check. In addition,  this mechanism allows the build to be
-performed completely offline since cargo will not do any downloads
-during the build. This mechanism is called vendoring the dependencies.
+step of packages that use the +cargo-package+ infrastructure.
diff --git a/package/aardvark-dns/aardvark-dns.hash b/package/aardvark-dns/aardvark-dns.hash
index c01a46c02c..e6b21e226f 100644
--- a/package/aardvark-dns/aardvark-dns.hash
+++ b/package/aardvark-dns/aardvark-dns.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4b22fb6586f84805b9170d5514b2070f3a090a88c0669a831c7e2a86dd150f17  aardvark-dns-v1.17.1-git4-cargo6.tar.gz
+sha256  6c4de24e5b1551b53e03b34326339931332cb0407e6cec3242be6e591b4d8190  aardvark-dns-v1.17.1-git4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/aichat/aichat.hash b/package/aichat/aichat.hash
index f5e8486137..26090b0746 100644
--- a/package/aichat/aichat.hash
+++ b/package/aichat/aichat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  7a6e5071ea05543d0022fa98d1a96625bfb6c1b094768d9cf0123057376129d1  aichat-0.30.0-cargo6.tar.gz
+sha256  e194cc89afc213a6e3169738221cae641c347421c4f2aacd5d6f4f7cc6edb387  aichat-0.30.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  5af431a6a9869052e2be4e71ccd731c7efe45dca47eaca84d4d1fb38f134cb79  LICENSE-MIT
diff --git a/package/bat/bat.hash b/package/bat/bat.hash
index b6a6d43a76..e545a63e8d 100644
--- a/package/bat/bat.hash
+++ b/package/bat/bat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  e090445aa321355571302ca78fc6c7d9a5ddbfa5fa876be06df8721302f92501  bat-0.26.1-cargo6.tar.gz
+sha256  4474de87e084953eefc1120cf905a79f72bbbf85091e30cf37c9214eafcaa9c9  bat-0.26.1.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  dccda9eb9533f5c65624a1106536c6cfde46008d58e60b3faf154e8b9fd5b46e  LICENSE-MIT
diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index 176c663d62..3a7b0f04e2 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  cad8fb5e23b422aef80ea14797de7c709c97a5d2bb8019cddaea87811b17a652  broot-1.58.0-cargo6.tar.gz
+sha256  2e61f7cddafa39417ff1484d24773190c6a472975a400204d901080a6335a652  broot-1.58.0.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/dtui/dtui.hash b/package/dtui/dtui.hash
index e45f979934..8618a3b025 100644
--- a/package/dtui/dtui.hash
+++ b/package/dtui/dtui.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  57bcf3a8b6681be2695762da17c20d2efb7c121131138868ba7a4485fa08c335  dtui-3.0.0-cargo6.tar.gz
+sha256  8d80be5cb3df543927a9f1ac7861b0a1ac23df249a38e0151c0cfec975583306  dtui-3.0.0.tar.gz
 sha256  b7b3cd0d92fc6638f0a7bd2306d715c747d040c6d851ed821a45c5538663e57a  LICENSE
diff --git a/package/dust/dust.hash b/package/dust/dust.hash
index af963611f5..832826ff32 100644
--- a/package/dust/dust.hash
+++ b/package/dust/dust.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b0b3a217f6b90882777944ad4e7bd1f38daaf37ec2b66549503b201aba89d4b1  dust-1.2.3-cargo6.tar.gz
+sha256  424b26adfbafeac31da269ecb3f189eca09803e60fad90b3ff692cf52e0aeeee  dust-1.2.3.tar.gz
 sha256  aee6e2d13d3a55c7881630c09b41ca7b3b44bb1437b5d36695d22decc3655160  LICENSE
diff --git a/package/espflash/espflash.hash b/package/espflash/espflash.hash
index bcd24a0167..ff30f45fca 100644
--- a/package/espflash/espflash.hash
+++ b/package/espflash/espflash.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  10f2ed2db01359cbc7316cb694731a6a307a639d5698e14506b6b52483d36163  espflash-4.0.1-cargo6.tar.gz
+sha256  f4eb66af5ca11a396b238878d339ca38d9ddcb7c619b47ed5fc91b7f7b4e54ac  espflash-4.0.1.tar.gz
 sha256  811f4d4d7ae8f88090dcd14cddf1982ca75cc30b5604e6ebb636693d9b885788  LICENSE-APACHE
 sha256  8daec6f7e829af4dfc7c99a251986648f718b90589aa819bc48be8ef82b0c12f  LICENSE-MIT
diff --git a/package/eza/eza.hash b/package/eza/eza.hash
index d303e129a0..7aabbe4e9a 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5df44637acd270bbd7dce76ab989db946ea79d969bfdd382400da39dc2b3e98d  eza-0.23.3-cargo6.tar.gz
+sha256  ebd13c47763cb0cd9337a1d6e89e1a3be4e76e0dd9225ac8058d6d338c617a29  eza-0.23.3.tar.gz
 sha256  57fb42fbcd0b037ce528ed8f72f1ec095d67bc6825ecf1448ff39be1fe68a4b4  LICENSE.txt
diff --git a/package/fd/fd.hash b/package/fd/fd.hash
index 0134cf5d21..d07d446f09 100644
--- a/package/fd/fd.hash
+++ b/package/fd/fd.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  58af97d85e7ddb1601c172f15565521e7fb5ca2ed559774e4ce1443068d3e1c7  fd-10.3.0-cargo6.tar.gz
+sha256  2edbc917a533053855d5b635dff368d65756ce6f82ddefd57b6c202622d791e9  fd-10.3.0.tar.gz
 sha256  73c83c60d817e7df1943cb3f0af81e4939a8352c9a96c2fd00451b1116fa635c  LICENSE-APACHE
 sha256  322cfc7aa0c774d0eca3b2610f1d414de3ddbd7d8dd4b9dea941a13a6eb07455  LICENSE-MIT
diff --git a/package/hyperfine/hyperfine.hash b/package/hyperfine/hyperfine.hash
index 0bd5a1b873..e9e25b10e1 100644
--- a/package/hyperfine/hyperfine.hash
+++ b/package/hyperfine/hyperfine.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  10ef59c1ae8c368f3663cecff219f872ada90dd6bdd52d07e544bf9bdf777093  hyperfine-1.20.0-cargo6.tar.gz
+sha256  f90c3b096af568438be7da52336784635a962c9822f10f98e5ad11ae8c7f5c64  hyperfine-1.20.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  1dfee18c2ff07ce551de4d6a1d2db158c0380746b488a7f0d08c8e0d3568b7c3  LICENSE-MIT
diff --git a/package/kibi/kibi.hash b/package/kibi/kibi.hash
index d56571e4d5..f6eea77942 100644
--- a/package/kibi/kibi.hash
+++ b/package/kibi/kibi.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  b1edddd4daf0a38d79673bb42f386f91a68fe7b2212defde5e531cbc93dc1bac  kibi-0.3.3-cargo6.tar.gz
+sha256  a7a7b6f6937f39ae86fd4f556034a3744bb99091c102bc6f38b281ee751d10e9  kibi-0.3.3.tar.gz
 sha256  53cdcb17642e801f813712b4844293b037c23d4b482004b77c15ae2f36f551c3  LICENSE-MIT
 sha256  8c6db340475136df3c1201d458fa5755698eace76e510471ecc9d857d6083dac  LICENSE-APACHE
diff --git a/package/kmon/kmon.hash b/package/kmon/kmon.hash
index cfd7824f75..a9eb23976e 100644
--- a/package/kmon/kmon.hash
+++ b/package/kmon/kmon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e44c6d6b69dd606b1097183886f6d29680346738a1778d500becde6b94c313dc  kmon-1.7.1-cargo6.tar.gz
+sha256  fd8e02c17089e88c2b019e116e0b7fdd9fe4285327bd795de90622aba4b79469  kmon-1.7.1.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
index d623a27d83..bde4c006ff 100644
--- a/package/libzenoh-c/libzenoh-c.hash
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a741fbe80cb5f159b830100e145f2fbf02a8084f8cdd0658640dd282cd39635e  libzenoh-c-1.2.1-cargo6.tar.gz
+sha256  108d17bcf7670754712f75665abf5d550003b7c80fc3a5df75f41fd62cf8658c  libzenoh-c-1.2.1.tar.gz
 sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/netavark/netavark.hash b/package/netavark/netavark.hash
index f86728e834..760dfa5190 100644
--- a/package/netavark/netavark.hash
+++ b/package/netavark/netavark.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  599fb6d2bb920025ebfef83856afa5bb9be5929806516e7b233ff36107a99b00  netavark-v1.17.1-git4-cargo6.tar.gz
+sha256  defd28c70cb981cea8afe2a0257acc408196de96e00afd293b9de8fd861fbca1  netavark-v1.17.1-git4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/nushell/nushell.hash b/package/nushell/nushell.hash
index 9f93792917..4d2107b76c 100644
--- a/package/nushell/nushell.hash
+++ b/package/nushell/nushell.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  7a0cfb4bee97a34c7d1883eaa72b07b25f24d4ccd96795704d235a9c6854c695  nushell-0.108.0-cargo6.tar.gz
+sha256  5995c211411ad1d5dd7da904b9db238a543958675b9e45f5e84fbdf217499eee  nushell-0.108.0.tar.gz
 sha256  ff5dcaaba6140ec57cafdd4f707cd0d329e727477cf7d5b9ba7a244ec2678b79  LICENSE
diff --git a/package/parsec-tool/parsec-tool.hash b/package/parsec-tool/parsec-tool.hash
index fd98c9ecf2..6e5079e923 100644
--- a/package/parsec-tool/parsec-tool.hash
+++ b/package/parsec-tool/parsec-tool.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f63b9b677410ef25fc466830c437961b579086b5f9928c6000e0c3a97f5ba775  parsec-tool-0.7.0-cargo6.tar.gz
+sha256  b9d455cdfa21100bb2f824d8fa8784d8c9cf5bf6d8229f7603e7634ee33c0191  parsec-tool-0.7.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/parsec/parsec.hash b/package/parsec/parsec.hash
index e2a7b99fdf..1a2618862a 100644
--- a/package/parsec/parsec.hash
+++ b/package/parsec/parsec.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5ec0ea98d2270b17c3615931f6adb20bcd975614cd92ced9eb3513c55bc1f6e5  parsec-1.4.1-cargo6.tar.gz
+sha256  35460233b0cc7d7289faecd0bdf6eb0be7c47aa9435d1039d553a57efd5d3621  parsec-1.4.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index b38f0c7053..222f5a63a6 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -12,7 +12,6 @@
 BR_FMT_VERSION_git = -git4
 BR_FMT_VERSION_svn = -svn5
 BR_FMT_VERSION_go = -go2
-BR_FMT_VERSION_cargo = -cargo6

 DL_WRAPPER = support/download/dl-wrapper

diff --git a/package/procs/procs.hash b/package/procs/procs.hash
index b44825409d..6f847c0dcf 100644
--- a/package/procs/procs.hash
+++ b/package/procs/procs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b90a367469c48eea133a3f44fa8969fd95c17d2542f703416a5b6378240acb53  procs-0.14.10-cargo6.tar.gz
+sha256  7b287ac253fd1d202b0ea6a9a8ba2ed97598cf8e7dfd539bd40e382c6dc6d350  procs-0.14.10.tar.gz
 sha256  feb87a2e0c305de3464cc44077da5393c52d8ca6362d37427157d04ec6f4510d  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index 5e3ffb8a7f..48ab539719 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,4 +1,3 @@
-# Locally calculated after vendoring
-sha256  b8a767a0f37ecdacff1df6772aec8bd6d458a77a1a5b9ad6657c6c5d9657a9b0  python-bcrypt-5.0.0-cargo6.tar.gz
+sha256  f748f7c2d6fd375cc93d3fba7ef4a9e3a092421b8dbf34d8d4dc06be9492dfdd  python-bcrypt-5.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 02d199ac3b..bf8ca601bd 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,4 @@
-# Locally calculated after vendoring
-sha256  f4d6d4b4671ebaf2c86f2fa5ec4beac9056f30129fea17338c35c87eb25daf1b  python-cryptography-48.0.0-cargo6.tar.gz
+sha256  5c3932f4436d1cccb036cb0eaef46e6e2db91035166f1ad6505c3c9d5a635920  python-cryptography-48.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-logbook/python-logbook.hash b/package/python-logbook/python-logbook.hash
index ee812562ea..15bb3c9642 100644
--- a/package/python-logbook/python-logbook.hash
+++ b/package/python-logbook/python-logbook.hash
@@ -1,4 +1,3 @@
-# Locally calculated after vendoring
-sha256  07d53ef8b7cb1f267862f72df81857c9d6665104535cc5309774de7966164c46  python-logbook-1.9.2-cargo6.tar.gz
+sha256  0538cabfd8e8a02b8185fb7a2be20b3965d225fbd7f4a5726b007d8e26b39ee0  python-logbook-1.9.2.tar.gz
 # Locally computed sha256 checksums
 sha256  2ca266337cc6947578654ab0dd6438de4d01fa78b2e6eb554b09757df1178f98  LICENSE
diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 117a2b9463..f6487ef0f6 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,4 @@
-# Locally calculated after vendoring
-sha256  703e4542966258bc728916f99fc78e38b670a538339cbf7f0e1b3bc9f9ab166f  python-maturin-1.11.2-cargo6.tar.gz
+sha256  24d2502ee8e6e6a33b3993bc78251da8d982e4da16d6c0ad9b4256135ff8694b  python-maturin-1.11.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index f4443fcc9b..880bc8fb09 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,4 @@
-# Locally calculated after vendoring
-sha256  cd415890f20e7f29055b5057d3ff5af7c673ffc3d7e659ec68e9377f13604065  python-orjson-3.11.5-cargo6.tar.gz
+sha256  82393ab47b4fe44ffd0a7659fa9cfaacc717eb617c93cde83795f14af5c2e9d5  python-orjson-3.11.5.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 92e97f6755..1a6d50e4c8 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,3 @@
-# Locally calculated after vendoring
-sha256  a79f876fbf65e2568c30c9b8a5be0a2817bd314c2aa483b4aaeb80ba8443cc4d  python-pydantic-core-2.46.3-cargo6.tar.gz
+sha256  41c178f65b8c29807239d47e6050262eb6bf84eb695e41101e62e38df4a5bc2c  python-pydantic-core-2.46.3.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index 32593a1f7c..307939dac8 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,3 @@
-# Locally calculated after vendoring
-sha256  9a3d3078a2fc34efd16e22b73c61f6a25ae61e26d5b3dc84d656cc0b716de4b1  python-rpds-py-0.30.0-cargo6.tar.gz
+sha256  dd8ff7cf90014af0c0f787eea34794ebf6415242ee1d6fa91eaba725cc441e84  python-rpds-py-0.30.0.tar.gz
 # Locally computed sha256 checksums
 sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rtoml/python-rtoml.hash b/package/python-rtoml/python-rtoml.hash
index 9f40e2abdf..1486f69612 100644
--- a/package/python-rtoml/python-rtoml.hash
+++ b/package/python-rtoml/python-rtoml.hash
@@ -1,4 +1,3 @@
-# Locally calculated after vendoring
-sha256  9c9cd121f893bf7e8360519df29088e97d5455cc437d9400d10757ac84846d17  python-rtoml-0.10.0-cargo6.tar.gz
+sha256  e1c9af50c6e8c53bc07fdf3277ab1b90e83648c689ea73dadae7d78d1e18d752  python-rtoml-0.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cd5ffde80e6d3286a2e2e5f02fb2cb07b823931ca368e7c735a6c5f5aebe7103  LICENSE
diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index f2048092e3..2c78b016bd 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,4 +1,3 @@
-# Locally calculated after vendoring
-sha256  fc578e57f98032ab4d89193bfdfed5dac965362d08aa436b8b713e182ea43f4c  python-selenium-4.39.0-cargo6.tar.gz
+sha256  12f3325f02d43b6c24030fc9602b34a3c6865abbb1db9406641d13d108aa1889  python-selenium-4.39.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1ee8454a0696ac46b0d5b67f85b2a0e3af2b7726e1b82cd182af60fd285bcba3  LICENSE
diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index 287d350d6b..600b613cf4 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c3427fa1f0909263da4a43d73a9cf1a4fa3f37d09c938cc40cd923239f57770d  ripgrep-14.1.1-cargo6.tar.gz
+sha256  4dad02a2f9c8c3c8d89434e47337aa654cb0e2aa50e806589132f186bf5c2b66  ripgrep-14.1.1.tar.gz
 sha256  0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
index fecafcd4fd..9045106e3d 100644
--- a/package/rust-bindgen/rust-bindgen.hash
+++ b/package/rust-bindgen/rust-bindgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8e5a0999c2f4f6ab1cdee508e913e2ffef5225fb313816a0151742cd2103576c  rust-bindgen-0.72.1-cargo6.tar.gz
+sha256  4ffb17061b2d71f19c5062d2e17e64107248f484f9775c0b7d30a16a8238dfd1  rust-bindgen-0.72.1.tar.gz
 sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
diff --git a/package/sentry-cli/sentry-cli.hash b/package/sentry-cli/sentry-cli.hash
index 0b1ef402e1..9deddede16 100644
--- a/package/sentry-cli/sentry-cli.hash
+++ b/package/sentry-cli/sentry-cli.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  19d62065788c0b72d54875e834462f444204fcae99fe76f69a836cc17a7a0935  sentry-cli-2.20.3-cargo6.tar.gz
+sha256  9cc7669087c32ca2770634b0005ef09b82633f794524e7d6ab1187280a826023  sentry-cli-2.20.3.tar.gz
 sha256  9503def7b54ceb6e3cd182fd59bc05d3a30d7eae481e65aaba4b495133c83c14  LICENSE
diff --git a/package/tbtools/tbtools.hash b/package/tbtools/tbtools.hash
index 832f5f13b4..11a341697d 100644
--- a/package/tbtools/tbtools.hash
+++ b/package/tbtools/tbtools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a83b6413b20508632a2278b1e9311b2483a2ef2994bdd82e5089794a1270dfa8  tbtools-0.8.0-cargo6.tar.gz
+sha256  262d0b383a150b44ffb7509f216cb797124da06a5cfdb0b3c38ca58943ba2cf4  tbtools-0.8.0.tar.gz
 sha256  9b16a3add311d607af8d9b348a842a37840d0f47dfcc6cf2a7756ee02c24ed69  LICENSE
diff --git a/package/tealdeer/tealdeer.hash b/package/tealdeer/tealdeer.hash
index b54129dd1e..e36403cb46 100644
--- a/package/tealdeer/tealdeer.hash
+++ b/package/tealdeer/tealdeer.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  28b8fc80f1409476f8a093249b083995b2099a5283580815cad94c3b1cc46453  tealdeer-1.6.1-cargo6.tar.gz
+sha256  d42db25a56a72faec173c86192656c5381281dc197171f385fccffd518930430  tealdeer-1.6.1.tar.gz
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  a313b5e62b80a08f3aae0fa62ff3de8482ef55247299eb352ab44f87ef456b1b  LICENSE-MIT
diff --git a/package/uefisettings/uefisettings.hash b/package/uefisettings/uefisettings.hash
index 4e620ac8b8..90d65bd6d2 100644
--- a/package/uefisettings/uefisettings.hash
+++ b/package/uefisettings/uefisettings.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8be49ed7fe97a153e3f1470db54cb563090cdd431bef59a115266f1f724c1f14  uefisettings-149bc92970949d44be641ae1e3e942220d7390e7-cargo6.tar.gz
+sha256  c9a0166d001fe1bd7ae7241cf1b7023400b0d06bc2f84759f0d10b8016fb2577  uefisettings-149bc92970949d44be641ae1e3e942220d7390e7.tar.gz
 sha256  acc0b83e151985bb943d35ac37e7522fef28d707af9a4829678e92baa409aaf1  LICENSE
diff --git a/package/zellij/zellij.hash b/package/zellij/zellij.hash
index ac6a219270..7580ce17fe 100644
--- a/package/zellij/zellij.hash
+++ b/package/zellij/zellij.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  2a565f28d89c9e8caf2bad7a0f07f03747e3d3ee2d988297a41d1ffcfb034237  zellij-0.44.3-cargo6.tar.gz
+sha256  33ae61fc802b59462fed49b424893596d3aa819646bdce53d5602f714c1264fe  zellij-0.44.3.tar.gz
 sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zoxide/zoxide.hash b/package/zoxide/zoxide.hash
index 196d682e2d..3a317d197f 100644
--- a/package/zoxide/zoxide.hash
+++ b/package/zoxide/zoxide.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bf836b249e22a736e8b1b53d7f6d4f9d4616d4ab2c388839453e176bc6365bec  zoxide-0.9.8-cargo6.tar.gz
+sha256  1b276edbf328aafc86afe1ebce41f45ccba3a3125412e89c8c5d8e825b0c7407  zoxide-0.9.8.tar.gz
 sha256  23aa3b08366e4ed6050f3d9950070201802aadbe5675fa1c19f24f4de91cf294  LICENSE
diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index b0e59ad74d..29b990d808 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -21,31 +21,19 @@ while getopts "n:o:m:" OPT; do
     esac
 done

-# Already vendored tarball, nothing to do
-if tar tf "${output}" | grep -q "^[^/]*/VENDOR" ; then
-    exit 0
-fi
-
+# Extract package to access Cargo.toml / Cargo.lock
 post_process_unpack "${base_name}" "${output}"

-# Do the Cargo vendoring
 pushd "${base_name}" &gt; /dev/null

-# Create the local .cargo/config.toml with vendor info
-mkdir -p .cargo/
+# Fetch package dependencies
 mkdir -p "${CARGO_HOME}"
 flock "${CARGO_HOME}"/.br-lock \
-cargo vendor \
+cargo fetch \
     --manifest-path "${manifest}" \
-    --locked VENDOR \
-    &gt; .cargo/config.toml
-
-# "cargo vendor' outputs on stderr a message directing to add some data
-# to the project's .cargo/config.toml, data that it outputs on stdout.
-# Since we redirect stdout to .cargo/config.toml, the message on stderr
-# gets confusing, so instruct the user that it's been handled.
-printf '(note: .cargo/config.toml automatically updated by Buildroot)\n\n'
+    --locked

 popd &gt; /dev/null

-post_process_repack "$(pwd)" "${base_name}" "${output}"
+# Remove unpacked package folder
+rm -rf "${base_name}"
--
2.43.0

________________________________
 This email is confidential and may contain information subject to legal privilege. If you are not the intended recipient please advise us of our error by return e-mail then delete this email and any attached files. You may not copy, disclose or use the contents in any way. The views expressed in this email may not be those of Gallagher Group Ltd or subsidiary companies thereof.
________________________________
</pre></body></html>
--=-n6reoiHJ9LGMeH9ESQIDOQ==--

--===============8325946543592222857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8325946543592222857==--
