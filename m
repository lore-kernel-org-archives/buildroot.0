Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6643EC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 09:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1701C82FCE;
	Thu, 28 Jul 2022 09:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1701C82FCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oyEuaCUt8uSw; Thu, 28 Jul 2022 09:02:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE28C82ED2;
	Thu, 28 Jul 2022 09:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE28C82ED2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 155D41BF2BC
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 09:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF476403B8
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 09:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF476403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V33lokXGv1R0 for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 09:01:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47B76402F7
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47B76402F7
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 09:01:59 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 o16-20020a9d4110000000b0061cac66bd6dso755972ote.11
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 02:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JcL9jgaG7bIP1oo/lp1COTT3MVoH+UgEWPW3oRLkFwE=;
 b=IA2h/jJSc/31FTfdv4bbIpUGIbDqa2uYTjuDAOPFT85ihqk/i+XfXdtQaXNeEIbKQ9
 HvZXDCJijlIu8ovyWfS0h1MWMS6YT0alxjgnVMUp2W9q/fWMQ7Gir83czTji+d7fFhmI
 04w9cV0LxG7wY1ynXYI9oT89M69yZI48YPJrwKjyK1iCa3F7711pJbLF4wSqnW9dVrgE
 wO5s1jTh3+dfkV00kR98/0GsX3eskxpsYFDIZQAhRabrny1rDkRG/cdQMxlFy0IxyVDL
 Zx2evmMD/1ev/IZmN1dGe9F8oIWSOYvfgv96MjseUhQ90qgQmjNwFbpuGen7qW0jWr3w
 4e9Q==
X-Gm-Message-State: AJIora97vUrCY6UPxZxA/9F6IyosmY0vP1Nfgq6pFAf1ds6TUwsNLlVb
 rS/WDrMbfo0EWDLuR4PsbqoI++9N88baI9YHljQ=
X-Google-Smtp-Source: AGRyM1tQ4UdT1QYi517CI3J6G1Q/7XbWYej2wUE+Dnejn47p07JyfaKf0mWoaezWVQdujLPAMYWiWI6haSdLJ8A4wKI=
X-Received: by 2002:a9d:6d17:0:b0:61c:b016:bd32 with SMTP id
 o23-20020a9d6d17000000b0061cb016bd32mr10380115otp.74.1658998917873; Thu, 28
 Jul 2022 02:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220727221055.1838031-1-james.hilliard1@gmail.com>
 <CADYdroOD6Y7MH3+HAyicL4he60YDnAB15=VP9xpUE08=L_nrUQ@mail.gmail.com>
In-Reply-To: <CADYdroOD6Y7MH3+HAyicL4he60YDnAB15=VP9xpUE08=L_nrUQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 28 Jul 2022 03:01:46 -0600
Message-ID: <CADvTj4pea-vMNyitS=_B2EEP4WcN8F9aBk1TUikfWGSFJfQPXg@mail.gmail.com>
To: Norbert Lange <nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=JcL9jgaG7bIP1oo/lp1COTT3MVoH+UgEWPW3oRLkFwE=;
 b=RXO5rx/sjpg0WWEv8TtErnDBaMdofrIo0yRh94QX2cGQItetmVt001Ph424wxSOtvl
 Ilp8u5h9XkJoOtESH4L3zSiDsLzE4zGJRlqZvi58UitB2CSQqVrMgT95BLAuK0l/AdsU
 CG7LRpfZtcWOaVxnCQ2EnHPAhaMPTzmdghSsy9W9WF5E+bDUyvcGig1WHrOL8vOKwOxM
 J9KT1nCzMdFDC4yNrHass7CGaQqEsTgsxFY2VanuL0Q0kXH3t4MB0J4L7BEM+BBdQ1GI
 a+hLrE0axsfKtV2zSzyU8sNxA1x2iyMAj3ZlRf0DfDHLpLpRYd9twaTwE6Kl59uyZZPC
 4alw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RXO5rx/s
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: use statically linked
 host tools
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Jul 28, 2022 at 2:33 AM Norbert Lange <nolange79@gmail.com> wrote:
>
> Am Do., 28. Juli 2022 um 00:11 Uhr schrieb James Hilliard
> <james.hilliard1@gmail.com>:
> >
> > This lets us remove the HOST_SYSTEMD_FIX_RPATH hack.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  ...nalctl-allow-statically-linked-build.patch | 68 +++++++++++++++++++
> >  package/systemd/systemd.mk                    | 28 +++-----
> >  2 files changed, 76 insertions(+), 20 deletions(-)
> >  create mode 100644 package/systemd/0002-journalctl-allow-statically-linked-build.patch
> >
> > diff --git a/package/systemd/0002-journalctl-allow-statically-linked-build.patch b/package/systemd/0002-journalctl-allow-statically-linked-build.patch
> > new file mode 100644
> > index 0000000000..98ffb72cca
> > --- /dev/null
> > +++ b/package/systemd/0002-journalctl-allow-statically-linked-build.patch
> > @@ -0,0 +1,68 @@
> > +From d2dadbdc5618776e07e98baf8795cc8adebf05a1 Mon Sep 17 00:00:00 2001
> > +From: James Hilliard <james.hilliard1@gmail.com>
> > +Date: Wed, 27 Jul 2022 15:28:09 -0600
> > +Subject: [PATCH] journalctl: allow statically linked build
> > +
> > +The journalctl tool may be needed on cross compilation hosts in order
> > +to run --update-catalog against a target rootfs.
> > +
> > +To avoid reliability issues caused by shared linking allow journalctl
> > +to be linked statically.
> > +
> > +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > +[Upstream status:
> > +https://github.com/systemd/systemd/pull/24140]
> > +---
> > + meson.build       | 11 ++++++++++-
> > + meson_options.txt |  2 ++
> > + 2 files changed, 12 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/meson.build b/meson.build
> > +index 692ee1ed4d..8cce19dce6 100644
> > +--- a/meson.build
> > ++++ b/meson.build
> > +@@ -2263,11 +2263,19 @@ public_programs += executable(
> > +         install_rpath : rootpkglibdir,
> > +         install : true)
> > +
> > ++if get_option('link-journalctl-shared')
> > ++        journalctl_link_with = [libshared]
> > ++else
> > ++        journalctl_link_with = [libsystemd_static,
> > ++                                libshared_static,
> > ++                                libbasic_gcrypt]
> > ++endif
> > ++
> > + public_programs += executable(
> > +         'journalctl',
> > +         journalctl_sources,
> > +         include_directories : includes,
> > +-        link_with : [libshared],
> > ++        link_with : [journalctl_link_with],
> > +         dependencies : [threads,
> > +                         libdl,
> > +                         libxz,
> > +@@ -4357,6 +4365,7 @@ foreach tuple : [
> > +         ['link-systemctl-shared', get_option('link-systemctl-shared')],
> > +         ['link-networkd-shared',  get_option('link-networkd-shared')],
> > +         ['link-timesyncd-shared', get_option('link-timesyncd-shared')],
> > ++        ['link-journalctl-shared',get_option('link-journalctl-shared')],
> > +         ['link-boot-shared',      get_option('link-boot-shared')],
> > +         ['first-boot-full-preset'],
> > +         ['fexecve'],
> > +diff --git a/meson_options.txt b/meson_options.txt
> > +index 628ca1d797..d8c0c581c2 100644
> > +--- a/meson_options.txt
> > ++++ b/meson_options.txt
> > +@@ -25,6 +25,8 @@ option('link-networkd-shared', type: 'boolean',
> > +        description : 'link systemd-networkd and its helpers to libsystemd-shared.so')
> > + option('link-timesyncd-shared', type: 'boolean',
> > +        description : 'link systemd-timesyncd and its helpers to libsystemd-shared.so')
> > ++option('link-journalctl-shared', type: 'boolean',
> > ++       description : 'link journalctl against libsystemd-shared.so')
> > + option('link-boot-shared', type: 'boolean',
> > +        description : 'link bootctl and systemd-bless-boot against libsystemd-shared.so')
> > + option('first-boot-full-preset', type: 'boolean', value: false,
> > +--
> > +2.34.1
> > +
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index 47aaddf849..13348f9358 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -738,7 +738,7 @@ endef
> >  SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_CATALOG_UPDATE_SERVICE
> >
> >  define SYSTEMD_CREATE_TMPFILES_HOOK
> > -       HOST_SYSTEMD_TMPFILES=$(HOST_DIR)/bin/systemd-tmpfiles \
> > +       HOST_SYSTEMD_TMPFILES=$(HOST_DIR)/bin/systemd-tmpfiles.standalone \
> >                 $(SYSTEMD_PKGDIR)/fakeroot_tmpfiles.sh $(TARGET_DIR)
> >  endef
> >  SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_CREATE_TMPFILES_HOOK
> > @@ -781,6 +781,13 @@ HOST_SYSTEMD_CONF_OPTS = \
> >         --libdir=lib \
> >         --sysconfdir=/etc \
> >         --localstatedir=/var \
> > +       -Dlink-udev-shared=false \
> > +       -Dlink-systemctl-shared=false \
> > +       -Dlink-networkd-shared=false \
> > +       -Dlink-timesyncd-shared=false \
> > +       -Dlink-journalctl-shared=false \
> > +       -Dlink-boot-shared=false \
> > +       -Dstandalone-binaries=true \
> >         -Dmode=release \
> >         -Dutmp=false \
> >         -Dhibernate=false \
> > @@ -854,24 +861,5 @@ HOST_SYSTEMD_DEPENDENCIES = \
> >
> >  HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
> >
> > -# Fix RPATH After installation
> > -# * systemd provides a install_rpath instruction to meson because the binaries
> > -#   need to link with libsystemd which is not in a standard path
> > -# * meson can only replace the RPATH, not append to it
> > -# * the original rpath is thus lost.
> > -# * the original path had been tweaked by buildroot via LDFLAGS to add
> > -#   $(HOST_DIR)/lib
> > -# * thus re-tweak rpath after the installation for all binaries that need it
> > -HOST_SYSTEMD_HOST_TOOLS = busctl journalctl systemctl systemd-* udevadm
> > -
> > -define HOST_SYSTEMD_FIX_RPATH
> > -       for f in $(addprefix $(HOST_DIR)/bin/,$(HOST_SYSTEMD_HOST_TOOLS)); do \
> > -               [ -e $$f ] || continue; \
> > -               $(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $${f} \
> > -               || exit 1; \
> > -       done
> > -endef
> > -HOST_SYSTEMD_POST_INSTALL_HOOKS += HOST_SYSTEMD_FIX_RPATH
> > -
> >  $(eval $(meson-package))
> >  $(eval $(host-meson-package))
> > --
> > 2.34.1
> >
>
> Hello James,
>
> what issues are you trying to prevent here? buildroot's host tools
> generally use the rpath to work,
> static tools will just blow up filesize, and would only make sense if
> you want to copy a few of them
> to another location.

We don't normally need to use patchelf for host tools, figured it would
be nice to drop that hack.

Size shouldn't really matter much for small host tools like these IMO,
and we should be able to avoid having to install a host libsystemd-shared
this way down the line(static binaries are often smaller than shared in
aggregate if only a subset of the library functions get used).

>
> Makes sense for example the bootctl tool when you want to re-use that
> in an initramfs,
> but thats not buildroot's concern AFAIK.
>
> Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
