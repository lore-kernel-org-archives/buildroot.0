Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BD2D20688
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 13:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EA27846B1;
	Thu,  4 Dec 2025 13:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFT7R9wLa0xQ; Thu,  4 Dec 2025 13:27:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 399AC846B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764854840;
	bh=rCnMuJUxc3pkGuoMCBiVWZqsV9aVHmvi8z5dVa27Abg=;
	h=Date:To:CC:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=MxmnFVTeaUJHnCdFUhp+9JY738v2Xdkhk13kSDpz8XKe/tMT7S0tEJ5b5tCZBIHoi
	 sT/Q10idRjNsomWqhaZZWahLrJB0NgRqy3FWB9jIt/uvo1ltkYJE5zqOQHABI3Idat
	 fo8CA8dGlZJT/cXmTqQScE95gDZbKIWmrb0GfRWTtdxLiNfqV8Vg9VoiePLpnMZOYG
	 B4Bm45W4crf6WzXvbdAps1Zq8NHOiG8ojK1cw/mUKAIAYoXn/R+s4diTk4LB823nCA
	 ZXVaoLwe5aPPWSndWXjUBVcmWR/Mxkz+l+g8k4oJ/S4m2Uy2GKytO8GOIkCmgsqVqV
	 EEIktMvJpJ8Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 399AC846B2;
	Thu,  4 Dec 2025 13:27:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A65F2D3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 980F840384
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAW903V9MpDA for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 13:27:18 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c000::1;
 helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=bb@ti.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CFE6140082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFE6140082
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c000::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFE6140082
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:27:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyPYKTHAfkDYCe9+I6DBQ3+V2JiRA+wkvpbgVKH6PTwoqomOPyIIqqAOf6mUyISdtAvtqP1PCHKx6Cr8JKy0WN2jCBRGb4yoIjRdBQoY7d1cK+B43hUTBT5339Gk6N2ogzfxuNL650W0k+d8wcC3iflOO87De/3Zt4cVwy+LOW74T8SWWEcVwENwNlQvMikXByegWrx03pzCYOVscRAYsg1qC+6syMIIvxWJfUtMfGQAn14Y373bcPT8ggJY5VAN6rudKxTS6+92WZYUJmIeFJ2rPm7QQA9fkFTo0uLjwkcInQBYx/Jq2m91cV+HgK9D+DGiRZzbNxJNvugTPESBkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5YAV8HoQtxcAirWhg389zqalNp+J8Eocva2bW0vyg4=;
 b=yWqcPVjlxNQvefDymm/y7+YDc5JHqjNROq9VziSycGWAuZsYHZmsnGfgoDclwIz7tTVEttDIge2mHDhl48ya8eAzm7uuhiUjccQ1nWGK2yFMrxh+dDhxXxAjAyiaRxR4T6JhuzAXh2mKsPl5t0LLnarmZmsTqbgVvRAPZ0byXEhmO2q0z6dh99SY1EEjfLNeyOi7yhC4+xK1qRuOwTCmmPJDKfjJ5/QsUDJ46wCJKX6BPNug0aEgh5GdZb3hd7EuLzL4NLcS15eXSHYzl5YQW5h4Jpr2/cIpMAw+UV4odyIJQ5zXryK8BGN5+wxsORmYCp9NXyDxtc3AzARuvcvRTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=senzilla.io smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
Received: from BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::12)
 by BL3PR10MB6017.namprd10.prod.outlook.com (2603:10b6:208:3b0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 13:27:12 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::ce) by BY1P220CA0025.outlook.office365.com
 (2603:10b6:a03:5c3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Thu,
 4 Dec 2025 13:27:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Thu, 4 Dec 2025 13:27:10 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 07:27:05 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 07:27:04 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 4 Dec 2025 07:27:04 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B4DR4fn1612965;
 Thu, 4 Dec 2025 07:27:04 -0600
Date: Thu, 4 Dec 2025 07:26:59 -0600
Message-ID: <20251204-uboot-bl1-v1-0-ce8e01d73906@ti.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACOMMWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwMT3dKk/PwS3aQcQ11z85TUNDOzFAOjNHMloPqCotS0zAqwWdGxtbU
 AymASvlsAAAA=
X-Change-ID: 20251204-uboot-bl1-77def66d02f7
To: <buildroot@buildroot.org>
CC: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207; i=bb@ti.com;
 h=from:subject:message-id; bh=bCHPyH+l6qfPyEfpMNXfPcz2jhsPYKAoXGAg98trY7k=;
 b=owNCWmg5MUFZJlNZ5bAkhAAAaH////ftb735bX/H34/v2/9WF+t+yz5V3eftbv+v8/HZ+newA
 RsYkP1QAAaaGmmgADQyBk0GgAAaAAAMgDI0DRpoAPUDQANGjQaD0Q9R6T2kahlPUAAAD1DQA0Gg
 BkeoNMgDR6gAAAA00BoyHqekNHqeoANDQaeiaaek008oANBDRhMmTRo0ZNA0AaGmCZMhoAGgBoA
 0YE00YmTJhMCAADQ00yMmgAA0BoAIFKhyFoExvnsCConqthc1BJmJwNwBk5eCJjhouEGdIDoXP7
 iXKifABilKas1veGgR3xizMte48pL23QNRSgsELDoEVrBwRUhecAcXqq7a8eIA586SUcg1vXJg8
 kQY4islWMWSHRmKVvZvm1a6QPpySE2zCqI20eVzRYbA3J8JKnlt0JE/BXSNtK0EWWdmofDisXgX
 oB73mNGCiFDB1A1IDBln8TTaHmZTH0Q6zL2TLUgHrdzvK1mFUQjIi/QQqF03pMsfwsvYRq1N349
 5v5J+kQhlc7AXLZUX8Wd3k4KZpidRBYcLGXWlyVaRprwKoY6R5rxg4lR6nE9oKPYvaEctRQQtVf
 XpKQeywAYY2eeAbX+AUfjQkPFSW/lYTO+C7syDbAePOGCuZSXtWbJzmCeuUZpgFNClGF9nhv4UQ
 k6jQf4u5IpwoSHLYEkI
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|BL3PR10MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: e1f6d124-8c81-4e0c-6f90-08de3338d487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zzdja3MrTUxDNW84QnRsRFhnbGtWamJhdzJaNEhmWGd5OW1IUkFaNFJVWU9y?=
 =?utf-8?B?MytYWC9oZ3RCWFVKMWw1dXZQQ3ZrSHdCYW52dHlHZGJtSzBrbFRVWmRzbSs0?=
 =?utf-8?B?MlB1RER2ak1lQnFOUTRTejUyOWZWSmJvd05zZGxZbERKQzh3QmdHRHo5My9y?=
 =?utf-8?B?OHJxRnpKQmpMQ3ExZzU2cDArWVY1UVVkRk0wYUkvUGNDL3B6VjZSY1c4bHhR?=
 =?utf-8?B?Z3NBU0gvWTMzN0VsL2ZVKzNkR1NlY1FQZzBjam9tY1psRk42anoxU0ZPd1B5?=
 =?utf-8?B?cU1la2tTZ083d1BSc1FUZWIwTnE3TzNQczg1RDVrTVNaTmxlNWdycFFXTE0y?=
 =?utf-8?B?dEtvWDBVNHFCRDB5ZjVseWM3MDE0Mm5XN0Q2ODFWS2cyZ3NTK1lhaGkreFFj?=
 =?utf-8?B?UnVWdktCSG9Qalk0T2trbUgvWnVxT1JQbGw0QXhGWGV3dTFEYnkzMHZhZzhu?=
 =?utf-8?B?L282LzM2SnRtbEVCQlZuOXNMN01iVlB0UVgyTGtJbmpWbGltd0xkTzJaRE1t?=
 =?utf-8?B?aFlHRk5IbWNPMytlTlBMNXFiYVZSeUxveXNKRlE5R0x4djh3YTNJYmV2ckdk?=
 =?utf-8?B?WSt3ak1sV0FiYU44VDJKVURCcTBJWUJxWWxLelVrR3BwUVNKTmlVelhtQ1c0?=
 =?utf-8?B?M0FEcks2N2tScVFJRE5IdVZRcFZYNWVHdjJLL1dvcUJaeEhwU2VyZ09ZTzd0?=
 =?utf-8?B?bTZRcG9vNlZTRWZyQWNsN3hKbUF5MFZieU95VUZ5UUJYbXpvRGpNVzh5Y1JV?=
 =?utf-8?B?dnVHTGFpVTVpZWtObjd5alY4RUZsQVQxbVl3clRTOHN4RWdLOUVZMXFLckNU?=
 =?utf-8?B?ZmhqekdYcUthOFNLNE11VGE5UjRCbHlNRjlIRUdLVVVLMWZwdHczWGFwRG0v?=
 =?utf-8?B?R0ovRTc1M2pGRFJJcTZtaHVHRE4xVG9GS3NaQi9odzFBcmhFRmxacEwrMlJq?=
 =?utf-8?B?bXRHdGdxQzl3VTJjVjFNUzdsem9xUksvdUtZVDVwM0NTT3BUOVRoSy9hUUFu?=
 =?utf-8?B?Z3dJNFpIQzh2emZaRXliSlZrb2RQbHpVVjdaK3pYaU1waGN1dFJCWWdQL1ZD?=
 =?utf-8?B?OCtja3BhU240ci9IRDlERDBUajRyS0I0WVNWUWswU1NUZHZ2a3JQTEoreGtx?=
 =?utf-8?B?bDF6NVdERzVOMkRUSGtrcmpTUFJLQkl4dVo5elFibGxJVHNoWTAvdEJUcnpy?=
 =?utf-8?B?N25lTzd4bllWa3hMLzNZSjh2Y2Vab1U2cVR6a3hPWEp0WTJaQTdlRTE1U21V?=
 =?utf-8?B?OWFCVDlSRGNTRUd0bjVhbzVrVDYvdkorc2w4dUlpMFVhU0R1OWoreWNFcjNt?=
 =?utf-8?B?THQyTUMxTHJISzZjTkdNNFBLemFEbUhvc25xbzBJNkxHNHNQT2V0Y0xZNlUy?=
 =?utf-8?B?bG40cHRmMnE0TjJYR3FZWWhOVVV0enBDSDMyeVZFcWNsOUJVaXNnQmhHdlhh?=
 =?utf-8?B?LzZ6Z0NaeUxaWFZPdDhmdkJyRC90VGI2NThKUzJwQXhXYUZndDMrb3hVc0cw?=
 =?utf-8?B?M1pBRnl2WnNta2xrWEYraTB0ais2dTNjTVNlMnNhWHlTSFFhMUNJSCtNMmFU?=
 =?utf-8?B?eks3UGhDVzFvYWdxaENxMUxhdHBnZmY5YUpZQm9xditDaTZnc0NRMGtDUzZ3?=
 =?utf-8?B?RkVVUzZvWlZwbU9wd01WdmY1bndTZUorRlM2OEd3SFlzaW5iMWxyRUtCK3Bt?=
 =?utf-8?B?L1FvNHdEVWoraGs3dFpMKzZrNzdWNFRsTlEvdDZDN0NJclhlRmk0REYxQWx5?=
 =?utf-8?B?ZlFPQXJUMjM2dGh4eEU1NTdPM1N0WUJYRmlVMG80K2JieE5tdGN2RVFTdFpW?=
 =?utf-8?B?M0I3ZmVYQW9YbEJmRXdYRSt3U1VhcXRYSTJ2MW8yOWxDSm9rc0RLaEU2THhz?=
 =?utf-8?B?NnUyNis1dTQ5WnFPWmIyTkV6UlVwY0dzL2hhUWRMOVh2NktZVmVsTkNlcnlz?=
 =?utf-8?B?cElSMVJyYUFuWjNrRytaeXVhL1Z6UXhncm1ETmpZWXRUYnZ6NEd2U3orMTJQ?=
 =?utf-8?B?Y3BRUkcwTUdNeGNxeStoQzM3WVdQK25GNFYxVUNuU1ppb3l4SXBkM1o5cmJ5?=
 =?utf-8?B?Z1ZzWVNQRHRUcG1jMmp3U0Y0TGtIY1VoMzBaOFhISzZCSWpoa1d5VlprR0lT?=
 =?utf-8?Q?N1n8=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 13:27:10.9310 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f6d124-8c81-4e0c-6f90-08de3338d487
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6017
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5YAV8HoQtxcAirWhg389zqalNp+J8Eocva2bW0vyg4=;
 b=Fb5jYZE28Ak5dm+OQrJzVe9H7oZSe3aVVsOOhsQBfm7sXKPULHpxXDg+Q6W/2XkRVnvuMAelXmJDmBMQJIAiQCYbrBaR9+Ed4zzbP5VD21SiQv8RnQzToGVo1yZaFDUWbdYN02XObothMi2bn+sNY6INMrmjwZKKlzAJb0KlGfA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=Fb5jYZE2
Subject: [Buildroot] [PATCH 0/2] boot/uboot: allow U-Boot to package TF-A
 BL1 images
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

Hello Everyone!

The AM62Lx SoCs from TI utilizes a BL1 image from TF-A to setup the
console and to initialize the DDR controller during bootup before U-Boot
is loaded much like U-Boot's SPL image would do. To package the BL1
image into a format ROM can understand and authenticate we can use
U-Boot's binman tools to generate the final tiboot3.bin image.

So this small series enables building the BL1 in the
arm-trusted-firmware package and add it to the list of dependencies if
the U-Boot package marks it as need.

Happy Hacking
~Bryan

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Bryan Brattlof (2):
      boot/arm-trusted-firmware: add option to build BL1
      boot/uboot: add option to add TF-A's BL1 as a dependency

 boot/arm-trusted-firmware/Config.in               |  7 +++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk |  4 ++++
 boot/uboot/Config.in                              | 12 ++++++++++++
 boot/uboot/uboot.mk                               | 13 +++++++++++++
 4 files changed, 36 insertions(+)
---
base-commit: bd1831d161586947141542fdd5a47f10de3e83f2
change-id: 20251204-uboot-bl1-77def66d02f7

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
