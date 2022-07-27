Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C267C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 11:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3B2140518;
	Wed, 27 Jul 2022 11:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3B2140518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3gC7ptp-QNYY; Wed, 27 Jul 2022 11:09:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B59EE404D8;
	Wed, 27 Jul 2022 11:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B59EE404D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD4211BF46D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96218404A6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96218404A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wJ8FdFxl8FMe for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 11:08:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42CBC403D0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42CBC403D0
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 11:08:32 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v17so4740607wrr.10
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 04:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HIpkcxpGyOANUUvS1aI5B3s+pWzKOSANw7rcERDZ0gQ=;
 b=QqNF+Kv0hUYM//J9bfjbZQAegyA4kdn63oKB3tVnthiTX51Yp2Z6Tt1ETb0SY/GMoP
 J8VeS5ABieCY15x0AezqKcBwPikiapx9DH7nvm08S1+o2XQNlialxLHAx2+wr5nguLFs
 LIHl7uP4IZMpDeTZL28XXeaQpINCoA8Sm1y41/5xGkE3aZwv5J1P4ytAN0G8rJAVzSXO
 o/zWNzwEyleUF10WDpS5Yx/6unx/7dwi37SdOQntp8pOq8SRLYKpzkYoLEz7uvUj/OKe
 Q4HtmW5JRUSvIL1yL2TSToXFqs+155ohMkkvyRdZt38KYlPBWjzoViFiRcxwatvP7m5o
 XqBA==
X-Gm-Message-State: AJIora+tXbAi4jnyqDuIuYtuIFZA8MyBIyUxOMmE4ySo1vTJh5+mzXR3
 rmIA+nEZOReTB5ghn8wvrB0uyA==
X-Google-Smtp-Source: AGRyM1s9EzlLZnmmB6Cq4Z3w2K37dJhxtOySG0bCikp7ilC5n73W6PRtOyiPBQJ9910hmC3FKPwHGg==
X-Received: by 2002:a5d:434e:0:b0:21e:9970:fab with SMTP id
 u14-20020a5d434e000000b0021e99700fabmr5672707wrr.127.1658920110312; 
 Wed, 27 Jul 2022 04:08:30 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 j3-20020adfa543000000b0021e150553acsm14847982wrb.14.2022.07.27.04.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 04:08:29 -0700 (PDT)
Message-ID: <0b33098c-cdf6-d59a-0ee3-fc9821de53ba@mind.be>
Date: Wed, 27 Jul 2022 11:00:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220727071557.3434892-1-james.hilliard1@gmail.com>
 <20220727071557.3434892-2-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220727071557.3434892-2-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HIpkcxpGyOANUUvS1aI5B3s+pWzKOSANw7rcERDZ0gQ=;
 b=Eq4W1Ef4JVGFJbw8q4eDU3BYla951D+A+J+uCuFzd8UJUphk97Gp8ply1VCunG6LVi
 Zp5BwPJvP3h298F7vajzm6AFCJ5SrKcD04WQkUoG0NL4L/mNdC5O3Qhgu0BAZHdIX/gB
 HeXni9laN5C1F8nd/3qQGt35LwnTCaxzALyM6yHUcv6iJQ01CFB4ioPQ+/cZCBdTy440
 +iQk24AlKdpShmmSq+7TxhwdWk5KyBuCKL+WQXdIXPnOLmt7tDYnOH+PbY6o4y/CFx9W
 TNjvTie5vvhCnC0n+tOj5LtCtQwwdRH+PcLWKcVG7E5zNeFoR4vuhoiz8ycRUUoNkRAH
 JGXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Eq4W1Ef4
Subject: Re: [Buildroot] [PATCH v5 2/2] package/pkg-meson: use meson to
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
 Samuel Martin <s.martin49@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/07/2022 09:15, James Hilliard wrote:
> As of version 0.54.0 meson has had the ability to build and install
> packages rather than having to run ninja directly as before.
> 
> This will allow us to use features such as meson install tags in
> the future which require meson to be used for the installation.
> 
> Note that we've removed FOO_NINJA_ENV which may cause issues
> in the unlikely event an external package uses it.
> 
> We need to set --pkgconfig.relocatable so that pkg-config files are
> not generated with absolute paths which cause issues with per-package
> directories.

  This still doesn't explain how it is related to using meson rather than ninja. 
Are you saying that when calling ninja directly, PPD work perfectly fine, but if 
it's installed with meson, it doesn't? Then I'd really like to have a little 
more insight into what meson does to break it.

  I suspect that the two are actually unrelated, and thus the patches should be 
split.

> 
> Remove conflicting host-systemd paths.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

[snip]
> @@ -156,10 +157,20 @@ define $(2)_CONFIGURE_CMDS
>   	mkdir -p $$($$(PKG)_SRCDIR)/build
>   	$$(HOST_CONFIGURE_OPTS) \
>   	$$($$(PKG)_CONF_ENV) $$(MESON) \
> +		--pkgconfig.relocatable \
>   		--prefix=$$(HOST_DIR) \
> -		--libdir=lib \
> -		--sysconfdir=$$(HOST_DIR)/etc \
> +		--bindir=$$(HOST_DIR)/bin \

  bindir defaults to "bin", which means things will be installed in <prefix>/bin 
and references to bindir in pkgconfig will use <prefix>/bin absolute paths as 
well (actually, as ${prefix}/bin). How does pkgconfig.relocatable change things 
that we suddenly need to override the default with an absolute path?

> +		--datadir=$$(HOST_DIR)/share \
> +		--includedir=$$(HOST_DIR)/include \
> +		--infodir=$$(HOST_DIR)/share/info \
> +		--libdir=$$(HOST_DIR)/lib \
> +		--libexecdir=$$(HOST_DIR)/libexec \
> +		--localedir=$$(HOST_DIR)/share/locale \
>   		--localstatedir=$$(HOST_DIR)/var \
> +		--mandir=$$(HOST_DIR)/share/man \
> +		--sbindir=$$(HOST_DIR)/sbin \
> +		--sharedstatedir=$$(HOST_DIR)/com \
> +		--sysconfdir=$$(HOST_DIR)/etc \
>   		--default-library=shared \
>   		--buildtype=release \
>   		--wrap-mode=nodownload \
> @@ -179,13 +190,23 @@ $(2)_DEPENDENCIES += host-meson
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
> @@ -196,8 +217,12 @@ endif
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
> +		-C $$($$(PKG)_SRCDIR)/build

  Why is there a --ninja-args in the build but not in the install?

>   endef
>   endif
>   
> @@ -207,8 +232,13 @@ endif
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
> @@ -218,8 +248,13 @@ endif
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
> index 47aaddf849..6efc8d636f 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -749,7 +749,7 @@ endef
>   SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
>   
>   SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
> -SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
> +SYSTEMD_MESON_ENV = $(HOST_UTF8_LOCALE_ENV)
>   
>   define SYSTEMD_LINUX_CONFIG_FIXUPS
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS)
> @@ -777,10 +777,7 @@ endef
>   HOST_SYSTEMD_CONF_OPTS = \
>   	-Dsplit-bin=true \
>   	-Dsplit-usr=false \
> -	--prefix=/usr \
> -	--libdir=lib \
> -	--sysconfdir=/etc \
> -	--localstatedir=/var \
> +	-Drootprefix=$(HOST_DIR) \

  This change looks like something we can apply independently of the rest of the 
seris as well. It looks like a much better way of handling the special case of 
systemd. However, I'd like a much more detailed explanation about why this works 
now but didn't work in commit 35c11a027c88a3c943554eefbbed051fd2d98a50. That 
commit has an extensive explanation of the reasoning.

  Regards,
  Arnout

>   	-Dmode=release \
>   	-Dutmp=false \
>   	-Dhibernate=false \
> @@ -852,8 +849,6 @@ HOST_SYSTEMD_DEPENDENCIES = \
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
