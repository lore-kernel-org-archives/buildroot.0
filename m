Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8935BC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 18:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CC2181F20;
	Mon, 20 Feb 2023 18:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CC2181F20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8SYqMzwvH1U3; Mon, 20 Feb 2023 18:54:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B1B681E8A;
	Mon, 20 Feb 2023 18:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B1B681E8A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E9B401BF35D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 18:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C345F61062
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 18:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C345F61062
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id goRUmIzmEkyZ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 18:54:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EA816102B
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EA816102B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 18:54:13 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id r27so712811lfe.10
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 10:54:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/SDlAUFVrY0JMRbwcLAkCZyxkVV4EFnWbEMJ+BHyHQE=;
 b=d03tDEVwO9O0xBiWIjlJmP79JlOVtGQRCP2Y/LTKeQRTSX+CCFYvXYob9MHndD2mHI
 pLbgGG7lr0bfEd7XialHt9/WKuwJ8DguvQ/Y3+oQxypBJIqQNRovXjD4HNYYW/rRTmO3
 D33Dm77jKICic/SLmpxq1QtynPVt+wn7q4LDtAbvRqWjg6icNMZsLvmhjnWQX8/NA1G0
 8qpWqIXxWiI7Vq4JUBOXgFcIFCRzYjtQte5vtIzifjl2ldyXChihYeda5Izyw6KflF0m
 lceZIQuwKZo9zxr9pftfJQPc+/xuiwtr27fiy1LoQ88tapn022aXI4Dtd2SUApaCh5qU
 l3Lg==
X-Gm-Message-State: AO0yUKU8/xJRf/KZunAVm750/tPUn1tLJ51LtEx/Qdqu16S848rSxAYQ
 ox76WGmyvmC1I8Boye/V7xGESE9yhQ5ggXna
X-Google-Smtp-Source: AK7set/JXvO7+636/sxGnrxpzDQf3rno5kY8tRWTT5eY0VaP4ptsI09f5Nt5UK9MHsE5yYCQ8/gtxg==
X-Received: by 2002:ac2:43b9:0:b0:4cc:e981:84a with SMTP id
 t25-20020ac243b9000000b004cce981084amr371623lfl.25.1676919251321; 
 Mon, 20 Feb 2023 10:54:11 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172]) by smtp.gmail.com with ESMTPSA id
 q9-20020ac25109000000b004cb8de497ffsm1593916lfb.154.2023.02.20.10.54.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 10:54:10 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id u15so3157722ljo.5
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 10:54:10 -0800 (PST)
X-Received: by 2002:a2e:b753:0:b0:28e:54f:b187 with SMTP id
 k19-20020a2eb753000000b0028e054fb187mr956536ljo.5.1676919250482; Mon, 20 Feb
 2023 10:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20230220090923.2155635-1-thomas.devoogdt@barco.com>
 <20230220090923.2155635-2-thomas.devoogdt@barco.com>
 <87edqkz1yv.fsf@dell.be.48ers.dk>
In-Reply-To: <87edqkz1yv.fsf@dell.be.48ers.dk>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 20 Feb 2023 19:53:59 +0100
X-Gmail-Original-Message-ID: <CACXRmJi_azFDgMzV9GhMTjaxZdSjRiENF5zF9KNbvfT_k8aBOw@mail.gmail.com>
Message-ID: <CACXRmJi_azFDgMzV9GhMTjaxZdSjRiENF5zF9KNbvfT_k8aBOw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH v1 2/3] package/libgtk3: re-enable atk-bridge
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Joseph Kogut <joseph.kogut@gmail.com>, Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I see that X11 support is optional and is automatically detected:
https://github.com/GNOME/at-spi2-core/blob/main/meson_options.txt#L31-L34
So it would be better to append a commit to this one to remove the
Xorg dependency on at-spi2-core.

Kr,

Thomas Devoogdt

Op ma 20 feb. 2023 om 18:22 schreef Peter Korsgaard <peter@korsgaard.com>:
>
> >>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:
>
>  > The reason why it was not used was that at-spi2-core and at-spi2-atk were not available,
>  > since then, it is, so drop this patch. This will also avoid warnings in webkitgtk.
>
>  > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
>  > ---
>  >  package/libgtk3/0001-disable-atk-bridge.patch | 41 -------------------
>  >  package/libgtk3/Config.in                     |  2 +
>  >  package/libgtk3/libgtk3.mk                    |  4 +-
>  >  3 files changed, 4 insertions(+), 43 deletions(-)
>  >  delete mode 100644 package/libgtk3/0001-disable-atk-bridge.patch
>
>  > diff --git a/package/libgtk3/0001-disable-atk-bridge.patch b/package/libgtk3/0001-disable-atk-bridge.patch
>  > deleted file mode 100644
>  > index f3e9bff2ba..0000000000
>  > --- a/package/libgtk3/0001-disable-atk-bridge.patch
>  > +++ /dev/null
>  > @@ -1,41 +0,0 @@
>  > -Remove atk-bridge support.
>  > -
>  > -atk-bridge doesn't seem useful for now in Buildroot and requires to
>  > -add two new packages just for it: at-spi2-core and at-spi2-atk.
>  > -
>  > -Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
>  > -
>  > ---- a/gtk/a11y/gtkaccessibility.c
>  > -+++ b/gtk/a11y/gtkaccessibility.c
>  > -@@ -37,10 +37,6 @@
>  > - #include <gtk/gtktogglebutton.h>
>  > - #include <gtk/gtkaccessible.h>
>  > -
>  > --#ifdef GDK_WINDOWING_X11
>  > --#include <atk-bridge.h>
>  > --#endif
>  > --
>  > - static gboolean gail_focus_watcher      (GSignalInvocationHint *ihint,
>  > -                                          guint                  n_param_values,
>  > -                                          const GValue          *param_values,
>  > -@@ -988,9 +984,5 @@ _gtk_accessibility_init (void)
>  > -   _gtk_accessibility_override_atk_util ();
>  > -   do_window_event_initialization ();
>  > -
>  > --#ifdef GDK_WINDOWING_X11
>  > --  atk_bridge_adaptor_init (NULL, NULL);
>
>  > --#endif
>  > --
>  > -   atk_misc_instance = g_object_new (GTK_TYPE_MISC_IMPL, NULL);
>  > - }
>  > ---- a/meson.build
>  > -+++ b/meson.build
>  > -@@ -564,7 +564,7 @@ if x11_enabled
>  > -   xfixes_dep     = dependency('xfixes', required: false)
>  > -   xcomposite_dep = dependency('xcomposite', required: false)
>  > -   fontconfig_dep = dependency('fontconfig', fallback: ['fontconfig', 'fontconfig_dep'])
>  > --  atkbridge_dep  = dependency('atk-bridge-2.0', version: at_spi2_atk_req)
>  > -+  atkbridge_dep  = dependency('atk-bridge-2.0', version: at_spi2_atk_req, required: false)
>  > -
>  > -   backend_immodules += ['xim']
>  > -
>
>  > diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
>  > index 82ca68d2da..d921f79226 100644
>  > --- a/package/libgtk3/Config.in
>  > +++ b/package/libgtk3/Config.in
>  > @@ -24,6 +24,8 @@ config BR2_PACKAGE_LIBGTK3
>  >      depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
>  >              BR2_PACKAGE_HAS_LIBGL
>  >      select BR2_PACKAGE_ATK
>  > +    select BR2_PACKAGE_AT_SPI2_ATK
>  > +    select BR2_PACKAGE_AT_SPI2_CORE
>
> at-spi2-core depends on xorg7 / xlib-libXtst, so that would mean that we
> would pull that in even for libgtk3 builds with the broadway/wayland
> backends, is that sensible?
>
> Maybe it is? Does at-spi2 work under wayland?
>
> --
> Bye, Peter Korsgaard
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
