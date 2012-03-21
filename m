From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Mar 2012 14:21:02 +0100
Subject: [Buildroot] [PATCH v2] ushare: new package
In-Reply-To: <1332335538-23508-1-git-send-email-gustavo@zacarias.com.ar>
References: <1332335538-23508-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120321142102.5c5999a6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 21 Mar 2012 10:12:18 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> --- /dev/null
> +++ b/package/ushare/ushare.mk
> @@ -0,0 +1,26 @@
> +#############################################################
> +#
> +# ushare
> +#
> +#############################################################
> +
> +USHARE_VERSION = 1.1a
> +USHARE_SOURCE = ushare-$(USHARE_VERSION).tar.bz2
> +USHARE_SITE = http://ushare.geexbox.org/releases
> +USHARE_DEPENDENCIES = host-pkg-config libupnp
> +
> +define USHARE_CONFIGURE_CMDS
> +	(cd $(@D); \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		./configure --prefix=/usr $(DISABLE_NLS) --cross-compile \
> +		--cross-prefix="$(TARGET_CROSS)" --sysconfdir=/etc \
> +		--disable-strip --disable-debug \
> +	)
> +endef
> +
> +define USHARE_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +	rm -f $(TARGET_DIR)/etc/init.d/ushare
> +endef
> +
> +$(eval $(call GENTARGETS))

With GENTARGETS, xxx_BUILD_CMDS is empty by default. Are you sure this
builds?

Also, can you add a comment just before USHARE_CONFIGURE_CMDS saying
that despite the appearance, autotools are not used. However, I am sure
in the future many people will wonder why AUTOTARGETS was not used.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
