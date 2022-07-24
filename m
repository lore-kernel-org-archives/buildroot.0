Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77760C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 19:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB03883EF7;
	Sun, 24 Jul 2022 19:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB03883EF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BldmQLYUGznF; Sun, 24 Jul 2022 19:42:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D82483EE8;
	Sun, 24 Jul 2022 19:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D82483EE8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D6CF1BF20B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE50C83EE8
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:42:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE50C83EE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qUH4zUzXMqE0 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:42:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F0A083EE6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F0A083EE6
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:42:31 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id m17so13000852wrw.7
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MmvEFJNJfsvI4unFoBFcVVa5lDZwsCJTOXYJsRnSn3Y=;
 b=e4+1xOD2qUoZ45hwdMVKKyQsTo422IoXk8xDxI5aPqOk7egBWGXhCU+5KZdiEVsNOU
 xyJtk74d3ZVxKe0aWRp4Pbp2sniqduuIO9OKmYZPvr9Qm9JySt0bGhUAWNvSw7yV/Oup
 fdNe0dTHrz0LAflkl0m0WMf9G7dB9fQYLOwziEo19wwKwDNLzGNh+bFFP8kpHBMh1U2h
 koGwxljYwp/r6KuNznTJktFuWGTfqyug3Y8Nzi7wnUKQ1nIZPnlzhC0IhNIKMMDJJaAV
 ZwtKZMhuRoJGVmZRd0LmzPB2CMY1PUR5WFLIVzgnzUenFikTa1aYah6PI6CJBQSiQX47
 Rgbw==
X-Gm-Message-State: AJIora8p70IQAxAVi39oTgZSoqUcjnmDtAQDaH0h2BYs4lqyH2Y7K1/+
 tgta5SRYXz4UbO0tbJBCc21WIg==
X-Google-Smtp-Source: AGRyM1ujB3irInKNG1nZls7vZ+hiZKC7tPEYfM+BocQfzkgDJYq20tRVQDqWMHwJ8QMj1q8o/siCZA==
X-Received: by 2002:a5d:51c7:0:b0:21e:8455:c286 with SMTP id
 n7-20020a5d51c7000000b0021e8455c286mr2397077wrv.61.1658691749506; 
 Sun, 24 Jul 2022 12:42:29 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 c4-20020adffb04000000b0021db7b0162esm6134373wrr.105.2022.07.24.12.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 12:42:28 -0700 (PDT)
Message-ID: <0d85a216-559f-a4c6-9c6d-0672801ec340@mind.be>
Date: Sun, 24 Jul 2022 21:42:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220722060936.566534-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220722060936.566534-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MmvEFJNJfsvI4unFoBFcVVa5lDZwsCJTOXYJsRnSn3Y=;
 b=TuD459p6KnrAPCb6ZrwtjQ/hwLWn+nq9SJ+QAsMe8v/h7CnRj3y1AYkSVhIl7nGXKG
 9RsgJqtwBnrXH34JHye0ei56/OvAqT69EmGQ59xtKMgq70uZAdRJ4/zRMWZGiERahhXP
 ZiakmZHa0vDNG75hCd2aXhQS/P50cCaAat2So7Hx6J1lrrTOscQBRUmOVWX6xEOsA580
 kN/1UBV5C46P8TttfTRimw/2Q+PuwsWTHWe2sLYDiKq3ghUNe1Qx/285SFeg74D3P1Kt
 mUIiUsFf+YLtwCAt4AeL7fTevJZjNjml4FcYogp/70nkVHKESvLpjeX5Q8JYthd3YPta
 +okg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TuD459p6
Subject: Re: [Buildroot] [PATCH v3 1/1] package/pkg-meson: use meson to
 build/install packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/07/2022 08:09, James Hilliard wrote:
> As of version 0.54.0 meson has had the ability to build and install
> packages rather than having to run ninja directly as before.
> 
> This will allow us to use features such as meson install tags in
> the future which require meson to be used for the installation.
> 
> It appears we need to ensure the cmake prefix path is set for the
> meson generated relocatable pkg-config format to work properly.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v2 -> v3:
>    - set pkgconfig to relocatable
>    - set cmake pkg-config prefix path
> Changes v1 -> v2:
>    - update docs
> ---
>   docs/manual/adding-packages-meson.txt         |  4 +-
>   .../gobject-introspection.mk                  |  4 +-
>   package/pkg-cmake.mk                          |  4 ++
>   package/pkg-meson.mk                          | 61 +++++++++++++------
>   package/systemd/systemd.mk                    |  4 +-
>   5 files changed, 53 insertions(+), 24 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
> index 029c8c2488..c8aed65c2f 100644
> --- a/docs/manual/adding-packages-meson.txt
> +++ b/docs/manual/adding-packages-meson.txt
> @@ -125,8 +125,8 @@ will therefore only use a few of them.
>     +c_link_args+, +cpp_args+, +cpp_link_args+, +sys_root+, and
>     +pkg_config_libdir+.
>   
> -* +FOO_NINJA_ENV+, to specify additional environment variables to pass to
> -  +ninja+, meson companion tool in charge of the build operations. By default,
> +* +FOO_MESON_ENV+, to specify additional environment variables to pass to

  If you're anyway respinning and anyway changing this, I have one more small 
nit: I think it would be better to name this FOO_BUILD_ENV and also add separate 
FOO_INSTALL_TARGET_ENV etc. This is different from how we currently do it in 
other infras, but (some) other infras *do* use e.g. FOO_BUILD_OPTS. The thing 
with FOO_MESON_ENV is that it suggests that it would also (and mainly) be 
applied to the configure step, and that is not the case.

  Regards,
  Arnout


> +  +meson+, meson tool in charge of the build/install operations. By default,
>     empty.
>   
>   * +FOO_NINJA_OPTS+, to specify a space-separated list of targets to build. By
> diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> index 41d64171a7..ea5100247d 100644
> --- a/package/gobject-introspection/gobject-introspection.mk
> +++ b/package/gobject-introspection/gobject-introspection.mk
> @@ -30,14 +30,14 @@ HOST_GOBJECT_INTROSPECTION_DEPENDENCIES = \
>   	host-python3
>   
>   # g-ir-scanner will default to /usr/bin/ld for linking if this is not set.
> -GOBJECT_INTROSPECTION_NINJA_ENV += \
> +GOBJECT_INTROSPECTION_MESON_ENV += \
>   	CC="$(TARGET_CC)"
>   
>   # When building, gobject-introspection uses tools/g-ir-scanner to build several
>   # .gir and .typelib files. g-ir-scanner does not use LDFLAGS, and by default,
>   # links to the system-installed libglib2 path. To remedy this issue, defining
>   # LD_LIBRARY_PATH forces g-ir-scanner to use our host installed libglib2 files.
> -HOST_GOBJECT_INTROSPECTION_NINJA_ENV += \
> +HOST_GOBJECT_INTROSPECTION_MESON_ENV += \
>   	LD_LIBRARY_PATH="$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)$(HOST_DIR)/lib"
>   
>   # Use the host gi-scanner to prevent the scanner from generating incorrect
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 3b1db35fb6..4fa620080d 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -90,6 +90,8 @@ define $(2)_CONFIGURE_CMDS
>   	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
>   		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
>   		-DCMAKE_INSTALL_PREFIX="/usr" \
> +		-DCMAKE_PREFIX_PATH="$$(STAGING_DIR)/usr" \
> +		-DPKG_CONFIG_USE_CMAKE_PREFIX_PATH=ON \
>   		-DCMAKE_COLOR_MAKEFILE=OFF \
>   		-DBUILD_DOC=OFF \
>   		-DBUILD_DOCS=OFF \
> @@ -123,6 +125,8 @@ define $(2)_CONFIGURE_CMDS
>   		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH" \
>   		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" \
>   		-DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)" \
> +		-DCMAKE_PREFIX_PATH="$$(HOST_DIR)" \
> +		-DPKG_CONFIG_USE_CMAKE_PREFIX_PATH=ON \
>   		-DCMAKE_C_FLAGS="$$(HOST_CFLAGS)" \
>   		-DCMAKE_CXX_FLAGS="$$(HOST_CXXFLAGS)" \
>   		-DCMAKE_EXE_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 0835e08e3a..de5817d5da 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -21,13 +21,13 @@
>   ################################################################################
>   
>   #
> -# Pass PYTHONNOUSERSITE environment variable when invoking Meson or Ninja, so
> +# Pass PYTHONNOUSERSITE environment variable when invoking Meson, so
>   # $(HOST_DIR)/bin/python3 will not look for Meson modules in
>   # $HOME/.local/lib/python3.x/site-packages
>   #
> -MESON		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/meson
> -NINJA		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/ninja
> -NINJA_OPTS	= $(if $(VERBOSE),-v)
> +MESON              = PYTHONNOUSERSITE=y $(HOST_DIR)/bin/meson
> +MESON_BUILD_OPTS   = $(if $(VERBOSE),-v)
> +MESON_INSTALL_OPTS = --no-rebuild
>   
>   # https://mesonbuild.com/Reference-tables.html#cpu-families
>   ifeq ($(BR2_arcle)$(BR2_arceb),y)
> @@ -138,6 +138,7 @@ define $(2)_CONFIGURE_CMDS
>   	$$(MESON) \
>   		--prefix=/usr \
>   		--libdir=lib \
> +		--pkgconfig.relocatable \
>   		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
>   		--buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
>   		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
> @@ -156,10 +157,11 @@ define $(2)_CONFIGURE_CMDS
>   	mkdir -p $$($$(PKG)_SRCDIR)/build
>   	$$(HOST_CONFIGURE_OPTS) \
>   	$$($$(PKG)_CONF_ENV) $$(MESON) \
> -		--prefix=$$(HOST_DIR) \
> +		--prefix=/ \
>   		--libdir=lib \
> -		--sysconfdir=$$(HOST_DIR)/etc \
> -		--localstatedir=$$(HOST_DIR)/var \
> +		--pkgconfig.relocatable \
> +		--sysconfdir=etc \
> +		--localstatedir=var \
>   		--default-library=shared \
>   		--buildtype=release \
>   		--wrap-mode=nodownload \
> @@ -179,13 +181,23 @@ $(2)_DEPENDENCIES += host-meson
>   ifndef $(2)_BUILD_CMDS
>   ifeq ($(4),target)
>   define $(2)_BUILD_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> -		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
> +	$$(TARGET_MAKE_ENV) \
> +	$$($$(PKG)_MESON_ENV) \
> +	$$(MESON) \
> +		compile \
> +		$$(MESON_BUILD_OPTS) \
> +		$$(if $$($$(PKG)_NINJA_OPTS),--ninja-args $$($$(PKG)_NINJA_OPTS)) \
> +		-C $$($$(PKG)_SRCDIR)/build
>   endef
>   else
>   define $(2)_BUILD_CMDS
> -	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> -		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
> +	$$(HOST_MAKE_ENV) \
> +	$$($$(PKG)_MESON_ENV) \
> +	$$(MESON) \
> +		compile \
> +		$$(MESON_BUILD_OPTS) \
> +		$$(if $$($$(PKG)_NINJA_OPTS),--ninja-args $$($$(PKG)_NINJA_OPTS)) \
> +		-C $$($$(PKG)_SRCDIR)/build
>   endef
>   endif
>   endif
> @@ -196,8 +208,13 @@ endif
>   #
>   ifndef $(2)_INSTALL_CMDS
>   define $(2)_INSTALL_CMDS
> -	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> -		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> +	$$(HOST_MAKE_ENV) \
> +	$$($$(PKG)_MESON_ENV) \
> +	$$(MESON) \
> +		install \
> +		$$(MESON_INSTALL_OPTS) \
> +		--destdir $$(HOST_DIR) \
> +		-C $$($$(PKG)_SRCDIR)/build
>   endef
>   endif
>   
> @@ -207,8 +224,13 @@ endif
>   #
>   ifndef $(2)_INSTALL_STAGING_CMDS
>   define $(2)_INSTALL_STAGING_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
> -		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> +	$$(TARGET_MAKE_ENV) \
> +	$$($$(PKG)_MESON_ENV) \
> +	$$(MESON) \
> +		install \
> +		$$(MESON_INSTALL_OPTS) \
> +		--destdir $$(STAGING_DIR) \
> +		-C $$($$(PKG)_SRCDIR)/build
>   endef
>   endif
>   
> @@ -218,8 +240,13 @@ endif
>   #
>   ifndef $(2)_INSTALL_TARGET_CMDS
>   define $(2)_INSTALL_TARGET_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) \
> -		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> +	$$(TARGET_MAKE_ENV) \
> +	$$($$(PKG)_MESON_ENV) \
> +	$$(MESON) \
> +		install \
> +		$$(MESON_INSTALL_OPTS) \
> +		--destdir $$(TARGET_DIR) \
> +		-C $$($$(PKG)_SRCDIR)/build
>   endef
>   endif
>   
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 46a4e8de2c..9bb87f8e39 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -746,7 +746,7 @@ endef
>   SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
>   
>   SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
> -SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
> +SYSTEMD_MESON_ENV = $(HOST_UTF8_LOCALE_ENV)
>   
>   define SYSTEMD_LINUX_CONFIG_FIXUPS
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS)
> @@ -849,8 +849,6 @@ HOST_SYSTEMD_DEPENDENCIES = \
>   	host-gperf \
>   	host-python-jinja2
>   
> -HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
> -
>   # Fix RPATH After installation
>   # * systemd provides a install_rpath instruction to meson because the binaries
>   #   need to link with libsystemd which is not in a standard path
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
