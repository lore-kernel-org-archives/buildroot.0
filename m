Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA83CAC598
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 19:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FEA184607;
	Wed, 17 Sep 2025 19:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lzo9TGF2nNTI; Wed, 17 Sep 2025 19:15:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 197E5844EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 197E5844EA;
	Wed, 17 Sep 2025 19:15:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 99720AF1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 19:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FD9D4157F
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 19:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMkG7gwxHaLz for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 19:15:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::1;
 helo=sn4pr2101cu001.outbound.protection.outlook.com;
 envelope-from=colin.foster@in-advantage.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7FFC541582
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FFC541582
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FFC541582
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 19:15:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6i9S46KDL+q8iMzyXopcPNer0jhiscs893ckUpNMxuxD9AmLRx8wCDYHHBg4KJ34d/12esWQBAgZe8qea6EfEUG+m6mKfB6eWNoVN3gj98RZM3OX9TE8rNXldX4qiZ5gvl55ZF2pxDMYTnjIdukbMd3ZXJ8PlWd46jlTqAUVthHa/W7Hos5kIZa0qi3luTe32Id0/XuKJ3dOm0EC+SQuvOsgNaRexdyXdjaIzyJJyRpauqa8lrm+SwHYkmE0lJKvGBr39LYMWp07R7jMGYQGT6MX3vBFHCuKlrYFiEOSQp47SLy7QOtomgxCocae+evlXh5E6vIDmSvZc+EU/9f8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f26ivl97GP3Bl+u46SNjBkCbiUO0VdEpgpiSKXxVf7U=;
 b=T7U6asZOS5qX5f03qU28mgv2iqqgFPD4rDOUSqiNXDVL5QCKeX74F2mf4sA8m6csJx0u7V0TnQILKCN55Shx6sTQPpb996UJsQqQCmBP3jSwsk9qQ0CBon/bUSHYoH6beuDzwg1KuS4Yms+Wwhf9Nwz8+kQ7edmE9l+XiySLARgPA2vfz1hztEpU4bRCO8mHqumwBYA5hmxB8ZVdgzsfBye7N5PB6USE5vTsOt3kPMXfOwaj8DZwOj84p4n2/ZpflZ/QShmHQ3Rf9DQwSfOouiMg6TPc8qECe99jXlh+sjZmPsT3TiA6sr/NRLIoU9V0MXU4e4OWLmisTVHj1psSdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from DS4PPF3984739DB.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d15) by IA4PR10MB8636.namprd10.prod.outlook.com
 (2603:10b6:208:568::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Wed, 17 Sep
 2025 19:15:37 +0000
Received: from DS4PPF3984739DB.namprd10.prod.outlook.com
 ([fe80::ba61:8a1f:3eb5:a710]) by DS4PPF3984739DB.namprd10.prod.outlook.com
 ([fe80::ba61:8a1f:3eb5:a710%5]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 19:15:37 +0000
Date: Wed, 17 Sep 2025 14:15:33 -0500
From: Colin Foster <colin.foster@in-advantage.com>
To: Michael Nosthoff <buildroot@heine.tech>
Cc: Christian Hitz <christian@klarinett.li>, buildroot@buildroot.org,
 Christian Hitz <christian.hitz@bbv.ch>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>
Message-ID: <aMsI1eESmB4DUHUz@colin-ia-desktop>
References: <20250818064235.258181-1-christian@klarinett.li>
 <aMlx-vByLFUkXXSh@colin-ia-desktop>
 <fbed1398-da08-c505-70fd-5387ba6a24fc@heine.tech>
Content-Disposition: inline
In-Reply-To: <fbed1398-da08-c505-70fd-5387ba6a24fc@heine.tech>
X-ClientProxiedBy: BLAPR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:208:335::9) To DS4PPF3984739DB.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF3984739DB:EE_|IA4PR10MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: 724f1efa-8942-4da8-b483-08ddf61e953c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ce/35uaUKiFxJ5PCeUJK/c09HPxwO78XixH8wCvAIulc1m1V1QjPRZYpIEod?=
 =?us-ascii?Q?OMWI88D1PB1GQvj3aXNvLKNYH0/ux9KDpboksdMfaeQAXGPo4kraPN36FU/z?=
 =?us-ascii?Q?OxdLblg5OqUJ5tauwn02X0oBZqd3jnnoOY4i8RUCyUOLNGDMvqYjIwGn162i?=
 =?us-ascii?Q?sOTQtc1LqhrfR6Ll8b6PP1qZSAeU4mwTS+qSfatUVkkVcJjkzAh9DUfJk/qH?=
 =?us-ascii?Q?99W3WVWz9o1ZHLqxUDceM1uNQZxJKxGu9Yk+qFqz57zUstl8DMKE4OdsVvo+?=
 =?us-ascii?Q?CHP5wHNZgqE8ve+9lDm6cjxVsHpkiRIG0Z1BoGVeqxdliV4a7b+UhU9p7mU4?=
 =?us-ascii?Q?F5hyuRtjf+iOjtIhwVukYVZYYlyZ8gprXKPhc9OWWEl3bFeNMY+gixlmEIVx?=
 =?us-ascii?Q?Vv5FcFydwtfXCA5Tct+bD1KoDMTkJNhtsowx8Fgn5cEeRm8GToPEE9CPGMHW?=
 =?us-ascii?Q?IdG28jX+3CrXV/I6A31wlMLGjfMsoxZrHqZu430H8+Pw6IDNno7gkBmBZFpH?=
 =?us-ascii?Q?jwri2F454xdQL1Zq1TRcY2YN8p67DVvqAfXJtPQqqxfE2GHoGa25zPRSQAle?=
 =?us-ascii?Q?gZ5CqRleUkuQV/zfDrCqgfytutYOC94YrGz8uZHoEflFERns6uAbIiyZhmPN?=
 =?us-ascii?Q?wFsw4wDL2xjQZyKLFj1wDsNOiEKgPSPVvac9N1K2wi3EdXP2/1V6CpmB52iA?=
 =?us-ascii?Q?tHuePA5siR9plLlm9L5pe0x0mNatU3NnI6uTo+YYHjIn3/3wr58x7eoTe8v6?=
 =?us-ascii?Q?MqiCKyqoZcqiSHUeyZrWOVEESTx9YAYd4SZwtlG9ozr5xOmP7L7d/hlw7NjC?=
 =?us-ascii?Q?gO3lNtO0K9Rfz4CxK7lwX1JuoNrU/F5D2cz+lPuJXQda+qMPtHvhQnA1MPap?=
 =?us-ascii?Q?/WePHyBjW0Ip0q6Ji/I8Gh9/LzxoMKAniqk+5lEad7udqlWeA1/6/dwMgIDl?=
 =?us-ascii?Q?mQpUvhge1bdmROn6Tsg7tUzC5bR42QdLMwM5Md2gVc/UXJfd5Dso6KQlEN8C?=
 =?us-ascii?Q?cPpC9SaGVmWgHJRiTZhK2bE2JOoxiPf9ng4UT+sxqgpwKXYWy0ZvE9dZ+lHn?=
 =?us-ascii?Q?V4AcUYXgmsAD4usIEVfBhaxEE7iQnBPwH6YwZ1fIratY4uRFw2lRW8h2Zo8Q?=
 =?us-ascii?Q?Xg9wIoeeSn6sKX0Gv2Y8gimRgR6c0xZpQp71XZ3VJKrsYkz1HCJqnZsJcaT1?=
 =?us-ascii?Q?N3ARiAXuUrr4s2dVDvfH0pyzEUkJ+BApUVJak3UIqjSXN/OgGlQVtbyq80+m?=
 =?us-ascii?Q?52WidVQhdbigYIVZ57XuG8yN05PjUOHrUghdNC/cxSJQntRGZf40CSP/mAUv?=
 =?us-ascii?Q?tpdGxnRVWWqPFseyF77+fpISJpnuX/w9ny4u0rWTbZ9zsBYqErUK89YbK7D7?=
 =?us-ascii?Q?rRNr2a4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF3984739DB.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0imeP9vO/Jv8VOt5tebp6NlmKmzY/jBycS5Av09m4zeAstD2yryStq4v94fc?=
 =?us-ascii?Q?ip01TB/j0NVefJ7uvO5puRtaNi230UBR+DfVUw9/g6M9CBU5Q1BiUSYFhNel?=
 =?us-ascii?Q?cx5ELWUmuWQ+F5hQf5MUbWDUhnYLvB0j/zTw2zJNUIxjMI3Tj6sz/ydMs0A5?=
 =?us-ascii?Q?SnzXRiaU3T9zsY0qMiml/AUtTCPPp8UrESzL2KQ+x+UC79PJNdXl6du2R7aH?=
 =?us-ascii?Q?ShWmipNB4c/b5lamKqpMSyLmQNWOUZwB9Zz6vQOLL3MtV94TBxs0LymnWV4V?=
 =?us-ascii?Q?gPjxRhZjNdkgHT+QPQ7B4i+icaRQcnZbYLGhIROjr9kjzkTR4ti8nLCIPkdC?=
 =?us-ascii?Q?NW77XYHF2g8iUDz6dnENoUFN1zEt4NACVE/551Je12uDCXLqgWwSyhwCbVlm?=
 =?us-ascii?Q?GhkK0/LzLKpjwMhP3iiqNKsjmwS7VrLLsv1/wRo+snRE3hgjW86csU00esFp?=
 =?us-ascii?Q?+mvPXj7jSHfxD28dDFBAp132JJeaoMH6RTWjBxhJL8OklsmK9GAiOjdqO1Ui?=
 =?us-ascii?Q?oh3pUxWV6PnJ1paJVbJ1DY4OY2+ScOvPi01V8O2rf1LEV+hRf5CEYArDW2jT?=
 =?us-ascii?Q?APttAcEHNUCBJ/Ge++AC25610qQ5+8993LrRxp1+Q6KT+r5nSYSAPbnurDtb?=
 =?us-ascii?Q?YiJuj4bjgngzYxe9h8dpS5Mpxk0ahHpzSya069fX5GyVrhV90KBV1xccF+cw?=
 =?us-ascii?Q?dVUlfZaJArY+ikkRBsZ1nIaltSaPjFl2Uw5GF1pG75TIxsnvFKoByJJOTSgf?=
 =?us-ascii?Q?7VH/ZELiAWZOtBYVaSY5DSGQuClobiV8DpNdvXtvOSydsTrdn5aNIk4zwKyO?=
 =?us-ascii?Q?sp8zcEOjT4j4pA3IwzIboUy18Xz2WOw3JkCFslUZrHwWShQidGzcNorQ2xTC?=
 =?us-ascii?Q?kdvYumuVNHGHv2TtKLBRYc67UvuPqfUP2HYC8y2gE2QXet8F1+RNFFwjhCM8?=
 =?us-ascii?Q?0f8H/vYRYCgFihsFBct2VgVeRZx/MTl5hCe8p5PYHJ4lGOB2EBhvlGKPkJvl?=
 =?us-ascii?Q?WX9rU51YncKsmqA4BN9dR912y5B0rp7DDumT22jpDY2Pns74sUN99pGUs0Re?=
 =?us-ascii?Q?bqjBsJlBOjCwn0JOANQQFsjsU36yYOMlYqrVJJGxwi2/A6bgVfhl8bII3IOk?=
 =?us-ascii?Q?iKQNvXXuR4ZSxKmzmZqO0xNZ6xtOWXZ6fsOiatZMd2j8dKPDFQlObpERdCZk?=
 =?us-ascii?Q?0isZOwLQlP4vFEf9RGLd4Tcd9dny3Err5YTRi6ySlA+q3Zi8ja1W4A3o97wk?=
 =?us-ascii?Q?ruklIerc5gDQE68LvcxbI24KfQwbM3eobsyR7CY25lxOt2aPD6chrIWUok1X?=
 =?us-ascii?Q?TSTt3Wk7/6RlgHDn7+HQ+tXiv1mCg9TpuBH2i3MaVkAvp1jHoIB+VjMIaEb0?=
 =?us-ascii?Q?1lLTw3rqQswwlVG5syowBgb9fUk0CFCj085iF+C5+CXGW893ndDDkNMdEjuk?=
 =?us-ascii?Q?1MEX35N8osnh9zk1ozLQ3qukHrUqJjQ8ozROrGKOafvY038j4P+0Tga9I+86?=
 =?us-ascii?Q?RLsQXiC30ERsQoAG86hYikveU9QWnzb833QPOUpsLTw5jNOYjJ/ntcM8Fe0/?=
 =?us-ascii?Q?rlRp0gPXo6wPY3c5o3CeA68J347jM5vHpa9PIYK+w1aU4wFlwp36IHMNBYLZ?=
 =?us-ascii?Q?G9Aqe+9s1GfnbVQ3oGPuCOc=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 724f1efa-8942-4da8-b483-08ddf61e953c
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF3984739DB.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 19:15:37.2062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIuo9E2W1oaPjvJJtn64y/GCbLDHpTNTyADvH3k0oSsperTOYyqM5wG7Qvm2Hm+I1CyDjROlJ1yFX9fCN+YSJZ92kPAsrk9tC4dBIl6zQts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8636
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f26ivl97GP3Bl+u46SNjBkCbiUO0VdEpgpiSKXxVf7U=;
 b=fpkMc8YtEIhIP1lPsbNPgOmBwyx6TbFNc59I0xDkTitkGeRN8NfWZF72ILqQtm/2D8DV4a2XzZZJ7fL8cRpyGyRT8DAg/hCEchJECytYaVqxLrpMCF2G0qf7I57OmvGM8ZP0p2r6xCVjA2rcZRUWRr2VOOqReae77DltcZWxIvM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=in-advantage.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=fpkMc8Yt
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: Re: [Buildroot] [PATCH 2020.02.x] package/systemd: bump required
 toolchain headers for systemd-networkd
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

Hi Michael,

On Tue, Sep 16, 2025 at 04:51:17PM +0200, Michael Nosthoff via buildroot wrote:
> Hi Collin, all,
> 
> On Tuesday, September 16, 2025 16:19 CEST, Colin Foster <colin.foster@in-advantage.com> wrote:
> 
> I ran into the same issue when bumping our build to 2025.02.5. We are building
> for arm32 and use the default arm toolchain which contains Kernel Headers 4.20 (I verified this
> in the linux/version.h file).
> 
> The solution for our build was dropping the header from the systemd src. It doesn't
> seem to be required atm. See patch here:
> 
> Nevertheless I now see the warning introduced by the Patch from Christian in 2025.02.6.
> I guess I need to revert it in our build. Until we can move to a newer toolchain.
> I think we will move to the bootlin toolchain when bumping 2025.08 because it has
> the matching headers while the arm-toolchain even in the latest release (which is not
> bumped in buildroot yet) is still on 4.20.

I think the best course of action for me is to jump to bleeding edge
from Bootlin. It makes sense that updating the "stable" toolchain isn't
a desired thing to backport to 2025.02.x, and the stable toolchain
2025.08-1 is where the headers are bumped.

https://toolchains.bootlin.com/releases_armv7-eabihf.html

Otherwise, I wouldn't mind staying on the stable if the 2025.08-1
would be in the Buildroot 2025.02.7...


Colin

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
