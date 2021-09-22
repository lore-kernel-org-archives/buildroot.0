Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFE3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 09:26:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7618460F6D
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 09:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7618460F6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2222A613A9;
	Wed, 22 Sep 2021 09:26:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HDC5exDRZlS6; Wed, 22 Sep 2021 09:26:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7362360B4F;
	Wed, 22 Sep 2021 09:26:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD3C51BF3E8
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 09:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA24983F12
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 09:26:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zXFin3sPWe79 for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 09:26:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A918183F00
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 09:26:16 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 976EFC0008;
 Wed, 22 Sep 2021 09:26:13 +0000 (UTC)
Date: Wed, 22 Sep 2021 11:26:12 +0200
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YUr2tAyv8EUXfMtg@kb-xps>
References: <20210921130326.3462783-1-kamel.bouhara@bootlin.com>
 <20210921130326.3462783-8-kamel.bouhara@bootlin.com>
 <20210921161624.7d4ec53f@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210921161624.7d4ec53f@windsurf>
Subject: Re: [Buildroot] [PATCH 7/8] package/kmscube: use libgbm virtual
 package
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On Tue, Sep 21, 2021 at 04:16:24PM +0200, Thomas Petazzoni wrote:
> Hello Kamel,
>
> On Tue, 21 Sep 2021 15:03:24 +0200
> Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:
>
> > From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> >
> > kmscube requires a libgbm implementation, which until now, only Mesa3D
> > was providing, so kmscube had a direct dependency on Mesa3D.
> >
> > However, now that we have a proper libgbm virtual package, so this
> > commit converts the kmscube package to use the libegl, libgbm and
> > libgles virtual packages.
> >
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> > [ Kamel : add dependency on recent libgbm ]
> > ---
> >  package/kmscube/Config.in  | 18 ++++++++++++++----
> >  package/kmscube/kmscube.mk |  3 ++-
> >  2 files changed, 16 insertions(+), 5 deletions(-)
> >
> > diff --git a/package/kmscube/Config.in b/package/kmscube/Config.in
> > index b6ad305bfb..d97b0f962e 100644
> > --- a/package/kmscube/Config.in
> > +++ b/package/kmscube/Config.in
> > @@ -1,9 +1,19 @@
> >  config BR2_PACKAGE_KMSCUBE
> >  	bool "kmscube"
> > -	# requires libgbm from mesa3d
> > -	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
> > -	depends on BR2_PACKAGE_MESA3D_OPENGL_ES
> > +	depends on BR2_PACKAGE_HAS_LIBEGL
> > +	depends on BR2_PACKAGE_HAS_LIBGBM
> > +	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_NAME_DESC
>
> This does not exist in your PATCH 2/8:
>
> +config BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
>
> +config BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
>
> Did you test this patch ?
>

I guess not since my last rebase, I'll do so for next version.

>
> > +comment "kmscube needs a toolchain w/ threads support"
> > +	depends on BR2_PACKAGE_HAS_LIBEGL
> > +	depends on BR2_PACKAGE_HAS_LIBGBM
> > +	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_NAME_DESC
> > +	depends on BR2_PACKAGE_HAS_LIBGLES
> > +	depends on !BR2_TOOLCHAIN_HAS_THREADS
>
> This should be:
>
> comment "kmscube needs EGL, GBM and OpenGL ES, and a toolchain w/ thread support"

OK.

>
> > diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
> > index 7b458376dc..26c82d2688 100644
> > --- a/package/kmscube/kmscube.mk
> > +++ b/package/kmscube/kmscube.mk
> > @@ -8,6 +8,7 @@ KMSCUBE_VERSION = 4660a7dca6512b6e658759d00cff7d4ad2a2059d
> >  KMSCUBE_SITE = https://gitlab.freedesktop.org/mesa/kmscube/-/archive/$(KMSCUBE_VERSION)
> >  KMSCUBE_LICENSE = MIT
> >  KMSCUBE_LICENSE_FILES = COPYING
> > -KMSCUBE_DEPENDENCIES = host-pkgconf mesa3d libdrm
> > +KMSCUBE_DEPENDENCIES = host-pkgconf libgles libegl libgbm libdrm
> > +KMSCUBE_AUTORECONF = YES
>
> Why is autoreconf being added here ? On a meson-package, this doesn't
> make much sense.

Indeed, I think it's a bad merge.

>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
