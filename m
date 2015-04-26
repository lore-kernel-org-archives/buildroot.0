From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 19:12:46 +0200
Subject: [Buildroot] [PATCH 2/3] package/libpjsip: new package
In-Reply-To: <1430060451-4075-3-git-send-email-bernd.kuhls@t-online.de>
References: <1430060451-4075-1-git-send-email-bernd.kuhls@t-online.de>
 <1430060451-4075-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150426191246.5e1c5242@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 26 Apr 2015 17:00:50 +0200, Bernd Kuhls wrote:

> diff --git a/package/libpjsip/0001-disable-tests.patch b/package/libpjsip/0001-disable-tests.patch
> new file mode 100644
> index 0000000..3b140ed
> --- /dev/null
> +++ b/package/libpjsip/0001-disable-tests.patch
> @@ -0,0 +1,12 @@

Missing patch description + SoB.


> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> new file mode 100644
> index 0000000..8f445e6
> --- /dev/null
> +++ b/package/libpjsip/libpjsip.mk
> @@ -0,0 +1,49 @@
> +################################################################################
> +#
> +# libpjsip
> +#
> +################################################################################
> +
> +LIBPJSIP_VERSION = 2.4
> +LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.bz2
> +LIBPJSIP_SITE = http://www.pjsip.org/release/$(LIBPJSIP_VERSION)
> +LIBPJSIP_INSTALL_STAGING = YES

License + license files?

> +
> +LIBPJSIP_DEPENDENCIES = libgsm libsrtp
> +
> +LIBPJSIP_CONF_ENV = \
> +	LD="$(TARGET_CC)" \
> +	CFLAGS="$(TARGET_CFLAGS) -DPJ_HAS_IPV6=1"
> +
> +LIBPJSIP_CONF_OPTS = \
> +	--with-external-gsm \
> +	--with-external-srtp \
> +	--disable-sound \
> +	--disable-resample \
> +	--disable-video \
> +	--disable-opencore-amr
> +
> +ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
> +LIBPJSIP_CONF_OPTS += --with-external-pa
> +LIBPJSIP_DEPENDENCIES += portaudio
> +endif

Can you add a 'else' clause to explicitly disable portaudio support?

> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +LIBPJSIP_DEPENDENCIES += openssl
> +LIBPJSIP_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
> +else
> +LIBPJSIP_CONF_OPTS += --disable-ssl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SPEEX),y)
> +LIBPJSIP_CONF_OPTS += --with-external-speex
> +LIBPJSIP_DEPENDENCIES += speex
> +else
> +LIBPJSIP_CONF_OPTS += --disable-speex-codec --disable-speex-aec
> +endif
> +
> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
> +LIBPJSIP_DEPENDENCIES += util-linux

Any way to --enable/--disable this?

> +endif
> +
> +$(eval $(autotools-package))

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
