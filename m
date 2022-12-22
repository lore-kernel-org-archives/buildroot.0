Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E99EC4332F
	for <buildroot@archiver.kernel.org>; Thu, 22 Dec 2022 14:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0F0482080;
	Thu, 22 Dec 2022 14:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0F0482080
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ihPnT62mS7m1; Thu, 22 Dec 2022 14:38:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39D7F81FC1;
	Thu, 22 Dec 2022 14:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39D7F81FC1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1BAB1BF4E2
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 14:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CBC54195C
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 14:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CBC54195C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JQOwKyTniXYW for <buildroot@lists.busybox.net>;
 Thu, 22 Dec 2022 14:37:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C49141754
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C49141754
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 14:37:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwcEzCK+cbMy0NU/imbkRGAKUoZ6SNvDXui7U95VY2u3kLhvrwg8Px8HlVM9j8Zw/Bdm3LS5T5bt6o4juI6iUw31aL5BtpS+rAp650q+g6JlKWOOLdKu44azsOct7CYd6XMFdUcZBErGf8q53QJOqv8w4U0tSHjvIaGoSkNTQ7Fc9EkyqelVRv52VGONp7ZyA/R6Wz6Ro6OZJALm+azYP7P9yc1l5FwdrI3Eq8H30Hke6/MJ9pQEgPeY4AgRxiIHBj05lP1wxIhIMUUownlpVQjkb+qT5bJrD8xZ9xDGK8XcXUV+sEdW43jWKFCMWt/22Lkk+mulGUgQjPAz57t/Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehmkxRQgJ1FtX5J8q1ASLS38rKogiPUPVTsE79K7gs4=;
 b=Z/6Atj65cYR9KEYX/g/kgl8qs1hBRGSgP+eBgilqT/9F+NnltHRk43WErYtmFCEK7+ygXugZjTypMR/eGDsTM2q+DrISfydMBtW4CixQobpNbRrWFz633jcWirqKA81XZAVzyJzGi0YvBDsJwGeZknJxENd1RnZFN1gzC8tBeXnj+b9NkdqZUFPy8dzHXQZJjRPR0RLREo/GJQBEVRJRLS6NHv1knQ+fJkhaOad/adnz/DkIQZjMQcMj5vwvGoabZYsxnaH1bido44UjW43TDLHZ7vFaPEl3iYs5+dVhCfyYde9Xxctt/L/gjCaSSFxFcHRM+r3ZW0Vf3Ckzowk0AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by BN9PR12MB5052.namprd12.prod.outlook.com (2603:10b6:408:135::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Thu, 22 Dec
 2022 14:37:52 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%4]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 14:37:52 +0000
To: "Maier, Brandon L                            Collins"
 <Brandon.Maier@collins.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [External] Re: [PATCH 1/1] boot/uboot/uboot.mk: support binary
 pm_cfg_obj
Thread-Index: AQHZDAYolIx6yte4nUeeBVq6Bchk4K5qAQIAgABnVoCAD6KEMA==
Date: Thu, 22 Dec 2022 14:37:52 +0000
Message-ID: <CH2PR12MB50049E8BC94D43962394656BF0E89@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221209194043.28673-1-brandon.maier@collins.com>
 <20221212103136.71c0a850@booty>
 <BN0P110MB16733493900DDC40600F15A2EBE29@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <BN0P110MB16733493900DDC40600F15A2EBE29@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|BN9PR12MB5052:EE_
x-ms-office365-filtering-correlation-id: 20b755d1-cf1a-4115-8280-08dae42a1b84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 83zAm+y7WuZFGp5996ZCISFc7PZ51ZX/4NZaTRcvj3OkiBMOYXtu48ZfCqKmv/8Skf0nPvp4kYG4pYVdIcRgu/yDMZ7khvCmhZ2qXe/hH6Y/sJeBQc/G+jeec0QuR/BBAN3PBv+2C1khbx0lEb9GXWMwCaTOZGP5JjFSLO2oEkSOJYhsmUbgdkvSuJ8B8RAeDggbVhQIQxzOFjn6sMjLFKuthQAhWqJ5K+UxeCv25IK9L6iIH4UQ/j3IhxUNTrCGJ8SEgKJig258Vo9NkcaDoS8RFiITp+LwjI9yNAjiXh5wSX4CAX0rRFPYRjnVlire1Vy3JWKgXth6MShyqIF3BDCWwx9fIc9g5Fvyj6JYjlY0QVvPWjcFu4uGvT2lQZu1kE7RDoB5VOryOJ98TE5I8+rVfVVzbADd3Fc4VYBU8aWyoBabDIchIaGGeNhN3/ms/EF75hR0jwhRkDONEhAkP3v3d++W7QPR75JydM/y/kZ2Ylz0YJKsYQUNHyOxiJPqsIXtP9FF4B51fhYJLZCFK1nitfjsdRWmCkbW8QJyaZ53kQHDMtiVWI08Ps9vax8yUfhJv0b5Ss1c99KyWGOeSAToIngipiEojmnrCratu01XeJhGX8Hzin8oeDaJGmtm1lnijQ7bQRuuXTS8cChgCdwOs6LO7DMMmEYGeyy164/uKsQv4Y1tCtZscUqBTqHySbYYa0bcOzyTjOzaXG33pQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(451199015)(8936002)(71200400001)(38100700002)(122000001)(83380400001)(9686003)(478600001)(26005)(7696005)(6506007)(186003)(33656002)(52536014)(66446008)(64756008)(4326008)(8676002)(66476007)(5660300002)(41300700001)(66556008)(316002)(86362001)(110136005)(54906003)(2906002)(66946007)(55016003)(76116006)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gajE1FRk43X/a4FUt818ZFTuAabMlqDz5vniS1pCDN2UyEmgLhUu2z7n7IrE?=
 =?us-ascii?Q?d2TjZ1laA0GHRNRX8AafrEMBEcZLy0vPdaT5T9c9pilMcwCMGrBVcMc1GYRU?=
 =?us-ascii?Q?HvJFi1lSmCjflfi77zvgusKqMnoGA98o+1YMo/z4luzoawtSA4+d27pT+7fg?=
 =?us-ascii?Q?pY/Gadb2sLWMmWPYa+mAbdR5McLwfVINZ1IlHixafSuccMumDsIPOfKAf/7v?=
 =?us-ascii?Q?0YjCzP0ZYYbccBHA4bXf4M9KhlllK7DT6IUeh9FBkX7UOaSGtkmBVJjl0JZA?=
 =?us-ascii?Q?YH2kl4CgyHbP33v+wpvnh9ivyXJglbLDkrY3R/U1MK9aSAUOLgzaCSL4N7YZ?=
 =?us-ascii?Q?3ZHJgzCGpZzyHJLrwoOB+OUKl+Vb/lUfdZ/lbZz2odHTx5ICQzAcAUIecs0y?=
 =?us-ascii?Q?qQ8R+rQrNRaRIkw4Nu8JgY6W8n9T955uq+ytuE+EUzlfvyCAH5knTCGGubrJ?=
 =?us-ascii?Q?p3085yLA1lUBTP3WVg1qekIbNM2NrnHT3qxMUACplYfRvZhoOeRRGCqbpf8j?=
 =?us-ascii?Q?aTQBB5zOYpR/FSKU99hANwm6sZ8E7Q5kE51oCT432a8ZbNkqlrFbBvfN3ADF?=
 =?us-ascii?Q?GUBzd1L/6i/+FHzhe/mEJ58O2hwx0ahsBgo/Uvz1+DrjRdtuXjKSl/EE2SPd?=
 =?us-ascii?Q?ztP83mHpqLsSrjQ65+YISTZCwvh94DcizuxCQVEICwkIFKk5GqJfxw2kRJEb?=
 =?us-ascii?Q?qLxRd8oxX6SFHmISB1dSPHiwDUIlIDmlsImrchRUuObdqv5EktcDfLLXo7i4?=
 =?us-ascii?Q?MzyGcQEUeJu9qdH7wlC/pQV9Army9ZvVH2RpXaWbGyllIYJzp1/z9+naSBwf?=
 =?us-ascii?Q?ETkN7oEdIfU/FiEH0gqi67lq4p9oZEu00SB3qRQd7WGb2UGs53obiAVwNSXB?=
 =?us-ascii?Q?stvlt6BSg6roH5TVA8j7nO46TTJSdsR4cfCqewYrMy7gTLylSMuQ5U5mdNgG?=
 =?us-ascii?Q?LEFnXr3R9oqPQG9jJHjosTP9zSAslyRkma3nFdvs2tcPwcFnoGn8YNGP7xrv?=
 =?us-ascii?Q?hSpaQU1FppfdjFxVGuwnuIGFJ3Opxpt5PPLLyQaLcFG8hlu8RcNgmovm0z+A?=
 =?us-ascii?Q?Rr99Cwl58eJc5e6zmMqyJrdE0/XRhAULxNeiSjyQeN4lB3BLyTEqKPUGIqv+?=
 =?us-ascii?Q?3O+88DcpGXzSx4guFXY/2YdOi4QGRRr/8HGV/B7a/sMsKoFdxdVpIEENwLsq?=
 =?us-ascii?Q?Xt9n1F/2CU1F5jjn38C/tCsWerc3yMT9BCHjo+TLmmQSgMwZMwU8MaP69OZ/?=
 =?us-ascii?Q?qiiRAfVdNtIvekDA0SSjTERqoZuUDPb5Sn9KQNLAyjOrxDACi4XgcL9aOU3v?=
 =?us-ascii?Q?ugkNl+Nlh5e0NoNkABco8LuqZkBduaD4T91Qzmvu6YxMBd++fNRFYSgNIYCk?=
 =?us-ascii?Q?8kW/ut5cONr6JcO6hQifEnLWmhQNmEptHOzB1mgVHu1hBLq02wrfFhW9ayfZ?=
 =?us-ascii?Q?OqKQ4g8zUe5HInCTWIOgQ+JgDxvAvJQwrNxgt2pm1irIjYnqzVWZah6KrayR?=
 =?us-ascii?Q?FdforXE1tJFg/Uts8v7KbBP9QxBLtK0hLb8rNUn1PjOFjU5LLaWdyVvFJHiE?=
 =?us-ascii?Q?dl8savS1LNN+PjhwWE4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b755d1-cf1a-4115-8280-08dae42a1b84
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2022 14:37:52.7149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IYTJPYvVdoySxktkPh+4dOdTJyTsZwvvKoFAtitOoxX4HfW+dO8hTRom3ta3L4qC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5052
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehmkxRQgJ1FtX5J8q1ASLS38rKogiPUPVTsE79K7gs4=;
 b=Flb5gd0VYUo7kn/EXrK45qrY4L7mO/RkuQY7T2TWqTqMh/GI20XQL19fCocLJYXTX15VjV8F1+gm21tIunu413MAJ3zgydyxiKmeM1icv7kVGTdxzFPrFFZjVuZSTne03ghyviAvlZhujcH1x8L9aOB2LrqHB4N3nG4eFI8vZIg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Flb5gd0V
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [External] Re: [PATCH 1/1] boot/uboot/uboot.mk:
 support binary pm_cfg_obj
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon, Luca,

> Can you describe a use case where this would be useful? While I 
> intuitively understand there _might_ be some, I cannot find any good 
> example based on my experience.
> 
> Building the pm_cfg_obj from source code is very easily done by 
> Buildroot, unlike building the PMUFW. Additionally one PMUFW binary 
> can be used on multiple zynqmp hardware, while the cfg obj is very 
> likely to change across different projects, and a somewhat readable 
> text file is way more understandable than a binary blob.
 
> One of our developers was having issues getting their pm_cfg_obj.c to compile with zynqmp_pm_cfg_obj_convert.py, so they decided to compile it manually instead. This patch set was the result when they asked why Buildroot wouldn't accept their bin file. However for our team this patch is now moot, as I ported your U-Boot fix for building Vivado 2021.x to their U-Boot and that fixed the issue ;)

> I decided to send this patch anyway, as I already tested it and it seems like a reasonable thing to support anyway.

As this patch is still pending, I thought I would change my neutral position on it.

At the moment, the defines and format of the pm_cfg_obj.c file could change from one Xilinx release to the next.  zynqmp should
be mature enough that these changes are minor, but even a single new define being added to the pm_cfg_obj.c could potentially 
break the zynqmp_pm_cfg_obj_convert.py.  Since users might use any version of the Xilinx tools with buildroot, there always could
be an issue as Brandon has experienced.

For this reason, I believe it is worth having the support for users to supply a pre-compiled pm_cfg_obj.bin, and I would like to see
Brandon's patch included in buildroot.

> 
> > This mimics changes done to the ZYNQMP_PMUFW which had a similar
> issue.
> 
> That is different: we now support two different binary formats, not 
> binary-vs-source, and detection is based on the file extension.
 
> I meant they are similar in the sense, they are both detecting based on file extension and then either preprocessing the file or passing it directly to U-Boot.

> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
