From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 22:21:26 +0200
Subject: [Buildroot] [PATCH v15 27/27] package/freeswitch: enable video
 support
In-Reply-To: <1460906689-29900-28-git-send-email-bernd.kuhls@t-online.de>
References: <1460906689-29900-1-git-send-email-bernd.kuhls@t-online.de>
 <1460906689-29900-28-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160417222126.5dee1159@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Apr 2016 17:24:49 +0200, Bernd Kuhls wrote:

> -config BR2_PACKAGE_FREESWITCH
> +menuconfig BR2_PACKAGE_FREESWITCH

Why? This seems unrelated to the change.

> +if BR2_PACKAGE_FREESWITCH
> +
> +config BR2_PACKAGE_FREESWITCH_MODULE_VIDEO
> +	bool "Video support"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libyuv (in-tree)
> +	select BR2_PACKAGE_FFMPEG
> +	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
> +	select BR2_PACKAGE_FFMPEG_SWSCALE
> +
> +comment "Video support needs a toolchain w/ gcc >= 4.8"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +
> +endif

Why are you adding this option, while all other options are enabled
automatically?

What about just:

	select BR2_PACKAGE_FFMPEG_AVRESAMPLE if BR2_PACKAGE_FFMPEG
	select BR2_PACKAGE_FFMPEG_SWSCALE if BR2_PACKAGE_FFMPEG

And then, in the .mk file:

ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8)$(BR2_PACKAGE_FFMPEG),yy)
...
endif

> +ifeq ($(BR2_PACKAGE_FREESWITCH_MODULE_VIDEO),y)
> +FREESWITCH_LICENSE += BSD-3c (libvpx, libyuv)

I didn't notice until now, but we'll have issue with comma separation
when appending things this way. You should have a look at
package/qt/qt.mk to see how it was solved.

> +FREESWITCH_LICENSE_FILES += libs/libvpx/LICENSE libs/libyuv/LICENSE
> +FREESWITCH_CONF_OPTS += --enable-libvpx --enable-libyuv
> +FREESWITCH_DEPENDENCIES += host-yasm ffmpeg
> +FREESWITCH_ENABLED_MODULES += applications/mod_av
> +FREESWITCH_ENABLED_MODULES += applications/mod_fsv
> +
> +# freeswitch uses its own copy of libvpx since 1.6.7
> +# the implementation of libvpx into the freeswitch build system is not
> +# cross-compile friendly so we compile libvpx ourselves by copying
> +# most of packages/libvpx/libvpx.mk here, added by some --disable-
> +# options from freeswitch-1.6.7/Makefile.am, line 536
> +define FREESWITCH_CROSS_COMPILE_LIBVPX
> +	(cd $(@D)/libs/libvpx && \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	$(TARGET_CONFIGURE_ARGS) \
> +	LD="$(TARGET_CC)" \
> +	CROSS=$(GNU_TARGET_NAME) \
> +	./configure \
> +		--target=generic-gnu \
> +		--enable-pic \
> +		--prefix=/usr \
> +		--disable-docs \
> +		--disable-examples \
> +		--disable-install-bins \
> +		--disable-install-srcs \
> +		--disable-unit-tests \
> +		--extra-cflags="-fvisibility=hidden" \
> +	)
> +	$(TARGET_MAKE_ENV) $(LIBVPX_MAKE_ENV) $(MAKE) -C $(@D)/libs/libvpx
> +endef

This is really horrible. Could you instead fix the libvpx integration
to make it work? Report the problem upstream so that it get fixed? Use
the external version of libvpx?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
