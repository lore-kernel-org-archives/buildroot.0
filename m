Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B03E7717D
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 20:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1567660731;
	Mon,  9 Dec 2024 20:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnv-elFnY24o; Mon,  9 Dec 2024 20:02:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F88D60743
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F88D60743;
	Mon,  9 Dec 2024 20:02:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 190276F
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 20:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06F826070E
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 20:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35LK27tt7XZ7 for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 20:01:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::711;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=colin.foster@in-advantage.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0665460731
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0665460731
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20711.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::711])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0665460731
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 20:01:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9SEDRhAsv6txoEhx48urD2l9k2bGdRi82zEoiAInOXT9TO44guCVfWxTB8eeccGHUfSLIymKRPaTsHKvBhJixtiy/5tCnHLHTlgvhi29P97l+L/QJ0Z4NO9jqA/6LXM2BjniKB4L52cDJJxSun8vIOkjdbPExdn/vNKOPimygIChc6qVYedxR5BA2nWzQbBcir9epkAyBUKSgNB0Au+WDvfCBEm+3SO+LpyBl+EIwIQD/eWoSArjpBxKYGamSncJwOE1bKeiQEcSMJ9bNgaP4sWkmlF0e9s7ly74X0o7iLWhaAafwTRuD5XZ+fLBsc4EReIlHM1STyL8IliaZmxBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnoBlcVNb4QXPLFw7AE0YXzDws3yM57rU5u5c0q+g3E=;
 b=GA1GICR97ydS/Vk2ksFDPkUciUL79C4JS8G9ST8WLrqmub0i5w3nNmDvBneRQnR3LrhHCv9lS4u8GqCqqxbpyUBbUXLoDPwW9VEsYMVqvVmfLxSiBpPtfYq+oxQ0yLC6ySEvcPn0iBXkol74xJVyhcwsZi+w7UY1g7U7G+mMTwZ9kQv3Pv3cq5QcneNn0voxe9Tzdh1hFz1c1FUPq+IlbHTNJO+OKMzZdZkPE6WWX6ewwWH+9Wwf5Q6Luj3yLN+VL42CnVNnxLIDw6dkAFx9gteYciepj91OSMmyzQ/o3ba5GAdZazUmp1LK7EH0vrUZ7TQ9DiIrHCcV4XSu3hasbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12)
 by SN7PR10MB6546.namprd10.prod.outlook.com (2603:10b6:806:2a9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Mon, 9 Dec
 2024 20:01:49 +0000
Received: from DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::7603:d234:e4ab:3fea]) by DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::7603:d234:e4ab:3fea%5]) with mapi id 15.20.8207.017; Mon, 9 Dec 2024
 20:01:48 +0000
Date: Mon, 9 Dec 2024 14:01:45 -0600
From: Colin Foster <colin.foster@in-advantage.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Titouan Christophe <titouanchristophe@gmail.com>
Message-ID: <Z1dMqb2w12tpC51S@colin-ia-desktop>
References: <20241206074342.1532295-1-peter@korsgaard.com>
 <87zfl73joh.fsf@dell.be.48ers.dk> <87o71m1b7t.fsf@dell.be.48ers.dk>
 <87v7vtyzur.fsf@dell.be.48ers.dk>
 <Z1csc2aGtuzcsuwm@colin-ia-desktop>
 <b8d9b247-6dc2-4193-b4fc-8a3feb0537cd@korsgaard.com>
Content-Disposition: inline
In-Reply-To: <b8d9b247-6dc2-4193-b4fc-8a3feb0537cd@korsgaard.com>
X-ClientProxiedBy: BL0PR1501CA0002.namprd15.prod.outlook.com
 (2603:10b6:207:17::15) To DS0PR10MB6974.namprd10.prod.outlook.com
 (2603:10b6:8:148::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6974:EE_|SN7PR10MB6546:EE_
X-MS-Office365-Filtering-Correlation-Id: 786a05ff-2d23-41d1-f750-08dd188c50c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Cmf1FCvfFgvfewRRPm4qYLhT4PP+UZxm5mqUeC1cRD/r2Z96PSnQa8ZbJSBa?=
 =?us-ascii?Q?ldkRDmDEvgVoxJAkPiZPs2tOF4Qor1V4LD6Sn90PWeiJySi/T4fzN/Xoy+h1?=
 =?us-ascii?Q?E3fEGO0Wkq21DDuz8dvbixbYXpzxPLd6oiw9fjPLFRBWm+eGeJsHL1jXOOnZ?=
 =?us-ascii?Q?pf+xB4yqn9+9vnDGtc76XV3M21YdkxRbppCzwc1RTjIL9IQfb/2/q29NVewu?=
 =?us-ascii?Q?ilEoE63ibartZtFkGRYkTzIUft/F6VE8xQ9dGhBu4OC1mCGpPtLRwRrHe4wD?=
 =?us-ascii?Q?M/LI88ZAs4EU6V4WRJODUOXBY3iRMfPT5es5M66yGHgHvky/NO0fQFtKrcQP?=
 =?us-ascii?Q?v2zaPllAnyTsIITr2n2j/jTyLn/F2BdyTZfNMlP6EQ4PO4Ubh5pX/Gz5Jokj?=
 =?us-ascii?Q?Csv5VX0lEwakN3LlQKRNyo4EU2EczMcVDgDPuL5O76JatM1bxLr6yk0PtwKN?=
 =?us-ascii?Q?fYYOjFioqhgNMO+5aB5xTEhotXHjNciKBkhWwC8SP1HLZmtVUFkaubZkStfR?=
 =?us-ascii?Q?0ysw9HSzwQPgF9cALMJOfP/8DzA3BpjMr7C8925A1P9KWrTKdD7xxCkEu98K?=
 =?us-ascii?Q?BbP6b6/fodCOTiDMzgiajM5MhpTSGtok23yBa2V08pVDWS3iKHSn02Sq/1XJ?=
 =?us-ascii?Q?yTc9EroxU2zk9kPShMf2sHFtAsfx5BlVd1j98SVfcCXMNrL+ioD079YOFkGp?=
 =?us-ascii?Q?p1qORJ5K5R1ZCNkwctjtnI9W4D+PrzxsfsswRs09x4ytnu0AFNVogOSTYnQP?=
 =?us-ascii?Q?aXHqJ70nVM+KPzg7e8aMkZ4qe6JN4D+piIeFlrg0XvBuQyozjYyuQ/qazZA0?=
 =?us-ascii?Q?a9m31D6hvlqNW0KSRVvV+pCb1D5GIdhZUAd00+esl1hMMZX3FP/AQUvPbgha?=
 =?us-ascii?Q?LUHbiDK9yYggKTHSZm252ojAnsJOD3ImnlsSwIwAB9ilwrtfuEc2Ts5sgcT0?=
 =?us-ascii?Q?ovZGfszMbpf+TWNoi3e5yaqOjcg3rvHhfxREDEQ4K7HP9gIgcrV/Z2K3HRrB?=
 =?us-ascii?Q?qay+5BvSmDTnGShBl7NNKdwiae0GFRmsyCX5J3yLB36/zpHbSXcasjjT7li5?=
 =?us-ascii?Q?AoIur9l/XfaLbc281hiDs3Gwpri6Ft5lR7NSkcZd0YaoEpDDHvQJFOuxMoJL?=
 =?us-ascii?Q?uEkbT7D2+tKZslDBKtYhTDESV73PMS2bu1Oc2lhTQc2p4dRfX/fMopnD8HDL?=
 =?us-ascii?Q?/l2jAXjclum1Eez3Aluu4JP3YSCF0U7wUjKMM7PCCcH/uEpHCzm3s7EAvC76?=
 =?us-ascii?Q?bp7hGKHX1o8h/FzuxERJHFebHA2If8M0pnNy1cLaGRLrMbVbb558zKbBOyTI?=
 =?us-ascii?Q?uO7L1OKsDcAsXi0c5IEddYTa/q6nJ/z+WlaU7odcqdQP3Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR10MB6974.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J9v/yUrQ/t74p8fhk54offWGjyaVt1LFyayl9OwAskX8xbbD+OMZlH9tvV+U?=
 =?us-ascii?Q?Jn19pvsqKwkRNTnyYM8gSYLTUJkON8WYLtxdJAvgRdfMGbFrau20sSMtqWBi?=
 =?us-ascii?Q?9a8ke7i3LWe8zfHs23W0FX2cDkxVwyHWD7hTEnWBYnZ7zKUuEuziWbtT5VsG?=
 =?us-ascii?Q?7cpF9gaSbDKwSblycKsFpny1jOpY/EmX00GDJwPsI6mA1HW57AYY4q9uTOZj?=
 =?us-ascii?Q?2LmHDwNZilVaKyXHtRQ9zc7jwrVBRsiClhyVXdzlayeJPWpEeS35hGJLcYmH?=
 =?us-ascii?Q?ArfiIhz8w+XRCg13XGlKhrMR2oByR+mjovCEm0AZUwcmQHTAABMg9/SdEcUy?=
 =?us-ascii?Q?qHgjMxX4BhS2c1v9daRSsDc+x6QtlwVSqCKu1nYvhGWgUiM5JVWIzTdDYjYF?=
 =?us-ascii?Q?q/WEHKzBDji9CnglgYius7Sdez26V+M24JQqTM3j1W6yb2ljAcljprCuHSyz?=
 =?us-ascii?Q?eTIUrKkAx0+A2CzYkV0o++fbv7O73ybRRBopxQ/3tFdUSTcodzYfhWe3Jd1I?=
 =?us-ascii?Q?/Swo3IKruisu5VPQo3j0pEW53YLZwBRqDI0ar6ErW0hCP2ZW6JHv/nXkgn0o?=
 =?us-ascii?Q?o7SRJzFOX3pn5+gLYu/FxHbux5x2gHyC3OnkpE4nTdspgiLmK9bjEpP2nWKm?=
 =?us-ascii?Q?TJHm99kEHutrLsLeuj0YnwXpcEbJYKEDrzotCdBtSWfNAdpABIfvUDJGEuoy?=
 =?us-ascii?Q?fjNmivf1c9AiUNGwoHBM0L+ZRoVgm2/64aIigX+JopUAV8q3XWrI8DRW+Ltv?=
 =?us-ascii?Q?WbCYKX1Nc82nvDpd5aKW4/a3Z+0YJ5sV3janmZ0fM+OAQFrIapWCnZLFiI33?=
 =?us-ascii?Q?HOjr54FEgf5wrquf4QiBQyQweiJFfKqTmAH0roDDTE0w/hG3XaAtCipbSPGM?=
 =?us-ascii?Q?1WhcCtNAs7YIcsr0Ju6KLmfBdIn9FfMXunCegERvQlQKk1ysEwz6Rhtly/uL?=
 =?us-ascii?Q?FU8rJhGFtyU5ujEWPMIDBc8SsdNhlhw5MCjpBiCW85s6ctEDQ0ET3Pf1LKjX?=
 =?us-ascii?Q?5e4r55HfvIwO8BIvoyg6zfN6/cP3BCaRIAW6GvRF5CqeYUQSgrMsUnaELd99?=
 =?us-ascii?Q?qRoGfn5Bq42gb+GCJ9Y9VVjahV662duE6K5d2O+aUHAWb3dQL0bHMpTDXu4e?=
 =?us-ascii?Q?fSeSNbC64lKHyXOCSQodNRwPEomFkDQ5lKX1hS909x3xT8bN+7a5xaRGFONo?=
 =?us-ascii?Q?fhqCKDk1rCIEcLqpZagFsb/oc6JXS7KF/NDs+aK+rVpxWY0+q9iO/pFV7UsN?=
 =?us-ascii?Q?6ux1u6FQ47YCKPW3VYY5rIXM4FXffSJy1CloyNTc7enxbNNX7EYnFmCraeXc?=
 =?us-ascii?Q?SZU3kxcT8zQmCdnrbryX1X8zYuaiHBqIIRjOZfQAv+cXBRAtzT21xYabRqCo?=
 =?us-ascii?Q?s01eYryS/zcze3QBWRaLV0gai4heeZWdpBmvyoljQtYEWFx2CtD8JPZ+2Umo?=
 =?us-ascii?Q?34/yzrjX15dgzddqId81gFUPqV9YG4lFpsoLfetRRZndzg2jAdPSQ3hP18y0?=
 =?us-ascii?Q?ZsHzPc/JiD03pk06mEj9E2U7Fc2R3j+MFn7xDfOb5ZZKeQVP2RdnrlgnxafS?=
 =?us-ascii?Q?O7xvenpM6BSsyvKb0cLeA2GFnTJQnHP0qbtZSREqlZxc9BD/SkHnfKF/av5A?=
 =?us-ascii?Q?zk4lxPQmu8hnob6ugnF4H9M=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 786a05ff-2d23-41d1-f750-08dd188c50c7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6974.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 20:01:48.7720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xz7n7JAV8mifh6t8XMu20jxuAJKGGhCKzgbPOyPmWooqj6KkzZK905rhw+jjnH1ml5BuOv1JFdX4Gb5e3PAPbrqcil//aaQY8k8E7GP4fZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6546
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnoBlcVNb4QXPLFw7AE0YXzDws3yM57rU5u5c0q+g3E=;
 b=F3dQrTK5y9TWjDRpeGW73xyLlrv8Zn8DC7FxGZxfUsul61fUPHCROng/RJ6k7EySDjpRnmwUI3YD/WF4QJGHVWKfip6u4yspoEPHTEvofXA2Mv9juHtqQavWk9DhlIEjL7SghUdRU6STK0wAoycEjyeZqAbJ3WCaYxRI+RGxQZU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=in-advantage.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=F3dQrTK5
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

On Mon, Dec 09, 2024 at 08:53:03PM +0100, Peter Korsgaard wrote:
> On 12/9/24 18:44, Colin Foster wrote:
> > Hi Peter,
> > 
> > Out of curiosity, will there be a quick 2024.02.10 release with this or
> > will that come in the standard release cadence next month?
> 
> How annoying is it? Are you using the git repo or a tarball? If git tree,
> can you use the 2024.02.9 tag + 1 commit instead?

I'm using the git tree. Yes, I think that'll work too.

> If needed, then I can do an early 2024.02.10 release, but it naturally has
> some overhead so I would prefer not to.

No need. I was just curious. Thanks for the quick response!


Colin Foster
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
