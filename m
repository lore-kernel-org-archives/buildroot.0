From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 23:13:42 +0200
Subject: [Buildroot] [PATCH 4/5 v3] package/netifrc: new package
In-Reply-To: <cc81a0e258bc330147ac3d1664dcc823649491eb.1564920849.git.yann.morin.1998@free.fr>
References: <cover.1564920849.git.yann.morin.1998@free.fr>
 <cc81a0e258bc330147ac3d1664dcc823649491eb.1564920849.git.yann.morin.1998@free.fr>
Message-ID: <20190923231342.17874f4b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  4 Aug 2019 14:14:18 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> +NETIFRC_VERSION = 0.6.1
> +NETIFRC_SITE = $(call github,gentoo,netifrc,$(NETIFRC_VERSION))
> +NETIFRC_LICENSE = BSD-2-Clause
> +NETIFRC_LICENSE_FILES = LICENSE
> +
> +NETIFRC_DEPENDENCIES = openrc
> +
> +# set LIBNAME so netifrc puts files in proper directories and sets proper
> +# paths in installed files. Since in buildroot /lib64 and /lib32 always
> +# points to /lib, it's safe to hardcode it to "lib"
> +NETIFRC_MAKE_OPTS = \
> +	LIBNAME=lib \
> +	LIBEXECDIR=/usr/libexec/netifrc
> +
> +define NETIFRC_BUILD_CMDS
> +	$(MAKE) $(NETIFRC_MAKE_OPTS) -C $(@D)
> +endef
> +
> +ifeq ($(BR2_PACKAGE_HAS_UDEV),)
> +define NETIFRC_REMOVE_UDEV
> +	$(RM) $(TARGET_DIR)/lib/udev/net.sh
> +	$(RM) $(TARGET_DIR)/lib/udev/rules.d/90-network.rules
> +	rmdir --ignore-fail-on-non-empty  $(TARGET_DIR)/lib/udev/rules.d
> +	rmdir --ignore-fail-on-non-empty  $(TARGET_DIR)/lib/udev

This was failing, because netifrc installed its udev stuff
in /usr/lib/udev, because here it queried pkg-config (the host one) of
udevdir. So I've forced that to be /lib/udev by passing
UDEVDIR=/lib/udev in NETIFRC_MAKE_OPTS.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
