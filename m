From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 19:33:14 +0200
Subject: [Buildroot] [PATCH] netcat-openbsd: new package
In-Reply-To: <1412529457-5978-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1412529457-5978-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141005193314.7cf9e891@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun,  5 Oct 2014 19:17:37 +0200, Maxime Hadjinlian wrote:

> diff --git a/package/Config.in b/package/Config.in
> index f488728..c4ea688 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1026,6 +1026,7 @@ endif
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	source "package/netcat/Config.in"
>  endif
> +	source "package/netcat-openbsd/Config.in"

I believe it should be within a BR2_PACKAGE_BUSYBOX_SHOW_OTHERS like
the normal netcat package.

Might be good in the commit log to explain why we would want
netcat-openbsd in addition to the normal netcat.

> diff --git a/package/netcat-openbsd/0001-port-to-linux-with-libsd.patch b/package/netcat-openbsd/0001-port-to-linux-with-libsd.patch
> new file mode 100644
> index 0000000..08567c7
> --- /dev/null
> +++ b/package/netcat-openbsd/0001-port-to-linux-with-libsd.patch
> @@ -0,0 +1,475 @@
> +From: Aron Xu <aron@debian.org>
> +Date: Mon, 13 Feb 2012 15:59:31 +0800
> +Subject: port to linux with libsd

If all those patches are inside the Debian package, what about using
the Debian patches directly?

See for example package/setserial/setserial.mk to see how it's done.

> diff --git a/package/netcat-openbsd/Config.in b/package/netcat-openbsd/Config.in
> new file mode 100644
> index 0000000..5b16103
> --- /dev/null
> +++ b/package/netcat-openbsd/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_NETCAT_OPENBSD
> +	bool "netcat-openbsd"

No select for libbsd ?

(and of course propagation of dependencies).

> +	help
> +          A simple Unix utility which reads and writes data across network
> +          connections using TCP or UDP protocol. It is designed to be a
> +          reliable "back-end" tool that can be used directly or easily driven
> +          by other programs and scripts. At the same time it is a feature-rich
> +          network debugging and exploration tool, since it can create almost
> +          any kind of connection you would need and has several interesting
> +          built-in capabilities.
> +
> +          This package contains the OpenBSD rewrite of netcat, including
> +          support for IPv6, proxies, and Unix sockets.
> +
> +          https://packages.debian.org/sid/netcat-openbsd
> diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
> new file mode 100644
> index 0000000..0c1ebd7
> --- /dev/null
> +++ b/package/netcat-openbsd/netcat-openbsd.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# netcat-openbsd
> +#
> +################################################################################
> +
> +NETCAT_OPENBSD_VERSION = 1.105
> +NETCAT_OPENBSD_SOURCE = netcat-openbsd_$(NETCAT_OPENBSD_VERSION).orig.tar.gz
> +NETCAT_OPENBSD_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/n/netcat-openbsd/
> +NETCAT_OPENBSD_LICENSE =
> +NETCAT_OPENBSD_LICENSE_FILES =

Hum.

> +NETCAT_OPENBSD_DEPENDENCIES = libbsd
> +
> +define NETCAT_OPENBSD_BUILD_CMDS
> +	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)

	$(TARGET_MAKE_ENV) $(MAKE) ...

> +endef
> +
> +define NETCAT_OPENBSD_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 755 -D $(@D)/nc $(TARGET_DIR)/usr/bin/nc
> +endef
> +
> +$(eval $(generic-package))

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
