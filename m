From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 May 2020 22:10:42 +0200
Subject: [Buildroot] [PATCH] package/openvpn: add option to use mbed TLS
 instead of OpenSSL
In-Reply-To: <20200511223108.4184-1-edo.rus@gmail.com>
References: <20200511223108.4184-1-edo.rus@gmail.com>
Message-ID: <20200515221042.011b8d33@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ed,

On Tue, 12 May 2020 01:31:07 +0300
Ed Spiridonov <edo.rus@gmail.com> wrote:

> Since 2.4 version, OpenVPN can be built using mbeb TLS as it's
> crypto backend, instead of OpenSSL.
> 
> About 2 Mb of uncompressed image size can be saved by replacing
> OpenSSL with mbed TLS.
> 
> Signed-off-by: Ed Spiridonov <edo.rus@gmail.com>

Thanks for your contribution! See below for some comments.

> diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
> index 0a16755..254fe74 100644
> --- a/package/openvpn/Config.in
> +++ b/package/openvpn/Config.in
> @@ -1,7 +1,6 @@
>  config BR2_PACKAGE_OPENVPN
>  	bool "openvpn"
>  	depends on BR2_USE_MMU # fork()
> -	select BR2_PACKAGE_OPENSSL

Could you change this to:

	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS

> +choice
> +	prompt "crypto backend"
> +	default BR2_PACKAGE_OPENVPN_OPENSSL
> +	help
> +	  Select crypto backend (OpenSSL/LibreSSL or mbed TLS)
> +
> +config BR2_PACKAGE_OPENVPN_OPENSSL
> +	bool "openssl"
> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  OpenSSL/LibreSSL is a default crypto backend
> +
> +config BR2_PACKAGE_OPENVPN_MBEDTLS
> +	bool "mbedtls"
> +	select BR2_PACKAGE_MBEDTLS
> +	help
> +	  mbed TLS is a compact crypto backend
> +
> +	  https://community.openvpn.net/openvpn/wiki/Using-mbedtls
> +
> +endchoice

Drop this new choice.

> diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
> index 4234675..20cebf0 100644
> --- a/package/openvpn/openvpn.mk
> +++ b/package/openvpn/openvpn.mk
> @@ -7,18 +7,31 @@
>  OPENVPN_VERSION = 2.4.9
>  OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
>  OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
> -OPENVPN_DEPENDENCIES = host-pkgconf openssl
> +OPENVPN_DEPENDENCIES = host-pkgconf
> +ifeq ($(BR2_PACKAGE_OPENVPN_MBEDTLS),y)
> +OPENVPN_DEPENDENCIES += mbedtls
> +else
> +OPENVPN_DEPENDENCIES += openssl
> +endif
> +
>  OPENVPN_LICENSE = GPL-2.0
>  OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
>  OPENVPN_CONF_OPTS = \
>  	--enable-iproute2 \
> -	--with-crypto-library=openssl \
>  	$(if $(BR2_STATIC_LIBS),--disable-plugins)
>  OPENVPN_CONF_ENV = IFCONFIG=/sbin/ifconfig \
>  	NETSTAT=/bin/netstat \
>  	ROUTE=/sbin/route \
>  	IPROUTE=/sbin/ip
>  
> +ifeq ($(BR2_PACKAGE_OPENVPN_MBEDTLS),y)

Use BR2_PACKAGE_MBEDTLS here

> +OPENVPN_CONF_OPTS += \
> +	--with-crypto-library=mbedtls
> +else
> +OPENVPN_CONF_OPTS += \
> +	--with-crypto-library=openssl
> +endif

This way, we use mbedtls if available, otherwise we use OpenSSL.

Could you send an updated version that implements this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
