Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC62CA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 13:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4974F41D24;
	Mon, 18 Aug 2025 13:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xRp0ct6YQ5B; Mon, 18 Aug 2025 13:52:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75E1B41DA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75E1B41DA2;
	Mon, 18 Aug 2025 13:52:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B392775
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 13:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A520F4031C
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 13:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3M0OIq1J4c8 for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 13:52:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c207::3;
 helo=mrwpr03cu001.outbound.protection.outlook.com;
 envelope-from=henri.roosen@ginzinger.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB82140323
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB82140323
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c207::3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB82140323
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 13:52:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V50w/c1XUQqrE3WF83TWcM9+EB5WLsm28LzLWY8bDHiHX0gPrbhEptYCvlcegosrGkE5eeJ2SZuXtc1rSxpzeN76qk4NGtSyGIcV6ZJQgdrj8Dgyi3UI8VgBchG46ZaV7ItHwQZljUyDW4mlgxpIJjhbypiELPBYpVozl1lbkWce89ilDDKYkp6fjhP9+4GUXVsQs1JmV5rJFCS6tJPTEf5yIze7kS7AqvkK6I14mMxzIYcyiIrupxZ6rxBY8sN3Q/l2MVTC2zaCxzDrbcQODjb7js7fvyoPidbxJDgfHs6Mj+U0xNv54b3cltJHq8eSTE0+Bsshq8UGaU64oOV6Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUzzxizjCCXk32FVIFTaozGyg+uhkbCQeh0Gn61M4Nc=;
 b=QMBq3CM33AeoaDCrL0jXzA6uQFKsXSNi0bngqkBPV3piNwll4kiEU7igCb8Trga7yW1QRNGnWM6K+f1Z8KFqg3Y4Jp+/HRMa8/7Wk5QHTMpsSbG3zeeAXsSsUZ18hSyhOdwiPUMVwAo39tGAgNh4H/UkOR/906GKYL2JjHvi6LEesDiccwnA+IyUYapCOeQrUrht2kowomAIVjFmM0RL6gyPHxB0fX0uaBF2xHso3g7jsqm1d+xmjmnrqVU3RVZebubeSEswvFtebqknW1r5YiGiq3P2sFgQbRCagcCPX99QTHlkbTA+U8X2nv4gl5CQ7uVzKSY7Sx9zW32zOQNB6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=buildroot.org smtp.mailfrom=ginzinger.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ginzinger.com;
 dkim=none (message not signed); arc=none (0)
Received: from AM0PR07CA0012.eurprd07.prod.outlook.com (2603:10a6:208:ac::25)
 by AS8PR06MB7319.eurprd06.prod.outlook.com (2603:10a6:20b:250::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 13:52:07 +0000
Received: from AM2PEPF0001C713.eurprd05.prod.outlook.com
 (2603:10a6:208:ac:cafe::69) by AM0PR07CA0012.outlook.office365.com
 (2603:10a6:208:ac::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.12 via Frontend Transport; Mon,
 18 Aug 2025 13:52:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=ginzinger.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ginzinger.com;
Received-SPF: Pass (protection.outlook.com: domain of ginzinger.com designates
 20.93.157.195 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AM2PEPF0001C713.mail.protection.outlook.com (10.167.16.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Mon, 18 Aug 2025 13:52:05 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com (40.93.65.2) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Mon, 18 Aug 2025 13:52:04 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
Received: from DB9PR06MB9030.eurprd06.prod.outlook.com (2603:10a6:10:4cb::6)
 by AM7PR06MB6375.eurprd06.prod.outlook.com (2603:10a6:20b:120::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 13:52:03 +0000
Received: from DB9PR06MB9030.eurprd06.prod.outlook.com
 ([fe80::5346:5260:86cf:ee69]) by DB9PR06MB9030.eurprd06.prod.outlook.com
 ([fe80::5346:5260:86cf:ee69%3]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 13:52:03 +0000
From: Henri Roosen <henri.roosen@ginzinger.com>
To: buildroot@buildroot.org
Date: Mon, 18 Aug 2025 15:51:42 +0200
Message-ID: <20250818135142.1533405-1-henri.roosen@ginzinger.com>
X-Mailer: git-send-email 2.39.5
X-ClientProxiedBy: VI1PR06CA0128.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::21) To DB9PR06MB9030.eurprd06.prod.outlook.com
 (2603:10a6:10:4cb::6)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DB9PR06MB9030:EE_|AM7PR06MB6375:EE_|AM2PEPF0001C713:EE_|AS8PR06MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: 726a5ac8-fb62-4632-338e-08ddde5e6aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?s6Bovgl/Rhfqx6qovmf1xcwMJVO0DCCeoaCtPFiiSXCVLFauGS7mImWmT8Pn?=
 =?us-ascii?Q?lg46JScjIF0nIznJgig37NugTrhY8pIft5XLbAcTZyqaI7+WfUBkT7PIt4Fw?=
 =?us-ascii?Q?VmAMA1ldzCpGYt24Dz/I14r6LFxxFkhgLzFC5lvSpHW6H1Gi/6t6f7T6ZT5c?=
 =?us-ascii?Q?HVfnGL4saQFsfFfYizyrE7YjL+biFM5sSPcGPD7mjshwD9jUj3phipyzk8Zb?=
 =?us-ascii?Q?dDO2UeJQYJ+9VtboeN4zREji0EAvxUVfN8koieCdMTpSAJoHOYNJo+EEingG?=
 =?us-ascii?Q?iDSqBoNybRhPQHyM5FNBvsA85qA+xqM/wVQgQvn0ihUmHYPlV4GpDFBa8OBd?=
 =?us-ascii?Q?yKI9jIZoO7Fb4M0D7kVyMTfs+lUoqCIGcX0WPOQeilsHMlfojTrABLgpChNu?=
 =?us-ascii?Q?qaVXsXYtQPzlC+xQZLIlk3nexBSIwFfS8kpO5DLIOQFiUwO4AxslWJffWqaZ?=
 =?us-ascii?Q?AwxyjfyAzsd3tl6r0ImHjhE2A1Aqh9OaeaKiRIFjoqFvcePvRo1+2T+9x5e/?=
 =?us-ascii?Q?XNysmMzCERSEhjT9wcseSJE1atjEsJTMNNKAe5QLfa9BmuESsi1nQ6dX4js1?=
 =?us-ascii?Q?pYavPSBj9KWaYsHnIqPgdgieJ8koRIHL/FfT3RdNfzbesXEBwL3xs93Mhhlt?=
 =?us-ascii?Q?+i8bpjSokQ3v+nSD8mxY3WxiQkl3JelUpCH1AKWzcxlMGCO9llfWe12hRedp?=
 =?us-ascii?Q?4ijCs1WubODua0iqYOl8jT/nAc1ECWR6UgNlV2XRf5PuXXyfcA6RfAar+A85?=
 =?us-ascii?Q?9DiYF0BWrNPj4Fdvh+Y9nCopaUg20V6A7RBlWyYOXQix/8pZAOuKetciuyuz?=
 =?us-ascii?Q?M2VBZK8OoZL9wftpZGwOsiVY+3FBoqN2Ts4BxYXXvMm/7uAXZ7kGTt6No1b+?=
 =?us-ascii?Q?Jtl8nf0AOw2sNUtgnuHsSbuZ38lw7laZf6f0vAElgtVxk9SvfaBx3DIVTZKW?=
 =?us-ascii?Q?3rgeJMLWa+kn1kXcaB1Q8QLCaFeEREqWtxfQj5gaFy85rDetO/nO58NiAnTI?=
 =?us-ascii?Q?ODguqmxQa+xLMbJ6rwL7gFSUF971M4mkv0VISErMMV0E6XcrHHIOAzlizEoP?=
 =?us-ascii?Q?6WobUhm922W+wzmvyxEauMFbNM/ahyJQSj5js4OvKVe7tIywoo+6p7EaDz9k?=
 =?us-ascii?Q?qyFOdGihxhXkVEJBWsuWzJOf2dDAUCHKqldtD00wFsLvC4E2TJRvcqK/WLvb?=
 =?us-ascii?Q?CE+kvo8IAm8/JyHkzsyNdCfrzBkb68zFPzC+0TTvWodg3zDH/N7aTHn/lGWQ?=
 =?us-ascii?Q?gxEI/t89LyNMkDlssz5ZPmiXF6liLb7HrqHKkuf8nbwN0+WJe6FWjLz4FZSx?=
 =?us-ascii?Q?L9KbPWuItdTCiY+vsZPogIDTJ639ap/vU6m+KpCmwqqOTLgOc2O+RYVL6pYW?=
 =?us-ascii?Q?4EO5bXEEBH5ZIc9Ub34/+StlFOdpT7r6jEi4jduAagjdF7Q1/L+95U9zs/um?=
 =?us-ascii?Q?3jGUqlTrBkfKOQ/+ck4yXVkMo/NX3fCE+oPUKD/hqVW/xldywj8BLw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB9PR06MB9030.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR06MB6375
X-CodeTwo-MessageID: 5a929b91-4aa4-48f5-b9b1-ef50a3ab6b48.20250818135204@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ae3fffdd-baf2-49fa-c5f6-08ddde5e691e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|376014|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e8UqKcGKQ8O0udGkGAWNSVQsaGzylNgTQNjF1uNjJacJydYhmF9RHkGHIeJz?=
 =?us-ascii?Q?R4XRDKOrC/0NC0UBqk7+yfK4YVXS9nR1kKe+jYUXMY9YSrgvXE+E02hnjztp?=
 =?us-ascii?Q?a+3aQXQo2/b9z3yshjZ6KUbRIDtun0j0Kf6SFznaco71jBGKtYJwOcTlhrNY?=
 =?us-ascii?Q?e5PDSDcBPiyJUcqC6cEcc4uHA4KNKfIt/VhREIrS9MrrBQqABbtNadfw2c9C?=
 =?us-ascii?Q?u51j+59sgPSg8fqLuBRZmNNJlkIxDEQ+jriZq3bh9FzCjOdU0OidXPqCurkU?=
 =?us-ascii?Q?qKpJUkGnvngqyE8kwYP5sMC0QrkNvKb4SfGXy547/uFtJlXjm+/KHBOtZ+Fh?=
 =?us-ascii?Q?dK0VIcX+TSm8+udC6Snv1eyZtNO6FKdAsLeyBvIFuWPOHKPFdH39zUTF8TmP?=
 =?us-ascii?Q?byjldtJNZVNAS5Ig2Ik+2S7ImeIY95Kbkr9lNjcCLYCHhdN/CGMlZavShgYc?=
 =?us-ascii?Q?1Jd49brJJBz/TCsiAMAVMunRq5uJYQ14lsq28SXJef0XL86JH4GO6bv+kyzI?=
 =?us-ascii?Q?UOvkjfx8wog7gs8+w7eGVoxo7MfSqA3v5IUywhLUS5nQm0UanbFpdicsX4yH?=
 =?us-ascii?Q?EEVv6WBy0SXA0kFXCqpK3CrxQhCn+aRtVDHnUbPNYhGpPFYAQi6LWk/2lvEa?=
 =?us-ascii?Q?BoXSmler8tdLGOWg0o6Lli8XoD7ejXtfBJ03aPSfPbT1GaYQXGYMEUu5KkKE?=
 =?us-ascii?Q?QAjNqi7w1TEVw1cEoGpVmG8WI//pkxPC55tCqvYCziHHZ1RPDua0KfJg3dvQ?=
 =?us-ascii?Q?UM8dYTU13nJDsSaysy//zYLiI/mdyHBTPJYr0mJ+kksYLyZjRPn7ODQDMYKw?=
 =?us-ascii?Q?q6OXUwCmLb5+Pieu2lf7fEJevOij3MnIDpnzuEL0dMyE3RDOghTJm+1ioKf1?=
 =?us-ascii?Q?CFamyLY5FEIFZx4kTJvzb1jmc1PxwrmeWw3FHUOrl5ImXn4Apr8U/iIT2AnU?=
 =?us-ascii?Q?yiRKfNRuQTnALR4LhdGR4Hlpd5yhpcPtEvtfoySOecmbWdFkjsVX0JpUa8J8?=
 =?us-ascii?Q?hZApjT96/1rSpieGgfjScGLm2pNHvwDRmYb5uXuWqwzncKqILmt0rT6kIAIQ?=
 =?us-ascii?Q?I+V/07S0tLqsAABMTLmomkszZF3yenNmlHDEflz1jYyrOrBL7TTEQGGu0hwa?=
 =?us-ascii?Q?BtK8fR16IsevgagDoGnaaMhvpPgPJKWVk6rw2a5xSXdtet+v9I/9EjOeMh5y?=
 =?us-ascii?Q?39nVTB1SD/rzocDXC82izBTn+NbjDeYMGCExP/zcNZzPkKdh8GGGA9GPBEz6?=
 =?us-ascii?Q?cEkVE8xaW3RVSJq9Ua6Kb0N4ILRWv2UbTlTFY18gxj1tBVjan3xgJWkgg3UJ?=
 =?us-ascii?Q?L6JHMxIMXyIHAOTahvl2WFtd6hbbeMYnLR0fE4tyfkYe31zcgTMiJDi0LKXt?=
 =?us-ascii?Q?c0QINE1VLzt6qfZd9U1yDqlGpD0YqouiUSOHkdqmYYQC3J/leuDFQpJ/SQHO?=
 =?us-ascii?Q?oPsiVYsb5pULhX3XJnZ5RL2cNuHHv/c/CEN9Q1jK3UqvuZDxFgmuh/08yyB3?=
 =?us-ascii?Q?edcshXs563dOJfUiQ88rrtRvt5yT6XL21y+9?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(376014)(14060799003)(1800799024)(36860700013);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 13:52:05.5238 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 726a5ac8-fb62-4632-338e-08ddde5e6aba
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7319
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ginzinger.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUzzxizjCCXk32FVIFTaozGyg+uhkbCQeh0Gn61M4Nc=;
 b=XCkW3gEwUJ6h/S7fp9neUF1HPiZeytsAtyi3N9mbpOHZWw92NcUM+vkeWCBF574OD87svkXmJZqgVOLObsQgOIsMwXuBmdHTsvvbZnyyACnlBm2mSSmM87Wa/7Hfvp2Vuc3UXA+SUe+MhYb7MsB21ZzWGpJC7F9dc4puaG0S5Geke4iieI+aucSEc/Opk/J3o7eOyG1lnWLqQAI/sJXCzQCUxwX2uowKljkW/DIAK5w9ZWxpUO/CRuLGfcCYMubIyyRCWXiilh9lk2zYCQSdwRh+cEoV2lmL475dzg/DTxEcDFvcDaL9guqzYnY1wo3IEmgX4MmuUf6d4jHygtn6jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=ginzinger.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=ginzinger.com header.i=@ginzinger.com
 header.a=rsa-sha256 header.s=selector1 header.b=XCkW3gEw
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: needs host-cmake >= 3.20
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Henri Roosen <henri.roosen@ginzinger.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit-2882cf4ae649 ("package/wpewebkit: security bump to version
2.48.3") wpewebkit depends on cmake 3.20.
Fixes build on current Debian LTS (bullseye) which has only 3.18.4.

>>> wpewebkit 2.48.3 Configuring
...
CMake Error at CMakeLists.txt:9 (cmake_minimum_required):
  CMake 3.20 or higher is required.  You are running version 3.18.4
-- Configuring incomplete, errors occurred!
make: *** [package/pkg-generic.mk:263: /../buildroot/output/build/wpewebkit-2.48.3/.stamp_configured] Error 1

Fixes: 2882cf4ae649f7d5e9cee72f84e672328f550845
Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
---
 package/wpewebkit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 969590482c..5cbba43792 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -41,6 +41,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
 	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
+	select BR2_HOST_CMAKE_AT_LEAST_3_20
 	select BR2_PACKAGE_CAIRO if BR2_ENDIAN = "BIG"
 	select BR2_PACKAGE_CAIRO_PNG if BR2_ENDIAN = "BIG"
 	select BR2_PACKAGE_HARFBUZZ
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
