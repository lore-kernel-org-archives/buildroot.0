Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC68CCF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 09:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 928F84063B;
	Sun, 22 Sep 2024 09:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_rNz2eajkNt; Sun, 22 Sep 2024 09:22:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B39B40648
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B39B40648;
	Sun, 22 Sep 2024 09:22:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D2C5C1BF4D6
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B784440022
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X25zrZAqniNk for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 09:21:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C41CF400CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C41CF400CF
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C41CF400CF
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 09:21:56 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-6dfff346a83so13513507b3.2
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 02:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726996915; x=1727601715;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T0TW7yVeaBierNT/SigxGQjjfBZ9w/pxE7m6Rd9uDjc=;
 b=MnT/o/55NsaU+sqZHcR8lfATE3kibc6x/pvXBsyDUoP33F78KIvLFR7KZxJpb7IBx1
 ALMk88r2Rah2BXmJbd6husvfFP4HWYUHkU4ZYlyFNnlfrNcBgKbUrZoqFPOAz4WPFkaM
 gFOh724XbU9Cnf8TA3gjtfyyaVYi/b4ovgf4BsI1skFAc3kdcqqRZEpk4/9FW487y6CT
 aKjVdU9KMXTSzK8d3AWoUdyVZMaRjDB0zZJYokL7X4T2x3FTQtzlv/2upYm5Bfy/IkjJ
 adX1G3e/euafrmy1axLH7Y1i3H2n//oOWCFjYgrvJKQt1zcG+ct95+8+TqURalO++5lF
 58dA==
X-Gm-Message-State: AOJu0Yw4zQEvyerUbO+RfnlkuNz0mH9Q8sWWW6rEprXKWLfQLSFj99Jy
 AI5TT8pGWmeiKmzin1o2YHI0jE+wSrpoY/E/NsyiMjvMsjkcgkpwij/IRwY6n21QPGkT2mnV552
 N7EwkZGXC4nNNusuCVp9eEl+bdcs=
X-Google-Smtp-Source: AGHT+IFRI9+EHkB95u4MSsp2eWLSczQMvYBLMU+f4pFlBI+rZvPcwt0r9oO8V1eHVMjwY41xFG3VovfYIExIOn0hOD8=
X-Received: by 2002:a05:690c:f83:b0:6dd:f9ea:895f with SMTP id
 00721157ae682-6dfeed309a2mr73181467b3.12.1726996915376; Sun, 22 Sep 2024
 02:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240920160500.18551-1-baxiche@gmail.com>
In-Reply-To: <20240920160500.18551-1-baxiche@gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Sun, 22 Sep 2024 11:21:43 +0200
Message-ID: <CA+R_derRe3Pf0BdL3Y8ykcWjAZewrFJ2KjihXQ3C1axbAwvi2A@mail.gmail.com>
To: baxiche su <baxiche@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726996915; x=1727601715; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T0TW7yVeaBierNT/SigxGQjjfBZ9w/pxE7m6Rd9uDjc=;
 b=NAkmoCA5mSKhTUFzJPZro9DgP3p6A+Vn/tAvDcl/r1cJK04idQLWudKnrjiO/46X2f
 5aGdjhXRXN26wQuPonLT0lgxmG+KSy8G4GTcNcsVQ+LuhwCnZZh43aSFxDtTBAPWyP5k
 bEniegSmUQQrEE+HDJT9jFPwyzLi+G+EpuaRUyO4Jvt9BtyBvKwjV6ZvOUmoESysb1JV
 RuQP0JtyHdJHdIjSIEwVpAwSr4FflW1Eny/gGUg8AdJM0FRNaCSlYNroNaohX54gczR/
 ryuvtKsGTghYcQaARKGX4y8GQXsmEPnoz+lKMZe9UUoFFPzDN2rr7DTo4y05AnodJ2zf
 TxCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NAkmoCA5
Subject: Re: [Buildroot] [PATCH v3 1/1] package/qt6: add qt6 multimedia
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
Content-Type: multipart/mixed; boundary="===============7141543182925378714=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7141543182925378714==
Content-Type: multipart/alternative; boundary="000000000000ab5b760622b1cd5b"

--000000000000ab5b760622b1cd5b
Content-Type: text/plain; charset="UTF-8"

Hi Baxiche, Hi Thomas,

Baxiche, good to see you are working on getting this module upstream! I'll
do some testing and dig deeper into the details later.

I'm a but unsure about the non-qt dependencies, especially the kernel
feature dependencies.

You can also probably drop more of the license information, that does not
apply to things that don't end up on target.

I think it would be nice to be able to enable the examples for testing. The
same goes for the other Qt6 packages. Have you looked into that?

What do you think about adding options to enable the tests, Thomas?

But until I get the time to do some testing and checking, here are some
things I noticed while reading through your patch:

fre. 20. sep. 2024 kl. 18:06 skrev baxiche su <baxiche@gmail.com>:

> Signed-off-by: baxiche su <baxiche@gmail.com>
> ---
>  DEVELOPERS                                   |   3 +
>  package/qt6/Config.in                        |   1 +
>  package/qt6/qt6multimedia/Config.in          | 117 ++++++++++++++++
>  package/qt6/qt6multimedia/qt6multimedia.hash |  26 ++++
>  package/qt6/qt6multimedia/qt6multimedia.mk   | 137 +++++++++++++++++++
>  5 files changed, 284 insertions(+)
>  create mode 100644 package/qt6/qt6multimedia/Config.in
>  create mode 100644 package/qt6/qt6multimedia/qt6multimedia.hash
>  create mode 100644 package/qt6/qt6multimedia/qt6multimedia.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ea4ee3377f..5b6f60444d 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -343,6 +343,9 @@ F:  package/tcpdump/
>  F:     package/ti-uim/
>  F:     package/uhubctl/
>
> +N:     Baxiche Su <baxiche@gmail.com>
> +F:     package/qt6/qt6multimedia
>

The common pattern is to use a slash at the end of a directory entry:

package/qt6/qt6multimedia/


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
> index 0000000000..1aebef840d
> --- /dev/null
> +++ b/package/qt6/qt6multimedia/Config.in
> @@ -0,0 +1,117 @@
> +config BR2_PACKAGE_QT6MULTIMEDIA
> +       bool "qt6multimedia"
> +       select BR2_PACKAGE_QT6BASE_GUI
> +       select BR2_PACKAGE_QT6BASE_NETWORK
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

You wrap the help text at 62 characters i think. I think it is better to
wrap it at 62 + 2 + tab(8 chars). See manual.

> +
> +         https://doc.qt.io/qt-6/qtmultimedia-index.html
> +
> +if BR2_PACKAGE_QT6MULTIMEDIA
> +
> +comment "alsa support requires disabling pulseaudio"
> +       depends on BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
> +
> +config BR2_PACKAGE_QT6MULTIMEDIA_ALSA
> +       bool "alsa support"
> +       # qt6-multimedia audio backend requires selection
> +       # of either PulseAudio or ALSA.
>

Maybe this could be reflected in a choice instead?


> +       depends on !BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
> +       select BR2_PACKAGE_ALSA_LIB
> +       help
> +         This option select Alsa as audio backend.
> +
> +config BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
> +       bool "ffmpeg plugin"
>

Does it make sense to make this a choice between ffmpeg and gstreamer
instead?


> +       # qt6-multimedia ffmpeg plugin needs
> +       # qt6base-concurrent, PulseAudio and ffmpeg-swcale.
>

I think this comment just repeats the info bellow. Can we drop it?


> +       select BR2_PACKAGE_QT6BASE_CONCURRENT
> +       select BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
> +       select BR2_PACKAGE_FFMPEG
> +       select BR2_PACKAGE_FFMPEG_SWSCALE
> +       select BR2_PACKAGE_PULSEAUDIO
>

I also like when the select statements are sorted alphabetically. Have you
ordered them this way intentionally?


> +       help
> +         This option enables ffmpeg media backend
> +
> +if BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
> +
> +comment "VAAPI support needs Linux DMA buffer feature"
> +       depends on !BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF
> +
>


> +config BR2_PACKAGE_QT6MULTIMEDIA_VAAPI
> +       bool "vaapi support"
> +       depends on BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF
>
+       select BR2_PACKAGE_LIBVA
> +       # ffmpeg-vaapi support needs qt6base-opengl
> +       select BR2_PACKAGE_QT6BASE_OPENGL
> +       help
> +         This option enables the vaapi support.
> +endif
> +
> +config BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER
> +       bool "gstreamer plugin"
> +       # gstreamer 1.x and gst-plugins-base-app are required
> +       # for gstreamer support in qt6-multimedia
> +       select BR2_PACKAGE_GSTREAMER1
> +       select BR2_PACKAGE_GST1_PLUGINS_BASE
> +       select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
> +       help
> +         This option enables gstreamer media backend
> +
> +if BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER
> +
> +comment "GStreamer OpenGL support needs an OpenGL-capable backend"
> +       depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
> +
> +config BR2_PACKAGE_QT6MULTIMEDIA_GST1_PLUGINS_OPENGL
> +       bool "opengl support"
> +       depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
> +       select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
> +       help
> +         This option enables gstreamer-opengl support
> +
> +config BR2_PACKAGE_QT6MULTIMEDIA_GST1_PLUGINS_PHOTOGRAPHY
> +       bool "photography support"
> +       select BR2_PACKAGE_GST1_PLUGINS_BAD
> +       help
> +         This option enables gstreamer-photography support
> +
> +endif
> +
> +comment "Linux DMA buffer support needs DMA buffer feature of libgbm"
> +       depends on !BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
> +
> +config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF
> +       bool "linux dma buffer support"
> +       depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
>
+       # qt6 configure script needs EGL to check
> +       # for linux dma buffer support
> +       depends on BR2_PACKAGE_HAS_LIBEGL
> +       help
> +         This option enables the linux dma buffer support
> +
> +config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_V4L
> +       bool "v4l support"
> +       help
> +         This option enables the video for linux support
> +
> +config BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
>
+       bool "pulseaudio support"
> +       select BR2_PACKAGE_PULSEAUDIO
> +       help
> +         This option select PulseAudio as audio backend.
> +
> +config BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO
> +       bool "spatial audio module"
> +       help
> +         This option enables the Qt6SpatialAudio library.
> +
> +endif
> diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash
> b/package/qt6/qt6multimedia/qt6multimedia.hash
> new file mode 100644
> index 0000000000..b63aedc1d9
> --- /dev/null
> +++ b/package/qt6/qt6multimedia/qt6multimedia.hash
> @@ -0,0 +1,26 @@
> +# Hash from:
> https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtmultimedia-everywhere-src-6.7.2.tar.xz.sha256
> +sha256
> <https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtmultimedia-everywhere-src-6.7.2.tar.xz.sha256+sha256>
> 8ef835115acb9a1d3d2c9f23cfacb43f2c537e3786a8ab822299a2a7765651d3
> qtmultimedia-everywhere-src-6.7.2.tar.xz
> +
> +# Hashes for license files
> +sha256  f32fb3b417a194167cfad068223fc975ba96c5960513a10f66a3c28720aec1df
> LICENSES/BSD-2-Clause.txt
> +sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
> LICENSES/BSD-3-Clause.txt
> +sha256  1f1b677d26ab73e159a55c3a914cf12d888e18a9d0d469fedab4aa6e5a48b1c0
> LICENSES/BSD-Source-Code.txt
> +sha256  84c6ef3ea9e3254a54d0acf5d3e0c61ae011b8fef7dd6940591cf060e6380a8f
> LICENSES/BSL-1.0.txt
> +sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4
> LICENSES/GFDL-1.3-no-invariants-only.txt
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> LICENSES/GPL-2.0-only.txt
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
> LICENSES/GPL-3.0-only.txt
> +sha256  7658542977bfdced9e1059a6c934ce4281de76d103b831007b825917dc62511a
> LICENSES/IJG.txt
> +sha256  f2ec607f67bb0dd3053b49835b02110d5cd0f8eb6da3aac4dc0b142a6b299be9
> LICENSES/ISC.txt
> +sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb
> LICENSES/LGPL-2.1-or-later.txt
> +sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768
> LICENSES/LGPL-3.0-only.txt
> +sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0
> LICENSES/MIT.txt
> +sha256  66a3107d5ad6a058aab753eaac2047ccb2ed0e39465dd0fe5844da3e300d5172
> LICENSES/MPL-2.0.txt
> +sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2
> LICENSES/Qt-GPL-exception-1.0.txt
> +sha256  bfb1112d49db5b1daecdfef24bd7e2f3ea0bafb33aa67aa0ab51e2bf8407c03d
> LICENSES/Zlib.txt
> +sha256  85da7c29c2d2f2e6b3116b1219584cb513474cab797b3312a779be4c2181e51e
> src/3rdparty/eigen/COPYING.BSD
> +sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85
> src/3rdparty/eigen/COPYING.MPL2
> +sha256  8b69cf3ac3ddd34df478c4ae6eaacf5e6c63ea7ee6403c8dad97e4d1438bc3c4
> src/3rdparty/eigen/COPYRIGHTS
> +sha256  b522f821df94da3bad917e98ef04817b3af421c3b8c23e8247ae7e517b289934
> src/3rdparty/pffft/COPYRIGHTS
> +sha256  a46200592eb193853527250da098e6bb0c75424e7a2c7db8da526c4f301c3d88
> src/3rdparty/pffft/LICENSE
> +sha256  2513c5ad87ce9e7feed2c9a159d336f0a0d12ff93adcd411f7a15a1ab678f7ac
> src/3rdparty/resonance-audio/COPYRIGHTS
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30
> src/3rdparty/resonance-audio/LICENSE
> diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk
> b/package/qt6/qt6multimedia/qt6multimedia.mk
> new file mode 100644
> index 0000000000..ec81abc1de
> --- /dev/null
> +++ b/package/qt6/qt6multimedia/qt6multimedia.mk
> @@ -0,0 +1,137 @@
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
> +QT6MULTIMEDIA_SUPPORTS_IN_SOURCE_BUILD = NO
> +QT6MULTIMEDIA_CMAKE_BACKEND = ninja
> +
> +QT6MULTIMEDIA_LICENSE = \
> +    BSD-3-Clause (buildsystem, examples, pfft,  snippets), \
> +    GFDL-1.3-no-invariants (docs), \
> +    GPL-3.0 (tests), \
> +    GPL-3.0 with Qt-GPL-exception-1.0 (utils), \
> +    LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)
> +
> +QT6MULTIMEDIA_LICENSE_FILES = \
> +    LICENSES/BSD-3-Clause.txt \
> +    LICENSES/GFDL-1.3-no-invariants-only.txt \
> +    LICENSES/GPL-2.0-only.txt \
> +    LICENSES/GPL-3.0-only.txt \
> +    LICENSES/LGPL-3.0-only.txt \
> +    LICENSES/Qt-GPL-exception-1.0.txt \
> +
> +QT6MULTIMEDIA_DEPENDENCIES = \
> +    qt6base \
> +    qt6shadertools
> +
> +QT6MULTIMEDIA_CONF_OPTS = \
> +    -DQT_HOST_PATH=$(HOST_DIR) \
> +    -DQT_BUILD_EXAMPLES=OFF \
> +    -DQT_BUILD_TESTS=OFF \
>
+    -DFEATURE_alsa=OFF \
>

I think is better to gather all code related to one option in one place. So
this should be moved down into the ifeq-statement for alsa.
The same goes for the other options.

+    -DFEATURE_ffmpeg=OFF \
> +    -DFEATURE_gstreamer=OFF \
> +    -DFEATURE_gstreamer_1_0=OFF \
> +    -DFEATURE_gstreamer_app=OFF \
> +    -DFEATURE_gstreamer_gl=OFF \
> +    -DFEATURE_gstreamer_photography=OFF \
> +    -DFEATURE_linux_dmabuf=OFF \
> +    -DFEATURE_linux_v4l=OFF \
> +    -DFEATURE_pulseaudio=OFF \
> +    -DFEATURE_spatialaudio=OFF \
> +    -DFEATURE_spatialaudio_quick3d=OFF \
> +    -DFEATURE_vaapi=OFF
> +
> +# for multimedia quick module
> +ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
> +QT6MULTIMEDIA_DEPENDENCIES += qt6declarative
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_ALSA),y)
> +QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_alsa=ON
> +QT6MULTIMEDIA_DEPENDENCIES += alsa-lib
>

Gather all code related to the alsa option here:

else
QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_alsa=OFF


> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG),y)
> +QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
> +QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
> +QT6MULTIMEDIA_LICENSE += , \
> +    BSL-1.0 (ffmpeg-boost), \
> +    IJG (ffmpeg-libjpeg), \
> +    LGPL-2.1+ and BSD-3-Clause and BSD-2-Clause and BSD-Source-Code and
> ISC and MIT and MPL-2.0 (ffmpeg), \
> +    Zlib (ffmpeg-zlib)
> +QT6MULTIMEDIA_LICENSE_FILES += \
> +    LICENSES/BSD-2-Clause.txt \
> +    LICENSES/BSD-Source-Code.txt \
> +    LICENSES/BSL-1.0.txt \
> +    LICENSES/IJG.txt \
> +    LICENSES/ISC.txt \
> +    LICENSES/LGPL-2.1-or-later.txt \
> +    LICENSES/MIT.txt \
> +    LICENSES/MPL-2.0.txt \
> +    LICENSES/Zlib.txt
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER),y)
> +QT6MULTIMEDIA_CONF_OPTS += \
> +    -DFEATURE_gstreamer=ON \
> +    -DFEATURE_gstreamer_1_0=ON \
> +    -DFEATURE_gstreamer_app=ON
> +QT6MULTIMEDIA_DEPENDENCIES += gstreamer1 gst1-plugins-base
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_GST_PLUGINS_PHOTOGRAPHY),y)
> +QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_gstreamer_photography=ON
> +QT6MULTIMEDIA_DEPENDENCIES += gst1-plugins-bad
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF),y)
> +QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_linux_dmabuf=ON
> +QT6MULTIMEDIA_DEPENDENCIES += libgbm libegl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_LINUX_V4L),y)
> +QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_linux_v4l=ON
> +QT6MULTIMEDIA_DEPENDENCIES += linux
>

I was probably wrong here in my last comment, I don't think the dependency
on linux is necessary... I have no experience with dependencies on kernel
config, so you should ask Thomas or someone else about how dependencies on
linux config options are handled. Maybe this is relevant?:

https://www.marcusfolkesson.se/til/buildroot-libfoo-linux-config-fixup/


> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO),y)
> +QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_pulseaudio=ON
> +QT6MULTIMEDIA_DEPENDENCIES += pulseaudio
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO),y)
> +QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio=ON
> +QT6MULTIMEDIA_LICENSE += , \
> +    Apache-2.0 (resonance-audio, eigen), \
> +    LGPL-3.0 or GPL-3.0 (resonance-audio, spatialaudio,
> spatialaudioquick3d), \
> +    MPL-2.0 and BSD-3-Clause (eigen)
> +QT6MULTIMEDIA_LICENSE_FILES += \
> +    LICENSES/MPL-2.0.txt \
> +    src/3rdparty/eigen/COPYING.BSD \
> +    src/3rdparty/eigen/COPYING.MPL2 \
> +    src/3rdparty/eigen/COPYRIGHTS \
> +    src/3rdparty/pffft/COPYRIGHTS \
> +    src/3rdparty/pffft/LICENSE \
> +    src/3rdparty/resonance-audio/COPYRIGHTS \
> +    src/3rdparty/resonance-audio/LICENSE
> +
> +# for spatialaudio quick3d module
> +ifeq ($(BR2_PACKAGE_QT6QUICK3D),y)
> +QT6MULTIMEDIA_DEPENDENCIES += qt6quick3d
> +QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio_quick3d=ON
> +endif
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_VAAPI),y)
> +QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_vaapi=ON
> +QT6MULTIMEDIA_DEPENDENCIES += libva
> +endif
> +
> +$(eval $(cmake-package))
> --
> 2.34.1
>
>

--000000000000ab5b760622b1cd5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Baxiche, Hi Thomas,<br></div><div><br></div><div>B=
axiche, good to see you are working on getting this module upstream! I&#39;=
ll do some testing and dig deeper into the details later.<br></div><div><br=
></div><div>I&#39;m a but unsure about the non-qt dependencies, especially =
the kernel feature dependencies.</div><div><br></div><div>You can also prob=
ably drop more of the license information, that does not apply to things th=
at don&#39;t end up on target.</div><div><br></div><div>I think it would be=
 nice to be able to enable the examples for testing. The same goes for the =
other Qt6 packages. Have you looked into that?<br></div><div><br></div><div=
>What do you think about adding options to enable the tests, Thomas?</div><=
div><br></div><div>But until I get the time to do some testing and checking=
, here are some things I noticed while reading through your patch:<br></div=
><div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">fre. 20. sep. 2024 kl. 18:06 skrev baxiche su &lt;<a href=3D"mailto:b=
axiche@gmail.com">baxiche@gmail.com</a>&gt;:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Signed-off-by: baxiche su &lt;<a href=3D"mailt=
o:baxiche@gmail.com" target=3D"_blank">baxiche@gmail.com</a>&gt;<br>
---<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A03 +<br>
=C2=A0package/qt6/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0package/qt6/qt6multimedia/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 117 ++++++++++++++++<br>
=C2=A0package/qt6/qt6multimedia/qt6multimedia.hash |=C2=A0 26 ++++<br>
=C2=A0package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk" rel=3D"=
noreferrer" target=3D"_blank">qt6multimedia.mk</a>=C2=A0 =C2=A0| 137 ++++++=
+++++++++++++<br>
=C2=A05 files changed, 284 insertions(+)<br>
=C2=A0create mode 100644 package/qt6/qt6multimedia/Config.in<br>
=C2=A0create mode 100644 package/qt6/qt6multimedia/qt6multimedia.hash<br>
=C2=A0create mode 100644 package/qt6/qt6multimedia/<a href=3D"http://qt6mul=
timedia.mk" rel=3D"noreferrer" target=3D"_blank">qt6multimedia.mk</a><br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index ea4ee3377f..5b6f60444d 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -343,6 +343,9 @@ F:=C2=A0 package/tcpdump/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/ti-uim/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/uhubctl/<br>
<br>
+N:=C2=A0 =C2=A0 =C2=A0Baxiche Su &lt;<a href=3D"mailto:baxiche@gmail.com" =
target=3D"_blank">baxiche@gmail.com</a>&gt;<br>
+F:=C2=A0 =C2=A0 =C2=A0package/qt6/qt6multimedia<br></blockquote><div><br><=
/div><div>The common pattern is to use a slash at the end of a directory en=
try:</div><div><br></div><div>package/qt6/qt6multimedia/</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
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
index 0000000000..1aebef840d<br>
--- /dev/null<br>
+++ b/package/qt6/qt6multimedia/Config.in<br>
@@ -0,0 +1,117 @@<br>
+config BR2_PACKAGE_QT6MULTIMEDIA<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;qt6multimedia&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6BASE_GUI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6BASE_NETWORK<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6SHADERTOOLS<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and microphones.<br></blockquote><div><b=
r></div><div>You wrap the help text at 62 characters i think. I think it is=
 better to wrap it at 62=C2=A0+ 2=C2=A0+ tab(8 chars). See manual. <br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://doc.qt.io/qt-6/qtmult=
imedia-index.html" rel=3D"noreferrer" target=3D"_blank">https://doc.qt.io/q=
t-6/qtmultimedia-index.html</a><br>
+<br>
+if BR2_PACKAGE_QT6MULTIMEDIA<br>
+<br>
+comment &quot;alsa support requires disabling pulseaudio&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO=
<br>
+<br>
+config BR2_PACKAGE_QT6MULTIMEDIA_ALSA<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;alsa support&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# qt6-multimedia audio backend requires selecti=
on <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# of either PulseAudio or ALSA.<br>
</blockquote><div><br></div><div>Maybe this could be reflected in a choice =
instead?<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_QT6MULTIMEDI=
A_PULSEAUDIO<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_ALSA_LIB<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option select Alsa as audio backend=
.<br>
+<br>
+config BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;ffmpeg plugin&quot;<br></blockquote>=
<div><br></div><div>Does it make sense to make this a choice between ffmpeg=
 and gstreamer instead?<br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# qt6-multimedia ffmpeg plugin needs <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# qt6base-concurrent, PulseAudio and ffmpeg-swc=
ale.<br></blockquote><div><br></div><div>I think this comment just repeats =
the info bellow. Can we drop it?<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6BASE_CONCURRENT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_FFMPEG<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_FFMPEG_SWSCALE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PULSEAUDIO<br></blockquote><=
div><br></div><div>I also like when the select statements are sorted alphab=
etically. Have you ordered them this way intentionally?<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option enables ffmpeg media backend=
<br>
+<br>
+if BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG<br>
+<br>
+comment &quot;VAAPI support needs Linux DMA buffer feature&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA=
_BUF<br>
+<br></blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+config BR2_PACKAGE_QT6MULTIMEDIA_VAAPI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;vaapi support&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_=
BUF <br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBVA<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# ffmpeg-vaapi support needs qt6base-opengl<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6BASE_OPENGL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option enables the vaapi support.<b=
r>
+endif<br>
+<br>
+config BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;gstreamer plugin&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# gstreamer 1.x and gst-plugins-base-app are re=
quired <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# for gstreamer support in qt6-multimedia<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_GSTREAMER1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_GST1_PLUGINS_BASE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option enables gstreamer media back=
end<br>
+<br>
+if BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER<br>
+<br>
+comment &quot;GStreamer OpenGL support needs an OpenGL-capable backend&quo=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_HAS_LIBGL &amp;&amp; !B=
R2_PACKAGE_HAS_LIBGLES<br>
+<br>
+config BR2_PACKAGE_QT6MULTIMEDIA_GST1_PLUGINS_OPENGL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;opengl support&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE=
_HAS_LIBGLES<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option enables gstreamer-opengl sup=
port<br>
+<br>
+config BR2_PACKAGE_QT6MULTIMEDIA_GST1_PLUGINS_PHOTOGRAPHY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;photography support&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_GST1_PLUGINS_BAD<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option enables gstreamer-photograph=
y support<br>
+<br>
+endif<br>
+<br>
+comment &quot;Linux DMA buffer support needs DMA buffer feature of libgbm&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_=
BUF<br>
+<br>
+config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;linux dma buffer support&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_B=
UF <br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# qt6 configure script needs EGL to check <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# for linux dma buffer support<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HAS_LIBEGL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option enables the linux dma buffer=
 support<br>
+<br>
+config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_V4L<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;v4l support&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option enables the video for linux =
support<br>
+<br>
+config BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO <br></blockquote><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;pulseaudio support&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PULSEAUDIO<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option select PulseAudio as audio b=
ackend.<br>
+<br>
+config BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;spatial audio module&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option enables the Qt6SpatialAudio =
library.<br>
+<br>
+endif<br>
diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6=
multimedia/qt6multimedia.hash<br>
new file mode 100644<br>
index 0000000000..b63aedc1d9<br>
--- /dev/null<br>
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash<br>
@@ -0,0 +1,26 @@<br>
+# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.7/6.=
7.2/submodules/qtmultimedia-everywhere-src-6.7.2.tar.xz.sha256+sha256" rel=
=3D"noreferrer" target=3D"_blank">https://download.qt.io/official_releases/=
qt/6.7/6.7.2/submodules/qtmultimedia-everywhere-src-6.7.2.tar.xz.sha256<br>
+sha256</a>=C2=A0 8ef835115acb9a1d3d2c9f23cfacb43f2c537e3786a8ab822299a2a77=
65651d3=C2=A0 qtmultimedia-everywhere-src-6.7.2.tar.xz<br>
+<br>
+# Hashes for license files<br>
+sha256=C2=A0 f32fb3b417a194167cfad068223fc975ba96c5960513a10f66a3c28720aec=
1df=C2=A0 LICENSES/BSD-2-Clause.txt<br>
+sha256=C2=A0 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1d=
cce=C2=A0 LICENSES/BSD-3-Clause.txt<br>
+sha256=C2=A0 1f1b677d26ab73e159a55c3a914cf12d888e18a9d0d469fedab4aa6e5a48b=
1c0=C2=A0 LICENSES/BSD-Source-Code.txt<br>
+sha256=C2=A0 84c6ef3ea9e3254a54d0acf5d3e0c61ae011b8fef7dd6940591cf060e6380=
a8f=C2=A0 LICENSES/BSL-1.0.txt<br>
+sha256=C2=A0 110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b20=
6a4=C2=A0 LICENSES/GFDL-1.3-no-invariants-only.txt<br>
+sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880=
643=C2=A0 LICENSES/GPL-2.0-only.txt<br>
+sha256=C2=A0 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b=
903=C2=A0 LICENSES/GPL-3.0-only.txt<br>
+sha256=C2=A0 7658542977bfdced9e1059a6c934ce4281de76d103b831007b825917dc625=
11a=C2=A0 LICENSES/IJG.txt<br>
+sha256=C2=A0 f2ec607f67bb0dd3053b49835b02110d5cd0f8eb6da3aac4dc0b142a6b299=
be9=C2=A0 LICENSES/ISC.txt<br>
+sha256=C2=A0 fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f5=
8fb=C2=A0 LICENSES/LGPL-2.1-or-later.txt<br>
+sha256=C2=A0 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464=
768=C2=A0 LICENSES/LGPL-3.0-only.txt<br>
+sha256=C2=A0 b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0=
cc0=C2=A0 LICENSES/MIT.txt<br>
+sha256=C2=A0 66a3107d5ad6a058aab753eaac2047ccb2ed0e39465dd0fe5844da3e300d5=
172=C2=A0 LICENSES/MPL-2.0.txt<br>
+sha256=C2=A0 40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b053084=
6b2=C2=A0 LICENSES/Qt-GPL-exception-1.0.txt<br>
+sha256=C2=A0 bfb1112d49db5b1daecdfef24bd7e2f3ea0bafb33aa67aa0ab51e2bf8407c=
03d=C2=A0 LICENSES/Zlib.txt<br>
+sha256=C2=A0 85da7c29c2d2f2e6b3116b1219584cb513474cab797b3312a779be4c2181e=
51e=C2=A0 src/3rdparty/eigen/COPYING.BSD<br>
+sha256=C2=A0 fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863=
e85=C2=A0 src/3rdparty/eigen/COPYING.MPL2<br>
+sha256=C2=A0 8b69cf3ac3ddd34df478c4ae6eaacf5e6c63ea7ee6403c8dad97e4d1438bc=
3c4=C2=A0 src/3rdparty/eigen/COPYRIGHTS<br>
+sha256=C2=A0 b522f821df94da3bad917e98ef04817b3af421c3b8c23e8247ae7e517b289=
934=C2=A0 src/3rdparty/pffft/COPYRIGHTS<br>
+sha256=C2=A0 a46200592eb193853527250da098e6bb0c75424e7a2c7db8da526c4f301c3=
d88=C2=A0 src/3rdparty/pffft/LICENSE<br>
+sha256=C2=A0 2513c5ad87ce9e7feed2c9a159d336f0a0d12ff93adcd411f7a15a1ab678f=
7ac=C2=A0 src/3rdparty/resonance-audio/COPYRIGHTS<br>
+sha256=C2=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523=
d30=C2=A0 src/3rdparty/resonance-audio/LICENSE<br>
diff --git a/package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk" =
rel=3D"noreferrer" target=3D"_blank">qt6multimedia.mk</a> b/package/qt6/qt6=
multimedia/<a href=3D"http://qt6multimedia.mk" rel=3D"noreferrer" target=3D=
"_blank">qt6multimedia.mk</a><br>
new file mode 100644<br>
index 0000000000..ec81abc1de<br>
--- /dev/null<br>
+++ b/package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk" rel=3D"=
noreferrer" target=3D"_blank">qt6multimedia.mk</a><br>
@@ -0,0 +1,137 @@<br>
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
+QT6MULTIMEDIA_SUPPORTS_IN_SOURCE_BUILD =3D NO<br>
+QT6MULTIMEDIA_CMAKE_BACKEND =3D ninja<br>
+<br>
+QT6MULTIMEDIA_LICENSE =3D \<br>
+=C2=A0 =C2=A0 BSD-3-Clause (buildsystem, examples, pfft,=C2=A0 snippets), =
\<br>
+=C2=A0 =C2=A0 GFDL-1.3-no-invariants (docs), \<br>
+=C2=A0 =C2=A0 GPL-3.0 (tests), \<br>
+=C2=A0 =C2=A0 GPL-3.0 with Qt-GPL-exception-1.0 (utils), \<br>
+=C2=A0 =C2=A0 LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)<br>
+<br>
+QT6MULTIMEDIA_LICENSE_FILES =3D \<br>
+=C2=A0 =C2=A0 LICENSES/BSD-3-Clause.txt \<br>
+=C2=A0 =C2=A0 LICENSES/GFDL-1.3-no-invariants-only.txt \<br>
+=C2=A0 =C2=A0 LICENSES/GPL-2.0-only.txt \<br>
+=C2=A0 =C2=A0 LICENSES/GPL-3.0-only.txt \<br>
+=C2=A0 =C2=A0 LICENSES/LGPL-3.0-only.txt \<br>
+=C2=A0 =C2=A0 LICENSES/Qt-GPL-exception-1.0.txt \<br>
+<br>
+QT6MULTIMEDIA_DEPENDENCIES =3D \<br>
+=C2=A0 =C2=A0 qt6base \<br>
+=C2=A0 =C2=A0 qt6shadertools<br>
+<br>
+QT6MULTIMEDIA_CONF_OPTS =3D \<br>
+=C2=A0 =C2=A0 -DQT_HOST_PATH=3D$(HOST_DIR) \<br>
+=C2=A0 =C2=A0 -DQT_BUILD_EXAMPLES=3DOFF \<br>
+=C2=A0 =C2=A0 -DQT_BUILD_TESTS=3DOFF \ <br></blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 -DFEATURE_alsa=3DOFF \<br>
</blockquote><div><br></div>I think is better to gather all code related to=
 one option in one place. So this should be moved down into the ifeq-statem=
ent for alsa.</div><div class=3D"gmail_quote">The same goes for the other o=
ptions.<br></div><div class=3D"gmail_quote"><br><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">+=C2=A0 =C2=A0 -DFEATURE_ffmpeg=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_gstreamer=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_gstreamer_1_0=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_gstreamer_app=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_gstreamer_gl=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_gstreamer_photography=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_linux_dmabuf=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_linux_v4l=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_pulseaudio=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_spatialaudio=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_spatialaudio_quick3d=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_vaapi=3DOFF<br>
+<br>
+# for multimedia quick module<br>
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D qt6declarative<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_ALSA),y)<br>
+QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_alsa=3DON<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D alsa-lib<br>
</blockquote><div><br></div><div>Gather all code related to the alsa option=
 here:</div><div><br></div><div>else</div><div>QT6MULTIMEDIA_CONF_OPTS +=3D=
 -DFEATURE_alsa=3DOFF<br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG),y)<br>
+QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_ffmpeg=3DON<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D ffmpeg<br>
+QT6MULTIMEDIA_LICENSE +=3D , \<br>
+=C2=A0 =C2=A0 BSL-1.0 (ffmpeg-boost), \<br>
+=C2=A0 =C2=A0 IJG (ffmpeg-libjpeg), \<br>
+=C2=A0 =C2=A0 LGPL-2.1+ and BSD-3-Clause and BSD-2-Clause and BSD-Source-C=
ode and ISC and MIT and MPL-2.0 (ffmpeg), \<br>
+=C2=A0 =C2=A0 Zlib (ffmpeg-zlib)<br>
+QT6MULTIMEDIA_LICENSE_FILES +=3D \<br>
+=C2=A0 =C2=A0 LICENSES/BSD-2-Clause.txt \<br>
+=C2=A0 =C2=A0 LICENSES/BSD-Source-Code.txt \<br>
+=C2=A0 =C2=A0 LICENSES/BSL-1.0.txt \<br>
+=C2=A0 =C2=A0 LICENSES/IJG.txt \<br>
+=C2=A0 =C2=A0 LICENSES/ISC.txt \<br>
+=C2=A0 =C2=A0 LICENSES/LGPL-2.1-or-later.txt \<br>
+=C2=A0 =C2=A0 LICENSES/MIT.txt \<br>
+=C2=A0 =C2=A0 LICENSES/MPL-2.0.txt \<br>
+=C2=A0 =C2=A0 LICENSES/Zlib.txt<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER),y)<br>
+QT6MULTIMEDIA_CONF_OPTS +=3D \<br>
+=C2=A0 =C2=A0 -DFEATURE_gstreamer=3DON \<br>
+=C2=A0 =C2=A0 -DFEATURE_gstreamer_1_0=3DON \<br>
+=C2=A0 =C2=A0 -DFEATURE_gstreamer_app=3DON <br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D gstreamer1 gst1-plugins-base<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_GST_PLUGINS_PHOTOGRAPHY),y)<br>
+QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_gstreamer_photography=3DON<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D gst1-plugins-bad<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF),y)<br>
+QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_linux_dmabuf=3DON<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D libgbm libegl<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_LINUX_V4L),y)<br>
+QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_linux_v4l=3DON<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D linux<br></blockquote><div><br></div><div>=
I was probably wrong here in my last comment, I don&#39;t think the depende=
ncy on linux is necessary... I have no experience with dependencies on kern=
el config, so you should ask Thomas or someone else about how dependencies =
on linux config options are handled. Maybe this is relevant?:</div><div><br=
></div><div><a href=3D"https://www.marcusfolkesson.se/til/buildroot-libfoo-=
linux-config-fixup/">https://www.marcusfolkesson.se/til/buildroot-libfoo-li=
nux-config-fixup/</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO),y)<br>
+QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_pulseaudio=3DON<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D pulseaudio<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO),y)<br>
+QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_spatialaudio=3DON<br>
+QT6MULTIMEDIA_LICENSE +=3D , \<br>
+=C2=A0 =C2=A0 Apache-2.0 (resonance-audio, eigen), \<br>
+=C2=A0 =C2=A0 LGPL-3.0 or GPL-3.0 (resonance-audio, spatialaudio, spatiala=
udioquick3d), \<br>
+=C2=A0 =C2=A0 MPL-2.0 and BSD-3-Clause (eigen)<br>
+QT6MULTIMEDIA_LICENSE_FILES +=3D \<br>
+=C2=A0 =C2=A0 LICENSES/MPL-2.0.txt \<br>
+=C2=A0 =C2=A0 src/3rdparty/eigen/COPYING.BSD \<br>
+=C2=A0 =C2=A0 src/3rdparty/eigen/COPYING.MPL2 \<br>
+=C2=A0 =C2=A0 src/3rdparty/eigen/COPYRIGHTS \<br>
+=C2=A0 =C2=A0 src/3rdparty/pffft/COPYRIGHTS \<br>
+=C2=A0 =C2=A0 src/3rdparty/pffft/LICENSE \<br>
+=C2=A0 =C2=A0 src/3rdparty/resonance-audio/COPYRIGHTS \<br>
+=C2=A0 =C2=A0 src/3rdparty/resonance-audio/LICENSE<br>
+<br>
+# for spatialaudio quick3d module<br>
+ifeq ($(BR2_PACKAGE_QT6QUICK3D),y)<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D qt6quick3d<br>
+QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_spatialaudio_quick3d=3DON<br>
+endif<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_VAAPI),y)<br>
+QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_vaapi=3DON<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D libva<br>
+endif<br>
+<br>
+$(eval $(cmake-package))<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000ab5b760622b1cd5b--

--===============7141543182925378714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7141543182925378714==--
