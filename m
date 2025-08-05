Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81122C87FD1
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 04:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E01A18222C;
	Tue,  5 Aug 2025 04:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjZfKERK545G; Tue,  5 Aug 2025 04:10:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA95F82232
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA95F82232;
	Tue,  5 Aug 2025 04:10:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 42BFC118
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 04:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 288BF40899
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 04:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Po_zPU8BBtrD for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 04:10:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::61a;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CCB0240054
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCB0240054
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::61a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCB0240054
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 04:10:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXRudMWLwHqFj+5KboGj1ZEWFw6UYQcHeFKMGAZ7dgVX0eeKP52xFaDPNQ0fyzTs/wPEET7P+Ksu3hyL4rM9N9rX+Ffhhys64G5Gv9eWstWg0tKi6BiV+wwXm2nC4M93DggkW1k9Wa5MjKOKFGs4Qv0eecuJ2LQ79oCDEczEh2PflSBcMmS2kv9a0wsyOKX2ENU3axfx/EWWsM/KtGhnYizvQgBjS5zCycpU87qKJyeG9weMz6aHOukOhcMW+ChFTnyheBe3tP5rig7IZikHRBUOB/zKap5wNfkvYVMy2NVz/eW6i5JUNure3U2q5I9Djgvw8mtB6kLw0KOla5zfPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AO/uRWaL0wpn4EilQk8Jw8DDgcdPzWMYUg3lLr9ld3w=;
 b=bI/RxYE7MVCFK9aprrCTdlGJS/H43JZ+zVvcI7UUoKn/hBqxQD1XsYFypcqK3l7YoYowmB+wZ+zohI9Ara5kBlvHZU5WnEpLmn80tXaIp8xRVuLzds92Vq9HhcMxOUvOB7kjRpRNeuBijzHPljINOiQB8juRuSxdjdUKYHK0lAIw8gtPFAbdfC4dBnND/Gq0k0wavOksvZJOxsbbU4PdPQ4rf5fXicp5Gw7K0IQxz8kOni8iO9RnB6JAh137NxYXmT1+5Csp3h1oMgni+Zmpn2KERDZU2/phpSz0Ba2T4qwNW91EzHkWP6SnTmFA010qs4qfIuUYSbPqs3BT+KyosQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by DS7PR12MB6334.namprd12.prod.outlook.com (2603:10b6:8:95::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 04:09:57 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 04:09:57 +0000
To: Jesse Taube <mr.bossman075@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: Giulio Benetti <giulio.benetti@benettiengineering.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>, Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>, Arnout Vandecappelle <arnout@mind.be>, Julien
 Olivain <ju.o@free.fr>
Thread-Topic: [PATCH] package/gcc-bare-metal: Add extra options to bare-metal
 gcc
Thread-Index: AQHcBbKW9PEPJxZleUm6cXoKKAF5yrRTbFBw
Date: Tue, 5 Aug 2025 04:09:57 +0000
Message-ID: <SA1PR12MB5615FCBAADC904C28ECC3D36F022A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250805024222.247903-1-Mr.Bossman075@gmail.com>
In-Reply-To: <20250805024222.247903-1-Mr.Bossman075@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-05T03:48:49.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|DS7PR12MB6334:EE_
x-ms-office365-filtering-correlation-id: a58913ed-1ac8-4c87-9a01-08ddd3d5f05d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?9GcxnCtSA/lzRV32B2EgWRC55Kk4khY795uaC8zGuLRj4TLaV4JQnlzKCo3k?=
 =?us-ascii?Q?arkST1zdAOpTPJKpxh8/DxN9qO8lKDObzM/muXMZBwF2JEvA2xYLrtXdxS6X?=
 =?us-ascii?Q?fsgDaiP53DPUaTMw5cLa74CpvBz6NpXRuA0I/eKrZzkP0xdvLSl/eYEHV4r3?=
 =?us-ascii?Q?3H52tlowOTjdyBXWIiz8P00eES3mAmGt+UgcBIC5MOL/9kmVyQ8eMI86OHol?=
 =?us-ascii?Q?gOqGGg5rrAs97O2pqkEo5ZSfKDYfiZRNRsPkwhn3JOcOjQrTalaZhyURhhQK?=
 =?us-ascii?Q?Hk3A4xBzVMY/mjVzh+1Jz8Um6y87Nb2dgx2xzmLRfAVV8WBc+dV+HvazfLBz?=
 =?us-ascii?Q?SVNaYaNlyVY2BO1vHXh3dK6onEcnw0Waf3Wna7DE26JvlW2B6oy0DzI9PBKo?=
 =?us-ascii?Q?nL7WmNyNR4sieDbQbwafyuHAQN5F5UZQFBFRSc/gjdGKz3gooqGtwH5pMkUu?=
 =?us-ascii?Q?ZqVtpgS3h4T+FI+IGUGEUIUVQiSt257Jmm4wXh66qOuN62Jkt3+Lm0tmE3UC?=
 =?us-ascii?Q?ak1z2uQ1daehzjUAAnSFHxxcTauoyNQaYLf2lWA/eqDhkAaXJH9oNyJceeLi?=
 =?us-ascii?Q?n8Qfpb9k0rfhfgtVOnEVcCfbMQaNNPzy7yyZtWx9wwfALklqEz3Z2YN31R8G?=
 =?us-ascii?Q?qUDZTTkFc/FNKxa94t16GCcizclJiusoFkDxrzgOcUqlTJWuu6qbCzf0+myW?=
 =?us-ascii?Q?3Wdou8VLENQ2DFoD1mZfG7JvoHpjkj3IGdVIHoc/PsXltf2mHFsPNbN8/Mr7?=
 =?us-ascii?Q?+DACQ/sZnlUR6KP+aGOeqqTV5Xm/+Lvi++ftshmey/X5alVrUSD+UtFdbi1M?=
 =?us-ascii?Q?uI/2B2VCO9w3CVFuy8+/lxu8ZU2p+J1JQoUoi08+YS/QJcE+AZ4pUEpjzS8N?=
 =?us-ascii?Q?WtXE9W5ND1rS8Lcbab3+FSFO94rs9cagqlKiyMYi2kTDHH9RWpPkaA7/D2CS?=
 =?us-ascii?Q?J4jEkcx1uY4S5QucEHENaYjVUMOqB/Jze75chQZI5Gyj5UTf2Qt6oVFHd9f7?=
 =?us-ascii?Q?icy+JyF1TF15bhWv9Xoxo9oXr7EDgzs1/86ZIgyRs+sVN4YAWEFThX5jUYtC?=
 =?us-ascii?Q?krrAWwqKe8QdjQDhi2aqmbsuPaBbtxdE4psnwf9USjw34mOfbSpiJbXYe4Eq?=
 =?us-ascii?Q?cgMRKwRvBuIOIk+W8LFxA2PQ1NwgaazCVN8ZtnqzQUeA7ffCT9DHDOcVQWBs?=
 =?us-ascii?Q?fC3gq9ztbFCvhdTvQsQlQH1rKQYPTMC3omvcf+oa2btWbgKz9YDlxWp6+a/W?=
 =?us-ascii?Q?hgP68Dl8mKG0blUPLyHsntT0r1GjfLnkO3ujP0i8Wwm+l24K9j9AA/kKGQsr?=
 =?us-ascii?Q?IKhuTtCifwB0ChN0isA4yimSxzSV6D+FQ5x1IG7hieQDmUHRzj4wlokzMcLK?=
 =?us-ascii?Q?iIbTbj4vOve+KcMCpQPKcS4uiXy12tZnvXcRHsUqwKTtQdfiHmXtKPRekJNf?=
 =?us-ascii?Q?NHOPrxoku1Xk0mr3V2annvIPxe/apKdtgpTdxrxKRqmf80/PVJHAoQ7v7FAw?=
 =?us-ascii?Q?0KYKX+iEVSluEdDhQwX4M7GEmjvqnobpFw3O?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sPFFASCFnZWj4a69iIeJOQc50ZH829qYWPU1Wro48NiiNIfge1Gfw8SUzwSz?=
 =?us-ascii?Q?b3DaSTbJTCz2mROLIE7j5p1FkSzIrQmmJ9aN5wTwSLuTUC4mU6p/0GcVJs8S?=
 =?us-ascii?Q?La8Cv1jTR06kLtDTbbONrfN8+YaVwzRYa9hHyiwZrnTROorakJIGDc810hEY?=
 =?us-ascii?Q?FivQpZfhyUji/OY3BpxtRyyt9FhgK+m349j9u179bvVmtQR9fF6wPXPrNUJU?=
 =?us-ascii?Q?FJ9p1o7cTFLYskok9kvj/MrdARwcZSdJQLSe+7ZBiFEp4rn9T9TXKwl1weiB?=
 =?us-ascii?Q?W6gWrKEcuLAD4mFBw007ZRlRcOMnczzJMORRZn9inlYL6PWRsKX+z8WP7pNn?=
 =?us-ascii?Q?JKE9isEwDYrynZVo3Wc2iHpfbHVaHnPxMuT9wSSOMbx2cOKDb0oXB/mzoETS?=
 =?us-ascii?Q?XFiOzXCnXZ7udsAQO5juTem8R4C+H0xMUQ2byuSWtzeCwTVR5GL49ifrxOU/?=
 =?us-ascii?Q?yTEmFZ0tXkr19tOHFBgwjtdq94L0nZ7jedGGgnMzbi4aHNZF8cTeX53EJ8Vd?=
 =?us-ascii?Q?+lMylIth2QfXsv1cIbWmvR5jPp/mfC9ckwrbEY8bjs0adxdLuwfy+MR+kIwS?=
 =?us-ascii?Q?RQMuD0SR/DEfgeIN/UyArJo2DK59TJsFWy0Pm8a2vlwAMs3YgojoCsLZiUKM?=
 =?us-ascii?Q?XDS3dYlue47Ip6qPQLA7lpec09zH20o+xEwqFBAieVYtuilIIKZ2MIttjHmj?=
 =?us-ascii?Q?uMM+w0vB5h2vVdKIZacYcouDBmbfnsW92u+zqTjBTEYI7DBX6nYRplQ7avOB?=
 =?us-ascii?Q?bmdWWWmSg/I5SVJ/zN++n1U3rYnDDcOo9w5xMmgJxJY6Tr+hd5pPoneZcGl3?=
 =?us-ascii?Q?m17Pc9hvOeefnyThcABNjChyUXDucAs0JUWUxOV1vone8lR7FVbAqNQx5WoS?=
 =?us-ascii?Q?FhOrCmJKehDfWgWFb+hEnYrSppaQq4PIY30yuuz609BBm/H1780IAKm4mXep?=
 =?us-ascii?Q?i5YeOA5aD/Xk5Zq39+ei8BHMPuh0tyUSmwduizbwCdlm8hWsDhX6ltaEf3JP?=
 =?us-ascii?Q?tK9/54FGxuz6jDdWtGbnagaTc6cKROuoxqmmeemXKC4/BuJkINCV5ZV2Dt89?=
 =?us-ascii?Q?W+ZIV1GHh0IXXIf1qs65m7GorZfLBsYk2fYTSsO5FtRUmlPJOCCVN6laXa4m?=
 =?us-ascii?Q?A8sUSvZ7sO0GYQJT3TMsdUWo4q6FmHhSi3Cz+bLkEbJAKTFnHs5unhJSLhHI?=
 =?us-ascii?Q?Wr/KeQuriMoQ94soeJ+nMgwXKOiO2YS1RtwHZLH4qS/+djuWyzJI8f7BZE6h?=
 =?us-ascii?Q?V7HrIYMzNjjTllpYicpGL5fBsPGQbqH3MW3vhFyVQtLoYFXFv/i106h5fwCu?=
 =?us-ascii?Q?ovSnb4OwVEJmHAJ3fYQLeBGDbczRa6hh165JRDlbwVtqoZ82RkAUlSdrRliV?=
 =?us-ascii?Q?SVWksxpXvjCHCx5S8MEt1ZRFi54y3hMloqjPvIffEthndCbQF0vL7LQsNP7j?=
 =?us-ascii?Q?GjYMPzAMeXX1y7JeeltCPedN6VGWhEMa4N+cWdM/wceszDocMIMP0upCx61n?=
 =?us-ascii?Q?mVRixu6qZVjId+4RHP3tERfTd5WVO5PByQMzpTz5jXpYaiUC079geatHjViR?=
 =?us-ascii?Q?Rpyp6w+DaKL4akDMy50=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a58913ed-1ac8-4c87-9a01-08ddd3d5f05d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 04:09:57.0572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MFU1onN1bzQ4w4E7Hq1aVtz7hi77p2xeS8Vcqc5K2GLv+2dPe/uLgNB7FhTdm1sg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6334
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AO/uRWaL0wpn4EilQk8Jw8DDgcdPzWMYUg3lLr9ld3w=;
 b=lMdSW1brzyx/rz/os4ybdnIMr2muNJcAiCE+ttGxlUX9W9HUfd0gtGzxI/PV6cSfr5Xh965YgHuqHQLcX1YBF3/NLDLTWzu+tV4F4CAHhE+zwlj5PivFupSUb/c36ck40E1I8ItBpko8BiXrwzYTJ6Exb4PVR/04v/nlHsJkA7k=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=lMdSW1br
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH] package/gcc-bare-metal: Add extra options
 to bare-metal gcc
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Jesse,

> Users may want to add extra options to the bare-metal gcc
> configuration, such as a default abi. Add a new option to
> allow this, similar to the existing one for the regular gcc.

> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Thank you for contributing to the bare-metal toolchain!

Regarding the default abi option, I just have two questions about that.

1. If you change the gcc default abi option, doesn't the newlib abi option
also need to change?

2. The abi names are different from arch to arch, so if we have a string of
bare-metal toolchains, this option will not work because a valid abi for one
arch will be invalid for another.  If you only need this config for the
default abi, could my multilib patch below be a solution for you?

https://patchwork.ozlabs.org/project/buildroot/patch/20250619154811.936265-1-neal.frager@amd.com/

> ---
> package/gcc-bare-metal/gcc-bare-metal.mk           | 3 ++-
> toolchain/toolchain-bare-metal-buildroot/Config.in | 8 ++++++++
> 2 files changed, 10 insertions(+), 1 deletion(-)

> diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
> index 17232a8ef1..e7290a11bf 100644
> --- a/package/gcc-bare-metal/gcc-bare-metal.mk
> +++ b/package/gcc-bare-metal/gcc-bare-metal.mk
> @@ -53,7 +53,8 @@ HOST_GCC_BARE_METAL_CONF_OPTS = \
>       --with-gmp=$(HOST_DIR) \
>       --with-mpc=$(HOST_DIR) \
>       --with-mpfr=$(HOST_DIR) \
> -     --with-isl=$(HOST_DIR)
> +     --with-isl=$(HOST_DIR) \
> +     $(call qstrip,$(BR2_EXTRA_GCC_BARE_METAL_CONF_OPTIONS))

> define HOST_GCC_BARE_METAL_CONFIGURE_CMDS
>       $(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
> diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
> index 19c97410c6..89b0a98fdd 100644
> --- a/toolchain/toolchain-bare-metal-buildroot/Config.in
> +++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
> @@ -12,6 +12,14 @@ config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
>         metal toolchain, use the following definition:
>         "microblazeel-buildroot-elf riscv32-buildroot-elf"

> +config BR2_EXTRA_GCC_BARE_METAL_CONF_OPTIONS

I believe the naming convention should be:
BR2_HOST_GCC_BARE_METAL_EXTRA_CONF_OPTIONS

This way all options have format BR2_<package_name>_<option_name>.

Also, since this option is specific to gcc-bare-metal and not the other
packages included by toolchain-bare-metal-buildroot, I think this option
would belong in a new file called:
../package/gcc-bare-metal/Config.in.host

instead of:
 ..toolchain/toolchain-bare-metal-buildroot/Config.in

> +     string "Additional bare-metal gcc options"
> +     default ""
> +     help
> +       Any additional bare-metal gcc configure options you
> +       may want to include. Affects al architecture tuples
> +       specified in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH.
> +
> source "package/newlib-bare-metal/Config.in"

> endif # BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
> --
> 2.49.0

Thanks again for contributing!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
