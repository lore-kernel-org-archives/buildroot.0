Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8240EC001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 15:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B53A381413;
	Tue, 25 Jul 2023 15:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B53A381413
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qw-Jvvp2tyrq; Tue, 25 Jul 2023 15:38:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FDAD8134F;
	Tue, 25 Jul 2023 15:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FDAD8134F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46D2F1BF36F
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 15:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C0AD8134F
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 15:38:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C0AD8134F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gVMTb5mb7mN0 for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 15:38:18 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D970A81239
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 15:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D970A81239
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-991ef0b464cso1434480566b.0
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 08:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690299496; x=1690904296;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7WOqELoQZU3P9a3vf6bDvJvBBryaz1hLuwE4uPckDbc=;
 b=RpKtfGFSvo336EB4fY5uZLCbQSl6csf1/Oan+Qi7L8OYUbrarbHFjDSNXpoRt4L5av
 qgFNMZ0xZUDfF+zVTBWsCKwZY7mB6g7wxywtbW21xD75HZd+N/okE//5kGmFjmiCX/g1
 oHlhXhodUTbCK3aV1XxU+KdXRzAcMFKne3m4Kny+JFJX61W75xRviy59TTCxb3hH74ZH
 3BV2nMItKkfKtWQhp+tnhopvLIbdfieDdqeevZxXzATDWyxbN8Gr7oIEsWQizrHFXqGP
 ON7b0bblhYnwno9WhfgT2VeAS1OuEYKuYUfxUXqDNybZo/PPlwIeip2GRdnirLMlrd+1
 Pt7A==
X-Gm-Message-State: ABy/qLY2ncRNR6oxPZOGnmHtP/ZWnTRc5rE0nyZIZthhopYqIshiewF9
 kxr/sRuTSH985J7YpMPlmrQyYvbQK2nWMK8Kq3F+xupGlxA4Uf/NmK8pCA==
X-Google-Smtp-Source: APBJJlFyNNpWh9c1S4I211XzZ9e9kRxIl/U2uhLFEFEfyn3PumuCL2PUgH2iZdoX+GPwNpTEadUjbEmDbZiBwk4R7vI=
X-Received: by 2002:a17:907:1b0d:b0:99b:4867:5e1c with SMTP id
 mp13-20020a1709071b0d00b0099b48675e1cmr2784749ejc.28.1690299495824; Tue, 25
 Jul 2023 08:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230720233629.1642220-1-adam.duskett@amarulasolutions.com>
 <20230720233629.1642220-4-adam.duskett@amarulasolutions.com>
 <20230723212602.GC3544423@scaer>
In-Reply-To: <20230723212602.GC3544423@scaer>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 25 Jul 2023 08:38:03 -0700
Message-ID: <CAHDQB6PJL9Em=k+7k67yJWk7Dx=fAGb2MRVKJUporO+FH3My6w@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1690299496; x=1690904296;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7WOqELoQZU3P9a3vf6bDvJvBBryaz1hLuwE4uPckDbc=;
 b=bBid7fszy/nOdM7rMldPDiQKSxY7iSVi5+s45eu3SL6FnuTJt0+AgPPvYkflq10d+U
 vXjvqyl2NUKHx2s2fqOBfa7jIPWMqZPHMD+f/IDBPFWzF3B+nSWCtfGmRYS9WNoA0QMG
 rywDzVVUVP+zkwRVqf0DE2vJD937U5QqSMsqE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=bBid7fsz
Subject: Re: [Buildroot] [PATCH vRFC 3/3] package/flutter-engine: new package
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3174515071673874025=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3174515071673874025==
Content-Type: multipart/alternative; boundary="0000000000000360e606015185bd"

--0000000000000360e606015185bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Yann;

Adam Duskett

Senior Embedded Systems Developer

M. +1208-515-8102

adam.duskett@amarulasolutions.com

__________________________________


Amarula Solutions BV

Joop Geesinkweg 125, 1114 AB, Amsterdam, NL

T. +31 (0)85 111 9170
info@amarulasolutions.com

www.amarulasolutions.com



On Sun, Jul 23, 2023 at 2:26=E2=80=AFPM Yann E. MORIN <yann.morin.1998@free=
.fr>
wrote:

> Adam, All,
>
> On 2023-07-20 16:36 -0700, Adam Duskett spake thusly:
> > There are many issues with this package:
> >
> > - The release tarballs from https://github.com/flutter/engine are in no
> state
> >   to compile. They are only for the use of gclient to download a source
> >   directory structure suitable to build the Flutter engine! If you
> download,
> >   extract and attempt to run `./tools/gn --no-goma
> --no-prebuilt-dart-sdk`, you
> >   receive the error message:
> >   `No such file or directory: 'flutter/flutter/third_party/gn/gn.'
> >
> >   But wait! Wasn't the gn binary just called? No, that's a wrapper in t=
he
> >   Flutter source tree that formats arguments to call the real gn binary=
.
> >   The real gn is not provided in the tarball but is downloaded via
> gclient
> >   (among many other supporting repositories.)
> >
> >   Even worse, the flutter repository depends on the .git dirs being
> present.
>
> s/flutter repository/flutter buildsystem/  maybe?
>
> >   (https://github.com/meta-flutter/meta-flutter/issues/271) This
> dependency
> >   means it is not possible to create a reproducible tarball from the
> downloaded
> >   sources, which is why there is no .hash file provided.
> >
> >   I have asked the flutter project to release full tarballs suitable fo=
r
> >   compiling here: https://github.com/flutter/flutter/issues/130734
> >
> > - The clang toolchain wrapper does not work properly, resulting in the
> immediate
> >   errors of:
> >     -Wl,-z,now: 'linker' input unused
> >     -Wl,-z,relro: 'linker' input unused
>
> Those two are us adding them because of BR2_RELRO_FULL (-Wl,-z,relro
> alone would be due to BR2_RELRO_PARTIAL).
>
> It does recognise that they are linker options, but why are they
> rejected? Do you have more context to provide?
>
> >   The solution is to use clang.br_real and clang++.br_real.
>
> Most probably not, because you lose a lot of the options set by
> Buildroot (optimisation ,target CPU, etc...). The real solution is to
> understand why -Wl-z-relro/now are rejected, and if they really are not
> needed, to find a way to tell the toolchain wrapper not set them for
> clang tools.
>
> > - If using per_package builds, flutter-engine tries to use the host
> /usr/bin/ld
> >   instead of the one provided by the compiler, resulting in linking
> errors.
> >   As such, if BR2_PER_PACKAGE_DIRECTORIES is enabled, we search for the
> ld
> >   provided by the compiler in the host directory and set the path
> accordingly.
>
> Can this be related to the above -Wl issue?
>
> > - libtessellator.so (built by flutter) requires three files:
> >   crtbeginS.o crtendS.o libgcc.a. However, the toolchain path isn't
> referenced
> >   when linking. The solution is to copy those three files to the stagin=
g
> lib
> >   directory before building.
> >
> > Tested with:
> >   - Debian 11 and 12
> >   - Ubuntu 18.04, 20.04, and 22.04
> >   - Fedora 38
> >   - Per package directory enabled and disabled
> >   - x86_64, arm64
> >
> > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> > ---
> [--SNIP--]
> > diff --git
> a/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
> b/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
> > new file mode 100644
> > index 0000000000..c4064a77c9
> > --- /dev/null
> > +++ b/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
> > @@ -0,0 +1,32 @@
> > +From 49a14e693124dc34f2cccbfb755d01a1198aa6bf Mon Sep 17 00:00:00 2001
> > +From: Adam Duskett <adam.duskett@amarulasolutions.com>
>
> You're not the author; Joel Winarske is. That's also the authorship
> there is in the upstream issue you referenced.
>
> [--SNIP--]
> > diff --git
> a/package/flutter-engine/0002-remove-explicit-x11-dependency.patch
> b/package/flutter-engine/0002-remove-explicit-x11-dependency.patch
> > new file mode 100644
> > index 0000000000..1345d4a3dd
> > --- /dev/null
> > +++ b/package/flutter-engine/0002-remove-explicit-x11-dependency.patch
> > @@ -0,0 +1,33 @@
> > +From b1a5db9318ca33a03f2700758d5debad907d21b6 Mon Sep 17 00:00:00 2001
> > +From: Adam Duskett <adam.duskett@amarulasolutions.com>
>
> Ditto
>

Yeah, my bad. I'll fix immediatly.


> > +Date: Wed, 19 Jul 2023 15:26:40 -0700
> > +Subject: [PATCH] remove explicit x11 dependency
> > +
> > +This is redundant, as the gtk pkg-config query will reference x11 if
> that's how
>
> Not so much redundant, but rather superfluous and may conflict with the
> actual rendering system used in gtk3 (e.g. wayland).
>
> > diff --git a/package/flutter-engine/0003-disable-undefined-version.patc=
h
> b/package/flutter-engine/0003-disable-undefined-version.patch
> > new file mode 100644
> > index 0000000000..468ec4daf9
> > --- /dev/null
> > +++ b/package/flutter-engine/0003-disable-undefined-version.patch
> > @@ -0,0 +1,32 @@
> > +From 9512040259f3970dd5ca08fd9ebcfd42e7539997 Mon Sep 17 00:00:00 2001
> > +From: Adam Duskett <aduskett@gmail.com>
> > +Date: Tue, 18 Jul 2023 15:21:51 -0700
> > +Subject: [PATCH] Disable undefined-version
> > +
> > +This isn't a valid flag for ld, and flutter compiles just fine with th=
e
> > +no-undefined-version flag.
>
> Without that option, the linker will just ignore a symbol with an
> undefined version. With the option, a smbol with an undefined version
> turns into an error.
>
> So indeed, without the option, the check is relaxed so it is not
> surprising the build does not fail.
>
> The option doesn't exist for ld afaik. If that option isn't changed ld
returns with something
along the lines of "no such option: no-undefined-version."


> [--SNIP--]
> > diff --git a/package/flutter-engine/Config.in
> b/package/flutter-engine/Config.in
> > new file mode 100644
> > index 0000000000..fe72191e77
> > --- /dev/null
> > +++ b/package/flutter-engine/Config.in
> > @@ -0,0 +1,93 @@
> > +config BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
> > +     bool
> > +     default y if BR2_aarch64
> > +     default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
> > +     default y if BR2_i386
> > +     default y if BR2_x86_64
>
> Since it uses clang, i'd also add: BR2_PACKAGE_LLVM_ARCH_SUPPORTS, but
> this is a bit fuzzy for me what option we should add, if any...
>
> > +
> > +config BR2_PACKAGE_FLUTTER_ENGINE
> > +     bool "flutter-engine"
> > +     depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
> > +     depends on BR2_TOOLCHAIN_USES_GLIBC
> > +     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthreads
> > +     depends on BR2_INSTALL_LIBSTDCPP
> > +     depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
> > +     depends on !BR2_STATIC_LIBS
> > +     depends on BR2_USE_WCHAR # std::wstring
> > +     depends on BR2_HOST_GCC_AT_LEAST_5
> > +     depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
> > +     select BR2_PACKAGE_HOST_DEPOT_TOOLS
> > +     select BR2_PACKAGE_FREETYPE
> > +     select BR2_PACKAGE_ZLIB
> > +     help
> > +       Flutter is Google's SDK for crafting beautiful, fast user
> > +       experience for mobile, web, and desktop from a single
> > +       codebase. Flutter works with existing code, is used by
> > +       developers and organizations around the world, and is
> > +       free and open source.
> > +
> > +       The Flutter Engine is a portable runtime for hosting
> > +       Flutter applications. It implements Flutter's core
> > +       libraries, including animation and graphics, file and
> > +       network I/O, accessibility support, plugin architecture,
> > +       and a Dart runtime and compile toolchain. Most developers
> > +       will interact with Flutter via the Flutter Framework,
> > +       which provides a modern, reactive framework, and a rich
> > +       set of platform, layout and foundation widgets.
> > +
> > +       https://github.com/flutter/engine
> > +
> > +if BR2_PACKAGE_FLUTTER_ENGINE
> > +
> > +choice
> > +     prompt "Runtime mode"
> > +     default BR2_PACKAGE_FLUTTER_ENGINE_RUNTIME_RELEASE
>
> Mabye:
>     default BR2_PACKAGE_FLUTTER_ENGINE_RUNTIME_DEBUG if
> BR2_ENABLE_RUNTIME_DEBUG
>     default BR2_PACKAGE_FLUTTER_ENGINE_RUNTIME_RELEASE
>
> Which brings up the question: do we need the profile mode in Buildroot,
> or can we settle with just Release vs. Debug?
>
> If so, then no need for this choice; just test BR2_ENABLE_RUNTIME_DEBUG
> in flutter.mk
>
> There are many reasons why one would want to enable debugging specificall=
y
for their application.


> [--SNIP--]
> > diff --git a/package/flutter-engine/flutter-engine.mk
> b/package/flutter-engine/flutter-engine.mk
> > new file mode 100644
> > index 0000000000..aa392a31d8
> > --- /dev/null
> > +++ b/package/flutter-engine/flutter-engine.mk
> > @@ -0,0 +1,286 @@
> >
> +########################################################################=
########
> > +#
> > +# flutter-engine
> > +#
> >
> +########################################################################=
########
> > +
> > +# Flutter-engine has a release on the GitHub page. However, that
> release is
> > +# only for Google. Its intended purpose is for the gclient tool
> provided by
> > +# Google in their depot-tools package. To use the source code, we must
> use
> > +# gclient to download the flutter-engine source code along with severa=
l
> other
> > +# projects. Unfortunately, the Buildroot download system does not have
> the
> > +# capability of using gclient, and considering this package is the onl=
y
> > +# package that uses gclient, we side-step the entire download process
> and
> > +# perform the following steps if a tarball does not exist already:
> > +#
> > +#  - Copy the pre-made gclient config file to a temporary download
> > +#    directory.
> > +#  - Run gclient sync to generate a source directory with the proper
> > +#    flutter-engine source code in the correct places.
> > +#  - Run mk_tar_gz to create a tarball.
> > +#  - Copy the tarball to $(FLUTTER_ENGINE_DL_DIR)
> > +#    directory to create a reproducible tarball.
> > +#
> > +# There is no hash provided, as the gn binary (used for configuration)
> relies
> > +# on the .git directories, so there is no way to make reproducible
> tarballs.
> > +FLUTTER_ENGINE_VERSION =3D 3.10.6
> > +
> > +# There is nothing for Buildroot to download. This is handled by
> gclient.
> > +FLUTTER_ENGINE_SITE =3D
> > +FLUTTER_ENGINE_SOURCE =3D
> > +FLUTTER_ENGINE_LICENSE =3D BSD-3-Clause
> > +FLUTTER_ENGINE_LICENSE_FILES =3D LICENSE
> > +FLUTTER_ENGINE_TARBALL_PATH =3D
> $(FLUTTER_ENGINE_DL_DIR)/flutter-$(FLUTTER_ENGINE_VERSION).tar.gz
> > +FLUTTER_ENGINE_INSTALL_STAGING =3D YES
> > +FLUTTER_ENGINE_DOWNLOAD_DEPENDENCIES =3D host-depot-tools
> > +FLUTTER_ENGINE_DEPENDENCIES =3D \
> > +     host-clang \
> > +     host-ninja \
> > +     host-pkgconf \
> > +     freetype \
> > +     zlib
> > +
> > +# Dispatch all architectures of flutter
> > +ifeq ($(BR2_i386),y)
> > +FLUTTER_ENGINE_TARGET_ARCH =3D x86
> > +FLUTTER_ENGINE_TARGET_TRIPPLE =3D x86-linux
> > +else ifeq ($(BR2_x86_64),y)
> > +FLUTTER_ENGINE_TARGET_ARCH =3D x64
> > +FLUTTER_ENGINE_TARGET_TRIPPLE =3D x86_64-linux
> > +else ifeq ($(BR2_arm)$(BR2_armeb),y)
> > +FLUTTER_ENGINE_TARGET_ARCH =3D arm
> > +FLUTTER_ENGINE_TARGET_TRIPPLE =3D arm-linux
> > +else ifeq ($(BR2_aarch64),y)
> > +FLUTTER_ENGINE_TARGET_ARCH =3D arm64
> > +FLUTTER_ENGINE_TARGET_TRIPPLE =3D aarch64-linux
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_FLUTTER_ENGINE_RUNTIME_RELEASE),y)
> > +FLUTTER_ENGINE_RUNTIME_MODE=3Drelease
> > +else ifeq ($(BR2_PACKAGE_FLUTTER_ENGINE_RUNTIME_PROFILE),y)
> > +FLUTTER_ENGINE_RUNTIME=3Dprofile
> > +else
> > +FLUTTER_ENGINE_RUNTIME=3Ddebug
> > +endif
> > +
> > +FLUTTER_ENGINE_BUILD_DIR =3D \
> > +
>  $(@D)/out/linux_$(FLUTTER_ENGINE_RUNTIME_MODE)_$(FLUTTER_ENGINE_TARGET_A=
RCH)
> > +
> > +FLUTTER_ENGINE_INSTALL_FILES =3D libflutter_engine.so
> libflutter_linux_gtk.so
> > +
> > +FLUTTER_ENGINE_CONF_OPTS =3D \
> > +     --clang \
> > +     --depot-tools $(HOST_DIR)/share/depot_tools \
> > +     --embedder-for-target \
> > +     --linux-cpu $(FLUTTER_ENGINE_TARGET_ARCH) \
> > +     --no-build-embedder-examples \
> > +     --no-clang-static-analyzer \
> > +     --no-enable-unittests \
> > +     --no-goma \
> > +     --no-prebuilt-dart-sdk \
> > +     --runtime-mode $(FLUTTER_ENGINE_RUNTIME_MODE) \
> > +     --target-os linux \
> > +     --target-sysroot $(STAGING_DIR) \
> > +     --target-toolchain $(HOST_DIR) \
> > +     --target-triple $(FLUTTER_ENGINE_TARGET_TRIPPLE)
> > +
> > +ifeq ($(BR2_arm)$(BR2_armeb),y)
> > +FLUTTER_ENGINE_CONF_OPTS +=3D \
> > +     --arm-float-abi $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_FLUTTER_ENGINE_ARTIFACTS),y)
> > +FLUTTER_ENGINE_CONF_OPTS +=3D --build-engine-artifacts
> > +else
> > +FLUTTER_ENGINE_CONF_OPTS +=3D --no-build-engine-artifacts
> > +endif
> > +
> > +ifeq ($(BR2_OPTIMIZE_0),y)
> > +FLUTTER_ENGINE_CONF_OPTS +=3D --unoptimized
> > +endif
> > +
> > +ifeq ($(BR2_ENABLE_LTO),y)
> > +FLUTTER_ENGINE_CONF_OPTS +=3D --lto
> > +else
> > +FLUTTER_ENGINE_CONF_OPTS +=3D --no-lto
> > +endif
> > +
> > +ifeq ($(BR2_STRIP_strip),y)
> > +FLUTTER_ENGINE_CONF_OPTS +=3D --stripped
> > +else
> > +FLUTTER_ENGINE_CONF_OPTS +=3D --no-stripped
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
> > +FLUTTER_ENGINE_DEPENDENCIES +=3D fontconfig
> > +FLUTTER_ENGINE_CONF_OPTS +=3D --enable-fontconfig
>
>     else
>     FLUTTER_ENGINE_CONF_OPTS +=3D --disable-fontconfig
>
> No, this option does not exist.


> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
> > +FLUTTER_ENGINE_DEPENDENCIES +=3D libgl
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
> > +FLUTTER_ENGINE_DEPENDENCIES +=3D libgles
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_MESA3D),y)
> > +FLUTTER_ENGINE_DEPENDENCIES +=3D mesa3d
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)
> > +FLUTTER_ENGINE_CONF_OPTS +=3D --enable-vulkan
>
>     else
>     FLUTTER_ENGINE_CONF_OPTS +=3D --diable-vulkan
>
> No, this option also does not exist.

> > +endif
> > +
> > +ifneq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_LIBXCB),yy)
>
> Prefer positive logic:
>
>     ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_LIBXCB),yy)
>     FLUTTER_ENGINE_DEPENDENCIES +=3D libxcb
>     else
>     [the hack]
>     endif
>
> Works for me.


> > +define FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP
> > +     $(SED) "s%vulkan_use_x11.*%vulkan_use_x11 =3D false%g" -i \
> > +             $(@D)/build_overrides/vulkan_headers.gni
> > +endef
> > +FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS +=3D
> FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP
> > +else
> > +FLUTTER_ENGINE_DEPENDENCIES +=3D libxcb
> > +endif
> > +
> > +ifneq ($(BR2_PACKAGE_WAYLAND),y)
>
> Ditto, positive logic please.
>
> Sounds good.


> > +define FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP
> > +     $(SED) "s%vulkan_use_wayland.*%vulkan_use_wayland =3D false%g" \
> > +             $(@D)/build_overrides/vulkan_headers.gni
> > +endef
> > +FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS +=3D
> FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP
> > +else
> > +FLUTTER_ENGINE_DEPENDENCIES +=3D wayland
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_LIBGTK3),y)
> > +FLUTTER_ENGINE_DEPENDENCIES +=3D libgtk3
> > +else
> > +FLUTTER_ENGINE_CONF_OPTS +=3D --disable-desktop-embeddings
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_LIBGLFW),y)
> > +FLUTTER_ENGINE_DEPENDENCIES +=3D libglfw
> > +FLUTTER_ENGINE_CONF_OPTS +=3D --build-glfw-shell
> > +else
> > +FLUTTER_ENGINE_CONF_OPTS +=3D --no-build-glfw-shell
> > +endif
> > +
> > +# The clang toolchain wrapper causes a lot of the following errors:
> > +# error: -Wl,-z,now: 'linker' input unused
> [-Werror,-Wunused-command-line-argument]
> > +# error: -Wl,-z,relro: 'linker' input unused
> [-Werror,-Wunused-command-line-argument]
>
> Ah, that's because linker options are passed when we are not linking but
> just compiling. And that's an error because of -Werror!
>
> Can we disable -Werror instead of skipping the wrappers?
>
> Maybe? I looked for quite a while but couldn't find where wError is being
set.


> > +# Excplicitly use the real clang binaries for cc and cxx.
> > +ifeq ($(BR2_CCACHE),y)
> > +define FLUTTER_ENGINE_COMPILER_PATH_FIXUP
> > +     $(SED) "s%cc =3D.*%cc =3D \"\$${toolchain_bin}/ccache
> clang.br_real\""%g \
> > +             $(@D)/build/toolchain/custom/BUILD.gn
> > +
> > +     $(SED) "s%cxx =3D.*%cxx =3D \"\$${toolchain_bin}/ccache
> clang++.br_real\""%g \
> > +             $(@D)/build/toolchain/custom/BUILD.gn
> > +endef
> > +else
> > +define FLUTTER_ENGINE_COMPILER_PATH_FIXUP
> > +     $(SED) "s%cc =3D.*%cc =3D \"\$${toolchain_bin}/clang.br_real\""%g=
 \
> > +             $(@D)/build/toolchain/custom/BUILD.gn
> > +
> > +     $(SED) "s%cxx =3D.*%cxx =3D \"\$${toolchain_bin}/clang++.br_real\=
""%g \
> > +             $(@D)/build/toolchain/custom/BUILD.gn
> > +endef
> > +endif
> > +FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS +=3D FLUTTER_ENGINE_COMPILER_PATH_F=
IXUP
> > +
> > +# If using per_package builds, flutter-engine tries to use the
> /usr/bin/ld instead of
> > +# the one provided by the compiler, resulting in linking errors.
> > +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> > +define FLUTTER_ENGINE_GET_PATH
> > +     (ld_bin_path=3D$$(dirname $$(realpath $$(find
> $(PER_PACKAGE_DIR)/flutter-engine -name ld -type f))); \
> > +             echo
> $${ld_bin_path}:$(BR_PATH):$(HOST_DIR)/share/depot_tools; \
> > +     )
> > +endef
> > +else
> > +define FLUTTER_ENGINE_GET_PATH
> > +             echo $(BR_PATH):$(HOST_DIR)/share/depot_tools
> > +endef
> > +endif
> > +
> > +# Generate a tarball if one does not already exist.
> > +define FLUTTER_ENGINE_GENERATE_TARBALL
> > +     (if [ ! -e $(FLUTTER_ENGINE_TARBALL_PATH) ]; then \
>
> Don't use a subshell here (parenthesis are toally unneeded and
> superfluous).
>
> Sounds good

> > +             . ./support/download/helpers && \
> > +             rm -rf $(@D)/dl-tmp && mkdir -p $(@D)/dl-tmp && \
> > +             $(INSTALL) -D -m 0755 $(FLUTTER_ENGINE_PKGDIR)/gclient \
>
> This is not gclient, this is .gclient, but having a source fiel that is
> a dot-file in the tree is not nice. Can we just name it dot-gclient
> instead:
>
> Sure

>     $(FLUTTER_ENGINE_PKGDIR)/dot-gclient
>
> > +                     $(@D)/dl-tmp/.gclient && \
> > +             $(SED) "s%!FLUTTER_VERSION!%$(FLUTTER_ENGINE_VERSION)%g" =
\
> > +                     $(@D)/dl-tmp/.gclient && \
> > +             cd $(@D)/dl-tmp && \
> > +             $(DEPOT_TOOLS_GCLIENT) \
> > +                     sync \
> > +                     --delete_unversioned_trees \
> > +                     -j$(PARALLEL_JOBS) \
> > +                     --no-history \
> > +                     --reset \
> > +                     --shallow && \
> > +             mkdir -p $(FLUTTER_ENGINE_DL_DIR); \
> > +             cd $(@D)/dl-tmp && \
> > +             mk_tar_gz \
> > +             $(@D)/dl-tmp/src \
> > +             flutter-$(FLUTTER_ENGINE_VERSION) \
> > +             "$$(git -C $(@D)/dl-tmp/src log -1 --pretty=3Dformat:%ci)=
" \
> > +             $(FLUTTER_ENGINE_TARBALL_PATH) && \
> > +             rm -rf $(@D)/dl-tmp; \
> > +     fi \
> > +     )
>
> I think this big if-block should go into a helper script (yeah, yeah., I
> may have written something using make code in my earlier suggestion, but
> that was not smart of me...)
>
> So:
>     define FLUTTER_ENGINE_GENERATE_TARBALL
>         $(FLUTTER_PKGDIR)/gen-tarball \
>             --version $(FLUTTER_ENGINE_VERSION) \
>             --tarball $(FLUTTER_ENGINE_TARBALL_PATH) \
>             --dot-gclient $(FLUTTER_ENGINE_PKGDIR)/dot-gclient \
>             --scratch-dir $(@D)/dl-tmp
>     endef
>
> And then a sequence of complex script shell is easier to write, to
> review, and to maintain.
>

I had a script originally, and then you suggested to use the Makefile! Gah!
Make up your mind! :^)

> > +endef
> > +FLUTTER_ENGINE_POST_DOWNLOAD_HOOKS +=3D FLUTTER_ENGINE_GENERATE_TARBAL=
L
> > +
> > +define FLUTTER_ENGINE_EXTRACT_CMDS
> > +     gzip -d -c $(FLUTTER_ENGINE_TARBALL_PATH) | tar --strip-component=
s
> 1 -C $(@D) -xf -
> > +endef
> > +
> > +define FLUTTER_ENGINE_CONFIGURE_CMDS
> > +  # libtessellator requires these three files, but the toolchain path
> isn't
> > +  # referenced when linking. Copy them to the staging lib directory
> before
> > +  # building.
> > +     $(Q)$(foreach i,crtbeginS.o crtendS.o libgcc.a,
> > +             $(Q)if [ ! -e $(STAGING_DIR)/usr/lib/$(i) ]; then \
> > +                     file_path=3D$$(find $(HOST_DIR) -type f -name $(i=
));
> \
>
> This is going to be a bit more complex than that, because of multi-lib
> or multi-arch external toolchains. See the mess it is to find the
> sysroot in toolchain/helpers.mk
>
> But seriously though, why are they not brought in? Did you try to run
> the linking command manually in debug mode (--verbose if calling ld
> directly, of -Wl.--verbose if using gcc to link)?
>
> Is it using ld to do the link, or is it using gcc?
>
> Is ld binutils', or is it lld? This might also have a link as to why
> -Wl,-z,now and -Wl,-z,relro are not supported...
>

I'll do more research into this and get back to you.

> > +                     $(INSTALL) -D -m 0755 $${file_path}
> $(STAGING_DIR)/usr/lib/$(i); \
> > +             fi \
> > +     )
> > +     (cd $(@D)/ && \
> > +             rm -rf $(FLUTTER_ENGINE_BUILD_DIR) && \
> > +             PATH=3D$(shell $(call FLUTTER_ENGINE_GET_PATH)) \
> > +             ./flutter/tools/gn $(FLUTTER_ENGINE_CONF_OPTS) \
> > +     )
> > +endef
> > +
> > +define FLUTTER_ENGINE_BUILD_CMDS
> > +     (cd $(@D); \
> > +             PATH=3D$(shell $(call FLUTTER_ENGINE_GET_PATH)) \
> > +             PYTHONNOUSERSITE=3Dy \
> > +             $(HOST_DIR)/bin/ninja \
> > +                     -j $(PARALLEL_JOBS) \
> > +                     -C $(FLUTTER_ENGINE_BUILD_DIR) \
> > +     )
> > +endef
> > +
> > +define FLUTTER_ENGINE_INSTALL_STAGING_CMDS
> > +     $(foreach i,$(FLUTTER_ENGINE_INSTALL_STAGING_FILES),
>
> Err... FLUTTER_ENGINE_INSTALL_STAGING_FILES is set nowhere?
>
> Yeah, should just be  FLUTTER_ENGINE_INSTALL_FILES

> Regards,
> Yann E. MORIN.
>
> > +             $(Q)if [ -e $(FLUTTER_ENGINE_BUILD_DIR)/$(i) ]; then \
> > +                     $(INSTALL) -D -m 0755
> $(FLUTTER_ENGINE_BUILD_DIR)/$(i) \
> > +                             $(STAGING_DIR)/usr/lib/$(i); \
> > +             fi \
> > +     )
> > +     $(INSTALL) -D -m 0755
> $(FLUTTER_ENGINE_BUILD_DIR)/flutter_embedder.h \
> > +             $(STAGING_DIR)/usr/include/flutter_embedder.h
> > +endef
> > +
> > +define FLUTTER_ENGINE_INSTALL_TARGET_CMDS
> > +     $(foreach i,$(FLUTTER_ENGINE_INSTALL_FILES),
> > +             $(Q)if [ -e $(FLUTTER_ENGINE_BUILD_DIR)/$(i) ]; then \
> > +                     $(INSTALL) -D -m 0755
> $(FLUTTER_ENGINE_BUILD_DIR)/$(i) \
> > +                             $(TARGET_DIR)/usr/lib/$(i); \
> > +             fi \
> > +     )
> > +endef
> > +
> > +$(eval $(generic-package))
> > diff --git a/package/flutter-engine/gclient
> b/package/flutter-engine/gclient
> > new file mode 100644
> > index 0000000000..168e9a368d
> > --- /dev/null
> > +++ b/package/flutter-engine/gclient
> > @@ -0,0 +1,16 @@
> > +# This file is taken from the output of meta-flutter/lib/gn.py
> > +
> > +solutions =3D [{
> > +    "managed": False,
> > +    "name": "src/flutter",
> > +    "url": "https://github.com/flutter/engine.git@!FLUTTER_VERSION!",
> > +    "custom_vars": {
> > +        "download_android_deps": False,
> > +        "download_windows_deps": False,
> > +        "download_linux_deps": False
> > +    },
> > +    "custom_deps": {
> > +        "src/third_party/dart/third_party/pkg/tools":
> > +        "
> https://dart.googlesource.com/tools.git@unified_analytics-v1.1.0"
> > +    }
> > +}]
> > --
> > 2.41.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------=
------'
>

--0000000000000360e606015185bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello Yann;</div><div><br></div><div=
><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><span><p =
dir=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);ba=
ckground-color:transparent;vertical-align:baseline;white-space:pre-wrap">Ad=
am Duskett</span></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu =
Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical=
-align:baseline;white-space:pre-wrap">Senior Embedded Systems Developer</sp=
an></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,mon=
ospace;color:rgb(0,0,0);background-color:transparent;vertical-align:baselin=
e;white-space:pre-wrap">M. +1208-515-8102</span></p><p dir=3D"ltr" style=3D=
"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size=
:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);backgr=
ound-color:transparent;vertical-align:baseline;white-space:pre-wrap"><a hre=
f=3D"mailto:adam.duskett@amarulasolutions.com" target=3D"_blank">adam.duske=
tt@amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1=
.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-fam=
ily:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:tra=
nsparent;vertical-align:baseline;white-space:pre-wrap">____________________=
______________</span></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubu=
ntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vert=
ical-align:baseline;white-space:pre-wrap"><br></span><span style=3D"font-si=
ze:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;vertical-align:baseline;white-space:pre-wrap">Amarula Solutions BV=
</span></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-bo=
ttom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;=
,monospace;color:rgb(0,0,0);background-color:transparent;vertical-align:bas=
eline;white-space:pre-wrap">Joop Geesinkweg 125, 1114 AB, Amsterdam, NL</sp=
an></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,mon=
ospace;color:rgb(0,0,0);background-color:transparent;vertical-align:baselin=
e;white-space:pre-wrap">T. +31 (0)85 111 9170</span><span style=3D"font-siz=
e:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);backg=
round-color:transparent;vertical-align:baseline;white-space:pre-wrap"><br><=
/span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,mon=
ospace;color:rgb(0,0,0);background-color:transparent;vertical-align:baselin=
e;white-space:pre-wrap"><a href=3D"mailto:info@amarulasolutions.com" target=
=3D"_blank">info@amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D=
"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><a href=3D"http://www.am=
arulasolutions.com/" target=3D"_blank"><span style=3D"font-size:10pt;font-f=
amily:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:t=
ransparent;vertical-align:baseline;white-space:pre-wrap">www.amarulasolutio=
ns.com</span></a></p><div><br></div></span></div></div></div><br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On S=
un, Jul 23, 2023 at 2:26=E2=80=AFPM Yann E. MORIN &lt;<a href=3D"mailto:yan=
n.morin.1998@free.fr">yann.morin.1998@free.fr</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Adam, All,<br>
<br>
On 2023-07-20 16:36 -0700, Adam Duskett spake thusly:<br>
&gt; There are many issues with this package:<br>
&gt; <br>
&gt; - The release tarballs from <a href=3D"https://github.com/flutter/engi=
ne" rel=3D"noreferrer" target=3D"_blank">https://github.com/flutter/engine<=
/a> are in no state<br>
&gt;=C2=A0 =C2=A0to compile. They are only for the use of gclient to downlo=
ad a source<br>
&gt;=C2=A0 =C2=A0directory structure suitable to build the Flutter engine! =
If you download,<br>
&gt;=C2=A0 =C2=A0extract and attempt to run `./tools/gn --no-goma --no-preb=
uilt-dart-sdk`, you<br>
&gt;=C2=A0 =C2=A0receive the error message:<br>
&gt;=C2=A0 =C2=A0`No such file or directory: &#39;flutter/flutter/third_par=
ty/gn/gn.&#39;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0But wait! Wasn&#39;t the gn binary just called? No, that&#=
39;s a wrapper in the<br>
&gt;=C2=A0 =C2=A0Flutter source tree that formats arguments to call the rea=
l gn binary.<br>
&gt;=C2=A0 =C2=A0The real gn is not provided in the tarball but is download=
ed via gclient<br>
&gt;=C2=A0 =C2=A0(among many other supporting repositories.)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Even worse, the flutter repository depends on the .git dir=
s being present.<br>
<br>
s/flutter repository/flutter buildsystem/=C2=A0 maybe?<br>
<br>
&gt;=C2=A0 =C2=A0(<a href=3D"https://github.com/meta-flutter/meta-flutter/i=
ssues/271" rel=3D"noreferrer" target=3D"_blank">https://github.com/meta-flu=
tter/meta-flutter/issues/271</a>) This dependency<br>
&gt;=C2=A0 =C2=A0means it is not possible to create a reproducible tarball =
from the downloaded<br>
&gt;=C2=A0 =C2=A0sources, which is why there is no .hash file provided.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0I have asked the flutter project to release full tarballs =
suitable for<br>
&gt;=C2=A0 =C2=A0compiling here: <a href=3D"https://github.com/flutter/flut=
ter/issues/130734" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
flutter/flutter/issues/130734</a><br>
&gt; <br>
&gt; - The clang toolchain wrapper does not work properly, resulting in the=
 immediate<br>
&gt;=C2=A0 =C2=A0errors of:<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Wl,-z,now: &#39;linker&#39; input unused<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Wl,-z,relro: &#39;linker&#39; input unused<br>
<br>
Those two are us adding them because of BR2_RELRO_FULL (-Wl,-z,relro<br>
alone would be due to BR2_RELRO_PARTIAL).<br>
<br>
It does recognise that they are linker options, but why are they<br>
rejected? Do you have more context to provide?<br>
<br>
&gt;=C2=A0 =C2=A0The solution is to use clang.br_real and clang++.br_real.<=
br>
<br>
Most probably not, because you lose a lot of the options set by<br>
Buildroot (optimisation ,target CPU, etc...). The real solution is to<br>
understand why -Wl-z-relro/now are rejected, and if they really are not<br>
needed, to find a way to tell the toolchain wrapper not set them for<br>
clang tools.<br>
<br>
&gt; - If using per_package builds, flutter-engine tries to use the host /u=
sr/bin/ld<br>
&gt;=C2=A0 =C2=A0instead of the one provided by the compiler, resulting in =
linking errors.<br>
&gt;=C2=A0 =C2=A0As such, if BR2_PER_PACKAGE_DIRECTORIES is enabled, we sea=
rch for the ld<br>
&gt;=C2=A0 =C2=A0provided by the compiler in the host directory and set the=
 path accordingly.<br>
<br>
Can this be related to the above -Wl issue?<br>
<br>
&gt; - libtessellator.so (built by flutter) requires three files:<br>
&gt;=C2=A0 =C2=A0crtbeginS.o crtendS.o libgcc.a. However, the toolchain pat=
h isn&#39;t referenced<br>
&gt;=C2=A0 =C2=A0when linking. The solution is to copy those three files to=
 the staging lib<br>
&gt;=C2=A0 =C2=A0directory before building.<br>
&gt; <br>
&gt; Tested with:<br>
&gt;=C2=A0 =C2=A0- Debian 11 and 12<br>
&gt;=C2=A0 =C2=A0- Ubuntu 18.04, 20.04, and 22.04<br>
&gt;=C2=A0 =C2=A0- Fedora 38<br>
&gt;=C2=A0 =C2=A0- Per package directory enabled and disabled<br>
&gt;=C2=A0 =C2=A0- x86_64, arm64<br>
&gt; <br>
&gt; Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarula=
solutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<=
br>
&gt; ---<br>
[--SNIP--]<br>
&gt; diff --git a/package/flutter-engine/0001-disable-pre-canned-sysroot.pa=
tch b/package/flutter-engine/0001-disable-pre-canned-sysroot.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..c4064a77c9<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/flutter-engine/0001-disable-pre-canned-sysroot.patch<br>
&gt; @@ -0,0 +1,32 @@<br>
&gt; +From 49a14e693124dc34f2cccbfb755d01a1198aa6bf Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolution=
s.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<br>
<br>
You&#39;re not the author; Joel Winarske is. That&#39;s also the authorship=
<br>
there is in the upstream issue you referenced.<br>
<br>
[--SNIP--]<br>
&gt; diff --git a/package/flutter-engine/0002-remove-explicit-x11-dependenc=
y.patch b/package/flutter-engine/0002-remove-explicit-x11-dependency.patch<=
br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1345d4a3dd<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/flutter-engine/0002-remove-explicit-x11-dependency.patch=
<br>
&gt; @@ -0,0 +1,33 @@<br>
&gt; +From b1a5db9318ca33a03f2700758d5debad907d21b6 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolution=
s.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<br>
<br>
Ditto<br>
</blockquote><div>=C2=A0</div><div>Yeah, my bad. I&#39;ll fix immediatly.</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +Date: Wed, 19 Jul 2023 15:26:40 -0700<br>
&gt; +Subject: [PATCH] remove explicit x11 dependency<br>
&gt; +<br>
&gt; +This is redundant, as the gtk pkg-config query will reference x11 if =
that&#39;s how<br>
<br>
Not so much redundant, but rather superfluous and may conflict with the<br>
actual rendering system used in gtk3 (e.g. wayland).<br>
<br>
&gt; diff --git a/package/flutter-engine/0003-disable-undefined-version.pat=
ch b/package/flutter-engine/0003-disable-undefined-version.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..468ec4daf9<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/flutter-engine/0003-disable-undefined-version.patch<br>
&gt; @@ -0,0 +1,32 @@<br>
&gt; +From 9512040259f3970dd5ca08fd9ebcfd42e7539997 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Adam Duskett &lt;<a href=3D"mailto:aduskett@gmail.com" target=
=3D"_blank">aduskett@gmail.com</a>&gt;<br>
&gt; +Date: Tue, 18 Jul 2023 15:21:51 -0700<br>
&gt; +Subject: [PATCH] Disable undefined-version<br>
&gt; +<br>
&gt; +This isn&#39;t a valid flag for ld, and flutter compiles just fine wi=
th the<br>
&gt; +no-undefined-version flag.<br>
<br>
Without that option, the linker will just ignore a symbol with an<br>
undefined version. With the option, a smbol with an undefined version<br>
turns into an error.<br>
<br>
So indeed, without the option, the check is relaxed so it is not<br>
surprising the build does not fail.<br>
<br></blockquote><div>The option doesn&#39;t exist for ld afaik. If that op=
tion isn&#39;t changed ld returns with something</div><div>along the lines =
of &quot;no such option: no-undefined-version.&quot;</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
[--SNIP--]<br>
&gt; diff --git a/package/flutter-engine/Config.in b/package/flutter-engine=
/Config.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..fe72191e77<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/flutter-engine/Config.in<br>
&gt; @@ -0,0 +1,93 @@<br>
&gt; +config BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default y if BR2_aarch64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default y if BR2_arm &amp;&amp; !BR2_ARM_CPU_ARMV=
4 &amp;&amp; !BR2_ARM_CPU_ARMV5<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default y if BR2_i386<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default y if BR2_x86_64<br>
<br>
Since it uses clang, i&#39;d also add: BR2_PACKAGE_LLVM_ARCH_SUPPORTS, but<=
br>
this is a bit fuzzy for me what option we should add, if any...<br>
<br>
&gt; +<br>
&gt; +config BR2_PACKAGE_FLUTTER_ENGINE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;flutter-engine&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPOR=
TS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_USES_GLIBC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthre=
ads<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std=
::shared_future<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_STATIC_LIBS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_USE_WCHAR # std::wstring<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_HOST_GCC_AT_LEAST_5<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_H=
AS_LIBGLES<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_DEPOT_TOOLS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_FREETYPE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_ZLIB<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Flutter is Google&#39;s SDK for crafting b=
eautiful, fast user<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0experience for mobile, web, and desktop fr=
om a single<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0codebase. Flutter works with existing code=
, is used by<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0developers and organizations around the wo=
rld, and is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0free and open source.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0The Flutter Engine is a portable runtime f=
or hosting<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Flutter applications. It implements Flutte=
r&#39;s core<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0libraries, including animation and graphic=
s, file and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0network I/O, accessibility support, plugin=
 architecture,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0and a Dart runtime and compile toolchain. =
Most developers<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0will interact with Flutter via the Flutter=
 Framework,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0which provides a modern, reactive framewor=
k, and a rich<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0set of platform, layout and foundation wid=
gets.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/flutter/engi=
ne" rel=3D"noreferrer" target=3D"_blank">https://github.com/flutter/engine<=
/a><br>
&gt; +<br>
&gt; +if BR2_PACKAGE_FLUTTER_ENGINE<br>
&gt; +<br>
&gt; +choice<br>
&gt; +=C2=A0 =C2=A0 =C2=A0prompt &quot;Runtime mode&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default BR2_PACKAGE_FLUTTER_ENGINE_RUNTIME_RELEAS=
E<br>
<br>
Mabye:<br>
=C2=A0 =C2=A0 default BR2_PACKAGE_FLUTTER_ENGINE_RUNTIME_DEBUG if BR2_ENABL=
E_RUNTIME_DEBUG<br>
=C2=A0 =C2=A0 default BR2_PACKAGE_FLUTTER_ENGINE_RUNTIME_RELEASE<br>
<br>
Which brings up the question: do we need the profile mode in Buildroot,<br>
or can we settle with just Release vs. Debug?<br>
<br>
If so, then no need for this choice; just test BR2_ENABLE_RUNTIME_DEBUG<br>
in <a href=3D"http://flutter.mk" rel=3D"noreferrer" target=3D"_blank">flutt=
er.mk</a><br>
<br></blockquote><div>There are many reasons why one would want to enable d=
ebugging specifically for their application.</div><div>=C2=A0<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
[--SNIP--]<br>
&gt; diff --git a/package/flutter-engine/<a href=3D"http://flutter-engine.m=
k" rel=3D"noreferrer" target=3D"_blank">flutter-engine.mk</a> b/package/flu=
tter-engine/<a href=3D"http://flutter-engine.mk" rel=3D"noreferrer" target=
=3D"_blank">flutter-engine.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..aa392a31d8<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/flutter-engine/<a href=3D"http://flutter-engine.mk" rel=
=3D"noreferrer" target=3D"_blank">flutter-engine.mk</a><br>
&gt; @@ -0,0 +1,286 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# flutter-engine<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
&gt; +<br>
&gt; +# Flutter-engine has a release on the GitHub page. However, that rele=
ase is<br>
&gt; +# only for Google. Its intended purpose is for the gclient tool provi=
ded by<br>
&gt; +# Google in their depot-tools package. To use the source code, we mus=
t use<br>
&gt; +# gclient to download the flutter-engine source code along with sever=
al other<br>
&gt; +# projects. Unfortunately, the Buildroot download system does not hav=
e the<br>
&gt; +# capability of using gclient, and considering this package is the on=
ly<br>
&gt; +# package that uses gclient, we side-step the entire download process=
 and<br>
&gt; +# perform the following steps if a tarball does not exist already:<br=
>
&gt; +#<br>
&gt; +#=C2=A0 - Copy the pre-made gclient config file to a temporary downlo=
ad<br>
&gt; +#=C2=A0 =C2=A0 directory.<br>
&gt; +#=C2=A0 - Run gclient sync to generate a source directory with the pr=
oper<br>
&gt; +#=C2=A0 =C2=A0 flutter-engine source code in the correct places.<br>
&gt; +#=C2=A0 - Run mk_tar_gz to create a tarball.<br>
&gt; +#=C2=A0 - Copy the tarball to $(FLUTTER_ENGINE_DL_DIR)<br>
&gt; +#=C2=A0 =C2=A0 directory to create a reproducible tarball.<br>
&gt; +#<br>
&gt; +# There is no hash provided, as the gn binary (used for configuration=
) relies<br>
&gt; +# on the .git directories, so there is no way to make reproducible ta=
rballs.<br>
&gt; +FLUTTER_ENGINE_VERSION =3D 3.10.6<br>
&gt; +<br>
&gt; +# There is nothing for Buildroot to download. This is handled by gcli=
ent.<br>
&gt; +FLUTTER_ENGINE_SITE =3D<br>
&gt; +FLUTTER_ENGINE_SOURCE =3D<br>
&gt; +FLUTTER_ENGINE_LICENSE =3D BSD-3-Clause<br>
&gt; +FLUTTER_ENGINE_LICENSE_FILES =3D LICENSE<br>
&gt; +FLUTTER_ENGINE_TARBALL_PATH =3D $(FLUTTER_ENGINE_DL_DIR)/flutter-$(FL=
UTTER_ENGINE_VERSION).tar.gz<br>
&gt; +FLUTTER_ENGINE_INSTALL_STAGING =3D YES<br>
&gt; +FLUTTER_ENGINE_DOWNLOAD_DEPENDENCIES =3D host-depot-tools<br>
&gt; +FLUTTER_ENGINE_DEPENDENCIES =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-clang \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-ninja \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-pkgconf \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0freetype \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0zlib<br>
&gt; +<br>
&gt; +# Dispatch all architectures of flutter<br>
&gt; +ifeq ($(BR2_i386),y)<br>
&gt; +FLUTTER_ENGINE_TARGET_ARCH =3D x86<br>
&gt; +FLUTTER_ENGINE_TARGET_TRIPPLE =3D x86-linux<br>
&gt; +else ifeq ($(BR2_x86_64),y)<br>
&gt; +FLUTTER_ENGINE_TARGET_ARCH =3D x64<br>
&gt; +FLUTTER_ENGINE_TARGET_TRIPPLE =3D x86_64-linux<br>
&gt; +else ifeq ($(BR2_arm)$(BR2_armeb),y)<br>
&gt; +FLUTTER_ENGINE_TARGET_ARCH =3D arm<br>
&gt; +FLUTTER_ENGINE_TARGET_TRIPPLE =3D arm-linux<br>
&gt; +else ifeq ($(BR2_aarch64),y)<br>
&gt; +FLUTTER_ENGINE_TARGET_ARCH =3D arm64<br>
&gt; +FLUTTER_ENGINE_TARGET_TRIPPLE =3D aarch64-linux<br>
&gt; +endif<br>
&gt; +<br>
&gt; +ifeq ($(BR2_PACKAGE_FLUTTER_ENGINE_RUNTIME_RELEASE),y)<br>
&gt; +FLUTTER_ENGINE_RUNTIME_MODE=3Drelease<br>
&gt; +else ifeq ($(BR2_PACKAGE_FLUTTER_ENGINE_RUNTIME_PROFILE),y)<br>
&gt; +FLUTTER_ENGINE_RUNTIME=3Dprofile<br>
&gt; +else<br>
&gt; +FLUTTER_ENGINE_RUNTIME=3Ddebug<br>
&gt; +endif<br>
&gt; +<br>
&gt; +FLUTTER_ENGINE_BUILD_DIR =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(@D)/out/linux_$(FLUTTER_ENGINE_RUNTIME_MODE)_$(=
FLUTTER_ENGINE_TARGET_ARCH)<br>
&gt; +<br>
&gt; +FLUTTER_ENGINE_INSTALL_FILES =3D libflutter_engine.so libflutter_linu=
x_gtk.so<br>
&gt; +<br>
&gt; +FLUTTER_ENGINE_CONF_OPTS =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--clang \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--depot-tools $(HOST_DIR)/share/depot_tools \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--embedder-for-target \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--linux-cpu $(FLUTTER_ENGINE_TARGET_ARCH) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--no-build-embedder-examples \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--no-clang-static-analyzer \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--no-enable-unittests \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--no-goma \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--no-prebuilt-dart-sdk \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--runtime-mode $(FLUTTER_ENGINE_RUNTIME_MODE) \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0--target-os linux \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--target-sysroot $(STAGING_DIR) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--target-toolchain $(HOST_DIR) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--target-triple $(FLUTTER_ENGINE_TARGET_TRIPPLE)<=
br>
&gt; +<br>
&gt; +ifeq ($(BR2_arm)$(BR2_armeb),y)<br>
&gt; +FLUTTER_ENGINE_CONF_OPTS +=3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--arm-float-abi $(call qstrip,$(BR2_GCC_TARGET_FL=
OAT_ABI))<br>
&gt; +endif<br>
&gt; +<br>
&gt; +ifeq ($(BR2_PACKAGE_FLUTTER_ENGINE_ARTIFACTS),y)<br>
&gt; +FLUTTER_ENGINE_CONF_OPTS +=3D --build-engine-artifacts<br>
&gt; +else<br>
&gt; +FLUTTER_ENGINE_CONF_OPTS +=3D --no-build-engine-artifacts<br>
&gt; +endif<br>
&gt; +<br>
&gt; +ifeq ($(BR2_OPTIMIZE_0),y)<br>
&gt; +FLUTTER_ENGINE_CONF_OPTS +=3D --unoptimized<br>
&gt; +endif<br>
&gt; +<br>
&gt; +ifeq ($(BR2_ENABLE_LTO),y)<br>
&gt; +FLUTTER_ENGINE_CONF_OPTS +=3D --lto<br>
&gt; +else<br>
&gt; +FLUTTER_ENGINE_CONF_OPTS +=3D --no-lto<br>
&gt; +endif<br>
&gt; +<br>
&gt; +ifeq ($(BR2_STRIP_strip),y)<br>
&gt; +FLUTTER_ENGINE_CONF_OPTS +=3D --stripped<br>
&gt; +else<br>
&gt; +FLUTTER_ENGINE_CONF_OPTS +=3D --no-stripped<br>
&gt; +endif<br>
&gt; +<br>
&gt; +ifeq ($(BR2_PACKAGE_FONTCONFIG),y)<br>
&gt; +FLUTTER_ENGINE_DEPENDENCIES +=3D fontconfig<br>
&gt; +FLUTTER_ENGINE_CONF_OPTS +=3D --enable-fontconfig<br>
<br>
=C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 FLUTTER_ENGINE_CONF_OPTS +=3D --disable-fontconfig<br>
<br></blockquote><div>No, this option does not exist.</div><div>=C2=A0<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +endif<br>
&gt; +<br>
&gt; +ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)<br>
&gt; +FLUTTER_ENGINE_DEPENDENCIES +=3D libgl<br>
&gt; +endif<br>
&gt; +<br>
&gt; +ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)<br>
&gt; +FLUTTER_ENGINE_DEPENDENCIES +=3D libgles<br>
&gt; +endif<br>
&gt; +<br>
&gt; +ifeq ($(BR2_PACKAGE_MESA3D),y)<br>
&gt; +FLUTTER_ENGINE_DEPENDENCIES +=3D mesa3d<br>
&gt; +endif<br>
&gt; +<br>
&gt; +ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)<br>
&gt; +FLUTTER_ENGINE_CONF_OPTS +=3D --enable-vulkan<br>
<br>
=C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 FLUTTER_ENGINE_CONF_OPTS +=3D --diable-vulkan<br>
<br></blockquote><div>No, this option also does not exist. <br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
&gt; +endif<br>
&gt; +<br>
&gt; +ifneq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_LIBXCB),yy)<br>
<br>
Prefer positive logic:<br>
<br>
=C2=A0 =C2=A0 ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_LIBXCB),yy)<br>
=C2=A0 =C2=A0 FLUTTER_ENGINE_DEPENDENCIES +=3D libxcb<br>
=C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 [the hack]<br>
=C2=A0 =C2=A0 endif<br>
<br></blockquote><div>Works for me.</div><div>=C2=A0<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
&gt; +define FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(SED) &quot;s%vulkan_use_x11.*%vulkan_use_x11 =
=3D false%g&quot; -i \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(@D)/build_overrides=
/vulkan_headers.gni<br>
&gt; +endef<br>
&gt; +FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS +=3D FLUTTER_ENGINE_VULKAN_X11_SUP=
PORT_FIXUP<br>
&gt; +else<br>
&gt; +FLUTTER_ENGINE_DEPENDENCIES +=3D libxcb<br>
&gt; +endif<br>
&gt; +<br>
&gt; +ifneq ($(BR2_PACKAGE_WAYLAND),y)<br>
<br>
Ditto, positive logic please.<br>
<br></blockquote><div>Sounds good.</div><div>=C2=A0<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
&gt; +define FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(SED) &quot;s%vulkan_use_wayland.*%vulkan_use_wa=
yland =3D false%g&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(@D)/build_overrides=
/vulkan_headers.gni<br>
&gt; +endef<br>
&gt; +FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS +=3D FLUTTER_ENGINE_VULKAN_WAYLAND=
_SUPPORT_FIXUP<br>
&gt; +else<br>
&gt; +FLUTTER_ENGINE_DEPENDENCIES +=3D wayland<br>
&gt; +endif<br>
&gt; +<br>
&gt; +ifeq ($(BR2_PACKAGE_LIBGTK3),y)<br>
&gt; +FLUTTER_ENGINE_DEPENDENCIES +=3D libgtk3<br>
&gt; +else<br>
&gt; +FLUTTER_ENGINE_CONF_OPTS +=3D --disable-desktop-embeddings<br>
&gt; +endif<br>
&gt; +<br>
&gt; +ifeq ($(BR2_PACKAGE_LIBGLFW),y)<br>
&gt; +FLUTTER_ENGINE_DEPENDENCIES +=3D libglfw<br>
&gt; +FLUTTER_ENGINE_CONF_OPTS +=3D --build-glfw-shell<br>
&gt; +else<br>
&gt; +FLUTTER_ENGINE_CONF_OPTS +=3D --no-build-glfw-shell<br>
&gt; +endif<br>
&gt; +<br>
&gt; +# The clang toolchain wrapper causes a lot of the following errors:<b=
r>
&gt; +# error: -Wl,-z,now: &#39;linker&#39; input unused [-Werror,-Wunused-=
command-line-argument]<br>
&gt; +# error: -Wl,-z,relro: &#39;linker&#39; input unused [-Werror,-Wunuse=
d-command-line-argument]<br>
<br>
Ah, that&#39;s because linker options are passed when we are not linking bu=
t<br>
just compiling. And that&#39;s an error because of -Werror!<br>
<br>
Can we disable -Werror instead of skipping the wrappers?<br>
<br></blockquote><div>Maybe? I looked for quite a while but couldn&#39;t fi=
nd where wError is being set.</div><div>=C2=A0<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt; +# Excplicitly use the real clang binaries for cc and cxx.<br>
&gt; +ifeq ($(BR2_CCACHE),y)<br>
&gt; +define FLUTTER_ENGINE_COMPILER_PATH_FIXUP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(SED) &quot;s%cc =3D.*%cc =3D \&quot;\$${toolcha=
in_bin}/ccache clang.br_real\&quot;&quot;%g \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(@D)/build/toolchain=
/custom/BUILD.gn<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(SED) &quot;s%cxx =3D.*%cxx =3D \&quot;\$${toolc=
hain_bin}/ccache clang++.br_real\&quot;&quot;%g \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(@D)/build/toolchain=
/custom/BUILD.gn<br>
&gt; +endef<br>
&gt; +else<br>
&gt; +define FLUTTER_ENGINE_COMPILER_PATH_FIXUP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(SED) &quot;s%cc =3D.*%cc =3D \&quot;\$${toolcha=
in_bin}/clang.br_real\&quot;&quot;%g \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(@D)/build/toolchain=
/custom/BUILD.gn<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(SED) &quot;s%cxx =3D.*%cxx =3D \&quot;\$${toolc=
hain_bin}/clang++.br_real\&quot;&quot;%g \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(@D)/build/toolchain=
/custom/BUILD.gn<br>
&gt; +endef<br>
&gt; +endif<br>
&gt; +FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS +=3D FLUTTER_ENGINE_COMPILER_PATH_=
FIXUP<br>
&gt; +<br>
&gt; +# If using per_package builds, flutter-engine tries to use the /usr/b=
in/ld instead of<br>
&gt; +# the one provided by the compiler, resulting in linking errors.<br>
&gt; +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)<br>
&gt; +define FLUTTER_ENGINE_GET_PATH<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(ld_bin_path=3D$$(dirname $$(realpath $$(find $(P=
ER_PACKAGE_DIR)/flutter-engine -name ld -type f))); \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo $${ld_bin_path}:=
$(BR_PATH):$(HOST_DIR)/share/depot_tools; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0)<br>
&gt; +endef<br>
&gt; +else<br>
&gt; +define FLUTTER_ENGINE_GET_PATH<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo $(BR_PATH):$(HOS=
T_DIR)/share/depot_tools<br>
&gt; +endef<br>
&gt; +endif<br>
&gt; +<br>
&gt; +# Generate a tarball if one does not already exist.<br>
&gt; +define FLUTTER_ENGINE_GENERATE_TARBALL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(if [ ! -e $(FLUTTER_ENGINE_TARBALL_PATH) ]; then=
 \<br>
<br>
Don&#39;t use a subshell here (parenthesis are toally unneeded and<br>
superfluous).<br>
<br></blockquote><div>Sounds good <br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0. ./support/download/=
helpers &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf $(@D)/dl-tmp &=
amp;&amp; mkdir -p $(@D)/dl-tmp &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0755=
 $(FLUTTER_ENGINE_PKGDIR)/gclient \<br>
<br>
This is not gclient, this is .gclient, but having a source fiel that is<br>
a dot-file in the tree is not nice. Can we just name it dot-gclient<br>
instead:<br>
<br></blockquote><div>Sure <br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
=C2=A0 =C2=A0 $(FLUTTER_ENGINE_PKGDIR)/dot-gclient<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0$(@D)/dl-tmp/.gclient &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(SED) &quot;s%!FLUTT=
ER_VERSION!%$(FLUTTER_ENGINE_VERSION)%g&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0$(@D)/dl-tmp/.gclient &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd $(@D)/dl-tmp &amp;=
&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(DEPOT_TOOLS_GCLIENT=
) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0sync \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0--delete_unversioned_trees \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0-j$(PARALLEL_JOBS) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0--no-history \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0--reset \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0--shallow &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $(FLUTTER_EN=
GINE_DL_DIR); \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd $(@D)/dl-tmp &amp;=
&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mk_tar_gz \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(@D)/dl-tmp/src \<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flutter-$(FLUTTER_ENG=
INE_VERSION) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$$(git -C $(@D)=
/dl-tmp/src log -1 --pretty=3Dformat:%ci)&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(FLUTTER_ENGINE_TARB=
ALL_PATH) &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf $(@D)/dl-tmp; =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0)<br>
<br>
I think this big if-block should go into a helper script (yeah, yeah., I<br=
>
may have written something using make code in my earlier suggestion, but<br=
>
that was not smart of me...)<br>
<br>
So:<br>
=C2=A0 =C2=A0 define FLUTTER_ENGINE_GENERATE_TARBALL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(FLUTTER_PKGDIR)/gen-tarball \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --version $(FLUTTER_ENGINE_VERSIO=
N) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --tarball $(FLUTTER_ENGINE_TARBAL=
L_PATH) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --dot-gclient $(FLUTTER_ENGINE_PK=
GDIR)/dot-gclient \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --scratch-dir $(@D)/dl-tmp<br>
=C2=A0 =C2=A0 endef<br>
<br>
And then a sequence of complex script shell is easier to write, to<br>
review, and to maintain.<br>=C2=A0</blockquote><div>I had a script original=
ly, and then you suggested to use the Makefile! Gah!</div><div>Make up your=
 mind! :^) <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +endef<br>
&gt; +FLUTTER_ENGINE_POST_DOWNLOAD_HOOKS +=3D FLUTTER_ENGINE_GENERATE_TARBA=
LL<br>
&gt; +<br>
&gt; +define FLUTTER_ENGINE_EXTRACT_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gzip -d -c $(FLUTTER_ENGINE_TARBALL_PATH) | tar -=
-strip-components 1 -C $(@D) -xf -<br>
&gt; +endef<br>
&gt; +<br>
&gt; +define FLUTTER_ENGINE_CONFIGURE_CMDS<br>
&gt; +=C2=A0 # libtessellator requires these three files, but the toolchain=
 path isn&#39;t<br>
&gt; +=C2=A0 # referenced when linking. Copy them to the staging lib direct=
ory before<br>
&gt; +=C2=A0 # building.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(Q)$(foreach i,crtbeginS.o crtendS.o libgcc.a,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)if [ ! -e $(STAGI=
NG_DIR)/usr/lib/$(i) ]; then \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0file_path=3D$$(find $(HOST_DIR) -type f -name $(i)); \<br>
<br>
This is going to be a bit more complex than that, because of multi-lib<br>
or multi-arch external toolchains. See the mess it is to find the<br>
sysroot in toolchain/<a href=3D"http://helpers.mk" rel=3D"noreferrer" targe=
t=3D"_blank">helpers.mk</a><br>
<br>
But seriously though, why are they not brought in? Did you try to run<br>
the linking command manually in debug mode (--verbose if calling ld<br>
directly, of -Wl.--verbose if using gcc to link)?<br>
<br>
Is it using ld to do the link, or is it using gcc?<br>
<br>
Is ld binutils&#39;, or is it lld? This might also have a link as to why<br=
>
-Wl,-z,now and -Wl,-z,relro are not supported...<br>=C2=A0</blockquote><div=
>I&#39;ll do more research into this and get back to you.<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0$(INSTALL) -D -m 0755 $${file_path} $(STAGING_DIR)/usr/lib/$(i); \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(cd $(@D)/ &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf $(FLUTTER_ENGI=
NE_BUILD_DIR) &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PATH=3D$(shell $(call=
 FLUTTER_ENGINE_GET_PATH)) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0./flutter/tools/gn $(=
FLUTTER_ENGINE_CONF_OPTS) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0)<br>
&gt; +endef<br>
&gt; +<br>
&gt; +define FLUTTER_ENGINE_BUILD_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(cd $(@D); \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PATH=3D$(shell $(call=
 FLUTTER_ENGINE_GET_PATH)) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PYTHONNOUSERSITE=3Dy =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(HOST_DIR)/bin/ninja=
 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0-j $(PARALLEL_JOBS) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0-C $(FLUTTER_ENGINE_BUILD_DIR) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0)<br>
&gt; +endef<br>
&gt; +<br>
&gt; +define FLUTTER_ENGINE_INSTALL_STAGING_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(foreach i,$(FLUTTER_ENGINE_INSTALL_STAGING_FILE=
S),<br>
<br>
Err... FLUTTER_ENGINE_INSTALL_STAGING_FILES is set nowhere?<br>
<br></blockquote><div>Yeah, should just be=C2=A0 FLUTTER_ENGINE_INSTALL_FIL=
ES</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)if [ -e $(FLUTTER=
_ENGINE_BUILD_DIR)/$(i) ]; then \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0$(INSTALL) -D -m 0755 $(FLUTTER_ENGINE_BUILD_DIR)/$(i) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(STAGING_DIR)/usr/lib/$(i); \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0755 $(FLUTTER_ENGINE_BUILD_DIR)=
/flutter_embedder.h \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(STAGING_DIR)/usr/in=
clude/flutter_embedder.h<br>
&gt; +endef<br>
&gt; +<br>
&gt; +define FLUTTER_ENGINE_INSTALL_TARGET_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(foreach i,$(FLUTTER_ENGINE_INSTALL_FILES),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)if [ -e $(FLUTTER=
_ENGINE_BUILD_DIR)/$(i) ]; then \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0$(INSTALL) -D -m 0755 $(FLUTTER_ENGINE_BUILD_DIR)/$(i) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/usr/lib/$(i); \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0)<br>
&gt; +endef<br>
&gt; +<br>
&gt; +$(eval $(generic-package))<br>
&gt; diff --git a/package/flutter-engine/gclient b/package/flutter-engine/g=
client<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..168e9a368d<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/flutter-engine/gclient<br>
&gt; @@ -0,0 +1,16 @@<br>
&gt; +# This file is taken from the output of meta-flutter/lib/gn.py<br>
&gt; +<br>
&gt; +solutions =3D [{<br>
&gt; +=C2=A0 =C2=A0 &quot;managed&quot;: False,<br>
&gt; +=C2=A0 =C2=A0 &quot;name&quot;: &quot;src/flutter&quot;,<br>
&gt; +=C2=A0 =C2=A0 &quot;url&quot;: &quot;<a href=3D"https://github.com/fl=
utter/engine.git@!FLUTTER_VERSION" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/flutter/engine.git@!FLUTTER_VERSION</a>!&quot;,<br>
&gt; +=C2=A0 =C2=A0 &quot;custom_vars&quot;: {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;download_android_deps&quot;: False,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;download_windows_deps&quot;: False,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;download_linux_deps&quot;: False<br=
>
&gt; +=C2=A0 =C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 &quot;custom_deps&quot;: {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;src/third_party/dart/third_party/pk=
g/tools&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"https://dart.googlesourc=
e.com/tools.git@unified_analytics-v1.1.0" rel=3D"noreferrer" target=3D"_bla=
nk">https://dart.googlesource.com/tools.git@unified_analytics-v1.1.0</a>&qu=
ot;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}]<br>
&gt; -- <br>
&gt; 2.41.0<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div></div>

--0000000000000360e606015185bd--

--===============3174515071673874025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3174515071673874025==--
