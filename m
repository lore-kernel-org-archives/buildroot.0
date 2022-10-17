Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C2EC4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 14:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56FE58250B;
	Mon, 17 Oct 2022 14:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56FE58250B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H7XfQSt7b2if; Mon, 17 Oct 2022 14:15:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9260081C58;
	Mon, 17 Oct 2022 14:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9260081C58
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B9F231BF2F2
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 14:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 875794010D
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 14:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 875794010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HJ5S3Jt9yCsl for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 14:15:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C660F400EF
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C660F400EF
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 14:15:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJ3Wto3CgtUqLIIZttAlhjiOOcTCuTntjIwk2phGkx+bgfAk7pLgjYTGtK6PqTCN/QcMiemZ24Bwo9fnM2lAp4caK8e9ZtoXYTfWBQcbBRBxCU+VCmBAA6rLZ9uX0ELF058LNkV5/9EnoDeA/qVLkdBl4S1uH/HJtJQ96kc8fRRBmowiNJopDEbR/8mFDfzZC71XquDzZo4gDw8btNh/NYKpnDPlRs9Oq485f+Azwb19NfpILbasLbmz1xZUzlpAWM58FN3dDPsVfSM5qXrIO0/iyLlx7E+zcTjjvpmIpbT/egjWaiGa9fcDv04mK+zHDHi9rC24srRg1qSu8OzZrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3m8SYOXKdV5H39kCZ6J3R5dFdXMsbEe98pyQAj/UvCE=;
 b=UvDyKMmi2eSeIucHvGPX2Kaw291bS1kgtm2KpCO6ZSsczMKHSwPQ4PkacVwJ/mHDAHhCaIHTNrXqR2QTpherYQJrzafuX/ANR73OUzXTGKJ7INUkrsmIjw9dVVQ1FbLYR7a8AJDThLn4MYWPl5zLgV1d+ttw2xZrRwIuSCRn3Z4q9Rh8VdNJHKtG19xRYBZzvQMfGLzPiCSr3Yx6ybOTlBnKchhDd+z6H5FTsEzCPkXKHW1w5YKvPfiJUOoqx5Glpu/VTT0J/9i986CnTcNaqCDifDKvahvwEBc62ezAUkiYPV4To0Ypb2W/vufjVBILKh9Q097wVhLTk5cv/9ydHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DS0PR12MB6581.namprd12.prod.outlook.com (2603:10b6:8:d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 14:15:16 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::eda2:578d:ad49:a8df]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::eda2:578d:ad49:a8df%4]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 14:15:16 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 1/2] configs/zynqmp_zcu102_defconfig: fix pmufw sw
 reset
Thread-Index: AQHY4fd4fOWrqP5fk0eqzs7qMZKr8q4SnUAAgAABkRA=
Date: Mon, 17 Oct 2022 14:15:16 +0000
Message-ID: <CH2PR12MB5004B9D704E2468C787578ACF0299@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221017071002.48266-1-neal.frager@amd.com>
 <20221017155854.48220785@booty>
In-Reply-To: <20221017155854.48220785@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DS0PR12MB6581:EE_
x-ms-office365-filtering-correlation-id: 50db3743-3a62-455d-66de-08dab04a03ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vQU65k+uyLhEytuNqeheyrYOhtP0HqxLJ2kKculycQtI/hCrGDTfUNCXpM2qC3h4I95Q/cD+rjQYtR17EPbUnc+2iHAWpqJYM9zfsxGBtoj80kUo7LI8LpoIEPfW1/48lq7WNqbWPqExUy5tffKQFJT3JPKdYtL1SC8c0xQzFzUAC/Fsikf/Kxn9WSa+kB+6RNAnAnjfpoCIeuYfqSNv94p5xmnvzIIeKPGNy56mYwhTie70rG2syfvj/RlgJeFE8E6zuhbMu60AnKMcuMjMI9ydnIgcB7n0V5xpJhQa3c64fMkEbcW6lSj43MgIDKg4eFe2ABuAvXA34ZyC/7V0C0UpvnGnN5QgLpwqbWZs9zXuIMQpsFE97f+xo2SCsKp/1wiAsoYNQUVk3EOCZ9ZnfTq8nr0Wpw44gmPvFD68iNGP4T+rXwxPTwT5pqG57Y4rA8KWwgyzNg8mYPQnA2UluVW0OCAbB7ZG59AkCkb55Rz73+bWXN65ext/2z0A40rPVUa0vZmF9G1fGQn42+0hYYRzOJUQqqgj1jYztMg26xXuarecA4d21/pnFV2orHo30vQNHOO2QnSsltHqPppSPXpuoOc5xj7Xvfyy+hsQ3lsPVyONj1BaESU0RdOzJEkn/FWH6hVx1MfmOJF+49Ngn6KCIgzNFZyDKbtFMzOfdpgS1EAHbUzmNzn86VenIZIIonv0mVxs90Lc1TNoAw3VOqaA9IfaYzA3+Z9xAP9gGPUdbTxqlzyjMNVitzmZqizfYmM7wEKgGKDSNL5AjzQLkah7m2ji1HhFvxAzT+UJmZ4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199015)(38100700002)(122000001)(71200400001)(38070700005)(478600001)(6916009)(54906003)(6506007)(7696005)(41300700001)(186003)(2906002)(316002)(64756008)(66476007)(66446008)(55016003)(86362001)(8676002)(4326008)(66946007)(66556008)(76116006)(8936002)(52536014)(33656002)(9686003)(5660300002)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iYBiTFK4UWbis3QzIdA95s1x0yQILNevDBrDhO9FuJXC90pD/3sPMKf+pio0?=
 =?us-ascii?Q?y+fo3iFZNTVaKkdd6jLVU6lS0zzvB9Jt0cVF2bvtg4BbVIEeKqZ71+3lYoEP?=
 =?us-ascii?Q?7dosE+8JvxFAkRiEArHuNf0kVKkTzUret4B8O/tbweyhV/0zjrIvAN79u5hm?=
 =?us-ascii?Q?eSiSq6hbZMDEd/8jChiJeV0noTkVImWr/Pz59QsDOR57oO3yc9mYdV8NnGEp?=
 =?us-ascii?Q?HYu9Ve6wCIlcqGSKq2ANBDGrSdkx+BRVrR91ndFGpsKg4qNqDb8X27jY+iM1?=
 =?us-ascii?Q?wUUCOIQc/HYGSA4unvUVP72oVjRnHyZDF3CCUPPh/e2eSEicHF9FC6j5OYCn?=
 =?us-ascii?Q?2a7ssSNlHXQtx2pqmhspXK2uZrg428+KLayZjGnDmAzZwgBhKYHdh3LBP7/r?=
 =?us-ascii?Q?w+G0kEmKZGoAIjrWSQDt8e8pF9VGQHquxk1TNuR/KSeJ+c4IBeY5ddIerB4B?=
 =?us-ascii?Q?GDviuy03IKs45LTkaIfacPqFC5ZHVNrl/3jckyHLdLJcbW7R/we4C8HIPhNo?=
 =?us-ascii?Q?0w09dFEyYs9IdTS8V7pJ4oz6xba5HD+QcbhtpCZHXzlsF6IlrNT2og5w8raf?=
 =?us-ascii?Q?nYTQVY58KhEy6/4FOKGV6561bEN37Q/3utnC3Md055pjc6n8UmBbsfFs7mDi?=
 =?us-ascii?Q?iKudODp+QqUsRSn1NYDh0dtGioDYhzgW7wNm0Iol7yLCZpeNF6pTaIQJUVGR?=
 =?us-ascii?Q?GnQkZBPN9VANsXwc1/AyY4x9eapwQ9+ksto7+zhS3GFksyB1LX5SF2IO3srD?=
 =?us-ascii?Q?HCzc/9E44JBNove009aPpHDF7FsYC5sCv2cU45BTnyYntvbMtOjkiIBhmsJS?=
 =?us-ascii?Q?3eMHlTnDN8rLN/dmgO1BZDR5DAfBvZW8poCjlI6TPFeVZ/zD27EOtpopoSEQ?=
 =?us-ascii?Q?D1EQ5fve7cU89xqKWfksOJOpIUMhWm+NItEkvyYucsWHeMayhovQNSIjn5Is?=
 =?us-ascii?Q?Q0bWjNTlH6Vjiti91M6+xizClOtOfz3Y6d26ayFTq5nBrJ6YOQDlAJPEEeSm?=
 =?us-ascii?Q?G6lOTiKYfTRneCBXI7uKS31V2kH95RTgEV5sjYW8dp3xPTfOAndiIZY+3A2w?=
 =?us-ascii?Q?LQtoK+jSjVZp3km+HNTVUDvARsZT7mb2N1r0exo5ez75Bw4pZmcAs9uavRXP?=
 =?us-ascii?Q?uNoWsMSkhGRqmEt4iIdtmiGewMZWRGmxKu/xwcmyBeTTkdL84PDXWpa1xkw7?=
 =?us-ascii?Q?Bk6YQrw3T2va7UytCz3ulgsPOshtl+W9p2p7Mh4zmA0Uyxn8lAZQoPewsiKO?=
 =?us-ascii?Q?k7QxIStBGqx4n92xCpGbghMXRlYS5lbuC4yb3zVnPBL0bbDJ4uL472ddm2BS?=
 =?us-ascii?Q?sBsQwwkcxxFyU0wpv2XEp4Zr0EJGx7/z0gqlwQ/TPAF1W1Z4QgXR31IRlK1w?=
 =?us-ascii?Q?7ncMWYnDqJFgTbky1VUzWrCHhWmjUXguOiBrzj+OYgaEvkDGI9mb8bOcNrAZ?=
 =?us-ascii?Q?JMt2oref7WGNZyJf6oG+G9cM/Vs4Wh+qH6G21ms5nBj0nQvcBTBnU/Hep6oX?=
 =?us-ascii?Q?b1/lBGuPs3nZmSKl0FBiLQUGYll1ZaiG+8bawMnMgvVEbtzwpvA+CztJ0g6J?=
 =?us-ascii?Q?gi1V4Jo/WT/c9+PQKJ+4rrX2pLt5J7CTZAcsnCnR4Virjt1gYl2jmhNi+2S6?=
 =?us-ascii?Q?xvmgRuF9yvFrKcY0ySiJm1s=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50db3743-3a62-455d-66de-08dab04a03ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 14:15:16.6279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xaFbE9ohQDBXQomE6yRJUBqRiDDay0aswol33CbHM3ysfS6ijb57oxge72Wdj98Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6581
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3m8SYOXKdV5H39kCZ6J3R5dFdXMsbEe98pyQAj/UvCE=;
 b=1q/Sbt4OtZxBvLKDTmg2lx1Uqy7ooYe/ZtV15wFYZwnwxzvNt2mqXRtK+4SvyWvgyP4Ux44OgYfRzwhKOkRH1LGthaFEvztXRB8Zf00wrARHS/2UDqXUv8aj4eDIBMQACnLG5oLyEi4rA7eKMyga/NxiEgAXidbGXBn5Orbhdus=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=1q/Sbt4O
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/2] configs/zynqmp_zcu102_defconfig: fix
 pmufw sw reset
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>, "Chaplin,
 Kris" <Kris.Chaplin@amd.com>, "wesley@sonifex.co.uk" <wesley@sonifex.co.uk>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> Why are these binaries board-specific? I thought this used to be only
> needed for the "community workflow" before U-Boot SPL was able to load
> a pmufw cfg object.

Good question!  I had a feeling you would ask this.

In the case of the zcu102, zcu104 and zcu106, the pmufw binary is not board specific.  The same pmufw binary will work on all 3 boards and even custom hardware, if a developer wants to use it unchanged.

But since the pmu reset gpios are customisable among other things, the kria kv260 actually uses a different pmufw configuration.  And developers may wish to modify the pmufw for their target as well.

Since the Xilinx firmware repository is created using the petalinux prebuilt images for each target hardware, we chose to have a pmufw.elf in each board directory to match what comes from the petalinux builds.

That said, since the Xilinx repository has a pmufw.elf in each individual board directory, I thought it would be cleaner for buildroot to use the pmufw.elf for each specific target.  Even if the zcu102 and zcu106 pmufw.elf binaries are really interchangeable.

What do you think?

Best regards,
Neal Frager
AMD

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
