Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301BAC25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 09:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC6FB403C0;
	Mon,  3 Jun 2024 09:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WsZ80oPHuVAP; Mon,  3 Jun 2024 09:25:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F1A940533
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F1A940533;
	Mon,  3 Jun 2024 09:25:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD03A1BF3EB
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9624812F3
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxpv1Oc-RTQM for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 09:25:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 68449812ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68449812ED
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68449812ED
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 09:25:06 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-62a087c3a92so37628687b3.2
 for <buildroot@buildroot.org>; Mon, 03 Jun 2024 02:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717406705; x=1718011505;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hXTerqA3C4/Dz2cxU8DfvdNdoetNElGPcuN9jGa7qk4=;
 b=QsC6BlLX5WMQVVUqafmNFbXTX+dRlzTzyMH8Auc8MkRbZMNusaAvuLq/B+PbZ+C4wz
 X2WDbEJLkEWAg+0N1+kr8xUfx/P1gaHt4swS99U0M4KD9X2ylEwLDYa5cJqtLfb6EjiJ
 nX1LZ8n7SxlVkUj2AmAfksrGnLToJghdLVh9I4R5YTEj4rs6V/GvItGEJiSPv9C74dcQ
 Vu1CjKPLD3B5jxjQ4OkMauyDHO0cqmUE8YeEMlvrK5zbW3JTpEqGpuFnqbeZKk+TJWoM
 ROo1AjutA2qve9dJBfipzIimpn/2x/YIpy+gkdt7u76eJzHSG7SuqNGtuZUxjnS8gezI
 TUlw==
X-Gm-Message-State: AOJu0Yx2OXm2qsfzVqdXsb3F8oWST92J0UEgLx8QJsshagEOXWDbqyoN
 QU/yi1XnZjAAswM4acthsrpogWWkhre3xiFFcjoQWaRNx+3YfckcnRJwX2ibP+vPV8Sht7dfJbq
 Qqo7EkuEo7HVH6HZmceHCtQ64wQ5W1T/K
X-Google-Smtp-Source: AGHT+IGbZn1hIv1jTM1vOj1KyXjUSOnxLagRkEexHWCv5mjogxfwcmW3bGyjK2XH8DaN7Dz+JX899N0KDkHzgAoRXwA=
X-Received: by 2002:a81:60c1:0:b0:618:6aa1:a972 with SMTP id
 00721157ae682-62c79625c28mr82477257b3.5.1717406704681; Mon, 03 Jun 2024
 02:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240531151325.2443323-1-roy.kollen.svendsen@akersolutions.com>
 <20240531151325.2443323-9-roy.kollen.svendsen@akersolutions.com>
 <ZltXHCyhxx8XkbTm@landeda>
 <CA+R_deouN7hKSnkNn0Fo9GiMMbFZxXKOf=W0dZFxocT-gj9qMA@mail.gmail.com>
In-Reply-To: <CA+R_deouN7hKSnkNn0Fo9GiMMbFZxXKOf=W0dZFxocT-gj9qMA@mail.gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Mon, 3 Jun 2024 11:24:51 +0200
Message-ID: <CA+R_depNxKwN2X-d2h47TzrSkxeXK1UU0TVjoptSvHwS8-hVZg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717406705; x=1718011505; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hXTerqA3C4/Dz2cxU8DfvdNdoetNElGPcuN9jGa7qk4=;
 b=h2lVkD8g8hxrO7xHypVeoCmhojoTazsKJ3j4VsOMNYkjHSki7K9DzPs8Hv4BByQFDv
 9E3FkuqPFCkUZ69cxOTJgPVbzsio0gG9VhzPRLmKtX0ejYsx8j60ALdaqBm+olCF5gCy
 o2njdUl5r/5Co0KMpm3fJRu70Jj5m1zPMlARi/R9B6LXfJSs/5yd2qszfwfdfF5rvsK7
 +2siWPS+bM+FAMAN6UnMTS7UKE9nFY+nr4xnulcYzC4KeFME/ZB8ZDQYVgxomgcSHhJw
 BHgcT1ZuwSpQ+dpVEP6SY3d6xim4hSJMbe0IkSRgG6HSpWyUC5JHYaKd4wCjJ8tC1vBt
 9eXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h2lVkD8g
Subject: Re: [Buildroot] [PATCH v5 09/14] package/qt6/qt6declarative: new
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
Content-Type: multipart/mixed; boundary="===============1819951078262255171=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1819951078262255171==
Content-Type: multipart/alternative; boundary="000000000000915b630619f8e82b"

--000000000000915b630619f8e82b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yann,

I've rebuilt with all Qt6 packages and features enabled but with the blind
host options set to OFF to recreate the error messages.

I will try to extract the essential parts of these and add to commit
messages for both qt6base and the dependent packages.

I'm also tracing the host tool dependencies in Qt6' cmake files to try to
formulate some better explanations.

Currently I've added some comments to the blind host options in qt6base.mk.
Any comments on the following?:

# We need host-qt6base with Gui support when building host-qt6shadertools,
# otherwise the build is skipped and no qsb host tool is generated.
# qt6shadertools fail to build if qsb is not available. qsb is also require=
d
# when building host-qt6declarative with Quick support, which is necessary
for
# the qmltime host tool to be built. qt6declarative fails to build if
qmltime is
# not available. Gui support is also required when building Svg support and
# thereby the svgtoqml host tool. qt6declarative will also fail to build if
# svgtoqml is not available.
ifeq ($(BR2_PACKAGE_HOST_QT6BASE_GUI),y)
HOST_QT6BASE_CONF_OPTS +=3D -DFEATURE_gui=3DON
else
HOST_QT6BASE_CONF_OPTS +=3D -DFEATURE_gui=3DOFF
endif

ifeq ($(BR2_PACKAGE_HOST_QT6BASE_NETWORK),y)
HOST_QT6BASE_CONF_OPTS +=3D -DFEATURE_network=3DOFF
else
HOST_QT6BASE_CONF_OPTS +=3D -DFEATURE_network=3DOFF
endif

ifeq ($(BR2_PACKAGE_HOST_QT6BASE_SQL),y)
HOST_QT6BASE_CONF_OPTS +=3D -DFEATURE_sql=3DOFF
else
HOST_QT6BASE_CONF_OPTS +=3D -DFEATURE_sql=3DOFF
endif

# We need host-qt6base with Testlib support when building
host-qt6declarative,
# with QuickTest support. QuickTest support is further required for
building the
# qmltestrunner host tool. qt6declarative will fail to build if
qmltestrunner is
# not available.
ifeq ($(BR2_PACKAGE_HOST_QT6BASE_TEST),y)
HOST_QT6BASE_CONF_OPTS +=3D -DFEATURE_testlib=3DON
else
HOST_QT6BASE_CONF_OPTS +=3D -DFEATURE_testlib=3DOFF
endif

Best Regards,
Roy

s=C3=B8n. 2. juni 2024 kl. 10:03 skrev Roy Kollen Svendsen <
roykollensvendsen@gmail.com>:

> Hi Yann,
>
> Ok, thanks for your feedback. I'll try to follow the same pattern for all
> commit messages for new packages requiring new blind host options. I will
> try to make the exlanations less verbose, move the explanations to the
> commits which apply the blind host options and add an explanation for Qt
> Tools selecting Qt::Sql.
>
> I'll probably try to rebuild the packages without the blind host options
> enabled, to get the error messages. And add those (in a more compact form=
)
> + maybe some explanation by referencing relevant lines in the Qt
> buildsystem.
>
> Best Regards
> Roy
>
> l=C3=B8r. 1. jun. 2024, 19:15 skrev Yann E. MORIN <yann.morin.1998@free.f=
r>:
>
>> Roy, All,
>>
>> On 2024-05-31 17:13 +0200, Roy Kollen Svendsen spake thusly:
>> > We add the patch to avoid checking for FEATURE_ssl when FEATURE_networ=
k
>> > is not available. FEATURE_ssl is defined by the Qt Network module. So
>> > we will get the following build failure if the patch is not applied an=
d
>> > FEATURE_network=3DON:
>> >
>> > CMake Error at qt6base-6.7.0/cmake/QtFeature.cmake:376 (message):
>> >   Attempting to evaluate feature ssl but its definition is missing.
>> Either
>> >   the feature does not exist or a dependency to the module that define=
s
>> it is
>> >   missing
>> > Call Stack (most recent call first):
>> >   qt6base-6.7.0/cmake/QtFeature.cmake:141 (qt_evaluate_feature)
>> >   qt6base-6.7.0/cmake/QtFeature.cmake:180
>> (qt_internal_evaluate_config_expression)
>> >   qt6base-6.7.0/cmake/QtFeature.cmake:396
>> (qt_evaluate_config_expression)
>> >   qt6base-6.7.0/cmake/QtFeature.cmake:711 (qt_evaluate_feature)
>> >   qt6base-6.7.0/cmake/QtFeature.cmake:680 (qt_feature_module_end)
>> >   src/qml/CMakeLists.txt:13 (qt_feature_evaluate_features)
>> >
>> > To avoid the following build error, we also make sure the host qt6base
>> is
>> > built with Testlib enabled:
>> >
>> > CMake Error at
>> buildroot/output/build/qt6base-6.7.0/cmake/QtToolHelpers.cmake:684
>> (message):
>> >   Failed to find the host tool "Qt6::qmltestrunner".  It is part of th=
e
>>
>> This is the kind of explanation (even if a bit verbose) that we indeed
>> need for the requirement on the host qt6base having some modules
>> enabled. If you can provide that for the other packages, that would be
>> awesome!
>>
>> Regards,
>> Yann E. MORIN.
>>
>> >   Qt6QmlTools package, but the package did not contain the tool.  Make
>> sure
>> >   that the host module Qml was built with all features enabled (no
>> explicitly
>> >   disabled tools).
>> > Call Stack (most recent call first):
>> >   buildroot/output/build/qt6base-6.7.0/cmake/QtToolHelpers.cmake:72
>> (qt_internal_find_tool)
>> >   tools/qmltestrunner/CMakeLists.txt:11 (qt_internal_add_tool)
>> >
>> > Signed-off-by: Roy Kollen Svendsen <
>> roy.kollen.svendsen@akersolutions.com>
>> > ---
>> > Changes v4 -> v5:
>> >   - Bump to v6.7.1
>> >
>> >  package/qt6/Config.in                         |  1 +
>> >  ...1-Fix-build-with--no-feature-network.patch | 28 ++++++++++
>> >  package/qt6/qt6declarative/Config.in          | 24 ++++++++
>> >  .../qt6/qt6declarative/qt6declarative.hash    | 11 ++++
>> >  package/qt6/qt6declarative/qt6declarative.mk  | 56 ++++++++++++++++++=
+
>> >  5 files changed, 120 insertions(+)
>> >  create mode 100644
>> package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.patch
>> >  create mode 100644 package/qt6/qt6declarative/Config.in
>> >  create mode 100644 package/qt6/qt6declarative/qt6declarative.hash
>> >  create mode 100644 package/qt6/qt6declarative/qt6declarative.mk
>> >
>> > diff --git a/package/qt6/Config.in b/package/qt6/Config.in
>> > index 81682af476..625134d281 100644
>> > --- a/package/qt6/Config.in
>> > +++ b/package/qt6/Config.in
>> > @@ -45,6 +45,7 @@ if BR2_PACKAGE_QT6
>> >
>> >  source "package/qt6/qt6base/Config.in"
>> >  source "package/qt6/qt6core5compat/Config.in"
>> > +source "package/qt6/qt6declarative/Config.in"
>> >  source "package/qt6/qt6languageserver/Config.in"
>> >  source "package/qt6/qt6serialbus/Config.in"
>> >  source "package/qt6/qt6serialport/Config.in"
>> > diff --git
>> a/package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.pat=
ch
>> b/package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.pat=
ch
>> > new file mode 100644
>> > index 0000000000..bef5794229
>> > --- /dev/null
>> > +++
>> b/package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.pat=
ch
>> > @@ -0,0 +1,28 @@
>> > +From 8377691a0998fd84e6fc8349a5db450bf2d79164 Mon Sep 17 00:00:00 200=
1
>> > +From: Tasuku Suzuki <tasuku.suzuki@signal-slot.co.jp>
>> > +Date: Tue, 21 Nov 2023 23:58:43 +0900
>> > +Subject: Fix build with -no-feature-network
>> > +
>> > +Change-Id: Ib21012301da6afb5458f707b39a9a8079d93eb93
>> > +Reviewed-by: Ulf Hermann <ulf.hermann@qt.io>
>> > +Upstream:
>> https://code.qt.io/cgit/qt/qtdeclarative.git/commit/?id=3D8377691a0998fd=
84e6fc8349a5db450bf2d79164
>> > +Signed-off-by: Roy Kollen Svendsen <
>> roy.kollen.svendsen@akersolutions.com>
>> > +---
>> > + src/qml/configure.cmake | 2 +-
>> > + 1 file changed, 1 insertion(+), 1 deletion(-)
>> > +
>> > +diff --git a/src/qml/configure.cmake b/src/qml/configure.cmake
>> > +index 2d0434643a..d1ff90bd54 100644
>> > +--- a/src/qml/configure.cmake
>> > ++++ b/src/qml/configure.cmake
>> > +@@ -82,7 +82,7 @@ qt_feature("qml-ssl" PUBLIC
>> > +     SECTION "QML"
>> > +     LABEL "QML SSL support"
>> > +     PURPOSE "Provides ssl support in QML."
>> > +-    CONDITION QT_FEATURE_ssl
>> > ++    CONDITION QT_FEATURE_qml_network AND QT_FEATURE_ssl
>> > + )
>> > +
>> > + # On arm and arm64 we need a specialization of cacheFlush() for each
>> OS to be
>> > +--
>> > +cgit v1.2.3
>> > diff --git a/package/qt6/qt6declarative/Config.in
>> b/package/qt6/qt6declarative/Config.in
>> > new file mode 100644
>> > index 0000000000..1daa645413
>> > --- /dev/null
>> > +++ b/package/qt6/qt6declarative/Config.in
>> > @@ -0,0 +1,24 @@
>> > +config BR2_PACKAGE_QT6DECLARATIVE
>> > +     bool "qt6declarative"
>> > +     # Enable host test module to ensure that qmltestrunner is built
>> > +     select BR2_PACKAGE_HOST_QT6BASE_TEST if BR2_PACKAGE_QT6BASE_TEST
>> > +     help
>> > +       Qt is a cross-platform application and UI framework for
>> > +       developers using C++.
>> > +
>> > +       This package corresponds to the qt6declarative module.
>> > +
>> > +       https://doc.qt.io/qt-6/qtdeclarative-index.html
>> > +
>> > +if BR2_PACKAGE_QT6DECLARATIVE
>> > +
>> > +config BR2_PACKAGE_QT6DECLARATIVE_QUICK
>> > +     bool "quick module"
>> > +     select BR2_PACKAGE_QT6BASE_GUI
>> > +     select BR2_PACKAGE_QT6LANGUAGESERVER
>> > +     select BR2_PACKAGE_QT6SHADERTOOLS
>> > +     select BR2_PACKAGE_QT6BASE_OPENGL if BR2_PACKAGE_QT6_GL_SUPPORTS
>> > +     select BR2_PACKAGE_HOST_QT6SVG
>> > +     select BR2_PACKAGE_HOST_QT6DECLARATIVE
>> > +
>> > +endif
>> > diff --git a/package/qt6/qt6declarative/qt6declarative.hash
>> b/package/qt6/qt6declarative/qt6declarative.hash
>> > new file mode 100644
>> > index 0000000000..480e3805ca
>> > --- /dev/null
>> > +++ b/package/qt6/qt6declarative/qt6declarative.hash
>> > @@ -0,0 +1,11 @@
>> > +# Hash from:
>> https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtdecla=
rative-everywhere-src-6.7.1.tar.xz.sha256
>> > +sha256
>> 81135c96ed2f599385b8a68c57f4f438dad193c62f946f5b200a321558fd9f1c
>> qtdeclarative-everywhere-src-6.7.1.tar.xz
>> > +
>> > +# Hashes for license files:
>> > +sha256
>> 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
>> LICENSES/BSD-3-Clause.txt
>> > +sha256
>> 110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4
>> LICENSES/GFDL-1.3-no-invariants-only.txt
>> > +sha256
>> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
>> LICENSES/GPL-2.0-only.txt
>> > +sha256
>> 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
>> LICENSES/GPL-3.0-only.txt
>> > +sha256
>> da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768
>> LICENSES/LGPL-3.0-only.txt
>> > +sha256
>> 9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700
>> LICENSES/LicenseRef-Qt-Commercial.txt
>> > +sha256
>> 40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2
>> LICENSES/Qt-GPL-exception-1.0.txt
>> > diff --git a/package/qt6/qt6declarative/qt6declarative.mk
>> b/package/qt6/qt6declarative/qt6declarative.mk
>> > new file mode 100644
>> > index 0000000000..2348ff2dae
>> > --- /dev/null
>> > +++ b/package/qt6/qt6declarative/qt6declarative.mk
>> > @@ -0,0 +1,56 @@
>> >
>> +#######################################################################=
#########
>> > +#
>> > +# qt6declaratve
>> > +#
>> >
>> +#######################################################################=
#########
>> > +
>> > +QT6DECLARATIVE_VERSION =3D $(QT6_VERSION)
>> > +QT6DECLARATIVE_SITE =3D $(QT6_SITE)
>> > +QT6DECLARATIVE_SOURCE =3D
>> qtdeclarative-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6DECLARATIVE_VERSION).tar=
.xz
>> > +QT6DECLARATIVE_INSTALL_STAGING =3D YES
>> > +
>> > +QT6DECLARATIVE_SUPPORTS_IN_SOURCE_BUILD =3D NO
>> > +
>> > +QT6DECLARATIVE_CMAKE_BACKEND =3D ninja
>> > +
>> > +QT6DECLARATIVE_LICENSE =3D \
>> > +     GPL-2.0+ or LGPL-3.0, \
>> > +     GPL-3.0, GFDL-1.3 no invariants (docs)
>> > +
>> > +QT6DECLARATIVE_LICENSE_FILES =3D \
>> > +     LICENSES/GPL-2.0-only.txt \
>> > +     LICENSES/GPL-3.0-only.txt \
>> > +     LICENSES/LGPL-3.0-only.txt \
>> > +     LICENSES/GFDL-1.3-no-invariants-only.txt
>> > +
>> > +QT6DECLARATIVE_CONF_OPTS =3D \
>> > +     -DQT_FEATURE_qml_profiler=3DOFF \
>> > +     -DQT_HOST_PATH=3D$(HOST_DIR) \
>> > +     -DBUILD_WITH_PCH=3DOFF \
>> > +     -DQT_BUILD_EXAMPLES=3DOFF \
>> > +     -DQT_BUILD_TESTS=3DOFF
>> > +
>> > +HOST_QT6DECLARATIVE_CONF_OPTS =3D \
>> > +     -DQT_HOST_PATH=3D$(HOST_DIR) \
>> > +     -DBUILD_WITH_PCH=3DOFF \
>> > +     -DQT_BUILD_EXAMPLES=3DOFF \
>> > +     -DQT_BUILD_TESTS=3DOFF \
>> > +     -DQT_FEATURE_ssl=3DOFF
>> > +
>> > +QT6DECLARATIVE_DEPENDENCIES =3D \
>> > +     host-qt6base \
>> > +     host-qt6svg \
>> > +     host-qt6shadertools \
>> > +     host-qt6declarative \
>> > +     qt6base \
>> > +     qt6shadertools \
>> > +     qt6languageserver \
>> > +     qt6svg
>> > +
>> > +HOST_QT6DECLARATIVE_DEPENDENCIES =3D \
>> > +     host-qt6base \
>> > +     host-qt6svg \
>> > +     host-qt6shadertools
>> > +
>> > +$(eval $(cmake-package))
>> > +$(eval $(host-cmake-package))
>> > --
>> > 2.45.1
>> >
>> > _______________________________________________
>> > buildroot mailing list
>> > buildroot@buildroot.org
>> > https://lists.buildroot.org/mailman/listinfo/buildroot
>>
>> --
>>
>> .-----------------.--------------------.------------------.-------------=
-------.
>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
>> conspiracy: |
>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>>      |
>> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There
>> is no  |
>> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>>  conspiracy.  |
>>
>> '------------------------------^-------^------------------^-------------=
-------'
>>
>

--000000000000915b630619f8e82b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Yann,</div><div><br></div>I&#39;ve rebuilt with al=
l Qt6 packages and features enabled but with=20
the blind host options set to OFF to recreate the error messages.<div><div>=
<br></div><div>I will try to extract the essential parts of these and add t=
o commit messages for both qt6base and the dependent packages.<br></div><di=
v><br></div><div>I&#39;m also tracing the host tool dependencies in Qt6&#39=
; cmake files to try to formulate some better explanations.</div><div><br><=
/div><div>Currently I&#39;ve added some comments to the blind host options =
in <a href=3D"http://qt6base.mk">qt6base.mk</a>. Any comments on the follow=
ing?:<br></div></div><div><br></div><div># We need host-qt6base with Gui su=
pport when building host-qt6shadertools,<br># otherwise the build is skippe=
d and no qsb host tool is generated. <br># qt6shadertools fail to build if =
qsb is not available. qsb is also required<br># when building host-qt6decla=
rative with Quick support, which is necessary for<br># the qmltime host too=
l to be built. qt6declarative fails to build if qmltime is<br># not availab=
le. Gui support is also required when building Svg support and<br># thereby=
 the svgtoqml host tool. qt6declarative will also fail to build if<br># svg=
toqml is not available.<br>ifeq ($(BR2_PACKAGE_HOST_QT6BASE_GUI),y)<br>HOST=
_QT6BASE_CONF_OPTS +=3D -DFEATURE_gui=3DON<br>else<br>HOST_QT6BASE_CONF_OPT=
S +=3D -DFEATURE_gui=3DOFF<br>endif<br><br>ifeq ($(BR2_PACKAGE_HOST_QT6BASE=
_NETWORK),y)<br>HOST_QT6BASE_CONF_OPTS +=3D -DFEATURE_network=3DOFF<br>else=
<br>HOST_QT6BASE_CONF_OPTS +=3D -DFEATURE_network=3DOFF<br>endif<br><br>ife=
q ($(BR2_PACKAGE_HOST_QT6BASE_SQL),y)<br>HOST_QT6BASE_CONF_OPTS +=3D -DFEAT=
URE_sql=3DOFF<br>else<br>HOST_QT6BASE_CONF_OPTS +=3D -DFEATURE_sql=3DOFF<br=
>endif<br><br># We need host-qt6base with Testlib support when building hos=
t-qt6declarative,<br># with QuickTest support. QuickTest support is further=
 required for building the<br># qmltestrunner host tool. qt6declarative wil=
l fail to build if qmltestrunner is<br># not available. =C2=A0<br>ifeq ($(B=
R2_PACKAGE_HOST_QT6BASE_TEST),y)<br>HOST_QT6BASE_CONF_OPTS +=3D -DFEATURE_t=
estlib=3DON<br>else<br>HOST_QT6BASE_CONF_OPTS +=3D -DFEATURE_testlib=3DOFF<=
br>endif</div><div><br></div><div>Best Regards,</div><div>Roy<br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">s=C3=
=B8n. 2. juni 2024 kl. 10:03 skrev Roy Kollen Svendsen &lt;<a href=3D"mailt=
o:roykollensvendsen@gmail.com">roykollensvendsen@gmail.com</a>&gt;:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto">Hi Ya=
nn,<div dir=3D"auto"><br></div><div dir=3D"auto">Ok, thanks for your feedba=
ck. I&#39;ll try to follow the same pattern for all commit messages for new=
 packages requiring new blind host options. I will try to make the exlanati=
ons less verbose, move the explanations to the commits which apply the blin=
d host options and add an explanation for Qt Tools selecting Qt::Sql.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll probably try to rebu=
ild the packages without the blind host options enabled, to get the error m=
essages. And add those (in a more compact form) + maybe some explanation by=
 referencing relevant lines in the Qt buildsystem.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Best Regards</div><div dir=3D"auto">Roy</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">l=
=C3=B8r. 1. jun. 2024, 19:15 skrev Yann E. MORIN &lt;<a href=3D"mailto:yann=
.morin.1998@free.fr" target=3D"_blank">yann.morin.1998@free.fr</a>&gt;:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Roy, All,<br>
<br>
On 2024-05-31 17:13 +0200, Roy Kollen Svendsen spake thusly:<br>
&gt; We add the patch to avoid checking for FEATURE_ssl when FEATURE_networ=
k<br>
&gt; is not available. FEATURE_ssl is defined by the Qt Network module. So<=
br>
&gt; we will get the following build failure if the patch is not applied an=
d<br>
&gt; FEATURE_network=3DON:<br>
&gt; <br>
&gt; CMake Error at qt6base-6.7.0/cmake/QtFeature.cmake:376 (message):<br>
&gt;=C2=A0 =C2=A0Attempting to evaluate feature ssl but its definition is m=
issing.=C2=A0 Either<br>
&gt;=C2=A0 =C2=A0the feature does not exist or a dependency to the module t=
hat defines it is<br>
&gt;=C2=A0 =C2=A0missing<br>
&gt; Call Stack (most recent call first):<br>
&gt;=C2=A0 =C2=A0qt6base-6.7.0/cmake/QtFeature.cmake:141 (qt_evaluate_featu=
re)<br>
&gt;=C2=A0 =C2=A0qt6base-6.7.0/cmake/QtFeature.cmake:180 (qt_internal_evalu=
ate_config_expression)<br>
&gt;=C2=A0 =C2=A0qt6base-6.7.0/cmake/QtFeature.cmake:396 (qt_evaluate_confi=
g_expression)<br>
&gt;=C2=A0 =C2=A0qt6base-6.7.0/cmake/QtFeature.cmake:711 (qt_evaluate_featu=
re)<br>
&gt;=C2=A0 =C2=A0qt6base-6.7.0/cmake/QtFeature.cmake:680 (qt_feature_module=
_end)<br>
&gt;=C2=A0 =C2=A0src/qml/CMakeLists.txt:13 (qt_feature_evaluate_features)<b=
r>
&gt; <br>
&gt; To avoid the following build error, we also make sure the host qt6base=
 is<br>
&gt; built with Testlib enabled:<br>
&gt; <br>
&gt; CMake Error at buildroot/output/build/qt6base-6.7.0/cmake/QtToolHelper=
s.cmake:684 (message):<br>
&gt;=C2=A0 =C2=A0Failed to find the host tool &quot;Qt6::qmltestrunner&quot=
;.=C2=A0 It is part of the<br>
<br>
This is the kind of explanation (even if a bit verbose) that we indeed<br>
need for the requirement on the host qt6base having some modules<br>
enabled. If you can provide that for the other packages, that would be<br>
awesome!<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt;=C2=A0 =C2=A0Qt6QmlTools package, but the package did not contain the t=
ool.=C2=A0 Make sure<br>
&gt;=C2=A0 =C2=A0that the host module Qml was built with all features enabl=
ed (no explicitly<br>
&gt;=C2=A0 =C2=A0disabled tools).<br>
&gt; Call Stack (most recent call first):<br>
&gt;=C2=A0 =C2=A0buildroot/output/build/qt6base-6.7.0/cmake/QtToolHelpers.c=
make:72 (qt_internal_find_tool)<br>
&gt;=C2=A0 =C2=A0tools/qmltestrunner/CMakeLists.txt:11 (qt_internal_add_too=
l)<br>
&gt; <br>
&gt; Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roy.kollen.sv=
endsen@akersolutions.com" rel=3D"noreferrer" target=3D"_blank">roy.kollen.s=
vendsen@akersolutions.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes v4 -&gt; v5:<br>
&gt;=C2=A0 =C2=A0- Bump to v6.7.1<br>
&gt; <br>
&gt;=C2=A0 package/qt6/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 ...1-Fix-build-with--no-feature-network.patch | 28 ++++++++++<br=
>
&gt;=C2=A0 package/qt6/qt6declarative/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 24 ++++++++<br>
&gt;=C2=A0 .../qt6/qt6declarative/qt6declarative.hash=C2=A0 =C2=A0 | 11 +++=
+<br>
&gt;=C2=A0 package/qt6/qt6declarative/<a href=3D"http://qt6declarative.mk" =
rel=3D"noreferrer noreferrer" target=3D"_blank">qt6declarative.mk</a>=C2=A0=
 | 56 +++++++++++++++++++<br>
&gt;=C2=A0 5 files changed, 120 insertions(+)<br>
&gt;=C2=A0 create mode 100644 package/qt6/qt6declarative/0001-Fix-build-wit=
h--no-feature-network.patch<br>
&gt;=C2=A0 create mode 100644 package/qt6/qt6declarative/Config.in<br>
&gt;=C2=A0 create mode 100644 package/qt6/qt6declarative/qt6declarative.has=
h<br>
&gt;=C2=A0 create mode 100644 package/qt6/qt6declarative/<a href=3D"http://=
qt6declarative.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">qt6decla=
rative.mk</a><br>
&gt; <br>
&gt; diff --git a/package/qt6/Config.in b/package/qt6/Config.in<br>
&gt; index 81682af476..625134d281 100644<br>
&gt; --- a/package/qt6/Config.in<br>
&gt; +++ b/package/qt6/Config.in<br>
&gt; @@ -45,6 +45,7 @@ if BR2_PACKAGE_QT6<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 source &quot;package/qt6/qt6base/Config.in&quot;<br>
&gt;=C2=A0 source &quot;package/qt6/qt6core5compat/Config.in&quot;<br>
&gt; +source &quot;package/qt6/qt6declarative/Config.in&quot;<br>
&gt;=C2=A0 source &quot;package/qt6/qt6languageserver/Config.in&quot;<br>
&gt;=C2=A0 source &quot;package/qt6/qt6serialbus/Config.in&quot;<br>
&gt;=C2=A0 source &quot;package/qt6/qt6serialport/Config.in&quot;<br>
&gt; diff --git a/package/qt6/qt6declarative/0001-Fix-build-with--no-featur=
e-network.patch b/package/qt6/qt6declarative/0001-Fix-build-with--no-featur=
e-network.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..bef5794229<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/qt6/qt6declarative/0001-Fix-build-with--no-feature-netwo=
rk.patch<br>
&gt; @@ -0,0 +1,28 @@<br>
&gt; +From 8377691a0998fd84e6fc8349a5db450bf2d79164 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Tasuku Suzuki &lt;<a href=3D"mailto:tasuku.suzuki@signal-slot.c=
o.jp" rel=3D"noreferrer" target=3D"_blank">tasuku.suzuki@signal-slot.co.jp<=
/a>&gt;<br>
&gt; +Date: Tue, 21 Nov 2023 23:58:43 +0900<br>
&gt; +Subject: Fix build with -no-feature-network<br>
&gt; +<br>
&gt; +Change-Id: Ib21012301da6afb5458f707b39a9a8079d93eb93<br>
&gt; +Reviewed-by: Ulf Hermann &lt;<a href=3D"mailto:ulf.hermann@qt.io" rel=
=3D"noreferrer" target=3D"_blank">ulf.hermann@qt.io</a>&gt;<br>
&gt; +Upstream: <a href=3D"https://code.qt.io/cgit/qt/qtdeclarative.git/com=
mit/?id=3D8377691a0998fd84e6fc8349a5db450bf2d79164" rel=3D"noreferrer noref=
errer" target=3D"_blank">https://code.qt.io/cgit/qt/qtdeclarative.git/commi=
t/?id=3D8377691a0998fd84e6fc8349a5db450bf2d79164</a><br>
&gt; +Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roy.kollen.s=
vendsen@akersolutions.com" rel=3D"noreferrer" target=3D"_blank">roy.kollen.=
svendsen@akersolutions.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/qml/configure.cmake | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/src/qml/configure.cmake b/src/qml/configure.cmake<br>
&gt; +index 2d0434643a..d1ff90bd54 100644<br>
&gt; +--- a/src/qml/configure.cmake<br>
&gt; ++++ b/src/qml/configure.cmake<br>
&gt; +@@ -82,7 +82,7 @@ qt_feature(&quot;qml-ssl&quot; PUBLIC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SECTION &quot;QML&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LABEL &quot;QML SSL support&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PURPOSE &quot;Provides ssl support in QML.&quot;<=
br>
&gt; +-=C2=A0 =C2=A0 CONDITION QT_FEATURE_ssl<br>
&gt; ++=C2=A0 =C2=A0 CONDITION QT_FEATURE_qml_network AND QT_FEATURE_ssl<br=
>
&gt; + )<br>
&gt; + <br>
&gt; + # On arm and arm64 we need a specialization of cacheFlush() for each=
 OS to be<br>
&gt; +-- <br>
&gt; +cgit v1.2.3<br>
&gt; diff --git a/package/qt6/qt6declarative/Config.in b/package/qt6/qt6dec=
larative/Config.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1daa645413<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/qt6/qt6declarative/Config.in<br>
&gt; @@ -0,0 +1,24 @@<br>
&gt; +config BR2_PACKAGE_QT6DECLARATIVE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;qt6declarative&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Enable host test module to ensure that qmltestr=
unner is built<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_QT6BASE_TEST if BR2_PACKA=
GE_QT6BASE_TEST<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Qt is a cross-platform application and UI =
framework for<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0developers using C++.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0This package corresponds to the qt6declara=
tive module.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://doc.qt.io/qt-6/qtdeclar=
ative-index.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://d=
oc.qt.io/qt-6/qtdeclarative-index.html</a><br>
&gt; +<br>
&gt; +if BR2_PACKAGE_QT6DECLARATIVE<br>
&gt; +<br>
&gt; +config BR2_PACKAGE_QT6DECLARATIVE_QUICK<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;quick module&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6BASE_GUI<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6LANGUAGESERVER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6SHADERTOOLS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6BASE_OPENGL if BR2_PACKAGE_=
QT6_GL_SUPPORTS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_QT6SVG<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_QT6DECLARATIVE<br>
&gt; +<br>
&gt; +endif<br>
&gt; diff --git a/package/qt6/qt6declarative/qt6declarative.hash b/package/=
qt6/qt6declarative/qt6declarative.hash<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..480e3805ca<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/qt6/qt6declarative/qt6declarative.hash<br>
&gt; @@ -0,0 +1,11 @@<br>
&gt; +# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6=
.7/6.7.1/submodules/qtdeclarative-everywhere-src-6.7.1.tar.xz.sha256" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://download.qt.io/officia=
l_releases/qt/6.7/6.7.1/submodules/qtdeclarative-everywhere-src-6.7.1.tar.x=
z.sha256</a><br>
&gt; +sha256=C2=A0 81135c96ed2f599385b8a68c57f4f438dad193c62f946f5b200a3215=
58fd9f1c=C2=A0 qtdeclarative-everywhere-src-6.7.1.tar.xz<br>
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
&gt; +sha256=C2=A0 9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3=
f18a4700=C2=A0 LICENSES/LicenseRef-Qt-Commercial.txt<br>
&gt; +sha256=C2=A0 40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0=
530846b2=C2=A0 LICENSES/Qt-GPL-exception-1.0.txt<br>
&gt; diff --git a/package/qt6/qt6declarative/<a href=3D"http://qt6declarati=
ve.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">qt6declarative.mk</a=
> b/package/qt6/qt6declarative/<a href=3D"http://qt6declarative.mk" rel=3D"=
noreferrer noreferrer" target=3D"_blank">qt6declarative.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..2348ff2dae<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/qt6/qt6declarative/<a href=3D"http://qt6declarative.mk" =
rel=3D"noreferrer noreferrer" target=3D"_blank">qt6declarative.mk</a><br>
&gt; @@ -0,0 +1,56 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# qt6declaratve<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
&gt; +<br>
&gt; +QT6DECLARATIVE_VERSION =3D $(QT6_VERSION)<br>
&gt; +QT6DECLARATIVE_SITE =3D $(QT6_SITE)<br>
&gt; +QT6DECLARATIVE_SOURCE =3D qtdeclarative-$(QT6_SOURCE_TARBALL_PREFIX)-=
$(QT6DECLARATIVE_VERSION).tar.xz<br>
&gt; +QT6DECLARATIVE_INSTALL_STAGING =3D YES<br>
&gt; +<br>
&gt; +QT6DECLARATIVE_SUPPORTS_IN_SOURCE_BUILD =3D NO<br>
&gt; +<br>
&gt; +QT6DECLARATIVE_CMAKE_BACKEND =3D ninja<br>
&gt; +<br>
&gt; +QT6DECLARATIVE_LICENSE =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0GPL-2.0+ or LGPL-3.0, \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0GPL-3.0, GFDL-1.3 no invariants (docs)<br>
&gt; +<br>
&gt; +QT6DECLARATIVE_LICENSE_FILES =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LICENSES/GPL-2.0-only.txt \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LICENSES/GPL-3.0-only.txt \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LICENSES/LGPL-3.0-only.txt \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LICENSES/GFDL-1.3-no-invariants-only.txt<br>
&gt; +<br>
&gt; +QT6DECLARATIVE_CONF_OPTS =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DQT_FEATURE_qml_profiler=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DQT_HOST_PATH=3D$(HOST_DIR) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DBUILD_WITH_PCH=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DQT_BUILD_EXAMPLES=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DQT_BUILD_TESTS=3DOFF<br>
&gt; +<br>
&gt; +HOST_QT6DECLARATIVE_CONF_OPTS =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DQT_HOST_PATH=3D$(HOST_DIR) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DBUILD_WITH_PCH=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DQT_BUILD_EXAMPLES=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DQT_BUILD_TESTS=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DQT_FEATURE_ssl=3DOFF<br>
&gt; +<br>
&gt; +QT6DECLARATIVE_DEPENDENCIES =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-qt6base \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-qt6svg \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-qt6shadertools \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-qt6declarative \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0qt6base \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0qt6shadertools \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0qt6languageserver \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0qt6svg<br>
&gt; +<br>
&gt; +HOST_QT6DECLARATIVE_DEPENDENCIES =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-qt6base \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-qt6svg \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-qt6shadertools<br>
&gt; +<br>
&gt; +$(eval $(cmake-package))<br>
&gt; +$(eval $(host-cmake-package))<br>
&gt; -- <br>
&gt; 2.45.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" rel=3D"noreferrer" target=
=3D"_blank">buildroot@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/ma=
ilman/listinfo/buildroot</a><br>
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
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=
=A0 =C2=A0 |=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div>
</blockquote></div>

--000000000000915b630619f8e82b--

--===============1819951078262255171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1819951078262255171==--
