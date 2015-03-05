From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 23:48:45 +0100
Subject: [Buildroot] [PATCH next v2 1/4] package/unixodbc: new package
In-Reply-To: <1425204461-27877-1-git-send-email-bernd.kuhls@t-online.de>
References: <1425204461-27877-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150305234845.27589bc7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun,  1 Mar 2015 11:07:38 +0100, Bernd Kuhls wrote:

> diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
> new file mode 100644
> index 0000000..2214385
> --- /dev/null
> +++ b/package/unixodbc/unixodbc.mk
> @@ -0,0 +1,40 @@
> +################################################################################
> +#
> +# unixodbc
> +#
> +################################################################################
> +
> +UNIXODBC_VERSION = 2.3.2
> +UNIXODBC_SOURCE = unixODBC-$(UNIXODBC_VERSION).tar.gz
> +UNIXODBC_SITE = ftp://ftp.unixodbc.org/pub/unixODBC
> +UNIXODBC_INSTALL_STAGING = YES
> +UNIXODBC_LICENSE = LGPLv2.1+

This should probably be:

	LGPLv2.1+ (library), GPLv2+ (programs)

> +UNIXODBC_LICENSE_FILES = COPYING

This should maybe also contain exe/COPYING

> +
> +UNIXODBC_CONF_OPTS += --enable-drivers --enable-driver-conf

+= not needed, = is sufficient.

> +
> +ifeq ($(BR2_PACKAGE_LIBICONV),y)
> +	UNIXODBC_CONF_OPTS += --enable-iconv
> +	UNIXODBC_DEPENDENCIES += libiconv

Don't indent those lines, we typically don't do this in most packages.

> +endif

Please add a 'else' case that does --disable-iconv explicitly.

> +ifeq ($(BR2_PACKAGE_READLINE),y)
> +	UNIXODBC_CONF_OPTS += --enable-readline
> +	UNIXODBC_DEPENDENCIES += readline
> +endif

Ditto.

> +
> +UNIXODBC_TARGET_BINS = \
> +	dltest \
> +	isql \
> +	iusql \
> +	odbc_config \
> +	odbcinst \
> +	slencheck
> +
> +define UNIXODBC_REMOVE_TARGET_BINS_FROM_STAGING
> +	rm -f $(addprefix $(STAGING_DIR)/usr/bin/,$(UNIXODBC_TARGET_BINS))
> +endef
> +
> +UNIXODBC_POST_INSTALL_STAGING_HOOKS += UNIXODBC_REMOVE_TARGET_BINS_FROM_STAGING

Why do we care about removing binaries from the staging directory? This
seems to just be useless complexity.

Can you look into these issues and resend an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
