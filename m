Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364C6C52D71
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 09:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D91B78176E;
	Thu,  8 Aug 2024 09:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NAnl8w098WGj; Thu,  8 Aug 2024 09:10:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE1E58176F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE1E58176F;
	Thu,  8 Aug 2024 09:10:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F4381BF3F9
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 09:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99614408CF
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 09:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJF4JGWXv-_I for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 09:10:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::600;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 05E704062D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05E704062D
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::600])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05E704062D
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 09:10:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybQgplV9FQyDkCmeP9vZFlC6U5Bd7sUpTS4M+ZJ3QkrriR6tMEqDJYN/O+kRkmBCtvJToBD/waDXp+BEdJyZTj81Hh7w1pkgbamahlLughkuq6Kjj6RnPwd5HB+7rKTDXI4zhzcRewGSV+nUMmEXXf2FW7L540o0g+w9ZstoTYTVGDJFURqp3M/6lIHkCiyuL1gUGmca8XRB8Ko22HTD/jmA5vS5f6KaujPnpO1YFjlnLKFss4wICed8jpCiLllhXMF9QyWnVKXBHfjv0vhB50BAyVgKGGid94BJeo2QWfEdwugFpriREoaiH6VTE4d9SFFHco22rYRbio8675eUug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHtembm4rL5ukzW/QuMj/B5wjH8WBeQGiIwfo6dTi4I=;
 b=VVo9CSuqSpx2Rys3xUzarTC0xvReuWtSzmz5y20r8OqyWS4EN//4XPI+JzJeH/Bsu/Cla2SwyaxUtiyOuFcO21qoJeqVIWmnMHA+K6HnycK0Rq6ChFaJxEFztyz6M8fgBrnBuMy7EXauqUUWAbc/exNUwJNqIJaTDoxmssimhmBDeiFxzfVNXW2iNwGNDPdW7Y//7MP+/TPJgJX0873Amurl98upQFaVLfobHMgZwqjacDCgUrLlRLvRJIX5f07Ayx35eDwiu2JdTGQCBUNHWw6lSbMFRUKAFzaSdF3dyfn8KjXXKJ5FW1fekty6LyY1utduDz9VymGMiYq4psfMig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM4PR12MB6423.namprd12.prod.outlook.com (2603:10b6:8:bd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.13; Thu, 8 Aug 2024 09:10:46 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7849.014; Thu, 8 Aug 2024
 09:10:46 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v1 1/5] board/xilinx/patches/linux: add linux
 6.6.40 hash
Thread-Index: AQHa6Li55XsRTBDAbUymX+ME1mR6K7IbuDoAgAAhcgCAAAEVgIABOOAA
Date: Thu, 8 Aug 2024 09:10:45 +0000
Message-ID: <CH2PR12MB5004FF40F90027519556EDA6F0B92@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240807105813.3844985-1-neal.frager@amd.com>
 <20240807142506.45de55d8@windsurf>
 <CH2PR12MB5004D0D6722981F95A9C6D17F0B82@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20240807162841.52d0481d@windsurf>
In-Reply-To: <20240807162841.52d0481d@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DM4PR12MB6423:EE_
x-ms-office365-filtering-correlation-id: a71056a0-c94f-4695-e755-08dcb789fcd7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?iOXXdfA4/ov50iCYoKqp2SLXM5doqTVEqH2+80DAHCpZjnn10d2XIrEfEnyH?=
 =?us-ascii?Q?P8nAByk82KnEgRNcRUbOxtmhKDfJOG3siSDWCDbJLKLqN5/K4YXTZ0tYFErk?=
 =?us-ascii?Q?U/onmBoGWKF0mQbw7gBioO5BqSzgzrcjotExqA2nf+LUTfeRsD5DJ0uJ1GL7?=
 =?us-ascii?Q?Vs3raQpXRRooUKtw5uxIeo9V+6LHJqTvF44xSygwLKGpBqsQKVO5gmoFDZhs?=
 =?us-ascii?Q?ksZCU9X19VIAiNT/qP/oLiOcjp2RhHYRwKdiXy04SqHa5KCLe1wKxz+Xkx1Y?=
 =?us-ascii?Q?o1z8fnWxKJSxhQbLEVda2XjJH3uVwDczpHBwGMYopbq2X3FcwFNwvybmo1bV?=
 =?us-ascii?Q?fG2trITm/vdklCfvNHNxgMNC94LwPOwGh/uwkKBR+MbdFJfptCYi25YdESib?=
 =?us-ascii?Q?14mRrZLVZDrKvaFCcrl2YnB7I+Q5+aDapgzyoMBWxgsojIxux0ZqjCJFqAHD?=
 =?us-ascii?Q?4BSaWJEOL5kba6+Ayy1vMVCtFEKVAHW1m8n0Iht31GKYd7B5TBxCvDMxRtlo?=
 =?us-ascii?Q?zU6EhUqKuzJFWPZg3AKKPReRGDtTtuGJrrv4QaRg8fdwwy6QfUrCuRTLGIys?=
 =?us-ascii?Q?xS8lIxj1AGhw9p2sCkuPm7J3UpyrlNF1rNziqQKmzbikH3HZIKNymxz0U97J?=
 =?us-ascii?Q?AwTZO2yS4BMy46KfKuOESXSiDojS74FTXTm+8tKmNK8cDJr75fKSFnZCzlAR?=
 =?us-ascii?Q?NmWSHKNo2iksBeZcV2gywUNP3pAeYoXR/VsV/piKfw/tPqo3SOFurG8tviJv?=
 =?us-ascii?Q?WtGgaDZJKNc6bCYOKK9y7+GnNtC5CGB6McLeQ8KZHjO7XKTVR/3S2ErnhUOe?=
 =?us-ascii?Q?EBUVBq5Mvg74nPb2Uv1lPM85V4knFFewsrPFlWfogRp8QcN5sMkusVNC/stu?=
 =?us-ascii?Q?jyXQ27vD/Tg9oj2qFvGkWlb6cL/sH6PkXBXSIDFE756JJpMqKwgW661SZlNn?=
 =?us-ascii?Q?oHhz2SI45dy/qgolu3TE1PdRMb2Y7nMH44qNcWivg4AFGldJQ3eFkOZvThFj?=
 =?us-ascii?Q?u8tbu5UsUwxZSJ/Je+vLElIWSLVWHRg5qEaESOtEhbS5xDfyJpLAmh0zc3QW?=
 =?us-ascii?Q?CwZC3foDkcCw9Kt44SLNxgYx5nANoxCTCG7+Knrz9vSStx6pDmlvu3kxIPzs?=
 =?us-ascii?Q?FbvaduW0D4Qjfd+soExsk949WWNNHOA2HPsSLdIQRbHU3cxe2u1O67uD0aUM?=
 =?us-ascii?Q?aF5hhM3tODeDeiCTm/P/0xguWaMp2BR5gN2Oa2Q3UZ/RPsw9+38SZfCw4ZM7?=
 =?us-ascii?Q?+3ldqGGzwDYjU7PdmeN2GxEVQE/b7WAkqOkWWs1GRmkBXqpNaac1FWynXuSi?=
 =?us-ascii?Q?fCqxdCDFL2hikMTEIo5nua5meY+cYL4BJTm5+zNy8KUwHzWZh5eIUIHm9HzV?=
 =?us-ascii?Q?JTfntZYrhN3hX7UHKc/BgAvmLPeN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xZvz05Hen1mg9Cyu17Wox5ADLGMQ0dL9i9kHKbJnzEjKJDNzZFFnKsy5lqUx?=
 =?us-ascii?Q?UZ6teTnElIfySIiAgYO2yD9hmnYvL1E7P6rX8p3rnMsMZxX11BJf+BmgbHER?=
 =?us-ascii?Q?EzjxH0HTRz7143rSgHPHW0XArL4YRUyZlv7D8ul3FNfXyNOzQh1gHdMNiYp1?=
 =?us-ascii?Q?EOljqNcrkyeGEu0ugleuWMFukUTtrvFSZoCwxPP1HJZ91/qKnhkNSGEXOJf1?=
 =?us-ascii?Q?gV1DU3NYWa6MEJnhU40DhPN61SfWR6vJIl84ClBzOMXIPVUvh1wi7DXKlnul?=
 =?us-ascii?Q?zVCcMMPaEF2xSWVz9SYPXgyWqGvqlorMg3wGdEpWvhPl5eWkjNM+8ZK0SjKi?=
 =?us-ascii?Q?gcQm/iQNkQeSPlIBkzbjoXU8eQdMYcxD11e2YVNttSkTO+wYlYDMABsc4vlx?=
 =?us-ascii?Q?03oIItQKSKJzW+r1q6KjsH8BascQRtRgJfF68F8BehxMzDlhYizaBNtg1UPo?=
 =?us-ascii?Q?erdg30LYXi+ww/IfikljCx8UOIwVKcW2G58dm7goIH8IZIw5vNX60XF6fr/1?=
 =?us-ascii?Q?Spe6EPHTLbNOMkWxFonbldrJnnM9jmUivgChKIZRpCxesCfvtxg7usMLoOa9?=
 =?us-ascii?Q?p+I1wnk8TR5meVyn9BMy6znIFAwS3dDfyZZh7UEdIXdlvrGQcQzEQizfDAXu?=
 =?us-ascii?Q?kIIIdNoDoMsWU/WkNmeFpZwbbwwi6A6JafXupEr83Qe1er+GTZJXp2umF2Xy?=
 =?us-ascii?Q?qTAcMqLTTumV+0oGcODNGhFboKcfg8sb/cMwB/XCpwQCBbIQXRVbp6WVi5D7?=
 =?us-ascii?Q?NY2ibN76a9X1RH7V73MXhzck+bPV42/Cj5zBQAYupsEYbBQhDMSwRY3Jneat?=
 =?us-ascii?Q?uQh/zj/P4lTDLrtoWomHxtfrJPp+iIJzCb/rv0LWZhb4vn9YuLTSHLEqB7g+?=
 =?us-ascii?Q?KUkKsus4P7LFup6LRcpE9yF2J0pg+2Njxu4VC4Qgj+M8eGrxD3BP+MPS+frM?=
 =?us-ascii?Q?lYhTPrX4AEjVTTVFe+PgAqN1IggGHBgxofkwkUrAVSYZpyKNMOpfXSSev3Xo?=
 =?us-ascii?Q?sdxVUe2gErKJ4oVk7kBaBgG/EdHbdf11li/REtdil9zKZIY57ddpyRTNc/ZN?=
 =?us-ascii?Q?25dEg9aXABbTMMEAwjcJkefe1VaoiFAFhhkIgLEb5YgLA7KO0GE5uumYZZ+H?=
 =?us-ascii?Q?tvDwLasC0goitHbJhqdcZUlvgvsZxLs8k/ACQJdzKplSz2+kiCEyilOr1RQW?=
 =?us-ascii?Q?WG9QxEY8VWc3hmNQlFP7BujASopnPe0VDu9nscqzags/Gg//EkRKvuI8Jt3O?=
 =?us-ascii?Q?K3kpLRrkbW/+a0h/UJ8szZqjA6yzO81hnAd+ScebiNxHQuQslGpuokSModHx?=
 =?us-ascii?Q?+YbbGmIg67F7A/bsKttgbq2V+Dqnl7ylom7l8d0Np7ljF6zcWzPaLf3yPc/+?=
 =?us-ascii?Q?44TvapyfeQ7hbrPjvLc7M8maG3uAH/eVqL2iA+wtWAqypeDHTXhsptblG5Pe?=
 =?us-ascii?Q?ghQweDAGIeZdb6QeSv7NUwWLKe+CKSfYrFYM9S9kc/5XzpdLxvafU1O0Gd5R?=
 =?us-ascii?Q?SYuk4pUtqNJBDExvy3uOdw6QSy0GFWdJLSZYddtkEQrvx5ptYaqqtcLFfjUr?=
 =?us-ascii?Q?rhqXqz3Scv2wG9uAvNo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a71056a0-c94f-4695-e755-08dcb789fcd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 09:10:45.9915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vb8QiyWM4UeNYPSVaB9Ahf2Uodb0y20P5yXDWB3Xnm8YIyAKu7ddF8Qt4O3GxyTf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6423
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHtembm4rL5ukzW/QuMj/B5wjH8WBeQGiIwfo6dTi4I=;
 b=3E9GGQYjM80L0WLrblXC7jOlOm6Zm41G4KYsry1Xxya9G7cLC8oPkY8KnwaLqBzWJQq/WYEAlx0SUbi3f/UhfCgrOkwfUDDYLFkwkkitGtqijz94znuinY9oYE0d13084Kzlt4pGO0gS291IrujqbJKK/Vu3ScInX8z+pyp7MYY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3E9GGQYj
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/5] board/xilinx/patches/linux: add
 linux 6.6.40 hash
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> From my view, it is best to keep the shared hash files since there are now 12
> xilinx defconfigs using this and soon to be 13.
> 
> Since it only requires a single line change in the defconfig files, I will
> squash this into a single patch that updates all 12 defconfigs to Linux 6.6.40.

> But are you able to test that those 12 (soon 13) defconfigs all build
> and boot fine when doing such updates to all defconfigs at the same time?

We have a better solution now.  I got our team to re-do the release tag for
Linux 6.6.40, so that all the needed patches are included now.

https://github.com/Xilinx/linux-xlnx/commits/xlnx_rebase_v6.6_LTS_merge_6.6.40/

Now we no longer need to add the patch to the buildroot source tree.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
