From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 May 2013 09:56:04 +0200
Subject: [Buildroot] [PATCH v6 07/10] libvpx: new package libvpx
In-Reply-To: <1368655178-19176-8-git-send-email-spenser@gillilanding.com>
References: <1368655178-19176-1-git-send-email-spenser@gillilanding.com>
 <1368655178-19176-8-git-send-email-spenser@gillilanding.com>
Message-ID: <20130516095604.3eda6a6e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Wed, 15 May 2013 16:59:35 -0500, Spenser Gilliland wrote:
> --- /dev/null
> +++ b/package/multimedia/libvpx/libvpx.mk
> @@ -0,0 +1,52 @@
> +#############################################################
> +#
> +# libvpx
> +#
> +#############################################################
> +
> +LIBVPX_VERSION = v1.2.0
> +LIBVPX_SITE = http://git.chromium.org/webm/libvpx.git
> +LIBVPX_SITE_METHOD = git
> +
> +LIBVPX_INSTALL_STAGING = YES
> +LIBVPX_LICENSE = BSD-3c 
> +LIBVPX_LICENSE_FILES = LICENSE PATENTS 
> +
> +LIBVPX_INSTALL_STAGING = YES

Already set a few lines above.

> +
> +LIBVPX_CONF_ENV = \
> +	LD=$$CC \

This sounds strange. The target compiler is $(TARGET_CC), and should be
used with quotes to be compiled with ccache, so, probably:

	LD="$(TARGET_CC)"

And an explanation above that says why it is needed (i.e, LD being used
by the libvpx build system as a compiler).

> +	CROSS=$(GNU_TARGET_NAME)
> +
> +LIBVPX_CONF_OPT = \
> +	--disable-examples \
> +	--disable-docs \
> +	--disable-unit-tests
> +
> +define LIBVPX_CONFIGURE_CMDS
> +	(cd $(LIBVPX_SRCDIR) && rm -rf config.cache && \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	$(TARGET_CONFIGURE_ARGS) \
> +	$(LIBVPX_CONF_ENV) \
> +	./configure \
> +		--target=generic-gnu \
> +		--enable-pic \
> +		--prefix=/usr \
> +		$(SHARED_STATIC_LIBS_OPTS) \
> +		$(LIBVPX_CONF_OPT) \
> +	)
> +endef

Please add a comment somewhere that allows us to remember that you're
not using autotools-package because this 'configure' script is not an
autotools one, but some hand-written thing.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
