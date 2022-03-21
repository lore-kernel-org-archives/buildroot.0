Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3708C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 22:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5752F41691;
	Mon, 21 Mar 2022 22:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s7L9G7V3g5YI; Mon, 21 Mar 2022 22:11:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAA034168F;
	Mon, 21 Mar 2022 22:11:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B53131BF275
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 22:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A45184168F
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 22:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wHo83sVckFqe for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 22:11:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3231E4168C
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 22:11:31 +0000 (UTC)
Received: by mail-vk1-xa36.google.com with SMTP id e7so4432111vkh.2
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 15:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IUnu1XDxY40wO7TeFafQmnTm703s75uc2ko7+yqkyRs=;
 b=V8KoTTV9fzbzqN0Dm969v0DaR2wtNq4NwrWPNRDV6ge7paT0cBZDIORomLJ0p6PeoN
 rS988QFk4DmcSU/fK3Kot36hNk5hzD5r6hcW/gUeDLwhkCHOuN93Gkxn/dmb1I4Ja7eL
 f28Ez5p3IDfNUdk5aqHQVRtylyH86Q4mMXx70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IUnu1XDxY40wO7TeFafQmnTm703s75uc2ko7+yqkyRs=;
 b=zrIlC1bT4wBttmvXtVWu8OVueXmJAi5IU1y7kxOD1WnuvXP0vmwdGAXuc9mZ1b9OCL
 43PlnD9x+gYEcpGuqytJuK9qQBentowbJICjGKRkqfo8F8ABj09b+2nrAbSrauZ8ASiA
 Cyb7CWJFm2TaMJGRA9j1QrKNgHldJb1loXD5MqUXekqlax+/KY5K71+xr3J1YB0iG0Sa
 T7De+6395i35UZoeqC3GKsa18GW2ktUfas110KgaSg4uS4j+y3uPSu+rTZKjloR182+Z
 ty6smT2pLojzJfojqAESsc9Bo4KC+lJstz88kGIG0b22v/oyk2oleMfXVq2xLOdGxqWO
 EkNA==
X-Gm-Message-State: AOAM531c33o9HbpfjHuUYiZVtTh7ffsDsahV8ZvGkt2xNUBugNoO7Sl0
 yh7yN1oIifOMlg9uwb3U3S3Z20bJgN3FQURFlqyWAw3kG51uxw==
X-Google-Smtp-Source: ABdhPJxAy4YJofHMepS8Dt3Jj8/HuK98O3MbXYzW7iZt/eaTHdWGnoYXmQDI29jHc1mpxkLzoZ19/tlPtWL5oTXJQ68=
X-Received: by 2002:a05:6122:218f:b0:337:85e8:86bf with SMTP id
 j15-20020a056122218f00b0033785e886bfmr8906346vkd.5.1647900690788; Mon, 21 Mar
 2022 15:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220316060219.3448648-1-james.hilliard1@gmail.com>
 <bc8efa1c-2b83-1c88-104f-bb48aa05f4b2@mind.be>
 <CADvTj4oUr8TUjbATPG=qGrxMgdg5VcMyGCCM4VpWyExV9tVs4g@mail.gmail.com>
In-Reply-To: <CADvTj4oUr8TUjbATPG=qGrxMgdg5VcMyGCCM4VpWyExV9tVs4g@mail.gmail.com>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 21 Mar 2022 23:10:54 +0100
Message-ID: <CA+_SqVZp+Bw6g7MoSTgKYJXX=g4cRKJb9yxQ2QudF4r2QHpadg@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pillow: fix pkg-config
 search paths
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============3938558876072054109=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3938558876072054109==
Content-Type: multipart/alternative; boundary="0000000000004cc7b505dac1c78d"

--0000000000004cc7b505dac1c78d
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 21, 2022 at 10:56 PM James Hilliard <james.hilliard1@gmail.com>
wrote:

> On Mon, Mar 21, 2022 at 3:32 PM Arnout Vandecappelle <arnout@mind.be>
> wrote:
> >
> >   Hi James,
> >
> > On 16/03/2022 07:02, James Hilliard wrote:
> > > Currently pillow doesn't correctly search pkg-config system paths
> > > for some libraries which can prevent some libraries from being
> > > properly detected/enabled in pillow.
> > >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > ---
> > >   ...Search-pkg-config-system-libs-cflags.patch | 33
> +++++++++++++++++++
> > >   package/python-pillow/python-pillow.mk        | 23 +++----------
> > >   2 files changed, 37 insertions(+), 19 deletions(-)
> > >   create mode 100644
> package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
> > >
> > > diff --git
> a/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
> b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
> > > new file mode 100644
> > > index 0000000000..9f979b048f
> > > --- /dev/null
> > > +++
> b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
> > > @@ -0,0 +1,33 @@
> > > +From 89c9c347bb7437d5ea559930e315f42a0236761f Mon Sep 17 00:00:00 2001
> > > +From: James Hilliard <james.hilliard1@gmail.com>
> > > +Date: Tue, 15 Mar 2022 23:31:59 -0600
> > > +Subject: [PATCH] Search pkg-config system libs/cflags.
> > > +
> > > +We need to search the system paths as well from pkg-config for
> > > +some packages to be found properly.
> > > +
> > > +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > +[Upstream status:
> > > +https://github.com/python-pillow/Pillow/pull/6138]
> > > +---
> > > + setup.py | 4 ++--
> > > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > > +
> > > +diff --git a/setup.py b/setup.py
> > > +index 3468b260..59d65ce2 100755
> > > +--- a/setup.py
> > > ++++ b/setup.py
> > > +@@ -252,8 +252,8 @@ def _cmd_exists(cmd):
> > > + def _pkg_config(name):
> > > +     try:
> > > +         command = os.environ.get("PKG_CONFIG", "pkg-config")
> > > +-        command_libs = [command, "--libs-only-L", name]
> > > +-        command_cflags = [command, "--cflags-only-I", name]
> > > ++        command_libs = [command, "--libs-only-L",
> "--keep-system-libs", name]
> > > ++        command_cflags = [command, "--cflags-only-I",
> "--keep-system-cflags", name]
> >
> >   You gave an additional explanation why this is needed in the upstream
> PR:
> >
> > Zlib and anything that has headers in the normal system libs/include
> folders
> > seems to not get their headers picked up without this change.
> >
> > I think this issue is mostly going to be something people hit when cross
> > compiling since the prefix based system libs/include folder would
> probably work
> > in most of the usual cases(searching in sys.prefix will not work when
> cross
> > compiling since it points to the host toolchain prefix rather than the
> target
> > toolchain sysroot prefix):
> >
> >
> >   However, that implies that either we have to make sure that sys.prefix
> is set
> > correctly (i.e. point it to staging instead of host), or pillow is using
> > sys.prefix incorrectly.
>
> I think pillow is using sys.prefix in a way that is not really cross
> compilation
> compatible, however using pkg-config with sysm libs/cflags seems to be
> sufficient
> for it to pass its non-standard header checks.
>

I remember having added the --disable-platform-guessing exactly to overcome
this problem. All the setting should be provided by buildroot. Probably,
the logic behind this is slightly changed, and the mechanism doesn't work
anymore. I'll try to have a look.


>
> >
> >   Before that, still, I don't understand how this can be an issue.
> Unless if
> > pillow also passes something like -nostdinc, our toolchain wrapper
> should make
> > sure that staging/usr/include is in the search path.
>
> It's due to pillow having custom header checks like this:
> https://github.com/python-pillow/Pillow/blob/9.0.1/setup.py#L633
>
> >
> >   There also doesn't seem to be an autobuilder failure due to this...
> But maybe
> > it builds successfully, just without some optional dependency? Please
> provide
> > more details about the failure in the commit message.
>
> The failure was getting hidden by the non-standard build/install cmd
> overrides it
> would appear, it seemed pillow was getting built for the host instead
> of the target with
> those, I didn't investigate in too much detail as those custom
> build/install overrides
> are not actually needed.
>
> >
> >
> >
> > > +         if not DEBUG:
> > > +             command_libs.append("--silence-errors")
> > > +             command_cflags.append("--silence-errors")
> > > +--
> > > +2.35.1
> > > +
> > > diff --git a/package/python-pillow/python-pillow.mk
> b/package/python-pillow/python-pillow.mk
> > > index 901876e0ee..ef677855b2 100644
> > > --- a/package/python-pillow/python-pillow.mk
> > > +++ b/package/python-pillow/python-pillow.mk
> > > @@ -12,7 +12,10 @@ PYTHON_PILLOW_LICENSE_FILES = LICENSE
> > >   PYTHON_PILLOW_CPE_ID_VENDOR = python
> > >   PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
> > >   PYTHON_PILLOW_SETUP_TYPE = setuptools
> > > -PYTHON_PILLOW_BUILD_OPTS = --disable-platform-guessing
> > > +PYTHON_PILLOW_ENV = MAX_CONCURRENCY="$(PARALLEL_JOBS)"
> >
> >   This change isn't explained in the commit message, and seems unrelated.
> >
> > > +
> > > +PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
> > > +PYTHON_PILLOW_BUILD_OPTS = build_ext --disable-platform-guessing
> >
> >   The need for these two changes is also not clear at all from the
> commit message.
> >
> >
> >   I've marked the patch as Changes Requested.
> >
> >   Regards,
> >   Arnout
> >
> > >
> > >   ifeq ($(BR2_PACKAGE_FREETYPE),y)
> > >   PYTHON_PILLOW_DEPENDENCIES += freetype
> > > @@ -68,22 +71,4 @@ else
> > >   PYTHON_PILLOW_BUILD_OPTS += --disable-webp --disable-webpmux
> > >   endif
> > >
> > > -define PYTHON_PILLOW_BUILD_CMDS
> > > -     cd $(PYTHON_PILLOW_BUILDDIR); \
> > > -             PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> > > -             $(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
> > > -             $(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
> > > -             $(PYTHON_PILLOW_BASE_BUILD_OPTS)
> $(PYTHON_PILLOW_BUILD_OPTS)
> > > -endef
> > > -
> > > -define PYTHON_PILLOW_INSTALL_TARGET_CMDS
> > > -     cd $(PYTHON_PILLOW_BUILDDIR); \
> > > -             PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> > > -             $(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
> > > -             $(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
> > > -             $(PYTHON_PILLOW_BUILD_OPTS) install \
> > > -             $(PYTHON_PILLOW_BASE_INSTALL_TARGET_OPTS) \
> > > -             $(PYTHON_PILLOW_INSTALL_TARGET_OPTS)
> > > -endef
> > > -
> > >   $(eval $(python-package))
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>


-- 

Angelo Compagnucci

Software Engineer

angelo@amarulasolutions.com
__________________________________
Amarula Solutions SRL

Via le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 (0)42 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
[`as] https://www.amarulasolutions.com|

--0000000000004cc7b505dac1c78d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 21, 2022 at 10:56 PM Jame=
s Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com">james.hilliard1=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Mon, Mar 21, 2022 at 3:32 PM Arnout Vandecappelle &lt;<a href=
=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@mind.be</a>&gt; wrote:<=
br>
&gt;<br>
&gt;=C2=A0 =C2=A0Hi James,<br>
&gt;<br>
&gt; On 16/03/2022 07:02, James Hilliard wrote:<br>
&gt; &gt; Currently pillow doesn&#39;t correctly search pkg-config system p=
aths<br>
&gt; &gt; for some libraries which can prevent some libraries from being<br=
>
&gt; &gt; properly detected/enabled in pillow.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliar=
d1@gmail.com" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0...Search-pkg-config-system-libs-cflags.patch | 33 ++=
+++++++++++++++++<br>
&gt; &gt;=C2=A0 =C2=A0package/python-pillow/<a href=3D"http://python-pillow=
.mk" rel=3D"noreferrer" target=3D"_blank">python-pillow.mk</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 23 +++----------<br>
&gt; &gt;=C2=A0 =C2=A02 files changed, 37 insertions(+), 19 deletions(-)<br=
>
&gt; &gt;=C2=A0 =C2=A0create mode 100644 package/python-pillow/0001-Search-=
pkg-config-system-libs-cflags.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/package/python-pillow/0001-Search-pkg-config-system-=
libs-cflags.patch b/package/python-pillow/0001-Search-pkg-config-system-lib=
s-cflags.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..9f979b048f<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/package/python-pillow/0001-Search-pkg-config-system-libs-cf=
lags.patch<br>
&gt; &gt; @@ -0,0 +1,33 @@<br>
&gt; &gt; +From 89c9c347bb7437d5ea559930e315f42a0236761f Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail=
.com" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
&gt; &gt; +Date: Tue, 15 Mar 2022 23:31:59 -0600<br>
&gt; &gt; +Subject: [PATCH] Search pkg-config system libs/cflags.<br>
&gt; &gt; +<br>
&gt; &gt; +We need to search the system paths as well from pkg-config for<b=
r>
&gt; &gt; +some packages to be found properly.<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hillia=
rd1@gmail.com" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
&gt; &gt; +[Upstream status:<br>
&gt; &gt; +<a href=3D"https://github.com/python-pillow/Pillow/pull/6138" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/python-pillow/Pillow/=
pull/6138</a>]<br>
&gt; &gt; +---<br>
&gt; &gt; + setup.py | 4 ++--<br>
&gt; &gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/setup.py b/setup.py<br>
&gt; &gt; +index 3468b260..59d65ce2 100755<br>
&gt; &gt; +--- a/setup.py<br>
&gt; &gt; ++++ b/setup.py<br>
&gt; &gt; +@@ -252,8 +252,8 @@ def _cmd_exists(cmd):<br>
&gt; &gt; + def _pkg_config(name):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0try:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command =3D os.environ.get(&qu=
ot;PKG_CONFIG&quot;, &quot;pkg-config&quot;)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 command_libs =3D [command, &quot;--=
libs-only-L&quot;, name]<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 command_cflags =3D [command, &quot;=
--cflags-only-I&quot;, name]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 command_libs =3D [command, &quot;--=
libs-only-L&quot;, &quot;--keep-system-libs&quot;, name]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 command_cflags =3D [command, &quot;=
--cflags-only-I&quot;, &quot;--keep-system-cflags&quot;, name]<br>
&gt;<br>
&gt;=C2=A0 =C2=A0You gave an additional explanation why this is needed in t=
he upstream PR:<br>
&gt;<br>
&gt; Zlib and anything that has headers in the normal system libs/include f=
olders<br>
&gt; seems to not get their headers picked up without this change.<br>
&gt;<br>
&gt; I think this issue is mostly going to be something people hit when cro=
ss<br>
&gt; compiling since the prefix based system libs/include folder would prob=
ably work<br>
&gt; in most of the usual cases(searching in sys.prefix will not work when =
cross<br>
&gt; compiling since it points to the host toolchain prefix rather than the=
 target<br>
&gt; toolchain sysroot prefix):<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0However, that implies that either we have to make sure tha=
t sys.prefix is set<br>
&gt; correctly (i.e. point it to staging instead of host), or pillow is usi=
ng<br>
&gt; sys.prefix incorrectly.<br>
<br>
I think pillow is using sys.prefix in a way that is not really cross compil=
ation<br>
compatible, however using pkg-config with sysm libs/cflags seems to be<br>
sufficient<br>
for it to pass its non-standard header checks.<br></blockquote><div><br></d=
iv><div>I remember having added the <span class=3D"gmail-im">--disable-plat=
form-guessing</span> exactly to overcome this problem. All the setting shou=
ld be provided by buildroot. Probably, the logic behind this is slightly ch=
anged, and the mechanism doesn&#39;t work anymore. I&#39;ll try to have a l=
ook.</div><div>=C2=A0 </div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Before that, still, I don&#39;t understand how this can be=
 an issue. Unless if<br>
&gt; pillow also passes something like -nostdinc, our toolchain wrapper sho=
uld make<br>
&gt; sure that staging/usr/include is in the search path.<br>
<br>
It&#39;s due to pillow having custom header checks like this:<br>
<a href=3D"https://github.com/python-pillow/Pillow/blob/9.0.1/setup.py#L633=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/python-pillow/Pil=
low/blob/9.0.1/setup.py#L633</a><br>
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0There also doesn&#39;t seem to be an autobuilder failure d=
ue to this... But maybe<br>
&gt; it builds successfully, just without some optional dependency? Please =
provide<br>
&gt; more details about the failure in the commit message.<br>
<br>
The failure was getting hidden by the non-standard build/install cmd<br>
overrides it<br>
would appear, it seemed pillow was getting built for the host instead<br>
of the target with<br>
those, I didn&#39;t investigate in too much detail as those custom<br>
build/install overrides<br>
are not actually needed.<br>
<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not DEBUG:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command_libs.app=
end(&quot;--silence-errors&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command_cflags.a=
ppend(&quot;--silence-errors&quot;)<br>
&gt; &gt; +--<br>
&gt; &gt; +2.35.1<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/package/python-pillow/<a href=3D"http://python-pillo=
w.mk" rel=3D"noreferrer" target=3D"_blank">python-pillow.mk</a> b/package/p=
ython-pillow/<a href=3D"http://python-pillow.mk" rel=3D"noreferrer" target=
=3D"_blank">python-pillow.mk</a><br>
&gt; &gt; index 901876e0ee..ef677855b2 100644<br>
&gt; &gt; --- a/package/python-pillow/<a href=3D"http://python-pillow.mk" r=
el=3D"noreferrer" target=3D"_blank">python-pillow.mk</a><br>
&gt; &gt; +++ b/package/python-pillow/<a href=3D"http://python-pillow.mk" r=
el=3D"noreferrer" target=3D"_blank">python-pillow.mk</a><br>
&gt; &gt; @@ -12,7 +12,10 @@ PYTHON_PILLOW_LICENSE_FILES =3D LICENSE<br>
&gt; &gt;=C2=A0 =C2=A0PYTHON_PILLOW_CPE_ID_VENDOR =3D python<br>
&gt; &gt;=C2=A0 =C2=A0PYTHON_PILLOW_CPE_ID_PRODUCT =3D pillow<br>
&gt; &gt;=C2=A0 =C2=A0PYTHON_PILLOW_SETUP_TYPE =3D setuptools<br>
&gt; &gt; -PYTHON_PILLOW_BUILD_OPTS =3D --disable-platform-guessing<br>
&gt; &gt; +PYTHON_PILLOW_ENV =3D MAX_CONCURRENCY=3D&quot;$(PARALLEL_JOBS)&q=
uot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0This change isn&#39;t explained in the commit message, and=
 seems unrelated.<br>
&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +PYTHON_PILLOW_DEPENDENCIES =3D host-pkgconf<br>
&gt; &gt; +PYTHON_PILLOW_BUILD_OPTS =3D build_ext --disable-platform-guessi=
ng<br>
&gt;<br>
&gt;=C2=A0 =C2=A0The need for these two changes is also not clear at all fr=
om the commit message.<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0I&#39;ve marked the patch as Changes Requested.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0Arnout<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0ifeq ($(BR2_PACKAGE_FREETYPE),y)<br>
&gt; &gt;=C2=A0 =C2=A0PYTHON_PILLOW_DEPENDENCIES +=3D freetype<br>
&gt; &gt; @@ -68,22 +71,4 @@ else<br>
&gt; &gt;=C2=A0 =C2=A0PYTHON_PILLOW_BUILD_OPTS +=3D --disable-webp --disabl=
e-webpmux<br>
&gt; &gt;=C2=A0 =C2=A0endif<br>
&gt; &gt;<br>
&gt; &gt; -define PYTHON_PILLOW_BUILD_CMDS<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0cd $(PYTHON_PILLOW_BUILDDIR); \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PKG_CONFIG_ALLOW=
_SYSTEM_CFLAGS=3D1 \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON_PILLOW_=
BASE_ENV) $(PYTHON_PILLOW_ENV) \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON_PILLOW_=
PYTHON_INTERPRETER) setup.py build_ext \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON_PILLOW_=
BASE_BUILD_OPTS) $(PYTHON_PILLOW_BUILD_OPTS)<br>
&gt; &gt; -endef<br>
&gt; &gt; -<br>
&gt; &gt; -define PYTHON_PILLOW_INSTALL_TARGET_CMDS<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0cd $(PYTHON_PILLOW_BUILDDIR); \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PKG_CONFIG_ALLOW=
_SYSTEM_CFLAGS=3D1 \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON_PILLOW_=
BASE_ENV) $(PYTHON_PILLOW_ENV) \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON_PILLOW_=
PYTHON_INTERPRETER) setup.py build_ext \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON_PILLOW_=
BUILD_OPTS) install \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON_PILLOW_=
BASE_INSTALL_TARGET_OPTS) \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON_PILLOW_=
INSTALL_TARGET_OPTS)<br>
&gt; &gt; -endef<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0$(eval $(python-package))<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:none;vertical-align:baseline=
;white-space:pre-wrap"></span><span style=3D"font-size:10pt;font-family:Ubu=
ntu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:50=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre-wrap">Angelo Compagnucci</span></p><p dir=3D"ltr"=
 style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,=
0);background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wra=
p">Software Engineer</span></p><p dir=3D"ltr" style=3D"line-height:1.8;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&qu=
ot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:angelo@am=
arulasolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>=C2=A0=
<br></span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot=
;,monospace;color:rgb(241,194,50);background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre-wrap">__________________________________</span>=
<span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace=
;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:Ubun=
tu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:500=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre-wrap">Amarula Solutions SRL</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">Via le Canevare 30, 31100 Treviso, Veneto, IT</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">T. +39 (0)42 243 5310</span><span style=3D"font-size:10pt;font-famil=
y:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre-wrap"><br></span><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap"><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@=
amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.8;=
margin-top:0pt;margin-bottom:0pt"><a href=3D"http://www.amarulasolutions.co=
m/" style=3D"text-decoration:none" target=3D"_blank"><span style=3D"font-si=
ze:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">www.=
amarulasolutions.com</span></a></p><div>[`as] <a href=3D"https://www.amarul=
asolutions.com" target=3D"_blank">https://www.amarulasolutions.com</a>|</di=
v></div></div></div>

--0000000000004cc7b505dac1c78d--

--===============3938558876072054109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3938558876072054109==--
