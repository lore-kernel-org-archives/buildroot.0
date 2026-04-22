Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565E3F5A8DD
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 11:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67E6842668;
	Wed, 22 Apr 2026 11:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ahe75fMh-q_v; Wed, 22 Apr 2026 11:22:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2550F4265A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776856936;
	bh=4HZTUsJHjE7gfgD5gfAFYYO+/+k+95HAJO1Tsu4fGFs=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=KJ0Il6XQJ2Sp1id+vqzrUqrOgFpTZPxgDGJDaccHYYaq3NHC34wIbdbrKsqUXqhgn
	 DusHZv6aDO4i+FbiUeYir/ocPu7N/xDR8mVs/uYUgDDdDNKM9MTho5dFuzMpRyvmce
	 KwCnXx0YI7Vf2yfzMySMjSAt7mDC3KOyRB+FxLzLBXQ/VIv/q7aOHX7b4yqkKMXUp+
	 P9e3duoHyYn9IWiF3fIuytCQfvmoLO6D08aorc3/7L24iZ1o+N+7kv7cwqEWrHd/tM
	 jCOk7QZ4YQVJHYteN4X6HXBGAiqCLYO/Nw4Pq8RwfdhoJ8q3Z5zy7NxqFS6M1SfzTl
	 sK4qhTN0Du79w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2550F4265A;
	Wed, 22 Apr 2026 11:22:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 24E9D257
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 11:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16A1C405A1
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 11:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxuSupyA-xry for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 11:22:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c20f::7;
 helo=osppr02cu001.outbound.protection.outlook.com;
 envelope-from=jan.kiszka@siemens.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E157640140
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E157640140
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20f::7])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E157640140
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 11:22:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmhKXaC1n7SUaexopclfSGyhK695/Hky2I36GLG+fjwwHyilmSdJeMJoEStizcVybe6IwmYDYlV0rDBSg4jbXSh2vvLWVkk907ihlQ9HA2IqjYSxxFGf22n9bfJP23H43z9WT2xI6mBFNP2f0KVQsSaQc5WLEPEpCKhC6fTLYvgMEw0VSTPpXLV+/KVz8msZwi7chKpJeA56t+vJirpqJlnISmttaWrq7ze/IPdPF19DIpDCSOWzHr6Vj1BhCiaxX84+z6nIUg3vYc8+Nn0U23IEkouKv+/A+BNZq0zS96OqKkvatK4Q+oNmgcCZw/rpxFIaLze2flBngItw6E7uww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17XjSRdGyodB3yzFkJuh1rS91Ws1nVx1tA+xdJJ6Stk=;
 b=Ob8W+3zimSLd8SaTfqCYKrwYn3VZh4j0SFFccXI2zjd09VZ9aHY9zlkgiw1YRebHRYcDBUTGzoL4Moz/VoB6hmtDivwp4sMTjgH8PX7p5nNWBrAmZbS5vYlk3TCzDxJZKx3X6f+IYWgOjWW7g0I/GENaiwWgEr+Y3+bwxB2j1iRrUaHM0FPnaCRwwVYMjOIhT+Heb4SiMuQbq0TSL6v2743OEx8cX24U6zfcJ104zik9jldoxE7eB/SJmhWEgYs1Ay+QOw87zmmB2zXBAaap30/aEyIUh8Gd7rrWiNIq/IAcRuToBYGFju/qh11v87GcnBXttlIFfTEaySJLJubmNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by AM7PR10MB3224.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:10c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.19; Wed, 22 Apr
 2026 11:22:07 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::be9f:e8ca:ee9:83e1]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::be9f:e8ca:ee9:83e1%3]) with mapi id 15.20.9846.017; Wed, 22 Apr 2026
 11:22:07 +0000
Message-ID: <b4932b2f-b7eb-4be6-8bfe-67e496ea35e7@siemens.com>
Date: Wed, 22 Apr 2026 13:22:05 +0200
User-Agent: Mozilla Thunderbird
To: Christopher Obbard <obbardc@gmail.com>
References: <20260419-wip-obbardc-boot-efibootguard-initial-pkg-v2-0-1420c48f78fa@gmail.com>
 <fb2827a1-bd08-49a1-a52b-b4f5dc8aa881@siemens.com>
 <CAP03XermLX6+JHihMBLK83MvoTYA2pp0xZf3SHkc3MqTaKJc-A@mail.gmail.com>
Content-Language: en-US
Autocrypt: addr=jan.kiszka@siemens.com; keydata=
 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
In-Reply-To: <CAP03XermLX6+JHihMBLK83MvoTYA2pp0xZf3SHkc3MqTaKJc-A@mail.gmail.com>
X-ClientProxiedBy: FR2P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::6) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|AM7PR10MB3224:EE_
X-MS-Office365-Filtering-Correlation-Id: 473e91c5-7bdc-4d67-983c-08dea0616325
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003|55112099003;
X-Microsoft-Antispam-Message-Info: yvIp3P9Eh7XTKMVAQzKtRMovzpkhY/suM084c4Y9fGmBMtpH+Zla/pDselikbeZMrXFQSdSuT6jw1fM4ejImlVTQ/p1YSJYa+CmGf4y4ydRRgJ99dkcuSjojSv+phz5POoK9v26ZzCSTR7dKxlGHu00dtekPnAQlVKbcG2n1BnVZoZNJs40naF39Sxpx14YDXq1eGUwbjWPgqQ6BL7D1Doy4TWq0DIBPdQWWfBFX/44Wv6khQE5CX42xKpRCgGUhfMkdSXy3rQACC2ZT7kb9MC59IdiNroER/mCCUHcr0BpuI1flNmri6JlXtAihM6fSB5KX8GsY6FriCKTSV/rJ3lVYkuzaiPmjQ9tLLtXzoUnBHWOhoQ7Hl4wC3PmdnR0Kd7Oa8O5/AROFjoVdT94KB7xqv2+DzWbodgjSSj5ZHytx96oDLsQE0e2AwVJ+eGQ3WwDUtKH3WL363aESDpa1yA5dN1UZ8IvPsiAhmCu6ssZlgL61UnxTZ34sOnty1LbgPOiCNnw7D5UjjIr79oXmdvT0JLMm/3TG0koDaqC6SwGMTG0tZm99MyVqzk1+9bzIAGcfOPQyKMS4n1QTh8NbSURJ2En4UbVpwHQj7a28cZdbL77l4TzmSQZq1+O81KB3zC5pgmxwj/WJvswZYaS6ieI7T3UL9+JvlsAfVcf7X/xAieqEEd9Rs6fnMuGhhuZI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(55112099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVhVT29XcjVsSGRBQjJiSHFlMDMrQ2ppdHVKTDZHb1o3RUIyQzJsek5KT2Fw?=
 =?utf-8?B?U1ZGMytMMEtOVnNBSU9jRjVqYzZ0NDAxcjJrOENjcUcvclJVaElScGM0ckI4?=
 =?utf-8?B?YitQR1FUNUY4ejRFY0VYTHJrbWNWbzl4ZW1RNkhOa1ZiY1AyNGhETHhaaE1J?=
 =?utf-8?B?QmhGL01tQnhYY2kwU0FCUGhhcHhRVitlV0Y1TjZ0UmFDMDB5Z0FvT09DSXVh?=
 =?utf-8?B?am1yN0cxQzU3TkVzdXR6c0NRQ3FNeGpiTHBBdzMwL3lxZzE2M2tnTm5aMDkv?=
 =?utf-8?B?SjJZT3pGYWdUZWg2Z1lteWZGV0Z0WTJZdm1KTDRvakFxSmo2SkxqOGRGNklG?=
 =?utf-8?B?Z2FFUDVOUFRDdzg5Y1poYUprSVAzU2dnNnRTelBwZ3FZd0tCQ2ZjclE5amtj?=
 =?utf-8?B?MW5xMVJKVVRXcHNIeUdYSWJVS2F1bEJ2bkJ4VnQxTnFOc2ZmTlRlYzg4b0Ni?=
 =?utf-8?B?UTVBYWp2UHNqVTRQU0J2TitzbWVqeG8xSWJNNGxtUGw4cFN6YzlBSXpnVDZS?=
 =?utf-8?B?a3MwSFNlaGovU2JrVXkzWHc2NTM4WERTNDQwYnY5Tjg5VkowdE1UTlVZQVUz?=
 =?utf-8?B?Q3Fldmp1MmJFZHBYMVpuTEg5bnkwMXlUQXZDL0J0ejBEbncxYzNYRU5GVkdW?=
 =?utf-8?B?NU80ejA1UlBSYWEvQWpkNlhUUzRKZG1EcjJQaHhJN1hxQ2VwMVRTblBOU3Bq?=
 =?utf-8?B?Lzh4aWV6Y2FnSTF5ZzhtZk5pOGFqbjNGejFQVWV1UlIvMVBkbmtLd3FSYm5l?=
 =?utf-8?B?M2dJY2dMV0NTSFRLYi9sYXg3SXZPQkU2R0FaZ2dWYjIrcDlVNjNKOHRWOE9s?=
 =?utf-8?B?K3VsWlcrNjNMSmlMcnVSU2lJZTBmNFZEbExTcC9YNmVHMDdCbS95aDZzWHVS?=
 =?utf-8?B?WVhHRTdpaGVSK3ozOUh1Yitsck4rRndKZ0dKdUtIa1g4TTd1TkQ0VDBROEFR?=
 =?utf-8?B?MDZSbVBKYW9PVlBtOExZNWovMGpsMXBUYmRETDI3ZTQ5cVdBc1RXdjJtWjVn?=
 =?utf-8?B?cFlEYzMrWUxFaG4yWWNKN3BQUnVGSHdZYWdlZzE1OWd3WlZkUE1KRkpJUW9V?=
 =?utf-8?B?OXB1R1J6czF2ak5LZElqRzdiZHd4d2RRMEdIbnZ5RnowbDg2djEyQVU4dEZW?=
 =?utf-8?B?d0g4Rkw3L3I2LzNlNlUySFFzZ25jUDYrYUhQMHVKMjQxVUxJTmdiWmlNVTF6?=
 =?utf-8?B?cHRLYnoyZHM4M2lUbUpXZDQ4RThqVldTeUpYUkk5dzRCNkJZY3BUSEc4U0hL?=
 =?utf-8?B?ekVoQnNBWGo2RGR6ZU0rME1la3JMTDNIWU52UExIRm12aW1iVEtOSHl1aVhJ?=
 =?utf-8?B?Wk1DZzU3UFlseUMvL1RaTFNaSkptZEpyakJMMW5UWEpIYXZ6YmZXU0NqSVdk?=
 =?utf-8?B?ZU5NdjZnL09hTmtISDhvc1FURmRpZk9RaUJwZFBFVmk5S3pIbzdlWlBubUZj?=
 =?utf-8?B?NnNLTlVVd0xLbWtPNDBrMExpMWhXZkdBLyt4N1EzMm1tcHFsR2pzSyttRVV6?=
 =?utf-8?B?dmxwRStjbEpNWGRVK1JvV2Vsbk8xS3Z6bGlWRC9iaXI3VnE0V296WDBMVHNI?=
 =?utf-8?B?NjNnZ1FQUTBpVDNtRzNVK1hWK1RPR3NjVXcrdE9leG1IOXdLVVFTNlI3UGtr?=
 =?utf-8?B?MDE1d0tVY2NmMHFzT2x6bXJlemtxcjFnV05tQlRXRks4WFRZTllvZHhCVEI2?=
 =?utf-8?B?SFNFblFYLzkwdzkwQURtR1NCb2psMFBnVU1YMVZNWVJ3K3JiTlRHU1ZRSXVs?=
 =?utf-8?B?R1ZyWnRBbEgrNXZydHZxanB3RDFiTnZibDRLN3VDaDA4MjFETUdzV1YvUFZi?=
 =?utf-8?B?TjREZGdUQ1JaV3NPdDFFNXpobTF5ZTE3UWRxVXc0L2c5d1dkSldxVzJtdEZK?=
 =?utf-8?B?ZGR3cUkwdFkyTlcrSGk3b09ONDdSZEpIdEFSZkNEbTNqKzBiUGhCbEpJQXE0?=
 =?utf-8?B?NTBwMXdXbkZMMlZ5QU02Ymc5cFBFWmhKT2NhQkloUFM1cC82S1NUOW0wanQ4?=
 =?utf-8?B?UkQ3dFNkQlVXVFhqdER2TUp6dlM5M2lKU0pqUU1LckdLOTd5WXlwb1Myd1JV?=
 =?utf-8?B?VE43USs1blU2SE9wVDFucy9zbVJCR09EY1RRMkJQNEN3ZWRweVZLQ2FRditU?=
 =?utf-8?B?a2JDM25nbXF4Uk9ncXFUd3B5LzlKWjVteHBBOVM3R0N6ZGNMRDl4eXV1amE0?=
 =?utf-8?B?VXZEZmNMeWtGaUpCNkdjMmpRMUxkaXZJeDdIZjBEa2RRV01MWGtSSkxma2NO?=
 =?utf-8?B?WTJZUUpoSzRxcmZNYUR5emxxM0ltMDRyVDErYVJwenRnSjE4di9BYWFwRWVD?=
 =?utf-8?B?V1lrb296T1Ayb09DVC9nUCtnblV2SzRZenJMdTlSWEE0dVhEcDlMdHp2WXRN?=
 =?utf-8?Q?k50QyxkkgtbMxDXI=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 473e91c5-7bdc-4d67-983c-08dea0616325
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 11:22:07.0391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkhibJnPhqWZ8kdpZ+DKJrYVKAXaMhvmKlwSUJLgkJA/Z4b3zc6WCVHBp/4M/Jc0jCWfWXsfhKPhXKVeq23gZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3224
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17XjSRdGyodB3yzFkJuh1rS91Ws1nVx1tA+xdJJ6Stk=;
 b=xp/ATVm+sDkp40hKhgLSbjwBJVGFY7zf7XUySl6MrU5jrf8cHY1ezsy0Fi5Vkfty/Hg5aMMtVItMUfSwfsOiIlG2//qySBApEumLsE8o/22CoSYTdHDYuMKtepmY0qnxFnxCy8tUcTkMb47xQOccQtLeA5hGhXpNnik8l7fALobm1YGaVN5ch6YuP1z91KcttLsRbtQlsd6o4ksOVpB1njw4tJqhmHOVT/Ad0kwi8JkTTMdCVuAoUsqfHBJww4fBHLs40EIZAgk+MAqPtgt0kN6i7d1m+V8azKtHRE/OPDp3T8wjZDu4R3UiZQISA2DJ7HaqiV8o6u1UTGqjIosXmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=siemens.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256
 header.s=selector2 header.b=xp/ATVm+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Subject: Re: [Buildroot] [PATCH v2 0/2] Add efibootguard bootloader package
 & example recipe
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
From: Jan Kiszka via buildroot <buildroot@buildroot.org>
Reply-To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 efibootguard-dev@googlegroups.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 21.04.26 13:30, Christopher Obbard wrote:
> Hi Jan,
> 
> On Mon, 20 Apr 2026 at 10:15, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 19.04.26 02:20, Christopher Obbard wrote:
>>> This patch series adds support for the efibootguard bootloader
>>> (https://github.com/siemens/efibootguard) to buildroot. efibootguard
>>> can be useful when designing systems using A/B slot-based upgrades.
>>>
>>> The first patch introduces the efibootguard bootloader package which
>>> builds the EFI application, user-space applications and host
>>> applications.
>>>
>>> The second patch adds an example recipe which demonstrates how to use
>>> efibootguard in a typical EFI boot scenario. This may serve as a
>>> reference for users looking to integrate efibootguard into their system.
>>>
>>> efibootguard can be built for multiple architectures, but for now this
>>> patch series only builds for x86_64 (since that was what the project I
>>> added efibootguard to used). Support for additional architectures
>>> (including arm, aarch64 and riscv) will come in future follow-up patches.
>>> I expect to do that once this series has been merged.
>>>
>>> The example recipe has been boot-tested on QEMU with OVMF firmware and
>>> I have confirmed the image boots & runs as expected.
>>>
>>> Feedback welcome!
>>
>> Thanks for the recipes! Beside other archs, UKI and secure boot aren't
>> in scope for this version either, right?
> 
> That's right. I was hoping to get some initial feedback from buildroot
> maintainers to see if this
> is in the correct shape before adding more features like other arch
> builds, UKI and secureboot
> in a follow-up patchset.
> 
> I also have a sample buildroot recipe to integrate a RAUC bundle with
> efibootguard and
> RAUC efibootguard integration:
> https://github.com/obbardc/buildroot/tree/wip/obbardc/rauc-efibootguard
> which is from https://github.com/rauc/rauc/pull/1450
> 
> I planned to submit that example to buildroot in a follow-up patchset
> too, once the RAUC side is a bit further.
> 

Thanks for explaining, makes sense to me!

Jan

-- 
Siemens AG, Foundational Technologies
Linux Expert Center
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
