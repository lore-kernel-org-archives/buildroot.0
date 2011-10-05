From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Oct 2011 22:01:31 +0200
Subject: [Buildroot] [PATCH 2/4] Add Transmission package
In-Reply-To: <d6de2d00988b709d01b373cae8f326f889f67904.1317636624.git.maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Mon, 3 Oct 2011 12:10:32 +0200")
References: <cover.1317636624.git.maxime.ripard@free-electrons.com>
 <cover.1317636624.git.maxime.ripard@free-electrons.com>
 <d6de2d00988b709d01b373cae8f326f889f67904.1317636624.git.maxime.ripard@free-electrons.com>
Message-ID: <87botvnr6s.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> From: Maxime Ripard <maxime@free-electrons.com>
 Maxime> Signed-off-by: Maxime Ripard <maxime@free-electrons.com>

Isn't this based on some of the earlier transmission patches? If so, it
would be good to give those authors some credits.

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
 Maxime> +	--disable-nls \

--disable-nls is normally handled automatically (depending on if the
toolchain has locale support or not - See package/Makefile.in).

 Maxime> +	--enable-lightweight
 Maxime> +
 Maxime> +define TRANSMISSION_INIT_SCRIPT_INSTALL
 Maxime> +	$(INSTALL) -m 0755 -D package/transmission/S92transmission \
 Maxime> +		$(TARGET_DIR)/etc/init.d/S92transmission

The init script seems to have some configuration settings which might
not suit everyone. For those cases we typically only install the file if
it isn't already present in the rootfs skeleton - E.G. something like:

   [ -f $(TARGET_DIR)/etc/init.d/S92transmission ] || $(INSTALL) -m 0755 -D ..

 Maxime> +ifeq ($(BR2_PACKAGE_TRANSMISSION_REMOTE),y)
 Maxime> +	TRANSMISSION_CONF_OPT += --enable-remote
 Maxime> +else
 Maxime> +	TRANSMISSION_CONF_OPT += --disable-remote
 Maxime> +	TRANSMISSION_POST_INSTALL_TARGET_HOOKS += TRANSMISSION_INIT_SCRIPT_INSTALL

I don't really know transmission, but why is the init script only
installed if this option isn't enabled? Transmission is a server
(daemon), right? Presumably we should either have an option to not
install the server (so you can use the -remote program to talk to a
server on another machine). If we do that, the CLI option should depend
on the server one.

-- 
Bye, Peter Korsgaard
