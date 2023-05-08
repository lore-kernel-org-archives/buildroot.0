Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E23C77B7F
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 14:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48108403C7;
	Mon,  8 May 2023 14:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48108403C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ToHuYmCkFQAF; Mon,  8 May 2023 14:53:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C39540363;
	Mon,  8 May 2023 14:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C39540363
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD9D11BF279
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 14:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1D9B40360
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 14:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1D9B40360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yhF-3jFDbc0v for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 14:52:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73AF64035E
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73AF64035E
 for <buildroot@buildroot.org>; Mon,  8 May 2023 14:52:56 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-4f22908a082so2162565e87.1
 for <buildroot@buildroot.org>; Mon, 08 May 2023 07:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683557574; x=1686149574;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g1Ucg8Rs9PNzzJHWHAL6bWu5jLsc9Rf6h1wCce8/UVs=;
 b=fwxgBEwl1dRA/BXgvD9gzCAzquINKDHdeLK32uJtd+d44iOBjuRcJluFgpydGcWUpP
 Dad03ujBNt/W4VBhv0mBVhKxWrs8B7WKYWmizAogc9IC0rBNCYrDDzXU75QU2Qd7wz9L
 VQwQgJZH5A9VA/UJGeVobEVL6CWFq3F0ZNKr4Dm554k47l8PUEQoPcO6Otxb4Kft4wpR
 obuBQmrraTIpcU5EFKi3nI+dmtzbvkbihp6Y1xv7xQRw2b+UPXRiIruTGIZbwCq+WpQ7
 Cx5kqzGWZA0sXRX1XQlmRW6bVkJOv0c0emWbI0nUlBUYcFXO1CZwqvYtRAdx6SB+KoVp
 H9tQ==
X-Gm-Message-State: AC+VfDwmC/c49EAnLP5RX24NSpBUApKFHrLG3WJIZB+xaty1P9c0b0PV
 ou/ZJEYPbfSYOGPNJvtVaJbZ7DYHRV+cUg==
X-Google-Smtp-Source: ACHHUZ5ruL/e/rk1kWDE7pBQHPOrkCnMbadF7q4gd6qJ+O/LjjpgrZ34MQPNFlSCiTnk9AIeLEdbsw==
X-Received: by 2002:ac2:5443:0:b0:4ec:a4b4:4731 with SMTP id
 d3-20020ac25443000000b004eca4b44731mr2472703lfn.68.1683557573945; 
 Mon, 08 May 2023 07:52:53 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49]) by smtp.gmail.com with ESMTPSA id
 h17-20020a197011000000b004eb2f35045bsm11865lfc.269.2023.05.08.07.52.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 07:52:53 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-4f22908a082so2162530e87.1
 for <buildroot@buildroot.org>; Mon, 08 May 2023 07:52:53 -0700 (PDT)
X-Received: by 2002:ac2:4466:0:b0:4f0:1e7d:f897 with SMTP id
 y6-20020ac24466000000b004f01e7df897mr2541934lfl.17.1683557572869; Mon, 08 May
 2023 07:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230428075920.3750005-1-thomas@devoogdt.com>
 <20230508113542.GX252090@scaer>
In-Reply-To: <20230508113542.GX252090@scaer>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 8 May 2023 16:52:41 +0200
X-Gmail-Original-Message-ID: <CACXRmJjSuJsmRPscBjdCaTUzxNMqUBr7APG2Yqdj-qJSuxm9ng@mail.gmail.com>
Message-ID: <CACXRmJjSuJsmRPscBjdCaTUzxNMqUBr7APG2Yqdj-qJSuxm9ng@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH v7 1/5] package/at-spi2-core: bump to
 version 2.48.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Daniel Lang <d.lang@abatec.at>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 James Knight <james.knight@collins.com>, buildroot@buildroot.org,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

This patch series is already updated sometimes, I took the series from
@Daniel Lang, and added, for example, this patch.
The patch itself was submitted upstream by @Adrian Perez de Castro,
but no SoB was added there.
Since it's accepted upstream, and checked by me and Adrian, I guess
that adding my SoB is fine.

 "Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>"

Btw, about "package/libgtk3: re-enable atk-bridge", don't forget to
remove "0001-disable-atk-bridge.patch" from the .checkpackageignore
list.
I only recently learned about that list, so next time, I will do it
myself. But I guess you will do it now.
Next time, I will also make sure to write Upstream and add the
mandatory signed-off.

Kr,

Thomas Devoogdt

Op ma 8 mei 2023 om 13:35 schreef Yann E. MORIN <yann.morin.1998@free.fr>:
>
> Thomas, Daniel, All,
>
> On 2023-04-28 09:59 +0200, Thomas Devoogdt spake thusly:
> > From: Daniel Lang <d.lang@abatec.at>
> >
> > https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_48_0/NEWS
> >
> > - X11 is now optional.
> > - libxml2 is no longer optional.
> > - atk and at-spi2-atk have been merged into at-spi2-core.
> > - atk introspection option added.
> > - Added patch to which avoids requiring libsystemd when configured to use dbus-daemon.
> > - Added check on dlopen.
> >
> > Signed-off-by: Daniel Lang <d.lang@abatec.at>
> > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
>
> I wanted to apply this patch series, but unfiortuantely, there is
> missing piece, see below...
>
> [--SNIP--]
> > diff --git a/package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch b/package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch
> > new file mode 100644
> > index 0000000000..29c3de8d2d
> > --- /dev/null
> > +++ b/package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch
> > @@ -0,0 +1,92 @@
> > +From aeb14ffccaabe65a64e976576d71f30eb2165f43 Mon Sep 17 00:00:00 2001
> > +From: Adrian Perez de Castro <aperez@igalia.com>
> > +Date: Mon, 24 Apr 2023 12:09:50 +0300
> > +Subject: [PATCH] meson: Avoid requiring libsystemd when configured to use
> > + dbus-daemon
> > +
> > +Checks for dbus-daemon and dbus-broker only when they are chosen
> > +with default_bus. This avoids requiring the systemd libraries if
> > +one wants the built at-spi2-core to use dbus-daemon, but dbus-worker
> > +is somehow available in the $PATH. A typical scenario is cross
> > +compilation, where the build host may have a dbus-broker program
> > +available, but the target system may not have it (or may not have
> > +nor want to use the systemd libraries).
> > +
> > +upstream: https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/134
>
> This patch is missing a SoB of you guys that grabbed it from upstream,
> i.e. Daniel and Thomas, even if the upstream commit has no SoB itself.
>
> And nit: the upstream tag takes a uppercase 'U'.
>
>     $ ./utils/docker-run make check-package
>     package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch:0: missing Signed-off-by in the header (http://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)
>     package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)
>
> I could fix the Upstream issue, but I can't add a SoB for others. But if
> you reply here with your SoB lines, Daniel and/or Thomas, I can add them
> when applying.
>
> Regards,
> Yann E. MORIN.
>
> > +---
> > + bus/meson.build | 53 ++++++++++++++++++++++++-------------------------
> > + 1 file changed, 26 insertions(+), 27 deletions(-)
> > +
> > +diff --git a/bus/meson.build b/bus/meson.build
> > +index 22a1bce6..2f3c5621 100644
> > +--- a/bus/meson.build
> > ++++ b/bus/meson.build
> > +@@ -46,39 +46,38 @@ launcher_args = [
> > +              '-DDATADIR="@0@"'.format(atspi_datadir),
> > +            ]
> > +
> > +-if get_option('dbus_daemon') != 'default'
> > +-  launcher_args += '-DDBUS_DAEMON="@0@"'.format(get_option('dbus_daemon'))
> > +-else
> > +-  dbus_daemon = find_program('dbus-daemon',
> > +-                             '/sbin/dbus-daemon',
> > +-                             '/usr/sbin/dbus-daemon',
> > +-                             '/libexec/dbus-daemon',
> > +-                             '/usr/libexec/dbus-daemon',
> > +-                             '/usr/lib/dbus-daemon',
> > +-                             '/usr/pkg/bin/dbus-daemon',
> > +-                             required: false)
> > +-  if dbus_daemon.found()
> > +-    launcher_args += '-DDBUS_DAEMON="@0@"'.format(dbus_daemon.full_path())
> > +-  endif
> > +-endif
> > +-
> > + needs_systemd = false
> > +-if get_option('dbus_broker') != 'default'
> > +-  launcher_args += '-DDBUS_BROKER="@0@"'.format(get_option('dbus_broker'))
> > +-  needs_systemd = true
> > ++if get_option('default_bus') == 'dbus-daemon'
> > ++  if get_option('dbus_daemon') != 'default'
> > ++    launcher_args += '-DDBUS_DAEMON="@0@"'.format(get_option('dbus_daemon'))
> > ++  else
> > ++    dbus_daemon = find_program('dbus-daemon',
> > ++                               '/sbin/dbus-daemon',
> > ++                               '/usr/sbin/dbus-daemon',
> > ++                               '/libexec/dbus-daemon',
> > ++                               '/usr/libexec/dbus-daemon',
> > ++                               '/usr/lib/dbus-daemon',
> > ++                               '/usr/pkg/bin/dbus-daemon',
> > ++                               required: false)
> > ++    if dbus_daemon.found()
> > ++      launcher_args += '-DDBUS_DAEMON="@0@"'.format(dbus_daemon.full_path())
> > ++    endif
> > ++  endif
> > + else
> > +-  dbus_broker = find_program('dbus-broker-launch',
> > +-                             required: false)
> > +-  if dbus_broker.found()
> > +-    launcher_args += '-DDBUS_BROKER="@0@"'.format(dbus_broker.full_path())
> > ++  launcher_args += '-DWANT_DBUS_BROKER'
> > ++  if get_option('dbus_broker') != 'default'
> > ++    launcher_args += '-DDBUS_BROKER="@0@"'.format(get_option('dbus_broker'))
> > +     needs_systemd = true
> > ++  else
> > ++    dbus_broker = find_program('dbus-broker-launch',
> > ++                               required: false)
> > ++    if dbus_broker.found()
> > ++      launcher_args += '-DDBUS_BROKER="@0@"'.format(dbus_broker.full_path())
> > ++      needs_systemd = true
> > ++    endif
> > +   endif
> > + endif
> > +
> > +-if get_option('default_bus') == 'dbus-broker'
> > +-  launcher_args += '-DWANT_DBUS_BROKER'
> > +-endif
> > +-
> > + if needs_systemd
> > +   systemd_dep = dependency('libsystemd')
> > + else
> > +--
> > +2.34.1
> > +
> > diff --git a/package/at-spi2-core/Config.in b/package/at-spi2-core/Config.in
> > index f56c5b93c4..2a1b21d375 100644
> > --- a/package/at-spi2-core/Config.in
> > +++ b/package/at-spi2-core/Config.in
> > @@ -1,12 +1,13 @@
> >  config BR2_PACKAGE_AT_SPI2_CORE
> >       bool "at-spi2-core"
> > -     depends on BR2_PACKAGE_XORG7 # xlib-libxtst
> >       depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, glib2
> >       depends on BR2_USE_MMU # glib2
> >       depends on BR2_USE_WCHAR # glib2
> > +     depends on !BR2_STATIC_LIBS # dlopen()
> >       select BR2_PACKAGE_DBUS
> >       select BR2_PACKAGE_LIBGLIB2
> > -     select BR2_PACKAGE_XLIB_LIBXTST
> > +     select BR2_PACKAGE_LIBXML2
> > +     select BR2_PACKAGE_XLIB_LIBXTST if BR2_PACKAGE_XORG7 # optionally for X11
> >       help
> >         The At-Spi2 Core package is a part of the GNOME
> >         Accessibility Project. It provides a Service Provider
> > @@ -16,10 +17,6 @@ config BR2_PACKAGE_AT_SPI2_CORE
> >
> >         https://wiki.gnome.org/Accessibility
> >
> > -comment "at-spi2-core needs a toolchain w/ wchar, threads"
> > +comment "at-spi2-core needs a toolchain w/ dynamic library, wchar, threads"
> >       depends on BR2_USE_MMU
> > -     depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> > -
> > -comment "at-spi2-core depends on X.org"
> > -     depends on BR2_USE_MMU
> > -     depends on !BR2_PACKAGE_XORG7
> > +     depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> > diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
> > index 764e4c3661..9cf80d1cc0 100644
> > --- a/package/at-spi2-core/at-spi2-core.hash
> > +++ b/package/at-spi2-core/at-spi2-core.hash
> > @@ -1,5 +1,5 @@
> > -# From https://download.gnome.org/sources/at-spi2-core/2.36/at-spi2-core-2.36.0.sha256sum
> > -sha256  88da57de0a7e3c60bc341a974a80fdba091612db3547c410d6deab039ca5c05a  at-spi2-core-2.36.0.tar.xz
> > +# From https://download.gnome.org/sources/at-spi2-core/2.48/at-spi2-core-2.48.0.sha256sum
> > +sha256  905a5b6f1790b68ee803bffa9f5fab4ceb591fb4fae0b2f8c612c54f1d4e8a30  at-spi2-core-2.48.0.tar.xz
> >
> >  # locally calculated
> >  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> > diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
> > index f0b019c0ed..e4489f6f88 100644
> > --- a/package/at-spi2-core/at-spi2-core.mk
> > +++ b/package/at-spi2-core/at-spi2-core.mk
> > @@ -4,17 +4,31 @@
> >  #
> >  ################################################################################
> >
> > -AT_SPI2_CORE_VERSION_MAJOR = 2.36
> > +AT_SPI2_CORE_VERSION_MAJOR = 2.48
> >  AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
> >  AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
> >  AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
> >  AT_SPI2_CORE_LICENSE = LGPL-2.1+
> >  AT_SPI2_CORE_LICENSE_FILES = COPYING
> >  AT_SPI2_CORE_INSTALL_STAGING = YES
> > -AT_SPI2_CORE_DEPENDENCIES = host-pkgconf dbus libglib2 xlib_libXtst \
> > +AT_SPI2_CORE_DEPENDENCIES = host-pkgconf dbus libglib2 libxml2 \
> >       $(TARGET_NLS_DEPENDENCIES)
> >  AT_SPI2_CORE_CONF_OPTS = -Ddbus_daemon=/usr/bin/dbus-daemon
> >
> > +ifeq ($(BR2_PACKAGE_XORG7),y)
> > +AT_SPI2_CORE_CONF_OPTS += -Dx11=enabled
> > +AT_SPI2_CORE_DEPENDENCIES += xlib_libXtst
> > +else
> > +AT_SPI2_CORE_CONF_OPTS += -Dx11=disabled
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> > +AT_SPI2_CORE_CONF_OPTS += -Dintrospection=enabled
> > +AT_SPI2_CORE_DEPENDENCIES += gobject-introspection
> > +else
> > +AT_SPI2_CORE_CONF_OPTS += -Dintrospection=disabled
> > +endif
> > +
> >  AT_SPI2_CORE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
> >
> >  $(eval $(meson-package))
> > --
> > 2.34.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
