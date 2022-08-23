Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5353EC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 20:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D93984012B;
	Tue, 23 Aug 2022 20:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D93984012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NvYY5wqx0ZVD; Tue, 23 Aug 2022 20:48:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8DD3405D6;
	Tue, 23 Aug 2022 20:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8DD3405D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09A981BF5A8
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8D2A8142D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8D2A8142D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d3A2iS-FMvAE for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 20:48:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDB7481429
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDB7481429
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 20:48:16 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id w19so29781232ejc.7
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 13:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=3uRp1sHohFwwng0nRTk29SuMPtpvxHdVJs4hYPFVhwo=;
 b=l9FzGSQ5Lft2G9AlWILYqbK6bwnRBa0PNGW6NYMoOcxs6Y6OYvwP9yW6K1Z9jLnirD
 6zVOJUi6fhnvB88ZYxHTy4IKKPsr9n/a6fA/3NDb5qAaj4SwepHmeTzePSarEuJMzGAM
 pTvO2eA7tPU0++7g9DxO9yF8JEaIh37iIN8zdS4srkDsqQ+PY8V9gR0rTar2y96Davpr
 vmBz+UgZX8YiMaYnH19b53tHpnLDKJMNK6WbrbWFefY0vAYKhTdoLdWewtaotI8xHvuc
 Ha4IGsDJniDqNfzcQmLb+eJpNbpn/mrpb2QZNoG56gPZOspMFqgMu/TVHSMcEVLlcZkV
 7rmw==
X-Gm-Message-State: ACgBeo0otqJLuduUCkQtIB02UXqKYLUOa2TnJ1wg5ViahiP5KHhb8Rsa
 W/FmHdAqJsv6n17mDIWMq849rg==
X-Google-Smtp-Source: AA6agR54SILEQDrYh9SU84GnI4q3hk+Hku8DYPvCcqM1iAnaYi1WwmVEMTISSWdWv60TLpBFD9wTnA==
X-Received: by 2002:a17:907:d0a:b0:73d:95ee:2cf4 with SMTP id
 gn10-20020a1709070d0a00b0073d95ee2cf4mr876105ejc.250.1661287694865; 
 Tue, 23 Aug 2022 13:48:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a17090653c500b007305d408b3dsm307359ejo.78.2022.08.23.13.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 13:48:14 -0700 (PDT)
Message-ID: <aea5eb95-0596-bbe0-a57e-d5f8b60f6b1e@mind.be>
Date: Tue, 23 Aug 2022 22:48:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20220601210939.2350383-1-aperez@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220601210939.2350383-1-aperez@igalia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=3uRp1sHohFwwng0nRTk29SuMPtpvxHdVJs4hYPFVhwo=;
 b=Ol/59laptghaaJb+dUng0NlgF6tEhzRH5ae5I+0Iamy8/oCo87vNDif/uJeO/f1Mit
 PMWYfq3ZbTNwNl1Cy1JR41JzzI3x/QQSr+JozUODhqYgXCApk3gnr69vM42ityUxdIva
 WTT2W//tlrmBJsvstLQkaltd9wzBSS13m6ru42+9dJKDSEhST66SiE0/pVT30QE+9Jq0
 YlIK41lublHyNf/Cqo3qG6q+EW2Y+9RSh55aNuyLodYSRKUu70OXNHedA2oVW5Eaid3z
 Ir4W5L0JwpkYHY7cLbmDvkeggmHnS+5lyJL/8PsoQXyBAq5enxTQ/z3wcjipMEgDDStH
 oFkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ol/59lap
Subject: Re: [Buildroot] [PATCH 1/2] package: Add libmanette
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/06/2022 23:09, Adrian Perez de Castro wrote:
> libmanette is a library which provides a higher level interface to
> enumerate and make use of game controllers (gamepads, joysticks).
> WebKitGTK can use libmanette to expose controllers to web content,
> which will be enabled on a follow-up patch.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

  Applied both to next, after adding the kernel headers dependency and updating 
the dependency comments as indicated by Romain, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS                         |  1 +
>   package/Config.in                  |  1 +
>   package/libmanette/Config.in       | 15 +++++++++++
>   package/libmanette/libmanette.hash |  5 ++++
>   package/libmanette/libmanette.mk   | 42 ++++++++++++++++++++++++++++++
>   5 files changed, 64 insertions(+)
>   create mode 100644 package/libmanette/Config.in
>   create mode 100644 package/libmanette/libmanette.hash
>   create mode 100644 package/libmanette/libmanette.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 71cc3da6d7..740e9a3ca7 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -35,6 +35,7 @@ F:	package/bubblewrap/
>   F:	package/cage/
>   F:	package/cog/
>   F:	package/libepoxy/
> +F:	package/libmanette/
>   F:	package/libpsl/
>   F:	package/libwpe/
>   F:	package/webkitgtk/
> diff --git a/package/Config.in b/package/Config.in
> index 00f061015f..2242ad409e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -506,6 +506,7 @@ endmenu
>   	source "package/kbd/Config.in"
>   	source "package/lcdproc/Config.in"
>   	source "package/libiec61850/Config.in"
> +	source "package/libmanette/Config.in"
>   	source "package/libubootenv/Config.in"
>   	source "package/libuio/Config.in"
>   	source "package/linux-backports/Config.in"
> diff --git a/package/libmanette/Config.in b/package/libmanette/Config.in
> new file mode 100644
> index 0000000000..8297d8c7f4
> --- /dev/null
> +++ b/package/libmanette/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_LIBMANETTE
> +	bool "libmanette"
> +	depends on BR2_USE_WCHAR # gettext
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_LIBEVDEV
> +	select BR2_PACKAGE_LIBGLIB2
> +	help
> +	  GObject library which provides access to game controllers.
> +
> +	  https://gitlab.gnome.org/GNOME/libmanette
> +
> +comment "libmanette needs a toolchain w/ wchar, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libmanette/libmanette.hash b/package/libmanette/libmanette.hash
> new file mode 100644
> index 0000000000..96089f971a
> --- /dev/null
> +++ b/package/libmanette/libmanette.hash
> @@ -0,0 +1,5 @@
> +# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.6.sha256sum
> +sha256  63653259a821ec7d90d681e52e757e2219d462828c9d74b056a5f53267636bac  libmanette-0.2.6.tar.xz
> +
> +# Locally calculated
> +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/libmanette/libmanette.mk b/package/libmanette/libmanette.mk
> new file mode 100644
> index 0000000000..10f2b8a466
> --- /dev/null
> +++ b/package/libmanette/libmanette.mk
> @@ -0,0 +1,42 @@
> +################################################################################
> +#
> +# libmanette
> +#
> +################################################################################
> +
> +LIBMANETTE_VERSION_MAJOR = 0.2
> +LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).6
> +LIBMANETTE_SOURCE = libmanette-$(LIBMANETTE_VERSION).tar.xz
> +LIBMANETTE_SITE = https://download.gnome.org/sources/libmanette/$(LIBMANETTE_VERSION_MAJOR)
> +LIBMANETTE_LICENSE = LGPL-2.1+
> +LIBMANETTE_LICENSE_FILES = COPYING
> +LIBMANETTE_INSTALL_STAGING = YES
> +LIBMANETTE_DEPENDENCIES = \
> +	libevdev \
> +	libglib2 \
> +	$(TARGET_NLS_DEPENDENCIES)
> +
> +LIBMANETTE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
> +
> +LIBMANETTE_CONF_OPTS = \
> +	-Ddemos=false \
> +	-Dbuild-tests=false \
> +	-Dinstall-tests=false \
> +	-Ddoc=false \
> +	-Dvapi=false
> +
> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +LIBMANETTE_CONF_OPTS += -Dintrospection=true
> +LIBMANETTE_DEPENDENCIES += gobject-introspection
> +else
> +LIBMANETTE_CONF_OPTS += -Dintrospection=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
> +LIBMANETTE_CONF_OPTS += -Dgudev=enabled
> +LIBMANETTE_DEPENDENCIES += libgudev
> +else
> +LIBMANETTE_CONF_OPTS += -Dgudev=disabled
> +endif
> +
> +$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
