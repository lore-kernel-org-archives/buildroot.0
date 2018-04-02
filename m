From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 16:42:33 +0200
Subject: [Buildroot] [PATCH 2/3] netcf: new package
In-Reply-To: <20171127104131.27975-3-casantos@datacom.ind.br>
References: <20171127104131.27975-1-casantos@datacom.ind.br>
 <20171127104131.27975-3-casantos@datacom.ind.br>
Message-ID: <20180402164233.76d04a17@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

On Mon, 27 Nov 2017 08:41:30 -0200, Carlos Santos wrote:
> diff --git a/package/netcf/0001-fix-misplaced-empty.patch b/package/netcf/0001-fix-misplaced-empty.patch
> new file mode 100644
> index 0000000000..74a3a63d7a
> --- /dev/null
> +++ b/package/netcf/0001-fix-misplaced-empty.patch
> @@ -0,0 +1,36 @@
> +From 8e00e9c0ba6b66035defc94470ac863f04eba4b5 Mon Sep 17 00:00:00 2001
> +From: Laine Stump <laine@laine.org>
> +Date: Thu, 21 May 2015 11:40:53 -0400
> +Subject: [PATCH 1/9] fix misplaced <empty/>

Could you generate the patches with "git format-patch -N", to avoid the
numbering inside the patches ?

> +When transcribing the link-speed-state bits from libvirt's
> +interface.rng to netcf's, I accidentally added an "<empty/>" in the
> +wrong place. It should have gone inside the definition of the <link>
> +element, rather than just after <link> in the <interface> element.

All the patches that are not authored by you lack your Signed-off-by.

This patches come from upstream, this should be mentioned in the
patches themselves, possibly with a link, such as:

https://pagure.io/netcf/c/8e00e9c0ba6b66035defc94470ac863f04eba4b5?branch=master

> diff --git a/package/netcf/0006-netcf-transaction.sh-remove-bash-isms.patch b/package/netcf/0006-netcf-transaction.sh-remove-bash-isms.patch
> new file mode 100644
> index 0000000000..c25cc779af
> --- /dev/null
> +++ b/package/netcf/0006-netcf-transaction.sh-remove-bash-isms.patch
> @@ -0,0 +1,50 @@
> +From 91cdbd05a82be014f43d549ddcf5a67471a5f029 Mon Sep 17 00:00:00 2001
> +From: Carlos Santos <casantos@datacom.ind.br>
> +Date: Sun, 8 Oct 2017 09:36:42 -0300
> +Subject: [PATCH 6/9] netcf-transaction.sh: remove bash-isms
> +
> +echo $"..." -> echo "..."
> +echo -n $"...$a $b" -> printf "... %s %s" "$a" "$b"
> +
> +Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

All the init script machinery is not very Buildroot-looking. Should we
use their init script, or have our own ?


> diff --git a/package/netcf/0008-configure.ac-fix-AM_INIT_AUTOMAKE-call.patch b/package/netcf/0008-configure.ac-fix-AM_INIT_AUTOMAKE-call.patch
> new file mode 100644
> index 0000000000..4331d84b55
> --- /dev/null
> +++ b/package/netcf/0008-configure.ac-fix-AM_INIT_AUTOMAKE-call.patch
> @@ -0,0 +1,29 @@
> +From 6daa25084b553351255e8f3e6b252a446e5f88fc Mon Sep 17 00:00:00 2001
> +From: Carlos Santos <casantos@datacom.ind.br>
> +Date: Sun, 8 Oct 2017 13:16:41 -0300
> +Subject: [PATCH 8/9] configure.ac: fix AM_INIT_AUTOMAKE call

Patches 8 and 9 definitely make sense for upstream, could you submit
them ?

> diff --git a/package/netcf/Config.in b/package/netcf/Config.in
> new file mode 100644
> index 0000000000..d38c2dcef0
> --- /dev/null
> +++ b/package/netcf/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_NETCF
> +	bool "netcf"
> +	depends on !BR2_arc # augeas
> +	depends on !BR2_STATIC_LIBS # libnl
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_USE_WCHAR # augeas
> +	select BR2_PACKAGE_AUGEAS
> +	select BR2_PACKAGE_LIBNL
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_LIBXSLT
> +	select BR2_PACKAGE_READLINE
> +	help
> +	  netcf is a cross-platform network configuration library.
> +
> +	  It takes the description of a network interface in its own
> +	  platform-independent format and adapts the local system's
> +	  network configuration to provide that interface.
> +
> +	  Both the ncftool utility and libnetcf are installed.
> +
> +comment "netcf needs a toolchain w/ wchar"
> +	depends on !BR2_arc
> +	depends on !BR2_USE_WCHAR

This Config.in comment is not complete.

> diff --git a/package/netcf/S30netcf-transaction b/package/netcf/S30netcf-transaction
> new file mode 100644
> index 0000000000..ad67123916
> --- /dev/null
> +++ b/package/netcf/S30netcf-transaction
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +#
> +# This script can save the current state of network config, and later
> +# revert to that config, or commit the new config (by deleting the
> +# snapshot). At boot time, if there are uncommitted changes to the
> +# network config, they are reverted (and the discarded changes are
> +# archived in /var/lib/netcf/network-rollback-*).
> +
> +exec /usr/libexec/netcf-transaction.sh "$@"

This init script is not installed anywhere.

> diff --git a/package/netcf/netcf.hash b/package/netcf/netcf.hash
> new file mode 100644
> index 0000000000..2ba2a5c204
> --- /dev/null
> +++ b/package/netcf/netcf.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256 fd81d607795547807150dfdb82bd164ab2569369ab48a30cb6b0d010d17b127c  netcf_0.2.8.orig.tar.gz
> diff --git a/package/netcf/netcf.mk b/package/netcf/netcf.mk
> new file mode 100644
> index 0000000000..bd2bc8715d
> --- /dev/null
> +++ b/package/netcf/netcf.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# netcf
> +#
> +################################################################################
> +
> +NETCF_VERSION = 0.2.8
> +NETCF_SITE = http://snapshot.debian.org/archive/debian/20171007T103908Z/pool/main/n/netcf
> +NETCF_SOURCE = netcf_$(NETCF_VERSION).orig.tar.gz

Why don't you fetch from the upstream Git repository ? Possibly you
could fetch the appropriate Git commit, avoiding the need to have a
number of patches in Buildroot itself ? Of course, a comment on top of
the VERSION variable would explain why we pick a seemingly random
version.

> +NETCF_INSTALL_STAGING = YES
> +NETCF_LICENSE = LGPL-2.1+
> +NETCF_LICENSE_FILES = COPYING
> +NETCF_DEPENDENCIES = augeas libnl libxml2 libxslt readline
> +NETCF_INSTALL_STAGING = YES
> +
> +# 0007-Install-init-script-as-etc-init.d-S30netcf-transacti.patch

This is not the only patch that requires autoreconf

> +NETCF_AUTORECONF = YES
> +
> +NETCF_CONF_OPTS = \
> +	--with-sysinit=$(if $(BR2_INIT_SYSTEMD),systemd,$(if $(BR2_INIT_NONE),none,initscripts))

This is a bit hard to read.

ifeq ($(BR2_INIT_SYSTEMD),y)
NETCF_CONF_OPTS += --with-sysinit=systemd
else ifeq ($(BR2_INIT_BUSYBOX)$(BR2_INIT_SYSV),y)
NETCF_CONF_OPTS += --with-sysinit=sysv
else
NETCF_CONF_OPTS += --with-sysinit=none
endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
