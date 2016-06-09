From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 16:07:10 +0200
Subject: [Buildroot] [PATCH 1/1] libuio: new package
In-Reply-To: <1465474971-4832-1-git-send-email-joris.lijssens@gmail.com>
References: <1465474971-4832-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <20160609160710.2ec96584@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Jun 2016 14:22:51 +0200, Joris Lijssens wrote:
> diff --git a/package/libuio/libuio.mk b/package/libuio/libuio.mk
> new file mode 100644
> index 0000000..ead6e69
> --- /dev/null
> +++ b/package/libuio/libuio.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# libuio
> +#
> +################################################################################
> +
> +LIBUIO_VERSION = 940861de278cb794bf9d775b76a4d1d4f9108607# v0.2.7
> +LIBUIO_SITE = $(call github,Linutronix,libuio,$(LIBUIO_VERSION))
> +LIBUIO_LICENSE = LGPLv2.1
> +LIBUIO_LICENSE_FILES = COPYING
> +LIBUIO_CONF_OPTS = --with-glib=no 
> +LIBUIO_INSTALL_STAGING = YES
> +LIBUIO_DEPENDENCIES = \
> +	host-pkgconf \

LIBUIO_DEPENDENCIES = host-pkgconf

is sufficient (i.e on one line).

> +ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
> +LIBUIO_DEPENDENCIES += argp-standalone
> +LIBUIO_CONF_ENV += LIBS="-largp"
> +endif
> +
> +define LIBUIO_RUN_AUTOGEN
> +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> +endef

This cannot work if you don't depend on host-automake, host-libtool and
host-autoconf. However, have you tried instead:

LIBUIO_AUTORECONF = YES

And if yes, why aren't you using this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
