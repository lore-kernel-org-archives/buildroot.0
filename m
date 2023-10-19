Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80478CDB465
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 08:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2365F6FB0F;
	Thu, 19 Oct 2023 08:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2365F6FB0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cCblAlXV-d73; Thu, 19 Oct 2023 08:13:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59C256FB05;
	Thu, 19 Oct 2023 08:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59C256FB05
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6AC21BF45A
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 08:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F69A424D4
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 08:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F69A424D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hS6GNB969szu for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 08:13:16 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::620])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BCD7400C7
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 08:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BCD7400C7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MB/YrhuvzDkCFF5zumdi95jTZNlGJkqWRcjqXDaaKcG4N7kT33wkrXuMKRS3HqQ5eJdkDZtHAHsJk8RoSorRAsXeQ5CcJ0zdQsU+0Z/ep+Pb3O8EbYWZXbnrmRazbFKziSD0PFBZjy1asEd9amfsm5EytlBMRAiVoyaeqVPbZWCIC5QZqqYppC2aTmwn4B2nr6QaGYjlCa4UPf7ab4q+WonH4CSeaGdWiVFmOLfyM54IEIOHGxkR6xI1rAxstkTW1kjTgY4JOiAO9kfNG1sn+w7USsl6PlKY/1JQJ7oGCZpIBMIeubSR+6fHe/sHpdJ+8yZd+lTbdWHF9FUNbb93kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9FVOkql36IvfN4ijMDlLnfhj9MhHvXJ/Zl5e2cd/B0=;
 b=OFRUo2hfXxWfx5lcKdev+iSfNn5GtrMgeMdlR6VCgQQUmawX1cA9T1Dr12N+PXL8Xobr6PN8BbazBgOmiWeJ4pUEDEuHpN63mV6OSbodcj34088pCfkw6Kw3seAyUEqTaJUf18VFBSvIZsDFkQkbpNnKEhhfvcI0TdYhSsBpoC/XOp50vDskC92ZeHTbGN2YfJh8CeU8rY9Q7+ZFY3y0VZWhd8zFeS3c6mFPH3Ra3waNb+P3UYdW1295xrJtzb9EPJa69D0BzHKaTR+fxFVijF7q7usL9o59WxWTmoRkUojasmARE7fiA9eceUdMxDe5mZAP682gA+a2RlDAUozobQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ2PR12MB8133.namprd12.prod.outlook.com (2603:10b6:a03:4af::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Thu, 19 Oct
 2023 08:13:13 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::53cc:feb5:431:6de1]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::53cc:feb5:431:6de1%4]) with mapi id 15.20.6907.021; Thu, 19 Oct 2023
 08:13:12 +0000
To: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v4 04/10] toolchain/toolchain-bare-metal: new toolchain
Thread-Index: AQHZ7vmb81VA12+4i0uq6vMxKQbJh7BMVGUAgANOgZCAAThDgIAADHAAgAACDEA=
Date: Thu, 19 Oct 2023 08:13:12 +0000
Message-ID: <CH2PR12MB50046C9F9D697C71F37C5844F0D4A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230924151205.2099293-1-neal.frager@amd.com>
 <20230924151205.2099293-4-neal.frager@amd.com>
 <20231016121148.0eaec482@booty>
 <CH2PR12MB5004F0808389B4F67C1936A6F0D5A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231019091911.0ca4f8ce@booty>
 <MN0PR12MB6004F504CD8806653C2D244BA0D4A@MN0PR12MB6004.namprd12.prod.outlook.com>
In-Reply-To: <MN0PR12MB6004F504CD8806653C2D244BA0D4A@MN0PR12MB6004.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=e3eb0fcd-4a74-431b-8e73-55f6fad8075d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-10-19T08:03:14Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ2PR12MB8133:EE_
x-ms-office365-filtering-correlation-id: 1686a7e5-4717-4c30-9173-08dbd07b3cb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pwlpzWPUv97m7YrG5HbSxf88+H2nvjtKAxi22Ba3eUwL+ym5emfNqrFJ2QvjTaydCOlwW/d20FhV7MBBBsMEwVGP61AhyS7zhORZs/eqdMyEH6X3BF//1nlHY2GN1pnAx6786fuUbXUQEvnNPcIF0aBs6SaYhd/nGPyqUaPbcd+Njhln8t51BcZ8cIlL07bMhB9BpF8XDVwCaCgCXeGAP5pQdMMr5uZi+oUdEzxLtd/QRVlpGSLJ8YpL8x8XbUOl4ExXTFnG0/romtiNngCq8zJ2QBBU9Z6iOJu7qQhOjKhDKEyy0g183YMdbBpZPE8zhdVqxkb10l3wQOdoCKoNO9865953gwIkWe8igqCyGrr3g2pnkrzmQM69PSkf3V1PqnWR3dsHcUuOMEESlJzzVIN9Ua84yuj8DXJYU26YPrs7Bdm8lTLuEYy9TD9p14eRADu+VsB1gtJQ+f7/2WBLZt1T/pFHkX3QghWcGkKbJWhe90+Jeaw3VzFaAb/yHZEPZqrrAI8vRd+WeaNMPT7k59GydgU2pgoXiHUNFzmM5YSg8wiCf27cMUl27EpAKARobdh0PaIt2mIRtJ1tbYDcD5RNJr5c+QvqmLVMDyHAr2CdJg3k8QMU8bRQctF2T7Jm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(136003)(39860400002)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(55016003)(316002)(38100700002)(38070700005)(83380400001)(122000001)(7696005)(66476007)(64756008)(54906003)(2906002)(66556008)(66946007)(66446008)(33656002)(478600001)(76116006)(110136005)(9686003)(6506007)(86362001)(71200400001)(8936002)(41300700001)(52536014)(5660300002)(4326008)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8bVxCkmwtlLGO3WbC/GoHvtaRYhvhQ07YZvoniYR6lg7pqUOVsjxlQjuAiAL?=
 =?us-ascii?Q?SpZ1UHS4Gy2IjuAiL/ehaaJZ6zPzXQBxLIjq2ntj1huNBJRq7yC1F/O2w1ah?=
 =?us-ascii?Q?YZLc1aUv53DYqBScphDnfuBU0Q8iwjFVeTG9mTOjsyEm7mAVdBPgsg0xomvm?=
 =?us-ascii?Q?Y0dNn//TwaGutazd/xDt1zVHEwlB92O40943Uqz35kwEzgbRBNK9wWhiTKP7?=
 =?us-ascii?Q?Zu09NP22gKLTFrDK+6x/YZYNn1Thzkp6j9hOWRZq9QeJ/1aMd9o27npIlNOL?=
 =?us-ascii?Q?e1iGOaOPlXUBqCA23bIteoHgjMYKDoLTawGjlUwaW6XR/S1bieUY2n05tN40?=
 =?us-ascii?Q?eis820BnQYPG1dtFpcdN9TaTgUGWgR4Yolzp1Kw/AQYXy+j5oVD8p3da7j+a?=
 =?us-ascii?Q?9Yv5Vj9EkOIzEom+xkX0Fe9OzGI5Te5cwmYBgspPdshhX7lxm13DWqDOkxYs?=
 =?us-ascii?Q?NKEW2xVs47turE6X9f++DVwXvThgrZ2P9NEmHH/yN6uzfUlG+6Z0FO/tbS72?=
 =?us-ascii?Q?bZhtp9urTQpmKRLjxJp4p32lS+HLlskR8hglmV7UzMcnEZzOu7yO7qbpk3lI?=
 =?us-ascii?Q?gqIrHo/L49P5xRVzehkyyE+f4L1sPDVRWDkxdlTO1CGTIAuSQKijz8a1gu/k?=
 =?us-ascii?Q?7n7RXBtxLLFsIzi1Bm0tDdNrCgWqrf0r7i+drVNddP4b40yvA+5WQO0f4A0v?=
 =?us-ascii?Q?IXGRzikCdWTvRfpFuiuCwpbkMMu7DT+kx+6TUYSvI9uKZcq8jb5Z0L93SvJn?=
 =?us-ascii?Q?sFyQPKLBq1UeDdIJ6RXJUE4+P6id+kgQciqNwnhYQ6WOAb+QKOMsgXno9CTS?=
 =?us-ascii?Q?lDdm1qJAYX1auZzbFpwsBfcXo9pxwRcPW4HnBo8YeRFEXhR0Nm5NTrGlVYDN?=
 =?us-ascii?Q?gS2XyPl8kqKkVxCcatJ4zFK+x4xDBdhvL3RY7jbnahuNCsh1p3zZlu3Nhk8y?=
 =?us-ascii?Q?ZCTOlHxRlhzZ/pecPqHtn7S9e/ekFy1fih1btZ+GUfSTV7UVn/gLpjYgeoo3?=
 =?us-ascii?Q?dmCsCG95qGm8/vqhkzrkhRnqtsOwsO7nIV0E/7j2F52etldMb7s4k15maIW3?=
 =?us-ascii?Q?R7UxqY9cbPMb7b7DRCgnSoaChel2G6WyIDpo2A2lm1mCRbsoGfU1s/NuOXHU?=
 =?us-ascii?Q?/7pReL18EjOdubpQt8IcaePtPvCnDaYbiLZLedFexA4CKNGW4Q4Hylzalj1j?=
 =?us-ascii?Q?U9ryB0ez0O2YniB+ty0DbWL0zDH+VQ9ylb9Bd6YHM88kNmu34EMRj+YyxSfn?=
 =?us-ascii?Q?A5L6jfdmwiYOHrmEmJmu74HKArjCFHwXB5EWllcCnXaQqiBJDTxSLntluduj?=
 =?us-ascii?Q?b5OHOBigOY3E5HqOsTzbLYBsugW21jwH5AhMCnG8v34wCT/OpS49H26YW41W?=
 =?us-ascii?Q?pOMs4DvNd1F6OVvRjvbtEqvoc+PEX5yZw5gzA0fKpth6Q4ZCwz3Dg2zfMhvh?=
 =?us-ascii?Q?HDRQPIDk0w8WYhgEx7QVUAUOXXeGs9VYLlp9k3cDGmyVJSrihjkeiqdub0D9?=
 =?us-ascii?Q?jy8wRWj4XmjZVsa0aFfcYq7rrLznu/MtOea80++bziY1mpr36u8CuNdkVlYC?=
 =?us-ascii?Q?EpUVsexdedbWSuMkHToBfVxwO7USvyo9NvhH7jQOh5u5aDmc9b7pxF3OfmdI?=
 =?us-ascii?Q?zlMCjqntRMOj9ajEJ0p5dxc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1686a7e5-4717-4c30-9173-08dbd07b3cb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 08:13:12.0923 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fb+ehl3EeX8JJ31gEaaycv+CQoXBUzcFMzNnHRqdGEvK+YsAYXShTRFH+vf4YGrC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8133
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9FVOkql36IvfN4ijMDlLnfhj9MhHvXJ/Zl5e2cd/B0=;
 b=s+/lJZEtVOaGsJZNH37rbhxnzS4b5mBuhWuyVeEO18ox1aja8v/uPENQWWJ7CvYGvomx/33c6ZIjT2TmpShd3c05Agei0p6PYhFiy2CW/aE7bFhXVYb4wkj7oACpRzRuDsi3ft/nqXFR+KP1OkUQEvnmCwUb+U3DlM5dxwJeH9c=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=s+/lJZEt
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v4 04/10] toolchain/toolchain-bare-metal:
 new toolchain
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - General]

Hi Ibai, Luca,

> >
> > > This patch adds a new virtual package for adding a bare-metal
> > > toolchain to buildroot.  By default, this package will configure a
> > > bare-metal toolchain for the Xilinx microblaze little endian
> > > architecture.  When configured for the Xilinx microblaze
> > > architecture, this toolchain can be used to build the microblaze
> > > firmware
> applications for zynqmp and versal.
> > >
> > > Signed-off-by: Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
> > > Signed-off-by: Neal Frager <neal.frager@amd.com>
> > > ---
> > > V1->V2:
> > >  - adds select option to bring in all packages needed for
> > > toolchain-bare-metal
> > > V2->V3:
> > >  - no changes
> > > V3->V4:
> > >  - moved from package to toolchain directory
> > >  - improved menuconfig help comment
> > > ---
> > >  DEVELOPERS                                    |  2 ++
> > >  toolchain/Config.in                           |  1 +
> > >  toolchain/toolchain-bare-metal/Config.in      | 21 +++++++++++++++++++
> > >  .../toolchain-bare-metal.mk                   |  7 +++++++
> >
> > > I wonder whether this should be in
> > > toolchain/toolchain-bare-metal-toolchain to make room for a future
> toolchain/toolchain-bare-metal-external.
> >
> > What is the value of adding another toolchain in the name?
> >
> > For example:
> >
> > Internal Toolchains:
> > toolchain-bare-metal
> > toolchain-buildroot
> >
> > External Toolchains:
> > toolchain-bare-metal-external
> > toolchain-external
> >
> > If anything, I could argue that we should then rename
> > 'toolchain-external' to
> 'toolchain-buildroot-external'.
> >
> > That would give us the following:
> >
> > Internal Toolchains:
> > toolchain-bare-metal
> > toolchain-buildroot
> >
> > External Toolchains:
> > toolchain-bare-metal-external
> > toolchain-buildroot-external
> >
> > What do you think?
>
> My understanding of the current naming is that the "buildroot" suffix
> means "built by Buildroot as part of the build" while "external" means
> "already built, by whatever tool". Ans as such the toolchains are
> currently named toolchain- {buildroot,external}.
>
> Following this line of thought, the bare-metal toolchains would be
> called toolchain-bare-metal-{buildroot,external}.
>

> I agree with Luca's view on this.

Yes, this is indeed a clearer explanation.  I will move the toolchain to toolchain-bare-metal-buildroot to leave room for a future toolchain-bare-metal-external solution.

I will implement this in v6.  In the meantime, could you review v5 thoroughly to verify that nothing else requires a change?

Thank you for your review!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
