Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E47FC25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 22:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B4954012D;
	Sat,  1 Jun 2024 22:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EFLuNB5zleEP; Sat,  1 Jun 2024 22:49:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B38CE402E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B38CE402E6;
	Sat,  1 Jun 2024 22:49:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5713D1BF396
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 22:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 506A2608D8
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 22:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3HUNPA7nsSmb for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 22:49:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CDDBD611E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDDBD611E7
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CDDBD611E7
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 22:49:07 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-62a088f80f6so28766957b3.0
 for <buildroot@buildroot.org>; Sat, 01 Jun 2024 15:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717282146; x=1717886946;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oUS8xL3EIbrcACequXSwO3QHnkqa365kFlgCMaP6Sjc=;
 b=VJaAoevAfba1ExXNa61yLFl17eMr0w/RjCBcp2Mkh7H4tIBs1yZmEGBAhXnX5uEF3V
 wUXDIulxFTZFBTM+Mg/x8cFnT/OIbNHbSJcPiEwIEH6G5epauaDqnh5HddHMztngBpTW
 oM8KL9shKQc/gqCiE2jOPnOqQ/6bvapksXTLkAZhrTKNPNGkTo0aAxJF+CxDA+RfiYRR
 0QSJydQuO9F7FivPhZuTGBuLel6xOmyjpUnolHSXFv3MFzfQCT1o0RR1Az8i1qMVQAha
 IuYu0spwKvAAO+peq6kW8nUgPGlPAVkTEw25PpTTiocTGv5/Loxo6YLDowHGbh1x4hcK
 jKqw==
X-Gm-Message-State: AOJu0YxMGTFRchyAXgwt4bdn54LsvvusmNgakgcv0UHfZbHmJKEmFkuf
 zwJhrOakAZLgGsSOXI82Ev+HEug+NhaIvnkKbNGxtFpCL47ETjtWhC92Cupb6GDOOuyKagLMYh1
 xKqT9ojwOxiDvc/ujM+ZgDCrallk=
X-Google-Smtp-Source: AGHT+IHTym/kovX1OoUBi9ZGYDeBK43h9/9zG7xKTSsG/JqXOTrlJ/qtXHEm7m8hKpRiNcpfBgEf74f+fKoN/AYUdFY=
X-Received: by 2002:a05:690c:6d8b:b0:61a:fc74:16e2 with SMTP id
 00721157ae682-62c6cd7e00amr63484987b3.23.1717282145377; Sat, 01 Jun 2024
 15:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240531151325.2443323-1-roy.kollen.svendsen@akersolutions.com>
 <20240531151325.2443323-6-roy.kollen.svendsen@akersolutions.com>
 <ZltV8DAQmGI-vTpe@landeda>
In-Reply-To: <ZltV8DAQmGI-vTpe@landeda>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Sun, 2 Jun 2024 00:48:53 +0200
Message-ID: <CA+R_dequoj35fREbX-Rdi_EKp2x=f2jKLyz5=FpimqZcigb9=w@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717282146; x=1717886946; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oUS8xL3EIbrcACequXSwO3QHnkqa365kFlgCMaP6Sjc=;
 b=ZcuqMzlAm3yf+ugqp3X3ixfgKH05GR63RIoFqiUwTGV7zjaX1cXtZIiI/FA/Suie3C
 avZfQle2EVWmLWWNu1eL69ucPIjrta/HPdvX44d/KjjAZxT8ZSuE2ubb+StMFGCrFnKF
 XfhsKQmmFpOiijiUS1QHLAv8eIVHdXho9G7WW8OfJEXyJV//hkGEdcr5mFPAPYcBddYF
 v+oddJDE61qhMQ5LWbsVSp0LAnWsoQGrDY9toSMnJdFa9SPjyEsbPyWmAk9pGFnDySOJ
 7L5B6UwAIyzxTbANgmPCphs/VCaY9jBtmyiop+1Qe4vWaws28k61OjgPVwMN+qLkePRE
 Gn7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZcuqMzlA
Subject: Re: [Buildroot] [PATCH v5 06/14] package/qt6/qt6shadertools: new
 package
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: multipart/mixed; boundary="===============2822596996074284005=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2822596996074284005==
Content-Type: multipart/alternative; boundary="0000000000004129b20619dbe816"

--0000000000004129b20619dbe816
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yann,

I attempted to explain the host Qt6::Gui dependency in patch 02/14:

The Qt6::Gui module is needed when building the 'Qt Shader Baker' (qsb)
> host tool. Qsb is needed for converting the Qt6 Vulkan GLSL source code t=
o
> platform specific shader languages which is then later copied to target.
> For more details take a look at:
> https://doc.qt.io/qt-6/qtshadertools-overview.html and
> https://doc.qt.io/qt-6/qshaderbaker.html
>
In commit message 03/14 I wrote:

Qt Network is a required dependency of Qt Tools. Therefor we need a way to
> enable the Qt Network module when building for host.


qt6tools-6.7.1/CMakeLists.txt:

find_package(Qt6 ${PROJECT_VERSION} CONFIG REQUIRED COMPONENTS
> BuildInternals Core Network)
>

In commit message 09/14 I explained why I added an option to enable the
Testlib feature on host. You seemed to accept this explanation.

I added the blind host option for enabling the Qt Sql module to fix the
following build failure:

CMake Error at
/home/roy/src/buildroot-qt6-testing/buildroot/output/build/qt6base-6.7.0/cm=
ake/QtToolHelpers.cmake:684
(message):
  Failed to find the host tool "Qt6::qhelpgenerator".  It is part of the
  Qt6ToolsTools package, but the package did not contain the tool.  Make
sure
  that the host module Tools was built with all features enabled (no
  explicitly disabled tools).
Call Stack (most recent call first):

/home/roy/src/buildroot-qt6-testing/buildroot/output/build/qt6base-6.7.0/cm=
ake/QtToolHelpers.cmake:72
(qt_internal_find_tool)
  src/assistant/qhelpgenerator/CMakeLists.txt:9 (qt_internal_add_tool)

I'll add this to commit message 05/14, if you want me to create a v6 patch
set.

Best Regards,

Roy


l=C3=B8r. 1. juni 2024 kl. 19:10 skrev Yann E. MORIN <yann.morin.1998@free.=
fr>:

> Roy, All,
>
> Thanks for your new iteration of this series.
>
> I was looking at applying it, but I have a comment about this patch: why
> is the host qt6base required to have GUI support to build the target
> qt6shadertools?
>
> That's a question Thomas already asked in a previous iteration:
>     https://lore.kernel.org/buildroot/20240509164507.4682bee8@windsurf/
>
> but I could not see an explanation as a reply to Thomas, or in the
> following versions of this series.
>
> Could you provide a little bit of an explanation? For example, does it
> need a tool that is provided by qt6base only when the gui module is
> enabled? Or something else?
>
> It does not need to be a long explanation, just a sentence or maybe two;
> we just need to understand the dependency.
>
> Same goes for the qt6tols and its dependencies on HOST_QT6BASE_NETWORK
> and HOST_QT6BASE_SQL, and other such dependencies.
>
> Thank you!
>
> Regards,
> Yann E. MORIN.
>
> On 2024-05-31 17:13 +0200, Roy Kollen Svendsen spake thusly:
> > Signed-off-by: Roy Kollen Svendsen <
> roy.kollen.svendsen@akersolutions.com>
> > ---
> > Changes v4 -> v5:
> >   - Bump to v6.7.1
> >
> >  package/qt6/Config.in                         |  1 +
> >  package/qt6/qt6shadertools/Config.in          | 13 +++++++
> >  .../qt6/qt6shadertools/qt6shadertools.hash    | 10 +++++
> >  package/qt6/qt6shadertools/qt6shadertools.mk  | 39 +++++++++++++++++++
> >  4 files changed, 63 insertions(+)
> >  create mode 100644 package/qt6/qt6shadertools/Config.in
> >  create mode 100644 package/qt6/qt6shadertools/qt6shadertools.hash
> >  create mode 100644 package/qt6/qt6shadertools/qt6shadertools.mk
> >
> > diff --git a/package/qt6/Config.in b/package/qt6/Config.in
> > index 276a0217ab..b7e95a6885 100644
> > --- a/package/qt6/Config.in
> > +++ b/package/qt6/Config.in
> > @@ -47,6 +47,7 @@ source "package/qt6/qt6base/Config.in"
> >  source "package/qt6/qt6core5compat/Config.in"
> >  source "package/qt6/qt6serialbus/Config.in"
> >  source "package/qt6/qt6serialport/Config.in"
> > +source "package/qt6/qt6shadertools/Config.in"
> >  source "package/qt6/qt6svg/Config.in"
> >
> >  endif
> > diff --git a/package/qt6/qt6shadertools/Config.in
> b/package/qt6/qt6shadertools/Config.in
> > new file mode 100644
> > index 0000000000..1b47dc6132
> > --- /dev/null
> > +++ b/package/qt6/qt6shadertools/Config.in
> > @@ -0,0 +1,13 @@
> > +config BR2_PACKAGE_QT6SHADERTOOLS
> > +     bool "qt6shadertools"
> > +     select BR2_PACKAGE_HOST_QT6BASE_GUI
> > +     select BR2_PACKAGE_QT6BASE_GUI
> > +     help
> > +       Qt is a cross-platform application and UI framework for
> > +       developers using C++.
> > +
> > +       The Qt Shader Tools module builds on the SPIR-V Open
> > +       Source Ecosystem as described at the Khronos SPIR-V web
> > +       site.
> > +
> > +       https://doc.qt.io/qt-6/qtshadertools-index.html
> > diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash
> b/package/qt6/qt6shadertools/qt6shadertools.hash
> > new file mode 100644
> > index 0000000000..8e80d64851
> > --- /dev/null
> > +++ b/package/qt6/qt6shadertools/qt6shadertools.hash
> > @@ -0,0 +1,10 @@
> > +# Hash from:
> https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtshader=
tools-everywhere-src-6.7.1.tar.xz.sha256
> > +sha256
> e585e3a985b2e2bad8191a84489a04e69c3defc6022a8e746aad22a1f17910c2
> qtshadertools-everywhere-src-6.7.1.tar.xz
> > +
> > +# Hashes for license files:
> > +sha256
> 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
> LICENSES/BSD-3-Clause.txt
> > +sha256
> 110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4
> LICENSES/GFDL-1.3-no-invariants-only.txt
> > +sha256
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> LICENSES/GPL-2.0-only.txt
> > +sha256
> 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
> LICENSES/GPL-3.0-only.txt
> > +sha256
> da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768
> LICENSES/LGPL-3.0-only.txt
> > +sha256
> 40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2
> LICENSES/Qt-GPL-exception-1.0.txt
> > diff --git a/package/qt6/qt6shadertools/qt6shadertools.mk
> b/package/qt6/qt6shadertools/qt6shadertools.mk
> > new file mode 100644
> > index 0000000000..108f409380
> > --- /dev/null
> > +++ b/package/qt6/qt6shadertools/qt6shadertools.mk
> > @@ -0,0 +1,39 @@
> >
> +########################################################################=
########
> > +#
> > +# qt6shadertools
> > +#
> >
> +########################################################################=
########
> > +
> > +QT6SHADERTOOLS_VERSION =3D $(QT6_VERSION)
> > +QT6SHADERTOOLS_SITE =3D $(QT6_SITE)
> > +QT6SHADERTOOLS_SOURCE =3D
> qtshadertools-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SHADERTOOLS_VERSION).tar.=
xz
> > +QT6SHADERTOOLS_INSTALL_STAGING =3D YES
> > +QT6SHADERTOOLS_SUPPORTS_IN_SOURCE_BUILD =3D NO
> > +
> > +QT6SHADERTOOLS_CMAKE_BACKEND =3D ninja
> > +
> > +QT6SHADERTOOLS_LICENSE =3D \
> > +     GPL-2.0+ or LGPL-3.0, \
> > +     GPL-3.0, GFDL-1.3 no invariants (docs)
> > +
> > +QT6SHADERTOOLS_LICENSE_FILES =3D \
> > +     LICENSES/GPL-2.0-only.txt \
> > +     LICENSES/GPL-3.0-only.txt \
> > +     LICENSES/LGPL-3.0-only.txt \
> > +     LICENSES/GFDL-1.3-no-invariants-only.txt
> > +
> > +QT6SHADERTOOLS_CONF_OPTS =3D \
> > +     -DBUILD_WITH_PCH=3DOFF \
> > +     -DQT_BUILD_EXAMPLES=3DOFF \
> > +     -DQT_BUILD_TESTS=3DOFF
> > +
> > +QT6SHADERTOOLS_DEPENDENCIES =3D \
> > +     host-pkgconf \
> > +     qt6base \
> > +     host-qt6shadertools
> > +
> > +HOST_QT6SHADERTOOLS_DEPENDENCIES =3D \
> > +     host-qt6base
> > +
> > +$(eval $(cmake-package))
> > +$(eval $(host-cmake-package))
> > --
> > 2.45.1
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

--0000000000004129b20619dbe816
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Yann,</div><div><br></div><div>I attempted to expl=
ain the host Qt6::Gui dependency in patch 02/14:</div><div><br></div><div><=
/div><div><span style=3D"font-family:arial,sans-serif"></span></div><div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"font-family:=
arial,sans-serif">The Qt6::Gui module is needed when building the &#39;Qt S=
hader Baker&#39;
(qsb) host tool.

Qsb is needed for converting the Qt6 Vulkan GLSL source code to
platform specific shader languages which is then later copied to
target.

For more details take a look at:

<a href=3D"https://doc.qt.io/qt-6/qtshadertools-overview.html">https://doc.=
qt.io/qt-6/qtshadertools-overview.html</a>

and

<a href=3D"https://doc.qt.io/qt-6/qshaderbaker.html">https://doc.qt.io/qt-6=
/qshaderbaker.html</a></span><br><span style=3D"font-family:arial,sans-seri=
f"></span></blockquote><pre class=3D"gmail-content"><span style=3D"font-fam=
ily:arial,sans-serif"></span></pre><pre class=3D"gmail-content"><span style=
=3D"font-family:arial,sans-serif">In commit message 03/14 I wrote:</span></=
pre><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"font-f=
amily:arial,sans-serif">Qt Network is a required dependency of Qt Tools. Th=
erefor we need a way
to enable the Qt Network module when building for host.</span></blockquote>=
<div><br></div><div>qt6tools-6.7.1/CMakeLists.txt:</div><div><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">find_package(Qt6 ${PROJECT_VE=
RSION} CONFIG REQUIRED COMPONENTS BuildInternals Core Network) <br></blockq=
uote><div><br></div><div>In commit message 09/14 I explained why I added an=
 option to enable the Testlib feature on host. You seemed to accept this ex=
planation.</div><div><br></div><div>I added the blind host option for enabl=
ing the Qt Sql module to fix the following build failure:<br></div><div><br=
></div><div><span class=3D"gmail-im">CMake Error at /home/roy/src/buildroot=
-qt6-testing/buildroot/output/build/qt6base-6.7.0/cmake/QtToolHelpers.cmake=
:684 (message):<br></span>=C2=A0 Failed to find the host tool &quot;Qt6::qh=
elpgenerator&quot;.=C2=A0 It is part of the<br>=C2=A0 Qt6ToolsTools package=
, but the package did not contain the tool.=C2=A0 Make sure<br>=C2=A0 that =
the host module Tools was built with all features enabled (no<span class=3D=
"gmail-im"><br>=C2=A0 explicitly disabled tools).<br>Call Stack (most recen=
t call first):<br>=C2=A0 /home/roy/src/buildroot-qt6-testing/buildroot/outp=
ut/build/qt6base-6.7.0/cmake/QtToolHelpers.cmake:72 (qt_internal_find_tool)=
<br></span>=C2=A0 src/assistant/qhelpgenerator/CMakeLists.txt:9 (qt_interna=
l_add_tool)</div><div>=C2=A0</div><div>I&#39;ll add this to commit message =
05/14, if you want me to create a v6 patch set.<br></div><div><br></div><di=
v></div><span style=3D"font-family:arial,sans-serif"></span></div><div><spa=
n style=3D"font-family:arial,sans-serif">Best Regards,<br></span><pre class=
=3D"gmail-content"><span style=3D"font-family:arial,sans-serif">Roy<br></sp=
an></pre></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">l=C3=B8r. 1. juni 2024 kl. 19:10 skrev Yann E. MORIN &lt;<a=
 href=3D"mailto:yann.morin.1998@free.fr">yann.morin.1998@free.fr</a>&gt;:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Roy, All,<br>
<br>
Thanks for your new iteration of this series.<br>
<br>
I was looking at applying it, but I have a comment about this patch: why<br=
>
is the host qt6base required to have GUI support to build the target<br>
qt6shadertools?<br>
<br>
That&#39;s a question Thomas already asked in a previous iteration:<br>
=C2=A0 =C2=A0 <a href=3D"https://lore.kernel.org/buildroot/20240509164507.4=
682bee8@windsurf/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel=
.org/buildroot/20240509164507.4682bee8@windsurf/</a><br>
<br>
but I could not see an explanation as a reply to Thomas, or in the<br>
following versions of this series.<br>
<br>
Could you provide a little bit of an explanation? For example, does it<br>
need a tool that is provided by qt6base only when the gui module is<br>
enabled? Or something else?<br>
<br>
It does not need to be a long explanation, just a sentence or maybe two;<br=
>
we just need to understand the dependency.<br>
<br>
Same goes for the qt6tols and its dependencies on HOST_QT6BASE_NETWORK<br>
and HOST_QT6BASE_SQL, and other such dependencies.<br>
<br>
Thank you!<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
On 2024-05-31 17:13 +0200, Roy Kollen Svendsen spake thusly:<br>
&gt; Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roy.kollen.sv=
endsen@akersolutions.com" target=3D"_blank">roy.kollen.svendsen@akersolutio=
ns.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes v4 -&gt; v5:<br>
&gt;=C2=A0 =C2=A0- Bump to v6.7.1<br>
&gt; <br>
&gt;=C2=A0 package/qt6/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 package/qt6/qt6shadertools/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 13 +++++++<br>
&gt;=C2=A0 .../qt6/qt6shadertools/qt6shadertools.hash=C2=A0 =C2=A0 | 10 +++=
++<br>
&gt;=C2=A0 package/qt6/qt6shadertools/<a href=3D"http://qt6shadertools.mk" =
rel=3D"noreferrer" target=3D"_blank">qt6shadertools.mk</a>=C2=A0 | 39 +++++=
++++++++++++++<br>
&gt;=C2=A0 4 files changed, 63 insertions(+)<br>
&gt;=C2=A0 create mode 100644 package/qt6/qt6shadertools/Config.in<br>
&gt;=C2=A0 create mode 100644 package/qt6/qt6shadertools/qt6shadertools.has=
h<br>
&gt;=C2=A0 create mode 100644 package/qt6/qt6shadertools/<a href=3D"http://=
qt6shadertools.mk" rel=3D"noreferrer" target=3D"_blank">qt6shadertools.mk</=
a><br>
&gt; <br>
&gt; diff --git a/package/qt6/Config.in b/package/qt6/Config.in<br>
&gt; index 276a0217ab..b7e95a6885 100644<br>
&gt; --- a/package/qt6/Config.in<br>
&gt; +++ b/package/qt6/Config.in<br>
&gt; @@ -47,6 +47,7 @@ source &quot;package/qt6/qt6base/Config.in&quot;<br>
&gt;=C2=A0 source &quot;package/qt6/qt6core5compat/Config.in&quot;<br>
&gt;=C2=A0 source &quot;package/qt6/qt6serialbus/Config.in&quot;<br>
&gt;=C2=A0 source &quot;package/qt6/qt6serialport/Config.in&quot;<br>
&gt; +source &quot;package/qt6/qt6shadertools/Config.in&quot;<br>
&gt;=C2=A0 source &quot;package/qt6/qt6svg/Config.in&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 endif<br>
&gt; diff --git a/package/qt6/qt6shadertools/Config.in b/package/qt6/qt6sha=
dertools/Config.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1b47dc6132<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/qt6/qt6shadertools/Config.in<br>
&gt; @@ -0,0 +1,13 @@<br>
&gt; +config BR2_PACKAGE_QT6SHADERTOOLS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;qt6shadertools&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_QT6BASE_GUI<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6BASE_GUI<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Qt is a cross-platform application and UI =
framework for<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0developers using C++.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0The Qt Shader Tools module builds on the S=
PIR-V Open<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Source Ecosystem as described at the Khron=
os SPIR-V web<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0site.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://doc.qt.io/qt-6/qtshader=
tools-index.html" rel=3D"noreferrer" target=3D"_blank">https://doc.qt.io/qt=
-6/qtshadertools-index.html</a><br>
&gt; diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash b/package/=
qt6/qt6shadertools/qt6shadertools.hash<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..8e80d64851<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/qt6/qt6shadertools/qt6shadertools.hash<br>
&gt; @@ -0,0 +1,10 @@<br>
&gt; +# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6=
.7/6.7.1/submodules/qtshadertools-everywhere-src-6.7.1.tar.xz.sha256" rel=
=3D"noreferrer" target=3D"_blank">https://download.qt.io/official_releases/=
qt/6.7/6.7.1/submodules/qtshadertools-everywhere-src-6.7.1.tar.xz.sha256</a=
><br>
&gt; +sha256=C2=A0 e585e3a985b2e2bad8191a84489a04e69c3defc6022a8e746aad22a1=
f17910c2=C2=A0 qtshadertools-everywhere-src-6.7.1.tar.xz<br>
&gt; +<br>
&gt; +# Hashes for license files:<br>
&gt; +sha256=C2=A0 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb4=
2ed1dcce=C2=A0 LICENSES/BSD-3-Clause.txt<br>
&gt; +sha256=C2=A0 110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef2=
42b206a4=C2=A0 LICENSES/GFDL-1.3-no-invariants-only.txt<br>
&gt; +sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a40401052=
1b880643=C2=A0 LICENSES/GPL-2.0-only.txt<br>
&gt; +sha256=C2=A0 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545=
eb65b903=C2=A0 LICENSES/GPL-3.0-only.txt<br>
&gt; +sha256=C2=A0 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520=
b4464768=C2=A0 LICENSES/LGPL-3.0-only.txt<br>
&gt; +sha256=C2=A0 40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0=
530846b2=C2=A0 LICENSES/Qt-GPL-exception-1.0.txt<br>
&gt; diff --git a/package/qt6/qt6shadertools/<a href=3D"http://qt6shadertoo=
ls.mk" rel=3D"noreferrer" target=3D"_blank">qt6shadertools.mk</a> b/package=
/qt6/qt6shadertools/<a href=3D"http://qt6shadertools.mk" rel=3D"noreferrer"=
 target=3D"_blank">qt6shadertools.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..108f409380<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/qt6/qt6shadertools/<a href=3D"http://qt6shadertools.mk" =
rel=3D"noreferrer" target=3D"_blank">qt6shadertools.mk</a><br>
&gt; @@ -0,0 +1,39 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# qt6shadertools<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
&gt; +<br>
&gt; +QT6SHADERTOOLS_VERSION =3D $(QT6_VERSION)<br>
&gt; +QT6SHADERTOOLS_SITE =3D $(QT6_SITE)<br>
&gt; +QT6SHADERTOOLS_SOURCE =3D qtshadertools-$(QT6_SOURCE_TARBALL_PREFIX)-=
$(QT6SHADERTOOLS_VERSION).tar.xz<br>
&gt; +QT6SHADERTOOLS_INSTALL_STAGING =3D YES<br>
&gt; +QT6SHADERTOOLS_SUPPORTS_IN_SOURCE_BUILD =3D NO<br>
&gt; +<br>
&gt; +QT6SHADERTOOLS_CMAKE_BACKEND =3D ninja<br>
&gt; +<br>
&gt; +QT6SHADERTOOLS_LICENSE =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0GPL-2.0+ or LGPL-3.0, \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0GPL-3.0, GFDL-1.3 no invariants (docs)<br>
&gt; +<br>
&gt; +QT6SHADERTOOLS_LICENSE_FILES =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LICENSES/GPL-2.0-only.txt \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LICENSES/GPL-3.0-only.txt \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LICENSES/LGPL-3.0-only.txt \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LICENSES/GFDL-1.3-no-invariants-only.txt<br>
&gt; +<br>
&gt; +QT6SHADERTOOLS_CONF_OPTS =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DBUILD_WITH_PCH=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DQT_BUILD_EXAMPLES=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DQT_BUILD_TESTS=3DOFF<br>
&gt; +<br>
&gt; +QT6SHADERTOOLS_DEPENDENCIES =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-pkgconf \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0qt6base \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-qt6shadertools<br>
&gt; +<br>
&gt; +HOST_QT6SHADERTOOLS_DEPENDENCIES =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-qt6base<br>
&gt; +<br>
&gt; +$(eval $(cmake-package))<br>
&gt; +$(eval $(host-cmake-package))<br>
&gt; -- <br>
&gt; 2.45.1<br>
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
</blockquote></div>

--0000000000004129b20619dbe816--

--===============2822596996074284005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2822596996074284005==--
