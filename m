From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Aug 2012 18:29:09 +0200
Subject: [Buildroot] [PATCH v3 2/2] nodejs: new package
In-Reply-To: <1344761525-532-3-git-send-email-net147@gmail.com>
References: <1344761525-532-1-git-send-email-net147@gmail.com>
 <1344761525-532-3-git-send-email-net147@gmail.com>
Message-ID: <20120812182909.4988214d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 12 Aug 2012 18:52:05 +1000,
Jonathan Liu <net147@gmail.com> a ?crit :

> --- /dev/null
> +++ b/package/nodejs/Config.in
> @@ -0,0 +1,38 @@
> +config BR2_PACKAGE_NODEJS
> +	bool "nodejs"
> +	help
> +	  Event-driven I/O server-side JavaScript environment based on V8.
> +
> +	  http://nodejs.org/
> +
> +if BR2_PACKAGE_NODEJS
> +
> +config BR2_PACKAGE_NODEJS_SSL
> +	bool "enable SSL support"
> +	default y
> +	help
> +	  Enable SSL support.

In general, we don't add a suboption to enable OpenSSL support: is the
openssl package is enabled, we automatically enable openssl support in
the package.

> +if BR2_PACKAGE_NODEJS_SSL
> +
> +config BR2_PACKAGE_NODEJS_SHARED_OPENSSL
> +	bool "use shared OpenSSL"
> +	default y
> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  Use shared OpenSSL library instead of statically linked
> +	  OpenSSL bundled with node.js.
> +
> +endif

I think this should always be the case: use the Buildroot openssl
package if enabled, otherwise disable ssl support. Is there any
advantage to using the built-in version?

> +define NODEJS_CONFIGURE_CMDS
> +	(cd $(@D); rm -rf config.cache; \
> +		$(TARGET_CONFIGURE_ARGS) \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		PATH="$(HOST_DIR)/usr/bin:$(PATH)" \
> +		./configure \
> +		--prefix=/usr \
> +		--without-snapshot \
> +		$(if $(BR2_PACKAGE_NODEJS_SHARED_OPENSSL),--shared-openssl,) \
> +		$(if $(BR2_PACKAGE_NODEJS_SSL),,--without-ssl) \
> +		$(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
> +		$(if $(BR2_PACKAGE_NODEJS_WAF),,--without-waf) \
> +		--without-dtrace \
> +		--without-etw \
> +	)
> +endef

You're using the autotools-package infrastructure, so don't override
the _CONFIGURE_CMDS. You should simply need to do:

NODEJS_CONF_OPT =
	--without-snapshot \
	$(if $(BR2_PACKAGE_NODEJS_SHARED_OPENSSL),--shared-openssl,) \
	$(if $(BR2_PACKAGE_NODEJS_SSL),,--without-ssl) \
	$(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
	$(if $(BR2_PACKAGE_NODEJS_WAF),,--without-waf) \
	--without-dtrace \
	--without-etw

> +NODEJS_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
> +NODEJS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install

And you can get rid of this as well.

> +define NODEJS_INSTALL_TARGET_CMDS
> +       $(INSTALL) -D -m 775 $(@D)/out/Release/node $(TARGET_DIR)/usr/bin/node
> +endef
> +
> +define NODEJS_UNINSTALL_TARGET_CMDS
> +       rm -f $(TARGET_DIR)/usr/bin/node
> +endef
> +
> +$(eval $(autotools-package))

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
