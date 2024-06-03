Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E08C25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 12:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41B3C81ECA;
	Mon,  3 Jun 2024 12:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OckmRvgHSdAe; Mon,  3 Jun 2024 12:24:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 920BD81F16
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 920BD81F16;
	Mon,  3 Jun 2024 12:24:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BDCD21BF3DD
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 12:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A94F9404C6
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 12:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YDq-RIwYup6i for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 12:24:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 239EA4035A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 239EA4035A
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 239EA4035A
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 12:24:47 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-627dfbcf42aso40447107b3.1
 for <buildroot@buildroot.org>; Mon, 03 Jun 2024 05:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717417487; x=1718022287;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9OkJVNyZYZii0wD1wm7o3iA+mhBf4Rs98EIcNG4LA9A=;
 b=Dj0Xr3y9lRAR9CoIoDtxQT7GrSfz0ynvx1Sef9WeXI655mMwnSOYxK7sOPz+H/3hJ8
 nyYNfnw8QFpT6dobkZ0wZrshMrPXbMhH1WY0XTbG52Lwusqlkg3NZ1vLJFhxm5YP5DcL
 ZwNX//qszwZphp/7BFjVIX25XewYmc4J/bFMgwZ76vVb2r43nRyr/Un/mKOFum62fC8p
 Y8143lVcwfw9AHy6dqm8WDvXOg7DT97g0WlEcpaT5WUrzbTXNzjEaDyUzVzb++52cwvd
 tpTb7M9xM6uzesS0d7n83CshP/TzlPhLjSpYrVX37CcQgBMRit62zthVh6yPStI5GM2d
 xWzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqnHBgsyHRV2qk+VHAHkUgY/kK7HC2EL7W262dkhvYQ51HMz9HzL1EitiXFMcMJoU05EuMUxt1jbbfYvZASS69XvzWfMUr7w==
X-Gm-Message-State: AOJu0YzucZ7Zs9azyZMXKR408JGvH4XXtTdNvb+5t0v47eIg/5BpVeea
 +MR7H9V2hjotJIppMD8bYgcJohTs9p8v7Y9eWJmg57LlYsDkFpVbeA4ABJonpidbIoPvGDelRJt
 dFhn8n5K3IwLZtCe0OI6CdgKbA0Y=
X-Google-Smtp-Source: AGHT+IFkET5hPPLLMp/lobMv/vBjB44Ok7IgbvST8v3nSzoIEqQFM2F0ytmXFoAKjadcaVXLIiDp8XCqPXNu1Veb3kc=
X-Received: by 2002:a0d:e447:0:b0:622:c964:7e24 with SMTP id
 00721157ae682-62c7971fe05mr88128197b3.27.1717417486497; Mon, 03 Jun 2024
 05:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240531151325.2443323-1-roy.kollen.svendsen@akersolutions.com>
 <20240531151325.2443323-6-roy.kollen.svendsen@akersolutions.com>
 <ZltV8DAQmGI-vTpe@landeda>
 <CA+R_dequoj35fREbX-Rdi_EKp2x=f2jKLyz5=FpimqZcigb9=w@mail.gmail.com>
 <ZlwsVC6lDaKkKZ1N@landeda>
In-Reply-To: <ZlwsVC6lDaKkKZ1N@landeda>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Mon, 3 Jun 2024 14:24:34 +0200
Message-ID: <CA+R_dep4NQayJSN8kMRRUx+ArSbxf=wRMjU4xw2vsUhWWVLFcw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717417487; x=1718022287; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9OkJVNyZYZii0wD1wm7o3iA+mhBf4Rs98EIcNG4LA9A=;
 b=f9aajOPxB8ZzAKMOY7XUdYigcnzSXBHLzhfQlTpfnREOsu3FAgGoIFonlR3IzaVYbU
 icJ8kits45Hces68aADoB1FmFv5CvtG8fT7yGqX2iHgO2wDuVVAUz/F8hlBzAz2ie1gA
 cWTW78K8YPlMTo5C087L0mJqMxgr09KehuiTf3JCATH4tXrEV8BQ55m+vXq7dnWk3uY3
 ssj7/Sb+Xo2v3QfYlloVlKrPVQi1e+s4+fz7DSenWpfwus9dT6YLToezh16iKP7+6mkn
 RZIcY4XjH+44gzeoMbZnT97tv3p8x9nQ+aSxzBERtc+P18GpIcHWwtoC36MfNe885nNc
 BK+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f9aajOPx
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
Content-Type: multipart/mixed; boundary="===============6430027793679580509=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6430027793679580509==
Content-Type: multipart/alternative; boundary="00000000000036c06a0619fb6b82"

--00000000000036c06a0619fb6b82
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yann,

I made a v6 patch set anyway.

Best Regards,
Roy

s=C3=B8n. 2. juni 2024 kl. 10:25 skrev Yann E. MORIN <yann.morin.1998@free.=
fr>:

> Roy, All,
>
> On 2024-06-02 00:48 +0200, Roy Kollen Svendsen spake thusly:
> > I attempted to explain the host Qt6::Gui dependency in patch 02/14:
> >     The Qt6::Gui module is needed when building the 'Qt Shader Baker'
> (qsb)
> >     host tool. Qsb is needed for converting the Qt6 Vulkan GLSL source
> code to
> >     platform specific shader languages which is then later copied to
> target.
> >     For more details take a look at: [1]https://doc.qt.io/qt-6/
> >     qtshadertools-overview.html and [2]
> https://doc.qt.io/qt-6/qshaderbaker.html
>
> Ah, those explanations should belong to the commit that adds
> qt6shadertools as well, then.
>
> I'll do the duplication when applying (a bit later after coffee has
> kicked in).
>
> > In commit message 03/14 I wrote:
> >     Qt Network is a required dependency of Qt Tools. Therefor we need a
> way to
> >     enable the Qt Network module when building for host.
>
> Ditto.
>
> > In commit message 09/14 I explained why I added an option to enable the
> Testlib
> > feature on host. You seemed to accept this explanation.
>
> Yes.
>
> > I added the blind host option for enabling the Qt Sql module to fix the
> > following build failure:
> >
> > CMake Error at
> /home/roy/src/buildroot-qt6-testing/buildroot/output/build/
> > qt6base-6.7.0/cmake/QtToolHelpers.cmake:684 (message):
> >   Failed to find the host tool "Qt6::qhelpgenerator".  It is part of th=
e
> >   Qt6ToolsTools package, but the package did not contain the tool.  Mak=
e
> sure
> >   that the host module Tools was built with all features enabled (no
> >   explicitly disabled tools).
> > Call Stack (most recent call first):
> >
> /home/roy/src/buildroot-qt6-testing/buildroot/output/build/qt6base-6.7.0/
> > cmake/QtToolHelpers.cmake:72 (qt_internal_find_tool)
> >   src/assistant/qhelpgenerator/CMakeLists.txt:9 (qt_internal_add_tool)
> >
> > I'll add this to commit message 05/14, if you want me to create a v6
> patch set.
>
> No need to resend for now, let's see if I can apply with your additional
> explanations
>
> Thanks!
>
> Regards,
> Yann E. MORIN.
>
> > Best Regards,
> >
> > Roy
> >
> >
> > l=C3=B8r. 1. juni 2024 kl. 19:10 skrev Yann E. MORIN <[3]
> yann.morin.1998@free.fr>:
> >
> >     Roy, All,
> >
> >     Thanks for your new iteration of this series.
> >
> >     I was looking at applying it, but I have a comment about this patch=
:
> why
> >     is the host qt6base required to have GUI support to build the targe=
t
> >     qt6shadertools?
> >
> >     That's a question Thomas already asked in a previous iteration:
> >         [4]
> https://lore.kernel.org/buildroot/20240509164507.4682bee8@windsurf/
> >
> >     but I could not see an explanation as a reply to Thomas, or in the
> >     following versions of this series.
> >
> >     Could you provide a little bit of an explanation? For example, does
> it
> >     need a tool that is provided by qt6base only when the gui module is
> >     enabled? Or something else?
> >
> >     It does not need to be a long explanation, just a sentence or maybe
> two;
> >     we just need to understand the dependency.
> >
> >     Same goes for the qt6tols and its dependencies on
> HOST_QT6BASE_NETWORK
> >     and HOST_QT6BASE_SQL, and other such dependencies.
> >
> >     Thank you!
> >
> >     Regards,
> >     Yann E. MORIN.
> >
> >     On 2024-05-31 17:13 +0200, Roy Kollen Svendsen spake thusly:
> >     > Signed-off-by: Roy Kollen Svendsen <[5]
> >     roy.kollen.svendsen@akersolutions.com>
> >     > ---
> >     > Changes v4 -> v5:
> >     >   - Bump to v6.7.1
> >     >
> >     >  package/qt6/Config.in                         |  1 +
> >     >  package/qt6/qt6shadertools/Config.in          | 13 +++++++
> >     >  .../qt6/qt6shadertools/qt6shadertools.hash    | 10 +++++
> >     >  package/qt6/qt6shadertools/[6]qt6shadertools.mk  | 39
> >     +++++++++++++++++++
> >     >  4 files changed, 63 insertions(+)
> >     >  create mode 100644 package/qt6/qt6shadertools/Config.in
> >     >  create mode 100644 package/qt6/qt6shadertools/qt6shadertools.has=
h
> >     >  create mode 100644 package/qt6/qt6shadertools/[7]
> qt6shadertools.mk
> >     >
> >     > diff --git a/package/qt6/Config.in b/package/qt6/Config.in
> >     > index 276a0217ab..b7e95a6885 100644
> >     > --- a/package/qt6/Config.in
> >     > +++ b/package/qt6/Config.in
> >     > @@ -47,6 +47,7 @@ source "package/qt6/qt6base/Config.in"
> >     >  source "package/qt6/qt6core5compat/Config.in"
> >     >  source "package/qt6/qt6serialbus/Config.in"
> >     >  source "package/qt6/qt6serialport/Config.in"
> >     > +source "package/qt6/qt6shadertools/Config.in"
> >     >  source "package/qt6/qt6svg/Config.in"
> >     >
> >     >  endif
> >     > diff --git a/package/qt6/qt6shadertools/Config.in b/package/qt6/
> >     qt6shadertools/Config.in
> >     > new file mode 100644
> >     > index 0000000000..1b47dc6132
> >     > --- /dev/null
> >     > +++ b/package/qt6/qt6shadertools/Config.in
> >     > @@ -0,0 +1,13 @@
> >     > +config BR2_PACKAGE_QT6SHADERTOOLS
> >     > +     bool "qt6shadertools"
> >     > +     select BR2_PACKAGE_HOST_QT6BASE_GUI
> >     > +     select BR2_PACKAGE_QT6BASE_GUI
> >     > +     help
> >     > +       Qt is a cross-platform application and UI framework for
> >     > +       developers using C++.
> >     > +
> >     > +       The Qt Shader Tools module builds on the SPIR-V Open
> >     > +       Source Ecosystem as described at the Khronos SPIR-V web
> >     > +       site.
> >     > +
> >     > +       [8]https://doc.qt.io/qt-6/qtshadertools-index.html
> >     > diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash
> b/package/qt6
> >     /qt6shadertools/qt6shadertools.hash
> >     > new file mode 100644
> >     > index 0000000000..8e80d64851
> >     > --- /dev/null
> >     > +++ b/package/qt6/qt6shadertools/qt6shadertools.hash
> >     > @@ -0,0 +1,10 @@
> >     > +# Hash from: [9]
> https://download.qt.io/official_releases/qt/6.7/6.7.1/
> >     submodules/qtshadertools-everywhere-src-6.7.1.tar.xz.sha256
> >     > +sha256
> >     e585e3a985b2e2bad8191a84489a04e69c3defc6022a8e746aad22a1f17910c2
> >     qtshadertools-everywhere-src-6.7.1.tar.xz
> >     > +
> >     > +# Hashes for license files:
> >     > +sha256
> >     9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
> LICENSES/
> >     BSD-3-Clause.txt
> >     > +sha256
> >     110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4
> LICENSES/
> >     GFDL-1.3-no-invariants-only.txt
> >     > +sha256
> >     8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> LICENSES/
> >     GPL-2.0-only.txt
> >     > +sha256
> >     8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
> LICENSES/
> >     GPL-3.0-only.txt
> >     > +sha256
> >     da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768
> LICENSES/
> >     LGPL-3.0-only.txt
> >     > +sha256
> >     40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2
> LICENSES/
> >     Qt-GPL-exception-1.0.txt
> >     > diff --git a/package/qt6/qt6shadertools/[10]qt6shadertools.mk
> b/package/
> >     qt6/qt6shadertools/[11]qt6shadertools.mk
> >     > new file mode 100644
> >     > index 0000000000..108f409380
> >     > --- /dev/null
> >     > +++ b/package/qt6/qt6shadertools/[12]qt6shadertools.mk
> >     > @@ -0,0 +1,39 @@
> >     >
> +########################################################################
> >     ########
> >     > +#
> >     > +# qt6shadertools
> >     > +#
> >     >
> +########################################################################
> >     ########
> >     > +
> >     > +QT6SHADERTOOLS_VERSION =3D $(QT6_VERSION)
> >     > +QT6SHADERTOOLS_SITE =3D $(QT6_SITE)
> >     > +QT6SHADERTOOLS_SOURCE =3D
> qtshadertools-$(QT6_SOURCE_TARBALL_PREFIX)-$
> >     (QT6SHADERTOOLS_VERSION).tar.xz
> >     > +QT6SHADERTOOLS_INSTALL_STAGING =3D YES
> >     > +QT6SHADERTOOLS_SUPPORTS_IN_SOURCE_BUILD =3D NO
> >     > +
> >     > +QT6SHADERTOOLS_CMAKE_BACKEND =3D ninja
> >     > +
> >     > +QT6SHADERTOOLS_LICENSE =3D \
> >     > +     GPL-2.0+ or LGPL-3.0, \
> >     > +     GPL-3.0, GFDL-1.3 no invariants (docs)
> >     > +
> >     > +QT6SHADERTOOLS_LICENSE_FILES =3D \
> >     > +     LICENSES/GPL-2.0-only.txt \
> >     > +     LICENSES/GPL-3.0-only.txt \
> >     > +     LICENSES/LGPL-3.0-only.txt \
> >     > +     LICENSES/GFDL-1.3-no-invariants-only.txt
> >     > +
> >     > +QT6SHADERTOOLS_CONF_OPTS =3D \
> >     > +     -DBUILD_WITH_PCH=3DOFF \
> >     > +     -DQT_BUILD_EXAMPLES=3DOFF \
> >     > +     -DQT_BUILD_TESTS=3DOFF
> >     > +
> >     > +QT6SHADERTOOLS_DEPENDENCIES =3D \
> >     > +     host-pkgconf \
> >     > +     qt6base \
> >     > +     host-qt6shadertools
> >     > +
> >     > +HOST_QT6SHADERTOOLS_DEPENDENCIES =3D \
> >     > +     host-qt6base
> >     > +
> >     > +$(eval $(cmake-package))
> >     > +$(eval $(host-cmake-package))
> >     > --
> >     > 2.45.1
> >     >
> >     > _______________________________________________
> >     > buildroot mailing list
> >     > [13]buildroot@buildroot.org
> >     > [14]https://lists.buildroot.org/mailman/listinfo/buildroot
> >
> >     --
> >
>  .-----------------.--------------------.------------------.-------------=
-------.
> >     |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> >     conspiracy: |
> >     | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>
> >        |
> >     | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/
> There is
> >     no  |
> >     | [15]http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
> >      conspiracy.  |
> >     '------------------------------^-------^------------------^
> >     --------------------'
> >
> >
> > References:
> >
> > [1] https://doc.qt.io/qt-6/qtshadertools-overview.html
> > [2] https://doc.qt.io/qt-6/qshaderbaker.html
> > [3] mailto:yann.morin.1998@free.fr
> > [4] https://lore.kernel.org/buildroot/20240509164507.4682bee8@windsurf/
> > [5] mailto:roy.kollen.svendsen@akersolutions.com
> > [6] http://qt6shadertools.mk/
> > [7] http://qt6shadertools.mk/
> > [8] https://doc.qt.io/qt-6/qtshadertools-index.html
> > [9]
> https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtshader=
tools-everywhere-src-6.7.1.tar.xz.sha256
> > [10] http://qt6shadertools.mk/
> > [11] http://qt6shadertools.mk/
> > [12] http://qt6shadertools.mk/
> > [13] mailto:buildroot@buildroot.org
> > [14] https://lists.buildroot.org/mailman/listinfo/buildroot
> > [15] http://ymorin.is-a-geek.org/
>
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
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

--00000000000036c06a0619fb6b82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Yann,</div><div><br></div><div>I made a v6 patch s=
et anyway.<br></div><div><br></div><div>Best Regards,</div><div>Roy<br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">s=C3=B8n. 2. juni 2024 kl. 10:25 skrev Yann E. MORIN &lt;<a href=3D"mailt=
o:yann.morin.1998@free.fr">yann.morin.1998@free.fr</a>&gt;:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Roy, All,<br>
<br>
On 2024-06-02 00:48 +0200, Roy Kollen Svendsen spake thusly:<br>
&gt; I attempted to explain the host Qt6::Gui dependency in patch 02/14:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0The Qt6::Gui module is needed when building the &#3=
9;Qt Shader Baker&#39; (qsb)<br>
&gt;=C2=A0 =C2=A0 =C2=A0host tool. Qsb is needed for converting the Qt6 Vul=
kan GLSL source code to<br>
&gt;=C2=A0 =C2=A0 =C2=A0platform specific shader languages which is then la=
ter copied to target.<br>
&gt;=C2=A0 =C2=A0 =C2=A0For more details take a look at: [1]<a href=3D"http=
s://doc.qt.io/qt-6/" rel=3D"noreferrer" target=3D"_blank">https://doc.qt.io=
/qt-6/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0qtshadertools-overview.html and [2]<a href=3D"https=
://doc.qt.io/qt-6/qshaderbaker.html" rel=3D"noreferrer" target=3D"_blank">h=
ttps://doc.qt.io/qt-6/qshaderbaker.html</a><br>
<br>
Ah, those explanations should belong to the commit that adds<br>
qt6shadertools as well, then.<br>
<br>
I&#39;ll do the duplication when applying (a bit later after coffee has<br>
kicked in).<br>
<br>
&gt; In commit message 03/14 I wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Qt Network is a required dependency of Qt Tools. Th=
erefor we need a way to<br>
&gt;=C2=A0 =C2=A0 =C2=A0enable the Qt Network module when building for host=
.<br>
<br>
Ditto.<br>
<br>
&gt; In commit message 09/14 I explained why I added an option to enable th=
e Testlib<br>
&gt; feature on host. You seemed to accept this explanation.<br>
<br>
Yes.<br>
<br>
&gt; I added the blind host option for enabling the Qt Sql module to fix th=
e<br>
&gt; following build failure:<br>
&gt; <br>
&gt; CMake Error at /home/roy/src/buildroot-qt6-testing/buildroot/output/bu=
ild/<br>
&gt; qt6base-6.7.0/cmake/QtToolHelpers.cmake:684 (message):<br>
&gt; =C2=A0 Failed to find the host tool &quot;Qt6::qhelpgenerator&quot;.=
=C2=A0 It is part of the<br>
&gt; =C2=A0 Qt6ToolsTools package, but the package did not contain the tool=
.=C2=A0 Make sure<br>
&gt; =C2=A0 that the host module Tools was built with all features enabled =
(no<br>
&gt; =C2=A0 explicitly disabled tools).<br>
&gt; Call Stack (most recent call first):<br>
&gt; =C2=A0 /home/roy/src/buildroot-qt6-testing/buildroot/output/build/qt6b=
ase-6.7.0/<br>
&gt; cmake/QtToolHelpers.cmake:72 (qt_internal_find_tool)<br>
&gt; =C2=A0 src/assistant/qhelpgenerator/CMakeLists.txt:9 (qt_internal_add_=
tool)<br>
&gt; =C2=A0<br>
&gt; I&#39;ll add this to commit message 05/14, if you want me to create a =
v6 patch set.<br>
<br>
No need to resend for now, let&#39;s see if I can apply with your additiona=
l<br>
explanations<br>
<br>
Thanks!<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; Best Regards,<br>
&gt; <br>
&gt; Roy<br>
&gt; <br>
&gt; <br>
&gt; l=C3=B8r. 1. juni 2024 kl. 19:10 skrev Yann E. MORIN &lt;[3]<a href=3D=
"mailto:yann.morin.1998@free.fr" target=3D"_blank">yann.morin.1998@free.fr<=
/a>&gt;:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Roy, All,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks for your new iteration of this series.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I was looking at applying it, but I have a comment =
about this patch: why<br>
&gt;=C2=A0 =C2=A0 =C2=A0is the host qt6base required to have GUI support to=
 build the target<br>
&gt;=C2=A0 =C2=A0 =C2=A0qt6shadertools?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0That&#39;s a question Thomas already asked in a pre=
vious iteration:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 [4]<a href=3D"https://lore.kernel.org=
/buildroot/20240509164507.4682bee8@windsurf/" rel=3D"noreferrer" target=3D"=
_blank">https://lore.kernel.org/buildroot/20240509164507.4682bee8@windsurf/=
</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0but I could not see an explanation as a reply to Th=
omas, or in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0following versions of this series.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Could you provide a little bit of an explanation? F=
or example, does it<br>
&gt;=C2=A0 =C2=A0 =C2=A0need a tool that is provided by qt6base only when t=
he gui module is<br>
&gt;=C2=A0 =C2=A0 =C2=A0enabled? Or something else?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0It does not need to be a long explanation, just a s=
entence or maybe two;<br>
&gt;=C2=A0 =C2=A0 =C2=A0we just need to understand the dependency.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Same goes for the qt6tols and its dependencies on H=
OST_QT6BASE_NETWORK<br>
&gt;=C2=A0 =C2=A0 =C2=A0and HOST_QT6BASE_SQL, and other such dependencies.<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thank you!<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Yann E. MORIN.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2024-05-31 17:13 +0200, Roy Kollen Svendsen spak=
e thusly:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Roy Kollen Svendsen &lt;[5]<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:roy.kollen.svendsen@akersolutions=
.com" target=3D"_blank">roy.kollen.svendsen@akersolutions.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Changes v4 -&gt; v5:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0- Bump to v6.7.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 package/qt6/Config.in=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 package/qt6/qt6shadertools/Config.in=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 +++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 .../qt6/qt6shadertools/qt6shadertools.ha=
sh=C2=A0 =C2=A0 | 10 +++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 package/qt6/qt6shadertools/[6]<a href=3D=
"http://qt6shadertools.mk" rel=3D"noreferrer" target=3D"_blank">qt6shaderto=
ols.mk</a>=C2=A0 | 39<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 4 files changed, 63 insertions(+)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 create mode 100644 package/qt6/qt6shader=
tools/Config.in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 create mode 100644 package/qt6/qt6shader=
tools/qt6shadertools.hash<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 create mode 100644 package/qt6/qt6shader=
tools/[7]<a href=3D"http://qt6shadertools.mk" rel=3D"noreferrer" target=3D"=
_blank">qt6shadertools.mk</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/package/qt6/Config.in b/package/q=
t6/Config.in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 276a0217ab..b7e95a6885 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/package/qt6/Config.in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/package/qt6/Config.in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -47,6 +47,7 @@ source &quot;package/qt6/qt6=
base/Config.in&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 source &quot;package/qt6/qt6core5compat/=
Config.in&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 source &quot;package/qt6/qt6serialbus/Co=
nfig.in&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 source &quot;package/qt6/qt6serialport/C=
onfig.in&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +source &quot;package/qt6/qt6shadertools/Confi=
g.in&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 source &quot;package/qt6/qt6svg/Config.i=
n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/package/qt6/qt6shadertools/Config=
.in b/package/qt6/<br>
&gt;=C2=A0 =C2=A0 =C2=A0qt6shadertools/Config.in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 0000000000..1b47dc6132<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/package/qt6/qt6shadertools/Config.in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -0,0 +1,13 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +config BR2_PACKAGE_QT6SHADERTOOLS<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;qt6shadertools=
&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_Q=
T6BASE_GUI<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6BAS=
E_GUI<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Qt is a cross-plat=
form application and UI framework for<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0developers using C=
++.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0The Qt Shader Tool=
s module builds on the SPIR-V Open<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Source Ecosystem a=
s described at the Khronos SPIR-V web<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0site.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[8]<a href=3D"http=
s://doc.qt.io/qt-6/qtshadertools-index.html" rel=3D"noreferrer" target=3D"_=
blank">https://doc.qt.io/qt-6/qtshadertools-index.html</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/package/qt6/qt6shadertools/qt6sha=
dertools.hash b/package/qt6<br>
&gt;=C2=A0 =C2=A0 =C2=A0/qt6shadertools/qt6shadertools.hash<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 0000000000..8e80d64851<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/package/qt6/qt6shadertools/qt6shadertool=
s.hash<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -0,0 +1,10 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# Hash from: [9]<a href=3D"https://download.q=
t.io/official_releases/qt/6.7/6.7.1/" rel=3D"noreferrer" target=3D"_blank">=
https://download.qt.io/official_releases/qt/6.7/6.7.1/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0submodules/qtshadertools-everywhere-src-6.7.1.tar.x=
z.sha256<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +sha256=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0e585e3a985b2e2bad8191a84489a04e69c3defc6022a8e746aa=
d22a1f17910c2=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0qtshadertools-everywhere-src-6.7.1.tar.xz<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# Hashes for license files:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +sha256=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A09f0490f18656c6f2435bd14f603ef0c96434d1825615363dce4=
3abb42ed1dcce=C2=A0 LICENSES/<br>
&gt;=C2=A0 =C2=A0 =C2=A0BSD-3-Clause.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +sha256=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0110535522396708cea37c72a802c5e7e81391139f5f7985631c=
93ef242b206a4=C2=A0 LICENSES/<br>
&gt;=C2=A0 =C2=A0 =C2=A0GFDL-1.3-no-invariants-only.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +sha256=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A08177f97513213526df2cf6184d8ff986c675afb514d4e68a404=
010521b880643=C2=A0 LICENSES/<br>
&gt;=C2=A0 =C2=A0 =C2=A0GPL-2.0-only.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +sha256=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A08ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c=
7c545eb65b903=C2=A0 LICENSES/<br>
&gt;=C2=A0 =C2=A0 =C2=A0GPL-3.0-only.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +sha256=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b0=
37520b4464768=C2=A0 LICENSES/<br>
&gt;=C2=A0 =C2=A0 =C2=A0LGPL-3.0-only.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +sha256=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A040678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c=
462b0530846b2=C2=A0 LICENSES/<br>
&gt;=C2=A0 =C2=A0 =C2=A0Qt-GPL-exception-1.0.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/package/qt6/qt6shadertools/[10]<a=
 href=3D"http://qt6shadertools.mk" rel=3D"noreferrer" target=3D"_blank">qt6=
shadertools.mk</a> b/package/<br>
&gt;=C2=A0 =C2=A0 =C2=A0qt6/qt6shadertools/[11]<a href=3D"http://qt6shadert=
ools.mk" rel=3D"noreferrer" target=3D"_blank">qt6shadertools.mk</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 0000000000..108f409380<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/package/qt6/qt6shadertools/[12]<a href=
=3D"http://qt6shadertools.mk" rel=3D"noreferrer" target=3D"_blank">qt6shade=
rtools.mk</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -0,0 +1,39 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#############################################=
###########################<br>
&gt;=C2=A0 =C2=A0 =C2=A0########<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# qt6shadertools<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#############################################=
###########################<br>
&gt;=C2=A0 =C2=A0 =C2=A0########<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +QT6SHADERTOOLS_VERSION =3D $(QT6_VERSION)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +QT6SHADERTOOLS_SITE =3D $(QT6_SITE)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +QT6SHADERTOOLS_SOURCE =3D qtshadertools-$(QT6=
_SOURCE_TARBALL_PREFIX)-$<br>
&gt;=C2=A0 =C2=A0 =C2=A0(QT6SHADERTOOLS_VERSION).tar.xz<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +QT6SHADERTOOLS_INSTALL_STAGING =3D YES<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +QT6SHADERTOOLS_SUPPORTS_IN_SOURCE_BUILD =3D N=
O<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +QT6SHADERTOOLS_CMAKE_BACKEND =3D ninja<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +QT6SHADERTOOLS_LICENSE =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0GPL-2.0+ or LGPL-3.0, \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0GPL-3.0, GFDL-1.3 no inva=
riants (docs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +QT6SHADERTOOLS_LICENSE_FILES =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0LICENSES/GPL-2.0-only.txt=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0LICENSES/GPL-3.0-only.txt=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0LICENSES/LGPL-3.0-only.tx=
t \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0LICENSES/GFDL-1.3-no-inva=
riants-only.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +QT6SHADERTOOLS_CONF_OPTS =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0-DBUILD_WITH_PCH=3DOFF \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0-DQT_BUILD_EXAMPLES=3DOFF=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0-DQT_BUILD_TESTS=3DOFF<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +QT6SHADERTOOLS_DEPENDENCIES =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0host-pkgconf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0qt6base \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0host-qt6shadertools<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +HOST_QT6SHADERTOOLS_DEPENDENCIES =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0host-qt6base<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +$(eval $(cmake-package))<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +$(eval $(host-cmake-package))<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 2.45.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ______________________________________________=
_<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; buildroot mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [13]<a href=3D"mailto:buildroot@buildroot.org"=
 target=3D"_blank">buildroot@buildroot.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [14]<a href=3D"https://lists.buildroot.org/mai=
lman/listinfo/buildroot" rel=3D"noreferrer" target=3D"_blank">https://lists=
.buildroot.org/mailman/listinfo/buildroot</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0.-----------------.--------------------.-----------=
-------.--------------------.<br>
&gt;=C2=A0 =C2=A0 =C2=A0|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | =
/&quot;\ ASCII RIBBON | Erics&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0conspiracy: |<br>
&gt;=C2=A0 =C2=A0 =C2=A0| +33 662 376 056 | Software=C2=A0 Designer | \ / C=
AMPAIGN=C2=A0 =C2=A0 =C2=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0| +33 561 099 427 `------------.-------:=C2=A0 X=C2=
=A0 AGAINST=C2=A0 =C2=A0 =C2=A0 |=C2=A0 \e/=C2=A0 There is<br>
&gt;=C2=A0 =C2=A0 =C2=A0no=C2=A0 |<br>
&gt;=C2=A0 =C2=A0 =C2=A0| [15]<a href=3D"http://ymorin.is-a-geek.org/" rel=
=3D"noreferrer" target=3D"_blank">http://ymorin.is-a-geek.org/</a> | _/*\_ =
| / \ HTML MAIL=C2=A0 =C2=A0 |=C2=A0 =C2=A0v=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0conspiracy.=C2=A0 |<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;------------------------------^-------^-------=
-----------^<br>
&gt;=C2=A0 =C2=A0 =C2=A0--------------------&#39;<br>
&gt; <br>
&gt; <br>
&gt; References:<br>
&gt; <br>
&gt; [1] <a href=3D"https://doc.qt.io/qt-6/qtshadertools-overview.html" rel=
=3D"noreferrer" target=3D"_blank">https://doc.qt.io/qt-6/qtshadertools-over=
view.html</a><br>
&gt; [2] <a href=3D"https://doc.qt.io/qt-6/qshaderbaker.html" rel=3D"norefe=
rrer" target=3D"_blank">https://doc.qt.io/qt-6/qshaderbaker.html</a><br>
&gt; [3] mailto:<a href=3D"mailto:yann.morin.1998@free.fr" target=3D"_blank=
">yann.morin.1998@free.fr</a><br>
&gt; [4] <a href=3D"https://lore.kernel.org/buildroot/20240509164507.4682be=
e8@windsurf/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/=
buildroot/20240509164507.4682bee8@windsurf/</a><br>
&gt; [5] mailto:<a href=3D"mailto:roy.kollen.svendsen@akersolutions.com" ta=
rget=3D"_blank">roy.kollen.svendsen@akersolutions.com</a><br>
&gt; [6] <a href=3D"http://qt6shadertools.mk/" rel=3D"noreferrer" target=3D=
"_blank">http://qt6shadertools.mk/</a><br>
&gt; [7] <a href=3D"http://qt6shadertools.mk/" rel=3D"noreferrer" target=3D=
"_blank">http://qt6shadertools.mk/</a><br>
&gt; [8] <a href=3D"https://doc.qt.io/qt-6/qtshadertools-index.html" rel=3D=
"noreferrer" target=3D"_blank">https://doc.qt.io/qt-6/qtshadertools-index.h=
tml</a><br>
&gt; [9] <a href=3D"https://download.qt.io/official_releases/qt/6.7/6.7.1/s=
ubmodules/qtshadertools-everywhere-src-6.7.1.tar.xz.sha256" rel=3D"noreferr=
er" target=3D"_blank">https://download.qt.io/official_releases/qt/6.7/6.7.1=
/submodules/qtshadertools-everywhere-src-6.7.1.tar.xz.sha256</a><br>
&gt; [10] <a href=3D"http://qt6shadertools.mk/" rel=3D"noreferrer" target=
=3D"_blank">http://qt6shadertools.mk/</a><br>
&gt; [11] <a href=3D"http://qt6shadertools.mk/" rel=3D"noreferrer" target=
=3D"_blank">http://qt6shadertools.mk/</a><br>
&gt; [12] <a href=3D"http://qt6shadertools.mk/" rel=3D"noreferrer" target=
=3D"_blank">http://qt6shadertools.mk/</a><br>
&gt; [13] mailto:<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blan=
k">buildroot@buildroot.org</a><br>
&gt; [14] <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot=
" rel=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/=
listinfo/buildroot</a><br>
&gt; [15] <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" targe=
t=3D"_blank">http://ymorin.is-a-geek.org/</a><br>
<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
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

--00000000000036c06a0619fb6b82--

--===============6430027793679580509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6430027793679580509==--
