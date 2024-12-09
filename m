Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27572E7717D
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 17:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9064380560;
	Mon,  9 Dec 2024 17:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dpL_H1CKaieP; Mon,  9 Dec 2024 17:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9339E812A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9339E812A0;
	Mon,  9 Dec 2024 17:44:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 214F56F
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 17:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F57380560
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 17:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CVh2XhTHCQFn for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 17:44:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:240a::728;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=colin.foster@in-advantage.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 447DC804DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 447DC804DF
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20728.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::728])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 447DC804DF
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 17:44:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pe4yHn5JpE8I3CrXt7pDjORXpdg02HrSZi8H6ypiVwAPKaKe4wbISCHqqcFm47yMEZivrymCbbIhqMktWn0Xp9+sNbmCTm/j/Cv9ADtsSr2U1AEw4GUXtE1pls1v+/4Ky9kn7Nxlmo15u7e/52fWiWRm9+7p86PZFvoTBUeLTkyeAIKAgT6lO4clfUSCObtR0bOmdkCb0Buy7nkzxFbVIkaSHZE+WhJj478qG9Im0P2aXi/c9a0Q9x35mIVrpCGaT4UgafueKBe0t8hFH1EfowokB0H8xGtNmis6vvYqj/1E/BHbnb9vGYSK+WU+1x95qDM0W4BoHIErcFWdPq6vIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/zX7r4a8deys5fohxBgmxmufdnknawUYYAivJwXpUM=;
 b=sj1sReoLCw/sRc1Nrx+7zTZknMIRZsOcPMVzvz8EpJUpJL9ILXBdmpEBQOeO+Ji+XAYAXvAHDy/MHEr2LFO0CDvbe6L3kBCEpqaa+4SGGBh6aU5fWzVGbTK5XI0F+Cz0KuQK3kQWJ2hJCF8Fydx5Wt93OGxFUtEQ+1iSqvLz17R2TW+0XbkH/TuF/Xk//PAcXku69PmMJmfzDmYsXfhKxMhVm/UlRS725wnwUa9QWVCPS7hC5gcWMkP4HLZgjnTWTMf8kHVRcH6BkACGGoSJZI0UFy+ILvrEpNVIzAsnGgvi6onqJ7fRMBQ2jZNqPHq8PpE7bvuqlN8Fn/rplMTTMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12)
 by LV3PR10MB7937.namprd10.prod.outlook.com (2603:10b6:408:21c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Mon, 9 Dec
 2024 17:44:23 +0000
Received: from DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::7603:d234:e4ab:3fea]) by DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::7603:d234:e4ab:3fea%5]) with mapi id 15.20.8207.017; Mon, 9 Dec 2024
 17:44:23 +0000
Date: Mon, 9 Dec 2024 11:44:19 -0600
From: Colin Foster <colin.foster@in-advantage.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Titouan Christophe <titouanchristophe@gmail.com>
Message-ID: <Z1csc2aGtuzcsuwm@colin-ia-desktop>
References: <20241206074342.1532295-1-peter@korsgaard.com>
 <87zfl73joh.fsf@dell.be.48ers.dk> <87o71m1b7t.fsf@dell.be.48ers.dk>
 <87v7vtyzur.fsf@dell.be.48ers.dk>
Content-Disposition: inline
In-Reply-To: <87v7vtyzur.fsf@dell.be.48ers.dk>
X-ClientProxiedBy: MN2PR01CA0028.prod.exchangelabs.com (2603:10b6:208:10c::41)
 To DS0PR10MB6974.namprd10.prod.outlook.com
 (2603:10b6:8:148::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6974:EE_|LV3PR10MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f913a6-8f74-45e9-adde-08dd18791dde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bvnt+IDJweWqFafFVg18P3VT4fdejnsaKZpSkKxQU5m63Su5zjRNr2Km/c+i?=
 =?us-ascii?Q?iFjM9eO1waJw3VqhzYOU4ZVC5ACvuggSbwnJr5mJwINeiVO89njQnsPqtDeH?=
 =?us-ascii?Q?bp+XbHqzrw+fLMotruhXVmteoJU6T8aPVJHO9tLNuu81X6qhHyyuGOLz0nY/?=
 =?us-ascii?Q?mtBXdf6YnfZ4g7ndQzKLt43L5ERp/Xbk1nckSMHFtpreWaRFjR9HMRC7Cb13?=
 =?us-ascii?Q?vt/ORb9w+wdfQEbJvivFn4yaFV2II07idJpQa9EuPETC2XBzAufbyPatf9FD?=
 =?us-ascii?Q?NCRj9bgnQKxW/eN0c5yLwK3YE/31zrRwFOp7ankDOWz9s5lRUYvIPWalthYI?=
 =?us-ascii?Q?EN0bszFxMcTAxelARmOvqBine+1QvwWstNsVcdgTwm1loNqtBvurvfqxDP2N?=
 =?us-ascii?Q?bduLpw4s8u/FtcaQ83rHUUbJx2GOKB04uI/DCcKiPcFjWwwIv5CfHP1EGS67?=
 =?us-ascii?Q?vEQQj1fVt5kuFMVAVtHngS2/r3lvGphLP22p1zpccC4P17Y+mCMTumDghozm?=
 =?us-ascii?Q?LxzaQmwlwbaqlJkXedBtSvRfq+exu41678er+ZCx+2d1+EYdzqOxri8aT8jH?=
 =?us-ascii?Q?6l6k8TRA9DmFCUETUaf/wmC2k4jd0vyRpA4bT1IozxRFr9OBTmWKOmZ3Hn06?=
 =?us-ascii?Q?78LfyaeNO5nn6aSz0/6TY07MLADSIHql2ZFHjqnnekeFQlO0aSxHWrwklXNN?=
 =?us-ascii?Q?HbjcL0vMg8CfkUop1B9JGOHrWx4++5bjTHw6+XrK1b20edjXsNwDaLd1STdh?=
 =?us-ascii?Q?NRAC9nMM+qrpmikAdzhijWqaA2myAS7eXvczwQ2pzLHIZL1b0JBZFI1sy1HS?=
 =?us-ascii?Q?XKNRK+vO+YeaivHUH1lI2ff5d3OGvXU9AA2bDpQEevipi2BqHIhoH+pZh+Hr?=
 =?us-ascii?Q?0+otlleQKNbLu3KjBxefm/2Pga9BPbc3hpp0jS2gxtqs+ZKcUYhC8mtl7lFT?=
 =?us-ascii?Q?Yh4Is+u/UecGhnhKaJCJDl3anZfCTH0cbHFnqIVD1Y3lGmdzJMPKjSQFyThC?=
 =?us-ascii?Q?+ZQaIUucLdxSdDku5QXfiob1gOuK2nCBZ0qA4lwcDuz4giRA0WCBalBiCNB9?=
 =?us-ascii?Q?LmDCwODJt+ztU6ZAAuaOXUrpviSD4OAXKNMwxsz0YLrsYjv5ug5q4rsLwRgf?=
 =?us-ascii?Q?QCI4yvEPqQa8cKgLveBidha97n50nsxcOZkcuK4FHuzYyIKM3GM8TFGVGuYy?=
 =?us-ascii?Q?duwOyvgMAdh9fM7jCT2pANbJ9bbFqsw59v1dc+EnMLZi7gojyfh9X7h24qyL?=
 =?us-ascii?Q?G1vbY6BYSuca9t9CeRZ/CxHEEbUp1J4T5MS1HM64yy9hVoFK7Hf2p05iaMPk?=
 =?us-ascii?Q?CouZH5WyX7jv3HFyaIyS9Z6Z4eOwYs9JdNxtJ694WSWKbw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR10MB6974.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PgBLFH+P0M/iB6NXoLx0vX0O05W+GuUAThRK2unSTrkdwUXBqY8zRex7ljO3?=
 =?us-ascii?Q?LhpgsbPSXIg6KjzyuJ3vpRd3hCZz2y13Ta1pB8hxqAwIfLK2CmJ0qqVjhyeG?=
 =?us-ascii?Q?OJ30J6iAtKpDn+zN2k8ws3yrDK88UFEOpcGadZ6RTgqvRA9vuVrPJNYuKCvy?=
 =?us-ascii?Q?u9TRi4nygGRaSl+txmiwdlh45iGdZjHjcg3TQq22ayxBKpg4Xg3EJQRMz86x?=
 =?us-ascii?Q?2xS7khkaPBcEYK/qTLG3dpQrCb9tmjTtPWf/MLmeXrFkJJ3PFFelxuOL2TZP?=
 =?us-ascii?Q?vjrZ0yzsMgdZf8JwbH7xtrUQ/SxVVEQ26jhrC/ZnBtHXz2fCtfRKvpVjd8yo?=
 =?us-ascii?Q?8nTQHuRlRNOjSyiLiBMkxly47Fv1o36PIYJBJFADYbLMspyzr+5VXyzO0f6B?=
 =?us-ascii?Q?ybIJ0K/2M49qJbCP2O77IZIHQT4CWMcE5JH/sk05MmZB2b5gQIULCJ2slcIA?=
 =?us-ascii?Q?Q1d1gZRmBuxt8BFJKTb7rIkXcGpcolF6ohlXnDTF5QEzHZFcNb49Zd33sV5+?=
 =?us-ascii?Q?DXmEsPFcvOFiOO2TBCxTu8moK78vVLk+pdFJRsT2IeLi6+WZknug4MLVfOhf?=
 =?us-ascii?Q?lIq1vrgwt+HqkTx+NQsxYhplsoRETUqkRyHAh4ljamZsRCmkTeeQ9VknfjE7?=
 =?us-ascii?Q?EBRrFLNRv0f16fu22GBpEsBDCRKJ24LSRsAYpV/HRutU/gfCOiIZQ8Cwrpv4?=
 =?us-ascii?Q?kUQr7xuvjBSqQ5aRDJms2GlxVzzfTiS1VEOuZrN+6Y8YTOZWsu2/UIUxpd8o?=
 =?us-ascii?Q?gHRflbCwKlFRwbGXbp5s88CXln2wCeKj0zpAjIa8y/LMpmV9FXbkqoVDIV3i?=
 =?us-ascii?Q?x8vPWuqhbyuzYIZCCMjQrcxBEv+Ga6EBT/xue7NFL31n3OAqD4DbhK8dZQ9M?=
 =?us-ascii?Q?3oQcjpwYx61TSTRMcxeIRZ5lAwWQWwcOznlbNo8qGfM4DaSf0Qqu7VwO5i76?=
 =?us-ascii?Q?BRvDfhziqINjpeBZwtxkuFLOSm7pbkep+yopCMb5hJS6yBCKl7Z6sSQhJ6Js?=
 =?us-ascii?Q?b1rwhAymStjeO+l/aIdoP6NYz+fARHEOA+muVtTsBbNdkA7bbUhsuz76kl2K?=
 =?us-ascii?Q?6agtPFg8O072nvrGLjSQclo6HS7qTrfgMVhp7+iwDZ8N9AzzEc04w1VFuMT5?=
 =?us-ascii?Q?2/PwGBRtBLL6WqG6RRegla0+6QCWjmGxZjkxqmY7eKnNVYIsqRUC/8nujA7Z?=
 =?us-ascii?Q?92j/u2dWk8aFwkabULRva+eqpJuZz+WFCysyzoLJQbdr1vhrtgKCmvpGa7/M?=
 =?us-ascii?Q?P/Io+fg3jVBLIifuyKTe+r6/IS6oiS6mhX00bsOGaepGbISrPqfyc+d4s7RM?=
 =?us-ascii?Q?kf4BWmnMEDVWN/Fb9JgE5qo8QyKfx4leFKnaiU4FHGML5cChSNxW7iARPFKW?=
 =?us-ascii?Q?z5SVchT37hYEIK9M+as+vYCS9mGUHMctaRHaEiorQseZPoVvSTK6PZzP2a8M?=
 =?us-ascii?Q?S6FsKsrDa4Re9KX/AroQN6XRtz7RaIJ/YevT/ZngqbnSIawpWychJYs5DlN0?=
 =?us-ascii?Q?KQj4JvYq9+CSnCMpvXfn7DHo/yTLk5sAYzrxakeOEw1ExDqON7ix8+jFpDcU?=
 =?us-ascii?Q?4T6U5L30o3Z5WWeRx5f4X4XbO5LaOoIpVBD2OTEfynWanyQo/mjN9py/WVBT?=
 =?us-ascii?Q?6luiaVxHHQlJAP7Y2ZnoW0g=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f913a6-8f74-45e9-adde-08dd18791dde
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6974.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 17:44:22.9122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmwaXbvICsoe1NAeiIR4f157f27N/e2ICTiRJ0vrYRGlWU6/Tn1oceGCUf3pj2L9Xyk++ejnTqp5Wzgg1WYfaJHcQguzBw+cY5sKiQ3a2bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7937
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/zX7r4a8deys5fohxBgmxmufdnknawUYYAivJwXpUM=;
 b=iq91vaueXKdc3Tcpoo/xdOMXUGEDyGQpZwfD5N0vzBMkhtFQ8V+OVGih9hAVGWORKu9S2PyOSF1Put9gPe5CKD+SB3cbIbEa8dlx2ft74LfZBXLfFrB+a4xORkedV5THhgwxHnbaDro5lTkTwr7ehc1Wa8pmQhFKhzgaaJW3dcs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=in-advantage.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=iq91vaue
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: Re: [Buildroot] [PATCH] package/mosquitto: revert an upstream
 change in 2.0.20 breaking nonthread builds
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

Hi Peter,

On Mon, Dec 09, 2024 at 10:23:08AM +0100, Peter Korsgaard wrote:
> 
>  > Committed to 2024.02.x and 2024.08.x, thanks.
> 
> Ehh, I should have naturally FIRST bumped to mosquitto 2.0.20 before
> doing that. This means that mosquitto is broken in 2024.02.9 /
> 2024.08.3, sorry about that :(

Out of curiosity, will there be a quick 2024.02.10 release with this or
will that come in the standard release cadence next month?


Thanks,

Colin Foster


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
