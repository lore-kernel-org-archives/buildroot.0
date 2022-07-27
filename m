Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E78C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 18:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2524760A90;
	Wed, 27 Jul 2022 18:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2524760A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ce6rhSd7_fP; Wed, 27 Jul 2022 18:33:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05F0660595;
	Wed, 27 Jul 2022 18:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05F0660595
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C98371BF39C
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 18:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 572B5600BA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 18:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 572B5600BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DI2pHsKF0UuD for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 18:33:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E491C60BCC
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E491C60BCC
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 18:33:15 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-10e6bdbe218so790036fac.10
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 11:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q+vxrhV4QY79f02HCkej+QuNzkf5k9Xtq+PQYKnruVk=;
 b=8DkhHN3qgfutnvW8ogd1uHGcPkVaq9Cl0TWaBl9HOyXk5oltuI903QJ8O0GYyzz1Tg
 MMLSiAcX65bAXGKAd+HpVWgYDnZ5Y165uFf4roAmK/QbgBxgRHWEWir8e2GUIB+SWkMd
 VZnQWL+hkCzSUDWCWlPrOi/ozH0HZAf/GbAIeAVCYf3HHGE51760PD+vYllv7WgjTUSS
 pUJUmhXFcrGKjE/74W4JfTe2YmDtDufM0No+f3S2fT8amzvdB593gLANCRmh7FXKiPfO
 TDUBsPpjCPn7yyCCjzgZ5zCFf2BFrLhJn7K+L7zXXu+kAISUB73aKMyWKplPZd7Ugif/
 Yf/A==
X-Gm-Message-State: AJIora9A/0KEk8jnCVvlMvhgy5kuuMNIaHxYhSJx9VbnCwg4HwCuOTT1
 Ud49XxMWxBXVG0s8JgqsDu63TIn2VGmplNUPuHY=
X-Google-Smtp-Source: AGRyM1tX6XW82xAW9N2rVxwsbc4YZFoPFheh7IW51EB/nnFD+l589kkIUbu5rQpnZjluxJFtrOhQxRpaPhrGbKEyLDM=
X-Received: by 2002:a05:6870:8314:b0:10c:cc1a:57fc with SMTP id
 p20-20020a056870831400b0010ccc1a57fcmr2848724oae.153.1658946794931; Wed, 27
 Jul 2022 11:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220727071557.3434892-1-james.hilliard1@gmail.com>
 <20220727071557.3434892-2-james.hilliard1@gmail.com>
 <0b33098c-cdf6-d59a-0ee3-fc9821de53ba@mind.be>
In-Reply-To: <0b33098c-cdf6-d59a-0ee3-fc9821de53ba@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 27 Jul 2022 12:33:03 -0600
Message-ID: <CADvTj4qO6bzEjEG4Hs8Cy9McBqs0Vj4Pq37ZTw+h468OeCZLvA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Q+vxrhV4QY79f02HCkej+QuNzkf5k9Xtq+PQYKnruVk=;
 b=fbUy0PLyzWJgNB5/V6oHxuFeubtgnCqwHiLosvJnrKO4vXkpp9JCulaJgyHuEeEOA7
 pdnV1x57aZSPoJRjclwf3ksY6mJB7rPGEJyMUW9/l/egs0NB0AMlS7tnmcXjb/4/y7Sh
 DjyAniQTb/5Iq/QQNIr6wgP8FnqvTTey6smz51MEIlvzjVprhKyc6Zk5PLibdK5jdMvt
 iP6bHsa2QXHeWjCl1hs0P7B19iJeZilS6/JiOSMub886ut0QCK6ImiDGWEDn7mSkQSDe
 QxAjI0ovqDR4bXaNU3Uer5cKvR7VP6U2XgMIcX0Eb5R4g7HhtF4S6HrRnrQCI/FbodTl
 KKEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fbUy0PLy
Subject: Re: [Buildroot] [PATCH v5 2/2] package/pkg-meson: use meson to
 build/install packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot <buildroot@buildroot.org>, Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jul 27, 2022 at 5:08 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 27/07/2022 09:15, James Hilliard wrote:
> > As of version 0.54.0 meson has had the ability to build and install
> > packages rather than having to run ninja directly as before.
> >
> > This will allow us to use features such as meson install tags in
> > the future which require meson to be used for the installation.
> >
> > Note that we've removed FOO_NINJA_ENV which may cause issues
> > in the unlikely event an external package uses it.
> >
> > We need to set --pkgconfig.relocatable so that pkg-config files are
> > not generated with absolute paths which cause issues with per-package
> > directories.
>
>   This still doesn't explain how it is related to using meson rather than ninja.
> Are you saying that when calling ninja directly, PPD work perfectly fine, but if
> it's installed with meson, it doesn't? Then I'd really like to have a little
> more insight into what meson does to break it.

Well, the issue seems to be that without --pkgconfig.relocatable meson install
messes up the paths during install due to generating absolute pkgconfig paths
while ninja doesn't.

>
>   I suspect that the two are actually unrelated, and thus the patches should be
> split.
>
> >
> > Remove conflicting host-systemd paths.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> [snip]
> > @@ -156,10 +157,20 @@ define $(2)_CONFIGURE_CMDS
> >       mkdir -p $$($$(PKG)_SRCDIR)/build
> >       $$(HOST_CONFIGURE_OPTS) \
> >       $$($$(PKG)_CONF_ENV) $$(MESON) \
> > +             --pkgconfig.relocatable \
> >               --prefix=$$(HOST_DIR) \
> > -             --libdir=lib \
> > -             --sysconfdir=$$(HOST_DIR)/etc \
> > +             --bindir=$$(HOST_DIR)/bin \
>
>   bindir defaults to "bin", which means things will be installed in <prefix>/bin
> and references to bindir in pkgconfig will use <prefix>/bin absolute paths as
> well (actually, as ${prefix}/bin). How does pkgconfig.relocatable change things
> that we suddenly need to override the default with an absolute path?

From my understanding pkgconfig.relocatable tells meson to calculate pkgconf
paths relative to the prefix, so things work when both the prefix and bindir are
set to absolute paths that produce the right relative paths when meson resolves
the paths against each other during pkgconfig generation.

>
> > +             --datadir=$$(HOST_DIR)/share \
> > +             --includedir=$$(HOST_DIR)/include \
> > +             --infodir=$$(HOST_DIR)/share/info \
> > +             --libdir=$$(HOST_DIR)/lib \
> > +             --libexecdir=$$(HOST_DIR)/libexec \
> > +             --localedir=$$(HOST_DIR)/share/locale \
> >               --localstatedir=$$(HOST_DIR)/var \
> > +             --mandir=$$(HOST_DIR)/share/man \
> > +             --sbindir=$$(HOST_DIR)/sbin \
> > +             --sharedstatedir=$$(HOST_DIR)/com \
> > +             --sysconfdir=$$(HOST_DIR)/etc \
> >               --default-library=shared \
> >               --buildtype=release \
> >               --wrap-mode=nodownload \
> > @@ -179,13 +190,23 @@ $(2)_DEPENDENCIES += host-meson
> >   ifndef $(2)_BUILD_CMDS
> >   ifeq ($(4),target)
> >   define $(2)_BUILD_CMDS
> > -     $$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> > -             $$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
> > +     $$(TARGET_MAKE_ENV) \
> > +     $$($$(PKG)_MESON_ENV) \
> > +     $$(MESON) \
> > +             compile \
> > +             $$(MESON_BUILD_OPTS) \
> > +             $$(if $$($$(PKG)_NINJA_OPTS),--ninja-args $$($$(PKG)_NINJA_OPTS)) \
> > +             -C $$($$(PKG)_SRCDIR)/build
> >   endef
> >   else
> >   define $(2)_BUILD_CMDS
> > -     $$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> > -             $$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
> > +     $$(HOST_MAKE_ENV) \
> > +     $$($$(PKG)_MESON_ENV) \
> > +     $$(MESON) \
> > +             compile \
> > +             $$(MESON_BUILD_OPTS) \
> > +             $$(if $$($$(PKG)_NINJA_OPTS),--ninja-args $$($$(PKG)_NINJA_OPTS)) \
> > +             -C $$($$(PKG)_SRCDIR)/build
> >   endef
> >   endif
> >   endif
> > @@ -196,8 +217,12 @@ endif
> >   #
> >   ifndef $(2)_INSTALL_CMDS
> >   define $(2)_INSTALL_CMDS
> > -     $$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> > -             $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> > +     $$(HOST_MAKE_ENV) \
> > +     $$($$(PKG)_MESON_ENV) \
> > +     $$(MESON) \
> > +             install \
> > +             $$(MESON_INSTALL_OPTS) \
> > +             -C $$($$(PKG)_SRCDIR)/build
>
>   Why is there a --ninja-args in the build but not in the install?
>
> >   endef
> >   endif
> >
> > @@ -207,8 +232,13 @@ endif
> >   #
> >   ifndef $(2)_INSTALL_STAGING_CMDS
> >   define $(2)_INSTALL_STAGING_CMDS
> > -     $$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
> > -             $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> > +     $$(TARGET_MAKE_ENV) \
> > +     $$($$(PKG)_MESON_ENV) \
> > +     $$(MESON) \
> > +             install \
> > +             $$(MESON_INSTALL_OPTS) \
> > +             --destdir $$(STAGING_DIR) \
> > +             -C $$($$(PKG)_SRCDIR)/build
> >   endef
> >   endif
> >
> > @@ -218,8 +248,13 @@ endif
> >   #
> >   ifndef $(2)_INSTALL_TARGET_CMDS
> >   define $(2)_INSTALL_TARGET_CMDS
> > -     $$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) \
> > -             $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> > +     $$(TARGET_MAKE_ENV) \
> > +     $$($$(PKG)_MESON_ENV) \
> > +     $$(MESON) \
> > +             install \
> > +             $$(MESON_INSTALL_OPTS) \
> > +             --destdir $$(TARGET_DIR) \
> > +             -C $$($$(PKG)_SRCDIR)/build
> >   endef
> >   endif
> >
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index 47aaddf849..6efc8d636f 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -749,7 +749,7 @@ endef
> >   SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
> >
> >   SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
> > -SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
> > +SYSTEMD_MESON_ENV = $(HOST_UTF8_LOCALE_ENV)
> >
> >   define SYSTEMD_LINUX_CONFIG_FIXUPS
> >       $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS)
> > @@ -777,10 +777,7 @@ endef
> >   HOST_SYSTEMD_CONF_OPTS = \
> >       -Dsplit-bin=true \
> >       -Dsplit-usr=false \
> > -     --prefix=/usr \
> > -     --libdir=lib \
> > -     --sysconfdir=/etc \
> > -     --localstatedir=/var \
> > +     -Drootprefix=$(HOST_DIR) \
>
>   This change looks like something we can apply independently of the rest of the
> seris as well. It looks like a much better way of handling the special case of
> systemd. However, I'd like a much more detailed explanation about why this works
> now but didn't work in commit 35c11a027c88a3c943554eefbbed051fd2d98a50. That
> commit has an extensive explanation of the reasoning.

Hmm, I'll look into this more.

>
>   Regards,
>   Arnout
>
> >       -Dmode=release \
> >       -Dutmp=false \
> >       -Dhibernate=false \
> > @@ -852,8 +849,6 @@ HOST_SYSTEMD_DEPENDENCIES = \
> >       host-gperf \
> >       host-python-jinja2
> >
> > -HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
> > -
> >   # Fix RPATH After installation
> >   # * systemd provides a install_rpath instruction to meson because the binaries
> >   #   need to link with libsystemd which is not in a standard path
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
