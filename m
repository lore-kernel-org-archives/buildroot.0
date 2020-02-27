From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 23:08:46 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/connman: bump to 1.38
In-Reply-To: <20200227201553.15820-1-petr.vorel@gmail.com>
References: <20200227201553.15820-1-petr.vorel@gmail.com>
Message-ID: <20200227230846.24426451@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Petr,

Thanks for this new version!

On Thu, 27 Feb 2020 21:15:53 +0100
Petr Vorel <petr.vorel@gmail.com> wrote:

> Add choice for either iptables or nftables as firewall types.
> Add option to enable/disable wireguard support.
> This release requires libmnl (if WireGuard enabled).
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

I think this really needs to be split into several commits: version
bump, iptables/nftables selection, wireguard support. Each logical
change should be in a separate commit.

> diff --git a/package/connman/Config.in b/package/connman/Config.in
> index 30eae23c96..5e4ac8bb7d 100644
> --- a/package/connman/Config.in
> +++ b/package/connman/Config.in
> @@ -8,7 +8,6 @@ config BR2_PACKAGE_CONNMAN
>  	depends on !BR2_TOOLCHAIN_USES_MUSL # missing res_ninit()
>  	select BR2_PACKAGE_DBUS
>  	select BR2_PACKAGE_LIBGLIB2
> -	select BR2_PACKAGE_IPTABLES
>  	help
>  	  The Connection Manager (ConnMan) project provides a daemon
>  	  for managing internet connections within embedded devices
> @@ -18,10 +17,39 @@ config BR2_PACKAGE_CONNMAN
>  
>  if BR2_PACKAGE_CONNMAN
>  
> +choice
> +	prompt "Firewall type"
> +	default BR2_PACKAGE_CONNMAN_IPTABLES
> +	help
> +	  Select which firewall type is used.
> +
> +config BR2_PACKAGE_CONNMAN_IPTABLES
> +	bool "iptables"
> +	select BR2_PACKAGE_IPTABLES
> +	help
> +	  Use iptables as firewall.
> +
> +config BR2_PACKAGE_CONNMAN_NFTABLES
> +	bool "nftables"
> +	select BR2_PACKAGE_NFTABLES

This needs:

        depends on BR2_USE_WCHAR
        depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12

> +	help
> +	  Use nftables as firewall.
> +endchoice
> +
>  config BR2_PACKAGE_CONNMAN_ETHERNET
>  	bool "enable Ethernet support"
>  	default y
>  
> +config BR2_PACKAGE_CONNMAN_WIREGUARD
> +	bool "enable WireGuard support"
> +	select BR2_PACKAGE_LIBMNL
> +	select BR2_PACKAGE_WIREGUARD_LINUX_COMPAT

I don't think you should select this. Indeed, this is only needed if
you use an "older" kernel which doesn't have upstream support for
Wireguard. With a very recent kernel (Linux 5.6+),
wireguard-linux-compat should not be used.

> +	select BR2_PACKAGE_WIREGUARD_TOOLS
> +	help
> +	  Enable WiFi support (scan and static/dhcp interface
> +	  setup). ConnMan detects the start of wpa_supplicant
> +	  automatically.

This help text seems weird to document wireguard support :-)

> -CONNMAN_VERSION = 1.37
> +CONNMAN_VERSION = 1.38
>  CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
>  CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
>  CONNMAN_DEPENDENCIES = libglib2 dbus iptables
> @@ -13,19 +13,25 @@ CONNMAN_LICENSE = GPL-2.0
>  CONNMAN_LICENSE_FILES = COPYING
>  CONNMAN_CONF_OPTS += \
>  	--with-dbusconfdir=/etc \
> +	$(if $(BR2_PACKAGE_CONNMAN_BLUETOOTH),--enable-bluetooth,--disable-bluetooth) \
>  	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug) \
>  	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet) \
> -	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi) \
> -	$(if $(BR2_PACKAGE_CONNMAN_WISPR),--enable-wispr,--disable-wispr) \
> -	$(if $(BR2_PACKAGE_CONNMAN_BLUETOOTH),--enable-bluetooth,--disable-bluetooth) \
> +	$(if $(BR2_PACKAGE_CONNMAN_IPTABLES),--with-firewall=iptables) \
>  	$(if $(BR2_PACKAGE_CONNMAN_LOOPBACK),--enable-loopback,--disable-loopback) \
>  	$(if $(BR2_PACKAGE_CONNMAN_NEARD),--enable-neard,--disable-neard) \
> +	$(if $(BR2_PACKAGE_CONNMAN_NFTABLES),--with-firewall=nftables) \
>  	$(if $(BR2_PACKAGE_CONNMAN_OFONO),--enable-ofono,--disable-ofono) \
> +	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi) \
> +	$(if $(BR2_PACKAGE_CONNMAN_WIREGUARD),--enable-wireguard,--disable-wireguard) \
> +	$(if $(BR2_PACKAGE_CONNMAN_WISPR),--enable-wispr,--disable-wispr) \
>  	$(if $(BR2_INIT_SYSTEMD),--with-systemdunitdir=/usr/lib/systemd/system)

You're doing some spurious changes here, like doing alphabetic
ordering. This is good, but do it in a separate patch.

Also I think this method of splitting CONF_OPTS and DEPENDENCIES is not
great, and is not the typical way we use in Buildroot.

We normally prefer:

ifeq ($(feature),y)
pkg_CONF_OPTS += --enable-feature
pkg_DEPENDENCIES += some-other-pkg
else
pkg_CONF_OPTS += --disable-feature
endif

Perhaps we should convert connman.mk to that logic as a preparation
patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
