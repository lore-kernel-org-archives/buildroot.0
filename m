Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFF2C5DF87
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 06:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B001A40598;
	Thu, 20 Aug 2026 06:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V9Xa8s7PyIvW; Thu, 20 Aug 2026 06:57:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787209037;
	bh=z6HDg1BwWgMY3wgB8r7/DvQivb0Yb1ucpkufCDgr7wc=;
	h=To:CC:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=rW6i6Ve7DeuuLnt6ttQLYjnx6GCobKrCFns01OPT9oiAvmQyjkNdRFFcRYvhrxzRy
	 9am9Po5o9MRgFBNboyCY83+KagqN0camlKjL+6/VmGU3TxcAb5v2IDY0C3WsvWGOwQ
	 IevktYTVVQ0lvWzMXkj6+02hqD+uKhj7tILpC6R/kPeO75l7Ve7UurkMSZT3VtWBvP
	 WbRJ2sccVuiV0uzHuvbymnP2mhoNtF5NchYp/i5F+IJXIL93z+tbuJ6HD0io9bnLz/
	 oYzuO95H0OvgYt6hHFJ7soFsO7Dgat3f5Mtuwx9QgH2UdfVLt4X706CbdFqt86N0Fx
	 eKA/uO0xtGx0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B55AF405AA;
	Thu, 20 Aug 2026 06:57:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A80D9334
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 06:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9764040581
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 06:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZ9YFKa-7qsD for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 06:57:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c213::5;
 helo=zr1p278cu001.outbound.protection.outlook.com;
 envelope-from=stefan.mueller@rey-technology.com; receiver=<UNKNOWN> 
Received: from ZR1P278CU001.outbound.protection.outlook.com
 (mail-switzerlandnorthazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c213::5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E38D4057E
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 06:57:10 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Emxg1qZWHlzNj6dlF/lZJ4+gfh7fhRhEQDwSqSE0fDBWoBuxwIC61RNKA5htuE1VJBG2AbEzva3p4UXdNTusFg3F6GULQb9ksNtwAz+SeTqXf2OCgAs/0HZmPR8oO/vc6mdMKkC2VEKYYwfIMkixPB0moTJiHvqm1dj1MBTZo25ngs2YJ84+YK2cLcG/u0/zbdpnE7RjJ7GTEJjoBeNQ9hRWTWt+7gLDlNq4wxOZRczAFtrSJ2labmGOeqgdBr1I8E6qNBSatYfpYUI2LL1fwEbGl3TZpgW/WCP4dEWT6Me2hyoPMOuf4CLbtOyNTFuUP1Zixfk1/sNQbeNBVZZesg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwuYf0MMZaLRQNcmM35p25JB0GKnqNPTj2xN7ixTbEA=;
 b=TadxqjcqRW2If/ovKqNGDa9mvf29g+NOQiZuxBblSqsl6dFTOi5+aY3Oe7LNmyE3dXAwbZWcTV++2fTbIOV8XXewB0lwqXzO6m2CAr/aMJ3N6NeTmKIpnrYnq9/bpcSispXu8tzX2wOIAUSmuAPWOrvOUTy99heaN7uW6aWP+A4NA5X8SGQ1GZbioVTqSqstS/Whn8expsMXZbPQT7Nb37l+9zv1Pi1D2yVOuMv6Tw/NqkSMv2fs8aHSIVuSf3+yM3j9y5LRlVzg+pEn4IpyCdJmpRgmbfF6nOnhxYSlknFio1N8K8UIZcR+mR38GOjybwUorEsic7Gsc0cfVUEgsg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 94.140.18.226) smtp.rcpttodomain=buildroot.org
 smtp.mailfrom=rey-technology.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=rey-technology.com; dkim=pass (signature was
 verified) header.d=rey-technology.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=rey-technology.com]
 dmarc=[1,1,header.from=rey-technology.com])
Received: from AM9P250CA0007.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::12)
 by ZR1PPFE824120AE.CHEP278.PROD.OUTLOOK.COM (2603:10a6:918::2b0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 06:57:05 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:20b:21c:cafe::c) by AM9P250CA0007.outlook.office365.com
 (2603:10a6:20b:21c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 06:57:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 94.140.18.226)
 smtp.mailfrom=rey-technology.com; dkim=pass (signature was verified)
 header.d=rey-technology.com;dmarc=pass action=none
 header.from=rey-technology.com;
Received-SPF: Fail (protection.outlook.com: domain of rey-technology.com does
 not designate 94.140.18.226 as permitted sender)
 receiver=protection.outlook.com; client-ip=94.140.18.226;
 helo=mfod-euc1.prod.hydra.sophos.com;
Received: from mfod-euc1.prod.hydra.sophos.com (94.140.18.226) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 06:57:04 +0000
Received: from localhost (ip-172-20-0-240.eu-central-1.compute.internal
 [127.0.0.1])
 by mfod-euc1.prod.hydra.sophos.com (Postfix) with ESMTP id 4hQZ4J19JyzsWCJ
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 06:57:04 +0000 (UTC)
X-Sophos-Product-Type: Mailflow
X-Sophos-Email-ID: eaa96a597c184f4fa42f0f9381754e61
Received: from ZR1P278CU001.outbound.protection.outlook.com
 (mail-switzerlandnorthazon11022131.outbound.protection.outlook.com
 [40.107.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mf-outbound-eu-central-1.prod.hydra.sophos.com (Postfix) with ESMTPS id
 4hQZ4G6C9qzvPrk
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 06:57:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhspdZq2GjyuHVYEYPhLgMWbhQ1MI8CUGoOis/KzoujHsp1XfsfyKENar5kBkI0n7tWwNc5/4YFvaV5uQdEPTRknwdmToomY6aiMXm9GovWa6yADvZUGq3VmLIpRazxIUGy62zwDGAGFjjksKMrE+1XTuaELpsHalM2yLjNKyMtBeSGudOfGdpdLTPVywLHvAdCOOscmgLwoqa09CyKsj4az73fMpCPNiezaF7hzo/YKHpbzQa86Srqn5i7BP/eEy3DitK88Lih7Jeg4vgHbuUgXrEefh/2N/1fEjUdoiL3w/loEOGPM+uq+Kp8kSq1X9gvqHxTIPCEYgE+TicKB/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwuYf0MMZaLRQNcmM35p25JB0GKnqNPTj2xN7ixTbEA=;
 b=OaWywqb/hHwtZzDBrrXTanIZO6BmBKGHu4HXJtoBYZrz+F7n4sTz+U2F/LFZcoxzJ2b9g9OALCkZGTeJsmupPu/jPDrvJJhNMi5GZJBQcvvIwSJntYM/w9Qa0C9b6V78hT3XsmGrvCRwdHRkLc3lwhhFEkXltT+XD28MU/R/wNPDckJYNpur4i4pKSH6xK1nlqdz5ONDY4WrYgI8FrbaZ8qTnMn/9eHeCcRir+wRlfFKOZGeE/EKYneNBZAF30TvEdUqaFgqweQB0rwWwPTp5vBoSTotKnzUDyfQgoe6P+aPRc7hUS+k21+QcBSl8EZvJ8KC5/asUGSyV08/WKpn4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.79.220.33) smtp.rcpttodomain=buildroot.org
 smtp.mailfrom=rey-technology.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=rey-technology.com; dkim=none (message not signed);
 arc=none (0)
Received: from AS4P192CA0022.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::20)
 by ZR5P278MB1774.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:ad::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 06:56:57 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::a2) by AS4P192CA0022.outlook.office365.com
 (2603:10a6:20b:5e1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 06:56:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.220.33)
 smtp.mailfrom=rey-technology.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=rey-technology.com;
Received-SPF: Pass (protection.outlook.com: domain of rey-technology.com
 designates 20.79.220.33 as permitted sender) receiver=protection.outlook.com; 
 client-ip=20.79.220.33; helo=de1-emailsignatures-cloud.codetwo.com; pr=C
Received: from de1-emailsignatures-cloud.codetwo.com (20.79.220.33) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 06:56:55 +0000
Received: from ZRAP278CU002.outbound.protection.outlook.com (40.93.85.5) by
 de1-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via
 SMTP; Thu, 20 Aug 2026 06:56:55 +0000
Received: from DU2PR04CA0282.eurprd04.prod.outlook.com (2603:10a6:10:28c::17)
 by GV1PPF260593666.CHEP278.PROD.OUTLOOK.COM (2603:10a6:718::209) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 06:56:49 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::15) by DU2PR04CA0282.outlook.office365.com
 (2603:10a6:10:28c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 06:56:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.196.177.45)
 smtp.mailfrom=rey-technology.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=rey-technology.com;
Received-SPF: Pass (protection.outlook.com: domain of rey-technology.com
 designates 213.196.177.45 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.196.177.45;
 helo=mailrelay.reygruppe.ch; pr=C
Received: from mailrelay.reygruppe.ch (213.196.177.45) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Thu, 20 Aug 2026 06:56:48 +0000
Received: from build.reycloud.net (unknown [172.20.60.115])
 by mailrelay.reygruppe.ch (Postfix) with ESMTP id 651017FE27;
 Thu, 20 Aug 2026 08:56:47 +0200 (CEST)
To: buildroot@buildroot.org
CC: =?UTF-8?q?Stefan=20M=C3=BCller?= <stefan.mueller@rey-technology.com>
Date: Thu, 20 Aug 2026 06:56:41 +0000
Message-ID: <20260820065646.375321-1-stefan.mueller@rey-technology.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 2
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFF:EE_|GV1PPF260593666:EE_|AM3PEPF00009B9D:EE_|ZR5P278MB1774:EE_|AMS0EPF00000192:EE_|ZR1PPFE824120AE:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e0e8ea5-cb5e-458e-d027-08defe883e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|10067099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info-Original: JDBnY2lzjKZe+pbgncro/KrPH0GgM2Gbw1hVcC/Yk6DbnTnk+xt1YXka4G/ZC3NCb/wfu6MNCuZL8+rlilY1BgN0ahdBgY0DGc2+LmatP5sd0LptQEzGT277MBQvVS6mhBSXzDXf+qASZl6mtTDrL0wfyWajo7lj0OoiZbsIvLOhXH1FARRnopdFHTojz3unZjq4YfqMblO3dC218oCKbSY2diGORF/s3MVOFWCjLF6Qv+MviSSwbmieL99p6niA9Ydj5vFqNlqjPRxvgJVqE+sO/tq0HwaW8VACtfK+Mrce3y35Q1cvsQOmADr4SnI4zN2f14zgf4j7VRS3ydXnr8FpKubxH8wV+uJHiXtwRkFGGmYlgXmn9/+S9RkMrKjtvl2sL6/zAH+3taVQoGjK4Pct5og92aSzbpV2ovsq0sXQtoqx84FEz+EbQvEe/Fn4kmaoSMCWcK/ehg8hJCWsDaG0rTzGBKdhYM/R+oi08Ba581yXdMVKhrKocRrFriL2agZFjg1z782NEfZ+7ab41dsgJ2wa4Ihu3RxUnJpkUod+xpZoPTQAd4mcbW32mKsL29MXjw4iL1aNRXnysWFsTMtedVwviRNf6FRjL310PQLi4/Sly32/Y+t0q7LpPePaFBQaSZhhKsJ5b7hrCHgs/Mn6+UVY4s0GAtu/YlSlVkAIjfsicCG5Eda1aIlVdtctSPifmvjNGBO4FqIsGs9BvQ==
X-Forefront-Antispam-Report-Untrusted: CIP:213.196.177.45; CTRY:CH; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:mailrelay.reygruppe.ch;
 PTR:ftth-177-045.tbwil.ch; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(10067099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1102; 
X-Exchange-RoutingPolicyChecked: FtrEAZZ52VdNmkmRbG7xGyGggNYfNyMvMstOinwZT3Q5LoyuLZky+xCMfjB0D/pFbwFn1Yr19dan7zqjNxjTi1t0PsEWH4f3gcXNhUfV7OmiCZtNtyyj5T57VUa8qn65bEJHzFEDtGv0ARSyleU3+Re1Nh80vZ9++NoIjmpVlYA4JdkyFpxgfBcrwJmejG2BLpjzLXJPw8eo+9wbU8VU9Gz4S7McgtaVzWGFswzOaoFTq4qvK5Twu82fVYtXEcE9KZI+/UiYtL9RkYN9E2id6V0Qj87leE9JiXBPEpdSMc8wWUrSIFi+lxISfuQtBC6OpY8HHPrSEqdVN/xN4rjEmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PPF260593666
X-CodeTwo-MessageID: 4bb3040e-b155-4719-ae03-d2ee8c252f28.20260820065655@de1-emailsignatures-cloud.codetwo.com
References: <4e118c97-1508-4315-bc90-2b0b02fc43b2.a680deba-e8f9-456f-ab7c-ac325426e0a3.7f9be450-dceb-4ebb-b9e9-685b8eeceb2d@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2ee4e2d7-9610-43cb-4446-08defe88346a
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|6049299003|23010399003|14060799003|35042699022|1800799024|7149299003|376014|82310400026|36860700016|10067099003|56012099006|4076899003|8096899003|18002099003|11063799006|4053099003;
X-Microsoft-Antispam-Message-Info-Original: Y+PVZqipti3/TVHMofYOKFsBr9TyiV70btGeyLxHKE8ZPkMNPI1Ot4yK0fIbZuLV9jNbD+vm1aFWvzxwh20snhbFf/WWVtIVADKHwPqIxOAiyxt6sN1KTMUhKbpakf0bYNzxsNGsLiPYrLXNS9GYcEpDUa9uDRJjb7UPLEC0J06Nmg6E4PMAEHoW7jZY2h/xm5Stx+wY/alGEoXwRvnuzyfX96awj7hK6zVprfZxjGHK82n66oT3uS1Mk67ZP9xvtf6MDUYtTVEvjISGW29z/lCBdspqK5yQhTBYvE1PkNdGfjEr8aMmY5izZkc+Djo1sJg0pYAu51bG98L6S427u7vD5XfQyDioz6Ou+2aFyPLMBzLRDdmvTeIOXXzwZKMBzSXC0jnQnZO3JcfOcd1xYgYKP7cSdd1/hnBrjH2Ikzr08YYPRmlYnFF8rFnAgUJgbTePUoMO8iUKcNgs9XNmXDNNYXtzqhuBealDvTWttT3cLiAuAFtcWw8u1r0n3kOzHCdtsMLW9pVwC1iMYGpRn+j2dYY9dOvrTbH1ZR1ndes8i7COYVNHzRCsRlbDF+czcdUHw82yCrQ7h+1TLqK/Ym8ocZKPFdguZMFSl1u6m9x/CDQlSHuP/T4v38g1EJIBD/OwoH3BR5XVGDL5HgmCrg==
X-Forefront-Antispam-Report-Untrusted: CIP:20.79.220.33; CTRY:DE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:de1-emailsignatures-cloud.codetwo.com;
 PTR:de1-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(6049299003)(23010399003)(14060799003)(35042699022)(1800799024)(7149299003)(376014)(82310400026)(36860700016)(10067099003)(56012099006)(4076899003)(8096899003)(18002099003)(11063799006)(4053099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR5P278MB1774
X-Lased-Spam: NonSpam
X-Sophos-Mailflow-Processing-Id: 65de06abc11b4140afcd21d6500dd7e9
X-Lased-Spamprobability: 0.083173
X-Lased-Impersonation: False
X-Lased-Hits: BODYTEXTH_SIZE_10000_LESS 0.000000, BODYTEXTH_SIZE_3000_MORE
 0.000000, BODY_SIZE_10000_PLUS 0.000000, DKIM_ALIGNS 0.000000,
 DKIM_SIGNATURE 0.000000, HREF_LABEL_TEXT_NO_URI 0.000000, HTML_70_90
 0.100000, IMG_AR_1 0.000000, IMG_ATTACHED_2P 0.000000, IMP_FROM_NOTSELF
 0.000000, INVOICE_ATTACHMENT 0.100000, LEGITIMATE_SIGNS 0.000000,
 LINK_TO_IMAGE 0.000000, MULTIPLE_ATTACHMENTS 0.000000, MULTIPLE_REAL_RCPTS
 0.000000, NO_FUR_HEADER 0.000000, OUTBOUND 0.000000, OUTBOUND_SOPHOS
 0.000000, PNG_PIXPERBYTE_LOW 0.000000, REFERENCES 0.000000, SUSP_DH_NEG
 0.000000, __ANY_URI 0.000000, __ARCAUTH_DKIM_NONE 0.000000,
 __ARCAUTH_DMARC_PASSED 0.000000, __ARCAUTH_PASSED 0.000000,
 __ARC_SEAL_MICROSOFT 0.000000, __ARC_SIGNATURE_MICROSOFT 0.000000,
 __ATTACH_CTE_BASE64 0.000000, __ATTACH_CTE_QUOTED_PRINTABLE 0.000000,
 __BODY_TEXT_X4 0.000000, __BULK_NEGATE 0.000000, __CC_NAME 0.000000,
 __CC_NAME_DIFF_FROM_ACC 0.000000, __CC_REAL_NAMES 0.000000,
 __COURIER_PHRASE 0.000000, __CT 0.000000, __CTYPE_HAS_BOUNDARY 0.000000,
 __CTYPE_MULTIPART 0.000000, __DKIM_ALIGNS_1 0.000000, __DKIM_ALIGNS_2
 0.000000, __DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP
 0.000000, __EMBEDDED_IMG 0.000000, __EXTRA_MPART_TYPE_N1 0.000000,
 __FROM_DOMAIN_IN_ANY_CC1 0.000000, __FROM_DOMAIN_IN_RCPT 0.000000,
 __FROM_ENCODED 0.000000, __FROM_NAME_NOT_IN_BODY 0.000000, __FROM_UTF_Q
 0.000000, __FUR_RDNS_SOPHOS 0.000000, __HAS_ATTACHMENT 0.000000,
 __HAS_ATTACHMENT1 0.000000, __HAS_ATTACHMENT2 0.000000, __HAS_CC_HDR
 0.000000, __HAS_FROM 0.000000, __HAS_HTML 0.000000, __HAS_MSGID 0.000000,
 __HAS_REFERENCES 0.000000, __HAS_X_FF_ASR 0.000000, __HAS_X_FF_ASR_CAT
 0.000000, __HAS_X_FF_ASR_SFV 0.000000, __HAS_X_MAILER 0.000000,
 __HIGHBIT_ASCII_MIX 0.000000, __HREF_LABEL_IMG 0.000000, __HREF_LABEL_TEXT
 0.000000, __HTML_AHREF_TAG 0.000000, __HTML_ENTITIES_X4 0.000000,
 __HTML_HREF_TAG_X2 0.000000, __HTML_TAG_DIV 0.000000, __HTML_TAG_IMG_X2
 0.000000, __HTML_TAG_TABLE 0.000000, __HTTPS_URI 0.000000, __IMG_ATTACHED
 0.000000, __IMG_SIZE_1K_10K 0.000000, __IMG_THEN_TEXT 0.000000,
 __IMP_FROM_MY_ORG 0.000000, __IMP_FROM_NOTSELF 0.000000,
 __INVOICE_MULTILINGUAL 0.000000, __JSON_HAS_SCHEMA_VERSION 0.000000,
 __JSON_HAS_TENANT_DOMAINS 0.000000, __JSON_HAS_TENANT_ID 0.000000,
 __JSON_HAS_TENANT_SCHEMA_VERSION 0.000000, __JSON_HAS_TENANT_VIPS 0.000000,
 __JSON_HAS_TRACKING_ID 0.000000, __MIME_ATTACHMENT_1_N 0.000000,
 __MIME_ATTACHMENT_N_2 0.000000, __MIME_ATTACHMENT_N_3 0.000000,
 __MIME_ATTACHMENT_N_4 0.000000, __MIME_HTML 0.000000, __MIME_TEXT_H
 0.000000, __MIME_TEXT_H1 0.000000, __MIME_TEXT_H2 0.000000, __MIME_VERSION
 0.000000, __MULTIPLE_URI_HTML 0.000000, __MULTIPLE_URI_TEXT 0.000000,
 __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
 __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __PART_2_IMAGE_PNG 0.000000,
 __PHISH_SPEAR_SUBJ_SUBJECT 0.000000, __PNG_AR_1 0.000000,
 __PRODUCT_TYPE_MAILFLOW 0.000000, __RCVD_NO_PTR 0.000000, __RCVD_PASS
 0.000000, __REFERENCES 0.000000, __SANE_MSGID 0.000000, __SCAN_D_NEG2
 0.000000, __SCAN_D_NEG_HEUR2 0.000000, __SL_HEAVY 0.000000,
 __STYLE_RATWARE_NEG 0.000000, __STYLE_TAG 0.000000,
 __SUBJ_STARTS_S_BRACKETS 0.000000, __TAG_EXISTS_BODY 0.000000,
 __TAG_EXISTS_HEAD 0.000000, __TAG_EXISTS_HTML 0.000000, __TAG_EXISTS_META
 0.000000, __TO_MALFORMED_2 0.000000, __TO_NO_NAME 0.000000,
 __URI_EMAIL_IN_QUERY 0.000000, __URI_ENDS_IN_SLASH 0.000000,
 __URI_HAS_HYPHEN_USC 0.000000, __URI_IN_BODY 0.000000, __URI_MAILTO
 0.000000, __URI_NOT_IMG 0.000000, __URI_NS 0.000000, __URI_WITHOUT_PATH
 0.000000, __URI_WITH_PATH 0.000000, __X_FF_ASR_SCL_NSP 0.000000,
 __X_FF_ASR_SFV_NSPM 0.000000
X-Sophos-Email: [eu-central-1] Antispam-Engine: 6.0.3, AntispamData:
 2026.8.19.182719
X-Sophos-MH-Mail-Info-Key: NGhRWjRKMTlKeXpzV0NKLTE3Mi4yMC4wLjI0MA==
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5ccc8f7a-f80c-4472-acfd-08defe8838e2
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|376014|23010399003|36860700016|6049299003|7149299003|82310400026|1800799024|10067099003|56012099006|18002099003|11063799006|8096899003|4076899003|4053099003;
X-Microsoft-Antispam-Message-Info: NEgzr4k/i9UGBvEjtb4Ccr6/awhFQGp0Sxq4XilGSjdZ00W6z282VLFn6h4TimgGIWVI79NWal01mViJme6uCIpI8EPxs5ky2Z/F2t2G9gdQFASEHo8WNkynN/W6pVU+ROb3D3jtcH9Ekg3Vom3p/wvUlepVhVhPZDK1CoFcwQeK2r4Ls+4VXpw7Yo41FEg2l6PGmFeFnA9GnGYLEaoEZW6Bu7xUpmxr31MeHwg1AcJdAVVKgQZR4EITRvoJBQiagUFacYpFg2bBUO5rzCFa40JWlm8rvJLE0TVZQ6PR+o0OXYYM4KYS2IkrE+Kk8MzQc/7PWiMmRQtAd0jOnOrvumzJ2K4qsExZks3KhzHOTKhLenOSXq5qjsXTn791B3QzlCHRTbRptBmTP2zYOb5BdiMIlY7FEoRpFZXM1ZNkwtdPomWdoT/ZO9LIDLQP+K4tX5nUdGdp92bp42JWd5DYqXqhZTMU2dX3BJkuxfd8lGf5uL5eyqAcnvDtshE9osfC3jL+cXf6+s4/FKTkG5gOfqJhQS1au28yYRFIN5Y4b0LeCoFESBtYUtfnKcRVamF10aFwzrn/AKlPf5EKi8ZdRTorrrYlO3yavRuylP+RyLvZoDmBXiXLYHjyeZva0GDj2myL9EbFOcvl8tTcLFS5+g==
X-Forefront-Antispam-Report: CIP:94.140.18.226; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mfod-euc1.prod.hydra.sophos.com;
 PTR:mfod-euc1.prod.hydra.sophos.com; CAT:NONE;
 SFS:(13230040)(35042699022)(376014)(23010399003)(36860700016)(6049299003)(7149299003)(82310400026)(1800799024)(10067099003)(56012099006)(18002099003)(11063799006)(8096899003)(4076899003)(4053099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: r3xo4tKLy+88+O/zCjRNxuTxEpHavAgGwoe2El7d6C67jC+MU8iw32T3TVOQ/dHDbqgtBpNDh6rb6QemIMVkNssan9lN/wJpdNMX1TYKuygRnwEbiIkeN2lj+oIhuJZWL4cn68NX4SDziCFhqOwDgLxhMcnD7HLsXE/U8qmJUPVoNfhprYW7PvxPmcmvx1a6pyXtzYVTSr8JanGKVP3eUGCuPRxj87A/f6SKZ0L1KTiMzeZKSd2ICmwHovxQFVsi0Uyajuc5O4B4CgMXjzhYdoMpmzXjKBT+CplvXur3FmkIAMjXhq6fRsgeSmgDySR2psao3fVE/Ki1QcQd53tlqpVJVYzPctMqHKXdM8R7Shm6KJd280/puSjlM9/kAzlMoCd73isAlwNNa858L9oh4Klyuh8MqGd9ec1GQTT9XZlPtKsbiNpE5PtWMb8fVFJY
X-OriginatorOrg: rey-technology.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 06:57:04.3753 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0e8ea5-cb5e-458e-d027-08defe883e1f
X-MS-Exchange-CrossTenant-Id: 7137cfb5-c814-4224-8896-1b4a6ff99146
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=7137cfb5-c814-4224-8896-1b4a6ff99146; Ip=[94.140.18.226];
 Helo=[mfod-euc1.prod.hydra.sophos.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1PPFE824120AE
Subject: [Buildroot] [PATCH 0/5] package/libssh2: fix five security
 vulnerabilities
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
From: =?utf-8?q?Stefan_M=C3=BCller_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Stefan=20M=C3=BCller?= <stefan.mueller@rey-technology.com>
Content-Type: multipart/mixed; boundary="===============0365630571176096259=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0365630571176096259==
Content-Type: multipart/related;
	boundary="_ed5fc116-fec1-44f6-b173-8637f8346e4a_"

--_ed5fc116-fec1-44f6-b173-8637f8346e4a_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text -->
<style>.EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left: #800=
000 2px solid; }</style></head>
<body>
<font size=3D"2"><div class=3D"PlainText">This series backports fixes for f=
ive libssh2 security vulnerabilities<br>
affecting version 1.11.1.<br>
<br>
CVE-2025-15661 requires the upstream SFTP bounds checking fix, a<br>
LIBSSH2_UNCONST compatibility backport for libssh2 1.11.1, and the<br>
upstream follow-up fixing SSH_FXP_STATUS handling.<br>
<br>
The remaining four commits fix a dangling pointer in SFTP processing,<br>
AES-GCM bounds checking, a publickey out-of-bounds read, and a<br>
potential heap overflow in the ETM decrypt path.<br>
<br>
Matching LIBSSH2_IGNORE_CVES entries are added for all five CVEs.<br>
<br>
The patches were checked with check-package and git diff --check, and<br>
all patches apply successfully to libssh2 1.11.1.<br>
<br>
The fixes also apply to the 2025.02.x maintenance branch; each commit<br>
contains a corresponding Backport to: 2025.02.x note.<br>
<br>
Stefan M=C3=BCller (5):<br>
&nbsp; package/libssh2: fix CVE-2025-15661<br>
&nbsp; package/libssh2: fix CVE-2026-66032<br>
&nbsp; package/libssh2: fix CVE-2026-66033<br>
&nbsp; package/libssh2: fix CVE-2026-66034<br>
&nbsp; package/libssh2: fix CVE-2026-66035<br>
<br>
&nbsp;...-sftp-symlink-fix-out-of-bounds-read.patch | 116 &#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<b=
r>
&nbsp;...ibssh2-priv-backport-LIBSSH2_UNCONST.patch |&nbsp; 29 &#43;&#43;&#=
43;&#43;&#43;<br>
&nbsp;...-symlink-fix-SSH_FXP_STATUS-response.patch |&nbsp; 46 &#43;&#43;&#=
43;&#43;&#43;&#43;&#43;<br>
&nbsp;...-prevent-dangling-pointer-after-free.patch |&nbsp; 28 &#43;&#43;&#=
43;&#43;&#43;<br>
&nbsp;...08-openssl-fix-AES-GCM-bounds-checks.patch |&nbsp; 44 &#43;&#43;&#=
43;&#43;&#43;&#43;&#43;<br>
&nbsp;...009-publickey-fix-potential-OOB-read.patch |&nbsp; 35 &#43;&#43;&#=
43;&#43;&#43;&#43;<br>
&nbsp;...tential-heap-overflow-on-ETM-decrypt.patch |&nbsp; 41 &#43;&#43;&#=
43;&#43;&#43;&#43;&#43;<br>
&nbsp;package/libssh2/libssh2.mk&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 17 &#43;&#43;&#43;<br>
&nbsp;8 files changed, 356 insertions(&#43;)<br>
&nbsp;create mode 100644 package/libssh2/0004-sftp-symlink-fix-out-of-bound=
s-read.patch<br>
&nbsp;create mode 100644 package/libssh2/0005-libssh2-priv-backport-LIBSSH2=
_UNCONST.patch<br>
&nbsp;create mode 100644 package/libssh2/0006-sftp-symlink-fix-SSH_FXP_STAT=
US-response.patch<br>
&nbsp;create mode 100644 package/libssh2/0007-sftp-prevent-dangling-pointer=
-after-free.patch<br>
&nbsp;create mode 100644 package/libssh2/0008-openssl-fix-AES-GCM-bounds-ch=
ecks.patch<br>
&nbsp;create mode 100644 package/libssh2/0009-publickey-fix-potential-OOB-r=
ead.patch<br>
&nbsp;create mode 100644 package/libssh2/0010-transport-fix-potential-heap-=
overflow-on-ETM-decrypt.patch<br>
<br>
-- <br>
2.25.1<br>
<br>
</div></font>
<table id=3D"0.l4djlj4uy1d" style=3D"width: 660px;" cellspacing=3D"0" cellp=
adding=3D"0"><tbody><tr><td valign=3D"top" style=3D"font-family: Aptos, Cal=
ibri, Arial; font-size: 11pt; width: 10px;">&nbsp;<br></td><td valign=3D"to=
p" style=3D"width: 650px; font-family: Aptos, Calibri, Arial; font-size: 11=
pt;"><span style=3D"font-family: Aptos, Calibri, Arial;"><span style=3D"fon=
t-size: 10pt; font-family: Aptos, Calibri, Arial;"><span style=3D"font-fami=
ly: Aptos, Calibri, Arial; font-size: 10pt;"><p style=3D"font-family: Aptos=
, Calibri, Arial; font-size: 10pt; color: rgb(0, 108, 141);"><span style=3D=
"font-family: Aptos, Calibri, Arial; font-size: 10pt;"><span style=3D"font-=
family: Aptos, Calibri, Arial;"><span style=3D"font-size: 11pt; font-family=
: Aptos, Calibri, Arial;"><span style=3D"font-size: 11pt; font-family: Apto=
s, Calibri, Arial;"><span style=3D"font-size: 11pt; font-family: Aptos, Cal=
ibri, Arial;"><span style=3D"color: rgb(0, 0, 0); font-size: 11pt; font-fam=
ily: Aptos, Calibri, Arial;">Freundliche Gr&#xFC;sse</span></span><br style=
=3D"font-family: Aptos, Calibri, Arial; font-size: 11pt; color: rgb(0, 0, 0=
);"><br style=3D"font-family: Aptos, Calibri, Arial; font-size: 11pt; color=
: rgb(0, 0, 0);"><span style=3D"color: rgb(0, 0, 0); font-size: 11pt; font-=
family: Aptos, Calibri, Arial;">Stefan M&#xFC;ller</span></span></span><br =
style=3D"font-family: Aptos, Calibri, Arial; font-size: 11pt; color: rgb(0,=
 0, 0);"><br style=3D"font-family: Aptos, Calibri, Arial; font-size: 11pt; =
color: rgb(0, 0, 0);"><span style=3D"color: rgb(0, 108, 141); font-size: 11=
pt; font-family: Aptos, Calibri, Arial;"><span style=3D"font-size: 11pt; fo=
nt-family: Aptos, Calibri, Arial;"><span style=3D"font-size: 11pt; font-fam=
ily: Aptos, Calibri, Arial;"><span style=3D"font-size: 10pt; font-family: A=
ptos, Calibri, Arial;"><b style=3D"font-family: Aptos, Calibri, Arial;">REY=
 TECHNOLOGY AG</b></span></span></span></span><br style=3D"font-family: Apt=
os, Calibri, Arial; font-size: 10pt; color: rgb(0, 0, 0);"><span style=3D"c=
olor: rgb(0, 0, 0); font-size: 10pt; font-family: Aptos, Calibri, Arial;">R=
&#xFC;tihofstrasse 6, CH-8370 Sirnach</span><br style=3D"font-family: Aptos=
, Calibri, Arial; font-size: 10pt; color: rgb(0, 0, 0);"><br style=3D"font-=
family: Aptos, Calibri, Arial; font-size: 10pt; color: rgb(0, 0, 0);"><span=
 style=3D"color: rgb(0, 0, 0); font-size: 10pt; font-family: Aptos, Calibri=
, Arial;">Stefan M&#xFC;ller | CTO</span><br style=3D"font-family: Aptos, C=
alibri, Arial; font-size: 10pt; color: rgb(0, 0, 0);"><span style=3D"color:=
 rgb(0, 0, 0); font-size: 10pt; font-family: Aptos, Calibri, Arial;">Direct=
 +41 58 810 04 82 | Support +41 58 810 04 04</span></span><br style=3D"font=
-family: Aptos, Calibri, Arial; font-size: 10pt; color: rgb(0, 0, 0);"><spa=
n style=3D"font-size: 11pt; font-family: Aptos, Calibri, Arial;"><span styl=
e=3D"color: rgb(0, 0, 0); font-size: 11pt; font-family: Aptos, Calibri, Ari=
al;"><span style=3D"color: rgb(0, 108, 141); font-size: 10pt; font-family: =
Aptos, Calibri, Arial;"><a href=3D"mailto:stefan.mueller@rey-technology.com=
" style=3D"font-family: Aptos, Calibri, Arial;"><span style=3D"color: rgb(0=
, 108, 141); font-family: Aptos, Calibri, Arial;">stefan.mueller@rey-techno=
logy.com</span></a> </span><span style=3D"font-size: 10pt; font-family: Apt=
os, Calibri, Arial;">| <span style=3D"color: rgb(0, 108, 141); font-family:=
 Aptos, Calibri, Arial;"></span></span><span style=3D"color: rgb(0, 108, 14=
1); font-size: 11pt; font-family: Aptos, Calibri, Arial;"><span style=3D"fo=
nt-size: 11pt; font-family: Aptos, Calibri, Arial;"><span style=3D"font-siz=
e: 11pt; font-family: Aptos, Calibri, Arial;"><span style=3D"font-size: 10p=
t; font-family: Aptos, Calibri, Arial;"><a href=3D"https://rey-technology.c=
om" title=3D"" style=3D"color: rgb(0, 108, 141); font-family: Aptos, Calibr=
i, Arial;">rey-technology.com</a>&nbsp;</span></span></span></span></span><=
/span></span></p><p style=3D"font-family: Aptos, Calibri, Arial; font-size:=
 10pt; color: rgb(0, 108, 141);"><span style=3D"font-family: Aptos, Calibri=
, Arial; font-size: 10pt;"><span style=3D"font-size: 11pt; font-family: Apt=
os, Calibri, Arial;"><span style=3D"color: rgb(0, 0, 0); font-size: 11pt; f=
ont-family: Aptos, Calibri, Arial;"><span style=3D"color: rgb(0, 108, 141);=
 font-size: 11pt; font-family: Aptos, Calibri, Arial;"><span style=3D"font-=
size: 11pt; font-family: Aptos, Calibri, Arial;"><span style=3D"font-size: =
11pt; font-family: Aptos, Calibri, Arial;"><span style=3D"font-size: 10pt; =
font-family: Aptos, Calibri, Arial;"><a class=3D"socialLink" href=3D"https:=
//www.linkedin.com/company/rey-technology" style=3D"font-family: Aptos, Cal=
ibri, Arial;"><img src=3D"cid:linkedinmedium_e5ee0685-3767-4ffd-a5c5-9e4e3f=
c32352.png" class=3D"socialLink" style=3D"width: 25px; height: 25px; font-f=
amily: Aptos, Calibri, Arial;" width=3D"25" height=3D"25"></a>&nbsp;&nbsp; =
<a class=3D"socialLink" href=3D"https://www.instagram.com/reytechnology_com=
/" style=3D"font-family: Aptos, Calibri, Arial;"><img src=3D"cid:instagramm=
edium_908c8ebd-b03d-4881-a6e2-043808ead83d.png" class=3D"socialLink" style=
=3D"width: 25px; height: 25px; font-family: Aptos, Calibri, Arial;" width=
=3D"25" height=3D"25"></a>&nbsp; &nbsp;<a class=3D"socialLink" href=3D"http=
s://teams.microsoft.com/l/chat/0/0?users=3Dstefan.mueller@rey-technology.co=
m" style=3D"font-family: Aptos, Calibri, Arial;"><img src=3D"cid:teamsmediu=
m_9934c99a-98a5-42b7-9a66-2bebfdd7ebf1.png" class=3D"socialLink" style=3D"w=
idth: 25px; height: 25px; font-family: Aptos, Calibri, Arial;" width=3D"25"=
 height=3D"25"></a></span></span></span></span></span></span></span></p></s=
pan></span></span></td></tr></tbody></table></body>
</html>

--_ed5fc116-fec1-44f6-b173-8637f8346e4a_
Content-Description: linkedinmedium_e5ee0685-3767-4ffd-a5c5-9e4e3fc32352.png
Content-Type: image/png;
	name="linkedinmedium_e5ee0685-3767-4ffd-a5c5-9e4e3fc32352.png"
Content-Disposition: inline;
	filename="linkedinmedium_e5ee0685-3767-4ffd-a5c5-9e4e3fc32352.png"
Content-Transfer-Encoding: base64
Content-ID: <linkedinmedium_e5ee0685-3767-4ffd-a5c5-9e4e3fc32352.png>

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

--_ed5fc116-fec1-44f6-b173-8637f8346e4a_
Content-Description: instagrammedium_908c8ebd-b03d-4881-a6e2-043808ead83d.png
Content-Type: image/png;
	name="instagrammedium_908c8ebd-b03d-4881-a6e2-043808ead83d.png"
Content-Disposition: inline;
	filename="instagrammedium_908c8ebd-b03d-4881-a6e2-043808ead83d.png"
Content-Transfer-Encoding: base64
Content-ID: <instagrammedium_908c8ebd-b03d-4881-a6e2-043808ead83d.png>

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

--_ed5fc116-fec1-44f6-b173-8637f8346e4a_
Content-Description: teamsmedium_9934c99a-98a5-42b7-9a66-2bebfdd7ebf1.png
Content-Type: image/png;
	name="teamsmedium_9934c99a-98a5-42b7-9a66-2bebfdd7ebf1.png"
Content-Disposition: inline;
	filename="teamsmedium_9934c99a-98a5-42b7-9a66-2bebfdd7ebf1.png"
Content-Transfer-Encoding: base64
Content-ID: <teamsmedium_9934c99a-98a5-42b7-9a66-2bebfdd7ebf1.png>

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
615O/QJTAQAAAABJRU5ErkJggg==

--_ed5fc116-fec1-44f6-b173-8637f8346e4a_--

--===============0365630571176096259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0365630571176096259==--
