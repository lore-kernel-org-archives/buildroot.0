From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Sep 2014 19:13:14 +0200
Subject: [Buildroot] [PATCH 1/2] package/dovecot: New package
In-Reply-To: <1411925137-11284-1-git-send-email-bernd.kuhls@t-online.de>
References: <1411925137-11284-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140929191314.36b87a70@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 28 Sep 2014 19:25:36 +0200, Bernd Kuhls wrote:
> +DOVECOT_VERSION_MAJOR = 2.2
> +DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).13
> +DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
> +DOVECOT_INSTALL_STAGING = YES
> +DOVECOT_LICENSE = LGPLv2.1; some exceptions are mentioned in COPYING

I think we generally say only "<foo> with exceptions".

Did you check that it's LGPLv2.1 vs. LGPLv2.1+ ?

> +DOVECOT_LICENSE_FILES = COPYING COPYING.LGPL COPYING.MIT
> +DOVECOT_DEPENDENCIES = host-pkgconf openssl zlib $(if $(BR2_PACKAGE_LIBICONV),libiconv)

If you do this with libiconv, then don't you need:

	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

libiconv is a replacement for the missing iconv stuff in libc when
locale support is not enabled.

If zlib is really a mandatory dependency, then it should be selected
from the Config.in file.

> +DOVECOT_CONF_OPT = \
> +	--with-dovecot=/usr/lib \
> +	--without-dovecot-install-dirs \
> +	--libexecdir=/usr/bin/dovecot \

This looks weird. You really want /usr/bin/dovecot as a lib directory?
Shouldn't this be /usr/lib/dovecot instead?

> +	--with-moduledir=/usr/lib \
> +	--sysconfdir=/etc \
> +	--localstatedir=/var \
> +	--without-sql \
> +	--with-zlib \

Optional dependency?

> +	--with-ssl=openssl \

Ditto?

> +	--without-docs
> +
> +ifeq ($(BR2_PACKAGE_BZIP2),y)
> +DOVECOT_CONF_OPT += --with-bzlib
> +DOVECOT_DEPENDENCIES += bzip2
> +else
> +DOVECOT_CONF_OPT += --without-bzlib
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBCAP),y)
> +DOVECOT_CONF_OPT += --with-libcap
> +DOVECOT_DEPENDENCIES += libcap
> +else
> +DOVECOT_CONF_OPT += --without-libcap
> +endif
> +
> +define DOVECOT_POST_CONFIGURE
> +	for i in $$(find $(@D) -name "Makefile"); do \
> +		$(SED) 's%^pkglibdir =.*%pkglibdir = \$$(libdir)%' $$i; \
> +		$(SED) 's%^pkglibexecdir =.*%pkglibexecdir = \$$(libexecdir)%' $$i; \
> +	done
> +endef
> +
> +DOVECOT_POST_CONFIGURE_HOOKS += DOVECOT_POST_CONFIGURE
> +
> +define DOVECOT_FIX_STAGING_DOVECOT_CONFIG
> +	$(SED) 's,^LIBDOVECOT_INCLUDE=.*$$,LIBDOVECOT_INCLUDE=\"-I$(STAGING_DIR)/usr/include/dovecot\",' $(STAGING_DIR)/usr/lib/dovecot-config
> +	$(SED) 's,^dovecot_pkglibexecdir=.*$$,dovecot_pkglibexecdir=/usr/bin,' $(STAGING_DIR)/usr/lib/dovecot-config
> +endef

dovecot-config is in $(STAGING_DIR)/usr/lib ? This looks weird.

> +
> +DOVECOT_POST_INSTALL_STAGING_HOOKS += DOVECOT_FIX_STAGING_DOVECOT_CONFIG
> +
> +$(eval $(autotools-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
