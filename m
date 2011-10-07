From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 07 Oct 2011 14:34:49 +0200
Subject: [Buildroot] [PATCH 2/4] Add Transmission package
In-Reply-To: <87botvnr6s.fsf@macbook.be.48ers.dk>
References: <cover.1317636624.git.maxime.ripard@free-electrons.com>
 <cover.1317636624.git.maxime.ripard@free-electrons.com>
 <d6de2d00988b709d01b373cae8f326f889f67904.1317636624.git.maxime.ripard@free-electrons.com>
 <87botvnr6s.fsf@macbook.be.48ers.dk>
Message-ID: <4E8EF1E9.4080500@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 05/10/2011 22:01, Peter Korsgaard wrote:
>>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:
> 
>  Maxime> From: Maxime Ripard <maxime@free-electrons.com>
>  Maxime> Signed-off-by: Maxime Ripard <maxime@free-electrons.com>
> 
> Isn't this based on some of the earlier transmission patches? If so, it
> would be good to give those authors some credits.

Indeed, I've taken as a base as a base patches from
https://bugs.busybox.net/show_bug.cgi?id=743, and kept the authorship
for the init script, but for the .mk, as it was
incomplete/trivial/outdated, I did not mentionned authorship. Should I ?

>  Maxime> +++ b/package/transmission/transmission.mk
>  Maxime> @@ -0,0 +1,47 @@
>  Maxime> +#############################################################
>  Maxime> +#
>  Maxime> +# transmission
>  Maxime> +#
>  Maxime> +#############################################################
>  Maxime> +TRANSMISSION_VERSION = 2.33
>  Maxime> +TRANSMISSION_SITE = http://download.transmissionbt.com/files/
>  Maxime> +TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.bz2
>  Maxime> +TRANSMISSION_DEPENDENCIES = \
>  Maxime> +	host-pkg-config \
>  Maxime> +	libcurl \
>  Maxime> +	libevent \
>  Maxime> +	openssl \
>  Maxime> +	zlib
>  Maxime> +
>  Maxime> +TRANSMISSION_CONF_OPT = \
>  Maxime> +	--disable-gtk \
>  Maxime> +	--disable-libnotify \
>  Maxime> +	--disable-nls \
> 
> --disable-nls is normally handled automatically (depending on if the
> toolchain has locale support or not - See package/Makefile.in).

Ah, nice :)

>  Maxime> +	--enable-lightweight
>  Maxime> +
>  Maxime> +define TRANSMISSION_INIT_SCRIPT_INSTALL
>  Maxime> +	$(INSTALL) -m 0755 -D package/transmission/S92transmission \
>  Maxime> +		$(TARGET_DIR)/etc/init.d/S92transmission
> 
> The init script seems to have some configuration settings which might
> not suit everyone. For those cases we typically only install the file if
> it isn't already present in the rootfs skeleton - E.G. something like:
> 
>    [ -f $(TARGET_DIR)/etc/init.d/S92transmission ] || $(INSTALL) -m 0755 -D ..

You're right, will do.

> 
>  Maxime> +ifeq ($(BR2_PACKAGE_TRANSMISSION_REMOTE),y)
>  Maxime> +	TRANSMISSION_CONF_OPT += --enable-remote
>  Maxime> +else
>  Maxime> +	TRANSMISSION_CONF_OPT += --disable-remote
>  Maxime> +	TRANSMISSION_POST_INSTALL_TARGET_HOOKS += TRANSMISSION_INIT_SCRIPT_INSTALL
> 
> I don't really know transmission, but why is the init script only
> installed if this option isn't enabled? Transmission is a server
> (daemon), right? Presumably we should either have an option to not
> install the server (so you can use the -remote program to talk to a
> server on another machine). If we do that, the CLI option should depend
> on the server one.

As far as i can tell, the real back-end for transmission is
libtransmission, not transmission-daemon. transmission-daemon relies on
libtransmission just like transmission-gtk, but are both independant
from each other. But in order to control transmission-daemon, you might
need transmission-remote.

Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
