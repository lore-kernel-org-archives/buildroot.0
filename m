Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735EACCD199
	for <buildroot@archiver.kernel.org>; Mon, 20 Oct 2025 15:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 209C041A51;
	Mon, 20 Oct 2025 15:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eo3n8XjgKo_A; Mon, 20 Oct 2025 15:18:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4019241B5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4019241B5E;
	Mon, 20 Oct 2025 15:18:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 22CAE177
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 15:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1477784418
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 15:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-rfnXzg46n2 for <buildroot@buildroot.org>;
 Mon, 20 Oct 2025 15:18:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::1;
 helo=ph8pr06cu001.outbound.protection.outlook.com;
 envelope-from=colin.foster@in-advantage.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1AE9584413
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AE9584413
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1AE9584413
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 15:18:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2Tb2X5sMUHEYJ1zHi8zgZUUudBugPR9G3NM6AUGtIercbgl3M3I0XTZ6w3T1PySj2FeeWi71/SeqAESEQPjOP3xW/MVLwc6Z/pROUMyOgn2RpWH8fxfnYqoaKF0xH0gqQgxRIvTsGBIADqV3i/WSzvjrX/Gy+19VqaCNyz1RAvqSMHsMdu+iSPxkN/U9+V8f18ez+vwlXW4AD+QM9tIj+bzC6mtVtL/SUsL9TKAOlUk4/+G4zGVfLtgTGd2f+nNp1cZWY5IMGaKXqryAqo1sCN8/Z4SC+yGMVJpOnTVkfz/wxNVLAw2DNcUFlWZwOb1Lns6Y36Wth8GhhALLX3zGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmuzFwS09LtNBULEhz+/EoqYqThzLlltZxiGSWLczUc=;
 b=fSRWAL4IAXD/dAbUFqCwDvxbEg6FCHON0lV8DipBkcaoazKedemE2K7i8EAxNb8zOX5cXg1Cs9dblI1e8P/XC3huS3Yo2M21ZZk8xsevw5cwE3U5kLwo43Wtj7jWCoD3y0S6Dr34ZCt8LZfXRRa4nASo+GXJtALu/ECe1It4y/e5tg/5btafa7GD/VpIZjknL0k91sDf+mPMbDtKunzUsvkao7s3W8vrz+Vh0MNp7PIt7nIiwxHmDElMHI6uHmnRMzuUoctdw8Pw5z4AqElYhbGzfUzFdV46GCmREvSK7cvQQJqqCmNmuAoLh0duma7M/hBt/lwK3EKjzhwmZz0eGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from DS4PPF3984739DB.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d15) by MN6PR10MB8141.namprd10.prod.outlook.com
 (2603:10b6:208:4f9::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 15:18:36 +0000
Received: from DS4PPF3984739DB.namprd10.prod.outlook.com
 ([fe80::ba61:8a1f:3eb5:a710]) by DS4PPF3984739DB.namprd10.prod.outlook.com
 ([fe80::ba61:8a1f:3eb5:a710%5]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 15:18:36 +0000
Date: Mon, 20 Oct 2025 10:18:32 -0500
From: Colin Foster <colin.foster@in-advantage.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <aPZSyAGH2sGhoRwA@colin-ia-desktop>
References: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
 <20251018194314.114284-6-thomas.petazzoni@bootlin.com>
Content-Disposition: inline
In-Reply-To: <20251018194314.114284-6-thomas.petazzoni@bootlin.com>
X-ClientProxiedBy: BN9PR03CA0667.namprd03.prod.outlook.com
 (2603:10b6:408:10e::12) To DS4PPF3984739DB.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF3984739DB:EE_|MN6PR10MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: 79986481-3cb5-42b3-ea29-08de0febf05a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5Hralr21yxRjGw0crMih7YL9azZJIkdYOFncLiMBM2ErdX3pjnSxl4Bj1n6x?=
 =?us-ascii?Q?KBguRRFZaR5kuUiapmNb5t0PHZ+QGqYaMbgz3p0FeT1Xe4a6fnStQNpRjxPr?=
 =?us-ascii?Q?khA9djp7bTAQGhDZ0Yjzr3lEtsjAxhu/YoknAwl5wCQ3I4D1WkP5v9O9oRxU?=
 =?us-ascii?Q?PY/7XMR/zQc+NVENFwDjYkqJ9Wmcy8m+R2Fw/xKNBXqYZApC8CTP2am1UJiV?=
 =?us-ascii?Q?IHiKGgHJkRsX3JP/A3Q75iVIAplcKmvzCHCHJTq86zWtQSIkIU6PMh8mYKzF?=
 =?us-ascii?Q?infT0h7YomuR84u81eSX6TdkqifI3bORxfASE7ni6miHki+9VImMF9fqisG3?=
 =?us-ascii?Q?HUbEkgGjR5BIqZPDqwmYVqZUZtn+2YiRw5/lADlXuQagv6my8mVSXiGJsnVZ?=
 =?us-ascii?Q?QcNw0/vGMA+yE3nh9OCKDjTTyeznbBRKRPzQ3wbR5E4eV4nGAaa5jpH7EgUe?=
 =?us-ascii?Q?1KOpUxP0cLXt3r0pFKvsAXfb5e2rySkFdI+vuC4Zr/I6NbcxA1Ejd2pyP9kZ?=
 =?us-ascii?Q?v+3bBsfZmkfFdE3ldYN/UEQsw1U2N2wabMiiOUo7yAFBSIuVo0IOjvN/Afrx?=
 =?us-ascii?Q?dK2UwjiXTcx+uzKYPelaKU6YBv322U3B0HWLGWwQR2IlIDKHyyKJyVU2cjCG?=
 =?us-ascii?Q?I1mo9Ah1dBysf148C7k+6QMKoSJa/pjLaRbsdkg+ByDQpx2MswTuVVcjwbqU?=
 =?us-ascii?Q?An4M018C2uSoE93ZAmAj9477hsDCHZM+VHLsMx63DK4cC6qVjUEmSXTDmfvj?=
 =?us-ascii?Q?MTRHknbPBoLw7UzOxMgRlHTnbjDg3WMK3cNy3VtImVOZPTpy+T+CPJVDiHYp?=
 =?us-ascii?Q?gW0UpSkh/E8spczH/AZbxCtiW1Nc5w043beoflryj5O8DyC4X0JJeJZtXdk3?=
 =?us-ascii?Q?GC1kvbSDUdhmWNvNbBT33nMHoyUw7Dm4p3EO/uaQxuWJXZKq3VQAsTIbMWwv?=
 =?us-ascii?Q?F36UMLnp5TzAk1ck9HUr/yG9fGtEbiahE2dTLNthexij4jW7J3SvGqtGBPvF?=
 =?us-ascii?Q?qhHrr3bWqVVhjZUb2SeUclj7XoQ/RkcpuD4geKsducU91yNFfF1qtbgTGlWs?=
 =?us-ascii?Q?uWB0GG58/14xdAdLCi5wSqPMacNjHWGxa0ARmAI+WzViTeGLsXV6FJJEA8GA?=
 =?us-ascii?Q?WOmGF+xJFt6mXZF++K5sSX2kcZT3iZJ93eYM2BXk8WViUPsKjrICr1pp4Hzu?=
 =?us-ascii?Q?g0CdxtTm0sysIWRpnfLmKqEI5V3RnlwXELWjTd68is3h4+E+n7J/M2L/Vh1o?=
 =?us-ascii?Q?VA1HedozBFtux0JtO3CJ0NHKpNEelvf6S2cC24FNTUk079ULh29bsiZbrAGr?=
 =?us-ascii?Q?bbbCf0QLlomZG8Yyn0KTcIC1PvAvYZPe1bL1J6jSkC/lfY0UzkrF7yuYVUJX?=
 =?us-ascii?Q?VlOerwwUI+6jxtuFMu8e4+HOP0api5Sl9UTlY+spj4wtm8s8E+qN+8KiD0Z6?=
 =?us-ascii?Q?lTCh/e/FVlGak/fWjqnE4JSDpn26N2N4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF3984739DB.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CdiEMOCb08OZM8TYUWlkO/xoSM8Ujzcbz/Dh8Yw6TvP5ex4TskPGURDuEKkR?=
 =?us-ascii?Q?zgbi7aZEPYlqFUQHt7iLg3fAsCzXBhGWOn5R4bCFxSaTBGE6efev5LMDZEUG?=
 =?us-ascii?Q?8YQcve0xkleZ2cyfU4JWlpqemEgTMx6FyUexuxnBAHkharsvQKzph+XxUFTt?=
 =?us-ascii?Q?QsNJ/Ms0HMfLfOkXhtvm39zZni6GrpDSwgameRYH63HxttWISi9MW0VJi1rs?=
 =?us-ascii?Q?lqj4EGYau4GqEaoxUryevJJR2tz2oKRg3Uwoc7voTkYJZnzzIjuTSWjqINAh?=
 =?us-ascii?Q?YO7I30jwgDUt/dzgzlm78hWirV28BgudR/DpFbiGICWaiM9tA/SEjhnm24lr?=
 =?us-ascii?Q?Kh+GlNy5yklCN1v24/YQOnWJ7wlr5jSBab9X0XeinER88RHN5GDlt9qbWxri?=
 =?us-ascii?Q?gKOnOqbNpm9LpXGr5g0DDqdeb04CLhytne054tUTx4/N/sPYrkEmPpl5W/6N?=
 =?us-ascii?Q?vH45k1ItESt8rl3qfejfqbpY1GZCZdZzp1viVZxSm6cz3ZlVia3ZwNEdBtoo?=
 =?us-ascii?Q?3RiFz2Upcv6d1mDrviwplEMX12VM6su2jiyVf8ck28rIbfYUxRYw4RSouDNb?=
 =?us-ascii?Q?RcLM2J480Zu+OMXLKERcD6U/1CkJXaKIRNdFOSFcYWjzx3k3vOYFKnmedmMA?=
 =?us-ascii?Q?WclsSfJa+IYoU7F0oAj7fXO2yGwDNFmOBoQsjAD8k0SuNKAuSoCwttC1puxw?=
 =?us-ascii?Q?npNC5hPW+iXQtPWxtbMuImBuyI7ljFksG9S50B6yI1z+bgsDC6tFdHKAXNBH?=
 =?us-ascii?Q?BKZetutn0Xl+dbDJEeh1hmw4w0GOiOU4ODK+f15AwwmQ8WWUlRzTc/KTDuOs?=
 =?us-ascii?Q?wH2bb2vjryH4QutpZociaiRhURib/Huvl2iBC329+YzHJ9k/SluAvPu27yMT?=
 =?us-ascii?Q?D9nz4UjwiVe9PVVRTEkuuK9Z18T0d7GrdGJJnm3tGApRwZpoiSncqrMOEs7t?=
 =?us-ascii?Q?BhvOXevIdyiIN78PR7ELaUX0NsWqG+xSR+WmUzavqpVFn5aSYEy7Mfh2XEEs?=
 =?us-ascii?Q?QiW+mrGLgExU8h3Lk+3grMw4u7hKTT6unuYPQZvcDmRpULVawrq8ZMrx+4d8?=
 =?us-ascii?Q?R8V5ryAYGB444vddtZBgfvIuXvSQ7UB3CqYhLMfowc+qEY7vm/f6yZGTvvJ6?=
 =?us-ascii?Q?aSGJUMLW++FF8i0+KGOSpCS6RVQbRAwHFJuybzmSivwOAWmO2639lqnhYHoV?=
 =?us-ascii?Q?v+Abkgt2X+QDSG5mDZvh1Wpgsdx8yUwGZzh+k2+jI/P2hHDRYhX5EZ47JNf8?=
 =?us-ascii?Q?oL9OKZrUA15iEdgNUPVyS6VzJDNG8+oBUWdrEbtCbGxGTUD0nAqujlSo/D8v?=
 =?us-ascii?Q?cjDbvbnzbsL6eT901RB8qCKzQYw9C1XRfrOl+l5i3roWxuvIpZBZ/tT1OQdP?=
 =?us-ascii?Q?LrI/8ZVGDlr/pNWOUZXJKGwVz3BM8CBHHLmgDWi3znTRK2D4tCrxZwqRVwu1?=
 =?us-ascii?Q?ujQGVzzrfcSKyIJ9YU59RVcecbigc1TstQy+2BdtW3xhBb3OIYgbvXp2iVCw?=
 =?us-ascii?Q?BcGAsuZqP/GtJjtJVW9OeM4Cx2IfWCj1v6Wl4qGNRDa5JG4OMkQkrWOrRnUu?=
 =?us-ascii?Q?mril4SaSkuZibc/IUNLwEseI9lyB0dwL7VW8f5MYdE3V6zr56fXJb1AGmmO+?=
 =?us-ascii?Q?I+VN61+R2NEu2RMmExXR4YI=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79986481-3cb5-42b3-ea29-08de0febf05a
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF3984739DB.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:18:35.9548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3uQG5s/XY5W2rWexl/ihbaO0/ZARYd6JZVhYHbFsyhWjz3NdQDWQ/mlnSDh1XrZKzHrufV1dJJ/Zje60HsHzSyTmRaZ/39H95c6UZqycNB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8141
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NmuzFwS09LtNBULEhz+/EoqYqThzLlltZxiGSWLczUc=;
 b=KP4PS84dh4eqHbijTUcb2JfgYqKnhaJzYOLbNVddHNQrM71d/zh7DWo9nqvtS6DtV+N46vw2+xxDHEL5EceYUrjyFQaMZI3yqPO215/sC0c11LvUzYtVpsByWEUtvT46bohuwF6fhW9ke1o/hBfVYGJPmzQvHwSs3vi0zxIdJP4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=in-advantage.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=KP4PS84d
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: Re: [Buildroot] [PATCH 05/11] package/python-tftpy: add host variant
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
Cc: James Hilliard <james.hilliard1@gmail.com>, romain.gantois@bootlin.com,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Oct 18, 2025 at 09:43:03PM +0200, Thomas Petazzoni wrote:
> A host variant of python-tftpy will be needed for Snagboot, so enable
> it, and add a very simple test for the host package. We considered
> adding a test that actually starts a TFTP server with tftpy and then
> downloads from that server with the client-side of tftpy, but
> allocating an available UDP port reliably is tricky, so we kept the
> test case very simple for now.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Looks good to me. For what its worth:

Reviewed-by: Colin Foster <colin.foster@in-advantage.com>

The tftpy package is a little out of date. There were some issues with
packaging / setuptools. I don't think it should make a difference to
Buildroot, but I've been letting the dust settle either way. I can send
a patch to the latest (0.8.6) if that's desired.

Colin

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
