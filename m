From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jun 2012 09:22:45 +0200
Subject: [Buildroot] [PATCH] inadyn: new package for inadyn DDNS
 client-updater
In-Reply-To: <1340056769-19014-1-git-send-email-david.c.purdy@gmail.com>
References: <1340056769-19014-1-git-send-email-david.c.purdy@gmail.com>
Message-ID: <20120619092245.4d145587@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 18 Jun 2012 16:59:29 -0500,
Dave Purdy <david.c.purdy@gmail.com> a ?crit :

> inadyn is a DynamicDNS client/updater which works with dyndns.com, noip.com
> and many other DDNS providers.  It is minimal in footprint and requirements,
> supports IP caching, multiple providers, multiple domain names, and 
> a variety of other situations.
> 
> 
> Signed-off-by: Dave Purdy <david.c.purdy@gmail.com>

Looks good, a minor comment below.

Have you checked that it builds properly with a toolchain without IPv6.
From a 2 minutes look, I don't see any IPv6 specificities in the code,
but it might be worth checking this.

> diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
> new file mode 100644
> index 0000000..583d1b2
> --- /dev/null
> +++ b/package/inadyn/inadyn.mk
> @@ -0,0 +1,21 @@
> +#############################################################
> +#
> +# inadyn
> +#
> +#############################################################
> +
> +INADYN_VERSION = 1.98.1
> +INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.bz2
> +INADYN_SITE = https://github.com/downloads/troglobit/inadyn
> +
> +define INADYN_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +endef
> +
> +define INADYN_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/src/inadyn $(TARGET_DIR)/usr/sbin/inadyn
> +	$(INSTALL) -D -m 0644 	package/inadyn/inadyn.conf $(TARGET_DIR)/etc/inadyn.conf
> +	$(INSTALL) -D -m 0755   package/inadyn/S70inadyn.etc.initd $(TARGET_DIR)/etc/init.d/S70inadyn

For consistency reasons, You should just name the init script
package/inadyn/S70inadyn, so need to use S70.inadyn.etc.initd since we
don't do this anywhere in Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
