Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D290C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 18:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16F4860FE9;
	Mon, 20 Jun 2022 18:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16F4860FE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cOOCCCSD1V8M; Mon, 20 Jun 2022 18:58:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0774260FE2;
	Mon, 20 Jun 2022 18:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0774260FE2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12A511BF28A
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 18:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C154C418C7
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 18:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C154C418C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dXOqUO3RxVhM for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 18:57:52 +0000 (UTC)
X-Greylist: delayed 00:15:41 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A68E4418BB
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0135.outbound.protection.office365.us [23.103.209.135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A68E4418BB
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 18:57:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=iNC/QRTzj6KlX6U6KYAEJYqmMGJsCHQ4LeyYsY12TadwRqxGWJqomAf23X8lPw4pRKPsrNkJ54H1dduIYNQ5bmlvdlKzLvfCIAfg52DAlbXY2X0uGqyXYWxnc/6fKRN1Au5z5wwmJsDklylIuPVPTv7YpTypFMaJcZRHJGEYmhGsqKwyv+3P83HvevMxqX687+SjQiCrZHBwO5PyUXqxcYgh17/X+01o2oYBODyKHYHYfPH2J7mP492uIn85o/v4ODvXiWIr34fNKavkE77k+VvCYF4SZXkKRMIwJyuxk1FTxMfQrZB9h7WTXLQ1LyLMESaJ3ta7tJp/TzXpFbkHKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmRRaN5JjZXGhZpprrW/MIpw0QraZUKBP4xCPVMPEMI=;
 b=WDUCzmeZve9jhGsVIJi7LbvWn1EPq8QVYB6rPORq0OtLEpfqGPiS1MKDo7zXhtXs4ToNeW/IfGjZ7YPzLenv9HPqQAX8xzJJugI/abqBoXyKhu/eA0ej+rWXl3vpWpN9kpZ+RZSaJYLRk4S1ZGiQT/3niOISEnre9Q1mtdczEyCavL7BROZC3OyeZGQf9YaBSnhqU3v8SImj8d5Huc1KgR/XQZEwj/z66zKChIGlHc+BppG48EnUGNdBB7H2t+NYLvG/u7iSM60U0jMS7PpwxG1+FvHMi451iLHy1rm/U6txzyIiQYM1kMCKlnVOEKNtZDr7XhYlDzHWrV4a79O3FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM (52.145.39.10) by
 BN0P110MB0968.NAMP110.PROD.OUTLOOK.COM (52.145.11.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.15; Mon, 20 Jun 2022 18:42:03 +0000
Received: from BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM
 ([fe80::486f:88bb:4a99:935]) by BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM
 ([fe80::486f:88bb:4a99:935%5]) with mapi id 15.20.5353.018; Mon, 20 Jun 2022
 18:42:03 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] - Re: [Buildroot] [PATCH 1/1] package/nvidia-driver:
 bump version to 390.151
Thread-Index: AQHYhMiOnDp72vQM006e/E1VvlJWtK1Ym2YAgAAFhpA=
Date: Mon, 20 Jun 2022 18:42:03 +0000
Message-ID: <BN0P110MB1609ADB6B8F4684057269D489FB09@BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM>
References: <20211104141910.1840914-1-vfazio@xes-inc.com>
 <20220620170940.513445-1-vfazio@xes-inc.com>
 <b1780ee7-29e4-715c-f305-1b2323a57350@mind.be>
In-Reply-To: <b1780ee7-29e4-715c-f305-1b2323a57350@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffb49ad8-01ef-41fb-b8cc-08da52ec91b6
x-ms-traffictypediagnostic: BN0P110MB0968:EE_
x-microsoft-antispam-prvs: <BN0P110MB09689D16A2D6A4B2F7B8E3DE9FB09@BN0P110MB0968.NAMP110.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E1O+s6E2LYu4Ir1u/Eq2gP9Sp+3kqZvGqf8k1E/3+sTovtcRaV1fx18rSsev9bMNiTbe4qRpYmLxBRxH/SpApLY0F7YGJZCaqazpEYkZtgKtwPc7ObG5omPVjsMwc7DvnKqC1u6pEkXUtFeXj0Cugrx7EYKe0D1/8QtQMx1ipPTf6XRy60t6Mjy9YvbrCx474K+/rnDtPCwlKev9rbOQHZt68Yj1PkKlZke0b+k2JAmP05iqPE9eCBW7N+OULK9iJhM4ulyG39EWKDUmOKmIHxIzLeFrb+ND5jjlx8JPMaNtfH+/ebpmxlhJpzqzUseFmpgF5nXCgVZhLZX5SzPIax6lRsHYcoV1KnyOwbaXcb6IOrn6qMZt81wN7ZsEIT7Yrkq2B6rX+bMguTKCGOKVdCBFJOKwnsu7o7fvGnhnQDuBXVr/4XvBIJA5lqEWpEy55nfdBRk6TkXflTvtZoh7yecv4U2r3lVv5fNr2eQJWZSo9HbkQOu+FE8F+hyyGOyhCQyz9pLcsIMRva1oy8SErjLpgAlJWifVnUdiCtuTgVHrOTmPzZJ8Kka/mtMjGjr8yNS9IVYF/q+R209EUEkwv8iHr1Wly2AI9yESNQmxrUe9nvR8CaeBntZsiQFhJJC3uvJ/YFTuZjoVk/Gl3lsvUj8efk34vptCS4KPrEFKamenw2ZyLLkteOgfiv7WFdiNdS3sdqqf3V+k9az6C36OD2ltFg9YNuROlvnXZXnJ/2w33Yxkd7N+QaUh98YjVivHwSpQGu28SXoP8+4Qxz+jKg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39830400003)(396003)(366004)(136003)(346002)(19625735003)(76116006)(508600001)(186003)(66946007)(66476007)(64756008)(4326008)(66556008)(2906002)(8676002)(33656002)(8936002)(83380400001)(9686003)(26005)(86362001)(6506007)(71200400001)(52536014)(966005)(5660300002)(41300700001)(66446008)(7696005)(53546011)(38100700002)(55016003)(110136005)(41320700001)(38070700005)(122000001)(41080700001)(15866825006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 87NYYYy4V7JXGPYRZPXVAOEa47/+nsHdSLNsFIXg+PRLTfxoa5tEiuLz8PC0NcFomHlhwq3GI7JbBfmWUwOPlE7EjgC6geHaYcV8VmEX1qqhb1+OQMnpb+Qee6ugT/lFAOxZuXWD/XvxJUgBaYxbP2RP/iX0edpadqtQyeoKZF75eAFCCg6D5/40K8xf6RD6JoF8JfNWhDwVffN8U9jYKOS8x+bTSa+yIePDlnI8z1zGYPeSwUeXDmLnm+Xp8rLKaSA5e0frYPcmEYzJ+v6Yumfl1mK34fg17JqcuuyDq3XRcA/wnuhb/KtLXxEgIn9hRrFX0kXAGjYDMgWdjSkRGYOf6yCEZZwy2wqPxx62GvjWPfJ2VCC/3pqupNV6KSxVhZwJbU0SuLsfUe2nvezgfohozh2nj4uvlAWlvfDbgOM=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb49ad8-01ef-41fb-b8cc-08da52ec91b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 18:42:03.6308 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB0968
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmRRaN5JjZXGhZpprrW/MIpw0QraZUKBP4xCPVMPEMI=;
 b=abaIQlZsSXIdqirefBOHtwigHQD1AGj4gj5d0FHplslnyMx4rmgYbBefx7/n3BBPWCjKDyLzw1FoRpDo1vFuD9o4sLaKJp/f4RBGzctlBdpdA4tj0/8SAyNTilXFXTHI+bpoi6RvFa5/ZbwmXCKGzHXShssDXyyOUG8+iE81hQkg6k1/KVCgoVqwgOOco3iWpUcEQkRKG0o4vRkSbrCa7P/sSjkBZb6YahLOBB/Wv9KpQqg1IIPcxHW0g3PJqeOKWhQ97xbrVGzuiyhGqdY+f4PPuzWA9Sv16hMH+ctPCWSmIDVYAdgprlwrSjtVJjq76UfXhiemGdLLjTOIcZwxOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=abaIQlZs
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - Re: [PATCH 1/1] package/nvidia-driver:
 bump version to 390.151
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout,

> -----Original Message-----
> From: Arnout Vandecappelle <arnout@mind.be>
> Sent: Monday, June 20, 2022 1:21 PM
> To: Vincent Fazio <vfazio@xes-inc.com>; buildroot@buildroot.org
> Cc: Yann E . MORIN <yann.morin.1998@free.fr>
> Subject: [External] - Re: [Buildroot] [PATCH 1/1] package/nvidia-driver: bump
> version to 390.151
> 
> 
> 
> On 20/06/2022 19:09, Vincent Fazio wrote:
> > Adds support for Linux kernel 5.17.
> >
> > Define IGNORE_CC_MISMATCH for kernel module builds to avoid an issue
> > where NVIDIA's `cc_version_check` in kernel/conftest.sh may falsely
> > detect a mismatch and fail due to matching on the pkgversion substring
> > of the GCC version string in the kernel's include/generated/compile.h.
> 
>   Shouldn't that part be done in a separate patch that can be applied to
> 2022.05.x and 2022.02.x? AFAIU, this error will happen even with the 5.4
> kernel
> that is supported by that version of nvidia-driver. Or doesn't it?

You're absolutely correct, I can split this into two patches and resubmit.

> 
>   Regards,
>   Arnout
> 
> >
> > Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> > ---
> >   package/nvidia-driver/nvidia-driver.hash | 4 ++--
> >   package/nvidia-driver/nvidia-driver.mk   | 3 ++-
> >   2 files changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-
> driver/nvidia-driver.hash
> > index 7f2248d0f9..6564b8e821 100644
> > --- a/package/nvidia-driver/nvidia-driver.hash
> > +++ b/package/nvidia-driver/nvidia-driver.hash
> > @@ -1,4 +1,4 @@
> >   # Locally computed
> > -sha256
> 51adb28f0ed4548f35a88a93ad6767ebd807fa14f418bf5e51a6d63a3ff7f275
> NVIDIA-Linux-x86-390.132.run
> > -sha256
> b6b4b8af37e78e026c9ebdf4a5c64ea412dfcb710931dd028c22dac228de659d
> NVIDIA-Linux-x86_64-390.132-no-compat32.run
> > +sha256
> 5226e4842044cffd9096deadaf68934c133da74e05b80ccd21236584b3afb1fc
> NVIDIA-Linux-x86-390.151.run
> > +sha256
> 6e4fd2258465f5d5527fe80abd46de925a30348b4a84658498a6d75caf42c47c
> NVIDIA-Linux-x86_64-390.151-no-compat32.run
> >   sha256
> bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526
> LICENSE
> > diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-
> driver/nvidia-driver.mk
> > index 54c2aa46d8..f1217b00aa 100644
> > --- a/package/nvidia-driver/nvidia-driver.mk
> > +++ b/package/nvidia-driver/nvidia-driver.mk
> > @@ -4,7 +4,7 @@
> >   #
> >
> ##########################################################
> ######################
> >
> > -NVIDIA_DRIVER_VERSION = 390.132
> > +NVIDIA_DRIVER_VERSION = 390.151
> >   NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
> >   NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-
> x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
> >   NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-
> $(NVIDIA_DRIVER_VERSION)$(if $(BR2_x86_64),-no-compat32).run
> > @@ -137,6 +137,7 @@ endif
> >   # because they don't recognise the usual variables set by the kernel
> >   # build system. We also need to tell them what modules to build.
> >   NVIDIA_DRIVER_MODULE_MAKE_OPTS = \
> > +     IGNORE_CC_MISMATCH=1 \
> >       NV_KERNEL_SOURCES="$(LINUX_DIR)" \
> >       NV_KERNEL_OUTPUT="$(LINUX_DIR)" \
> >       NV_KERNEL_MODULES="$(NVIDIA_DRIVER_MODULES)"
> CAUTION: This email originated from outside of the organization. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
