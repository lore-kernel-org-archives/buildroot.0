From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Jul 2021 19:04:11 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libteam: new package
In-Reply-To: <20210715083433.865943-2-troglobit@gmail.com>
References: <20210715083433.865943-1-troglobit@gmail.com>
 <20210715083433.865943-2-troglobit@gmail.com>
Message-ID: <20210717170411.GW12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Joachim, All,

On 2021-07-15 10:34 +0200, Joachim Wiberg spake thusly:
> This package is the userspace daemon, client tool, and library for the
> team device implementation in the Linux kernel.  Team is an alternative
> to the traditional bonding driver and provides more "runners", or modes,
> of operation for aggregates.
> 
> Team devices require the following kernel config, the most common modes
> have been included to be enabled when this package is selected:
> 
>     CONFIG_NET_TEAM=y

This also needs NETDEVICES and NET_CORE. Arguably, those two will most
probably be selected, but still...

>     CONFIG_NET_TEAM_MODE_ACTIVEBACKUP=y
>     CONFIG_NET_TEAM_MODE_LOADBALANCE=y

Is it really necessary to select those last two?

Load-balancing requires BPF, too, to load the BPF function that will do
the port selection.

But I would really just leave it up to the user to enable whatever mode
they need/want; just enforce CONFIG_NET_TEAM=y (and NETDEVICES and
NET_CORE, of course).

> Other possible, but not enabled, modes are:
> 
>     CONFIG_NET_TEAM_MODE_BROADCAST=y
>     CONFIG_NET_TEAM_MODE_ROUNDROBIN=y
>     CONFIG_NET_TEAM_MODE_RANDOM=y

Those do look like they are not really usefull in production, and are
rather for testing pruposes, indeed.

> Backported the three most relevant patches to fix musl build, revert of
> a fix prior to 1.31 that can cause high CPU load, and a fix to prevent
> failing to stop the daemon due to too short timeout for kill command.
> 
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/libteam/Config.in b/package/libteam/Config.in
> new file mode 100644
> index 0000000000..e44bdeeba8
> --- /dev/null
> +++ b/package/libteam/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_LIBTEAM
> +	bool "libteam"
> +	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_JANSSON
> +	select BR2_PACKAGE_LIBDAEMON
> +	select BR2_PACKAGE_LIBNL
> +	select BR2_PACKAGE_LIBNL_TOOLS

As noted by Yegor previopusly, you need to propagate the dependencies of
the packags you select;

    depends on BR2_TOOLCHAIN_HAS_THREADS  # libnl
    depends on !BR2_STATIC_LIBS  # libnl-tools
    select BR2_PACKAGE_LIBNL
    select BR2_PACKAGE_LIBNL_TOOLS

> +	help
> +	  The purpose of the Team driver is to provide a mechanism to
> +	  team multiple NICs (ports) into one logical one (teamdev) at
> +	  L2 layer. The process is called "channel bonding", "Ethernet
> +	  bonding", "channel teaming", "link aggregation", etc.
> +
> +	  Team tries to provide similar functionality as the bonding
> +	  driver, however architecturally it is quite different. Team is
> +	  modular, userspace driven, very lean and efficient, and it
> +	  does have some distinct advantages over bonding. The way Team
> +	  is configured differs dramatically from the way bonding is.
> +
> +	  https://github.com/jpirko/libteam
> +
> +comment "libnl tools needs a toolchain w/ dynamic library"

This is not libnl, but libteam (the comment is about this package).

> +	depends on BR2_STATIC_LIBS

The comment should also depend on MMU, so that it is not visible when
MMU is not enabled.

> +
> +comment "libnl needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

Ditto, this is libteam, and it should also depend on MMU.

> diff --git a/package/libteam/libteam.hash b/package/libteam/libteam.hash
> new file mode 100644
> index 0000000000..39d29425d3
> --- /dev/null
> +++ b/package/libteam/libteam.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  c69f7cf5a98203d66db10e67b396fe325b77a5a9491d1e07e8a07cba3ba841bb  libteam-1.31.tar.gz
> +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/libteam/libteam.mk b/package/libteam/libteam.mk
> new file mode 100644
> index 0000000000..2a66345192
> --- /dev/null
> +++ b/package/libteam/libteam.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# libteam
> +#
> +################################################################################
> +
> +LIBTEAM_VERSION = 1.31
> +LIBTEAM_SITE = $(call github,jpirko,libteam,v$(LIBTEAM_VERSION))
> +LIBTEAM_AUTORECONF = YES
> +LIBTEAM_LICENSE = LGPL-2.1+
> +LIBTEAM_LICENSE_FILES = COPYING
> +LIBTEAM_INSTALL_STAGING = YES
> +LIBTEAM_DEPENDENCIES = host-pkgconf jansson libdaemon libnl

Pet-peeve of mine, about the ordering:

    _VERSION = ...
    _SITE = ...

    _CPE_ID_xxx = ... (if any)
    _LICENSE = ...
    _LICENSE_FILES = ...

    _DEPENDENCIES = ...
    _AUTORECONF = YES
    _INSTALL_STAGING = YES

This is enforced nowhere, is decribed nowhere, but it follows quite a
logical ordering and grouping:

  - where to find it
  - what it is (cpe) and the conditions to use it (license)
  - what it needs
  - how to pre-configure it
  - where to instal it (staging., target...)

Regards,
Yann E. MORIN.

> +# The most common team modes, use a custom kernel config to enable more.
> +define LIBTEAM_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_TEAM)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_TEAM_MODE_ACTIVEBACKUP)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_TEAM_MODE_LOADBALANCE)
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
