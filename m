Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE4ECD98E1
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 19:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A568660624;
	Tue, 16 Jun 2026 19:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIhmU6iqy531; Tue, 16 Jun 2026 19:35:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0A5060718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781638546;
	bh=bxFQtY4d42IGbu38jBxFwmnhOKxAT2Vr/ebs8Q9M9y4=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L+/RltGlqquvvjeJyq+T9nxn3QSZq7t8RiS0g7NjgvUyiuLeh3Gn98bH9G+W+XbMH
	 fev5z50WxecgryKEgwaqby0DhtYYWX70RPqYH9qeWGJCoi9J4CvMsauHZ65rC1dVzv
	 xV9hHyzei0ukOMQ494RGPQe+qKjHLXd+B3De7JTJ8EQNcWCJo+xQPhUuhB3KFKi1Ah
	 2pwXeywHlV0djjl9Jrf4wjjMQdlVrJtmITTpDWSQuXRhWIBebbV1uKzyfB7PFIgARW
	 GRkBRipW4LuBjRB/v994t39CQl+omUAAuxe9AL64gdj5EGQLH6IlJ53d/cVSgHu2Kk
	 IxP4EhZULdKdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0A5060718;
	Tue, 16 Jun 2026 19:35:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 196AB793
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 19:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B1A742A97
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 19:35:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HHP5WrrO_ozO for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 19:35:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::7;
 helo=ch4pr04cu002.outbound.protection.outlook.com;
 envelope-from=eugene@largest.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D258F42A6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D258F42A6D
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::7])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D258F42A6D
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 19:35:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wxYJ4riJO9QM5zhDEMhCuRyZ5pFpoguGxqE4c86sFP7DC2eJyJKYQm6FWw3A3QLHQC7zyXV9co1qZVlUrXcWP5HMEVaKEevZqNWsHZlymzJiPc70OWdop2J6n5KNwoK/bqhT4bMU35hA9rQgSBmdsNdmfzsMlfuYp79HR9PTy5P1yj7Wddi5ICRdKIXT89+DAa9DoVYd+UttNOBvIPz5vsvQxVF6nhtEpS+5mLUfOWPMyxG9K+wpo5yL/9M26YeB/cg1yzpg4xmg8cTQp8uFlwFPv380fuT7auK2E6ZpvDUllXPbT0mC5V2EffgToGyeXGwkAeXZghirZCkjhOKSAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vss3IhNWoU9P0Y9nHEiwHjnuWE14lhf4nR0FnTYLjKg=;
 b=LW7yu2m0KBQTzArCmINv+8e7d/uSa7Zwvf/kuaPdsnfEUnsNrFrmNieScZYZ3ZpQqWKRCjiY4ABfYVxqkMtEmM43z4LIsPU+OIik3gGu8WaGP+4c4Qdl2hy0dh+Wf+LJbWC5dWgivtZUJe3w9nAKnF+sE33KXv/N7elOLqBw8sRgQ9Tul6+Q2LzxudSV4STBYF2UISqTej7T8c3YYjKIFkXjRCQqztA6sn5BbwyaBZlllyL6IhfAlYJllb0BgD+91hPz7pEd91E0q6zeLpcoJSrapPkX4whUlGnfqK5aVl0FlK88Nzha0eDNGwInFWWzelvflNNIe7T5s0qrJoKiXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=largest.net; dmarc=pass action=none header.from=largest.net;
 dkim=pass header.d=largest.net; arc=none
Received: from DM3PR08MB9039.namprd08.prod.outlook.com (2603:10b6:8:1ac::5) by
 CO1PR08MB6514.namprd08.prod.outlook.com (2603:10b6:303:9f::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Tue, 16 Jun 2026 19:35:40 +0000
Received: from DM3PR08MB9039.namprd08.prod.outlook.com
 ([fe80::65c1:d3a3:f37c:710]) by DM3PR08MB9039.namprd08.prod.outlook.com
 ([fe80::65c1:d3a3:f37c:710%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 19:35:40 +0000
Message-ID: <b4dd6ba1-b7a8-4948-b58d-f768b651b0af@largest.net>
Date: Tue, 16 Jun 2026 09:35:37 -1000
User-Agent: Mozilla Thunderbird
From: Evgueni Tarassov <eugene@largest.net>
Content-Language: en-US
To: buildroot@buildroot.org
Cc: nolange79@gmail.com
X-ClientProxiedBy: SJ0PR05CA0118.namprd05.prod.outlook.com
 (2603:10b6:a03:334::33) To DM3PR08MB9039.namprd08.prod.outlook.com
 (2603:10b6:8:1ac::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR08MB9039:EE_|CO1PR08MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: a30dad4f-f8fc-48f1-29be-08decbde72e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: Or/U/ci45ZDooaWQqK3dmMro2mqKDTRypZtKNujaS7pl/0dcaIUGWk1fvJU/kwn7w4AGkGE7MXEf8oKH9iDc31dzPWVI9ad1h7f68fMHOoHOYgpWIpp4/BcEcgz49+mk5SmYFrO2R2Po4fkerYpGyX+bv05ktOT+/owcBX7gjuHXD2+B7waANsby8xTJmPqcB0YtF5o8Yp/l/SNvQBWatjuI4ybYTS8yvG33SygAJi567V6r23LfIMek5Ey0GYDWskwBXbksMnrlzXywhoGaVx3JzojjJ/u0VuaUzGAIUMqIn1r25wnrewkA8FX0QipuGdQpt7Ql2xhooqyahjpINLpW9ETl5/lvVhHwAThn97FAWajY9BJv2d542Z1nVSH3wzMVULwv4eB9E+S7y8N3Ag1YscCFRuWCcaDmuSPWPrAbLtD45XSW8LQtQkdXtuWs15Cb3ponVudVBpl2qiI7cS3gFUQkCjtY4pAxMvOntXhGCBGYzz3PvCcPZBJqbEnai4hZZv/cwiWNtLOWPao5Cl4x/TpRP5U1N23WWahrgfEGxX+M0Bag+RvybrPAk8qYLE3izDr8MRbOm6JCrtUyf/He10MgE9lRw+RAz7Uef/yp9VcC8bEwyKErnURymtxLAx0N/PAkp4hpR3ySrtWfGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR08MB9039.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(18002099003)(3023799007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGpEbW5lZHNSak1RRmtHMjBIbUprbjJVRmRrNHFRbFF6OEFZdzFyalc3cGhU?=
 =?utf-8?B?eE0yKy8vKzlXbFBYVGpvcWdsUUkydFdFNFh5OEd4QUpPa0lmTkJldktEcVh1?=
 =?utf-8?B?Qnl5TnhQMHpuMWVJQXZKY09FMkhPZUZtYmhNd1d4bTZLYUl4ZzZsMTliaVlN?=
 =?utf-8?B?NnU1V3gwU0RITHJPOUR2NlAzRjN1dWRNUmNSUno1d0ZaK2FRL3crZlgvUXp3?=
 =?utf-8?B?d2dYd09RempkSVE3bHlRamNoUFRFdS90WDJrN3dmaG5DeUdjQmVlcThyWDMr?=
 =?utf-8?B?WXRkL2Vla0JqUWZaTG5YSC9YaXI0Wk9XanhoUDZjK2dHME9mcUorYzlxMTlR?=
 =?utf-8?B?M1RWeVB0TXM5KzBtSTJMdHk0UzFrVzF4MmV5WkkzRDYrNzBtWU9FdGcvMG96?=
 =?utf-8?B?bGNCS0hoS24yUFN5YWtZbHpBazc0UEFjbFF4bUg2bE12S1BnOExqbFdkNERm?=
 =?utf-8?B?Wm0vVWFDUzdWSUVZenlmSFptUkZkekFycGRvdmwwWHhyei9weThKeDhhWmI4?=
 =?utf-8?B?dFBrL1RpTUNxUjhtT1Bzc2YvcDY5R2VuMkxCbm1PUFRCODc2RjF4NWhINEVM?=
 =?utf-8?B?ck53anRtUmRtSXVzUk1mMlc5LzJ5b1dDQVU1WVRJNXpISjZlVm56dSttbFlq?=
 =?utf-8?B?NjRKOTl1Zjh3N0lZanNVS0VBYkhvc0NRM2szWFlTZjl2WVdvSTlneHFpR3NC?=
 =?utf-8?B?QWhtS083QTQ3ekdNN0lNa01EMmRVQmRHSzFvWjlzdjVLN0hHbEJvWnY2Wjds?=
 =?utf-8?B?V2RLemh3V2NBczd6Ukg2N3ZNOVQ3MG1zMXdYYU81U2NnbGkrV0JpUHRDSkUw?=
 =?utf-8?B?R0RVRFhyZG9pckhZaGVpalpUNjVVQ0l3eGlpenVVb1lLVlorcTFyS1l2cDBG?=
 =?utf-8?B?RkRvWUFHNVUyc29TR0dQTnhDb0w2QmFBMkFxYUE1SFhkQlZCVXdDTmJjanJB?=
 =?utf-8?B?Kzl3VXFvTW1aNkloeDZoVmFJeW9SQ2Z1MXA5endUY0RUSVQ2NmEybjRJRTNV?=
 =?utf-8?B?WTRiTm5KNnFLcVkybFlyR1BMNGRsZGV5dFZOMEZxSTJwcmV5S1ZvWU1CRklZ?=
 =?utf-8?B?bFM1YnYyakZVWTJPOUI0SWE0YWhtdnpRbEErVjljam9YSjAvd2tDcVJJQTFH?=
 =?utf-8?B?dXBIbkd6OThTYlBOV2p3Y0ZKK0h5WXRYQkNrMFcyby9QbDA0Rnlwak9LeGU4?=
 =?utf-8?B?UzVmVlpKZ1FRL05YR1h3RmFRM2lLYkErN1dNY0t0bkdWRmRaRnRqRGxvcjdO?=
 =?utf-8?B?Z25kNWVGUjdiQWZnakNJZE9UZWhkZTVFTjhuT3Z0YkNwZ3ViTWhwM1hmMnFm?=
 =?utf-8?B?VDhqM2cvb2NWMFBTMzBXRVAxL0VNczg1aHh1ZHBEUnVYblpGSXdGaStpUGp3?=
 =?utf-8?B?TEhFWjE2ZEZuYlpwRmY1Z0dFNmY5UVEzUWtCVEhhOVpQeUZtMWlYSlVwYUxa?=
 =?utf-8?B?VHJkNVk3akF6Wkh4ZXBtMmZDOEJtc2MxZEdpQTZuRVp3Zk5oTWY2Q3RBUHlB?=
 =?utf-8?B?WWZ5clY0L1JkZlJRRzR4dFV6Mms3WlVEOVZQcE1xbFNIb25maUlVRGl1bFRC?=
 =?utf-8?B?eDRvclFIcUN3UDFZRklrdkcvUnQ0Q0VJTXFaUENlTnJpZGt6dUNFeER4ajJT?=
 =?utf-8?B?eDNWU2xuSzZkNms0alhnY0creDIweE44RzY3SXpoNGE0Rit4WUN2YnB4M0wr?=
 =?utf-8?B?ZHlycGo1Z3JrOHNMWkFDYzdKQlNsMXNsNVNVM1ExN0piRTdqZUpiMXNkK3Fu?=
 =?utf-8?B?MElHVWFDbE5rTjlNSVFnaWY1N2tZbkNMNUpwVVltbkN2NEFWSjEyQ0JZelh0?=
 =?utf-8?B?YXMrbGVIVi93Z2FFbnlzNkFlQ1Q3R0VLd3FES0IweWV5cnJxcEh3WHBoRFdj?=
 =?utf-8?B?MXNmbWtId2xsNndubTVzaFU3ZldqL0QzblNmRXp0RHRDNnlVaW5XbmZTYkRa?=
 =?utf-8?B?K0Z2VU1QL1pWUEROclEyOG0wdVJUNi83ZThsL2FYSktQWXJCMWlHcXk0b1lu?=
 =?utf-8?B?aGxYTEY4MGdyeWZ0dnJIbzkycDdYdG1SbkVPVkliOW5HV3dMS2gxOTdIYmhV?=
 =?utf-8?B?Q2RsSmR5Z2ZTRzIzS2wwb1k1L2srQzhYY1RURzdtY3ozUGp6L1hyQ0JYR05a?=
 =?utf-8?B?MERvd0FBMVRRVEI2Qm1aaUkxTGx6UlBwZDJxT2NkeThVREd4cjVhM0lpS1Br?=
 =?utf-8?B?cXFmMkhNeW5aSlFmb3dyVWM1ZHBBSmg3QW9QV1hxUUM2SkhoYnVyc3ZwQk0w?=
 =?utf-8?B?OU5leXhpUURYTFI0eFp0Qm5Ja0NYRSswcWJscU9iaTRUak1TMEIzcWVWN2t3?=
 =?utf-8?B?YW5QbU5nOXNvQzZsWFdMYng0c3ByNmxodUxXZHlNeUFtME1jWXNndz09?=
X-OriginatorOrg: largest.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a30dad4f-f8fc-48f1-29be-08decbde72e6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR08MB9039.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 19:35:40.5194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 347813a6-e99d-46d3-b752-0b5eb99895a5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKYQP4mNpMktpY1Eo6xxLx9Ww/uX2/VGU96FSd81s4phU4FRaQR36LAIYHSiSJMAuxo53a/EAkUx63y6SBc6YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR08MB6514
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5682767.onmicrosoft.com; s=selector1-NETORG5682767-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vss3IhNWoU9P0Y9nHEiwHjnuWE14lhf4nR0FnTYLjKg=;
 b=XzZrBLWVmOgkdLAiOpMEl5Mak77f03Rjw/P/tcBlsZyALm9CHJjsJcg61fGMWZEJZAxxM6IevfzJZyEgzsskWQmw+zx/9sK5KGwY6MKM950Qn0i3fCfWKbRjgBFzmwyMoFMlzVu4DlAXQnChzrY2jMztd5D49OkKnDaHCpw05go=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=largest.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=NETORG5682767.onmicrosoft.com
 header.i=@NETORG5682767.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-NETORG5682767-onmicrosoft-com header.b=XzZrBLWV
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=largest.net;
Subject: [Buildroot] [PATCH 1/1] package/tcf-agent: bump to version 1.11.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Eugene Tarassov <eugene@largest.net>
---
 ...tcf-services-tcf_elf.c-fix-x86-build.patch | 60 -------------------
 package/tcf-agent/Config.in                   |  4 +-
 package/tcf-agent/tcf-agent.hash              |  2 +-
 package/tcf-agent/tcf-agent.mk                |  6 +-
 4 files changed, 6 insertions(+), 66 deletions(-)
 delete mode 100644 package/tcf-agent/0001-agent-tcf-services-tcf_elf.c-fix-x86-build.patch

diff --git a/package/tcf-agent/0001-agent-tcf-services-tcf_elf.c-fix-x86-build.patch b/package/tcf-agent/0001-agent-tcf-services-tcf_elf.c-fix-x86-build.patch
deleted file mode 100644
index 5f08fa485e..0000000000
--- a/package/tcf-agent/0001-agent-tcf-services-tcf_elf.c-fix-x86-build.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 0a847ca035113540ee44d17f364bf4701fe78355 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 1 Mar 2024 22:31:05 +0100
-Subject: [PATCH] agent/tcf/services/tcf_elf.c: fix x86 build
-
-Fix the following x86 build failure raised since version 1.8.0 and
-https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/commit/8df5540c53b862d516ac25f908c2fff4a547b4a6:
-
-/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c: In function 'unpack_elf_symbol_info':
-/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2079:27: error: 'STT_ARM_16BIT' undeclared (first use in this function)
- 2079 |         if (info->type == STT_ARM_16BIT) {
-      |                           ^~~~~~~~~~~~~
-/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2079:27: note: each undeclared identifier is reported only once for each function it appears in
-/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c: In function 'create_symbol_addr_search_index':
-/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2228:78: error: 'STT_ARM_16BIT' undeclared (first use in this function)
- 2228 |                     if (type == STT_FUNC || type == STT_ARM_TFUNC || type == STT_ARM_16BIT) {
-      |                                                                              ^~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/8388acf59689ed7e621bdf158483e3df1cf9bef7
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/merge_requests/1
----
- agent/tcf/services/tcf_elf.c | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/agent/tcf/services/tcf_elf.c b/agent/tcf/services/tcf_elf.c
-index 1b3900ec..b0b948e4 100644
---- a/agent/tcf/services/tcf_elf.c
-+++ b/agent/tcf/services/tcf_elf.c
-@@ -2076,10 +2076,12 @@ void unpack_elf_symbol_info(ELF_Section * sym_sec, U4_T index, ELF_SymbolInfo *
-     }
- 
-     if (file->machine == EM_ARM) {
-+#ifdef STT_ARM_16BIT
-         if (info->type == STT_ARM_16BIT) {
-             info->type = STT_OBJECT;
-             info->type16bit = 1;
-         }
-+#endif
-         if (info->type == STT_ARM_TFUNC) {
-             info->type = STT_FUNC;
-             info->type16bit = 1;
-@@ -2225,7 +2227,11 @@ static void create_symbol_addr_search_index(ELF_Section * sec) {
-                 }
-                 add = add && type != STT_GNU_IFUNC;
-                 if (add && file->machine == EM_ARM) {
--                    if (type == STT_FUNC || type == STT_ARM_TFUNC || type == STT_ARM_16BIT) {
-+                    if (type == STT_FUNC || type == STT_ARM_TFUNC
-+#ifdef STT_ARM_16BIT
-+                     || type == STT_ARM_16BIT
-+#endif
-+                     ) {
-                         addr = addr & ~(U8_T)1;
-                     }
-                 }
--- 
-2.43.0
-
diff --git a/package/tcf-agent/Config.in b/package/tcf-agent/Config.in
index a016871e6d..7281e62377 100644
--- a/package/tcf-agent/Config.in
+++ b/package/tcf-agent/Config.in
@@ -27,9 +27,9 @@ config BR2_PACKAGE_TCF_AGENT_ARCH
 	default "i686"       if BR2_i386 && BR2_ARCH="i686"
 	default "i386"       if BR2_i386 && !BR2_ARCH="i686"
 	default "x86_64"     if BR2_x86_64
-	default "powerpc"    if BR2_powerpc || BR2_powerpc64 || \
-		BR2_powerpc64le
+	default "powerpc"    if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	default "microblaze" if BR2_microblaze || BR2_microblazeel
+	default "riscv64"    if BR2_riscv && BR2_RISCV_64
 
 config BR2_PACKAGE_TCF_AGENT_ARCH_SUPPORTS
 	bool
diff --git a/package/tcf-agent/tcf-agent.hash b/package/tcf-agent/tcf-agent.hash
index 34893d280b..8a790290f1 100644
--- a/package/tcf-agent/tcf-agent.hash
+++ b/package/tcf-agent/tcf-agent.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  64131790c7d4636d4abff8516d5b4b6329e4d3e691f44dc604e2c30f55edb0dd  org.eclipse.tcf.agent-1.8.0.tar.xz
+sha256  babc9ecc26d0434f4cafbfa1933451a11516ccd590e77e090a84e8253a10fc4c  tcf.agent-1.11.0.tar.gz
 
 # Hash for license files:
 sha256  f82d01b74a513bd3504d08136026a5ac2a7e6ff62ebcde391fa74aa222d11ce0  agent/edl-v10.html
diff --git a/package/tcf-agent/tcf-agent.mk b/package/tcf-agent/tcf-agent.mk
index e90334c783..d95a6fcbae 100644
--- a/package/tcf-agent/tcf-agent.mk
+++ b/package/tcf-agent/tcf-agent.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TCF_AGENT_VERSION = 1.8.0
-TCF_AGENT_SOURCE = org.eclipse.tcf.agent-$(TCF_AGENT_VERSION).tar.xz
-TCF_AGENT_SITE = http://git.eclipse.org/c/tcf/org.eclipse.tcf.agent.git/snapshot
+TCF_AGENT_VERSION = 1.11.0
+TCF_AGENT_SOURCE = tcf.agent-$(TCF_AGENT_VERSION).tar.gz
+TCF_AGENT_SITE = https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/archive/$(TCF_AGENT_VERSION)
 # see https://wiki.spdx.org/view/Legal_Team/License_List/Licenses_Under_Consideration
 TCF_AGENT_LICENSE = BSD-3-Clause
 TCF_AGENT_LICENSE_FILES = agent/edl-v10.html
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
