Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E77CECAAD4
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 12:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 994428144C;
	Mon, 29 Aug 2022 12:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 994428144C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8tIiul9XjHqn; Mon, 29 Aug 2022 12:51:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BC7E81428;
	Mon, 29 Aug 2022 12:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BC7E81428
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BF081BF33B
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 12:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 042A940B5E
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 12:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 042A940B5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wwLUauGzp380 for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 12:51:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFE3540484
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFE3540484
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 12:51:25 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 u9-20020a17090a1f0900b001fde6477464so1446850pja.4
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 05:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=alcujqm3LLIMFG8eu6Vd1WGW3yWcl0DDN693Z7hgWnM=;
 b=ND8HykhWB5Y4gMX1xZdzBMFXI09MS18g4YuLx0UpR06QtZXG8PIS34/Lnbyw+/87jm
 0cn+6sfLczZ9DFgUfS8WyOL/8B2lun+QFAmy5dcM+DTMEW1ogeG7fVcvP3Jaiwv6BKy2
 p4GUr/iiEdy5IQbAmI20hxxcHEDCtpK/Se00SjCTcAN3CTUG3WdF8qI1fHyDnFVWD7XU
 Jzj1xzZMX48tyaIofuNqY3TH07kQsFdSYlThPX8HLFfkQU0cdiFF1veGKR+ZK1IMQewj
 JM7UxH8lRRy9E5lZVyiC899hrbUW28/+D+NHmXzYZje9VmJ9EHB8fc9fG82CRYzSAb2j
 4aLg==
X-Gm-Message-State: ACgBeo1hyV8l+GkWgPgEJPK9vmDV/PFWj8VaOq6V9lVGFi3EFU+VHzF2
 6sBAKNkUvEINZ0kchXKikkZbcw==
X-Google-Smtp-Source: AA6agR7n+B5DViJD1LcOzIeEP1F7uHvmnZtDOT0/oucqTiYXIqEdIq7ItwOt73qU0Y0xkp5RO4/c4g==
X-Received: by 2002:a17:903:244c:b0:171:55cf:a930 with SMTP id
 l12-20020a170903244c00b0017155cfa930mr16596719pls.35.1661777485268; 
 Mon, 29 Aug 2022 05:51:25 -0700 (PDT)
Received: from p1g2 (2a01cb000f8924009b068b28497d15f3.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f89:2400:9b06:8b28:497d:15f3])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a17090a46c300b001fa80cde150sm6567993pjg.20.2022.08.29.05.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 05:51:24 -0700 (PDT)
Date: Mon, 29 Aug 2022 14:51:18 +0200
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <Ywy2Ro7fQtQ/lKUM@p1g2>
References: <20220824192604.2549356-8-chris.dimich@boundarydevices.com>
 <20220824192604.2549356-10-chris.dimich@boundarydevices.com>
 <20220828154432.GF2569@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220828154432.GF2569@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=alcujqm3LLIMFG8eu6Vd1WGW3yWcl0DDN693Z7hgWnM=;
 b=F91ANuVK15UiX6wylbpSm4lH3kpLc1hvt9aj+b+/F6AOQPEOn0BiOrFqmKrkJUsEGj
 NGRp2zrXtLa8qNjG+scN8N4DFBS/bsbJvi0cETNcNdx/kFu74TaGz7Y82CRgBG9yItV5
 dPotO7CNCGYcw+5rAYqtUOlgz3TIQdUZ7eQ0w=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=F91ANuVK
Subject: Re: [Buildroot] [PATCH 3/7]
 package/freescale-imx/kernel-module-imx-gpu-viv: bump to version 6.4.3.p4.2
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Sun, Aug 28, 2022 at 05:44:32PM +0200, Yann E. MORIN wrote:
> Chris, All,
> 
> On 2022-08-24 12:26 -0700, Chris Dimich spake thusly:
> > To match NXP 5.15.32-2.0.0 release.
> > 
> > Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
> > ---
> >  .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash    | 2 +-
> >  .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk      | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
> > index ee105ef82c..ccb28bc4f6 100644
> > --- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
> > +++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
> > @@ -1,3 +1,3 @@
> >  # locally computed
> > -sha256  257c6cd8b01cfb6543827cbeb78409e6a2ad4ae321891751dcea1abc47d89379  kernel-module-imx-gpu-viv-ae0f3be0b7240f11cca191a3e2bdd4a445ee46e5.tar.gz
> > +sha256  b816ab94b1d248cfc5fe5f6381422346c273d01760bb324303e0298e10bd46e2  kernel-module-imx-gpu-viv-82c6cb6c607424403b8d76805bb17e7be74292f6.tar.gz
> >  sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
> > diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
> > index 10505fdf17..f94890a438 100644
> > --- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
> > +++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >  
> > -KERNEL_MODULE_IMX_GPU_VIV_VERSION = ae0f3be0b7240f11cca191a3e2bdd4a445ee46e5
> > +KERNEL_MODULE_IMX_GPU_VIV_VERSION = 82c6cb6c607424403b8d76805bb17e7be74292f6 #6.4.3.p4.2
> 
> So not add a comment at the end of the line; this is known to cause
> issues in some situations, and we previously had to remove all of them
> in the past. Instead, just add such a comment just above the assignment;
> 
>     # Equivalent to 6.4.3.p4.2
>     KERNEL_MODULE_IMX_GPU_VIV_VERSION = 82c6cb6c607424403b8d76805bb17e7be74292f6
> 
> I also have some relatively minor concerns with this package (not
> specifically due to your change, but prompted by it):
> 
> The git repository does have tags with the corresponding versions, e.g.:
> 
>     https://github.com/Freescale/kernel-module-imx-gpu-viv/releases/tag/upstream%2F6.4.3.p4.2
> 
> which is tag "upstream/6.4.3.p4.2".
> 
> However, here's the corresponding graphlog:
> 
>     *   82c6cb6 (HEAD -> master, origin/master, origin/HEAD) Merge tag 'upstream/6.4.3.p4.2'
>     |\
>     | * c897a6c (tag: upstream/6.4.3.p4.2, origin/upstream) Import 6.4.3.p4.2 original version
>     * | a482c32 Merge tag 'upstream/6.4.3.p4.0'
>     |\|
>     | * 9c2d676 (tag: upstream/6.4.3.p4.0) Import 6.4.3.p4.0 original version
>     * | 5c7b884 Merge tag 'upstream/6.4.3.p2.4'
>     |\|
>     | * 410ce59 (tag: upstream/6.4.3.p2.4) Import 6.4.3.p2.4 original version
>     * | 5115a2b Merge tag 'upstream/6.4.3.p2.2'
>     |\|
>     | * e879a17 (tag: upstream/6.4.3.p2.2) Import 6.4.3.p2.2 original version
>     * | ae0f3be gc_hal_kernel_platform_imx.config: remove build time/user * macros
>     * | 20595cd Merge tag 'upstream/6.4.3.p2.0'
>     |\|
>     | * 8f1bf96 (tag: upstream/6.4.3.p2.0) Import 6.4.3.p2.0 original version
>     ...
> 
> So, basically, we are using the commits on the master branch, but all
> that differs from the corresponding tag is (by running:  git diff -p
> c897a6c..82c6cb6):
> 
>   - there is an added 'fscl' (or variation thereof, like '+fscl') in 4
>     locations, all appended to the version string;

'fslc' means that it is maintained by the community (fsl community) so
the purpose of that tag is to show we're building from the external
module source code from github/freescale (which is entirely maintained
by the community).

>   - there are two macros that are removed (specifically by ae0f3be).

Yes this is for Yocto builds in order not to break reproducibiliy of the
build/module.

> So, can't we use the tag instead of a sha1, and carry the patch from
> ae0f3be localy?

We could but this approach considers there's only that patch that
matters.
In the past, the community-maintained module had more features than the
driver from NXP, for instance it was supporting PREEMPT_RT when NXP
didn't [1]. But I agree both branches are now very close.
I don't have any strong feelings to be honest, whatever you think is
better for BR will do.

> Otherwise, Chris and Gary: could you add tags on the master branch,
> maybe?

We could add a tag on master if needed. Would need to run it by the
project maintainer (Otavio). Just let me know if you want to go that
route.

Regards,
Gary

[1] https://github.com/Freescale/kernel-module-imx-gpu-viv/commit/f73c35b0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
