Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF26BCD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 17:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 835D3615DD;
	Fri, 29 May 2026 17:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BbOWG9T4E0uH; Fri, 29 May 2026 17:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A70EF615EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780077115;
	bh=lkQ0vA6YfvCfD6noPM8mbarJoR1kmaCV6tHRZ/u6x8Q=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RBrQA2aDWOU4Q7tuo1Hpop/9a6o6bAiAgVIcvyPWmXzpPykoBMztKiABuV6mWu1/6
	 i2uu7fVQ2SFWXmug0XG9CRTT2l7fazEQTeJn0ZlD74Xjb3spekXSF8EN/Z5hZYsyJS
	 WpTJW7HcD7lxq8NImsWqF3bMcShi912/S92evuszwhmLHYC4h7fAXgrEab1okJIuxK
	 TrSRBhkbmTXqJIoEGl+T6RRQglDqPm9EeqW2/sFumP6+Z6b3ulvLVMeHdYVbbMdTwE
	 rjQbWOigAClNVYSLl58EGXvQd+YCS9wdTOEDSppBVQre50E//cWne71o5Ork3U6ku4
	 DqbfFbhn1SAaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A70EF615EA;
	Fri, 29 May 2026 17:51:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ACEFF4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B5B8421C8
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wgSBcerg6tH5 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 17:51:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F034D421C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F034D421C4
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F034D421C4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:51:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 38D47B97C675; Fri, 29 May 2026 19:51:50 +0200 (CEST)
Message-ID: <3c31f355-4fae-4c01-9c22-a0268b33cfd8@rnout.be>
Date: Fri, 29 May 2026 19:51:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
References: <20260524063729.1193614-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260524063729.1193614-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780077110; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=RxuHiShaBnRC0XAvHkFeHANvOgkbXde/TohUpIKDQ3w=;
 b=bqqdRe5Cl49gKYgCs07IxSAFLZOe28jDgap9I9Hr7J1K5vbH1EyuAin58G4s2bRzA/+gvI
 zCkM9o+n9n74Ii95ot6GoMOI36HnKZXtaMOkNs+CZa8AVzbVDigBms4hr+bTyG2i4wDt8f
 SHJAFhwawh9pDnecUG0WB8WW0dCwpjZGb6faDlbZ2KBKSkaKgRpHSMpn/EAbDHwSgshnxz
 4L3ukL0z4f/8PxO/iFQ609xdunEokFHFsAqRKRBh8ui/+05H116ZAp7ZKguoURzrUdS/MO
 lY89o+/k2GmlvJ5eiMEV6/zYj06kHuQfMiD5moMRDqW3oNyKc5fgmvf+vu1NZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=bqqdRe5C
Subject: Re: [Buildroot] [PATCH 1/1] package/efl: re-add patches to fix
 drm-related build errors
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/05/2026 08:37, Bernd Kuhls wrote:
> Buildroot commit c7a1b73f1758855e47c188c38617dd309b2c2428 removed
> patches 0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
> and 0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch.
> 
> This defconfig
> 
> BR2_x86_64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_EFL=y
> BR2_PACKAGE_EFL_DRM=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
> BR2_PACKAGE_MESA3D_OPENGL_GLX=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_LUAJIT=y
> 
> is broken now during configure stage
> 
> output/build/efl-1.28.1/src/modules/ecore_evas/engines/drm/meson.build:6:18:
>   ERROR: Unknown variable "engine_gl_drm".
> 
> which is fixed by former patch 0001.
> 
> Later a build error occurs which is fixed by former patch 0002.
> 
> The error was not yet caught by the autobuilders.

  Applied to master, thanks.

  Thank you also for adding the Upstream: tag!

  Regards,
  Arnout

> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>   ...es-drm-meson.build-use-gl_deps-as-en.patch | 37 ++++++++++++++++++
>   ...es-drm-meson.build-fix-gl_drm-includ.patch | 38 +++++++++++++++++++
>   2 files changed, 75 insertions(+)
>   create mode 100644 package/efl/0009-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
>   create mode 100644 package/efl/0010-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch
> 
> diff --git a/package/efl/0009-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch b/package/efl/0009-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
> new file mode 100644
> index 0000000000..dd6ac1ae25
> --- /dev/null
> +++ b/package/efl/0009-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
> @@ -0,0 +1,37 @@
> +From 00833baac6935bd1e3e9856211bc165c5b02a7bd Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Sat, 1 Aug 2020 02:25:47 +0200
> +Subject: [PATCH] ecore_evas/engines/drm/meson.build: use "gl_deps" as engine
> + dependencies
> +
> +Meson trigger an error since "engine_gl_drm" variable doesn't exist.
> +
> +src/modules/ecore_evas/engines/drm/meson.build:10:2: ERROR: Unknown variable "engine_gl_drm".
> +
> +Instead use "gl_deps" as engine dependencies.
> +
> +Upstream: https://sourceforge.net/p/enlightenment/mailman/message/37075016/
> +
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +[Bernd: added Upstream: tag]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/modules/ecore_evas/engines/drm/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/modules/ecore_evas/engines/drm/meson.build b/src/modules/ecore_evas/engines/drm/meson.build
> +index 58071010d0..0741d7fccd 100644
> +--- a/src/modules/ecore_evas/engines/drm/meson.build
> ++++ b/src/modules/ecore_evas/engines/drm/meson.build
> +@@ -3,7 +3,7 @@ engine_deps = [ecore_drm2, ecore_input, eeze, elput, libdrm, engine_drm]
> +
> + if get_option('opengl') != 'none'
> +   config_h.set('BUILD_ECORE_EVAS_GL_DRM', '1')
> +-  engine_deps += [engine_gl_drm]
> ++  engine_deps += [gl_deps]
> + endif
> +
> + engine_include_dir += include_directories(join_paths('..', '..', '..', 'evas', 'engines', 'drm'))
> +--
> +2.31.1
> +
> diff --git a/package/efl/0010-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch b/package/efl/0010-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch
> new file mode 100644
> index 0000000000..e71a1705c0
> --- /dev/null
> +++ b/package/efl/0010-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch
> @@ -0,0 +1,38 @@
> +From a21e71cc2284a19a34c913aff757e656e3a8c14a Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Sat, 1 Aug 2020 01:01:00 +0200
> +Subject: [PATCH] ecore_evas/engines/drm/meson.build: fix "gl_drm" include
> + directory
> +
> +The Evas_Engine_GL_Drm.h file is in "gl_drm" directory, not "drm".
> +
> +../src/modules/ecore_evas/engines/drm/ecore_evas_drm.c:23:11: fatal error: Evas_Engine_GL_Drm.h: No such file or directory
> +   23 | # include <Evas_Engine_GL_Drm.h>
> +      |           ^~~~~~~~~~~~~~~~~~~~~~
> +compilation terminated.
> +
> +Upstream: https://sourceforge.net/p/enlightenment/mailman/message/37075004/
> +
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +[Bernd: added Upstream: tag]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/modules/ecore_evas/engines/drm/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/modules/ecore_evas/engines/drm/meson.build b/src/modules/ecore_evas/engines/drm/meson.build
> +index 0741d7fccd..edda1abd71 100644
> +--- a/src/modules/ecore_evas/engines/drm/meson.build
> ++++ b/src/modules/ecore_evas/engines/drm/meson.build
> +@@ -6,7 +6,7 @@ if get_option('opengl') != 'none'
> +   engine_deps += [gl_deps]
> + endif
> +
> +-engine_include_dir += include_directories(join_paths('..', '..', '..', 'evas', 'engines', 'drm'))
> ++engine_include_dir += include_directories(join_paths('..', '..', '..', 'evas', 'engines', 'gl_drm'))
> +
> + shared_module(mod_full_name, engine_src,
> +   include_directories : config_dir + [engine_include_dir],
> +--
> +2.31.1
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
