Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E11C5AD49
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 11:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82C928137D;
	Mon,  2 Jun 2025 11:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JJiodor4NWxw; Mon,  2 Jun 2025 11:09:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C391781367
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C391781367;
	Mon,  2 Jun 2025 11:09:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 977D1127
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 11:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D739608AC
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 11:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cCaYsMRPZ6hY for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 11:09:10 +0000 (UTC)
X-Greylist: delayed 518 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 02 Jun 2025 11:09:10 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D3116075B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D3116075B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.132.181.66;
 helo=mx07-0035d101.pphosted.com; envelope-from=gilles.bardoux@sagemcom.com;
 receiver=<UNKNOWN> 
Received: from mx07-0035d101.pphosted.com (mx07-0035d101.pphosted.com
 [185.132.181.66])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D3116075B
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 11:09:10 +0000 (UTC)
Received: from pps.filterd (m0166235.ppops.net [127.0.0.1])
 by mx07-0035d101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5523spS0013832
 for <buildroot@buildroot.org>; Mon, 2 Jun 2025 13:00:30 +0200
Received: from pr0p264cu014.outbound.protection.outlook.com
 (mail-francecentralazon11022142.outbound.protection.outlook.com
 [40.107.161.142])
 by mx07-0035d101.pphosted.com (PPS) with ESMTPS id 470527h3rf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Mon, 02 Jun 2025 13:00:30 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omf3UHQRYT0cnFS3bPFy2Tq1KPuEh3pih50pIULjL6Ab/ka1JduKjrrvATQNKiHc7PUK8VoFWrsJlSjhrU7b5FMRoLp4NUeAZorkBs+pVUo7G0uucwiF0GiRbs1j0yUn3PnPdFi0NFvIAUNBzTKVSKvqMI6eGCI/k7/+E1R201reHyI0Qf6tkeOCWVkCjgggn5jp1rv3Ajynn5NdVMhLldHgJFfBgjmk0xTQNgCOetJ1pUUmCh4PZIKEgYmo7KpjHRpB1GCKI7TpoupoMIdCaDtAYaEc6NR3e9gTMK4uwpzZPpVnFs/GqcuSarzvv7sYsyt0KlXvLuZEV+J5d2Mq+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YFB9Bf5eQb3OBCUiozWwMtjbJy2uyLQHwlgdMiRceE=;
 b=bYLHBETAxUYevcpKz06bho4xkAe19Vo8WPqTip+875vBmGt8caPmqWJaSYiY26LG3hM/lDGci1sRK7SDH6Zt0ns4yWySIqIY6oIblYme9Yx/L57wzpl/+ZVKjn9ikodusXYTfc64d10L1sVaQO7mnZNmdpZWFIeyS9ZZRsNe0mFWqbljfoO+a1gK9k+YXBDm/IBRDlb3QsDYP1sYiEA3xh0Zvnv/hLiGB/NE/WaD8CLK9S/Bi6ayxpoQ2UX4cXYMsnmceoTe2L+DRcir9VtIXDAojEfJD/mY0wmCMUr1mymsLSQDLHt8WMl0MVLOVX8iec/eBePbL2apmlffQhjavw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sagemcom.com; dmarc=pass action=none header.from=sagemcom.com;
 dkim=pass header.d=sagemcom.com; arc=none
Received: from PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f3::9)
 by MR1PPF699502CC1.FRAP264.PROD.OUTLOOK.COM (2603:10a6:508:1::233) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 11:00:27 +0000
Received: from PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5e6f:3831:f41e:93f1]) by PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5e6f:3831:f41e:93f1%5]) with mapi id 15.20.8792.033; Mon, 2 Jun 2025
 11:00:27 +0000
To: buildroot@buildroot.org
Cc: Gilles Bardoux <gilles.bardoux@sagemcom.com>
Date: Mon,  2 Jun 2025 13:00:06 +0200
Message-Id: <20250602110006.3257934-1-gilles.bardoux@sagemcom.com>
X-Mailer: git-send-email 2.39.5
X-ClientProxiedBy: PA7P264CA0345.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39a::13) To PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f3::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAZP264MB3183:EE_|MR1PPF699502CC1:EE_
X-MS-Office365-Filtering-Correlation-Id: f9d0fd30-2d91-4c61-c394-08dda1c4ae99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MZo8vGBKslcUE+jPDVFpIYU4OfZ+vRhIlHy1lsnooSgiyo24TBDpXsWFrUum?=
 =?us-ascii?Q?vOvrfT8SrRuI/dTfNBrAas/98Z/mCL7F6c4+22pMReAhnCgabtrU4JspidLv?=
 =?us-ascii?Q?lvvjX2tEpX8d7vcXxFYcnXmIubJMzafRGUMqGBhaFIQ0kly9Mmzg8Zh2cDAG?=
 =?us-ascii?Q?xqrxuTdEsYPD/3GR0Euqxd8N8lWJQED3Fetc6fLzooyo82Uqnaki1jwb2bN3?=
 =?us-ascii?Q?iKvIsHTmT/BY4ZLLz/bILUAWer93rGOaXkcxWxnbhD22YxEbBPl37szekdRl?=
 =?us-ascii?Q?jTGj6noezzm36L8LOgguxNQvLlWYkn6yE448pio5BJhh/RU1dazqznqxODiZ?=
 =?us-ascii?Q?fSxz8xaKsuNNOa677+VKohTM6AcfMhAuVCdDvgOhp3osISBcWYkOrkWE7fm1?=
 =?us-ascii?Q?aEMAu8V93/AQTmczH5tGOgwT1DVM4WdW9wr9RQRsHE7sRdsnmjvQdTuZaxqW?=
 =?us-ascii?Q?8ZhYY2i1I3OenJ+jtXFoFgMQ1n+BKRi6i1/h8hqk9/EThXtPJlafJlOoMNNw?=
 =?us-ascii?Q?TZkrnF0XUtTc+eTprVFNVTwMFMe7Pc3+71BuRj51mIO6qqfUp3QfAQCFQQ9F?=
 =?us-ascii?Q?oBgUHeb41CjaPyQHkgnBRsfravlrTkEp42XUKInznXsRLZx3nthYUN44i73X?=
 =?us-ascii?Q?SGfu2cusa5gM3+c+useARX+6tEEKwV9u2fn48WUuwenI+0AaGOJK6Kyz9bYF?=
 =?us-ascii?Q?mkdGY9cmYmYMbDWjSjhhZh1Mccm8flojSInNoAhmNLHGuVexZBx/YBYzM5kj?=
 =?us-ascii?Q?TQRJKOjSEchB+Ve++GGbe/8qrxrYrZ3gNPvd8BOZUMqMAs+5u8cExBcxstbU?=
 =?us-ascii?Q?bjftYci1dQn0OaJKSIgb4p617mqm6HvqKLuD2LgNuO5zh96IWDIgY8qXg3uF?=
 =?us-ascii?Q?lc632EsYb0U2KlcDlUP4IMNvI9LyCkmr4MTM5fUj4eFxQ+b/B/PJTG8mlHdT?=
 =?us-ascii?Q?mel5J5Y/YmnCmf+2Ldi63YnhYKsgIWBSJa/MN1otW4nwFTcRCAAEjc47tt91?=
 =?us-ascii?Q?p/L4bTgMW8yLKmBjN0DYugMwhG3k564kDl1rMXOhUBLWp4mr3f+1OppKmerM?=
 =?us-ascii?Q?pdyUrYCx5Z1qgESS3rAbJMD2GJzS0qYeFTihtpmzks3RL5gyS2WRMCiTs2it?=
 =?us-ascii?Q?2RENVZhNmRv5/QAaOH8tBKDb5IZ7cu1TGLL9NCRBWrx3YvF9a4GiYSE89ahl?=
 =?us-ascii?Q?+sqHUWOZzMtYy3bT88FoucCMQuaNTErkeoBifxL+s4DR7jDrtEq2Nxi9M7s7?=
 =?us-ascii?Q?89O3hLwcSq12WWX6aJJ/n2x83qIU0kptEFhpYU6tPF0aHwfUynBY0KUfsfty?=
 =?us-ascii?Q?ggVIKWoang1d3Hp+cK507S/1ZR/ivperj4044AipWHc5TNBdqoxKFqb+Y5Rp?=
 =?us-ascii?Q?/Oie1aIzWsapt3ORPev7y35uxtE5/wA9CfE65I1kdzneFXbE+rb77Dmxlby9?=
 =?us-ascii?Q?aqTNrs42PJ1RjS0WeiV8rwiIdyXrmH8vzq6fciMtL4tHn6VRKMmYMzLsAPNn?=
 =?us-ascii?Q?ime2c3fjtfSA8qg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3/KihbfQs2K/R1pFF4O2145oRkwzJEh8+j2RqMJvQUjEMALQtCHAFCrbIwYD?=
 =?us-ascii?Q?RqJCOeRRvheQZouOt+BlmIwTRZor3Xgy9P+1vRtpkkAb5jZUr8MMX6alrj3U?=
 =?us-ascii?Q?ZqM86Qu/c1u5/NphQ6e4kcZ1LtaCUTUFj7cQUCnZauOJc+rV8qXTESVBZKYH?=
 =?us-ascii?Q?tQ6PJ4puytZlFIkXP0Kqv6xuEUCdxczig8ctkbuVjSNIXQCIGsDf7nLV+gOv?=
 =?us-ascii?Q?ibRfO6/ONy3cdW7AfJn7PfE4sjCgd/PXwMNbL8OYK9AFJDfQ4kz91FcyqMGK?=
 =?us-ascii?Q?/8UOiif1RboFhW7F/5KPKJJFRjjjRv+VTcFlKgBPEWLJg4m4GbyPvyMHioB/?=
 =?us-ascii?Q?Ca6lwapajsUVYXtdACJX6ZoWGsqONGrNQnfPlG9q6Kc++xEQ+IUFlbzi8iZr?=
 =?us-ascii?Q?Np2wJsCbGy1K/CT9ptMTdU8RWiVwOMdz2ORAYe5HWSvR1M1T2vmH0ugUCc2W?=
 =?us-ascii?Q?nXoS25OQuJ3Ou+S5AytZbXM9WsfzixsIq289lql3goQlaykOl+xITQdmqR5t?=
 =?us-ascii?Q?WWuXoiDUZX/2gEPlFU/9L6PPK7GgtQnqF4MwYzt6D+8sKXdf7+ZVtmfVrgaV?=
 =?us-ascii?Q?sLbxUUMdZNbu4Q79z7F2KymXfQvYU3Bmvu6Trb+64qCOjeONKAfpmghNmESN?=
 =?us-ascii?Q?dfSnylrTDNCDkPboZLbtzMXswwk3L3XOcNcgPDFWFQ+xSqEFS9zNyQ4hVJen?=
 =?us-ascii?Q?u0YtcM0rhLaEFMU8iCByJN4w96gpMz2KbzGUg7MKeKGETu2mzVKXdY4bSj5k?=
 =?us-ascii?Q?Fd3ejmOe09LJy1qF2sFARRv6RvKiI+MoZjU6iRmt2EuU6ovi0NJjZsbXJ83K?=
 =?us-ascii?Q?S6khcmvpqUaYDuri7k1X1ypis+HDHeSdRYIHW02Jr2AGM5zMwzCwKNoJ+MCT?=
 =?us-ascii?Q?WGuq8LYwQK2G99QmQhNDImuGQzOUINGzr2eC4zo3hizHneZyAfEjPmi1F6Ev?=
 =?us-ascii?Q?Bp+gEUhpfsQoLmx2/+yx1+da0MeOUopHgkveku01C0HVm+Gorr5TLL2kTFjz?=
 =?us-ascii?Q?1tKYDD7XQ/OUpnvuFQb9a6qCRXQaWEY90r2iyhEQBmOLr6l9mPHoINNix5JI?=
 =?us-ascii?Q?FRdIAOeqFyz+X3ElsFlpXFiY9jQh8NeesSi1hD3wukBGvwqvr2XFAq8ZbQpJ?=
 =?us-ascii?Q?HKgYl5PNxNCbr6XHTl4MceDdeIXr6nCBgPXr0skT6hj8QsbQQyxsqzkoMkU2?=
 =?us-ascii?Q?Aj0i685oFbSrKBn3vL6/jVSt0S8FwAdUc+BfJ3tiuKYl8uiXNkQYl2FhdZAk?=
 =?us-ascii?Q?Zin1LwsT1DZ9qCOxXw4+pA8UXNJrnTF/EruTAUTZn364aLPt4lNZroljPa0Q?=
 =?us-ascii?Q?TIKJ7ss5uId7eWKgXtLCZCrrdZmRIeH4xweDO4IdL6vthajIF1gRHdVGPCGh?=
 =?us-ascii?Q?iTVdGZsoG5Rh70Wm7TI29OqkeC+PTrJylqd1Kv0cYKfiowJSK5CYO7qQ9MLT?=
 =?us-ascii?Q?4kk2mb+oURoHZF/mBHgI/uqa75pAx0fLJJ/IuHqFIAwy61fAediBGu52laGO?=
 =?us-ascii?Q?5D4jQHezGxH00t0MpJOI8pAkgWbAlIsjETYCAV64/0cKKr5cZChbGGURlu9h?=
 =?us-ascii?Q?kAXwIDKSTTLz1AMPzYJ3JlZhFfUomLi9gCDPC4v9MFz6Xim88ltab6YVO3ei?=
 =?us-ascii?Q?IQ=3D=3D?=
X-OriginatorOrg: sagemcom.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d0fd30-2d91-4c61-c394-08dda1c4ae99
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 11:00:27.3107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f9ffeb1d-70f1-4c2c-b7e6-d080242df8d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQkQ3sDhJNafjvHT8Ig/WVKTieWJqVl1KP/QERB+SY/BMhpVNpoabKcWD8RiRMIu0qEda9HCOasoz8tE1aNVbwT3v6l2yDoNTv3OWQKqsh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1PPF699502CC1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDA5NCBTYWx0ZWRfX776JyBLZRok3
 UWWfAsmNzQKw/GraZP+Mqq0hLSOBLqWbB1G7oQ9p/LrrdZzVnVin0b1y+jTSoz5kbMVUOwDljCf
 npySH+iaBYQOQHcKbraErslzYz4sAM4OkLgzJdjnLtmFKmov39cQ028UALENM6/SGh//TR10lW5
 6LceR4N9m4xZPCg1ealDfW+HGHMI21gfzlr5QzAMRR93yYgg6SnBFAq39AdsI+H0tKuXE7+PEc4
 l9wUPiu1b8LT/YlOSHv2OO5c8VGNmm/C5FbJYdya/EwCcgl1NleJ4pA4GiAUWbkod1pkT3n/KQo
 gif1stprCt0NP8AIfgL4NjOirRX4eJHY22K335acrMH2241dRI78lzWweyogv5UxhOO4vBfdo+d
 dkxmD0NhqMl7dKaZRoac5PhSkRznGREjLRqQHBt6bXuv//g2Q5b3jgn58I428ozBY+J049AA
X-Authority-Analysis: v=2.4 cv=dIOmmPZb c=1 sm=1 tr=0 ts=683d844e cx=c_pps
 a=xvhvfIbTdVFexAtu6In1EQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=cWJNfkV6-HgA:10 a=Yh41P-WkAAAA:8
 a=Joi1bp7DNvzZmJBCSoIA:9 a=t-YQpmI8WX82GxrYqon6:22
X-Proofpoint-GUID: 4UKpnNMS4sTfMf_x9BTcCUTxIzL5Fmfo
X-Proofpoint-ORIG-GUID: 4UKpnNMS4sTfMf_x9BTcCUTxIzL5Fmfo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_04,2025-05-30_01,2025-03-28_01
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sagemcom.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=s1024; bh=ujaAVx5tkClyzbq0A/yjFYf5gZ
 dTihmqoh6mCri7hEs=; b=Zv2rDZstK2xiAeS9sTa/3iBaYVDtA3OBwglPCajbyG
 CIXOPUzWLkzspiRsGhVIco80yf/aIkU59IwE7/WJjfbgxSdtTvtSGxYL248Hmfte
 2jb3NVdQGlU4bGh9IXEFfsxyzRvZz2tj5VYVg9k39JIJOom7Uw1kQkv2selXXT3i
 Z7D6UmmDoCKsgjJRqODlTRkfVe6Z9YstcvTJIPhdlt/8tPzRb9EaonFS7R7faVez
 LjOszX4bCshpFrtfVY23dQTJyMo331k3z7D35b7oNbad3XbwSm4o603+QuOMnO7W
 VRhEWJ7OqcJkUuBY29M795Z1/w8SGG+TTMK9nrY2MWyA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sagemcom365.onmicrosoft.com; s=selector1-sagemcom365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YFB9Bf5eQb3OBCUiozWwMtjbJy2uyLQHwlgdMiRceE=;
 b=xzQhJfwOLaQpVqXct+Iy6mTWQlfPZtYZeuGsLogWTYH8GYpuxvE7dw6ZYS5eUqoTDj/MqODb9DoQjIhPUnWBekg+YNquVcUF9bmxsAfuXHHuMDi1xZptY3p+CqM+51Jl/K/LR7fK7GBFkGqKbnO/niD3FoFBeIpKUE8aZB1Mhjo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=sagemcom.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=sagemcom.com
 header.i=@sagemcom.com header.a=rsa-sha256 header.s=s1024 header.b=Zv2rDZst; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=sagemcom365.onmicrosoft.com
 header.i=@sagemcom365.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-sagemcom365-onmicrosoft-com header.b=xzQhJfwO
Subject: [Buildroot] [PATCH 1/1] Makefile: strip even non-writable files
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
From: Gilles Bardoux via buildroot <buildroot@buildroot.org>
Reply-To: Gilles Bardoux <gilles.bardoux@sagemcom.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q3VycmVudGx5LCBmaWxlcyB3aXRob3V0IHdyaXRlIHBlcm1pc3Npb24gYXJlIG5vdCBzdHJpcHBl
ZC4KU2luY2UgY2FsbGluZyBhIGZpbmQgZXhlYyBzY3JpcHQgZm9yIGFsbCB0aGUgZWxmIGZpbGVz
IHdvdWxkIGJlCnNsb3dlciB0aGFuIGRvaW5nIGl0IG9ubHkgZm9yIHRoZSBmaWxlcyB3aXRob3V0
IHdyaXRlIHBlcm1pc3Npb24sCnRoZSBTVFJJUF9GSU5EX0NNRCBoYXMgYmVlbiBzcGxpdCBpbnRv
IHR3byBmaW5kczoKIC0gb25lIGZvciB0aGUgZmlsZXMgd2l0aCB3cml0ZSBwZXJtaXNzaW9uIGZv
ciB0aGUgY3VycmVudCB1c2VyLAogICB3aXRob3V0IGFuIGV4ZWMgc2NyaXB0CiAtIG9uZSBmb3Ig
dGhlIGZpbGVzIHdpdG91dCB3cml0ZSBwZXJtaXNzaW9uIGZvciB0aGUgY3VycmVudCB1c2VyCiAg
IGNhbGxpbmcgdGhlIGV4ZWMgc2NyaXB0ClRoZSBmaW5kIGV4ZWMgc2NyaXB0IChub24td3JpdGFi
bGUtZmlsZS1jbWQtd3JhcHBlcikgaGFzIGJlZW4gbWFkZQphcyBnZW5lcmljIGFzIHBvc3NpYmxl
LiBJdCBkb2VzIGEgY2htb2QgdSt3IGJlZm9yZSB0aGUgY29tbWFuZCAoaGVyZQphIHN0cmlwKSBh
bmQgcmVzdG9yZXMgdGhlIG9yaWdpbmFsIGZpbGUgcGVybWlzc2lvbnMgYWZ0ZXJ3YXJkcy4KVGhl
IGZpbmQgY29tbWFuZCBmb3Igc3BlY2lhbCBmaWxlcyAobGlicHRocmVhZCBhbmQgbGQtKi5zbykg
d2FzIG5vdApzcGxpdCwgYmVjYXVzZSBpdCBjb25jZXJucyBvbmx5IGEgZmV3IGZpbGVzLiBTbyB0
aGUgZmluZCBleGVjIHNjcmlwdAppcyBjYWxsZWQgaW4gYWxsIGNhc2VzIGZvciB0aGVzZSBmaWxl
cy4KClNpZ25lZC1vZmYtYnk6IEdpbGxlcyBCYXJkb3V4IDxnaWxsZXMuYmFyZG91eEBzYWdlbWNv
bS5jb20+Ci0tLQogTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgMjAgKysrKysrKystLQogc3VwcG9ydC9zY3JpcHRzL25vbi13cml0YWJsZS1maWxlLWNtZC13
cmFwcGVyIHwgMzcgKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNzU1IHN1cHBvcnQvc2Ny
aXB0cy9ub24td3JpdGFibGUtZmlsZS1jbWQtd3JhcHBlcgoKZGlmZiAtLWdpdCBhL01ha2VmaWxl
IGIvTWFrZWZpbGUKaW5kZXggZjkwYjgzNGVkMi4uY2YyYjUxNzkzOCAxMDA2NDQKLS0tIGEvTWFr
ZWZpbGUKKysrIGIvTWFrZWZpbGUKQEAgLTYzNywxNyArNjM3LDI4IEBAIFNUUklQX0ZJTkRfQ09N
TU9OX0NNRCA9IFwKICMgICBhcHBsaWNhdGlvbnMgYW5kIGxpYnJhcmllcy4gTm9ybWFsbHkga2Vy
bmVsIG1vZHVsZXMgYXJlIGFscmVhZHkgZXhjbHVkZWQKICMgICBieSB0aGUgZXhlY3V0YWJsZSBw
ZXJtaXNzaW9uIGNoZWNrLCBzbyB0aGUgZXhwbGljaXQgZXhjbHVzaW9uIGlzIG9ubHkKICMgICBk
b25lIGZvciBrZXJuZWwgbW9kdWxlcyB3aXRoIGluY29ycmVjdCBwZXJtaXNzaW9ucy4KLVNUUklQ
X0ZJTkRfQ01EID0gXAorU1RSSVBfRklORF9XUklUQUJMRV9DTUQgPSBcCiAJJChTVFJJUF9GSU5E
X0NPTU1PTl9DTUQpIFwKIAktdHlwZSBmIFwoIC1wZXJtIC8xMTEgLW8gLW5hbWUgJyouc28qJyBc
KSBcCiAJLW5vdCBcKCAkKGNhbGwgZmluZGZpbGVjbGF1c2VzLGxpYnB0aHJlYWQqLnNvKiBsZC0q
LnNvKiAqLmtvKSBcKSBcCisJLXdyaXRhYmxlIFwKIAktcHJpbnQwCiAKKyMgU3RyaXBwaW5nIGZv
ciBub24gd3JpdGFibGVzIGZpbGVzCitTVFJJUF9GSU5EX05PVF9XUklUQUJMRV9DTUQgPSBcCisJ
V1JBUFBFRF9DTUQ9IiQoU1RSSVBDTUQpIiBcCisJJChTVFJJUF9GSU5EX0NPTU1PTl9DTUQpIFwK
KwktdHlwZSBmIFwoIC1wZXJtIC8xMTEgLW8gLW5hbWUgJyouc28qJyBcKSBcCisJLW5vdCBcKCAk
KGNhbGwgZmluZGZpbGVjbGF1c2VzLGxpYnB0aHJlYWQqLnNvKiBsZC0qLnNvKiAqLmtvKSBcKSBc
CisJLW5vdCAtd3JpdGFibGUgXAorCS1leGVjICQoVE9QRElSKS9zdXBwb3J0L3NjcmlwdHMvbm9u
LXdyaXRhYmxlLWZpbGUtY21kLXdyYXBwZXIge30gXDsKKwogIyBTcGVjaWFsIHN0cmlwcGluZyAo
b25seSBkZWJ1Z2dpbmcgc3ltYm9scykgZm9yIGxpYnB0aHJlYWQgYW5kIGxkLSouc28uCiBTVFJJ
UF9GSU5EX1NQRUNJQUxfTElCU19DTUQgPSBcCisJV1JBUFBFRF9DTUQ9IiQoU1RSSVBDTUQpICQo
U1RSSVBfU1RSSVBfREVCVUcpIiBcCiAJJChTVFJJUF9GSU5EX0NPTU1PTl9DTUQpIFwKIAlcKCAt
bmFtZSAnbGQtKi5zbyonIC1vIC1uYW1lICdsaWJwdGhyZWFkKi5zbyonIFwpIFwKLQktcHJpbnQw
CisJLWV4ZWMgJChUT1BESVIpL3N1cHBvcnQvc2NyaXB0cy9ub24td3JpdGFibGUtZmlsZS1jbWQt
d3JhcHBlciB7fSBcOwogCiAjIEdlbmVyYXRlIGxvY2FsZSBkYXRhLgogaWZlcSAoJChCUjJfVE9P
TENIQUlOX1VTRVNfR0xJQkMpLHkpCkBAIC03NTYsOCArNzY3LDkgQEAgZW5kaWYKIGlmbmVxICgk
KEJSMl9FTkFCTEVfREVCVUcpOiQoQlIyX1NUUklQX3N0cmlwKSx5OikKIAlybSAtcmYgJChUQVJH
RVRfRElSKS9saWIvZGVidWcgJChUQVJHRVRfRElSKS91c3IvbGliL2RlYnVnCiBlbmRpZgotCSQo
U1RSSVBfRklORF9DTUQpIHwgeGFyZ3MgLTAgJChTVFJJUENNRCkgMj4vZGV2L251bGwgfHwgdHJ1
ZQotCSQoU1RSSVBfRklORF9TUEVDSUFMX0xJQlNfQ01EKSB8IHhhcmdzIC0wIC1yICQoU1RSSVBD
TUQpICQoU1RSSVBfU1RSSVBfREVCVUcpIDI+L2Rldi9udWxsIHx8IHRydWUKKwkkKFNUUklQX0ZJ
TkRfV1JJVEFCTEVfQ01EKSB8IHhhcmdzIC0wICQoU1RSSVBDTUQpIDI+L2Rldi9udWxsIHx8IHRy
dWUKKwkkKFNUUklQX0ZJTkRfTk9UX1dSSVRBQkxFX0NNRCkgMj4vZGV2L251bGwgfHwgdHJ1ZQor
CSQoU1RSSVBfRklORF9TUEVDSUFMX0xJQlNfQ01EKSAyPi9kZXYvbnVsbCB8fCB0cnVlCiAKIAl0
ZXN0IC1mICQoVEFSR0VUX0RJUikvZXRjL2xkLnNvLmNvbmYgJiYgXAogCQl7IGVjaG8gIkVSUk9S
OiB3ZSBzaG91bGRuJ3QgaGF2ZSBhIC9ldGMvbGQuc28uY29uZiBmaWxlIjsgZXhpdCAxOyB9IHx8
IHRydWUKZGlmZiAtLWdpdCBhL3N1cHBvcnQvc2NyaXB0cy9ub24td3JpdGFibGUtZmlsZS1jbWQt
d3JhcHBlciBiL3N1cHBvcnQvc2NyaXB0cy9ub24td3JpdGFibGUtZmlsZS1jbWQtd3JhcHBlcgpu
ZXcgZmlsZSBtb2RlIDEwMDc1NQppbmRleCAwMDAwMDAwMDAwLi5lZmJiZWI2ZTdjCi0tLSAvZGV2
L251bGwKKysrIGIvc3VwcG9ydC9zY3JpcHRzL25vbi13cml0YWJsZS1maWxlLWNtZC13cmFwcGVy
CkBAIC0wLDAgKzEsMzcgQEAKKyMhL3Vzci9iaW4vZW52IGJhc2gKKwordXNhZ2UoKSB7CisgIGNh
dCA8PEVPRiA+JjIKK1VzYWdlOiAgJHswfSBGSUxFCisKK0Rlc2NyaXB0aW9uOgorCisgICAgVGhp
cyBzY3JpcHQgcnVucyBXUkFQUEVEX0NNRCB3aXRoIHRoZSBmaWxlIGdpdmVuIGluIGFyZ3VtZW50
LCBhZGRpbmcgdGhlIHdyaXRlIHBlcm1pc3Npb24gdGVtcG9yYXJpbHkgZHVyaW5nIHRoaXMgYWN0
aW9uLgorCitBcmd1bWVudHM6CisKKyAgICBGSUxFICAgICAgICAgZmlsZSBwYXRoIHRvIGdpdmUg
dG8gdGhlIGNvbW1hbmQKKworRW52aXJvbm1lbnQ6CisKKyAgICBXUkFQUEVEX0NNRCAgY29yZSBj
b21tYW5kIHRvIHJ1biBpbiBiZXR3ZWVuIHRoZSBjaG1vZHMKKworUmV0dXJuczogICAgICAgICAw
CisKK0VPRgorfQorCitoZWxwZXIoKSB7CisgICAgbG9jYWwgZmlsZT0iJHsxfSIKKworICAgICMg
bWFrZSBmaWxlcyB3cml0YWJsZSBpZiBuZWNlc3NhcnkKKyAgICBjaGFuZ2VkPSIkKGNobW9kIC1j
IHUrdyAiJHtmaWxlfSIpIgorCisgICAgIyBhY3Rpb24gb24gdGhlIGZpbGUKKyAgICAke1dSQVBQ
RURfQ01EfSAiJHtmaWxlfSIKKworICAgICMgcmVzdG9yZSB0aGUgb3JpZ2luYWwgcGVybWlzc2lv
bgorICAgIHRlc3QgIiR7Y2hhbmdlZH0iICE9ICIiICYmIGNobW9kIHUtdyAiJHtmaWxlfSIKK30K
K2hlbHBlciAiJHtAfSIKK2V4aXQgMAotLSAKMi4zOS41CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpDZSBjb3Vy
cmllbCBldCBsZXMgZG9jdW1lbnRzIHF1aSBsdWkgc29udCBqb2ludHMgc29udCwgc2F1ZiBtZW50
aW9uIGNvbnRyYWlyZSwgcHLDqXN1bcOpcyBkZSBuYXR1cmUgY29uZmlkZW50aWVsbGUgZXQgZGVz
dGluw6llcyDDoCBsJ3VzYWdlIGV4Y2x1c2lmIGR1IG91IGRlcyBkZXN0aW5hdGFpcmUocykgbWVu
dGlvbm7DqShzKS4gU2kgdm91cyBuJ8OqdGVzIHBhcyBsZSBvdSBsZXMgZGVzdGluYXRhaXJlKHMp
LCB2b3VzIMOqdGVzIGluZm9ybcOpKGUpIHF1ZSB0b3V0ZSBkaXZ1bGdhdGlvbiwgcmVwcm9kdWN0
aW9uLCBkaXN0cmlidXRpb24sIHRvdXRlIGF1dHJlIGRpZmZ1c2lvbiBvdSB1dGlsaXNhdGlvbiBk
ZSBjZXR0ZSBjb21tdW5pY2F0aW9uIG91IGRlIHRvdXQgb3UgcGFydGllIGRlIGNlcyBpbmZvcm1h
dGlvbnMgZXN0IHN0cmljdGVtZW50IGludGVyZGl0ZSwgc2F1ZiBhY2NvcmQgcHLDqWFsYWJsZSBk
ZSBs4oCZZXhww6lkaXRldXIuIFNpIGNlIG1lc3NhZ2Ugdm91cyBhIMOpdMOpIHRyYW5zbWlzIHBh
ciBlcnJldXIsIG1lcmNpIGTigJlpbW3DqWRpYXRlbWVudCBlbiBpbmZvcm1lciBsJ2V4cMOpZGl0
ZXVyIGV0IHN1cHByaW1lciBkZSB2b3RyZSBzeXN0w6htZSBpbmZvcm1hdGlxdWUgY2UgY291cnJp
ZWwgYWluc2kgcXVlIHRvdXMgbGVzIGRvY3VtZW50cyBxdWkgeSBzb250IGF0dGFjaMOpcy4gRW4g
dm91cyByZW1lcmNpYW50IGRlIHZvdHJlIGNvb3DDqXJhdGlvbi4KClRoaXMgZW1haWwgYW5kIGFu
eSBhdHRhY2hlZCBkb2N1bWVudHMgYXJlLCB1bmxlc3Mgb3RoZXJ3aXNlIHN0YXRlZCwgcHJlc3Vt
ZWQgdG8gYmUgY29uZmlkZW50aWFsIGFuZCBpbnRlbmRlZCBmb3IgdGhlIGV4Y2x1c2l2ZSB1c2Ug
b2YgdGhlIHJlY2lwaWVudChzKSBtZW50aW9uZWQuIElmIHlvdSBhcmUgbm90IHRoZSByZWNpcGll
bnQocyksIHlvdSBhcmUgaW5mb3JtZWQgdGhhdCBhbnkgZGlzY2xvc3VyZSwgcmVwcm9kdWN0aW9u
LCBkaXN0cmlidXRpb24sIGFueSBvdGhlciBkaXNzZW1pbmF0aW9uIG9yIHVzZSBvZiB0aGlzIGNv
bW11bmljYXRpb24gb3IgYWxsIG9yIHBhcnQgb2YgdGhpcyBpbmZvcm1hdGlvbiBpcyBzdHJpY3Rs
eSBwcm9oaWJpdGVkLCB1bmxlc3MgYWdyZWVkIGJlZm9yZWhhbmQgYnkgdGhlIHNlbmRlci4gSWYg
eW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBpbW1lZGlhdGVs
eSBhZHZpc2UgdGhlIHNlbmRlciBhbmQgZGVsZXRlIHRoaXMgZS1tYWlsIGFuZCBhbGwgdGhlIGF0
dGFjaGVkIGRvY3VtZW50cyBmcm9tIHlvdXIgY29tcHV0ZXIgc3lzdGVtLiBUaGFua2luZyB5b3Ug
Zm9yIHlvdXIgY29vcGVyYXRpb24uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
