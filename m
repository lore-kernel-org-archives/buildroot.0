Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1EAC61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 22:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B6804058E;
	Thu, 23 Feb 2023 22:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B6804058E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BVogXWAQ1wQ4; Thu, 23 Feb 2023 22:48:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D58D40590;
	Thu, 23 Feb 2023 22:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D58D40590
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 55F071BF338
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F68F60B00
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:47:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F68F60B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g5xVORV9saL2 for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 22:47:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3544B60AB3
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3544B60AB3
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 22:47:57 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id ay18so684399pfb.2
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 14:47:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Aezb8nxiOhbkpSX/tw5IGW6Jm6AXS2d/gHT09us0mAI=;
 b=QEb6CImxlW0YACi65fYt98nw3yq/f6cRdHl3/YrJDygwTvQT17wlL6ZVjLN+VJORmi
 gikmP/+0N91R5Zj7F6Ch8ZMf6UYxPtc1BhtIkeGiWW2HdJ7G1f0KnCS0IDamK/WQrGax
 QR+440UGkGu+NMMehFdTOBgDsPIhGbrywmhlufLabd8XCOWpS3Z2mJh6f9BZZG1RpW1b
 0rplRVy9Zxs62gLnivnRNYrsxBtU4iDBC34gcyRi+OyPVPwXGE8ZI0ZgNVgWcDdQEBsi
 Iq5v5sMkNBlzvQ2Z9bUn/w/CRlBJXcfN2/t08acuMtsCMDgahPKDIWQof+tYl6U0XbTB
 Bf6w==
X-Gm-Message-State: AO0yUKUeOj1XgfZwLMfWv692y+vJi3B/1Fr59UU/Xw0WQpRjejEJp5fQ
 9G8A2vbw+xv22HYJBxUBuEiZF7fI1UtIQS0BAk6vwMOr5iE=
X-Google-Smtp-Source: AK7set+VtIcp6VDgmfTlQNFmkmdHcKjIR3flUW/nLR9LbcTCaWCn6b4T5faLgGiDryznM/+C4UzcGcM39tUNhM654j8=
X-Received: by 2002:a63:3f88:0:b0:4fb:d2a9:6ff2 with SMTP id
 m130-20020a633f88000000b004fbd2a96ff2mr2041866pga.7.1677192476137; Thu, 23
 Feb 2023 14:47:56 -0800 (PST)
MIME-Version: 1.0
References: <20230223153236.914358-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20230223153236.914358-1-fontaine.fabrice@gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 23 Feb 2023 23:47:45 +0100
Message-ID: <CAPi7W81td_b2k4-f_tkKxcUGnimttOhh=rEp7dJv2hyatiV0kg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Aezb8nxiOhbkpSX/tw5IGW6Jm6AXS2d/gHT09us0mAI=;
 b=EsY+bdY7FiN51ihLN+d5ALBpkNBzxLNBAzVZPmiAiL1qkfbbpBfwpJkrR14mrcho2Y
 HFmsZszUnVrmZBSzSbkrsAmMLmSCX8MijQLTfyStJ3eKqQXH8OLZTSwQebg5A8LOSu9H
 SKM7107mGe60Phlhu90FkCqETOZvGrB0Gp7xVM7+z4dXlEJfGtgiuPLavffDPNCr122r
 fvrzSXdog+Y2i7CdvNpiKybprMiY7cU36J0yjIP8Qyuy/w1Siev1rQvg5ne2/e6Ew7Zn
 oQOgYPU8rPqZ3kztiB2F2KEVczTSyIES76h+aUoH0MNc421NbMSLt3f8lAGE6b8OEg1n
 nPOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EsY+bdY7
Subject: Re: [Buildroot] [PATCH 1/1] package/cairo: fix pthread detection
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
Content-Type: multipart/mixed; boundary="===============4277894671465272909=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4277894671465272909==
Content-Type: multipart/alternative; boundary="000000000000c29d5605f565cd7a"

--000000000000c29d5605f565cd7a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 23 f=C3=A9vr. 2023 =C3=A0 16:32, Fabrice Fontaine <fontaine.fabrice=
@gmail.com>
a =C3=A9crit :

> pthreads detection fails if a warning is emitted resulting in the
> following build failure with some toolchains:
>
> onfigure:34189: checking for cairo's pthread feature
> configure:34300:
> /home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-l=
inux-uclibc-gcc
> -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=3D64 -mlongcalls -mauto-litpools -O0 -g2  -D_REENTRAN=
T
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64
> conftest.c -lrt -latomic -lexecinfo -lm -lpthread >&5
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildro=
ot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
> warning:
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildro=
ot-linux-uclibc/11.3.0/crtend.o:
> missing .note.GNU-stack section implies executable stack
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildro=
ot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
> NOTE: This behaviour is deprecated and will be removed in a future versio=
n
> of the linker
> configure:34300: $? =3D 0
> configure:34419:
> /home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-l=
inux-uclibc-gcc
> -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=3D64 -mlongcalls -mauto-litpools -O0 -g2  -pthread
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64
> conftest.c -lrt -latomic -lexecinfo -lm  >&5
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildro=
ot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
> warning:
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildro=
ot-linux-uclibc/11.3.0/crtend.o:
> missing .note.GNU-stack section implies executable stack
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildro=
ot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
> NOTE: This behaviour is deprecated and will be removed in a future versio=
n
> of the linker
> configure:34419: $? =3D 0
> configure:34500:
> /home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-l=
inux-uclibc-gcc
> -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=3D64 -mlongcalls -mauto-litpools -O0 -g2  -D_REENTRAN=
T
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64
> conftest.c -lrt -latomic -lexecinfo -lm  >&5
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildro=
ot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
> warning:
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildro=
ot-linux-uclibc/11.3.0/crtend.o:
> missing .note.GNU-stack section implies executable stack
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildro=
ot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
> NOTE: This behaviour is deprecated and will be removed in a future versio=
n
> of the linker
> configure:34500: $? =3D 0
> configure:34555: checking whether cairo's pthread feature could be enable=
d
> configure:34557: result: no (can't link with -lpthread or -pthread)
>

It should be noted that shellinabox has the same kind of issue, a warning
is preventing the correct detection of ptsname_r:
http://autobuild.buildroot.org/results/287/2872b26253ecb5a1550268fcbcefe8fd=
974ff70d//shellinabox-2.20/config.log

So there is something fishy with those recent autobuilder failures.


>
> [...]
>
> In file included from cairo-mutex-type-private.h:45,
>                  from cairo-scaled-font-private.h:45,
>                  from cairoint.h:434,
>                  from cairo-analysis-surface.c:37:
> cairo-mutex-impl-private.h:262:3: error: #error "XXX: No mutex
> implementation found.  Cairo will not work with multiple threads.  Define
> CAIRO_NO_MUTEX to 1 to acknowledge and accept this limitation and compile
> cairo without thread-safety support."
>   262 | # error "XXX: No mutex implementation found.  Cairo will not work
> with multiple threads.  Define CAIRO_NO_MUTEX to 1 to acknowledge and
> accept this limitation and compile cairo without thread-safety support."
>       |   ^~~~~
>
> To avoid this build failure, add a patch that overrides this broken
> mechanism
>
> Fixes:
>  -
> http://autobuild.buildroot.org/results/5420beaf94855e47eeb08627e8e3c169dc=
00419a
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...e.ac.pthread-respect-enable-pthreads.patch | 59 +++++++++++++++++++
>  package/cairo/cairo.mk                        | 13 ++--
>  2 files changed, 68 insertions(+), 4 deletions(-)
>  create mode 100644
> package/cairo/0005-build-configure.ac.pthread-respect-enable-pthreads.pat=
ch
>
> diff --git
> a/package/cairo/0005-build-configure.ac.pthread-respect-enable-pthreads.p=
atch
> b/package/cairo/0005-build-configure.ac.pthread-respect-enable-pthreads.p=
atch
> new file mode 100644
> index 0000000000..c350c596cf
> --- /dev/null
> +++
> b/package/cairo/0005-build-configure.ac.pthread-respect-enable-pthreads.p=
atch
> @@ -0,0 +1,59 @@
> +From 243fe7f3d51c23159e25f36adee7e953fee29f6c Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 23 Feb 2023 16:07:04 +0100
> +Subject: [PATCH] build/configure.ac.pthread: respect --enable-pthreads
> +
> +Respect --enable-pthreads as pthreads detection fails if a warning is
> +emitted resulting in the following build failure with some toolchains:
> +
> +onfigure:34189: checking for cairo's pthread feature
> +configure:34300:
> /home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-l=
inux-uclibc-gcc
> -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=3D64 -mlongcalls -mauto-litpools -O0 -g2  -D_REENTRAN=
T
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64
> conftest.c -lrt -latomic -lexecinfo -lm -lpthread >&5
> +/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildr=
oot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
> warning:
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildro=
ot-linux-uclibc/11.3.0/crtend.o:
> missing .note.GNU-stack section implies executable stack
> +/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildr=
oot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
> NOTE: This behaviour is deprecated and will be removed in a future versio=
n
> of the linker
> +configure:34300: $? =3D 0
> +configure:34419:
> /home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-l=
inux-uclibc-gcc
> -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=3D64 -mlongcalls -mauto-litpools -O0 -g2  -pthread
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64
> conftest.c -lrt -latomic -lexecinfo -lm  >&5
> +/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildr=
oot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
> warning:
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildro=
ot-linux-uclibc/11.3.0/crtend.o:
> missing .note.GNU-stack section implies executable stack
> +/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildr=
oot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
> NOTE: This behaviour is deprecated and will be removed in a future versio=
n
> of the linker
> +configure:34419: $? =3D 0
> +configure:34500:
> /home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-l=
inux-uclibc-gcc
> -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=3D64 -mlongcalls -mauto-litpools -O0 -g2  -D_REENTRAN=
T
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64
> conftest.c -lrt -latomic -lexecinfo -lm  >&5
> +/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildr=
oot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
> warning:
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildro=
ot-linux-uclibc/11.3.0/crtend.o:
> missing .note.GNU-stack section implies executable stack
> +/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildr=
oot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
> NOTE: This behaviour is deprecated and will be removed in a future versio=
n
> of the linker
> +configure:34500: $? =3D 0
> +configure:34555: checking whether cairo's pthread feature could be enabl=
ed
> +configure:34557: result: no (can't link with -lpthread or -pthread)
> +
> +[...]
> +
> +In file included from cairo-mutex-type-private.h:45,
> +                 from cairo-scaled-font-private.h:45,
> +                 from cairoint.h:434,
> +                 from cairo-analysis-surface.c:37:
> +cairo-mutex-impl-private.h:262:3: error: #error "XXX: No mutex
> implementation found.  Cairo will not work with multiple threads.  Define
> CAIRO_NO_MUTEX to 1 to acknowledge and accept this limitation and compile
> cairo without thread-safety support."
> +  262 | # error "XXX: No mutex implementation found.  Cairo will not wor=
k
> with multiple threads.  Define CAIRO_NO_MUTEX to 1 to acknowledge and
> accept this limitation and compile cairo without thread-safety support."
> +      |   ^~~~~
> +
> +Fixes:
> + -
> http://autobuild.buildroot.org/results/5420beaf94855e47eeb08627e8e3c169dc=
00419a
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + build/configure.ac.pthread | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/build/configure.ac.pthread b/build/configure.ac.pthread
> +index 29c930da9..084445587 100644
> +--- a/build/configure.ac.pthread
> ++++ b/build/configure.ac.pthread
> +@@ -244,7 +244,8 @@ AC_DEFUN([CAIRO_CONFIGURE_PTHREAD],[dnl
> +
> +       dnl Make sure we scored some pthreads.
> +       if test "x$enable_pthread" =3D "xyes" -a "x$have_pthread" !=3D "x=
yes";
> then
> +-              AC_MSG_ERROR([pthread requested but not found])
> ++              AC_MSG_WARN([pthread requested but not found])
> ++              have_pthread=3Dyes
> +       fi
> +
> +       dnl Set the output variables for CAIRO_ENABLE.
> +--
> +2.39.1
> +
> diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
> index e8a704c7da..9034068403 100644
> --- a/package/cairo/cairo.mk
> +++ b/package/cairo/cairo.mk
> @@ -11,6 +11,8 @@ CAIRO_LICENSE_FILES =3D COPYING COPYING-LGPL-2.1
> COPYING-MPL-1.1
>  CAIRO_CPE_ID_VENDOR =3D cairographics
>  CAIRO_SITE =3D http://cairographics.org/releases
>  CAIRO_INSTALL_STAGING =3D YES
> +# We're patching build/configure.ac.pthread
> +CAIRO_AUTORECONF =3D YES
>
>  #
> 0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_app=
ly_variation.patch
>  CAIRO_IGNORE_CVES +=3D CVE-2018-19876
> @@ -26,10 +28,6 @@ ifeq ($(BR2_m68k_cf),y)
>  CAIRO_CONF_ENV +=3D CFLAGS=3D"$(TARGET_CFLAGS) -mxgot"
>  endif
>
> -ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
> -CAIRO_CONF_ENV +=3D CPPFLAGS=3D"$(TARGET_CPPFLAGS) -DCAIRO_NO_MUTEX=3D1"
> -endif
> -
>  # cairo can use C++11 atomics when available, so we need to link with
>  # libatomic for the architectures who need libatomic.
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> @@ -70,6 +68,13 @@ HOST_CAIRO_DEPENDENCIES =3D \
>         host-pixman \
>         host-pkgconf
>
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +CAIRO_CONF_OPTS +=3D --enable-pthread
> +else
> +CAIRO_CONF_OPTS +=3D --disable-pthread
> +CAIRO_CONF_ENV +=3D CPPFLAGS=3D"$(TARGET_CPPFLAGS) -DCAIRO_NO_MUTEX=3D1"
> +endif
> +
>  # DirectFB svg support rely on Cairo and Cairo DirectFB support depends =
on
>  # DirectFB. Break circular dependency by disabling DirectFB support in
> Cairo
>  # (which is experimental)
> --
> 2.39.1
>
>
Best Regards,

Fabrice

--000000000000c29d5605f565cd7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 23 f=C3=A9vr. 2023 =C3=
=A0=C2=A016:32, Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gma=
il.com">fontaine.fabrice@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">pthreads detection fails if =
a warning is emitted resulting in the<br>
following build failure with some toolchains:<br>
<br>
onfigure:34189: checking for cairo&#39;s pthread feature<br>
configure:34300: /home/buildroot/autobuild/instance-1/output-1/host/bin/xte=
nsa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE=
64_SOURCE -D_FILE_OFFSET_BITS=3D64 -mlongcalls -mauto-litpools -O0 -g2=C2=
=A0 -D_REENTRANT -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_B=
ITS=3D64=C2=A0 conftest.c -lrt -latomic -lexecinfo -lm -lpthread &gt;&amp;5=
<br>
/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot=
-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: warn=
ing: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buil=
droot-linux-uclibc/11.3.0/crtend.o: missing .note.GNU-stack section implies=
 executable stack<br>
/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot=
-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: NOTE=
: This behaviour is deprecated and will be removed in a future version of t=
he linker<br>
configure:34300: $? =3D 0<br>
configure:34419: /home/buildroot/autobuild/instance-1/output-1/host/bin/xte=
nsa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE=
64_SOURCE -D_FILE_OFFSET_BITS=3D64 -mlongcalls -mauto-litpools -O0 -g2=C2=
=A0 -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=
=3D64=C2=A0 conftest.c -lrt -latomic -lexecinfo -lm=C2=A0 &gt;&amp;5<br>
/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot=
-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: warn=
ing: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buil=
droot-linux-uclibc/11.3.0/crtend.o: missing .note.GNU-stack section implies=
 executable stack<br>
/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot=
-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: NOTE=
: This behaviour is deprecated and will be removed in a future version of t=
he linker<br>
configure:34419: $? =3D 0<br>
configure:34500: /home/buildroot/autobuild/instance-1/output-1/host/bin/xte=
nsa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE=
64_SOURCE -D_FILE_OFFSET_BITS=3D64 -mlongcalls -mauto-litpools -O0 -g2=C2=
=A0 -D_REENTRANT -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_B=
ITS=3D64=C2=A0 conftest.c -lrt -latomic -lexecinfo -lm=C2=A0 &gt;&amp;5<br>
/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot=
-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: warn=
ing: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buil=
droot-linux-uclibc/11.3.0/crtend.o: missing .note.GNU-stack section implies=
 executable stack<br>
/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot=
-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: NOTE=
: This behaviour is deprecated and will be removed in a future version of t=
he linker<br>
configure:34500: $? =3D 0<br>
configure:34555: checking whether cairo&#39;s pthread feature could be enab=
led<br>
configure:34557: result: no (can&#39;t link with -lpthread or -pthread)<br>=
</blockquote><div><br></div><div>It should be noted that shellinabox has th=
e same kind of issue, a warning is preventing the correct detection of ptsn=
ame_r:</div><div><a href=3D"http://autobuild.buildroot.org/results/287/2872=
b26253ecb5a1550268fcbcefe8fd974ff70d//shellinabox-2.20/config.log">http://a=
utobuild.buildroot.org/results/287/2872b26253ecb5a1550268fcbcefe8fd974ff70d=
//shellinabox-2.20/config.log</a></div><div><br></div><div>So there is some=
thing fishy with those recent autobuilder failures.<br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
[...]<br>
<br>
In file included from cairo-mutex-type-private.h:45,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from cairo-sc=
aled-font-private.h:45,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from cairoint=
.h:434,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from cairo-an=
alysis-surface.c:37:<br>
cairo-mutex-impl-private.h:262:3: error: #error &quot;XXX: No mutex impleme=
ntation found.=C2=A0 Cairo will not work with multiple threads.=C2=A0 Defin=
e CAIRO_NO_MUTEX to 1 to acknowledge and accept this limitation and compile=
 cairo without thread-safety support.&quot;<br>
=C2=A0 262 | # error &quot;XXX: No mutex implementation found.=C2=A0 Cairo =
will not work with multiple threads.=C2=A0 Define CAIRO_NO_MUTEX to 1 to ac=
knowledge and accept this limitation and compile cairo without thread-safet=
y support.&quot;<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0^~~~~<br>
<br>
To avoid this build failure, add a patch that overrides this broken<br>
mechanism<br>
<br>
Fixes:<br>
=C2=A0- <a href=3D"http://autobuild.buildroot.org/results/5420beaf94855e47e=
eb08627e8e3c169dc00419a" rel=3D"noreferrer" target=3D"_blank">http://autobu=
ild.buildroot.org/results/5420beaf94855e47eeb08627e8e3c169dc00419a</a><br>
<br>
Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmai=
l.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
---<br>
=C2=A0...e.ac.pthread-respect-enable-pthreads.patch | 59 ++++++++++++++++++=
+<br>
=C2=A0package/cairo/<a href=3D"http://cairo.mk" rel=3D"noreferrer" target=
=3D"_blank">cairo.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 ++--<br>
=C2=A02 files changed, 68 insertions(+), 4 deletions(-)<br>
=C2=A0create mode 100644 package/cairo/0005-build-configure.ac.pthread-resp=
ect-enable-pthreads.patch<br>
<br>
diff --git a/package/cairo/0005-build-configure.ac.pthread-respect-enable-p=
threads.patch b/package/cairo/0005-build-configure.ac.pthread-respect-enabl=
e-pthreads.patch<br>
new file mode 100644<br>
index 0000000000..c350c596cf<br>
--- /dev/null<br>
+++ b/package/cairo/0005-build-configure.ac.pthread-respect-enable-pthreads=
.patch<br>
@@ -0,0 +1,59 @@<br>
+From 243fe7f3d51c23159e25f36adee7e953fee29f6c Mon Sep 17 00:00:00 2001<br>
+From: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" t=
arget=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
+Date: Thu, 23 Feb 2023 16:07:04 +0100<br>
+Subject: [PATCH] build/configure.ac.pthread: respect --enable-pthreads<br>
+<br>
+Respect --enable-pthreads as pthreads detection fails if a warning is<br>
+emitted resulting in the following build failure with some toolchains:<br>
+<br>
+onfigure:34189: checking for cairo&#39;s pthread feature<br>
+configure:34300: /home/buildroot/autobuild/instance-1/output-1/host/bin/xt=
ensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFIL=
E64_SOURCE -D_FILE_OFFSET_BITS=3D64 -mlongcalls -mauto-litpools -O0 -g2=C2=
=A0 -D_REENTRANT -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_B=
ITS=3D64=C2=A0 conftest.c -lrt -latomic -lexecinfo -lm -lpthread &gt;&amp;5=
<br>
+/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroo=
t-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: war=
ning: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-bui=
ldroot-linux-uclibc/11.3.0/crtend.o: missing .note.GNU-stack section implie=
s executable stack<br>
+/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroo=
t-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: NOT=
E: This behaviour is deprecated and will be removed in a future version of =
the linker<br>
+configure:34300: $? =3D 0<br>
+configure:34419: /home/buildroot/autobuild/instance-1/output-1/host/bin/xt=
ensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFIL=
E64_SOURCE -D_FILE_OFFSET_BITS=3D64 -mlongcalls -mauto-litpools -O0 -g2=C2=
=A0 -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=
=3D64=C2=A0 conftest.c -lrt -latomic -lexecinfo -lm=C2=A0 &gt;&amp;5<br>
+/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroo=
t-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: war=
ning: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-bui=
ldroot-linux-uclibc/11.3.0/crtend.o: missing .note.GNU-stack section implie=
s executable stack<br>
+/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroo=
t-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: NOT=
E: This behaviour is deprecated and will be removed in a future version of =
the linker<br>
+configure:34419: $? =3D 0<br>
+configure:34500: /home/buildroot/autobuild/instance-1/output-1/host/bin/xt=
ensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFIL=
E64_SOURCE -D_FILE_OFFSET_BITS=3D64 -mlongcalls -mauto-litpools -O0 -g2=C2=
=A0 -D_REENTRANT -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_B=
ITS=3D64=C2=A0 conftest.c -lrt -latomic -lexecinfo -lm=C2=A0 &gt;&amp;5<br>
+/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroo=
t-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: war=
ning: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-bui=
ldroot-linux-uclibc/11.3.0/crtend.o: missing .note.GNU-stack section implie=
s executable stack<br>
+/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroo=
t-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: NOT=
E: This behaviour is deprecated and will be removed in a future version of =
the linker<br>
+configure:34500: $? =3D 0<br>
+configure:34555: checking whether cairo&#39;s pthread feature could be ena=
bled<br>
+configure:34557: result: no (can&#39;t link with -lpthread or -pthread)<br=
>
+<br>
+[...]<br>
+<br>
+In file included from cairo-mutex-type-private.h:45,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from cairo-s=
caled-font-private.h:45,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from cairoin=
t.h:434,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from cairo-a=
nalysis-surface.c:37:<br>
+cairo-mutex-impl-private.h:262:3: error: #error &quot;XXX: No mutex implem=
entation found.=C2=A0 Cairo will not work with multiple threads.=C2=A0 Defi=
ne CAIRO_NO_MUTEX to 1 to acknowledge and accept this limitation and compil=
e cairo without thread-safety support.&quot;<br>
+=C2=A0 262 | # error &quot;XXX: No mutex implementation found.=C2=A0 Cairo=
 will not work with multiple threads.=C2=A0 Define CAIRO_NO_MUTEX to 1 to a=
cknowledge and accept this limitation and compile cairo without thread-safe=
ty support.&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0^~~~~<br>
+<br>
+Fixes:<br>
+ - <a href=3D"http://autobuild.buildroot.org/results/5420beaf94855e47eeb08=
627e8e3c169dc00419a" rel=3D"noreferrer" target=3D"_blank">http://autobuild.=
buildroot.org/results/5420beaf94855e47eeb08627e8e3c169dc00419a</a><br>
+<br>
+Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gma=
il.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
+---<br>
+ build/configure.ac.pthread | 3 ++-<br>
+ 1 file changed, 2 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/build/configure.ac.pthread b/build/configure.ac.pthread<br>
+index 29c930da9..084445587 100644<br>
+--- a/build/configure.ac.pthread<br>
++++ b/build/configure.ac.pthread<br>
+@@ -244,7 +244,8 @@ AC_DEFUN([CAIRO_CONFIGURE_PTHREAD],[dnl<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dnl Make sure we scored some pthreads.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;x$enable_pthread&quot; =3D &quot;=
xyes&quot; -a &quot;x$have_pthread&quot; !=3D &quot;xyes&quot;; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_ERROR([pthread re=
quested but not found])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_WARN([pthread req=
uested but not found])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 have_pthread=3Dyes<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dnl Set the output variables for CAIRO_ENABLE.<=
br>
+-- <br>
+2.39.1<br>
+<br>
diff --git a/package/cairo/<a href=3D"http://cairo.mk" rel=3D"noreferrer" t=
arget=3D"_blank">cairo.mk</a> b/package/cairo/<a href=3D"http://cairo.mk" r=
el=3D"noreferrer" target=3D"_blank">cairo.mk</a><br>
index e8a704c7da..9034068403 100644<br>
--- a/package/cairo/<a href=3D"http://cairo.mk" rel=3D"noreferrer" target=
=3D"_blank">cairo.mk</a><br>
+++ b/package/cairo/<a href=3D"http://cairo.mk" rel=3D"noreferrer" target=
=3D"_blank">cairo.mk</a><br>
@@ -11,6 +11,8 @@ CAIRO_LICENSE_FILES =3D COPYING COPYING-LGPL-2.1 COPYING-=
MPL-1.1<br>
=C2=A0CAIRO_CPE_ID_VENDOR =3D cairographics<br>
=C2=A0CAIRO_SITE =3D <a href=3D"http://cairographics.org/releases" rel=3D"n=
oreferrer" target=3D"_blank">http://cairographics.org/releases</a><br>
=C2=A0CAIRO_INSTALL_STAGING =3D YES<br>
+# We&#39;re patching build/configure.ac.pthread<br>
+CAIRO_AUTORECONF =3D YES<br>
<br>
=C2=A0# 0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_=
ft_apply_variation.patch<br>
=C2=A0CAIRO_IGNORE_CVES +=3D CVE-2018-19876<br>
@@ -26,10 +28,6 @@ ifeq ($(BR2_m68k_cf),y)<br>
=C2=A0CAIRO_CONF_ENV +=3D CFLAGS=3D&quot;$(TARGET_CFLAGS) -mxgot&quot;<br>
=C2=A0endif<br>
<br>
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)<br>
-CAIRO_CONF_ENV +=3D CPPFLAGS=3D&quot;$(TARGET_CPPFLAGS) -DCAIRO_NO_MUTEX=
=3D1&quot;<br>
-endif<br>
-<br>
=C2=A0# cairo can use C++11 atomics when available, so we need to link with=
<br>
=C2=A0# libatomic for the architectures who need libatomic.<br>
=C2=A0ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)<br>
@@ -70,6 +68,13 @@ HOST_CAIRO_DEPENDENCIES =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-pixman \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-pkgconf<br>
<br>
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)<br>
+CAIRO_CONF_OPTS +=3D --enable-pthread<br>
+else<br>
+CAIRO_CONF_OPTS +=3D --disable-pthread<br>
+CAIRO_CONF_ENV +=3D CPPFLAGS=3D&quot;$(TARGET_CPPFLAGS) -DCAIRO_NO_MUTEX=
=3D1&quot;<br>
+endif<br>
+<br>
=C2=A0# DirectFB svg support rely on Cairo and Cairo DirectFB support depen=
ds on<br>
=C2=A0# DirectFB. Break circular dependency by disabling DirectFB support i=
n Cairo<br>
=C2=A0# (which is experimental)<br>
-- <br>
2.39.1<br>
<br></blockquote><div><br></div><div>Best Regards,</div><div><br></div><div=
>Fabrice <br></div></div></div>

--000000000000c29d5605f565cd7a--

--===============4277894671465272909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4277894671465272909==--
