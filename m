Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E010C433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 22:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9651440398;
	Mon, 22 Nov 2021 22:16:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 33s4jdoBdce9; Mon, 22 Nov 2021 22:16:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67CBE4016B;
	Mon, 22 Nov 2021 22:16:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5AD031BF951
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 22:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57516402A5
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 22:16:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NjTU2xL-1ISb for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 22:16:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18E32402A4
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 22:16:18 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id x6so71208218edr.5
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 14:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rOpdqZs3DR7PpFAiq2y3C3i71ce7xnOHWfBg3DsNh90=;
 b=Ppc4cM4DQ/rG19BTyCPmD3zeFu370mNwqrX9jQX/RNKb7TLxYisz4+IsbS75NKJser
 jz/RZyrE9I4+FFq/vOfUzBj/5unZacI1sajZJ9D1GwnSH60k0s2efNhXv7Kb+9zOe+fM
 pCC9TEHoqn5jOMIusor2HEUOHBbFl7NMb5NKSBIY8ZRNQtQGnP4o74ixLec01zTpynSD
 4vGEuP5E02d86T2ERKQ72U7v0UOhGvjH9M5JE7dWqVu6EKImdbnVriS88aqz9D3cylTy
 phfBDZ99W4G8MFjkCmCWsgnyVG3teD22ZC21tid+VVr2NUtY8IwXeoOHjmyrNAjpzf5i
 fL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rOpdqZs3DR7PpFAiq2y3C3i71ce7xnOHWfBg3DsNh90=;
 b=FHoSuoIh353YJSb15Tmv1C9yf47GkXBh17bbGfl1QzdrWsMRAzwB9XNragKs0O+Rvb
 HtitTMSbSc9gwGPbrNr5VdE8fT5W70ij/3LHe5iDW1MCWMYQwADeIsrM45HdN5MINGwt
 3MZWhr60/+qRbH2c920AWpdwamrDJlByhziaxWGPj2DZS/H7FbdlmXjKxNk/gKjmQ4qO
 BiEvnN5tYNtNZuwQzu0I6u2IGt6X4RNozTokpEquQ0IkIj5JVtzETgPnk2Ig3ki1hwAC
 fEnZKuqwTonlvZQ5OsOZreIv0jMigAno1Fpt9j1krrLZsihurH8L+qlei5nY3X2JDmhH
 tRbg==
X-Gm-Message-State: AOAM532XOZky9XzspeJZqYEqXx0ByC4ydoFGsGHDPpjQSNjdNTBvaIyl
 J0AlC6tbNACFqq8RVyN2d5vyGg==
X-Google-Smtp-Source: ABdhPJzEFOozwySUeFMUi95G6pONbWX12KjBTk9tZevwxG1y9urAegFqwLNgGL0WUlF7UWhE3ltjgw==
X-Received: by 2002:a17:906:d152:: with SMTP id
 br18mr806190ejb.287.1637619377050; 
 Mon, 22 Nov 2021 14:16:17 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hr17sm4342780ejc.57.2021.11.22.14.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 14:16:16 -0800 (PST)
Message-ID: <5b53b7c7-1d25-698e-c64b-a518934e72f3@mind.be>
Date: Mon, 22 Nov 2021 23:16:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211104003607.2022984-1-aduskett@gmail.com>
 <20211104003607.2022984-4-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211104003607.2022984-4-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH vRFC 3/4] package/libpeas: new package
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
 Adrian Perez de Castro <aperez@igalia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/11/2021 01:36, Adam Duskett wrote:
> midori 9.0 requires libpeas.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>   package/Config.in            |  1 +
>   package/libpeas/Config.in    | 45 ++++++++++++++++++++++++++++++++++++
>   package/libpeas/libpeas.hash |  4 ++++
>   package/libpeas/libpeas.mk   | 38 ++++++++++++++++++++++++++++++
>   4 files changed, 88 insertions(+)
>   create mode 100644 package/libpeas/Config.in
>   create mode 100644 package/libpeas/libpeas.hash
>   create mode 100644 package/libpeas/libpeas.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index c23755a421..0e2cc78d85 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1957,6 +1957,7 @@ menu "Other"
>   	source "package/libnpth/Config.in"
>   	source "package/libnspr/Config.in"
>   	source "package/libosmium/Config.in"
> +	source "package/libpeas/Config.in"
>   	source "package/libpfm4/Config.in"
>   	source "package/libplatform/Config.in"
>   	source "package/libplist/Config.in"
> diff --git a/package/libpeas/Config.in b/package/libpeas/Config.in
> new file mode 100644
> index 0000000000..430e668ee7
> --- /dev/null
> +++ b/package/libpeas/Config.in
> @@ -0,0 +1,45 @@
> +config BR2_PACKAGE_LIBPEAS
> +	bool "libpeas"
> +	depends on BR2_USE_MMU # gobject-introspection
> +	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
> +	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection -> host-qemu
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
> +	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
> +	select BR2_PACKAGE_GOBJECT_INTROSPECTION
> +	select BR2_PACKAGE_LIBGLIB2
> +	help
> +	  libpeas is a gobject-based plugins engine, and is targetted at
> +	  giving every application the chance to assume its own
> +	  extensibility. It also has a set of features including, but
> +	  not limited to:
> +	    - multiple extension points
> +	    - On demand (lazy) programming language support for C,
> +	      Python and Lua
> +	    - Simplicity of the API
> +
> +	  https://wiki.gnome.org/Projects/Libpeas
> +
> +if BR2_PACKAGE_LIBPEAS
> +
> +config BR2_PACKAGE_LIBPEAS_WIDGETS
> +	bool "widgets"
> +	depends on BR2_PACKAGE_LIBGTK3
> +	help
> +	  Build GTK+ widgetry
> +
> +comment "widget support needs libgtk3"
> +	depends on !BR2_PACKAGE_LIBGTK3
> +
> +endif
> +
> +comment "libpeas needs python3"
> +	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
> +	depends on BR2_USE_MMU
> +	depends on !BR2_PACKAGE_PYTHON3
> +
> +comment "libpeas needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
> +	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_HOST_GCC_AT_LEAST_8
> diff --git a/package/libpeas/libpeas.hash b/package/libpeas/libpeas.hash
> new file mode 100644
> index 0000000000..2b030c01c5
> --- /dev/null
> +++ b/package/libpeas/libpeas.hash
> @@ -0,0 +1,4 @@
> +# From https://ftp.gnome.org/pub/GNOME/sources/libpeas/1.30/libpeas-1.30.0.sha256sum
> +sha256  0bf5562e9bfc0382a9dcb81f64340787542568762a3a367d9d90f6185898b9a3  libpeas-1.30.0.tar.xz
> +# Locally calculated
> +sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
> diff --git a/package/libpeas/libpeas.mk b/package/libpeas/libpeas.mk
> new file mode 100644
> index 0000000000..4f1ab1216a
> --- /dev/null
> +++ b/package/libpeas/libpeas.mk
> @@ -0,0 +1,38 @@
> +################################################################################
> +#
> +# libpeas
> +#
> +################################################################################
> +
> +LIBPEAS_VERSION_MAJOR = 1.30
> +LIBPEAS_VERSION = $(LIBPEAS_VERSION_MAJOR).0
> +LIBPEAS_SOURCE = libpeas-$(LIBPEAS_VERSION).tar.xz
> +LIBPEAS_SITE = http://ftp.gnome.org/pub/gnome/sources/libpeas/$(LIBPEAS_VERSION_MAJOR)
> +LIBPEAS_LICENSE = LGPL-2.1+
> +LIBPEAS_LICENSE_FILES = COPYING
> +LIBPEAS_CPE_ID_VENDOR = gnome
> +LIBPEAS_INSTALL_STAGING = YES
> +LIBPEAS_DEPENDENCIES = \
> +	host-libglib2 \
> +	host-pkgconf \
> +	gobject-introspection \
> +	libglib2 \
> +	$(TARGET_NLS_DEPENDENCIES)
> +
> +LIBPEAS_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
> +
> +LIBPEAS_CONF_OPTS = \
> +	-Ddemos=false \
> +	-Dglade_catalog=false \
> +	-Dintrospection=true \
> +	-Dlua51=false \

  I've also explicitly disabled python2 and python3, and added a comment in the 
commit message that this is because they're not tested.

  I noticed that even before that change, the python3 loader wasn't built. Weird.


  Applied to next, thanks.

  Regards,
  Arnout

> +	-Dvapi=false
> +
> +ifeq ($(BR2_PACKAGE_LIBPEAS_WIDGETS),y)
> +LIBPEAS_DEPENDENCIES += libgtk3
> +LIBPEAS_CONF_OPTS += -Dwidgetry=true
> +else
> +LIBPEAS_CONF_OPTS += -Dwidgetry=false
> +endif
> +
> +$(eval $(meson-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
