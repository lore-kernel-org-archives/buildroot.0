From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Mar 2020 09:27:12 +0100
Subject: [Buildroot] [PATCH 1/1] unbound: new package
In-Reply-To: <20200321005706.22235-1-stefan@ott.net>
References: <20200321005706.22235-1-stefan@ott.net>
Message-ID: <20200321092712.49d22fd2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stefan,

Thanks for your patch, here are some more comments, on top of what
Yegor already reported.

On Sat, 21 Mar 2020 01:57:06 +0100
Stefan Ott <stefan@ott.net> wrote:

> diff --git a/package/unbound/Config.in b/package/unbound/Config.in
> new file mode 100644
> index 0000000000..3533164c03
> --- /dev/null
> +++ b/package/unbound/Config.in
> @@ -0,0 +1,35 @@
> +config BR2_PACKAGE_UNBOUND
> +	bool "unbound"
> +	select BR2_PACKAGE_EXPAT
> +	select BR2_PACKAGE_LIBEVENT
> +	select BR2_PACKAGE_OPENSSL
> +	help
> +		Unbound is a validating, recursive, and caching DNS resolver.
> +		It supports DNSSEC, QNAME minimisation, DNS-over-TLS and
> +		DNSCrypt.
> +
> +		https://www.unbound.net
> +
> +if BR2_PACKAGE_UNBOUND
> +	config BR2_PACKAGE_UNBOUND_DNSCRYPT
> +	bool "Enable DNSCrypt"
> +	select BR2_PACKAGE_LIBSODIUM
> +	help

Sub-options should not be indented. Also, we normally don't capitalize
options, so "enable DNSCrypt" would be more appropriate here.

Side note: it is "interesting" to see that unbound unconditionally uses
one crypto library (openssl), and then requires another crypto library
(libsodium) for dnscrypt support. Kind of strange.

> diff --git a/package/unbound/S70unbound b/package/unbound/S70unbound
> new file mode 100755
> index 0000000000..5079f4121f
> --- /dev/null
> +++ b/package/unbound/S70unbound

Could you rework your init script to be modeled after the template in
package/busybox/S01syslogd ? We are trying to unify our init scripts so
that they are as similar as possible to each other.


> diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
> new file mode 100644
> index 0000000000..81a620c170
> --- /dev/null
> +++ b/package/unbound/unbound.mk
> @@ -0,0 +1,57 @@
> +################################################################################
> +#
> +# unbound
> +#
> +################################################################################
> +
> +UNBOUND_VERSION = 1.10.0
> +UNBOUND_SITE = https://www.unbound.net/downloads
> +UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
> +UNBOUND_LICENSE = BSD-3-Clause
> +UNBOUND_LICENSE_FILES = LICENSE
> +UNBOUND_CONF_OPTS += \

The += here can be just =

> +	--disable-rpath \
> +	--disable-debug \
> +	--with-conf-file=/etc/unbound/unbound.conf \
> +	--with-pidfile=/var/run/unbound.pid \
> +	--with-rootkey-file=/etc/unbound/root.key \
> +	--enable-tfo-server \
> +	--enable-relro-now \

relro-now support is enabled system-wide using BR2_RELRO_PARTIAL /
BR2_RELRO_FULL, so individual packages should not enable it.

> +	--with-pic \
> +	--enable-pie \

Are these needed ?

Otherwise, looks good. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
