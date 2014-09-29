From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Sep 2014 19:14:56 +0200
Subject: [Buildroot] [PATCH 2/2] package/dovecot-pigeonhole: New package
In-Reply-To: <1411925137-11284-2-git-send-email-bernd.kuhls@t-online.de>
References: <1411925137-11284-1-git-send-email-bernd.kuhls@t-online.de>
 <1411925137-11284-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140929191456.1f8900ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 28 Sep 2014 19:25:37 +0200, Bernd Kuhls wrote:

> diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
> new file mode 100644
> index 0000000..a55d2ec
> --- /dev/null
> +++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# dovecot-pigeonhole
> +#
> +################################################################################
> +
> +DOVECOT_PIGEONHOLE_VERSION = 0.4.3
> +DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.2-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
> +DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2
> +DOVECOT_PIGEONHOLE_LICENSE = LGPLv2.1

LGPLv2.1 or LGPLv2.1+ ?

> +DOVECOT_PIGEONHOLE_LICENSE_FILES = COPYING
> +DOVECOT_PIGEONHOLE_DEPENDENCIES = dovecot
> +
> +DOVECOT_PIGEONHOLE_CONF_OPT = \
> +	--with-dovecot=$(STAGING_DIR)/usr/lib \
> +	--with-moduledir=/usr/lib \
> +	--libexecdir=/usr/bin/dovecot \

Same question as dovecot: really /usr/bin/dovecot ?

> +	--sysconfdir=/etc \
> +	--localstatedir=/var
> +
> +define DOVECOT_PIGEONHOLE_POST_CONFIGURE
> +	for i in $$(find $(@D) -name "Makefile"); do \
> +		$(SED) 's%^pkglibdir =.*%pkglibdir = \$$(libdir)%' $$i; \
> +		$(SED) 's%^pkglibexecdir =.*%pkglibexecdir = \$$(libexecdir)%' $$i; \
> +		$(SED) 's%^sieve_plugindir =.*%sieve_plugindir = \$$(moduledir)%' $$i; \
> +	done
> +endef
> +
> +DOVECOT_PIGEONHOLE_POST_CONFIGURE_HOOKS += DOVECOT_PIGEONHOLE_POST_CONFIGURE

Like for dovecot.mk, it might be good to have a short comment above
explaining what's going on here.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
