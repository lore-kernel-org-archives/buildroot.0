Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88B4C52D7C
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 12:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88474400B5;
	Tue, 13 Aug 2024 12:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HsvhfK8WhvWz; Tue, 13 Aug 2024 12:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45A85401B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45A85401B7;
	Tue, 13 Aug 2024 12:46:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96B091BF3DD
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 12:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83DF5404A3
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 12:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qKq404kW_X3X for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 12:46:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.155.12;
 helo=mx0b-002c1b01.pphosted.com; envelope-from=simon.rowe@nutanix.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 67A74400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67A74400B5
Received: from mx0b-002c1b01.pphosted.com (mx0b-002c1b01.pphosted.com
 [148.163.155.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67A74400B5
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 12:46:42 +0000 (UTC)
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DAB90D031720;
 Tue, 13 Aug 2024 05:46:41 -0700
Received: from ch1pr05cu001.outbound.protection.outlook.com
 (mail-northcentralusazlp17010004.outbound.protection.outlook.com
 [40.93.20.4])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 40x5r65yrs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Aug 2024 05:46:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9NiG2p14ytu0a1OD5zsMm0zZTFqZ7RTwAwCHMeZ9qQLeFdldZNWGpvi4BjXBvkZ6S10RMODS5v48plm6yluzNcM2YiVg86sxDtgjQrmxj7OUuKDunuWtf1VozWuXlrpCbZcx27+URNTBqhaEak0PSZB187za4wM4Cm9dUcM4CDNuiI4MDhHSUjUL6ioEUl/LqWwC+kiPNpFJvQ4ZMujTYKaHTERU3LAqeAoljP7wnKHefceXErR3TyW8GGRimOwkp6Y0OuPeCBQn1OI05SazYf/h886G1biIFzPoLpcFiwg/o8IWl1ebzBht5oD9EbwYI2vokbBZ0XpjpxAvhUy0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alT7GAB5pCLrpR18ucFPMh9Lsvm820vEyQ/Lpd+XJt0=;
 b=wu+5uwlSdZGkbVnZdeuU1ktNxKuy5QUZm0H3SnJzIpm9GOcvmWe98ZLr3B5UJ7XVjD5nil3hdXMLv8AwYyl+atwPjcQQ86na/iXzVau1HL9OW8RXI2F5k18QL2Kwy+V4fS0+02RMBip8+AyOHDlPcjMBWTrc88RaJK+NiPrA2TOVeRPi74Hi7ZB0Oojy+Wi+A+Z6LB1KLMOGj1PmmChIArFRJXlTEPEFbH1xJ9wZRJg6CdOa0qZo2BlGcO0haWgjxALL6huXgMt7E59m71ixjgp3jCZi/IxAKVlkBBj534A0ND1G2a20BVmXh2mtAQ/ZZ07UQKB8Jo+jE9095Jn6Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from DM8PR02MB8121.namprd02.prod.outlook.com (2603:10b6:8:1a::12) by
 BY5PR02MB6865.namprd02.prod.outlook.com (2603:10b6:a03:238::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.22; Tue, 13 Aug 2024 12:46:39 +0000
Received: from DM8PR02MB8121.namprd02.prod.outlook.com
 ([fe80::ca00:b1fb:aa3a:f3e4]) by DM8PR02MB8121.namprd02.prod.outlook.com
 ([fe80::ca00:b1fb:aa3a:f3e4%7]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 12:46:39 +0000
From: Simon Rowe <simon.rowe@nutanix.com>
To: buildroot@buildroot.org
Date: Tue, 13 Aug 2024 12:46:33 +0000
Message-Id: <20240813124633.197119-1-simon.rowe@nutanix.com>
X-Mailer: git-send-email 2.22.3
X-ClientProxiedBy: BY3PR10CA0015.namprd10.prod.outlook.com
 (2603:10b6:a03:255::20) To DM8PR02MB8121.namprd02.prod.outlook.com
 (2603:10b6:8:1a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR02MB8121:EE_|BY5PR02MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: 031f1d5f-e9e3-4e13-a403-08dcbb95f993
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+NWl6mW7ULOgBz1EyQ3E06asLJ8tSvgi8ioPPJFTugNY5yGjub5aJFb4f8Pw?=
 =?us-ascii?Q?BgNB7zKD3pIOVIUEwsEdH/YE4rjuFxm6gwSejgWX8n49n6tuRCuA2rKnV5AB?=
 =?us-ascii?Q?iXqjl5UClOCs7roGgaSPkZBTGYWEXWWZ0Jzd9nkWwd0xP9fEtO5NBQXFCcJD?=
 =?us-ascii?Q?b/nyGINb+TVcsu/2u6JsTKAVLnDKWvMkTHB18ZLhRL3upUQLctjkyxlA74Vt?=
 =?us-ascii?Q?Hn+JmeKG2RR8+24YPGGa4axUZi5c+p9dVFwhJ9p/k/uHTlX38CuvVFSe5Hp5?=
 =?us-ascii?Q?ovo5Ap/54qSm731dHTbnYgj3Yo0QvSZVJMakwrcK3XtFTX6q6IhioXRLAg3M?=
 =?us-ascii?Q?POdnxl2eSJCyXdWZ8s5KZanoc4jk/TaLatCnSbCy7lRk9aVV80QkZ7FdxfI/?=
 =?us-ascii?Q?CA+nlNcJSMm6CV2Z0pYPCxnOtWN7bR6iKkqDsnES4qSbAtfMAr4UCys2wBQ9?=
 =?us-ascii?Q?PQOE3dTrvJJhyBXln8dNQjV3cHvl2d7MQXjSkiUGFB5Pbpk9qSfhLfZEnD8u?=
 =?us-ascii?Q?C6F7qYQQMJL2lHSqfsN7Uc67CVyX1Xn55X8KFS01WSnhkwOsUU5/7mLqJRex?=
 =?us-ascii?Q?DpHYoy97iKfjvoCEpeYYFX5U1myhcRYpfYa7YPJTk0ZfZUvsPOP1qsZaXr4E?=
 =?us-ascii?Q?zmpSfTFwkkzupj7qFHSCuEMwinabKeP/aALEKHnyIt5Mm3gs+6j1y9rNMaFM?=
 =?us-ascii?Q?T+NVGc3/fjd+CsomSl3D8GLEW0wMrnLya0TlYXXHMLo25B3OKL/05CctpqTk?=
 =?us-ascii?Q?GAviCFQ2PLLOdouzwytTbR1Wi1kbRl6dZbF6fvHmwo4buDZhgOb6aaZXSw9D?=
 =?us-ascii?Q?Ai7qHsvKDS/40K+KgDnTNIXMPRVjAtiMCkDB9gzXaHr2806wcu4U+WwSp/9k?=
 =?us-ascii?Q?wnNmBiX6g7J+jlaVwW/MbDy3j2d5UtTv8BRnwmN3TLfXxH1RMwpo+LTiFZFy?=
 =?us-ascii?Q?yelercLlslzIU1YVPbN+iDwqy8vFrRoJwWrPLtRBaYPbzWlY0Dlsmb/DjfnZ?=
 =?us-ascii?Q?feUgDp0uHTKS8TX1M18SkcOY0PI/6QJoWnWs1NIjJt1qSb8cgSUZnl01lW4J?=
 =?us-ascii?Q?mxVyQm2B0rd8G91Iwa6MZO8JtnEF2XTcIjGfDsd7nUO6VNSmmL5tcizKvwrI?=
 =?us-ascii?Q?8PJbkZDC0mqj0c3F/h1E/pDjENuogOE0wuUceuceLjRo1eGKSSG5JZKS2P1R?=
 =?us-ascii?Q?7v6FuRgAjvlldHBKtU3MGAO9ERvMQJabYDIcjjAA2WhhOEAeC4Vptd4bt2Ek?=
 =?us-ascii?Q?UMwemQkNz5eBsudIbXCJdLHfztDPhzlIllDGK4DghOCPI96t082Tz4YllD2G?=
 =?us-ascii?Q?5GfX1QF/8PCJoF3YRHyx94lmXvM8fWrc5Ix6wOEeqgVSv3tSJDe9aCA5Lee2?=
 =?us-ascii?Q?FxBc4DxfRTg4RKyV1fDRni1STp+1cspya4EQ3fXKTq3gtK3ZETxf39TJBfkt?=
 =?us-ascii?Q?J3Szoqlmeq9fNX7ZmbrtA/agzd5RSf6+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR02MB8121.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(41080700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7HRrtP3SGQWNS91r7wrTQxwyPz4LtCJpU8tdk2gI3/AA6FX3b39PLF6t1Y9i?=
 =?us-ascii?Q?ZkrcwBPivxKShYX5jt+yIXJl1kh4OBGEvp7ZDXUk92HZptWAfos5J1m0/S9c?=
 =?us-ascii?Q?8tOOklasOpt2DXlQGq3igawyUf5XLY0q/LLZiLj+fd9B6pIfGPRbwkwwSejT?=
 =?us-ascii?Q?GZ55a/+zZ4s/tKQ+tZEQ/ZNk0aHJJfZXjLGGR9L3dlU7Zaj8dlbUzsOOSDhy?=
 =?us-ascii?Q?+25Y3R4PpauIGBdrktGdjwJ+RxmXBZTYFxs7Qw3OHcXaMa87vUj2DFFngShp?=
 =?us-ascii?Q?Nkz5NrlcHO+RWjExAoSr+R1TL4ZYI4u62eoArFWUOqW3WjIbGWXdI1nFuuAF?=
 =?us-ascii?Q?JQSDWxNglv07fDC0OHEdkyvKs26R/8/Gd9Tqto5WWfLB3DQIhkj7zrKFcQlV?=
 =?us-ascii?Q?v+rk/7UDkUellKzqHGbGyOwn/fioG218G+iJw7rsUHZbtdoxo3zKzxFwhxrE?=
 =?us-ascii?Q?/hLjsTOeFJnteO0NQx3bV+b2JrX5Aht+dwQdSNBzyQO84Dl+gRqYEE7G+HeP?=
 =?us-ascii?Q?gPrqPD19FqpmxnwsjWvJotX+coxy8cVaD7sUuvDkSeVsPfiucD+0dDU03KHt?=
 =?us-ascii?Q?ww5Vlv2EsQtRk6G2Qeog9izwoJMHpUau6sQ+G1GeLHVciQNLIudvkP4h2f8N?=
 =?us-ascii?Q?A0odOruFvMdBW7rq3FaNIeS+FbC/5yORIRLzmO9O2ESrXPHikGzn2fMSC90O?=
 =?us-ascii?Q?Rlhm4qfW+EX2Izam9Xc5PvV83GdJgh6SD8t6JGmnRYRZuAyb60PqsCjPUra/?=
 =?us-ascii?Q?WvCQktoFzXZYdcms6mh+LHLZcx/tMDmZSDsR2ztJMwuQIGbKvS1ctVVuWUeW?=
 =?us-ascii?Q?fiq79JErvpUdX9XdjqYAEeGDURojb8y4m+qHLNmqIPbT2lGDuG1cCw5lpZNV?=
 =?us-ascii?Q?2eVWVydohJ+ps84EoV6zBTQIaSW0EkhnALWuXlS16QhGlRT3nwkpd9NeEfTv?=
 =?us-ascii?Q?JPfhVdh2XG6sLMzmwPVhiJsKV6PMWcKHxWF1Eh7NKjfs7B6HbD1c+S98lqgn?=
 =?us-ascii?Q?4jawecnyp+zUgjKgDcVGZnKvBr7Etv5mijpnxBRI6YK8a6slbDtdqwGqNf93?=
 =?us-ascii?Q?6tCAPtkURXMSvgXp4iojXZDDjqRLekR00Mi0MqaKJdmkhN197pzxVOtCWRJN?=
 =?us-ascii?Q?RQp/8x+BUMW0rb31v7Pr+4OqsyKvpc8MvWp+4GjT8IrzNYrlUFDv+abKjZOk?=
 =?us-ascii?Q?Ur8dQCzuc0dJmp1tMdZQBMioWx6bby01H3dLXOKkEo8kFtE9zKoLNY7L+32d?=
 =?us-ascii?Q?Xs30DlxtjeysiFmleFEYkaPpX+mgi3O4crS22thdZPBbx3Hi8/OXeiZ2Fffk?=
 =?us-ascii?Q?p/BgKOVrXGu+RukRAILoF10i90o9XnGkStM2V+JBkHgZjBBLWAg3ui4obqT0?=
 =?us-ascii?Q?m664zUa2mjzTLtt/Ct0z9kD/Bpyz0LNNvdqrJ49h2WHM65EXwc0ZAZjLd6iL?=
 =?us-ascii?Q?4avnQKRtF9O8/Zms3tsiEvbz17/Bvw5QS2XB9NX5BvYNu2LTMEYqnHkpNqww?=
 =?us-ascii?Q?nfhy+rmMWfONTSg4V9LVxvJc53L3+GaJcgX1A0Ukc15uf7KqGzO5cJU9//3I?=
 =?us-ascii?Q?csaEr9oT/pYrI4Y6DjSLhZHnl6o6XuzptL/4Fum7YkBPjtN152kjfBt7wj6t?=
 =?us-ascii?Q?3w=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 031f1d5f-e9e3-4e13-a403-08dcbb95f993
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8121.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 12:46:39.3167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XKzO1KMGcVzdCy5gV9UrGeXPcsC+tD+08NfkiUEixwgkq1SpHWo4tuTUfZIwHEgho/KFQPYfzw1/yTQ9+xehlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6865
X-Proofpoint-GUID: mNkgkf87z3A0OMItXpcZd0ic4hQHJhSL
X-Proofpoint-ORIG-GUID: mNkgkf87z3A0OMItXpcZd0ic4hQHJhSL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_04,2024-08-13_01,2024-05-17_01
X-Proofpoint-Spam-Reason: safe
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nutanix.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=proofpoint20171006; bh=alT7GAB5pCLrp
 R18ucFPMh9Lsvm820vEyQ/Lpd+XJt0=; b=DLzOHN9ixmFdi8F8bYK6DePvLwMnj
 f9G3COXTurpmFTKu7I60373oEepBZY9JztnVzyM8KcdA6QD62dnfT5tCZbLcQD6e
 a8B8ZC7D6kEvd0FqFnDf6uIAyYIsdSXkGJZ/2mc0lS8vQxe8UIYm/YoJfM29ks7V
 n8uqDuOw9Nb68H3nnMtEfV/615GK0wpBz/KkFEzJGoeFNoiwU5syGIRfTcnHCuis
 dCWID/jklVKTx4J9voH62dXeaSzHGBogL6rNeBTw/n2pDVFGgfAajgHbGWZ1JRGf
 WGE0rTlVvqGAjEcriO5Ru54VfqpI2bs/LmeW+C8wLTdWvcLy2q+LFJ53A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nutanix.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alT7GAB5pCLrpR18ucFPMh9Lsvm820vEyQ/Lpd+XJt0=;
 b=OAiw97poCA5vzS72OH4U7VYw1fIpZnv4RoqOdHrWG3oW7uUbigN85iNIlIy337dZcfrBg26nBJZqtmf7yVOXnJ+RAs3tgTOa8a02WA65xhRQBV5INdvTMki/Hyyu6ezvVicDBqtzzU7VcqZ/Ky8GSJb5Y7qp86cYA4cAloyHbXJr3D9xf9BOhfKSHJi4ujnfpT/FMofjHs2x9BA6UCJE2FQ9EvFggXPVqPRUYGicFSiaYJTxZ1EOIqT6v2GWAhXVPMp9kejumqIO1DRlMweu7y0RrEcsHqr8qOyZwN5PrqOEKK1kiFostzss7mL/HGJ4OaKP16SD6YSy3tjxJhxk2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=nutanix.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=nutanix.com
 header.i=@nutanix.com header.a=rsa-sha256 header.s=proofpoint20171006
 header.b=DLzOHN9i; 
 dkim=pass (2048-bit key,
 unprotected) header.d=nutanix.com header.i=@nutanix.com header.a=rsa-sha256
 header.s=selector1 header.b=OAiw97po
Subject: [Buildroot] [PATCH 1/1] package/eudev: support configuration via
 drop-in
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Simon Rowe <simon.rowe@nutanix.com>, Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Take the arguments for the daemon and the "udevadm settle" command
from variables and support defining them in /etc/default/udevd.

Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
---
 package/eudev/S10udev | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/eudev/S10udev b/package/eudev/S10udev
index 4e799d6507..6f20fc51f5 100644
--- a/package/eudev/S10udev
+++ b/package/eudev/S10udev
@@ -16,6 +16,14 @@
 #	/dev/zero, /dev/null -- that's needed to boot and run this script.
 #
 
+DAEMON="udevd"
+
+SETTLE_TIMEOUT=30
+UDEVD_ARGS="-d"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
 # Check for config file and read it
 UDEV_CONFIG=/etc/udev/udev.conf
 test -r $UDEV_CONFIG || exit 6
@@ -25,10 +33,10 @@ case "$1" in
     start)
         printf "Populating %s using udev: " "${udev_root:-/dev}"
         [ -e /proc/sys/kernel/hotplug ] && printf '\000\000\000\000' > /proc/sys/kernel/hotplug
-        /sbin/udevd -d || { echo "FAIL"; exit 1; }
+        /sbin/udevd $UDEVD_ARGS || { echo "FAIL"; exit 1; }
         udevadm trigger --type=subsystems --action=add
         udevadm trigger --type=devices --action=add
-        udevadm settle --timeout=30 || echo "udevadm settle failed"
+        udevadm settle --timeout=$SETTLE_TIMEOUT || echo "udevadm settle failed"
         echo "done"
         ;;
     stop)
-- 
2.22.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
