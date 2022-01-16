Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882B7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 10:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB340826FF;
	Sun, 16 Jan 2022 10:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pu7UiEkam9B2; Sun, 16 Jan 2022 10:29:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA00F826EA;
	Sun, 16 Jan 2022 10:29:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0764B1BF426
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 10:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E885740167
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 10:29:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q1aNWZnqqgMg for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 10:29:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 694CC40122
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 10:29:06 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 60-20020a9d0142000000b0059103eb18d4so15985836otu.2
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 02:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9l8VgrPq/aCtADMI+dvNiishSBgNM5NNfEsq5ymgScU=;
 b=aDfYzbeyD+rDhX1E8hGH0/X+H0uw+mmVEKMnY/cainrwLXnq6J6u45BjeZWnKiI9Lh
 Lup5EJuNUcSLK0zIix6knWqba0FmiMAr9iCnDO8YBZFreyEHgT05x/+YCny6oTosleRe
 f4i4BfbesfchVGK7Rz2SNz/LaW8Cf6dO8MGnt3n01Hf1WVqewEKeY9FRs7VcFQD7gP3L
 ZtrifGFwdZjIUllDv9ZblAen3jVpVEGY/BHV31BOrN2UQPGBZCte9PHBbAWGjUjMvJeu
 rCOXAqU1EyoOkbFwmgkA93IJDvICgpV09HDmYn4Rrv6fUHPUuI23GFvLMrusGBk7T+Tq
 Ld6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9l8VgrPq/aCtADMI+dvNiishSBgNM5NNfEsq5ymgScU=;
 b=KgkelCQQ645Tho4TAEwM8iDrg5G/2IH1euArA0fyNlyUn8ma2Akex+3XC5avadbL0R
 41GENSNpZg24aIDcHRhDCnL4RxjVosFDg5knuZpEmEKUoTU0bTZ0XHyyGb9u8wKnsd+8
 YEwXEgxK9H+ar7uBUFnWeEzr5UqjUMV/rO0X2UPHPwf7nZJeEv/8RlnZbxQIslq1Gfjx
 gPghQgod3OdDnjJIy9eeJmaoqKzcy2BBuEfN4PtqIC1pGzGTFRu4TCojqCQiyB/HAikv
 xGZnbjIuTqj0CPWNhjDQz8rkcB4Hb2X5k8Zz3NFxkYrwk9a8DuHJ9lxiMqGpg9SwvO/w
 5Q6w==
X-Gm-Message-State: AOAM530oLoL+V2GYcU4UFikTeO9wG512YKnxgpxn4Hj9qNGsNRedSe5z
 KYV8gXlqZ5wklK571HRqjrCkLUXVoV3znbl9o9PsM7iQfls=
X-Google-Smtp-Source: ABdhPJyyVVNMGVD4Rq+W/ypZ+fJ4KzMEwD18KlWOE9y5CzVI6l5aVYhlTyguhsJD6DHQWueoef6XwPWcfGOq2TGXGEg=
X-Received: by 2002:a9d:4b15:: with SMTP id q21mr8033290otf.151.1642328945260; 
 Sun, 16 Jan 2022 02:29:05 -0800 (PST)
MIME-Version: 1.0
References: <20220112203939.606775-1-james.hilliard1@gmail.com>
 <20220115233736.634f0d0b@gmx.net>
 <CADvTj4pFsYA+vaz4k6Fru9KnuRUeHmZ6QhQP_WJsxS+kHy1qdw@mail.gmail.com>
 <20220116101901.23db5faa@gmx.net>
In-Reply-To: <20220116101901.23db5faa@gmx.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Jan 2022 03:28:54 -0700
Message-ID: <CADvTj4rT_wwssYQ3FGRQza5oVdbGyTvf6AM3Yx-_VKg_GWnrnQ@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5base: disable broken
 qmake sysrootify
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
Cc: Julien Corjon <corjon.j@ecagroup.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Jan 16, 2022 at 2:19 AM Peter Seiderer <ps.report@gmx.net> wrote:
>
> Hello James,
>
> On Sat, 15 Jan 2022 22:08:57 -0700, James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > On Sat, Jan 15, 2022 at 3:37 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > >
> > > Hello James, *,
> > >
> > > On Wed, 12 Jan 2022 13:39:39 -0700, James Hilliard <james.hilliard1@gmail.com> wrote:
> > >
> > > > Currently the qmake gcc sysrootify path logic causes issues with
> > > > per-package directories, disable automatic gcc sysroot for qt5base
> > > > install and override all qt.conf paths manually to point to their
> > > > correct locations.
> > > >
> > > > Redirect HostData to STAGING_DIR as mkspecs need to be available there
> > > > instead of the HOST_DIR for cross compilation to work.
> > > >
> > > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > > ---
> > > >  package/qt5/qt5base/qt.conf.in | 18 +++++++++++++++---
> > > >  package/qt5/qt5base/qt5base.mk |  2 ++
> > > >  2 files changed, 17 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/package/qt5/qt5base/qt.conf.in b/package/qt5/qt5base/qt.conf.in
> > > > index 2215cbd4e1..db9ab0c364 100644
> > > > --- a/package/qt5/qt5base/qt.conf.in
> > > > +++ b/package/qt5/qt5base/qt.conf.in
> > > > @@ -2,6 +2,18 @@
> > > >  Prefix=/usr
> > > >  HostPrefix=@@HOST_DIR@@
> > > >  Sysroot=@@STAGING_DIR@@
> > > > -Headers=/usr/include/qt5
> > > > -Plugins=/usr/lib/qt/plugins
> > > > -Examples=/usr/lib/qt/examples
> > > > +SysrootifyPrefix=false
> > > > +Binaries=@@STAGING_DIR@@/usr/bin
> > > > +Libraries=@@STAGING_DIR@@/usr/lib
> > > > +Headers=@@STAGING_DIR@@/usr/include/qt5
> > > > +Plugins=@@STAGING_DIR@@/usr/lib/qt/plugins
> > > > +Examples=@@STAGING_DIR@@/usr/lib/qt/examples
> > > > +Data=@@STAGING_DIR@@
> > > > +Translations=@@STAGING_DIR@@/translations
> > > > +ArchData=@@STAGING_DIR@@/usr
> > > > +LibraryExecutables=@@STAGING_DIR@@/usr/libexec
> > > > +Imports=@@STAGING_DIR@@/usr/imports
> > > > +Qml2Imports=@@STAGING_DIR@@/usr/qml
> > > > +HostBinaries=@@HOST_DIR@@/bin
> > > > +HostLibraries=@@HOST_DIR@@/lib
> > > > +HostData=@@STAGING_DIR@@
> > > > diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> > > > index bcdf036f00..6c05e710d8 100644
> > > > --- a/package/qt5/qt5base/qt5base.mk
> > > > +++ b/package/qt5/qt5base/qt5base.mk
> > > > @@ -311,8 +311,10 @@ define QT5BASE_CONFIGURE_CMDS
> > > >               -v \
> > > >               -prefix /usr \
> > > >               -hostprefix $(HOST_DIR) \
> > > > +             -hostdatadir $(STAGING_DIR) \
> > > >               -headerdir /usr/include/qt5 \
> > > >               -sysroot $(STAGING_DIR) \
> > > > +             -no-gcc-sysroot \
> > > >               -plugindir /usr/lib/qt/plugins \
> > > >               -examplesdir /usr/lib/qt/examples \
> > > >               -no-rpath \
> > >
> > > This one leads to the following compile failure for qt5webengine-5.15.2:
> > >
> > >   .../host/lib/gcc/arm-buildroot-linux-gnueabihf/10.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: cannot find crti.o: No such file or directory
> > > collect2: error: ld returned 1 exit status
> >
> > So I was able to reproduce this error, however best I can tell it's
> > probably not a regression
>
> This is a known failure, see the patches adding host-freetype/host-libjepeg/host-harfbuzz ([1])
> or your own qt5webengine bump adding host-freetype dependency ([2])...

So there's a major pkg-config bug here, I partially fixed it here but
it seems gn
is mangling some of the paths after getting them from pkg-config:
https://patchwork.ozlabs.org/project/buildroot/patch/20220116101739.2623120-1-james.hilliard1@gmail.com/

This gets the target pkg-config paths set up right at least
output/build/qt5webengine-5.15.2/src/core/release/args.gn:
pkg_config = "/home/buildroot/buildroot/output/host/bin/pkg-config"
host_pkg_config =
"/home/buildroot/buildroot/output/build/qt5webengine-5.15.2/host-bin/host-pkg-config"

However gn I think is prepending the target_sysroot to the include
paths or something:
target_sysroot =
    "/home/buildroot/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot"

which causes this error:
/home/buildroot/buildroot/output/host/bin/aarch64-linux-g++ -MMD -MF
obj/crypto/crypto/nss_util.o.d -DCRYPTO_IMPLEMENTATION -DUSE_UDEV
-DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DOFFICIAL_BUILD
-DTOOLKIT_QT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -DNO_UNWIND_TABLES -D__STDC_CONSTANT_MACROS
-D__STDC_FORMAT_MACROS
-DCR_SYSROOT_HASH=2cade9ee1ca9186b28ac768c19e1ab7c45ee0600 -DNDEBUG
-DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -Igen
-I../../3rdparty/chromium
-I../../3rdparty/chromium/third_party/boringssl/src/include
-fno-strict-aliasing --param=ssp-buffer-size=4 -fstack-protector
-fno-unwind-tables -fno-asynchronous-unwind-tables -fPIC -pipe
-pthread -Wall -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2
-Wno-unused-local-typedefs -Wno-maybe-uninitialized
-Wno-deprecated-declarations -fno-delete-null-pointer-checks
-Wno-comments -Wno-packed-not-aligned -Wno-dangling-else
-Wno-missing-field-initializers -Wno-unused-parameter -O2 -fno-ident
-fdata-sections -ffunction-sections -fno-omit-frame-pointer -g0
-fvisibility=hidden
-I/home/buildroot/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/home/buildroot/buildroot/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/include/nss
-I/home/buildroot/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/home/buildroot/buildroot/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/include/nspr
-std=gnu++14 -Wno-narrowing -Wno-class-memaccess -Wno-attributes
-Wno-class-memaccess -Wno-subobject-linkage -Wno-invalid-offsetof
-Wno-return-type -Wno-deprecated-copy -fno-exceptions -fno-rtti
--sysroot=../../../../../host/aarch64-buildroot-linux-gnu/sysroot
-fvisibility-inlines-hidden -c
../../3rdparty/chromium/crypto/nss_util.cc -o
obj/crypto/crypto/nss_util.o
../../3rdparty/chromium/crypto/nss_util.cc:8:10: fatal error:
pk11pub.h: No such file or directory
    8 | #include <pk11pub.h>
      |          ^~~~~~~~~~~

The include path being set by gn doesn't exist, although it's at least
trying to use the
target variant now:
/home/buildroot/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/home/buildroot/buildroot/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/include/nss

>
> Additional the SIGSTKSZ fix is needed...

Yeah, on newer glibc's it's needed.

>
> Regards,
> Peter
>
> [1] http://lists.busybox.net/pipermail/buildroot/2022-January/634005.html
> [2] http://lists.busybox.net/pipermail/buildroot/2022-January/633439.html
>
>
> > as the compilation still fails due to a different error without this patch:
> >
> > ERROR at //build/config/linux/pkg_config.gni:103:17: Script returned
> > non-zero exit code.
> >     pkgresult = exec_script(pkg_config_script, args, "value")
> >                 ^----------
> > Current dir: /home/buildroot/buildroot/output/build/qt5webengine-5.15.2/src/core/release/
> > Command: /home/buildroot/buildroot/output/host/bin/python2
> > /home/buildroot/buildroot/output/build/qt5webengine-5.15.2/src/3rdparty/chromium/build/config/linux/pkg-config.py
> > -p /home/buildroot/buildroot/output/build/qt5webengine-5.15.2/host-bin/host-pkg-config
> > libjpeg
> > Returned 1.
> > stderr:
> >
> > Package libjpeg was not found in the pkg-config search path.
> > Perhaps you should add the directory containing `libjpeg.pc'
> > to the PKG_CONFIG_PATH environment variable
> > Package 'libjpeg', required by 'virtual:world', not found
> > Could not run pkg-config.
> >
> > See //third_party/BUILD.gn:17:3: whence it was called.
> >   pkg_config("system_libjpeg") {
> >   ^-----------------------------
> > See //third_party/blink/renderer/platform/BUILD.gn:159:5: which caused
> > the file to be included.
> >     "//third_party:jpeg",
> >     ^-------------------
> > Project ERROR: GN run error!
> >
> > >
> > >
> > > But the file crti.o exists:
> > >
> > >         $ find . -name crti.o
> > >         ./build/glibc-2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/build/csu/crti.o
> > >         ./host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/crti.o
> > >
> > >
> > > Did not (yet) test with your latest (v2) patch iteration...
> > >
> > > Compile with qt5webengine bump to 5.15.8-lts fails already before the linking stage
> > > (see secoidt.h/pk11pub.h No such file or directory failure reported by already by
> > > Thomas)...
> > >
> > > Regards,
> > > Peter
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
