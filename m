Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1082C5DF81
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 06:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9231280C27;
	Thu, 20 Aug 2026 06:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GK953RnELqvN; Thu, 20 Aug 2026 06:57:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787209032;
	bh=pU49M8jDSeJgfjeXahQenzS8z6eixI8BVqDp70pNwE8=;
	h=To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Vx5iNQ59z+a2KATomd1sH5SDq2c5rYdD3/S4QOcjb2XN/xJmdhOlTqro3W4ZuGU+A
	 lPpk3R7IJoKPUJdoIDCdn97NP6vlKnr8gPAUh9qRP+FI35vC42RCK2ptkIyUnJVpjT
	 7C8LXFoSvkRntuLR2PcadZskKQBJm4vZz56QyqpKZPO2kyiLaaGMOXo1oT3Zso6yM9
	 vaKpxoscTDuCKw7P2wJGKeN0hr6PDsdyhGFbuHx8a1sezToJLdkFkEngMnGBTHJPq6
	 6RL991WYJC6yvLmfIPB5SijRONlrKmTeulDMQjejr9ToJZfy718zcWVAGLLDlUqcVS
	 H0nCoH9yZgPcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD20380C32;
	Thu, 20 Aug 2026 06:57:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D485C1EA4
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 06:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A597780BBD
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 06:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r29SVyTb62xh for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 06:57:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c213::5;
 helo=zr1p278cu001.outbound.protection.outlook.com;
 envelope-from=stefan.mueller@rey-technology.com; receiver=<UNKNOWN> 
Received: from ZR1P278CU001.outbound.protection.outlook.com
 (mail-switzerlandnorthazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c213::5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A899B80BBE
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 06:57:07 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rnsCekgOGD3MZOsgJ2A7x4KZnCw2nL5yJjTxzi0UzzjDrYKVecG3CpvVfjZBnj0zbwjGKF71ILEpBzv4LlZG9GmU13Pcl8Z7Fv0ruytBJ9rvQCfULDYnR5lDerIKOsPQbJMGd1AqABSNVPDcI9M2vmkUKa7DCCjVP+qzN3vSEa6xcZn7NzEW/75F3wA1HAxAdi91hIGrt5V4QjChWO+8QKANO3Z2lAN444k+fcf/dUKVZYNjOYJBeAQJPFOGYEZzX95q9xvj9hOD0K232owOSvqrykrNJb0FqtXoM+u2OZW8wVkB/M44XroZP/p6nlV2VxpQG/TM2O7iS5yTHpwzgg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FbzdmuMGr44hk1DX3lYL6Kc3kJDFQw+saJsKj+R7Gvk=;
 b=r5ObuXQQ5e1o+Cxgp5Ny9LdBRJ39NrF3fbaHhhbJyVmb8d9iobwELRnaf78BqHneNlKurICerwCPR46Nywo/i84RfychhcqO2ul1evT5SEI+WQpuTxV9MbvjR+YEWS6pdaxjuRI33RU58bMZs5T1LzB32kMSZe1+Z30iScHJE/8XR+mwUoRRwmsXE06IYvjE9HcqubOSy6GlAV/hbGFWclrDCMjnlcrYOGQHaPmcS3IBLUyrXHrGljRg8qMw+QH85ZiqEuSDMg6W9TSyx8pn5+wJwLWQut86+I0u++YqJgStzMzk6+ovCtEPgri+xKj27l45SD65BCpL2DrU39BcuA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 94.140.18.225) smtp.rcpttodomain=buildroot.org
 smtp.mailfrom=rey-technology.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=rey-technology.com; dkim=pass (signature was
 verified) header.d=rey-technology.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=rey-technology.com]
 dmarc=[1,1,header.from=rey-technology.com])
Received: from AM9P192CA0017.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::22)
 by ZR3P278MB1275.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:71::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 06:57:01 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:21d:cafe::81) by AM9P192CA0017.outlook.office365.com
 (2603:10a6:20b:21d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
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
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 06:57:00 +0000
Received: from localhost (ip-172-20-1-109.eu-central-1.compute.internal
 [127.0.0.1])
 by mfod-euc1.prod.hydra.sophos.com (Postfix) with ESMTP id 4hQZ4C6q4JzlZrx
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 06:56:59 +0000 (UTC)
X-Sophos-Product-Type: Mailflow
X-Sophos-Email-ID: 56efa1e1b1be49db92402f049a6e0f16
Received: from ZRAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandnorthazon11020107.outbound.protection.outlook.com
 [52.101.186.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mf-outbound-eu-central-1.prod.hydra.sophos.com (Postfix) with ESMTPS id
 4hQZ4B5blhznTVV
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 06:56:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VCTykzSHGiS6JaZ8NzT6Gnd0BtDa6tB7Ds4w5PWHzZYH6L2EzVsbZo+Ns7a2aWX/xKrTbh9tBd0u41H1JUzfsKrXv8/fyZT4J4l7S1Kx8gT59yIZSu53+3dXE+i8cEv2d0DjS9MIz2TcK/Watf9zEI2lqhBGzN+kQeq5BUyQ6JVsv8td6bd1km3FiGUUnl70X0ukZaBkuH0BzWYS+/zHx1wnifr4zY5AVxdapLepjzdaOB7Aeo57QZv0+6suXeYZVeJ+BMilIEkaAKEKV4BOM6hOLiZ5M0cISXi8PJ/+3Q6pjk/bOAMwt7LW7qQuiiQGaYw/Vstf+QJakFcYghoHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FbzdmuMGr44hk1DX3lYL6Kc3kJDFQw+saJsKj+R7Gvk=;
 b=So2+mc8cwJn5Bu3GfNflg4C1PaFgmPl5wojnCtwNYmjyucMr93SJJmRKcPpHsVnd04tNCMDC2MsuJuddCRth8OtSjToLgD7s6V473yAByB3vZrhTQSIh+3GkOhYt/R5L+BweHffa4IwXsmqF0sTW7X+N4CSZft4C31XG38FJq2z1FUzpomc+1vsIl6xhRy66sQ+VQfBTVUV2qfx1Nni92+JrBtaXbHmm2aTTG2UEkRfP1FbAWc8xqN8oPWNF7GPgAxYA8W91YE1ITnBaXo+FNh16bZ7IkFQVmOuLGE4rGOYIlL1dFn9DcqoXu7oixkw1BqDfV+8n9kFqojIEcNqcwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.79.220.33) smtp.rcpttodomain=buildroot.org
 smtp.mailfrom=rey-technology.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=rey-technology.com; dkim=none (message not signed);
 arc=none (0)
Received: from DU6P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::22)
 by GV0P278MB1639.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:66::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 06:56:56 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::6b) by DU6P191CA0007.outlook.office365.com
 (2603:10a6:10:540::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 06:56:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.220.33)
 smtp.mailfrom=rey-technology.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=rey-technology.com;
Received-SPF: Pass (protection.outlook.com: domain of rey-technology.com
 designates 20.79.220.33 as permitted sender) receiver=protection.outlook.com; 
 client-ip=20.79.220.33; helo=de1-emailsignatures-cloud.codetwo.com; pr=C
Received: from de1-emailsignatures-cloud.codetwo.com (20.79.220.33) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 06:56:55 +0000
Received: from ZRZP278CU001.outbound.protection.outlook.com (40.93.85.28) by
 de1-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via
 SMTP; Thu, 20 Aug 2026 06:56:54 +0000
Received: from DU2PR04CA0287.eurprd04.prod.outlook.com (2603:10a6:10:28c::22)
 by GV0P278MB1915.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:70::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 06:56:50 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::2c) by DU2PR04CA0287.outlook.office365.com
 (2603:10a6:10:28c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 06:56:50 +0000
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
 via Frontend Transport; Thu, 20 Aug 2026 06:56:49 +0000
Received: from build.reycloud.net (unknown [172.20.60.115])
 by mailrelay.reygruppe.ch (Postfix) with ESMTP id A4973801D4;
 Thu, 20 Aug 2026 08:56:47 +0200 (CEST)
To: buildroot@buildroot.org
CC: =?UTF-8?q?Stefan=20M=C3=BCller?= <stefan.mueller@rey-technology.com>
Date: Thu, 20 Aug 2026 06:56:46 +0000
Message-ID: <20260820065646.375321-6-stefan.mueller@rey-technology.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260820065646.375321-1-stefan.mueller@rey-technology.com>
References: <20260820065646.375321-1-stefan.mueller@rey-technology.com>
 <4e118c97-1508-4315-bc90-2b0b02fc43b2.a680deba-e8f9-456f-ab7c-ac325426e0a3.ca0ad5ef-d59b-485e-ae90-b209c6a302a1@emailsignatures365.codetwo.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 2
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFF:EE_|GV0P278MB1915:EE_|DB5PEPF00014B88:EE_|GV0P278MB1639:EE_|AM1PEPF000252DA:EE_|ZR3P278MB1275:EE_
X-MS-Office365-Filtering-Correlation-Id: 094942f4-f9ed-4f29-7d4b-08defe883b9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|13003099007|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 6lh5PkezdzT9mtedFbJy4Zf2gy5GflBGH6h901SlxNeRVJXDv+4Jia+OO4vU4LSPHd1XYa5lQmKmphnaFvNQekqTE+uzdSy8UpUb6CaEA3IAIwMOXpPPfY4VHjL9vznOs6FjGJn7d29JgUCeq+451xkn95T971qUxGR2fYeBy/r/WH4OqX3pxj1g3sTyTmHS0PjUkY7LfRwmqdEDQ8nNBAmALk1CRgxRNfZ3aPaXEdFyrWmMqgt3gtScZLvzGZaGl7oxrWzcwsMGIL/1BILpP9Zdj+EhHn13U5lNQCCnlKo0i6wp5RedH0wmcQkXmzRKKNb9pBUl8/FGSfhkRcWq0RiBuYlmONXk43DZhVCpDCAPZUZ9dKzu20VbvzVcwN+WZsBpxFrM8LddKJ2H5sQt/2KMvoZL8AihFoqoLS7VDChMJPHYv8NMVdVQsE7UqQL4H2d+Er8itF5E+Wo+dsK+RYs0mRTc9eKvbqXEVc8yTi0IHZWOGjmHQRWGFkpX9kqk0gXeyJlD+/w8u4FG0U+t3MjfDf66boNGhqaQ4Hv74dpNfpgkUx7vXt+rh5sKXAKzYn6rHqbJO0oNPBCgeIsOZUc7xNIhXXDEokQJ5jb6AqiABbR8V2Tc3EsivUs0nbzOICs4e8QN+ZpPcnH5IhvpajbTACG8bwTgPdSpS6LzYgP3zsDdOGqahSn8Ed+A7+Qh+HUwUUWjA0IPbdwgRIBx3w==
X-Forefront-Antispam-Report-Untrusted: CIP:213.196.177.45; CTRY:CH; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:mailrelay.reygruppe.ch;
 PTR:ftth-177-045.tbwil.ch; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(13003099007)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1102; 
X-Exchange-RoutingPolicyChecked: Ph1H3WUDRcRWp93OSpyljlYCvaOUzzdP2wfj1oCflbCasvxPCP4Gk5mGAikPtCwnmek2UQduOeVrK2SQmSFdGgXFM43lCpq4j1qsIsRSAPN+c+GBr61RvxeY9WkjJ20QbF8G3l0C7eMn53kO4SmO5UGvq+32YsI3dNQ5zfKqQrlJhYfGRTqN/kio73oEFWlZl9lCHyLbwISVPURDvr9+/OeHgeoJ3ij8H1DQeC9RMiLFBqkAmR8IyAFOLiOsLijW4PBZcXK62dmQjlqS2vEOsOPwuMi6NbwxyYLz6oJ704sJMCq9oi2G1c+Q7lMGy3NNCRkmNEnVvBqUyJXp0W0i7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1915
X-CodeTwo-MessageID: 247ede2b-44a1-436d-8875-7884ad45fa07.20260820065654@de1-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: fa80c775-c8f5-46fb-461e-08defe883541
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|6049299003|1800799024|35042699022|36860700016|14060799003|7149299003|82310400026|23010399003|376014|22082099003|18002099003|4053099003|13003099007|10067099003|56012099006|4143699003|11063799006|4076899003|8096899003;
X-Microsoft-Antispam-Message-Info-Original: cjNQMo/1ax6jlTTbH0VvS8kTUD/y+XvXhdqRcXRZV0547QvVaukVBqJSUdTg4B1neb93IIGenlIX43ehQoccEPnhwEfLDnvkP9AOFeGZ/C5uGQLvXI6zsU5XOk53k+ohAxQ1yM9zszK8vNnechnyTMFzYi84vSS2aCysbp7pLGPsPxvJQUdkgnyjtphcHscrhWA16F1QE6jFzSiDcHTHH1HRALoU29+4LWefspTW85iOMu9MF4bPVDtEt9zkGuPczpQQPU2YqVxolAELEVl26dPomm4NeVqe7kdRPZKNYeEO9r73FKvVtmzb5qxao0KP6qXXuOIfjAvyBkMZUwSsi3r7OLln1WOiISEeiUWquHGw5j0NDwIIpAsC5lqCx/0NfZKkU3NHyJ+b9gJagwegNv1kw8P3r0cuyO+lRcKD07doOCVPW8TERI9ievIIvapEW53fHqFlgFgRUpW2uGaUhaQTaAl5jd0vC/O3XqfYdqB3OBjm8kTsPjF/jaN14prYeofHCK/+SLeRPjXWBY1rluQ3DSguLf/v5I4hAbPeOofAbIBKC14wJjsW3+JL+QSfwe9PUGcIA7m/zu8mwBkF1hj/rNvo/5Eflft1dDuak6Eh5xBw9ry2NV/b0KPYUpdiIszUyEnry9OZojmSlMF6HA==
X-Forefront-Antispam-Report-Untrusted: CIP:20.79.220.33; CTRY:DE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:de1-emailsignatures-cloud.codetwo.com;
 PTR:de1-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(6049299003)(1800799024)(35042699022)(36860700016)(14060799003)(7149299003)(82310400026)(23010399003)(376014)(22082099003)(18002099003)(4053099003)(13003099007)(10067099003)(56012099006)(4143699003)(11063799006)(4076899003)(8096899003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1639
X-Sophos-Mailflow-Processing-Id: 3f6e07135dbe47549fcb5005624f992d
X-Lased-Hits: BODYTEXTH_SIZE_3000_MORE 0.000000, BODY_SIZE_10000_PLUS
 0.000000, DKIM_ALIGNS 0.000000, DKIM_SIGNATURE 0.000000,
 HREF_LABEL_TEXT_ONLY 0.000000, HTML_50_70 0.100000, IMG_AR_1 0.000000,
 IMG_ATTACHED_2P 0.000000, IMP_FROM_NOTSELF 0.000000, IN_REP_TO 0.000000,
 LEGITIMATE_SIGNS 0.000000, MULTIPLE_ATTACHMENTS 0.000000,
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
 0.000000, __DQ_NEG_IP 0.000000, __EXTRA_MPART_TYPE_N1 0.000000,
 __FILESHARE_PHRASE 0.000000, __FRAUD_MONEY_CURRENCY 0.000000,
 __FRAUD_MONEY_CURRENCY_DOLLAR 0.000000, __FROM_DOMAIN_IN_ANY_CC1 0.000000,
 __FROM_DOMAIN_IN_RCPT 0.000000, __FROM_ENCODED 0.000000,
 __FROM_NAME_NOT_IN_BODY 0.000000, __FROM_UTF_Q 0.000000, __FUR_RDNS_SOPHOS
 0.000000, __HAS_ATTACHMENT 0.000000, __HAS_ATTACHMENT1 0.000000,
 __HAS_ATTACHMENT2 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
 __HAS_HTML 0.000000, __HAS_MSGID 0.000000, __HAS_REFERENCES 0.000000,
 __HAS_X_FF_ASR 0.000000, __HAS_X_FF_ASR_CAT 0.000000, __HAS_X_FF_ASR_SFV
 0.000000, __HAS_X_MAILER 0.000000, __HIGHBIT_ASCII_MIX 0.000000,
 __HREF_LABEL_TEXT 0.000000, __HREF_LABEL_URI 0.000000, __HTML_AHREF_TAG
 0.000000, __HTML_BAD_END 0.000000, __HTML_ENTITIES_X4 0.000000,
 __HTML_HREF_TAG_X2 0.000000, __HTML_TAG_DIV 0.000000, __HTML_TAG_TABLE
 0.000000, __HTTPS_URI 0.000000, __IMG_ATTACHED 0.000000, __IMG_SIZE_1K_10K
 0.000000, __IMP_FROM_MY_ORG 0.000000, __IMP_FROM_NOTSELF 0.000000,
 __IN_REP_TO 0.000000, __JSON_HAS_SCHEMA_VERSION 0.000000,
 __JSON_HAS_TENANT_DOMAINS 0.000000, __JSON_HAS_TENANT_ID 0.000000,
 __JSON_HAS_TENANT_SCHEMA_VERSION 0.000000, __JSON_HAS_TENANT_VIPS 0.000000,
 __JSON_HAS_TRACKING_ID 0.000000, __MIME_ATTACHMENT_1_N 0.000000,
 __MIME_ATTACHMENT_N_2 0.000000, __MIME_ATTACHMENT_N_3 0.000000,
 __MIME_ATTACHMENT_N_4 0.000000, __MIME_HTML 0.000000, __MIME_TEXT_H
 0.000000, __MIME_TEXT_H1 0.000000, __MIME_TEXT_H2 0.000000, __MIME_VERSION
 0.000000, __MSGID_DOMAIN_IN_REFERENCES 0.000000, __MULTIPLE_URI_HTML
 0.000000, __MULTIPLE_URI_TEXT 0.000000, __OUTBOUND_SOPHOS_FUR 0.000000,
 __OUTBOUND_SOPHOS_FUR_IP 0.000000, __OUTBOUND_SOPHOS_FUR_RDNS 0.000000,
 __PART_2_IMAGE_PNG 0.000000, __PNG_AR_1 0.000000, __PRODUCT_TYPE_MAILFLOW
 0.000000, __RCVD_NO_PTR 0.000000, __RCVD_PASS 0.000000, __REFERENCES
 0.000000, __SANE_MSGID 0.000000, __SCAN_D_NEG2 0.000000, __SCAN_D_NEG_HEUR2
 0.000000, __SL_HEAVY 0.000000, __STYLE_RATWARE_NEG 0.000000, __STYLE_TAG
 0.000000, __SUBJ_STARTS_S_BRACKETS 0.000000, __TAG_EXISTS_BODY 0.000000,
 __TAG_EXISTS_HEAD 0.000000, __TAG_EXISTS_HTML 0.000000, __TAG_EXISTS_META
 0.000000, __TO_MALFORMED_2 0.000000, __TO_NO_NAME 0.000000, __URI_IN_BODY
 0.000000, __URI_MAILTO 0.000000, __URI_NOT_IMG 0.000000, __URI_NO_WWW
 0.000000, __URI_NS 0.000000, __URI_WITHOUT_PATH 0.000000, __URI_WITH_PATH
 0.000000, __X_FF_ASR_SCL_NSP 0.000000, __X_FF_ASR_SFV_NSPM 0.000000
X-Sophos-Email: [eu-central-1] Antispam-Engine: 6.0.3, AntispamData:
 2026.8.19.182719
X-Lased-Spam: NonSpam
X-Lased-Spamprobability: 0.079439
X-Lased-Impersonation: False
X-Sophos-MH-Mail-Info-Key: NGhRWjRDNnE0SnpsWnJ4LTE3Mi4yMC4xLjEwOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d0f7df95-aa1d-4180-1202-08defe8838ba
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|6049299003|82310400026|23010399003|1800799024|35042699022|36860700016|7149299003|376014|10067099003|56012099006|18002099003|11063799006|4143699003|22082099003|4076899003|8096899003|13003099007|4053099003;
X-Microsoft-Antispam-Message-Info: 6C0nBRZz10AqjO8KRsHiWTEYMbGLtVcs0V9a9aT6HIq9Tp6jhhZCyJZCbhkmQiz9lSj36p6y8wH74PB86Ob+eWqUj5IT1UjDXB1dTfY7MDHes5gnONqrHjbW+9sXYWw3yvXlErzH41or1zRblMSo7pfXS/afNSijNdDp5fQ19QMO2JmqzZDQ2pmwrYBDNFc04QDe9+0IbSTSOGT7jgWBdMeO20w195xNDi6iEEFQvODxIxbSGXLIiBtGfmSBMVrXr9tJQlPCpZ77xFn3kPR7eXSSSv+UVYVlFYH5y8ahr6QT1g31kIXIHo4R7E6gNXMw2iep3oG5871NAxFx9CaxHR12PjQRJPa+lphyhczmPH8vW6+osaKwdMQWxErRpQ1gUXv+AdHYThKQ69oHbkb+HIlMSuDuRydMLlIDqK3NYD6veOfovjxhrc4GF6YujvfagzRvAOxc3cp25GVa7Ki/YxsWB9Qh3daK+7dIG6z3d437SIWCBIr6VNqjJFcVGL6YkjAvKay9PnZecM7r1UsCAsV2pKLsI8tquhmbEKo1Ira8zGwuLp0UrFptKWqHsWhN/SrQzJZbpoWHs41x+cACvat7nYnK3Hx/wP8HRcXBhXPLgH03gV/WRnuXyPOH8CkrERQUipTpSB3xZT7L6Q2Dbw==
X-Forefront-Antispam-Report: CIP:94.140.18.225; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mfod-euc1.prod.hydra.sophos.com;
 PTR:mfod-euc1.prod.hydra.sophos.com; CAT:NONE;
 SFS:(13230040)(6049299003)(82310400026)(23010399003)(1800799024)(35042699022)(36860700016)(7149299003)(376014)(10067099003)(56012099006)(18002099003)(11063799006)(4143699003)(22082099003)(4076899003)(8096899003)(13003099007)(4053099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: B8063sv3OPGgioCANNkdK2SeD3cSAnb0MDnkrdtjMo3qvJWOQ3jSzXpJaY7QlPN33RPaKkCmdp9oTYx0hbBXEVw3UMzJPJ+dkQvw0Hur6vzJc/SGOG2tJxE2WYXgwGww2w1IVXATpIkbj21yW8UNGlTmW4BokNJ7iDX1eF+XxRYgyarbg8+Cfze7d2hzXLiJu30plSe7I+0tF5dVcIYj0xoGH2d4HCpkDXZQ4+44cP/716iAw+WNdWZbcbnsvSuJUtH6xDZZeUU0U5uhcjJpoX5l3gPp6xaNOjDrgFRrCA9XUoyscGnmXpXxazVJ47EdXQLJoGwo5eLm72LVfxWTSQnN6FebPn1ITf93xx3W0aqF2oJNgWG2QbQ4NZp/K+xT5OCAV7+L8wbBNmU/mUVm0ApYle0zmzacuYe6Oh2EO8Lwt2kmik+/FppyHd68vD8r
X-OriginatorOrg: rey-technology.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 06:57:00.1621 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 094942f4-f9ed-4f29-7d4b-08defe883b9b
X-MS-Exchange-CrossTenant-Id: 7137cfb5-c814-4224-8896-1b4a6ff99146
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=7137cfb5-c814-4224-8896-1b4a6ff99146; Ip=[94.140.18.225];
 Helo=[mfod-euc1.prod.hydra.sophos.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR3P278MB1275
Subject: [Buildroot] [PATCH 5/5] package/libssh2: fix CVE-2026-66035
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
Content-Type: multipart/mixed; boundary="===============0932905226191117557=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0932905226191117557==
Content-Type: multipart/related;
	boundary="_1f4cd725-262a-4d31-b391-515faa4579dd_"

--_1f4cd725-262a-4d31-b391-515faa4579dd_
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
35.<br>
<br>
The ETM decrypt path does not validate the received packet length before<br=
>
calculating the decrypt buffer size. A malformed packet can therefore<br>
lead to a heap overflow.<br>
<br>
Use Debian's libssh2 1.11.1 backport of the upstream fix.<br>
<br>
Signed-off-by: Stefan M=C3=BCller &lt;stefan.mueller@rey-technology.com&gt;=
<br>
---<br>
Backport to: 2025.02.x<br>
---<br>
&nbsp;...tential-heap-overflow-on-ETM-decrypt.patch | 41 &#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;<br>
&nbsp;package/libssh2/libssh2.mk&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 3 &#43;&#43;<br>
&nbsp;2 files changed, 44 insertions(&#43;)<br>
&nbsp;create mode 100644 package/libssh2/0010-transport-fix-potential-heap-=
overflow-on-ETM-decrypt.patch<br>
<br>
diff --git a/package/libssh2/0010-transport-fix-potential-heap-overflow-on-=
ETM-decrypt.patch b/package/libssh2/0010-transport-fix-potential-heap-overf=
low-on-ETM-decrypt.patch<br>
new file mode 100644<br>
index 0000000000..ee253315d7<br>
--- /dev/null<br>
&#43;&#43;&#43; b/package/libssh2/0010-transport-fix-potential-heap-overflo=
w-on-ETM-decrypt.patch<br>
@@ -0,0 &#43;1,41 @@<br>
&#43;From 42e33d81577ed4b95d4b4f6f845e5ee8efe5eeb4 Mon Sep 17 00:00:00 2001=
<br>
&#43;From: Viktor Szakats &lt;commit@vsz.me&gt;<br>
&#43;Date: Fri, 3 Jul 2026 18:22:55 &#43;0200<br>
&#43;Subject: [PATCH] transport: fix potential heap overflow on ETM decrypt=
<br>
&#43;<br>
&#43;Reported-by: Vladimir Eli Tokarev<br>
&#43;Fixes GHSA-6c79-444r-wx26<br>
&#43;<br>
&#43;Closes #2198<br>
&#43;Forwarded: not-needed<br>
&#43;<br>
&#43;CVE: CVE-2026-66035<br>
&#43;Upstream: <a href=3D"https://github.com/libssh2/libssh2/commit/42e33d8=
1577ed4b95d4b4f6f845e5ee8efe5eeb4">https://github.com/libssh2/libssh2/commi=
t/42e33d81577ed4b95d4b4f6f845e5ee8efe5eeb4</a><br>
&#43;Signed-off-by: Stefan M=C3=BCller &lt;stefan.mueller@rey-technology.co=
m&gt;<br>
&#43;---<br>
&#43; src/transport.c | 7 &#43;&#43;&#43;&#43;&#43;&#43;-<br>
&#43; 1 file changed, 6 insertions(&#43;), 1 deletion(-)<br>
&#43;<br>
&#43;--- a/src/transport.c<br>
&#43;&#43;&#43;&#43; b/src/transport.c<br>
&#43;@@ -242,6 &#43;242,12 @@<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; unsigned char *decrypt_buffer;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; int blocksize =3D session-&gt;remote.crypt-&gt;b=
locksize;<br>
&#43;<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if(p-&gt;total_num &lt; mac_len &#43; 4 &#43; (si=
ze_t)blocksize) {<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LIBSSH2_FREE(session, p-&=
gt;payload);<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return LIBSSH2_ERROR_DECR=
YPT;<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; decrypt_size =3D (ssize_t)(p-&gt;total_num - mac_=
len - 4);<br>
&#43;&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D decrypt(session, p-&gt;payload &#43; 4,<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first_block, blocksize, FIRST_BLOCK);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; if(rc) {<br>
&#43;@@ -249,7 &#43;255,6 @@<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; /* we need buffer for decrypt */<br>
&#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; decrypt_size =3D p-&gt;total_num - mac_len - 4;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; decrypt_buffer =3D LIBSSH2_ALLOC(session, decryp=
t_size);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; if(!decrypt_buffer) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return LIBSSH2_ERROR_ALL=
OC;<br>
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk<br>
index 4a4491f0f1..7715b0bc0a 100644<br>
--- a/package/libssh2/libssh2.mk<br>
&#43;&#43;&#43; b/package/libssh2/libssh2.mk<br>
@@ -36,6 &#43;36,9 @@ LIBSSH2_IGNORE_CVES &#43;=3D CVE-2026-66033<br>
&nbsp;# 0009-publickey-fix-potential-OOB-read.patch<br>
&nbsp;LIBSSH2_IGNORE_CVES &#43;=3D CVE-2026-66034<br>
&nbsp;<br>
&#43;# 0010-transport-fix-potential-heap-overflow-on-ETM-decrypt.patch<br>
&#43;LIBSSH2_IGNORE_CVES &#43;=3D CVE-2026-66035<br>
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

--_1f4cd725-262a-4d31-b391-515faa4579dd_
Content-Description: linkedinmedium_e5ee0685-3767-4ffd-a5c5-9e4e3fc32352.png
Content-Type: image/png;
	name="linkedinmedium_e5ee0685-3767-4ffd-a5c5-9e4e3fc32352.png"
Content-Disposition: inline;
	filename="linkedinmedium_e5ee0685-3767-4ffd-a5c5-9e4e3fc32352.png"
Content-Transfer-Encoding: base64
Content-ID: <linkedinmedium_e5ee0685-3767-4ffd-a5c5-9e4e3fc32352.png>

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

--_1f4cd725-262a-4d31-b391-515faa4579dd_
Content-Description: instagrammedium_908c8ebd-b03d-4881-a6e2-043808ead83d.png
Content-Type: image/png;
	name="instagrammedium_908c8ebd-b03d-4881-a6e2-043808ead83d.png"
Content-Disposition: inline;
	filename="instagrammedium_908c8ebd-b03d-4881-a6e2-043808ead83d.png"
Content-Transfer-Encoding: base64
Content-ID: <instagrammedium_908c8ebd-b03d-4881-a6e2-043808ead83d.png>

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

--_1f4cd725-262a-4d31-b391-515faa4579dd_
Content-Description: teamsmedium_9934c99a-98a5-42b7-9a66-2bebfdd7ebf1.png
Content-Type: image/png;
	name="teamsmedium_9934c99a-98a5-42b7-9a66-2bebfdd7ebf1.png"
Content-Disposition: inline;
	filename="teamsmedium_9934c99a-98a5-42b7-9a66-2bebfdd7ebf1.png"
Content-Transfer-Encoding: base64
Content-ID: <teamsmedium_9934c99a-98a5-42b7-9a66-2bebfdd7ebf1.png>

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
615O/QJTAQAAAABJRU5ErkJggg==

--_1f4cd725-262a-4d31-b391-515faa4579dd_--

--===============0932905226191117557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0932905226191117557==--
