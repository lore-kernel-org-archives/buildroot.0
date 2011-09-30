From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Sep 2011 21:44:49 +0200
Subject: [Buildroot] [PATCH 4/4] Add the libplayer package
In-Reply-To: <fe12fce8c39412837610eba989ec416ec7049e35.1317210509.git.maxime.ripard@free-electrons.com>
References: <cover.1317210509.git.maxime.ripard@free-electrons.com>
 <fe12fce8c39412837610eba989ec416ec7049e35.1317210509.git.maxime.ripard@free-electrons.com>
Message-ID: <20110930214449.5139eb84@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 28 Sep 2011 13:48:34 +0200,
Maxime Ripard <maxime.ripard@free-electrons.com> a ?crit :

> --- /dev/null
> +++ b/package/multimedia/libplayer/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_LIBPLAYER
> +	depends on BR2_LARGEFILE
> +	bool "libplayer"
> +	help
> +	  libplayer provides a generic A/V API that relies on various multimedia
> +	  player for Linux systems. It currently supports MPlayer, xine VLC and
> +	  GStreamer only
> +
> +	  http://libplayer.geexbox.org/
> +
> +comment "Libplayer requires a toolchain with LARGEFILE support"
> +	depends on !BR2_LARGEFILE
> +
> +config BR2_PACKAGE_LIBPLAYER_MPLAYER
> +	depends on BR2_PACKAGE_MPLAYER
> +	bool "Libplayer mplayer backend"
> +
> +config BR2_PACKAGE_LIBPLAYER_GSTREAMER
> +	depends on BR2_PACKAGE_GSTREAMER
> +	bool "Libplayer GStreamer backend"

What happens if we select none of those backends ?

> +define LIBPLAYER_CONFIGURE_CMDS
> +	(cd $(@D) && rm -rf config.cache && \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	$(TARGET_CONFIGURE_ARGS) \
> +	$(LIBPLAYER_CONF_ENV) \

LIBPLAYER_CONF_ENV is not defined anywhere.

> +	./configure \
> +		--prefix=/usr \
> +		--cross-compile \
> +		$(SHARED_STATIC_LIBS_OPTS) \
> +		$(QUIET) $(LIBPLAYER_CONF_OPT) \
> +	)

This looks like a normal ./configure invocation. Why don't you use the
default foo_CONFIGURE_CMDS provided by the autotargets infrastructure ?

> +ifeq ($(BR2_PACKAGE_LIBPLAYER_PYTHON),y)

This option is not defined in your Config.in.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
