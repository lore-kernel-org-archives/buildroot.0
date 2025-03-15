Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EEFC28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 16:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 019EA8405C;
	Sat, 15 Mar 2025 16:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7DWmCwNHeQy; Sat, 15 Mar 2025 16:24:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 012228405D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 012228405D;
	Sat, 15 Mar 2025 16:24:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2347CEA
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 16:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0736F6076D
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 16:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id an8rJkrCiYua for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 16:24:04 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2612::60a;
 helo=eur05-am6-obe.outbound.protection.outlook.com;
 envelope-from=ioana.ciornei@nxp.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EBBF860753
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBBF860753
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2612::60a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBBF860753
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 16:24:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgW1m9+lDfC1YXPf9zI4QC4Adz13cjaqbPyhVFUke1L5/G+7gBFBJUFiEuj4fulmNwVSeDjRKuupFIqTX4srXJ+sAkoFORbEaony00S37SmaoNOZFNOtMujzZBHba2vpRxTBuCWsASymYbP/Dt3oj1kNCxFi6sv3VxYwyQC50tEwWJJTdClLZB3zI56NmUROqa/JTTjp/PcsivKqgf/5SKjxH5UGsfYw6eEX15ogb0E1bzZlkkds/ZSnJRvkIck9YAmTHrLdgWvjmsO562LNOzerMgNcBOw0ED9xIU7e1yJ/+pFIp1OnFYp/6e5RG/e0N8wJian7Fl1NxmmiKDy5ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWYSEKvlKhdXqx2bu2isjjqZ3NuIU1W+7Nt4ny/PI2s=;
 b=K0Ky/PcVGyTrht1KiSgetOVZhPoFAg+6VNcLoe8/b3VlsMvydKbFFarsA1jyIYTNdt+Gd5LZ4nOmwWQpE4F4+n1aHepIyuNtAzjUcKOn/OWcGNd7W37V3w1+/M5BTCoasaFzg65OGB2jwIgE+jBWCxeA5c8jgcRd4FAEwNPKbW654IDX6AqCkRrE4CMxYw9RtwlCu8w/Dxd44FznjYoQLCTa/cJGRdk9uaJyMDgv/HoAEu8Blvh9Nj1ZL4ucSPDvtI7vevisQ6H3wT3G7ChPYSP5PHcmxyzbmCZ+D8XpNmCxG3Xn/UsUuMepjH8z6mAN0NCJGlb37AjiNwANLWCycA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PAXPR04MB9520.eurprd04.prod.outlook.com (2603:10a6:102:22f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Sat, 15 Mar
 2025 16:23:59 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8534.027; Sat, 15 Mar 2025
 16:23:58 +0000
Date: Sat, 15 Mar 2025 18:23:55 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Vincent Jardin <vjardin@free.fr>, buildroot@buildroot.org, 
 Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, 
 Romain Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>
Message-ID: <hittj5eyjl4ejszhu67iwhjjtkjs5dlvnz47y2kc3g3hjmprbe@25nc3cbt2lq4>
References: <616d3621a153da86972c8b1497f71c53@free.fr>
 <pcbstijcbzmyxl5ttv3cths4ysykfqe33o77q5v6vf75bo6tfs@kwpgkgpgxlrh>
Content-Disposition: inline
In-Reply-To: <pcbstijcbzmyxl5ttv3cths4ysykfqe33o77q5v6vf75bo6tfs@kwpgkgpgxlrh>
X-ClientProxiedBy: AS4P189CA0025.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::15) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PAXPR04MB9520:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f30e5b2-1594-43f9-ce27-08dd63ddca0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qia67mmFOpFzhVqpTWqGDjypY/vsZJ/cgsjrKe1zPa3Ji0/U95GB5xIamtTK?=
 =?us-ascii?Q?55TpXCfP8t+5NPUOY4C7m9Qf+kH4szMa9v1qbbMC2YRF24z2ohr41ZtvkLKU?=
 =?us-ascii?Q?tPJubu6xJtktQHpmzlUoXuBzSPtcZDZp0q4mW+mY0IdAZ868k9K5WNVJh8M9?=
 =?us-ascii?Q?h2xRP/MQp7nfl1T2G9O2d8RXRrPmWsQVQ9Z6nfWOwf+94jDaQ/uuuDFOlppl?=
 =?us-ascii?Q?9ClNhhen0e2KkBxKe+fRgFVJAzTuACMV2i/3Bsr09w5c2ntI1AVaNe08wfpW?=
 =?us-ascii?Q?zMlA3bI8KM+NkjxLLXyZWUvbN1TjIdaENQiprR6r2yLX5gdj4OzuzXuy04Pu?=
 =?us-ascii?Q?Fv1ikQclsdj7Ye2KpNuW5GW980zizHMrpfyhEacASyZTYUuif8eBec00NMt4?=
 =?us-ascii?Q?OgVwyVjkLPqY3bWxaUNbndW977ZzfAYSqBePZLi6R0YJdKtd9Pl1xwHb07Iw?=
 =?us-ascii?Q?9dolTwVpX1a2wYCthGtdvUmbaDZOYIgk0b/aDzT9gI0D1WLBYs0eyc9R6RyF?=
 =?us-ascii?Q?fGLN7wytZ6iC8G3UhgZ8uD0YvyDZzdmJhfX1Y7ugFW3Rq9fusnUxwuH3VhWR?=
 =?us-ascii?Q?SWqKykl4K4WAgai+4exlgaCD6baiOdgCJXEPoHH2hlvszGXKmtmz9b1x/gqN?=
 =?us-ascii?Q?+878OGFSURpm+cmwBZmq+zfJ+VfE1UxHBj9tlbK41Bb7NI3bsZvCGjWnfziy?=
 =?us-ascii?Q?0jHzz7SPn5agY433/v1KbL0hirjqmqbkNMCe1MHb7kok8NvlaAidVKXsEO/p?=
 =?us-ascii?Q?JqAs4ZAx4rCSIg8fdcmLSraO32VjAmXUEuLGsHzrouSY6s5FLcTrWwm/EQdh?=
 =?us-ascii?Q?bBIPuhde9hTx4GuH1MW7CXrqHXhuP+/C37mWQZG+8azXIisUzl6F95XWJYkN?=
 =?us-ascii?Q?wuHdL20meUZDpZKi+dr0Kr0NFg+VfixutM0+brvy4kUkMoTEaJww/RPcwus1?=
 =?us-ascii?Q?Fj68Y13k0RzJqyvhMCgiyWJ3P1pwbFMZL8BZpjuZbJaVAcJKY+J5uGqMPvv2?=
 =?us-ascii?Q?APChl2czF23BJXVxzUglMNzA9ULKupumTPE6qRs9jU1CKeeJsenkHTCaZL64?=
 =?us-ascii?Q?vdX7Hh5KAfugsx6sICNOKKjTGhJtIFXOnKuekOFwz6QXRXhUnHNJayfk3Zb/?=
 =?us-ascii?Q?IuzNDYVyoff91zz3BYaT7/ZesnUG86X7DZXP0D+5nmw+fsh0FuYXk0ejsOZQ?=
 =?us-ascii?Q?KhX6IrvyQca6G7RkOHwFh2+qgXabu9QZ3RRHRuaF1qeu+Zf1lLooq9D6vuw2?=
 =?us-ascii?Q?NOXAFknOmHM3+/gLgvQP0VXRtaU3tjiqJR0zCGdYIpU+FdBVe+2QrHJbytF+?=
 =?us-ascii?Q?fqBspXUweDmAe/rUKJ6H57l0ClzAC2cS9ITBwh7C4gELrtG7fUlulrLndedj?=
 =?us-ascii?Q?6AoYS0Yt+3/QdptvtaOC4Dd40O3/3v3O1IqmFsUb85rWcQ5suQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8868.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(41080700001); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?De3HAfxnNaoSzSIQFAHQkzN1D5fUyScrQqMbGWZgJ4Wf6BnzJ+hhcaqm5xC4?=
 =?us-ascii?Q?2ufotaUAa0tbHTFBWl4ZfIdrfJiNIGrn8d3rG5MWUDvvB/EJRpUPo6GOhfRv?=
 =?us-ascii?Q?41iSZEVZmzxgoYRXsWecj2z7lCitkFi369NNCi9HbiC9BM27M+RhpbYd04TD?=
 =?us-ascii?Q?PLruYOMHGzY9G59SaYxbbXczEyHH1QZJvw1PGLspPyDXqkOVnn2j2GEo2FxZ?=
 =?us-ascii?Q?O7Jxfv8xSC44FqRR3WIjZDiAT9x23z3/h69i7e7vbcUH+Yz6FyydwQQrfHX/?=
 =?us-ascii?Q?Qy+59E4MKh4u8LTymebDMY4v7DXj+tIR4LGJgstg4Pk1mVRAxZz/mHQ8Zuaj?=
 =?us-ascii?Q?3EUUlxQu1JoixtUCTiXjONU/61PZFUFxNB7qyFhjPVoqJ7fu1t7jgPCEyil1?=
 =?us-ascii?Q?gSzPb9Vkot7kCXHFBAxmFwecD6hJhEGkUY1xAEtLFapFwG88cRSIZ5kW68ku?=
 =?us-ascii?Q?tMzAu9FPz+Mfh9kpxVBriyk3LjiMZkLoHwKwZhbg924QGD0Bua8ifHYaQZsA?=
 =?us-ascii?Q?QFzq9OLoX+5SSIeps9iPGygicFe0PXhzLXSo7V7mgG0qT1e7xUDreuPOowAG?=
 =?us-ascii?Q?pBNz7Y8LB9Pn7umlHoun3cfcl4AmDtdtOuVEKVc+APq5dl9BB9wnJJbUU1lT?=
 =?us-ascii?Q?p8Rn+qJsePcDPKliH/SPiI1363cxR1HS5SvHDFxrT4eCWTN2gDQhWgRp5dD2?=
 =?us-ascii?Q?OJHIMbdlNIhu2ImsQLEVHfFpvYzXKGXAC1OliYMOiTteM8aTgrTG2ImllhP0?=
 =?us-ascii?Q?WWcomjfe0cUjiwliaKoBNYKw6RxPk1i2ZRrrIn/DkoeHdmoS0eiTbCxAewPp?=
 =?us-ascii?Q?k/3WfI+X70j5vAlJMYJJUslKY7fKMzNw9O93WTB1a1U33s/LKH9IDdPArMCF?=
 =?us-ascii?Q?CjhWazb5sJY3GmhGFSc+8AZPpsFVq+10gDBN5RqeBCrIVBVKVf7AQofAk5tX?=
 =?us-ascii?Q?UlRkxS08lxrlOnU15WhoAdC/6qCtrosoPUEMRYFmDWClM71kDfv+TyOWfCnK?=
 =?us-ascii?Q?ujw2ujk503N7OXKmqxDMn+Lkzu4/skJZV8ghTWfi0D4SMQ04aJsRv6sGr4HQ?=
 =?us-ascii?Q?ssjncLjIiQdcZpHME/eCuW2U7n5lL+d5mzUv/YgX9yNgNzB7yUxJhNbdFF48?=
 =?us-ascii?Q?HweWf/h0iuc8a/JbxyomeMmStWtGuFqAxd9iSHK2FjuIQfb/chfm84Bach4E?=
 =?us-ascii?Q?UPG82fHE4IFWCq4W3HvG510Wksfx9k7ep/zQZi9edJ2OVATzcmeqBJrlJ8bm?=
 =?us-ascii?Q?F3iKAgUuvZtxFbtpY/wxRWxf3KTAbGQOluEkSlzdOL6Q6TeFrScN4GrKV2sV?=
 =?us-ascii?Q?6idBxcd9ARKs0o1NtDpN4RO3WW0f0ry8rzzn4LAjOm/gJvR62goo2wpBEtT0?=
 =?us-ascii?Q?dXJjEjBqLY7YQlp/gNvY8xeh9hDVdl78mGvVaJJZPqKwjuCRttvKNHkY6bHg?=
 =?us-ascii?Q?QzNDrUXliy6eqYTjRr3u7SaLKpN0wwuyJ2g+Hh0QLhYgCudXEEo2HDapLj3x?=
 =?us-ascii?Q?9Z8hW1oU0cU5gJ0b8vlg10j1JC28vX80AHXCnpdmjzqbvfOeewyXe6qHzxHb?=
 =?us-ascii?Q?/B7KQOIuCkZMoO+pFMH8HSNDw0ijFYUklTTNDEY/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f30e5b2-1594-43f9-ce27-08dd63ddca0e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2025 16:23:58.6371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/uXEjxyt+Af6JrfjeQkonyf3cpjHzqE34BHkV+gL4NGioX2wtQgM3ZrzWOTrks/1jt9P+BIKSB7fO1IxSVR+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9520
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWYSEKvlKhdXqx2bu2isjjqZ3NuIU1W+7Nt4ny/PI2s=;
 b=QE9AklaKQEWyW/B+RT7UVIyXCCu6PyAZ/BUszwMPw4RPZGamk1aniLf0kEEAIQ4Pks6AOB/hxo/DVk4Nsxj0iOBqkLouf4DFrThX/uJY1ux/rHv2WREbLWV6ENgMCaQ3z0C4DiJQxm1p4Xp7NQI6nmk4B+KyWHJ+E1juCEPpP3zKdLZQPVlyvCm1d3d3BvWHQFQNcaqjYJodqbdbWq/mBsoB5lmkxquTJREMdPTrngY5NBt8kgjVX5gvsSnqAQAnY/chhjblbN2rGTOaspaAFp2g3+dWun1bGT78sObiqlhpW4FtH4p72fGQm/z36alXkg5O+NMn8YDNGekWAy4Q1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=nxp.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=QE9AklaK
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Subject: Re: [Buildroot] [PATCH 05/15] package/qoriq-mc-binary: new package
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

Sorry for sending this a second time to those in to/cc, I was not
subscribed to the buildroot mailing list so the first email was
rejected.

On Sat, Mar 15, 2025 at 01:47:55PM +0100, Julien Olivain wrote:
> Hi Vincent, Vladimir, All,
> 
> On 15/03/2025 01:40, Vincent Jardin wrote:
> > Hi Vladimir,
> > 
> > On Sun, Mar 02, 2025 at 11:52:09PM +0100, Vladimir Oltean wrote:
> > > Add a package which deploys the NXP MC (Management Complex) firmware
> > > to the target. This is necessary for NXP DPAA2 SoCs (LS1088A, LS2080A,
> > > LS2088A, LX2160A).
> > > 
> > > Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> > 
> > See inline
> > 
> > > ---
> > > Change log:
> > > - Shorten help text a little bit
> > > -
> > > s/BR2_PACKAGE_QORIQ_MC_TARGET_*/BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_*/
> > > +
> > > +QORIQ_MC_BINARY_VERSION = 10.39.0
> > 
> > The latest version is 10.39.103, let's use it.
> 
> I do see a tag "mc_release_10.39.103" here:
> https://github.com/nxp-qoriq/qoriq-mc-binary/tree/mc_release_10.39.103/lx216xa
> but it contains only the "lx216xa" directory and firmware.
> 

The MC 10.39.103 is an engineering release only for the LX216x SoC.
We sometimes issue such releases to prototype certain bug fixes or
features with select customers before the code reaches into main release
tags. Additionally we are skipping regular processes for testing on all
platforms and documentation.

The "engineering release" status is mentioned in the commit message
adding the binaries.

> If such a version is used, the Config.in help text should be updated
> accordingly, to say that only LX216x is supported.
> 
> Also, looking the tag lists:
> https://github.com/nxp-qoriq/qoriq-mc-binary/tags
> 
> I also see a "mc_release_10.39.200" tag, so from here it is hard
> to tell which one is the "latest".
> 
> So, it would be nice to add a comment here describing how to select
> the version. For example, following the nxp-qoriq yocto bsp:
> https://github.com/nxp-qoriq/meta-qoriq/tree/rel_ls_6.6.52_2.2.0/meta-qoriq-bsp/recipes-dpaa2/management-complex

The latest official version of the MC firmware is always located on the
"master" branch of the qoriq-mc-binary github tree, any other "eng
releases" are tagged and pushed directly without being part of a branch
and marked as such.

> 
> Or even upstream? In:
> https://git.yoctoproject.org/meta-freescale/tree/recipes-dpaa2/management-complex/
> since the recipe seems to have been removed in later version in:
> https://github.com/nxp-qoriq/meta-qoriq/commit/f65a8aa1c1eccbdfe3a563cd1d94ed59ff421056
> 
> Anyways, if we follow the Yocto version, it is indeed "10.39.0".

Yes, MC 10.39.0 is the latest official release. I would advise to
use this one.

Ioana
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
