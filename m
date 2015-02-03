From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 14:33:26 +0100
Subject: [Buildroot] [PATCH v2] inetutils: new package
In-Reply-To: <1415802178-37048-1-git-send-email-kaszak@gmail.com>
References: <1415802178-37048-1-git-send-email-kaszak@gmail.com>
Message-ID: <20150203143326.02b6e54f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

On Wed, 12 Nov 2014 15:22:58 +0100, Karoly Kasza wrote:

> diff --git a/package/inetutils/0001-PATH_PROCNET_DEV.patch b/package/inetutils/0001-PATH_PROCNET_DEV.patch
> new file mode 100644
> index 0000000..e987253
> --- /dev/null
> +++ b/package/inetutils/0001-PATH_PROCNET_DEV.patch

A lowercase file name would be nicer here.

> diff --git a/package/inetutils/Config.in b/package/inetutils/Config.in
> new file mode 100644
> index 0000000..8f57320
> --- /dev/null
> +++ b/package/inetutils/Config.in
> @@ -0,0 +1,172 @@
> +menuconfig BR2_PACKAGE_INETUTILS
> +	bool "inetutils"
> +	depends on BR2_USE_WCHAR
> +	help
> +	  GNU Inetutils is a collection of common network programs.
> +	  Clients included:
> +	  dnsdomainname, ftp, hostname, ifconfig, logger, ping, ping6, rcp,
> +	  rexec, rlogin, rsh, talk, telnet, tftp, traceroute, whois
> +	  Servers included:
> +	  ftpd, inetd, rexecd, rlogind, rshd, syslogd, talkd, telnetd, tftpd,
> +	  uucpd
> +
> +if BR2_PACKAGE_INETUTILS
> +
> +config BR2_PACKAGE_INETUTILS_DNSDOMAINNAME
> +	bool "dnsdomainname"
> +
> +comment "dnsdomainname overwrites the net-tools package's version if selected!"
> +	depends on BR2_PACKAGE_INETUTILS_DNSDOMAINNAME && BR2_PACKAGE_NET_TOOLS

We don't want to have these comments. Instead, in the Config.in helptext
you can indicate something like: "This package may override programs
that will overwrite programs already installed by the following
packages: net-tools, ..., ..., ...".

> +config BR2_PACKAGE_INETUTILS_PING
> +	bool "ping"
> +	depends on BR2_INET_IPV6

ping6 needs IPv6. But why ping also needs IPv6 ?

> +config BR2_PACKAGE_INETUTILS_RCP
> +	bool "rcp"
> +	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC

Isn't rcp like rsh and al. ? What is the relation with RPC support?

> +config BR2_PACKAGE_INETUTILS_RLOGIN
> +	bool "rlogin"
> +	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC

Same here.

If RPC is really needed, I guess we want to be able to use either the
native RPC support of the toolchain, or libtirpc.


> +config BR2_PACKAGE_INETUTILS_RLOGIND
> +	bool "rlogind"
> +	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC

Also RPC support needed?

> diff --git a/package/inetutils/inetutils.mk b/package/inetutils/inetutils.mk
> new file mode 100644
> index 0000000..fa8f967
> --- /dev/null
> +++ b/package/inetutils/inetutils.mk
> @@ -0,0 +1,103 @@
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

The license seems to be GPLv3+, not GPLv3.

> +define INETUTILS_PERMISSIONS
> +/bin/ping			f 4755 0 0 - - - - -
> +/bin/ping6			f 4755 0 0 - - - - -
> +/usr/bin/rlogin			f 4755 0 0 - - - - -
> +/usr/bin/rsh			f 4755 0 0 - - - - -
> +/usr/bin/rcp			f 4755 0 0 - - - - -
> +/usr/bin/traceroute		f 4755 0 0 - - - - -
> +endef

This will not work, since some of the programs are optional, and the
<pkg>_PERMISSIONS mechanism will bail out with an error if a file
doesn't exist. So you have to do something like:

ifeq ($(BR2_PACKAGE_INETUTILS_PING),y)
INETUTILS_PERMISSIONS += /bin/ping f 4755 0 0 - - - - -$(sep)
INETUTILS_CONF_OPTS += --enable-ping
INETUTILS_USR_BINS_MOVE += ping
endif

> +INETUTILS_CONF_OPTS += --libexecdir=/usr/sbin --disable-clients --disable-servers

Please add a comment that explains why we pass --libexecdir=/usr/sbin.

> +INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_BUSYBOX),busybox)
> +INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_NCURSES),ncurses)
> +INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_NET_TOOLS),net-tools)
> +INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_IPUTILS),iputils)
> +INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_RSH_REDONE),rsh-redone)
> +INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_SYSKLOGD),sysklogd)
> +INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_WHOIS),whois)

I think we should split these dependencies in two categories with a
comment:

# ncurses is a dependency of some inetutils programs
... ncurses stuff here ....

# inetutils provides programs also provided by other packages, and we
# want inetutils to win over those packages
... busybox, net-tools, iputils, rsh-redone, sysklogd, whois ....


> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_DNSDOMAINNAME),--enable-dnsdomainname)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_FTP),--enable-ftp)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_HOSTNAME),--enable-hostname)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_IFCONFIG),--enable-ifconfig)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_LOGGER),--enable-logger)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_PING),--enable-ping)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_PING6),--enable-ping6)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_RCP),--enable-rcp)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_REXEC),--enable-rexec)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_RLOGIN),--enable-rlogin)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_RSH),--enable-rsh)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_TALK),--enable-talk)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_TELNET),--enable-telnet)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_TFTP),--enable-tftp)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_TRACEROUTE),--enable-traceroute)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_WHOIS),--enable-whois)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_FTPD),--enable-ftpd)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_INETD),--enable-inetd)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_REXECD),--enable-rexecd)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_RLOGIND),--enable-rlogind)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_RSHD),--enable-rshd)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_SYSLOGD),--enable-syslogd)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_TALKD),--enable-talkd)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_TELNETD),--enable-telnetd)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_TFTPD),--enable-tftpd)
> +INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_UUCPD),--enable-uucpd)
> +
> +# Move binaries to proper path (possibly overwriting other utility versions)
> +define INETUTILS_MOVE_PROPER_PATH
> +	if [ -e $(TARGET_DIR)/usr/bin/dnsdomainname ]; then \
> +		mv -f $(TARGET_DIR)/usr/bin/dnsdomainname $(TARGET_DIR)/bin/dnsdomainname; \
> +	fi;
> +	if [ -e $(TARGET_DIR)/usr/bin/ping ]; then \
> +		mv -f $(TARGET_DIR)/usr/bin/ping $(TARGET_DIR)/bin/ping; \
> +	fi;
> +	if [ -e $(TARGET_DIR)/usr/bin/ping6 ]; then \
> +		mv -f $(TARGET_DIR)/usr/bin/ping6 $(TARGET_DIR)/bin/ping6; \
> +	fi;
> +	if [ -e $(TARGET_DIR)/usr/bin/hostname ]; then \
> +		mv -f $(TARGET_DIR)/usr/bin/hostname $(TARGET_DIR)/bin/hostname; \
> +	fi;
> +	if [ -e $(TARGET_DIR)/usr/sbin/syslogd ]; then \
> +		mv -f $(TARGET_DIR)/usr/sbin/syslogd $(TARGET_DIR)/sbin/syslogd; \
> +	fi;
> +	if [ -e $(TARGET_DIR)/usr/bin/ifconfig ]; then \
> +		mv -f $(TARGET_DIR)/usr/bin/ifconfig $(TARGET_DIR)/sbin/ifconfig; \
> +	fi;

Use the INETUTILS_USR_BINS_MOVE variable that will contain the list
of programs to move from /usr/bin to /bin, and INETUTILS_USR_SBINS_MOVE
will contain the list of programs to move from /usr/sbin to /sbin.

> +# Remove iputils and rsd-redone utilities to avoid redundancy
> +define INETUTILS_REMOVE_REDUNDANT_TOOLS
> +	if [ -e $(TARGET_DIR)/usr/sbin/in.rlogind ] && [ -e $(TARGET_DIR)/usr/sbin/rlogind ]; then \
> +		rm $(TARGET_DIR)/usr/sbin/in.rlogind; \
> +	fi;
> +	if [ -e $(TARGET_DIR)/usr/sbin/in.rshd ] && [ -e $(TARGET_DIR)/usr/sbin/rshd ]; then \
> +		rm $(TARGET_DIR)/usr/sbin/in.rshd; \
> +	fi;
> +	if [ -e $(TARGET_DIR)/usr/sbin/in.tftpd ] && [ -e $(TARGET_DIR)/usr/sbin/tftpd ]; then \
> +		rm $(TARGET_DIR)/usr/sbin/in.tftpd; \
> +	fi;

Try to also use a make variable to list the programs that should be
removed. Maybe you should explicit a bit more why they are redundant.
Redundant between what and what?

Could you work on those issues and send an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
