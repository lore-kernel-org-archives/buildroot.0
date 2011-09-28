From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Sep 2011 14:11:03 +0200
Subject: [Buildroot] [PATCH 2/4] Add Transmission package
In-Reply-To: <079c05b563d87b82246539f8a185740a2755075c.1317210509.git.maxime.ripard@free-electrons.com>
References: <cover.1317210509.git.maxime.ripard@free-electrons.com>
 <079c05b563d87b82246539f8a185740a2755075c.1317210509.git.maxime.ripard@free-electrons.com>
Message-ID: <20110928141103.1e2f4bea@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 28 Sep 2011 13:48:32 +0200,
Maxime Ripard <maxime.ripard@free-electrons.com> a ?crit :

> --- /dev/null
> +++ b/package/transmission/Config.in
> @@ -0,0 +1,35 @@
> +config BR2_PACKAGE_TRANSMISSION
> +	bool "transmission"
> +	depends on BR2_INET_IPV6
> +	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBEVENT
> +	help
> +	  Transmission is a cross-platform BitTorrent client.
> +
> +comment "Transmission requires a toolchain with IPv6 support"
> +	depends on !BR2_INET_IPV6
> +
> +config BR2_PACKAGE_TRANSMISSION_UTP
> +	bool "Transmission uTP support"
> +	depends on BR2_PACKAGE_TRANSMISSION
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	help
> +	  Install support for uTorrent Transport Protocol
> +
> +comment "uTP requires a toolchain with C++ support"
> +	depends on !BR2_INSTALL_LIBSTDCPP

		&& BR2_PACKAGE_TRANSMISSION

otherwise this comment will be visible even when transmission is not
enabled.

Or better, enclose all config options (except the main one) in a "if
BR2_PACKAGE_TRANSMISSION ... endif" clause, so you can remove all
depends on BR2_PACKAGE_TRANSMISSION.

> diff --git a/package/transmission/S92transmission b/package/transmission/S92transmission
> new file mode 100644
> index 0000000..71b0ca6
> --- /dev/null
> +++ b/package/transmission/S92transmission
> @@ -0,0 +1,169 @@
> +#!/bin/sh
> +### BEGIN INIT INFO
> +# Provides:          transmission-daemon
> +# Required-Start:    networking
> +# Required-Stop:     networking
> +# Default-Start:     2 3 5
> +# Default-Stop:      0 1 6
> +# Short-Description: Start the transmission BitTorrent daemon client.

I guess this is for some specific version of init, we don't usually
include this in Buildroot init scripts.

> +ifeq ($(BR2_PACKAGE_TRANSMISSION_REMOTE),y)
> +	TRANSMISSION_CONF_OPT += --enable-remote
> +else
> +	TRANSMISSION_CONF_OPT += --disable-remote
> +define TRANSMISSION_INIT_SCRIPT_INSTALL
> +	$(INSTALL) -m 0755 -D package/transmission/S92transmission \
> +		$(TARGET_DIR)/etc/init.d/S92transmission
> +endef
> +	TRANSMISSION_POST_INSTALL_TARGET_HOOKS += TRANSMISSION_INIT_SCRIPT_INSTALL
> +endif

To improve readability, probably you could put
TRANSMISSION_INIT_SCRIPT_INSTALL outside the ifeq..else..endif.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
