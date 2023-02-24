Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAADC6FA8E
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 18:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C93B60BF0;
	Fri, 24 Feb 2023 18:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C93B60BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ux6G8-VSf14Q; Fri, 24 Feb 2023 18:12:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 335F560BFC;
	Fri, 24 Feb 2023 18:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 335F560BFC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 105761BF376
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 18:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D53F881340
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 18:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D53F881340
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EZcisK2E-XwM for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 18:12:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41BC18128A
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41BC18128A
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 18:12:36 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id bi9so244777lfb.2
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 10:12:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YSser0aRJ9Q53mDPrDR7ZAW5xGIP40VH10eKLiVvFns=;
 b=6Rswy1II0L40a0h6C7R2RzihpqJ9+aObJiigiwpiE4F97l0rVnUyCHijDTpU6Eht0h
 8kSp9y8xWh8cRIhqiGN2lXhaKVPjmCf6Bz17j0HC6gxZsYtj2rPE1Ygg8UVV4MWOzdoe
 fBv288CgRFg8r2TOLxdNvbkm+x7C1xKL84U847kiLH2AkfwTGuwDW3zwwXwgVogdj6t4
 4gNh0iPdaQj+02CX1gaIXw8RbB9wTs2vWXIQZbpqZ7ZkWuttfjwBtjMpV6ssphM7ASEH
 LkmopVQsb90A8zvOK5ZwSWG1z+RlZzssiKJMrSUcj2TFjLrhsoEIJ1YxAcUf5B4Eu7V0
 jurg==
X-Gm-Message-State: AO0yUKVa9GwWh1iZyofoQjuNrYFqdMAdNFxtWPGe3XKRk5JA2Yr5O9f7
 d1HCWLuTbsPDH6SNt2GzLQxJ9wOFVuFVZDK+
X-Google-Smtp-Source: AK7set9goi1Cnr8kv+DSLy+O1v4sHqD81s2skOqElQMF0zNz1h4QwCprqH5AQqBI5hKohcYOSh/aWw==
X-Received: by 2002:ac2:5a4e:0:b0:4b5:23c4:ab1a with SMTP id
 r14-20020ac25a4e000000b004b523c4ab1amr6379022lfn.42.1677262353870; 
 Fri, 24 Feb 2023 10:12:33 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46]) by smtp.gmail.com with ESMTPSA id
 h15-20020ac2596f000000b004ddaea30ba6sm175632lfp.235.2023.02.24.10.12.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 10:12:33 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id f18so235514lfa.3
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 10:12:33 -0800 (PST)
X-Received: by 2002:ac2:52b9:0:b0:4dd:9da1:bef0 with SMTP id
 r25-20020ac252b9000000b004dd9da1bef0mr2889006lfm.5.1677262352835; Fri, 24 Feb
 2023 10:12:32 -0800 (PST)
MIME-Version: 1.0
References: <20230224111509.2434694-1-thomas.devoogdt@barco.com>
 <Y/j5lHY2/7h82EG4@donbot>
In-Reply-To: <Y/j5lHY2/7h82EG4@donbot>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Fri, 24 Feb 2023 19:12:21 +0100
X-Gmail-Original-Message-ID: <CACXRmJhc3pcwPp1EZZ3Yt-qMfAGDbWNYe71ZRH0=JV78HMBjag@mail.gmail.com>
Message-ID: <CACXRmJhc3pcwPp1EZZ3Yt-qMfAGDbWNYe71ZRH0=JV78HMBjag@mail.gmail.com>
To: John Keeping <john@metanate.com>
Subject: Re: [Buildroot] [PATCH v1 1/3] pkg-cmake: add option to select the
 Ninja generator
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: multipart/mixed; boundary="===============3740647669115527371=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3740647669115527371==
Content-Type: multipart/alternative; boundary="000000000000bc687605f5761206"

--000000000000bc687605f5761206
Content-Type: text/plain; charset="UTF-8"

Hi,

I don't disagree to have a more generic keyword to add build options. I
just took the meson example. Before I rewrite further, I would like to have
also feedback from others.

About webkit, yes it uses --build very recently. If I can fit the existing
MAKE_OPTS with that --build flag, then I will change it.

About the doc, I never came to the point where I had to change that, my
bad. But would prefer to first get this in to the code base. Documentation
can follow if everything stabilizes.

Kr,

Thomas

Op vr 24 feb. 2023 18:53 schreef John Keeping <john@metanate.com>:

> On Fri, Feb 24, 2023 at 12:15:07PM +0100, Thomas Devoogdt wrote:
> > E.g. Commit
> >  16e5c92ff5fd2b44a1126bd7d7538c68ce838213, and
> >  78d499409f71d8a22b0632c8ebc06f67ee6ae6dd
> > can now be replaced by: WEBKITGTK_CMAKE_NINJA = YES
> >
> > Packages that are selecting Ninja, should also use the NINJA_{ENV,OPTS}
> variables iso the MAKE variables.
>
> The current webkitgtk build commands use `cmake --build` and `cmake
> --install`, wouldn't it be better to use those here?
>
> I wonder if it makes more sense to replace anything generator-specific
> (like $(PKG)_MAKE_OPTS or $(PKG)_NINJA_OPTS) with general
> $(PKG)_CMAKE_BUILD_OPTS and $(PKG)_CMAKE_INSTALL_OPTS so that packages
> become independent of the generator.
>
> If those options are at the end of the command, then packages still have
> the option (in the build phase) to pass built-tool specific options by
> including `--` in the value.
>
> > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> > ---
> >  package/pkg-cmake.mk | 41 +++++++++++++++++++++++++++++++++++++++--
>
> No change in docs/? ;-)
>
> >  1 file changed, 39 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> > index 8c375779cb..4ce3e6bada 100644
> > --- a/package/pkg-cmake.mk
> > +++ b/package/pkg-cmake.mk
> > @@ -65,6 +65,13 @@ else
> >  $(2)_BUILDDIR                        = $$($(2)_SRCDIR)/buildroot-build
> >  endif
> >
> > +ifeq ($$($(3)_CMAKE_NINJA),YES)
> > +$(2)_DEPENDENCIES += host-ninja
> > +$(2)_GENERATOR                       = "Ninja"
> > +else
> > +$(2)_GENERATOR                       = "Unix Makefiles"
> > +endif
> > +
> >  #
> >  # Configure step. Only define it if not already defined by the package
> >  # .mk file. And take care of the differences between host and target
> > @@ -88,7 +95,7 @@ define $(2)_CONFIGURE_CMDS
> >       rm -f CMakeCache.txt && \
> >       PATH=$$(BR_PATH) \
> >       $$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> > -             -G"Unix Makefiles" \
> > +             -G$$($$(PKG)_GENERATOR) \
> >
>  -DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
> >               -DCMAKE_INSTALL_PREFIX="/usr" \
> >               -DCMAKE_INSTALL_RUNSTATEDIR="/run" \
> > @@ -119,7 +126,7 @@ define $(2)_CONFIGURE_CMDS
> >       PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> >       PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
> >       $$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> > -             -G"Unix Makefiles" \
> > +             -G$$($$(PKG)_GENERATOR) \
> >               -DCMAKE_INSTALL_SO_NO_EXE=0 \
> >               -DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
> >               -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
> > @@ -165,45 +172,75 @@ $(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
> >  #
> >  ifndef $(2)_BUILD_CMDS
> >  ifeq ($(4),target)
> > +ifeq ($$($(3)_CMAKE_NINJA),YES)
> > +define $(2)_BUILD_CMDS
> > +     $$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) $$(NINJA) $$(NINJA_OPTS)
> $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_BUILDDIR)
> > +endef
> > +else
> >  define $(2)_BUILD_CMDS
> >       $$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE)
> $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
> >  endef
> > +endif
> > +else
> > +ifeq ($$($(3)_CMAKE_NINJA),YES)
> > +define $(2)_BUILD_CMDS
> > +     $$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) $$(NINJA) $$(NINJA_OPTS)
> $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_BUILDDIR)
> > +endef
> >  else
> >  define $(2)_BUILD_CMDS
> >       $$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE)
> $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
> >  endef
> >  endif
> >  endif
> > +endif
> >
> >  #
> >  # Host installation step. Only define it if not already defined by the
> >  # package .mk file.
> >  #
> >  ifndef $(2)_INSTALL_CMDS
> > +ifeq ($$($(3)_CMAKE_NINJA),YES)
> > +define $(2)_INSTALL_CMDS
> > +     $$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) $$(NINJA) $$(NINJA_OPTS)
> -C $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_OPTS)
> > +endef
> > +else
> >  define $(2)_INSTALL_CMDS
> >       $$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE)
> $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_OPTS) -C $$($$(PKG)_BUILDDIR)
> >  endef
> >  endif
> > +endif
> >
> >  #
> >  # Staging installation step. Only define it if not already defined by
> >  # the package .mk file.
> >  #
> >  ifndef $(2)_INSTALL_STAGING_CMDS
> > +ifeq ($$($(3)_CMAKE_NINJA),YES)
> > +define $(2)_INSTALL_STAGING_CMDS
> > +     $$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR)
> $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR install
> > +endef
> > +else
> >  define $(2)_INSTALL_STAGING_CMDS
> >       $$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE)
> $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPTS) -C
> $$($$(PKG)_BUILDDIR)
> >  endef
> >  endif
> > +endif
> >
> >  #
> >  # Target installation step. Only define it if not already defined by
> >  # the package .mk file.
> >  #
> >  ifndef $(2)_INSTALL_TARGET_CMDS
> > +ifeq ($$($(3)_CMAKE_NINJA),YES)
> > +define $(2)_INSTALL_TARGET_CMDS
> > +     $$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR)
> $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR) install
> > +endef
> > +else
> >  define $(2)_INSTALL_TARGET_CMDS
> >       $$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE)
> $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_TARGET_OPTS) -C
> $$($$(PKG)_BUILDDIR)
> >  endef
> >  endif
> > +endif
> >
> >  # Call the generic package infrastructure to generate the necessary
> >  # make targets
> > --
> > 2.39.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
>

--000000000000bc687605f5761206
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I don&#39;t disagree to have a more generic keyword to add build =
options. I just took the meson example. Before I rewrite further, I would l=
ike to have also feedback from others.=C2=A0</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">About webkit, yes it uses --build very recently. If I =
can fit the existing MAKE_OPTS with that --build flag, then I will change i=
t.</div><div dir=3D"auto"><br></div><div dir=3D"auto">About the doc, I neve=
r came to the point where I had to change that, my bad. But would prefer to=
 first get this in to the code base. Documentation can follow if everything=
 stabilizes.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Kr,=
=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thomas=C2=A0<br><=
br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_=
attr">Op vr 24 feb. 2023 18:53 schreef John Keeping &lt;<a href=3D"mailto:j=
ohn@metanate.com">john@metanate.com</a>&gt;:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">On Fri, Feb 24, 2023 at 12:15:07PM +0100, Thomas Devoogdt wrote:<=
br>
&gt; E.g. Commit <br>
&gt;=C2=A0 16e5c92ff5fd2b44a1126bd7d7538c68ce838213, and<br>
&gt;=C2=A0 78d499409f71d8a22b0632c8ebc06f67ee6ae6dd <br>
&gt; can now be replaced by: WEBKITGTK_CMAKE_NINJA =3D YES<br>
&gt; <br>
&gt; Packages that are selecting Ninja, should also use the NINJA_{ENV,OPTS=
} variables iso the MAKE variables.<br>
<br>
The current webkitgtk build commands use `cmake --build` and `cmake<br>
--install`, wouldn&#39;t it be better to use those here?<br>
<br>
I wonder if it makes more sense to replace anything generator-specific<br>
(like $(PKG)_MAKE_OPTS or $(PKG)_NINJA_OPTS) with general<br>
$(PKG)_CMAKE_BUILD_OPTS and $(PKG)_CMAKE_INSTALL_OPTS so that packages<br>
become independent of the generator.<br>
<br>
If those options are at the end of the command, then packages still have<br=
>
the option (in the build phase) to pass built-tool specific options by<br>
including `--` in the value.<br>
<br>
&gt; Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devoogdt@b=
arco.com" target=3D"_blank" rel=3D"noreferrer">thomas.devoogdt@barco.com</a=
>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/<a href=3D"http://pkg-cmake.mk" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">pkg-cmake.mk</a> | 41 +++++++++++++++++++++++++++++=
++++++++++--<br>
<br>
No change in docs/? ;-)<br>
<br>
&gt;=C2=A0 1 file changed, 39 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/<a href=3D"http://pkg-cmake.mk" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">pkg-cmake.mk</a> b/package/<a href=3D"http:/=
/pkg-cmake.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">pkg-cmake.mk=
</a><br>
&gt; index 8c375779cb..4ce3e6bada 100644<br>
&gt; --- a/package/<a href=3D"http://pkg-cmake.mk" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">pkg-cmake.mk</a><br>
&gt; +++ b/package/<a href=3D"http://pkg-cmake.mk" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">pkg-cmake.mk</a><br>
&gt; @@ -65,6 +65,13 @@ else<br>
&gt;=C2=A0 $(2)_BUILDDIR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D $$($(2)_SRCDIR)/buildroot-build<br>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 <br>
&gt; +ifeq ($$($(3)_CMAKE_NINJA),YES)<br>
&gt; +$(2)_DEPENDENCIES +=3D host-ninja<br>
&gt; +$(2)_GENERATOR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;Ninja&quot;<br>
&gt; +else<br>
&gt; +$(2)_GENERATOR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;Unix Makefiles&quot;<br>
&gt; +endif<br>
&gt; +<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Configure step. Only define it if not already defined by the p=
ackage<br>
&gt;=C2=A0 # .mk file. And take care of the differences between host and ta=
rget<br>
&gt; @@ -88,7 +95,7 @@ define $(2)_CONFIGURE_CMDS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f CMakeCache.txt &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PATH=3D$$(BR_PATH) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG=
)_SRCDIR) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-G&quot;Unix Makefile=
s&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-G$$($$(PKG)_GENERATO=
R) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DCMAKE_TOOLCHAI=
N_FILE=3D&quot;$$(HOST_DIR)/share/buildroot/toolchainfile.cmake&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DCMAKE_INSTALL_=
PREFIX=3D&quot;/usr&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DCMAKE_INSTALL_=
RUNSTATEDIR=3D&quot;/run&quot; \<br>
&gt; @@ -119,7 +126,7 @@ define $(2)_CONFIGURE_CMDS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG=
)_SRCDIR) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-G&quot;Unix Makefile=
s&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-G$$($$(PKG)_GENERATO=
R) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DCMAKE_INSTALL_=
SO_NO_EXE=3D0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DCMAKE_FIND_ROO=
T_PATH=3D&quot;$$(HOST_DIR)&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DCMAKE_FIND_ROO=
T_PATH_MODE_PROGRAM=3D&quot;BOTH&quot; \<br>
&gt; @@ -165,45 +172,75 @@ $(2)_DEPENDENCIES +=3D $(BR2_CMAKE_HOST_DEPENDEN=
CY)<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ifndef $(2)_BUILD_CMDS<br>
&gt;=C2=A0 ifeq ($(4),target)<br>
&gt; +ifeq ($$($(3)_CMAKE_NINJA),YES)<br>
&gt; +define $(2)_BUILD_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) $$(NINJ=
A) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_BUILDDIR)<br>
&gt; +endef<br>
&gt; +else<br>
&gt;=C2=A0 define $(2)_BUILD_CMDS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$(=
$$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)<br>
&gt;=C2=A0 endef<br>
&gt; +endif<br>
&gt; +else<br>
&gt; +ifeq ($$($(3)_CMAKE_NINJA),YES)<br>
&gt; +define $(2)_BUILD_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) $$(NINJA)=
 $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_BUILDDIR)<br>
&gt; +endef<br>
&gt;=C2=A0 else<br>
&gt;=C2=A0 define $(2)_BUILD_CMDS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$=
(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)<br>
&gt;=C2=A0 endef<br>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 endif<br>
&gt; +endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Host installation step. Only define it if not already defined =
by the<br>
&gt;=C2=A0 # package .mk file.<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ifndef $(2)_INSTALL_CMDS<br>
&gt; +ifeq ($$($(3)_CMAKE_NINJA),YES)<br>
&gt; +define $(2)_INSTALL_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) $$(NINJA)=
 $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_OPTS)<br>
&gt; +endef<br>
&gt; +else<br>
&gt;=C2=A0 define $(2)_INSTALL_CMDS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$=
(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_OPTS) -C $$($$(PKG)_BU=
ILDDIR)<br>
&gt;=C2=A0 endef<br>
&gt;=C2=A0 endif<br>
&gt; +endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Staging installation step. Only define it if not already defin=
ed by<br>
&gt;=C2=A0 # the package .mk file.<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ifndef $(2)_INSTALL_STAGING_CMDS<br>
&gt; +ifeq ($$($(3)_CMAKE_NINJA),YES)<br>
&gt; +define $(2)_INSTALL_STAGING_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=
=3D$$(STAGING_DIR) $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR install<=
br>
&gt; +endef<br>
&gt; +else<br>
&gt;=C2=A0 define $(2)_INSTALL_STAGING_CMDS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$(=
$$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$(=
$$(PKG)_BUILDDIR)<br>
&gt;=C2=A0 endef<br>
&gt;=C2=A0 endif<br>
&gt; +endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Target installation step. Only define it if not already define=
d by<br>
&gt;=C2=A0 # the package .mk file.<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ifndef $(2)_INSTALL_TARGET_CMDS<br>
&gt; +ifeq ($$($(3)_CMAKE_NINJA),YES)<br>
&gt; +define $(2)_INSTALL_TARGET_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=
=3D$$(TARGET_DIR) $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR) install<=
br>
&gt; +endef<br>
&gt; +else<br>
&gt;=C2=A0 define $(2)_INSTALL_TARGET_CMDS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$(=
$$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_TARGET_OPTS) -C $$($=
$(PKG)_BUILDDIR)<br>
&gt;=C2=A0 endef<br>
&gt;=C2=A0 endif<br>
&gt; +endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Call the generic package infrastructure to generate the necess=
ary<br>
&gt;=C2=A0 # make targets<br>
&gt; -- <br>
&gt; 2.39.2<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank" rel=3D"no=
referrer">buildroot@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/ma=
ilman/listinfo/buildroot</a><br>
<br>
</blockquote></div></div></div>

--000000000000bc687605f5761206--

--===============3740647669115527371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3740647669115527371==--
