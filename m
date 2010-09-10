From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Sep 2010 08:55:12 +0200
Subject: [Buildroot] [PATCH] introducing transmission bittorrent client
In-Reply-To: <1284064132-21384-2-git-send-email-marcus.osdoba@googlemail.com>
References: <1284064132-21384-1-git-send-email-marcus.osdoba@googlemail.com>
	<1284064132-21384-2-git-send-email-marcus.osdoba@googlemail.com>
Message-ID: <20100910085512.4aa82926@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marcus,

On Thu,  9 Sep 2010 22:28:52 +0200
Marcus Osdoba <marcus.osdoba@googlemail.com> wrote:

>  fs/skeleton/var/transmission         |    1 +

I'd prefer not to add this to the generic skeleton, and instead have
the Transmission installation process create this symlink.

> --- /dev/null
> +++ b/package/transmission/Config.in
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_TRANSMISSION
> +	bool "transmission"
> +	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBEVENT
> +	default n

default n is not needed, as this is the default.

> +	help
> +	  transmission - Transmission BitTorrent Client
> +
> +config BR2_PACKAGE_TRANSMISSION_CLI
> +	bool "transmissioncli"
> +	depends on BR2_PACKAGE_TRANSMISSION
> +	default no

Not needed.

> +	help
> +	  Install transmission command line interface.
> +
> +config BR2_PACKAGE_TRANSMISSION_REMOTE
> +	bool "transmission-remote"
> +	depends on BR2_PACKAGE_TRANSMISSION
> +	default yes

I'm not sure "default yes" works, we use "default y" everywhere.

> +	help
> +	  Install transmission remote management tool.
> +	if [ ! -z "$NET_INTERFACE" ]; then
> +		# poll network interface
> +		IFCONFIG_OUTPUT=`ifconfig $NET_INTERFACE`
> +		IP_ADDR=`expr match "$IFCONFIG_OUTPUT" '.*inet addr:\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\).*'`
> +		while [ -z "$IP_ADDR" ]
> +		do
> +			sleep 5
> +			IFCONFIG_OUTPUT=`ifconfig $NET_INTERFACE`
> +			IP_ADDR=`expr match "$IFCONFIG_OUTPUT" '.*inet addr:\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\).*'`
> +		done

Hum, this will stall the boot process quite a bit. We don't have any
other solution ?

(I think for the initial introduction of transmission to Buildroot,
it's ok, since it won't be a regression, but in the long run, having
such scripts doesn't really look nice).

> +++ b/package/transmission/transmission.mk
> @@ -0,0 +1,32 @@
> +#############################################################
> +#
> +# transmission
> +#
> +#############################################################
> +#
> +#
> +TRANSMISSION_VERSION=2.04
> +TRANSMISSION_SOURCE=transmission-$(TRANSMISSION_VERSION).tar.bz2
> +TRANSMISSION_SITE=http://mirrors.m0k.org/transmission/files/
> +TRANSMISSION_LIBTOOL_PATCH=NO
> +TRANSMISSION_DEPENDENCIES= host-pkg-config host-intltool zlib openssl libcurl libevent
> +
> +TRANSMISSION_CONF_OPT = --prefix=/usr \

Remove --prefix=/usr, that's the default.

> +			--localstatedir=/var/transmission \
> +			--disable-gtk \
> +			--disable-libnotify \
> +			--enable-daemon \
> +			--with-zlib=$(STAGING_DIR) \
> +			$(DISABLE_NLS) \
> +			$(DISABLE_LARGEFILE)

Remove $(DISABLE_NLS) and $(DISABLE_LARGEFILE), that's the default.

To know what the default options are, look at:
 http://git.buildroot.net/buildroot/tree/package/Makefile.autotools.in#n88

The rest looks good to me.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
