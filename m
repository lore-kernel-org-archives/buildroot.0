Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B23BC001DE
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 04:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1361480C1D;
	Wed,  2 Aug 2023 04:06:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1361480C1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0NAzK5tjx5Q3; Wed,  2 Aug 2023 04:06:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 464FE81E2C;
	Wed,  2 Aug 2023 04:06:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 464FE81E2C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D79D1BF2F5
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 04:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A38D41835
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 04:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A38D41835
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f38CtsYsAXt7 for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 04:06:17 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::607])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EEE74401DF
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 04:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEE74401DF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQav6xW9UjLpzuD6h2vXTjDgTb8Td3WUiUCpGMH6ToAkn20nIFOrpO5HtsskVPNcSapcRCqmqUu4HyHlDLgzQon2feS6YJWjDe4Q9gM1ZFWjyNXOrL0aFVrmyfCp9Ei/n5ff+DEg0iUEBFQsJOuE4eAIQ5EbYAPotrBYqsIWHebTW+H+D2c0pzF5SPndmLPLY0VhbmXXVDB2GH66RyBNxwQuzXLyCvEwRj0hilFgz/PmHs+d/da3mX+5nCVh0dqFJTOEtNFPaXdb/Fla2zSErIwqQFNFNMkFeeDOm21cXQmFEmB1qHivZxJz6WR5qgxOwSEqF7o0vjTp6CDZgYpnCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYSAaxGRfxCwu+iRvsOAhtm9sf8pEoXh/E1jyYVL+q4=;
 b=akGL53ygWwoJ5W4pLRx3D/SCZb/NUeAKSIQtKAYFGubNWpBRKBZxfDZTR9hKCJQ52TY4ayQNzBW2gFQCqLFniZQU38wi8hpVSFPLY7Uxa8HjMBguEVeEvosZ71NYmI0Vn7ZZmP/uIOgiR/3kyKdXHMldJJha+389MAcXwl5+BfMhefXWhOtGMoWxKKeHAQdDiXK9j+bZ+xsdvYUC4HWAUyrbWivfa1/16g+lO+u8Ra9qSm7FljeuFQGO9WYZ7zU4lDg0dqcRqYzk7fGD2CYp/FSJI0AmO0n/HowmpILOcSOmSmceVBJGuvHjX7Jjwo67fj4uIAgd2+b7T05xeXc0/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by BY5PR12MB4886.namprd12.prod.outlook.com (2603:10b6:a03:1c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 04:06:08 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::c780:32e8:203:be20]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::c780:32e8:203:be20%2]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 04:06:08 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v2 1/2] board/zynqmp: fix atf build failure
Thread-Index: AQHZw8ZapoNqIvfPpU+T3FoWXDgxyq/V9eKAgABvd1A=
Date: Wed, 2 Aug 2023 04:06:08 +0000
Message-ID: <CH2PR12MB5004968340B1D11BB9483467F00BA@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230731154739.1371164-1-neal.frager@amd.com>
 <20230801232539.429bbebd@windsurf>
In-Reply-To: <20230801232539.429bbebd@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|BY5PR12MB4886:EE_
x-ms-office365-filtering-correlation-id: 8968c16c-07a1-4bc0-f809-08db930dccf6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: teNO0KVvVnB5ze0KB8c6ED2VNSQZ/PpZCLr2BimJ3hybXJvBFlfAyjHYAGdVChEihOVdvptYCfmaFrgmT2irjotnkgOahaO2FFs/T7M2cJIYiMmIwzn++k/l383atZJ8jDMqjPd7vc4/3D+TEdS9h8lKTp+L5QlcXyY1DDgUnoLWX5sHoCkOwiQbMFJpJf2Q30J8ybUiu2wDsJWkgDJmTbeU5O1NDscNhBwTZDS/QSWkPdGWNZBfFloZY+TWI8sLXIjC1jasze88/YU5DGCyHQgTKi7dyuDenlh1V984hz8+ZPrk1Oszz1jR8k1fLsuu+zS525NMryFmsGyHWuY7CMuwq7jpPE4z0bTJfox53Ci6DzB2xvFXREAYxKi9sABkX1udeTy8uFxrsueKL2dUfdW9oh8Oe/5FgpEZi4OjkECv3869QCWRcmiMgpbgUYTW+vBu6a7NhToVAQs9GD5exRhe3esTLS8qfK1XkNKj0aW60mHqMBAeYJGHO4U9/Xg4Qqao0c79PYisHKuz6hfuX2OYevPZ75KOoe9xuthUmd7G+47MW3SspgrR/tUQHX2r1r2aIi4M8SJ3rIOXSefxQzWJvKe+/TiWmnIlFPdYEbk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(451199021)(55016003)(86362001)(76116006)(66556008)(64756008)(66476007)(66446008)(66946007)(7696005)(6506007)(54906003)(122000001)(71200400001)(966005)(9686003)(33656002)(110136005)(186003)(38100700002)(478600001)(41300700001)(2906002)(8676002)(8936002)(5660300002)(52536014)(38070700005)(316002)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ApmuxqAiE9ACCvgkklAdFfw5rLvcNdqyQGDWEl5jT+1YdeL7V37vUmOZQ7Wn?=
 =?us-ascii?Q?+S3PQ6bepF9ECONljsQbdFS4rT7J7Fm29pRGllogmj01OKC6LGQH+j1qvZsw?=
 =?us-ascii?Q?yN45Gl0sNGa3SjNVBqK+rrIwFq1GvwKE7RVTvjMoIiS8GxkZoep5A280ApJJ?=
 =?us-ascii?Q?CyWrhvj9hHpM0l5hBKDnQCEnaF+ERnE9ET/rcY8DohaSqe5mIZ8N1NC0+89p?=
 =?us-ascii?Q?DtFOatE6PB6ATXSIiV6IIBkxjmyFfcTKZncqcKrl6LyvLopAWD3Lzl4NIEhs?=
 =?us-ascii?Q?VZW/BfiH8QX6UDf33hY7EVvJ/KyL4ll32mIiNnQ5fIVzwL9zbmr2ODykSTSB?=
 =?us-ascii?Q?cgykt6SJ5HKtQVCkCzB4QRZVOMIjVM/qD2OM1qsfbZPMjGEn0hovBWf00X1d?=
 =?us-ascii?Q?EoxpBLrtIiHwg6KeuYKLJK1fZmL86o8AdyslnoZf4OILnajrpEMr52Gq2TiL?=
 =?us-ascii?Q?PO9/zKla6iEhjFN5HV9xJH3aahIAp49EudULVIc6gKlCrTC0XVLdlQvFDO46?=
 =?us-ascii?Q?5vmtkQEjTTKmqM/hQqP6I4fCOkvmbweStizDbF9vOlXVmPGkEZWdb95xf9dv?=
 =?us-ascii?Q?erlyPRCdcHuU1N8+kyezQAgtY9W0B22h7JVbabC+lb154ZukRV9PsGlPG3la?=
 =?us-ascii?Q?blOailXUbTZxQsgOG2lD2H1oP3lHxCDtZmlK78TD2k1EQ8yBKOYUM+OSSSB8?=
 =?us-ascii?Q?Kf2vq8H0cj87BK/utUnQ7ai1JmpOJrFP5yLx45hvuVy2b1G/Q+dXBgbLeMJx?=
 =?us-ascii?Q?BsA9iz0UMSU+47CIbnD+5WAYT2C5wPFqtsR2TNNjIXyvZLWBBjqfHPoBxT/A?=
 =?us-ascii?Q?1Y0VBuGrKSsPB5nEeNMS4DppNHYqSjZwNL65cCq0m/DizobEZhaEjsgNG7Xy?=
 =?us-ascii?Q?Rb4U5EdPZg299yeAVf5PsDv2Bn+Psy2tTi++SkqwD6iPrZrYyI2WePUXRU21?=
 =?us-ascii?Q?dET7tJpPOaqjF5VeDx71d/yynTHefTROIJ9oQtUMijEbzD5xqNFerRQF5Dg7?=
 =?us-ascii?Q?ycwtu44XeN6VYSelZ4KGZ/2bmjNehl3jHyV4tkQIQ8rTcK9aat7hLSDqd4Rc?=
 =?us-ascii?Q?y6MJPKTWC/uUhJaHlDbWYeJYOwqsTFUpvFizMktPyt+XgbSn3Iln4u68ZcaV?=
 =?us-ascii?Q?0VX9M6fJokVZSynv5zv25OzvC14Me4rPC0CBoC2U364uEPKPHjNolQSIJnge?=
 =?us-ascii?Q?Iahi1hSdCon+ARLuA0EP5ysZpOYJJACKVa3PxJ55s429K05Fi8pVGGcTh0p1?=
 =?us-ascii?Q?psFK+DAaDW3xxFMZajiDeWJ/KcmeIqFrZaOT4ksmtnSpJcQg4f1gaNHw0HlZ?=
 =?us-ascii?Q?xda0zfKKKPXWn+JzKV1oJdEjQtjoNxt5hpte9T8zdZKdXsgi8+LFBrDJXIJ0?=
 =?us-ascii?Q?km33ivEq28M1y9ktszQ1R4xdSAiN+jPJz3h4v+zHx1TvVjt3qSmLAvp1AnAv?=
 =?us-ascii?Q?dkd63l2LQwa3ny/MF0Sz+ViCzMei914kzuJKRFhckkybqgNJ+x2+d20ra/Pm?=
 =?us-ascii?Q?KWgLA3ovI8UcXx0D3Aj71ZMFU1+f9uQXplX514epfo6ycVOlB9zOhCnKknaZ?=
 =?us-ascii?Q?l96373ihh1K8BDlBROM9H5avxLFMZLZbu7AroOa0xhW3SqT/gV0dXHp848lV?=
 =?us-ascii?Q?DINyodmCbkKVcDs71XHH3jE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8968c16c-07a1-4bc0-f809-08db930dccf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 04:06:08.5052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6++8aukeo0Hk40COdvvIZJLX9rPbhDiTRUosYizCsiKgo1ZI8XY9z61QGL05y0nm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4886
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYSAaxGRfxCwu+iRvsOAhtm9sf8pEoXh/E1jyYVL+q4=;
 b=3YdnVzC1I7nILh9++zEMadY6uv2hksH4Mp8dHfSKImQhqZvJUVogX67fKC42kJ0TJjp5x9+Li5BENmMuWse0g/HFdkSFZj03OYqI7+JVaC0F5dsRCZgZv6KXnFm6C3wpw6s7xt41anPTVL+8IS47m+d4ROwUIPUNqEmeinhPokA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3YdnVzC1
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/2] board/zynqmp: fix atf build failure
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

> Binutils 2.39 now warns when a segment has RXW permissions:
> https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb9991
> 2da01a6e8434126b8fac7aa75107
> 
> This causes the following build error:
> aarch64-buildroot-linux-gnu-ld: bl31.elf has a LOAD segment with RWX 
> permissions.
> 
> This patch applies the upstream boot/arm-trusted-firmware/v2.6 patch 
> already included with buildroot to solve the problem.
> 
> Fixes: https://developer.trustedfirmware.org/T996

> This Fixes: tag is not really useful. What we're interested in in the context of Buildroot is which Buildroot issue is being fixed. So I changed that to:

>    Fixes:
    
>      https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556414 (zynqmp_kria_kv260)
>      https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556417 (zynqmp_zcu102)
>      https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556420 (zynqmp_zcu106)
    
> when applying. Thanks!

Ok, thanks!  Noted for the future.

I have the same response for the versal vck190 patch as well.

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel engineering and training https://bootlin.com

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
