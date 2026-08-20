Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C842EC5DF85
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 06:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6928D40585;
	Thu, 20 Aug 2026 06:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ExJ1nF-QexAe; Thu, 20 Aug 2026 06:57:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787209034;
	bh=ujBusOxtT572DfpeGHzp24zqrIQioaFuSRX6/BhStDU=;
	h=To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=acxwN9Q+y320Ggylq0tkfnM2x33Gu55gAevD1MCqo6vejmBPB4bI+/SSc1rorYng3
	 ifNWDNthTkEchOCADczctI6PPGOM7pOULUvKEmDlbVew/nsEZTAfohzAZDNPh+C2Js
	 EeNamvKQHrS1MkK4oSqVuBuIm90ZvbErj09zo0A4kTO7wdEZYZ0LFopQb/VADt1yux
	 IR4an2ulbNidVJqgU0Hw/VjyDBqv9Yr7aevGeGxhgEO6sQobZbjaTMBZzzvgIa2O7U
	 sCQyaZIP6Wu63WqReIAftZf7mG72CgBBfoybtlJgQ4UkWqEz/xu3MHFPnIrFBmAtAR
	 6CEJ3JxDw4lKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EC4640586;
	Thu, 20 Aug 2026 06:57:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9BC81F3D
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 06:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0A4440581
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 06:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3c1_nxta09f for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 06:57:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c213::2;
 helo=zrzp278cu001.outbound.protection.outlook.com;
 envelope-from=stefan.mueller@rey-technology.com; receiver=<UNKNOWN> 
Received: from ZRZP278CU001.outbound.protection.outlook.com
 (mail-switzerlandnorthazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c213::2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43F664057E
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 06:57:07 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gBdgwPrecJcGzobw5Lve/8UnQY9LLJ+zmxlRg7d7DYM5yoVs2DdM4zTtfKPx6fvJjyEjWQT7wUwZ/wqo+MmrcAxRLWmqxdeK3/2I8TSFvYD11QM0J91hkYf3KKMwC3UGGcJFxfdyX8Y4krJMMaG29baxsWfavo241NrnCHhQhIhosTBtivtWb/fSZ2tcHmZDl4HwlHPBBuwjsN5sytdHh6THT5zJnEihcRzoYOm8IyNaP/xb0eSkz3csYW54DzhdYd0cDTFGE/lnqx/uJ5pjrdQyWgZJELKiLonZkTAr3GO4S+qTEvlB4U3hg8vCQkAYL2RB0J01oVNRjelInD4hXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++o2BvIB/8AaNpzvM1gpBo/lsowsrPH8p2GO0eHD6Xs=;
 b=O6yla9nqbDMTBmIh3LCUgjIIkEyeleyM5jZwHHKE3UQm79qzr84yk9jKmFvrhfU5SlUZb91ICQvLpZ3XWOI253/QU3VdZfqLS2zDhepR2/oU2OyLFcVCRhygHc8LUe4MrBk2Upwoh8BI4nzipFiKGYp3tb2eewgcnR7vv3MbfuedIyvxQxAzd3dW4hFRtDeHCuNZFopgjygY90UIkXP+8rcddqDmPitgUj1GVKRfmPbVoeSVvCTixBJIdY/Z53+B1vuweYmlh9keJbX7Ium0ZY+ZFfMaiv+0w8aGs1tsg4dLvMGVWHE2xVtbnSZSP1L7Fu44uHwc05mqwlNwYbX9VA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 94.140.18.225) smtp.rcpttodomain=buildroot.org
 smtp.mailfrom=rey-technology.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=rey-technology.com; dkim=pass (signature was
 verified) header.d=rey-technology.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=rey-technology.com]
 dmarc=[1,1,header.from=rey-technology.com])
Received: from AS4P190CA0015.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::19)
 by ZR1P278MB1233.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:6b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 06:57:01 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5de:cafe::2c) by AS4P190CA0015.outlook.office365.com
 (2603:10a6:20b:5de::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.9 via Frontend Transport; Thu, 20
 Aug 2026 06:57:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 94.140.18.225)
 smtp.mailfrom=rey-technology.com; dkim=pass (signature was verified)
 header.d=rey-technology.com;dmarc=pass action=none
 header.from=rey-technology.com;
Received-SPF: Fail (protection.outlook.com: domain of rey-technology.com does
 not designate 94.140.18.225 as permitted sender)
 receiver=protection.outlook.com; client-ip=94.140.18.225;
 helo=mfod-euc1.prod.hydra.sophos.com;
Received: from mfod-euc1.prod.hydra.sophos.com (94.140.18.225) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 06:57:00 +0000
Received: from localhost (ip-172-20-1-109.eu-central-1.compute.internal
 [127.0.0.1])
 by mfod-euc1.prod.hydra.sophos.com (Postfix) with ESMTP id 4hQZ4D1dqszlZrn
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 06:57:00 +0000 (UTC)
X-Sophos-Product-Type: Mailflow
X-Sophos-Email-ID: baf5dd8680a44bd08b69706b9be38fc1
Received: from ZRAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandnorthazon11020084.outbound.protection.outlook.com
 [52.101.186.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mf-outbound-eu-central-1.prod.hydra.sophos.com (Postfix) with ESMTPS id
 4hQZ4C0DL1znTVV
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 06:56:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPOFK5JPDKNd2h4XLihsHH10NvFaKFnADXre3fx6vdSqOer0zZJQOlPQLaMjPHRTdRVSgFuD1Akyptejl12kB6BX0FT2DEolS/G3HwA0k8rNw1EDqA8c++DY1NSRD277DvYDh1eLR78Wu4J2Ckco5uBq4Qzlv78UC5svAIIIGNqS+rzyX9fOgSbn6KUY1Tbp7PI6s/CXiirxha/LQsANekU5tS0hx7KDWnrb8KXBzVzVAKzgzblRGrHClgTtIWzmPVwQ1nqCPFNBpHvleQ60/8GeGxxE+SOiZPmOnZXxZ33JZ5FGLkfVQu+Ih4nZlDM2ykEXzNem1qCWBb/wW7gLkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++o2BvIB/8AaNpzvM1gpBo/lsowsrPH8p2GO0eHD6Xs=;
 b=BzLYniPcR2Gr3g6eoRpBuhKCV55NzPjaYZdureBT39U+vhTRtHJX9/U1/vLvoZXVf854ZR+cv8mZefoQQ4umTZ8rxuam4iPHexR6/JCM6qGlm+fduhfBrLg2S+MgCZdk5UhOUQE5gTLc5uG5PWwii4u8wF6ESXMMxhlGEjaoJTMX73ZmO5WLgy6SwaPIkj+tU2wUxzwyo64rCYejVtlmi2wfjT31tKrTdaCKCUkPFXcpafz0c2elSfLxDmeZGlC3eHUwaIrP0YQ8xDgJieFtXnbKLtLt9DXeFpVmpTZsIU4hmlsR6kRnsSQc3AaO8JCHfVwV7oBBhw2PS2US2Se42g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.79.220.33) smtp.rcpttodomain=buildroot.org
 smtp.mailfrom=rey-technology.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=rey-technology.com; dkim=none (message not signed);
 arc=none (0)
Received: from DU2P251CA0016.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::18)
 by GV0P278MB1945.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:6c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 06:56:54 +0000
Received: from DU6PEPF0000B61E.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::84) by DU2P251CA0016.outlook.office365.com
 (2603:10a6:10:230::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 06:56:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.220.33)
 smtp.mailfrom=rey-technology.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=rey-technology.com;
Received-SPF: Pass (protection.outlook.com: domain of rey-technology.com
 designates 20.79.220.33 as permitted sender) receiver=protection.outlook.com; 
 client-ip=20.79.220.33; helo=de1-emailsignatures-cloud.codetwo.com; pr=C
Received: from de1-emailsignatures-cloud.codetwo.com (20.79.220.33) by
 DU6PEPF0000B61E.mail.protection.outlook.com (10.167.8.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 06:56:54 +0000
Received: from ZRZP278CU001.outbound.protection.outlook.com (40.93.85.25) by
 de1-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via
 SMTP; Thu, 20 Aug 2026 06:56:53 +0000
Received: from DU7PR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::15) by ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:5d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 06:56:48 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::a0) by DU7PR01CA0012.outlook.office365.com
 (2603:10a6:10:50f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.9 via Frontend Transport; Thu, 20
 Aug 2026 06:56:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.196.177.45)
 smtp.mailfrom=rey-technology.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=rey-technology.com;
Received-SPF: Pass (protection.outlook.com: domain of rey-technology.com
 designates 213.196.177.45 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.196.177.45;
 helo=mailrelay.reygruppe.ch; pr=C
Received: from mailrelay.reygruppe.ch (213.196.177.45) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Thu, 20 Aug 2026 06:56:48 +0000
Received: from build.reycloud.net (unknown [172.20.60.115])
 by mailrelay.reygruppe.ch (Postfix) with ESMTP id 8BF5D801D1;
 Thu, 20 Aug 2026 08:56:47 +0200 (CEST)
To: buildroot@buildroot.org
CC: =?UTF-8?q?Stefan=20M=C3=BCller?= <stefan.mueller@rey-technology.com>
Date: Thu, 20 Aug 2026 06:56:44 +0000
Message-ID: <20260820065646.375321-4-stefan.mueller@rey-technology.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260820065646.375321-1-stefan.mueller@rey-technology.com>
References: <20260820065646.375321-1-stefan.mueller@rey-technology.com>
 <4e118c97-1508-4315-bc90-2b0b02fc43b2.a680deba-e8f9-456f-ab7c-ac325426e0a3.385933aa-09b2-4431-baec-9ee78b4235ec@emailsignatures365.codetwo.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 2
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|ZR2P278MB1053:EE_|DU6PEPF0000B61E:EE_|GV0P278MB1945:EE_|AM3PEPF00009B9C:EE_|ZR1P278MB1233:EE_
X-MS-Office365-Filtering-Correlation-Id: 400be4e8-911a-4851-2361-08defe883bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|10067099003|56012099006|18002099003|11063799006|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info-Original: LAX9VcdEtL61p7K6N1zQOrG7bQPOao80d0/3yE4RyK1GOaAsCN4fBeMvgzSmEAlPH+cLoy2gP4po3bTY1pV+AKx4oCJkL5atejKQQI4OHdrvFtm0V1a0Ph6JRU4cShYCnJ6+9oHUitGc79fdcP56BDrSREObcwlMx8OXXiYQeFwoNzT3iJjTnzuKc6hC7qlq8X/2liLDMb+T/gloEBEzuPXYTlqjUcncrEm9WXBW+hB4G8ARYZTzzk/2A/HQ9FMlng+6PhOhOWei/6wtspdOTwdUvVE9hRWs5u1pTX+Lpdf48/NJpS1uyEkn5txhU+9oz/cgK877kVyOzS+9V8MNRQcFFQyNDLuPRvjLeX/QbJDB6vHnZ7ay2yJ8fzMEePMPbpBZfBRd2e3CopwHj90Q8NSACjLRBw1hSGjGiWVtdJmhaWr1dNXKPQb5aOFe1wTke1nXQxrEvZvSkePP0jKkYNL/GmSnn8nPjst26rtdkdXyQcQ/2O8Dq3dcAL/CkD5SmD96dyHZ4GEb961G8g6ba0iF8GW4MNGNTL2FT6oVVog9Umn/CGcr8fbHJvVG7xXC2vmQ0RyMTcu2TkiAFftINExuGUFRYXgJGrFeNDdA5rW6RAENvVJTIoqO0zI/Oqv30ZNhETw4N9m78GxC6u8UI9xP1uy5/czrKbglIFXQ0rFptmOwF59E+diF5PsFKPIBsrA3FTJSgMwA4K3WgTmmRg==
X-Forefront-Antispam-Report-Untrusted: CIP:213.196.177.45; CTRY:CH; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:mailrelay.reygruppe.ch;
 PTR:ftth-177-045.tbwil.ch; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(10067099003)(56012099006)(18002099003)(11063799006)(22082099003)(13003099007);
 DIR:OUT; SFP:1102; 
X-Exchange-RoutingPolicyChecked: dyAyKdJdCCapdJwGQgrjBV+B7B01LL0TKCA6aP64lAF8oL2ZkxxHL1/fJIO7pVvWyMlZCeRUzmhFtaTGUBlb/31Gle2oPCAn50qvJ/43z0RU53aVdg6RCLUQ3j+G45+GkQA3KHrjMyblaxDJV7cbBg4d0urHbzUTAOY9mb1XOevM8+AaXBDE2oigHrwMW4+jz1vZSslP9g02nlRKuiiJ7RzlNIV8qK8bKLBAAIa0/4YGfp2K+ydWN33fx9+oi0+m+aC9qv+azaSiOp/Wit+C8lewMzjF0S4zYHTPzHjKKw0kW7nPJfjWP1CLWsgZ+bpkghqo5Gn4XsSflF7rHzbDrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR2P278MB1053
X-CodeTwo-MessageID: f46233ec-371d-4c29-a90b-81a84492db4c.20260820065653@de1-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0bb775d5-3db1-4b0f-7e08-08defe883476
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|14060799003|35042699022|23010399003|376014|82310400026|6049299003|7149299003|1800799024|36860700016|13003099007|4053099003|56012099006|10067099003|4143699003|11063799006|4076899003|8096899003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: WLZ33X+SLLjlqBX/bic0aGWO1yXLOpOw5f1uo+UrwUFnYzpLVjLzOUzyi619UldyAuunu7N7qiGT9OzFouPaS4w+Xkz7yKU6MKmD2LF7IV6JZTGTHFUDkWaPy2ELehyjHTqplB9BHvsYETexaanrUNm0/0KMuwLjKDfuV9MwLdj1GULrJYtDOtPG4u48/UMrOe+yRegvfFXx/No4SbvVFAOn6XacMfDi2HOEx4+1XMcpRuB1+j0Ki3/2/wmiHjFIrzwRn7aw783gIXFNNG9P1rdrqzyGPJk7u2/Qs0VxARdDcRuGmbf6p4UbLwLtyaqF09tUTLyU7qwfPNqsiQDycPwgUft9+jV868zZ3RHopTYry5raBmm0acLiYa6QHNyhhllT9zD2bqOD/ZVvpw60tr0P909zu4+n6aYwVyMpfe7IbBw86cJ6AdsyEfacEMPEY4gM/NFtGeHovRYtNSL5/hHY2HDao/ewl9mWHowTwiRNK7Rtu7w+v6NCHOvZ8TIIoGidWoQ6Mn8KBPXffaXqEGzVhWSJq686DDnXlNN5j9Jl1WZCjxk3tlFKTq8cTquYWvltnBOKENEV7EvPjGZggCvvauHceE40fVEZhhd2dgSbfY4jLcByWokRJPhjmONeqVvgEctK2avFIr6YLe6SVg==
X-Forefront-Antispam-Report-Untrusted: CIP:20.79.220.33; CTRY:DE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:de1-emailsignatures-cloud.codetwo.com;
 PTR:de1-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(14060799003)(35042699022)(23010399003)(376014)(82310400026)(6049299003)(7149299003)(1800799024)(36860700016)(13003099007)(4053099003)(56012099006)(10067099003)(4143699003)(11063799006)(4076899003)(8096899003)(18002099003)(22082099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1945
X-Lased-Impersonation: False
X-Lased-Hits: BODYTEXTH_SIZE_3000_MORE 0.000000, BODY_SIZE_10000_PLUS
 0.000000, DKIM_ALIGNS 0.000000, DKIM_SIGNATURE 0.000000, HTML_50_70
 0.100000, IMG_AR_1 0.000000, IMG_ATTACHED_2P 0.000000, IMP_FROM_NOTSELF
 0.000000, INVOICE_ATTACHMENT 0.100000, IN_REP_TO 0.000000, LEGITIMATE_SIGNS
 0.000000, LINK_TO_IMAGE 0.000000, MULTIPLE_ATTACHMENTS 0.000000,
 MULTIPLE_REAL_RCPTS 0.000000, NO_FUR_HEADER 0.000000, OUTBOUND 0.000000,
 OUTBOUND_SOPHOS 0.000000, PNG_PIXPERBYTE_LOW 0.000000, REFERENCES 0.000000,
 SUSP_DH_NEG 0.000000, __ANY_URI 0.000000, __ARCAUTH_DKIM_NONE 0.000000,
 __ARCAUTH_DMARC_PASSED 0.000000, __ARCAUTH_PASSED 0.000000,
 __ARC_SEAL_MICROSOFT 0.000000, __ARC_SIGNATURE_MICROSOFT 0.000000,
 __ATTACH_CTE_BASE64 0.000000, __ATTACH_CTE_QUOTED_PRINTABLE 0.000000,
 __BODY_TEXT_X4 0.000000, __BULK_NEGATE 0.000000, __CC_NAME 0.000000,
 __CC_NAME_DIFF_FROM_ACC 0.000000, __CC_REAL_NAMES 0.000000,
 __COURIER_PHRASE 0.000000, __CP_URI_IN_BODY 0.000000, __CT 0.000000,
 __CTYPE_HAS_BOUNDARY 0.000000, __CTYPE_MULTIPART 0.000000, __DKIM_ALIGNS_1
 0.000000, __DKIM_ALIGNS_2 0.000000, __DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR
 0.000000, __DQ_NEG_IP 0.000000, __EMBEDDED_IMG 0.000000,
 __EXTRA_MPART_TYPE_N1 0.000000, __FILESHARE_PHRASE 0.000000,
 __FRAUD_MONEY_CURRENCY 0.000000, __FRAUD_MONEY_CURRENCY_DOLLAR 0.000000,
 __FROM_DOMAIN_IN_ANY_CC1 0.000000, __FROM_DOMAIN_IN_RCPT 0.000000,
 __FROM_ENCODED 0.000000, __FROM_NAME_NOT_IN_BODY 0.000000, __FROM_UTF_Q
 0.000000, __FUR_RDNS_SOPHOS 0.000000, __HAS_ATTACHMENT 0.000000,
 __HAS_ATTACHMENT1 0.000000, __HAS_ATTACHMENT2 0.000000, __HAS_CC_HDR
 0.000000, __HAS_FROM 0.000000, __HAS_HTML 0.000000, __HAS_MSGID 0.000000,
 __HAS_REFERENCES 0.000000, __HAS_X_FF_ASR 0.000000, __HAS_X_FF_ASR_CAT
 0.000000, __HAS_X_FF_ASR_SFV 0.000000, __HAS_X_MAILER 0.000000,
 __HIGHBIT_ASCII_MIX 0.000000, __HREF_LABEL_IMG 0.000000, __HREF_LABEL_TEXT
 0.000000, __HREF_LABEL_URI 0.000000, __HTML_AHREF_TAG 0.000000,
 __HTML_ENTITIES_X4 0.000000, __HTML_HREF_TAG_X2 0.000000, __HTML_TAG_DIV
 0.000000, __HTML_TAG_IMG_X2 0.000000, __HTML_TAG_TABLE 0.000000,
 __HTTPS_URI 0.000000, __IMG_ATTACHED 0.000000, __IMG_SIZE_1K_10K 0.000000,
 __IMG_THEN_TEXT 0.000000, __IMP_FROM_MY_ORG 0.000000, __IMP_FROM_NOTSELF
 0.000000, __INVOICE_MULTILINGUAL 0.000000, __IN_REP_TO 0.000000,
 __JSON_HAS_SCHEMA_VERSION 0.000000, __JSON_HAS_TENANT_DOMAINS 0.000000,
 __JSON_HAS_TENANT_ID 0.000000, __JSON_HAS_TENANT_SCHEMA_VERSION 0.000000,
 __JSON_HAS_TENANT_VIPS 0.000000, __JSON_HAS_TRACKING_ID 0.000000,
 __MIME_ATTACHMENT_1_N 0.000000, __MIME_ATTACHMENT_N_2 0.000000,
 __MIME_ATTACHMENT_N_3 0.000000, __MIME_ATTACHMENT_N_4 0.000000, __MIME_HTML
 0.000000, __MIME_TEXT_H 0.000000, __MIME_TEXT_H1 0.000000, __MIME_TEXT_H2
 0.000000, __MIME_VERSION 0.000000, __MSGID_DOMAIN_IN_REFERENCES 0.000000,
 __MULTIPLE_URI_HTML 0.000000, __MULTIPLE_URI_TEXT 0.000000,
 __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
 __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __PART_2_IMAGE_PNG 0.000000,
 __PNG_AR_1 0.000000, __PRODUCT_TYPE_MAILFLOW 0.000000, __RCVD_NO_PTR
 0.000000, __RCVD_PASS 0.000000, __REFERENCES 0.000000, __SANE_MSGID
 0.000000, __SCAN_D_NEG2 0.000000, __SCAN_D_NEG_HEUR2 0.000000, __SL_HEAVY
 0.000000, __STYLE_RATWARE_NEG 0.000000, __STYLE_TAG 0.000000,
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
X-Lased-Spam: NonSpam
X-Lased-Spamprobability: 0.083173
X-Sophos-Mailflow-Processing-Id: 955324cce54f42eea7b9245fbc9b747c
X-Sophos-MH-Mail-Info-Key: NGhRWjREMWRxc3psWnJuLTE3Mi4yMC4xLjEwOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3215230d-25cd-41a1-607b-08defe88381f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|6049299003|82310400026|23010399003|1800799024|35042699022|36860700016|7149299003|376014|10067099003|56012099006|18002099003|11063799006|4143699003|22082099003|4076899003|8096899003|13003099007|4053099003;
X-Microsoft-Antispam-Message-Info: UbyTzxSiAYKuIoHGBAcSwJVHy1tgZ0EZIx2I4fJQUqW0Pw+eUhwE4bRwb31SKi2iRYJgy97nzdWW8Pirytpt8C3zPxaPC3iWhv2T2qvn8elhf2bmC8Xx2vbpuqlcEDV3h9RICt5IWcrQtQWIH2BGmofIRNtDilynEAtv1xSMmdFV2iqLImhlTLL7Rj1s5HAGp49l4GhEhaeLyUkEuSCP8k8xTJc5hvWQ+oVZs2WC973/fVY4qAr1yyF5ZVte2gxKgmjgNNxaaEyiBovP6T4PvT2totO8J26Rm3WT76Nqss3IX3mg9Akx4nONMlWkrVFXdPiB+GU209wmc1tpPT6ISiCqWibSwEozQHrXbSSqFnjgTurRJVWiJ8bEaIix+ymZ966c6PrGzYkXn6m4y9AN0eDOjG7FKACTviiNbGM42lr0F5N8tBUtr4vQj4UouIPTwz8o0OOll0CSR6xF1gdhRBp5u072OysiZDs8H4aP3cY+rnYA3FkecyxGnsx/s9NFByJ2PnndSkJeThZACr6jPrUEvlEmHAOU8MSg1SwrOw0IezEzhqjRkBqxS0eKbwqgVPqehgcO9YZHDGUgp1NRb5CEcCj64Y/eb2Jq0fh/5PjXP6BLOpo5mOG9OJIjwfXjjHo1YQTEG+opwGlV7YBWpA==
X-Forefront-Antispam-Report: CIP:94.140.18.225; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mfod-euc1.prod.hydra.sophos.com;
 PTR:mfod-euc1.prod.hydra.sophos.com; CAT:NONE;
 SFS:(13230040)(6049299003)(82310400026)(23010399003)(1800799024)(35042699022)(36860700016)(7149299003)(376014)(10067099003)(56012099006)(18002099003)(11063799006)(4143699003)(22082099003)(4076899003)(8096899003)(13003099007)(4053099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dWGXhinuo4NOn/9eAbDFqwZ6U9sDMeTXzVOQ74sy+u2BuTuWm/HO/rXxgJYGIUoJTWvCnDPKfptmvs9AXPNBeu/j6gUGGAqIH5n+0Zgdc9emZ0L0j3cT1lh5tNmoZ2yPFXB4KlMT2OhoEpabOL8ApQRr5vFMdnHtb4vVcq2bmUlgrxjBm7876K7YyPwWGd02qeASOY4YgSzVcdN8LvFOwyemVyyCAaTsx0Q0euKBbPWIrG7KCxLriNbPbXCA+pO/63Ev4ldmjyk7VMtcEq72F0lOBmUQjyxCBI1s00TRCIhRGAvqLNhkC/xvSzgY+qB3V9QAuMyDN35coEFMiBzH+eNkEtJ364jqYeVHmiDW94pDKWaEZDHE7WjzV16uRV1aFdWl/T7OapT0qrjTdCKh+K8JOQk3mrdRjaTR48Yra67zBTWoRLZj/kEmlko1kJ/C
X-OriginatorOrg: rey-technology.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 06:57:00.4387 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 400be4e8-911a-4851-2361-08defe883bc6
X-MS-Exchange-CrossTenant-Id: 7137cfb5-c814-4224-8896-1b4a6ff99146
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=7137cfb5-c814-4224-8896-1b4a6ff99146; Ip=[94.140.18.225];
 Helo=[mfod-euc1.prod.hydra.sophos.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1233
Subject: [Buildroot] [PATCH 3/5] package/libssh2: fix CVE-2026-66033
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
Content-Type: multipart/mixed; boundary="===============1680579258240789581=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1680579258240789581==
Content-Type: multipart/related;
	boundary="_be10d81b-7caa-4ccb-b36d-e8822fbd15b7_"

--_be10d81b-7caa-4ccb-b36d-e8822fbd15b7_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text -->
<style>.EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left: #800=
000 2px solid; }</style></head>
<body>
<font size=3D"2"><div class=3D"PlainText">Backport the fix for CVE-2026-660=
33.<br>
<br>
The OpenSSL AES-GCM cipher path lacks runtime bounds checks around the<br>
input block size. A malformed packet can therefore lead to an<br>
out-of-bounds read or write.<br>
<br>
Use Debian's libssh2 1.11.1 backport of the upstream fix.<br>
<br>
Signed-off-by: Stefan M=C3=BCller &lt;stefan.mueller@rey-technology.com&gt;=
<br>
---<br>
Backport to: 2025.02.x<br>
---<br>
&nbsp;...08-openssl-fix-AES-GCM-bounds-checks.patch | 44 &#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;<br>
&nbsp;package/libssh2/libssh2.mk&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 3 &#43;&#43;<br>
&nbsp;2 files changed, 47 insertions(&#43;)<br>
&nbsp;create mode 100644 package/libssh2/0008-openssl-fix-AES-GCM-bounds-ch=
ecks.patch<br>
<br>
diff --git a/package/libssh2/0008-openssl-fix-AES-GCM-bounds-checks.patch b=
/package/libssh2/0008-openssl-fix-AES-GCM-bounds-checks.patch<br>
new file mode 100644<br>
index 0000000000..fdb78a1695<br>
--- /dev/null<br>
&#43;&#43;&#43; b/package/libssh2/0008-openssl-fix-AES-GCM-bounds-checks.pa=
tch<br>
@@ -0,0 &#43;1,44 @@<br>
&#43;From a2ed82d40964bbc0d64cd717aa0a5a892117d2e6 Mon Sep 17 00:00:00 2001=
<br>
&#43;From: Viktor Szakats &lt;commit@vsz.me&gt;<br>
&#43;Date: Thu, 23 Jul 2026 10:32:04 &#43;0200<br>
&#43;Subject: [PATCH] openssl: fix potential OOB read/write with AES-GCM in=
<br>
&#43; `ssh2_cipher_crypt()`<br>
&#43;<br>
&#43;By applying two bounds checks to non-debug builds.<br>
&#43;<br>
&#43;Reported-by: Vladimir Eli Tokarev<br>
&#43;Fixes GHSA-c4f7-cvfc-33j7<br>
&#43;Follow-up to 3c953c05d67eb1ebcfd3316f279f12c4b1d600b4 #797<br>
&#43;<br>
&#43;Closes #2401<br>
&#43;Forwarded: not-needed<br>
&#43;<br>
&#43;CVE: CVE-2026-66033<br>
&#43;Upstream: <a href=3D"https://github.com/libssh2/libssh2/commit/a2ed82d=
40964bbc0d64cd717aa0a5a892117d2e6">https://github.com/libssh2/libssh2/commi=
t/a2ed82d40964bbc0d64cd717aa0a5a892117d2e6</a><br>
&#43;Signed-off-by: Stefan M=C3=BCller &lt;stefan.mueller@rey-technology.co=
m&gt;<br>
&#43;---<br>
&#43; src/openssl.c | 10 &#43;&#43;&#43;&#43;&#43;&#43;----<br>
&#43; 1 file changed, 6 insertions(&#43;), 4 deletions(-)<br>
&#43;<br>
&#43;--- a/src/openssl.c<br>
&#43;&#43;&#43;&#43; b/src/openssl.c<br>
&#43;@@ -1042,13 &#43;1042,15 @@<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; const int aadlen =3D (is_aesgcm &amp;&amp; IS=
_FIRST(firstlast)) ? 4 : 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; /* size of AT, if present */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; const int authenticationtag =3D IS_LAST(first=
last) ? authlen : 0;<br>
&#43;-&nbsp;&nbsp;&nbsp; /* length to encrypt */<br>
&#43;-&nbsp;&nbsp;&nbsp; const int cryptlen =3D (unsigned int)blocksize - a=
adlen - authenticationtag;<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; unsigned int cryptlen; /* length to encrypt */=
<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; (void)algo;<br>
&#43;<br>
&#43;-&nbsp;&nbsp;&nbsp; assert(blocksize &lt;=3D sizeof(buf));<br>
&#43;-&nbsp;&nbsp;&nbsp; assert(cryptlen &gt;=3D 0);<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; if(blocksize &gt; sizeof(buf) ||<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blocksize &lt; (size_t)(aadl=
en &#43; authenticationtag))<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 1;<br>
&#43;&#43;<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; cryptlen =3D (unsigned int)blocksize - aadlen =
- authenticationtag;<br>
&#43;<br>
&#43; #if LIBSSH2_AES_GCM<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; /* First block */<br>
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk<br>
index 583ed56c1c..a3c0b6a67f 100644<br>
--- a/package/libssh2/libssh2.mk<br>
&#43;&#43;&#43; b/package/libssh2/libssh2.mk<br>
@@ -30,6 &#43;30,9 @@ LIBSSH2_IGNORE_CVES &#43;=3D CVE-2025-15661<br>
&nbsp;# 0007-sftp-prevent-dangling-pointer-after-free.patch<br>
&nbsp;LIBSSH2_IGNORE_CVES &#43;=3D CVE-2026-66032<br>
&nbsp;<br>
&#43;# 0008-openssl-fix-AES-GCM-bounds-checks.patch<br>
&#43;LIBSSH2_IGNORE_CVES &#43;=3D CVE-2026-66033<br>
&#43;<br>
&nbsp;ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)<br>
&nbsp;LIBSSH2_DEPENDENCIES &#43;=3D mbedtls<br>
&nbsp;LIBSSH2_CONF_OPTS &#43;=3D --with-libmbedcrypto-prefix=3D$(STAGING_DI=
R)/usr \<br>
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

--_be10d81b-7caa-4ccb-b36d-e8822fbd15b7_
Content-Description: linkedinmedium_e5ee0685-3767-4ffd-a5c5-9e4e3fc32352.png
Content-Type: image/png;
	name="linkedinmedium_e5ee0685-3767-4ffd-a5c5-9e4e3fc32352.png"
Content-Disposition: inline;
	filename="linkedinmedium_e5ee0685-3767-4ffd-a5c5-9e4e3fc32352.png"
Content-Transfer-Encoding: base64
Content-ID: <linkedinmedium_e5ee0685-3767-4ffd-a5c5-9e4e3fc32352.png>

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

--_be10d81b-7caa-4ccb-b36d-e8822fbd15b7_
Content-Description: instagrammedium_908c8ebd-b03d-4881-a6e2-043808ead83d.png
Content-Type: image/png;
	name="instagrammedium_908c8ebd-b03d-4881-a6e2-043808ead83d.png"
Content-Disposition: inline;
	filename="instagrammedium_908c8ebd-b03d-4881-a6e2-043808ead83d.png"
Content-Transfer-Encoding: base64
Content-ID: <instagrammedium_908c8ebd-b03d-4881-a6e2-043808ead83d.png>

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

--_be10d81b-7caa-4ccb-b36d-e8822fbd15b7_
Content-Description: teamsmedium_9934c99a-98a5-42b7-9a66-2bebfdd7ebf1.png
Content-Type: image/png;
	name="teamsmedium_9934c99a-98a5-42b7-9a66-2bebfdd7ebf1.png"
Content-Disposition: inline;
	filename="teamsmedium_9934c99a-98a5-42b7-9a66-2bebfdd7ebf1.png"
Content-Transfer-Encoding: base64
Content-ID: <teamsmedium_9934c99a-98a5-42b7-9a66-2bebfdd7ebf1.png>

iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAACxMAAAsTAQCanBgAAAcBSURBVGhD1Zp5bBRVHMd/b7YXR2ukIIem1YAG
vAhg8R9RJBHjLYECGgoYUEJ3lxa2BcKR0kQjtLtt6W7LFRAUA6JoiDcSCSj+UdQoBIwRQ2k1hPs+
es3P75t523bbPbut3X6Smfn9fjPvvfnNe/N+vze7gjoL65ohJCzjiGkMtOHY0rClkhBJxMyQb2A7
B72aiI8RWapIaIfInXMV9qiJzhH76nuI42ZCykRVI3GMsD5uQJGDcHQn3Wr6iLYsuaZOREzHHJlf
9ChplmWQJqOGONMYJcyyZzaRJa6YynPPmMbwicyRBWUDSW9cQyyyUFJT1s6FMQQFrSYBh9w5dcoa
kvAdsbqmo5UKjPF+ytK1MP9BOmXRurxflCUooR3JLEigu5LL4cA8Zfn/YK5HuwvI49igLAEJ7oh9
bQqG0me4aoKydBcl5FmUh9uVs59fAjsineDGvZAeNw3djOAN5HbMD+SMRR19KdiVQDcvfYlCTyhL
DCAeo7E/JVHV3n3K4IP/med8TSUKjldaDCGWkLVkllJ8aD+0souzSNPeV1oscpOEnkHu/ONKN/Dt
Eat7CJxwKy1W6U2sbaXMXT6vha8jos6F/R2m0mnItONHzKW/YmsyTVGTQQNrfcJBiyPzizPgyTSl
dQ5MRZSoD0YcGEeevDGk81DYvldno4N5FWV7+iqtlSOaWIl9+JE+FMyVVOFYQq58mfWaVOafogR6
ESeR/UaJEAOI6jAdm5iOZLuG4cwLhtwZyLQ9Xntbab6UOm7hvBzCJsxn0EtT6LLeF4loOgzr1ZnQ
CLJ53xXTEaG/AaPv+xIdZ6ls0Wkl+8HyuxLQtjYZPbebtqPnynNrMATxlHm3OhscgTXPgNpnpKgc
EVONY+eRgkz5frIXDSVHcR9la4WeahyYTiL1OGTIrdG1D5QUGo2Ne9fI6nwAnmBohYcglkPjctAN
g5eaGqtwQz9TnfYP2Z2jzNJexOvmIcAoEBzB6BDPyZ0ge8lcNL7JNIaA+dbg/sn9TxfOu6ksIUnI
LdtY39h4EUNmqWGwuWainq1o2pxYZELqduw3ZC821x7sXzaVcOARAj2yHpWGl6LLp12Rd6fSwqKv
o7z0el3DMJTdg3bkzb1knmnmArZcSuBvqJ76Q4bDwm8aEhDBM/Deuw5AfNK0hKCtI7aSHTAOUloL
Oq+kyjwEwWZHcg27f66ja04o2YuGFPcRHMMNB+9ouDn5taNDJMTR7niLts2iiSNIrgdJWW5JcXE1
6hIDTaPP4fCkthtehLdwp6J3ov4sexyjWm0jBYkiVTwc0tAjTqQQojlCBiXQ0LI5X0UdOYjgTytL
M7JH6hp0aijPXahMvticJ0nXJ1Hl4t+UxcTmnI0631NacJi+lrNDL1PrwQjqFcE0F8sw5nH5+aWn
w+IGekScU2rPRfB5ObROmVoPhkU1HGGfJWOHqG/cTzq9qbTOIZIkVhPHNUTbw0rtOBuXXqFKR9ug
FhWII/cqMTQcd1hQdnE6Ila1MoXEIoSnSWeZVoQE6RTiHb+G1cm7SNX9xwSrqzae6PmGCsdRZSEq
KNDEhZSjiO4PKktgmGsQ29LNFMDmPIJmZUoQFajsHLr5Q6UaIOIf090LNxtSW2SKf1u7nJhAI+pK
W3pUszuX6yz8L8zawrQODynbdMTqXI7HF17BIKCyhj4i7u7r7pywZkJtgWu6rtMOlKvBUCrDAu8s
k3gFPZipLgmNrj+FJfRB84VKEFvhWaMhRwEeefwN0SjX/iEZZl+byDotlzLKpenEJeiF7RE5QfQn
ktMfpGA6Uur4Fz2/y5CjhHW2afbiLKX6B+vsv6lpPRx4WFk6BqMX1ZBtmeKaLBhanfHdSQidtW3C
VlKabHWbS9pWxOeWPCQG1n7LzEgKo4CphjRL8wRiviNeIllkhcdtNHAAj+wEjvFobTQcGCOdVec7
js4zMKyaJxbfCue4+iEXlt+c2i+WYgmmfZipJhqSwjd6bnZchKtzcb75ghjkElka5uDoc4/tfx+p
+u4vGjsxEZ01TlliB0YiRDyNPIvbZSP+85nUayuw/8RUYgiNHIjiXyjNh8AvHeZ54oZPccnzytLN
8Cry5BUqpR3+e0Qif+NOvSY/EuxUlu5BDidmRzAnJKGnQWZBdtcKBJ9VuDqw413DFdKbZlHlYvnB
Lijhz+fW4vHowC0ocZ+ydDF8ENts8uSfVIagRBaYzGx1GRpYiJjWRV9f+DQG0woj7Rf+f4r2R2SO
eJF/aSJLHqQ5aCzFNEYNltxiLdX32UAbw/+27KVjjngxesgyBU8RGStPiLiXmM5j9xXyvp10Jn0v
fTy1w7ledI60ZlZBEiX3ziC2jIZDw3GDaag+FZNFL+iYebx/PONqyMdgO0ypV49SYSGCXLQQ/Qeq
615O/QJTAQAAAABJRU5ErkJggg==

--_be10d81b-7caa-4ccb-b36d-e8822fbd15b7_--

--===============1680579258240789581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1680579258240789581==--
