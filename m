Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98433CD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 716C260D6E;
	Fri,  5 Jun 2026 12:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVzTL2TNlGwB; Fri,  5 Jun 2026 12:49:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4597A60FAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663776;
	bh=Yf7y2CoE6+MjuW0CJpWkQQ4qQwcL08aoUCwJdR2e5iw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m6Tv08AKnMvvVO9tgkwPwKHlglwxSL0eUn09nWdvOK4cEM4/OEWIWXlXsAyXlp3ts
	 ZQYcLdjHMwbS80VLJQ3TWj2lODRKRZFnQxrN+nxN6BVfgm7Zpc0YmjidYVfnGVvGl1
	 4KRbIw+akATQT29Ybns1pMCYQG3THoPnUg3O4LoPmOiMnpVqdKF3Mq6xVJ6Md2btjT
	 b06XDhdn4sviRqHyChOMoyMoprrN4Uhf7syVerLAtzNn8qsNgWQhPjy59cmBxyODXo
	 FGdPwUIm0NPB10D5vbXdNnf7EYCoY8GlfIVE25LS2SZDmWmdsyTn83EPY00rI6R3Qn
	 JbPt1pDGNlg5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4597A60FAD;
	Fri,  5 Jun 2026 12:49:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85A68388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 801AA4037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sto1h7JnUtEl for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 558824037F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 558824037F
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 558824037F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:30 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso15189375e9.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663768; x=1781268568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dHPEpFt0fFL7NdzpUUcOarTNxGO/+GynqlcnFOmidjo=;
 b=TRI51TR9/YL0bc6sEs23pscq1/JoXFOpv+e3bQ2U7GrepKuuwU2QHoyFgEBEGxsKh+
 cnSKZGOb7syBn81GTZ/YiwY8x2evt4pB66Ukv+/8NIi62vHo0Adbusz5rW10q+8PXcxe
 n4zaOmCq2vzULEsCJiTwQVABUoXkOBamjbPyOJQBB8mzPUgsPldO77d+kqNew75ceDvz
 +48WATTswTmLYR9zyIlIbejtLpiSt7QMP3EOkvAf1eoUg23Qw3N44knM7ufaYLjqwob6
 E7k5yRuDdvmENinj9VWogJj4Ed43IQSJzv0ACDaBhGuM5BMT87T0bzyCwFQNBG/NN4WW
 aGVA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+uu8wwsNyN92gj5zcLOxmYizHBgsVDZVNCiS9Mz+MGMxsHBIZNP6rcBIkYTr/vK7qvxri7UHvxByY=@buildroot.org
X-Gm-Message-State: AOJu0YzY5MILvCgKFoHXCc6gRrOIY8bZfc+eerWcwL6dNFIl2p2H2C1x
 0T9efUUeh0Bt6hic1y1Z+/VbypQLIN1NVyVFHm9PRBlyEwHrc84hBJAUUKwUaf2uYWa/jt6y+Iy
 7TEyo
X-Gm-Gg: Acq92OHe1CFZYO+k/CmGcnfHhtxUixL4Eh4ROlueNbDRD0V+Y16sxf7tsMvgbfBWgsS
 q2VfpnWlJ0UnlRhc1DTb6jcq+8urh59T7jRgWlfuhXFaPgZ2M0R9LV4MbnPSLzdJHsLZzsL7lps
 zvKBEgTL/dWCpIj2bbn7RN1zw5rvY2FudZ8IfCcn+tqYt0gzteTERT0Nf4S5BbR1yuKRNPmSXCL
 hm4FH3R0qDy9cqkppPBLF8GvZPDoSusVEcTaRkzzPhoq/jx4BfZBAw4FWGR/iEdFWlNLit1vL+7
 rs5olpSLmA02QudoOtfQkTfoOejyhhj83RmmRtaVzt8pag3MpXe0Ef3+TupJlnzdPtQbhh8srSw
 xm0hSrHcfZbQlML2xOY8+ok8M8WnG7A7J+YmcrzRL0QUuLwQWxjMfWxkKcbq/jtIWb3uHfr0JPD
 IvB6pxC0IJIB108GJN6lMV7LtFTw==
X-Received: by 2002:a05:600c:3b09:b0:490:b446:fb8 with SMTP id
 5b1f17b1804b1-490c25c66d2mr53434805e9.11.1780663768380; 
 Fri, 05 Jun 2026 05:49:28 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3a87dasm141832495e9.7.2026.06.05.05.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:28 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:27 +0200
Message-ID: <20260605124927.271302-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260524063729.1193614-1-bernd@kuhls.net>
References: <20260524063729.1193614-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663768; x=1781268568; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dHPEpFt0fFL7NdzpUUcOarTNxGO/+GynqlcnFOmidjo=;
 b=doP1jfCLRabG2slq5L/B3j6AvW2rjB1qI9BSmWGC4VMlqhEMpoevyWsWrAwbtDAbO3
 nbwRBaHOUWqAoQfmsAyj9p6l8zjINMVUARnWd0iRkjFcj4/DHeDs8D47zTkpLvmTD3Rx
 +lRxF899zdv0eLRN9TlkXvLkuM70I7cLpvzAm5pcfBjq3I3QIc7CnXfG4lkoVUzXNLc8
 NjVzgAlhdWd0U+39HfiSLKylxoUZBCbxYje4sEaqrs8yEEfJx0O8jCEtYq7NmETPtDAw
 xgaxUmYdcRTIdHdfgegl161LBlqC7qOl5sqQWMmBvLzsSfVE/3zT6AnShpWqq1hZpBks
 69Bw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=doP1jfCL
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
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
>  ERROR: Unknown variable "engine_gl_drm".
> 
> which is fixed by former patch 0001.
> 
> Later a build error occurs which is fixed by former patch 0002.
> 
> The error was not yet caught by the autobuilders.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  ...es-drm-meson.build-use-gl_deps-as-en.patch | 37 ++++++++++++++++++
>  ...es-drm-meson.build-fix-gl_drm-includ.patch | 38 +++++++++++++++++++
>  2 files changed, 75 insertions(+)
>  create mode 100644 package/efl/0009-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
>  create mode 100644 package/efl/0010-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch
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
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
