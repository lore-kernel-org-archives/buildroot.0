Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE21C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 12:41:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8976B60F38
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 12:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8976B60F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aleksander.es
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FC1F400F6;
	Fri,  6 Aug 2021 12:41:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b8EcQBMK56rx; Fri,  6 Aug 2021 12:41:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C809F402E3;
	Fri,  6 Aug 2021 12:41:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49D401BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 12:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45167402E3
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 12:41:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7adA2Zb92LGw for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 12:41:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFC67400F6
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 12:41:11 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id x15so11877594oic.9
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 05:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aleksander-es.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xMZb2s98a4NPc5QU+qI2pNbDfGm2Obefq00Kjd5p880=;
 b=Pb/L8wrjxzCaEC0G4/hLGHPHOaAFk6uztdrPkHQ72Tk4OFVbpA/XB8nMnXEQaRKhLK
 oSubZuyqnUIKAyPvk0w/6NDqVemVgdmXeNDwtR8WU3tjsVEwZzv5UbEwzpkaoAMgqVeU
 7RiZxFVFd3bMP9iqTjs60mShjxO5IJ1S7bfFhG8atGEpdqtvzYjCeK0hRq1xI7Mb0C/i
 +dV9YfQ82p631YrTTRPGmJfWhzQOJpei3lF5y3JWMK99/hB+Th72jefSnjr/h6ycwemi
 BHcRVW/evI+QrNCI9C1DFT+rOVflWsUrifZsGaBvoOe802Ed2rEIvrrch+EH6VIRkrsi
 uZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xMZb2s98a4NPc5QU+qI2pNbDfGm2Obefq00Kjd5p880=;
 b=S0Wwl5wDWPrhyBUritryE8ERnAizLqiN3OXs7SKaQgMqmXEIaBOzmAwk22Mar1vxBy
 l45O52vEoL66w6ZVv+6DBqyLBWkOJpQVp0k2rZ6zV/Ee922lunj1ZXsbU6q0b9JgeYIR
 u4KOifcnCeeyOEIzH6N77TihPO12WbX5PHvgX/5Nn28I5Dceoccggq+uGAXUGlqYrxsy
 cUEhCT55QaAe9WvzAvNxHAASGhhbMoHt91To771wyFnASegCjCWAFd+KO/cS1JFAFpRh
 NdXi8oNlKW3hd2gGsu0G3UG1VxQI7Q5o00LZ4vPPPqZFQBg3N6gzDcoVn4cky2xI3FjS
 h3Lg==
X-Gm-Message-State: AOAM530RMcJERz6zdQNB06vLfW2H3y6z8aDe2/u0v2hvirIPUdwGgUr1
 xcqO29ZT1054C3e8ZqbqftsDfbiygD3gC/4kam2GVQ==
X-Google-Smtp-Source: ABdhPJwT7DZMC69HT22z5RIPG73K5oL5CF7UpB8mZzVAz2VJy++y4SyOOvq2JILJWnEWJrVvUmVWRp6p8Zeok9Xh2aM=
X-Received: by 2002:a54:4e8f:: with SMTP id c15mr14943328oiy.114.1628253670923; 
 Fri, 06 Aug 2021 05:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210806100144.12444-1-yegorslists@googlemail.com>
In-Reply-To: <20210806100144.12444-1-yegorslists@googlemail.com>
From: Aleksander Morgado <aleksander@aleksander.es>
Date: Fri, 6 Aug 2021 14:40:59 +0200
Message-ID: <CAAP7uc+YT1P0B6jPdF03XOC3bK+YMXm=2F2_5Gv3DG3os9He-g@mail.gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
Subject: Re: [Buildroot] [PATCH v2] package/libqmi: bump to version 1.30.0
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

On Fri, Aug 6, 2021 at 12:01 PM <yegorslists@googlemail.com> wrote:
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
> Add an upstream patch fixing the compilation without gobject-intorspection.
>
> Fixes:
> http://autobuild.buildroot.net/results/c13877a5700445253900e312bc87904152be429a
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Thanks!

Acked-by: Aleksander Morgado <aleksander@aleksander.es>

> ---
> Changes v1 -> v2:
>   - add a patch fixing the compilation without gobject-intorspection (Aleksander Morgado)
>
>  ...build-meson-fix-introspection-option.patch | 34 ++++++++++++++++++
>  package/libqmi/libqmi.hash                    |  2 +-
>  package/libqmi/libqmi.mk                      | 36 ++++++++++---------
>  3 files changed, 55 insertions(+), 17 deletions(-)
>  create mode 100644 package/libqmi/0001-build-meson-fix-introspection-option.patch
>
> diff --git a/package/libqmi/0001-build-meson-fix-introspection-option.patch b/package/libqmi/0001-build-meson-fix-introspection-option.patch
> new file mode 100644
> index 0000000000..8a409eaecc
> --- /dev/null
> +++ b/package/libqmi/0001-build-meson-fix-introspection-option.patch
> @@ -0,0 +1,34 @@
> +From bfb066419f288764edbade1e27e93a5dda59a5f4 Mon Sep 17 00:00:00 2001
> +From: Aleksander Morgado <aleksander@aleksander.es>
> +Date: Fri, 6 Aug 2021 10:32:22 +0200
> +Subject: [PATCH] build,meson: fix introspection option
> +
> +Using -Dintrospection=false would actually not disable it. There is no
> +longer an "auto" option for the introspection support, it will be
> +either enabled or disabled depending on what the user asks
> +for (default enabled).
> +
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + meson.build | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index b25bca57..d28e5601 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -218,7 +218,10 @@ version_conf.set10('QMI_QRTR_SUPPORTED', enable_qrtr)
> + version_conf.set10('QMI_RMNET_SUPPORTED', enable_rmnet)
> +
> + # introspection support
> +-enable_gir = dependency('gobject-introspection-1.0', version: '>= 0.9.6', required: get_option('introspection')).found()
> ++enable_gir = get_option('introspection')
> ++if enable_gir
> ++  dependency('gobject-introspection-1.0', version: '>= 0.9.6')
> ++endif
> +
> + random_number = qmi_minor_version + meson.version().split('.').get(1).to_int()
> +
> +--
> +2.17.0
> +
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
