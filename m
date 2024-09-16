Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4225CC3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 08:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D4494009E;
	Mon, 16 Sep 2024 08:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gnTz8DQC8NFQ; Mon, 16 Sep 2024 08:46:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 785C140338
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 785C140338;
	Mon, 16 Sep 2024 08:46:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BE0F1BF311
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 08:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A49D60A52
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 08:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Nnu8NrcA9av for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 08:45:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA02360A46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA02360A46
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA02360A46
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:45:58 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-e1d2cf4cbf1so4052548276.1
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 01:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726476357; x=1727081157;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NeJwG15aGHHwsuAlqp1nG2v9vQamPBAUTwWJqKnJj+0=;
 b=NWa3j1W92iTKva89jF7X/+67RYvVNGttk7DuqBYaNwRsRrYIDzb8V6W4+dD+fM/dRT
 Mso3bXTvJXNEbbhRsKoxnP+/ftflaP297DFgPU5ifkdHljnxhr1C7wpN7Ai8lAwd5DTq
 HbQNAk/8yi9v1MywKA2/2LbgWTzz7oMxReFh2k2Dus5rO8SZMvFtUic6rHYny7MGU/sI
 Nqv9P0+YGDkmEq5eY0aT1//fiiuBSOXhN8A5IzFN2xecIHSE2vYOri4uOKboeitySWiS
 wKyVuzFjBlDmq//3KAGmctPgL0U2AE8TUATgDwRee/s+ZmQ9gvRx6a2ejqu5MD0rjuid
 GuzQ==
X-Gm-Message-State: AOJu0Yy+0c52wckzP0ds5jA7FzJeFgKZgtqOAYMML6DVlsPGIaPFiAJw
 1j/8Oqsa+mkpHyrUlghpYL5cECM7A4dqZ43KDxTQPR4s7q+8f110Dk4x9ZsENyx9ex/ptVYNBfk
 nSiJetvhRm5xQAEWbLTOLY9R1pHBY+Tmf
X-Google-Smtp-Source: AGHT+IE/jtp8m3D3jPhXmVAQTeRUckwlSFLRphDR48qTBx/7ZGfTrWdizgZCjU++glxcf9Vvuv1DVNDHt9i9A2Pv2Iw=
X-Received: by 2002:a05:6902:2b06:b0:e17:bf26:b812 with SMTP id
 3f1490d57ef6-e1d9dba6e52mr11714050276.23.1726476357075; Mon, 16 Sep 2024
 01:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240916072959.31094-1-baxiche@gmail.com>
In-Reply-To: <20240916072959.31094-1-baxiche@gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Mon, 16 Sep 2024 10:45:45 +0200
Message-ID: <CA+R_deqSEjnHd0xYctMOKFr_nJxcqENmSquw9EBfDvRQifVvOA@mail.gmail.com>
To: baxiche su <baxiche@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726476357; x=1727081157; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NeJwG15aGHHwsuAlqp1nG2v9vQamPBAUTwWJqKnJj+0=;
 b=RjURiDRPaOLtq18Rvi8lC6p5QsQmgNYhf7Q59RIsjTikWt15wznT9Zsab8w7n2o5mi
 SI++S+N8CkTQ0ZAz/jFj6VEcq9ZCDi4CbYrdAkunO0uRK6qQFDwdND3+aOuFMV8A2Y7h
 DvH1muUOQ49V8kWW/d+dgDY0wwdsTnWIh0FUWpShI//4gfhe366YtXebPrVA4tiHBvC9
 SbTDOEEP0i8d4y4TJgpJaLD2W3/7iZE/uwj7i3J/rT1FoNiXSAaQpzTCAV0LihGlioDk
 FNqETLIDxV0/nKP/mPoc684aSmlDs7iy1OoYKEItQ4zhC95Dux8V4EN4mZmBEhnnR9dE
 gw7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RjURiDRP
Subject: Re: [Buildroot] [PATCH v2 1/1] package/qt6: add qt6 multimedia
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4027559738040195161=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4027559738040195161==
Content-Type: multipart/alternative; boundary="000000000000fa10060622389963"

--000000000000fa10060622389963
Content-Type: text/plain; charset="UTF-8"

Hi baxiche su, Hi Thomas,

Please do some sanity control on my feedback, Thomas.

man. 16. sep. 2024 kl. 09:30 skrev baxiche su <baxiche@gmail.com>:

> Signed-off-by: baxiche su <baxiche@gmail.com>
> ---
>  DEVELOPERS                                   |  3 +
>  package/qt6/Config.in                        |  1 +
>  package/qt6/qt6multimedia/Config.in          | 17 +++++
>  package/qt6/qt6multimedia/qt6multimedia.hash | 13 ++++
>  package/qt6/qt6multimedia/qt6multimedia.mk   | 80 ++++++++++++++++++++
>  5 files changed, 114 insertions(+)
>  create mode 100644 package/qt6/qt6multimedia/Config.in
>  create mode 100644 package/qt6/qt6multimedia/qt6multimedia.hash
>  create mode 100644 package/qt6/qt6multimedia/qt6multimedia.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 929e9f895f..56209f9970 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -343,6 +343,9 @@ F:  package/tcpdump/
>  F:     package/ti-uim/
>  F:     package/uhubctl/
>
> +N:     Baxiche Su <baxiche@gmail.com>
> +F:     package/qt6/qt6multimedia
> +
>  N:     Ben Boeckel <mathstuf@gmail.com>
>  F:     package/taskd/
>
> diff --git a/package/qt6/Config.in b/package/qt6/Config.in
> index 4cbb60322c..debf4f4733 100644
> --- a/package/qt6/Config.in
> +++ b/package/qt6/Config.in
> @@ -48,6 +48,7 @@ source "package/qt6/qt6core5compat/Config.in"
>  source "package/qt6/qt6declarative/Config.in"
>  source "package/qt6/qt6languageserver/Config.in"
>  source "package/qt6/qt6mqtt/Config.in"
> +source "package/qt6/qt6multimedia/Config.in"
>  source "package/qt6/qt6opcua/Config.in"
>  source "package/qt6/qt6scxml/Config.in"
>  source "package/qt6/qt6serialbus/Config.in"
> diff --git a/package/qt6/qt6multimedia/Config.in
> b/package/qt6/qt6multimedia/Config.in
> new file mode 100644
> index 0000000000..77ff3d28ae
> --- /dev/null
> +++ b/package/qt6/qt6multimedia/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_QT6MULTIMEDIA
> +       bool "qt6multimedia"
> +       select BR2_PACKAGE_QT6BASE_GUI
> +       select BR2_PACKAGE_QT6BASE_NETWORK
> +       select BR2_PACKAGE_QT6BASE_CONCURRENT
>

I don't see information in the buildsystem saying the Qt Concurrent Module
is required. It would be nice with an explaination here.


> +       select BR2_PACKAGE_QT6SHADERTOOLS
> +
> +       help
> +         Qt Multimedia is an add-on module that provides
> +         a rich set of QML types and C++ classes to handle
> +         multimedia content. It contains an easy to use API
> +         for playing back audio and video files and rendering
> +         those on screen, as well as a comprehensive API for
> +         recording audio and video from the system's cameras
> +         and microphones.
>
+
> +         https://doc.qt.io/qt-6/qtmultimedia-index.html
>

I think we should mention all the modules in the Qt Multimedia project here:

  It contains the following modules:

 Qt Multimedia:
 https://doc.qt.io/qt-6/qtmultimedia-index.html

 Qt Multimedia Widgets:
 https://doc.qt.io/qt-6/qtmultimediawidgets-index.html

 Qt Spatial Audio:
 https://doc.qt.io/qt-6/qtspatialaudio-index.html


I also think you should add a flag to disable/enable the Qt Spatial Audio
Module since this is not determined automatically:

if BR2_PACKAGE_QT6MULTIMEDIA

config BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO
bool "spatial audio"

endif



> diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash
> b/package/qt6/qt6multimedia/qt6multimedia.hash
> new file mode 100644
> index 0000000000..855699fa2d
> --- /dev/null
> +++ b/package/qt6/qt6multimedia/qt6multimedia.hash
> @@ -0,0 +1,13 @@
> +# Hash from:
> https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtmultimedia-everywhere-src-6.7.2.tar.xz.sha256
> +sha256
> <https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtmultimedia-everywhere-src-6.7.2.tar.xz.sha256+sha256>
> 8ef835115acb9a1d3d2c9f23cfacb43f2c537e3786a8ab822299a2a7765651d3
> qtmultimedia-everywhere-src-6.7.2.tar.xz
> +
> +# Hashes for license files:
> +sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
> LICENSES/BSD-3-Clause.txt
> +sha256  3abd6471b9a9a08d65ce771143f8e278bb4c1aeb10c1c2d476935a6b049653f5
> LICENSES/BSL-1.0.txt
> +sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4
> LICENSES/GFDL-1.3-no-invariants-only.txt
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> LICENSES/GPL-2.0-only.txt
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
> LICENSES/GPL-3.0-only.txt
> +sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768
> LICENSES/LGPL-3.0-only.txt
> +sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc
> LICENSES/MIT.txt
> +sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700
> LICENSES/LicenseRef-Qt-Commercial.txt
> +sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2
> LICENSES/Qt-GPL-exception-1.0.txt
>

This is my autogenerated list:

# Hashes for license files
sha256  f32fb3b417a194167cfad068223fc975ba96c5960513a10f66a3c28720aec1df
 LICENSES/BSD-2-Clause.txt
sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
 LICENSES/BSD-3-Clause.txt
sha256  1f1b677d26ab73e159a55c3a914cf12d888e18a9d0d469fedab4aa6e5a48b1c0
 LICENSES/BSD-Source-Code.txt
sha256  84c6ef3ea9e3254a54d0acf5d3e0c61ae011b8fef7dd6940591cf060e6380a8f
 LICENSES/BSL-1.0.txt
sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4
 LICENSES/GFDL-1.3-no-invariants-only.txt
sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
 LICENSES/GPL-2.0-only.txt
sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
 LICENSES/GPL-3.0-only.txt
sha256  7658542977bfdced9e1059a6c934ce4281de76d103b831007b825917dc62511a
 LICENSES/IJG.txt
sha256  f2ec607f67bb0dd3053b49835b02110d5cd0f8eb6da3aac4dc0b142a6b299be9
 LICENSES/ISC.txt
sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb
 LICENSES/LGPL-2.1-or-later.txt
sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768
 LICENSES/LGPL-3.0-only.txt
sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0
 LICENSES/MIT.txt
sha256  66a3107d5ad6a058aab753eaac2047ccb2ed0e39465dd0fe5844da3e300d5172
 LICENSES/MPL-2.0.txt
sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2
 LICENSES/Qt-GPL-exception-1.0.txt
sha256  bfb1112d49db5b1daecdfef24bd7e2f3ea0bafb33aa67aa0ab51e2bf8407c03d
 LICENSES/Zlib.txt
sha256  85da7c29c2d2f2e6b3116b1219584cb513474cab797b3312a779be4c2181e51e
 src/3rdparty/eigen/COPYING.BSD
sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85
 src/3rdparty/eigen/COPYING.MPL2
sha256  8b69cf3ac3ddd34df478c4ae6eaacf5e6c63ea7ee6403c8dad97e4d1438bc3c4
 src/3rdparty/eigen/COPYRIGHTS
sha256  b522f821df94da3bad917e98ef04817b3af421c3b8c23e8247ae7e517b289934
 src/3rdparty/pffft/COPYRIGHTS
sha256  a46200592eb193853527250da098e6bb0c75424e7a2c7db8da526c4f301c3d88
 src/3rdparty/pffft/LICENSE
sha256  2513c5ad87ce9e7feed2c9a159d336f0a0d12ff93adcd411f7a15a1ab678f7ac
 src/3rdparty/resonance-audio/COPYRIGHTS
sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30
 src/3rdparty/resonance-audio/LICENSE


> diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk
> b/package/qt6/qt6multimedia/qt6multimedia.mk
> new file mode 100644
> index 0000000000..ed405fe7d0
> --- /dev/null
> +++ b/package/qt6/qt6multimedia/qt6multimedia.mk
> @@ -0,0 +1,80 @@
>
> +################################################################################
> +#
> +# qt6multimedia
> +#
>
> +################################################################################
> +
> +QT6MULTIMEDIA_VERSION = $(QT6_VERSION)
> +QT6MULTIMEDIA_SITE = $(QT6_SITE)
> +QT6MULTIMEDIA_SOURCE =
> qtmultimedia-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6MULTIMEDIA_VERSION).tar.xz
> +QT6MULTIMEDIA_INSTALL_STAGING = YES
> +
>

Maybe remove the spacing between the one-liners at the top of the file?


> +QT6MULTIMEDIA_SUPPORTS_IN_SOURCE_BUILD = NO
> +
> +QT6MULTIMEDIA_CMAKE_BACKEND = ninja
> +
> +QT6MULTIMEDIA_LICENSE = \
> +       BSD-3-Clause (docs, examples), \
> +       BSL-1.0, \
> +       GFDL-1.3 no invariants (docs), \
> +       LGPL-2.1+, \
> +       LGPL-3.0 or GPL-2.0 or GPL-3.0, \
> +       MIT \
> +       MPL-2.0
> +
>

As a reference, the following is more complete license information for
whats available in the repo:

QT6MULTIMEDIA_LICENSE = \
Apache-2.0 (resonance-audio), \
BSD-3-Clause (buildsystem, examples, pfft,  snippets), \
BSL-1.0 (ffmpeg-boost), \
GFDL-1.3-no-invariants (docs), \
GPL-3.0 (tests), \
GPL-3.0 with Qt-GPL-exception-1.0 (utils), \
IJG (ffmpeg-libjpeg), \
LGPL-2.1+ and BSD-3-Clause and BSD-2-Clause and BSD-Source-Code and ISC and
MIT and MPL-2.0 (ffmpeg), \
LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins), \
LGPL-3.0 or GPL-3.0 (resonance-audio, spatialaudio, spatialaudioquick3d), \
MPL-2.0 and BSD-3-Clause (eigen), \
Zlib (ffmpeg-zlib)

But this should depend on what is actually installed on the image.

+QT6MULTIMEDIA_LICENSE_FILES = \
> +    LICENSES/BSD-2-Clause.txt \
> +    LICENSES/BSD-3-Clause.txt \
> +    LICENSES/BSD-Source-Code.txt \
> +    LICENSES/BSL-1.0.txt \
> +    LICENSES/GFDL-1.3-no-invariants-only.txt \
> +    LICENSES/GPL-2.0-only.txt \
> +    LICENSES/GPL-3.0-only.txt \
> +    LICENSES/IJG.txt \
> +    LICENSES/ISC.txt \
> +    LICENSES/LGPL-2.1-or-later.txt \
> +    LICENSES/LGPL-3.0-only.txt \
> +    LICENSES/LicenseRef-Qt-Commercial.txt \
> +    LICENSES/MIT.txt \
> +    LICENSES/MPL-2.0.txt \
> +    LICENSES/Qt-GPL-exception-1.0.txt \
> +    LICENSES/Zlib.txt
> +
>

This is my autogenerated list:

QT6MULTIMEDIA_LICENSE_FILES = \
LICENSES/BSD-2-Clause.txt \
LICENSES/BSD-3-Clause.txt \
LICENSES/BSD-Source-Code.txt \
LICENSES/BSL-1.0.txt \
LICENSES/GFDL-1.3-no-invariants-only.txt \
LICENSES/GPL-2.0-only.txt \
LICENSES/GPL-3.0-only.txt \
LICENSES/IJG.txt \
LICENSES/ISC.txt \
LICENSES/LGPL-2.1-or-later.txt \
LICENSES/LGPL-3.0-only.txt \
LICENSES/MIT.txt \
LICENSES/MPL-2.0.txt \
LICENSES/Qt-GPL-exception-1.0.txt \
LICENSES/Zlib.txt \
src/3rdparty/eigen/COPYING.BSD \
src/3rdparty/eigen/COPYING.MPL2 \
src/3rdparty/eigen/COPYRIGHTS \
src/3rdparty/pffft/COPYRIGHTS \
src/3rdparty/pffft/LICENSE \
src/3rdparty/resonance-audio/COPYRIGHTS \
src/3rdparty/resonance-audio/LICENSE

This variable should probably also depend on what is actually installed on
target.


> +QT6MULTIMEDIA_CONF_OPTS = \
> +       -DBUILD_WITH_PCH=OFF \
> +       -DQT_BUILD_EXAMPLES=OFF \
> +       -DQT_BUILD_TESTS=OFF
> +       -DQT_HOST_PATH=$(HOST_DIR) \
> +
> +QT6MULTIMEDIA_DEPENDENCIES = \
>

I think you should add linux as a dependency here for v4l and dmabuf config
test.

See ./src/multimedia/configure.cmake


> +       qt6base \
> +       qt6shadertools
> +
> +# Qt6 multimedia can build without the following packages.
> +# The configuration process automatically detects the
> +# libraries if present
> +
> +ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
> +QT6MULTIMEDIA_DEPENDENCIES += alsa-lib
> +endif
>

I think this is also needed according to ./src/multimedia/configure.cmake:

ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
QT6MULTIMEDIA_DEPENDENCIES += libegl
endif


> +
> +ifeq ($(BR2_PACKAGE_GSTREAMER1),y)
> +QT6MULTIMEDIA_DEPENDENCIES += gstreamer1
> +endif
> +
>

See ./src/multimedia/configure.cmake:
...
qt_feature("gstreamer_1_0" PRIVATE
    LABEL "GStreamer 1.0"
    CONDITION GStreamer_FOUND
)
qt_feature("gstreamer_app" PRIVATE
    LABEL "GStreamer App"
    CONDITION ( QT_FEATURE_gstreamer_1_0 AND GStreamer_App_FOUND )
)
qt_feature("gstreamer_photography" PRIVATE
    LABEL "GStreamer Photography"
    CONDITION ( QT_FEATURE_gstreamer_1_0 AND GStreamer_Photography_FOUND )
)
qt_feature("gstreamer_gl" PRIVATE
    LABEL "GStreamer OpenGL"
    CONDITION QT_FEATURE_opengl AND QT_FEATURE_gstreamer_1_0 AND
GStreamer_Gl_FOUND AND EGL_FOUND
)
qt_feature("gstreamer" PRIVATE
    LABEL "QtMM GStreamer plugin"
    CONDITION (QT_FEATURE_gstreamer_1_0 AND QT_FEATURE_gstreamer_app)
    ENABLE INPUT_gstreamer STREQUAL 'yes'
    DISABLE INPUT_gstreamer STREQUAL 'no'
)
...

I think the following looks more correct:

ifeq
($(BR2_PACKAGE_GSTREAMER1)$(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP),yy)
QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_gstreamer=ON
QT6MULTIMEDIA_DEPENDENCIES += \
gstreamer1 \
gst1-plugins-base
else
QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_gstreamer=OFF
endif

And if available maybe do the same for gstreamer_photography and
gstreamer_gl?



> +ifeq ($(BR2_PACKAGE_LIBVA),y)
> +QT6MULTIMEDIA_DEPENDENCIES += libva
> +endif
> +
>

See ./src/multimedia/configure.cmake:
...
qt_feature("linux_v4l" PRIVATE
    LABEL "Video for Linux"
    CONDITION UNIX AND TEST_linux_v4l
)
qt_feature("linux_dmabuf" PRIVATE
    LABEL "Linux DMA buffer support"
    CONDITION UNIX AND TEST_linux_dmabuf
)
qt_feature("vaapi" PRIVATE
    LABEL "VAAPI support"
    CONDITION UNIX AND VAAPI_FOUND AND QT_FEATURE_linux_dmabuf
)

This is why I think you need to add the linux dependency as mentioned
before.


> +ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
> +QT6MULTIMEDIA_DEPENDENCIES += pulseaudio
> +ifeq ($(BR2_PACKAGE_FFMPEG),y)
> +QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
> +endif
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
> +QT6MULTIMEDIA_DEPENDENCIES += qt6declarative
> +endif
> +
>

I think you should also add:

ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO),y)
QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio=ON
else
QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio=OFF
endif

And maybe we could add this now even though quick3d is not added yet?:

ifeq ($(BR2_PACKAGE_QT6QUICK3D),y)
QT6MULTIMEDIA_DEPENDENCIES += qt6quick3d
endif



> +$(eval $(cmake-package))
> --
> 2.34.1
>
>

--000000000000fa10060622389963
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi baxiche su, Hi Thomas,<br></div><div><br></div><di=
v>Please do some sanity control on my feedback, Thomas.<br></div><div><br><=
/div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">man. =
16. sep. 2024 kl. 09:30 skrev baxiche su &lt;<a href=3D"mailto:baxiche@gmai=
l.com">baxiche@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Signed-off-by: baxiche su &lt;<a href=3D"mailto:baxiche@g=
mail.com" target=3D"_blank">baxiche@gmail.com</a>&gt;<br>
---<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3=
 +<br>
=C2=A0package/qt6/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0package/qt6/qt6multimedia/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 17 +++++<br>
=C2=A0package/qt6/qt6multimedia/qt6multimedia.hash | 13 ++++<br>
=C2=A0package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk" rel=3D"=
noreferrer" target=3D"_blank">qt6multimedia.mk</a>=C2=A0 =C2=A0| 80 +++++++=
+++++++++++++<br>
=C2=A05 files changed, 114 insertions(+)<br>
=C2=A0create mode 100644 package/qt6/qt6multimedia/Config.in<br>
=C2=A0create mode 100644 package/qt6/qt6multimedia/qt6multimedia.hash<br>
=C2=A0create mode 100644 package/qt6/qt6multimedia/<a href=3D"http://qt6mul=
timedia.mk" rel=3D"noreferrer" target=3D"_blank">qt6multimedia.mk</a><br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 929e9f895f..56209f9970 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -343,6 +343,9 @@ F:=C2=A0 package/tcpdump/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/ti-uim/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/uhubctl/<br>
<br>
+N:=C2=A0 =C2=A0 =C2=A0Baxiche Su &lt;<a href=3D"mailto:baxiche@gmail.com" =
target=3D"_blank">baxiche@gmail.com</a>&gt;<br>
+F:=C2=A0 =C2=A0 =C2=A0package/qt6/qt6multimedia<br>
+<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Ben Boeckel &lt;<a href=3D"mailto:mathstuf@gmai=
l.com" target=3D"_blank">mathstuf@gmail.com</a>&gt;<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/taskd/<br>
<br>
diff --git a/package/qt6/Config.in b/package/qt6/Config.in<br>
index 4cbb60322c..debf4f4733 100644<br>
--- a/package/qt6/Config.in<br>
+++ b/package/qt6/Config.in<br>
@@ -48,6 +48,7 @@ source &quot;package/qt6/qt6core5compat/Config.in&quot;<b=
r>
=C2=A0source &quot;package/qt6/qt6declarative/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6languageserver/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6mqtt/Config.in&quot;<br>
+source &quot;package/qt6/qt6multimedia/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6opcua/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6scxml/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6serialbus/Config.in&quot;<br>
diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedi=
a/Config.in<br>
new file mode 100644<br>
index 0000000000..77ff3d28ae<br>
--- /dev/null<br>
+++ b/package/qt6/qt6multimedia/Config.in<br>
@@ -0,0 +1,17 @@<br>
+config BR2_PACKAGE_QT6MULTIMEDIA<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;qt6multimedia&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6BASE_GUI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6BASE_NETWORK<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6BASE_CONCURRENT<br>
</blockquote><div><br></div><div>I don&#39;t see information in the buildsy=
stem saying the Qt Concurrent Module is required. It would be nice with an =
explaination here.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6SHADE=
RTOOLS<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Qt Multimedia is an add-on module that p=
rovides <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a rich set of QML types and C++ classes =
to handle <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0multimedia content. It contains an easy =
to use API <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for playing back audio and video files a=
nd rendering <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0those on screen, as well as a comprehens=
ive API for <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recording audio and video from the syste=
m&#39;s cameras <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and microphones.<br></blockquote><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://doc.qt.io/qt-6/qtmult=
imedia-index.html" rel=3D"noreferrer" target=3D"_blank">https://doc.qt.io/q=
t-6/qtmultimedia-index.html</a><br></blockquote><div><br></div><div>I think=
 we should mention all the modules in the Qt Multimedia project here:</div>=
<div><br></div><div>=C2=A0 It contains the following modules:<br><br>	 =C2=
=A0Qt Multimedia:<br>	 =C2=A0<a href=3D"https://doc.qt.io/qt-6/qtmultimedia=
-index.html">https://doc.qt.io/qt-6/qtmultimedia-index.html</a><br><br>	 =
=C2=A0Qt Multimedia Widgets:<br>	 =C2=A0<a href=3D"https://doc.qt.io/qt-6/q=
tmultimediawidgets-index.html">https://doc.qt.io/qt-6/qtmultimediawidgets-i=
ndex.html</a><br><br>	 =C2=A0Qt Spatial Audio:<br>	 =C2=A0<a href=3D"https:=
//doc.qt.io/qt-6/qtspatialaudio-index.html">https://doc.qt.io/qt-6/qtspatia=
laudio-index.html</a></div><div><br></div><div><br></div><div>I also think =
you should add a flag to disable/enable the Qt Spatial Audio Module since t=
his is not determined automatically:<br></div><div><br></div><div>if BR2_PA=
CKAGE_QT6MULTIMEDIA<br><br>config BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO<br=
>	bool &quot;spatial audio&quot;<br><br>endif</div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">diff --git a/pac=
kage/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6mu=
ltimedia.hash<br>
new file mode 100644<br>
index 0000000000..855699fa2d<br>
--- /dev/null<br>
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash<br>
@@ -0,0 +1,13 @@<br>
+# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.7/6.=
7.2/submodules/qtmultimedia-everywhere-src-6.7.2.tar.xz.sha256+sha256" rel=
=3D"noreferrer" target=3D"_blank">https://download.qt.io/official_releases/=
qt/6.7/6.7.2/submodules/qtmultimedia-everywhere-src-6.7.2.tar.xz.sha256<br>
+sha256</a>=C2=A0 8ef835115acb9a1d3d2c9f23cfacb43f2c537e3786a8ab822299a2a77=
65651d3=C2=A0 qtmultimedia-everywhere-src-6.7.2.tar.xz<br>
+<br>
+# Hashes for license files:<br>
+sha256=C2=A0 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1d=
cce=C2=A0 LICENSES/BSD-3-Clause.txt<br>
+sha256=C2=A0 3abd6471b9a9a08d65ce771143f8e278bb4c1aeb10c1c2d476935a6b04965=
3f5=C2=A0 LICENSES/BSL-1.0.txt<br>
+sha256=C2=A0 110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b20=
6a4=C2=A0 LICENSES/GFDL-1.3-no-invariants-only.txt<br>
+sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880=
643=C2=A0 LICENSES/GPL-2.0-only.txt<br>
+sha256=C2=A0 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b=
903=C2=A0 LICENSES/GPL-3.0-only.txt<br>
+sha256=C2=A0 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464=
768=C2=A0 LICENSES/LGPL-3.0-only.txt<br>
+sha256=C2=A0 d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf=
1fc=C2=A0 LICENSES/MIT.txt<br>
+sha256=C2=A0 9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4=
700=C2=A0 LICENSES/LicenseRef-Qt-Commercial.txt<br>
+sha256=C2=A0 40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b053084=
6b2=C2=A0 LICENSES/Qt-GPL-exception-1.0.txt<br>
</blockquote><div><br></div><div>This is my autogenerated list:</div><div><=
br></div><div># Hashes for license files<br>sha256 =C2=A0f32fb3b417a194167c=
fad068223fc975ba96c5960513a10f66a3c28720aec1df =C2=A0LICENSES/BSD-2-Clause.=
txt<br>sha256 =C2=A09f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb=
42ed1dcce =C2=A0LICENSES/BSD-3-Clause.txt<br>sha256 =C2=A01f1b677d26ab73e15=
9a55c3a914cf12d888e18a9d0d469fedab4aa6e5a48b1c0 =C2=A0LICENSES/BSD-Source-C=
ode.txt<br>sha256 =C2=A084c6ef3ea9e3254a54d0acf5d3e0c61ae011b8fef7dd6940591=
cf060e6380a8f =C2=A0LICENSES/BSL-1.0.txt<br>sha256 =C2=A0110535522396708cea=
37c72a802c5e7e81391139f5f7985631c93ef242b206a4 =C2=A0LICENSES/GFDL-1.3-no-i=
nvariants-only.txt<br>sha256 =C2=A08177f97513213526df2cf6184d8ff986c675afb5=
14d4e68a404010521b880643 =C2=A0LICENSES/GPL-2.0-only.txt<br>sha256 =C2=A08c=
eb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 =C2=A0LICENS=
ES/GPL-3.0-only.txt<br>sha256 =C2=A07658542977bfdced9e1059a6c934ce4281de76d=
103b831007b825917dc62511a =C2=A0LICENSES/IJG.txt<br>sha256 =C2=A0f2ec607f67=
bb0dd3053b49835b02110d5cd0f8eb6da3aac4dc0b142a6b299be9 =C2=A0LICENSES/ISC.t=
xt<br>sha256 =C2=A0fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303=
fc1f58fb =C2=A0LICENSES/LGPL-2.1-or-later.txt<br>sha256 =C2=A0da7eabb7bafdf=
7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 =C2=A0LICENSES/LGPL-3.0=
-only.txt<br>sha256 =C2=A0b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984=
a88af32570b0cc0 =C2=A0LICENSES/MIT.txt<br>sha256 =C2=A066a3107d5ad6a058aab7=
53eaac2047ccb2ed0e39465dd0fe5844da3e300d5172 =C2=A0LICENSES/MPL-2.0.txt<br>=
sha256 =C2=A040678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846=
b2 =C2=A0LICENSES/Qt-GPL-exception-1.0.txt<br>sha256 =C2=A0bfb1112d49db5b1d=
aecdfef24bd7e2f3ea0bafb33aa67aa0ab51e2bf8407c03d =C2=A0LICENSES/Zlib.txt<br=
>sha256 =C2=A085da7c29c2d2f2e6b3116b1219584cb513474cab797b3312a779be4c2181e=
51e =C2=A0src/3rdparty/eigen/COPYING.BSD<br>sha256 =C2=A0fab3dd6bdab226f1c0=
8630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85 =C2=A0src/3rdparty/eigen/COP=
YING.MPL2<br>sha256 =C2=A08b69cf3ac3ddd34df478c4ae6eaacf5e6c63ea7ee6403c8da=
d97e4d1438bc3c4 =C2=A0src/3rdparty/eigen/COPYRIGHTS<br>sha256 =C2=A0b522f82=
1df94da3bad917e98ef04817b3af421c3b8c23e8247ae7e517b289934 =C2=A0src/3rdpart=
y/pffft/COPYRIGHTS<br>sha256 =C2=A0a46200592eb193853527250da098e6bb0c75424e=
7a2c7db8da526c4f301c3d88 =C2=A0src/3rdparty/pffft/LICENSE<br>sha256 =C2=A02=
513c5ad87ce9e7feed2c9a159d336f0a0d12ff93adcd411f7a15a1ab678f7ac =C2=A0src/3=
rdparty/resonance-audio/COPYRIGHTS<br>sha256 =C2=A0cfc7749b96f63bd31c3c42b5=
c471bf756814053e847c10f3eb003417bc523d30 =C2=A0src/3rdparty/resonance-audio=
/LICENSE<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">diff --git a/package/qt6/qt6multimedia/<a href=3D"http://qt6mult=
imedia.mk" rel=3D"noreferrer" target=3D"_blank">qt6multimedia.mk</a> b/pack=
age/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk" rel=3D"noreferrer=
" target=3D"_blank">qt6multimedia.mk</a><br>
new file mode 100644<br>
index 0000000000..ed405fe7d0<br>
--- /dev/null<br>
+++ b/package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk" rel=3D"=
noreferrer" target=3D"_blank">qt6multimedia.mk</a><br>
@@ -0,0 +1,80 @@<br>
+##########################################################################=
######<br>
+#<br>
+# qt6multimedia<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+QT6MULTIMEDIA_VERSION =3D $(QT6_VERSION)<br>
+QT6MULTIMEDIA_SITE =3D $(QT6_SITE)<br>
+QT6MULTIMEDIA_SOURCE =3D qtmultimedia-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6MU=
LTIMEDIA_VERSION).tar.xz<br>
+QT6MULTIMEDIA_INSTALL_STAGING =3D YES<br>
+<br>
</blockquote><div><br></div><div>Maybe remove the spacing between the one-l=
iners at the top of the file?<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">+QT6MULTIMEDIA_SUPPORTS_IN_SOURCE_BUILD =
=3D NO<br>
+<br>
+QT6MULTIMEDIA_CMAKE_BACKEND =3D ninja<br>
+<br>
+QT6MULTIMEDIA_LICENSE =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0BSD-3-Clause (docs, examples), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0BSL-1.0, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GFDL-1.3 no invariants (docs), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LGPL-2.1+, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LGPL-3.0 or GPL-2.0 or GPL-3.0, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MIT \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MPL-2.0<br>
+<br>
</blockquote><div><br></div><div>As a reference, the following is more comp=
lete license information for whats available in the repo:</div><div><br></d=
iv><div>QT6MULTIMEDIA_LICENSE =3D \<br>	Apache-2.0 (resonance-audio), \<br>=
	BSD-3-Clause (buildsystem, examples, pfft, =C2=A0snippets), \<br>	BSL-1.0 =
(ffmpeg-boost), \<br>	GFDL-1.3-no-invariants (docs), \<br>	GPL-3.0 (tests),=
 \<br>	GPL-3.0 with Qt-GPL-exception-1.0 (utils), \<br>	IJG (ffmpeg-libjpeg=
), \<br>	LGPL-2.1+ and BSD-3-Clause and BSD-2-Clause and BSD-Source-Code an=
d ISC and MIT and MPL-2.0 (ffmpeg), \<br>	LGPL-3.0 or GPL-2.0 or GPL-3.0 (m=
odules, plugins), \<br>	LGPL-3.0 or GPL-3.0 (resonance-audio, spatialaudio,=
 spatialaudioquick3d), \<br>	MPL-2.0 and BSD-3-Clause (eigen), \<br>	Zlib (=
ffmpeg-zlib)<br></div><div><br></div>But this should depend on what is actu=
ally installed on the image.<br></div><div class=3D"gmail_quote"><br></div>=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">+QT6MULTIMEDIA_LICENSE_FILES =3D \<br>
+=C2=A0 =C2=A0 LICENSES/BSD-2-Clause.txt \<br>
+=C2=A0 =C2=A0 LICENSES/BSD-3-Clause.txt \<br>
+=C2=A0 =C2=A0 LICENSES/BSD-Source-Code.txt \<br>
+=C2=A0 =C2=A0 LICENSES/BSL-1.0.txt \<br>
+=C2=A0 =C2=A0 LICENSES/GFDL-1.3-no-invariants-only.txt \<br>
+=C2=A0 =C2=A0 LICENSES/GPL-2.0-only.txt \<br>
+=C2=A0 =C2=A0 LICENSES/GPL-3.0-only.txt \<br>
+=C2=A0 =C2=A0 LICENSES/IJG.txt \<br>
+=C2=A0 =C2=A0 LICENSES/ISC.txt \<br>
+=C2=A0 =C2=A0 LICENSES/LGPL-2.1-or-later.txt \<br>
+=C2=A0 =C2=A0 LICENSES/LGPL-3.0-only.txt \<br>
+=C2=A0 =C2=A0 LICENSES/LicenseRef-Qt-Commercial.txt \<br>
+=C2=A0 =C2=A0 LICENSES/MIT.txt \<br>
+=C2=A0 =C2=A0 LICENSES/MPL-2.0.txt \<br>
+=C2=A0 =C2=A0 LICENSES/Qt-GPL-exception-1.0.txt \<br>
+=C2=A0 =C2=A0 LICENSES/Zlib.txt<br>
+<br></blockquote><div><br></div><div>This is my autogenerated list:</div><=
div><br></div><div>QT6MULTIMEDIA_LICENSE_FILES =3D \<br>	LICENSES/BSD-2-Cla=
use.txt \<br>	LICENSES/BSD-3-Clause.txt \<br>	LICENSES/BSD-Source-Code.txt =
\<br>	LICENSES/BSL-1.0.txt \<br>	LICENSES/GFDL-1.3-no-invariants-only.txt \=
<br>	LICENSES/GPL-2.0-only.txt \<br>	LICENSES/GPL-3.0-only.txt \<br>	LICENS=
ES/IJG.txt \<br>	LICENSES/ISC.txt \<br>	LICENSES/LGPL-2.1-or-later.txt \<br=
>	LICENSES/LGPL-3.0-only.txt \<br>	LICENSES/MIT.txt \<br>	LICENSES/MPL-2.0.=
txt \<br>	LICENSES/Qt-GPL-exception-1.0.txt \<br>	LICENSES/Zlib.txt \<br>	s=
rc/3rdparty/eigen/COPYING.BSD \<br>	src/3rdparty/eigen/COPYING.MPL2 \<br>	s=
rc/3rdparty/eigen/COPYRIGHTS \<br>	src/3rdparty/pffft/COPYRIGHTS \<br>	src/=
3rdparty/pffft/LICENSE \<br>	src/3rdparty/resonance-audio/COPYRIGHTS \<br>	=
src/3rdparty/resonance-audio/LICENSE</div><div><br></div><div>This variable=
 should probably also depend on what is actually installed on target.<br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+QT6MULTIMEDIA_CONF_OPTS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DBUILD_WITH_PCH=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_BUILD_EXAMPLES=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_BUILD_TESTS=3DOFF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_HOST_PATH=3D$(HOST_DIR) \<br>
+<br>
+QT6MULTIMEDIA_DEPENDENCIES =3D \<br>
</blockquote><div><br></div><div>I think you should add linux as a dependen=
cy here for v4l and dmabuf config test.</div><div><br></div><div>See ./src/=
multimedia/configure.cmake</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0qt6base \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0qt6shadertools<br>
+<br>
+# Qt6 multimedia can build without the following packages.<br>
+# The configuration process automatically detects the <br>
+# libraries if present<br>
+<br>
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D alsa-lib<br>
+endif<br></blockquote><div><br></div><div>I think this is also needed acco=
rding to ./src/multimedia/configure.cmake:</div><div><br></div><div>ifeq ($=
(BR2_PACKAGE_HAS_LIBEGL),y)<br>QT6MULTIMEDIA_DEPENDENCIES +=3D libegl<br>en=
dif<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
+<br>
+ifeq ($(BR2_PACKAGE_GSTREAMER1),y)<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D gstreamer1<br>
+endif<br>
+<br></blockquote><div><br><div>See ./src/multimedia/configure.cmake:</div>=
<div>...</div><div>qt_feature(&quot;gstreamer_1_0&quot; PRIVATE<br>=C2=A0 =
=C2=A0 LABEL &quot;GStreamer 1.0&quot;<br>=C2=A0 =C2=A0 CONDITION GStreamer=
_FOUND<br>)<br>qt_feature(&quot;gstreamer_app&quot; PRIVATE<br>=C2=A0 =C2=
=A0 LABEL &quot;GStreamer App&quot;<br>=C2=A0 =C2=A0 CONDITION ( QT_FEATURE=
_gstreamer_1_0 AND GStreamer_App_FOUND )<br>)<br>qt_feature(&quot;gstreamer=
_photography&quot; PRIVATE<br>=C2=A0 =C2=A0 LABEL &quot;GStreamer Photograp=
hy&quot;<br>=C2=A0 =C2=A0 CONDITION ( QT_FEATURE_gstreamer_1_0 AND GStreame=
r_Photography_FOUND )<br>)<br>qt_feature(&quot;gstreamer_gl&quot; PRIVATE<b=
r>=C2=A0 =C2=A0 LABEL &quot;GStreamer OpenGL&quot;<br>=C2=A0 =C2=A0 CONDITI=
ON QT_FEATURE_opengl AND QT_FEATURE_gstreamer_1_0 AND GStreamer_Gl_FOUND AN=
D EGL_FOUND<br>)<br>qt_feature(&quot;gstreamer&quot; PRIVATE<br>=C2=A0 =C2=
=A0 LABEL &quot;QtMM GStreamer plugin&quot;<br>=C2=A0 =C2=A0 CONDITION (QT_=
FEATURE_gstreamer_1_0 AND QT_FEATURE_gstreamer_app)<br>=C2=A0 =C2=A0 ENABLE=
 INPUT_gstreamer STREQUAL &#39;yes&#39;<br>=C2=A0 =C2=A0 DISABLE INPUT_gstr=
eamer STREQUAL &#39;no&#39;<br>)</div><div>...<br></div><div><br></div><div=
>I think the following looks more correct: <br></div><div><br></div></div><=
div>ifeq ($(BR2_PACKAGE_GSTREAMER1)$(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_A=
PP),yy)<br>QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_gstreamer=3DON<br>QT6MULT=
IMEDIA_DEPENDENCIES +=3D \<br>	gstreamer1 \<br>	gst1-plugins-base<br>else<b=
r>QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_gstreamer=3DOFF<br>endif<br></div>=
<div><br></div><div>And if available maybe do the same for gstreamer_photog=
raphy and gstreamer_gl?<br></div><div><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
+ifeq ($(BR2_PACKAGE_LIBVA),y)<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D libva<br>
+endif<br>
+<br></blockquote><div><br></div><div><div>See ./src/multimedia/configure.c=
make:</div><div>...</div><div>qt_feature(&quot;linux_v4l&quot; PRIVATE<br>=
=C2=A0 =C2=A0 LABEL &quot;Video for Linux&quot;<br>=C2=A0 =C2=A0 CONDITION =
UNIX AND TEST_linux_v4l<br>)<br>qt_feature(&quot;linux_dmabuf&quot; PRIVATE=
<br>=C2=A0 =C2=A0 LABEL &quot;Linux DMA buffer support&quot;<br>=C2=A0 =C2=
=A0 CONDITION UNIX AND TEST_linux_dmabuf<br>)<br>qt_feature(&quot;vaapi&quo=
t; PRIVATE<br>=C2=A0 =C2=A0 LABEL &quot;VAAPI support&quot;<br>=C2=A0 =C2=
=A0 CONDITION UNIX AND VAAPI_FOUND AND QT_FEATURE_linux_dmabuf<br>)</div></=
div><div><br></div><div>This is why I think you need to add the linux depen=
dency as mentioned before.<br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D pulseaudio<br>
+ifeq ($(BR2_PACKAGE_FFMPEG),y)<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D ffmpeg<br>
+endif<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D qt6declarative<br>
+endif<br>
+<br></blockquote><div><br></div><div>I think you should also add:</div><di=
v><br></div><div>ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO),y)<br>QT6M=
ULTIMEDIA_CONF_OPTS +=3D -DFEATURE_spatialaudio=3DON<br>else<br>QT6MULTIMED=
IA_CONF_OPTS +=3D -DFEATURE_spatialaudio=3DOFF<br>endif<br></div><div><br><=
/div><div>And maybe we could add this now even though quick3d is not added =
yet?:<br></div><div><br>ifeq ($(BR2_PACKAGE_QT6QUICK3D),y)<br>QT6MULTIMEDIA=
_DEPENDENCIES +=3D qt6quick3d<br>endif</div><div><br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
+$(eval $(cmake-package))<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000fa10060622389963--

--===============4027559738040195161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4027559738040195161==--
