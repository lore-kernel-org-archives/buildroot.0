Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59579C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 08:40:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CC1C61078
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 08:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CC1C61078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aleksander.es
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03432400C9;
	Fri,  6 Aug 2021 08:40:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UfwZkcrRusQu; Fri,  6 Aug 2021 08:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD38F40111;
	Fri,  6 Aug 2021 08:40:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3481B1BF82F
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 08:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21F6740111
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 08:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sS-ELsVtd6QT for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 08:40:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA241400C9
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 08:40:01 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id 21so11108234oin.8
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 01:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aleksander-es.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aLIpIHib01leqS9CNmhBqI26Of3ARf3l5PDAdhRLQnk=;
 b=uR54OSmFTJ4Ow35zrmUxf4XHWBaUc4mDPUM2uVoDs/dTlh3+MZ3BusJ1fdsnDoQpa/
 /6Z2Kq0MfEzfOMXFZMNRiZwgWdrr725yJK+CsipMdPfQfoa9n2SLcFHTdlvtjF1vsaIM
 3QQArBgbq5BBMkVKvfuql+v+NbQK8GGG8OQxK4AHSacVrWJtS54hA4E0dsxnToPlN5jX
 8438UxTAPF9GGyT9ZzzhIw7Py0GDOu7DA6hm3/mx897yxTxrIGtlqGR+lEeviNXiZOYJ
 TMkQ9WMNqjyipXs/hs89PLqChmXEvFmsGWFGbYxFaE2zTSEN+EN1tB3xNjVyVado+V0d
 RhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aLIpIHib01leqS9CNmhBqI26Of3ARf3l5PDAdhRLQnk=;
 b=mNeSljnpiwfhNQs/uOy0buB6kPucuwwM3f59kelSwsYmmCO1m6kRS7rf/olwpMw8Ok
 2r3DrxlliguIglh8c7KgIWY2qfQq3RKD3qLuImjL7vtOX3IqU0eaQvawTVx8Y46+RPsU
 Ekv3zx1l/j4qw704UTl0Fgy6nPXouD4aVi/P/Nz/dAaXzxpG5ExgwDGua38/X9+TrwVE
 5t5lFAJ7qlKObY8lOedtI2KygS75N9VRynTZ/MUXoBNVIiCizqAYpYmk0HS2ZnPZaiLM
 HLbGmVIWLgXqzXk/MgrK5mfB7wvzLFCMgCoMRkE6hoY/RolHb+BKpBEDXgLaHicQUaSX
 Gxmw==
X-Gm-Message-State: AOAM533WaUBsL56+83ulLG5W4tOKD1F2TWy895M4TP6KqwnOCqzrRyem
 SmDcBTwqeen+qs0dAShsr2rxYjzyHjcTxqaTVjrWGg==
X-Google-Smtp-Source: ABdhPJzepn0Lj+QUVeevvVMmpK3X0xvg75i3ntNugG2TnEfI1YIvizlWQV5R/0fkN3QF+CufXOCa5yTrjPFJPnqlLps=
X-Received: by 2002:a54:4e8f:: with SMTP id c15mr14259267oiy.114.1628239200830; 
 Fri, 06 Aug 2021 01:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210806080117.14544-1-yegorslists@googlemail.com>
 <CAAP7uc+S=JmKWM8=hhgOvZycrLBOQfNbcA0bSPf5cfH+OmOdVw@mail.gmail.com>
In-Reply-To: <CAAP7uc+S=JmKWM8=hhgOvZycrLBOQfNbcA0bSPf5cfH+OmOdVw@mail.gmail.com>
From: Aleksander Morgado <aleksander@aleksander.es>
Date: Fri, 6 Aug 2021 10:39:49 +0200
Message-ID: <CAAP7uc+n76E3KJZBy_org3F8bi64j1wX8Dxvq1-q9KpywgpjXw@mail.gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
Subject: Re: [Buildroot] [PATCH] package/libqmi: bump to version 1.30.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Matt Weber <matthew.weber@collins.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

> > This release introduces meson build system support that fixes
> > gobject-intorspection issue with autotools.
> >
> > As meson files are only available in git, switch the location to
> > https://gitlab.freedesktop.org.
> >
> > Add support for bash-completion.
> >
> > Fixes:
> > http://autobuild.buildroot.net/results/c13877a5700445253900e312bc87904152be429a
> >
> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>
> Acked-by: Aleksander Morgado <aleksander@aleksander.es>
>

Wait, the -Dintrospection=false option is broken with meson :/
Working on a patch here, you may need to explicitly include it, sorry...
https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/merge_requests/278


> > ---
> >  package/libqmi/libqmi.hash |  2 +-
> >  package/libqmi/libqmi.mk   | 36 ++++++++++++++++++++----------------
> >  2 files changed, 21 insertions(+), 17 deletions(-)
> >
> > diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
> > index 0bfc63f4a4..0373bb4e75 100644
> > --- a/package/libqmi/libqmi.hash
> > +++ b/package/libqmi/libqmi.hash
> > @@ -1,4 +1,4 @@
> >  # Locally computed:
> >  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> >  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> > -sha256  cbb890893de1dee06ea5ebdac2d22f0469314a6f93f15f61f2f1206a1c9ae5fd  libqmi-1.28.6.tar.xz
> > +sha256  c0421684c12697c448077dd5c0a66c6f745deab3558af578e3f10307c8a0c564  libqmi-1.30.0.tar.gz
> > diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
> > index 7b1d76a0c1..05fd3ae9af 100644
> > --- a/package/libqmi/libqmi.mk
> > +++ b/package/libqmi/libqmi.mk
> > @@ -4,9 +4,8 @@
> >  #
> >  ################################################################################
> >
> > -LIBQMI_VERSION = 1.28.6
> > -LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
> > -LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
> > +LIBQMI_VERSION = 1.30.0
> > +LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
> >  LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
> >  LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
> >  LIBQMI_CPE_ID_VENDOR = libqmi_project
> > @@ -14,47 +13,52 @@ LIBQMI_INSTALL_STAGING = YES
> >
> >  LIBQMI_DEPENDENCIES = libglib2
> >
> > -LIBQMI_CONF_OPTS = --disable-Werror
> > -
> >  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> >  LIBQMI_DEPENDENCIES += gobject-introspection
> > -LIBQMI_CONF_OPTS += --enable-introspection
> > +LIBQMI_CONF_OPTS += -Dintrospection=true
> >  else
> > -LIBQMI_CONF_OPTS += --disable-introspection
> > +LIBQMI_CONF_OPTS += -Dintrospection=false
> >  endif
> >
> >  # if libgudev available, request udev support for a better
> >  # qmi-firmware-update experience
> >  ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
> >  LIBQMI_DEPENDENCIES += libgudev
> > -LIBQMI_CONF_OPTS += --with-udev
> > +LIBQMI_CONF_OPTS += -Dudev=true
> >  else
> > -LIBQMI_CONF_OPTS += --without-udev
> > +LIBQMI_CONF_OPTS += -Dudev=false
> >  endif
> >
> >  # if libmbim available, request QMI-over-MBIM support
> >  ifeq ($(BR2_PACKAGE_LIBMBIM),y)
> >  LIBQMI_DEPENDENCIES += libmbim
> > -LIBQMI_CONF_OPTS += --enable-mbim-qmux
> > +LIBQMI_CONF_OPTS += -Dmbim_qmux=true
> >  else
> > -LIBQMI_CONF_OPTS += --disable-mbim-qmux
> > +LIBQMI_CONF_OPTS += -Dmbim_qmux=false
> >  endif
> >
> >  # if libqrtr-glib available, enable support for QMI over QRTR
> >  ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
> >  LIBQMI_DEPENDENCIES += libqrtr-glib
> > -LIBQMI_CONF_OPTS += --enable-qrtr
> > +LIBQMI_CONF_OPTS += -Dqrtr=true
> >  else
> > -LIBQMI_CONF_OPTS += --disable-qrtr
> > +LIBQMI_CONF_OPTS += -Dqrtr=false
> >  endif
> >
> >  # if ModemManager available, enable MM runtime check in
> >  # qmi-firmware-update (note that we don't need to build-depend on
> >  # anything else)
> >  ifeq ($(BR2_PACKAGE_MODEM_MANAGER),y)
> > -LIBQMI_CONF_OPTS += --enable-mm-runtime-check
> > +LIBQMI_CONF_OPTS += -Dmm_runtime_check=true
> > +else
> > +LIBQMI_CONF_OPTS += -Dmm_runtime_check=false
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
> > +LIBQMI_DEPENDENCIES += bash-completion
> > +LIBQMI_CONF_OPTS += -Dbash_completion=true
> >  else
> > -LIBQMI_CONF_OPTS += --disable-mm-runtime-check
> > +LIBQMI_CONF_OPTS += -Dbash_completion=false
> >  endif
> >
> > -$(eval $(autotools-package))
> > +$(eval $(meson-package))
> > --
> > 2.17.0
> >
>
>
> --
> Aleksander
> https://aleksander.es



-- 
Aleksander
https://aleksander.es
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
