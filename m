Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516F3C5DF87
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 06:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF41780C33;
	Thu, 20 Aug 2026 06:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJsoVfbM7_bC; Thu, 20 Aug 2026 06:57:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787209031;
	bh=E5fZORt4DK1AHdqggKnSWK0e/MAyQbmkC5d6f5Pa+FE=;
	h=To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QQ2oF1c1YSzeOW08a8GwY631jBazgjSuHnlmMPzW95zz2Y1iPl8HbuSyepuQU9Gt0
	 C9v9Uxu4Z7U/HdoOAyh2uLnbJ6gch9YVwaKDVsOZ6JPVnTUHPLpjYTAX2ML2lk+7gs
	 IVYK/8tEJWN/wlCchypvfjf6V1vc8TscEOgzmdSFDOnGrRiNpFDsSmYGskPakeNxUR
	 lBokYfvPyys+BFubujfeUGSK7k2gbTOodofU3L2SVNNuojDJujMBxAW6RJdRSAv11v
	 2jE/NDajDzD1i1SibW20PgoKipBtGBcqNAEYjrkdJpOrJipHdOP0icfGdUi/TI7yDt
	 /sfjtIVzCb/cA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CD0080BBE;
	Thu, 20 Aug 2026 06:57:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C9515334
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 06:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA83E40253
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 06:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8AR23nd8GRjg for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 06:57:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c213::5;
 helo=zr1p278cu001.outbound.protection.outlook.com;
 envelope-from=stefan.mueller@rey-technology.com; receiver=<UNKNOWN> 
Received: from ZR1P278CU001.outbound.protection.outlook.com
 (mail-switzerlandnorthazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c213::5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A890840055
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 06:57:07 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CRbej6scW4CIGtspJjWLxP4vLjibbhX1xXB/jOg3w/ExDofD8rj48r76DtxR3dxheeSkwMLQ5YgbFEGoJppn+k794jFF8tIXZdtJHBscb6HRiiWTdUWAPh8TKWjg0hBkvcc/K9GdczS5ZqzODQEPLcLXG59/defZXgC2YNiEy/gkB5sOvPeSUm+8FCxU9dN8XoIJiqwnOvEd+vW5gzuBqZMIUdxHY9DGRK3KiZ4AJcnMPTPLUj7m/379GUGtnSggm0sOxkjN/es4QtEel5ReTUK3cvIMyI1ZuqhqhJlpemMY5q/DKBlCBrMhwlGZ82DvEJLkZS2I+zMrxpp8NNtpXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2f5rhxNpuJIr+qCdr9+xPhGCRla7QhwPTDQHaw1lu8M=;
 b=XLJLjxl3+8CPJ+bicVOqV4HDM23CBpEkusoLliMclnO1KT7Sk0b9kBGylvlaGHynYj6/I+nBEPZC0jWNI9UcJtEyQetW+99He39kuSY4cIvy+epRi/60sTF0vPwJA/+i9czqDIDbZQ4Mynq4k7Lck/c9tU+CSBFjSUz3OMYW0JMX728ckYCsDYNiZN/cnj3wJpPPE1LFuyrijbsYFuMDe1yuEMdsT/cG+WjinGuLX8RNcs4s/+eD8Rt8zNfCX2yYW0WDjtUmf/p9PIiKuKhB5WBJx2Q+1tSSNCVO7FnvQmdYsfxxu5PqL2/Wx0U7ZbqfxBk4xbZphefAHFo3eIfuYw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 94.140.18.226) smtp.rcpttodomain=buildroot.org
 smtp.mailfrom=rey-technology.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=rey-technology.com; dkim=pass (signature was
 verified) header.d=rey-technology.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=rey-technology.com]
 dmarc=[1,1,header.from=rey-technology.com])
Received: from AS4P190CA0035.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::11)
 by ZR2P278MB1052.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 06:57:02 +0000
Received: from AMS0EPF00000193.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::ac) by AS4P190CA0035.outlook.office365.com
 (2603:10a6:20b:5d1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.9 via Frontend Transport; Thu, 20
 Aug 2026 06:57:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 94.140.18.226)
 smtp.mailfrom=rey-technology.com; dkim=pass (signature was verified)
 header.d=rey-technology.com;dmarc=pass action=none
 header.from=rey-technology.com;
Received-SPF: Fail (protection.outlook.com: domain of rey-technology.com does
 not designate 94.140.18.226 as permitted sender)
 receiver=protection.outlook.com; client-ip=94.140.18.226;
 helo=mfod-euc1.prod.hydra.sophos.com;
Received: from mfod-euc1.prod.hydra.sophos.com (94.140.18.226) by
 AMS0EPF00000193.mail.protection.outlook.com (10.167.16.212) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 06:56:59 +0000
Received: from localhost (ip-172-20-0-240.eu-central-1.compute.internal
 [127.0.0.1])
 by mfod-euc1.prod.hydra.sophos.com (Postfix) with ESMTP id 4hQZ4C50dJzsWDC
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 06:56:59 +0000 (UTC)
X-Sophos-Product-Type: Mailflow
X-Sophos-Email-ID: 20d5c038d8f14e4b8b321d36587f0157
Received: from GVAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandwestazon11020133.outbound.protection.outlook.com
 [52.101.188.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mf-outbound-eu-central-1.prod.hydra.sophos.com (Postfix) with ESMTPS id
 4hQZ4B2fGNznTVX
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 06:56:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUkMEg5xbAfuF6aKQEprnTAGHk6nVmHbVqy3gRzXYWltZ3jK4gFYey1px2JMU9vU7KIYQNwN/MbzII910Z1o3oqY3Mouj3yEMiBClL03VZ1cGZn5gZfDzhDEm6KZvuaV7InMlDGputlBnn3Yl9wOhewGiZaTzsqEts+Q6IgjMWAuZFJqAqU1bpXnQqTqkOeMk6VbjBulAdBv100q1tYx/cJNvctXVqmovwDPkwuPy6eMqhY6GBm61aB0gUYNBH5uNORWywRerT6gFFl6kYw9cf/H3eiqbM0WWnvuTOdNsT3pxT9KNF1GDm5570ndocDi33NWBrZjXOunVViWywbOJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2f5rhxNpuJIr+qCdr9+xPhGCRla7QhwPTDQHaw1lu8M=;
 b=XM4OQJrMZigo6i7fGE4EEqUnmG6Dw8MnOYyXqrcVki9bLCg71HyP4VzD7tW+QOAM05lCaR489aNlg6brk521C1jdPKvZUdElNiSAJ0mq2PSTQw+Tt1VyOXlnLwVLNqRIeO5pKA+n2uBCWZttvNSoTsSTPJeOMQI+MaIqFph7cXbXTBcsAH1cFW2+2AK160+Ar1inJfwIWhm0gwfckttFja7dlyimMQrEmeDgAFSv9Wk1UcapkC1Y4ttsl1wPp03UZCzHVGt0u9nqYs7gOdSbn/r+u/JYVcAiVf6XUXFNHcahKayFHcIMrfGrZah7x/kK5/9nSUNrdCcWCdJN9+1LVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.79.220.33) smtp.rcpttodomain=buildroot.org
 smtp.mailfrom=rey-technology.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=rey-technology.com; dkim=none (message not signed);
 arc=none (0)
Received: from AS4P250CA0014.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::17)
 by ZRAP278MB0111.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:11::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 06:56:54 +0000
Received: from AM4PEPF00027A5F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5df:cafe::a6) by AS4P250CA0014.outlook.office365.com
 (2603:10a6:20b:5df::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Thu,
 20 Aug 2026 06:56:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.220.33)
 smtp.mailfrom=rey-technology.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=rey-technology.com;
Received-SPF: Pass (protection.outlook.com: domain of rey-technology.com
 designates 20.79.220.33 as permitted sender) receiver=protection.outlook.com; 
 client-ip=20.79.220.33; helo=de1-emailsignatures-cloud.codetwo.com; pr=C
Received: from de1-emailsignatures-cloud.codetwo.com (20.79.220.33) by
 AM4PEPF00027A5F.mail.protection.outlook.com (10.167.16.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 06:56:53 +0000
Received: from ZR1P278CU001.outbound.protection.outlook.com (40.93.85.53) by
 de1-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via
 SMTP; Thu, 20 Aug 2026 06:56:52 +0000
Received: from DU7PR01CA0014.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::21) by ZR4P278MB1833.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:b4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 06:56:48 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::24) by DU7PR01CA0014.outlook.office365.com
 (2603:10a6:10:50f::21) with Microsoft SMTP Server (version=TLS1_3,
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
 by mailrelay.reygruppe.ch (Postfix) with ESMTP id 71F657FE41;
 Thu, 20 Aug 2026 08:56:47 +0200 (CEST)
To: buildroot@buildroot.org
CC: =?UTF-8?q?Stefan=20M=C3=BCller?= <stefan.mueller@rey-technology.com>
Date: Thu, 20 Aug 2026 06:56:42 +0000
Message-ID: <20260820065646.375321-2-stefan.mueller@rey-technology.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260820065646.375321-1-stefan.mueller@rey-technology.com>
References: <20260820065646.375321-1-stefan.mueller@rey-technology.com>
 <4e118c97-1508-4315-bc90-2b0b02fc43b2.a680deba-e8f9-456f-ab7c-ac325426e0a3.75ced6fd-b045-41d2-bd36-9e7d54446ec9@emailsignatures365.codetwo.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 2
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|ZR4P278MB1833:EE_|AM4PEPF00027A5F:EE_|ZRAP278MB0111:EE_|AMS0EPF00000193:EE_|ZR2P278MB1052:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e9a471e-c1b5-4f5e-e61b-08defe883b74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|13003099007|6133799003|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: ovvrX/T/NyrJzGCwnJkEKx/xmsJgx334JI5bXN3zJ8YKNrB7LxHL5SS5U1E8Ph3VWKql1wpXKCZEdvyZOa4vd+Y67/cyb2+b6zaGgBjlNDvqOnPdNOpaC5lz8LZ9BFSCKtvqoka09U2Z4Vbw/sxRLOYcuMGJ7AKlV5Qak+1Elf0EoKkNColcws7COZ+irgNRSUBZFzhSjj/8R89ZZN+yS17PTLe2xTWJ+9HHUekR+d2oZs9Ezy3AX4fY2HgJjS95ohq7WyazYYRYvx3kNEQQ06OF3HY8A3Bi5FJ8/BDMHUgnkgsK83Rbm2+o03zLz93hYeu81fE5SGu4jxg6vChyda76WwGtuCSvOCSdlFxVkMvUmlo4/5835G78gHSNn791z6VIA/jjQ3AGpfD+8r1YUan691A9FOEDisqScoj4yzkjt7o/UsIiWRWAkz+Re9SQqUilSJHTW4GPfvAKVUGOKQdQ5yAcfV2ajyQf/x9FUv06wqfkyI0AfB4RJsiTC6erNtZgViahbttL7hWt1p22NnFmWOuFTzIIjAF+NrvEmuTZQZ2IPOeG5jfgAgVwml5zo2tUsnPpvJ6H8EVemL9kYlnqFYV/CzHy3ZXUWMNTbPyYFbZcXZNZ9OXIkgjKBzX2IS8JWUOHnyGVldJ00b1f5w==
X-Forefront-Antispam-Report-Untrusted: CIP:213.196.177.45; CTRY:CH; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:mailrelay.reygruppe.ch;
 PTR:ftth-177-045.tbwil.ch; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(13003099007)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1102; 
X-Exchange-RoutingPolicyChecked: VNBQphPekDBUDvqyVwqi1C1ZnqZCZGjLeonNdQE+vPuig2BIexdKNhdBLCzm8naLzWuXCbSLiYVQtD/d0tshz182zdLEHhAN60wa6WMXn4QdAvxWjXSbIvL2rknGH6oj4I2+qr8HNRz2aoOcj0zd3RpZq95w3Ef9yRoj4B+86ZtUVPToEBON9H6Srpxke4yniY9elldJbdTSa3udn7kHHAD97jjt8/CALWxOsBzYHPdQh0PTYOUPwAPGnMAESPelgm2XXB0UEhIPuz7fuyCwLW14QKAGUQa8otGCufw8gZFGuFC3fo6gmmC28ENNhLfPE1tp8Hxttjz+TqOGVmkJUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR4P278MB1833
X-CodeTwo-MessageID: d4d5cb50-908a-4d00-8c6b-9b241b7425a6.20260820065652@de1-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: c7bcd818-37a2-4274-1a09-08defe883476
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|6049299003|1800799024|35042699022|36860700016|14060799003|7149299003|82310400026|23010399003|376014|22082099003|18002099003|4053099003|13003099007|10067099003|56012099006|4143699003|11063799006|4076899003|8096899003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info-Original: EBbrFDV5GmoIt1w8SLLSHZta8DnYV5Xk2Bs9OEY2MM7nMXIAc8mCHTWHa+pbyPD2cyFvX/65EA6oKrW5/yGNP4CoFVx3GP13uTTO7vX3M3gQFatz66XKWQmOhJGDKooCfylgQAc4s6Yd5iWY0HbyZ+uj3nuBV0jvam7nZOhNupM62yJZ/qp+xHLEYRNBK1Cdv/wRf3f8fvZeYk34jJ8ypaHhpL3n2DFTIxSqzn3Jxr+92qvCR3y5M1GC2WUvJKApXVq0NAMooA3YBODYQ9W72jvOoRo8N2TicwG83AqE5Ue9Z0xEpwQEysN7welrtEW7zkQ3rKHJuHd58dSBAqdKHNtcRzAD4iNVbvMGNQWO5s58nVgPlMfVLF96Fyzty7e49tA1UDFKc3qhv29OvlfbKVDGdely4J3QVwuCQlYPklejMgMAQu45S0M/MEGYm0JATR458uPWlqdIfWM37ELdQjFCtWQBZUZ6SkeeNWygMnTDpA/lSzm4q8vIpqAGVksQblswy3tWlWWqN3v5OeydZgB3Z7/u7dfSLmgblRXWx1VS6s3uEBWkaYjxrilLO3mSz4myOZxbck/aIYrG8Uc6bjP/Qmcg2hAiNLUswXk38O2+L+Z3Zf2/E3fkAda5o1ZzfZRXQVriF3s3OrJeL2XrXQ==
X-Forefront-Antispam-Report-Untrusted: CIP:20.79.220.33; CTRY:DE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:de1-emailsignatures-cloud.codetwo.com;
 PTR:de1-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(6049299003)(1800799024)(35042699022)(36860700016)(14060799003)(7149299003)(82310400026)(23010399003)(376014)(22082099003)(18002099003)(4053099003)(13003099007)(10067099003)(56012099006)(4143699003)(11063799006)(4076899003)(8096899003)(3023799007)(6133799003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0111
X-Lased-Spam: NonSpam
X-Lased-Spamprobability: 0.075858
X-Sophos-Mailflow-Processing-Id: 19323bb3baed4ad0a13c9e08f2141ce0
X-Lased-Impersonation: False
X-Lased-Hits: BODYTEXTH_SIZE_3000_MORE 0.000000, BODY_SIZE_10000_PLUS
 0.000000, BODY_SIZE_25K_PLUS 0.000000, DKIM_ALIGNS 0.000000, DKIM_SIGNATURE
 0.000000, HREF_LABEL_TEXT_ONLY 0.000000, IMG_AR_1 0.000000, IMG_ATTACHED_2P
 0.000000, IMP_FROM_NOTSELF 0.000000, IN_REP_TO 0.000000, LEGITIMATE_SIGNS
 0.000000, MULTIPLE_ATTACHMENTS 0.000000, MULTIPLE_REAL_RCPTS 0.000000,
 NO_FUR_HEADER 0.000000, OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000,
 PNG_PIXPERBYTE_LOW 0.000000, REFERENCES 0.000000, SINGLE_HREF_URI_IN_BODY
 0.000000, SUSP_DH_NEG 0.000000, URI_WITH_PATH_ONLY 0.000000, __ANY_URI
 0.000000, __ARCAUTH_DKIM_NONE 0.000000, __ARCAUTH_DMARC_PASSED 0.000000,
 __ARCAUTH_PASSED 0.000000, __ARC_SEAL_MICROSOFT 0.000000,
 __ARC_SIGNATURE_MICROSOFT 0.000000, __ATTACH_CTE_BASE64 0.000000,
 __ATTACH_CTE_QUOTED_PRINTABLE 0.000000, __BODY_NO_MAILTO 0.000000,
 __BODY_TEXT_X4 0.000000, __BULK_NEGATE 0.000000, __CC_NAME 0.000000,
 __CC_NAME_DIFF_FROM_ACC 0.000000, __CC_REAL_NAMES 0.000000,
 __COURIER_PHRASE 0.000000, __CP_URI_IN_BODY 0.000000, __CT 0.000000,
 __CTYPE_HAS_BOUNDARY 0.000000, __CTYPE_MULTIPART 0.000000, __DKIM_ALIGNS_1
 0.000000, __DKIM_ALIGNS_2 0.000000, __DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR
 0.000000, __DQ_NEG_IP 0.000000, __EXTRA_MPART_TYPE_N1 0.000000,
 __FILESHARE_PHRASE 0.000000, __FROM_DOMAIN_IN_ANY_CC1 0.000000,
 __FROM_DOMAIN_IN_RCPT 0.000000, __FROM_ENCODED 0.000000,
 __FROM_NAME_NOT_IN_BODY 0.000000, __FROM_UTF_Q 0.000000, __FUR_RDNS_SOPHOS
 0.000000, __HAS_ATTACHMENT 0.000000, __HAS_ATTACHMENT1 0.000000,
 __HAS_ATTACHMENT2 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
 __HAS_HTML 0.000000, __HAS_MSGID 0.000000, __HAS_REFERENCES 0.000000,
 __HAS_X_FF_ASR 0.000000, __HAS_X_FF_ASR_CAT 0.000000, __HAS_X_FF_ASR_SFV
 0.000000, __HAS_X_MAILER 0.000000, __HIGHBIT_ASCII_MIX 0.000000,
 __HREF_LABEL_TEXT 0.000000, __HREF_LABEL_URI 0.000000, __HTML_AHREF_TAG
 0.000000, __HTML_BAD_END 0.000000, __HTML_ENTITIES_X4 0.000000,
 __HTML_TAG_DIV 0.000000, __HTTPS_URI 0.000000, __IMG_ATTACHED 0.000000,
 __IMG_SIZE_1K_10K 0.000000, __IMP_FROM_MY_ORG 0.000000, __IMP_FROM_NOTSELF
 0.000000, __IN_REP_TO 0.000000, __JSON_HAS_SCHEMA_VERSION 0.000000,
 __JSON_HAS_TENANT_DOMAINS 0.000000, __JSON_HAS_TENANT_ID 0.000000,
 __JSON_HAS_TENANT_SCHEMA_VERSION 0.000000, __JSON_HAS_TENANT_VIPS 0.000000,
 __JSON_HAS_TRACKING_ID 0.000000, __MIME_ATTACHMENT_1_N 0.000000,
 __MIME_ATTACHMENT_N_2 0.000000, __MIME_ATTACHMENT_N_3 0.000000,
 __MIME_ATTACHMENT_N_4 0.000000, __MIME_HTML 0.000000, __MIME_TEXT_H
 0.000000, __MIME_TEXT_H1 0.000000, __MIME_TEXT_H2 0.000000, __MIME_VERSION
 0.000000, __MSGID_DOMAIN_IN_REFERENCES 0.000000, __OUTBOUND_SOPHOS_FUR
 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000, __OUTBOUND_SOPHOS_FUR_RDNS
 0.000000, __PART_2_IMAGE_PNG 0.000000, __PNG_AR_1 0.000000,
 __PRODUCT_TYPE_MAILFLOW 0.000000, __RCVD_NO_PTR 0.000000, __RCVD_PASS
 0.000000, __REFERENCES 0.000000, __SANE_MSGID 0.000000, __SCAN_D_NEG2
 0.000000, __SCAN_D_NEG_HEUR2 0.000000, __SL_HEAVY 0.000000,
 __STYLE_RATWARE_NEG 0.000000, __STYLE_TAG 0.000000,
 __SUBJ_STARTS_S_BRACKETS 0.000000, __TAG_EXISTS_BODY 0.000000,
 __TAG_EXISTS_HEAD 0.000000, __TAG_EXISTS_HTML 0.000000, __TAG_EXISTS_META
 0.000000, __TO_MALFORMED_2 0.000000, __TO_NO_NAME 0.000000, __URI_IN_BODY
 0.000000, __URI_MAILTO 0.000000, __URI_NOT_IMG 0.000000, __URI_NO_WWW
 0.000000, __URI_NS 0.000000, __URI_WITH_PATH 0.000000, __X_FF_ASR_SCL_NSP
 0.000000, __X_FF_ASR_SFV_NSPM 0.000000
X-Sophos-Email: [eu-central-1] Antispam-Engine: 6.0.3, AntispamData:
 2026.8.19.182719
X-Sophos-MH-Mail-Info-Key: NGhRWjRDNTBkSnpzV0RDLTE3Mi4yMC4wLjI0MA==
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7402bc54-c1ac-4b8e-c5e5-08defe8837bd
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|35042699022|376014|6049299003|23010399003|82310400026|7149299003|36860700016|13003099007|4053099003|6133799003|3023799007|56012099006|10067099003|4143699003|11063799006|8096899003|4076899003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: IiwFGTXHUeu8LCdNEhCh4a1xcBji7dj7+UzN2e8PKR260yDCHDOfSvnEaSpITEMe69EuaTKGS1UCTmZkBrjWBuJqJqB08QQFbb6k/gvn++hIvFYl0vfJNrUXOW3EeEafZxTVBgJzhmt1pL3s7Is1KQvvm1wWlR887lWjMloIL96tE/+yb6etnu6anRN0adOrAsE75DyLtKPt+W6qmo7wBUNzM94HD+gu4vf8iH6TvNcL7lx06xI0trm54GXF/pliY/iRJG4yDJfhVSqinslX1MsieEgpAUNF6UoP5UuEsIbDoq1/KZ7GAS0RHXqRO3hSjJ+uUPm8KuyvLMeRHKiQMH9mwhhz064Vczl+0qP4tcI8iLCkFwVn19H8yTWlZVt9VY+o7sAN7QOlYT1cQEheLLQqyM847KShTiWmTXvK8JfuH7P1/0VXy0Uf0RXlLaTF1+ZBsqVWU6xLLTvMkdo31rmBgShre0jCRTbe+i6wVFDWX5HXtWEIMgVTl6m0H8nlThDE+kBi6lQSwqyRbb/g4km0VcF0EwdDrWBgtp8Q9U73l4aFEquWz2uLycIA/5k6AbPAjJBSJfqHtM0L3RVO2GEdGnSL2ETJI3dN614LbF/m2S/cuvqkMmUHVPZeb1zYiBeCTBS+aoSsJqQ50zKQlg==
X-Forefront-Antispam-Report: CIP:94.140.18.226; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mfod-euc1.prod.hydra.sophos.com;
 PTR:mfod-euc1.prod.hydra.sophos.com; CAT:NONE;
 SFS:(13230040)(1800799024)(35042699022)(376014)(6049299003)(23010399003)(82310400026)(7149299003)(36860700016)(13003099007)(4053099003)(6133799003)(3023799007)(56012099006)(10067099003)(4143699003)(11063799006)(8096899003)(4076899003)(18002099003)(22082099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: p36RNemxub5CILraPFvhfKt1C8Eg0+0Xl2t8WUuuWYasbJUC+WGznPk/+d3/tER47YX6lFBMxr61VIsEd6LssgzN5aFKljyxT+H+YXcCv2mFXgK91rvw8fASlwtWCbF6e2XWCC2hNHBdErTpz3AjE4EoX4HeDR0Alrbu4eNCXu9Gp6zn1F6DQPwwX6jSsx50eMqwi3zUMdWxxN1PrLGcMPeCd6fFpGQ9mV+VDXpygLv2Wz3hCY/rKg1whJE9CKRL7EPvxhd78vkWm4NOgw/8xWKaCtp2LjNK5Cq+d8i/MqAmLaIOwro0/BqfWEXWgSBPjYCARRhOZcHFv7BfqsrwfdoRqCsdUFz770mZTqqR58dMeM/QlGsL2mLlH9eajvgvRIgq/H228H+BQAHDSkLxIuW50/U3p2+y1d++1VKot8lRzdbtrX2K5s5PYitf4Llw
X-OriginatorOrg: rey-technology.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 06:56:59.9032 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9a471e-c1b5-4f5e-e61b-08defe883b74
X-MS-Exchange-CrossTenant-Id: 7137cfb5-c814-4224-8896-1b4a6ff99146
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=7137cfb5-c814-4224-8896-1b4a6ff99146; Ip=[94.140.18.226];
 Helo=[mfod-euc1.prod.hydra.sophos.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR2P278MB1052
Subject: [Buildroot] [PATCH 1/5] package/libssh2: fix CVE-2025-15661
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
Content-Type: multipart/mixed; boundary="===============6304465973387251000=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6304465973387251000==
Content-Type: multipart/related;
	boundary="_1661dd6f-a72e-4e19-824f-c5a358955201_"

--_1661dd6f-a72e-4e19-824f-c5a358955201_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text -->
<style>.EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left: #800=
000 2px solid; }</style></head>
<body>
<font size=3D"2"><div class=3D"PlainText">Backport the SFTP symlink bounds =
checking fix for CVE-2025-15661.<br>
<br>
The initial fix requires the LIBSSH2_UNCONST compatibility backport on<br>
libssh2 1.11.1. Also include the upstream follow-up fixing<br>
SSH_FXP_STATUS handling introduced by the initial security fix.<br>
<br>
The patches are based on the upstream fixes and Debian's libssh2 1.11.1<br>
backports.<br>
<br>
Signed-off-by: Stefan M=C3=BCller &lt;stefan.mueller@rey-technology.com&gt;=
<br>
---<br>
Backport to: 2025.02.x<br>
---<br>
&nbsp;...-sftp-symlink-fix-out-of-bounds-read.patch | 116 &#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<b=
r>
&nbsp;...ibssh2-priv-backport-LIBSSH2_UNCONST.patch |&nbsp; 29 &#43;&#43;&#=
43;&#43;&#43;<br>
&nbsp;...-symlink-fix-SSH_FXP_STATUS-response.patch |&nbsp; 46 &#43;&#43;&#=
43;&#43;&#43;&#43;&#43;<br>
&nbsp;package/libssh2/libssh2.mk&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 5 &#43;<br>
&nbsp;4 files changed, 196 insertions(&#43;)<br>
&nbsp;create mode 100644 package/libssh2/0004-sftp-symlink-fix-out-of-bound=
s-read.patch<br>
&nbsp;create mode 100644 package/libssh2/0005-libssh2-priv-backport-LIBSSH2=
_UNCONST.patch<br>
&nbsp;create mode 100644 package/libssh2/0006-sftp-symlink-fix-SSH_FXP_STAT=
US-response.patch<br>
<br>
diff --git a/package/libssh2/0004-sftp-symlink-fix-out-of-bounds-read.patch=
 b/package/libssh2/0004-sftp-symlink-fix-out-of-bounds-read.patch<br>
new file mode 100644<br>
index 0000000000..142dda81c9<br>
--- /dev/null<br>
&#43;&#43;&#43; b/package/libssh2/0004-sftp-symlink-fix-out-of-bounds-read.=
patch<br>
@@ -0,0 &#43;1,116 @@<br>
&#43;From 2dae3024897e1898d389835151f4e9606227721d Mon Sep 17 00:00:00 2001=
<br>
&#43;From: Will Cosgrove &lt;will@panic.com&gt;<br>
&#43;Date: Fri, 10 Oct 2025 08:26:20 -0700<br>
&#43;Subject: [PATCH] Update sftp_symlink to avoid out of bounds read on ma=
lformed<br>
&#43; packet #1705 (#1717)<br>
&#43;<br>
&#43;<br>
&#43;CVE: CVE-2025-15661<br>
&#43;Upstream: <a href=3D"https://github.com/libssh2/libssh2/commit/2dae302=
4897e1898d389835151f4e9606227721d">https://github.com/libssh2/libssh2/commi=
t/2dae3024897e1898d389835151f4e9606227721d</a><br>
&#43;Signed-off-by: Stefan M=C3=BCller &lt;stefan.mueller@rey-technology.co=
m&gt;<br>
&#43;---<br>
&#43;--- libssh2-1.11.1.orig/src/sftp.c<br>
&#43;&#43;&#43;&#43; libssh2-1.11.1/src/sftp.c<br>
&#43;@@ -3795,15 &#43;3795,19 @@ static int sftp_symlink(LIBSSH2_SFTP *sf<b=
r>
&#43; {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; LIBSSH2_CHANNEL *channel =3D sftp-&gt;channel=
;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; LIBSSH2_SESSION *session =3D channel-&gt;sess=
ion;<br>
&#43;-&nbsp;&nbsp;&nbsp; size_t data_len =3D 0, link_len;<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; size_t data_len =3D 0, lk_len;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; /* 13 =3D packet_len(4) &#43; packet_type(1) =
&#43; request_id(4) &#43; path_len(4) */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; ssize_t packet_len =3D<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; path_len &#43; 13 &#4=
3;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((link_type =3D=3D LI=
BSSH2_SFTP_SYMLINK) ? (4 &#43; target_len) : 0);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; unsigned char *s, *data =3D NULL;<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; struct string_buf buf;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; static const unsigned char link_responses[2] =
=3D<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { SSH_FXP_NAME, SSH_F=
XP_STATUS };<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; int retcode;<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; unsigned char packet_type;<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; uint32_t tmp_u32;<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; unsigned char *lk_target;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; if(sftp-&gt;symlink_state =3D=3D libssh2_NB_s=
tate_idle) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sftp-&gt;last_errno =
=3D LIBSSH2_FX_OK;<br>
&#43;@@ -3891,8 &#43;3895,25 @@ static int sftp_symlink(LIBSSH2_SFTP *sf<br=
>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; sftp-&gt;symlink_state =3D libssh2_NB_state_i=
dle;<br>
&#43;<br>
&#43;-&nbsp;&nbsp;&nbsp; if(data[0] =3D=3D SSH_FXP_STATUS) {<br>
&#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retcode =3D _libssh2_ntohu=
32(data &#43; 5);<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; buf.data =3D (unsigned char *)LIBSSH2_UNCONST(=
data);<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; buf.dataptr =3D buf.data;<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; buf.len =3D data_len;<br>
&#43;&#43;<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; if(_libssh2_get_byte(&amp;buf, &amp;packet_typ=
e)) {<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LIBSSH2_FREE(session, =
data);<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return _libssh2_error(=
session, LIBSSH2_ERROR_SFTP_PROTOCOL,<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SFTP Protocol Error (type)&quot;);=
<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; }<br>
&#43;&#43;<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; if(packet_type =3D=3D SSH_FXP_STATUS) {<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(_libssh2_get_u32(&a=
mp;buf, &amp;tmp_u32)) {<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; LIBSSH2_FREE(session, data);<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SFTP Proto=
col Error (code)&quot;);<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&#43;<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retcode =3D (int)tmp_u=
32;<br>
&#43;&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LIBSSH2_FREE(session,=
 data);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(retcode =3D=3D LIB=
SSH2_FX_OK)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; return LIBSSH2_ERROR_NONE;<br>
&#43;@@ -3903,30 &#43;3924,37 @@ static int sftp_symlink(LIBSSH2_SFTP *sf<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;-&nbsp;&nbsp;&nbsp; if(_libssh2_ntohu32(data &#43; 5) &lt; 1) {<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; /* advance past id */<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; if(_libssh2_get_u32(&amp;buf, &amp;tmp_u32)) {=
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LIBSSH2_FREE(session,=
 data);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return _libssh2_error=
(session, LIBSSH2_ERROR_SFTP_PROTOCOL,<br>
&#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Invalid READLINK/REALPATH response, &q=
uot;<br>
&#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;no name entries&quot;);<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SFTP Protocol Error (id)&quot;);<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;-&nbsp;&nbsp;&nbsp; if(data_len &lt; 13) {<br>
&#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(data_len &gt; 0) {<br>
&#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LI=
BSSH2_FREE(session, data);<br>
&#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; /* look for at least one link */<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; if(_libssh2_get_u32(&amp;buf, &amp;tmp_u32) ||=
 tmp_u32 &lt; 1) {<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LIBSSH2_FREE(session, =
data);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return _libssh2_error=
(session, LIBSSH2_ERROR_SFTP_PROTOCOL,<br>
&#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SFTP stat packet too short&quot;);<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;Invalid READLINK/REALPATH response, &quot;<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;no name entries&quot;);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;-&nbsp;&nbsp;&nbsp; /* this reads a u32 and stores it into a signed 32=
bit value */<br>
&#43;-&nbsp;&nbsp;&nbsp; link_len =3D _libssh2_ntohu32(data &#43; 9);<br>
&#43;-&nbsp;&nbsp;&nbsp; if(link_len &lt; target_len) {<br>
&#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(target, data &#43; =
13, link_len);<br>
&#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; target[link_len] =3D 0;<br=
>
&#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retcode =3D (int)link_len;=
<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; if(_libssh2_get_string(&amp;buf, &amp;lk_targe=
t, &amp;lk_len) =3D=3D LIBSSH2_ERROR_NONE) {<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(lk_len &lt; target_=
len) {<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; memcpy(target, lk_target, lk_len);<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; target[lk_len] =3D '\0';<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; retcode =3D (int)lk_len;<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else {<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; retcode =3D LIBSSH2_ERROR_BUFFER_TOO_SMALL;<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;-&nbsp;&nbsp;&nbsp; else<br>
&#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retcode =3D LIBSSH2_ERROR_=
BUFFER_TOO_SMALL;<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; else {<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LIBSSH2_FREE(session, =
data);<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return _libssh2_error(=
session, LIBSSH2_ERROR_SFTP_PROTOCOL,<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SFTP Protocol Error (filename)&quo=
t;);<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; }<br>
&#43;&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; LIBSSH2_FREE(session, data);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; return retcode;<br>
diff --git a/package/libssh2/0005-libssh2-priv-backport-LIBSSH2_UNCONST.pat=
ch b/package/libssh2/0005-libssh2-priv-backport-LIBSSH2_UNCONST.patch<br>
new file mode 100644<br>
index 0000000000..34ad92409c<br>
--- /dev/null<br>
&#43;&#43;&#43; b/package/libssh2/0005-libssh2-priv-backport-LIBSSH2_UNCONS=
T.patch<br>
@@ -0,0 &#43;1,29 @@<br>
&#43;Needed by the fix for CVE-2025-15661<br>
&#43;<br>
&#43;Cherrypicked from<br>
&#43;commit 606c102e52f8447de2b745dd6c5ddf418defc519<br>
&#43;Author: Viktor Szakats &lt;commit@vsz.me&gt;<br>
&#43;Date:&nbsp;&nbsp; Thu Jan 30 21:18:23 2025 &#43;0100<br>
&#43;<br>
&#43;<br>
&#43;CVE: CVE-2025-15661<br>
&#43;Upstream: <a href=3D"https://github.com/libssh2/libssh2/commit/606c102=
e52f8447de2b745dd6c5ddf418defc519">https://github.com/libssh2/libssh2/commi=
t/606c102e52f8447de2b745dd6c5ddf418defc519</a><br>
&#43;Signed-off-by: Stefan M=C3=BCller &lt;stefan.mueller@rey-technology.co=
m&gt;<br>
&#43;---<br>
&#43;--- libssh2-1.11.1.orig/src/libssh2_priv.h<br>
&#43;&#43;&#43;&#43; libssh2-1.11.1/src/libssh2_priv.h<br>
&#43;@@ -117,6 &#43;117,14 @@<br>
&#43; #define UINT32_MAX 0xffffffffU<br>
&#43; #endif<br>
&#43;<br>
&#43;&#43;#ifdef _WIN64<br>
&#43;&#43;#define LIBSSH2_UNCONST(p)&nbsp; ((void *)(libssh2_uint64_t)(cons=
t void *)(p))<br>
&#43;&#43;#elif defined(_MSC_VER)<br>
&#43;&#43;#define LIBSSH2_UNCONST(p)&nbsp; ((void *)(unsigned int)(const vo=
id *)(p))<br>
&#43;&#43;#else<br>
&#43;&#43;#define LIBSSH2_UNCONST(p)&nbsp; ((void *)(uintptr_t)(const void =
*)(p))<br>
&#43;&#43;#endif<br>
&#43;&#43;<br>
&#43; #if (defined(__GNUC__) || defined(__clang__)) &amp;&amp; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; defined(__STDC_VERSION__) &amp;&amp; (__STDC_=
VERSION__ &gt;=3D 199901L) &amp;&amp; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; !defined(LIBSSH2_NO_FMT_CHECKS)<br>
diff --git a/package/libssh2/0006-sftp-symlink-fix-SSH_FXP_STATUS-response.=
patch b/package/libssh2/0006-sftp-symlink-fix-SSH_FXP_STATUS-response.patch=
<br>
new file mode 100644<br>
index 0000000000..2883c102dc<br>
--- /dev/null<br>
&#43;&#43;&#43; b/package/libssh2/0006-sftp-symlink-fix-SSH_FXP_STATUS-resp=
onse.patch<br>
@@ -0,0 &#43;1,46 @@<br>
&#43;From 4ed26f5740bdd409269ed9fb48a28bf8f565b681 Mon Sep 17 00:00:00 2001=
<br>
&#43;From: Will Cosgrove &lt;will@panic.com&gt;<br>
&#43;Date: Mon, 20 Oct 2025 14:04:52 -0700<br>
&#43;Subject: [PATCH] Fix sftp_symlink when getting SSH_FXP_STATUS response=
 (#1731)<br>
&#43;<br>
&#43;Move advancing past packet ID before reading the FXP_STATUS response.<=
br>
&#43;<br>
&#43;CVE: CVE-2025-15661<br>
&#43;Upstream: <a href=3D"https://github.com/libssh2/libssh2/commit/4ed26f5=
740bdd409269ed9fb48a28bf8f565b681">https://github.com/libssh2/libssh2/commi=
t/4ed26f5740bdd409269ed9fb48a28bf8f565b681</a><br>
&#43;Signed-off-by: Stefan M=C3=BCller &lt;stefan.mueller@rey-technology.co=
m&gt;<br>
&#43;---<br>
&#43; src/sftp.c | 14 &#43;&#43;&#43;&#43;&#43;&#43;&#43;-------<br>
&#43; 1 file changed, 7 insertions(&#43;), 7 deletions(-)<br>
&#43;<br>
&#43;diff --git a/src/sftp.c b/src/sftp.c<br>
&#43;index 70d7686daf..bb297b831a 100644<br>
&#43;--- a/src/sftp.c<br>
&#43;&#43;&#43;&#43; b/src/sftp.c<br>
&#43;@@ -4006,6 &#43;4006,13 @@ static int sftp_symlink(LIBSSH2_SFTP *sftp,=
 const char *path,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SFTP Protocol Error (type)&quot;)=
;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; /* advance past id */<br>
&#43;&#43;&nbsp;&nbsp;&nbsp; if(_libssh2_get_u32(&amp;buf, &amp;tmp_u32)) {=
<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LIBSSH2_FREE(session, =
data);<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return _libssh2_error(=
session, LIBSSH2_ERROR_SFTP_PROTOCOL,<br>
&#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SFTP Protocol Error (id)&quot;);<b=
r>
&#43;&#43;&nbsp;&nbsp;&nbsp; }<br>
&#43;&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; if(packet_type =3D=3D SSH_FXP_STATUS) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(_libssh2_get_u32(&=
amp;buf, &amp;tmp_u32)) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; LIBSSH2_FREE(session, data);<br>
&#43;@@ -4025,13 &#43;4032,6 @@ static int sftp_symlink(LIBSSH2_SFTP *sftp,=
 const char *path,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;-&nbsp;&nbsp;&nbsp; /* advance past id */<br>
&#43;-&nbsp;&nbsp;&nbsp; if(_libssh2_get_u32(&amp;buf, &amp;tmp_u32)) {<br>
&#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LIBSSH2_FREE(session, data=
);<br>
&#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return _libssh2_error(sess=
ion, LIBSSH2_ERROR_SFTP_PROTOCOL,<br>
&#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SFTP Protocol Error (id)&quot;);<br>
&#43;-&nbsp;&nbsp;&nbsp; }<br>
&#43;-<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; /* look for at least one link */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; if(_libssh2_get_u32(&amp;buf, &amp;tmp_u32) |=
| tmp_u32 &lt; 1) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LIBSSH2_FREE(session,=
 data);<br>
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk<br>
index 0ccf5effb3..6b2d774b38 100644<br>
--- a/package/libssh2/libssh2.mk<br>
&#43;&#43;&#43; b/package/libssh2/libssh2.mk<br>
@@ -22,6 &#43;22,11 @@ LIBSSH2_IGNORE_CVES &#43;=3D CVE-2026-55199<br>
&nbsp;# 0003-transport-c-Additional-boundary-checks-for-packet-length.patch=
<br>
&nbsp;LIBSSH2_IGNORE_CVES &#43;=3D CVE-2026-55200<br>
&nbsp;<br>
&#43;# 0004-sftp-symlink-fix-out-of-bounds-read.patch<br>
&#43;# 0005-libssh2-priv-backport-LIBSSH2_UNCONST.patch<br>
&#43;# 0006-sftp-symlink-fix-SSH_FXP_STATUS-response.patch<br>
&#43;LIBSSH2_IGNORE_CVES &#43;=3D CVE-2025-15661<br>
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

--_1661dd6f-a72e-4e19-824f-c5a358955201_
Content-Description: linkedinmedium_e5ee0685-3767-4ffd-a5c5-9e4e3fc32352.png
Content-Type: image/png;
	name="linkedinmedium_e5ee0685-3767-4ffd-a5c5-9e4e3fc32352.png"
Content-Disposition: inline;
	filename="linkedinmedium_e5ee0685-3767-4ffd-a5c5-9e4e3fc32352.png"
Content-Transfer-Encoding: base64
Content-ID: <linkedinmedium_e5ee0685-3767-4ffd-a5c5-9e4e3fc32352.png>

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

--_1661dd6f-a72e-4e19-824f-c5a358955201_
Content-Description: instagrammedium_908c8ebd-b03d-4881-a6e2-043808ead83d.png
Content-Type: image/png;
	name="instagrammedium_908c8ebd-b03d-4881-a6e2-043808ead83d.png"
Content-Disposition: inline;
	filename="instagrammedium_908c8ebd-b03d-4881-a6e2-043808ead83d.png"
Content-Transfer-Encoding: base64
Content-ID: <instagrammedium_908c8ebd-b03d-4881-a6e2-043808ead83d.png>

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

--_1661dd6f-a72e-4e19-824f-c5a358955201_
Content-Description: teamsmedium_9934c99a-98a5-42b7-9a66-2bebfdd7ebf1.png
Content-Type: image/png;
	name="teamsmedium_9934c99a-98a5-42b7-9a66-2bebfdd7ebf1.png"
Content-Disposition: inline;
	filename="teamsmedium_9934c99a-98a5-42b7-9a66-2bebfdd7ebf1.png"
Content-Transfer-Encoding: base64
Content-ID: <teamsmedium_9934c99a-98a5-42b7-9a66-2bebfdd7ebf1.png>

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
615O/QJTAQAAAABJRU5ErkJggg==

--_1661dd6f-a72e-4e19-824f-c5a358955201_--

--===============6304465973387251000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6304465973387251000==--
