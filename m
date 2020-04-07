From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Apr 2020 10:04:59 +0200
Subject: [Buildroot] [PATCH 4/5] package/firewalld: new package
In-Reply-To: <20200330234616.1665466-4-aduskett@gmail.com>
References: <20200330234616.1665466-1-aduskett@gmail.com>
 <20200330234616.1665466-4-aduskett@gmail.com>
Message-ID: <20200407080459.GH22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-30 16:46 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Firewalld provides a dynamically managed firewall with support for network or
> firewall zones to define the trust level of network connections or interfaces.
> It has support for IPv4, IPv6 firewall settings and for ethernet bridges and
> a separation of runtime and permanent configuration options.
> 
> It also provides an interface for services or applications to add iptables and
> ebtables rules directly.

Again, repeating the package description in the commit log is not that
useful...

> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/firewalld/0001-Add-an-option-to-disable-building-documentation.patch b/package/firewalld/0001-Add-an-option-to-disable-building-documentation.patch
> new file mode 100644
> index 0000000000..150a74a4a5
> --- /dev/null
> +++ b/package/firewalld/0001-Add-an-option-to-disable-building-documentation.patch
> @@ -0,0 +1,90 @@
> +From 1627f1046515e93f7acb34fbfededecf9e1b16a7 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <Aduskett@gmail.com>
> +Date: Sun, 29 Mar 2020 16:28:06 -0700
> +Subject: [PATCH] improvement: build: add an option to disable building
> + documentation
> +
> +For embedded applications such as Buildroot or Yocto, the man pages may not be
> +desired or even capable of being built.
> +
> +On line 45 of configure.ac there is the line:
> +JH_CHECK_XML_CATALOG([http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl], [DocBook XSL Stylesheets])
> +
> +There are three issues with this:
> +  - It requires building the xml-catalog package.
> +  - It automatically defaults to the host systems xml-catalog
> +    instead of the cross environments.
> +  - It isn't necessary to have a functioning firewalld.
> +
> +Create a new option: --disable-docs. By default, build the documentation, but
> +if a user passes --disable-docs documentation will no longer be built as
> +desired.
> +
> +Upstream-Status: Merged
> +See: https://github.com/firewalld/firewalld/pull/596

The usual way we identify backoprted patches is not from their merge
request, but by stating how it wsa backported, like:

    Backported-from: 1627f1046515e93f7acb34fbfededecf9e1b16a7
oe:
    upstream commit: 1627f1046515e93f7acb34fbfededecf9e1b16a7

[--SNIP--]
> diff --git a/package/firewalld/Config.in b/package/firewalld/Config.in
> new file mode 100644
> index 0000000000..2b74655b1a
> --- /dev/null
> +++ b/package/firewalld/Config.in
> @@ -0,0 +1,42 @@
> +config BR2_PACKAGE_FIREWALLD
> +	bool "firewalld"
> +	depends on BR2_USE_MMU # ebtables, gobject-introspection
> +	depends on BR2_USE_WCHAR # dbus-python, gettext
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # nftables
> +	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS # gobject-introspection

Move that one up below MMU, as it is an arch-related dependency.

> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-python
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
> +	depends on BR2_PACKAGE_DBUS # dbus-python

You should select dbus (and thus inherit its dependencies).

> +	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
> +	select BR2_PACKAGE_DBUS_PYTHON
> +	select BR2_PACKAGE_EBTABLES
> +	select BR2_PACKAGE_GETTEXT
> +	select BR2_PACKAGE_GOBJECT_INTROSPECTION
> +	select BR2_PACKAGE_IPSET
> +	select BR2_PACKAGE_IPTABLES
> +	select BR2_PACKAGE_JANSSON # Runtime
> +	select BR2_PACKAGE_NFTABLES
> +	select BR2_PACKAGE_PYTHON_DECORATOR
> +	select BR2_PACKAGE_PYTHON_GOBJECT
> +	select BR2_PACKAGE_PYTHON_SIX
> +	select BR2_PACKAGE_PYTHON_SLIP_DBUS
> +	help
> +	  Firewalld provides a dynamically managed firewall with
> +	  support for network or firewall zones to define the trust
> +	  level of network connections or interfaces. It has support
> +	  for IPv4, IPv6 firewall settings and for ethernet bridges and
> +	  a separation of runtime and permanent configuration options.
> +	  It also provides an interface for services or applications to
> +	  add ip*tables and ebtables rules directly.
> +
> +	  https://github.com/firewalld/firewalld
> +
> +comment "firewalld needs python3"
> +	depends on !BR2_PACKAGE_PYTHON3
> +
> +comment "firewalld needs a glibc toolchain w/ wchar, threads, gcc >= 4.9"
> +	depends on BR2_USE_MMU || !BR2_USE_WCHAR
> +	depends on BR2_PACKAGE_DBUS && BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
> +		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

As for for python-slip-dbus, I don;t much like that we have two
comments. Can you see at making it a single one, please?

> diff --git a/package/firewalld/firewalld.hash b/package/firewalld/firewalld.hash
> new file mode 100644
> index 0000000000..ed4ac54a67
> --- /dev/null
> +++ b/package/firewalld/firewalld.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256 cfdf40890bca18892d1695bd902ede695cb2a61e1fcf809a2f8c394ca788a31e firewalld-v0.8.1.tar.gz
> +sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING

Two spaces between fields in hash file, please.

> diff --git a/package/firewalld/firewalld.init b/package/firewalld/firewalld.init
> new file mode 100644
> index 0000000000..72c9f7a31a
> --- /dev/null
> +++ b/package/firewalld/firewalld.init
> @@ -0,0 +1,52 @@
> +#!/bin/sh
> +
> +firewalld=/usr/sbin/firewalld
> +pidfile=/var/run/firewalld.pid
> +
> +start() {
> +  printf "Starting firewalld: "
> +  start-stop-daemon -S -q --exec $firewalld
> +  [ $? = 0 ] && echo "OK" || echo "FAIL"
> +}
> +stop() {
> +  printf "Stopping firewalld: "
> +  start-stop-daemon --stop --quiet --pidfile $pidfile
> +  [ $? = 0 ] && echo "OK" || echo "FAIL"
> +}
> +
> +reload(){
> +  printf "Reloading firewalld: "
> +  firewall-cmd --reload
> +  [ $? = 0 ] && echo "OK" || echo "FAIL"
> +}
> +
> +restart() {
> +  stop
> +  start
> +}
> +
> +status(){
> +  firewall-cmd --state
> +}
> +
> +
> +case "$1" in
> +    start)
> +      start
> +      ;;
> +    stop)
> +      stop
> +      ;;
> +    restart)
> +      restart
> +      ;;
> +    reload)
> +      reload
> +      ;;
> +    status)
> +      status
> +      ;;

    case "${1}" in
        start|stop|....)
            ${1}
            ;;
        *)
            echo "usage..."
            ;;
    esac

> +    *)
> +      echo "Usage: $0 {start|stop|restart|reload|status}"
> +      exit 1
> +esac
> diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
> new file mode 100644
> index 0000000000..e028a01c84
> --- /dev/null
> +++ b/package/firewalld/firewalld.mk
> @@ -0,0 +1,79 @@
> +################################################################################
> +#
> +# firewalld
> +#
> +################################################################################
> +
> +FIREWALLD_VERSION = v0.8.1
> +FIREWALLD_SITE = $(call github,firewalld,firewalld,$(FIREWALLD_VERSION))
> +FIREWALLD_LICENSE = GPL-2.0
> +FIREWALLD_LICENSE_FILES = COPYING
> +FIREWALLD_AUTORECONF = YES
> +FIREWALLD_DEPENDENCIES = \
> +	host-intltool \
> +	host-libglib2 \
> +	host-libxml2 \
> +	host-libxslt \
> +	dbus-python \
> +	dbus-python \
> +	ebtables \
> +	gettext \
> +	gobject-introspection \
> +	ipset \
> +	iptables \
> +	jansson \
> +	nftables \
> +	python3 \
> +	python-decorator \
> +	python-gobject \
> +	python-six \
> +	python-slip-dbus
> +
> +define FIREWALLD_RUN_AUTOGEN
> +	cd $(@D) && $(HOST_DIR)/bin/intltoolize --force
> +endef
> +FIREWALLD_PRE_CONFIGURE_HOOKS += FIREWALLD_RUN_AUTOGEN

This warrants a bit of explanations in the commit log.

> +# iptables, ip6tables, ebtables, and ipset *should* be unnecessary
> +# when the nftables backend is available, because nftables supersedes all of
> +# them. However we still need to build and install iptables and ip6tables
> +# because application relying on direct passthrough rules (IE docker) will
> +# break.
> +# /etc/sysconfig/firewalld is a Red Hat-ism, only referenced by
> +# the Red Hat-specific init script which isn't used.

Why do you need this blurb about /etc/sysconfig/firewalld? We don't have
anything about it below, so referring to it is confusing... Unless you
are referring to the option --disable-sysconfig?

> +FIREWALLD_CONF_OPTS += \
> +	--disable-rpmmacros \
> +	--disable-sysconfig \
> +	--with-ip6tables-restore=/usr/sbin/ip6tables-restore \
> +	--with-ip6tables=/usr/sbin/ip6tables \
> +	--with-iptables-restore=/usr/sbin/iptables-restore \
> +	--with-iptables=/usr/sbin/iptables \
> +	--with-nft=/usr/sbin/nft \
> +	--without-ebtables \
> +	--without-ebtables-restore \
> +	--without-ipset \
> +	--without-xml-catalog
> +
> +

Only one empty line.

Thanks!

Regards,
Yann E. MORIN.

> +# Firewalld hard codes the python shebangs to the full path of the
> +# python-interpreter. IE: #!/home/buildroot/output/host/bin/python.
> +# Force the proper python path.
> +FIREWALLD_CONF_ENV += PYTHON="/usr/bin/env python$(PYTHON3_VERSION_MAJOR)"
> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +FIREWALLD_CONF_OPTS += --with-systemd-unitdir=/usr/lib/systemd/system
> +else
> +FIREWALLD_CONF_OPTS += --disable-systemd
> +endif
> +
> +define FIREWALLD_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 0644 $(FIREWALLD_PKGDIR)/firewalld.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/firewalld.service
> +endef
> +
> +define FIREWALLD_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D $(FIREWALLD_PKGDIR)/firewalld.init \
> +		$(TARGET_DIR)/etc/init.d/S41firewalld
> +endef
> +
> +$(eval $(autotools-package))
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
