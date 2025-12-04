Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857EBD20690
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 13:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BBAB61BAC;
	Thu,  4 Dec 2025 13:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NtHnuKdWdnP; Thu,  4 Dec 2025 13:27:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BB9161BA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764854837;
	bh=QCqucnj6+pYPUACwiWJl7BVx/p06/hDlwCMNRGB6qaA=;
	h=Date:References:In-Reply-To:To:CC:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i/t7mGfCr2pRWrQkFcxnXMc4hcdY/HR9Cfy372nvM0uRY5cyFopcr2NoIp63r21Iq
	 u0lfDKizuILX9lHYxABDt/xdw1Uyaw/DbSEqNEr/oTMIIOfB5XXBY093DbWx95g3zu
	 76n2caXg645eNiNvTyz9nv1uKi03w8eHS+lbk4P7Kt3HzF2sy0zWY5AWFEoru0bKsm
	 LGPHK3ZxiuN+v1b34/c7TskXLPobqK2J/uWHnYtyI7mhRqlulAWgnTrr7jJJMLHBUO
	 OhtMnAC5NPJOkiE1G/sZLaZEv3Eso3/6iSDoFmmNgB1xj/YD+HAfur/ST4oZU+74oj
	 +qLHhpAW9uyMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BB9161BA9;
	Thu,  4 Dec 2025 13:27:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 42B02D3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28BF861BA9
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZjENnmfvBLYd for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 13:27:14 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c112::7;
 helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=bb@ti.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D5DB61B77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D5DB61B77
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::7])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D5DB61B77
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:27:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAxJ16IYAgjeL8rx3Z7I6m0MxC6TUsjCymZSibxYL3VwFDE2gi2wAck0avnDlPM+G2ywekTRJOgsfP/QNYvQns0IG09SxoT+Ak85iBclxwsBytemBJj8O0PMmqqPgGWLSsBKMh27O/c/IqWymhLr5WeMpMa5F75e87m04rdkKQKcWwq82W6jZAAbbMYZG49phua8/VPovPP6PgVXABsHflCIbqR/WDqih7RGgPF3SdMYkMN1Soj4e0aNphROIuBbAnySOUyVVr9dYAk2V/wEKbk6WV+Zb78+bKjBi7kKFo0hxn6lrD0zSLcaEpSyODwP5LZ4eUfFPIIHM43C2PqarQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJCoreivzew4EnW8P56o+5UUYQZmdumE2HAmV7zrGRo=;
 b=W1sW8UMB9QOxOqcLz6zunRJxns3OtUyd5PSwJ7RqHAX4A3+9f8GaN+kkJEkbOdOIqF5VHJ6epWRkzlE9K34H0xZSP4OkG6vWdXMYPFBnPZEeGjeEKFsgzCYjSmuquLFF54QDDtmHJJ5ejx2BB7mMm4Ik+0KQk71YwmyZ0CwuvqKMAt1x7fiTKLASYPuj0tqD0OtYr+YHvb6c97YUXQOxy1+4pl5OrICo53d5b/vDGZYYBLlypNF7oIPM7y/Lriwl60me3plZNLquw4VAOsPqMCaDWIDuO/fi/Zx99pwFByDCrzU89NQaJpeXrdshXDFaDpLG15mDMyYcs7JVhFkQvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=senzilla.io smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
Received: from SJ0PR13CA0126.namprd13.prod.outlook.com (2603:10b6:a03:2c6::11)
 by PH3PPFD88A49DCD.namprd10.prod.outlook.com (2603:10b6:518:1::7c9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 13:27:10 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::2c) by SJ0PR13CA0126.outlook.office365.com
 (2603:10b6:a03:2c6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.0 via Frontend Transport; Thu, 4
 Dec 2025 13:27:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Thu, 4 Dec 2025 13:27:09 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 07:27:05 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 07:27:04 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 4 Dec 2025 07:27:04 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B4DR4wr1612968;
 Thu, 4 Dec 2025 07:27:04 -0600
Date: Thu, 4 Dec 2025 07:27:00 -0600
MIME-Version: 1.0
Message-ID: <20251204-uboot-bl1-v1-1-ce8e01d73906@ti.com>
References: <20251204-uboot-bl1-v1-0-ce8e01d73906@ti.com>
In-Reply-To: <20251204-uboot-bl1-v1-0-ce8e01d73906@ti.com>
To: <buildroot@buildroot.org>
CC: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1830; i=bb@ti.com;
 h=from:subject:message-id; bh=HNT3yDiPTFtIh3LfHHe/SKwQb7rKlsnSZfindfKNm5w=;
 b=owNCWmg5MUFZJlNZ4ZaFJgAAZ////7bb1vPt7Hq71/e/dfTr27S/fNdDjfKn7vvfz/7P+v6wA
 RswIeoDTQaaaANBoDIA0BoNABo0NDTQGho0AaADQeo00eoaNAAMJiaaZo1BhpkiBkaNADQ0000a
 aMCZGQ000YTIaNGAmmhkGRoaGgaNDQaaGmgNADQaAxqAMgaYcmINABkNNMm1ANGjCDAIaAADQZA
 YBMAIwmhkZBkAAAAGQZDIAGDDI2ZtYrUSRMlNSFE2lqTNAjPunCRzYTJguUFdRCRd7VFiAB2c9M
 s7wYQjtcn8hqAFAcLB+PF+JcTurR7HDWG0LHJZp+umcNSUUjkeB0ls1HV8srIBgj2oyIjR3Etr9
 +2gPrk7snhAjbwWedcGMhpAngrSCYdaVur0SPlMCXYqbxnyf9lwNCgf2rB4xDRMPi0UbISV83mc
 smf56ZzWhDtWMlH8YNLw761PEWwPglKLoolvmwxowOF3Hp+xDgKaiz9BBlqjrKNe2n6NDArgiYU
 BSOPZ2OeOLYK8kQO4r+OnLtIfqVbNgPkHAVt7OprhbK66JXHV7QuRZF1C9qIFqfYrEp9LHRkyTo
 UYykDH1WxX3Q1ScsAnMZzfraqiRBIUQAHTSFXdllMm6PzeEIIp52vYO5eDLnDgXdFuU4h0UcBGO
 M8w+bobvP8XckU4UJDhloUm
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|PH3PPFD88A49DCD:EE_
X-MS-Office365-Filtering-Correlation-Id: c1752fa0-af56-436d-10b3-08de3338d3c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHZ3bVlRYWU0MWNHUktob3VuSmFkbTJ6SERKVTVnVGZOMFowU1lOSE1pczdz?=
 =?utf-8?B?aitFMjBQK3NISnNteVBtQ1BmK3l4VEFPNklkZ05jbGt6TVpqekhlbVorK01Z?=
 =?utf-8?B?R29YQkoyb1J0bjdPY29RSlhYS3c1TE1BclZwRmVoSWYvdFZRaUVic1FHZCty?=
 =?utf-8?B?U2ZRQmdCNk1KbldTbDNXaGwxV3FpWk5TbDhYc1hldVgvUlk2UHNjcUgzaDI0?=
 =?utf-8?B?MTVlR2hOQ1NLZWs2VmQ2QWNIZnpDdyt6MDRGeTJ3VS81R1c0NnRVc1pvd2U5?=
 =?utf-8?B?M0JXU0J0Mm9FSE1GQ2plTVNjWDh6VityZDNPUTB3cmVwS2tsSHBVUFQzSEk3?=
 =?utf-8?B?ZE93cXc0QWNnVWVvc09oV0ZRWTBLczBoYnI0RnJVOENxZTQ5UXJMM3RxWkVZ?=
 =?utf-8?B?L0JOa09PYXRHOEpoekRYSjRKZXVkeDhuT2hSSjNka2hhanNKTnkxNkFvSHRy?=
 =?utf-8?B?YTUwQW1BejVna2huNG9OMFd2T1hJNXR4K1FaNExGUU54TmFZNWR1TlZ4RUVQ?=
 =?utf-8?B?RHVhR1NvWSs2QWp3WWZWTkRBSElyOUYzaENveEV0UUZ6aUlZZ1JpdXBGL2lG?=
 =?utf-8?B?ZlhBZ2g0YW1PQTZmd0tUSml4Titxb3VkbmFpaUxENVpKNEROYzlSUEQ2WWFm?=
 =?utf-8?B?V291cWgzRmV4OEFlWEkyY2ZLS2dFNFJLY0E5S0NUS1dIYU5CTDJSaGpCa3Rn?=
 =?utf-8?B?RUxaclVZRTIzbXlkOTdkOFYyc0VCczNheUsvem1BQ2ZvSzFqYVNKT0tGVWpO?=
 =?utf-8?B?cWsydmJCY3dNTnJvTGZkUGs0aTZqdGJ2eGJUbGF0N25lSU0vNE1UblBvUmpm?=
 =?utf-8?B?Um9vZHlFc3pydTFlU0xYNWNPR2U0cndDWWk2YUJQMGxqM0ljSjFhU0JYS0xZ?=
 =?utf-8?B?TmtnTkxxbEE5MThpcVJORmlsZGhYSEphTyswWW92WE5EWnlCVWN0TUN4ZGx2?=
 =?utf-8?B?TTZzL2hXSjlGdUlVWllDUFhhcXk3UTJrRVJxTUZXUS8yRWptTTJsOUNxYVE1?=
 =?utf-8?B?VlpDd0dVNjdSOTVCbHBQQjB1NlBwTmhORTdPeGxHbk55UmVzK2lrL1ZvYmQ1?=
 =?utf-8?B?ZU5rR2lPNHRQR1VxbFlwQy9iRlNiYllyNnFyM3QybjBrS1h5SEM1V1h4TEhi?=
 =?utf-8?B?NGx5anlPRC9NNW9SWVllbFl2TVE5djM3ZFQ3UHlvV2Rla04rOU9WOVk0OURP?=
 =?utf-8?B?cVU1UDVPWm5PbUlUNGF4empBU0k0K3F5K3lEMlB1eDNobERtVWVEQ3krNklm?=
 =?utf-8?B?Qi9nM2JmZWtEcE8wM1hlZHBuV0dwM0NLalpPQktjME4rR1c1OFVRQzBVM3lZ?=
 =?utf-8?B?NHVpN1lVWlpRcnk2dHNBWCs3cXN1Tk8vMFNZdmxwTjRycmpaN1FWTFQwb1RQ?=
 =?utf-8?B?ZjRXa2M3OFRaT1lTa0hxWDZVVkNvZVdiVi9paVNtRmwwRURxN253Zlo3aUtP?=
 =?utf-8?B?TDhxSHUybUlTLzlDZW1pQUg1VHFpd0txV0RaVGlnLzB5bXpIQ3BVOTVHandS?=
 =?utf-8?B?TkNPa0lSc2ZiLzFWK3dKNjUxejF1ajlvOXQ5TU1zSThLU2NMWnZnQldtV0o4?=
 =?utf-8?B?SW9SNnlUdVhMVHU2V3VQald5TVE0dkZBR0xxZHlaMTNPcDJvMHNQbkFVb3l3?=
 =?utf-8?B?TTByV0NjclhUZmNXcllLbTVSL3NXNzVpT1J6ZUhLOUxiUnZqVDN0WW1JTGVC?=
 =?utf-8?B?MkFSRVozUXphdzYrWlVFL3IyZHNqUnVlWDFxbXRCK2tuQjVzSEE2SU1JekUx?=
 =?utf-8?B?emVrT1RhSzQyMUtxYWQwa1l2cElyNThCWkRmVS92YmVMZFV5QjBoQ2JtaDcr?=
 =?utf-8?B?bGlwN0Nmdmd6bGp2MnU0QXc4VUs2WjM3SWVsVzVOM2p4aVN2MkJuaWYrSmk5?=
 =?utf-8?B?b1ZLRmVwcXZEb3lEQnFmTXJQbVFNRkdXL2NzK25iaFVQbnF6VytyOElQaTFj?=
 =?utf-8?B?a0xiZWpMN3psaUxlQ1h6Mi9raTFZdzc5YktOUzlGMHJoNEJKK3drMDUxZFFH?=
 =?utf-8?B?M3NicUhCMHZxZkV3OGlmNERrOVFVS2JKWGdMU2pZdTArdCtGWktxV1NwbXA1?=
 =?utf-8?B?YitSc29rTk9zNVZQNmpwdnR5SDdtWm83WXZ0VC9sTHhLRm5kZVdCeUJpaHlz?=
 =?utf-8?Q?4mAk=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE; SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 13:27:09.6543 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1752fa0-af56-436d-10b3-08de3338d3c4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD88A49DCD
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJCoreivzew4EnW8P56o+5UUYQZmdumE2HAmV7zrGRo=;
 b=Y8QoifKId3F/a5Zjt5HBbxOtr2m8+Tw5aPO9tWtczAw4tAVMo8/nGAfGxC916EG16UtQ0XoV57S+b3edshmTuV25LL+tgvlhAaBqEDviLHluzByOSpXjq+3vwRCLU/OI77ztbhYjtW1AmNNOJeFH9gtXzoNnm2BFLLRTseRUqHs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=Y8QoifKI
Subject: [Buildroot] [PATCH 1/2] boot/arm-trusted-firmware: add option to
 build BL1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some SoCs use the BL1 target to initialize the Cortex-A core and DDR
early in the boot before jumping to U-Boot to initialize the rest of the
SoC and board. Add the BL1 as a make target

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 boot/arm-trusted-firmware/Config.in               | 7 +++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 72684e5974c1c0c9f8f3453254c5699a0a5d7106..42c5f06503c1c90a54e501df97af409560477c27 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -108,6 +108,13 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP
 	  platforms were ATF encapsulates the second stage bootloader
 	  (such as U-Boot).
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL1
+	bool "Build BL1 image"
+	help
+	  This option enables building the BL1 image. This is
+	  typically used on platforms where another bootloader (e.g
+	  U-Boot) encapsulates BL1.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
 	bool "Build BL31 image"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index dca16d396044c5004480fdfb4cf15df6837b4413..1f0ecb290f9010d82b3bfea7b0583c7a0779d6f0 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -160,6 +160,10 @@ ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += pbl
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += RCW=$(BINARIES_DIR)/PBL.bin
 endif
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL1),y)
+ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += bl1
+endif
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31),y)
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += bl31
 endif

-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
