Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71ED6C54EBC
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 00:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 062FE400BF;
	Mon,  9 Jan 2023 00:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 062FE400BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u7f4wPhFDsbk; Mon,  9 Jan 2023 00:22:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00BCB40167;
	Mon,  9 Jan 2023 00:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00BCB40167
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6322F1BF865
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 00:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EEB340167
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 00:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EEB340167
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zqdOAYOn1iJD for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 00:22:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2D64400BF
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2D64400BF
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 00:22:47 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 m7-20020a9d73c7000000b00683e2f36c18so4428261otk.0
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 16:22:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EEydk886693++rpjY3Wy7I8H5YHQTU5+gba1AIg4pjs=;
 b=FxtzBJGzpe0NUNUynk3wdMYs2cwLSZ+gZy796g0zmCW5Ns7A5HzVDzGrIrNNgJunpE
 hfnGyo8ynydK2eMfi4e74Bvex+0NcEorEIFd0WeKl5VoOTy7/k2wHatKiOX/doEEDmu/
 VCtINDiJArmRIpoubtVrjgZvPEUOKuKn/y3GdfALGGOIClLjxjscQduUuZZUAhJFVarZ
 oOU5R9PjGZpKTyLkZBxWrRrhqc/tBdXu4+emq0ImQiUB3mCpGRokUeDNsbafbYLG1cEc
 iosQUveV/ulcb+b9n4hXpCN08RhWy2gLzn4rNi1fLSl8Cp3dNJZY6dxUv2WCpY+aec3x
 fRRA==
X-Gm-Message-State: AFqh2kp0GQhO1rN7a4t2XGjpTbGnRwZ25lOYTZbck+PVPf+5Jwomfc/y
 GyBgfCScaLmWoNpPAFd/cNhtV7gd+gJHkeUFS++jzrocgTv1MA==
X-Google-Smtp-Source: AMrXdXvWVQcYI/LADIKce3nCvpxA1KYx+LblK5MeH4yTwOoI86G5WIGNv1LOrZ7eIVL2yR6x1Wp9Us8+gfo4bV+CrSw=
X-Received: by 2002:a05:6830:1b62:b0:66e:ac28:a4d7 with SMTP id
 d2-20020a0568301b6200b0066eac28a4d7mr4099739ote.54.1673223766847; Sun, 08 Jan
 2023 16:22:46 -0800 (PST)
MIME-Version: 1.0
References: <20230107010437.2471513-1-james.hilliard1@gmail.com>
 <20230107010437.2471513-4-james.hilliard1@gmail.com>
 <20230108222926.GJ151997@scaer>
In-Reply-To: <20230108222926.GJ151997@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 8 Jan 2023 17:22:35 -0700
Message-ID: <CADvTj4o1YB7Ztf9y7PC4z83TDYEAXX2eFJBAZ_uBDzu-9a4cXA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EEydk886693++rpjY3Wy7I8H5YHQTU5+gba1AIg4pjs=;
 b=mnKq/ff2rkhxKnFKw2sOiEd1h7iXWaN+JFzE8vAK8xs9C0rtsJdLWX3RnNE18bOMtj
 x4eLHmYOmClmm85sMZzqUUhYSgFrw6TWu9O+9AA6LZKY7yKqKiZoxzBrGLqXw0Fg1HQ7
 diuJtbTPZfT5PCq30x3XxZCl4WBY7voaBg1CiksffR12JPD0OoEMJlv7Am4jI7LLiSvW
 lYLgy+RLThv0fTiYukGLtDa2GtXwHeHhtEKdkpcPHtN0OEd0YzglhJPWkIxQWM8Gppgf
 O39gu5ouyRzn+kSZag8LaiPqug80Y/TjpSLjV1u/wj/qk7lDCl4cippBq2xBPzA70el5
 OevQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mnKq/ff2
Subject: Re: [Buildroot] [PATCH 4/4] package/ccache: bump to version 4.7.4
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
Cc: =?UTF-8?Q?Anders_F_Bj=C3=B6rklund?= <anders.f.bjorklund@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, Dominik Michael Rauh <dmrauh@posteo.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Jan 8, 2023 at 3:29 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> +Dominik, +Anders
>
> On 2023-01-06 18:04 -0700, James Hilliard spake thusly:
> > Migrate to cmake package infrastructure.
> >
> > Add new host-hiredis host-zstd dependencies.
> >
> > Add new ccache dependency exclusions to pkg-generic.
> >
> > Migrate HOST_CCACHE_PATCH_CONFIGURATION to handle updated
> > source files/format.
> >
> > License hashes changed due to migrating urls to https:
> > https://github.com/ccache/ccache/commit/a0f32f161f1b8b9c5d287ca8abe88e3fd1e940a2
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/ccache/ccache.hash |  6 +++---
> >  package/ccache/ccache.mk   | 30 +++++++++++-------------------
>
> This misses a critical part: what prevents cmake from using ccache to
> build?
>
> Dominik and Anders got that correct in their patch:
>
>     +# we are built before ccache
>     +HOST_CMAKE_CONFIGURE_OPTS = \
>     +   $(HOST_CONFIGURE_OPTS) \
>     +   CC="$(HOSTCC_NOCCACHE)" \
>     +   GCC="$(HOSTCC_NOCCACHE)" \
>     +   CXX="$(HOSTCXX_NOCCACHE)"
>     +
>      define HOST_CMAKE_CONFIGURE_CMDS
>         (cd $(@D); \
>     -           $(HOST_CONFIGURE_OPTS) \
>     +           $(HOST_CMAKE_CONFIGURE_OPTS) \
>                 CFLAGS="$(HOST_CMAKE_CFLAGS)" \

Fixed in v3:
https://lore.kernel.org/buildroot/20230109001037.641422-1-james.hilliard1@gmail.com/

>
> (Arguably, CFLAGS assignment should have been moved into
> HOST_CMAKE_CONFIGURE_OPTS as well.)
>
> [--SNIP--]
> > diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
> > index 97aa8b1c75..0c208cb9e6 100644
> > --- a/package/ccache/ccache.mk
> > +++ b/package/ccache/ccache.mk
> > @@ -4,27 +4,19 @@
> >  #
> >  ################################################################################
> >
> > -CCACHE_VERSION = 3.7.12
> > +CCACHE_VERSION = 4.7.4
> >  CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
> >  CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
> >  CCACHE_LICENSE = GPL-3.0+, others
> >  CCACHE_LICENSE_FILES = LICENSE.adoc GPL-3.0.txt
> > -
> > -# Force ccache to use its internal zlib. The problem is that without
> > -# this, ccache would link against the zlib of the build system, but we
> > -# might build and install a different version of zlib in $(O)/host
> > -# afterwards, which ccache will pick up. This might break if there is
> > -# a version mismatch. A solution would be to add host-zlib has a
> > -# dependency of ccache, but it would require tuning the zlib .mk file
> > -# to use HOSTCC_NOCCACHE as the compiler. Instead, we take the easy
> > -# path: tell ccache to use its internal copy of zlib, so that ccache
> > -# has zero dependency besides the C library.
> > -HOST_CCACHE_CONF_OPTS += --with-bundled-zlib
> > +HOST_CCACHE_DEPENDENCIES = host-hiredis host-zstd
>
> Dominik and Anders made hiredis an optional dependency. Given that
> hiredis builds very, very fast (just about 3s here), I wonder if that
> really makes sense to make it optional; hiredis has no dependency that
> are not dependencies of ccache, so there is no hidden overhead.
>
> If hiredis support is compiled in, does that make it mandatory to use a
> hiredis server, or does ccache still uses local files by default?

Default is to use local files.

>
> If the latter, then I think a mandatory dependency is OK.

Yeah, it didn't seem like it made sense to make it optional since hiredis is a
small library.

>
> Dominik, Anders, did you make it a optional because of a previous review
> by Thomas asking so?
>
> [--SNIP--]
> > +HOST_CCACHE_CONF_OPTS += \
> > +     -DCMAKE_C_COMPILER_LAUNCHER="" \
> > +     -DCMAKE_CXX_COMPILER_LAUNCHER="" \
>
> Same as for hiredis: use -U.

Fixed in v3:
https://lore.kernel.org/buildroot/20230109001037.641422-2-james.hilliard1@gmail.com/

>
> [--SNIP--]
> > @@ -35,11 +27,11 @@ HOST_CCACHE_CONF_ENV = \
> >  #    the need to specify BR_CACHE_DIR when invoking ccache directly.
> >  #    CCache replaces "%s" with the home directory of the current user,
> >  #    So rewrite BR_CACHE_DIR to take that into consideration for SDK purpose
> > -HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,\%s/%,$(BR_CACHE_DIR))
> > +HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,%,$(BR_CACHE_DIR))
>
> Err, this is probably bad and the comment above no longer matches the
> code.
>
> Did you meant using 'home_dir +' to replace '%s' (see Dominik and
> Anders' patch):

Well matching against the full 'home_dir +' doesn't seem to be needed,
we can just target the appended strings for replacement which is a bit
cleaner:
https://lore.kernel.org/buildroot/20230109001037.641422-2-james.hilliard1@gmail.com/

>
>     HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst \"$(HOME)/%,home_dir + \"/%,\"$(BR_CACHE_DIR)\")
>
> >  define HOST_CCACHE_PATCH_CONFIGURATION
> > -     sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/ccache.c
> > -     sed -i 's,"%s/.ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/conf.c
> > +     sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/Config.cpp
> > +     sed -i 's,".ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/Config.cpp
>
> This needs a bit of consolidation and further explanations, becasue
> ccache now has more locations where it looks for, and we do not want it
> to default to those:

I have them all being overridden now in my v3:
https://lore.kernel.org/buildroot/20230109001037.641422-2-james.hilliard1@gmail.com/

>
>     home_dir + "/.ccache"           -> the legacy location
>     home_dir + "/.cache/ccache"     -> new, XDG-based
>     home_dir + "/.config/ccache"    -> new, XDG-based
>
> Also, it seems that we need a patch to use BR_CACHE_DIR from the
> environment...

I cleaned this up a bit in my v3 to handle the cases from Dominik and
Anders' patch:
https://lore.kernel.org/buildroot/20230109001037.641422-2-james.hilliard1@gmail.com/

>
> [--SNIP--]
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index f24e03a325..0863444221 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -792,7 +792,7 @@ $(2)_EXTRACT_DEPENDENCIES += \
> >  endif
> >
> >  ifeq ($$(BR2_CCACHE),y)
> > -ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache,$(1)),)
> > +ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache host-cmake host-hiredis host-pkgconf host-zstd,$(1)),)
>
> I've applied that part with just host-hiredis, host-pkgconf, and host-zstd,
> and left host-cmake out for now.
>
> Regards,
> Yann E. MORIN.
>
> >  $(2)_DEPENDENCIES += host-ccache
> >  endif
> >  endif
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
