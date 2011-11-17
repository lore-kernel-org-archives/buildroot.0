From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 17 Nov 2011 21:03:05 +0100
Subject: [Buildroot] [PATCH] Add Transmission package
In-Reply-To: <1318432931-13347-1-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Wed, 12 Oct 2011 17:22:11 +0200")
References: <d6de2d00988b709d01b373cae8f326f889f67904.1317636624.git.maxime.ripard@free-electrons.com>
 <1318432931-13347-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <87k46ya552.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> From: Maxime Ripard <maxime@free-electrons.com>
 Maxime> Initial work by marcus.osdoba at googlemail.com

Committed with minor comments (see below) to next, thanks.

 Maxime> +++ b/package/transmission/Config.in
 Maxime> @@ -0,0 +1,35 @@
 Maxime> +config BR2_PACKAGE_TRANSMISSION
 Maxime> +	bool "transmission"
 Maxime> +	depends on BR2_INET_IPV6
 Maxime> +	select BR2_PACKAGE_ZLIB
 Maxime> +	select BR2_PACKAGE_OPENSSL
 Maxime> +	select BR2_PACKAGE_LIBCURL
 Maxime> +	select BR2_PACKAGE_LIBEVENT
 Maxime> +	help
 Maxime> +	  Transmission is a cross-platform BitTorrent client.
 Maxime> +
 Maxime> +comment "Transmission requires a toolchain with IPv6 support"
 Maxime> +	depends on !BR2_INET_IPV6
 Maxime> +

This comment should go to the end of the file, otherwise the sub options
don't get indented under the main transmission option in menuconfig.

 Maxime> +++ b/package/transmission/transmission.mk
 Maxime> @@ -0,0 +1,47 @@
 Maxime> +#############################################################
 Maxime> +#
 Maxime> +# transmission
 Maxime> +#
 Maxime> +#############################################################
 Maxime> +TRANSMISSION_VERSION = 2.33
 Maxime> +TRANSMISSION_SITE = http://download.transmissionbt.com/files/
 Maxime> +TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.bz2
 Maxime> +TRANSMISSION_DEPENDENCIES = \
 Maxime> +	host-pkg-config \
 Maxime> +	libcurl \
 Maxime> +	libevent \
 Maxime> +	openssl \
 Maxime> +	zlib
 Maxime> +
 Maxime> +TRANSMISSION_CONF_OPT = \
 Maxime> +	--disable-gtk \
 Maxime> +	--disable-libnotify \
 Maxime> +	--enable-lightweight
 Maxime> +
 Maxime> +define TRANSMISSION_INIT_SCRIPT_INSTALL
 Maxime> +	[ -f $(TARGET_DIR)/etc/init.d/S92transmission ] || \
 Maxime> +		$(INSTALL) -m 0755 -D package/transmission/S92transmission \
 Maxime> +			$(TARGET_DIR)/etc/init.d/S92transmission
 Maxime> +endef
 Maxime> +
 Maxime> +ifeq ($(BR2_PACKAGE_TRANSMISSION_UTP),y)
 Maxime> +	TRANSMISSION_CONF_OPT += --enable-utp
 Maxime> +else
 Maxime> +	TRANSMISSION_CONF_OPT += --disable-utp
 Maxime> +endif
 Maxime> +
 Maxime> +ifeq ($(BR2_PACKAGE_TRANSMISSION_CLI),y)
 Maxime> +	TRANSMISSION_CONF_OPT += --enable-cli
 Maxime> +else
 Maxime> +	TRANSMISSION_CONF_OPT += --disable-cli
 Maxime> +endif
 Maxime> +
 Maxime> +
 Maxime> +ifeq ($(BR2_PACKAGE_TRANSMISSION_REMOTE),y)
 Maxime> +	TRANSMISSION_CONF_OPT += --enable-remote
 Maxime> +else
 Maxime> +	TRANSMISSION_CONF_OPT += --disable-remote
 Maxime> +	TRANSMISSION_POST_INSTALL_TARGET_HOOKS += TRANSMISSION_INIT_SCRIPT_INSTALL

I don't see the connection between transmission-remote and the the init
script for transmission-daemon? I've instead added a TRANSMISSION_DAEMON
option, and only install the init script if that is enabled instead.

-- 
Bye, Peter Korsgaard
