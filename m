From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 21:33:40 +0100
Subject: [Buildroot] [PATCH/next v3 2/4] package/polkit: bump to version
 0.116
In-Reply-To: <20191125175031.4086339-3-aduskett@gmail.com>
References: <20191125175031.4086339-1-aduskett@gmail.com>
 <20191125175031.4086339-3-aduskett@gmail.com>
Message-ID: <20191125213340.0ae2291f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Nov 2019 09:50:29 -0800
aduskett at gmail.com wrote:

> diff --git a/package/polkit/Config.in b/package/polkit/Config.in
> index ac17cb4dc3..7ba6dad993 100644
> --- a/package/polkit/Config.in
> +++ b/package/polkit/Config.in
> @@ -1,11 +1,18 @@
>  config BR2_PACKAGE_POLKIT
>  	bool "polkit"
> +	depends on BR2_INSTALL_LIBSTDCPP # spidermonkey
> +	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # spidermonkey

This one is no longer needed, as it is now implied by
BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS.

> +	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS # spidermonkey
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # spidermonkey
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # spidermonkey
>  	depends on BR2_USE_MMU # libglib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> -	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	depends on BR2_USE_WCHAR # libglib2
> -	select BR2_PACKAGE_LIBGLIB2
> +	depends on !BR2_STATIC_LIBS # spidermonkey
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # spidermonkey

All those new dependencies need to be propagated to places where
"select BR2_PACKAGE_POLKIT" is used:

package/systemd/Config.in:      select BR2_PACKAGE_POLKIT
package/udisks/Config.in:       select BR2_PACKAGE_POLKIT

> +	select BR2_PACKAGE_DBUS # runtime

So D-Bus is a runtime dependency.

> diff --git a/package/polkit/S50polkit b/package/polkit/S50polkit
> new file mode 100644
> index 0000000000..69b71ee500
> --- /dev/null
> +++ b/package/polkit/S50polkit
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +#
> +# Start polkitd
> +#
> +
> +umask 077
> +
> +case "$1" in
> +  start)
> +  echo "Starting polkitd..."
> +  /usr/lib/polkit-1/polkitd --no-debug &
> +  ;;
> +  *)
> +  echo "Usage: $0 {start}"
> +  exit 1
> +esac

Please provide a complete startup script, which follows the template at
package/busybox/S01syslogd, and uses start-stop-daemon. Since there was
no startup script so far, I would suggest to add it in a separate
commit. Ditto for the systemd unit. They are independent from the
version bump.

>  POLKIT_INSTALL_STAGING = YES
>  
> -POLKIT_DEPENDENCIES = libglib2 host-intltool expat
> +POLKIT_DEPENDENCIES = libglib2 host-intltool expat dbus spidermonkey

So D-Bus is a build time dependency, or a runtime-dependency ?

>  
>  # We could also support --with-authfw=pam
>  POLKIT_CONF_OPTS = \
>  	--with-authfw=shadow \
>  	--with-os-type=unknown \
>  	--disable-man-pages \
> -	--disable-examples
> +	--disable-examples \
> +	--disable-libelogind \
> +	--disable-libsystemd-login
> +
> +define POLKIT_USERS
> +	polkitd -1 polkitd -1 * /usr/lib/polkit-1 /bin/sh - Polkit Daemon
> +endef

Is this related to the version bump ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
