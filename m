Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F812C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 08:09:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7230760E52
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 08:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7230760E52
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aleksander.es
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EA7340394;
	Fri,  6 Aug 2021 08:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iCWFsvDaCVui; Fri,  6 Aug 2021 08:09:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5F6A4014D;
	Fri,  6 Aug 2021 08:09:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E6971BF82F
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 08:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B3F2605FF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 08:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aleksander-es.20150623.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gmw_v73lDUhC for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 08:08:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73088605C0
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 08:08:57 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 o2-20020a9d22020000b0290462f0ab0800so8039709ota.11
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 01:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aleksander-es.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n094H5z9qcrgsF/OQvuRC8bpNlZADxBAnhyGf5kjy3Q=;
 b=B5sBhBpTCZVijnpV1M7QA/TCUQkvZMtM1VxHZHwP23nZe7M4jMpY3EqGQHjB9z+4Nq
 pZQ9uDuvTedzImQoV2TcOZwLHVUJmzjFIUgecfdwHQtBi/cmN5BTdq12o/mZW2/ZBUdi
 3EtCm15xYw1tNsbcbdxyJf3/Qc8T40x0MxeQvxe1wWuvfav03XFuly3ObwWJzWgFKhjz
 9PfDR1rEyOgnlKC/djxUdFhJzD2c1qJMR/pjp+DG4++EoPtuxrr/ftLOs/cYchurvjaZ
 9ZlBkPLXmWkIRLI9auyGef98eBIP3na4tIJ4busFUt2MrNJJiNKf9OkPr26yK4HdF9Hu
 JEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n094H5z9qcrgsF/OQvuRC8bpNlZADxBAnhyGf5kjy3Q=;
 b=ejUADxdHUjP8ATL31lXZkJF68nMsbw3sx+WS/amFoHrGUZ9A4tR5pvRyIa0ZvgCIVH
 c3d2SEPj8VMhdsA8P9tziP2XVzYBbwiyFsexhabOlK4hR4Fvh9NQ1WEDEwqShCExRCWM
 Bhxb7CEDOkg0jPJX90aCdmvAK4f7t5rIdkvpi7oW3amvYY45T3a/vvZiAUTAQEjnIprW
 X1yb8qI9yYZjFXzTdWYJt9cEye9n0OA6wNt9PCGuObw7tRx3kAnm9CfYdksUgMAGIC1g
 1Mdm9b/WdB06Sq/UsC+xANKOXqdMZoRASBpQ855z3CjR4VJT0CriWh6lbD5w1/+Fg+d0
 Dzdg==
X-Gm-Message-State: AOAM5317h5LL8fIRR6UogMDg1b+iDUGjGKimv/jLTRpBftCmbqIYi8B6
 qgLHBHnENIYkkaC3fmRHG+UdOdDhbSaRI2bB735X8A==
X-Google-Smtp-Source: ABdhPJwLuvffBKjjKyN4N4UmASkS3kQf1dpAkPdWk5vIahMA+xlsQqJ4dPWVgnotM9VIYdVd66ObwIrh7zCr0EgTBBo=
X-Received: by 2002:a9d:6a93:: with SMTP id l19mr4310160otq.252.1628237337003; 
 Fri, 06 Aug 2021 01:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210806080117.14544-1-yegorslists@googlemail.com>
In-Reply-To: <20210806080117.14544-1-yegorslists@googlemail.com>
From: Aleksander Morgado <aleksander@aleksander.es>
Date: Fri, 6 Aug 2021 10:08:45 +0200
Message-ID: <CAAP7uc+S=JmKWM8=hhgOvZycrLBOQfNbcA0bSPf5cfH+OmOdVw@mail.gmail.com>
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

On Fri, Aug 6, 2021 at 10:01 AM <yegorslists@googlemail.com> wrote:
>
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> This release introduces meson build system support that fixes
> gobject-intorspection issue with autotools.
>
> As meson files are only available in git, switch the location to
> https://gitlab.freedesktop.org.
>
> Add support for bash-completion.
>
> Fixes:
> http://autobuild.buildroot.net/results/c13877a5700445253900e312bc87904152be429a
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Acked-by: Aleksander Morgado <aleksander@aleksander.es>

> ---
>  package/libqmi/libqmi.hash |  2 +-
>  package/libqmi/libqmi.mk   | 36 ++++++++++++++++++++----------------
>  2 files changed, 21 insertions(+), 17 deletions(-)
>
> diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
> index 0bfc63f4a4..0373bb4e75 100644
> --- a/package/libqmi/libqmi.hash
> +++ b/package/libqmi/libqmi.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> -sha256  cbb890893de1dee06ea5ebdac2d22f0469314a6f93f15f61f2f1206a1c9ae5fd  libqmi-1.28.6.tar.xz
> +sha256  c0421684c12697c448077dd5c0a66c6f745deab3558af578e3f10307c8a0c564  libqmi-1.30.0.tar.gz
> diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
> index 7b1d76a0c1..05fd3ae9af 100644
> --- a/package/libqmi/libqmi.mk
> +++ b/package/libqmi/libqmi.mk
> @@ -4,9 +4,8 @@
>  #
>  ################################################################################
>
> -LIBQMI_VERSION = 1.28.6
> -LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
> -LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
> +LIBQMI_VERSION = 1.30.0
> +LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
>  LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
>  LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
>  LIBQMI_CPE_ID_VENDOR = libqmi_project
> @@ -14,47 +13,52 @@ LIBQMI_INSTALL_STAGING = YES
>
>  LIBQMI_DEPENDENCIES = libglib2
>
> -LIBQMI_CONF_OPTS = --disable-Werror
> -
>  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
>  LIBQMI_DEPENDENCIES += gobject-introspection
> -LIBQMI_CONF_OPTS += --enable-introspection
> +LIBQMI_CONF_OPTS += -Dintrospection=true
>  else
> -LIBQMI_CONF_OPTS += --disable-introspection
> +LIBQMI_CONF_OPTS += -Dintrospection=false
>  endif
>
>  # if libgudev available, request udev support for a better
>  # qmi-firmware-update experience
>  ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
>  LIBQMI_DEPENDENCIES += libgudev
> -LIBQMI_CONF_OPTS += --with-udev
> +LIBQMI_CONF_OPTS += -Dudev=true
>  else
> -LIBQMI_CONF_OPTS += --without-udev
> +LIBQMI_CONF_OPTS += -Dudev=false
>  endif
>
>  # if libmbim available, request QMI-over-MBIM support
>  ifeq ($(BR2_PACKAGE_LIBMBIM),y)
>  LIBQMI_DEPENDENCIES += libmbim
> -LIBQMI_CONF_OPTS += --enable-mbim-qmux
> +LIBQMI_CONF_OPTS += -Dmbim_qmux=true
>  else
> -LIBQMI_CONF_OPTS += --disable-mbim-qmux
> +LIBQMI_CONF_OPTS += -Dmbim_qmux=false
>  endif
>
>  # if libqrtr-glib available, enable support for QMI over QRTR
>  ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
>  LIBQMI_DEPENDENCIES += libqrtr-glib
> -LIBQMI_CONF_OPTS += --enable-qrtr
> +LIBQMI_CONF_OPTS += -Dqrtr=true
>  else
> -LIBQMI_CONF_OPTS += --disable-qrtr
> +LIBQMI_CONF_OPTS += -Dqrtr=false
>  endif
>
>  # if ModemManager available, enable MM runtime check in
>  # qmi-firmware-update (note that we don't need to build-depend on
>  # anything else)
>  ifeq ($(BR2_PACKAGE_MODEM_MANAGER),y)
> -LIBQMI_CONF_OPTS += --enable-mm-runtime-check
> +LIBQMI_CONF_OPTS += -Dmm_runtime_check=true
> +else
> +LIBQMI_CONF_OPTS += -Dmm_runtime_check=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
> +LIBQMI_DEPENDENCIES += bash-completion
> +LIBQMI_CONF_OPTS += -Dbash_completion=true
>  else
> -LIBQMI_CONF_OPTS += --disable-mm-runtime-check
> +LIBQMI_CONF_OPTS += -Dbash_completion=false
>  endif
>
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
> --
> 2.17.0
>


-- 
Aleksander
https://aleksander.es
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
