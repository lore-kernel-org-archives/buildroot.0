Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21FEC2BD09
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 07:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C97580EF1;
	Mon, 15 Jul 2024 07:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Fab9vgd0Wyj; Mon, 15 Jul 2024 07:45:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AD33811BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AD33811BF;
	Mon, 15 Jul 2024 07:45:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BAF41BF2B9
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 07:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5883E403B5
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 07:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4EO3BWZqAw9t for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 07:44:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DF388403A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF388403A1
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF388403A1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:44:50 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4265b7514fcso28398045e9.1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 00:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721029489; x=1721634289;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CObR1d0rWnkvE2GYskmk1KUMX5ZtCyUPVGWjwTA3vDg=;
 b=gO6Jf7RvLIGxUjp0pYbAvt7TGAlhvKBYQPnVmkDY4+vlI+w3lanACg6JGyqjhZu6T5
 CBpIfY39PnP2sZqDfJnqtF0610HFRKoo5CB0xwPXU49uIQ3pE9VKJLs8cOwZsw7H+pSH
 2uu33WxgmX//LyLxK3Slvvookx5NVOSNwtoRl96hrawp6a2NI1b5kGBMGqAmSK32mGzl
 GRXDeUVKqWNeQeb5oR4ljh3WizyR9Op7ZRlTtv9wYiz8XJzzq96LPQlkVvawC5eUhoRP
 /aj92I3bgmy+w9f5duTHIRCUIYekdVBuglyS8LL3Y22r8aSjsyPwZmUr0G3c/KYukDVz
 jvgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEXipgVB0qswxNcuBjEarObmrjEhk/LxsC8S0P0hRfPA0Zfmgw4tO4OVnHbJPTUoE5D+QcJ+erWFTZvLyJmXnSi+/S3vKo8Q==
X-Gm-Message-State: AOJu0YwrA+bX5IHeFUNmPrGqrMvg72ixB6WfVlZM3INZlIxYhBqrSxo6
 L+QdMgWd0Nak7l232AfWBOj1T4kdEnAriSERGli3Pm0yltwICJld7p1UDh/8+94=
X-Google-Smtp-Source: AGHT+IE2+bU27QkI6Jo88B8jnZ7oqMYmusxyMSSKKUXt+eCRK3Eonsmhq9cI814ilE0iZqd3JzEdtQ==
X-Received: by 2002:a05:600c:4f49:b0:424:aa83:ef27 with SMTP id
 5b1f17b1804b1-4279d9f289emr88124755e9.1.1721029488719; 
 Mon, 15 Jul 2024 00:44:48 -0700 (PDT)
Received: from [10.3.160.38]
 (laubervilliers-656-1-158-76.w82-127.abo.wanadoo.fr. [82.127.106.76])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e7751asm75899585e9.3.2024.07.15.00.44.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 00:44:48 -0700 (PDT)
Message-ID: <1c6eafa2-3d8c-4716-bafb-df6a47aa8751@mind.be>
Date: Mon, 15 Jul 2024 00:07:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <CACXRmJhGiYC3tN9+0hPhMsvO-DzvqTMPOB1HufaBzYszoT5eTg@mail.gmail.com>
 <20240207193123.3400214-1-thomas@devoogdt.com>
Content-Language: en-GB
In-Reply-To: <20240207193123.3400214-1-thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721029489; x=1721634289; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CObR1d0rWnkvE2GYskmk1KUMX5ZtCyUPVGWjwTA3vDg=;
 b=SbhEQGUf6OhhcNWByIWgxF+drPPdN4cP6RnAXZ2XtEc2QqsaBFTunnCdRoYDPRXlfh
 bPW/URLuvB9dhFRf2JD1D/TtgL5KGZ5bg5I6sysV5RsbOQET4K0lec57nEt7nKht8jpf
 EDvUeLNo3XSBASLko0l7Md2/IZKRRwH4vblHPXJpGsfVQbhKgMBLoDTKZ0vu5M2njOBk
 /ixDdZdAu4Kiyi3MmdOhH1Xr+fFbBfIqkBm3mHKcnztUd/zJRYXVUcVbozXjcQDDQ9r8
 vw6OjbaJMBiYjOO0rzL2VDgr/bmpGnHwqOysor4DnckVjRBxlPnvgv4FwTvzx5/yBQY8
 AcVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SbhEQGUf
Subject: Re: [Buildroot] [PATCH v9 1/2] package/cairo: move to the meson
 build system
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: eric.le.bihan.dev@free.fr, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, aperez@igalia.com,
 fontaine.fabrice@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/02/2024 20:31, Thomas Devoogdt wrote:
> - Moved BR2_PACKAGE_CAIRO_{SCRIPT,PS,PDF,XML} to Config.in.legacy
>    since they are not selectable anymore in the meson-build options.
>    BR2_PACKAGE_CAIRO_ZLIB serves for all of them now.
> 
> - Moved BR2_PACKAGE_CAIRO_SVG to Config.in.legacy since the PNG
>    option already selects that one. This is now in sync with the
>    meson build options.
> 
> - Note that the dependencies for the various options are slightly changed,
>    but there is not much mentioned about that, the meson introduction is done
>    in one big commit: [1].
> 
> - Added xlib_libXrender dependency, which was optional when using
>    autotools (--enable-xlib-xrender), but became mandatory when using
>    meson [2].
> 
> - Added two patches to fix cross compiling, upstream: [3]
> 
> [1]: https://gitlab.freedesktop.org/cairo/cairo/-/commit/596a82f2d185b101bd74645492821fe2f9e0daa0
> [2]: https://gitlab.freedesktop.org/cairo/cairo/-/blame/1.17.4/meson.build#L277
> [3]: https://gitlab.freedesktop.org/cairo/cairo/-/merge_requests/534
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
> v2: added -std=gnu11 (allow inline int declaration in if loop, 99 caused some directives problems)
> v3: enabled host-zlib, needed for librsvg
> v4: also added gnu11 for host-cairo compiling (fixes my compilation on a gcc 4.9.2 based system)
> v5: split in 3 commits: https://lore.kernel.org/buildroot/20240105101105.6a181dcd@windsurf/
> v6: fix host-zlib option (again)
> v7: reworked patch by moving the old config options to legacy and by restoring their original order
> v9: update git message wrt xlib_libXrender + made ipc_rmid_deferred_release false again by default
> ---
>   Config.in.legacy                              |  35 ++++
>   ...ping-of-run-check-for-IPC_RMID_DEFER.patch |  62 +++++++
>   ...p-IPC_RMID_DEFERRED_RELEASE-check-wh.patch |  42 +++++
>   package/cairo/Config.in                       |  28 +--
>   package/cairo/cairo.mk                        | 160 +++++-------------
>   package/libgtk2/Config.in                     |   5 +-
>   package/libgtk3/Config.in                     |   5 +-
>   package/librsvg/Config.in                     |   2 +-
>   package/libsvg-cairo/Config.in                |   2 +-
>   package/rrdtool/Config.in                     |   4 +-
>   10 files changed, 195 insertions(+), 150 deletions(-)
>   create mode 100644 package/cairo/0004-meson-allow-skipping-of-run-check-for-IPC_RMID_DEFER.patch
>   create mode 100644 package/cairo/0005-meson-always-skip-IPC_RMID_DEFERRED_RELEASE-check-wh.patch
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 82387338d9..431552afe7 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,41 @@ endif
>   
>   comment "Legacy options removed in 2024.02"
>   
> +config BR2_PACKAGE_CAIRO_SVG
> +	bool "cairo svg support"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_CAIRO_PNG
> +	help
> +	  Cairo SVG is compiled together with PNG, so no need to have this config.
> +
> +config BR2_PACKAGE_CAIRO_SCRIPT
> +	bool "cairo script support"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_CAIRO_ZLIB
> +	help
> +	  Cairo script got merged in to cairo zlib with the introduction of meson.
> +
> +config BR2_PACKAGE_CAIRO_PS
> +	bool "cairo postscript support"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_CAIRO_ZLIB
> +	help
> +	  Cairo PS got merged in to cairo zlib with the introduction of meson.
> +
> +config BR2_PACKAGE_CAIRO_PDF
> +	bool "cairo pdf support"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_CAIRO_ZLIB
> +	help
> +	  Cairo PDF got merged in to cairo zlib with the introduction of meson.
> +
> +config BR2_PACKAGE_CAIRO_XML
> +	bool "cairo xml support"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_CAIRO_ZLIB
> +	help
> +	  Cairo XML got merged in to cairo zlib with the introduction of meson.
> +
>   config BR2_KERNEL_HEADERS_4_14
>   	bool "kernel headers version 4.14.x are no longer supported"
>   	select BR2_LEGACY
> diff --git a/package/cairo/0004-meson-allow-skipping-of-run-check-for-IPC_RMID_DEFER.patch b/package/cairo/0004-meson-allow-skipping-of-run-check-for-IPC_RMID_DEFER.patch
> new file mode 100644
> index 0000000000..193a210391
> --- /dev/null
> +++ b/package/cairo/0004-meson-allow-skipping-of-run-check-for-IPC_RMID_DEFER.patch
> @@ -0,0 +1,62 @@
> +From 39cbc3c1f1caf558188bd2203c976bae8de2f6a7 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
> +Date: Thu, 25 Feb 2021 10:52:45 +0000
> +Subject: [PATCH] meson: allow skipping of run check for
> + IPC_RMID_DEFERRED_RELEASE
> +
> +The run check is particularly annoying in cross-compile scenarios,
> +so allow bypassing the check by having the user provide the value
> +via a cross file or native file:
> +
> +  [properties]
> +  ipc_rmid_deferred_release = true
> +
> +Closes #408
> +
> +Upstream: https://gitlab.freedesktop.org/cairo/cairo/-/commit/1bec56ea8a931e1ae1c74cc740134497ec365267
> +Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> +---
> + meson.build | 25 ++++++++++++++++++++-----
> + 1 file changed, 20 insertions(+), 5 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index b159b4071..5f593e54d 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -264,13 +264,28 @@ if x11_dep.found() and xext_dep.found()
> +     ['X11/extensions/shmstr.h', {'extra-headers': extra_headers}],
> +   ]
> +   deps += [x11_dep, xext_dep]
> +-  res = cc.run(files('meson-cc-tests/ipc_rmid_deferred_release.c'),
> +-    dependencies: [x11_dep, xext_dep],
> +-    name: 'shmctl IPC_RMID allowes subsequent attaches')
> +
> +-  if res.returncode() == 0
> +-    conf.set('IPC_RMID_DEFERRED_RELEASE', 1)
> ++  # Can skip the run check by providing the result in a cross file or
> ++  # native file as bool property value.
> ++  prop = meson.get_external_property('ipc_rmid_deferred_release', 'auto')
> ++  # We don't know the type of prop (bool, string) but need to differentiate
> ++  # between a set value (bool) or the fallback value (string), so convert to
> ++  # a string and chec the string value.
> ++  prop_str = '@0@'.format(prop)
> ++  if prop_str in ['true', 'false']
> ++    ipc_rmid_deferred_release = (prop_str == 'true')
> ++    message('IPC_RMID_DEFERRED_RELEASE:', ipc_rmid_deferred_release)
> ++  elif prop_str == 'auto'
> ++    res = cc.run(files('meson-cc-tests/ipc_rmid_deferred_release.c'),
> ++      dependencies: [x11_dep, xext_dep],
> ++      name: 'shmctl IPC_RMID allowes subsequent attaches')
> ++
> ++    ipc_rmid_deferred_release = (res.returncode() == 0)
> ++  else
> ++    error('Unexpected value for external property ipc_rmid_deferred_release: @0@'.format(prop_str))
> +   endif
> ++
> ++  conf.set10('IPC_RMID_DEFERRED_RELEASE', ipc_rmid_deferred_release)
> + endif
> +
> + if feature_conf.get('CAIRO_HAS_XLIB_SURFACE', 0) == 1
> +--
> +2.34.1
> +
> diff --git a/package/cairo/0005-meson-always-skip-IPC_RMID_DEFERRED_RELEASE-check-wh.patch b/package/cairo/0005-meson-always-skip-IPC_RMID_DEFERRED_RELEASE-check-wh.patch
> new file mode 100644
> index 0000000000..157508b704
> --- /dev/null
> +++ b/package/cairo/0005-meson-always-skip-IPC_RMID_DEFERRED_RELEASE-check-wh.patch
> @@ -0,0 +1,42 @@
> +From 8d5037ed642b02cdb018e49866aa286f30a7b59a Mon Sep 17 00:00:00 2001
> +From: Thomas Devoogdt <thomas@devoogdt.com>
> +Date: Mon, 5 Feb 2024 17:47:07 +0100
> +Subject: [PATCH] meson: always skip IPC_RMID_DEFERRED_RELEASE check when
> + cross-compiling
> +
> +../../br-test-pkg/bootlin-armv5-uclibc/build/cairo-1.17.4/meson.build:279:13:
> +ERROR: Can not run test applications in this cross environment.
> +
> +Commit 1bec56ea8a931e1ae1c74cc740134497ec365267 added support to define
> +ipc_rmid_deferred_release in a cross-compile config, but still kept
> +the default to auto, which anyhow results in an error when cross-compiling.
> +
> +There is only one usage of the ipc_rmid_deferred_release compile declarative
> +which was originally added in this commit: 5041b462d084de8552336275914d30c23bf5dd35.
> +
> +If ipc_rmid_deferred_release is set to FALSE, an additional XSync is performed.
> +This doesn't sound very harmful, so that is why this commit defaults to FALSE
> +and thus avoids any cross-compile errors.
> +
> +Upstream: https://gitlab.freedesktop.org/cairo/cairo/-/merge_requests/534
> +Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 9efe91978..6a670bf94 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -369,7 +369,7 @@ if x11_dep.found() and xext_dep.found()
> +
> +   # Can skip the run check by providing the result in a cross file or
> +   # native file as bool property value.
> +-  prop = meson.get_external_property('ipc_rmid_deferred_release', 'auto')
> ++  prop = meson.get_external_property('ipc_rmid_deferred_release', meson.is_cross_build() ? 'false' : 'auto')
> +   # We don't know the type of prop (bool, string) but need to differentiate
> +   # between a set value (bool) or the fallback value (string), so convert to
> +   # a string and check the string value.
> +--
> +2.34.1
> +
> diff --git a/package/cairo/Config.in b/package/cairo/Config.in
> index 0c87a2904b..c41a12fe81 100644
> --- a/package/cairo/Config.in
> +++ b/package/cairo/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_CAIRO
>   	select BR2_PACKAGE_FONTCONFIG
>   	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
>   	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_XORG7
>   	help
>   	  Cairo is a 2D graphics library with support for multiple
>   	  output devices. Currently supported output targets include
> @@ -15,34 +16,15 @@ config BR2_PACKAGE_CAIRO
>   
>   if BR2_PACKAGE_CAIRO
>   
> -config BR2_PACKAGE_CAIRO_PS
> -	bool "postscript support"
> -	select BR2_PACKAGE_ZLIB
> -	select BR2_PACKAGE_CAIRO_PDF
> -
> -config BR2_PACKAGE_CAIRO_PDF
> -	bool "pdf support"
> -	select BR2_PACKAGE_ZLIB
> -
>   config BR2_PACKAGE_CAIRO_PNG
> -	bool "png support"
> +	bool "png support (png and svg surfaces)"
>   	select BR2_PACKAGE_LIBPNG
> -	select BR2_PACKAGE_ZLIB
> -
> -config BR2_PACKAGE_CAIRO_SCRIPT
> -	bool "script support"
> -	select BR2_PACKAGE_CAIRO_PNG
> -
> -config BR2_PACKAGE_CAIRO_SVG
> -	bool "svg support"
> -	select BR2_PACKAGE_CAIRO_PNG
> -	select BR2_PACKAGE_CAIRO_PDF
>   
>   config BR2_PACKAGE_CAIRO_TEE
>   	bool "tee support"
>   
> -config BR2_PACKAGE_CAIRO_XML
> -	bool "xml support"
> -	select BR2_PACKAGE_CAIRO_PNG
> +config BR2_PACKAGE_CAIRO_ZLIB
> +	bool "zlib support (script, ps, pdf, and xml surfaces)"
> +	select BR2_PACKAGE_ZLIB
>   
>   endif
> diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
> index 4515b76075..3d2a67a6c5 100644
> --- a/package/cairo/cairo.mk
> +++ b/package/cairo/cairo.mk
> @@ -17,168 +17,96 @@ CAIRO_IGNORE_CVES += CVE-2019-6462
>   # 0002-Fix-mask-usage-in-image-compositor.patch
>   CAIRO_IGNORE_CVES += CVE-2020-35492
>   
> -CAIRO_CONF_ENV = LIBS="$(CAIRO_LIBS)"
> +CAIRO_CFLAGS = $(TARGET_CFLAGS)
> +CAIRO_LDFLAGS = $(TARGET_LDFLAGS)
>   
>   # relocation truncated to fit: R_68K_GOT16O
>   ifeq ($(BR2_m68k_cf),y)
> -CAIRO_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
> -endif
> -
> -ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),)
> -CAIRO_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DCAIRO_NO_MUTEX=1"
> +CAIRO_CFLAGS += -mxgot
>   endif
>   
>   # cairo can use C++11 atomics when available, so we need to link with
>   # libatomic for the architectures who need libatomic.
>   ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> -CAIRO_LIBS += -latomic
> +CAIRO_LDFLAGS += -latomic
>   endif
>   
>   CAIRO_CONF_OPTS = \
> -	--enable-trace=no \
> -	--enable-interpreter=no
> -
> -CAIRO_DEPENDENCIES = host-pkgconf fontconfig pixman
> +	-Dfontconfig=enabled \
> +	-Dtests=disabled \
> +	-Dspectre=disabled \
> +	-Dc_std=gnu11
> +CAIRO_DEPENDENCIES = \
> +	host-pkgconf \
> +	fontconfig \
> +	pixman
>   
>   # Just the bare minimum to make other host-* packages happy
>   HOST_CAIRO_CONF_OPTS = \
> -	--enable-trace=no \
> -	--enable-interpreter=no \
> -	--disable-directfb \
> -	--enable-ft \
> -	--enable-gobject \
> -	--disable-glesv2 \
> -	--disable-vg \
> -	--disable-xlib \
> -	--disable-xcb \
> -	--without-x \
> -	--disable-xlib-xrender \
> -	--disable-ps \
> -	--disable-pdf \
> -	--enable-png \
> -	--enable-script \
> -	--disable-svg \
> -	--disable-tee \
> -	--disable-xml
> +	-Dfontconfig=enabled \
> +	-Dfreetype=enabled \
> +	-Dpng=enabled \
> +	-Dtee=disabled \
> +	-Dxcb=disabled \
> +	-Dxlib=disabled \
> +	-Dzlib=enabled \
> +	-Dtests=disabled \
> +	-Dglib=enabled \
> +	-Dspectre=disabled \
> +	-Dc_std=gnu11
>   HOST_CAIRO_DEPENDENCIES = \
>   	host-freetype \
>   	host-fontconfig \
>   	host-libglib2 \
>   	host-libpng \
>   	host-pixman \
> -	host-pkgconf
> +	host-pkgconf \
> +	host-zlib
>   
> -# DirectFB svg support rely on Cairo and Cairo DirectFB support depends on
> -# DirectFB. Break circular dependency by disabling DirectFB support in Cairo
> -# (which is experimental)
> -ifeq ($(BR2_PACKAGE_DIRECTFB)x$(BR2_PACKAGE_DIRECTFB_SVG),yx)
> -CAIRO_CONF_OPTS += --enable-directfb
> -CAIRO_DEPENDENCIES += directfb
> -else
> -CAIRO_CONF_OPTS += --disable-directfb
> +ifeq ($(BR2_PACKAGE_LZO),y)
> +CAIRO_DEPENDENCIES += lzo
>   endif
>   
>   ifeq ($(BR2_PACKAGE_FREETYPE),y)
> -CAIRO_CONF_OPTS += --enable-ft
> +CAIRO_CONF_OPTS += -Dfreetype=enabled
>   CAIRO_DEPENDENCIES += freetype
>   else
> -CAIRO_CONF_OPTS += --disable-ft
> -endif
> -
> -ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> -CAIRO_DEPENDENCIES += libexecinfo
> -CAIRO_LIBS += -lexecinfo
> +CAIRO_CONF_OPTS += -Dfreetype=disabled
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
> -CAIRO_CONF_OPTS += --enable-gobject
> +CAIRO_CONF_OPTS += -Dglib=enabled
>   CAIRO_DEPENDENCIES += libglib2
>   else
> -CAIRO_CONF_OPTS += --disable-gobject
> -endif
> -
> -# Can use GL or GLESv2 but not both
> -ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
> -CAIRO_CONF_OPTS += --enable-gl --disable-glesv2
> -CAIRO_DEPENDENCIES += libgl
> -else
> -ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
> -CAIRO_CONF_OPTS += --disable-gl --enable-glesv2
> -CAIRO_DEPENDENCIES += libgles
> -else
> -CAIRO_CONF_OPTS += --disable-gl --disable-glesv2
> -endif
> -endif
> -
> -ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
> -CAIRO_CONF_OPTS += --enable-vg
> -CAIRO_DEPENDENCIES += libopenvg
> -else
> -CAIRO_CONF_OPTS += --disable-vg
> -endif
> -
> -ifeq ($(BR2_PACKAGE_LZO),y)
> -CAIRO_DEPENDENCIES += lzo
> +CAIRO_CONF_OPTS += -Dglib=disabled
>   endif
>   
>   ifeq ($(BR2_PACKAGE_XORG7),y)
> -CAIRO_CONF_OPTS += --enable-xlib --enable-xcb --with-x
> -CAIRO_DEPENDENCIES += xlib_libX11 xlib_libXext
> -else
> -CAIRO_CONF_OPTS += --disable-xlib --disable-xcb --without-x
> -endif
> -
> -ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
> -CAIRO_CONF_OPTS += --enable-xlib-xrender
> -CAIRO_DEPENDENCIES += xlib_libXrender
> -else
> -CAIRO_CONF_OPTS += --disable-xlib-xrender
> -endif
> -
> -ifeq ($(BR2_PACKAGE_CAIRO_PS),y)
> -CAIRO_CONF_OPTS += --enable-ps
> -CAIRO_DEPENDENCIES += zlib
> +CAIRO_CONF_OPTS += -Dxcb=enabled -Dxlib=enabled
> +CAIRO_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXrender
>   else
> -CAIRO_CONF_OPTS += --disable-ps
> -endif
> -
> -ifeq ($(BR2_PACKAGE_CAIRO_PDF),y)
> -CAIRO_CONF_OPTS += --enable-pdf
> -CAIRO_DEPENDENCIES += zlib
> -else
> -CAIRO_CONF_OPTS += --disable-pdf
> +CAIRO_CONF_OPTS += -Dxcb=disabled -Dxlib=disabled
>   endif
>   
>   ifeq ($(BR2_PACKAGE_CAIRO_PNG),y)
> -CAIRO_CONF_OPTS += --enable-png
> +CAIRO_CONF_OPTS += -Dpng=enabled
>   CAIRO_DEPENDENCIES += libpng
>   else
> -CAIRO_CONF_OPTS += --disable-png
> -endif
> -
> -ifeq ($(BR2_PACKAGE_CAIRO_SCRIPT),y)
> -CAIRO_CONF_OPTS += --enable-script
> -else
> -CAIRO_CONF_OPTS += --disable-script
> -endif
> -
> -ifeq ($(BR2_PACKAGE_CAIRO_SVG),y)
> -CAIRO_CONF_OPTS += --enable-svg
> -else
> -CAIRO_CONF_OPTS += --disable-svg
> +CAIRO_CONF_OPTS += -Dpng=disabled
>   endif
>   
>   ifeq ($(BR2_PACKAGE_CAIRO_TEE),y)
> -CAIRO_CONF_OPTS += --enable-tee
> +CAIRO_CONF_OPTS += -Dtee=enabled
>   else
> -CAIRO_CONF_OPTS += --disable-tee
> +CAIRO_CONF_OPTS += -Dtee=disabled
>   endif
>   
> -ifeq ($(BR2_PACKAGE_CAIRO_XML),y)
> -CAIRO_CONF_OPTS += --enable-xml
> +ifeq ($(BR2_PACKAGE_CAIRO_ZLIB),y)
> +CAIRO_CONF_OPTS += -Dzlib=enabled
> +CAIRO_DEPENDENCIES += zlib
>   else
> -CAIRO_CONF_OPTS += --disable-xml
> +CAIRO_CONF_OPTS += -Dzlib=disabled
>   endif
>   
> -$(eval $(autotools-package))
> -$(eval $(host-autotools-package))
> +$(eval $(meson-package))
> +$(eval $(host-meson-package))
> diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
> index f2888b2f51..f8821ba246 100644
> --- a/package/libgtk2/Config.in
> +++ b/package/libgtk2/Config.in
> @@ -9,9 +9,8 @@ config BR2_PACKAGE_LIBGTK2
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
>   	select BR2_PACKAGE_AT_SPI2_CORE
>   	select BR2_PACKAGE_CAIRO
> -	select BR2_PACKAGE_CAIRO_PS
> -	select BR2_PACKAGE_CAIRO_PDF
> -	select BR2_PACKAGE_CAIRO_SVG
> +	select BR2_PACKAGE_CAIRO_PNG
> +	select BR2_PACKAGE_CAIRO_ZLIB
>   	select BR2_PACKAGE_LIBGLIB2
>   	select BR2_PACKAGE_PANGO
>   	select BR2_PACKAGE_GDK_PIXBUF
> diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
> index 34b8d49eb3..9f9a081ecb 100644
> --- a/package/libgtk3/Config.in
> +++ b/package/libgtk3/Config.in
> @@ -25,9 +25,8 @@ config BR2_PACKAGE_LIBGTK3
>   		BR2_PACKAGE_HAS_LIBGL
>   	select BR2_PACKAGE_AT_SPI2_CORE
>   	select BR2_PACKAGE_CAIRO
> -	select BR2_PACKAGE_CAIRO_PS
> -	select BR2_PACKAGE_CAIRO_PDF
> -	select BR2_PACKAGE_CAIRO_SVG
> +	select BR2_PACKAGE_CAIRO_PNG
> +	select BR2_PACKAGE_CAIRO_ZLIB
>   	select BR2_PACKAGE_LIBEPOXY
>   	select BR2_PACKAGE_LIBGLIB2
>   	select BR2_PACKAGE_PANGO
> diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
> index 270b524b37..d74359dfc9 100644
> --- a/package/librsvg/Config.in
> +++ b/package/librsvg/Config.in
> @@ -9,7 +9,7 @@ config BR2_PACKAGE_LIBRSVG
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
>   	select BR2_PACKAGE_CAIRO
>   	select BR2_PACKAGE_CAIRO_PNG
> -	select BR2_PACKAGE_CAIRO_SCRIPT
> +	select BR2_PACKAGE_CAIRO_ZLIB
>   	select BR2_PACKAGE_GDK_PIXBUF
>   	select BR2_PACKAGE_HOST_RUSTC
>   	select BR2_PACKAGE_LIBGLIB2
> diff --git a/package/libsvg-cairo/Config.in b/package/libsvg-cairo/Config.in
> index 9577c69bf0..4602e93c2a 100644
> --- a/package/libsvg-cairo/Config.in
> +++ b/package/libsvg-cairo/Config.in
> @@ -1,7 +1,7 @@
>   config BR2_PACKAGE_LIBSVG_CAIRO
>   	bool "libsvg-cairo"
>   	select BR2_PACKAGE_CAIRO
> -	select BR2_PACKAGE_CAIRO_SVG
> +	select BR2_PACKAGE_CAIRO_PNG
>   	select BR2_PACKAGE_LIBSVG
>   	help
>   	  Libsvg-cairo provides the ability to render SVG content from
> diff --git a/package/rrdtool/Config.in b/package/rrdtool/Config.in
> index 5ffdc92618..d954fd1214 100644
> --- a/package/rrdtool/Config.in
> +++ b/package/rrdtool/Config.in
> @@ -19,10 +19,8 @@ config BR2_PACKAGE_RRDTOOL_RRDGRAPH
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
>   	depends on BR2_INSTALL_LIBSTDCPP # freetype support from pango
>   	select BR2_PACKAGE_CAIRO
> -	select BR2_PACKAGE_CAIRO_PDF
>   	select BR2_PACKAGE_CAIRO_PNG
> -	select BR2_PACKAGE_CAIRO_PS
> -	select BR2_PACKAGE_CAIRO_SVG
> +	select BR2_PACKAGE_CAIRO_ZLIB
>   	select BR2_PACKAGE_PANGO
>   	help
>   	  This enables the graphing capabilities ('rrdgraph').
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
