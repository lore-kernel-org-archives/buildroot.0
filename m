Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5014C3A59D
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 22:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CD348136A;
	Sun, 23 Oct 2022 22:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CD348136A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jCLh92iaq9Pm; Sun, 23 Oct 2022 22:54:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7219A81360;
	Sun, 23 Oct 2022 22:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7219A81360
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC3C91BF3F9
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 22:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94A3981360
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 22:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94A3981360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WpXTaWVayaRT for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 22:54:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 598578135B
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 598578135B
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 22:54:15 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 m6-20020a17090a5a4600b00212f8dffec9so2098739pji.0
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 15:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bjektEbnzj22fDRfM7SKeJ8PZuDhsxfmEpftp/HFMKg=;
 b=oUMpmrnzUybC95g6Julfhoz3cD6UJjWsH67oC6zpV98QG+EokudBm0s1EFILxjwKuE
 HPs4uz6rm3/rZ1k/YZ0d//U3nKyI42NSrZXR0xInri/W1q1xmskcPLJiihq7XKmvxBub
 3skbutQNv4E3nvzy/D7PbZc+J6MH+Uen70/OzUwdPFgO642VJkZPTgP1/vSSuNUqK6U9
 oyQdaYq2NXl0bLgbsyhDlASlUyCwkn4j6aqzxllVgcriblLAVzEz5CZjVlm4fFHOjRu5
 ONsX6+QLXuzcpxRACyAkOgi1WKpOT/ZKgJ5F0sJx6Khut/AHgt3FLPf4i/zQAKr2vCGi
 0fNA==
X-Gm-Message-State: ACrzQf2k3t4mP3O4rTDFfOQOiw14lBRgdAUvdX54jUHKVCfiiG8vxXI6
 BqpxjIb6kfRy+u2O81+J0IOIjPrVjp1VMIdFZF1ix2tPTkdxhw==
X-Google-Smtp-Source: AMsMyM4JEhQItZtale3GiJHtKL+/S9mNrihug2wmUQH7KvKjx0xPOyAO9SQq0csi8wLDNJZxfkPw6020h7w3RWxak2g=
X-Received: by 2002:a17:902:b598:b0:184:e49d:3042 with SMTP id
 a24-20020a170902b59800b00184e49d3042mr31129608pls.16.1666565654584; Sun, 23
 Oct 2022 15:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <20221004133057.2003750-1-aperez@igalia.com>
 <20221006095833.1116173-1-aperez@igalia.com>
 <20221006095833.1116173-6-aperez@igalia.com>
In-Reply-To: <20221006095833.1116173-6-aperez@igalia.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 23 Oct 2022 18:54:02 -0400
Message-ID: <CADvTj4poAy2c83hFqM27EN6299_5670eJim3bije-U2JL=nQKA@mail.gmail.com>
To: Adrian Perez de Castro <aperez@igalia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bjektEbnzj22fDRfM7SKeJ8PZuDhsxfmEpftp/HFMKg=;
 b=Crtq7AC423IKleVRxIuh+Yknj4eURiibPh3u1FZxojk5n0k/mulojuFKhYq1cI6ahY
 2AEIatu3ymAM6gQwbJc0SeKDRHPVdr2WNSNWfvD3uaJ9etEPW3o3lyVq6wZZJq3z7VWk
 sRzbzM/StY9iqdwMH3OINoEmNBVePO0FeSz49ObvU+Pd+dTtl0/6ghj3gxGrr+Zap8g/
 2ui026rS+f6MsyW0I/1xZTx2lIzuXshqpAqeI5LQTM9ueqQ+ZuOhP1DVOCqYQVNOH1fh
 sUGYAWX0xm8/LIs3yGnuCL7E5Fz96TGBxEO+tAI5ssG4k7GHj+bJKDey3shFkZ2PlzN/
 0vvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Crtq7AC4
Subject: Re: [Buildroot] [PATCH v3 5/5] package/cog: bump to version 0.16.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Oct 6, 2022 at 6:00 AM Adrian Perez de Castro <aperez@igalia.com> wrote:
>
> This new version includes support for setting proxy options and gamepad
> support. Release notes:
>
>   https://wpewebkit.org/release/cog-0.16.0.html
>
> This imports a small patch to properly pick libdrm compiler flags,
> fetched from the upstream repository.
>
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Tested-by: James Hilliard <james.hilliard1@gmail.com>

> ---
>  ...m-dependency-when-protocols-are-used.patch | 36 ++++++++++++++++++
>  package/cog/cog.hash                          |  8 ++--
>  package/cog/cog.mk                            | 37 ++++++++++---------
>  3 files changed, 60 insertions(+), 21 deletions(-)
>  create mode 100644 package/cog/0001-wl-Fix-libdrm-dependency-when-protocols-are-used.patch
>
> diff --git a/package/cog/0001-wl-Fix-libdrm-dependency-when-protocols-are-used.patch b/package/cog/0001-wl-Fix-libdrm-dependency-when-protocols-are-used.patch
> new file mode 100644
> index 0000000000..44e555c121
> --- /dev/null
> +++ b/package/cog/0001-wl-Fix-libdrm-dependency-when-protocols-are-used.patch
> @@ -0,0 +1,36 @@
> +From 9a1982c563e218b7695e6a174c8230d3b063eb27 Mon Sep 17 00:00:00 2001
> +From: Gary Bisson <gary.bisson@boundarydevices.com>
> +Date: Thu, 6 Oct 2022 09:04:22 +0200
> +Subject: [PATCH] wl: Fix libdrm dependency when protocols are used
> +
> +As the comment says, cog-platform-wl.c needs drm_fourcc.h to build
> +properly when wayland_weston_direct_display is enabled.
> +
> +However, libdrm.pc doesn't specify "include/libdrm" as part of its
> +includedir but whether in its cflags. So use the compile_args dep
> +instead of includes to fix the build failure.
> +
> +Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> +(cherry picked from commit 32c1d9533bcdc22cbc01d02bf2e6ac0d4bda2dc2)
> +Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> +[Upstream status: https://github.com/Igalia/cog/pull/501]
> +---
> + platform/wayland/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/platform/wayland/meson.build b/platform/wayland/meson.build
> +index f1e18ec..31e4460 100644
> +--- a/platform/wayland/meson.build
> ++++ b/platform/wayland/meson.build
> +@@ -67,7 +67,7 @@ if wayland_platform_weston_protocols.length() > 0
> +
> +     # The code uses definitions from the drm_fourcc.h header, but does not
> +     # need to link the library; libdrm here is only a build-time dependency.
> +-    wayland_platform_dependencies += [dependency('libdrm').partial_dependency(includes: true)]
> ++    wayland_platform_dependencies += [dependency('libdrm').partial_dependency(compile_args: true)]
> + endif
> +
> +
> +--
> +2.38.0
> +
> diff --git a/package/cog/cog.hash b/package/cog/cog.hash
> index aa128d73d8..a2c55c4b94 100644
> --- a/package/cog/cog.hash
> +++ b/package/cog/cog.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/cog-0.14.1.tar.xz.sums
> -md5  69d72ac046a0fc485ea7b61b96e7e7fc  cog-0.14.1.tar.xz
> -sha1  6236972b0ae0bce38a0a017610f161b349723862  cog-0.14.1.tar.xz
> -sha256  fb91104e25e1dde27189c91c70acc356e387f47acebaa8997e01ce5879c3a600  cog-0.14.1.tar.xz
> +# From https://wpewebkit.org/releases/cog-0.16.0.tar.xz.sums
> +md5  2705472ea4f333290973722c0862b21d  cog-0.16.0.tar.xz
> +sha1  ef16e5e3d91d0da056fe5e4f596c211af7453b4e  cog-0.16.0.tar.xz
> +sha256  2956f719d36c9a6368f63901a0d1ceaf4d27f529f7df441b3748c36d72906fc6  cog-0.16.0.tar.xz
>
>  # Hashes for license files:
>  sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
> diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> index 1f24bebee4..241c4e309c 100644
> --- a/package/cog/cog.mk
> +++ b/package/cog/cog.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -COG_VERSION = 0.14.1
> +COG_VERSION = 0.16.0
>  COG_SITE = https://wpewebkit.org/releases
>  COG_SOURCE = cog-$(COG_VERSION).tar.xz
>  COG_INSTALL_STAGING = YES
> @@ -12,37 +12,40 @@ COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo wayland
>  COG_LICENSE = MIT
>  COG_LICENSE_FILES = COPYING
>  COG_CONF_OPTS = \
> -       -DCOG_BUILD_PROGRAMS=ON \
> -       -DCOG_PLATFORM_HEADLESS=ON \
> -       -DINSTALL_MAN_PAGES=OFF \
> -       -DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))' \
> -       -DUSE_SOUP2=ON
> +       -Ddocumentation=false \
> +       -Dmanpages=false \
> +       -Dprograms=true \
> +       -Dsoup2=enabled \
> +       -Dcog_home_uri='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))' \
> +       -Dplatforms='$(subst $(space),$(comma),$(strip $(COG_PLATFORMS_LIST)))'
> +
> +COG_PLATFORMS_LIST = headless
>
>  ifeq ($(BR2_PACKAGE_WESTON),y)
> -COG_CONF_OPTS += -DCOG_WESTON_DIRECT_DISPLAY=ON
> +COG_CONF_OPTS += -Dwayland_weston_direct_display=true
>  COG_DEPENDENCIES += weston
>  else
> -COG_CONF_OPTS += -DCOG_WESTON_DIRECT_DISPLAY=OFF
> +COG_CONF_OPTS += -Dwayland_weston_direct_display=false
>  endif
>
>  ifeq ($(BR2_PACKAGE_COG_PLATFORM_FDO),y)
> -COG_CONF_OPTS += -DCOG_PLATFORM_WL=ON
> +COG_PLATFORMS_LIST += wayland
>  COG_DEPENDENCIES += libxkbcommon wayland-protocols
> -else
> -COG_CONF_OPTS += -DCOG_PLATFORM_WL=OFF
>  endif
>
>  ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
> -COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
> +COG_PLATFORMS_LIST += drm
>  COG_DEPENDENCIES += libdrm libinput libgbm libegl udev
> -else
> -COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
>  endif
>
>  ifeq ($(BR2_PACKAGE_COG_USE_SYSTEM_DBUS),y)
> -COG_CONF_OPTS += -DCOG_DBUS_SYSTEM_BUS=ON
> +COG_CONF_OPTS += -Dcog_dbus_control=system
>  else
> -COG_CONF_OPTS += -DCOG_DBUS_SYSTEM_BUS=OFF
> +COG_CONF_OPTS += -Dcog_dbus_control=user
>  endif
>
> -$(eval $(cmake-package))
> +ifeq ($(BR2_PACKAGE_LIBMANETTE),y)
> +COG_DEPENDENCIES += libmanette
> +endif
> +
> +$(eval $(meson-package))
> --
> 2.38.0
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
