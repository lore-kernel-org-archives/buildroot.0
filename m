From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 30 Oct 2014 08:53:25 +0100 (CET)
Subject: [Buildroot] [PATCH] inetutils: new package
In-Reply-To: <1414624048-37143-1-git-send-email-kaszak@gmail.com>
Message-ID: <852735167.27218624.1414655605361.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


----- Mail original -----
> GNU Inetutils is a collection of common network programs.
> Clients included:
> dnsdomainname, ftp, hostname, ifconfig, logger, ping, ping6, rcp,
> rexec, rlogin, rsh, talk, telnet, tftp, traceroute, whois

ifconfig and hostname are already in the package "net-tools" are they
related ? is that a different provider for the package ?

> Servers included:
> ftpd, inetd, rexecd, rlogind, rshd, syslogd, talkd, telnetd, tftpd,
> uucpd
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
>  package/Config.in                                  |    3 +
>  package/inetutils/Config.in                        |   78
>  ++++++++++++++++++++
>  .../inetutils/inetutils-01-PATH_PROCNET_DEV.patch  |   21 ++++++
>  package/inetutils/inetutils.hash                   |    2 +
>  package/inetutils/inetutils.mk                     |   73
>  ++++++++++++++++++
>  5 files changed, 177 insertions(+)
>  create mode 100644 package/inetutils/Config.in
>  create mode 100644
>  package/inetutils/inetutils-01-PATH_PROCNET_DEV.patch
>  create mode 100644 package/inetutils/inetutils.hash
>  create mode 100644 package/inetutils/inetutils.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 5de4df9..fa894da 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1016,6 +1016,9 @@ endif
>  	source "package/igh-ethercat/Config.in"
>  	source "package/igmpproxy/Config.in"
>  	source "package/inadyn/Config.in"
> +if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +	source "package/inetutils/Config.in"
> +endif
>  	source "package/iperf/Config.in"
>  	source "package/iproute2/Config.in"
>  	source "package/ipsec-tools/Config.in"
> diff --git a/package/inetutils/Config.in
> b/package/inetutils/Config.in
> new file mode 100644
> index 0000000..28a34e7
> --- /dev/null
> +++ b/package/inetutils/Config.in
> @@ -0,0 +1,78 @@
> +config BR2_PACKAGE_INETUTILS
> +	bool "inetutils"
> +	depends on BR2_USE_WCHAR
> +	help
> +	  GNU Inetutils is a collection of common network programs.
> +	  Clients included:
> +	  dnsdomainname, ftp, hostname, ifconfig, logger, ping, ping6, rcp,
> +	  rexec, rlogin, rsh, talk, telnet, tftp, traceroute, whois
> +	  Servers included:
> +	  ftpd, inetd, rexecd, rlogind, rshd, syslogd, talkd, telnetd,
> tftpd,
> +	  uucpd
> +
> +if BR2_PACKAGE_INETUTILS
> +
> +config BR2_PACKAGE_INETUTILS_CLIENTS_CORE
> +	bool "core clients"
> +	default y
> +	help
> +	  Includes:
> +	  ftp, telnet, tftp
> +
> +config BR2_PACKAGE_INETUTILS_CLIENTS_UTIL
> +	bool "utility clients"
> +	depends on BR2_INET_IPV6
> +	help
> +	  Includes:
> +	  dnsdomainname, hostname, ifconfig, logger, ping, ping6,
> traceroute, whois
> +
> +comment "utility clients needs a toolchain w/ IPv6"
> +	depends on !BR2_INET_IPV6
> +
> +config BR2_PACKAGE_INETUTILS_CLIENTS_LEGACY
> +	bool "legacy clients"
> +	depends on BR2_INET_IPV6
> +	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	select BR2_PACKAGE_NCURSES
> +	help
> +	  Includes:
> +	  rcp, rexec, rlogin, rsh, talk
> +
> +comment "legacy clients needs a toolchain w/ IPv6, RPC"
> +	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +
> +config BR2_PACKAGE_INETUTILS_SERVERS_CORE
> +	bool "core servers"
> +	depends on BR2_INET_IPV6
> +	help
> +	  Includes:
> +	  ftpd, inetd, telnetd, tftpd
> +
> +comment "core servers needs a toolchain w/ IPv6"
> +	depends on !BR2_INET_IPV6
> +
> +config BR2_PACKAGE_INETUTILS_SERVERS_UTIL
> +	bool "utility servers"
> +	depends on BR2_INET_IPV6
> +	help
> +	  Includes:
> +	  syslogd
> +
> +comment "utility servers needs a toolchain w/ IPv6"
> +	depends on !BR2_INET_IPV6
> +
> +config BR2_PACKAGE_INETUTILS_SERVERS_LEGACY
> +	bool "legacy servers"
> +	depends on BR2_INET_IPV6
> +	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	help
> +	  Includes:
> +	  rexecd, rlogind, rshd, talkd, uucpd
> +
> +comment "legacy servers needs a toolchain w/ IPv6, RPC"
> +	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +
> +endif
> +
> +comment "inetutils needs a toolchain w/ wchar"
> +	depends on !BR2_USE_WCHAR
> diff --git a/package/inetutils/inetutils-01-PATH_PROCNET_DEV.patch
> b/package/inetutils/inetutils-01-PATH_PROCNET_DEV.patch
> new file mode 100644
> index 0000000..98ae46c
> --- /dev/null
> +++ b/package/inetutils/inetutils-01-PATH_PROCNET_DEV.patch
> @@ -0,0 +1,21 @@
> +Fix missing #define
> +
> +Patch from:
> +http://repository.timesys.com/buildsources/i/inetutils/inetutils-1.9.1/inetutils-1.9.1-PATH_PROCNET_DEV.patch
> +
> +Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> +
> +diff -Naur inetutils-1.9.1.orig/ifconfig/system/linux.c
> inetutils-1.9.1/ifconfig/system/linux.c
> +--- inetutils-1.9.1.orig/ifconfig/system/linux.c	2012-01-09
> 11:45:35.000000000 -0500
> ++++ inetutils-1.9.1/ifconfig/system/linux.c	2012-01-09
> 11:46:13.000000000 -0500
> +@@ -49,6 +49,10 @@
> + #include "../ifconfig.h"
> +
> +
> ++#ifndef PATH_PROCNET_DEV
> ++  #define PATH_PROCNET_DEV "/proc/net/dev"
> ++#endif
> ++
> + /* ARPHRD stuff.  */
> +
> + static void
> diff --git a/package/inetutils/inetutils.hash
> b/package/inetutils/inetutils.hash
> new file mode 100644
> index 0000000..6c1205e
> --- /dev/null
> +++ b/package/inetutils/inetutils.hash
> @@ -0,0 +1,2 @@
> +# calculated after checking PGP signature (signed by ams at gnu.org)
> +sha256
> 	e3783372540772bbadd6aa2c90f8a75511db4e7d40bbfa37ffdb1bc7a9697f3e
> 	inetutils-1.9.2.tar.xz
> diff --git a/package/inetutils/inetutils.mk
> b/package/inetutils/inetutils.mk
> new file mode 100644
> index 0000000..8ed3365
> --- /dev/null
> +++ b/package/inetutils/inetutils.mk
> @@ -0,0 +1,73 @@
> +################################################################################
> +#
> +# inetutils
> +#
> +################################################################################
> +
> +INETUTILS_VERSION = 1.9.2
> +INETUTILS_SITE = $(BR2_GNU_MIRROR)/inetutils
> +INETUTILS_SOURCE = inetutils-$(INETUTILS_VERSION).tar.xz
> +INETUTILS_LICENSE = GPLv3
> +INETUTILS_LICENSE_FILES = COPYING
> +
> +# Disable everything by default and enable if selected
> +INETUTILS_CONF_OPTS += --disable-clients --disable-servers
> +
> +ifeq ($(BR2_PACKAGE_INETUTILS_CLIENTS_CORE),y)
> +INETUTILS_CONF_OPTS += --enable-ftp \
> +		       --enable-telnet \
> +		       --enable-tftp
> +endif
> +
> +ifeq ($(BR2_PACKAGE_INETUTILS_CLIENTS_UTIL),y)
> +INETUTILS_CONF_OPTS += --enable-dnsdomainname \
> +		       --enable-hostname \
> +		       --enable-ifconfig \
> +		       --enable-logger \
> +		       --enable-ping \
> +		       --enable-ping6 \
> +		       --enable-traceroute \
> +		       --enable-whois
> +endif
> +
> +ifeq ($(BR2_PACKAGE_INETUTILS_CLIENTS_LEGACY),y)
> +# For talk client
> +INETUTILS_DEPENDENCIES += ncurses
> +INETUTILS_CONF_OPTS += --enable-rcp \
> +		       --enable-rexec \
> +		       --enable-rlogin \
> +		       --enable-rsh \
> +		       --enable-talk
> +endif
> +
> +ifeq ($(BR2_PACKAGE_INETUTILS_SERVERS_CORE),y)
> +INETUTILS_CONF_OPTS += --enable-ftpd \
> +		       --enable-inetd \
> +		       --enable-telnetd \
> +		       --enable-tftpd
> +endif
> +
> +ifeq ($(BR2_PACKAGE_INETUTILS_SERVERS_UTIL),y)
> +INETUTILS_CONF_OPTS += --enable-syslogd
> +endif
> +
> +ifeq ($(BR2_PACKAGE_INETUTILS_SERVERS_LEGACY),y)
> +INETUTILS_CONF_OPTS += --enable-rexecd \
> +		       --enable-rlogind \
> +		       --enable-rshd \
> +		       --enable-talkd \
> +		       --enable-uucpd
> +endif
> +
> +# Only possible with "core clients"
> +ifeq ($(BR2_INET_IPV6),)
> +INETUTILS_CONF_OPTS += --disable-ipv6
> +endif
> +
> +# If both inetutils and busybox are selected, make certain inetutils
> +# wins the fight over who gets to have their utils actually
> installed.
> +ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> +INETUTILS_DEPENDENCIES += busybox
> +endif
> +
> +$(eval $(autotools-package))
> --
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
