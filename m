From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 May 2012 23:24:20 +0200
Subject: [Buildroot] [PATCH 1/2] Rework of the init system
In-Reply-To: <3516437e82a882bdc06039cc9dbb9cd7b67b14ad.1337947838.git.maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Fri, 25 May 2012 14:11:06 +0200")
References: <cover.1337947838.git.maxime.ripard@free-electrons.com>
 <cover.1337947838.git.maxime.ripard@free-electrons.com>
 <3516437e82a882bdc06039cc9dbb9cd7b67b14ad.1337947838.git.maxime.ripard@free-electrons.com>
Message-ID: <874nr18ghn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

Hi,

 Maxime> Since we have now two uncompatible init systems, and we want
 Maxime> only one of them at the same time in use in the rootfs, we need
 Maxime> to select a particular init system. This patch also adds
 Maxime> $(PKG)_INSTALL_INIT_SYSTEMD and $(PKG)_INSTALL_INIT_SYSV hooks
 Maxime> that are called when the matching init systems are selected to
 Maxime> install properly the init scripts of the package.

Looks good, just a small comment:

 Maxime> +++ b/target/generic/Config.in
 Maxime> @@ -37,6 +37,34 @@ comment "udev requires a toolchain with LARGEFILE + WCHAR support"
 
 Maxime>  endchoice
 
 Maxime> +choice
 Maxime> +	prompt "Init system"
 Maxime> +	default BR2_INIT_BUSYBOX
 Maxime> +	help
 Maxime> +	  To select systemd, you first need to have dbus and udev enabled

That comment seems wrong as you are selecting dbus and DYNAMIC_UDEV
which ends up selecting udev.

 Maxime> +
 Maxime> +config BR2_INIT_BUSYBOX
 Maxime> +	bool "Busybox init"
 Maxime> +	select BR2_PACKAGE_BUSYBOX
 Maxime> +
 Maxime> +config BR2_INIT_SYSV
 Maxime> +	bool "Use systemV init"
 Maxime> +	select BR2_PACKAGE_SYSVINIT
 Maxime> +
 Maxime> +config BR2_INIT_SYSTEMD
 Maxime> +	bool "Use systemd"

You added "Use " in front of sysv + systemd, but not busybox - And
"init" after busybox + sysv. I suggest you drop both so it becomes just
busybox/systemv/systemd.


 Maxime> +	depends on BR2_LARGEFILE
 Maxime> +	depends on BR2_USE_WCHAR
 Maxime> +	depends on BR2_INET_IPV6
 Maxime> +	select BR2_PACKAGE_DBUS

You don't really need to select UDEV as it gets selected by systemd.

 Maxime> +	select BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 Maxime> +	select BR2_PACKAGE_SYSTEMD
 Maxime> +
 Maxime> +comment 'systemd requires largefile, wchar and IPv6 support'
 Maxime> +	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && BR2_INET_IPV6)
 Maxime> +
 Maxime> +endchoice
 Maxime> +
 Maxime>  config BR2_ROOTFS_DEVICE_TABLE
 Maxime>  	string "Path to the permission tables"
 Maxime>  	default "target/generic/device_table.txt"
 Maxime> -- 
 Maxime> 1.7.9.5

-- 
Bye, Peter Korsgaard
