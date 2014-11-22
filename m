From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 18:45:31 +0100
Subject: [Buildroot] [PATCH 1/1] mcelog: new package
In-Reply-To: <1416603546-9701-1-git-send-email-romain.naour@openwide.fr>
References: <1416603546-9701-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141122184531.606e8208@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri, 21 Nov 2014 21:59:06 +0100, Romain Naour wrote:

> +MCELOG_TRIGGERS = cache-error-trigger \
> +	dimm-error-trigger \
> +	page-error-trigger \
> +	socket-memory-error-trigger \
> +	bus-error-trigger \
> +	iomca-error-trigger \
> +	unknown-error-trigger
> +
> +define MCELOG_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
> +	CFLAGS="$(TARGET_CFLAGS)" \
> +	CPPFLAGS="$(TARGET_CPPFLAGS)" \
> +	-C $(@D) all

Indentation is wrong here, the continuation lines should be intended
with one more tab.

Passing CFLAGS and CPPFLAGS is useless, because those variables are
already part of $(TARGET_CONFIGURE_OPTS).

> +define MCELOG_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 755 $(@D)/mcelog $(TARGET_DIR)/usr/sbin/mcelog; \
> +	$(INSTALL) -D -m 644 $(@D)/mcelog.conf $(TARGET_DIR)/etc/mcelog/mcelog.conf; \
> +	for i in ${MCELOG_TRIGGERS} ; do \
> +		$(INSTALL) -m 755 $(@D)/triggers/$$i $(TARGET_DIR)/etc/mcelog; \
> +	done
> +endef

You should use $() instead of ${} when referencing make variables.
However, this whole thing seems useless: the 'install' target of the
mcelog Makefile does exactly this, so I've removed this custom stuff
and the MCELOG_TRIGGERS, and used 'make install' instead.

Committed to next with those changes.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
